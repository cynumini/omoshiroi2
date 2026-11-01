from dataclasses import dataclass
from typing import override

from PySide6.QtCore import QThread, Signal
from PySide6.QtGui import (
    QAction,
    QCloseEvent,
    QImage,
    QKeySequence,
    QPixmap,
    QResizeEvent,
    Qt,
)
from PySide6.QtWidgets import (
    QApplication,
    QHBoxLayout,
    QLabel,
    QProgressBar,
    QPushButton,
    QSizePolicy,
    QSplitter,
    QVBoxLayout,
    QWidget,
)

from hydrus_elo.config import Config
from hydrus_elo.elo import (
    Action,
    Elo,
    Match,
    Player,
    PromosStrategy,
    Promotion,
    Rank,
    RanksStrategy,
    Strategy,
    UserInput,
)
from hydrus_elo.file import File
from hydrus_elo.hydrus import Hydrus


@dataclass
class Round:
    league: str
    strategy: Strategy


class ImageThread(QThread):
    image_loaded: Signal = Signal()

    def __init__(
        self,
        files: list[File],
        max_size: tuple[int, int],
        hydrus: Hydrus,
    ):
        super().__init__()
        self.files: list[File] = files
        self.max_size: tuple[int, int] = max_size
        self.hydrus: Hydrus = hydrus

    @override
    def run(self):
        for file in self.files:
            if self.isInterruptionRequested():
                break
            file.load_image(self.max_size, self.hydrus)
            self.image_loaded.emit()


class ImageWidget(QLabel):
    def __init__(self):
        super().__init__()
        self.original_pixmap: QPixmap | QImage = QPixmap()
        self.setAlignment(Qt.AlignmentFlag.AlignCenter)

        self.LABEL_PADDING: int = 4
        self.info_label: QLabel = QLabel(self)
        self.info_label.move(self.LABEL_PADDING, self.LABEL_PADDING)
        self.info_label.raise_()

        self.info_label.setStyleSheet("""
            QLabel {
                color: white;
                background-color: rgba(0, 0, 0, 127);
                font-size: 16px;
            }
        """)

    @override
    def setPixmap(self, pixmap: QPixmap | QImage):
        self.original_pixmap = pixmap
        self.update_image()

    def set_file(self, file: File):
        self.original_pixmap = file.image or QPixmap()
        self.info_label.setText(f"Elo: {file.elo}, Rank: {file.rank.name}")
        self.info_label.adjustSize()
        self.info_label.raise_()
        self.update_image()

    @override
    def resizeEvent(self, event: QResizeEvent):
        super().resizeEvent(event)
        self.update_image()
        self.info_label.move(self.LABEL_PADDING, self.LABEL_PADDING)
        self.info_label.raise_()

    def update_image(self):
        if self.original_pixmap.isNull():
            return

        super().setPixmap(
            self.original_pixmap.scaled(
                self.size(),
                Qt.AspectRatioMode.KeepAspectRatio,
                Qt.TransformationMode.SmoothTransformation,
            )
        )

    def reset_image(self):
        self.original_pixmap = QPixmap()
        super().setPixmap(QPixmap())
        self.info_label.setText("No image")
        self.info_label.adjustSize()
        self.info_label.raise_()


class Play(QWidget):
    def __init__(self, config: Config, hydrus: Hydrus):
        super().__init__()
        self.config: Config = config
        self.hydrus: Hydrus = hydrus
        self.image_thread: ImageThread | None = None
        self.elo: Elo | None = None
        self.action: Action | None = None
        self.need_print: bool = True
        self.resources: list[File] = []
        self.p1: File | None = None
        self.p2: File | None = None

        win_action = QAction("&win", self)
        lose_action = QAction("&lose", self)
        draw_action = QAction("&draw", self)
        undo_action = QAction("&undo", self)
        quit_action = QAction("&quit", self)
        for action in (win_action, lose_action, draw_action, undo_action, quit_action):
            self.addAction(action)

        win_action.setShortcut(QKeySequence("H"))
        lose_action.setShortcut(QKeySequence("L"))
        draw_action.setShortcut(QKeySequence("J"))
        undo_action.setShortcut(QKeySequence("U"))
        quit_action.setShortcut(QKeySequence("Q"))

        _ = win_action.triggered.connect(lambda: self.act(UserInput.WIN))
        _ = lose_action.triggered.connect(lambda: self.act(UserInput.LOSE))
        _ = draw_action.triggered.connect(lambda: self.act(UserInput.DRAW))
        _ = undo_action.triggered.connect(lambda: self.act(UserInput.UNDO))
        _ = quit_action.triggered.connect(lambda: self.act(UserInput.QUIT))

        self.win_button: QPushButton = QPushButton("left win (h)")
        self.draw_button: QPushButton = QPushButton("draw (j)")
        self.lose_button: QPushButton = QPushButton("right win (l)")
        self.undo_button: QPushButton = QPushButton("undo (u)")
        self.next_round_button: QPushButton = QPushButton("next round (q)")

        _ = self.win_button.clicked.connect(win_action.trigger)
        _ = self.lose_button.clicked.connect(lose_action.trigger)
        _ = self.draw_button.clicked.connect(draw_action.trigger)
        _ = self.undo_button.clicked.connect(undo_action.trigger)
        _ = self.next_round_button.clicked.connect(quit_action.trigger)

        layout: QVBoxLayout = QVBoxLayout(self)
        bottom_layout: QHBoxLayout = QHBoxLayout()
        self.splitter: QSplitter = QSplitter(Qt.Orientation.Horizontal)

        self.left_image: ImageWidget = ImageWidget()
        self.right_image: ImageWidget = ImageWidget()

        for image_label in (self.left_image, self.right_image):
            self.splitter.addWidget(image_label)
            image_label.setMinimumSize(1, 1)
            image_label.setSizePolicy(
                QSizePolicy.Policy.Ignored, QSizePolicy.Policy.Ignored
            )

        self.round_bar: QProgressBar = QProgressBar()
        self.current_round_bar: QProgressBar = QProgressBar()
        layout.addWidget(self.splitter)
        layout.addLayout(bottom_layout)
        bottom_layout.addWidget(self.win_button)
        bottom_layout.addWidget(self.draw_button)
        bottom_layout.addWidget(self.lose_button)
        bottom_layout.addWidget(self.undo_button)
        bottom_layout.addWidget(self.next_round_button)
        bottom_layout.addWidget(self.round_bar)
        bottom_layout.addWidget(self.current_round_bar)

        self.rounds: list[Round] = []
        self.round: Round | None
        self.rank: Rank | None = None
        self.first: bool = True

    def start_round(self):
        if self.first:
            self.round_bar.setRange(0, len(self.rounds))
            self.round_bar.setValue(0)
            self.first = False
        self.resources.clear()
        self.left_image.setText("left")
        self.right_image.setText("right")

        self.round = self.rounds.pop(0)
        self.setWindowTitle(self.round.league)

        files = self.get_files(self.round.strategy)

        players = [Player(file.id, file.elo, file.rank) for file in files]

        self.elo = Elo(players, self.round.strategy)

        self.elo.generate()

        self.current_round_bar.setRange(
            0, len([a for a in self.elo.actions if isinstance(a, Match)])
        )

        self.elo.print_queue()

        chosen_ids = self.elo.get_chosen_ids(False)

        for id in chosen_ids:
            resource = self.get_resource(files, id)
            assert resource
            self.resources.append(resource)

        size = QApplication.primaryScreen().size()
        max_width = size.width()
        max_height = size.height()

        self.image_thread = ImageThread(
            self.resources, (max_width, max_height), self.hydrus
        )
        _ = self.image_thread.image_loaded.connect(self.update_image)
        self.image_thread.start()

        self.advance()

    def update_image(self):
        if self.p1 and self.p1.image:
            self.left_image.set_file(self.p1)
        if self.p2 and self.p2.image:
            self.right_image.set_file(self.p2)
        if self.p1 and self.p1.image and self.p2 and self.p2.image:
            total = (
                self.p1.size[0] / self.p1.size[1] + self.p2.size[0] / self.p2.size[1]
            )
            width = self.splitter.width()
            self.splitter.setSizes(
                [
                    round(width * (self.p1.size[0] / self.p1.size[1]) / total),
                    round(width * (self.p2.size[0] / self.p2.size[1]) / total),
                ]
            )

    def act(self, user_input: UserInput) -> None:
        assert self.elo
        assert self.action
        result = self.elo.act(user_input, self.action)
        if result:
            print(f"{result[0]} - {result[1]}")
        self.advance()

    def advance(self):
        assert self.elo
        p = len(
            [a for a in self.elo.actions[: self.elo.position] if isinstance(a, Match)]
        )
        self.current_round_bar.setValue(p)
        if isinstance(self.action, Match):
            self.need_print = True

        self.action = self.elo.next()

        while self.action != None:
            match self.action:
                case Match():
                    self.p1 = self.get_resource(
                        self.resources, self.elo.get_id(self.action.player1)
                    )
                    assert self.p1
                    self.p1.elo = self.elo.get_elo(self.action.player1)
                    self.p2 = self.get_resource(
                        self.resources, self.elo.get_id(self.action.player2)
                    )
                    assert self.p2
                    self.p2.elo = self.elo.get_elo(self.action.player2)
                    if self.need_print:
                        print(
                            f"{(self.elo.get_id(self.action.player1))} "
                            + f"({(self.elo.get_elo(self.action.player1))}) "
                            + f"vs {(self.elo.get_id(self.action.player2))} "
                            + f"({(self.elo.get_elo(self.action.player2))})"
                        )
                        self.need_print = False
                    break
                case Rank():
                    print(self.action.name)
                    self.rank = self.action
                    self.action = self.elo.next()
                case Promotion():
                    print(
                        f"{self.elo.get_id(self.action.player)} from {self.action.from_rank} to "
                        + f"{self.action.to_rank}"
                    )
                    self.action = self.elo.next()
        else:
            for id, data in self.elo.result.items():
                self.hydrus.set_elo(id, data.elo)
                assert self.round
                self.hydrus.set_league(id, self.round.league, data.rank)
            if self.rounds:
                self.round_bar.setValue(self.round_bar.value() + 1)
                self.start_round()
            else:
                _ = self.close()
            return

        assert self.round
        if self.round.strategy and self.rank is not None:
            self.current_round_bar.setFormat(f"{self.rank.name} - %v / %m")
            match self.round.strategy:
                case RanksStrategy():
                    self.round_bar.setFormat(
                        f"Ranks({self.round.strategy.count}) %v / %m"
                    )
                case PromosStrategy():
                    self.round_bar.setFormat("Promos %v / %m")

        self.update_image()

    def get_resource(self, files: list[File], id: int) -> File | None:
        for item in files:
            if item.id == id:
                return item
        return None

    def find_best_elo(self, max_ids: int, tags: list[str]) -> int:
        best_elo = 0
        elo = 0

        ids = self.hydrus.search_files(tags)

        while len(ids) >= max_ids:
            best_elo = elo
            if len(ids) == max_ids:
                return best_elo
            elo += 100
            tmp_tags = tags.copy()
            elo_tag = f"system:count for elo more than {elo}"
            tmp_tags.append(elo_tag)
            ids = self.hydrus.search_files(tmp_tags)
            print(f"With elo = {elo}, count = {len(ids)}")

        return best_elo

    def get_files(self, strategy: Strategy):
        ids: list[int] = []

        ranked_ids_len: int = 0

        # ranked - start
        assert self.round
        tag = f"system:has rating for league.{self.round.league}"
        ranked_ids = self.hydrus.search_files([tag])
        ranked_ids_len = len(ranked_ids)
        ids.extend(ranked_ids)
        print(f"Ranked files = {ranked_ids_len}")
        # ranked - end

        tags = self.config.get(self.round.league)
        no_rating_tag = f"system:no rating for league.{self.round.league}"
        tags.append(no_rating_tag)

        match strategy:
            case RanksStrategy():
                tags.append("system:limit is 1024")
                ids.extend(self.hydrus.search_files(tags))
            case PromosStrategy():
                wood_rank_ids = self.hydrus.search_files(
                    [tag, f"system:rating for league.{self.round.league} is 1/6"]
                )
                elo = self.find_best_elo(
                    max(Rank.WOOD.max() - len(wood_rank_ids) + 1, 0), tags
                )
                elo_tag = f"system:count for elo more than {elo}"
                tags.append(elo_tag)
                unranked_ids = self.hydrus.search_files(tags)
                ids.extend(unranked_ids)

        print(f"Unranked files = {len(ids) - ranked_ids_len}")

        return self.hydrus.get_files(ids, self.round.league)

    def play(self, league_name: str, strategy: Strategy):
        self.rounds.append(Round(league_name, strategy))

    @override
    def closeEvent(self, event: QCloseEvent):
        if self.image_thread:
            self.image_thread.requestInterruption()
            _ = self.image_thread.wait()
        event.accept()

import logging
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
    QLabel,
    QMainWindow,
    QSizePolicy,
    QSplitter,
    QWidget,
)

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
from hydrus_elo.league import League


class ImageThread(QThread):
    image_loaded: Signal = Signal()

    def __init__(
        self,
        files: list[File],
        max_size: tuple[int, int],
        hydrus: Hydrus,
        logger: logging.Logger,
    ):
        super().__init__()
        self.files: list[File] = files
        self.max_size: tuple[int, int] = max_size
        self.running: bool = True
        self.logger: logging.Logger = logger
        self.hydrus: Hydrus = hydrus

    def stop(self):
        self.running = False

    @override
    def run(self):
        for file in self.files:
            if self.running == False:
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


class Play(QMainWindow):
    def __init__(self, league: League, hydrus: Hydrus, logger: logging.Logger):
        super().__init__()
        self.league: League = league
        self.league_name: str | None = None
        self.hydrus: Hydrus = hydrus
        self.logger: logging.Logger = logger
        self.running: bool = True
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

        win_action.setShortcut(QKeySequence("H"))
        lose_action.setShortcut(QKeySequence("L"))
        draw_action.setShortcut(QKeySequence("J"))
        undo_action.setShortcut(QKeySequence("U"))

        _ = win_action.triggered.connect(lambda: self.act(UserInput.WIN))
        _ = lose_action.triggered.connect(lambda: self.act(UserInput.LOSE))
        _ = draw_action.triggered.connect(lambda: self.act(UserInput.DRAW))
        _ = undo_action.triggered.connect(lambda: self.act(UserInput.UNDO))
        _ = quit_action.triggered.connect(lambda: self.act(UserInput.QUIT))

        self.menuBar().addAction(win_action)
        self.menuBar().addAction(lose_action)
        self.menuBar().addAction(draw_action)
        self.menuBar().addAction(undo_action)
        self.menuBar().addAction(quit_action)

        central = QWidget(self)
        self.splitter: QSplitter = QSplitter(Qt.Orientation.Horizontal, central)

        self.left_image: ImageWidget = ImageWidget()
        self.right_image: ImageWidget = ImageWidget()

        for image_label in (self.left_image, self.right_image):
            self.splitter.addWidget(image_label)
            image_label.setMinimumSize(1, 1)
            image_label.setSizePolicy(
                QSizePolicy.Policy.Ignored,
                QSizePolicy.Policy.Ignored,
            )

        self.setCentralWidget(self.splitter)

        self.rounds: list[Strategy] = []

    def start_round(self):
        self.resources.clear()
        self.left_image.setText("left")
        self.right_image.setText("right")

        strategy = self.rounds.pop(0)

        files = self.get_files(strategy)

        players = [Player(file.id, file.elo, file.rank) for file in files]

        self.elo = Elo(players, strategy)

        self.elo.generate()

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
            self.resources, (max_width, max_height), self.hydrus, self.logger
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
            self.logger.info(f"{result[0]} - {result[1]}")
        self.advance()

    def advance(self):
        assert self.elo
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
                        self.logger.info(
                            "%d (%d) vs %d (%d)",
                            self.elo.get_id(self.action.player1),
                            self.elo.get_elo(self.action.player1),
                            self.elo.get_id(self.action.player2),
                            self.elo.get_elo(self.action.player2),
                        )
                        self.need_print = False
                    break
                case Rank():
                    self.logger.info(self.action.name)
                    self.action = self.elo.next()
                case Promotion():
                    self.logger.info(
                        f"{self.elo.get_id(self.action.player)} from {self.action.from_rank} to "
                        + f"{self.action.to_rank}"
                    )
                    self.action = self.elo.next()
        else:
            for id, data in self.elo.result.items():
                self.hydrus.set_elo(id, data.elo)
                assert self.league_name
                self.hydrus.set_league(id, self.league_name, data.rank)
            if self.rounds:
                self.start_round()
            else:
                _ = self.close()
            return
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
            self.logger.info("With elo = %d, count = %d", elo, len(ids))

        return best_elo

    def get_files(self, strategy: Strategy):
        ids: list[int] = []

        ranked_ids_len: int = 0

        # ranked - start
        tag = f"system:has rating for league.{self.league_name}"
        ranked_ids = self.hydrus.search_files([tag])
        ranked_ids_len = len(ranked_ids)
        ids.extend(ranked_ids)
        self.logger.info("Ranked files = %d", ranked_ids_len)
        # ranked - end

        assert self.league_name
        tags = self.league.get(self.league_name)
        no_rating_tag = f"system:no rating for league.{self.league_name}"
        tags.append(no_rating_tag)

        match strategy:
            case RanksStrategy():
                tags.append("system:limit is 1024")
                ids.extend(self.hydrus.search_files(tags))
            case PromosStrategy():
                wood_rank_ids = self.hydrus.search_files(
                    [tag, f"system:rating for league.{self.league_name} is 1/6"]
                )
                elo = self.find_best_elo(
                    max(Rank.WOOD.max() - len(wood_rank_ids) + 1, 0), tags
                )
                elo_tag = f"system:count for elo more than {elo}"
                tags.append(elo_tag)
                unranked_ids = self.hydrus.search_files(tags)
                ids.extend(unranked_ids)

        self.logger.info("Unranked files = %d", len(ids) - ranked_ids_len)

        return self.hydrus.get_files(ids, self.league_name)

    def play(self, league_name: str, strategy: Strategy):
        self.rounds.append(strategy)
        self.league_name = league_name

    @override
    def closeEvent(self, event: QCloseEvent):
        if self.image_thread:
            self.image_thread.stop()
            _ = self.image_thread.wait()
        event.accept()

import logging
import os
import sys
from pathlib import Path
from typing import cast

from PySide6.QtGui import QAction
from PySide6.QtWidgets import (
    QApplication,
    QComboBox,
    QDialog,
    QDialogButtonBox,
    QFormLayout,
    QMainWindow,
    QSpinBox,
)

from omoshiroi2 import omoshiroi
from omoshiroi2.config import Config
from omoshiroi2.elo import PromosStrategy, RanksStrategy
from omoshiroi2.hydrus import Hydrus
from omoshiroi2.omoshiroi import Omoshiroi
from omoshiroi2.play import Play

logger = logging.getLogger("omoshiroi2")
logging.basicConfig(level=logging.INFO)

GAMES_PER_RANK = 5


class SettingPage(QDialog):
    def __init__(self, config: Config, games_per_rank: bool = True):
        super().__init__()

        self.setWindowTitle("Settings")

        self.league: QComboBox = QComboBox()
        self.league.addItems(list(config.leagues))

        buttons = QDialogButtonBox(
            QDialogButtonBox.StandardButton.Ok | QDialogButtonBox.StandardButton.Cancel
        )

        _ = buttons.accepted.connect(self.accept)
        _ = buttons.rejected.connect(self.reject)

        layout = QFormLayout(self)
        layout.addRow("League", self.league)
        if games_per_rank:
            self.games_per_rank: QSpinBox = QSpinBox(minimum=1, value=GAMES_PER_RANK)
            layout.addRow("Games per rank", self.games_per_rank)
        layout.addRow(buttons)


class RoutinesPage(QDialog):
    def __init__(self, config: Config):
        super().__init__()

        self.setWindowTitle("Routines")

        self.routines: QComboBox = QComboBox()
        self.routines.addItems(list(config.routines))

        buttons = QDialogButtonBox(
            QDialogButtonBox.StandardButton.Ok | QDialogButtonBox.StandardButton.Cancel
        )

        _ = buttons.accepted.connect(self.accept)
        _ = buttons.rejected.connect(self.reject)

        layout = QFormLayout(self)
        layout.addRow("Routines", self.routines)

        layout.addRow(buttons)


class MainWindow(QMainWindow):
    def __init__(self):
        super().__init__()
        self.config: Config = Config(Path("hydrus-elo.json"))
        access_key = os.getenv("HYDRUS_CLIENT_API")
        assert isinstance(access_key, str)
        self.hydrus: Hydrus = Hydrus(access_key)

        self.omoshiroi: Omoshiroi = Omoshiroi()

        self.setWindowTitle("omoshiroi2")
        self.resize(800, 600)

        # hydrus-elo
        hydrus_elo_menu = self.menuBar().addMenu("&hydrus-elo")

        promos_action = QAction("&promos", self)
        ranks_action = QAction("&ranks", self)
        season_action = QAction("&season", self)
        routines_action = QAction("r&outines", self)

        _ = promos_action.triggered.connect(self.promos)
        _ = ranks_action.triggered.connect(self.ranks)
        _ = season_action.triggered.connect(self.season)
        _ = routines_action.triggered.connect(self.routines)

        hydrus_elo_menu.addAction(promos_action)
        hydrus_elo_menu.addAction(ranks_action)
        hydrus_elo_menu.addAction(season_action)
        hydrus_elo_menu.addAction(routines_action)

        # omoshiroi
        self.omoshiroi.setup_menu(self.menuBar().addMenu("&omoshiroi"))

    def cleanup(self):
        self.omoshiroi.cleanup()

    def promos(self):
        dialog = SettingPage(self.config, False)
        if dialog.exec() == QDialog.DialogCode.Accepted:
            league = dialog.league.currentText()
            play: Play = Play(self.config, self.hydrus)
            play.showMaximized()
            play.play(league, PromosStrategy())
            play.start_round()

    def ranks(self):
        dialog = SettingPage(self.config)
        if dialog.exec() == QDialog.DialogCode.Accepted:
            league = dialog.league.currentText()
            games_per_rank = dialog.games_per_rank.value()
            play: Play = Play(self.config, self.hydrus)
            play.showMaximized()
            play.play(league, RanksStrategy(games_per_rank))
            play.start_round()

    def season(self):
        dialog = SettingPage(self.config)
        if dialog.exec() == QDialog.DialogCode.Accepted:
            league = dialog.league.currentText()
            games_per_rank = dialog.games_per_rank.value()
            play: Play = Play(self.config, self.hydrus)
            play.showMaximized()
            play.play(league, RanksStrategy(games_per_rank))
            play.play(league, PromosStrategy())
            play.start_round()

    def routines(self):
        dialog = RoutinesPage(self.config)
        if dialog.exec() == QDialog.DialogCode.Accepted:
            routines = dialog.routines.currentText()
            play: Play = Play(self.config, self.hydrus)
            play.showMaximized()
            for r in self.config.routines[routines]:
                league, strategy = r.get("league"), r.get("strategy")
                games_per_rank = cast(int, r.get("games_per_rank", GAMES_PER_RANK))
                assert league and strategy
                assert isinstance(league, str) and isinstance(strategy, str)
                match strategy:
                    case "season":
                        play.play(league, RanksStrategy(games_per_rank))
                        play.play(league, PromosStrategy())
                    case "ranks":
                        play.play(league, RanksStrategy(games_per_rank))
                    case "promos":
                        play.play(league, PromosStrategy())
                    case _:
                        raise RuntimeError(f"{strategy} is not implemented")
            play.start_round()


def main() -> None:

    app = QApplication([])

    main_window = MainWindow()
    main_window.show()
    try:
        sys.exit(app.exec())
    finally:
        main_window.cleanup()


if __name__ == "__main__":
    main()

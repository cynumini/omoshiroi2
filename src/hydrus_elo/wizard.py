from enum import IntEnum, StrEnum, auto
from typing import cast, override

from PySide6.QtWidgets import (
    QComboBox,
    QSpinBox,
    QVBoxLayout,
    QWizard,
    QWizardPage,
)

from hydrus_elo.league import League


class Command(StrEnum):
    SEASON = "Season"
    PROMOS = "Promos"
    RANKS = "Ranks"


class Page(IntEnum):
    COMMAND = auto()
    SETTING = auto()


class CommandPage(QWizardPage):
    def __init__(self):
        super().__init__()
        self.setTitle("Choose a command")

        layout = QVBoxLayout(self)

        self.command: QComboBox = QComboBox()
        self.command.addItems([m.value for m in Command])

        layout.addWidget(self.command)

        self.registerField("command", self.command, "currentText")

    @override
    def nextId(self) -> int:
        command = Command(cast(str, self.field("command")))
        assert command

        match command:
            case Command.RANKS:
                return Page.SETTING.value
            case Command.SEASON:
                return Page.SETTING.value
            case Command.PROMOS:
                return Page.SETTING.value


class SettingPage(QWizardPage):
    def __init__(self, league: League):
        super().__init__()

        layout = QVBoxLayout(self)

        self.league: QComboBox = QComboBox()
        self.league.addItems(list(league.data.keys()))

        self.games_per_rank: QSpinBox = QSpinBox(minimum=1, value=5)

        layout.addWidget(self.league)
        layout.addWidget(self.games_per_rank)

        self.registerField("league", self.league, "currentText")
        self.registerField("games_per_rank", self.games_per_rank)

    @override
    def initializePage(self):
        command = Command(cast(str, self.field("command")))
        assert command

        match command:
            case Command.RANKS:
                self.setTitle("Ranks")
                self.games_per_rank.show()
            case Command.SEASON:
                self.setTitle("Season")
                self.games_per_rank.show()
            case Command.PROMOS:
                self.setTitle("Promos")
                self.games_per_rank.hide()

    @override
    def nextId(self) -> int:
        return -1


class Wizard(QWizard):
    def __init__(self, league: League):
        super().__init__()
        self.setWindowTitle("hydrus-elo")

        self.setPage(Page.COMMAND.value, CommandPage())
        self.setPage(Page.SETTING.value, SettingPage(league))

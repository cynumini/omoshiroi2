import logging
import os
import sys
from pathlib import Path
from typing import cast

from PySide6.QtWidgets import (
    QApplication,
    QWizard,
)

from hydrus_elo.elo import PromosStrategy, RanksStrategy
from hydrus_elo.hydrus import Hydrus
from hydrus_elo.league import League
from hydrus_elo.play import Play
from hydrus_elo.wizard import Command, Wizard

logger = logging.getLogger("hydrus-elo")
logging.basicConfig(level=logging.INFO)


def main() -> None:
    league: League = League(Path("hydrus-elo.json"), logger)
    access_key = os.getenv("HYDRUS_CLIENT_API")
    assert isinstance(access_key, str)
    hydrus: Hydrus = Hydrus(access_key)

    app = QApplication([])
    wizard = Wizard(league)

    if wizard.exec() == QWizard.DialogCode.Accepted:
        command = Command(cast(str, wizard.field("command")))
        league_name = cast(str, wizard.field("league"))
        games_per_rank = cast(int, wizard.field("games_per_rank"))

        play: Play = Play(league, hydrus, logger)
        play.show()

        match command:
            case Command.RANKS:
                play.play(league_name, RanksStrategy(games_per_rank))
            case command.PROMOS:
                play.play(league_name, PromosStrategy())
            case command.SEASON:
                play.play(league_name, RanksStrategy(games_per_rank))
                play.play(league_name, PromosStrategy())

        play.start_round()

        sys.exit(app.exec())
    else:
        sys.exit(0)


if __name__ == "__main__":
    main()

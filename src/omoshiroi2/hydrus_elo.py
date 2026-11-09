import json
import os
from pathlib import Path
from typing import Any, cast, override

import hydrus_api
from PySide6.QtGui import (
    QAction,
)
from PySide6.QtWidgets import (
    QComboBox,
    QDialog,
    QDialogButtonBox,
    QFormLayout,
    QMenu,
    QWidget,
)

from omoshiroi2.elo import (
    PromosStrategy,
    Rank,
    RanksStrategy,
)
from omoshiroi2.play import File, Play
from omoshiroi2.query import Query
from omoshiroi2.setting_dialog import GAMES_PER_RANK, SettingPage


class QueryHydrus(Query):
    def __init__(self, league: str, tags: list[str]):
        super().__init__(league)
        self.tags: list[str] = tags

    def copy(self, tag: str) -> Query:
        tags = self.tags.copy()
        tags.append(tag)
        return QueryHydrus(self.league, tags)

    @override
    def count_for_elo_more_than(self, elo: int) -> Query:
        return self.copy(f"system:count for elo more than {elo}")

    @override
    def no_rating_for_league(self) -> Query:
        return self.copy(f"system:no rating for league.{self.league}")

    @override
    def has_rating_for_league(self, rank: None | Rank = None) -> Query:
        if rank is None:
            return QueryHydrus(
                self.league, [f"system:has rating for league.{self.league}"]
            )
        else:
            return QueryHydrus(
                self.league,
                [f"system:rating for league.{self.league} is {rank.value}/6"],
            )

    @override
    def limit(self, value: int) -> Query:
        return self.copy(f"system:limit is {value}")


class PlayHydrus(Play):
    def __init__(self, config: Config, hydrus: Hydrus):
        super().__init__()
        self.config: Config = config
        self.hydrus: Hydrus = hydrus

    @override
    def set_elo(self, id: int, elo: int):
        self.hydrus.set_elo(id, elo)

    @override
    def set_league(self, id: int, league: str, rank: Rank):
        self.hydrus.set_league(id, league, rank)

    @override
    def load_image(self, file: File, format: hydrus_api.RenderFormat) -> bytes:
        return self.hydrus.render(file.id, format, file.size)

    @override
    def search_files(self, query: Query) -> list[int]:
        query = cast(QueryHydrus, query)
        return self.hydrus.search_files(query.tags)

    @override
    def get_files(self, ids: list[int], league: str):
        return self.hydrus.get_files(ids, league)


class Hydrus:
    def __init__(self, access_key: str):
        self.client: hydrus_api.Client = hydrus_api.Client(access_key)
        self.elo_service_key: str | None = None
        self.league_service_keys: dict[str, str] = {}

    def search_files(self, tags: list[str]) -> list[int]:
        response = self.client.search_files(
            tags, file_sort_type=hydrus_api.FileSortType.RANDOM
        )
        return cast(list[int], response["file_ids"])

    def load_service_key(self):
        services = cast(
            dict[str, dict[str, str]], self.client.get_services()["services"]
        )

        for key, value in services.items():
            name = value["name"]
            if name == "elo":
                self.elo_service_key = key
            elif name.startswith("league."):
                self.league_service_keys[name[7:]] = key

        assert self.get_elo_service_key

    def get_elo_service_key(self):
        if not self.elo_service_key:
            self.load_service_key()
        return self.elo_service_key

    def render(
        self, id: int, render_format: hydrus_api.RenderFormat, size: tuple[int, int]
    ):
        return self.client.get_render(
            file_id=id, width=size[0], height=size[1], render_format=render_format
        ).content

    def get_files(self, ids: list[int], league_name: str) -> list[File]:
        elo_service_key = self.get_elo_service_key()
        league_service_key = self.league_service_keys[league_name]

        response = cast(
            list[dict[str, Any]],
            self.client.get_file_metadata(file_ids=ids)["metadata"],
        )

        files: list[File] = []

        for metadata in response:
            rank = cast(int | None, metadata["ratings"][league_service_key])
            rank = file = File(
                cast(int, metadata["file_id"]),
                cast(int, metadata["ratings"][elo_service_key]),
                Rank(rank) if rank else Rank.UNRANKED,
                (cast(int, metadata["width"]), cast(int, metadata["height"])),
            )

            if file.elo == 0:
                file.elo = 1000

            files.append(file)

        return files

    def set_elo(self, id: int, elo: int):
        assert self.elo_service_key
        self.client.set_rating(self.elo_service_key, elo, file_ids=[id])

    def set_league(self, id: int, league_name: str, rank: Rank):
        value = int(rank) if rank != Rank.UNRANKED else None
        self.client.set_rating(
            self.league_service_keys[league_name], value, file_ids=[id]
        )


CURRENT_VERSION = 1


class Config:
    def get_version(self, data: dict[str, Any]) -> int:
        return cast(int, data.get("version", 0))

    def __init__(self, path: Path) -> None:
        super().__init__()
        save = False
        if path.exists():
            data: dict[str, Any] = json.loads(path.read_text())  # pyright: ignore[reportAny]
            version = self.get_version(data)
            if version > CURRENT_VERSION:
                raise RuntimeError(f"Unsupported config version: {version}")
            while version < CURRENT_VERSION:
                save = True
                match version:
                    case 0:
                        print("Migrate to version 1")
                        data = {"version": 1, "leagues": data, "routines": []}
                    case _:
                        raise RuntimeError(f"Unsupported config version: {version}")
                version = self.get_version(data)
            print("Load hydrus-elo.json")
            self.version: int = 1
            self.leagues: dict[str, list[str]] = cast(
                dict[str, list[str]], data["leagues"]
            )
            self.routines: dict[str, list[dict[str, str | int]]] = cast(
                dict[str, list[dict[str, str | int]]], data["routines"]
            )
        else:
            self.version = 1
            self.leagues = {"all": ["system:filetype is image"]}
            self.routines = {
                "default": [{"league": "all", "strategy": "season", "count": 5}]
            }
            print("Create hydrus-elo.json")
            save = True

        if save:
            data = {
                "version": self.version,
                "leagues": self.leagues,
                "routines": self.routines,
            }
            _ = path.write_text(json.dumps(data))

    def get(self, key: str) -> Query:
        tags = self.leagues.get(key)
        assert tags
        return QueryHydrus(key, tags)

    @property
    def league_names(self) -> list[str]:
        return list(self.leagues.keys())


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


class HydrusElo(QWidget):
    def __init__(self):
        super().__init__()

        self.config: Config = Config(Path("hydrus-elo.json"))
        access_key = os.getenv("HYDRUS_CLIENT_API")
        assert isinstance(access_key, str)

        self.hydrus: Hydrus = Hydrus(access_key)
        self.promos_action: QAction = QAction("&promos", self)
        self.ranks_action: QAction = QAction("&ranks", self)
        self.season_action: QAction = QAction("&season", self)
        self.routines_action: QAction = QAction("r&outines", self)

        _ = self.promos_action.triggered.connect(self.promos)
        _ = self.ranks_action.triggered.connect(self.ranks)
        _ = self.season_action.triggered.connect(self.season)
        _ = self.routines_action.triggered.connect(self.routines)

    def setup_menu(self, menu: QMenu):
        menu.addAction(self.promos_action)
        menu.addAction(self.ranks_action)
        menu.addAction(self.season_action)
        menu.addAction(self.routines_action)

    def promos(self):
        dialog = SettingPage(self.config.league_names, False)
        if dialog.exec() == QDialog.DialogCode.Accepted:
            play: PlayHydrus = PlayHydrus(self.config, self.hydrus)
            play.showMaximized()
            query = self.config.get(dialog.league)
            play.play(query, PromosStrategy())
            play.start_round()

    def ranks(self):
        dialog = SettingPage(self.config.league_names)
        if dialog.exec() == QDialog.DialogCode.Accepted:
            play: PlayHydrus = PlayHydrus(self.config, self.hydrus)
            play.showMaximized()
            query = self.config.get(dialog.league)
            play.play(query, RanksStrategy(dialog.games_per_rank))
            play.start_round()

    def season(self):
        dialog = SettingPage(self.config.league_names)
        if dialog.exec() == QDialog.DialogCode.Accepted:
            play: PlayHydrus = PlayHydrus(self.config, self.hydrus)
            play.showMaximized()
            query = self.config.get(dialog.league)
            play.play(query, RanksStrategy(dialog.games_per_rank))
            play.play(query, PromosStrategy())
            play.start_round()

    def routines(self):
        dialog = RoutinesPage(self.config)
        if dialog.exec() == QDialog.DialogCode.Accepted:
            routines = dialog.routines.currentText()
            play: PlayHydrus = PlayHydrus(self.config, self.hydrus)
            play.showMaximized()
            for r in self.config.routines[routines]:
                league, strategy = r.get("league"), r.get("strategy")
                games_per_rank = cast(int, r.get("games_per_rank", GAMES_PER_RANK))
                assert league and strategy
                assert isinstance(league, str) and isinstance(strategy, str)
                query = self.config.get(league)
                match strategy:
                    case "season":
                        play.play(query, RanksStrategy(games_per_rank))
                        play.play(query, PromosStrategy())
                    case "ranks":
                        play.play(query, RanksStrategy(games_per_rank))
                    case "promos":
                        play.play(query, PromosStrategy())
                    case _:
                        raise RuntimeError(f"{strategy} is not implemented")
            play.start_round()

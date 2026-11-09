import datetime
import sqlite3
from enum import StrEnum
from pathlib import Path
from typing import Any, cast, override

import hydrus_api
from dateutil.parser import parse
from PIL import Image as PILImage
from platformdirs import user_data_dir
from PySide6.QtCore import QLocale, QModelIndex, QPersistentModelIndex
from PySide6.QtGui import QAction, QColor, QPainter, Qt
from PySide6.QtSql import QSqlDatabase, QSqlQuery, QSqlQueryModel
from PySide6.QtWidgets import (
    QCheckBox,
    QComboBox,
    QDialog,
    QDialogButtonBox,
    QFileDialog,
    QFormLayout,
    QHBoxLayout,
    QLineEdit,
    QMenu,
    QStyle,
    QStyledItemDelegate,
    QStyleOptionButton,
    QStyleOptionViewItem,
    QTableView,
    QTextEdit,
    QWidget,
)

from omoshiroi2.elo import PromosStrategy, Rank, RanksStrategy
from omoshiroi2.play import File, Play
from omoshiroi2.query import Query
from omoshiroi2.setting_dialog import SettingPage

type Row = tuple[Any, ...]


class Database:
    def __init__(self, path: Path):
        self.db: QSqlDatabase = QSqlDatabase.addDatabase("QSQLITE")
        self.db.setDatabaseName(str(path))

        if not self.db.open():
            raise RuntimeError(self.db.lastError().text())

    def close(self):
        self.db.close()

    def execute_script(self, sql: str):
        query = QSqlQuery(self.db)
        statement = ""
        for line in sql.splitlines(keepends=True):
            statement += line
            if sqlite3.complete_statement(statement):
                statement = statement.strip()
                if statement and not query.exec(statement):
                    _ = self.db.rollback()
                    raise RuntimeError(query.lastError().text())
                statement = ""

    def fetch_one(self, sql: str) -> Any:  # pyright: ignore[reportAny]
        query = self.db.exec(sql)
        if query.next():
            return query.value(0)  # pyright: ignore[reportAny]
        else:
            raise RuntimeError(query.lastError().text())

    def execute(self, sql: str, values: Row | None = None) -> list[Row]:
        query = QSqlQuery(self.db)
        _ = query.prepare(sql)
        if values:
            for value in values:  # pyright: ignore[reportAny]
                query.addBindValue(value)
        if not query.exec():
            raise RuntimeError(query.lastError().text())
        rows: list[Row] = []
        while query.next():
            rows.append(tuple(query.value(i) for i in range(query.record().count())))
        return rows

    def get_query(self, league: str):
        sql = cast(
            str, self.execute(f'SELECT sql FROM league WHERE name = "{league}"')[0][0]
        )
        return QueryOmoshiroi(league, sql)

    def set_elo(self, id: int, elo: int):
        query = QSqlQuery(self.db)
        _ = query.prepare("UPDATE media SET elo = ? WHERE id = ?")
        query.addBindValue(elo)
        query.addBindValue(id)

        if not query.exec():
            raise RuntimeError(query.lastError().text())

    def set_league(self, id: int, league_name: str, rank: Rank):
        query = QSqlQuery(self.db)
        if rank == Rank.UNRANKED:
            sql = """DELETE FROM rank WHERE media_id = ?
AND league_id = (SELECT id FROM league WHERE name = ?)"""
            _ = query.prepare(sql)
            query.addBindValue(id)
            query.addBindValue(league_name)
        else:
            sql = """INSERT INTO rank (league_id, media_id, rank) 
VALUES ((SELECT id FROM league WHERE name = ?), ?, ?)
ON CONFLICT (league_id, media_id)
DO UPDATE SET rank = excluded.rank"""
            _ = query.prepare(sql)
            query.addBindValue(league_name)
            query.addBindValue(id)
            query.addBindValue(rank.value)
        if not query.exec():
            raise RuntimeError(query.lastError().text())

    def add_assets_path(self, path: Path):
        query = QSqlQuery(self.db)
        _ = query.prepare("INSERT OR IGNORE INTO asset (path) VALUES (?)")
        query.addBindValue(str(path))

        if not query.exec():
            raise RuntimeError(query.lastError().text())

    def get_assets_paths(self) -> list[Path]:
        rows = self.execute("SELECT path FROM asset")
        return [Path(row[0]) for row in rows]  # pyright: ignore[reportAny]


class QueryOmoshiroi(Query):
    def __init__(self, league: str, sql: str):
        super().__init__(league)
        self.sql: str = sql

    def copy_and(self, condition: str) -> Query:
        return QueryOmoshiroi(self.league, f"{self.sql} and {condition}")

    def copy(self, condition: str) -> Query:
        return QueryOmoshiroi(self.league, f"{self.sql} {condition}")

    @override
    def count_for_elo_more_than(self, elo: int) -> Query:
        return self.copy_and(f"media.elo > {elo}")

    @override
    def no_rating_for_league(self) -> Query:
        return self.copy_and(
            f"""NOT EXISTS (SELECT 1 FROM rank 
JOIN league ON league.id = rank.league_id
WHERE rank.media_id = media.id AND league.name = "{self.league}")"""
        )

    @override
    def has_rating_for_league(self, rank: None | Rank = None) -> Query:
        if rank is None:
            return QueryOmoshiroi(
                self.league,
                f"""EXISTS (SELECT 1 FROM rank 
JOIN league ON league.id = rank.league_id 
WHERE rank.media_id = media.id AND league.name = "{self.league}")""",
            )
        else:
            return QueryOmoshiroi(
                self.league,
                f"""EXISTS (SELECT 1 FROM rank
JOIN league ON league.id = rank.league_id
WHERE rank.media_id = media.id AND league.name = "{self.league}" AND rank.rank = {rank.value})""",
            )

    @override
    def limit(self, value: int) -> Query:
        return self.copy(f"LIMIT {value}")


class ComboBoxSQL(QComboBox):
    def __init__(
        self,
        database: Database,
        sql: str,
        empty_at_start: bool = False,
        editable: bool = True,
    ):
        super().__init__()

        self.sql_model: QSqlQueryModel = QSqlQueryModel(self)
        self.sql_model.setQuery(sql, database.db)

        self.setModel(self.sql_model)
        self.setEditable(editable)
        self.setInsertPolicy(QComboBox.InsertPolicy.NoInsert)

        if editable:
            completer = self.completer()
            assert completer
            completer.setFilterMode(Qt.MatchFlag.MatchContains)

            if empty_at_start:
                self.setEditText("")


class DateInput(QLineEdit):
    def __init__(self):
        super().__init__()
        _ = self.editingFinished.connect(self.normalize_date)
        self.date: datetime.date | None = None
        self.setText(str(self.date))
        self.setStyleSheet("background-color: green")

    def normalize_date(self):
        try:
            text = self.text().replace("年", "-").replace("月", "-").replace("日", "")
            parsed_date = parse(text, fuzzy=False).date()
            self.setText(parsed_date.isoformat())
            self.setStyleSheet("background-color: green")
            self.date = parsed_date
        except ValueError, OverflowError:
            self.date = None
            self.setStyleSheet("background-color: red")

    def get_date(self):
        return self.date


class State(StrEnum):
    new = "New"
    repeat = "Repeat"
    completed = "Completed"


class Add(QDialog):
    def __init__(self, database: Database):
        super().__init__()

        self.setWindowTitle("Add media")

        self.name: ComboBoxSQL = ComboBoxSQL(database, "SELECT name FROM media", True)
        self.kind: ComboBoxSQL = ComboBoxSQL(
            database, "SELECT DISTINCT kind FROM media"
        )
        self.release: DateInput = DateInput()
        self.japanese: QCheckBox = QCheckBox()
        self.state: QComboBox = QComboBox()
        self.state.addItems([state for state in State])
        self.note: QTextEdit = QTextEdit()

        buttons = QDialogButtonBox(
            QDialogButtonBox.StandardButton.Ok | QDialogButtonBox.StandardButton.Cancel
        )

        _ = buttons.accepted.connect(self.accept)
        _ = buttons.rejected.connect(self.reject)

        layout = QFormLayout(self)
        layout.addRow("Name", self.name)
        layout.addRow("Kind", self.kind)
        layout.addRow("Release", self.release)
        layout.addRow("Japanese", self.japanese)
        layout.addRow("State", self.state)
        layout.addRow("Note", self.note)
        layout.addRow(buttons)


class AddLeague(QDialog):
    def __init__(self):
        super().__init__()

        self.setWindowTitle("Add league")

        self.name: QLineEdit = QLineEdit()
        self.sql: QTextEdit = QTextEdit()

        buttons = QDialogButtonBox(
            QDialogButtonBox.StandardButton.Ok | QDialogButtonBox.StandardButton.Cancel
        )

        _ = buttons.accepted.connect(self.accept)
        _ = buttons.rejected.connect(self.reject)

        layout = QFormLayout(self)
        layout.addRow("Name", self.name)
        layout.addRow("SQL", self.sql)
        layout.addRow(buttons)


class PlayOmoshiroi(Play):
    def __init__(self, database: Database, assets: Path):
        super().__init__()
        self.database: Database = database
        self.assets: Path = assets

    @override
    def set_elo(self, id: int, elo: int):
        self.database.set_elo(id, elo)

    @override
    def set_league(self, id: int, league: str, rank: Rank):
        self.database.set_league(id, league, rank)

    @override
    def load_image(self, file: File, _format: hydrus_api.RenderFormat) -> bytes | None:
        if file.path:
            return file.path.read_bytes()
        else:
            return None

    @override
    def search_files(self, query: Query) -> list[int]:
        query = cast(QueryOmoshiroi, query)
        return [
            data[0]
            for data in self.database.execute(
                f"SELECT media.id FROM media WHERE {query.sql}"
            )
        ]

    @override
    def get_files(self, ids: list[int], league: str):
        if not ids:
            return cast(list[File], [])

        placeholders = ", ".join("?" for _ in ids)
        sql = f"""
            SELECT media.*, COALESCE(rank.rank, 0) AS rank
            FROM media
            LEFT JOIN rank
                ON rank.media_id = media.id
                AND rank.league_id = (
                    SELECT id FROM league WHERE name = ?
                )
            WHERE media.id IN ({placeholders})
        """

        files: list[File] = []
        for row in self.database.execute(sql, (league, *ids)):
            id = cast(int, row[0])
            size = (0, 0)
            path: Path | None = None
            paths = self.database.get_assets_paths()
            paths.append(self.assets)
            for p in paths:
                for file in p.glob(f"{id}.*"):
                    with PILImage.open(file) as img:
                        size = img.size
                        path = file
                    break
            files.append(
                File(
                    id,
                    cast(int, row[4]),
                    Rank(row[8]),
                    size,
                    None,
                    cast(str, row[1]),
                    f"{row[1]}, {row[2]}, {row[3]}, {'jp' if row[5] else 'en'}",
                    path,
                )
            )
        return files


class BoolDelegate(QStyledItemDelegate):
    @override
    def paint(
        self,
        painter: QPainter,
        option: QStyleOptionViewItem,
        index: QModelIndex | QPersistentModelIndex,
    ):
        value = bool(cast(int, index.data(Qt.ItemDataRole.DisplayRole)))
        checkbox = QStyleOptionButton()
        if value:
            checkbox.state = QStyle.StateFlag.State_On
        style = option.widget.style()
        checkbox.rect = style.subElementRect(
            QStyle.SubElement.SE_CheckBoxIndicator, checkbox, option.widget
        )
        checkbox.rect.moveCenter(option.rect.center())
        style.drawControl(
            QStyle.ControlElement.CE_CheckBox, checkbox, painter, option.widget
        )


class StateDelegate(QStyledItemDelegate):
    @override
    def displayText(self, value: Any, locale: QLocale | QLocale.Language) -> str:  # pyright: ignore[reportAny]
        state = cast(int, value)
        if state == 0:
            return "new"
        elif state == 1:
            return "repeat"
        else:
            return "completed"


class RankDelegate(QStyledItemDelegate):
    @override
    def paint(
        self,
        painter: QPainter,
        option: QStyleOptionViewItem,
        index: QModelIndex | QPersistentModelIndex,
    ):
        rank = cast(int, index.data())
        stars = "★" * rank if rank else ""
        painter.save()
        painter.setPen(QColor("#0000FF"))
        _ = painter.drawText(
            option.rect,
            Qt.AlignmentFlag.AlignCenter,
            stars,
        )
        painter.restore()


class Show(QWidget):
    def __init__(self, database: Database, league_name: str):
        super().__init__()

        self.setWindowTitle(f"Show {league_name}")
        self.resize(1280, 720)

        league_id, league_sql = cast(
            tuple[int, str],
            database.execute(
                "SELECT id, sql FROM league WHERE name = ?", (league_name,)
            )[0],
        )

        self.model: QSqlQueryModel = QSqlQueryModel(self)

        query = QSqlQuery(database.db)
        _ = query.prepare(f"""SELECT
    media.id,
    media.name,
    media.kind,
    media.release,
    media.elo,
    media.japanese,
    media.state,
    media.note,
    COALESCE(rank.rank, 0) AS rank
FROM media
LEFT JOIN rank
    ON rank.media_id = media.id
    AND rank.league_id = ?
WHERE {league_sql}
ORDER BY COALESCE(rank.rank, 0) DESC, media.elo DESC""")
        query.addBindValue(league_id)

        if not query.exec():
            print(query.lastError().text())
            assert False

        self.model.setQuery(query)

        self.table_view: QTableView = QTableView(self)
        self.table_view.setModel(self.model)
        self.table_view.setItemDelegateForColumn(5, BoolDelegate(self.table_view))
        self.table_view.setItemDelegateForColumn(6, StateDelegate(self.table_view))
        self.table_view.setItemDelegateForColumn(8, RankDelegate(self.table_view))

        layout = QHBoxLayout(self)
        self.setLayout(layout)

        layout.addWidget(self.table_view)


def setting_page_from_database(
    database: Database, games_per_rank: bool = True
) -> SettingPage:
    leagues: list[str] = [
        data[0] for data in database.execute("SELECT league.name from league")
    ]
    return SettingPage(leagues, games_per_rank)


class Omoshiroi(QWidget):
    def __init__(self):
        super().__init__()

        data_path = Path(user_data_dir("omoshiroi2"))
        data_path.mkdir(exist_ok=True)

        database_path = data_path / "omoshiroi.db"
        self.assets: Path = data_path / "assets"
        self.assets.mkdir(exist_ok=True)

        self.database: Database = Database(database_path)

        print(f"The database path is {database_path}")

        self.migrate()

        self.show_window: Show | None = None

        self.ranks_action: QAction = QAction("&ranks")
        self.promos_action: QAction = QAction("&promos")
        self.season_action: QAction = QAction("&season")
        self.add_action: QAction = QAction("&add", self)
        self.league_action: QAction = QAction("&league", self)
        self.show_action: QAction = QAction("s&how elo")
        self.add_asset_dir_action: QAction = QAction("a&dd assets dir")

        _ = self.ranks_action.triggered.connect(self.ranks)
        _ = self.promos_action.triggered.connect(self.promos)
        _ = self.season_action.triggered.connect(self.season)
        _ = self.show_action.triggered.connect(self.show_elo)
        _ = self.add_action.triggered.connect(self.add)
        _ = self.league_action.triggered.connect(self.league)
        _ = self.add_asset_dir_action.triggered.connect(self.add_assets_dir)

    def cleanup(self):
        self.database.close()

    def migrate(self):
        version = cast(int, self.database.fetch_one("PRAGMA user_version;"))
        if version == 0:
            print("Creating the database")
            self.database.execute_script("""BEGIN;
CREATE TABLE media (
    id       INTEGER NOT NULL UNIQUE,
    name     TEXT NOT NULL,
    kind     TEXT NOT NULL,
    release  TEXT NOT NULL,
    elo      INT NOT NULL DEFAULT 1000,
    japanese INT NOT NULL,
    state    INT NOT NULL DEFAULT 0,
    note     TEXT,
    rank     INTEGER NOT NULL DEFAULT 0,
    PRIMARY KEY(id AUTOINCREMENT),
    UNIQUE(name,kind)
) STRICT;
CREATE TABLE log (
    id               INTEGER NOT NULL UNIQUE,
    timestamp        REAL NOT NULL UNIQUE,
    kind             TEXT NOT NULL,
    duration_seconds INTEGER NOT NULL,
    parent_id        INTEGER,
    characters       INTEGER,
    page             INTEGER,
    eps              REAL,
    yt_id            TEXT,
    yt_title         TEXT,
    notes            TEXT,
    PRIMARY KEY(id AUTOINCREMENT),
    FOREIGN KEY(parent_id) REFERENCES media(id)
) STRICT;
PRAGMA user_version = 1;
COMMIT;""")
            version = 1
        if version == 1:
            print("Migrate the database to version 2")
            _ = self.database.execute_script("""BEGIN;
CREATE TABLE league (
    id   INTEGER NOT NULL UNIQUE,
    name TEXT NOT NULL UNIQUE,
    sql  TEXT NOT NULL UNIQUE,
    PRIMARY KEY(id AUTOINCREMENT)
) STRICT;
INSERT INTO league (id, name, sql) VALUES (1, "all", "media.state != 2");
INSERT INTO league (id, name, sql) VALUES (2, "japanese", "media.state != 2 AND media.japanese = 1");
INSERT INTO league (id, name, sql) VALUES (3, "english", "media.state != 2 AND media.japanese = 0");
CREATE TABLE rank (
    league_id INTEGER NOT NULL,
    media_id  INTEGER NOT NULL,
    rank      INTEGER NOT NULL,
    UNIQUE(league_id,media_id),
    FOREIGN KEY(league_id) REFERENCES league(id),
    FOREIGN KEY(media_id) REFERENCES media(id)
) STRICT;
INSERT INTO rank (league_id, media_id, rank)
       SELECT 1, id, rank FROM media;
ALTER TABLE media DROP COLUMN rank;
PRAGMA user_version = 2;
COMMIT;""")
        if version == 2:
            print("Migrate the database to version 2")
            _ = self.database.execute_script("""BEGIN;
CREATE TABLE "asset" (
	"path"	TEXT NOT NULL UNIQUE
) STRICT;
PRAGMA user_version = 3;
COMMIT;""")

    def setup_menu(self, menu: QMenu):
        menu.addAction(self.season_action)
        menu.addAction(self.ranks_action)
        menu.addAction(self.promos_action)
        menu.addAction(self.show_action)
        menu.addAction(self.league_action)
        menu.addAction(self.add_action)
        menu.addAction(self.add_asset_dir_action)

    def promos(self):
        dialog = setting_page_from_database(self.database, False)
        if dialog.exec():
            play: PlayOmoshiroi = PlayOmoshiroi(self.database, self.assets)
            play.showMaximized()
            query = self.database.get_query(dialog.league)
            play.play(query, PromosStrategy())
            play.start_round()

    def ranks(self):
        dialog = setting_page_from_database(self.database)
        if dialog.exec() == QDialog.DialogCode.Accepted:
            play: PlayOmoshiroi = PlayOmoshiroi(self.database, self.assets)
            play.showMaximized()
            query = self.database.get_query(dialog.league)
            play.play(query, RanksStrategy(dialog.games_per_rank))
            play.start_round()

    def season(self):
        dialog = setting_page_from_database(self.database)
        if dialog.exec() == QDialog.DialogCode.Accepted:
            play: PlayOmoshiroi = PlayOmoshiroi(self.database, self.assets)
            play.showMaximized()
            query = self.database.get_query(dialog.league)
            play.play(query, RanksStrategy(dialog.games_per_rank))
            play.play(query, PromosStrategy())
            play.start_round()

    def add(self):
        dialog = Add(self.database)
        if dialog.exec() == QDialog.DialogCode.Accepted:
            _ = self.database.execute(
                """INSERT INTO media (name, kind, release, japanese, state, note)
       VALUES (?, ?, ?, ?, ?, ?)""",
                (
                    dialog.name.currentText(),
                    dialog.kind.currentText(),
                    dialog.release.text(),
                    dialog.japanese.isChecked(),
                    dialog.state.currentIndex(),
                    dialog.note.toPlainText().strip() or None,
                ),
            )

    def league(self):
        dialog = AddLeague()
        if dialog.exec() == QDialog.DialogCode.Accepted:
            _ = self.database.execute(
                "INSERT INTO league (name, sql) VALUES (?, ?)",
                (dialog.name.text(), dialog.sql.toPlainText().strip()),
            )

    def show_elo(self):
        dialog = setting_page_from_database(self.database, False)
        if dialog.exec():
            self.show_window = Show(self.database, dialog.league)
            self.show_window.show()

    def add_assets_dir(self):
        assets_dir = QFileDialog.getExistingDirectory(
            self, "Choose assets directory", str(Path.home())
        )
        if assets_dir:
            self.database.add_assets_path(Path(assets_dir))

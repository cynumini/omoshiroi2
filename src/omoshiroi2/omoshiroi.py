import datetime
import sqlite3
from enum import StrEnum
from pathlib import Path
from typing import Any, cast, override

from dateutil.parser import parse
from platformdirs import user_data_dir
from PySide6.QtCore import QLocale, QModelIndex, QObject, QPersistentModelIndex
from PySide6.QtGui import QAction, QColor, QPainter, Qt
from PySide6.QtSql import QSqlDatabase, QSqlQuery, QSqlQueryModel
from PySide6.QtWidgets import (
    QCheckBox,
    QComboBox,
    QDialog,
    QDialogButtonBox,
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


class Omoshiroi(QWidget):
    def __init__(self):
        super().__init__()

        data_path = Path(user_data_dir("omoshiroi2"))
        data_path.mkdir(exist_ok=True)

        database_path = data_path / "omoshiroi.db"

        self.database: Database = Database(database_path)

        print(f"The database path is {database_path}")

        self.migrate()

        self.omoshiroi_elo: OmoshiroiElo = OmoshiroiElo(self.database)

        self.add_action: QAction = QAction("&add", self)
        self.league_action: QAction = QAction("&league", self)

        _ = self.add_action.triggered.connect(self.add)
        _ = self.league_action.triggered.connect(self.league)

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

    def setup_menu(self, menu: QMenu):
        menu.addAction(self.add_action)
        elo_menu = menu.addMenu("&elo")
        self.omoshiroi_elo.setup_menu(elo_menu)
        menu.addAction(self.league_action)

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


class OmoshiroiElo(QObject):
    def __init__(self, database: Database):
        super().__init__()

        self.database: Database = database

        self.ranks_action: QAction = QAction("&ranks")
        self.promos_action: QAction = QAction("&promos")
        self.season_action: QAction = QAction("&season")
        self.show_action: QAction = QAction("s&how")

        _ = self.ranks_action.triggered.connect(self.ranks)
        _ = self.promos_action.triggered.connect(self.promos)
        _ = self.season_action.triggered.connect(self.season)
        _ = self.show_action.triggered.connect(self.show)

        self.show_window: Show | None = None

    def setup_menu(self, menu: QMenu):
        menu.addAction(self.ranks_action)
        menu.addAction(self.promos_action)
        menu.addAction(self.season_action)
        menu.addAction(self.show_action)

    def ranks(self):
        setting_dialog = setting_page_from_database(self.database)
        if setting_dialog.exec():
            pass

    def promos(self):
        setting_dialog = setting_page_from_database(self.database, False)
        if setting_dialog.exec():
            pass

    def season(self):
        setting_dialog = setting_page_from_database(self.database)
        if setting_dialog.exec():
            pass

    def show(self):
        setting_dialog = setting_page_from_database(self.database, False)
        if setting_dialog.exec():
            self.show_window = Show(self.database, setting_dialog.league)
            self.show_window.show()

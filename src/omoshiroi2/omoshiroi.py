import datetime
from enum import StrEnum
from pathlib import Path
from typing import cast

from dateutil.parser import parse
from platformdirs import user_data_dir
from PySide6.QtCore import Qt
from PySide6.QtGui import QAction
from PySide6.QtSql import QSqlQueryModel
from PySide6.QtWidgets import (
    QCheckBox,
    QComboBox,
    QDialog,
    QDialogButtonBox,
    QFormLayout,
    QLineEdit,
    QMenu,
    QTextEdit,
    QWidget,
)

from omoshiroi2.database import Database
from omoshiroi2.omoshiroi_elo import OmoshiroiElo


class ComboBoxSQL(QComboBox):
    def __init__(
        self,
        database: Database,
        sql: str,
        empty_at_start: bool = False,
    ):
        super().__init__()

        self.sql_model: QSqlQueryModel = QSqlQueryModel(self)
        self.sql_model.setQuery(sql, database.db)

        self.setModel(self.sql_model)
        self.setEditable(True)
        self.setInsertPolicy(QComboBox.InsertPolicy.NoInsert)

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
    repeat = "Pepeat"
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


class League(QDialog):
    def __init__(self):
        super().__init__()

        self.setWindowTitle("Add media")

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
                [
                    dialog.name.currentText(),
                    dialog.kind.currentText(),
                    dialog.release.text(),
                    dialog.japanese.isChecked(),
                    dialog.state.currentIndex(),
                    dialog.note.toPlainText().strip() or None,
                ],
            )

    def league(self):
        dialog = League()
        if dialog.exec() == QDialog.DialogCode.Accepted:
            _ = self.database.execute(
                "INSERT INTO league (name, sql) VALUES (?, ?)",
                [dialog.name.text(), dialog.sql.toPlainText().strip()],
            )

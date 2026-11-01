import sqlite3
from pathlib import Path
from typing import Any, cast

from platformdirs import user_data_dir
from PySide6.QtCore import QObject
from PySide6.QtGui import QAction
from PySide6.QtSql import QSqlDatabase, QSqlQuery
from PySide6.QtWidgets import QMenu


class Omoshiroi(QObject):
    def __init__(self):
        super().__init__()

        data_path = Path(user_data_dir("omoshiroi2"))
        data_path.mkdir(exist_ok=True)

        database_path = data_path / "omoshiroi.db"

        self.database: QSqlDatabase = QSqlDatabase.addDatabase("QSQLITE")
        self.database.setDatabaseName(str(database_path))

        if not self.database.open():
            raise RuntimeError(self.database.lastError().text())

        print(f"The database path is {database_path}")

        self.migrate()

        self.add_action: QAction = QAction("&add", self)
        self.elo_action: QAction = QAction("&elo", self)
        self.league_action: QAction = QAction("&league", self)
        self.log_action: QAction = QAction("lo&g", self)
        self.stats_action: QAction = QAction("&stats", self)

        _ = self.add_action.triggered.connect(self.add)
        _ = self.elo_action.triggered.connect(self.elo)
        _ = self.league_action.triggered.connect(self.league)
        _ = self.log_action.triggered.connect(self.log)
        _ = self.stats_action.triggered.connect(self.stats)

    def cleanup(self):
        self.database.close()

    def execute_script(self, sql: str):
        query = QSqlQuery(self.database)
        statement = ""
        for line in sql.splitlines(keepends=True):
            statement += line
            if sqlite3.complete_statement(statement):
                statement = statement.strip()
                if statement and not query.exec(statement):
                    _ = self.database.rollback()
                    raise RuntimeError(query.lastError().text())
                statement = ""

    def fetch_one(self, sql: str) -> Any:  # pyright: ignore[reportAny]
        query = self.database.exec(sql)
        if query.next():
            return query.value(0)  # pyright: ignore[reportAny]
        else:
            raise RuntimeError(query.lastError().text())

    def migrate(self):
        version = cast(int, self.fetch_one("PRAGMA user_version;"))
        if version == 0:
            print("Creating the database")
            self.execute_script("""BEGIN;
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
            _ = self.execute_script("""BEGIN;
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
        menu.addAction(self.elo_action)
        menu.addAction(self.league_action)
        menu.addAction(self.log_action)
        menu.addAction(self.stats_action)

    def add(self):
        print("add")

    def elo(self):
        print("elo")

    def league(self):
        print("league")

    def log(self):
        print("log")

    def stats(self):
        print("stats")

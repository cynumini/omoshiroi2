from pathlib import Path
import sqlite3
from typing import Any

from PySide6.QtSql import QSqlDatabase, QSqlQuery

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

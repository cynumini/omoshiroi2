from PySide6.QtCore import QObject
from PySide6.QtGui import QAction
from PySide6.QtWidgets import QMenu

from omoshiroi2.database import Database

# class Resource:
#     def __init__(self, database: Database, id: int):
#         pass


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

    def setup_menu(self, menu: QMenu):
        menu.addAction(self.ranks_action)
        menu.addAction(self.promos_action)
        menu.addAction(self.season_action)
        menu.addAction(self.show_action)

    def ranks(self):
        print("ranks")

    def promos(self):
        print("promos")

    def season(self):
        print("season")

    def show(self):
        print("show")

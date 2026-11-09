import sys

from PySide6.QtWidgets import QApplication, QMainWindow

from omoshiroi2.hydrus_elo import HydrusElo
from omoshiroi2.omoshiroi import Omoshiroi


class MainWindow(QMainWindow):
    def __init__(self):
        super().__init__()

        self.omoshiroi: Omoshiroi = Omoshiroi()
        self.hydrus_elo: HydrusElo = HydrusElo()

        self.setWindowTitle("omoshiroi2")
        self.resize(800, 600)

        self.omoshiroi.setup_menu(self.menuBar().addMenu("&omoshiroi"))
        self.hydrus_elo.setup_menu(self.menuBar().addMenu("&hydrus-elo"))

    def cleanup(self):
        self.omoshiroi.cleanup()


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

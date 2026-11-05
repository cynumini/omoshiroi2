from PySide6.QtWidgets import (
    QComboBox,
    QDialog,
    QDialogButtonBox,
    QFormLayout,
    QSpinBox,
)

GAMES_PER_RANK = 5


class SettingPage(QDialog):
    def __init__(self, leagues: list[str], games_per_rank: bool = True):
        super().__init__()

        self.setWindowTitle("Settings")

        self.league_combo: QComboBox = QComboBox()
        self.league_combo.addItems(leagues)

        buttons = QDialogButtonBox(
            QDialogButtonBox.StandardButton.Ok | QDialogButtonBox.StandardButton.Cancel
        )

        _ = buttons.accepted.connect(self.accept)
        _ = buttons.rejected.connect(self.reject)

        layout = QFormLayout(self)
        layout.addRow("League", self.league_combo)
        if games_per_rank:
            self.games_per_rank_spin: QSpinBox | None = QSpinBox(
                minimum=1, value=GAMES_PER_RANK
            )
            layout.addRow("Games per rank", self.games_per_rank_spin)
        else:
            self.games_per_rank_spin = None
        layout.addRow(buttons)

    @property
    def league(self) -> str:
        return self.league_combo.currentText()

    @property
    def games_per_rank(self) -> int:
        assert self.games_per_rank_spin
        return self.games_per_rank_spin.value()

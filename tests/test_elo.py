from hydrus_elo.elo import Score, play_int


def test_play_int():
    assert play_int(1200, 1000, Score.WIN, 30) == (1207, 993)
    assert play_int(1500, 1400, Score.WIN, 32) == (1512, 1388)
    assert play_int(1500, 1400, Score.LOSE, 32) == (1480, 1420)
    assert play_int(1500, 1400, Score.DRAW, 32) == (1496, 1404)

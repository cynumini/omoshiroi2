from abc import ABC, abstractmethod

from omoshiroi2.elo import Rank


class Query(ABC):
    def __init__(self, league: str):
        self.league: str = league

    @abstractmethod
    def count_for_elo_more_than(self, elo: int) -> Query:
        pass

    @abstractmethod
    def has_rating_for_league(self, rank: None | Rank = None) -> Query:
        pass

    @abstractmethod
    def no_rating_for_league(self) -> Query:
        pass

    @abstractmethod
    def limit(self, value: int) -> Query:
        pass

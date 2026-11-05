import json
from pathlib import Path
from typing import Any, cast

CURRENT_VERSION = 1


class Config:
    def get_version(self, data: dict[str, Any]) -> int:
        return cast(int, data.get("version", 0))

    def __init__(self, path: Path) -> None:
        save = False
        if path.exists():
            data: dict[str, Any] = json.loads(path.read_text())  # pyright: ignore[reportAny]
            version = self.get_version(data)
            if version > CURRENT_VERSION:
                raise RuntimeError(f"Unsupported config version: {version}")
            while version < CURRENT_VERSION:
                save = True
                match version:
                    case 0:
                        print("Migrate to version 1")
                        data = {"version": 1, "leagues": data, "routines": []}
                    case _:
                        raise RuntimeError(f"Unsupported config version: {version}")
                version = self.get_version(data)
            print("Load hydrus-elo.json")
            self.version: int = 1
            self.leagues: dict[str, list[str]] = cast(
                dict[str, list[str]], data["leagues"]
            )
            self.routines: dict[str, list[dict[str, str | int]]] = cast(
                dict[str, list[dict[str, str | int]]], data["routines"]
            )
        else:
            self.version = 1
            self.leagues = {"all": ["system:filetype is image"]}
            self.routines = {
                "default": [{"league": "all", "strategy": "season", "count": 5}]
            }
            print("Create hydrus-elo.json")
            save = True

        if save:
            data = {
                "version": self.version,
                "leagues": self.leagues,
                "routines": self.routines,
            }
            _ = path.write_text(json.dumps(data))

    def get(self, key: str) -> list[str]:
        tags = self.leagues.get(key)
        assert tags
        return tags

    @property
    def league_names(self) -> list[str]:
        return list(self.leagues.keys())

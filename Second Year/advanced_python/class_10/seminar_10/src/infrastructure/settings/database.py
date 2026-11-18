from typing import Self

from pydantic_settings import BaseSettings, SettingsConfigDict


class DatabaseSettings(BaseSettings):
    """Настройки базы данных."""

    host: str = "localhost"
    port: int = 5432

    name: str = "postgres"

    username: str = "postgres"
    password: str = "postgres"

    dialect: str = "postgresql"
    driver: str = "asyncpg"

    autocommit: bool = False
    autoflush: bool = False
    expire_on_commit: bool = False

    @property
    def url(self: Self) -> str:
        """URL для подключения."""
        drivername: str = f"{self.dialect}+{self.driver}"
        return f"{drivername}://{self.username}:{self.password}@{self.host}:{self.port}/{self.name}"

    model_config = SettingsConfigDict(env_prefix="database_")

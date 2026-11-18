from functools import partial

from fastapi import Depends

from src.domain.services.interfaces.repository import RepositoryInterface
from src.infrastructure.adapters.repository import RepositoryAdapter
from src.infrastructure.settings.database import DatabaseSettings
from utils.database.session import get_session, get_session_maker
from utils.database.typing import SessionFactory


def on_settings() -> DatabaseSettings:
    """Зависимость от настроек."""
    return DatabaseSettings()


async def on_session_factory(
    settings: DatabaseSettings = Depends(on_settings),
) -> SessionFactory:
    """Зависимость от фабрики сессий."""
    session_maker = get_session_maker(settings)
    return partial(get_session, session_maker)


async def on_repository(
    session_factory: SessionFactory = Depends(on_session_factory),
) -> RepositoryInterface:
    """Зависимость от репозитория."""
    return RepositoryAdapter(_session_factory=session_factory)

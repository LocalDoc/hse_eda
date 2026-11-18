from collections.abc import AsyncIterator
from contextlib import asynccontextmanager

from sqlalchemy.ext.asyncio.engine import create_async_engine
from sqlalchemy.ext.asyncio.session import AsyncSession, async_sessionmaker

from src.infrastructure.settings.database import DatabaseSettings


def get_session_maker(settings: DatabaseSettings) -> async_sessionmaker:
    """Получить фабрику сессий."""
    return async_sessionmaker(
        bind=create_async_engine(settings.url),
        autoflush=settings.autoflush,
        autocommit=settings.autocommit,
    )


@asynccontextmanager
async def get_session(session_maker: async_sessionmaker) -> AsyncIterator[AsyncSession]:
    """Контекстный менеджер для создания сессии."""
    async with session_maker.begin() as session:
        yield session

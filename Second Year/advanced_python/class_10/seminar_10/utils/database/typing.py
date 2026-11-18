from collections.abc import Callable
from contextlib import AbstractAsyncContextManager

from sqlalchemy.ext.asyncio.session import AsyncSession

SessionFactory = Callable[[], AbstractAsyncContextManager[AsyncSession]]

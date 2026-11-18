from abc import abstractmethod
from typing import Protocol, Self

from src.domain.entities.student import Student


class RepositoryInterface(Protocol):
    """Интерфейс репозитория."""

    @abstractmethod
    async def get_students(self: Self) -> list[Student]:
        """Получить список студентов."""

    @abstractmethod
    async def add_student(self: Self, student: Student) -> None:
        """Добавить студента."""

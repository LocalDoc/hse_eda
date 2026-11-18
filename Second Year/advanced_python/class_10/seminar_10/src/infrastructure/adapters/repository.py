from dataclasses import dataclass
from typing import ClassVar, Self

from sqlalchemy import select

from src.domain.entities.student import Student
from src.domain.services.interfaces.repository import RepositoryInterface
from src.infrastructure.models.student import StudentModel
from utils.database.typing import SessionFactory


@dataclass
class RepositoryAdapter(RepositoryInterface):
    """Адаптер репозитория."""

    _session_factory: SessionFactory

    _student_model: ClassVar = StudentModel

    async def get_students(self: Self) -> list[Student]:
        """Получить список студентов."""
        query = select(self._student_model)

        async with self._session_factory() as session:
            query_result = await session.scalars(query)
            models = query_result.all()
            return [Student.model_validate(model) for model in models]

    async def add_student(self: Self, student: Student) -> None:
        """Добавить студента."""
        model = self._student_model(**student.model_dump())

        async with self._session_factory() as session:
            session.add(model)

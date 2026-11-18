from http import HTTPStatus
from typing import Final

from fastapi import APIRouter, Depends

from src.domain.entities.student import Student
from src.domain.services.interfaces.repository import RepositoryInterface
from src.presentation.api.v1.injections import on_repository

TAG: Final[str] = "students"
PREFIX: Final[str] = f"/{TAG}"


router = APIRouter(prefix=PREFIX, tags=[TAG])


@router.post("", status_code=HTTPStatus.ACCEPTED)
async def register_student(
    student: Student,
    repository: RepositoryInterface = Depends(on_repository),
) -> None:
    """Зарегистрировать студента в системе."""
    await repository.add_student(student)


@router.get("")
async def get_students(repository: RepositoryInterface = Depends(on_repository)) -> list[Student]:
    """Получить список студентов."""
    return await repository.get_students()

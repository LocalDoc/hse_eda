from pydantic import BaseModel, ConfigDict

from src.domain.dtypes import Name, Surname


class Student(BaseModel):
    """Сущность студента."""

    name: Name
    surname: Surname

    model_config = ConfigDict(from_attributes=True)

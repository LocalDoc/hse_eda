from typing import Final

from fast_api_client.api.students.register_student_api_v1_students_post import sync as register
from fast_api_client.client import Client
from fast_api_client.models import Student

HOST: Final[str] = "http://localhost:8000"
PATH: Final[str] = "examples/students.csv"


def get_students() -> list[Student]:
    students = []

    with open(PATH) as file:
        for line in file:
            line = line.strip()

            name, surname = line.split(",")
            student = Student(name, surname)
            students.append(student)

    return students


def main() -> None:
    """Запустить скрипт."""
    client = Client(HOST)

    for student in get_students():
        # Инкапсулированный вызов нашего API
        register(client=client, body=student)


if __name__ == "__main__":
    main()

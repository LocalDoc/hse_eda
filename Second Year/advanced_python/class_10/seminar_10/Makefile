DOCKER-COMPOSE = docker compose
PYTHON = python -B

api:
	$(PYTHON) -m cli --start-api

# docker compose down: 
# This command stops and removes containers, networks, and (by default, not volumes) created by docker compose up.

# --remove-orphans: 
# This flag specifically targets and removes containers for services that are no longer defined in the docker-compose.yml file 
# but are still running or stopped within the project's scope. 
# These are considered "orphan" containers because they are no longer associated with a defined service.

# docker compose up --build:
# 1) It constructs or reconstructs Docker images for the services defined in your docker-compose.yml file that have a build instruction
# 2) After the images are built, it then creates and starts containers for all the services defined in your docker-compose.yml file, 
# using the newly built or existing images
docker:
	$(DOCKER-COMPOSE) down --remove-orphans
	$(DOCKER-COMPOSE) up --build

migrations-up:
	$(PYTHON) -m alembic upgrade head

migrations-make:
	$(PYTHON) -m alembic revision --autogenerate --message "..."

CODE_DIRS=cli_command
TEST_DIRS=tests
POETRY_COMMAND=cli-command

pre-commit: ## install pre-commit hooks defined in .pre-commit-config.yaml
	pre-commit install

deps: ## pre-install app dependencies
	pip3 freeze | grep poetry > /dev/null || echo "ERROR: Install system deps: pip3 install poetry setuptools wheel"
	poetry install
	touch $@

format: deps ## automatically format code according to PEP8 using isort and black
	poetry run isort $(CODE_DIRS) $(TEST_DIRS)
	poetry run black $(CODE_DIRS) $(TEST_DIRS)

lint: deps  ## run static code analysis (flake8, isort, black)
	poetry run flake8 $(CODE_DIRS) $(TEST_DIRS)
	poetry run isort --check-only $(CODE_DIRS) $(TEST_DIRS)
	poetry run black --check $(CODE_DIRS) $(TEST_DIRS)

type-check:  ## run mypy-based typing code checks
	poetry run mypy ${CODE_DIRS} ${TEST_DIRS}

all-checks: lint type-checks  ## run all available code checks

unit-tests: deps  ## run unit tests
	poetry run pytest -s -vv $(TEST_FILE)

cov: deps ## show test code coverage
	poetry run pytest -s -vv --cov=$(CODE_DIRS) $(TEST_FILE)

cov-html: deps  ## show test code coverage and generate HTML-based coverage report
	poetry run coverage html

checks: lint cov type-check

run: deps  ## run cli-command
	poetry run $(POETRY_COMMAND) $(OPTIONS)

install: deps  ## install cli-command globally in your system
	pip3 install .

clean: ## clean virtualenv deps etc.
	rm -rf .venv .pytest_cache .mypy_cache .coverage deps

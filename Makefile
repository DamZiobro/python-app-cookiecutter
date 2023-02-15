CODE_DIRS=cli_command
TEST_DIRS=tests
POETRY_COMMAND=cli-command

deps: ## install project dependencies
	pre-commit install || echo "Optionally install pre-commit tool using 'pip install pre-commit'"
	poetry --version || (echo "Install poetry using: 'pip install poetry setuptools wheel'" && false)
	poetry config virtualenvs.in-project true
	poetry install
	touch $@

format: deps ## format code according to PEP-8 style
	poetry run isort $(CODE_DIRS) $(TEST_DIRS)
	poetry run black $(CODE_DIRS) $(TEST_DIRS)

lint: deps ## check wehther code is formatted according to PEP-8 style
	poetry run flake8 $(CODE_DIRS) $(TEST_DIRS)
	poetry run isort --check-only $(CODE_DIRS) $(TEST_DIRS)
	poetry run black --check $(CODE_DIRS) $(TEST_DIRS)

type-check: ## check whether python annotations are properly assigned
	poetry run mypy ${CODE_DIRS} ${TEST_DIRS}

unit-tests: deps ## run unit tests
	poetry run pytest -s -vv $(TEST_FILE)

cov: deps ## run unit tests and should code coverage
	poetry run pytest -s -vv --cov=$(CODE_DIRS) $(TEST_FILE)

cov-html: deps ## run unit tests and generate HTML report showing code coverage
	poetry run coverage html

checks: lint cov type-check ## run all code checks

run: deps
	poetry run $(POETRY_COMMAND) $(OPTIONS)

install: deps
	pip3 install .

clean: ## clean project's venv and install everything from scratch
	rm -rf deps .venv

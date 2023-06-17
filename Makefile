CODE_DIRS={{cookiecutter.package_name}}
TEST_DIRS=tests
POETRY_COMMAND={{cookiecutter.command_name}}

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

run: deps  ## run {{cookiecutter.command_name}}
	poetry run $(POETRY_COMMAND) $(OPTIONS)

install: deps  ## install {{cookiecutter.command_name}} globally in your system
	pip3 install .

build: deps ## build python distribution and wheels
	poetry build

publish: deps build ## publish lib to the (PYPI_USERNAME and PYPI_PASSWORD env vars MUST be exported before publishing)
	@poetry publish --repository pypirepo --username $(PYPI_USERNAME) --password $(PYPI_PASSWORD)

docs: deps ## generate mkdocs-based documentation and save to site/index.html
	poetry run mkdocs build
	echo "Open the docs using ex. 'firefox site/index.html'"

docs-run: deps ## run mkdocs-based doc in the local server
	poetry run mkdocs serve

clean: ## clean virtualenv deps etc.
	rm -rf .venv .pytest_cache .mypy_cache .coverage deps site
	find . -type f -name "*.pyc" | xargs rm -fr
	find . -type d -name __pycache__ | xargs rm -fr

.PHONY: docs

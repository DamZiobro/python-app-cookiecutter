Python App Cookiecutter
===

**Template of Python app based on [cookiecutter](https://cookiecutter.readthedocs.io/en/stable/README.html) by [Damian Ziobro](https://github.com/DamZiobro)**

It includes:

* **[poetry](https://python-poetry.org/)-based dependency and virtual machines management**
* **[pytest](https://docs.pytest.org/en/7.3.x/)**-based unit tests with **code coverage report** and **HTML-based test report**
* **static code analysis (linting)** ([blake](https://github.com/psf/black), [isort](https://pycqa.github.io/isort/), [flake8](https://flake8.pycqa.org/en/latest/), [mypy](https://mypy.readthedocs.io/en/stable/))
* **CI/CD** including linting and unit tests checks (integrated with **[GitHub Actions](https://github.com/features/actions)** according to **[Git Flow](https://www.atlassian.com/git/tutorials/comparing-workflows/gitflow-workflow)** rules)
* **[Makefile](https://www.gnu.org/software/make/)** with most useful **preconfigured** development and CI/CD **commands**
* **[mkdocs](https://www.mkdocs.org/getting-started/)**-based automatically generated **documentation** (use `make docs` or `make docs-run`)
* **[pre-commit](https://pre-commit.com/)**-based code **checks during git commit**
* **[poetry](https://python-poetry.org/)-based** - **publishing to [PyPi](https://pypi.org/)**


### Getting started

Create Python project based on this template using [cookiecutter](https://cookiecutter.readthedocs.io/en/stable/README.html):
```
cookiecutter https://github.com/DamZiobro/python-app-cookiecutter
```

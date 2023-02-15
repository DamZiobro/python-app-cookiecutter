Skeleton of Python CLI app
==


Skeleton of Python CLI app project including:
* **poetry-based dependency and virtual machines management**
* unit tests with **code coverage report**
* **linting** (blake, isort, flake8, mypy) 
* **CI/CD** including linting and unit tests checks (integrated with GitHub Actions
  according to Git Flow rules)
* **Makefile** with most useful preconfigured development and CI/CD commands

Pre-install dependencies
==

1. [poetry](https://python-poetry.org/) - requirements manager and virtualenv management tool
2. [python 3.8+](https://www.python.org/) - python pre-installed on your machine
3. [pre-commit](https://pre-commit.com/) - (optional) development dependency for checking code quality before commit

Run locally
---

One command `make run` for:
* creating virtualenv using `poetry` (one off action)
* install all the python [requirements](./pyproject.toml) inside the virtualenv (one off action)
* install CLI app locally inside virtualenv and run it

Install CLI app globally and run
---

```
make install
cli-command --version
cli-command
```

All dev and run commands
---
* **make deps** install project dependencies

Skeleton of Python CLI app
==

Skeleton of Python CLI app project including:
* poetry-based dependency and virtual machines management
* unit tests with code coverage
* linting 
* CI including linting and unit tests checks (integrated with GitHub Actions
  according to Git Flow rules)
* Makefile with most useful preconfigured development and CI/CD commands


Run locally
---

```
make run
```


Install globally and run
---

```
make install
cli-command --version
cli-command
```

Checks
---
```
make lint
make cov
```

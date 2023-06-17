"""Unit tests of {{cookiecutter.command_name}}."""

import pytest

from click.testing import CliRunner

from {{cookiecutter.package_name}}.cli import (
    version,
    hello_world,
)


@pytest.fixture
def cli_runner():
    return CliRunner()

def test_version(cli_runner):
    """Verify version."""
    result = cli_runner.invoke(version)
    assert result.exit_code == 0
    assert result.output.strip() == "0.0.1"


def test_{{cookiecutter.package_name}}_returns_hello_world(cli_runner):
    """Verify output of fetch function."""
    result = cli_runner.invoke(hello_world)
    assert result.exit_code == 0
    assert result.output.strip() == "hello world"


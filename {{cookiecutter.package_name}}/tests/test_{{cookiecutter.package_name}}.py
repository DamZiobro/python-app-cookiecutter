"""Unit tests of bcl-uploads-fetcher."""

from unittest.mock import patch

import fire
from {{cookiecutter.package_name}}.command import (
    cli,
    main,
)


@patch("fire.Fire")
def test_main_triggers_fire(mock_fire):
    """Verify fire is triggered from main."""
    main()
    mock_fire.assert_called()


def test_version(capsys):
    """Verify version."""
    fire.Fire(cli, ["--version"])
    cli_output = capsys.readouterr().out
    assert "0.0.1" in cli_output


def test_{{cookiecutter.package_name}}_returns_hello_world(capsys):
    """Verify output of fetch function."""
    fire.Fire(cli, [])
    cli_output = capsys.readouterr().out
    assert "hello world" in cli_output

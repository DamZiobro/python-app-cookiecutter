"""Implementation of {{cookiecutter.command_name}} tool."""

import importlib.metadata

import fire


def command():
    """Add of the actual {{cookiecutter.command_name}}."""
    return "hello world"


def get_version():
    """Return version of this tool."""
    return importlib.metadata.version("{{cookiecutter.package_name}}")


def cli(version=None):
    """Build all CLI commands."""
    if version:
        return get_version()

    return command()


def main():
    """Assign CLI to 'fire' module."""
    fire.Fire(cli)

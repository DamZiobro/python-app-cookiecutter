"""Implementation of bcl-uploads-fetcher tool."""

import importlib.metadata

import fire


def command():
    """Implementation of the actual command."""
    return "hello world"


def get_version():
    """Return version of this tool."""
    return importlib.metadata.version("cli-command")


def cli(version=None):
    """Build CLI commands."""
    if version:
        return get_version()

    return command()


def main():
    """Assign CLI to 'fire' module."""
    fire.Fire(cli)

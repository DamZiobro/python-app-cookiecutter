import importlib.metadata

import click


@click.group()
def cli():
    pass


@cli.command()
def hello_world():
    """Hello world."""
    click.echo("hello_world")


@cli.command()
def version():
    """Return version of this tool."""
    click.echo(importlib.metadata.version("{{cookiecutter.package_name}}"))

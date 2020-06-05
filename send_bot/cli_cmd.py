import click
from .send_message import send

@click.command()
@click.argument('message', nargs=1, type=click.STRING)
def cli(message):
    send(message)
    print("---- Done ------")


if __name__ == '__main__':
    cli()

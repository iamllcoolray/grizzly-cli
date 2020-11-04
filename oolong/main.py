from core.version import get_version
import argparse

VERSION = get_version()

parser = argparse.ArgumentParser(prog="oolong", description="Oolong is a command-line interface that will output the stock qoute of the given symbol")

parser.add_argument('-v', '--version', action='version', help='Displays Oolong\'s version number', version='Oolong - version '+VERSION)
parser.add_argument('-q', '--quote', action='store', help='Displays the stock quote of a given symbol', type=str)

args = parser.parse_args()
print(args.quote)
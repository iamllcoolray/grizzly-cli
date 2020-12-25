from core.version import get_version
from data.stockdata import stock_data
import argparse

VERSION = get_version()

parser = argparse.ArgumentParser(prog="oolong", description="Oolong is a command-line application that will output the stock qoute of the given symbol")

parser.add_argument('-v', '--version', action='version', help='displays Oolong\'s version number', version='Oolong - version '+VERSION)
parser.add_argument('-q', '--quote', action='store', help='displays the stock quote of a given symbol', type=str, nargs='?', metavar='symbol')

args = parser.parse_args()

if (args.quote is None):
    args.quote = ["msft", "ibm", "wm", "ko", "emr", "brk-a", "brk-b", "wmt", "aapl", "hrl", "gpc", "jnj", "ba", "bac", "pnc", "wfc", "low", "xom", "pep", "axp", "cvs", "mmm", "cvx", "csco", "orcl", "v", "ma", "mcd", "afl", "wba", "atvi", "cmcsa", "qcom", "intc", "msi", "nvda", "sbux", "t", "vz", "txn", "unp"]
    for i in args.quote:
        stock_data(i)
else:
    stock_data(args.quote)
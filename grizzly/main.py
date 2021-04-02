from core.version import get_version
from data.stockdata import stock_data
import argparse
import webbrowser

VERSION = get_version()

parser = argparse.ArgumentParser(prog="grizzly", description="Grizzly is a command-line application that will output the stock qoute of the given symbol")

parser.add_argument('-v', '--version', action='version', help='displays %(prog)s\'s version number', version='%(prog)s - version '+VERSION)
parser.add_argument('-q', '--quote', action='store', help='displays the stock quote of a given symbol', type=str, nargs='?', metavar='symbol')
parser.add_argument('-n', '--news', action='store', help='displays the stock news in browser of a given symbol', nargs='?', metavar='symbol')

args = parser.parse_args()

if (args.quote):
    stock_data(args.quote)

if (args.news):
    webbrowser.open_new_tab('https://finance.yahoo.com/quote/'+args.news+'/?p='+args.news)
    webbrowser.open_new_tab('https://www.marketwatch.com/investing/stock/'+args.news+'?mod=quote_search')

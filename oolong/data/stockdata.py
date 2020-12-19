import requests
import pandas as pd
from requests.exceptions import HTTPError
from tabulate import tabulate

class Quote:
    def __init__(self, symbol):
        self.symbol = symbol

    def stock_data(self):
        try:
            url = "https://query1.finance.yahoo.com/v7/finance/quote?symbols=" + self.symbol
            r = requests.get(url)
            json_data = r.json()

            df = pd.DataFrame(json_data['quoteResponse']['result'])
            df_renamed = df.rename(columns={"symbol": "Symbol", "longName": "Company", "regularMarketPrice": "Price", "regularMarketOpen": "Open", "regularMarketDayLow": "Low", "regularMarketDayHigh": "High", "regularMarketPreviousClose": "Previous Close", "fiftyTwoWeekLow": "52 Week Low", "fiftyTwoWeekHigh": "52 Week High", "trailingPE": "PE (ttm)", "trailingAnnualDividendRate": "Dividend Rate (ttm)", "trailingAnnualDividendYield": "Dividend Yield (ttm)", "epsTrailingTwelveMonths": "EPS (ttm)"})
            symbol_columns = ['Symbol', 'Company']
            symbol_selections = df_renamed[symbol_columns]
            symbol_table = tabulate(symbol_selections, showindex=False, headers=symbol_selections.columns, tablefmt="fancy_grid")
            print(symbol_table)

            pricings_columns = ['Price', '52 Week Low', '52 Week High']
            pricings_selections = df_renamed[pricings_columns]
            pricings_table = tabulate(pricings_selections, showindex=False, headers=pricings_selections.columns, tablefmt="fancy_grid")
            print(pricings_table)

            olhc_columns = ['Open', 'Low', 'High', 'Previous Close']
            olhc_selections = df_renamed[olhc_columns]
            olhc_table = tabulate(olhc_selections, showindex=False, headers=olhc_selections.columns, tablefmt="fancy_grid")
            print(olhc_table)

            trailing_columns = ['Dividend Rate (ttm)', 'Dividend Yield (ttm)', 'PE (ttm)', 'EPS (ttm)']
            trailing_selections = df_renamed[trailing_columns]
            trailing_table = tabulate(trailing_selections, showindex=False, headers=trailing_selections.columns, tablefmt="fancy_grid")
            print(trailing_table)

        except HTTPError as http_err:
            print(f'HTTP error occurred: {http_err}')
        except Exception as err:
            print(f'Other error occurred: {err}')
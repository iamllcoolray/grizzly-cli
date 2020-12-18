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
            df_renamed = df.rename(columns={"symbol": "Symbol", "displayName": "Company Name", "regularMarketPrice": "Price", "regularMarketOpen": "Open", "regularMarketDayLow": "Low", "regularMarketDayHigh": "High", "regularMarketPreviousClose": "Previous Close", "fiftyTwoWeekLow": "52 Week Low", "fiftyTwoWeekHigh": "52 Week High"})
            selections = df_renamed[['Symbol', 'Company Name', 'Price', 'Open', 'Low', 'High', 'Previous Close', '52 Week Low', '52 Week High']]
            table = tabulate(selections, showindex=False, headers=selections.columns, tablefmt="fancy_grid")
            print(table)

        except HTTPError as http_err:
            print(f'HTTP error occurred: {http_err}')
        except Exception as err:
            print(f'Other error occurred: {err}')
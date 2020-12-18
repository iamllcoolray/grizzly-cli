import requests
import pandas as pd
from requests.exceptions import HTTPError

class Quote:
    def __init__(self, symbol):
        self.symbol = symbol

    def stock_data(self):
        try:
            url = "https://query1.finance.yahoo.com/v7/finance/quote?symbols=" + self.symbol
            r = requests.get(url)
            json_data = r.json()
            df = pd.DataFrame(json_data['quoteResponse']['result'])
            df_rename = df.rename(columns={"symbol": "Symbol", "displayName": "Company Name"})
            selections = df_rename[['Symbol', 'Company Name']]
            print(selections)

        except HTTPError as http_err:
            print(f'HTTP error occurred: {http_err}')
        except Exception as err:
            print(f'Other error occurred: {err}')
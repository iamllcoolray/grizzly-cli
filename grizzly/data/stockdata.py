import requests
from requests.exceptions import HTTPError
from display.table import display_table

def stock_data(symbol):
    try:
        url = "https://query1.finance.yahoo.com/v7/finance/quote?symbols=" + symbol
        r = requests.get(url)
        json_data = r.json()
        display_table(json_data)

    except HTTPError as http_err:
        print(f'HTTP error occurred: {http_err}')
    except Exception as err:
        print(f'Other error occurred: {err}')
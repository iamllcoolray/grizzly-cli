import requests

class Quote:
    def __init__(self, symbol):
        self.symbol = symbol

    def stock_data(self):
        url = requests.get("https://query1.finance.yahoo.com/v7/finance/quote?symbols=" + self.symbol)
        data = url.json()

        try:
            jsonResponse = data
            print("Entire JSON response")
            print(jsonResponse["quoteResponse"]["result"][0])

        except HTTPError as http_err:
            print(f'HTTP error occurred: {http_err}')
        except Exception as err:
            print(f'Other error occurred: {err}')
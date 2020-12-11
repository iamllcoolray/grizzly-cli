import requests

class Quote:
    def __init__(self, symbol):
        self.symbol = symbol

    def stock_data(self):
        url = requests.get("https://query1.finance.yahoo.com/v7/finance/quote?symbols=" + self.symbol)
        data = url.json()
        print(data)
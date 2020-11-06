import json
import requests

class Quote:
    def __init__(self, symbol):
        self.symbol = symbol

    def stock_symbol(self):
        print(self.symbol)
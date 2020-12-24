import pandas as pd
from tabulate import tabulate



def display_table(symbol):
    json_data = symbol

    df = pd.DataFrame(json_data['quoteResponse']['result'])
    df_renamed = df.rename(columns={"symbol": "Symbol", "longName": "Company", "regularMarketPrice": "Price", "regularMarketOpen": "Open", "regularMarketDayLow": "Low", "regularMarketDayHigh": "High", "regularMarketPreviousClose": "Previous Close", "fiftyTwoWeekLow": "52 Week Low", "fiftyTwoWeekHigh": "52 Week High", "trailingPE": "PE (ttm)", "trailingAnnualDividendRate": "Dividend Rate (ttm)", "trailingAnnualDividendYield": "Dividend Yield (ttm)", "epsTrailingTwelveMonths": "EPS (ttm)"})

    symbol_columns = ['Symbol', 'Company', 'Price', 'Open', 'Low', 'High', 'Previous Close', '52 Week Low', '52 Week High']
    symbol_selections = df_renamed[symbol_columns]
    symbol_table = tabulate(symbol_selections, showindex=False, headers=symbol_selections.columns, tablefmt="fancy_grid")
    print(symbol_table)

    #trailing_columns = ['Dividend Rate (ttm)', 'Dividend Yield (ttm)', 'PE (ttm)', 'EPS (ttm)']
    #trailing_selections = df_renamed[trailing_columns]
    #trailing_table = tabulate(trailing_selections, showindex=False, headers=trailing_selections.columns, tablefmt="fancy_grid")
    #print(trailing_table)
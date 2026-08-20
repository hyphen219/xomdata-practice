# Xom Data · Highest price in the list
# Problem: https://xomdata.com/practice/py-max-price
# Solved: 2026-08-20

def highest_price(prices):
    highest = 0
    for p in prices:
        if p > highest:
            highest = p
    return highest

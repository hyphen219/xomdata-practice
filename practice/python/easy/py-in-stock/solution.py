# Xom Data · Count in-stock products
# Problem: https://xomdata.com/practice/py-in-stock
# Solved: 2026-08-22

def count_in_stock(quantities):
    i = 0
    for q in quantities:
        if q > 0:
            i += 1
    return i

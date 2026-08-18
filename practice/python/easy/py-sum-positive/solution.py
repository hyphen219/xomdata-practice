# Xom Data · Total receipts
# Problem: https://xomdata.com/practice/py-sum-positive
# Solved: 2026-08-18

def sum_positive(numbers):
    total = 0
    for i in numbers:
        if i > 0:
            total += i
    return total

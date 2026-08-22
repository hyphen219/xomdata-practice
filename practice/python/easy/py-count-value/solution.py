# Xom Data · Count occurrences of a code
# Problem: https://xomdata.com/practice/py-count-value
# Solved: 2026-08-22

def count_value(items, target):
    i = 0
    for item in items:
        if item == target:
            i += 1
    return i

# Xom Data · Count products with an even code
# Problem: https://xomdata.com/practice/py-count-even
# Solved: 2026-08-16

def count_even(numbers):
    i = 0
    for num in numbers:
        if num % 2 == 0:
            i = i + 1
    return i

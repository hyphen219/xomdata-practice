# Xom Data · Count digits in the password
# Problem: https://xomdata.com/practice/py-count-digits
# Solved: 2026-08-18

def count_digits(text):
    list_word = list(text)
    i = 0
    for digit in list_word:
        if digit.isdigit():
            i = i + 1
    return i

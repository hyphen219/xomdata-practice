# Xom Data · Average score by subject
# Problem: https://xomdata.com/practice/py-average
# Solved: 2026-08-11

def average_score(scores):
    total = sum(scores)
    num = len(scores)
    if num > 0:
        avg = round(total/num, 2)
    else:
        avg = 0
    return avg

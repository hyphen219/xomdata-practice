# Xom Data · Completion rate of a delivery team
# Problem: https://xomdata.com/practice/py-completion-rate
# Solved: 2026-08-19

def completion_rate(done, total):
    if total != 0:
        return round(done*100.0/total, 2)
    if total == 0:
        return 0.0

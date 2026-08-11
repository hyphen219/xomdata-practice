# Xom Data · Pull a sensor reading back into range
# Problem: https://xomdata.com/practice/py-clamp-value
# Solved: 2026-08-11

def clamp(value, low, high):
    if value is None:
        return low
    elif value >= high:
        return high
    elif value <= low:
        return low
    else:
        return value

# Xom Data · Check triangle sides
# Problem: https://xomdata.com/practice/py-triangle-valid
# Solved: 2026-08-24

def is_triangle(a, b, c):
    if a + b > c:
        return True
    else:
        return False

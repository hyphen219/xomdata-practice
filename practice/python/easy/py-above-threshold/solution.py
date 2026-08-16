# Xom Data · Count students above the benchmark
# Problem: https://xomdata.com/practice/py-above-threshold
# Solved: 2026-08-16

def count_above(numbers, threshold):
    i = 0
    for num in numbers:
        if num > threshold:
            i = i + 1
    return i

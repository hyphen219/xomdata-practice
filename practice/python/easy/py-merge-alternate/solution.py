# Xom Data · Alternate-merge two lists
# Problem: https://xomdata.com/practice/py-merge-alternate
# Solved: 2026-09-05

def merge_alternate(list1, list2):
    final = []
    for i in range(max(len(list1), len(list2))):
        if i < len(list1):        
            final.append(list1[i])
        if i < len(list2):
            final.append(list2[i])
    return final

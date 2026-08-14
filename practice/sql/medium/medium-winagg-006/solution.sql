-- Xom Data · Each expense's share of the fund
-- Problem: https://xomdata.com/practice/medium-winagg-006
-- Solved: 2026-08-14

-- Viết SQL của bạn ở đây
with fin as(
    select
        expense_name,
        amount,
        sum(amount) over() as total_all
    from fund_expenses
)
select
    expense_name,
    amount,
    round(amount*100.0/total_all, 2) as pct_of_total
from fin
order by amount desc, expense_name asc;

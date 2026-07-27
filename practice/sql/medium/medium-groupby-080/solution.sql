-- Xom Data · Monthly income and expense report
-- Problem: https://xomdata.com/practice/medium-groupby-080
-- Solved: 2026-07-27

with info as (
    select
        strftime('%Y-%m', transaction_date) as month,
        sum(case when type = 'Thu' then amount else null end) as total_income,
        sum(case when type = 'Chi' then amount else null end) as total_expense
    from transactions
    group by strftime('%Y-%m', transaction_date)
)
select
    month,
    coalesce(total_income, 0) as total_income,
    coalesce(total_expense, 0) as total_expense,
    (coalesce(total_income, 0) - coalesce(total_expense, 0)) as balance,
    sum(coalesce(total_income, 0) - coalesce(total_expense, 0)) over(order by month asc) as cumulative_balance,
    CASE
    when (coalesce(total_income, 0) - coalesce(total_expense, 0)) > 0 then 'Surplus'
    when (coalesce(total_income, 0) - coalesce(total_expense, 0)) = 0 then 'Balanced'
    else 'Deficit' end as status
from info
order by month asc;

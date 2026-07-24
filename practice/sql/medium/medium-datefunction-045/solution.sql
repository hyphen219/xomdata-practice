-- Xom Data · Transaction count and amount by month
-- Problem: https://xomdata.com/practice/medium-datefunction-045
-- Solved: 2026-07-24

with tran as (
    select strftime('%Y-%m', transaction_date) as month,
           count(id) as transaction_count,
           sum(amount) as total_amount,
           lag(sum(amount)) over(order by strftime('%Y-%m', transaction_date)) as lag
    from transactions
    group by month
)
select month,
       transaction_count,
       total_amount,
       (total_amount - lag) as mom_delta
from tran
order by month asc;

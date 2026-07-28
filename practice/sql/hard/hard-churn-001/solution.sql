-- Xom Data · Churned and returning customers
-- Problem: https://xomdata.com/practice/hard-churn-001
-- Solved: 2026-07-28

with info as (
    select
        user_id,
        order_date,
        lag(order_date, 1) over(partition by user_id order by order_date asc) as last_order
    from orders
), fin as (
select
    user_id,
    i.last_order as prev_order,
    i.order_date as next_order,
    julianday(i.order_date) - julianday(i.last_order) as gap_days
from info i
where last_order is not NULL
)
select
    user_id,
    prev_order,
    next_order,
    gap_days
from fin
where gap_days >= 90
order by gap_days desc, user_id asc;

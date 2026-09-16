-- Xom Data · Sổ đen những khách đã im lặng quá lâu
-- Problem: https://xomdata.com/practice/medium-churn-004
-- Solved: 2026-09-16

with fin as(
    select
        customer_id,
        max(order_date) as last_order_date
    from orders
    group by customer_id
)
select
    customer_id,
    last_order_date,
    julianday('2024-06-30') - julianday(last_order_date) as days_silent
from fin
where julianday('2024-06-30') - julianday(last_order_date) > 90
order by days_silent desc, customer_id asc;

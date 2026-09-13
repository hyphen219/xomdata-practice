-- Xom Data · Khoảng lặng giữa hai lần mua liền kề
-- Problem: https://xomdata.com/practice/medium-gap-001
-- Solved: 2026-09-13

with fin as(
    select
        customer_id,
        order_date,
        lag(order_date) over(partition by customer_id order by order_date) as prev,
        row_number() over(partition by customer_id order by order_date) as rn
    from orders
)
select
    customer_id,
    order_date,
    julianday(order_date) - julianday(prev) as days_since_prev
from fin
where rn > 1
order by customer_id asc, order_date asc, days_since_prev asc

-- Xom Data · Tháng vàng của từng khách
-- Problem: https://xomdata.com/practice/medium-frequency-003
-- Solved: 2026-09-15

with fin as(
    select
        customer_id,
        strftime('%Y-%m', order_date) as month,
        count(order_id) as orders,
        row_number() over(partition by customer_id order by count(order_id) desc, strftime('%Y-%m', order_date) asc) as rn
    from orders
    group by customer_id, month
)
select
    customer_id,
    month as best_month,
    orders as orders_in_month
from fin
where rn = 1

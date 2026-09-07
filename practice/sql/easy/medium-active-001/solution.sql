-- Xom Data · Nhịp khách ghé cửa hàng theo tháng
-- Problem: https://xomdata.com/practice/medium-active-001
-- Solved: 2026-09-07

with fin as(
    select
        customer_id,
        strftime('%Y-%m', order_date) as month
    from orders
)
select
    month,
    count(distinct customer_id) as active_customers
from fin
group by month

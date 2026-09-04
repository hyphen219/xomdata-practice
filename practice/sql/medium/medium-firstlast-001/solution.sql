-- Xom Data · Lần đầu và lần gần nhất của mỗi khách
-- Problem: https://xomdata.com/practice/medium-firstlast-001
-- Solved: 2026-09-04

select distinct
    customer_id,
    min(order_date) over(partition by customer_id) as first_order_date,
    max(order_date) over(partition by customer_id) as last_order_date
from orders

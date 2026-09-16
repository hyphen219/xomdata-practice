-- Xom Data · Khách năng ghé trong nửa năm qua
-- Problem: https://xomdata.com/practice/medium-frequency-001
-- Solved: 2026-09-16

select
    customer_id,
    count(order_id) as order_count
from orders
where order_date between '2024-01-01' and '2024-06-30'
group by customer_id
order by order_count desc, customer_id asc;

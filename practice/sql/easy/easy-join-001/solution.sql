-- Xom Data · Orders with customer names
-- Problem: https://xomdata.com/practice/easy-join-001
-- Solved: 2026-08-06

-- Viết SQL của bạn ở đây
select
    order_code,
    customer_name,
    sum(amount) as amount
from customers c
join orders o on c.id = o.customer_id
group by order_code, customer_name;

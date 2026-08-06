-- Xom Data · Customers who ever bought skincare
-- Problem: https://xomdata.com/practice/easy-join-006
-- Solved: 2026-08-06

-- Viết SQL của bạn ở đây
select distinct
    customer_name
from customers c
left join purchases p on c.id = p.customer_id
where category = 'Skincare'

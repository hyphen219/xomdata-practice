-- Xom Data · The customer's total next to every order
-- Problem: https://xomdata.com/practice/medium-winjoin-002
-- Solved: 2026-08-10

-- Viết SQL của bạn ở đây
select
    customer_name,
    order_date,
    amount,
    sum(amount) over(partition by customer_name) as customer_total
from customers c
join orders o on c.id = o.customer_id
order by customer_name asc, order_date asc;

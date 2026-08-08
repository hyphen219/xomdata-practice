-- Xom Data · First purchase date next to every order
-- Problem: https://xomdata.com/practice/medium-firstval-002
-- Solved: 2026-08-08

-- Viết SQL của bạn ở đây
select
    customer_name,
    order_date,
    amount,
    FIRST_VALUE(order_date) over(partition by customer_name order by order_date asc) as first_order_date
from orders
order by customer_name asc, order_date asc;

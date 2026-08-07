-- Xom Data · The customer's joining month on every order
-- Problem: https://xomdata.com/practice/medium-cohort-001
-- Solved: 2026-08-07

-- Viết SQL của bạn ở đây
select
    customer_name,
    order_date,
    min(strftime('%Y-%m', order_date)) over(PARTITION BY customer_name) as cohort_month
from orders
order by customer_name, order_date asc;

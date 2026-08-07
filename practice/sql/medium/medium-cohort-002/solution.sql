-- Xom Data · Opening order or returning order
-- Problem: https://xomdata.com/practice/medium-cohort-002
-- Solved: 2026-08-07

-- Viết SQL của bạn ở đây
with inf as (
    select
        customer_name,
        order_date,
        amount,
        min(order_date) over(partition by customer_name) as first_order
    from orders
)
select
    customer_name,
    order_date,
    amount,
    case
    when order_date = first_order then 'New'
    else 'Returning' end as order_type
from inf
order by customer_name asc, order_date asc;

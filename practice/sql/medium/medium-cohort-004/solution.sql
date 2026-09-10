-- Xom Data · Mỗi thế hệ khách đông cỡ nào
-- Problem: https://xomdata.com/practice/medium-cohort-004
-- Solved: 2026-09-10

with fin as (
    select
        customer_id,
        order_date,
        row_number() over(partition by customer_id) as rn
    from orders
),final as(
    select
        customer_id,
        strftime('%Y-%m', order_date) as month
    from fin
    where rn = 1
)
select
    month as cohort_month,
    count(customer_id) as cohort_size
from final
group by month

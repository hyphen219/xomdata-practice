-- Xom Data · Khách chuyên cần đủ bốn mùa
-- Problem: https://xomdata.com/practice/medium-repeat-006
-- Solved: 2026-09-13

with fin as(
    select
        customer_id,
        order_date,
        case
        when strftime('%m', order_date) >= '10' then 4
        when strftime('%m', order_date) >= '07' then 3
        when strftime('%m', order_date) >= '04' then 2
        when strftime('%m', order_date) >= '01' then 1
        else null
        end as quarter
    from orders
    where strftime('%Y', order_date) = '2024'
)
select
    customer_id,
    count(order_date) as orders_2024
from fin
group by customer_id
having (
    count(distinct quarter) = 4
)

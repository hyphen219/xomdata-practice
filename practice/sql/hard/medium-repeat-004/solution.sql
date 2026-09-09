-- Xom Data · Chốt được đơn thứ hai trong một tháng
-- Problem: https://xomdata.com/practice/medium-repeat-004
-- Solved: 2026-09-09

with fi as(
    SELECT
        customer_id,
        order_date,
        row_number() over(partition by customer_id order by order_date) as num
    from orders
),fin as(
    select
        customer_id,
        order_date,
        lead(order_date) over(partition by customer_id) as second_order_date
    from fi
    where num in (1, 2)
),final as(
    select
        customer_id,
        order_date as first_order_date,
        second_order_date
    from fin
    where second_order_date is not null
)
select
    customer_id,
    first_order_date,
    second_order_date,
    julianday(second_order_date) - julianday(first_order_date) as days_to_second
from final
where julianday(second_order_date) - julianday(first_order_date) <= 30 and julianday(second_order_date) - julianday(first_order_date) >= 0
order by customer_id asc

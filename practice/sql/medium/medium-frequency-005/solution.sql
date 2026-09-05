-- Xom Data · Khách phủ sóng nhiều tháng nhất
-- Problem: https://xomdata.com/practice/medium-frequency-005
-- Solved: 2026-09-05

with fin as(
    select
        customer_id,
        count(distinct strftime('%Y-%m', order_date)) as active_months
    from orders
    group by customer_id
),
fini as(
    select
        customer_id,
        count(order_id) as total_orders
    from orders
    group by customer_id
)
select
    f.customer_id,
    active_months,
    total_orders
from fin f
join fini fi on f.customer_id = fi.customer_id
order by active_months desc, f.customer_id asc;

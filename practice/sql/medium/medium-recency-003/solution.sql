-- Xom Data · Bảng xếp hạng độ tươi của khách
-- Problem: https://xomdata.com/practice/medium-recency-003
-- Solved: 2026-09-08

with fin as(
    select
        customer_id,
        max(order_date) as last_order_date
    from orders
    group by customer_id
)
select
    customer_id,
    last_order_date,
    rank() over(order by last_order_date desc) as freshness_rank
from fin

-- Xom Data · Bức tranh phân bố mức độ gắn bó
-- Problem: https://xomdata.com/practice/medium-frequency-004
-- Solved: 2026-08-28

with fin as(
    select
        customer_id,
        count(customer_id) as num_order,
        case
        when count(customer_id) >= 3 then '3+ orders'
        when count(customer_id) = 2 then '2 orders'
        else '1 order' end as engagement_bucket
    from orders
    group by customer_id
)
select
    engagement_bucket,
    count(num_order) as customer_count
from fin
group by engagement_bucket

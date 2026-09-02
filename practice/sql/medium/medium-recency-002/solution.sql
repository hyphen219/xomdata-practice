-- Xom Data · Ba mươi ngày vắng bóng
-- Problem: https://xomdata.com/practice/medium-recency-002
-- Solved: 2026-09-02

with fin as(
    select
        customer_id,
        order_date,
        row_number() over(partition by customer_id order by order_date desc) as num
    from orders
),
final as(
    select
        customer_id,
        order_date,
        julianday('2024-06-30') - julianday(order_date) as diff
    from fin
    where num = 1
)
select 
    customer_id,
    order_date as last_order_date
from final
where diff > 30;

-- Xom Data · Bao lâu rồi khách chưa quay lại
-- Problem: https://xomdata.com/practice/medium-recency-001
-- Solved: 2026-08-28

with final as(
    select customer_id,
        max(order_date) over(partition by customer_id) as last_order_date
    from orders
    
)
select distinct
    customer_id,
    last_order_date,
    julianday('2024-06-30') - julianday(last_order_date) as days_since
from final
order by days_since asc, customer_id asc

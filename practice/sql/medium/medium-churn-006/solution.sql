-- Xom Data · Bức ảnh tệp khách tại một thời điểm
-- Problem: https://xomdata.com/practice/medium-churn-006
-- Solved: 2026-09-16

with fin as(
    select
        customer_id,
        case
        when min(strftime('%Y-%m', order_date)) = '2024-06' then 'new'
        when julianday('2024-06-30') - julianday(max(order_date)) > 90 and min(strftime('%Y-%m', order_date)) != '2024-06' then 'churned'
        when min(strftime('%Y-%m', order_date)) != '2024-06' then 'active' end as segment
    from orders
    group by customer_id
)
select
    segment,
    count(customer_id) as customer_count
from fin
group by segment

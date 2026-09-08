-- Xom Data · Kênh nào đang giữ được hơi ấm
-- Problem: https://xomdata.com/practice/medium-recency-005
-- Solved: 2026-09-08

with fin as(
    select
        channel,
        customer_name as customers,
        max(order_date) as recent
    from customers c
    join orders o on c.customer_id = o.customer_id
    group by c.customer_id
),final as(
    select
        channel,
        customers,
        julianday('2024-06-30') - julianday(recent) as days_silent
    from fin
)
select
    channel,
    count(customers) as customers,
    round(avg(days_silent), 2) as avg_days_silent
from final
group by channel

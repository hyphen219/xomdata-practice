-- Xom Data · Doanh thu đội nón ra đi cùng khách cũ
-- Problem: https://xomdata.com/practice/medium-churn-007
-- Solved: 2026-09-16

with fin as(
    select
        customer_id,
        order_date,
        sum(amount) lost_revenue,
        julianday('2024-06-30') - julianday(max(order_date)) as days_since
    from orders
    group by customer_id 
)

select
    customer_id,
    max(order_date) as last_order_date,
    lost_revenue
from fin
where days_since > 90
group by customer_id
order by lost_revenue desc, customer_id asc;

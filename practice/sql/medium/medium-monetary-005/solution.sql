-- Xom Data · Miếng bánh doanh thu của từng khách
-- Problem: https://xomdata.com/practice/medium-monetary-005
-- Solved: 2026-08-30

with fin as(
    select
        customer_id,
        sum(amount) as total_spent
    from orders
    group by customer_id
), final as(
    select
        customer_id,
        total_spent,
        sum(total_spent) over() as revenue
    from fin
)
select
    customer_id,
    total_spent,
    round(total_spent*100.0/revenue, 2) as revenue_share_pct
from final

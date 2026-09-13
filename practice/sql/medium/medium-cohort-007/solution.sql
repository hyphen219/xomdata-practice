-- Xom Data · Ai nhập hội đúng mùa khuyến mãi
-- Problem: https://xomdata.com/practice/medium-cohort-007
-- Solved: 2026-09-13

with fin as(
    select
        customer_id,
        count(case
                when strftime('%Y-%m', order_date) = '2024-03' then order_id
                else null end) as campaign_orders
    from orders
    group by customer_id
), final as(
select
    customer_id,
    min(order_date) as first_order_date
from orders
group by customer_id
having strftime('%Y-%m', order_date) = '2024-03'
)
select
    f1.customer_id,
    first_order_date,
    campaign_orders
from fin f1
join final f2 on f1.customer_id = f2.customer_id

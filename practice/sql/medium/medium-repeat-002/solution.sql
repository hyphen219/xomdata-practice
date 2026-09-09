-- Xom Data · Cửa hàng giữ được bao nhiêu phần khách
-- Problem: https://xomdata.com/practice/medium-repeat-002
-- Solved: 2026-09-09

with fin as(
    select
        customer_id,
        count(order_id) as num_order
    from orders
    group by customer_id
), final as(
    select
        count(case
        when num_order >= 2 then customer_id
        else null end) as repeat,
        count(customer_id) as total_customer
    from fin
)
select
    round(repeat*100.0/total_customer, 2) as repeat_rate_pct
from final

-- Xom Data · Khách một lần ghé và khách quay lại
-- Problem: https://xomdata.com/practice/medium-repeat-001
-- Solved: 2026-09-01

with fin as(
    select
        customer_id,
        count(customer_id) as num
    from orders
    group by customer_id
),
final as(
    select
        case
        when num = 1 then 'one-time'
        else 'repeat' end as customer_type,
        num
    from fin
)
select
    customer_type,
    count(customer_type) as customer_count
from final
group by customer_type

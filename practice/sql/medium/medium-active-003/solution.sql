-- Xom Data · Tháng bùng nổ khách mới
-- Problem: https://xomdata.com/practice/medium-active-003
-- Solved: 2026-09-14

with fin as(
    select
        customer_id,
        min(strftime('%Y-%m',order_date)) as month
    from orders
    group by customer_id
), final as(
select
    month,
    count(customer_id) as new_customers,
    row_number() over(order by count(customer_id) desc, month asc) as rn
from fin
group by month
)
select
    month,
    new_customers
from final
where rn = 1

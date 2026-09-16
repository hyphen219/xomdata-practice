-- Xom Data · Đà tăng giảm lượng khách qua từng tháng
-- Problem: https://xomdata.com/practice/medium-active-005
-- Solved: 2026-09-16

with fin as(
    select
        strftime('%Y-%m', order_date) as month,
        count(distinct customer_id) as active_customers,
        lag(count(distinct customer_id)) over(order by strftime('%Y-%m', order_date) asc) as prev
    from orders
    group by strftime('%Y-%m', order_date)
)
select
    month,
    active_customers,
    active_customers - prev as change_vs_prev
from fin

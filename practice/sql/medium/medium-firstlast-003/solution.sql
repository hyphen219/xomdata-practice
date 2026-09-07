-- Xom Data · Ấn tượng đầu tiên trị giá bao nhiêu
-- Problem: https://xomdata.com/practice/medium-firstlast-003
-- Solved: 2026-09-07

with fin as(
    select
        customer_id, order_date, amount,
        row_number() over(partition by customer_id order by order_date asc) as num
    from orders
)
select
    customer_id,
    order_date as first_order_date,
    amount as first_amount
from fin
where num = 1

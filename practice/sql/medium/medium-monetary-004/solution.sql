-- Xom Data · Đơn hàng để đời của mỗi khách
-- Problem: https://xomdata.com/practice/medium-monetary-004
-- Solved: 2026-08-28

with fin as(
    select
        customer_id,
        order_id,
        order_date,
        amount,
        row_number() over(partition by customer_id order by amount desc, order_date asc) as num
    from orders
)
select
    customer_id,
    order_id,
    order_date,
    amount
from fin
where num = 1
order by customer_id asc;

-- Xom Data · Đồng hồ đếm ngược trước khi mất khách
-- Problem: https://xomdata.com/practice/medium-churn-003
-- Solved: 2026-09-14

select
    customer_id,
    julianday('2024-06-30') - julianday(max(order_date)) as days_silent,
    90 - (julianday('2024-06-30') - julianday(max(order_date))) as days_left
from orders
group by customer_id
having days_left >= 0
order by days_left asc, customer_id asc;

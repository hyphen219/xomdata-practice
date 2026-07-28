-- Xom Data · Customers silent for 90 days
-- Problem: https://xomdata.com/practice/hard-anti-001
-- Solved: 2026-07-28

with info as (
    select
        user_id,
        max(order_date) over() as newest_day,
        max(order_date) over(partition by user_id) as last_order_date
    from orders
)
select
    user_id,
    last_order_date,
    julianday(newest_day) - julianday(last_order_date) as days_since_last
from info
where julianday(newest_day) - julianday(last_order_date) >= 90
group by user_id
order by days_since_last desc, user_id asc;

-- Xom Data · Hồ sơ ba chỉ số thô của từng khách
-- Problem: https://xomdata.com/practice/medium-recency-006
-- Solved: 2026-09-09


    select
        customer_id,
        -julianday(max(order_date)) + julianday('2024-06-30') as days_silent,
        count(order_id) as order_count,
        sum(amount) as total_spent
    from orders
    group by customer_id

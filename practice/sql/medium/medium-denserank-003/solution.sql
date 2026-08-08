-- Xom Data · Spending tiers of loyal customers
-- Problem: https://xomdata.com/practice/medium-denserank-003
-- Solved: 2026-08-08

-- Viết SQL của bạn ở đây
select
    customer_name,
    sum(amount) as total_spent,
    DENSE_RANK() over(order by sum(amount) desc) as spend_tier
from purchases
group by customer_name
order by spend_tier asc, customer_name asc;

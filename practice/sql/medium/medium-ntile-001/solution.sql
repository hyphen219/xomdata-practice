-- Xom Data · Splitting customers into four spending tiers
-- Problem: https://xomdata.com/practice/medium-ntile-001
-- Solved: 2026-08-08

-- Viết SQL của bạn ở đây
select
    customer_name,
    total_spent,
    ntile(4) over(order by total_spent desc, customer_name asc) as spend_quartile
from customer_spending
order by spend_quartile asc, total_spent desc, customer_name asc;

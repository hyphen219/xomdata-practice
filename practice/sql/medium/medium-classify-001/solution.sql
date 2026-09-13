-- Xom Data · Kim cương, vàng hay thành viên thường
-- Problem: https://xomdata.com/practice/medium-classify-001
-- Solved: 2026-09-13

select
    customer_id,
    sum(amount) as total_spent,
    case
    when sum(amount) >= 10000000 then 'Diamond'
    when sum(amount) >= 3000000 then 'Gold'
    else 'Member' end as tier
from orders
group by customer_id

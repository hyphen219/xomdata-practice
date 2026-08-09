-- Xom Data · Revenue rank of each category
-- Problem: https://xomdata.com/practice/medium-rank-003
-- Solved: 2026-08-09

-- Viết SQL của bạn ở đây
select
    category,
    sum(amount) as total_revenue,
    rank() over(order by sum(amount) desc) as revenue_rank
from sales
group by category
order by revenue_rank asc, category asc;

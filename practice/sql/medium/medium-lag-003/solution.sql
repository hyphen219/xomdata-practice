-- Xom Data · Last month per branch
-- Problem: https://xomdata.com/practice/medium-lag-003
-- Solved: 2026-08-08

-- Viết SQL của bạn ở đây
select
    branch,
    month,
    revenue,
    lag(revenue, 1) over(partition by branch) as prev_revenue
from branch_revenue

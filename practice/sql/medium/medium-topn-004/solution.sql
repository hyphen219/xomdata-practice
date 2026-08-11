-- Xom Data · Each branch's two slowest months
-- Problem: https://xomdata.com/practice/medium-topn-004
-- Solved: 2026-08-11

-- Viết SQL của bạn ở đây
with info as(
    select
        branch,
        month,
        revenue,
        ROW_NUMBER() over(partition by branch order by revenue asc, month asc) as num
    from branch_monthly
)
select
    branch,
    month,
    revenue
from info
where num <= 2
order by branch, revenue asc, month asc;

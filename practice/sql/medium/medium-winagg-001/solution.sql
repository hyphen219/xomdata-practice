-- Xom Data · Department total next to each person
-- Problem: https://xomdata.com/practice/medium-winagg-001
-- Solved: 2026-08-14

-- Viết SQL của bạn ở đây
select
    department,
    rep_name,
    revenue,
    sum(revenue) over(partition by department) as dept_total
from deals
order by department asc, rep_name asc;

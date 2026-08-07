-- Xom Data · Sales rankings with department names
-- Problem: https://xomdata.com/practice/medium-winjoin-001
-- Solved: 2026-08-07

-- Viết SQL của bạn ở đây
select
    dept_name,
    rank() over(partition by dept_name order by sales_amount desc) as dept_rank,
    staff_name,
    sales_amount
from departments d
join staff s on d.id = s.dept_id
order by dept_name asc, dept_rank asc, staff_name asc

-- Xom Data · Top salary in each department
-- Problem: https://xomdata.com/practice/easy-groupby-005
-- Solved: 2026-08-06

-- Viết SQL của bạn ở đây
select distinct
    department,
    first_value(salary) over(partition by department order by salary desc) as top_salary
from employees
order by department asc;

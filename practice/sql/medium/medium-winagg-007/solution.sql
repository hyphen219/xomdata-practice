-- Xom Data · Above or below the department norm
-- Problem: https://xomdata.com/practice/medium-winagg-007
-- Solved: 2026-08-14

-- Viết SQL của bạn ở đây
with fin as(
    select
        department,
        full_name,
        salary,
        avg(salary) over(partition by department) as dept_avg
    from employees
)

select
    department,
    full_name,
    salary,
    case
    when salary > dept_avg then 'Above'
    when salary < dept_avg then 'Below'
    else 'Equal' end as position_label
from fin
order by department asc, full_name asc;

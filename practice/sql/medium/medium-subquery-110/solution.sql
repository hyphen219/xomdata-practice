-- Xom Data · Employees paid above their department average
-- Problem: https://xomdata.com/practice/medium-subquery-110
-- Solved: 2026-07-19

with sal_stat as (
	select e.full_name,
		d.dept_name,
		e.salary,
		avg(salary) over(partition by dept_name) as dept_avg_salary
	from employees e
	join departments d on e.department_id = d.id
)

select full_name,
	dept_name,
	salary,
	round(dept_avg_salary, 0) as dept_avg_salary,
	round(((salary - dept_avg_salary)*100/dept_avg_salary), 2) as premium_pct
from sal_stat
where salary > dept_avg_salary
order by premium_pct desc, dept_name asc, full_name asc;

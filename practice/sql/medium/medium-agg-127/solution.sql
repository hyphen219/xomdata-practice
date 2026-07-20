-- Xom Data · Top 10 highest-paid employees and their leave days
-- Problem: https://xomdata.com/practice/medium-agg-127
-- Solved: 2026-07-20

with emp_stat as (
	select distinct e.full_name,
		e.employee_code,
		d.department_name,
		p.total_received_salary,
		count(case
			when l.status = 'duyet' then l.id
			else null
			end) as leave_count
	from employees e
	left join departments d on d.id = e.department_id
	left join (select employee_id,
					sum(net_salary) as total_received_salary
				from payroll
				group by employee_id) p on p.employee_id = e.id
	left join leaves l on l.employee_id = e.id
	group by e.full_name, e.employee_code, d.department_name, p.total_received_salary
),
	avg_sal as (
	select employee_code,
		department_name,
		avg(total_received_salary) over(partition by department_name) as avg_sal_dept
	from emp_stat
)

select e.full_name,
	e.employee_code,
	e.department_name,
	e.total_received_salary,
	e.leave_count,
	round(((e.total_received_salary - a.avg_sal_dept)*100.0/a.avg_sal_dept), 2) as pct_above_dept_avg
from emp_stat e
join avg_sal a on e.employee_code = a.employee_code
order by total_received_salary desc, employee_code asc
limit 10;

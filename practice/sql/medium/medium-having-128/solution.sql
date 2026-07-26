-- Xom Data · Employees averaging over 5 overtime hours
-- Problem: https://xomdata.com/practice/medium-having-128
-- Solved: 2026-07-26

with info as (
    select
        e.full_name,
        e.employee_code,
        avg(a.work_days) as avg_work_days,
        avg(p.net_salary) as avg_salary,
        avg(a.overtime_hours) as avg_overtime_hours
    from employees e
    left join attendance a on e.id = a.employee_id
    left join payroll p on e.id = p.employee_id
    group by e.full_name, e.employee_code
    having avg_overtime_hours > 5 and avg_work_days >= 18
)
select
    full_name,
    employee_code,
    avg_work_days,
    avg_overtime_hours,
    avg_salary,
    round(avg_overtime_hours/avg_work_days, 4) as overtime_intensity,
    rank() over(order by avg_overtime_hours/avg_work_days desc) as intensity_rank,
    ntile(4) over(order by avg_overtime_hours/avg_work_days desc) as workload_quartile
from info
order by intensity_rank asc, employee_code asc;

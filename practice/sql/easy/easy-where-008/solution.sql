-- Xom Data · Employees by salary, descending
-- Problem: https://xomdata.com/practice/easy-where-008
-- Solved: 2026-07-13

select full_name, salaries
from employees
where salaries > 20000000
order by salaries desc, full_name asc;

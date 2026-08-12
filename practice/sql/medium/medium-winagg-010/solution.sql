-- Xom Data · Regional payroll with shares
-- Problem: https://xomdata.com/practice/medium-winagg-010
-- Solved: 2026-08-12

-- Viết SQL của bạn ở đây
with total as (
    select
        region,
        staff_name,
        salary,
        sum(salary) over(partition by region) as region_total
    from payroll
)
select
    region,
    staff_name,
    salary,
    region_total,
    round(salary*100.0/region_total, 2) as pct_of_region
from total
order by region asc, salary desc, staff_name asc;

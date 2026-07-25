-- Xom Data · Median and percentile salary by department
-- Problem: https://xomdata.com/practice/hard-percentile-001
-- Solved: 2026-07-25

with pct as(
    select
        id,
        department,
        salary,
        percent_rank() over(partition by department order by salary asc) as pct_rank
    from employees
),
    final as (
        select
            department,
            salary,
            first_value(salary) over(partition by department order by abs(pct_rank - 0.25) asc, salary asc) as p25,
            first_value(salary) over(partition by department order by abs(pct_rank - 0.5) asc, salary asc) as p50,
            first_value(salary) over(partition by department order by abs(pct_rank - 0.75) asc, salary asc) as p75
        from pct
    )
select distinct
    department,
    p25,
    p50,
    p75
from final
order by department asc;

-- Xom Data · Three-day rolling total per store
-- Problem: https://xomdata.com/practice/medium-rolling-002
-- Solved: 2026-08-09

-- Viết SQL của bạn ở đây
select
    store,
    sale_date,
    units_sold,
    round(sum(units_sold) over(partition by store order by sale_date asc
    rows between 2 preceding and current row), 2) as sum_3d
from daily_sales
order by store asc, sale_date asc;

-- Xom Data · Daily revenue including zero-sale days
-- Problem: https://xomdata.com/practice/hard-gapfill-001
-- Solved: 2026-07-29

with recursive mixi as(
    select
        julianday(min(date)) as min_date,
        julianday(max(date)) as max_date,
        julianday(max(date)) - julianday(min(date)) as diff
    from daily_revenue
),
day_list as (
    select min_date as date_jul
    from mixi
    UNION ALL
    select date_jul + 1
    from day_list
    where date_jul < (select max_date from mixi)
),
datelist as(
    select date(date_jul) as date
    from day_list
)
SELECT
    d.date,
    sum(coalesce(amount, 0)) as revenue
from datelist d
left join daily_revenue dr on d.date = dr.date
group by d.date;

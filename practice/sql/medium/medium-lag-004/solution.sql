-- Xom Data · Trend labels for the monthly report
-- Problem: https://xomdata.com/practice/medium-lag-004
-- Solved: 2026-08-08

-- Viết SQL của bạn ở đây
with rev as(
    select
        month,
        revenue,
        lag(revenue, 1) over() as prev
    from monthly_revenue
)
select
    month,
    revenue,
    case
    when revenue - prev > 0 then 'Up'
    when revenue - prev < 0 then 'Down'
    when revenue - prev is null then 'First'
    else 'Flat' end as trend
from rev;

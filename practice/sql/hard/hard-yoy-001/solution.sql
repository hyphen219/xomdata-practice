-- Xom Data · YoY and QoQ sales growth
-- Problem: https://xomdata.com/practice/hard-yoy-001
-- Solved: 2026-07-25

with yoy as (
    select
        year,
        quarter,
        revenue,
        lag(revenue, 1) over() as prev_quarter_revenue,
        lag(revenue, 4) over() as prev_year_revenue
    from quarterly_sales
    order by year asc, quarter asc
)
SELECT
    year,
    quarter,
    revenue,
    prev_quarter_revenue,
    prev_year_revenue,
    round(((revenue - prev_quarter_revenue)*100.0/prev_quarter_revenue), 2) as qoq_pct,
    round(((revenue - prev_year_revenue)*100.0/prev_year_revenue), 2) as yoy_pct
from yoy
order by year asc, quarter asc;

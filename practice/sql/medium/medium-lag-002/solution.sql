-- Xom Data · Change versus last month
-- Problem: https://xomdata.com/practice/medium-lag-002
-- Solved: 2026-08-08

-- Viết SQL của bạn ở đây
with rev as (
    select
        month,
        revenue,
        lag(revenue, 1) over() as prev
    from monthly_revenue
)

select
    month,
    revenue,
    revenue - prev as mom_change
from rev

-- Xom Data · 7-day moving average of revenue
-- Problem: https://xomdata.com/practice/hard-frame-001
-- Solved: 2026-07-24

with avg as (
    select
        date,
        amount as revenue,
        avg(amount) over(order by date
                        rows between 6 preceding and current row) as ma7
    from daily_revenue
)
SELECT
    date,
    revenue,
    round(ma7, 2) as ma7
from avg;

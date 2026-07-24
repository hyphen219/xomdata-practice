-- Xom Data · Revenue pivoted by product type
-- Problem: https://xomdata.com/practice/hard-pivot-001
-- Solved: 2026-07-24

with rev as (
    SELECT
        strftime('%Y-%m', sale_date) as month,
        sum(case when category = 'Electronics' then coalesce(amount, 0) else 0 end) as electronics,
        sum(case when category = 'Clothing' then coalesce(amount, 0) else 0 end) as clothing,
        sum(case when category = 'Food' then coalesce(amount, 0) else 0 end) as food,
        sum(coalesce(amount, 0)) as total
    from sales
    group by month
)
select
    month,
    electronics,
    clothing,
    food,
    total
from rev
order by month asc;

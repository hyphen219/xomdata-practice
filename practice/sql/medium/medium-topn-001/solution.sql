-- Xom Data · Sales champion of each region
-- Problem: https://xomdata.com/practice/medium-topn-001
-- Solved: 2026-08-11

-- Viết SQL của bạn ở đây
with maxi as(
    select
        region,
        rep_name,
        sales_amount,
        row_number() over(partition by region order by sales_amount desc, rep_name asc) as num
    from reps
    order by rep_name asc
)

select
    region,
        rep_name,
        sales_amount
from maxi
where num = 1
order by region asc

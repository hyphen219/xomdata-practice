-- Xom Data · Sales rank within each region
-- Problem: https://xomdata.com/practice/medium-rank-002
-- Solved: 2026-08-09

-- Viết SQL của bạn ở đây
select
    region,
    rank() over(partition by region order by sales_amount desc) as region_rank,
    rep_name,
    sales_amount
from reps
order by region asc, region_rank asc, rep_name asc;

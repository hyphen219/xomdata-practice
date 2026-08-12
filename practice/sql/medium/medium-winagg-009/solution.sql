-- Xom Data · Each category's slice of revenue
-- Problem: https://xomdata.com/practice/medium-winagg-009
-- Solved: 2026-08-12

-- Viết SQL của bạn ở đây
with total as(
    select
        category,
        sum(amount) as total_revenue
    from sales
    group by category
),
fin as (
    select
        category,
        total_revenue,
        sum(total_revenue) over() as tot
    from total
)
select
    category,
    total_revenue,
    round(total_revenue*100.0/tot, 2) as pct_share
from fin
order by total_revenue desc, category asc;

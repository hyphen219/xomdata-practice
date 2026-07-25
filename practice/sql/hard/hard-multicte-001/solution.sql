-- Xom Data · Multi-level profit margin analysis
-- Problem: https://xomdata.com/practice/hard-multicte-001
-- Solved: 2026-07-25

with agg as (
    select
        p.id,
        p.category,
        p.name as product_name,
        coalesce(sum(o.quantity * o.price), 0) as revenue,
        coalesce(sum(o.quantity * p.unit_cost), 0) as cost
    from products p
    left join orders o on p.id = o.product_id
    group by p.id, p.category, p.name
),
calc as (
    select
        category,
        product_name,
        revenue,
        cost,
        revenue - cost as profit
    from agg
),
with_max as (
    select
        *,
        max(profit) over (partition by category) as max_in_cat
    from calc
)
select
    category,
    product_name,
    revenue,
    cost,
    profit,
    round(
        case when revenue = 0 then 0 else profit * 100.0 / revenue end,
        2
    ) as margin_pct,
    dense_rank() over (partition by category order by profit desc) as rank_in_cat,
    case
        when max_in_cat = 0 then NULL
        else round(profit * 100.0 / max_in_cat, 2)
    end as pct_of_top_in_cat
from with_max
order by category asc, rank_in_cat asc, product_name asc;

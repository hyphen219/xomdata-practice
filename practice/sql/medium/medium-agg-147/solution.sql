-- Xom Data · Top 10 highest-profit dishes
-- Problem: https://xomdata.com/practice/medium-agg-147
-- Solved: 2026-07-27

with info as (
    select
        dish_name,
        category_name,
        sum(quantity) as total_sold,
        sum(quantity*unit_price) as revenue,
        sum(quantity*unit_price) - quantity*cost_price as profit
    from dishes d
    left join categories c on d.category_id = c.id
    left join order_items oi on oi.dish_id = d.id
    left join orders o on o.id = oi.order_id
    where status = 'Completed'
    group by dish_name
)
select
    dish_name,
    category_name,
    total_sold,
    revenue,
    profit,
    round(profit*100.0/revenue, 2) as margin_pct,
    rank() over(order by profit desc) as rank_by_profit,
    rank() over(order by round(profit*100.0/revenue, 2) desc) as rank_by_margin
from info
order by profit desc, dish_name asc
limit 10;

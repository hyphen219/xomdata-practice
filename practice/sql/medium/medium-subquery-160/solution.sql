-- Xom Data · Low-activity users
-- Problem: https://xomdata.com/practice/medium-subquery-160
-- Solved: 2026-07-26

with info as (
    select
        u.user_name,
        count(o.id) as order_count,
        sum(value) as total_value,
        avg(value) as avg_order_value
    from users u
    left join orders o on u.id = o.user_id
    group by u.user_name
),
info_avg as (
    select
        user_name,
        order_count,
        total_value,
        avg_order_value,
        avg(total_value) over() as total_overall
    from info
)
select
    user_name,
    order_count,
    total_value,
    avg_order_value,
    CASE
    when order_count = 0 then 'Inactive'
    when total_value < total_overall then 'Low'
    else 'Normal'
    end as tier,
    rank() over(order by order_count asc, total_value asc) as activity_rank,
    round((percent_rank() over(order by total_value asc))*100.0, 2) as pct_above_peers
from info_avg
where order_count = 0 or total_value < total_overall
order by activity_rank asc, user_name asc;

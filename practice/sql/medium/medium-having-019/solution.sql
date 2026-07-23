-- Xom Data · High-rated sellers with many orders
-- Problem: https://xomdata.com/practice/medium-having-019
-- Solved: 2026-07-23

with legit as (
    select s.store_name,
           s.reputation_score,
           count(o.id) as order_count
    from sellers s
    left join orders o on s.id = o.seller_id
    group by s.store_name, s.reputation_score
)
select store_name,
       reputation_score,
       order_count,
       dense_rank() over (order by order_count desc) as rank_by_orders,
       sum(order_count) over (order by order_count desc, store_name asc
                            rows between unbounded preceding and current row) as cumulative_orders
from legit
where reputation_score >= 4.5 and order_count >= 3
order by rank_by_orders asc, store_name asc;

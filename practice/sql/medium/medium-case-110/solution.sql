-- Xom Data · Classify products by sales velocity
-- Problem: https://xomdata.com/practice/medium-case-110
-- Solved: 2026-07-21

with product_inf as (
    select p.name,
           p.categories,
           sum(t.quantity) as total_sold,
           sum(sum(t.quantity)) over(partition by p.categories) as total_sold_cate
    from products p
    left join transactions t on p.id = t.product_id
    group by p.name, p.categories
)

select name,
       categories,
       total_sold,
       case
        when total_sold >= 100 then 'Best Seller'
        when total_sold >= 50 then 'Average'
        else 'Slow Mover'
        end as classification,
       dense_rank() over(partition by categories order by total_sold desc) as rank_in_cat,
       round((total_sold*100.0/total_sold_cate), 2) as pct_of_cat_total
from product_inf
order by categories, rank_in_cat asc, name asc;

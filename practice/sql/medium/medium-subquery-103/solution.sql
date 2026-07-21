-- Xom Data · Products more expensive than the category average
-- Problem: https://xomdata.com/practice/medium-subquery-103
-- Solved: 2026-07-21

with product_inf as (
    select product_name,
           category,
           price,
           avg(price) over(partition by category) as avg_dept
    from products
    group by product_name, category
)

select product_name,
       category,
       price,
       (price - avg_dept) as diff_from_avg,
       round((price - avg_dept)*100.0/avg_dept, 2) as pct_above
from product_inf
where price > avg_dept
order by pct_above desc, product_name asc;

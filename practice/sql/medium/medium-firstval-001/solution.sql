-- Xom Data · The category's flagship next to each item
-- Problem: https://xomdata.com/practice/medium-firstval-001
-- Solved: 2026-08-08

-- Viết SQL của bạn ở đây
with maxi as (
    select
        category as cat,
        product_name as top_product
    from catalog
    where price in (select max(price) over(partition by category) as max_cat from catalog)
)

select
    category,
    product_name,
    price,
    top_product
from catalog c
left join maxi m on c.category = m.cat
group by product_name
order by category asc, price desc, product_name asc;

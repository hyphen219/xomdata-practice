-- Xom Data · Top three sellers per category
-- Problem: https://xomdata.com/practice/medium-topn-002
-- Solved: 2026-08-11

-- Viết SQL của bạn ở đây
with info as(
    select
        category,
        product_name,
        units_sold,
        ROW_NUMBER() over(partition by category order by units_sold desc, product_name asc) as num
    from menu_sales
)

select
    category,
    product_name,
    units_sold
from info
where num in (1, 2, 3)
order by category asc, units_sold desc, product_name asc;

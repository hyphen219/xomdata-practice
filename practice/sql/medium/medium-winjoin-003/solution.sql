-- Xom Data · Each aisle's best seller
-- Problem: https://xomdata.com/practice/medium-winjoin-003
-- Solved: 2026-08-10

-- Viết SQL của bạn ở đây
with maxi as (
    select
        category_name,
        product_name,
        units_sold,
        row_number() over(partition by category_name order by units_sold desc) as rank
    from categories c
    join products p on c.id = p.category_id
)
select category_name, product_name, units_sold from maxi where rank = 1 order by category_name asc;

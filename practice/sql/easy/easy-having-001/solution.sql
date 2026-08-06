-- Xom Data · Categories full enough for the homepage
-- Problem: https://xomdata.com/practice/easy-having-001
-- Solved: 2026-08-06

-- Viết SQL của bạn ở đây
select
    category,
    count(product_name) as num_products
from products
group by category
having num_products >= 3
order by category asc;

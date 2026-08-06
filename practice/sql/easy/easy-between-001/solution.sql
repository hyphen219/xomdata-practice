-- Xom Data · Products in a price range
-- Problem: https://xomdata.com/practice/easy-between-001
-- Solved: 2026-08-06

-- Viết SQL của bạn ở đây
select
    product_name,
    price
from products
where price >= 200 and price <= 500;

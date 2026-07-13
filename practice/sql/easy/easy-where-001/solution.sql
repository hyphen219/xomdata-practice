-- Xom Data · Filter products by category
-- Problem: https://xomdata.com/practice/easy-where-001
-- Solved: 2026-07-13

select name, price, categories
from products
where categories = 'Electronics'
order by name asc;

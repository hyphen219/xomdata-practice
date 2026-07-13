-- Xom Data · Active menu sorted by price
-- Problem: https://xomdata.com/practice/easy-orderby-001
-- Solved: 2026-07-13

select dish_name, price
from menu
where status = 'Active'
order by price asc, dish_name asc;

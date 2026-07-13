-- Xom Data · Store list by city
-- Problem: https://xomdata.com/practice/easy-select-005
-- Solved: 2026-07-13

select name, city
from stores
order by city asc, name asc;

-- Xom Data · The current price of each product
-- Problem: https://xomdata.com/practice/medium-dedup-002
-- Solved: 2026-08-08

-- Viết SQL của bạn ở đây
select
    product_name,
    price,
    effective_date
from price_history
where effective_date in (select max(effective_date) over(partition by product_name) from price_history)
order by product_name asc;

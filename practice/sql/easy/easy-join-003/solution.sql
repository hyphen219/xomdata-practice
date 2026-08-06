-- Xom Data · Line totals from the price list
-- Problem: https://xomdata.com/practice/easy-join-003
-- Solved: 2026-08-06

-- Viết SQL của bạn ở đây
select
    product_name,
    quantity,
    quantity*price as line_total
from products p
join sale_items s on p.id = s.product_id

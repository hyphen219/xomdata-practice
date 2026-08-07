-- Xom Data · Normalize codes for label printing
-- Problem: https://xomdata.com/practice/easy-string-001
-- Solved: 2026-08-07

-- Viết SQL của bạn ở đây
select
    sku,
    upper(sku) as label_code
from inventory

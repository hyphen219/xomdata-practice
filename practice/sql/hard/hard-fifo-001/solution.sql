-- Xom Data · Running inventory balance over time
-- Problem: https://xomdata.com/practice/hard-fifo-001
-- Solved: 2026-07-28

select
    sku,
    occurred_at,
    type,
    quantity,
    sum(case when type = 'IN' then quantity else quantity*-1 end) over(partition by sku order by sku asc, occurred_at asc, id asc) as running_balance
from inventory_movements
order by sku asc, occurred_at asc, id asc;

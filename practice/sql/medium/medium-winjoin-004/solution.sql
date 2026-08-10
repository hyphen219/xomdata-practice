-- Xom Data · The same customer's previous order
-- Problem: https://xomdata.com/practice/medium-winjoin-004
-- Solved: 2026-08-10

-- Viết SQL của bạn ở đây
select
    member_name,
    purchase_date,
    amount,
    lag(amount, 1) over(partition by member_name order by purchase_date asc) as prev_amount
from members m
join purchases p on m.id = p.member_id
order by member_name asc, purchase_date asc

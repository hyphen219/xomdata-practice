-- Xom Data · Parcels bound for Denver
-- Problem: https://xomdata.com/practice/easy-join-002
-- Solved: 2026-08-06

-- Viết SQL của bạn ở đây
select
    tracking_code,
    recipient_name
from recipients r
join parcels p on r.id = p.recipient_id
where city = 'Da Nang'

-- Xom Data · Booking count per branch
-- Problem: https://xomdata.com/practice/easy-leftjoin-003
-- Solved: 2026-08-06

-- Viết SQL của bạn ở đây
select
    branch_name,
    count(b.id) as num_bookings
from branches br
left join bookings b on br.id = b.branch_id
group by branch_name

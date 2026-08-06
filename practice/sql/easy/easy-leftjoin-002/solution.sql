-- Xom Data · Total spend per member
-- Problem: https://xomdata.com/practice/easy-leftjoin-002
-- Solved: 2026-08-06

-- Viết SQL của bạn ở đây
select
    member_name,
    sum(coalesce(amount, 0)) as total_spent
from members m
left join bills b on b.member_id = m.id
group by member_name
order by member_name asc

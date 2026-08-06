-- Xom Data · Users who never took a ride
-- Problem: https://xomdata.com/practice/easy-leftjoin-001
-- Solved: 2026-08-06

-- Viết SQL của bạn ở đây
select
    user_name,
    joined_date
from users u
left join rides r on u.id = r.user_id
where r.id is null;

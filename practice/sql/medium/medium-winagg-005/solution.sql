-- Xom Data · Ward headcount next to each nurse
-- Problem: https://xomdata.com/practice/medium-winagg-005
-- Solved: 2026-08-13

-- Viết SQL của bạn ở đây
select
    ward,
    nurse_name,
    count(nurse_name) over(partition by ward) as team_size
from roster
order by ward asc, nurse_name asc;

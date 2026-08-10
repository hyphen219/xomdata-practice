-- Xom Data · Price tiers for rooms on sale
-- Problem: https://xomdata.com/practice/medium-denserank-001
-- Solved: 2026-08-10

-- Viết SQL của bạn ở đây
select
    room_no,
    price,
    dense_rank() over(order by price desc) as price_tier
from rooms
order by price_tier asc, room_no asc;

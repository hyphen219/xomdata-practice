-- Xom Data · Grand final leaderboard
-- Problem: https://xomdata.com/practice/medium-rank-001
-- Solved: 2026-08-09

-- Viết SQL của bạn ở đây
select
    rank() over(order by points desc) as final_rank,
    player_name,
    points
from players
order by final_rank, player_name asc;

-- Xom Data · How far from the server's top
-- Problem: https://xomdata.com/practice/medium-winagg-004
-- Solved: 2026-08-13

-- Viết SQL của bạn ở đây
with fin as(
    select
        server,
        player_name,
        points,
        max(points) over(partition by server) as top_point
    from players
)
select
    server,
    player_name,
    points,
    top_point - points as gap_to_top
from fin
order by server asc, points desc, player_name asc;

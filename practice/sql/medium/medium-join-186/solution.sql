-- Xom Data · Goals and cards by team
-- Problem: https://xomdata.com/practice/medium-join-186
-- Solved: 2026-07-18

with team_info as (
    select t.team_name,
        t.city,
        coalesce(count(distinct pl.id), 0) as player_count,
        coalesce(count(distinct g.id), 0) as total_goals_scored,
        coalesce(count(distinct p.id), 0) as penalty_count
    from teams t
    left join players pl on pl.team_id = t.id
    left join goals g on g.player_id = pl.id
    left join penalties p on p.player_id = pl.id
    group by t.id, t.team_name, t.city
)

select team_name,
    city,
    player_count,
    total_goals_scored,
    penalty_count,
    round(total_goals_scored*1.0/nullif(player_count,0),2) as goals_per_player,
    round(penalty_count*1.0/nullif(player_count,0),2) as cards_per_player,
    rank() over(order by total_goals_scored desc) as scoring_rank,
    sum(total_goals_scored) over(order by total_goals_scored desc) as cumulative_goals
from team_info
order by scoring_rank asc, team_name asc;

-- Xom Data · Players with 3 or more goals
-- Problem: https://xomdata.com/practice/medium-having-187
-- Solved: 2026-07-26

with info as (
    SELECT
        pl.full_name,
        pl.positions,
        t.team_name,
        count(distinct g.id) as goal_count,
        count(distinct g.match_id) as scoring_matches,
        count(distinct p.id) as cards_received
    from players pl
    left join teams t on t.id = pl.team_id
    left join goals g on pl.id = g.player_id
    left join penalties p on pl.id = p.player_id
    group by pl.id, full_name
    having goal_count >= 3 and cards_received < 5
)
select
    full_name,
    positions,
    team_name,
    goal_count,
    scoring_matches,
    cards_received,
    round(goal_count*1.0/scoring_matches, 2) as goals_per_match,
    dense_rank() over(order by goal_count/scoring_matches desc) as efficiency_rank,
    rank() over(order by goal_count desc) as volume_rank
from info
order by efficiency_rank, full_name asc;

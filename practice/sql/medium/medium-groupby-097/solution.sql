-- Xom Data · Top 10 most-engaged posts
-- Problem: https://xomdata.com/practice/medium-groupby-097
-- Solved: 2026-07-26

with info as (
    SELECT
        p.id as post_id,
        u.full_name,
        p.post_type,
        p.post_date,
        (like_count + comment_count + share_count) as total_interactions,
        max((like_count + comment_count + share_count)) over() as top_interaction
    from posts p
    join users u on u.id = p.user_id
)
select
    full_name,
    post_type,
    post_date,
    total_interactions,
    rank() over(order by total_interactions desc) as overall_rank,
    row_number() over(
        partition by full_name 
        order by total_interactions desc, post_date asc, post_id asc
    ) as rank_in_author,
    round((total_interactions*100.0/top_interaction), 2) as pct_of_top
from info
order by overall_rank asc, full_name asc, rank_in_author asc
limit 10;

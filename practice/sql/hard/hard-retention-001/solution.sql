-- Xom Data · D7 and D30 retention rate
-- Problem: https://xomdata.com/practice/hard-retention-001
-- Solved: 2026-07-29

with info as (
    select
        count(distinct s.user_id) as total_users,
        count(distinct case when julianday(active_date) - julianday(signup_date) between 1 and 7 then s.user_id else null end) as d7_retained,
        count(distinct case when julianday(active_date) - julianday(signup_date) between 1 and 30 then s.user_id else null end) as d30_retained
    from signups s
    left join activity a on s.user_id = a.user_id
)
select
    total_users,
    d7_retained,
    coalesce(round(d7_retained*100.0/total_users, 2), 0) as d7_rate,
    d30_retained,
    coalesce(round(d30_retained*100.0/total_users, 2), 0) as d30_rate
from info;

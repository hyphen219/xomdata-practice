-- Xom Data · 4-step onboarding conversion rate
-- Problem: https://xomdata.com/practice/hard-funnel-001
-- Solved: 2026-09-16

with steps as(
    select 'signup' as step, 1 as step_n
    union 
    select 'verify_email', 2
    union
    select 'first_login', 3
    union
    select 'first_purchase', 4
), fin as (
select
    step,
    step_n,
    count(distinct user_id) as counts 
from steps s
left join events e on s.step = e.event_name
group by step
)
select
    step,
    counts as n_users,
    round(coalesce(counts*100.0/(select counts from fin where step = 'signup'), 0), 2) as conversion_pct
from fin
order by step_n

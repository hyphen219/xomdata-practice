-- Xom Data · Retention rate by signup-month cohort
-- Problem: https://xomdata.com/practice/hard-cohort-001
-- Solved: 2026-07-25

with cum as (
select
    strftime('%Y-%m', signup_date) as signup_month,
    strftime('%Y-%m', active_date) as active_month,
    signups.user_id
from signups
left join activity on activity.user_id = signups.user_id
)
select
    signup_month,
    active_month,
    count(distinct user_id) as n_active
from cum
where active_month >= signup_month
group by signup_month, active_month
order by signup_month, active_month;

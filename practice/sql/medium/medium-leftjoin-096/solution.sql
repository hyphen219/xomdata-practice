-- Xom Data · Accounts with no posts
-- Problem: https://xomdata.com/practice/medium-leftjoin-096
-- Solved: 2026-07-17

select full_name,
    username,
    account_type,
    row_number() over(order by created_at asc, username asc) as signup_order,
    ntile(4) over(order by created_at asc) as tenure_quartile
from users
left join posts on posts.user_id = users.id
where posts.id is null
order by signup_order asc;

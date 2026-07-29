-- Xom Data · Most common 3-step user path
-- Problem: https://xomdata.com/practice/hard-pathanalysis-001
-- Solved: 2026-07-29

with info as(
    select
        user_id,
        page,
        lag(page, 1) over (partition by user_id order by viewed_at desc) as page2,
        lag(page, 2) over (partition by user_id order by viewed_at desc) as page3
    from page_views
),
fin as(
    select
        user_id,
        page || ' > ' || page2 || ' > ' || page3 as path
    from info
    where page2 is not null and page3 is not null
)
select
    path,
    count(distinct user_id) as n_users
from fin
group by path
order by n_users desc, path ASC
limit 10;

-- Xom Data · Shift bonus for every top performer
-- Problem: https://xomdata.com/practice/medium-topn-003
-- Solved: 2026-08-11

-- Viết SQL của bạn ở đây
with info as(
    select
        store,
        staff_name,
        orders_served,
        rank() over(partition by store order by orders_served desc) as ranking
    from shift_stats
)
select
    store,
    staff_name,
    orders_served
from info
where ranking = 1
order by store asc, staff_name asc;

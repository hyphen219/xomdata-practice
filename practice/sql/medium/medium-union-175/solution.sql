-- Xom Data · Summary of issues to handle
-- Problem: https://xomdata.com/practice/medium-union-175
-- Solved: 2026-07-24

with com as (
    select 'Complaint' as type,
           count(id) as quantity
    from complaints
    where status = 'Pending'
),
    ord as (
    select 'Cancelled Order' as type,
           count(id) as quantity
    from orders
    where status = 'Cancelled'
),
    stock as (
    select 'Out of Stock Product' as type,
           count(id) as quantity
    from products
    where status = 'Out of Stock'
),
    fi as (
    select * from com
    union all
    select * from ord
    union all
    select * from stock
),
    fin as (
    select type,
           quantity,
           sum(quantity) over() as total
    from fi
),
    final as (
    select type,
       quantity,
       (quantity*100.0/total) as pct_of_total,
       rank() over(order by quantity desc) as rank_pos,
       sum((quantity*100.0/total)) over(order by quantity desc, type asc) as cumulative_pct
    from fin
)
select type,
       quantity,
       round(pct_of_total, 2) as pct_of_total,
       rank_pos,
       round(cumulative_pct, 2) as cumulative_pct
from final
order by rank_pos asc, type asc;

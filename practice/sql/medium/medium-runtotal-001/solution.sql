-- Xom Data · Class fund running total by day
-- Problem: https://xomdata.com/practice/medium-runtotal-001
-- Solved: 2026-08-10

-- Viết SQL của bạn ở đây
select
    collect_date,
    amount,
    sum(amount) over(order by collect_date asc) as running_total
from fund_log
order by collect_date asc;

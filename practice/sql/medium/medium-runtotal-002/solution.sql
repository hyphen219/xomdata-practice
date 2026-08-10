-- Xom Data · Each customer's cumulative spending
-- Problem: https://xomdata.com/practice/medium-runtotal-002
-- Solved: 2026-08-10

-- Viết SQL của bạn ở đây
select
    customer_name,
    month,
    spend,
    sum(spend) over(partition by customer_name order by month asc) as cumulative_spend
from wallet_monthly
order by customer_name, month asc;

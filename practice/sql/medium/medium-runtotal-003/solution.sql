-- Xom Data · Balance after each transaction
-- Problem: https://xomdata.com/practice/medium-runtotal-003
-- Solved: 2026-08-10

-- Viết SQL của bạn 
select
    txn_date,
    amount,
    sum(amount) over(order by txn_date asc) as balance
from transactions
order by txn_date asc;

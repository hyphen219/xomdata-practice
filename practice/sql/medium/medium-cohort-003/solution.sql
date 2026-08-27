-- Xom Data · Tháng chào sân của từng khách
-- Problem: https://xomdata.com/practice/medium-cohort-003
-- Solved: 2026-08-27

select distinct
    customer_id,
    strftime('%Y-%m', min(order_date) over(partition by customer_id)) as cohort_month
from orders
order by cohort_month asc, customer_id asc;

-- Xom Data · Quý khởi đầu của mỗi khách
-- Problem: https://xomdata.com/practice/medium-cohort-005
-- Solved: 2026-09-13

with fin as(
    select
        customer_id,
        min(order_date) as first_date
    from orders
    group by customer_id
)
select
    customer_id,
    case
    when strftime('%m', first_date) <= '03' then strftime('%Y', first_date) || '-' || 'Q1'
    when strftime('%m', first_date) <= '06' then strftime('%Y', first_date) || '-' || 'Q2'
    when strftime('%m', first_date) <= '09' then strftime('%Y', first_date) || '-' || 'Q3'
    when strftime('%m', first_date) <= '12' then strftime('%Y', first_date) || '-' || 'Q4'
    end as first_quarter
from fin

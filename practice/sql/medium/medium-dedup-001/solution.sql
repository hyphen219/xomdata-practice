-- Xom Data · Each customer's latest contact number
-- Problem: https://xomdata.com/practice/medium-dedup-001
-- Solved: 2026-08-07

-- Viết SQL của bạn ở đây
with inf as (
    select
        customer_name,
        phone,
        updated_date,
        max(updated_date) over(partition by customer_name) as maxi
    from contact_updates
)

select
    customer_name,
    phone,
    updated_date
from inf
where updated_date = maxi;

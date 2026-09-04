-- Xom Data · Thứ bậc chi tiêu trong nội bộ mỗi kênh
-- Problem: https://xomdata.com/practice/medium-classify-002
-- Solved: 2026-09-04

with fin as(
    select
        c.customer_id,
        sum(amount) as total_spent,
        channel
    from customers c
    join orders o on c.customer_id = o.customer_id
    group by c.customer_id
)
select
    channel,
    customer_id,
    total_spent,
    dense_rank() over(partition by channel order by total_spent desc) as rank_in_channel
from fin

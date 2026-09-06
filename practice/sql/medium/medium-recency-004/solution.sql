-- Xom Data · Ba vòng tròn độ tươi của tệp khách
-- Problem: https://xomdata.com/practice/medium-recency-004
-- Solved: 2026-09-06

with fin as(
    select
        customer_id,
        max(order_date) recent
    from orders
    group by customer_id
), final as(
    select
        customer_id,
        recent,
        case
        when julianday('2024-06-30') - julianday(recent) <= 30 and julianday('2024-06-30') - julianday(recent) >= 0 then 'hot'
        when julianday('2024-06-30') - julianday(recent) <= 90 then 'warm'
        when julianday('2024-06-30') - julianday(recent) > 90 then 'cold'
        end as freshness_bucket
    from fin
    where recent <= '2024-06-30'
)
select
    freshness_bucket,
    count(customer_id) as customer_count
from final
group by freshness_bucket
order by
    case freshness_bucket
        when 'hot' then 1
        when 'warm' then 2
        when 'cold' then 3
    end asc;

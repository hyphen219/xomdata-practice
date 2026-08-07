-- Xom Data · Cheapest domestic fare
-- Problem: https://xomdata.com/practice/easy-min-001
-- Solved: 2026-08-07

-- Viết SQL của bạn ở đây
select
    min(price) as lowest_price
from flights
where route_type = 'Domestic'

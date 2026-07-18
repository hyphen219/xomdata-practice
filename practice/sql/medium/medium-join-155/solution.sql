-- Xom Data · Rank hotels by room price within each destination
-- Problem: https://xomdata.com/practice/medium-join-155
-- Solved: 2026-07-18

with room_info as (
    select h.hotel_name,
        h.star_class,
        d.destination_name,
        count(hr.id) as room_count,
        coalesce(min(hr.nightly_rate), 0) as min_price,
        coalesce(max(hr.nightly_rate), 0) as max_price,
        coalesce(avg(hr.nightly_rate), 0) as avg_price,
        coalesce((max(hr.nightly_rate) - min(hr.nightly_rate)), 0) as price_spread
    from hotels h
    join destinations d on d.id = h.destination_id
    join hotel_rooms hr on hr.hotel_id = h.id
    group by h.hotel_name
)

select hotel_name,
    star_class,
    destination_name,
    room_count,
    min_price,
    max_price,
    avg_price,
    price_spread,
    rank() over(partition by destination_name order by avg_price desc) as rank_in_destination
from room_info
where room_count >= 2
order by destination_name asc, rank_in_destination asc, hotel_name asc;

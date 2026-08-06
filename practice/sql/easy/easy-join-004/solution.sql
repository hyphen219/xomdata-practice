-- Xom Data · Today's showtimes in time order
-- Problem: https://xomdata.com/practice/easy-join-004
-- Solved: 2026-08-06

-- Viết SQL của bạn ở đây
select
    start_time,
    title,
    screen
from movies m
join showtimes s on m.id = s.movie_id
order by start_time asc, title asc

-- Xom Data · Showtime count and average ticket price per film
-- Problem: https://xomdata.com/practice/medium-join-076
-- Solved: 2026-07-27

with info as (
    select
        m.movie_name,
        m.genres,
        count(s.id) as showtime_count,
        round(avg(ticket_price), 2) as avg_ticket_price
    from movies m
    left join showtimes s on m.id = s.movie_id
    group by m.movie_name
)
select
    movie_name,
    genres,
    showtime_count,
    avg_ticket_price,
    dense_rank() over(partition by genres order by avg_ticket_price desc) as rank_in_genre,
    first_value(movie_name) over(partition by genres order by avg_ticket_price desc) as top_movie_in_genre
from info
order by genres asc, rank_in_genre, movie_name asc;

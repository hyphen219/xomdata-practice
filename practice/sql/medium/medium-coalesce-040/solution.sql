-- Xom Data · Book count and average price by genre
-- Problem: https://xomdata.com/practice/medium-coalesce-040
-- Solved: 2026-07-17

with book_info as (
    select g.genre_name,
        coalesce(count(b.id), 0) as book_count,
        coalesce(round(avg(b.price), 0), 0) as avg_price,
        coalesce(min(b.price), 0) as min_price,
        coalesce(max(b.price), 0) as max_price,
        coalesce(max(b.price)-min(b.price),0) as price_range
    from genres g
    left join books as b on b.genre_id = g.id
    group by g.genre_name
)

select genre_name,
    book_count,
    avg_price,
    min_price,
    max_price,
    price_range,
    rank() over(order by book_count desc) as coverage_rank,
    ntile(3) over (order by book_count desc) as library_focus
from book_info
order by coverage_rank asc, genre_name asc

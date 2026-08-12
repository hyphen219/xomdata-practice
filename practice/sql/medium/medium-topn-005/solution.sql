-- Xom Data · Top two films per genre, rank included
-- Problem: https://xomdata.com/practice/medium-topn-005
-- Solved: 2026-08-12

-- Viết SQL của bạn ở đây
with info as(
    select
        genre,
        row_number() over(partition by genre order by revenue desc, title asc) as rank_in_genre,
        title,
        revenue
    from box_office
)
select
    genre,
    rank_in_genre,
    title,
    revenue
from info
where rank_in_genre <= 2
order by genre asc, rank_in_genre asc;

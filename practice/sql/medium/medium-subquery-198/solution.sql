-- Xom Data · Top 10 most-borrowed books
-- Problem: https://xomdata.com/practice/medium-subquery-198
-- Solved: 2026-07-27

with info as (
    select
        b.title,
        a.full_name as authors,
        p.publisher_name,
        g.genre_name
    from books b
    left join authors a on a.id = b.author_id
    left join publishers p on p.id = b.publisher_id
    left join genres g on g.id = b.genre_id
    group by b.id, b.title
),
reserve as (
    select
        b.title,
        count(case
                when r.status = 'ready_pickup' then r.id
                else null end) as pending_reservation
    from books b
    left join reservations r on r.book_id = b.id
    group by b.title
),
bl as (
    select
        b.title,
        count(bl.id) as borrow_count
    from books b
    left join book_loans bl on bl.book_id = b.id
    group by b.title
)
select
    i.title,
    authors,
    publisher_name,
    genre_name,
    borrow_count,
    pending_reservation,
    (borrow_count + pending_reservation) as engagement,
    DENSE_RANK() over(order by (borrow_count + pending_reservation) desc) as overall_rank,
    rank() over(partition by genre_name order by (borrow_count + pending_reservation) desc) as rank_in_genre
from info i
join reserve r on r.title = i.title
join bl on bl.title = i.title
where borrow_count >= 1
order by overall_rank asc, i.title asc
limit 10;

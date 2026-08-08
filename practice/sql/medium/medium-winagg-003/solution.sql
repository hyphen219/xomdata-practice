-- Xom Data · Distance from the class average
-- Problem: https://xomdata.com/practice/medium-winagg-003
-- Solved: 2026-08-08

-- Viết SQL của bạn ở đây
with avg as(
    select
        class_name,
        student_name,
        score,
        avg(score) over(partition by class_name) as avg_class
    from scores
)

select
    class_name,
    student_name,
    score,
    round(score*1.0 - avg_class, 2) as diff_from_avg
from avg
order by class_name asc, student_name asc

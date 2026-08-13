-- Xom Data · Valedictorian, salutatorian, and the score gap
-- Problem: https://xomdata.com/practice/medium-topn-006
-- Solved: 2026-08-13

-- Viết SQL của bạn ở đây
with fin as(
    select
        class_name,
        row_number() over (partition by class_name order by score desc, student_name asc) as position,
        student_name,
        score,
        max(score) over(partition by class_name) as top_score
    from students
)
select
    class_name,
    position,
    student_name,
    score,
    top_score - score as behind_top
from fin
where position in (1, 2)
order by class_name, position asc;

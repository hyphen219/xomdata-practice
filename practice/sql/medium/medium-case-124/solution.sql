-- Xom Data · Classify student academic performance
-- Problem: https://xomdata.com/practice/medium-case-124
-- Solved: 2026-07-24

with rank as (
    select s.full_name,
           s.student_code,
           round(avg(sc.final_score), 2) as avg_score
    from students s
    left join scores sc on s.id = sc.student_id
    group by s.full_name
)
select full_name,
       student_code,
       avg_score,
       case
        when avg_score >= 9 then 'Excellent'
        when avg_score >= 8 then 'Good'
        when avg_score >= 7 then 'Fair'
        when avg_score >= 5 then 'Average'
        else 'Poor' end as grade,
        dense_rank() over (order by avg_score desc) as class_rank
from rank
order by avg_score desc, student_code asc
limit 20;

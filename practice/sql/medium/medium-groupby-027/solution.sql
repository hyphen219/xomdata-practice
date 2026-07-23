-- Xom Data · Average score per subject
-- Problem: https://xomdata.com/practice/medium-groupby-027
-- Solved: 2026-07-23

with avg_sub as (
    select s1.subject_name as name,
           s1.credits,
           count(g.id) as student_count,
           round(avg(g.final_score)*1.0, 2) as avg_score
    from subjects s1
    left join grades g on s1.id = g.subject_id
    group by s1.subject_name
),
    pass_5 as (
    select s2.subject_name,
           sum(case when g.final_score >= 5 then 1 else 0 end) as num_over_5
    from subjects s2
    left join grades as g on s2.id = g.subject_id
    group by s2.subject_name
)

select a.name as subject_name,
       credits,
       student_count,
       avg_score,
       round((num_over_5*100.0/student_count), 2) as pass_rate,
       rank() over(order by avg_score desc) as rank_by_avg,
       ntile(4) over(order by avg_score desc, subject_name asc) as difficulty_quartile
from avg_sub a
join pass_5 p on a.name = p.subject_name
order by rank_by_avg asc, a.name asc;

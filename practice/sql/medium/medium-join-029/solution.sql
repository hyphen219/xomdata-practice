-- Xom Data · Instructor teaching load
-- Problem: https://xomdata.com/practice/medium-join-029
-- Solved: 2026-07-27

with info as (
    select
        l.full_name,
        l.academic_degree,
        count(s.id) as subjects_taught
    from lecturers l
    left join subjects s on l.id = lecturer_id
    group by full_name
)
select
    full_name,
    academic_degree,
    subjects_taught,
    rank() over(order by subjects_taught desc) as workload_rank,
    sum(subjects_taught) over(order by subjects_taught desc rows between unbounded preceding and current row) as cumulative_subjects
from info
order by workload_rank asc, full_name asc;

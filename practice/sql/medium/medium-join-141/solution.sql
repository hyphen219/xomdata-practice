-- Xom Data · Consultation revenue by doctor
-- Problem: https://xomdata.com/practice/medium-join-141
-- Solved: 2026-07-18

with doc_info as (
    select f.faculty_name,
        d.full_name as doctor_name,
        count(v.id) as visit_count,
        avg(v.visit_fee) as avg_exam_fee,
        sum(v.visit_fee) as total_exam_fee
    from doctors d
    join faculties f on f.id = d.faculty_id
    join medical_visits v on v.doctor_id = d.id
    group by doctor_name, f.faculty_name
)

select faculty_name,
    doctor_name,
    visit_count,
    avg_exam_fee,
    total_exam_fee,
    rank() over(order by total_exam_fee desc) as overall_rank,
    dense_rank() over(partition by faculty_name order by total_exam_fee desc) as rank_in_faculty
from doc_info
order by total_exam_fee desc, doctor_name asc
limit 15;

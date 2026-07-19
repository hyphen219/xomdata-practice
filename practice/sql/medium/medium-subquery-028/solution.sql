-- Xom Data · Students above the subject average
-- Problem: https://xomdata.com/practice/medium-subquery-028
-- Solved: 2026-07-19

with sv_stat as (
	select s.full_name,
		su.subject_name,
		g.final_score,
		round(avg(g.final_score) over(partition by su.subject_name), 2) as subject_avg
	from grades g
	join subjects su on su.id = g.subject_id
	join students s on s.id = g.student_id
)

select full_name,
	subject_name,
	final_score,
	subject_avg,
	(final_score - subject_avg) as diff_from_avg
from sv_stat
where final_score > subject_avg
order by diff_from_avg desc, subject_name asc, full_name asc;

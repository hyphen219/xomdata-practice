-- Xom Data · Candidates not yet interviewed
-- Problem: https://xomdata.com/practice/medium-leftjoin-031
-- Solved: 2026-07-19

with cand_stat as (
	select c.full_name,
		c.email,
		c.application_date,
		row_number() over(order by application_date, c.full_name asc) as queue_position
	from candidates c
	left join interviews i on c.id = i.candidate_id
	where i.id is null
)

select full_name,
	email,
	application_date,
	queue_position,
	round(coalesce((((queue_position - 1)*100.0)/(select max(queue_position) - 1 from cand_stat)), 0), 2) as older_than_pct
from cand_stat
group by full_name
order by queue_position asc;

-- Xom Data · Latest readings and over-limit alerts
-- Problem: https://xomdata.com/practice/medium-dedup-003
-- Solved: 2026-08-07

-- Viết SQL của bạn ở đây
with inf as(
    select
    sensor_name,
    reading_date,
    max(reading_date) over(partition by sensor_name) as maxi,
    temp_c,
    max_temp,
    case
    when temp_c > max_temp then 'Alert'
    else 'Normal' end as status
from readings r
join sensors s on s.id = r.sensor_id
)

select
    sensor_name,
    reading_date,
    temp_c,
    max_temp,
    status
from inf
where reading_date = maxi;

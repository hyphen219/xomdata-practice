-- Xom Data · Detect anomalous days vs the average
-- Problem: https://xomdata.com/practice/hard-anomaly-001
-- Solved: 2026-07-28

with stat as (
    select
        date,
        value,
        round(avg(value) over(), 2) as mean,
        count(value) over() as num
    from daily_metrics
),
devi as (
    select
        date,
        value,
        mean,
        round(sqrt((sum((value - mean)*(value - mean)) over())/(num)), 2) as stddev
    from stat
)
select
    date,
    value,
    mean,
    stddev,
    coalesce(round((value - mean)/stddev, 2), 0) as z_score,
    case
    when coalesce(round((value - mean)/stddev, 2), 0) > 2 then 'high'
    when coalesce(round((value - mean)/stddev, 2), 0) < -2 then 'low'
    else 'normal' end as flag
from devi;

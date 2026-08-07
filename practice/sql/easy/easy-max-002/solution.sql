-- Xom Data · Peak-hour electricity record
-- Problem: https://xomdata.com/practice/easy-max-002
-- Solved: 2026-08-07

-- Viết SQL của bạn ở đây
select
    max(kwh) as peak_load
from power_readings
where period = 'Peak'

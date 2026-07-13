-- Xom Data · Patients with blood type O+
-- Problem: https://xomdata.com/practice/easy-where-020
-- Solved: 2026-07-13

select full_name, blood_type
from patients
where blood_type = 'O+'
order by full_name asc;

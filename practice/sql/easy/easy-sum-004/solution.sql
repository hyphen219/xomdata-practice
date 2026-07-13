-- Xom Data · Total shipping fees collected
-- Problem: https://xomdata.com/practice/easy-sum-004
-- Solved: 2026-07-13

select sum(shipping_fee) as total_fee
from shipments;

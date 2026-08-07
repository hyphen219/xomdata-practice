-- Xom Data · Display rates for the app
-- Problem: https://xomdata.com/practice/easy-round-001
-- Solved: 2026-08-07

-- Viết SQL của bạn ở đây
select
    currency_pair,
    round(raw_rate, 2) as display_rate
from fx_rates

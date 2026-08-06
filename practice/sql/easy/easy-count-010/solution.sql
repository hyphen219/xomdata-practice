-- Xom Data · Tickets still valid
-- Problem: https://xomdata.com/practice/easy-count-010
-- Solved: 2026-08-06

-- Viết SQL của bạn ở đây
select
    sum(case when status = 'Valid' then 1 else 0 end) as valid_tickets
from tickets;

-- Xom Data · Ticket statuses guests can read
-- Problem: https://xomdata.com/practice/easy-join-005
-- Solved: 2026-08-06

-- Viết SQL của bạn ở đây
select
    ticket_code,
    status_name
from statuses s
join tickets t on s.code = t.status_code

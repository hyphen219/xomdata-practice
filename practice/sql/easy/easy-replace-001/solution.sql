-- Xom Data · Article URLs from headlines
-- Problem: https://xomdata.com/practice/easy-replace-001
-- Solved: 2026-08-07

-- Viết SQL của bạn ở đây
select
    title,
    replace(title, ' ', '-') as url_slug
from articles;

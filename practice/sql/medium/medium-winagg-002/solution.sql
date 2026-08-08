-- Xom Data · Product share within its store
-- Problem: https://xomdata.com/practice/medium-winagg-002
-- Solved: 2026-08-08

-- Viết SQL của bạn ở đây
with pct as(
    select
        store,
        product,
        amount,
        sum(amount) over(partition by store) as sum_store
    from store_sales
)

select
    store,
    product,
    amount,
    round(amount*100.0/sum_store, 2) as pct_of_store
from pct
order by store asc, product asc;

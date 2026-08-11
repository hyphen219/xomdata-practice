-- Xom Data · This invoice's share of the client's spend
-- Problem: https://xomdata.com/practice/medium-winjoin-005
-- Solved: 2026-08-11

-- Viết SQL của bạn ở đây
with total as(
    select
        client_name,
        invoice_code,
        amount,
        sum(amount) over(partition by client_name) as total_client
    from clients c
    join invoices i on c.id = i.client_id
)

select
    client_name,
    invoice_code,
    amount,
    round(amount*100.0/total_client, 2) as pct_of_client
from total
order by client_name asc, amount desc, invoice_code asc;

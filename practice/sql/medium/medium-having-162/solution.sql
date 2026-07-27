-- Xom Data · Suppliers that deliver late frequently
-- Problem: https://xomdata.com/practice/medium-having-162
-- Solved: 2026-07-27

with info as (
    SELECT
        s.supplier_name,
        s.material_type,
        count(p.id) as purchase_count,
        sum(p.total_value) as total_purchase_value
    from suppliers s
    left join purchase_orders p on s.id = p.supplier_id
    group by s.supplier_name
),
datediff as (
    select
        s.supplier_name,
        expected_receipt,
        actual_receipt,
        julianday(actual_receipt) - julianday(expected_receipt) as date_diff,
        count(supplier_name) over(partition by supplier_name) as datenum
    from suppliers s
    left join purchase_orders p on s.id = p.supplier_id
),
avg as (
    SELECT distinct
        supplier_name,
        round(avg(date_diff) over(partition by supplier_name)*1.0, 2) as avg_late_days,
        datenum,
        count(CASE
                when date_diff <= 0 then supplier_name
                else NULL end) over(partition by supplier_name) as on_time_date
    from datediff
    --group by supplier_name
)
select
    i.supplier_name,
    i.material_type,
    i.purchase_count,
    i.total_purchase_value,
    avg.avg_late_days,
    round(on_time_date*100.0/datenum, 2) as on_time_rate,
    rank() over(order by avg.avg_late_days desc) as late_rank,
    ntile(4) over(order by avg.avg_late_days desc) as risk_tier
from info i
right join avg on avg.supplier_name = i.supplier_name
where purchase_count >= 3 and avg_late_days > 0
order by late_rank asc, i.supplier_name asc;

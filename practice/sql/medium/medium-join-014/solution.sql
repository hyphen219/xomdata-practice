-- Xom Data · Stock-in history by supplier
-- Problem: https://xomdata.com/practice/medium-join-014
-- Solved: 2026-07-27

with info as(
    SELECT
        w.warehouse_name,
        count(s.id) as import_count,
        count(distinct p.name) as distinct_product_count,
        count(distinct s.suppliers) as distinct_supplier_count,
        max(import_date) as last_import_date
    from warehouses w
    left join stock_imports s on s.warehouse_id = w.id
    left join products p on p.id = s.product_id
    group by warehouse_name
)
select
    warehouse_name,
    import_count,
    distinct_product_count,
    distinct_supplier_count,
    last_import_date,
    rank() over(order by import_count desc) as activity_rank,
    lag(warehouse_name, 1) over() as prev_warehouse
from info
order by activity_rank asc, warehouse_name asc;

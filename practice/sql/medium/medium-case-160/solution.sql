-- Xom Data · Delivery performance by size class
-- Problem: https://xomdata.com/practice/medium-case-160
-- Solved: 2026-07-26

with info as (
    select
        t.vehicle_type,
        t.capacity_tons,
        count(s.id) as shipment_count,
        case
        when capacity_tons >= 10 then 'Large Truck'
        when capacity_tons >= 5 then 'Medium Truck'
        else 'Small Truck'
        end as size_class,
        count(case
        when results = 'success' then d.id
        else NULL
        end) as delivered
    from trucks t
    left join shipments s on t.id = s.truck_id
    left join deliveries d on d.shipment_id = s.id
    group by t.vehicle_type
)
SELECT
    vehicle_type,
    capacity_tons,
    shipment_count,
    size_class,
    delivered,
    round(delivered*100.0/shipment_count, 2) as delivery_rate,
    rank() over(partition by size_class order by round(delivered*100.0/shipment_count, 2) desc) as rank_in_size
from info
order by size_class asc, rank_in_size asc, vehicle_type asc;

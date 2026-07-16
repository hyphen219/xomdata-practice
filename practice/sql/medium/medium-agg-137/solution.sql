-- Xom Data · Investor trade summary
-- Problem: https://xomdata.com/practice/medium-agg-137
-- Solved: 2026-07-16

-- Summarize buy/sell totals per investor
with invest_info as (
    select i.full_name,
        i.segment,
        count(t.id) as total_trades,
        coalesce(sum(case
                    when t.side = 'buy' then t.amount
                    else 0
                    end), 0) as total_bought,
        coalesce(sum(case
                    when t.side = 'sell' then t.amount
                    else 0
                    end), 0) as total_sold
    from investors i
    join trades t on t.investor_id = i.id
    group by i.id, i.full_name, i.segment
)

select full_name,
    segment,
    total_trades,
    total_bought,
    total_sold,
    (total_bought - total_sold) as net_position,
    case
    when (total_bought - total_sold) > 0 then 'Bull'
    when (total_bought - total_sold) < 0 then 'Bear'
    else 'Neutral'
    end as stance,
    dense_rank () over(partition by segment order by (total_bought + total_sold) desc) as rank_in_segment
from invest_info
order by (total_bought + total_sold) desc, full_name asc;

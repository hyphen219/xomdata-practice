-- Xom Data · Portfolio profit/loss
-- Problem: https://xomdata.com/practice/medium-casewhen-047
-- Solved: 2026-07-26

with portfolio as (
    SELECT
        s.stock_code,
        c.stock_quantity,
        c.avg_cost_price,
        s.current_price,
        round((current_price - avg_cost_price)*stock_quantity, 0) as profit_loss,
        round((current_price - avg_cost_price)*100.0/avg_cost_price, 2) as profit_pct,
        (avg_cost_price*stock_quantity) as total_invested_capital
    from stocks s
    left join categories c on s.id = c.stock_id
)
select
    stock_code,
    stock_quantity,
    avg_cost_price,
    current_price,
    profit_loss,
    profit_pct,
    CASE
    when profit_pct > 10 then 'Strong Gain'
    when profit_pct > 0 then 'Mild Gain'
    when profit_pct = 0 then 'Break Even'
    when profit_pct > -10 then 'Mild Loss'
    else 'Strong Loss'
    end as status,
    rank() over(order by profit_pct desc) as rank_by_pct,
    sum(total_invested_capital) over(order by profit_pct desc, stock_code asc) as cumulative_invested
from portfolio
order by rank_by_pct asc, stock_code asc;

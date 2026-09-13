-- Xom Data · Tuổi đời mua sắm của khách
-- Problem: https://xomdata.com/practice/medium-cohort-006
-- Solved: 2026-09-13

WITH fin AS (
    SELECT
        customer_id,
        MIN(order_date) AS first_order_date,
        MAX(order_date) AS last_order_date
    FROM orders
    GROUP BY customer_id
)
SELECT
    customer_id,
    strftime('%Y-%m', first_order_date) AS first_month,
    strftime('%Y-%m', last_order_date) AS last_month,
    (CAST(strftime('%Y', last_order_date) AS INTEGER) - CAST(strftime('%Y', first_order_date) AS INTEGER)) * 12
      + (CAST(strftime('%m', last_order_date) AS INTEGER) - CAST(strftime('%m', first_order_date) AS INTEGER)) AS tenure_months
FROM fin
ORDER BY tenure_months DESC, customer_id ASC;

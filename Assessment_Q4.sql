WITH customer_txns AS (
    SELECT 
        cu.id AS customer_id,
        cu.name,
        DATE_PART('month', AGE(CURRENT_DATE, cu.date_joined)) AS tenure_months,
        COUNT(ss.id) AS total_transactions,
        SUM(ss.confirmed_amount) / 100.0 AS total_value
    FROM users_customuser cu
    JOIN savings_savingsaccount ss ON cu.id = ss.owner_id
    GROUP BY cu.id, cu.name, cu.date_joined
),
clv_calc AS (
    SELECT *,
        ROUND((total_transactions::decimal / NULLIF(tenure_months, 0)) * 12 * 0.001 * (total_value / NULLIF(total_transactions, 0)), 2) AS estimated_clv
    FROM customer_txns
)
SELECT customer_id, name, tenure_months, total_transactions, estimated_clv
FROM clv_calc
ORDER BY estimated_clv DESC;

WITH transactions AS (
    SELECT 
        owner_id,
        DATE_TRUNC('month', transaction_date) AS month,
        COUNT(*) AS monthly_txn
    FROM savings_savingsaccount
    GROUP BY owner_id, month
),
avg_txn_per_cust AS (
    SELECT 
        owner_id,
        AVG(monthly_txn) AS avg_txn_per_month
    FROM transactions
    GROUP BY owner_id
)
SELECT 
    CASE
        WHEN avg_txn_per_month >= 10 THEN 'High Frequency'
        WHEN avg_txn_per_month BETWEEN 3 AND 9 THEN 'Medium Frequency'
        ELSE 'Low Frequency'
    END AS frequency_category,
    COUNT(*) AS customer_count,
    ROUND(AVG(avg_txn_per_month), 1) AS avg_transactions_per_month
FROM avg_txn_per_cust
GROUP BY frequency_category;

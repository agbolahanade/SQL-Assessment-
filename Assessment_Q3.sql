WITH all_accounts AS (
    SELECT id AS plan_id, owner_id, 'Savings' AS type, last_transaction_date
    FROM savings_savingsaccount
    UNION ALL
    SELECT id AS plan_id, owner_id, 'Investment' AS type, last_transaction_date
    FROM plans_plan
),
inactivity AS (
    SELECT 
        plan_id,
        owner_id,
        type,
        last_transaction_date,
        DATE_PART('day', CURRENT_DATE - last_transaction_date) AS inactivity_days
    FROM all_accounts
)
SELECT *
FROM inactivity
WHERE inactivity_days > 365
ORDER BY inactivity_days DESC;

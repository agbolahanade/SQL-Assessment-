SELECT 
    cu.id AS owner_id,
    cu.name,
    COUNT(DISTINCT ss.id) AS savings_count,
    COUNT(DISTINCT pp.id) AS investment_count,
    SUM(ss.confirmed_amount) / 100.0 AS total_deposits
FROM users_customuser cu
JOIN savings_savingsaccount ss ON cu.id = ss.owner_id AND ss.is_regular_savings = 1
JOIN plans_plan pp ON cu.id = pp.owner_id AND pp.is_a_fund = 1
WHERE ss.confirmed_amount > 0
  AND pp.confirmed_amount > 0
GROUP BY cu.id, cu.name
ORDER BY total_deposits DESC;

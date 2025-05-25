SELECT cost_center, SUM(amount) AS total_cost
FROM expenses
GROUP BY cost_center
ORDER BY total_cost DESC;
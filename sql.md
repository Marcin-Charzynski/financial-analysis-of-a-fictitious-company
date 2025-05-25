---
layout: page
title: SQL Analysis
permalink: /sql/
---

## 🛢 SQL-Based Cost Center Analysis

Used **SQL queries** to analyze cost center spending, identify trends, and support strategic planning.

### Highlights

- Aggregated and filtered department-level expenses.
- Identified top contributing cost centers by category.
- Built base queries for financial drilldowns and dashboards.

### Example Query

```sql
SELECT department, category, SUM(amount) AS total_spent
FROM expenses
WHERE date BETWEEN '2023-01-01' AND '2023-12-31'
GROUP BY department, category
ORDER BY total_spent DESC;

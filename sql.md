---
layout: page
title: SQL Analysis
permalink: /sql/
---

# 🛢 SQL-Based Cost Center & Business Finance Analysis

This page documents the SQL-driven analysis performed on a fictional company’s finance and HR database. Using SQL queries, we explore cost centers, project allocations, employee compensation, and hiring trends to support data-driven strategic planning.

---

## Database Schema Overview

The database **business_finance.db** consists of the following tables:

| Table               | Description                                         | Key Columns                                 |
|---------------------|-----------------------------------------------------|---------------------------------------------|
| **departments**       | Departments within the company                       | **department_id** (PK), **department_name**     |
| **employees**         | Employee details                                     | **employee_id** (PK), **full_name**, **department_id** (FK), **hire_date** |
| **projects**          | Company projects                                     | **project_id** (PK), **project_name**, **department_id** (FK), **start_date**, **end_date** |
| **project_allocations** | Allocation of employees to projects                 | **allocation_id** (PK), **project_id** (FK), **employee_id** (FK), **allocation_percentage** |
| **financials**        | Monthly financials per department                     | **id** (PK), **month** (YYYY-MM), **department_id** (FK), **revenue**, **expenses**, **profit**, **margin** |
| **salaries**          | Employee salary and bonus details                     | **salary_id** (PK), **employee_id** (FK), **base_salary**, **bonus** |

---

## Complex SQL Queries and Their Purpose

### 1. Monthly Profit Trend by Department

Analyze the monthly profit over the last two years, aggregated by department, to identify profitability trends and seasonal patterns.

<details>
<summary>Click to view code</summary>
<pre class="overflow-x-auto bg-gray-800 text-green-400 p-4 rounded-md text-sm font-mono"><code class="language-sql">
SELECT
    month,
    d.department_name,
    SUM(financials.profit) AS total_profit
FROM financials
JOIN departments d ON financials.department_id = d.department_id
GROUP BY month, d.department_name
ORDER BY month, d.department_name;
</code></pre>
</details>

---

### 2. Average Employee Compensation by Department

Calculate the average base salary and bonus per department, along with the number of employees, to understand compensation distribution across departments.

<details>
<summary>Click to view code</summary>
<pre class="overflow-x-auto bg-gray-800 text-green-400 p-4 rounded-md text-sm font-mono"><code class="language-sql">
SELECT
    d.department_name,
    AVG(s.base_salary) AS avg_base_salary,
    AVG(s.bonus) AS avg_bonus,
    COUNT(e.employee_id) AS num_employees
FROM salaries s
JOIN employees e ON s.employee_id = e.employee_id
JOIN departments d ON e.department_id = d.department_id
GROUP BY d.department_name
ORDER BY avg_base_salary DESC;
</code></pre>
</details>

---

### 3. Project Allocation Intensity

Evaluate the average percentage allocation of employees to projects per department, and count the number of employees allocated to each project, highlighting resource distribution and workload.

<details>
<summary>Click to view code</summary>
<pre class="overflow-x-auto bg-gray-800 text-green-400 p-4 rounded-md text-sm font-mono"><code class="language-sql">
SELECT
    d.department_name,
    p.project_name,
    AVG(pa.allocation_percentage) AS avg_allocation_percentage,
    COUNT(pa.employee_id) AS num_employees_allocated
FROM project_allocations pa
JOIN projects p ON pa.project_id = p.project_id
JOIN departments d ON p.department_id = d.department_id
GROUP BY d.department_name, p.project_name
ORDER BY d.department_name, avg_allocation_percentage DESC;
</code></pre>
</details>

---

### 4. Employee Hiring Trends by Department and Year

Track the number of employees hired each year within each department to analyze recruitment patterns and growth trends.

<details>
<summary>Click to view code</summary>
<pre class="overflow-x-auto bg-gray-800 text-green-400 p-4 rounded-md text-sm font-mono"><code class="language-sql">
SELECT
    d.department_name,
    STRFTIME('%Y', e.hire_date) AS hire_year,
    COUNT(e.employee_id) AS num_hired
FROM employees e
JOIN departments d ON e.department_id = d.department_id
GROUP BY d.department_name, hire_year
ORDER BY d.department_name, hire_year;
</code></pre>
</details>

---

## Additional Analysis Ideas

To deepen insights, consider adding:

- **Employee retention analysis:** Calculate average tenure and turnover rate per department.
- **Budget variance tracking:** Compare monthly planned vs actual expenses to identify budget deviations.
- **Project profitability:** Link project allocations and financials to estimate profit contribution per project.
- **Bonus distribution patterns:** Analyze bonus amounts by department and performance indicators.
- **Seasonality in hiring:** Explore if hiring spikes correlate with business cycles or project starts.
- **Cross-department collaboration:** Analyze employees allocated to projects spanning multiple departments.
- **Forecasting:** Use historical financials and hiring trends to build predictive models for budgeting and workforce planning.

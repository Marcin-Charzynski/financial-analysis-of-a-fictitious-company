---
layout: page
title: 📊 Financial Charts
permalink: /charts/
---

# 📈 Financial Performance Charts

These charts illustrate monthly departmental financial performance across categories like Sales, Marketing, Operations, and IT. Based on a dataset of over 140 entries, each data point includes Expenses, Revenue, Profit, and Profit Margin, broken down by month and department from January 2023 to December 2024.

The visualizations were created in Jupyter Notebook using Python libraries such as **Pandas**, **Matplotlib**, and **Seaborn**.

---

## 1. Financial Overview Over Time

![Line chart of revenue, expenses, and profit over time]({{ site.baseurl }}/assets/jupyter_notebooks_charts/financial-overview-line.png)

> A line chart showing how Revenue, Expenses, and Profit have evolved over time.

---

## 2. Profit Margin Over Time by Department

![Bar chart of profit margin by department]({{ site.baseurl }}/assets/jupyter_notebooks_charts/profit-margin-department-bar.png)

> Profit Margin broken down by department for each month.

---

## 3. Average Financials by Department

![Bar chart of average revenue, expenses, and profit by department]({{ site.baseurl }}/assets/jupyter_notebooks_charts/avg-financials-by-department-bar.png)

> An average summary of key financial metrics across departments.

---

## ⚙️ Technologies Used

- Python (**Pandas**, **Matplotlib**, and **Seaborn**)
- Jupyter Notebooks
- Exported static charts for web embedding
- Input data: structured CSV files containing bank transaction records and interest calculations, enriched with exchange rates via external API

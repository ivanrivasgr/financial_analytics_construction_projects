# 📊 Metabase Dashboard Documentation

This document provides a detailed overview of the Metabase dashboards built for financial analysis of construction projects.

---

## 🧭 Overview

The Metabase dashboard consolidates financial data from multiple project accounting files to provide a unified view of:
- **Total Income**
- **Total Expenses**
- **Gross Margin**
- **Profitability by Project**
- **Financial Flow Trends**

The dashboard allows dynamic filtering by **Project**, **Date**, and **Entity**, providing insights into income and cost structure per client or project.

---

## 🧱 Data Sources

The dashboards are powered by three core SQL models:

```
| Model | Description |
|-------|--------------|
| `full_invoices_lowe_by_project.sql` | Aggregates invoice-level data per project. |
| `model_financial_flow_details.sql` | Calculates detailed income and expense flows by date. |
| `model_financial_flow_consolidated.sql` | Combines all financial indicators into a summarized dataset for visualization. |

All models are stored in the `sql_models/` directory and feed the `modelo_flujo_financiero_detalle` dataset in Metabase.

```
---

## 📈 Key Metrics

```
| Metric | Definition | Calculation |
|--------|-------------|--------------|
| **Total Income** | Total incoming funds for each project | `SUM(CASE WHEN direction = 'Income' THEN ABS(signed_amount) END)` |
| **Total Expenses** | Outgoing funds such as materials, payroll, or admin costs | `SUM(CASE WHEN direction = 'Expense' THEN ABS(signed_amount) END)` |
| **Net Profit** | Difference between total income and total expenses | `Income - Expenses` |
| **Profit Margin** | Percentage of profit over total income | `(Profit / Income) * 100` |
```
---

## 💡 Dashboard Sections

1. **💰 Financial Summary**  
   Displays total income, total expenses, and net profit across all projects.

2. **🏗️ Project Comparison**  
   Bar chart comparing profitability among projects (Villas vs Patterson).

3. **📅 Monthly Trends**  
   Line chart showing the evolution of income and expenses per month.

4. **📊 Expense Breakdown**  
   Pie chart representing cost categories within each project.

5. **🧾 Data Validation Table**  
   Tabular view for quick audits of imported accounting data.

---

## 🧠 Notes

- Data was cleaned manually before model creation, ensuring consistent account names and directions.  
- Each model was validated in Metabase’s native SQL editor before building visualizations.  
- The dashboard can be easily extended by joining future projects or cost centers.

---

## 📎 Related Files

- `docs/Metabase - Demo.pdf`: Visual overview of the final dashboard structure and layout.  
- `sql_models/`: Base SQL scripts used to power the Metabase queries.  
- `data/cleaned/`: Cleaned CSV/XLSX data used as the source for the models.

---

---

## 📈 Dashboard Documentation

For a detailed view of the dashboards built in **Metabase**, including visuals, SQL model relationships, and calculation logic, check out the dedicated documentation below 👇  

👉 [View Metabase Dashboard Documentation](docs/README_Dashboard.md)

This section includes:
- **💰 Total Income Widget** – shows aggregated inflows from financial transactions.  
- **⚖️ Income vs Expense by Project** – compares project-level profitability.  
- **📦 Quantity of Materials by Category** – visualizes material consumption and cost distribution.  

All dashboards are directly connected to the SQL models stored in the `/sql_models/` folder and powered by processed data from `/data/cleaned/`.


**Author:** [@ivanrivasgr](https://github.com/ivanrivasgr)  
**Tooling:** Metabase, PostgreSQL, Excel (manual cleaning), GitHub  
**Purpose:** Demonstrate model-driven dashboard design and data storytelling.

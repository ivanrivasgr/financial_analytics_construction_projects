# 🏗️ Financial Analytics for Construction Projects

This project demonstrates a complete data analytics workflow for **financial monitoring in construction companies**, built using SQL models and interactive dashboards in **Metabase**.

---

## 🎯 Objective
To consolidate P&L (Profit and Loss) and Process data from multiple projects into a unified reporting layer that enables:
- Real-time financial tracking  
- Profitability analysis per project  
- Data-driven decision-making for managers  

---

## 📁 Repository Structure

data/
├── raw/ # Original CSV/XLSX files from accounting systems
└── cleaned/ # Processed and standardized data sources

sql_models/
├── full_invoices_lowe_by_project.sql
├── model_financial_flow_details.sql
└── model_financial_flow_consolidated.sql

dashboards/
└── screenshots/ # Visual examples of the Metabase dashboards

docs/
└── Metabase - Demo.pdf # Overview of dashboard structure and widgets


---

## 🧠 Data Models
- **`full_invoices_lowe_by_project.sql`** → Aggregates invoice data per project.  
- **`model_financial_flow_details.sql`** → Combines P&L and Process data at the transaction level.  
- **`model_financial_flow_consolidated.sql`** → Produces summary KPIs used in the Metabase dashboards.  

---

## 📊 Results
The final dashboards provide:
- Cash flow comparison across projects  
- Monthly revenue and expense evolution  
- Profit margin per business unit  
- KPI cards and trend graphs for decision-makers  

---

## ⚙️ Tech Stack
- **SQL** (ClickHouse / Metabase native queries)  
- **Metabase** for BI dashboards  
- **GitHub** for version control and documentation  

---

## 👤 Author
**Iván Rivas**  
Data Engineer | Business Intelligence Developer  
📧 ivan.rivas00@gmail.com

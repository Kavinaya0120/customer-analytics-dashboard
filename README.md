# 📊 Customer Analytics Dashboard — PostgreSQL & Metabase

A data analytics project that analyzes customer behavior, predicts churn, and calculates Customer Lifetime Value (CLV) using PostgreSQL, with interactive dashboards built in Metabase.

---

## 📁 Project Structure

```plaintext
customer-analytics-dashboard/
├── schema.sql                ← Database structure (tables)
├── insert_data.sql           ← Data generation (1000+ records)
├── views.sql                 ← Analytical queries (Segmentation, Churn, CLV)
├── README.md
└── screenshots/
    ├── dashboard.png
    ├── sales.png
    ├── segmentation.png
    ├── churn.png
    └── clv.png

---

## 🚀 How to Run (Localhost Setup)

### Step 1 — Open PostgreSQL (pgAdmin)
Open pgAdmin 4 and connect to your local server.

---

### Step 2 — Create a Database

Open Query Tool and run:

```sql
CREATE DATABASE customer_analytics;
👉 Open in browser:

http://localhost:3000/dashboard

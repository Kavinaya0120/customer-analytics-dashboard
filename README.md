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
How to Run (Localhost Setup)
Step 1 — Open PostgreSQL (pgAdmin)
Open pgAdmin 4
Connect to your local server
Step 2 — Create a Database

Open Query Tool and run:

CREATE DATABASE customer_analytics;
Step 3 — Connect to Database
Select database → customer_analytics
Open Query Tool
Step 4 — Run Schema (Create Tables)

Paste and run:

-- Run schema.sql

👉 This creates:

customers table
transactions table
Step 5 — Insert Data

Paste and run:

-- Run insert_data.sql

👉 This generates:

1000+ customers
3000+ transactions
Step 6 — Create Analytical Views

Paste and run:

-- Run views.sql

👉 This creates:

Sales trends
Customer segmentation
Churn prediction
CLV analysis
Step 7 — Start Metabase (Localhost)

Download & run Metabase

In terminal:

java -jar metabase.jar

👉 Open browser:

http://localhost:3000
Step 8 — Connect PostgreSQL to Metabase

Enter details:

Host: localhost
Port: 5432
Database: customer_analytics
Username: postgres
Password: your_password
Step 9 — Create Dashboard

Use these views:

vw_sales_trends → Line Chart
vw_customer_segmentation → Pie/Bar Chart
vw_churn_status → Table/Pie
vw_customer_lifetime_value → Bar Chart
Step 10 — View Dashboard

👉 Open in browser:

http://localhost:3000/dashboard

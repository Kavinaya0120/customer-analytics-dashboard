# 📊 Customer Analytics Dashboard — PostgreSQL & Metabase

A data analytics project that analyzes customer behavior, predicts churn, and calculates Customer Lifetime Value (CLV) using PostgreSQL, with interactive dashboards built in Metabase.

---

## 📁 Project Structure

```plaintext
customer-analytics-dashboard/
├── schema.sql
├── insert_data.sql
├── views.sql
├── README.md
└── screenshots/
    ├── dashboard.png
    ├── sales.png
    ├── segmentation.png
    ├── churn.png
    └── clv.png
```

---

## 🚀 How to Run (PostgreSQL + Metabase)

Step 1 — Open PostgreSQL (pgAdmin)

Open pgAdmin 4 and connect to your local server.

Step 2 — Create a Database

Open Query Tool and run:

CREATE DATABASE customer_analytics;
Step 3 — Connect to Database
Select database → customer_analytics
Open Query Tool
Step 4 — Run Schema (Create Tables)

Run the contents of schema.sql:

-- Run schema.sql

This will create:

customers table
transactions table
Step 5 — Insert Data

Run the contents of insert_data.sql:

-- Run insert_data.sql

This will generate:

1000+ customers
3000+ transactions
Step 6 — Create Analytical Views

Run the contents of views.sql:

-- Run views.sql

This will create:

Sales trends
Customer segmentation
Churn prediction
CLV analysis
Step 7 — Start Metabase (Localhost)

Run the following command:

java -jar metabase.jar

Open your browser:
http://localhost:3000

Step 8 — Connect PostgreSQL to Metabase

Enter the following details:

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

Open in browser:
http://localhost:3000/dashboard

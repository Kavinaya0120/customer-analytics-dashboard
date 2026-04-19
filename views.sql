-- ============================================
-- VIEW 1: Sales Trends
-- ============================================
CREATE VIEW vw_sales_trends AS
SELECT
    TO_CHAR(t.purchase_date, 'YYYY-MM') AS sale_month,
    COUNT(t.transaction_id) AS total_transactions,
    SUM(t.amount) AS total_revenue,
    ROUND(AVG(t.amount), 2) AS avg_order_value
FROM transactions t
GROUP BY TO_CHAR(t.purchase_date, 'YYYY-MM')
ORDER BY sale_month;

-- ============================================
-- VIEW 2: Customer Segmentation
-- ============================================
CREATE VIEW vw_customer_segmentation AS
SELECT
    c.customer_id,
    c.name,
    c.city,
    COUNT(t.transaction_id) AS total_purchases,
    SUM(t.amount) AS total_spent,
    CASE
        WHEN SUM(t.amount) > 1500 OR COUNT(t.transaction_id) >= 4 THEN 'High Value'
        WHEN SUM(t.amount) BETWEEN 500 AND 1500 OR COUNT(t.transaction_id) BETWEEN 2 AND 3 THEN 'Medium Value'
        ELSE 'Low Value'
    END AS customer_segment
FROM customers c
JOIN transactions t ON c.customer_id = t.customer_id
GROUP BY c.customer_id, c.name, c.city;

-- ============================================
-- VIEW 3: Churn Status
-- ============================================
CREATE VIEW vw_churn_status AS
SELECT
    c.customer_id,
    c.name,
    c.email,
    c.city,
    MAX(t.purchase_date) AS last_purchase_date,
    CURRENT_DATE - MAX(t.purchase_date) AS days_since_last_purchase,
    CASE
        WHEN CURRENT_DATE - MAX(t.purchase_date) > 365 THEN 'Churn Risk'
        ELSE 'Active'
    END AS churn_status
FROM customers c
JOIN transactions t ON c.customer_id = t.customer_id
GROUP BY c.customer_id, c.name, c.email, c.city;

-- ============================================
-- VIEW 4: Customer Lifetime Value
-- ============================================
CREATE VIEW vw_customer_lifetime_value AS
SELECT
    c.customer_id,
    c.name,
    c.email,
    c.city,
    c.signup_date,
    SUM(t.amount) AS total_spent,
    COUNT(t.transaction_id) AS total_purchases,
    ROUND(SUM(t.amount) / COUNT(t.transaction_id), 2) AS avg_order_value,
    EXTRACT(YEAR FROM AGE(CURRENT_DATE, c.signup_date)) * 12 +
    EXTRACT(MONTH FROM AGE(CURRENT_DATE, c.signup_date)) AS tenure_months,
    ROUND(
        SUM(t.amount) *
        (
            EXTRACT(YEAR FROM AGE(CURRENT_DATE, c.signup_date)) * 12 +
            EXTRACT(MONTH FROM AGE(CURRENT_DATE, c.signup_date))
        ), 2
    ) AS customer_lifetime_value,
    CASE
        WHEN SUM(t.amount) > 2000 THEN 'Highly Profitable'
        WHEN SUM(t.amount) BETWEEN 500 AND 2000 THEN 'Moderately Profitable'
        ELSE 'Low Profitability'
    END AS profitability_tier
FROM customers c
JOIN transactions t ON c.customer_id = t.customer_id
GROUP BY c.customer_id, c.name, c.email, c.city, c.signup_date;
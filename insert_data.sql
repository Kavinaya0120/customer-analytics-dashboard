-- Insert customers
INSERT INTO customers (name, email, city, signup_date, age)
SELECT
    'Customer_' || i,
    'customer' || i || '@example.com',
    'City_' || (i % 20),
    CURRENT_DATE - (RANDOM() * 1000)::INT,
    18 + (RANDOM() * 50)::INT
FROM generate_series(1, 1000) AS s(i);

-- Insert transactions
INSERT INTO transactions (customer_id, amount, purchase_date, product)
SELECT
    (RANDOM() * 999 + 1)::INT,
    (RANDOM() * 1000 + 50)::NUMERIC(10,2),
    CURRENT_DATE - (RANDOM() * 365)::INT,
    'Product_' || (RANDOM() * 10)::INT
FROM generate_series(1, 3000);
-- Customers Table
CREATE TABLE public.customers (
    customer_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(150) UNIQUE NOT NULL,
    city VARCHAR(100),
    signup_date DATE NOT NULL,
    age INT CHECK (age > 0 AND age < 120)
);

-- Transactions Table
CREATE TABLE public.transactions (
    transaction_id SERIAL PRIMARY KEY,
    customer_id INT NOT NULL,
    amount NUMERIC(10,2) NOT NULL CHECK (amount > 0),
    purchase_date DATE NOT NULL,
    product VARCHAR(100),
    CONSTRAINT fk_customer
        FOREIGN KEY (customer_id)
        REFERENCES public.customers(customer_id)
        ON DELETE CASCADE
);

-- Indexes
CREATE INDEX idx_transactions_customer_id
ON public.transactions(customer_id);

CREATE INDEX idx_transactions_purchase_date
ON public.transactions(purchase_date);
-- DATABASE
CREATE DATABASE ecommerce_db;
USE ecommerce_db;

-- TABLES
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100),
    phone VARCHAR(20),
    city VARCHAR(30),
    created_date DATE
);

CREATE TABLE categories (
    category_id INT PRIMARY KEY,
    category_name VARCHAR(100),
    created_date DATE
);

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(150),
    category VARCHAR(100),
    price DECIMAL(10,2),
    stock_quantity INT,
    created_date DATE
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    order_status VARCHAR(30),
    total_amount DECIMAL(10,2)
);

CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    price DECIMAL(10,2)
);

-- SCHEMA EVOLUTION
ALTER TABLE customers
ADD email_verified BOOLEAN DEFAULT FALSE;

ALTER TABLE products
ADD last_updated DATE;

ALTER TABLE customers
RENAME COLUMN phone TO mobile_number;

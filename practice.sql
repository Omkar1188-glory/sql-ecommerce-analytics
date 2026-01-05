USE ecommerce_db;

-- ================================
-- CHECKPOINT 3: BASIC SELECT
-- ================================

-- View all tables
SELECT * FROM customers;
SELECT * FROM products;
SELECT * FROM orders;

-- Select specific columns
SELECT name, city FROM customers;
SELECT product_name, price FROM products;

-- Distinct values
SELECT DISTINCT city FROM customers;
SELECT DISTINCT order_status FROM orders;

-- WHERE clause
SELECT * FROM customers WHERE city = 'Mumbai';
SELECT * FROM products WHERE price > 5000;
SELECT * FROM orders WHERE order_status = 'Pending';

-- Comparison operators
SELECT product_name, price FROM products WHERE price < 1000;
SELECT * FROM orders WHERE order_status != 'Delivered';

-- Logical operators
SELECT * FROM customers WHERE city = 'Mumbai' OR city = 'Delhi';
SELECT * FROM products WHERE category = 'Electronics' AND price > 3000;

-- ================================
-- CHECKPOINT 4: ADVANCED FILTERING
-- ================================

-- BETWEEN
SELECT * FROM orders
WHERE order_date BETWEEN '2024-04-01' AND '2024-04-30';

SELECT * FROM orders
WHERE total_amount BETWEEN 1000 AND 5000;

-- IN
SELECT name, city FROM customers
WHERE city IN ('Mumbai', 'Delhi', 'Pune');

SELECT * FROM orders
WHERE order_status IN ('Pending', 'Shipped');

-- LIKE
SELECT product_name FROM products
WHERE product_name LIKE '%Book%';

SELECT name FROM customers
WHERE name LIKE 'A%';

SELECT name FROM customers
WHERE name LIKE '%a';

-- Wildcards
SELECT name FROM customers
WHERE name LIKE '_____';

-- NULL handling
SELECT * FROM orders WHERE order_status IS NULL;
SELECT * FROM orders WHERE order_status IS NOT NULL;

-- ================================
-- CHECKPOINT 5: ORDER BY & LIMIT
-- ================================

SELECT * FROM orders ORDER BY order_date DESC;
SELECT product_name, price FROM products ORDER BY price DESC LIMIT 5;
SELECT name, city FROM customers ORDER BY city, name;

-- ================================
-- CHECKPOINT 6: AGGREGATES
-- ================================

-- COUNT
SELECT COUNT(*) FROM orders;
SELECT COUNT(*) FROM customers;

-- SUM
SELECT SUM(total_amount) FROM orders;
SELECT SUM(total_amount) FROM orders WHERE order_status = 'Delivered';

-- AVG
SELECT AVG(total_amount) FROM orders;
SELECT AVG(price) FROM products;

-- MIN / MAX
SELECT MIN(price), MAX(price) FROM products;
SELECT MIN(total_amount), MAX(total_amount) FROM orders;

-- ================================
-- CHECKPOINT 7: GROUP BY & HAVING
-- ================================

-- Orders per customer
SELECT customer_id, COUNT(order_id)
FROM orders
GROUP BY customer_id;

-- Revenue per customer
SELECT customer_id, SUM(total_amount) AS total_spent
FROM orders
GROUP BY customer_id;

-- Customers with more than 1 order
SELECT customer_id, COUNT(order_id)
FROM orders
GROUP BY customer_id
HAVING COUNT(order_id) > 1;

-- Products per category
SELECT category, COUNT(product_id)
FROM products
GROUP BY category;

-- Categories with avg price > 2000
SELECT category, AVG(price)
FROM products
GROUP BY category
HAVING AVG(price) > 2000;

-- ================================
-- CHECKPOINT 8: UPDATE & DELETE PRACTICE
-- ================================

-- Always verify before update
SELECT * FROM orders WHERE order_id = 103;

UPDATE orders
SET order_status = 'Delivered'
WHERE order_id = 103;

-- Price update (safe update practice)
SELECT product_id, product_name, price
FROM products
WHERE category = 'Electronics';

-- (Example safe update using primary key)
UPDATE products
SET price = price * 1.10
WHERE product_id IN (1, 2);

-- Delete cancelled orders (practice)
SELECT * FROM orders WHERE order_status = 'Cancelled';

-- DELETE FROM orders WHERE order_status = 'Cancelled';

-- ================================
-- CHECKPOINT 9: ALTER / CLEANUP PRACTICE
-- ================================

-- Check structure
DESCRIBE customers;

-- Example column add
-- ALTER TABLE customers ADD test_column VARCHAR(20);

-- Example column drop
-- ALTER TABLE customers DROP COLUMN test_column;

-- Example truncate
-- TRUNCATE TABLE order_items;

USE ecommerce_db;

-- Monthly Revenue Trend
SELECT 
    DATE_FORMAT(order_date, '%Y-%m') AS month,
    SUM(total_amount) AS monthly_revenue
FROM orders
GROUP BY DATE_FORMAT(order_date, '%Y-%m')
ORDER BY month;

-- Top 5 Customers by Spend
SELECT 
    customer_id,
    SUM(total_amount) AS total_spent
FROM orders
GROUP BY customer_id
ORDER BY total_spent DESC
LIMIT 5;

-- Best Selling Products
SELECT 
    product_id,
    SUM(quantity) AS total_quantity_sold
FROM order_items
GROUP BY product_id
ORDER BY total_quantity_sold DESC
LIMIT 5;

-- Revenue by Category
SELECT 
    p.category,
    SUM(oi.quantity * oi.price) AS category_revenue
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
GROUP BY p.category
ORDER BY category_revenue DESC;

-- Customers With No Orders
SELECT 
    c.customer_id,
    c.name
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;

-- City-wise Revenue
SELECT 
    c.city,
    SUM(o.total_amount) AS city_revenue
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.city
ORDER BY city_revenue DESC;

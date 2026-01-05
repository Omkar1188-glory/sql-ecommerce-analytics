USE ecommerce_db;

-- CATEGORIES
INSERT INTO categories VALUES
(1,'Electronics','2024-01-01'),
(2,'Clothing','2024-01-02'),
(3,'Books','2024-01-03'),
(4,'Home Appliances','2024-01-04'),
(5,'Footwear','2024-01-05'),
(6,'Beauty','2024-01-06'),
(7,'Sports','2024-01-07'),
(8,'Furniture','2024-01-08'),
(9,'Toys','2024-01-09'),
(10,'Groceries','2024-01-10'),
(11,'Accessories','2024-01-11');

-- CUSTOMERS
INSERT INTO customers VALUES
(1,'Omkar Kadam','omkar@gmail.com','9324344920','Mumbai','2024-01-01',FALSE),
(2,'Rahul Sharma','rahul@gmail.com','9876543210','Delhi','2024-02-02',FALSE),
(3,'Sneha Patil','sneha@gmail.com','9123456780','Pune','2024-02-03',FALSE),
(4,'Amit Verma','amit@gmail.com','9812345678','Indore','2024-02-04',FALSE),
(5,'Neha Singh','neha@gmail.com','9765432109','Lucknow','2024-02-05',FALSE);

-- PRODUCTS
INSERT INTO products VALUES
(1,'Laptop','Electronics',55000,10,'2024-03-01',NULL),
(2,'Smartphone','Electronics',25000,20,'2024-03-02',NULL),
(3,'SQL Book','Books',499,25,'2024-03-06',NULL),
(4,'T-Shirt','Clothing',799,50,'2024-03-04',NULL);

-- ORDERS
INSERT INTO orders VALUES
(101,1,'2024-04-01','Delivered',55799),
(102,2,'2024-04-02','Delivered',25000),
(103,3,'2024-04-03','Pending',1298);

-- ORDER ITEMS
INSERT INTO order_items VALUES
(1,101,1,1,55000),
(2,101,4,1,799),
(3,102,2,1,25000);

-- Create the database
CREATE DATABASE sql_joins;

-- Show all databases
SHOW DATABASES;

-- Use the newly created database
USE sql_joins;

-- Create the cricket table
CREATE TABLE cricket (
    cricket_id INT AUTO_INCREMENT,    -- Unique identifier for each cricket player
    name VARCHAR(30),                  -- Name of the player
    PRIMARY KEY (cricket_id)           -- Set cricket_id as the primary key
);

-- Create the football table
CREATE TABLE football (
    football_id INT AUTO_INCREMENT,   -- Unique identifier for each football player
    name VARCHAR(30),                  -- Name of the player
    PRIMARY KEY (football_id)          -- Set football_id as the primary key
);

-- Insert values into the cricket table
INSERT INTO cricket (name)
VALUES 
    ('Rohit Sharma'),
    ('Virat Kohli'),
    ('Kapil Dev'),
    ('Sunil Gavaskar'),
    ('Sachin Tendulkar');

-- Select all entries from the cricket table
SELECT * FROM cricket;

-- Insert values into the football table
INSERT INTO football (name)
VALUES 
    ('Lionel Messi'),
    ('Cristiano Ronaldo'),
    ('Neymar Jr.'),
    ('Kylian Mbappe'),
    ('Virat Kohli'),
    ('Pele'),
    ('Diego Maradona');

-- Select all entries from the football table
SELECT * FROM football;

-- Inner join to find players who are present in both tables (Cricket and Football)
SELECT * 
FROM cricket AS c 
INNER JOIN football AS f ON c.name = f.name;

-- Select specific columns from the inner join (Player details from both tables)
SELECT c.cricket_id, c.name AS cricket_name, f.football_id, f.name AS football_name
FROM cricket AS c 
INNER JOIN football AS f ON c.name = f.name;

-- Creating the 'product' table with relevant columns
CREATE TABLE product (
    product_id INT PRIMARY KEY,        -- Unique identifier for each product
    product_name VARCHAR(100),         -- Name of the product
    category VARCHAR(50),              -- Category of the product (e.g., electronics, clothing)
    price FLOAT,                       -- Price of the product
    stock_quantity INT                -- Number of items available in stock
);

-- Inserting values into the 'product' table
INSERT INTO product (product_id, product_name, category, price, stock_quantity) VALUES
(1, 'Smartphone', 'Electronics', 50000, 100),
(2, 'Laptop', 'Electronics', 75000, 50),
(3, 'T-shirt', 'Clothing', 500, 200),
(4, 'Washing Machine', 'Home Appliances', 25000, 30),
(5, 'Refrigerator', 'Home Appliances', 35000, 40),
(6, 'Headphones', 'Electronics', 3000, 150),
(7, 'Coffee Maker', 'Kitchen Appliances', 4500, 80),
(8, 'Watch', 'Accessories', 1500, 120),
(9, 'Shoes', 'Footwear', 2500, 180),
(10, 'Bag', 'Accessories', 1000, 250);

-- Creating the 'product_line' table to store product line details
CREATE TABLE product_line (
    line_id INT PRIMARY KEY,            -- Unique identifier for each product line
    line_name VARCHAR(100),             -- Name of the product line (e.g., 'Smartphones', 'Laptops')
    description TEXT                    -- A brief description of the product line
);

-- Inserting values into the 'product_line' table
INSERT INTO product_line (line_id, line_name, description) VALUES
(1, 'Smartphones', 'A series of advanced mobile phones offering top-tier features like high-end cameras, fast processors, etc.'),
(2, 'Laptops', 'A collection of portable computing devices suited for personal and professional use.'),
(3, 'Clothing', 'A range of fashion items including casual wear, formal wear, and accessories.'),
(4, 'Home Appliances', 'Essential devices for home use, including washing machines, refrigerators, etc.'),
(5, 'Footwear', 'Collection of shoes for different occasions and purposes, including sports shoes, casual shoes, and formal footwear'),
(6, 'Accessories', 'Variety of items to complement lifestyle, including watches, bags, and other personal items.');

-- Updating the 'product' table to include the 'line_id' column for product lines
ALTER TABLE product
ADD COLUMN line_id INT;

-- Linking products to their respective product lines
UPDATE product
SET line_id = 1 WHERE product_id IN (1, 2, 6);  -- Smartphones
UPDATE product
SET line_id = 2 WHERE product_id IN (2, 5);     -- Laptops
UPDATE product
SET line_id = 3 WHERE product_id = 3;            -- Clothing
UPDATE product
SET line_id = 4 WHERE product_id IN (4, 5);      -- Home Appliances
UPDATE product
SET line_id = 5 WHERE product_id = 9;            -- Footwear
UPDATE product
SET line_id = 6 WHERE product_id IN (8, 10);     -- Accessories

-- Select product details with the product line description
SELECT p.product_id, p.product_name, pl.description
FROM product p
INNER JOIN product_line pl
USING (line_id);

-- Create the 'orders' table to store order information
CREATE TABLE orders (
    order_id INT PRIMARY KEY,              -- Unique identifier for the order
    customer_id INT,                       -- ID of the customer who placed the order
    order_date DATE,                       -- Date when the order was placed
    product_id INT,                        -- ID of the product in the order
    quantity INT,                          -- Number of products ordered
    total_price FLOAT,                     -- Total price for the order
    FOREIGN KEY (product_id) REFERENCES product(product_id)  -- Foreign key constraint
);

-- Inserting sample orders into the 'orders' table
INSERT INTO orders (order_id, customer_id, order_date, product_id, quantity, total_price) 
VALUES
(1, 101, '2025-01-15', 1, 3, 2500.50), -- 3 units of product 1
(2, 102, '2025-01-16', 3, 5, 499.95), -- 5 units of product 3
(3, 103, '2025-01-17', 2, 2, 500.00), -- 2 units of product 2
(4, 104, '2025-01-18', 4, 1, 500.00), -- 1 unit of product 4
(5, 105, '2025-01-19', 5, 4, 1397.00), -- 4 units of product 5
(6, 106, '2025-01-20', 1, 2, 1001.00); -- 2 units of product 1

-- Create the 'order_details' table to store order line item details
CREATE TABLE order_details (
    order_detail_id INT PRIMARY KEY,      -- Unique identifier for the order detail
    order_id INT,                          -- ID of the order
    product_id INT,                        -- ID of the product in the order detail
    quantity INT,                          -- Number of products in the order detail
    price_at_time FLOAT,                   -- Price of the product at the time of the order
    total_price FLOAT,                     -- Total price for this specific order detail
    FOREIGN KEY (order_id) REFERENCES orders(order_id),  -- Foreign key to orders table
    FOREIGN KEY (product_id) REFERENCES product(product_id)  -- Foreign key to products table
);

-- Inserting order details for the sample orders
INSERT INTO order_details (order_detail_id, order_id, product_id, quantity, price_at_time, total_price)
VALUES
(1, 1, 1, 3, 250.50, 751.50),  -- 3 units of product 1
(2, 1, 2, 2, 150.75, 301.50),  -- 2 units of product 2
(3, 2, 3, 5, 99.99, 499.95),   -- 5 units of product 3
(4, 3, 2, 2, 250.00, 500.00),  -- 2 units of product 2
(5, 4, 4, 1, 500.00, 500.00),  -- 1 unit of product 4
(6, 5, 5, 4, 349.25, 1397.00); -- 4 units of product 5

-- Join orders, order details, products, and product lines to get complete order information
SELECT 
    o.order_id,
    o.order_date,
    o.customer_id,
    od.order_detail_id,
    od.quantity,
    od.total_price,
    p.product_name,
    pl.description,
    pl.line_name
FROM 
    orders o
INNER JOIN 
    order_details od ON o.order_id = od.order_id
INNER JOIN 
    product p ON od.product_id = p.product_id
INNER JOIN 
    product_line pl ON p.line_id = pl.line_id;

-- Create the 'customer' table to store customer details
CREATE TABLE customer (
    customer_id INT PRIMARY KEY,              -- Unique identifier for the customer
    customer_name VARCHAR(100),               -- Name of the customer
    customer_email VARCHAR(100),              -- Email of the customer
    customer_phone VARCHAR(15),               -- Phone number of the customer
    customer_address VARCHAR(255)             -- Address of the customer
);

-- Inserting customer details into the 'customer' table
INSERT INTO customer (customer_id, customer_name, customer_email, customer_phone, customer_address)
VALUES
(101, 'John Doe', 'john@example.com', '1234567890', '123 Elm Street'),
(102, 'Jane Smith', 'jane@example.com', '0987654321', '456 Oak Avenue'),
(103, 'Mike Johnson', 'mike@example.com', '1122334455', '789 Pine Road'),
(104, 'Sarah Lee', 'sarah@example.com', '2233445566', '101 Maple Lane'),
(105, 'David Brown', 'david@example.com', '3344556677', '202 Cedar Street');

-- Join customer details with orders and products to display complete customer order information
SELECT 
    c.customer_name,
    c.customer_email,
    c.customer_phone,
    o.order_id,
    o.order_date,
    p.product_name,
    od.quantity,
    od.total_price
FROM 
    customer c
INNER JOIN 
    orders o ON c.customer_id = o.customer_id
INNER JOIN 
    order_details od ON o.order_id = od.order_id
INNER JOIN 
    product p ON od.product_id = p.product_id;

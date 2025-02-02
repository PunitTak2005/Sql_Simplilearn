-- Create a database named 'subqueries'
CREATE DATABASE subqueries;
-- Use the 'subqueries' database
USE subqueries;

-- Create the employee table with columns for employee details
CREATE TABLE employee (
    id INT AUTO_INCREMENT,             -- Unique employee ID
    name VARCHAR(100),                 -- Employee name
    city VARCHAR(50),                  -- City of the employee
    department VARCHAR(50),            -- Department in which the employee works
    salary DECIMAL(10, 2),             -- Employee's salary (supports decimals)
    doj DATE,                          -- Date of joining
    gender ENUM('Male', 'Female', 'Other'), -- Gender of the employee, restricted to specific values
    PRIMARY KEY (id)                   -- Set 'id' as the primary key
);

-- Insert sample data into the employee table
INSERT INTO employee (name, city, department, salary, doj, gender) 
VALUES
('John Doe', 'New York', 'IT', 75000.00, '2022-05-15', 'Male'),
('Jane Smith', 'Los Angeles', 'HR', 68000.00, '2020-08-10', 'Female'),
('Mike Johnson', 'Chicago', 'Finance', 85000.00, '2019-02-22', 'Male'),
('Emily Davis', 'Miami', 'Marketing', 70000.00, '2021-10-01', 'Female'),
('Alex Lee', 'San Francisco', 'Operations', 92000.00, '2023-01-05', 'Other');

-- Select all data from the employee table to verify the insertion
SELECT * FROM employee;

-- Select employees with a salary less than the average salary of all employees
SELECT name, city, department, salary, doj, gender 
FROM employee
WHERE salary < (SELECT AVG(salary) FROM employee);

-- Create the product table with product details
CREATE TABLE product (
    id INT AUTO_INCREMENT,                -- Unique product ID
    name VARCHAR(100),                     -- Product name
    type VARCHAR(50),                      -- Type/category of the product
    selling_price DECIMAL(10, 2),          -- Selling price of the product (supports decimals)
    PRIMARY KEY (id)                       -- Set 'id' as the primary key
);

-- Insert sample data into the product table
INSERT INTO product (name, type, selling_price)
VALUES
('Laptop', 'Electronics', 1200.00),
('Smartphone', 'Electronics', 799.99),
('Shampoo', 'Personal Care', 5.99),
('Table', 'Furniture', 150.00),
('Coffee Maker', 'Home Appliances', 89.99);

-- Select all data from the product table to verify the insertion
SELECT * FROM product;

-- Create the order table to record orders for products
CREATE TABLE `order` (
    id INT AUTO_INCREMENT,                -- Unique order ID
    product_name VARCHAR(255),             -- Product name
    sold INT,                              -- Quantity of products sold
    selling_price DECIMAL(10, 2),          -- Selling price of the product
    PRIMARY KEY (id)                       -- Set 'id' as the primary key
);

-- Insert sample data into the order table
INSERT INTO `order` (product_name, sold, selling_price)
VALUES
('Product A', 3, 1200.00),
('Product B', 5, 799.99),
('Product C', 2, 5.99),
('Product D', 1, 150.00),
('Product E', 4, 89.99);

-- Select all data from the order table to verify the insertion
SELECT * FROM `order`;

-- Insert rows into the `order` table by selecting product details from the `product` table
-- for products with a selling price greater than 1000.
INSERT INTO `order` (product_name, sold, selling_price)
SELECT 
    name,              -- Select the product's name
    1 AS sold,         -- Set a default value for 'sold' (for example, 1 unit sold)
    selling_price      -- Select the product's selling price
FROM 
    product
WHERE 
    selling_price > 1000;  -- Only insert products where the selling price is greater than 1000

-- Select all rows from the order table to verify the insertion
SELECT * FROM `order`;

-- Select all rows from the employee table to verify the data
SELECT * FROM employee;

-- Add a new column 'age' to the 'employee' table
ALTER TABLE employee
ADD COLUMN age INT;

-- Update the age for specific employees based on their name
UPDATE employee
SET age = 
    CASE 
        WHEN name = 'John Doe' THEN 30
        WHEN name = 'Jane Smith' THEN 28
        WHEN name = 'Mike Johnson' THEN 40
        WHEN name = 'Emily Davis' THEN 32
        WHEN name = 'Alex Lee' THEN 29
        ELSE age -- Keeps the existing age if the name doesn't match
    END
WHERE name IN ('John Doe', 'Jane Smith', 'Mike Johnson', 'Emily Davis', 'Alex Lee');

-- Disable safe updates to allow the update query to run without a WHERE clause that uses a key column
SET SQL_SAFE_UPDATES = 0;

-- Update the salary for employees whose age is 28 or older by multiplying their salary by 0.35
UPDATE employee
SET salary = salary * 0.35
WHERE age >= 28;

-- Select all rows from the employee table to verify the updated data
SELECT * FROM employee;

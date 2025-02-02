-- Select the database to work with
USE sql_intro;

-- Show all the tables in the current database
SHOW TABLES;

-- Retrieve all the records from the employees table
SELECT * FROM employees;

-- Select employees who earn more than the average salary in the company
SELECT Emp_name, Emp_department, Emp_salary 
FROM employees 
WHERE Emp_salary > (SELECT AVG(Emp_salary) FROM employees);

-- Select employee details where their salary is greater than the salary of "Rahul Verma"
SELECT Emp_name, Emp_gender, Emp_department, Emp_gender
FROM employees
WHERE Emp_salary > (SELECT Emp_salary FROM employees WHERE Emp_name = 'Rahul Verma');

-- Show all the tables in the current database again (repeated)
SHOW TABLES;

-- Retrieve all records from the sales table
SELECT * FROM sales;

-- Retrieve all records from the c_product table
SELECT * FROM c_product;

-- Select products from the c_product table where the product ID matches those in the sales table
-- with a cost price less than 100
SELECT product_id, cost_price
FROM c_product
WHERE product_id IN (SELECT product_id FROM sales WHERE Cost_price < 100);

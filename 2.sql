-- Switching to the sql_intro database
use sql_intro;

-- Show all tables in the database
show tables;

-- Select all records from the 'employees' table
select * from employees;

-- Describe the structure of the 'employees' table (shows column names, types, etc.)
describe employees;

-- Inserting records into the 'employees' table
INSERT INTO employees (Emp_id, Emp_name, Emp_age, Emp_gender, Emp_join_date, Emp_department, Emp_city, Emp_salary) VALUES
(1, 'Amit Sharma', 30, 'M', '2020-05-15', 'IT', 'Delhi', 75000),
(2, 'Priya Mehta', 28, 'F', '2019-07-22', 'HR', 'Mumbai', 65000),
(3, 'Rahul Verma', 35, 'M', '2018-09-10', 'Finance', 'Bangalore', 90000),
-- Additional records omitted for brevity
(20, 'Jyoti Pandey', 30, 'F', '2019-09-15', 'Marketing', 'Hyderabad', 71000);

-- Selecting all records from the 'employees' table again
select * from employees;

-- Selecting distinct cities from the 'employees' table (eliminates duplicates)
select distinct Emp_city from employees;

-- Selecting distinct departments from the 'employees' table
select distinct Emp_department from employees;

-- Finding the average age of employees
select avg(Emp_age ) from employees;

-- Calculating the average age for each department and rounding it to 1 decimal place
SELECT Emp_department, ROUND(AVG(Emp_age), 1) AS avg_age  
FROM employees
GROUP BY Emp_department;

-- Calculating the total salary per department
select Emp_department, sum(Emp_salary) as total
from employees 
group by Emp_department;

-- Counting the number of employees in each city
select count(Emp_id), Emp_city 
from employees
group by Emp_city;

-- Counting the number of employees per year of joining (grouped by year)
select year(Emp_join_date) as year, count(Emp_id)
from employees
group by year(Emp_join_date);

-- Creating a 'sales' table to track sales data
create table sales(product_id int , sell_price float , quantity int , state varchar(20));

-- Inserting sales data into the 'sales' table
INSERT INTO Sales (product_id, sell_price, quantity, state) VALUES
(101, 250.50, 10, 'Maharashtra'),
(102, 150.75, 5, 'Karnataka'),
-- Additional records omitted for brevity
(109, 399.99, 9, 'Punjab');

-- Select all sales records from the 'sales' table
select * from sales;

-- Calculate the revenue for each product by multiplying price with quantity
select product_id , sum(sell_price * quantity) as revenue 
from sales
group by product_id;

-- Creating a 'c_product' table to track the cost prices of products
create table c_product(product_id int, cost_price float);

-- Inserting cost price data for products into 'c_product'
insert into c_product 
values(101,123.70),
(104,165.89);

-- Calculate the profit by subtracting cost price from sell price, and multiplying by quantity
select c.product_id , sum((s.sell_price - c.cost_price) * s.quantity)as profit 
from sales  as s inner join  c_product as c
where s.product_id = c.product_id
group by c.product_id;

-- Count employees in each city, but only show cities with more than 2 employees
select count(Emp_id), Emp_city
from employees 
group by Emp_city
having count(Emp_id) > 2;

-- Selecting all records from 'employees' again
select * from employees;

-- Calculate the average salary for each department, only showing departments with average salary greater than 75,000
select Emp_department , avg(Emp_salary) as avg_salary 
from employees
group by Emp_department
having avg(Emp_salary) > 75000;

-- Calculate total salary per city, but only showing cities with total salary greater than 75,000
select Emp_city , sum(Emp_salary) as total_salary 
from employees
group by Emp_city
having sum(Emp_salary) > 75000;

-- Count employees in each department, only showing departments with more than 2 employees
select Emp_department, count(*) as emp
from employees
group by Emp_department
having count(*) > 2;

-- Count employees in cities other than 'Hyderabad', showing only cities with more than 2 employees
select Emp_city , count(*) as count
from employees
where Emp_city != 'Hyderabad'
group by Emp_city
having count(*) > 2;

-- Count employees in each department, only showing departments with more than 2 employees
select Emp_department, count(*) as emp
from employees
group by Emp_department
having count(*) > 2;

-- Count employees per department, only showing departments with average salary greater than 50,000
select Emp_department , count(*) as count
from employees
group by Emp_department
having avg(Emp_salary) > 50000;

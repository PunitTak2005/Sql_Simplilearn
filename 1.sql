-- Create a new database named sql_intro
create database sql_intro;

-- Show all databases
show databases;

-- Use the sql_intro database
use sql_intro;

-- Show all tables in the current database
show tables;

-- Create the emp_details table with relevant columns
create table emp_details(
    Name varchar(25),
    Age int,
    sex char(1),
    doj date,
    city varchar(15),
    salary float
);

-- Describe the structure of the emp_details table
describe emp_details;

-- Insert sample data into the emp_details table
INSERT INTO emp_details (Name, Age, sex, doj, city, salary) 
VALUES
    ('John Doe', 30, 'M', '2020-01-15', 'New York', 55000.50),
    ('Jane Smith', 28, 'F', '2019-03-22', 'Los Angeles', 62000.75),
    ('Sam Brown', 35, 'M', '2018-06-30', 'Chicago', 50000.00),
    ('Lisa White', 29, 'F', '2021-07-19', 'Miami', 57000.40),
    ('Mike Green', 32, 'M', '2017-11-11', 'Houston', 65000.60);

-- Select all records from the emp_details table
select * from emp_details;

-- Select distinct cities from the emp_details table
select distinct city from emp_details;

-- Count the number of names in the emp_details table
select count(name) from emp_details;

-- Count the number of names and give the column a name as 'count_name'
select count(name) as count_name from emp_details;

-- Get the sum of all salaries
select sum(salary) from emp_details;

-- Get the average salary from the emp_details table
select avg(salary) from emp_details;

-- Select all records where the Age is greater than 30
select * from emp_details where Age > 30;

-- Select name, Age, sex, and city for all females ('F')
select name , Age , sex , city from emp_details where sex = 'F';

-- Select records where the city is either Miami or Austin
select * from emp_details where city in ('Miami','Austin');

-- Select records where the date of joining (doj) is between '2013-08-19' and '2021-03-23'
SELECT * FROM emp_details WHERE doj BETWEEN '2013-08-19' AND '2021-03-23';

-- Select males ('M') where Age is greater than 30
select * from emp_details where sex = 'M' and Age > 30;

-- Group by sex and calculate the sum of salary for each gender
select sex, sum(salary) as Total_salary from emp_details group by sex;

-- Order the results by salary in descending order
select * from emp_details order by salary desc;

-- Calculate the result of 10 minus 20 (simple subtraction)
select (10-20) as subtract;

-- Get the length of the string 'India'
select length('India') as total_length;

-- Repeat the character '@' 10 times
select repeat ('@',10);

-- Convert 'India' to uppercase
select upper('India');

-- Convert 'India' to lowercase
select lower('India');

-- Get the current date
select curdate();

-- Get the current day from the current date
select day(curdate());

-- Get the current date and time
select now();

-- Convert the string 'this is sql' to uppercase
select upper('this is sql') as uppercase;

-- Convert the string 'this is sql' to lowercase
select lower('this is sql') as lowercase;

-- Convert the string "sql" to lowercase
select lcase("sql") as lowercase;

-- Get the character length of the string 'india'
select character_length('india') as total_length;

-- Get the character length of the 'name' column for each record
select name , character_length(name) as total_length from emp_details;

-- Get the character length of the 'name' column for each record (alternative function)
select name , char_length(name) as total_length from emp_details;

-- Concatenate 'india is best' into one string
select concat('india is best');

-- Concatenate 'india', 'i', 's', and 'best' into one string
select concat('india', 'i', 's' ,'best');

-- Concatenate 'india', 'i', 's', and 'best' into one string and alias it as 'merged'
select concat('india', 'i', 's' ,'best') as merged;

-- Concatenate name and age into one column (no space between name and age)
select name , city , concat(name , "" , Age ) as name_age from emp_details;

-- Concatenate name and age into one column with a space between name and age
select name , city , concat(name , " " , Age ) as name_age from emp_details;

-- Reverse the characters in the 'name' column for each record
select reverse(name) from emp_details;

-- Replace the word 'vegetable' with 'fruit' in the string 'orange is vegetable'
select replace('orange is vegetable','vegetable','fruit');

-- Remove leading spaces from the string " India "
select ltrim(" India ");

-- Get the length of the string with leading spaces removed
select length("             india");

-- Get the length of the string 'india' with leading spaces removed
select length(ltrim("       india"));

-- Get the length of the string 'india' with both leading and trailing spaces removed
select length(trim("       india"));

-- Get the length of the string 'india' with trailing spaces removed
select length(rtrim("       india"));

-- Find the position of the substring 'fruit' within the string 'orange is a fruit'
select position("fruit" in "orange is a fruit") as name;

-- Get the ASCII value of the character 'a'
select ascii("a");

-- Get the ASCII value of the character 'A'
select ascii("A");

-- Group by sex and calculate the average salary for each gender
SELECT sex, AVG(salary) AS average_salary FROM emp_details GROUP BY sex;

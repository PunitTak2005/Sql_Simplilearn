-- Create a new database named 'col'
CREATE DATABASE col;

-- Select the 'col' database to use
USE col;

-- Create a table 'student' with four columns: id, name, marks, and city
CREATE TABLE student
(
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(80),
    marks INT,
    city VARCHAR(78)
);

-- Insert multiple records into the 'student' table
INSERT INTO student (name, marks, city)
VALUES 
    ('we', 23, 'jajupur'),
    ('r', 12, 'rampur'),
    ('e', 34, 'rajpur'),
    ('ram', 75, 'jupur'),
    ('raj', 55, 'ajupur'),
    ('jam', 55, 'majupur'),
    ('amy', 46, 'jajupur'),
    ('kjamy', 46, 'jajupur');

-- Retrieve all student names sorted in ascending order of marks
SELECT name 
FROM student
ORDER BY marks ASC;

-- Find the maximum marks obtained by any student
SELECT MAX(marks) FROM student;

-- Find the minimum marks obtained by any student
SELECT MIN(marks) FROM student;

-- Calculate the average marks of all students
SELECT AVG(marks) FROM student;

-- Retrieve all marks from the student table
SELECT marks FROM student;

-- Count the total number of students (based on name)
SELECT COUNT(name) FROM student;

-- Select distinct names (grouping to remove duplicates)
SELECT name 
FROM student
GROUP BY name;

-- Select distinct marks (grouping to remove duplicates)
SELECT marks
FROM student
GROUP BY marks;

-- Select marks greater than 65
SELECT marks
FROM student
WHERE marks > 65;

-- Select all records where marks are greater than 23
SELECT * 
FROM student
WHERE marks > 23;

-- Count the number of cities where students have marks greater than 45
SELECT COUNT(city)
FROM student
WHERE marks > 45;

-- Retrieve the city of a student named 'amy' (grouped by city)
SELECT city 
FROM student 
WHERE name = 'amy'
GROUP BY city;

-- Disable safe update mode to allow updates on tables without a WHERE condition using a primary key
SET SQL_SAFE_UPDATES = 0;

-- Update the marks of students who had 12 to 45
UPDATE student
SET marks = 45
WHERE marks = 12;

-- Display all records from the student table after updating
SELECT * FROM student;

-- Delete records where marks are less than 10
DELETE FROM student
WHERE marks < 10;

-- Add a new column 'age' to the student table
ALTER TABLE student
ADD age INT;

-- Modify the 'age' column type from INT to VARCHAR(25)
ALTER TABLE student
MODIFY COLUMN age VARCHAR(25);

-- Drop the entire 'student' table (deletes structure and data)
DROP TABLE student;

-- Remove all records from the 'student' table but keep the structure
TRUNCATE TABLE student;

-- Drop the 'age' column from the 'student' table
ALTER TABLE student
DROP COLUMN age;

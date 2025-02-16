-- Create a new database named 'tem1'
CREATE DATABASE tem1;

-- Switch to the 'tem1' database
USE tem1;

-- Create another database named 'temp2'
CREATE DATABASE temp2;

-- Create another database named 'c'
CREATE DATABASE c;

-- Create database 'c' only if it does not already exist
CREATE DATABASE IF NOT EXISTS c;

-- Drop (delete) database 'temp2' (Note: You mistakenly wrote 'tem2' instead of 'temp2')
DROP DATABASE temp2;

-- Create a table 'student' with three columns: id, name, and age
CREATE TABLE student (
    id INT PRIMARY KEY,   -- 'id' is the primary key and must be unique
    name VARCHAR(45),     -- 'name' stores up to 45 characters
    age INT NOT NULL      -- 'age' cannot be NULL
);

-- Insert values into the 'student' table
INSERT INTO student (id, name, age)
VALUES 
    (1, 'ram', 23),   -- First record
    (2, 'raj', 24);   -- Second record

-- Select all records from the 'student' table
SELECT * FROM student;

-- Drop (delete) database 'temp1'
DROP DATABASE temp1;

-- Drop (delete) database 'tem1' only if it exists
DROP DATABASE IF EXISTS tem1;

-- Drop (delete) the 'student' table (removes structure and data)
DROP TABLE student;

-- ERROR: 'marks' column does not exist in 'student' table
-- Corrected: This query will not work since 'marks' was never created.
-- You must first add a 'marks' column before selecting it.
SELECT name, marks FROM student;

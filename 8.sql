-- Create a new database named 'xyz'
CREATE DATABASE xyz;

-- Select the 'xyz' database to use
USE xyz;

-- Create a table 'e2' with three columns: id, salary, and name
CREATE TABLE e2 (
    id INT PRIMARY KEY,         -- 'id' is the primary key (must be unique)
    salary FLOAT DEFAULT 26003, -- 'salary' has a default value of 26003
    name VARCHAR(100)           -- 'name' stores up to 100 characters
);

-- Insert values into the 'e2' table
INSERT INTO e2 (id, salary, name)
VALUES 
    (1, 100, 'ramu'),   -- First record
    (2, 233, 'raju');   -- Second record

-- Select all records from the 'e2' table
SELECT * FROM e2;

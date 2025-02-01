# Sql_Simplilearn
Covers a solid foundation for SQL queries. 🚀



```markdown
# SQL Intro - Simplilearn Course

This repository contains SQL scripts and queries that I worked on as part of the SQL Introduction course on Simplilearn. The queries demonstrate the basic operations of SQL including creating databases, tables, inserting data, performing aggregations, and manipulating strings.

## Contents

- **Database Creation & Table Setup**: Scripts for creating a database, tables, and populating them with sample data.
- **SQL Queries**: Basic SQL queries for selecting data, filtering, aggregation, and string manipulation.

## Scripts and Queries

### 1. **Database and Table Creation**
```sql
CREATE DATABASE sql_intro;
SHOW DATABASES;

USE sql_intro;

CREATE TABLE emp_details(
    Name VARCHAR(25),
    Age INT,
    sex CHAR(1),
    doj DATE,
    city VARCHAR(15),
    salary FLOAT
);
```

### 2. **Inserting Sample Data**
```sql
INSERT INTO emp_details (Name, Age, sex, doj, city, salary)
VALUES
    ('John Doe', 30, 'M', '2020-01-15', 'New York', 55000.50),
    ('Jane Smith', 28, 'F', '2019-03-22', 'Los Angeles', 62000.75),
    ('Sam Brown', 35, 'M', '2018-06-30', 'Chicago', 50000.00),
    ('Lisa White', 29, 'F', '2021-07-19', 'Miami', 57000.40),
    ('Mike Green', 32, 'M', '2017-11-11', 'Houston', 65000.60);
```

### 3. **Basic Queries**
```sql
SELECT * FROM emp_details;
SELECT DISTINCT city FROM emp_details;
SELECT COUNT(name) FROM emp_details;
SELECT SUM(salary) FROM emp_details;
SELECT AVG(salary) FROM emp_details;
SELECT * FROM emp_details WHERE Age > 30;
```

### 4. **Advanced Filtering & Grouping**
```sql
SELECT name, Age, sex, city FROM emp_details WHERE sex = 'F';
SELECT * FROM emp_details WHERE city IN ('Miami', 'Austin');
SELECT * FROM emp_details WHERE doj BETWEEN '2013-08-19' AND '2021-03-23';
SELECT sex, SUM(salary) AS Total_salary FROM emp_details GROUP BY sex;
```

### 5. **Ordering & String Operations**
```sql
SELECT * FROM emp_details ORDER BY salary DESC;
SELECT REPLACE('orange is vegetable', 'vegetable', 'fruit');
SELECT CONCAT('india', 'i', 's', 'best') AS merged;
SELECT REVERSE(name) FROM emp_details;
SELECT LENGTH('India') AS total_length;
SELECT POSITION('fruit' IN 'orange is a fruit') AS name;
```

### 6. **Date & Time Functions**
```sql
SELECT CURDATE();
SELECT DAY(CURDATE());
SELECT NOW();
```

### 7. **Other String Manipulations**
```sql
SELECT LTRIM(" India ");
SELECT LENGTH("             india");
SELECT LENGTH(LTRIM("       india"));
SELECT LENGTH(TRIM("       india"));
SELECT LENGTH(RTRIM("       india"));
SELECT ASCII("A");
SELECT ASCII("a");
```

## Setup and Usage

### Prerequisites

Make sure you have MySQL or any relational database management system installed on your machine.

### Running the Scripts

1. Clone the repository:
   ```bash
   git clone https://github.com/PunitTak2005/sql_intro.git
   ```

2. Open MySQL Workbench or any SQL client and run the queries step by step to create the database, table, insert sample data, and experiment with different SQL operations.

3. Example:
   ```sql
   -- Create the database
   CREATE DATABASE sql_intro;

   -- Use the database
   USE sql_intro;

   -- Run the queries from the repository
   ```

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

Repository Link: The git clone command points to my GitHub repository (https://github.com/PunitTak2005/sql_intro.git), making it easy to clone the repository and get started with the SQL scripts.



```



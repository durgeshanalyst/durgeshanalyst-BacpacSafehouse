CREATE DATABASE WINDOW_FUNCTION
USE WINDOW_FUNCTION

CREATE TABLE empinfo (
    ID INT,
    name VARCHAR(50),
    Department VARCHAR(50),
    salary DECIMAL(10, 2)
);

INSERT INTO empinfo (ID, name, Department, salary)
VALUES
    (1, 'John Doe', 'HR', 5000.00),
    (2, 'Jane Smith', 'Marketing', 6000.00),
    (3, 'David Johnson', 'Finance', 7000.00),
    (4, 'Emily Davis', 'HR', 5500.00),
    (5, 'Michael Wilson', 'Operations', 6500.00),
    (6, 'Sarah Thompson', 'Marketing', 6000.00),
    (7, 'Robert Lee', 'Finance', 7200.00),
    (8, 'Jennifer Brown', 'Operations', 6800.00),
    (9, 'William Taylor', 'HR', 5200.00),
    (10, 'Jessica Miller', 'Marketing', 6100.00);

SELECT * FROM empinfo

WITH CTE AS (
SELECT Department,NAME AS NAMES,
AVG(salary)OVER(PARTITION BY DEPARTMENT) AS AVG_SAL
FROM empinfo)
SELECT DEPARTMENT,AVG_SAL, COUNT(NAMES) AS EMP
FROM CTE
GROUP BY DEPARTMENT,AVG_SAL


---aggregtae function works on collection of values and return single value

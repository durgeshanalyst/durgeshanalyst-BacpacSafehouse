CREATE DATABASE [120:180:360 MENTORSHIP]
USE [120:180:360 MENTORSHIP]

-- Create employees table
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    salary DECIMAL(10, 2),
    department VARCHAR(50)
);


INSERT INTO employees (employee_id, first_name, last_name, salary, department)
VALUES
    (1, 'John', 'Doe', 60000, 'IT'),
    (2, 'Jane', 'Smith', 70000, 'Finance'),
    (3, 'Michael', 'Williams', 80000, 'Marketing'),
    (4, 'Emily', 'Brown', 65000, 'IT'),
    (5, 'David', 'Jones', 75000, 'HR'),
    (6, 'Emma', 'Johnson', 72000, 'Marketing'),
    (7, 'William', 'Davis', 68000, 'Finance'),
    (8, 'Olivia', 'Miller', 85000, 'IT'),
    (9, 'Liam', 'Taylor', 90000, 'HR'),
    (10, 'Ava', 'Anderson', 78000, 'Marketing'),
    (11, 'James', 'Martin', 62000, 'IT'),
    (12, 'Sophia', 'White', 82000, 'Finance'),
    (13, 'Benjamin', 'Hall', 74000, 'Marketing'),
    (14, 'Mia', 'Moore', 69000, 'HR'),
    (15, 'Ethan', 'Clark', 77000, 'IT'),
    (16, 'Isabella', 'Young', 86000, 'Finance'),
    (17, 'Alexander', 'Hill', 92000, 'Marketing'),
    (18, 'Chloe', 'King', 71000, 'HR'),
    (19, 'Daniel', 'Lee', 88000, 'IT'),
    (20, 'Aiden', 'Baker', 96000, 'Finance'),
    (21, 'Grace', 'Garcia', 83000, 'Marketing'),
    (22, 'Anthony', 'Scott', 70000, 'HR'),
    (23, 'Zoe', 'Turner', 89000, 'IT'),
    (24, 'Nathan', 'Cooper', 95000, 'Finance'),
    (25, 'Hannah', 'Ward', 74000, 'Marketing'),
    (26, 'Christopher', 'Evans', 91000, 'HR'),
    (27, 'Addison', 'Lopez', 80000, 'IT'),
    (28, 'Mason', 'Harris', 83000, 'Finance'),
    (29, 'Lily', 'Nelson', 78000, 'Marketing'),
    (30, 'Andrew', 'Gomez', 92000, 'HR'),
    (31, 'Ella', 'Rivera', 86000, 'IT'),
    (32, 'Logan', 'Perez', 94000, 'Finance'),
    (33, 'Scarlett', 'Fisher', 75000, 'Marketing'),
    (34, 'Jack', 'Martinez', 79000, 'HR'),
    (35, 'Avery', 'Carter', 88000, 'IT'),
    (36, 'Ryan', 'Taylor', 91000, 'Finance'),
    (37, 'Aria', 'Russell', 77000, 'Marketing'),
    (38, 'Grayson', 'Hall', 83000, 'HR'),
    (39, 'Lucy', 'Barnes', 95000, 'IT'),
    (40, 'Jackson', 'Ward', 98000, 'Finance'),
    (41, 'Sophie', 'Stewart', 84000, 'Marketing'),
    (42, 'Carter', 'Lopez', 72000, 'HR'),
    (43, 'Madison', 'Hill', 91000, 'IT'),
    (44, 'Caleb', 'Cook', 99000, 'Finance'),
    (45, 'Evelyn', 'Foster', 76000, 'Marketing'),
    (46, 'Isaac', 'Wright', 80000, 'HR'),
    (47, 'Harper', 'Turner', 93000, 'IT'),
    (48, 'Landon', 'Phillips', 97000, 'Finance'),
    (49, 'Aubrey', 'Perry', 79000, 'Marketing'),
    (50, 'Gabriel', 'Bryant', 85000, 'HR'),
    (51, 'Brooklyn', 'Fisher', 92000, 'IT'),
    (52, 'Nicholas', 'Reed', 96000, 'Finance'),
    (53, 'Paisley', 'Watson', 81000, 'Marketing'),
    (54, 'Eli', 'Powell', 87000, 'HR'),
    (55, 'Kylie', 'Gonzalez', 94000, 'IT'),
    (56, 'Harrison', 'Myers', 99000, 'Finance'),
    (57, 'Aaliyah', 'Stevens', 80000, 'Marketing'),
    (58, 'Dylan', 'Simmons', 86000, 'HR'),
    (59, 'Nora', 'Webb', 92000, 'IT'),
    (60, 'Jaxon', 'Elliott', 97000, 'Finance');


GROUP BY HAVING 




/*Case when*/
/*Syntax of CASE WHEN*/


SELECT * FROM EMPLOYEES;

/*EDA*/

SELECT DISTINCT department AS CNT
FROM employees

/*ADD A NEW COLUMN INTO EMPLOYEES TABLE AS SALARY RANGE HIGH,MEDIUM AND LOW*/

SELECT *,
		CASE
			WHEN SALARY <= 50000 THEN 'LOW'
			WHEN SALARY BETWEEN 50000 AND 75000 THEN 'MEDIUM'
			ELSE 'HIGH' END AS SAL_RANGE
FROM employees
/*COPYING RECORDS*/

SELECT * INTO RANGETABLE FROM (
SELECT *,
		CASE
			WHEN SALARY <= 50000 THEN 'LOW'
			WHEN SALARY BETWEEN 50000 AND 75000 THEN 'MEDIUM'
			ELSE 'HIGH' END AS SAL_RANGE
FROM employees)H

/*case when inside Group by*/
/*SHOW THE SUM OF SALALRY BY THE RANGE OF SAALRY AND THE NUMBER OF EMPLOYEE*/

SELECT CASE
			WHEN SALARY <= 50000 THEN 'LOW'
			WHEN SALARY BETWEEN 50000 AND 75000 THEN 'MEDIUM'
			ELSE 'HIGH' END AS SAL_RANGE ,
			COUNT(employee_id) AS PEOPLE,
SUM(SALARY) AS pAID
FROM employees
GROUP BY CASE
			WHEN SALARY <= 50000 THEN 'LOW'
			WHEN SALARY BETWEEN 50000 AND 75000 THEN 'MEDIUM'
			ELSE 'HIGH' END



			/*Order by*/

SELECT * FROM employees ORDER BY salary DESC


/*USING CASE WHEN IN SIDE ORDER BY*/

SELECT *,
		CASE
			WHEN SALARY <= 50000 THEN 'LOW'
			WHEN SALARY BETWEEN 50000 AND 75000 THEN 'MEDIUM'
			ELSE 'HIGH' END AS SAL_RANGE
FROM employees
ORDER BY SAL_RANGE 




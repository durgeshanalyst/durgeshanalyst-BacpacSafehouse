CREATE DATABASE WINDOW_FUNCTION
USE WINDOW_FUNCTION

----1234
1234 1
------------
1234 2
---------------
1234 3
--------------

--over clause
---partition by = group by

CREATE TABLE EMPLOYEE (
    ID INT PRIMARY KEY,
    NAME VARCHAR(255),
    SALARY DECIMAL(10, 2),
    DEPARTMENT VARCHAR(50)
);

INSERT INTO EMPLOYEE (ID, NAME, SALARY, DEPARTMENT)
VALUES
    (1, 'John Doe', 50000.00, 'Sales'),
    (2, 'Jane Smith', 60000.00, 'Marketing'),
    (3, 'Michael Johnson', 75000.00, 'IT'),
    (4, 'Emily Davis', 52000.00, 'HR'),
    (5, 'David Wilson', 62000.00, 'Finance'),
    (6, 'Sarah Anderson', 55000.00, 'IT'),
    (7, 'William Taylor', 58000.00, 'Sales'),
    (8, 'Jessica Brown', 59000.00, 'Marketing'),
    (9, 'Christopher Martinez', 72000.00, 'IT'),
    (10, 'Ava Harris', 53000.00, 'HR');
	INSERT INTO EMPLOYEE (ID, NAME, SALARY, DEPARTMENT)
VALUES
    (11, 'Liam Turner', 56000.00, 'Finance'),
    (12, 'Olivia Hall', 61000.00, 'IT'),
    (13, 'Noah King', 64000.00, 'Sales'),
    (14, 'Emma White', 69000.00, 'Marketing'),
    (15, 'James Green', 73000.00, 'IT'),
    (16, 'Ava Martinez', 57000.00, 'HR'),
    (17, 'Sophia Harris', 59000.00, 'Finance'),
    (18, 'Logan Anderson', 63000.00, 'IT'),
    (19, 'Lucas Taylor', 66000.00, 'Sales'),
    (20, 'Isabella Brown', 70000.00, 'Marketing'),
	(46, 'Henry Davis', 67000.00, 'Finance'),
    (47, 'Amelia Wilson', 72000.00, 'IT'),
    (48, 'Jackson Johnson', 75000.00, 'Sales'),
    (49, 'Sophia Smith', 58000.00, 'Marketing'),
    (50, 'Oliver Garcia', 61000.00, 'IT');




SELECT * FROM EMPLOYEE


SELECT DISTINCT DEPARTMENT FROM EMPLOYEE
----RETURN THE MAXIMUM AND AVG SALARY BY DEPARTMENT

SELECT DEPARTMENT,
		AVG(SALARY) AS AVG_SAL,
		MAX(SALARY) AS MX_SAL
FROM EMPLOYEE
GROUP BY DEPARTMENT


SELECT ID,DEPARTMENT,
		AVG(SALARY) AS AVG_SAL,
		MAX(SALARY) AS MX_SAL
FROM EMPLOYEE
GROUP BY ID,DEPARTMENT
ORDER BY AVG_SAL



SELECT DEPARTMENT,
		AVG(SALARY)OVER(PARTITION BY DEPARTMENT) AS AVG_sAL
FROM EMPLOYEE

SELECT * FROM EMPLOYEE
--- ROW_NUMBER()


------RETURN 5TH PERSON FROM THE EMPLOYEE DATA

SELECT NAME FROM(
SELECT *, ROW_NUMBER() OVER(ORDER BY SALARY DESC) AS R
FROM EMPLOYEE)D
WHERE R=5



----RANK
----WE ARE RANKING THE EMPLOYEE UPON THEIR HIGHEST SALARY
SELECT * , 
		RANK() OVER(PARTITION BY DEPARTMENT ORDER BY SALARY DESC) AS RNK
	FROM EMPLOYEE

----DENSE_RANK()
SELECT * , 
		RANK() OVER(PARTITION BY DEPARTMENT ORDER BY SALARY DESC) AS RNK,
		DENSE_RANK() OVER(PARTITION BY DEPARTMENT ORDER BY SALARY DESC) AS DRNK
	FROM EMPLOYEE

--LEAD AND LAG
SELECT DEPARTMENT,LEAD_SAL-LAG_SAL FROM(
SELECT DEPARTMENT ,LEAD(SALARY,2) OVER(PARTITION BY DEPARTMENT ORDER BY SALARY DESC) AS LEAD_sAL,
		 LAG(SALARY,1) OVER(PARTITION BY DEPARTMENT ORDER BY SALARY DESC) AS LAG_sAL
FROM EMPLOYEE)D

-------------BRAZIILIAN eCOMMERCE 
---2016-2018
--8 CSV FILE




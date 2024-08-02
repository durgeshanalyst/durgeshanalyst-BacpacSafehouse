USE SQL_MARATHON_1

CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50)
);

INSERT INTO Departments (DepartmentID, DepartmentName) VALUES
(1, 'IT'),
(2, 'HR'),
(3, 'Finance'),
(4, 'Marketing');

CREATE TABLE Projects (
    ProjectID INT PRIMARY KEY,
    EmployeeID INT,
    ProjectName VARCHAR(50)
);

INSERT INTO Projects (ProjectID, EmployeeID, ProjectName) VALUES
(1, 101, 'Data Analysis'),
(2, 102, 'Software Development'),
(3, 103, 'Marketing Campaign'),
(4, 104, 'HR Management');

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Department VARCHAR(50),
    Salary DECIMAL(10, 2)
);

INSERT INTO Employees (EmployeeID, FirstName, LastName, Department, Salary) VALUES
(101, 'John', 'Doe', 'IT', 65000),
(102, 'Jane', 'Smith', 'HR', 55000),
(103, 'Michael', 'Johnson', 'Finance', 70000),
(104, 'Emily', 'Williams', 'Marketing', 60000),
(105, 'David', 'Brown', 'IT', 60000),
(106, 'Jennifer', 'Davis', 'IT', 62000),
(107, 'John', 'Doe', 'IT', 65000),
(108, 'Jane', 'Smith', 'HR', 55000);

--------------Lets get-----------


SELECT * FROM Employees;
SELECT * FROM Departments;
SELECT * FROM Projects;

CREATE TABLE TABLE1 (
    NUM INT
);

INSERT INTO TABLE1 (NUM) VALUES (1), (1), (1), (2), (4), (NULL);

CREATE TABLE TABLE2 (
    NUM INT
);

INSERT INTO TABLE2 (NUM) VALUES (1), (1), (2), (1), (NULL), (NULL);

BEGIN
CREATE PROC SHOWTABLE1 AS (
    SELECT * FROM TABLE1)
END;

EXEC SHOWTABLE1;

BEGIN
CREATE PROC SHOWTABLE2 AS(
    SELECT * FROM TABLE2
)
END;

    SELECT count(*)
    from table1 a cross join table2 b 

exec showtable1
exec showtable2

/*UPDATE*/

-- Update rows in table '[TableName]' in schema '[dbo]'
UPDATE Employees
SET Salary = 60000
WHERE EmployeeID = 101


----2 ENTRIES SAME, 



/*
STUDENTS 
DELETE FROM TABLE1



*/
SELECT * FROM EMPLOYEES
SELECT *FROM DEPARTMENTS



SELECT E.EMPLOYEEID, E.FIRSTNAME,E.LASTNAME, D.DEPARTMENTID
FROM EMPLOYEES E JOIN DEPARTMENTS D ON E.DEPARTMENT = D.DEPARTMENTNAME


SELECT * FROM TABLE1
SELECT * FROM TABLE2

SELECT *
    from table1 a  LEFT JOIN table2 b  ON A.NUM=B.NUM


SELECT FIRSTNAME, SALARY,AVG(SALARY) AS AVG_SALARY FROM EMPLOYEES WHERE SALARY > (SELECT AVG(SALARY) FROM EMPLOYEES)
GROUP BY FIRSTNAME, SALARY;


WITH CTE AS (
    SELECT AVG(SALARY) AS AVG_SAL FROM EMPLOYEES
)
SELECT FIRSTNAME,
    SALARY, (SELECT AVG_SAL FROM CTE) AS AVG_SAL
    FROM EMPLOYEES
    WHERE SALARY > (SELECT AVG_SAL FROM CTE)


SELECT FIRSTNAME, AVG(SALARY) AS AVG_SAL
FROM Employees
WHERE SALARY > (SELECT AVG(SALARY) FROM EMPLOYEES)
GROUP BY FirstName


/*SECOND HAGHEST SLARY*/

SELECT * FROM Employees

SELECT SALARY FROM (
SELECT SALARY, 
    DENSE_RANK() OVER(ORDER BY SALARY DESC) AS DENSE
    FROM EMPLOYEES)D
    WHERE DENSE = 2


----

SELECT MAX(SALARY) AS SECONDHIGHESTSALARY
FROM Employees
    WHERE SALARY < (SELECT MAX(SALARY) FROM Employees)
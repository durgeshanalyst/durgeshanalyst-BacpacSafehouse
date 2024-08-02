CREATE DATABASE WUNDERMAN;
USE wunderman;

CREATE TABLE DML (
ID INT PRIMARY KEY,
NAME VARCHAR(10),
MARKS DECIMAL
)

SELECT * FROM DML;

BEGIN TRANSACTION
INSERT INTO DML (ID,NAME)VALUES(4,'PriyaNKA')

ALTER TABLE DML DROP CONSTRAINT DF_MARKS


ALTER TABLE DML ALTER COLUMN MARKS VARCHAR(10);

ALTER TABLE DML ADD CONSTRAINT df_marks DEFAULT 'Fail' FOR MARKS;


BEGIN TRANSACTION
UPDATE DML 
SET MARKS = 'FAIL'
WHERE NAME = 'vIBHA'
ROLLBACK TRANSACTION 


-- Creating the Employee table
CREATE TABLE Employee (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Department VARCHAR(50)
);

-- Creating the HR table
CREATE TABLE HR (
    HRID INT PRIMARY KEY,
    HRName VARCHAR(50),
    EmployeeID INT,
    FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID)
);

SELECT * FROM Employee
SELECT * FROM HR

-- Insert 5 records into the Employee table
INSERT INTO Employee (EmployeeID, FirstName, LastName, Department)
VALUES
    (2, 'Jane', 'Smith', 'IT'),
    (3, 'Robert', 'Johnson', 'Marketing'),
    (4, 'Anna', 'Williams', 'HR'),
    (5, 'Michael', 'Brown', 'Sales'),
    (6, 'Sarah', 'Davis', 'Finance');

-- Insert 5 records into the HR table, associating them with employees
INSERT INTO HR (HRID, HRName, EmployeeID)
VALUES
    (102, 'HR Manager 2', 2),
    (103, 'HR Manager 3', 3),
    (104, 'HR Manager 4', 4),
    (105, 'HR Manager 5', 5),
    (106, 'HR Manager 6', 6);


SELECT * FROM Employee
SELECT * FROM HR

/*fETCH ALL EMPLOYEE AND THEIR hr ALONG WITH DEPRTMENT*/
WITH CTE AS (
SELECT E.FirstName,H.HRName,E.Department
FROM Employee E JOIN HR H ON E.EmployeeID=H.EmployeeID)
SELECT * FROM cte

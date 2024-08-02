CREATE DATABASE APRIL_BATCH
USE APRIL_BATCH

/*ADVANCE TOPIC*/
CREATE TABLE employees (
  id INT PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  salary DECIMAL(10,2) NOT NULL,
  department VARCHAR(255) NOT NULL,
  gender VARCHAR(10) NOT NULL
);

INSERT INTO employees (id, name, salary, department, gender) VALUES
(1, 'John Smith', 50000.00, 'Sales', 'Male'),
(2, 'Jane Doe', 60000.00, 'Marketing', 'Female'),
(3, 'Bob Johnson', 45000.00, 'Customer Service', 'Male'),
(4, 'Samantha Lee', 70000.00, 'Engineering', 'Female'),
(5, 'Tom Chen', 55000.00, 'IT', 'Male'),
(6, 'Lisa Kim', 65000.00, 'HR', 'Female'),
(7, 'Mike Miller', 75000.00, 'Operations', 'Male'),
(8, 'Emily Wong', 80000.00, 'Finance', 'Female'),
(9, 'David Garcia', 90000.00, 'Product Management', 'Male'),
(10, 'Olivia Rodriguez', 85000.00, 'Design', 'Female'),
(11, 'Alex Nguyen', 60000.00, 'IT', 'Male'),
(12, 'Megan Davis', 55000.00, 'Customer Service', 'Female'),
(13, 'Steven Martinez', 70000.00, 'Engineering', 'Male'),
(14, 'Sophie Brown', 65000.00, 'Marketing', 'Female'),
(15, 'Chris Lee', 75000.00, 'Product Management', 'Male'),
(16, 'Grace Park', 80000.00, 'Finance', 'Female'),
(17, 'Michael Kim', 45000.00, 'Sales', 'Male'),
(18, 'Elizabeth Baker', 55000.00, 'Design', 'Female'),
(19, 'Ryan Johnson', 60000.00, 'IT', 'Male'),
(20, 'Jennifer Kim', 65000.00, 'HR', 'Female');


SELECT * FROM employees;

---Case when General---


---Update by case when----


---case when in order by ----

/*ORDER BY*/

select * from employees
ORDER BY CASE gender
		WHEN 'Male' then salary End,
		CASE WHEN gender = 'female' then salary  End Desc

--------in Group by--------

SELECT ID
FROM employees
GROUP BY ID

Select name, salary, department,

case when salary < 10000 then 'Junior'
     when salary >= 10000 and salary <= 49999 then 'jr Exec'
	 else 'Director' END AS Job_Title

from employees
GROUP BY name, salary, department,

case when salary < 10000 then 'Junior'
     when salary >= 10000 and salary <= 49999 then 'jr Exec'
	 else 'Director' END


/*Built in function*/
SELECT REVERSE('dURGESH')

--LEFT
SELECT LEFT('Durgesh',2)
--Right
SELECT right('Durgesh',2)

SELECT * FROM employees
SELECT LEFT(NAME,LEN(NAME)-4) FROM employees


select CONCAT('Data','Analyst')

select concat(name,gender) from employees

select concat_ws('_',name,gender) from employees


select concat_ws('_','My','name','is','Durgesh')

SELECT TRIM(name) FROM employees

/**/

SELECT SUBSTRING(name, 1, CHARINDEX(' ', name) - 1) AS Firstname,     
       SUBSTRING(name,
                 CHARINDEX(' ', name) + 1,
                 LEN(name) - CHARINDEX(' ', name)) AS Lastname
FROM employees


/*DATE METHOD*/
SELECT GETDATE()
SELECT MONTHNAME (DATEPART(MONTH,GETDATE()))

SELECT DATENAME(DAY,GETDATE())

DATEDIFF()


/*starting join*/



SELECT * FROM employees



SELECT ID,NAME FROM employees
EXCEPT
SELECT ID,NAME FROM EMPLOYEE

----JOIN: - IT WILL HELP US TO JOIN TWO OR MORE TABLE 
INNER JOIN OR JOIN      ------
LEFT JOIN OR LEFT OUTER JOIN
RIGHT JOIN
FULL OUTER JOIN 

--ADVANCED--
SELF
CROSS
NATURAL JOIN 

----KEY POINT---
ON A<=B;


SELECT C.CUSTOMERID, O.TOTAL_ORDER_AMOUNT
FROM ORDERS O JOIN CUSTOMERS C ON O.CustomerID=C.CustomerID


---TOP CUSTOMER
SELECT  C.CUSTOMERID, O.TOTAL_ORDER_AMOUNT
FROM ORDERS O FULL OUTER JOIN CUSTOMERS C ON O.CustomerID=C.CustomerID
ORDER BY Total_order_amount DESC 

/*HOSPITAL table*/
CREATE TABLE hospital (
    patient_id INT PRIMARY KEY,
    patient_name VARCHAR(50),
    patient_age INT,
    patient_gender VARCHAR(10),
    patient_address VARCHAR(100),
    patient_phone VARCHAR(20),
    admission_date DATE,
    discharge_date DATE,
    doctor_name VARCHAR(50),
    department_name VARCHAR(50)
);


INSERT INTO hospital (patient_id, patient_name, patient_age, patient_gender, patient_address, patient_phone, admission_date, discharge_date, doctor_name, department_name)
VALUES
(1, 'John Smith', 35, 'Male', '123 Main St, Anytown USA', '555-1234', '2023-04-01', '2023-04-05', 'Dr. Johnson', 'Cardiology'),
(2, 'Mary Johnson', 42, 'Female', '456 Elm St, Anytown USA', '555-5678', '2023-04-02', '2023-04-04', 'Dr. Lee', 'Oncology'),
(3, 'Bob Williams', 28, 'Male', '789 Oak St, Anytown USA', '555-9012', '2023-04-03', '2023-04-06', 'Dr. Smith', 'Neurology'),
(4, 'Alice Brown', 50, 'Female', '321 Maple St, Anytown USA', '555-3456', '2023-04-04', '2023-04-07', 'Dr. Garcia', 'Orthopedics'),
(5, 'Mike Davis', 62, 'Male', '654 Pine St, Anytown USA', '555-7890', '2023-04-05', '2023-04-08', 'Dr. Patel', 'Cardiology'),
(6, 'Jane Lee', 45, 'Female', '987 Cedar St, Anytown USA', '555-4321', '2023-04-06', '2023-04-09', 'Dr. Kim', 'Oncology'),
(7, 'Sam Johnson', 23, 'Male', '555 Walnut St, Anytown USA', '555-8765', '2023-04-07', '2023-04-10', 'Dr. Hernandez', 'Neurology'),
(8, 'Samantha Brown', 30, 'Female', '777 Oak St, Anytown USA', '555-2109', '2023-04-08', '2023-04-11', 'Dr. Gonzalez', 'Orthopedics'),
(9, 'Max Davis', 44, 'Male', '888 Pine St, Anytown USA', '555-6543', '2023-04-09', '2023-04-12', 'Dr. Kim', 'Cardiology'),
(10, 'Lisa Kim', 38, 'Female', '999 Cedar St, Anytown USA', '555-0987', '2023-04-10', '2023-04-13', 'Dr. Patel', 'Oncology'),
(11, 'David Hernandez', 27, 'Male', '111 Walnut St, Anytown USA', '555-5432', '2023-04-11', '2023-04-14', 'Dr. Smith', 'Neurology'),
(12, 'Karen Gonzalez', 52, 'Female', '222 Oak St, Anytown USA', '555-9876', '2023-04-12', '2023-04-15', 'Dr. Garcia', 'Orthopedics'),
(13, 'James Lee', 61, 'Male', '333 Pine St, Anytown USA', '555-2109', '2023-04-13', '2023-04-16', 'Dr. Johnson', 'Cardiology')

/*Nested query*/
---How many male patients were admitted to the hospital on or after January 1, 2022?


/*CTE*/


/*Window Function*/



/*temp table, View*/






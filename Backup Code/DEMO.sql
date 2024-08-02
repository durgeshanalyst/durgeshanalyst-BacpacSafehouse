CREATE DATABASE [CASE WHEN DEMO]
USE [CASE WHEN DEMO];

CREATE TABLE emp_INFO (
  id INT PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  salary DECIMAL(10,2) NOT NULL,
  department VARCHAR(255) NOT NULL,
  gender VARCHAR(10) NOT NULL
);

INSERT INTO emp_INFO(id, name, salary, department, gender) VALUES
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

---Orders Table--
CREATE TABLE orders (
  order_id INT PRIMARY KEY,
  customer_id INT,
  order_total DECIMAL(10,2)
);

INSERT INTO orders (order_id, customer_id, order_total)
VALUES 
  (1, 1, 25.00),
  (2, 2, 75.00),
  (3, 3, 125.00),
  (4, 4, 50.00),
  (5, 5, 80.00),
  (6, 6, 300.00),
  (7, 7, 70.00),
  (8, 8, 120.00),
  (9, 9, 40.00),
  (10, 10, 90.00);


  ---Students table--
  CREATE TABLE students (
  student_id INT PRIMARY KEY,
  student_name VARCHAR(50),
  student_grade INT
);

INSERT INTO students (student_id, student_name, student_grade)
VALUES 
  (1, 'John Smith', 80),
  (2, 'Jane Doe', 90),
  (3, 'Bob Johnson', 70),
  (4, 'Emily Brown', 90),
  (5, 'Peter Lee', 85),
  (6, 'Sarah Lee', 85),
  (7, 'David Kim', 80),
  (8, 'Karen Kim', 70),
  (9, 'Jason Park', 75),
  (10, 'Amy Lee', 95);


  ---Employee table--
  CREATE TABLE employees (
  employee_id INT PRIMARY KEY,
  employee_name VARCHAR(50),
  employee_age INT,
  employee_salary DECIMAL(10,2)
);

INSERT INTO employees (employee_id, employee_name, employee_age, employee_salary)
VALUES 
  (1, 'John Smith', 25, 35000.00),
  (2, 'Jane Doe', 30, 45000.00),
  (3, 'Bob Johnson', 40, 55000.00),
  (4, 'Emily Brown', 22, 30000.00),
  (5, 'Peter Lee', 28, 40000.00),
  (6, 'Sarah Kim', 32, 50000.00),
  (7, 'David Kim', 35, 60000.00),
  (8, 'Karen Kim', 45, 70000.00),
  (9, 'Jason Park', 27, 38000.00),
  (10, 'Amy Lee', 41, 59000.00);


-- Insert some sample data
INSERT INTO employees (employee_id, employee_name, employee_age, employee_salary)
VALUES (11, 'Bhawana', 25, 35000),
       (12, 'Jane Doe', 30, 45000),
       (13, 'Bob Johnson', 40, 55000),
       (14, 'Emily Brown', 22, 30000),
       (15, 'Peter Lee', 28, 40000);



/*letsbeanalyst*/

SELECT * FROM students
SELECT * FROM employees
SELECT * FROM orders
SELECT * FROM emp_INFO

SELECT department, sum(salary) as total
FROM emp_INFO
group by department

---Manuplation in employees table---  



CREATE VIEW  MY_SHORT_TABLE AS
SELECT ID,salary,department , CASE WHEN GENDER = 'FEMALE' THEN 'F'
				ELSE 'M'
				END AS GENDER_SHORT
FROM emp_INFO

SELECT * FROM MY_SHORT_TABLE

----case when with where clause---

 
 
	

---case when with group by----

select  sum(employee_salary) as total,
CASE 
	WHEN employee_age < 25 THEN 'YOUNG'
		WHEN employee_age >=25 AND employee_age < 35 THEN 'mid-age'
		 else 'OLD'
		 END AS AGEBUCKET
FROM employees
group by 
CASE
	WHEN employee_age < 25 THEN 'YOUNG'
		WHEN employee_age >=25 AND employee_age < 35 THEN 'mid-age'
		 else 'OLD'
		 END

---case when with order----

SELECT * FROM students
ORDER BY student_id DESC

---case when with update---

begin transaction
UPDATE employees
SET employee_salary = 
  CASE 
    WHEN employee_age > 35 THEN employee_salary * 1.1
    WHEN employee_age >= 25 AND employee_age <= 35 THEN employee_salary * 1.05
    ELSE employee_salary
  END;
  Rollback transaction





  SELECT * 
  FROM emp_INFO
  ORDER BY CASE gender WHEN 'MALE' THEN salary  END ASC,
			CASE WHEN gender = 'FEMALE' THEN salary END DESC
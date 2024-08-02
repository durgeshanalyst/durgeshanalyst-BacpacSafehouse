CREATE TABLE employee (
    id INT PRIMARY KEY,
    employee_name VARCHAR(50),
    department VARCHAR(50),
    salary DECIMAL(10, 2)
);

INSERT INTO employee (id, employee_name, department, salary) VALUES
(1, 'Alice', 'HR', 50000.00),
(2, 'Bob', 'Engineering', 60000.00),
(3, 'Charlie', 'Engineering', 55000.00),
(4, 'David', 'HR', 60000.00),
(5, 'Eva', 'Marketing', 75000.00),
(6, 'Frank', 'Engineering', 80000.00),
(7, 'Grace', 'Marketing', 72000.00),
(8, 'Hannah', 'HR', 65000.00),
(9, 'Isaac', 'Engineering', 80000.00),
(10, 'John', 'Marketing', 45000.00),
(11, 'Karen', 'HR', 50000.00),
(12, 'Leo', 'Engineering', 60000.00),
(13, 'Mona', 'Engineering', 55000.00),
(14, 'Nina', 'HR', 60000.00),
(15, 'Oscar', 'Marketing', 75000.00),
(16, 'Paul', 'Engineering', 80000.00),
(17, 'Quinn', 'Marketing', 72000.00),
(18, 'Rita', 'HR', 65000.00),
(19, 'Steve', 'Engineering', 80000.00),
(20, 'Tina', 'Marketing', 45000.00);


WITH SalaryRank AS (
    SELECT 
        employee_name, 
        salary, 
        ROW_NUMBER() OVER (ORDER BY salary DESC) AS rank
    FROM employee
)
SELECT 
    employee_name, 
    salary 
FROM 
    SalaryRank 
WHERE 
    rank = 2;


---CTE in INSERT
WITH AvgSalaryByDept AS (
    SELECT 
        department, 
        AVG(salary) AS avg_salary
    FROM 
        employee
    GROUP BY 
        department
)
INSERT INTO  department_avg_salary
SELECT 
    department, 
    avg_salary 
FROM 
    AvgSalaryByDept;


----Cummularive sum

CREATE TABLE employees (
    id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    salary DECIMAL(10, 2),
    hire_date DATE
);


INSERT INTO employees (id, first_name, last_name, salary, hire_date) VALUES
(1, 'Alice', 'Smith', 60000.00, '2021-01-15'),
(2, 'Bob', 'Johnson', 75000.00, '2021-02-20'),
(3, 'Charlie', 'Williams', 50000.00, '2021-03-10'),
(4, 'David', 'Brown', 80000.00, '2021-04-05'),
(5, 'Eva', 'Davis', 55000.00, '2021-05-15');




select * from employees;

select id,first_name,last_name,salary,hire_date, SUM(salary) over (order by hire_date) as cms
from employees



----cumulative sum by variable

SET @cumulative_sum = 0;

SELECT
    last_name,
    salary,
    @cumulative_sum := @cumulative_sum + salary AS cumulative_sales
FROM
    employees ;

CREATE TABLE salary (
    id INT PRIMARY KEY,
    employee_name VARCHAR(50),
    salary DECIMAL(10, 2)
);

INSERT INTO salary (id, employee_name, salary) VALUES
(1, 'Alice', 50000.00),
(2, 'Bob', 60000.00),
(3, 'Charlie', 55000.00),
(4, 'David', 60000.00),
(5, 'Eva', 75000.00),
(6, 'Frank', 80000.00),
(7, 'Grace', 72000.00),
(8, 'Hannah', 65000.00),
(9, 'Isaac', 80000.00),
(10, 'John', 45000.00);


SELECT * FROM salary;

---METHOD 1
WITH CTE AS(
SELECT SALARY, DENSE_RANK()OVER(ORDER BY SALARY DESC) AS RNK FROM salary)
SELECT salary FROM CTE WHERE RNK = 2;

---METHOD 2 (OFFSET WORK IN MYSQL ONLY)

SELECT SALARY FROM salary ORDER BY salary DESC LIMIT 1 OFFSET 1

--METHOD 3 USING MAX

SELECT MAX(salary) AS second_highest_salary 
FROM salary 
WHERE salary < (SELECT MAX(salary) FROM salary);

---METHOD 4

SELECT salary 
FROM (
    SELECT salary, 
           ROW_NUMBER() OVER (ORDER BY salary DESC) AS salary_rank 
    FROM salary
) AS ranked_salaries 
WHERE salary_rank = 2;


---METHOD 5 USING nTILE (IT HAS ROBLEM WITH DUPLICATE)

SELECT salary 
FROM (
    SELECT salary, 
           NTILE(10) OVER (ORDER BY salary DESC) AS salary_ntile 
    FROM salary
) AS ntile_salaries 
WHERE salary_ntile = 2;


----METHOD 6 (SELF OR CROSS JOIN)

SELECT DISTINCT TOP 1 e1.salary 
FROM salary  e1 
JOIN salary e2 
ON e1.salary < e2.salary 
ORDER BY e1.salary DESC 

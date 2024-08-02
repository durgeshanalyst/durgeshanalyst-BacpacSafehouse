CREATE DATABASE JOIN_BY_DURGESH
USE JOIN_BY_DURGESH
-- Create the Customers table
CREATE TABLE Customers (
  customer_id INT PRIMARY KEY,
  customer_name VARCHAR(50),
  email VARCHAR(50)
);

-- Insert sample data into the Customers table
INSERT INTO Customers (customer_id, customer_name, email)
VALUES
  (1, 'John Doe', 'john.doe@example.com'),
  (2, 'Jane Smith', 'jane.smith@example.com'),
  (3, 'David Johnson', 'david.johnson@example.com');

-- Create the Orders table
CREATE TABLE Orders (
  order_id INT PRIMARY KEY,
  customer_id INT,
  order_date DATE,
  total_amount DECIMAL(10, 2)
);

-- Insert sample data into the Orders table
INSERT INTO Orders (order_id, customer_id, order_date, total_amount)
VALUES
  (6, 4, '2023-01-01', 100.00),
  (7, 5, '2023-02-01', 200.00),
  (8, 6, '2023-03-01', 150.00),
  (4, 1, '2023-04-01', 75.00),
  (5, 2, '2023-05-01', 300.00);

  -- Create the Employees table
CREATE TABLE Employees (
  employee_id INT PRIMARY KEY,
  employee_name VARCHAR(50),
  manager_id INT
);

-- Insert sample data into the Employees table
INSERT INTO Employees (employee_id, employee_name, manager_id)
VALUES
  (1, 'John Smith', 3),
  (2, 'Jane Doe', 3),
  (3, 'David Johnson', NULL),
  (4, 'Emily Davis', 2),
  (5, 'Michael Brown', 2);

  /*OPERATION START*/

---INNER JOIN 

SELECT Customers.customer_name, Orders.order_date, Orders.total_amount
FROM Customers
INNER JOIN Orders ON Customers.customer_id = Orders.customer_id;

---OR
SELECT *
FROM Customers
INNER JOIN Orders ON Customers.customer_id = Orders.customer_id;

--LEFT JOIN
SELECT Customers.customer_name, Orders.order_date, Orders.total_amount
FROM Customers
LEFT JOIN Orders ON Customers.customer_id = Orders.customer_id;

---OR
SELECT *
FROM Customers
LEFT JOIN Orders ON Customers.customer_id = Orders.customer_id;

--RIGHT JOIN
SELECT Customers.customer_name,Customers.customer_id,Orders.order_id, Orders.order_date, Orders.total_amount
FROM Customers RIGHT JOIN Orders ON Customers.customer_id = Orders.customer_id;

--OR
SELECT *
FROM Customers
RIGHT JOIN Orders ON Customers.customer_id = Orders.customer_id;


---FULL JOIN
SELECT Customers.customer_name, Orders.order_date, Orders.total_amount
FROM Customers
FULL OUTER JOIN Orders ON Customers.customer_id = Orders.customer_id;

---OR
SELECT *
FROM Customers
FULL OUTER JOIN Orders ON Customers.customer_id = Orders.customer_id;

SELECT * FROM Customers
SELECT * FROM Orders

---SELF JOIN
SELECT * FROM Employees

SELECT E1.employee_name AS MANAGER,E2.employee_name AS EMP
FROM Employees E1 JOIN Employees E2 ON E1.employee_id=E2.manager_id

---CROSS 


---NATURAL



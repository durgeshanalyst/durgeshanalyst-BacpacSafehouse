CREATE DATABASE SET_OPERATOR
USE SET_OPERATOR;

CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    email VARCHAR(100),
    phone_number VARCHAR(20)
);

INSERT INTO Customers (customer_id, customer_name, email, phone_number)
VALUES
    (1, 'John Smith', 'john.smith@example.com', '+44 123456789'),
    (2, 'Emma Johnson', 'emma.johnson@example.com', '+44 987654321'),
    (3, 'David Brown', 'david.brown@example.com', '+44 789456123'),
    (4, 'Sarah Wilson', 'sarah.wilson@example.com', '+44 654789123');

CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10,2),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

INSERT INTO Orders (order_id, customer_id, order_date, total_amount)
VALUES
    (1, 1, '2023-05-15', 250.00),
    (2, 3, '2023-06-10', 150.00),
    (3, 2, '2023-06-20', 300.00),
    (4, 4, '2023-06-22', 100.00);

CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    unit_price DECIMAL(10,2)
);

INSERT INTO Products (product_id, product_name, unit_price)
VALUES
    (1, 'Laptop', 1200.00),
    (2, 'Smartphone', 800.00),
    (3, 'Headphones', 50.00),
    (4, 'External Hard Drive', 100.00);

	CREATE TABLE OtherCustomers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    email VARCHAR(100),
    phone_number VARCHAR(20)
);

CREATE TABLE FeaturedProducts (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    unit_price DECIMAL(10,2)
);

INSERT INTO OtherCustomers (customer_id, customer_name, email, phone_number)
VALUES
    (5, 'Lisa Turner', 'lisa.turner@example.com', '+44 123456789'),
    (6, 'James Wilson', 'james.wilson@example.com', '+44 987654321'),
    (7, 'Laura Anderson', 'laura.anderson@example.com', '+44 789456123'),
	(1, 'John Smith', 'john.smith@example.com', '+44 123456789'),
    (2, 'Emma Johnson', 'emma.johnson@example.com', '+44 987654321')


	INSERT INTO FeaturedProducts (product_id, product_name, unit_price)
VALUES
    (1, 'Laptop', 1200.00),
    (3, 'Headphones', 50.00),
    (5, 'Smart Watch', 200.00);



	/*All Tables*/

	SELECT * FROM Customers

	SELECT * FROM Orders
	SELECT * FROM Products


/*Query*/

SELECT * FROM CUSTOMERS
SELECT * FROM OTHERCUSTOMERS

---Union
SELECT customer_id, customer_name FROM Customers
UNION --- always return the distinct values
SELECT customer_id, customer_name FROM OtherCustomers;

---Union All
SELECT customer_id, customer_name FROM Customers
UNION all  --- Consider all records including duplicate.
SELECT customer_id, customer_name FROM OtherCustomers;

--Intersect
SELECT * FROM Products
SELECT * FROM FeaturedProducts

SELECT product_id, product_name FROM Products
INTERSECT
SELECT product_id, product_name FROM FeaturedProducts;

---Except/minus
SELECT product_id, product_name FROM Products
EXCEPT
SELECT product_id, product_name FROM FeaturedProducts;

/*Diffrence between join and set operator*/
-- set operator owrk on 2 fixed Rule
--- Join work on join principle
--Query optimization ---
---1. write all your column name in select clause instead of *

/*Join*/
---Inner join
SELECT * FROM Customers
SELECT * FROM Orders
SELECT Customers.customer_id,Customers.customer_name,customers.phone_number,orders.order_id,Orders.total_amount
FROM Customers  JOIN Orders ON Customers.customer_id = Orders.customer_id;
----- Aliasing 
SELECT c.customer_id,c.customer_name,c.phone_number,o.order_id,o.total_amount
FROM Customers c JOIN Orders o ON c.customer_id = o.customer_id;




---OR
CREATE VIEW CUSTOMER_CUM_ORDER AS
SELECT Customers.customer_id, Customers.customer_name, Orders.order_id,Orders.order_date,ORDERS.total_amount
FROM Customers 
INNER JOIN Orders ON Customers.customer_id = Orders.customer_id;

SELECT * FROM CUSTOMER_CUM_ORDER

select * from Customers
select * from Orders

/*Left Join*/
SELECT Customers.customer_id, Customers.customer_name, Orders.order_id
FROM Customers LEFT JOIN Orders ON Customers.customer_id = Orders.customer_id;

/*RIGHT JOIN*/
SELECT Customers.customer_id, Customers.customer_name, Orders.order_id
FROM Customers
RIGHT JOIN Orders ON Customers.customer_id = Orders.customer_id;

/*FULL JOIN*/
SELECT Customers.customer_id, Customers.customer_name, Orders.order_id
FROM Customers
FULL JOIN Orders ON Customers.customer_id = Orders.customer_id;

insert into Orders values (6,6,'2023-08-13',1000)

----WAY TO WRITE JOIN

SELECT C.customer_id,C.customer_name,O.order_date,O.total_amount
FROM Customers C
LEFT JOIN Orders O ON C.customer_id=O.customer_id


/*Advance join*/
----SELF JOIN
CREATE TABLE EMPLOYEE(
EID INT,
NAME VARCHAR(10),
MID INT
)

INSERT INTO EMPLOYEE VALUES 
(1,'Durgesh',1),
(2,'Kalpana',1),
(3, 'Asrar',2),
(4, 'Kartikey',2);


create table company(
company_name varchar(max)
)

insert into company values ('letsbeanalyst')

select * from company
select * from EMPLOYEE


---self : - means the join operation will happen within the same tbale

---fetch the employee id, employee nmae along with their manager name

SELECT E.EID,E.NAME,M.NAME AS MANAGER_NAME
FROM EMPLOYEE E JOIN EMPLOYEE M ON E.MID = M.EID


CROSS JOIN

SELECT * FROM company
SELECT * FROM EMPLOYEE 

SELECT * FROM EMPLOYEE CROSS JOIN  company


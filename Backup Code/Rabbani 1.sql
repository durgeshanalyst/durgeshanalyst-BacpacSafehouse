CREATE DATABASE [DURGESH RABBANI];
USE [DURGESH RABBANI]

create table student
(	student_id int,
	student_name varchar(20),
	student_age int
);

SELECT * FROM STUDENT

SELECT * FROM X;


INSERT INTO student VALUES(1,'Rabbani',24);
INSERT INTO student VALUES(2,'Durgesh',24);


INSERT INTO student 
(STUDENT_ID,STUDENT_NAME)
SELECT STUDENT_ID,
	STUDENT_NAME
FROM X
WHERE student_name IS NULL


SELECT * FROM student


ALTER TABLE STUDENT DROP COLUMN STUDENT_AGE;

ALTER TABLE STUDENT ADD STUDENT_AGE CHAR(1);
  
ALTER TABLE STUDENT ALTER COLUMN STUDENT_AGE VARCHAR(10);

SELECT * FROM student

-----UPDATE COMMAND
/*
LEST LEARN DML COMMAND - UPDATE
AND DELETE
*/
--UPDATE SUDENT NAME AS DURGESH WHERE NAME IS NULL
Begin Transaction
UPDATE student
SET student_id = 3
where student_name is null
commit

Begin Transaction
UPDATE student
SET student_name = 'john'
where student_id = 3

rollback
select * from student

begin transaction
DELETE  from student where student_id=3

select * from Customerorders;


/*write a query to return total order by customer*/

select  customerid----,  count(distinct orderid) as Ordered
from customerorders
group by CustomerId
order by Ordered desc


--- find the cutsoer who order atleast 3 time

----having : 
select * from (
select  customerid,  count(distinct orderid) as Ordered
from customerorders
group by CustomerId)d
where Ordered >=3


----haviing

select  customerid,  count(distinct orderid) as Ordered
from customerorders
group by CustomerId
having count(distinct orderid) >=3;

SELECT * FROM CustomerOrders

SELECT COLUMN_NAME, DATA_TYPE FROM (
SELECT * FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'CustomerOrders' )D


SELECT CAST(23.5 AS INT)
SELECT CONVERT(INT,23.5)

SELECT CAST(ORDERAMOUNT AS decimal) FROM CustomerOrders



ALTER TABLE CUSTOMERORDERS ALTER COLUMN ORDERAMOUNT VARCHAR(20)

SELECT CUSTOMERID, SUM(CONVERT(SMALLINT,OrderAmount))
FROM CustomerOrders
GROUP BY CustomerID

SELECT ISNULL(NULL,'R')

SELECT COALESCE(NULL,NULL,1,NULL,2,NULL,4,NULL,3)

/*DATE FUNCTION*/

select convert(varchar,dateadd(Day,3,Getdate()),103)


---day \ month \ year

select day(getdate())
select month(getdate())
select year(getdate())
select datename(DW,getdate())
select datepart(year,getdate())


select * from CustomerOrders;
/*return high value value custome and low value customer with their name*/

WITH CTE AS (
SELECT CustomerID, CUSTOMERNAME, SUM(ORDERAMOUNT) AS PURCHASE
FROM CustomerOrders
GROUP BY CustomerID, CustomerName)
SELECT CUSTOMERID,CUSTOMERNAME,PURCHASE, CASE WHEN PURCHASE >= 1000 THEN 'HIGH PAYING CUSTOMER' ELSE 'LOW PAYING CUSTOMER' END CUSTOMERTYPE
FROM CTE


/*costly product or chipest product */
---case when inside group by

with cte as(
SELECT case when OrderAmount < 500 then 'cheapest'
			when OrderAmount > 500 then 'expensive' end as product_type, sum(OrderAmount) as order_value ,
	   sum(case when OrderAmount < 500 then 1 else 0 end) as cheapest_count ,
	   sum(case when OrderAmount > 500 then 1 else 0 end) as expensive_count
from CustomerOrders
group by case when OrderAmount < 500 then 'cheapest'
			when OrderAmount > 500 then 'expensive' end )
SELECT CONCAT_WS(' ', 
                product_type, 
                'product was sold for', 
                order_value,'$',
                'at', 
                cheapest_count + expensive_count) AS result
FROM cte;



/*i am learning sql with durgesh*/

select concat('I','am')


SELECT * FROM CustomerOrders
SELECT * FROM ORDERDETAILS
SELECT * FROM PRODUCTS
SELECT * FROM SHIPPERS
SELECT * FROM SUPPLIERS
SELECT * FROM ORDERS
SELECT * FROM CUSTOMERS
SELECT * FROM PAYMENTS

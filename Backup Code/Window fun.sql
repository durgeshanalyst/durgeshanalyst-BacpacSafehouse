USE [Premium Database]
----------Window Functions
--over(partition by customerid)
--partition by 

---row_number(),rank(),dense_rank()
--comparing lead() and lag()

SELECT * from orders;
select sum(total_order_amount) from orders;

select *, (select sum(total_order_amount) from orders) as total_order_amount from orders;

select customerid, sum(total_order_amount) from orders group by customerid;

---1. Display the total order amount and the total_order_amount per customerid along with every row value.
---2. Arrange the total order amount in a decreasing order within each customerid.

SELECT *,
sum(total_order_amount) over() as total_ord_amnt from orders;

SELECT *, sum(total_order_amount) over(order by orderdate) as total_ord_amnt from orders;

SELECT *, sum(total_order_amount) over(order by customerid desc) as total_ord_amnt from orders;

SELECT *, sum(total_order_amount) over(order by orderdate, customerid) as total_ord_amnt from orders;

select customerid, sum(total_order_amount) from orders group by customerid;

SELECT *, sum(total_order_amount) over(partition by customerid) as total_ord_cust from orders;

SELECT *, sum(total_order_amount) over(partition by customerid order by orderdate) as running_total from orders;

select * from Orders
-----
select *,ntile(10) over( order by total_order_amount desc) as quartiles from orders

select *,
lag(total_order_amount,1) over(partition by customerid order by total_order_amount) as lag_,
lead(total_order_amount,1) over(partition by customerid order by total_order_amount) as lead_ 
from orders;


select *,
lag(total_order_amount,4) over( order by orderdate) as lag_,
lead(total_order_amount,1) over(order by orderdate) as lead_ 
from orders;

select *,
max(salary) over(partition by paymentid) as max_,
min(salary) over(partition by paymentid) as min_ 
from orders;


---Ranking in datasets----
select *, row_number() over (order by orderdate) as rank_1 from orders;

select *, rank() over (order by orderdate) as rank_1 from orders;

select *, dense_rank() over (order by orderdate) as rank_1 from orders;

select *, row_number() over (order by orderdate) as row_n,
rank() over (order by orderdate) as rankn,
dense_rank() over (order by orderdate) as denserankn
from orders;

select *, row_number() over (partition by customerid order by total_order_amount desc) as row_n,
rank() over (partition by customerid order by total_order_amount desc) as rankn,
dense_rank() over (partition by customerid order by total_order_amount desc) as denserankn
from orders;

select *, row_number() over (partition by customerid order by orderdate desc) as row_n,
rank() over (partition by customerid order by orderdate desc) as rankn,
dense_rank() over (partition by customerid order by orderdate desc) as denserankn
from orders;

select *,
sum(salary) over (order by orderdate rows between 2 preceding and 1 following) as sum_1,
sum(salary) over (order by orderdate rows between current row and 1 following) as sum_2,
sum(salary) over (order by orderdate rows between 2 preceding and current row) as sum_3,
sum(salary) over (order by orderdate rows between unbounded preceding and unbounded following) as sum_4,
sum(salary) over (order by orderdate rows between unbounded preceding and current row) as sum_5,
sum(salary) over (order by orderdate) as sum_6
from orders;

—-Post Class Updates

------------Temp Tables and Views
use ecomm_data;

select * into #temp_table1
from orders;

SELECT * into #temp_table2 from (select * from orderdetails where supplierid > 6)c;

select * into db_class2.#temp_table3 from orders;

create table #tablename as
(col1 int primary key,
col2 int not null);

---used in other SQL versions
create TEMP table table_nm AS
SELECT * from orders;

create VIEW view_chk as 
select * from orders;

select * from view_chk where PaymentID = 1;

drop view view_chk;

----------Window Functions
SELECT * from orders;

select sum(total_order_amount) from orders;

select *, (select sum(total_order_amount) from orders) as total_order_amount from orders;

select*, sum(total_order_amount) over () as sum_total from orders;

select customerid, sum(total_order_amount) from orders group by customerid;

select customerid, sum(total_order_amount) over (partition by customerid) from orders;

select *, sum(total_order_amount) over (partition by customerid) as new_col from orders;

1. Display the total order amount and the total_order_amount per customerid along with every row value.
2. Arrange the total order amount in a decreasing order within each customerid.

SELECT *, sum(total_order_amount) over() as total_ord_amnt from orders;

SELECT *, sum(total_order_amount) over(order by orderdate) as total_ord_amnt from orders;

SELECT *, sum(total_order_amount) over(order by customerid desc) as total_ord_amnt from orders;

SELECT *, sum(total_order_amount) over(order by orderdate, customerid) as total_ord_amnt from orders;

select customerid, sum(total_order_amount) from orders group by customerid;

SELECT *, min(total_order_amount) over(partition by customerid) as min_ord_amt,
max(total_order_amount) over(partition by customerid) as max_ord_amt  from orders;

SELECT *, sum(total_order_amount) over(partition by customerid order by orderdate) as running_total from orders;


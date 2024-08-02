---Ranking in datasets----
select * from Orders
select *, row_number() over (order by orderdate) as rank_1 from orders;

select *, rank() over (order by orderdate) as rank_1 from orders;

select *, rank() over (order by Total_order_amount) as rank_1
,dense_rank() over (order by Total_order_amount) as rank_2 from orders;

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


-----
select *,ntile(4) over( order by total_order_amount desc) as quartiles from orders;

select *,
lag(salary,1) over(partition by customerid order by total_order_amount) as lag_,
lead(salary,1) over(partition by customerid order by total_order_amount) as lead_ 
from orders;


select *,
lag(total_order_amount,4) over( order by orderdate) as lag_,
lead(total_order_amount,1) over(order by orderdate) as lead_ 
from orders;

select *,
max(salary) over(partition by paymentid) as max_,
min(salary) over(partition by paymentid) as min_ 
from orders;


/*range between unbounded preceding and current row*/
select *,
sum(total_order_amount) over (order by orderdate rows between  preceding and 1 following) as sum_1,
sum(total_order_amount) over (order by orderdate rows between current row and 1 following) as sum_2,
sum(total_order_amount) over (order by orderdate rows between 2 preceding and current row) as sum_3,
sum(total_order_amount) over (order by orderdate rows between unbounded preceding and unbounded following) as sum_4,
sum(total_order_amount) over (order by orderdate rows between unbounded preceding and current row) as sum_5,
sum(total_order_amount) over (order by orderdate) as sum_6
from orders;

—Post Class Updates

use [Premium database];

---Ranking in datasets----q
select *, row_number() over (order by orderdate) as row_n_1 from orders;

select *, row_number() over (order by orderdate) as row_n_1,
row_number() over (order by orderdate desc) as row_n_2 from orders
order by orderdate;

select *, rank() over (order by orderdate) as rank_1 from orders;

select *, dense_rank() over (order by orderdate) as dense_rank_1 from orders;

select orderid, row_number() over (order by orderdate desc) as row_n,
rank() over (order by orderdate desc) as rankn,
dense_rank() over (order by orderdate desc) as denserankn
from orders;

select * from(
select *, row_number() over (partition by customerid order by total_order_amount desc) as row_n,
rank() over (partition by customerid order by total_order_amount desc) as rankn,
dense_rank() over (partition by customerid order by total_order_amount desc) as denserankn
from orders)c where denserankn <= 4;


select * from (
select *, row_number() over (partition by customerid order by total_order_amount desc) as row_n,
rank() over (partition by customerid order by total_order_amount desc) as rankn,
dense_rank() over (partition by customerid order by total_order_amount desc) as denserankn
from orders)c where denserankn = 3;

select * from (
select *,
dense_rank() over (partition by customerid order by total_order_amount desc) as denserankn
from orders)c where denserankn = 10;

select * from (
select *,
dense_rank() over (order by total_order_amount) as denserankn
from orders)c where denserankn = 10;


select *,
dense_rank() over (order by total_order_amount) as denserankn
from orders where dense_rank() over (order by total_order_amount) = 3;


select * from (
select *,
dense_rank() over (order by total_order_amount desc) as denserankn
from orders)c where denserankn = 10;

select *, row_number() over (partition by customerid order by orderdate desc) as row_n,
rank() over (partition by customerid order by orderdate desc) as rankn,
dense_rank() over (partition by customerid order by orderdate desc) as denserankn
from orders;


-----
select *,ntile(2) over( order by total_order_amount desc) as deciles from orders;
select *,ntile(10) over( order by total_order_amount desc) as deciles from orders;

select *,
lag(total_order_amount,1) over(order by orderdate) as lag_,
lead(total_order_amount,1) over(order by orderdate) as lead_ 
from orders;


select *,
lag(total_order_amount,1) over(partition by customerid order by orderdate) as lag_,
lead(total_order_amount,1) over(partition by customerid order by orderdate) as lead_ 
from orders;


select *,
lag(total_order_amount,4) over(order by total_order_amount) as lag_,
lead(total_order_amount,3) over(order by total_order_amount) as lead_ 
from orders;

select *,
LAG(orderdate,1) over(PARTITION by customerid order by orderdate) as lead_ 
from orders where customerid = 57081;

select *,
max(total_order_amount) over(partition by paymentid) as max_,
min(total_order_amount) over(partition by paymentid) as min_ 
from orders;

select orderid,total_order_amount, orderdate,
sum(total_order_amount) over (order by orderdate rows between 2 preceding and 1 following) as sum_1,
sum(total_order_amount) over (order by orderdate rows between 1 FOLLOWING and 5 following) as sum_7,
sum(total_order_amount) over (order by orderdate rows between current row and 1 following) as sum_2,
sum(total_order_amount) over (order by orderdate rows between 2 preceding and current row) as sum_3,
sum(total_order_amount) over (order by orderdate rows between unbounded preceding and unbounded following) as sum_4,
sum(total_order_amount) over (order by orderdate rows between unbounded preceding and current row) as sum_5,
sum(total_order_amount) over (order by orderdate) as sum_6
from orders;


select orderid,total_order_amount, orderdate,customerid,
sum(total_order_amount) over (PARTITION by customerid order by orderdate rows between 2 preceding and 1 following) as sum_1,
sum(total_order_amount) over (PARTITION by customerid order by orderdate rows between 1 FOLLOWING and 5 following) as sum_7,
sum(total_order_amount) over (PARTITION by customerid order by orderdate rows between current row and 1 following) as sum_2,
sum(total_order_amount) over (PARTITION by customerid order by orderdate rows between 2 preceding and current row) as sum_3,
sum(total_order_amount) over (PARTITION by customerid order by orderdate rows between unbounded preceding and unbounded following) as sum_4,
sum(total_order_amount) over (PARTITION by customerid order by orderdate rows between unbounded preceding and current row) as sum_5,
sum(total_order_amount) over (PARTITION by customerid order by orderdate) as sum_6
from orders;


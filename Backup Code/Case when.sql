CREATE DATABASE CASE_WHEN
USE CASE_WHEN

USE [Premium Database]
---------------Case When
----- conditional case when

SELECT * FROM customers;

SELECT *, CASE
				WHEN COUNTRY = 'UNITED STATES' THEN 'US'
				WHEN COUNTRY = 'GERMANY' THEN 'GE'
				ELSE COUNTRY
				END AS COUNTRY
FROM CUSTOMERS




select *,
CASE WHEN rating > 4 then 'High'
     WHEN rating <=4 and rating > 2.5 THEN 'Average'
     WHEN rating <=2.5 then 'Low'
     else 'Not Applicable'
     end as rating_bucket
FROM products;


select *,
CASE WHEN rating > 0 then rating
     else 0
     end as rating_bucket
FROM products;

--case when in aggregate function
SELECT * FROM Products

select *, CASE WHEN sale_price > 500 then sale_price end from products;

select category_id, AVG(sale_price) as all_products_avg,
AVG(CASE WHEN sale_price > 500 then sale_price else NULL end) as price_gt_500
FROM products
GROUP by category_id;


select category_id, SUM(sale_price) as all_products_sum,
SUM(CASE WHEN sale_price > 500 then sale_price else NULL end) as price_gt_500
FROM products
GROUP by category_id;


SELECT *, 
case when rating is NOT NUll then sale_price end as case_ex from products;

SELECT *, 
case when type like 'T%' then sale_price end as case_ex from products;


--case when in group by

select
CASE WHEN rating > 4 then 'High'
     WHEN rating <=4 and rating > 2.5 THEN 'Average'
     WHEN rating <=2.5 then 'Low'
     else 'Not Applicable'
     end , count(*), avg(rating)
FROM products
group By 
CASE WHEN rating > 4 then 'High'
     WHEN rating <=4 and rating > 2.5 THEN 'Average'
     WHEN rating <=2.5 then 'Low'
     else 'Not Applicable'
     end;

---- using case when in order by

----RETURN ALL PRODUCTS AND SORT YOUR OUTPUT BY BRAND IN ASCENDING AND BY SUBCATEGORY IN DESC WHEN BRAND IS AMUL 
---1ST 
select * from products order by brand;

---2ND 
SELECT * from products
ORDER by brand, Sub_Category DESC


SELECT * from products
ORDER by brand ASC, CASE when brand = 'AMUL' then sub_category  end DESC


SELECT * from products WHERE BRAND = 'AMUL'



SELECT * from products
where brand in ('Amul','Aloe Veda')
ORDER by brand,
CASE when brand = 'Amul' then sub_category end Desc;

select * from products order by brand;

SELECT * from products
ORDER by
CASE when brand = 'Amul' then 0 else 1 end, brand;

select *, CASE when brand = 'Amul' then 1 else 0 end from products order by brand;




SELECT * from products
ORDER by
CASE when brand in ('Amul', 'Aloe Veda') then 1 else 0 end DESC, brand;


SELECT * from products
ORDER by
CASE when brand in ('Amul') then 2
when brand in ('Aloe Veda') then 1 else 0 end DESC, brand;

-------------Updating Using Case when


UPDATE Customers
SET CustomerID = '7654735'
WHERE NAME = 'JDHF'

SELECT * FROM Customers;

UPDATE Customers
set country = case when Country = 'UK' then 'United Kingdom'
                   when country = 'USA' then 'US' 
                   else country end;

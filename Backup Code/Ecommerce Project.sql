CREATE DATABASE ECOMMERCE
USE ECOMMERCE

SELECT table_name, table_schema
FROM informatiON_schema.tables
WHERE table_type = 'BASE TABLE'
ORDER BY table_name ASC;

/*write query to analyze sales for each state and each year*/
WITH SALES_DELIVERED AS(
SELECT * FROM olist_orders_datASet
WHERE ORDER_STATUS = 'delivered')
SELECT ROUND(SUM(OOID.price),2) AS Total_sales_price,
	c.customer_state,DATEPART(year,s.order_purchase_timestamp) as in_year
FROM SALES_DELIVERED S JOIN olist_customers_dataset C ON S.customer_id=C.customer_id
					JOIN olist_order_items_dataset OOID ON OOID.order_id=S.order_id
	group by c.customer_state,DATEPART(year,s.order_purchase_timestamp)


/*Alternative way*/
CREATE VIEW SALES_DELIVERED AS(
SELECT * FROM olist_orders_datASet
WHERE ORDER_STATUS = 'delivered'
)

/*Sales Analysis*/
CREATE VIEW FINAL1 AS (
SELECT ROUND(SUM(OOID.price),2) AS Total_sales_price,
	c.customer_state,DATEPART(year,s.order_purchase_timestamp) as in_year
FROM SALES_DELIVERED S JOIN olist_customers_dataset C ON S.customer_id=C.customer_id
					JOIN olist_order_items_dataset OOID ON OOID.order_id=S.order_id
	group by c.customer_state,DATEPART(year,s.order_purchase_timestamp)
)

/*Q.2 All order status*/
SELECT ROUND(SUM(OOID.price),2) AS Total_sales_price,
	c.customer_state,DATEPART(year,O.order_purchase_timestamp) as in_year,
	COUNT(DISTINCT O.ORDER_ID) AS ORDER_COUNT
	FROM olist_customers_dataset C 
					JOIN olist_orders_datASet O ON O.customer_id=C.customer_id
					JOIN olist_order_items_dataset OOID ON OOID.order_id=O.order_id
GROUP BY DATEPART(year,O.order_purchase_timestamp), c.customer_state
ORDER BY ORDER_COUNT DESC


/*Total customer in each year*/

CREATE VIEW CUSTOMERS_WE_HAVE AS (
SELECT in_year,SUM(customer_exist) AS cust FROM (
  SELECT COUNT(c.customer_id) AS customer_exist,c.customer_state,datepart(year,o.order_purchASe_timestamp) in_year
FROM olist_customers_datASet c join olist_orders_datASet o ON c.customer_id= o.customer_id
GROUP BY c.customer_state,datepart(year,o.order_purchASe_timestamp) )d
GROUP BY in_year)

SELECT * FROM CUSTOMERS_WE_HAVE

  /*How many order placed in each city and each year*/

CREATE VIEW ORDER_COUNT AS (
SELECT COUNT(distinct O.order_id) AS TOTAL_ORDER, C.customer_state,DATEPART(YEAR,O.order_purchASe_timestamp) AS IN_YEAR
FROM olist_customers_datASet C JOIN olist_orders_datASet O ON C.customer_id=O.customer_id
                               join  olist_order_items_datASet ooid ON ooid.order_id=o.order_id
GROUP BY C.customer_state,DATEPART(YEAR,O.order_purchASe_timestamp))
SELECT * FROM ORDER_COUNT


SELECT * FROM olist_customers_datASet;
SELECT * FROM olist_order_items_datASet;
SELECT * FROM olist_order_payments_datASet;
SELECT * FROM olist_order_reviews_datASet;
 SELECT * FROM olist_orders_datASet;
SELECT * FROM olist_sellers_datASet;
SELECT * FROM  olist_geolocatiON_datASet;
SELECT * FROM product_category_name_translatiON;
SELECT * FROM olist_product_datASet
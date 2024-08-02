CREATE DATABASE SQLPYTHONENDTOEND
use SQLPYTHONENDTOEND;

CREATE TABLE df_orders (
    order_id INT,
    order_date DATE,
    ship_mode VARCHAR(50),
    segment VARCHAR(50),
    country VARCHAR(50),
    city VARCHAR(50),
    state VARCHAR(50),
    postal_code VARCHAR(20),
    region VARCHAR(50),
    category VARCHAR(50),
    sub_category VARCHAR(50),
    product_id INT,
    quantity INT,
    discount_percent FLOAT,
    discount FLOAT,
    sales FLOAT,
    profit FLOAT
);


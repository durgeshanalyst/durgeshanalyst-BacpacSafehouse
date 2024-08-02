CREATE DATABASE SQL6DAY;

USE SQL6DAY

CREATE TABLE EMP(
NAME VARCHAR(10),
AGE INT,
ID INT PRIMARY KEY
)

   
INSERT INTO EMP VALUES
('VIBHA', 21, 164),
('DURGESH',23,142);

BEGIN TRANSACTION
UPDATE EMP
SET NAME = 'JAMES'
WHERE NAME = 'JAMES BOND'

ROLLBACK TRANSACTION


BEGIN TRANSACTION
DELETE FROM EMP
WHERE ID = 141


BEGIN TRANSACTION
TRUNCATE TABLE EMP;


CREATE TABLE HELLO_WORLD
(Batsman varchar PRIMARY KEY, 
Batsman_Order int, Run int, 
ICC_ID varchar)

Select * from HELLO_WORLD

/*changing data type */


alter table Hello_world alter column Batsman  varchar(10)

insert into HELLO_WORLD values ('Rohit', 1, 54, 'X575')


USE [Premium Database]
---creating a proc
--SQL SERVER
CREATE PROC proc_1
AS
BEGIN
    SELECT 
        *
    FROM 
        orders
    ORDER BY 
        orderdate;
END;

EXEC proc_1

CREATE or alter PROCEDURE proc_2 @bhawna_order_value INT
AS
BEGIN
    SELECT 
        orderdate, 
        orderid,
        customerid,
        paymentid,
        total_order_amount
    FROM 
        orders
    where total_order_amount > @bhawna_order_value
    ORDER BY 
        total_order_amount;
END;

EXEC proc_2 @bhawna_order_value = 1200

---proc with dynamic vars  -- PostGRE
CREATE PROCEDURE order_proc (order_amt INT)
LANGUAGE plpgsql
AS $$
BEGIN
CREate table proc_outp as
    SELECT 
        orderdate, 
        orderid,
        customerid,
        paymentid,
        total_order_amount
    FROM 
        orders
    where total_order_amount > order_amt
    ORDER BY 
        total_order_amount;
END; $$

CALL order_proc(90000);

select * from proc_outp;

create table payments_1 AS
select * from payments;

CREATE PROCEDURE proc_up(typenameto VARCHAR(30), typenamefrom VARCHAR(30))
LANGUAGE plpgsql 
AS $$
BEGIN
UPDATE payments_1 SET 
paymenttype = typenameto
where paymenttype = typenamefrom;
END;$$

CALL proc_up('Pay on Delivery','POD');

SELECT * from payments_1;

-------------------------------
CREATE TABLE payments_audit
([paymentid] SMALLINT,
 [paymenttype] VARCHAR(20),
 [allowed] VARCHAR(20),
[updated_at] DATETIME,
 [operation] CHAR(3));

 TRIGGER

--SQL SERVER
CREATE TRIGGER trg_pay_audit
ON payments
AFTER INSERT, DELETE
AS
BEGIN
    INSERT INTO payments_audit(
        paymentid, 
        paymenttype,
        allowed,
        updated_at,
        operation
    )
    SELECT
      paymentid, 
        paymenttype,
        allowed,
        getdate(),
        'INS'
    FROM
        inserted
    UNION ALL
    SELECT
         paymentid, 
        paymenttype,
        allowed,
        getdate(),
        'DEL'
    FROM
        deleted;
END;

INSERT INTO payments(
  paymentid, 
        paymenttype,
        allowed
)
VALUES 
 (10,'MEAL CARD','YES');
 
 
select * from payments_audit;

DELETE from Payments where paymentid  = 2;

select * from payments_audit;
SELECT * from Payments;

----POSTGRESQL
CREATE TABLE payments_audit
(paymentid INT,
 paymenttype VARCHAR(20),
 allowed VARCHAR(20),
updated_at DATE);


CREATE FUNCTION proc_ins()
RETURNs TRIGGER
AS $$
BEGIN
INSERT INTO payments_audit(paymentid,paymenttype, allowed, updated_at) VALUES (NEW.paymentid,NEW.paymenttype,NEW.allowed,CURRENT_DATE);
RETURN NEW;
END;$$
LANGUAGE plpgsql;

CREATE TRIGGER data_trig
AFTER INSERT 
ON payments_1
FOR EACH ROW
  EXECUTE PROCEDURE proc_ins();

INSERT INTO payments_1(
  paymentid, 
        paymenttype,
        allowed) VALUES (10,'MEAL CARD','YES');

select * from payments_audit;

DROP TRIGGER on payments_1;


---Post Class Updates

use [Premium database];

---creating a proc
--SQL SERVER
CREATE PROCEDURE proc_1
AS
BEGIN
    SELECT 
        *
    FROM 
        orders
    ORDER BY 
        orderdate;
END;

EXEC proc_1;
EXECUTE proc_1;

ALTER PROCEDURE proc_1
    AS
    BEGIN
         SELECT 
        *
    FROM 
        orders
    ORDER BY 
        shipperid;
    END;

EXEC proc_1;

DROP PROCEDURE proc_1;

DROP PROC proc_2; 


CREATE PROCEDURE proc_2 @order_amt INT
AS
BEGIN
    SELECT 
        orderdate, 
        orderid,
        customerid,
        paymentid,
        total_order_amount
    FROM 
        orders
    where total_order_amount > @order_amt
    ORDER BY 
        total_order_amount;
END;

EXEC proc_2 @order_amt = 5000;

EXEC proc_2 70000;


CREATE PROCEDURE proc_3 @order_amt INT = 10000
AS
BEGIN
    SELECT 
        orderdate, 
        orderid,
        customerid,
        paymentid,
        total_order_amount
    FROM 
        orders
    where total_order_amount > @order_amt
    ORDER BY 
        total_order_amount;
END;

EXEC proc_3 @order_amt = 5000;

EXEC proc_3;


CREATE PROCEDURE proc_5 @order_amt INT = 10000, @shipper INT
AS
BEGIN
    SELECT 
        orderdate, 
        orderid,
        customerid,
        paymentid,
		shipperid,
        total_order_amount
    FROM 
        orders
    where total_order_amount > @order_amt and ShipperID = @shipper
    ORDER BY 
        total_order_amount;

   select * from orders;
END;

EXEC proc_4 4000,3;


EXEC proc_5;
EXEC proc_5 @shipper = 6;

EXEC proc_4 @shipper = 6;

select * from orders;

EXEC proc_1;

Drop proc proc_1;
Drop procedure proc_1;
-------------------------------
Select * into payments_chk from payments;

select * from payments_chk;


CREATE TABLE payments_audit
([paymentid] SMALLINT,
 [paymenttype] VARCHAR(20),
 [allowed] int,
[updated_at] DATETIME,
 [operation] CHAR(3));
 
--SQL SERVER
CREATE TRIGGER trg_pay_audit
ON payments_chk
AFTER INSERT, DELETE
AS
BEGIN
    INSERT INTO payments_audit(
        paymentid, 
        paymenttype,
        allowed,
        updated_at,
        operation
    )
    SELECT
      paymentid, 
        paymenttype,
        allowed,
        getdate(),
        'INS'
    FROM
        inserted
    UNION ALL
    SELECT
         paymentid, 
        paymenttype,
        allowed,
        getdate(),
        'DEL'
    FROM
        deleted;
END;

INSERT INTO payments_chk(
  paymentid, 
        paymenttype,
        allowed
)
VALUES 
 (13,'MEAL_CARD',1);
 
 
select * from payments_audit;

DELETE from Payments_chk where paymentid  = 2;

select * from payments_audit;
SELECT * from Payments_chk;


DISABLE TRIGGER ALL ON Payments_chk;

ENABLE TRIGGER ALL ON Payments_chk;

DROP TRIGGER trg_pay_audit;


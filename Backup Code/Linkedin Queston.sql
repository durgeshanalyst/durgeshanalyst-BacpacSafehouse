CREATE DATABASE LINKEDIN
USE LINKEDIN

create table emp(empid int);
insert into emp values(null);
insert into emp values(null);
insert into emp values(1);
insert into emp values(2);
insert into emp values(3);

select * from emp

---Output should be
EMPID NEW_EMPID
null -1
null -2
1	  1
2	  2
3	  3
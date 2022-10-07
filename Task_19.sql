create database Org;

use Org;

create table Worker(
worker_id int not nulL PRIMARY KEY ,
first_name varchar(20),
last_name varchar(20),
salary int,
joining_date DATETIME,
department varchar(20)
)
DROP TABLE Worker
insert into Worker values(001, 'Monika', 'Arora', 100000, '2014-02-20 09:00:00', 'HR')
insert into Worker values(002, 'Niharika', 'Verma', 80000, '2014-06-11 09:00:00', 'Admin'),

(003, 'Vishal', 'Singhal', 300000, '2014-02-20 09:00:00', 'HR'),

(004, 'Amitabh', 'Singh', 500000, '2014-02-20 09:00:00', 'Admin'),

(005, 'Vivek', 'Bhati', 500000, '2014-06-11 09:00:00', 'Admin'),
(006, 'Vipul', 'Diwan', 200000,'2014-06-11 09:00:00', 'Account'),

(007, 'Satish','Kumar', 75000, '2014-01-20 09:00:00', 'Account'),

(008, 'Geetika', 'Chauhan', 90000, '2014-04-11 09:00:00', 'Admin')


select * from Worker

--Q-1. Write an SQL query to fetch “FIRST_NAME” from Worker table using the alias name as <WORKER_NAME>.

select First_name as WORKER_NAME
FROM Worker

--Q-2. Write an SQL query to fetch “FIRST_NAME” from Worker table in upper case.

select Upper(First_name) AS First_name from Worker

--Q-3. Write an SQL query to fetch unique values of DEPARTMENT from Worker table.

select distinct DEPARTMENT from Worker

--Q-4. Write an SQL query to print the first three characters of FIRST_NAME from Worker table.

 select FIRST_NAME, LEFT(FIRST_NAME, 3) as 'First Three Letter' from Worker

-- Q-5. Write an SQL query that fetches the unique values of DEPARTMENT from Worker table and prints its length.

select distinct DEPARTMENT, len(DEPARTMENT) AS Length from Worker

--Q-6. Write an SQL query to print the FIRST_NAME and LAST_NAME from Worker table into a single column COMPLETE_NAME. A space char should separate them.

select  FIRST_NAME,LAST_NAME, FIRST_NAME + Space(1) + LAST_NAME  as COMPLETE_NAME from Worker

--Q-7. Write an SQL query to print details for Workers with the first name as “Vipul” and “Satish” from Worker table.

select * from Worker where FIRST_NAME='Vipul' or FIRST_NAME='Satish'

--Q-8. Write an SQL query to print details of Workers with DEPARTMENT name as “Admin”.

select worker_id,first_name, last_name , salary,joining_date from Worker where department='Admin'

--Q-9. Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘a’.

select worker_id,first_name, last_name , salary,joining_date from Worker where first_name like '%a'

--Q-10. Write an SQL query to print details of the Workers whose FIRST_NAME contains ‘a’.
select worker_id,first_name, last_name , salary,joining_date from Worker where first_name like '%a%'


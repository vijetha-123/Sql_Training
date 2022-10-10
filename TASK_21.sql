use Org

create table salesman(salesman_id int primary key,name varchar(20),city varchar(20),commission varchar(20));
create table customer(customer_id int primary key,cust_name varchar(20),city varchar(20),grade int,
salesman_id INT Foreign key(salesman_id) references salesman(salesman_id))

create table orders(ord_no int primary key,purch_amt varchar(20),ord_date datetime,
customer_id int foreign key(customer_id) references customer(customer_id),
salesman_id INT Foreign key(salesman_id) references salesman(salesman_id))

select * from salesman
select * from customer
select * from orders
--1. From the following table, create a view for those salespeople who belong to the city of New York.
create view newyork_ppl
as select salesman_id,name,city
from salesman
where city='newyork'

select * from newyork_ppl

--2. From the following table, create a view for all salespersons. Return salesperson ID, name, and city.
create view ALL_ppl
as select salesman_id,name,city
from salesman

select * from ALL_ppl

--3. From the following table, create a view to count the number of salespeople in each city. Return city, number of salespersons.
create view no_of_ppl
as
select city,count(city) as no_of_salesman
from salesman
group by city

select * from no_of_ppl

--4. From the following table, create a view that counts the number of customers in each grade.
create view no_of_cust
as
select grade,count(grade) as no_of_customer
from customer
group by grade

select * from no_of_cust

--5. From the following tables, create a view to get the salesperson and customer by name. Return order name, purchase amount,
--salesperson ID, name, customer name.
create view sales_cust_names
as
select o.ord_no,o.purch_amt,o.salesman_id,s.name,o.customer_id,c.cust_name
from orders as o inner join customer as c on o.customer_id=c.customer_id inner join salesman as s on o.salesman_id=s.salesman_id

select * from sales_cust_names
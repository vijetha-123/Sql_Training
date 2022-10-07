Create database Training
use Training
create table department(
DID int primary key,
Dname varchar(20) Unique Not Null
)
create table Employee(
Eid int primary key, Ename varchar(20) Not Null,
Edesignation varchar(20) default 'trainee',
Eage int check(Eage>22),
Edep int references Department(DID)
)
insert into department values(100,'IT'),(200,'TESTING'),(300,'designer'),(400,'Admin')

insert into Employee values(1,'John','junior trainee',23,200)
insert into Employee values(2,'sam','s/w engineer',25,300)
insert into Employee values(3,'shri','junior trainee',27,200)
insert into Employee values(4,'ash','HR',23,400)
insert into Employee values(5,'dany','junior trainee',24,400)
insert into Employee values(6,'preeth','testing engineer',25,100)

SELECT * FROM EMPLOYEE
SELECT * FROM department

create table customers(
CID int Primary key,
Cname varchar(20) Not Null,
CAddress varchar(20) Not Null,
OrderID INT unique Not Null)

create table orders(
Orderno int primary key IDENTITY(1,1),
Orderref int ,
OrderID INT Foreign key(OrderID) references customers(OrderID))

select * from customers
select * from orders

update customers set CAddress='udupi' where CID=102

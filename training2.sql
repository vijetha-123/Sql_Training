USE Training
--joins
-- join clause-combne rows from 2 or more tables based on commom column 
--ttypes-inner,outer(left,right,full),self,cross

create table Students(
SID int primary key,
Sname varchar(20)Not null,
Sdep int unique not null
)
create table Student_dep(
DID int primary key,
Dname varchar(20),
Dhead varchar(20)
)
select * from Students
select * from Student_dep
select * from Student_rep

insert into Students values(1,'john',102),(2,'sam',103),(3,'shri',104),(4,'peter',105)
insert into Student_dep values(102,'bca','jancy'),(103,'mba','prince'),(104,'bcom','jose'),(105,'mcom','lisa')

--inner join
select SID,SNAME,dname,dhead from Students inner join Student_dep on Sdep=DID

select SID,SNAME,dname,dhead from Students LEFT join Student_dep on Sdep=DID

alter table students add Srep varchar(20)
create table Student_rep(
SID INT PRIMARY KEY,
Sname varchar(20) unique not null)

--sequence
--create
create table demo(
tid int,tname varchar(20))

create sequence TraineeId as int start with 100 increment by 2

insert into demo values(NEXT VALUE FOR TraineeId,'john')
insert into demo values(NEXT VALUE FOR TraineeId,'sam')
insert into demo values(NEXT VALUE FOR TraineeId,'shri')
insert into demo values(NEXT VALUE FOR TraineeId,'peter')
insert into demo values(NEXT VALUE FOR TraineeId,'james')


create table demo1(
tid int,tname varchar(20))

create sequence TraineeId as int start with 100 increment by 2

insert into demo1 values(NEXT VALUE FOR TraineeId,'john')
insert into demo1 values(NEXT VALUE FOR TraineeId,'sam')
insert into demo1 values(NEXT VALUE FOR TraineeId,'shri')
insert into demo1 values(NEXT VALUE FOR TraineeId,'peter')
insert into demo1 values(NEXT VALUE FOR TraineeId,'james')

select * from demo
select * from demo1

--truncate 
Truncate table demo1

alter sequence TraineeId restart with 1000 increment by 1

--drop

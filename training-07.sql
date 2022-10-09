use Training

CREATE function fn_square(@a int)
returns int
as 
begin 
return @a* @a
end

select dbo.fn_square(4) as result

select * from demo

select dbo.fn_square(tid) ,tname from demo

select * from Employee
---stored procedure
create procedure sp_totalempbydesignation
as begin 
select Edesignation,count(Edep) as Total_emp_designation from Employee group by Edesignation
end

exec sp_totalempbydesignation

create procedure sp_EmpbyName(@empname varchar(20))
as begin 
select * from Employee where Ename=@empname
end

exec sp_EmpbyName 'sam'

--procedure with o/p parameter -output keyword

create procedure sp_Taotalemp(@totalemp int OUTPUT)
AS BEGIN
select @totalemp=count(Eid) from Employee
end

--execution 

declare @Result int
exec sp_Taotalemp @Result OUTPUT
print @Result

--temporary procedure-created and reflected in the rempdb(under system database)
--global and local

--all database objects that are created for temporary purpose are prefixed with:
--local-#
--global-##


--trigger
--1.dml trigger

create trigger trg_demo_start
on demo
for insert 
as
begin
	print 'you cannot insert into demo table'
	Rollback transaction
end

select * from demo

insert into demo values(100,'lisa','2022-10-02')

update demo set tname='lisa' where tid=108

alter trigger trg_demo_start
on demo
for insert ,update,delete
as
begin
	print 'you cannot perform dml into demo table'
	Rollback transaction
end

update demo set tname='james' where tid=108

select * from demo1

--2.ddl trigger
--database scope and server scope

create trigger trg_ddl_training
on database
for create_table,alter_table,drop_table
as 
begin
	print 'you cannot perform ddl'
	rollback transaction
end
create table demo2
(
id int
)
disable trigger trg_ddl_training on database

--server scope
create trigger trg_ddl_alldb
on all server
for create_table,alter_table,drop_table
as 
begin
	print 'you cannot perform ddl'
	rollback transaction
end
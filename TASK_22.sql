use Org

--1. Scalar Function with 2 parameters - any concept
create function fn_add(@a int, @b int)
returns int 
as 
begin
	return @a + @b
end

create function fn_sub(@a int, @b int)
returns int 
as 
begin
	return @a - @b
end
select dbo.fn_add(2,4) as result
select dbo.fn_sub(4,2) as result

--2. Procedure with OUTPUT parameter
create procedure sp_Totalorders(@totalorders int OUTPUT)
as
Begin
	Select @totalorders=count(ord_no) from orders
End

Declare @Result int
exec sp_Totalorders @Result OUTPUT
Print @Result

--3. Trigger to restrict DML access between 6:00PM to 10.00AM
create trigger trg_work
on work -- table name
FOR INSERT, UPDATE, DELETE
as
begin
	if DATEPART(HH,GETDATE())>18 and DATEPART(HH,GETDATE())<10 
	BEGIN
		print 'You cannot insert into the WORK table between 6:00PM to 10.00AM'
		Rollback transaction 
	END
end
update work set Worker_name='julie' where W_ID=100
insert into work values(108,'Lisa')
delete from work where W_ID=106
select * from work

disable trigger trg_work on work

--4. Server-scope trigger to restrict DDL access

create trigger trg_scope
on database
for create_table,alter_table,drop_table
as
begin
	print 'you cannot perform ddl on TE'
	ROLLBACK transaction
end

create table demo(
id int);
drop table demo

disable trigger trg_scope on Database

create trigger trg_server
on ALL Server
for create_table,alter_table,drop_table
as
begin
	print 'you cannot perform ddl on any database'
	rollback transaction
end

use Training
create table demo5(
id int);

--5. Working of explicit transaction with Save transaction

begin transaction
	insert into work values(110,'samy');
	save transaction insert_value
	delete from work where W_ID=108;
	rollback transaction insert_value
commit transaction

select * from work

--6. Difference between throw and Raiserror in exception handling
alter procedure sp_dividebyZero
@num1 int,
@num2 int
as
begin
	Declare @res int
	set @res=0
	if(@num2=0)
	begin	
		RAISERROR('CANNOT DIVIDE BY 0',16,127)
	END 
	ELSE
	BEGIN
		set @res=@num1/@num2
		print cast(@res as varchar)
	end
end
exec sp_dividebyZero 3,0
exec sp_dividebyZero 9,3

alter procedure sp_dividebyZero_throw
@num1 int,
@num2 int
as
begin
	Declare @res int
	set @res=0
	begin try
	begin
		if(@num2=0)
		THROW 2020,'CANNOT DIVIDE BY 0',1
		set @res=@num1/@num2
		print 'result: '+ cast(@res as varchar)
	END 
	end try
	BEGIN catch
		print error_message()
		print error_number()
		print error_state()
	end catch
end
exec sp_dividebyZero_throw 3,0
exec sp_dividebyZero_throw 9,3


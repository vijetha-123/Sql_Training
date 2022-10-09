use org

CREATE TABLE Bonus (
WORKER_REF_ID INT,
BONUS_AMOUNT INT,
BONUS_DATE DATETIME,
FOREIGN KEY (WORKER_REF_ID)
REFERENCES Worker(WORKER_ID)

ON DELETE CASCADE
);
INSERT INTO Bonus VALUES(001, 5000,'2016-02-20'),
(002, 3000, '2016-06-11'),
(003, 4000, '2016-02-20'),
(001, 4500, '2016-02-20'),
(002, 3500, '2016-06-11');

CREATE TABLE Title (
WORKER_REF_ID INT,
WORKER_TITLE VARCHAR(25),AFFECTED_FROM DATETIME,
FOREIGN KEY (WORKER_REF_ID)
REFERENCES Worker(WORKER_ID)

ON DELETE CASCADE
);

INSERT INTO Title VALUES
(001, 'Manager', '2016-02-20 00:00:00'),
(002, 'Executive', '2016-06-11 00:00:00'),
(008, 'Executive', '2016-06-11 00:00:00'),
(005, 'Manager', '2016-06-11 00:00:00'),
(004, 'Asst. Manager', '2016-06-11 00:00:00'),
(007, 'Executive', '2016-06-11 00:00:00'),
(006, 'Lead', '2016-06-11 00:00:00'),
(003, 'Lead', '2016-06-11 00:00:00');
--- Show the working of the following concepts:
--1. Synonyms
--2. Index
--3. Simple and Complex Views
--4. Sequence

select * from Worker
select * from Bonus
select * from Title

--1.synonyms

create synonym Wrkr for Worker

select * from Wrkr
select * from Worker

--2.simple and complex views
--1.Simple View
select * from Worker

create view Wrkr_View
as
select * from Worker where department='Admin'

--Retrieve the view
select * from Wrkr_View

--insert into a simple view 
insert into Wrkr_View values(7,'Mike','fernandes',70000,'2014-07-22 09:00:00','Admin')

--update in a simple view
update Wrkr_View set salary=85000 where worker_id=2

--delete in a simple view
delete from Wrkr_View where worker_id=4

--2. Complex View
create view worker_bonus
as
select w.worker_id,w.first_name,w.salary
from Worker as w inner join Bonus AS B on W.worker_id=B.WORKER_REF_ID

select * from worker_bonus
--insert in a complex view//not possible 
insert into worker_bonus values(4,'Sammy',10000)

--update in a complex view
update worker_bonus set first_name='shri' where worker_id=1

--delete in a complex view//not possible
delete from worker_bonus where worker_id=3

--indexes

create clustered index ind_workerID on Title(WORKER_REF_ID)

--create a non clustered index on demo table
create index ind_workertitle on Title(WORKER_TITLE)

select * from Title

--SEQUENCE
create table work(W_ID INT,Worker_name varchar(20));

create sequence W_ID as int start with 100 increment by 2

insert into Work values(NEXT VALUE FOR W_ID,'John')
insert into work values(NEXT VALUE FOR W_ID,'Sam')
insert into work values(NEXT VALUE FOR W_ID,'Paul')
insert into work values(NEXT VALUE FOR W_ID,'James')

select * from work

--String functions:
SELECT CHAR('67');--Ascii value of C
SELECT LEN('WORKER');--LENGTH oF String
SELECT LEFT('worker_bonus', 3);--first 3 letters
SELECT Lower('WORKER');--lowercase
SELECT upper('worker');--uppercase
SELECT Str(4.4);--roundoff
SELECT right('worker_bonus',3);--first 3 letters
select space(4);

--math function
select sqrt(100)
select pi()
select square(1.12)
select Round(12.421,2);
SELECT CEILING(23.44);
select floor(23.44);

select CURRENT_timestamp;
SELECT GETDATE();
SELECT DAY('20221010');
SELECT month('20221010');
SELECT year('20221010');
SELECT eomonth('20221010');
select DATEADD(day,1,'2021-01-01')
SELECT DATEDIFF(DAY,'2021-01-01','2021-02-01')
SELECT ISDATE('20210101')
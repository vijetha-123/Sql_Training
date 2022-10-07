--subqyery
--query within a query-nested query
--select,insert,update,delete
--outer query(main)-inner query(nested)-32levels

use Training
select * from Employee

--where clause-subquery

--single table
select Eid,Ename,Eage from Employee where Eage in(select Distinct Eage from Employee where Eage<26)


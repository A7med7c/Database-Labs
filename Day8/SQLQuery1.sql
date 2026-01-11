--1.	
create view StudentGradeOverFiftyView
as
select CONCAT(S.St_Fname ,' ' , S.St_Lname) as FullName ,C.Crs_Name 
from Student S join Stud_Course SC 
on S.St_Id = SC.St_Id join Course C 
on C.Crs_Id = SC.Crs_Id and SC.Grade > 50
with check option

select * from StudentGradeOverFiftyView

--2.	 

create view ManagerNamesandThereTopicsView
with encryption 
as
select I.Ins_Name as ManagerName , t.Top_Name as TopicName
from Instructor I join Department D
on I.Ins_Id = D.Dept_Manager join Ins_Course ic 
on I.Ins_Id = ic.Ins_Id join Course C 
on C.Crs_Id = ic.Crs_Id join Topic t
on t.Top_Id = C.Top_Id


select * from ManagerNamesandThereTopicsView

sp_helptext ManagerNamesandThereTopicsView


---3
create view InstructorNameInSDandJavaView
as
select I.Ins_Name, D.Dept_Name
from Department D join Instructor I
on D.Dept_Id = I.Dept_Id and D.Dept_Name in ('SD','Java')

select * from InstructorNameInSDandJavaView

--4

create view StudentFromAlexCairo
with encryption
as
select * 
from  Student 
where St_Address in ('Alex','Cairo')
with check option

Update StudentFromAlexCairo set st_address= 'tanta'
Where st_address= 'alex' --error


--5.
use SD

create view ProjectandEmployeesView
as
select P.ProjectName , COUNT(E.EmpNo) as EmployeeNumbers
from [Company].[Project] P join [dbo].[Works_on] W
on P.[ProjectNo] = W.[ProjectNo] join [HR].[Employee] E
on E.[EmpNo] = W.[EmpNo]
group by P.ProjectName

select * from ProjectandEmployeesView

--6.

use ITI

create clustered index ix_HireDate
on  Department(Manager_hiredate) -- error

--7.

create unique index ix_unique_age
on student(st_age) -- error

--8.	Using Merge statement between the following two tables [User ID, Transaction Amount]

use SD
create table dailytransaction
(
    userid int primary key,
    transactionamount int
);

create table lasttransaction
(
    userid int primary key,
    transactionamount int
);


insert into dailytransaction values
(1, 1000),
(2, 2000),
(3, 1000);

insert into lasttransaction values
(1, 4000),
(4, 2000),
(2, 10000);


merge into dailytransaction as t
using lasttransaction as s
on t.userid = s.userid

when matched then
    update
        set t.transactionamount = s.transactionamount

when not matched by target then
    insert (userid, transactionamount)
    values (s.userid, s.transactionamount)

when not matched by source then
    delete;

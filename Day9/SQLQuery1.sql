--1.	

create proc NumberOFStudents 
as 
select d.Dept_Name ,COUNT(S.St_id) as Students_Count
from Student s join Department d
on d.Dept_Id = s.Dept_Id
group by  d.Dept_Name

NumberOFStudents



--2.	 


create proc CheckNumberOfStudents
as
declare @n int
select @n =  COUNT(e.EmpNo)
			from Company.Project p join Works_on w 
			on p.ProjectNo = w.ProjectNo join HR.Employee e
			on e.EmpNo = w.EmpNo and p.ProjectNo = 'p1'
 if @n >= 3
        print 'the number of employees in the project p1 is 3 or more';
    else
    begin
        print 'the following employees work for the project p1';

        select e.fname,e.lname
        from company.project p join works_on w 
        on p.projectno = w.projectno join hr.employee e on e.empno = w.empno and p.projectno = 'p1';
    end

CheckNumberOfStudents

--3

create proc CheckEmps ( @oldempno int,@newempno int, @projectno varchar(10))
as
update Works_on
    set EmpNo = @newempno
    where EmpNo = @oldempno and ProjectNo = @projectno

exec CheckEmps 28559,101, 'p2';


--4.	ProjectNo 	UserName 	ModifiedDate 	Budget_Old 	Budget_New 

create table history_audit
(
 ProjectNo varchar(10),
 UserName varchar(100),
 ModifiedDate date,
 Budget_Old int,
 Budget_New int
)

create trigger tr_4
on [Company].[Project]
after update
as
	if update(Budget)
		begin
			declare @old int,@new int,@pno varchar(10)
				select @old = Budget from deleted
				select @new = Budget from inserted
				select @pno = ProjectNo from inserted
			insert into history_audit(projectno,username,modifieddate,budget_old,budget_new)
			values(@pno,SUSER_NAME(),getdate(),@old,@new)
		end
update company.project
set budget = 200000
where projectno = 'p2';


--5.	

create trigger tr_3
on [Company].[Department]
instead of insert 
as
select 'can’t insert a new record in department table'
   
--6.	

create trigger tr_5
on HR.Employee
instead of insert
as
	if FORMAT(getdate(),'MMMM')='march'
		select 'insertion not allowed in march'
	else
		insert into HR.Employee
		select * from inserted

--7.
	
create table student_audit
(
    server_username varchar(100),
    audit_date datetime,
    note varchar(300)
);

create trigger tr_8
on Student
after insert 
as 
insert into student_audit (server_username,audit_date,note)
select SUSER_NAME() , GETDATE(),suser_name() + ' Insert New Row with Key=' 
        + cast(i.st_id as varchar(20)) 
        + ' in table student'
    from inserted i

-- 8.	

create trigger tr_9
on Student
instead of delete 
as 
insert into student_audit (server_username,audit_date,note)
select SUSER_NAME() , GETDATE(),suser_name() + ' try to delete Row with Key' 
        + cast(d.st_id as varchar(20)) 
    from deleted d
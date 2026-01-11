
--1 

create view v_clerk
as 
select E.EmpNo , P.ProjectNo, W.Enter_Date
from [HR].[Employee] E join [dbo].[Works_on] W 
on E.EmpNo = W.EmpNo join [Company].[Project] P
on P.ProjectNo = W.ProjectNo and W.Job = 'Clerk'

select * from v_clerk

--2)

create view v_without_budget
as
select ProjectNo, ProjectName
from [Company].[Project]
where budget is null

select * from v_without_budget

-- 3)	 

create view v_count 
as
select P.ProjectName ,COUNT(W.job) as Jobs
from [Company].[Project] P join Works_on W
on P.ProjectNo = W.ProjectNo
group by P.ProjectName 

select * from v_count

--4)	 
create view v_project_p2
as
select v.empno
from v_clerk v
where v.projectno = 'p2'

select * from v_project_p2


--5)	

alter  view v_without_budget
as
select *
from [Company].[Project] P
where P.ProjectNo in ('p1', 'p2')

select * from v_without_budget

-- 6)	

drop view v_clerk
drop view v_count

-- 7)	

create view EmpsView
as 
select e.LName ,COUNT(e.EmpNo) as Emps
from [Company].[Department] d join [HR].[Employee] e
on d.DeptNo = e.DeptNo and d.DeptNo = 'd2'
group by e.LName

select * from EmpsView


--8)	

select lname from EmpsView
where lname like '%j%'

-- 9)

create view v_dept
as
select DeptNo , DeptName
from [Company].[Department]

select * from v_dept;


--10)	using the previous view try enter new department data where dept# is ’d4’ and dept name is ‘Development’

insert into v_dept
values('d4','Development')


--11)	

create view v_2006_check
as
select e.empno , p.projectno, w.enter_date
from [hr].[employee] e join [dbo].[works_on] w
on e.empno = w.empno join [company].[project] p
on p.projectno = w.projectno
where w.enter_date between '2006-01-01' and '2006-12-31'
with check option

select * from v_2006_check
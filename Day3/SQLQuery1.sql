--1.	Display the Department id, name and id and the name of its manager.

select Dnum, Dname,MGRSSN,fname
from Departments d inner join Employee e
on e.SSN = d.MGRSSN

--2.	Display the name of the departments and the name of the projects under its control.
select Dname,Pname 
from Departments d inner join Project p
on d.Dnum = p.Dnum

--3.Display the full data about all the dependence associated with the name of the employee they depend on him/her.
select e.Fname,  d.*
from Employee e inner join Dependent d
on e.SSN = d.ESSN

--4.	Display the Id, name and location of the projects in Cairo or Alex city.


select Pnumber ,Pname ,Plocation
from Project
where City in ('alex','cairo')

--5.	Display the Projects full data of the projects with a name starts with "a" letter.
select * from Project
where Pname like 'a%'

--6.	display all the employees in department 30 whose salary from 1000 to 2000 LE monthly
select e.*  
from Employee e inner join Departments d
on d.Dnum = e.Dno and e.Dno =30 and e.Salary  between 1000 and 2000
 
 --7.Retrieve the names of all employees in department 10 who works more than or equal10 hours per week on 
 --"AL Rabwah" project.

select concat([Fname],' ', [Lname]) EmployeeName
from [dbo].[Employee] E inner join [dbo].[Works_for] W
on E.SSN = W.ESSn inner join [dbo].[Project] P 
on P.Pnumber = W.Pno
where [Dno] = 10 and [Hours] = 10 and [Pname] = 'AL Rabwah'

--8.	Find the names of the employees who directly supervised with Kamel Mohamed.
select concat(e.[Fname],' ', e.[Lname]) EmployeeName
from Employee e inner join Employee Super
on super.SSN = e.Superssn
and super.Fname = 'Kamel' and super.Lname = 'mohamed'

--9.Retrieve the names of all employees and the names of the projects they are working on, sorted by the project name.

select concat([Fname],' ', [Lname]) EmployeeName , [Pname]
from [dbo].[Employee] e inner join [dbo].[Works_for] W
on e.SSN = W.ESSn inner join [dbo].[Project] P
on P.Pnumber = W.Pno
order by [Pname]

--10.	For each project located in Cairo City , find the project number, the controlling department name 
--,the department manager last name ,address and birthdate.

select [Pnumber],[Dname],[Lname],[Address],[Bdate]
from Departments d inner join Project p
on d.Dnum = p.Dnum
inner join Employee e
on e.SSN = d.MGRSSN and p.City = 'cairo'

--11.	Display All Data of the managers
select * 
from Employee e inner join Departments d 
on e.SSN = d.MGRSSN

--12.Display All Employees data and the data of their dependents even if they have no dependents
select e.*,d.*
from Employee e left outer join Dependent d
on e.SSN = d.ESSN

---13.Insert your personal data to the employee table as a new employee in department
--number 30, SSN = 102672, Superssn = 112233, salary=3000.

insert into Employee(Dno, SSN, Superssn,Salary )
values (30,102672, 112233,3000)

--14.	Insert another employee with personal data your friend as new employee in department
--number 30, SSN = 102660, but don’t enter any value for salary or supervisor number to him.

insert into Employee(Dno, SSN)
values (30,102660)

--15.	Upgrade your salary by 20 % of its last value.
update Employee
set Salary  = Salary*1.2
where SSN = 102672
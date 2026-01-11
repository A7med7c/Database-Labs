--1.

select d.Dependent_name, d.Sex 
from Dependent d inner join Employee e
on e.SSN = d.ESSN  and e.Sex = 'f' and d.Sex = 'f'
union all
select d.Dependent_name, d.Sex 
from Dependent d inner join Employee e
on e.SSN = d.ESSN  and e.Sex = 'm' and d.Sex = 'm'

--2

select p.Pname , sum(w.Hours) as total
from Project p join Works_for w
on p.Pnumber = w.Pno
group by p.Pname

-- 3.
select d.*
from Departments d join Employee e
on d.Dnum = e.Dno 
where e.SSN = (
select min(SSN)
from Employee)

--4.

select d.Dnum , max(e.Salary) as MaxSalary , min(e.Salary) as MinSalary,AVG(ISNULL( e.Salary,0)) as averageSalary
from Departments d join Employee e
on d.Dnum = e.Dno
group by (d.Dnum)

--5.	List the full name of all managers who have no dependents.



SELECT Concat(e.Fname , ' ' ,e.Lname) AS fullname
FROM Employee e
JOIN Departments d ON e.SSN = d.MGRSSN       
LEFT JOIN Dependent de ON e.SSN = de.ESSN   
WHERE de.ESSN IS NULL;



SELECT e.Fname + ' ' + e.Lname AS fullname
FROM Employee e
JOIN Departments d ON e.SSN = d.MGRSSN       
LEFT JOIN Dependent de ON e.SSN = de.ESSN   
WHERE de.ESSN IS NULL;

--6.	
select d.Dnum , d.Dname, COUNT(e.Dno) as emp_count 
from Departments d join Employee e
on d.Dnum = e.Dno
group by d.Dnum,d.Dname
having AVG(ISNULL( e.Salary,0)) < (select AVG(ISNULL( salary,0)) from Employee)

--7

select e.Fname,e.Lname , p.Pname,d.Dname
from Departments d join Employee e on d.Dnum = e.Dno 
	join Works_for w on e.SSN = w.ESSn 
	join Project p  on p.Pnumber = w.Pno
ORDER BY 
    D.Dname,
    E.Fname,
    E.lname;
---8.	

select distinct salary 
from employee where salary in (
select max( salary) 
from employee 
union
select max( salary) 
from employee 
where Salary<(select max(salary) from Employee)
)
order by Salary desc

--9.

select concat( [Fname] ,' ', [Lname]) FullName
from Employee 
Intersect  
select [Dependent_name] 
from Dependent

--10.	

SELECT e.SSN, e.Fname
FROM Employee e
WHERE EXISTS (
    SELECT d.ESSN  
    FROM Dependent d
    WHERE d.ESSN = e.SSN
)

/*11.	In the department table insert new department called "DEPT IT" , with id 100, employee with SSN = 112233 as a manager
for this department. The start date for this manager is '1-11-2006'*/
insert into [dbo].[Departments](Dname, Dnum, MGRSSN, [MGRStart Date])
values 
('DEPT IT',100,112233,'1-11-2006')

/*12.
*/
update Departments
	set MGRSSN = 968574
	where Dnum = 100

update Departments
	set MGRSSN = 102672
	where Dnum = 20

update Employee 
	set Superssn = 102672
	where SSN = 102660

/*13.	Unfortunately the company ended the contract with Mr. Kamel Mohamed (SSN=223344) 
so try to delete his data from your database in case you know that you will be temporarily in his position.*/

 UPDATE Departments
SET MGRSSN = 102672
   where  MGRSSN = 223344 

UPDATE Employee
SET Superssn =  102672
where Superssn = 223344

DELETE FROM Works_for WHERE ESSn = 223344;
DELETE FROM Employee WHERE SSN = 223344;

--14.	Try to update all salaries of employees who work in Project ‘Al Rabwah’ by 30%
	update E
set E.salary =  E.Salary * 1.3
from Employee E inner join Works_for W on E.SSN = W.ESSn
inner join Project P on P.Pnumber = W.Pno
where P.Pname = 'Al Rabwah'

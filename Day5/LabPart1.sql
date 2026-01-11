--1.	
select count(St_Age)
from Student 
where St_Age is not null

--2.	
select distinct Ins_Name
from Instructor

--3
select s.St_Id, CONCAT( ISNULL(s.St_Fname,' '),' ' , ISNULL(s.St_Fname,' ')),d.Dept_Name
from Student s join Department d
on d.Dept_Id = s.Dept_Id

--4.	
select i.Ins_Name , d.Dept_Name
from Instructor i left join  Department d
on d.Dept_Id = i.Dept_Id

--5.	
select CONCAT( ISNULL(s.St_Fname,' '),' ' , ISNULL(s.St_Fname,' ')) as fullName , c.Crs_Name
from Student s join Stud_Course sc
on s.St_Id = sc.St_Id join Course c
on c.Crs_Id = sc.Crs_Id
where Grade is not null

--6.	
select count(c.crs_id) NumoCrs ,t.Top_Name
from Course c join Topic t 
on t.Top_Id = c.Top_Id 
group by Top_Name
 
--7.	
select MAX(salary) as maximum, min(salary) as minimum
from Instructor

--8.	
select Ins_Name from instructor
where salary < (select avg(ISNULL( salary,0)) from Instructor)

--9.	
select  d.Dept_Name 
from Instructor i join Department d
on d.Dept_Id  = i.Dept_Id
where i.Salary = (select MIN(salary) from instructor)

--10.	
select top(2) * from Instructor 
order by salary desc

--11. 
select Ins_Name , COALESCE(CAST(Salary AS VARCHAR(20)), 'bonus')
from Instructor

--12.	
select AVG(isnull(salary,0)) 
from Instructor

--13.	
select s.St_Fname , super.St_Id,super.St_Fname,super.St_Lname
from Student s join Student super
on super.St_Id = s.St_super

--14.
select *from (
        select *,ROW_NUMBER() OVER (PARTITION BY dept_id ORDER BY Salary DESC) AS RN
        from Instructor where Salary IS NOT NULL
     ) AS newtab
WHERE RN <= 2;

--15.	 
select *from (
        select *,ROW_NUMBER() OVER ( PARTITION BY dept_id ORDER BY NEWID()) AS RN
        from Student
     ) AS newtab
WHERE RN = 1;
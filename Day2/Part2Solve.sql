--1.
select * from employee
--2
select Fname , Lname , Salary , Dno from employee;
--3
select Pname, Plocation, Dnum from Project;
--4
select Fname+' '+Lname as [Full Name] ,[ANNUAL COMM]= 1.2* Salary from employee;
--5
select SSN,name = Fname + Lname from employee where salary > 1000;
--6.
select SSN,name = Fname + ' '+ Lname, annusal = salary * 12 from employee where salary*12 > 10000;
--7.
select name = Fname + ' ' + Lname , salary from employee where sex = 'f';
--8.
select dnum , dname from Departments where MGRSSN = 968574;
--9.
select pnumber , pname , plocation from Project where dnum = 10;
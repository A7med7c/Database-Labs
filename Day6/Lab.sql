	sp_addtype loc,'nchar(2)'

	create rule r1 as @lo in ('NY', 'DS', 'KW');

	create default loc_def as 'NY'

	sp_bindrule r1,loc

	sp_bindefault loc_def,loc

	create table Department
	(
	DeptNo int primary key,
	DeptName varchar(10),
	Location loc
	)

	insert into Department values
	(1, 'Research', 'NY'),
	(2, 'Accounting', 'DS'),
	(3, 'Markiting', 'KW');


	create table Employee
	(
	EmpNo int,
	Emp_Fname varchar(20) not null, 
	Emp_Lname varchar(20) not null,
	Dept_No int,
	Salary int,
	constraint c1 primary key(EmpNo),
	constraint c2 unique(Salary),
	constraint c8 foreign key(Dept_No) 
		references Department(DeptNo)
	) 

	create rule r2 as @sal<6000
	sp_bindrule r2, 'Employee.Salary';

	INSERT INTO Employee VALUES
	(25348, 'Mathew', 'Smith', 3, 2500),
	(10102, 'Ann',    'Jones', 3, 3000),
	(18316, 'John',   'Barrimore', 1, 2400);


	INSERT INTO Works_on (EmpNo, ProjectNo, Job, Enter_Date) 
	VALUES (11111, 1, 'Analyst', '2024-01-01');


	update Works_on set  EmpNo =11111
		where EmpNo = 10102


	update Employee set EmpNo = 22222
		where EmpNo = 10102


	delete  from Employee
		where EmpNo = 10102


	alter table Employee 
		add TelephoneNumber varchar(15) 
	

	alter table Employee
		drop column TelephoneNumber
	


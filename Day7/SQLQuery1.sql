
create function GetMonthName(@date date)
returns varchar(15)
begin 
	declare @monthName varchar(15)
	set @monthName =  DATENAME(MONTH, @date)
	return @monthName
end

select dbo.GetMonthName('1-1-2022')

--------------------------------------------------------------------------------------------------------

create function GetRangeNumber(@numone int ,@numtwo int )
returns @t table
		(
		numbers int
		)
as 
begin 
	declare @x int 
	set @x = @numone
	while @x < @numtwo
		begin
			insert into @t values(@x)
			set @x = @x + 1
		end
return
end


select * from GetRangeNumber(1,6)

--------------------------------------------------------------------------------------------------------

create function GetStudentandDeptName(@StdNo int)
returns table
as
return(
	select D.Dept_Name + ' ' + S.St_Fname + ' ' + S.St_Lname AS Result
    from Department D
    join Student S
        on D.Dept_Id = S.Dept_Id and S.St_Id = @StdNo
)

select * from GetStudentandDeptName(10)

--------------------------------------------------------------------------------------------------------

create function Info(@StdId int)
returns varchar(50)
begin
	declare @firstname varchar(25)
	declare @msg varchar(50)
	declare @secondname varchar(25)

	select @firstname = St_Fname ,@secondname = St_Lname from Student where St_Id = @StdId 

		if @firstname is null and @secondname is null 
			 set @msg = 'First name & last name are null' 
		else if  @firstname is null 
			 set @msg = 'First name is null' 
		else if @secondname is null 
			set @msg = 'last name is null'
		else
			set @msg = 'First name & last name are not null'
	return @msg
end

select dbo.Info(4445)
select dbo.Info(1)

--------------------------------------------------------------------------------------------------------

create function GetDepartmentInfo(@mngrId int)
returns table 
as 
return
(
	select D.Dept_Name , I.Ins_Name , D.Manager_hiredate
	from Instructor I join Department D
	on I.Ins_Id = D.Dept_Manager and D.Dept_Manager = @mngrId
)

select * from GetDepartmentInfo(1)

--------------------------------------------------------------------------------------------------------

create function NameInfo(@str varchar(20))
returns  @t table
(
    StudentName VARCHAR(100)
)
as
begin
	if @str = 'first name'
	begin 
		insert into @t select ISNULL(St_Fname,'  ') from Student
	end
	
	else if @str = 'last name'
	begin 
		insert into @t select ISNULL(St_Lname,'  ') from Student
	end

	if @str = 'full name'
	begin 
		insert into @t select ISNULL(St_Fname, '') + ' ' + ISNULL(St_Lname, '') from Student
	end
return
end


select * from NameInfo('full name')

--------------------------------------------------------------------------------------------------------

select St_Id ,SUBSTRING(St_Fname,1,len(St_Fname)-1) as FName
from Student

--------------------------------------------------------------------------------------------------------

delete  SC
from Student S join  Stud_Course SC 
on S.St_Id = SC.St_Id join Department D
on D.Dept_Id = S.Dept_Id and D.Dept_Location = 'SD'

--------------------------------------------------------------------------------------------------------

create table DepartmentH
(
    DeptID int primary key,
    DeptName varchar(50),
    Node hierarchyid
)
insert into DepartmentH (DeptID, DeptName, Node)
values 
(1, 'Corporate Headquarters', '/'),           
(2, 'Sales', '/1/'),                          
(3, 'Marketing', '/2/'),                     
(4, 'North American Sales', '/1/1/')

--------------------------------------------------------------------------------------------------------

declare @Counter int = 3000;
declare @MaxId int = 6000;

while @Counter < @MaxId
begin
    insert into Student (St_Id, St_Fname, St_Lname)
    values (@Counter, 'Jane', 'Smith');
    
    set @Counter = @Counter + 1;
end
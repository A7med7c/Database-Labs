alter schema Company 
	transfer [dbo].[Department]

alter schema Company 
	transfer [dbo].[Project]

alter schema [Human Resource ]
	transfer [dbo].[Employee]


SELECT 
    CONSTRAINT_NAME, 
    CONSTRAINT_TYPE, 
    TABLE_NAME
FROM 
    INFORMATION_SCHEMA.TABLE_CONSTRAINTS
WHERE 
    TABLE_NAME = 'Employee';




create Synonym emp for [Human Resource ].[Employee]

Select * from Employee -- error
Select * from [Human Resource].Employee --no error 
Select * from Emp -- no error 
Select * from [Human Resource].Emp -- error

    
    update  p set p.Budget = p.Budget * 1.1
        from [Company].[Project] p
        inner join [dbo].[Works_on] w on p.ProjectNo = w.ProjectNo
        where w.EmpNo= 10102  and w.job  = 'Manager'

update D set D.DeptName = 'Sales'
    from [Human Resource ].[Employee] E join [Company].[Department] D
        on D.DeptNo = E.Dept_No 
        where E.Emp_Fname = 'James';

    
update W set [Enter_Date]  = '12-12-2007'
from dbo.Works_on W join [Human Resource].Employee E
    on E.EmpNo = W.EmpNo join [Company].Department D
    on D.DeptNo = E.Dept_No
where W.ProjectNo = 1
  and D.DeptName = 'Sales';



 delete W
 from [dbo].[Works_on] W join  [Human Resource ].[Employee] E
 on E.[EmpNo] = W.[EmpNo] join [Company].[Department] D
 on D.[DeptNo] = E.[Dept_No] and D.[Location] = 'KW'


 -- Generic syntax
 -- Created by GitHub Copilot in SSMS - review carefully before executing
-- Add FK constraint referencing Company.Department (correct schema)
ALTER TABLE [Human Resource].Employee
ADD CONSTRAINT FK_Employee_Department 
FOREIGN KEY (Dept_No) REFERENCES [Company].Department(DeptNo);
--1

select [SalesOrderID],[ShipDate]
from [Sales].[SalesOrderHeader]
where [ShipDate] between '7/28/2002' and '7/29/2014'

--2
select ProductID,Name
from [Production].[Product]
where StandardCost < 110

--3.	Display ProductID, Name if its weight is unknown

select ProductID,Name
from [Production].[Product]
where Weight is null

--4.

select ProductID,Name,Color
from [Production].[Product]
where Color in('Silver', 'Black', 'Red' )

--5.	 Display any Product with a Name starting with the letter B

select ProductID,Name
from [Production].[Product]
where Name like 'B%'

--6

UPDATE Production.ProductDescription
SET Description = 'Chromoly steel_High of defects'
WHERE ProductDescriptionID = 3

select *
from [Production].[ProductDescription]
where [Description] like '%[_]%'

--7.

select sum(TotalDue) as totalduesum ,OrderDate
from  Sales.SalesOrderHeader
where OrderDate between '7/28/2002' and '7/29/2014'
group by OrderDate 

--8.

select distinct HireDate 
from  [HumanResources].[Employee]

--9
select AVG(distinct ListPrice) AS AvgUniqueListPrice
from [Production].[Product]


--10.

select Concat('The ',name, ' is only! ',ListPrice)
from [Production].[Product]
where ListPrice between 100 and 120
order by ListPrice

--11
--a-
select rowguid ,Name, SalesPersonID, Demographics 
into dbo.store_Archive
from Sales.Store 

select rowguid ,Name, SalesPersonID, Demographics 
into dbo.store_Archive
from Sales.Store 
where 1 = 0

--12.	
SELECT FORMAT(GETDATE(), 'dd, MMMM, yyyy')
UNION
SELECT FORMAT(GETDATE(), 'MM,dd, yyyy')
UNION
SELECT FORMAT(GETDATE(), 'yyyy-MM-dd HH:mm:ss');


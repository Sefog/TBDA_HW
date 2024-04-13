USE NORTHWND
GO

--Q1

INSERT INTO Customers 
VALUES ('Value1' , 'Value 2')

--Q2

Select *
from Employees
Where EmployeeID = 4

UPDATE Employees
set HireDate = '1993-04-07'
Where EmployeeID = 4

--Q3

Select *
from Products
where ProductID = 58


UPDATE Products
set ProductName = 'Black Bush', CategoryID = 1
where ProductID = 58




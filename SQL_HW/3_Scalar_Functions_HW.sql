USE NORTHWND
GO

--Q1

SELECT CompanyName , 
		CHARINDEX('t' , CompanyName) AS T_CompanyName
FROM Customers
WHERE CHARINDEX('t' , CompanyName) = 0

--Q2

SELECT LOWER (LastName) as LastName , 
		UPPER (FirstName) as FirstName
FROM Employees
WHERE EmployeeID BETWEEN 2 AND 4

--Q3

SELECT OrderID , 
		DATEDIFF (YYYY, OrderDate , 
		GETDATE()) AS AgeOfOrder
FROM Orders

--Q4

SELECT OrderID, 
		DATENAME(dw, OrderDate) AS DayOfOrder , 
		YEAR(OrderDate) AS YearOfOrder
FROM Orders

--Q5

SELECT CategoryName , Description , CHARINDEX('e' , Description , 3) AS E_Position
FROM Categories
--WHERE CHARINDEX('e' , Description , 3) =  3

--Q6

SELECT FirstName , LastName , 
		LEFT(FirstName, 2) + LEFT(LastName, 2) AS UserName
FROM Employees

--Q7

SELECT ProductID , ProductName , 
		REPLACE(ProductName, '/' , '-') As ProductNameReplaced
FROM Products

--Q8

SELECT GETDATE() AS CurrentDateTime

--Q9

SELECT CustomerID , OrderID , OrderDate , OrderDate + 60 AS LastDayShip
FROM Orders



SELECT CustomerID , OrderID , OrderDate , DateAdd(dd,60,OrderDate) AS LastDayShip
FROM Orders

--Q10

SELECT CompanyName + CAST(LEN(CompanyName) AS nvarchar (100)) AS CompanyNameLength , City + CAST(LEN(City) AS nvarchar (100)) AS CityNameLength
FROM Customers


--Q11

SELECT ProductID , 
		CAST(ROUND(UnitPrice*1.14 , 0) AS int) AS RoundedInt
FROM Products

SELECT ProductID , 
		convert(int, round(UnitPrice*1.14 , 0)) AS RoundedInt
FROM Products


--Q12

SELECT CAST(CONCAT(EmployeeId ,' ' , LastName) AS nvarchar (100)) AS IdLastName , 
		CAST(CONCAT(EmployeeId ,' ' , LastName,' ',BirthDate) AS nvarchar (100)) AS IdLastNameBD
FROM Employees

--Q13

SELECT UPPER (LastName) AS UpLN , CONVERT(varchar, BirthDate , 103) AS ConBD 
FROM Employees
WHERE FirstName LIKE 'a%' OR FirstName like 'b'

SELECT UPPER (LastName) AS UpLN , CONVERT(nvarchar(20), BirthDate , 3) AS ConBD 
FROM Employees
WHERE FirstName LIKE 'a%' OR FirstName like 'b'

--Q14

SELECT ProductName +'-'+ CONVERT(varchar, SupplierID) AS ProductSupplier , ROUND(UnitPrice+10.54, 0)
FROM Products
WHERE UnitPrice > 30

--Q15

SELECT CASE
	WHEN ReportsTo IS NULL THEN 'CEO' 
	END AS WhoCEO ,
	CONVERT(varchar, BirthDate , 110) AS ConBD ,
	CAST(CONCAT(LastName,' ',HireDate) AS nvarchar (100)) AS LastNameHireDate 
FROM Employees
WHERE LEN(LastName) > LEN(FirstName)


--Q16

SELECT LastName , LEFT(LastName,3) AS LastName3
FROM Employees
WHERE LastName NOT LIKE '%n%'

--Q17

SELECT LastName , REVERSE(LastName) AS LNR
FROM Employees
WHERE ReportsTo IS NOT NULL

--Q18

SELECT OrderID , OrderDate , RequiredDate 
FROM Orders
WHERE DATEDIFF(MONTH, OrderDate , RequiredDate) = 3




























































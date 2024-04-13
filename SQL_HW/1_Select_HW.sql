USE NORTHWND
GO

--Q1

SELECT CustomerID ,CompanyName, City
FROM Customers

--Q2

SELECT *
FROM [Order Details]

--Q3

SELECT *
FROM Customers

--Q4

SELECT Region , HireDate , FirstName, Country
FROM Employees

--Q5

SELECT EmployeeID, City + ' ' + Address AS FullAddress
FROM Employees

--Q6

SELECT LastName + ' ' + FirstName AS FullName , HireDate + 6 AS HireDate_6 , City AS EmployeeCity
FROM Employees

--Q7

SELECT ProductID AS Prdid , ProductName AS PrdName , UnitPrice AS UP
FROM Products

--Q8

SELECT [Address] , City , Region
FROM Employees

--Q9

SELECT DISTINCT Country , City
FROM Employees

--Q10

SELECT DISTINCT Country
FROM Employees

--Q11

SELECT DISTINCT Title
FROM Employees


--Q12

SELECT ProductID, ProductName, (UnitsInStock - UnitsOnOrder) * UnitPrice AS Costs_of_Unordered  
FROM Products

--Q13

SELECT FirstName , BirthDate , BirthDate + 7 AS BD_7
FROM Employees

--Q14

SELECT ProductName , UnitPrice , UnitPrice + 9 AS UP_9
FROM Products

--Q15

SELECT ProductID , ProductName, UnitPrice , UnitPrice + (UnitPrice * 20 / 100) AS UP_20P , UnitsInStock , UnitsOnOrder , UnitsInStock - UnitsOnOrder AS Diff_Orders_Stock
FROM Products



































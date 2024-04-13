USE NORTHWND
GO

--Q1

SELECT CompanyName , Country
FROM Customers
WHERE CustomerID = 'ALFKI'

--Q2

SELECT CustomerID , Country + ' ' + City + ' ' + Address AS fullAddress, ContactName
FROM Customers
WHERE City = 'Berlin'

--Q3

SELECT ProductName , UnitPrice
FROM Products
WHERE ProductID = '6'

--Q4

SELECT ProductID , ProductName , UnitPrice
FROM Products
WHERE UnitPrice > 16
ORDER BY UnitPrice ASC

--Q5

SELECT FirstName + ' ' + LastName AS FullName , BirthDate , ReportsTo 
FROM Employees
WHERE EmployeeID = '7'

--Q6

SELECT OrderID , Freight
FROM Orders
WHERE Freight BETWEEN 33.45 AND 65.8
ORDER BY Freight DESC

--Q7 

SELECT *
FROM Products
WHERE UnitPrice NOT BETWEEN 41 and 92
ORDER BY UnitPrice DESC

--Q8

SELECT OrderID , ShipCity , EmployeeID
FROM Orders
WHERE EmployeeID NOT IN (3, 5, 8)
ORDER BY EmployeeID ASC

--Q9

SELECT EmployeeID , LastName , HireDate 
FROM Employees
WHERE City IN ('Seattle' , 'Kirkland')

--Q10

SELECT EmployeeID , FirstName , LastName
FROM Employees
WHERE EmployeeID IN (3, 4, 6)

--Q11

SELECT FirstName , LastName , BirthDate
FROM Employees
WHERE EmployeeID NOT IN (2, 8)

--Q12

SELECT LastName , City
FROM Employees
WHERE LastName LIKE '%w'

--Q13

SELECT FirstName , Region
FROM Employees
WHERE Region IS NULL

--Q14

SELECT TOP (5) ProductName, UnitPrice
FROM Products 
ORDER BY UnitPrice DESC

--Q15

SELECT OrderID , OrderDate , RequiredDate
FROM Orders
WHERE OrderDate > '1997-11-30'

--Q16

SELECT EmployeeID , LastName , ReportsTo
FROM Employees
WHERE ReportsTo IS NOT NULL
ORDER BY EmployeeID ASC

--Q17

SELECT CategoryName
FROM Categories
WHERE CategoryName LIKE '%E%'


--Q18

SELECT OrderID, EmployeeID , OrderDate , RequiredDate , ShippedDate
FROM Orders
WHERE ShipName = 'QUICK-Stop' AND EmployeeID IN (1 , 2 , 8) AND ShippedDate + 19 < RequiredDate

--Q19

SELECT ProductName , ProductID
FROM Products
WHERE ProductName LIKE '%e_'

--Q20

SELECT OrderID , CustomerID , EmployeeID
FROM Orders
WHERE OrderDate BETWEEN '1996-05-31' AND '1996-08-31'
ORDER BY OrderDate ASC , CustomerID DESC

--Q21

SELECT CustomerID , CompanyName , Country , Phone , Region
FROM Customers
WHERE (Country LIKE 'A%' OR Country LIKE 'B%' OR Country LIKE 'H%') AND Region IS NULL

--Q22

SELECT EmployeeID , FirstName + ' ' + LastName AS FullName , BirthDate , Country
FROM Employees
WHERE LastName LIKE '%t%' OR LastName LIKE '%b%' OR BirthDate LIKE '1967%'

--Q23

SELECT ProductID , ProductName
FROM Products
WHERE UnitsInStock NOT BETWEEN 19 AND 89 AND SupplierID IN (7 , 6) AND UnitPrice > 15









































































































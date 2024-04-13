USE NORTHWND
GO

--Q1

SELECT 
	MAX(customerID)
FROM Customers

--Q2

SELECT 
	MIN(customerID)
FROM Customers

--Q3

SELECT 
	COUNT(*) AS RwCount
FROM Customers

--Q4

SELECT 
	MIN(UnitsInStock) AS SmallestUnitinStock , 
	AVG(UnitsInStock) AS AvgUnitsInStock
FROM products

--Q5

SELECT 
	COUNT(region) 
FROM employees

--OR--

SELECT 
	COUNT(region) 
FROM employees
WHERE Region IS NOT NULL --Not necessary as aggregate functions return not null

--Q6

SELECT 
	AVG(UnitPrice) AS AvgUnitPrice
FROM Products

--Q7

SELECT Shipvia ,
	MAX(Freight) AS MaxFreight , 
	MIN(Freight) AS MinFreight ,
	AVG(Freight) AS AvgFreight
FROM Orders
GROUP BY ShipVia
ORDER BY ShipVia 

--Q8

SELECT 
	CAST(MIN(HireDate) AS nvarchar(114)) AS MinHireDate, 
	CAST(MAX(HireDate) AS nvarchar(114)) AS MaxHireDate
FROM Employees


--Q9

SELECT DISTINCT CustomerID
FROM Customers

--Q10

SELECT DISTINCT CustomerID
FROM Orders


--Q11

SELECT SupplierID , 
	MAX(UnitsInStock) AS MaxStockUnits
FROM Products
WHERE UnitsInStock < 34
GROUP BY SupplierID

--Q12

SELECT SupplierID , 
	MAX(UnitPrice) AS MaxUnitPrice
FROM Products
GROUP BY SupplierID
ORDER BY MaxUnitPrice DESC

--Q13

SELECT SupplierID, 
	AVG(UnitsInStock) AS AvgStockUnits
FROM Products
GROUP BY SupplierID
ORDER BY AvgStockUnits DESC

--Q14

SELECT 
	COUNT(CustomerID) AS CustomerCount , Country , City
FROM Customers
GROUP BY Country , City

--Q15

SELECT DISTINCT CustomerID , 
	COUNT(OrderId) AS OrderAmt 
FROM orders
WHERE OrderDate > '1998' 
GROUP BY CustomerID 
HAVING COUNT(OrderId) > '4' 
ORDER BY CustomerID ASC

--Q16

SELECT COUNT(DISTINCT(CustomerID)) AS CustomerCount, City
FROM Customers
WHERE City = 'Tacoma'
GROUP BY City


--Q17

SELECT CategoryID , SupplierID ,
	MAX(UnitPrice) AS MaxPrice , 
	MIN(UnitPrice) AS MinPrice ,
	AVG(UnitPrice) AS AvgPrice ,
	COUNT(ProductID) AS ProductQuantity
FROM Products
GROUP BY CategoryID , SupplierID

--Q18

SELECT CategoryID , 
	MAX(UnitPrice) AS MaxPrice
FROM Products
GROUP BY CategoryID
HAVING MAX(UnitPrice) > '26'

--Q19

SELECT SupplierID , 
	AVG(UnitPrice) AS AvgPrice
FROM Products
GROUP BY SupplierID
HAVING AVG(UnitPrice) > '33'


--Q20

SELECT C.CategoryName , 
	COUNT(P.UnitsOnOrder) AS NumOrderUnits,
	COUNT(P.UnitsInStock) AS NumStockUnits
FROM Products P
JOIN Categories C ON P.CategoryID = C.CategoryID
WHERE C.CategoryName LIKE '%b%'
GROUP BY c.CategoryName
HAVING COUNT(P.UnitsOnOrder) > 97
ORDER BY C.CategoryName DESC

--Q21

SELECT Region ,  City ,
	COUNT(Region) AS RegionCount ,
	COUNT(City) AS CityCount
FROM Customers
WHERE (City LIKE '%n%' OR City LIKE '%b%') 
	AND Region IS NOT NULL
GROUP BY Region , City
HAVING COUNT(Region) > 3 
	AND COUNT(City) > 3


--Q22

SELECT e.LastName, COUNT(o.OrderID) AS OrderCount , MAX(o.OrderDate) AS LastOrderDate 
FROM Employees e
JOIN Orders o ON e.EmployeeID = o.EmployeeID
GROUP BY e.LastName
HAVING COUNT(o.OrderId) > 54 






























































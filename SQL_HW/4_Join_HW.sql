USE NORTHWND
GO

--Q1

SELECT p.ProductName , p.UnitPrice , c.CategoryName
FROM products p
JOIN categories c ON p.CategoryID = c.CategoryID
WHERE UnitPrice > 32 

--Q2

SELECT p.ProductName , c.CategoryName
FROM products p
JOIN categories c ON p.CategoryID = c.CategoryID
ORDER BY ProductName

--Q3

SELECT p.ProductName , s.CompanyName
FROM Products p
JOIN Suppliers s ON p.SupplierID = s.SupplierID

--Q4

SELECT o.OrderID , c.CompanyName
FROM Orders o
JOIN Customers c ON o.CustomerID = c.CustomerID
WHERE c.CompanyName LIKE 'C%'

--Q5

SELECT r.RegionDescription , t.TerritoryDescription
FROM Region r
JOIN Territories t ON r.RegionID = t.RegionID
ORDER BY RegionDescription , TerritoryDescription 

--Q6

SELECT OD.OrderID , o.OrderDate , p.ProductName
FROM [Order Details] OD
JOIN orders o ON OD.OrderID = o.OrderID
JOIN products p ON OD.ProductID = p.ProductID
WHERE o.OrderDate BETWEEN '1997.01.01' AND '1998.01.01'
ORDER BY OD.OrderID 

--Q7

SELECT p.ProductID , p.UnitPrice , p.SupplierID , c.CategoryName
FROM Products p
JOIN Categories c ON p.CategoryID = c.CategoryID
WHERE p.SupplierID = '22'


--Q8

SELECT p.ProductName , p.UnitPrice , p.SupplierID , c.CategoryName
FROM products p 
JOIN Categories c ON p.CategoryID = c.CategoryID
WHERE c.CategoryName LIKE '%e%'
ORDER BY p.SupplierID , p.UnitPrice

--Q9 

select p.ProductName , c.CategoryName , s.CompanyName
from Categories c
JOIN Products p ON c.CategoryID = p.CategoryID
JOIN Suppliers s ON p.SupplierID = s.SupplierID
ORDER BY  s.CompanyName

--Q10

SELECT e1.EmployeeID, e1.LastName + ' ' + e1.FirstName AS ManagerName , e1.City AS ManagerCity , e2.LastName + ' ' + e2.FirstName AS EmployeeName, e2.EmployeeID, e2.City AS EmployeeCity , e2.ReportsTo
FROM Employees e2 
LEFT JOIN Employees e1 on e2.ReportsTo = e1.EmployeeID

--Q11

SELECT ProductID , QuantityPerUnit , UnitsInStock
FROM Products
WHERE QuantityPerUnit < '10-200 g glasses'

--Q12

SELECT p.ProductID , c.Description , s.Country
FROM Products p 
JOIN Categories c ON p.CategoryID = c.CategoryID
JOIN Suppliers s ON p.SupplierID = s.SupplierID
WHERE s.Country LIKE 'd%'

--Q13

SELECT c.CustomerID , o.Freight
FROM Customers c
LEFT JOIN Orders o ON c.CustomerID = o.CustomerID

--Q14

SELECT o.OrderID , o.OrderDate , o.ShippedDate, c.CompanyName , c.CustomerID , c.Phone
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
WHERE YEAR(OrderDate) = '1997' AND c.CustomerID LIKE 'e%' OR c.CustomerID LIKE 'b%'





























































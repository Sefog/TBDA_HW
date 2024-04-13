USE NORTHWND
GO

--Q1

SELECT CustomerID ,City
FROM Customers
WHERE City = (SELECT City
				FROM Customers
				WHERE CustomerID = 'FISSA')


--Q2

SELECT ProductName
FROM Products
WHERE UnitPrice < (SELECT UnitPrice
					FROM Products
					WHERE ProductID = 67)


--Q3

SELECT ProductName, UnitPrice
FROM Products
WHERE UnitPrice > (SELECT UnitPrice
					FROM Products
					WHERE ProductName = 'Chang')


--Q4

SELECT *
FROM Orders
WHERE OrderDate >= (SELECT OrderDate
					FROM Orders
					WHERE OrderID = 10533)
					AND
					OrderID != 10533
ORDER BY OrderDate


--Q5

SELECT ProductID, ProductName, UnitPrice
FROM Products
WHERE UnitPrice > (SELECT AVG(UnitPrice)
					FROM Products)

--Q6

SELECT ProductName , UnitsInStock
FROM Products
WHERE UnitsInStock < (SELECT MIN(UnitsInStock)
					FROM Products
					WHERE CategoryID = 7)


--Q7

SELECT OrderID, Freight
FROM Orders
WHERE Freight > ALL (SELECT Freight 
					FROM Orders
					WHERE ShipVia = 2)


--Q8

SELECT ProductName , UnitPrice, CategoryID
FROM Products
WHERE UnitPrice IN (SELECT UnitPrice
					FROM Products
					WHERE CategoryID = 7)

--Q9


SELECT ProductName, UnitPrice
FROM Products
WHERE UnitPrice > ANY (SELECT UnitPrice
						FROM Products
						WHERE CategoryID = 3)


--Q10

SELECT OrderID, ShipCountry
FROM Orders
WHERE Freight > (SELECT AVG(Freight)
				FROM Orders
				WHERE YEAR(OrderDate) >= 1997)

--Q11

SELECT OrderID, OrderDate
FROM Orders
WHERE MONTH(OrderDate) = 7
AND OrderID IN (
    SELECT DISTINCT O.OrderID
    FROM Orders O
    JOIN [Order Details] OD ON O.OrderID = OD.OrderID
    JOIN Products P ON OD.ProductID = P.ProductID
    JOIN Suppliers S ON P.SupplierID = S.SupplierID
    WHERE S.Country IN ('Spain', 'Germany', 'US'))

--Q12

SELECT EmployeeID, OrderID, OrderDate
FROM Orders
WHERE OrderDate = (
    SELECT MIN(OrderDate)
    FROM Orders
    WHERE EmployeeID = (
        SELECT EmployeeID
        FROM Employees
        WHERE EmployeeID = Orders.EmployeeID ))
						


--Q13

SELECT SupplierID , CompanyName
FROM Suppliers
WHERE SupplierID IN (SELECT SupplierID
					FROM Products
					WHERE UnitPrice < 20)


--Q14

SELECT P.ProductName
FROM Products P
WHERE P.CategoryID = (
    SELECT C.CategoryID
    FROM Categories C
    WHERE C.CategoryName = 'Seafood'
) AND P.ProductID IN (
    SELECT OD.ProductID
    FROM [Order Details] OD
    WHERE OD.OrderID IN (
        SELECT O.OrderID
        FROM Orders O
        WHERE O.CustomerID IN (
            SELECT C2.CustomerID
            FROM Customers C2
            WHERE C2.Region IS NULL)))	
			

--Q15

SELECT CompanyName
FROM Suppliers
WHERE SupplierID IN (
    SELECT SupplierID
    FROM Products
    WHERE CategoryID IN (
        SELECT CategoryID
        FROM Categories
        WHERE CategoryName = 'Condiments'))








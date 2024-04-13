USE NORTHWND
GO
USE Northwind_DW
GO

CREATE PROCEDURE PopulateDB
AS
BEGIN
   
    TRUNCATE TABLE Northwind_DW.dbo.Dim_Products;
    TRUNCATE TABLE Northwind_DW.dbo.Dim_Employees;
    TRUNCATE TABLE Northwind_DW.dbo.Dim_Customers;
    TRUNCATE TABLE Northwind_DW.dbo.Dim_Orders;
    TRUNCATE TABLE Northwind_DW.dbo.Fact_Sales;

   
    DECLARE @AvgUnitPrice MONEY;
    SELECT @AvgUnitPrice = AVG(UnitPrice) FROM Northwnd.dbo.Products;

    
    INSERT INTO Northwind_DW.dbo.Dim_Products (ProductBK, ProductName, ProductUnitPrice, ProductType, CategoryName, SupplierName, Discontinued)
    SELECT 
        ProductID,
        ProductName,
        UnitPrice,
        CASE WHEN UnitPrice > @AvgUnitPrice THEN 'Expensive' ELSE 'Cheap' END AS ProductType,
        (SELECT DISTINCT categoryname FROM Northwnd.dbo.Categories WHERE CategoryID = p.CategoryID) AS CategoryName,
        (SELECT DISTINCT companyname FROM Northwnd.dbo.Suppliers WHERE SupplierID = p.SupplierID) AS SupplierName,
        Discontinued
    FROM Northwnd.dbo.Products p;

   
    INSERT INTO Northwind_DW.dbo.Dim_Employees (EmployeeBK, LastName, FirstName, FullName, Title, BirthDate, Age, HireDate, Seniority, City, Country, Photo, ReportsTo)
    SELECT 
        EmployeeID,
        LastName,
        FirstName,
        CONCAT(FirstName, ' ', LastName) AS FullName,
        Title,
        BirthDate,
        DATEDIFF(YEAR, BirthDate, GETDATE()) AS Age,
        HireDate,
        DATEDIFF(YEAR, HireDate, GETDATE()) AS Seniority,
        City,
        Country,
        Photo,
        CASE WHEN ReportsTo = ReportsTo THEN ReportsTo ELSE EmployeeID END AS ReportsTo
    FROM Northwnd.dbo.Employees; 
    
    INSERT INTO Northwind_DW.dbo.Dim_Customers (CustomerBK, CustomerName, City, Region, Country)
    SELECT
		CustomerID,
        CompanyName,
        City,
        ISNULL(Region, 'Unknown'),
        Country
    FROM Northwnd.dbo.Customers;

    
    INSERT INTO Northwind_DW.dbo.Dim_Orders (OrderBK, ShipCity, ShipRegion, ShipCountry)
    SELECT 
		OrderID,
        ShipCity,
        ISNULL(ShipRegion, 'Unknown'),
        ShipCountry
    FROM Northwnd.dbo.Orders;

    
    INSERT INTO Northwind_DW.dbo.Fact_Sales (OrderSK, ProductSK, DateKey, CustomerSK, EmployeeSK, UnitPrice, Quantity, Discount)
    SELECT 
        o.OrderSK,
        p.ProductSK,
        CONVERT(NVARCHAR, oo.OrderDate, 112),
        dc.CustomerSK,
        e.EmployeeSK,
        od.UnitPrice,
        od.Quantity,
        od.Discount
 
 FROM NORTHWND.dbo.Customers c
		JOIN NORTHWND.dbo.Orders oo ON c.CustomerID = oo.CustomerID
		JOIN Northwind_DW.dbo.Dim_Orders o ON oo.OrderID = o.OrderBK
        JOIN Northwind_DW.dbo.Dim_Customers dc ON oo.CustomerID = dc.CustomerBK
        JOIN Northwind_DW.dbo.Dim_Employees e ON oo.EmployeeID = e.employeeBK
		JOIN Northwnd.dbo.[Order Details] od ON oo.OrderID = od.OrderID
        JOIN Northwind_DW.dbo.Dim_Products p ON od.ProductID = p.ProductBK ;
		
END ;

----------


EXEC PopulateDB

----------
GO


SELECT *
FROM Dim_Orders

SELECT *
FROM Dim_Products

SELECT *
FROM Dim_Customers

SELECT *
FROM Dim_Employees

SELECT *
FROM Fact_Sales
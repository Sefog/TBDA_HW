
CREATE PROCEDURE usp_Orders 
(@HMO int)
AS

DECLARE 
    @CustID nvarchar(5),
    @EmpID int,
    @OrdID int,
    @PrdID int,
    @HowManyOrdersMin int,
    @HowManyOrdersMax int

SET @HowManyOrdersMin = 1
SET @HowManyOrdersMax = 4

WHILE @HMO > 0
BEGIN
    SET @CustID = (SELECT TOP 1 CustomerID FROM Orders ORDER BY NEWID())
    SET @EmpID = (SELECT TOP 1 EmployeeID FROM Orders ORDER BY NEWID())
    SET @PrdID = (SELECT TOP 1 ProductID FROM Products ORDER BY NEWID())

    INSERT INTO Orders (CustomerID, EmployeeID, OrderDate) 
    VALUES (@CustID, @EmpID, GETDATE())

    SET @OrdID = SCOPE_IDENTITY()

    INSERT INTO [Order Details] (OrderID, ProductID, UnitPrice, Quantity, Discount)
    VALUES (
        @OrdID,
        @PrdID,
        (SELECT UnitPrice FROM Products WHERE ProductID = @PrdID),
        (SELECT dbo.fn_Rand(10, 1)),
        (RAND())
    )

    SET @HMO = @HMO - 1

    IF (@HMO >= @HowManyOrdersMin AND @HowManyOrdersMin > 0) OR (@HMO <= @HowManyOrdersMax AND @HowManyOrdersMax > 0)
        BREAK
END


SELECT *
FROM Orders


---Function Rand


CREATE VIEW vv_rand
AS
SELECT RAND() AS [value]

select * from vv_rand


----

CREATE FUNCTION fn_Rand (@n1 int, @n2 int)
RETURNS int
AS
BEGIN
DECLARE @x int
SET @x = ((SELECT * from vv_rand)*(1+@n1-@n2)+@n2)
RETURN @x

END



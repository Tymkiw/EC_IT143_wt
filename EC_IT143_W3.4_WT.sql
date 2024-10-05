--1.What are our top five products by sales quantity?

SELECT TOP 5 p.Name AS ProductName, sod.ProductID, SUM(sod.OrderQty) AS TotalQuantity
FROM Sales.SalesOrderDetail sod
JOIN Production.Product p ON sod.ProductID = p.ProductID
GROUP BY p.Name, sod.ProductID
ORDER BY TotalQuantity DESC;


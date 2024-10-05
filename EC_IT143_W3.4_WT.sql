/*****************************************************************************************************************
NAME:    W3.4 - Adventure Works—Create Answers - Increased Complexity - Solution
PURPOSE: Solve increased complexity questions created by me and other students using SQL

MODIFICATION LOG:
Ver      Date        Author        Description
-----   ----------   -----------   -------------------------------------------------------------------------------
1.0     10/04/2024   WESLEYTYMKIW   1. Built this script for EC IT 143


RUNTIME: 
0m 0s 01ms

NOTES: 
Built for W3.4 - Adventure Works—Create Answers

I am building this script in order to show the answers for 2 of my own questions using SQL and for 6 others questions from others students.
 
******************************************************************************************************************/
-- Business User Questions—Marginal Complexity
-- Q1.What are our top five products by sales quantity? (My question)
-- A1. 
-- 1 - AWC Logo Cap 
-- 2 - Water Bottle - 30 oz.
-- 3 - Sport-100 Helmet, Blue
-- 4 - Long-Sleeve Logo Jersey, L
-- 5 - Sport-100 Helmet, Black

--Solution:

SELECT TOP 5 p.Name AS ProductName, sod.ProductID, SUM(sod.OrderQty) AS TotalQuantity
FROM Sales.SalesOrderDetail sod
JOIN Production.Product p ON sod.ProductID = p.ProductID --This allows you to include the product name in the results
GROUP BY p.Name, sod.ProductID
ORDER BY TotalQuantity DESC;

-- Q2. 2.Which product has the highest standard cost? (My question)
-- A2. Road-150 Red, 62. 
-- Solution:

SELECT TOP 1 ProductID, Name, StandardCost
FROM Production.Product
ORDER BY StandardCost DESC; -- Ordering by Standard Cost we can filter the most expensive product.


-- Business User question—Moderate complexity: (Created by Angelica Schneider)

-- Q3.How many products does AW have?
-- A3. 504. 
-- Solution:

SELECT COUNT(*) AS TotalProducts
FROM Production.Product;


-- Business User question—Moderate complexity: (Created by Angelica Schneider)

-- Q4. What is the Product ID of the Least Quantity? - There are 4
-- A4. 859 - Half-Finger Gloves, M.
-- Solution:

SELECT TOP 1 pi.ProductID, p.Name AS ProductName, pi.Quantity
FROM Production.ProductInventory pi
JOIN Production.Product p ON pi.ProductID = p.ProductID
ORDER BY pi.Quantity ASC;
 

-- Business User question—Increased complexity: (Created by Angelica Schneider)

-- Q5. What is the Product ID of the highest Quantity?
-- A5. 528 - Seat Lug.
-- Solution:

SELECT TOP 1 pi.ProductID, p.Name AS ProductName, pi.Quantity
FROM Production.ProductInventory pi
JOIN Production.Product p ON pi.ProductID = p.ProductID
ORDER BY pi.Quantity DESC;


-- Business User question—Increased complexity: (Justin Hemmert Hemmert)

-- Q6. The sales manager wants to find out how much each employee sold in 2023.
-- Can you list the number of employees with their First Name, Last Name, and Vacation hours that are equal to 50 and above?
-- We may be implementing new policies to our vacation roll over limits. 
-- A6. Solution:

SELECT 
    e.BusinessEntityID,
    p.FirstName,
    p.LastName,
    e.VacationHours
FROM 
    HumanResources.Employee e
JOIN 
    Person.Person p ON e.BusinessEntityID = p.BusinessEntityID
WHERE 
    e.VacationHours >= 50 -- vacation hours equal to 50 and above
ORDER BY 
    e.VacationHours DESC;

 

-- Metadata question: (Justin Hemmert Hemmert)

-- Q7. Using the Sales.vSalesPerson veiw, can you list the FirstName, LastName, and JobTitle where the TerritoryName is NULL or Empty?
-- A7. Solution:


SELECT 
    FirstName,
    LastName,
    JobTitle,
	TerritoryName -- we select the TerritoryName just to ensure that will be shown the "NULL" or nothing.
FROM 
    Sales.vSalesPerson
WHERE 
    TerritoryName IS NULL OR TerritoryName = '';
 

-- Metadata question: (Created by Cameron Shephard)

-- Q8. Can you create a list of tables in AdventureWorks that contain a column with this names: CustomerID?
-- A8. Solution:

SELECT 
    t.name AS TableName,
    c.name AS ColumnName
FROM 
    sys.tables t
JOIN 
    sys.columns c ON t.object_id = c.object_id
WHERE 
    c.name = 'CustomerID'
ORDER BY 
    t.name;



SELECT GETDATE() AS my_date;
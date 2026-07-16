-- ==========================================
-- Query 1: Calculate Total Sales
-- ==========================================

SELECT
    SUM(Sales) AS TotalSales
FROM FactSales;


-- ==========================================
-- Query 2: Calculate Total Profit
-- ==========================================

SELECT
    SUM(Profit) AS TotalProfit
FROM FactSales;


-- ==========================================
-- Query 3: Calculate Average Order Value
-- ==========================================

SELECT
    AVG(Sales) AS AverageOrderValue
FROM FactSales;


-- ==========================================
-- Query 4: Calculate Sales by Product Category
-- ==========================================

SELECT
    P.Category,
    SUM(F.Sales) AS TotalSales
FROM FactSales F
INNER JOIN Products P
    ON F.ProductID = P.ProductID
GROUP BY
    P.Category
ORDER BY
    TotalSales DESC;


-- ==========================================
-- Query 5: Calculate Sales by Customer Segment
-- ==========================================

SELECT
    C.Segment,
    SUM(F.Sales) AS TotalSales
FROM FactSales F
INNER JOIN Customers C
    ON F.CustomerID = C.CustomerID
GROUP BY
    C.Segment
ORDER BY
    TotalSales DESC;
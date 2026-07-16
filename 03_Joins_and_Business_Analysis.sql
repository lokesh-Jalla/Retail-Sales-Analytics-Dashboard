-- ==========================================
-- Query 1: Top 10 Products by Sales
-- ==========================================

SELECT TOP 10
    P.ProductName,
    SUM(F.Sales) AS TotalSales
FROM FactSales F
INNER JOIN Products P
    ON F.ProductID = P.ProductID
GROUP BY
    P.ProductName
ORDER BY
    TotalSales DESC;


-- ==========================================
-- Query 2: Top 10 Customers by Sales
-- ==========================================

SELECT TOP 10
    C.CustomerName,
    SUM(F.Sales) AS TotalSales
FROM FactSales F
INNER JOIN Customers C
    ON F.CustomerID = C.CustomerID
GROUP BY
    C.CustomerName
ORDER BY
    TotalSales DESC;


-- ==========================================
-- Query 3: Best Performing Store
-- ==========================================

SELECT TOP 1
    S.StoreName,
    SUM(F.Sales) AS TotalSales
FROM FactSales F
INNER JOIN Stores S
    ON F.StoreID = S.StoreID
GROUP BY
    S.StoreName
ORDER BY
    TotalSales DESC;


-- ==========================================
-- Query 4: Top Performing State by Sales
-- ==========================================

SELECT
    S.State,
    SUM(F.Sales) AS TotalSales
FROM FactSales F
INNER JOIN Stores S
    ON F.StoreID = S.StoreID
GROUP BY
    S.State
ORDER BY
    TotalSales DESC;


-- ==========================================
-- Query 5: Monthly Sales Trend
-- ==========================================

SELECT
    YEAR(OrderDate) AS SalesYear,
    MONTH(OrderDate) AS SalesMonth,
    SUM(Sales) AS TotalSales
FROM FactSales
GROUP BY
    YEAR(OrderDate),
    MONTH(OrderDate)
ORDER BY
    SalesYear,
    SalesMonth;
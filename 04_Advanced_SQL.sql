-- ==========================================
-- Query 1: Profit Margin by Category
-- ==========================================

SELECT
    P.Category,
    ROUND((SUM(F.Profit) * 100.0 / SUM(F.Sales)), 2) AS ProfitMargin
FROM FactSales F
INNER JOIN Products P
    ON F.ProductID = P.ProductID
GROUP BY
    P.Category
ORDER BY
    ProfitMargin DESC;


-- ==========================================
-- Query 2: Rank Top 5 Products by Sales
-- ==========================================

SELECT *
FROM
(
    SELECT
        P.ProductName,
        SUM(F.Sales) AS TotalSales,
        RANK() OVER(ORDER BY SUM(F.Sales) DESC) AS SalesRank
    FROM FactSales F
    INNER JOIN Products P
        ON F.ProductID = P.ProductID
    GROUP BY
        P.ProductName
) RankedProducts
WHERE SalesRank <= 5;


-- ==========================================
-- Query 3: Running Total of Sales
-- ==========================================

SELECT
    OrderDate,
    Sales,
    SUM(Sales) OVER(ORDER BY OrderDate) AS RunningTotalSales
FROM FactSales
ORDER BY
    OrderDate;


-- ==========================================
-- Query 4: Highest Profit Order
-- ==========================================

SELECT TOP 1
    OrderID,
    Sales,
    Profit
FROM FactSales
ORDER BY
    Profit DESC;


-- ==========================================
-- Query 5: Complete Business Report
-- ==========================================

SELECT
    F.OrderID,
    F.OrderDate,
    C.CustomerName,
    P.ProductName,
    S.StoreName,
    S.City,
    S.State,
    F.Quantity,
    F.Sales,
    F.Profit
FROM FactSales F
INNER JOIN Customers C
    ON F.CustomerID = C.CustomerID
INNER JOIN Products P
    ON F.ProductID = P.ProductID
INNER JOIN Stores S
    ON F.StoreID = S.StoreID;
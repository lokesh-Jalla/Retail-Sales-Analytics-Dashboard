-- ==========================================
-- Query 1: View All Sales Records
-- ==========================================

SELECT *
FROM FactSales;


-- ==========================================
-- Query 2: View All Customer Records
-- ==========================================

SELECT *
FROM Customers;


-- ==========================================
-- Query 3: Filter Orders with Sales > 1000
-- ==========================================

SELECT *
FROM FactSales
WHERE Sales > 1000;


-- ==========================================
-- Query 4: Orders in 2025
-- ==========================================

SELECT *
FROM FactSales
WHERE YEAR(OrderDate) = 2025;


-- ==========================================
-- Query 5: Sort Orders by Highest Sales
-- ==========================================

SELECT *
FROM FactSales
ORDER BY Sales DESC;
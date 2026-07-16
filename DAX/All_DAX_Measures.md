# 📊 Retail Sales Analytics Dashboard - DAX Measures

This file contains the key DAX measures used to build the Retail Sales Analytics Dashboard.

---

# 📈 Sales Measures

## 1. Total Sales

```DAX
Total Sales =
SUM(FactSales[Sales])
```

## 2. Current Year Sales

```DAX
Current Year Sales =
CALCULATE(
    [Total Sales],
    YEAR(Calendar[Date]) = YEAR(TODAY())
)
```

## 3. Previous Year Sales

```DAX
Previous Year Sales =
CALCULATE(
    [Total Sales],
    SAMEPERIODLASTYEAR(Calendar[Date])
)
```

## 4. Sales Growth %

```DAX
Sales Growth % =
DIVIDE(
    [Current Year Sales]-[Previous Year Sales],
    [Previous Year Sales],
    0
)
```

## 5. Sales Target

```DAX
Sales Target =
[Current Year Sales] * 1.10
```

---

# 💰 Profit Measures

## 6. Total Profit

```DAX
Total Profit =
SUM(FactSales[Profit])
```

## 7. Current Year Profit

```DAX
Current Year Profit =
CALCULATE(
    [Total Profit],
    YEAR(Calendar[Date])=YEAR(TODAY())
)
```

## 8. Previous Year Profit

```DAX
Previous Year Profit =
CALCULATE(
    [Total Profit],
    SAMEPERIODLASTYEAR(Calendar[Date])
)
```

## 9. Profit Growth %

```DAX
Profit Growth % =
DIVIDE(
    [Current Year Profit]-[Previous Year Profit],
    [Previous Year Profit],
    0
)
```

## 10. Profit Target

```DAX
Profit Target =
[Current Year Profit] * 1.10
```

## 11. Profit Margin %

```DAX
Profit Margin % =
DIVIDE(
    [Total Profit],
    [Total Sales],
    0
)
```

---

# 📦 Order Measures

## 12. Total Orders

```DAX
Total Orders =
DISTINCTCOUNT(FactSales[OrderID])
```

## 13. Average Order Value

```DAX
Average Order Value =
DIVIDE(
    [Total Sales],
    [Total Orders],
    0
)
```

## 14. Total Quantity Sold

```DAX
Total Quantity =
SUM(FactSales[Quantity])
```

---

# 👥 Customer Measures

## 15. Total Customers

```DAX
Total Customers =
DISTINCTCOUNT(Customers[CustomerID])
```

## 16. Repeat Customer %

```DAX
Repeat Customer % =
DIVIDE(
    [Total Orders],
    [Total Customers],
    0
)
```

---

# 📅 Time Intelligence

## 17. Sales YTD

```DAX
Sales YTD =
TOTALYTD(
    [Total Sales],
    Calendar[Date]
)
```

## 18. Profit YTD

```DAX
Profit YTD =
TOTALYTD(
    [Total Profit],
    Calendar[Date]
)
```

---

# 📊 KPI Measures

## 19. Sales Variance

```DAX
Sales Variance =
[Current Year Sales] -
[Sales Target]
```

## 20. Profit Variance

```DAX
Profit Variance =
[Current Year Profit] -
[Profit Target]
```

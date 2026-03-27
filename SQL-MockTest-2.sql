-- CÂU 1:
SELECT DISTINCT City 
, StateProvinceName
, EnglishCountryRegionName
FROM DimGeography
WHERE EnglishCountryRegionName = 'Canada'
-- END

-- CÂU 2:
SELECT COUNT(EnglishDayNameOfWeek) AS Total_days
, EnglishDayNameOfWeek
, YEAR(FullDateAlternateKey) AS YEAR
FROM DimDate
WHERE EnglishDayNameOfWeek = 'Saturday'
OR EnglishDayNameOfWeek = 'Sunday'
GROUP BY YEAR(FullDateAlternateKey)
, EnglishDayNameOfWeek
-- END

-- CÂU 3:
SELECT ProductKey
, UnitsBalance
FROM FactProductInventory
WHERE UnitsBalance > 500
AND MovementDate = '2014-06-30'
ORDER BY ProductKey
-- END

-- CÂU 4:
SELECT ResellerName
, SUM(SalesAmount) AS Total_Revenue
FROM FactResellerSales AS FRS
LEFT JOIN DimReseller AS DR
ON DR.ResellerKey = FRS.ResellerKey
GROUP BY ResellerName
ORDER BY SUM(SalesAmount) DESC
-- END

-- CÂU 5:
SELECT EnglishProductCategoryName
, SUM(SalesAmount) AS TotalRevenue
FROM FactInternetSales AS FIS
JOIN DimProduct AS DP
ON FIS.ProductKey = DP.ProductKey
JOIN DimProductSubcategory AS DPS
ON DPS.ProductSubcategoryKey = DP.ProductSubcategoryKey
JOIN DimProductCategory AS DPC
ON DPC.ProductCategoryKey = DPS.ProductCategoryKey
GROUP BY EnglishProductCategoryName
ORDER BY SUM(SalesAmount) DESC
-- END

-- CÂU 6:
WITH Revenue_Level as (
    SELECT SalesOrderNumber
    , CASE
    WHEN SalesAmount >= 1000 THEN 'Large'
    WHEN SalesAmount >= 100 THEN 'Medium'
    ELSE 'Small'
    END AS Revenue_Level 
    FROM FactInternetSales
)
SELECT Revenue_Level
, COUNT(DISTINCT SalesOrderNumber) AS SO_LUONG_DON_HANG_DUY_NHAT
FROM Revenue_Level 
GROUP BY Revenue_Level
-- END
-- Câu 1:
select CustomerKey
, FirstName
, LastName
, EmailAddress
, YearlyIncome
, Gender
from dbo.DimCustomer
order by YearlyIncome DESC
-- End

-- Câu 2: 
select Top 10 CustomerKey
, FirstName
, LastName
, EmailAddress
, DateFirstPurchase
from dbo.DimCustomer 
where Gender = 'F'
and MaritalStatus = 'M'
order by DateFirstPurchase DESC
-- End

-- Câu 3:
SELECT CustomerKey
, FirstName
, LastName, 
CASE
    WHEN YearlyIncome > 90000 THEN 'High Income'
    WHEN YearlyIncome >= 50000 THEN 'Medium Income'
    ELSE 'Low Income'
    END AS Income_Level
FROM dbo.DimCustomer
ORDER BY Income_Level
-- End

-- Câu 4:
SELECT EnglishProductName
, SUM(TotalProductCost) as TotalCost
, SUM(OrderQuantity) as Quantity
, SUM(SalesAmount) as Revenue
FROM FactInternetSales as FIS
LEFT JOIN DimProduct as DP
ON FIS.ProductKey = DP.ProductKey
GROUP BY EnglishProductName
ORDER BY TotalCost DESC
-- End

-- Câu 5:
SELECT Gender
, EnglishCountryRegionName
, AVG(SalesAmount) AS Avg_Revenue
FROM FactInternetSales AS FIS 
JOIN DimCusTomer AS DC
ON FIS.CustomerKey = DC.CustomerKey
JOIN DimGeography AS DG
ON DG.GeographyKey = DC.GeographyKey 
GROUP BY Gender
, EnglishCountryRegionName
ORDER BY EnglishCountryRegionName
-- End

-- Câu 6:
WITH Revenue_by_Subcategory AS (
    SELECT EnglishProductSubcategoryName
    , SUM(SalesAmount) as TotalRevenue
    FROM FactInternetSales AS FIS
    JOIN DimProduct AS DP
    ON FIS.ProductKey = DP.ProductKey
    JOIN DimProductSubcategory AS DPS
    ON DPS.ProductSubcategoryKey = DP.ProductSubcategoryKey
    GROUP BY DPS.EnglishProductSubcategoryName
)
SELECT EnglishProductSubcategoryName
, TotalRevenue
FROM Revenue_by_Subcategory
WHERE TotalRevenue > 1000000
-- End


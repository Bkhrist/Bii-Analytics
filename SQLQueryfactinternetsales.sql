--Conducting data cleansing operations by selecting pertinent columns, using the AS function 
--to rename the table, and then exporting the refined data into a CSV file for additional analysis
SELECT
ProductKey,
CustomerKey,
SalesOrderNumber,
SalesTerritoryKey,
OrderQuantity,
UnitPrice,
UnitPriceDiscountPct,
DiscountAmount,
ProductStandardCost,
TotalProductCost AS ProductCost,
SalesAmount,
TaxAmt,
Freight,
OrderDate,
DueDate,
ShipDate,
CAST(CAST(Freight AS FLOAT) AS FLOAT) AS Freight
FROM FactInternetSales$
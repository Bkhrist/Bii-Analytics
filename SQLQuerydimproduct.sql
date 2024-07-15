--Conducting data cleansing operations by selecting pertinent columns, using the AS function 
--to rename the table, and then exporting the refined data into a CSV file for additional analysis

ALTER  TABLE DimProduct$
ALTER  COLUMN StartDate Date;

ALTER  TABLE DimProduct$
ALTER  COLUMN EndDate Date;

SELECT
ProductKey,
EnglishProductName AS Product_name,
FinishedGoodsFlag,
Color,
SafetyStockLevel,
ReorderPoint,
DaysToManufacture,
ProductLine,
class,
EnglishDescription,
Weight,
StartDate,
EndDate
FROM DimProduct$


select *from DimProduct$


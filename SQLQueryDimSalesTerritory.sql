--Conducting data cleansing operations by selecting pertinent columns,
-- and then exporting the refined data into a CSV file for additional analysis
select* from DimSalesTerritory$
SalesTerritoryKey,
SalesTerritoryCountry,
SalesTerritoryGroup AS SalesTerritoryRegion
from DimSalesTerritory$
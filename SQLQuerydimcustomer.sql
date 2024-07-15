--Performing data cleaning that involves filtering out relevant columns, 
--utilizing the case function to reassign values to certain records, 
--and subsequently extracting the processed data into a CSV file for further analysis.

Select 
CustomerKey,
GeographyKey,
FirstName,
MiddleName,
LastName,
BirthDate,
Age,
AgeRange,
TotalChildren,
NumberChildrenAtHome,
EnglishEducation,
NumberCarsOwned,
DateFirstPurchase,
CommuteDistance,
YearlyIncome,

CASE
	when MaritalStatus ='M' then 'Married'
	when MaritalStatus = 'S'then 'Single'
	Else 'Other'
	End as Marital_Status,
CASE
	when Gender ='M' then 'Male'
	when Gender = 'F' then 'Female'
	Else 'Other'
	End as Gender
from DimCustomer$


--change date format
ALTER TABLE DimCustomer$
ALTER COLUMN DateFirstPurchase DATE;

ALTER TABLE DimCustomer$
ALTER COLUMN BirthDate DATE;


ALTER TABLE DimCustomer$
ADD Age INT,
    AgeRange VARCHAR(10);

UPDATE DimCustomer$
SET Age = DATEDIFF(YEAR, BirthDate, GETDATE()) -
          CASE
              WHEN DATEADD(YEAR, DATEDIFF(YEAR, BirthDate, GETDATE()), BirthDate) > GETDATE() THEN 1
              ELSE 0
          END,
    AgeRange = CASE
                   WHEN DATEDIFF(YEAR, BirthDate, GETDATE()) -
                        CASE
                            WHEN DATEADD(YEAR, DATEDIFF(YEAR, BirthDate, GETDATE()), BirthDate) > GETDATE() THEN 1
                            ELSE 0
                        END <= 10 THEN '0-10'
                   WHEN DATEDIFF(YEAR, BirthDate, GETDATE()) -
                        CASE
                            WHEN DATEADD(YEAR, DATEDIFF(YEAR, BirthDate, GETDATE()), BirthDate) > GETDATE() THEN 1
                            ELSE 0
                        END <= 20 THEN '11-20'
                   WHEN DATEDIFF(YEAR, BirthDate, GETDATE()) -
                        CASE
                            WHEN DATEADD(YEAR, DATEDIFF(YEAR, BirthDate, GETDATE()), BirthDate) > GETDATE() THEN 1
                            ELSE 0
                        END <= 30 THEN '21-30'
                   WHEN DATEDIFF(YEAR, BirthDate, GETDATE()) -
                        CASE
                            WHEN DATEADD(YEAR, DATEDIFF(YEAR, BirthDate, GETDATE()), BirthDate) > GETDATE() THEN 1
                            ELSE 0
                        END <= 40 THEN '31-40'
                   WHEN DATEDIFF(YEAR, BirthDate, GETDATE()) -
                        CASE
                            WHEN DATEADD(YEAR, DATEDIFF(YEAR, BirthDate, GETDATE()), BirthDate) > GETDATE() THEN 1
                            ELSE 0
                        END <= 50 THEN '41-50'
                   WHEN DATEDIFF(YEAR, BirthDate, GETDATE()) -
                        CASE
                            WHEN DATEADD(YEAR, DATEDIFF(YEAR, BirthDate, GETDATE()), BirthDate) > GETDATE() THEN 1
                            ELSE 0
                        END <= 60 THEN '51-60'
                   ELSE '60+'
               END;



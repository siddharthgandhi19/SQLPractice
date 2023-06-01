


-- FOR CONVERTING ANY TABLE TO JSON FORMAT

SELECT  TOP 3
BusinessEntityID,
FirstName,
LastName,
MiddleName,
ModifiedDate

FROM [Person].[Person]

FOR JSON AUTO

-- USING RAPPER -- nested like structure FOR JSON PATH -- group all these three column under name

SELECT  TOP 3
BusinessEntityID,
FirstName AS "Name.FirstName",
LastName AS "Name.LastName",
MiddleName AS "Name.MiddleName",
ModifiedDate

FROM [Person].[Person]

FOR JSON PATH

-- for root element

SELECT  TOP 3
BusinessEntityID,
FirstName AS "Name.FirstName",
LastName AS "Name.LastName",
MiddleName AS "Name.MiddleName",
ModifiedDate

FROM [Person].[Person]

FOR JSON PATH, ROOT('Person') --ROOT('table name')

--Null Values 

SELECT  TOP 3
BusinessEntityID,
FirstName AS "Name.FirstName",
LastName AS "Name.LastName",
MiddleName AS "Name.MiddleName",
ModifiedDate

FROM [Person].[Person]

FOR JSON PATH, INCLUDE_NULL_VALUES

--WITHOUT SQUARE BRACKETS --- ONLY FOR SINGLE RESULTS

SELECT  TOP 1
BusinessEntityID,
FirstName AS "Name.FirstName",
LastName AS "Name.LastName",
MiddleName AS "Name.MiddleName",
ModifiedDate

FROM [Person].[Person]

FOR JSON PATH, INCLUDE_NULL_VALUES, WITHOUT_ARRAY_WRAPPER
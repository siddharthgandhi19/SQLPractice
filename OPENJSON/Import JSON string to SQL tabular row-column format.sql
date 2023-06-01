DECLARE @json NVARCHAR(MAX)
SELECT @json = N'{
  "Person": [
    {
      "BusinessEntityID": 285,
      "FirstName": "Syed",
      "LastName": "Abbas"
    },
    {
      "BusinessEntityID": 293,
      "FirstName": "Catherine",
      "LastName": "Abel"
    },
    {
      "BusinessEntityID": 295,
      "FirstName": "Kim",
      "LastName": "Abercrombie"
    }
  ]
}'
--SELECT @json 

--with JSON VALUE

SELECT 

JSON_VALUE (P.Value,'$.BusinessEntityID') As ID,
JSON_VALUE (P.Value,'$.FirstName') AS FirstName,
JSON_VALUE (P.Value,'$.LastName') AS LastName

from OPENJSON(@json, '$.Person') P


--WITH OPEN JSON


--SELECT BusinessEntityID, FirstName,LastName
--from OPENJSON(@json, '$.Person')
--WITH (
--	BusinessEntityID int,
--	FirstName varchar(500),
--	LastName varchar(500)
--)
--AS Person
use Northwind2019

---- 1. Bereken: 10 tot de macht 2.
--select POWER(10, 2) as Macht


---- 2. Bereken de vierkantswortel van 55.
--select SQRT(55) as Vierkantswortel


---- 3a. Stel het vorige resultaat voor als geheel getal. Kap af (naar boven).
--select CEILING(SQRT(55)) as SqrtCeil

---- 3b. Stel het resultaat voor als geheel getal. Rond het resultaat af naar beneden.
--select FLOOR(SQRT(55)) as SqrtFloor

---- 3c. Stel het resultaat voor met twee cijfers na de komma. Rond af.
--select ROUND(SQRT(55), 2) as SqrtRound


---- 4. Toon de namen van de customers als volgt:
--select 'code: ' + c.CustomerID + ', name: ' + UPPER(c.CompanyName) AS Customers
--from Customers c


---- 5. Toon achternaam en job van de werknemers. In het resultaat moet Big Boss getoond worden ipv Vice president.
--select e.LastName, REPLACE(e.Title, 'Vice President', 'Big Boss')
--from Employees e


---- 6. Toon alleen de eerste letter van de voornaam van de werknemers.
----    Let op: deze letter moet getoond worden als een kleine letter.
----    Toon tevens de lengte van de volledige voornaam.

--select LOWER(SUBSTRING(e.FirstName, 1, 1)), LEN(e.FirstName)
--from Employees e


---- 7. Toon je ouderdom in dagen, maanden, jaren.
--select
--DATEDIFF(DAY, '2004/08/16', GETDATE()) AS 'dagen oud',
--DATEDIFF(MONTH, '2004/08/16', GETDATE()) AS 'maanden oud',
--DATEDIFF(YEAR, '2004/08/16', GETDATE()) AS 'jaren oud'


---- 8. Tel vanaf vandaag 14 dagen verder. (uitgevoerd op 29-9-2020)
--select DATEADD(DAY, 14, GETDATE()) AS '14 dagen verder'


---- 9. Tel vanaf vandaag 1 kwartaal verder.
--select DATEADD(QUARTER, 1, GETDATE()) AS '1 kwartaal verder'


---- 10. Toon de namen van de werknemers waarvoor geldt dat er vanaf de derde positie van de achternaam een ‘a’ voorkomt.
---- Echter, de laatste letter mag geen ‘a’ zijn.
---- vb. Allen is niet OK, Blake is wel OK, Sara is niet OK.

----select e.LastName
----from Employees e
----where e.LastName LIKE '__%a%' AND NOT e.LastName LIKE '%a'

---- 11. Toon de customers als volgt.  
----     De naam van de company en indien de job van de contactpersoon (contacttitle) het woord ‘sales’ bevat,
----     toon dan ‘sales’, anders ‘other function’.

--select c.CompanyName, IIF(c.ContactTitle LIKE '%sales%','Sales','Other function') AS 'Sales or not'
--from Customers c
use Northwind2019
---- Oefening 1
---- De verantwoordelijke van de commerciële dienst heeft de indruk dat er de laatste jaren steeds slechter wordt geleverd.
---- Geef een overzicht van de orders die op tijd zijn.
---- Op tijd betekent dat het verschil in dagen tussen de vereiste datum en de datum van verzending nul of negatief is.
---- Te laat betekent dat dit verschil positief is.
---- Schrijf twee queries die het aantal orders op tijd en het aantal orders te laat tonen.
---- Gebruik verplicht datediff ter voorbereiding van de volgende oefening.
---- Datediff levert een postief getal op indien de eerste datum kleiner is dan de tweede datum.
---- Datediff levert een negatief getal op indien de eerste datum groter is dan de tweede datum.

---- op tijd
--select COUNT(*) as 'aantal orders op tijd'
--from Orders o
--where DATEDIFF(DAY, o.RequiredDate, o.ShippedDate) <= 0

---- te laat
--select COUNT(*) as 'aantal orders op tijd'
--from Orders o
--where DATEDIFF(DAY, o.RequiredDate, o.ShippedDate) > 0


---- Oefening 2
----De lijst moet nu verder afgewerkt worden zodat per jaar/per klant(customerid) het gemiddeld 
----verschil tussen de vereiste datum en de datum van verzending getoond wordt. 
----Enkel indien het gemiddeld verschil negatief is, wordt de klantid van de klant en dit gemiddelde 
----getoond.  
----Rangschik per klant, per jaar (requireddate), en per dagen te vroeg. (oplopend) 

--select YEAR(o.RequiredDate) as 'Year', o.CustomerID, AVG(DATEDIFF(DAY, o.RequiredDate, o.ShippedDate)) as 'gemiddeld verschil'
--from Orders o
--group by YEAR(o.RequiredDate), o.CustomerID
--having AVG(DATEDIFF(DAY, o.RequiredDate, o.ShippedDate)) < 0
--order by CustomerID asc, Year(o.RequiredDate) asc, AVG(DATEDIFF(DAY, o.RequiredDate, o.ShippedDate)) asc


---- Oefening 3
----Geef een alfabetische lijst van alle producten die meer kosten dan het gemiddelde.
----Provide an alphabetical list of all products that cost (CurrentUnitPrice) more than the average cost of
----all products.

--select p.ProductName
--from Products p
--where p.CurrentUnitPrice > 
--(
--select AVG(p.CurrentUnitPrice)
--from Products p
--)
--order by p.ProductName asc


---- Oefening 4
----Bereid vorige oefening uit zodat je ook het verschil in prijs toont tov de gemiddelde prijs. 
----Toon dit enkel voor de producten waarvoor geldt dat dit verschil groter is dan 50 of kleiner is dan 0. 
----Sorteer volgens verschil van groot naar klein.

--SELECT
--  p.ProductName,
--  (p.CurrentUnitPrice - (
--    SELECT AVG(p.CurrentUnitPrice)
--    FROM Products p
--  )) AS 'Verschil'
--FROM
--  Products p
--WHERE
--  (p.CurrentUnitPrice - (
--    SELECT AVG(p.CurrentUnitPrice)
--    FROM Products p
--  )) > 50
--  OR (p.CurrentUnitPrice - (
--    SELECT AVG(p.CurrentUnitPrice)
--    FROM Products p
--  )) < 0
--ORDER BY
--  (p.CurrentUnitPrice - (
--    SELECT AVG(p.CurrentUnitPrice)
--    FROM Products p
--  )) DESC;


---- Oefening 5
----Toon de customerid en de orderid van de orders die tot de top 3 van de maximale vertraging horen.
----(top 3 van het meeste aantal dagen te laat)
----Sorteer op aantal dagen te laat.


--select o.CustomerID, o.OrderID,(DATEDIFF(day, o.RequiredDate, o.ShippedDate)) as 'Vertraging'
--from Orders o

--where DATEDIFF(day, o.RequiredDate, o.ShippedDate) in
--(
--	select distinct top 3 DATEDIFF(day, o.RequiredDate, o.ShippedDate) as vertraging
--	from Orders o
--	order by DATEDIFF(day, o.RequiredDate, o.ShippedDate) desc
--)

--order by DATEDIFF(day, o.RequiredDate, o.ShippedDate) asc


-- Oefening 6
--Geef per order de kleinste en de grootste omzet van een individueel product. Toon tevens het
--verschil hiertussen.
--Om max en min te berekenen, worden enkel de orderlijnen waarvoor geldt dat de omzet meer dan
--2000 is, in beschouwing genomen.
--Toon enkel de orders waarvoor meer dan 1 product werd besteld binnen de order én
--waarvoor het verschil tussen de maximale en minimale omzet groter is dan 100.


--select
--	od.OrderID,
--	(max(od.UnitPrice * od.Quantity * (1 - od.Discount)) - min(od.UnitPrice * od.Quantity * (1 - od.Discount))) as Verschil,
--	max(od.UnitPrice * od.Quantity * (1 - od.Discount)) as MaxOmzet,
--	min(od.UnitPrice * od.Quantity * (1 - od.Discount)) as MinOmzet


--from [Order Details] od
--group by od.OrderID

select
OrderID,
max(Omzet) - min(Omzet) as Verschil,
min(Omzet) as minOmzet,
max(Omzet) as maxOmzet
from
(
select
OrderID,
UnitPrice * Quantity * (1 - Discount) as Omzet
from [Order Details]
where UnitPrice * Quantity * (1 - Discount) > 2000
) as Filtered

group by OrderID
having max(Omzet) - min(Omzet) > 100
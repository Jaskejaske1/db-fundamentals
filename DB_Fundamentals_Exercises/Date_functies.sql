use Northwind2019

--select getdate() -- YYYY-MM-DD hh:mm:ss.µs

--select distinct year(o.OrderDate)
--from Orders o

---- DATEPART
--select DATEPART(WEEKDAY, GETDATE()) -- zaterdag = 7, zondag = 1

---- DATEADD
--select DATEADD(month, 2, GETDATE()) -- voeg 2 maanden toe aan de huidige datum

-- DATEDIFF
-- je hebt een OrderDate en een ShippedDate, je wilt weten hoeveel dagen daar tussen zaten
select DATEDIFF(DAY, o.OrderDate, o.ShippedDate) as 'ShippingTime'
from Orders o
ORDER BY ShippingTime DESC
-- hoeveel dagen leeft iemand geboren op 05 mei 2001 al?
--select DATEDIFF(DAY, '2001/05/05', GETDATE())
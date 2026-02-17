use Northwind2019

-- inner join
select o.OrderID, o.OrderDate, c.CompanyName, c.City
from Orders o inner join Customers c
on o.CustomerID = c.CustomerID -- link tussen tabellen

-- kan ook zonder inner join, met komma's bij from en where in plaats van on
select o.OrderID, o.OrderDate, c.CompanyName, c.City
from Orders o, Customers c
where o.CustomerID = c.CustomerID -- link tussen tabellen

-- inner join met 3 tabellen
select od.ProductID, od.UnitPrice, p.ProductName, p.CurrentUnitPrice
from
Orders o inner join [Order Details] od
on o.OrderID = od.OrderID

inner join Products p
on od.ProductID = p.ProductID

-- inner join: probleem: oplossing = outer join: left of right
-- right: ik wil alles zien van de rechterkant
select p.ProductName, c.CategoryName
from Products p right join Categories c -- right join toont alle categorieën, ookal is die niet gelinkt aan de products table, dus test is zichtbaar
on p.CategoryID = c.CategoryID
order by 2

-- zelfde voorbeeld: maar met left join
select p.ProductName, c.CategoryName
from Categories c left join Products p -- standaard wordt er left gebruikt
on p.CategoryID = c.CategoryID
order by 2

-- ander voorbeeld
SELECT c.CompanyName klant, c.City stad, s.CompanyName shipper, count(*) 'aantal klanten'
FROM dbo.Customers c      
INNER JOIN Orders o
ON c.CustomerID = o.CustomerID
INNER JOIN shippers s
ON o.ShipVia = s.ShipperID -- onduidelijk als deze niet dezelfde naam hebben
where c.city != 'reims' -- 'and count(*) > 3': mag niet, moet in having
group by c.CompanyName, c.City, s.CompanyName -- deze staan niet in een aggregate function, dus moeten ze allemaal in de group by
having count(*) > 3
order by 4 desc 

use Northwind2019

---- 1. Toon voor elke order de naam en voornaam van de verantwoordelijke werknemer voor deze order.
----    Sorteer op voornaam, naam.

--select e.LastName, e.FirstName, o.OrderID
--from Orders o inner join Employees e
--on o.EmployeeID = e.EmployeeID
--order by e.FirstName, e.LastName


---- 2. Show per employee how many orders he is responsible for.

--select e.FirstName, e.LastName, COUNT(o.OrderID) as 'OrderCount'
--from Orders o inner join Employees e
--on o.EmployeeID = e.EmployeeID
--group by e.FirstName, e.LastName


---- 3. For each product (product name), show the name of the category to which the product belongs.
----    Also show the supplier's name for each product.

--select p.ProductName, c.CategoryName, s.CompanyName
--from Products p inner join Categories c
--on p.CategoryID = c.CategoryID
--inner join Suppliers s
--on p.SupplierID = s.SupplierID
--order by 1


---- 4. Show by order: company name of the customer + first name and name of the employee who placed the order.

--select c.CompanyName, e.FirstName, e.LastName
--from Customers c inner join Orders o
--on c.CustomerID = o.CustomerID
--inner join Employees e
--on o.EmployeeID = e.EmployeeID
--order by c.CompanyName


---- 5. Display the names of all customers, with the IDs of their orders (delivered and outstanding).
----    All customers are shown, even if they do not have orders. Sort by orderid. What do you notice?

--select c.CompanyName, o.OrderID
--from Customers c left join Orders o
--on c.CustomerID = o.CustomerID
--order by o.OrderID


---- 6. Show all customers how many orders (delivered and outstanding) they have
----    and sort the result by "number of orders" from small to large.

--select c.CompanyName, COUNT(o.OrderID) as 'OrderAmount'
--from Customers c left join Orders o
--on c.CustomerID = o.CustomerID
--group by c.CompanyName
--order by COUNT(o.OrderID)


---- 7. Show the names of all employees and also the names of the territories in which they are active.
----    The tables involved are: Employees, EmployeeTerritories, Territories.

--select e.FirstName, e.LastName, t.TerritoryDescription
--from Employees e inner join EmployeeTerritories et
--on e.EmployeeID = et.EmployeeID
--inner join Territories t
--on et.TerritoryID = t.TerritoryID


---- 8. Show per employee how many territories he has.

--select e.FirstName, e.LastName, COUNT(et.TerritoryID) as 'aantal'
--from Employees e inner join EmployeeTerritories et
--on e.EmployeeID = et.EmployeeID
--group by e.FirstName, e.LastName


---- 9. Display the names of all territories, with the first name and the name of the responsible employee.
----    Show also those territories that have no responsible employee.

--select t.TerritoryDescription, e.FirstName, e.LastName
--from Territories t left join EmployeeTerritories et
--on t.TerritoryID = et.TerritoryID
--left join Employees e
--on et.EmployeeID = e.EmployeeID
--order by t.TerritoryDescription


---- 10. Show the number of different customers per employee.

--select e.LastName, e.FirstName, COUNT(distinct c.CustomerID) as 'CustomerAmount'
--from Customers c inner join Orders o
--on c.CustomerID = o.CustomerID
--inner join Employees e
--on o.EmployeeID = e.EmployeeID
--group by e.LastName, e.FirstName


---- 11. Show the names of the customers who have already (ever) ordered chocolate.

--select c.CompanyName
--from Customers c inner join Orders o
--on c.CustomerID = o.CustomerID
--inner join [Order Details] od
--on o.OrderID = od.OrderID
--inner join Products p
--on od.ProductID = p.ProductID
--where p.ProductName = 'Chocolade'


---- 12. Show customers with fewer than 5 orders placed (even those who do not have orders must be included in the result).
----     Sort by number.

--select c.CompanyName, COUNT(o.OrderID) as 'OrderAmount'
--from Customers c left join Orders o
--on c.CustomerID = o.CustomerID
--group by c.CompanyName
--having COUNT(o.OrderID) < 5
--order by COUNT(o.OrderID) asc


---- 13. The manager of the commercial service has the impression that orders have been delivered more
---- and more slowly in recent years. That is why he would like an overview per year and per client
---- (customer name) of the difference between the required date of the customer and the date of
---- shipment. He is interested in orders of 2018(*) WHERE  "required date < date of shipment". Sort
---- ascending per year and decreasing per days late.
---- Only consider the clients having late orders and only consider these late orders.
---- Show for these customers the average numbers of days late.
---- Sort ascending per year and decreasing per days late.
---- (*) "2018" means required date in 2018.

--select YEAR(o.RequiredDate) as 'RequiredYear', AVG(DATEDIFF(day, o.ShippedDate, o.RequiredDate)) as 'AvgDaysLate', c.CompanyName
--from Customers c inner join Orders o
--on c.CustomerID = o.CustomerID
--where o.RequiredDate < o.ShippedDate and YEAR(o.RequiredDate) = 2018
--group by YEAR(o.RequiredDate), c.CompanyName
--order by 'RequiredYear' asc, 'AvgDaysLate' asc


-- 14. For the period November 2016, show for each customer (company name) his smallest order
--     (smallest turnover, including discount) of an individual product. Also show how many products (different
--     product types) this customer has ordered during this period. Show the

SELECT
    c.CompanyName,
    MIN(t.omzet) AS omzet,
    COUNT(DISTINCT t.ProductID) AS aantal
FROM Customers c
INNER JOIN (
    SELECT
        o.CustomerID,
        od.ProductID,
        od.UnitPrice * od.Quantity * (1 - od.Discount) AS omzet
    FROM Orders o
    INNER JOIN [Order Details] od
        ON o.OrderID = od.OrderID
    WHERE o.OrderDate >= '2016-11-01'
      AND o.OrderDate < '2016-12-01'
) t
    ON c.CustomerID = t.CustomerID
GROUP BY c.CustomerID, c.CompanyName
ORDER BY omzet;

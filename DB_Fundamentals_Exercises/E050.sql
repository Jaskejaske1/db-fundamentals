use Northwind2019

---- 1. Show the oldest recruitment date per job. And sort by earliest hire date.

--select e.Title, MIN(e.HireDate) AS FirstEmployed
--from Employees e
--group by e.Title
--order by MIN(e.HireDate)


---- 2. What is the average unit price and average quantity for each of the products sold?

--select od.ProductID, AVG(od.UnitPrice) AS AvgUnitPrice, AVG(od.Quantity) AS AvgQty
--from [Order Details] od
--group by ProductID


---- 3. How many suppliers are there for Japan and USA.
----    Show the country with the largest number of suppliers first.

--select s.Country, COUNT(s.Country) AS 'NrOfSuppliers'
--from Suppliers s
--where s.Country in ('Japan', 'USA')
--group by s.Country
--order by COUNT(s.Country) desc


---- 4. Count the number of employees per city, but only show the cities with more than 1 employee.

--select e.City, COUNT(e.City) AS NrOfEmployees
--from Employees e
--group by e.City
--having COUNT(e.City) > 1
--order by COUNT(e.City) desc


---- 5. What is the maximum and minimum unit price per CategoryId. Use appropriate column names.

--select p.CategoryID, MAX(p.CurrentUnitPrice) AS MaxPrice, MIN(p.CurrentUnitPrice) AS MinPrice
--from Products p
--group by p.CategoryID


---- 6. Show the average number of units in stock per CategoryId for the products more expensive than 10, -.
----    Show only the categories for which the average number is greater than 40.

--select p.CategoryID, AVG(p.UnitsInStock) AS AvgUnitsInStock
--from Products p
--where p.CurrentUnitPrice > 10
--group by p.CategoryID
--having AVG(p.UnitsInStock) > 40


---- 7. Show an overview of the customers (id is sufficient) ordered according to the number of orders placed.
----    If this number is less than 10, customers should not appear in the list.

--select o.CustomerID, COUNT(o.OrderID) AS NrOfOrders
--from Orders o
--group by CustomerID
--having COUNT(o.OrderID) > 10
--order by COUNT(o.OrderID) desc


---- 8. On closer inspection, a list of the 10 customers with the highest turnover would be better.
----    Adjust previous query and just include the 3 best customers.

--select top 3 o.CustomerID, COUNT(o.OrderID) AS NrOfOrders
--from Orders o
--group by CustomerID
--having COUNT(o.OrderID) > 10
--order by COUNT(o.OrderID) desc


---- 9. For the annual planning, the Purchasing department wants an overview of the top days in 2016
----    with a total sales volume of more than 1 order per day.


--select o.OrderDate, COUNT(o.OrderID) AS NrOfOrders
--from Orders o
--where DATEPART(YEAR, o.OrderDate) = 2016 -- deze niet vergeten!! enkel 2016
--group by o.OrderDate
--having COUNT(o.OrderID) > 1


---- 10. The report above is not satisfactory.
----     It would be more interesting to trace the top month.
----     Adjust the query to show only the best month with the number of orders.
----     Make sure the month is written full! Do this for 2018

--select top 1 DATENAME(MONTH, o.OrderDate) AS TopMonth, COUNT(o.OrderID) AS NrOfOrders
--from Orders o
--where DATEPART(YEAR, o.OrderDate) = 2018
--group by DATENAME(MONTH, o.OrderDate)
--order by COUNT(o.OrderID) desc
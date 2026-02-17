use Northwind2019

---- 1. Create a phone book with customers and suppliers as shown below.

--select c.CompanyName, c.ContactName, c.ContactTitle, 'Customer' as ContactType, c.Phone, c.Fax
--from Customers c

--union

--select s.CompanyName, s.ContactName, s.ContactTitle, 'Supplier' as ContactType, s.Phone, s.Fax
--from Suppliers s


---- 2. Show countries and regions that occur both in Customers and Suppliers The empty region doesn't count.

--select c.Country, c.Region
--from Customers c
--where c.Region is not NULL

--intersect

--select s.Country, s.Region
--from Suppliers s
--where s.Region is not NULL


---- 3. From the overview below, use a union to add the total line. The TOTAL can be obtained by this code:
----     select 'zz TOTAL', sum(UnitsInStock)
----     from products

--select p.ProductName, p.UnitsInStock
--from Products p

--union

--select 'zz TOTAL', SUM(p.UnitsInStock)
--from Products p


---- 4. Create the overview below, of regions of suppliers where no customers are located. The empty region doesn't count.

--select s.Country, s.Region
--from Suppliers s
--where s.Region is not NULL

--except

--select c.Country, c.Region
--from Customers c
--where c.Region is not NULL


---- 5. Display a list of all names (company names) of both employees and customers (name of the company).
----    Next, make the list better by adding rows and columns:
----    - 1st column: name of the employee or the name of the company (customer)
----    - 2nd column: date of the order
----    - 3th column: city of employee/customer
----    - 4th column: C for Customer; E for Employee.

--select e.LastName as 'Naam', o.OrderDate, e.City, 'E' as 'Type'
--from Employees e
--inner join Orders o
--on e.EmployeeID = o.EmployeeID

--union

--select c.CompanyName, o.OrderDate, c.City, 'C' as 'Type'
--from Customers c
--inner join Orders o
--on c.CustomerID = o.CustomerID

--order by City


-- 6. Show the suppliers and products as shown below, limited to Beverages and Condiments.

--select s.CompanyName, p.ProductName, cat.CategoryName
--from Suppliers s
--inner join Products p
--on s.SupplierID = p.SupplierID
--inner join Categories cat
--on p.CategoryID = cat.CategoryID
--where cat.CategoryName = 'Beverages'

--union

--select s.CompanyName, p.ProductName, cat.CategoryName
--from Suppliers s
--inner join Products p
--on s.SupplierID = p.SupplierID
--inner join Categories cat
--on p.CategoryID = cat.CategoryID
--where cat.CategoryName = 'Condiments'


---- 7. Starting from the previous query, show only the suppliers that supply both categories.

--select s.CompanyName
--from Suppliers s
--join Products p
--on s.SupplierID = p.SupplierID
--join Categories cat
--on p.CategoryID = cat.CategoryID
--where cat.CategoryName = 'Beverages'

--intersect

--select s.CompanyName
--from Suppliers s
--join Products p
--on s.SupplierID = p.SupplierID
--join Categories cat
--on p.CategoryID = cat.CategoryID
--where cat.CategoryName = 'Condiments'


---- 8. Show the companies that deliver products from the category Beverages but not from the category Condiments

--select s.CompanyName
--from Suppliers s
--join Products p
--on s.SupplierID = p.SupplierID
--join Categories cat
--on p.CategoryID = cat.CategoryID
--where cat.CategoryName = 'Beverages'

--except

--select s.CompanyName
--from Suppliers s
--join Products p
--on s.SupplierID = p.SupplierID
--join Categories cat
--on p.CategoryID = cat.CategoryID
--where cat.CategoryName = 'Condiments'


---- 9. Show the names of the employees who have registered orders of the product Chang (77 rows)
----    and who have customers in Charleroi (23 rows). Result set: 7 rows.

--select e.LastName
--from Employees e
--inner join Orders o
--on e.EmployeeID = o.EmployeeID
--inner join [Order Details] od
--on o.OrderID = od.OrderID
--inner join Products p
--on od.ProductID = p.ProductID
--where p.ProductName = 'Chang'

--intersect

--select e.LastName
--from Employees e
--inner join Orders o
--on e.EmployeeID = o.EmployeeID
--inner join Customers c
--on o.CustomerID = c.CustomerID
--where c.City = 'Charleroi'

--order by e.LastName


---- 10. Show in 1 table: the number of customers, the number of products and the number of employees.

--select 'Customers' as 'Groep', count(*) as 'Aantal'
--from Customers

--union

--select 'Employees', count(*)
--from Employees

--union

--select 'Products', count(*)
--from Products


---- 11. Show the revenue per customer per month.
----     In the same query, show the subtotal per customer and also the overall total.
----     Limit the results to orderyear 2017

---- revenue = unitcost * quantity * (1 - discount)

--select c.ContactName, cast(month(o.OrderDate) as varchar(10)) as 'Month', sum(od.UnitPrice * od.Quantity) as 'Revenue'
--from Customers c
--inner join Orders o
--on c.CustomerID = o.CustomerID
--inner join [Order Details] od
--on o.OrderID = od.OrderID
--where DATEPART(year, o.OrderDate) = 2017
--group by c.ContactName, month(o.OrderDate)

--union

--select c.ContactName, 'Subtotaal', sum(od.UnitPrice * od.Quantity) as 'Revenue'
--from Customers c
--inner join Orders o
--on c.CustomerID = o.CustomerID
--inner join [Order Details] od
--on o.OrderID = od.OrderID
--where DATEPART(year, o.OrderDate) = 2017
--group by c.ContactName

--union all

--select null, 'Totaal', sum(od.UnitPrice * od.Quantity) as 'Revenue'
--from Orders o
--inner join [Order Details] od
--on o.OrderID = od.OrderID
--where DATEPART(year, o.OrderDate) = 2017


-- 12. Bereken per product de effectieve winst (bekijk ook de kost per product eenheid)
--     Deze berekening gebeurt alleen voor de producten waarvan de kost maximaal 5% hoger of lager is dan de gemiddelde kost van alle producten.
--     Toon ook enkel de producten waarvan de effectieve winst meer dan 10000 is.


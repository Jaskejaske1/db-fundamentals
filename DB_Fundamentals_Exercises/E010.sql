---- 1. Show all the data from the Product table.

--use Northwind2019
--select * from Products p


---- 2. Show all the data from the Customers table.

--use Northwind2019
--select * from Customers c


---- 3. Show company name, contact name and country from the Customers table.

--use Northwind2019
--select c.CompanyName, c.ContactName, c.Country
--from Customers c

---- 4. Show all Shippers (courier companies) sorted by name.

--use Northwind2019
--select *
--from Shippers s
--order by s.CompanyName

---- 5. Show company name, country and city from the Customers table. Sort by country and then by city.

--use Northwind2019
--select c.CompanyName, c.Country, c.City
--from Customers c
--order by c.Country, c.City

---- 6. Show all data of the first 3 records of Categories.

--use Northwind2019
--select top 3 *
--from Categories

---- Question: why should we consider this to be a "bad" question?
---- Answer: "the first 3 records" is not exact enough

---- 7. Show all countries from the Suppliers table. Each country must only occur once.

--use Northwind2019
--select distinct s.Country
--from Suppliers s

---- 8. Display all countries and contact titles from the Suppliers table. Each combination must be unique.

--use Northwind2019
--select distinct s.Country, s.ContactTitle
--from Suppliers s

---- 9. Show all dates on which at least one order was registered. Each date must be unique.

--use Northwind2019
--select distinct o.OrderDate
--from Orders o

---- 10. Sort the table Employees descending on land and ascending on city. Then, from the first record, show name and first name.

--use Northwind2019
--select top 1 e.FirstName, e.LastName
--from Employees e
--order by e.Country desc, e.City asc
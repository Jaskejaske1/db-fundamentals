---- 1. Show the name and first name of the 'Mr.' employees.

--use Northwind2019
--select e.LastName, e.FirstName
--from Employees e
--where e.TitleOfCourtesy like 'Mr.'


---- 2. Show all the details of the orders placed after 10 July 2016.
---- => 1212 rows

--use Northwind2019
--select *
--from Orders o
--where o.OrderDate > '2016-07-10'


---- 3. idem, now ordered by ID of the customer.
--use Northwind2019
--select *
--from Orders o
--where o.OrderDate > '2016-07-10'
--order by o.CustomerID


---- 4. Which customers are located in Paris? Make an alphabetical list of the company names of these customers.

--use Northwind2019
--select c.CompanyName
--from Customers c
--where c.City = 'Paris'
--order by c.CompanyName


---- 5. Which employees started working after 1 January 2014?
---- Make a list of those employees with the surname, job title and date of employment.

--use Northwind2019
--select e.LastName, e.Title, e.HireDate
--from Employees e
--where e.HireDate > '2014-01-01'


----  6. A customer asks information about an order of 4 October 2016.
---- The financial service wants to see all the details of that order.

---- Because an order consists of a record in the Order Table (Orders)
---- and the associated order lines (details) from the table (Order Details),
---- we need two queries here (later we will see how we can solve this in one query).

---- First create a list with all orders on October 4, 2016. You will see, only one order was placed on that day.
---- Memorize that OrderID. 

--use Northwind2019
--select *
--from Orders o
--where o.OrderDate = '2016-10-04'

---- => output (OrderID): 11285


---- 7. Next, query Order details to see the order lines of that order.

--use Northwind2019
--select *
--from [Order Details] od
--where od.OrderID = 11285


---- 8. For which employees (surname and first name) is the region unknown?

--use Northwind2019
--select e.LastName, e.FirstName
--from Employees e
--where e.Region is NULL


---- 9. Show address details of all customers whose zip code starts with a W

--use Northwind2019
--select c.CompanyName, c.Address, c.PostalCode, c.Country
--from Customers c
--where c.PostalCode like 'w%'


---- 10. Show address details for all customers whose second character of the zip code is A or X,
----     sort by country and then by postcode but when sorting refer to the place in the SELECT list.

--use Northwind2019
--select c.CompanyName, c.Address, c.PostalCode, c.Country
--from Customers c
--where c.PostalCode like '_A%' or c.PostalCode like '_X%'
--order by 4, 3


---- 11. Show name of the suppliers whose fax is not known. Sort by company name Z->A.

--use Northwind2019
--select s.CompanyName
--from Suppliers s
--where s.Fax is NULL
--order by s.CompanyName desc


---- 12. The same as the previous question, but where the fax is known.

--use Northwind2019
--select s.CompanyName
--from Suppliers s
--where s.Fax is not NULL
--order by s.CompanyName desc

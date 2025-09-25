---- 1. Show all the data, as depicted below, of the 'Sales' customers
----    (ie. ContactTitle starts with ‘Sales …’) located in Germany and France.

--use Northwind2019
--select c.CustomerID, c.CompanyName, c.ContactName, c.ContactTitle, c.Address
--from Customers c
--where c.ContactTitle like 'Sales%' and c.Country in ('Germany', 'France')


---- 2. Show all customer data except the data from previous exercise.x

--use Northwind2019
--select c.CustomerID, c.CompanyName, c.ContactName, c.ContactTitle, c.Address
--from Customers c
--where c.ContactTitle not like 'Sales%' and c.Country in ('Germany', 'France')


---- 3. Show the data of the female 'Sales representatives' (employees) and of the male 'Sales managers'.

--use Northwind2019
--select e.LastName, e.Title, e.TitleOfCourtesy
--from Employees e
--where (e.TitleOfCourtesy in ('Ms.', 'Mrs.', 'Dr.') and e.Title = 'Sales Representative')
--or (e.TitleOfCourtesy in ('Mr.', 'Dr.') and e.Title = 'Sales Manager')


---- 4. Show all customers (company name and contact name) where the contact name starts or ends with an A (a).

--use Northwind2019
--select c.CompanyName, c.ContactName
--from Customers c
--where c.ContactName like 'a%' or c.ContactName like '%a'


---- 5. Show all customers where fax or telephone is not entered. => 22 rows

--use Northwind2019
--select *
--from Customers c
--where c.Fax is NULL or c.Phone is NULL


---- 6. Show all of the following products: CHAI, KONBU, TOFU sorted descented by name for the below table.

--use Northwind2019
--select *
--from Products p
--where p.ProductName in ('CHAI', 'KONBU', 'TOFU')
--order by p.ProductName desc


---- 7. Show all orders for which the shippeddate is between 8 September and 9 October 2016. => 22 rows

--use Northwind2019
--select *
--from Orders o
--where o.ShippedDate between '2016-09-08' and '2016-10-09'


---- 8. Show products that are sold per 10 or 32 units but for which the stock quantity > 10.
----    (first have a look at the format of the QuantityPerUnit).

--use Northwind2019
--select p.ProductName, p.QuantityPerUnit, p.UnitsInStock
--from Products p
--where (p.QuantityPerUnit like '10 %' or p.QuantityPerUnit like '32 %') and p.UnitsInStock > 10

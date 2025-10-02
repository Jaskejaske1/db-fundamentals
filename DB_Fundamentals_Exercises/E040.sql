use Northwind2019

---- 1. How many customers are there? Give a suitable name to the column.
--select COUNT(*) AS 'Customers'
--from Customers c


---- 2. And how many customers are living in Germany?
--select COUNT(*) AS 'Customers from DE'
--from Customers c
--where c.Country = 'Germany'


---- 3. How many units on order have been ordered with the suppliers for all products?
--select sum(p.UnitsOnOrder)
--from Products p


-- 4. What is the average unit cost of the products that are currently not on order with the suppliers?
--select AVG(p.CurrentUnitCost)
--from Products p
--where p.UnitsOnOrder = 0;


---- 5. Show the maximum discount granted ever for a product (that has been) ordered by a customer.
--select MAX(od.Discount)
--from [Order Details] od


---- 6. Show the total value of all the orders of the customers, discount included.
----    Round in a second step this number to an integer.


--select ROUND(SUM(od.UnitPrice * (1 - od.Discount) * od.Quantity), 0) AS 'Turnover'
--from [Order Details] od

---- 7. Show a list of OrderId, UnitPrice, Quantity and Total based on the Order details table.
----    Total is a column that is calculated on the basis of UnitPrice and Quantity.
----    We want to see as title ‘Turnover’ at the top of the calculated column.


--select od.OrderID, od.UnitPrice, od.Quantity, od.UnitPrice * od.Quantity AS 'Turnover'
--from [Order Details] od


---- 8. Display a list of the names of the employees with the age (approximately) at which they were recruited with an appropriate column title.

--select e.LastName, e.FirstName, DATEDIFF(year, e.BirthDate, e.HireDate) as 'AgeHired'
--from Employees e


---- 9. Display a list of the product names, unit price, new price based on the Products table.
----    The new price is obtained by a 2% increase on the unit price.

--select p.ProductName, p.CurrentUnitPrice, p.CurrentUnitPrice * (1 + 0.02) AS 'UnitPriceIncrease'
--from Products p


---- 10. Show the same list again but with the new price (increase of 2%) rounded to 0 decimal places.

--select p.ProductName, p.CurrentUnitPrice, ROUND(p.CurrentUnitPrice * (1 + 0.02), 0) AS 'UnitPriceIncrease'
--from Products p


-- 11. Based on exercise 10, show the names of the products of which the new price will exceed 50.

--select p.ProductName, p.CurrentUnitPrice, ROUND(p.CurrentUnitPrice * (1 + 0.02), 0) AS 'NewUnitPrice'
--from Products p
--where ROUND(p.CurrentUnitPrice * (1 + 0.02), 0) > 50


-- 12. Of how many employees do we know the region?

--select count(e.Region) as 'Nr. of Regions'
--from Employees e


---- 13. Show for each employee his new identification code consisting of the first 2 letters of his family name
----     and the first letter of his first name, all in capital letters. Use an appropriate column title.

--select UPPER(SUBSTRING(e.LastName, 1, 2) + SUBSTRING(e.FirstName, 1, 1)) AS empCode
--from Employees e

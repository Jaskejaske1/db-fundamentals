use Northwind2019

---- 1. Which products are supplied by the supplier 'Pavlova, ltd.'

--select p.ProductID, p.ProductName from Products p
--where p.SupplierID in
--(
--select s.SupplierID from Suppliers s
--where s.CompanyName = 'Pavlova, Ltd.'
--)


---- 2. How much 'Tofu' was sold?

--select SUM(od.Quantity) as 'aantal keer tofu'
--from [Order Details] od
--where od.ProductID in
--(
--select p.ProductID from Products p
--where p.ProductName = 'Tofu'
--)


---- 3. How many orders were taken by Robert King in May 2017?

--select COUNT(o.OrderID) as 'NrOrdersKing'
--from Orders o
--where o.OrderDate between '2017-05-01' and '2017-05-31' and o.EmployeeID in
--(
--select e.EmployeeID from Employees e
--where e.LastName = 'King' and e.FirstName = 'Robert'
--)


---- 4. Which products of category 'Confections' are currently on order?

--select p.ProductID, p.ProductName, p.UnitsOnOrder
--from Products p
--where p.UnitsOnOrder > 0 and p.CategoryID in
--(
--select c.CategoryID from Categories c
--where c.CategoryName = 'Confections'
--)


---- 5. Show the names of all products having the same unit price as 'Chang'.

--select p.ProductName
--from Products p
--where p.ProductName <> 'Chang' and p.CurrentUnitPrice in
--(
--select p.CurrentUnitPrice
--from Products p
--where p.ProductName = 'Chang'
--)


---- 6. Show a list of the products costing more than 'Tofu'.

--select p.ProductName from Products p
--where p.CurrentUnitPrice >
--(
--select p.CurrentUnitPrice
--from Products p
--where p.ProductName = 'Tofu'
--)


---- 7. Display a list of all customers who have placed more than 15 orders.

--select c.CompanyName
--from Customers c
--where c.CustomerID in
--(
--select o.CustomerID
--from Orders o
--group by o.CustomerID
--having count(o.OrderID) > 15
--)


---- 8. Who was hired the most recently (multiple people possible)?

--select e.LastName
--from Employees e
--where e.HireDate =
--(
--select MAX(Hiredate)
--from Employees e
--)


---- 9. Which products have so far (never) been sold? So they do not appear in Order Detail.

--select p.ProductName from Products p
--where p.ProductID not in
--(
--select od.ProductID
--from [Order Details] od
--)


---- 10. What are, in terms of money, the largest order lines ever placed?

--select od.OrderID, od.ProductID, UnitPrice * Quantity as 'GrootsteOmzet'
--from [Order Details] od
--where UnitPrice * Quantity =
--(
--select MAX(od.UnitPrice * od.Quantity)
--from [Order Details] od
--)


---- 11. Which city do most customers come from? Make a subquery for this city.
----     And then show this city with the names of the customers.
----     (Do not use the name of the city in your query!) 

--select c.City, c.CompanyName
--from Customers c
--where c.City =
--(
--select top 1 c.City
--from Customers c
--group by c.City
--order by COUNT(c.City) desc
--)


---- 12. Display the product with the highest unit price.

--select p.ProductName
--from Products p
--where p.CurrentUnitPrice =
--(
--select MAX(p.CurrentUnitPrice)
--from Products p
--)


---- 13. Show the products that appear more than 50 times on an order line. Show the names of these products.

--select p.ProductName
--from Products p
--where p.ProductID in
--(
--select od.ProductID
--from [Order Details] od
--group by od.ProductID
--having COUNT(od.ProductID) > 50
--)


-- 14. Which customers do not have outstanding orders; show their names.

select c.CompanyName
from Customers c
where c.CustomerID not in
(
select o.CustomerID
from Orders o
)
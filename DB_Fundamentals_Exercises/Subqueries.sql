use Northwind2019

--select p.ProductID, p.ProductName from Products p
--where p.SupplierID in
--  (select s.SupplierID from Suppliers s where s.CompanyName = 'Ma Maison')

--select e.LastName, e.FirstName from Employees e
--where e.BirthDate in (select min(e.BirthDate) from Employees e)

---- niet gecorreleerde subquery
--select * from products p1  
--where p1.CurrentUnitPrice > 
--(select avg(p2.CurrentUnitPrice) from products p2)

---- gecorreleerde subquery
--select * from Products p1
--where p1.CurrentUnitPrice >
--(select avg(p2.CurrentUnitPrice) from Products p2
--where p1.CategoryID = p2.CategoryID)


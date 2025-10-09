use Northwind2019

---- 1. Copy the complete table Products to Products2 according to the above method. 
--select * into Products2 from Products


---- 2. Make a copy of Orders, and call it Orders2.
--select * into Orders2 from Orders


---- 3. There is no longer any cooperation with Belgium. Remove all records from Orders2 shipped to Belgium.
--delete from Orders2
--where ShipCountry = 'Belgium'


---- 4. Create a new food products table "Foodstuffs" that contains
----    the names and current unit price of all products from
----    the category 'seafood' (= categoryid 8) and 'beverages' (= categoryid 1).


--select p.ProductName, p.CurrentUnitPrice into Foodstuffs from Products p
--where p.CategoryID in (8, 1)


---- 5. Add all products (names and unit price) from category 'Condiments' (= categoryid 2)
----    to the table Foodstuffs.

--insert into Foodstuffs (ProductName, CurrentUnitPrice)
--select p.ProductName, p.CurrentUnitPrice
--from Products p
--where p.CategoryID = 2


---- 6. All orders (Orders2) of August 2017 (orderDate) get a shipped date of 10 days later (37 rows are being updated).

--UPDATE Orders2
--SET OrderDate = DATEADD(DAY, 10, OrderDate)
--WHERE OrderDate between '2017-08-01' and '2017-08-31'


---- 7. Make a copy of employees into Employees2.
--select * into Employees2 from Employees
--ALTER table Employees2 ADD Salary INT


---- 8. In Employees2, fill the column salary for everyone with the same standard value: 60.000.

--update Employees2
--set Salary = 60000


---- 9. In Employees2, all Sales Managers receive 20% on top of the standard salary (1-person, 72,000).

--update Employees2
--set Salary = Salary * 1.20
--where Title = 'Sales Manager'


---- 10. In Employees2, given that Anne Dodsworth is still under internship contract, only 10% of her salary will be paid.

--update Employees2
--set Salary = Salary * 0.10
--where LastName = 'Dodsworth' and FirstName = 'Anne'


---- 11. For Foodstuffs, add the following product: meatballs at a price of 12.
--insert into Foodstuffs (ProductName, CurrentUnitPrice)
--values ('Meatballs', 12)


-- 12. For orders2, add a new order from the customer ANATR handled by seller no. 3
--     with order date 30/10/2018 and shipped date 30/11/2018. 

--insert into Orders2(CustomerID, EmployeeID, OrderDate, ShippedDate)
--values('ANATR', 3, '2018-10-30', '2018-11-30')

--select * from Orders2
--where CustomerID = 'ANATR'


---- 13. The current unit price in products2 increases by 10%.

--update Products2
--set CurrentUnitPrice = CurrentUnitPrice * 1.10

--select * from Products2
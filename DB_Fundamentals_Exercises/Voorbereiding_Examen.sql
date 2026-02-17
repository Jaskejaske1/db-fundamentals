use Northwind2019

---- Oefening 1
----Geef de naam van de klant en de totale som van alle orders van de klanten die aan volgende voorwaarde voldoen:
----De klant heeft ooit ‘Chang' gekocht maar nog nooit 'Tofu'

----Exercise 1
----Give the name of the customer and the total sum of all orders from the customers who meet the following condition:
----The customer once bought 'Chang' but never 'Tofu'.

--select c.CompanyName, round(sum(od.Quantity * od.UnitPrice * (1 - od.Discount)), 0) as "totaleOmzet"
--from Customers c
--inner join Orders o
--on c.CustomerID = o.CustomerID
--inner join [Order Details] od
--on o.OrderID = od.OrderID
--group by c.CompanyName
--having c.CompanyName
--in
--(
--select c.CompanyName
--from Customers c inner join Orders o inner join [Order Details] od inner join Products p
--on p.ProductID = od.ProductID on od.OrderID = o.OrderID on o.CustomerID = c.CustomerID
--where p.ProductName = 'Chang'
--except
--select c.CompanyName
--from Customers c inner join Orders o inner join [Order Details] od inner join Products p
--on p.ProductID = od.ProductID on od.OrderID = o.OrderID on o.CustomerID = c.CustomerID
--where p.ProductName = 'Tofu'
--)
--order by c.CompanyName


--Oefening 2 - HEEL BELANGRIJK: DIT VRAAGT ZE ALTIJD!!!

--Som de klanten op die de hoogste omzet hebben binnen hun land. 

--Exercise 2
--List the customers who have the highest turnover within their country.

select distinct cust.Country, cust.CompanyName,
round(od.Quantity * od.UnitPrice * (1 - od.Discount), 0)
from Customers cust
inner join Orders o
inner join [Order Details] od
on od.OrderID = o.OrderID
on cust.CustomerID = o.CustomerID
where round(od.Quantity * od.UnitPrice * (1 - od.Discount), 0) =
(
select round(max(od.Quantity * od.UnitPrice * (1 - od.Discount)), 0)
from Customers cust1
inner join Orders o
inner join [Order Details] od
on od.OrderID = o.OrderID
on cust1.CustomerID = o.CustomerID
where cust.Country = cust1.Country
)


----Oefening 3
----Toon een overzicht van de werknemers en hun managers. Toon telkens voornaam en naam in 1 veld.

----Exercise 3
----Show an overview of the employees and their managers. Show first name and surname in 1 field.

---- eigen oplossing
--select emp.FirstName + ' ' + emp.LastName as 'Werknemer',
--(
--select man.FirstName + ' ' + man.LastName
--from Employees man
--where man.EmployeeID = emp.ReportsTo
--) as 'Manager'
--from Employees emp;

----docent oplossing
--select emp.FirstName + ' ' + emp.LastName as 'Werknemer',
--man.FirstName + ' ' + man.LastName as 'Manager'
--from Employees emp
--left join Employees man
--on emp.ReportsTo = man.EmployeeID


----Oefening 4
----Toon de koppel werknemers met dezelfde job. Haal de dubbele koppels eruit.

----Exercise 4
----Show the couple of employees with the same job. Remove the double couples.

--select
--emp1.FirstName + ' ' + emp1.LastName as Werknemer1,
--emp2.FirstName + ' ' + emp2.LastName as Werknemer2,
--emp1.Title as Functie

--from Employees emp1
--inner join Employees emp2 
--on emp1.Title = emp2.Title

--where emp1.EmployeeID < emp2.EmployeeID
--order by emp1.FirstName;


--Oefening 5

--Wat is de gemiddelde omzet van alle verkopers? 
--Tip Bereken eerst alle omzetten per verkoper. (title = ‘sales representative’).
--Neem dan het gemiddelde van deze getallen.   

----Exercise 5

----What is the average turnover of all sellers? 
----Tip First calculate all sales per salesperson. (title = 'sales representative').
----Then take the average of these numbers.   

--select round(avg(omzetten.som), 0)
--from
--(
--select (sum(od.Quantity * od.UnitPrice * (1 - od.Discount))) as som
--from Employees e
--inner join Orders o
--inner join [Order Details] od
--on od.OrderID = o.OrderID
--on o.EmployeeID = e.EmployeeID
--where e.Title = 'Sales Representative'
--group by e.EmployeeID
--) omzetten


----Oefening 6
----Welke verkopers hebben een grotere omzet dan het berekende gemiddelde uit de vorige oefn? 

----Exercise 6
----Which sellers have a higher turnover than the calculated average from the previous exercise?

--select e.FirstName, e.LastName, round(sum(od.Quantity * od.UnitPrice * (1 - od.Discount)), 0)
--from Employees e
--inner join Orders o
--inner join [Order Details] od
--on od.OrderID = o.OrderID
--on o.EmployeeID = e.EmployeeID
--where e.Title = 'Sales Representative'
--group by e.FirstName, e.LastName
--having sum(od.Quantity * od.UnitPrice * (1 - od.Discount)) >
--(
--select round(avg(omzetten.som), 0)
--from
--(
--select (sum(od.Quantity * od.UnitPrice * (1 - od.Discount))) as som
--from Employees e
--inner join Orders o
--inner join [Order Details] od
--on od.OrderID = o.OrderID
--on o.EmployeeID = e.EmployeeID
--where e.Title = 'Sales Representative'
--group by e.EmployeeID
--) omzetten
--)


----Oefening 7

----Tel hoeveel personeelsleden in aanmerking komen voor een eindejaarstoelage. De voorwaarden om een eindejaarstoelage te krijgen zijn:
-----	Voor verkopers (sales representative): meer verkocht hebben dan het gemiddelde totale verkoopbedrag per verkoper.
-----	Voor niet-verkopers: deze krijgen sowieso een eindejaarstoelage.

----Exercise 7
----Count how many staff members get an end-of-year bonus. The conditions for receiving the end-of-year bonus are as follows:
----- For sales representatives: having sold more than the average total sales amount per sales representative.
----- For non-sellers: they will in any case receive an end-of-year bonus.

---- use this as the base. Don't change anything of this.

--select 'Verkopers' "Wie?", count(*) "Hoeveel"
--from
--(select e.FirstName, e.LastName, round(sum(od.Quantity * od.UnitPrice * (1 - od.Discount)), 0) "totaal"
--from Employees e
--inner join Orders o
--inner join [Order Details] od
--on od.OrderID = o.OrderID
--on o.EmployeeID = e.EmployeeID
--where e.Title = 'Sales Representative'
--group by e.FirstName, e.LastName
--having sum(od.Quantity * od.UnitPrice * (1 - od.Discount)) >
--(
--select round(avg(omzetten.som), 0)
--from
--(
--select (sum(od.Quantity * od.UnitPrice * (1 - od.Discount))) as som
--from Employees e
--inner join Orders o
--inner join [Order Details] od
--on od.OrderID = o.OrderID
--on o.EmployeeID = e.EmployeeID
--where e.Title = 'Sales Representative'
--group by e.EmployeeID) omzetten)) a
--union
--select 'Niet verkopers', count(*) from Employees e where e.Title <> 'Sales Representative'
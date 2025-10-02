use Northwind2019

---- concatenation (niet met CONCAT functie)
--select e.FirstName + ' ' + e.LastName as 'FullName'
--from Employees e

--select left(e.FirstName, 3) + '. ' + e.LastName as 'ShortName'
--from Employees e

-- CHARINDEX
-- als het niet voorkomt, is charindex 0

--select CHARINDEX('manager', e.Title), Title -- op welke positie start het woord manager: 7
--from Employees e
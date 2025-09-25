use Northwind2019
select *
from Employees e
--where title like 'sales%' -- beginnen met sales, %: 0, 1, of meerdere tekens, masker
where e.LastName like '_e%' -- eerste positie maakt niet uit, tweede positie is een 'e', derde positie en verder mag meerdere karakters zijn
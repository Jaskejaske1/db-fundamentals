use Northwind2019
--select e.Title, COUNT(*)
--from Employees e
--group by Title

---- express een fout maken
--select e.Region, e.Title, COUNT(*) -- region mag hier dus niet
---- Column 'Employees.Region' is invalid in the select list because it is not contained in either an aggregate function or the GROUP BY clause.
---- ofwel staat er een aggregate functie rond Region, ofwel moet die ook in GROUP BY
--from Employees e
--group by Title

---- dus dit kan, maar dan worden er groepjes gemaakt die unieke combinaties zijn tussen Region en Title
--select e.Region, e.Title, COUNT(*)
--from Employees e
--group by Title, Region

select e.Title, COUNT(*)
from Employees e
group by Title
having COUNT(*) > 1
-- mag niet: where count(*) > 1, want where is een selectie van rijen, bevat nooit een conditie
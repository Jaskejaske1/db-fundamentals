use Northwind2019
---- SUM
--select sum(p.CurrentUnitCost) as "Sum" -- telt alle rijen van die kolom op
--from Products p

-- AVG
-- rijen in region kolom zijn niet allemaal ingevuld
select count(*) from Employees -- aantal rijen in Employees: 9
select count(region) from Employees -- aantal regions ingevuld in Employees: 5
select count(distinct region) from Employees -- 1: aantal verschillende regions ingevuld in Employees: 1
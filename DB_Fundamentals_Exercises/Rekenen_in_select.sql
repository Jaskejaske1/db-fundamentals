use Northwind2019

SELECT ProductName, UnitsInStock * CurrentUnitPrice as "totale omzet"
FROM Products WHERE (UnitsInStock + UnitsOnOrder)> 120;
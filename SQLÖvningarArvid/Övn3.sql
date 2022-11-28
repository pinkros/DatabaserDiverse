USE everyloop;

SELECT Region, Country, City
	, COUNT(Id) as Customers1 FROM company.customers
GROUP BY Region, Country, City
HAVING COUNT(Id)>1
ORDER BY Customers1 DESC;

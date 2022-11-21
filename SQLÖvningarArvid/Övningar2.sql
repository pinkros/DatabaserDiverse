USE everyloop;

SELECT DISTINCT ProductName FROM company.products
	JOIN company.order_details on company.order_details.OrderId = company.orders.Id 
	JOIN company.products on company.products.Id = company.order_details.ProductId
	WHERE company.orders.ShipCity LIKE 'London'
-- В рамках БД "онлайн-магазин" напишите след/запросы:

-- Найти мин/стоимость товаров для каждой категории

SELECT 
Categories.CategoryName,
MIN(Price) AS min_price
FROM Products
JOIN Categories ON Products.CategoryID=Categories.CategoryID
GROUP BY Categories.CategoryID
ORDER BY min_price DESC

-- Вывести названия категорий, в которых более 10 товаров

SELECT Categories.CategoryName
FROM Products
JOIN Categories ON Products.CategoryID = Categories.CategoryID
GROUP BY Categories.CategoryID
HAVING COUNT(*) > 10

-- Вывести три самых дешевых заказа

SELECT 
Orders.OrderID,
Products.ProductID,
Products.Price
FROM Orders
JOIN OrderDetails ON OrderDetails.OrderID = Orders.OrderID
JOIN Products ON Products.ProductID = OrderDetails.ProductID
GROUP BY Orders.OrderID
ORDER BY SUM(OrderDetails.Quantity * Products.Price)
LIMIT 3

-- Вывести имена и фамилии (и ко-во заказов) менеджеров, у которых ко-во заказов менее 15

SELECT 
Employees.LastName,
Employees.FirstName,
OrderDetails.Quantity,
COUNT(*) OrdersQuantity_total
FROM Employees
JOIN Orders ON Orders.EmployeeID = Employees.EmployeeID
JOIN OrderDetails ON OrderDetails.OrderID = Orders.OrderID
GROUP BY Orders.EmployeeID
HAVING OrdersQuantity_total < 15

-- Вывести ТОП-1 стран по ко-ву клиентов

SELECT Country
FROM Customers
GROUP BY Customers.Country
ORDER BY COUNT(*) DESC
LIMIT 1
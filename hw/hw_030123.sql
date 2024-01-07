-- В рамках БД "песочница" напишите следующие запросы:

-- Задача 1. Вывести ко-во товаров с ценой от 10 до 250 EUR

SELECT 
  COUNT(*) AS total_products
FROM Products

WHERE
  Price BETWEEN 10 AND 250

-- Задача 2. Вывести ко-во поставщиков не из UK и не из 

SELECT
COUNT(*) AS total_not_uk_china_suppliers
FROM Suppliers

WHERE
	NOT Country IN ('UK', 'China')

-- Задача 3. Вывести среднюю/MAX/MIN стоимости и ко-во товаров из категорий 3 и 5

SELECT 
AVG(Price) AS avg_price,
MAX(Price) AS max_price,
MIN(Price) AS min_price,
COUNT(*) AS total_products
FROM Products

WHERE CategoryID IN(3, 5)

-- Задача 4. Вывести общую сумму проданных товаров

SELECT
    SUM(Products.Price * OrderDetails.Quantity) AS order_sum

FROM OrderDetails

JOIN Products ON OrderDetails.ProductID = Products.ProductID

-- Задача 5. Вывести данные о заказах (номер_заказа, имя_клиента, страна_клиента, фамилия_менеджера, название_компании_перевозчика)

SELECT
Orders.OrderID AS order_num,
Customers.CustomerName AS customer_name,
Customers.Country AS customer_country,
Employees.LastName AS emp_last_name,
Shippers.ShipperName AS shipper_name

FROM Orders

JOIN Customers ON Orders.CustomerID = Customers.CustomerID
JOIN Employees ON Orders.EmployeeID = Employees.EmployeeID
JOIN Shippers ON Orders.ShipperID = Shippers.ShipperID

-- Задача 6. Вывести сумму, на которую было отправлено товаров клиентам в Germany

SELECT 
SUM(Products.Price * OrderDetails.Quantity) AS order_sum_germany
FROM OrderDetails
JOIN Products ON OrderDetails.ProductID = Products.ProductID
JOIN Suppliers ON Products.SupplierID = Suppliers.SupplierID
WHERE Country = 'Germany'
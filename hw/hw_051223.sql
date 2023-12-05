-- В рамках БД "песочница: интернет-магазин" напишите след/запросы:

-- Задача 1. Вывести название и стоимость в USD одного самого дорогого проданного товара

SELECT 
Products.ProductName,
Products.Price AS Price_EUR,
Products.Price * 1.0709 AS Price_USD
FROM Products

ORDER BY Price DESC
LIMIT 1;

-- Задача 2. Вывести два самых дорогих товара из категории Beverages из USA

SELECT * 
FROM Categories

JOIN Products ON Categories.CategoryID = Products.CategoryID
JOIN Suppliers ON Suppliers.SupplierID = Products.SupplierID

WHERE Suppliers.Country = 'USA' AND  Categories.CategoryName = 'Beverages'

ORDER BY Price DESC
LIMIT 2

-- Products  ------> CategoryID ---- ProductID ---- SupplierID
-- Categories -----> CategoryID
-- Suppliers -------------------------------------> SupplierID

-- Задача 3. Вывести список стран, которые поставляют морепродукты

SELECT 
Suppliers.Country
FROM Products

JOIN Categories ON Categories.CategoryID = Products.CategoryID
JOIN Suppliers ON Suppliers.SupplierID = Products.SupplierID

WHERE Categories.CategoryName = 'Seafood'
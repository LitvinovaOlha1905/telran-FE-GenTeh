-- В рамках БД "песочница" выведите З/П каждого менеджера, исходя из ставки в 5% от суммы заказов

use w3schools;

SELECT employees.FirstName, employees.LastName, sum(products.Price*order_details.Quantity) * 0.05 As Salary
FROM employees 
JOIN orders ON employees.EmployeeID = orders.EmployeeID
JOIN order_details ON orders.OrderID = order_details.OrderID
JOIN products ON products.ProductID = order_details.ProductID
GROUP BY orders.EmployeeID;


-- Используя MySQL WorkBench (или аналогичный инструмент) создайте БД music (сервис онлайн-музыки) и в рамках нее таблицы users, tracks с полями на Ваше усмотрение

create database music;
use music;

CREATE TABLE users (
    user_id INT PRIMARY KEY, -- Уникальный идентификатор пользователя
    username VARCHAR(50), -- Имя пользователя
    email VARCHAR(100), -- Электронная почта пользователя
    password_hash VARCHAR(100), -- Хэш пароля пользователя
    registration_date DATE, -- Дата регистрации пользователя
    last_login_date DATE, -- Дата последнего входа пользователя
    full_name VARCHAR(100), -- Полное имя пользователя
    date_of_birth DATE, -- Дата рождения пользователя
    country VARCHAR(50) -- Страна проживания пользователя
);

CREATE TABLE tracks (
    track_id INT PRIMARY KEY, -- Уникальный идентификатор трека
    title VARCHAR(100), -- Название трека
    artist VARCHAR(100), -- Исполнитель трека
    album VARCHAR(100), -- Название альбома, к которому принадлежит трек
    genre VARCHAR(50), -- Жанр трека
    release_date DATE, -- Дата выпуска трека
    duration_seconds INT, -- Продолжительность трека в секундах
    upload_date DATE, -- Дата загрузки трека в систему
    user_id INT -- Идентификатор пользователя, который загрузил трек
);
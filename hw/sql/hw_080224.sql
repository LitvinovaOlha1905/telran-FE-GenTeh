-- 1. Создать таблицу students(1)
-- firstname varchar not null
-- lastname varchar not null
-- age integer
-- subject varchar not null
-- mark numeric(2, 1) от 0 до 5

create table students
(
    firstname varchar(50)  not null,
    lastname  varchar(50)  not null,
    age       int,
    subject   varchar(100) not null,
    mark      numeric(2, 1) check ( mark between 0 AND 5)
);

-- 2. Добавить поле id уникальное значение, не null, автозаполнение в начало таблицы 

alter table students
    add column id int primary key auto_increment first;

-- 3. Изменить тип mark на integer

alter table students
    modify mark int;

-- 4. Удалить поле age

alter table students
    drop column age;

-- 5. Добавить поле class integer от 1 до 10, вставить после lastname

alter table students
    add class int check ( class between 1 AND 10) after lastname;

-- 6. Заполнить таблицу строками (10 шт)

insert into students(firstname, lastname, class, subject, mark)
values ('Ivan', 'Ivanov', 1, 'test1', 0),
       ('Serhei', 'Shul', 2, 'test1', 1),
       ('Maxim', 'Abramenko', 1, 'test2', 2),
       ('Inna', 'Hot', 2, 'test3', 3),
       ('Anjei', 'Siniza', 1, 'test4', 0),
       ('Valerii', 'Koval', 3, 'test5', 5),
       ('Vlad', 'Abrashyn', 4, 'test6', 4),
       ('Helen', 'Li', 5, 'test1', 3),
       ('Van', 'Ho', 2, 'test2', 0),
       ('Anna', 'Avramova', 1, 'test1', 0);

-- 7. Удалить из таблицы студентов, у которых оценка 0

delete from students
where mark=0;

-- 8. Найти всех студентов, у которых оценка выше 3

SELECT *
FROM students
WHERE mark>3;

-- 9. Найти всех студентов, которые учатся в первом классе и у них оценка меньше 3

SELECT *
FROM students
WHERE class=1 AND mark<3;

-- 10. Удалить из таблицы этих студентов

delete
FROM students
WHERE class=1 AND mark<3;

-- 11. Найти всех студентов, у которых длина имени больше 4 букв

SELECT *
FROM students
WHERE firstname LIKE '_____%';

-- 12. Найти всех студентов, у которых фамилия начинается с буквы "a" и имеет длину не менее 3 символов.

SELECT *
FROM students
WHERE lastname like 'a__%';

-- 13. Удалить таблицу.

drop table students;
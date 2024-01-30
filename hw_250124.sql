-- Ссылка на создание БД: https://github.com/NelliEfr/hr_data/blob/master/script.sql

-- Найти количество сотрудников в каждом департаменте. Вывести departmentid и employeescnt

SELECT department_id, COUNT(*) AS employees_cnt
FROM employees
GROUP BY department_id;

-- Найти количество сотрудников в каждом департаменте. Вывести departmentname и employeescnt

SELECT department_name, COUNT(*) AS employees_cnt
FROM employees
JOIN departments ON employees.department_id = departments.department_id
GROUP BY department_name;

-- Найти количество сотрудников у каждого менеджера. Вывести managerid и employeescnt

SELECT manager_id, COUNT(*) AS employees_cnt
FROM employees
GROUP BY manager_id;

-- Найти количество сотрудников у каждого менеджера. Вывести firstname,  lastname и employees_cnt

SELECT first_name, last_name, managers.cnt AS employees_cnt
FROM employees
JOIN (select manager_id, COUNT(*) cnt
FROM employees
GROUP BY manager_id) managers
ON employees.manager_id = managers.manager_id;

-- Найти максимальную зарплату в каждом департаменте. Вывести departmentid и maxsalary

SELECT employees.department_id, MAX(employees.salary) AS max_salary
FROM employees
GROUP BY employees.department_id;

-- Найти сотрудников, у которых наибольшая зарплата в их департаменте

SELECT employees.department_id, first_name, last_name, employees.salary
FROM employees
JOIN (select employees.department_id, MAX(employees.salary) max_salary
FROM employees
GROUP BY employees.department_id) empl_salary
ON empl_salary.department_id = employees.department_id
WHERE employees.salary = empl_salary.max_salary;

-- Найти департаменты, в которых больше 10 сотрудников. Вывести department_name

SELECT departments.department_name
FROM departments
JOIN (select employees.department_id, COUNT(*) cnt
FROM employees
GROUP BY employees.department_id) AS dprtmnt
ON dprtmnt.department_id = departments.department_id
WHERE dprtmnt.cnt > 10;
-- 1. Выберите все строки из таблицы suppliers. Предварительно подключитесь к базе данных northwind
USE northwind;

SELECT
    *
FROM
    suppliers;

-- 2. Выберите только те строки из таблицы suppliers где company имеет значение Supplier A
SELECT
    *
FROM
    northwind.suppliers
WHERE
    company = 'Supplier A';

-- 3. Выберите все строки из таблицы purchase_orders
SELECT
    *
FROM
    northwind.purchase_orders;

-- 4. Выберите только те строки из таблицы purchase_orders  где supplier_id = 2    
SELECT
    *
FROM
    northwind.purchase_orders
WHERE
    supplier_id = 2;

-- 5. Выберите supplier_id и shipping_fee из purchase_orders там где 
-- created_by равно 1 и supplier_id равен 5 Объясните полученный результат
SELECT
    supplier_id,
    shipping_fee
FROM
    northwind.purchase_orders
WHERE
    created_by = 1
    AND supplier_id = 5;

-- Выборка не содержит данных потому, что в таблице purchase_orders нет записей которые удовлетворяют всем условиям фильтрации.
---------------------------------------------------------------------------------------
-- 6. Выберите last_name и first_name из таблицы employees
-- там где адрес address имеет значение 123 2nd Avenue или 123 8th Avenue
-- Напишите запрос двумя способами - с применением оператора OR и оператора IN
SELECT
    last_name,
    first_name
FROM
    northwind.employees
WHERE
    address = '123 2nd Avenue'
    OR address = '123 8th Avenue';

SELECT
    last_name,
    first_name
FROM
    northwind.employees
WHERE
    address IN ('123 2nd Avenue', '123 8th Avenue');

-- 7. Выведите все имена сотрудников, которые содержат английскую букву p в середине фамилии
SELECT
    first_name
FROM
    northwind.employees
WHERE
    last_name LIKE '_%p%_';

--8. Выберите все строки из таблицы orders там где нет информации о  shipper_id    
SELECT
    *
FROM
    northwind.orders
WHERE
    shipper_id IS NULL;
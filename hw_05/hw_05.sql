-- База данных northwind
USE northwind;

-- Работаем с таблицей purchase_order_details
-- 1 Посчитайте основные статистики - среднее, сумму, минимум, максимум столбца unit_cost
SELECT
    AVG(unit_cost) AS unit_cost_avg,
    SUM(unit_cost) AS unit_cost_sum,
    MIN(unit_cost) AS unit_cost_min,
    MAX(unit_cost) AS unit_cost_max,
    COUNT(unit_cost) AS unit_cost_count
FROM
    northwind.purchase_order_details;

-- 2 Посчитайте количество уникальных заказов purchase_order_id
SELECT
    COUNT(DISTINCT purchase_order_id) as unique_purchase_order_id_count,
    COUNT(purchase_order_id) as purchase_order_id_count
FROM
    northwind.purchase_order_details;

-- 3.Посчитайте количество продуктов product_id в каждом заказе purchase_order_id. Отсортируйте полученные данные по убыванию количества.
SELECT
    purchase_order_id,
    COUNT(DISTINCT product_id) AS count_product_id
FROM
    northwind.purchase_order_details
GROUP BY
    purchase_order_id
ORDER BY
    count_product_id DESC;

-- 4 Посчитайте заказы по дате доставки date_received Считаем только те продукты, количество quantity которых больше 30
SELECT
    COALESCE(date_received, 'not date received') AS date_received,
    COUNT(DISTINCT purchase_order_id) AS purchase_order_id_count
FROM
    northwind.purchase_order_details
WHERE
    quantity > 30
GROUP BY
    date_received
ORDER BY
    purchase_order_id_count DESC;

-- 5 Посчитайте суммарную стоимость заказов в каждую из дат Стоимость заказа - произведение quantity на unit_cost
SELECT
    COALESCE(date_received, 'not date received') AS date_received,
    SUM(quantity * unit_cost) AS order_cost_sum
FROM
    northwind.purchase_order_details
GROUP BY
    date_received
ORDER BY
    order_cost_sum DESC;

-- 6 Сгруппируйте товары по unit_cost и вычислите среднее и максимальное значение quantity только для товаров где purchase_order_id не больше 100
SELECT
    unit_cost,
    AVG(quantity) AS quantity_avg,
    MAX(quantity) AS quantity_max
FROM
    northwind.purchase_order_details
WHERE
    purchase_order_id <= 100
GROUP BY
    unit_cost
ORDER BY
    unit_cost DESC;

-- 7 Выберите только строки где есть значения в столбце inventory_id 
-- Создайте столбец category - если unit_cost > 20 то 'Expensive' в остальных случаях 'others' 
-- Посчитайте количество продуктов в каждой категории    
SELECT
    IF(unit_cost > 20, 'Expensive', 'others') AS category,
    COUNT(DISTINCT product_id) AS products_count
FROM
    northwind.purchase_order_details
WHERE
    inventory_id IS NOT NULL
GROUP BY    
    category
ORDER BY
    products_count DESC;
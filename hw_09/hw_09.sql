-- 1  Для каждого заказа order_id выведите минимальный, максимальный и средний unit_cost
SELECT
    purchase_order_id,
    MIN(unit_cost) OVER () AS min_unit_cost,
    MAX(unit_cost) OVER () AS max_unit_cost,
    AVG(unit_cost) OVER () AS avg_unit_cost
FROM
    northwind.purchase_order_details;

-- 2  Оставьте только уникальные строки из предыдущего запроса
SELECT DISTINCT
    purchase_order_id,
    MIN(unit_cost) OVER () AS min_unit_cost,
    MAX(unit_cost) OVER () AS max_unit_cost,
    AVG(unit_cost) OVER () AS avg_unit_cost
FROM
    northwind.purchase_order_details;

-- Что можно улучшить?
-- В 1 и 2 запросе: 
-- Вы не группируете по purchase_order_id, поэтому получаешь одни и те же значения min/max/avg для всех строк — по всей таблице.
-- Это не соответствует формулировке задания, где нужно агрегаты по каждому purchase_order_id    

-- 3 Посчитайте стоимость продукта в заказе как quantity*unit_cost 
-- Выведите суммарную стоимость продуктов с помощью оконной функции 
SELECT
    purchase_order_id,
    product_id,
    quantity * unit_cost AS full_products_cost,
    SUM(quantity * unit_cost) OVER (
        PARTITION BY
            purchase_order_id
    ) AS sum_product_cost_by_purchase_order_id
FROM
    northwind.purchase_order_details
ORDER BY
    purchase_order_id,
    product_id;

-- Сделайте то же самое с помощью GROUP BY      
WITH
    sum_product_cost_by_purchase_order_id AS (
        SELECT
            purchase_order_id,
            SUM(quantity * unit_cost) AS sum_product_cost_by_purchase_order_id
        FROM
            northwind.purchase_order_details
        GROUP BY
            purchase_order_id
    )
SELECT
    purchase_order_details.purchase_order_id,
    purchase_order_details.product_id,
    purchase_order_details.quantity * purchase_order_details.unit_cost AS full_products_cost,
    sum_product_cost_by_purchase_order_id.sum_product_cost_by_purchase_order_id
FROM
    northwind.purchase_order_details
    JOIN sum_product_cost_by_purchase_order_id ON sum_product_cost_by_purchase_order_id.purchase_order_id = purchase_order_details.purchase_order_id
ORDER BY
    purchase_order_details.purchase_order_id,
    purchase_order_details.product_id;

-- 4 Посчитайте количество заказов по дате получения и posted_to_inventory 
-- Если оно превышает 1 то выведите '>1' в противном случае '=1'
-- Выведите purchase_order_id, date_received и вычисленный столбец    
SELECT
    purchase_order_id,
    date_received,
    IF (
        COUNT(purchase_order_id) OVER (
            PARTITION BY
                date_received,
                posted_to_inventory
        ) > 1,
        '>1',
        '=1'
    ) AS count_orders_by_date_received_and_posted_to_inventory
FROM
    northwind.purchase_order_details
ORDER BY
    date_received;
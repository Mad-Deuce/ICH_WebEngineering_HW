-- 1.Вывести названия продуктов таблица products, включая количество заказанных единиц quantity для каждого продукта таблица order_details.
-- Решить задачу с помощью cte и подзапроса.
SELECT
    products.product_name,
    temp_table.sum_product_quantity
FROM
    northwind.products
    JOIN (
        SELECT
            product_id,
            SUM(quantity) AS sum_product_quantity
        FROM
            northwind.order_details
        GROUP BY
            product_id
        ORDER BY
            sum_product_quantity DESC
    ) AS temp_table ON products.id = temp_table.product_id;

WITH
    temp_table AS (
        SELECT
            product_id,
            SUM(quantity) AS sum_product_quantity
        FROM
            northwind.order_details
        GROUP BY
            product_id
        ORDER BY
            sum_product_quantity DESC
    )
SELECT
    products.product_name,
    temp_table.sum_product_quantity
FROM
    northwind.products
    JOIN temp_table ON products.id = temp_table.product_id;

-- 2  Найти все заказы таблица orders, сделанные после даты самого первого заказа клиента Lee таблица customers.  
WITH
    cte_min_order_date AS (
        SELECT
            MIN(order_date) AS min_order_date
        FROM
            northwind.orders
        WHERE
            customer_id IN (
                SELECT
                    id
                FROM
                    northwind.customers
                WHERE
                    last_name = 'Lee'
            )
    )
SELECT
    *
FROM
    northwind.orders
WHERE
    order_date >= (
        SELECT
            min_order_date
        FROM
            cte_min_order_date
    )
ORDER BY
    order_date;

-- 3 Найти все продукты таблицы  products c максимальным target_level
SELECT
    *
FROM
    northwind.products
WHERE
    target_level = (
        SELECT
            MAX(target_level)
        FROM
            northwind.products
    );
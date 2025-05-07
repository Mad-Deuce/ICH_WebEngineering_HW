-- 1 Выведите одним запросом с использованием UNION столбцы id, employee_id из таблицы orders и соответствующие им столбцы из таблицы purchase_orders 
-- В таблице purchase_orders  created_by соответствует employee_id
SELECT
    id,
    employee_id
FROM
    northwind.orders
UNION
SELECT
    id,
    created_by
FROM
    northwind.purchase_orders;

-- 2 Из предыдущего запроса удалите записи там где employee_id не имеет значения 
-- Добавьте дополнительный столбец со сведениями из какой таблицы была взята запись
SELECT
    id,
    employee_id,
    'orders' AS src_table
FROM
    northwind.orders
WHERE
    employee_id IS NOT NULL
UNION
SELECT
    id,
    created_by,
    'purchase_orders'
FROM
    northwind.purchase_orders
WHERE
    created_by IS NOT NULL;

-- 3 Выведите все столбцы таблицы order_details а также дополнительный столбец payment_method из таблицы purchase_orders 
-- Оставьте только заказы для которых известен payment_method
SELECT
    o_d.*,
    p_o.payment_method
FROM
    northwind.order_details o_d
    LEFT JOIN northwind.purchase_orders p_o ON o_d.purchase_order_id = p_o.id
WHERE
    p_o.payment_method IS NOT NULL;

-- 4 Выведите заказы orders и фамилии клиентов customers для тех заказов по которым были инвойсы таблица invoices
SELECT
    o.*,
    cs.last_name
FROM
    northwind.orders o
    INNER JOIN northwind.invoices i ON i.order_id = o.id
    LEFT JOIN northwind.customers cs ON o.customer_id = cs.id;

-- 5 Подсчитайте количество инвойсов для каждого клиента из предыдущего запроса    
SELECT
    cs.first_name,
    cs.last_name,
    COUNT(i.id) AS 'invoice-quantity'
FROM
    northwind.orders o
    INNER JOIN northwind.invoices i ON i.order_id = o.id
    LEFT JOIN northwind.customers cs ON o.customer_id = cs.id
GROUP BY
    cs.first_name,
    cs.last_name;
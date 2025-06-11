-- 1 Выберите только те строки из таблицы suppliers где company имеет значение Supplier A
SELECT
	*
FROM
	northwind.suppliers s
WHERE
	s.company = "Supplier A";

-- 2 Вывести все строки там, где purchase_order_id не указано. 
-- При этом дополнительно создать столбец total_price как произведение quantity * unit_price
SELECT
	*,
	quantity * unit_price as total_price
FROM
	northwind.order_details od
WHERE
	od.purchase_order_id IS NULL;

-- 3 Выведите какая дата будет через 51 день
SELECT
	DATE_ADD(CURDATE(), INTERVAL 51 DAY) as date_add51;

-- 4  Посчитайте количество уникальных заказов purchase_order_id
SELECT
	DISTINCT
	count(purchase_order_id) OVER () AS unique_purchase_order_id_quantity
FROM
	northwind.purchase_order_details pod
GROUP BY
	pod.purchase_order_id;

-- 5 Выведите все столбцы таблицы order_details, а также дополнительный столбец payment_method из таблицы purchase_orders 
--  Оставьте только заказы для которых известен payment_method
SELECT
	*,
	po.payment_method
FROM
	northwind.order_details od
LEFT JOIN northwind.purchase_orders po ON
	od.purchase_order_id = po.id
WHERE
	po.payment_method IS NOT NULL;



















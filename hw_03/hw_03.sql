-- 1. Выведите Ваш возраст на текущий день в секундах 
SELECT
    TO_SECONDS (CURDATE ()) - TO_SECONDS ('1984-02-11') AS age_in_seconds;

-- 2. Выведите какая дата будет через 51 день
SELECT
    DATE_ADD (CURDATE (), INTERVAL 51 DAY) AS date_in_51_days;

-- 3. Отформатируйте предыдущей запрос - выведите день недели для этой даты Используйте документацию My SQL
SELECT
    DAYNAME (DATE_ADD (CURDATE (), INTERVAL 51 DAY)) AS day_of_week_in_51_days;

-- 4.  Подключитесь к базе данных northwind 
-- Выведите столбец с исходной датой создания транзакции transaction_created_date из таблицы inventory_transactions, 
-- а также столбец полученный прибавлением 3 часов к этой дате
SELECT
    transaction_created_date,
    DATE_ADD (transaction_created_date, INTERVAL 3 HOUR) as date_plus_3_hours
FROM
    northwind.inventory_transactions;

-- 5. Выведите столбец с текстом  'Клиент с id <customer_id> сделал заказ <order_date>' из таблицы orders
-- Запрос написать двумя способами - с использованием неявных преобразований а также с указанием изменения типа данных для столбца customer_id
-- Внимание В MySQL функция CAST не принимает VARCHAR в качестве параметра для длины. Вместо этого, нужно использовать CHAR для указания длины. 
SELECT
    CONCAT_WS (
        ' ',
        'Клиент с id',
        customer_id,
        'сделал заказ',
        order_date
    ) AS notification_text,
    CONCAT_WS (
        ' ',
        'Клиент с id',
        CAST(customer_id AS CHAR(3)),
        'сделал заказ',
        order_date
    ) AS notification_text_cast
FROM
    northwind.orders;

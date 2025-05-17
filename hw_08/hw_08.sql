-- 1 Найдите все записи таблицы Printer для цветных принтеров.
SELECT
    *
FROM
    printer
WHERE
    color = 'y';

-- 2 Найдите номера моделей и цены всех имеющихся в продаже продуктов (любого типа) производителя B (латинская буква).
WITH
    product_detail AS (
        SELECT
            model,
            price
        FROM
            pc
        UNION
        SELECT
            model,
            price
        FROM
            laptop
        UNION
        SELECT
            model,
            price
        FROM
            printer
    )
SELECT
    product.model,
    product_detail.price
FROM
    product
    JOIN product_detail ON product.model = product_detail.model
WHERE
    product.maker = 'B';

-- 3 Найдите производителя, выпускающего ПК, но не ПК-блокноты.
SELECT
    maker
FROM
    product
WHERE
    model IN (
        SELECT
            model
        FROM
            pc
    );

-- 4 Найдите производителей ПК с процессором не менее 450 Мгц. Вывести: Maker
SELECT
    maker
FROM
    product
WHERE
    model IN (
        SELECT
            model
        FROM
            pc
        WHERE
            speed >= 450
    );

-- 5 Найдите среднюю скорость ПК.
SELECT
    AVG(speed)
FROM
    pc;

-- 6 Для каждого производителя, имеющего модели в таблице Laptop, найдите средний размер экрана выпускаемых им ПК-блокнотов.
-- Вывести: maker, средний размер экрана.
SELECT
    product.maker,
    AVG(laptop.screen)
FROM
    product
    JOIN laptop ON product.model = laptop.model
GROUP BY
    product.maker;
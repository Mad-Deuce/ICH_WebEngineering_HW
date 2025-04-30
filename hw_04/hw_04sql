/*
	1.Подключитесь к своей базе данных созданной на уроке.
	2.Создайте таблицу, которая отражает погоду в Вашем городе за последние 5 дней и включает следующее столбцы.
		●Id - первичный ключ, заполняется автоматически
		●Дата - не может быть пропуском
		●Дневная температура - целое число, принимает значения от -30 до 30
		●Ночная температура - целое число, принимает значения от -30 до 30
		●Скорость ветра - подумайте какой тип данных и ограничения необходимы для этого столбца.
*/
CREATE TABLE 041124_Zolotukhin.weather (
    employee_id INT AUTO_INCREMENT PRIMARY KEY,
    weather_date DATE UNIQUE NOT NULL,
    day_temp INT CHECK (day_temp BETWEEN -30 AND 50),
    night_temp INT CHECK (night_temp BETWEEN -30 AND 50),
    wind_speed_m_s DECIMAL(5, 2 ) CHECK (wind_speed_m_s BETWEEN 0 AND 120)
);


-- 3.Заполните таблицу 5 строками - за последние 5 дней.

INSERT INTO 041124_Zolotukhin.weather (weather_date, day_temp, night_temp, wind_speed_m_s)
VALUES 
(CURDATE(), 12, 4, 2.5),
(CURDATE() - INTERVAL 1 DAY, 10, 3, 4.5),
(CURDATE() - INTERVAL 2 DAY, 16, 6, 3.5),
(CURDATE() - INTERVAL 3 DAY, 9, -2, 0.5),
(CURDATE() - INTERVAL 4 DAY, 11, 0, 5.5);

-- 4 Увеличьте значения ночной температуры на градус если скорость ветра не превышала 3 м/с
UPDATE 041124_Zolotukhin.weather
SET night_temp = night_temp + 1
WHERE wind_speed_m_s <= 3;

-- 5 На основе полученной таблицы создайте представление в своей базе данных - включите все строки Вашей таблицы и дополнительно рассчитанные столбцы
--      Средняя суточная температура - среднее арифметическое между ночной и дневной температурами
--      Столбец на основе скорости ветра - 
            -- если скорость ветра не превышала 2 м/с то значение ‘штиль’, 
            -- от 2 включительно до 5 - ‘умеренный ветер’, 
            -- в остальных случаях - ‘сильный ветер’

CREATE VIEW 041124_Zolotukhin.weather_view AS
SELECT 
    employee_id,
    weather_date,
    day_temp,
    night_temp,
    wind_speed_m_s,
    (day_temp + night_temp) / 2 AS avg_temp,
    CASE 
        WHEN wind_speed_m_s < 2 THEN 'штиль'
        WHEN wind_speed_m_s < 5 THEN 'умеренный ветер'
        ELSE 'сильный ветер'
    END AS wind_caption
FROM 041124_Zolotukhin.weather;

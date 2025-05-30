/* 1. Функция для расчета площади круга */
DELIMITER //

CREATE FUNCTION circle_area(radius DOUBLE)
RETURNS DOUBLE
DETERMINISTIC
BEGIN
	RETURN PI() * radius * radius;
END;
//
DELIMITER ;

SELECT circle_area(5);
SELECT circle_area(8);

/* 2. Функция для расчета гипотенузы треугольника */
DELIMITER //

CREATE FUNCTION hypotenuse(katet_1 DOUBLE,katet_2 DOUBLE)
RETURNS DOUBLE
DETERMINISTIC
BEGIN
	RETURN SQRT(katet_1*katet_1+katet_2*katet_2);
END;
//
DELIMITER ;

SELECT hypotenuse(3, 4);












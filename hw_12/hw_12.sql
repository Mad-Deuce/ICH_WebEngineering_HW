-- 1 Вывести id департамента , в котором работает сотрудник, в зависимости от Id сотрудника
DELIMITER $$
CREATE PROCEDURE get_department_id_by_employee_id (IN employee_id_param INT)
BEGIN
    SELECT department_id  FROM 041124_Zolotukhin.employees WHERE id=employee_id_param;
END $$
DELIMITER ;

CALL get_department_id_by_employee_id(2);
CALL get_department_id_by_employee_id(8);

DROP PROCEDURE get_department_id_by_employee_id;

-- 2 Создайте хранимую процедуру get_employee_age, которая принимает id сотрудника (IN-параметр) и возвращает его возраст через OUT-параметр.
DELIMITER $$
CREATE PROCEDURE get_employee_age (IN employee_id_param INT, OUT employee_age_param INT)
BEGIN
    SELECT age INTO employee_age_param FROM 041124_Zolotukhin.employees WHERE id=employee_id_param;
END $$
DELIMITER ;

CALL get_employee_age(2, @employee_age);
SELECT @employee_age;
CALL get_employee_age(8, @employee_age);
SELECT @employee_age;

DROP PROCEDURE get_employee_age;

-- 3 Создайте хранимую процедуру increase_salary, которая принимает зарплату сотрудника (INOUT-параметр) и уменьшает ее на 10%.
DELIMITER $$
CREATE PROCEDURE increase_salary( INOUT employee_salary_param DECIMAL(10,2))
BEGIN
    SET employee_salary_param = employee_salary_param * 0.9;
END $$
DELIMITER ;

SET @employee_salary = 1000;
CALL increase_salary(@employee_salary);
SELECT @employee_salary;

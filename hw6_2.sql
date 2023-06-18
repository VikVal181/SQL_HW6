#Выведите только четные числа от 1 до 10. Пример: 2,4,6,8,10

DELIMITER //

CREATE FUNCTION printeven(val INT)
RETURNS CHAR(100)
DETERMINISTIC
BEGIN
DECLARE res CHAR(100) DEFAULT '';
DECLARE i INT DEFAULT 0;
WHILE i <= val DO
SET res = IF (MOD(i,2) = 0,  CONCAT(res, CAST( i AS CHAR(5)),' ,'), res);
SET i = i+1;
END WHILE;
RETURN res;
END; //

SELECT printeven(10);
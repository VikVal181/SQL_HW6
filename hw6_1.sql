#Создайте функцию, которая принимает кол-во сек и формат их в кол-во дней часов. 
#Пример: 123456 ->'1 days 10 hours 17 minutes 36 seconds

CREATE SCHEMA hw6;

DELIMITER //

CREATE FUNCTION sectotime(val INT)
RETURNS CHAR(40)
DETERMINISTIC
BEGIN
DECLARE days, hours, minutes, seconds CHAR(2);
DECLARE res CHAR(40);
SET days = CAST(FLOOR(val/60/60/24) AS CHAR(2));
SET hours = CAST(FLOOR(mod(val/60/60/24,1)*24) AS CHAR(2));
SET minutes = CAST(FLOOR(mod(mod(val/60/60/24,1)*24,1)*60) AS CHAR(2));
SET seconds = CAST(ROUND(mod(mod(mod(val/60/60/24,1)*24,1)*60,1)*60) AS CHAR(2));
SET res = CONCAT(days,' days ',hours,' hours ',minutes,' minutes ',seconds,' seconds ');
RETURN res;
END; //
 
SELECT sectotime(123456);
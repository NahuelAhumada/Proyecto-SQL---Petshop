/* Determinista*/
/* NO SQL*/
/* READ SQL DATA*/
DROP FUNCTION IF EXISTS aumento_producto;
DELIMITER //
CREATE FUNCTION aumento_producto (precio float(10,2), aumento varchar(100))
	RETURNS VARCHAR(50)
BEGIN
END; //
DELIMITER ;
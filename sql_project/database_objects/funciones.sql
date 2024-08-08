USE petshop_ecommerce;
DROP FUNCTION IF EXISTS id_ultima_orden_de_compra_de_usuario;
DELIMITER //
CREATE FUNCTION id_ultima_orden_de_compra_de_usuario(var_id_usuario INT) RETURNS INT
DETERMINISTIC
READS SQL DATA
BEGIN
	DECLARE ultimo_id INT;
    
    SELECT id_orden
    INTO ultimo_id
    FROM ORDENES_DE_COMPRA
	WHERE id_usuario =var_id_usuario
    AND fecha_de_orden = (
		SELECT MAX(fecha_de_orden)
        FROM ORDENES_DE_COMPRA
        WHERE id_usuario = var_id_usuario);
	IF ultimo_id IS NULL THEN
		SIGNAL SQLSTATE '02000' SET MESSAGE_TEXT = 'No hay orden asociada a este usuario', MYSQL_ERRNO = 1000;
    END IF;
    RETURN ultimo_id;
END //
DELIMITER ;

DROP FUNCTION IF EXISTS calcular_precio_total_de_orden;
DELIMITER //
CREATE FUNCTION calcular_precio_total_de_orden(var_id_orden INT) RETURNS VARCHAR(14)
DETERMINISTIC
READS SQL DATA
BEGIN
	DECLARE resultado_operacion DECIMAL(10,2);
    DECLARE resultado_concatenado VARCHAR(14);
    SELECT SUM(precio_final * cantidad) 
    INTO resultado_operacion
    FROM DETALLE_DE_ORDEN
    WHERE id_orden = var_id_orden;
    IF resultado_operacion IS NULL THEN
		SIGNAL SQLSTATE '02000' SET MESSAGE_TEXT = 'ID de ORDEN invalida', MYSQL_ERRNO = 1000;
    END IF;
	SET resultado_concatenado = CONCAT("$",CAST(resultado_operacion AS CHAR(13)));
    RETURN resultado_concatenado;
END //
DELIMITER ;

DROP FUNCTION IF EXISTS calcular_precio_total_de_carrito;
DELIMITER //
CREATE FUNCTION calcular_precio_total_de_carrito(var_id_carrito INT) RETURNS VARCHAR(14)
DETERMINISTIC
READS SQL DATA
BEGIN
	DECLARE resultado_operacion DECIMAL(10,2);
    DECLARE resultado_concatenado VARCHAR(14);
    SELECT SUM(precio_final * cantidad) 
    INTO resultado_operacion
    FROM ITEM_CARRITO
    WHERE id_carrito = var_id_carrito;
    IF resultado_operacion IS NULL THEN
		SIGNAL SQLSTATE '02000' SET MESSAGE_TEXT = 'No hay productos para este carrito', MYSQL_ERRNO = 1000;
    END IF;
	SET resultado_concatenado = CONCAT("$",CAST(resultado_operacion AS CHAR(13)));
    RETURN resultado_concatenado;
END //
DELIMITER ;
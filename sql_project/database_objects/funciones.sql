USE petshop_ecommerce;


# Funcion para visualizar precio como un varchar, anteponiendo el caracter $
DROP FUNCTION IF EXISTS pasar_precio_a_varchar;

DELIMITER //
CREATE FUNCTION pasar_precio_a_varchar(var_precio DECIMAL(15,2)) RETURNS VARCHAR(18)
DETERMINISTIC
NO SQL
BEGIN
	RETURN CONCAT("$",CAST(var_precio AS CHAR(17)));
END //
DELIMITER ;

# Funcion para calcular precio, de acuerdo a un determinado metodo de pago
DROP FUNCTION IF EXISTS calcular_precio_final;

DELIMITER //
CREATE FUNCTION calcular_precio_final(var_precio DECIMAL(15,2), var_id_metodo_de_pago INT) RETURNS DECIMAL(15,2)
DETERMINISTIC
NO SQL
BEGIN
	DECLARE precio_resultado DECIMAL (15,2);
    SET precio_resultado = var_precio;
	#Descuento 10% por pagar en efectivo
	IF var_id_metodo_de_pago = 1 THEN
		 SET precio_resultado = precio_resultado * 0.9;
	#Aumento de 20% por pagar en 3 cuotas
    ELSEIF var_id_metodo_de_pago = 5 THEN
		SET precio_resultado = precio_resultado * 1.2;
	END IF;
	RETURN precio_resultado;
END //
DELIMITER ;


DROP FUNCTION IF EXISTS id_ultima_orden_de_compra_de_usuario;
DELIMITER //
CREATE FUNCTION id_ultima_orden_de_compra_de_usuario(var_id_usuario INT) RETURNS INT
DETERMINISTIC
READS SQL DATA
BEGIN
	DECLARE ultimo_id INT;
    SELECT max.id_orden
    INTO ultimo_id
    FROM (SELECT id_orden, MAX(fecha_de_orden) as ultima_fecha
		FROM ORDENES_DE_COMPRA
		WHERE id_usuario = var_id_usuario
        GROUP BY id_orden
        ORDER BY ultima_fecha DESC
        LIMIT 1) as max;

    RETURN ultimo_id;
END //
DELIMITER ;


DROP FUNCTION IF EXISTS calcular_precio_total_de_orden;
DELIMITER //
CREATE FUNCTION calcular_precio_total_de_orden(var_id_orden INT) RETURNS VARCHAR(18)
DETERMINISTIC
READS SQL DATA
BEGIN
	DECLARE resultado_operacion DECIMAL(15,2);
    DECLARE resultado_concatenado VARCHAR(18);
    SELECT SUM(precio_final * cantidad) 
    INTO resultado_operacion
    FROM DETALLE_DE_ORDEN
    WHERE id_orden = var_id_orden;
    IF resultado_operacion IS NULL THEN
		SIGNAL SQLSTATE '02000' SET MESSAGE_TEXT = 'ID de ORDEN invalida', MYSQL_ERRNO = 1000;
    END IF;
	SET resultado_concatenado = pasar_precio_a_varchar(resultado_operacion);
    RETURN resultado_concatenado;
END //
DELIMITER ;

DROP FUNCTION IF EXISTS calcular_precio_total_de_carrito;
DELIMITER //
CREATE FUNCTION calcular_precio_total_de_carrito(var_id_carrito INT) RETURNS VARCHAR(18)
DETERMINISTIC
READS SQL DATA
BEGIN
	DECLARE resultado_operacion DECIMAL(15,2);
    DECLARE resultado_concatenado VARCHAR(18);
    SELECT SUM(p.precio_final * i.cantidad) 
    INTO resultado_operacion
    FROM ITEM_CARRITO as i
    JOIN  PRODUCTOS as p
    ON (i.id_producto = p.id_producto
    AND id_carrito = var_id_carrito);
    
    IF resultado_operacion IS NULL THEN
		SIGNAL SQLSTATE '02000' SET MESSAGE_TEXT = 'No hay productos para este carrito', MYSQL_ERRNO = 1000;
    END IF;
	SET resultado_concatenado = pasar_precio_a_varchar(resultado_operacion);
    RETURN resultado_concatenado;
END //
DELIMITER ;
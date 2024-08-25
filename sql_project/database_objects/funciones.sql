USE petshop_ecommerce;

#Funcion para comprobar si una direccion de envio esta asociada a un usuario. Si existe, retorna TRUE
DROP FUNCTION IF EXISTS check_usuario_direccion;

DELIMITER //
CREATE FUNCTION check_usuario_direccion(p_id_usuario INT, p_id_direccion INT) RETURNS BOOLEAN
DETERMINISTIC
READS SQL DATA 
BEGIN        
    RETURN EXISTS (SELECT 1 FROM petshop_ecommerce.USUARIOS_DIRECCIONES
    WHERE id_usuario = p_id_usuario
    AND id_direccion = p_id_direccion);
END //
DELIMITER ;

# Funcion para visualizar precio como un varchar, anteponiendo el caracter $
DROP FUNCTION IF EXISTS mostrar_precio;

DELIMITER //
CREATE FUNCTION mostrar_precio(var_precio DECIMAL(15,2)) RETURNS VARCHAR(18)
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
READS SQL DATA 
BEGIN
    DECLARE multiplicador DECIMAL (4,3);
    
    SELECT modifacion_precio
    INTO multiplicador
    FROM petshop_ecommerce.METODOS_DE_PAGO
    WHERE id_metodo_pago = var_id_metodo_de_pago;
    
    IF multiplicador IS NULL THEN
		 SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Metodo de pago invalido';
	END IF;
    
    RETURN var_precio * multiplicador;

END //
DELIMITER ;

# Funcion para devolver el id de la ultima compra realizada por un determinado usuario
DROP FUNCTION IF EXISTS id_ultima_orden_de_compra_de_usuario;

DELIMITER //
CREATE FUNCTION id_ultima_orden_de_compra_de_usuario(var_id_usuario INT) RETURNS INT
DETERMINISTIC
READS SQL DATA
BEGIN
	DECLARE ultimo_id INT;
    
    SELECT m.id_orden
    INTO ultimo_id
    FROM (SELECT id_orden, MAX(fecha_de_orden) as ultima_fecha
		FROM ORDENES_DE_COMPRA
		WHERE id_usuario = var_id_usuario
        GROUP BY id_orden
        ORDER BY ultima_fecha DESC
        LIMIT 1) AS m;

    RETURN ultimo_id;
END //
DELIMITER ;

#Funcion para calcular el total a pagar de una orden de compra
DROP FUNCTION IF EXISTS calcular_precio_total_de_orden;

DELIMITER //
CREATE FUNCTION calcular_precio_total_de_orden(var_id_orden INT) RETURNS DECIMAL(15,2)
DETERMINISTIC
READS SQL DATA
BEGIN
	DECLARE resultado_operacion DECIMAL(15,2);
    SELECT SUM(precio_final * cantidad) 
    INTO resultado_operacion
    FROM DETALLE_DE_ORDEN
    WHERE id_orden = var_id_orden;
    IF resultado_operacion IS NULL THEN
		SIGNAL SQLSTATE '02000' SET MESSAGE_TEXT = 'ID de ORDEN invalida', MYSQL_ERRNO = 1000;
    END IF;
    RETURN resultado_operacion;
END //
DELIMITER ;

#Funcion para calcular el precio total a pagar de un determinado carrito de compra
DROP FUNCTION IF EXISTS calcular_precio_total_de_carrito;

DELIMITER //
CREATE FUNCTION calcular_precio_total_de_carrito(var_id_carrito INT) RETURNS DECIMAL(15,2)
DETERMINISTIC
READS SQL DATA
BEGIN
	DECLARE resultado_operacion DECIMAL(15,2);
    SELECT SUM(p.precio * i.cantidad) 
    INTO resultado_operacion
    FROM ITEM_CARRITO as i
    JOIN  PRODUCTOS as p
    ON (i.id_producto = p.id_producto
    AND id_carrito = var_id_carrito);
    
    IF resultado_operacion IS NULL THEN
		SIGNAL SQLSTATE '02000' SET MESSAGE_TEXT = 'No hay productos para este carrito', MYSQL_ERRNO = 1000;
    END IF;
    RETURN resultado_operacion;
END //
DELIMITER ;
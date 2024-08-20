USE petshop_ecommerce;

DROP PROCEDURE IF EXISTS petshop_ecommerce.revision_carritos;
DELIMITER //
CREATE PROCEDURE petshop_ecommerce.revision_carritos()
BEGIN
	DELETE FROM ITEM_CARRITO
    WHERE id_carrito IN
		(SELECT c.id_carrito FROM CARRITOS as C
        WHERE c.fecha_interaccion<= date_sub(now(), INTERVAL 2 DAY)); 
	UPDATE CARRITOS
    SET fecha_interaccion = now()
    WHERE fecha_interaccion<= date_sub(now(), INTERVAL 2 DAY); 
END //
DELIMITER ;

/*
Procedimiento para capturar los items de un carrito y pasarlos a una nueva orden de compra
Pre: recibe el id del carrito, id del metodo de pago a utilizar y id de una direccion de envio. En caso de que se retire en el local, este ultimo parametro debe ser nulo

*/
DROP PROCEDURE IF EXISTS petshop_ecommerce.realizar_compra;

DELIMITER //
CREATE PROCEDURE petshop_ecommerce.realizar_compra(IN var_id_carrito INT, IN var_id_metodo_pago INT, IN var_id_direccion INT)
BEGIN
	DECLARE var_id_usuario INT;
    DECLARE var_id_orden INT;
    DECLARE exist_metodo_pago INT DEFAULT 0;
    DECLARE envio_a_domicilio BOOLEAN DEFAULT FALSE;
    
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        -- Si ocurre cualquier error, hacer rollback
        ROLLBACK;
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error al generar la orden de compra';
    END;
    START TRANSACTION;
    
    # Validacion de usuario
	SELECT c.id_usuario
	INTO var_id_usuario
	FROM CARRITOS as c WHERE c.id_carrito = var_id_carrito;
    IF var_id_usuario IS NULL THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'ERROR: NO HAY USUARIO ASOCIADO AL ID DEL CARRITO';
	END IF;
    
    # Validacion de metodo de pago 
	SELECT COUNT(1)
	INTO exist_metodo_pago
	FROM METODOS_DE_PAGO
	WHERE id_metodo_pago = var_id_metodo_pago;
	IF exist_metodo_pago != 1 THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'ERROR: METODO DE PAGO INVALIDO';
	END IF;
    
    # Validacion de direccion de envio
    IF var_id_direccion IS NOT NULL THEN
		IF check_usuario_direccion(var_id_usuario, var_id_direccion) THEN
			SET envio_a_domicilio = TRUE;
		ELSE 
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El usuario del carrito no esta relacionado con la direccion de envio';
        END IF;
    END IF;
    
	# Ingreso nueva orden de compra
	INSERT INTO ORDENES_DE_COMPRA(id_usuario) 
	VALUE (var_id_usuario );
            
	# Obtengo id de la orden creada
	SELECT LAST_INSERT_ID() INTO var_id_orden;
    -- Codigo alternativo
	/*SELECT id_orden
	INTO var_id_orden 
	FROM ORDENES_DE_COMPRA
	WHERE id_usuario = var_id_usuario
	ORDER BY id_orden DESC
	LIMIT 1;*/
            
	# Inserto los items del carrito ingresado 
	INSERT INTO DETALLE_DE_ORDEN (id_orden, id_producto, precio_final, cantidad)
		SELECT var_id_orden, items.id_producto, p.precio, items.cantidad
		FROM ITEM_CARRITO as items
        JOIN PRODUCTOS as p ON p.id_producto = items.id_producto
		WHERE items.id_carrito = var_id_carrito;
	# Vacio el carrito de compra
	DELETE FROM ITEM_CARRITO
	WHERE id_carrito = var_id_carrito;
    # Insercion de pago pendiente para la orden de compra
    INSERT INTO petshop_ecommerce.PAGOS (id_orden, id_metodo_pago,monto)
    VALUE (var_id_orden,var_id_metodo_pago,  calcular_precio_final(calcular_precio_total_de_orden(var_id_orden),var_id_metodo_pago));
    # Insercion de despacho de pedido
    --
	IF envio_a_domicilio THEN
		INSERT INTO DESPACHO_DE_ORDEN(id_orden, id_direccion, detalle,retiro_en_local) 
        VALUE (var_id_orden, var_id_direccion, 'Preparando envio', FALSE);
	ELSE 
		INSERT INTO DESPACHO_DE_ORDEN(id_orden, id_direccion, detalle,retiro_en_local)
        VALUE (var_id_orden, NULL, 'Para retirar', TRUE);
    END IF;
    COMMIT;

END //
DELIMITER ;

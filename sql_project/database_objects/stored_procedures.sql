USE petshop_ecommerce;
/*SET SQL_SAFE_UPDATE=FALSE;*/

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
    DECLARE envio_a_domicilio BOOLEAN DEFAULT FALSE;
    DECLARE monto_de_pago DECIMAL(15,2) DEFAULT 0;
    DECLARE msg_error TEXT DEFAULT 'ERROR EN LA COMPRA: PRODUCTO NO';
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        -- Si ocurre cualquier error, hacer rollback y lanzar el mensaje del error correspondiente
        ROLLBACK;
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = msg_error;
    END;
	
    START TRANSACTION;
    
    # Validacion de usuario
	SELECT c.id_usuario
	INTO var_id_usuario
	FROM CARRITOS as c WHERE c.id_carrito = var_id_carrito;
    IF var_id_usuario IS NULL THEN
		SET msg_error = 'USUARIO DEL CARRITO NO ENCONTRADO';
		SIGNAL SQLSTATE '45000';
	END IF;

    # Validacion de metodo de pago 
	IF NOT EXISTS (SELECT 1 FROM METODOS_DE_PAGO WHERE id_metodo_pago = var_id_metodo_pago) THEN
		SET msg_error = 'ERROR: METODO DE PAGO INVALIDO';
		SIGNAL SQLSTATE '45000';
	END IF;
    
	
	# Validacion de existencia de productos en el carrito
    IF NOT EXISTS (SELECT 1 FROM ITEM_CARRITO WHERE id_carrito = var_id_carrito) THEN
		SET msg_error = 'ERROR: NO HAY PRODUCTOS DENTRO DEL CARRITO DE COMPRAS';
		SIGNAL SQLSTATE '45000'; 
    END IF;

    # Validacion de direccion de envio
    IF var_id_direccion IS NOT NULL THEN
		IF check_usuario_direccion(var_id_usuario, var_id_direccion) THEN
			SET envio_a_domicilio = TRUE;
		ELSE 
			SET msg_error = 'USUARIO Y DIRECCION NO RELACIONADOS';
			SIGNAL SQLSTATE '45000';
        END IF;
    END IF;

	# Ingreso nueva orden de compra
	INSERT INTO ORDENES_DE_COMPRA(id_usuario) 
	VALUE (var_id_usuario );
	
    
	# Obtengo id de la orden creada
    SET var_id_orden = LAST_INSERT_ID();

    IF var_id_orden IS NULL THEN
		SET msg_error = 'ORDEN DE COMPRA NO FUE SETEADA';
		SIGNAL SQLSTATE '45000';
    END IF;
	  
	# Inserto los items del carrito ingresado - Las cantidades se verifican y restan dentro del trigger DETALLE_DE_ORDEN
	INSERT INTO petshop_ecommerce.DETALLE_DE_ORDEN (id_orden, id_producto, precio_final, cantidad)
	SELECT var_id_orden, p.id_producto, p.precio, items.cantidad
	FROM ITEM_CARRITO as items
	JOIN PRODUCTOS as p ON (p.id_producto = items.id_producto AND items.id_carrito = var_id_carrito);

	# Vacio el carrito de compra
	DELETE FROM petshop_ecommerce.ITEM_CARRITO
	WHERE id_carrito = var_id_carrito;
    
    #Resta de stock en la tabla producto de acuerdo a los items 
	UPDATE petshop_ecommerce.PRODUCTOS p
    JOIN petshop_ecommerce.DETALLE_DE_ORDEN d ON p.id_producto = d.id_producto
    SET p.cantidad_disponible = p.cantidad_disponible - d.cantidad
    WHERE d.id_orden = var_id_orden;
    
    
	# Calcular monto de pago usando funciones
  
    SET monto_de_pago = calcular_precio_total_de_orden(var_id_orden);
    SET monto_de_pago = calcular_precio_final(monto_de_pago,var_id_metodo_pago);
    
    # Insercion de pago pendiente para la orden de compra
    INSERT INTO petshop_ecommerce.PAGOS (id_orden, id_metodo_pago, monto)
    VALUE (var_id_orden, var_id_metodo_pago, monto_de_pago);
	
    # Insercion de despacho de pedido
    
	IF envio_a_domicilio THEN
		INSERT INTO petshop_ecommerce.DESPACHO_DE_PEDIDOS(id_orden, id_direccion, detalle,retiro_en_local) 
        VALUE (var_id_orden, var_id_direccion, 'Preparando envio', FALSE);
	ELSE 
		INSERT INTO petshop_ecommerce.DESPACHO_DE_PEDIDOS(id_orden, id_direccion, detalle,retiro_en_local)
        VALUE (var_id_orden, NULL, 'Para retirar', TRUE);
    END IF;
    
    COMMIT;
END //
DELIMITER ;


DROP PROCEDURE IF EXISTS cancelar_compra;
DELIMITER //
CREATE PROCEDURE cancelar_compra(IN var_id_orden INT)
BEGIN
	
    DECLARE msg_error TEXT DEFAULT 'ERROR AL ACTUALIZAR STOCK';
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        -- Si ocurre cualquier error, hacer rollback y lanzar el mensaje del error correspondiente
        ROLLBACK;
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = msg_error;
    END;
	IF NOT EXISTS (SELECT 1 FROM petshop_ecommerce.ORDENES_DE_COMPRA WHERE id_orden = var_id_orden) THEN
		SET msg_error = 'ERROR: ORDEN DE COMPRA INEXISTENTE';
		SIGNAL SQLSTATE '45000';
    END IF;
    START TRANSACTION;

    -- 1. Actualizar el estado de la orden
    UPDATE petshop_ecommerce.ORDENES_DE_COMPRA
    SET estado = 'cancelada'
    WHERE id_orden = var_id_orden;

    -- 2. Cancelar el pago
    UPDATE petshop_ecommerce.PAGOS
    SET estado = 'cancelado'
    WHERE id_orden = var_id_orden;

    -- 3. Cancelar el despacho
    UPDATE petshop_ecommerce.DESPACHO_DE_PEDIDOS
    SET detalle = "Pedido cancelado", estado_envio = 'cancelado'
    WHERE id_orden = var_id_orden;

    -- 4. Restaurar el stock para todos los productos en la orden
    UPDATE petshop_ecommerce.PRODUCTOS p
    JOIN petshop_ecommerce.DETALLE_DE_ORDEN d ON p.id_producto = d.id_producto
    SET p.cantidad_disponible = p.cantidad_disponible + d.cantidad
    WHERE d.id_orden = var_id_orden;

    COMMIT;
END //
DELIMITER ;

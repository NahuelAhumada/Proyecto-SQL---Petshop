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



DROP PROCEDURE IF EXISTS petshop_ecommerce.realizar_compra;

DELIMITER //
CREATE PROCEDURE petshop_ecommerce.realizar_compra(IN var_id_carrito INT, IN var_id_metodo_pago INT)
BEGIN
	DECLARE var_id_usuario INT DEFAULT 0;
    DECLARE var_id_orden INT DEFAULT 0;
    DECLARE exist_metodo_pago INT DEFAULT 0;
    /*Validacion de usuario*/
	SELECT c.id_usuario
	INTO var_id_usuario
	FROM CARRITOS as c WHERE c.id_carrito = var_id_carrito;
    
    IF var_id_usuario != 0 THEN
		SELECT COUNT(1)
        INTO exist_metodo_pago
        FROM METODOS_DE_PAGO
        WHERE id_metodo_pago = var_id_metodo_pago;
        IF exist_metodo_pago != 0 THEN
        
			/*Ingreso nueva orden de compra*/
			INSERT INTO ORDENES_DE_COMPRA(id_usuario, id_metodo_pago) 
			VALUE (var_id_usuario, var_id_metodo_pago);
            
            /*Obtengo id de la orden creada*/
            SELECT LAST_INSERT_ID() INTO var_id_orden;
			/*SELECT id_orden
			INTO var_id_orden 
			FROM ORDENES_DE_COMPRA
			WHERE id_usuario = var_id_usuario
			ORDER BY id_orden DESC
			LIMIT 1;*/
            
            /*Inserto los items del carrito ingresado*/
			INSERT INTO DETALLE_DE_ORDEN (id_orden, id_producto, precio_final, cantidad)
				SELECT var_id_orden, items.id_producto, precio_final, items.cantidad
				FROM ITEM_CARRITO as items
				WHERE items.id_carrito = var_id_carrito;
			/*Vacio el carrito de compra*/
            DELETE FROM ITEM_CARRITO
            WHERE id_carrito = var_id_carrito;
		ELSE
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'ERROR: METODO DE PAGO INEXISTENTE';
		END IF;
	ELSE
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'ERROR: NO HAY USUARIO ASOCIADO AL ID DEL CARRITO';
	END IF;
END //
DELIMITER ;

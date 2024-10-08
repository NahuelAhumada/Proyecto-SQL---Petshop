USE petshop_ecommerce;

-- VALIDACION DE NUEVO PRODUCTO
DROP TRIGGER IF EXISTS petshop_ecommerce.validar_nuevo_producto;

DELIMITER //
CREATE TRIGGER petshop_ecommerce.validar_nuevo_producto
BEFORE INSERT ON PRODUCTOS
FOR EACH ROW
BEGIN
    -- Validar que el precio sea mayor a 0
    IF NEW.precio <= 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El precio debe ser mayor a 0';
    END IF;
    
    -- Validar que la cantidad de stock no sea negativa
    IF NEW.cantidad_disponible < 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'La cantidad de stock no puede ser negativa';
    END IF;
    
    IF NEW.cantidad_disponible = 0 THEN
        SET NEW.estado = 'no disponible';
    END IF;
END //
DELIMITER ;

-- Validacion de producto actualizado
DROP TRIGGER IF EXISTS petshop_ecommerce.validar_update_producto;
DELIMITER //

CREATE TRIGGER petshop_ecommerce.validar_update_producto
BEFORE UPDATE ON PRODUCTOS
FOR EACH ROW
BEGIN
    -- Validar que el precio sea mayor a 0
    IF NEW.precio <= 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El precio debe ser mayor a 0';
    END IF; 
    -- Validar que la cantidad de stock no sea negativa
    IF NEW.cantidad_disponible < 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'La cantidad de stock no puede ser negativa';
    END IF;
    IF NEW.cantidad_disponible = 0 THEN
        SET NEW.estado = 'no disponible';
    END IF;
END //

DELIMITER ;

-- Creacion automatica de carrito de compras asociado a un nuevo usuario
DROP TRIGGER IF EXISTS petshop_ecommerce.crear_carrito_para_usuario;

DELIMITER //
CREATE TRIGGER petshop_ecommerce.crear_carrito_para_usuario
AFTER INSERT ON USUARIOS
FOR EACH ROW
BEGIN
	INSERT INTO CARRITOS (id_usuario) VALUE (NEW.id_usuario);
END //
DELIMITER ;

-- Validacion de producto antes de ser insertado en una orden de compra (IMPORTANTE PARA LAS TRANSACCIONES)
DROP TRIGGER IF EXISTS petshop_ecommerce.validar_producto_antes_de_insertar_en_orden;
DELIMITER //
CREATE TRIGGER petshop_ecommerce.validar_producto_antes_de_insertar_en_orden
BEFORE INSERT ON petshop_ecommerce.DETALLE_DE_ORDEN
FOR EACH ROW
BEGIN
	DECLARE var_estado_producto VARCHAR(16);
    DECLARE var_cantidad INT;
    DECLARE var_estado_orden VARCHAR(12);
    
    SELECT estado
    INTO var_estado_orden
    FROM ORDENES_DE_COMPRA
    WHERE id_orden = NEW.id_orden;
    
    IF var_estado_orden != 'pendiente' THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'No se pueden agregar productos a una orden cancelada o efecuada';
    END IF;
    
    SELECT estado, cantidad_disponible 
    INTO var_estado_producto, var_cantidad
    FROM PRODUCTOS
    WHERE id_producto = NEW.id_producto;

    
    IF var_estado_producto != 'publicado' THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Producto no disponible';
	END IF;
    IF (var_cantidad - NEW.cantidad) < 0 THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Cantidad insuficiente en stock';
	END IF;
    
END //
DELIMITER ;

-- Luego de insertar un producto valido

-- Renovacion de ultima interaccion con un carrito de compra
DROP TRIGGER IF EXISTS petshop_ecommerce.renovar_interaccion_de_carrito_al_insertar_producto;

DELIMITER //
CREATE TRIGGER petshop_ecommerce.renovar_interaccion_de_carrito_al_insertar_producto
AFTER INSERT ON petshop_ecommerce.ITEM_CARRITO
FOR EACH ROW
BEGIN
	UPDATE petshop_ecommerce.CARRITOS
    SET fecha_interaccion = now()
    WHERE id_carrito = NEW.id_carrito;
END //
DELIMITER ;

DROP TRIGGER IF EXISTS petshop_ecommerce.renovar_interaccion_de_carrito_al_actualizar;

DELIMITER //
CREATE TRIGGER petshop_ecommerce.renovar_interaccion_de_carrito_al_actualizar
AFTER UPDATE ON petshop_ecommerce.ITEM_CARRITO
FOR EACH ROW
BEGIN
	UPDATE petshop_ecommerce.CARRITOS
    SET fecha_interaccion = now()
    WHERE id_carrito = NEW.id_carrito;
END //
DELIMITER ;
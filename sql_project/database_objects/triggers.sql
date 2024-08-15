USE petshop_ecommerce;

DELIMITER //
DROP TRIGGER IF EXISTS petshop_ecommerce.validar_productos_al_insertar;
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

DROP TRIGGER IF EXISTS petshop_ecommerce.validar_producto_al_actualizar;
DELIMITER //

CREATE TRIGGER petshop_ecommerce.validar_producto_al_actualizar
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

DROP TRIGGER IF EXISTS petshop_ecommerce.crear_carrito_para_usuario;

DELIMITER //
CREATE TRIGGER petshop_ecommerce.crear_carrito_para_usuario
AFTER INSERT ON USUARIOS
FOR EACH ROW
BEGIN
	INSERT INTO CARRITOS (id_usuario) VALUE (NEW.id_usuario);
END //
DELIMITER ;


DELIMITER //
CREATE TRIGGER petshop_ecommerce.validar_producto_antes_de_insertar_en_orden
BEFORE INSERT ON petshop_ecommerce.DETALLE_DE_ORDEN
FOR EACH ROW
BEGIN
	DECLARE var_estado_producto VARCHAR(60);
    DECLARE var_cantidad INT;
    SELECT estado, cantidad_dispoinble INTO var_estado_producto, var_cantidad
    FROM PRODUCTOS
    WHERE id_producto = NEW.id_producto;
    IF estado_producto != 'publicado' THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Producto no disponible';
	END IF;
    IF (var_cantidad - NEW.cantida_disponible) < 0 THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Cantidad insuficiente';
	END IF;
END //
DELIMITER ;

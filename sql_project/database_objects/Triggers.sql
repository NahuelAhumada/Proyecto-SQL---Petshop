USE petshop_ecommerce;

DELIMITER //
DROP TRIGGER IF EXISTS petshop_ecommerce.validar_productos_al_insertar;
CREATE TRIGGER validar_productos_al_insertar
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

CREATE TRIGGER validar_producto_al_actualizar
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

DROP TRIGGER IF EXISTS crear_carrito_para_usuario;

DELIMITER //
CREATE TRIGGER petshop_ecommerce.crear_carrito_para_usuario
AFTER INSERT ON USUARIOS
FOR EACH ROW
BEGIN
	INSERT INTO CARRITOS (id_usuario) VALUE (NEW.id_usuario);
END //
DELIMITER ;
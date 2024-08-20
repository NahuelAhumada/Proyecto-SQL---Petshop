-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: petshop_ecommerce
-- ------------------------------------------------------
-- Server version	8.0.36

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Dumping events for database 'petshop_ecommerce'
--

--
-- Dumping routines for database 'petshop_ecommerce'
--
/*!50003 DROP FUNCTION IF EXISTS `calcular_precio_final` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `calcular_precio_final`(var_precio DECIMAL(15,2), var_id_metodo_de_pago INT) RETURNS decimal(15,2)
    READS SQL DATA
    DETERMINISTIC
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

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `calcular_precio_total_de_carrito` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `calcular_precio_total_de_carrito`(var_id_carrito INT) RETURNS decimal(15,2)
    READS SQL DATA
    DETERMINISTIC
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
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `calcular_precio_total_de_orden` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `calcular_precio_total_de_orden`(var_id_orden INT) RETURNS decimal(15,2)
    READS SQL DATA
    DETERMINISTIC
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
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `check_usuario_direccion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `check_usuario_direccion`(p_id_usuario INT, p_id_direccion INT) RETURNS tinyint(1)
    READS SQL DATA
    DETERMINISTIC
BEGIN
	DECLARE direccion_asociada BOOLEAN DEFAULT FALSE;
    
    SELECT TRUE
    INTO direccion_asociada
	FROM petshop_ecommerce.USUARIOS_DIRECCIONES
    WHERE id_usuario = p_id_usuario
    AND id_direccion = p_id_direccion;
    
    RETURN direccion_asociada;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `id_ultima_orden_de_compra_de_usuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `id_ultima_orden_de_compra_de_usuario`(var_id_usuario INT) RETURNS int
    READS SQL DATA
    DETERMINISTIC
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
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `mostrar_precio` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `mostrar_precio`(var_precio DECIMAL(15,2)) RETURNS varchar(18) CHARSET utf8mb4
    NO SQL
    DETERMINISTIC
BEGIN
	RETURN CONCAT("$",CAST(var_precio AS CHAR(17)));
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `realizar_compra` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `realizar_compra`(IN var_id_carrito INT, IN var_id_metodo_pago INT, IN var_id_direccion INT)
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

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `revision_carritos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `revision_carritos`()
BEGIN
	DELETE FROM ITEM_CARRITO
    WHERE id_carrito IN
		(SELECT c.id_carrito FROM CARRITOS as C
        WHERE c.fecha_interaccion<= date_sub(now(), INTERVAL 2 DAY)); 
	UPDATE CARRITOS
    SET fecha_interaccion = now()
    WHERE fecha_interaccion<= date_sub(now(), INTERVAL 2 DAY); 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-08-19 17:56:21

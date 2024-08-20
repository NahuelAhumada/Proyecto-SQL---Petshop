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
-- Table structure for table `detalle_de_orden`
--

DROP TABLE IF EXISTS `detalle_de_orden`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalle_de_orden` (
  `id_orden` int NOT NULL,
  `id_producto` int NOT NULL,
  `precio_final` decimal(10,2) DEFAULT NULL,
  `cantidad` int NOT NULL,
  PRIMARY KEY (`id_orden`,`id_producto`),
  KEY `id_producto` (`id_producto`),
  CONSTRAINT `detalle_de_orden_ibfk_1` FOREIGN KEY (`id_orden`) REFERENCES `ordenes_de_compra` (`id_orden`),
  CONSTRAINT `detalle_de_orden_ibfk_2` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Tabla de relacion n-n entre ordenes de compra y los productos correspondiente de cada compra';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_de_orden`
--

LOCK TABLES `detalle_de_orden` WRITE;
/*!40000 ALTER TABLE `detalle_de_orden` DISABLE KEYS */;
INSERT INTO `detalle_de_orden` VALUES (1,1,34400.00,1),(1,5,6240.00,3),(2,2,19500.00,1),(2,3,1870.00,2),(3,4,95000.00,1),(4,5,6230.00,3),(5,14,650.00,1),(6,2,19500.00,1),(6,3,1870.00,5),(7,1,34600.00,1),(8,8,2500.00,1),(9,11,2500.00,1),(10,9,25000.00,1),(10,10,25500.00,1),(11,12,136000.00,1),(12,2,19500.00,1),(13,1,34800.00,3),(13,3,1870.00,3),(14,13,115000.00,1),(14,14,650.00,2),(15,14,650.00,5),(16,15,81705.00,1),(17,10,25000.00,1),(17,11,2500.00,2),(18,12,136000.00,1),(19,16,150000.00,1),(20,4,95000.00,1),(20,8,2500.00,2),(21,12,136000.00,1);
/*!40000 ALTER TABLE `detalle_de_orden` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `validar_producto_antes_de_insertar_en_orden` BEFORE INSERT ON `detalle_de_orden` FOR EACH ROW BEGIN
	DECLARE var_estado_producto VARCHAR(60);
    DECLARE var_cantidad INT;
    
    SELECT estado, cantidad_dispoinble 
    INTO var_estado_producto, var_cantidad
    FROM PRODUCTOS
    WHERE id_producto = NEW.id_producto;
    
    IF estado_producto != 'publicado' THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Producto no disponible';
	END IF;
    IF (var_cantidad - NEW.cantidad) < 0 THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Cantidad insuficiente en stock';
	END IF;
    
    UPDATE petshop_ecommerce.PRODUCTOS
    SET cantidad_disponible= cantidad_disponible - NEW.cantidad
    WHERE id_producto = NEW.id_producto;
END */;;
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

-- Dump completed on 2024-08-19 17:56:19

CREATE DATABASE  IF NOT EXISTS `petshop_ecommerce` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `petshop_ecommerce`;
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
-- Table structure for table `animales`
--

DROP TABLE IF EXISTS `animales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `animales` (
  `id_animal` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(60) NOT NULL,
  PRIMARY KEY (`id_animal`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Tabla de los animales ligados a las categorias de productos';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `animales`
--

LOCK TABLES `animales` WRITE;
/*!40000 ALTER TABLE `animales` DISABLE KEYS */;
INSERT INTO `animales` VALUES (1,'Perros'),(2,'Gatos'),(3,'Aves'),(4,'Peces'),(5,'Roedores'),(6,'Otros');
/*!40000 ALTER TABLE `animales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carritos`
--

DROP TABLE IF EXISTS `carritos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carritos` (
  `id_carrito` int NOT NULL AUTO_INCREMENT,
  `id_usuario` int NOT NULL,
  `fecha_interaccion` datetime NOT NULL DEFAULT (now()),
  PRIMARY KEY (`id_carrito`),
  UNIQUE KEY `id_usuario` (`id_usuario`),
  CONSTRAINT `carritos_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Tabla de carrito de compra relacionado a cada usuario con la y hora de su ultima interaccion';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carritos`
--

LOCK TABLES `carritos` WRITE;
/*!40000 ALTER TABLE `carritos` DISABLE KEYS */;
INSERT INTO `carritos` VALUES (1,1,'2023-07-01 10:00:00'),(2,2,'2023-08-02 11:30:00'),(3,3,'2023-08-15 18:45:00'),(4,4,'2023-09-04 09:00:00'),(5,5,'2023-11-05 15:15:00'),(6,6,'2024-01-02 11:30:00'),(7,7,'2024-02-09 10:45:00'),(8,8,'2024-02-15 17:00:00'),(9,9,'2024-02-22 15:15:00'),(10,10,'2024-03-04 12:30:00'),(11,11,'2024-04-13 14:45:00'),(12,12,'2024-04-22 15:00:00'),(13,13,'2024-05-03 10:15:00'),(14,14,'2024-05-10 13:30:00'),(15,15,'2024-06-01 12:45:00'),(16,16,'2024-08-27 11:57:15'),(17,17,'2024-08-27 11:57:15'),(18,18,'2024-08-27 11:57:15'),(19,19,'2024-08-27 11:57:15'),(20,20,'2024-08-27 11:57:15');
/*!40000 ALTER TABLE `carritos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categorias`
--

DROP TABLE IF EXISTS `categorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categorias` (
  `id_categoria` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(60) NOT NULL,
  `id_animal` int NOT NULL,
  PRIMARY KEY (`id_categoria`),
  KEY `id_animal` (`id_animal`),
  CONSTRAINT `categorias_ibfk_1` FOREIGN KEY (`id_animal`) REFERENCES `animales` (`id_animal`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Tabla de categorias de los cuales dependen las subcategorias';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorias`
--

LOCK TABLES `categorias` WRITE;
/*!40000 ALTER TABLE `categorias` DISABLE KEYS */;
INSERT INTO `categorias` VALUES (1,'Alimentos',1),(2,'Snacks',1),(3,'Paseo y viajes',1),(4,'Juguetes',1),(5,'Camas e indumentaria',1),(6,'Salud',1),(7,'Alimentos',2),(8,'Accesorios',2),(9,'Paseo y viajes',2),(10,'Camas e indumentaria',2),(11,'Higiene y belleza',2),(12,'Salud',2),(13,'Alimentos',3),(14,'Accesorios',3),(15,'Salud',3),(16,'Alimentos',4),(17,'Peceras',4),(18,'Salud',4),(19,'Alimentos',5),(20,'Accesorios',5);
/*!40000 ALTER TABLE `categorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `despacho_de_pedidos`
--

DROP TABLE IF EXISTS `despacho_de_pedidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `despacho_de_pedidos` (
  `id_despacho` int NOT NULL AUTO_INCREMENT,
  `id_orden` int NOT NULL,
  `id_direccion` int DEFAULT NULL,
  `ultima_interaccion` datetime NOT NULL DEFAULT (now()),
  `detalle` varchar(50) DEFAULT NULL,
  `estado_envio` enum('en local','enviado','entregado','cancelado') DEFAULT 'en local',
  `retiro_en_local` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id_despacho`),
  UNIQUE KEY `id_orden` (`id_orden`),
  KEY `id_direccion` (`id_direccion`),
  CONSTRAINT `despacho_de_pedidos_ibfk_1` FOREIGN KEY (`id_orden`) REFERENCES `ordenes_de_compra` (`id_orden`),
  CONSTRAINT `despacho_de_pedidos_ibfk_2` FOREIGN KEY (`id_direccion`) REFERENCES `direcciones_de_envio` (`id_direccion`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Tabla que registra la entrega de los pedidos. Pueden ser por envio o retiro del local';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `despacho_de_pedidos`
--

LOCK TABLES `despacho_de_pedidos` WRITE;
/*!40000 ALTER TABLE `despacho_de_pedidos` DISABLE KEYS */;
INSERT INTO `despacho_de_pedidos` VALUES (1,1,1,'2024-04-14 10:00:00','Enviado y recibido en tiempo','entregado',0),(2,2,2,'2024-04-16 12:00:00','Enviado y recibido en tiempo','entregado',0),(3,3,3,'2024-04-22 13:00:40','Enviado y recibido','entregado',0),(4,4,NULL,'2024-04-29 17:00:10','Retirado en el local','entregado',1),(5,5,4,'2024-05-01 09:00:00','Enviado y recibido','entregado',0),(6,6,4,'2024-05-03 10:01:00','Enviado y recibido','entregado',0),(7,7,5,'2024-05-08 12:00:30','Enviado y recibido','entregado',0),(8,8,1,'2024-05-14 09:00:00','Enviado y recibido','entregado',0),(9,9,4,'2024-05-14 15:02:00','Enviado y recibido','entregado',0),(10,10,4,'2024-05-16 09:00:00','Enviado y recibido','entregado',0),(11,11,NULL,'2024-05-16 17:00:00','Retirado en el local','entregado',1),(12,12,3,'2024-05-22 16:00:00','Enviado y recibido','entregado',0),(13,13,8,'2024-05-25 12:00:00','Enviado y recibido','entregado',0),(14,14,NULL,'2024-05-28 11:00:00','Retirado en el local','entregado',1),(15,15,7,'2024-06-01 12:01:30','Enviado y recibido','entregado',0),(16,16,9,'2024-06-04 17:00:00','Enviado y recibido','entregado',0),(17,17,1,'2024-06-19 14:00:30','Enviado y recibido con demora','entregado',0),(18,18,NULL,'2024-06-21 10:03:30','Retirado en el local','entregado',1),(19,19,10,'2024-07-06 15:00:00','Enviado y recibido','entregado',0),(20,20,11,'2024-07-06 16:00:30','El pedido esta en camino','enviado',0),(21,21,NULL,'2024-07-17 11:00:30','El pedido se encuentra en el local','en local',1);
/*!40000 ALTER TABLE `despacho_de_pedidos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_de_orden`
--

DROP TABLE IF EXISTS `detalle_de_orden`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalle_de_orden` (
  `id_orden` int NOT NULL,
  `id_producto` int NOT NULL,
  `precio_final` decimal(10,2) NOT NULL,
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
    
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `direcciones_de_envio`
--

DROP TABLE IF EXISTS `direcciones_de_envio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `direcciones_de_envio` (
  `id_direccion` int NOT NULL AUTO_INCREMENT,
  `calle` varchar(60) NOT NULL,
  `piso` varchar(10) DEFAULT NULL,
  `localidad` varchar(60) NOT NULL,
  `provincia` varchar(60) NOT NULL,
  `pais` varchar(60) NOT NULL,
  `codigo_postal` varchar(20) NOT NULL,
  PRIMARY KEY (`id_direccion`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Tabla para almacenar los datos de cada direccion de envio registradas por los usuarios';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `direcciones_de_envio`
--

LOCK TABLES `direcciones_de_envio` WRITE;
/*!40000 ALTER TABLE `direcciones_de_envio` DISABLE KEYS */;
INSERT INTO `direcciones_de_envio` VALUES (1,'Av. Juan Domingo Peron742','1A','Hurlingham','Buenos Aires','Argentina','1234'),(2,'Churruca 5368',NULL,'Córdoba','Córdoba','Argentina','5678'),(3,'Peralta 223',NULL,'Mendoza','Mendoza','Argentina','9012'),(4,'Pasaje Los Olivos852','PB','Rosario','Santa Fe','Argentina','3456'),(5,'Diagonal Norte 445','3C','La Plata','Buenos Aires','Argentina','7890'),(6,'Av. del Libertador 1550','5D','San Isidro','Buenos Aires','Argentina','1122'),(7,'Perdiguero 4298','6E','Tigre','Buenos Aires','Argentina','3344'),(8,'Boulevard Oroño 999',NULL,'Rosario','Santa Fe','Argentina','5566'),(9,'Avenida de Mayo 1600','4F','Buenos Aires','Buenos Aires','Argentina','7788'),(10,'Camino de los Remedios 652','7G','Salta','Salta','Argentina','9900'),(11,'Av. Independencia145','8H','Jujuy','Jujuy','Argentina','2233'),(12,'Calle Rivadavia 2020',NULL,'Neuquén','Neuquén','Argentina','4455'),(13,'Calle SanMartín 303','9I','Bariloche','Río Negro','Argentina','6677'),(14,'Rivadavia 742',NULL,'Comodoro Rivadavia','Chubut','Argentina','8899'),(15,'Pasaje Luna Llena 963','10J','Ushuaia','Tierra del Fuego','Argentina','1010');
/*!40000 ALTER TABLE `direcciones_de_envio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `historial_venta_de_productos_por_monto_final`
--

DROP TABLE IF EXISTS `historial_venta_de_productos_por_monto_final`;
/*!50001 DROP VIEW IF EXISTS `historial_venta_de_productos_por_monto_final`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `historial_venta_de_productos_por_monto_final` AS SELECT 
 1 AS `id_orden`,
 1 AS `fecha_de_orden`,
 1 AS `id_producto`,
 1 AS `nombre_de_producto`,
 1 AS `precio_de_venta`,
 1 AS `cantidad`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `item_carrito`
--

DROP TABLE IF EXISTS `item_carrito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item_carrito` (
  `id_carrito` int NOT NULL,
  `id_producto` int NOT NULL,
  `cantidad` int NOT NULL,
  PRIMARY KEY (`id_carrito`,`id_producto`),
  KEY `id_producto` (`id_producto`),
  CONSTRAINT `item_carrito_ibfk_1` FOREIGN KEY (`id_carrito`) REFERENCES `carritos` (`id_carrito`),
  CONSTRAINT `item_carrito_ibfk_2` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Tabla de relacion CARRITOS - PRODUCTOS. Contiene el la cantidad de cada producto pedido en un determinado carrito de compra';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_carrito`
--

LOCK TABLES `item_carrito` WRITE;
/*!40000 ALTER TABLE `item_carrito` DISABLE KEYS */;
INSERT INTO `item_carrito` VALUES (1,1,2),(1,2,2),(2,2,1),(2,3,1),(3,3,3),(4,4,1),(4,13,1),(5,1,4),(5,6,1),(6,7,2),(7,2,1),(8,8,3),(9,9,1),(10,10,2),(10,15,1),(11,2,2),(11,5,4),(11,6,3),(12,15,1),(13,12,1),(14,15,3),(15,14,5),(16,1,2),(16,5,1),(16,6,3),(17,4,1),(17,8,4),(17,14,7),(18,3,5),(18,7,1),(19,5,2),(19,15,1),(20,16,1);
/*!40000 ALTER TABLE `item_carrito` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `renovar_interaccion_de_carrito_al_insertar_producto` AFTER INSERT ON `item_carrito` FOR EACH ROW BEGIN
	UPDATE petshop_ecommerce.CARRITOS
    SET fecha_interaccion = now()
    WHERE id_carrito = NEW.id_carrito;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `renovar_interaccion_de_carrito_al_actualizar` AFTER UPDATE ON `item_carrito` FOR EACH ROW BEGIN
	UPDATE petshop_ecommerce.CARRITOS
    SET fecha_interaccion = now()
    WHERE id_carrito = NEW.id_carrito;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `marcas`
--

DROP TABLE IF EXISTS `marcas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `marcas` (
  `id_marca` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(60) NOT NULL,
  `contacto` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`id_marca`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Tabla de las marcas de cada producto';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marcas`
--

LOCK TABLES `marcas` WRITE;
/*!40000 ALTER TABLE `marcas` DISABLE KEYS */;
INSERT INTO `marcas` VALUES (1,'Generico','-'),(2,'Pro Plan','3429265350'),(3,'Royal Canin','114206331'),(4,'Old Prince','1115426007'),(5,'Vital Can','3839936103'),(6,'Mon Ami','3834139758'),(7,'Cancat','3831132665'),(8,'Kikadog','2643140711'),(9,'My Family','3425259116'),(10,'Millex','2233231746'),(11,'Zootec','3831188120'),(12,'Shulet','2217676112'),(13,'Marina','2214432393'),(14,'Aqua Clear','2648227515'),(15,'Nelsoni Ranch','3414082077'),(16,'Whiskas','3421138602'),(17,'Tetra','1196354869');
/*!40000 ALTER TABLE `marcas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `metodos_de_pago`
--

DROP TABLE IF EXISTS `metodos_de_pago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `metodos_de_pago` (
  `id_metodo_pago` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(35) NOT NULL,
  `modifacion_precio` decimal(4,3) NOT NULL,
  PRIMARY KEY (`id_metodo_pago`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Tabla que almacena los metodos de pagos disponibles para cada compra';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `metodos_de_pago`
--

LOCK TABLES `metodos_de_pago` WRITE;
/*!40000 ALTER TABLE `metodos_de_pago` DISABLE KEYS */;
INSERT INTO `metodos_de_pago` VALUES (1,'Efectivo',0.900),(2,'Debito',1.000),(3,'Transferencia bancaria',1.000),(4,'Credito a una cuota',1.000),(5,'Credito a tres cuotas',1.200);
/*!40000 ALTER TABLE `metodos_de_pago` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ordenes_de_compra`
--

DROP TABLE IF EXISTS `ordenes_de_compra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ordenes_de_compra` (
  `id_orden` int NOT NULL AUTO_INCREMENT,
  `id_usuario` int NOT NULL,
  `estado` enum('pendiente','efectuada','cancelada') DEFAULT 'pendiente',
  `fecha_de_orden` datetime NOT NULL DEFAULT (now()),
  PRIMARY KEY (`id_orden`),
  KEY `id_usuario` (`id_usuario`),
  CONSTRAINT `ordenes_de_compra_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Tabla de las ordenes de compra registradas historiamente, relacionada al usuario que la pidio';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordenes_de_compra`
--

LOCK TABLES `ordenes_de_compra` WRITE;
/*!40000 ALTER TABLE `ordenes_de_compra` DISABLE KEYS */;
INSERT INTO `ordenes_de_compra` VALUES (1,1,'efectuada','2024-04-13 10:00:00'),(2,2,'efectuada','2024-04-15 12:00:00'),(3,3,'efectuada','2024-04-21 13:00:00'),(4,1,'efectuada','2024-04-28 17:00:00'),(5,4,'efectuada','2024-04-30 09:00:00'),(6,5,'efectuada','2024-05-03 10:00:00'),(7,6,'efectuada','2024-05-07 12:00:00'),(8,2,'efectuada','2024-05-13 09:00:00'),(9,5,'efectuada','2024-05-14 15:00:00'),(10,4,'efectuada','2024-05-15 14:00:00'),(11,7,'efectuada','2024-05-15 16:00:00'),(12,3,'efectuada','2024-05-21 16:00:00'),(13,10,'efectuada','2024-05-24 10:00:00'),(14,9,'efectuada','2024-05-25 11:00:00'),(15,8,'efectuada','2024-06-01 12:00:00'),(16,11,'efectuada','2024-06-03 17:00:00'),(17,1,'efectuada','2024-06-16 14:00:00'),(18,12,'efectuada','2024-06-21 10:00:00'),(19,13,'efectuada','2024-07-05 15:00:00'),(20,14,'pendiente','2024-07-06 16:00:00'),(21,15,'pendiente','2024-07-17 11:00:00');
/*!40000 ALTER TABLE `ordenes_de_compra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pagos`
--

DROP TABLE IF EXISTS `pagos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pagos` (
  `id_pago` int NOT NULL AUTO_INCREMENT,
  `id_orden` int NOT NULL,
  `id_metodo_pago` int NOT NULL,
  `estado` enum('pendiente','completado','cancelado') DEFAULT 'pendiente',
  `fecha_pago` datetime NOT NULL DEFAULT (now()),
  `monto` decimal(15,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id_pago`),
  UNIQUE KEY `id_orden` (`id_orden`),
  KEY `id_metodo_pago` (`id_metodo_pago`),
  CONSTRAINT `pagos_ibfk_1` FOREIGN KEY (`id_orden`) REFERENCES `ordenes_de_compra` (`id_orden`),
  CONSTRAINT `pagos_ibfk_2` FOREIGN KEY (`id_metodo_pago`) REFERENCES `metodos_de_pago` (`id_metodo_pago`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Tabla que registra los pagos de cada orden de compra';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pagos`
--

LOCK TABLES `pagos` WRITE;
/*!40000 ALTER TABLE `pagos` DISABLE KEYS */;
INSERT INTO `pagos` VALUES (1,1,2,'completado','2024-04-13 10:00:30',53120.00),(2,2,3,'completado','2024-04-15 12:00:30',23240.00),(3,3,4,'completado','2024-04-21 13:00:30',95000.00),(4,4,3,'completado','2024-04-28 17:00:30',18690.00),(5,5,2,'completado','2024-04-30 09:00:30',650.00),(6,6,1,'completado','2024-05-03 10:00:30',25965.00),(7,7,2,'completado','2024-05-07 12:00:30',34600.00),(8,8,3,'completado','2024-05-13 09:00:30',2500.00),(9,9,1,'completado','2024-05-14 15:00:30',2250.00),(10,10,2,'completado','2024-05-15 14:00:30',50500.00),(11,11,3,'completado','2024-05-15 15:00:30',136000.00),(12,12,5,'completado','2024-05-21 16:00:30',23400.00),(13,13,4,'completado','2024-05-24 10:00:30',110010.00),(14,14,3,'completado','2024-05-25 11:00:30',116300.00),(15,15,1,'completado','2024-06-01 12:00:30',2925.00),(16,16,2,'completado','2024-06-03 17:00:30',81705.00),(17,17,2,'completado','2024-06-16 14:00:30',30000.00),(18,18,3,'completado','2024-06-21 10:00:30',136000.00),(19,19,4,'completado','2024-07-05 15:00:30',150000.00),(20,20,5,'pendiente','2024-07-06 16:00:30',120000.00),(21,21,1,'pendiente','2024-07-17 11:00:30',122400.00);
/*!40000 ALTER TABLE `pagos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `precio_total_de_carritos`
--

DROP TABLE IF EXISTS `precio_total_de_carritos`;
/*!50001 DROP VIEW IF EXISTS `precio_total_de_carritos`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `precio_total_de_carritos` AS SELECT 
 1 AS `id_usuario`,
 1 AS `nombre_de_usuario`,
 1 AS `total_a_pagar`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productos` (
  `id_producto` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `descripcion` varchar(350) NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `imagen` varchar(100) DEFAULT NULL,
  `cantidad_disponible` int DEFAULT '1',
  `estado` enum('publicado','borrador','no disponible') DEFAULT 'borrador',
  `id_subcategoria` int NOT NULL,
  `id_marca` int DEFAULT NULL,
  PRIMARY KEY (`id_producto`),
  KEY `id_subcategoria` (`id_subcategoria`),
  KEY `id_marca` (`id_marca`),
  CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`id_subcategoria`) REFERENCES `subcategorias` (`id_subcategoria`),
  CONSTRAINT `productos_ibfk_2` FOREIGN KEY (`id_marca`) REFERENCES `marcas` (`id_marca`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Tabla de productos del ecommerce. El precio almacenado se corresponde al precio de lista actual';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` VALUES (1,'Old Prince Premium Adultos Pollo Y Carne X 20+3 Kg','Old Prince Premium Adultos sabor Pollo y Carne de 20+3kg es un alimento balanceado para perros adultos',34400.00,'/oldprince',8,'publicado',1,4),(2,'Pro Plan Perro Adulto Mediano X 15 Kg + 3 Kg','Pro Plan incorporó a su fórmula de alimentos balanceados la espirulina, componente que ayuda a proteger los sistemas inmune y digestivo de tu perro',19500.00,'/proplan',6,'publicado',1,2),(3,'Royal Canin Dachshund X 85 Gr','Royal Canin Dachshund es un alimento húmedo con textura tipo paté para perros, a partir de los 10 meses de edad',1868.00,'/royalcanninhum',4,'publicado',2,3),(4,'Royal Canin Perro Veterinary Hipoalergénico X 10 Kg','Royal Canin Hypoallergenic DR 21 es un alimento balanceado de prescripción para perros, destinado a reducir la intolerancia a ingredientes y nutrientes.',94975.00,'/royalcanninmed',10,'publicado',3,3),(5,'MON AMI STICK CHICKEN MEAT X 400 GR','Galletas secas con sabor a pollo',6224.00,'/dogchickencookie',10,'publicado',4,6),(6,'Snack Mon Ami Dental Clean X 400 Grs','Deliciosos snacks hecho de ingredientes de alta calidad. La higiene dental ayuda a prevenir enfermedades y mejora el aliento de tu mascota.',7098.00,'/monamisnackdental',10,'publicado',5,6),(7,'Hueso 20/21','Hueso para mascar.',25000.00,'/hueso2021',8,'publicado',6,1),(8,'Bozal Tipo Canasta De Alambre Para Rottweiler','Bozal canasta de metal está acolchonado con cuero natural, desarrollado especialmente para perro tipo Rottweiler o de raza similar.',2500.00,'/bozal1',5,'publicado',7,8),(9,'Pretal Regulable L 4 Cm Kikadog','Pretal regulable fabricado con materiales de óptima calidad y diseñado exclusivamente para que se ajuste de la forma correcta al pecho de tu mascota.',25000.00,'/pretal1',6,'publicado',8,8),(10,'Chapita Identiificatoria Classic Big Red Pawprint','Chapitas identificatorias producidas en metal por microfusión con material analérgico.',25500.00,'/chapitaroja',20,'publicado',9,9),(11,'Juguete Frisbee Plástico Perro','Divertido juguete de frisbee en simpáticos colores.',2500.00,'/frisbee1',10,'publicado',10,9),(12,'Royal Canin Gato Fit 32 X 15 Kg','Alimento para gatos adultos con peso ideal, actividad física moderada y que poseen acceso al exterior, de 1 a 7 años de edad.',136000.00,'/royalcanin15kg',3,'publicado',18,3),(13,'Pro Plan Gato Adulto X 15 Kg','Pro Plan Gato Adulto con Optiprebio contiene una combinación óptima de prebióticos y antioxidantes para optimizar la digestión y fortalecer las defensas de tu gato.',115000.00,'/proplangato15kg',5,'publicado',18,2),(14,'Pouch Whiskas Pollo En Salsa X 85 Grs Adulto','Whiskas Gato Sobrecito es alimento húmedo 100% completo y balanceado cocido al vapor.',650.00,'/whiskahumedo85g',8,'publicado',19,16),(15,'Royal Canin Gato Adulto Urinary High Dilution S/O X 7.5 Kg','Royal Canin Urinary High Dilution es un alimento dietético completo para gatos',81704.00,'/royalcaninuri7kg',6,'publicado',20,3),(16,'Hierba Gato Bandeja Listo P/Usar X 80 Grs','Incluyen la tierra y abonos naturales para acelerar el crecimiento y para que las plantas tengan todos los nutrientes necesarios.',5100.00,'/hierbagatozootec',10,'publicado',21,11),(17,'Juguete Para Gatos Raton Suave Con Cola Cancat','Juguete para gatos',1500.00,' /jugueteconcatpgatos',8,'publicado',22,7),(18,'Cookies Para Aves Sabor Vegetales X 200 Grs','Estas galletas de vegetales para aves son una excelente golosina que aporta grandes cantidades de vitaminas y minerales.',4400.00,'/cookieavezootec',5,'publicado',34,11),(19,'Alimento Peces Tetra Fin Goldfish Carassius Y Carpas 200 Gr','TETRA FIN Alimento para peces carassius y otros peces de agua fría como el goldfish y pequeñas carpas KOI.',27500.00,'/alimentoTetraAgFria',3,'publicado',38,17),(20,'Alimentos P/Peces Tropicales Tetra Color Granulos 300 Gr','Alimento para peces tropicales',45000.00,'/alimentoTetraAgFria',3,'publicado',38,17),(21,'Marina Deluxe Aq.Kit 38L','Acuario de 38 Litros de altisima calidad',150000.00,'/marinakit38L',4,'borrador',42,13);
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `validar_nuevo_producto` BEFORE INSERT ON `productos` FOR EACH ROW BEGIN
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
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `validar_update_producto` BEFORE UPDATE ON `productos` FOR EACH ROW BEGIN
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
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `subcategorias`
--

DROP TABLE IF EXISTS `subcategorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subcategorias` (
  `id_subcategoria` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(60) NOT NULL,
  `id_categoria` int NOT NULL,
  PRIMARY KEY (`id_subcategoria`),
  KEY `id_categoria` (`id_categoria`),
  CONSTRAINT `subcategorias_ibfk_1` FOREIGN KEY (`id_categoria`) REFERENCES `categorias` (`id_categoria`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Tabla de subcategorias disponibles de cada producto';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subcategorias`
--

LOCK TABLES `subcategorias` WRITE;
/*!40000 ALTER TABLE `subcategorias` DISABLE KEYS */;
INSERT INTO `subcategorias` VALUES (1,'Alimento Seco',1),(2,'Alimento Humedo',1),(3,'Alimento Medicado',1),(4,'Galletas Secas',2),(5,'Sticks dentales',2),(6,'Huesos',2),(7,'Bozales',3),(8,'Collares',3),(9,'Chapitas',3),(10,'Juguetes con sonido',4),(11,'Juguetes dentales',4),(12,'Sogas y pelotas',4),(13,'Camas',5),(14,'Colchonetas',5),(15,'Moises',5),(16,'Antiparacitos',6),(17,'Medicamentos',6),(18,'Alimento Seco',7),(19,'Alimento Humedo',7),(20,'Alimento Medicados',7),(21,'Hierbas',8),(22,'Juguetes',8),(23,'Rascadores',8),(24,'Chapitas',9),(25,'Collares y correas',9),(26,'Transportadoras',9),(27,'Camas',10),(28,'Colchonetas',10),(29,'Moises',10),(30,'Piedras',11),(31,'Arena',11),(32,'Antiparacitos',12),(33,'Medicamentos',12),(34,'Golosinas y Semillas',13),(35,'Jaulas y Jaulones',14),(36,'Juguetes - Accesorios',14),(37,'Medicamentos',15),(38,'Alimento de Agua Fria',16),(39,'Alimento de Agua Tropical',16),(40,'Accesorios',17),(41,'Calefaccion - Iluminacion - Filtrado',17),(42,'Peceras - Acuarios',17),(43,'Salud general',18),(44,'Balanceados',19),(45,'Hamsteras y Jaulas',20),(46,'Juguetes y Accesorios',20);
/*!40000 ALTER TABLE `subcategorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `total_a_pagar_por_orden_de_compra`
--

DROP TABLE IF EXISTS `total_a_pagar_por_orden_de_compra`;
/*!50001 DROP VIEW IF EXISTS `total_a_pagar_por_orden_de_compra`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `total_a_pagar_por_orden_de_compra` AS SELECT 
 1 AS `id_orden`,
 1 AS `id_usuario`,
 1 AS `estado`,
 1 AS `fecha_de_orden`,
 1 AS `monto_estandar`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `id_usuario` int NOT NULL AUTO_INCREMENT,
  `nombre_de_usuario` varchar(60) NOT NULL,
  `nombres` varchar(80) NOT NULL,
  `apellidos` varchar(80) NOT NULL,
  `email` varchar(100) NOT NULL,
  `contrasena` varchar(60) NOT NULL,
  PRIMARY KEY (`id_usuario`),
  UNIQUE KEY `nombre_de_usuario` (`nombre_de_usuario`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Tabla para almacenar información de los usuarios';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'Yuru','Emlyn','Yurukhin','eyurukhin0@yahoo.com','dW1uZu_qoL{f3C'),(2,'TabY','Tabbatha','Leishman','tleishman1@cbc.ca','tD6rB)4r'),(3,'Ryu','Richmound','Yu','ryu2@google.pl','yL6wW4s9hG'),(4,'CarlieWD','Carlie','Inwood','cinwood3@narod.ru','bY4HmSSui'),(5,'StevenD','Demeter','Steven','dsteven4@feedburner.com','tJ0758d)O}q33'),(6,'JordiB','Jodi','Bockings','jbockings5@squidoo.com','iJ3OLuuH'),(7,'Carlita1','Carlita','Macklin','cmacklin6@so-net.ne.jp','aY3Yg&Ijcl=a\'bBx'),(8,'Ereddin','Eada','Reddin','ereddin7@wikispaces.com','mD5xK<YzeNpQ}'),(9,'Neil','Nealon','Dalbey','ndalbey8@arizona.edu','xW3\'Z*`x'),(10,'Gamma','Gav','Ambrogini','gambrogini9@forbes.com','cU3fV`7e>+`'),(11,'Ynez_F','Ynez','Foulkes','yfoulkesa@naver.com','tV4)NA`iqij)b7fx'),(12,'Buggy','Bogey','Churchman','bchurchmanb@github.com','zP9r~H@v,'),(13,'Barb5','Barbara','Giraldon','bgiraldonc@sbwire.com','oL2.w0J8mb|)~'),(14,'RodriguesB','Barbabas','Rodrigues','brodriguesd@amazon.co.uk','hJ5LTr#=4EZ'),(15,'Abram','Archie','Breem','abreeme@bbb.org','bZ2IJJ8T+'),(16,'Astro','Andy','Strongman','astrongmanf@ustream.tv','yF2?m8DrkFTE50X'),(17,'Willy','Willie','Hanster','whansterg@plala.or.jp','iP2m/Rg\'c'),(18,'Avi','Averil','Guwer','aguwerh@marriott.com','pD4?XdKz'),(19,'BriannaW','Brianna','Whitemarsh','bwhitemarshi@google.it','iE3CBsA4TnD|'),(20,'CindyLu','Cindy','Wysome','cwysomej@miibeian.gov.cn','iS7NXl=L'),(21,'Georgy','Georgeanna','Juden','gjudenk@nasa.gov','yF2.JlC#v@vmv'),(22,'E_Morri','Emelita','Morrieson','emorriesonl@ifeng.com','sV6559ljn3|U'),(23,'Mfench','May','Ffrench','mffrenchm@fda.gov','iB5=CY81>'),(24,'Creann','Carlynn','Crean','ccreann@free.fr','fW8Her*H'),(25,'Releno','Reta','Elen','releno@japanpost.jp','gO9dYAG}');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `crear_carrito_para_usuario` AFTER INSERT ON `usuarios` FOR EACH ROW BEGIN
	INSERT INTO CARRITOS (id_usuario) VALUE (NEW.id_usuario);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `usuarios_direcciones`
--

DROP TABLE IF EXISTS `usuarios_direcciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios_direcciones` (
  `id_usuario` int NOT NULL,
  `id_direccion` int NOT NULL,
  PRIMARY KEY (`id_usuario`,`id_direccion`),
  KEY `id_direccion` (`id_direccion`),
  CONSTRAINT `usuarios_direcciones_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `usuarios_direcciones_ibfk_2` FOREIGN KEY (`id_direccion`) REFERENCES `direcciones_de_envio` (`id_direccion`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Tabla de relacion n-n entre los usuarios y las direcciones de envio';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios_direcciones`
--

LOCK TABLES `usuarios_direcciones` WRITE;
/*!40000 ALTER TABLE `usuarios_direcciones` DISABLE KEYS */;
INSERT INTO `usuarios_direcciones` VALUES (1,1),(2,1),(2,2),(3,3),(4,4),(5,4),(6,5),(7,6),(8,7),(9,8),(10,8),(20,8),(11,9),(12,10),(13,10),(14,11),(15,12),(16,12),(17,13),(18,14),(19,15);
/*!40000 ALTER TABLE `usuarios_direcciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `usuarios_sin_compras_hace_3_meses`
--

DROP TABLE IF EXISTS `usuarios_sin_compras_hace_3_meses`;
/*!50001 DROP VIEW IF EXISTS `usuarios_sin_compras_hace_3_meses`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `usuarios_sin_compras_hace_3_meses` AS SELECT 
 1 AS `id_usuario`,
 1 AS `nombre_de_usuario`,
 1 AS `email`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_productos_por_total_vendidos`
--

DROP TABLE IF EXISTS `vista_productos_por_total_vendidos`;
/*!50001 DROP VIEW IF EXISTS `vista_productos_por_total_vendidos`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_productos_por_total_vendidos` AS SELECT 
 1 AS `id_producto`,
 1 AS `nombre`,
 1 AS `total_vendido`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `visualizacion_de_subcategorias`
--

DROP TABLE IF EXISTS `visualizacion_de_subcategorias`;
/*!50001 DROP VIEW IF EXISTS `visualizacion_de_subcategorias`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `visualizacion_de_subcategorias` AS SELECT 
 1 AS `id_subcategoria`,
 1 AS `Subcategoria`,
 1 AS `Categoria`,
 1 AS `Animal`*/;
SET character_set_client = @saved_cs_client;

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
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'No hay productos para este carrito';
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
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'ID de ORDEN invalida';
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
    RETURN EXISTS (SELECT 1 FROM petshop_ecommerce.USUARIOS_DIRECCIONES
    WHERE id_usuario = p_id_usuario
    AND id_direccion = p_id_direccion);
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
/*!50003 DROP PROCEDURE IF EXISTS `cancelar_compra` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `cancelar_compra`(IN var_id_orden INT)
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

--
-- Final view structure for view `historial_venta_de_productos_por_monto_final`
--

/*!50001 DROP VIEW IF EXISTS `historial_venta_de_productos_por_monto_final`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `historial_venta_de_productos_por_monto_final` AS select `o`.`id_orden` AS `id_orden`,`o`.`fecha_de_orden` AS `fecha_de_orden`,`p`.`id_producto` AS `id_producto`,`p`.`nombre` AS `nombre_de_producto`,`mostrar_precio`(`d`.`precio_final`) AS `precio_de_venta`,`d`.`cantidad` AS `cantidad` from ((`productos` `p` join `detalle_de_orden` `d` on((`p`.`id_producto` = `d`.`id_producto`))) join `ordenes_de_compra` `o` on((`d`.`id_orden` = `o`.`id_orden`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `precio_total_de_carritos`
--

/*!50001 DROP VIEW IF EXISTS `precio_total_de_carritos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `precio_total_de_carritos` AS select `us`.`id_usuario` AS `id_usuario`,`us`.`nombre_de_usuario` AS `nombre_de_usuario`,`calcular_precio_total_de_carrito`(`cart`.`id_carrito`) AS `total_a_pagar` from (`carritos` `cart` join `usuarios` `us` on((`us`.`id_usuario` = `cart`.`id_usuario`))) group by `us`.`id_usuario`,`us`.`nombre_de_usuario` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `total_a_pagar_por_orden_de_compra`
--

/*!50001 DROP VIEW IF EXISTS `total_a_pagar_por_orden_de_compra`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `total_a_pagar_por_orden_de_compra` AS select `ordenes_de_compra`.`id_orden` AS `id_orden`,`ordenes_de_compra`.`id_usuario` AS `id_usuario`,`ordenes_de_compra`.`estado` AS `estado`,`ordenes_de_compra`.`fecha_de_orden` AS `fecha_de_orden`,`calcular_precio_total_de_orden`(`ordenes_de_compra`.`id_orden`) AS `monto_estandar` from `ordenes_de_compra` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `usuarios_sin_compras_hace_3_meses`
--

/*!50001 DROP VIEW IF EXISTS `usuarios_sin_compras_hace_3_meses`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `usuarios_sin_compras_hace_3_meses` AS select `u`.`id_usuario` AS `id_usuario`,`u`.`nombre_de_usuario` AS `nombre_de_usuario`,`u`.`email` AS `email` from `usuarios` `u` where `u`.`id_usuario` in (select distinct `o`.`id_usuario` from `ordenes_de_compra` `o` where (`o`.`fecha_de_orden` >= (now() - interval 3 month))) is false */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_productos_por_total_vendidos`
--

/*!50001 DROP VIEW IF EXISTS `vista_productos_por_total_vendidos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_productos_por_total_vendidos` AS select `p`.`id_producto` AS `id_producto`,`p`.`nombre` AS `nombre`,sum(`detalles`.`cantidad`) AS `total_vendido` from (`productos` `p` join `detalle_de_orden` `detalles` on((`p`.`id_producto` = `detalles`.`id_producto`))) group by `p`.`id_producto`,`p`.`nombre` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `visualizacion_de_subcategorias`
--

/*!50001 DROP VIEW IF EXISTS `visualizacion_de_subcategorias`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `visualizacion_de_subcategorias` AS select `sub`.`id_subcategoria` AS `id_subcategoria`,`sub`.`nombre` AS `Subcategoria`,`cat`.`nombre` AS `Categoria`,`a`.`nombre` AS `Animal` from ((`subcategorias` `sub` join `categorias` `cat` on((`sub`.`id_categoria` = `cat`.`id_categoria`))) join `animales` `a` on((`cat`.`id_animal` = `a`.`id_animal`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-08-27 12:01:31

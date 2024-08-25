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
  KEY `id_orden` (`id_orden`),
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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-08-19 17:56:20

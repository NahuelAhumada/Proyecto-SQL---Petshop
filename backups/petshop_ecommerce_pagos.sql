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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-08-19 17:56:19

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
-- Table structure for table `ordenes_de_compra`
--

DROP TABLE IF EXISTS `ordenes_de_compra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ordenes_de_compra` (
  `id_orden` int NOT NULL AUTO_INCREMENT,
  `id_usuario` int NOT NULL,
  `estado` enum('pendiente','pagado','cancelado') DEFAULT 'pendiente',
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
INSERT INTO `ordenes_de_compra` VALUES (1,1,'pagado','2024-04-13 10:00:00'),(2,2,'pagado','2024-04-15 12:00:00'),(3,3,'pagado','2024-04-21 13:00:00'),(4,1,'pagado','2024-04-28 17:00:00'),(5,4,'pagado','2024-04-30 09:00:00'),(6,5,'pagado','2024-05-03 10:00:00'),(7,6,'pagado','2024-05-07 12:00:00'),(8,2,'pagado','2024-05-13 09:00:00'),(9,5,'pagado','2024-05-14 15:00:00'),(10,4,'pagado','2024-05-15 14:00:00'),(11,7,'pagado','2024-05-15 16:00:00'),(12,3,'pagado','2024-05-21 16:00:00'),(13,10,'pagado','2024-05-24 10:00:00'),(14,9,'pagado','2024-05-25 11:00:00'),(15,8,'pagado','2024-06-01 12:00:00'),(16,11,'pagado','2024-06-03 17:00:00'),(17,1,'pagado','2024-06-16 14:00:00'),(18,12,'pagado','2024-06-21 10:00:00'),(19,13,'pagado','2024-07-05 15:00:00'),(20,14,'pendiente','2024-07-06 16:00:00'),(21,15,'pendiente','2024-07-17 11:00:00');
/*!40000 ALTER TABLE `ordenes_de_compra` ENABLE KEYS */;
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

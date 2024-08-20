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
INSERT INTO `carritos` VALUES (1,1,'2023-07-01 10:00:00'),(2,2,'2023-08-02 11:30:00'),(3,3,'2023-08-15 18:45:00'),(4,4,'2023-09-04 09:00:00'),(5,5,'2023-11-05 15:15:00'),(6,6,'2024-01-02 11:30:00'),(7,7,'2024-02-09 10:45:00'),(8,8,'2024-02-15 17:00:00'),(9,9,'2024-02-22 15:15:00'),(10,10,'2024-03-04 12:30:00'),(11,11,'2024-04-13 14:45:00'),(12,12,'2024-04-22 15:00:00'),(13,13,'2024-05-03 10:15:00'),(14,14,'2024-05-10 13:30:00'),(15,15,'2024-06-01 12:45:00'),(16,16,'2024-08-18 12:46:21'),(17,17,'2024-08-18 12:46:21'),(18,18,'2024-08-18 12:46:21'),(19,19,'2024-08-18 12:46:21'),(20,20,'2024-08-18 12:46:21');
/*!40000 ALTER TABLE `carritos` ENABLE KEYS */;
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

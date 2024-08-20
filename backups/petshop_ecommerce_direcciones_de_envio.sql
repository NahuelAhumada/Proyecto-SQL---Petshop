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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-08-19 17:56:19

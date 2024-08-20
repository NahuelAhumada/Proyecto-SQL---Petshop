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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-08-19 17:56:20

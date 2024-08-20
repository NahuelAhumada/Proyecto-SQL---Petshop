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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-08-19 17:56:19

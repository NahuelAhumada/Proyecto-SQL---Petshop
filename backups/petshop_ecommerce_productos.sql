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
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productos` (
  `id_producto` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `descripcion` varchar(350) NOT NULL,
  `precio` decimal(10,2) DEFAULT NULL,
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
INSERT INTO `productos` VALUES (1,'Old Prince Premium Adultos Pollo Y Carne X 20+3 Kg','Old Prince Premium Adultos sabor Pollo y Carne de 20+3kg es un alimento balanceado para perros adultos',34400.00,'/oldprince',3,'publicado',1,4),(2,'Pro Plan Perro Adulto Mediano X 15 Kg + 3 Kg','Pro Plan incorporó a su fórmula de alimentos balanceados la espirulina, componente que ayuda a proteger los sistemas inmune y digestivo de tu perro',19500.00,'/proplan',6,'publicado',1,2),(3,'Royal Canin Dachshund X 85 Gr','Royal Canin Dachshund es un alimento húmedo con textura tipo paté para perros, a partir de los 10 meses de edad',1868.00,'/royalcanninhum',4,'publicado',2,3),(4,'Royal Canin Perro Veterinary Hipoalergénico X 10 Kg','Royal Canin Hypoallergenic DR 21 es un alimento balanceado de prescripción para perros, destinado a reducir la intolerancia a ingredientes y nutrientes.',94975.00,'/royalcanninmed',1,'publicado',3,3),(5,'MON AMI STICK CHICKEN MEAT X 400 GR','Galletas secas con sabor a pollo',6224.00,'/dogchickencookie',10,'publicado',4,6),(6,'Snack Mon Ami Dental Clean X 400 Grs','Deliciosos snacks hecho de ingredientes de alta calidad. La higiene dental ayuda a prevenir enfermedades y mejora el aliento de tu mascota.',7098.00,'/monamisnackdental',10,'publicado',5,6),(7,'Hueso 20/21','Hueso para mascar.',25000.00,'/hueso2021',8,'publicado',6,1),(8,'Bozal Tipo Canasta De Alambre Para Rottweiler','Bozal canasta de metal está acolchonado con cuero natural, desarrollado especialmente para perro tipo Rottweiler o de raza similar.',2500.00,'/bozal1',2,'publicado',7,8),(9,'Pretal Regulable L 4 Cm Kikadog','Pretal regulable fabricado con materiales de óptima calidad y diseñado exclusivamente para que se ajuste de la forma correcta al pecho de tu mascota.',25000.00,'/pretal1',6,'publicado',8,8),(10,'Chapita Identiificatoria Classic Big Red Pawprint','Chapitas identificatorias producidas en metal por microfusión con material analérgico.',25500.00,'/chapitaroja',20,'publicado',9,9),(11,'Juguete Frisbee Plástico Perro','Divertido juguete de frisbee en simpáticos colores.',2500.00,'/frisbee1',10,'publicado',10,9),(12,'Royal Canin Gato Fit 32 X 15 Kg','Alimento para gatos adultos con peso ideal, actividad física moderada y que poseen acceso al exterior, de 1 a 7 años de edad.',136000.00,'/royalcanin15kg',3,'publicado',18,3),(13,'Pro Plan Gato Adulto X 15 Kg','Pro Plan Gato Adulto con Optiprebio contiene una combinación óptima de prebióticos y antioxidantes para optimizar la digestión y fortalecer las defensas de tu gato.',115000.00,'/proplangato15kg',1,'publicado',18,2),(14,'Pouch Whiskas Pollo En Salsa X 85 Grs Adulto','Whiskas Gato Sobrecito es alimento húmedo 100% completo y balanceado cocido al vapor.',650.00,'/whiskahumedo85g',8,'publicado',19,16),(15,'Royal Canin Gato Adulto Urinary High Dilution S/O X 7.5 Kg','Royal Canin Urinary High Dilution es un alimento dietético completo para gatos',81704.00,'/royalcaninuri7kg',1,'publicado',20,3),(16,'Hierba Gato Bandeja Listo P/Usar X 80 Grs','Incluyen la tierra y abonos naturales para acelerar el crecimiento y para que las plantas tengan todos los nutrientes necesarios.',5100.00,'/hierbagatozootec',10,'publicado',21,11),(17,'Juguete Para Gatos Raton Suave Con Cola Cancat','Juguete para gatos',1500.00,' /jugueteconcatpgatos',8,'publicado',22,7),(18,'Cookies Para Aves Sabor Vegetales X 200 Grs','Estas galletas de vegetales para aves son una excelente golosina que aporta grandes cantidades de vitaminas y minerales.',4400.00,'/cookieavezootec',5,'publicado',34,11),(19,'Alimento Peces Tetra Fin Goldfish Carassius Y Carpas 200 Gr','TETRA FIN Alimento para peces carassius y otros peces de agua fría como el goldfish y pequeñas carpas KOI.',27500.00,'/alimentoTetraAgFria',3,'publicado',38,17),(20,'Alimentos P/Peces Tropicales Tetra Color Granulos 300 Gr','Alimento para peces tropicales',45000.00,'/alimentoTetraAgFria',3,'publicado',38,17),(21,'Marina Deluxe Aq.Kit 38L','Acuario de 38 Litros de altisima calidad',150000.00,'/marinakit38L',1,'borrador',42,13);
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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-08-19 17:56:19

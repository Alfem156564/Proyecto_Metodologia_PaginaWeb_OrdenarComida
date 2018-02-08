-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: bd_comida
-- ------------------------------------------------------
-- Server version	5.6.26-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `pedidos`
--

DROP TABLE IF EXISTS `pedidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pedidos` (
  `id_orden` int(11) NOT NULL,
  `nombre` varchar(20) DEFAULT NULL,
  `pedido` varchar(150) DEFAULT NULL,
  `precioTotal` int(11) DEFAULT NULL,
  `edificio` varchar(25) DEFAULT NULL,
  `salon` varchar(15) DEFAULT NULL,
  `horario` varchar(10) DEFAULT NULL,
  `pago` int(11) DEFAULT NULL,
  `estado` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_orden`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedidos`
--

LOCK TABLES `pedidos` WRITE;
/*!40000 ALTER TABLE `pedidos` DISABLE KEYS */;
INSERT INTO `pedidos` VALUES (1,'Alan','2hot-dog',40,'54','F','1:00',50,0),(2,'Pepe','1 hot-dog  1 hamburguesa  ',50,'3','A','1:00pm',100,0),(3,'Azul','3 hot-dog  5 hamburguesa  ',210,'28','D','5:00pm',500,0),(4,'alan','1 hot-dog,  1 hamburguesa,  ',50,'54','F','9:00',100,0),(5,'alan','7 hamburguesa,  ',210,'54','F','10:00',500,0),(6,'zeke','2 hot-dog,  ',30,'54','f','1pm',50,0),(7,'zeke','2 hot-dog,  2 hamburguesa,  2 Torta de jamon,  ',124,'51','F','9am',100,0),(8,'yomero','1 hot-dog,  ',15,'40','C','3pm',200,0),(9,'Alfem','5 Burrito de frijoles,  ',35,'202','F','4pm',1000,0),(10,'quier','13 tacos de arrachera,  ',208,'10','D','16',200,0),(11,'qwer','1 hamburguesa,  ',30,'1','A','1pm',10,0),(12,'1234rds','1 Refresco Coca-Cola,  ',12,'1','A','22',100,0),(13,'qwerty','4 tacos de arrachera,  ',64,'8','E','9:24:2',0,0),(14,'enupi','1 hamburguesa,  2 Mofin de Chocolate,  3 Burrito de frijoles,  1 Refresco Coca-Cola,  ',91,'10','F','10:00',500,0),(15,'Lalo','9 tacos de arrachera,  ',144,'23','D','9:45:41',0,0),(16,'zeke','4 hot-dog,  7 hamburguesa,  7 Torta de jamon,  7 Mofin de Chocolate,  7 Burrito de frijoles,  7 Refresco Coca-Cola,  7 tacos de arrachera,  ',732,'51','F','10:15',600,0),(17,'Alan Meza','2 tacos de arrachera,  ',32,'54','F','10:17:43',0,0),(18,'Alan Meza','2 tacos de arrachera,  ',32,'1','A','10:18:44',0,0),(19,'Alan Meza','1 hot-dog,  1 Mofin de Chocolate,  1 Refresco Coca-Cola,  ',41,'56','F','13:53:9',0,0);
/*!40000 ALTER TABLE `pedidos` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-11-27 19:04:25

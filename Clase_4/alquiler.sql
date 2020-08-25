-- MySQL dump 10.13  Distrib 5.7.31, for Linux (x86_64)
--
-- Host: localhost    Database: alquileres
-- ------------------------------------------------------
-- Server version	5.7.31-0ubuntu0.18.04.1

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
-- Table structure for table `departamento`
--

DROP TABLE IF EXISTS `departamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `departamento` (
  `id_departamento` int(11) NOT NULL AUTO_INCREMENT,
  `numero` varchar(45) NOT NULL,
  `habitaciones` int(11) NOT NULL,
  `banios` tinyint(1) NOT NULL,
  `mascotas` tinyint(1) NOT NULL,
  `edificio_id_edificio` int(11) NOT NULL,
  PRIMARY KEY (`id_departamento`,`edificio_id_edificio`),
  KEY `fk_departamento_edificio_idx` (`edificio_id_edificio`),
  CONSTRAINT `fk_departamento_edificio` FOREIGN KEY (`edificio_id_edificio`) REFERENCES `edificio` (`id_edificio`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departamento`
--

LOCK TABLES `departamento` WRITE;
/*!40000 ALTER TABLE `departamento` DISABLE KEYS */;
INSERT INTO `departamento` VALUES (1,'1-A',1,1,0,1),(2,'2-A',3,1,0,1),(3,'1-B',2,1,0,2),(4,'2-B',1,1,0,2),(5,'3-A',4,2,1,3),(6,'3-B',2,1,1,3);
/*!40000 ALTER TABLE `departamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `edificio`
--

DROP TABLE IF EXISTS `edificio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `edificio` (
  `id_edificio` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `direccion` varchar(45) NOT NULL,
  PRIMARY KEY (`id_edificio`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edificio`
--

LOCK TABLES `edificio` WRITE;
/*!40000 ALTER TABLE `edificio` DISABLE KEYS */;
INSERT INTO `edificio` VALUES (1,'Torres A','Direccion Falsa 123'),(2,'Torres B','Direccion Falsa 1234'),(3,'Torres C','Direccion Falsa 12345');
/*!40000 ALTER TABLE `edificio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inquilino`
--

DROP TABLE IF EXISTS `inquilino`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inquilino` (
  `id_inquilino` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `apellido` varchar(45) NOT NULL,
  `departamento_id_departamento` int(11) NOT NULL,
  PRIMARY KEY (`id_inquilino`,`departamento_id_departamento`),
  KEY `fk_inquilino_departamento1_idx` (`departamento_id_departamento`),
  CONSTRAINT `fk_inquilino_departamento1` FOREIGN KEY (`departamento_id_departamento`) REFERENCES `departamento` (`id_departamento`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inquilino`
--

LOCK TABLES `inquilino` WRITE;
/*!40000 ALTER TABLE `inquilino` DISABLE KEYS */;
INSERT INTO `inquilino` VALUES (1,'Juan','Perez',1),(2,'Andrea','Gomez',2),(3,'Raul','Garcia',3),(4,'Marcos','Borja',4),(5,'Sabrina','Pescce',5),(6,'Tatiana','Lezza',6);
/*!40000 ALTER TABLE `inquilino` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-08-24 20:55:02

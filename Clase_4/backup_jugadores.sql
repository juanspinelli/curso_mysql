-- MySQL dump 10.13  Distrib 5.7.31, for Linux (x86_64)
--
-- Host: localhost    Database: jugadores
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
-- Table structure for table `equipo`
--

DROP TABLE IF EXISTS `equipo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `equipo` (
  `id_equipo` int(11) NOT NULL AUTO_INCREMENT,
  `detalle_equipo` varchar(45) NOT NULL,
  PRIMARY KEY (`id_equipo`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipo`
--

LOCK TABLES `equipo` WRITE;
/*!40000 ALTER TABLE `equipo` DISABLE KEYS */;
INSERT INTO `equipo` VALUES (1,'FC Barcelona'),(2,'Juventus'),(3,'Paris Saint-Germain'),(4,'Atletico Madrid'),(5,'Real Madrid'),(6,'Liverpool'),(7,'Manchester City'),(8,'Bayern Munich');
/*!40000 ALTER TABLE `equipo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `insert_jugadores`
--

DROP TABLE IF EXISTS `insert_jugadores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `insert_jugadores` (
  `id_insert_jugadores` int(11) NOT NULL AUTO_INCREMENT,
  `usuario_inserto` varchar(50) NOT NULL,
  `id_jugador` int(11) NOT NULL,
  `fecha_insercion` datetime DEFAULT NULL,
  PRIMARY KEY (`id_insert_jugadores`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `insert_jugadores`
--

LOCK TABLES `insert_jugadores` WRITE;
/*!40000 ALTER TABLE `insert_jugadores` DISABLE KEYS */;
INSERT INTO `insert_jugadores` VALUES (1,'curso@localhost',12,'2020-08-24 20:35:48');
/*!40000 ALTER TABLE `insert_jugadores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jugador`
--

DROP TABLE IF EXISTS `jugador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jugador` (
  `id_jugador` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `apellido` varchar(45) NOT NULL,
  `sueldo_mensual` int(20) DEFAULT NULL,
  `nacionalidad_id_nacionalidad` int(11) NOT NULL,
  `equipo_id_equipo` int(11) NOT NULL,
  `posicion_id_posicion` int(11) NOT NULL,
  PRIMARY KEY (`id_jugador`,`nacionalidad_id_nacionalidad`,`equipo_id_equipo`,`posicion_id_posicion`),
  KEY `fk_jugador_nacionalidad_idx` (`nacionalidad_id_nacionalidad`),
  KEY `fk_jugador_equipo1_idx` (`equipo_id_equipo`),
  KEY `fk_jugador_posicion1_idx` (`posicion_id_posicion`),
  CONSTRAINT `fk_jugador_equipo1` FOREIGN KEY (`equipo_id_equipo`) REFERENCES `equipo` (`id_equipo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_jugador_nacionalidad` FOREIGN KEY (`nacionalidad_id_nacionalidad`) REFERENCES `nacionalidad` (`id_nacionalidad`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_jugador_posicion1` FOREIGN KEY (`posicion_id_posicion`) REFERENCES `posicion` (`id_posicion`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jugador`
--

LOCK TABLES `jugador` WRITE;
/*!40000 ALTER TABLE `jugador` DISABLE KEYS */;
INSERT INTO `jugador` VALUES (1,'Lionel Andres','Messi',200000,1,1,1),(2,'Cristiano','Ronaldo',200000,2,2,2),(3,'Neymar','Jr',55000,3,3,2),(4,'Jan','Oblak',44000,4,4,3),(5,'Eden','Hazard',10,5,5,2),(6,'Marc-Andre','ter Stegen',60000,6,1,3),(7,'Virgil','Van Dijk',58000,7,6,4),(8,'Paulo','Dybala',62000,1,2,6),(9,'Scott','Carson',45000,8,7,3),(10,'Kyle','Walker',47000,8,7,4),(11,'Sergio','Aguero',62000,1,7,5),(12,'Robert','Lewandowski',150000,9,8,5);
/*!40000 ALTER TABLE `jugador` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`curso`@`localhost`*/ /*!50003 TRIGGER auditoria_insert_jugadores AFTER INSERT ON jugador FOR EACH ROW INSERT INTO
insert_jugadores
(usuario_inserto, id_jugador, fecha_insercion) values (CURRENT_USER(), NEW.id_jugador, NOW()) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`curso`@`localhost`*/ /*!50003 TRIGGER auditoria_update_jugadores BEFORE UPDATE ON jugador FOR EACH ROW INSERT
INTO update_jugadores
(usuario_updateo, id_jugador_modificado, sueldo_mensual_antes, sueldo_mensual_despues,
fecha_modificacion)
values (CURRENT_USER(), NEW.id_jugador, OLD.sueldo_mensual, NEW.sueldo_mensual, NOW()) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `nacionalidad`
--

DROP TABLE IF EXISTS `nacionalidad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nacionalidad` (
  `id_nacionalidad` int(11) NOT NULL AUTO_INCREMENT,
  `detalle_nacionalidad` varchar(45) NOT NULL,
  PRIMARY KEY (`id_nacionalidad`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nacionalidad`
--

LOCK TABLES `nacionalidad` WRITE;
/*!40000 ALTER TABLE `nacionalidad` DISABLE KEYS */;
INSERT INTO `nacionalidad` VALUES (1,'Argentina'),(2,'Portugal'),(3,'Brasil'),(4,'Eslovenia'),(5,'Belgica'),(6,'Alemania'),(7,'Holanda'),(8,'Inglaterra'),(9,'Polonia');
/*!40000 ALTER TABLE `nacionalidad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posicion`
--

DROP TABLE IF EXISTS `posicion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `posicion` (
  `id_posicion` int(11) NOT NULL AUTO_INCREMENT,
  `detalle_posicion` varchar(45) NOT NULL,
  PRIMARY KEY (`id_posicion`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posicion`
--

LOCK TABLES `posicion` WRITE;
/*!40000 ALTER TABLE `posicion` DISABLE KEYS */;
INSERT INTO `posicion` VALUES (1,'Extremo derecho'),(2,'Extremo izquierdo'),(3,'Arquero'),(4,'Defensa central'),(5,'Centro delantero'),(6,'Medio centro ofensivo');
/*!40000 ALTER TABLE `posicion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `sueldo_jugadores`
--

DROP TABLE IF EXISTS `sueldo_jugadores`;
/*!50001 DROP VIEW IF EXISTS `sueldo_jugadores`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `sueldo_jugadores` AS SELECT 
 1 AS `nombre`,
 1 AS `apellido`,
 1 AS `sueldo_mensual`,
 1 AS `detalle_equipo`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `update_jugadores`
--

DROP TABLE IF EXISTS `update_jugadores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `update_jugadores` (
  `id_update_jugadores` int(11) NOT NULL AUTO_INCREMENT,
  `usuario_updateo` varchar(50) NOT NULL,
  `id_jugador_modificado` int(11) NOT NULL,
  `sueldo_mensual_antes` int(11) NOT NULL,
  `sueldo_mensual_despues` int(11) NOT NULL,
  `fecha_modificacion` datetime DEFAULT NULL,
  PRIMARY KEY (`id_update_jugadores`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `update_jugadores`
--

LOCK TABLES `update_jugadores` WRITE;
/*!40000 ALTER TABLE `update_jugadores` DISABLE KEYS */;
INSERT INTO `update_jugadores` VALUES (1,'curso@localhost',1,175000,200000,'2020-08-24 20:42:32'),(2,'curso@localhost',5,63000,10,'2020-08-24 20:43:28');
/*!40000 ALTER TABLE `update_jugadores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `sueldo_jugadores`
--

/*!50001 DROP VIEW IF EXISTS `sueldo_jugadores`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`curso`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `sueldo_jugadores` AS select `j`.`nombre` AS `nombre`,`j`.`apellido` AS `apellido`,`j`.`sueldo_mensual` AS `sueldo_mensual`,`e`.`detalle_equipo` AS `detalle_equipo` from (`jugador` `j` join `equipo` `e` on((`j`.`equipo_id_equipo` = `e`.`id_equipo`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-08-24 20:52:22

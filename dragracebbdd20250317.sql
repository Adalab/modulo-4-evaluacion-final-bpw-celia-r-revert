CREATE DATABASE  IF NOT EXISTS `dragracebbdd` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `dragracebbdd`;
-- MySQL dump 10.13  Distrib 8.0.30, for macos12 (x86_64)
--
-- Host: 127.0.0.1    Database: dragracebbdd
-- ------------------------------------------------------
-- Server version	8.0.30

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
-- Table structure for table `concursantes`
--

DROP TABLE IF EXISTS `concursantes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `concursantes` (
  `nombre_id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) DEFAULT NULL,
  `ciudad_origen` varchar(255) DEFAULT NULL,
  `retos_ganados` varchar(255) DEFAULT NULL,
  `expulsion` varchar(255) DEFAULT NULL,
  `frase_iconica` text,
  PRIMARY KEY (`nombre_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `concursantes`
--

LOCK TABLES `concursantes` WRITE;
/*!40000 ALTER TABLE `concursantes` DISABLE KEYS */;
INSERT INTO `concursantes` VALUES (1,'Samantha Ballentines','San Fernando','ninguno','episodio 3','¿Pero qué what happen cariño?'),(2,'Juriji der Klee','Madrid','episodio 3, episodio 4','episodio 8','Si piensas que no te hablo, pues a lo mejor, sí, no te hablo, por cerda y por falsa.'),(3,'Drag Sethlas','Las Palmas de Gran Canaria','episodio 6','episodio 8','Un Pit Crew canario se caracteriza por su altura, su moreno y su plátano.'),(4,'Jota Carajota','Jerez de la Frontera','ninguno','episodio 4','Abuela, ve calentando el puchero que me voy pa\' casa, cariño. Gracias. Pero Iñigo, el pendiente no lo quiero perder, que mi dinerito me ha costado. No quiero perderlo.'),(5,'Marisa Prisa','Burela','ninguno','episodio 1','Marcho, que teño que marchar'),(6,'Ariel Rec','Madrid','ninguno','episodio 2','Y el karma ya llegó'),(7,'Onyx','Madrid','episodio 1','episodio 5','Parece que en Drag Race, segunda temporada, no podemos tener un lip-sync en el que no se caiga una peluca.'),(8,'Diamante Meryrbown','Zaragoza','ninguno','episodio 6','Recordad que me llamo Diamante, ilusión por detrás, sorpresa por delante.'),(9,'Marina','Barcelona','episodio 8','episodio 11','Armen sus tropas, señoritas, que ha llegado la Marina'),(10,'Venedita Von Däsh','Elche','episodio 3, episodio 9','episodio 11','¿Alguien ha pedido una cebra a domicilio?'),(11,'Estrella Xtravaganza','Jerez de la Frontera','episodio 4, episodio 7','episodio 11','En el museo de Estrella habría... pues mis cuadros que yo pinto, habría mi CD que tengo uno, y habría... un montón de esculturas de cuerpos femeninos con polla.'),(12,'Sharonne','Barcelonna','episodio 2, episodio 5, episodio 7','ninguna','Esto de la prisa en 15 minutos vestida, con un poema, pente una peluca, hazme un pollo asado, sacame los canelones del horno. ¡No puedo tanto!');
/*!40000 ALTER TABLE `concursantes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `temporada_dos`
--

DROP TABLE IF EXISTS `temporada_dos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `temporada_dos` (
  `id_episodio` int NOT NULL AUTO_INCREMENT,
  `episodio` varchar(400) DEFAULT NULL,
  `ganadora` varchar(255) DEFAULT NULL,
  `expulsada` varchar(255) DEFAULT NULL,
  `juez_invitadx` varchar(255) DEFAULT NULL,
  `fecha_emision` datetime DEFAULT NULL,
  `concursantes_nombre_id` int NOT NULL,
  PRIMARY KEY (`id_episodio`,`concursantes_nombre_id`),
  KEY `fk_temporada_dos_concursantes_idx` (`concursantes_nombre_id`),
  CONSTRAINT `fk_temporada_dos_concursantes` FOREIGN KEY (`concursantes_nombre_id`) REFERENCES `concursantes` (`nombre_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `temporada_dos`
--

LOCK TABLES `temporada_dos` WRITE;
/*!40000 ALTER TABLE `temporada_dos` DISABLE KEYS */;
INSERT INTO `temporada_dos` VALUES (1,'La nueva promocion','Onyx','Marisa Prisa','Gloria Trevi','2022-03-27 00:00:00',0),(2,'Supremme Talent Xtravaganza','Sharonne','Ariel Rec','La Zowi','2022-04-03 00:00:00',0),(3,'El Diario de Putricia','Venedita Von Däsh','Samantha Ballentines','Eduardo Casanova','2022-04-10 00:00:00',0),(4,'La Llamadrag','Estrella Xtravaganza','Jota Carajota','La Prohibida','2022-04-17 00:00:00',0),(5,'Snatch Game','Sharonne','Onyx','María León','2022-04-24 00:00:00',0),(6,'Ball Español','Drag Sethlas','Diamante Merybrown','Choriza May','2022-05-01 00:00:00',0),(7,'¡Vente a España!','Sharonne, Estrella Xtravaganza','Drag Sethlas','Ruth Lorenzo','2022-05-08 00:00:00',0),(8,'Drags de la comedia','Marina','Juriji der Klee','Anabel Alonso','2022-05-15 00:00:00',0),(9,'Makeover de los chicos de oro','Venedita Von Däsh','ninguna','Alexis Mateo','2022-05-22 00:00:00',0),(10,'El reencuentro',NULL,NULL,NULL,'2022-05-29 00:00:00',0),(11,'Llévame al cielo Final',NULL,'Marina','Carmen Farala','2022-06-05 00:00:00',0),(12,'La coronacion','Sharonne',NULL,NULL,'2022-06-16 00:00:00',0);
/*!40000 ALTER TABLE `temporada_dos` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-03-17 16:47:50

CREATE DATABASE  IF NOT EXISTS `gestion_gimnasio` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `gestion_gimnasio`;
-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: localhost    Database: gestion_gimnasio
-- ------------------------------------------------------
-- Server version	8.0.40

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
-- Table structure for table `alumno`
--

DROP TABLE IF EXISTS `alumno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alumno` (
  `id_alumno` int NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `apellido` varchar(20) NOT NULL,
  `direccion` varchar(50) DEFAULT NULL,
  `telefono` decimal(15,0) NOT NULL,
  `correo_electronico` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_alumno`),
  UNIQUE KEY `correo_electronico` (`correo_electronico`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alumno`
--

LOCK TABLES `alumno` WRITE;
/*!40000 ALTER TABLE `alumno` DISABLE KEYS */;
/*!40000 ALTER TABLE `alumno` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plan`
--

DROP TABLE IF EXISTS `plan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plan` (
  `id_plan` int NOT NULL,
  `id_alumno` int NOT NULL,
  `detalle` enum('M','C','MC') NOT NULL,
  `precio` decimal(10,0) NOT NULL,
  PRIMARY KEY (`id_plan`),
  KEY `FK_plan_alumno` (`id_alumno`),
  CONSTRAINT `FK_plan_alumno` FOREIGN KEY (`id_alumno`) REFERENCES `alumno` (`id_alumno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plan`
--

LOCK TABLES `plan` WRITE;
/*!40000 ALTER TABLE `plan` DISABLE KEYS */;
/*!40000 ALTER TABLE `plan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plan_pago`
--

DROP TABLE IF EXISTS `plan_pago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plan_pago` (
  `id_plan_pago` int NOT NULL,
  `id_alumno` int NOT NULL,
  `id_venta_plan` int NOT NULL AUTO_INCREMENT,
  `fecha` date DEFAULT NULL,
  `detalle` tinytext NOT NULL,
  PRIMARY KEY (`id_plan_pago`),
  KEY `FK_plan_pago_alummo` (`id_alumno`),
  KEY `FK_plan_pago_venta_plan` (`id_venta_plan`),
  CONSTRAINT `FK_plan_pago_alummo` FOREIGN KEY (`id_alumno`) REFERENCES `alumno` (`id_alumno`),
  CONSTRAINT `FK_plan_pago_venta_plan` FOREIGN KEY (`id_venta_plan`) REFERENCES `venta_plan` (`id_venta_plan`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plan_pago`
--

LOCK TABLES `plan_pago` WRITE;
/*!40000 ALTER TABLE `plan_pago` DISABLE KEYS */;
/*!40000 ALTER TABLE `plan_pago` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profesor`
--

DROP TABLE IF EXISTS `profesor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `profesor` (
  `id_profesor` int NOT NULL,
  `id_alumno` int NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `apellido` varchar(20) NOT NULL,
  `direccion` varchar(50) DEFAULT NULL,
  `telefono` int NOT NULL,
  `correo_electronico` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_profesor`),
  UNIQUE KEY `correo_electronico` (`correo_electronico`),
  KEY `FK_profesor_alummo` (`id_alumno`),
  CONSTRAINT `FK_profesor_alummo` FOREIGN KEY (`id_alumno`) REFERENCES `alumno` (`id_alumno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profesor`
--

LOCK TABLES `profesor` WRITE;
/*!40000 ALTER TABLE `profesor` DISABLE KEYS */;
/*!40000 ALTER TABLE `profesor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `venta_plan`
--

DROP TABLE IF EXISTS `venta_plan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `venta_plan` (
  `id_venta_plan` int NOT NULL AUTO_INCREMENT,
  `id_alumno` int NOT NULL,
  `id_plan` int NOT NULL,
  `fecha` date DEFAULT NULL,
  PRIMARY KEY (`id_venta_plan`),
  KEY `FK_venta_plan_alummo` (`id_alumno`),
  KEY `FK_venta_plan_plan` (`id_plan`),
  CONSTRAINT `FK_venta_plan_alummo` FOREIGN KEY (`id_alumno`) REFERENCES `alumno` (`id_alumno`),
  CONSTRAINT `FK_venta_plan_plan` FOREIGN KEY (`id_plan`) REFERENCES `plan` (`id_plan`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venta_plan`
--

LOCK TABLES `venta_plan` WRITE;
/*!40000 ALTER TABLE `venta_plan` DISABLE KEYS */;
/*!40000 ALTER TABLE `venta_plan` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-01-13  2:13:16

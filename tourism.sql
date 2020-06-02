-- MySQL dump 10.13  Distrib 8.0.20, for Win64 (x86_64)
--
-- Host: localhost    Database: mydb
-- ------------------------------------------------------
-- Server version	8.0.20

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
-- Table structure for table `cities`
--

DROP TABLE IF EXISTS `cities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cities` (
  `City Name` varchar(50) NOT NULL,
  `No. of registered tourist attractions` int DEFAULT NULL,
  `state` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`City Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cities`
--

LOCK TABLES `cities` WRITE;
/*!40000 ALTER TABLE `cities` DISABLE KEYS */;
/*!40000 ALTER TABLE `cities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hotels`
--

DROP TABLE IF EXISTS `hotels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hotels` (
  `hotel number` int NOT NULL AUTO_INCREMENT,
  `hotel name` varchar(45) DEFAULT NULL,
  `average user review` int DEFAULT NULL,
  `phone number` varchar(45) DEFAULT NULL,
  `cities_City Name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`hotel number`),
  KEY `fk_hotels_cities_idx` (`cities_City Name`),
  CONSTRAINT `fk_hotels_cities` FOREIGN KEY (`cities_City Name`) REFERENCES `cities` (`City Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hotels`
--

LOCK TABLES `hotels` WRITE;
/*!40000 ALTER TABLE `hotels` DISABLE KEYS */;
/*!40000 ALTER TABLE `hotels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `restaurants`
--

DROP TABLE IF EXISTS `restaurants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `restaurants` (
  `restaurant number` int NOT NULL AUTO_INCREMENT,
  `restaurant name` varchar(45) DEFAULT NULL,
  `average user review_restaurants` int DEFAULT NULL,
  `is vegetarian?` char(1) DEFAULT NULL,
  `phone number` varchar(45) DEFAULT NULL,
  `cities_City Name` varchar(50) DEFAULT NULL,
  `opening time` time DEFAULT NULL,
  `closing time` time DEFAULT NULL,
  PRIMARY KEY (`restaurant number`),
  KEY `fk_restaurants_cities1_idx` (`cities_City Name`),
  CONSTRAINT `fk_restaurants_cities1` FOREIGN KEY (`cities_City Name`) REFERENCES `cities` (`City Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restaurants`
--

LOCK TABLES `restaurants` WRITE;
/*!40000 ALTER TABLE `restaurants` DISABLE KEYS */;
/*!40000 ALTER TABLE `restaurants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stops at`
--

DROP TABLE IF EXISTS `stops at`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stops at` (
  `trains_idtrains` int NOT NULL,
  `cities_City Name` varchar(50) NOT NULL,
  PRIMARY KEY (`trains_idtrains`,`cities_City Name`),
  KEY `fk_trains_has_cities_cities1_idx` (`cities_City Name`),
  KEY `fk_trains_has_cities_trains1_idx` (`trains_idtrains`),
  CONSTRAINT `fk_trains_has_cities_cities1` FOREIGN KEY (`cities_City Name`) REFERENCES `cities` (`City Name`),
  CONSTRAINT `fk_trains_has_cities_trains1` FOREIGN KEY (`trains_idtrains`) REFERENCES `trains` (`idtrains`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stops at`
--

LOCK TABLES `stops at` WRITE;
/*!40000 ALTER TABLE `stops at` DISABLE KEYS */;
/*!40000 ALTER TABLE `stops at` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taxis`
--

DROP TABLE IF EXISTS `taxis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `taxis` (
  `idtaxis` varchar(45) NOT NULL,
  `phone number` varchar(45) NOT NULL,
  `driver name` varchar(45) DEFAULT NULL,
  `cities_City Name` varchar(50) NOT NULL,
  PRIMARY KEY (`idtaxis`),
  KEY `fk_taxis_cities1_idx` (`cities_City Name`),
  CONSTRAINT `fk_taxis_cities1` FOREIGN KEY (`cities_City Name`) REFERENCES `cities` (`City Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taxis`
--

LOCK TABLES `taxis` WRITE;
/*!40000 ALTER TABLE `taxis` DISABLE KEYS */;
/*!40000 ALTER TABLE `taxis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tourist attractions`
--

DROP TABLE IF EXISTS `tourist attractions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tourist attractions` (
  `idtourist attraction` int NOT NULL AUTO_INCREMENT,
  `attraction name` varchar(45) DEFAULT NULL,
  `average user review_tourist attractions` varchar(45) DEFAULT NULL,
  `opening time` time DEFAULT NULL,
  `closing time` time DEFAULT NULL,
  `cities_City Name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idtourist attraction`),
  KEY `fk_tourist attractions_cities1_idx` (`cities_City Name`),
  CONSTRAINT `fk_tourist attractions_cities1` FOREIGN KEY (`cities_City Name`) REFERENCES `cities` (`City Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tourist attractions`
--

LOCK TABLES `tourist attractions` WRITE;
/*!40000 ALTER TABLE `tourist attractions` DISABLE KEYS */;
/*!40000 ALTER TABLE `tourist attractions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trains`
--

DROP TABLE IF EXISTS `trains`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trains` (
  `idtrains` int NOT NULL AUTO_INCREMENT,
  `train number` int DEFAULT NULL,
  PRIMARY KEY (`idtrains`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trains`
--

LOCK TABLES `trains` WRITE;
/*!40000 ALTER TABLE `trains` DISABLE KEYS */;
/*!40000 ALTER TABLE `trains` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'mydb'
--

--
-- Dumping routines for database 'mydb'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-06-02 12:33:39

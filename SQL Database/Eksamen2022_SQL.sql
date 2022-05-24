CREATE DATABASE  IF NOT EXISTS `byggemarked` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `byggemarked`;
-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: localhost    Database: byggemarked
-- ------------------------------------------------------
-- Server version	8.0.27

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
-- Table structure for table `alternativer`
--

DROP TABLE IF EXISTS `alternativer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alternativer` (
  `Alternativ_ID` int NOT NULL,
  `Alternativ_navn` varchar(45) NOT NULL,
  `Produkt_ID` int DEFAULT NULL,
  KEY `Produkt_ID` (`Produkt_ID`),
  KEY `Alternativ_ID` (`Alternativ_ID`),
  CONSTRAINT `alternativer_ibfk_1` FOREIGN KEY (`Produkt_ID`) REFERENCES `produkt` (`Produkt_ID`),
  CONSTRAINT `alternativer_ibfk_2` FOREIGN KEY (`Alternativ_ID`) REFERENCES `produkt` (`Produkt_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alternativer`
--

LOCK TABLES `alternativer` WRITE;
/*!40000 ALTER TABLE `alternativer` DISABLE KEYS */;
/*!40000 ALTER TABLE `alternativer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eco`
--

DROP TABLE IF EXISTS `eco`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `eco` (
  `Eco_ID` int NOT NULL AUTO_INCREMENT,
  `Eco_beskrivelse` varchar(45) NOT NULL,
  PRIMARY KEY (`Eco_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eco`
--

LOCK TABLES `eco` WRITE;
/*!40000 ALTER TABLE `eco` DISABLE KEYS */;
INSERT INTO `eco` VALUES (1,'Miljøvenlig'),(2,'Indeholder skadelige stoffer'),(3,'Dårlig for miljøet');
/*!40000 ALTER TABLE `eco` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faktura`
--

DROP TABLE IF EXISTS `faktura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `faktura` (
  `Faktura_ID` int NOT NULL AUTO_INCREMENT,
  `Line_ID` int NOT NULL,
  `Kunde_ID` int NOT NULL,
  PRIMARY KEY (`Faktura_ID`),
  KEY `Line_ID` (`Line_ID`),
  KEY `Kunde_ID` (`Kunde_ID`),
  CONSTRAINT `faktura_ibfk_1` FOREIGN KEY (`Line_ID`) REFERENCES `order_lines` (`Line_ID`),
  CONSTRAINT `faktura_ibfk_2` FOREIGN KEY (`Kunde_ID`) REFERENCES `kunde` (`Kunde_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faktura`
--

LOCK TABLES `faktura` WRITE;
/*!40000 ALTER TABLE `faktura` DISABLE KEYS */;
/*!40000 ALTER TABLE `faktura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hylde`
--

DROP TABLE IF EXISTS `hylde`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hylde` (
  `Hylde_ID` int NOT NULL AUTO_INCREMENT,
  `Hylde_nr` char(8) NOT NULL,
  `Varehus_ID` int NOT NULL,
  PRIMARY KEY (`Hylde_ID`),
  KEY `Varehus_ID` (`Varehus_ID`),
  CONSTRAINT `hylde_ibfk_1` FOREIGN KEY (`Varehus_ID`) REFERENCES `varehus` (`Varehus_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hylde`
--

LOCK TABLES `hylde` WRITE;
/*!40000 ALTER TABLE `hylde` DISABLE KEYS */;
INSERT INTO `hylde` VALUES (1,'1',1),(2,'1',2),(3,'1',3),(4,'2',1),(5,'2',2),(6,'2',3),(7,'3',1),(8,'3',2),(9,'3',3),(10,'4',1),(11,'4',2),(12,'4',3),(13,'5',1),(14,'5',2),(15,'5',3),(16,'6',1),(17,'6',2),(18,'6',3);
/*!40000 ALTER TABLE `hylde` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kategori`
--

DROP TABLE IF EXISTS `kategori`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kategori` (
  `Kategori_ID` int NOT NULL,
  `Kategori_navn` varchar(45) NOT NULL,
  PRIMARY KEY (`Kategori_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kategori`
--

LOCK TABLES `kategori` WRITE;
/*!40000 ALTER TABLE `kategori` DISABLE KEYS */;
INSERT INTO `kategori` VALUES (4340,'Maling & Kemi'),(4740,'Byggemarked');
/*!40000 ALTER TABLE `kategori` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kunde`
--

DROP TABLE IF EXISTS `kunde`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kunde` (
  `Kunde_ID` int NOT NULL AUTO_INCREMENT,
  `Fornavn` varchar(45) NOT NULL,
  `Efternavn` varchar(45) NOT NULL,
  `E_mail` varchar(50) NOT NULL,
  `Pass` varchar(50) NOT NULL,
  `Gade_navn` varchar(45) NOT NULL,
  `Gade_nr` int NOT NULL,
  `By_navn` varchar(45) NOT NULL,
  `Postnummer` varchar(10) NOT NULL,
  `Firma_navn` varchar(45) DEFAULT NULL,
  `CVR` varchar(45) DEFAULT NULL,
  `Kundetype` tinyint(1) NOT NULL,
  `B2B_rabat` double DEFAULT NULL,
  PRIMARY KEY (`Kunde_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kunde`
--

LOCK TABLES `kunde` WRITE;
/*!40000 ALTER TABLE `kunde` DISABLE KEYS */;
INSERT INTO `kunde` VALUES (1,'Lars','Larsen','Larsen@gmail.com','Xzn47ooi','Bøgevej',7,'Haderslev','6100',NULL,NULL,1,NULL),(2,'Jens','Jensen','Jensen@jensen.dk','Ryz22lkj','Hovedvænget',12,'Kolding','6000','Jensen A/S','50504143',2,10.5);
/*!40000 ALTER TABLE `kunde` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lager`
--

DROP TABLE IF EXISTS `lager`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lager` (
  `Lokations_ID` int NOT NULL,
  `Produkt_ID` int DEFAULT NULL,
  `Antal` int DEFAULT NULL,
  `Fjernlokation` int DEFAULT NULL,
  `Hylde_ID` int NOT NULL,
  KEY `Produkt_ID` (`Produkt_ID`),
  KEY `Hylde_ID` (`Hylde_ID`),
  CONSTRAINT `lager_ibfk_1` FOREIGN KEY (`Produkt_ID`) REFERENCES `produkt` (`Produkt_ID`),
  CONSTRAINT `lager_ibfk_2` FOREIGN KEY (`Hylde_ID`) REFERENCES `hylde` (`Hylde_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lager`
--

LOCK TABLES `lager` WRITE;
/*!40000 ALTER TABLE `lager` DISABLE KEYS */;
INSERT INTO `lager` VALUES (110,2017043,0,NULL,1),(110,1521026,14,NULL,2);
/*!40000 ALTER TABLE `lager` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_lines`
--

DROP TABLE IF EXISTS `order_lines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_lines` (
  `Line_ID` int NOT NULL AUTO_INCREMENT,
  `Ordre_ID` int NOT NULL,
  `Produkt_ID` int NOT NULL,
  `Samlet_antal` int NOT NULL,
  PRIMARY KEY (`Line_ID`),
  KEY `Ordre_ID` (`Ordre_ID`),
  KEY `Produkt_ID` (`Produkt_ID`),
  CONSTRAINT `order_lines_ibfk_1` FOREIGN KEY (`Ordre_ID`) REFERENCES `ordre` (`Ordre_ID`),
  CONSTRAINT `order_lines_ibfk_2` FOREIGN KEY (`Produkt_ID`) REFERENCES `produkt` (`Produkt_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_lines`
--

LOCK TABLES `order_lines` WRITE;
/*!40000 ALTER TABLE `order_lines` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_lines` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ordre`
--

DROP TABLE IF EXISTS `ordre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ordre` (
  `Ordre_ID` int NOT NULL AUTO_INCREMENT,
  `Dato` datetime NOT NULL,
  `Kunde_ID` int NOT NULL,
  PRIMARY KEY (`Ordre_ID`),
  KEY `Kunde_ID` (`Kunde_ID`),
  CONSTRAINT `ordre_ibfk_1` FOREIGN KEY (`Kunde_ID`) REFERENCES `kunde` (`Kunde_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordre`
--

LOCK TABLES `ordre` WRITE;
/*!40000 ALTER TABLE `ordre` DISABLE KEYS */;
/*!40000 ALTER TABLE `ordre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produkt`
--

DROP TABLE IF EXISTS `produkt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produkt` (
  `Produkt_ID` int NOT NULL,
  `Produkt_navn` varchar(45) NOT NULL,
  `Kategori_ID` int NOT NULL,
  `Eco_ID` int NOT NULL,
  `Enhedstype` varchar(10) NOT NULL,
  `Enhedspris` double NOT NULL,
  `Leveringsdato` date NOT NULL,
  PRIMARY KEY (`Produkt_ID`),
  KEY `Kategori_ID` (`Kategori_ID`),
  KEY `Eco_ID` (`Eco_ID`),
  CONSTRAINT `produkt_ibfk_1` FOREIGN KEY (`Kategori_ID`) REFERENCES `kategori` (`Kategori_ID`),
  CONSTRAINT `produkt_ibfk_2` FOREIGN KEY (`Eco_ID`) REFERENCES `eco` (`Eco_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produkt`
--

LOCK TABLES `produkt` WRITE;
/*!40000 ALTER TABLE `produkt` DISABLE KEYS */;
INSERT INTO `produkt` VALUES (1521026,'MILLARCO SEKUNDLIM 30ML',4340,2,'STK',19.95,'2022-06-20'),(2017043,'CARAMBA RENSESPRAY',4340,2,'STK',24.95,'2022-07-01');
/*!40000 ALTER TABLE `produkt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `varehus`
--

DROP TABLE IF EXISTS `varehus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `varehus` (
  `Varehus_ID` int NOT NULL AUTO_INCREMENT,
  `Varehus_navn` varchar(45) NOT NULL,
  `Gade_navn` varchar(45) NOT NULL,
  `Gade_nr` int NOT NULL,
  `By_navn` varchar(45) NOT NULL,
  `Postnummer` varchar(45) NOT NULL,
  `Tlf_nr` varchar(8) NOT NULL,
  PRIMARY KEY (`Varehus_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `varehus`
--

LOCK TABLES `varehus` WRITE;
/*!40000 ALTER TABLE `varehus` DISABLE KEYS */;
INSERT INTO `varehus` VALUES (1,'Jem & Fix','Christian X\'s Vej',6,'Haderslev','6100','76415503'),(2,'Jem & Fix','Vonsildvej',1,'Kolding S','6000','76415504'),(3,'Jem & Fix','Skovvangen',49,'Kolding N','6100','76415543');
/*!40000 ALTER TABLE `varehus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'byggemarked'
--

--
-- Dumping routines for database 'byggemarked'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-05-24 12:09:01

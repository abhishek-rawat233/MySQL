-- MySQL dump 10.13  Distrib 8.0.17, for Linux (x86_64)
--
-- Host: localhost    Database: asset_management
-- ------------------------------------------------------
-- Server version	8.0.17-0ubuntu2

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `assets`
--

DROP TABLE IF EXISTS `assets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assets` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `item` varchar(20) NOT NULL,
  `year` year(4) NOT NULL,
  `model` varchar(20) NOT NULL,
  `make` varchar(20) NOT NULL,
  `price` int(5) NOT NULL,
  `warranty` int(2) NOT NULL,
  `allotment_type` enum('individual','public') NOT NULL,
  `status` enum('assigned','free') DEFAULT NULL,
  `location` varchar(20) DEFAULT NULL,
  `date_of_purchase` date NOT NULL DEFAULT '2011-01-01',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assets`
--

LOCK TABLES `assets` WRITE;
/*!40000 ALTER TABLE `assets` DISABLE KEYS */;
INSERT INTO `assets` VALUES (2,'Laptop A',2011,'abc','lenovo',20000,1,'individual','assigned','employee','2011-01-01'),(3,'Laptop B',2011,'bcd','HP',30000,1,'individual','free','employee','2011-01-01'),(4,'Laptop N1',2011,'cde','Dell',40000,1,'individual','free','employee','2011-01-01'),(5,'Laptop N2',2011,'cde','Dell',40000,1,'individual','free','employee','2011-01-01'),(6,'iPhone A',2011,'cde','apple',60000,1,'individual','assigned','employee','2011-04-01'),(7,'iPhone B',2011,'cde','apple',60000,1,'individual','assigned','employee','2011-01-01'),(8,'Projector A',2011,'xyz','canon',80000,1,'public','assigned','meeting room','2011-08-15'),(9,'Printer B',2011,'xyz','canon',90000,1,'public','assigned','meeting room','2011-09-10'),(10,'Printer A',2011,'xyz','canon',90000,1,'public','free','meeting room','2011-08-15');
/*!40000 ALTER TABLE `assets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `device_records`
--

DROP TABLE IF EXISTS `device_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `device_records` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `emp_id` int(4) DEFAULT NULL,
  `device_id` int(4) NOT NULL,
  `assigned_from` date DEFAULT NULL,
  `assigned_to` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `emp_id` (`emp_id`),
  KEY `device_id` (`device_id`),
  CONSTRAINT `device_records_ibfk_1` FOREIGN KEY (`emp_id`) REFERENCES `employees` (`id`),
  CONSTRAINT `device_records_ibfk_2` FOREIGN KEY (`device_id`) REFERENCES `assets` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `device_records`
--

LOCK TABLES `device_records` WRITE;
/*!40000 ALTER TABLE `device_records` DISABLE KEYS */;
INSERT INTO `device_records` VALUES (1,1,2,'2011-01-01','2011-12-31'),(2,2,3,'2011-01-01','2011-12-31'),(3,NULL,4,NULL,NULL),(4,NULL,5,NULL,NULL),(5,1,6,'2011-04-01','2019-11-01'),(6,2,7,'2011-01-01','2019-11-01'),(7,NULL,8,'2011-08-15','2019-11-01'),(8,NULL,10,'2011-08-15','2019-11-01'),(9,NULL,9,'2011-09-10','2019-11-01'),(10,2,2,'2012-01-01','2019-11-01'),(11,NULL,3,NULL,NULL);
/*!40000 ALTER TABLE `device_records` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employees` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` VALUES (1,'Alice'),(2,'Bob'),(3,'Chris'),(4,'Duke'),(5,'Emily');
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `repair`
--

DROP TABLE IF EXISTS `repair`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `repair` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `cost` int(6) NOT NULL,
  `in_warranty` enum('yes','no') DEFAULT NULL,
  `nature_of_damage` enum('major','minor') DEFAULT NULL,
  `device_id` int(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `repair`
--

LOCK TABLES `repair` WRITE;
/*!40000 ALTER TABLE `repair` DISABLE KEYS */;
/*!40000 ALTER TABLE `repair` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-11-01 13:16:52

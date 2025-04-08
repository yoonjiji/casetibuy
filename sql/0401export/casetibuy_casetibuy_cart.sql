-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: localhost    Database: casetibuy
-- ------------------------------------------------------
-- Server version	8.4.4

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
-- Table structure for table `casetibuy_cart`
--

DROP TABLE IF EXISTS `casetibuy_cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `casetibuy_cart` (
  `cid` int NOT NULL AUTO_INCREMENT,
  `cname` varchar(30) NOT NULL,
  `qty` int NOT NULL,
  `color` varchar(30) NOT NULL,
  `caseType` varchar(30) NOT NULL,
  `image` varchar(200) NOT NULL,
  `price` int NOT NULL,
  `id` varchar(30) NOT NULL,
  `pid` int NOT NULL,
  `cdate` datetime DEFAULT NULL,
  `kinds` varchar(30) NOT NULL,
  PRIMARY KEY (`cid`),
  KEY `fk_id_casetibuy_member_id` (`id`),
  KEY `fk_pid_casetibuy_product_pid` (`pid`),
  CONSTRAINT `fk_id_casetibuy_member_id` FOREIGN KEY (`id`) REFERENCES `casetibuy_member` (`id`),
  CONSTRAINT `fk_pid_casetibuy_product_pid` FOREIGN KEY (`pid`) REFERENCES `casetibuy_product` (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `casetibuy_cart`
--

LOCK TABLES `casetibuy_cart` WRITE;
/*!40000 ALTER TABLE `casetibuy_cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `casetibuy_cart` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-04-01 15:05:35

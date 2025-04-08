-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: alsrb1205-db.c1uagmqqwxda.ap-northeast-2.rds.amazonaws.com    Database: casetibuy
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
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;

--
-- GTID state at the beginning of the backup 
--

SET @@GLOBAL.GTID_PURGED=/*!80000 '+'*/ '';

--
-- Table structure for table `casetibuy_review`
--

DROP TABLE IF EXISTS `casetibuy_review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `casetibuy_review` (
  `review_id` int NOT NULL AUTO_INCREMENT,
  `order_id` int NOT NULL,
  `pid` int NOT NULL,
  `member_id` varchar(50) NOT NULL,
  `color` varchar(30) NOT NULL,
  `casetype` varchar(30) NOT NULL,
  `comment` text NOT NULL,
  `rating` int DEFAULT NULL,
  `review_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `kinds` varchar(50) NOT NULL,
  PRIMARY KEY (`review_id`),
  KEY `fk_review_order` (`order_id`),
  KEY `fk_review_member` (`member_id`),
  KEY `fk_review_product` (`pid`),
  CONSTRAINT `fk_review_member` FOREIGN KEY (`member_id`) REFERENCES `casetibuy_member` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_review_order` FOREIGN KEY (`order_id`) REFERENCES `casetibuy_order` (`order_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_review_product` FOREIGN KEY (`pid`) REFERENCES `casetibuy_product` (`pid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `casetibuy_review_chk_1` CHECK ((`rating` between 1 and 5))
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `casetibuy_review`
--

LOCK TABLES `casetibuy_review` WRITE;
/*!40000 ALTER TABLE `casetibuy_review` DISABLE KEYS */;
INSERT INTO `casetibuy_review` VALUES (3,4,4,'rkdgusdn','black','임팩트 케이스','돈아까워요',1,'2025-04-07 07:47:39','iphone');
/*!40000 ALTER TABLE `casetibuy_review` ENABLE KEYS */;
UNLOCK TABLES;
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-04-08 16:01:40

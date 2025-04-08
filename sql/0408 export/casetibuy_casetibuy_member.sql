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
-- Table structure for table `casetibuy_member`
--

DROP TABLE IF EXISTS `casetibuy_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `casetibuy_member` (
  `name` varchar(10) NOT NULL,
  `birthdate` char(8) NOT NULL,
  `id` varchar(20) NOT NULL,
  `pwd` varchar(20) NOT NULL,
  `email` varchar(30) NOT NULL,
  `phone` char(11) NOT NULL,
  `mdate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `casetibuy_member`
--

LOCK TABLES `casetibuy_member` WRITE;
/*!40000 ALTER TABLE `casetibuy_member` DISABLE KEYS */;
INSERT INTO `casetibuy_member` VALUES ('배수현','19911010','baesuhyeonbeat','123456','baesuhyeonbeat@smartmail.com','01014141414','2025-03-13 21:55:00'),('신다은','19930317','daeunshine','123456','daeunshine@smartmail.com','01012121212','2025-03-09 18:20:00'),('강동혁','19890625','donghyeokpulse','123456','donghyeokpulse@smartmail.com','01013131313','2025-03-11 13:35:00'),('최은정','19920515','eunjeongwave','123456','eunjeongwave@smartmail.com','01044445555','2025-02-15 14:20:00'),('한예림','19930530','hanyerimglow','123456','hanyerimglow@smartmail.com','01018181818','2025-03-18 09:05:00'),('정현우','19870707','hyunwoofresh','123456','hyunwoofresh@smartmail.com','01055556666','2025-02-20 16:50:00'),('문재영','19890312','jaeyoungjoy','123456','jaeyoungjoy@smartmail.com','01088889999','2025-03-03 19:30:00'),('박지훈','19881130','jihoonfire','123456','jihoonfire@smartmail.com','01033334444','2025-02-03 09:45:00'),('윤지민','19911201','jiminvibe','123456','jiminvibe@smartmail.com','01066667777','2025-02-25 11:10:00'),('임지원','19940723','jiwoncharm','123456','jiwoncharm@smartmail.com','01099990000','2025-03-05 15:45:00'),('조동현','19870707','jodonghyunvibe','123456','jodonghyunvibe@smartmail.com','01017171717','2025-03-17 12:10:00'),('김도현','19911011','kimdohyeonswift','123456','kimdohyeonswift@smartmail.com','01021212121','2025-03-21 11:55:00'),('곽동혁','19880508','kwakdaring','123456','kwakdaring@smartmail.com','01015151515','2025-03-15 08:25:00'),('김민수','19850115','minsuglow','123456','minsuglow@smartmail.com','01011112222','2025-01-10 08:15:00'),('노진우','19890109','nojinwooflare','123456','nojinwooflare@smartmail.com','01019191919','2025-03-19 17:50:00'),('강현우','20001204','rkdgusdn','121212','rkdgusdn@naver.com','01012121212','2025-04-07 07:48:30'),('서민지','19921111','seominjirise','123456','seominjirise@smartmail.com','01016161616','2025-03-16 16:00:00'),('유성민','19861230','seongminedge','123456','seongminedge@smartmail.com','01010101010','2025-03-07 10:00:00'),('이서연','19900220','seoyeonvivid','123456','seoyeonvivid@smartmail.com','01022223333','2025-01-25 12:30:00'),('송혜민','19940404','songhyemindream','123456','songhyemindream@smartmail.com','01020202020','2025-03-20 14:40:00'),('오수빈','19930505','subinlight','123456','subinlight@smartmail.com','01077778888','2025-03-01 07:05:00');
/*!40000 ALTER TABLE `casetibuy_member` ENABLE KEYS */;
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

-- Dump completed on 2025-04-08 16:01:41

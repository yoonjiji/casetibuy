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
-- Temporary view structure for view `view_cart_list`
--

DROP TABLE IF EXISTS `view_cart_list`;
/*!50001 DROP VIEW IF EXISTS `view_cart_list`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `view_cart_list` AS SELECT 
 1 AS `cid`,
 1 AS `cname`,
 1 AS `qty`,
 1 AS `color`,
 1 AS `caseType`,
 1 AS `price`,
 1 AS `kinds`,
 1 AS `id`,
 1 AS `pid`,
 1 AS `pname`,
 1 AS `image`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `view_cart_list`
--

/*!50001 DROP VIEW IF EXISTS `view_cart_list`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`admin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `view_cart_list` AS select `cc`.`cid` AS `cid`,`cc`.`cname` AS `cname`,`cc`.`qty` AS `qty`,`cc`.`color` AS `color`,`cc`.`caseType` AS `caseType`,`cc`.`price` AS `price`,`cc`.`kinds` AS `kinds`,`cm`.`id` AS `id`,`cp`.`pid` AS `pid`,`cp`.`pname` AS `pname`,concat('http://54.180.155.70:9000/',`cc`.`image`) AS `image` from ((`casetibuy_cart` `cc` join `casetibuy_member` `cm`) join `casetibuy_product` `cp`) where ((`cc`.`id` = `cm`.`id`) and (`cc`.`pid` = `cp`.`pid`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
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

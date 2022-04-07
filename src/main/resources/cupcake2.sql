-- MySQL dump 10.13  Distrib 8.0.27, for macos11 (x86_64)
--
-- Host: localhost    Database: cupcake
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
-- Temporary view structure for view `all_orders`
--

DROP TABLE IF EXISTS `all_orders`;
/*!50001 DROP VIEW IF EXISTS `all_orders`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `all_orders` AS SELECT 
 1 AS `email`,
 1 AS `order_id`,
 1 AS `SUM(totalprice)`,
 1 AS `betalt`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `allorderlines`
--

DROP TABLE IF EXISTS `allorderlines`;
/*!50001 DROP VIEW IF EXISTS `allorderlines`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `allorderlines` AS SELECT 
 1 AS `order_id`,
 1 AS `created`,
 1 AS `orderline_id`,
 1 AS `antal`,
 1 AS `topping`,
 1 AS `bund`,
 1 AS `email`,
 1 AS `totalprice`,
 1 AS `ispayed`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `bottom`
--

DROP TABLE IF EXISTS `bottom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bottom` (
  `bottom_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `price` int NOT NULL,
  PRIMARY KEY (`bottom_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bottom`
--

LOCK TABLES `bottom` WRITE;
/*!40000 ALTER TABLE `bottom` DISABLE KEYS */;
INSERT INTO `bottom` VALUES (1,'Chocolate',5),(2,'Vanilla',5),(3,'Nutmeg',5),(4,'Pistacio',6),(5,'Almond',7);
/*!40000 ALTER TABLE `bottom` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `list_of_customers_orders`
--

DROP TABLE IF EXISTS `list_of_customers_orders`;
/*!50001 DROP VIEW IF EXISTS `list_of_customers_orders`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `list_of_customers_orders` AS SELECT 
 1 AS `created`,
 1 AS `email`,
 1 AS `order_id`,
 1 AS `totalsum`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `ordered`
--

DROP TABLE IF EXISTS `ordered`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ordered` (
  `order_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ispayed` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`order_id`),
  KEY `fk_order_user_idx` (`user_id`),
  CONSTRAINT `fk_order_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordered`
--

LOCK TABLES `ordered` WRITE;
/*!40000 ALTER TABLE `ordered` DISABLE KEYS */;
INSERT INTO `ordered` VALUES (1,2,'2022-04-04 20:18:34',0),(2,2,'2022-04-04 20:18:34',0),(3,3,'2022-04-04 20:18:34',0);
/*!40000 ALTER TABLE `ordered` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderline`
--

DROP TABLE IF EXISTS `orderline`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orderline` (
  `orderline_id` int NOT NULL AUTO_INCREMENT,
  `order_id` int NOT NULL,
  `quantity` int NOT NULL DEFAULT '1',
  `totalprice` int NOT NULL,
  `bottom_id` int NOT NULL,
  `topping_id` int NOT NULL,
  PRIMARY KEY (`orderline_id`),
  KEY `fk_orderline_order1_idx` (`order_id`),
  KEY `fk_orderline_bottom1_idx` (`bottom_id`),
  KEY `fk_orderline_topping1_idx` (`topping_id`),
  CONSTRAINT `fk_orderline_bottom1` FOREIGN KEY (`bottom_id`) REFERENCES `bottom` (`bottom_id`),
  CONSTRAINT `fk_orderline_order1` FOREIGN KEY (`order_id`) REFERENCES `ordered` (`order_id`),
  CONSTRAINT `fk_orderline_topping1` FOREIGN KEY (`topping_id`) REFERENCES `topping` (`topping_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderline`
--

LOCK TABLES `orderline` WRITE;
/*!40000 ALTER TABLE `orderline` DISABLE KEYS */;
INSERT INTO `orderline` VALUES (1,1,2,20,1,3),(2,1,2,20,2,1),(3,2,2,20,2,1),(4,2,2,20,2,1),(5,3,1,10,2,1);
/*!40000 ALTER TABLE `orderline` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `orderline_description`
--

DROP TABLE IF EXISTS `orderline_description`;
/*!50001 DROP VIEW IF EXISTS `orderline_description`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `orderline_description` AS SELECT 
 1 AS `order_id`,
 1 AS `bund`,
 1 AS `topping`,
 1 AS `stykpris`,
 1 AS `antal`,
 1 AS `sum`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `topping`
--

DROP TABLE IF EXISTS `topping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `topping` (
  `topping_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `price` int NOT NULL,
  PRIMARY KEY (`topping_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `topping`
--

LOCK TABLES `topping` WRITE;
/*!40000 ALTER TABLE `topping` DISABLE KEYS */;
INSERT INTO `topping` VALUES (1,'Chocolate',5),(2,'Blueberry',5),(3,'Rasberry',5),(4,'Crispy',6),(5,'Strawberry',6),(6,'Rum/Raisin',7),(7,'Orange',8),(8,'Lemon',8),(9,'Blue cheese',9);
/*!40000 ALTER TABLE `topping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(100) NOT NULL,
  `password` varchar(45) NOT NULL,
  `credit` int NOT NULL DEFAULT '0',
  `role` varchar(45) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Admin@olsker.dk','1234',0,'Admin'),(2,'kunde1@olsker.dk','1234',100,'Customer'),(3,'kunde2@olsker.dk','1234',100,'Customer');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `all_orders`
--

/*!50001 DROP VIEW IF EXISTS `all_orders`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `all_orders` AS select `u`.`email` AS `email`,`o`.`order_id` AS `order_id`,sum(`o`.`totalprice`) AS `SUM(totalprice)`,`r`.`ispayed` AS `betalt` from ((`orderline` `o` join `ordered` `r` on((`o`.`order_id` = `r`.`order_id`))) join `user` `u` on((`u`.`user_id` = `r`.`user_id`))) group by `o`.`order_id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `allorderlines`
--

/*!50001 DROP VIEW IF EXISTS `allorderlines`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `allorderlines` AS select `o`.`order_id` AS `order_id`,`r`.`created` AS `created`,`o`.`orderline_id` AS `orderline_id`,`o`.`quantity` AS `antal`,`t`.`name` AS `topping`,`b`.`name` AS `bund`,`u`.`email` AS `email`,`o`.`totalprice` AS `totalprice`,`r`.`ispayed` AS `ispayed` from ((((`orderline` `o` join `topping` `t` on((`t`.`topping_id` = `o`.`topping_id`))) join `bottom` `b` on((`b`.`bottom_id` = `o`.`bottom_id`))) join `ordered` `r` on((`r`.`order_id` = `o`.`order_id`))) join `user` `u` on((`u`.`user_id` = `r`.`user_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `list_of_customers_orders`
--

/*!50001 DROP VIEW IF EXISTS `list_of_customers_orders`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `list_of_customers_orders` AS select `o`.`created` AS `created`,`u`.`email` AS `email`,`o`.`order_id` AS `order_id`,sum(`l`.`totalprice`) AS `totalsum` from ((`user` `u` join `ordered` `o` on((`u`.`user_id` = `o`.`user_id`))) join `orderline` `l` on((`o`.`order_id` = `l`.`order_id`))) group by `o`.`order_id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `orderline_description`
--

/*!50001 DROP VIEW IF EXISTS `orderline_description`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `orderline_description` AS select `orderline`.`order_id` AS `order_id`,`b`.`name` AS `bund`,`t`.`name` AS `topping`,(`b`.`price` + `t`.`price`) AS `stykpris`,`orderline`.`quantity` AS `antal`,((`b`.`price` + `t`.`price`) * `orderline`.`quantity`) AS `sum` from ((`orderline` join `topping` `t` on((`orderline`.`topping_id` = `t`.`topping_id`))) join `bottom` `b` on((`orderline`.`bottom_id` = `b`.`bottom_id`))) */;
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

-- Dump completed on 2022-04-07  9:19:29

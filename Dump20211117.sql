CREATE DATABASE  IF NOT EXISTS `NBA_Project` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `NBA_Project`;
-- MySQL dump 10.13  Distrib 8.0.27, for Linux (x86_64)
--
-- Host: localhost    Database: NBA_Project
-- ------------------------------------------------------
-- Server version	8.0.27-0ubuntu0.20.04.1

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
-- Table structure for table `Contract`
--

DROP TABLE IF EXISTS `Contract`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Contract` (
  `c_id` int NOT NULL AUTO_INCREMENT,
  `mg_id` int NOT NULL,
  `p_id` int NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `wage` decimal(12,2) NOT NULL,
  `is_active` tinyint DEFAULT NULL,
  `duration` decimal(5,2) GENERATED ALWAYS AS (timestampdiff(YEAR,`start_date`,`end_date`)) VIRTUAL,
  PRIMARY KEY (`c_id`),
  KEY `fk_Contract_PlayerID` (`p_id`),
  KEY `fk_Contract_ManagerID` (`mg_id`),
  CONSTRAINT `fk_Contract_ManagerID` FOREIGN KEY (`mg_id`) REFERENCES `Manager` (`mg_id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_Contract_PlayerID` FOREIGN KEY (`p_id`) REFERENCES `Player` (`p_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Contract`
--

LOCK TABLES `Contract` WRITE;
/*!40000 ALTER TABLE `Contract` DISABLE KEYS */;
INSERT INTO `Contract` (`c_id`, `mg_id`, `p_id`, `start_date`, `end_date`, `wage`, `is_active`) VALUES (1,1,1,'2020-04-11','2022-04-10',350000.00,1),(2,1,2,'2020-03-10','2023-03-09',250000.00,1),(3,1,3,'2020-04-11','2023-04-10',157000.00,1),(4,1,4,'2019-10-11','2022-10-10',425600.00,1),(5,1,5,'2018-01-11','2022-01-10',155000.00,1),(6,1,6,'2019-04-11','2022-04-10',105000.00,1),(7,2,7,'2017-06-21','2022-06-20',235500.00,1),(8,2,8,'2019-11-07','2022-11-06',143000.00,1),(9,2,9,'2020-12-23','2022-12-22',321000.00,1),(10,2,10,'2016-10-13','2022-10-12',350700.00,1),(11,2,11,'2020-12-23','2022-09-22',270000.00,1),(12,2,12,'2016-10-13','2022-10-12',200700.00,1),(13,3,13,'2019-04-04','2022-04-03',342600.00,1),(14,3,14,'2016-11-27','2021-11-26',122000.00,1),(15,3,15,'2020-02-01','2021-12-31',144000.00,1),(16,3,16,'2015-06-23','2022-06-22',321000.00,1),(17,3,17,'2020-03-12','2022-09-11',181000.00,1),(18,3,18,'2021-02-02','2022-02-01',138000.00,1),(19,4,19,'2018-08-04','2022-02-03',257000.00,1),(20,4,20,'2019-06-17','2026-06-16',398000.00,1),(21,4,21,'2021-02-14','2025-02-13',294000.00,1),(22,4,22,'2018-04-03','2022-04-02',215000.00,1),(23,4,23,'2020-04-21','2023-04-20',235000.00,1),(24,4,24,'2021-10-07','2022-10-06',166000.00,1),(25,5,25,'2020-11-14','2022-11-13',150500.00,1),(26,5,26,'2013-07-27','2022-07-26',338000.00,1),(27,5,27,'2020-05-22','2025-05-21',278000.00,1),(28,5,28,'2019-05-14','2024-05-13',207700.00,1),(29,5,29,'2020-09-23','2023-09-22',390000.00,1),(30,5,30,'2019-05-29','2022-11-28',117700.00,1);
/*!40000 ALTER TABLE `Contract` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Fan`
--

DROP TABLE IF EXISTS `Fan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Fan` (
  `f_id` int NOT NULL,
  `fav_team` int DEFAULT NULL,
  KEY `fk_FanID` (`f_id`),
  KEY `fk_Fan_TeamID` (`fav_team`),
  CONSTRAINT `fk_Fan_TeamID` FOREIGN KEY (`fav_team`) REFERENCES `Team` (`t_id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_FanID` FOREIGN KEY (`f_id`) REFERENCES `User` (`u_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Fan`
--

LOCK TABLES `Fan` WRITE;
/*!40000 ALTER TABLE `Fan` DISABLE KEYS */;
INSERT INTO `Fan` VALUES (6,4),(7,5);
/*!40000 ALTER TABLE `Fan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Fantasy_Team`
--

DROP TABLE IF EXISTS `Fantasy_Team`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Fantasy_Team` (
  `ft_id` int NOT NULL AUTO_INCREMENT,
  `ft_name` varchar(100) DEFAULT NULL,
  `total_points` int DEFAULT '0',
  `f_id` int NOT NULL,
  PRIMARY KEY (`ft_id`),
  UNIQUE KEY `ft_name` (`ft_name`),
  KEY `fk_Fantasy_Team_Fan` (`f_id`),
  CONSTRAINT `fk_Fantasy_Team_Fan` FOREIGN KEY (`f_id`) REFERENCES `Fan` (`f_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Fantasy_Team`
--

LOCK TABLES `Fantasy_Team` WRITE;
/*!40000 ALTER TABLE `Fantasy_Team` DISABLE KEYS */;
INSERT INTO `Fantasy_Team` VALUES (1,'The Invincibles',0,6),(2,'All or Nothing',0,7);
/*!40000 ALTER TABLE `Fantasy_Team` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Manager`
--

DROP TABLE IF EXISTS `Manager`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Manager` (
  `mg_id` int NOT NULL,
  `mg_joindate` date NOT NULL,
  `salary` decimal(12,2) NOT NULL,
  KEY `fk_ManagerID` (`mg_id`),
  CONSTRAINT `fk_ManagerID` FOREIGN KEY (`mg_id`) REFERENCES `User` (`u_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Manager`
--

LOCK TABLES `Manager` WRITE;
/*!40000 ALTER TABLE `Manager` DISABLE KEYS */;
INSERT INTO `Manager` VALUES (1,'2015-02-21',250000.00),(2,'2017-10-11',150000.00),(3,'2018-09-01',300000.00),(4,'2016-05-16',270000.00),(5,'2019-01-20',250000.00);
/*!40000 ALTER TABLE `Manager` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Match`
--

DROP TABLE IF EXISTS `Match`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Match` (
  `m_id` int NOT NULL AUTO_INCREMENT,
  `m_timestamp` timestamp NOT NULL,
  `m_venue` varchar(128) NOT NULL,
  `m_city` varchar(64) NOT NULL,
  PRIMARY KEY (`m_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Match`
--

LOCK TABLES `Match` WRITE;
/*!40000 ALTER TABLE `Match` DISABLE KEYS */;
INSERT INTO `Match` VALUES (1,'2020-02-22 04:30:00','Wells Fargo Center','Philadelphia'),(2,'2020-11-13 03:00:00','Vivint Arena','Salt Lake City'),(3,'2020-02-22 01:15:00','Madison Square Garden','New York'),(4,'2020-02-22 00:00:00','Chase Center','San Francisco'),(5,'2020-02-22 02:30:00','STAPLES Center','Los Angeles');
/*!40000 ALTER TABLE `Match` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Message`
--

DROP TABLE IF EXISTS `Message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Message` (
  `f_id` int NOT NULL,
  `msg_timestamp` timestamp NOT NULL,
  `msg_content` longtext NOT NULL,
  KEY `fk_Message_Fan` (`f_id`),
  CONSTRAINT `fk_Message_Fan` FOREIGN KEY (`f_id`) REFERENCES `Fan` (`f_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Message`
--

LOCK TABLES `Message` WRITE;
/*!40000 ALTER TABLE `Message` DISABLE KEYS */;
INSERT INTO `Message` VALUES (6,'2021-11-18 01:15:13','Hey! First message'),(7,'2021-11-18 01:29:25','Go Lakers!!');
/*!40000 ALTER TABLE `Message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Participates`
--

DROP TABLE IF EXISTS `Participates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Participates` (
  `m_id` int NOT NULL,
  `t_id1` int NOT NULL,
  `t_id2` int NOT NULL,
  `winner` int NOT NULL,
  UNIQUE KEY `m_id` (`m_id`),
  KEY `fk_TeamID1` (`t_id1`),
  KEY `fk_TeamID2` (`t_id2`),
  CONSTRAINT `fk_Part_MatchID` FOREIGN KEY (`m_id`) REFERENCES `Match` (`m_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_TeamID1` FOREIGN KEY (`t_id1`) REFERENCES `Team` (`t_id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_TeamID2` FOREIGN KEY (`t_id2`) REFERENCES `Team` (`t_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Participates`
--

LOCK TABLES `Participates` WRITE;
/*!40000 ALTER TABLE `Participates` DISABLE KEYS */;
INSERT INTO `Participates` VALUES (1,1,2,1),(2,3,4,4),(3,1,4,4),(4,2,5,5),(5,3,5,3);
/*!40000 ALTER TABLE `Participates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Player`
--

DROP TABLE IF EXISTS `Player`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Player` (
  `p_id` int NOT NULL AUTO_INCREMENT,
  `p_name` varchar(45) NOT NULL,
  `p_phone` varchar(45) NOT NULL,
  `p_birthdate` date NOT NULL,
  `p_weight` decimal(6,2) NOT NULL,
  `p_height` decimal(6,2) NOT NULL,
  `t_id` int DEFAULT NULL,
  PRIMARY KEY (`p_id`),
  KEY `fk_TeamID` (`t_id`),
  CONSTRAINT `fk_TeamID` FOREIGN KEY (`t_id`) REFERENCES `Team` (`t_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Player`
--

LOCK TABLES `Player` WRITE;
/*!40000 ALTER TABLE `Player` DISABLE KEYS */;
INSERT INTO `Player` VALUES (1,'Ben Simmons','1231231234','1989-02-21',180.50,6.40,1),(2,'Seth Curry','4356736783','1985-06-02',175.30,6.20,1),(3,'Georges Niang','4523769483','1993-02-11',188.50,6.60,1),(4,'Danny Green','6758308492','1991-04-21',184.70,5.11,1),(5,'Jaden Springer','7058372957','1989-07-01',182.60,6.30,1),(6,'Paul Reed','4526569493','1988-02-02',180.50,5.10,1),(7,'Jordan Clerkson','8350736776','1984-11-02',175.30,6.10,2),(8,'Rudy Gay','4223719403','1991-10-01',188.50,6.20,2),(9,'Rudy Gobert','6758308492','1990-12-25',184.70,5.11,2),(10,'Mike Conley','9051372557','1989-03-18',182.60,6.40,2),(11,'Donovan Mitchell','1234567890','1986-03-08',182.10,5.40,2),(12,'Joe Ingles','7897778991','1995-09-18',180.20,6.90,2),(13,'Derrick Rose','1231231230','1989-02-11',180.30,6.10,3),(14,'Kemba Walker','4356736711','1985-05-02',178.00,6.00,3),(15,'RJ Barrett','4523769488','1993-07-11',188.20,5.60,3),(16,'Mitchell Robinson','1158308492','1982-04-21',180.10,5.70,3),(17,'Evan Fournier','7058372917','1986-07-01',162.60,6.00,3),(18,'Kevin Knox','4526569422','1988-02-02',180.50,5.10,3),(19,'Stephen Curry','8350736789','1984-11-02',175.10,5.10,4),(20,'Clay Thompson','4223711103','1991-06-11',181.50,6.70,4),(21,'Jordan Poole','6711308492','1997-12-15',181.20,6.10,4),(22,'James Wiseman','9051372513','1982-11-08',181.20,5.40,4),(23,'Daniel Lee','9998887777','1989-10-18',182.90,6.40,4),(24,'Draymond Green','9876543210','1998-09-22',177.20,6.20,4),(25,'LeBron James','8350736789','1984-11-02',175.10,5.10,5),(26,'Russell Westbrook','4223711103','1991-06-11',181.50,6.70,5),(27,'Carmelo Anthony','6711308492','1997-12-15',181.20,6.10,5),(28,'Anthony Davis','9051372513','1982-11-08',181.20,5.40,5),(29,'Austin Reeves','9998887777','1989-10-18',182.90,6.40,5),(30,'Dwight Howard','9876543210','1998-09-22',177.20,6.20,5);
/*!40000 ALTER TABLE `Player` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Players_Fantasy_Team`
--

DROP TABLE IF EXISTS `Players_Fantasy_Team`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Players_Fantasy_Team` (
  `ft_id` int DEFAULT NULL,
  `p_id` int NOT NULL,
  KEY `fk_Players_Fantasy_Team_FT` (`ft_id`),
  KEY `fk_Players_Fantasy_Team_Player` (`p_id`),
  CONSTRAINT `fk_Players_Fantasy_Team_FT` FOREIGN KEY (`ft_id`) REFERENCES `Fantasy_Team` (`ft_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_Players_Fantasy_Team_Player` FOREIGN KEY (`p_id`) REFERENCES `Player` (`p_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Players_Fantasy_Team`
--

LOCK TABLES `Players_Fantasy_Team` WRITE;
/*!40000 ALTER TABLE `Players_Fantasy_Team` DISABLE KEYS */;
INSERT INTO `Players_Fantasy_Team` VALUES (1,21),(1,25),(1,19),(1,4),(1,20),(1,15),(2,27),(2,18),(2,15),(2,7),(2,30),(2,14);
/*!40000 ALTER TABLE `Players_Fantasy_Team` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Stats`
--

DROP TABLE IF EXISTS `Stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Stats` (
  `s_id` int NOT NULL AUTO_INCREMENT,
  `p_id` int NOT NULL,
  `m_id` int NOT NULL,
  `tot_points` int DEFAULT '0',
  `FGA` int DEFAULT '0',
  `FGM` int DEFAULT '0',
  `3p%` decimal(6,2) DEFAULT '0.00',
  `3PA` int DEFAULT '0',
  `3PM` int DEFAULT '0',
  PRIMARY KEY (`s_id`),
  KEY `fk_PlayerID` (`p_id`),
  KEY `fk_MatchID` (`m_id`),
  CONSTRAINT `fk_MatchID` FOREIGN KEY (`m_id`) REFERENCES `Match` (`m_id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_PlayerID` FOREIGN KEY (`p_id`) REFERENCES `Player` (`p_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Stats`
--

LOCK TABLES `Stats` WRITE;
/*!40000 ALTER TABLE `Stats` DISABLE KEYS */;
INSERT INTO `Stats` VALUES (1,1,1,12,19,11,20.00,5,1),(2,2,1,13,20,8,38.46,13,5),(3,3,1,10,18,9,25.00,4,1),(4,4,1,12,21,9,33.33,9,3),(5,5,1,9,19,9,0.00,2,0),(6,6,1,11,19,9,33.33,6,2),(7,7,1,10,20,9,25.00,4,1),(8,8,1,12,22,9,30.00,10,3),(9,9,1,11,19,9,28.57,7,2),(10,10,1,10,16,9,25.00,4,1),(11,11,1,12,19,11,20.00,5,1),(12,12,1,13,20,8,38.46,13,5),(13,13,2,2,10,1,50.00,2,1),(14,14,2,13,13,9,30.77,13,4),(15,15,2,10,21,9,33.33,3,1),(16,16,2,12,15,9,100.00,3,3),(17,17,2,11,10,9,66.67,3,2),(18,18,2,6,9,6,0.00,6,0),(19,19,2,13,9,8,71.43,7,5),(20,20,2,21,21,19,25.00,8,2),(21,21,2,14,19,10,57.14,7,4),(22,22,2,2,14,2,0.00,4,0),(23,23,2,9,20,8,33.33,3,1),(24,24,2,6,4,4,66.67,3,2),(25,1,3,3,9,1,40.00,5,2),(26,2,3,11,10,7,44.44,9,4),(27,3,3,10,15,9,33.33,3,1),(28,4,3,12,11,9,75.00,4,3),(29,5,3,15,20,15,0.00,4,0),(30,6,3,2,2,1,100.00,1,1),(31,19,3,12,19,8,57.14,7,4),(32,20,3,11,12,8,75.00,4,3),(33,21,3,20,20,15,83.33,6,5),(34,22,3,12,13,12,0.00,1,0),(35,23,3,9,18,8,50.00,2,1),(36,24,3,4,3,3,100.00,1,1),(37,7,4,3,9,1,40.00,5,2),(38,8,4,11,10,7,44.44,9,4),(39,9,4,10,15,9,33.33,3,1),(40,10,4,12,11,9,75.00,4,3),(41,11,4,15,20,15,0.00,4,0),(42,12,4,2,2,1,100.00,1,1),(43,25,4,12,19,8,57.14,7,4),(44,26,4,11,12,8,75.00,4,3),(45,27,4,20,20,15,83.33,6,5),(46,28,4,12,13,12,0.00,1,0),(47,29,4,9,18,8,50.00,2,1),(48,30,4,4,3,3,100.00,1,1),(49,13,5,6,11,4,40.00,5,2),(50,14,5,13,15,9,66.67,6,4),(51,15,5,10,10,9,100.00,1,1),(52,16,5,5,14,4,33.33,3,1),(53,17,5,9,20,7,25.00,8,2),(54,18,5,18,19,16,66.67,3,2),(55,25,5,3,10,2,14.29,7,1),(56,26,5,1,8,1,0.00,3,0),(57,27,5,12,21,10,33.33,6,2),(58,28,5,5,10,4,50.00,2,1),(59,29,5,6,11,6,0.00,1,0),(60,30,5,3,4,3,0.00,0,0);
/*!40000 ALTER TABLE `Stats` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `set_dynamic_stats` BEFORE INSERT ON `Stats` FOR EACH ROW BEGIN
	SET `NEW`.tot_points = `NEW`.FGM + `NEW`.`3PM`;
	SET `NEW`.`3P%` = (CASE WHEN `NEW`.`3PA`=0 THEN 0 ELSE `NEW`.`3PM`/`NEW`.`3PA`* 100 END);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `update_ft_points` AFTER INSERT ON `Stats` FOR EACH ROW BEGIN
	UPDATE `NBA_Project`.`Fantasy_Team` as FT
	SET FT.total_points = FT.total_points + `NEW`.tot_points
	WHERE FT.ft_id in (SELECT PFT.ft_id FROM `NBA_Project`.`Players_Fantasy_Team` AS PFT WHERE PFT.p_id = NEW.p_id);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `Team`
--

DROP TABLE IF EXISTS `Team`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Team` (
  `t_id` int NOT NULL AUTO_INCREMENT,
  `t_name` varchar(64) NOT NULL,
  `t_city` varchar(64) NOT NULL,
  `t_stadiumname` varchar(128) NOT NULL,
  `mg_id` int NOT NULL,
  PRIMARY KEY (`t_id`),
  KEY `fk_Team_ManagerID` (`mg_id`),
  CONSTRAINT `fk_Team_ManagerID` FOREIGN KEY (`mg_id`) REFERENCES `Manager` (`mg_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Team`
--

LOCK TABLES `Team` WRITE;
/*!40000 ALTER TABLE `Team` DISABLE KEYS */;
INSERT INTO `Team` VALUES (1,'Philadelphia 76ers','Philadelphia','Wells Fargo Center',1),(2,'Utah Jazz','Salt Lake City','Vivint Arena',2),(3,'New York Knicks','New York','Madison Square Garden',3),(4,'Golden State Warriors','San Francisco','Chase Center',4),(5,'Los Angeles Lakers','Los Angeles','STAPLES Center',5);
/*!40000 ALTER TABLE `Team` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `User`
--

DROP TABLE IF EXISTS `User`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `User` (
  `u_id` int NOT NULL AUTO_INCREMENT,
  `u_fname` varchar(100) NOT NULL,
  `u_lname` varchar(100) NOT NULL,
  `u_phone` varchar(45) NOT NULL,
  `u_email` varchar(100) NOT NULL,
  `u_pwd` varchar(45) NOT NULL,
  PRIMARY KEY (`u_id`),
  UNIQUE KEY `u_email` (`u_email`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `User`
--

LOCK TABLES `User` WRITE;
/*!40000 ALTER TABLE `User` DISABLE KEYS */;
INSERT INTO `User` VALUES (1,'Doc','Revers','6501239277','doc_r@gmail.com','4ace452a5b7a3cf8005ab663294695c7'),(2,'Quin','Synder','4156281984','q_syn_der@yahoo.com','cc5d62fe6b2a54d1b4487689831aa4fa'),(3,'Tom','Thibodeau','1236281124','th_tom_23@gmail.com','687c7de66dab105a657df3a4ef7dda48'),(4,'Steve','Kerr','9988844321','s_kerr@gmail.com','d72ec40a244236891276c18f43079e74'),(5,'Frank','Vogel','1221344356','f_vogel@gmail.com','023ee50d55847a9d0b68eb96da0167f2'),(6,'Haard','Shah','9876543210','haard@gmail.com','7a2670a1579cb583cb77c4ea0c778627'),(7,'Ronak','Prajapati','9876543211','ronak@gmail.com','819a2dc28e0f1ead59dcd8abaa8b7199');
/*!40000 ALTER TABLE `User` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `create_new_fantasy_team_view`
--

DROP TABLE IF EXISTS `create_new_fantasy_team_view`;
/*!50001 DROP VIEW IF EXISTS `create_new_fantasy_team_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `create_new_fantasy_team_view` AS SELECT 
 1 AS `p_id`,
 1 AS `Player`,
 1 AS `Team`,
 1 AS `Points`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `create_new_ft_view`
--

DROP TABLE IF EXISTS `create_new_ft_view`;
/*!50001 DROP VIEW IF EXISTS `create_new_ft_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `create_new_ft_view` AS SELECT 
 1 AS `p_id`,
 1 AS `Player`,
 1 AS `Team`,
 1 AS `Points`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'NBA_Project'
--

--
-- Dumping routines for database 'NBA_Project'
--
/*!50003 DROP FUNCTION IF EXISTS `login` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`haard`@`localhost` FUNCTION `login`(input_uid int, input_upwd varchar(45)) RETURNS tinyint(1)
    READS SQL DATA
BEGIN
	RETURN EXISTS (SELECT u.u_id FROM `NBA_Project`.`User` as u WHERE u.u_id = input_uid AND u.u_pwd = input_upwd);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `signup` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`haard`@`localhost` FUNCTION `signup`(input_ufname varchar(100), input_ulname varchar(100), input_uphone varchar(45), input_uemail varchar(100), input_upwd varchar(45)) RETURNS tinyint(1)
    READS SQL DATA
    DETERMINISTIC
BEGIN
	DECLARE EXIT HANDLER FOR SQLEXCEPTION RETURN False;
	INSERT INTO `NBA_Project`.`User` (u_fname, u_lname, u_phone, u_email, u_pwd) VALUES(input_ufname, input_ulname, input_uphone, input_uemail, input_upwd);
	INSERT INTO `NBA_Project`.`Fan` (f_id, fav_team) VALUES ((SELECT u.u_id from `NBA_Project`.`User` as u WHERE u.u_email = input_uemail), NULL);
    RETURN True;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `create_fantasy_team` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `create_fantasy_team`(inp_fid INT, inp_ftname VARCHAR(100), inp_pid1 INT, inp_pid2 INT, inp_pid3 INT, inp_pid4 INT, inp_pid5 INT, inp_pid6 INT)
BEGIN
	DECLARE EXIT HANDLER FOR SQLEXCEPTION SELECT 0;
	INSERT INTO `NBA_Project`.`Fantasy_Team` values (NULL, inp_ftname, 0, inp_fid);
	INSERT INTO `NBA_Project`.`Players_Fantasy_Team` values ((SELECT LAST_INSERT_ID()), inp_pid1);
	INSERT INTO `NBA_Project`.`Players_Fantasy_Team` values ((SELECT LAST_INSERT_ID()), inp_pid2);
	INSERT INTO `NBA_Project`.`Players_Fantasy_Team` values ((SELECT LAST_INSERT_ID()), inp_pid3);
	INSERT INTO `NBA_Project`.`Players_Fantasy_Team` values ((SELECT LAST_INSERT_ID()), inp_pid4);
	INSERT INTO `NBA_Project`.`Players_Fantasy_Team` values ((SELECT LAST_INSERT_ID()), inp_pid5);
	INSERT INTO `NBA_Project`.`Players_Fantasy_Team` values ((SELECT LAST_INSERT_ID()), inp_pid6);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `login` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `login`(input_uemail varchar(100), input_upwd varchar(45))
BEGIN
	SELECT u.u_id FROM `NBA_Project`.`User` as u WHERE u.u_email = input_uemail AND u.u_pwd = input_upwd;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `signup` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `signup`(input_ufname varchar(100), input_ulname varchar(100), input_uphone varchar(45), input_uemail varchar(100), input_upwd varchar(45), inp_ffavteamID INT)
BEGIN
	DECLARE EXIT HANDLER FOR SQLEXCEPTION SELECT 0;
	INSERT INTO `NBA_Project`.`User` VALUES (NULL, input_ufname, input_ulname, input_uphone, input_uemail, input_upwd);
	INSERT INTO `NBA_Project`.`Fan` (f_id, fav_team) VALUES ((SELECT LAST_INSERT_ID()), inp_ffavteamID);
	SELECT 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sign_new_contract` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sign_new_contract`(inp_mgid INT, inp_pid INT, inp_startdate DATE, inp_enddate DATE, inp_wage DECIMAL(12, 2))
BEGIN
	UPDATE `NBA_Project`.`Contract` AS C SET C.is_active = FALSE WHERE C.p_id = inp_pid;
	INSERT INTO `NBA_Project`.`Contract` (mg_id, p_id, start_date, end_date, is_active, wage) 
		VALUES(inp_mgid, inp_pid, inp_startdate, inp_enddate, TRUE, inp_wage);
	UPDATE `NBA_Project`.`Player` AS P SET P.t_id = (SELECT T.T_id FROM `NBA_Project`.`Team` AS T WHERE T.mg_id = inp_mgid)
		WHERE P.p_id = inp_pid;
	SELECT 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `view_fantasy_team` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `view_fantasy_team`(inp_fid INT)
BEGIN
	SELECT p.p_name AS Player, ft.ft_name as team_name, CAST(SUM(tot_points) AS UNSIGNED) AS total_points
	FROM Fantasy_Team AS ft
	NATURAL JOIN Players_Fantasy_Team AS pft
	NATURAL JOIN Player AS p
	NATURAL JOIN Stats AS s
	WHERE ft.f_id = inp_fid
	GROUP BY s.p_id, ft.ft_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `create_new_fantasy_team_view`
--

/*!50001 DROP VIEW IF EXISTS `create_new_fantasy_team_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`haard`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `create_new_fantasy_team_view` AS select `p`.`p_id` AS `p_id`,`p`.`p_name` AS `Player`,`t`.`t_name` AS `Team`,sum(`s`.`tot_points`) AS `Points` from ((`Player` `p` join `Team` `t` on((`p`.`t_id` = `t`.`t_id`))) join `Stats` `s` on((`p`.`p_id` = `s`.`p_id`))) group by `p`.`p_id`,`t`.`t_id` order by `Points` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `create_new_ft_view`
--

/*!50001 DROP VIEW IF EXISTS `create_new_ft_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `create_new_ft_view` AS select `p`.`p_id` AS `p_id`,`p`.`p_name` AS `Player`,`t`.`t_name` AS `Team`,sum(`s`.`tot_points`) AS `Points` from ((`Player` `p` join `Team` `t` on((`p`.`t_id` = `t`.`t_id`))) join `Stats` `s` on((`p`.`p_id` = `s`.`p_id`))) group by `p`.`p_id`,`t`.`t_id` order by `Points` desc */;
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

-- Dump completed on 2021-11-17 20:34:43

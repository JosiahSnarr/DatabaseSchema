CREATE DATABASE  IF NOT EXISTS `elevator_data_repository` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `elevator_data_repository`;
-- MySQL dump 10.13  Distrib 5.7.9, for Win64 (x86_64)
--
-- Host: localhost    Database: elevator_data_repository
-- ------------------------------------------------------
-- Server version	5.6.31-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `natesh_demo_table`
--

DROP TABLE IF EXISTS `natesh_demo_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `natesh_demo_table` (
  `recv_time` datetime NOT NULL,
  `node_id` int(10) unsigned NOT NULL,
  `msg` varchar(8) NOT NULL,
  PRIMARY KEY (`recv_time`),
  UNIQUE KEY `node_id_UNIQUE` (`node_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Demo table for Natesh''s shenanigans.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `natesh_demo_table`
--

LOCK TABLES `natesh_demo_table` WRITE;
/*!40000 ALTER TABLE `natesh_demo_table` DISABLE KEYS */;
INSERT INTO `natesh_demo_table` VALUES ('1990-02-02 00:00:00',0,'0x0702');
/*!40000 ALTER TABLE `natesh_demo_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `node_status`
--

DROP TABLE IF EXISTS `node_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `node_status` (
  `last_updated` datetime NOT NULL,
  `floor1` int(10) unsigned NOT NULL,
  `floor2` int(10) unsigned NOT NULL,
  `floor3` int(10) unsigned NOT NULL,
  `car` int(10) unsigned NOT NULL,
  `pid` int(10) unsigned NOT NULL,
  PRIMARY KEY (`last_updated`),
  UNIQUE KEY `last_updated_UNIQUE` (`last_updated`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Status of all the nodes (1 - online or 0 - offline).';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `node_status`
--

LOCK TABLES `node_status` WRITE;
/*!40000 ALTER TABLE `node_status` DISABLE KEYS */;
/*!40000 ALTER TABLE `node_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ping_history`
--

DROP TABLE IF EXISTS `ping_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ping_history` (
  `time` datetime NOT NULL COMMENT 'Time the count started. Assumed 1 hour of capture.',
  `node` int(11) NOT NULL,
  `responded` int(11) NOT NULL,
  `dropped` int(11) NOT NULL,
  PRIMARY KEY (`time`),
  UNIQUE KEY `time_UNIQUE` (`time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='History of number of pings for every hour for each node.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ping_history`
--

LOCK TABLES `ping_history` WRITE;
/*!40000 ALTER TABLE `ping_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `ping_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `raw_data`
--

DROP TABLE IF EXISTS `raw_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `raw_data` (
  `recv_time` datetime NOT NULL COMMENT 'Date and time the message was received. Used as primary key.',
  `source_node_id` int(11) NOT NULL COMMENT 'ID of the node that sent the message.',
  `msg` varchar(8) NOT NULL COMMENT 'Contents of the message, up to 8 characters long.',
  PRIMARY KEY (`recv_time`),
  UNIQUE KEY `recv_time_UNIQUE` (`recv_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Contains raw data coming from the CAN bus. This data is later parsed into other tables. Should have a lifetime of 24 hours.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `raw_data`
--

LOCK TABLES `raw_data` WRITE;
/*!40000 ALTER TABLE `raw_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `raw_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sent_msgs`
--

DROP TABLE IF EXISTS `sent_msgs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sent_msgs` (
  `send_time` datetime NOT NULL,
  `msg` varchar(8) NOT NULL,
  PRIMARY KEY (`send_time`),
  UNIQUE KEY `send_time_UNIQUE` (`send_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Messages sent out as a result of remote users via the web interface.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sent_msgs`
--

LOCK TABLES `sent_msgs` WRITE;
/*!40000 ALTER TABLE `sent_msgs` DISABLE KEYS */;
/*!40000 ALTER TABLE `sent_msgs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_status`
--

DROP TABLE IF EXISTS `system_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_status` (
  `last_update` datetime NOT NULL,
  `uptime` int(10) unsigned NOT NULL,
  `car_position` int(10) unsigned NOT NULL,
  `pid_set_val` int(10) unsigned NOT NULL,
  `car_height` int(10) unsigned NOT NULL,
  `floor_select` int(3) unsigned DEFAULT NULL,
  `emergency_state_active` int(10) unsigned NOT NULL,
  `firefighter_override_active` int(10) unsigned NOT NULL,
  `car_stopped` int(10) unsigned NOT NULL,
  PRIMARY KEY (`last_update`),
  UNIQUE KEY `last_update_UNIQUE` (`last_update`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Contains system status diagnostics data.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_status`
--

LOCK TABLES `system_status` WRITE;
/*!40000 ALTER TABLE `system_status` DISABLE KEYS */;
/*!40000 ALTER TABLE `system_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_info`
--

DROP TABLE IF EXISTS `user_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_info` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(16) NOT NULL,
  `password` varchar(64) NOT NULL,
  `permission` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Contains user information, including username, password, and permission level.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_info`
--

LOCK TABLES `user_info` WRITE;
/*!40000 ALTER TABLE `user_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'elevator_data_repository'
--

--
-- Dumping routines for database 'elevator_data_repository'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-06-13 10:57:07

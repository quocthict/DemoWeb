CREATE DATABASE  IF NOT EXISTS `kiga` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `kiga`;
-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: kiga
-- ------------------------------------------------------
-- Server version	9.0.1

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
-- Table structure for table `booking`
--

DROP TABLE IF EXISTS booking;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE booking (
  id int NOT NULL AUTO_INCREMENT,
  child_id int DEFAULT NULL,
  room int DEFAULT NULL,
  booked_date date DEFAULT NULL,
  booked_time_from time DEFAULT NULL,
  booked_time_to time DEFAULT NULL,
  created_date timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  modified_date timestamp NULL DEFAULT NULL,
  PRIMARY KEY (id),
  KEY fr_child_id_booking (child_id),
  CONSTRAINT fr_child_id_booking FOREIGN KEY (child_id) REFERENCES child (id)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booking`
--

LOCK TABLES booking WRITE;
/*!40000 ALTER TABLE booking DISABLE KEYS */;
INSERT INTO booking VALUES (1,8,1,'2024-09-23','10:10:10','10:10:10','2024-09-23 00:00:00','2024-09-23 00:00:00'),(2,8,2,'2024-09-23','10:10:10','10:10:10','2024-09-23 00:00:00','2024-09-23 00:00:00'),(3,11,3,'2024-09-25','18:02:00','18:02:00','2024-09-25 04:02:15','2024-09-25 04:02:15'),(4,11,4,'2024-09-25','18:02:00','18:02:00','2024-09-25 04:03:10','2024-09-25 04:03:10'),(5,11,3,'2024-09-25','05:05:00','05:05:00','2024-09-25 04:06:17','2024-09-25 04:06:17'),(10,8,5,'2024-10-31','09:45:00','09:50:00','2024-10-28 09:48:13','2024-10-28 14:06:38');
/*!40000 ALTER TABLE booking ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `child`
--

DROP TABLE IF EXISTS child;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE child (
  id int NOT NULL AUTO_INCREMENT,
  first_name varchar(100) DEFAULT NULL,
  last_name varchar(100) DEFAULT NULL,
  gender int DEFAULT NULL,
  birth_date date DEFAULT NULL,
  created_date timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  modified_date timestamp NULL DEFAULT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `child`
--

LOCK TABLES child WRITE;
/*!40000 ALTER TABLE child DISABLE KEYS */;
INSERT INTO child VALUES (8,'X','X',1,'2023-01-31','2024-09-23 03:17:17','2024-09-23 03:44:51'),(9,'Y','Y',0,'2023-12-31','2024-09-23 03:17:32','2024-09-23 03:17:32'),(10,'Z','Z',1,'2023-12-31','2024-09-23 03:17:43','2024-09-23 03:17:43'),(11,'K','K',1,'2023-12-31','2024-09-23 03:41:52','2024-09-23 03:41:52'),(19,'Quoc','Thi 2',1,'2024-10-31','2024-10-28 18:31:33','2024-10-28 22:48:55');
/*!40000 ALTER TABLE child ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact`
--

DROP TABLE IF EXISTS contact;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE contact (
  id int NOT NULL AUTO_INCREMENT,
  first_name varchar(100) DEFAULT NULL,
  last_name varchar(100) DEFAULT NULL,
  relationship varchar(100) DEFAULT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact`
--

LOCK TABLES contact WRITE;
/*!40000 ALTER TABLE contact DISABLE KEYS */;
INSERT INTO contact VALUES (12,'An','An','dad'),(13,'Hong','Hong','mom'),(14,'Binh','Binh','Dad');
/*!40000 ALTER TABLE contact ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact_child`
--

DROP TABLE IF EXISTS contact_child;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE contact_child (
  id int NOT NULL AUTO_INCREMENT,
  contact_id int DEFAULT NULL,
  child_id int DEFAULT NULL,
  created_date timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  modified_date timestamp NULL DEFAULT NULL,
  PRIMARY KEY (id),
  KEY fr_contact_id (contact_id),
  KEY fr_child_id_contact_child (child_id),
  CONSTRAINT fr_child_id_contact_child FOREIGN KEY (child_id) REFERENCES child (id) ON UPDATE CASCADE,
  CONSTRAINT fr_contact_id FOREIGN KEY (contact_id) REFERENCES contact (id) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact_child`
--

LOCK TABLES contact_child WRITE;
/*!40000 ALTER TABLE contact_child DISABLE KEYS */;
INSERT INTO contact_child VALUES (1,12,8,'2024-09-22 15:28:23',NULL),(2,12,9,'2024-09-22 15:28:36',NULL),(3,13,10,'2024-09-22 15:28:51',NULL),(4,14,10,'2024-09-22 15:29:04',NULL),(10,12,19,'2024-10-28 18:31:33','2024-10-28 18:31:33');
/*!40000 ALTER TABLE contact_child ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sign`
--

DROP TABLE IF EXISTS sign;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE sign (
  id int NOT NULL AUTO_INCREMENT,
  booking_id int DEFAULT NULL,
  contact_id int DEFAULT NULL,
  `type` int DEFAULT NULL,
  sign_time time DEFAULT NULL,
  signature varchar(3000) DEFAULT NULL,
  created_date timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  modified_date timestamp NULL DEFAULT NULL,
  PRIMARY KEY (id),
  KEY fr_booking_id_sign (booking_id),
  KEY fr_contact_id_sign (contact_id),
  CONSTRAINT fr_booking_id_sign FOREIGN KEY (booking_id) REFERENCES booking (id),
  CONSTRAINT fr_contact_id_sign FOREIGN KEY (contact_id) REFERENCES contact (id)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sign`
--

LOCK TABLES sign WRITE;
/*!40000 ALTER TABLE sign DISABLE KEYS */;
INSERT INTO sign VALUES (1,1,12,0,'13:30:00','1234','2022-10-10 00:00:00','2024-10-28 17:29:39'),(2,1,12,0,'13:30:10','123','2022-10-10 00:00:00','2022-10-10 00:00:00'),(3,2,14,1,'10:50:00','1234','2024-09-25 22:45:53','2024-10-28 17:31:36'),(6,2,12,0,'09:51:00','12345','2024-09-27 13:14:49','2024-10-29 04:49:34');
/*!40000 ALTER TABLE sign ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-10-29 10:21:37

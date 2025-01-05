-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: localhost    Database: hw2-shitot
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

--
-- Table structure for table `activityhistory`
--

DROP TABLE IF EXISTS `activityhistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `activityhistory` (
  `SubscriberID` int NOT NULL,
  `BookName` varchar(255) DEFAULT NULL,
  `ActionType` enum('Borrow','Return','Reservation','UpdateDetails') NOT NULL,
  `ActionDate` varchar(50) NOT NULL,
  `AdditionalDetails` text,
  KEY `SubscriberID` (`SubscriberID`),
  CONSTRAINT `activityhistory_ibfk_1` FOREIGN KEY (`SubscriberID`) REFERENCES `subscriber` (`subscriber_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activityhistory`
--

LOCK TABLES `activityhistory` WRITE;
/*!40000 ALTER TABLE `activityhistory` DISABLE KEYS */;
INSERT INTO `activityhistory` VALUES (1,'The Great Gatsby','Return','31-12-2024 11:14:04','Book returned in good condition.'),(1,'The Great Gatsby','Borrow','31-12-2024 14:59:48','First loan of the subscriber.'),(1,'To Kill a Mockingbird','Borrow','01-01-2024 10:15:00','Borrowed for school project.'),(1,'1984','Borrow','15-02-2024 15:30:00','Returned in good condition.'),(1,'Moby Dick','Borrow','10-03-2024 09:00:00','Reserved for summer reading.'),(2,'The Catcher in the Rye','Borrow','05-04-2024 11:45:00','Borrowed by a new subscriber.'),(2,'Pride and Prejudice','Borrow','20-05-2024 14:20:00','Loan for literature class.'),(2,'War and Peace','Borrow','10-06-2024 16:00:00','Returned late with a small fine.'),(3,'Great Expectations','Borrow','12-07-2024 12:00:00','First-time loan for this subscriber.'),(3,'Ulysses','Borrow','15-08-2024 10:30:00','Reserved for advanced literature study.'),(3,'Jane Eyre','Borrow','01-09-2024 09:45:00','Borrowed along with other novels.'),(3,'Brave New World','Borrow','10-09-2024 17:15:00','Returned in excellent condition.'),(1,'harry 5','Reservation','2025-01-02T17:39:54.855017700',''),(1,'hooho','Reservation','2025-01-02T17:47:28.239459200',''),(1,'charley bit my finger!','Reservation','2025-01-02T17:48:16.565638800',''),(1,'bottle of water','Reservation','2025-01-02T18:36:35.073977900',''),(1,'bottle of water','Reservation','2025-01-02T18:36:58.715549700',''),(1,'bottle of water','Reservation','2025-01-02T18:37:16.246017700',''),(1,'bottle of water','Reservation','2025-01-02T18:37:58.534415',''),(1,'bottle of water','Reservation','2025-01-02T18:38:41.452350700',''),(1,'bottle of water','Reservation','2025-01-02T18:39:50.871937200',''),(1,'bottle of water','Reservation','2025-01-02T18:40:54.797356300',''),(1,'bottle of water','Reservation','2025-01-02T18:42:39.116033',''),(1,'bottle','Reservation','2025-01-02T18:45:13.440294700',''),(1,'bottle','Reservation','2025-01-02T18:45:46.407858400',''),(1,'bottle of rum','Reservation','2025-01-02T18:49:07.771957300',''),(1,'bottle of rumi','Reservation','2025-01-02T18:50:23.914685200',''),(1,'dor shamo 2','Reservation','2025-01-02T20:24:16.221023200',''),(1,'War and Peace','Reservation','2025-01-03T12:47:04.266877','');
/*!40000 ALTER TABLE `activityhistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `books`
--

DROP TABLE IF EXISTS `books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `books` (
  `bookName` varchar(50) NOT NULL,
  `copysAvailable` varchar(45) DEFAULT NULL,
  `totalCopys` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`bookName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `books`
--

LOCK TABLES `books` WRITE;
/*!40000 ALTER TABLE `books` DISABLE KEYS */;
INSERT INTO `books` VALUES ('1984','7','15'),('Harry Potter and the Sorcerer\'s Stone','10','25'),('Moby Dick','3','6'),('Pride and Prejudice','6','12'),('The Catcher in the Rye','4','8'),('The Great Gatsby','8','20'),('The Hobbit','9','18'),('The Lord of the Rings','7','14'),('To Kill a Mockingbird','5','10'),('War and Peace','0','5');
/*!40000 ALTER TABLE `books` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `time` varchar(45) NOT NULL,
  `bookName` varchar(45) DEFAULT NULL,
  `subID` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES ('2025-01-02T17:29:36.302408900','123',NULL),('2025-01-02T17:31:41.521567200','Harry Potter',NULL),('2025-01-02T17:34:46.366254','Harry 2',NULL),('2025-01-02T17:35:49.724073100','harry 3',NULL),('2025-01-02T17:37:55.382181800','harry 4',NULL),('2025-01-02T17:39:54.830058900','harry 5',NULL),('2025-01-02T17:45:38.014521300','Charley bit my finger',NULL),('2025-01-02T17:46:00.774661100','harry 123',NULL),('2025-01-02T17:46:29.270188900','harry?',NULL),('2025-01-02T17:47:01.734524600','haaarrrrrrrrryyy',NULL),('2025-01-02T17:47:28.232073400','hooho',NULL),('2025-01-02T17:48:16.538729800','charley bit my finger!',NULL),('2025-01-02T18:36:35.068513200','bottle of water',NULL),('2025-01-02T18:36:58.705700200','bottle of water',NULL),('2025-01-02T18:37:16.222832600','bottle of water',NULL),('2025-01-02T18:37:58.508282500','bottle of water',NULL),('2025-01-02T18:38:41.428663700','bottle of water',NULL),('2025-01-02T18:39:50.848322400','bottle of water',NULL),('2025-01-02T18:40:54.771802900','bottle of water',NULL),('2025-01-02T18:42:39.065725300','bottle of water',NULL),('2025-01-02T18:45:13.417510900','bottle',NULL),('2025-01-02T18:45:46.383755100','bottle',NULL),('2025-01-02T18:49:07.750953300','bottle of rum',NULL),('2025-01-02T18:50:23.888837100','bottle of rumi',NULL),('2025-01-02T20:24:16.205368900','dor shamo 2',NULL),('2025-01-03T12:47:04.258550200','War and Peace',NULL);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subscriber`
--

DROP TABLE IF EXISTS `subscriber`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subscriber` (
  `subscriber_id` int NOT NULL AUTO_INCREMENT,
  `subscriber_name` varchar(255) NOT NULL,
  `subscriber_phone_number` varchar(15) DEFAULT NULL,
  `subscriber_email` varchar(255) DEFAULT NULL,
  `detailed_subscription_history` int DEFAULT NULL,
  `subscription_number` int DEFAULT NULL,
  PRIMARY KEY (`subscriber_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subscriber`
--

LOCK TABLES `subscriber` WRITE;
/*!40000 ALTER TABLE `subscriber` DISABLE KEYS */;
INSERT INTO `subscriber` VALUES (1,'dor','','',1,1121),(2,'John Doe','123-456-7890','john.doe@example.com',NULL,NULL),(3,'Jane Smith','987-654-3210','jane.smith@example.com',NULL,NULL),(4,'Alice Johnson','555-666-7777','alice.johnson@example.com',NULL,NULL);
/*!40000 ALTER TABLE `subscriber` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-01-04 15:36:35
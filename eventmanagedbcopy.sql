-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: localhost    Database: eventmanagementdb
-- ------------------------------------------------------
-- Server version	8.0.40

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
-- Table structure for table `attendee`
--

DROP TABLE IF EXISTS `attendee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attendee` (
  `Attendee_ID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) NOT NULL,
  `Contact_Info` varchar(100) NOT NULL,
  `RSVP_Status` varchar(20) NOT NULL,
  PRIMARY KEY (`Attendee_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attendee`
--

LOCK TABLES `attendee` WRITE;
/*!40000 ALTER TABLE `attendee` DISABLE KEYS */;
INSERT INTO `attendee` VALUES (1,'John Doe','johndoe@example.com','Confirmed'),(2,'Jane Smith','janesmith@example.com','Pending'),(3,'Bob Johnson','bobjohnson@example.com','Confirmed'),(4,'Alice Brown','alicebrown@example.com','Declined'),(5,'Charlie Green','charliegreen@example.com','Confirmed'),(6,'Emma White','emmawhite@example.com','Pending'),(7,'Lucas Black','lucasblack@example.com','Confirmed'),(8,'Sophia Blue','sophiablue@example.com','Declined'),(9,'Mason Gray','masongray@example.com','Confirmed'),(10,'Olivia Red','oliviared@example.com','Pending');
/*!40000 ALTER TABLE `attendee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event`
--

DROP TABLE IF EXISTS `event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `event` (
  `Event_ID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) NOT NULL,
  `Date` date NOT NULL,
  `Time` time NOT NULL,
  `Venue_ID` int NOT NULL,
  `Budget` decimal(10,2) NOT NULL,
  PRIMARY KEY (`Event_ID`),
  KEY `Venue_ID` (`Venue_ID`),
  CONSTRAINT `event_ibfk_1` FOREIGN KEY (`Venue_ID`) REFERENCES `venue` (`Venue_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event`
--

LOCK TABLES `event` WRITE;
/*!40000 ALTER TABLE `event` DISABLE KEYS */;
INSERT INTO `event` VALUES (1,'Tech Conference 2024','2024-12-01','09:00:00',1,10000.00),(2,'Gala Dinner','2024-12-15','19:00:00',2,15000.00),(3,'Charity Auction','2024-11-30','18:00:00',3,12000.00),(4,'Wedding Reception','2024-10-10','17:00:00',4,20000.00),(5,'Corporate Seminar','2024-09-20','10:00:00',5,5000.00),(6,'Music Festival','2024-08-15','12:00:00',6,30000.00),(7,'Cultural Festival','2024-07-22','11:00:00',7,8000.00),(8,'Startup Meetup','2024-06-05','15:00:00',8,7000.00),(9,'Art Exhibition','2024-05-18','13:00:00',9,6000.00),(10,'Networking Night','2024-04-25','18:00:00',10,4000.00);
/*!40000 ALTER TABLE `event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event_attendees`
--

DROP TABLE IF EXISTS `event_attendees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `event_attendees` (
  `Event_ID` int NOT NULL,
  `Attendee_ID` int NOT NULL,
  PRIMARY KEY (`Event_ID`,`Attendee_ID`),
  KEY `Attendee_ID` (`Attendee_ID`),
  CONSTRAINT `event_attendees_ibfk_1` FOREIGN KEY (`Event_ID`) REFERENCES `event` (`Event_ID`),
  CONSTRAINT `event_attendees_ibfk_2` FOREIGN KEY (`Attendee_ID`) REFERENCES `attendee` (`Attendee_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_attendees`
--

LOCK TABLES `event_attendees` WRITE;
/*!40000 ALTER TABLE `event_attendees` DISABLE KEYS */;
INSERT INTO `event_attendees` VALUES (1,1),(1,2),(2,3),(2,4),(3,5),(3,6),(4,7),(4,8),(5,9),(5,10);
/*!40000 ALTER TABLE `event_attendees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `organizer`
--

DROP TABLE IF EXISTS `organizer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `organizer` (
  `Organizer_ID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) NOT NULL,
  `Contact_Info` varchar(100) NOT NULL,
  PRIMARY KEY (`Organizer_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `organizer`
--

LOCK TABLES `organizer` WRITE;
/*!40000 ALTER TABLE `organizer` DISABLE KEYS */;
INSERT INTO `organizer` VALUES (1,'Michael Scott','mscott@dundermifflin.com'),(2,'Pam Beesly','pbeesly@dundermifflin.com'),(3,'Jim Halpert','jhalpert@dundermifflin.com'),(4,'Dwight Schrute','dschrute@dundermifflin.com'),(5,'Stanley Hudson','shudson@dundermifflin.com'),(6,'Phyllis Vance','pvance@dundermifflin.com'),(7,'Angela Martin','amartin@dundermifflin.com'),(8,'Kevin Malone','kmalone@dundermifflin.com'),(9,'Oscar Martinez','omartinez@dundermifflin.com'),(10,'Ryan Howard','rhoward@dundermifflin.com');
/*!40000 ALTER TABLE `organizer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `venue`
--

DROP TABLE IF EXISTS `venue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `venue` (
  `Venue_ID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) NOT NULL,
  `Location` varchar(100) NOT NULL,
  `Capacity` int NOT NULL,
  `Cost` decimal(10,2) NOT NULL,
  PRIMARY KEY (`Venue_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venue`
--

LOCK TABLES `venue` WRITE;
/*!40000 ALTER TABLE `venue` DISABLE KEYS */;
INSERT INTO `venue` VALUES (1,'Grand Ballroom','Downtown',500,1500.00),(2,'Conference Hall A','City Center',300,1000.00),(3,'Banquet Room B','Midtown',200,750.00),(4,'Outdoor Pavilion','Riverside',400,1200.00),(5,'Community Hall','Suburb',250,500.00),(6,'VIP Lounge','Luxury District',100,2000.00),(7,'Cultural Center','Historic Town',350,900.00),(8,'Event Arena','Downtown',600,2500.00),(9,'Exhibition Hall','Business District',700,3000.00),(10,'Rooftop Terrace','Skyline Heights',150,1800.00);
/*!40000 ALTER TABLE `venue` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-29 18:06:05

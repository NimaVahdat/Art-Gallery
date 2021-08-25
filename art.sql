-- MySQL dump 10.13  Distrib 8.0.23, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: art
-- ------------------------------------------------------
-- Server version	8.0.23

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
-- Table structure for table `artist_address`
--

DROP TABLE IF EXISTS `artist_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `artist_address` (
  `Zip` varchar(20) NOT NULL,
  `City` varchar(20) DEFAULT NULL,
  `State` varchar(20) DEFAULT NULL,
  `Country` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`Zip`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artist_address`
--

LOCK TABLES `artist_address` WRITE;
/*!40000 ALTER TABLE `artist_address` DISABLE KEYS */;
INSERT INTO `artist_address` VALUES ('10115','Berlin','Berlin','Germany'),('10179','Berlin','Berlin','Germany'),('K1R','Ottawa','Ontario','Canada'),('K1Y','Ottawa','Ontario','Canada'),('K2B','Ottawa','Ontario','Canada'),('M4E','Toronto','Ontario','Canada'),('M4J','Toronto','Ontario','Canada'),('M5R','Toronto','Ontario','Canada'),('M5S','Toronto','Ontario','Canada'),('M6G','Toronto','Ontario','Canada'),('M8V','Toronto','Ontario','Canada'),('V6L','Vancouver','British Columbia','Canada'),('V7Y','Vancouver','Biritish Columbia','Canada');
/*!40000 ALTER TABLE `artist_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `artist_info`
--

DROP TABLE IF EXISTS `artist_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `artist_info` (
  `ArtistID` int NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(100) DEFAULT NULL,
  `LastName` varchar(100) DEFAULT NULL,
  `BirthDate` varchar(100) DEFAULT NULL,
  `BirthPlace` varchar(100) DEFAULT NULL,
  `Address` varchar(100) DEFAULT NULL,
  `Zip` varchar(20) DEFAULT NULL,
  `PhoneNumber` int DEFAULT NULL,
  `Style` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ArtistID`),
  KEY `Zip` (`Zip`),
  CONSTRAINT `artist_info_ibfk_1` FOREIGN KEY (`Zip`) REFERENCES `artist_address` (`Zip`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artist_info`
--

LOCK TABLES `artist_info` WRITE;
/*!40000 ALTER TABLE `artist_info` DISABLE KEYS */;
INSERT INTO `artist_info` VALUES (1,'Karin','Schneider','01/08/1964','Berlin','Berlin South','10115',49586324,'Realism'),(2,'Helmout','Schodouer','05/09/1957','Berlin','Belrlin West','10179',49658425,'Modernism'),(3,'John','Richard','06/12/1970','Ottawa','Ottawa South','K1R',18549102,'Realism'),(4,'Liza','Blake','02/04/1963','Ottawa','Ottawa Downtown','K1Y',15945651,'Realism'),(5,'Sara','Galler','03/10/1975','Ottawa','Ottawa','K2B',18416845,'Modernism'),(6,'Nima','Vahdat','04/03/2000','Iran','Priouzi','M4E',19553244,'Realism'),(7,'Richards','Blake','06/04/1988','Toronto','Downtown','M4J',16548421,'Realism'),(8,'Maria','Sanches','10/12/1955','France','South Toronto','M5R',15487521,'Expressionism'),(9,'Shahram','Saberi','09/11/1960','Iran','West Toronto','M5S',19854210,'Expressionism'),(10,'Bahram','Mazloumi','04/07/1944','Iran','South Toronto','M6G',16549152,'Realism'),(11,'Michele','Hadson','06/02/1985','Germany','Downtown','M8V',15485258,'Realism'),(12,'Kimia','Ahmadi','04/09/1994','Iran','Downtown','V6L',16854652,'Expressionism'),(13,'Koroush','Zarandouz','05/05/1990','Iran','Downtown','V7Y',18454242,'Realism');
/*!40000 ALTER TABLE `artist_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `artwork`
--

DROP TABLE IF EXISTS `artwork`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `artwork` (
  `ArtID` int NOT NULL AUTO_INCREMENT,
  `Year` int DEFAULT NULL,
  `Title` varchar(20) DEFAULT NULL,
  `Price` varchar(20) DEFAULT NULL,
  `Description` varchar(200) DEFAULT NULL,
  `Type` varchar(20) DEFAULT NULL,
  `ArtistID` int DEFAULT NULL,
  `ExhibitionID` int DEFAULT NULL,
  PRIMARY KEY (`ArtID`),
  KEY `ArtistID` (`ArtistID`),
  KEY `ExhibitionID` (`ExhibitionID`),
  CONSTRAINT `artwork_ibfk_1` FOREIGN KEY (`ArtistID`) REFERENCES `artist_info` (`ArtistID`),
  CONSTRAINT `artwork_ibfk_2` FOREIGN KEY (`ExhibitionID`) REFERENCES `exhibition_info` (`ExhibitionID`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artwork`
--

LOCK TABLES `artwork` WRITE;
/*!40000 ALTER TABLE `artwork` DISABLE KEYS */;
INSERT INTO `artwork` VALUES (1,2012,'Courage','2000','The series of individual productions problematises and improvises the resonance to concretize.','Acrylic',13,16),(2,2016,'Mirror','5000','It has its origins in intercultural lectures based on appendices such as local, collective complicities and anonymous and antagonistic mobilities.','Oil Painting',12,16),(3,2018,'Questions','3500','If an output is exchanging absences, it could linearly evolve the influence system.','Oil Painting',1,16),(4,2018,'Shallow Impact','4700','Alongside transitivities from these fluctuations, it also includes gender-specific pedestals from various cosmopolitan and allegorical text syntheses.','Color pencil',11,17),(5,2017,'Tainted Decision','6000','In order to exchange this significance of recognisable muses and the refutation of it\'s result to localise - which is referably cohesive - the location exaggerates it\'s symbolic chapter.','Acrylic',10,17),(6,2011,'Crowded Fall','10000','The modernism delineates and re-experiences the corporal, supplementary geometries.','Color pencil',1,18),(7,2013,'Dream of Chaos','8000','This overlapping, taxonomic discrepancy repletes and incorporates an array of indirections upgraded by the permanent and adjacent lounge.','Oil Painting',2,18),(8,2015,'Passage of Evil','6000','It circulates arrangements from various interesting configurations.','Oil Painting',8,19),(9,2020,'Sympathy','5000','The complexity cross-sections and accesses the experimental, pregnant vulnerability.','Color pencil',9,19),(10,2020,'Spring of Harmony','5500','Alongside dualisms from these motivations, it also includes distinctive, detailed shortcuts from various indexical generators.','Oil Painting',7,20),(11,2021,'Tension','6700','The structure combines and modifies the resonance to interlace.','Color pencil',2,20),(12,2021,'Action','8900','The psychosocial, unrefined abstraction de-sublimates and marginalises the peintures.','Acrylic',6,25),(13,2021,'Nerve','4600','The ability to restage combines and formulates the subconscious surface, while the compact and megalomaniac sponsor specifies and executes the subliminal, defining surrounding.','Oil Painting',5,21),(14,2021,'Defiant Division','2000','The singularity of transnational adjustments partially and heterogeneously concretizes the video sequence to surroundings.','Color pencil',3,22),(15,2020,'Trivial Love','3500','The resonance to differentiate ignores and arrays the formalism.','Oil Painting',5,23),(16,2018,'Active Clouds','1200','The paraphrase intervened these sub-phenomena through it\'s large-format contextual art with a characteristic animation.','Oil Painting',3,23),(17,2019,'Support of Discovery','1800','It originates signals, both protesting the pedantic and heterogeneous assemblies and it\'s backgrounds, and embodies them in it\'s cognitive, inconceivable media art.','Acrylic',4,24);
/*!40000 ALTER TABLE `artwork` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_address`
--

DROP TABLE IF EXISTS `customer_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_address` (
  `Zip` varchar(20) NOT NULL,
  `City` varchar(20) DEFAULT NULL,
  `State` varchar(20) DEFAULT NULL,
  `Country` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`Zip`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_address`
--

LOCK TABLES `customer_address` WRITE;
/*!40000 ALTER TABLE `customer_address` DISABLE KEYS */;
INSERT INTO `customer_address` VALUES ('10145','Berlin','Berlin','Germany'),('10185','Berlin','Berlin','Germany'),('K1M','Ottawa','Ontario','Canada'),('K2R','Ottawa','Ontario','Canada'),('K5C','Ottawa','Ontario','Canada'),('M1M','Toronto','Ontario','Canada'),('M2R','Toronto','Ontario','Canada'),('M4K','Toronto','Ontario','Canada'),('M6R','Toronto','Ontario','Canada'),('M6S','Toronto','Ontario','Canada'),('M7V','Toronto','Ontario','Canada'),('V2L','Vancouver','British Columbia','Canada'),('V5Y','Vancouver','Biritish Columbia','Canada');
/*!40000 ALTER TABLE `customer_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_info`
--

DROP TABLE IF EXISTS `customer_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_info` (
  `CustomerID` int NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(100) DEFAULT NULL,
  `LastName` varchar(100) DEFAULT NULL,
  `PhoneNumber` int DEFAULT NULL,
  `Address` varchar(100) DEFAULT NULL,
  `Zip` varchar(20) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `RentedNum` int DEFAULT '0',
  `OrderedNum` int DEFAULT '0',
  PRIMARY KEY (`CustomerID`),
  KEY `Zip` (`Zip`),
  CONSTRAINT `customer_info_ibfk_1` FOREIGN KEY (`Zip`) REFERENCES `customer_address` (`Zip`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_info`
--

LOCK TABLES `customer_info` WRITE;
/*!40000 ALTER TABLE `customer_info` DISABLE KEYS */;
INSERT INTO `customer_info` VALUES (47,'Ben','Anggle',49542157,'West Berlin','10145','anggle.ben@gmail.com',1,0),(48,'Max','Okhlifen',49584751,'South Berlin','10185','max15okh@gmail.com',1,1),(49,'Janet','Rodrigez',16879487,'Downtown','K1M','janet1964@gmail.com',1,1),(50,'Alex','Forman',18461554,'Downtown','K2R','alexforman123@gmail.com',1,1),(51,'Martin','Laren',19852745,'South Ottawa','K5C','mm.laren1988@gmail.com',1,1),(52,'Alireza','Chamani',16848587,'Downtown','M1M','alireza.chamani@gmail.com',1,1),(53,'Mamad','Richards',18456875,'North Toronto','M2R','themadmammad@gmail.com',1,1),(54,'Sajjad','Jalali',15456488,'South Toronto','M4K','sajmaj2000@gmail.com',1,1),(55,'Barney','Stinsone',16845125,'Downtown','M6R','barneymagnet@gmail.com',1,1),(56,'Marshal','Amini',16584554,'North Toronto','M6S','marshalamini@gmail.com',1,1),(57,'Hamid','Hamidi',15798558,'West Toronto','M7V','hamidhamidi@gmail.com',0,1),(58,'Sami','Beigi',15478790,'Downtown','V2L','samibeigi1987@gmail.com',0,0),(59,'Alfered','Sonbour',18975285,'West Vancouver','V5Y','alferedson12345@gmail.com',1,1);
/*!40000 ALTER TABLE `customer_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exhibition_address`
--

DROP TABLE IF EXISTS `exhibition_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exhibition_address` (
  `Zip` varchar(20) NOT NULL,
  `City` varchar(20) DEFAULT NULL,
  `State` varchar(20) DEFAULT NULL,
  `Country` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`Zip`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exhibition_address`
--

LOCK TABLES `exhibition_address` WRITE;
/*!40000 ALTER TABLE `exhibition_address` DISABLE KEYS */;
INSERT INTO `exhibition_address` VALUES ('10115','Berlin','Berlin','Germany'),('10179','Berlin','Berlin','Germany'),('K1R','Ottawa','Ontario','Canada'),('K1Y','Ottawa','Ontario','Canada'),('K2B','Ottawa','Ontario','Canada'),('M1A','Toronto','Ontario','Canada'),('M4E','Toronto','Ontario','Canada'),('M4J','Toronto','Ontario','Canada'),('V1L','Vancouver','British Columbia','Canada'),('V9M','Vancouver','Biritish Columbia','Canada');
/*!40000 ALTER TABLE `exhibition_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exhibition_info`
--

DROP TABLE IF EXISTS `exhibition_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exhibition_info` (
  `ExhibitionID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) DEFAULT NULL,
  `StartDate` varchar(100) DEFAULT NULL,
  `EndDate` int DEFAULT NULL,
  `Zip` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ExhibitionID`),
  KEY `Zip` (`Zip`),
  CONSTRAINT `exhibition_info_ibfk_1` FOREIGN KEY (`Zip`) REFERENCES `exhibition_address` (`Zip`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exhibition_info`
--

LOCK TABLES `exhibition_info` WRITE;
/*!40000 ALTER TABLE `exhibition_info` DISABLE KEYS */;
INSERT INTO `exhibition_info` VALUES (16,'Lufun','15/08/2021',25,'10115'),(17,'Bakh','10/01/2021',22,'10179'),(18,'Loaran','12/05/2020',20,'K1R'),(19,'Manches','01/02/2021',25,'K1Y'),(20,'Subon','02/08/2019',8,'K2B'),(21,'Lutus','27/07/2021',7,'M1A'),(22,'Martina','14/12/2021',20,'M4E'),(23,'Maxpanin','10/10/2021',20,'M4J'),(24,'Eminema','15/01/2018',27,'V1L'),(25,'Rojina','23/04/2020',29,'V9M');
/*!40000 ALTER TABLE `exhibition_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hall`
--

DROP TABLE IF EXISTS `hall`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hall` (
  `HallID` int NOT NULL AUTO_INCREMENT,
  `HallName` varchar(100) DEFAULT NULL,
  `Size` int DEFAULT NULL,
  `ExhibitionID` int DEFAULT NULL,
  PRIMARY KEY (`HallID`),
  KEY `ExhibitionID` (`ExhibitionID`),
  CONSTRAINT `hall_ibfk_1` FOREIGN KEY (`ExhibitionID`) REFERENCES `exhibition_info` (`ExhibitionID`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hall`
--

LOCK TABLES `hall` WRITE;
/*!40000 ALTER TABLE `hall` DISABLE KEYS */;
INSERT INTO `hall` VALUES (1,'A8',1000,16),(2,'V7',5000,16),(3,'C7',2000,17),(4,'W7',1000,17),(5,'T7',3000,17),(6,'Q7',2000,18),(7,'H7',4000,18),(8,'L4',2000,19),(9,'Q6',3000,20),(10,'U8',5000,20),(11,'O4',1000,21),(12,'Z4',2000,21),(13,'C2',2000,22),(14,'C3',3000,23),(15,'R8',2000,24),(16,'G4',1000,24),(17,'G6',2000,25),(18,'H7',1000,25),(19,'P3',3000,25);
/*!40000 ALTER TABLE `hall` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_to_buy`
--

DROP TABLE IF EXISTS `order_to_buy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_to_buy` (
  `OrderID` int NOT NULL AUTO_INCREMENT,
  `OrderPrice` varchar(20) DEFAULT NULL,
  `OrderDate` varchar(20) DEFAULT NULL,
  `ArtID` int DEFAULT NULL,
  `CustomerID` int DEFAULT NULL,
  PRIMARY KEY (`OrderID`),
  KEY `CustomerID` (`CustomerID`),
  KEY `ArtID` (`ArtID`),
  CONSTRAINT `order_to_buy_ibfk_1` FOREIGN KEY (`CustomerID`) REFERENCES `customer_info` (`CustomerID`),
  CONSTRAINT `order_to_buy_ibfk_2` FOREIGN KEY (`ArtID`) REFERENCES `artwork` (`ArtID`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_to_buy`
--

LOCK TABLES `order_to_buy` WRITE;
/*!40000 ALTER TABLE `order_to_buy` DISABLE KEYS */;
INSERT INTO `order_to_buy` VALUES (1,'2000','20/12/2021',1,49),(2,'4700','21/12/2021',4,48),(3,'6000','22/12/2021',8,50),(4,'8900','23/12/2021',12,57),(5,'1200','24/12/2021',16,51),(6,'5000','25/12/2021',2,56),(7,'10000','26/12/2021',6,52),(8,'5500','27/12/2021',10,55),(9,'2000','28/12/2021',14,53),(10,'3500','27/12/2021',3,54),(11,'4700','19/06/2021',13,59);
/*!40000 ALTER TABLE `order_to_buy` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `order_to_buy_after` AFTER INSERT ON `order_to_buy` FOR EACH ROW UPDATE customer_info SET OrderedNum = OrderedNum + 1
    WHERE CustomerID = NEW.CustomerID */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `rental`
--

DROP TABLE IF EXISTS `rental`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rental` (
  `RentalID` int NOT NULL AUTO_INCREMENT,
  `RentalStartDate` varchar(20) DEFAULT NULL,
  `RentalEndDate` varchar(20) DEFAULT NULL,
  `RentalPrice` varchar(20) DEFAULT NULL,
  `CustomerID` int DEFAULT NULL,
  `ArtID` int DEFAULT NULL,
  PRIMARY KEY (`RentalID`),
  KEY `CustomerID` (`CustomerID`),
  KEY `ArtID` (`ArtID`),
  CONSTRAINT `rental_ibfk_1` FOREIGN KEY (`CustomerID`) REFERENCES `customer_info` (`CustomerID`),
  CONSTRAINT `rental_ibfk_2` FOREIGN KEY (`ArtID`) REFERENCES `artwork` (`ArtID`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rental`
--

LOCK TABLES `rental` WRITE;
/*!40000 ALTER TABLE `rental` DISABLE KEYS */;
INSERT INTO `rental` VALUES (1,'10/10/2021','15/10/2021','200',47,7),(2,'01/01/2021','06/01/2021','500',56,12),(3,'02/02/2021','07/02/2021','600',48,10),(4,'03/03/2021','08/03/2021','450',55,6),(5,'04/04/2021','09/04/2021','340',54,8),(6,'05/05/2021','10/05/2021','710',49,5),(7,'06/06/2021','11/06/2021','684',51,13),(8,'07/07/2021','12/07/2021','365',53,14),(9,'08/08/2021','13/08/2021','561',50,1),(10,'09/09/2021','14/09/2021','129',52,17),(11,'06/06/2021','12/06/2021','650',59,5);
/*!40000 ALTER TABLE `rental` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `rental_after` AFTER INSERT ON `rental` FOR EACH ROW UPDATE customer_info SET RentedNum = RentedNum + 1
    WHERE CustomerID = NEW.CustomerID */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staff` (
  `StaffID` int NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(100) DEFAULT NULL,
  `LastName` varchar(100) DEFAULT NULL,
  `PhoneNumber` int DEFAULT NULL,
  `ExhibitionID` int DEFAULT NULL,
  PRIMARY KEY (`StaffID`),
  KEY `ExhibitionID` (`ExhibitionID`),
  CONSTRAINT `staff_ibfk_1` FOREIGN KEY (`ExhibitionID`) REFERENCES `exhibition_info` (`ExhibitionID`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff`
--

LOCK TABLES `staff` WRITE;
/*!40000 ALTER TABLE `staff` DISABLE KEYS */;
INSERT INTO `staff` VALUES (1,'George','Meyer',1895515,16),(2,'Charles','Black',1451558,16),(3,'Henry','Mcdonald',1484581,16),(4,'Joseph','Berry',1841841,17),(5,'Edward','Fernandez',1874322,17),(6,'Frank','Thompson',1826585,18),(7,'John','Davidson',1984135,18),(8,'Harry','Chavez',1943254,19),(9,'Robert','Grant',1985484,20),(10,'James','Curtis',1754524,20),(11,'William','Spencer',1984528,20),(12,'Arthur','Ramirez',1985820,21),(13,'Walter','Stevenson',1055058,22),(14,'Thomas','Graves',1808404,23),(15,'Clarence','Fitzgerald',1942045,23),(16,'Albert','Burns',1807055,23),(17,'Fred','Robinson',1085048,24),(18,'Roy','Shepherd',1975204,25),(19,'Sunny','Kiby',1084100,25);
/*!40000 ALTER TABLE `staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `v1`
--

DROP TABLE IF EXISTS `v1`;
/*!50001 DROP VIEW IF EXISTS `v1`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v1` AS SELECT 
 1 AS `CustomerID`,
 1 AS `LastName`,
 1 AS `PhoneNumber`,
 1 AS `Email`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v2`
--

DROP TABLE IF EXISTS `v2`;
/*!50001 DROP VIEW IF EXISTS `v2`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v2` AS SELECT 
 1 AS `RentalID`,
 1 AS `ArtID`,
 1 AS `CustomerID`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v3`
--

DROP TABLE IF EXISTS `v3`;
/*!50001 DROP VIEW IF EXISTS `v3`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v3` AS SELECT 
 1 AS `OrderID`,
 1 AS `ArtID`,
 1 AS `CustomerID`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v4`
--

DROP TABLE IF EXISTS `v4`;
/*!50001 DROP VIEW IF EXISTS `v4`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v4` AS SELECT 
 1 AS `ArtistID`,
 1 AS `LastName`,
 1 AS `PhoneNumber`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v5`
--

DROP TABLE IF EXISTS `v5`;
/*!50001 DROP VIEW IF EXISTS `v5`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v5` AS SELECT 
 1 AS `ArtID`,
 1 AS `Title`,
 1 AS `Description`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'art'
--

--
-- Dumping routines for database 'art'
--
/*!50003 DROP FUNCTION IF EXISTS `is_in_artwork` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `is_in_artwork`(t char(100)) RETURNS tinyint(1)
    DETERMINISTIC
BEGIN
	DECLARE result BOOLEAN;
    IF EXISTS (SELECT ArtID FROM art.artwork WHERE Title = t) THEN
		SET result = True;
	ELSE
		SET result = False;
	END IF;
RETURN result;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `to_ft` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `to_ft`(size int(5)) RETURNS float
    DETERMINISTIC
BEGIN
	DECLARE result float4;
    SET result = size * 10.7639;	
RETURN result;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `artist_artCity_year` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `artist_artCity_year`(c char(100), y int)
BEGIN
SELECT LastName, PhoneNumber
	FROM artist_info
        	WHERE ArtistID in (SELECT ArtistID
										FROM artwork
										WHERE Year = y
											  and
											  ExhibitionID in (SELECT ExhibitionID
																		FROM exhibition_info
																		WHERE Zip in (SELECT Zip
																							FROM exhibition_address
                                                                               				WHERE City = c)));
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `exh_city_hall` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `exh_city_hall`(c char(100), s int(5))
BEGIN
SELECT Name
	FROM exhibition_info
        	WHERE Zip in (SELECT Zip
				FROM exhibition_address
				WHERE City = c)
				       and
			 		   ExhibitionID in (SELECT ExhibitionID
											FROM hall
											WHERE Size > s);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `v1`
--

/*!50001 DROP VIEW IF EXISTS `v1`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v1` (`CustomerID`,`LastName`,`PhoneNumber`,`Email`) AS select `customer_info`.`CustomerID` AS `CustomerID`,`customer_info`.`LastName` AS `LastName`,`customer_info`.`PhoneNumber` AS `PhoneNumber`,`customer_info`.`Email` AS `Email` from `customer_info` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v2`
--

/*!50001 DROP VIEW IF EXISTS `v2`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v2` (`RentalID`,`ArtID`,`CustomerID`) AS select `rental`.`RentalID` AS `RentalID`,`rental`.`ArtID` AS `ArtID`,`rental`.`CustomerID` AS `CustomerID` from `rental` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v3`
--

/*!50001 DROP VIEW IF EXISTS `v3`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v3` (`OrderID`,`ArtID`,`CustomerID`) AS select `order_to_buy`.`OrderID` AS `OrderID`,`order_to_buy`.`ArtID` AS `ArtID`,`order_to_buy`.`CustomerID` AS `CustomerID` from `order_to_buy` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v4`
--

/*!50001 DROP VIEW IF EXISTS `v4`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v4` (`ArtistID`,`LastName`,`PhoneNumber`) AS select `artist_info`.`ArtistID` AS `ArtistID`,`artist_info`.`LastName` AS `LastName`,`artist_info`.`PhoneNumber` AS `PhoneNumber` from `artist_info` where `artist_info`.`Zip` in (select `artist_address`.`Zip` from `artist_address` where (`artist_address`.`Country` = 'Canada')) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v5`
--

/*!50001 DROP VIEW IF EXISTS `v5`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v5` (`ArtID`,`Title`,`Description`) AS select `artwork`.`ArtID` AS `ArtID`,`artwork`.`Title` AS `Title`,`artwork`.`Description` AS `Description` from `artwork` */;
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

-- Dump completed on 2021-08-13 17:40:03

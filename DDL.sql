-- MariaDB dump 10.19  Distrib 10.4.20-MariaDB, for Linux (x86_64)
--
-- Host: classmysql.engr.oregonstate.edu    Database: cs340_shulerp
-- ------------------------------------------------------
-- Server version	10.4.21-MariaDB-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Players`
--

DROP TABLE IF EXISTS `Players`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Players` (
  `playerID` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(50) NOT NULL,
  `firstName` varchar(50) NOT NULL,
  `lastName` varchar(50) NOT NULL,
  `gamerTag` varchar(50) NOT NULL,
  `employer` int(11) DEFAULT NULL,
  PRIMARY KEY (`playerID`),
  UNIQUE KEY `playerID` (`playerID`),
  KEY `employer` (`employer`),
  CONSTRAINT `Players_ibfk_1` FOREIGN KEY (`employer`) REFERENCES `Publishers` (`publisherID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Players`
--

LOCK TABLES `Players` WRITE;
/*!40000 ALTER TABLE `Players` DISABLE KEYS */;
INSERT INTO `Players` VALUES (1,'thomzy@aol.com','Thomas','Zyndal','bigcatTeezy',NULL),(2,'sg88@hotmail.com','Sergio','Gorgonzola','xx6xsg',NULL),(3,'yoyomama@gmail.com','Lucy','Ma','cellogirl',1),(4,'dado6@hotmail.com','Dahh','Fernado','moonbase',2);
/*!40000 ALTER TABLE `Players` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Games`
--

DROP TABLE IF EXISTS `Games`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Games` (
  `gameID` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `genre` varchar(50) NOT NULL,
  `publishers` int(11) NOT NULL,
  PRIMARY KEY (`gameID`),
  UNIQUE KEY `gameID` (`gameID`),
  KEY `publishers` (`publishers`),
  CONSTRAINT `Games_ibfk_1` FOREIGN KEY (`publishers`) REFERENCES `Publishers` (`publisherID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Games`
--

LOCK TABLES `Games` WRITE;
/*!40000 ALTER TABLE `Games` DISABLE KEYS */;
INSERT INTO `Games` VALUES (1,'shaq-fu','fighting',1),(2,'animal crossing','life simulation',2),(3,'Doom','survival',3);
/*!40000 ALTER TABLE `Games` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PlayersGames`
--

DROP TABLE IF EXISTS `PlayersGames`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PlayersGames` (
  `playerID` int(11) NOT NULL,
  `gameID` int(11) NOT NULL,
  PRIMARY KEY (`playerID`,`gameID`),
  KEY `gameID` (`gameID`),
  CONSTRAINT `PlayersGames_ibfk_1` FOREIGN KEY (`playerID`) REFERENCES `Players` (`playerID`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `PlayersGames_ibfk_2` FOREIGN KEY (`gameID`) REFERENCES `Games` (`gameID`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PlayersGames`
--

LOCK TABLES `PlayersGames` WRITE;
/*!40000 ALTER TABLE `PlayersGames` DISABLE KEYS */;
INSERT INTO `PlayersGames` VALUES (1,2),(2,1),(3,1),(3,2),(4,3);
/*!40000 ALTER TABLE `PlayersGames` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Platforms`
--

DROP TABLE IF EXISTS `Platforms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Platforms` (
  `platformID` int(11) NOT NULL AUTO_INCREMENT,
  `systemName` varchar(50) NOT NULL,
  `manufacturer` varchar(50) NOT NULL,
  `launchYear` date NOT NULL,
  PRIMARY KEY (`platformID`),
  UNIQUE KEY `platformID` (`platformID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Platforms`
--

LOCK TABLES `Platforms` WRITE;
/*!40000 ALTER TABLE `Platforms` DISABLE KEYS */;
INSERT INTO `Platforms` VALUES (1,'Xbox Series X','Microsoft','2020-11-10'),(2,'Switch','Nintendo','2017-03-03'),(3,'Playstation 5','Sony','2020-11-12');
/*!40000 ALTER TABLE `Platforms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Publishers`
--

DROP TABLE IF EXISTS `Publishers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Publishers` (
  `publisherID` int(11) NOT NULL AUTO_INCREMENT,
  `publisherName` varchar(50) NOT NULL,
  `headquarters` varchar(50) NOT NULL,
  PRIMARY KEY (`publisherID`),
  UNIQUE KEY `publisherID` (`publisherID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Publishers`
--

LOCK TABLES `Publishers` WRITE;
/*!40000 ALTER TABLE `Publishers` DISABLE KEYS */;
INSERT INTO `Publishers` VALUES (1,'Electronic Arts','California'),(2,'Nintendo','Kyoto'),(3,'Bethesda','Maryland');
/*!40000 ALTER TABLE `Publishers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GamesPlatforms`
--

DROP TABLE IF EXISTS `GamesPlatforms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GamesPlatforms` (
  `gameID` int(11) NOT NULL,
  `platformID` int(11) NOT NULL,
  PRIMARY KEY (`gameID`,`platformID`),
  KEY `platformID` (`platformID`),
  CONSTRAINT `GamesPlatforms_ibfk_1` FOREIGN KEY (`platformID`) REFERENCES `Platforms` (`platformID`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `GamesPlatforms_ibfk_2` FOREIGN KEY (`gameID`) REFERENCES `Games` (`gameID`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GamesPlatforms`
--

LOCK TABLES `GamesPlatforms` WRITE;
/*!40000 ALTER TABLE `GamesPlatforms` DISABLE KEYS */;
INSERT INTO `GamesPlatforms` VALUES (1,1),(1,2),(2,2),(3,1),(3,2),(3,3);
/*!40000 ALTER TABLE `GamesPlatforms` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-11-10 23:07:59

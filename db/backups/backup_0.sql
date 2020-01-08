-- MySQL dump 10.13  Distrib 8.0.18, for Linux (x86_64)
--
-- Host: localhost    Database: lychee
-- ------------------------------------------------------
-- Server version	8.0.18

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
-- Table structure for table `lychee_albums`
--
DROP TABLE IF EXISTS `lychee_albums`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lychee_albums` (
  `id` bigint(14) unsigned NOT NULL,
  `title` varchar(100) NOT NULL DEFAULT '',
  `description` varchar(1000) DEFAULT '',
  `sysstamp` int(11) NOT NULL,
  `public` tinyint(1) NOT NULL DEFAULT '0',
  `visible` tinyint(1) NOT NULL DEFAULT '1',
  `downloadable` tinyint(1) NOT NULL DEFAULT '0',
  `password` varchar(100) DEFAULT NULL,
  `min_takestamp` int(11) NOT NULL,
  `max_takestamp` int(11) NOT NULL,
  `license` varchar(20) DEFAULT 'none',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lychee_albums`
--

LOCK TABLES `lychee_albums` WRITE;
/*!40000 ALTER TABLE `lychee_albums` DISABLE KEYS */;
/*!40000 ALTER TABLE `lychee_albums` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lychee_log`
--

DROP TABLE IF EXISTS `lychee_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lychee_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `time` int(11) NOT NULL,
  `type` varchar(11) NOT NULL,
  `function` varchar(100) NOT NULL,
  `line` int(11) NOT NULL,
  `text` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lychee_log`
--

LOCK TABLES `lychee_log` WRITE;
/*!40000 ALTER TABLE `lychee_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `lychee_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lychee_photos`
--

DROP TABLE IF EXISTS `lychee_photos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lychee_photos` (
  `id` bigint(14) unsigned NOT NULL,
  `title` varchar(100) NOT NULL DEFAULT '',
  `description` varchar(1000) DEFAULT '',
  `url` varchar(100) NOT NULL,
  `tags` varchar(1000) NOT NULL DEFAULT '',
  `public` tinyint(1) NOT NULL,
  `type` varchar(15) DEFAULT NULL,
  `width` int(11) NOT NULL,
  `height` int(11) NOT NULL,
  `size` varchar(20) NOT NULL,
  `iso` varchar(15) NOT NULL,
  `aperture` varchar(20) NOT NULL,
  `make` varchar(50) NOT NULL,
  `model` varchar(50) NOT NULL,
  `lens` varchar(100) NOT NULL DEFAULT '',
  `shutter` varchar(30) NOT NULL,
  `focal` varchar(20) NOT NULL,
  `takestamp` int(11) DEFAULT NULL,
  `star` tinyint(1) NOT NULL,
  `thumbUrl` char(37) NOT NULL,
  `album` bigint(14) unsigned NOT NULL,
  `checksum` char(40) DEFAULT NULL,
  `medium` tinyint(1) NOT NULL DEFAULT '0',
  `small` tinyint(1) NOT NULL DEFAULT '0',
  `license` varchar(20) NOT NULL DEFAULT 'none',
  PRIMARY KEY (`id`),
  KEY `Index_album` (`album`),
  KEY `Index_star` (`star`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lychee_photos`
--

LOCK TABLES `lychee_photos` WRITE;
/*!40000 ALTER TABLE `lychee_photos` DISABLE KEYS */;
INSERT INTO `lychee_photos` VALUES (15784497986879,'library','','e2412f13f7d710307d0f5b84e56b9e91.jpg','',0,'image/jpeg',4608,3456,'2.5 MB','50','f/2.2','samsung','SM-G973U1','','1/756 s','1.8 mm',1576155939,0,'e2412f13f7d710307d0f5b84e56b9e91.jpeg',0,'f565841123a50884bdad9f27ac10440ba67646fa',1,1,'none');
/*!40000 ALTER TABLE `lychee_photos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lychee_settings`
--

DROP TABLE IF EXISTS `lychee_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lychee_settings` (
  `key` varchar(50) NOT NULL DEFAULT '',
  `value` varchar(200) DEFAULT '',
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lychee_settings`
--

LOCK TABLES `lychee_settings` WRITE;
/*!40000 ALTER TABLE `lychee_settings` DISABLE KEYS */;
INSERT INTO `lychee_settings` VALUES ('checkForUpdates','1'),('default_license','none'),('deleteImported','1'),('dropboxKey',''),('full_photo','1'),('hide_version_number','1'),('identifier','feefc17fed9ab087b01bf1a7690d9792'),('image_overlay','0'),('image_overlay_type','exif'),('imagick','1'),('lang','en'),('layout','0'),('medium_max_height','1080'),('medium_max_width','1920'),('password','$2y$10$VdKfa0ZbUS52gukxTEhwM.2wzz1hbMxGS1GJvYUerYuOOM0s8XOQ.'),('php_script_limit','0'),('plugins',''),('public_search','0'),('skipDuplicates','0'),('small_max_height','360'),('small_max_width','0'),('sortingAlbums','ORDER BY id DESC'),('sortingPhotos','ORDER BY id DESC'),('useExiftool','0'),('username','$2y$10$C1N1ixPd1E5mZ8vHQiAOg.E8sNKDz2LPxC2JepC0f4o9wUJOazQkK'),('version','update_030216');
/*!40000 ALTER TABLE `lychee_settings` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-01-08  2:20:45

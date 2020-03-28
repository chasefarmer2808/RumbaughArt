-- MySQL dump 10.13  Distrib 8.0.19, for Linux (x86_64)
--
-- Host: localhost    Database: lychee
-- ------------------------------------------------------
-- Server version	8.0.19

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
  `id` bigint unsigned NOT NULL,
  `title` varchar(100) NOT NULL DEFAULT '',
  `description` varchar(1000) DEFAULT '',
  `sysstamp` int NOT NULL,
  `public` tinyint(1) NOT NULL DEFAULT '0',
  `visible` tinyint(1) NOT NULL DEFAULT '1',
  `downloadable` tinyint(1) NOT NULL DEFAULT '0',
  `password` varchar(100) DEFAULT NULL,
  `min_takestamp` int NOT NULL,
  `max_takestamp` int NOT NULL,
  `license` varchar(20) DEFAULT 'none',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lychee_albums`
--

LOCK TABLES `lychee_albums` WRITE;
/*!40000 ALTER TABLE `lychee_albums` DISABLE KEYS */;
INSERT INTO `lychee_albums` VALUES (15836789266433,'Happenings','',1583678926,1,1,0,NULL,1230342955,1485878449,'none'),(15836789845537,'Nature','',1583678984,1,1,0,NULL,0,1532359140,'none'),(15836790333101,'Objects','',1583679033,1,1,0,NULL,0,1561007449,'none'),(15836790668383,'Places','',1583679066,1,1,0,NULL,0,1478351239,'none'),(15843244570555,'Flowers and Still Life','',1584324457,1,1,0,NULL,1119643174,1410000926,'none'),(15854236807365,'Poster Images','',1585423680,1,1,0,NULL,0,1476889532,'none');
/*!40000 ALTER TABLE `lychee_albums` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lychee_log`
--

DROP TABLE IF EXISTS `lychee_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lychee_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `time` int NOT NULL,
  `type` varchar(11) NOT NULL,
  `function` varchar(100) NOT NULL,
  `line` int NOT NULL,
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
  `id` bigint unsigned NOT NULL,
  `title` varchar(100) NOT NULL DEFAULT '',
  `description` varchar(1000) DEFAULT '',
  `url` varchar(100) NOT NULL,
  `tags` varchar(1000) NOT NULL DEFAULT '',
  `public` tinyint(1) NOT NULL,
  `type` varchar(15) DEFAULT NULL,
  `width` int NOT NULL,
  `height` int NOT NULL,
  `size` varchar(20) NOT NULL,
  `iso` varchar(15) NOT NULL,
  `aperture` varchar(20) NOT NULL,
  `make` varchar(50) NOT NULL,
  `model` varchar(50) NOT NULL,
  `lens` varchar(100) NOT NULL DEFAULT '',
  `shutter` varchar(30) NOT NULL,
  `focal` varchar(20) NOT NULL,
  `takestamp` int DEFAULT NULL,
  `star` tinyint(1) NOT NULL,
  `thumbUrl` char(37) NOT NULL,
  `album` bigint unsigned NOT NULL,
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
INSERT INTO `lychee_photos` VALUES (15836789305718,'Amgen Peloton, Carmel Valley R','','2765db86ea94d2b461d99b5d54a92e56.jpg','',0,'image/jpeg',2100,1014,'1.4 MB','100','f/5.6','Canon','Canon EOS REBEL T1i','','1/1000 s','250 mm',1305800258,0,'2765db86ea94d2b461d99b5d54a92e56.jpeg',15836789266433,'b31f7fb285125e84c816730a35f5beba8367d965',1,1,'none'),(15836789318670,'FLIGHT','','b17a4aabd8b8d436a671f2fe771210b7.jpg','',0,'image/jpeg',1200,1800,'1.9 MB','1000','f/5.6','Canon','Canon EOS 70D','EF-S55-250mm f/4-5.6 IS II','1/80 s','250 mm',1419182077,0,'b17a4aabd8b8d436a671f2fe771210b7.jpeg',15836789266433,'453b3ee5d20dec6c0866687178dac45a04930d82',1,1,'none'),(15836789330212,'Wall of Power_the Wave','','96384f0fccb71a5a0d851798707d1971.jpg','',0,'image/jpeg',1950,975,'2.1 MB','100','f/8.0','Canon','Canon EOS DIGITAL REBEL','','1/400 s','200 mm',1230342955,0,'96384f0fccb71a5a0d851798707d1971.jpeg',15836789266433,'13a90721c4f33f0effc3b091174893851b36e9cf',1,1,'none'),(15836789342883,'Into the Kaleidoscope','','d8080c21d201c3cc2dd85231751efecf.jpg','',0,'image/jpeg',1885,1200,'1.3 MB','100','f/8.0','Canon','Canon EOS 70D','EF-S18-55mm f/3.5-5.6 IS STM','1/160 s','21 mm',1485878449,1,'d8080c21d201c3cc2dd85231751efecf.jpeg',15836789266433,'13bcd380e057b0ba1b6fe4f09222c2c09f3e07ee',1,1,'none'),(15836789354877,'FLIGHT 2','','69873fafc8a005e5b716f601f66d98dd.jpg','',0,'image/jpeg',1800,1231,'2.1 MB','1000','f/7.1','Canon','Canon EOS 70D','EF-S55-250mm f/4-5.6 IS II','1/60 s','250 mm',1419181964,0,'69873fafc8a005e5b716f601f66d98dd.jpeg',15836789266433,'f296fc0d8525210382c2b4b8f72c0267909498b4',1,1,'none'),(15836789912067,'REEDS AND REFLECTIONS','','778256e24d980dfb34d9efa93c7ea137.jpg','',0,'image/jpeg',1801,1200,'1.7 MB','400','f/6.3','Canon','Canon EOS DIGITAL REBEL','','1/250 s','170 mm',1217659344,0,'778256e24d980dfb34d9efa93c7ea137.jpeg',15836789845537,'d7c10354e4f86d394d250b854bfae46fdee942b5',1,1,'none'),(15836789923668,'Cactus ','','ea7df35960817cafbc3baffe6ebe0819.jpg','',0,'image/jpeg',1800,1281,'1.4 MB','100','f/8.0','Canon','Canon EOS REBEL T1i','','1/125 s','55 mm',1293367401,0,'ea7df35960817cafbc3baffe6ebe0819.jpeg',15836789845537,'e17ea5b22c94c5cc77e976686130d8b7bfd79798',1,1,'none'),(15836789940007,'Ephemeral','','563a67a3cb2d74b02c0f00f7d26df3d7.jpg','',0,'image/jpeg',1200,1800,'1.3 MB','100','f/5.0','Canon','Canon EOS 70D','EF-S18-55mm f/3.5-5.6 IS STM','1/100 s','47 mm',1532358928,0,'563a67a3cb2d74b02c0f00f7d26df3d7.jpeg',15836789845537,'73d206bfa6af52c907bd30ae0685c1ecea5b7be9',1,1,'none'),(15836789949335,'Golden Flow','','788df18315598aa2126e7830c05893d1.jpg','',0,'image/jpeg',5472,3648,'4.2 MB','100','f/7.1','Canon','Canon EOS 70D','EF-S18-55mm f/3.5-5.6 IS STM','1/100 s','55 mm',1532359140,0,'788df18315598aa2126e7830c05893d1.jpeg',15836789845537,'a91da2e87161805160bb8705a9b41b427bc8b317',1,1,'none'),(15836789991095,'blue and white shells','','3129d9969e122c5ff4c622734e789d0f.jpg','',0,'image/jpeg',1800,1259,'1.7 MB','100','f/7.1','Canon','Canon EOS REBEL T1i','','1/125 s','42 mm',1303558217,1,'3129d9969e122c5ff4c622734e789d0f.jpeg',15836789845537,'7e18349bf7ea304fdb3c98a3f616d0e43daaa939',1,1,'none'),(15836790002588,'Flying Egret, Carmel Valley','','36888996890782f2e35116095b3a3b18.jpg','',0,'image/jpeg',2953,3600,'4.9 MB','125','f/5.6','Canon','Canon EOS REBEL T1i','','1/320 s','250 mm',1265386877,0,'36888996890782f2e35116095b3a3b18.jpeg',15836789845537,'a6c0c38485e475b8921a96a67115a231e1b04330',1,1,'none'),(15836790033414,'Dancing Branches','','d02018b47a0101cee5eee3e265f79429.jpg','',0,'image/jpeg',1950,1037,'2.3 MB','','','','','','','',0,0,'d02018b47a0101cee5eee3e265f79429.jpeg',15836789845537,'858fe8762bc73da27113f618689420289c476b0d',1,1,'none'),(15836790045497,'Flow 1','','beb558a665c0bd78c6e4ebbddd33135e.jpg','',0,'image/jpeg',3600,4764,'5.1 MB','20','f/1.8','Apple','iPhone 7','iPhone 7 back camera 3.99mm f/1.8','1/855 s','4 mm',1532019571,0,'beb558a665c0bd78c6e4ebbddd33135e.jpeg',15836789845537,'37e892da7f35e630fbfefe6d015ce056405fba7c',1,1,'none'),(15836790379090,'Truck panel 2, Portola ','','e5fb0b3c6ce175320bcfea3be987a5ad.jpg','',0,'image/jpeg',1800,1249,'2.1 MB','100','f/9.0','Canon','Canon EOS REBEL T1i','','1/160 s','25 mm',1340798096,0,'e5fb0b3c6ce175320bcfea3be987a5ad.jpeg',15836790333101,'9a4eff3940bc14f8313e2ae13a9d7afd7c2a576b',1,1,'none'),(15836790392324,'Old Red Door, Graeagle','','d81a448c57b34f2af4bb8c6e42ce5fb9.jpg','',0,'image/jpeg',1415,1800,'2 MB','','','','','','','',0,0,'d81a448c57b34f2af4bb8c6e42ce5fb9.jpeg',15836790333101,'6835c64d0a55feb2d2e87736c2867f86d43d8ed0',1,1,'none'),(15836790406346,'BIKE SHOP WINDOW copy','','1b29d9807052dcb5556720c045d1e9ef.jpg','',0,'image/jpeg',1800,1245,'2.6 MB','100','f/4.0','NIKON CORPORATION','NIKON 1 J1','1 NIKKOR VR 30-110mm f/3.8-5.6','1/200 s','30 mm',1394574577,1,'1b29d9807052dcb5556720c045d1e9ef.jpeg',15836790333101,'2daf775d29f1a71316e304a8cfedc705ddc4f7e7',1,1,'none'),(15836790417409,'RIVER ROCK GLYPHS','','a491d43cbb018182b40a3bad21f2f4cd.jpg','',0,'image/jpeg',1800,1205,'1.3 MB','180','f/3.8','NIKON CORPORATION','NIKON 1 J1','1 NIKKOR VR 10-30mm f/3.5-5.6','1/125 s','12.2 mm',1561007449,0,'a491d43cbb018182b40a3bad21f2f4cd.jpeg',15836790333101,'083f78631972dec2006c926232378948a6909357',1,1,'none'),(15836790427955,'Three old mailboxes ','','01ebabe3822de40a18ae758765e7f6d6.jpg','',0,'image/jpeg',1800,1212,'2.3 MB','','','','','','','',0,0,'01ebabe3822de40a18ae758765e7f6d6.jpeg',15836790333101,'af8c445798064b97f69587445b4fb8eb57b3ade0',1,1,'none'),(15836790438633,'Torn Posters, Todi','','7a794926940fc97651559babc72554ef.jpg','',0,'image/jpeg',1808,1200,'3.4 MB','','','','','','','',0,0,'7a794926940fc97651559babc72554ef.jpeg',15836790333101,'1aeadf3e55973e211a75f0b9cc18faaec96179d5',1,1,'none'),(15836790971418,'Aspen Reflection, Packer Lake','','ce28c73179ff154350547de4410dcac1.jpg','',0,'image/jpeg',1800,1219,'1.8 MB','100','f/5.6','Canon','Canon EOS REBEL T1i','','1/125 s','100 mm',1256135882,0,'ce28c73179ff154350547de4410dcac1.jpeg',15836790668383,'4aef68e1fae32d1a4ca6fc1e63899c609d15e263',1,1,'none'),(15836790984697,'Grafitti and ladder, Davis','','12475075fabd2ec92a130f6384103b14.jpg','',0,'image/jpeg',1200,1800,'1.4 MB','','','','','','','',0,1,'12475075fabd2ec92a130f6384103b14.jpeg',15836790668383,'6935930d9c10d5a7128a4d343250f358a88ba2b0',1,1,'none'),(15836790994911,'Bare Aspen and Rocks, Johnsvil','','a56dd86557159abd7596b398ac3e9b7b.jpg','',0,'image/jpeg',1800,1291,'3.8 MB','400','f/7.1','Canon','Canon EOS REBEL T1i','EF-S18-55mm f/3.5-5.6 IS','1/100 s','32 mm',1319735116,0,'a56dd86557159abd7596b398ac3e9b7b.jpeg',15836790668383,'e111435ce84b7be6f0ef602523d054000774ce62',1,1,'none'),(15836791013065,'Lacy Curtain, San Juan Bautist','','4d33b30768851c082d669090a830463d.jpg','',0,'image/jpeg',1814,1200,'1.2 MB','400','f/6.3','Canon','Canon EOS DIGITAL REBEL','','1/125 s','60 mm',1178659290,0,'4d33b30768851c082d669090a830463d.jpeg',15836790668383,'8e3b8c1b6f93185ec477bcfb30595718c3833ef8',1,1,'none'),(15836791024447,'Long Green Hills, Carmel Valle','','b807d37f748ae58bfa56f4512b306c95.jpg','',0,'image/jpeg',1800,1319,'1.7 MB','','','','','','','',0,0,'b807d37f748ae58bfa56f4512b306c95.jpeg',15836790668383,'b02c7660d05e118589cbdffd907aec0f9db6b645',1,1,'none'),(15836791039118,'Rainbow and vineyard , Carmel ','','3a5f172cf34805805675a59346f68526.jpg','',0,'image/jpeg',1553,1260,'1.5 MB','100','f/8.0','Canon','Canon EOS DIGITAL REBEL','','1/160 s','18 mm',1100147572,0,'3a5f172cf34805805675a59346f68526.jpeg',15836790668383,'ede124878c47b6d0cfc385ee300edafa119e38aa',1,1,'none'),(15836791048469,'Monolith and Aspen','','0343c42c4399610bbd284dbeacf96a36.jpg','',0,'image/jpeg',1800,1342,'2.6 MB','','','','','','','',0,0,'0343c42c4399610bbd284dbeacf96a36.jpeg',15836790668383,'dc77a81a2a2b359788f3c6f52f77539130bd914a',1,1,'none'),(15836791063659,'Swirling Wake, Monterey','','ff447755fa7fc0b49ff7682530becba7.jpg','',0,'image/jpeg',1800,1244,'1.7 MB','400','f/9.0','Canon','Canon EOS DIGITAL REBEL','','1/250 s','55 mm',1194664424,0,'ff447755fa7fc0b49ff7682530becba7.jpeg',15836790668383,'645361634ad691ccebd29290266e454c8a28bb5b',1,1,'none'),(15836791075271,'Sierra Valley Wetlands','','e29c33c84f51d49d3e601cc649ffc9d4.jpg','',0,'image/jpeg',1800,1415,'1.8 MB','400','f/16.0','Canon','Canon EOS DIGITAL REBEL','','1/500 s','55 mm',1192586902,0,'e29c33c84f51d49d3e601cc649ffc9d4.jpeg',15836790668383,'b30b05de21e0afb0775be46da4ba275ff7f103dc',1,1,'none'),(15836791091186,'Old stone barn, Calistoga','','deb10b36d73a8e43afa5190b8e06b439.jpg','',0,'image/jpeg',1800,1293,'1.9 MB','100','f/9.0','Canon','Canon EOS 70D','EF-S18-55mm f/3.5-5.6 IS STM','1/250 s','33 mm',1478351239,0,'deb10b36d73a8e43afa5190b8e06b439.jpeg',15836790668383,'1b036a0568648584f4d981fcd96412a58da7541d',1,1,'none'),(15836791106641,'Yellow building, Monterey Whar','','09466aa1cd2fdc5553289d7b6e2ba178.jpg','',0,'image/jpeg',1821,1200,'1.3 MB','400','f/9.0','Canon','Canon EOS DIGITAL REBEL','','1/320 s','75 mm',1163811294,0,'09466aa1cd2fdc5553289d7b6e2ba178.jpeg',15836790668383,'402c65683ddaa499836879fc9440a37f6ed185da',1,1,'none'),(15836791117572,'Walk in the Park, Davis','','fbb2d17ba5c747ba6909637039e8f965.jpg','',0,'image/jpeg',1350,1800,'2.4 MB','50','f/2.4','Apple','iPhone 5','iPhone 5 back camera 4.12mm f/2.4','1/135 s','4.1 mm',1422006109,0,'fbb2d17ba5c747ba6909637039e8f965.jpeg',15836790668383,'846de960add19e2d4892c32bd3961b8a7dd9fb7f',1,1,'none'),(15836791132367,'Sunset, Garzas Canyon','','148cc2655694471359368d9961c620b2.jpg','',0,'image/jpeg',1800,1217,'1.5 MB','640','f/14.0','Canon','Canon EOS 70D','EF-S18-55mm f/3.5-5.6 IS STM','1/640 s','55 mm',1387128565,0,'148cc2655694471359368d9961c620b2.jpeg',15836790668383,'afeafe6f7eb49e9f5cb28f956d74c7364e70404f',1,1,'none'),(15843244702034,'Vase of spring flowers','','c7f4015222425068214b3ed56af47d58.jpg','',0,'image/jpeg',1440,1800,'2.2 MB','640','f/10.0','Canon','Canon EOS 70D','EF-S18-55mm f/3.5-5.6 IS STM','1/320 s','18 mm',1395328344,0,'c7f4015222425068214b3ed56af47d58.jpeg',15843244570555,'a422a280772d2cf0e75ea0d38c22f55dcca886d8',1,1,'none'),(15843244731635,'Black Eyed Susans','','c199344091c5e6ce7f0592a886faeb10.jpg','',0,'image/jpeg',1800,1399,'2 MB','400','f/13.0','Canon','Canon EOS DIGITAL REBEL','','1/320 s','37 mm',1125610712,0,'c199344091c5e6ce7f0592a886faeb10.jpeg',15843244570555,'d858be953b0964a50d72635e5ab4c502d543e3e4',1,1,'none'),(15843244751950,'California Poppy','','f92f07b620d6f4c2dc969a9380a86724.jpg','',0,'image/jpeg',1800,1281,'1.1 MB','','','','','','','',0,0,'f92f07b620d6f4c2dc969a9380a86724.jpeg',15843244570555,'f17337d924f1c2d8c28d20c90e8945a3347f55b9',1,1,'none'),(15843244776605,'Fall Still Life','','c7a53891a989eac03d15b2c5681a9eb0.jpg','',0,'image/jpeg',1383,1800,'2.1 MB','400','f/3.5','Canon','Canon EOS DIGITAL REBEL','','1/4 s','21 mm',1160964374,0,'c7a53891a989eac03d15b2c5681a9eb0.jpeg',15843244570555,'f7221b91884fab6e81431ac36aeacecf1d80b2af',1,1,'none'),(15843244792959,'Fresh Peony','','709b575077c2837345c3c4d518bd5bc5.jpg','',0,'image/jpeg',1800,1345,'1.1 MB','100','f/5.0','Canon','Canon EOS REBEL T1i','','1/50 s','25 mm',1337267727,0,'709b575077c2837345c3c4d518bd5bc5.jpeg',15843244570555,'d0ed332d18749c37f10da7c86395fcd68a34feba',1,1,'none'),(15843244805681,'Oriental poppy','','dfc821359d81c0088c8986b1a5a98f80.jpg','',0,'image/jpeg',1800,1229,'619.2 KB','400','f/10.0','Canon','Canon EOS DIGITAL REBEL','','1/200 s','38 mm',1119643174,0,'dfc821359d81c0088c8986b1a5a98f80.jpeg',15843244570555,'d04d0d83951830dce9c11e10404f246d12caee4d',1,1,'none'),(15843244819119,'Peony in garden','','11677c0c676183283f2663b7f13368bd.jpg','',0,'image/jpeg',1800,1316,'1.4 MB','200','f/4.5','NIKON CORPORATION','NIKON 1 J1','1 NIKKOR VR 10-30mm f/3.5-5.6','1/125 s','18.2 mm',1398140879,0,'11677c0c676183283f2663b7f13368bd.jpeg',15843244570555,'8e9e8c6e0f2787aa0c579f90dcf77df32d1c1e6d',1,1,'none'),(15843244842298,'Quince on plate','','007ac0260267850b138c8b1ccd9c1c4e.jpg','',0,'image/jpeg',1344,1800,'1.7 MB','100','f/5.0','Canon','Canon EOS 70D','EF-S18-55mm f/3.5-5.6 IS STM','1/1 s','44 mm',1410000926,0,'007ac0260267850b138c8b1ccd9c1c4e.jpeg',15843244570555,'6c33df321839203336c5c9694fe6d59863202c2f',1,1,'none'),(15843244873189,'Rhododendron and vase','','bcb1713457d004903132352fb58caa5d.jpg','',0,'image/jpeg',1291,1800,'2.2 MB','400','f/4.5','Canon','Canon EOS DIGITAL REBEL','','1/4000 s','18 mm',1207794336,0,'bcb1713457d004903132352fb58caa5d.jpeg',15843244570555,'b6dbab1ab8d22547fbe82eaa7b5c08592b351f88',1,1,'none'),(15843244929101,'Spring flowers in pitcher','','4ce59f469117987e25e4fde41e86d16e.jpg','',0,'image/jpeg',1630,1800,'4 MB','400','f/14.0','Canon','Canon EOS DIGITAL REBEL','','1/400 s','30 mm',1238475762,1,'4ce59f469117987e25e4fde41e86d16e.jpeg',15843244570555,'fb25d86b9e46fe25304c9f2ed52f1647b33f0c15',1,1,'none'),(15854237287496,'A Work of Grass','','f8aa255dbe5c279706315408a59a25c4.jpg','',0,'image/jpeg',1800,1203,'2.5 MB','100','f/5.6','Canon','Canon EOS REBEL T1i','EF-S55-250mm f/4-5.6 IS','1/200 s','250 mm',1349624098,0,'f8aa255dbe5c279706315408a59a25c4.jpeg',15854236807365,'186e0a57389ced003355573ddbadb82bed2b71b7',1,1,'none'),(15854237303986,'Dreams are seeds','','756cc3b050913918b7805ed0a719dd94.jpg','',0,'image/jpeg',1200,1800,'1.3 MB','100','f/7.1','Canon','Canon EOS 70D','EF-S18-55mm f/3.5-5.6 IS STM','1/125 s','45 mm',1468850817,0,'756cc3b050913918b7805ed0a719dd94.jpeg',15854236807365,'a41abeb3bbefa8c0c851053389f7947aaaf91c56',1,1,'none'),(15854237334907,'Fence the world','','82812da757a3ba3daf1792df598f7f62.jpg','',0,'image/jpeg',1200,1802,'2 MB','100','f/10.0','Canon','Canon EOS 70D','EF-S18-55mm f/3.5-5.6 IS STM','1/250 s','31 mm',1476889532,0,'82812da757a3ba3daf1792df598f7f62.jpeg',15854236807365,'c767bcc5a8a0781cd5b5b6569e3f427b67b1b75d',1,1,'none'),(15854237349550,'Knock on the sky','','9b8c53da6516be96278037b9aa5e3178.jpg','',0,'image/jpeg',1805,1200,'1.2 MB','','','','','','','',0,0,'9b8c53da6516be96278037b9aa5e3178.jpeg',15854236807365,'ca9ac88c70a2f4fb60b06dfc1f33c0a680954368',1,1,'none'),(15854237378926,'Moon Flower','','484614c07c39efe4d3777c962435464b.jpg','',0,'image/jpeg',1800,1236,'1.5 MB','','','','','','','',0,0,'484614c07c39efe4d3777c962435464b.jpeg',15854236807365,'b01578b419d468a78368fac0174e761fccf4a31e',1,1,'none'),(15854237388730,'Orchard solitude','','82a84856ec853c506465f9f8a5445a1f.jpg','',0,'image/jpeg',688,900,'1.2 MB','','','','','','','',0,0,'82a84856ec853c506465f9f8a5445a1f.jpeg',15854236807365,'5a56f165fd8b9ee41d51b5ccbc3df27692f2b055',0,1,'none'),(15854237416133,'Snowboard','','ceccca3ae6df7989dd6cd6a68765967e.jpg','DHS S-1 1016',0,'image/jpeg',1800,1196,'1.6 MB','640','f/7.1','NIKON CORPORATION','NIKON D90','','1/2500 s','300 mm',1452475650,0,'ceccca3ae6df7989dd6cd6a68765967e.jpeg',15854236807365,'5c10f12f901508a0e929822ce27ccbf8579c1dd0',1,1,'none'),(15854237450744,'Teacher\'s door','','37b4082cb62e13ee2270605855d7aa47.jpg','',0,'image/jpeg',1800,1373,'2.5 MB','250','f/5.0','Canon','Canon EOS REBEL T1i','','1/60 s','43 mm',1294672626,0,'37b4082cb62e13ee2270605855d7aa47.jpeg',15854236807365,'eef9955f74006f216f90e7fdb43562d9d9513c3a',1,1,'none'),(15854237483214,'Tennis','','7c797703f7e19a92644855a3fa582c45.jpg','',0,'image/jpeg',1800,1382,'2.2 MB','','','','EPSON Perfection V600','','','',0,0,'7c797703f7e19a92644855a3fa582c45.jpeg',15854236807365,'2a8c108a16380bc23fb3918d339b2c57cb570bad',1,1,'none'),(15854243936609,'Three-gumball-machines','','4ade9e1994735431ca2b074f8c6fa6cb.jpg','',0,'image/jpeg',1800,1433,'1.5 MB','','','','','','','',0,0,'4ade9e1994735431ca2b074f8c6fa6cb.jpeg',15836790333101,'f204f75f04a32fdf06caaf0c340287d1d27a4ca8',1,1,'none'),(15854274785272,'Persimmon tree','','3a6ffcaedd735cd97c4072f397f91b8c.jpg','',0,'image/jpeg',1229,1800,'2.5 MB','200','f/5.6','Canon','Canon EOS 70D','EF-S18-55mm f/3.5-5.6 IS STM','1/100 s','35 mm',1383741056,0,'3a6ffcaedd735cd97c4072f397f91b8c.jpeg',15836789845537,'d14e8ff3fb47ffbc72ea05826a70638b0c9ce961',1,1,'none'),(15854306282378,'Big Sur Coast','','77ea673ad27817242ce210779e821a14.jpg','',0,'image/jpeg',1350,900,'1.1 MB','','','','','','','',0,0,'77ea673ad27817242ce210779e821a14.jpeg',15836790668383,'5e7666e27a1607ecc87487060114fbfc4bb2a953',0,1,'none');
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
INSERT INTO `lychee_settings` VALUES ('checkForUpdates','1'),('default_license','none'),('deleteImported','1'),('dropboxKey',''),('full_photo','1'),('hide_version_number','1'),('identifier','5bcd5af61ede15fd42c1490b70b77607'),('image_overlay','0'),('image_overlay_type','exif'),('imagick','1'),('lang','en'),('layout','0'),('medium_max_height','1080'),('medium_max_width','1920'),('password','$2y$10$2Gqdjk/AwEV35iODB.Kk.eu2JHbuA6ewlkeIH3vQaUM9diheg6iVG'),('php_script_limit','0'),('plugins',''),('public_search','0'),('skipDuplicates','0'),('small_max_height','360'),('small_max_width','0'),('sortingAlbums','ORDER BY id DESC'),('sortingPhotos','ORDER BY id DESC'),('useExiftool','0'),('username','$2y$10$dobTkevbEhNkBDwFy/fytu3ON6ykZ1RPBT0N9tJS5idF3z8tutY8q'),('version','update_030216');
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

-- Dump completed on 2020-03-28 21:24:59

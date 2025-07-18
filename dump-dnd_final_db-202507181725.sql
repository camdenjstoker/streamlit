-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: dnd_final_db
-- ------------------------------------------------------
-- Server version	8.0.42

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
-- Table structure for table `adventure`
--

DROP TABLE IF EXISTS `adventure`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `adventure` (
  `adventure_id` int unsigned NOT NULL AUTO_INCREMENT,
  `adventure_name` varchar(45) NOT NULL,
  `description` varchar(250) DEFAULT NULL,
  `setting` varchar(150) DEFAULT NULL,
  `recommended_lvl_rng_min` int DEFAULT NULL,
  `recommended_lvl_rng_max` int DEFAULT NULL,
  PRIMARY KEY (`adventure_id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adventure`
--

LOCK TABLES `adventure` WRITE;
/*!40000 ALTER TABLE `adventure` DISABLE KEYS */;
INSERT INTO `adventure` VALUES (26,'The Lost Mine of Phandelver','A classic introductory adventure focused on goblins, a lost mine, and a mysterious black spider.','Forgotten Realms',1,5),(27,'Curse of Strahd','A gothic horror adventure set in the cursed land of Barovia, ruled by the vampire Strahd von Zarovich.','Barovia',1,10),(28,'Dragon of Icespire Peak','An adventure where heroes must contend with a white dragon and other threats near the town of Phandalin.','Forgotten Realms',1,6),(29,'Descent into Avernus','An epic adventure where heroes must delve into the Nine Hells to save the city of Baldur\'s Gate.','Avernus',1,13),(30,'Waterdeep: Dragon Heist','A grand urban caper set in the bustling city of Waterdeep, involving rival factions and a hidden treasure.','Forgotten Realms',1,5),(31,'Tomb of Annihilation','A deadly adventure in the jungles of Chult, focused on a death curse and a powerful lich.','Chult',1,11),(32,'Out of the Abyss','A dark and desperate adventure in the Underdark, where heroes must escape drow captivity and fight demonic threats.','Underdark',1,15),(33,'Storm King\'s Thunder','A giant-themed adventure where heroes must deal with a shattered ordning and rampaging giants.','Forgotten Realms',1,11),(34,'Princes of the Apocalypse','An elemental evil themed adventure where heroes must stop four elemental cults from unleashing destruction.','Forgotten Realms',1,15),(35,'Hoard of the Dragon Queen','The first part of the Tyranny of Dragons saga, focusing on the Cult of the Dragon and their efforts to summon Tiamat.','Forgotten Realms',1,8),(36,'The Rise of Tiamat','The conclusion of the Tyranny of Dragons saga, where heroes face Tiamat herself.','Forgotten Realms',8,15),(37,'Ghosts of Saltmarsh','A collection of nautical adventures and coastal intrigue.','Greyhawk',1,12),(38,'Rime of the Frostmaiden','A survival horror adventure set in the frozen wastes of Icewind Dale, plagued by an everlasting winter.','Icewind Dale',1,12),(39,'The Sunless Citadel','A classic introductory dungeon crawl involving goblins and a mystical tree.','Greyhawk',1,3),(40,'The Forge of Fury','A dungeon adventure focused on dwarves, duergar, and a powerful dragon.','Greyhawk',3,5),(41,'The Hidden Shrine of Tamoachan','A jungle adventure exploring an ancient, trap-filled ruin.','Lost City of Omu',5,8),(42,'White Plume Mountain','An eccentric wizard\'s lair filled with magical weapons and dangerous traps.','Greyhawk',8,10),(43,'Against the Cult of the Reptile God','A classic adventure where heroes must investigate a mysterious cult in a rural village.','Greyhawk',1,3),(44,'Lost Laboratory of Kwalish','An adventure involving a forgotten wizard\'s laboratory and strange constructs.','Planescape',6,10),(45,'Infernal Machine Rebuild','A high-level adventure involving a powerful infernal contraption and planar travel.','Multiverse',11,16),(46,'The Wild Beyond the Witchlight','A whimsical Feywild adventure focused on carnival magic and breaking a curse.','Feywild',1,8),(47,'Candlekeep Mysteries','A collection of short mystery adventures tied to the grand library of Candlekeep.','Forgotten Realms',1,16),(48,'Strixhaven: A Curriculum of Chaos','Adventures set in a magical university, exploring campus life and a looming threat.','Arcavios',1,8),(49,'Fizban\'s Treasury of Dragons (Adventures)','Short adventures and encounters focused on dragons.','Various',1,20),(50,'A Friend in Need','A short, low-level rescue mission in a small town.','Forgotten Realms',1,2);
/*!40000 ALTER TABLE `adventure` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `adventure_character`
--

DROP TABLE IF EXISTS `adventure_character`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `adventure_character` (
  `adventure_character_id` int unsigned NOT NULL AUTO_INCREMENT,
  `join_date` date NOT NULL,
  `leave_date` date DEFAULT NULL,
  `character_id` int unsigned NOT NULL,
  `adventure_id` int unsigned NOT NULL,
  PRIMARY KEY (`adventure_character_id`),
  KEY `fk_adventure_character_character1_idx` (`character_id`),
  KEY `fk_adventure_character_adventure1_idx` (`adventure_id`),
  CONSTRAINT `fk_adventure_character_adventure1` FOREIGN KEY (`adventure_id`) REFERENCES `adventure` (`adventure_id`),
  CONSTRAINT `fk_adventure_character_character1` FOREIGN KEY (`character_id`) REFERENCES `character` (`character_id`)
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adventure_character`
--

LOCK TABLES `adventure_character` WRITE;
/*!40000 ALTER TABLE `adventure_character` DISABLE KEYS */;
INSERT INTO `adventure_character` VALUES (51,'2023-01-12','2023-01-16',58,26),(52,'2023-01-12','2023-01-20',59,26),(53,'2023-01-13','2023-01-20',55,26),(54,'2023-02-17','2023-02-24',55,27),(55,'2023-03-17','2023-03-25',52,28),(56,'2023-04-20',NULL,58,28),(57,'2023-04-27',NULL,81,29),(58,'2023-02-24','2023-03-03',59,27),(59,'2023-05-01','2023-05-10',60,30),(60,'2023-05-01','2023-05-10',53,30),(61,'2023-06-05','2023-06-20',98,31),(62,'2023-06-05',NULL,99,31),(63,'2023-07-01','2023-07-15',100,32),(64,'2023-07-01',NULL,101,32),(65,'2023-08-10','2023-08-25',61,33),(66,'2023-08-10',NULL,62,33),(67,'2023-09-01','2023-09-15',63,34),(68,'2023-09-01',NULL,64,34),(69,'2023-10-01','2023-10-10',65,35),(70,'2023-10-01',NULL,66,35),(71,'2023-11-05','2023-11-20',67,36),(72,'2023-11-05',NULL,68,36),(73,'2024-01-10','2024-01-25',69,37),(74,'2024-01-10',NULL,70,37),(75,'2024-02-15','2024-03-01',71,38),(76,'2024-02-15',NULL,72,38),(77,'2024-03-20','2024-04-05',73,39),(78,'2024-03-20',NULL,74,39),(79,'2024-05-01','2024-05-15',75,40),(80,'2024-05-01',NULL,56,40),(81,'2024-06-10','2024-06-25',65,41),(82,'2024-06-10',NULL,76,41),(83,'2024-07-01','2024-07-10',77,42),(84,'2024-07-01',NULL,78,42),(85,'2024-08-05','2024-08-20',79,43),(86,'2024-08-05',NULL,80,43),(87,'2024-09-01','2024-09-15',81,44),(88,'2024-09-01',NULL,82,44),(89,'2024-10-10','2024-10-25',83,45),(90,'2024-10-10',NULL,84,45),(91,'2024-11-01','2024-11-15',85,46),(92,'2024-11-01',NULL,86,46),(93,'2024-12-05','2024-12-20',87,47),(94,'2024-12-05',NULL,88,47),(95,'2025-01-01','2025-01-15',89,48),(96,'2025-01-01',NULL,90,48),(97,'2025-02-10','2025-02-25',91,49),(98,'2025-02-10',NULL,92,49),(99,'2025-03-01','2025-03-15',93,50),(100,'2025-03-01',NULL,94,50),(101,'2025-04-01','2025-04-10',95,39),(102,'2025-04-01',NULL,96,39),(103,'2025-05-01','2025-05-15',97,40);
/*!40000 ALTER TABLE `adventure_character` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `campaign`
--

DROP TABLE IF EXISTS `campaign`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `campaign` (
  `campaign_id` int unsigned NOT NULL AUTO_INCREMENT,
  `campaign_name` varchar(45) NOT NULL,
  `setting` varchar(45) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date DEFAULT NULL,
  PRIMARY KEY (`campaign_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `campaign`
--

LOCK TABLES `campaign` WRITE;
/*!40000 ALTER TABLE `campaign` DISABLE KEYS */;
INSERT INTO `campaign` VALUES (11,'Shadows of the Past','Forgotten Realms','2023-02-01',NULL),(12,'The Emerald Crown','Exandria','2023-01-10','2023-04-15'),(13,'The Obsidian Knot','Eberron','2023-03-01','2023-06-30'),(14,'The Frostfire Peaks','Icewind Dale','2022-01-01','2022-05-31'),(15,'Secrets of the Underdark','Underdark','2024-03-01',NULL),(16,'The Cult of the Dragon','Forgotten Realms','2021-10-15','2022-03-31'),(17,'Echoes of the Planes','Multiverse','2020-06-01','2021-02-28'),(18,'The Lost City of Omu','Chult','2023-09-01',NULL),(19,'Avernus Eternal','Avernus','2022-06-01',NULL),(20,'The Dreadwood Chronicles','Barovia','2023-11-01','2024-02-15');
/*!40000 ALTER TABLE `campaign` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `character`
--

DROP TABLE IF EXISTS `character`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `character` (
  `character_id` int unsigned NOT NULL AUTO_INCREMENT,
  `character_name` varchar(45) NOT NULL,
  `level` int NOT NULL,
  `alignment` varchar(45) NOT NULL,
  `background` varchar(250) NOT NULL,
  `race_id` int unsigned NOT NULL,
  `class_id` int unsigned NOT NULL,
  `player_id` int unsigned NOT NULL,
  PRIMARY KEY (`character_id`),
  KEY `fk_character_race_idx` (`race_id`),
  KEY `fk_character_class1_idx` (`class_id`),
  KEY `fk_character_player1_idx` (`player_id`),
  CONSTRAINT `fk_character_class1` FOREIGN KEY (`class_id`) REFERENCES `class` (`class_id`),
  CONSTRAINT `fk_character_player1` FOREIGN KEY (`player_id`) REFERENCES `player` (`player_id`),
  CONSTRAINT `fk_character_race` FOREIGN KEY (`race_id`) REFERENCES `race` (`race_id`)
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `character`
--

LOCK TABLES `character` WRITE;
/*!40000 ALTER TABLE `character` DISABLE KEYS */;
INSERT INTO `character` VALUES (51,'Aelar Starfall',5,'Neutral Good','Disciple',51,59,51),(52,'Borin Stonehand',6,'Lawful Good','Veteran',53,60,52),(53,'Cyra Swiftshadow',4,'Chaotic Neutral','Shadow Operative',52,64,53),(54,'Darian Brightblade',7,'Lawful Good','Noble',57,91,54),(55,'Elara Whisperwind',5,'Chaotic Good','Forest Guardian',52,108,55),(56,'Finnian O\'Malley',3,'Neutral','Entertainer',54,83,56),(57,'Gareth Ironhide',8,'Lawful Neutral','Soldier',58,79,57),(58,'Lyra Meadowlight',6,'Neutral Good','Hermit',51,74,58),(59,'Zephyr Quickfoot',5,'Chaotic Good','Urchin',56,65,59),(60,'Valeria Swiftarrow',7,'Neutral','Outlander',52,95,60),(61,'Seraphina Brightspark',8,'Chaotic Good','Sage',59,99,61),(62,'Roric Stonebeard',6,'Lawful Neutral','Guild Artisan',53,59,62),(63,'Lysandra Shadow',5,'Neutral Evil','Criminal',59,104,63),(64,'Thrain Battleborn',7,'Lawful Good','Soldier',55,92,64),(65,'Anya Fireheart',6,'Chaotic Good','Folk Hero',51,80,65),(66,'Darian Skyrunner',4,'Neutral','Sailor',63,67,66),(67,'Lena Cloudstrider',5,'Lawful Good','Acolyte',64,75,67),(68,'Gareth Stoutheart',8,'Lawful Good','Knight',73,63,68),(69,'Silas Vane',7,'Chaotic Neutral','Spy',51,65,69),(70,'Rowan Blackwood',6,'Neutral','Hermit',68,107,70),(71,'Thalia Swift',5,'Chaotic Good','Folk Hero',94,87,71),(72,'Kael Shadowbrook',7,'Neutral Evil','Noble',67,72,72),(73,'Mina Stonefoot',6,'Lawful Good','Commoner',53,77,73),(74,'Orin Brightaxe',8,'Chaotic Good','Far Traveler',73,81,74),(75,'Briar Rose',5,'Neutral Good','Urchin',93,85,75),(76,'Caleb Stonefield',6,'Neutral','Outlander',51,96,76),(77,'Nyssa Windrider',7,'Chaotic Good','Sailor',77,100,77),(78,'Ragnar Bloodaxe',8,'Chaotic Evil','Pirate',61,80,78),(79,'Elara Shadowsong',5,'Neutral Evil','Hermit',82,105,79),(80,'Flint Emberforge',6,'Lawful Good','Guild Artisan',53,111,80),(81,'Ivy Thorne',7,'Neutral','Hermit',57,66,81),(82,'Bran Stonefist',8,'Lawful Neutral','Soldier',73,60,82),(83,'Seraphina Moonbow',5,'Chaotic Good','Acolyte',64,78,83),(84,'Grizzelda Rockgut',6,'Neutral Evil','Criminal',65,82,84),(85,'Darien Storm',7,'Lawful Good','Noble',69,94,85),(86,'Aella Windchaser',5,'Chaotic Good','Outlander',91,97,86),(87,'Joric Stout',6,'Lawful Neutral','Guild Artisan',53,112,87),(88,'Kaelen Nightshade',7,'Neutral Evil','Spy',92,65,88),(89,'Lyra Silvertongue',5,'Chaotic Good','Courtier',51,86,89),(90,'Morgana Shadowfen',8,'Neutral Evil','Hermit',59,106,90),(91,'Orion Starfire',6,'Lawful Good','Sage',64,101,91),(92,'Pippin Greengrass',4,'Neutral Good','Folk Hero',54,79,92),(93,'Quinn Falconwing',7,'Chaotic Neutral','Urchin',63,64,93),(94,'Zylos Darkblade',8,'Neutral Evil','Criminal',67,61,94),(95,'Kira Sunfire',5,'Lawful Good','Acolyte',51,76,95),(96,'Alden Stonehand',6,'Neutral Good','Soldier',53,113,96),(97,'Evelyn Whisperwind',7,'Chaotic Good','Hermit',52,110,97),(98,'Torvin Battlehammer',8,'Lawful Good','Soldier',53,60,54),(99,'Liliana Vess',9,'Neutral Evil','Noble',51,71,51),(100,'Garrick Goldtongue',7,'Chaotic Good','Charlatan',59,84,53),(101,'Kaelen Stormblade',6,'Lawful Good','Knight',51,93,55);
/*!40000 ALTER TABLE `character` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `character_camp`
--

DROP TABLE IF EXISTS `character_camp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `character_camp` (
  `character_camp_id` int unsigned NOT NULL AUTO_INCREMENT,
  `join_date` date NOT NULL,
  `leave_date` date DEFAULT NULL,
  `character_id` int unsigned NOT NULL,
  `campaign_id` int unsigned NOT NULL,
  PRIMARY KEY (`character_camp_id`),
  KEY `fk_character_camp_character1_idx` (`character_id`),
  KEY `fk_character_camp_campaign1_idx` (`campaign_id`),
  CONSTRAINT `fk_character_camp_campaign1` FOREIGN KEY (`campaign_id`) REFERENCES `campaign` (`campaign_id`),
  CONSTRAINT `fk_character_camp_character1` FOREIGN KEY (`character_id`) REFERENCES `character` (`character_id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `character_camp`
--

LOCK TABLES `character_camp` WRITE;
/*!40000 ALTER TABLE `character_camp` DISABLE KEYS */;
INSERT INTO `character_camp` VALUES (51,'2023-02-09',NULL,58,11),(52,'2023-01-12','2023-03-25',59,12),(53,'2023-01-12',NULL,55,12),(54,'2023-02-09',NULL,81,11),(55,'2023-03-09','2023-03-25',52,13),(56,'2022-01-15','2022-03-01',60,14),(57,'2024-03-01',NULL,53,15),(58,'2021-11-01','2022-03-15',98,16),(59,'2020-07-01','2021-01-31',99,17),(60,'2023-03-01','2023-04-10',100,12),(61,'2023-09-10',NULL,101,18),(62,'2023-09-10',NULL,61,18),(63,'2022-07-01',NULL,62,19),(64,'2022-07-01',NULL,63,19),(65,'2023-11-05','2024-01-10',64,20),(66,'2023-11-05','2024-01-10',65,20),(67,'2021-03-20','2021-09-10',66,17),(68,'2021-03-20','2021-09-10',67,17),(69,'2017-04-01','2017-12-25',68,16),(70,'2017-04-01','2017-12-25',69,16),(71,'2019-03-10',NULL,70,11),(72,'2019-03-10',NULL,71,11),(73,'2024-06-01',NULL,72,15),(74,'2024-06-01',NULL,73,15),(75,'2023-08-15','2024-01-10',74,13),(76,'2023-08-15','2024-01-10',75,13),(77,'2022-10-01','2023-02-15',56,14),(78,'2022-10-01','2023-02-15',65,14),(79,'2025-02-10',NULL,76,11),(80,'2025-02-10',NULL,77,11),(81,'2024-04-20','2024-07-01',78,19),(82,'2024-04-20','2024-07-01',79,19),(83,'2023-06-01','2023-09-30',80,18),(84,'2023-06-01','2023-09-30',81,18),(85,'2022-02-01','2022-05-15',82,12),(86,'2022-02-01','2022-05-15',83,12),(87,'2021-10-25','2022-04-05',84,13),(88,'2021-10-25','2022-04-05',85,13),(89,'2024-07-15',NULL,86,11),(90,'2024-07-15',NULL,87,11),(91,'2024-08-01',NULL,88,15),(92,'2024-09-01',NULL,89,12),(93,'2024-10-01',NULL,90,20),(94,'2024-11-01',NULL,91,19),(95,'2024-12-01',NULL,92,18),(96,'2025-01-01',NULL,93,14),(97,'2025-02-01',NULL,94,13),(98,'2025-03-01',NULL,95,15),(99,'2025-04-01',NULL,96,16),(100,'2025-05-01',NULL,97,17);
/*!40000 ALTER TABLE `character_camp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `character_item`
--

DROP TABLE IF EXISTS `character_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `character_item` (
  `character_item_id` int unsigned NOT NULL AUTO_INCREMENT,
  `quantity` int NOT NULL,
  `character_id` int unsigned NOT NULL,
  `item_id` int unsigned NOT NULL,
  PRIMARY KEY (`character_item_id`),
  KEY `fk_character_item_character1_idx` (`character_id`),
  KEY `fk_character_item_item1_idx` (`item_id`),
  CONSTRAINT `fk_character_item_character1` FOREIGN KEY (`character_id`) REFERENCES `character` (`character_id`),
  CONSTRAINT `fk_character_item_item1` FOREIGN KEY (`item_id`) REFERENCES `item` (`item_id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `character_item`
--

LOCK TABLES `character_item` WRITE;
/*!40000 ALTER TABLE `character_item` DISABLE KEYS */;
INSERT INTO `character_item` VALUES (51,1,58,51),(52,2,59,52),(53,1,55,53),(54,3,81,54),(55,1,52,55),(56,1,60,56),(57,1,53,57),(58,1,98,58),(59,1,99,59),(60,1,100,60),(61,1,101,61),(62,1,61,62),(63,1,62,63),(64,1,63,64),(65,1,64,65),(66,5,65,66),(67,1,66,67),(68,1,67,68),(69,1,68,69),(70,1,69,70),(71,1,70,71),(72,1,71,72),(73,1,72,73),(74,1,73,74),(75,1,74,75),(76,1,75,76),(77,1,56,77),(78,1,65,78),(79,1,76,79),(80,1,77,80),(81,1,78,81),(82,1,79,82),(83,1,80,83),(84,1,81,84),(85,1,82,85),(86,1,83,86),(87,1,84,87),(88,1,85,88),(89,1,86,89),(90,1,87,90),(91,1,88,91),(92,1,89,92),(93,1,90,93),(94,1,91,94),(95,1,92,95),(96,1,93,96),(97,1,94,97),(98,1,95,98),(99,1,96,99),(100,1,97,100);
/*!40000 ALTER TABLE `character_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `character_skill`
--

DROP TABLE IF EXISTS `character_skill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `character_skill` (
  `character_skill_id` int unsigned NOT NULL AUTO_INCREMENT,
  `proficiency_bonus` int NOT NULL,
  `character_id` int unsigned NOT NULL,
  `skill_id` int unsigned NOT NULL,
  PRIMARY KEY (`character_skill_id`),
  KEY `fk_character_skill_character1_idx` (`character_id`),
  KEY `fk_character_skill_skill1_idx` (`skill_id`),
  CONSTRAINT `fk_character_skill_character1` FOREIGN KEY (`character_id`) REFERENCES `character` (`character_id`),
  CONSTRAINT `fk_character_skill_skill1` FOREIGN KEY (`skill_id`) REFERENCES `skill` (`skill_id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `character_skill`
--

LOCK TABLES `character_skill` WRITE;
/*!40000 ALTER TABLE `character_skill` DISABLE KEYS */;
INSERT INTO `character_skill` VALUES (51,2,58,21),(52,3,59,35),(53,2,55,22),(54,2,81,28),(55,2,52,26),(56,3,60,19),(57,2,53,25),(58,3,98,32),(59,2,99,24),(60,2,100,23),(61,2,101,22),(62,3,61,31),(63,2,62,26),(64,3,63,35),(65,2,64,36),(66,2,65,28),(67,3,66,19),(68,2,67,25),(69,3,68,27),(70,2,69,23),(71,2,70,29),(72,3,71,34),(73,2,72,33),(74,3,73,30),(75,2,74,22),(76,2,75,20),(77,3,56,32),(78,2,54,26),(79,2,76,24),(80,3,77,19),(81,2,78,22),(82,3,79,25),(83,2,80,27),(84,3,81,23),(85,2,82,36),(86,3,83,21),(87,2,84,26),(88,2,85,28),(89,3,86,35),(90,2,87,30),(91,2,88,25),(92,3,89,31),(93,2,90,33),(94,3,91,21),(95,2,92,20),(96,3,93,19),(97,2,94,27),(98,3,95,28),(99,2,96,22),(100,3,97,29);
/*!40000 ALTER TABLE `character_skill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `character_spell`
--

DROP TABLE IF EXISTS `character_spell`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `character_spell` (
  `character_spell_id` int unsigned NOT NULL AUTO_INCREMENT,
  `character_id` int unsigned NOT NULL,
  `spell_id` int unsigned NOT NULL,
  PRIMARY KEY (`character_spell_id`),
  KEY `fk_character_spell_character1_idx` (`character_id`),
  KEY `fk_character_spell_spell1_idx` (`spell_id`),
  CONSTRAINT `fk_character_spell_character1` FOREIGN KEY (`character_id`) REFERENCES `character` (`character_id`),
  CONSTRAINT `fk_character_spell_spell1` FOREIGN KEY (`spell_id`) REFERENCES `spell` (`spell_id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `character_spell`
--

LOCK TABLES `character_spell` WRITE;
/*!40000 ALTER TABLE `character_spell` DISABLE KEYS */;
INSERT INTO `character_spell` VALUES (51,58,51),(52,99,53),(53,58,52),(54,81,54),(55,53,55),(56,53,56),(57,53,51),(58,99,52),(59,99,54),(60,81,55),(61,101,57),(62,61,58),(63,62,59),(64,63,60),(65,64,61),(66,65,62),(67,66,63),(68,67,64),(69,68,51),(70,69,65),(71,70,66),(72,71,67),(73,72,68),(74,73,69),(75,74,70),(76,75,71),(77,56,72),(78,54,53),(79,76,73),(80,77,74),(81,78,75),(82,79,76),(83,80,77),(84,81,78),(85,82,79),(86,83,80),(87,84,81),(88,85,82),(89,86,83),(90,87,84),(91,88,85),(92,89,86),(93,90,87),(94,91,88),(95,92,89),(96,93,90),(97,94,91),(98,95,92),(99,96,93),(100,97,94);
/*!40000 ALTER TABLE `character_spell` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `class`
--

DROP TABLE IF EXISTS `class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `class` (
  `class_id` int unsigned NOT NULL AUTO_INCREMENT,
  `class_name` varchar(45) NOT NULL,
  `description` varchar(250) DEFAULT NULL,
  `hit_dice` varchar(45) NOT NULL,
  `primary_ability` varchar(100) NOT NULL,
  PRIMARY KEY (`class_id`)
) ENGINE=InnoDB AUTO_INCREMENT=117 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `class`
--

LOCK TABLES `class` WRITE;
/*!40000 ALTER TABLE `class` DISABLE KEYS */;
INSERT INTO `class` VALUES (59,'Fighter (Battle Master)','Fighters who employ martial maneuvers to control the battlefield.','1d10','Strength or Dexterity'),(60,'Fighter (Champion)','Fighters who focus on raw physical power and combat prowess.','1d10','Strength or Dexterity'),(61,'Fighter (Eldritch Knight)','Fighters who blend martial training with arcane magic.','1d10','Intelligence'),(62,'Fighter (Cavalier)','Fighters who excel at mounted combat and protecting allies.','1d10','Strength or Dexterity'),(63,'Fighter (Samurai)','Fighters who combine martial discipline with an indomitable spirit.','1d10','Strength or Dexterity'),(64,'Rogue (Thief)','Rogues specialized in quick hands, stealth, and infiltration.','1d8','Dexterity'),(65,'Rogue (Assassin)','Rogues who master the art of striking from the shadows for lethal effect.','1d8','Dexterity'),(66,'Rogue (Arcane Trickster)','Rogues who weave arcane magic into their cunning.','1d8','Intelligence'),(67,'Rogue (Swashbuckler)','Rogues who excel in dazzling combat and charming social encounters.','1d8','Dexterity'),(68,'Rogue (Inquisitive)','Rogues who excel at uncovering secrets and exploiting weaknesses.','1d8','Dexterity'),(69,'Wizard (Abjuration)','Wizards specialized in protective and counter-magical spells.','1d6','Intelligence'),(70,'Wizard (Evocation)','Wizards who focus on unleashing raw magical energy.','1d6','Intelligence'),(71,'Wizard (Conjuration)','Wizards who master the art of summoning and teleportation.','1d6','Intelligence'),(72,'Wizard (Divination)','Wizards who focus on gaining knowledge and foretelling the future.','1d6','Intelligence'),(73,'Wizard (Enchantment)','Wizards who master the art of influencing minds and emotions.','1d6','Intelligence'),(74,'Cleric (Life Domain)','Clerics who channel divine power to heal and preserve life.','1d8','Wisdom'),(75,'Cleric (Light Domain)','Clerics who wield the power of light to banish darkness and harm.','1d8','Wisdom'),(76,'Cleric (War Domain)','Clerics who combine divine might with martial prowess.','1d8','Wisdom'),(77,'Cleric (Knowledge Domain)','Clerics who seek knowledge and truth through divine revelation.','1d8','Wisdom'),(78,'Cleric (Tempest Domain)','Clerics who wield the destructive power of storms and thunder.','1d8','Wisdom'),(79,'Barbarian (Path of the Totem Warrior)','Barbarians who channel the spirits of animals for powerful combat abilities.','1d12','Strength'),(80,'Barbarian (Path of the Berserker)','Barbarians who enter a frenzy in battle, shrugging off pain.','1d12','Strength'),(81,'Barbarian (Path of the Zealot)','Barbarians who channel divine fury into their rage.','1d12','Strength'),(82,'Barbarian (Path of the Wild Magic)','Barbarians whose rage taps into unpredictable magical energy.','1d12','Strength'),(83,'Bard (College of Lore)','Bards who gather knowledge and inspire allies with their vast repertoire.','1d8','Charisma'),(84,'Bard (College of Valor)','Bards who inspire courage and prowess on the battlefield.','1d8','Charisma'),(85,'Bard (College of Creation)','Bards who channel the Song of Creation to bring art to life.','1d8','Charisma'),(86,'Bard (College of Glamour)','Bards who use fey magic and dazzling performance to captivate and charm.','1d8','Charisma'),(87,'Monk (Way of the Open Hand)','Monks who master unarmed combat and subtle ki manipulations.','1d8','Dexterity or Wisdom'),(88,'Monk (Way of Shadow)','Monks who blend ki with shadow magic for stealth and assassination.','1d8','Dexterity or Wisdom'),(89,'Monk (Way of the Astral Self)','Monks who manifest a portion of their inner spirit as an astral form.','1d8','Dexterity or Wisdom'),(90,'Monk (Way of the Drunken Master)','Monks who appear clumsy but fight with unpredictable, flowing movements.','1d8','Dexterity or Wisdom'),(91,'Paladin (Oath of Devotion)','Paladins whose sacred oath binds them to justice and truth.','1d10','Strength and Charisma'),(92,'Paladin (Oath of Vengeance)','Paladins who relentlessly pursue and punish those who commit evil.','1d10','Strength and Charisma'),(93,'Paladin (Oath of the Ancients)','Paladins who draw power from the natural world and the light.','1d10','Strength and Charisma'),(94,'Paladin (Oath of Conquest)','Paladins who crush the forces of chaos and assert unwavering order.','1d10','Strength and Charisma'),(95,'Ranger (Hunter)','Rangers who specialize in tracking and fighting specific types of foes.','1d10','Dexterity and Wisdom'),(96,'Ranger (Beast Master)','Rangers who form a deep bond with a loyal animal companion.','1d10','Dexterity and Wisdom'),(97,'Ranger (Gloom Stalker)','Rangers who master the art of ambushing foes from the darkness.','1d10','Dexterity and Wisdom'),(98,'Ranger (Horizon Walker)','Rangers who defend the multiverse from planar threats.','1d10','Dexterity and Wisdom'),(99,'Sorcerer (Draconic Bloodline)','Sorcerers whose innate magic comes from a dragon ancestor.','1d6','Charisma'),(100,'Sorcerer (Wild Magic)','Sorcerers whose innate magic is volatile and unpredictable.','1d6','Charisma'),(101,'Sorcerer (Divine Soul)','Sorcerers whose magic is touched by a divine power.','1d6','Charisma'),(102,'Sorcerer (Shadow Magic)','Sorcerers whose magic is imbued with the power of the Shadowfell.','1d6','Charisma'),(103,'Warlock (The Archfey)','Warlocks who gain power from mischievous and ancient fey creatures.','1d8','Charisma'),(104,'Warlock (The Fiend)','Warlocks who gain power from a pact with a devil or demon.','1d8','Charisma'),(105,'Warlock (The Great Old One)','Warlocks who gain power from an ancient, unknowable cosmic entity.','1d8','Charisma'),(106,'Warlock (The Hexblade)','Warlocks whose patron is a sentient weapon from the Shadowfell.','1d8','Charisma'),(107,'Druid (Circle of the Moon)','Druids who master wild shape, transforming into powerful beasts.','1d8','Wisdom'),(108,'Druid (Circle of the Land)','Druids who draw power from a specific type of terrain.','1d8','Wisdom'),(109,'Druid (Circle of the Spores)','Druids who find beauty in decay and life in death through spores.','1d8','Wisdom'),(110,'Druid (Circle of Wildfire)','Druids who wield the destructive and regenerative power of fire.','1d8','Wisdom'),(111,'Artificer (Alchemist)','Artificers who use alchemical concoctions to heal and harm.','1d8','Intelligence'),(112,'Artificer (Armorer)','Artificers who specialize in arcane armored suits.','1d8','Intelligence'),(113,'Artificer (Battle Smith)','Artificers who create and fight alongside a magical steel defender.','1d8','Intelligence'),(114,'Artificer (Artillerist)','Artificers who create devastating arcane turrets.','1d8','Intelligence'),(115,'Blood Hunter (Order of the Lycan)','Blood Hunters who embrace lycanthropic forms in battle.','1d10','Strength or Dexterity'),(116,'Blood Hunter (Order of the Ghostslayer)','Blood Hunters who hunt undead and spectral foes.','1d10','Strength or Dexterity');
/*!40000 ALTER TABLE `class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `experience`
--

DROP TABLE IF EXISTS `experience`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `experience` (
  `experience_id` int unsigned NOT NULL AUTO_INCREMENT,
  `date_earned` date NOT NULL,
  `amount` int NOT NULL,
  `reason` varchar(100) NOT NULL,
  `character_id` int unsigned NOT NULL,
  `player_id` int unsigned NOT NULL,
  PRIMARY KEY (`experience_id`),
  KEY `fk_experience_character1_idx` (`character_id`),
  KEY `fk_experience_player1_idx` (`player_id`),
  CONSTRAINT `fk_experience_character1` FOREIGN KEY (`character_id`) REFERENCES `character` (`character_id`),
  CONSTRAINT `fk_experience_player1` FOREIGN KEY (`player_id`) REFERENCES `player` (`player_id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `experience`
--

LOCK TABLES `experience` WRITE;
/*!40000 ALTER TABLE `experience` DISABLE KEYS */;
INSERT INTO `experience` VALUES (51,'2023-07-10',500,'Defeated a goblin patrol',51,51),(52,'2023-07-11',300,'Discovered a hidden passage',58,58),(53,'2023-07-12',750,'Cleared the bandit camp',54,54),(54,'2023-07-13',200,'Identified a rare herb',55,55),(55,'2023-07-14',400,'Negotiated with hostile creatures',56,56),(56,'2023-07-15',800,'Recovered a lost artifact',57,57),(57,'2023-07-16',700,'Overcame the bandit leader and their lieutenant',52,52),(58,'2023-07-17',450,'Disarmed a particularly intricate trap sequence',60,60),(59,'2023-07-18',375,'Studied and translated a different section of the text',53,53),(60,'2023-07-19',900,'Forged a lasting alliance between the warring factions',98,54),(61,'2023-07-20',650,'Discovered the true nature of the magical secret',99,51),(62,'2023-07-21',575,'Successfully bargained with the grumpy innkeeper for crucial information',100,53),(63,'2023-07-22',720,'Navigated the treacherous swamp without getting lost',101,55),(64,'2023-07-23',850,'Defeated the monstrous spider guarding the ancient ruins',61,61),(65,'2023-07-24',600,'Repaired the broken bridge, allowing safe passage for the villagers',62,62),(66,'2023-07-25',480,'Uncovered a hidden cult and its nefarious plans',63,63),(67,'2023-07-26',950,'Led the charge against the attacking horde, inspiring allies',64,64),(68,'2023-07-27',420,'Provided vital medical aid to injured refugees',65,65),(69,'2023-07-28',530,'Outmaneuvered the city guards during a chase sequence',66,66),(70,'2023-07-29',780,'Deciphered the ancient prophecies, revealing the path forward',67,67),(71,'2023-07-30',670,'Uncovered a conspiracy within the local government',68,68),(72,'2023-07-31',350,'Successfully bluffed your way past the suspicious merchant',69,69),(73,'2023-08-01',880,'Purified the corrupted ancient grove, restoring its natural balance',70,70),(74,'2023-08-02',490,'Performed a daring rescue operation to save captured villagers',71,71),(75,'2023-08-03',760,'Translated obscure religious texts, revealing a hidden truth',72,72),(76,'2023-08-04',550,'Discovered a secret entrance to the dungeon',73,73),(77,'2023-08-05',920,'Held off the advancing monster horde single-handedly',74,74),(78,'2023-08-06',410,'Calmed the panicked wild beasts, preventing a stampede',75,75),(79,'2023-08-07',680,'Convinced the skeptical elder to provide assistance',56,56),(80,'2023-08-08',390,'Intimidated the local thugs into backing down',54,54),(81,'2023-08-09',710,'Investigated the strange disappearances in the village',76,76),(82,'2023-08-10',580,'Performed a dazzling aerial maneuver in combat',77,77),(83,'2023-08-11',830,'Defeated a powerful cult leader in ritual combat',78,78),(84,'2023-08-12',460,'Uncovered a deep-seated corruption within the city watch',79,79),(85,'2023-08-13',690,'Crafted a potent alchemical remedy for the poisoned mayor',80,80),(86,'2023-08-14',360,'Used cunning to infiltrate the enemy stronghold undetected',81,81),(87,'2023-08-15',910,'Defended the village from a siege of monstrous creatures',82,82),(88,'2023-08-16',520,'Restored the ancient temple to its former glory',83,83),(89,'2023-08-17',740,'Successfully negotiated a truce between rival factions',84,84),(90,'2023-08-18',430,'Provided critical intel that turned the tide of battle',85,85),(91,'2023-08-19',890,'Performed a captivating musical piece that swayed the crowd',86,86),(92,'2023-08-20',610,'Discovered a hidden treasure trove in the ruins',87,87),(93,'2023-08-21',340,'Infiltrated the enemy camp and stole crucial documents',88,88),(94,'2023-08-22',770,'Charmed a powerful noble into revealing a secret',89,89),(95,'2023-08-23',560,'Performed a ritual to banish an infernal presence',90,90),(96,'2023-08-24',930,'Called down a bolt of lightning to strike your foes',91,91),(97,'2023-08-25',400,'Escaped from a collapsing dungeon with quick thinking',92,92),(98,'2023-08-26',660,'Led a daring assault on a dragon\'s lair',93,93),(99,'2023-08-27',380,'Uncovered an ancient, forbidden magical ritual',94,94),(100,'2023-08-28',790,'Healed the wounded and brought comfort to the suffering',95,95);
/*!40000 ALTER TABLE `experience` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item`
--

DROP TABLE IF EXISTS `item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item` (
  `item_id` int unsigned NOT NULL AUTO_INCREMENT,
  `item_name` varchar(45) NOT NULL,
  `description` varchar(250) DEFAULT NULL,
  `cost` decimal(10,2) DEFAULT NULL,
  `weight` int DEFAULT NULL,
  `rarity` varchar(45) NOT NULL,
  `item_type` varchar(45) NOT NULL,
  PRIMARY KEY (`item_id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item`
--

LOCK TABLES `item` WRITE;
/*!40000 ALTER TABLE `item` DISABLE KEYS */;
INSERT INTO `item` VALUES (51,'Spellbook','A book containing a wizard\'s spells.',50.00,3,'Common','Wondrous Item'),(52,'Dagger','A small, easily concealed blade.',2.00,1,'Common','Weapon'),(53,'Longsword','A versatile one-handed sword.',15.00,3,'Common','Weapon'),(54,'Healing Potion','A magical potion that restores health.',50.00,0,'Common','Potion'),(55,'Leather Armor','Light and flexible armor made from treated leather.',10.00,10,'Common','Armor'),(56,'Thieves\' Tools','A set of tools for picking locks and disarming traps.',25.00,1,'Common','Tools'),(57,'Shield','A piece of equipment held in one hand to deflect attacks.',10.00,6,'Common','Armor'),(58,'Bag of Holding','A magical bag that can hold more than its apparent size.',500.00,15,'Uncommon','Wondrous Item'),(59,'Ring of Protection','A magical ring that grants a bonus to Armor Class and saving throws.',1000.00,0,'Rare','Ring'),(60,'Backpack','A sturdy bag for carrying supplies.',2.00,5,'Common','Adventuring Gear'),(61,'Plate Armor','Heavy armor consisting of interlinking metal plates.',1500.00,65,'Common','Armor'),(62,'Wand of Magic Missiles','A wand that allows the wielder to cast Magic Missile.',500.00,1,'Uncommon','Wand'),(63,'Greatsword','A heavy, two-handed sword.',50.00,6,'Common','Weapon'),(64,'Cloak of Elvenkind','A magical cloak that grants advantage on Dexterity (Stealth) checks.',2000.00,1,'Rare','Wondrous Item'),(65,'Warhammer','A powerful bludgeoning weapon.',15.00,2,'Common','Weapon'),(66,'Rations (1 day)','Enough food to sustain one creature for one day.',0.50,2,'Common','Consumable'),(67,'Shortbow','A common ranged weapon.',25.00,2,'Common','Weapon'),(68,'Arrow (Quiver of 20)','Twenty arrows for a bow.',1.00,1,'Common','Ammunition'),(69,'Scroll of Identify','A magical scroll containing the Identify spell.',100.00,0,'Common','Scroll'),(70,'Chain Mail','Medium armor made of interlocking metal rings.',75.00,55,'Common','Armor'),(71,'Potion of Greater Healing','A more potent healing potion.',150.00,0,'Uncommon','Potion'),(72,'Explorer\'s Pack','A collection of basic adventuring gear.',10.00,59,'Common','Kit'),(73,'Scimitar','A curved, light blade.',25.00,3,'Common','Weapon'),(74,'Darkvision Goggles','Goggles that grant darkvision out to a certain range.',200.00,1,'Uncommon','Wondrous Item'),(75,'Light Crossbow','A simple ranged weapon.',25.00,5,'Common','Weapon'),(76,'Bolt (Quiver of 20)','Twenty bolts for a crossbow.',1.00,2,'Common','Ammunition'),(77,'Handaxe','A light, throwable axe.',5.00,2,'Common','Weapon'),(78,'Herbalism Kit','A collection of tools for identifying and preparing herbs.',5.00,3,'Common','Tools'),(79,'Lute','A stringed musical instrument.',35.00,2,'Common','Musical Instrument'),(80,'Greataxe','A heavy, two-handed axe.',30.00,7,'Common','Weapon'),(81,'Map of the Local Region','A paper map depicting the surrounding area.',1.00,0,'Common','Document'),(82,'Amulet of Health','An amulet that sets the wearer\'s Constitution score to 19.',4000.00,1,'Rare','Amulet'),(83,'Staff of the Woodlands','A staff that grants spells related to nature and plants.',7500.00,4,'Rare','Staff'),(84,'Mithral Armor','A suit of armor made from the lightweight and flexible metal mithral.',2000.00,33,'Uncommon','Armor'),(85,'Poisons Kit','A set of tools for creating and applying poisons.',50.00,2,'Common','Tools'),(86,'Javelin','A light throwing spear.',0.50,2,'Common','Weapon'),(87,'Orb of Scrying','A magical orb used for remote viewing.',10000.00,3,'Very Rare','Wondrous Item'),(88,'Maul','A heavy, two-handed hammer.',10.00,10,'Common','Weapon'),(89,'Holy Symbol (Amulet)','A divine emblem, typically worn as an amulet.',5.00,1,'Common','Holy Symbol'),(90,'Dwarven Plate','Masterwork plate armor crafted by dwarves.',7500.00,65,'Very Rare','Armor'),(91,'Philter of Love','A potion that causes the drinker to fall in love with the first creature they see.',90.00,0,'Uncommon','Potion'),(92,'Portable Hole','A disc of cloth that opens into a personal extra-dimensional space.',10000.00,0,'Rare','Wondrous Item'),(93,'Quiver','A case for holding arrows or bolts.',1.00,1,'Common','Adventuring Gear'),(94,'Rope (50 feet)','A coil of sturdy hempen rope.',1.00,10,'Common','Adventuring Gear'),(95,'Sack','A simple cloth container.',0.10,1,'Common','Adventuring Gear'),(96,'Scale Mail','Medium armor made of overlapping scales.',50.00,45,'Common','Armor'),(97,'Torch','A stick with a flame at one end for illumination.',0.01,1,'Common','Adventuring Gear'),(98,'Waterskin','A container for carrying water.',0.20,5,'Common','Adventuring Gear'),(99,'Spyglass','A telescopic device for viewing distant objects.',1000.00,1,'Uncommon','Tools'),(100,'Component Pouch','A small, waterproof leather belt pouch that contains all the material components for spells.',25.00,2,'Common','Container');
/*!40000 ALTER TABLE `item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `player`
--

DROP TABLE IF EXISTS `player`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `player` (
  `player_id` int unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `join_date` date NOT NULL,
  `email` varchar(45) NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `f_name` varchar(45) NOT NULL,
  `l_name` varchar(45) NOT NULL,
  PRIMARY KEY (`player_id`),
  UNIQUE KEY `username_UNIQUE` (`username`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player`
--

LOCK TABLES `player` WRITE;
/*!40000 ALTER TABLE `player` DISABLE KEYS */;
INSERT INTO `player` VALUES (51,'UserAlpha','2022-01-15','alpha@gmail.com','2025-06-07 10:00:00','John','Doe'),(52,'BetaGaming','2022-02-20','beta@outlook.com','2025-06-06 14:30:00','Jane','Smith'),(53,'EchoPlay','2022-03-10','echo@yahoo.org','2025-06-05 18:00:00','Peter','Jones'),(54,'DeltaDawn','2022-04-05','delta@game.org','2025-06-07 09:15:00','Alice','Brown'),(55,'FoxtrotFun','2022-05-12','foxtrot@gmail.com','2025-06-04 20:00:00','Bob','White'),(56,'GamerGalore','2022-06-01','ggalore@outlook.com','2025-06-07 11:45:00','Sarah','Conner'),(57,'HeroHunter','2022-07-07','hhunter@yahoo.org','2025-06-03 16:00:00','Liam','O’Connell'),(58,'Infiniquest','2022-08-14','infiniquest@game.org','2025-06-07 13:00:00','Olivia','Davis'),(59,'JovialJester','2022-09-01','jjester@gmail.com','2025-06-02 21:00:00','William','Miller'),(60,'KnightRealm','2022-10-09','krealm@outlook.com','2025-06-07 10:30:00','Sophia','Wilson'),(61,'LegendLover','2022-11-18','llover@yahoo.org','2025-06-01 19:00:00','James','Moore'),(62,'MysticMage','2022-12-25','mmage@game.org','2025-06-07 08:00:00','Ava','Taylor'),(63,'NobleQuest','2023-01-01','nquest@gmail.com','2025-06-06 11:00:00','Benjamin','Anderson'),(64,'OracleOnline','2023-02-08','oonline@outlook.com','2025-06-05 13:45:00','Isabella','Thomas'),(65,'PixelPaladin','2023-03-17','ppaladin@yahoo.org','2025-06-07 15:00:00','Lucas','Jackson'),(66,'QuestQueen','2023-04-22','qqueen@game.org','2025-06-04 09:30:00','Mia','White'),(67,'RuneRunner','2023-05-30','rrunner@gmail.com','2025-06-07 16:00:00','Henry','Harris'),(68,'ShadowScribe','2023-06-15','sscribe@outlook.com','2025-06-03 12:00:00','Charlotte','Martin'),(69,'ThroneSeeker','2023-07-01','tseeker@yahoo.org','2025-06-07 17:00:00','Alexander','Thompson'),(70,'UnicornUser','2023-08-08','uuser@game.org','2025-06-02 14:00:00','Amelia','Garcia'),(71,'VentureVixen','2023-09-19','vvixen@gmail.com','2025-06-07 09:00:00','Daniel','Rodriguez'),(72,'WandererWiz','2023-10-26','wwiz@outlook.com','2025-06-06 16:30:00','Evelyn','Martinez'),(73,'XenonXplorer','2023-11-05','xxplorer@yahoo.org','2025-06-05 10:00:00','Matthew','Robinson'),(74,'YetiYeller','2023-12-12','yyeller@game.org','2025-06-07 11:00:00','Harper','Clark'),(75,'ZenithZephyr','2024-01-01','zzepyr@gmail.com','2025-06-04 14:00:00','Joseph','Lewis'),(76,'AlphaAdventurer','2024-01-10','alphaad@outlook.com','2025-06-07 13:30:00','Samuel','Lee'),(77,'BravoBrave','2024-01-15','bbrave@yahoo.org','2025-06-03 17:00:00','Ella','Walker'),(78,'ChronoCrafter','2024-01-20','ccrafter@game.org','2025-06-07 10:45:00','David','Hall'),(79,'DungeonDweller','2024-01-25','ddweller@gmail.com','2025-06-02 19:30:00','Abigail','Allen'),(80,'EpicExplorer','2024-02-01','eexplorer@outlook.com','2025-06-07 12:15:00','Andrew','Young'),(81,'FableFinder','2024-02-05','ffinder@yahoo.org','2025-06-06 08:30:00','Grace','Hernandez'),(82,'GrimGrin','2024-02-10','ggrin@game.org','2025-06-05 15:00:00','Christopher','King'),(83,'HearthBound','2024-02-15','hbound@gmail.com','2025-06-07 14:45:00','Emily','Wright'),(84,'Ironclad','2024-02-20','ironclad@outlook.com','2025-06-04 10:00:00','Joshua','Lopez'),(85,'JollyJourney','2024-02-25','jjourney@yahoo.org','2025-06-07 09:30:00','Chloe','Hill'),(86,'KeyKeeper','2024-03-01','kkeeper@game.org','2025-06-03 11:30:00','Ryan','Scott'),(87,'LunarLore','2024-03-05','llore@gmail.com','2025-06-07 15:30:00','Victoria','Green'),(88,'MythicMaven','2024-03-10','mrmaven@outlook.com','2025-06-02 20:00:00','Nicholas','Adams'),(89,'NoxiousNight','2024-03-15','nnite@yahoo.org','2025-06-07 10:15:00','Sofia','Baker'),(90,'OceanicOdin','2024-03-20','oiodin@game.org','2025-06-06 13:00:00','Gabriel','Nelson'),(91,'PhantomPhantom','2024-03-25','pphantom@gmail.com','2025-06-05 17:30:00','Elizabeth','Carter'),(92,'QuasarQuest','2024-04-01','qquest@outlook.com','2025-06-07 12:45:00','Jonathan','Mitchell'),(93,'RogueRider','2024-04-05','rrogue@yahoo.org','2025-06-04 15:30:00','Madison','Perez'),(94,'StellarSentinel','2024-04-10','ssentinel@game.org','2025-06-07 14:00:00','Caleb','Roberts'),(95,'TomeTreader','2024-04-15','ttreader@gmail.com','2025-06-03 09:00:00','Layla','Turner'),(96,'UndyingUrsula','2024-04-20','uursula@outlook.com','2025-06-07 11:15:00','Isaac','Phillips'),(97,'VividVoyage','2024-04-25','vvid@yahoo.org','2025-06-02 16:00:00','Zoe','Campbell'),(98,'WildWhisper','2024-05-01','wwisp@game.org','2025-06-07 08:45:00','Nathan','Parker'),(99,'XenialXylo','2024-05-05','xxylo@gmail.com','2025-06-06 10:00:00','Hannah','Evans'),(100,'YawningYogi','2024-05-10','yyogi@outlook.com','2025-06-05 13:00:00','Christian','Edwards');
/*!40000 ALTER TABLE `player` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `player_stat`
--

DROP TABLE IF EXISTS `player_stat`;
/*!50001 DROP VIEW IF EXISTS `player_stat`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `player_stat` AS SELECT 
 1 AS `username`,
 1 AS `character_name`,
 1 AS `level`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `player_stats`
--

DROP TABLE IF EXISTS `player_stats`;
/*!50001 DROP VIEW IF EXISTS `player_stats`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `player_stats` AS SELECT 
 1 AS `Username`,
 1 AS `Total Characters`,
 1 AS `Average Adventure Level`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `race`
--

DROP TABLE IF EXISTS `race`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `race` (
  `race_id` int unsigned NOT NULL AUTO_INCREMENT,
  `race_name` varchar(45) NOT NULL,
  `description` varchar(250) DEFAULT NULL,
  `size` varchar(45) NOT NULL,
  `speed` varchar(45) NOT NULL,
  PRIMARY KEY (`race_id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `race`
--

LOCK TABLES `race` WRITE;
/*!40000 ALTER TABLE `race` DISABLE KEYS */;
INSERT INTO `race` VALUES (51,'Human','Adaptable and ambitious, humans are the most common race in many worlds. They have a wide range of appearances and cultures.','Medium','30 ft'),(52,'Elf','Graceful and long-lived, elves are known for their affinity for magic and nature. They often live in secluded forests.','Medium','30 ft'),(53,'Dwarf','Stout and hardy, dwarves are skilled miners, artisans, and warriors. They value tradition and honor.','Medium','25 ft'),(54,'Halfling','Small and cheerful, halflings are known for their love of comfort, food, and good company. They often live in peaceful villages.','Small','25 ft'),(55,'Dragonborn','Dragonborn are humanoid creatures with draconic ancestry. They are proud and honorable, with a natural talent for combat.','Medium','30 ft'),(56,'Gnome','Small and energetic, gnomes are known for their curiosity, inventiveness, and love of jokes. They often live in hidden communities.','Small','25 ft'),(57,'Half-Elf','Half-elves inherit traits from both their elven and human parents, giving them a unique blend of adaptability and grace.','Medium','30 ft'),(58,'Half-Orc','Half-orcs inherit traits from both their orc and human parents, often resulting in great strength and a tendency towards impulsiveness.','Medium','30 ft'),(59,'Tiefling','Tieflings are humanoids with infernal ancestry, often mistrusted due to their devilish appearance.','Medium','30 ft'),(60,'Goblin','Small, green-skinned humanoids, known for their mischievous nature and tendency to live in tribes.','Small','25 ft'),(61,'Orc','Large, green-skinned humanoids, often barbaric and warlike, living in tribes or hordes.','Medium','30 ft'),(62,'Tabaxi','Feline humanoids, curious explorers, and gatherers of knowledge and exotic items.','Medium','30 ft'),(63,'Aarakocra','Avian humanoids with wings, native to the Elemental Plane of Air. They are swift and elusive.','Medium','25 ft (Fly 50 ft)'),(64,'Aasimar','Humanoids with celestial ancestry, often marked by divine power and an innate sense of justice.','Medium','30 ft'),(65,'Bugbear','Large, furry goblinoids known for their strength and ambushing tactics.','Medium','30 ft'),(66,'Changeling','Humanoids with the ability to change their appearance at will, masters of disguise and deception.','Medium','30 ft'),(67,'Drow (Dark Elf)','Subterranean elves with dark skin and white hair, often associated with cruelty and arcane power.','Medium','30 ft'),(68,'Firbolg','Large, gentle humanoids with an affinity for nature and often living in secluded forests.','Medium','30 ft'),(69,'Genasi (Air)','Humanoids infused with the power of the Elemental Plane of Air, often free-spirited and swift.','Medium','30 ft'),(70,'Genasi (Earth)','Humanoids infused with the power of the Elemental Plane of Earth, often stoic and resilient.','Medium','30 ft'),(71,'Genasi (Fire)','Humanoids infused with the power of the Elemental Plane of Fire, often passionate and destructive.','Medium','30 ft'),(72,'Genasi (Water)','Humanoids infused with the power of the Elemental Plane of Water, often calm and adaptable.','Medium','30 ft'),(73,'Goliath','Massive humanoids from mountainous regions, known for their strength, endurance, and tribal customs.','Medium','30 ft'),(74,'Kenku','Flightless, avian humanoids cursed with the inability to speak original thoughts, communicating through mimicry.','Medium','30 ft'),(75,'Kobold','Small, reptilian humanoids, often cunning and cowardly, known for their trap-making skills.','Small','30 ft'),(76,'Lizardfolk','Reptilian humanoids who dwell in swamps and jungles, known for their primal instincts and straightforward nature.','Medium','30 ft'),(77,'Triton','Amphibious humanoids native to the Elemental Plane of Water, often protectors of the seas.','Medium','30 ft (Swim 30 ft)'),(78,'Warforged','Sentient constructs built for war, now seeking purpose and identity in a world at peace.','Medium','30 ft'),(79,'Yuan-ti Pureblood','Humanoids with serpentine features, often cunning and emotionless, followers of ancient, dark gods.','Medium','30 ft'),(80,'Githyanki','Martial humanoids from the Astral Plane, known for their psionic abilities and hatred of mind flayers.','Medium','30 ft'),(81,'Githzerai','Monastic humanoids from Limbo, known for their discipline, psionic abilities, and philosophical insight.','Medium','30 ft'),(82,'Shifter','Humanoids with bestial traits, able to temporarily transform into a more monstrous form.','Medium','30 ft'),(83,'Grung','Small, amphibious humanoids from jungles, known for their poisonous skin and tribal hierarchy.','Small','25 ft (Climb 25 ft)'),(84,'Kalashtar','Humanoids born from the union of human and quori spirits, known for their psychic abilities and calm demeanor.','Medium','30 ft'),(85,'Loxodon','Large, elephant-like humanoids, known for their strength, wisdom, and serene nature.','Large','30 ft'),(86,'Minotaur','Large humanoids with bovine heads, known for their labyrinthine minds and powerful charges.','Medium','30 ft'),(87,'Leonin','Feline humanoids with a regal bearing, known for their pride, courage, and tribal bonds.','Medium','35 ft'),(88,'Satyr','Fey creatures with goat-like legs and horns, known for their revelry, music, and carefree spirits.','Medium','30 ft'),(89,'Simic Hybrid','Humanoids modified with animal adaptations by the Simic Combine, gaining various natural abilities.','Medium','30 ft'),(90,'Vedalken','Blue-skinned humanoids known for their intellect, logic, and pursuit of knowledge and perfection.','Medium','30 ft'),(91,'Owlin','Avian humanoids with owl-like features, known for their quiet flight and keen senses.','Medium','30 ft (Fly 30 ft)'),(92,'Dhampir','Humanoids with vampiric traits, capable of feeding on life force and possessing unnatural agility.','Medium','30 ft'),(93,'Fairy','Small fey creatures with wings, known for their mischievous nature and connection to magic.','Small','20 ft (Fly 30 ft)'),(94,'Harengon','Lagomorph humanoids, known for their quick movements, keen senses, and adventurous spirit.','Medium','30 ft'),(95,'Autognome','Small, sentient constructs built by gnomes, possessing mechanical bodies and a thirst for knowledge.','Small','25 ft'),(96,'Kender','Small, inquisitive humanoids, known for their boundless curiosity and tendency to \"borrow\" things.','Small','25 ft'),(97,'Centaur','Creatures with the upper body of a humanoid and the lower body of a horse, known for their strength and affinity for nature.','Large','40 ft'),(98,'Thri-kreen','Insectoid humanoids with four arms and chitinous exoskeletons, known for their telepathic communication and desert survival skills.','Medium','30 ft'),(99,'Tortle','Humanoids with turtle-like shells, known for their stoicism, natural armor, and wanderlust.','Medium','30 ft'),(100,'Giff','Hippopotamus-headed humanoids from the Astral Plane, known for their love of firearms and mercenary work.','Medium','30 ft');
/*!40000 ALTER TABLE `race` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `skill`
--

DROP TABLE IF EXISTS `skill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `skill` (
  `skill_id` int unsigned NOT NULL AUTO_INCREMENT,
  `skill_name` varchar(45) NOT NULL,
  `ability_modifier` varchar(45) NOT NULL,
  `description` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`skill_id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `skill`
--

LOCK TABLES `skill` WRITE;
/*!40000 ALTER TABLE `skill` DISABLE KEYS */;
INSERT INTO `skill` VALUES (19,'Acrobatics','Dexterity','Your ability to stay balanced, roll, and perform other feats of agility.'),(20,'Animal Handling','Wisdom','Your ability to calm, train, or ride animals.'),(21,'Arcana','Intelligence','Your knowledge of spells, magical items, ancient runes, and the planes of existence.'),(22,'Athletics','Strength','Your ability to climb, jump, and swim; also used for feats of brute force.'),(23,'Deception','Charisma','Your ability to hide the truth, mislead, or tell convincing lies.'),(24,'History','Intelligence','Your knowledge of historical events, ancient kingdoms, and famous people.'),(25,'Insight','Wisdom','Your ability to determine the true intentions of creatures.'),(26,'Intimidation','Charisma','Your ability to influence someone through overt threats, hostile actions, or physical violence.'),(27,'Investigation','Intelligence','Your ability to find clues and deduce information.'),(28,'Medicine','Wisdom','Your ability to stabilize a dying creature or diagnose an illness.'),(29,'Nature','Intelligence','Your knowledge of terrain, plants and animals, and natural cycles.'),(30,'Perception','Wisdom','Your ability to notice, hear, or otherwise detect the presence of something.'),(31,'Performance','Charisma','Your ability to delight an audience with music, dance, acting, or storytelling.'),(32,'Persuasion','Charisma','Your ability to influence someone through favors, honest argument, or charming overtures.'),(33,'Religion','Intelligence','Your knowledge of deities, rites and prayers, religious hierarchies, and holy symbols.'),(34,'Sleight of Hand','Dexterity','Your ability to pick pockets, plant something on someone, or conceal an object.'),(35,'Stealth','Dexterity','Your ability to conceal yourself, move silently, or avoid notice.'),(36,'Survival','Wisdom','Your ability to follow tracks, hunt wild game, guide your group through wastes, or identify signs that animals left behind.');
/*!40000 ALTER TABLE `skill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spell`
--

DROP TABLE IF EXISTS `spell`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `spell` (
  `spell_id` int unsigned NOT NULL AUTO_INCREMENT,
  `spell_name` varchar(45) NOT NULL,
  `level` varchar(45) NOT NULL,
  `school` varchar(45) NOT NULL,
  `casting_time` varchar(45) NOT NULL,
  `range` varchar(45) NOT NULL,
  `components` varchar(45) NOT NULL,
  `duration` varchar(45) NOT NULL,
  `description` varchar(350) DEFAULT NULL,
  PRIMARY KEY (`spell_id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spell`
--

LOCK TABLES `spell` WRITE;
/*!40000 ALTER TABLE `spell` DISABLE KEYS */;
INSERT INTO `spell` VALUES (51,'Fire Bolt','Cantrip','Evocation','1 Action','120 feet','V, S','Instantaneous','You hurl a mote of fire at a creature or object.'),(52,'Magic Missile','1st','Evocation','1 Action','120 feet','V, S','Instantaneous','You create three glowing darts of magical force.'),(53,'Sleep','1st','Enchantment','1 Action','90 feet','V, S, M','1 Minute','Creatures fall unconscious until the spell ends, they take damage, or someone uses an action to wake them.'),(54,'Healing Word','1st','Evocation','1 Bonus Action','60 feet','V','Instantaneous','A creature you choose within range regains hit points.'),(55,'Shield','1st','Abjuration','1 Reaction','Self','V, S','1 Round','An invisible barrier of magical force appears and protects you.'),(56,'Scorching Ray','2nd','Evocation','1 Action','120 feet','V, S','Instantaneous','You create three rays of fire and hurl them at targets within range.'),(57,'Sacred Flame','Cantrip','Evocation','1 Action','60 feet','V, S','Instantaneous','Flame-like radiance descends on a creature that you can see within range.'),(58,'Light','Cantrip','Evocation','1 Action','Touch','V, M','1 Hour','You touch one object that is no larger than 10 feet in any dimension.'),(59,'Burning Hands','1st','Evocation','1 Action','Self (15-foot cone)','V, S','Instantaneous','A burst of fire appears in your hands.'),(60,'Minor Illusion','Cantrip','Illusion','1 Action','30 feet','S, M','1 Minute','You create a sound or an image of an object within range that lasts for the duration.'),(61,'Guidance','Cantrip','Divination','1 Reaction','Touch','V, S','Concentration, up to 1 Minute','You touch one willing creature. Once before the spell ends, the target can roll a d4 and add the number rolled to one ability check of its choice.'),(62,'Acid Splash','Cantrip','Conjuration','1 Action','60 feet','V, S','Instantaneous','You hurl a bubble of corrosive acid.'),(63,'Ray of Frost','Cantrip','Evocation','1 Action','60 feet','V, S','Instantaneous','A frigid beam of blue-white light streaks toward a creature within range.'),(64,'Prestidigitation','Cantrip','Transmutation','1 Action','10 feet','V, S','1 Hour','You create one of the following magical effects: a harmless sensory effect, a clean/soil small object, an instant nonmagical trinket, etc.'),(65,'Shocking Grasp','Cantrip','Evocation','1 Action','Touch','V, S','Instantaneous','Lightning springs from your hand to deliver a shock to a creature you try to touch.'),(66,'Charm Person','1st','Enchantment','1 Action','30 feet','V, S','1 Hour','You attempt to charm a humanoid you can see within range.'),(67,'Disguise Self','1st','Illusion','1 Action','Self','V, S','1 Hour','You make yourself, including your clothing, armor, weapons, and other belongings on your person, look different until the spell ends or until you use your action to dismiss it.'),(68,'Faerie Fire','1st','Evocation','1 Action','60 feet','V, S, M','Concentration, up to 1 Minute','Each object in a 20-foot cube within range is outlined in blue, green, or violet light (your choice).'),(69,'Fog Cloud','1st','Conjuration','1 Action','120 feet','V, S','Concentration, up to 1 Hour','You create a 20-foot-radius sphere of fog centered on a point within range.'),(70,'Guiding Bolt','1st','Evocation','1 Action','120 feet','V, S','Instantaneous','A flash of light streaks toward a creature or object.'),(71,'Inflict Wounds','1st','Necromancy','1 Action','Touch','V, S','Instantaneous','You make a melee spell attack against a creature you can reach.'),(72,'Shield of Faith','1st','Abjuration','1 Bonus Action','60 feet','V, S, M','Concentration, up to 10 Minutes','A shimmering field of force appears around you and grants you a +2 bonus to AC for the duration.'),(73,'Thunderwave','1st','Evocation','1 Action','Self (15-foot cube)','V, S','Instantaneous','A wave of thunderous force sweeps out from you.'),(74,'Web','2nd','Conjuration','1 Action','60 feet','V, S, M','Concentration, up to 1 Hour','Nauseating, sticky strands of strong, ropy webbing fill a 20-foot cube within range.'),(75,'Darkness','2nd','Evocation','1 Action','60 feet','V, M','Concentration, up to 10 Minutes','Magical darkness spreads from a point you choose within range to fill a 15-foot-radius sphere.'),(76,'Hold Person','2nd','Enchantment','1 Action','60 feet','V, S, M','Concentration, up to 1 Minute','Choose a humanoid that you can see within range. The target must succeed on a Wisdom saving throw or be paralyzed for the duration.'),(77,'Invisibility','2nd','Illusion','1 Action','Touch','V, S, M','Concentration, up to 1 Hour','A creature you touch becomes invisible until the spell ends.'),(78,'Levitate','2nd','Transmutation','1 Action','60 feet','V, S, M','Concentration, up to 10 Minutes','One creature or loose object of your choice that you can see within range rises gently in the air.'),(79,'Misty Step','2nd','Conjuration','1 Bonus Action','30 feet','V','Instantaneous','Briefly surrounded by silvery mist, you teleport up to 30 feet to an unoccupied space that you can see.'),(80,'Spike Growth','2nd','Transmutation','1 Action','150 feet','V, S, M','Concentration, up to 10 Minutes','The ground in a 20-foot radius centered on a point within range becomes covered in hard, sharp spikes.'),(81,'Spiritual Weapon','2nd','Evocation','1 Bonus Action','60 feet','V, S','1 Minute','You create a floating, spectral weapon within range that lasts for the duration or until you cast this spell again.'),(82,'Suggestion','2nd','Enchantment','1 Action','30 feet','V, M','Concentration, up to 8 Hours','You suggest a course of activity to a creature, and magically influence it to follow the suggestion.'),(83,'Counterspell','3rd','Abjuration','1 Reaction','60 feet','S','Instantaneous','You attempt to interrupt a creature in the process of casting a spell.'),(84,'Fly','3rd','Transmutation','1 Action','Touch','V, S, M','Concentration, up to 10 Minutes','You touch a willing creature. The target gains a flying speed of 60 feet for the duration.'),(85,'Haste','3rd','Transmutation','1 Action','30 feet','V, S, M','Concentration, up to 1 Minute','Choose a willing creature that you can see within range. Until the spell ends, the target’s speed is doubled, it gains a +2 bonus to AC, it has advantage on Dexterity saving throws, and it gains an additional action on each of its turns.'),(86,'Lightning Bolt','3rd','Evocation','1 Action','Self (100-foot line)','V, S, M','Instantaneous','A stroke of lightning forming a line 100 feet long and 5 feet wide blasts out from you in a direction you choose.'),(87,'Remove Curse','3rd','Abjuration','1 Action','Touch','V, S','Instantaneous','At your touch, all curses affecting one creature or object are ended.'),(88,'Fear','3rd','Illusion','1 Action','Self (30-foot cone)','V, S, M','Concentration, up to 1 Minute','You project a phantasmal image of a creature’s dearest fears.'),(89,'Greater Invisibility','4th','Illusion','1 Action','Touch','V, S','Concentration, up to 1 Minute','You or a creature you touch becomes invisible until the spell ends.'),(90,'Ice Storm','4th','Evocation','1 Action','300 feet','V, S, M','Instantaneous','A hail of hard, cold stones and ice falls in a 20-foot-radius, 40-foot-high cylinder centered on a point within range.'),(91,'Wall of Fire','4th','Evocation','1 Action','120 feet','V, S, M','Concentration, up to 1 Minute','You create a shimmering wall of fire on a solid surface within range.'),(92,'Hold Monster','5th','Enchantment','1 Action','90 feet','V, S, M','Concentration, up to 1 Minute','Choose a creature that you can see within range. The target must succeed on a Wisdom saving throw or be paralyzed for the duration.'),(93,'Cone of Cold','5th','Evocation','1 Action','Self (60-foot cone)','V, S, M','Instantaneous','A blast of cold air erupts from your hands.'),(94,'Scrying','5th','Divination','10 Minutes','Self','V, S, M','Concentration, up to 10 Minutes','You can see and hear a particular creature or location.'),(95,'Chain Lightning','6th','Evocation','1 Action','150 feet','V, S, M','Instantaneous','You create a bolt of lightning that arcs toward a target of your choice within range.'),(96,'Circle of Death','6th','Necromancy','1 Action','150 feet','V, S, M','Instantaneous','A sphere of negative energy ripples out from a point within range.'),(97,'Disintegrate','6th','Transmutation','1 Action','60 feet','V, S, M','Instantaneous','A thin green ray springs from your pointing finger to a target that you can see within range.'),(98,'Globe of Invulnerability','6th','Abjuration','1 Action','Self (10-foot radius)','V, S, M','Concentration, up to 1 Minute','An immobile, impenetrable sphere of force springs into existence around you.'),(99,'Harm','6th','Necromancy','1 Action','60 feet','V, S','Instantaneous','You unleash a wave of negative energy.'),(100,'Mass Suggestion','6th','Enchantment','1 Action','60 feet','V, M','24 Hours','You affect up to twelve creatures of your choice within range, causing them to follow a suggestion.');
/*!40000 ALTER TABLE `spell` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'dnd_final_db'
--

--
-- Dumping routines for database 'dnd_final_db'
--

--
-- Final view structure for view `player_stat`
--

/*!50001 DROP VIEW IF EXISTS `player_stat`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `player_stat` AS select `p`.`username` AS `username`,`c`.`character_name` AS `character_name`,`c`.`level` AS `level` from (`player` `p` left join `character` `c` on((`p`.`player_id` = `c`.`player_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `player_stats`
--

/*!50001 DROP VIEW IF EXISTS `player_stats`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `player_stats` AS select `p`.`username` AS `Username`,count(distinct `c`.`character_id`) AS `Total Characters`,avg(`a`.`recommended_lvl_rng_max`) AS `Average Adventure Level` from (((`player` `p` left join `character` `c` on((`p`.`player_id` = `c`.`player_id`))) left join `adventure_character` `ac` on((`c`.`character_id` = `ac`.`character_id`))) left join `adventure` `a` on((`ac`.`adventure_id` = `a`.`adventure_id`))) group by `p`.`username` */;
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

-- Dump completed on 2025-07-18 17:25:15

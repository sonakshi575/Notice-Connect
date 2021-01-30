-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: noticeconnect.cgxsojoqvytk.us-east-2.rds.amazonaws.com    Database: NoticeConnect
-- ------------------------------------------------------
-- Server version	8.0.20

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
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;

--
-- GTID state at the beginning of the backup 
--

SET @@GLOBAL.GTID_PURGED=/*!80000 '+'*/ '';

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add Notice',7,'add_notice'),(26,'Can change Notice',7,'change_notice'),(27,'Can delete Notice',7,'delete_notice'),(28,'Can view Notice',7,'view_notice'),(29,'Can add Match',8,'add_match'),(30,'Can change Match',8,'change_match'),(31,'Can delete Match',8,'delete_match'),(32,'Can view Match',8,'view_match'),(33,'Can add Record',9,'add_record'),(34,'Can change Record',9,'change_record'),(35,'Can delete Record',9,'delete_record'),(36,'Can view Record',9,'view_record');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$216000$zrTx6PSJSVxH$aqPdGd6Zqxzsmvy0tvvkXklKizW5dqtoDZgmJpHYWic=','2021-01-28 23:37:57.930269',1,'admin','','','sonakshi.575@gmail.com',1,1,'2021-01-28 11:49:09.749700');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2021-01-28 16:28:32.239394','1','Jaime Sievers',1,'[{\"added\": {}}]',7,1),(2,'2021-01-28 16:30:14.640078','2','Brandon Carey',1,'[{\"added\": {}}]',7,1),(3,'2021-01-28 16:37:33.114415','3','Janiya Caldwell',1,'[{\"added\": {}}]',7,1),(4,'2021-01-28 16:38:35.377707','4','Maliya Kabs',1,'[{\"added\": {}}]',7,1),(5,'2021-01-28 16:39:16.593111','5','Tejay Kabs',1,'[{\"added\": {}}]',7,1),(6,'2021-01-29 20:57:31.659499','6','Notice object (6)',1,'[{\"added\": {}}]',7,1),(7,'2021-01-29 20:58:14.908615','7','Notice object (7)',1,'[{\"added\": {}}]',7,1),(8,'2021-01-29 20:58:58.182488','8','Notice object (8)',1,'[{\"added\": {}}]',7,1),(9,'2021-01-29 20:59:57.987140','9','Notice object (9)',1,'[{\"added\": {}}]',7,1),(10,'2021-01-29 21:00:54.668376','10','Notice object (10)',1,'[{\"added\": {}}]',7,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(8,'match','match'),(7,'notice','notice'),(9,'record','record'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2021-01-28 11:42:05.754185'),(2,'auth','0001_initial','2021-01-28 11:42:07.565858'),(3,'admin','0001_initial','2021-01-28 11:42:09.146003'),(4,'admin','0002_logentry_remove_auto_add','2021-01-28 11:42:09.456174'),(5,'admin','0003_logentry_add_action_flag_choices','2021-01-28 11:42:09.570163'),(6,'contenttypes','0002_remove_content_type_name','2021-01-28 11:42:10.016676'),(7,'auth','0002_alter_permission_name_max_length','2021-01-28 11:42:10.232154'),(8,'auth','0003_alter_user_email_max_length','2021-01-28 11:42:10.423007'),(9,'auth','0004_alter_user_username_opts','2021-01-28 11:42:10.543647'),(10,'auth','0005_alter_user_last_login_null','2021-01-28 11:42:10.745112'),(11,'auth','0006_require_contenttypes_0002','2021-01-28 11:42:10.843870'),(12,'auth','0007_alter_validators_add_error_messages','2021-01-28 11:42:10.943576'),(13,'auth','0008_alter_user_username_max_length','2021-01-28 11:42:11.140096'),(14,'auth','0009_alter_user_last_name_max_length','2021-01-28 11:42:11.363747'),(15,'auth','0010_alter_group_name_max_length','2021-01-28 11:42:11.547515'),(16,'auth','0011_update_proxy_permissions','2021-01-28 11:42:11.797131'),(17,'auth','0012_alter_user_first_name_max_length','2021-01-28 11:42:12.010550'),(18,'record','0001_initial','2021-01-28 11:42:12.469268'),(19,'notice','0001_initial','2021-01-28 11:42:12.978053'),(20,'match','0001_initial','2021-01-28 11:42:13.329480'),(21,'sessions','0001_initial','2021-01-28 11:42:13.845060'),(22,'notice','0002_auto_20210128_1135','2021-01-28 16:35:29.414851');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('okmcv4f8cq50cdo40i1rmprmcadnt82b','.eJxVjDsOwjAQRO_iGlk48ZeSnjNY6_UuDiBbipMKcXcSKQWUM-_NvEWEdSlx7TTHKYuLUOL02yXAJ9Ud5AfUe5PY6jJPSe6KPGiXt5bpdT3cv4MCvWxrHUAjDYqMAvZMPtjx7HFMxrgBNLmgkSmxQUMKfQZmO6K1DjnoLYrPF_i7OOE:1l5GrO:L4l-tqlRS7RiAgk6wvGzuCRH_7L-uadp7KfLSoF4NUg','2021-02-11 23:37:58.070074'),('rx9m4c1p7dp8mnr1a8jpbrfjq70ac5o6','.eJxVjDsOwjAQRO_iGlk48ZeSnjNY6_UuDiBbipMKcXcSKQWUM-_NvEWEdSlx7TTHKYuLUOL02yXAJ9Ud5AfUe5PY6jJPSe6KPGiXt5bpdT3cv4MCvWxrHUAjDYqMAvZMPtjx7HFMxrgBNLmgkSmxQUMKfQZmO6K1DjnoLYrPF_i7OOE:1l5C4o:VYKyuv7qnyhIHk_pCM5tO9APiMo67d1Nq9c_9JuzTrU','2021-02-11 18:31:30.289926');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblmatch`
--

DROP TABLE IF EXISTS `tblmatch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tblmatch` (
  `match_id` int NOT NULL AUTO_INCREMENT,
  `match_type` varchar(25) NOT NULL,
  `notice_id` int NOT NULL,
  `record_id` int NOT NULL,
  PRIMARY KEY (`match_id`),
  KEY `tblmatch_notice_id_2f873973_fk_tblnotice_notice_id` (`notice_id`),
  KEY `tblmatch_record_id_5bfef188_fk_tblrecord_record_id` (`record_id`),
  CONSTRAINT `tblmatch_notice_id_2f873973_fk_tblnotice_notice_id` FOREIGN KEY (`notice_id`) REFERENCES `tblnotice` (`notice_id`),
  CONSTRAINT `tblmatch_record_id_5bfef188_fk_tblrecord_record_id` FOREIGN KEY (`record_id`) REFERENCES `tblrecord` (`record_id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblmatch`
--

LOCK TABLES `tblmatch` WRITE;
/*!40000 ALTER TABLE `tblmatch` DISABLE KEYS */;
INSERT INTO `tblmatch` VALUES (2,'Weak Match',2,15),(5,'Possible Match',3,21),(14,'Possible Match',4,34),(27,'Possible Match',5,54);
/*!40000 ALTER TABLE `tblmatch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblnotice`
--

DROP TABLE IF EXISTS `tblnotice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tblnotice` (
  `notice_id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `alt_first_name` varchar(255) DEFAULT NULL,
  `alt_last_name` varchar(255) DEFAULT NULL,
  `province` varchar(50) NOT NULL,
  `date_of_birth` date DEFAULT NULL,
  PRIMARY KEY (`notice_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblnotice`
--

LOCK TABLES `tblnotice` WRITE;
/*!40000 ALTER TABLE `tblnotice` DISABLE KEYS */;
INSERT INTO `tblnotice` VALUES (1,'Jaime','Sievers','Jaime','S','Ontario','1991-10-06'),(2,'Brandon','Carey','Brian','Carey','Quebec','2001-01-25'),(3,'Janiya','Caldwell','Jan',NULL,'British Columbia','1985-08-11'),(4,'Maliya','Kabs','Mali','K','Saskatchewan','1878-11-18'),(5,'Tejay','Kabs',NULL,NULL,'Ontario','1876-05-05'),(6,'Nettie','Gibbson','Nat','Gibbs','Quebec','1999-01-07'),(7,'Joey','James','Joe','James','Ontario','1967-02-05'),(9,'Malaki','Beard',NULL,NULL,'Saskatchewan','1878-04-01'),(10,'Samira','Rogers','Sam',NULL,'Quebec','2019-07-09');
/*!40000 ALTER TABLE `tblnotice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblrecord`
--

DROP TABLE IF EXISTS `tblrecord`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tblrecord` (
  `record_id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `province` varchar(50) NOT NULL,
  `date_of_birth` date DEFAULT NULL,
  PRIMARY KEY (`record_id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblrecord`
--

LOCK TABLES `tblrecord` WRITE;
/*!40000 ALTER TABLE `tblrecord` DISABLE KEYS */;
INSERT INTO `tblrecord` VALUES (2,'Anne','Jackson','Quebec','1993-05-04'),(7,'Anny','Hathway','Ontario',NULL),(8,'Sam','Plati','Ontario',NULL),(10,'Jaime','S','Ontario','1991-10-06'),(15,'Brandon','Carey','Quebec','1991-10-06'),(18,'Solemun','Willam','Quebec','1989-10-06'),(21,'Janiya','Caldwell','British Columbia','1985-11-08'),(34,'Maliya','Kabs','Saskatchewan','1878-05-05'),(41,'Vick','Fisher','Saskatchewan','2001-02-04'),(42,'Nat','Gibbson','Ontario','2021-01-25'),(54,'Tejay','Kabs','Ontario','2021-01-31');
/*!40000 ALTER TABLE `tblrecord` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'NoticeConnect'
--

--
-- Dumping routines for database 'NoticeConnect'
--
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-01-29 20:47:11

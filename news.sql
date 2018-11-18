-- MySQL dump 10.13  Distrib 5.7.21, for macos10.13 (x86_64)
--
-- Host: localhost    Database: linker
-- ------------------------------------------------------
-- Server version	5.7.21

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add content type',4,'add_contenttype'),(14,'Can change content type',4,'change_contenttype'),(15,'Can delete content type',4,'delete_contenttype'),(16,'Can view content type',4,'view_contenttype'),(17,'Can add session',5,'add_session'),(18,'Can change session',5,'change_session'),(19,'Can delete session',5,'delete_session'),(20,'Can view session',5,'view_session'),(21,'Can add cors model',6,'add_corsmodel'),(22,'Can change cors model',6,'change_corsmodel'),(23,'Can delete cors model',6,'delete_corsmodel'),(24,'Can view cors model',6,'view_corsmodel'),(25,'Can add card',7,'add_card'),(26,'Can change card',7,'change_card'),(27,'Can delete card',7,'delete_card'),(28,'Can view card',7,'view_card'),(29,'Can add comment',8,'add_comment'),(30,'Can change comment',8,'change_comment'),(31,'Can delete comment',8,'delete_comment'),(32,'Can view comment',8,'view_comment'),(33,'Can add tag',9,'add_tag'),(34,'Can change tag',9,'change_tag'),(35,'Can delete tag',9,'delete_tag'),(36,'Can view tag',9,'view_tag'),(37,'Can add user',10,'add_user'),(38,'Can change user',10,'change_user'),(39,'Can delete user',10,'delete_user'),(40,'Can view user',10,'view_user'),(41,'Can add profile',11,'add_profile'),(42,'Can change profile',11,'change_profile'),(43,'Can delete profile',11,'delete_profile'),(44,'Can view profile',11,'view_profile');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authentication_user`
--

DROP TABLE IF EXISTS `authentication_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `authentication_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authentication_user`
--

LOCK TABLES `authentication_user` WRITE;
/*!40000 ALTER TABLE `authentication_user` DISABLE KEYS */;
INSERT INTO `authentication_user` VALUES (1,'pbkdf2_sha256$120000$0N1WYWBjl9vf$EexgmDA9RfbI3vFipkdTulgVQ7Sp/R05qzkkJ/lEemo=',NULL,0,'2018-11-17 11:30:05.451156','2018-11-17 11:57:26.475758','hello','hello2@123.com',1,0),(2,'pbkdf2_sha256$120000$zck5C9VAazeZ$eqsggAlBj9q4mn7kDM8WbkpYz4Y9Ve9yCKDoNjce8Ic=',NULL,0,'2018-11-17 12:09:02.417376','2018-11-17 12:09:02.417414','test','test@test.com',1,0);
/*!40000 ALTER TABLE `authentication_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authentication_user_groups`
--

DROP TABLE IF EXISTS `authentication_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `authentication_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `authentication_user_groups_user_id_group_id_8af031ac_uniq` (`user_id`,`group_id`),
  KEY `authentication_user_groups_group_id_6b5c44b7_fk_auth_group_id` (`group_id`),
  CONSTRAINT `authentication_user__user_id_30868577_fk_authentic` FOREIGN KEY (`user_id`) REFERENCES `authentication_user` (`id`),
  CONSTRAINT `authentication_user_groups_group_id_6b5c44b7_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authentication_user_groups`
--

LOCK TABLES `authentication_user_groups` WRITE;
/*!40000 ALTER TABLE `authentication_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `authentication_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authentication_user_user_permissions`
--

DROP TABLE IF EXISTS `authentication_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `authentication_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `authentication_user_user_user_id_permission_id_ec51b09f_uniq` (`user_id`,`permission_id`),
  KEY `authentication_user__permission_id_ea6be19a_fk_auth_perm` (`permission_id`),
  CONSTRAINT `authentication_user__permission_id_ea6be19a_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `authentication_user__user_id_736ebf7e_fk_authentic` FOREIGN KEY (`user_id`) REFERENCES `authentication_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authentication_user_user_permissions`
--

LOCK TABLES `authentication_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `authentication_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `authentication_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cards_card`
--

DROP TABLE IF EXISTS `cards_card`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cards_card` (
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `uuid` char(32) NOT NULL,
  `description` longtext NOT NULL,
  `body` varchar(200) NOT NULL,
  `author_id` int(11) NOT NULL,
  PRIMARY KEY (`uuid`),
  KEY `cards_card_author_id_9ce326bc_fk_profiles_profile_id` (`author_id`),
  CONSTRAINT `cards_card_author_id_9ce326bc_fk_profiles_profile_id` FOREIGN KEY (`author_id`) REFERENCES `profiles_profile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cards_card`
--

LOCK TABLES `cards_card` WRITE;
/*!40000 ALTER TABLE `cards_card` DISABLE KEYS */;
INSERT INTO `cards_card` VALUES ('2018-11-17 11:59:07.792750','2018-11-17 11:59:07.792784','06373de565e941b2b7da315e1e32295e','Ever wonder how?','http://linkerwgb.oss-cn-hangzhou.aliyuncs.com/123.jpg',1),('2018-11-17 14:25:29.589585','2018-11-17 14:25:29.589619','94768422a5484bb3906226670d9dd931','测试','http://linkerwgb.oss-cn-hangzhou.aliyuncs.com/123.jpg',2),('2018-11-17 11:46:52.745790','2018-11-17 12:03:43.795155','a88c824c88694ed4a22b66941b4442c5','Ever wonder how?','http://linkerwgb.oss-cn-hangzhou.aliyuncs.com/123.jpg',1),('2018-11-17 11:44:47.039760','2018-11-17 11:44:47.039800','ad1592360fda4beca34a50f834b8471b','Ever wonder how?','http://linkerwgb.oss-cn-hangzhou.aliyuncs.com/123.jpg',1);
/*!40000 ALTER TABLE `cards_card` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cards_card_tags`
--

DROP TABLE IF EXISTS `cards_card_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cards_card_tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `card_id` char(32) NOT NULL,
  `tag_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cards_card_tags_card_id_tag_id_b0949e1b_uniq` (`card_id`,`tag_id`),
  KEY `cards_card_tags_tag_id_6938ebf6_fk_cards_tag_id` (`tag_id`),
  CONSTRAINT `cards_card_tags_card_id_0f843644_fk_cards_card_uuid` FOREIGN KEY (`card_id`) REFERENCES `cards_card` (`uuid`),
  CONSTRAINT `cards_card_tags_tag_id_6938ebf6_fk_cards_tag_id` FOREIGN KEY (`tag_id`) REFERENCES `cards_tag` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cards_card_tags`
--

LOCK TABLES `cards_card_tags` WRITE;
/*!40000 ALTER TABLE `cards_card_tags` DISABLE KEYS */;
INSERT INTO `cards_card_tags` VALUES (5,'06373de565e941b2b7da315e1e32295e',1),(6,'06373de565e941b2b7da315e1e32295e',2),(7,'94768422a5484bb3906226670d9dd931',3),(8,'94768422a5484bb3906226670d9dd931',4),(3,'a88c824c88694ed4a22b66941b4442c5',1),(4,'a88c824c88694ed4a22b66941b4442c5',2),(1,'ad1592360fda4beca34a50f834b8471b',1),(2,'ad1592360fda4beca34a50f834b8471b',2);
/*!40000 ALTER TABLE `cards_card_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cards_comment`
--

DROP TABLE IF EXISTS `cards_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cards_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `body` longtext NOT NULL,
  `author_id` int(11) NOT NULL,
  `card_id` char(32) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cards_comment_author_id_98c2d335_fk_profiles_profile_id` (`author_id`),
  KEY `cards_comment_card_id_c2d03433_fk_cards_card_uuid` (`card_id`),
  CONSTRAINT `cards_comment_author_id_98c2d335_fk_profiles_profile_id` FOREIGN KEY (`author_id`) REFERENCES `profiles_profile` (`id`),
  CONSTRAINT `cards_comment_card_id_c2d03433_fk_cards_card_uuid` FOREIGN KEY (`card_id`) REFERENCES `cards_card` (`uuid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cards_comment`
--

LOCK TABLES `cards_comment` WRITE;
/*!40000 ALTER TABLE `cards_comment` DISABLE KEYS */;
INSERT INTO `cards_comment` VALUES (3,'2018-11-17 14:28:20.348791','2018-11-17 14:28:20.348830','just test it',2,'06373de565e941b2b7da315e1e32295e');
/*!40000 ALTER TABLE `cards_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cards_tag`
--

DROP TABLE IF EXISTS `cards_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cards_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `tag` varchar(255) NOT NULL,
  `slug` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cards_tag`
--

LOCK TABLES `cards_tag` WRITE;
/*!40000 ALTER TABLE `cards_tag` DISABLE KEYS */;
INSERT INTO `cards_tag` VALUES (1,'2018-11-17 11:44:07.202393','2018-11-17 11:44:07.202441','dragons','dragons'),(2,'2018-11-17 11:44:07.207037','2018-11-17 11:44:07.207081','training','training'),(3,'2018-11-17 14:25:29.582347','2018-11-17 14:25:29.582387','test','test'),(4,'2018-11-17 14:25:29.588100','2018-11-17 14:25:29.588137','fuck','fuck');
/*!40000 ALTER TABLE `cards_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_authentication_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_authentication_user_id` FOREIGN KEY (`user_id`) REFERENCES `authentication_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(10,'authentication','user'),(7,'cards','card'),(8,'cards','comment'),(9,'cards','tag'),(4,'contenttypes','contenttype'),(6,'corsheaders','corsmodel'),(11,'profiles','profile'),(5,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2018-11-17 11:27:23.595986'),(2,'contenttypes','0002_remove_content_type_name','2018-11-17 11:27:23.674722'),(3,'auth','0001_initial','2018-11-17 11:27:23.913173'),(4,'auth','0002_alter_permission_name_max_length','2018-11-17 11:27:23.945614'),(5,'auth','0003_alter_user_email_max_length','2018-11-17 11:27:23.952381'),(6,'auth','0004_alter_user_username_opts','2018-11-17 11:27:23.959572'),(7,'auth','0005_alter_user_last_login_null','2018-11-17 11:27:23.966049'),(8,'auth','0006_require_contenttypes_0002','2018-11-17 11:27:23.968069'),(9,'auth','0007_alter_validators_add_error_messages','2018-11-17 11:27:23.974322'),(10,'auth','0008_alter_user_username_max_length','2018-11-17 11:27:23.981029'),(11,'auth','0009_alter_user_last_name_max_length','2018-11-17 11:27:23.989617'),(12,'authentication','0001_initial','2018-11-17 11:27:24.207014'),(13,'admin','0001_initial','2018-11-17 11:27:24.301980'),(14,'admin','0002_logentry_remove_auto_add','2018-11-17 11:27:24.312057'),(15,'admin','0003_logentry_add_action_flag_choices','2018-11-17 11:27:24.323760'),(16,'profiles','0001_initial','2018-11-17 11:27:24.380619'),(17,'cards','0001_initial','2018-11-17 11:27:24.641711'),(18,'sessions','0001_initial','2018-11-17 11:27:24.685956'),(19,'profiles','0002_auto_20181117_1146','2018-11-17 11:46:28.749500');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profiles_profile`
--

DROP TABLE IF EXISTS `profiles_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profiles_profile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `bio` longtext NOT NULL,
  `image` varchar(200) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `profiles_profile_user_id_a3e81f91_fk_authentication_user_id` FOREIGN KEY (`user_id`) REFERENCES `authentication_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profiles_profile`
--

LOCK TABLES `profiles_profile` WRITE;
/*!40000 ALTER TABLE `profiles_profile` DISABLE KEYS */;
INSERT INTO `profiles_profile` VALUES (1,'2018-11-17 11:30:05.457160','2018-11-17 11:57:26.478914','I like memeda','',1),(2,'2018-11-17 12:09:02.424592','2018-11-17 12:09:02.424634','','',2);
/*!40000 ALTER TABLE `profiles_profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profiles_profile_favorites`
--

DROP TABLE IF EXISTS `profiles_profile_favorites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profiles_profile_favorites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `profile_id` int(11) NOT NULL,
  `card_id` char(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `profiles_profile_favorites_profile_id_card_id_cf551f2f_uniq` (`profile_id`,`card_id`),
  KEY `profiles_profile_favorites_card_id_756b9de3_fk_cards_card_uuid` (`card_id`),
  CONSTRAINT `profiles_profile_fav_profile_id_261051d8_fk_profiles_` FOREIGN KEY (`profile_id`) REFERENCES `profiles_profile` (`id`),
  CONSTRAINT `profiles_profile_favorites_card_id_756b9de3_fk_cards_card_uuid` FOREIGN KEY (`card_id`) REFERENCES `cards_card` (`uuid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profiles_profile_favorites`
--

LOCK TABLES `profiles_profile_favorites` WRITE;
/*!40000 ALTER TABLE `profiles_profile_favorites` DISABLE KEYS */;
/*!40000 ALTER TABLE `profiles_profile_favorites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profiles_profile_follows`
--

DROP TABLE IF EXISTS `profiles_profile_follows`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profiles_profile_follows` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `from_profile_id` int(11) NOT NULL,
  `to_profile_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `profiles_profile_follows_from_profile_id_to_profi_45d55f0f_uniq` (`from_profile_id`,`to_profile_id`),
  KEY `profiles_profile_fol_to_profile_id_8fcf6d8b_fk_profiles_` (`to_profile_id`),
  CONSTRAINT `profiles_profile_fol_from_profile_id_c435a47c_fk_profiles_` FOREIGN KEY (`from_profile_id`) REFERENCES `profiles_profile` (`id`),
  CONSTRAINT `profiles_profile_fol_to_profile_id_8fcf6d8b_fk_profiles_` FOREIGN KEY (`to_profile_id`) REFERENCES `profiles_profile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profiles_profile_follows`
--

LOCK TABLES `profiles_profile_follows` WRITE;
/*!40000 ALTER TABLE `profiles_profile_follows` DISABLE KEYS */;
INSERT INTO `profiles_profile_follows` VALUES (2,1,2),(1,2,1);
/*!40000 ALTER TABLE `profiles_profile_follows` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-11-18 19:05:04

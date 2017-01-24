-- MySQL dump 10.13  Distrib 5.7.12, for osx10.9 (x86_64)
--
-- Host: localhost    Database: beltreview
-- ------------------------------------------------------
-- Server version	5.6.33

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
  UNIQUE KEY `auth_group_permissions_group_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
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
  UNIQUE KEY `auth_permission_content_type_id_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permissi_content_type_id_2f476e4b_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add author',1,'add_author'),(2,'Can change author',1,'change_author'),(3,'Can delete author',1,'delete_author'),(4,'Can add book',2,'add_book'),(5,'Can change book',2,'change_book'),(6,'Can delete book',2,'delete_book'),(7,'Can add review',3,'add_review'),(8,'Can change review',3,'change_review'),(9,'Can delete review',3,'delete_review'),(10,'Can add user',4,'add_user'),(11,'Can change user',4,'change_user'),(12,'Can delete user',4,'delete_user'),(13,'Can add log entry',5,'add_logentry'),(14,'Can change log entry',5,'change_logentry'),(15,'Can delete log entry',5,'delete_logentry'),(16,'Can add permission',6,'add_permission'),(17,'Can change permission',6,'change_permission'),(18,'Can delete permission',6,'delete_permission'),(19,'Can add user',7,'add_user'),(20,'Can change user',7,'change_user'),(21,'Can delete user',7,'delete_user'),(22,'Can add group',8,'add_group'),(23,'Can change group',8,'change_group'),(24,'Can delete group',8,'delete_group'),(25,'Can add content type',9,'add_contenttype'),(26,'Can change content type',9,'change_contenttype'),(27,'Can delete content type',9,'delete_contenttype'),(28,'Can add session',10,'add_session'),(29,'Can change session',10,'change_session'),(30,'Can delete session',10,'delete_session');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_perm_permission_id_1fbb5f2c_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_user_user_perm_permission_id_1fbb5f2c_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `belt_review_author`
--

DROP TABLE IF EXISTS `belt_review_author`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `belt_review_author` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `author_name` varchar(255) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `author_by_user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `belt_review_au_author_by_user_id_58c41d16_fk_belt_review_user_id` (`author_by_user_id`),
  CONSTRAINT `belt_review_au_author_by_user_id_58c41d16_fk_belt_review_user_id` FOREIGN KEY (`author_by_user_id`) REFERENCES `belt_review_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `belt_review_author`
--

LOCK TABLES `belt_review_author` WRITE;
/*!40000 ALTER TABLE `belt_review_author` DISABLE KEYS */;
INSERT INTO `belt_review_author` VALUES (1,'Amazing Author','2017-01-24 01:57:44.822985','2017-01-24 01:57:44.823026',2),(2,'Awesome Author','2017-01-24 01:58:40.427512','2017-01-24 01:58:40.427603',2),(3,'Amazing Author','2017-01-24 01:59:15.703883','2017-01-24 01:59:15.703919',2),(4,'Amazing Author','2017-01-24 02:01:10.132119','2017-01-24 02:01:10.132155',2),(5,'Amazing Author','2017-01-24 02:01:39.701695','2017-01-24 02:01:39.701734',2),(6,'Robert Cecil Martin','2017-01-24 02:03:30.269131','2017-01-24 02:03:30.269166',2),(7,'Michael Weitzman','2017-01-24 02:04:03.603782','2017-01-24 02:04:03.603818',2),(8,'Martin','2017-01-24 04:00:55.888534','2017-01-24 04:00:55.888587',3),(9,'Paulo Cohelo','2017-01-24 05:08:23.638292','2017-01-24 05:08:23.638334',2);
/*!40000 ALTER TABLE `belt_review_author` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `belt_review_author_books`
--

DROP TABLE IF EXISTS `belt_review_author_books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `belt_review_author_books` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `author_id` int(11) NOT NULL,
  `book_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `belt_review_author_books_author_id_64545b7f_uniq` (`author_id`,`book_id`),
  KEY `belt_review_author_books_book_id_cc5afd51_fk_belt_review_book_id` (`book_id`),
  CONSTRAINT `belt_review_author_b_author_id_4f5216c4_fk_belt_review_author_id` FOREIGN KEY (`author_id`) REFERENCES `belt_review_author` (`id`),
  CONSTRAINT `belt_review_author_books_book_id_cc5afd51_fk_belt_review_book_id` FOREIGN KEY (`book_id`) REFERENCES `belt_review_book` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `belt_review_author_books`
--

LOCK TABLES `belt_review_author_books` WRITE;
/*!40000 ALTER TABLE `belt_review_author_books` DISABLE KEYS */;
INSERT INTO `belt_review_author_books` VALUES (1,1,1),(2,2,2),(3,5,5),(4,6,6),(7,6,9),(5,7,7),(6,7,8),(8,8,10),(9,9,11);
/*!40000 ALTER TABLE `belt_review_author_books` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `belt_review_book`
--

DROP TABLE IF EXISTS `belt_review_book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `belt_review_book` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `book_by_user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `belt_review_book_book_by_user_id_30260ad0_fk_belt_review_user_id` (`book_by_user_id`),
  CONSTRAINT `belt_review_book_book_by_user_id_30260ad0_fk_belt_review_user_id` FOREIGN KEY (`book_by_user_id`) REFERENCES `belt_review_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `belt_review_book`
--

LOCK TABLES `belt_review_book` WRITE;
/*!40000 ALTER TABLE `belt_review_book` DISABLE KEYS */;
INSERT INTO `belt_review_book` VALUES (1,'Goodnight Moon','2017-01-24 01:57:44.814341','2017-01-24 01:57:44.814394',2),(2,'Goodnight Moon','2017-01-24 01:58:40.418959','2017-01-24 01:58:40.418997',2),(3,'Goodnight Moon','2017-01-24 01:59:15.696322','2017-01-24 01:59:15.696361',2),(4,'Goodnight Moon','2017-01-24 02:01:10.124239','2017-01-24 02:01:10.124276',2),(5,'Goodnight Moon','2017-01-24 02:01:39.693167','2017-01-24 02:01:39.693206',2),(6,'Clean Code','2017-01-24 02:03:30.263633','2017-01-24 02:03:30.263667',2),(7,'I love Coding','2017-01-24 02:04:03.595618','2017-01-24 02:04:03.595654',2),(8,'New Amazing Book','2017-01-24 03:22:17.940321','2017-01-24 03:22:17.940360',2),(9,'New Book By Robert Existing','2017-01-24 03:22:47.751126','2017-01-24 03:22:47.751177',2),(10,'Algorithms, The Coding Dojo Edition','2017-01-24 04:00:55.880922','2017-01-24 04:00:55.880956',3),(11,'The Alchemist','2017-01-24 05:08:23.630144','2017-01-24 05:08:23.630183',2);
/*!40000 ALTER TABLE `belt_review_book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `belt_review_review`
--

DROP TABLE IF EXISTS `belt_review_review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `belt_review_review` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `review_text` longtext NOT NULL,
  `review_rating` int(11) NOT NULL,
  `review_by_id` int(11) NOT NULL,
  `review_for_book_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `belt_review_review_review_by_id_4e561239_fk_belt_review_user_id` (`review_by_id`),
  KEY `belt_review_r_review_for_book_id_68190582_fk_belt_review_book_id` (`review_for_book_id`),
  CONSTRAINT `belt_review_r_review_for_book_id_68190582_fk_belt_review_book_id` FOREIGN KEY (`review_for_book_id`) REFERENCES `belt_review_book` (`id`),
  CONSTRAINT `belt_review_review_review_by_id_4e561239_fk_belt_review_user_id` FOREIGN KEY (`review_by_id`) REFERENCES `belt_review_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `belt_review_review`
--

LOCK TABLES `belt_review_review` WRITE;
/*!40000 ALTER TABLE `belt_review_review` DISABLE KEYS */;
INSERT INTO `belt_review_review` VALUES (1,'This is a test review',1,2,5),(2,'Awesome Book!',1,2,6),(3,'Test!',1,2,7),(6,'test',1,2,8),(8,'Really challenging book of algorithms, wish it also came with solutions though!',4,3,10),(10,'Amazing book about taking life\'s great journey',5,2,11),(11,'This is a great book!!!',3,6,11);
/*!40000 ALTER TABLE `belt_review_review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `belt_review_user`
--

DROP TABLE IF EXISTS `belt_review_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `belt_review_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `birth_date` date DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `belt_review_user`
--

LOCK TABLES `belt_review_user` WRITE;
/*!40000 ALTER TABLE `belt_review_user` DISABLE KEYS */;
INSERT INTO `belt_review_user` VALUES (1,'Michael','Weitzman','$2b$12$tj.KFfdIaAkZUBCNGPiQFO1SbcaNxQXH3mf3IcH6vq4Mh1UISMU4u','mw@worldsourcetech.com',NULL,'2017-01-24 01:25:41.498277','2017-01-24 01:25:41.498356'),(2,'Michael','Weitzman','$2b$12$nHAfkku4SL2nxr8gkykhtuvKEtmG4aNUCf/aota6I3.TAGBYb6q1.','michaelj.weitzman@gmail.com',NULL,'2017-01-24 01:53:08.628028','2017-01-24 01:53:08.628076'),(3,'Jessica','Simpson','$2b$12$SKo0GWCKzuwg60wzNl2L4.ahEXvGg3uhp2XKeolzYRjdCeEE55ejG','jsimp@gmail.com',NULL,'2017-01-24 04:00:08.836585','2017-01-24 04:00:08.836627'),(4,'matthew','wilkinson879034890743','$2b$12$Z0HksPd82H4rhX0tbM49puIdSjMXSvWHu5Wf1Fg7qEYqKHUVs96dm','james456@gmail.co7889m',NULL,'2017-01-24 05:14:21.223393','2017-01-24 05:14:21.223434'),(5,'','','$2b$12$N14TE7BhQXBo4A38xjRnYe2QeWBCSWp9dSp2s0VTbOpQ7CCbL7Cie','james456@gmail.zxxzx',NULL,'2017-01-24 05:15:11.178548','2017-01-24 05:15:11.178589'),(6,'','','$2b$12$ZoxrGBV0dLaENEoJJWYSpOhUqpIGB89bW/6Nlasy873CFJRrxpYBO','james456@gmail.com',NULL,'2017-01-24 05:15:38.829101','2017-01-24 05:15:38.829142'),(7,'Matthew','Wilkinson','$2b$12$lkEWK/sxy9Z4qSo2gm5Iyui5lq2bYlgJKVSHlcmVnTb22I7ThouiG','wilkinson.matthew@gmail.com',NULL,'2017-01-24 05:18:21.996815','2017-01-24 05:18:21.996855');
/*!40000 ALTER TABLE `belt_review_user` ENABLE KEYS */;
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
  KEY `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
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
  UNIQUE KEY `django_content_type_app_label_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (5,'admin','logentry'),(8,'auth','group'),(6,'auth','permission'),(7,'auth','user'),(1,'belt_review','author'),(2,'belt_review','book'),(3,'belt_review','review'),(4,'belt_review','user'),(9,'contenttypes','contenttype'),(10,'sessions','session');
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
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2017-01-24 01:06:13.034596'),(2,'auth','0001_initial','2017-01-24 01:06:13.378377'),(3,'admin','0001_initial','2017-01-24 01:06:13.452193'),(4,'admin','0002_logentry_remove_auto_add','2017-01-24 01:06:13.491811'),(5,'contenttypes','0002_remove_content_type_name','2017-01-24 01:06:13.573535'),(6,'auth','0002_alter_permission_name_max_length','2017-01-24 01:06:13.604263'),(7,'auth','0003_alter_user_email_max_length','2017-01-24 01:06:13.636862'),(8,'auth','0004_alter_user_username_opts','2017-01-24 01:06:13.650347'),(9,'auth','0005_alter_user_last_login_null','2017-01-24 01:06:13.681804'),(10,'auth','0006_require_contenttypes_0002','2017-01-24 01:06:13.684194'),(11,'auth','0007_alter_validators_add_error_messages','2017-01-24 01:06:13.696250'),(12,'auth','0008_alter_user_username_max_length','2017-01-24 01:06:13.727936'),(13,'belt_review','0001_initial','2017-01-24 01:06:14.128875'),(14,'sessions','0001_initial','2017-01-24 01:06:14.164925'),(15,'belt_review','0002_auto_20170124_0152','2017-01-24 01:52:48.415283'),(16,'belt_review','0003_auto_20170124_0451','2017-01-24 04:51:07.614543');
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
  KEY `django_session_de54fa62` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('4gh2jmqu1l6u15gd1hkp2ix8p63ym2hk','MDQwMGMzNGY0MmQ2ZTg0OWI2NTc1M2YyZTQzYTkwMzIwN2Q4ZGYwZTp7ImZpcnN0X25hbWUiOiJNaWNoYWVsIiwibG9nZ2VkSW4iOnRydWUsInVzZXJfaWQiOjF9','2017-02-07 01:25:41.815544'),('xl9pil062isfr900iqz8pjp2rntt7o0q','MGE5NjBmYjZmYTI3M2VkZmE5MGZjOGRmMjZmZjk2MzRjODQ1NTU3Yjp7ImZpcnN0X25hbWUiOiJNaWNoYWVsIiwibG9nZ2VkSW4iOnRydWUsInVzZXJfaWQiOjJ9','2017-02-07 05:20:23.386533');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-01-23 21:39:07

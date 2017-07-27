-- MySQL dump 10.16  Distrib 10.1.22-MariaDB, for Win32 (AMD64)
--
-- Host: localhost    Database: cooking1
-- ------------------------------------------------------
-- Server version	10.1.22-MariaDB

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
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_id` int(10) unsigned DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `categories_parent_id_foreign` (`parent_id`),
  CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (14,'ththth',NULL,NULL,'/media/photos/admin/59643b351b090.jpeg','2017-07-09 21:03:41','2017-07-16 19:52:31',2),(16,'thth',NULL,NULL,'/media/photos/admin/59643b35745b6.jpeg','2017-07-09 21:13:33','2017-07-10 19:43:18',2),(17,'ăn sáng',14,NULL,'/media/photos/admin/59643b355599e.jpeg','2017-07-15 07:14:19','2017-07-20 22:49:03',2),(18,'thththth',16,NULL,'/media/photos/admin/59643b351b090.jpeg','2017-07-15 07:41:58','2017-07-15 07:41:58',2),(19,'ăn trưa',14,NULL,'/media/photos/admin/59643b355599e.jpeg','2017-07-15 07:44:46','2017-07-20 00:15:21',2),(20,'ăn tối',14,NULL,'/media/photos/1/596433f8bc14e.jpeg','2017-07-15 07:44:56','2017-07-17 09:06:59',2);
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `content` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment_table_id` int(10) unsigned NOT NULL,
  `comment_table_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `parent_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `comments_user_id_foreign` (`user_id`),
  KEY `comments_parent_id_foreign` (`parent_id`),
  CONSTRAINT `comments_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `comments` (`id`),
  CONSTRAINT `comments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` VALUES (1,3,'ththth',5,'cookings','2017-07-20 01:13:26','2017-07-20 01:13:26',NULL),(2,3,'111111111111111111',5,'cookings','2017-07-20 01:13:34','2017-07-20 01:13:34',NULL),(3,3,'ẻtghgg',5,'cookings','2017-07-20 01:13:39','2017-07-20 01:13:39',2);
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cooking_categories`
--

DROP TABLE IF EXISTS `cooking_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cooking_categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cooking_id` int(10) unsigned NOT NULL,
  `category_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cooking_categories_category_id_foreign` (`category_id`),
  KEY `cooking_categories_cooking_id_foreign` (`cooking_id`),
  CONSTRAINT `cooking_categories_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  CONSTRAINT `cooking_categories_cooking_id_foreign` FOREIGN KEY (`cooking_id`) REFERENCES `cookings` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cooking_categories`
--

LOCK TABLES `cooking_categories` WRITE;
/*!40000 ALTER TABLE `cooking_categories` DISABLE KEYS */;
INSERT INTO `cooking_categories` VALUES (9,5,19,NULL,NULL),(11,5,17,NULL,NULL),(16,65,20,NULL,NULL),(17,65,18,NULL,NULL),(22,67,18,NULL,NULL),(23,68,20,NULL,NULL),(24,68,19,NULL,NULL),(25,68,17,NULL,NULL),(26,69,20,NULL,NULL),(27,69,18,NULL,NULL),(28,70,20,NULL,NULL),(29,70,18,NULL,NULL),(30,70,19,NULL,NULL),(31,70,17,NULL,NULL),(32,25,19,NULL,NULL),(33,25,20,NULL,NULL),(34,71,20,NULL,NULL),(35,24,20,NULL,NULL),(36,24,19,NULL,NULL),(38,73,20,NULL,NULL),(39,73,19,NULL,NULL),(40,73,17,NULL,NULL),(42,74,20,NULL,NULL),(43,74,19,NULL,NULL),(44,76,20,NULL,NULL),(45,76,19,NULL,NULL),(46,76,17,NULL,NULL);
/*!40000 ALTER TABLE `cooking_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cooking_ingredients`
--

DROP TABLE IF EXISTS `cooking_ingredients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cooking_ingredients` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ingredient_id` int(10) unsigned NOT NULL,
  `cooking_id` int(10) unsigned NOT NULL,
  `unit_id` int(10) unsigned NOT NULL,
  `quantity` int(10) unsigned NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cooking_ingredients_ingredient_id_foreign` (`ingredient_id`),
  KEY `cooking_ingredients_cooking_id_foreign` (`cooking_id`),
  KEY `cooking_ingredients_unit_id_foreign` (`unit_id`),
  CONSTRAINT `cooking_ingredients_cooking_id_foreign` FOREIGN KEY (`cooking_id`) REFERENCES `cookings` (`id`),
  CONSTRAINT `cooking_ingredients_ingredient_id_foreign` FOREIGN KEY (`ingredient_id`) REFERENCES `ingredients` (`id`),
  CONSTRAINT `cooking_ingredients_unit_id_foreign` FOREIGN KEY (`unit_id`) REFERENCES `units` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cooking_ingredients`
--

LOCK TABLES `cooking_ingredients` WRITE;
/*!40000 ALTER TABLE `cooking_ingredients` DISABLE KEYS */;
INSERT INTO `cooking_ingredients` VALUES (54,2,5,2,1,'1','2017-07-15 09:27:17','2017-07-15 09:27:17'),(58,5,49,2,1,NULL,'2017-07-16 18:19:42','2017-07-16 18:19:42'),(79,2,65,1,1,'1','2017-07-17 01:35:28','2017-07-17 01:35:28'),(86,18,67,1,1,NULL,'2017-07-17 18:58:44','2017-07-17 18:58:44'),(87,8,67,1,1,NULL,'2017-07-17 19:00:25','2017-07-17 19:00:25'),(88,8,68,1,1,NULL,'2017-07-17 19:47:59','2017-07-17 19:47:59'),(89,8,69,1,1,NULL,'2017-07-17 19:51:05','2017-07-17 19:51:05'),(90,4,70,1,1,NULL,'2017-07-17 19:57:39','2017-07-17 19:57:39'),(91,9,25,1,1,NULL,'2017-07-17 20:02:15','2017-07-17 20:02:15'),(92,9,71,1,1,'11','2017-07-17 20:28:54','2017-07-17 20:28:54'),(93,2,24,1,1,'rgrgr','2017-07-17 20:35:39','2017-07-17 20:35:39'),(94,2,73,1,1,NULL,'2017-07-18 00:38:10','2017-07-18 00:38:10'),(95,17,73,5,1,NULL,'2017-07-18 01:27:14','2017-07-18 01:27:14'),(98,8,74,1,1,NULL,'2017-07-18 21:19:52','2017-07-18 21:19:52'),(103,9,76,1,1,NULL,'2017-07-19 00:45:10','2017-07-19 00:45:10'),(104,18,76,5,1,NULL,'2017-07-19 00:45:26','2017-07-19 00:45:26'),(105,10,77,1,1,NULL,'2017-07-22 09:26:52','2017-07-22 09:26:52');
/*!40000 ALTER TABLE `cooking_ingredients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cooking_steps`
--

DROP TABLE IF EXISTS `cooking_steps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cooking_steps` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cooking_id` int(10) unsigned NOT NULL,
  `step` int(10) unsigned NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cooking_steps_cooking_id_foreign` (`cooking_id`),
  CONSTRAINT `cooking_steps_cooking_id_foreign` FOREIGN KEY (`cooking_id`) REFERENCES `cookings` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cooking_steps`
--

LOCK TABLES `cooking_steps` WRITE;
/*!40000 ALTER TABLE `cooking_steps` DISABLE KEYS */;
INSERT INTO `cooking_steps` VALUES (17,5,2,'thththththth',0,'2017-07-15 09:15:59','2017-07-15 09:15:59',NULL),(26,65,6,'rêre',0,'2017-07-17 00:01:22','2017-07-17 00:01:22',NULL),(27,65,7,'thththddd',0,'2017-07-17 00:13:34','2017-07-17 00:13:43',NULL),(39,67,1,'ththth',0,'2017-07-17 18:59:01','2017-07-17 18:59:01',NULL),(40,68,1,'11111',0,'2017-07-17 19:48:03','2017-07-17 19:48:03',NULL),(41,69,1,'1111',0,'2017-07-17 19:51:08','2017-07-17 19:51:08',NULL),(42,70,1,'êfe',0,'2017-07-17 19:57:42','2017-07-17 19:57:42',NULL),(43,25,1,'êrere',0,'2017-07-17 20:02:19','2017-07-17 20:02:19',NULL),(44,71,1,'êf',0,'2017-07-17 20:28:57','2017-07-17 20:28:57',NULL),(45,24,1,'rgrgrgr',0,'2017-07-17 20:36:21','2017-07-17 20:36:21',NULL),(47,73,2,'thththth',0,'2017-07-18 01:07:47','2017-07-18 01:07:47','images/Qs9X4EgyO3ceobHwGQCI4NiZEiTNXccgeOb0VHXW.jpeg'),(48,73,3,'ththth',0,'2017-07-18 01:10:59','2017-07-18 01:11:15','images/KL5SqSyeGV48OQTx6seUtCtUktDLLaiIuxMYyphR.jpeg'),(50,74,1,'rgrgrg',0,'2017-07-18 21:20:02','2017-07-18 21:20:02',NULL),(53,76,1,'Thịt bò thái lát mỏng, tỏi lột bỏ và bằm nhuyễn. Ướp thịt bò cùng tỏi, tiêu, bột ngọt, hạt nêm, nước tương trong 15 phút.',0,'2017-07-19 00:45:46','2017-07-19 00:45:46',NULL);
/*!40000 ALTER TABLE `cooking_steps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cookings`
--

DROP TABLE IF EXISTS `cookings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cookings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `time` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ration` int(10) unsigned NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `level_id` int(10) unsigned NOT NULL,
  `rate_point` double(8,2) unsigned DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `video_link` text COLLATE utf8mb4_unicode_ci,
  `status` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `price` decimal(10,0) NOT NULL DEFAULT '0',
  `sell` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cookings_user_id_foreign` (`user_id`),
  KEY `cookings_level_id_foreign` (`level_id`),
  CONSTRAINT `cookings_level_id_foreign` FOREIGN KEY (`level_id`) REFERENCES `levels` (`id`),
  CONSTRAINT `cookings_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cookings`
--

LOCK TABLES `cookings` WRITE;
/*!40000 ALTER TABLE `cookings` DISABLE KEYS */;
INSERT INTO `cookings` VALUES (5,3,'ththth','12',1,NULL,2,NULL,'hthth',NULL,0,'2017-07-13 22:03:36','2017-07-15 07:24:30',0,NULL),(6,3,'ththt','12',1,NULL,1,NULL,'hthth',NULL,1,'2017-07-13 22:03:38','2017-07-13 22:03:38',0,NULL),(7,3,'ththt','12',1,NULL,1,NULL,'hthth',NULL,1,'2017-07-13 22:03:43','2017-07-13 22:03:43',0,NULL),(8,3,'ththt','12',1,NULL,1,NULL,'hthth',NULL,1,'2017-07-13 22:03:48','2017-07-13 22:03:48',0,NULL),(9,3,'ththth','12',1,NULL,1,NULL,'hthth',NULL,1,'2017-07-15 04:18:49','2017-07-15 04:18:49',0,NULL),(10,3,'ththth','12',1,NULL,1,NULL,'hthth',NULL,1,'2017-07-15 04:18:55','2017-07-15 04:18:55',0,NULL),(11,3,'ththth','12',1,NULL,1,NULL,'hthth',NULL,1,'2017-07-15 04:19:00','2017-07-15 04:19:00',0,NULL),(12,3,'thththth','12',1,NULL,1,NULL,'hthth',NULL,1,'2017-07-15 04:19:25','2017-07-15 04:19:25',0,NULL),(13,3,'ththth','12',1,NULL,1,NULL,'hthth',NULL,1,'2017-07-15 04:21:17','2017-07-15 04:21:17',0,NULL),(14,3,'ththth','12',1,NULL,1,NULL,'hthth',NULL,1,'2017-07-15 04:21:21','2017-07-15 04:21:21',0,NULL),(15,3,'ththth','12',1,NULL,1,NULL,'hthth',NULL,1,'2017-07-15 04:21:26','2017-07-15 04:21:26',0,NULL),(16,3,'thththth','12',1,NULL,1,NULL,'hthth',NULL,1,'2017-07-15 04:25:37','2017-07-15 04:25:37',0,NULL),(17,3,'thththth','12',1,NULL,1,NULL,'hthth',NULL,1,'2017-07-15 04:25:43','2017-07-15 04:25:43',0,NULL),(18,3,'thththt','12',1,NULL,1,NULL,'hthth',NULL,1,'2017-07-15 04:27:00','2017-07-15 04:27:00',0,NULL),(19,3,'ththth','12',1,NULL,2,NULL,'hthth',NULL,1,'2017-07-15 09:20:52','2017-07-15 09:20:52',0,NULL),(20,3,'ththth','12',1,NULL,2,NULL,'hthth',NULL,1,'2017-07-15 09:20:54','2017-07-15 09:20:54',0,NULL),(21,3,'ththth','12',1,NULL,2,NULL,'hthth',NULL,1,'2017-07-15 09:21:06','2017-07-15 09:21:06',0,NULL),(22,3,'thththth','12',1,NULL,2,NULL,'hthth',NULL,1,'2017-07-15 09:22:09','2017-07-15 09:22:09',0,NULL),(23,3,'Cách làm thịt nạc kho tiêu','35',4,NULL,2,NULL,'Thịt nạc kho tiêu là một món ngon cay thơm, béo béo vô cùng hấp dẫn và luôn thích hợp cho mọi bữa cơm gia đình. Chắc chắn sẽ rất hút cơm và chống ngán đấy nhé!',NULL,1,'2017-07-15 09:57:49','2017-07-15 09:57:49',0,NULL),(24,3,'Cách làm thịt nạc kho tiêu','35',4,NULL,2,NULL,'Thịt nạc kho tiêu là một món ngon cay thơm, béo béo vô cùng hấp dẫn và luôn thích hợp cho mọi bữa cơm gia đình. Chắc chắn sẽ rất hút cơm và chống ngán đấy nhé!',NULL,1,'2017-07-15 09:57:57','2017-07-17 20:36:27',0,NULL),(25,3,'thththt','35',4,NULL,2,NULL,'Thịt nạc kho tiêu là một món ngon cay thơm, béo béo vô cùng hấp dẫn và luôn thích hợp cho mọi bữa cơm gia đình. Chắc chắn sẽ rất hút cơm và chống ngán đấy nhé!',NULL,1,'2017-07-15 22:21:16','2017-07-17 20:02:26',0,NULL),(26,3,'thththt','35',4,NULL,2,NULL,'Thịt nạc kho tiêu là một món ngon cay thơm, béo béo vô cùng hấp dẫn và luôn thích hợp cho mọi bữa cơm gia đình. Chắc chắn sẽ rất hút cơm và chống ngán đấy nhé!',NULL,1,'2017-07-15 22:21:22','2017-07-15 22:21:22',0,NULL),(27,3,'thththt','35',4,NULL,2,NULL,'Thịt nạc kho tiêu là một món ngon cay thơm, béo béo vô cùng hấp dẫn và luôn thích hợp cho mọi bữa cơm gia đình. Chắc chắn sẽ rất hút cơm và chống ngán đấy nhé!',NULL,1,'2017-07-15 22:21:23','2017-07-15 22:21:23',0,NULL),(28,3,'thththth','35',4,NULL,2,NULL,'Thịt nạc kho tiêu là một món ngon cay thơm, béo béo vô cùng hấp dẫn và luôn thích hợp cho mọi bữa cơm gia đình. Chắc chắn sẽ rất hút cơm và chống ngán đấy nhé!',NULL,1,'2017-07-15 22:24:00','2017-07-15 22:24:00',0,NULL),(29,3,'thththth','35',4,NULL,2,NULL,'Thịt nạc kho tiêu là một món ngon cay thơm, béo béo vô cùng hấp dẫn và luôn thích hợp cho mọi bữa cơm gia đình. Chắc chắn sẽ rất hút cơm và chống ngán đấy nhé!',NULL,1,'2017-07-15 22:24:13','2017-07-15 22:24:13',0,NULL),(30,3,'thththth','35',4,NULL,2,NULL,'Thịt nạc kho tiêu là một món ngon cay thơm, béo béo vô cùng hấp dẫn và luôn thích hợp cho mọi bữa cơm gia đình. Chắc chắn sẽ rất hút cơm và chống ngán đấy nhé!',NULL,1,'2017-07-15 22:24:15','2017-07-15 22:24:15',0,NULL),(31,3,'thththth','35',4,NULL,2,NULL,'Thịt nạc kho tiêu là một món ngon cay thơm, béo béo vô cùng hấp dẫn và luôn thích hợp cho mọi bữa cơm gia đình. Chắc chắn sẽ rất hút cơm và chống ngán đấy nhé!',NULL,1,'2017-07-15 22:24:18','2017-07-15 22:24:18',0,NULL),(32,3,'thththth','35',4,NULL,2,NULL,'Thịt nạc kho tiêu là một món ngon cay thơm, béo béo vô cùng hấp dẫn và luôn thích hợp cho mọi bữa cơm gia đình. Chắc chắn sẽ rất hút cơm và chống ngán đấy nhé!',NULL,1,'2017-07-15 22:24:19','2017-07-15 22:24:19',0,NULL),(33,3,'thththt','35',4,NULL,2,NULL,'Thịt nạc kho tiêu là một món ngon cay thơm, béo béo vô cùng hấp dẫn và luôn thích hợp cho mọi bữa cơm gia đình. Chắc chắn sẽ rất hút cơm và chống ngán đấy nhé!',NULL,1,'2017-07-16 00:33:10','2017-07-16 00:33:10',0,NULL),(34,3,'thththt','35',4,NULL,2,NULL,'Thịt nạc kho tiêu là một món ngon cay thơm, béo béo vô cùng hấp dẫn và luôn thích hợp cho mọi bữa cơm gia đình. Chắc chắn sẽ rất hút cơm và chống ngán đấy nhé!',NULL,1,'2017-07-16 00:33:14','2017-07-16 00:33:14',0,NULL),(35,3,'thththt','35',4,NULL,2,NULL,'Thịt nạc kho tiêu là một món ngon cay thơm, béo béo vô cùng hấp dẫn và luôn thích hợp cho mọi bữa cơm gia đình. Chắc chắn sẽ rất hút cơm và chống ngán đấy nhé!',NULL,1,'2017-07-16 00:33:15','2017-07-16 00:33:15',0,NULL),(36,3,'thththt','35',4,NULL,2,NULL,'Thịt nạc kho tiêu là một món ngon cay thơm, béo béo vô cùng hấp dẫn và luôn thích hợp cho mọi bữa cơm gia đình. Chắc chắn sẽ rất hút cơm và chống ngán đấy nhé!',NULL,1,'2017-07-16 00:33:16','2017-07-16 00:33:16',0,NULL),(37,3,'thththt','35',4,NULL,2,NULL,'Thịt nạc kho tiêu là một món ngon cay thơm, béo béo vô cùng hấp dẫn và luôn thích hợp cho mọi bữa cơm gia đình. Chắc chắn sẽ rất hút cơm và chống ngán đấy nhé!',NULL,1,'2017-07-16 00:33:16','2017-07-16 00:33:16',0,NULL),(38,3,'thththt','35',4,NULL,2,NULL,'Thịt nạc kho tiêu là một món ngon cay thơm, béo béo vô cùng hấp dẫn và luôn thích hợp cho mọi bữa cơm gia đình. Chắc chắn sẽ rất hút cơm và chống ngán đấy nhé!',NULL,1,'2017-07-16 00:33:49','2017-07-16 00:33:49',0,NULL),(49,3,'ththth','1',1,NULL,1,NULL,NULL,NULL,1,'2017-07-16 01:01:13','2017-07-16 18:19:31',0,NULL),(65,3,'ththth','3',1,'images/8YNqagBoQDSV6x9BpIOGEn52FOcV9nUguSfhOOkN.jpeg',1,NULL,'1',NULL,1,'2017-07-16 19:40:52','2017-07-17 20:37:35',0,NULL),(67,3,'ththt','1',1,NULL,1,NULL,NULL,NULL,1,'2017-07-17 18:56:55','2017-07-17 19:46:43',0,NULL),(68,3,'hththt','11',1,'images/LyNLrVZlDuQkitWdlWmNYxqpGE4R7XLv3C02Nhs1.jpeg',1,NULL,NULL,NULL,1,'2017-07-17 19:47:52','2017-07-17 19:48:13',0,NULL),(69,3,'123456','1',1,NULL,1,NULL,NULL,NULL,1,'2017-07-17 19:50:59','2017-07-17 19:51:15',0,NULL),(70,3,'rtrt','1',1,NULL,1,NULL,NULL,NULL,1,'2017-07-17 19:57:33','2017-07-17 19:57:51',0,NULL),(71,3,'ưertyu','111',1,NULL,2,NULL,NULL,NULL,1,'2017-07-17 20:28:46','2017-07-17 20:29:02',300000,NULL),(72,3,'ỵyj','1',1,NULL,1,NULL,NULL,NULL,1,'2017-07-17 22:41:18','2017-07-17 22:55:49',500000,NULL),(73,3,'wertyu','1',1,'images/S3CG9aIth2StOfmn3jbz7UnDapPz9Selre21cC2H.jpeg',2,NULL,'1',NULL,1,'2017-07-18 00:33:13','2017-07-18 08:58:20',600000,NULL),(74,1,'11234567','1',1,NULL,1,NULL,NULL,NULL,1,'2017-07-18 21:19:45','2017-07-18 21:20:12',777777,NULL),(76,1,'Cách làm bò xào cần nước','1',1,'images/2I9Um4OVukxRyJ5U8zFG8HAm3oi0hdUDhraMso5g.jpeg',1,NULL,'Bò xào cần nước là một trong những món ăn ngon, món nhậu đơn giản, thích hợp cho cả người lớn và trẻ em. Thịt bò xào cần nước rất dễ ăn, thịt bò mềm khi ăn cùng rau cần nước xào giòn giòn hòa quyện cùng các gia vị đậm đà.',NULL,1,'2017-07-19 00:44:58','2017-07-19 00:45:57',120000,NULL),(77,3,'ththt','1',1,NULL,2,NULL,'11111',NULL,2,'2017-07-22 07:33:33','2017-07-22 07:33:33',0,NULL);
/*!40000 ALTER TABLE `cookings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `follows`
--

DROP TABLE IF EXISTS `follows`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `follows` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `user_id_follow` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `follows_user_id_foreign` (`user_id`),
  KEY `follows_user_id_follow_foreign` (`user_id_follow`),
  CONSTRAINT `follows_user_id_follow_foreign` FOREIGN KEY (`user_id_follow`) REFERENCES `users` (`id`),
  CONSTRAINT `follows_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `follows`
--

LOCK TABLES `follows` WRITE;
/*!40000 ALTER TABLE `follows` DISABLE KEYS */;
/*!40000 ALTER TABLE `follows` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ingredients`
--

DROP TABLE IF EXISTS `ingredients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ingredients` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` int(11) DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingredients`
--

LOCK TABLES `ingredients` WRITE;
/*!40000 ALTER TABLE `ingredients` DISABLE KEYS */;
INSERT INTO `ingredients` VALUES (2,'thịt gà','<p>fdfdfdf</p>',0,NULL,1,NULL,'2017-07-17 02:23:16'),(4,'thịt chó','fdfdfdf',NULL,NULL,1,NULL,NULL),(5,'ththth','<p>user create jjj</p>',NULL,NULL,1,'2017-07-12 09:31:29','2017-07-17 02:25:06'),(6,'ththth','user create',NULL,NULL,1,'2017-07-12 09:36:22','2017-07-12 09:36:22'),(7,'ththth','user create',NULL,NULL,1,'2017-07-12 09:40:11','2017-07-12 09:40:11'),(8,'ththth1','user create',NULL,NULL,1,'2017-07-12 09:42:16','2017-07-12 09:42:16'),(9,'thịt gà đồi','user create',NULL,NULL,1,'2017-07-12 16:21:41','2017-07-12 16:21:41'),(10,'thịt chó phú quốc','user create',NULL,NULL,1,'2017-07-12 18:32:26','2017-07-12 18:32:26'),(11,'thịt bò','user create',NULL,NULL,1,'2017-07-12 19:33:42','2017-07-12 19:33:42'),(12,'thịt lợn','user create',NULL,NULL,1,'2017-07-12 19:35:56','2017-07-12 19:35:56'),(13,'gà ta','user create',NULL,NULL,1,'2017-07-12 19:41:09','2017-07-12 19:41:09'),(14,'cua','user create',NULL,NULL,1,'2017-07-12 19:45:14','2017-07-12 19:45:14'),(15,'ghẹ','user create',NULL,NULL,1,'2017-07-12 19:48:42','2017-07-12 19:48:42'),(16,'anh thắng','user create',NULL,NULL,1,'2017-07-12 20:12:53','2017-07-12 20:12:53'),(17,'mỹ','user create',NULL,NULL,1,'2017-07-12 21:09:10','2017-07-12 21:09:10'),(18,'thịt gà trống','user create',NULL,NULL,1,'2017-07-12 22:17:44','2017-07-12 22:17:44'),(19,'ba ba','user create',NULL,NULL,1,'2017-07-13 01:32:16','2017-07-13 01:32:16'),(20,'thịt','user create',NULL,NULL,1,'2017-07-13 03:42:22','2017-07-13 03:42:22'),(21,'ba ba 3333','user create',NULL,NULL,1,'2017-07-13 03:50:24','2017-07-13 03:50:24'),(22,'ty','user create',NULL,NULL,1,'2017-07-13 06:35:57','2017-07-13 06:35:57'),(23,'gà','user create',NULL,NULL,1,'2017-07-13 18:25:16','2017-07-13 18:25:16'),(24,'thth','user create',NULL,NULL,1,'2017-07-13 21:00:19','2017-07-13 21:00:19'),(25,'trtr','user create',NULL,NULL,1,'2017-07-13 21:43:41','2017-07-13 21:43:41'),(26,'ththtth','user create',NULL,NULL,1,'2017-07-15 04:09:45','2017-07-15 04:09:45'),(27,'y','user create',NULL,NULL,1,'2017-07-15 04:34:46','2017-07-15 04:34:46'),(28,'tht','user create',NULL,NULL,1,'2017-07-15 04:37:02','2017-07-15 04:37:02'),(29,'2323','user create',NULL,NULL,0,'2017-07-16 19:03:50','2017-07-16 19:03:50'),(30,'thịt gàt','user create',NULL,NULL,0,'2017-07-17 08:57:24','2017-07-17 08:57:24'),(31,'Lòng gà','user create',NULL,NULL,0,'2017-07-17 18:38:03','2017-07-17 18:38:03'),(32,'tỏi','user create',NULL,NULL,0,'2017-07-17 18:38:18','2017-07-17 18:38:18'),(33,'Trứng gà non','user create',NULL,NULL,0,'2017-07-17 18:38:58','2017-07-17 18:38:58'),(34,'dầu nêm','user create',NULL,NULL,0,'2017-07-17 18:39:25','2017-07-17 18:39:25');
/*!40000 ALTER TABLE `ingredients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `levels`
--

DROP TABLE IF EXISTS `levels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `levels` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `levels`
--

LOCK TABLES `levels` WRITE;
/*!40000 ALTER TABLE `levels` DISABLE KEYS */;
INSERT INTO `levels` VALUES (1,'customer','12',NULL,NULL),(2,'admin','123',NULL,NULL);
/*!40000 ALTER TABLE `levels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_resets_table',1),(3,'2017_06_27_073647_create_cookings_table',1),(4,'2017_06_27_073759_create_ingredients_table',1),(5,'2017_06_27_073827_create_cooking_ingredients_table',1),(6,'2017_06_27_073848_create_cooking_steps_table',1),(7,'2017_06_27_073919_create_cooking_categories_table',1),(8,'2017_06_27_073928_create_categories_table',1),(9,'2017_06_27_073942_create_post_categories_table',1),(10,'2017_06_27_073949_create_posts_table',1),(11,'2017_06_27_074008_create_levels_table',1),(12,'2017_06_27_074024_create_orders_table',1),(13,'2017_06_27_074046_create_order_details_table',1),(14,'2017_06_27_074059_create_comments_table',1),(15,'2017_06_27_074115_create_follows_table',1),(16,'2017_06_27_074128_create_rates_table',1),(17,'2017_06_27_075539_create_units_table',1),(18,'2017_06_27_082727_relations',1),(19,'2017_06_30_021934_create_subscrices_table',1),(20,'2017_07_04_031216_edit-category',1),(21,'2017_07_04_031833_update_user_table',1),(22,'2017_07_04_033137_update_userpassword_table',1),(23,'2017_07_11_030625_create_wishlists_table',2),(24,'2017_07_17_144902_edit_cookinh_steps',3),(25,'2017_07_17_144931_edit_cooking_steps',3),(26,'2017_07_13_024111_update_comment_table',4),(27,'2017_07_13_161114_updateFollows',4),(28,'2017_07_19_023153_wishlish',4),(29,'2017_07_19_023935_wishlishRelation',4),(30,'2017_07_19_093822_update_rate_table',4),(31,'2017_07_20_224200_edit_cooking_table',5),(32,'2017_07_21_042516_edit_order_table',6);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_details`
--

DROP TABLE IF EXISTS `order_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_details` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(10) unsigned NOT NULL,
  `cooking_id` int(10) unsigned NOT NULL,
  `quantity` int(10) unsigned NOT NULL,
  `price` decimal(10,0) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_details_cooking_id_foreign` (`cooking_id`),
  KEY `order_details_order_id_foreign` (`order_id`),
  CONSTRAINT `order_details_cooking_id_foreign` FOREIGN KEY (`cooking_id`) REFERENCES `cookings` (`id`),
  CONSTRAINT `order_details_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_details`
--

LOCK TABLES `order_details` WRITE;
/*!40000 ALTER TABLE `order_details` DISABLE KEYS */;
INSERT INTO `order_details` VALUES (1,8,74,3,2333331,'2017-07-21 19:50:42','2017-07-21 19:50:42'),(2,9,74,3,2333331,'2017-07-21 19:51:12','2017-07-21 19:51:12'),(3,10,76,3,360000,'2017-07-21 19:51:12','2017-07-21 19:51:12'),(4,11,74,3,2333331,'2017-07-21 19:55:37','2017-07-21 19:55:37'),(5,12,76,3,360000,'2017-07-21 19:55:38','2017-07-21 19:55:38'),(6,13,74,3,2333331,'2017-07-21 19:57:12','2017-07-21 19:57:12'),(7,14,76,3,360000,'2017-07-21 19:57:12','2017-07-21 19:57:12'),(8,15,74,3,2333331,'2017-07-21 20:06:53','2017-07-21 20:06:53'),(9,16,76,3,360000,'2017-07-21 20:06:53','2017-07-21 20:06:53'),(10,16,76,1,343434343,NULL,NULL),(11,17,74,10,7777770,'2017-07-21 20:54:11','2017-07-21 20:54:11'),(12,18,76,10,1200000,'2017-07-21 20:54:11','2017-07-21 20:54:11'),(13,19,74,10,7777770,'2017-07-21 20:58:20','2017-07-21 20:58:20'),(14,20,76,10,1200000,'2017-07-21 20:58:20','2017-07-21 20:58:20'),(15,21,74,10,7777770,'2017-07-21 21:00:43','2017-07-21 21:00:43'),(16,22,76,10,1200000,'2017-07-21 21:00:43','2017-07-21 21:00:43'),(17,23,74,10,7777770,'2017-07-21 21:02:44','2017-07-21 21:02:44'),(18,24,76,10,1200000,'2017-07-21 21:02:44','2017-07-21 21:02:44'),(19,25,74,10,7777770,'2017-07-21 21:08:40','2017-07-21 21:08:40'),(20,26,76,10,1200000,'2017-07-21 21:08:40','2017-07-21 21:08:40'),(21,27,74,12,9333324,'2017-07-21 21:09:59','2017-07-21 21:09:59'),(22,28,76,12,1440000,'2017-07-21 21:10:00','2017-07-21 21:10:00'),(23,29,73,4,2400000,'2017-07-21 22:03:21','2017-07-21 22:03:21'),(24,29,74,3,2333331,'2017-07-21 22:03:21','2017-07-21 22:03:21'),(25,30,76,4,480000,'2017-07-21 22:03:21','2017-07-21 22:03:21'),(26,31,73,1,600000,'2017-07-21 22:49:56','2017-07-21 22:49:56'),(27,31,74,3,2333331,'2017-07-21 22:49:57','2017-07-21 22:49:57'),(28,32,76,4,480000,'2017-07-21 22:49:57','2017-07-21 22:49:57'),(29,33,74,1,777777,'2017-07-23 07:40:49','2017-07-23 07:40:49'),(30,34,76,1,120000,'2017-07-23 07:40:50','2017-07-23 07:40:50'),(31,35,74,2,1555554,'2017-07-23 07:48:43','2017-07-23 07:48:43'),(32,35,76,3,360000,'2017-07-23 07:48:43','2017-07-23 07:48:43');
/*!40000 ALTER TABLE `order_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `note` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `total` decimal(10,0) NOT NULL,
  `status` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `seller` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `orders_user_id_foreign` (`user_id`),
  KEY `orders_seller_foreign` (`seller`),
  CONSTRAINT `orders_seller_foreign` FOREIGN KEY (`seller`) REFERENCES `users` (`id`),
  CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,'th thth','trungthangngo@gmail.com','ha noi','1632593923',NULL,3,900000,0,'2017-07-20 22:45:59','2017-07-20 22:45:59',3),(2,'th thth','trungthangngo@gmail.com','ha noi','1632593923',NULL,3,480000,0,'2017-07-20 22:45:59','2017-07-20 22:45:59',2),(3,'th thth','trungthangngo@gmail.com','ha noi','1632593923',NULL,3,3600000,0,'2017-07-20 23:26:57','2017-07-20 23:26:57',3),(4,'th thth','trungthangngo@gmail.com','ha noi','1632593923',NULL,3,840000,0,'2017-07-20 23:26:57','2017-07-20 23:26:57',2),(5,'rgrgrg','th@gmail.com','đwdwd','123456',NULL,3,777777,0,'2017-07-21 01:01:25','2017-07-21 01:01:25',3),(6,'th thth','ththth@gmail.com','ha noi','1632593923',NULL,3,2700000,0,'2017-07-21 16:59:51','2017-07-21 16:59:51',3),(7,'th thth','ththth@gmail.com','ha noi','1632593923',NULL,3,240000,0,'2017-07-21 16:59:51','2017-07-21 16:59:51',2),(8,'12345678','trungthangngo@gmail.com','1234567890','1234567',NULL,3,2333331,0,'2017-07-21 19:50:42','2017-07-21 19:50:42',3),(9,'12345678','trungthangngo@gmail.com','1234567890','1234567',NULL,3,2333331,1,'2017-07-21 19:51:12','2017-07-22 07:56:54',3),(10,'12345678','trungthangngo@gmail.com','1234567890','1234567',NULL,3,360000,0,'2017-07-21 19:51:12','2017-07-21 19:51:12',2),(11,'12345678','trungthangngo@gmail.com','1234567890','1234567',NULL,3,2333331,1,'2017-07-21 19:55:37','2017-07-22 07:56:49',3),(12,'12345678','trungthangngo@gmail.com','1234567890','1234567',NULL,3,360000,0,'2017-07-21 19:55:37','2017-07-21 19:55:37',2),(13,'12345678','trungthangngo@gmail.com','1234567890','1234567',NULL,3,2333331,0,'2017-07-21 19:57:12','2017-07-21 19:57:12',3),(14,'12345678','trungthangngo@gmail.com','1234567890','1234567',NULL,3,360000,0,'2017-07-21 19:57:12','2017-07-21 19:57:12',2),(15,'12345678','trungthangngo@gmail.com','1234567890','1234567',NULL,3,2333331,0,'2017-07-21 20:06:53','2017-07-21 20:06:53',3),(16,'12345678','trungthangngo@gmail.com','1234567890','1234567',NULL,3,360000,0,'2017-07-21 20:06:53','2017-07-21 20:06:53',2),(17,'anh thắng','ththth@gmail.com','1234567890','1234567890',NULL,3,7777770,0,'2017-07-21 20:54:11','2017-07-21 20:54:11',3),(18,'anh thắng','ththth@gmail.com','1234567890','1234567890',NULL,3,1200000,0,'2017-07-21 20:54:11','2017-07-21 20:54:11',2),(19,'ererer','trungthangngo@gmail.com','34343434','3343434343',NULL,3,7777770,0,'2017-07-21 20:58:20','2017-07-21 20:58:20',3),(20,'ererer','trungthangngo@gmail.com','34343434','3343434343',NULL,3,1200000,0,'2017-07-21 20:58:20','2017-07-21 20:58:20',2),(21,'12345678','trungthangngo@gmail.com','1234567890','1234567',NULL,3,7777770,0,'2017-07-21 21:00:43','2017-07-21 21:00:43',3),(22,'12345678','trungthangngo@gmail.com','1234567890','1234567',NULL,3,1200000,0,'2017-07-21 21:00:43','2017-07-21 21:00:43',2),(23,'tytytyty','th@gmail.com','11111','111111',NULL,3,7777770,0,'2017-07-21 21:02:43','2017-07-21 21:02:43',3),(24,'tytytyty','th@gmail.com','11111','111111',NULL,3,1200000,0,'2017-07-21 21:02:44','2017-07-21 21:02:44',2),(25,'2323232','trungthangngo@gmail.com','34343434','3434343',NULL,3,7777770,0,'2017-07-21 21:08:40','2017-07-22 10:16:55',3),(26,'2323232','trungthangngo@gmail.com','34343434','3434343',NULL,3,1200000,0,'2017-07-21 21:08:40','2017-07-21 21:08:40',2),(27,'th thth','trungthangngo@gmail.com','ha noi','1632593923',NULL,3,9333324,1,'2017-07-21 21:09:59','2017-07-22 07:57:05',3),(28,'th thth','trungthangngo@gmail.com','ha noi','1632593923',NULL,3,1440000,0,'2017-07-21 21:10:00','2017-07-21 21:10:00',2),(29,'12345678','trungthangngo@gmail.com','34343434','334343434',NULL,3,4733331,1,'2017-07-21 22:03:21','2017-07-22 08:00:24',3),(30,'12345678','trungthangngo@gmail.com','34343434','334343434',NULL,3,480000,1,'2017-07-21 22:03:21','2017-07-22 07:49:07',2),(31,'thắng','th1@gmail.com','22222','23232',NULL,1,2933331,0,'2017-07-21 22:49:56','2017-07-22 10:17:00',3),(32,'thắng','th1@gmail.com','22222','23232',NULL,1,480000,1,'2017-07-21 22:49:57','2017-07-22 07:45:26',2),(33,'thắng','th1@gmail.com','12121212121212121','12344',NULL,1,777777,0,'2017-07-23 07:40:49','2017-07-23 07:40:49',3),(34,'thắng','th1@gmail.com','12121212121212121','12344',NULL,1,120000,0,'2017-07-23 07:40:49','2017-07-23 07:40:49',2),(35,'anh thắng','th1@gmail.com','ewewe','1111',NULL,1,1915554,1,'2017-07-23 07:48:43','2017-07-23 09:01:59',1);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_categories`
--

DROP TABLE IF EXISTS `post_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `post_categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` int(10) unsigned NOT NULL,
  `category_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `post_categories_post_id_foreign` (`post_id`),
  KEY `post_categories_category_id_foreign` (`category_id`),
  CONSTRAINT `post_categories_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  CONSTRAINT `post_categories_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_categories`
--

LOCK TABLES `post_categories` WRITE;
/*!40000 ALTER TABLE `post_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `post_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `posts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `posts_user_id_foreign` (`user_id`),
  CONSTRAINT `posts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rates`
--

DROP TABLE IF EXISTS `rates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rates` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `rate_table_id` int(10) unsigned NOT NULL,
  `rate_table_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `point` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `rates_user_id_foreign` (`user_id`),
  CONSTRAINT `rates_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rates`
--

LOCK TABLES `rates` WRITE;
/*!40000 ALTER TABLE `rates` DISABLE KEYS */;
/*!40000 ALTER TABLE `rates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subscrices`
--

DROP TABLE IF EXISTS `subscrices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subscrices` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `subscrices_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subscrices`
--

LOCK TABLES `subscrices` WRITE;
/*!40000 ALTER TABLE `subscrices` DISABLE KEYS */;
INSERT INTO `subscrices` VALUES (1,'ttht@gmail.com','2017-07-19 01:20:51','2017-07-19 01:20:51');
/*!40000 ALTER TABLE `subscrices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `units`
--

DROP TABLE IF EXISTS `units`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `units` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `units`
--

LOCK TABLES `units` WRITE;
/*!40000 ALTER TABLE `units` DISABLE KEYS */;
INSERT INTO `units` VALUES (1,'chiếc',NULL,NULL),(2,'kilogam',NULL,NULL),(3,'gram',NULL,NULL),(4,'thìa',NULL,NULL),(5,'con',NULL,NULL);
/*!40000 ALTER TABLE `units` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `level_id` int(10) unsigned DEFAULT NULL,
  `status` int(10) unsigned NOT NULL DEFAULT '0',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `facebook_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  KEY `users_level_id_foreign` (`level_id`),
  CONSTRAINT `users_level_id_foreign` FOREIGN KEY (`level_id`) REFERENCES `levels` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'thắng','th1@gmail.com','$2y$10$FqFF.CkQjomdvgHz3hgtUerWK8RB4r/YrhkYAUxTCKQgSznPwPxcO',NULL,NULL,1,0,'SXLosckBZnlVm9Kwq8Eb89eZ50KWlzsKs1mlcEDXz9Ojo7BVNk8p8WHAsCim',NULL,'2017-07-10 18:59:36',NULL),(2,'ẻhdsghfds','th@gmail.com','$2y$10$KeGZXfE49ViZpOLOflGzPOp1dz05XvgosQtQHo/Q2ly4..gS2XdY2',NULL,NULL,NULL,1,'YjCb1HnmrvQWjgjPHyWBCN1c3Sc7Oy6DogN0gWHbWIs5nCq0SVNXhPw3jvaQ',NULL,'2017-07-09 21:47:37',NULL),(3,'Ngô Trung Thắng','trungthangngo@gmail.com','$2y$10$vzkU0Wo8E83WdBuQqPFSeeIi1PbkVm8o55YP7BMjcKx5FjDbLFBAu','1234567890','/images/YwBlgC1u9jKxY66k.jpg',NULL,1,'24UGntRoQzfuP0TDbJOzCNo81SyPpXfVSQYNWsB8nSQarhadGzfJAoU4gqkc','2017-07-06 18:37:51','2017-07-19 06:52:27','877098855776825'),(4,'ththt','ththth@gmail.com','$2y$10$iZyGVzM.pGCK6no2di8Pc.JpDVuRRJCF9FjrlkBHzWDXcdkoNY9qu','1234','/laravel-filemanager/photos//595f445336f61.jpeg',1,2,NULL,'2017-07-07 01:27:35','2017-07-09 20:57:39',NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wishlish`
--

DROP TABLE IF EXISTS `wishlish`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wishlish` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `cooking_id` int(10) unsigned NOT NULL,
  `status` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `wishlish_user_id_foreign` (`user_id`),
  KEY `wishlish_cooking_id_foreign` (`cooking_id`),
  CONSTRAINT `wishlish_cooking_id_foreign` FOREIGN KEY (`cooking_id`) REFERENCES `cookings` (`id`),
  CONSTRAINT `wishlish_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wishlish`
--

LOCK TABLES `wishlish` WRITE;
/*!40000 ALTER TABLE `wishlish` DISABLE KEYS */;
/*!40000 ALTER TABLE `wishlish` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wishlists`
--

DROP TABLE IF EXISTS `wishlists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wishlists` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `cooking_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `wishlists_user_id_foreign` (`user_id`),
  KEY `wishlists_cooking_id_foreign` (`cooking_id`),
  CONSTRAINT `wishlists_cooking_id_foreign` FOREIGN KEY (`cooking_id`) REFERENCES `cookings` (`id`),
  CONSTRAINT `wishlists_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wishlists`
--

LOCK TABLES `wishlists` WRITE;
/*!40000 ALTER TABLE `wishlists` DISABLE KEYS */;
/*!40000 ALTER TABLE `wishlists` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-07-28  6:36:44

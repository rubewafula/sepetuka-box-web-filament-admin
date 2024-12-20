-- MySQL dump 10.13  Distrib 8.0.40, for Linux (x86_64)
--
-- Host: 10.132.0.2    Database: sepetuka
-- ------------------------------------------------------
-- Server version	8.0.40-0ubuntu0.20.04.1

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
-- Table structure for table `auth_assignment`
--

DROP TABLE IF EXISTS `auth_assignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_assignment` (
  `item_name` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `user_id` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_at` int DEFAULT NULL,
  PRIMARY KEY (`item_name`,`user_id`),
  CONSTRAINT `auth_assignment_ibfk_1` FOREIGN KEY (`item_name`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_assignment`
--

LOCK TABLES `auth_assignment` WRITE;
/*!40000 ALTER TABLE `auth_assignment` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_assignment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_item`
--

DROP TABLE IF EXISTS `auth_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_item` (
  `name` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `type` int NOT NULL,
  `description` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `rule_name` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `data` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `created_at` int DEFAULT NULL,
  `updated_at` int DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `rule_name` (`rule_name`),
  KEY `idx-auth_item-type` (`type`),
  CONSTRAINT `auth_item_ibfk_1` FOREIGN KEY (`rule_name`) REFERENCES `auth_rule` (`name`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_item`
--

LOCK TABLES `auth_item` WRITE;
/*!40000 ALTER TABLE `auth_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_item_child`
--

DROP TABLE IF EXISTS `auth_item_child`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_item_child` (
  `parent` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `child` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  PRIMARY KEY (`parent`,`child`),
  KEY `child` (`child`),
  CONSTRAINT `auth_item_child_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `auth_item_child_ibfk_2` FOREIGN KEY (`child`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_item_child`
--

LOCK TABLES `auth_item_child` WRITE;
/*!40000 ALTER TABLE `auth_item_child` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_item_child` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_rule`
--

DROP TABLE IF EXISTS `auth_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_rule` (
  `name` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `data` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `created_at` int DEFAULT NULL,
  `updated_at` int DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_rule`
--

LOCK TABLES `auth_rule` WRITE;
/*!40000 ALTER TABLE `auth_rule` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_token`
--

DROP TABLE IF EXISTS `auth_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_token` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `token` text,
  `refresh_token` text,
  `expire_seconds` int NOT NULL DEFAULT '540' COMMENT 'I set this to 9 minutes since the token expiry time is rumoured to be 10 minutes',
  `max_refresh` tinyint NOT NULL DEFAULT '10',
  `refresh_times` tinyint NOT NULL DEFAULT '0',
  `token_type` enum('bulk','content') DEFAULT 'bulk',
  `time_received` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` enum('active','expired','awaiting_refresh') NOT NULL DEFAULT 'active',
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_token`
--

LOCK TABLES `auth_token` WRITE;
/*!40000 ALTER TABLE `auth_token` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache`
--

DROP TABLE IF EXISTS `cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache`
--

LOCK TABLES `cache` WRITE;
/*!40000 ALTER TABLE `cache` DISABLE KEYS */;
INSERT INTO `cache` VALUES ('eaeacec1ed408b12206d6c0a389a604d5252f48e','i:1;',1734729689),('eaeacec1ed408b12206d6c0a389a604d5252f48e:timer','i:1734729689;',1734729689),('spatie.permission.cache','a:3:{s:5:\"alias\";a:0:{}s:11:\"permissions\";a:0:{}s:5:\"roles\";a:0:{}}',1734817625);
/*!40000 ALTER TABLE `cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache_locks`
--

DROP TABLE IF EXISTS `cache_locks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_locks`
--

LOCK TABLES `cache_locks` WRITE;
/*!40000 ALTER TABLE `cache_locks` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache_locks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deposit`
--

DROP TABLE IF EXISTS `deposit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `deposit` (
  `deposit_id` bigint NOT NULL AUTO_INCREMENT,
  `msisdn` varchar(255) DEFAULT NULL,
  `account_no` varchar(50) DEFAULT NULL,
  `reference` varchar(50) NOT NULL,
  `amount` int DEFAULT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `profile_id` int DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`deposit_id`),
  UNIQUE KEY `reference` (`reference`),
  KEY `msisdn` (`msisdn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deposit`
--

LOCK TABLES `deposit` WRITE;
/*!40000 ALTER TABLE `deposit` DISABLE KEYS */;
/*!40000 ALTER TABLE `deposit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inbox`
--

DROP TABLE IF EXISTS `inbox`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inbox` (
  `inbox_id` bigint NOT NULL AUTO_INCREMENT,
  `network` varchar(50) DEFAULT NULL,
  `shortcode` varchar(25) DEFAULT NULL,
  `msisdn` varchar(20) DEFAULT NULL,
  `message` varchar(300) DEFAULT NULL,
  `linkid` varchar(100) DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`inbox_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inbox`
--

LOCK TABLES `inbox` WRITE;
/*!40000 ALTER TABLE `inbox` DISABLE KEYS */;
/*!40000 ALTER TABLE `inbox` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_batches`
--

DROP TABLE IF EXISTS `job_batches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job_batches` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_batches`
--

LOCK TABLES `job_batches` WRITE;
/*!40000 ALTER TABLE `job_batches` DISABLE KEYS */;
/*!40000 ALTER TABLE `job_batches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint unsigned NOT NULL,
  `reserved_at` int unsigned DEFAULT NULL,
  `available_at` int unsigned NOT NULL,
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'0001_01_01_000000_create_users_table',1),(2,'0001_01_01_000001_create_cache_table',1),(3,'0001_01_01_000002_create_jobs_table',1),(4,'2024_12_20_212252_create_permission_tables',2);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `model_has_permissions`
--

DROP TABLE IF EXISTS `model_has_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `model_has_permissions` (
  `permission_id` bigint unsigned NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `model_has_permissions`
--

LOCK TABLES `model_has_permissions` WRITE;
/*!40000 ALTER TABLE `model_has_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `model_has_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `model_has_roles`
--

DROP TABLE IF EXISTS `model_has_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `model_has_roles` (
  `role_id` bigint unsigned NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `model_has_roles`
--

LOCK TABLES `model_has_roles` WRITE;
/*!40000 ALTER TABLE `model_has_roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `model_has_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mpesa_rate`
--

DROP TABLE IF EXISTS `mpesa_rate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mpesa_rate` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `min_amount` float NOT NULL,
  `max_amount` float NOT NULL,
  `charge` float NOT NULL,
  `created` datetime DEFAULT NULL,
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mpesa_rate`
--

LOCK TABLES `mpesa_rate` WRITE;
/*!40000 ALTER TABLE `mpesa_rate` DISABLE KEYS */;
/*!40000 ALTER TABLE `mpesa_rate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mpesa_transaction`
--

DROP TABLE IF EXISTS `mpesa_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mpesa_transaction` (
  `mpesa_transaction_id` bigint NOT NULL AUTO_INCREMENT,
  `msisdn` bigint NOT NULL,
  `transaction_time` datetime NOT NULL,
  `message` varchar(300) NOT NULL,
  `mpesa_customer_id` varchar(50) NOT NULL,
  `account_no` varchar(100) NOT NULL,
  `mpesa_code` varchar(100) NOT NULL,
  `mpesa_amt` decimal(53,2) NOT NULL,
  `mpesa_sender` varchar(100) NOT NULL,
  `business_number` varchar(45) DEFAULT NULL,
  `enc_params` varchar(250) DEFAULT NULL,
  `promo_code` varchar(50) DEFAULT NULL,
  `paid_by` varchar(45) DEFAULT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`mpesa_transaction_id`),
  UNIQUE KEY `mpesa_code` (`mpesa_code`),
  UNIQUE KEY `mpesa_code_msisdn` (`mpesa_code`,`msisdn`),
  KEY `msisdn` (`msisdn`),
  KEY `mpesa_code_index` (`mpesa_code`),
  KEY `created` (`created`),
  KEY `mpesa_code_idx` (`mpesa_customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mpesa_transaction`
--

LOCK TABLES `mpesa_transaction` WRITE;
/*!40000 ALTER TABLE `mpesa_transaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `mpesa_transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `outbox`
--

DROP TABLE IF EXISTS `outbox`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `outbox` (
  `outbox_id` bigint NOT NULL AUTO_INCREMENT,
  `shortcode` varchar(30) DEFAULT NULL,
  `network` varchar(50) DEFAULT NULL,
  `profile_id` bigint DEFAULT NULL,
  `reference` varchar(45) DEFAULT NULL,
  `linkid` varchar(100) DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `date_sent` datetime DEFAULT NULL,
  `retry_status` tinyint(1) DEFAULT '0',
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `text` text,
  `msisdn` varchar(25) DEFAULT NULL,
  `sdp_id` varchar(100) DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`outbox_id`),
  UNIQUE KEY `reference` (`reference`),
  KEY `fk_outbox_profile_idx` (`profile_id`),
  KEY `date_created` (`date_created`),
  KEY `reference_2` (`reference`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `outbox`
--

LOCK TABLES `outbox` WRITE;
/*!40000 ALTER TABLE `outbox` DISABLE KEYS */;
/*!40000 ALTER TABLE `outbox` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_reset_tokens`
--

LOCK TABLES `password_reset_tokens` WRITE;
/*!40000 ALTER TABLE `password_reset_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_reset_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permissions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions`
--

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profile`
--

DROP TABLE IF EXISTS `profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `profile` (
  `profile_id` bigint NOT NULL AUTO_INCREMENT,
  `msisdn` varchar(45) NOT NULL DEFAULT '0',
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  `status` smallint DEFAULT NULL,
  `modified` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by` varchar(45) DEFAULT NULL,
  `network` varchar(50) DEFAULT NULL,
  `freebie` int DEFAULT '0',
  PRIMARY KEY (`profile_id`),
  UNIQUE KEY `msisdn` (`msisdn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profile`
--

LOCK TABLES `profile` WRITE;
/*!40000 ALTER TABLE `profile` DISABLE KEYS */;
/*!40000 ALTER TABLE `profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profile_balance`
--

DROP TABLE IF EXISTS `profile_balance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `profile_balance` (
  `profile_balance_id` int NOT NULL AUTO_INCREMENT,
  `profile_id` bigint NOT NULL,
  `balance` decimal(10,2) NOT NULL,
  `created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `bonus_balance` decimal(10,2) DEFAULT '0.00',
  `total_deposits` float(18,2) DEFAULT '0.00',
  `total_winnings` float(18,2) DEFAULT '0.00',
  `total_withdrawals` float(18,2) DEFAULT '0.00',
  `total_bonus` float(18,2) DEFAULT '0.00',
  `total_bet_amount` float(18,2) DEFAULT '0.00',
  `total_bonus_bet_amount` float(18,2) DEFAULT NULL,
  `total_direct_credits` float(18,2) DEFAULT '0.00',
  `total_direct_debits` float(18,2) DEFAULT '0.00',
  PRIMARY KEY (`profile_balance_id`),
  UNIQUE KEY `profile_id_unq` (`profile_id`),
  KEY `profile_id` (`profile_id`),
  KEY `bonus_balance` (`bonus_balance`),
  CONSTRAINT `profile_balance_fk1` FOREIGN KEY (`profile_id`) REFERENCES `profile` (`profile_id`),
  CONSTRAINT `check_balance_non_negative` CHECK ((`balance` >= 0)),
  CONSTRAINT `surecoin_bet` CHECK ((`balance` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profile_balance`
--

LOCK TABLES `profile_balance` WRITE;
/*!40000 ALTER TABLE `profile_balance` DISABLE KEYS */;
/*!40000 ALTER TABLE `profile_balance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profile_settings`
--

DROP TABLE IF EXISTS `profile_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `profile_settings` (
  `profile_setting_id` bigint NOT NULL AUTO_INCREMENT,
  `profile_id` bigint DEFAULT NULL,
  `balance` bigint DEFAULT NULL,
  `status` smallint DEFAULT '0',
  `verification_code` varchar(10) DEFAULT NULL,
  `name` varchar(250) DEFAULT NULL,
  `reference_id` varchar(20) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `password` text,
  `max_stake` float(18,2) NOT NULL DEFAULT '0.00',
  `single_bet_max_stake` float(18,2) DEFAULT '0.00',
  `multibet_bet_max_stake` float(18,2) DEFAULT '0.00',
  `max_daily_possible_win` float(18,2) DEFAULT '0.00',
  PRIMARY KEY (`profile_setting_id`),
  UNIQUE KEY `profile_id` (`profile_id`),
  CONSTRAINT `profile_profile_settings_fk` FOREIGN KEY (`profile_id`) REFERENCES `profile` (`profile_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profile_settings`
--

LOCK TABLES `profile_settings` WRITE;
/*!40000 ALTER TABLE `profile_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `profile_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reversed_deposit`
--

DROP TABLE IF EXISTS `reversed_deposit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reversed_deposit` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `admin_email` varchar(200) NOT NULL,
  `customer_msisdn` bigint NOT NULL,
  `amount` int NOT NULL,
  `mpesa_receipt_code` varchar(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reversed_deposit`
--

LOCK TABLES `reversed_deposit` WRITE;
/*!40000 ALTER TABLE `reversed_deposit` DISABLE KEYS */;
/*!40000 ALTER TABLE `reversed_deposit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_has_permissions`
--

DROP TABLE IF EXISTS `role_has_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role_has_permissions` (
  `permission_id` bigint unsigned NOT NULL,
  `role_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `role_has_permissions_role_id_foreign` (`role_id`),
  CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_has_permissions`
--

LOCK TABLES `role_has_permissions` WRITE;
/*!40000 ALTER TABLE `role_has_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `role_has_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES ('6fMEuKOAzDtFaEvENj9cZFmZqvTzSa8QOpVul5q7',1,'41.139.199.139','Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:133.0) Gecko/20100101 Firefox/133.0','YTo2OntzOjY6Il90b2tlbiI7czo0MDoiUjVIUHozOURKbENySHd2blNsUjZSdE1yRXE0QW42aDhFbk02NHAxeSI7czozOiJ1cmwiO2E6MDp7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjQxOiJodHRwOi8vMTA0LjE5OS4xMDkuMTE3L2FkbWluL3VzZXJzL2NyZWF0ZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjE7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjA6IiQyeSQxMiRiUy5ORnN6N01RTEhtMjBrRml5RWdlU0xiUkR4dnBkQVdxd3Bhc1lMelhGbDk0eWc1QU5RTyI7fQ==',1734732740),('97CQmdY5vNFPgkLso5xF5cvFzL419UJrxJpo3QUb',NULL,'95.214.55.32','','YTozOntzOjY6Il90b2tlbiI7czo0MDoia3R5TkpPdUxhbU94WVJPRW9oNk9Cd04xbFpMN3FoWmd3anByenF6diI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjI6Imh0dHA6Ly8xMDQuMTk5LjEwOS4xMTciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1734729075),('bfPbbVg3MVfq0lThblVSEoXuyyzTdb1KulRrdDVy',NULL,'106.59.248.159','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.112 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiWjloRjUxQjJkRGQ1MmtjQXl6RXJlNW1Odm1majV1VW5GNUhHekE4MSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjI6Imh0dHA6Ly8xMDQuMTk5LjEwOS4xMTciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1734729308),('XPqTzF4YeW9h88bBskWcP8bwYsSCdjNcO2cQbdkn',NULL,'123.158.51.155','','YTozOntzOjY6Il90b2tlbiI7czo0MDoiZGU0WGV6cXZPTjV6bmtDSVNvSVIxYVFQOUthc3Vwb1lmQVFic0xKZSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjI6Imh0dHA6Ly8xMDQuMTk5LjEwOS4xMTciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1734729258),('zW4F1DjXFUxoHCQKqrU1OCh8r8XdaoFlHrCzW8KU',NULL,'185.191.126.213','','YTozOntzOjY6Il90b2tlbiI7czo0MDoicmJRUUs0TVJQbnhiY0UySE12MGJqVFFFVkQ3aG0xNHlLVnpZZ0tIRiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjI6Imh0dHA6Ly8xMDQuMTk5LjEwOS4xMTciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1734730189);
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `surebox_bet`
--

DROP TABLE IF EXISTS `surebox_bet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `surebox_bet` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `profile_id` bigint NOT NULL,
  `bet_amount` float(18,2) DEFAULT NULL,
  `excise_tax` float DEFAULT NULL,
  `tax` float(18,2) DEFAULT NULL,
  `possible_win` float(18,2) DEFAULT NULL,
  `created` timestamp NOT NULL,
  `completed` int DEFAULT '0',
  `winning_odds` float DEFAULT NULL,
  `client_session_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `server_session_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `won` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `check_box_bet_amount_not_negative` CHECK ((`bet_amount` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `surebox_bet`
--

LOCK TABLES `surebox_bet` WRITE;
/*!40000 ALTER TABLE `surebox_bet` DISABLE KEYS */;
/*!40000 ALTER TABLE `surebox_bet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `surebox_bet_session`
--

DROP TABLE IF EXISTS `surebox_bet_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `surebox_bet_session` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `total_bet_amount` float DEFAULT NULL,
  `total_bets` int DEFAULT NULL,
  `total_winning_bets` int DEFAULT NULL,
  `total_win_amount` float DEFAULT NULL,
  `total_lost_amount` float DEFAULT NULL,
  `start_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `end_time` timestamp NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `surebox_bet_session`
--

LOCK TABLES `surebox_bet_session` WRITE;
/*!40000 ALTER TABLE `surebox_bet_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `surebox_bet_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `surebox_client_bet_session`
--

DROP TABLE IF EXISTS `surebox_client_bet_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `surebox_client_bet_session` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `session_id` varchar(128) DEFAULT NULL,
  `profile_id` bigint DEFAULT NULL,
  `surebox_bet_id` bigint DEFAULT NULL,
  `odds` float DEFAULT NULL,
  `box` enum('ONE','TWO','THREE','FOUR','FIVE','SIX','SEVEN','EIGHT','NINE','TEN','ELEVEN','TWELVE','THIRTEEN','FOURTEEN','FIFTEEN','SIXTEEN','SEVENTEEN','EIGHTEEN','NINTEEN','TWENTY') DEFAULT NULL,
  `round_id` int DEFAULT NULL,
  `created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `surebox_client_bet_session`
--

LOCK TABLES `surebox_client_bet_session` WRITE;
/*!40000 ALTER TABLE `surebox_client_bet_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `surebox_client_bet_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transaction`
--

DROP TABLE IF EXISTS `transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transaction` (
  `id` int NOT NULL AUTO_INCREMENT,
  `profile_id` bigint NOT NULL,
  `account` varchar(50) NOT NULL,
  `iscredit` smallint NOT NULL,
  `reference` varchar(255) NOT NULL,
  `amount` decimal(18,2) NOT NULL,
  `running_balance` decimal(10,2) DEFAULT NULL,
  `transaction_type` varchar(255) DEFAULT NULL,
  `partner_transaction_id` varchar(100) DEFAULT NULL,
  `third_party_conversation_id` varchar(255) DEFAULT NULL,
  `created_by` varchar(60) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` varchar(255) DEFAULT 'COMPLETE',
  `reversed_by` varchar(45) DEFAULT NULL,
  `approved_by` varchar(60) DEFAULT NULL,
  `transaction_desc` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `profile_id_reference_iscredit` (`profile_id`,`reference`,`iscredit`),
  KEY `profile_id` (`profile_id`),
  KEY `reference` (`reference`),
  KEY `trx_mpesa_code_idx` (`partner_transaction_id`),
  CONSTRAINT `transaction_ibfk_1` FOREIGN KEY (`profile_id`) REFERENCES `profile` (`profile_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaction`
--

LOCK TABLES `transaction` WRITE;
/*!40000 ALTER TABLE `transaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Reuben Wafula','rubewafula@gmail.com',NULL,'$2y$12$bS.NFsz7MQLHm20kFiyEgeSLbRDxvpdAWqwpasYLzXFl94yg5ANQO',NULL,'2024-12-20 21:20:16','2024-12-20 21:20:16');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_ols`
--

DROP TABLE IF EXISTS `users_ols`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_ols` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `password_hash` text NOT NULL,
  `email` text NOT NULL,
  `auth_key` text NOT NULL,
  `password_reset_token` text,
  `status` varchar(5) NOT NULL,
  `created_at` text NOT NULL,
  `updated_at` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_ols`
--

LOCK TABLES `users_ols` WRITE;
/*!40000 ALTER TABLE `users_ols` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_ols` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `withdrawal`
--

DROP TABLE IF EXISTS `withdrawal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `withdrawal` (
  `withdrawal_id` int NOT NULL AUTO_INCREMENT,
  `inbox_id` int DEFAULT NULL,
  `msisdn` varchar(25) NOT NULL,
  `profile_id` bigint NOT NULL,
  `raw_text` varchar(200) DEFAULT NULL,
  `amount` decimal(64,2) NOT NULL,
  `reference` varchar(50) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by` varchar(45) NOT NULL,
  `status` enum('PROCESSING','QUEUED','SUCCESS','FAILED','TRX_SUCCESS','SENT','CANCELLED','REVERSED','DIRECT TO BANK','RETRIED') DEFAULT NULL,
  `response_status` varchar(250) DEFAULT NULL,
  `provider_reference` varchar(250) DEFAULT NULL,
  `link_id` varchar(100) DEFAULT NULL,
  `number_of_sends` int NOT NULL DEFAULT '0',
  `charge` float NOT NULL DEFAULT '30',
  `max_withdraw` float NOT NULL DEFAULT '10000',
  `network` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`withdrawal_id`),
  KEY `inbox_id` (`inbox_id`),
  KEY `profile_id` (`msisdn`),
  KEY `reference` (`reference`),
  KEY `created` (`created`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `withdrawal`
--

LOCK TABLES `withdrawal` WRITE;
/*!40000 ALTER TABLE `withdrawal` DISABLE KEYS */;
/*!40000 ALTER TABLE `withdrawal` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-12-20 22:30:21

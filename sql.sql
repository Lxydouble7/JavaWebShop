-- MySQL dump 10.13  Distrib 8.0.23, for Win64 (x86_64)
--
-- Host: localhost    Database: eshop
-- ------------------------------------------------------
-- Server version	8.0.23
adminadmin
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
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (1,'admin','123456');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `adminlog`
--

DROP TABLE IF EXISTS `adminlog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `adminlog` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `ip` varchar(45) DEFAULT NULL,
  `in` varchar(45) DEFAULT NULL,
  `out` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adminlog`
--

LOCK TABLES `adminlog` WRITE;
/*!40000 ALTER TABLE `adminlog` DISABLE KEYS */;
INSERT INTO `adminlog` VALUES (1,'admin','0:0:0:0:0:0:0:1','2021-04-19 23:31:50','2021-04-19 23:31:59'),(2,'admin','0:0:0:0:0:0:0:1','2021-04-19 23:32:50','2021-04-19 23:32:51'),(3,'admin','0:0:0:0:0:0:0:1','2021-04-20 20:51:59','2021-04-20 20:53:28'),(4,'admin','0:0:0:0:0:0:0:1','2021-04-20 20:53:31','2021-04-20 20:54:55'),(5,'admin','0:0:0:0:0:0:0:1','2021-04-20 20:54:58','2021-04-20 20:55:19'),(6,'admin','0:0:0:0:0:0:0:1','2021-04-20 20:59:11','2021-04-20 20:59:38'),(7,'admin','0:0:0:0:0:0:0:1','2021-04-20 20:59:40','2021-04-20 21:00:42'),(8,'admin','0:0:0:0:0:0:0:1','2021-04-20 21:00:45','2021-04-20 21:01:22'),(9,'admin','0:0:0:0:0:0:0:1','2021-04-20 21:01:24','2021-04-20 21:01:55'),(10,'admin','0:0:0:0:0:0:0:1','2021-04-20 21:01:58','2021-04-20 21:02:59'),(11,'admin','0:0:0:0:0:0:0:1','2021-04-22 20:12:44','2021-04-22 20:15:29'),(12,'admin','0:0:0:0:0:0:0:1','2021-04-25 20:21:52','2021-04-25 20:24:12');
/*!40000 ALTER TABLE `adminlog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart` (
  `cid` int NOT NULL AUTO_INCREMENT,
  `uid` int DEFAULT NULL,
  `pid` int DEFAULT NULL,
  `number` int DEFAULT NULL,
  `total_price` double DEFAULT NULL,
  `type` varchar(45) DEFAULT NULL,
  `merchant` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `merchant`
--

DROP TABLE IF EXISTS `merchant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `merchant` (
  `mid` int NOT NULL AUTO_INCREMENT,
  `merchantname` varchar(45) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`mid`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `merchant`
--

LOCK TABLES `merchant` WRITE;
/*!40000 ALTER TABLE `merchant` DISABLE KEYS */;
INSERT INTO `merchant` VALUES (1,'sony','sony','sony'),(2,'apple','apple','apple'),(3,'samsung','samsung','samsung'),(4,'dell','dell','dell'),(8,'huawei','huawei','123456');
/*!40000 ALTER TABLE `merchant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `merchantlog`
--

DROP TABLE IF EXISTS `merchantlog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `merchantlog` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `ip` varchar(45) DEFAULT NULL,
  `in` varchar(45) DEFAULT NULL,
  `out` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `merchantlog`
--

LOCK TABLES `merchantlog` WRITE;
/*!40000 ALTER TABLE `merchantlog` DISABLE KEYS */;
INSERT INTO `merchantlog` VALUES (1,'sony','0:0:0:0:0:0:0:1','2021-04-19 23:36:45','2021-04-19 23:36:51'),(2,'sony','0:0:0:0:0:0:0:1','2021-04-22 21:22:30','2021-04-22 21:22:46'),(3,'sony','0:0:0:0:0:0:0:1','2021-04-22 21:25:30','2021-04-22 21:26:24');
/*!40000 ALTER TABLE `merchantlog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `operation`
--

DROP TABLE IF EXISTS `operation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `operation` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user` varchar(45) DEFAULT NULL,
  `time` varchar(45) DEFAULT NULL,
  `ip` varchar(45) DEFAULT NULL,
  `details` varchar(145) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operation`
--

LOCK TABLES `operation` WRITE;
/*!40000 ALTER TABLE `operation` DISABLE KEYS */;
INSERT INTO `operation` VALUES (1,'商户：sony','2021-04-22 21:25:49','0:0:0:0:0:0:0:1','查看商品'),(2,'商户：sony','2021-04-22 21:25:53','0:0:0:0:0:0:0:1','查看订单'),(3,'商户：sony','2021-04-22 21:26:08','0:0:0:0:0:0:0:1','查看商品'),(4,'商户：sony','2021-04-22 21:26:12','0:0:0:0:0:0:0:1','修改商品：5'),(5,'管理员：admin','2021-04-22 21:36:23','0:0:0:0:0:0:0:1','查看统计数据'),(6,'管理员：admin','2021-04-24 16:22:21','0:0:0:0:0:0:0:1','查看用户'),(7,'管理员：admin','2021-04-24 16:55:36','0:0:0:0:0:0:0:1','查看用户'),(8,'管理员：admin','2021-04-24 16:55:56','0:0:0:0:0:0:0:1','查看用户'),(9,'管理员：admin','2021-04-24 16:56:36','0:0:0:0:0:0:0:1','查看用户'),(10,'管理员：admin','2021-04-25 20:54:20','0:0:0:0:0:0:0:1','查看统计数据'),(11,'管理员：admin','2021-04-25 21:38:39','0:0:0:0:0:0:0:1','查看统计数据'),(12,'管理员：admin','2021-04-26 15:52:06','0:0:0:0:0:0:0:1','查看统计数据'),(13,'管理员：admin','2021-04-26 15:55:18','0:0:0:0:0:0:0:1','查看统计数据'),(14,'管理员：admin','2021-04-26 15:58:35','0:0:0:0:0:0:0:1','查看统计数据'),(15,'管理员：admin','2021-04-26 16:02:16','0:0:0:0:0:0:0:1','查看订单'),(16,'管理员：admin','2021-04-26 16:02:20','0:0:0:0:0:0:0:1','查看统计数据'),(17,'管理员：admin','2021-04-26 16:04:56','0:0:0:0:0:0:0:1','查看统计数据'),(18,'管理员：admin','2021-04-26 16:04:59','0:0:0:0:0:0:0:1','查看统计数据'),(19,'管理员：admin','2021-04-26 20:49:03','127.0.0.1','查看统计数据'),(20,'商户：sony','2021-04-26 22:22:49','0:0:0:0:0:0:0:1','查看商品'),(21,'商户：sony','2021-04-26 22:30:55','0:0:0:0:0:0:0:1','查看商品'),(22,'商户：sony','2021-04-26 22:30:58','0:0:0:0:0:0:0:1','修改商品：5'),(23,'商户：sony','2021-04-26 22:31:23','0:0:0:0:0:0:0:1','查看订单'),(24,'管理员：admin','2021-04-26 22:33:58','0:0:0:0:0:0:0:1','查看用户'),(25,'管理员：admin','2021-04-26 22:35:58','0:0:0:0:0:0:0:1','查看商户'),(26,'管理员：admin','2021-04-26 22:37:31','0:0:0:0:0:0:0:1','查看用户'),(27,'管理员：admin','2021-04-26 22:37:32','0:0:0:0:0:0:0:1','查看商户'),(28,'管理员：admin','2021-04-26 22:38:26','0:0:0:0:0:0:0:1','查看商品'),(29,'管理员：admin','2021-04-26 22:39:50','0:0:0:0:0:0:0:1','新建商品类型手机配件'),(30,'管理员：admin','2021-04-26 22:40:00','0:0:0:0:0:0:0:1','查看订单'),(31,'管理员：admin','2021-04-26 22:41:05','0:0:0:0:0:0:0:1','查看订单'),(32,'管理员：admin','2021-04-26 22:41:13','0:0:0:0:0:0:0:1','查看订单'),(33,'管理员：admin','2021-04-26 22:41:23','0:0:0:0:0:0:0:1','查看订单'),(34,'管理员：admin','2021-04-26 22:41:24','0:0:0:0:0:0:0:1','查看订单'),(35,'管理员：admin','2021-04-26 22:41:25','0:0:0:0:0:0:0:1','查看订单'),(36,'管理员：admin','2021-04-26 22:50:02','0:0:0:0:0:0:0:1','查看订单'),(37,'管理员：admin','2021-04-26 22:50:05','0:0:0:0:0:0:0:1','查看订单'),(38,'管理员：admin','2021-04-26 22:50:13','0:0:0:0:0:0:0:1','查看订单'),(39,'管理员：admin','2021-04-26 22:50:16','0:0:0:0:0:0:0:1','查看订单'),(40,'管理员：admin','2021-04-26 22:50:18','0:0:0:0:0:0:0:1','查看订单'),(41,'管理员：admin','2021-04-26 22:50:21','0:0:0:0:0:0:0:1','查看订单'),(42,'管理员：admin','2021-04-26 22:50:24','0:0:0:0:0:0:0:1','查看订单'),(43,'管理员：admin','2021-04-26 22:50:55','0:0:0:0:0:0:0:1','查看统计数据'),(44,'管理员：admin','2021-04-26 22:52:24','0:0:0:0:0:0:0:1','查看统计数据'),(45,'管理员：admin','2021-04-26 23:07:41','0:0:0:0:0:0:0:1','查看统计数据'),(46,'管理员：admin','2021-04-26 23:11:04','0:0:0:0:0:0:0:1','查看统计数据'),(47,'商户：sony','2021-04-28 18:46:21','0:0:0:0:0:0:0:1','查看商品'),(48,'管理员：admin','2021-04-28 19:35:14','0:0:0:0:0:0:0:1','查看商户'),(49,'管理员：admin','2021-04-28 19:36:47','0:0:0:0:0:0:0:1','查看商品'),(50,'管理员：admin','2021-04-28 19:37:59','0:0:0:0:0:0:0:1','查看统计数据');
/*!40000 ALTER TABLE `operation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order` (
  `oid` int NOT NULL AUTO_INCREMENT,
  `uid` int DEFAULT NULL,
  `uname` varchar(45) DEFAULT NULL,
  `address` varchar(128) DEFAULT NULL,
  `telephone` varchar(45) DEFAULT NULL,
  `pid` int DEFAULT NULL,
  `pname` varchar(45) DEFAULT NULL,
  `number` int DEFAULT NULL,
  `total_price` double DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `pay` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `merchant` varchar(45) DEFAULT NULL,
  `type` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`oid`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
INSERT INTO `order` VALUES (1,1,'梁夏雨','华南理工大学','13926248003',1,'iPhone12',1,6299,'2020-11-15 15:51:10','支付宝','864381561@qq.com','apple','手机'),(2,1,'梁夏雨','华南理工大学','13926248003',2,'三星 Galaxy S20 Ultra',1,8999,'2020-11-15 15:53:32','微信支付','864381561@qq.com','samsung','手机'),(3,1,'梁夏雨','华南理工大学','13926248003',1,'Iphone12',1,6299,'2020-11-15 16:10:23','支付宝','864381561@qq.com','apple','手机'),(4,1,'梁夏雨','小谷围','82594865',3,'戴尔G7',1,13499,'2020-11-15 20:45:45','支付宝','201830590130@mail.scut.edu.cn','dell','电脑'),(6,1,'测试1','123','123',3,'戴尔G7',1,13499,'2020-11-15 22:16:17','微信支付','617181','dell','电脑'),(7,1,'测试1','123','123',4,'戴尔XPS 15',7,118993,'2020-11-15 22:16:17','微信支付','617181','dell','电脑'),(8,1,'UNVS','小谷围','82594865',3,'戴尔G7',1,13499,'2020-11-15 22:17:47','货到付款','201830590130@mail.scut.edu.cn','dell','电脑'),(9,1,'UNVS','小谷围','82594865',4,'戴尔XPS 15',1,16999,'2020-11-15 22:17:47','货到付款','201830590130@mail.scut.edu.cn','dell','电脑'),(11,1,'梁夏雨','华南理工大学','82594865',6,'Sony Alpha 7S III',1,23999,'2020-11-15 22:23:25','支付宝','lxy_double7@foxmail.com','sony','相机'),(12,10,'unvs','华南理工大学c12','13926248002',6,'Sony Alpha 7S III',1,23999,'2020-11-16 21:38:27','支付宝','unvs@gmail.com','sony','相机'),(13,10,'梁夏雨','华南理工大学c12','82594865',4,'戴尔XPS 15',1,16999,'2020-11-16 22:54:37','支付宝','lxy_double7@foxmail.com','dell','电脑'),(14,10,'梁夏雨','C12-322','82594865',13,'Sony WH-1000XM4',1,2899,'2020-11-16 22:57:55','支付宝','lxy_double7@foxmail.com','sony','耳机'),(15,10,'梁夏雨','华南理工大学','82594865',13,'Sony WH-1000XM4',1,2899,'2020-11-16 22:59:06','支付宝','lxy_double7@foxmail.com','sony','耳机'),(16,10,'梁夏雨','华南理工大学c12','82594865',2,'三星 Galaxy S20 Ultra',1,8999,'2020-11-16 23:01:27','支付宝','lxy_double7@foxmail.com','samsung','手机'),(17,19,'wyw','123','123123123123',1,'Iphone12',1,6299,'2020-11-16 23:15:58','支付宝','123@123.com','apple','手机'),(18,20,'萧健鹏','北京天安门','13676200058',1,'Iphone12',4,25196,'2020-11-16 23:16:00','支付宝','840165852@qq.com','apple','手机'),(19,10,'测试1','华南理工大学','13926248009',2,'三星 Galaxy S20 Ultra',1,8999,'2020-11-18 21:29:47','微信支付','lxy_double7@foxmail.com','samsung','手机'),(20,10,'测试1','华南理工大学','13926248009',3,'戴尔G7',1,13499,'2020-11-18 21:29:47','微信支付','lxy_double7@foxmail.com','dell','电脑'),(21,10,'测试1','华南理工大学','13926248009',6,'Sony Alpha 7S III',1,23999,'2020-11-18 21:29:47','微信支付','lxy_double7@foxmail.com','sony','相机'),(22,10,'测试1','华南理工大学','13926248009',4,'戴尔XPS 15',1,16999,'2020-11-18 21:29:47','微信支付','lxy_double7@foxmail.com','dell','电脑'),(23,10,'测试1','华南理工大学','13926248009',13,'Sony WH-1000XM4',1,2899,'2020-11-18 21:29:47','微信支付','lxy_double7@foxmail.com','sony','耳机'),(24,10,'CallMeUNVS','华南理工大学','123',2,'三星 Galaxy S20 Ultra',1,8999,'2020-11-18 21:41:23','支付宝','864381561@qq.com','samsung','手机'),(25,10,'CallMeUNVS','华南理工大学','123',6,'Sony Alpha 7S III',1,23999,'2020-11-18 21:41:23','支付宝','864381561@qq.com','sony','相机'),(26,10,'CallMeUNVS','华南理工大学','123',1,'Iphone12',1,6299,'2020-11-18 21:41:23','支付宝','864381561@qq.com','apple','手机'),(27,10,'CallMeUNVS','华南理工大学','123',3,'戴尔G7',1,13499,'2020-11-18 21:41:23','支付宝','864381561@qq.com','dell','电脑'),(28,10,'CallMeUNVS','华南理工大学','123',4,'戴尔XPS 15',1,16999,'2020-11-18 21:41:23','支付宝','864381561@qq.com','dell','电脑'),(29,21,'欧阳学强','广东广州','19927525330',1,'Iphone12',1,6299,'2020-11-19 18:22:28','支付宝','3328607975@qq.com','apple','手机'),(30,10,'lxy','123','1',2,'三星 Galaxy S20 Ultra',1,8999,'2020-11-19 18:23:52','支付宝','864381561@qq.com','samsung','手机'),(31,10,'梁夏雨','C12-322','82594865',2,'三星 Galaxy S20 Ultra',1,8999,'2020-11-19 18:33:23','支付宝','lxy_double7@foxmail.com','samsung','手机'),(32,10,'梁夏雨','华南理工大学c12','82594865',2,'三星 Galaxy S20 Ultra',1,8999,'2020-11-19 18:35:28','支付宝','864381561@qq.com','samsung','手机'),(33,10,'梁夏雨','华南理工大学c12','82594865',6,'Sony Alpha 7S III',1,23999,'2020-11-19 18:36:07','支付宝','lxy_double7@foxmail.com','sony','相机'),(34,14,'梁夏雨','华南理工大学c12','13926248003',2,'三星 Galaxy S20 Ultra',1,8999,'2020-11-19 21:30:00','支付宝','lxy_double7@foxmail.com','samsung','手机'),(35,14,'梁夏雨','华南理工大学c12','13926248003',6,'Sony Alpha 7S III',1,23999,'2020-11-19 21:30:00','支付宝','lxy_double7@foxmail.com','sony','相机'),(36,2,'梁夏雨','华南理工大学c12','82594865',4,'戴尔XPS 15',1,16999,'2020-11-19 22:51:39','支付宝','lxy_double7@foxmail.com','dell','电脑'),(37,22,'测试','广州','123456789',1,'Iphone12',2,12598,'2020-12-04 18:14:58','支付宝','2949683360@qq.com','apple','手机'),(38,22,'测试','广州','123456789',2,'三星 Galaxy S20 Ultra',1,8999,'2020-12-04 18:14:58','支付宝','2949683360@qq.com','samsung','手机'),(39,23,'asdfasf','asdfasdfasdfasdfsadf','11223344556',4,'戴尔XPS 15',1,16999,'2020-12-08 17:49:54','支付宝','asdfasfasf@324.ASF','dell','电脑'),(40,23,'asdfasf','asdfasdfasdfasdfsadf','11223344556',2,'三星 Galaxy S20 Ultra',1,8999,'2020-12-08 17:49:54','支付宝','asdfasfasf@324.ASF','samsung','手机'),(45,1,'lxy','C12','12345678911',4,'戴尔XPS 15',1,16999,'2021-04-24 23:18:02','支付宝','864381561@qq.com','dell','电脑'),(46,1,'lxy','C12','12345678911',3,'戴尔G7',1,13499,'2021-04-24 23:18:02','支付宝','864381561@qq.com','dell','电脑'),(47,1,'lxy','123123123124324','123123',13,'小米手环',1,399,'2021-04-25 20:24:51','支付宝','123123@qqq.com','mi','手环'),(48,1,'lxy','C12','13926248003',9,'PS5',1,3499,'2021-04-25 21:13:04','支付宝','864381561@qq.com','microsoft','游戏机'),(49,1,'lxy','C12','13926248003',7,'Apple_Watch',1,3199,'2021-04-25 21:20:05','支付宝','864381561@qq.com','apple','手表'),(50,1,'lxy','123123123124324','123123',11,'Acer投影仪',1,2899,'2021-04-25 21:24:10','支付宝','1055905911@qq.com','acer','投影仪'),(51,1,'1','1','1',1,'Iphone12',1,6299,'2021-04-25 21:27:26','支付宝','1055905911@qq.com','apple','手机'),(52,1,'lxy','C','13926248003',1,'Iphone12',1,6299,'2021-04-25 21:32:43','支付宝','864381561@qq.com','apple','手机'),(53,1,'l','1','13926248003',4,'戴尔XPS 15',1,16999,'2021-04-25 21:35:12','支付宝','864381561@qq.com','dell','电脑'),(54,1,'l','1','13926248003',5,'Sony Alpha 7S III',1,23999,'2021-04-25 21:38:04','支付宝','864381561@qq.com','sony','相机'),(55,1,'lxy','C12','13926248003',12,'小米扫地机器人',11,14289,'2021-04-26 16:07:17','支付宝','864381561@qq.com','mi','扫地机器人'),(56,1,'lxy','C12','13926248003',12,'小米扫地机器人',1,1299,'2021-04-28 22:55:07','支付宝','lxy_double7@foxmail.com','mi','扫地机器人');
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `pid` int NOT NULL AUTO_INCREMENT,
  `pname` varchar(45) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `image` varchar(45) DEFAULT NULL,
  `image1` varchar(45) DEFAULT NULL,
  `image2` varchar(45) DEFAULT NULL,
  `type` varchar(45) DEFAULT NULL,
  `intro` varchar(256) DEFAULT NULL,
  `stock` int DEFAULT NULL,
  `description` varchar(1024) DEFAULT NULL,
  `merchant` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'Iphone12',6299,'images/product/Iphone12_0.jpg','images/product/Iphone12_1.jpg','images/product/Iphone12_2.jpg','手机','Apple iPhone 12 (A2404) 64GB 蓝色 支持移动联通电信5G 双卡双待手机',9999,'我是Ipone12，这应该是我的自我介绍，但是我不知道说什么好。。。哈哈哈哈哈','apple'),(2,'三星 Galaxy S20 Ultra',8999,'images/product/S20_Ultra_0.jpg','images/product/S20_Ultra_1.jpg','images/product/S20_Ultra_2.jpg','手机','三星 Galaxy S20 Ultra 5G(SM-G9880)双模5G 骁龙865 1.08亿像素 100倍变焦 游戏手机 12GB+256GB 幻游黑',5000,'我是S20，这应该是我的自我介绍，但是我不知道说什么好。。。哈哈哈哈哈','samsung'),(3,'戴尔G7',13499,'images/product/G7_0.jpg','images/product/G7_1.jpg','images/product/G7_2.jpg','电脑','【2020新款】G7 15.6英寸精工合金游戏本 创作版 12区RGB底盘光刃 OLED 4K显示屏',10000,'我是G7，这应该是我的自我介绍，但是我不知道说什么好。。。哈哈哈哈哈','dell'),(4,'戴尔XPS 15',16999,'images/product/XPS15_0.jpg','images/product/XPS15_1.jpg','images/product/XPS15_2.jpg','电脑','【2020新款】XPS 15(9500) 15.6英寸全面屏设计轻薄本 爆款版 创作全面屏/物理防蓝光 1TB固态硬盘',500,'我是XPS15，这应该是我的自我介绍，但是我不知道说什么好。。。哈哈哈哈哈','dell'),(5,'Sony Alpha 7S III',23999,'images/product/Alpha7SIII_0.jpg','images/product/Alpha7SIII_1.jpg','images/product/Alpha7SIII_2.jpg','相机','新开发的BIONZ XR™影像处理器/背照式Exmor R™CMOS影像传感器/ 15+级动态范围*1 /感光度范围扩展可达ISO 40-409600*6 ',500,'我是A7S3，这应该是我的自我介绍，但是我不知道说什么好。。。哈哈哈哈哈','sony'),(6,'WH-1000XM4',2999,'images/product/WH-1000XM4_0.jpg','images/product/WH-1000XM4_1.jpg','images/product/WH-1000XM4_2.jpg','耳机','WH-1000XM4 高解析度头戴式无线降噪立体声耳机 黑色',600,'我是WH-1000XM4，这应该是我的自我介绍，但是我不知道说什么好。。。哈哈哈哈哈','sony'),(7,'Apple_Watch',3199,'images/product/Apple_Watch_0.jpg','images/product/Apple_Watch_1.jpg','images/product/Apple_Watch_2.jpg','手表','Apple Watch Series6 智能手表 GPS款 44毫米深空灰铝金属外壳 黑色运动表带',1000,'我是Apple_Watch，这应该是我的自我介绍，但是我不知道说什么好。。。哈哈哈哈哈','apple'),(8,'Huawei_Watch',2999,'images/product/Huawei_Watch_0.jpg','images/product/Huawei_Watch_1.jpg','images/product/Huawei_Watch_2.jpg','手表','产品介绍产品介绍',5999,'我是Huawei_Watch，这应该是我的自我介绍，但是我不知道说什么好。。。哈哈哈哈哈','huawei'),(9,'PS5',3499,'images/product/PS5_0.jpg','images/product/PS5_1.jpg','images/product/PS5_2.jpg','游戏机','产品介绍产品介绍',2000,'我是PS5，这应该是我的自我介绍','sony'),(10,'Xbox_One',3999,'images/product/Xbox_One_0.jpg','images/product/Xbox_One_1.jpg','images/product/Xbox_One_2.jpg','游戏机','产品介绍产品介绍',1000,'我是XBOX，这应该是我的自我介绍','microsoft'),(11,'Acer投影仪',2899,'images/product/Acer投影仪_0.jpg','images/product/Acer投影仪_1.jpg','images/product/Acer投影仪_2.jpg','投影仪','产品介绍产品介绍',1000,'我是投影仪啊啊啊啊啊啊啊啊啊啊啊','acer'),(12,'小米扫地机器人',1299,'images/product/小米扫地机器人_0.jpg','images/product/小米扫地机器人_1.jpg','images/product/小米扫地机器人_2.jpg','扫地机器人','产品介绍产品介绍',1000,'扫地机器人真不错啊','mi'),(13,'小米手环',399,'images/product/小米手环_0.jpg','images/product/小米手环_1.jpg','images/product/小米手环_2.jpg','手环','产品介绍产品介绍',1000,'小米手环，爱买不买','mi'),(14,'小米投影仪',1999,'images/product/小米投影仪_0.jpg','images/product/小米投影仪_1.jpg','images/product/小米投影仪_2.jpg','投影仪','产品介绍产品介绍',1000,'小米投影仪，爱买不买','mi');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producttype`
--

DROP TABLE IF EXISTS `producttype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producttype` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producttype`
--

LOCK TABLES `producttype` WRITE;
/*!40000 ALTER TABLE `producttype` DISABLE KEYS */;
INSERT INTO `producttype` VALUES (1,'手机'),(2,'电脑'),(3,'耳机'),(4,'相机'),(5,'平板'),(6,'投影仪'),(7,'手表'),(8,'游戏机'),(9,'手环'),(10,'扫地机器人'),(11,'手机配件');
/*!40000 ALTER TABLE `producttype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `uid` int NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `telephone` varchar(45) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `gender` varchar(2) DEFAULT NULL,
  `address` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`uid`),
  UNIQUE KEY `username_UNIQUE` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'lxy','82594865','梁夏雨','864381561@qq.com','13926248003','2000-07-07','男','广东广州'),(2,'test','123456','test','864381561@qq.com','13926248003','2000-07-07','男','华南理工大学'),(10,'unvs','123456','梁夏雨','201830590130@mail.scut.edu.cn','82594865','2020-11-03','男','小谷围'),(14,'test2','123456','test2','1@qq.com','123123123','2020-11-04','男','123'),(15,'test3','123456','test3','test3@test.com','13926248009','2020-11-09','男','华南理工大学'),(16,'测试16','123456','测试','123@qq.com','12345678912','2020-11-16','男','322322'),(18,'白云上的帆船','jichuang1','白云上的帆船','820832107@qq.com','15622111662','2010-03-18','女','华南理工大学大学城校区'),(19,'wyw','123456','wyw','wyw@123.com','12345678900','2020-11-16','男','12345'),(20,'帅得刘翔','123456','萧健鹏','840165852@qq.com','13676200058','2000-11-02','男','广东'),(21,'oyxq','123','oyxq','qqq@qq.com','1111111','2020-11-19','男','11111'),(23,'aabbcc','aabbcc','aabbcc','aabbcc@aabbcc.com','11223344556','2020-12-09','女','231421412342'),(24,'梁夏雨','123456','梁夏雨','864381561@qq.com','82594865','2020-12-10','男','华南理工大学c12'),(25,'d','11111','df','111','111','2019-12-13','男','111'),(26,'qq','123456','采用','1234777','123453534','2020-12-20','男','格式'),(27,'fff','123456','fff','123456','123456','2000-02-05','男','123456'),(28,'1648','82594865','1841','123123@qqq.com','13926248003','2021-04-26','女','123123123124324');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userlog`
--

DROP TABLE IF EXISTS `userlog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userlog` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(45) DEFAULT NULL,
  `ip` varchar(45) DEFAULT NULL,
  `in` varchar(45) DEFAULT NULL,
  `out` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userlog`
--

LOCK TABLES `userlog` WRITE;
/*!40000 ALTER TABLE `userlog` DISABLE KEYS */;
INSERT INTO `userlog` VALUES (1,'lxy','0:0:0:0:0:0:0:1','2021-04-19 23:19:29','2021-04-19 23:19:30'),(2,'test','0:0:0:0:0:0:0:1','2021-04-23 18:29:59','2021-04-23 18:38:13'),(3,'test','0:0:0:0:0:0:0:1','2021-04-24 16:02:34','2021-04-24 16:05:48'),(4,'lxy','0:0:0:0:0:0:0:1','2021-04-24 16:05:54','2021-04-24 16:06:02'),(5,'lxy','0:0:0:0:0:0:0:1','2021-04-25 20:24:20','2021-04-25 20:25:21'),(6,'lxy','0:0:0:0:0:0:0:1','2021-04-26 16:06:34','2021-04-26 16:36:17'),(7,'lxy','0:0:0:0:0:0:0:1','2021-04-26 16:44:50','2021-04-26 16:45:29');
/*!40000 ALTER TABLE `userlog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `viewrecord`
--

DROP TABLE IF EXISTS `viewrecord`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `viewrecord` (
  `id` int NOT NULL AUTO_INCREMENT,
  `uid` int DEFAULT NULL,
  `pid` int DEFAULT NULL,
  `type` varchar(45) DEFAULT NULL,
  `start` varchar(45) DEFAULT NULL,
  `end` varchar(45) DEFAULT NULL,
  `minus` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `viewrecord`
--

LOCK TABLES `viewrecord` WRITE;
/*!40000 ALTER TABLE `viewrecord` DISABLE KEYS */;
INSERT INTO `viewrecord` VALUES (1,1,2,'手机','2021-04-21 00:00:58','2021-04-21 00:01:52','4'),(2,1,1,'手机','2021-04-21 00:03:57','2021-04-21 00:04:00','3'),(3,1,3,'电脑','2021-04-21 00:04:58','2021-04-21 00:05:00','2'),(4,1,4,'电脑','2021-04-21 00:05:42','2021-04-21 00:05:44','1'),(5,1,5,'相机','2021-04-21 00:06:03','2021-04-21 00:06:09','6'),(6,1,6,'耳机','2021-04-21 00:08:24','2021-04-21 00:08:30','5'),(7,2,5,'相机','2021-04-23 18:30:23','2021-04-23 18:30:26','3'),(8,2,5,'相机','2021-04-23 18:30:37','2021-04-23 18:30:38','1'),(9,2,4,'电脑','2021-04-23 18:30:42','2021-04-23 18:30:43','1'),(10,2,4,'电脑','2021-04-23 18:30:46','2021-04-23 18:30:47','1'),(11,2,4,'电脑','2021-04-23 18:30:49','2021-04-23 18:30:51','1'),(12,1,4,'电脑','2021-04-23 18:38:31','2021-04-23 18:38:32','1'),(13,1,4,'电脑','2021-04-23 18:38:35','2021-04-23 18:38:36','1'),(15,1,2,'手机','2021-04-25 20:57:45','2021-04-25 20:59:16','90'),(16,0,2,'手机','2021-04-26 20:43:12','2021-04-26 20:43:13','1');
/*!40000 ALTER TABLE `viewrecord` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-04-28 23:14:45

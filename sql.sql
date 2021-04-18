CREATE DATABASE  IF NOT EXISTS `eshop` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `eshop`;
-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
--
-- Host: localhost    Database: eshop
-- ------------------------------------------------------
-- Server version	8.0.21

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
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES (48,1,6,1,23999),(49,1,4,1,16999),(50,1,13,1,2899),(51,1,3,1,13499),(57,10,4,1,16999),(58,10,6,1,23999);
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
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
  `time` varchar(45) DEFAULT NULL,
  `pay` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`oid`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
INSERT INTO `order` VALUES (1,1,'梁夏雨','华南理工大学','13926248003',1,'iPhone12',1,6299,'2020-11-15 15：51：10','支付宝','864381561@qq.com'),(2,1,'梁夏雨','华南理工大学','13926248003',2,'三星 Galaxy S20 Ultra',1,8999,'2020-11-15 15:53:32','微信支付','864381561@qq.com'),(3,1,'梁夏雨','华南理工大学','13926248003',1,'Iphone12',1,6299,'2020-11-15 16:10:23','支付宝','864381561@qq.com'),(4,1,'梁夏雨','小谷围','82594865',3,'戴尔G7',1,13499,'2020-11-15 20:45:45','支付宝','201830590130@mail.scut.edu.cn'),(6,1,'测试1','123','123',3,'戴尔G7',1,13499,'2020-11-15 22:16:17','微信支付','617181'),(7,1,'测试1','123','123',4,'戴尔XPS 15',7,118993,'2020-11-15 22:16:17','微信支付','617181'),(8,1,'UNVS','小谷围','82594865',3,'戴尔G7',1,13499,'2020-11-15 22:17:47','货到付款','201830590130@mail.scut.edu.cn'),(9,1,'UNVS','小谷围','82594865',4,'戴尔XPS 15',1,16999,'2020-11-15 22:17:47','货到付款','201830590130@mail.scut.edu.cn'),(11,1,'梁夏雨','华南理工大学','82594865',6,'Sony Alpha 7S III',1,23999,'2020-11-15 22:23:25','支付宝','lxy_double7@foxmail.com'),(12,10,'unvs','华南理工大学c12','13926248002',6,'Sony Alpha 7S III',1,23999,'2020-11-16 21:38:27','支付宝','unvs@gmail.com'),(13,10,'梁夏雨','华南理工大学c12','82594865',4,'戴尔XPS 15',1,16999,'2020-11-16 22:54:37','支付宝','lxy_double7@foxmail.com'),(14,10,'梁夏雨','C12-322','82594865',13,'Sony WH-1000XM4',1,2899,'2020-11-16 22:57:55','支付宝','lxy_double7@foxmail.com'),(15,10,'梁夏雨','华南理工大学','82594865',13,'Sony WH-1000XM4',1,2899,'2020-11-16 22:59:06','支付宝','lxy_double7@foxmail.com'),(16,10,'梁夏雨','华南理工大学c12','82594865',2,'三星 Galaxy S20 Ultra',1,8999,'2020-11-16 23:01:27','支付宝','lxy_double7@foxmail.com'),(17,19,'wyw','123','123123123123',1,'Iphone12',1,6299,'2020-11-16 23:15:58','支付宝','123@123.com'),(18,20,'萧健鹏','北京天安门','13676200058',1,'Iphone12',4,25196,'2020-11-16 23:16:00','支付宝','840165852@qq.com'),(19,10,'测试1','华南理工大学','13926248009',2,'三星 Galaxy S20 Ultra',1,8999,'2020-11-18 21:29:47','微信支付','lxy_double7@foxmail.com'),(20,10,'测试1','华南理工大学','13926248009',3,'戴尔G7',1,13499,'2020-11-18 21:29:47','微信支付','lxy_double7@foxmail.com'),(21,10,'测试1','华南理工大学','13926248009',6,'Sony Alpha 7S III',1,23999,'2020-11-18 21:29:47','微信支付','lxy_double7@foxmail.com'),(22,10,'测试1','华南理工大学','13926248009',4,'戴尔XPS 15',1,16999,'2020-11-18 21:29:47','微信支付','lxy_double7@foxmail.com'),(23,10,'测试1','华南理工大学','13926248009',13,'Sony WH-1000XM4',1,2899,'2020-11-18 21:29:47','微信支付','lxy_double7@foxmail.com'),(24,10,'CallMeUNVS','华南理工大学','123',2,'三星 Galaxy S20 Ultra',1,8999,'2020-11-18 21:41:23','支付宝','864381561@qq.com'),(25,10,'CallMeUNVS','华南理工大学','123',6,'Sony Alpha 7S III',1,23999,'2020-11-18 21:41:23','支付宝','864381561@qq.com'),(26,10,'CallMeUNVS','华南理工大学','123',1,'Iphone12',1,6299,'2020-11-18 21:41:23','支付宝','864381561@qq.com'),(27,10,'CallMeUNVS','华南理工大学','123',3,'戴尔G7',1,13499,'2020-11-18 21:41:23','支付宝','864381561@qq.com'),(28,10,'CallMeUNVS','华南理工大学','123',4,'戴尔XPS 15',1,16999,'2020-11-18 21:41:23','支付宝','864381561@qq.com'),(29,21,'欧阳学强','广东广州','19927525330',1,'Iphone12',1,6299,'2020-11-19 18:22:28','支付宝','3328607975@qq.com'),(30,10,'lxy','123','1',2,'三星 Galaxy S20 Ultra',1,8999,'2020-11-19 18:23:52','支付宝','864381561@qq.com'),(31,10,'梁夏雨','C12-322','82594865',2,'三星 Galaxy S20 Ultra',1,8999,'2020-11-19 18:33:23','支付宝','lxy_double7@foxmail.com'),(32,10,'梁夏雨','华南理工大学c12','82594865',2,'三星 Galaxy S20 Ultra',1,8999,'2020-11-19 18:35:28','支付宝','864381561@qq.com'),(33,10,'梁夏雨','华南理工大学c12','82594865',6,'Sony Alpha 7S III',1,23999,'2020-11-19 18:36:07','支付宝','lxy_double7@foxmail.com'),(34,14,'梁夏雨','华南理工大学c12','13926248003',2,'三星 Galaxy S20 Ultra',1,8999,'2020-11-19 21:30:00','支付宝','lxy_double7@foxmail.com'),(35,14,'梁夏雨','华南理工大学c12','13926248003',6,'Sony Alpha 7S III',1,23999,'2020-11-19 21:30:00','支付宝','lxy_double7@foxmail.com'),(36,2,'梁夏雨','华南理工大学c12','82594865',4,'戴尔XPS 15',1,16999,'2020-11-19 22:51:39','支付宝','lxy_double7@foxmail.com'),(37,22,'测试','广州','123456789',1,'Iphone12',2,12598,'2020-12-04 18:14:58','支付宝','2949683360@qq.com'),(38,22,'测试','广州','123456789',2,'三星 Galaxy S20 Ultra',1,8999,'2020-12-04 18:14:58','支付宝','2949683360@qq.com'),(39,23,'asdfasf','asdfasdfasdfasdfsadf','11223344556',4,'戴尔XPS 15',1,16999,'2020-12-08 17:49:54','支付宝','asdfasfasf@324.ASF'),(40,23,'asdfasf','asdfasdfasdfasdfsadf','11223344556',2,'三星 Galaxy S20 Ultra',1,8999,'2020-12-08 17:49:54','支付宝','asdfasfasf@324.ASF');
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
  `type` int DEFAULT NULL,
  `intro` varchar(256) DEFAULT NULL,
  `stock` int DEFAULT NULL,
  `description` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'Iphone12',6299,'images/product/Iphone12_0.jpg','images/product/Iphone12_1.jpg','images/product/Iphone12_2.jpg',1,'Apple iPhone 12 (A2404) 64GB 蓝色 支持移动联通电信5G 双卡双待手机',9999,'我是Ipone12，这应该是我的自我介绍，但是我不知道说什么好。。。哈哈哈哈哈'),(2,'三星 Galaxy S20 Ultra',8999,'images/product/S20_Ultra_0.jpg','images/product/S20_Ultra_1.jpg','images/product/S20_Ultra_2.jpg',1,'三星 Galaxy S20 Ultra 5G(SM-G9880)双模5G 骁龙865 1.08亿像素 100倍变焦 游戏手机 12GB+256GB 幻游黑',5000,'我是S20，这应该是我的自我介绍，但是我不知道说什么好。。。哈哈哈哈哈'),(3,'戴尔G7',13499,'images/product/G7_0.jpg','images/product/G7_1.jpg','images/product/G7_2.jpg',2,'【2020新款】G7 15.6英寸精工合金游戏本 创作版 12区RGB底盘光刃 OLED 4K显示屏',10000,'我是G7，这应该是我的自我介绍，但是我不知道说什么好。。。哈哈哈哈哈'),(4,'戴尔XPS 15',16999,'images/product/XPS15_0.jpg','images/product/XPS15_1.jpg','images/product/XPS15_2.jpg',2,'【2020新款】XPS 15(9500) 15.6英寸全面屏设计轻薄本 爆款版 创作全面屏/物理防蓝光 1TB固态硬盘',500,'我是XPS15，这应该是我的自我介绍，但是我不知道说什么好。。。哈哈哈哈哈'),(6,'Sony Alpha 7S III',23999,'images/product/Alpha7SIII_0.jpg','images/product/Alpha7SIII_1.jpg','images/product/Alpha7SIII_2.jpg',4,'新开发的BIONZ XR™影像处理器/背照式Exmor R™CMOS影像传感器/ 15+级动态范围*1 /感光度范围扩展可达ISO 40-409600*6 ',500,'我是A7S3，这应该是我的自我介绍，但是我不知道说什么好。。。哈哈哈哈哈'),(13,'Sony WH-1000XM4',2899,'images/product/WH-1000XM4_2.jpg','images/product/WH-1000XM4_2.jpg','images/product/WH-1000XM4_2.jpg',1,'WH-1000XM4 高解析度头戴式无线降噪立体声耳机 黑色',600,'我是WH-1000XM4，这应该是我的自我介绍，但是我不知道说什么好。。。哈哈哈哈哈');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'lxy','82594865','梁夏雨','864381561@qq.com','13926248003','2000-07-07','男','广东广州'),(2,'test','123456','test','864381561@qq.com','13926248003','2000-07-07','男','华南理工大学'),(10,'unvs','123456','梁夏雨','201830590130@mail.scut.edu.cn','82594865','2020-11-03','男','小谷围'),(14,'test2','123456','test2','1@qq.com','123123123','2020-11-04','男','123'),(15,'test3','123456','test3','test3@test.com','13926248009','2020-11-09','男','华南理工大学'),(16,'测试16','123456','测试','123@qq.com','12345678912','2020-11-16','男','322322'),(18,'白云上的帆船','jichuang1','白云上的帆船','820832107@qq.com','15622111662','2010-03-18','女','华南理工大学大学城校区'),(19,'wyw','123456','wyw','wyw@123.com','12345678900','2020-11-16','男','12345'),(20,'帅得刘翔','123456','萧健鹏','840165852@qq.com','13676200058','2000-11-02','男','广东'),(21,'oyxq','123','oyxq','qqq@qq.com','1111111','2020-11-19','男','11111'),(23,'aabbcc','aabbcc','aabbcc','aabbcc@aabbcc.com','11223344556','2020-12-09','女','231421412342'),(24,'梁夏雨','123456','梁夏雨','864381561@qq.com','82594865','2020-12-10','男','华南理工大学c12'),(25,'d','11111','df','111','111','2019-12-13','男','111'),(26,'qq','123456','采用','1234777','123453534','2020-12-20','男','格式'),(27,'fff','123456','fff','123456','123456','2000-02-05','男','123456');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'eshop'
--

--
-- Dumping routines for database 'eshop'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-04-18 16:17:08

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
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES (30,1,1,1,6299);
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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
INSERT INTO `order` VALUES (1,1,'梁夏雨','华南理工大学','13926248003',1,'Iphone12',1,6299,'2020-11-15 15：51：10','支付宝','864381561@qq.com'),(2,1,'梁夏雨','华南理工大学','13926248003',2,'三星 Galaxy S20 Ultra',1,8999,'2020-11-15 15:53:32','微信支付','864381561@qq.com'),(3,1,'梁夏雨','华南理工大学','13926248003',1,'Iphone12',1,6299,'2020-11-15 16:10:23','支付宝','864381561@qq.com'),(4,1,'梁夏雨','小谷围','82594865',3,'戴尔G7',1,13499,'2020-11-15 20:45:45','支付宝','201830590130@mail.scut.edu.cn'),(6,1,'测试1','123','123',3,'戴尔G7',1,13499,'2020-11-15 22:16:17','微信支付','617181'),(7,1,'测试1','123','123',4,'戴尔XPS 15',7,118993,'2020-11-15 22:16:17','微信支付','617181'),(8,1,'UNVS','小谷围','82594865',3,'戴尔G7',1,13499,'2020-11-15 22:17:47','货到付款','201830590130@mail.scut.edu.cn'),(9,1,'UNVS','小谷围','82594865',4,'戴尔XPS 15',1,16999,'2020-11-15 22:17:47','货到付款','201830590130@mail.scut.edu.cn'),(11,1,'梁夏雨','华南理工大学','82594865',6,'Sony Alpha 7S III',1,23999,'2020-11-15 22:23:25','支付宝','lxy_double7@foxmail.com'),(12,10,'unvs','华南理工大学c12','13926248002',6,'Sony Alpha 7S III',1,23999,'2020-11-16 21:38:27','支付宝','unvs@gmail.com');
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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'lxy','82594865','梁夏雨','864381561@qq.com','13926248003','2000-07-07','男','广东广州'),(10,'unvs','123456','梁夏雨','201830590130@mail.scut.edu.cn','82594865','2020-11-03','男','小谷围'),(14,'test2','123456','test2','1@qq.com','123123123','2020-11-04','男','123'),(15,'test3','123456','test3','test3@test.com','13926248009','2020-11-09','男','华南理工大学');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-11-16 21:45:00

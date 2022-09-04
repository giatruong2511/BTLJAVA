-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: localhost    Database: bus
-- ------------------------------------------------------
-- Server version	8.0.28

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
-- Table structure for table `booking`
--

DROP TABLE IF EXISTS `booking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `booking` (
  `id` int NOT NULL AUTO_INCREMENT,
  `numberticket` int NOT NULL,
  `booking_date` datetime NOT NULL,
  `totalmoney` decimal(10,0) NOT NULL,
  `user_id` int DEFAULT NULL,
  `buses_id` int DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `book_idx` (`user_id`),
  KEY `booking_idx` (`buses_id`),
  CONSTRAINT `book` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `booking` FOREIGN KEY (`buses_id`) REFERENCES `buses` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booking`
--

LOCK TABLES `booking` WRITE;
/*!40000 ALTER TABLE `booking` DISABLE KEYS */;
INSERT INTO `booking` VALUES (5,5,'2022-09-04 09:53:43',550000,1,10,'Test','1','test1@gmail.com'),(6,3,'2022-09-04 09:53:59',330000,1,10,'Test2','2','test2@gmail.com'),(7,2,'2022-09-04 10:00:10',200000,1,8,'test3','3','test3@gmail.com'),(8,2,'2022-09-04 10:00:32',200000,1,7,'test4','4','test4@gmail.com'),(9,5,'2022-09-04 10:00:46',500000,1,7,'test5','5','test5@gmail.com'),(10,5,'2022-09-04 10:02:37',550000,1,9,'test6','6','test6@gmail.com'),(11,1,'2022-09-04 10:02:48',110000,1,9,'test7','7','test7@gmail.com'),(12,10,'2022-09-04 10:03:44',1000000,1,5,'test8','8','test8@gmail.com'),(13,2,'2022-09-04 10:05:01',240000,1,3,'test9','1','test9@gmail.com'),(14,3,'2022-09-04 10:05:36',360000,1,1,'test10','10','test10@gmail.com');
/*!40000 ALTER TABLE `booking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `buses`
--

DROP TABLE IF EXISTS `buses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `buses` (
  `id` int NOT NULL AUTO_INCREMENT,
  `price` decimal(10,0) NOT NULL,
  `time` datetime NOT NULL,
  `delivery` int DEFAULT NULL,
  `route_id` int DEFAULT NULL,
  `car_id` int DEFAULT NULL,
  `hours` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `buses_idx` (`car_id`),
  KEY `buses_idx1` (`route_id`),
  CONSTRAINT `car_fk` FOREIGN KEY (`car_id`) REFERENCES `car` (`id`),
  CONSTRAINT `route_fk` FOREIGN KEY (`route_id`) REFERENCES `route` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `buses`
--

LOCK TABLES `buses` WRITE;
/*!40000 ALTER TABLE `buses` DISABLE KEYS */;
INSERT INTO `buses` VALUES (1,120000,'2020-08-30 00:00:00',0,1,1,'08:00'),(2,120000,'2020-08-30 00:00:00',0,1,2,'09:00'),(3,120000,'2022-09-03 23:14:42',1,1,3,'19:00'),(4,120000,'2022-09-03 23:15:29',1,1,2,'22:00'),(5,100000,'2022-09-05 23:20:45',0,15,4,'06:00'),(6,100000,'2022-09-05 23:21:38',0,15,2,'10:00'),(7,100000,'2022-09-06 00:08:00',0,15,1,'17:00'),(8,100000,'2022-09-06 00:09:00',0,15,2,'29:00'),(9,110000,'2022-09-05 00:08:00',1,10,3,'10:00'),(10,110000,'2022-09-05 00:08:00',0,10,1,'22:00');
/*!40000 ALTER TABLE `buses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bushome`
--

DROP TABLE IF EXISTS `bushome`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bushome` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_date` datetime DEFAULT NULL,
  `active` bit(1) DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `userid_idx` (`user_id`),
  CONSTRAINT `userid` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bushome`
--

LOCK TABLES `bushome` WRITE;
/*!40000 ALTER TABLE `bushome` DISABLE KEYS */;
INSERT INTO `bushome` VALUES (1,'Nhà Xe Hoa Mai','292 Đinh Bộ Lĩnh, P.26 Q.Bình Thạnh, Tp.HCM','0888888888','https://res.cloudinary.com/nvt251101/image/upload/v1662133511/rau9yjlpkz2nc5rwrvfg.png','hoamai@gmail.com','2020-01-12 00:00:00',_binary '',1),(2,'Nhà Xe Phương Trang','21 Hùng Vương P9. Q.5 Tp.HCM','0888888888','https://res.cloudinary.com/nvt251101/image/upload/v1662134203/gzhehqaxyblqvblnhuup.png','longvan@gmail.com','2020-01-12 00:00:00',_binary '',7),(4,'Nhà Xe Bắc Tây','43 Hùng Vương P.9 Q.Gò Vấp Tp.HCM','0888888888','https://res.cloudinary.com/nvt251101/image/upload/v1660886982/ckk4cnwd9tj8tlpfbsgn.jpg','bactay@gmail.com','2020-01-12 00:00:00',_binary '',2),(5,'Nhà Xe Toàn Thắng','156 Hoàng Hoa Thám P5 Q.Bình Thạnh Tp.HCM','0666666666','https://res.cloudinary.com/nvt251101/image/upload/v1662133729/ajvhujdmsbvze8iivqmc.png','toanthang@gmail.com','2020-01-12 00:00:00',_binary '',3),(6,'Nhà Xe Bi Bi','3 Nguyễn Thông P6 Q.3 Tp.HCM','0866666666','https://res.cloudinary.com/nvt251101/image/upload/v1660886982/ckk4cnwd9tj8tlpfbsgn.jpg','saigonbus@gmail.com','2022-08-18 22:57:14',_binary '',4),(7,'Nhà Xe Bo Bo','371 Nguyễn Kiệm P.3 Q.Gò Vấp Tp.HCM','0866666666','https://res.cloudinary.com/nvt251101/image/upload/v1660886982/ckk4cnwd9tj8tlpfbsgn.jpg','hoamai@gmail.com','2022-08-18 23:40:16',_binary '',5),(8,'Nhà Xe Tin Tin','260 Lê Văn Sỹ P.1 Q.Tân Bình Tp.HCM','0866666666','https://res.cloudinary.com/nvt251101/image/upload/v1660886982/ckk4cnwd9tj8tlpfbsgn.jpg','thanhbuoi@gmail.com','2022-08-19 12:29:43',_binary '',6);
/*!40000 ALTER TABLE `bushome` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `car`
--

DROP TABLE IF EXISTS `car`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `car` (
  `id` int NOT NULL AUTO_INCREMENT,
  `licenseplate` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `seats` int NOT NULL,
  `active` bit(1) DEFAULT NULL,
  `bushome_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `car_idx` (`bushome_id`),
  CONSTRAINT `car` FOREIGN KEY (`bushome_id`) REFERENCES `bushome` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `car`
--

LOCK TABLES `car` WRITE;
/*!40000 ALTER TABLE `car` DISABLE KEYS */;
INSERT INTO `car` VALUES (1,'51F1-66666',30,_binary '',1),(2,'51F1-66688',35,_binary '',1),(3,'56A2-12345',45,_binary '',2),(4,'56A2-45678',40,_binary '',1),(5,'59A2-45678',25,_binary '',1);
/*!40000 ALTER TABLE `car` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_date` datetime NOT NULL,
  `user_id` int NOT NULL,
  `bushome_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fr_bushomeid_idx` (`bushome_id`),
  KEY `fr_user_idx` (`user_id`),
  CONSTRAINT `fr_bushomeid` FOREIGN KEY (`bushome_id`) REFERENCES `bushome` (`id`),
  CONSTRAINT `fr_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES (1,'Tuyệt vời','2022-06-20 00:00:00',1,1),(2,'Test','2022-07-07 23:57:00',9,1),(3,'Test tiếp nè','2022-08-01 23:57:18',1,1),(4,'Test lần nữa','2022-08-25 23:57:43',1,1),(5,'Test thêm nữa','2022-09-01 00:03:45',1,1),(6,'Test lần đầu','2022-08-01 22:24:58',1,2),(7,'Test lần 2','2022-08-15 16:04:04',9,2),(8,'Test lần 3','2022-08-28 16:10:54',9,2),(9,'Test lần cuối','2022-09-03 16:11:12',1,2),(10,'Hí','2022-08-03 00:17:59',1,5),(11,'hí hí','2022-08-15 23:48:16',1,5),(12,'hí hí hí','2022-09-03 17:26:41',9,5),(13,'hí hí hí hí','2022-09-03 17:53:02',9,5),(14,'Test lần nữa nè ','2022-09-04 10:15:07',9,1);
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `route`
--

DROP TABLE IF EXISTS `route`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `route` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `startingPOS` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `endPOS` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` bit(1) DEFAULT NULL,
  `bushome_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `router_idx` (`bushome_id`),
  CONSTRAINT `router` FOREIGN KEY (`bushome_id`) REFERENCES `bushome` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `route`
--

LOCK TABLES `route` WRITE;
/*!40000 ALTER TABLE `route` DISABLE KEYS */;
INSERT INTO `route` VALUES (1,'Đà Nẵng - Quảng Ngãi','Đà Nẵng','Quảng Ngãi',_binary '',1),(2,'Đà Nẵng - Đắk Lắk','Đà Nẵng','Đắk Lắk',_binary '',1),(3,'Quảng Ngãi - Đắk Lắk','Quảng Ngãi','Đắk Lắk',_binary '',1),(4,'Sài Gòn - Phú Yên','Sài Gòn','Phú Yên',_binary '',1),(5,'Đông Hòa - Sài Gòn','Đông Hòa','Sài Gòn',_binary '',1),(6,'Bình Dương - Phú Yên','Bình Dương','Phú Yên',_binary '',1),(7,'Sài Gòn - Khánh Hòa','Sài Gòn','Khánh Hòa',_binary '',1),(8,'Sài Gòn - Cà Mau','Sài Gòn','Cà Mau',_binary '',1),(9,'Sài Gòn - Đà Lạt','Sài Gòn ','Đà Lạt',_binary '',5),(10,'Sài Gòn - Vũng Tàu','Sài Gòn','Vũng Tàu',_binary '',5),(11,'Vũng Tàu - Sài Gòn','Vũng Tàu','Sài Gòn',_binary '',5),(12,'Đà Lạt - Sài Gòn','Đà Lạt','Sài Gòn',_binary '',5),(13,'Sài Gòn - Sóc Trăng','Sài Gòn','Sóc Trăng',_binary '',4),(14,'Sài Gòn - Bạc Liêu','Sài Gòn','Bạc Liêu',_binary '',4),(15,'Đà Lạt - Sài Gòn','Đà Lạt','Sài Gòn',_binary '',2),(16,'Sài Gòn - Hà Nội','Sài Gòn','Hà Nội',_binary '',2);
/*!40000 ALTER TABLE `route` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` bit(1) NOT NULL DEFAULT b'1',
  `user_role` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Trường','Nguyễn Văn','giatruong251101@gmail.com','0866666666','nvt','$2a$10$vbEh19K1FP0ckJvdD8p/G.e975orPIbsK8Oa07iVm4kFwVXyggZV2',_binary '\0','ROLE_ADMIN','https://res.cloudinary.com/nvt251101/image/upload/v1662133079/haoqfhaiili0zevvzzwr.png'),(2,'Trường','Nguyễn Văn','saigonbus@gmail.com','0866666666','adminssss','$2a$10$vbEh19K1FP0ckJvdD8p/G.e975orPIbsK8Oa07iVm4kFwVXyggZV2',_binary '\0','ROLE_BUSHOME','https://res.cloudinary.com/nvt251101/image/upload/v1662133079/haoqfhaiili0zevvzzwr.png'),(3,'Trường','Nguyễn Văn','giatruong251101@gmail.com','0866666666','nvta','$2a$10$vbEh19K1FP0ckJvdD8p/G.e975orPIbsK8Oa07iVm4kFwVXyggZV2',_binary '\0','ROLE_USER','https://res.cloudinary.com/nvt251101/image/upload/v1662133079/haoqfhaiili0zevvzzwr.png'),(4,'Trường','Nguyễn Văn','hoamai@gmail.com','0866666666','nh','$2a$10$E/Z0NMXpJai82/97pK0OQeLzOBJOg63Va.zEsIKTD4tzCpAz7A3kW',_binary '\0','ROLE_USER','https://res.cloudinary.com/nvt251101/image/upload/v1662133079/haoqfhaiili0zevvzzwr.png'),(5,'Trường','Nguyễn Văn','toanhoa@gmail.com','0866666666','aa','$2a$10$9vAWNRP53x9G/9LiqtwDE.5Q74oRIAOyL7hD2ek7hhhPpY7otfEu2',_binary '\0','ROLE_USER','https://res.cloudinary.com/nvt251101/image/upload/v1662133079/haoqfhaiili0zevvzzwr.png'),(6,'Trường','Nguyễn Văn','saigonbus@gmail.com','0866666666','dede','$2a$10$CRxWm5q9QoYQtkS2rJrw0eRgtY8FQmF1H2f3gm9Z6mDP.FDxzHlPG',_binary '\0','ROLE_USER','https://res.cloudinary.com/nvt251101/image/upload/v1662133079/haoqfhaiili0zevvzzwr.png'),(7,'Trường','Nguyễn Văn','giatruong251101@gmail.com','0866666666','sdsd','$2a$10$5x522WXBOAxrzjuTJXdqIeaRLKoICLIBkQetzeGtaDGOZiC9qm6EO',_binary '\0','ROLE_BUSHOME','https://res.cloudinary.com/nvt251101/image/upload/v1662133079/haoqfhaiili0zevvzzwr.png'),(8,'Trường','Nguyễn Văn','toanhoa@gmail.com','0866666666','nvttt','$2a$10$bUI/djE0SVz9zsRlNqIE9eMvYUTMq7iskpPR70IQC95wdMswVdPTK',_binary '\0','ROLE_USER','https://res.cloudinary.com/nvt251101/image/upload/v1662133079/haoqfhaiili0zevvzzwr.png'),(9,'Tiến','Đỗ Minh','minhtien@gmail.com','0888668668','minhtien','$2a$10$qZrR6jmSTOaC7VAKE0D9nuh1CPv4vk75iVYIiHOhux1XpR94dJgzC',_binary '\0','ROLE_ADMIN','https://res.cloudinary.com/nvt251101/image/upload/v1662257739/d3rfoxu7k64immot4goz.png');
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

-- Dump completed on 2022-09-04 10:23:19

-- MySQL dump 10.13  Distrib 5.6.23, for Win64 (x86_64)
--
-- Host: localhost    Database: bohua_train
-- ------------------------------------------------------
-- Server version	5.6.17

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
-- Table structure for table `bh_dictionary_header`
--

DROP TABLE IF EXISTS `bh_dictionary_header`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bh_dictionary_header` (
  `header_code` varchar(50) NOT NULL COMMENT '大类代码',
  `header_name` varchar(50) DEFAULT NULL COMMENT '大类名称',
  `dictionary_type` varchar(10) DEFAULT NULL COMMENT '系统：SYS;\n            用户字典项：USE;\n            如果是系统维护的头表字段在使用中是不能够维护的',
  `memo` varchar(100) DEFAULT NULL COMMENT '备注',
  `add_time` datetime DEFAULT NULL COMMENT '添加时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `enabled_flag` varchar(1) DEFAULT 'Y' COMMENT '是否可用，Y：可用，N：禁用',
  PRIMARY KEY (`header_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bh_dictionary_header`
--

LOCK TABLES `bh_dictionary_header` WRITE;
/*!40000 ALTER TABLE `bh_dictionary_header` DISABLE KEYS */;
INSERT INTO `bh_dictionary_header` VALUES ('232','dsadsasdadsa','user','dfssdfsdfsdfds','2016-11-04 10:17:04','2016-11-04 10:28:11','N'),('COURSE','课程','user','课程分类',NULL,NULL,'Y'),('DICTIONARYTYPE','配置类型','system','系统配置类型',NULL,NULL,'Y'),('dsadasdas','dasdas','system','xzCzXCZcZcZzcz11111111cZXcdsadasd!!!!!','2016-10-26 15:47:55','2016-11-04 10:28:11','N');
/*!40000 ALTER TABLE `bh_dictionary_header` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-11-22 15:42:13

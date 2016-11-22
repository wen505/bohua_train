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
-- Table structure for table `bh_dictionary_line`
--

DROP TABLE IF EXISTS `bh_dictionary_line`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bh_dictionary_line` (
  `line_id` int(11) NOT NULL AUTO_INCREMENT,
  `header_code` varchar(50) DEFAULT NULL COMMENT '大类代码',
  `line_code` varchar(50) DEFAULT NULL COMMENT '值',
  `sn` int(11) DEFAULT NULL COMMENT '小类序列',
  `line_name` varchar(120) DEFAULT NULL COMMENT '小类名称',
  `is_default` varchar(1) DEFAULT 'Y' COMMENT 'Y：默认值，N：非默认值',
  `memo` varchar(200) DEFAULT NULL COMMENT '备注',
  `enabled_flag` varchar(1) DEFAULT 'Y' COMMENT '是否可用，Y：可用，N：禁用',
  PRIMARY KEY (`line_id`),
  UNIQUE KEY `bh_dictionary_line_index` (`header_code`,`line_code`,`enabled_flag`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='字典行表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bh_dictionary_line`
--

LOCK TABLES `bh_dictionary_line` WRITE;
/*!40000 ALTER TABLE `bh_dictionary_line` DISABLE KEYS */;
INSERT INTO `bh_dictionary_line` VALUES (1,'COURSE','1',1,'语文','N','撒的撒打算','Y'),(2,'COURSE','2',2,'数学','Y','ADASASSA','Y'),(3,'COURSE','yy',3,'英语','N','','N'),(4,'COURSE','yyd',3,'英语','N','','N'),(5,'COURSE','12',1,'语文','N','撒的撒打算','Y'),(6,'DICTIONARYTYPE','system',1,'系统','Y',NULL,'Y'),(7,'DICTIONARYTYPE','user',2,'自定义','Y',NULL,'Y'),(8,'COURSE','3',3,'外语','Y','打算打算','Y');
/*!40000 ALTER TABLE `bh_dictionary_line` ENABLE KEYS */;
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

-- MySQL dump 10.13  Distrib 5.7.29, for Linux (x86_64)
--
-- Host: localhost    Database: dgsogp_admin_db
-- ------------------------------------------------------
-- Server version	5.7.29-0ubuntu0.18.04.1

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
-- Current Database: `dgsogp_admin_db`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `dgsogp_admin_db` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `dgsogp_admin_db`;

--
-- Table structure for table `databaseinterfaces`
--

DROP TABLE IF EXISTS `databaseinterfaces`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `databaseinterfaces` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '数据库接口ID',
  `type` int(1) NOT NULL COMMENT '数据库类型\n0	mysql\n1	mongodb',
  `wserver` varchar(255) NOT NULL COMMENT '工作服务器',
  `wport` varchar(255) NOT NULL COMMENT '工作端口',
  `name` varchar(255) NOT NULL COMMENT '数据库名',
  `datasource_id` int(11) NOT NULL COMMENT '数据源ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `datainterfaces`
--

DROP TABLE IF EXISTS `datainterfaces`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `datainterfaces` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '入库数据ID',
  `type` int(1) NOT NULL COMMENT '数据库类型\n0	mysql\n1	mongodb',
  `name` varchar(255) NOT NULL COMMENT '表名/集合名',
  `metadata_id` int(11) NOT NULL COMMENT '元数据ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `datasources`
--

DROP TABLE IF EXISTS `datasources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `datasources` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '数据源ID',
  `wgroup` varchar(45) NOT NULL COMMENT '工作组',
  `wserver` varchar(45) NOT NULL COMMENT '工作服务器',
  `type` int(1) NOT NULL COMMENT '数据源类型\n文件	0\n目录	1\n数据库	2',
  `source` varchar(255) NOT NULL COMMENT '文件、目录	文件系统路径\\n数据库			数据库类型-端口号-数据库名称	例如	mysql-3306-xxxx_db',
  `putindb` int(1) DEFAULT NULL COMMENT '是否入库\n是	0\n否	1',
  `related` int(1) NOT NULL COMMENT '是否关系型数据\n是	0\n否	1',
  `pattern` int(1) DEFAULT NULL COMMENT '数据源处理方式\n只扫描一次	0\n每天扫描一次	1',
  `target` varchar(255) DEFAULT NULL COMMENT 'hadoop存储路径',
  `state` int(1) NOT NULL COMMENT '数据源处理状态\\n未处理	0	未采集到hadoop\\n处理中	1	每天持续扫描类型，可认为修改为已完成\\n已完成	2	已采集到hadoop',
  `content` varchar(255) DEFAULT NULL COMMENT '数据备注\\n可有可无的数据备注，起说明作用',
  `excepted` int(1) NOT NULL COMMENT '异常状态\n正常	0\n异常	1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `hadoopsources`
--

DROP TABLE IF EXISTS `hadoopsources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hadoopsources` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `state` int(1) NOT NULL COMMENT '标记处理状态\n未处理	0	未标记\n处理中	1	每天持续扫描类型,dstate人为调整为完成时，hstate、mstate自动调整为未处理\n已完成	2	已标记',
  `source` varchar(255) NOT NULL COMMENT 'HDFS路径',
  `datasource_id` int(11) NOT NULL COMMENT '数据源ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '消息ID',
  `name` varchar(255) NOT NULL COMMENT '消息名',
  `content` varchar(255) NOT NULL COMMENT '消息内容',
  `status` int(1) NOT NULL COMMENT '消息状态\n0 未读\n1 已读\n2 删除',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `metadata`
--

DROP TABLE IF EXISTS `metadata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `metadata` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '元数据ID',
  `source` varchar(255) NOT NULL COMMENT 'HDFS路径',
  `amount` int(11) DEFAULT NULL COMMENT '数据量',
  `feature` int(11) DEFAULT NULL COMMENT '数据特征量',
  `hashsum` varchar(255) NOT NULL COMMENT '数据校验和',
  `hadoopsource_id` int(11) NOT NULL COMMENT 'Hadoop数据源ID',
  `format` varchar(45) NOT NULL COMMENT '文件格式，后缀，截取不到就为unknown',
  `state` int(1) NOT NULL COMMENT '入库处理状态\n未处理 0	未入库\n处理中	1	每天持续扫描类型,dstate人为调整为完成时，hstate、mstate自动调整为未处理\n已完成	2	已入库或不需入库',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `username` varchar(255) NOT NULL COMMENT '用户名',
  `password` varchar(255) NOT NULL COMMENT '用户密码',
  `nickname` varchar(255) NOT NULL COMMENT '用户昵称',
  `email` varchar(255) DEFAULT NULL COMMENT '用户邮箱',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-04-11 17:51:10

LOCK TABLES `users` WRITE;
INSERT INTO `users` (`id`,`username`,`password`,`nickname`,`email`)VALUES (1,'root','81dc9bdb52d04dc20036dbd8313ed055','root',NULL);
UNLOCK TABLES;

GRANT ALL PRIVILEGES ON `dgsogp_admin_db`.* TO 'dgsogp_admin'@'%' IDENTIFIED BY '123456' WITH GRANT OPTION;

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `dgsogp_data_db` /*!40100 DEFAULT CHARACTER SET utf8 */;

GRANT ALL PRIVILEGES ON `dgsogp_data_db`.* TO 'dgsogp_data'@'%' IDENTIFIED BY '123456' WITH GRANT OPTION;

FLUSH PRIVILEGES;

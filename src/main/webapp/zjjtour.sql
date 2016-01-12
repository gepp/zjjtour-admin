/*
SQLyog 企业版 - MySQL GUI v8.14 
MySQL - 5.5.20 : Database - zjjtour
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`zjjtour` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `zjjtour`;

/*Table structure for table `bq_news` */

DROP TABLE IF EXISTS `bq_news`;

CREATE TABLE `bq_news` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `bq_id` int(11) DEFAULT NULL,
  `news_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;

/*Data for the table `bq_news` */

insert  into `bq_news`(`id`,`bq_id`,`news_id`) values (7,1022,21),(8,1022,20),(9,1022,19),(10,1022,18),(11,1022,17),(14,1023,21),(15,1023,20),(16,1023,19),(17,1023,18),(18,1023,17),(20,1021,20),(21,1021,19),(22,1021,18),(23,1021,17),(24,1021,21),(29,1035,18);

/*Table structure for table `security_bq` */

DROP TABLE IF EXISTS `security_bq`;

CREATE TABLE `security_bq` (
  `id` int(32) unsigned NOT NULL AUTO_INCREMENT COMMENT 'PK',
  `name` varchar(100) DEFAULT NULL COMMENT '菜单名称',
  `code` varchar(50) DEFAULT NULL COMMENT '菜单编码',
  `description` varchar(500) DEFAULT NULL COMMENT '菜单描述',
  `orderlist` int(11) DEFAULT NULL COMMENT '排序号',
  `img` varchar(200) DEFAULT NULL COMMENT '图片地址',
  `url` varchar(150) DEFAULT NULL COMMENT '跳转url',
  `parent_id` int(111) DEFAULT NULL COMMENT '父节点',
  `type` int(50) DEFAULT NULL COMMENT '菜单类型',
  `status` int(4) DEFAULT NULL COMMENT '状态',
  `column_type` varchar(50) DEFAULT NULL,
  `page_type` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `security_bq` */

/*Table structure for table `security_menu` */

DROP TABLE IF EXISTS `security_menu`;

CREATE TABLE `security_menu` (
  `id` int(32) unsigned NOT NULL AUTO_INCREMENT COMMENT 'PK',
  `name` varchar(100) DEFAULT NULL COMMENT '菜单名称',
  `code` varchar(50) DEFAULT NULL COMMENT '菜单编码',
  `description` varchar(500) DEFAULT NULL COMMENT '菜单描述',
  `orderlist` int(11) DEFAULT NULL COMMENT '排序号',
  `img` varchar(200) DEFAULT NULL COMMENT '图片地址',
  `url` varchar(150) DEFAULT NULL COMMENT '跳转url',
  `parent_id` int(111) DEFAULT NULL COMMENT '父节点',
  `type` int(50) DEFAULT NULL COMMENT '菜单类型',
  `status` int(4) DEFAULT NULL COMMENT '状态',
  `column_type` varchar(50) DEFAULT NULL,
  `page_type` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1036 DEFAULT CHARSET=utf8;

/*Data for the table `security_menu` */

insert  into `security_menu`(`id`,`name`,`code`,`description`,`orderlist`,`img`,`url`,`parent_id`,`type`,`status`,`column_type`,`page_type`) values (1,'系统管理',NULL,NULL,999,'/res/images/leftico04.png',NULL,0,0,1,NULL,NULL),(2,'部门管理',NULL,NULL,999,NULL,'/securityorganization/list.htm',1,0,1,NULL,NULL),(3,'用户管理',NULL,NULL,999,NULL,'/securityuser/list.htm',1,0,1,NULL,NULL),(4,'角色权限管理',NULL,NULL,999,NULL,'/securityrole/list.htm',1,0,1,NULL,NULL),(1009,'栏目管理',NULL,NULL,NULL,NULL,'/securitymenu/list.htm',1,0,1,NULL,NULL),(1010,'线路管理',NULL,NULL,1,'/res/images/leftico01.png',NULL,0,1,1,'1','0'),(1011,'全景张家界',NULL,NULL,2,'/res/images/leftico01.png',NULL,0,1,0,'2','0'),(1012,'绝美风光',NULL,NULL,3,'/res/images/leftico01.png',NULL,1011,1,0,'1','0'),(1013,'历史景观',NULL,NULL,4,NULL,NULL,1011,1,1,'0','0'),(1014,'文化艺术',NULL,NULL,5,NULL,NULL,1011,1,1,'0','0'),(1015,'户外休闲',NULL,NULL,6,'/res/images/leftico01.png',NULL,1011,1,0,'1','0'),(1016,'美食小吃',NULL,NULL,7,NULL,NULL,1011,1,1,'0','0'),(1017,'出行攻略',NULL,NULL,8,NULL,NULL,1011,1,1,'0','0'),(1018,'精品游记',NULL,NULL,9,NULL,NULL,1011,1,1,'0','0'),(1019,'标签管理',NULL,NULL,NULL,NULL,'/bq/listBq.htm',1,0,1,'0','0'),(1021,'行程天数',NULL,NULL,1,'/res/images/leftico01.png',NULL,0,2,1,'1',NULL),(1022,'1天',NULL,NULL,1,NULL,NULL,1021,2,1,'1',NULL),(1023,'2天',NULL,NULL,2,NULL,NULL,1021,2,1,'1',NULL),(1026,'所在地区',NULL,NULL,2,'/res/images/leftico01.png',NULL,0,2,1,'1',NULL),(1028,'凤凰',NULL,NULL,3,NULL,NULL,1026,2,1,'1',NULL),(1029,'其他',NULL,NULL,3,NULL,NULL,1026,2,1,'1',NULL),(1030,'旅游要素',NULL,NULL,3,'/res/images/leftico01.png',NULL,0,2,1,'1',NULL),(1031,'摄影',NULL,NULL,2,NULL,NULL,1030,2,1,'1',NULL),(1032,'人文',NULL,NULL,2,NULL,NULL,1030,2,1,'1',NULL),(1033,'美食',NULL,NULL,3,'/res/images/leftico01.png',NULL,1030,2,1,'1',NULL),(1034,'适合人群',NULL,NULL,4,'/res/images/leftico01.png',NULL,0,2,1,'1',NULL),(1035,'20岁以下',NULL,NULL,1,'/res/images/leftico01.png',NULL,1034,2,1,'1',NULL);

/*Table structure for table `security_news` */

DROP TABLE IF EXISTS `security_news`;

CREATE TABLE `security_news` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT NULL COMMENT '通告标题',
  `litter_title` varchar(100) DEFAULT NULL,
  `content` text COMMENT '通告内容',
  `userid` int(11) DEFAULT NULL COMMENT '用户id',
  `status` int(11) DEFAULT NULL COMMENT '是否启用',
  `ctime` datetime DEFAULT NULL COMMENT '创建时间',
  `smallimg` varchar(200) DEFAULT NULL COMMENT '缩略图',
  `indeximg` varchar(200) DEFAULT NULL COMMENT '首页图',
  `url` varchar(200) DEFAULT NULL COMMENT 'url',
  `orderlist` int(11) DEFAULT NULL COMMENT '排序',
  `abstract_content` varchar(200) DEFAULT NULL COMMENT '摘要',
  `read_type` varchar(10) DEFAULT NULL COMMENT '0会员阅读 1全部阅读',
  `index_status` varchar(10) DEFAULT NULL COMMENT '是否首页',
  `top_status` varchar(10) DEFAULT NULL COMMENT '是否置顶',
  `jump_type` varchar(10) DEFAULT NULL COMMENT '0页面 1页外',
  `menu_id` int(11) DEFAULT NULL,
  `review_status` varchar(5) DEFAULT NULL COMMENT '0未处理 1通过 2 失败',
  `review_userid` int(11) DEFAULT NULL,
  `review_time` datetime DEFAULT NULL,
  `review_reason` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

/*Data for the table `security_news` */

insert  into `security_news`(`id`,`title`,`litter_title`,`content`,`userid`,`status`,`ctime`,`smallimg`,`indeximg`,`url`,`orderlist`,`abstract_content`,`read_type`,`index_status`,`top_status`,`jump_type`,`menu_id`,`review_status`,`review_userid`,`review_time`,`review_reason`) values (17,'123','213','123',1,0,'2016-01-10 20:19:41',NULL,NULL,NULL,NULL,NULL,'1','0','0','0',1010,'0',NULL,NULL,NULL),(18,'aaaa',NULL,'aaa',1,0,'2016-01-10 20:20:52',NULL,NULL,NULL,NULL,NULL,'1','0','0','0',1010,'0',NULL,NULL,NULL),(23,'啊啊方式','士大夫',NULL,12,0,'2016-01-12 22:54:28',NULL,NULL,NULL,NULL,NULL,'0','0','0','0',1012,'2',11,'2016-01-12 23:51:56','的萨芬大幅'),(25,'士大夫','123123','123',12,0,'2016-01-12 23:04:04','123','123','123213',NULL,NULL,'0','0','0','0',1012,'1',11,'2016-01-12 23:51:49','dsaf');

/*Table structure for table `security_organization` */

DROP TABLE IF EXISTS `security_organization`;

CREATE TABLE `security_organization` (
  `id` int(32) unsigned NOT NULL AUTO_INCREMENT COMMENT 'pk',
  `code` varchar(50) DEFAULT NULL COMMENT '编码',
  `name` varchar(100) DEFAULT NULL COMMENT '机构名称',
  `description` varchar(500) DEFAULT NULL COMMENT '描述',
  `parent_id` int(50) DEFAULT NULL COMMENT '上级机构',
  `status` varchar(10) DEFAULT NULL COMMENT '状态',
  `orderlist` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;

/*Data for the table `security_organization` */

insert  into `security_organization`(`id`,`code`,`name`,`description`,`parent_id`,`status`,`orderlist`) values (42,'ZHB','综合部','123',0,'1',NULL),(43,'YB','综合一部',NULL,42,'1',NULL),(44,'EB','综合二部',NULL,42,'1',NULL);

/*Table structure for table `security_organization_user` */

DROP TABLE IF EXISTS `security_organization_user`;

CREATE TABLE `security_organization_user` (
  `id` int(32) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` varchar(32) DEFAULT NULL,
  `organization_id` int(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `security_organization_user` */

/*Table structure for table `security_role` */

DROP TABLE IF EXISTS `security_role`;

CREATE TABLE `security_role` (
  `id` int(32) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(50) DEFAULT NULL COMMENT '编码',
  `name` varchar(100) DEFAULT NULL COMMENT '角色名称',
  `description` varchar(500) DEFAULT NULL COMMENT '角色描述',
  `status` int(10) DEFAULT NULL COMMENT '状态',
  `type` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `security_role` */

insert  into `security_role`(`id`,`code`,`name`,`description`,`status`,`type`) values (1,'system','系统管理员','系统管理员',1,'0'),(2,'123','全景张家界-审核','全景张家界-审核',1,'1'),(3,'234','全景张家界-发布','全景张家界-发布',1,'2');

/*Table structure for table `security_role_menu` */

DROP TABLE IF EXISTS `security_role_menu`;

CREATE TABLE `security_role_menu` (
  `id` int(32) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int(50) DEFAULT NULL,
  `menu_id` int(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;

/*Data for the table `security_role_menu` */

insert  into `security_role_menu`(`id`,`role_id`,`menu_id`) values (1,1,3),(2,1,2),(3,1,1),(4,1,0),(5,1,5),(6,1,4),(14,2,0),(15,2,1017),(16,2,1016),(17,2,1018),(18,2,1013),(19,2,1011),(20,2,1012),(21,2,1015),(22,2,1014),(32,3,0),(33,3,1017),(34,3,1016),(35,3,1018),(36,3,1013),(37,3,1011),(38,3,1012),(39,3,1015),(40,3,1014);

/*Table structure for table `security_user` */

DROP TABLE IF EXISTS `security_user`;

CREATE TABLE `security_user` (
  `id` int(32) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `code` varchar(50) DEFAULT NULL COMMENT '代码',
  `username` varchar(200) DEFAULT NULL COMMENT '姓名',
  `email` varchar(100) DEFAULT NULL COMMENT '邮箱',
  `userpwd` varchar(100) DEFAULT NULL COMMENT '密码',
  `phone` varchar(100) DEFAULT NULL COMMENT '手机',
  `realname` varchar(100) DEFAULT NULL COMMENT '真实姓名',
  `status` int(100) DEFAULT NULL COMMENT '状态',
  `ctime` datetime DEFAULT NULL COMMENT '创建时间',
  `organization_id` int(50) DEFAULT NULL COMMENT '组织id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

/*Data for the table `security_user` */

insert  into `security_user`(`id`,`code`,`username`,`email`,`userpwd`,`phone`,`realname`,`status`,`ctime`,`organization_id`) values (1,NULL,'system','admin@163.com','c4ca4238a0b923820dcc509a6f75849b','18952028230','系统管理员',1,NULL,NULL),(11,NULL,'xiaoming','xiaoming@163.com','c4ca4238a0b923820dcc509a6f75849b',NULL,'小明',1,'2016-01-07 14:30:57',43),(12,NULL,'xiaofang','xiaofang@qq.com','c4ca4238a0b923820dcc509a6f75849b','18952028230','小芳',1,'2016-01-12 22:47:27',43);

/*Table structure for table `security_user_ext` */

DROP TABLE IF EXISTS `security_user_ext`;

CREATE TABLE `security_user_ext` (
  `id` int(32) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` varchar(32) DEFAULT NULL,
  `organization_id` varchar(50) DEFAULT NULL,
  `sex` varchar(10) DEFAULT NULL,
  `birthday` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `security_user_ext` */

/*Table structure for table `security_user_role` */

DROP TABLE IF EXISTS `security_user_role`;

CREATE TABLE `security_user_role` (
  `id` int(32) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(32) DEFAULT NULL,
  `role_id` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

/*Data for the table `security_user_role` */

insert  into `security_user_role`(`id`,`user_id`,`role_id`) values (26,11,'2'),(28,12,'3');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

/*
SQLyog 企业版 - MySQL GUI v8.14 
MySQL - 5.5.20 : Database - zjjtour
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

/*Data for the table `bq_news` */

insert  into `bq_news`(`id`,`bq_id`,`news_id`) values (7,1022,21),(8,1022,20),(9,1022,19),(10,1022,18),(11,1022,17),(12,1023,21),(13,1021,22),(14,1021,21),(15,1021,20),(16,1021,19),(17,1021,18),(18,1021,17),(19,1063,22),(20,1063,21),(21,1063,20),(22,1063,19),(23,1063,18),(24,1063,17),(25,1066,17);

/*Table structure for table `member` */

DROP TABLE IF EXISTS `member`;

CREATE TABLE `member` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `nickname` varchar(50) DEFAULT NULL COMMENT '会员名称',
  `email` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `mobile` varchar(50) DEFAULT NULL COMMENT '手机',
  `realname` varchar(50) DEFAULT NULL COMMENT '真实姓名',
  `sex` varchar(10) DEFAULT NULL COMMENT '性别',
  `status` int(11) DEFAULT NULL COMMENT '启用标志',
  `ctime` datetime DEFAULT NULL COMMENT '创建时间',
  `memberpwd` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `member` */

insert  into `member`(`id`,`nickname`,`email`,`mobile`,`realname`,`sex`,`status`,`ctime`,`memberpwd`) values (2,'gepp2010','1@qq.com','123','葛萍萍','1',1,'2016-01-15 11:16:59','c4ca4238a0b923820dcc509a6f75849b'),(4,'gepp2011','1@qq.com','1','1','1',1,'2016-01-15 11:24:07','c4ca4238a0b923820dcc509a6f75849b'),(5,'gepp2012','1@qq.com','12','123','1',1,'2016-01-15 11:24:17','c4ca4238a0b923820dcc509a6f75849b');

/*Table structure for table `member_activity` */

DROP TABLE IF EXISTS `member_activity`;

CREATE TABLE `member_activity` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT NULL COMMENT '活动标题',
  `litter_title` varchar(100) DEFAULT NULL,
  `content` text COMMENT '通告内容',
  `userid` int(11) DEFAULT NULL COMMENT '用户id',
  `activity_status` int(11) DEFAULT NULL COMMENT '活动状态全部、未开始、进行中、已结束',
  `status` int(11) DEFAULT NULL COMMENT '是否启用',
  `ctime` datetime DEFAULT NULL COMMENT '创建时间',
  `smallimg` varchar(200) DEFAULT NULL COMMENT '缩略图',
  `indeximg` varchar(200) DEFAULT NULL COMMENT '首页图',
  `url` varchar(200) DEFAULT NULL COMMENT 'url',
  `orderlist` int(11) DEFAULT NULL COMMENT '排序',
  `abstract_content` varchar(200) DEFAULT NULL COMMENT '摘要',
  `join_type` varchar(10) DEFAULT NULL COMMENT '0会员 1全部',
  `index_status` varchar(10) DEFAULT NULL COMMENT '是否首页',
  `top_status` varchar(10) DEFAULT NULL COMMENT '是否置顶',
  `jump_type` varchar(10) DEFAULT NULL COMMENT '0页面 1页外',
  `menu_id` int(11) DEFAULT NULL,
  `review_status` varchar(5) DEFAULT NULL COMMENT '0未处理 1通过 2 失败',
  `review_userid` int(11) DEFAULT NULL,
  `review_time` datetime DEFAULT NULL,
  `review_reason` varchar(200) DEFAULT NULL,
  `support_status` varchar(10) DEFAULT NULL COMMENT '是否支持报名',
  `start_time` datetime DEFAULT NULL COMMENT '开始时间',
  `end_time` datetime DEFAULT NULL COMMENT '截止时间',
  `usercount` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `member_activity` */

insert  into `member_activity`(`id`,`title`,`litter_title`,`content`,`userid`,`activity_status`,`status`,`ctime`,`smallimg`,`indeximg`,`url`,`orderlist`,`abstract_content`,`join_type`,`index_status`,`top_status`,`jump_type`,`menu_id`,`review_status`,`review_userid`,`review_time`,`review_reason`,`support_status`,`start_time`,`end_time`,`usercount`) values (1,'活动标题','简略标题','4324',1,2,0,'2016-01-15 14:45:11','http://localhost:8081/zjjtour-admin/attached/image/20160115/20160115150011_425.jpg','http://pad.pinhai.com.cn:8081/zjjtour-admin/attached/image/20160128/20160128232327_903.png','444',444,'万福温泉属天然自涌温泉，泉水清澈碧透，常年恒温53℃，富含多种有益人体的微量元素和矿物质，景区建有具神奇魅力','0','1','1','1',NULL,'1',1,'2016-01-15 15:27:28','adfsd','1','2016-01-04 00:00:00','2016-02-05 00:00:00',0),(2,'zzzz','zzzz','123',1,1,1,'2016-01-15 15:00:59',NULL,'http://pad.pinhai.com.cn:8081/zjjtour-admin/attached/image/20160128/20160128232334_629.png',NULL,NULL,'与浪共舞是我们精心为您策划的一场青春之旅，在与大自然抗争中演绎精彩的瞬间，这就是漂流，一项勇敢者的运动。','0','1','1','1',NULL,'1',1,'2016-01-28 22:06:08','123','1','2016-01-04 00:00:00','2016-01-29 00:00:00',0),(3,'dasfsdf','asfsdfsaf','123',1,1,1,'2016-01-15 15:02:46',NULL,NULL,NULL,NULL,NULL,'0','1','1','1',NULL,'0',NULL,NULL,NULL,'1','2016-01-29 00:00:00','2016-02-06 00:00:00',0);

/*Table structure for table `member_activity_detail` */

DROP TABLE IF EXISTS `member_activity_detail`;

CREATE TABLE `member_activity_detail` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) DEFAULT NULL,
  `userid` int(11) DEFAULT NULL,
  `ctime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `member_activity_detail` */

insert  into `member_activity_detail`(`id`,`activity_id`,`userid`,`ctime`) values (1,1,2,'2016-01-15 14:45:11'),(2,1,4,'2016-01-15 14:45:11'),(3,2,5,'2016-01-15 14:45:11');

/*Table structure for table `member_complain` */

DROP TABLE IF EXISTS `member_complain`;

CREATE TABLE `member_complain` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_id` int(11) DEFAULT NULL COMMENT '会员ID',
  `member_mobile` varchar(50) DEFAULT NULL COMMENT '会员手机',
  `member_name` varchar(50) DEFAULT NULL COMMENT '会员姓名',
  `complain_title` varchar(200) DEFAULT NULL,
  `complain_message` text COMMENT '投诉内容',
  `complain_time` datetime DEFAULT NULL COMMENT '投诉时间',
  `replay_status` int(11) DEFAULT NULL COMMENT '回复状态',
  `replay_userid` int(11) DEFAULT NULL COMMENT '回复人id',
  `replay_time` datetime DEFAULT NULL COMMENT '回复时间',
  `replay_message` varchar(200) DEFAULT NULL COMMENT '回复内容',
  `review_status` int(11) DEFAULT NULL COMMENT '审核状态',
  `review_userid` int(11) DEFAULT NULL COMMENT '审核人id',
  `review_time` datetime DEFAULT NULL COMMENT '审核时间',
  `review_message` varchar(200) DEFAULT NULL COMMENT '审核意见',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `member_complain` */

insert  into `member_complain`(`id`,`member_id`,`member_mobile`,`member_name`,`complain_title`,`complain_message`,`complain_time`,`replay_status`,`replay_userid`,`replay_time`,`replay_message`,`review_status`,`review_userid`,`review_time`,`review_message`) values (1,2,'18952028230','gepp2010','建议1','景区游览一定要思想集中，谨慎缓行，走路不观景，观景脚步要特别小心，要看得准，走得稳。鞋子要穿厚底防滑的运动鞋，不宜穿光底和硬底鞋。女士宜穿平底鞋，不宜穿长裙','2016-01-15 10:10:00',0,1,'2016-01-15 18:39:42','湖南饮食口味较重，以辣出名，不同地区旅客可能一时难以适应，易引起水土不服，请旅客自备常用药。旅途中饮食宜清淡，多吃蔬菜水果。夏天不要吃太多冷饮，以便肠胃不适，影响游览行程。',1,1,'2016-01-15 18:47:02','讲的很有道理！'),(2,4,'13952028230','gepp2011','建议2','现在购买是否赠送专属套装和鼠包礼包 还有是否是和电脑同时配送呢','2016-01-15 10:10:00',0,NULL,NULL,NULL,0,NULL,NULL,NULL);

/*Table structure for table `news_maodian` */

DROP TABLE IF EXISTS `news_maodian`;

CREATE TABLE `news_maodian` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `news_id` int(11) DEFAULT NULL,
  `orderlist` int(11) DEFAULT NULL,
  `maodian_name` varchar(200) DEFAULT NULL,
  `maodian_content` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

/*Data for the table `news_maodian` */

insert  into `news_maodian`(`id`,`news_id`,`orderlist`,`maodian_name`,`maodian_content`) values (18,59,1,'123','									123\r\n									'),(19,59,2,'345','2354235');

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
  `can_search` varchar(4) DEFAULT NULL COMMENT '是否支持搜索',
  `banner_id` int(11) DEFAULT NULL COMMENT '栏目ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1070 DEFAULT CHARSET=utf8;

/*Data for the table `security_menu` */

insert  into `security_menu`(`id`,`name`,`code`,`description`,`orderlist`,`img`,`url`,`parent_id`,`type`,`status`,`column_type`,`page_type`,`can_search`,`banner_id`) values (1,'系统管理',NULL,NULL,999,'/res/images/leftico04.png',NULL,0,0,1,NULL,NULL,NULL,NULL),(2,'部门管理',NULL,NULL,999,NULL,'/securityorganization/list.htm',1,0,1,NULL,NULL,NULL,NULL),(3,'用户管理',NULL,NULL,999,NULL,'/securityuser/list.htm',1,0,1,NULL,NULL,NULL,NULL),(4,'角色权限管理',NULL,NULL,999,NULL,'/securityrole/list.htm',1,0,1,NULL,NULL,NULL,NULL),(1009,'栏目管理',NULL,NULL,998,NULL,'/securitymenu/list.htm',1047,0,1,NULL,NULL,NULL,NULL),(1010,'畅游',NULL,'难难难',2,'/res/images/leftico01.png',NULL,0,1,1,'1','0','1',NULL),(1011,'全景',NULL,'难难难',1,'http://pad.pinhai.com.cn:8081/zjjtour-admin/attached/image/20160128/20160128231005_736.png',NULL,0,1,1,'2','0',NULL,NULL),(1012,'绝美风光',NULL,'绝美风光绝美风光绝美风光绝美风光',3,'http://pad.pinhai.com.cn:8081/zjjtour-admin/attached/image/20160128/20160128231005_736.png',NULL,1011,1,1,'1','0','1',NULL),(1013,'历史景观',NULL,'历史景观',4,'http://pad.pinhai.com.cn:8081/zjjtour-admin/attached/image/20160128/20160128231028_948.jpg',NULL,1011,1,1,'1','0','1',NULL),(1014,'文化艺术',NULL,'文化艺术',5,'http://pad.pinhai.com.cn:8081/zjjtour-admin/attached/image/20160128/20160128231039_820.jpg',NULL,1011,1,1,'1','0',NULL,NULL),(1015,'户外休闲',NULL,'户外休闲',6,'http://pad.pinhai.com.cn:8081/zjjtour-admin/attached/image/20160128/20160128231051_786.jpg',NULL,1011,1,1,'1','0',NULL,NULL),(1016,'美食小吃',NULL,'美食小吃',7,'http://pad.pinhai.com.cn:8081/zjjtour-admin/attached/image/20160128/20160128231103_914.jpg',NULL,1011,1,1,'1','0',NULL,NULL),(1017,'出行攻略',NULL,'出行攻略',8,'http://pad.pinhai.com.cn:8081/zjjtour-admin/attached/image/20160128/20160128231152_227.png',NULL,1011,1,1,'1','0',NULL,NULL),(1018,'精品游记',NULL,'精品游记',9,'http://pad.pinhai.com.cn:8081/zjjtour-admin/attached/image/20160128/20160128231206_976.jpg',NULL,1011,1,1,'1','0','1',NULL),(1019,'标签管理',NULL,'难难难',NULL,'http://localhost:8080/zjjtour-admin/attached/image/20160128/20160128222629_775.jpg','/bq/listBq.htm',1,0,1,'0','0',NULL,NULL),(1021,'行程天数',NULL,NULL,1,'/res/images/leftico01.png',NULL,0,2,1,'1',NULL,NULL,NULL),(1022,'1天',NULL,NULL,1,NULL,NULL,1021,2,1,'1',NULL,NULL,NULL),(1023,'2天',NULL,NULL,2,NULL,NULL,1021,2,1,'1',NULL,NULL,NULL),(1026,'所在地区',NULL,NULL,2,'/res/images/leftico01.png',NULL,0,2,1,'1',NULL,NULL,NULL),(1027,'长沙',NULL,NULL,2,'/res/images/leftico01.png',NULL,1026,2,1,'1',NULL,NULL,NULL),(1028,'凤凰',NULL,NULL,3,NULL,NULL,1026,2,1,'1',NULL,NULL,NULL),(1029,'其他',NULL,NULL,3,NULL,NULL,1026,2,1,'1',NULL,NULL,NULL),(1030,'旅游要素',NULL,NULL,3,'/res/images/leftico01.png',NULL,0,2,1,'1',NULL,NULL,NULL),(1031,'摄影',NULL,NULL,2,NULL,NULL,1030,2,1,'1',NULL,NULL,NULL),(1032,'人文',NULL,NULL,2,NULL,NULL,1030,2,1,'1',NULL,NULL,NULL),(1034,'适合人群',NULL,NULL,4,'/res/images/leftico01.png',NULL,0,2,1,'1',NULL,NULL,NULL),(1035,'20岁以下',NULL,NULL,1,'/res/images/leftico01.png',NULL,1034,2,1,'1',NULL,NULL,NULL),(1036,'线路管理',NULL,NULL,1,'http://pad.pinhai.com.cn:8081/zjjtour-admin/attached/image/20160128/20160128231259_969.jpg',NULL,1010,1,1,'1','0',NULL,NULL),(1037,'听闻',NULL,NULL,4,'/res/images/leftico01.png',NULL,0,1,1,'1','0','1',NULL),(1038,'旅游资讯',NULL,NULL,1,'http://pad.pinhai.com.cn:8081/zjjtour-admin/attached/image/20160128/20160128231318_220.jpg',NULL,1037,1,1,'1','0','1',NULL),(1039,'搜索栏目设置',NULL,NULL,NULL,NULL,'/securitymenu/listSearch.htm',1048,0,1,'0','0',NULL,NULL),(1040,'常用搜索设置',NULL,NULL,NULL,NULL,'/systemsearchword/list.htm',1048,0,1,'0','0',NULL,NULL),(1041,'待办-新闻发布',NULL,NULL,NULL,NULL,'/securitynews/listWaitShenhe.htm',1052,0,1,'0','0',NULL,NULL),(1042,'待办-投诉意见',NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL),(1043,'会员列表',NULL,NULL,NULL,NULL,'/member/list.htm',1046,0,1,'0','0',NULL,NULL),(1044,'投诉列表',NULL,NULL,NULL,NULL,'/membercomplain/list.htm',1049,0,1,'0','0',NULL,NULL),(1045,'活动列表',NULL,NULL,NULL,NULL,'/memberactivity/list.htm',1050,0,1,'0',NULL,NULL,NULL),(1046,'会员管理',NULL,NULL,993,'/res/images/leftico01.png',NULL,0,0,1,'0','0',NULL,NULL),(1047,'栏目管理',NULL,NULL,994,'/res/images/leftico01.png',NULL,0,0,1,'0','0',NULL,NULL),(1048,'搜索设置',NULL,NULL,995,'/res/images/leftico01.png',NULL,0,0,1,'0','0',NULL,NULL),(1049,'投诉管理',NULL,NULL,996,'/res/images/leftico01.png',NULL,0,0,1,'0','0',NULL,NULL),(1050,'活动管理',NULL,NULL,998,'/res/images/leftico01.png',NULL,0,0,1,'0','0',NULL,NULL),(1052,'待办事项',NULL,NULL,997,'/res/images/leftico01.png',NULL,0,0,1,'0',NULL,NULL,NULL),(1053,'首页设置',NULL,NULL,NULL,NULL,'/toIndexSetting.htm',1,0,1,'0','0',NULL,NULL),(1054,'视频管理',NULL,NULL,NULL,NULL,'/securitynews/toViedoList.htm',1,0,1,'0','0',NULL,NULL),(1055,'景区动态',NULL,NULL,2,'http://pad.pinhai.com.cn:8081/zjjtour-admin/attached/image/20160128/20160128231327_639.png',NULL,1037,1,1,'1','0',NULL,NULL),(1056,'重要新闻',NULL,NULL,3,'http://pad.pinhai.com.cn:8081/zjjtour-admin/attached/image/20160201/20160201001831_599.jpg',NULL,1037,1,1,'1','0',NULL,NULL),(1057,'旅游政策',NULL,NULL,4,'http://pad.pinhai.com.cn:8081/zjjtour-admin/attached/image/20160201/20160201001915_500.png',NULL,1037,1,1,'1','0',NULL,NULL),(1058,'休闲',NULL,'菜肴风味属翼菜，以咸为主，粗犷大气，兼收八大菜系的特点，擅长爆、炸、炒。回民扒鸡、狗肉全席、金毛狮子鱼、菊花鱿鱼、抓炒全鱼，都是广受好评的当地名菜。',3,'/res/images/leftico01.png',NULL,0,1,1,'1','0',NULL,NULL),(1059,'美食',NULL,'张家界是世界闻名的风景名胜区，不仅有绝美险峻的自然风光，当地土家族的美食小吃更是别具风味。今天，就要为大家介绍介绍张家界土家的著名美食特产，在欣赏胜景的同时也别忘了好好犒劳犒劳自己的胃哟！',1,'http://pad.pinhai.com.cn:8081/zjjtour-admin/attached/image/20160128/20160128232426_302.png',NULL,1058,1,1,'1','0',NULL,NULL),(1060,'景点',NULL,'张家界的核心景区为武陵源风景名胜区，一般说到张家界旅游主要是游武陵源。1984年，时任中共中央总书记的胡耀邦视察此地时将张家界、索溪峪、天子山三大景区命名为“武陵源”。因此，武陵源风景名胜区由张家界国家森林公园、天子山自然保护区、索溪峪自然保护区、杨家界自然保护区组成。到武陵源游览，需乘班车抵达。',2,'http://pad.pinhai.com.cn:8081/zjjtour-admin/attached/image/20160128/20160128232452_120.png',NULL,1058,1,1,'1','0',NULL,NULL),(1061,'酒店',NULL,'张家界住宿设备完善，有很多酒店、旅馆和便捷酒店，可选择余地很多，但暂时没有开设国际青年旅舍。 张家界的住宿区域主要分布在两个区域：老火车站-中山路和水上公园。老火车站-中山路处于市中心，',3,'http://pad.pinhai.com.cn:8081/zjjtour-admin/attached/image/20160128/20160128232511_165.jpg',NULL,1058,1,1,'1','0',NULL,NULL),(1062,'门票',NULL,'张家界国家森林公园门票  245元/人，包含景区 1 80元的大门票和65元的环保车费，有效期 4天。【旺季门票  245元/人，24周岁以下学生、60岁至70岁的老人门票是 163元/人，70岁及以上老人 85元/人，淡季门票 136元/人，学生及60岁至70岁的老人门票 85元/人，现役军人和70岁及以上老人免票】',4,'http://pad.pinhai.com.cn:8081/zjjtour-admin/attached/image/20160128/20160128232519_223.jpg',NULL,1058,1,1,'1','0',NULL,NULL),(1063,'地标美景',NULL,NULL,1,'/res/images/leftico01.png',NULL,0,2,1,'1',NULL,NULL,1012),(1064,'奇山秀水',NULL,NULL,2,'/res/images/leftico01.png',NULL,0,2,1,'1',NULL,NULL,1012),(1065,'溶洞幽谷',NULL,NULL,3,'/res/images/leftico01.png',NULL,0,2,1,'1',NULL,NULL,1012),(1066,'test1',NULL,NULL,1,'/res/images/leftico01.png',NULL,0,2,1,'1',NULL,NULL,1013),(1067,'test2',NULL,NULL,2,'/res/images/leftico01.png',NULL,0,2,1,'1',NULL,NULL,1013),(1068,'a1',NULL,NULL,1,'/res/images/leftico01.png',NULL,0,2,1,'1',NULL,NULL,1014),(1069,'b1',NULL,NULL,1,'/res/images/leftico01.png',NULL,0,2,1,'1',NULL,NULL,1015);

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
  `review_reason` varchar(200) DEFAULT NULL,
  `news_type` varchar(10) DEFAULT NULL COMMENT '类型 -article -viedo',
  `out_status` varchar(10) DEFAULT NULL COMMENT '是否外部调用',
  `out_js` varchar(200) DEFAULT NULL COMMENT '外部调用js',
  `video_url` varchar(200) DEFAULT NULL,
  `maodian_status` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8;

/*Data for the table `security_news` */

insert  into `security_news`(`id`,`title`,`litter_title`,`content`,`userid`,`status`,`ctime`,`smallimg`,`indeximg`,`url`,`orderlist`,`abstract_content`,`read_type`,`index_status`,`top_status`,`jump_type`,`menu_id`,`review_status`,`review_userid`,`review_time`,`review_reason`,`news_type`,`out_status`,`out_js`,`video_url`,`maodian_status`) values (17,'123','213','123',1,0,'2016-01-10 20:19:41',NULL,'http://pad.pinhai.com.cn:8081/zjjtour-admin/attached/image/20160128/20160128232213_22.png',NULL,NULL,'2015年12月14日至2016年1月4日，张家界市司法局联合市、区县两级检察机关对全市各区县社区矫正工作和社区矫正对象进行了一次拉网式大排查。','1','0','0','0',1010,'0',NULL,NULL,NULL,'ARTICLE',NULL,NULL,NULL,NULL),(18,'aaaa',NULL,'aaa',1,0,'2016-01-10 20:20:52',NULL,'http://pad.pinhai.com.cn:8081/zjjtour-admin/attached/image/20160128/20160128232213_22.png',NULL,NULL,'2015年12月14日至2016年1月4日，张家界市司法局联合市、区县两级检察机关对全市各区县社区矫正工作和社区矫正对象进行了一次拉网式大排查。','1','0','0','0',1010,'0',NULL,NULL,NULL,'ARTICLE',NULL,NULL,NULL,NULL),(19,'阿德法','阿德法','阿德法',1,0,'2016-01-10 23:05:05',NULL,'http://pad.pinhai.com.cn:8081/zjjtour-admin/attached/image/20160128/20160128232213_22.png',NULL,NULL,'2015年12月14日至2016年1月4日，张家界市司法局联合市、区县两级检察机关对全市各区县社区矫正工作和社区矫正对象进行了一次拉网式大排查。','1','0','0','0',1010,'0',NULL,NULL,NULL,'ARTICLE',NULL,NULL,NULL,NULL),(20,'阿斯蒂芬撒法',NULL,'萨芬',1,0,'2016-01-10 23:05:14',NULL,'http://pad.pinhai.com.cn:8081/zjjtour-admin/attached/image/20160128/20160128232213_22.png',NULL,NULL,'2015年12月14日至2016年1月4日，张家界市司法局联合市、区县两级检察机关对全市各区县社区矫正工作和社区矫正对象进行了一次拉网式大排查。','1','0','0','0',1010,'0',NULL,NULL,NULL,'ARTICLE',NULL,NULL,NULL,NULL),(21,'自作主张',NULL,'自作主张',1,0,'2016-01-10 23:05:19',NULL,'http://pad.pinhai.com.cn:8081/zjjtour-admin/attached/image/20160128/20160128232213_22.png',NULL,NULL,'2015年12月14日至2016年1月4日，张家界市司法局联合市、区县两级检察机关对全市各区县社区矫正工作和社区矫正对象进行了一次拉网式大排查。','1','0','0','0',1010,'1',1,'2016-01-14 16:17:06','驳回','ARTICLE',NULL,NULL,NULL,NULL),(22,'addafd',NULL,'daf',1,0,'2016-01-10 23:52:16','http://121.41.62.2:8081/zjjtour-admin/attached/image/20160110/20160110235212_874.png','http://pad.pinhai.com.cn:8081/zjjtour-admin/attached/image/20160128/20160128232213_22.png',NULL,NULL,'2015年12月14日至2016年1月4日，张家界市司法局联合市、区县两级检察机关对全市各区县社区矫正工作和社区矫正对象进行了一次拉网式大排查。','1','0','0','0',1010,'1',1,'2016-01-14 16:16:52','通过了','ARTICLE',NULL,NULL,NULL,NULL),(23,'户外活动','户外活动','<div class=\"all3d-txtList\" style=\"margin:20px 0px;color:#333333;font-family:\'Microsoft Yahei\', \'Hiragino Sans GB\', \'Helvetica Neue\', Helvetica, tahoma, arial, Verdana, sans-serif, \'WenQuanYi Micro Hei\', 宋体;\">\r\n	<div class=\"all3d-txt_title\">\r\n		<h3 style=\"font-size:18px;font-weight:normal;font-family:\'Microsoft YaHei\';color:#039FEB;text-indent:10px;\">\r\n			地质公园\r\n		</h3>\r\n	</div>\r\n	<p style=\"font-size:14px;font-family:arial;color:#666666;\">\r\n		<br />\r\n	</p>\r\n	<p style=\"font-size:14px;font-family:arial;color:#666666;\">\r\n		“中国首批世界自然遗产、世界首批地质公园、国家首批5A级旅游景区”【武陵源核心景区】为是来<a href=\"http://www.travelzjj.com/\" target=\"_blank\" class=\"keywords\">张家界</a>游人的必玩景区，因独特的“张家界石英砂岩峰林地貌”而闻名于世，由<a href=\"http://www.travelzjj.com/panorama/detail/1051.html\" target=\"_blank\" class=\"keywords\">张家界国家森林公园</a>、<a href=\"http://www.travelzjj.com/panorama/detail/1068.html\" target=\"_blank\" class=\"keywords\">天子山</a>风景区、索溪峪风景区（部分）共同组成，门票为通票制，下辖7个分景区，分别为【<a href=\"http://www.travelzjj.com/panorama/detail/1060.html\" target=\"_blank\" class=\"keywords\">杨家界</a>】、【天子山】、【<a href=\"http://www.travelzjj.com/panorama/detail/1065.html\" target=\"_blank\" class=\"keywords\">袁家界</a>】、【<a href=\"http://www.travelzjj.com/panorama/detail/1066.html\" target=\"_blank\" class=\"keywords\">十里画廊</a>】、【<a href=\"http://www.travelzjj.com/panorama/detail/1069.html\" target=\"_blank\" class=\"keywords\">金鞭溪</a>】、【<a href=\"http://www.travelzjj.com/panorama/detail/1067.html\" target=\"_blank\" class=\"keywords\">黄石寨</a>】、【<a href=\"http://www.travelzjj.com/panorama/detail/1070.html\" target=\"_blank\" class=\"keywords\">鹞子寨</a>】，自然风光各不相同。\r\n	</p>\r\n	<p style=\"font-size:14px;font-family:arial;color:#666666;\">\r\n		<br />\r\n	</p>\r\n	<p style=\"font-size:14px;font-family:arial;color:#666666;\">\r\n		&nbsp;奇山异水张家界，举世闻名，是湖南核心旅游景点，还有世界溶洞之冠的<a href=\"http://www.travelzjj.com/panorama/detail/1079.html\" target=\"_blank\" class=\"keywords\">黄龙洞</a>，神秘幽深。有峰林之称的天子山，不到黄石寨，枉到张家界，还有世界上最美丽的峡谷金鞭溪。\r\n	</p>\r\n	<div>\r\n		<br />\r\n	</div>\r\n</div>\r\n<div class=\"all3d-txtList\" style=\"margin:20px 0px;color:#333333;font-family:\'Microsoft Yahei\', \'Hiragino Sans GB\', \'Helvetica Neue\', Helvetica, tahoma, arial, Verdana, sans-serif, \'WenQuanYi Micro Hei\', 宋体;\">\r\n	<div class=\"all3d-txt_title\">\r\n		<h3 style=\"font-size:18px;font-weight:normal;font-family:\'Microsoft YaHei\';color:#039FEB;text-indent:10px;\">\r\n			美景风光\r\n		</h3>\r\n	</div>\r\n	<p style=\"font-size:14px;font-family:arial;color:#666666;\">\r\n		<br />\r\n	</p>\r\n	<p style=\"font-size:14px;font-family:arial;color:#666666;\">\r\n		<span style=\"line-height:1.5;\">上亿年前的地壳运动，大自然的鬼斧神工，造就了<a href=\"http://www.travelzjj.com/\" target=\"_blank\" class=\"keywords\">张家界</a>不可复制的神奇和美丽。于是，无数游过张家界的人赞叹：人生不到张家界，访尽千山也枉然，人生不到张家界 百岁何能称老翁？张家界是“扩大的盆景.缩小的仙境”，随着四季的气象不同变幻莫测，是大自然鬼斧神功美的让人心动。张家界集桂林之秀、黄山之奇、华山之险、泰山之雄于一体，藏赂、桥、洞、湖、瀑于一身，有“扩大的盆景、缩小的仙山”之美称。</span> \r\n	</p>\r\n	<p style=\"font-size:14px;font-family:arial;color:#666666;\">\r\n		<br />\r\n	</p>\r\n	<p style=\"font-size:14px;font-family:arial;color:#666666;\">\r\n		<img alt=\"张家界杨家界峰墙\" src=\"http://manage.zjji.com/uploads/201506/261039042596.jpg\" width=\"730\" height=\"450\" title=\"张家界杨家界峰墙\" align=\"\" /> \r\n	</p>\r\n	<p style=\"font-size:14px;font-family:arial;color:#666666;\">\r\n		&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;<a href=\"http://www.travelzjj.com/panorama/detail/1060.html\" target=\"_blank\" class=\"keywords\">杨家界</a>峰墙\r\n	</p>\r\n	<p style=\"font-size:14px;font-family:arial;color:#666666;\">\r\n		<br />\r\n	</p>\r\n	<p style=\"font-size:14px;font-family:arial;color:#666666;\">\r\n		<a href=\"http://www.travelzjj.com/panorama/detail/1051.html\" target=\"_blank\" class=\"keywords\">张家界国家森林公园</a>位于湖南省西北部张家界市境内，是1982年由国务院委托国家计委批准成立的中国第一个国家森林公园，1992年12月因奇特的石英砂岩大峰林被联合国列入《世界自然遗产名录》，2004年2月被列入世界地质公园。公园自然风光以峰称奇、以谷显幽、以林见秀。\r\n	</p>\r\n	<p style=\"font-size:14px;font-family:arial;color:#666666;\">\r\n		<br />\r\n	</p>\r\n	<p style=\"font-size:14px;font-family:arial;color:#666666;\">\r\n		<img alt=\"张家界天子山卧龙岭\" src=\"http://manage.zjji.com/uploads/201506/261040580484.jpg\" width=\"730\" height=\"450\" title=\"张家界天子山卧龙岭\" align=\"\" /> \r\n	</p>\r\n	<p style=\"font-size:14px;font-family:arial;color:#666666;\">\r\n		&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<a href=\"http://www.travelzjj.com/panorama/detail/1068.html\" target=\"_blank\" class=\"keywords\">天子山</a>卧龙岭 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;摄影者：刘君\r\n	</p>\r\n	<p style=\"font-size:14px;font-family:arial;color:#666666;\">\r\n		<br />\r\n	</p>\r\n	<p style=\"font-size:14px;font-family:arial;color:#666666;\">\r\n		公园属于中亚热带气候区，高山峡谷，茂密的森林，使公园形成了独特的森林小气候——冬暖夏凉，年平均气温12.8℃，夏天平均最高气温16.8℃，冬天平均最低气温9.6℃，公园空气清新，含负氧离子高，身临其中，人体感觉特别舒适，是休闲避暑的理想之地。\r\n	</p>\r\n	<p style=\"font-size:14px;font-family:arial;color:#666666;\">\r\n		<br />\r\n	</p>\r\n	<p style=\"font-size:14px;font-family:arial;color:#666666;\">\r\n		<img alt=\"张家界袁家界\" src=\"http://manage.zjji.com/uploads/201506/261043149132.jpg\" width=\"730\" height=\"450\" title=\"张家界袁家界\" align=\"\" /> \r\n	</p>\r\n	<p style=\"font-size:14px;font-family:arial;color:#666666;\">\r\n		&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;<a href=\"http://www.travelzjj.com/panorama/detail/1065.html\" target=\"_blank\" class=\"keywords\">袁家界</a> \r\n	</p>\r\n	<p style=\"font-size:14px;font-family:arial;color:#666666;\">\r\n		<br />\r\n	</p>\r\n	<p style=\"font-size:14px;font-family:arial;color:#666666;\">\r\n		绝美自然景观。张家界地处于云贵高原隆起区与洞庭湖沉降区之间，既受隆起的影响，又受沉降的牵制 ,加上地表水切割强烈和岩溶地貌极其发育，形成了当今这种高低悬殊、奇峰林立、万石峥嵘、溪谷纵横的自然奇观。是户外爱好者的旅行天堂。\r\n	</p>\r\n	<p style=\"font-size:14px;font-family:arial;color:#666666;\">\r\n		<br />\r\n	</p>\r\n	<p style=\"font-size:14px;font-family:arial;color:#666666;\">\r\n		<img alt=\"张家界十里画廊小火车\" src=\"http://manage.zjji.com/uploads/201506/271601423959.jpg\" width=\"730\" height=\"450\" title=\"张家界十里画廊小火车\" align=\"\" /> \r\n	</p>\r\n	<p style=\"font-size:14px;font-family:arial;color:#666666;\">\r\n		&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<a href=\"http://www.travelzjj.com/panorama/detail/1066.html\" target=\"_blank\" class=\"keywords\">十里画廊</a> \r\n	</p>\r\n	<p style=\"font-size:14px;font-family:arial;color:#666666;\">\r\n		<br />\r\n	</p>\r\n	<p style=\"font-size:14px;font-family:arial;color:#666666;\">\r\n		独特的人文景观。土家族、白族、苗族、侗族和瑶族等少数民族占整个张家界市的96%。具有浓烈的民族风情，是人文摄影爱好者的必去之地。\r\n	</p>\r\n	<p style=\"font-size:14px;font-family:arial;color:#666666;\">\r\n		<br />\r\n	</p>\r\n	<p style=\"font-size:14px;font-family:arial;color:#666666;\">\r\n		<img alt=\"张家界金鞭溪\" src=\"http://manage.zjji.com/uploads/201506/261044519598.jpg\" width=\"730\" height=\"450\" title=\"张家界金鞭溪\" align=\"\" /> \r\n	</p>\r\n	<p style=\"font-size:14px;font-family:arial;color:#666666;\">\r\n		&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;<a href=\"http://www.travelzjj.com/panorama/detail/1069.html\" target=\"_blank\" class=\"keywords\">金鞭溪</a>&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;摄影者： 汤东涛\r\n	</p>\r\n	<p style=\"font-size:14px;font-family:arial;color:#666666;\">\r\n		<br />\r\n	</p>\r\n	<p style=\"font-size:14px;font-family:arial;color:#666666;\">\r\n		及其优良的气候条件。四季分明，冬 长夏短。每年3月起，气温日渐升高，春意盎然，兽鸟活跃，山峦田野，充满着生机与活力，同时此时降雨较多，可看到云海。到了6月下旬，武陵源开始进入夏季，直至9月上旬。武陵源夏季的平均气温在22至26摄氏度之间，最高时也不过32摄氏度左右。此时，许多地区酷热难熬，而这里却一派清凉，是避暑消夏的理想去处之一。冬季景区山顶与市区截然不同，张家界虽然地处南方，但还是有雪景的出现！是冬季摄影的好去处！\r\n	</p>\r\n	<p style=\"font-size:14px;font-family:arial;color:#666666;\">\r\n		<br />\r\n	</p>\r\n	<p style=\"font-size:14px;font-family:arial;color:#666666;\">\r\n		<img alt=\"张家界黄石寨\" src=\"http://manage.zjji.com/uploads/201506/261046028952.jpg\" width=\"730\" height=\"450\" title=\"张家界黄石寨\" align=\"\" /> \r\n	</p>\r\n	<p style=\"font-size:14px;font-family:arial;color:#666666;\">\r\n		&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<a href=\"http://www.travelzjj.com/panorama/detail/1067.html\" target=\"_blank\" class=\"keywords\">黄石寨</a>日出\r\n	</p>\r\n	<p style=\"font-size:14px;font-family:arial;color:#666666;\">\r\n		<br />\r\n	</p>\r\n	<p style=\"font-size:14px;font-family:arial;color:#666666;\">\r\n		&nbsp;张家界以岩称奇。这里三千座奇峰拔地而起，形态各异，有的似玉柱神鞭，立地顶天；有的像铜墙铁壁，巍然屹立；有的如晃板垒卵，摇摇欲坠；有的若盆景古董，玲珑剔透......神奇而又真实，迷离而又实在，不是艺术创造胜以艺术创造，令人叹为观止，张家界奇独特的风景，丰富的旅游资源，唯美的自然风光，无一不向世人展示着它雄伟壮丽。\r\n	</p>\r\n	<p style=\"font-size:14px;font-family:arial;color:#666666;\">\r\n		<br />\r\n	</p>\r\n	<p style=\"font-size:14px;font-family:arial;color:#666666;\">\r\n		<img alt=\"张家界鹞子寨\" src=\"http://manage.zjji.com/uploads/201506/261046371955.jpg\" width=\"730\" height=\"450\" title=\"张家界鹞子寨\" align=\"\" /> \r\n	</p>\r\n	<p style=\"font-size:14px;font-family:arial;color:#666666;\">\r\n		&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<a href=\"http://www.travelzjj.com/panorama/detail/1070.html\" target=\"_blank\" class=\"keywords\">鹞子寨</a>&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;摄影者：郑亚平\r\n	</p>\r\n	<p style=\"font-size:14px;font-family:arial;color:#666666;\">\r\n		<br />\r\n	</p>\r\n</div>\r\n<div class=\"all3d-txtList\" style=\"margin:20px 0px;color:#333333;font-family:\'Microsoft Yahei\', \'Hiragino Sans GB\', \'Helvetica Neue\', Helvetica, tahoma, arial, Verdana, sans-serif, \'WenQuanYi Micro Hei\', 宋体;\">\r\n	<div class=\"all3d-txt_title\">\r\n		<h3 style=\"font-size:18px;font-weight:normal;font-family:\'Microsoft YaHei\';color:#039FEB;text-indent:10px;\">\r\n			推荐理由\r\n		</h3>\r\n	</div>\r\n	<p style=\"font-size:14px;font-family:arial;color:#666666;\">\r\n		<span style=\"line-height:1.5;\"><br />\r\n</span> \r\n	</p>\r\n	<p style=\"font-size:14px;font-family:arial;color:#666666;\">\r\n		<span>其间有奇峰3000多座，这些石峰如人如兽、如器如物，形象逼真，气势壮观。峰间峡谷，溪流潺潺，浓荫蔽日。有“三千奇峰，八百秀水”之美称。公园不仅自然风光壮美绝伦，而且森林植物和野生动物资源极为丰富，森林覆盖率达98％，是一座巨大的生物宝库和天然氧吧，被称为“自然博物馆和天然植物园”。草木禽兽与奇山异水，同生共荣，形成完美的自然生态系统。</span> \r\n	</p>\r\n	<p style=\"font-size:14px;font-family:arial;color:#666666;\">\r\n		<span></span>&nbsp;\r\n	</p>\r\n	<p style=\"font-size:14px;font-family:arial;color:#666666;\">\r\n		<span>境内峰奇岩险，谷深涧幽，水秀林碧，云缭雾绕。集雄、奇、幽、野、秀于一体，汇峰、谷、壑、林、水为一色。<a href=\"http://www.travelzjj.com/panorama/detail/1051.html\" target=\"_blank\" class=\"keywords\">张家界国家森林公园</a>主要景点有：<a href=\"http://www.travelzjj.com/panorama/detail/1069.html\" target=\"_blank\" class=\"keywords\">金鞭溪</a>，<a href=\"http://www.travelzjj.com/panorama/detail/1060.html\" target=\"_blank\" class=\"keywords\">杨家界</a>景区，乌龙寨，<a href=\"http://www.travelzjj.com/panorama/detail/1070.html\" target=\"_blank\" class=\"keywords\">鹞子寨</a>景区，<a href=\"http://www.travelzjj.com/panorama/detail/1068.html\" target=\"_blank\" class=\"keywords\">天子山</a>景区</span> \r\n	</p>\r\n	<p style=\"font-size:14px;font-family:arial;color:#666666;\">\r\n		<br />\r\n	</p>\r\n</div>\r\n<div class=\"all3d-txtList\" style=\"margin:20px 0px;color:#333333;font-family:\'Microsoft Yahei\', \'Hiragino Sans GB\', \'Helvetica Neue\', Helvetica, tahoma, arial, Verdana, sans-serif, \'WenQuanYi Micro Hei\', 宋体;\">\r\n	<div class=\"all3d-txt_title\">\r\n		<h3 style=\"font-size:18px;font-weight:normal;font-family:\'Microsoft YaHei\';color:#039FEB;text-indent:10px;\">\r\n			交通路线\r\n		</h3>\r\n	</div>\r\n	<p style=\"font-size:14px;font-family:arial;color:#666666;\">\r\n		<span style=\"line-height:1.5;\"></span> \r\n	</p>\r\n	<p style=\"font-size:14px;font-family:arial;color:#666666;\">\r\n		<span style=\"line-height:1.5;\"><br />\r\n</span> \r\n	</p>\r\n	<p style=\"font-size:14px;font-family:arial;color:#666666;\">\r\n		<span style=\"line-height:1.5;\">在<a href=\"http://www.travelzjj.com/\" target=\"_blank\" class=\"keywords\">张家界</a>市中心汽车站（火车站旁50米）就可搭乘去往森林公园、武陵源的线路巴士，每十分钟发班。</span> \r\n	</p>\r\n	<p style=\"font-size:14px;font-family:arial;color:#666666;\">\r\n		公园交通十分方便，距市城区、飞机场、火车站仅28公里。景区内已建成58公里的国际标准游道、安全舒适的索道和开通了环保车。\r\n	</p>\r\n</div>\r\n<div class=\"all3d-txtList\" style=\"margin:20px 0px;color:#333333;font-family:\'Microsoft Yahei\', \'Hiragino Sans GB\', \'Helvetica Neue\', Helvetica, tahoma, arial, Verdana, sans-serif, \'WenQuanYi Micro Hei\', 宋体;\">\r\n	<div class=\"all3d-txt_title\">\r\n		<h3 style=\"font-size:18px;font-weight:normal;font-family:\'Microsoft YaHei\';color:#039FEB;text-indent:10px;\">\r\n			游览须知\r\n		</h3>\r\n	</div>\r\n	<p style=\"font-size:14px;font-family:arial;color:#666666;\">\r\n		<span style=\"line-height:1.5;\"><br />\r\n</span> \r\n	</p>\r\n	<p style=\"font-size:14px;font-family:arial;color:#666666;\">\r\n		&nbsp;<span style=\"line-height:1.5;\">游览景区一般为2到3天。</span> \r\n	</p>\r\n	<p style=\"font-size:14px;font-family:arial;color:#666666;\">\r\n		景区有5个门票站，其中森林公园门票站、吴家峪门票站（武陵源标志门）是游人最常的选择。\r\n	</p>\r\n	<p style=\"font-size:14px;font-family:arial;color:#666666;\">\r\n		景区游览路线可简要形容为山下游览路线、山上游览路线；\r\n	</p>\r\n	<p style=\"font-size:14px;font-family:arial;color:#666666;\">\r\n		山下游览路线为：森林公园门票站-大氧吧广场-<a href=\"http://www.travelzjj.com/panorama/detail/1067.html\" target=\"_blank\" class=\"keywords\">黄石寨</a>-<a href=\"http://www.travelzjj.com/panorama/detail/1069.html\" target=\"_blank\" class=\"keywords\">金鞭溪</a>-水绕四门-<a href=\"http://www.travelzjj.com/panorama/detail/1066.html\" target=\"_blank\" class=\"keywords\">十里画廊</a>-吴家峪门票站。山上游览路线为：<a href=\"http://www.travelzjj.com/panorama/detail/1065.html\" target=\"_blank\" class=\"keywords\">袁家界</a>-<a href=\"http://www.travelzjj.com/panorama/detail/1060.html\" target=\"_blank\" class=\"keywords\">杨家界</a>-<a href=\"http://www.travelzjj.com/panorama/detail/1068.html\" target=\"_blank\" class=\"keywords\">天子山</a>。另有<a href=\"http://www.travelzjj.com/panorama/detail/1070.html\" target=\"_blank\" class=\"keywords\">鹞子寨</a>，可选择单独游览。\r\n	</p>\r\n	<p style=\"font-size:14px;font-family:arial;color:#666666;\">\r\n		<br />\r\n	</p>\r\n</div>\r\n<div class=\"all3d-txtList\" style=\"margin:20px 0px;color:#333333;font-family:\'Microsoft Yahei\', \'Hiragino Sans GB\', \'Helvetica Neue\', Helvetica, tahoma, arial, Verdana, sans-serif, \'WenQuanYi Micro Hei\', 宋体;\">\r\n	<div class=\"all3d-txt_title\">\r\n		<h3 style=\"font-size:18px;font-weight:normal;font-family:\'Microsoft YaHei\';color:#039FEB;text-indent:10px;\">\r\n			相关信息\r\n		</h3>\r\n	</div>\r\n	<p style=\"font-size:14px;font-family:arial;color:#666666;\">\r\n		<span style=\"line-height:1.5;\"></span>&nbsp;\r\n	</p>\r\n	<p style=\"font-size:14px;font-family:arial;color:#666666;\">\r\n		<span style=\"line-height:1.5;\">门票：A.248元（含保险，4天有效） B.301元（含保险，7天有效）</span> \r\n	</p>\r\n	<p style=\"font-size:14px;font-family:arial;color:#666666;\">\r\n		地址：<a href=\"http://www.travelzjj.com/\" target=\"_blank\" class=\"keywords\">张家界</a>市武陵源区\r\n	</p>\r\n</div>',NULL,NULL,NULL,'http://pad.pinhai.com.cn:8081/zjjtour-admin/attached/image/20160111/20160111235124_162.jpg','http://pad.pinhai.com.cn:8081/zjjtour-admin/attached/image/20160128/20160128232213_22.png',NULL,1,'2015年12月14日至2016年1月4日，张家界市司法局联合市、区县两级检察机关对全市各区县社区矫正工作和社区矫正对象进行了一次拉网式大排查。','0','1','1','0',1017,'1',1,'2016-01-28 21:56:01','123','ARTICLE',NULL,NULL,NULL,NULL),(24,'八大公山','八大公山','<div class=\"all3d-txtList\" style=\"margin:20px 0px;color:#333333;font-family:\'Microsoft Yahei\', \'Hiragino Sans GB\', \'Helvetica Neue\', Helvetica, tahoma, arial, Verdana, sans-serif, \'WenQuanYi Micro Hei\', 宋体;\">\r\n	<div class=\"all3d-txt_title\">\r\n		<h3 style=\"font-size:18px;font-weight:normal;font-family:\'Microsoft YaHei\';color:#039FEB;text-indent:10px;\">\r\n			简介\r\n		</h3>\r\n	</div>\r\n	<p class=\"MsoNormal\" style=\"font-size:14px;font-family:arial;color:#666666;\">\r\n		<br />\r\n	</p>\r\n	<p style=\"font-size:14px;font-family:arial;color:#666666;\">\r\n		<img alt=\"八大公山\" src=\"http://www.travelzjj.com/uploads/201506/272047340897.jpg\" width=\"730\" height=\"450\" title=\"八大公山\" align=\"\" /> \r\n	</p>\r\n	<p style=\"font-size:14px;font-family:arial;color:#666666;\">\r\n		<br />\r\n	</p>\r\n	<p style=\"font-size:14px;font-family:arial;color:#666666;\">\r\n		<a href=\"http://www.travelzjj.com/panorama/detail/1130.html\" target=\"_blank\" class=\"keywords\">八大公山</a>自然保护区总面积2万公顷，分为天平山、杉木界、斗篷山三大林区，主峰斗篷山海拔1898.4米，为武陵山脉南麓之巅。气候属北亚热带山地湿润季风气候，夏秋季短，春冬季长，最冷月平均气温0.1℃，最热月平均气温22.8℃，相对湿度90%以上。区内群山起伏，山脉纵横交错，599座山峰星罗棋布，奇峰突起，溪流、瀑布众多。独特的地理环境，孕育和保存了亚热带最完整、面积最大原生型常绿阔叶林。\r\n	</p>\r\n	<p style=\"font-size:14px;font-family:arial;color:#666666;\">\r\n		<br />\r\n	</p>\r\n	<p style=\"font-size:14px;font-family:arial;color:#666666;\">\r\n		<img alt=\"张家界八大公山\" src=\"http://www.travelzjj.com/uploads/201506/272047553808.jpg\" width=\"730\" height=\"450\" title=\"张家界八大公山\" align=\"\" /> \r\n	</p>\r\n	<p style=\"font-size:14px;font-family:arial;color:#666666;\">\r\n		<br />\r\n	</p>\r\n</div>\r\n<div class=\"all3d-txtList\" style=\"margin:20px 0px;color:#333333;font-family:\'Microsoft Yahei\', \'Hiragino Sans GB\', \'Helvetica Neue\', Helvetica, tahoma, arial, Verdana, sans-serif, \'WenQuanYi Micro Hei\', 宋体;\">\r\n	<div class=\"all3d-txt_title\">\r\n		<h3 style=\"font-size:18px;font-weight:normal;font-family:\'Microsoft YaHei\';color:#039FEB;text-indent:10px;\">\r\n			户外攻略\r\n		</h3>\r\n	</div>\r\n	<p style=\"font-size:14px;font-family:arial;color:#666666;\">\r\n		<br />\r\n	</p>\r\n	<p class=\"MsoNormal\" style=\"font-size:14px;font-family:arial;color:#666666;\">\r\n		【资源种类】原生性森林、瀑布、山峦\r\n	</p>\r\n	<p class=\"MsoNormal\" style=\"font-size:14px;font-family:arial;color:#666666;\">\r\n		【户外项目】徒步山地穿越、溯溪、岩降、瀑降、水上抱石、定向越野、野营等\r\n	</p>\r\n	<p class=\"MsoNormal\" style=\"font-size:14px;font-family:arial;color:#666666;\">\r\n		【海拔范围】346m至2003m\r\n	</p>\r\n	<p class=\"MsoNormal\" style=\"font-size:14px;font-family:arial;color:#666666;\">\r\n		<span style=\"line-height:1.5;\">【线路难度】5星</span><span style=\"line-height:1.5;\">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</span> \r\n	</p>\r\n	<p class=\"MsoNormal\" style=\"font-size:14px;font-family:arial;color:#666666;\">\r\n		<span style=\"line-height:1.5;\">【线路强度】4星</span><span style=\"line-height:1.5;\">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</span> \r\n	</p>\r\n	<p class=\"MsoNormal\" style=\"font-size:14px;font-family:arial;color:#666666;\">\r\n		<span style=\"line-height:1.5;\">【线路风景】4星</span> \r\n	</p>\r\n	<p class=\"MsoNormal\" style=\"font-size:14px;font-family:arial;color:#666666;\">\r\n		<span style=\"line-height:1.5;\">【装备要求】速干衣裤、冲锋衣、防寒衣、登山包、登山鞋、登山杖、水袋、手套、头巾、野炊用具、露营装备、头盔、药品等</span> \r\n	</p>\r\n	<p class=\"MsoNormal\" style=\"font-size:14px;font-family:arial;color:#666666;\">\r\n		<span style=\"line-height:1.5;\">【周边资源】<a href=\"http://www.travelzjj.com/panorama/detail/1099.html\" target=\"_blank\" class=\"keywords\">贺龙故居</a>、<a href=\"http://www.travelzjj.com/panorama/detail/1103.html\" target=\"_blank\" class=\"keywords\">廖汉生故居</a>、桑鹤土司结盟遗址、澧水源头七眼泉等。</span> \r\n	</p>\r\n	<p class=\"MsoNormal\" style=\"font-size:14px;font-family:arial;color:#666666;\">\r\n		&nbsp;<strong>【交通指引】</strong> \r\n	</p>\r\n	<p class=\"MsoNormal\" style=\"margin-left:0cm;font-size:14px;font-family:arial;color:#666666;text-indent:0cm;\">\r\n		1.进入：桑植汽车西站至芭茅溪乡（20元），然后租车进入辽竹湾村（穿越的起点）。\r\n	</p>\r\n	<p class=\"MsoNormal\" style=\"margin-left:0cm;font-size:14px;font-family:arial;color:#666666;text-indent:0cm;\">\r\n		2.回程：下山后再沙园联系芭茅溪车主接至芭茅溪，原路返回桑植县。\r\n	</p>\r\n	<p class=\"MsoNormal\" style=\"font-size:14px;font-family:arial;color:#666666;\">\r\n		<br />\r\n	</p>\r\n	<p class=\"MsoNormal\" style=\"font-size:14px;font-family:arial;color:#666666;\">\r\n		<strong>行程</strong> \r\n	</p>\r\n	<p class=\"MsoNormal\" style=\"font-size:14px;font-family:arial;color:#666666;\">\r\n		DAY1\r\n	</p>\r\n	<p class=\"MsoNormal\" style=\"font-size:14px;font-family:arial;color:#666666;\">\r\n		桑植县-芭茅溪-四门岩林场\r\n	</p>\r\n	<p class=\"MsoNormal\" style=\"font-size:14px;font-family:arial;color:#666666;\">\r\n		[备注]桑植县至芭茅溪乡后中餐，推荐参观：圆梦饭庄（价格20-30元/人，联系电话：13974426576）。\r\n	</p>\r\n	<p class=\"MsoNormal\" style=\"font-size:14px;font-family:arial;color:#666666;\">\r\n		中餐后租车往辽竹湾，在辽竹湾村部下车后沿小路步行10km左右至四门岩林场，宿营四门岩林场场部。\r\n	</p>\r\n	<p class=\"MsoNormal\" style=\"font-size:14px;font-family:arial;color:#666666;\">\r\n		DAY2\r\n	</p>\r\n	<p class=\"MsoNormal\" style=\"font-size:14px;font-family:arial;color:#666666;\">\r\n		四门岩林场-长坪-大顶坪\r\n	</p>\r\n	<p class=\"MsoNormal\" style=\"font-size:14px;font-family:arial;color:#666666;\">\r\n		<br />\r\n	</p>\r\n	<p class=\"MsoNormal\" style=\"font-size:14px;font-family:arial;color:#666666;\">\r\n		[备注]\r\n	</p>\r\n	<p class=\"MsoNormal\" style=\"font-size:14px;font-family:arial;color:#666666;\">\r\n		从四门岩林场出发，翻山至长坪峡谷入口，沿长坪沟溯溪而上，长坪午休，午休后顺干谷河床一路向上提升面，直达大顶坪宿营。\r\n	</p>\r\n	<p class=\"MsoNormal\" style=\"font-size:14px;font-family:arial;color:#666666;\">\r\n		DAY3\r\n	</p>\r\n	<p class=\"MsoNormal\" style=\"font-size:14px;font-family:arial;color:#666666;\">\r\n		大顶坪-瞭望塔-小庄坪（天平山接待站）\r\n	</p>\r\n	<p class=\"MsoNormal\" style=\"font-size:14px;font-family:arial;color:#666666;\">\r\n		DAY4\r\n	</p>\r\n	<p class=\"MsoNormal\" style=\"font-size:14px;font-family:arial;color:#666666;\">\r\n		小庄坪-连三台-毛垭半坡\r\n	</p>\r\n	<p class=\"MsoNormal\" style=\"font-size:14px;font-family:arial;color:#666666;\">\r\n		[备注]沿山腰猎户小道环山至青龙湾，青龙湾对面有一小溪沟，顺沟而下可见三棵枯树，再往下见干枯河床，顺河床而下至漆水塔休息。\r\n	</p>\r\n	<p class=\"MsoNormal\" style=\"font-size:14px;font-family:arial;color:#666666;\">\r\n		顺峡谷而下行至毛垭半坡农户家宿营。全程无手机信号，需9小时。晚上可<a href=\"http://www.travelzjj.com/panorama/detail/1201.html\" target=\"_blank\" class=\"keywords\">住宿</a>当地农家，体验土家族的日常生活。\r\n	</p>\r\n	<p class=\"MsoNormal\" style=\"font-size:14px;font-family:arial;color:#666666;\">\r\n		DAY5\r\n	</p>\r\n	<p class=\"MsoNormal\" style=\"font-size:14px;font-family:arial;color:#666666;\">\r\n		毛垭半坡-黄连台（李家河）\r\n	</p>\r\n	<p class=\"MsoNormal\" style=\"font-size:14px;font-family:arial;color:#666666;\">\r\n		[备注]\r\n	</p>\r\n	<p class=\"MsoNormal\" style=\"font-size:14px;font-family:arial;color:#666666;\">\r\n		早餐后从毛垭半坡至毛垭村，有小卖部补结，从毛垭村小路下山至黄连台村长宿营，全天行程需7小时。\r\n	</p>\r\n	<p class=\"MsoNormal\" style=\"font-size:14px;font-family:arial;color:#666666;\">\r\n		黄连台村村长杨志山15074408816\r\n	</p>\r\n	<p class=\"MsoNormal\" style=\"font-size:14px;font-family:arial;color:#666666;\">\r\n		&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 书记刘伟华13407443072\r\n	</p>\r\n	<p class=\"MsoNormal\" style=\"font-size:14px;font-family:arial;color:#666666;\">\r\n		DAY6\r\n	</p>\r\n	<p class=\"MsoNormal\" style=\"font-size:14px;font-family:arial;color:#666666;\">\r\n		黄连台-小溪口-天梯人家-七湾-芭茅溪\r\n	</p>\r\n	<p class=\"MsoNormal\" style=\"font-size:14px;font-family:arial;color:#666666;\">\r\n		[备注]\r\n	</p>\r\n	<p class=\"MsoNormal\" style=\"font-size:14px;font-family:arial;color:#666666;\">\r\n		至黄连台村部，沿溪边土公路往下到达小溪口，公路可达芭茅溪镇，公路旁小溪进山约40分钟山路到达天梯人家，此处可观60m瀑布。天梯人家徒步七湾下山到达天平山公路，可联系包车来接至芭茅溪，车费30元/车（司机张师傅13707446937）。<span style=\"line-height:1.5;\"></span> \r\n	</p>\r\n	<p class=\"MsoNormal\" style=\"font-size:14px;font-family:arial;color:#666666;\">\r\n		<span style=\"line-height:1.5;\"><img alt=\"张家界八大公山地图\" src=\"http://www.travelzjj.com/uploads/201506/272049474905.jpg\" width=\"730\" height=\"450\" title=\"张家界八大公山地图\" align=\"\" /><br />\r\n</span> \r\n	</p>\r\n	<p style=\"font-size:14px;font-family:arial;color:#666666;\">\r\n		<br />\r\n	</p>\r\n</div>\r\n<div class=\"all3d-txtList\" style=\"margin:20px 0px;color:#333333;font-family:\'Microsoft Yahei\', \'Hiragino Sans GB\', \'Helvetica Neue\', Helvetica, tahoma, arial, Verdana, sans-serif, \'WenQuanYi Micro Hei\', 宋体;\">\r\n	<div class=\"all3d-txt_title\">\r\n		<h3 style=\"font-size:18px;font-weight:normal;font-family:\'Microsoft YaHei\';color:#039FEB;text-indent:10px;\">\r\n			安全提示\r\n		</h3>\r\n	</div>\r\n	<p class=\"MsoNormal\" style=\"font-size:14px;font-family:arial;color:#666666;\">\r\n		<br />\r\n	</p>\r\n	<p class=\"MsoNormal\" style=\"font-size:14px;font-family:arial;color:#666666;\">\r\n		【安全提示】该线路需要扁带、对讲机、急救药品等公共装备方可成行，切勿孤身或私下结伴前往，需联系当地户外俱乐部提供专业向导和保护。\r\n	</p>\r\n	<p class=\"MsoNormal\" style=\"font-size:14px;font-family:arial;color:#666666;\">\r\n		此行程路途较长，而且进入谷底，手机信号不好，也有可能没有；又出于隐雷区，雨天建议慎重出行。谷中暂时没有小商品出售，进入景区要带足食物和饮水保持体力，可以带些高能量的食物，如巧克力、饼干、肉类等；景区中有许多飞禽走兽，请远离并保护它们，切勿伤害它们；山中雨雾笼罩，有时豁然开朗，横穿石壁，自然温服比较低，风力也会大些，请务必注意保暖，适当带些衣服，防止温度突变，引起身体不适。\r\n	</p>\r\n	<p class=\"MsoNormal\" style=\"font-size:14px;font-family:arial;color:#666666;\">\r\n		特别提醒：<a href=\"http://www.travelzjj.com/panorama/detail/1130.html\" target=\"_blank\" class=\"keywords\">八大公山</a>毒蛇（五步蛇）出没，要防止被毒蛇咬伤。\r\n	</p>\r\n	<p class=\"MsoNormal\" style=\"font-size:14px;font-family:arial;color:#666666;\">\r\n		遇险求助电话：<span style=\"line-height:1.5;\">八大公山乡政府0744-6730001</span> \r\n	</p>\r\n</div>',1,0,'2016-01-11 23:55:49',NULL,'http://pad.pinhai.com.cn:8081/zjjtour-admin/attached/image/20160128/20160128232240_791.jpg',NULL,1,'2015年12月14日至2016年1月4日，张家界市司法局联合市、区县两级检察机关对全市各区县社区矫正工作和社区矫正对象进行了一次拉网式大排查。','0','1','1','0',1015,'1',12,'2016-01-13 00:34:18','李四审核通过','ARTICLE',NULL,NULL,NULL,NULL),(25,'张家界市司法局完成对社区矫正对象首次集中大排查','张家界市司法局完成对社区矫正对象首次集中大排查','<p style=\"font-size:16px;font-family:\'Microsoft YaHei\';color:#666666;text-indent:2em;\">\r\n	<p style=\"font-size:14px;font-family:宋体;color:#666666;text-indent:2em;background-color:#FFFFFF;\">\r\n		张家界在线1月11日讯(通讯员 蔡勇)为掌握社区矫正基层监管安全形势，防止出现脱管漏管，进一步推动基层司法所社区矫正监管工作规范化发展，根据省厅工作部署，2015年12月14日至2016年1月4日，张家界市司法局联合市、区县两级检察机关对全市各区县社区矫正工作和社区矫正对象进行了一次拉网式大排查。此次排查采取点验核实社区服刑人员身份信息、集中训话、查阅社区矫正工作档案和台账的方式，共深入到78个基层乡镇司法所(含12个代管所)，现场查阅社区矫正工作档案596份，核实训话社区矫正对象596人。\r\n	</p>\r\n	<p style=\"font-size:14px;font-family:宋体;color:#666666;text-indent:2em;background-color:#FFFFFF;\">\r\n		<br />\r\n	</p>\r\n	<p style=\"font-size:14px;font-family:宋体;color:#666666;text-indent:2em;background-color:#FFFFFF;\">\r\n		从排查总体情况看，工作扎实规范，形势超过预期，工作档案整理和社区服刑人员监管较往年有显著提高。如桑植县有社区矫正对象239人，矫正工作任务较重，但全县社区矫正工作扎实稳进，县矫正中心已经建成投入使用，司法所收编人员配置到位，能够较好的履行监管职责，维护刑罚非监禁执行的权威。在调查评估工作中,细砂坪、龙潭坪司法所严格把关，在接受委托调查评估时，取得罪犯本人或亲属、相关人员承诺,保证接受社区矫正后才出具评估意见，从源头上树立了司法所的刑罚执行职能严肃性。汨湖司法所长积极开展工作，多措并举，利用微信群建立矫正对象动态平台，矫正对象发送定位地图，对矫正对象动态轨迹一目了然，做到监管到位。如慈利县零阳、杉木桥、龙潭河、赵家岗，武陵源区索溪镇、军地坪、协合等司法所社区矫正工作档案规范、台账齐全，严格按照《湖南省社区矫正实施细则》履行监管职责。慈利县零阳镇司法所社区矫正对象多，监管任务重，司法员采取分片区管理方式，档案台账规范齐全，矫正对象监管到位。武陵源区索溪镇、军地坪、协合三个司法所的所长都是刚参加工作不久的女大学生，责任心强，业务素质高，对服刑人员监管到位。永定区社区矫正工作领导高度重视，人员充足，力量较强，在全市率先开展政府购买社区矫正服务工作，利用购买的岗位专人负责走访评估、手机定位、心理咨询。社区矫正专项资金保障得力，司法所按照矫正对象数量落实办公办案经费，司法员整体业务能力大有提升，工作能力增强，大部分司法所对矫正对象管理有力，档案台账整体质量大有改观，日常监管工作较为规范。如谢家垭、温塘、三家馆、尹家溪、新桥、南庄坪、沙堤、阳湖坪、崇文、大桥等司法所，矫正对象数量较多，成分复杂，司法所长、司法员工作负责，档案规范，严格落实监管制度，维护了良好的社区矫正安全局面。\r\n	</p>\r\n	<p style=\"font-size:14px;font-family:宋体;color:#666666;text-indent:2em;background-color:#FFFFFF;\">\r\n		<br />\r\n	</p>\r\n	<p style=\"font-size:14px;font-family:宋体;color:#666666;text-indent:2em;background-color:#FFFFFF;\">\r\n		但是排查中也暴露出司法所社区矫正工作尚存在一些问题。一是档案、台账有待规范健全。《湖南省社区矫正实施细则》规定了社区矫正对象由司法所建立工作档案，档案目录和格式文书、表格都已统一和规范。司法所对社区矫正对象的监管，主要就体现在档案和台账，档案和台账的规范说明司法员正常履行监管职责。但有些司法所档案不全、台账空白甚至没有。二是请销假制度不规范、外出务工不符合管理规定。《湖南省社区矫正实施细则》明确规定了请假外出制度，由于张家界偏远乡镇社区矫正对象较多，有的家庭困难本地难以找到适合的工作，少数矫正对象需要外出务工，但是没有按规定办理居住地变更手续，履行请销假程序不规范。三是奖惩考核评分不及时、分级管理不明确。按规定，司法所应当及时记录社区矫正人员接受监督管理、参加教育学习和社区服务等情况,定期对其接受社区矫正的表现进行考核，根据考核结果,结合再犯罪风险评估以及矫正效果评估情况,对社区矫正人员实施分级分类管理。但部分司法所工作档案内每月的奖惩评分情况不明确或是没有奖惩评分表，对象管理分级不明确，点训过程中，矫正对象不知道自己的管理级别，造成所有对象等同级别管理。\r\n	</p>\r\n	<p style=\"font-size:14px;font-family:宋体;color:#666666;text-indent:2em;background-color:#FFFFFF;\">\r\n		<br />\r\n	</p>\r\n	<p style=\"font-size:14px;font-family:宋体;color:#666666;text-indent:2em;background-color:#FFFFFF;\">\r\n		针对存在的问题，市局除现场指出和纠正外，还制发了督查通报，要求各区县社区矫正工作要从以下几方面着手：一是提高司法所工作人员对社区矫正工作的认识。社区矫正是司法行政机关的重要职能，司法所是刑法非监禁刑罚执行的日常监管机构。社区矫正工作要作为全局、全所工作的重中之重来抓，要认真学习好、领会好、贯彻好中央、省委省政府和省司法厅关于社区矫正和安置帮教工作的一系列决策部署，创新思路，强化措施，坚决完成好上级交给的各项任务，切实履行司法行政法定职能。二是加大对司法所人员的培训力度，重点解决因系统性、针对性培训不足和司法所人员调整变动大所造成的业务不熟悉、工作不规范等问题。通过培训提高司法所人员对社区矫正职能工作和刑罚执行的认识，提高司法所人员对业务工作档案的整理水平。对工作欠规范的司法所，要经常下所指导和检查，结合绩效考评与检察机关法律监督推动工作进一步规范。三是规范司法所监管工作和档案台账。司法所严格按照区(县)局印发的档案目录、格式文书、表格和台账装订要求，完善相关资料内容。落实司法所监管措施，继续利用政府购买服务手机定位做好动态管理，利用奖惩考核做好矫正对象监管等级分级管理，针对此次督查的问题，进一步完善档案和台账内容。\r\n	</p>\r\n	<p style=\"font-size:14px;font-family:宋体;color:#666666;text-indent:2em;background-color:#FFFFFF;\">\r\n		<br />\r\n	</p>\r\n	<p style=\"font-size:14px;font-family:宋体;color:#666666;text-indent:2em;background-color:#FFFFFF;\">\r\n		此次大排查，效果显著，意义深远。一是社区矫正工作开展以来，这是我市首次联合市及区县检察机关共同执法。司法、检察系统在这次排查中，互相对比社区矫正对象底数，做到底数无偏差，确保没有出现脱管、漏管和虚管，共同掌握全市社区矫正监管安全形势。二是通过核实社区矫正对象身份信息、集中点名训话社区矫正对象，对矫正对象的罪犯身份意识给予了强化认识，起到了震慑的效果，彰显了司法行政机关的威严，为基层司法所树立了监管信心和执法威信。三是通过查阅档案台账，指出了司法所监管中存在的问题，起到了对司法所培训指导和推动工作的效果。四是全市社区矫正严肃的监管措施获得了检察机关的高度肯定，两家系统的合作为今后我市社区矫正工作良好的发展形势奠定了坚实的基础。\r\n	</p>\r\n</p>\r\n<div>\r\n	<span id=\"__kindeditor_bookmark_end_9__\"></span><br />\r\n</div>',1,0,'2016-01-12 00:42:49',NULL,'http://pad.pinhai.com.cn:8081/zjjtour-admin/attached/image/20160128/20160128232213_22.png',NULL,5,'2015年12月14日至2016年1月4日，张家界市司法局联合市、区县两级检察机关对全市各区县社区矫正工作和社区矫正对象进行了一次拉网式大排查。','1','1','1','0',1038,'1',1,'2016-01-28 22:10:53','123','ARTICLE',NULL,NULL,NULL,NULL),(26,'李四添加新闻','李四添加新闻','李四添加新闻',13,0,'2016-01-13 00:35:04','http://localhost:8080/zjjtour-admin/attached/image/20160128/20160128215438_558.jpg','http://pad.pinhai.com.cn:8081/zjjtour-admin/attached/image/20160128/20160128232232_755.jpg',NULL,1,'李四添加新闻','0','1','0','0',1015,'1',1,'2016-01-14 16:28:20','aaa','ARTICLE',NULL,NULL,NULL,NULL),(27,'鱼','123','213',1,0,'2016-01-15 10:50:11',NULL,'http://pad.pinhai.com.cn:8081/zjjtour-admin/attached/image/20160128/20160128231849_219.jpg','123',1,'鱼','0','1','0','0',1012,'1',1,'2016-01-15 10:50:19','123','ARTICLE',NULL,NULL,NULL,NULL),(28,'张家界、凤凰古城精品旅游攻略','张家界、凤凰古城精品旅游攻略','<span style=\"color:#666666;font-family:\'Microsoft YaHei\';font-size:16px;line-height:1.5;\"><a href=\"http://www.travelzjj.com/\" target=\"_blank\" class=\"keywords\">张家界</a>位于湖南西北部，属武陵山脉腹地。因旅游而建、因旅游而兴的张家界</span><span style=\"color:#666666;font-family:\'Microsoft YaHei\';font-size:16px;line-height:1.5;\">市，拥有令世人惊叹的风光。九寨沟看水，张家界</span><span style=\"color:#666666;font-family:\'Microsoft YaHei\';font-size:16px;line-height:1.5;\">看山。武陵源</span><span style=\"color:#666666;font-family:\'Microsoft YaHei\';font-size:16px;line-height:1.5;\">核心景区面积达264平方公里。景区中三千座石峰拨地而起，八百条溪流蜿蜒曲折，来<a href=\"http://www.travelzjj.com/\" target=\"_blank\" class=\"keywords\">张家界旅游</a></span><span style=\"color:#666666;font-family:\'Microsoft YaHei\';font-size:16px;line-height:1.5;\">观光的人，无不被武陵源</span><span style=\"color:#666666;font-family:\'Microsoft YaHei\';font-size:16px;line-height:1.5;\">奇特的砂岩峰林地貌和壮丽的喀斯特景观所倾倒，仿佛置身于神山仙境之中。</span>',1,0,'2016-01-15 18:30:52',NULL,'http://pad.pinhai.com.cn:8081/zjjtour-admin/attached/image/20160128/20160128232213_22.png',NULL,1,' 张家界位于湖南西北部，属武陵山脉腹地。因旅游而建、因旅游而兴的张家界市，拥有令世人惊叹的风光。九寨沟看水，张家界看山。武陵源核心景区面积达264平方公里。景区中三千座石峰拨地而起。','0','1','0','0',1036,'1',1,'2016-01-15 18:31:08','12','ARTICLE',NULL,NULL,NULL,NULL),(31,'畅游张家界','畅游张家界','畅游张家界',1,0,'2016-01-24 17:37:03','http://pad.pinhai.com.cn:8081/zjjtour-admin/attached/image/20160201/20160201001221_62.jpg','http://pad.pinhai.com.cn:8081/zjjtour-admin/attached/image/20160201/20160201001236_791.jpg','123',1,'畅游张家界','0','1','0','0',1054,'1',1,'2016-01-28 21:35:28','123','VIDEO','0','畅游张家界','http://pad.pinhai.com.cn:8081/zjjtour-admin/attached/image/20160128/20160128233226_442.flv',NULL),(32,'歌飞宝峰湖','歌飞宝峰湖','歌飞宝峰湖',1,0,'2016-01-24 17:38:10','http://pad.pinhai.com.cn:8081/zjjtour-admin/attached/image/20160201/20160201000841_850.jpg','http://pad.pinhai.com.cn:8081/zjjtour-admin/attached/image/20160201/20160201000830_729.jpg','歌飞宝峰湖',1,'345','0','1','0','0',1054,'1',1,'2016-01-24 17:48:09','aaaaaaa','VIDEO','1','歌飞宝峰湖','http://pad.pinhai.com.cn:8081/zjjtour-admin/attached/image/20160128/20160128231544_329.mp4',NULL),(33,'123',NULL,'123',1,0,'2016-01-28 21:56:54',NULL,'http://pad.pinhai.com.cn:8081/zjjtour-admin/attached/image/20160128/20160128232148_800.jpg','123',1,NULL,'0','1','0','0',1013,'1',1,'2016-01-28 21:57:02','123','ARTICLE',NULL,NULL,NULL,NULL),(34,'123','123','123',1,0,'2016-01-28 21:57:28',NULL,'http://pad.pinhai.com.cn:8081/zjjtour-admin/attached/image/20160128/20160128232111_350.jpg',NULL,1,NULL,'0','1','0','0',1013,'1',1,'2016-01-28 21:57:38','','ARTICLE',NULL,NULL,NULL,NULL),(35,'123213',NULL,'123',1,0,'2016-01-28 21:57:51',NULL,'http://pad.pinhai.com.cn:8081/zjjtour-admin/attached/image/20160128/20160128232031_107.jpg',NULL,1,NULL,'0','0','0','0',1013,'1',1,'2016-01-28 21:57:57','','ARTICLE',NULL,NULL,NULL,NULL),(36,'3456',NULL,NULL,1,0,'2016-01-28 21:58:13',NULL,'http://pad.pinhai.com.cn:8081/zjjtour-admin/attached/image/20160128/20160128232258_995.jpg',NULL,1,NULL,'0','1','0','0',1013,'1',1,'2016-01-28 21:58:20','324','ARTICLE',NULL,NULL,NULL,NULL),(37,'345',NULL,NULL,1,0,'2016-01-28 21:58:13',NULL,'http://pad.pinhai.com.cn:8081/zjjtour-admin/attached/image/20160128/20160128232135_800.jpg',NULL,1,NULL,'0','1','0','0',1013,'1',1,'2016-01-28 21:58:20','324','ARTICLE',NULL,NULL,NULL,NULL),(38,'张家界雪景摄影旅游线路','张家界雪景摄影旅游线路',NULL,1,0,'2016-01-28 22:02:39',NULL,'http://localhost:8080/zjjtour-admin/attached/image/20160128/20160128220233_632.png',NULL,1,'—— 雪景是张家界一大特色奇观，冬天张家界景区都是被白白积雪覆盖着，整个景区是洁白如瑕的景象展现给所有人的眼中。感觉走向另外一个世界了。张家界一连下的好几场雪，一般最大的一场雪是最好的...','0','1','0','0',1036,'1',1,'2016-01-28 22:02:51','123','ARTICLE',NULL,NULL,NULL,NULL),(39,'测试',NULL,'abc',1,0,'2016-01-28 22:35:48',NULL,'http://pad.pinhai.com.cn:8081/zjjtour-admin/attached/image/20160128/20160128232213_22.png',NULL,1,'abcddd','0','0','0','0',1036,'0',NULL,NULL,NULL,'ARTICLE',NULL,NULL,NULL,NULL),(40,'2016年全国旅游市场工作会议提出 不断提升美丽中国展现力','2016年全国旅游市场工作会议提出 不断提升美丽中国展现力','<p style=\"font-size:16px;font-family:\'Microsoft YaHei\';color:#666666;text-indent:2em;\">\r\n	1月31日，2016年全国旅游市场工作会议在海南省海口市召开。会议的主要任务是贯彻落实2016年全国旅游工作会议精神，总结2015年旅游市场工作，分析当前旅游市场发展形势，明确2016年旅游市场工作目标和任务。\r\n</p>\r\n<p style=\"font-size:16px;font-family:\'Microsoft YaHei\';color:#666666;text-indent:2em;\">\r\n	<br />\r\n</p>\r\n<p style=\"font-size:16px;font-family:\'Microsoft YaHei\';color:#666666;text-indent:2em;\">\r\n	国家旅游局局长李金早，副局长杜江、李世宏，全国31个各省市旅游委（局）负责人和市场处负责人，各驻外旅游办事处和部分旅游企业负责人参加会议。海南省副省长何西庆到会致辞。\r\n</p>\r\n<p style=\"font-size:16px;font-family:\'Microsoft YaHei\';color:#666666;text-indent:2em;\">\r\n	<br />\r\n</p>\r\n<p style=\"font-size:16px;font-family:\'Microsoft YaHei\';color:#666666;text-indent:2em;\">\r\n	李金早说，此次会议是2016年全国旅游工作会议之后召开的第一个全国旅游工作专题会议。近年来，世界各国纷纷制定旅游发展战略，以增加本国综合竞争力。在对外交往中，旅游已经成为重要工作抓手，成为对外交流与合作的重要载体。进入新的发展时期，传统的景点旅游模式已经不能适应新形势的发展，旅游正在从景点旅游向全域旅游转变，越来越多的国际游客希望去往景点之外的地方，深度体验普通民众的生产和生活，需求是全域的，因此我们必须用全域的理念来应对这种需求。在全域旅游的模式下，旅游工作的格局就放大了，旅游市场工作也将从仅是景点景区接待国际游客和狭窄的国际合作，转变为全域接待国际游客，全方位、多层次的国际交流合作。\r\n</p>\r\n<p style=\"font-size:16px;font-family:\'Microsoft YaHei\';color:#666666;text-indent:2em;\">\r\n	<br />\r\n</p>\r\n<p style=\"font-size:16px;font-family:\'Microsoft YaHei\';color:#666666;text-indent:2em;\">\r\n	李金早强调，要改变旅游市场工作手段较陈旧、形式较单一的局面，要把国家推介和地方推介相结合，积极鼓励地方加入市场宣传的大军；要发挥政府和市场两方面作用，在政府推广的同时，大力发挥市场功能和手段，要把旅游宣传<a href=\"http://www.travelzjj.com/active/\" target=\"_blank\" class=\"keywords\">活动</a>搞活，让市场推广主体受益；专业队伍的推介与非专业队伍的推介要相得益彰，在全域旅游概念下，人人都是旅游形象和推介者，这一点是专业推介队伍做不到的。\r\n</p>\r\n<p style=\"font-size:16px;font-family:\'Microsoft YaHei\';color:#666666;text-indent:2em;\">\r\n	<br />\r\n</p>\r\n<p style=\"font-size:16px;font-family:\'Microsoft YaHei\';color:#666666;text-indent:2em;\">\r\n	李世宏以《扩面增量、提质增效，全力做好2016年全国旅游市场工作》为题，作市场工作报告。他说，2015年，旅游市场工作面临诸多挑战和不确定因素，任务十分繁重，全国旅游部门特别是旅游市场部门，认真贯彻落实“515战略”的部署和要求，全力塑造“美丽中国”新品牌，强化宣传推广新方式新手段，大力开展旅游外交和涉港台澳台工作，切实优化旅游消费环境，旅游市场工作取得新进展。\r\n</p>\r\n<p style=\"font-size:16px;font-family:\'Microsoft YaHei\';color:#666666;text-indent:2em;\">\r\n	<br />\r\n</p>\r\n<p style=\"font-size:16px;font-family:\'Microsoft YaHei\';color:#666666;text-indent:2em;\">\r\n	在分析了旅游市场工作的有利机遇和条件、入境旅游市场面临的困难和挑战后，李世宏表示，2016年全国旅游市场工作要坚持稳中求进工作总基调，坚持“不断提升美国中国的展现力”这一方向，紧紧围绕“扩面增量、提质增效”的目标，切实抓住周边市场和传统市场、“一带一路”和新兴市场、港澳台基础市场三大重点市场，力推人文旅游、二三线城市和特色小城镇、创意旅游产品、精品旅游线路四类重点产品，努力拓展市场发展空间，保持市场规模稳中有升，着力提高市场发展质量和效益，全面推进三大市场协调发展。\r\n</p>\r\n<p style=\"font-size:16px;font-family:\'Microsoft YaHei\';color:#666666;text-indent:2em;\">\r\n	<br />\r\n</p>\r\n<p style=\"font-size:16px;font-family:\'Microsoft YaHei\';color:#666666;text-indent:2em;\">\r\n	据了解，2015年，全年整体入境旅游人数达1.338亿人次，同比增长4.0%；实现国际旅游收入1136.5亿美元，同比增长7.8%；出境旅游1.2亿人次，旅游花费1045亿美元，分别同比增长12.0%和16.7%；预计国内旅游突破40亿人次，旅游总收入超过3.42万亿元，分别同比增长10.5%和13.1%。\r\n</p>',1,0,'2016-01-28 23:27:15',NULL,'http://pad.pinhai.com.cn:8081/zjjtour-admin/attached/image/20160128/20160128232710_225.jpg',NULL,1,'国家旅游局局长李金早，副局长杜江、李世宏，全国31个各省市旅游委（局）负责人和市场处负责人，各驻外旅游办事处和部分旅游企业负责人参加会议。','0','1','0','0',1038,'1',1,'2016-01-28 23:27:19','123','ARTICLE',NULL,NULL,NULL,NULL),(41,'张家界摄影旅游线路精品攻略','张家界摄影旅游线路精品攻略','<span style=\"color:#666666;font-family:\'Microsoft YaHei\';font-size:16px;line-height:30px;background-color:#F8F8F8;\">想到张家界拍摄日出，日落的各位朋友需住景区，拍日出住大观台，丁香榕村。拍日落住乌龙寨。</span>',1,0,'2016-01-31 23:50:35',NULL,'http://pad.pinhai.com.cn:8081/zjjtour-admin/attached/image/20160128/20160128232213_22.png',NULL,13,'想到张家界拍摄日出，日落的各位朋友需住景区，拍日出住大观台，丁香榕村。拍日落住乌龙寨。','0','1','1','0',1036,'1',1,'2016-01-31 23:51:53','','ARTICLE',NULL,NULL,NULL,NULL),(42,'2015年张家界自助游最全面必读攻略','2015年张家界自助游最全面必读攻略','<span style=\"color:#666666;font-family:\'Microsoft YaHei\';font-size:16px;line-height:30px;background-color:#F8F8F8;\">自2007年常张高速开通以来，到张家界自驾游是非常的方便了，各地到长沙基本上都是有高速的，而长沙到张家界走长常高速二个小时，再走常张高速二个小时，总共四小时可达。</span>',1,0,'2016-01-31 23:51:11',NULL,'http://pad.pinhai.com.cn:8081/zjjtour-admin/attached/image/20160128/20160128232213_22.png',NULL,4,'自2007年常张高速开通以来，到张家界自驾游是非常的方便了，各地到长沙基本上都是有高速的，而长沙到张家界走长常高速二个小时，再走常张高速二个小时，总共四小时可达。','0','1','1','0',1036,'1',1,'2016-01-31 23:51:53','','ARTICLE',NULL,NULL,NULL,NULL),(43,'史上最完整的的旅游自救手册','史上最完整的的旅游自救手册','<span style=\"color:#666666;font-family:\'Microsoft YaHei\';font-size:16px;line-height:30px;background-color:#F8F8F8;\">旅途漫漫，总有未知的事情在等待我们，有偶遇的惊喜，也会有意外的惊吓，预防突发事件，学会自救互助。</span>',1,0,'2016-01-31 23:51:47',NULL,'http://pad.pinhai.com.cn:8081/zjjtour-admin/attached/image/20160128/20160128232213_22.png',NULL,5,'旅途漫漫，总有未知的事情在等待我们，有偶遇的惊喜，也会有意外的惊吓，预防突发事件，学会自救互助。','0','1','1','0',1036,'1',1,'2016-01-31 23:51:53','','ARTICLE',NULL,NULL,NULL,NULL),(44,'2016年全国旅游工作会议完成各项议程','2016年全国旅游工作会议完成各项议程','<p style=\"font-size:16px;font-family:\'Microsoft YaHei\';color:#666666;text-indent:2em;\">\r\n	1月29日至30日两天时间里，与会代表围绕国家旅游局局长李金早所做旅游工作报告和如何做好2016年旅游工作，努力为“十三五”开好头、起好步等进行了交流。大家表示，2015年，全国旅游行业积极实施“515战略”，各项工作取得新进展，“行业自信、产业自信、事业自信”在全体旅游人心中生根发芽；2016年是“515战略”深度实施的攻坚克难之年，起着承上启下、继往开来的重要作用，因此，一定要凝神聚气、实干强旅，务实推动此次会议确定的各项重点工作。\r\n</p>\r\n<p style=\"font-size:16px;font-family:\'Microsoft YaHei\';color:#666666;text-indent:2em;\">\r\n	<br />\r\n</p>\r\n<p style=\"font-size:16px;font-family:\'Microsoft YaHei\';color:#666666;text-indent:2em;\">\r\n	国家旅游局副局长吴文学在会议总结中指出，做好2016年旅游工作，必须以十八届五中全会提出的五大发展理念为指引，创新发展，统筹政府功能与市场机制；协调发展，统筹产业发展与市场监管；绿色发展，长线工作立足于打持久战，短线工作立足于打歼灭战；开放发展，统筹引进来与走出去；共享发展，统筹改革试验与积累守成。他要求，各地要及时将此次会议精神向党委、政府汇报好，争取各方理解和支持；同时做好“十三五”旅游规划的编制和发布等重点工作。\r\n</p>\r\n<p style=\"font-size:16px;font-family:\'Microsoft YaHei\';color:#666666;text-indent:2em;\">\r\n	<br />\r\n</p>\r\n<p style=\"font-size:16px;font-family:\'Microsoft YaHei\';color:#666666;text-indent:2em;\">\r\n	春节假期临近，吴文学还特别强调了旅游安全和应急工作。他说，春节期间，旅游节庆<a href=\"http://www.travelzjj.com/active/\" target=\"_blank\" class=\"keywords\">活动</a>增多，市场迎来旅游接待和出境旅游高峰，各地要强化属地责任，强化部门联动，切实做好旅游安全的检查排查、信息发布和提示告诫工作，安排好假日值班值守，认真处理投诉咨询，特别要做好旅游安全应急预案等工作。\r\n</p>',1,0,'2016-01-31 23:58:58',NULL,'http://pad.pinhai.com.cn:8081/zjjtour-admin/attached/image/20160128/20160128232213_22.png',NULL,1,'经过两天的全体会议、分组讨论等环节，1月30日，在海南省海口市召开的2016年全国旅游工作会议完成各项议程。','0','1','1','0',1038,'1',1,'2016-02-01 00:00:44','','ARTICLE',NULL,NULL,NULL,NULL),(45,'播洒环保低碳理念 让张家界天更蓝水更绿山更美 ','播洒环保低碳理念 让张家界天更蓝水更绿山更美 ','<p style=\"font-size:16px;font-family:\'Microsoft YaHei\';color:#666666;text-indent:2em;\">\r\n	当你走进风景如画的张家界核心景区, 乘坐景区特色环保车在千奇百怪的山峰间流连忘返之时，除了感叹大自然的鬼斧神工、匠心独具，舒适、安全、低碳的景区交通必定令你印象深刻，而提供服务的就是张家界易程天下环保客运有限公司。\r\n</p>\r\n<p style=\"font-size:16px;font-family:\'Microsoft YaHei\';color:#666666;text-indent:2em;\">\r\n	<br />\r\n</p>\r\n<p style=\"font-size:16px;font-family:\'Microsoft YaHei\';color:#666666;text-indent:2em;text-align:center;\">\r\n	<img src=\"http://www.travelzjj.com/uploads/201601/140842446465.jpg\" alt=\"\" /> \r\n</p>\r\n<p style=\"font-size:16px;font-family:\'Microsoft YaHei\';color:#666666;text-indent:2em;text-align:center;\">\r\n	<br />\r\n</p>\r\n<p style=\"font-size:16px;font-family:\'Microsoft YaHei\';color:#666666;text-indent:2em;\">\r\n	她“低调、内敛、不张扬”，如同多年前吴冠中先生发现张家界时一样的感叹——养在深闺人未识！她从不主动宣传自己，却一直一脉相承地坚守着“为全球人民提供优质安全环保旅游服务”的企业使命，秉承创新务实的企业文化，播酒环保低碳理念，默默地为来自五湖四海的旅客提供安全、优质的旅游客运服务。\r\n</p>\r\n<p style=\"font-size:16px;font-family:\'Microsoft YaHei\';color:#666666;text-indent:2em;\">\r\n	<br />\r\n</p>\r\n<p style=\"font-size:16px;font-family:\'Microsoft YaHei\';color:#666666;text-indent:2em;text-align:center;\">\r\n	<img src=\"http://www.travelzjj.com/uploads/201601/140843016188.jpg\" alt=\"\" /> \r\n</p>\r\n<p style=\"font-size:16px;font-family:\'Microsoft YaHei\';color:#666666;text-indent:2em;text-align:center;\">\r\n	<br />\r\n</p>\r\n<p style=\"font-size:16px;font-family:\'Microsoft YaHei\';color:#666666;text-indent:2em;\">\r\n	<strong>保护核心景区环境,</strong><span style=\"line-height:1.5;\"><strong>启航低碳绿色交通</strong></span> \r\n</p>\r\n<p style=\"font-size:16px;font-family:\'Microsoft YaHei\';color:#666666;text-indent:2em;\">\r\n	<span style=\"line-height:1.5;\"><br />\r\n</span> \r\n</p>\r\n<p style=\"font-size:16px;font-family:\'Microsoft YaHei\';color:#666666;text-indent:2em;\">\r\n	1982年，张家界成为我国大陆第一个国家森林公园，自此迈上了以旅游兴市的快速发展之路。但在随后的十几年，因受交通资源长期匮乏的影响，片面追求经济效益，而忽视了交通的提质升级，导致节能减排和环境保护成了“口号”。张家界有奇峰三千，秀水八百，如果生态环境被破坏了，旅游兴市、旅游强市岂不就是空谈？一方面要保障经济的持续增长，一方面要实现绿色环保，给子孙后代留下更美的绿色家园！如何平衡两者的关系？很长一段时间内困绕着当地“父母”官。\r\n</p>\r\n<p style=\"font-size:16px;font-family:\'Microsoft YaHei\';color:#666666;text-indent:2em;\">\r\n	<br />\r\n</p>\r\n<p style=\"font-size:16px;font-family:\'Microsoft YaHei\';color:#666666;text-indent:2em;text-align:center;\">\r\n	<img src=\"http://www.travelzjj.com/uploads/201601/140843173675.jpg\" alt=\"\" /> \r\n</p>\r\n<p style=\"font-size:16px;font-family:\'Microsoft YaHei\';color:#666666;text-indent:2em;text-align:center;\">\r\n	<br />\r\n</p>\r\n<p style=\"font-size:16px;font-family:\'Microsoft YaHei\';color:#666666;text-indent:2em;\">\r\n	彼时，张家界易程天下环保客运有限公司给出了有力诠释：坚持环保低碳发展，减少景区内汽车尾气排放，规范景区内道路交通秩序，保护世界自然遗产——这是“易程天下”成立的初衷。怀揣绿色经营的理念，2001年，由张家界市经济发展投资集团有限公司、武陵源旅游产业公司和张家界国家森林公园管理处共同出资按照现代企业制度筹建，2011年由张家界旅游集团股份有限公司向该公司实施重组合并，“易程天下”成为“张旅集团”全资子公司，主营张家界核心景区内旅游客运服务和国内国际旅游服务业务，运营环保车283台。\r\n</p>\r\n<p style=\"font-size:16px;font-family:\'Microsoft YaHei\';color:#666666;text-indent:2em;\">\r\n	<br />\r\n</p>\r\n<p style=\"font-size:16px;font-family:\'Microsoft YaHei\';color:#666666;text-indent:2em;text-align:center;\">\r\n	<img src=\"http://www.travelzjj.com/uploads/201601/140843516051.jpg\" alt=\"\" /> \r\n</p>\r\n<p style=\"font-size:16px;font-family:\'Microsoft YaHei\';color:#666666;text-indent:2em;text-align:center;\">\r\n	<span>慕名参观学习绿色交通经营管理的香港中华基督教青年会一行</span> \r\n</p>\r\n<p style=\"font-size:16px;font-family:\'Microsoft YaHei\';color:#666666;text-indent:2em;text-align:center;\">\r\n	<br />\r\n</p>\r\n<p style=\"font-size:16px;font-family:\'Microsoft YaHei\';color:#666666;text-indent:2em;\">\r\n	一艘现代化的核心景区客运服务“巨轮”在张家界正式扬帆帆启航。\r\n</p>\r\n<p style=\"font-size:16px;font-family:\'Microsoft YaHei\';color:#666666;text-indent:2em;\">\r\n	<br />\r\n</p>\r\n<p style=\"font-size:16px;font-family:\'Microsoft YaHei\';color:#666666;text-indent:2em;\">\r\n	<strong>提升“道运”低碳理念,</strong><span style=\"line-height:1.5;\"><strong>走在节能减排前沿</strong></span> \r\n</p>\r\n<p style=\"font-size:16px;font-family:\'Microsoft YaHei\';color:#666666;text-indent:2em;\">\r\n	<span style=\"line-height:1.5;\"><br />\r\n</span> \r\n</p>\r\n<p style=\"font-size:16px;font-family:\'Microsoft YaHei\';color:#666666;text-indent:2em;\">\r\n	“易程天下”成立之初，就把车辆的尾气排放放在车辆选型的第一位，这是最直接也是最直观地对景区的环境保护。但张家界核心景区的路况和气候异常复杂，具有弯多、路陡、冬季气温又低等特点，车辆排量小，动力不足，单次运输的旅客就少，单位碳排放量会更大；车辆排量大，动力强，单次运输的旅客量自然多，但碳排放总量也会随之增加。\r\n</p>\r\n<p style=\"font-size:16px;font-family:\'Microsoft YaHei\';color:#666666;text-indent:2em;\">\r\n	<br />\r\n</p>\r\n<p style=\"font-size:16px;font-family:\'Microsoft YaHei\';color:#666666;text-indent:2em;text-align:center;\">\r\n	<img src=\"http://www.travelzjj.com/uploads/201601/140844053859.jpg\" alt=\"\" /> \r\n</p>\r\n<p style=\"font-size:16px;font-family:\'Microsoft YaHei\';color:#666666;text-indent:2em;text-align:center;\">\r\n	<span>整齐有序的LNG环保车</span> \r\n</p>\r\n<p style=\"font-size:16px;font-family:\'Microsoft YaHei\';color:#666666;text-indent:2em;text-align:center;\">\r\n	<br />\r\n</p>\r\n<p style=\"font-size:16px;font-family:\'Microsoft YaHei\';color:#666666;text-indent:2em;\">\r\n	如何平衡效益与节能减排？必须要在提升道路运输低碳理念上找答案。为此,“易程天下”直接放弃许多闻讯上门推销车辆的厂家业务员精心准备的数据报告，自己组织人员试验，历时半年，通过大量的试验数据，经过缜密的分析、测算后得出——在不同的路段使用不同座位数的车型，这样运力和能耗最平衡、统一。同时，排放标准在每一次招标中作硬性指标，从10年前的“”“国3”、“国4”，到现的“国5”标准，始终保持着市场的最高标准。\r\n</p>\r\n<p style=\"font-size:16px;font-family:\'Microsoft YaHei\';color:#666666;text-indent:2em;\">\r\n	<br />\r\n</p>\r\n<p style=\"font-size:16px;font-family:\'Microsoft YaHei\';color:#666666;text-indent:2em;\">\r\n	不仅如此，“易程天下”还借助有效的管理措施节能减排。综合道路、驾驶习惯、车辆参数（长度、质量、爬坡性能等）、乘员人数、发动机型号、空调使用等多种因素，制定了先进的《燃油消耗定额表》，既保证安全舒适行驶，还要控制油耗，并建立了规范的油耗统计制度、严格的油耗奖惩考核体系、车辆保养体系对油耗进行全方位的综合管控。经统计，以30—31客座柴油车为例:厂家出厂油耗参考标准为28L/100km，而通过一系列有效措施管控，该型车辆年平均实际油耗仅为23.41/100 km，降低15.35%，年节省油料28.6万L，减少碳排放224.51吨。\r\n</p>\r\n<p style=\"font-size:16px;font-family:\'Microsoft YaHei\';color:#666666;text-indent:2em;\">\r\n	<br />\r\n</p>\r\n<p style=\"font-size:16px;font-family:\'Microsoft YaHei\';color:#666666;text-indent:2em;\">\r\n	<strong>“追梦”新能源时代,</strong><span style=\"line-height:1.5;\"><strong>绿色引领环保客运</strong></span> \r\n</p>\r\n<p style=\"font-size:16px;font-family:\'Microsoft YaHei\';color:#666666;text-indent:2em;\">\r\n	<span style=\"line-height:1.5;\"><br />\r\n</span> \r\n</p>\r\n<p style=\"font-size:16px;font-family:\'Microsoft YaHei\';color:#666666;text-indent:2em;\">\r\n	最近几年，新能源汽车的蓬勃发展，引起了“易程天下”的高度重视。自2011年开始，该公司陆续组织试验了油电混合、纯电动力、CNG、LNG等新能源车型，因特殊的道路环境，最终选型LNG作为公司新能源发展主力车型。公司总经理邓昌明介绍:“ 2013年，一次更换50台LNG新能源汽车，2015年更换了20台LNG，2016计划再更换30台LNG，届时，新能源汽车的比例将达到40%左右。到2020年，除特殊路段，100%使用新能源汽车。新能源环保车辆的投入，切实降低了车辆尾气排放，使大气的PM2.5排放减少。另外，车辆采用LED灯具，在满足照明需求的同时有效降低设备的用电；散热器使用电磁风扇离合器，使发动机升温迅速以降低能耗，并减少低温时的功率消耗；整车采取一步踏步设计，通过旅客的快速上下以减少车辆怠速运转时间，减少不必要的燃料耗费；使用先进的进口发动机，在同等功率的条件下排量降低……”邓昌明还给笔者算了一笔账：70辆LNG车每年可以减少碳排放约4500吨，几乎没有硫、粉尘及其它有害物质的排放。\r\n</p>\r\n<p style=\"font-size:16px;font-family:\'Microsoft YaHei\';color:#666666;text-indent:2em;\">\r\n	<br />\r\n</p>\r\n<p style=\"font-size:16px;font-family:\'Microsoft YaHei\';color:#666666;text-indent:2em;\">\r\n	“易程天下”不遗余力地发展绿色交通保护环境的做法，得到了社会各界的高度肯定，先后获得了“全国交通运输行业节能减排贡献奖”、“全国交通运输节能减排优秀推进企业”、“全国公共交通创新服务示范单位”、“湖南省道路交通安全文明示范单位”等多项荣誉称号，树立了该公司在景区旅游交通运输行业窗口示范企业的新形象,引领了旅游客运业界绿色交通的发展,争当突围的行业翘楚。\r\n</p>\r\n<p style=\"font-size:16px;font-family:\'Microsoft YaHei\';color:#666666;text-indent:2em;\">\r\n	<br />\r\n</p>\r\n<p style=\"font-size:16px;font-family:\'Microsoft YaHei\';color:#666666;text-indent:2em;\">\r\n	&nbsp;“易程天下”在路上，环保低碳理念播洒绿色旅游，只为让张家界的天更蓝水更绿山更美！\r\n</p>',1,0,'2016-01-31 23:59:49',NULL,'http://pad.pinhai.com.cn:8081/zjjtour-admin/attached/image/20160128/20160128232213_22.png',NULL,1,'“易程天下”在路上，环保低碳理念播洒绿色旅游，只为让张家界的天更蓝水更绿山更美！','0','1','1','0',1038,'1',1,'2016-02-01 00:00:44','','ARTICLE',NULL,NULL,NULL,NULL),(46,'张家界核心景区武陵源再迎降雪 接待秩序良好','张家界核心景区武陵源再迎降雪 接待秩序良好','<p style=\"font-size:16px;font-family:\'Microsoft YaHei\';color:#666666;text-indent:2em;\">\r\n	红网张家界站1月31日讯(通讯员 吴勇兵)1月31日，湖南张家界核心景区武陵源再次迎来强降雪天气，刚刚褪去冰雪盛装的万千峰林重新披上洁白的外衣，路面最大积雪深度超过10公分。\r\n</p>\r\n<p style=\"font-size:16px;font-family:\'Microsoft YaHei\';color:#666666;text-indent:2em;\">\r\n	<br />\r\n</p>\r\n<p style=\"font-size:16px;font-family:\'Microsoft YaHei\';color:#666666;text-indent:2em;\">\r\n	今日一早，武陵源区旅游工作委员会第一时间启动冰雪天气接待保障应急预案，武陵源区交通、交警、公路、旅游等部门迅速行动起来，第一时间组织力量对进入景区的公路进行了铲雪除冰，保障了到达景区门票站的旅游车辆顺畅。各景区管委会、办事处也第一时间对各游道进行了清扫，对重要路段设立了提醒和警示标识，对被大雪压断的树枝进行了清理。索道、电梯、观光电车、环保客运车等交通运输企业也及时对装设备和车辆进行了检查，并安排精干力量上岗保障。\r\n</p>\r\n<p style=\"font-size:16px;font-family:\'Microsoft YaHei\';color:#666666;text-indent:2em;\">\r\n	<br />\r\n</p>\r\n<p style=\"font-size:16px;font-family:\'Microsoft YaHei\';color:#666666;text-indent:2em;\">\r\n	顶风冒雪，武陵源区委常委、区人民政府常务副区长向罡等相关领导率景区管理局、旅游、交通、交警等相关单位负责人到客游最集中的百龙天梯、袁家界、杨家界等地段实地察看雪情，现场部署安全防范和旅游接待工作，重点清理非法营运车辆。并在袁家界景区管委会召开现场办公会，要求各重要节点、重点游览线、各交通要道全部加派值勤力量。同时，要求各涉旅单位、各旅游企业切实做好应急防范准备，备足相关物资应对可能出现的持续降雪天气。\r\n</p>\r\n<p style=\"font-size:16px;font-family:\'Microsoft YaHei\';color:#666666;text-indent:2em;\">\r\n	<br />\r\n</p>\r\n<p style=\"font-size:16px;font-family:\'Microsoft YaHei\';color:#666666;text-indent:2em;\">\r\n	据武陵源区旅游工作委员会办公室负责人介绍，由于应对准备充分，保障措施到位，目前核心景区杨家界、金鞭溪、黄石寨、水绕四门、袁家界等各线路及外围的宝峰湖、黄龙洞等二级景区游览秩序均保持良好。瑞雪迎新春，乐游武陵源。各地游客在景区冒雪畅游，赏雪景看峰林，无比惬意。一位广东游客说：“春节前在武陵源遇到这样的雪景，预示今年好年成啊!”\r\n</p>\r\n<p style=\"font-size:16px;font-family:\'Microsoft YaHei\';color:#666666;text-indent:2em;\">\r\n	<br />\r\n</p>\r\n<p style=\"font-size:16px;font-family:\'Microsoft YaHei\';color:#666666;text-indent:2em;\">\r\n	至笔者发稿时止，武陵源区旅游工作委员会办公室未接到重大旅游投诉的报告，各景区确保了接待安全。\r\n</p>',1,0,'2016-02-01 00:00:36',NULL,'http://pad.pinhai.com.cn:8081/zjjtour-admin/attached/image/20160128/20160128232213_22.png',NULL,5,'1月31日，湖南张家界核心景区武陵源再次迎来强降雪天气，刚刚褪去冰雪盛装的万千峰林重新披上洁白的外衣，路面最大积雪深度超过10公分。','0','1','1','0',1038,'1',1,'2016-02-01 00:00:44','','ARTICLE',NULL,NULL,NULL,NULL),(47,'黄龙洞','黄龙洞','黄龙洞',1,0,'2016-02-01 00:06:35','http://pad.pinhai.com.cn:8081/zjjtour-admin/attached/image/20160201/20160201000632_672.jpg','http://pad.pinhai.com.cn:8081/zjjtour-admin/attached/image/20160201/20160201000618_769.jpg',NULL,3,'黄龙洞','0','1','1','0',1054,'1',1,'2016-02-01 00:06:41','','VIDEO','0',NULL,NULL,NULL),(48,'aaaa','aaaaa','<div class=\"section\">\r\n	<div id=\"menu1\" class=\"menu\">\r\n		<div id=\"menu\">\r\n			<div class=\"line\">\r\n			</div>\r\n			<ul>\r\n				<li>\r\n					<a href=\"#item1\" class=\"cur transition\">360°全景</a>\r\n				</li>\r\n				<li>\r\n					<a href=\"#item2\" class=\"transition\">峰林奇观</a>\r\n				</li>\r\n				<li>\r\n					<a href=\"#item3\" class=\"transition\">风光美景</a>\r\n				</li>\r\n				<li>\r\n					<a href=\"#item4\" class=\"transition\">交通路线</a>\r\n				</li>\r\n				<li>\r\n					<a href=\"#item5\" class=\"transition\">游览须知</a>\r\n				</li>\r\n			</ul>\r\n		</div>\r\n	</div>\r\n	<div id=\"content\">\r\n		<div class=\"content-item\" id=\"item1\">\r\n			<h4>\r\n				<i class=\"iconfont\"></i>扩大的盆景，缩小的仙境\r\n			</h4>\r\n			<iframe src=\"\" width=\"750\" height=\"400\">\r\n				这里是全景控件\r\n			</iframe>\r\n		</div>\r\n		<div class=\"content-item\" id=\"item2\">\r\n			<h4>\r\n				<i class=\"iconfont\"></i>峰林奇观\r\n			</h4>\r\n<img src=\"../images/19.png\" /> \r\n			<p>\r\n				这里是文字描述这里是文字描述这里是文字描述这里是文字描述这里是文字描述这里是文字描述这里是文字描述这里是文字描述这里是文字描述这里是文字描述这里是文字描述这里是文字描述这里是文字描述这里是文字描述这里是文字描述这里是文字描述\r\n			</p>\r\n<img src=\"../images/19.png\" /> \r\n			<p>\r\n				这里是文字描述这里是文字描述这里是文字描述这里是文字描述这里是文字描述这里是文字描述这里是文字描述这里是文字描述这里是文字描述这里是文字描述这里是文字描述这里是文字描述这里是文字描述这里是文字描述这里是文字描述这里是文字描述\r\n			</p>\r\n		</div>\r\n		<div class=\"content-item\" id=\"item3\">\r\n			<h4>\r\n				<i class=\"iconfont\"></i>风光美景\r\n			</h4>\r\n<img src=\"../images/18.png\" /> \r\n			<p>\r\n				这里是文字描述这里是文字描述这里是文字描述这里是文字描述这里是文字描述这里是文字描述这里是文字描述这里是文字描述这里是文字描述这里是文字描述这里是文字描述这里是文字描述这里是文字描述这里是文字描述这里是文字描述这里是文字描述\r\n			</p>\r\n<img src=\"../images/16.jpg\" /> \r\n			<p>\r\n				这里是文字描述这里是文字描述这里是文字描述这里是文字描述这里是文字描述这里是文字描述这里是文字描述这里是文字描述这里是文字描述这里是文字描述这里是文字描述这里是文字描述这里是文字描述这里是文字描述这里是文字描述这里是文字描述\r\n			</p>\r\n		</div>\r\n		<div class=\"content-item\" id=\"item4\">\r\n			<h4>\r\n				<i class=\"iconfont\"></i>交通路线\r\n			</h4>\r\n<img src=\"../images/15.jpg\" /> \r\n			<p>\r\n				这里是文字描述这里是文字描述这里是文字描述这里是文字描述这里是文字描述这里是文字描述这里是文字描述这里是文字描述这里是文字描述这里是文字描述这里是文字描述这里是文字描述这里是文字描述这里是文字描述这里是文字描述这里是文字描述\r\n			</p>\r\n<img src=\"../images/17.jpg\" /> \r\n			<p>\r\n				这里是文字描述这里是文字描述这里是文字描述这里是文字描述这里是文字描述这里是文字描述这里是文字描述这里是文字描述这里是文字描述这里是文字描述这里是文字描述这里是文字描述这里是文字描述这里是文字描述这里是文字描述这里是文字描述\r\n			</p>\r\n		</div>\r\n		<div class=\"content-item\" id=\"item5\">\r\n			<h4>\r\n				<i class=\"iconfont\"></i>旅游须知\r\n			</h4>\r\n<img src=\"../images/18.png\" /> \r\n			<p>\r\n				这里是文字描述这里是文字描述这里是文字描述这里是文字描述这里是文字描述这里是文字描述这里是文字描述这里是文字描述这里是文字描述这里是文字描述这里是文字描述这里是文字描述这里是文字描述这里是文字描述这里是文字描述这里是文字描述\r\n			</p>\r\n<img src=\"../images/19.png\" /> \r\n			<p>\r\n				这里是文字描述这里是文字描述这里是文字描述这里是文字描述这里是文字描述这里是文字描述这里是文字描述这里是文字描述这里是文字描述这里是文字描述这里是文字描述这里是文字描述这里是文字描述这里是文字描述这里是文字描述这里是文字描述\r\n			</p>\r\n		</div>\r\n	</div>\r\n</div>',1,0,'2016-02-01 16:13:24',NULL,NULL,'aaa',1,'aaaaa','0','0','0','0',1012,'1',1,'2016-02-01 16:13:29','aa','ARTICLE',NULL,NULL,NULL,NULL),(58,'123',NULL,'123',1,0,'2016-02-02 16:43:18',NULL,NULL,NULL,1,'123','0','0','0','0',1012,'0',NULL,NULL,NULL,'ARTICLE',NULL,NULL,NULL,'1'),(59,'123',NULL,'123',1,0,'2016-02-02 17:57:30',NULL,NULL,NULL,1,NULL,'0','0','0','0',1012,'0',NULL,NULL,NULL,'ARTICLE',NULL,NULL,NULL,'1');

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
  `TYPE` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

/*Data for the table `security_role` */

insert  into `security_role`(`id`,`code`,`name`,`description`,`status`,`TYPE`) values (1,'system','系统管理员','系统管理员',1,'0'),(13,'001','审核员','审核内容发布',1,'1'),(14,'002','发布员','发布员',1,'2');

/*Table structure for table `security_role_menu` */

DROP TABLE IF EXISTS `security_role_menu`;

CREATE TABLE `security_role_menu` (
  `id` int(32) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int(50) DEFAULT NULL,
  `menu_id` int(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=345 DEFAULT CHARSET=utf8;

/*Data for the table `security_role_menu` */

insert  into `security_role_menu`(`id`,`role_id`,`menu_id`) values (294,1,1017),(295,1,1016),(296,1,1019),(297,1,1009),(298,1,1018),(299,1,1013),(300,1,1039),(301,1,1012),(302,1,1015),(303,1,1014),(304,1,3),(305,1,2),(306,1,1),(307,1,0),(308,1,1040),(309,1,1041),(310,1,4),(311,1,1011),(312,1,1010),(313,13,1017),(314,13,1016),(315,13,1019),(316,13,1009),(317,13,1036),(318,13,1018),(319,13,1045),(320,13,1013),(321,13,1012),(322,13,1015),(323,13,1014),(324,13,3),(325,13,2),(326,13,1),(327,13,0),(328,13,4),(329,13,1011),(330,13,1010),(331,14,1017),(332,14,1016),(333,14,1009),(334,14,1036),(335,14,1018),(336,14,1045),(337,14,1013),(338,14,1012),(339,14,1015),(340,14,1014),(341,14,1),(342,14,0),(343,14,1011),(344,14,1010);

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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

/*Data for the table `security_user` */

insert  into `security_user`(`id`,`code`,`username`,`email`,`userpwd`,`phone`,`realname`,`status`,`ctime`,`organization_id`) values (1,NULL,'system','admin@163.com','c4ca4238a0b923820dcc509a6f75849b','18952028230','系统管理员',1,NULL,NULL),(11,NULL,'xiaoming','xiaoming@163.com','c4ca4238a0b923820dcc509a6f75849b',NULL,'小明',1,'2016-01-07 14:30:57',43),(12,NULL,'zhangsan','zhangsa1n@qq.com','c4ca4238a0b923820dcc509a6f75849b','18952028230','张三',1,'2016-01-13 00:33:18',43),(13,NULL,'lisi','lisi@qq.com','c4ca4238a0b923820dcc509a6f75849b','18952028230','李四',1,'2016-01-13 00:33:38',44);

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
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

/*Data for the table `security_user_role` */

insert  into `security_user_role`(`id`,`user_id`,`role_id`) values (26,11,'13'),(28,13,'14'),(30,12,'13');

/*Table structure for table `system_adv` */

DROP TABLE IF EXISTS `system_adv`;

CREATE TABLE `system_adv` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(200) DEFAULT NULL COMMENT '标题',
  `jump_url` varchar(200) DEFAULT NULL COMMENT '跳转地址',
  `img_url` varchar(200) DEFAULT NULL COMMENT '图片',
  `type` varchar(10) DEFAULT NULL COMMENT '类型',
  `orderlist` int(11) DEFAULT NULL COMMENT '排序号',
  `status` int(11) DEFAULT NULL COMMENT '是否启用',
  `abstract_content` varchar(200) DEFAULT NULL,
  `show_flag` varchar(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

/*Data for the table `system_adv` */

insert  into `system_adv`(`id`,`title`,`jump_url`,`img_url`,`type`,`orderlist`,`status`,`abstract_content`,`show_flag`) values (8,'天子山','http://pad.pinhai.com.cn:8081/','http://pad.pinhai.com.cn:8081/zjjtour-admin/attached/image/20160201/20160201001539_461.png',NULL,1,1,'天子山是一个好地方','1'),(9,'张家界','http://pad.pinhai.com.cn:8081/','http://pad.pinhai.com.cn:8081/zjjtour-admin/attached/image/20160131/20160131234243_945.jpg',NULL,2,1,NULL,'1'),(10,'绝美风光-张家界','http://pad.pinhai.com.cn:8081/','http://pad.pinhai.com.cn:8081/zjjtour-admin/attached/image/20160131/20160131234336_325.jpg',NULL,3,1,NULL,'1'),(11,'青叶泛舟-张家界','http://pad.pinhai.com.cn:8081/','http://pad.pinhai.com.cn:8081/zjjtour-admin/attached/image/20160131/20160131234421_185.jpg',NULL,4,1,NULL,'1'),(12,'户外活动-张家界','http://pad.pinhai.com.cn:8081/','http://pad.pinhai.com.cn:8081/zjjtour-admin/attached/image/20160131/20160131234459_909.jpg',NULL,5,1,NULL,'1');

/*Table structure for table `system_indexsetting` */

DROP TABLE IF EXISTS `system_indexsetting`;

CREATE TABLE `system_indexsetting` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(200) DEFAULT NULL,
  `style_type` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `system_indexsetting` */

insert  into `system_indexsetting`(`id`,`title`,`style_type`) values (1,'欢迎访问张家界官方旅游网站','模板1');

/*Table structure for table `system_searchword` */

DROP TABLE IF EXISTS `system_searchword`;

CREATE TABLE `system_searchword` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL COMMENT '常用搜索',
  `status` int(11) DEFAULT NULL COMMENT '启用标志',
  `orderlist` int(11) DEFAULT NULL COMMENT '排序号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `system_searchword` */

insert  into `system_searchword`(`id`,`name`,`status`,`orderlist`) values (1,'天门山',1,1),(2,'张家界',1,2),(3,'门票',1,3),(4,'土家',1,5);

/*Table structure for table `system_waitdo` */

DROP TABLE IF EXISTS `system_waitdo`;

CREATE TABLE `system_waitdo` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL COMMENT '栏目名称',
  `title` varchar(100) DEFAULT NULL COMMENT '代办事项名称',
  `ctime` datetime DEFAULT NULL COMMENT '创建时间',
  `status` int(11) DEFAULT NULL COMMENT '状态',
  `user_id` int(11) DEFAULT NULL,
  `type` varchar(10) DEFAULT NULL COMMENT '类型',
  `target_id` int(11) DEFAULT NULL COMMENT '目标ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `system_waitdo` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
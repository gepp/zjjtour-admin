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
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

/*Data for the table `bq_news` */

insert  into `bq_news`(`id`,`bq_id`,`news_id`) values (7,1022,21),(8,1022,20),(9,1022,19),(10,1022,18),(11,1022,17),(12,1023,21),(13,1021,22),(14,1021,21),(15,1021,20),(16,1021,19),(17,1021,18),(18,1021,17);

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
) ENGINE=InnoDB AUTO_INCREMENT=1036 DEFAULT CHARSET=utf8;

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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1042 DEFAULT CHARSET=utf8;

/*Data for the table `security_menu` */

insert  into `security_menu`(`id`,`name`,`code`,`description`,`orderlist`,`img`,`url`,`parent_id`,`type`,`status`,`column_type`,`page_type`,`can_search`) values (1,'系统管理',NULL,NULL,999,'/res/images/leftico04.png',NULL,0,0,1,NULL,NULL,NULL),(2,'部门管理',NULL,NULL,999,NULL,'/securityorganization/list.htm',1,0,1,NULL,NULL,NULL),(3,'用户管理',NULL,NULL,999,NULL,'/securityuser/list.htm',1,0,1,NULL,NULL,NULL),(4,'角色权限管理',NULL,NULL,999,NULL,'/securityrole/list.htm',1,0,1,NULL,NULL,NULL),(1009,'栏目管理',NULL,NULL,NULL,NULL,'/securitymenu/list.htm',1,0,1,NULL,NULL,NULL),(1010,'经典线路',NULL,NULL,1,'/res/images/leftico01.png',NULL,0,1,1,'1','0',NULL),(1011,'全景张家界',NULL,NULL,2,'/res/images/leftico01.png',NULL,0,1,1,'2','0',NULL),(1012,'绝美风光',NULL,NULL,3,'/res/images/leftico01.png',NULL,1011,1,1,'1','0',NULL),(1013,'历史景观',NULL,NULL,4,NULL,NULL,1011,1,1,'1','0','1'),(1014,'文化艺术',NULL,NULL,5,NULL,NULL,1011,1,1,'1','0',NULL),(1015,'户外休闲',NULL,NULL,6,'/res/images/leftico01.png',NULL,1011,1,1,'1','0',NULL),(1016,'美食小吃',NULL,NULL,7,NULL,NULL,1011,1,1,'1','0',NULL),(1017,'出行攻略',NULL,NULL,8,NULL,NULL,1011,1,1,'1','0',NULL),(1018,'精品游记',NULL,NULL,9,NULL,NULL,1011,1,1,'1','0','1'),(1019,'标签管理',NULL,NULL,NULL,NULL,'/bq/listBq.htm',1,0,1,'0','0',NULL),(1021,'行程天数',NULL,NULL,1,'/res/images/leftico01.png',NULL,0,2,1,'1',NULL,NULL),(1022,'1天',NULL,NULL,1,NULL,NULL,1021,2,1,'1',NULL,NULL),(1023,'2天',NULL,NULL,2,NULL,NULL,1021,2,1,'1',NULL,NULL),(1026,'所在地区',NULL,NULL,2,'/res/images/leftico01.png',NULL,0,2,1,'1',NULL,NULL),(1027,'长沙',NULL,NULL,2,'/res/images/leftico01.png',NULL,1026,2,1,'1',NULL,NULL),(1028,'凤凰',NULL,NULL,3,NULL,NULL,1026,2,1,'1',NULL,NULL),(1029,'其他',NULL,NULL,3,NULL,NULL,1026,2,1,'1',NULL,NULL),(1030,'旅游要素',NULL,NULL,3,'/res/images/leftico01.png',NULL,0,2,1,'1',NULL,NULL),(1031,'摄影',NULL,NULL,2,NULL,NULL,1030,2,1,'1',NULL,NULL),(1032,'人文',NULL,NULL,2,NULL,NULL,1030,2,1,'1',NULL,NULL),(1034,'适合人群',NULL,NULL,4,'/res/images/leftico01.png',NULL,0,2,1,'1',NULL,NULL),(1035,'20岁以下',NULL,NULL,1,'/res/images/leftico01.png',NULL,1034,2,1,'1',NULL,NULL),(1036,'线路管理',NULL,NULL,1,NULL,NULL,1010,1,1,'1','0',NULL),(1037,'旅游新闻',NULL,NULL,1,'/res/images/leftico01.png',NULL,0,1,1,'1','0',NULL),(1038,'旅游新闻',NULL,NULL,1,NULL,NULL,1037,1,1,'1','0',NULL),(1039,'搜索设置',NULL,NULL,NULL,NULL,'/securitymenu/listSearch.htm',1,0,1,'0','0',NULL),(1040,'常用搜索设置',NULL,NULL,NULL,NULL,'/systemsearchword/list.htm',1,0,1,'0','0',NULL),(1041,'待办事项',NULL,NULL,NULL,NULL,'/systemwaitdo/list.htm',1,0,1,'0','0',NULL);

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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

/*Data for the table `security_news` */

insert  into `security_news`(`id`,`title`,`litter_title`,`content`,`userid`,`status`,`ctime`,`smallimg`,`indeximg`,`url`,`orderlist`,`abstract_content`,`read_type`,`index_status`,`top_status`,`jump_type`,`menu_id`,`review_status`,`review_userid`,`review_time`,`review_reason`) values (17,'123','213','123',1,0,'2016-01-10 20:19:41',NULL,NULL,NULL,NULL,NULL,'1','0','0','0',1010,'0',NULL,NULL,NULL),(18,'aaaa',NULL,'aaa',1,0,'2016-01-10 20:20:52',NULL,NULL,NULL,NULL,NULL,'1','0','0','0',1010,'0',NULL,NULL,NULL),(19,'阿德法','阿德法','阿德法',1,0,'2016-01-10 23:05:05',NULL,NULL,NULL,NULL,NULL,'1','0','0','0',1010,'0',NULL,NULL,NULL),(20,'阿斯蒂芬撒法',NULL,'萨芬',1,0,'2016-01-10 23:05:14',NULL,NULL,NULL,NULL,NULL,'1','0','0','0',1010,'0',NULL,NULL,NULL),(21,'自作主张',NULL,'自作主张',1,0,'2016-01-10 23:05:19',NULL,NULL,NULL,NULL,NULL,'1','0','0','0',1010,'0',NULL,NULL,NULL),(22,'addafd',NULL,'daf',1,0,'2016-01-10 23:52:16','http://121.41.62.2:8081/zjjtour-admin/attached/image/20160110/20160110235212_874.png',NULL,NULL,NULL,NULL,'1','0','0','0',1010,'0',NULL,NULL,NULL),(23,'测试1','测试','<div class=\"all3d-txtList\" style=\"margin:20px 0px;color:#333333;font-family:\'Microsoft Yahei\', \'Hiragino Sans GB\', \'Helvetica Neue\', Helvetica, tahoma, arial, Verdana, sans-serif, \'WenQuanYi Micro Hei\', 宋体;\">\r\n	<div class=\"all3d-txt_title\">\r\n		<h3 style=\"font-size:18px;font-weight:normal;font-family:\'Microsoft YaHei\';color:#039FEB;text-indent:10px;\">\r\n			地质公园\r\n		</h3>\r\n	</div>\r\n	<p style=\"font-size:14px;font-family:arial;color:#666666;\">\r\n		&nbsp;\r\n	</p>\r\n	<p style=\"font-size:14px;font-family:arial;color:#666666;\">\r\n		“中国首批世界自然遗产、世界首批地质公园、国家首批5A级旅游景区”【武陵源核心景区】为是来<a href=\"http://www.travelzjj.com/\" target=\"_blank\" class=\"keywords\">张家界</a>游人的必玩景区，因独特的“张家界石英砂岩峰林地貌”而闻名于世，由<a href=\"http://www.travelzjj.com/panorama/detail/1051.html\" target=\"_blank\" class=\"keywords\">张家界国家森林公园</a>、<a href=\"http://www.travelzjj.com/panorama/detail/1068.html\" target=\"_blank\" class=\"keywords\">天子山</a>风景区、索溪峪风景区（部分）共同组成，门票为通票制，下辖7个分景区，分别为【<a href=\"http://www.travelzjj.com/panorama/detail/1060.html\" target=\"_blank\" class=\"keywords\">杨家界</a>】、【天子山】、【<a href=\"http://www.travelzjj.com/panorama/detail/1065.html\" target=\"_blank\" class=\"keywords\">袁家界</a>】、【<a href=\"http://www.travelzjj.com/panorama/detail/1066.html\" target=\"_blank\" class=\"keywords\">十里画廊</a>】、【<a href=\"http://www.travelzjj.com/panorama/detail/1069.html\" target=\"_blank\" class=\"keywords\">金鞭溪</a>】、【<a href=\"http://www.travelzjj.com/panorama/detail/1067.html\" target=\"_blank\" class=\"keywords\">黄石寨</a>】、【<a href=\"http://www.travelzjj.com/panorama/detail/1070.html\" target=\"_blank\" class=\"keywords\">鹞子寨</a>】，自然风光各不相同。\r\n	</p>\r\n	<p style=\"font-size:14px;font-family:arial;color:#666666;\">\r\n		&nbsp;\r\n	</p>\r\n	<p style=\"font-size:14px;font-family:arial;color:#666666;\">\r\n		&nbsp;奇山异水张家界，举世闻名，是湖南核心旅游景点，还有世界溶洞之冠的<a href=\"http://www.travelzjj.com/panorama/detail/1079.html\" target=\"_blank\" class=\"keywords\">黄龙洞</a>，神秘幽深。有峰林之称的天子山，不到黄石寨，枉到张家界，还有世界上最美丽的峡谷金鞭溪。\r\n	</p>\r\n	<div>\r\n		<br />\r\n	</div>\r\n</div>\r\n<div class=\"all3d-txtList\" style=\"margin:20px 0px;color:#333333;font-family:\'Microsoft Yahei\', \'Hiragino Sans GB\', \'Helvetica Neue\', Helvetica, tahoma, arial, Verdana, sans-serif, \'WenQuanYi Micro Hei\', 宋体;\">\r\n	<div class=\"all3d-txt_title\">\r\n		<h3 style=\"font-size:18px;font-weight:normal;font-family:\'Microsoft YaHei\';color:#039FEB;text-indent:10px;\">\r\n			美景风光\r\n		</h3>\r\n	</div>\r\n	<p style=\"font-size:14px;font-family:arial;color:#666666;\">\r\n		&nbsp;\r\n	</p>\r\n	<p style=\"font-size:14px;font-family:arial;color:#666666;\">\r\n		<span style=\"line-height:1.5;\">上亿年前的地壳运动，大自然的鬼斧神工，造就了<a href=\"http://www.travelzjj.com/\" target=\"_blank\" class=\"keywords\">张家界</a>不可复制的神奇和美丽。于是，无数游过张家界的人赞叹：人生不到张家界，访尽千山也枉然，人生不到张家界 百岁何能称老翁？张家界是“扩大的盆景.缩小的仙境”，随着四季的气象不同变幻莫测，是大自然鬼斧神功美的让人心动。张家界集桂林之秀、黄山之奇、华山之险、泰山之雄于一体，藏赂、桥、洞、湖、瀑于一身，有“扩大的盆景、缩小的仙山”之美称。</span>\r\n	</p>\r\n	<p style=\"font-size:14px;font-family:arial;color:#666666;\">\r\n		<br />\r\n	</p>\r\n	<p style=\"font-size:14px;font-family:arial;color:#666666;\">\r\n		<img alt=\"张家界杨家界峰墙\" src=\"http://manage.zjji.com/uploads/201506/261039042596.jpg\" width=\"730\" height=\"450\" title=\"张家界杨家界峰墙\" align=\"\" />\r\n	</p>\r\n	<p style=\"font-size:14px;font-family:arial;color:#666666;\">\r\n		&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;<a href=\"http://www.travelzjj.com/panorama/detail/1060.html\" target=\"_blank\" class=\"keywords\">杨家界</a>峰墙\r\n	</p>\r\n	<p style=\"font-size:14px;font-family:arial;color:#666666;\">\r\n		&nbsp;\r\n	</p>\r\n	<p style=\"font-size:14px;font-family:arial;color:#666666;\">\r\n		<a href=\"http://www.travelzjj.com/panorama/detail/1051.html\" target=\"_blank\" class=\"keywords\">张家界国家森林公园</a>位于湖南省西北部张家界市境内，是1982年由国务院委托国家计委批准成立的中国第一个国家森林公园，1992年12月因奇特的石英砂岩大峰林被联合国列入《世界自然遗产名录》，2004年2月被列入世界地质公园。公园自然风光以峰称奇、以谷显幽、以林见秀。\r\n	</p>\r\n	<p style=\"font-size:14px;font-family:arial;color:#666666;\">\r\n		<br />\r\n	</p>\r\n	<p style=\"font-size:14px;font-family:arial;color:#666666;\">\r\n		<img alt=\"张家界天子山卧龙岭\" src=\"http://manage.zjji.com/uploads/201506/261040580484.jpg\" width=\"730\" height=\"450\" title=\"张家界天子山卧龙岭\" align=\"\" />\r\n	</p>\r\n	<p style=\"font-size:14px;font-family:arial;color:#666666;\">\r\n		&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<a href=\"http://www.travelzjj.com/panorama/detail/1068.html\" target=\"_blank\" class=\"keywords\">天子山</a>卧龙岭 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;摄影者：刘君\r\n	</p>\r\n	<p style=\"font-size:14px;font-family:arial;color:#666666;\">\r\n		&nbsp;\r\n	</p>\r\n	<p style=\"font-size:14px;font-family:arial;color:#666666;\">\r\n		公园属于中亚热带气候区，高山峡谷，茂密的森林，使公园形成了独特的森林小气候——冬暖夏凉，年平均气温12.8℃，夏天平均最高气温16.8℃，冬天平均最低气温9.6℃，公园空气清新，含负氧离子高，身临其中，人体感觉特别舒适，是休闲避暑的理想之地。\r\n	</p>\r\n	<p style=\"font-size:14px;font-family:arial;color:#666666;\">\r\n		&nbsp;\r\n	</p>\r\n	<p style=\"font-size:14px;font-family:arial;color:#666666;\">\r\n		<img alt=\"张家界袁家界\" src=\"http://manage.zjji.com/uploads/201506/261043149132.jpg\" width=\"730\" height=\"450\" title=\"张家界袁家界\" align=\"\" />\r\n	</p>\r\n	<p style=\"font-size:14px;font-family:arial;color:#666666;\">\r\n		&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;<a href=\"http://www.travelzjj.com/panorama/detail/1065.html\" target=\"_blank\" class=\"keywords\">袁家界</a>\r\n	</p>\r\n	<p style=\"font-size:14px;font-family:arial;color:#666666;\">\r\n		&nbsp;\r\n	</p>\r\n	<p style=\"font-size:14px;font-family:arial;color:#666666;\">\r\n		绝美自然景观。张家界地处于云贵高原隆起区与洞庭湖沉降区之间，既受隆起的影响，又受沉降的牵制 ,加上地表水切割强烈和岩溶地貌极其发育，形成了当今这种高低悬殊、奇峰林立、万石峥嵘、溪谷纵横的自然奇观。是户外爱好者的旅行天堂。\r\n	</p>\r\n	<p style=\"font-size:14px;font-family:arial;color:#666666;\">\r\n		<br />\r\n	</p>\r\n	<p style=\"font-size:14px;font-family:arial;color:#666666;\">\r\n		<img alt=\"张家界十里画廊小火车\" src=\"http://manage.zjji.com/uploads/201506/271601423959.jpg\" width=\"730\" height=\"450\" title=\"张家界十里画廊小火车\" align=\"\" />\r\n	</p>\r\n	<p style=\"font-size:14px;font-family:arial;color:#666666;\">\r\n		&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<a href=\"http://www.travelzjj.com/panorama/detail/1066.html\" target=\"_blank\" class=\"keywords\">十里画廊</a>\r\n	</p>\r\n	<p style=\"font-size:14px;font-family:arial;color:#666666;\">\r\n		&nbsp;\r\n	</p>\r\n	<p style=\"font-size:14px;font-family:arial;color:#666666;\">\r\n		独特的人文景观。土家族、白族、苗族、侗族和瑶族等少数民族占整个张家界市的96%。具有浓烈的民族风情，是人文摄影爱好者的必去之地。\r\n	</p>\r\n	<p style=\"font-size:14px;font-family:arial;color:#666666;\">\r\n		<br />\r\n	</p>\r\n	<p style=\"font-size:14px;font-family:arial;color:#666666;\">\r\n		<img alt=\"张家界金鞭溪\" src=\"http://manage.zjji.com/uploads/201506/261044519598.jpg\" width=\"730\" height=\"450\" title=\"张家界金鞭溪\" align=\"\" />\r\n	</p>\r\n	<p style=\"font-size:14px;font-family:arial;color:#666666;\">\r\n		&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;<a href=\"http://www.travelzjj.com/panorama/detail/1069.html\" target=\"_blank\" class=\"keywords\">金鞭溪</a>&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;摄影者： 汤东涛\r\n	</p>\r\n	<p style=\"font-size:14px;font-family:arial;color:#666666;\">\r\n		&nbsp;\r\n	</p>\r\n	<p style=\"font-size:14px;font-family:arial;color:#666666;\">\r\n		及其优良的气候条件。四季分明，冬 长夏短。每年3月起，气温日渐升高，春意盎然，兽鸟活跃，山峦田野，充满着生机与活力，同时此时降雨较多，可看到云海。到了6月下旬，武陵源开始进入夏季，直至9月上旬。武陵源夏季的平均气温在22至26摄氏度之间，最高时也不过32摄氏度左右。此时，许多地区酷热难熬，而这里却一派清凉，是避暑消夏的理想去处之一。冬季景区山顶与市区截然不同，张家界虽然地处南方，但还是有雪景的出现！是冬季摄影的好去处！\r\n	</p>\r\n	<p style=\"font-size:14px;font-family:arial;color:#666666;\">\r\n		<br />\r\n	</p>\r\n	<p style=\"font-size:14px;font-family:arial;color:#666666;\">\r\n		<img alt=\"张家界黄石寨\" src=\"http://manage.zjji.com/uploads/201506/261046028952.jpg\" width=\"730\" height=\"450\" title=\"张家界黄石寨\" align=\"\" />\r\n	</p>\r\n	<p style=\"font-size:14px;font-family:arial;color:#666666;\">\r\n		&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<a href=\"http://www.travelzjj.com/panorama/detail/1067.html\" target=\"_blank\" class=\"keywords\">黄石寨</a>日出\r\n	</p>\r\n	<p style=\"font-size:14px;font-family:arial;color:#666666;\">\r\n		&nbsp;\r\n	</p>\r\n	<p style=\"font-size:14px;font-family:arial;color:#666666;\">\r\n		&nbsp;张家界以岩称奇。这里三千座奇峰拔地而起，形态各异，有的似玉柱神鞭，立地顶天；有的像铜墙铁壁，巍然屹立；有的如晃板垒卵，摇摇欲坠；有的若盆景古董，玲珑剔透......神奇而又真实，迷离而又实在，不是艺术创造胜以艺术创造，令人叹为观止，张家界奇独特的风景，丰富的旅游资源，唯美的自然风光，无一不向世人展示着它雄伟壮丽。\r\n	</p>\r\n	<p style=\"font-size:14px;font-family:arial;color:#666666;\">\r\n		<br />\r\n	</p>\r\n	<p style=\"font-size:14px;font-family:arial;color:#666666;\">\r\n		<img alt=\"张家界鹞子寨\" src=\"http://manage.zjji.com/uploads/201506/261046371955.jpg\" width=\"730\" height=\"450\" title=\"张家界鹞子寨\" align=\"\" />\r\n	</p>\r\n	<p style=\"font-size:14px;font-family:arial;color:#666666;\">\r\n		&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<a href=\"http://www.travelzjj.com/panorama/detail/1070.html\" target=\"_blank\" class=\"keywords\">鹞子寨</a>&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;摄影者：郑亚平\r\n	</p>\r\n	<p style=\"font-size:14px;font-family:arial;color:#666666;\">\r\n		<br />\r\n	</p>\r\n</div>\r\n<div class=\"all3d-txtList\" style=\"margin:20px 0px;color:#333333;font-family:\'Microsoft Yahei\', \'Hiragino Sans GB\', \'Helvetica Neue\', Helvetica, tahoma, arial, Verdana, sans-serif, \'WenQuanYi Micro Hei\', 宋体;\">\r\n	<div class=\"all3d-txt_title\">\r\n		<h3 style=\"font-size:18px;font-weight:normal;font-family:\'Microsoft YaHei\';color:#039FEB;text-indent:10px;\">\r\n			推荐理由\r\n		</h3>\r\n	</div>\r\n	<p style=\"font-size:14px;font-family:arial;color:#666666;\">\r\n		<span style=\"line-height:1.5;\"><br />\r\n</span>\r\n	</p>\r\n	<p style=\"font-size:14px;font-family:arial;color:#666666;\">\r\n		<span>其间有奇峰3000多座，这些石峰如人如兽、如器如物，形象逼真，气势壮观。峰间峡谷，溪流潺潺，浓荫蔽日。有“三千奇峰，八百秀水”之美称。公园不仅自然风光壮美绝伦，而且森林植物和野生动物资源极为丰富，森林覆盖率达98％，是一座巨大的生物宝库和天然氧吧，被称为“自然博物馆和天然植物园”。草木禽兽与奇山异水，同生共荣，形成完美的自然生态系统。</span>\r\n	</p>\r\n	<p style=\"font-size:14px;font-family:arial;color:#666666;\">\r\n		<span></span>&nbsp;\r\n	</p>\r\n	<p style=\"font-size:14px;font-family:arial;color:#666666;\">\r\n		<span>境内峰奇岩险，谷深涧幽，水秀林碧，云缭雾绕。集雄、奇、幽、野、秀于一体，汇峰、谷、壑、林、水为一色。<a href=\"http://www.travelzjj.com/panorama/detail/1051.html\" target=\"_blank\" class=\"keywords\">张家界国家森林公园</a>主要景点有：<a href=\"http://www.travelzjj.com/panorama/detail/1069.html\" target=\"_blank\" class=\"keywords\">金鞭溪</a>，<a href=\"http://www.travelzjj.com/panorama/detail/1060.html\" target=\"_blank\" class=\"keywords\">杨家界</a>景区，乌龙寨，<a href=\"http://www.travelzjj.com/panorama/detail/1070.html\" target=\"_blank\" class=\"keywords\">鹞子寨</a>景区，<a href=\"http://www.travelzjj.com/panorama/detail/1068.html\" target=\"_blank\" class=\"keywords\">天子山</a>景区</span>\r\n	</p>\r\n	<p style=\"font-size:14px;font-family:arial;color:#666666;\">\r\n		<br />\r\n	</p>\r\n</div>\r\n<div class=\"all3d-txtList\" style=\"margin:20px 0px;color:#333333;font-family:\'Microsoft Yahei\', \'Hiragino Sans GB\', \'Helvetica Neue\', Helvetica, tahoma, arial, Verdana, sans-serif, \'WenQuanYi Micro Hei\', 宋体;\">\r\n	<div class=\"all3d-txt_title\">\r\n		<h3 style=\"font-size:18px;font-weight:normal;font-family:\'Microsoft YaHei\';color:#039FEB;text-indent:10px;\">\r\n			交通路线\r\n		</h3>\r\n	</div>\r\n	<p style=\"font-size:14px;font-family:arial;color:#666666;\">\r\n		<span style=\"line-height:1.5;\"></span>\r\n	</p>\r\n	<p style=\"font-size:14px;font-family:arial;color:#666666;\">\r\n		<span style=\"line-height:1.5;\"><br />\r\n</span>\r\n	</p>\r\n	<p style=\"font-size:14px;font-family:arial;color:#666666;\">\r\n		<span style=\"line-height:1.5;\">在<a href=\"http://www.travelzjj.com/\" target=\"_blank\" class=\"keywords\">张家界</a>市中心汽车站（火车站旁50米）就可搭乘去往森林公园、武陵源的线路巴士，每十分钟发班。</span>\r\n	</p>\r\n	<p style=\"font-size:14px;font-family:arial;color:#666666;\">\r\n		公园交通十分方便，距市城区、飞机场、火车站仅28公里。景区内已建成58公里的国际标准游道、安全舒适的索道和开通了环保车。\r\n	</p>\r\n</div>\r\n<div class=\"all3d-txtList\" style=\"margin:20px 0px;color:#333333;font-family:\'Microsoft Yahei\', \'Hiragino Sans GB\', \'Helvetica Neue\', Helvetica, tahoma, arial, Verdana, sans-serif, \'WenQuanYi Micro Hei\', 宋体;\">\r\n	<div class=\"all3d-txt_title\">\r\n		<h3 style=\"font-size:18px;font-weight:normal;font-family:\'Microsoft YaHei\';color:#039FEB;text-indent:10px;\">\r\n			游览须知\r\n		</h3>\r\n	</div>\r\n	<p style=\"font-size:14px;font-family:arial;color:#666666;\">\r\n		<span style=\"line-height:1.5;\"><br />\r\n</span>\r\n	</p>\r\n	<p style=\"font-size:14px;font-family:arial;color:#666666;\">\r\n		&nbsp;<span style=\"line-height:1.5;\">游览景区一般为2到3天。</span>\r\n	</p>\r\n	<p style=\"font-size:14px;font-family:arial;color:#666666;\">\r\n		景区有5个门票站，其中森林公园门票站、吴家峪门票站（武陵源标志门）是游人最常的选择。\r\n	</p>\r\n	<p style=\"font-size:14px;font-family:arial;color:#666666;\">\r\n		景区游览路线可简要形容为山下游览路线、山上游览路线；\r\n	</p>\r\n	<p style=\"font-size:14px;font-family:arial;color:#666666;\">\r\n		山下游览路线为：森林公园门票站-大氧吧广场-<a href=\"http://www.travelzjj.com/panorama/detail/1067.html\" target=\"_blank\" class=\"keywords\">黄石寨</a>-<a href=\"http://www.travelzjj.com/panorama/detail/1069.html\" target=\"_blank\" class=\"keywords\">金鞭溪</a>-水绕四门-<a href=\"http://www.travelzjj.com/panorama/detail/1066.html\" target=\"_blank\" class=\"keywords\">十里画廊</a>-吴家峪门票站。山上游览路线为：<a href=\"http://www.travelzjj.com/panorama/detail/1065.html\" target=\"_blank\" class=\"keywords\">袁家界</a>-<a href=\"http://www.travelzjj.com/panorama/detail/1060.html\" target=\"_blank\" class=\"keywords\">杨家界</a>-<a href=\"http://www.travelzjj.com/panorama/detail/1068.html\" target=\"_blank\" class=\"keywords\">天子山</a>。另有<a href=\"http://www.travelzjj.com/panorama/detail/1070.html\" target=\"_blank\" class=\"keywords\">鹞子寨</a>，可选择单独游览。\r\n	</p>\r\n	<p style=\"font-size:14px;font-family:arial;color:#666666;\">\r\n		<br />\r\n	</p>\r\n</div>\r\n<div class=\"all3d-txtList\" style=\"margin:20px 0px;color:#333333;font-family:\'Microsoft Yahei\', \'Hiragino Sans GB\', \'Helvetica Neue\', Helvetica, tahoma, arial, Verdana, sans-serif, \'WenQuanYi Micro Hei\', 宋体;\">\r\n	<div class=\"all3d-txt_title\">\r\n		<h3 style=\"font-size:18px;font-weight:normal;font-family:\'Microsoft YaHei\';color:#039FEB;text-indent:10px;\">\r\n			相关信息\r\n		</h3>\r\n	</div>\r\n	<p style=\"font-size:14px;font-family:arial;color:#666666;\">\r\n		<span style=\"line-height:1.5;\"></span>&nbsp;\r\n	</p>\r\n	<p style=\"font-size:14px;font-family:arial;color:#666666;\">\r\n		<span style=\"line-height:1.5;\">门票：A.248元（含保险，4天有效） B.301元（含保险，7天有效）</span>\r\n	</p>\r\n	<p style=\"font-size:14px;font-family:arial;color:#666666;\">\r\n		地址：<a href=\"http://www.travelzjj.com/\" target=\"_blank\" class=\"keywords\">张家界</a>市武陵源区\r\n	</p>\r\n</div>',NULL,NULL,NULL,'http://pad.pinhai.com.cn:8081/zjjtour-admin/attached/image/20160111/20160111235124_162.jpg','http://pad.pinhai.com.cn:8081/zjjtour-admin/attached/image/20160111/20160111235200_356.jpg',NULL,1,NULL,'0','1','1','0',1017,NULL,NULL,NULL,NULL),(24,'八大公山','八大公山','<div class=\"all3d-txtList\" style=\"margin:20px 0px;color:#333333;font-family:\'Microsoft Yahei\', \'Hiragino Sans GB\', \'Helvetica Neue\', Helvetica, tahoma, arial, Verdana, sans-serif, \'WenQuanYi Micro Hei\', 宋体;\">\r\n	<div class=\"all3d-txt_title\">\r\n		<h3 style=\"font-size:18px;font-weight:normal;font-family:\'Microsoft YaHei\';color:#039FEB;text-indent:10px;\">\r\n			简介\r\n		</h3>\r\n	</div>\r\n	<p class=\"MsoNormal\" style=\"font-size:14px;font-family:arial;color:#666666;\">\r\n		<br />\r\n	</p>\r\n	<p style=\"font-size:14px;font-family:arial;color:#666666;\">\r\n		<img alt=\"八大公山\" src=\"http://www.travelzjj.com/uploads/201506/272047340897.jpg\" width=\"730\" height=\"450\" title=\"八大公山\" align=\"\" />\r\n	</p>\r\n	<p style=\"font-size:14px;font-family:arial;color:#666666;\">\r\n		&nbsp;\r\n	</p>\r\n	<p style=\"font-size:14px;font-family:arial;color:#666666;\">\r\n		<a href=\"http://www.travelzjj.com/panorama/detail/1130.html\" target=\"_blank\" class=\"keywords\">八大公山</a>自然保护区总面积2万公顷，分为天平山、杉木界、斗篷山三大林区，主峰斗篷山海拔1898.4米，为武陵山脉南麓之巅。气候属北亚热带山地湿润季风气候，夏秋季短，春冬季长，最冷月平均气温0.1℃，最热月平均气温22.8℃，相对湿度90%以上。区内群山起伏，山脉纵横交错，599座山峰星罗棋布，奇峰突起，溪流、瀑布众多。独特的地理环境，孕育和保存了亚热带最完整、面积最大原生型常绿阔叶林。\r\n	</p>\r\n	<p style=\"font-size:14px;font-family:arial;color:#666666;\">\r\n		&nbsp;\r\n	</p>\r\n	<p style=\"font-size:14px;font-family:arial;color:#666666;\">\r\n		<img alt=\"张家界八大公山\" src=\"http://www.travelzjj.com/uploads/201506/272047553808.jpg\" width=\"730\" height=\"450\" title=\"张家界八大公山\" align=\"\" />\r\n	</p>\r\n	<p style=\"font-size:14px;font-family:arial;color:#666666;\">\r\n		&nbsp;\r\n	</p>\r\n</div>\r\n<div class=\"all3d-txtList\" style=\"margin:20px 0px;color:#333333;font-family:\'Microsoft Yahei\', \'Hiragino Sans GB\', \'Helvetica Neue\', Helvetica, tahoma, arial, Verdana, sans-serif, \'WenQuanYi Micro Hei\', 宋体;\">\r\n	<div class=\"all3d-txt_title\">\r\n		<h3 style=\"font-size:18px;font-weight:normal;font-family:\'Microsoft YaHei\';color:#039FEB;text-indent:10px;\">\r\n			户外攻略\r\n		</h3>\r\n	</div>\r\n	<p style=\"font-size:14px;font-family:arial;color:#666666;\">\r\n		<br />\r\n	</p>\r\n	<p class=\"MsoNormal\" style=\"font-size:14px;font-family:arial;color:#666666;\">\r\n		【资源种类】原生性森林、瀑布、山峦\r\n	</p>\r\n	<p class=\"MsoNormal\" style=\"font-size:14px;font-family:arial;color:#666666;\">\r\n		【户外项目】徒步山地穿越、溯溪、岩降、瀑降、水上抱石、定向越野、野营等\r\n	</p>\r\n	<p class=\"MsoNormal\" style=\"font-size:14px;font-family:arial;color:#666666;\">\r\n		【海拔范围】346m至2003m\r\n	</p>\r\n	<p class=\"MsoNormal\" style=\"font-size:14px;font-family:arial;color:#666666;\">\r\n		<span style=\"line-height:1.5;\">【线路难度】5星</span><span style=\"line-height:1.5;\">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</span>\r\n	</p>\r\n	<p class=\"MsoNormal\" style=\"font-size:14px;font-family:arial;color:#666666;\">\r\n		<span style=\"line-height:1.5;\">【线路强度】4星</span><span style=\"line-height:1.5;\">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</span>\r\n	</p>\r\n	<p class=\"MsoNormal\" style=\"font-size:14px;font-family:arial;color:#666666;\">\r\n		<span style=\"line-height:1.5;\">【线路风景】4星</span>\r\n	</p>\r\n	<p class=\"MsoNormal\" style=\"font-size:14px;font-family:arial;color:#666666;\">\r\n		<span style=\"line-height:1.5;\">【装备要求】速干衣裤、冲锋衣、防寒衣、登山包、登山鞋、登山杖、水袋、手套、头巾、野炊用具、露营装备、头盔、药品等</span>\r\n	</p>\r\n	<p class=\"MsoNormal\" style=\"font-size:14px;font-family:arial;color:#666666;\">\r\n		<span style=\"line-height:1.5;\">【周边资源】<a href=\"http://www.travelzjj.com/panorama/detail/1099.html\" target=\"_blank\" class=\"keywords\">贺龙故居</a>、<a href=\"http://www.travelzjj.com/panorama/detail/1103.html\" target=\"_blank\" class=\"keywords\">廖汉生故居</a>、桑鹤土司结盟遗址、澧水源头七眼泉等。</span>\r\n	</p>\r\n	<p class=\"MsoNormal\" style=\"font-size:14px;font-family:arial;color:#666666;\">\r\n		&nbsp;<strong>【交通指引】</strong>\r\n	</p>\r\n	<p class=\"MsoNormal\" style=\"margin-left:0cm;font-size:14px;font-family:arial;color:#666666;text-indent:0cm;\">\r\n		1.进入：桑植汽车西站至芭茅溪乡（20元），然后租车进入辽竹湾村（穿越的起点）。\r\n	</p>\r\n	<p class=\"MsoNormal\" style=\"margin-left:0cm;font-size:14px;font-family:arial;color:#666666;text-indent:0cm;\">\r\n		2.回程：下山后再沙园联系芭茅溪车主接至芭茅溪，原路返回桑植县。\r\n	</p>\r\n	<p class=\"MsoNormal\" style=\"font-size:14px;font-family:arial;color:#666666;\">\r\n		&nbsp;\r\n	</p>\r\n	<p class=\"MsoNormal\" style=\"font-size:14px;font-family:arial;color:#666666;\">\r\n		<strong>行程</strong>\r\n	</p>\r\n	<p class=\"MsoNormal\" style=\"font-size:14px;font-family:arial;color:#666666;\">\r\n		DAY1\r\n	</p>\r\n	<p class=\"MsoNormal\" style=\"font-size:14px;font-family:arial;color:#666666;\">\r\n		桑植县-芭茅溪-四门岩林场\r\n	</p>\r\n	<p class=\"MsoNormal\" style=\"font-size:14px;font-family:arial;color:#666666;\">\r\n		[备注]桑植县至芭茅溪乡后中餐，推荐参观：圆梦饭庄（价格20-30元/人，联系电话：13974426576）。\r\n	</p>\r\n	<p class=\"MsoNormal\" style=\"font-size:14px;font-family:arial;color:#666666;\">\r\n		中餐后租车往辽竹湾，在辽竹湾村部下车后沿小路步行10km左右至四门岩林场，宿营四门岩林场场部。\r\n	</p>\r\n	<p class=\"MsoNormal\" style=\"font-size:14px;font-family:arial;color:#666666;\">\r\n		DAY2\r\n	</p>\r\n	<p class=\"MsoNormal\" style=\"font-size:14px;font-family:arial;color:#666666;\">\r\n		四门岩林场-长坪-大顶坪\r\n	</p>\r\n	<p class=\"MsoNormal\" style=\"font-size:14px;font-family:arial;color:#666666;\">\r\n		&nbsp;\r\n	</p>\r\n	<p class=\"MsoNormal\" style=\"font-size:14px;font-family:arial;color:#666666;\">\r\n		[备注]\r\n	</p>\r\n	<p class=\"MsoNormal\" style=\"font-size:14px;font-family:arial;color:#666666;\">\r\n		从四门岩林场出发，翻山至长坪峡谷入口，沿长坪沟溯溪而上，长坪午休，午休后顺干谷河床一路向上提升面，直达大顶坪宿营。\r\n	</p>\r\n	<p class=\"MsoNormal\" style=\"font-size:14px;font-family:arial;color:#666666;\">\r\n		DAY3\r\n	</p>\r\n	<p class=\"MsoNormal\" style=\"font-size:14px;font-family:arial;color:#666666;\">\r\n		大顶坪-瞭望塔-小庄坪（天平山接待站）\r\n	</p>\r\n	<p class=\"MsoNormal\" style=\"font-size:14px;font-family:arial;color:#666666;\">\r\n		DAY4\r\n	</p>\r\n	<p class=\"MsoNormal\" style=\"font-size:14px;font-family:arial;color:#666666;\">\r\n		小庄坪-连三台-毛垭半坡\r\n	</p>\r\n	<p class=\"MsoNormal\" style=\"font-size:14px;font-family:arial;color:#666666;\">\r\n		[备注]沿山腰猎户小道环山至青龙湾，青龙湾对面有一小溪沟，顺沟而下可见三棵枯树，再往下见干枯河床，顺河床而下至漆水塔休息。\r\n	</p>\r\n	<p class=\"MsoNormal\" style=\"font-size:14px;font-family:arial;color:#666666;\">\r\n		顺峡谷而下行至毛垭半坡农户家宿营。全程无手机信号，需9小时。晚上可<a href=\"http://www.travelzjj.com/panorama/detail/1201.html\" target=\"_blank\" class=\"keywords\">住宿</a>当地农家，体验土家族的日常生活。\r\n	</p>\r\n	<p class=\"MsoNormal\" style=\"font-size:14px;font-family:arial;color:#666666;\">\r\n		DAY5\r\n	</p>\r\n	<p class=\"MsoNormal\" style=\"font-size:14px;font-family:arial;color:#666666;\">\r\n		毛垭半坡-黄连台（李家河）\r\n	</p>\r\n	<p class=\"MsoNormal\" style=\"font-size:14px;font-family:arial;color:#666666;\">\r\n		[备注]\r\n	</p>\r\n	<p class=\"MsoNormal\" style=\"font-size:14px;font-family:arial;color:#666666;\">\r\n		早餐后从毛垭半坡至毛垭村，有小卖部补结，从毛垭村小路下山至黄连台村长宿营，全天行程需7小时。\r\n	</p>\r\n	<p class=\"MsoNormal\" style=\"font-size:14px;font-family:arial;color:#666666;\">\r\n		黄连台村村长杨志山15074408816\r\n	</p>\r\n	<p class=\"MsoNormal\" style=\"font-size:14px;font-family:arial;color:#666666;\">\r\n		&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 书记刘伟华13407443072\r\n	</p>\r\n	<p class=\"MsoNormal\" style=\"font-size:14px;font-family:arial;color:#666666;\">\r\n		DAY6\r\n	</p>\r\n	<p class=\"MsoNormal\" style=\"font-size:14px;font-family:arial;color:#666666;\">\r\n		黄连台-小溪口-天梯人家-七湾-芭茅溪\r\n	</p>\r\n	<p class=\"MsoNormal\" style=\"font-size:14px;font-family:arial;color:#666666;\">\r\n		[备注]\r\n	</p>\r\n	<p class=\"MsoNormal\" style=\"font-size:14px;font-family:arial;color:#666666;\">\r\n		至黄连台村部，沿溪边土公路往下到达小溪口，公路可达芭茅溪镇，公路旁小溪进山约40分钟山路到达天梯人家，此处可观60m瀑布。天梯人家徒步七湾下山到达天平山公路，可联系包车来接至芭茅溪，车费30元/车（司机张师傅13707446937）。<span style=\"line-height:1.5;\"></span>\r\n	</p>\r\n	<p class=\"MsoNormal\" style=\"font-size:14px;font-family:arial;color:#666666;\">\r\n		<span style=\"line-height:1.5;\"><img alt=\"张家界八大公山地图\" src=\"http://www.travelzjj.com/uploads/201506/272049474905.jpg\" width=\"730\" height=\"450\" title=\"张家界八大公山地图\" align=\"\" /><br />\r\n</span>\r\n	</p>\r\n	<p style=\"font-size:14px;font-family:arial;color:#666666;\">\r\n		<br />\r\n	</p>\r\n</div>\r\n<div class=\"all3d-txtList\" style=\"margin:20px 0px;color:#333333;font-family:\'Microsoft Yahei\', \'Hiragino Sans GB\', \'Helvetica Neue\', Helvetica, tahoma, arial, Verdana, sans-serif, \'WenQuanYi Micro Hei\', 宋体;\">\r\n	<div class=\"all3d-txt_title\">\r\n		<h3 style=\"font-size:18px;font-weight:normal;font-family:\'Microsoft YaHei\';color:#039FEB;text-indent:10px;\">\r\n			安全提示\r\n		</h3>\r\n	</div>\r\n	<p class=\"MsoNormal\" style=\"font-size:14px;font-family:arial;color:#666666;\">\r\n		<br />\r\n	</p>\r\n	<p class=\"MsoNormal\" style=\"font-size:14px;font-family:arial;color:#666666;\">\r\n		【安全提示】该线路需要扁带、对讲机、急救药品等公共装备方可成行，切勿孤身或私下结伴前往，需联系当地户外俱乐部提供专业向导和保护。\r\n	</p>\r\n	<p class=\"MsoNormal\" style=\"font-size:14px;font-family:arial;color:#666666;\">\r\n		此行程路途较长，而且进入谷底，手机信号不好，也有可能没有；又出于隐雷区，雨天建议慎重出行。谷中暂时没有小商品出售，进入景区要带足食物和饮水保持体力，可以带些高能量的食物，如巧克力、饼干、肉类等；景区中有许多飞禽走兽，请远离并保护它们，切勿伤害它们；山中雨雾笼罩，有时豁然开朗，横穿石壁，自然温服比较低，风力也会大些，请务必注意保暖，适当带些衣服，防止温度突变，引起身体不适。\r\n	</p>\r\n	<p class=\"MsoNormal\" style=\"font-size:14px;font-family:arial;color:#666666;\">\r\n		特别提醒：<a href=\"http://www.travelzjj.com/panorama/detail/1130.html\" target=\"_blank\" class=\"keywords\">八大公山</a>毒蛇（五步蛇）出没，要防止被毒蛇咬伤。\r\n	</p>\r\n	<p class=\"MsoNormal\" style=\"font-size:14px;font-family:arial;color:#666666;\">\r\n		遇险求助电话：<span style=\"line-height:1.5;\">八大公山乡政府0744-6730001</span>\r\n	</p>\r\n</div>',1,0,'2016-01-11 23:55:49',NULL,NULL,NULL,1,NULL,'0','1','1','0',1015,'1',12,'2016-01-13 00:34:18','李四审核通过'),(25,'国家旅游局启动导游领队引导文明旅游试点工作','国家旅游局启动导游领队引导文明旅游试点工作','<p style=\"font-size:16px;font-family:\'Microsoft YaHei\';color:#666666;text-indent:2em;\">\r\n	1月8日，国家旅游局在京举办导游领队引导文明旅游试点工作启动大会。据悉，该试点工作是国家旅游局开展的一系列促进文明旅游工作的重要一环，由中青旅控股股份有限公司承担试点工作。\r\n</p>\r\n<p style=\"font-size:16px;font-family:\'Microsoft YaHei\';color:#666666;text-indent:2em;\">\r\n	<br />\r\n</p>\r\n<p style=\"font-size:16px;font-family:\'Microsoft YaHei\';color:#666666;text-indent:2em;\">\r\n	启动仪式现场，国家旅游局授予中青旅控股股份有限公司“导游领队引导文明旅游工作试点单位”牌匾，并向参与试点工作的导游领队代表发放了国家旅游局编订的《导游领队引导游客文明旅游操作指南》；参与试点工作的导游领队发出引导游客文明旅游的承诺；试点单位中青旅发布了“文明旅游看我的”宣传口号和Logo。\r\n</p>\r\n<p style=\"font-size:16px;font-family:\'Microsoft YaHei\';color:#666666;text-indent:2em;\">\r\n	<br />\r\n</p>\r\n<p style=\"font-size:16px;font-family:\'Microsoft YaHei\';color:#666666;text-indent:2em;\">\r\n	国家旅游局监管司相关负责人介绍，针对频频发生的不文明旅游行为，国家旅游局近年来开展了“为中国加分——文明旅游公益行动”、网上文明旅游“百日百题”竞答、中国好游客评选等<a href=\"http://www.travelzjj.com/active/\" target=\"_blank\" class=\"keywords\">活动</a>，进行正面引导和宣传。同时，出台了《游客不文明行为记录暂行办法》等规范性文件，对游客不文明行为予以记录和发布，对不文明旅游者进行谴责和惩戒。2016年，国家旅游局将持续推进文明旅游宣传与引导。\r\n</p>\r\n<p style=\"font-size:16px;font-family:\'Microsoft YaHei\';color:#666666;text-indent:2em;\">\r\n	<br />\r\n</p>\r\n<p style=\"font-size:16px;font-family:\'Microsoft YaHei\';color:#666666;text-indent:2em;\">\r\n	据介绍，试点工作中，中青旅一方面将面向导游领队征集导游文明旅游的建议、意见及具体的引导案例，另一方面要求导游领队将文明旅游引导工作及游客在旅游过程中的不文明行为载入导游和领队工作日志，通过后续对相关信息和数据的分析，总结游客不文明行为的规律，以便从产品设计、行前说明、团队行程中的服务入手，有针对性地加强文明旅游引导。\r\n</p>\r\n<p style=\"font-size:16px;font-family:\'Microsoft YaHei\';color:#666666;text-indent:2em;\">\r\n	<br />\r\n</p>\r\n<p style=\"font-size:16px;font-family:\'Microsoft YaHei\';color:#666666;text-indent:2em;\">\r\n	中青旅副总裁李京表示，中青旅在引导和宣传文明旅游方面做了大量工作，如编写文明旅游攻略并向游客发放、组织行前说明会告知引导游客文明旅游、受国家旅游局委托编写行业标准《导游领队引导文明旅游规范》、面向全行业开展文明旅游培训等。此次试点工作，是对中青旅相关工作经验的进一步检验，希望通过中青旅的探索，为全行业提供经验做法，为引导游客文明旅游、提升游客文明素养做出应有的贡献。\r\n</p>\r\n<p style=\"font-size:16px;font-family:\'Microsoft YaHei\';color:#666666;text-indent:2em;\">\r\n	<br />\r\n</p>\r\n<p style=\"font-size:16px;font-family:\'Microsoft YaHei\';color:#666666;text-indent:2em;\">\r\n	参与试点工作启动仪式的导游领队代表说，引导游客文明旅游，所有导游和领队责无旁贷，这既是提升服务质量的内在要求，也是展示行业形象的重要途径，希望借助此次试点，引导游客出游越来越文明，为中国加分的分数越来越高，向不文明旅游行为“说再见”。\r\n</p>\r\n<div>\r\n	<br />\r\n</div>',1,0,'2016-01-12 00:42:49',NULL,NULL,NULL,1,NULL,'1','1','1','0',1038,'0',NULL,NULL,NULL),(26,'李四添加新闻','李四添加新闻','李四添加新闻',13,0,'2016-01-13 00:35:04',NULL,NULL,NULL,1,'李四添加新闻','0','0','0','0',1015,'1',12,'2016-01-13 00:37:03','sss');

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
) ENGINE=InnoDB AUTO_INCREMENT=313 DEFAULT CHARSET=utf8;

/*Data for the table `security_role_menu` */

insert  into `security_role_menu`(`id`,`role_id`,`menu_id`) values (255,13,3),(256,13,2),(257,13,1),(258,13,0),(259,13,4),(260,13,1017),(261,13,1016),(262,13,1009),(263,13,1019),(264,13,1018),(265,13,1036),(266,13,1013),(267,13,1011),(268,13,1012),(269,13,1010),(270,13,1015),(271,13,1014),(283,14,0),(284,14,1017),(285,14,1016),(286,14,1036),(287,14,1018),(288,14,1013),(289,14,1011),(290,14,1012),(291,14,1010),(292,14,1015),(293,14,1014),(294,1,1017),(295,1,1016),(296,1,1019),(297,1,1009),(298,1,1018),(299,1,1013),(300,1,1039),(301,1,1012),(302,1,1015),(303,1,1014),(304,1,3),(305,1,2),(306,1,1),(307,1,0),(308,1,1040),(309,1,1041),(310,1,4),(311,1,1011),(312,1,1010);

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

/*Table structure for table `system_searchword` */

DROP TABLE IF EXISTS `system_searchword`;

CREATE TABLE `system_searchword` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL COMMENT '常用搜索',
  `status` int(11) DEFAULT NULL COMMENT '启用标志',
  `orderlist` int(11) DEFAULT NULL COMMENT '排序号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

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
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

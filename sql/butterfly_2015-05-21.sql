/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50617
Source Host           : localhost:3306
Source Database       : butterfly

Target Server Type    : MYSQL
Target Server Version : 50617
File Encoding         : 65001

Date: 2015-05-21 18:27:12
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `admin`
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL COMMENT '理员管账户',
  `name` varchar(50) DEFAULT NULL COMMENT '理管员中文名',
  `password` varchar(50) DEFAULT NULL COMMENT '管理员密码',
  `power` varchar(100) DEFAULT NULL COMMENT '管理员权限,以,分割',
  `is_delete` enum('0','1') DEFAULT '0' COMMENT '是否删除标志,0:未删除;1:已删除',
  `create_date` datetime DEFAULT NULL,
  `update_date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username_unique` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('1', 'magic', '朱征宇', '123', '1,2,3,4,5,6,14', '0', null, '2015-03-18 22:16:30');
INSERT INTO `admin` VALUES ('2', 'tanyin', '谈寅', '1234', '3,4', '0', null, '2015-03-19 23:00:01');
INSERT INTO `admin` VALUES ('3', 'yezong', '叶总', '111', '4,2', '0', null, '2015-03-02 23:31:28');
INSERT INTO `admin` VALUES ('4', 'test', 'name', 'aaa', '1,3,5', '0', null, '2015-03-09 14:36:04');
INSERT INTO `admin` VALUES ('5', 'test2', '2323', '123', '2,3,4', '0', null, '2015-03-09 14:33:04');
INSERT INTO `admin` VALUES ('6', 'test3', 'test3', 'test31', '2,3', '0', null, '2015-04-04 14:25:16');
INSERT INTO `admin` VALUES ('7', 'test4', 'name', 'test4', '4', '0', null, null);
INSERT INTO `admin` VALUES ('8', 'test5', '测试5', 'test5', '4,5', '0', null, null);
INSERT INTO `admin` VALUES ('9', 'test6', '测试6', 'test6', '3,4', '0', null, '2015-03-09 16:15:16');
INSERT INTO `admin` VALUES ('10', 'test7', '测试7', 'test7', '4,5', '0', null, null);
INSERT INTO `admin` VALUES ('11', '', '', '', '', '0', null, null);
INSERT INTO `admin` VALUES ('12', 'xiaosheng', '小沈', '123456', '4', '0', null, null);

-- ----------------------------
-- Table structure for `excel`
-- ----------------------------
DROP TABLE IF EXISTS `excel`;
CREATE TABLE `excel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `file` varchar(100) DEFAULT NULL,
  `state` enum('1','2') DEFAULT '1' COMMENT '态状;1:未将excel导入至数据库;2:已导入至数据库',
  `create_date` datetime DEFAULT NULL,
  `update_date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of excel
-- ----------------------------
INSERT INTO `excel` VALUES ('1', 'product_20150316111654.xls', '1', null, null);
INSERT INTO `excel` VALUES ('2', 'product_20150316130040.xls', '1', '2015-03-16 21:00:40', null);
INSERT INTO `excel` VALUES ('3', 'product_20150316150441.xls', '2', '2015-03-16 23:04:41', '2015-04-19 21:15:57');
INSERT INTO `excel` VALUES ('4', 'product_20150316150632.xls', '2', '2015-03-16 23:06:32', '2015-03-18 00:45:26');
INSERT INTO `excel` VALUES ('5', 'product_20150316153922.xls', '2', '2015-03-16 23:39:22', '2015-03-18 00:07:43');
INSERT INTO `excel` VALUES ('6', 'product_20150318042209.xls', '2', '2015-03-18 12:22:09', '2015-03-18 12:22:17');
INSERT INTO `excel` VALUES ('7', 'product_20150320074519.xls', '2', '2015-03-20 15:45:19', '2015-03-20 15:46:24');

-- ----------------------------
-- Table structure for `game`
-- ----------------------------
DROP TABLE IF EXISTS `game`;
CREATE TABLE `game` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) DEFAULT NULL,
  `content` varchar(1000) DEFAULT NULL,
  `video_url` varchar(100) DEFAULT NULL,
  `is_delete` enum('0','1') DEFAULT '0',
  `create_date` datetime DEFAULT NULL,
  `update_date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of game
-- ----------------------------
INSERT INTO `game` VALUES ('1', 'title_1', '22', '333', '0', null, '2015-04-22 23:40:07');
INSERT INTO `game` VALUES ('2', '111', '333', '222', '0', '2015-04-22 23:40:16', null);

-- ----------------------------
-- Table structure for `index_page`
-- ----------------------------
DROP TABLE IF EXISTS `index_page`;
CREATE TABLE `index_page` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `data` varchar(10000) DEFAULT NULL,
  `is_delete` enum('0','1') DEFAULT '0',
  `create_date` timestamp NULL DEFAULT NULL,
  `update_date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of index_page
-- ----------------------------

-- ----------------------------
-- Table structure for `log`
-- ----------------------------
DROP TABLE IF EXISTS `log`;
CREATE TABLE `log` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `tag` varchar(50) DEFAULT NULL,
  `level` varchar(50) DEFAULT NULL,
  `content` varchar(500) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=137 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of log
-- ----------------------------
INSERT INTO `log` VALUES ('1', 'admin', '', '', null, null);
INSERT INTO `log` VALUES ('2', 'manage_admin', 'info', '朱征宇编辑管理员信息|{\"id\":\"4\",\"username\":\"test\",\"password\":\"aaa\",\"name\":\"name\",\"power\":\"1,3,5\"}', null, '2015-03-09 16:13:14');
INSERT INTO `log` VALUES ('3', 'manage_admin', 'info', '朱征宇编辑管理员信息|{\"id\":\"\",\"username\":\"test3\",\"password\":\"test3\",\"name\":\"test3\",\"power\":\"2,3\"}', null, '2015-03-09 16:13:17');
INSERT INTO `log` VALUES ('4', 'manage_admin', 'info', '朱征宇编辑管理员信息|{\"id\":\"\",\"username\":\"test4\",\"password\":\"test4\",\"name\":\"test4\",\"power\":\"4\"}', null, '2015-03-09 16:13:21');
INSERT INTO `log` VALUES ('5', 'manage_admin', 'info', '朱征宇编辑管理员信息|{\"id\":\"6\",\"username\":\"test3\",\"password\":\"test3\",\"name\":\"test3\",\"power\":\"2,3\"}', null, '2015-03-09 16:13:26');
INSERT INTO `log` VALUES ('6', 'manage_admin', 'info', '朱征宇编辑管理员信息|{\"id\":\"\",\"username\":\"test5\",\"password\":\"test5\",\"name\":\"u6d4bu8bd55\",\"power\":\"4,5\"}', null, '2015-03-09 16:13:29');
INSERT INTO `log` VALUES ('7', 'manage_admin', 'info', '朱征宇编辑管理员信息|{\"id\":\"\",\"username\":\"test6\",\"password\":\"test6\",\"name\":\"u6d4bu8bd56\",\"power\":\"3\"}', null, '2015-03-09 16:13:34');
INSERT INTO `log` VALUES ('8', 'manage_admin', 'info', '朱征宇编辑管理员信息|{\"id\":\"\",\"username\":\"test7\",\"password\":\"test7\",\"name\":\"u6d4bu8bd57\",\"power\":\"4,5\"}', null, '2015-03-09 16:13:36');
INSERT INTO `log` VALUES ('9', 'manage_admin', 'info', '朱征宇编辑管理员信息|{\"id\":\"9\",\"username\":\"test6\",\"password\":\"test6\",\"name\":\"u6d4bu8bd56\",\"power\":\"3,4\"}', '2015-03-09 16:15:16', null);
INSERT INTO `log` VALUES ('10', 'manage_product', 'info', '朱征宇上传了产品列表文件:D:/work/git/magiczhu_butterfly/htdocs/upload/product/product_20150315161658.xls', '2015-03-16 00:16:58', '2015-03-16 00:23:56');
INSERT INTO `log` VALUES ('11', 'manage_product', 'info', '朱征宇上传了产品列表文件:D:/work/git/magiczhu_butterfly/htdocs/upload/product/product_20150315161922.xls', '2015-03-16 00:19:22', '2015-03-16 00:24:02');
INSERT INTO `log` VALUES ('12', 'manage_product', 'info', '朱征宇上传了产品列表文件:D:/work/git/magiczhu_butterfly/htdocs/upload/product/product_20150315162028.xls', '2015-03-16 00:20:28', '2015-03-16 00:24:03');
INSERT INTO `log` VALUES ('13', 'manage_product', 'info', '朱征宇上传了产品列表文件:D:/work/git/magiczhu_butterfly/htdocs/upload/product/product_20150315162028.xls', '2015-03-16 00:21:03', '2015-03-16 00:24:04');
INSERT INTO `log` VALUES ('14', 'manage_product', 'info', '朱征宇上传了产品列表文件:D:/work/git/magiczhu_butterfly/htdocs/upload/product/product_20150316111654.xls', '2015-03-16 19:16:54', '2015-03-16 19:34:46');
INSERT INTO `log` VALUES ('15', 'manage_product', 'info', '朱征宇上传了产品列表文件:D:/work/git/magiczhu_butterfly/htdocs/upload/product/product_20150316130040.xls', '2015-03-16 21:00:40', null);
INSERT INTO `log` VALUES ('16', 'manage_product', 'info', '朱征宇上传了产品列表文件:D:/work/git/magiczhu_butterfly/htdocs/upload/product/product_20150316150441.xls', '2015-03-16 23:04:41', null);
INSERT INTO `log` VALUES ('17', 'manage_product', 'info', '朱征宇上传了产品列表文件:D:/work/git/magiczhu_butterfly/htdocs/upload/product/product_20150316150632.xls', '2015-03-16 23:06:32', null);
INSERT INTO `log` VALUES ('18', 'manage_product', 'info', '朱征宇上传了产品列表文件:D:/work/git/magiczhu_butterfly/htdocs/upload/product/product_20150316153922.xls', '2015-03-16 23:39:22', null);
INSERT INTO `log` VALUES ('19', 'manage_product', 'info', '朱征宇上传了产品列表文件:D:/work/git/magiczhu_butterfly/htdocs/upload/product/product_20150318042209.xls', '2015-03-18 12:22:09', null);
INSERT INTO `log` VALUES ('20', 'manage_admin', 'info', '朱征宇编辑管理员信息|{\"id\":\"1\",\"username\":\"magic\",\"password\":\"123\",\"name\":\"u6731u5f81u5b87\",\"power\":\"1,2,3,4,5,6,14\"}', '2015-03-18 15:55:54', null);
INSERT INTO `log` VALUES ('21', 'manage_admin', 'info', '朱征宇编辑管理员信息|{\"id\":\"2\",\"username\":\"tanyin\",\"password\":\"1234\",\"name\":\"u8c08u5bc5\",\"power\":\"3,4\"}', '2015-03-19 23:00:01', null);
INSERT INTO `log` VALUES ('22', 'manage_player', 'info', '朱征宇编辑球员信息|{\"player_id\":\"1\",\"name\":\"u5f20u4e09\",\"nationality\":\"china\",\"birth\":\"2000-01-04\",\"zhan_xing\":\"\",\"achievement\":\"2013:u5927u58f0u9053\"}', '2015-03-20 00:05:28', null);
INSERT INTO `log` VALUES ('23', 'manage_player', 'info', '朱征宇编辑球员信息|{\"player_id\":\"1\",\"name\":\"u5f20u4e09\",\"nationality\":\"china\",\"birth\":\"2000-01-04\",\"zhan_xing\":\"u7684u7b97u6cd5\",\"achievement\":\":\"}', '2015-03-20 00:05:50', null);
INSERT INTO `log` VALUES ('24', 'manage_player', 'info', '朱征宇编辑球员信息|{\"player_id\":\"1\",\"name\":\"u5f20u4e09\",\"nationality\":\"china\",\"birth\":\"2000-01-04\",\"zhan_xing\":\"u6c34u7535u8d39\",\"achievement\":\":\"}', '2015-03-20 00:06:10', null);
INSERT INTO `log` VALUES ('25', 'manage_player', 'info', '朱征宇编辑球员信息|{\"player_id\":\"1\",\"name\":\"u5f20u4e09\",\"nationality\":\"china\",\"birth\":\"2000-01-04\",\"zhan_xing\":\"u6492u5730u65b9\",\"achievement\":\":\"}', '2015-03-20 00:08:53', null);
INSERT INTO `log` VALUES ('26', 'manage_player', 'info', '朱征宇编辑球员信息|{\"player_id\":\"4\",\"name\":\"u5f20u4e09\",\"nationality\":\"china\",\"birth\":\"2000-01-04\",\"zhan_xing\":\"u7b54u590d\",\"achievement\":\"2013:u5927u58f0u9053\"}', '2015-03-20 00:09:08', null);
INSERT INTO `log` VALUES ('27', 'manage_player', 'info', '朱征宇编辑球员信息|{\"player_id\":\"4\",\"name\":\"u5f20u4e09\",\"nationality\":\"china\",\"birth\":\"2000-01-04\",\"zhan_xing\":\"u963fu65afu8482u82ac\",\"achievement\":\"2013:u5927u58f0u9053\"}', '2015-03-20 00:09:25', null);
INSERT INTO `log` VALUES ('28', 'manage_player', 'info', '朱征宇编辑球员信息|{\"player_id\":\"4\",\"name\":\"u5f20u4e09\",\"nationality\":\"china\",\"birth\":\"2000-01-04\",\"zhan_xing\":\"u6c34u7535u8d39\",\"achievement\":\"2013:u5927u58f0u9053\"}', '2015-03-20 00:09:39', null);
INSERT INTO `log` VALUES ('29', 'manage_player', 'info', '朱征宇编辑球员信息|{\"player_id\":\"7\",\"name\":\"u5f20u4e09\",\"nationality\":\"china\",\"birth\":\"2000-01-04\",\"zhan_xing\":\"u6492u5730u65b9\",\"achievement\":\"u963fu65afu8482u82ac:u80dcu591au8d1fu5c11\"}', '2015-03-20 00:11:26', null);
INSERT INTO `log` VALUES ('30', 'manage_player', 'info', '朱征宇编辑球员信息|{\"player_id\":\"1\",\"name\":\"u5f20u4e09\",\"nationality\":\"china\",\"birth\":\"2000-01-04\",\"zhan_xing\":\"u7b2cu4e09u65b9\",\"achievement\":\"2013:u80afu5b9au8212u670du5361u8428u4e01\"}', '2015-03-20 00:13:26', null);
INSERT INTO `log` VALUES ('31', 'manage_player', 'info', '朱征宇编辑球员信息|{\"player_id\":\"1\",\"name\":\"u5f20u4e09\",\"nationality\":\"china\",\"birth\":\"2000-01-04\",\"zhan_xing\":\"u7b2cu4e09u65b9u7b54u590d\",\"achievement\":\"2013:u80afu5b9au8212u670du5361u8428u4e01\"}', '2015-03-20 00:13:55', null);
INSERT INTO `log` VALUES ('32', 'manage_player', 'info', '朱征宇编辑球员信息|{\"player_id\":\"3\",\"name\":\"u641cu7d22u7684\",\"nationality\":\"u4e2du56fd\",\"birth\":\"2013u5e7410u670820u65e5\",\"zhan_xing\":\"u653bu51fbu578b\",\"achievement\":\"2014u5e74:u6c34u7535u8d39u6c61u67d3|2015u5e74:u6740u8dccu5361u5361|2012u5e74:IEu554a\"}', '2015-03-20 00:26:45', null);
INSERT INTO `log` VALUES ('33', 'manage_player', 'info', '朱征宇编辑球员信息|{\"player_id\":\"2\",\"name\":\"u674eu56db\",\"nationality\":\"japan\",\"birth\":\"1998-09-10\",\"zhan_xing\":\"u5a03u513f\",\"achievement\":\"2013:IEu5723u8bdeu8282\"}', '2015-03-20 00:27:47', null);
INSERT INTO `log` VALUES ('34', 'manage_player', 'info', '朱征宇编辑球员信息|{\"player_id\":\"\",\"name\":\"u738bu4e94\",\"nationality\":\"u7f8eu56fd\",\"birth\":\"2015u5e7410u670810u65e5\",\"zhan_xing\":\"u9632u5b88u578b\",\"achievement\":\"2014:u963fu4ec0u987fu7b26u6587|2015:u6740u8dcc|:|:\"}', '2015-03-20 00:53:12', null);
INSERT INTO `log` VALUES ('35', 'manage_player', 'info', '朱征宇编辑球员信息|{\"player_id\":\"12\",\"name\":\"u738bu4e94\",\"nationality\":\"u7f8eu56fd\",\"birth\":\"2015u5e7410u670810u65e5\",\"zhan_xing\":\"u9632u5b88u578b\",\"achievement\":\"2014:u963fu4ec0u987fu7b26u6587|2015:u6740u8dcc\"}', '2015-03-20 00:55:12', null);
INSERT INTO `log` VALUES ('36', 'manage_player', 'info', '朱征宇编辑球员信息|{\"player_id\":\"12\",\"name\":\"u738bu4e94\",\"nationality\":\"u7f8eu56fd\",\"birth\":\"2015u5e7410u670810u65e5\",\"zhan_xing\":\"u9632u5b88u578b\",\"achievement\":\"2014:u963fu4ec0u987fu7b26u6587|2015:u6740u8dccs \"}', '2015-03-20 00:55:26', null);
INSERT INTO `log` VALUES ('37', 'manage_player', 'info', '朱征宇编辑球员信息|{\"player_id\":\"12\",\"name\":\"u738bu4e94\",\"nationality\":\"u7f8eu56fd\",\"birth\":\"2015u5e7410u670810u65e5\",\"zhan_xing\":\"u9632u5b88u578b\",\"achievement\":\"2014:u963fu4ec0u987fu7b26u6587|2015:u6740u8dccs d\"}', '2015-03-20 00:55:32', null);
INSERT INTO `log` VALUES ('38', 'manage_player', 'info', '朱征宇编辑球员信息|{\"player_id\":\"12\",\"name\":\"u738bu4e94\",\"nationality\":\"u7f8eu56fd\",\"birth\":\"2015u5e7410u670810u65e5\",\"zhan_xing\":\"u9632u5b88u578b\",\"achievement\":\"2014:u963fu4ec0u987fu7b26u6587|2015:u6740u8dccs\"}', '2015-03-20 00:55:41', null);
INSERT INTO `log` VALUES ('39', 'manage_admin', 'info', '朱征宇编辑管理员信息|{\"id\":null,\"username\":null,\"password\":null,\"name\":null,\"power\":null}', '2015-03-20 11:05:51', null);
INSERT INTO `log` VALUES ('40', 'manage_product', 'info', '朱征宇编辑产品信息|{\"no\":null,\"id\":null,\"name\":null,\"price\":null,\"category\":null}', '2015-03-20 11:45:26', null);
INSERT INTO `log` VALUES ('41', 'manage_product', 'info', '朱征宇编辑产品信息|{\"no\":null,\"id\":null,\"name\":null,\"price\":null,\"category\":null}', '2015-03-20 11:45:43', null);
INSERT INTO `log` VALUES ('42', 'manage_product', 'info', '朱征宇编辑产品信息|{\"no\":null,\"id\":null,\"name\":null,\"price\":null,\"category\":null}', '2015-03-20 11:46:44', null);
INSERT INTO `log` VALUES ('43', 'manage_product', 'info', '朱征宇编辑产品信息|{\"no\":\"ASD\",\"id\":\"1\",\"name\":\"u666eu901au4e52u4e53\",\"price\":\"255\",\"category\":null}', '2015-03-20 11:52:05', null);
INSERT INTO `log` VALUES ('44', 'manage_product', 'info', '朱征宇编辑产品信息|{\"no\":\"dsf\",\"id\":\"1\",\"name\":\"u666eu901au4e52u4e53\",\"price\":\"255\",\"category\":null}', '2015-03-20 11:52:26', null);
INSERT INTO `log` VALUES ('45', 'manage_product', 'info', '朱征宇编辑产品信息|{\"no\":\"sdf\",\"id\":\"1\",\"name\":\"u666eu901au4e52u4e53\",\"price\":\"255\",\"category\":null}', '2015-03-20 11:52:42', null);
INSERT INTO `log` VALUES ('46', 'manage_product', 'info', '朱征宇编辑产品信息|{\"no\":\"aasd\",\"id\":\"47\",\"name\":\"u666eu901au4e52u4e53u7403\",\"price\":\"10\",\"category\":null}', '2015-03-20 11:58:04', null);
INSERT INTO `log` VALUES ('47', 'manage_product', 'info', '朱征宇编辑产品信息|{\"no\":\"asd\",\"id\":\"47\",\"name\":\"u666eu901au4e52u4e53u7403\",\"price\":\"10\",\"category\":null}', '2015-03-20 11:58:13', null);
INSERT INTO `log` VALUES ('48', 'manage_product', 'info', '朱征宇编辑产品信息|{\"no\":\"111\",\"id\":\"47\",\"name\":\"u666eu901au4e52u4e53u7403\",\"price\":\"10\",\"category\":null}', '2015-03-20 11:58:45', null);
INSERT INTO `log` VALUES ('49', 'manage_product', 'info', '朱征宇编辑产品信息|{\"no\":\"sadf\",\"id\":\"47\",\"name\":\"u666eu901au4e52u4e53u7403\",\"price\":\"10\",\"category\":null}', '2015-03-20 11:59:18', null);
INSERT INTO `log` VALUES ('50', 'manage_product', 'info', '朱征宇编辑产品信息|{\"no\":\"asd\",\"id\":\"47\",\"name\":\"u666eu901au4e52u4e53u7403\",\"price\":\"10\",\"category\":null}', '2015-03-20 11:59:56', null);
INSERT INTO `log` VALUES ('51', 'manage_product', 'info', '朱征宇编辑产品信息|{\"no\":\"asd\",\"id\":\"47\",\"name\":\"u666eu901au4e52u4e53u7403\",\"price\":\"10\",\"category\":null}', '2015-03-20 12:00:51', null);
INSERT INTO `log` VALUES ('52', 'manage_product', 'info', '朱征宇编辑产品信息|{\"no\":\"asd\",\"id\":\"47\",\"name\":\"u666eu901au4e52u4e53u7403\",\"price\":\"10\",\"category\":null}', '2015-03-20 12:01:23', null);
INSERT INTO `log` VALUES ('53', 'manage_product', 'info', '朱征宇编辑产品信息|{\"no\":\"dsf\",\"id\":\"47\",\"name\":\"u666eu901au4e52u4e53u7403\",\"price\":\"10\",\"category\":null}', '2015-03-20 12:01:33', null);
INSERT INTO `log` VALUES ('54', 'manage_product', 'info', '朱征宇编辑产品信息|{\"no\":\"sdf\",\"id\":\"47\",\"name\":\"u666eu901au4e52u4e53u7403\",\"price\":\"10\",\"category\":null}', '2015-03-20 12:02:45', null);
INSERT INTO `log` VALUES ('55', 'manage_product', 'info', '朱征宇编辑产品信息|{\"no\":\"wrewer\",\"id\":\"46\",\"name\":\"u4e52u4e53u677f\",\"price\":\"200\",\"category\":null}', '2015-03-20 12:02:52', null);
INSERT INTO `log` VALUES ('56', 'manage_product', 'info', '朱征宇编辑产品信息|{\"no\":\"se3234\",\"id\":\"\",\"name\":\"u7403u62cd\",\"price\":\"35.6\",\"category\":null}', '2015-03-20 12:03:52', null);
INSERT INTO `log` VALUES ('57', 'manage_product', 'info', '朱征宇编辑产品信息|{\"no\":\"asdf\",\"id\":\"\",\"name\":\"dddd\",\"price\":\"23.5\",\"category\":null}', '2015-03-20 15:44:50', null);
INSERT INTO `log` VALUES ('58', 'manage_product', 'info', '朱征宇上传了产品列表文件:D:/work/git/magiczhu_butterfly/htdocs/upload/product/product_20150320074519.xls', '2015-03-20 15:45:19', null);
INSERT INTO `log` VALUES ('59', 'manage_product', 'info', '朱征宇编辑产品信息|{\"no\":\"cvzxc\",\"id\":\"51\",\"name\":\"u666eu901au4e52u4e53u7403232\",\"price\":\"10\",\"category\":null}', '2015-03-20 15:47:06', null);
INSERT INTO `log` VALUES ('60', 'manage_player', 'info', '朱征宇编辑球员信息|{\"player_id\":\"\",\"name\":\"u5f20u7ee7u79d1\",\"nationality\":\"u4e2du56fd\",\"birth\":\"180\",\"zhan_xing\":\"u6253u6cd5\",\"achievement\":\"2014:u6e23|2013:u8bf4u7684\"}', '2015-03-20 15:51:48', null);
INSERT INTO `log` VALUES ('61', 'manage_admin', 'info', '朱征宇编辑管理员信息|{\"id\":\"\",\"username\":\"xiaosheng\",\"password\":\"123456\",\"name\":\"u5c0fu6c88\",\"power\":\"4\"}', '2015-03-20 15:53:23', null);
INSERT INTO `log` VALUES ('62', 'manage_admin', 'info', '朱征宇编辑管理员信息|{\"id\":\"6\",\"username\":\"test3\",\"password\":\"test31\",\"name\":\"test3\",\"power\":\"2,3\"}', '2015-04-04 14:25:16', null);
INSERT INTO `log` VALUES ('63', 'manage_news', 'info', '朱征宇编辑资讯信息|{\"id\":\"1\",\"no\":\"\",\"video_url\":\"121\",\"title\":\"111\",\"content\":\"121\"}', '2015-04-21 22:03:37', null);
INSERT INTO `log` VALUES ('64', 'manage_news', 'info', '朱征宇编辑资讯信息|{\"id\":\"\",\"no\":null,\"video_url\":\"111\",\"title\":\"222\",\"content\":\"111\"}', '2015-04-21 22:33:12', null);
INSERT INTO `log` VALUES ('65', 'manage_news', 'info', '朱征宇编辑资讯信息|{\"id\":\"2\",\"no\":null,\"video_url\":\"111\",\"title\":\"2221\",\"content\":\"111\"}', '2015-04-22 20:54:09', null);
INSERT INTO `log` VALUES ('66', 'manage_game', 'info', '朱征宇编辑资讯信息|{\"id\":\"1\",\"no\":null,\"video_url\":\"111\",\"title\":\"title_1\",\"content\":\"\"}', '2015-04-22 23:36:06', null);
INSERT INTO `log` VALUES ('67', 'manage_game', 'info', '朱征宇编辑资讯信息|{\"id\":\"1\",\"no\":null,\"video_url\":\"111\",\"title\":\"title_1\",\"content\":\"222\"}', '2015-04-22 23:36:13', null);
INSERT INTO `log` VALUES ('68', 'manage_game', 'info', '朱征宇编辑资讯信息|{\"id\":\"1\",\"no\":null,\"video_url\":\"333\",\"title\":\"title_1\",\"content\":\"111\"}', '2015-04-22 23:36:18', null);
INSERT INTO `log` VALUES ('69', 'manage_game', 'info', '朱征宇编辑资讯信息|{\"id\":\"1\",\"no\":null,\"video_url\":\"333\",\"title\":\"title_1\",\"content\":\"222\"}', '2015-04-22 23:36:54', null);
INSERT INTO `log` VALUES ('70', 'manage_game', 'info', '朱征宇编辑资讯信息|{\"id\":\"1\",\"no\":null,\"video_url\":\"333\",\"title\":\"title_1\",\"content\":\"2222\"}', '2015-04-22 23:39:23', null);
INSERT INTO `log` VALUES ('71', 'manage_game', 'info', '朱征宇编辑资讯信息|{\"id\":\"1\",\"no\":null,\"video_url\":\"333\",\"title\":\"title_1\",\"content\":\"22\"}', '2015-04-22 23:40:07', null);
INSERT INTO `log` VALUES ('72', 'manage_game', 'info', '朱征宇编辑资讯信息|{\"id\":\"\",\"no\":null,\"video_url\":\"222\",\"title\":\"111\",\"content\":\"333\"}', '2015-04-22 23:40:16', null);
INSERT INTO `log` VALUES ('73', 'manage_news', 'info', '朱征宇编辑资讯信息|{\"id\":\"1\",\"no\":null,\"video_url\":null,\"title\":\"111\",\"content\":\"121\",\"img\":null}', '2015-05-10 13:18:16', null);
INSERT INTO `log` VALUES ('74', 'manage_news', 'info', '朱征宇编辑资讯信息|{\"id\":null,\"no\":null,\"video_url\":null,\"title\":\"111\",\"content\":\"121\",\"img\":null}', '2015-05-10 13:41:58', null);
INSERT INTO `log` VALUES ('75', 'manage_news', 'info', '朱征宇编辑资讯信息|{\"id\":null,\"no\":null,\"video_url\":null,\"title\":\"111\",\"content\":\"121\",\"img\":null}', '2015-05-10 13:45:14', null);
INSERT INTO `log` VALUES ('76', 'manage_news', 'info', '朱征宇编辑资讯信息|{\"id\":\"1\",\"title\":\"111\",\"content\":\"121\",\"img\":\"/upload/files/20150510055614574.jpg\"}', '2015-05-10 13:56:24', null);
INSERT INTO `log` VALUES ('77', 'manage_news', 'info', '朱征宇编辑资讯信息|{\"id\":\"2\",\"title\":\"2221\",\"content\":\"111\",\"img\":\"/upload/files/20150510055908620.jpg\"}', '2015-05-10 13:59:13', null);
INSERT INTO `log` VALUES ('78', 'manage_player', 'info', '朱征宇编辑球员信息|{\"player_id\":\"13\",\"name\":\"u5f20u7ee7u79d1\",\"nationality\":\"u4e2du56fd\",\"birth\":\"180\",\"zhan_xing\":\"u6253u6cd5\",\"img\":\"/upload/files/20150510065951394.jpg\",\"achievement\":\"2014:u6e23|2013:u8bf4u7684\"}', '2015-05-10 14:59:59', null);
INSERT INTO `log` VALUES ('79', 'manage_player', 'info', '朱征宇编辑球员信息|{\"player_id\":\"13\",\"name\":\"u5f20u7ee7u79d1\",\"nationality\":\"u4e2du56fd\",\"birth\":\"180\",\"zhan_xing\":\"u6253u6cd5\",\"img\":\"/upload/files/20150510131653690.jpg\",\"taojiao\":\"u5957u80f61\",\"diban\":\"u5e95u677f1\",\"achievement\":\"2014:u6e23|2013:u8bf4u7684\"}', '2015-05-10 21:17:05', null);
INSERT INTO `log` VALUES ('80', 'manage_player', 'info', '朱征宇编辑球员信息|{\"player_id\":\"12\",\"name\":\"u738bu4e94\",\"nationality\":\"u7f8eu56fd\",\"birth\":\"2015u5e7410u670810u65e5\",\"zhan_xing\":\"u9632u5b88u578b\",\"img\":\"/upload/files/20150510134852404.jpg\",\"taojiao\":\"\",\"diban\":\"\",\"achievement\":\"2014:u963fu4ec0u987fu7b26u6587|2015:u6740u8dccs\"}', '2015-05-10 21:48:56', null);
INSERT INTO `log` VALUES ('81', 'manage_player', 'info', '朱征宇编辑球员信息|{\"player_id\":\"3\",\"name\":\"u641cu7d22u7684\",\"nationality\":\"u4e2du56fd\",\"birth\":\"2013u5e7410u670820u65e5\",\"zhan_xing\":\"u653bu51fbu578b\",\"img\":\"/upload/files/20150510134934837.jpg\",\"taojiao\":\"\",\"diban\":\"\",\"achievement\":\"2014u5e74:u6c34u7535u8d39u6c61u67d3|2015u5e74:u6740u8dccu5361u5361|2012u5e74:IEu554a\"}', '2015-05-10 21:49:37', null);
INSERT INTO `log` VALUES ('82', 'manage_player', 'info', '朱征宇编辑球员信息|{\"player_id\":\"2\",\"name\":\"u674eu56db\",\"nationality\":\"japan\",\"birth\":\"1998-09-10\",\"zhan_xing\":\"u5a03u513f\",\"img\":\"/upload/files/20150510135021218.jpg\",\"taojiao\":\"\",\"diban\":\"\",\"achievement\":\"2013:IEu5723u8bdeu8282\"}', '2015-05-10 21:50:25', null);
INSERT INTO `log` VALUES ('83', 'manage_player', 'info', '朱征宇编辑球员信息|{\"player_id\":\"13\",\"name\":\"u5f20u7ee7u79d1\",\"nationality\":\"u4e2du56fd\",\"birth\":\"180\",\"zhan_xing\":\"u6253u6cd5\",\"img\":\"/upload/files/20150510141119333.jpg\",\"taojiao\":\"u5957u80f61\",\"diban\":\"u5e95u677f1\",\"achievement\":\"2014:u6e23|2013:u8bf4u7684\"}', '2015-05-10 22:11:21', null);
INSERT INTO `log` VALUES ('84', 'manage_player', 'info', '朱征宇编辑球员信息|{\"player_id\":\"1\",\"name\":\"u5f20u4e09\",\"nationality\":\"china\",\"birth\":\"2000-01-04\",\"zhan_xing\":\"u7b2cu4e09u65b9u7b54u590d\",\"img\":\"\",\"taojiao\":\"\",\"diban\":\"\",\"achievement\":\"2013:u80afu5b9au8212u670du5361u8428u4e01\"}', '2015-05-10 22:14:56', null);
INSERT INTO `log` VALUES ('85', 'manage_player', 'info', '朱征宇编辑球员信息|{\"player_id\":\"2\",\"name\":\"u674eu56db\",\"nationality\":\"japan\",\"birth\":\"1998-09-10\",\"zhan_xing\":\"u5a03u513f\",\"img\":\"\",\"taojiao\":\"\",\"diban\":\"\",\"achievement\":\"2013:IEu5723u8bdeu8282\"}', '2015-05-10 22:15:02', null);
INSERT INTO `log` VALUES ('86', 'manage_player', 'info', '朱征宇编辑球员信息|{\"player_id\":\"1\",\"name\":\"u5f20u4e09\",\"nationality\":\"china\",\"birth\":\"2000-01-04\",\"zhan_xing\":\"u7b2cu4e09u65b9u7b54u590d\",\"img\":\"/upload/files/20150510141509550.jpg\",\"taojiao\":\"\",\"diban\":\"\",\"achievement\":\"2013:u80afu5b9au8212u670du5361u8428u4e01\"}', '2015-05-10 22:15:10', null);
INSERT INTO `log` VALUES ('87', 'manage_player', 'info', '朱征宇编辑球员信息|{\"player_id\":\"2\",\"name\":\"u674eu56db\",\"nationality\":\"japan\",\"birth\":\"1998-09-10\",\"zhan_xing\":\"u5a03u513f\",\"img\":\"/upload/files/20150510141519737.jpg\",\"taojiao\":\"\",\"diban\":\"\",\"achievement\":\"2013:IEu5723u8bdeu8282\"}', '2015-05-10 22:15:19', null);
INSERT INTO `log` VALUES ('88', 'manage_news', 'info', '朱征宇编辑资讯信息|{\"id\":\"1\",\"title\":\"111\",\"content\":\"121\",\"img\":\"\"}', '2015-05-10 22:31:56', null);
INSERT INTO `log` VALUES ('89', 'manage_news', 'info', '朱征宇编辑资讯信息|{\"id\":\"1\",\"title\":\"111\",\"content\":\"121\",\"img\":\"/upload/files/20150510143413874.jpg\"}', '2015-05-10 22:34:15', null);
INSERT INTO `log` VALUES ('90', 'manage_player', 'info', '朱征宇编辑球员信息|{\"player_id\":\"13\",\"name\":\"u5f20u7ee7u79d1\",\"nationality\":\"u4e2du56fd\",\"birth\":\"180\",\"zhan_xing\":\"u6253u6cd5\",\"img\":\"/upload/files/20150510162050619.jpg\",\"taojiao\":\"u5957u80f61\",\"diban\":\"u5e95u677f1\",\"achievement\":\"2014:3333333|2013:u8bf4u7684\"}', '2015-05-11 00:21:07', null);
INSERT INTO `log` VALUES ('91', 'manage_player', 'info', '朱征宇编辑球员信息|{\"player_id\":\"12\",\"name\":\"u5218u8bd7u96ef\",\"nationality\":\"u4e2du56fd\",\"birth\":\"2015u5e7410u670810u65e5\",\"zhan_xing\":\"u9632u5b88u578b\",\"img\":\"/upload/files/20150510162144864.jpg\",\"taojiao\":\"\",\"diban\":\"\",\"achievement\":\"2014:u963fu4ec0u987fu7b26u6587|2015:u6740u8dccs\"}', '2015-05-11 00:21:50', null);
INSERT INTO `log` VALUES ('92', 'manage_player', 'info', '朱征宇编辑球员信息|{\"player_id\":\"3\",\"name\":\"u6c34u8c37u51d6\",\"nationality\":\"u65e5u672c\",\"birth\":\"2013u5e7410u670820u65e5\",\"zhan_xing\":\"u653bu51fbu578b\",\"img\":\"/upload/files/20150510162230377.jpg\",\"taojiao\":\"u5e95u677f3\",\"diban\":\"u5e95u677f2\",\"achievement\":\"2014u5e74:u6c34u7535u8d39u6c61u67d3|2015u5e74:u6740u8dccu5361u5361|2012u5e74:IEu554a\"}', '2015-05-11 00:22:33', null);
INSERT INTO `log` VALUES ('93', 'manage_player', 'info', '朱征宇编辑球员信息|{\"player_id\":\"2\",\"name\":\"u67f3u627fu654f\",\"nationality\":\"u97e9u56fd\",\"birth\":\"1998-09-10\",\"zhan_xing\":\"u5a03u513f\",\"img\":\"/upload/files/20150510162334232.jpg\",\"taojiao\":\"u5957u80f64\",\"diban\":\"u5e95u677f4\",\"achievement\":\"2013:IEu5723u8bdeu8282\"}', '2015-05-11 00:23:36', null);
INSERT INTO `log` VALUES ('94', 'manage_game', 'info', '朱征宇编辑营销网络信息|{\"id\":null,\"company_name\":\"u516cu53f8u540du79f01\",\"address\":\"u516cu53f8u5730u57401\",\"phone\":\"u516cu53f8u7535u8bdd1\",\"fax_number\":\"u516cu53f8u4f20u771f1\",\"area_id\":\"2\"}', '2015-05-18 14:27:32', null);
INSERT INTO `log` VALUES ('95', 'manage_game', 'info', '朱征宇编辑营销网络信息|{\"id\":null,\"company_name\":\"u516cu53f8u540du79f01\",\"address\":\"u516cu53f8u5730u57401\",\"phone\":\"u516cu53f8u7535u8bdd1\",\"fax_number\":\"u516cu53f8u4f20u771f1\",\"area_id\":\"2\"}', '2015-05-18 14:27:36', null);
INSERT INTO `log` VALUES ('96', 'manage_game', 'info', '朱征宇编辑营销网络信息|{\"id\":null,\"company_name\":\"u516cu53f8u540du79f01\",\"address\":\"u516cu53f8u5730u57401\",\"phone\":\"u516cu53f8u7535u8bdd1\",\"fax_number\":\"u516cu53f8u4f20u771f1\",\"area_id\":\"2\"}', '2015-05-18 14:28:37', null);
INSERT INTO `log` VALUES ('97', 'manage_game', 'info', '朱征宇编辑营销网络信息|{\"id\":null,\"company_name\":\"u516cu53f8u540du79f01\",\"address\":\"u516cu53f8u5730u57401\",\"phone\":\"u516cu53f8u7535u8bdd1\",\"fax_number\":\"u516cu53f8u4f20u771f1\",\"area_id\":\"2\"}', '2015-05-18 14:28:38', null);
INSERT INTO `log` VALUES ('98', 'manage_game', 'info', '朱征宇编辑营销网络信息|{\"id\":null,\"company_name\":\"u516cu53f8u540du79f01\",\"address\":\"u516cu53f8u5730u57401\",\"phone\":\"u516cu53f8u7535u8bdd1\",\"fax_number\":\"u516cu53f8u4f20u771f1\",\"area_id\":\"2\"}', '2015-05-18 14:30:26', null);
INSERT INTO `log` VALUES ('99', 'manage_game', 'info', '朱征宇编辑营销网络信息|{\"id\":null,\"company_name\":\"u516cu53f8u540du79f01\",\"address\":\"u516cu53f8u5730u57401\",\"phone\":\"u516cu53f8u7535u8bdd1\",\"fax_number\":\"u516cu53f8u4f20u771f1\",\"area_id\":\"2\"}', '2015-05-18 14:30:30', null);
INSERT INTO `log` VALUES ('100', 'manage_game', 'info', '朱征宇编辑营销网络信息|{\"id\":\"3\",\"company_name\":\"u516cu53f8u540du79f0111\",\"address\":\"u516cu53f8u5730u57401\",\"phone\":\"u516cu53f8u7535u8bdd1\",\"fax_number\":\"u516cu53f8u4f20u771f1\",\"area_id\":\"10\"}', '2015-05-18 14:47:24', null);
INSERT INTO `log` VALUES ('101', 'manage_game', 'info', '朱征宇编辑营销网络信息|{\"id\":\"3\",\"company_name\":\"u516cu53f8u540du79f0123\",\"address\":\"u516cu53f8u5730u57401\",\"phone\":\"u516cu53f8u7535u8bdd1\",\"fax_number\":\"u516cu53f8u4f20u771f1\",\"area_id\":\"0\"}', '2015-05-18 14:47:34', null);
INSERT INTO `log` VALUES ('102', 'manage_game', 'info', '朱征宇编辑营销网络信息|{\"id\":\"4\",\"company_name\":\"u516cu53f8u540du79f02\",\"address\":\"u516cu53f8u5730u57401\",\"phone\":\"u516cu53f8u7535u8bdd1\",\"fax_number\":\"u516cu53f8u4f20u771f1\",\"area_id\":\"0\"}', '2015-05-18 14:48:50', null);
INSERT INTO `log` VALUES ('103', 'manage_game', 'info', '朱征宇编辑营销网络信息|{\"id\":\"3\",\"company_name\":\"u516cu53f8u540du79f012\",\"address\":\"u516cu53f8u5730u57401\",\"phone\":\"u516cu53f8u7535u8bdd1\",\"fax_number\":\"u516cu53f8u4f20u771f1\",\"area_id\":\"0\"}', '2015-05-18 14:48:58', null);
INSERT INTO `log` VALUES ('104', 'manage_game', 'info', '朱征宇编辑营销网络信息|{\"id\":\"2\",\"company_name\":\"u5317u4eacu516cu53f82\",\"address\":\"u5317u4eacu5e02u79e6u7687u5c9b\",\"phone\":\"222\",\"fax_number\":\"321\",\"area_id\":\"0\"}', '2015-05-18 14:49:14', null);
INSERT INTO `log` VALUES ('105', 'manage_game', 'info', '朱征宇编辑营销网络信息|{\"id\":\"3\",\"company_name\":\"u516cu53f8u540du79f012\",\"address\":\"u516cu53f8u5730u57401\",\"phone\":\"u516cu53f8u7535u8bdd1\",\"fax_number\":\"u516cu53f8u4f20u771f1\",\"area_id\":\"3\",\"area_name\":\"u5929u6d25\"}', '2015-05-18 15:34:06', null);
INSERT INTO `log` VALUES ('106', 'manage_game', 'info', '朱征宇编辑营销网络信息|{\"id\":\"4\",\"company_name\":\"u516cu53f8u540du79f02\",\"address\":\"u516cu53f8u5730u57401\",\"phone\":\"u516cu53f8u7535u8bdd1\",\"fax_number\":\"u516cu53f8u4f20u771f1\",\"area_id\":\"6\",\"area_name\":\"u5c71u897f\"}', '2015-05-18 15:34:28', null);
INSERT INTO `log` VALUES ('107', 'manage_game', 'info', '朱征宇编辑营销网络信息|{\"id\":\"\",\"company_name\":\"u516cu53f8u540du79f05\",\"address\":\"u516cu53f8u5730u57405\",\"phone\":\"55555555555\",\"fax_number\":\"u516cu53f8u4f20u771f555\",\"area_id\":\"17\",\"area_name\":\"u6e56u5317\"}', '2015-05-18 15:43:18', null);
INSERT INTO `log` VALUES ('108', 'manage_game', 'info', '朱征宇编辑营销网络信息|{\"id\":\"3\",\"company_name\":\"u4e0au6d77u516cu53f82\",\"address\":\"u516cu53f8u5730u57401\",\"phone\":\"u516cu53f8u7535u8bdd1\",\"fax_number\":\"u516cu53f8u4f20u771f1\",\"area_id\":\"2\",\"area_name\":\"u4e0au6d77\"}', '2015-05-18 16:08:55', null);
INSERT INTO `log` VALUES ('109', 'manage_game', 'info', '朱征宇编辑营销网络信息|{\"id\":\"4\",\"company_name\":\"u4e0au6d77u516cu53f83\",\"address\":\"u516cu53f8u5730u57401\",\"phone\":\"u516cu53f8u7535u8bdd1\",\"fax_number\":\"u516cu53f8u4f20u771f1\",\"area_id\":\"2\",\"area_name\":\"u4e0au6d77\"}', '2015-05-18 16:09:06', null);
INSERT INTO `log` VALUES ('110', 'manage_game', 'info', '朱征宇编辑营销网络信息|{\"id\":\"1\",\"company_name\":\"u4e0au6d77u516cu53f81\",\"address\":\"u4e0au6d77u5e02u6d66u4e1c\",\"phone\":\"11\",\"fax_number\":\"1234\",\"area_id\":\"2\",\"area_name\":\"u4e0au6d77\"}', '2015-05-18 16:45:23', null);
INSERT INTO `log` VALUES ('111', 'manage_player', 'info', '朱征宇编辑经销商类别信息|{\"company_class_id\":\"1\",\"company_id_list\":\"1|2|3|4|5\"}', '2015-05-20 18:37:42', null);
INSERT INTO `log` VALUES ('112', 'manage_player', 'info', '朱征宇编辑经销商类别信息|{\"company_class_id\":\"1\",\"company_id_list\":null}', '2015-05-20 18:42:41', null);
INSERT INTO `log` VALUES ('113', 'manage_player', 'info', '朱征宇编辑经销商类别信息|{\"company_class_id\":\"1\",\"company_id_list\":null}', '2015-05-20 18:45:42', null);
INSERT INTO `log` VALUES ('114', 'manage_player', 'info', '朱征宇编辑经销商类别信息|{\"company_class_id\":\"1\",\"company_id_list\":null}', '2015-05-20 18:46:31', null);
INSERT INTO `log` VALUES ('115', 'manage_player', 'info', '朱征宇编辑经销商类别信息|{\"company_class_id\":\"1\",\"company_id_list\":null}', '2015-05-20 18:47:18', null);
INSERT INTO `log` VALUES ('116', 'manage_player', 'info', '朱征宇编辑经销商类别信息|{\"company_class_id\":\"1\",\"company_id_list\":null}', '2015-05-20 18:48:34', null);
INSERT INTO `log` VALUES ('117', 'manage_player', 'info', '朱征宇编辑经销商类别信息|{\"company_class_id\":\"1\",\"company_id_list\":null}', '2015-05-20 18:52:55', null);
INSERT INTO `log` VALUES ('118', 'manage_player', 'info', '朱征宇编辑经销商类别信息|{\"company_class_id\":\"1\",\"company_id_list\":null}', '2015-05-20 18:53:14', null);
INSERT INTO `log` VALUES ('119', 'manage_player', 'info', '朱征宇编辑经销商类别信息|{\"company_class_id\":\"1\",\"company_id_list\":\"4|5\"}', '2015-05-20 18:55:12', null);
INSERT INTO `log` VALUES ('120', 'manage_player', 'info', '朱征宇编辑经销商类别信息|{\"company_class_id\":\"1\",\"company_id_list\":\"2|3|4|5\"}', '2015-05-20 18:56:14', null);
INSERT INTO `log` VALUES ('121', 'manage_player', 'info', '朱征宇编辑经销商类别信息|{\"company_class_id\":\"1\",\"company_id_list\":\"1|3|4|5\"}', '2015-05-20 18:57:20', null);
INSERT INTO `log` VALUES ('122', 'manage_player', 'info', '朱征宇编辑经销商类别信息|{\"id\":\"1\",\"company_id_list\":\"1|3|4|5\"}', '2015-05-20 18:58:11', null);
INSERT INTO `log` VALUES ('123', 'manage_player', 'info', '朱征宇编辑经销商类别信息|{\"id\":\"1\",\"company_id_list\":\"1|3|4|5\"}', '2015-05-20 18:58:58', null);
INSERT INTO `log` VALUES ('124', 'manage_player', 'info', '朱征宇编辑经销商类别信息|{\"id\":\"1\",\"company_id_list\":\"3|4|5\"}', '2015-05-21 11:05:49', null);
INSERT INTO `log` VALUES ('125', 'manage_player', 'info', '朱征宇编辑经销商类别信息|{\"id\":\"1\",\"company_id_list\":\"2|3|4|5\"}', '2015-05-21 11:10:49', null);
INSERT INTO `log` VALUES ('126', 'manage_player', 'info', '朱征宇编辑经销商类别信息|{\"id\":\"1\",\"company_id_list\":\"1|2|4|5\"}', '2015-05-21 13:20:32', null);
INSERT INTO `log` VALUES ('127', 'manage_player', 'info', '朱征宇编辑经销商类别信息|{\"id\":\"1\",\"company_id_list\":\"2|4|5\"}', '2015-05-21 14:17:45', null);
INSERT INTO `log` VALUES ('128', 'manage_player', 'info', '朱征宇编辑经销商类别信息|{\"id\":\"1\",\"company_id_list\":\"2|5\"}', '2015-05-21 14:17:51', null);
INSERT INTO `log` VALUES ('129', 'manage_player', 'info', '朱征宇编辑经销商类别信息|{\"id\":\"1\",\"company_id_list\":\"2|3|5\",\"class_name\":null}', '2015-05-21 14:40:13', null);
INSERT INTO `log` VALUES ('130', 'manage_player', 'info', '朱征宇编辑经销商类别信息|{\"id\":\"1\",\"company_id_list\":\"2|5\",\"class_name\":null}', '2015-05-21 14:45:01', null);
INSERT INTO `log` VALUES ('131', 'manage_player', 'info', '朱征宇编辑经销商类别信息|{\"id\":\"1\",\"company_id_list\":\"2|5\",\"class_name\":\"u4e00u7ea7u7ecfu9500u55461\"}', '2015-05-21 14:45:53', null);
INSERT INTO `log` VALUES ('132', 'manage_player', 'info', '朱征宇编辑经销商类别信息|{\"id\":\"1\",\"company_id_list\":\"2|5\",\"class_name\":\"u4e00u7ea7u7ecfu9500u55462\"}', '2015-05-21 14:46:04', null);
INSERT INTO `log` VALUES ('133', 'manage_player', 'info', '朱征宇编辑经销商类别信息|{\"id\":\"\",\"company_id_list\":\"1|4\",\"class_name\":\"u6d4bu8bd5u7ecfu9500u5546u7c7bu522b\"}', '2015-05-21 16:05:45', null);
INSERT INTO `log` VALUES ('134', 'manage_game', 'info', '朱征宇编辑营销网络信息|{\"id\":\"1\",\"company_name\":\"u4e0au6d77u516cu53f81\",\"address\":\"u4e0au6d77u5e02u6d66u4e1c\",\"phone\":\"11\",\"fax_number\":\"1234\",\"area_id\":\"2\",\"img\":\"/upload/files/20150521113454630.jpg\",\"area_name\":\"u4e0au6d77\"}', '2015-05-21 17:34:58', null);
INSERT INTO `log` VALUES ('135', 'manage_game', 'info', '朱征宇编辑营销网络信息|{\"id\":\"\",\"company_name\":\"u6d4bu8bd5u4e0au6d77u516cu53f86\",\"address\":\"u4e0au6d77XXX\",\"phone\":\"11111\",\"fax_number\":\"2222\",\"area_id\":\"5\",\"img\":\"/upload/files/20150521113810180.jpg\",\"area_name\":\"u6cb3u5317\"}', '2015-05-21 17:38:12', null);
INSERT INTO `log` VALUES ('136', 'manage_game', 'info', '朱征宇编辑营销网络信息|{\"id\":\"1\",\"company_name\":\"u4e0au6d77u516cu53f8122\",\"address\":\"u4e0au6d77u5e02u6d66u4e1c\",\"phone\":\"11\",\"fax_number\":\"1234\",\"area_id\":\"2\",\"img\":\"/upload/files/20150521113454630.jpg\",\"area_name\":\"u4e0au6d77\"}', '2015-05-21 18:22:24', null);

-- ----------------------------
-- Table structure for `market_area`
-- ----------------------------
DROP TABLE IF EXISTS `market_area`;
CREATE TABLE `market_area` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `area_name` varchar(20) DEFAULT NULL,
  `is_delete` enum('0','1') DEFAULT '0',
  `create_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of market_area
-- ----------------------------
INSERT INTO `market_area` VALUES ('1', '北京', '0', '2015-05-18 11:13:23', null);
INSERT INTO `market_area` VALUES ('2', '上海', '0', '2015-05-18 11:13:26', null);
INSERT INTO `market_area` VALUES ('3', '天津', '0', '2015-05-18 11:13:45', null);
INSERT INTO `market_area` VALUES ('4', '重庆', '0', '2015-05-18 11:13:50', null);
INSERT INTO `market_area` VALUES ('5', '河北', '0', '2015-05-18 11:13:53', null);
INSERT INTO `market_area` VALUES ('6', '山西', '0', '2015-05-18 11:13:55', null);
INSERT INTO `market_area` VALUES ('7', '辽宁', '0', '2015-05-18 11:13:59', null);
INSERT INTO `market_area` VALUES ('8', '吉林', '0', '2015-05-18 11:14:03', null);
INSERT INTO `market_area` VALUES ('9', '黑龙江', '0', '2015-05-18 11:14:06', null);
INSERT INTO `market_area` VALUES ('10', '江苏', '0', '2015-05-18 11:14:09', null);
INSERT INTO `market_area` VALUES ('11', '浙江', '0', '2015-05-18 11:14:12', null);
INSERT INTO `market_area` VALUES ('12', '安徽', '0', '2015-05-18 11:14:14', null);
INSERT INTO `market_area` VALUES ('13', '福建', '0', '2015-05-18 11:14:17', null);
INSERT INTO `market_area` VALUES ('14', '江西', '0', '2015-05-18 11:14:20', null);
INSERT INTO `market_area` VALUES ('15', '山东', '0', '2015-05-18 11:14:24', null);
INSERT INTO `market_area` VALUES ('16', '河南', '0', '2015-05-18 11:14:26', null);
INSERT INTO `market_area` VALUES ('17', '湖北', '0', '2015-05-18 11:14:29', null);
INSERT INTO `market_area` VALUES ('18', '湖南', '0', '2015-05-18 11:14:32', null);
INSERT INTO `market_area` VALUES ('19', '广东', '0', '2015-05-18 11:14:35', null);
INSERT INTO `market_area` VALUES ('20', '海南', '0', '2015-05-18 11:14:38', null);
INSERT INTO `market_area` VALUES ('21', '四川', '0', '2015-05-18 11:14:42', null);
INSERT INTO `market_area` VALUES ('22', '贵州', '0', '2015-05-18 11:14:45', null);
INSERT INTO `market_area` VALUES ('23', '云南', '0', '2015-05-18 11:14:52', null);
INSERT INTO `market_area` VALUES ('24', '陕西', '0', '2015-05-18 11:14:55', '2015-05-18 11:14:59');
INSERT INTO `market_area` VALUES ('25', '甘肃', '0', '2015-05-18 11:15:02', null);
INSERT INTO `market_area` VALUES ('26', '青海', '0', '2015-05-18 11:15:05', null);
INSERT INTO `market_area` VALUES ('27', '台湾(无)', '0', '2015-05-18 11:15:14', null);
INSERT INTO `market_area` VALUES ('28', '内蒙古', '0', '2015-05-18 11:15:19', null);
INSERT INTO `market_area` VALUES ('29', '广西', '0', '2015-05-18 11:15:22', null);
INSERT INTO `market_area` VALUES ('30', '宁夏', '0', '2015-05-18 11:15:27', null);
INSERT INTO `market_area` VALUES ('31', '新疆', '0', '2015-05-18 11:15:30', null);
INSERT INTO `market_area` VALUES ('32', '西藏', '0', '2015-05-18 11:15:33', null);

-- ----------------------------
-- Table structure for `market_company`
-- ----------------------------
DROP TABLE IF EXISTS `market_company`;
CREATE TABLE `market_company` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `company_name` varchar(50) DEFAULT NULL COMMENT '公司名称',
  `area_id` int(9) DEFAULT NULL,
  `area_name` varchar(20) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `fax_number` varchar(20) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `img` varchar(50) DEFAULT NULL COMMENT '地图图片路径',
  `is_delete` enum('0','1') DEFAULT '0',
  `create_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of market_company
-- ----------------------------
INSERT INTO `market_company` VALUES ('1', '上海公司122', '2', '上海', '11', '1234', '上海市浦东', '/upload/files/20150521113454630.jpg', '0', '2015-05-18 10:32:57', '2015-05-21 18:22:24');
INSERT INTO `market_company` VALUES ('2', '北京公司2', '1', '北京', '222', '321', '北京市秦皇岛', null, '0', '2015-05-18 10:33:00', '2015-05-18 15:38:26');
INSERT INTO `market_company` VALUES ('3', '上海公司2', '2', '上海', '公司电话1', '公司传真1', '公司地址1', null, '0', '2015-05-18 14:30:26', '2015-05-18 16:08:55');
INSERT INTO `market_company` VALUES ('4', '上海公司3', '2', '上海', '公司电话1', '公司传真1', '公司地址1', null, '0', '2015-05-18 14:30:30', '2015-05-18 16:09:06');
INSERT INTO `market_company` VALUES ('5', '公司名称5', '17', '湖北', '55555555555', '公司传真555', '公司地址5', null, '0', '2015-05-18 15:43:18', null);
INSERT INTO `market_company` VALUES ('6', '测试上海公司6', '5', '河北', '11111', '2222', '上海XXX', '/upload/files/20150521113810180.jpg', '0', '2015-05-21 17:38:12', null);

-- ----------------------------
-- Table structure for `market_company_class`
-- ----------------------------
DROP TABLE IF EXISTS `market_company_class`;
CREATE TABLE `market_company_class` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `class_name` varchar(50) DEFAULT NULL,
  `company_id_list` varchar(200) DEFAULT NULL COMMENT '公司ID列表,以"|"分割',
  `is_delete` enum('0','1') DEFAULT '0' COMMENT '是否删除标志(0:未删除;1:已删除)',
  `create_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of market_company_class
-- ----------------------------
INSERT INTO `market_company_class` VALUES ('1', '一级经销商2', '2|5', '0', '2015-05-20 15:31:41', '2015-05-21 14:46:04');
INSERT INTO `market_company_class` VALUES ('2', '二级经销商', '2|4', '0', '2015-05-20 15:31:53', '2015-05-20 15:31:58');
INSERT INTO `market_company_class` VALUES ('3', '测试经销商类别', '1|4', '0', '2015-05-21 16:05:45', null);

-- ----------------------------
-- Table structure for `market_map`
-- ----------------------------
DROP TABLE IF EXISTS `market_map`;
CREATE TABLE `market_map` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `company_name` varchar(50) DEFAULT NULL COMMENT '公司名称',
  `area_name` varchar(20) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `fax_number` varchar(20) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `is_delete` enum('0','1') DEFAULT '0',
  `create_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of market_map
-- ----------------------------
INSERT INTO `market_map` VALUES ('1', null, '上海', '11', '123', '上海市浦东', '0', '2015-05-18 10:32:57', '2015-05-18 10:33:12');
INSERT INTO `market_map` VALUES ('2', null, '北京', '22', '321', '北京市秦皇岛', '0', '2015-05-18 10:33:00', '2015-05-18 10:33:18');

-- ----------------------------
-- Table structure for `module`
-- ----------------------------
DROP TABLE IF EXISTS `module`;
CREATE TABLE `module` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `module_name` varchar(50) DEFAULT NULL,
  `url` varchar(100) DEFAULT NULL,
  `parent_module_id` int(9) DEFAULT '0' COMMENT '父模块ID号',
  `is_delete` enum('0','1') DEFAULT '0' COMMENT '否是被删除标志',
  `create_date` datetime DEFAULT NULL,
  `update_date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of module
-- ----------------------------
INSERT INTO `module` VALUES ('1', '前端页面管理', 'manage_front_page.php', '0', '0', null, '2015-02-28 19:45:23');
INSERT INTO `module` VALUES ('2', '管理员权限管理', 'manage_power.php', '0', '0', null, '2015-02-28 19:45:23');
INSERT INTO `module` VALUES ('3', '操作日志', 'operate_log.php', '0', '0', null, '2015-02-28 19:45:23');
INSERT INTO `module` VALUES ('4', '产品管理', 'manage_product.php', '0', '0', null, '2015-02-28 19:45:24');
INSERT INTO `module` VALUES ('5', '新闻管理', 'manage_news.php', '1', '0', null, '2015-05-09 17:48:12');
INSERT INTO `module` VALUES ('6', '模块管理', 'manage_module.php', '0', '1', null, '2015-03-20 10:22:12');
INSERT INTO `module` VALUES ('7', '首页管理', 'manage_front_page.php?action=index', '1', '0', null, '2015-03-30 23:42:05');
INSERT INTO `module` VALUES ('8', '管理员列表', 'manage_admin.php', '2', '0', null, '2015-03-18 22:54:26');
INSERT INTO `module` VALUES ('9', '管理员管理日志', 'show_log.php?action=manage_admin', '3', '0', null, '2015-03-09 14:46:43');
INSERT INTO `module` VALUES ('10', '上传图片压缩文件', 'manage_product.php?action=upload_img_zip', '4', '0', null, '2015-03-10 14:39:16');
INSERT INTO `module` VALUES ('11', '批量上传产品', 'manage_product.php?action=batch_upload_product', '4', '0', null, '2015-03-12 14:43:55');
INSERT INTO `module` VALUES ('12', '产品列表', 'manage_product.php?action=product_list', '4', '0', null, '2015-03-12 15:52:15');
INSERT INTO `module` VALUES ('13', '管理产品日志', 'show_log.php?action=manage_product', '3', '0', null, '2015-03-16 00:27:41');
INSERT INTO `module` VALUES ('14', '球员管理', 'manage_player.php?action=player_list', '1', '0', null, '2015-04-22 23:43:02');
INSERT INTO `module` VALUES ('15', '账号管理', '', '0', '0', null, '2015-03-18 20:53:29');
INSERT INTO `module` VALUES ('16', '球员列表', 'manage_player.php?action=player_list', '14', '1', null, '2015-04-22 23:42:57');
INSERT INTO `module` VALUES ('17', '产品分类管理', 'manage_class.php?action=class_list', '4', '0', null, '2015-03-28 21:18:27');
INSERT INTO `module` VALUES ('18', '赛事管理', 'manage_game.php', '1', '0', null, '2015-03-30 23:25:05');
INSERT INTO `module` VALUES ('19', '营销网络', 'manage_market.php?action=company_list', '1', '0', null, '2015-05-18 13:12:00');
INSERT INTO `module` VALUES ('20', '营销网络(经销商类别)', 'manage_market.php?action=company_class_list', '1', '0', null, '2015-05-20 15:33:48');

-- ----------------------------
-- Table structure for `news`
-- ----------------------------
DROP TABLE IF EXISTS `news`;
CREATE TABLE `news` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) DEFAULT NULL,
  `content` varchar(500) DEFAULT NULL,
  `video_url` varchar(100) DEFAULT NULL,
  `img` varchar(100) DEFAULT NULL COMMENT '新闻配图',
  `is_delete` enum('0','1') DEFAULT '0',
  `create_date` datetime DEFAULT NULL,
  `update_date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of news
-- ----------------------------
INSERT INTO `news` VALUES ('1', '111', '121', '', '/upload/files/20150510143413874.jpg', '0', '2015-04-21 22:03:37', '2015-05-10 22:34:15');
INSERT INTO `news` VALUES ('2', '2221', '111', '111', '/upload/files/20150510055908620.jpg', '0', '2015-04-21 22:33:12', '2015-05-10 13:59:13');
INSERT INTO `news` VALUES ('3', '111', '121', '', null, '0', '2015-05-10 13:41:58', null);
INSERT INTO `news` VALUES ('4', '111', '121', '', null, '0', '2015-05-10 13:45:14', null);

-- ----------------------------
-- Table structure for `player`
-- ----------------------------
DROP TABLE IF EXISTS `player`;
CREATE TABLE `player` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `nationality` varchar(20) DEFAULT NULL,
  `birth` varchar(20) DEFAULT NULL,
  `zhan_xing` varchar(50) DEFAULT NULL,
  `achievement` varchar(1000) DEFAULT NULL,
  `sort` int(2) DEFAULT NULL COMMENT '员球排序',
  `img` varchar(100) DEFAULT NULL,
  `taojiao` varchar(100) DEFAULT NULL,
  `diban` varchar(100) DEFAULT NULL,
  `is_delete` enum('0','1') DEFAULT '0',
  `create_date` datetime DEFAULT NULL,
  `update_date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of player
-- ----------------------------
INSERT INTO `player` VALUES ('2', '柳承敏', '韩国', '1998-09-10', '娃儿', '2013:IE圣诞节', '2', '/upload/files/20150510162334232.jpg', '套胶4', '底板4', '0', null, '2015-05-11 00:23:36');
INSERT INTO `player` VALUES ('3', '水谷凖', '日本', '2013年10月20日', '攻击型', '2014年:水电费污染|2015年:杀跌卡卡|2012年:IE啊', null, '/upload/files/20150510162230377.jpg', '底板3', '底板2', '0', '2015-03-19 23:30:16', '2015-05-11 00:22:33');
INSERT INTO `player` VALUES ('12', '刘诗雯', '中国', '2015年10月10日', '防守型', '2014:阿什顿符文|2015:杀跌s', null, '/upload/files/20150510162144864.jpg', '', '', '0', '2015-03-20 00:53:12', '2015-05-11 00:21:50');
INSERT INTO `player` VALUES ('13', '张继科', '中国', '180', '打法', '2014:3333333|2013:说的', null, '/upload/files/20150510162050619.jpg', '套胶1', '底板1', '0', '2015-03-20 15:51:48', '2015-05-11 00:21:07');

-- ----------------------------
-- Table structure for `product`
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `no` varchar(50) DEFAULT NULL COMMENT '产品编号',
  `name` varchar(50) DEFAULT NULL COMMENT '产品名',
  `price` float(20,0) DEFAULT NULL COMMENT '产品价格',
  `category_name` varchar(255) DEFAULT NULL COMMENT '产品所属大类名',
  `is_publish` enum('0','1') DEFAULT '0' COMMENT '是否已发布产品标志,0:未发布;1:已发布',
  `is_delete` enum('0','1') DEFAULT '0' COMMENT '是否已删除标志,0:未删除;1:已删除',
  `create_date` datetime DEFAULT NULL COMMENT '数据创建日期',
  `update_date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('1', null, '普通乒乓', '255', '板', '0', '0', null, null);
INSERT INTO `product` VALUES ('2', null, '乒乓板', '200', '乒乓板', '0', '0', null, null);
INSERT INTO `product` VALUES ('48', 'se3234', '球拍', '36', '', '0', '0', '2015-03-20 12:03:52', null);
INSERT INTO `product` VALUES ('49', 'asdf', 'dddd', '23', '', '0', '0', '2015-03-20 15:44:50', null);
INSERT INTO `product` VALUES ('50', null, '乒乓板', '200', '乒乓板', '0', '0', null, null);
INSERT INTO `product` VALUES ('51', 'cvzxc', '普通乒乓球232', '10', '', '0', '0', null, '2015-03-20 15:47:06');
INSERT INTO `product` VALUES ('52', null, '乒乓板', '200', '乒乓板', '0', '0', null, null);
INSERT INTO `product` VALUES ('53', null, '普通乒乓球', '10', '乒乓球', '0', '0', null, null);

-- ----------------------------
-- Table structure for `product_class`
-- ----------------------------
DROP TABLE IF EXISTS `product_class`;
CREATE TABLE `product_class` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `class_name` varchar(50) DEFAULT NULL,
  `parent_id` int(9) DEFAULT NULL,
  `is_delete` enum('0','1') DEFAULT '0',
  `create_date` datetime DEFAULT NULL,
  `update_date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product_class
-- ----------------------------
INSERT INTO `product_class` VALUES ('1', '测试1', null, '0', null, null);

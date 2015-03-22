/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50524
Source Host           : localhost:3306
Source Database       : butterfly

Target Server Type    : MYSQL
Target Server Version : 50524
File Encoding         : 65001

Date: 2015-03-22 22:55:34
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
INSERT INTO `admin` VALUES ('6', 'test3', 'test3', 'test3', '2,3', '0', null, '2015-03-09 14:40:47');
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
INSERT INTO `excel` VALUES ('3', 'product_20150316150441.xls', '1', '2015-03-16 23:04:41', null);
INSERT INTO `excel` VALUES ('4', 'product_20150316150632.xls', '2', '2015-03-16 23:06:32', '2015-03-18 00:45:26');
INSERT INTO `excel` VALUES ('5', 'product_20150316153922.xls', '2', '2015-03-16 23:39:22', '2015-03-18 00:07:43');
INSERT INTO `excel` VALUES ('6', 'product_20150318042209.xls', '2', '2015-03-18 12:22:09', '2015-03-18 12:22:17');
INSERT INTO `excel` VALUES ('7', 'product_20150320074519.xls', '2', '2015-03-20 15:45:19', '2015-03-20 15:46:24');

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
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of module
-- ----------------------------
INSERT INTO `module` VALUES ('1', '前端页面管理', 'manage_front_page.php', '0', '0', null, '2015-02-28 19:45:23');
INSERT INTO `module` VALUES ('2', '管理员权限管理', 'manage_power.php', '0', '0', null, '2015-02-28 19:45:23');
INSERT INTO `module` VALUES ('3', '操作日志', 'operate_log.php', '0', '0', null, '2015-02-28 19:45:23');
INSERT INTO `module` VALUES ('4', '产品管理', 'manage_product.php', '0', '0', null, '2015-02-28 19:45:24');
INSERT INTO `module` VALUES ('5', '资讯管理', 'manage_news.php', '1', '0', null, '2015-03-20 00:48:28');
INSERT INTO `module` VALUES ('6', '模块管理', 'manage_module.php', '0', '1', null, '2015-03-20 10:22:12');
INSERT INTO `module` VALUES ('7', '首页管理', 'manage_index.php', '1', '0', null, '2015-03-20 00:49:14');
INSERT INTO `module` VALUES ('8', '管理员列表', 'manage_admin.php', '2', '0', null, '2015-03-18 22:54:26');
INSERT INTO `module` VALUES ('9', '管理员管理日志', 'show_log.php?action=manage_admin', '3', '0', null, '2015-03-09 14:46:43');
INSERT INTO `module` VALUES ('10', '上传图片压缩文件', 'manage_product.php?action=upload_img_zip', '4', '0', null, '2015-03-10 14:39:16');
INSERT INTO `module` VALUES ('11', '批量上传产品', 'manage_product.php?action=batch_upload_product', '4', '0', null, '2015-03-12 14:43:55');
INSERT INTO `module` VALUES ('12', '产品列表', 'manage_product.php?action=product_list', '4', '0', null, '2015-03-12 15:52:15');
INSERT INTO `module` VALUES ('13', '管理产品日志', 'show_log.php?action=manage_product', '3', '0', null, '2015-03-16 00:27:41');
INSERT INTO `module` VALUES ('14', '球员管理', 'manage_player.php', '0', '0', null, '2015-03-18 15:55:41');
INSERT INTO `module` VALUES ('15', '账号管理', '', '0', '0', null, '2015-03-18 20:53:29');
INSERT INTO `module` VALUES ('16', '球员列表', 'manage_player.php?action=player_list', '14', '0', null, '2015-03-18 22:58:14');

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
  `is_delete` enum('0','1') DEFAULT '0',
  `create_date` datetime DEFAULT NULL,
  `update_date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of player
-- ----------------------------
INSERT INTO `player` VALUES ('1', '张三', 'china', '2000-01-04', '第三方答复', '2013:肯定舒服卡萨丁', '1', '0', null, '2015-03-20 00:13:55');
INSERT INTO `player` VALUES ('2', '李四', 'japan', '1998-09-10', '娃儿', '2013:IE圣诞节', '2', '0', null, '2015-03-20 00:27:47');
INSERT INTO `player` VALUES ('3', '搜索的', '中国', '2013年10月20日', '攻击型', '2014年:水电费污染|2015年:杀跌卡卡|2012年:IE啊', null, '0', '2015-03-19 23:30:16', '2015-03-20 00:26:45');
INSERT INTO `player` VALUES ('12', '王五', '美国', '2015年10月10日', '防守型', '2014:阿什顿符文|2015:杀跌s', null, '0', '2015-03-20 00:53:12', '2015-03-20 00:55:41');
INSERT INTO `player` VALUES ('13', '张继科', '中国', '180', '打法', '2014:渣|2013:说的', null, '0', '2015-03-20 15:51:48', null);

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
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('1', null, '普通乒乓', '255', '板', '0', '0', null, null);
INSERT INTO `product` VALUES ('2', null, '乒乓板', '200', '乒乓板', '0', '0', null, null);
INSERT INTO `product` VALUES ('48', 'se3234', '球拍', '36', '', '0', '0', '2015-03-20 12:03:52', null);
INSERT INTO `product` VALUES ('49', 'asdf', 'dddd', '23', '', '0', '0', '2015-03-20 15:44:50', null);
INSERT INTO `product` VALUES ('50', null, '乒乓板', '200', '乒乓板', '0', '0', null, null);
INSERT INTO `product` VALUES ('51', 'cvzxc', '普通乒乓球232', '10', '', '0', '0', null, '2015-03-20 15:47:06');

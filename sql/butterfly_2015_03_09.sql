/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50612
Source Host           : localhost:3306
Source Database       : butterfly

Target Server Type    : MYSQL
Target Server Version : 50612
File Encoding         : 65001

Date: 2015-03-09 18:25:32
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admin
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('1', 'magic', '朱征宇', '123', '1,2,3,4,5,6', '0', null, '2015-03-04 23:54:24');
INSERT INTO `admin` VALUES ('2', 'tanyin', '谈寅', '123', '2,3', '0', null, null);
INSERT INTO `admin` VALUES ('3', 'yezong', '叶总', '111', '4,2', '0', null, '2015-03-02 23:31:28');
INSERT INTO `admin` VALUES ('4', 'test', 'name', 'aaa', '1,3,5', '0', null, '2015-03-09 14:36:04');
INSERT INTO `admin` VALUES ('5', 'test2', '2323', '123', '2,3,4', '0', null, '2015-03-09 14:33:04');
INSERT INTO `admin` VALUES ('6', 'test3', 'test3', 'test3', '2,3', '0', null, '2015-03-09 14:40:47');
INSERT INTO `admin` VALUES ('7', 'test4', 'name', 'test4', '4', '0', null, null);
INSERT INTO `admin` VALUES ('8', 'test5', '测试5', 'test5', '4,5', '0', null, null);
INSERT INTO `admin` VALUES ('9', 'test6', '测试6', 'test6', '3,4', '0', null, '2015-03-09 16:15:16');
INSERT INTO `admin` VALUES ('10', 'test7', '测试7', 'test7', '4,5', '0', null, null);

-- ----------------------------
-- Table structure for log
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

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

-- ----------------------------
-- Table structure for module
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of module
-- ----------------------------
INSERT INTO `module` VALUES ('1', '前端页面管理', 'manage_front_page.php', '0', '0', null, '2015-02-28 19:45:23');
INSERT INTO `module` VALUES ('2', '管理员权限管理', 'manage_power.php', '0', '0', null, '2015-02-28 19:45:23');
INSERT INTO `module` VALUES ('3', '操作日志', 'operate_log.php', '0', '0', null, '2015-02-28 19:45:23');
INSERT INTO `module` VALUES ('4', '产品管理', 'manage_product.php', '0', '0', null, '2015-02-28 19:45:24');
INSERT INTO `module` VALUES ('5', '资讯管理', 'manage_news.php', '0', '0', null, '2015-02-28 19:45:25');
INSERT INTO `module` VALUES ('6', '模块管理', 'manage_module.php', '0', '0', null, '2015-02-28 20:26:04');
INSERT INTO `module` VALUES ('7', '首页管理', null, '1', '0', null, '2015-02-28 20:26:05');
INSERT INTO `module` VALUES ('8', '管理员管理', 'manage_admin.php', '2', '0', null, '2015-03-01 22:11:10');
INSERT INTO `module` VALUES ('9', '管理员管理日志', 'show_log.php?action=manage_admin', '3', '0', null, '2015-03-09 14:46:43');

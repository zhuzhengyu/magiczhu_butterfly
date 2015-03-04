/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50524
Source Host           : localhost:3306
Source Database       : butterfly

Target Server Type    : MYSQL
Target Server Version : 50524
File Encoding         : 65001

Date: 2015-03-01 23:02:19
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('1', 'magic', '朱征宇', '123', '1,2,3,4,5', '0', null, '2015-03-01 00:26:22');
INSERT INTO `admin` VALUES ('2', 'tanyin', '谈寅', '123', '2,3', '0', null, null);

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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

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

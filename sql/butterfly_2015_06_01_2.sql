/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50617
Source Host           : localhost:3306
Source Database       : butterfly

Target Server Type    : MYSQL
Target Server Version : 50617
File Encoding         : 65001

Date: 2015-06-01 20:00:18
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
INSERT INTO `admin` VALUES ('1', 'magic', '朱征宇', '123', '1,2,3,4,5,6,14,21', '0', null, '2015-05-30 16:07:19');
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
) ENGINE=InnoDB AUTO_INCREMENT=1001 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of index_page
-- ----------------------------
INSERT INTO `index_page` VALUES ('1', 'CgoKICAgIDxkaXYgY2xhc3M9ImJhbm5lciI+CiAgICAgICAgPCEtLSDku6PnoIEg5byA5aeLIC0tPgogICAgICAgIDxkaXYgaWQ9ImZ1bGwtc2NyZWVuLXNsaWRlciI+CiAgICAgICAgICAgIDx1bCBpZD0ic2xpZGVzIj4KICAgICAgICAgICAgICAgIDxsaSBzdHlsZT0iYmFja2dyb3VuZDp1cmwoJ2h0dHA6Ly9idXR0ZXJmbHkuY29tL2ltYWdlcy9iYW5uZXIuanBnJykiIGNsYXNzPSJiYWNrZ3JvdW5kIiBpZD0iYmFja2dyb3VuZF9pbWdfMDEiPjxhIGlkPSJhX2JhY2tncm91bmRfaW1nXzAxIiBocmVmPSJqYXZhc2NyaXB0OmFsZXJ0KDEpOyI+PC9hPjwvbGk+CiAgICAgICAgICAgICAgICA8bGkgc3R5bGU9ImJhY2tncm91bmQ6dXJsKCdodHRwOi8vYnV0dGVyZmx5LmNvbS9pbWFnZXMvYmFubmVyMi5qcGcnKSIgY2xhc3M9ImJhY2tncm91bmQiIGlkPSJiYWNrZ3JvdW5kX2ltZ18wMiI+PGEgaWQ9ImFfYmFja2dyb3VuZF9pbWdfMDIiIGhyZWY9ImphdmFzY3JpcHQ6YWxlcnQoMik7Ij48L2E+PC9saT4KICAgICAgICAgICAgICAgIDxsaSBzdHlsZT0iYmFja2dyb3VuZDp1cmwoJ2h0dHA6Ly9idXR0ZXJmbHkuY29tL2ltYWdlcy9iYW5uZXIxLmpwZycpIiBjbGFzcz0iYmFja2dyb3VuZCIgaWQ9ImJhY2tncm91bmRfaW1nXzAzIj48YSBpZD0iYV9iYWNrZ3JvdW5kX2ltZ18wMyIgaHJlZj0iamF2YXNjcmlwdDphbGVydCgzKTsiPjwvYT48L2xpPgogICAgICAgICAgICA8L3VsPgogICAgICAgICAgICA8dWwgaWQ9InBhZ2luYXRpb24iIHN0eWxlPSJtYXJnaW4tbGVmdDogMzkycHg7Ij4KICAgICAgICAgICAgCTxsaSBjbGFzcz0iY3VycmVudCBidXR0b25fYmFja2dyb3VkIj48YSBocmVmPSJqYXZhc2NyaXB0OnN3aXRjaF9pbWcodGhpcy5pZCk7IiBpZD0iYmFja2dyb3VkXzAxIj4xPC9hPjwvbGk+CiAgICAgICAgICAgIAk8bGkgY2xhc3M9ImJ1dHRvbl9iYWNrZ3JvdWQiPjxhIGhyZWY9ImphdmFzY3JpcHQ6c3dpdGNoX2ltZyh0aGlzLmlkKTsiIGlkPSJiYWNrZ3JvdWRfMDIiPjI8L2E+PC9saT4KICAgICAgICAgICAgCTxsaSBjbGFzcz0iYnV0dG9uX2JhY2tncm91ZCI+PGEgaHJlZj0iamF2YXNjcmlwdDpzd2l0Y2hfaW1nKHRoaXMuaWQpOyIgaWQ9ImJhY2tncm91ZF8wMyI+MzwvYT48L2xpPgogICAgICAgICAgICA8L3VsPgogICAgICAgIDwvZGl2PgogICAgICAgIDwhLS0g5Luj56CBIOe7k+adnyAtLT4KCiAgICA8L2Rpdj4KICAgIDxkaXYgY2xhc3M9ImNsZWFyIj48L2Rpdj4KICAgIDxkaXYgY2xhc3M9InNoYWRvdyI+PC9kaXY+CgogICAgPGRpdiBjbGFzcz0iY29udGFpbmVyIj4KICAgICAgICA8ZGl2IGNsYXNzPSJwcm9kdWN0Ij4KICAgICAgICAgICAgPGltZyBzcmM9Imh0dHA6Ly9idXR0ZXJmbHkuY29tL2ltYWdlcy90MS5qcGciPgogICAgICAgICAgICA8ZGl2IGNsYXNzPSJwcm9kdWN0LWwiPgogICAgICAgICAgICAgICAgPGRpdiBjbGFzcz0icHJvZHVjdC1sLXUiPgogICAgICAgICAgICAgICAgICAgIDxwIGNsYXNzPSJ0aXRsZSI+5Lqn5ZOB5pyA5paw6LWE6K6vPHNwYW4+TkVXUzwvc3Bhbj48L3A+CiAgICAgICAgICAgICAgICAgICAgPHVsPgogICAgICAgICAgICAgICAgICAgICAgICA8bGk+PHNwYW4gaWQ9InNwYW5fMSIgY2xhc3M9InNwYW5fdGFnIj4yMDE1LTA0LTE5PC9zcGFuPjxhIGlkPSJhXzEiIGhyZWY9IiMiIGNsYXNzPSJhX3RhZyI+6Ie06J206J2255So5ZOB57uP6ZSA5ZWG44CB6Zu26ZSA5ZSu5Y+K5bm/5aSn5raI6LS56ICFPC9hPjwvbGk+CiAgICAgICAgICAgICAgICAgICAgICAgIDxsaT48c3BhbiBpZD0ic3Bhbl8yIiBjbGFzcz0ic3Bhbl90YWciPjIwMTUtMDMtMjk8L3NwYW4+PGEgaWQ9ImFfMiIgaHJlZj0iIyIgY2xhc3M9ImFfdGFnIj7msLTosLfpm4YtU1VQRVIgWkxD5rW35oqlPC9hPjwvbGk+CiAgICAgICAgICAgICAgICAgICAgICAgIDxsaT48c3BhbiBpZD0ic3Bhbl8zIiBjbGFzcz0ic3Bhbl90YWciPjIwMTUtMDMtMTE8L3NwYW4+PGEgaWQ9ImFfMyIgaHJlZj0iIyIgY2xhc3M9ImFfdGFnIj7onbTonbbmlrDmnZDmlpktLS3kuZLkuZPnkIM8L2E+PC9saT4KICAgICAgICAgICAgICAgICAgICA8L3VsPgogICAgICAgICAgICAgICAgPC9kaXY+CiAgICAgICAgICAgICAgICA8ZGl2IGNsYXNzPSJwcm9kdWN0LWwtZCI+CiAgICAgICAgICAgICAgICAgICAgPHAgY2xhc3M9InRpdGxlIj7mlrDkuqflk4HnibnmgKc8c3Bhbj5OZXcgcHJvZHVjdCBmZWF0dXJlczwvc3Bhbj48L3A+CiAgICAgICAgICAgICAgICAgICAgPHAgY2xhc3M9InByb2R1Y3QtbC1jb24gcF90YWciIGlkPSJwXzEiPuWPsuaWmemmhuWGheaJgOS/neWtmOeahOKAnOS5kuS5k+WZqOadkOKAneaYr+aciee+juWbveeUn+S6p+eahO+8jOebkuebluS4iuiusOi9veedgOWFs+S6juKAnOS5kuS5k+KAneeahOS7i+e7jeOAgumHjOmdouWvueS6juS5kuS5k+eahOagh+mimOS4uuOAjOaWsOeahOahjOS4iui/kOWKqOOAje+8jOW5tuS7peOAjOaYr+S4gOmhuemdnuW4uOaEieW/q+WPiuWBpeW6t+eahOi/kOWKqO+8m+exu+S8vOS6juWupOWklui/m+ihjOeahOe9keeQg+eahOaEn+inieOAjei/m+ihjOivtOaYjuOAgjwvcD4KICAgICAgICAgICAgICAgIDwvZGl2PgogICAgICAgICAgICA8L2Rpdj4KCiAgICAgICAgICAgIDxkaXYgY2xhc3M9InByb2R1Y3QtciI+CiAgICAgICAgICAgICAgICA8dWw+CiAgICAgICAgICAgICAgICAgICAgPGxpPjxkaXYgY2xhc3M9InBpYyI+PGEgaHJlZj0iMTExMTExMTExMTEiIGlkPSJhX2ltZ18xIj48aW1nIGlkPSJpbWdfMSIgY2xhc3M9ImltZyIgc3JjPSJodHRwOi8vYnV0dGVyZmx5LmNvbS91cGxvYWQvZmlsZXMvMjAxNTA1MjQxNjE1MjM2OTYuanBnIiBpbWdfd2lkdGg9IjE4NiIgaW1nX2hlaWdodD0iMTkwIj48L2E+PC9kaXY+PGEgY2xhc3M9InRpdGxlIj48cD7lupXmnb88L3A+QkxBREVTPC9hPjwvbGk+CiAgICAgICAgICAgICAgICAgICAgPGxpPjxkaXYgY2xhc3M9InBpYyI+PGEgaHJlZj0iIzEiIGlkPSJhX2ltZ18yIj48aW1nIGlkPSJpbWdfMiIgY2xhc3M9ImltZyIgc3JjPSJodHRwOi8vYnV0dGVyZmx5LmNvbS9pbWFnZXMvcDIucG5nIiBpbWdfd2lkdGg9IjE4NiIgaW1nX2hlaWdodD0iMTkwIj48L2E+PC9kaXY+PGEgY2xhc3M9InRpdGxlIj48cD7ov5Dliqjpnos8L3A+QVBQQVJFTDwvYT48L2xpPgogICAgICAgICAgICAgICAgICAgIDxsaT48ZGl2IGNsYXNzPSJwaWMiPjxhIGhyZWY9IiMiIGlkPSJhX2ltZ18zIj48aW1nIGlkPSJpbWdfMyIgY2xhc3M9ImltZyIgc3JjPSJodHRwOi8vYnV0dGVyZmx5LmNvbS9pbWFnZXMvcDMucG5nIiBpbWdfd2lkdGg9IjE4NiIgaW1nX2hlaWdodD0iMTkwIj48L2E+PC9kaXY+PGEgY2xhc3M9InRpdGxlIj48cD7ov5DliqjmnI08L3A+U0hJUlQ8L2E+PC9saT4KICAgICAgICAgICAgICAgICAgICA8bGk+PGRpdiBjbGFzcz0icGljIj48YSBocmVmPSIjIiBpZD0iYV9pbWdfNCI+PGltZyBpZD0iaW1nXzQiIGNsYXNzPSJpbWciIHNyYz0iaHR0cDovL2J1dHRlcmZseS5jb20vaW1hZ2VzL3A0LnBuZyIgaW1nX3dpZHRoPSIxODYiIGltZ19oZWlnaHQ9IjE5MCI+PC9hPjwvZGl2PjxhIGNsYXNzPSJ0aXRsZSI+PHA+6L+Q5Yqo5YyFPC9wPkJBRzwvYT48L2xpPgogICAgICAgICAgICAgICAgPC91bD4KICAgICAgICAgICAgPC9kaXY+CiAgICAgICAgPC9kaXY+CiAgICAgICAgPGRpdiBjbGFzcz0iY2xlYXIiPjwvZGl2PgoKICAgICAgICA8ZGl2IGNsYXNzPSJhY3Rpdml0eSI+CiAgICAgICAgICAgIDxpbWcgc3JjPSJodHRwOi8vYnV0dGVyZmx5LmNvbS9pbWFnZXMvdDIuanBnIj4KICAgICAgICAgICAgPGRpdiBjbGFzcz0iYWN0aXZpdHktbCI+CiAgICAgICAgICAgICAgICA8dWw+CiAgICAgICAgICAgICAgICAgICAgPGxpPjxhIGhyZWY9IiMiIGlkPSJhX2ltZ181Ij48aW1nIGlkPSJpbWdfNSIgY2xhc3M9ImltZyIgc3JjPSJodHRwOi8vYnV0dGVyZmx5LmNvbS9pbWFnZXMveDEuanBnIiBpbWdfd2lkdGg9Ijg4IiBpbWdfaGVpZ2h0PSI4OCI+PHAgaWQ9InBfMiIgY2xhc3M9InBfdGFnIj7lqpLkvZPpm4bplKY8L3A+PC9hPjwvbGk+CiAgICAgICAgICAgICAgICAgICAgPGxpPjxhIGhyZWY9IiMiIGlkPSJhX2ltZ182Ij48aW1nIGlkPSJpbWdfNiIgY2xhc3M9ImltZyIgc3JjPSJodHRwOi8vYnV0dGVyZmx5LmNvbS9pbWFnZXMveDIuanBnIiBpbWdfd2lkdGg9Ijg4IiBpbWdfaGVpZ2h0PSI4OCI+PHAgaWQ9InBfMyIgY2xhc3M9InBfdGFnIj7mr4/mnIjmnJ/liIo8L3A+PC9hPjwvbGk+CiAgICAgICAgICAgICAgICAgICAgPGxpPjxhIGhyZWY9IiMiIGlkPSJhX2ltZ183Ij48aW1nIGlkPSJpbWdfNyIgY2xhc3M9ImltZyIgc3JjPSJodHRwOi8vYnV0dGVyZmx5LmNvbS9pbWFnZXMveDMuanBnIiBpbWdfd2lkdGg9Ijg4IiBpbWdfaGVpZ2h0PSI4OCI+PHAgaWQ9InBfNCIgY2xhc3M9InBfdGFnIj7mtLvliqjotZvkuovpooTlkYo8L3A+PC9hPjwvbGk+CiAgICAgICAgICAgICAgICAgICAgPGxpPjxhIGhyZWY9IiMiIGlkPSJhX2ltZ184Ij48aW1nIGlkPSJpbWdfOCIgY2xhc3M9ImltZyIgc3JjPSJodHRwOi8vYnV0dGVyZmx5LmNvbS9pbWFnZXMveDQuanBnIiBpbWdfd2lkdGg9Ijg4IiBpbWdfaGVpZ2h0PSI4OCI+PHAgaWQ9InBfNSIgY2xhc3M9InBfdGFnIj7miavkuIDmias8L3A+PC9hPjwvbGk+CiAgICAgICAgICAgICAgICA8L3VsPgogICAgICAgICAgICA8L2Rpdj4KICAgICAgICAgICAgPGRpdiBjbGFzcz0iYWN0aXZpdHktciI+CiAgICAgICAgICAgICAgICA8ZGl2IGNsYXNzPSJwcm9kdWN0LWwtdSBmbCI+CiAgICAgICAgICAgICAgICAgICAgPHAgY2xhc3M9InRpdGxlIj7mtLvliqjmnIDmlrDotYTorq88c3Bhbj5BY3Rpdml0eSBOZXdzPC9zcGFuPjwvcD4KICAgICAgICAgICAgICAgICAgICA8dWw+CiAgICAgICAgICAgICAgICAgICAgICAgIDxsaT48c3BhbiBpZD0ic3Bhbl80IiBjbGFzcz0ic3Bhbl90YWciPjIwMTUtMDQtMTk8L3NwYW4+PGEgaWQ9ImFfNCIgaHJlZj0iIyIgY2xhc3M9ImFfdGFnIj7oh7TonbTonbbnlKjlk4Hnu488L2E+PC9saT4KICAgICAgICAgICAgICAgICAgICAgICAgPGxpPjxzcGFuIGlkPSJzcGFuXzUiIGNsYXNzPSJzcGFuX3RhZyI+MjAxNS0wMy0yOTwvc3Bhbj48YSBpZD0iYV81IiBocmVmPSIjIiBjbGFzcz0iYV90YWciPuawtOiwt+mbhi1TVVBFUiBaTEPmtbfmiqU8L2E+PC9saT4KICAgICAgICAgICAgICAgICAgICAgICAgPGxpPjxzcGFuIGlkPSJzcGFuXzYiIGNsYXNzPSJzcGFuX3RhZyI+MjAxNS0wMy0xMTwvc3Bhbj48YSBpZD0iYV82IiBocmVmPSIjIiBjbGFzcz0iYV90YWciPuidtOidtuaWsOadkOaWmS0tLeS5kuS5k+eQgzwvYT48L2xpPgogICAgICAgICAgICAgICAgICAgIDwvdWw+CiAgICAgICAgICAgICAgICA8L2Rpdj4KICAgICAgICAgICAgICAgIDxkaXYgY2xhc3M9InByb2R1Y3QtbC1kIGZyIj4KICAgICAgICAgICAgICAgICAgICA8cCBjbGFzcz0idGl0bGUiPua0u+WKqOivpuaDhTxzcGFuPkRldGFpbHMgb2YgdGhlIGV2ZW50PC9zcGFuPjwvcD4KICAgICAgICAgICAgICAgICAgICAgPHAgY2xhc3M9InByb2R1Y3QtbC1jb24gcF90YWciIGlkPSJwXzIiPuWPsuaWmemmhuWGheaJgOS/neWtmOeahOKAnOS5kuS5k+WZqOadkOKAneaYr+aciee+juWbveeUn+S6p+eahO+8jOebkuebluS4iuiusOi9veedgOWFs+S6juKAnOS5kuS5k+KAneeahOS7i+e7jeOAgumHjOmdouWvueS6juS5kuS5k+eahOagh+mimOS4uuOAjOaWsOeahOahjOS4iui/kOWKqOOAje+8jOW5tuS7peOAjOaYr+S4gOmhuemdnuW4uOaEieW/q+WPiuWBpeW6t+eahOi/kOWKqO+8m+exu+S8vOS6juWupOWklui/m+ihjOeahOe9keeQg+eahOaEn+inieOAjei/m+ihjOivtOaYjuOAgjwvcD4KICAgICAgICAgICAgICAgIDwvZGl2PgogICAgICAgICAgICA8L2Rpdj4KICAgICAgICA8L2Rpdj4KICAgICAgICA8ZGl2IGNsYXNzPSJjbGVhciI+PC9kaXY+CgogICAgICAgIDxkaXYgY2xhc3M9ImZvcnlvdSI+CiAgICAgICAgICAgIDxpbWcgc3JjPSJodHRwOi8vYnV0dGVyZmx5LmNvbS9pbWFnZXMvdDMuanBnIj4KICAgICAgICAgICAgPGRpdiBjbGFzcz0iZm9yeW91LWNvbiI+CiAgICAgICAgICAgICAgICA8dWw+CiAgICAgICAgICAgICAgICAgICAgPGxpIGNsYXNzPSJmb3J5b3UtMSI+PGEgaHJlZj0iIyIgaWQ9ImFfaW1nXzkiPjxpbWcgaWQ9ImltZ185IiBjbGFzcz0iaW1nIiBzcmM9Imh0dHA6Ly9idXR0ZXJmbHkuY29tL2ltYWdlcy9mMS5qcGciPjxwPuaZuuiDvemAieaLjTwvcD48L2E+PC9saT4KICAgICAgICAgICAgICAgICAgICA8bGk+PGEgaHJlZj0iIyIgaWQ9ImFfaW1nXzEwIj48aW1nIGlkPSJpbWdfMTAiIGNsYXNzPSJpbWciIHNyYz0iaHR0cDovL2J1dHRlcmZseS5jb20vaW1hZ2VzL2YyLmpwZyI+PHA+6ZmE6L+R55qE57uP6ZSA5ZWGPC9wPjwvYT48L2xpPgogICAgICAgICAgICAgICAgICAgIDxsaT48YSBocmVmPSIjIiBpZD0iYV9pbWdfMTEiPjxpbWcgaWQ9ImltZ18xMSIgY2xhc3M9ImltZyIgc3JjPSJodHRwOi8vYnV0dGVyZmx5LmNvbS9pbWFnZXMvZjMuanBnIj48cD7pgq7ku7borqLpmIU8L3A+PC9hPjwvbGk+CiAgICAgICAgICAgICAgICAgICAgPGxpPjxhIGhyZWY9IiMiIGlkPSJhX2ltZ18xMiI+PGltZyBpZD0iaW1nXzEyIiBjbGFzcz0iaW1nIiBzcmM9Imh0dHA6Ly9idXR0ZXJmbHkuY29tL2ltYWdlcy9mNC5qcGciPjxwPuecn+S8quafpeivojwvcD48L2E+PC9saT4KICAgICAgICAgICAgICAgIDwvdWw+CiAgICAgICAgICAgIDwvZGl2PgogICAgICAgIDwvZGl2PiAgICAgICAgCgogICAgPC9kaXY+CiAgICA8ZGl2IGNsYXNzPSJjbGVhciI+PC9kaXY+CgogICAgPHNjcmlwdCB0eXBlPSJ0ZXh0L2phdmFzY3JpcHQiIHNyYz0iaHR0cDovL2J1dHRlcmZseS5jb20vanMvanF1ZXJ5Lm1pbi5qcz8yMDE1MDMwMSI+PC9zY3JpcHQ+CiAgICA8c2NyaXB0IHR5cGU9InRleHQvamF2YXNjcmlwdCIgc3JjPSJodHRwOi8vYnV0dGVyZmx5LmNvbS9qcy9jb20uanM/MjAxNTAzMDEiPjwvc2NyaXB0PgogICAgPCEtLSAKICAgIDxzY3JpcHQgdHlwZT0idGV4dC9qYXZhc2NyaXB0IiBzcmM9Imh0dHA6Ly9idXR0ZXJmbHkuY29tL2pzL2pxdWVyeS5qc2xpZGVzLmpzPzIwMTUwMzAxIj48L3NjcmlwdD4KICAgICAtLT4KCgoKCgoKCgo8aW5wdXQgaWQ9ImhpZGRlbl90YWciIHR5cGU9ImhpZGRlbiI+CjxpbnB1dCBpZD0iaGlkZGVuX2FfdGFnIiBhX2hyZWY9IiMiIHZhbHVlPSJhX2ltZ18yIiB0eXBlPSJoaWRkZW4iPgo8aW5wdXQgaWQ9ImNvbW1pdF9mbGFnIiB2YWx1ZT0iMCIgdHlwZT0iaGlkZGVuIj4KCgoKCgkKCQk8bWV0YSBjaGFyc2V0PSJ1dGYtOCI+CgkJPGxpbmsgcmVsPSJzdHlsZXNoZWV0IiBocmVmPSIvL2NvZGUuanF1ZXJ5LmNvbS91aS8xLjExLjMvdGhlbWVzL3Ntb290aG5lc3MvanF1ZXJ5LXVpLmNzcyI+CgkJPHNjcmlwdCBzcmM9Ii8vY29kZS5qcXVlcnkuY29tL3VpLzEuMTEuMy9qcXVlcnktdWkuanMiPjwvc2NyaXB0PgoJCgkKCQk8Zm9ybT4KCQkJ', '0', null, '2015-05-25 00:22:14');
INSERT INTO `index_page` VALUES ('1000', 'CiAgICA8ZGl2IGNsYXNzPSJiYW5uZXIiPgogICAgICAgIDwhLS0g5Luj56CBIOW8gOWniyAtLT4KICAgICAgICA8ZGl2IGlkPSJmdWxsLXNjcmVlbi1zbGlkZXIiPgogICAgICAgICAgICA8dWwgaWQ9InNsaWRlcyI+CiAgICAgICAgICAgICAgICA8bGkgc3R5bGU9ImJhY2tncm91bmQ6dXJsKCdodHRwOi8vYnV0dGVyZmx5LmNvbS9pbWFnZXMvYmFubmVyLmpwZycpIiBjbGFzcz0iYmFja2dyb3VuZCIgaWQ9ImJhY2tncm91bmRfaW1nXzAxIj48YSBpZD0iYV9iYWNrZ3JvdW5kX2ltZ18wMSIgaHJlZj0iamF2YXNjcmlwdDphbGVydCgxKTsiPjwvYT48L2xpPgogICAgICAgICAgICAgICAgPGxpIHN0eWxlPSJiYWNrZ3JvdW5kOnVybCgnaHR0cDovL2J1dHRlcmZseS5jb20vaW1hZ2VzL2Jhbm5lcjIuanBnJykiIGNsYXNzPSJiYWNrZ3JvdW5kIiBpZD0iYmFja2dyb3VuZF9pbWdfMDIiPjxhIGlkPSJhX2JhY2tncm91bmRfaW1nXzAyIiBocmVmPSJqYXZhc2NyaXB0OmFsZXJ0KDIpOyI+PC9hPjwvbGk+CiAgICAgICAgICAgICAgICA8bGkgc3R5bGU9ImJhY2tncm91bmQ6dXJsKCdodHRwOi8vYnV0dGVyZmx5LmNvbS9pbWFnZXMvYmFubmVyMS5qcGcnKSIgY2xhc3M9ImJhY2tncm91bmQiIGlkPSJiYWNrZ3JvdW5kX2ltZ18wMyI+PGEgaWQ9ImFfYmFja2dyb3VuZF9pbWdfMDMiIGhyZWY9ImphdmFzY3JpcHQ6YWxlcnQoMyk7Ij48L2E+PC9saT4KICAgICAgICAgICAgPC91bD4KICAgICAgICAgICAgPHVsIGlkPSJwYWdpbmF0aW9uIiBzdHlsZT0ibWFyZ2luLWxlZnQ6IDM5MnB4OyI+CiAgICAgICAgICAgIAk8bGkgY2xhc3M9ImN1cnJlbnQgYnV0dG9uX2JhY2tncm91ZCI+PGEgaHJlZj0iamF2YXNjcmlwdDpzd2l0Y2hfaW1nKHRoaXMuaWQpOyIgaWQ9ImJhY2tncm91ZF8wMSI+MTwvYT48L2xpPgogICAgICAgICAgICAJPGxpIGNsYXNzPSJidXR0b25fYmFja2dyb3VkIj48YSBocmVmPSJqYXZhc2NyaXB0OnN3aXRjaF9pbWcodGhpcy5pZCk7IiBpZD0iYmFja2dyb3VkXzAyIj4yPC9hPjwvbGk+CiAgICAgICAgICAgIAk8bGkgY2xhc3M9ImJ1dHRvbl9iYWNrZ3JvdWQiPjxhIGhyZWY9ImphdmFzY3JpcHQ6c3dpdGNoX2ltZyh0aGlzLmlkKTsiIGlkPSJiYWNrZ3JvdWRfMDMiPjM8L2E+PC9saT4KICAgICAgICAgICAgPC91bD4KICAgICAgICA8L2Rpdj4KICAgICAgICA8IS0tIOS7o+eggSDnu5PmnZ8gLS0+CgogICAgPC9kaXY+CiAgICA8ZGl2IGNsYXNzPSJjbGVhciI+PC9kaXY+CiAgICA8ZGl2IGNsYXNzPSJzaGFkb3ciPjwvZGl2PgoKICAgIDxkaXYgY2xhc3M9ImNvbnRhaW5lciI+CiAgICAgICAgPGRpdiBjbGFzcz0icHJvZHVjdCI+CiAgICAgICAgICAgIDxpbWcgc3JjPSJodHRwOi8vYnV0dGVyZmx5LmNvbS9pbWFnZXMvdDEuanBnIj4KICAgICAgICAgICAgPGRpdiBjbGFzcz0icHJvZHVjdC1sIj4KICAgICAgICAgICAgICAgIDxkaXYgY2xhc3M9InByb2R1Y3QtbC11Ij4KICAgICAgICAgICAgICAgICAgICA8cCBjbGFzcz0idGl0bGUiPuS6p+WTgeacgOaWsOi1hOiurzxzcGFuPk5FV1M8L3NwYW4+PC9wPgogICAgICAgICAgICAgICAgICAgIDx1bD4KICAgICAgICAgICAgICAgICAgICAgICAgPGxpPjxzcGFuIGlkPSJzcGFuXzEiIGNsYXNzPSJzcGFuX3RhZyI+MjAxNS0wNC0xOTwvc3Bhbj48YSBpZD0iYV8xIiBocmVmPSIjIiBjbGFzcz0iYV90YWciPuiHtOidtOidtueUqOWTgee7j+mUgOWVhuOAgembtumUgOWUruWPiuW5v+Wkp+a2iOi0ueiAhTwvYT48L2xpPgogICAgICAgICAgICAgICAgICAgICAgICA8bGk+PHNwYW4gaWQ9InNwYW5fMiIgY2xhc3M9InNwYW5fdGFnIj4yMDE1LTAzLTI5PC9zcGFuPjxhIGlkPSJhXzIiIGhyZWY9IiMiIGNsYXNzPSJhX3RhZyI+5rC06LC36ZuGLVNVUEVSIFpMQ+a1t+aKpTwvYT48L2xpPgogICAgICAgICAgICAgICAgICAgICAgICA8bGk+PHNwYW4gaWQ9InNwYW5fMyIgY2xhc3M9InNwYW5fdGFnIj4yMDE1LTAzLTExPC9zcGFuPjxhIGlkPSJhXzMiIGhyZWY9IiMiIGNsYXNzPSJhX3RhZyI+6J206J225paw5p2Q5paZLS0t5LmS5LmT55CDPC9hPjwvbGk+CiAgICAgICAgICAgICAgICAgICAgPC91bD4KICAgICAgICAgICAgICAgIDwvZGl2PgogICAgICAgICAgICAgICAgPGRpdiBjbGFzcz0icHJvZHVjdC1sLWQiPgogICAgICAgICAgICAgICAgICAgIDxwIGNsYXNzPSJ0aXRsZSI+5paw5Lqn5ZOB54m55oCnPHNwYW4+TmV3IHByb2R1Y3QgZmVhdHVyZXM8L3NwYW4+PC9wPgogICAgICAgICAgICAgICAgICAgIDxwIGNsYXNzPSJwcm9kdWN0LWwtY29uIHBfdGFnIiBpZD0icF8xIj7lj7LmlpnppoblhoXmiYDkv53lrZjnmoTigJzkuZLkuZPlmajmnZDigJ3mmK/mnInnvo7lm73nlJ/kuqfnmoTvvIznm5Lnm5bkuIrorrDovb3nnYDlhbPkuo7igJzkuZLkuZPigJ3nmoTku4vnu43jgILph4zpnaLlr7nkuo7kuZLkuZPnmoTmoIfpopjkuLrjgIzmlrDnmoTmoYzkuIrov5DliqjjgI3vvIzlubbku6XjgIzmmK/kuIDpobnpnZ7luLjmhInlv6vlj4rlgaXlurfnmoTov5DliqjvvJvnsbvkvLzkuo7lrqTlpJbov5vooYznmoTnvZHnkIPnmoTmhJ/op4njgI3ov5vooYzor7TmmI7jgII8L3A+CiAgICAgICAgICAgICAgICA8L2Rpdj4KICAgICAgICAgICAgPC9kaXY+CgogICAgICAgICAgICA8ZGl2IGNsYXNzPSJwcm9kdWN0LXIiPgogICAgICAgICAgICAgICAgPHVsPgogICAgICAgICAgICAgICAgICAgIDxsaT48ZGl2IGNsYXNzPSJwaWMiPjxhIGhyZWY9IiMiIGlkPSJhX2ltZ18xIj48aW1nIGlkPSJpbWdfMSIgY2xhc3M9ImltZyIgc3JjPSJodHRwOi8vYnV0dGVyZmx5LmNvbS9pbWFnZXMvcDEucG5nIiBpbWdfd2lkdGg9IjE4NiIgaW1nX2hlaWdodD0iMTkwIj48L2E+PC9kaXY+PGEgY2xhc3M9InRpdGxlIj48cD7lupXmnb88L3A+QkxBREVTPC9hPjwvbGk+CiAgICAgICAgICAgICAgICAgICAgPGxpPjxkaXYgY2xhc3M9InBpYyI+PGEgaHJlZj0iIyIgaWQ9ImFfaW1nXzIiPjxpbWcgaWQ9ImltZ18yIiBjbGFzcz0iaW1nIiBzcmM9Imh0dHA6Ly9idXR0ZXJmbHkuY29tL2ltYWdlcy9wMi5wbmciIGltZ193aWR0aD0iMTg2IiBpbWdfaGVpZ2h0PSIxOTAiPjwvYT48L2Rpdj48YSBjbGFzcz0idGl0bGUiPjxwPui/kOWKqOmeizwvcD5BUFBBUkVMPC9hPjwvbGk+CiAgICAgICAgICAgICAgICAgICAgPGxpPjxkaXYgY2xhc3M9InBpYyI+PGEgaHJlZj0iIyIgaWQ9ImFfaW1nXzMiPjxpbWcgaWQ9ImltZ18zIiBjbGFzcz0iaW1nIiBzcmM9Imh0dHA6Ly9idXR0ZXJmbHkuY29tL2ltYWdlcy9wMy5wbmciIGltZ193aWR0aD0iMTg2IiBpbWdfaGVpZ2h0PSIxOTAiPjwvYT48L2Rpdj48YSBjbGFzcz0idGl0bGUiPjxwPui/kOWKqOacjTwvcD5TSElSVDwvYT48L2xpPgogICAgICAgICAgICAgICAgICAgIDxsaT48ZGl2IGNsYXNzPSJwaWMiPjxhIGhyZWY9IiMiIGlkPSJhX2ltZ180Ij48aW1nIGlkPSJpbWdfNCIgY2xhc3M9ImltZyIgc3JjPSJodHRwOi8vYnV0dGVyZmx5LmNvbS9pbWFnZXMvcDQucG5nIiBpbWdfd2lkdGg9IjE4NiIgaW1nX2hlaWdodD0iMTkwIj48L2E+PC9kaXY+PGEgY2xhc3M9InRpdGxlIj48cD7ov5DliqjljIU8L3A+QkFHPC9hPjwvbGk+CiAgICAgICAgICAgICAgICA8L3VsPgogICAgICAgICAgICA8L2Rpdj4KICAgICAgICA8L2Rpdj4KICAgICAgICA8ZGl2IGNsYXNzPSJjbGVhciI+PC9kaXY+CgogICAgICAgIDxkaXYgY2xhc3M9ImFjdGl2aXR5Ij4KICAgICAgICAgICAgPGltZyBzcmM9Imh0dHA6Ly9idXR0ZXJmbHkuY29tL2ltYWdlcy90Mi5qcGciPgogICAgICAgICAgICA8ZGl2IGNsYXNzPSJhY3Rpdml0eS1sIj4KICAgICAgICAgICAgICAgIDx1bD4KICAgICAgICAgICAgICAgICAgICA8bGk+PGEgaHJlZj0iIyIgaWQ9ImFfaW1nXzUiPjxpbWcgaWQ9ImltZ181IiBjbGFzcz0iaW1nIiBzcmM9Imh0dHA6Ly9idXR0ZXJmbHkuY29tL2ltYWdlcy94MS5qcGciIGltZ193aWR0aD0iODgiIGltZ19oZWlnaHQ9Ijg4Ij48cCBpZD0icF8yIiBjbGFzcz0icF90YWciPuWqkuS9k+mbhumUpjwvcD48L2E+PC9saT4KICAgICAgICAgICAgICAgICAgICA8bGk+PGEgaHJlZj0iIyIgaWQ9ImFfaW1nXzYiPjxpbWcgaWQ9ImltZ182IiBjbGFzcz0iaW1nIiBzcmM9Imh0dHA6Ly9idXR0ZXJmbHkuY29tL2ltYWdlcy94Mi5qcGciIGltZ193aWR0aD0iODgiIGltZ19oZWlnaHQ9Ijg4Ij48cCBpZD0icF8zIiBjbGFzcz0icF90YWciPuavj+aciOacn+WIijwvcD48L2E+PC9saT4KICAgICAgICAgICAgICAgICAgICA8bGk+PGEgaHJlZj0iIyIgaWQ9ImFfaW1nXzciPjxpbWcgaWQ9ImltZ183IiBjbGFzcz0iaW1nIiBzcmM9Imh0dHA6Ly9idXR0ZXJmbHkuY29tL2ltYWdlcy94My5qcGciIGltZ193aWR0aD0iODgiIGltZ19oZWlnaHQ9Ijg4Ij48cCBpZD0icF80IiBjbGFzcz0icF90YWciPua0u+WKqOi1m+S6i+mihOWRijwvcD48L2E+PC9saT4KICAgICAgICAgICAgICAgICAgICA8bGk+PGEgaHJlZj0iIyIgaWQ9ImFfaW1nXzgiPjxpbWcgaWQ9ImltZ184IiBjbGFzcz0iaW1nIiBzcmM9Imh0dHA6Ly9idXR0ZXJmbHkuY29tL2ltYWdlcy94NC5qcGciIGltZ193aWR0aD0iODgiIGltZ19oZWlnaHQ9Ijg4Ij48cCBpZD0icF81IiBjbGFzcz0icF90YWciPuaJq+S4gOaJqzwvcD48L2E+PC9saT4KICAgICAgICAgICAgICAgIDwvdWw+CiAgICAgICAgICAgIDwvZGl2PgogICAgICAgICAgICA8ZGl2IGNsYXNzPSJhY3Rpdml0eS1yIj4KICAgICAgICAgICAgICAgIDxkaXYgY2xhc3M9InByb2R1Y3QtbC11IGZsIj4KICAgICAgICAgICAgICAgICAgICA8cCBjbGFzcz0idGl0bGUiPua0u+WKqOacgOaWsOi1hOiurzxzcGFuPkFjdGl2aXR5IE5ld3M8L3NwYW4+PC9wPgogICAgICAgICAgICAgICAgICAgIDx1bD4KICAgICAgICAgICAgICAgICAgICAgICAgPGxpPjxzcGFuIGlkPSJzcGFuXzQiIGNsYXNzPSJzcGFuX3RhZyI+MjAxNS0wNC0xOTwvc3Bhbj48YSBpZD0iYV80IiBocmVmPSIjIiBjbGFzcz0iYV90YWciPuiHtOidtOidtueUqOWTgee7jzwvYT48L2xpPgogICAgICAgICAgICAgICAgICAgICAgICA8bGk+PHNwYW4gaWQ9InNwYW5fNSIgY2xhc3M9InNwYW5fdGFnIj4yMDE1LTAzLTI5PC9zcGFuPjxhIGlkPSJhXzUiIGhyZWY9IiMiIGNsYXNzPSJhX3RhZyI+5rC06LC36ZuGLVNVUEVSIFpMQ+a1t+aKpTwvYT48L2xpPgogICAgICAgICAgICAgICAgICAgICAgICA8bGk+PHNwYW4gaWQ9InNwYW5fNiIgY2xhc3M9InNwYW5fdGFnIj4yMDE1LTAzLTExPC9zcGFuPjxhIGlkPSJhXzYiIGhyZWY9IiMiIGNsYXNzPSJhX3RhZyI+6J206J225paw5p2Q5paZLS0t5LmS5LmT55CDPC9hPjwvbGk+CiAgICAgICAgICAgICAgICAgICAgPC91bD4KICAgICAgICAgICAgICAgIDwvZGl2PgogICAgICAgICAgICAgICAgPGRpdiBjbGFzcz0icHJvZHVjdC1sLWQgZnIiPgogICAgICAgICAgICAgICAgICAgIDxwIGNsYXNzPSJ0aXRsZSI+5rS75Yqo6K+m5oOFPHNwYW4+RGV0YWlscyBvZiB0aGUgZXZlbnQ8L3NwYW4+PC9wPgogICAgICAgICAgICAgICAgICAgICA8cCBjbGFzcz0icHJvZHVjdC1sLWNvbiBwX3RhZyIgaWQ9InBfMiI+5Y+y5paZ6aaG5YaF5omA5L+d5a2Y55qE4oCc5LmS5LmT5Zmo5p2Q4oCd5piv5pyJ576O5Zu955Sf5Lqn55qE77yM55uS55uW5LiK6K6w6L29552A5YWz5LqO4oCc5LmS5LmT4oCd55qE5LuL57uN44CC6YeM6Z2i5a+55LqO5LmS5LmT55qE5qCH6aKY5Li644CM5paw55qE5qGM5LiK6L+Q5Yqo44CN77yM5bm25Lul44CM5piv5LiA6aG56Z2e5bi45oSJ5b+r5Y+K5YGl5bq355qE6L+Q5Yqo77yb57G75Ly85LqO5a6k5aSW6L+b6KGM55qE572R55CD55qE5oSf6KeJ44CN6L+b6KGM6K+05piO44CCPC9wPgogICAgICAgICAgICAgICAgPC9kaXY+CiAgICAgICAgICAgIDwvZGl2PgogICAgICAgIDwvZGl2PgogICAgICAgIDxkaXYgY2xhc3M9ImNsZWFyIj48L2Rpdj4KCiAgICAgICAgPGRpdiBjbGFzcz0iZm9yeW91Ij4KICAgICAgICAgICAgPGltZyBzcmM9Imh0dHA6Ly9idXR0ZXJmbHkuY29tL2ltYWdlcy90My5qcGciPgogICAgICAgICAgICA8ZGl2IGNsYXNzPSJmb3J5b3UtY29uIj4KICAgICAgICAgICAgICAgIDx1bD4KICAgICAgICAgICAgICAgICAgICA8bGkgY2xhc3M9ImZvcnlvdS0xIj48YSBocmVmPSIjIiBpZD0iYV9pbWdfOSI+PGltZyBpZD0iaW1nXzkiIGNsYXNzPSJpbWciIHNyYz0iaHR0cDovL2J1dHRlcmZseS5jb20vaW1hZ2VzL2YxLmpwZyI+PHA+5pm66IO96YCJ5ouNPC9wPjwvYT48L2xpPgogICAgICAgICAgICAgICAgICAgIDxsaT48YSBocmVmPSIjIiBpZD0iYV9pbWdfMTAiPjxpbWcgaWQ9ImltZ18xMCIgY2xhc3M9ImltZyIgc3JjPSJodHRwOi8vYnV0dGVyZmx5LmNvbS9pbWFnZXMvZjIuanBnIj48cD7pmYTov5HnmoTnu4/plIDllYY8L3A+PC9hPjwvbGk+CiAgICAgICAgICAgICAgICAgICAgPGxpPjxhIGhyZWY9IiMiIGlkPSJhX2ltZ18xMSI+PGltZyBpZD0iaW1nXzExIiBjbGFzcz0iaW1nIiBzcmM9Imh0dHA6Ly9idXR0ZXJmbHkuY29tL2ltYWdlcy9mMy5qcGciPjxwPumCruS7tuiuoumYhTwvcD48L2E+PC9saT4KICAgICAgICAgICAgICAgICAgICA8bGk+PGEgaHJlZj0iIyIgaWQ9ImFfaW1nXzEyIj48aW1nIGlkPSJpbWdfMTIiIGNsYXNzPSJpbWciIHNyYz0iaHR0cDovL2J1dHRlcmZseS5jb20vaW1hZ2VzL2Y0LmpwZyI+PHA+55yf5Lyq5p+l6K+iPC9wPjwvYT48L2xpPgogICAgICAgICAgICAgICAgPC91bD4KICAgICAgICAgICAgPC9kaXY+CiAgICAgICAgPC9kaXY+ICAgICAgICAKCiAgICA8L2Rpdj4KICAgIDxkaXYgY2xhc3M9ImNsZWFyIj48L2Rpdj4KCiAgICA8c2NyaXB0IHR5cGU9InRleHQvamF2YXNjcmlwdCIgc3JjPSJodHRwOi8vYnV0dGVyZmx5LmNvbS9qcy9qcXVlcnkubWluLmpzPzIwMTUwMzAxIj48L3NjcmlwdD4KICAgIDxzY3JpcHQgdHlwZT0idGV4dC9qYXZhc2NyaXB0IiBzcmM9Imh0dHA6Ly9idXR0ZXJmbHkuY29tL2pzL2NvbS5qcz8yMDE1MDMwMSI+PC9zY3JpcHQ+CiAgICA8IS0tIAogICAgPHNjcmlwdCB0eXBlPSJ0ZXh0L2phdmFzY3JpcHQiIHNyYz0iaHR0cDovL2J1dHRlcmZseS5jb20vanMvanF1ZXJ5LmpzbGlkZXMuanM/MjAxNTAzMDEiPjwvc2NyaXB0PgogICAgIC0tPgoKCgoKCgoKCjxpbnB1dCBpZD0iaGlkZGVuX3RhZyIgdHlwZT0iaGlkZGVuIj4KPGlucHV0IGlkPSJoaWRkZW5fYV90YWciIGFfaHJlZj0iIiB2YWx1ZT0iIiB0eXBlPSJoaWRkZW4iPgo8aW5wdXQgaWQ9ImNvbW1pdF9mbGFnIiB2YWx1ZT0iMCIgdHlwZT0iaGlkZGVuIj4KCgoKCgkKCQk8bWV0YSBjaGFyc2V0PSJ1dGYtOCI+CgkJPGxpbmsgcmVsPSJzdHlsZXNoZWV0IiBocmVmPSIvL2NvZGUuanF1ZXJ5LmNvbS91aS8xLjExLjMvdGhlbWVzL3Ntb290aG5lc3MvanF1ZXJ5LXVpLmNzcyI+CgkJPHNjcmlwdCBzcmM9Ii8vY29kZS5qcXVlcnkuY29tL3VpLzEuMTEuMy9qcXVlcnktdWkuanMiPjwvc2NyaXB0PgoJCgkKCQk8Zm9ybT4KCQkJCgkJPC9mb3JtPgoJCTxkaXYgY2xhc3M9InN1Y2Nlc3MiIGlkPSJyZXNw', '0', null, '2015-05-24 23:54:16');

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
) ENGINE=InnoDB AUTO_INCREMENT=143 DEFAULT CHARSET=utf8;

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
INSERT INTO `log` VALUES ('137', 'manage_player', 'info', '朱征宇编辑球员信息|{\"player_id\":\"13\",\"name\":\"u5f20u7ee7u79d1\",\"continent\":\"1\",\"nationality\":\"u4e2du56fd\",\"birth\":\"1980u5e7410u67081u65e5\",\"zhan_xing\":\"u6253u6cd5\",\"img\":\"/upload/files/20150510162050619.jpg\",\"taojiao\":\"u5957u80f61\",\"diban\":\"u5e95u677f1\",\"achievement\":\"2014:3333333|2013:u8bf4u7684\"}', '2015-05-22 11:40:32', null);
INSERT INTO `log` VALUES ('138', 'manage_player', 'info', '朱征宇编辑球员信息|{\"player_id\":\"13\",\"name\":\"u5f20u7ee7u79d1\",\"continent\":\"2\",\"nationality\":\"u4e2du56fd\",\"birth\":\"180\",\"zhan_xing\":\"u6253u6cd51\",\"img\":\"/upload/files/20150510162050619.jpg\",\"taojiao\":\"u5957u80f61\",\"diban\":\"u5e95u677f1\",\"achievement\":\"2014:3333333|2013:u8bf4u7684\"}', '2015-05-22 11:43:24', null);
INSERT INTO `log` VALUES ('139', 'manage_player', 'info', '朱征宇编辑球员信息|{\"id\":\"13\",\"name\":\"u5f20u7ee7u79d1\",\"continent\":\"u5317u7f8eu6d32\",\"nationality\":\"u4e2du56fd\",\"birth\":\"180\",\"zhan_xing\":\"u6253u6cd51\",\"img\":\"/upload/files/20150510162050619.jpg\",\"taojiao\":\"u5957u80f61\",\"diban\":\"u5e95u677f1\",\"achievement\":\"2014:3333333|2013:u8bf4u7684\"}', '2015-05-22 11:45:56', null);
INSERT INTO `log` VALUES ('140', 'manage_player', 'info', '朱征宇编辑球员信息|{\"id\":\"12\",\"name\":\"u5218u8bd7u96ef\",\"continent\":\"u4e9au6d32\",\"nationality\":\"u4e2du56fd\",\"birth\":\"2015u5e7410u670810u65e5\",\"zhan_xing\":\"u9632u5b88u578b\",\"img\":\"/upload/files/20150510162144864.jpg\",\"taojiao\":\"\",\"diban\":\"\",\"achievement\":\"2014:u963fu4ec0u987fu7b26u6587|2015:u6740u8dccs\"}', '2015-05-22 14:34:53', null);
INSERT INTO `log` VALUES ('141', 'manage_player', 'info', '朱征宇编辑球员信息|{\"id\":\"3\",\"name\":\"u6c34u8c37u51d6\",\"continent\":\"u5357u7f8eu6d32\",\"nationality\":\"u65e5u672c\",\"birth\":\"2013u5e7410u670820u65e5\",\"zhan_xing\":\"u653bu51fbu578b\",\"img\":\"/upload/files/20150510162230377.jpg\",\"taojiao\":\"u5e95u677f3\",\"diban\":\"u5e95u677f2\",\"achievement\":\"2014u5e74:u6c34u7535u8d39u6c61u67d3|2015u5e74:u6740u8dccu5361u5361|2012u5e74:IEu554a\"}', '2015-05-22 14:35:03', null);
INSERT INTO `log` VALUES ('142', 'manage_player', 'info', '朱征宇编辑球员信息|{\"id\":\"2\",\"name\":\"u67f3u627fu654f\",\"continent\":\"u4e9au6d32\",\"nationality\":\"u97e9u56fd\",\"birth\":\"1998-09-10\",\"zhan_xing\":\"u5a03u513f\",\"img\":\"/upload/files/20150510162334232.jpg\",\"taojiao\":\"u5957u80f64\",\"diban\":\"u5e95u677f4\",\"achievement\":\"2013:IEu5723u8bdeu8282\"}', '2015-05-22 14:35:14', null);

-- ----------------------------
-- Table structure for `market_area`
-- ----------------------------
DROP TABLE IF EXISTS `market_area`;
CREATE TABLE `market_area` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `area_name` varchar(20) DEFAULT NULL,
  `is_delete` enum('0','1') DEFAULT '0',
  `create_date` timestamp NULL DEFAULT NULL,
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
  `create_date` timestamp NULL DEFAULT NULL,
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
  `create_date` timestamp NULL DEFAULT NULL,
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
  `create_date` timestamp NULL DEFAULT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

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
INSERT INTO `module` VALUES ('21', '编码管理', 'manage_code.php', '0', '0', null, null);
INSERT INTO `module` VALUES ('22', '产品存货编码', 'manage_code.php?action=product_class_list', '21', '0', null, '2015-05-30 16:11:32');
INSERT INTO `module` VALUES ('23', '防伪码上传', 'manage_code.php?action=validate_code_list', '21', '0', null, '2015-06-01 09:54:06');

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
  `continent` varchar(20) DEFAULT NULL COMMENT '所属大洲',
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
INSERT INTO `player` VALUES ('2', '柳承敏', '亚洲', '韩国', '1998-09-10', '娃儿', '2013:IE圣诞节', '2', '/upload/files/20150510162334232.jpg', '套胶4', '底板4', '0', null, '2015-05-22 14:35:14');
INSERT INTO `player` VALUES ('3', '水谷凖', '南美洲', '日本', '2013年10月20日', '攻击型', '2014年:水电费污染|2015年:杀跌卡卡|2012年:IE啊', null, '/upload/files/20150510162230377.jpg', '底板3', '底板2', '0', '2015-03-19 23:30:16', '2015-05-22 14:35:03');
INSERT INTO `player` VALUES ('12', '刘诗雯', '亚洲', '中国', '2015年10月10日', '防守型', '2014:阿什顿符文|2015:杀跌s', null, '/upload/files/20150510162144864.jpg', '', '', '0', '2015-03-20 00:53:12', '2015-05-22 14:34:52');
INSERT INTO `player` VALUES ('13', '张继科', '北美洲', '中国', '180', '打法1', '2014:3333333|2013:说的', null, '/upload/files/20150510162050619.jpg', '套胶1', '底板1', '0', '2015-03-20 15:51:48', '2015-05-22 11:45:56');

-- ----------------------------
-- Table structure for `product`
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `no` varchar(50) DEFAULT NULL COMMENT '产品编号',
  `name` varchar(50) DEFAULT NULL COMMENT '产品名',
  `price` float(20,0) DEFAULT NULL COMMENT '产品价格',
  `class_id` int(9) DEFAULT NULL COMMENT '产品大类ID号',
  `category_name` varchar(255) DEFAULT NULL COMMENT '产品所属大类名',
  `is_publish` enum('0','1') DEFAULT '0' COMMENT '是否已发布产品标志,0:未发布;1:已发布',
  `is_delete` enum('0','1') DEFAULT '0' COMMENT '是否已删除标志,0:未删除;1:已删除',
  `create_date` datetime DEFAULT NULL COMMENT '数据创建日期',
  `update_date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `no` (`no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product
-- ----------------------------

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
  PRIMARY KEY (`id`),
  UNIQUE KEY `class_name` (`class_name`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product_class
-- ----------------------------
INSERT INTO `product_class` VALUES ('1', '测试1', null, '0', null, null);
INSERT INTO `product_class` VALUES ('11', '正胶', null, '0', null, null);
INSERT INTO `product_class` VALUES ('12', '反胶', null, '0', null, null);
INSERT INTO `product_class` VALUES ('13', '横拍', null, '0', null, null);
INSERT INTO `product_class` VALUES ('14', '直拍', null, '0', null, null);
INSERT INTO `product_class` VALUES ('15', '进口短袖', null, '0', null, null);
INSERT INTO `product_class` VALUES ('16', '进口短裤', null, '0', null, null);
INSERT INTO `product_class` VALUES ('17', '进口包系列', null, '0', null, null);
INSERT INTO `product_class` VALUES ('18', '进口附件', null, '0', null, null);
INSERT INTO `product_class` VALUES ('19', '进口鞋', null, '0', null, null);
INSERT INTO `product_class` VALUES ('20', '球、球台及附件', null, '0', null, null);
INSERT INTO `product_class` VALUES ('21', '国产鞋', null, '0', null, null);
INSERT INTO `product_class` VALUES ('22', '成品拍', null, '0', null, null);
INSERT INTO `product_class` VALUES ('23', '汗巾、头带、护腕', null, '0', null, null);
INSERT INTO `product_class` VALUES ('24', '短袖', null, '0', null, null);
INSERT INTO `product_class` VALUES ('25', '短裤', null, '0', null, null);
INSERT INTO `product_class` VALUES ('26', '套服、上衣', null, '0', null, null);
INSERT INTO `product_class` VALUES ('27', '包系列', null, '0', null, null);
INSERT INTO `product_class` VALUES ('28', '圆领衫', null, '0', null, null);
INSERT INTO `product_class` VALUES ('29', '长裤', null, '0', null, null);
INSERT INTO `product_class` VALUES ('30', '袜子', null, '0', null, null);
INSERT INTO `product_class` VALUES ('31', '附件', null, '0', null, null);
INSERT INTO `product_class` VALUES ('32', '挂件', null, '0', null, null);

-- ----------------------------
-- Table structure for `validate_code`
-- ----------------------------
DROP TABLE IF EXISTS `validate_code`;
CREATE TABLE `validate_code` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `company` varchar(50) DEFAULT NULL,
  `code` varchar(50) DEFAULT NULL,
  `product_no` varchar(50) DEFAULT NULL,
  `state` enum('0','99') DEFAULT '99',
  `query_times` enum('0','1','2','3') DEFAULT '0',
  `is_delete` enum('0','1') DEFAULT '0',
  `date` timestamp NULL DEFAULT NULL,
  `query_date_1` timestamp NULL DEFAULT NULL,
  `query_date_2` timestamp NULL DEFAULT NULL,
  `query_date_3` timestamp NULL DEFAULT NULL,
  `create_date` timestamp NULL DEFAULT NULL,
  `update_date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of validate_code
-- ----------------------------

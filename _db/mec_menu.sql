/*
 Navicat Premium Data Transfer

 Source Server         : mysql local
 Source Server Type    : MySQL
 Source Server Version : 50621
 Source Host           : localhost:3306
 Source Schema         : db_madania_bogor

 Target Server Type    : MySQL
 Target Server Version : 50621
 File Encoding         : 65001

 Date: 12/01/2021 14:59:35
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for mec_menu
-- ----------------------------
DROP TABLE IF EXISTS `mec_menu`;
CREATE TABLE `mec_menu`  (
  `id_menu` int(11) NOT NULL AUTO_INCREMENT,
  `title_menu` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `icon_menu` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `link` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `parentID` int(11) NOT NULL,
  `id_status` int(1) NOT NULL,
  PRIMARY KEY (`id_menu`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of mec_menu
-- ----------------------------
INSERT INTO `mec_menu` VALUES (22, 'Learning Designer', 'fa fa-list', '/learning_designer', 0, 1);
INSERT INTO `mec_menu` VALUES (23, 'Weekly Guide', 'fa fa-file-text', '/w_guide', 0, 1);
INSERT INTO `mec_menu` VALUES (24, 'Assignments', 'fa fa-tasks', '/assign', 0, 1);
INSERT INTO `mec_menu` VALUES (25, 'Base Class', 'fa fa-home', '/base_class', 0, 1);
INSERT INTO `mec_menu` VALUES (26, 'Bukom', 'fa fa-file-sound-o', '/bukom', 0, 1);

SET FOREIGN_KEY_CHECKS = 1;

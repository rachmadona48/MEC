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

 Date: 12/01/2021 14:59:48
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for mec_menu_level
-- ----------------------------
DROP TABLE IF EXISTS `mec_menu_level`;
CREATE TABLE `mec_menu_level`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_level` int(11) NULL DEFAULT NULL,
  `id_menu` int(11) NULL DEFAULT NULL,
  `create` int(2) NOT NULL,
  `update` int(2) NOT NULL,
  `delete` int(2) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 132 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of mec_menu_level
-- ----------------------------
INSERT INTO `mec_menu_level` VALUES (123, 100, 22, 0, 0, 0);
INSERT INTO `mec_menu_level` VALUES (124, 100, 23, 0, 0, 0);
INSERT INTO `mec_menu_level` VALUES (125, 100, 24, 0, 0, 0);
INSERT INTO `mec_menu_level` VALUES (126, 100, 25, 0, 0, 0);
INSERT INTO `mec_menu_level` VALUES (127, 100, 26, 0, 0, 0);
INSERT INTO `mec_menu_level` VALUES (128, 101, 23, 0, 0, 0);
INSERT INTO `mec_menu_level` VALUES (129, 101, 24, 0, 0, 0);
INSERT INTO `mec_menu_level` VALUES (130, 101, 25, 0, 0, 0);
INSERT INTO `mec_menu_level` VALUES (131, 101, 26, 0, 0, 0);

SET FOREIGN_KEY_CHECKS = 1;

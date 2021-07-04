/*
 Navicat Premium Data Transfer

 Source Server         : mysql local
 Source Server Type    : MySQL
 Source Server Version : 50621
 Source Host           : localhost:3306
 Source Schema         : mdn120202021

 Target Server Type    : MySQL
 Target Server Version : 50621
 File Encoding         : 65001

 Date: 25/02/2021 10:47:12
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for mec_mode_delivery
-- ----------------------------
DROP TABLE IF EXISTS `mec_mode_delivery`;
CREATE TABLE `mec_mode_delivery`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `deskripsi` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of mec_mode_delivery
-- ----------------------------
INSERT INTO `mec_mode_delivery` VALUES (1, 'Wholly Online');
INSERT INTO `mec_mode_delivery` VALUES (2, 'Blended');
INSERT INTO `mec_mode_delivery` VALUES (3, 'Classroom-Bassed');
INSERT INTO `mec_mode_delivery` VALUES (4, 'Location-Bassed');
INSERT INTO `mec_mode_delivery` VALUES (5, 'Other');

SET FOREIGN_KEY_CHECKS = 1;

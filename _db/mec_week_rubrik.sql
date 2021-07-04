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

 Date: 03/03/2021 23:06:28
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for mec_week_rubrik
-- ----------------------------
DROP TABLE IF EXISTS `mec_week_rubrik`;
CREATE TABLE `mec_week_rubrik`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_week` int(11) NULL DEFAULT NULL,
  `pelajaran` int(11) NULL DEFAULT NULL,
  `rubrik` int(11) NULL DEFAULT NULL,
  `maks_skor` int(3) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of mec_week_rubrik
-- ----------------------------
INSERT INTO `mec_week_rubrik` VALUES (17, 2741, 1013, 1, 0);
INSERT INTO `mec_week_rubrik` VALUES (18, 2741, 1013, 2, 4);
INSERT INTO `mec_week_rubrik` VALUES (19, 2741, 1013, 3, 4);
INSERT INTO `mec_week_rubrik` VALUES (20, 2741, 1013, 4, 4);
INSERT INTO `mec_week_rubrik` VALUES (21, 2741, 1013, 5, 5);
INSERT INTO `mec_week_rubrik` VALUES (22, 2741, 1013, 6, 5);

SET FOREIGN_KEY_CHECKS = 1;

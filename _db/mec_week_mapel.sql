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

 Date: 27/02/2021 16:52:54
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for mec_week_mapel
-- ----------------------------
DROP TABLE IF EXISTS `mec_week_mapel`;
CREATE TABLE `mec_week_mapel`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_week` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `materi` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of mec_week_mapel
-- ----------------------------
INSERT INTO `mec_week_mapel` VALUES (1, '2741', 'tes materi hhhh');
INSERT INTO `mec_week_mapel` VALUES (2, '2741', 'tes materi lagi vv');

SET FOREIGN_KEY_CHECKS = 1;

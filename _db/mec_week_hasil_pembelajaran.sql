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

 Date: 28/02/2021 14:06:16
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for mec_week_hasil_pembelajaran
-- ----------------------------
DROP TABLE IF EXISTS `mec_week_hasil_pembelajaran`;
CREATE TABLE `mec_week_hasil_pembelajaran`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_week` int(11) NULL DEFAULT NULL,
  `pelajaran` int(11) NULL DEFAULT NULL,
  `indikator` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `tehnik` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `bentuk_instrumen` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `sampel_instrumen` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of mec_week_hasil_pembelajaran
-- ----------------------------
INSERT INTO `mec_week_hasil_pembelajaran` VALUES (1, 2741, 1013, 'tesv', 'rr', 'rr', 'rr');

SET FOREIGN_KEY_CHECKS = 1;

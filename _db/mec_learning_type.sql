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

 Date: 23/04/2021 15:02:52
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for mec_learning_type
-- ----------------------------
DROP TABLE IF EXISTS `mec_learning_type`;
CREATE TABLE `mec_learning_type`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `deskripsi` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of mec_learning_type
-- ----------------------------
INSERT INTO `mec_learning_type` VALUES (1, 'Read Watch Listen');
INSERT INTO `mec_learning_type` VALUES (2, 'Collaborate');
INSERT INTO `mec_learning_type` VALUES (3, 'Discuss');
INSERT INTO `mec_learning_type` VALUES (4, 'Investigate');
INSERT INTO `mec_learning_type` VALUES (5, 'Practice');
INSERT INTO `mec_learning_type` VALUES (6, 'Produce');

SET FOREIGN_KEY_CHECKS = 1;

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

 Date: 17/04/2021 12:25:55
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for mec_interactive_responses
-- ----------------------------
DROP TABLE IF EXISTS `mec_interactive_responses`;
CREATE TABLE `mec_interactive_responses`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_interactive` int(11) NULL DEFAULT NULL,
  `id_question` int(11) NULL DEFAULT NULL,
  `id_answer` int(11) NULL DEFAULT NULL,
  `response` longtext CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `skor` int(11) NULL DEFAULT NULL,
  `true` enum('True','False') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `idResponse` int(255) NULL DEFAULT NULL,
  `datetime` datetime(0) NULL DEFAULT NULL,
  `user` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

SET FOREIGN_KEY_CHECKS = 1;

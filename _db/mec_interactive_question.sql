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

 Date: 09/05/2021 14:16:10
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for mec_interactive_question
-- ----------------------------
DROP TABLE IF EXISTS `mec_interactive_question`;
CREATE TABLE `mec_interactive_question`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_week` int(11) NULL DEFAULT NULL,
  `pelajaran` int(11) NULL DEFAULT NULL,
  `id_interactive` int(11) NULL DEFAULT NULL,
  `name_question` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `type` enum('Text','Option','Matching') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `sort` int(3) NULL DEFAULT NULL,
  `required` enum('Yes','No') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `state` enum('Show','Hide') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of mec_interactive_question
-- ----------------------------
INSERT INTO `mec_interactive_question` VALUES (7, 2741, 1013, 1, 'Sebutkan jenis musim diindonesia!', 'Text', 1, 'Yes', 'Show');
INSERT INTO `mec_interactive_question` VALUES (8, 2741, 1013, 1, 'Siapa nama presiden pertama RI?', 'Option', 2, 'Yes', 'Show');
INSERT INTO `mec_interactive_question` VALUES (9, 2741, 1013, 1, 'tes', 'Text', 3, 'Yes', 'Hide');
INSERT INTO `mec_interactive_question` VALUES (10, 2741, 1013, 1, 'Tentukan perbandingan pertanyaan dan jawaban !', 'Matching', 4, 'Yes', 'Show');

SET FOREIGN_KEY_CHECKS = 1;

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

 Date: 09/05/2021 14:16:22
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for mec_interactive_answers
-- ----------------------------
DROP TABLE IF EXISTS `mec_interactive_answers`;
CREATE TABLE `mec_interactive_answers`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_week` int(11) NULL DEFAULT NULL,
  `pelajaran` int(11) NULL DEFAULT NULL,
  `id_interactive` int(11) NULL DEFAULT NULL,
  `id_question` int(11) NULL DEFAULT NULL,
  `question_matching` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `name_answer` longtext CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `skor` int(3) NULL DEFAULT NULL,
  `true` enum('True','False') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 34 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of mec_interactive_answers
-- ----------------------------
INSERT INTO `mec_interactive_answers` VALUES (1, 2741, 1013, 1, 2, NULL, 'jawaban benar', 25, 'True');
INSERT INTO `mec_interactive_answers` VALUES (2, 2741, 1013, 1, 2, NULL, 'salah', 0, 'False');
INSERT INTO `mec_interactive_answers` VALUES (4, 2741, 1013, 1, 1, NULL, 'tes jawaban lagi', 80, 'True');
INSERT INTO `mec_interactive_answers` VALUES (5, 2741, 1013, 1, 3, NULL, 'salah', 0, 'False');
INSERT INTO `mec_interactive_answers` VALUES (6, 2741, 1013, 1, 3, NULL, 'salah', 0, 'False');
INSERT INTO `mec_interactive_answers` VALUES (7, 2741, 1013, 1, 3, NULL, 'salah', 0, 'False');
INSERT INTO `mec_interactive_answers` VALUES (8, 2741, 1013, 1, 3, NULL, 'benar', 10, 'True');
INSERT INTO `mec_interactive_answers` VALUES (9, 2741, 1013, 1, 4, NULL, 'salah', 0, 'False');
INSERT INTO `mec_interactive_answers` VALUES (10, 2741, 1013, 1, 4, NULL, 'benar tes', 15, 'True');
INSERT INTO `mec_interactive_answers` VALUES (11, 2741, 1013, 1, 4, NULL, 'salah', 0, 'False');
INSERT INTO `mec_interactive_answers` VALUES (12, 2741, 1013, 1, 4, NULL, 'salah', 0, 'False');
INSERT INTO `mec_interactive_answers` VALUES (13, 2741, 1013, 1, 5, NULL, 'salah', 0, 'False');
INSERT INTO `mec_interactive_answers` VALUES (14, 2741, 1013, 1, 5, NULL, 'benar', 15, 'True');
INSERT INTO `mec_interactive_answers` VALUES (15, 2741, 1013, 1, 5, NULL, 'salah', 0, 'False');
INSERT INTO `mec_interactive_answers` VALUES (16, 2741, 1013, 1, 5, NULL, 'salah', 0, 'False');
INSERT INTO `mec_interactive_answers` VALUES (17, 2741, 1013, 1, 6, NULL, 'jawaban selalu benar', 30, 'True');
INSERT INTO `mec_interactive_answers` VALUES (18, 2741, 1013, 1, 7, NULL, 'Panas, hujan', 30, 'True');
INSERT INTO `mec_interactive_answers` VALUES (19, 2741, 1013, 1, 8, NULL, 'Soekarno', 20, 'True');
INSERT INTO `mec_interactive_answers` VALUES (20, 2741, 1013, 1, 8, NULL, 'Soeharto', 0, 'False');
INSERT INTO `mec_interactive_answers` VALUES (21, 2741, 1013, 1, 8, NULL, 'Habibie', 0, 'False');
INSERT INTO `mec_interactive_answers` VALUES (22, 2741, 1013, 1, 8, NULL, 'Joko Widodo', 0, 'False');
INSERT INTO `mec_interactive_answers` VALUES (23, 2741, 1013, 1, 9, NULL, 'tes', 20, 'True');
INSERT INTO `mec_interactive_answers` VALUES (31, 2741, 1013, 1, 10, 'Mobil', 'Roda', 10, 'True');
INSERT INTO `mec_interactive_answers` VALUES (32, 2741, 1013, 1, 10, 'Manusia', 'Kaki', 10, 'True');
INSERT INTO `mec_interactive_answers` VALUES (33, 2741, 1013, 1, 10, 'Burung', 'Sayap', 12, 'True');

SET FOREIGN_KEY_CHECKS = 1;

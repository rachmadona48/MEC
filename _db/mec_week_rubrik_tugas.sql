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

 Date: 28/02/2021 14:52:19
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for mec_week_rubrik_tugas
-- ----------------------------
DROP TABLE IF EXISTS `mec_week_rubrik_tugas`;
CREATE TABLE `mec_week_rubrik_tugas`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_week` int(11) NULL DEFAULT NULL,
  `pelajaran` int(11) NULL DEFAULT NULL,
  `nm_siswa` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `ketepatan` int(2) NULL DEFAULT NULL,
  `skala` int(2) NULL DEFAULT NULL,
  `kerapihan` int(2) NULL DEFAULT NULL,
  `simbol` int(2) NULL DEFAULT NULL,
  `jml_skor` int(3) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of mec_week_rubrik_tugas
-- ----------------------------
INSERT INTO `mec_week_rubrik_tugas` VALUES (1, 2741, 1013, 'Nizam', 4, 4, 4, 4, 4);

SET FOREIGN_KEY_CHECKS = 1;

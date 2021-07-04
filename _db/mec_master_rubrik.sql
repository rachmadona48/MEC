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

 Date: 02/03/2021 13:33:19
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for mec_master_rubrik
-- ----------------------------
DROP TABLE IF EXISTS `mec_master_rubrik`;
CREATE TABLE `mec_master_rubrik`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_parent` int(11) NULL DEFAULT NULL,
  `nama` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of mec_master_rubrik
-- ----------------------------
INSERT INTO `mec_master_rubrik` VALUES (1, NULL, 'Diskusi');
INSERT INTO `mec_master_rubrik` VALUES (2, 1, 'Keaktifan');
INSERT INTO `mec_master_rubrik` VALUES (3, 1, 'Kerjasama');
INSERT INTO `mec_master_rubrik` VALUES (4, 1, 'Presentasi\r\n');
INSERT INTO `mec_master_rubrik` VALUES (5, 1, 'Bertanya\r\n');
INSERT INTO `mec_master_rubrik` VALUES (6, 1, 'Menjawab\r\n');
INSERT INTO `mec_master_rubrik` VALUES (7, NULL, 'Tugas');
INSERT INTO `mec_master_rubrik` VALUES (8, 7, 'Ketepatan\r\n');
INSERT INTO `mec_master_rubrik` VALUES (9, 7, 'Skala\r\n');
INSERT INTO `mec_master_rubrik` VALUES (10, 7, 'Kerapihan\r\n');
INSERT INTO `mec_master_rubrik` VALUES (11, 7, 'Simbol\r\n');

SET FOREIGN_KEY_CHECKS = 1;

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

 Date: 10/03/2021 23:32:43
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for mec_week_kd_indikator
-- ----------------------------
DROP TABLE IF EXISTS `mec_week_kd_indikator`;
CREATE TABLE `mec_week_kd_indikator`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_week` int(11) NULL DEFAULT NULL,
  `pelajaran` int(11) NULL DEFAULT NULL,
  `kompetensi_dasar` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `indikator` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of mec_week_kd_indikator
-- ----------------------------
INSERT INTO `mec_week_kd_indikator` VALUES (1, 2741, 1013, '1.6 Meyakini bahwa perilaku jujur dan adil adalah ajaran pokok agama.', '1.6.1 Meyakini bahwa perilaku jujur dan adil adalah ajaran pokok agama.<div>1.6.2 Meyakini bahwa perilaku jujur dan adil adalah ajaran pokok agama.<br></div>');
INSERT INTO `mec_week_kd_indikator` VALUES (2, 2741, 1013, '2.6 Menunjukkan bacaan al-Qur’an sesuai dengan tajwid', '2.6.1 Menjelaskan Hukum Lam Jalalah dan Ra’ Tafkhim dan Tarqiq di hadapan teman sekelas (PPK-MLP, Communicative)<div>2.6.2 Mengidentifikasi hukum bacaan Hukum Lam Jalalah dan Ra’ Tafkhim dan Tarqiq. (PPK-MLP, Mandiri, Inquirer, Literasi)<br></div>');

SET FOREIGN_KEY_CHECKS = 1;

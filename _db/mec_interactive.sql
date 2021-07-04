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

 Date: 05/05/2021 11:36:44
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for mec_interactive
-- ----------------------------
DROP TABLE IF EXISTS `mec_interactive`;
CREATE TABLE `mec_interactive`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_week` int(11) NOT NULL,
  `pelajaran` int(11) NOT NULL,
  `name` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `type` enum('General','Upload','Canvas') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `file_upload` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `link_canvas` longtext CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `category` enum('Homework','Assignment') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `date_from` date NOT NULL,
  `date_to` date NOT NULL,
  `state` enum('Draft','Publish') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `confirm` datetime(0) NULL DEFAULT NULL,
  `user_create` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `create_date` datetime(0) NULL DEFAULT NULL,
  `user_update` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `update_date` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

SET FOREIGN_KEY_CHECKS = 1;

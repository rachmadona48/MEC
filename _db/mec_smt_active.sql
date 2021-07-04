/*
 Navicat Premium Data Transfer

 Source Server         : mysql local
 Source Server Type    : MySQL
 Source Server Version : 50621
 Source Host           : localhost:3306
 Source Schema         : db_madania_bogor

 Target Server Type    : MySQL
 Target Server Version : 50621
 File Encoding         : 65001

 Date: 12/01/2021 22:45:23
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for mec_smt_active
-- ----------------------------
DROP TABLE IF EXISTS `mec_smt_active`;
CREATE TABLE `mec_smt_active`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kode` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `semester` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of mec_smt_active
-- ----------------------------
INSERT INTO `mec_smt_active` VALUES (1, 'mdn120082009', 'Semester 1 2008/2009');
INSERT INTO `mec_smt_active` VALUES (2, 'mdn220082009', 'Semester 2 2008/2009');
INSERT INTO `mec_smt_active` VALUES (3, 'mdn120092010', 'Semester 1 2009/2010');
INSERT INTO `mec_smt_active` VALUES (4, 'mdn220092010', 'Semester 2 2009/2010');
INSERT INTO `mec_smt_active` VALUES (5, 'mdn120102011', 'Semester 1 2010/2011');
INSERT INTO `mec_smt_active` VALUES (6, 'mdn220102011', 'Semester 2 2010/2011');
INSERT INTO `mec_smt_active` VALUES (7, 'mdn120112012', 'Semester 1 2011/2012');
INSERT INTO `mec_smt_active` VALUES (8, 'mdn220112012', 'Semester 2 2011/2012');
INSERT INTO `mec_smt_active` VALUES (9, 'mdn120122013', 'Semester 1 2012/2013');
INSERT INTO `mec_smt_active` VALUES (10, 'mdn220122013', 'Semester 2 2012/2013');
INSERT INTO `mec_smt_active` VALUES (11, 'mdn120132014', 'Semester 1 2013/2014');
INSERT INTO `mec_smt_active` VALUES (12, 'mdn220132014', 'Semester 2 2013/2014');
INSERT INTO `mec_smt_active` VALUES (13, 'mdn120142015', 'Semester 1 2014/2015');
INSERT INTO `mec_smt_active` VALUES (14, 'mdn220142015', 'Semester 2 2014/2015');
INSERT INTO `mec_smt_active` VALUES (15, 'mdn120152016', 'Semester 1 2015/2016');
INSERT INTO `mec_smt_active` VALUES (16, 'mdn220152016', 'Semester 2 2015/2016');
INSERT INTO `mec_smt_active` VALUES (17, 'mdn120162017', 'Semester 1 2016/2017');
INSERT INTO `mec_smt_active` VALUES (18, 'mdn220162017', 'Semester 2 2016/2017');
INSERT INTO `mec_smt_active` VALUES (19, 'mdn120172018', 'Semester 1 2017/2018');
INSERT INTO `mec_smt_active` VALUES (20, 'mdn220172018', 'Semester 2 2017/2018');
INSERT INTO `mec_smt_active` VALUES (21, 'mdn120182019', 'Semester 1 2018/2019');
INSERT INTO `mec_smt_active` VALUES (22, 'mdn220182019', 'Semester 2 2018/2019');
INSERT INTO `mec_smt_active` VALUES (23, 'mdn120192020', 'Semester 1 2019/2020');
INSERT INTO `mec_smt_active` VALUES (24, 'mdn220192020', 'Semester 2 2019/2020');
INSERT INTO `mec_smt_active` VALUES (25, 'mdn120202021', 'Semester 1 2020/2021');

SET FOREIGN_KEY_CHECKS = 1;

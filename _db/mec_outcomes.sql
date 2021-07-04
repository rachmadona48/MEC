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

 Date: 23/04/2021 15:35:59
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for mec_outcomes
-- ----------------------------
DROP TABLE IF EXISTS `mec_outcomes`;
CREATE TABLE `mec_outcomes`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_parent` int(11) NULL DEFAULT NULL,
  `deskripsi` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 104 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of mec_outcomes
-- ----------------------------
INSERT INTO `mec_outcomes` VALUES (1, NULL, 'Knowledge');
INSERT INTO `mec_outcomes` VALUES (2, NULL, 'Comprehension');
INSERT INTO `mec_outcomes` VALUES (3, NULL, 'Application');
INSERT INTO `mec_outcomes` VALUES (4, NULL, 'Analysis');
INSERT INTO `mec_outcomes` VALUES (5, NULL, 'Synthesis');
INSERT INTO `mec_outcomes` VALUES (6, NULL, 'Evaluation');
INSERT INTO `mec_outcomes` VALUES (7, NULL, 'Affective learning outcomes');
INSERT INTO `mec_outcomes` VALUES (8, NULL, 'Psychomotor skills uncategorised');
INSERT INTO `mec_outcomes` VALUES (9, 1, 'Define');
INSERT INTO `mec_outcomes` VALUES (10, 1, 'Draw');
INSERT INTO `mec_outcomes` VALUES (11, 1, 'Find out/discover');
INSERT INTO `mec_outcomes` VALUES (12, 1, 'Label');
INSERT INTO `mec_outcomes` VALUES (13, 1, 'List');
INSERT INTO `mec_outcomes` VALUES (14, 1, 'Measure');
INSERT INTO `mec_outcomes` VALUES (15, 1, 'Name');
INSERT INTO `mec_outcomes` VALUES (16, 1, 'Pronounce');
INSERT INTO `mec_outcomes` VALUES (17, 1, 'Recall');
INSERT INTO `mec_outcomes` VALUES (18, 1, 'Recite');
INSERT INTO `mec_outcomes` VALUES (19, 1, 'Recognise');
INSERT INTO `mec_outcomes` VALUES (20, 1, 'Reproduce');
INSERT INTO `mec_outcomes` VALUES (21, 1, 'Select');
INSERT INTO `mec_outcomes` VALUES (22, 1, 'Specify');
INSERT INTO `mec_outcomes` VALUES (23, 1, 'State');
INSERT INTO `mec_outcomes` VALUES (24, 2, 'Clarify');
INSERT INTO `mec_outcomes` VALUES (25, 2, 'Classify');
INSERT INTO `mec_outcomes` VALUES (26, 2, 'Contrast');
INSERT INTO `mec_outcomes` VALUES (27, 2, 'Describe reason for');
INSERT INTO `mec_outcomes` VALUES (28, 2, 'Estimate');
INSERT INTO `mec_outcomes` VALUES (29, 2, 'Explain');
INSERT INTO `mec_outcomes` VALUES (30, 2, 'Formulate');
INSERT INTO `mec_outcomes` VALUES (31, 2, 'Identify');
INSERT INTO `mec_outcomes` VALUES (32, 2, 'Identify cause of');
INSERT INTO `mec_outcomes` VALUES (33, 2, 'Illustrate');
INSERT INTO `mec_outcomes` VALUES (34, 2, 'Question');
INSERT INTO `mec_outcomes` VALUES (35, 2, 'Select');
INSERT INTO `mec_outcomes` VALUES (36, 2, 'Summarise');
INSERT INTO `mec_outcomes` VALUES (37, 3, 'Apply');
INSERT INTO `mec_outcomes` VALUES (38, 3, 'Assemble');
INSERT INTO `mec_outcomes` VALUES (39, 3, 'Calculate');
INSERT INTO `mec_outcomes` VALUES (40, 3, 'Choose');
INSERT INTO `mec_outcomes` VALUES (41, 3, 'Compute');
INSERT INTO `mec_outcomes` VALUES (42, 3, 'Construct');
INSERT INTO `mec_outcomes` VALUES (43, 3, 'Demonstrate');
INSERT INTO `mec_outcomes` VALUES (44, 3, 'Find');
INSERT INTO `mec_outcomes` VALUES (45, 3, 'Hypothesise');
INSERT INTO `mec_outcomes` VALUES (46, 3, 'Infer');
INSERT INTO `mec_outcomes` VALUES (47, 3, 'Investigate');
INSERT INTO `mec_outcomes` VALUES (48, 3, 'Modify');
INSERT INTO `mec_outcomes` VALUES (49, 3, 'Operate');
INSERT INTO `mec_outcomes` VALUES (50, 3, 'Predict');
INSERT INTO `mec_outcomes` VALUES (51, 3, 'Prepare');
INSERT INTO `mec_outcomes` VALUES (52, 3, 'Produce');
INSERT INTO `mec_outcomes` VALUES (53, 3, 'Select');
INSERT INTO `mec_outcomes` VALUES (54, 3, 'Solve');
INSERT INTO `mec_outcomes` VALUES (55, 3, 'Translate');
INSERT INTO `mec_outcomes` VALUES (56, 3, 'Use');
INSERT INTO `mec_outcomes` VALUES (57, 3, 'Write');
INSERT INTO `mec_outcomes` VALUES (58, 4, 'Analyse');
INSERT INTO `mec_outcomes` VALUES (59, 4, 'Break Down');
INSERT INTO `mec_outcomes` VALUES (60, 4, 'Compare (and contrast)');
INSERT INTO `mec_outcomes` VALUES (61, 4, 'Critique');
INSERT INTO `mec_outcomes` VALUES (62, 4, 'Differentiate between');
INSERT INTO `mec_outcomes` VALUES (63, 4, 'Distinguish between');
INSERT INTO `mec_outcomes` VALUES (64, 4, 'List component parts of');
INSERT INTO `mec_outcomes` VALUES (65, 4, 'Predict');
INSERT INTO `mec_outcomes` VALUES (66, 4, 'Relate');
INSERT INTO `mec_outcomes` VALUES (67, 4, 'Select');
INSERT INTO `mec_outcomes` VALUES (68, 4, 'Subdivide');
INSERT INTO `mec_outcomes` VALUES (69, 5, 'Argue');
INSERT INTO `mec_outcomes` VALUES (70, 5, 'Combine');
INSERT INTO `mec_outcomes` VALUES (71, 5, 'Compile');
INSERT INTO `mec_outcomes` VALUES (72, 5, 'Compose');
INSERT INTO `mec_outcomes` VALUES (73, 5, 'Conclude');
INSERT INTO `mec_outcomes` VALUES (74, 5, 'Derive');
INSERT INTO `mec_outcomes` VALUES (75, 5, 'Design');
INSERT INTO `mec_outcomes` VALUES (76, 5, 'Explain the reasons for');
INSERT INTO `mec_outcomes` VALUES (77, 5, 'Generalise');
INSERT INTO `mec_outcomes` VALUES (78, 5, 'Generalise');
INSERT INTO `mec_outcomes` VALUES (79, 5, 'Generate');
INSERT INTO `mec_outcomes` VALUES (80, 5, 'Organise');
INSERT INTO `mec_outcomes` VALUES (81, 5, 'Revise');
INSERT INTO `mec_outcomes` VALUES (82, 5, 'Summarise');
INSERT INTO `mec_outcomes` VALUES (83, 6, 'Criticise');
INSERT INTO `mec_outcomes` VALUES (84, 6, 'Defend');
INSERT INTO `mec_outcomes` VALUES (85, 6, 'Evaluate');
INSERT INTO `mec_outcomes` VALUES (86, 6, 'Give argument for and against');
INSERT INTO `mec_outcomes` VALUES (87, 6, 'Give feedack');
INSERT INTO `mec_outcomes` VALUES (88, 6, 'Judge');
INSERT INTO `mec_outcomes` VALUES (89, 6, 'Justify');
INSERT INTO `mec_outcomes` VALUES (90, 6, 'Reflect');
INSERT INTO `mec_outcomes` VALUES (91, 6, 'Support');
INSERT INTO `mec_outcomes` VALUES (92, 7, 'Appreciate');
INSERT INTO `mec_outcomes` VALUES (93, 7, 'Show awareness of');
INSERT INTO `mec_outcomes` VALUES (94, 7, 'Be responsive to');
INSERT INTO `mec_outcomes` VALUES (95, 8, 'Draw');
INSERT INTO `mec_outcomes` VALUES (96, 8, 'Exercise');
INSERT INTO `mec_outcomes` VALUES (97, 8, 'Jump');
INSERT INTO `mec_outcomes` VALUES (98, 8, 'Make');
INSERT INTO `mec_outcomes` VALUES (99, 8, 'Perform');
INSERT INTO `mec_outcomes` VALUES (100, 8, 'Play');
INSERT INTO `mec_outcomes` VALUES (101, 8, 'Run');
INSERT INTO `mec_outcomes` VALUES (102, 8, 'Swim');
INSERT INTO `mec_outcomes` VALUES (103, 8, 'Throw');

SET FOREIGN_KEY_CHECKS = 1;

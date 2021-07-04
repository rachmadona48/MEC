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

 Date: 27/02/2021 23:30:46
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for mec_week_langkah_pembelajaran
-- ----------------------------
DROP TABLE IF EXISTS `mec_week_langkah_pembelajaran`;
CREATE TABLE `mec_week_langkah_pembelajaran`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_week` int(11) NULL DEFAULT NULL,
  `pelajaran` int(11) NULL DEFAULT NULL,
  `kegiatan` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `durasi` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `muatan` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of mec_week_langkah_pembelajaran
-- ----------------------------
INSERT INTO `mec_week_langkah_pembelajaran` VALUES (1, 2741, 1013, '<p class=\"MsoNormal\"><!--[if !supportLists]--><span style=\"font-weight: bold;\"><span style=\"font-family:`Century Gothic`;mso-fareast-font-family:`Times New Roman`;mso-bidi-font-family:Tahoma;\ncolor:rgb(0,0,0);mso-ansi-font-weight:bold;mso-bidi-font-style:italic;\nfont-size:9,0000pt;\">A.&nbsp;</span><!--[endif]--><span style=\"mso-spacerun:`yes`;font-family:`Century Gothic`;mso-fareast-font-family:`Times New Roman`;\nmso-bidi-font-family:Tahoma;color:rgb(0,0,0);mso-ansi-font-weight:bold;\nmso-bidi-font-style:italic;font-size:9,0000pt;\">Pendahuluan: </span></span><b><span style=\"mso-spacerun:`yes`;font-family:`Century Gothic`;mso-fareast-font-family:`Times New Roman`;\nmso-bidi-font-family:Tahoma;color:rgb(0,0,0);mso-ansi-font-weight:bold;\nmso-bidi-font-style:italic;font-size:9,0000pt;\"><o:p></o:p></span></b></p><p class=\"MsoNormal\"><!--[if !supportLists]--><span style=\"font-family:`Century Gothic`;mso-fareast-font-family:`Times New Roman`;mso-bidi-font-family:Verdana;\nfont-size:9,0000pt;\">1. &nbsp;</span><!--[endif]--><span style=\"mso-spacerun:`yes`;font-family:`Century Gothic`;mso-fareast-font-family:`Times New Roman`;\nmso-bidi-font-family:Verdana;font-size:9,0000pt;\">Salam pembuka, dilanjutkan dengan mengecek kehadiran siswa;</span><span style=\"mso-spacerun:`yes`;font-family:`Century Gothic`;mso-fareast-font-family:`Times New Roman`;\nmso-bidi-font-family:Tahoma;mso-bidi-font-weight:bold;mso-bidi-font-style:italic;\nfont-size:9,0000pt;\"><o:p></o:p></span></p><p class=\"MsoNormal\"><!--[if !supportLists]--><span style=\"font-family:`Century Gothic`;mso-fareast-font-family:`Times New Roman`;mso-bidi-font-family:Verdana;\nfont-size:9,0000pt;\">2. &nbsp;</span><!--[endif]--><span style=\"mso-spacerun:`yes`;font-family:`Century Gothic`;mso-fareast-font-family:`Times New Roman`;\nmso-bidi-font-family:Verdana;font-size:9,0000pt;\">Mengondisikan dan memotivasi siswa agar siap dan bersemangat dalam menerima materi yang akan disampaikan;</span><span style=\"mso-spacerun:`yes`;font-family:`Century Gothic`;mso-fareast-font-family:`Times New Roman`;\nmso-bidi-font-family:Tahoma;mso-bidi-font-weight:bold;mso-bidi-font-style:italic;\nfont-size:9,0000pt;\"><o:p></o:p></span></p><p class=\"MsoNormal\"><!--[if !supportLists]--><span style=\"font-family:`Century Gothic`;mso-fareast-font-family:`Times New Roman`;mso-bidi-font-family:Tahoma;\nmso-bidi-font-weight:bold;mso-bidi-font-style:italic;font-size:9,0000pt;\">3. &nbsp;</span><!--[endif]--><span style=\"mso-spacerun:`yes`;font-family:`Century Gothic`;mso-fareast-font-family:`Times New Roman`;\nmso-bidi-font-family:Tahoma;mso-bidi-font-weight:bold;mso-bidi-font-style:italic;\nfont-size:9,0000pt;\">Apersepsi: </span><span style=\"mso-spacerun:`yes`;font-family:`Century Gothic`;mso-fareast-font-family:`Times New Roman`;\nmso-bidi-font-family:`Times New Roman`;font-size:9,0000pt;\">siswa diajak mengaitkan materi yang akan dipelajari dengan pengetahuan yang sudah dimiliki mereka atau dengan peristiwa kekinian;</span><span style=\"mso-spacerun:`yes`;font-family:`Century Gothic`;mso-fareast-font-family:`Times New Roman`;\nmso-bidi-font-family:Tahoma;mso-bidi-font-weight:bold;mso-bidi-font-style:italic;\nfont-size:9,0000pt;\"><o:p></o:p></span></p><p class=\"MsoNormal\"><ul><li><span style=\"mso-spacerun:`yes`;font-family:`Century Gothic`;mso-fareast-font-family:`Times New Roman`;\nmso-bidi-font-family:`Times New Roman`;font-size:9,0000pt;\">Guru menayangkan huruf-huruf hijaiyyah dan menggali pendapat siswa tentang huruf-huruf tersebut</span><span style=\"mso-spacerun:`yes`;font-family:`Century Gothic`;mso-fareast-font-family:`Times New Roman`;\nmso-bidi-font-family:`Times New Roman`;font-size:9,0000pt;\">.</span></li></ul></p><p class=\"MsoNormal\"><!--[if !supportLists]--><span style=\"font-family:`Century Gothic`;mso-fareast-font-family:`Times New Roman`;mso-bidi-font-weight:bold;\nmso-bidi-font-style:italic;font-size:9,0000pt;\">4. &nbsp;</span><!--[endif]--><span style=\"mso-spacerun:`yes`;font-family:`Century Gothic`;mso-fareast-font-family:`Times New Roman`;\nmso-bidi-font-weight:bold;mso-bidi-font-style:italic;font-size:9,0000pt;\">Mengemukakan tujuan pembelajaran/</span><span style=\"mso-spacerun:`yes`;font-family:`Century Gothic`;mso-fareast-font-family:`Times New Roman`;\nmso-bidi-font-family:`Times New Roman`;font-size:9,0000pt;\">kompetensi yang harus dicapai siswa</span><span style=\"mso-spacerun:`yes`;font-family:`Century Gothic`;mso-fareast-font-family:`Times New Roman`;\nmso-bidi-font-family:Tahoma;color:rgb(0,0,0);mso-bidi-font-weight:bold;\nmso-bidi-font-style:italic;font-size:9,0000pt;\"><o:p></o:p></span></p>', '20 menit', '<p class=\"MsoNormal\"><span style=\"mso-spacerun:`yes`;font-family:`Century Gothic`;mso-fareast-font-family:`Times New Roman`;\nmso-bidi-font-family:Tahoma;color:rgb(0,0,0);mso-bidi-font-weight:bold;\nmso-bidi-font-style:italic;font-size:9,0000pt;\">Literasi Media</span><span style=\"mso-spacerun:`yes`;font-family:`Century Gothic`;mso-fareast-font-family:`Times New Roman`;\nmso-bidi-font-family:Tahoma;color:rgb(0,0,0);mso-bidi-font-weight:bold;\nmso-bidi-font-style:italic;font-size:9,0000pt;\"><o:p></o:p></span></p>');

SET FOREIGN_KEY_CHECKS = 1;

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

 Date: 13/01/2021 22:07:57
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for mec_info
-- ----------------------------
DROP TABLE IF EXISTS `mec_info`;
CREATE TABLE `mec_info`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) NULL DEFAULT NULL,
  `kode_grade` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `id_kelas` int(11) NULL DEFAULT NULL,
  `title` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `description` longtext CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `file` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `datetime` datetime(0) NULL DEFAULT NULL,
  `smt_active` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 42 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of mec_info
-- ----------------------------
INSERT INTO `mec_info` VALUES (33, 42947, '02', 19, 'Naik menjadi 76 daerah, berikut update zona merah ', '<p style=\"line-height: 1.5; color: rgb(49, 49, 50); font-family: Roboto; margin-bottom: 0px !important; font-size: 18px !important;\"><strong>KONTAN.CO.ID - </strong>Jakarta. Tren peningkatan kasus positif corona masih berlanjut di Indonesia. Walhasil, daerah berstatus zona merah corona di Indonesia pun kembali meningkat.</p><p style=\"line-height: 1.5; color: rgb(49, 49, 50); font-family: Roboto; margin-bottom: 0px !important; font-size: 18px !important;\">Berdasarkan data Satgas Penanganan Covid-19, hingga Rabu (30/12) ada tambahan 8.002 kasus baru yang terinfeksi corona di Indonesia, sehingga total menjadi 735.124 kasus positif corona</p>', '1609494308.pdf', '2021-01-01 13:16:55', 'mdn120202021');
INSERT INTO `mec_info` VALUES (34, 42947, '02', 19, 'Belajar Tatap Muka Diizinkan Mulai Januari 2021', '<p style=\"font-size: 15px; line-height: 26px;\"><span style=\"font-weight: bold;\">JAKARTA, KOMPAS.com -</span> Menteri Pendidikan dan Kebudayaan (Mendikbud) Nadiem Anwar Makarim mengizinkan kepala derah dan kantor wilayah Kementerian Agama untuk menentukan sendiri pembelajaran tatap muka di wilayahnya. Kebijakan tersebut mulai berlaku pada semester genap tahun ajaran 2020/2021 atau mulai Januari 2021. Maka dari itu, ia meminta sekolah-sekolah mempersiapkan hal itu dengan baik. \"Jadi daerah dan sekolah diharapkan dari sekarang sampai akhir tahun meningkatkan kesiapannya kalau ingin melakukan pembelajaran tatap muka,\" kata Nadiem dalam Pengumuman Penyelenggaraan Pembelajaran Semester Genap TA 2020/2021 di Masa Pandemi Covid-19, Jumat (20/11/2020).</p><p style=\"font-size: 15px; line-height: 26px;\">Nadiem mengatakan, pemberian izin ini bisa saja secara serentak ataupun bertahap tergantung pada kesiapan masing-masing daerah. \"Sesuai dengan diskresi kepala daerahnya berdasarkan evaluasi kepala daerahnya,\" kata Nadiem. \"Mengenai mana yang siap, mana yang tidak, tentunya kesiapan sekolah masing-masing dalam memenuhi semua checklist untuk melakukan tatap muka dan juga melaksanakan protokol kesehatan yang sangat ketat,\" imbuhnya</p>', '1609486682.pdf', '2021-01-01 14:38:02', 'mdn120202021');
INSERT INTO `mec_info` VALUES (39, 42947, '02', 19, 'Ini Syarat Murid Bisa Kembali Belajar di Sekolah Januari 2021 dengan Ketentuan dan Protokol Kesehatan Tertentu', '<p style=\"color: rgb(51, 51, 51); font-family: \"Open Sans\", sans-serif; font-size: 16px;\"><span style=\"font-weight: 700;\">Bobo.id - </span>Tidak terasa, sampai bulan November 2020 ini murid-murid di Indonesia sudah melakukan pembelajaran jarak jauh (PJJ) yang dikenal juga dengan kegiatan belajar dari rumah atau <em>school from home </em>(SFH) selama delapan bulan, alias secara <em>online</em>.</p><p style=\"color: rgb(51, 51, 51); font-family: \"Open Sans\", sans-serif; font-size: 16px;\">Dengan melakukan kegiatan belajar dari rumah, ini artinya murid tidak pergi ke <a href=\"https://bobo.grid.id/tag/sekolah\" style=\"vertical-align: top; color: rgb(0, 174, 239); outline: 0px; transition: color 0.2s ease-in-out 0s; display: inline-block;\">sekolah</a> untuk mengikuti kegiatan belajar mengajar, tapi siswa belajar dari rumah.</p><p style=\"color: rgb(51, 51, 51); font-family: \"Open Sans\", sans-serif; font-size: 16px;\">Kegiatan PJJ ini dilakukan selama masa pandemi COVID-19 untuk mengurangi risiko penularan COVID-19.</p><p style=\"color: rgb(51, 51, 51); font-family: \"Open Sans\", sans-serif; font-size: 16px;\">Cara belajar dari rumah ini ada berbagai macam, mulai dari melalui pembelajaran lewat video, aplikasi <em>video conference, </em>maupun lewat tayangan Belajar dari Rumah yang disiarkan melalaui TVRI.</p><p style=\"color: rgb(51, 51, 51); font-family: \"Open Sans\", sans-serif; font-size: 16px;\">Melihat berbagai perkembangan PJJ selama masa pandemi, maka Menteri Pendidikan dan Kebudayaan mengumumkan kebijakan baru untuk pembelajaran <a href=\"https://bobo.grid.id/tag/semester-genap\" style=\"vertical-align: top; color: rgb(0, 174, 239); outline: 0px; transition: color 0.2s ease-in-out 0s; display: inline-block;\">semester genap</a> untuk <a href=\"https://bobo.grid.id/tag/sekolah\" style=\"vertical-align: top; color: rgb(0, 174, 239); outline: 0px; transition: color 0.2s ease-in-out 0s; display: inline-block;\">sekolah</a>-<a href=\"https://bobo.grid.id/tag/sekolah\" style=\"vertical-align: top; color: rgb(0, 174, 239); outline: 0px; transition: color 0.2s ease-in-out 0s; display: inline-block;\">sekolah</a> di Indonesia, alias pembelajaran <em>offline</em>.</p>', '', '2021-01-01 17:07:44', 'mdn120202021');
INSERT INTO `mec_info` VALUES (40, 42947, '02', 19, 'tes v', '<p>tesvv</p>', '', '2021-01-12 14:52:35', 'mdn120202021');
INSERT INTO `mec_info` VALUES (41, 42947, '02', 19, 'gggg', '<p>ggggggggggg</p>', '', '2021-01-13 22:05:36', 'mdn120202021');

SET FOREIGN_KEY_CHECKS = 1;

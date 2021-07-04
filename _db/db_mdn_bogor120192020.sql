-- phpMyAdmin SQL Dump
-- version 3.4.10.1deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jan 19, 2021 at 04:43 PM
-- Server version: 5.5.54
-- PHP Version: 5.3.10-1ubuntu3.26

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `db_mdn_bogor120192020`
--

-- --------------------------------------------------------

--
-- Table structure for table `comserv_project`
--

CREATE TABLE IF NOT EXISTS `comserv_project` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `tgl_project` date NOT NULL,
  `nama_project` varchar(150) NOT NULL,
  `max_kredit_poin` int(2) NOT NULL,
  `jenis` enum('in','out') NOT NULL,
  `lokasi` varchar(250) NOT NULL,
  `penilai` varchar(100) NOT NULL,
  `nim` varchar(15) NOT NULL,
  `id_kelas` int(5) NOT NULL,
  `kode_grade` varchar(11) NOT NULL,
  `grade` varchar(2) NOT NULL,
  `tgl_penyerahan` date NOT NULL,
  `kredit_poin` int(2) NOT NULL,
  `tgl_catat` datetime NOT NULL,
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `digital_produk`
--

CREATE TABLE IF NOT EXISTS `digital_produk` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_repo_produk` int(11) NOT NULL,
  `id_repo_event` int(11) NOT NULL,
  `nama_file` varchar(250) NOT NULL,
  `event` varchar(250) NOT NULL,
  `keterangan` text NOT NULL,
  `dimensi_w` varchar(15) NOT NULL,
  `dimensi_h` varchar(15) NOT NULL,
  `durasi` int(11) NOT NULL COMMENT 'durasi dalam detik',
  `extension` varchar(10) NOT NULL,
  `type_file` varchar(25) NOT NULL,
  `tanggal` datetime NOT NULL,
  `filesize` varchar(15) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `eks_kriteria`
--

CREATE TABLE IF NOT EXISTS `eks_kriteria` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_subject` int(11) unsigned DEFAULT NULL,
  `kriteria` varchar(30) DEFAULT NULL,
  `urutan` tinyint(3) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `eks_nilai`
--

CREATE TABLE IF NOT EXISTS `eks_nilai` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `nim` varchar(15) DEFAULT NULL,
  `id_subject` int(11) unsigned DEFAULT NULL,
  `n0` char(3) DEFAULT NULL,
  `n1` char(1) DEFAULT NULL,
  `n2` char(1) DEFAULT NULL,
  `n3` char(1) DEFAULT NULL,
  `n4` char(1) DEFAULT NULL,
  `n5` char(1) DEFAULT NULL,
  `n6` char(1) DEFAULT NULL,
  `n7` char(1) DEFAULT NULL,
  `n8` char(1) DEFAULT NULL,
  `n9` char(1) DEFAULT NULL,
  `hadir` tinyint(4) DEFAULT NULL,
  `finger` varchar(10) NOT NULL,
  `is_wajib` enum('Y','N') DEFAULT 'N',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `eks_opsinilai`
--

CREATE TABLE IF NOT EXISTS `eks_opsinilai` (
  `nilai` char(3) NOT NULL,
  `keterangan` varchar(30) NOT NULL,
  PRIMARY KEY (`nilai`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `eks_subject`
--

CREATE TABLE IF NOT EXISTS `eks_subject` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `nama` varchar(50) DEFAULT NULL,
  `guru` varchar(50) DEFAULT NULL,
  `finger` varchar(10) NOT NULL,
  `is_wajib` enum('Y','N') DEFAULT 'N',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `eks_templatenarasi`
--

CREATE TABLE IF NOT EXISTS `eks_templatenarasi` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_subject` int(11) unsigned NOT NULL,
  `nilai` char(3) NOT NULL,
  `template` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `indikator_nilai`
--

CREATE TABLE IF NOT EXISTS `indikator_nilai` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `jenis` enum('p','k','s') DEFAULT NULL COMMENT 'p=pengetahuan, k=keterampilan, s=sikap',
  `kode` varchar(5) DEFAULT NULL,
  `nama_nilai` varchar(50) DEFAULT NULL,
  `persen` float(4,1) DEFAULT NULL,
  `id_jenjang` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=24 ;

--
-- Dumping data for table `indikator_nilai`
--

INSERT INTO `indikator_nilai` (`id`, `jenis`, `kode`, `nama_nilai`, `persen`, `id_jenjang`) VALUES
(1, 'p', 'wa', 'Written Assignment', 40.0, 3),
(2, 'p', 'quiz', 'Quiz', 20.0, 3),
(3, 'p', 'fmt', 'Formative Test', 20.0, 3),
(4, 'p', 'uji', 'Ujian', 20.0, 3),
(5, 'k', 'proj', 'Project', 40.0, 3),
(6, 'k', 'pa', 'Performance Assignment', 40.0, 3),
(7, 'k', 'porto', 'Portofolio', 20.0, 3),
(8, 'p', 'wa', 'Written Assignment', 40.0, 2),
(9, 'p', 'quiz', 'Quiz', 20.0, 2),
(10, 'p', 'fmt', 'Formative Test', 20.0, 2),
(11, 'p', 'uji', 'Ujian', 20.0, 2),
(12, 'k', 'proj', 'Project', 40.0, 2),
(13, 'k', 'pa', 'Performance Assignment', 40.0, 2),
(14, 'k', 'porto', 'Portofolio', 20.0, 2),
(17, 'p', 'wa', 'Written Assignment', 40.0, 1),
(19, 'p', 'fmt', 'Formative Test', 20.0, 1),
(20, 'p', 'uji', 'Ujian', 40.0, 1),
(21, 'k', 'proj', 'Project', 40.0, 1),
(22, 'k', 'pa', 'Performance Assignment', 40.0, 1),
(23, 'k', 'porto', 'Portofolio', 20.0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `indikator_sikap`
--

CREATE TABLE IF NOT EXISTS `indikator_sikap` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `jenis` enum('N','PKN','AGM') DEFAULT NULL,
  `kode` varchar(5) DEFAULT NULL,
  `nama` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=16 ;

--
-- Dumping data for table `indikator_sikap`
--

INSERT INTO `indikator_sikap` (`id`, `jenis`, `kode`, `nama`) VALUES
(1, 'PKN', '1', 'Jujur'),
(2, 'PKN', '2', 'Santun'),
(3, 'PKN', '3', 'Kerja Sama'),
(4, 'PKN', '4', 'Peduli'),
(5, 'PKN', '5', 'Toleransi'),
(6, 'AGM', '1', 'Jujur'),
(7, 'AGM', '2', 'Santun'),
(8, 'AGM', '3', 'Bersyukur'),
(9, 'AGM', '4', 'Toleransi'),
(10, 'AGM', '5', 'Taat Beribadah'),
(11, 'N', '1', 'Jujur'),
(12, 'N', '2', 'Santun'),
(13, 'N', '3', 'Tanggung Jawab'),
(14, 'N', '4', 'Disiplin'),
(15, 'N', '5', 'Percaya Diri');

-- --------------------------------------------------------

--
-- Table structure for table `konfigmdn`
--

CREATE TABLE IF NOT EXISTS `konfigmdn` (
  `properti` varchar(30) NOT NULL,
  `keterangan` varchar(200) DEFAULT NULL,
  `nilai` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`properti`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `konfigmdn`
--

INSERT INTO `konfigmdn` (`properti`, `keterangan`, `nilai`) VALUES
('currentreport', 'posisi report sekarang uts ata', 'uts');

-- --------------------------------------------------------

--
-- Table structure for table `konseling`
--

CREATE TABLE IF NOT EXISTS `konseling` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `nim` varchar(10) DEFAULT NULL,
  `id_kelas` int(11) NOT NULL,
  `kode_grade` varchar(15) NOT NULL,
  `performa` text,
  `perilaku` text,
  `tanggal` date DEFAULT NULL,
  `finger_oleh` varchar(15) NOT NULL,
  `tgl_update` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `konseling_penanganan`
--

CREATE TABLE IF NOT EXISTS `konseling_penanganan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_konseling` int(11) NOT NULL,
  `penanganan` text NOT NULL,
  `tgl_update` datetime NOT NULL,
  `finger_oleh` varchar(15) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `konseling_tag`
--

CREATE TABLE IF NOT EXISTS `konseling_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_konseling` int(11) DEFAULT NULL,
  `id_tag` int(11) DEFAULT NULL,
  `finger_oleh` varchar(15) NOT NULL,
  `tgl_update` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `konseling_tag`
--

INSERT INTO `konseling_tag` (`id`, `id_konseling`, `id_tag`, `finger_oleh`, `tgl_update`) VALUES
(1, 1, 2, '757', '2019-01-07 09:14:13'),
(2, 1, 1, '757', '2019-01-07 09:14:14');

-- --------------------------------------------------------

--
-- Table structure for table `log_nilai`
--

CREATE TABLE IF NOT EXISTS `log_nilai` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `tanggal` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `finger` varchar(5) DEFAULT NULL,
  `perintah` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `log_setup_akademik`
--

CREATE TABLE IF NOT EXISTS `log_setup_akademik` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tanggal` datetime DEFAULT NULL,
  `finger` varchar(15) DEFAULT NULL,
  `jenis` varchar(15) DEFAULT NULL COMMENT 'kepsek, lock, unlock, show, hide, tgl_rapot, kurikulum',
  `perintah` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mapping_jadwal_pelajaran`
--

CREATE TABLE IF NOT EXISTS `mapping_jadwal_pelajaran` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `id_priv_guru_kelas` int(10) DEFAULT NULL,
  `id_jam` int(10) DEFAULT NULL,
  `id_hari` int(10) DEFAULT NULL,
  `id_ruang` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='hasil proses' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mapping_kelas_siswa`
--

CREATE TABLE IF NOT EXISTS `mapping_kelas_siswa` (
  `nim` varchar(15) NOT NULL DEFAULT '',
  `kode_grade` varchar(10) NOT NULL,
  `id_kelas` int(5) DEFAULT NULL,
  `id_jurusan` int(1) DEFAULT NULL,
  `narasi_wali_kelas` text,
  `jml_sakit` tinyint(3) unsigned DEFAULT NULL,
  `jml_ijin` tinyint(3) unsigned DEFAULT NULL,
  `jml_absen` tinyint(3) unsigned DEFAULT NULL,
  `jml_telat` tinyint(3) unsigned DEFAULT NULL,
  `is_naik_kelas` enum('Y','N') DEFAULT 'N',
  `tgl_print` date DEFAULT NULL,
  `tgl_lock` date DEFAULT NULL,
  `catatan_lock` text,
  PRIMARY KEY (`nim`),
  KEY `nim` (`nim`,`kode_grade`,`id_kelas`,`id_jurusan`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mapping_kelas_siswa`
--

INSERT INTO `mapping_kelas_siswa` (`nim`, `kode_grade`, `id_kelas`, `id_jurusan`, `narasi_wali_kelas`, `jml_sakit`, `jml_ijin`, `jml_absen`, `jml_telat`, `is_naik_kelas`, `tgl_print`, `tgl_lock`, `catatan_lock`) VALUES
('18.031', '02', 3, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('18.025', '02', 3, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('18.026', '02', 3, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('18.029', '02', 3, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('18.016', '02', 3, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('18.019', '02', 3, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('18.032', '02', 3, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('18.024', '02', 3, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('18.011', '02', 3, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('18.008', '02', 3, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('18.009', '02', 3, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('18.014', '02', 3, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('18.013', '02', 3, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('18.006', '02', 3, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('18.005', '02', 3, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('18.007', '02', 3, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('18.030', '02', 4, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('18.021', '02', 4, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('18.018', '02', 4, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('18.023', '02', 4, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('18.027', '02', 4, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('18.017', '02', 4, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('18.028', '02', 4, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('18.022', '02', 4, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('18.010', '02', 4, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('18.015', '02', 4, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('18.001', '02', 4, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('18.004', '02', 4, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('18.020', '02', 4, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('18.002', '02', 4, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('18.003', '02', 4, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('17.016', '03', 5, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('17.004', '03', 5, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('17.044', '03', 5, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('17.006', '03', 5, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('17.026', '03', 5, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('17.032', '03', 5, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('17.002', '03', 5, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('17.022', '03', 5, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('17.023', '03', 5, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('17.014', '03', 5, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('17.003', '03', 5, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('17.008', '03', 5, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('17.038', '03', 5, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('17.015', '03', 5, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('17.034', '03', 5, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('17.010', '03', 5, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('17.024', '03', 5, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('17.041', '03', 5, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('17.039', '03', 5, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('17.043', '03', 5, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('17.007', '03', 5, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('17.037', '03', 6, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('17.025', '03', 6, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('17.027', '03', 6, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('17.005', '03', 6, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('17.031', '03', 6, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('17.100', '03', 6, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('17.035', '03', 6, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('17.009', '03', 6, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('17.018', '03', 6, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('17.017', '03', 6, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('17.033', '03', 6, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('17.001', '03', 6, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('17.019', '03', 6, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('17.021', '03', 6, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('17.020', '03', 6, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('17.036', '03', 6, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('17.013', '03', 6, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('17.042', '03', 6, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('17.011', '03', 6, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('17.040', '03', 6, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('16.020', '04', 7, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('16.025', '04', 7, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('16.028', '04', 7, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('16.014', '04', 7, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('16.016', '04', 7, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('16.015', '04', 7, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('16.039', '04', 7, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('16.023', '04', 7, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('16.005', '04', 7, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('16.007', '04', 7, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('16.002', '04', 7, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('16.003', '04', 7, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('16.036', '04', 7, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('16.011', '04', 7, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('16.032', '04', 7, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('16.001', '04', 7, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('16.033', '04', 7, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('16.008', '04', 8, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('16.031', '04', 8, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('16.004', '04', 8, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('17.045', '04', 8, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('16.029', '04', 8, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('16.017', '04', 8, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('16.018', '04', 8, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('16.019', '04', 8, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('16.026', '04', 8, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('16.006', '04', 8, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('16.037', '04', 8, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('16.035', '04', 8, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('16.112', '04', 8, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('16.022', '04', 8, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('16.027', '04', 8, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('16.013', '04', 8, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('16.012', '04', 8, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('16.024', '04', 8, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('15.109', '05', 9, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('16.119', '05', 9, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('15.083', '05', 9, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('15.084', '05', 9, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('18.035', '05', 9, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('15.121', '05', 9, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('15.101', '05', 9, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('15.111', '05', 9, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('15.117', '05', 9, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('15.086', '05', 9, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('15.095', '05', 9, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('15.114', '05', 9, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('15.077', '05', 9, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('15.082', '05', 9, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('15.102', '05', 9, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('17.046', '05', 9, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('15.106', '05', 9, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('15.112', '05', 10, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('15.115', '05', 10, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('15.120', '05', 10, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('15.089', '', 10, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('17.047', '05', 10, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('15.075', '05', 10, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('15.103', '05', 10, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('15.079', '05', 10, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('15.098', '05', 10, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('15.090', '05', 10, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('15.118', '05', 10, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('15.088', '05', 10, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('15.126', '05', 10, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('15.105', '05', 10, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('15.124', '05', 10, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('18.036', '05', 10, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('15.096', '05', 11, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('15.080', '05', 11, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('15.094', '05', 11, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('15.099', '05', 11, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('15.076', '05', 11, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('15.093', '05', 11, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('15.085', '05', 11, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('15.110', '05', 11, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('16.117', '05', 11, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('15.092', '05', 11, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('15.100', '05', 11, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('15.097', '05', 11, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('15.081', '05', 11, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('15.108', '05', 11, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('15.122', '05', 11, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('15.119', '05', 11, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('15.116', '05', 11, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('14.030', '06', 14, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('14.051', '06', 14, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('17.102', '06', 14, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('14.001', '06', 14, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('14.026', '06', 14, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('14.018', '06', 14, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('14.033', '06', 14, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('14.037', '06', 14, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('14.031', '06', 14, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('18.072', '06', 14, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('14.003', '06', 14, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('17.101', '06', 14, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('14.036', '06', 14, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('14.050', '06', 14, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('14.048', '06', 14, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('14.019', '06', 14, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('14.029', '06', 14, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('14.028', '06', 14, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('14.046', '06', 13, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('14.014', '06', 13, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('14.006', '06', 13, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('14.032', '06', 13, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('14.034', '06', 13, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('14.027', '06', 13, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('14.009', '06', 13, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('16.040', '06', 13, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('14.044', '06', 13, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('14.020', '06', 13, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('14.043', '06', 13, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('14.011', '06', 13, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('14.045', '06', 13, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('18.034', '06', 13, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('14.016', '06', 13, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('14.025', '06', 13, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('16.118', '06', 12, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('14.017', '06', 12, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('14.041', '06', 12, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('14.042', '06', 12, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('14.023', '06', 12, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('14.047', '06', 12, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('14.007', '06', 12, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('14.008', '06', 12, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('14.005', '06', 12, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('14.004', '06', 12, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('14.002', '06', 12, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('14.038', '06', 12, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('14.039', '06', 12, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('14.040', '06', 12, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('14.049', '06', 12, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('14.013', '06', 12, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('14.015', '06', 12, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('19.001', '01', 1, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('19.002', '01', 1, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('19.003', '01', 1, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('19.004', '01', 1, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('19.005', '01', 1, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('19.006', '01', 1, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('19.007', '01', 1, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('19.009', '01', 1, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('19.010', '01', 1, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('19.011', '01', 1, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('19.012', '01', 1, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('19.013', '01', 1, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('19.014', '01', 1, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('19.015', '01', 1, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('19.016', '01', 1, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('19.017', '01', 1, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('19.018', '01', 2, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('19.019', '01', 2, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('19.020', '01', 2, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('19.021', '01', 2, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('19.022', '01', 2, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('19.023', '01', 2, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('19.024', '01', 2, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('19.025', '01', 2, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('19.026', '01', 2, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('19.027', '01', 2, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('19.028', '01', 2, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('19.029', '01', 2, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('19.030', '01', 2, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('19.031', '01', 2, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('19.032', '01', 2, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('19.033', '01', 2, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('19.034', '01', 2, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('19.008', '01', 1, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('19.035', '02', 4, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('19.036', '03', 5, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('19.037', '03', 6, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('19.038', '04', 7, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('19.039', '06', 13, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('19.040', '06', 12, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('18.044', '08', 17, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('18.043', '08', 17, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('12.079', '08', 17, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('12.063', '08', 17, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('12.034', '08', 17, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('12.039', '08', 17, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('18.065', '08', 17, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('12.048', '08', 17, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('12.041', '08', 17, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('13.057', '08', 17, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('12.050', '08', 17, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('18.045', '08', 17, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('18.064', '08', 17, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('14.160', '08', 17, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('14.165', '08', 17, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('12.055', '08', 17, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('18.070', '08', 17, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('18.069', '08', 17, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('18.046', '08', 18, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('12.053', '08', 18, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('18.041', '08', 18, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('12.036', '08', 18, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('12.045', '08', 18, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('14.059', '08', 18, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('12.065', '08', 18, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('12.068', '08', 18, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('12.052', '08', 18, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('12.032', '08', 18, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('12.037', '08', 18, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('12.073', '08', 18, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('18.067', '08', 18, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('12.070', '08', 18, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('18.039', '08', 18, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('12.072', '08', 18, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('18.040', '08', 19, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('16.114', '08', 19, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('18.074', '08', 19, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('12.033', '08', 19, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('15.138', '08', 19, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('18.042', '08', 19, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('17.097', '08', 19, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('12.067', '08', 19, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('15.141', '08', 19, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('16.109', '08', 19, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('12.042', '08', 19, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('12.060', '08', 19, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('12.062', '08', 19, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('12.054', '08', 19, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('12.071', '08', 19, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('18.038', '08', 19, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('11.025', '09', 20, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('11.002', '09', 20, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('12.115', '09', 20, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('11.024', '09', 20, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('11.091', '09', 20, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('17.083', '09', 20, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('11.018', '09', 20, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('11.019', '09', 20, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('17.086', '09', 20, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('17.099', '09', 20, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('17.079', '09', 20, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('17.074', '09', 20, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('17.090', '09', 20, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('17.073', '09', 20, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('11.009', '09', 20, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('17.084', '09', 20, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('17.072', '09', 20, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('16.116', '09', 22, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('17.082', '09', 22, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('17.071', '09', 22, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('11.003', '09', 22, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('11.016', '09', 22, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('11.027', '09', 22, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('11.001', '09', 22, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('11.013', '09', 22, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('17.081', '09', 22, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('11.008', '09', 22, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('13.064', '09', 22, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('14.060', '09', 22, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('17.091', '09', 22, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('11.047', '09', 22, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('17.088', '09', 22, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('17.075', '09', 22, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('17.078', '09', 22, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('17.069', '09', 21, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('11.004', '09', 21, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('11.026', '09', 21, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('11.028', '09', 21, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('17.070', '09', 21, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('11.023', '09', 21, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('11.015', '09', 21, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('11.014', '09', 21, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('17.076', '09', 21, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('12.133', '09', 21, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('17.077', '09', 21, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('17.092', '09', 21, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('11.021', '09', 21, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('17.089', '09', 21, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('11.095', '09', 21, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('18.075', '09', 21, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('18.066', '09', 21, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('12.061', '08', 19, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('18.054', '11', 26, 0, '', 0, 0, 0, 0, 'N', NULL, NULL, NULL),
('18.076', '11', 26, 0, '', 0, 0, 0, 0, 'N', NULL, NULL, NULL),
('15.017', '11', 26, 0, '', 0, 0, 0, 0, 'N', NULL, NULL, NULL),
('16.060', '11', 26, 0, '', 0, 0, 0, 0, 'N', NULL, NULL, NULL),
('15.014', '11', 26, 0, '', 0, 0, 0, 0, 'N', NULL, NULL, NULL),
('18.058', '11', 26, 0, '', 0, 0, 0, 0, 'N', NULL, NULL, NULL),
('15.022', '11', 26, 0, '', 0, 0, 0, 0, 'N', NULL, NULL, NULL),
('15.023', '11', 26, 0, '', 0, 0, 0, 0, 'N', NULL, NULL, NULL),
('18.056', '11', 26, 0, '', 0, 0, 0, 0, 'N', NULL, NULL, NULL),
('15.005', '11', 26, 0, '', 0, 0, 0, 0, 'N', NULL, NULL, NULL),
('18.057', '11', 26, 0, '', 0, 4, 4, 4, 'N', NULL, NULL, NULL),
('15.020', '11', 27, 0, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('09.015', '11', 27, 0, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('09.033', '11', 27, 0, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('09.037', '11', 27, 0, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('09.032', '11', 27, 0, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('09.035', '11', 27, 0, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('09.019', '11', 27, 0, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('15.007', '11', 27, 0, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('15.006', '11', 27, 0, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('18.055', '11', 27, 0, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('15.019', '11', 27, 0, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('18.047', '11', 27, 0, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('17.068', '11', 27, 0, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('18.073', '11', 27, 0, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('15.004', '11', 27, 0, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('18.049', '11', 27, 0, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('11.040', '11', 27, 0, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('18.060', '11', 27, 0, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('09.018', '11', 27, 0, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('18.051', '11', 27, 0, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('08.016', '12', 28, 1, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('14.101', '12', 28, 1, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('09.074', '12', 28, 1, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('14.072', '12', 28, 1, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('14.089', '12', 28, 1, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('14.106', '12', 28, 1, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('15.027', '12', 28, 1, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('09.070', '12', 28, 1, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('14.079', '12', 28, 1, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('08.013', '12', 28, 1, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('14.102', '12', 28, 1, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('14.096', '12', 28, 1, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('17.093', '12', 28, 1, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('08.002', '12', 28, 1, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('17.051', '12', 28, 1, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('14.080', '12', 28, 1, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('14.074', '12', 28, 1, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('11.042', '12', 28, 1, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('17.049', '12', 28, 1, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('14.099', '12', 28, 1, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('17.048', '12', 28, 1, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('14.076', '12', 28, 1, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('08.003', '12', 29, 1, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('18.071', '12', 29, 1, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('14.093', '12', 29, 1, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('17.063', '12', 29, 1, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('14.100', '12', 29, 1, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('08.025', '12', 29, 1, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('08.017', '12', 29, 1, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('14.104', '12', 29, 1, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('14.092', '12', 29, 1, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('14.078', '12', 29, 1, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('17.050', '12', 29, 1, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('14.073', '12', 29, 1, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('17.094', '12', 29, 1, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('08.012', '12', 29, 1, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('08.015', '12', 29, 1, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('14.068', '12', 29, 1, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('17.059', '12', 29, 2, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('17.054', '12', 29, 2, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('17.065', '12', 29, 2, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('08.024', '12', 29, 2, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('17.058', '12', 30, 2, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('18.077', '12', 30, 2, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('14.090', '12', 30, 2, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('14.081', '12', 30, 2, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('17.055', '12', 29, 2, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('14.105', '12', 30, 2, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('14.082', '12', 30, 2, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('17.052', '12', 30, 2, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('17.056', '12', 30, 2, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('08.005', '12', 30, 2, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('17.060', '12', 30, 2, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('14.077', '12', 30, 2, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('17.053', '12', 30, 2, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('17.061', '12', 30, 2, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('14.085', '12', 30, 2, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('17.057', '12', 30, 2, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('17.062', '12', 30, 2, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('14.066', '12', 30, 2, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('08.006', '12', 30, 2, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('15.026', '12', 30, 2, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('11.036', '10', 23, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('10.025', '10', 23, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('16.056', '10', 23, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('16.047', '10', 23, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('10.085', '10', 23, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('10.019', '10', 23, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('16.050', '10', 23, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('10.003', '10', 23, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('10.015', '10', 23, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('16.049', '10', 23, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('18.068', '', 1, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('10.002', '10', 24, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('16.052', '10', 24, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('12.142', '10', 24, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('10.018', '10', 24, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('10.023', '10', 24, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('16.044', '10', 24, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('16.043', '10', 25, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('17.066', '10', 25, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('10.008', '10', 25, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('16.054', '10', 25, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('10.006', '10', 25, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('12.116', '10', 25, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('17.098', '10', 25, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('14.164', '10', 25, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('10.020', '10', 25, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('10.010', '10', 25, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('11.034', '10', 25, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('16.059', '10', 25, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('12.136', '10', 25, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('16.055', '10', 25, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('10.053', '10', 25, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('16.057', '10', 25, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('19.041', '10', 23, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('19.042', '10', 23, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('19.043', '10', 23, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('19.044', '10', 23, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('19.045', '10', 23, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('19.046', '10', 23, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('19.053', '10', 24, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('19.052', '10', 24, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('19.051', '10', 24, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('19.050', '10', 24, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('19.049', '10', 24, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('19.048', '10', 24, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('19.047', '10', 24, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('19.054', '10', 25, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('19.055', '10', 25, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('19.056', '10', 25, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('19.057', '10', 25, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('19.058', '10', 24, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('14.053', '07', 15, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('13.008', '07', 15, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('13.009', '07', 15, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('13.052', '07', 15, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('13.019', '07', 15, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('14.052', '07', 15, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('13.023', '07', 15, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('13.013', '07', 15, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('13.051', '07', 15, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('13.053', '07', 15, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('13.034', '07', 15, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('13.050', '07', 15, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('13.020', '07', 15, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('13.014', '07', 15, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('13.012', '07', 15, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('13.016', '07', 15, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('13.032', '07', 16, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('13.040', '07', 16, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('13.027', '07', 16, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('13.005', '07', 16, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('13.047', '07', 16, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('13.001', '07', 16, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('13.045', '07', 16, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('13.029', '07', 16, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('13.017', '07', 16, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('16.113', '07', 16, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('13.021', '07', 16, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('13.038', '07', 16, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('13.042', '07', 16, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('13.044', '07', 16, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('16.041', '07', 16, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('19.060', '07', 15, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('19.059', '10', 25, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('19.061', '07', 16, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('19.062', '07', 16, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('19.063', '07', 16, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('19.064', '07', 16, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('19.066', '07', 15, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('19.067', '07', 15, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('19.068', '07', 16, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('16.104', '14', 32, NULL, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('14.110', '12', 30, 2, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('14.097', '12', 29, 1, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL),
('14.108', '12', 30, 2, NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `mapping_pelajaran_grade`
--

CREATE TABLE IF NOT EXISTS `mapping_pelajaran_grade` (
  `kode` varchar(10) NOT NULL DEFAULT '',
  `id_pelajaran` int(11) DEFAULT NULL,
  `kode_grade` varchar(10) DEFAULT NULL,
  `is_nilai` enum('Y','N') DEFAULT 'Y',
  `is_narasi` enum('Y','N') DEFAULT 'Y',
  `urutan` tinyint(3) unsigned DEFAULT NULL,
  `kkm` float(4,1) DEFAULT NULL,
  `is_elearning` enum('Y','N') DEFAULT 'Y',
  `bahasa` enum('ina','eng','INA','ENG') DEFAULT 'ina',
  `us` enum('Y','N') DEFAULT 'N',
  `un` enum('Y','N') DEFAULT 'N',
  `bawaan` varchar(25) DEFAULT NULL,
  `total_jam` int(11) NOT NULL,
  PRIMARY KEY (`kode`),
  KEY `kode` (`kode`,`id_pelajaran`,`kode_grade`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mapping_pelajaran_grade`
--

INSERT INTO `mapping_pelajaran_grade` (`kode`, `id_pelajaran`, `kode_grade`, `is_nilai`, `is_narasi`, `urutan`, `kkm`, `is_elearning`, `bahasa`, `us`, `un`, `bawaan`, `total_jam`) VALUES
('011', 1, '01', 'Y', 'Y', 1, 75.0, 'Y', 'ina', 'N', 'N', 'agama:1', 0),
('012', 2, '01', 'N', 'N', 2, 75.0, 'N', 'ina', 'N', 'N', 'non:non', 0),
('1', 1, '', 'Y', 'Y', 1, 75.0, 'Y', 'ina', 'N', 'N', 'agama:1', 0),
('071', 1, '07', 'Y', 'Y', 1, 76.0, 'Y', 'ina', 'N', 'N', 'agama:1', 0),
('021', 1, '02', 'Y', 'Y', 1, 75.0, 'Y', 'ina', 'N', '', 'agama:1', 0),
('031', 1, '03', 'Y', 'Y', 1, 75.0, 'Y', 'ina', 'N', 'N', 'agama:1', 0),
('041', 1, '04', 'Y', 'Y', 1, 75.0, 'Y', 'ina', 'N', 'N', 'agama:1', 0),
('051', 1, '05', 'Y', 'Y', 1, 75.0, 'Y', 'ina', 'N', 'N', 'agama:1', 0),
('061', 1, '06', 'Y', 'Y', 1, 75.0, 'Y', 'ina', 'N', 'N', 'agama:1', 0),
('072', 2, '07', 'N', 'N', 2, 75.0, 'N', 'ina', 'N', 'N', 'non:non', 0),
('118', 8, '11', 'Y', 'Y', 8, 76.0, 'Y', 'ina', 'Y', '', 'umum:umum', 0),
('081', 1, '08', 'Y', 'Y', 1, 75.0, 'Y', 'ina', 'N', 'N', 'agama:1', 0),
('091', 1, '09', 'Y', 'Y', 1, 75.0, 'Y', 'ina', 'N', 'N', 'agama:1', 0),
('101', 1, '10', 'Y', 'Y', 1, 75.0, 'Y', 'ina', 'N', 'N', 'agama:1', 0),
('111', 1, '11', 'Y', 'Y', 1, 76.0, 'Y', 'ina', 'N', 'N', 'agama:1', 0),
('121', 1, '12', 'Y', 'Y', 1, 75.0, 'Y', 'ina', 'N', 'N', 'agama:1', 0),
('0732', 32, '07', 'Y', 'Y', 32, 75.0, 'Y', 'ina', 'N', 'N', 'umum:umum', 0),
('079', 9, '07', 'Y', 'Y', 9, 76.0, 'Y', 'ina', 'N', '', 'aktif:aktif', 0),
('0920', 20, '09', 'Y', 'Y', 20, 75.0, 'Y', 'ina', 'N', 'N', 'aktif:aktif', 0),
('0720', 20, '07', 'Y', 'Y', 20, 76.0, 'Y', 'eng', 'N', 'N', 'umum:umum', 0),
('0721', 21, '07', 'Y', 'Y', 21, 76.0, 'Y', 'eng', 'N', 'N', 'umum:umum', 0),
('0916', 16, '09', 'Y', 'Y', 16, 75.0, 'Y', 'eng', 'N', '', 'umum:umum', 0),
('0917', 17, '09', 'Y', 'Y', 17, 75.0, 'Y', 'ina', 'N', 'N', 'umum:umum', 0),
('0716', 16, '07', 'Y', 'Y', 16, 76.0, 'Y', 'eng', 'N', 'N', 'aktif:aktif', 0),
('0821', 21, '08', 'Y', 'Y', 21, 75.0, 'Y', 'ina', 'N', 'N', 'aktif:aktif', 0),
('0717', 17, '07', 'Y', 'Y', 17, 76.0, 'Y', 'eng', 'N', 'N', 'aktif:aktif', 0),
('0127', 27, '01', 'Y', 'Y', 27, 75.0, 'Y', 'ina', 'N', 'N', 'aktif:aktif', 0),
('0130', 30, '01', 'Y', 'Y', 30, 75.0, 'Y', 'ina', 'N', 'N', 'umum:umum', 0),
('022', 2, '02', 'Y', 'Y', 2, 75.0, 'Y', 'ina', 'N', 'N', 'agama:3', 0),
('0927', 27, '09', 'Y', 'Y', 27, 75.0, 'Y', 'ina', 'N', 'N', 'umum:umum', 0),
('0928', 28, '09', 'Y', 'Y', 28, 75.0, 'Y', 'ina', 'N', 'N', 'umum:umum', 0),
('034', 4, '03', 'Y', 'Y', 4, 75.0, 'Y', 'ina', 'N', 'N', 'agama:4', 0),
('036', 6, '03', 'Y', 'Y', 6, 75.0, 'Y', 'ina', 'N', 'N', 'agama:6', 0),
('044', 4, '04', 'Y', 'Y', 4, 75.0, 'Y', 'ina', 'N', 'N', 'agama:4', 0),
('017', 7, '01', 'Y', 'Y', 7, 75.0, 'Y', 'ina', 'N', 'N', 'umum:umum', 0),
('018', 8, '01', 'Y', 'Y', 8, 75.0, 'Y', 'ina', 'N', 'N', 'umum:umum', 0),
('037', 7, '03', 'Y', 'Y', 7, 75.0, 'Y', 'ina', 'N', 'N', 'umum:umum', 0),
('019', 9, '01', 'Y', 'Y', 9, 75.0, 'Y', 'ina', 'N', 'N', 'umum:umum', 0),
('038', 8, '03', 'Y', 'Y', 8, 75.0, 'Y', 'ina', 'N', 'N', 'umum:umum', 0),
('0115', 15, '01', 'Y', 'Y', 15, 75.0, 'Y', 'ina', 'N', 'N', 'umum:umum', 0),
('0124', 24, '01', 'Y', 'Y', 24, 75.0, 'Y', 'ina', 'N', 'N', 'umum:umum', 0),
('0125', 25, '01', 'Y', 'Y', 25, 75.0, 'Y', 'ina', 'N', 'N', 'umum:umum', 0),
('0126', 26, '01', 'Y', 'Y', 26, 75.0, 'Y', 'ina', 'N', 'N', 'umum:umum', 0),
('119', 9, '11', 'Y', 'Y', 9, 76.0, 'Y', 'eng', 'Y', '', 'umum:umum', 0),
('1115', 15, '11', 'Y', 'Y', 15, 76.0, 'Y', 'eng', 'Y', '', 'umum:umum', 0),
('1116', 16, '11', 'Y', 'Y', 16, 76.0, 'Y', 'eng', 'Y', '', 'aktif:aktif', 0),
('1117', 17, '11', 'Y', 'Y', 17, 76.0, 'Y', 'eng', 'Y', '', 'aktif:aktif', 0),
('1123', 23, '11', 'Y', 'Y', 23, 76.0, 'Y', 'eng', 'Y', 'N', 'umum:umum', 0),
('1134', 34, '11', 'N', 'N', 34, 76.0, 'N', 'ina', 'N', 'N', 'non:non', 0),
('128', 8, '12', 'Y', 'Y', 8, 76.0, 'Y', 'ina', 'Y', '', 'umum:umum', 0),
('129', 9, '12', 'Y', 'Y', 9, 76.0, 'Y', 'eng', 'Y', '', 'umum:umum', 0),
('127', 7, '12', 'Y', 'Y', 7, 76.0, 'Y', 'ina', 'Y', 'N', 'umum:umum', 0),
('1215', 15, '12', 'Y', 'Y', 15, 76.0, 'Y', 'eng', 'Y', '', 'umum:umum', 0),
('1216', 16, '12', 'Y', 'Y', 16, 76.0, 'Y', 'eng', 'Y', '', 'aktif:aktif', 0),
('1217', 17, '12', 'Y', 'Y', 17, 76.0, 'Y', 'eng', 'Y', '', 'aktif:aktif', 0),
('1242', 42, '12', 'Y', 'Y', 42, 76.0, 'Y', 'eng', 'Y', '', 'aktif:aktif', 0),
('1243', 43, '12', 'Y', 'Y', 43, 75.0, 'Y', 'ina', 'Y', '', 'aktif:aktif', 0),
('117', 7, '11', 'Y', 'Y', 7, 76.0, 'Y', 'ina', 'Y', 'N', 'umum:umum', 0),
('1142', 42, '11', 'Y', 'Y', 42, 76.0, 'Y', 'eng', 'Y', '', 'aktif:aktif', 0),
('1143', 43, '11', 'Y', 'Y', 43, 76.0, 'Y', 'ina', 'Y', '', 'aktif:aktif', 0),
('1147', 47, '11', 'Y', 'Y', 47, 76.0, 'Y', 'eng', 'Y', '', 'aktif:aktif', 0),
('1157', 57, '11', 'Y', 'Y', 57, 76.0, 'Y', 'ina', 'N', 'N', 'aktif:aktif', 0),
('1158', 58, '11', 'Y', 'Y', 58, 76.0, 'Y', 'ina', 'Y', 'N', 'umum:umum', 0),
('1159', 59, '11', 'Y', 'Y', 59, 76.0, 'Y', 'ina', 'Y', 'N', 'aktif:aktif', 0),
('1176', 76, '11', 'Y', 'Y', 76, 76.0, 'Y', 'eng', 'Y', '', 'aktif:aktif', 0),
('1276', 76, '12', 'Y', 'Y', 76, 76.0, 'Y', 'eng', 'Y', '', 'aktif:aktif', 0),
('1258', 58, '12', 'Y', 'Y', 58, 75.0, 'Y', 'ina', 'Y', 'N', 'aktif:aktif', 0),
('1257', 57, '12', 'Y', 'Y', 57, 76.0, 'Y', 'ina', 'Y', 'N', 'aktif:aktif', 0),
('1247', 47, '12', 'Y', 'Y', 47, 76.0, 'Y', 'eng', 'Y', '', 'aktif:aktif', 0),
('013', 3, '01', 'Y', 'Y', 3, 75.0, 'Y', 'ina', 'N', 'N', 'agama:2', 0),
('023', 3, '02', 'Y', 'Y', 3, 75.0, 'Y', 'ina', 'N', 'N', 'agama:2', 0),
('024', 4, '02', 'Y', 'Y', 4, 75.0, 'Y', 'ina', 'N', 'N', 'agama:4', 0),
('025', 5, '02', 'Y', 'Y', 5, 75.0, 'Y', 'ina', 'N', 'N', 'agama:5', 0),
('032', 2, '03', 'Y', 'Y', 2, 75.0, 'Y', 'ina', 'N', 'N', 'agama:3', 0),
('052', 2, '05', 'Y', 'Y', 2, 75.0, 'Y', 'ina', 'N', 'N', 'agama:3', 0),
('062', 2, '06', 'Y', 'Y', 2, 75.0, 'Y', 'ina', 'N', 'N', 'agama:3', 0),
('053', 3, '05', 'Y', 'Y', 3, 75.0, 'Y', 'ina', 'N', 'N', 'agama:2', 0),
('054', 4, '05', 'Y', 'Y', 4, 75.0, 'Y', 'ina', 'N', 'N', 'agama:4', 0),
('055', 5, '05', 'Y', 'Y', 5, 75.0, 'Y', 'ina', 'N', 'N', 'agama:5', 0),
('063', 3, '06', 'Y', 'Y', 3, 75.0, 'Y', 'ina', 'N', 'N', 'agama:2', 0),
('075', 5, '07', 'Y', 'Y', 5, 75.0, 'Y', 'ina', 'N', 'N', 'agama:5', 0),
('073', 3, '07', 'Y', 'Y', 3, 75.0, 'Y', 'ina', 'N', 'N', 'agama:2', 0),
('084', 4, '08', 'Y', 'Y', 4, 75.0, 'Y', 'ina', 'N', 'N', 'agama:4', 0),
('083', 3, '08', 'Y', 'Y', 3, 75.0, 'Y', 'ina', 'N', 'N', 'agama:2', 0),
('085', 5, '08', 'Y', 'Y', 5, 75.0, 'Y', 'ina', 'N', 'N', 'agama:5', 0),
('082', 2, '08', 'Y', 'Y', 2, 75.0, 'Y', 'ina', 'N', 'N', 'agama:3', 0),
('086', 6, '08', 'Y', 'Y', 6, 75.0, 'Y', 'ina', 'N', 'N', 'agama:6', 0),
('092', 2, '09', 'Y', 'Y', 2, 75.0, 'Y', 'ina', 'N', 'N', 'agama:3', 0),
('095', 5, '09', 'Y', 'Y', 5, 75.0, 'Y', 'ina', 'N', 'N', 'agama:5', 0),
('094', 4, '09', 'Y', 'Y', 4, 75.0, 'Y', 'ina', 'N', 'N', 'agama:4', 0),
('093', 3, '09', 'Y', 'Y', 3, 75.0, 'Y', 'ina', 'N', 'N', 'agama:2', 0),
('096', 6, '09', 'Y', 'Y', 6, 75.0, 'Y', 'ina', 'N', 'N', 'agama:6', 0),
('102', 2, '10', 'Y', 'Y', 2, 75.0, 'Y', 'ina', 'N', 'N', 'agama:3', 0),
('103', 3, '10', 'Y', 'Y', 3, 75.0, 'Y', 'ina', 'N', 'N', 'agama:2', 0),
('114', 4, '11', 'Y', 'Y', 4, 75.0, 'Y', 'ina', 'N', 'N', 'agama:4', 0),
('112', 2, '11', 'Y', 'Y', 2, 75.0, 'Y', 'ina', 'N', 'N', 'agama:3', 0),
('124', 4, '12', 'Y', 'Y', 4, 75.0, 'Y', 'ina', 'N', 'N', 'agama:4', 0),
('125', 5, '12', 'Y', 'Y', 5, 75.0, 'Y', 'ina', 'N', 'N', 'agama:5', 0),
('123', 3, '12', 'Y', 'Y', 3, 75.0, 'Y', 'ina', 'N', 'N', 'agama:2', 0),
('077', 7, '07', 'Y', 'Y', 7, 76.0, 'Y', 'ina', 'N', 'N', 'umum:umum', 0),
('078', 8, '07', 'Y', 'Y', 8, 76.0, 'Y', 'ina', 'N', 'N', 'umum:umum', 0),
('0713', 13, '07', 'Y', 'Y', 13, 76.0, 'Y', 'ina', 'N', 'N', 'aktif:aktif', 0),
('0714', 14, '07', 'Y', 'Y', 14, 76.0, 'Y', 'ina', 'N', 'N', 'aktif:aktif', 0),
('0715', 15, '07', 'Y', 'Y', 15, 76.0, 'Y', 'eng', 'N', 'N', 'umum:umum', 0),
('0723', 23, '07', 'Y', 'Y', 23, 76.0, 'Y', 'eng', 'N', 'N', 'umum:umum', 0),
('0760', 60, '07', 'Y', 'Y', 60, 76.0, 'Y', 'ina', 'N', 'N', 'umum:umum', 0),
('0761', 61, '07', 'Y', 'Y', 61, 76.0, 'Y', 'ina', 'N', 'N', 'aktif:aktif', 0),
('0762', 62, '07', 'Y', 'Y', 62, 76.0, 'Y', 'ina', 'N', 'N', 'aktif:aktif', 0),
('087', 7, '08', 'Y', 'Y', 7, 76.0, 'Y', 'ina', 'N', 'N', 'umum:umum', 0),
('088', 8, '08', 'Y', 'Y', 8, 76.0, 'Y', 'ina', 'N', 'N', 'umum:umum', 0),
('089', 9, '08', 'Y', 'Y', 9, 76.0, 'Y', 'eng', 'N', 'N', 'umum:umum', 0),
('0813', 13, '08', 'Y', 'Y', 13, 76.0, 'Y', 'ina', 'N', 'N', 'aktif:aktif', 0),
('0814', 14, '08', 'Y', 'Y', 14, 76.0, 'Y', 'ina', 'N', 'N', 'aktif:aktif', 0),
('0815', 15, '08', 'Y', 'Y', 15, 76.0, 'Y', 'eng', 'N', 'N', 'umum:umum', 0),
('0816', 16, '08', 'Y', 'Y', 16, 76.0, 'Y', 'eng', 'N', 'N', 'umum:umum', 0),
('0817', 17, '08', 'Y', 'Y', 17, 75.0, 'Y', 'ina', 'N', 'N', 'umum:umum', 0);

-- --------------------------------------------------------

--
-- Table structure for table `new_pelanggaran_siswa`
--

CREATE TABLE IF NOT EXISTS `new_pelanggaran_siswa` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nim` varchar(10) NOT NULL,
  `id_pelanggaran` int(11) NOT NULL,
  `pelanggaran` varchar(100) NOT NULL,
  `tanggal` date NOT NULL,
  `ke` int(11) NOT NULL,
  `id_tindakan` int(11) NOT NULL,
  `tindakan` varchar(100) NOT NULL,
  `finger` varchar(5) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `nilai_ib`
--

CREATE TABLE IF NOT EXISTS `nilai_ib` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `nim` varchar(15) DEFAULT NULL,
  `id_ib` int(11) unsigned DEFAULT NULL,
  `indicator` char(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `nilai_log`
--

CREATE TABLE IF NOT EXISTS `nilai_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `finger` varchar(10) NOT NULL,
  `perintah` text NOT NULL,
  `tanggal` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `pelajaran_ib`
--

CREATE TABLE IF NOT EXISTS `pelajaran_ib` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_induk` int(11) unsigned DEFAULT NULL,
  `pelajaran` varchar(10) DEFAULT NULL,
  `nama` varchar(250) DEFAULT NULL,
  `no_scope` tinyint(3) unsigned DEFAULT NULL,
  `no_sequence` tinyint(3) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `pelajaran_nilai`
--

CREATE TABLE IF NOT EXISTS `pelajaran_nilai` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `nim` varchar(15) DEFAULT NULL,
  `kode_pelajaran` varchar(10) DEFAULT NULL,
  `kode_grade` varchar(10) DEFAULT NULL,
  `id_pelajaran` int(10) DEFAULT NULL,
  `wa_uts` float(4,1) DEFAULT NULL,
  `quiz_uts` float(4,1) DEFAULT NULL,
  `fmt_uts` float(4,1) DEFAULT NULL,
  `uji_uts` float(4,1) DEFAULT NULL,
  `pea_uts` float(4,1) DEFAULT NULL,
  `n_p_uts` float(4,1) DEFAULT NULL COMMENT 'kumulatif nilai pengetahuan',
  `wa_uas` float(4,1) NOT NULL,
  `quiz_uas` float(4,1) NOT NULL,
  `fmt_uas` float(4,1) NOT NULL,
  `uji_uas` float(4,1) NOT NULL,
  `pea_uas` float(4,1) DEFAULT NULL,
  `n_p_uas` float(4,1) DEFAULT NULL COMMENT 'kumultif nilai pengetahuan',
  `proj_uts` float(4,1) DEFAULT NULL,
  `pa_uts` float(4,1) DEFAULT NULL,
  `porto_uts` float(4,1) DEFAULT NULL,
  `kea_uts` float(4,1) DEFAULT NULL,
  `n_k_uts` float(4,1) DEFAULT NULL COMMENT 'kumulatif nilai keterampilan',
  `proj_uas` float(4,1) DEFAULT NULL,
  `pa_uas` float(4,1) DEFAULT NULL,
  `porto_uas` float(4,1) DEFAULT NULL,
  `kea_uas` float(4,1) DEFAULT NULL,
  `n_k_uas` float(4,1) DEFAULT NULL COMMENT 'kumulatif nilai keterampilan',
  `na_uts` float(4,1) DEFAULT NULL,
  `na_uas` float(4,1) DEFAULT NULL,
  `tanggal` datetime DEFAULT NULL,
  `mutup_uts` varchar(5) DEFAULT NULL,
  `mutup_uas` varchar(5) DEFAULT NULL,
  `mutuk_uts` varchar(5) DEFAULT NULL,
  `mutuk_uas` varchar(5) DEFAULT NULL,
  `narasi_p_uas` text,
  `narasi_k_uas` text,
  `us_pengetahuan` float(4,1) NOT NULL,
  `us_praktek` float(4,1) NOT NULL,
  `us_na` float(4,1) NOT NULL,
  `finger` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `nim` (`nim`,`kode_pelajaran`,`kode_grade`,`id_pelajaran`,`finger`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2244 ;

--
-- Dumping data for table `pelajaran_nilai`
--

INSERT INTO `pelajaran_nilai` (`id`, `nim`, `kode_pelajaran`, `kode_grade`, `id_pelajaran`, `wa_uts`, `quiz_uts`, `fmt_uts`, `uji_uts`, `pea_uts`, `n_p_uts`, `wa_uas`, `quiz_uas`, `fmt_uas`, `uji_uas`, `pea_uas`, `n_p_uas`, `proj_uts`, `pa_uts`, `porto_uts`, `kea_uts`, `n_k_uts`, `proj_uas`, `pa_uas`, `porto_uas`, `kea_uas`, `n_k_uas`, `na_uts`, `na_uas`, `tanggal`, `mutup_uts`, `mutup_uas`, `mutuk_uts`, `mutuk_uas`, `narasi_p_uas`, `narasi_k_uas`, `us_pengetahuan`, `us_praktek`, `us_na`, `finger`) VALUES
(1, '14.053', '0732', '07', 32, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(2, '14.053', '0720', '07', 20, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(3, '13.008', '0732', '07', 32, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(4, '13.008', '0720', '07', 20, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(5, '13.009', '0732', '07', 32, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(6, '13.009', '0720', '07', 20, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(7, '13.052', '0732', '07', 32, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(8, '13.052', '0720', '07', 20, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(9, '13.019', '0732', '07', 32, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(10, '13.019', '0720', '07', 20, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(11, '14.052', '0732', '07', 32, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(12, '14.052', '0720', '07', 20, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(13, '13.023', '0732', '07', 32, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(14, '13.023', '0720', '07', 20, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(15, '13.013', '0732', '07', 32, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(16, '13.013', '0720', '07', 20, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(17, '13.051', '0732', '07', 32, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(18, '13.051', '0720', '07', 20, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(19, '13.053', '0732', '07', 32, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(20, '13.053', '0720', '07', 20, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(21, '13.034', '0732', '07', 32, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(22, '13.034', '0720', '07', 20, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(23, '13.050', '0732', '07', 32, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(24, '13.050', '0720', '07', 20, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(25, '13.020', '0732', '07', 32, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(26, '13.020', '0720', '07', 20, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(27, '13.014', '0732', '07', 32, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(28, '13.014', '0720', '07', 20, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(29, '13.012', '0732', '07', 32, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(30, '13.012', '0720', '07', 20, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(31, '13.016', '0732', '07', 32, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(32, '13.016', '0720', '07', 20, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(33, '13.032', '0732', '07', 32, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(34, '13.032', '0720', '07', 20, 0.0, 0.0, 0.0, 0.0, NULL, 0.0, 0.0, 0.0, 0.0, 0.0, NULL, 0.0, 0.0, 0.0, 0.0, NULL, 0.0, 0.0, 0.0, 0.0, NULL, 0.0, NULL, NULL, '2019-07-11 01:36:43', 'D', 'D', 'D', 'D', NULL, NULL, 0.0, 0.0, 0.0, NULL),
(35, '13.040', '0732', '07', 32, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(36, '13.040', '0720', '07', 20, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(37, '13.027', '0732', '07', 32, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(38, '13.027', '0720', '07', 20, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(39, '13.005', '0732', '07', 32, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(40, '13.005', '0720', '07', 20, 0.0, 0.0, 0.0, 0.0, NULL, 0.0, 0.0, 0.0, 0.0, 0.0, NULL, 0.0, 0.0, 0.0, 0.0, NULL, 0.0, 0.0, 0.0, 0.0, NULL, 0.0, NULL, NULL, '2019-07-11 01:36:43', 'D', 'D', 'D', 'D', NULL, NULL, 0.0, 0.0, 0.0, NULL),
(41, '13.047', '0732', '07', 32, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(42, '13.047', '0720', '07', 20, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(43, '13.001', '0732', '07', 32, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(44, '13.001', '0720', '07', 20, 0.0, 0.0, 0.0, 0.0, NULL, 0.0, 0.0, 0.0, 0.0, 0.0, NULL, 0.0, 0.0, 0.0, 0.0, NULL, 0.0, 0.0, 0.0, 0.0, NULL, 0.0, NULL, NULL, '2019-07-11 01:36:43', 'D', 'D', 'D', 'D', NULL, NULL, 0.0, 0.0, 0.0, NULL),
(45, '13.045', '0732', '07', 32, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(46, '13.045', '0720', '07', 20, 0.0, 0.0, 0.0, 0.0, NULL, 0.0, 0.0, 0.0, 0.0, 0.0, NULL, 0.0, 0.0, 0.0, 0.0, NULL, 0.0, 0.0, 0.0, 0.0, NULL, 0.0, NULL, NULL, '2019-07-11 01:36:43', 'D', 'D', 'D', 'D', NULL, NULL, 0.0, 0.0, 0.0, NULL),
(47, '13.029', '0732', '07', 32, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(48, '13.029', '0720', '07', 20, 0.0, 0.0, 0.0, 0.0, NULL, 0.0, 0.0, 0.0, 0.0, 0.0, NULL, 0.0, 0.0, 0.0, 0.0, NULL, 0.0, 0.0, 0.0, 0.0, NULL, 0.0, NULL, NULL, '2019-07-11 01:36:43', 'D', 'D', 'D', 'D', NULL, NULL, 0.0, 0.0, 0.0, NULL),
(49, '13.017', '0732', '07', 32, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(50, '13.017', '0720', '07', 20, 0.0, 0.0, 0.0, 0.0, NULL, 0.0, 0.0, 0.0, 0.0, 0.0, NULL, 0.0, 0.0, 0.0, 0.0, NULL, 0.0, 0.0, 0.0, 0.0, NULL, 0.0, NULL, NULL, '2019-07-11 01:36:43', 'D', 'D', 'D', 'D', NULL, NULL, 0.0, 0.0, 0.0, NULL),
(51, '16.113', '0732', '07', 32, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(52, '16.113', '0720', '07', 20, 0.0, 0.0, 0.0, 0.0, NULL, 0.0, 0.0, 0.0, 0.0, 0.0, NULL, 0.0, 0.0, 0.0, 0.0, NULL, 0.0, 0.0, 0.0, 0.0, NULL, 0.0, NULL, NULL, '2019-07-11 01:36:43', 'D', 'D', 'D', 'D', NULL, NULL, 0.0, 0.0, 0.0, NULL),
(53, '13.021', '0732', '07', 32, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(54, '13.021', '0720', '07', 20, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(55, '13.038', '0732', '07', 32, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(56, '13.038', '0720', '07', 20, 0.0, 0.0, 0.0, 0.0, NULL, 0.0, 0.0, 0.0, 0.0, 0.0, NULL, 0.0, 0.0, 0.0, 0.0, NULL, 0.0, 0.0, 0.0, 0.0, NULL, 0.0, NULL, NULL, '2019-07-11 01:36:43', 'D', 'D', 'D', 'D', NULL, NULL, 0.0, 0.0, 0.0, NULL),
(57, '13.042', '0732', '07', 32, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(58, '13.042', '0720', '07', 20, 0.0, 0.0, 0.0, 0.0, NULL, 0.0, 0.0, 0.0, 0.0, 0.0, NULL, 0.0, 0.0, 0.0, 0.0, NULL, 0.0, 0.0, 0.0, 0.0, NULL, 0.0, NULL, NULL, '2019-07-11 01:36:43', 'D', 'D', 'D', 'D', NULL, NULL, 0.0, 0.0, 0.0, NULL),
(59, '13.044', '0732', '07', 32, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(60, '13.044', '0720', '07', 20, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(61, '16.041', '0732', '07', 32, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(62, '16.041', '0720', '07', 20, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(63, '19.060', '0732', '07', 32, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(64, '19.060', '0720', '07', 20, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(65, '19.061', '0732', '07', 32, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(66, '19.061', '0720', '07', 20, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(67, '19.062', '0732', '07', 32, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(68, '19.062', '0720', '07', 20, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(69, '19.063', '0732', '07', 32, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(70, '19.063', '0720', '07', 20, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(71, '19.064', '0732', '07', 32, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(72, '19.064', '0720', '07', 20, 0.0, 0.0, 0.0, 0.0, NULL, 0.0, 0.0, 0.0, 0.0, 0.0, NULL, 0.0, 0.0, 0.0, 0.0, NULL, 0.0, 0.0, 0.0, 0.0, NULL, 0.0, NULL, NULL, '2019-07-11 01:36:43', 'D', 'D', 'D', 'D', NULL, NULL, 0.0, 0.0, 0.0, NULL),
(73, '19.066', '0732', '07', 32, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(74, '19.066', '0720', '07', 20, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(75, '19.067', '0732', '07', 32, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(76, '19.067', '0720', '07', 20, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(77, '19.068', '0732', '07', 32, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(78, '19.068', '0720', '07', 20, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(79, '', '', '03', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(80, '17.034', '', '03', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(81, '', '034', '03', 4, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1401, '17.016', '031', '03', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(83, '', '036', '03', 6, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(84, '17.034', '036', '03', 6, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(85, '17.016', '037', '03', 7, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(86, '17.016', '038', '03', 8, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(87, '17.004', '037', '03', 7, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(88, '17.004', '038', '03', 8, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(89, '17.044', '037', '03', 7, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(90, '17.044', '038', '03', 8, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(91, '17.006', '037', '03', 7, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(92, '17.006', '038', '03', 8, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(93, '17.026', '037', '03', 7, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(94, '17.026', '038', '03', 8, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(95, '17.032', '037', '03', 7, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(96, '17.032', '038', '03', 8, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(97, '17.002', '037', '03', 7, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(98, '17.002', '038', '03', 8, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(99, '17.022', '037', '03', 7, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(100, '17.022', '038', '03', 8, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(101, '17.023', '037', '03', 7, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(102, '17.023', '038', '03', 8, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(103, '17.014', '037', '03', 7, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(104, '17.014', '038', '03', 8, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(105, '17.003', '037', '03', 7, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(106, '17.003', '038', '03', 8, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(107, '17.008', '037', '03', 7, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(108, '17.008', '038', '03', 8, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(109, '17.038', '037', '03', 7, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(110, '17.038', '038', '03', 8, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(111, '17.015', '037', '03', 7, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(112, '17.015', '038', '03', 8, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(113, '17.034', '037', '03', 7, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(114, '17.034', '038', '03', 8, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(115, '17.010', '037', '03', 7, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(116, '17.010', '038', '03', 8, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(117, '17.024', '037', '03', 7, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(118, '17.024', '038', '03', 8, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(119, '17.041', '037', '03', 7, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(120, '17.041', '038', '03', 8, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(121, '17.039', '037', '03', 7, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(122, '17.039', '038', '03', 8, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(123, '17.043', '037', '03', 7, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(124, '17.043', '038', '03', 8, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(125, '17.007', '037', '03', 7, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(126, '17.007', '038', '03', 8, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(127, '17.037', '037', '03', 7, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(128, '17.037', '038', '03', 8, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(129, '17.025', '037', '03', 7, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(130, '17.025', '038', '03', 8, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(131, '17.027', '037', '03', 7, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(132, '17.027', '038', '03', 8, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(133, '17.005', '037', '03', 7, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(134, '17.005', '038', '03', 8, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(135, '17.031', '037', '03', 7, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(136, '17.031', '038', '03', 8, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(137, '17.100', '037', '03', 7, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(138, '17.100', '038', '03', 8, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(139, '17.035', '037', '03', 7, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(140, '17.035', '038', '03', 8, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(141, '17.009', '037', '03', 7, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(142, '17.009', '038', '03', 8, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(143, '17.018', '037', '03', 7, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(144, '17.018', '038', '03', 8, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(145, '17.017', '037', '03', 7, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(146, '17.017', '038', '03', 8, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(147, '17.033', '037', '03', 7, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(148, '17.033', '038', '03', 8, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(149, '17.001', '037', '03', 7, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(150, '17.001', '038', '03', 8, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(151, '17.019', '037', '03', 7, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(152, '17.019', '038', '03', 8, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(153, '17.021', '037', '03', 7, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(154, '17.021', '038', '03', 8, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(155, '17.020', '037', '03', 7, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(156, '17.020', '038', '03', 8, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(157, '17.036', '037', '03', 7, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(158, '17.036', '038', '03', 8, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(159, '17.013', '037', '03', 7, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(160, '17.013', '038', '03', 8, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(161, '17.042', '037', '03', 7, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(162, '17.042', '038', '03', 8, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(163, '17.011', '037', '03', 7, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(164, '17.011', '038', '03', 8, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(165, '17.040', '037', '03', 7, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(166, '17.040', '038', '03', 8, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(167, '19.036', '037', '03', 7, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(168, '19.036', '038', '03', 8, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(169, '19.037', '037', '03', 7, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(170, '19.037', '038', '03', 8, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(171, '17.003', '034', '03', 4, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(172, '18.054', '118', '11', 8, 80.0, 80.0, 80.0, 80.0, NULL, 80.0, 80.0, 80.0, 80.0, 80.0, NULL, 80.0, 80.0, 80.0, 80.0, NULL, 80.0, 80.0, 80.0, 80.0, NULL, 80.0, NULL, NULL, '2019-07-11 01:19:19', 'B', 'B', 'B', 'B', NULL, NULL, 0.0, 0.0, 0.0, NULL),
(173, '18.054', '119', '11', 9, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(174, '18.054', '1115', '11', 15, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(175, '18.054', '1123', '11', 23, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(176, '18.054', '117', '11', 7, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(177, '18.054', '1158', '11', 58, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(178, '18.076', '118', '11', 8, 0.0, 0.0, 0.0, 0.0, NULL, 0.0, 0.0, 0.0, 0.0, 0.0, NULL, 0.0, 0.0, 0.0, 0.0, NULL, 0.0, 0.0, 0.0, 0.0, NULL, 0.0, NULL, NULL, '2019-07-11 01:19:19', 'D', 'D', 'D', 'D', NULL, NULL, 0.0, 0.0, 0.0, NULL),
(179, '18.076', '119', '11', 9, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(180, '18.076', '1115', '11', 15, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(181, '18.076', '1123', '11', 23, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(182, '18.076', '117', '11', 7, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(183, '18.076', '1158', '11', 58, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(184, '15.017', '118', '11', 8, 0.0, 0.0, 0.0, 0.0, NULL, 0.0, 0.0, 0.0, 0.0, 0.0, NULL, 0.0, 0.0, 0.0, 0.0, NULL, 0.0, 0.0, 0.0, 0.0, NULL, 0.0, NULL, NULL, '2019-07-11 01:19:19', 'D', 'D', 'D', 'D', NULL, NULL, 0.0, 0.0, 0.0, NULL),
(185, '15.017', '119', '11', 9, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(186, '15.017', '1115', '11', 15, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(187, '15.017', '1123', '11', 23, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(188, '15.017', '117', '11', 7, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(189, '15.017', '1158', '11', 58, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(190, '16.060', '118', '11', 8, 0.0, 0.0, 0.0, 0.0, NULL, 0.0, 0.0, 0.0, 0.0, 0.0, NULL, 0.0, 0.0, 0.0, 0.0, NULL, 0.0, 0.0, 0.0, 0.0, NULL, 0.0, NULL, NULL, '2019-07-11 01:19:19', 'D', 'D', 'D', 'D', NULL, NULL, 0.0, 0.0, 0.0, NULL),
(191, '16.060', '119', '11', 9, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(192, '16.060', '1115', '11', 15, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(193, '16.060', '1123', '11', 23, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(194, '16.060', '117', '11', 7, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(195, '16.060', '1158', '11', 58, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(196, '15.014', '118', '11', 8, 0.0, 0.0, 0.0, 0.0, NULL, 0.0, 0.0, 0.0, 0.0, 0.0, NULL, 0.0, 0.0, 0.0, 0.0, NULL, 0.0, 0.0, 0.0, 0.0, NULL, 0.0, NULL, NULL, '2019-07-11 01:19:19', 'D', 'D', 'D', 'D', NULL, NULL, 0.0, 0.0, 0.0, NULL),
(197, '15.014', '119', '11', 9, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(198, '15.014', '1115', '11', 15, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(199, '15.014', '1123', '11', 23, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(200, '15.014', '117', '11', 7, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(201, '15.014', '1158', '11', 58, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(202, '18.058', '118', '11', 8, 0.0, 0.0, 0.0, 0.0, NULL, 0.0, 0.0, 0.0, 0.0, 0.0, NULL, 0.0, 0.0, 0.0, 0.0, NULL, 0.0, 0.0, 0.0, 0.0, NULL, 0.0, NULL, NULL, '2019-07-11 01:19:19', 'D', 'D', 'D', 'D', NULL, NULL, 0.0, 0.0, 0.0, NULL),
(203, '18.058', '119', '11', 9, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(204, '18.058', '1115', '11', 15, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(205, '18.058', '1123', '11', 23, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(206, '18.058', '117', '11', 7, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(207, '18.058', '1158', '11', 58, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(208, '15.022', '118', '11', 8, 0.0, 0.0, 0.0, 0.0, NULL, 0.0, 0.0, 0.0, 0.0, 0.0, NULL, 0.0, 0.0, 0.0, 0.0, NULL, 0.0, 0.0, 0.0, 0.0, NULL, 0.0, NULL, NULL, '2019-07-11 01:19:19', 'D', 'D', 'D', 'D', NULL, NULL, 0.0, 0.0, 0.0, NULL),
(209, '15.022', '119', '11', 9, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(210, '15.022', '1115', '11', 15, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(211, '15.022', '1123', '11', 23, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL);
INSERT INTO `pelajaran_nilai` (`id`, `nim`, `kode_pelajaran`, `kode_grade`, `id_pelajaran`, `wa_uts`, `quiz_uts`, `fmt_uts`, `uji_uts`, `pea_uts`, `n_p_uts`, `wa_uas`, `quiz_uas`, `fmt_uas`, `uji_uas`, `pea_uas`, `n_p_uas`, `proj_uts`, `pa_uts`, `porto_uts`, `kea_uts`, `n_k_uts`, `proj_uas`, `pa_uas`, `porto_uas`, `kea_uas`, `n_k_uas`, `na_uts`, `na_uas`, `tanggal`, `mutup_uts`, `mutup_uas`, `mutuk_uts`, `mutuk_uas`, `narasi_p_uas`, `narasi_k_uas`, `us_pengetahuan`, `us_praktek`, `us_na`, `finger`) VALUES
(212, '15.022', '117', '11', 7, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(213, '15.022', '1158', '11', 58, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(214, '15.023', '118', '11', 8, 0.0, 0.0, 0.0, 0.0, NULL, 0.0, 0.0, 0.0, 0.0, 0.0, NULL, 0.0, 0.0, 0.0, 0.0, NULL, 0.0, 0.0, 0.0, 0.0, NULL, 0.0, NULL, NULL, '2019-07-11 01:19:19', 'D', 'D', 'D', 'D', NULL, NULL, 0.0, 0.0, 0.0, NULL),
(215, '15.023', '119', '11', 9, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(216, '15.023', '1115', '11', 15, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(217, '15.023', '1123', '11', 23, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(218, '15.023', '117', '11', 7, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(219, '15.023', '1158', '11', 58, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(220, '18.056', '118', '11', 8, 0.0, 0.0, 0.0, 0.0, NULL, 0.0, 0.0, 0.0, 0.0, 0.0, NULL, 0.0, 0.0, 0.0, 0.0, NULL, 0.0, 0.0, 0.0, 0.0, NULL, 0.0, NULL, NULL, '2019-07-11 01:19:19', 'D', 'D', 'D', 'D', NULL, NULL, 0.0, 0.0, 0.0, NULL),
(221, '18.056', '119', '11', 9, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(222, '18.056', '1115', '11', 15, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(223, '18.056', '1123', '11', 23, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(224, '18.056', '117', '11', 7, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(225, '18.056', '1158', '11', 58, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(226, '15.005', '118', '11', 8, 0.0, 0.0, 0.0, 0.0, NULL, 0.0, 0.0, 0.0, 0.0, 0.0, NULL, 0.0, 0.0, 0.0, 0.0, NULL, 0.0, 0.0, 0.0, 0.0, NULL, 0.0, NULL, NULL, '2019-07-11 01:19:19', 'D', 'D', 'D', 'D', NULL, NULL, 0.0, 0.0, 0.0, NULL),
(227, '15.005', '119', '11', 9, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(228, '15.005', '1115', '11', 15, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(229, '15.005', '1123', '11', 23, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(230, '15.005', '117', '11', 7, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(231, '15.005', '1158', '11', 58, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(232, '18.057', '118', '11', 8, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(233, '18.057', '119', '11', 9, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(234, '18.057', '1115', '11', 15, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(235, '18.057', '1123', '11', 23, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(236, '18.057', '117', '11', 7, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(237, '18.057', '1158', '11', 58, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(238, '15.020', '118', '11', 8, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(239, '15.020', '119', '11', 9, 0.0, 0.0, 0.0, 0.0, NULL, 0.0, 0.0, 0.0, 0.0, 0.0, NULL, 0.0, 0.0, 0.0, 0.0, NULL, 0.0, 0.0, 0.0, 0.0, NULL, 0.0, NULL, NULL, '2019-07-11 01:22:18', 'D', 'D', 'D', 'D', NULL, NULL, 0.0, 0.0, 0.0, NULL),
(240, '15.020', '1115', '11', 15, 0.0, 0.0, 0.0, 0.0, NULL, 0.0, 0.0, 0.0, 0.0, 0.0, NULL, 0.0, 0.0, 0.0, 0.0, NULL, 0.0, 0.0, 0.0, 0.0, NULL, 0.0, NULL, NULL, '2019-07-11 01:20:12', 'D', 'D', 'D', 'D', NULL, NULL, 0.0, 0.0, 0.0, NULL),
(241, '15.020', '1123', '11', 23, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(242, '15.020', '117', '11', 7, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(243, '15.020', '1158', '11', 58, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(244, '09.015', '118', '11', 8, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(245, '09.015', '119', '11', 9, 0.0, 0.0, 0.0, 0.0, NULL, 0.0, 0.0, 0.0, 0.0, 0.0, NULL, 0.0, 0.0, 0.0, 0.0, NULL, 0.0, 0.0, 0.0, 0.0, NULL, 0.0, NULL, NULL, '2019-07-11 01:22:18', 'D', 'D', 'D', 'D', NULL, NULL, 0.0, 0.0, 0.0, NULL),
(246, '09.015', '1115', '11', 15, 0.0, 0.0, 0.0, 0.0, NULL, 0.0, 0.0, 0.0, 0.0, 0.0, NULL, 0.0, 0.0, 0.0, 0.0, NULL, 0.0, 0.0, 0.0, 0.0, NULL, 0.0, NULL, NULL, '2019-07-11 01:20:12', 'D', 'D', 'D', 'D', NULL, NULL, 0.0, 0.0, 0.0, NULL),
(247, '09.015', '1123', '11', 23, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(248, '09.015', '117', '11', 7, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(249, '09.015', '1158', '11', 58, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(250, '09.033', '118', '11', 8, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(251, '09.033', '119', '11', 9, 0.0, 0.0, 0.0, 0.0, NULL, 0.0, 0.0, 0.0, 0.0, 0.0, NULL, 0.0, 0.0, 0.0, 0.0, NULL, 0.0, 0.0, 0.0, 0.0, NULL, 0.0, NULL, NULL, '2019-07-11 01:22:18', 'D', 'D', 'D', 'D', NULL, NULL, 0.0, 0.0, 0.0, NULL),
(252, '09.033', '1115', '11', 15, 0.0, 0.0, 0.0, 0.0, NULL, 0.0, 0.0, 0.0, 0.0, 0.0, NULL, 0.0, 0.0, 0.0, 0.0, NULL, 0.0, 0.0, 0.0, 0.0, NULL, 0.0, NULL, NULL, '2019-07-11 01:20:12', 'D', 'D', 'D', 'D', NULL, NULL, 0.0, 0.0, 0.0, NULL),
(253, '09.033', '1123', '11', 23, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(254, '09.033', '117', '11', 7, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(255, '09.033', '1158', '11', 58, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(256, '09.037', '118', '11', 8, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(257, '09.037', '119', '11', 9, 0.0, 0.0, 0.0, 0.0, NULL, 0.0, 0.0, 0.0, 0.0, 0.0, NULL, 0.0, 0.0, 0.0, 0.0, NULL, 0.0, 0.0, 0.0, 0.0, NULL, 0.0, NULL, NULL, '2019-07-11 01:22:18', 'D', 'D', 'D', 'D', NULL, NULL, 0.0, 0.0, 0.0, NULL),
(258, '09.037', '1115', '11', 15, 0.0, 0.0, 0.0, 0.0, NULL, 0.0, 0.0, 0.0, 0.0, 0.0, NULL, 0.0, 0.0, 0.0, 0.0, NULL, 0.0, 0.0, 0.0, 0.0, NULL, 0.0, NULL, NULL, '2019-07-11 01:20:12', 'D', 'D', 'D', 'D', NULL, NULL, 0.0, 0.0, 0.0, NULL),
(259, '09.037', '1123', '11', 23, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(260, '09.037', '117', '11', 7, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(261, '09.037', '1158', '11', 58, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(262, '09.032', '118', '11', 8, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(263, '09.032', '119', '11', 9, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(264, '09.032', '1115', '11', 15, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(265, '09.032', '1123', '11', 23, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(266, '09.032', '117', '11', 7, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(267, '09.032', '1158', '11', 58, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(268, '09.035', '118', '11', 8, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(269, '09.035', '119', '11', 9, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(270, '09.035', '1115', '11', 15, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(271, '09.035', '1123', '11', 23, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(272, '09.035', '117', '11', 7, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(273, '09.035', '1158', '11', 58, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(274, '09.019', '118', '11', 8, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(275, '09.019', '119', '11', 9, 0.0, 0.0, 0.0, 0.0, NULL, 0.0, 0.0, 0.0, 0.0, 0.0, NULL, 0.0, 0.0, 0.0, 0.0, NULL, 0.0, 0.0, 0.0, 0.0, NULL, 0.0, NULL, NULL, '2019-07-11 01:22:18', 'D', 'D', 'D', 'D', NULL, NULL, 0.0, 0.0, 0.0, NULL),
(276, '09.019', '1115', '11', 15, 0.0, 0.0, 0.0, 0.0, NULL, 0.0, 0.0, 0.0, 0.0, 0.0, NULL, 0.0, 0.0, 0.0, 0.0, NULL, 0.0, 0.0, 0.0, 0.0, NULL, 0.0, NULL, NULL, '2019-07-11 01:20:12', 'D', 'D', 'D', 'D', NULL, NULL, 0.0, 0.0, 0.0, NULL),
(277, '09.019', '1123', '11', 23, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(278, '09.019', '117', '11', 7, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(279, '09.019', '1158', '11', 58, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(280, '15.007', '118', '11', 8, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(281, '15.007', '119', '11', 9, 0.0, 0.0, 0.0, 0.0, NULL, 0.0, 0.0, 0.0, 0.0, 0.0, NULL, 0.0, 0.0, 0.0, 0.0, NULL, 0.0, 0.0, 0.0, 0.0, NULL, 0.0, NULL, NULL, '2019-07-11 01:22:18', 'D', 'D', 'D', 'D', NULL, NULL, 0.0, 0.0, 0.0, NULL),
(282, '15.007', '1115', '11', 15, 90.0, 87.0, 88.0, 80.0, NULL, 87.0, 0.0, 0.0, 0.0, 0.0, NULL, 44.0, 95.0, 89.0, 88.0, NULL, 91.2, 0.0, 0.0, 0.0, NULL, 46.0, NULL, NULL, '2019-07-11 01:20:12', 'B', 'D', 'A', 'D', NULL, NULL, 0.0, 0.0, 0.0, NULL),
(283, '15.007', '1123', '11', 23, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(284, '15.007', '117', '11', 7, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(285, '15.007', '1158', '11', 58, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(286, '15.006', '118', '11', 8, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(287, '15.006', '119', '11', 9, 0.0, 0.0, 0.0, 0.0, NULL, 0.0, 0.0, 0.0, 0.0, 0.0, NULL, 0.0, 0.0, 0.0, 0.0, NULL, 0.0, 0.0, 0.0, 0.0, NULL, 0.0, NULL, NULL, '2019-07-11 01:22:18', 'D', 'D', 'D', 'D', NULL, NULL, 0.0, 0.0, 0.0, NULL),
(288, '15.006', '1115', '11', 15, 0.0, 0.0, 0.0, 0.0, NULL, 0.0, 0.0, 0.0, 0.0, 0.0, NULL, 0.0, 0.0, 0.0, 0.0, NULL, 0.0, 0.0, 0.0, 0.0, NULL, 0.0, NULL, NULL, '2019-07-11 01:20:12', 'D', 'D', 'D', 'D', NULL, NULL, 0.0, 0.0, 0.0, NULL),
(289, '15.006', '1123', '11', 23, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(290, '15.006', '117', '11', 7, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(291, '15.006', '1158', '11', 58, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(292, '18.055', '118', '11', 8, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(293, '18.055', '119', '11', 9, 0.0, 0.0, 0.0, 0.0, NULL, 0.0, 0.0, 0.0, 0.0, 0.0, NULL, 0.0, 0.0, 0.0, 0.0, NULL, 0.0, 0.0, 0.0, 0.0, NULL, 0.0, NULL, NULL, '2019-07-11 01:22:18', 'D', 'D', 'D', 'D', NULL, NULL, 0.0, 0.0, 0.0, NULL),
(294, '18.055', '1115', '11', 15, 0.0, 0.0, 0.0, 0.0, NULL, 0.0, 0.0, 0.0, 0.0, 0.0, NULL, 0.0, 0.0, 0.0, 0.0, NULL, 0.0, 0.0, 0.0, 0.0, NULL, 0.0, NULL, NULL, '2019-07-11 01:20:12', 'D', 'D', 'D', 'D', NULL, NULL, 0.0, 0.0, 0.0, NULL),
(295, '18.055', '1123', '11', 23, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(296, '18.055', '117', '11', 7, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(297, '18.055', '1158', '11', 58, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(298, '15.019', '118', '11', 8, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(299, '15.019', '119', '11', 9, 0.0, 0.0, 0.0, 0.0, NULL, 0.0, 0.0, 0.0, 0.0, 0.0, NULL, 0.0, 0.0, 0.0, 0.0, NULL, 0.0, 0.0, 0.0, 0.0, NULL, 0.0, NULL, NULL, '2019-07-11 01:22:18', 'D', 'D', 'D', 'D', NULL, NULL, 0.0, 0.0, 0.0, NULL),
(300, '15.019', '1115', '11', 15, 0.0, 0.0, 0.0, 0.0, NULL, 0.0, 0.0, 0.0, 0.0, 0.0, NULL, 0.0, 0.0, 0.0, 0.0, NULL, 0.0, 0.0, 0.0, 0.0, NULL, 0.0, NULL, NULL, '2019-07-11 01:20:12', 'D', 'D', 'D', 'D', NULL, NULL, 0.0, 0.0, 0.0, NULL),
(301, '15.019', '1123', '11', 23, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(302, '15.019', '117', '11', 7, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(303, '15.019', '1158', '11', 58, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(304, '18.047', '118', '11', 8, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(305, '18.047', '119', '11', 9, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(306, '18.047', '1115', '11', 15, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(307, '18.047', '1123', '11', 23, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(308, '18.047', '117', '11', 7, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(309, '18.047', '1158', '11', 58, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(310, '17.068', '118', '11', 8, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(311, '17.068', '119', '11', 9, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(312, '17.068', '1115', '11', 15, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(313, '17.068', '1123', '11', 23, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(314, '17.068', '117', '11', 7, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(315, '17.068', '1158', '11', 58, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(316, '18.073', '118', '11', 8, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(317, '18.073', '119', '11', 9, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(318, '18.073', '1115', '11', 15, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(319, '18.073', '1123', '11', 23, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(320, '18.073', '117', '11', 7, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(321, '18.073', '1158', '11', 58, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(322, '15.004', '118', '11', 8, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(323, '15.004', '119', '11', 9, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(324, '15.004', '1115', '11', 15, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(325, '15.004', '1123', '11', 23, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(326, '15.004', '117', '11', 7, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(327, '15.004', '1158', '11', 58, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(328, '18.049', '118', '11', 8, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(329, '18.049', '119', '11', 9, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(330, '18.049', '1115', '11', 15, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(331, '18.049', '1123', '11', 23, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(332, '18.049', '117', '11', 7, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(333, '18.049', '1158', '11', 58, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(334, '11.040', '118', '11', 8, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(335, '11.040', '119', '11', 9, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(336, '11.040', '1115', '11', 15, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(337, '11.040', '1123', '11', 23, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(338, '11.040', '117', '11', 7, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(339, '11.040', '1158', '11', 58, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(340, '18.060', '118', '11', 8, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(341, '18.060', '119', '11', 9, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(342, '18.060', '1115', '11', 15, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(343, '18.060', '1123', '11', 23, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(344, '18.060', '117', '11', 7, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(345, '18.060', '1158', '11', 58, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(346, '09.018', '118', '11', 8, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(347, '09.018', '119', '11', 9, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(348, '09.018', '1115', '11', 15, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(349, '09.018', '1123', '11', 23, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(350, '09.018', '117', '11', 7, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(351, '09.018', '1158', '11', 58, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(352, '18.051', '118', '11', 8, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(353, '18.051', '119', '11', 9, 0.0, 0.0, 0.0, 0.0, NULL, 0.0, 0.0, 0.0, 0.0, 0.0, NULL, 0.0, 0.0, 0.0, 0.0, NULL, 0.0, 0.0, 0.0, 0.0, NULL, 0.0, NULL, NULL, '2019-07-11 01:22:18', 'D', 'D', 'D', 'D', NULL, NULL, 0.0, 0.0, 0.0, NULL),
(354, '18.051', '1115', '11', 15, 0.0, 0.0, 0.0, 0.0, NULL, 0.0, 0.0, 0.0, 0.0, 0.0, NULL, 0.0, 0.0, 0.0, 0.0, NULL, 0.0, 0.0, 0.0, 0.0, NULL, 0.0, NULL, NULL, '2019-07-11 01:20:12', 'D', 'D', 'D', 'D', NULL, NULL, 0.0, 0.0, 0.0, NULL),
(355, '18.051', '1123', '11', 23, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(356, '18.051', '117', '11', 7, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(357, '18.051', '1158', '11', 58, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(358, '09.019', '', '11', 43, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(359, '15.007', '', '11', 43, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(360, '18.051', '', '11', 43, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(361, '15.020', '', '11', 43, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(362, '15.006', '', '11', 43, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(363, '09.015', '', '11', 43, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(364, '09.033', '', '11', 43, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(365, '18.055', '', '11', 43, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(366, '15.019', '', '11', 43, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(367, '09.037', '', '11', 43, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(368, '18.047', '', '11', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(369, '17.068', '', '11', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(370, '09.032', '', '11', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(371, '18.073', '', '11', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(372, '15.004', '', '11', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(373, '18.049', '', '11', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(374, '11.040', '', '11', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(375, '09.035', '', '11', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(376, '18.060', '', '11', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(377, '09.018', '', '11', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(378, '09.019', '1116', '11', 16, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(379, '15.007', '1116', '11', 16, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(380, '18.051', '1116', '11', 16, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(381, '15.020', '1116', '11', 16, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(382, '15.006', '1116', '11', 16, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(383, '09.015', '1116', '11', 16, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(384, '09.033', '1116', '11', 16, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(385, '18.055', '1116', '11', 16, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(386, '15.019', '1116', '11', 16, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(387, '09.037', '1116', '11', 16, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(388, '18.047', '1116', '11', 16, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(389, '17.068', '1116', '11', 16, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(390, '09.032', '1116', '11', 16, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(391, '18.073', '1116', '11', 16, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(392, '15.004', '1116', '11', 16, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(393, '18.049', '1116', '11', 16, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(394, '11.040', '1116', '11', 16, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(395, '09.035', '1116', '11', 16, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(396, '18.060', '1116', '11', 16, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(397, '09.018', '1116', '11', 16, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(398, '09.019', '1117', '11', 17, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(399, '15.007', '1117', '11', 17, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(400, '18.051', '1117', '11', 17, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(401, '15.020', '1117', '11', 17, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(402, '15.006', '1117', '11', 17, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(403, '09.015', '1117', '11', 17, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(404, '09.033', '1117', '11', 17, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(405, '18.055', '1117', '11', 17, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(406, '15.019', '1117', '11', 17, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(407, '09.037', '1117', '11', 17, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(408, '18.047', '1117', '11', 17, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(409, '17.068', '1117', '11', 17, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(410, '09.032', '1117', '11', 17, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(411, '18.073', '1117', '11', 17, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(412, '15.004', '1117', '11', 17, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(413, '18.049', '1117', '11', 17, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(414, '11.040', '1117', '11', 17, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(415, '09.035', '1117', '11', 17, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(416, '18.060', '1117', '11', 17, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(417, '09.018', '1117', '11', 17, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(418, '09.019', '1142', '11', 42, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(419, '15.007', '1142', '11', 42, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(420, '18.051', '1142', '11', 42, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(421, '15.020', '1142', '11', 42, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL);
INSERT INTO `pelajaran_nilai` (`id`, `nim`, `kode_pelajaran`, `kode_grade`, `id_pelajaran`, `wa_uts`, `quiz_uts`, `fmt_uts`, `uji_uts`, `pea_uts`, `n_p_uts`, `wa_uas`, `quiz_uas`, `fmt_uas`, `uji_uas`, `pea_uas`, `n_p_uas`, `proj_uts`, `pa_uts`, `porto_uts`, `kea_uts`, `n_k_uts`, `proj_uas`, `pa_uas`, `porto_uas`, `kea_uas`, `n_k_uas`, `na_uts`, `na_uas`, `tanggal`, `mutup_uts`, `mutup_uas`, `mutuk_uts`, `mutuk_uas`, `narasi_p_uas`, `narasi_k_uas`, `us_pengetahuan`, `us_praktek`, `us_na`, `finger`) VALUES
(422, '15.006', '1142', '11', 42, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(423, '09.015', '1142', '11', 42, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(424, '09.033', '1142', '11', 42, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(425, '18.055', '1142', '11', 42, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(426, '15.019', '1142', '11', 42, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(427, '09.037', '1142', '11', 42, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(428, '18.047', '1142', '11', 42, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(429, '17.068', '1142', '11', 42, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(430, '09.032', '1142', '11', 42, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(431, '18.073', '1142', '11', 42, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(432, '15.004', '1142', '11', 42, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(433, '18.049', '1142', '11', 42, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(434, '11.040', '1142', '11', 42, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(435, '09.035', '1142', '11', 42, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(436, '18.060', '1142', '11', 42, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(437, '09.018', '1142', '11', 42, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(438, '09.019', '1159', '11', 59, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(439, '15.007', '1159', '11', 59, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(440, '18.051', '1159', '11', 59, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(441, '15.020', '1159', '11', 59, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(442, '15.006', '1159', '11', 59, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(443, '09.015', '1159', '11', 59, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(444, '09.033', '1159', '11', 59, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(445, '18.055', '1159', '11', 59, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(446, '15.019', '1159', '11', 59, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(447, '09.037', '1159', '11', 59, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(448, '18.047', '1159', '11', 59, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(449, '17.068', '1159', '11', 59, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(450, '09.032', '1159', '11', 59, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(451, '18.073', '1159', '11', 59, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(452, '15.004', '1159', '11', 59, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(453, '18.049', '1159', '11', 59, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(454, '11.040', '1159', '11', 59, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(455, '09.035', '1159', '11', 59, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(456, '18.060', '1159', '11', 59, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(457, '09.018', '1159', '11', 59, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(458, '18.054', '1143', '11', 43, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(459, '18.076', '1143', '11', 43, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(460, '15.017', '1143', '11', 43, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(461, '16.060', '1143', '11', 43, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(462, '15.014', '1143', '11', 43, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(463, '18.058', '1143', '11', 43, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(464, '15.022', '1143', '11', 43, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(465, '15.023', '1143', '11', 43, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(466, '18.056', '1143', '11', 43, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(467, '15.005', '1143', '11', 43, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(468, '18.057', '1143', '11', 43, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(469, '18.054', '1147', '11', 47, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(470, '18.076', '1147', '11', 47, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(471, '15.017', '1147', '11', 47, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(472, '16.060', '1147', '11', 47, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(473, '15.014', '1147', '11', 47, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(474, '18.058', '1147', '11', 47, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(475, '15.022', '1147', '11', 47, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(476, '15.023', '1147', '11', 47, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(477, '18.056', '1147', '11', 47, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(478, '15.005', '1147', '11', 47, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(479, '18.057', '1147', '11', 47, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(480, '18.054', '1157', '11', 57, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(481, '18.076', '1157', '11', 57, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(482, '15.017', '1157', '11', 57, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(483, '16.060', '1157', '11', 57, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(484, '15.014', '1157', '11', 57, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(485, '18.058', '1157', '11', 57, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(486, '15.022', '1157', '11', 57, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(487, '15.023', '1157', '11', 57, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(488, '18.056', '1157', '11', 57, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(489, '15.005', '1157', '11', 57, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(490, '18.057', '1157', '11', 57, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(491, '18.054', '1176', '11', 76, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(492, '18.076', '1176', '11', 76, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(493, '15.017', '1176', '11', 76, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(494, '16.060', '1176', '11', 76, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(495, '15.014', '1176', '11', 76, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(496, '18.058', '1176', '11', 76, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(497, '15.022', '1176', '11', 76, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(498, '15.023', '1176', '11', 76, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(499, '18.056', '1176', '11', 76, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(500, '15.005', '1176', '11', 76, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(501, '18.057', '1176', '11', 76, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(502, '08.016', '128', '12', 8, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(503, '08.016', '129', '12', 9, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(504, '08.016', '127', '12', 7, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(505, '08.016', '1215', '12', 15, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(506, '14.101', '128', '12', 8, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(507, '14.101', '129', '12', 9, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(508, '14.101', '127', '12', 7, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(509, '14.101', '1215', '12', 15, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(510, '09.074', '128', '12', 8, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(511, '09.074', '129', '12', 9, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(512, '09.074', '127', '12', 7, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(513, '09.074', '1215', '12', 15, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(514, '14.072', '128', '12', 8, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(515, '14.072', '129', '12', 9, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(516, '14.072', '127', '12', 7, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(517, '14.072', '1215', '12', 15, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(518, '14.089', '128', '12', 8, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(519, '14.089', '129', '12', 9, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(520, '14.089', '127', '12', 7, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(521, '14.089', '1215', '12', 15, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(522, '14.106', '128', '12', 8, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(523, '14.106', '129', '12', 9, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(524, '14.106', '127', '12', 7, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(525, '14.106', '1215', '12', 15, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(526, '15.027', '128', '12', 8, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(527, '15.027', '129', '12', 9, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(528, '15.027', '127', '12', 7, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(529, '15.027', '1215', '12', 15, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(530, '09.070', '128', '12', 8, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(531, '09.070', '129', '12', 9, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(532, '09.070', '127', '12', 7, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(533, '09.070', '1215', '12', 15, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(534, '14.079', '128', '12', 8, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(535, '14.079', '129', '12', 9, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(536, '14.079', '127', '12', 7, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(537, '14.079', '1215', '12', 15, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(538, '08.013', '128', '12', 8, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(539, '08.013', '129', '12', 9, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(540, '08.013', '127', '12', 7, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(541, '08.013', '1215', '12', 15, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(542, '14.102', '128', '12', 8, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(543, '14.102', '129', '12', 9, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(544, '14.102', '127', '12', 7, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(545, '14.102', '1215', '12', 15, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(546, '14.096', '128', '12', 8, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(547, '14.096', '129', '12', 9, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(548, '14.096', '127', '12', 7, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(549, '14.096', '1215', '12', 15, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(550, '17.093', '128', '12', 8, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(551, '17.093', '129', '12', 9, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(552, '17.093', '127', '12', 7, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(553, '17.093', '1215', '12', 15, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(554, '08.002', '128', '12', 8, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(555, '08.002', '129', '12', 9, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(556, '08.002', '127', '12', 7, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(557, '08.002', '1215', '12', 15, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(558, '17.051', '128', '12', 8, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(559, '17.051', '129', '12', 9, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(560, '17.051', '127', '12', 7, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(561, '17.051', '1215', '12', 15, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(562, '14.080', '128', '12', 8, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(563, '14.080', '129', '12', 9, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(564, '14.080', '127', '12', 7, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(565, '14.080', '1215', '12', 15, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(566, '14.074', '128', '12', 8, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(567, '14.074', '129', '12', 9, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(568, '14.074', '127', '12', 7, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(569, '14.074', '1215', '12', 15, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(570, '11.042', '128', '12', 8, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(571, '11.042', '129', '12', 9, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(572, '11.042', '127', '12', 7, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(573, '11.042', '1215', '12', 15, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(574, '17.049', '128', '12', 8, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(575, '17.049', '129', '12', 9, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(576, '17.049', '127', '12', 7, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(577, '17.049', '1215', '12', 15, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(578, '14.099', '128', '12', 8, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(579, '14.099', '129', '12', 9, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(580, '14.099', '127', '12', 7, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(581, '14.099', '1215', '12', 15, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(582, '17.048', '128', '12', 8, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(583, '17.048', '129', '12', 9, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(584, '17.048', '127', '12', 7, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(585, '17.048', '1215', '12', 15, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(586, '14.076', '128', '12', 8, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(587, '14.076', '129', '12', 9, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(588, '14.076', '127', '12', 7, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(589, '14.076', '1215', '12', 15, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(590, '08.003', '128', '12', 8, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(591, '08.003', '129', '12', 9, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(592, '08.003', '127', '12', 7, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(593, '08.003', '1215', '12', 15, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(594, '18.071', '128', '12', 8, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(595, '18.071', '129', '12', 9, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(596, '18.071', '127', '12', 7, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(597, '18.071', '1215', '12', 15, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(598, '14.093', '128', '12', 8, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(599, '14.093', '129', '12', 9, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(600, '14.093', '127', '12', 7, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(601, '14.093', '1215', '12', 15, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(602, '17.063', '128', '12', 8, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(603, '17.063', '129', '12', 9, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(604, '17.063', '127', '12', 7, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(605, '17.063', '1215', '12', 15, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(606, '14.100', '128', '12', 8, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(607, '14.100', '129', '12', 9, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(608, '14.100', '127', '12', 7, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(609, '14.100', '1215', '12', 15, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(610, '08.025', '128', '12', 8, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(611, '08.025', '129', '12', 9, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(612, '08.025', '127', '12', 7, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(613, '08.025', '1215', '12', 15, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(614, '08.017', '128', '12', 8, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(615, '08.017', '129', '12', 9, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(616, '08.017', '127', '12', 7, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(617, '08.017', '1215', '12', 15, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(618, '14.104', '128', '12', 8, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(619, '14.104', '129', '12', 9, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(620, '14.104', '127', '12', 7, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(621, '14.104', '1215', '12', 15, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(622, '14.092', '128', '12', 8, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(623, '14.092', '129', '12', 9, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(624, '14.092', '127', '12', 7, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(625, '14.092', '1215', '12', 15, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(626, '14.078', '128', '12', 8, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(627, '14.078', '129', '12', 9, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(628, '14.078', '127', '12', 7, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(629, '14.078', '1215', '12', 15, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(630, '17.050', '128', '12', 8, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(631, '17.050', '129', '12', 9, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL);
INSERT INTO `pelajaran_nilai` (`id`, `nim`, `kode_pelajaran`, `kode_grade`, `id_pelajaran`, `wa_uts`, `quiz_uts`, `fmt_uts`, `uji_uts`, `pea_uts`, `n_p_uts`, `wa_uas`, `quiz_uas`, `fmt_uas`, `uji_uas`, `pea_uas`, `n_p_uas`, `proj_uts`, `pa_uts`, `porto_uts`, `kea_uts`, `n_k_uts`, `proj_uas`, `pa_uas`, `porto_uas`, `kea_uas`, `n_k_uas`, `na_uts`, `na_uas`, `tanggal`, `mutup_uts`, `mutup_uas`, `mutuk_uts`, `mutuk_uas`, `narasi_p_uas`, `narasi_k_uas`, `us_pengetahuan`, `us_praktek`, `us_na`, `finger`) VALUES
(632, '17.050', '127', '12', 7, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(633, '17.050', '1215', '12', 15, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(634, '14.073', '128', '12', 8, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(635, '14.073', '129', '12', 9, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(636, '14.073', '127', '12', 7, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(637, '14.073', '1215', '12', 15, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(638, '17.094', '128', '12', 8, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(639, '17.094', '129', '12', 9, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(640, '17.094', '127', '12', 7, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(641, '17.094', '1215', '12', 15, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(642, '08.012', '128', '12', 8, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(643, '08.012', '129', '12', 9, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(644, '08.012', '127', '12', 7, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(645, '08.012', '1215', '12', 15, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(646, '08.015', '128', '12', 8, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(647, '08.015', '129', '12', 9, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(648, '08.015', '127', '12', 7, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(649, '08.015', '1215', '12', 15, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(650, '14.068', '128', '12', 8, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(651, '14.068', '129', '12', 9, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(652, '14.068', '127', '12', 7, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(653, '14.068', '1215', '12', 15, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(654, '17.059', '128', '12', 8, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(655, '17.059', '129', '12', 9, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(656, '17.059', '127', '12', 7, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(657, '17.059', '1215', '12', 15, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(658, '17.054', '128', '12', 8, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(659, '17.054', '129', '12', 9, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(660, '17.054', '127', '12', 7, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(661, '17.054', '1215', '12', 15, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(662, '17.065', '128', '12', 8, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(663, '17.065', '129', '12', 9, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(664, '17.065', '127', '12', 7, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(665, '17.065', '1215', '12', 15, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(666, '08.024', '128', '12', 8, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(667, '08.024', '129', '12', 9, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(668, '08.024', '127', '12', 7, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(669, '08.024', '1215', '12', 15, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(670, '17.058', '128', '12', 8, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(671, '17.058', '129', '12', 9, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(672, '17.058', '127', '12', 7, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(673, '17.058', '1215', '12', 15, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(674, '18.077', '128', '12', 8, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(675, '18.077', '129', '12', 9, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(676, '18.077', '127', '12', 7, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(677, '18.077', '1215', '12', 15, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(678, '14.090', '128', '12', 8, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(679, '14.090', '129', '12', 9, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(680, '14.090', '127', '12', 7, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(681, '14.090', '1215', '12', 15, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(682, '14.081', '128', '12', 8, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(683, '14.081', '129', '12', 9, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(684, '14.081', '127', '12', 7, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(685, '14.081', '1215', '12', 15, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(686, '17.055', '128', '12', 8, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(687, '17.055', '129', '12', 9, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(688, '17.055', '127', '12', 7, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(689, '17.055', '1215', '12', 15, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(690, '14.105', '128', '12', 8, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(691, '14.105', '129', '12', 9, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(692, '14.105', '127', '12', 7, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(693, '14.105', '1215', '12', 15, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(694, '14.082', '128', '12', 8, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(695, '14.082', '129', '12', 9, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(696, '14.082', '127', '12', 7, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(697, '14.082', '1215', '12', 15, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(698, '17.052', '128', '12', 8, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(699, '17.052', '129', '12', 9, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(700, '17.052', '127', '12', 7, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(701, '17.052', '1215', '12', 15, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(702, '17.056', '128', '12', 8, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(703, '17.056', '129', '12', 9, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(704, '17.056', '127', '12', 7, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(705, '17.056', '1215', '12', 15, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(706, '08.005', '128', '12', 8, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(707, '08.005', '129', '12', 9, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(708, '08.005', '127', '12', 7, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(709, '08.005', '1215', '12', 15, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(710, '17.060', '128', '12', 8, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(711, '17.060', '129', '12', 9, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(712, '17.060', '127', '12', 7, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(713, '17.060', '1215', '12', 15, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(714, '14.077', '128', '12', 8, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(715, '14.077', '129', '12', 9, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(716, '14.077', '127', '12', 7, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(717, '14.077', '1215', '12', 15, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(718, '17.053', '128', '12', 8, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(719, '17.053', '129', '12', 9, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(720, '17.053', '127', '12', 7, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(721, '17.053', '1215', '12', 15, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(722, '17.061', '128', '12', 8, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(723, '17.061', '129', '12', 9, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(724, '17.061', '127', '12', 7, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(725, '17.061', '1215', '12', 15, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(726, '14.085', '128', '12', 8, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(727, '14.085', '129', '12', 9, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(728, '14.085', '127', '12', 7, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(729, '14.085', '1215', '12', 15, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(730, '17.057', '128', '12', 8, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(731, '17.057', '129', '12', 9, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(732, '17.057', '127', '12', 7, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(733, '17.057', '1215', '12', 15, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(734, '17.062', '128', '12', 8, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(735, '17.062', '129', '12', 9, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(736, '17.062', '127', '12', 7, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(737, '17.062', '1215', '12', 15, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(738, '14.066', '128', '12', 8, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(739, '14.066', '129', '12', 9, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(740, '14.066', '127', '12', 7, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(741, '14.066', '1215', '12', 15, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(742, '08.006', '128', '12', 8, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(743, '08.006', '129', '12', 9, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(744, '08.006', '127', '12', 7, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(745, '08.006', '1215', '12', 15, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(746, '15.026', '128', '12', 8, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(747, '15.026', '129', '12', 9, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(748, '15.026', '127', '12', 7, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(749, '15.026', '1215', '12', 15, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(750, '14.110', '128', '12', 8, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(751, '14.110', '129', '12', 9, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(752, '14.110', '127', '12', 7, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(753, '14.110', '1215', '12', 15, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(754, '14.097', '128', '12', 8, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(755, '14.097', '129', '12', 9, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(756, '14.097', '127', '12', 7, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(757, '14.097', '1215', '12', 15, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(758, '14.108', '128', '12', 8, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(759, '14.108', '129', '12', 9, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(760, '14.108', '127', '12', 7, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(761, '14.108', '1215', '12', 15, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(762, '08.016', '121', '12', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(763, '14.101', '121', '12', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(764, '09.074', '121', '12', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(765, '14.072', '121', '12', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(766, '14.089', '121', '12', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(767, '14.106', '121', '12', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(768, '15.027', '121', '12', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(769, '09.070', '121', '12', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(770, '14.079', '121', '12', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(771, '08.013', '121', '12', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(772, '14.102', '121', '12', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(773, '14.096', '121', '12', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(774, '17.093', '121', '12', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(775, '08.002', '121', '12', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(776, '17.051', '121', '12', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(777, '14.080', '121', '12', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(778, '14.074', '121', '12', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(779, '11.042', '121', '12', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(780, '14.099', '121', '12', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(781, '17.048', '121', '12', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(782, '08.003', '121', '12', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(783, '18.071', '121', '12', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(784, '14.093', '121', '12', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(785, '17.063', '121', '12', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(786, '14.100', '121', '12', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(787, '08.025', '121', '12', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(788, '08.017', '121', '12', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(789, '14.104', '121', '12', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(790, '14.092', '121', '12', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(791, '14.078', '121', '12', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(792, '17.050', '121', '12', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(793, '14.073', '121', '12', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(794, '17.094', '121', '12', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(795, '08.012', '121', '12', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(796, '08.015', '121', '12', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(797, '14.068', '121', '12', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(798, '17.059', '121', '12', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(799, '17.054', '121', '12', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(800, '17.065', '121', '12', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(801, '08.024', '121', '12', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(802, '17.058', '121', '12', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(803, '14.090', '121', '12', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(804, '14.081', '121', '12', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(805, '17.055', '121', '12', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(806, '14.105', '121', '12', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(807, '14.082', '121', '12', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(808, '17.056', '121', '12', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(809, '08.005', '121', '12', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(810, '17.060', '121', '12', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(811, '17.053', '121', '12', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(812, '17.061', '121', '12', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(813, '14.085', '121', '12', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(814, '17.057', '121', '12', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(815, '17.062', '121', '12', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(816, '14.066', '121', '12', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(817, '08.006', '121', '12', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(818, '15.026', '121', '12', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(819, '14.110', '121', '12', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(820, '14.097', '121', '12', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(821, '14.108', '121', '12', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(822, '17.093', '', '12', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(823, '08.016', '', '12', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(824, '08.002', '', '12', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(825, '14.101', '', '12', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(826, '17.051', '', '12', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(827, '09.074', '', '12', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(828, '14.072', '', '12', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(829, '14.080', '', '12', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(830, '14.089', '', '12', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(831, '14.106', '', '12', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(832, '17.093', '1216', '12', 16, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(833, '08.016', '1216', '12', 16, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(834, '08.002', '1216', '12', 16, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(835, '14.101', '1216', '12', 16, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(836, '17.051', '1216', '12', 16, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(837, '09.074', '1216', '12', 16, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(838, '14.072', '1216', '12', 16, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(839, '14.080', '1216', '12', 16, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(840, '14.089', '1216', '12', 16, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(841, '14.106', '1216', '12', 16, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(842, '17.093', '1217', '12', 17, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL);
INSERT INTO `pelajaran_nilai` (`id`, `nim`, `kode_pelajaran`, `kode_grade`, `id_pelajaran`, `wa_uts`, `quiz_uts`, `fmt_uts`, `uji_uts`, `pea_uts`, `n_p_uts`, `wa_uas`, `quiz_uas`, `fmt_uas`, `uji_uas`, `pea_uas`, `n_p_uas`, `proj_uts`, `pa_uts`, `porto_uts`, `kea_uts`, `n_k_uts`, `proj_uas`, `pa_uas`, `porto_uas`, `kea_uas`, `n_k_uas`, `na_uts`, `na_uas`, `tanggal`, `mutup_uts`, `mutup_uas`, `mutuk_uts`, `mutuk_uas`, `narasi_p_uas`, `narasi_k_uas`, `us_pengetahuan`, `us_praktek`, `us_na`, `finger`) VALUES
(843, '08.016', '1217', '12', 17, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(844, '08.002', '1217', '12', 17, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(845, '14.101', '1217', '12', 17, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(846, '17.051', '1217', '12', 17, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(847, '09.074', '1217', '12', 17, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(848, '14.072', '1217', '12', 17, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(849, '14.080', '1217', '12', 17, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(850, '14.089', '1217', '12', 17, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(851, '14.106', '1217', '12', 17, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(852, '17.093', '1242', '12', 42, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(853, '08.016', '1242', '12', 42, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(854, '08.002', '1242', '12', 42, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(855, '14.101', '1242', '12', 42, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(856, '17.051', '1242', '12', 42, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(857, '09.074', '1242', '12', 42, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(858, '14.072', '1242', '12', 42, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(859, '14.080', '1242', '12', 42, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(860, '14.089', '1242', '12', 42, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(861, '14.106', '1242', '12', 42, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(862, '14.074', '', '12', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(863, '15.027', '', '12', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(864, '09.070', '', '12', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(865, '11.042', '', '12', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(866, '17.049', '', '12', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(867, '14.079', '', '12', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(868, '14.099', '', '12', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(869, '17.048', '', '12', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(870, '08.013', '', '12', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(871, '14.102', '', '12', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(872, '14.074', '1216', '12', 16, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(873, '15.027', '1216', '12', 16, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(874, '09.070', '1216', '12', 16, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(875, '11.042', '1216', '12', 16, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(876, '17.049', '1216', '12', 16, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(877, '14.079', '1216', '12', 16, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(878, '14.099', '1216', '12', 16, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(879, '17.048', '1216', '12', 16, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(880, '08.013', '1216', '12', 16, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(881, '14.102', '1216', '12', 16, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(882, '14.074', '1217', '12', 17, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(883, '15.027', '1217', '12', 17, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(884, '09.070', '1217', '12', 17, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(885, '11.042', '1217', '12', 17, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(886, '17.049', '1217', '12', 17, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(887, '14.079', '1217', '12', 17, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(888, '14.099', '1217', '12', 17, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(889, '17.048', '1217', '12', 17, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(890, '08.013', '1217', '12', 17, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(891, '14.102', '1217', '12', 17, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(892, '14.074', '1242', '12', 42, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(893, '15.027', '1242', '12', 42, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(894, '09.070', '1242', '12', 42, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(895, '11.042', '1242', '12', 42, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(896, '17.049', '1242', '12', 42, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(897, '14.079', '1242', '12', 42, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(898, '14.099', '1242', '12', 42, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(899, '17.048', '1242', '12', 42, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(900, '08.013', '1242', '12', 42, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(901, '14.102', '1242', '12', 42, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(902, '14.076', '', '12', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(903, '14.096', '', '12', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(904, '14.076', '1216', '12', 16, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(905, '14.096', '1216', '12', 16, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(906, '14.076', '1217', '12', 17, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(907, '14.096', '1217', '12', 17, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(908, '14.076', '1242', '12', 42, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(909, '14.096', '1242', '12', 42, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(910, '08.017', '', '12', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(911, '14.104', '', '12', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(912, '08.003', '', '12', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(913, '18.071', '', '12', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(914, '14.093', '', '12', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(915, '14.092', '', '12', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(916, '14.078', '', '12', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(917, '17.050', '', '12', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(918, '17.063', '', '12', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(919, '08.017', '1216', '12', 16, 90.0, 90.0, 80.0, 76.0, NULL, 85.2, 0.0, 0.0, 0.0, 0.0, NULL, NULL, 0.0, 0.0, 0.0, NULL, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-07-12 07:50:44', 'B', NULL, 'D', NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(920, '14.104', '1216', '12', 16, 0.0, 0.0, 0.0, 0.0, NULL, 0.0, 0.0, 0.0, 0.0, 0.0, NULL, NULL, 0.0, 0.0, 0.0, NULL, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-07-12 07:50:44', 'D', NULL, 'D', NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(921, '08.003', '1216', '12', 16, 0.0, 0.0, 0.0, 0.0, NULL, 0.0, 0.0, 0.0, 0.0, 0.0, NULL, NULL, 0.0, 0.0, 0.0, NULL, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-07-12 07:50:44', 'D', NULL, 'D', NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(922, '18.071', '1216', '12', 16, 0.0, 0.0, 0.0, 0.0, NULL, 0.0, 0.0, 0.0, 0.0, 0.0, NULL, NULL, 0.0, 0.0, 0.0, NULL, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-07-12 07:50:44', 'D', NULL, 'D', NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(923, '14.093', '1216', '12', 16, 0.0, 0.0, 0.0, 0.0, NULL, 0.0, 0.0, 0.0, 0.0, 0.0, NULL, NULL, 0.0, 0.0, 0.0, NULL, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-07-12 07:50:44', 'D', NULL, 'D', NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(924, '14.092', '1216', '12', 16, 0.0, 0.0, 0.0, 0.0, NULL, 0.0, 0.0, 0.0, 0.0, 0.0, NULL, NULL, 0.0, 0.0, 0.0, NULL, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-07-12 07:50:44', 'D', NULL, 'D', NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(925, '14.078', '1216', '12', 16, 0.0, 0.0, 0.0, 0.0, NULL, 0.0, 0.0, 0.0, 0.0, 0.0, NULL, NULL, 0.0, 0.0, 0.0, NULL, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-07-12 07:50:44', 'D', NULL, 'D', NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(926, '17.050', '1216', '12', 16, 0.0, 0.0, 0.0, 0.0, NULL, 0.0, 0.0, 0.0, 0.0, 0.0, NULL, NULL, 0.0, 0.0, 0.0, NULL, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-07-12 07:50:44', 'D', NULL, 'D', NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(927, '17.063', '1216', '12', 16, 0.0, 0.0, 0.0, 0.0, NULL, 0.0, 0.0, 0.0, 0.0, 0.0, NULL, NULL, 0.0, 0.0, 0.0, NULL, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-07-12 07:50:44', 'D', NULL, 'D', NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(928, '08.017', '1217', '12', 17, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(929, '14.104', '1217', '12', 17, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(930, '08.003', '1217', '12', 17, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(931, '18.071', '1217', '12', 17, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(932, '14.093', '1217', '12', 17, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(933, '14.092', '1217', '12', 17, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(934, '14.078', '1217', '12', 17, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(935, '17.050', '1217', '12', 17, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(936, '17.063', '1217', '12', 17, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(937, '08.017', '1242', '12', 42, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(938, '14.104', '1242', '12', 42, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(939, '08.003', '1242', '12', 42, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(940, '18.071', '1242', '12', 42, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(941, '14.093', '1242', '12', 42, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(942, '14.092', '1242', '12', 42, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(943, '14.078', '1242', '12', 42, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(944, '17.050', '1242', '12', 42, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(945, '17.063', '1242', '12', 42, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(946, '14.073', '', '12', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(947, '17.094', '', '12', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(948, '14.097', '', '12', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(949, '08.012', '', '12', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(950, '14.100', '', '12', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(951, '08.025', '', '12', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(952, '14.073', '1216', '12', 16, 0.0, 0.0, 0.0, 0.0, NULL, 0.0, 0.0, 0.0, 0.0, 0.0, NULL, NULL, 0.0, 0.0, 0.0, NULL, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-07-12 07:50:44', 'D', NULL, 'D', NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(953, '17.094', '1216', '12', 16, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(954, '14.097', '1216', '12', 16, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(955, '08.012', '1216', '12', 16, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(956, '14.100', '1216', '12', 16, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(957, '08.025', '1216', '12', 16, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(958, '14.073', '1217', '12', 17, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(959, '17.094', '1217', '12', 17, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(960, '14.097', '1217', '12', 17, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(961, '08.012', '1217', '12', 17, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(962, '14.100', '1217', '12', 17, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(963, '08.025', '1217', '12', 17, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(964, '14.073', '1242', '12', 42, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(965, '17.094', '1242', '12', 42, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(966, '14.097', '1242', '12', 42, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(967, '08.012', '1242', '12', 42, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(968, '14.100', '1242', '12', 42, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(969, '08.025', '1242', '12', 42, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(970, '08.015', '', '12', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(971, '14.068', '', '12', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(972, '08.015', '1216', '12', 16, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(973, '14.068', '1216', '12', 16, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(974, '08.015', '1217', '12', 17, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(975, '14.068', '1217', '12', 17, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(976, '08.015', '1242', '12', 42, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(977, '14.068', '1242', '12', 42, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(978, '17.058', '', '12', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(979, '18.077', '', '12', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(980, '14.090', '', '12', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(981, '14.081', '', '12', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(982, '14.105', '', '12', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(983, '14.082', '', '12', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(984, '14.066', '', '12', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(985, '17.052', '', '12', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(986, '17.056', '', '12', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(987, '08.005', '', '12', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(988, '17.058', '1243', '12', 43, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(989, '18.077', '1243', '12', 43, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(990, '14.090', '1243', '12', 43, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(991, '14.081', '1243', '12', 43, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(992, '14.105', '1243', '12', 43, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(993, '14.082', '1243', '12', 43, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(994, '14.066', '1243', '12', 43, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(995, '17.052', '1243', '12', 43, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(996, '17.056', '1243', '12', 43, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(997, '08.005', '1243', '12', 43, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(998, '17.058', '1247', '12', 47, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(999, '18.077', '1247', '12', 47, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1000, '14.090', '1247', '12', 47, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1001, '14.081', '1247', '12', 47, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1002, '14.105', '1247', '12', 47, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1003, '14.082', '1247', '12', 47, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1004, '14.066', '1247', '12', 47, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1005, '17.052', '1247', '12', 47, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1006, '17.056', '1247', '12', 47, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1007, '08.005', '1247', '12', 47, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1008, '08.006', '', '12', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1009, '17.060', '', '12', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1010, '14.077', '', '12', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1011, '17.053', '', '12', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1012, '15.026', '', '12', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1013, '14.110', '', '12', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1014, '17.061', '', '12', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1015, '14.085', '', '12', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1016, '14.108', '', '12', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1017, '17.057', '', '12', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1018, '08.006', '1243', '12', 43, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1019, '17.060', '1243', '12', 43, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1020, '14.077', '1243', '12', 43, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1021, '17.053', '1243', '12', 43, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1022, '15.026', '1243', '12', 43, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1023, '14.110', '1243', '12', 43, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1024, '17.061', '1243', '12', 43, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1025, '14.085', '1243', '12', 43, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1026, '14.108', '1243', '12', 43, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1027, '17.057', '1243', '12', 43, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1028, '08.006', '1247', '12', 47, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1029, '17.060', '1247', '12', 47, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1030, '14.077', '1247', '12', 47, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1031, '17.053', '1247', '12', 47, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1032, '15.026', '1247', '12', 47, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1033, '14.110', '1247', '12', 47, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1034, '17.061', '1247', '12', 47, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1035, '14.085', '1247', '12', 47, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1036, '14.108', '1247', '12', 47, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1037, '17.057', '1247', '12', 47, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1038, '17.062', '', '12', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1039, '17.062', '1243', '12', 43, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1040, '17.062', '1247', '12', 47, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1041, '17.065', '', '12', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1042, '17.065', '1243', '12', 43, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1043, '17.065', '1247', '12', 47, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1044, '17.055', '', '12', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1045, '17.055', '1243', '12', 43, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1046, '17.055', '1247', '12', 47, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1047, '08.024', '', '12', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1048, '08.024', '1243', '12', 43, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1049, '08.024', '1247', '12', 47, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1050, '17.059', '', '12', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1051, '17.059', '1243', '12', 43, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1052, '17.059', '1247', '12', 47, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL);
INSERT INTO `pelajaran_nilai` (`id`, `nim`, `kode_pelajaran`, `kode_grade`, `id_pelajaran`, `wa_uts`, `quiz_uts`, `fmt_uts`, `uji_uts`, `pea_uts`, `n_p_uts`, `wa_uas`, `quiz_uas`, `fmt_uas`, `uji_uas`, `pea_uas`, `n_p_uas`, `proj_uts`, `pa_uts`, `porto_uts`, `kea_uts`, `n_k_uts`, `proj_uas`, `pa_uas`, `porto_uas`, `kea_uas`, `n_k_uas`, `na_uts`, `na_uas`, `tanggal`, `mutup_uts`, `mutup_uas`, `mutuk_uts`, `mutuk_uas`, `narasi_p_uas`, `narasi_k_uas`, `us_pengetahuan`, `us_praktek`, `us_na`, `finger`) VALUES
(1053, '17.054', '', '12', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1054, '17.054', '1243', '12', 43, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1055, '17.054', '1247', '12', 47, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1364, '18.031', '021', '02', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1057, '19.001', '0130', '01', 30, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1058, '19.001', '017', '01', 7, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1059, '19.001', '018', '01', 8, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1060, '19.001', '019', '01', 9, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1061, '19.001', '0115', '01', 15, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1062, '19.001', '0124', '01', 24, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1063, '19.001', '0125', '01', 25, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1064, '19.001', '0126', '01', 26, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1065, '19.002', '011', '01', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1066, '19.002', '0130', '01', 30, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1067, '19.002', '017', '01', 7, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1068, '19.002', '018', '01', 8, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1069, '19.002', '019', '01', 9, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1070, '19.002', '0115', '01', 15, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1071, '19.002', '0124', '01', 24, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1072, '19.002', '0125', '01', 25, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1073, '19.002', '0126', '01', 26, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1074, '19.003', '011', '01', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1075, '19.003', '0130', '01', 30, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1076, '19.003', '017', '01', 7, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1077, '19.003', '018', '01', 8, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1078, '19.003', '019', '01', 9, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1079, '19.003', '0115', '01', 15, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1080, '19.003', '0124', '01', 24, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1081, '19.003', '0125', '01', 25, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1082, '19.003', '0126', '01', 26, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1083, '19.004', '011', '01', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1084, '19.004', '0130', '01', 30, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1085, '19.004', '017', '01', 7, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1086, '19.004', '018', '01', 8, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1087, '19.004', '019', '01', 9, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1088, '19.004', '0115', '01', 15, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1089, '19.004', '0124', '01', 24, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1090, '19.004', '0125', '01', 25, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1091, '19.004', '0126', '01', 26, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1092, '19.005', '011', '01', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1093, '19.005', '0130', '01', 30, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1094, '19.005', '017', '01', 7, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1095, '19.005', '018', '01', 8, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1096, '19.005', '019', '01', 9, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1097, '19.005', '0115', '01', 15, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1098, '19.005', '0124', '01', 24, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1099, '19.005', '0125', '01', 25, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1100, '19.005', '0126', '01', 26, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1101, '19.006', '011', '01', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1102, '19.006', '0130', '01', 30, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1103, '19.006', '017', '01', 7, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1104, '19.006', '018', '01', 8, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1105, '19.006', '019', '01', 9, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1106, '19.006', '0115', '01', 15, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1107, '19.006', '0124', '01', 24, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1108, '19.006', '0125', '01', 25, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1109, '19.006', '0126', '01', 26, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1110, '19.007', '011', '01', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1111, '19.007', '0130', '01', 30, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1112, '19.007', '017', '01', 7, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1113, '19.007', '018', '01', 8, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1114, '19.007', '019', '01', 9, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1115, '19.007', '0115', '01', 15, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1116, '19.007', '0124', '01', 24, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1117, '19.007', '0125', '01', 25, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1118, '19.007', '0126', '01', 26, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1119, '19.009', '011', '01', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1120, '19.009', '0130', '01', 30, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1121, '19.009', '017', '01', 7, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1122, '19.009', '018', '01', 8, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1123, '19.009', '019', '01', 9, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1124, '19.009', '0115', '01', 15, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1125, '19.009', '0124', '01', 24, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1126, '19.009', '0125', '01', 25, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1127, '19.009', '0126', '01', 26, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1128, '19.010', '011', '01', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1129, '19.010', '0130', '01', 30, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1130, '19.010', '017', '01', 7, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1131, '19.010', '018', '01', 8, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1132, '19.010', '019', '01', 9, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1133, '19.010', '0115', '01', 15, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1134, '19.010', '0124', '01', 24, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1135, '19.010', '0125', '01', 25, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1136, '19.010', '0126', '01', 26, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1137, '19.011', '011', '01', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1138, '19.011', '0130', '01', 30, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1139, '19.011', '017', '01', 7, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1140, '19.011', '018', '01', 8, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1141, '19.011', '019', '01', 9, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1142, '19.011', '0115', '01', 15, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1143, '19.011', '0124', '01', 24, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1144, '19.011', '0125', '01', 25, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1145, '19.011', '0126', '01', 26, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1146, '19.012', '011', '01', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1147, '19.012', '0130', '01', 30, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1148, '19.012', '017', '01', 7, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1149, '19.012', '018', '01', 8, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1150, '19.012', '019', '01', 9, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1151, '19.012', '0115', '01', 15, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1152, '19.012', '0124', '01', 24, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1153, '19.012', '0125', '01', 25, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1154, '19.012', '0126', '01', 26, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1155, '19.013', '011', '01', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1156, '19.013', '0130', '01', 30, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1157, '19.013', '017', '01', 7, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1158, '19.013', '018', '01', 8, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1159, '19.013', '019', '01', 9, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1160, '19.013', '0115', '01', 15, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1161, '19.013', '0124', '01', 24, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1162, '19.013', '0125', '01', 25, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1163, '19.013', '0126', '01', 26, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1164, '19.014', '011', '01', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1165, '19.014', '0130', '01', 30, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1166, '19.014', '017', '01', 7, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1167, '19.014', '018', '01', 8, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1168, '19.014', '019', '01', 9, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1169, '19.014', '0115', '01', 15, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1170, '19.014', '0124', '01', 24, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1171, '19.014', '0125', '01', 25, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1172, '19.014', '0126', '01', 26, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1173, '19.015', '011', '01', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1174, '19.015', '0130', '01', 30, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1175, '19.015', '017', '01', 7, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1176, '19.015', '018', '01', 8, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1177, '19.015', '019', '01', 9, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1178, '19.015', '0115', '01', 15, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1179, '19.015', '0124', '01', 24, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1180, '19.015', '0125', '01', 25, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1181, '19.015', '0126', '01', 26, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1182, '19.016', '011', '01', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1183, '19.016', '0130', '01', 30, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1184, '19.016', '017', '01', 7, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1185, '19.016', '018', '01', 8, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1186, '19.016', '019', '01', 9, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1187, '19.016', '0115', '01', 15, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1188, '19.016', '0124', '01', 24, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1189, '19.016', '0125', '01', 25, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1190, '19.016', '0126', '01', 26, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1191, '19.017', '011', '01', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1192, '19.017', '0130', '01', 30, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1193, '19.017', '017', '01', 7, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1194, '19.017', '018', '01', 8, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1195, '19.017', '019', '01', 9, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1196, '19.017', '0115', '01', 15, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1197, '19.017', '0124', '01', 24, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1198, '19.017', '0125', '01', 25, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1199, '19.017', '0126', '01', 26, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1200, '19.018', '011', '01', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1201, '19.018', '0130', '01', 30, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1202, '19.018', '017', '01', 7, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1203, '19.018', '018', '01', 8, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1204, '19.018', '019', '01', 9, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1205, '19.018', '0115', '01', 15, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1206, '19.018', '0124', '01', 24, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1207, '19.018', '0125', '01', 25, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1208, '19.018', '0126', '01', 26, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1209, '19.019', '011', '01', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1210, '19.019', '0130', '01', 30, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1211, '19.019', '017', '01', 7, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1212, '19.019', '018', '01', 8, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1213, '19.019', '019', '01', 9, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1214, '19.019', '0115', '01', 15, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1215, '19.019', '0124', '01', 24, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1216, '19.019', '0125', '01', 25, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1217, '19.019', '0126', '01', 26, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1218, '19.020', '011', '01', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1219, '19.020', '0130', '01', 30, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1220, '19.020', '017', '01', 7, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1221, '19.020', '018', '01', 8, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1222, '19.020', '019', '01', 9, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1223, '19.020', '0115', '01', 15, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1224, '19.020', '0124', '01', 24, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1225, '19.020', '0125', '01', 25, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1226, '19.020', '0126', '01', 26, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1227, '19.021', '011', '01', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1228, '19.021', '0130', '01', 30, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1229, '19.021', '017', '01', 7, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1230, '19.021', '018', '01', 8, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1231, '19.021', '019', '01', 9, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1232, '19.021', '0115', '01', 15, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1233, '19.021', '0124', '01', 24, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1234, '19.021', '0125', '01', 25, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1235, '19.021', '0126', '01', 26, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1236, '19.022', '011', '01', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1237, '19.022', '0130', '01', 30, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1238, '19.022', '017', '01', 7, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1239, '19.022', '018', '01', 8, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1240, '19.022', '019', '01', 9, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1241, '19.022', '0115', '01', 15, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1242, '19.022', '0124', '01', 24, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1243, '19.022', '0125', '01', 25, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1244, '19.022', '0126', '01', 26, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1245, '19.023', '011', '01', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1246, '19.023', '0130', '01', 30, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1247, '19.023', '017', '01', 7, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1248, '19.023', '018', '01', 8, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1249, '19.023', '019', '01', 9, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1250, '19.023', '0115', '01', 15, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1251, '19.023', '0124', '01', 24, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1252, '19.023', '0125', '01', 25, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1253, '19.023', '0126', '01', 26, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1254, '19.024', '011', '01', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1255, '19.024', '0130', '01', 30, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1256, '19.024', '017', '01', 7, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1257, '19.024', '018', '01', 8, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1258, '19.024', '019', '01', 9, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1259, '19.024', '0115', '01', 15, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1260, '19.024', '0124', '01', 24, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1261, '19.024', '0125', '01', 25, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL);
INSERT INTO `pelajaran_nilai` (`id`, `nim`, `kode_pelajaran`, `kode_grade`, `id_pelajaran`, `wa_uts`, `quiz_uts`, `fmt_uts`, `uji_uts`, `pea_uts`, `n_p_uts`, `wa_uas`, `quiz_uas`, `fmt_uas`, `uji_uas`, `pea_uas`, `n_p_uas`, `proj_uts`, `pa_uts`, `porto_uts`, `kea_uts`, `n_k_uts`, `proj_uas`, `pa_uas`, `porto_uas`, `kea_uas`, `n_k_uas`, `na_uts`, `na_uas`, `tanggal`, `mutup_uts`, `mutup_uas`, `mutuk_uts`, `mutuk_uas`, `narasi_p_uas`, `narasi_k_uas`, `us_pengetahuan`, `us_praktek`, `us_na`, `finger`) VALUES
(1262, '19.024', '0126', '01', 26, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1263, '19.025', '011', '01', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1264, '19.025', '0130', '01', 30, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1265, '19.025', '017', '01', 7, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1266, '19.025', '018', '01', 8, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1267, '19.025', '019', '01', 9, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1268, '19.025', '0115', '01', 15, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1269, '19.025', '0124', '01', 24, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1270, '19.025', '0125', '01', 25, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1271, '19.025', '0126', '01', 26, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1272, '19.026', '011', '01', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1273, '19.026', '0130', '01', 30, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1274, '19.026', '017', '01', 7, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1275, '19.026', '018', '01', 8, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1276, '19.026', '019', '01', 9, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1277, '19.026', '0115', '01', 15, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1278, '19.026', '0124', '01', 24, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1279, '19.026', '0125', '01', 25, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1280, '19.026', '0126', '01', 26, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1281, '19.027', '011', '01', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1282, '19.027', '0130', '01', 30, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1283, '19.027', '017', '01', 7, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1284, '19.027', '018', '01', 8, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1285, '19.027', '019', '01', 9, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1286, '19.027', '0115', '01', 15, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1287, '19.027', '0124', '01', 24, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1288, '19.027', '0125', '01', 25, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1289, '19.027', '0126', '01', 26, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1290, '19.028', '011', '01', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1291, '19.028', '0130', '01', 30, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1292, '19.028', '017', '01', 7, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1293, '19.028', '018', '01', 8, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1294, '19.028', '019', '01', 9, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1295, '19.028', '0115', '01', 15, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1296, '19.028', '0124', '01', 24, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1297, '19.028', '0125', '01', 25, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1298, '19.028', '0126', '01', 26, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1299, '19.029', '011', '01', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1300, '19.029', '0130', '01', 30, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1301, '19.029', '017', '01', 7, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1302, '19.029', '018', '01', 8, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1303, '19.029', '019', '01', 9, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1304, '19.029', '0115', '01', 15, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1305, '19.029', '0124', '01', 24, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1306, '19.029', '0125', '01', 25, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1307, '19.029', '0126', '01', 26, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1308, '19.030', '011', '01', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1309, '19.030', '0130', '01', 30, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1310, '19.030', '017', '01', 7, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1311, '19.030', '018', '01', 8, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1312, '19.030', '019', '01', 9, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1313, '19.030', '0115', '01', 15, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1314, '19.030', '0124', '01', 24, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1315, '19.030', '0125', '01', 25, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1316, '19.030', '0126', '01', 26, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1317, '19.031', '011', '01', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1318, '19.031', '0130', '01', 30, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1319, '19.031', '017', '01', 7, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1320, '19.031', '018', '01', 8, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1321, '19.031', '019', '01', 9, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1322, '19.031', '0115', '01', 15, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1323, '19.031', '0124', '01', 24, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1324, '19.031', '0125', '01', 25, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1325, '19.031', '0126', '01', 26, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1326, '19.032', '011', '01', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1327, '19.032', '0130', '01', 30, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1328, '19.032', '017', '01', 7, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1329, '19.032', '018', '01', 8, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1330, '19.032', '019', '01', 9, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1331, '19.032', '0115', '01', 15, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1332, '19.032', '0124', '01', 24, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1333, '19.032', '0125', '01', 25, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1334, '19.032', '0126', '01', 26, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1335, '19.033', '011', '01', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1336, '19.033', '0130', '01', 30, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1337, '19.033', '017', '01', 7, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1338, '19.033', '018', '01', 8, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1339, '19.033', '019', '01', 9, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1340, '19.033', '0115', '01', 15, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1341, '19.033', '0124', '01', 24, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1342, '19.033', '0125', '01', 25, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1343, '19.033', '0126', '01', 26, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1344, '19.034', '011', '01', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1345, '19.034', '0130', '01', 30, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1346, '19.034', '017', '01', 7, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1347, '19.034', '018', '01', 8, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1348, '19.034', '019', '01', 9, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1349, '19.034', '0115', '01', 15, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1350, '19.034', '0124', '01', 24, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1351, '19.034', '0125', '01', 25, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1352, '19.034', '0126', '01', 26, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1353, '19.008', '011', '01', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1354, '19.008', '0130', '01', 30, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1355, '19.008', '017', '01', 7, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1356, '19.008', '018', '01', 8, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1357, '19.008', '019', '01', 9, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1358, '19.008', '0115', '01', 15, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1359, '19.008', '0124', '01', 24, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1360, '19.008', '0125', '01', 25, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1361, '19.008', '0126', '01', 26, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1363, '19.001', '013', '01', 3, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1365, '18.025', '021', '02', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1366, '18.026', '021', '02', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1367, '18.029', '021', '02', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1368, '18.016', '021', '02', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1369, '18.019', '022', '02', 2, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1370, '18.032', '021', '02', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1371, '18.024', '024', '02', 4, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1372, '18.011', '021', '02', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1373, '18.008', '021', '02', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1374, '18.009', '021', '02', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1398, '18.014', '021', '02', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1376, '18.013', '025', '02', 5, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1377, '18.006', '021', '02', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1378, '18.005', '021', '02', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1379, '18.007', '021', '02', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1380, '18.030', '021', '02', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1381, '18.021', '021', '02', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1382, '18.018', '021', '02', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1383, '18.023', '021', '02', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1384, '18.027', '021', '02', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1385, '18.017', '021', '02', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1386, '18.028', '021', '02', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1387, '18.022', '021', '02', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1388, '18.010', '021', '02', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1389, '18.015', '023', '02', 3, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1390, '18.001', '021', '02', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1391, '18.004', '021', '02', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1392, '18.020', '021', '02', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1393, '18.002', '021', '02', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1394, '18.003', '021', '02', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1395, '19.035', '021', '02', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1396, '17.018', '032', '03', 2, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1397, '17.017', '032', '03', 2, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1399, '18.014', '', '02', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1400, '18.014', '025', '02', 5, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1402, '17.004', '031', '03', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1403, '17.044', '031', '03', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1404, '17.006', '031', '03', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1405, '17.026', '031', '03', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1406, '17.032', '031', '03', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1407, '17.002', '031', '03', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1408, '17.022', '031', '03', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1409, '17.023', '031', '03', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1410, '17.014', '031', '03', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1411, '17.008', '031', '03', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1412, '17.038', '031', '03', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1413, '17.015', '031', '03', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1414, '17.010', '031', '03', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1415, '17.024', '031', '03', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1416, '17.041', '031', '03', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1417, '17.039', '031', '03', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1418, '17.043', '031', '03', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1419, '17.007', '031', '03', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1420, '17.037', '031', '03', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1421, '17.025', '031', '03', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1422, '17.027', '031', '03', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1423, '17.005', '031', '03', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1424, '17.031', '031', '03', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1425, '17.100', '031', '03', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1426, '17.035', '031', '03', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1427, '17.009', '031', '03', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1428, '17.033', '031', '03', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1429, '17.001', '031', '03', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1430, '17.019', '031', '03', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1431, '17.021', '031', '03', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1432, '17.020', '031', '03', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1433, '17.036', '031', '03', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1434, '17.013', '031', '03', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1435, '17.042', '031', '03', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1436, '17.011', '031', '03', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1437, '17.040', '031', '03', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1438, '19.036', '031', '03', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1439, '19.037', '031', '03', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1440, '16.020', '044', '04', 4, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1441, '16.025', '041', '04', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1442, '16.028', '041', '04', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1443, '16.014', '041', '04', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1444, '16.016', '041', '04', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1445, '16.015', '041', '04', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1446, '16.039', '041', '04', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1447, '16.023', '041', '04', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1448, '16.005', '041', '04', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1449, '16.007', '041', '04', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1450, '16.002', '041', '04', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1451, '16.003', '041', '04', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1452, '16.036', '041', '04', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1453, '16.011', '041', '04', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1454, '16.032', '041', '04', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1455, '16.001', '041', '04', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1456, '16.033', '041', '04', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1457, '16.008', '041', '04', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1458, '16.031', '041', '04', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1459, '16.004', '041', '04', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1460, '17.045', '041', '04', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1461, '16.029', '041', '04', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1462, '16.017', '041', '04', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1463, '16.018', '041', '04', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1464, '16.019', '041', '04', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1465, '16.026', '041', '04', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1466, '16.006', '041', '04', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1467, '16.037', '041', '04', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1468, '16.035', '041', '04', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1469, '16.112', '041', '04', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1470, '16.022', '041', '04', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1471, '16.027', '041', '04', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1472, '16.013', '041', '04', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1473, '16.012', '041', '04', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1474, '16.024', '041', '04', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1475, '19.038', '041', '04', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL);
INSERT INTO `pelajaran_nilai` (`id`, `nim`, `kode_pelajaran`, `kode_grade`, `id_pelajaran`, `wa_uts`, `quiz_uts`, `fmt_uts`, `uji_uts`, `pea_uts`, `n_p_uts`, `wa_uas`, `quiz_uas`, `fmt_uas`, `uji_uas`, `pea_uas`, `n_p_uas`, `proj_uts`, `pa_uts`, `porto_uts`, `kea_uts`, `n_k_uts`, `proj_uas`, `pa_uas`, `porto_uas`, `kea_uas`, `n_k_uas`, `na_uts`, `na_uas`, `tanggal`, `mutup_uts`, `mutup_uas`, `mutuk_uts`, `mutuk_uas`, `narasi_p_uas`, `narasi_k_uas`, `us_pengetahuan`, `us_praktek`, `us_na`, `finger`) VALUES
(1476, '15.109', '051', '05', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1477, '16.119', '051', '05', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1478, '15.083', '051', '05', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1479, '15.084', '051', '05', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1480, '18.035', '051', '05', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1481, '15.121', '051', '05', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1482, '15.101', '051', '05', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1483, '15.111', '051', '05', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1484, '15.117', '051', '05', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1485, '15.086', '051', '05', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1486, '15.095', '051', '05', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1487, '15.114', '051', '05', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1488, '15.077', '051', '05', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1489, '15.082', '051', '05', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1490, '15.102', '051', '05', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1491, '17.046', '051', '05', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1492, '15.106', '051', '05', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1493, '15.112', '051', '05', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1494, '15.115', '054', '05', 4, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1495, '15.120', '051', '05', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1496, '17.047', '053', '05', 3, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1497, '15.075', '051', '05', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1498, '15.103', '051', '05', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1499, '15.079', '051', '05', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1500, '15.098', '052', '05', 2, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1501, '15.090', '051', '05', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1502, '15.118', '051', '05', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1503, '15.088', '051', '05', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1504, '15.126', '051', '05', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1505, '15.105', '051', '05', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1506, '15.124', '051', '05', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1507, '18.036', '051', '05', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1508, '15.096', '051', '05', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1509, '15.080', '051', '05', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1510, '15.094', '051', '05', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1511, '15.099', '051', '05', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1512, '15.076', '051', '05', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1513, '15.093', '051', '05', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1514, '15.085', '051', '05', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1515, '15.110', '051', '05', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1516, '16.117', '051', '05', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1517, '15.092', '051', '05', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1518, '15.100', '051', '05', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1519, '15.097', '055', '05', 5, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1520, '15.081', '055', '05', 5, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1521, '15.108', '051', '05', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1522, '15.122', '051', '05', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1523, '15.119', '055', '05', 5, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1524, '15.116', '051', '05', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1525, '14.030', '061', '06', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1526, '14.051', '063', '06', 3, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1527, '17.102', '061', '06', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1528, '14.001', '061', '06', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1529, '14.026', '062', '06', 2, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1530, '14.018', '061', '06', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1531, '14.033', '061', '06', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1532, '14.037', '061', '06', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1533, '14.031', '061', '06', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1534, '18.072', '061', '06', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1535, '14.003', '061', '06', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1536, '17.101', '061', '06', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1537, '14.036', '061', '06', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1538, '14.050', '061', '06', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1539, '14.048', '061', '06', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1540, '14.019', '062', '06', 2, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1541, '14.029', '061', '06', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1542, '14.028', '061', '06', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1543, '14.046', '061', '06', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1544, '14.014', '061', '06', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1545, '14.006', '061', '06', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1546, '14.032', '061', '06', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1547, '14.034', '061', '06', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1548, '14.027', '061', '06', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1549, '14.009', '061', '06', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1550, '16.040', '061', '06', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1551, '14.044', '061', '06', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1552, '14.020', '061', '06', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1553, '14.043', '061', '06', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1554, '14.011', '061', '06', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1555, '14.045', '061', '06', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1556, '18.034', '061', '06', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1557, '14.016', '061', '06', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1558, '14.025', '061', '06', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1559, '16.118', '061', '06', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1560, '14.017', '061', '06', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1561, '14.041', '061', '06', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1562, '14.042', '061', '06', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1563, '14.023', '061', '06', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1564, '14.047', '061', '06', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1565, '14.007', '061', '06', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1566, '14.008', '061', '06', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1567, '14.005', '061', '06', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1568, '14.004', '061', '06', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1569, '14.002', '061', '06', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1570, '14.038', '061', '06', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1571, '14.039', '061', '06', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1572, '14.040', '061', '06', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1573, '14.049', '061', '06', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1574, '14.013', '061', '06', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1575, '14.015', '061', '06', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1576, '19.039', '061', '06', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1577, '19.040', '061', '06', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1578, '14.053', '075', '07', 5, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1579, '13.008', '075', '07', 5, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1580, '13.009', '071', '07', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1581, '13.052', '071', '07', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1582, '13.019', '071', '07', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1583, '14.052', '071', '07', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1584, '13.023', '071', '07', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1585, '13.013', '071', '07', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1586, '13.051', '071', '07', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1587, '13.053', '071', '07', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1588, '13.034', '071', '07', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1589, '13.050', '071', '07', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1590, '13.020', '071', '07', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1591, '13.014', '071', '07', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1592, '13.012', '071', '07', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1593, '13.016', '071', '07', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1594, '13.032', '073', '07', 3, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1595, '13.040', '073', '07', 3, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1596, '13.027', '071', '07', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1597, '13.005', '071', '07', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1598, '13.047', '071', '07', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1599, '13.001', '071', '07', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1600, '13.045', '071', '07', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1601, '13.029', '071', '07', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1602, '13.017', '071', '07', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1603, '16.113', '071', '07', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1604, '13.021', '071', '07', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1605, '13.038', '071', '07', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1606, '13.042', '071', '07', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1607, '13.044', '071', '07', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1608, '16.041', '071', '07', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1609, '19.060', '071', '07', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1610, '19.061', '071', '07', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1611, '19.062', '071', '07', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1612, '19.063', '071', '07', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1613, '19.064', '071', '07', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1614, '19.066', '071', '07', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1615, '19.067', '071', '07', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1616, '19.068', '071', '07', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1617, '18.044', '081', '08', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1618, '18.043', '086', '08', 6, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1619, '12.079', '081', '08', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1620, '12.063', '081', '08', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1621, '12.034', '085', '08', 5, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1622, '12.039', '081', '08', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1623, '18.065', '081', '08', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1624, '12.048', '083', '08', 3, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1625, '12.041', '081', '08', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1626, '13.057', '081', '08', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1627, '12.050', '081', '08', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1628, '18.045', '081', '08', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1629, '18.064', '081', '08', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1630, '14.160', '085', '08', 5, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1631, '14.165', '081', '08', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1632, '12.055', '081', '08', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1633, '18.070', '081', '08', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1634, '18.069', '081', '08', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1635, '18.046', '081', '08', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1636, '12.053', '081', '08', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1637, '18.041', '081', '08', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1638, '12.036', '081', '08', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1639, '12.045', '081', '08', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1640, '14.059', '081', '08', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1641, '12.065', '081', '08', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1642, '12.068', '081', '08', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1643, '12.052', '081', '08', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1644, '12.032', '081', '08', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1645, '12.037', '081', '08', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1646, '12.073', '081', '08', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1647, '18.067', '081', '08', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1648, '12.070', '081', '08', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1649, '18.039', '081', '08', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1650, '12.072', '081', '08', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1651, '18.040', '081', '08', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1652, '16.114', '081', '08', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1653, '18.074', '081', '08', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1654, '12.033', '081', '08', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1655, '15.138', '081', '08', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1656, '18.042', '084', '08', 4, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1657, '17.097', '081', '08', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1658, '12.067', '081', '08', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1659, '15.141', '081', '08', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1660, '16.109', '081', '08', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1661, '12.042', '081', '08', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1662, '12.060', '081', '08', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1663, '12.062', '081', '08', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1664, '12.054', '082', '08', 2, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1665, '12.071', '081', '08', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1666, '18.038', '081', '08', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1667, '12.061', '081', '08', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1668, '11.025', '0916', '09', 16, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1669, '11.025', '0917', '09', 17, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1670, '11.025', '0927', '09', 27, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1671, '11.025', '0928', '09', 28, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1672, '11.002', '0916', '09', 16, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1673, '11.002', '0917', '09', 17, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1674, '11.002', '0927', '09', 27, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1675, '11.002', '0928', '09', 28, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1676, '12.115', '0916', '09', 16, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1677, '12.115', '0917', '09', 17, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1678, '12.115', '0927', '09', 27, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1679, '12.115', '0928', '09', 28, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1680, '11.024', '0916', '09', 16, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1681, '11.024', '0917', '09', 17, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1682, '11.024', '0927', '09', 27, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1683, '11.024', '0928', '09', 28, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1684, '11.091', '0916', '09', 16, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1685, '11.091', '0917', '09', 17, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL);
INSERT INTO `pelajaran_nilai` (`id`, `nim`, `kode_pelajaran`, `kode_grade`, `id_pelajaran`, `wa_uts`, `quiz_uts`, `fmt_uts`, `uji_uts`, `pea_uts`, `n_p_uts`, `wa_uas`, `quiz_uas`, `fmt_uas`, `uji_uas`, `pea_uas`, `n_p_uas`, `proj_uts`, `pa_uts`, `porto_uts`, `kea_uts`, `n_k_uts`, `proj_uas`, `pa_uas`, `porto_uas`, `kea_uas`, `n_k_uas`, `na_uts`, `na_uas`, `tanggal`, `mutup_uts`, `mutup_uas`, `mutuk_uts`, `mutuk_uas`, `narasi_p_uas`, `narasi_k_uas`, `us_pengetahuan`, `us_praktek`, `us_na`, `finger`) VALUES
(1686, '11.091', '0927', '09', 27, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1687, '11.091', '0928', '09', 28, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1688, '17.083', '0916', '09', 16, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1689, '17.083', '0917', '09', 17, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1690, '17.083', '0927', '09', 27, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1691, '17.083', '0928', '09', 28, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1692, '11.018', '0916', '09', 16, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1693, '11.018', '0917', '09', 17, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1694, '11.018', '0927', '09', 27, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1695, '11.018', '0928', '09', 28, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1696, '11.019', '0916', '09', 16, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1697, '11.019', '0917', '09', 17, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1698, '11.019', '0927', '09', 27, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1699, '11.019', '0928', '09', 28, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1700, '17.086', '0916', '09', 16, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1701, '17.086', '0917', '09', 17, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1702, '17.086', '0927', '09', 27, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1703, '17.086', '0928', '09', 28, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1704, '17.099', '0916', '09', 16, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1705, '17.099', '0917', '09', 17, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1706, '17.099', '0927', '09', 27, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1707, '17.099', '0928', '09', 28, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1708, '17.079', '0916', '09', 16, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1709, '17.079', '0917', '09', 17, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1710, '17.079', '0927', '09', 27, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1711, '17.079', '0928', '09', 28, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1712, '17.074', '0916', '09', 16, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1713, '17.074', '0917', '09', 17, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1714, '17.074', '0927', '09', 27, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1715, '17.074', '0928', '09', 28, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1716, '17.090', '0916', '09', 16, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1717, '17.090', '0917', '09', 17, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1718, '17.090', '0927', '09', 27, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1719, '17.090', '0928', '09', 28, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1720, '17.073', '0916', '09', 16, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1721, '17.073', '0917', '09', 17, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1722, '17.073', '0927', '09', 27, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1723, '17.073', '0928', '09', 28, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1724, '11.009', '0916', '09', 16, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1725, '11.009', '0917', '09', 17, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1726, '11.009', '0927', '09', 27, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1727, '11.009', '0928', '09', 28, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1728, '17.084', '0916', '09', 16, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1729, '17.084', '0917', '09', 17, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1730, '17.084', '0927', '09', 27, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1731, '17.084', '0928', '09', 28, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1732, '17.072', '0916', '09', 16, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1733, '17.072', '0917', '09', 17, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1734, '17.072', '0927', '09', 27, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1735, '17.072', '0928', '09', 28, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1736, '16.116', '0916', '09', 16, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1737, '16.116', '0917', '09', 17, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1738, '16.116', '0927', '09', 27, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1739, '16.116', '0928', '09', 28, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1740, '17.082', '0916', '09', 16, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1741, '17.082', '0917', '09', 17, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1742, '17.082', '0927', '09', 27, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1743, '17.082', '0928', '09', 28, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1744, '17.071', '0916', '09', 16, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1745, '17.071', '0917', '09', 17, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1746, '17.071', '0927', '09', 27, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1747, '17.071', '0928', '09', 28, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1748, '11.003', '0916', '09', 16, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1749, '11.003', '0917', '09', 17, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1750, '11.003', '0927', '09', 27, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1751, '11.003', '0928', '09', 28, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1752, '11.016', '0916', '09', 16, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1753, '11.016', '0917', '09', 17, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1754, '11.016', '0927', '09', 27, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1755, '11.016', '0928', '09', 28, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1756, '11.027', '0916', '09', 16, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1757, '11.027', '0917', '09', 17, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1758, '11.027', '0927', '09', 27, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1759, '11.027', '0928', '09', 28, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1760, '11.001', '0916', '09', 16, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1761, '11.001', '0917', '09', 17, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1762, '11.001', '0927', '09', 27, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1763, '11.001', '0928', '09', 28, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1764, '11.013', '0916', '09', 16, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1765, '11.013', '0917', '09', 17, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1766, '11.013', '0927', '09', 27, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1767, '11.013', '0928', '09', 28, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1768, '17.081', '0916', '09', 16, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1769, '17.081', '0917', '09', 17, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1770, '17.081', '0927', '09', 27, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1771, '17.081', '0928', '09', 28, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1772, '11.008', '0916', '09', 16, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1773, '11.008', '0917', '09', 17, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1774, '11.008', '0927', '09', 27, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1775, '11.008', '0928', '09', 28, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1776, '13.064', '0916', '09', 16, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1777, '13.064', '0917', '09', 17, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1778, '13.064', '0927', '09', 27, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1779, '13.064', '0928', '09', 28, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1780, '14.060', '0916', '09', 16, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1781, '14.060', '0917', '09', 17, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1782, '14.060', '0927', '09', 27, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1783, '14.060', '0928', '09', 28, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1784, '17.091', '0916', '09', 16, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1785, '17.091', '0917', '09', 17, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1786, '17.091', '0927', '09', 27, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1787, '17.091', '0928', '09', 28, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1788, '11.047', '0916', '09', 16, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1789, '11.047', '0917', '09', 17, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1790, '11.047', '0927', '09', 27, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1791, '11.047', '0928', '09', 28, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1792, '17.088', '0916', '09', 16, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1793, '17.088', '0917', '09', 17, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1794, '17.088', '0927', '09', 27, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1795, '17.088', '0928', '09', 28, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1796, '17.075', '0916', '09', 16, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1797, '17.075', '0917', '09', 17, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1798, '17.075', '0927', '09', 27, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1799, '17.075', '0928', '09', 28, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1800, '17.078', '0916', '09', 16, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1801, '17.078', '0917', '09', 17, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1802, '17.078', '0927', '09', 27, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1803, '17.078', '0928', '09', 28, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1804, '17.069', '0916', '09', 16, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1805, '17.069', '0917', '09', 17, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1806, '17.069', '0927', '09', 27, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1807, '17.069', '0928', '09', 28, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1808, '11.004', '0916', '09', 16, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1809, '11.004', '0917', '09', 17, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1810, '11.004', '0927', '09', 27, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1811, '11.004', '0928', '09', 28, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1812, '11.026', '0916', '09', 16, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1813, '11.026', '0917', '09', 17, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1814, '11.026', '0927', '09', 27, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1815, '11.026', '0928', '09', 28, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1816, '11.028', '0916', '09', 16, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1817, '11.028', '0917', '09', 17, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1818, '11.028', '0927', '09', 27, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1819, '11.028', '0928', '09', 28, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1820, '17.070', '0916', '09', 16, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1821, '17.070', '0917', '09', 17, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1822, '17.070', '0927', '09', 27, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1823, '17.070', '0928', '09', 28, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1824, '11.023', '0916', '09', 16, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1825, '11.023', '0917', '09', 17, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1826, '11.023', '0927', '09', 27, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1827, '11.023', '0928', '09', 28, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1828, '11.015', '0916', '09', 16, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1829, '11.015', '0917', '09', 17, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1830, '11.015', '0927', '09', 27, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1831, '11.015', '0928', '09', 28, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1832, '11.014', '0916', '09', 16, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1833, '11.014', '0917', '09', 17, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1834, '11.014', '0927', '09', 27, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1835, '11.014', '0928', '09', 28, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1836, '17.076', '0916', '09', 16, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1837, '17.076', '0917', '09', 17, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1838, '17.076', '0927', '09', 27, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1839, '17.076', '0928', '09', 28, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1840, '12.133', '0916', '09', 16, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1841, '12.133', '0917', '09', 17, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1842, '12.133', '0927', '09', 27, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1843, '12.133', '0928', '09', 28, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1844, '17.077', '0916', '09', 16, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1845, '17.077', '0917', '09', 17, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1846, '17.077', '0927', '09', 27, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1847, '17.077', '0928', '09', 28, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1848, '17.092', '0916', '09', 16, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1849, '17.092', '0917', '09', 17, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1850, '17.092', '0927', '09', 27, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1851, '17.092', '0928', '09', 28, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1852, '11.021', '0916', '09', 16, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1853, '11.021', '0917', '09', 17, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1854, '11.021', '0927', '09', 27, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1855, '11.021', '0928', '09', 28, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1856, '17.089', '0916', '09', 16, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1857, '17.089', '0917', '09', 17, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1858, '17.089', '0927', '09', 27, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1859, '17.089', '0928', '09', 28, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1860, '11.095', '0916', '09', 16, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1861, '11.095', '0917', '09', 17, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1862, '11.095', '0927', '09', 27, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1863, '11.095', '0928', '09', 28, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1864, '18.075', '0916', '09', 16, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1865, '18.075', '0917', '09', 17, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1866, '18.075', '0927', '09', 27, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1867, '18.075', '0928', '09', 28, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1868, '18.066', '0916', '09', 16, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1869, '18.066', '0917', '09', 17, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1870, '18.066', '0927', '09', 27, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1871, '18.066', '0928', '09', 28, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1872, '11.025', '091', '09', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1873, '11.002', '092', '09', 2, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1874, '12.115', '091', '09', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1875, '11.024', '091', '09', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1876, '11.091', '091', '09', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1877, '17.083', '093', '09', 3, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1878, '11.018', '091', '09', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1879, '11.019', '091', '09', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1880, '17.086', '091', '09', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1881, '17.099', '091', '09', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1882, '17.079', '091', '09', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1883, '17.074', '091', '09', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1884, '17.090', '091', '09', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1885, '17.073', '091', '09', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1886, '11.009', '091', '09', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1887, '17.084', '093', '09', 3, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1888, '17.072', '091', '09', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1889, '16.116', '091', '09', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1890, '17.082', '091', '09', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1891, '17.071', '091', '09', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1892, '11.003', '091', '09', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1893, '11.016', '091', '09', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1894, '11.027', '091', '09', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL);
INSERT INTO `pelajaran_nilai` (`id`, `nim`, `kode_pelajaran`, `kode_grade`, `id_pelajaran`, `wa_uts`, `quiz_uts`, `fmt_uts`, `uji_uts`, `pea_uts`, `n_p_uts`, `wa_uas`, `quiz_uas`, `fmt_uas`, `uji_uas`, `pea_uas`, `n_p_uas`, `proj_uts`, `pa_uts`, `porto_uts`, `kea_uts`, `n_k_uts`, `proj_uas`, `pa_uas`, `porto_uas`, `kea_uas`, `n_k_uas`, `na_uts`, `na_uas`, `tanggal`, `mutup_uts`, `mutup_uas`, `mutuk_uts`, `mutuk_uas`, `narasi_p_uas`, `narasi_k_uas`, `us_pengetahuan`, `us_praktek`, `us_na`, `finger`) VALUES
(1895, '11.001', '091', '09', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1896, '11.013', '091', '09', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1897, '17.081', '091', '09', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1898, '11.008', '091', '09', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1899, '13.064', '091', '09', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1900, '14.060', '091', '09', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1901, '17.091', '091', '09', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1902, '11.047', '091', '09', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1903, '17.088', '091', '09', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1904, '17.075', '091', '09', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1905, '17.078', '094', '09', 4, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1906, '17.069', '091', '09', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1907, '11.004', '091', '09', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1908, '11.026', '091', '09', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1909, '11.028', '091', '09', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1910, '17.070', '091', '09', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1911, '11.023', '091', '09', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1912, '11.015', '091', '09', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1913, '11.014', '091', '09', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1914, '17.076', '096', '09', 6, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1915, '12.133', '096', '09', 6, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1916, '17.077', '095', '09', 5, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1917, '17.092', '091', '09', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1918, '11.021', '091', '09', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1919, '17.089', '091', '09', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1920, '11.095', '091', '09', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1921, '18.075', '091', '09', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1922, '18.066', '091', '09', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1923, '11.036', '101', '10', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1924, '10.025', '101', '10', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1925, '16.056', '101', '10', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1926, '16.047', '101', '10', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1927, '10.085', '101', '10', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1928, '10.019', '101', '10', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1929, '16.050', '101', '10', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1930, '10.003', '101', '10', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1931, '10.015', '103', '10', 3, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1932, '16.049', '101', '10', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1933, '10.002', '101', '10', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1934, '16.052', '102', '10', 2, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1935, '12.142', '101', '10', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1936, '10.018', '101', '10', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1937, '10.023', '101', '10', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1938, '16.044', '101', '10', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1939, '16.043', '101', '10', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1940, '17.066', '101', '10', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1941, '10.008', '101', '10', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1942, '16.054', '101', '10', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1943, '10.006', '101', '10', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1944, '12.116', '101', '10', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1945, '17.098', '101', '10', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1946, '14.164', '101', '10', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1947, '10.020', '101', '10', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1948, '10.010', '101', '10', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1949, '11.034', '101', '10', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1950, '16.059', '101', '10', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1951, '12.136', '101', '10', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1952, '16.055', '101', '10', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1953, '10.053', '101', '10', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1954, '16.057', '101', '10', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1955, '19.041', '101', '10', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1956, '19.042', '101', '10', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1957, '19.043', '101', '10', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1958, '19.044', '101', '10', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1959, '19.045', '101', '10', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1960, '19.046', '103', '10', 3, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1961, '19.053', '101', '10', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1962, '19.052', '101', '10', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1963, '19.051', '101', '10', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1964, '19.050', '101', '10', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1965, '19.049', '102', '10', 2, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1966, '19.048', '101', '10', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1967, '19.047', '101', '10', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1968, '19.054', '101', '10', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1969, '19.055', '101', '10', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1970, '19.056', '101', '10', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1971, '19.057', '101', '10', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1972, '19.058', '101', '10', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1973, '19.059', '101', '10', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1974, '18.054', '111', '11', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1975, '18.076', '111', '11', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1976, '15.017', '111', '11', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1977, '16.060', '112', '11', 2, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1978, '15.014', '111', '11', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1979, '18.058', '111', '11', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1980, '15.022', '111', '11', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1981, '15.023', '111', '11', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1982, '18.056', '111', '11', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1983, '15.005', '111', '11', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1984, '18.057', '111', '11', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1985, '15.020', '111', '11', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1986, '09.015', '111', '11', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1987, '09.033', '111', '11', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1988, '09.037', '111', '11', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1989, '09.032', '111', '11', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1990, '09.035', '111', '11', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1991, '09.019', '111', '11', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1992, '15.007', '111', '11', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1993, '15.006', '111', '11', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1994, '18.055', '114', '11', 4, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1995, '15.019', '111', '11', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1996, '18.047', '111', '11', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1997, '17.068', '111', '11', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1998, '18.073', '111', '11', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(1999, '15.004', '111', '11', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(2000, '18.049', '111', '11', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(2001, '11.040', '111', '11', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(2002, '18.060', '111', '11', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(2003, '09.018', '112', '11', 2, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(2004, '18.051', '111', '11', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(2005, '17.049', '124', '12', 4, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(2006, '14.076', '124', '12', 4, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(2007, '18.077', '123', '12', 3, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(2008, '17.052', '123', '12', 3, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(2009, '14.077', '125', '12', 5, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(2010, '14.053', '0721', '07', 21, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(2011, '14.053', '077', '07', 7, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(2012, '14.053', '078', '07', 8, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(2013, '14.053', '0715', '07', 15, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(2014, '14.053', '0723', '07', 23, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(2015, '14.053', '0760', '07', 60, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(2016, '13.008', '0721', '07', 21, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(2017, '13.008', '077', '07', 7, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(2018, '13.008', '078', '07', 8, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(2019, '13.008', '0715', '07', 15, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(2020, '13.008', '0723', '07', 23, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(2021, '13.008', '0760', '07', 60, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(2022, '13.009', '0721', '07', 21, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(2023, '13.009', '077', '07', 7, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(2024, '13.009', '078', '07', 8, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(2025, '13.009', '0715', '07', 15, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(2026, '13.009', '0723', '07', 23, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(2027, '13.009', '0760', '07', 60, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(2028, '13.052', '0721', '07', 21, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(2029, '13.052', '077', '07', 7, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(2030, '13.052', '078', '07', 8, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(2031, '13.052', '0715', '07', 15, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(2032, '13.052', '0723', '07', 23, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(2033, '13.052', '0760', '07', 60, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(2034, '13.019', '0721', '07', 21, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(2035, '13.019', '077', '07', 7, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(2036, '13.019', '078', '07', 8, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(2037, '13.019', '0715', '07', 15, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(2038, '13.019', '0723', '07', 23, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(2039, '13.019', '0760', '07', 60, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(2040, '14.052', '0721', '07', 21, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(2041, '14.052', '077', '07', 7, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(2042, '14.052', '078', '07', 8, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(2043, '14.052', '0715', '07', 15, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(2044, '14.052', '0723', '07', 23, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(2045, '14.052', '0760', '07', 60, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(2046, '13.023', '0721', '07', 21, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(2047, '13.023', '077', '07', 7, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(2048, '13.023', '078', '07', 8, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(2049, '13.023', '0715', '07', 15, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(2050, '13.023', '0723', '07', 23, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(2051, '13.023', '0760', '07', 60, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(2052, '13.013', '0721', '07', 21, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(2053, '13.013', '077', '07', 7, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(2054, '13.013', '078', '07', 8, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(2055, '13.013', '0715', '07', 15, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(2056, '13.013', '0723', '07', 23, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(2057, '13.013', '0760', '07', 60, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(2058, '13.051', '0721', '07', 21, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(2059, '13.051', '077', '07', 7, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(2060, '13.051', '078', '07', 8, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(2061, '13.051', '0715', '07', 15, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(2062, '13.051', '0723', '07', 23, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(2063, '13.051', '0760', '07', 60, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(2064, '13.053', '0721', '07', 21, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(2065, '13.053', '077', '07', 7, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(2066, '13.053', '078', '07', 8, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(2067, '13.053', '0715', '07', 15, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(2068, '13.053', '0723', '07', 23, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(2069, '13.053', '0760', '07', 60, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(2070, '13.034', '0721', '07', 21, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(2071, '13.034', '077', '07', 7, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(2072, '13.034', '078', '07', 8, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(2073, '13.034', '0715', '07', 15, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(2074, '13.034', '0723', '07', 23, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(2075, '13.034', '0760', '07', 60, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(2076, '13.050', '0721', '07', 21, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(2077, '13.050', '077', '07', 7, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(2078, '13.050', '078', '07', 8, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(2079, '13.050', '0715', '07', 15, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(2080, '13.050', '0723', '07', 23, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(2081, '13.050', '0760', '07', 60, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(2082, '13.020', '0721', '07', 21, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(2083, '13.020', '077', '07', 7, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(2084, '13.020', '078', '07', 8, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(2085, '13.020', '0715', '07', 15, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(2086, '13.020', '0723', '07', 23, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(2087, '13.020', '0760', '07', 60, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(2088, '13.014', '0721', '07', 21, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(2089, '13.014', '077', '07', 7, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(2090, '13.014', '078', '07', 8, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(2091, '13.014', '0715', '07', 15, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(2092, '13.014', '0723', '07', 23, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(2093, '13.014', '0760', '07', 60, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(2094, '13.012', '0721', '07', 21, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(2095, '13.012', '077', '07', 7, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(2096, '13.012', '078', '07', 8, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(2097, '13.012', '0715', '07', 15, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(2098, '13.012', '0723', '07', 23, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(2099, '13.012', '0760', '07', 60, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(2100, '13.016', '0721', '07', 21, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(2101, '13.016', '077', '07', 7, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(2102, '13.016', '078', '07', 8, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(2103, '13.016', '0715', '07', 15, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(2104, '13.016', '0723', '07', 23, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL);
INSERT INTO `pelajaran_nilai` (`id`, `nim`, `kode_pelajaran`, `kode_grade`, `id_pelajaran`, `wa_uts`, `quiz_uts`, `fmt_uts`, `uji_uts`, `pea_uts`, `n_p_uts`, `wa_uas`, `quiz_uas`, `fmt_uas`, `uji_uas`, `pea_uas`, `n_p_uas`, `proj_uts`, `pa_uts`, `porto_uts`, `kea_uts`, `n_k_uts`, `proj_uas`, `pa_uas`, `porto_uas`, `kea_uas`, `n_k_uas`, `na_uts`, `na_uas`, `tanggal`, `mutup_uts`, `mutup_uas`, `mutuk_uts`, `mutuk_uas`, `narasi_p_uas`, `narasi_k_uas`, `us_pengetahuan`, `us_praktek`, `us_na`, `finger`) VALUES
(2105, '13.016', '0760', '07', 60, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(2106, '13.032', '0721', '07', 21, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(2107, '13.032', '077', '07', 7, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(2108, '13.032', '078', '07', 8, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(2109, '13.032', '0715', '07', 15, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(2110, '13.032', '0723', '07', 23, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(2111, '13.032', '0760', '07', 60, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(2112, '13.040', '0721', '07', 21, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(2113, '13.040', '077', '07', 7, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(2114, '13.040', '078', '07', 8, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(2115, '13.040', '0715', '07', 15, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(2116, '13.040', '0723', '07', 23, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(2117, '13.040', '0760', '07', 60, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(2118, '13.027', '0721', '07', 21, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(2119, '13.027', '077', '07', 7, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(2120, '13.027', '078', '07', 8, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(2121, '13.027', '0715', '07', 15, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(2122, '13.027', '0723', '07', 23, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(2123, '13.027', '0760', '07', 60, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(2124, '13.005', '0721', '07', 21, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(2125, '13.005', '077', '07', 7, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(2126, '13.005', '078', '07', 8, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(2127, '13.005', '0715', '07', 15, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(2128, '13.005', '0723', '07', 23, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(2129, '13.005', '0760', '07', 60, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(2130, '13.047', '0721', '07', 21, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(2131, '13.047', '077', '07', 7, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(2132, '13.047', '078', '07', 8, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(2133, '13.047', '0715', '07', 15, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(2134, '13.047', '0723', '07', 23, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(2135, '13.047', '0760', '07', 60, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(2136, '13.001', '0721', '07', 21, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(2137, '13.001', '077', '07', 7, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(2138, '13.001', '078', '07', 8, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(2139, '13.001', '0715', '07', 15, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(2140, '13.001', '0723', '07', 23, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(2141, '13.001', '0760', '07', 60, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(2142, '13.045', '0721', '07', 21, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(2143, '13.045', '077', '07', 7, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(2144, '13.045', '078', '07', 8, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(2145, '13.045', '0715', '07', 15, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(2146, '13.045', '0723', '07', 23, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(2147, '13.045', '0760', '07', 60, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(2148, '13.029', '0721', '07', 21, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(2149, '13.029', '077', '07', 7, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(2150, '13.029', '078', '07', 8, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(2151, '13.029', '0715', '07', 15, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(2152, '13.029', '0723', '07', 23, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(2153, '13.029', '0760', '07', 60, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(2154, '13.017', '0721', '07', 21, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(2155, '13.017', '077', '07', 7, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(2156, '13.017', '078', '07', 8, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(2157, '13.017', '0715', '07', 15, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(2158, '13.017', '0723', '07', 23, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(2159, '13.017', '0760', '07', 60, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(2160, '16.113', '0721', '07', 21, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(2161, '16.113', '077', '07', 7, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(2162, '16.113', '078', '07', 8, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(2163, '16.113', '0715', '07', 15, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(2164, '16.113', '0723', '07', 23, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(2165, '16.113', '0760', '07', 60, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(2166, '13.021', '0721', '07', 21, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(2167, '13.021', '077', '07', 7, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(2168, '13.021', '078', '07', 8, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(2169, '13.021', '0715', '07', 15, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(2170, '13.021', '0723', '07', 23, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(2171, '13.021', '0760', '07', 60, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(2172, '13.038', '0721', '07', 21, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(2173, '13.038', '077', '07', 7, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(2174, '13.038', '078', '07', 8, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(2175, '13.038', '0715', '07', 15, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(2176, '13.038', '0723', '07', 23, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(2177, '13.038', '0760', '07', 60, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(2178, '13.042', '0721', '07', 21, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(2179, '13.042', '077', '07', 7, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(2180, '13.042', '078', '07', 8, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(2181, '13.042', '0715', '07', 15, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(2182, '13.042', '0723', '07', 23, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(2183, '13.042', '0760', '07', 60, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(2184, '13.044', '0721', '07', 21, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(2185, '13.044', '077', '07', 7, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(2186, '13.044', '078', '07', 8, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(2187, '13.044', '0715', '07', 15, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(2188, '13.044', '0723', '07', 23, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(2189, '13.044', '0760', '07', 60, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(2190, '16.041', '0721', '07', 21, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(2191, '16.041', '077', '07', 7, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(2192, '16.041', '078', '07', 8, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(2193, '16.041', '0715', '07', 15, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(2194, '16.041', '0723', '07', 23, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(2195, '16.041', '0760', '07', 60, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(2196, '19.060', '0721', '07', 21, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(2197, '19.060', '077', '07', 7, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(2198, '19.060', '078', '07', 8, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(2199, '19.060', '0715', '07', 15, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(2200, '19.060', '0723', '07', 23, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(2201, '19.060', '0760', '07', 60, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(2202, '19.061', '0721', '07', 21, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(2203, '19.061', '077', '07', 7, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(2204, '19.061', '078', '07', 8, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(2205, '19.061', '0715', '07', 15, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(2206, '19.061', '0723', '07', 23, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(2207, '19.061', '0760', '07', 60, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(2208, '19.062', '0721', '07', 21, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(2209, '19.062', '077', '07', 7, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(2210, '19.062', '078', '07', 8, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(2211, '19.062', '0715', '07', 15, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(2212, '19.062', '0723', '07', 23, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(2213, '19.062', '0760', '07', 60, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(2214, '19.063', '0721', '07', 21, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(2215, '19.063', '077', '07', 7, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(2216, '19.063', '078', '07', 8, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(2217, '19.063', '0715', '07', 15, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(2218, '19.063', '0723', '07', 23, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(2219, '19.063', '0760', '07', 60, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(2220, '19.064', '0721', '07', 21, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(2221, '19.064', '077', '07', 7, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(2222, '19.064', '078', '07', 8, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(2223, '19.064', '0715', '07', 15, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(2224, '19.064', '0723', '07', 23, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(2225, '19.064', '0760', '07', 60, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(2226, '19.066', '0721', '07', 21, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(2227, '19.066', '077', '07', 7, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(2228, '19.066', '078', '07', 8, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(2229, '19.066', '0715', '07', 15, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(2230, '19.066', '0723', '07', 23, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(2231, '19.066', '0760', '07', 60, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(2232, '19.067', '0721', '07', 21, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(2233, '19.067', '077', '07', 7, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(2234, '19.067', '078', '07', 8, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(2235, '19.067', '0715', '07', 15, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(2236, '19.067', '0723', '07', 23, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(2237, '19.067', '0760', '07', 60, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(2238, '19.068', '0721', '07', 21, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(2239, '19.068', '077', '07', 7, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(2240, '19.068', '078', '07', 8, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(2241, '19.068', '0715', '07', 15, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(2242, '19.068', '0723', '07', 23, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL),
(2243, '19.068', '0760', '07', 60, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, 0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, 0.0, 0.0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `pelajaran_nilai_konversi`
--

CREATE TABLE IF NOT EXISTS `pelajaran_nilai_konversi` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_jenjang` int(3) NOT NULL,
  `min` float(4,1) NOT NULL,
  `max` float(4,1) NOT NULL,
  `na` varchar(5) NOT NULL,
  `mutu` varchar(5) NOT NULL,
  `ket1` varchar(50) NOT NULL,
  `ket2` varchar(30) NOT NULL,
  `pnarasi_ina` varchar(350) NOT NULL,
  `pnarasi_eng` varchar(350) NOT NULL,
  `knarasi_ina` varchar(350) NOT NULL,
  `knarasi_eng` varchar(350) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=16 ;

--
-- Dumping data for table `pelajaran_nilai_konversi`
--

INSERT INTO `pelajaran_nilai_konversi` (`id`, `id_jenjang`, `min`, `max`, `na`, `mutu`, `ket1`, `ket2`, `pnarasi_ina`, `pnarasi_eng`, `knarasi_ina`, `knarasi_eng`) VALUES
(1, 3, 0.0, 75.4, '1', 'D', '<b>Kurang</b>/<i>Poor</i>', 'x < 75.5', '', '', '', ''),
(2, 3, 75.5, 79.4, '1.33', 'C', '<b>Cukup</b>/<i>Fair</i>', '75.5 <= x < 79.5', '', '', '', ''),
(3, 3, 79.5, 89.4, '1.66', 'B', '<b>Baik</b>/<i>Good</i>', '79.5 <= x <89.5', '', '', '', ''),
(4, 3, 89.5, 100.0, '2', 'A', '<b>Sangat Baik</b>/<i>Very Good</i>', '89.5 <= x <=100', 'Hallo ini konten pengetahuan SMA', '', '', ''),
(5, 2, 0.0, 75.4, '1', 'D', '<b>Kurang</b>/<i>Poor</i>', 'x < 75.5', '', '', '', ''),
(6, 2, 75.5, 79.4, '1.33', 'C', '<b>Cukup</b>/<i>Fair</i>', '75.5 <= x < 79.5', '', '', '', ''),
(7, 2, 79.5, 89.4, '1.66', 'B', '<b>Baik</b>/<i>Good</i>', '79.5 <= x <89.5', '', '', '', ''),
(8, 2, 89.5, 100.0, '2', 'A', '<b>Sangat Baik</b>/<i>Very Good</i>', '89.5 <= x <=100', 'Hallo ini konten pengetahuan SMP', '', '', ''),
(12, 1, 0.0, 75.4, '1', 'D', '<b>Kurang</b>/<i>Poor</i>', 'x < 75.5', '', '', '', ''),
(13, 1, 75.5, 79.4, '1.33', 'C', '<b>Cukup</b>/<i>Fair</i>', '75.5 <= x < 79.5', '', '', '', ''),
(14, 1, 79.5, 89.4, '1.66', 'B', '<b>Baik</b>/<i>Good</i>', '79.5 <= x <89.5', '', '', '', ''),
(15, 1, 89.5, 100.0, '2', 'A', '<b>Sangat Baik</b>/<i>Very Good</i>', '89.5 <= x <=100', 'Hallo ini konten pengetahuan SD', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `pelajaran_relasi_detail`
--

CREATE TABLE IF NOT EXISTS `pelajaran_relasi_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pelajaran_master` varchar(25) NOT NULL,
  `pelajaran` varchar(25) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=15 ;

--
-- Dumping data for table `pelajaran_relasi_detail`
--

INSERT INTO `pelajaran_relasi_detail` (`id`, `pelajaran_master`, `pelajaran`) VALUES
(3, '0727', '0730'),
(4, '0727', '0731'),
(7, '0920', '0916'),
(8, '0920', '0917'),
(9, '0716', '0717'),
(10, '0716', '0720'),
(11, '0717', '0716'),
(12, '0717', '0720'),
(13, '0720', '0716'),
(14, '0720', '0717');

-- --------------------------------------------------------

--
-- Table structure for table `pelajaran_relasi_master`
--

CREATE TABLE IF NOT EXISTS `pelajaran_relasi_master` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `grade` varchar(10) NOT NULL,
  `pelajaran` varchar(15) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `pelajaran_relasi_master`
--

INSERT INTO `pelajaran_relasi_master` (`id`, `grade`, `pelajaran`) VALUES
(1, '07', '0703'),
(2, '08', '0803'),
(3, '09', '0903');

-- --------------------------------------------------------

--
-- Table structure for table `pelajaran_templatenarasi`
--

CREATE TABLE IF NOT EXISTS `pelajaran_templatenarasi` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `kode_pelajaran` varchar(10) DEFAULT NULL,
  `jenis` char(3) DEFAULT NULL,
  `mutu` varchar(5) DEFAULT NULL,
  `narasi` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=139 ;

--
-- Dumping data for table `pelajaran_templatenarasi`
--

INSERT INTO `pelajaran_templatenarasi` (`id`, `kode_pelajaran`, `jenis`, `mutu`, `narasi`) VALUES
(2, '017', 'p', 'B', '[NICKNAME] dapat menguasai seluruh kompetensi pada tingkat kriteria sesuai dengan yang diharapkan, khususnya jenis-jenis perkenalan diri, ungkapan/salam beserta penggunaannya, mengetahui jenis-jenis instruksi di kelas dan mengetahui kosakata terkait angka dan huruf hiragana dasar'),
(3, '017', 'p', 'C', '[NICKNAME] mampu menguasai seluruh kompetensi pada tingkat kriteria yang dipersyaratkan dan perlu memperdalam kompetensi terkait jenis-jenis perkenalan diri, ungkapan/salam beserta penggunaannya, mengetahui jenis-jenis instruksi di kelas dan mengetahui kosakata terkait angka serta huruf hiragana dasar.'),
(4, '017', 'p', 'D', 'Mungkin terdiam mungkin aku terlena '),
(5, '017', 'k', 'A', '[NICKNAME] berhasil menguasai seluruh keterampilan dengan tingkat kualitas tertinggi, terutama kemampuan memperkenalkan diri dan orang lain, menyebutkan angka,menyebutkan jam, nomor telepon dan mengaplikasikan huruf hiragana dalam menulis dan membaca kalimat dalam bahasa Jepang.'),
(6, '017', 'k', 'B', '[NICKNAME] dapat menguasai seluruh keterampilan pada tingkat kriteria sesuai dengan yang diharapkan, khususnya kemampuan memperkenalkan diri dan orang lain, menyebutkan angka,menyebutkan jam, nomor telepon dan mengaplikasikan huruf hiragana dalam menulis dan membaca kalimat dalam bahasa Jepang.'),
(7, '017', 'k', 'C', '[NICKNAME] mampu menguasai seluruh keterampilan pada tingkat kriteria yang dipersyaratkan dan perlu memperdalam keterampilan kemampuan memperkenalkan diri dan orang lain, menyebutkan angka,menyebutkan jam, nomor telepon dan mengaplikasikan huruf hiragana dalam menulis dan membaca kalimat dalam bahasa Jepang.'),
(8, '017', 'k', 'D', 'Biar kunikmati kerinduan ini '),
(106, '017', 'p', 'A', 'Hallo ini konten pengetahuan SD testing doeng doeng'),
(107, '018', 'p', 'A', '12345678901112131415'),
(108, '018', 'k', 'A', '2'),
(109, '018', 'p', 'B', '3'),
(110, '018', 'k', 'B', '4'),
(111, '018', 'p', 'C', '5'),
(112, '018', 'k', 'C', '6'),
(113, '018', 'p', 'D', '7'),
(114, '018', 'k', 'D', '8'),
(115, '016', 'p', 'A', 'Hallo ini konten pengetahuan SD Siswa [NICKNAME] > [NAME]'),
(116, '016', 'k', 'A', ''),
(117, '016', 'p', 'B', ''),
(118, '016', 'k', 'B', ''),
(119, '016', 'p', 'C', '[NICKNAME] C'),
(120, '016', 'k', 'C', '[NICKNAME] D'),
(121, '016', 'p', 'D', '[NICKNAME] D'),
(122, '016', 'k', 'D', '[NICKNAME] D'),
(123, '118', 'p', 'A', 'Hallo ini konten pengetahuan SMA a+ '),
(124, '118', 'k', 'A', 'keterampilan SMA a+ '),
(125, '118', 'p', 'B', 'keterampilan SMA b+ '),
(126, '118', 'k', 'B', 'keterampilan SMA b+ '),
(127, '118', 'p', 'C', 'keterampilan SMA c+ '),
(128, '118', 'k', 'C', 'keterampilan SMA c+ '),
(129, '118', 'p', 'D', 'keterampilan SMA d+ '),
(130, '118', 'k', 'D', 'keterampilan SMA d+ '),
(131, '0720', 'p', 'A', ''),
(132, '0720', 'k', 'A', ''),
(133, '0720', 'p', 'B', ''),
(134, '0720', 'k', 'B', ''),
(135, '0720', 'p', 'C', ''),
(136, '0720', 'k', 'C', ''),
(137, '0720', 'p', 'D', ''),
(138, '0720', 'k', 'D', '');

-- --------------------------------------------------------

--
-- Table structure for table `pelajaran_template_sikap`
--

CREATE TABLE IF NOT EXISTS `pelajaran_template_sikap` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kelompok` enum('social','religi') NOT NULL,
  `nilai` varchar(2) NOT NULL,
  `narasi` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `pelajaran_template_sikap`
--

INSERT INTO `pelajaran_template_sikap` (`id`, `kelompok`, `nilai`, `narasi`) VALUES
(1, 'social', 'SB', '[NICKNAME] selalu menunjukkan sikap '),
(2, 'social', 'B', '[NICKNAME] sering menunjukkan sikap '),
(3, 'social', 'PP', '[NICKNAME] perlu meningkatkan sikap ');

-- --------------------------------------------------------

--
-- Table structure for table `pelanggaran`
--

CREATE TABLE IF NOT EXISTS `pelanggaran` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nim` varchar(10) NOT NULL,
  `id_perilaku` int(11) NOT NULL,
  `tanggal` date NOT NULL,
  `ke` int(11) NOT NULL,
  `id_tindakan` int(11) NOT NULL,
  `is_max` enum('Y','N') DEFAULT 'N',
  `finger_oleh` varchar(5) NOT NULL,
  `tgl_update` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `prestasi`
--

CREATE TABLE IF NOT EXISTS `prestasi` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `kegiatan` varchar(60) DEFAULT NULL,
  `id_peringkat` int(4) DEFAULT NULL,
  `id_kategori` int(4) DEFAULT NULL,
  `id_tingkat` int(4) DEFAULT NULL,
  `tempat` varchar(30) DEFAULT NULL,
  `id_penyelenggara` int(4) DEFAULT NULL,
  `catatan` text,
  `tanggal` date DEFAULT NULL,
  `finger_oleh` varchar(15) NOT NULL,
  `tgl_update` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `prestasi_lampiran`
--

CREATE TABLE IF NOT EXISTS `prestasi_lampiran` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_prestasi` int(11) unsigned DEFAULT NULL,
  `namafile` varchar(70) DEFAULT NULL,
  `ekstensi` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `prestasi_peserta`
--

CREATE TABLE IF NOT EXISTS `prestasi_peserta` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_prestasi` int(4) unsigned DEFAULT NULL,
  `nim` varchar(15) DEFAULT NULL,
  `finger_oleh` varchar(14) NOT NULL,
  `tgl_update` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `priv_grade`
--

CREATE TABLE IF NOT EXISTS `priv_grade` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `pelajaran` varchar(10) DEFAULT NULL,
  `guru` varchar(5) DEFAULT NULL,
  `supervisor` char(1) DEFAULT NULL,
  `sen` char(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `priv_grade_wakasek`
--

CREATE TABLE IF NOT EXISTS `priv_grade_wakasek` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kode_grade` varchar(15) DEFAULT NULL,
  `finger` varchar(15) DEFAULT NULL COMMENT 'untuk guru supervisor',
  `wakasek_for` enum('akademik','nonakademik') DEFAULT 'akademik',
  `sen` enum('Y','N') DEFAULT 'N',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=59 ;

--
-- Dumping data for table `priv_grade_wakasek`
--

INSERT INTO `priv_grade_wakasek` (`id`, `kode_grade`, `finger`, `wakasek_for`, `sen`) VALUES
(1, '11', '269', 'akademik', 'N'),
(2, '12', '269', 'akademik', 'N'),
(3, '11', 'admin', 'akademik', 'N'),
(4, '12', 'admin', 'akademik', 'N'),
(5, '01', '793', 'akademik', 'N'),
(6, '02', '793', 'akademik', 'N'),
(7, '03', '793', 'akademik', 'N'),
(8, '04', '793', 'akademik', 'N'),
(9, '05', '793', 'akademik', 'N'),
(10, '06', '793', 'akademik', 'N'),
(11, '04', '146', 'akademik', 'N'),
(12, '05', '146', 'akademik', 'N'),
(13, '06', '146', 'akademik', 'N'),
(14, '01', '182', 'akademik', 'N'),
(15, '02', '182', 'akademik', 'N'),
(16, '03', '182', 'akademik', 'N'),
(17, '07', '362', 'akademik', 'N'),
(18, '08', '362', 'akademik', 'N'),
(19, '09', '143', 'akademik', 'N'),
(20, '10', '143', 'akademik', 'N'),
(21, '11', '493', 'akademik', 'N'),
(22, '12', '493', 'akademik', 'N'),
(23, '11', '493', 'akademik', 'N'),
(24, '12', '493', 'akademik', 'N'),
(25, '07', '493', 'akademik', 'N'),
(26, '08', '493', 'akademik', 'N'),
(27, '09', '493', 'akademik', 'N'),
(28, '10', '493', 'akademik', 'N'),
(36, '11', '34', 'nonakademik', 'N'),
(37, '12', '34', 'nonakademik', 'N'),
(38, '11', '34', 'nonakademik', 'N'),
(39, '12', '34', 'nonakademik', 'N'),
(40, '07', '34', 'nonakademik', 'N'),
(41, '08', '34', 'nonakademik', 'N'),
(42, '09', '34', 'nonakademik', 'N'),
(43, '10', '34', 'nonakademik', 'N'),
(51, '11', '493', 'nonakademik', 'N'),
(52, '12', '493', 'nonakademik', 'N'),
(53, '11', '493', 'nonakademik', 'N'),
(54, '12', '493', 'nonakademik', 'N'),
(55, '07', '493', 'nonakademik', 'N'),
(56, '08', '493', 'nonakademik', 'N'),
(57, '09', '493', 'nonakademik', 'N'),
(58, '10', '493', 'nonakademik', 'N');

-- --------------------------------------------------------

--
-- Table structure for table `priv_guru_kelas`
--

CREATE TABLE IF NOT EXISTS `priv_guru_kelas` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `kode_grade` varchar(5) NOT NULL,
  `id_kelas` int(10) DEFAULT NULL,
  `kode_kelas` varchar(10) NOT NULL,
  `kode_pelajaran` varchar(10) DEFAULT NULL,
  `id_pelajaran` int(11) NOT NULL,
  `finger` varchar(5) DEFAULT NULL COMMENT 'untuk guru',
  `total_jam` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=92 ;

--
-- Dumping data for table `priv_guru_kelas`
--

INSERT INTO `priv_guru_kelas` (`id`, `kode_grade`, `id_kelas`, `kode_kelas`, `kode_pelajaran`, `id_pelajaran`, `finger`, `total_jam`) VALUES
(1, '11', 27, '11C', '1116', 16, '676', 0),
(2, '12', 28, '12A', '1216', 16, '676', 0),
(3, '12', 29, '12B', '1216', 16, '676', 0),
(76, '11', 26, '11N', '1147', 47, '1041', 0),
(8, '11', 27, '11C', '1117', 17, '524', 0),
(9, '12', 28, '12A', '1217', 17, '524', 0),
(10, '12', 29, '12B', '1217', 17, '524', 0),
(11, '11', 27, '11C', '119', 9, '246', 0),
(12, '11', 26, '11N', '119', 9, '246', 0),
(13, '12', 28, '12A', '129', 9, '246', 0),
(14, '12', 29, '12B', '129', 9, '246', 0),
(15, '12', 30, '12H', '129', 9, '246', 0),
(16, '11', 26, '11N', '1176', 76, '80', 0),
(17, '12', 30, '12H', '1276', 76, '80', 0),
(18, '11', 26, '11N', '1157', 57, '247', 0),
(19, '12', 28, '12A', '127', 7, '18', 0),
(20, '12', 29, '12B', '127', 7, '18', 0),
(21, '12', 30, '12H', '127', 7, '18', 0),
(22, '12', 28, '12A', '1257', 57, '18', 0),
(23, '12', 29, '12B', '1257', 57, '18', 0),
(24, '12', 30, '12H', '1257', 57, '18', 0),
(25, '12', 28, '12A', '1258', 58, '18', 0),
(26, '12', 29, '12B', '1258', 58, '18', 0),
(27, '12', 30, '12H', '1258', 58, '18', 0),
(28, '11', 27, '11C', '1115', 15, '602', 0),
(29, '12', 28, '12A', '1215', 15, '602', 0),
(30, '12', 29, '12B', '1215', 15, '602', 0),
(31, '11', 27, '11C', '1159', 59, '602', 0),
(37, '02', 3, '2Y', '022', 2, '364', 0),
(66, '05', 10, '5A', '053', 3, '165', 0),
(38, '03', 6, '3E', '032', 2, '364', 0),
(39, '03', 5, '3M', '032', 2, '364', 0),
(40, '05', 10, '5A', '052', 2, '364', 0),
(63, '12', 30, '12H', '123', 3, '165', 0),
(62, '10', 23, '10E', '103', 3, '165', 0),
(43, '06', 14, '6N', '062', 2, '364', 0),
(65, '02', 4, '2L', '023', 3, '165', 0),
(64, '01', 1, '1A', '013', 3, '165', 0),
(46, '12', 28, '12A', '124', 4, '457', 0),
(55, '05', 11, '5N', '055', 5, '71', 0),
(53, '12', 30, '12H', '125', 5, '71', 0),
(54, '02', 3, '2Y', '025', 5, '71', 0),
(56, '07', 15, '7T', '075', 5, '71', 0),
(57, '08', 17, '8A', '085', 5, '71', 0),
(58, '09', 21, '9W', '095', 5, '71', 0),
(59, '03', 5, '3M', '036', 6, '585', 0),
(60, '08', 17, '8A', '086', 6, '585', 0),
(61, '09', 21, '9W', '096', 6, '585', 0),
(67, '06', 14, '6N', '063', 3, '165', 0),
(68, '07', 16, '7N', '073', 3, '165', 0),
(69, '08', 17, '8A', '083', 3, '165', 0),
(70, '09', 20, '9E', '093', 3, '165', 0),
(71, '10', 24, '10U', '102', 2, '227', 0),
(72, '11', 27, '11C', '112', 2, '227', 0),
(73, '11', 26, '11N', '112', 2, '227', 0),
(74, '08', 19, '8F', '082', 2, '227', 0),
(75, '09', 20, '9E', '092', 2, '227', 0),
(77, '12', 29, '12B', '1247', 47, '1041', 0),
(78, '12', 30, '12H', '1247', 47, '1041', 0),
(81, '07', 16, '7N', '0715', 15, '461', 0),
(82, '07', 15, '7T', '0715', 15, '461', 0),
(83, '07', 16, '7N', '0723', 23, '461', 0),
(84, '07', 15, '7T', '0723', 23, '461', 0),
(85, '11', 27, '11C', '114', 4, '1009', 0),
(86, '02', 3, '2Y', '024', 4, '1009', 0),
(87, '03', 5, '3M', '034', 4, '1009', 0),
(88, '04', 7, '4R', '044', 4, '1009', 0),
(89, '05', 10, '5A', '054', 4, '1009', 0),
(90, '08', 19, '8F', '084', 4, '1009', 0),
(91, '09', 22, '9I', '094', 4, '1009', 0);

-- --------------------------------------------------------

--
-- Table structure for table `priv_supervisor`
--

CREATE TABLE IF NOT EXISTS `priv_supervisor` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `grade` varchar(10) DEFAULT NULL,
  `guru` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `read_grading`
--

CREATE TABLE IF NOT EXISTS `read_grading` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `min` int(11) DEFAULT NULL,
  `max` int(11) DEFAULT NULL,
  `predicate` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `read_grading`
--

INSERT INTO `read_grading` (`id`, `min`, `max`, `predicate`) VALUES
(1, 0, 54, 'D'),
(2, 55, 69, 'C'),
(3, 70, 84, 'B'),
(4, 85, 100, 'A');

-- --------------------------------------------------------

--
-- Table structure for table `read_passport`
--

CREATE TABLE IF NOT EXISTS `read_passport` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nim` varchar(15) NOT NULL,
  `id_buku` int(11) NOT NULL,
  `semester` varchar(2) NOT NULL,
  `tahun_ajaran` varchar(10) NOT NULL,
  `id_jenjang` varchar(5) NOT NULL,
  `kode_grade` varchar(2) NOT NULL,
  `id_genre` int(11) NOT NULL,
  `id_kelas` int(6) NOT NULL,
  `n1` int(2) NOT NULL,
  `n2` int(2) NOT NULL,
  `n3` int(2) NOT NULL,
  `n4` int(2) NOT NULL,
  `n5` int(2) NOT NULL,
  `na` int(11) NOT NULL,
  `predicate` varchar(1) NOT NULL,
  `finger_oleh` varchar(15) NOT NULL,
  `tanggal` date NOT NULL,
  `tgl_update` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `read_passport`
--

INSERT INTO `read_passport` (`id`, `nim`, `id_buku`, `semester`, `tahun_ajaran`, `id_jenjang`, `kode_grade`, `id_genre`, `id_kelas`, `n1`, `n2`, `n3`, `n4`, `n5`, `na`, `predicate`, `finger_oleh`, `tanggal`, `tgl_update`) VALUES
(3, '19.063', 21208, '', '', '', '07', 3, 16, 4, 2, 4, 2, 4, 80, 'B', '816', '2019-07-11', '2019-07-11 01:44:40');

-- --------------------------------------------------------

--
-- Table structure for table `record_health`
--

CREATE TABLE IF NOT EXISTS `record_health` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `nim` varchar(15) DEFAULT NULL,
  `id_kelas` int(11) DEFAULT NULL,
  `kode_grade` varchar(5) NOT NULL,
  `tanggal` date DEFAULT NULL,
  `finger_oleh` varchar(15) NOT NULL,
  `tgl_update` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `record_health_item`
--

CREATE TABLE IF NOT EXISTS `record_health_item` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_record_health` int(11) DEFAULT NULL,
  `id_item` int(11) DEFAULT NULL COMMENT 'refer to item health_item',
  `nilai` enum('+','-') DEFAULT NULL,
  `keterangan` varchar(250) NOT NULL,
  `finger_oleh` varchar(15) NOT NULL,
  `tgl_update` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `record_medical`
--

CREATE TABLE IF NOT EXISTS `record_medical` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `nim` varchar(15) DEFAULT NULL,
  `tanggal` date NOT NULL,
  `id_kelas` int(11) NOT NULL,
  `kode_grade` varchar(5) NOT NULL,
  `keterangan_keluhan` text,
  `keterangan_pengobatan` text,
  `saran` text,
  `waktu_masuk` datetime DEFAULT NULL,
  `waktu_keluar` datetime DEFAULT NULL,
  `finger_oleh` varchar(15) DEFAULT NULL,
  `tgl_update` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `record_medical_keluhan`
--

CREATE TABLE IF NOT EXISTS `record_medical_keluhan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_record_medical` int(11) DEFAULT NULL,
  `id_keluhan` int(11) DEFAULT NULL,
  `finger` varchar(15) DEFAULT NULL,
  `tgl_update` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `record_medical_pengobatan`
--

CREATE TABLE IF NOT EXISTS `record_medical_pengobatan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_record_medical` int(11) DEFAULT NULL,
  `id_pengobatan` int(11) DEFAULT NULL,
  `finger` varchar(15) DEFAULT NULL,
  `tgl_update` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ref_grade`
--

CREATE TABLE IF NOT EXISTS `ref_grade` (
  `kode` varchar(10) NOT NULL DEFAULT '',
  `id_jenjang` int(11) NOT NULL,
  `captionkepseknarasi` varchar(30) DEFAULT NULL,
  `th` varchar(5) DEFAULT NULL,
  `tgl_raport` date DEFAULT NULL,
  `tgl_lulus` date DEFAULT NULL,
  `nip` varchar(15) NOT NULL,
  `finger` varchar(15) NOT NULL,
  `nama_kepsek` varchar(30) DEFAULT NULL,
  `tiperaport` varchar(10) DEFAULT NULL,
  `teksnaikkelas` text,
  `tekstidaknaik` text,
  `lock_unlock` enum('lock','unlock') DEFAULT 'lock',
  `show_hide` enum('show','hide') DEFAULT 'hide',
  PRIMARY KEY (`kode`),
  KEY `kode` (`kode`,`id_jenjang`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ref_grade`
--

INSERT INTO `ref_grade` (`kode`, `id_jenjang`, `captionkepseknarasi`, `th`, `tgl_raport`, `tgl_lulus`, `nip`, `finger`, `nama_kepsek`, `tiperaport`, `teksnaikkelas`, `tekstidaknaik`, `lock_unlock`, `show_hide`) VALUES
('01', 1, 'Principal', 'th', NULL, NULL, '', '208', ' Susi Suciatiningsih, S.P.', '2013', NULL, NULL, 'lock', 'hide'),
('02', 1, 'Principal', 'th', NULL, NULL, '', '208', ' Susi Suciatiningsih, S.P.', '2013', NULL, NULL, 'lock', 'hide'),
('03', 1, 'Principal', 'th', NULL, NULL, '', '208', ' Susi Suciatiningsih, S.P.', '2013', NULL, NULL, 'lock', 'hide'),
('04', 1, 'Principal', 'th', NULL, NULL, '', '208', ' Susi Suciatiningsih, S.P.', '2013', NULL, NULL, 'lock', 'hide'),
('05', 1, 'Principal', 'th', NULL, NULL, '', '208', ' Susi Suciatiningsih, S.P.', '2013', NULL, NULL, 'lock', 'hide'),
('06', 1, 'Principal', 'th', NULL, NULL, '', '208', ' Susi Suciatiningsih, S.P.', '2013', NULL, NULL, 'lock', 'hide'),
('07', 2, 'Principal', 'th', NULL, NULL, '', '', NULL, '2013', 'naik ke kelas 8 (delapan) / passes to grade 8', 'tinggal di kelas 7 (tujuh)', 'lock', 'hide'),
('08', 2, 'Principal', 'th', NULL, NULL, '', '', NULL, '2013', 'naik ke kelas 9 (sembilan) / passes to grade 9', 'tinggal di kelas 8 (delapan)', 'lock', 'hide'),
('09', 2, 'Principal', 'th', NULL, NULL, '', '', NULL, '2013', 'naik ke kelas 10 (sepuluh) / passes to grade 10', 'tinggal di kelas 9 (sembilan)', 'lock', 'hide'),
('10', 3, 'Pricipal', NULL, NULL, NULL, '', '493', ' Ahmad Gunawan, S.T.', '2013', NULL, NULL, 'lock', 'hide'),
('11', 3, 'Principal', NULL, NULL, NULL, '', '493', ' Ahmad Gunawan, S.T.', '2013', NULL, NULL, 'lock', 'hide'),
('12', 3, 'Principal', NULL, NULL, NULL, '', '493', ' Ahmad Gunawan, S.T.', '2013', NULL, NULL, 'lock', 'hide');

-- --------------------------------------------------------

--
-- Table structure for table `ref_jam`
--

CREATE TABLE IF NOT EXISTS `ref_jam` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `range_jam` varchar(50) DEFAULT NULL,
  `aktif` enum('Y','N') DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=12 ;

--
-- Dumping data for table `ref_jam`
--

INSERT INTO `ref_jam` (`id`, `range_jam`, `aktif`) VALUES
(1, '08.00-08.50', NULL),
(2, '08.50-09.30', NULL),
(3, '09.40-10.30', NULL),
(4, '10.30-11.20', NULL),
(5, '11.20-12.10', NULL),
(6, '12.10-13.00', NULL),
(7, '13.00-13.50', NULL),
(8, '13.50-14.40', NULL),
(9, '14.40-15.30', NULL),
(10, '15.30-16.20', NULL),
(11, '16.20-17.10', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ref_jurusan`
--

CREATE TABLE IF NOT EXISTS `ref_jurusan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_jenjang` int(11) NOT NULL,
  `jurusan` varchar(15) NOT NULL,
  `kepanjangan` varchar(50) NOT NULL,
  `kepanjangan_eng` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`,`id_jenjang`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `ref_jurusan`
--

INSERT INTO `ref_jurusan` (`id`, `id_jenjang`, `jurusan`, `kepanjangan`, `kepanjangan_eng`) VALUES
(1, 3, 'IPA', 'Ilmu Alam dan Matematika', 'Science'),
(2, 3, 'IPS', 'Ilmu-ilmu Social', 'Social'),
(3, 3, 'Bahasa', 'Ilmu Bahasa', 'Language');

-- --------------------------------------------------------

--
-- Table structure for table `ref_kelas`
--

CREATE TABLE IF NOT EXISTS `ref_kelas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kode` varchar(5) NOT NULL,
  `kode_grade` varchar(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`,`kode`,`kode_grade`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=33 ;

--
-- Dumping data for table `ref_kelas`
--

INSERT INTO `ref_kelas` (`id`, `kode`, `kode_grade`) VALUES
(1, '1A', '01'),
(2, '1R', '01'),
(3, '2Y', '02'),
(4, '2L', '02'),
(5, '3M', '03'),
(6, '3E', '03'),
(7, '4R', '04'),
(8, '4I', '04'),
(9, '5I', '05'),
(10, '5A', '05'),
(11, '5N', '05'),
(12, '6P', '06'),
(13, '6T', '06'),
(14, '6N', '06'),
(15, '7T', '07'),
(16, '7N', '07'),
(17, '8A', '08'),
(18, '8P', '08'),
(19, '8F', '08'),
(20, '9E', '09'),
(21, '9W', '09'),
(22, '9I', '09'),
(23, '10E', '10'),
(24, '10U', '10'),
(25, '10D', '10'),
(26, '11N', '11'),
(27, '11C', '11'),
(28, '12A', '12'),
(29, '12B', '12'),
(30, '12H', '12'),
(31, '13N', '13'),
(32, '14S', '14');

-- --------------------------------------------------------

--
-- Table structure for table `ref_kelas_wali`
--

CREATE TABLE IF NOT EXISTS `ref_kelas_wali` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_kelas` int(5) DEFAULT NULL,
  `finger` varchar(15) DEFAULT NULL COMMENT 'finger as wali',
  `ketua` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`,`id_kelas`,`finger`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=165 ;

--
-- Dumping data for table `ref_kelas_wali`
--

INSERT INTO `ref_kelas_wali` (`id`, `id_kelas`, `finger`, `ketua`) VALUES
(1, 1, '22', 1),
(2, 2, '175', 1),
(3, 3, '244', 1),
(4, 4, '117', 1),
(5, 5, '174', 1),
(6, 6, '310', 1),
(7, 7, '167', 1),
(8, 8, '742', 1),
(9, 9, '193', 1),
(15, 15, '461', 1),
(16, 16, '816', 1),
(17, 17, '789', 1),
(19, 19, '131', 1),
(20, 20, '797', 1),
(21, 21, '263', 1),
(22, 22, '445', 1),
(23, 23, '744', 1),
(25, 25, '45', 1),
(26, 26, '147', 1),
(28, 28, '18', 1),
(29, 29, '676', 1),
(30, 30, '80', 1),
(31, 31, '152', 1),
(32, 32, '462', 1),
(64, 1, '934', 0),
(65, 2, '934', 0),
(66, 3, '934', 0),
(67, 4, '934', 0),
(68, 5, '21', 0),
(69, 6, '21', 0),
(78, 15, '750', 0),
(79, 16, '690', 0),
(80, 17, '97', 0),
(82, 19, '103', 0),
(83, 20, '127', 0),
(84, 21, '47', 0),
(85, 22, '1004', 0),
(86, 23, '617', 0),
(88, 25, '46', 0),
(89, 26, '1041', 0),
(91, 28, '246', 0),
(92, 29, '', 0),
(93, 30, '247', 0),
(94, 31, NULL, 0),
(95, 32, NULL, 0),
(127, 7, '928', NULL),
(128, 8, '928', NULL),
(129, 9, '928', NULL),
(130, 7, '1017', NULL),
(131, 8, '1017', NULL),
(132, 9, '1017', NULL),
(138, 7, '21', NULL),
(139, 8, '21', NULL),
(142, 18, '145', 1),
(143, 18, '691', NULL),
(144, 10, '1048', 1),
(145, 10, '1017', NULL),
(146, 10, '928', NULL),
(147, 11, '935', 1),
(148, 11, '1017', NULL),
(149, 11, '928', NULL),
(150, 12, '277', 1),
(151, 12, '1017', NULL),
(152, 12, '912', NULL),
(153, 13, '629', 1),
(154, 13, '1017', NULL),
(155, 13, '912', NULL),
(158, 14, '224', 1),
(159, 14, '1017', NULL),
(160, 14, '912', NULL),
(161, 24, '444', 1),
(162, 24, '553', NULL),
(163, 27, '524', 1),
(164, 27, '602', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ref_waktu_guru_disable`
--

CREATE TABLE IF NOT EXISTS `ref_waktu_guru_disable` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `finger` varchar(15) DEFAULT NULL,
  `id_hari` int(10) DEFAULT NULL,
  `id_jam` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `setup_raport`
--

CREATE TABLE IF NOT EXISTS `setup_raport` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_jenjang` int(11) NOT NULL,
  `finger` varchar(15) DEFAULT NULL,
  `nip` varchar(25) DEFAULT NULL,
  `nama_kepsek` varchar(50) DEFAULT NULL,
  `tgl_raport` date DEFAULT NULL,
  `show_hide` enum('show','hide') DEFAULT 'hide',
  `lock_unlock` enum('lock','unlock') DEFAULT 'lock',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `setup_raport`
--

INSERT INTO `setup_raport` (`id`, `id_jenjang`, `finger`, `nip`, `nama_kepsek`, `tgl_raport`, `show_hide`, `lock_unlock`) VALUES
(1, 3, '493', '', ' Ahmad Gunawan, S.T.', '2018-12-15', 'hide', 'lock');

-- --------------------------------------------------------

--
-- Table structure for table `setup_tools`
--

CREATE TABLE IF NOT EXISTS `setup_tools` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tools` enum('layanan','tagihan','laporan','bantuan','home') DEFAULT 'home',
  `menu` varchar(25) DEFAULT NULL COMMENT 'kode all digunakan untuk menonaktifkan atau mengaktifkan semua sub menu',
  `judul` varchar(250) DEFAULT NULL,
  `deskripsi` varchar(500) DEFAULT NULL,
  `icon` varchar(25) DEFAULT NULL,
  `aktif` enum('1','0') DEFAULT '1' COMMENT 'jika aktif=0 dan kode menu = all maka semua sub menu tools akan nonaktif',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `setup_tools`
--

INSERT INTO `setup_tools` (`id`, `tools`, `menu`, `judul`, `deskripsi`, `icon`, `aktif`) VALUES
(1, 'layanan', 'all', 'all', '-', '-', '1'),
(2, 'layanan', 'ajs', 'Antar Jemput Siswa', 'Menu enabled atau disabled dari tool antar jemput siswa', 'fa-transportation', '1'),
(3, 'layanan', 'cambridge', 'Buku Cambridge', 'Menu enabled atau disabled tool buku cambridge', 'fa-book', '1');

-- --------------------------------------------------------

--
-- Table structure for table `sikap_jurnal`
--

CREATE TABLE IF NOT EXISTS `sikap_jurnal` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nim` varchar(15) NOT NULL,
  `kode_pelajaran` varchar(10) NOT NULL,
  `id_kelas` int(11) NOT NULL,
  `finger` varchar(15) NOT NULL,
  `tanggal` date NOT NULL,
  `perilaku` text NOT NULL,
  `n1` enum('SB','B','PP') NOT NULL DEFAULT 'B',
  `n2` enum('SB','B','PP') NOT NULL DEFAULT 'B',
  `n3` enum('SB','B','PP') NOT NULL DEFAULT 'B',
  `n4` enum('SB','B','PP') NOT NULL DEFAULT 'B',
  `n5` enum('SB','B','PP') NOT NULL DEFAULT 'B',
  `tindak_lanjut` text,
  `verifikasi` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `sikap_nonjurnal_subject`
--

CREATE TABLE IF NOT EXISTS `sikap_nonjurnal_subject` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` enum('konversi','subject') NOT NULL,
  `nim` varchar(15) NOT NULL,
  `kode_pelajaran` varchar(15) NOT NULL,
  `n1` enum('SB','B','PP') NOT NULL DEFAULT 'B',
  `n2` enum('SB','B','PP') NOT NULL DEFAULT 'B',
  `n3` enum('SB','B','PP') NOT NULL DEFAULT 'B',
  `n4` enum('SB','B','PP') NOT NULL DEFAULT 'B',
  `n5` enum('SB','B','PP') NOT NULL DEFAULT 'B',
  `na` varchar(5) NOT NULL,
  `is_kadang` enum('Y','N') DEFAULT 'N',
  `tanggal` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `sikap_nonjurnal_subject`
--

INSERT INTO `sikap_nonjurnal_subject` (`id`, `status`, `nim`, `kode_pelajaran`, `n1`, `n2`, `n3`, `n4`, `n5`, `na`, `is_kadang`, `tanggal`) VALUES
(1, 'subject', '18.054', '118', '', '', '', '', '', '', 'N', '2019-07-11 01:28:30'),
(2, 'subject', '18.076', '118', '', '', '', '', '', '', 'N', '2019-07-11 01:28:30'),
(3, 'subject', '15.017', '118', '', '', '', '', '', '', 'N', '2019-07-11 01:28:30'),
(4, 'subject', '16.060', '118', '', '', '', '', '', '', 'N', '2019-07-11 01:28:30'),
(5, 'subject', '15.014', '118', '', '', '', '', '', '', 'N', '2019-07-11 01:28:30'),
(6, 'subject', '18.058', '118', '', '', '', '', '', '', 'N', '2019-07-11 01:28:30'),
(7, 'subject', '15.022', '118', '', '', '', '', '', '', 'N', '2019-07-11 01:28:30'),
(8, 'subject', '15.023', '118', '', '', '', '', '', '', 'N', '2019-07-11 01:28:30'),
(9, 'subject', '18.056', '118', '', '', '', '', '', '', 'N', '2019-07-11 01:28:30'),
(10, 'subject', '15.005', '118', '', '', '', '', '', '', 'N', '2019-07-11 01:28:30');

-- --------------------------------------------------------

--
-- Table structure for table `siswa_lock_log`
--

CREATE TABLE IF NOT EXISTS `siswa_lock_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nim` varchar(15) NOT NULL,
  `kelas` varchar(5) NOT NULL,
  `perintah` text NOT NULL,
  `alasan` text NOT NULL,
  `finger` varchar(15) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_haid_keluhan`
--

CREATE TABLE IF NOT EXISTS `tbl_haid_keluhan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `keluhan` text NOT NULL,
  `warna` varchar(15) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_haid_log`
--

CREATE TABLE IF NOT EXISTS `tbl_haid_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nim` varchar(15) NOT NULL,
  `tanggal` date DEFAULT NULL,
  `hari_ke` int(11) NOT NULL,
  `status` enum('start','between','stop') NOT NULL DEFAULT 'between',
  `verified` varchar(15) DEFAULT NULL COMMENT 'diisi dengan finger kordinator',
  `waktu_verified` datetime DEFAULT NULL,
  `catatan_nurse` text,
  `oleh` varchar(15) DEFAULT NULL COMMENT 'diisi finger nurse',
  `waktu_catat` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_haid_log_keluhan`
--

CREATE TABLE IF NOT EXISTS `tbl_haid_log_keluhan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_haid_log` int(11) DEFAULT NULL,
  `id_keluhan` int(11) DEFAULT NULL,
  `waktu_catat` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_haid_log_ringkas`
--

CREATE TABLE IF NOT EXISTS `tbl_haid_log_ringkas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nim` varchar(15) DEFAULT NULL,
  `start` date DEFAULT NULL,
  `finish` date DEFAULT NULL,
  `durasi` int(11) NOT NULL,
  `durasi_normal` enum('Y','N') DEFAULT 'Y',
  `rentang` int(11) DEFAULT NULL,
  `rentang_normal` enum('Y','N') DEFAULT 'Y',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_haid_setting`
--

CREATE TABLE IF NOT EXISTS `tbl_haid_setting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(100) DEFAULT NULL,
  `nilai_min` int(11) DEFAULT NULL,
  `nilai_max` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_log`
--

CREATE TABLE IF NOT EXISTS `tbl_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `perintah` text NOT NULL,
  `finger` varchar(15) NOT NULL,
  `tanggal` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=49 ;

--
-- Dumping data for table `tbl_log`
--

INSERT INTO `tbl_log` (`id`, `perintah`, `finger`, `tanggal`) VALUES
(1, 'update mdn120182019.kelas_siswa set kelas=''13N'' where nim=''13.041''', '152', '2018-07-12 07:45:40'),
(2, 'update mdn120182019.kelas_siswa set kelas=''13N'' where nim=''14.006''', '152', '2018-07-12 07:47:41'),
(3, 'update mdn120182019.kelas_siswa set kelas=''13N'' where nim=''14.006''', '152', '2018-07-12 07:47:41'),
(4, 'update mdn120182019.kelas_siswa set kelas=''13N'' where nim=''07.028''', '152', '2018-07-12 07:51:49'),
(5, 'update mdn120182019.kelas_siswa set kelas=''13N'' where nim=''13.043''', '152', '2018-07-12 07:52:37'),
(6, 'update mdn120182019.kelas_siswa set kelas=''13N'' where nim=''15.086''', '152', '2018-07-12 07:53:35'),
(7, 'update mdn120182019.kelas_siswa set kelas=''13N'' where nim=''13.087''', '152', '2018-07-12 07:54:20'),
(8, 'update mdn120182019.kelas_siswa set kelas=''13N'' where nim=''17.055''', '152', '2018-07-12 07:54:54'),
(9, 'update mdn120182019.kelas_siswa set kelas=''13N'' where nim=''15.079''', '152', '2018-07-12 07:56:25'),
(10, 'update mdn120182019.kelas_siswa set kelas=''13N'' where nim=''13.110''', '152', '2018-07-12 08:01:08'),
(11, 'update mdn120182019.kelas_siswa set kelas=''13N'' where nim=''12.116''', '152', '2018-07-12 08:02:02'),
(12, 'insert into mdn120182019.kelas_siswa (kelas, nim) values(''13N'',''12.047'')', '152', '2018-07-12 08:03:20'),
(13, 'update mdn120182019.kelas_siswa set kelas=''13N'' where nim=''12.079''', '152', '2018-07-12 08:03:51'),
(14, 'update mdn120182019.kelas_siswa set kelas=''13N'' where nim=''12.057''', '152', '2018-07-12 08:05:08'),
(15, 'update mdn120182019.kelas_siswa set kelas=''13N'' where nim=''13.017''', '152', '2018-07-12 08:05:30'),
(16, 'update mdn120182019.kelas_siswa set kelas=''13N'' where nim=''15.111''', '152', '2018-07-12 08:06:23'),
(17, 'update mdn120182019.kelas_siswa set kelas=''13N'' where nim=''15.110''', '152', '2018-07-12 08:06:46'),
(18, 'update mdn120182019.kelas_siswa set kelas=''13N'' where nim=''17.004''', '152', '2018-07-12 08:07:06'),
(19, 'update mdn120182019.kelas_siswa set kelas=''13N'' where nim=''17.030''', '152', '2018-07-12 08:07:27'),
(20, 'update mdn120182019.kelas_siswa set kelas=''13N'' where nim=''13.111''', '152', '2018-07-12 08:08:19'),
(21, 'update mdn120182019.kelas_siswa set kelas=''13N'' where nim=''15.077''', '152', '2018-07-12 08:08:39'),
(22, 'update mdn120182019.kelas_siswa set kelas=''13N'' where nim=''17.042''', '152', '2018-07-12 08:09:05'),
(23, 'insert into mdn120182019.kelas_siswa (kelas, nim) values(''14S'',''16.104'')', '152', '2018-07-12 08:21:37'),
(24, 'update mdn120182019.kelas_siswa set kelas=''4R'' where nim=''15.111''', '152', '2018-07-13 00:57:36'),
(25, 'update mdn120182019.kelas_siswa set kelas=''4M'' where nim=''15.077''', '152', '2018-07-13 06:40:28'),
(26, 'update mdn120182019.kelas_siswa set kelas=''7N'' where nim=''12.079''', '152', '2018-07-14 02:47:34'),
(27, 'update mdn120182019.kelas_siswa set kelas=''5N'' where nim=''14.006''', '152', '2018-07-14 03:33:15'),
(28, 'update mdn120182019.kelas_siswa set kelas=''3Y'' where nim=''16.012''', '152', '2018-07-14 05:32:12'),
(29, 'update mdn120182019.kelas_siswa set kelas=''10K'' where nim=''18.055''', '152', '2018-07-14 05:35:58'),
(30, 'update mdn120182019.kelas_siswa set kelas=''10I'' where nim=''16.122''', '152', '2018-07-14 05:36:32'),
(31, 'update mdn120182019.kelas_siswa set kelas=''11D'' where nim=''17.055''', '152', '2018-07-16 00:23:27'),
(32, 'update mdn120182019.kelas_siswa set kelas=''4R'' where nim=''15.079''', '152', '2018-07-16 02:21:36'),
(33, 'update mdn120182019.kelas_siswa set kelas=''12H'' where nim=''13.110''', '152', '2018-07-16 02:23:20'),
(34, 'update mdn120182019.kelas_siswa set kelas=''6V'' where nim=''13.043''', '152', '2018-07-16 02:37:36'),
(35, 'update mdn120182019.kelas_siswa set kelas=''4R'' where nim=''15.086''', '152', '2018-07-16 02:37:57'),
(36, 'update mdn120182019.kelas_siswa set kelas=''12L'' where nim=''13.087''', '152', '2018-07-16 02:40:00'),
(37, 'update mdn120182019.kelas_siswa set kelas=''2L'' where nim=''17.042''', '152', '2018-07-16 02:44:54'),
(38, 'update mdn120182019.kelas_siswa set kelas=''6V'' where nim=''13.017''', '152', '2018-07-16 02:47:25'),
(39, 'update mdn120182019.kelas_siswa set kelas=''2E'' where nim=''17.004''', '152', '2018-07-16 02:48:44'),
(40, 'update mdn120182019.kelas_siswa set kelas=''9K'' where nim=''12.116''', '152', '2018-07-19 02:31:37'),
(41, 'update mdn120182019.kelas_siswa set kelas=''12H'' where nim=''13.110''', '152', '2018-07-19 02:35:37'),
(42, 'update mdn120182019.kelas_siswa set kelas=''12N'' where nim=''13.017''', '152', '2018-07-19 02:36:26'),
(43, 'update mdn120182019.kelas_siswa set kelas=''12N'' where nim=''07.028''', '152', '2018-07-19 02:36:26'),
(44, 'update mdn120182019.kelas_siswa set kelas=''10K'' where nim=''09.019''', '152', '2018-07-23 00:59:20'),
(45, 'update mdn120182019.kelas_siswa set kelas=''10K'' where nim=''18.060''', '152', '2018-07-23 00:59:36'),
(46, 'update mdn120182019.kelas_siswa set kelas=''12F'' where nim=''13.111''', '152', '2018-08-13 04:16:47'),
(47, 'update mdn120182019.kelas_siswa set kelas=''10F'' where nim=''18.054''', '152', '2018-10-09 06:09:46'),
(48, 'update mdn120182019.kelas_siswa set kelas=''10F'' where nim=''16.122''', '152', '2018-10-17 06:44:44');

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_jadwal_pelajaran`
--
CREATE TABLE IF NOT EXISTS `v_jadwal_pelajaran` (
`finger` varchar(15)
,`nama` varchar(50)
,`hari` varchar(50)
,`jam` varchar(50)
,`ruang` varchar(20)
,`kode_kelas` varchar(10)
,`kode_pelajaran` varchar(10)
,`pelajaran` varchar(100)
);
-- --------------------------------------------------------

--
-- Stand-in structure for view `v_nilai_sikap`
--
CREATE TABLE IF NOT EXISTS `v_nilai_sikap` (
`nonjurnal` varchar(9)
,`nim` varchar(15)
,`kode_pelajaran` varchar(15)
,`is_narasi_sikap` varchar(3)
,`na` varchar(2)
);
-- --------------------------------------------------------

--
-- Stand-in structure for view `v_nilai_sikap_resume`
--
CREATE TABLE IF NOT EXISTS `v_nilai_sikap_resume` (
`nim` varchar(15)
,`is_narasi_sikap` varchar(3)
,`sum_sb` decimal(23,0)
,`sum_b` decimal(23,0)
,`sum_pp` decimal(23,0)
,`resume` varchar(2)
);
-- --------------------------------------------------------

--
-- Stand-in structure for view `v_rekap_jurusan_grade`
--
CREATE TABLE IF NOT EXISTS `v_rekap_jurusan_grade` (
`id` int(11)
,`id_jenjang` int(11)
,`jurusan` varchar(15)
,`kepanjangan` varchar(50)
,`kepanjangan_eng` varchar(50)
,`kode_grade` varchar(10)
,`total` bigint(21)
,`jml_aktif` decimal(23,0)
,`jml_nonaktif` decimal(23,0)
,`jml_laki` decimal(23,0)
,`jml_pr` decimal(23,0)
,`jml_islam` decimal(23,0)
,`jml_noni` decimal(23,0)
,`jml_msr` decimal(23,0)
,`jml_sen` decimal(23,0)
,`jml_pindahan` decimal(23,0)
,`jml_anak_pegawai` decimal(23,0)
,`jml_sibling` decimal(23,0)
);
-- --------------------------------------------------------

--
-- Stand-in structure for view `v_rekap_kelas`
--
CREATE TABLE IF NOT EXISTS `v_rekap_kelas` (
`id_kelas` int(5)
,`kode_kelas` varchar(5)
,`kode_grade` varchar(10)
,`total` bigint(21)
,`jml_aktif` decimal(23,0)
,`jml_nonaktif` decimal(23,0)
,`jml_laki` decimal(23,0)
,`jml_pr` decimal(23,0)
,`jml_islam` decimal(23,0)
,`jml_noni` decimal(23,0)
,`jml_msr` decimal(23,0)
,`jml_sen` decimal(23,0)
,`jml_pindahan` decimal(23,0)
,`jml_anak_pegawai` decimal(23,0)
,`jml_sibling` decimal(23,0)
);
-- --------------------------------------------------------

--
-- Structure for view `v_jadwal_pelajaran`
--
DROP TABLE IF EXISTS `v_jadwal_pelajaran`;
-- in use(#1142 - SHOW VIEW command denied to user 'b1sm1llah'@'localhost' for table 'v_jadwal_pelajaran')

-- --------------------------------------------------------

--
-- Structure for view `v_nilai_sikap`
--
DROP TABLE IF EXISTS `v_nilai_sikap`;
-- in use(#1142 - SHOW VIEW command denied to user 'b1sm1llah'@'localhost' for table 'v_nilai_sikap')

-- --------------------------------------------------------

--
-- Structure for view `v_nilai_sikap_resume`
--
DROP TABLE IF EXISTS `v_nilai_sikap_resume`;
-- in use(#1142 - SHOW VIEW command denied to user 'b1sm1llah'@'localhost' for table 'v_nilai_sikap_resume')

-- --------------------------------------------------------

--
-- Structure for view `v_rekap_jurusan_grade`
--
DROP TABLE IF EXISTS `v_rekap_jurusan_grade`;
-- in use(#1142 - SHOW VIEW command denied to user 'b1sm1llah'@'localhost' for table 'v_rekap_jurusan_grade')

-- --------------------------------------------------------

--
-- Structure for view `v_rekap_kelas`
--
DROP TABLE IF EXISTS `v_rekap_kelas`;
-- in use(#1142 - SHOW VIEW command denied to user 'b1sm1llah'@'localhost' for table 'v_rekap_kelas')

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 01 Okt 2022 pada 10.17
-- Versi Server: 5.6.21
-- PHP Version: 5.6.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `db_madania`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `server`
--

CREATE TABLE IF NOT EXISTS `server` (
`id` int(11) NOT NULL,
  `nama_wilayah` varchar(50) DEFAULT NULL,
  `db_utama` varchar(100) NOT NULL,
  `db_semester` varchar(100) NOT NULL,
  `db_tahun` varchar(50) NOT NULL,
  `default_semester_aktif` varchar(25) NOT NULL,
  `default_tahun_aktif` varchar(25) NOT NULL,
  `db_notif` varchar(50) NOT NULL,
  `aktif` enum('1','0') NOT NULL DEFAULT '1',
  `finger` varchar(15) NOT NULL,
  `tgl_update` datetime NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `server`
--

INSERT INTO `server` (`id`, `nama_wilayah`, `db_utama`, `db_semester`, `db_tahun`, `default_semester_aktif`, `default_tahun_aktif`, `db_notif`, `aktif`, `finger`, `tgl_update`) VALUES
(1, 'Bogor', 'db_madania_bogor', 'db_mdn_bogor', 'db_m_bogor', 'db_mdn_bogor120202021', 'm20192020', 'db_bogor_notif', '1', '757', '2019-04-18 00:00:00'),
(2, 'Makassar', 'db_madania_makassar', 'db_mdn_makassar', 'db_m_makassar', 'db_mdn_makassar120202021', 'm20202021', 'db_bogor_notif', '1', '757', '2019-04-18 00:00:00'),
(3, 'Bogor BNR', 'db_madania_bogor_bnr', 'db_mdn_bogor_bnr', 'db_m_bogor_bnr', 'db_mdn_bogor_bnr120202021', 'm20202021', 'db_bogor_notif', '1', '757', '2020-02-26 00:00:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `server`
--
ALTER TABLE `server`
 ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `server`
--
ALTER TABLE `server`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

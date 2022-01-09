-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 09 Jan 2022 pada 10.14
-- Versi Server: 5.6.21
-- PHP Version: 5.6.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `spksaw`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `bobot_kriteria`
--

CREATE TABLE IF NOT EXISTS `bobot_kriteria` (
`id_bobotkriteria` int(3) NOT NULL,
  `id_jenisbarang` int(3) NOT NULL,
  `id_kriteria` int(3) NOT NULL,
  `bobot` float NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `bobot_kriteria`
--

INSERT INTO `bobot_kriteria` (`id_bobotkriteria`, `id_jenisbarang`, `id_kriteria`, `bobot`) VALUES
(7, 1, 1, 0.5),
(8, 1, 2, 1),
(9, 1, 3, 0.75),
(10, 1, 4, 1),
(11, 1, 5, 1),
(12, 1, 6, 0.5),
(13, 2, 1, 0.25),
(14, 2, 2, 0.5),
(15, 2, 3, 0.75),
(16, 2, 4, 1),
(17, 2, 5, 0.25),
(18, 2, 6, 0.25);

-- --------------------------------------------------------

--
-- Struktur dari tabel `customer`
--

CREATE TABLE IF NOT EXISTS `customer` (
`id_customer` int(3) NOT NULL,
  `namacustomer` varchar(30) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `customer`
--

INSERT INTO `customer` (`id_customer`, `namacustomer`) VALUES
(6, 'Online Diecast Creations Co.'),
(7, 'Blauer See Auto, Co.'),
(8, 'Vitachrome Inc.'),
(9, 'Baane Mini Imports'),
(10, 'Euro+ Shopping Channel'),
(11, 'Danish Wholesale Imports'),
(12, 'Rovelli Gifts'),
(13, 'Land of Toys Inc.'),
(14, 'Cruz & Sons Co.'),
(15, 'Cruz & Sons Co.'),
(16, 'AV Stores, Co.'),
(17, 'Mini Wheels Co.'),
(18, 'Volvo Model Replicas, Co');

-- --------------------------------------------------------

--
-- Struktur dari tabel `hasil`
--

CREATE TABLE IF NOT EXISTS `hasil` (
`id_hasil` int(3) NOT NULL,
  `id_jenisbarang` int(3) NOT NULL,
  `id_customer` int(3) NOT NULL,
  `hasil` float NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `hasil`
--

INSERT INTO `hasil` (`id_hasil`, `id_jenisbarang`, `id_customer`, `hasil`) VALUES
(4, 1, 6, 3.8335),
(5, 1, 7, 4),
(6, 1, 8, 3.75025);

-- --------------------------------------------------------

--
-- Struktur dari tabel `jenis_barang`
--

CREATE TABLE IF NOT EXISTS `jenis_barang` (
`id_jenisbarang` int(3) NOT NULL,
  `namaBarang` varchar(30) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `jenis_barang`
--

INSERT INTO `jenis_barang` (`id_jenisbarang`, `namaBarang`) VALUES
(1, '1969 Harley Davidson Ultimate '),
(2, '1952 Alpine Renault 1300'),
(3, '1996 Moto Guzzi 1100i'),
(4, '2003 Harley-Davidson Eagle Dra'),
(5, '1972 Alfa Romeo GTA'),
(6, '1962 LanciaA Delta 16V'),
(7, '1968 Ford Mustang'),
(8, '2001 Ferrari Enzo'),
(9, '1958 Setra Bus'),
(10, '2002 Suzuki XREO'),
(11, '1969 Corvair Monza'),
(12, '1968 Dodge Charger'),
(13, '1969 Ford Falcon');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kriteria`
--

CREATE TABLE IF NOT EXISTS `kriteria` (
`id_kriteria` int(3) NOT NULL,
  `namaKriteria` varchar(30) NOT NULL,
  `sifat` enum('Benefit','Cost') NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `kriteria`
--

INSERT INTO `kriteria` (`id_kriteria`, `namaKriteria`, `sifat`) VALUES
(1, 'kecepatan pengiriman', 'Cost'),
(2, 'Tingkat Diskon', 'Benefit'),
(3, 'Pelayanan', 'Benefit'),
(4, 'garansi', 'Benefit'),
(5, 'keaslian barang', 'Benefit'),
(6, 'tempo pebayaran', 'Benefit');

-- --------------------------------------------------------

--
-- Struktur dari tabel `nilai_customer`
--

CREATE TABLE IF NOT EXISTS `nilai_customer` (
`id_nilaicustomer` int(3) NOT NULL,
  `id_customer` int(3) NOT NULL,
  `id_jenisbarang` int(3) NOT NULL,
  `id_kriteria` int(3) NOT NULL,
  `id_nilaikriteria` int(3) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `nilai_customer`
--

INSERT INTO `nilai_customer` (`id_nilaicustomer`, `id_customer`, `id_jenisbarang`, `id_kriteria`, `id_nilaikriteria`) VALUES
(19, 6, 1, 1, 23),
(20, 6, 1, 2, 6),
(21, 6, 1, 3, 13),
(22, 6, 1, 4, 16),
(23, 6, 1, 5, 18),
(24, 6, 1, 6, 20),
(25, 7, 1, 1, 23),
(26, 7, 1, 2, 7),
(27, 7, 1, 3, 13),
(28, 7, 1, 4, 15),
(29, 7, 1, 5, 18),
(30, 7, 1, 6, 21),
(31, 8, 1, 1, 25),
(32, 8, 1, 2, 8),
(33, 8, 1, 3, 12),
(34, 8, 1, 4, 27),
(35, 8, 1, 5, 17),
(36, 8, 1, 6, 21);

-- --------------------------------------------------------

--
-- Struktur dari tabel `nilai_kriteria`
--

CREATE TABLE IF NOT EXISTS `nilai_kriteria` (
`id_nilaikriteria` int(3) NOT NULL,
  `id_kriteria` int(3) NOT NULL,
  `nilai` float NOT NULL,
  `keterangan` varchar(50) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `nilai_kriteria`
--

INSERT INTO `nilai_kriteria` (`id_nilaikriteria`, `id_kriteria`, `nilai`, `keterangan`) VALUES
(5, 2, 0.25, '0 % (Tidak ada)'),
(6, 2, 0.5, '1% - 10%'),
(7, 2, 0.75, '11% - 20%'),
(8, 2, 1, '20 % lebih'),
(10, 3, 0, 'sangat buruk'),
(11, 3, 0.25, 'buruk'),
(12, 3, 0.5, 'cukup'),
(13, 3, 0.75, 'puas'),
(14, 4, 0.25, 'tidak ada'),
(15, 4, 0.5, 'kurang dari 1 tahun'),
(16, 4, 0.75, '1 tahun - 2 tahun'),
(17, 5, 0.5, 'KW'),
(18, 5, 1, 'Original / Asli'),
(19, 6, 0.25, 'Kurang dari 1 Minggu'),
(20, 6, 0.5, '1 minggu s/d 2 minggu'),
(21, 6, 0.75, '3 minggu s/d 4 minggu'),
(22, 1, 0.25, '1 Hari'),
(23, 1, 0.5, '2 hari â€“ 7 hari'),
(24, 1, 0.75, '7 hari â€“ 1 bulan'),
(25, 1, 1, '1 bulan lebih'),
(26, 3, 1, 'sangat memuaskan'),
(27, 4, 1, '2 tahun lebih'),
(28, 6, 1, '1 bulan lebih');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE IF NOT EXISTS `user` (
`Id_admin` int(3) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(200) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`Id_admin`, `username`, `password`) VALUES
(1, 'admin', '$2y$10$M80eHFnCpX6RzDiN7LfRNeNMmUZM51y4gT9NqnerVnud9onIWBvyq'),
(2, 'abbror', '$2y$10$cdXgppjZEAYU1z2.hF5ySeZplHPY.wZae6B9ozaZiWKQtutH1lH9O');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bobot_kriteria`
--
ALTER TABLE `bobot_kriteria`
 ADD PRIMARY KEY (`id_bobotkriteria`), ADD KEY `id_jenisbarang` (`id_jenisbarang`), ADD KEY `id_kriteria` (`id_kriteria`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
 ADD PRIMARY KEY (`id_customer`);

--
-- Indexes for table `hasil`
--
ALTER TABLE `hasil`
 ADD PRIMARY KEY (`id_hasil`), ADD KEY `id_jenisbarang` (`id_jenisbarang`), ADD KEY `id_supplier` (`id_customer`);

--
-- Indexes for table `jenis_barang`
--
ALTER TABLE `jenis_barang`
 ADD PRIMARY KEY (`id_jenisbarang`);

--
-- Indexes for table `kriteria`
--
ALTER TABLE `kriteria`
 ADD PRIMARY KEY (`id_kriteria`);

--
-- Indexes for table `nilai_customer`
--
ALTER TABLE `nilai_customer`
 ADD PRIMARY KEY (`id_nilaicustomer`), ADD KEY `id_jenisbarang` (`id_jenisbarang`), ADD KEY `id_kriteria` (`id_kriteria`), ADD KEY `id_nilaikriteria` (`id_nilaikriteria`), ADD KEY `id_supplier` (`id_customer`);

--
-- Indexes for table `nilai_kriteria`
--
ALTER TABLE `nilai_kriteria`
 ADD PRIMARY KEY (`id_nilaikriteria`), ADD KEY `id_kriteria` (`id_kriteria`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
 ADD PRIMARY KEY (`Id_admin`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bobot_kriteria`
--
ALTER TABLE `bobot_kriteria`
MODIFY `id_bobotkriteria` int(3) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
MODIFY `id_customer` int(3) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT for table `hasil`
--
ALTER TABLE `hasil`
MODIFY `id_hasil` int(3) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `jenis_barang`
--
ALTER TABLE `jenis_barang`
MODIFY `id_jenisbarang` int(3) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `kriteria`
--
ALTER TABLE `kriteria`
MODIFY `id_kriteria` int(3) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `nilai_customer`
--
ALTER TABLE `nilai_customer`
MODIFY `id_nilaicustomer` int(3) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=37;
--
-- AUTO_INCREMENT for table `nilai_kriteria`
--
ALTER TABLE `nilai_kriteria`
MODIFY `id_nilaikriteria` int(3) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=29;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
MODIFY `Id_admin` int(3) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `bobot_kriteria`
--
ALTER TABLE `bobot_kriteria`
ADD CONSTRAINT `bobot_kriteria_ibfk_1` FOREIGN KEY (`id_jenisbarang`) REFERENCES `jenis_barang` (`id_jenisbarang`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `bobot_kriteria_ibfk_2` FOREIGN KEY (`id_kriteria`) REFERENCES `kriteria` (`id_kriteria`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `hasil`
--
ALTER TABLE `hasil`
ADD CONSTRAINT `hasil_ibfk_2` FOREIGN KEY (`id_customer`) REFERENCES `customer` (`id_customer`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `hasil_ibfk_3` FOREIGN KEY (`id_jenisbarang`) REFERENCES `jenis_barang` (`id_jenisbarang`);

--
-- Ketidakleluasaan untuk tabel `nilai_customer`
--
ALTER TABLE `nilai_customer`
ADD CONSTRAINT `nilai_customer_ibfk_1` FOREIGN KEY (`id_jenisbarang`) REFERENCES `jenis_barang` (`id_jenisbarang`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `nilai_customer_ibfk_2` FOREIGN KEY (`id_kriteria`) REFERENCES `kriteria` (`id_kriteria`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `nilai_customer_ibfk_4` FOREIGN KEY (`id_nilaikriteria`) REFERENCES `nilai_kriteria` (`id_nilaikriteria`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `nilai_kriteria`
--
ALTER TABLE `nilai_kriteria`
ADD CONSTRAINT `nilai_kriteria_ibfk_1` FOREIGN KEY (`id_kriteria`) REFERENCES `kriteria` (`id_kriteria`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
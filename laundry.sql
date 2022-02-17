-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 17, 2022 at 03:39 AM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 7.4.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `laundry`
--

-- --------------------------------------------------------

--
-- Table structure for table `detail_transaksi`
--

CREATE TABLE `detail_transaksi` (
  `id` int(10) NOT NULL,
  `id_transaksi` varchar(200) NOT NULL,
  `id_paket` int(10) NOT NULL,
  `qty` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `detail_transaksi`
--

INSERT INTO `detail_transaksi` (`id`, `id_transaksi`, `id_paket`, `qty`) VALUES
(15, 'CL-1644279846', 7, 2),
(18, 'CL-1644380254', 5, 3),
(19, 'CL-1644459179', 7, 4),
(20, 'CL-1644537170', 5, 4),
(21, 'CL-1644537350', 5, 3),
(22, 'CL-1644537767', 5, 4);

-- --------------------------------------------------------

--
-- Table structure for table `member`
--

CREATE TABLE `member` (
  `id_member` int(10) NOT NULL,
  `nama_member` varchar(20) NOT NULL,
  `alamat` text NOT NULL,
  `jenis_kelamin` enum('Laki-laki','Perempuan') NOT NULL,
  `tlp` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `member`
--

INSERT INTO `member` (`id_member`, `nama_member`, `alamat`, `jenis_kelamin`, `tlp`) VALUES
(14, 'Arum ', 'Sgs', 'Perempuan', '081979'),
(15, 'Fauziyyah', 'Malang', 'Perempuan', '081978'),
(16, 'Rachell', 'Kpj', 'Perempuan', '081977'),
(17, 'Noval', 'Malang', 'Laki-laki', '081977');

-- --------------------------------------------------------

--
-- Table structure for table `outlet`
--

CREATE TABLE `outlet` (
  `id_outlet` int(10) NOT NULL,
  `nama_outlet` varchar(255) NOT NULL,
  `alamat_outlet` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `outlet`
--

INSERT INTO `outlet` (`id_outlet`, `nama_outlet`, `alamat_outlet`) VALUES
(2, 'Outlet Singosari', 'Singosari'),
(3, 'Outlet Swjjr', 'Sawojajar'),
(4, 'Outlet Suhat', 'Sukarno Hatta'),
(5, 'Outlet Lawang', 'Lawang');

-- --------------------------------------------------------

--
-- Table structure for table `paket`
--

CREATE TABLE `paket` (
  `id_paket` int(10) NOT NULL,
  `jenis` enum('kiloan','selimut','bed_cover','kaos') NOT NULL,
  `harga` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `paket`
--

INSERT INTO `paket` (`id_paket`, `jenis`, `harga`) VALUES
(5, 'kaos', 5000),
(7, 'kiloan', 6000),
(9, 'selimut', 25000);

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `id_transaksi` varchar(200) NOT NULL,
  `id_member` int(10) NOT NULL,
  `tgl` date NOT NULL,
  `batas_waktu` date NOT NULL,
  `tgl_bayar` date NOT NULL,
  `status` enum('baru','proses','selesai','diambil') NOT NULL,
  `dibayar` enum('dibayar','belum_dibayar','','') NOT NULL,
  `kategori` enum('cuci','cuci setrika','setrika','') NOT NULL,
  `id_user` int(11) NOT NULL,
  `total` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `transaksi`
--

INSERT INTO `transaksi` (`id_transaksi`, `id_member`, `tgl`, `batas_waktu`, `tgl_bayar`, `status`, `dibayar`, `kategori`, `id_user`, `total`) VALUES
('CL-1644279846', 17, '0000-00-00', '2022-02-10', '2022-02-11', 'selesai', 'dibayar', 'cuci setrika', 66, 15000),
('CL-1644380254', 14, '2022-02-09', '2022-02-11', '2022-02-12', 'selesai', 'dibayar', 'cuci setrika', 64, 15000),
('CL-1644459179', 15, '2022-02-10', '2022-02-12', '2022-02-11', 'selesai', 'dibayar', 'cuci', 68, 24000),
('CL-1644537170', 17, '2022-02-11', '2022-02-14', '2022-02-15', 'selesai', 'dibayar', 'cuci setrika', 63, 20000),
('CL-1644537350', 15, '2022-02-11', '2022-02-14', '2022-02-15', 'selesai', 'dibayar', 'cuci setrika', 64, 15000),
('CL-1644537767', 16, '2022-02-11', '2022-02-14', '2022-02-15', 'proses', 'belum_dibayar', 'cuci setrika', 68, 20000);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id_user` int(15) NOT NULL,
  `nama_user` varchar(20) NOT NULL,
  `username` varchar(15) NOT NULL,
  `password` text NOT NULL,
  `role` enum('admin','kasir','owner','') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id_user`, `nama_user`, `username`, `password`, `role`) VALUES
(62, 'Arum', 'arum1', '827ccb0eea8a706c4c34a16891f84e7b', 'admin'),
(63, 'Adelia', 'adel8', '827ccb0eea8a706c4c34a16891f84e7b', 'kasir'),
(64, 'Rachell', 'rachell2', '827ccb0eea8a706c4c34a16891f84e7b', 'admin'),
(65, 'Fajril', 'fajril1', '827ccb0eea8a706c4c34a16891f84e7b', 'owner'),
(66, 'Fauziyyah', 'faujiah', '827ccb0eea8a706c4c34a16891f84e7b', 'admin'),
(67, 'adelia', 'adel', '827ccb0eea8a706c4c34a16891f84e7b', 'owner'),
(68, 'Ramanda', 'ramanda08', '827ccb0eea8a706c4c34a16891f84e7b', 'kasir');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `detail_transaksi`
--
ALTER TABLE `detail_transaksi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_transaksi` (`id_transaksi`,`id_paket`),
  ADD KEY `id_paket` (`id_paket`);

--
-- Indexes for table `member`
--
ALTER TABLE `member`
  ADD PRIMARY KEY (`id_member`);

--
-- Indexes for table `outlet`
--
ALTER TABLE `outlet`
  ADD PRIMARY KEY (`id_outlet`);

--
-- Indexes for table `paket`
--
ALTER TABLE `paket`
  ADD PRIMARY KEY (`id_paket`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id_transaksi`),
  ADD KEY `id_member` (`id_member`,`id_user`),
  ADD KEY `id_user` (`id_user`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `detail_transaksi`
--
ALTER TABLE `detail_transaksi`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `member`
--
ALTER TABLE `member`
  MODIFY `id_member` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `outlet`
--
ALTER TABLE `outlet`
  MODIFY `id_outlet` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `paket`
--
ALTER TABLE `paket`
  MODIFY `id_paket` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `detail_transaksi`
--
ALTER TABLE `detail_transaksi`
  ADD CONSTRAINT `detail_transaksi_ibfk_2` FOREIGN KEY (`id_paket`) REFERENCES `paket` (`id_paket`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `detail_transaksi_ibfk_3` FOREIGN KEY (`id_transaksi`) REFERENCES `transaksi` (`id_transaksi`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD CONSTRAINT `transaksi_ibfk_1` FOREIGN KEY (`id_member`) REFERENCES `member` (`id_member`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `transaksi_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

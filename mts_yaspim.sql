-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 11, 2021 at 11:41 AM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 8.0.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mts_yaspim`
--

-- --------------------------------------------------------

--
-- Table structure for table `about`
--

CREATE TABLE `about` (
  `id_about` int(30) NOT NULL,
  `fasilitas` varchar(250) NOT NULL,
  `sarana&prasarana` varchar(250) NOT NULL,
  `gambar` varchar(250) NOT NULL,
  `id user` int(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `berita`
--

CREATE TABLE `berita` (
  `id_berita` int(50) NOT NULL,
  `judul` varchar(250) NOT NULL,
  `tanggal` datetime(6) NOT NULL,
  `isi berita` varchar(500) NOT NULL,
  `gambar` varchar(250) NOT NULL,
  `user_id` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `kontak`
--

CREATE TABLE `kontak` (
  `id_kontak` int(30) NOT NULL,
  `kritik` varchar(250) NOT NULL,
  `saran` varchar(250) NOT NULL,
  `id_user` int(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `profile`
--

CREATE TABLE `profile` (
  `id_profile` int(30) NOT NULL,
  `sejarah` varchar(500) NOT NULL,
  `visi-misi` varchar(250) NOT NULL,
  `kegiatan` varchar(500) NOT NULL,
  `gambar` varchar(250) NOT NULL,
  `id_user` int(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tenaga_pendidik`
--

CREATE TABLE `tenaga_pendidik` (
  `id_pendidik` int(30) NOT NULL,
  `biodata` varchar(500) NOT NULL,
  `foto` varchar(250) NOT NULL,
  `pelajaran` varchar(250) NOT NULL,
  `id_user` int(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id_user` int(30) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `user_name` varchar(50) NOT NULL,
  `password` varchar(20) NOT NULL,
  `role` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `about`
--
ALTER TABLE `about`
  ADD PRIMARY KEY (`id_about`),
  ADD UNIQUE KEY `user_id` (`id_about`);

--
-- Indexes for table `berita`
--
ALTER TABLE `berita`
  ADD PRIMARY KEY (`id_berita`),
  ADD KEY `Id_user` (`id_berita`);

--
-- Indexes for table `kontak`
--
ALTER TABLE `kontak`
  ADD PRIMARY KEY (`id_kontak`),
  ADD KEY `Id_user` (`id_kontak`);

--
-- Indexes for table `profile`
--
ALTER TABLE `profile`
  ADD PRIMARY KEY (`id_profile`),
  ADD KEY `user_id` (`id_user`);

--
-- Indexes for table `tenaga_pendidik`
--
ALTER TABLE `tenaga_pendidik`
  ADD PRIMARY KEY (`id_pendidik`),
  ADD KEY `user_id` (`id_user`) USING BTREE;

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `about`
--
ALTER TABLE `about`
  ADD CONSTRAINT `about_ibfk_1` FOREIGN KEY (`id_about`) REFERENCES `user` (`id_user`) ON DELETE NO ACTION;

--
-- Constraints for table `berita`
--
ALTER TABLE `berita`
  ADD CONSTRAINT `berita_ibfk_1` FOREIGN KEY (`id_berita`) REFERENCES `user` (`id_user`) ON DELETE CASCADE;

--
-- Constraints for table `profile`
--
ALTER TABLE `profile`
  ADD CONSTRAINT `profile_ibfk_1` FOREIGN KEY (`id_profile`) REFERENCES `user` (`id_user`) ON DELETE NO ACTION;

--
-- Constraints for table `tenaga_pendidik`
--
ALTER TABLE `tenaga_pendidik`
  ADD CONSTRAINT `tenaga_pendidik_ibfk_1` FOREIGN KEY (`id_pendidik`) REFERENCES `user` (`id_user`) ON DELETE NO ACTION;

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `kontak` (`id_kontak`) ON DELETE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

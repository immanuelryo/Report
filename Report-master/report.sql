-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 11, 2017 at 11:20 AM
-- Server version: 10.1.21-MariaDB
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `report`
--

-- --------------------------------------------------------

--
-- Table structure for table `laporan`
--

CREATE TABLE `laporan` (
  `laporan_id` int(11) NOT NULL,
  `file_laporan` varchar(255) DEFAULT NULL,
  `image_list` varchar(255) DEFAULT NULL,
  `nama_laporan` varchar(255) DEFAULT NULL,
  `roles` varchar(255) DEFAULT NULL,
  `tanggal_laporan` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `laporan`
--

INSERT INTO `laporan` (`laporan_id`, `file_laporan`, `image_list`, `nama_laporan`, `roles`, `tanggal_laporan`) VALUES
(36, '2670.ppt', '32346.jpg ', 'Asik??', 'DEVELOPER', '2017-07-10 14:19:52'),
(37, 'brute-force-md5-by-ayayank.com.zip', '32351.jpg ', 'Lumayan', 'TECHNICAL', '2017-07-10 14:21:42'),
(38, 'lighting-web.zip', 'ampas.PNG ', 'Ivan Noob', 'ADMIN', '2017-07-10 14:39:37'),
(39, '32346.jpg', 'android_codes_2017.jpg ', 'Ll', 'ADMIN', '2017-07-10 14:41:26'),
(40, '24354 - Copy.jpg', 'ampas.PNG ', 'KK', 'ADMIN', '2017-07-10 14:41:58'),
(41, '24354 - Copy.jpg', '32347.jpg ', 'Bisa', 'ADMIN', '2017-07-10 14:44:20'),
(43, 'w3layouts-License.txt', 'img5.jpg ', 'Orang Baru', 'MANAGER', '2017-07-10 14:53:51'),
(45, '09a._WebServices.pptx', 'img6.jpg ', 'Cepat', 'MANAGER', '2017-07-10 15:32:59'),
(46, 'ganteng.zip', '32345.jpg, 32348.jpg, 32349.jpg', 'Tanpa Spasi', 'MANAGER', '2017-07-11 10:33:47'),
(48, 'w3layouts-License.txt', 'img3.jpg, img4.jpg, img5.jpg', 'Saassa', 'ADMIN', '2017-07-11 14:11:57');

-- --------------------------------------------------------

--
-- Table structure for table `laporan_user`
--

CREATE TABLE `laporan_user` (
  `user_id` int(11) DEFAULT NULL,
  `laporan_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `laporan_user`
--

INSERT INTO `laporan_user` (`user_id`, `laporan_id`) VALUES
(1, 38),
(1, 39),
(1, 40),
(1, 41),
(1, 48),
(2, 36),
(3, 43),
(3, 45),
(3, 46),
(4, 37);

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `role_id` int(11) NOT NULL,
  `role` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`role_id`, `role`) VALUES
(1, 'ADMIN'),
(2, 'DEVELOPER'),
(3, 'MANAGER'),
(4, 'TECHNICAL');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `active` int(11) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `active`, `email`, `last_name`, `name`, `password`) VALUES
(1, 1, 'del@del', 'Sitanggang', 'Immanuel', '$2a$04$BilXvesMa9Rco.ZFBRrbMuEzhX3RmLkP8nsx6oTZ1cwSmMmezOT2.'),
(2, 1, 'ifs14031@del', 'Purba', 'Surya', '$2a$04$BilXvesMa9Rco.ZFBRrbMuEzhX3RmLkP8nsx6oTZ1cwSmMmezOT2.'),
(3, 1, 'ifs14030@del', 'Dian', 'Purba', '$2a$04$BilXvesMa9Rco.ZFBRrbMuEzhX3RmLkP8nsx6oTZ1cwSmMmezOT2.'),
(4, 1, 'del2@del', 'Siahaan', 'Del', '$2a$04$BilXvesMa9Rco.ZFBRrbMuEzhX3RmLkP8nsx6oTZ1cwSmMmezOT2.');

-- --------------------------------------------------------

--
-- Table structure for table `user_role`
--

CREATE TABLE `user_role` (
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_role`
--

INSERT INTO `user_role` (`user_id`, `role_id`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `laporan`
--
ALTER TABLE `laporan`
  ADD PRIMARY KEY (`laporan_id`);

--
-- Indexes for table `laporan_user`
--
ALTER TABLE `laporan_user`
  ADD PRIMARY KEY (`laporan_id`),
  ADD KEY `FK9681cvr3qg4extgbe9ar5s51f` (`user_id`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`role_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `user_role`
--
ALTER TABLE `user_role`
  ADD PRIMARY KEY (`user_id`,`role_id`),
  ADD KEY `FKa68196081fvovjhkek5m97n3y` (`role_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `laporan`
--
ALTER TABLE `laporan`
  MODIFY `laporan_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;
--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `role_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `laporan_user`
--
ALTER TABLE `laporan_user`
  ADD CONSTRAINT `FK7qnk21e8h9ow4wn0mqbwbgyl7` FOREIGN KEY (`laporan_id`) REFERENCES `laporan` (`laporan_id`),
  ADD CONSTRAINT `FK9681cvr3qg4extgbe9ar5s51f` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`);

--
-- Constraints for table `user_role`
--
ALTER TABLE `user_role`
  ADD CONSTRAINT `FK859n2jvi8ivhui0rl0esws6o` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  ADD CONSTRAINT `FKa68196081fvovjhkek5m97n3y` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

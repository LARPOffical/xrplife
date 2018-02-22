-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 22, 2018 at 10:57 PM
-- Server version: 10.1.21-MariaDB
-- PHP Version: 7.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `xrplife`
--

-- --------------------------------------------------------

--
-- Table structure for table `characters`
--

CREATE TABLE `characters` (
  `id` int(11) NOT NULL,
  `license` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `dob` varchar(255) NOT NULL,
  `gender` varchar(255) NOT NULL,
  `model_components` text NOT NULL,
  `bank` bigint(20) NOT NULL,
  `inventory` text NOT NULL,
  `hygiene` text NOT NULL,
  `licenses` text NOT NULL,
  `state` text NOT NULL,
  `sheriff` text NOT NULL,
  `police` text NOT NULL,
  `fire` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `characters`
--

INSERT INTO `characters` (`id`, `license`, `name`, `dob`, `gender`, `model_components`, `bank`, `inventory`, `hygiene`, `licenses`, `state`, `sheriff`, `police`, `fire`) VALUES
(78, 'license:c06fbf1faaf995c7b9e207ef77712971a3ed4dc3', 'Xander Harrison', '1998-09-02', 'Male', '{\"model\":\"mp_m_freemode_01\",\"modelStatus\":\"defaultmodel\",\"clothing\":{\"FACE\":{\"drawid\":0,\"textureid\":0,\"paletteid\":2},\"ACCESSORIES\":{\"drawid\":0,\"textureid\":0,\"paletteid\":2},\"HAIR\":{\"drawid\":0,\"textureid\":0,\"paletteid\":2},\"TORSO\":{\"drawid\":0,\"textureid\":0,\"paletteid\":2},\"LEGS\":{\"drawid\":0,\"textureid\":0,\"paletteid\":2},\"HANDS\":{\"drawid\":0,\"textureid\":0,\"paletteid\":2},\"TEXTURES\":{\"drawid\":0,\"textureid\":0,\"paletteid\":2},\"TASKS\":{\"drawid\":0,\"textureid\":0,\"paletteid\":2},\"TORSO2\":{\"drawid\":0,\"textureid\":0,\"paletteid\":2},\"HEAD\":{\"drawid\":0,\"textureid\":0,\"paletteid\":2},\"FEET\":{\"drawid\":0,\"textureid\":0,\"paletteid\":2},\"EYES\":{\"drawid\":0,\"textureid\":0,\"paletteid\":2}},\"props\":{\"HELMETS\":{\"drawid\":0,\"textureid\":0,\"paletteid\":1},\"EARS\":{\"drawid\":0,\"textureid\":0,\"paletteid\":1},\"GLASSES\":{\"drawid\":0,\"textureid\":0,\"paletteid\":1}}}', 5000, '[]', '{\"hunger\":100,\"thirst\":100}', '[]', '{\"divisions\":[],\"rank\":\"\",\"hasPermission\":false}', '{\"divisions\":[],\"rank\":\"\",\"hasPermission\":false}', '{\"divisions\":[],\"rank\":\"\",\"hasPermission\":false}', '{\"divisions\":[],\"rank\":\"\",\"hasPermission\":false}');

-- --------------------------------------------------------

--
-- Table structure for table `players`
--

CREATE TABLE `players` (
  `id` int(11) NOT NULL,
  `license` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `com_rank` varchar(255) NOT NULL,
  `ban_status` text NOT NULL,
  `whitelisted` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `players`
--

INSERT INTO `players` (`id`, `license`, `name`, `com_rank`, `ban_status`, `whitelisted`) VALUES
(1, 'license:c06fbf1faaf995c7b9e207ef77712971a3ed4dc3', 'X. Cross', 'User', '{\"banned\":false,\"banner\":\"\",\"reason\":\"\"}', 1),
(2, 'license:31823738e32f5de8dda878130057f6184853373a', 'Scotty', 'User', '{\"banner\":\"\",\"banned\":false,\"reason\":\"\"}', 1),
(3, 'license:298fed1456e712e3c9958b1b0cf7585bce4c6c02', 'Trap', 'User', '{\"banner\":\"\",\"reason\":\"\",\"banned\":false}', 1),
(4, 'license:f8836923509ee742274de242072141cfcdc96118', 'Gunslinger', 'User', '{\"banner\":\"\",\"reason\":\"\",\"banned\":false}', 1),
(5, 'license:c0bf15c1a3f79c51abee583eedc2f08e78b976d7', 'Texas Worst Gamer', 'User', '{\"banned\":false,\"banner\":\"\",\"reason\":\"\"}', 0),
(6, 'license:7dfbdd63c794671c32834bd33929c77da6445e8a', 'Dave?', 'User', '{\"reason\":\"\",\"banned\":false,\"banner\":\"\"}', 1),
(7, 'license:fd1054cffabea5d70b7cf60f39210ecee0ddb531', 'DKz_Rook_IE', 'User', '{\"banner\":\"\",\"reason\":\"\",\"banned\":false}', 0),
(8, 'license:5ea39bed33bc855320ef500c2b2b2672bdbc096c', '[S-1] S. Lynn', 'User', '{\"reason\":\"\",\"banned\":false,\"banner\":\"\"}', 1),
(9, 'license:c60129395c899f6e308509cb009792f72f65c115', 'mikrotekst', 'User', '{\"banned\":false,\"banner\":\"\",\"reason\":\"\"}', 0),
(10, 'license:e4b8363b413448b298ca00496d0eb6b8ad920de0', 'Smith', 'User', '{\"reason\":\"\",\"banned\":false,\"banner\":\"\"}', 1),
(11, 'license:ff802012cef4772385f1eaa5ffb31088f0b37995', 'Binary Radeon', 'User', '{\"reason\":\"\",\"banned\":false,\"banner\":\"\"}', 1),
(12, 'license:9d708203595e7b7f88f53e15fdcbce560221e2e1', 'Smiling Terminator', 'User', '{\"banner\":\"\",\"banned\":false,\"reason\":\"\"}', 1),
(13, 'license:ae05f6f98e65a19f2611fed685ef82df26590c5e', 'PcCom1', 'User', '{\"banner\":\"\",\"reason\":\"\",\"banned\":false}', 1),
(14, 'license:0a21c32b6243dde0604a3bfb1e5bc2fc7f1f8f8c', 'TheBoogyMan', 'User', '{\"banner\":\"\",\"banned\":false,\"reason\":\"\"}', 0),
(15, 'license:965706ae5ca2b49c4e296ba91c83182876b3d875', 'Zach', 'User', '{\"banned\":false,\"reason\":\"\",\"banner\":\"\"}', 0),
(16, 'license:8ca9ccb45cce0fd763bb062f2e9a03813850d64b', 'Nicotje1957', 'User', '{\"banner\":\"\",\"reason\":\"\",\"banned\":false}', 0);

-- --------------------------------------------------------

--
-- Table structure for table `vehicles`
--

CREATE TABLE `vehicles` (
  `id` int(11) NOT NULL,
  `license` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `dob` varchar(255) NOT NULL,
  `vehicle_model` varchar(255) NOT NULL,
  `vehicle_components` text NOT NULL,
  `plate` varchar(255) NOT NULL,
  `inventory` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `characters`
--
ALTER TABLE `characters`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `players`
--
ALTER TABLE `players`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vehicles`
--
ALTER TABLE `vehicles`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `characters`
--
ALTER TABLE `characters`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=79;
--
-- AUTO_INCREMENT for table `players`
--
ALTER TABLE `players`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `vehicles`
--
ALTER TABLE `vehicles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

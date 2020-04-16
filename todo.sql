-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 04, 2019 at 10:02 PM
-- Server version: 10.1.36-MariaDB
-- PHP Version: 7.2.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `todo`
--
CREATE DATABASE IF NOT EXISTS `todo` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
USE `todo`;

-- --------------------------------------------------------

--
-- Table structure for table `itemi`
--

CREATE TABLE IF NOT EXISTS `itemi` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `status` int(11) NOT NULL,
  `list_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `list_id` (`list_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- RELATIONSHIPS FOR TABLE `itemi`:
--   `list_id`
--       `liste` -> `id`
--

--
-- Dumping data for table `itemi`
--

INSERT INTO `itemi` (`id`, `content`, `status`, `list_id`) VALUES
(1, 'fruit', 0, 1),
(2, 'vegetable', 0, 1),
(3, 'cheese', 0, 1),
(4, 'prskalice', 0, 2),
(5, 'vinjak', 0, 2),
(6, 'roštilj', 0, 2),
(7, 'salvete', 0, 2),
(8, 'SISJ predavanje', 0, 3),
(9, 'ITEH predavanje', 0, 3);

-- --------------------------------------------------------

--
-- Table structure for table `liste`
--

CREATE TABLE IF NOT EXISTS `liste` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- RELATIONSHIPS FOR TABLE `liste`:
--

--
-- Dumping data for table `liste`
--

INSERT INTO `liste` (`id`, `title`) VALUES
(1, 'Novi title'),
(2, 'New Year'),
(3, 'Monday');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `itemi`
--
ALTER TABLE `itemi`
  ADD CONSTRAINT `itemi_ibfk_1` FOREIGN KEY (`list_id`) REFERENCES `liste` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

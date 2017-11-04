-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 04, 2017 at 11:19 AM
-- Server version: 10.1.26-MariaDB
-- PHP Version: 7.1.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `farmereshop`
--
CREATE DATABASE IF NOT EXISTS `farmereshop` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `farmereshop`;

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE IF NOT EXISTS `cart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` varchar(10) NOT NULL,
  `itemId` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `user` (`user`),
  KEY `itemId` (`itemId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE IF NOT EXISTS `items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) NOT NULL,
  `Type` varchar(10) NOT NULL,
  `Quantity` int(11) NOT NULL,
  `PersonalRate` int(11) NOT NULL,
  `MarketRate` int(11) NOT NULL,
  `Description` varchar(500) NOT NULL,
  `ValidUpto` date NOT NULL,
  `farmer` varchar(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `farmer` (`farmer`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`id`, `Name`, `Type`, `Quantity`, `PersonalRate`, `MarketRate`, `Description`, `ValidUpto`, `farmer`) VALUES
(11, 'Potato', 'vegetable', 3, 20, 10, 'I am most common Vegetable', '2017-11-20', '9467918415'),
(12, 'Grapes', 'grain', 5, 50, 20, 'I am juicy', '2017-11-19', '9467918415'),
(13, 'Tomato', 'vegetable', 60, 50, 30, 'I am red, Use me Everywhere', '2017-11-28', '9467918415'),
(14, 'Apple', 'grain', 24, 150, 70, 'I am red, i belong to kashmir', '2017-11-12', '9467918415');

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE IF NOT EXISTS `notifications` (
  `itemId` int(11) NOT NULL,
  `notificationTo` varchar(10) NOT NULL,
  `notificationFrom` varchar(10) NOT NULL,
  `date` date NOT NULL,
  `status` int(1) NOT NULL DEFAULT '0',
  `cartId` int(11) DEFAULT NULL,
  PRIMARY KEY (`itemId`,`notificationTo`,`notificationFrom`),
  KEY `notificationTo` (`notificationTo`),
  KEY `notificationFrom` (`notificationFrom`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`itemId`, `notificationTo`, `notificationFrom`, `date`, `status`, `cartId`) VALUES
(11, '1000000000', '9467918415', '2017-11-03', 1, NULL),
(11, '6000000000', '9467918415', '2017-11-03', 0, NULL),
(11, '7000000000', '9467918415', '2017-11-03', 0, NULL),
(11, '8000000000', '9467918415', '2017-11-03', 0, NULL),
(12, '1000000000', '9467918415', '2017-11-03', 1, NULL),
(12, '8000000000', '9467918415', '2017-11-03', 0, NULL),
(13, '6000000000', '9467918415', '2017-11-03', 0, NULL),
(13, '7000000000', '9467918415', '2017-11-03', 0, NULL),
(14, '1000000000', '9467918415', '2017-11-03', 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `contactNumber` varchar(10) NOT NULL,
  `password` varchar(20) NOT NULL,
  `fName` varchar(30) NOT NULL,
  `lName` varchar(30) NOT NULL,
  `location` varchar(100) NOT NULL,
  `city` varchar(50) NOT NULL,
  `state` varchar(50) NOT NULL,
  `type` varchar(10) NOT NULL,
  PRIMARY KEY (`contactNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`contactNumber`, `password`, `fName`, `lName`, `location`, `city`, `state`, `type`) VALUES
('1000000000', 'Priya', 'Priya', 'Joshi', 'Lajpat Nagar', 'Delhi', 'Delhi', 'market'),
('6000000000', 'Vinay', 'Vinay', 'Sharma', 'Karol Bagh', 'Delhi', 'Delhi', 'personal'),
('7000000000', 'Gopika', 'Gopika', 'Arora', 'Najafgarh', 'Delhi', 'Delhi', 'personal'),
('8000000000', 'Rohit', 'Rohit', 'Singh', 'civil lines', 'Delhi', 'Delhi', 'market'),
('9000000000', 'Pooja', 'Pooja', 'Kharb', 'Najafgarh', 'Delhi', 'Delhi', 'farmer'),
('9467918415', 'Sahil', 'Sahil', ' Nishal', 'Sector 6', 'Jhajjar', 'Haryana', 'farmer'),
('9871169186', 'Jassa', 'Jassa', 'Singh', 'oiwala', 'Dehradun', 'Uttarakhand', 'farmer');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`user`) REFERENCES `users` (`contactNumber`),
  ADD CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`itemId`) REFERENCES `items` (`id`);

--
-- Constraints for table `items`
--
ALTER TABLE `items`
  ADD CONSTRAINT `items_ibfk_1` FOREIGN KEY (`farmer`) REFERENCES `users` (`contactNumber`);

--
-- Constraints for table `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `notifications_ibfk_1` FOREIGN KEY (`itemId`) REFERENCES `items` (`id`),
  ADD CONSTRAINT `notifications_ibfk_2` FOREIGN KEY (`notificationTo`) REFERENCES `users` (`contactNumber`),
  ADD CONSTRAINT `notifications_ibfk_3` FOREIGN KEY (`notificationFrom`) REFERENCES `users` (`contactNumber`),
  ADD CONSTRAINT `notifications_ibfk_4` FOREIGN KEY (`itemId`) REFERENCES `items` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

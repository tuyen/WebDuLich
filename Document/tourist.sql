-- phpMyAdmin SQL Dump
-- version 4.4.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Nov 04, 2015 at 04:26 AM
-- Server version: 5.6.26
-- PHP Version: 5.6.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tourist`
--
CREATE DATABASE IF NOT EXISTS `tourist` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `tourist`;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE IF NOT EXISTS `category` (
  `CategoryId` int(11) NOT NULL,
  `CategoryName` text
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`CategoryId`, `CategoryName`) VALUES
(1, 'Tour'),
(2, 'Place'),
(3, 'Feeling');

-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

CREATE TABLE IF NOT EXISTS `comment` (
  `CommentId` int(11) NOT NULL,
  `PostId` int(11) NOT NULL,
  `UserId` int(11) NOT NULL,
  `CommentContent` text,
  `DateComment` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `location`
--

CREATE TABLE IF NOT EXISTS `location` (
  `LocationId` int(11) NOT NULL,
  `Name` text,
  `Description` text
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `location`
--

INSERT INTO `location` (`LocationId`, `Name`, `Description`) VALUES
(1, 'Quảng Bình', 'Tỉnh'),
(2, 'Hà Nội', 'Thành Phố'),
(3, 'Đà Lạt', 'Thành Phố'),
(4, 'Đà Năng', 'Thành Phố'),
(5, 'Huế', 'Thành Phố'),
(6, 'Quảng Ngãi', 'Tỉnh'),
(7, 'Vũng Tàu', 'Thành Phố'),
(8, 'Hồ Chí Minh', 'Thành Phố'),
(9, 'Kon Tum', 'Tỉnh'),
(10, 'Bình Định', 'Tỉnh'),
(11, 'Long An', 'Tỉnh'),
(12, 'Quảng Trị', 'Thành Phố'),
(13, 'Kon Tum', 'Thành Phố'),
(14, 'Lào Cai', 'Thành Phố'),
(15, 'Lạng Sơn', 'Thành Phố'),
(16, 'Đắk Lắk', 'Tỉnh'),
(17, 'Cà Mau', 'Thành Phố'),
(18, 'Móng Cái', 'Thành Phố'),
(19, 'Bắc Ninh', 'Tỉnh'),
(20, 'Tuyên Quang', 'Tỉnh');

-- --------------------------------------------------------

--
-- Table structure for table `post`
--

CREATE TABLE IF NOT EXISTS `post` (
  `PostId` int(11) NOT NULL,
  `CategoryId` int(11) NOT NULL,
  `LocationId` int(11) DEFAULT NULL,
  `UserId` int(11) NOT NULL,
  `Title` text,
  `Content` text,
  `Date` datetime DEFAULT NULL,
  `Price` text,
  `Views` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `touristplace`
--

CREATE TABLE IF NOT EXISTS `touristplace` (
  `TourId` int(11) NOT NULL,
  `PlaceId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `UserId` int(11) NOT NULL,
  `FullName` text,
  `Birthday` date DEFAULT NULL,
  `Enail` char(100) DEFAULT NULL,
  `Password` char(100) DEFAULT NULL,
  `LoginToken` char(100) DEFAULT NULL,
  `AccountType` varchar(10) DEFAULT NULL,
  `PHONE` char(15) DEFAULT NULL,
  `Address` text,
  `CompanyName` text,
  `CompanyDescription` text,
  `Status` varchar(5) DEFAULT NULL,
  `ConfirmCode` varchar(50) DEFAULT NULL,
  `Avatar` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`CategoryId`);

--
-- Indexes for table `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`CommentId`),
  ADD KEY `FK_RELATIONSHIP_6` (`UserId`),
  ADD KEY `FK_RELATIONSHIP_7` (`PostId`);

--
-- Indexes for table `location`
--
ALTER TABLE `location`
  ADD PRIMARY KEY (`LocationId`);

--
-- Indexes for table `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`PostId`),
  ADD KEY `FK_RELATIONSHIP_1` (`UserId`),
  ADD KEY `FK_RELATIONSHIP_2` (`CategoryId`),
  ADD KEY `FK_RELATIONSHIP_3` (`LocationId`);

--
-- Indexes for table `touristplace`
--
ALTER TABLE `touristplace`
  ADD PRIMARY KEY (`TourId`,`PlaceId`),
  ADD KEY `FK_RELATIONSHIP_5` (`PlaceId`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`UserId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `CategoryId` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `comment`
--
ALTER TABLE `comment`
  MODIFY `CommentId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `location`
--
ALTER TABLE `location`
  MODIFY `LocationId` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT for table `post`
--
ALTER TABLE `post`
  MODIFY `PostId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `UserId` int(11) NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `FK_RELATIONSHIP_6` FOREIGN KEY (`UserId`) REFERENCES `user` (`UserId`),
  ADD CONSTRAINT `FK_RELATIONSHIP_7` FOREIGN KEY (`PostId`) REFERENCES `post` (`PostId`);

--
-- Constraints for table `post`
--
ALTER TABLE `post`
  ADD CONSTRAINT `FK_RELATIONSHIP_1` FOREIGN KEY (`UserId`) REFERENCES `user` (`UserId`),
  ADD CONSTRAINT `FK_RELATIONSHIP_2` FOREIGN KEY (`CategoryId`) REFERENCES `category` (`CategoryId`),
  ADD CONSTRAINT `FK_RELATIONSHIP_3` FOREIGN KEY (`LocationId`) REFERENCES `location` (`LocationId`);

--
-- Constraints for table `touristplace`
--
ALTER TABLE `touristplace`
  ADD CONSTRAINT `FK_RELATIONSHIP_4` FOREIGN KEY (`TourId`) REFERENCES `post` (`PostId`),
  ADD CONSTRAINT `FK_RELATIONSHIP_5` FOREIGN KEY (`PlaceId`) REFERENCES `post` (`PostId`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

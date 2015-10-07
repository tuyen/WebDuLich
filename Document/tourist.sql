-- phpMyAdmin SQL Dump
-- version 4.3.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Oct 07, 2015 at 09:48 AM
-- Server version: 5.6.24
-- PHP Version: 5.6.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

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
  `CATEGORYID` int(11) NOT NULL,
  `CATEGORYNAME` text
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`CATEGORYID`, `CATEGORYNAME`) VALUES
(1, 'Tour'),
(2, 'Place'),
(3, 'Feeling');

-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

CREATE TABLE IF NOT EXISTS `comment` (
  `USERID` int(11) NOT NULL,
  `POSTID` int(11) NOT NULL,
  `COMMENTCONTENT` text,
  `DATECOMMENT` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `location`
--

CREATE TABLE IF NOT EXISTS `location` (
  `LOCATIONID` int(11) NOT NULL,
  `NAME` text,
  `DESCRIPTION` text
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `location`
--

INSERT INTO `location` (`LOCATIONID`, `NAME`, `DESCRIPTION`) VALUES
(1, 'Quảng Bình', 'Tỉnh'),
(2, 'Hà Nội', 'Thành Phố'),
(3, 'Đà Lạt', 'Thành Phố'),
(4, 'Đà Năng', 'Thành Phố'),
(5, 'Huế', 'Thành Phố'),
(6, 'Quảng Ngãi', 'Tỉnh'),
(7, 'Vũng Tàu', 'Thành Phố'),
(8, 'Hồ Chí Minh', 'Thành Phố'),
(9, 'Kon Tum', 'Tỉnh'),
(10, 'Gia Lai', 'Tỉnh'),
(11, 'Phú Yên', 'Tỉnh');

-- --------------------------------------------------------

--
-- Table structure for table `post`
--

CREATE TABLE IF NOT EXISTS `post` (
  `POSTID` int(11) NOT NULL,
  `CATEGORYID` int(11) NOT NULL,
  `USERID` int(11) NOT NULL,
  `TITLE` text,
  `CONTENT` text,
  `DATE` datetime DEFAULT NULL,
  `PRICE` text,
  `VIEWS` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `touristplace`
--

CREATE TABLE IF NOT EXISTS `touristplace` (
  `POSTID` int(11) NOT NULL,
  `LOCATIONID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `USERID` int(11) NOT NULL,
  `FULLNAME` text,
  `BIRTHDAY` date DEFAULT NULL,
  `EMAIL` char(100) DEFAULT NULL,
  `PASSWORD` char(100) DEFAULT NULL,
  `LOGINTOKEN` char(100) DEFAULT NULL,
  `ACCOUNTTYPE` varchar(10) DEFAULT NULL,
  `PHONE` char(15) DEFAULT NULL,
  `ADDRESS` text,
  `COMPANYNAME` text,
  `COMPANYDESCRIPTION` text,
  `STATUS` varchar(5) DEFAULT NULL,
  `COMFIRRMCODE` varchar(50) DEFAULT NULL,
  `AVATAR` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`CATEGORYID`);

--
-- Indexes for table `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`USERID`,`POSTID`), ADD KEY `FK_COMMENT2` (`POSTID`);

--
-- Indexes for table `location`
--
ALTER TABLE `location`
  ADD PRIMARY KEY (`LOCATIONID`);

--
-- Indexes for table `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`POSTID`), ADD KEY `FK_RELATIONSHIP_1` (`USERID`), ADD KEY `FK_RELATIONSHIP_2` (`CATEGORYID`);

--
-- Indexes for table `touristplace`
--
ALTER TABLE `touristplace`
  ADD PRIMARY KEY (`POSTID`,`LOCATIONID`), ADD KEY `FK_TOURISTPLACE2` (`LOCATIONID`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`USERID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `CATEGORYID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `location`
--
ALTER TABLE `location`
  MODIFY `LOCATIONID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `post`
--
ALTER TABLE `post`
  MODIFY `POSTID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `USERID` int(11) NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `comment`
--
ALTER TABLE `comment`
ADD CONSTRAINT `FK_COMMENT` FOREIGN KEY (`USERID`) REFERENCES `user` (`USERID`),
ADD CONSTRAINT `FK_COMMENT2` FOREIGN KEY (`POSTID`) REFERENCES `post` (`POSTID`);

--
-- Constraints for table `post`
--
ALTER TABLE `post`
ADD CONSTRAINT `FK_RELATIONSHIP_1` FOREIGN KEY (`USERID`) REFERENCES `user` (`USERID`),
ADD CONSTRAINT `FK_RELATIONSHIP_2` FOREIGN KEY (`CATEGORYID`) REFERENCES `category` (`CATEGORYID`);

--
-- Constraints for table `touristplace`
--
ALTER TABLE `touristplace`
ADD CONSTRAINT `FK_TOURISTPLACE` FOREIGN KEY (`POSTID`) REFERENCES `post` (`POSTID`),
ADD CONSTRAINT `FK_TOURISTPLACE2` FOREIGN KEY (`LOCATIONID`) REFERENCES `location` (`LOCATIONID`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

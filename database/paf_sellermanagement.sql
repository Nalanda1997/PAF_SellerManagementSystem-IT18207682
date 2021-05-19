-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 18, 2021 at 02:06 PM
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
-- Database: `paf_sellermanagement`
--

-- --------------------------------------------------------

--
-- Table structure for table `sellerinfo`
--

CREATE TABLE `sellerinfo` (
  `id` int(50) NOT NULL,
  `name` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `phone` varchar(200) NOT NULL,
  `username` varchar(200) NOT NULL,
  `password` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sellerinfo`
--

INSERT INTO `sellerinfo` (`id`, `name`, `email`, `phone`, `username`, `password`) VALUES
(1, 'nalanda', 'nalanda@gmail.com', '0775053354', 'admin', 'admin'),
(2, 'root', 'root@gmail.com', '0778206595', 'root', 'root'),
(7, 'IT18207682', 'IT18207682@my.sliit.lk', '0775053354', 'sliit123', 'sliit123');

-- --------------------------------------------------------

--
-- Table structure for table `sellerproductinfo`
--

CREATE TABLE `sellerproductinfo` (
  `productID` int(50) NOT NULL,
  `productCode` varchar(200) NOT NULL,
  `productName` varchar(200) NOT NULL,
  `productPrice` double NOT NULL,
  `productDesc` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sellerproductinfo`
--

INSERT INTO `sellerproductinfo` (`productID`, `productCode`, `productName`, `productPrice`, `productDesc`) VALUES
(1, 'NS012', 'Photo Edit Software', 23.5, 'Netbean Desktop Photo Edit Software Application'),
(2, 'IA56', 'Online Gallery System', 426.25, 'Online Gallery System using java '),
(5, 'IA2020', 'Online Image Collection', 12.25, 'In this Project using php,mysql,html'),
(6, '11', 'll', 20.5, 'll');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `sellerinfo`
--
ALTER TABLE `sellerinfo`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sellerproductinfo`
--
ALTER TABLE `sellerproductinfo`
  ADD PRIMARY KEY (`productID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `sellerinfo`
--
ALTER TABLE `sellerinfo`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `sellerproductinfo`
--
ALTER TABLE `sellerproductinfo`
  MODIFY `productID` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

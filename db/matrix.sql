-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 09, 2018 at 01:52 PM
-- Server version: 10.1.36-MariaDB
-- PHP Version: 5.6.38

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `matrix`
--

-- --------------------------------------------------------

--
-- Table structure for table `car`
--

CREATE TABLE `car` (
  `carId` int(11) NOT NULL,
  `carName` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `carPrice` double DEFAULT NULL,
  `carOilPrice` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `car`
--

INSERT INTO `car` (`carId`, `carName`, `carPrice`, `carOilPrice`) VALUES
(1, 'รถตู้', 1800, 2.5),
(2, 'รถยนตร์', 900, 2);

-- --------------------------------------------------------

--
-- Table structure for table `mosque`
--

CREATE TABLE `mosque` (
  `mosqueId` int(11) NOT NULL,
  `name` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `latitude` double DEFAULT NULL,
  `longtitude` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `mosque`
--

INSERT INTO `mosque` (`mosqueId`, `name`, `latitude`, `longtitude`) VALUES
(1, 'ดารุซซาอาดะห์', 9.220181, 99.842084),
(2, 'ดารุนอามาล (บ้านปลายทอนเหนือ)', 8.964299, 99.912803),
(3, 'คอเขา', 8.994202, 99.914835),
(4, 'กูวาลา', 9.012355, 99.914534),
(5, 'ดารุนอีบาด๊ะ', 9.020183, 99.911263),
(6, 'ใบรีหยะ  (บ้านพังปริง)', 8.837551, 99.920764),
(7, 'ซูรูกุลฮุดา', 8.825999, 99.923594),
(8, 'ดารุลนาอีม', 8.830295, 99.922367),
(9, 'ดุลอามีน', 8.720528, 99.940688),
(10, 'ดารุซซูฮูดร์', 8.650245, 99.935229),
(11, 'บ้านในถุ้ง', 8.644892, 99.949858),
(12, 'ดารุ้ลอามาล(บ้านหน้าทับ)', 8.588999, 99.858334),
(13, 'ดารุลฮิกมะฮ์(บ้านบางตงเหนือ)', 8.608111, 99.946396),
(14, 'ชีอารุดดีน  (บ้านสระบัว)', 8.634574, 99.951274),
(15, 'ยะมาลุดดีน (ปากน้ำใหม่)', 8.592239, 99.961257),
(16, 'รูฮ์ฮุลลอฮ์', 8.607232, 99.930736),
(17, 'นูรุลฮีดายะห์', 8.672097, 99.937907),
(18, 'นูรุ้ลอิสลาม', 8.594838, 99.964339),
(19, 'ดารุลมุตตากีนอันวารุดดีน (มัสยิดอาเซียน)', 8.605119, 99.952293),
(20, 'บ้านวัดโหนด', 8.600871, 99.918076),
(21, 'บ้านกลาง', 8.606686, 99.925488),
(22, 'บ้านป้าย', 8.620744, 99.927702),
(23, 'บ้านโคกยาร่วง', 8.583289, 99.9242),
(24, 'นูรุดดินยามาอะตุลอิสลาม', 8.614612, 99.927193),
(25, 'แสงจันทร์', 8.597666, 99.928472),
(26, 'มหาสรัต', 8.592937, 99.895087),
(27, 'ซากีมาตนกุปรอ (บ้านอู่ตะเภา)', 8.569529, 99.928999),
(28, 'กาแมล', 8.600353, 99.892626),
(29, 'ดารุลอามาน', 8.589, 99.858332),
(30, 'นูรุนอิสลาม (บ้านมะยิง)', 8.594846, 99.964333),
(32, 'มัสยิดบ้านนำใส', 8.53635, 99.92482),
(33, 'ดารุล', 8.424631, 99.870244),
(34, 'ดารุลวาสัฎ', 8.424628, 99.870247),
(35, 'ญาเมียะ', 8.433863, 99.962854),
(36, 'ซอลาหุดดีน', 8.432577, 99.961291),
(37, 'ดารุลอามาล', 8.441051, 99.880869),
(38, 'มุวะห์ฮิดีน ', 8.455176, 99.9932),
(39, 'นูรุ้ลอิสลาม', 8.455043, 99.988594),
(40, 'กามาลุลอิสลาม', 8.476404, 100.010033),
(41, 'ดุสลาม', 8.442325, 99.960861),
(42, 'นูรุลเอี๊ยะซาน', 8.479497, 100.00898),
(43, 'นุรุลอิสลาม', 13.962321, 99.747317),
(44, 'อัลมูวาห์ฮิดีน  ', 8.450321, 99.919002),
(45, 'การาหมาดบ้านหัวทะเล', 8.453241, 99.934179),
(46, 'บารอกาต (บ้านปัตตานี)', 8.455336, 99.922206),
(47, 'นูรุ้ลอิสลาม', 8.454099, 99.910359),
(48, 'ศรีอรุณอิสลาม', 8.44867, 99.901327),
(49, 'ดาริสลาม', 8.454728, 99.911525),
(50, 'นูรุลญันะฮ์', 8.456185, 99.89993),
(51, 'อุตบุดดีน', 8.440871, 99.932889),
(52, 'ซีรอยุดดีน  (บ้านป่าขอม)', 8.424603, 99.966968),
(53, 'นูรุลมูบีน (บ้านสวนพร้าว)', 8.410159, 99.965333),
(54, 'นูรุดดีน', 8.406622, 99.994034),
(55, 'ดารุ้ลนาอีม (บ้านปากพูนใต้)', 8.514065, 99.974342),
(56, 'ยามาลุดดีน', 8.592231, 99.961256),
(57, 'นูรุ้ลฮิดาย๊ะฮ์', 8.470193, 99.958682),
(58, 'มัสยิดกามาลุดดีน บ้านไสเจริญ', 8.438323, 99.920609),
(59, 'นูรุลฮูดา', 8.400913, 99.953926),
(60, 'นูรุสอาด๊ะ', 8.40229, 99.945866),
(61, 'แสงวิมาน', 8.39208, 100.09219),
(62, 'ดารุ้ลนาอีม', 8.360844, 100.195533),
(63, 'หัวหร่ง', 8.125256, 100.302469),
(64, 'หนองหงษ์', 8.150359, 100.29802),
(65, 'บ้านแสงสุริยา', 8.115332, 100.304365),
(66, 'ดารุลเอียะสาน(มัสยิดบ้านหนองมนต์)', 8.136468, 100.300622),
(67, 'มุสลิมสามัคคี', 8.040972, 100.316776),
(68, 'บ้านแสงสุริยา', 8.115332, 100.304365),
(69, 'ดารุลเอียะสาน (มัสยิดบ้านหนองมนต์)', 8.136468, 100.300622),
(70, 'หน้าสตน (อัลกุบารอ)', 8.098098, 100.307061),
(71, 'มุสลิมสามัคคี(บ้านหน้าศาล)', 8.040972, 100.316776),
(72, 'อัตตักวา', 8.286485, 98.372825),
(73, 'อัตตักวา', 8.286485, 98.372825);

-- --------------------------------------------------------

--
-- Table structure for table `travel`
--

CREATE TABLE `travel` (
  `travelId` int(11) NOT NULL,
  `name` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `latitude` double DEFAULT NULL,
  `longtitude` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `travel`
--

INSERT INTO `travel` (`travelId`, `name`, `latitude`, `longtitude`) VALUES
(1, 'สวนตาสรรค์', 9.266563, 99.759346),
(2, 'ขนอมแกรนด์แคนยอน', 9.261828, 99.764043),
(3, 'จุดชมวิวเนินเทวดา', 9.136469, 99.872505),
(4, 'ชุมชนอ่าวเตล็ด ', 9.31199, 99.783117),
(5, 'วัดเจดีย์ (ไอ้ไข่)', 8.911233, 99.847527),
(6, 'บ้านแหลม โฮมสเตย์', 8.606405, 99.960253),
(7, 'ชุมชนท่องเที่ยวเชิงอนุรักษ์ต้นน้ำกลาย', 8.728776, 99.7315),
(8, 'น้ำตกกรุงชิง นครศรีธรรมราช', 8.718598, 99.691858),
(9, 'ชมวิวทะเลหมอกบนยอดเขาเหล็ก บ้านกรุงชิง', 8.776251, 99.72371),
(10, 'ทะเลหมอกเขาจังโหลน ', 8.758841, 99.621343),
(11, ' วัดพระมหาธาตุวรมหาวิหาร นครศรีธรรมราช', 8.41102, 99.966142),
(12, 'ศาลหลักเมือง นครศรีธรรมราช', 8.430441, 99.962158),
(13, 'บ้านหนังตะลุงสุชาติ', 8.414697, 99.968493),
(14, 'ชุมชนทุ่งแสงเดือน', 8.465183, 99.89692),
(15, 'ตลาดย้อนยุคปากพนัง', 8.355632, 100.19899),
(16, 'วิสาหกิจชุมชนท่องเที่ยวเชิงเกษตรบ้านสวนพอเพีย', 8.152491, 100.277514),
(17, ' หมู่บ้านคีรีวง นครศรีธรรมราช', 8.434045, 99.780377);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `car`
--
ALTER TABLE `car`
  ADD PRIMARY KEY (`carId`);

--
-- Indexes for table `mosque`
--
ALTER TABLE `mosque`
  ADD PRIMARY KEY (`mosqueId`);

--
-- Indexes for table `travel`
--
ALTER TABLE `travel`
  ADD PRIMARY KEY (`travelId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `mosque`
--
ALTER TABLE `mosque`
  MODIFY `mosqueId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=74;

--
-- AUTO_INCREMENT for table `travel`
--
ALTER TABLE `travel`
  MODIFY `travelId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

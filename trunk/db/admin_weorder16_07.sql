-- phpMyAdmin SQL Dump
-- version 3.5.5
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jul 16, 2013 at 07:47 PM
-- Server version: 5.1.65
-- PHP Version: 5.2.17

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `admin_weorder`
--

-- --------------------------------------------------------

--
-- Table structure for table `address`
--

CREATE TABLE IF NOT EXISTS `address` (
  `address_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `company` varchar(32) NOT NULL,
  `company_id` varchar(32) NOT NULL,
  `tax_id` varchar(32) NOT NULL,
  `address_1` varchar(128) NOT NULL,
  `address_2` varchar(128) NOT NULL,
  `city` varchar(128) NOT NULL,
  `postcode` varchar(10) NOT NULL,
  `country_id` int(11) NOT NULL DEFAULT '0',
  `zone_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`address_id`),
  KEY `customer_id` (`customer_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=20 ;

--
-- Dumping data for table `address`
--

INSERT INTO `address` (`address_id`, `customer_id`, `firstname`, `lastname`, `company`, `company_id`, `tax_id`, `address_1`, `address_2`, `city`, `postcode`, `country_id`, `zone_id`) VALUES
(1, 1, 'Sơn', 'Trần', '', '', '', 'Từ SƠn ', '', 'Bắc Ninh', '', 230, 3755),
(16, 17, 'Dương Thượng Hảo', '', '', '', '', '129 Phan Văn Trường - Cầu Giấy', '', '', '', 230, 3776),
(17, 18, 'Trần Minh Đức', '', '', '', '', '72-Vũ Hữu - Thanh Xuân', '', '', '', 230, 3776),
(18, 19, 'Ngoc Anh', '', '', '', '', '303 CT8 ĐỊnh Công', '', '', '', 230, 3776),
(19, 20, 'Đặng huyền ngọc', '', '', '', '', 'Nhà 2,ngách 105/11,ngõ 105 Yên Hoà Cầu Giấy, Hà Nội', '', '', '', 230, 3776);

-- --------------------------------------------------------

--
-- Table structure for table `affiliate`
--

CREATE TABLE IF NOT EXISTS `affiliate` (
  `affiliate_id` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `fax` varchar(32) NOT NULL,
  `password` varchar(40) NOT NULL,
  `salt` varchar(9) NOT NULL,
  `company` varchar(32) NOT NULL,
  `website` varchar(255) NOT NULL,
  `address_1` varchar(128) NOT NULL,
  `address_2` varchar(128) NOT NULL,
  `city` varchar(128) NOT NULL,
  `postcode` varchar(10) NOT NULL,
  `country_id` int(11) NOT NULL,
  `zone_id` int(11) NOT NULL,
  `code` varchar(64) NOT NULL,
  `commission` decimal(4,2) NOT NULL DEFAULT '0.00',
  `tax` varchar(64) NOT NULL,
  `payment` varchar(6) NOT NULL,
  `cheque` varchar(100) NOT NULL,
  `paypal` varchar(64) NOT NULL,
  `bank_name` varchar(64) NOT NULL,
  `bank_branch_number` varchar(64) NOT NULL,
  `bank_swift_code` varchar(64) NOT NULL,
  `bank_account_name` varchar(64) NOT NULL,
  `bank_account_number` varchar(64) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `approved` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`affiliate_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `affiliate_transaction`
--

CREATE TABLE IF NOT EXISTS `affiliate_transaction` (
  `affiliate_transaction_id` int(11) NOT NULL AUTO_INCREMENT,
  `affiliate_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `description` text NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`affiliate_transaction_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `attribute`
--

CREATE TABLE IF NOT EXISTS `attribute` (
  `attribute_id` int(11) NOT NULL AUTO_INCREMENT,
  `attribute_group_id` int(11) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`attribute_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

--
-- Dumping data for table `attribute`
--

INSERT INTO `attribute` (`attribute_id`, `attribute_group_id`, `sort_order`) VALUES
(1, 6, 1),
(2, 6, 5),
(3, 6, 3),
(4, 3, 1),
(5, 3, 2),
(6, 3, 3),
(7, 3, 4),
(8, 3, 5),
(9, 3, 6),
(10, 3, 7),
(11, 3, 8);

-- --------------------------------------------------------

--
-- Table structure for table `attribute_description`
--

CREATE TABLE IF NOT EXISTS `attribute_description` (
  `attribute_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`attribute_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `attribute_description`
--

INSERT INTO `attribute_description` (`attribute_id`, `language_id`, `name`) VALUES
(1, 2, 'Description'),
(2, 2, 'No. of Cores'),
(4, 2, 'test 1'),
(5, 2, 'test 2'),
(6, 2, 'test 3'),
(7, 2, 'test 4'),
(8, 2, 'test 5'),
(9, 2, 'test 6'),
(10, 2, 'test 7'),
(11, 2, 'test 8'),
(3, 2, 'Clockspeed');

-- --------------------------------------------------------

--
-- Table structure for table `attribute_group`
--

CREATE TABLE IF NOT EXISTS `attribute_group` (
  `attribute_group_id` int(11) NOT NULL AUTO_INCREMENT,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`attribute_group_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `attribute_group`
--

INSERT INTO `attribute_group` (`attribute_group_id`, `sort_order`) VALUES
(3, 2),
(4, 1),
(5, 3),
(6, 4);

-- --------------------------------------------------------

--
-- Table structure for table `attribute_group_description`
--

CREATE TABLE IF NOT EXISTS `attribute_group_description` (
  `attribute_group_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`attribute_group_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `attribute_group_description`
--

INSERT INTO `attribute_group_description` (`attribute_group_id`, `language_id`, `name`) VALUES
(3, 2, 'Memory'),
(4, 2, 'Technical'),
(5, 2, 'Motherboard'),
(6, 2, 'Processor');

-- --------------------------------------------------------

--
-- Table structure for table `banner`
--

CREATE TABLE IF NOT EXISTS `banner` (
  `banner_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`banner_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=14 ;

--
-- Dumping data for table `banner`
--

INSERT INTO `banner` (`banner_id`, `name`, `status`) VALUES
(7, 'Slideshow trang chủ', 1),
(8, 'Tin nóng hàng ngày', 1),
(9, 'Slideshow Danh mục', 1),
(11, 'Tin nóng - ảnh nhỏ 1', 1),
(12, 'Tin nóng - ảnh nhỏ 2', 1),
(13, 'test slideshow', 1);

-- --------------------------------------------------------

--
-- Table structure for table `banner_image`
--

CREATE TABLE IF NOT EXISTS `banner_image` (
  `banner_image_id` int(11) NOT NULL AUTO_INCREMENT,
  `banner_id` int(11) NOT NULL,
  `link` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  PRIMARY KEY (`banner_image_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=132 ;

--
-- Dumping data for table `banner_image`
--

INSERT INTO `banner_image` (`banner_image_id`, `banner_id`, `link`, `image`) VALUES
(93, 7, '', 'data/slide_02.jpg'),
(92, 7, '', 'data/slide_01.jpg'),
(91, 7, '', 'data/slide_00.jpg'),
(126, 9, '', 'data/MAN_en.jpg'),
(123, 11, 'http://asos.com', 'data/tin tuc/1136899_300.jpg'),
(124, 12, 'http://forever21.com', 'data/tin tuc/forever-21-logo-530x530.jpg'),
(125, 8, 'http://diesel.com', 'data/tin tuc/006.jpg'),
(131, 13, 'http://dathangquocte.vn/index.php?route=checkout/cart', 'data/dat hang ngay.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `banner_image_description`
--

CREATE TABLE IF NOT EXISTS `banner_image_description` (
  `banner_image_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `banner_id` int(11) NOT NULL,
  `title` varchar(64) NOT NULL,
  PRIMARY KEY (`banner_image_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `banner_image_description`
--

INSERT INTO `banner_image_description` (`banner_image_id`, `language_id`, `banner_id`, `title`) VALUES
(93, 2, 7, 'ssssssss'),
(92, 2, 7, 'ssssssssssssssssss'),
(91, 2, 7, 'sssssss'),
(126, 2, 9, 'hdfhdfhd'),
(123, 2, 11, 'Góc phải trên'),
(124, 2, 12, 'Ảnh nhỏ 2 tựa đề'),
(131, 2, 13, 'Đặt hàng ngay'),
(125, 2, 8, 'TIN SIÊU HOT');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE IF NOT EXISTS `category` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `image` varchar(255) DEFAULT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `top` tinyint(1) NOT NULL,
  `top2` tinyint(1) NOT NULL,
  `column` int(3) NOT NULL,
  `sort_order` int(3) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`category_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=116 ;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`category_id`, `image`, `parent_id`, `top`, `top2`, `column`, `sort_order`, `status`, `date_added`, `date_modified`) VALUES
(25, '', 0, 1, 0, 1, 1, 1, '2009-01-31 01:04:25', '2013-07-15 07:04:08'),
(33, '', 0, 1, 0, 1, 0, 1, '2009-02-03 14:17:55', '2013-07-15 07:05:01'),
(59, '', 0, 1, 0, 1, 2, 1, '2013-05-20 23:43:15', '2013-05-20 23:44:07'),
(74, '', 33, 0, 0, 1, 0, 1, '2013-07-13 21:09:00', '2013-07-13 21:09:00'),
(61, '', 33, 0, 0, 1, 0, 1, '2013-05-23 22:39:28', '2013-07-13 21:01:58'),
(62, '', 33, 0, 0, 1, 2, 1, '2013-05-23 22:39:49', '2013-05-29 00:21:27'),
(63, '', 25, 0, 0, 1, 0, 1, '2013-05-23 22:40:41', '2013-05-23 22:40:41'),
(65, '', 25, 0, 0, 1, 3, 1, '2013-05-23 22:42:16', '2013-05-23 22:42:22'),
(69, '', 33, 0, 0, 1, 0, 1, '2013-07-13 21:03:31', '2013-07-13 21:03:31'),
(68, '', 33, 0, 0, 1, 0, 1, '2013-07-12 18:26:54', '2013-07-12 18:26:54'),
(70, '', 33, 0, 0, 1, 0, 1, '2013-07-13 21:04:55', '2013-07-13 21:04:55'),
(71, '', 33, 0, 0, 1, 0, 1, '2013-07-13 21:05:42', '2013-07-13 21:05:42'),
(72, '', 33, 0, 0, 1, 0, 1, '2013-07-13 21:06:40', '2013-07-13 21:06:40'),
(73, '', 33, 0, 0, 1, 0, 1, '2013-07-13 21:07:55', '2013-07-13 21:07:55'),
(75, '', 33, 0, 0, 1, 0, 1, '2013-07-13 21:09:46', '2013-07-13 21:09:46'),
(76, '', 33, 0, 0, 1, 0, 1, '2013-07-13 21:10:23', '2013-07-13 21:10:23'),
(77, '', 62, 0, 0, 1, 0, 1, '2013-07-13 21:11:38', '2013-07-13 21:11:38'),
(78, '', 62, 0, 0, 1, 0, 1, '2013-07-13 21:12:24', '2013-07-13 21:12:24'),
(79, '', 62, 0, 0, 1, 0, 1, '2013-07-13 21:13:16', '2013-07-13 21:13:16'),
(80, '', 62, 0, 0, 1, 0, 1, '2013-07-13 21:14:00', '2013-07-13 21:14:00'),
(81, '', 62, 0, 0, 1, 0, 1, '2013-07-13 21:14:42', '2013-07-13 21:14:42'),
(82, '', 62, 0, 0, 1, 0, 1, '2013-07-13 21:15:19', '2013-07-13 21:15:19'),
(83, '', 62, 0, 0, 1, 0, 1, '2013-07-13 21:15:51', '2013-07-13 21:15:51'),
(84, '', 62, 0, 0, 1, 0, 1, '2013-07-13 21:16:39', '2013-07-13 21:16:39'),
(85, '', 62, 0, 0, 1, 0, 1, '2013-07-13 21:17:10', '2013-07-13 21:17:10'),
(86, '', 62, 0, 0, 1, 0, 1, '2013-07-13 21:17:53', '2013-07-13 21:17:53'),
(87, '', 62, 0, 0, 1, 0, 1, '2013-07-13 21:19:02', '2013-07-13 21:19:02'),
(88, '', 25, 0, 0, 1, 0, 1, '2013-07-13 21:20:06', '2013-07-13 21:20:06'),
(89, '', 25, 0, 0, 1, 0, 1, '2013-07-13 21:20:41', '2013-07-13 21:20:41'),
(90, '', 25, 0, 0, 1, 0, 1, '2013-07-13 21:21:18', '2013-07-13 21:21:18'),
(91, '', 25, 0, 0, 1, 0, 1, '2013-07-13 21:21:52', '2013-07-13 21:21:52'),
(92, '', 25, 0, 0, 1, 0, 1, '2013-07-13 21:22:22', '2013-07-13 21:22:22'),
(93, '', 25, 0, 0, 1, 0, 1, '2013-07-13 21:22:49', '2013-07-13 21:22:49'),
(94, '', 25, 0, 0, 1, 0, 1, '2013-07-13 21:23:19', '2013-07-13 21:23:19'),
(95, '', 25, 0, 0, 1, 0, 1, '2013-07-13 21:23:53', '2013-07-13 21:23:53'),
(96, '', 25, 0, 0, 1, 0, 1, '2013-07-13 21:24:35', '2013-07-13 21:24:35'),
(97, '', 25, 0, 0, 1, 0, 1, '2013-07-13 21:25:23', '2013-07-13 21:25:23'),
(98, '', 25, 0, 0, 1, 0, 1, '2013-07-13 21:25:57', '2013-07-13 21:25:57'),
(99, '', 25, 0, 0, 1, 0, 1, '2013-07-13 21:26:28', '2013-07-13 21:26:28'),
(100, '', 25, 0, 0, 1, 0, 1, '2013-07-13 21:27:10', '2013-07-13 21:27:10'),
(101, '', 25, 0, 0, 1, 0, 1, '2013-07-13 21:27:43', '2013-07-13 21:27:43'),
(102, '', 65, 0, 0, 1, 0, 1, '2013-07-13 21:28:19', '2013-07-13 21:28:19'),
(103, '', 65, 0, 0, 1, 0, 1, '2013-07-13 21:28:45', '2013-07-13 21:28:45'),
(104, '', 65, 0, 0, 1, 0, 1, '2013-07-13 21:29:35', '2013-07-13 21:29:35'),
(105, '', 65, 0, 0, 1, 0, 1, '2013-07-13 21:30:07', '2013-07-13 21:30:07'),
(106, '', 65, 0, 0, 1, 0, 1, '2013-07-13 21:30:30', '2013-07-13 21:30:30'),
(107, '', 65, 0, 0, 1, 0, 1, '2013-07-13 21:31:09', '2013-07-13 21:31:09'),
(108, '', 65, 0, 0, 1, 0, 1, '2013-07-13 21:31:44', '2013-07-13 21:35:00'),
(109, '', 65, 0, 0, 1, 0, 1, '2013-07-13 21:32:26', '2013-07-13 21:35:48'),
(110, '', 65, 0, 0, 1, 0, 1, '2013-07-13 21:32:53', '2013-07-13 21:32:53'),
(111, '', 65, 0, 0, 1, 0, 1, '2013-07-13 21:33:19', '2013-07-13 21:33:19'),
(112, '', 65, 0, 0, 1, 0, 1, '2013-07-13 21:33:49', '2013-07-13 21:33:49'),
(113, '', 65, 0, 0, 1, 0, 1, '2013-07-13 21:34:29', '2013-07-13 21:34:29');

-- --------------------------------------------------------

--
-- Table structure for table `category_description`
--

CREATE TABLE IF NOT EXISTS `category_description` (
  `category_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `meta_keyword` varchar(255) NOT NULL,
  PRIMARY KEY (`category_id`,`language_id`),
  KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `category_description`
--

INSERT INTO `category_description` (`category_id`, `language_id`, `name`, `description`, `meta_description`, `meta_keyword`) VALUES
(33, 2, 'Nam', '', '', 'nam'),
(59, 2, 'Trẻ em', '', '', ''),
(25, 2, 'Nữ', '', '', ''),
(74, 2, 'Đồ công sở', '', 'Đồ công sở lịch sự', 'Đồ công sở'),
(61, 2, 'Áo phông', '', 'Áo phông nam', 'Áo phông nam'),
(62, 2, 'Phụ kiện', '', '', ''),
(63, 2, 'Quần', '', '', ''),
(65, 2, 'Phụ kiện', '', '', ''),
(68, 2, 'Áo len', '', '', ''),
(69, 2, 'Áo sơ mi', '', 'Áo sơ mi dài tay ngắn tay', 'Áo sơ mi nam'),
(70, 2, 'Áo khoác', '', 'Áo khoác nam các loại', 'Áo khoác nam'),
(71, 2, 'Quần Jeans', '', 'quần bò nam', 'quần bò'),
(72, 2, 'Quần short', '', 'Quần lửng, quần ngố', 'quần short nam'),
(73, 2, 'Quần vải, quần kaki', '', '', ''),
(75, 2, 'Đồ bơi', '', 'Đồ bơi cho nam', 'Đồ bơi'),
(76, 2, 'Đồ lót', '', 'Đồ lót nam', 'đồ lót'),
(77, 2, 'Nước hoa', '', 'nước hoa cho nam giới', 'nước hoa'),
(78, 2, 'Ví', '', 'Ví da nam ', 'Ví da'),
(79, 2, 'Túi xách', '', 'Cặp sách, túi xách nam', 'túi xách'),
(80, 2, 'Đồng hồ', '', 'Đồng hồ đeo tay', 'đồng hồ nam'),
(81, 2, 'Kính', '', 'Kính mắt nam', 'Kính nam'),
(82, 2, 'Giầy dép', '', 'giầy dép nam', 'Giầy nam'),
(83, 2, 'Thắt lưng', '', 'Thắt lưng nam', 'thắt lưng nam'),
(84, 2, 'Cà vạt, kẹp cà vạt', '', 'Cà vạt cho nam', 'cà vạt nam'),
(85, 2, 'Khăn', '', 'Khăn cho nam', 'khăn nam'),
(86, 2, 'Vali', '', 'vali cho nam', 'vali nam'),
(87, 2, 'Trang sức', '', 'vòng đeo tay nam', 'vòng cổ vòng tay nam'),
(88, 2, 'Áo kiểu', '', 'Áo kiểu cho nữ', 'Áo kiểu'),
(89, 2, 'Áo phông', '', 'Áo phông cho nữ', 'áo phông nữ'),
(90, 2, 'Áo sơ mi', '', 'Áo sơ mi cho nữ', 'Áo sơ mi nữ'),
(91, 2, 'Áo khoác ', '', 'Áo khoác cho nữ', 'Áo khoác nữ'),
(92, 2, 'Váy', '', 'Váy cho nữ', 'Váy nữ'),
(93, 2, 'Chân váy', '', 'Chân váy cho nữ', 'chân váy'),
(94, 2, 'Quần vải, quần kaki', '', 'Quần vải nữ', 'Quần vải nữ'),
(95, 2, 'Quần Jeans', '', 'Quần jeans nữ', 'quần jeans nữ'),
(96, 2, 'Quần short', '', 'Quần short cho nữ', 'quần short nữ'),
(97, 2, 'Đồ công sở', '', 'Đồ công sở cho nữ', 'đồ công sở nữ'),
(98, 2, 'Đồ bà bầu', '', 'đồ cho bà bầu', 'đồ bầu'),
(99, 2, 'Đồ ngủ', '', 'Đồ ngủ cho nữ', 'đồ ngủ'),
(100, 2, 'Bikini', '', 'Đồ bơi cho nữ', 'bikini'),
(101, 2, 'Đồ lót', '', 'Đồ lót nữ', 'đồ lót nữ'),
(102, 2, 'Nước hoa', '', 'nước hoa cho nữ', 'nước hoa nữ'),
(103, 2, 'Ví', '', 'ví nữ', 'ví nữ'),
(104, 2, 'Túi xách', '', 'Túi xách cho nữ', 'túi xách nữ'),
(105, 2, 'Đồng hồ', '', 'đồng hồ nữ', 'đồng hồ nữ'),
(106, 2, 'Mũ', '', 'mũ nữ', 'mũ nữ'),
(107, 2, 'Kính', '', 'kính nữ', 'kính nữ'),
(108, 2, 'Giầy dép', '', 'giầy dép cho nữ', 'giầy nữ'),
(109, 2, 'Thắt lưng', '', 'Thắt lưng cho nữ', 'thắt lưng nữ'),
(110, 2, 'Nữ trang', '', 'nữ trang', 'nữ trang'),
(111, 2, 'Khăn', '', 'khăn cho nữ', 'khăn nữ'),
(112, 2, 'Vali', '', 'Vali nữ', 'vali nữ'),
(113, 2, 'Trang sức', '', 'Trang sức cho nữ', 'Trang sức');

-- --------------------------------------------------------

--
-- Table structure for table `category_filter`
--

CREATE TABLE IF NOT EXISTS `category_filter` (
  `category_id` int(11) NOT NULL,
  `filter_id` int(11) NOT NULL,
  PRIMARY KEY (`category_id`,`filter_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `category_path`
--

CREATE TABLE IF NOT EXISTS `category_path` (
  `category_id` int(11) NOT NULL,
  `path_id` int(11) NOT NULL,
  `level` int(11) NOT NULL,
  PRIMARY KEY (`category_id`,`path_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `category_path`
--

INSERT INTO `category_path` (`category_id`, `path_id`, `level`) VALUES
(25, 25, 0),
(33, 33, 0),
(59, 59, 0),
(74, 33, 0),
(74, 74, 1),
(61, 33, 0),
(61, 61, 1),
(62, 33, 0),
(62, 62, 1),
(63, 25, 0),
(63, 63, 1),
(65, 25, 0),
(65, 65, 1),
(69, 33, 0),
(68, 33, 0),
(68, 68, 1),
(69, 69, 1),
(70, 33, 0),
(70, 70, 1),
(71, 33, 0),
(71, 71, 1),
(72, 33, 0),
(72, 72, 1),
(73, 33, 0),
(73, 73, 1),
(75, 33, 0),
(75, 75, 1),
(76, 33, 0),
(76, 76, 1),
(77, 33, 0),
(77, 62, 1),
(77, 77, 2),
(78, 33, 0),
(78, 62, 1),
(78, 78, 2),
(79, 33, 0),
(79, 62, 1),
(79, 79, 2),
(80, 33, 0),
(80, 62, 1),
(80, 80, 2),
(81, 33, 0),
(81, 62, 1),
(81, 81, 2),
(82, 33, 0),
(82, 62, 1),
(82, 82, 2),
(83, 33, 0),
(83, 62, 1),
(83, 83, 2),
(84, 33, 0),
(84, 62, 1),
(84, 84, 2),
(85, 33, 0),
(85, 62, 1),
(85, 85, 2),
(86, 33, 0),
(86, 62, 1),
(86, 86, 2),
(87, 33, 0),
(87, 62, 1),
(87, 87, 2),
(88, 25, 0),
(88, 88, 1),
(89, 25, 0),
(89, 89, 1),
(90, 25, 0),
(90, 90, 1),
(91, 25, 0),
(91, 91, 1),
(92, 25, 0),
(92, 92, 1),
(93, 25, 0),
(93, 93, 1),
(94, 25, 0),
(94, 94, 1),
(95, 25, 0),
(95, 95, 1),
(96, 25, 0),
(96, 96, 1),
(97, 25, 0),
(97, 97, 1),
(98, 25, 0),
(98, 98, 1),
(99, 25, 0),
(99, 99, 1),
(100, 25, 0),
(100, 100, 1),
(101, 25, 0),
(101, 101, 1),
(102, 25, 0),
(102, 65, 1),
(102, 102, 2),
(103, 25, 0),
(103, 65, 1),
(103, 103, 2),
(104, 25, 0),
(104, 65, 1),
(104, 104, 2),
(105, 25, 0),
(105, 65, 1),
(105, 105, 2),
(106, 25, 0),
(106, 65, 1),
(106, 106, 2),
(107, 25, 0),
(107, 65, 1),
(107, 107, 2),
(108, 25, 0),
(108, 108, 2),
(109, 25, 0),
(109, 109, 2),
(110, 25, 0),
(110, 65, 1),
(110, 110, 2),
(111, 25, 0),
(111, 65, 1),
(111, 111, 2),
(112, 25, 0),
(112, 65, 1),
(112, 112, 2),
(113, 25, 0),
(113, 65, 1),
(113, 113, 2),
(108, 65, 1),
(109, 65, 1);

-- --------------------------------------------------------

--
-- Table structure for table `category_to_layout`
--

CREATE TABLE IF NOT EXISTS `category_to_layout` (
  `category_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL,
  PRIMARY KEY (`category_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `category_to_layout`
--

INSERT INTO `category_to_layout` (`category_id`, `store_id`, `layout_id`) VALUES
(61, 0, 3),
(62, 0, 3),
(63, 0, 3),
(65, 0, 3);

-- --------------------------------------------------------

--
-- Table structure for table `category_to_store`
--

CREATE TABLE IF NOT EXISTS `category_to_store` (
  `category_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  PRIMARY KEY (`category_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `category_to_store`
--

INSERT INTO `category_to_store` (`category_id`, `store_id`) VALUES
(25, 0),
(33, 0),
(59, 0),
(61, 0),
(62, 0),
(63, 0),
(65, 0),
(68, 0),
(69, 0),
(70, 0),
(71, 0),
(72, 0),
(73, 0),
(74, 0),
(75, 0),
(76, 0),
(77, 0),
(78, 0),
(79, 0),
(80, 0),
(81, 0),
(82, 0),
(83, 0),
(84, 0),
(85, 0),
(86, 0),
(87, 0),
(88, 0),
(89, 0),
(90, 0),
(91, 0),
(92, 0),
(93, 0),
(94, 0),
(95, 0),
(96, 0),
(97, 0),
(98, 0),
(99, 0),
(100, 0),
(101, 0),
(102, 0),
(103, 0),
(104, 0),
(105, 0),
(106, 0),
(107, 0),
(108, 0),
(109, 0),
(110, 0),
(111, 0),
(112, 0),
(113, 0);

-- --------------------------------------------------------

--
-- Table structure for table `country`
--

CREATE TABLE IF NOT EXISTS `country` (
  `country_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `iso_code_2` varchar(2) NOT NULL,
  `iso_code_3` varchar(3) NOT NULL,
  `address_format` text NOT NULL,
  `postcode_required` tinyint(1) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`country_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=252 ;

--
-- Dumping data for table `country`
--

INSERT INTO `country` (`country_id`, `name`, `iso_code_2`, `iso_code_3`, `address_format`, `postcode_required`, `status`) VALUES
(1, 'Afghanistan', 'AF', 'AFG', '', 0, 1),
(2, 'Albania', 'AL', 'ALB', '', 0, 1),
(3, 'Algeria', 'DZ', 'DZA', '', 0, 1),
(4, 'American Samoa', 'AS', 'ASM', '', 0, 1),
(5, 'Andorra', 'AD', 'AND', '', 0, 1),
(6, 'Angola', 'AO', 'AGO', '', 0, 1),
(7, 'Anguilla', 'AI', 'AIA', '', 0, 1),
(8, 'Antarctica', 'AQ', 'ATA', '', 0, 1),
(9, 'Antigua and Barbuda', 'AG', 'ATG', '', 0, 1),
(10, 'Argentina', 'AR', 'ARG', '', 0, 1),
(11, 'Armenia', 'AM', 'ARM', '', 0, 1),
(12, 'Aruba', 'AW', 'ABW', '', 0, 1),
(13, 'Australia', 'AU', 'AUS', '', 0, 1),
(14, 'Austria', 'AT', 'AUT', '', 0, 1),
(15, 'Azerbaijan', 'AZ', 'AZE', '', 0, 1),
(16, 'Bahamas', 'BS', 'BHS', '', 0, 1),
(17, 'Bahrain', 'BH', 'BHR', '', 0, 1),
(18, 'Bangladesh', 'BD', 'BGD', '', 0, 1),
(19, 'Barbados', 'BB', 'BRB', '', 0, 1),
(20, 'Belarus', 'BY', 'BLR', '', 0, 1),
(21, 'Belgium', 'BE', 'BEL', '{firstname} {lastname}\r\n{company}\r\n{address_1}\r\n{address_2}\r\n{postcode} {city}\r\n{country}', 0, 1),
(22, 'Belize', 'BZ', 'BLZ', '', 0, 1),
(23, 'Benin', 'BJ', 'BEN', '', 0, 1),
(24, 'Bermuda', 'BM', 'BMU', '', 0, 1),
(25, 'Bhutan', 'BT', 'BTN', '', 0, 1),
(26, 'Bolivia', 'BO', 'BOL', '', 0, 1),
(27, 'Bosnia and Herzegovina', 'BA', 'BIH', '', 0, 1),
(28, 'Botswana', 'BW', 'BWA', '', 0, 1),
(29, 'Bouvet Island', 'BV', 'BVT', '', 0, 1),
(30, 'Brazil', 'BR', 'BRA', '', 0, 1),
(31, 'British Indian Ocean Territory', 'IO', 'IOT', '', 0, 1),
(32, 'Brunei Darussalam', 'BN', 'BRN', '', 0, 1),
(33, 'Bulgaria', 'BG', 'BGR', '', 0, 1),
(34, 'Burkina Faso', 'BF', 'BFA', '', 0, 1),
(35, 'Burundi', 'BI', 'BDI', '', 0, 1),
(36, 'Cambodia', 'KH', 'KHM', '', 0, 1),
(37, 'Cameroon', 'CM', 'CMR', '', 0, 1),
(38, 'Canada', 'CA', 'CAN', '', 0, 1),
(39, 'Cape Verde', 'CV', 'CPV', '', 0, 1),
(40, 'Cayman Islands', 'KY', 'CYM', '', 0, 1),
(41, 'Central African Republic', 'CF', 'CAF', '', 0, 1),
(42, 'Chad', 'TD', 'TCD', '', 0, 1),
(43, 'Chile', 'CL', 'CHL', '', 0, 1),
(44, 'China', 'CN', 'CHN', '', 0, 1),
(45, 'Christmas Island', 'CX', 'CXR', '', 0, 1),
(46, 'Cocos (Keeling) Islands', 'CC', 'CCK', '', 0, 1),
(47, 'Colombia', 'CO', 'COL', '', 0, 1),
(48, 'Comoros', 'KM', 'COM', '', 0, 1),
(49, 'Congo', 'CG', 'COG', '', 0, 1),
(50, 'Cook Islands', 'CK', 'COK', '', 0, 1),
(51, 'Costa Rica', 'CR', 'CRI', '', 0, 1),
(52, 'Cote D''Ivoire', 'CI', 'CIV', '', 0, 1),
(53, 'Croatia', 'HR', 'HRV', '', 0, 1),
(54, 'Cuba', 'CU', 'CUB', '', 0, 1),
(55, 'Cyprus', 'CY', 'CYP', '', 0, 1),
(56, 'Czech Republic', 'CZ', 'CZE', '', 0, 1),
(57, 'Denmark', 'DK', 'DNK', '', 0, 1),
(58, 'Djibouti', 'DJ', 'DJI', '', 0, 1),
(59, 'Dominica', 'DM', 'DMA', '', 0, 1),
(60, 'Dominican Republic', 'DO', 'DOM', '', 0, 1),
(61, 'East Timor', 'TL', 'TLS', '', 0, 1),
(62, 'Ecuador', 'EC', 'ECU', '', 0, 1),
(63, 'Egypt', 'EG', 'EGY', '', 0, 1),
(64, 'El Salvador', 'SV', 'SLV', '', 0, 1),
(65, 'Equatorial Guinea', 'GQ', 'GNQ', '', 0, 1),
(66, 'Eritrea', 'ER', 'ERI', '', 0, 1),
(67, 'Estonia', 'EE', 'EST', '', 0, 1),
(68, 'Ethiopia', 'ET', 'ETH', '', 0, 1),
(69, 'Falkland Islands (Malvinas)', 'FK', 'FLK', '', 0, 1),
(70, 'Faroe Islands', 'FO', 'FRO', '', 0, 1),
(71, 'Fiji', 'FJ', 'FJI', '', 0, 1),
(72, 'Finland', 'FI', 'FIN', '', 0, 1),
(74, 'France, Metropolitan', 'FR', 'FRA', '{firstname} {lastname}\r\n{company}\r\n{address_1}\r\n{address_2}\r\n{postcode} {city}\r\n{country}', 1, 1),
(75, 'French Guiana', 'GF', 'GUF', '', 0, 1),
(76, 'French Polynesia', 'PF', 'PYF', '', 0, 1),
(77, 'French Southern Territories', 'TF', 'ATF', '', 0, 1),
(78, 'Gabon', 'GA', 'GAB', '', 0, 1),
(79, 'Gambia', 'GM', 'GMB', '', 0, 1),
(80, 'Georgia', 'GE', 'GEO', '', 0, 1),
(81, 'Germany', 'DE', 'DEU', '{company}\r\n{firstname} {lastname}\r\n{address_1}\r\n{address_2}\r\n{postcode} {city}\r\n{country}', 1, 1),
(82, 'Ghana', 'GH', 'GHA', '', 0, 1),
(83, 'Gibraltar', 'GI', 'GIB', '', 0, 1),
(84, 'Greece', 'GR', 'GRC', '', 0, 1),
(85, 'Greenland', 'GL', 'GRL', '', 0, 1),
(86, 'Grenada', 'GD', 'GRD', '', 0, 1),
(87, 'Guadeloupe', 'GP', 'GLP', '', 0, 1),
(88, 'Guam', 'GU', 'GUM', '', 0, 1),
(89, 'Guatemala', 'GT', 'GTM', '', 0, 1),
(90, 'Guinea', 'GN', 'GIN', '', 0, 1),
(91, 'Guinea-Bissau', 'GW', 'GNB', '', 0, 1),
(92, 'Guyana', 'GY', 'GUY', '', 0, 1),
(93, 'Haiti', 'HT', 'HTI', '', 0, 1),
(94, 'Heard and Mc Donald Islands', 'HM', 'HMD', '', 0, 1),
(95, 'Honduras', 'HN', 'HND', '', 0, 1),
(96, 'Hong Kong', 'HK', 'HKG', '', 0, 1),
(97, 'Hungary', 'HU', 'HUN', '', 0, 1),
(98, 'Iceland', 'IS', 'ISL', '', 0, 1),
(99, 'India', 'IN', 'IND', '', 0, 1),
(100, 'Indonesia', 'ID', 'IDN', '', 0, 1),
(101, 'Iran (Islamic Republic of)', 'IR', 'IRN', '', 0, 1),
(102, 'Iraq', 'IQ', 'IRQ', '', 0, 1),
(103, 'Ireland', 'IE', 'IRL', '', 0, 1),
(104, 'Israel', 'IL', 'ISR', '', 0, 1),
(105, 'Italy', 'IT', 'ITA', '', 0, 1),
(106, 'Jamaica', 'JM', 'JAM', '', 0, 1),
(107, 'Japan', 'JP', 'JPN', '', 0, 1),
(108, 'Jordan', 'JO', 'JOR', '', 0, 1),
(109, 'Kazakhstan', 'KZ', 'KAZ', '', 0, 1),
(110, 'Kenya', 'KE', 'KEN', '', 0, 1),
(111, 'Kiribati', 'KI', 'KIR', '', 0, 1),
(112, 'North Korea', 'KP', 'PRK', '', 0, 1),
(113, 'Korea, Republic of', 'KR', 'KOR', '', 0, 1),
(114, 'Kuwait', 'KW', 'KWT', '', 0, 1),
(115, 'Kyrgyzstan', 'KG', 'KGZ', '', 0, 1),
(116, 'Lao People''s Democratic Republic', 'LA', 'LAO', '', 0, 1),
(117, 'Latvia', 'LV', 'LVA', '', 0, 1),
(118, 'Lebanon', 'LB', 'LBN', '', 0, 1),
(119, 'Lesotho', 'LS', 'LSO', '', 0, 1),
(120, 'Liberia', 'LR', 'LBR', '', 0, 1),
(121, 'Libyan Arab Jamahiriya', 'LY', 'LBY', '', 0, 1),
(122, 'Liechtenstein', 'LI', 'LIE', '', 0, 1),
(123, 'Lithuania', 'LT', 'LTU', '', 0, 1),
(124, 'Luxembourg', 'LU', 'LUX', '', 0, 1),
(125, 'Macau', 'MO', 'MAC', '', 0, 1),
(126, 'FYROM', 'MK', 'MKD', '', 0, 1),
(127, 'Madagascar', 'MG', 'MDG', '', 0, 1),
(128, 'Malawi', 'MW', 'MWI', '', 0, 1),
(129, 'Malaysia', 'MY', 'MYS', '', 0, 1),
(130, 'Maldives', 'MV', 'MDV', '', 0, 1),
(131, 'Mali', 'ML', 'MLI', '', 0, 1),
(132, 'Malta', 'MT', 'MLT', '', 0, 1),
(133, 'Marshall Islands', 'MH', 'MHL', '', 0, 1),
(134, 'Martinique', 'MQ', 'MTQ', '', 0, 1),
(135, 'Mauritania', 'MR', 'MRT', '', 0, 1),
(136, 'Mauritius', 'MU', 'MUS', '', 0, 1),
(137, 'Mayotte', 'YT', 'MYT', '', 0, 1),
(138, 'Mexico', 'MX', 'MEX', '', 0, 1),
(139, 'Micronesia, Federated States of', 'FM', 'FSM', '', 0, 1),
(140, 'Moldova, Republic of', 'MD', 'MDA', '', 0, 1),
(141, 'Monaco', 'MC', 'MCO', '', 0, 1),
(142, 'Mongolia', 'MN', 'MNG', '', 0, 1),
(143, 'Montserrat', 'MS', 'MSR', '', 0, 1),
(144, 'Morocco', 'MA', 'MAR', '', 0, 1),
(145, 'Mozambique', 'MZ', 'MOZ', '', 0, 1),
(146, 'Myanmar', 'MM', 'MMR', '', 0, 1),
(147, 'Namibia', 'NA', 'NAM', '', 0, 1),
(148, 'Nauru', 'NR', 'NRU', '', 0, 1),
(149, 'Nepal', 'NP', 'NPL', '', 0, 1),
(150, 'Netherlands', 'NL', 'NLD', '', 0, 1),
(151, 'Netherlands Antilles', 'AN', 'ANT', '', 0, 1),
(152, 'New Caledonia', 'NC', 'NCL', '', 0, 1),
(153, 'New Zealand', 'NZ', 'NZL', '', 0, 1),
(154, 'Nicaragua', 'NI', 'NIC', '', 0, 1),
(155, 'Niger', 'NE', 'NER', '', 0, 1),
(156, 'Nigeria', 'NG', 'NGA', '', 0, 1),
(157, 'Niue', 'NU', 'NIU', '', 0, 1),
(158, 'Norfolk Island', 'NF', 'NFK', '', 0, 1),
(159, 'Northern Mariana Islands', 'MP', 'MNP', '', 0, 1),
(160, 'Norway', 'NO', 'NOR', '', 0, 1),
(161, 'Oman', 'OM', 'OMN', '', 0, 1),
(162, 'Pakistan', 'PK', 'PAK', '', 0, 1),
(163, 'Palau', 'PW', 'PLW', '', 0, 1),
(164, 'Panama', 'PA', 'PAN', '', 0, 1),
(165, 'Papua New Guinea', 'PG', 'PNG', '', 0, 1),
(166, 'Paraguay', 'PY', 'PRY', '', 0, 1),
(167, 'Peru', 'PE', 'PER', '', 0, 1),
(168, 'Philippines', 'PH', 'PHL', '', 0, 1),
(169, 'Pitcairn', 'PN', 'PCN', '', 0, 1),
(170, 'Poland', 'PL', 'POL', '', 0, 1),
(171, 'Portugal', 'PT', 'PRT', '', 0, 1),
(172, 'Puerto Rico', 'PR', 'PRI', '', 0, 1),
(173, 'Qatar', 'QA', 'QAT', '', 0, 1),
(174, 'Reunion', 'RE', 'REU', '', 0, 1),
(175, 'Romania', 'RO', 'ROM', '', 0, 1),
(176, 'Russian Federation', 'RU', 'RUS', '', 0, 1),
(177, 'Rwanda', 'RW', 'RWA', '', 0, 1),
(178, 'Saint Kitts and Nevis', 'KN', 'KNA', '', 0, 1),
(179, 'Saint Lucia', 'LC', 'LCA', '', 0, 1),
(180, 'Saint Vincent and the Grenadines', 'VC', 'VCT', '', 0, 1),
(181, 'Samoa', 'WS', 'WSM', '', 0, 1),
(182, 'San Marino', 'SM', 'SMR', '', 0, 1),
(183, 'Sao Tome and Principe', 'ST', 'STP', '', 0, 1),
(184, 'Saudi Arabia', 'SA', 'SAU', '', 0, 1),
(185, 'Senegal', 'SN', 'SEN', '', 0, 1),
(186, 'Seychelles', 'SC', 'SYC', '', 0, 1),
(187, 'Sierra Leone', 'SL', 'SLE', '', 0, 1),
(188, 'Singapore', 'SG', 'SGP', '', 0, 1),
(189, 'Slovak Republic', 'SK', 'SVK', '{firstname} {lastname}\r\n{company}\r\n{address_1}\r\n{address_2}\r\n{city} {postcode}\r\n{zone}\r\n{country}', 0, 1),
(190, 'Slovenia', 'SI', 'SVN', '', 0, 1),
(191, 'Solomon Islands', 'SB', 'SLB', '', 0, 1),
(192, 'Somalia', 'SO', 'SOM', '', 0, 1),
(193, 'South Africa', 'ZA', 'ZAF', '', 0, 1),
(194, 'South Georgia &amp; South Sandwich Islands', 'GS', 'SGS', '', 0, 1),
(195, 'Spain', 'ES', 'ESP', '', 0, 1),
(196, 'Sri Lanka', 'LK', 'LKA', '', 0, 1),
(197, 'St. Helena', 'SH', 'SHN', '', 0, 1),
(198, 'St. Pierre and Miquelon', 'PM', 'SPM', '', 0, 1),
(199, 'Sudan', 'SD', 'SDN', '', 0, 1),
(200, 'Suriname', 'SR', 'SUR', '', 0, 1),
(201, 'Svalbard and Jan Mayen Islands', 'SJ', 'SJM', '', 0, 1),
(202, 'Swaziland', 'SZ', 'SWZ', '', 0, 1),
(203, 'Sweden', 'SE', 'SWE', '{company}\r\n{firstname} {lastname}\r\n{address_1}\r\n{address_2}\r\n{postcode} {city}\r\n{country}', 1, 1),
(204, 'Switzerland', 'CH', 'CHE', '', 0, 1),
(205, 'Syrian Arab Republic', 'SY', 'SYR', '', 0, 1),
(206, 'Taiwan', 'TW', 'TWN', '', 0, 1),
(207, 'Tajikistan', 'TJ', 'TJK', '', 0, 1),
(208, 'Tanzania, United Republic of', 'TZ', 'TZA', '', 0, 1),
(209, 'Thailand', 'TH', 'THA', '', 0, 1),
(210, 'Togo', 'TG', 'TGO', '', 0, 1),
(211, 'Tokelau', 'TK', 'TKL', '', 0, 1),
(212, 'Tonga', 'TO', 'TON', '', 0, 1),
(213, 'Trinidad and Tobago', 'TT', 'TTO', '', 0, 1),
(214, 'Tunisia', 'TN', 'TUN', '', 0, 1),
(215, 'Turkey', 'TR', 'TUR', '', 0, 1),
(216, 'Turkmenistan', 'TM', 'TKM', '', 0, 1),
(217, 'Turks and Caicos Islands', 'TC', 'TCA', '', 0, 1),
(218, 'Tuvalu', 'TV', 'TUV', '', 0, 1),
(219, 'Uganda', 'UG', 'UGA', '', 0, 1),
(220, 'Ukraine', 'UA', 'UKR', '', 0, 1),
(221, 'United Arab Emirates', 'AE', 'ARE', '', 0, 1),
(222, 'United Kingdom', 'GB', 'GBR', '', 1, 1),
(223, 'United States', 'US', 'USA', '{firstname} {lastname}\r\n{company}\r\n{address_1}\r\n{address_2}\r\n{city}, {zone} {postcode}\r\n{country}', 0, 1),
(224, 'United States Minor Outlying Islands', 'UM', 'UMI', '', 0, 1),
(225, 'Uruguay', 'UY', 'URY', '', 0, 1),
(226, 'Uzbekistan', 'UZ', 'UZB', '', 0, 1),
(227, 'Vanuatu', 'VU', 'VUT', '', 0, 1),
(228, 'Vatican City State (Holy See)', 'VA', 'VAT', '', 0, 1),
(229, 'Venezuela', 'VE', 'VEN', '', 0, 1),
(230, 'Viet Nam', 'VN', 'VNM', '', 0, 1),
(231, 'Virgin Islands (British)', 'VG', 'VGB', '', 0, 1),
(232, 'Virgin Islands (U.S.)', 'VI', 'VIR', '', 0, 1),
(233, 'Wallis and Futuna Islands', 'WF', 'WLF', '', 0, 1),
(234, 'Western Sahara', 'EH', 'ESH', '', 0, 1),
(235, 'Yemen', 'YE', 'YEM', '', 0, 1),
(237, 'Democratic Republic of Congo', 'CD', 'COD', '', 0, 1),
(238, 'Zambia', 'ZM', 'ZMB', '', 0, 1),
(239, 'Zimbabwe', 'ZW', 'ZWE', '', 0, 1),
(240, 'Jersey', 'JE', 'JEY', '', 1, 1),
(241, 'Guernsey', 'GG', 'GGY', '', 1, 1),
(242, 'Montenegro', 'ME', 'MNE', '', 0, 1),
(243, 'Serbia', 'RS', 'SRB', '', 0, 1),
(244, 'Aaland Islands', 'AX', 'ALA', '', 0, 1),
(245, 'Bonaire, Sint Eustatius and Saba', 'BQ', 'BES', '', 0, 1),
(246, 'Curacao', 'CW', 'CUW', '', 0, 1),
(247, 'Palestinian Territory, Occupied', 'PS', 'PSE', '', 0, 1),
(248, 'South Sudan', 'SS', 'SSD', '', 0, 1),
(249, 'St. Barthelemy', 'BL', 'BLM', '', 0, 1),
(250, 'St. Martin (French part)', 'MF', 'MAF', '', 0, 1),
(251, 'Canary Islands', 'IC', 'ICA', '', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `coupon`
--

CREATE TABLE IF NOT EXISTS `coupon` (
  `coupon_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `code` varchar(10) NOT NULL,
  `type` char(1) NOT NULL,
  `discount` decimal(15,4) NOT NULL,
  `logged` tinyint(1) NOT NULL,
  `shipping` tinyint(1) NOT NULL,
  `total` decimal(15,4) NOT NULL,
  `date_start` date NOT NULL DEFAULT '0000-00-00',
  `date_end` date NOT NULL DEFAULT '0000-00-00',
  `uses_total` int(11) NOT NULL,
  `uses_customer` varchar(11) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`coupon_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `coupon`
--

INSERT INTO `coupon` (`coupon_id`, `name`, `code`, `type`, `discount`, `logged`, `shipping`, `total`, `date_start`, `date_end`, `uses_total`, `uses_customer`, `status`, `date_added`) VALUES
(4, '-10% Discount', '2222', 'P', '10.0000', 0, 0, '0.0000', '2011-01-01', '2012-01-01', 10, '10', 1, '2009-01-27 13:55:03'),
(5, 'Free Shipping', '3333', 'P', '0.0000', 0, 1, '100.0000', '2009-03-01', '2009-08-31', 10, '10', 1, '2009-03-14 21:13:53'),
(6, '-10.00 Discount', '1111', 'F', '10.0000', 0, 0, '10.0000', '1970-11-01', '2020-11-01', 100000, '10000', 1, '2009-03-14 21:15:18');

-- --------------------------------------------------------

--
-- Table structure for table `coupon_category`
--

CREATE TABLE IF NOT EXISTS `coupon_category` (
  `coupon_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`coupon_id`,`category_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `coupon_history`
--

CREATE TABLE IF NOT EXISTS `coupon_history` (
  `coupon_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `coupon_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`coupon_history_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `coupon_product`
--

CREATE TABLE IF NOT EXISTS `coupon_product` (
  `coupon_product_id` int(11) NOT NULL AUTO_INCREMENT,
  `coupon_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  PRIMARY KEY (`coupon_product_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `currency`
--

CREATE TABLE IF NOT EXISTS `currency` (
  `currency_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(32) NOT NULL,
  `code` varchar(3) NOT NULL,
  `symbol_left` varchar(12) NOT NULL,
  `symbol_right` varchar(12) NOT NULL,
  `decimal_place` char(1) NOT NULL,
  `value` float(15,8) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`currency_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `currency`
--

INSERT INTO `currency` (`currency_id`, `title`, `code`, `symbol_left`, `symbol_right`, `decimal_place`, `value`, `status`, `date_modified`) VALUES
(3, 'Euro', 'EUR', '', '€', '2', 28050.00000000, 1, '2013-07-14 20:03:39'),
(4, 'VNĐ', 'VND', '', ' VNĐ', '0', 1.00000000, 1, '2013-07-16 14:37:46'),
(5, 'Đô Mỹ', 'USD', '$', '', '', 21530.00000000, 1, '2013-07-14 20:04:14'),
(6, 'Bảng Anh', 'GBP', '', '£', '', 32900.00000000, 1, '2013-07-14 20:03:13'),
(7, 'Singapore', 'SGD', '', '', '', 0.00010000, 1, '2013-07-16 14:37:46'),
(8, 'Yên Nhật', 'JPY', '', '', '', 0.00470000, 1, '2013-07-16 14:37:46'),
(9, 'Đô Hồng Kong', 'HKD', '', '', '', 0.00040000, 1, '2013-07-16 14:37:46');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE IF NOT EXISTS `customer` (
  `customer_id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) NOT NULL DEFAULT '0',
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `fax` varchar(32) NOT NULL,
  `birthday` date DEFAULT NULL,
  `gender` tinyint(1) DEFAULT '0',
  `password` varchar(40) NOT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `salt` varchar(9) NOT NULL,
  `cart` text,
  `wishlist` text,
  `newsletter` tinyint(1) NOT NULL DEFAULT '0',
  `address_id` int(11) NOT NULL DEFAULT '0',
  `customer_group_id` int(11) NOT NULL,
  `ip` varchar(40) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL,
  `approved` tinyint(1) NOT NULL,
  `token` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`customer_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=21 ;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`customer_id`, `store_id`, `firstname`, `lastname`, `email`, `telephone`, `fax`, `birthday`, `gender`, `password`, `avatar`, `salt`, `cart`, `wishlist`, `newsletter`, `address_id`, `customer_group_id`, `ip`, `status`, `approved`, `token`, `date_added`) VALUES
(1, 0, 'Sơn Trần', '', 'transontt@gmail.com', '0902222222222', '', NULL, NULL, 'c0ff2af611e745e05c989d8c07a56230be54ede5', 'image/avatars/51d4654806911.jpg', 'fbad643c7', 'a:1:{i:160;i:1;}', 'a:1:{i:0;s:2:"42";}', 1, 1, 1, '117.6.79.96', 1, 1, '', '2013-06-16 14:36:00'),
(16, 0, 'haodt', '', 'duongxuanhao@gmail.com', '0936474346', '', NULL, 0, 'fa669eed91f81e9cedf595061d42acc219307aa4', NULL, '52e56488a', NULL, NULL, 1, 0, 1, '0', 1, 0, '', '2013-07-12 07:46:47'),
(17, 0, 'Dương Thượng Hảo', '', 'info@geckomedia.vn', '0936474346', '', '0000-00-00', 1, 'd2adcc134270b8d6ad6a764e190e7d2a6ea5781d', 'image/avatars/51df7c91c722c.jpg', 'c1ced3f9a', 'a:0:{}', 'a:2:{i:0;s:2:"42";i:1;s:2:"28";}', 1, 16, 1, '117.7.112.92', 1, 1, '', '2013-07-12 07:48:48'),
(18, 0, 'Trần Minh Đức', '', 'duclicogi8999@gmail.com', '0944378999', '', '0000-00-00', 1, '04cde4d33c166576964fcce27ff7d6623a8aff08', 'image/avatars/51e24a125bef2.jpg', 'b92021c31', 'a:0:{}', 'a:0:{}', 1, 17, 1, '113.190.254.54', 1, 1, '', '2013-07-12 16:23:27'),
(20, 0, 'Đặng huyền ngọc', '', 'Anne.vy221011@gmail.com', '0934020289', '', '1989-02-02', 0, '4e446230d60411744ea0c6645d3fb41b431af452', '', 'cd2f02a1b', 'a:0:{}', '', 1, 19, 1, '113.190.254.220', 1, 1, '', '2013-07-14 18:24:52'),
(19, 0, 'Ngoc Anh', '', 'ngocanh82@gmail.com', '0983886601', '', '1982-09-07', 1, 'd934099437d5b91aab40f1d32b4a8303367420a8', '', '7e8d6a09d', 'a:0:{}', '', 1, 18, 1, '101.99.13.138', 1, 1, '', '2013-07-12 20:51:41');

-- --------------------------------------------------------

--
-- Table structure for table `customer_ban_ip`
--

CREATE TABLE IF NOT EXISTS `customer_ban_ip` (
  `customer_ban_ip_id` int(11) NOT NULL AUTO_INCREMENT,
  `ip` varchar(40) NOT NULL,
  PRIMARY KEY (`customer_ban_ip_id`),
  KEY `ip` (`ip`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `customer_field`
--

CREATE TABLE IF NOT EXISTS `customer_field` (
  `customer_id` int(11) NOT NULL,
  `custom_field_id` int(11) NOT NULL,
  `custom_field_value_id` int(11) NOT NULL,
  `name` int(128) NOT NULL,
  `value` text NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`customer_id`,`custom_field_id`,`custom_field_value_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `customer_group`
--

CREATE TABLE IF NOT EXISTS `customer_group` (
  `customer_group_id` int(11) NOT NULL AUTO_INCREMENT,
  `approval` int(1) NOT NULL,
  `company_id_display` int(1) NOT NULL,
  `company_id_required` int(1) NOT NULL,
  `tax_id_display` int(1) NOT NULL,
  `tax_id_required` int(1) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`customer_group_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `customer_group`
--

INSERT INTO `customer_group` (`customer_group_id`, `approval`, `company_id_display`, `company_id_required`, `tax_id_display`, `tax_id_required`, `sort_order`) VALUES
(1, 0, 1, 0, 0, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `customer_group_description`
--

CREATE TABLE IF NOT EXISTS `customer_group_description` (
  `customer_group_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`customer_group_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `customer_group_description`
--

INSERT INTO `customer_group_description` (`customer_group_id`, `language_id`, `name`, `description`) VALUES
(1, 2, 'Default', 'test');

-- --------------------------------------------------------

--
-- Table structure for table `customer_history`
--

CREATE TABLE IF NOT EXISTS `customer_history` (
  `customer_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `comment` text NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`customer_history_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `customer_history`
--

INSERT INTO `customer_history` (`customer_history_id`, `customer_id`, `comment`, `date_added`) VALUES
(1, 17, 'ban oiw check hang nhe', '2013-07-13 09:43:49');

-- --------------------------------------------------------

--
-- Table structure for table `customer_ip`
--

CREATE TABLE IF NOT EXISTS `customer_ip` (
  `customer_ip_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`customer_ip_id`),
  KEY `ip` (`ip`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=37 ;

--
-- Dumping data for table `customer_ip`
--

INSERT INTO `customer_ip` (`customer_ip_id`, `customer_id`, `ip`, `date_added`) VALUES
(1, 1, '::1', '2013-06-16 14:36:01'),
(16, 1, '117.6.79.96', '2013-07-12 07:41:07'),
(17, 1, '117.7.127.11', '2013-07-12 07:41:41'),
(18, 17, '117.7.127.11', '2013-07-12 07:48:48'),
(19, 17, '117.6.79.96', '2013-07-12 08:52:58'),
(20, 17, '117.7.112.92', '2013-07-12 13:47:50'),
(21, 18, '113.190.254.31', '2013-07-12 16:23:27'),
(22, 17, '113.168.171.162', '2013-07-12 20:23:47'),
(23, 19, '101.99.13.138', '2013-07-12 20:51:42'),
(24, 18, '113.190.254.95', '2013-07-13 05:51:26'),
(25, 18, '113.190.254.203', '2013-07-13 06:52:41'),
(26, 17, '1.55.215.94', '2013-07-13 07:29:25'),
(27, 17, '117.7.111.224', '2013-07-13 09:44:18'),
(28, 1, '117.7.237.252', '2013-07-13 18:26:51'),
(29, 17, '123.27.92.17', '2013-07-13 20:10:28'),
(30, 1, '123.27.92.17', '2013-07-13 20:13:01'),
(31, 18, '222.252.85.98', '2013-07-14 10:47:47'),
(32, 17, '117.7.116.110', '2013-07-14 15:01:53'),
(33, 18, '113.190.254.220', '2013-07-14 18:14:41'),
(34, 20, '113.190.254.220', '2013-07-14 18:24:53'),
(35, 18, '222.252.86.109', '2013-07-15 09:44:04'),
(36, 18, '113.190.254.54', '2013-07-16 14:13:28');

-- --------------------------------------------------------

--
-- Table structure for table `customer_online`
--

CREATE TABLE IF NOT EXISTS `customer_online` (
  `ip` varchar(40) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `url` text NOT NULL,
  `referer` text NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`ip`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `customer_reward`
--

CREATE TABLE IF NOT EXISTS `customer_reward` (
  `customer_reward_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL DEFAULT '0',
  `order_id` int(11) NOT NULL DEFAULT '0',
  `description` text NOT NULL,
  `points` int(8) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`customer_reward_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `customer_transaction`
--

CREATE TABLE IF NOT EXISTS `customer_transaction` (
  `customer_transaction_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `description` text NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`customer_transaction_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

--
-- Dumping data for table `customer_transaction`
--

INSERT INTO `customer_transaction` (`customer_transaction_id`, `customer_id`, `order_id`, `description`, `amount`, `date_added`) VALUES
(1, 18, 0, 'Thanh toán tiền hàng cho đơn hàng ....', '20000000.0000', '2013-07-12 19:37:02'),
(2, 18, 68, 'Order ID: #68', '-954415.0000', '2013-07-12 21:23:23'),
(3, 18, 0, 'Thanh toán tièn hàng', '40000000.0000', '2013-07-13 08:16:58'),
(4, 17, 0, 'tien hang', '100000000.0000', '2013-07-13 20:13:47'),
(5, 18, 70, 'Mã đơn hàng: #70', '-630000.0000', '2013-07-14 10:50:58'),
(6, 18, 72, 'Mã đơn hàng: #72', '-630000.0000', '2013-07-15 09:44:35'),
(7, 18, 73, 'Mã đơn hàng: #73', '-630000.0000', '2013-07-15 09:46:16'),
(8, 18, 74, 'Mã đơn hàng: #74', '-630000.0000', '2013-07-15 09:48:16'),
(9, 18, 0, 'sdfgdfg', '20000000.0000', '2013-07-15 10:29:03'),
(10, 17, 75, 'Mã đơn hàng: #75', '-5670000.0000', '2013-07-16 05:57:23'),
(11, 18, 76, 'Mã đơn hàng: #76', '-4268600.0000', '2013-07-16 14:14:16');

-- --------------------------------------------------------

--
-- Table structure for table `custom_field`
--

CREATE TABLE IF NOT EXISTS `custom_field` (
  `custom_field_id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(32) NOT NULL,
  `value` text NOT NULL,
  `required` tinyint(1) NOT NULL,
  `location` varchar(32) NOT NULL,
  `position` int(3) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`custom_field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `custom_field_description`
--

CREATE TABLE IF NOT EXISTS `custom_field_description` (
  `custom_field_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`custom_field_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `custom_field_to_customer_group`
--

CREATE TABLE IF NOT EXISTS `custom_field_to_customer_group` (
  `custom_field_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  PRIMARY KEY (`custom_field_id`,`customer_group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `custom_field_value`
--

CREATE TABLE IF NOT EXISTS `custom_field_value` (
  `custom_field_value_id` int(11) NOT NULL AUTO_INCREMENT,
  `custom_field_id` int(11) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`custom_field_value_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `custom_field_value_description`
--

CREATE TABLE IF NOT EXISTS `custom_field_value_description` (
  `custom_field_value_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `custom_field_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`custom_field_value_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `download`
--

CREATE TABLE IF NOT EXISTS `download` (
  `download_id` int(11) NOT NULL AUTO_INCREMENT,
  `filename` varchar(128) NOT NULL,
  `mask` varchar(128) NOT NULL,
  `remaining` int(11) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`download_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `download_description`
--

CREATE TABLE IF NOT EXISTS `download_description` (
  `download_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`download_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `extension`
--

CREATE TABLE IF NOT EXISTS `extension` (
  `extension_id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(32) NOT NULL,
  `code` varchar(32) NOT NULL,
  PRIMARY KEY (`extension_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=443 ;

--
-- Dumping data for table `extension`
--

INSERT INTO `extension` (`extension_id`, `type`, `code`) VALUES
(23, 'payment', 'cod'),
(22, 'total', 'shipping'),
(57, 'total', 'sub_total'),
(58, 'total', 'tax'),
(59, 'total', 'total'),
(410, 'module', 'banner'),
(426, 'module', 'carousel'),
(390, 'total', 'credit'),
(387, 'shipping', 'flat'),
(349, 'total', 'handling'),
(350, 'total', 'low_order_fee'),
(389, 'total', 'coupon'),
(413, 'module', 'category'),
(411, 'module', 'affiliate'),
(408, 'module', 'account'),
(393, 'total', 'reward'),
(398, 'total', 'voucher'),
(407, 'payment', 'free_checkout'),
(427, 'module', 'featured'),
(419, 'module', 'slideshow'),
(428, 'module', 'vqmod_manager'),
(429, 'module', 'tnt_newscat'),
(430, 'module', 'filter'),
(431, 'module', 'manufacturersdropdown'),
(432, 'module', 'filteroption'),
(433, 'module', 'viewed'),
(435, 'payment', 'bank_transfer'),
(442, 'module', 'store'),
(441, 'module', 'google_talk');

-- --------------------------------------------------------

--
-- Table structure for table `filter`
--

CREATE TABLE IF NOT EXISTS `filter` (
  `filter_id` int(11) NOT NULL AUTO_INCREMENT,
  `filter_group_id` int(11) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`filter_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `filter_description`
--

CREATE TABLE IF NOT EXISTS `filter_description` (
  `filter_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `filter_group_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`filter_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `filter_group`
--

CREATE TABLE IF NOT EXISTS `filter_group` (
  `filter_group_id` int(11) NOT NULL AUTO_INCREMENT,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`filter_group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `filter_group_description`
--

CREATE TABLE IF NOT EXISTS `filter_group_description` (
  `filter_group_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`filter_group_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `geo_zone`
--

CREATE TABLE IF NOT EXISTS `geo_zone` (
  `geo_zone_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `description` varchar(255) NOT NULL,
  `date_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`geo_zone_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `geo_zone`
--

INSERT INTO `geo_zone` (`geo_zone_id`, `name`, `description`, `date_modified`, `date_added`) VALUES
(3, 'UK VAT Zone', 'UK VAT', '2010-02-26 22:33:24', '2009-01-06 23:26:25'),
(4, 'UK Shipping', 'UK Shipping Zones', '2010-12-15 15:18:13', '2009-06-23 01:14:53');

-- --------------------------------------------------------

--
-- Table structure for table `information`
--

CREATE TABLE IF NOT EXISTS `information` (
  `information_id` int(11) NOT NULL AUTO_INCREMENT,
  `bottom` int(1) NOT NULL DEFAULT '0',
  `sort_order` int(3) NOT NULL DEFAULT '0',
  `top` int(1) NOT NULL DEFAULT '0',
  `top_order` int(3) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`information_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `information`
--

INSERT INTO `information` (`information_id`, `bottom`, `sort_order`, `top`, `top_order`, `status`) VALUES
(3, 0, 3, 0, 0, 1),
(4, 1, 1, 0, 0, 1),
(5, 1, 4, 0, 0, 1),
(6, 1, 2, 0, 0, 1),
(7, 0, 0, 1, 0, 1),
(8, 0, 0, 1, 0, 1),
(9, 0, 0, 1, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `information_description`
--

CREATE TABLE IF NOT EXISTS `information_description` (
  `information_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `title` varchar(64) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`information_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `information_description`
--

INSERT INTO `information_description` (`information_id`, `language_id`, `title`, `description`) VALUES
(7, 2, 'Dịch vụ', '&lt;p style=&quot;text-align: justify; font-size: 11px; line-height: 14px; margin: 0px 0px 14px; padding: 0px; color: rgb(0, 0, 0); font-family: Arial, Helvetica, sans;&quot;&gt;&quot;Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.&quot;&lt;/p&gt;\r\n\r\n&lt;h3 style=&quot;margin: 0px 0px 14px; padding: 0px; font-weight: bold; font-size: 11px; color: rgb(0, 0, 0); font-family: Arial, Helvetica, sans; line-height: normal;&quot;&gt;Đoạn 1.10.32 trong &quot;De Finibus Bonorum et Malorum&quot; viết bởi Cicero năm 45 trước Công Nguyên&lt;/h3&gt;\r\n\r\n&lt;p style=&quot;text-align: justify; font-size: 11px; line-height: 14px; margin: 0px 0px 14px; padding: 0px; color: rgb(0, 0, 0); font-family: Arial, Helvetica, sans;&quot;&gt;&quot;Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?&quot;&lt;/p&gt;\r\n\r\n&lt;h3 style=&quot;margin: 0px 0px 14px; padding: 0px; font-weight: bold; font-size: 11px; color: rgb(0, 0, 0); font-family: Arial, Helvetica, sans; line-height: normal;&quot;&gt;Một đoạn dịch của H. Rackham năm 1914&lt;/h3&gt;\r\n\r\n&lt;p style=&quot;text-align: justify; font-size: 11px; line-height: 14px; margin: 0px 0px 14px; padding: 0px; color: rgb(0, 0, 0); font-family: Arial, Helvetica, sans;&quot;&gt;&quot;But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?&quot;&lt;/p&gt;\r\n\r\n&lt;h3 style=&quot;margin: 0px 0px 14px; padding: 0px; font-weight: bold; font-size: 11px; color: rgb(0, 0, 0); font-family: Arial, Helvetica, sans; line-height: normal;&quot;&gt;Đoạn 1.10.33 trong &quot;De Finibus Bonorum et Malorum&quot; viết bởi Cicero năm 45 trước Công Nguyên&lt;/h3&gt;\r\n\r\n&lt;p style=&quot;text-align: justify; font-size: 11px; line-height: 14px; margin: 0px 0px 14px; padding: 0px; color: rgb(0, 0, 0); font-family: Arial, Helvetica, sans;&quot;&gt;&quot;At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat.&quot;&lt;/p&gt;\r\n'),
(8, 2, 'Hướng dẫn đặt hàng', '&lt;p style=&quot;text-align: justify; font-size: 11px; line-height: 14px; margin: 0px 0px 14px; padding: 0px; color: rgb(0, 0, 0); font-family: Arial, Helvetica, sans;&quot;&gt;&quot;Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.&quot;&lt;/p&gt;\r\n\r\n&lt;h3 style=&quot;margin: 0px 0px 14px; padding: 0px; font-weight: bold; font-size: 11px; color: rgb(0, 0, 0); font-family: Arial, Helvetica, sans; line-height: normal;&quot;&gt;Đoạn 1.10.32 trong &quot;De Finibus Bonorum et Malorum&quot; viết bởi Cicero năm 45 trước Công Nguyên&lt;/h3&gt;\r\n\r\n&lt;p style=&quot;text-align: justify; font-size: 11px; line-height: 14px; margin: 0px 0px 14px; padding: 0px; color: rgb(0, 0, 0); font-family: Arial, Helvetica, sans;&quot;&gt;&quot;Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?&quot;&lt;/p&gt;\r\n\r\n&lt;h3 style=&quot;margin: 0px 0px 14px; padding: 0px; font-weight: bold; font-size: 11px; color: rgb(0, 0, 0); font-family: Arial, Helvetica, sans; line-height: normal;&quot;&gt;Một đoạn dịch của H. Rackham năm 1914&lt;/h3&gt;\r\n\r\n&lt;p style=&quot;text-align: justify; font-size: 11px; line-height: 14px; margin: 0px 0px 14px; padding: 0px; color: rgb(0, 0, 0); font-family: Arial, Helvetica, sans;&quot;&gt;&quot;But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?&quot;&lt;/p&gt;\r\n\r\n&lt;h3 style=&quot;margin: 0px 0px 14px; padding: 0px; font-weight: bold; font-size: 11px; color: rgb(0, 0, 0); font-family: Arial, Helvetica, sans; line-height: normal;&quot;&gt;Đoạn 1.10.33 trong &quot;De Finibus Bonorum et Malorum&quot; viết bởi Cicero năm 45 trước Công Nguyên&lt;/h3&gt;\r\n\r\n&lt;p style=&quot;text-align: justify; font-size: 11px; line-height: 14px; margin: 0px 0px 14px; padding: 0px; color: rgb(0, 0, 0); font-family: Arial, Helvetica, sans;&quot;&gt;&quot;At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat.&quot;&lt;/p&gt;\r\n'),
(6, 2, 'Thông tin vận chuyển', '&lt;p style=&quot;text-align: justify; font-size: 11px; line-height: 14px; margin: 0px 0px 14px; padding: 0px; color: rgb(0, 0, 0); font-family: Arial, Helvetica, sans;&quot;&gt;&quot;Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.&quot;&lt;/p&gt;\r\n\r\n&lt;h3 style=&quot;margin: 0px 0px 14px; padding: 0px; font-weight: bold; font-size: 11px; color: rgb(0, 0, 0); font-family: Arial, Helvetica, sans; line-height: normal;&quot;&gt;Đoạn 1.10.32 trong &quot;De Finibus Bonorum et Malorum&quot; viết bởi Cicero năm 45 trước Công Nguyên&lt;/h3&gt;\r\n\r\n&lt;p style=&quot;text-align: justify; font-size: 11px; line-height: 14px; margin: 0px 0px 14px; padding: 0px; color: rgb(0, 0, 0); font-family: Arial, Helvetica, sans;&quot;&gt;&quot;Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?&quot;&lt;/p&gt;\r\n\r\n&lt;h3 style=&quot;margin: 0px 0px 14px; padding: 0px; font-weight: bold; font-size: 11px; color: rgb(0, 0, 0); font-family: Arial, Helvetica, sans; line-height: normal;&quot;&gt;Một đoạn dịch của H. Rackham năm 1914&lt;/h3&gt;\r\n\r\n&lt;p style=&quot;text-align: justify; font-size: 11px; line-height: 14px; margin: 0px 0px 14px; padding: 0px; color: rgb(0, 0, 0); font-family: Arial, Helvetica, sans;&quot;&gt;&quot;But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?&quot;&lt;/p&gt;\r\n\r\n&lt;h3 style=&quot;margin: 0px 0px 14px; padding: 0px; font-weight: bold; font-size: 11px; color: rgb(0, 0, 0); font-family: Arial, Helvetica, sans; line-height: normal;&quot;&gt;Đoạn 1.10.33 trong &quot;De Finibus Bonorum et Malorum&quot; viết bởi Cicero năm 45 trước Công Nguyên&lt;/h3&gt;\r\n\r\n&lt;p style=&quot;text-align: justify; font-size: 11px; line-height: 14px; margin: 0px 0px 14px; padding: 0px; color: rgb(0, 0, 0); font-family: Arial, Helvetica, sans;&quot;&gt;&quot;At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat.&quot;&lt;/p&gt;\r\n'),
(4, 2, 'Về chúng tôi', '&lt;p align=&quot;center&quot;&gt;Dịch vụ đặt hang quốc tế:&lt;/p&gt;\r\n\r\n&lt;p align=&quot;center&quot;&gt;&lt;img alt=&quot;&quot; src=&quot;http://dathangquocte.vn/image/data/thuong hieu/logoweorder-bong.png&quot; style=&quot;width: 180px; height: 180px;&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p align=&quot;center&quot;&gt;&lt;strong&gt;Dathangquocte.vn – Thế giới thời trang thu nhỏ trong màn hình máy tính.&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p align=&quot;center&quot;&gt;&lt;img alt=&quot;&quot; src=&quot;http://dathangquocte.vn/image/data/gioi thieu.jpg&quot; style=&quot;width: 1000px; height: 371px;&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p align=&quot;center&quot;&gt;Khi đến với dathangquocte.vn, các bạn sẽ được thấy tất cả các thông tin thương hiệu thời trang nổi tiếng toàn cầu được chúng tôi cập nhật hàng giờ nhằm giúp cho bạn có sự lựa chọn chính xác, kịp thời về sản phẩm mà bạn mong muốn. Với đội ngũ nhân viên nhiều năm kinh nghiệm trong ngành thời trang và kĩ năng phục vụ khách hàng chuyên nghiệp, chúng tôi tin tưởng sẽ đem đến cho quí khách hàng một trải nghiệm mua sắm online quốc tế thật thú vị.&lt;/p&gt;\r\n\r\n&lt;p align=&quot;center&quot;&gt;&lt;strong&gt;Vì sao bạn thích đặt hàng quốc tế:&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li align=&quot;center&quot;&gt;Thời trang hàng hiệu trong nước ta hiện nay giá vẫn còn rất cao so với thế giới.&lt;/li&gt;\r\n	&lt;li align=&quot;center&quot;&gt;Những tín đồ hàng hiệu thực sự vẫn chưa yên tâm về chất lượng , xuất xứ của hàng hóa bán trong nước.&lt;/li&gt;\r\n	&lt;li align=&quot;center&quot;&gt;Mẫu mã hàng hiệu trong nước không thể cập nhật đa dạng bằng các nước trên thế giới.&lt;/li&gt;\r\n	&lt;li align=&quot;center&quot;&gt;Hàng hiệu trong nước hiếm có những đơt sale off, khuyến mãi kinh hoàng vào các dịp kỉ niệm, nhưng trên thế giới bạn có thể nhanh tay mua được một món hàng ưng ý với giá được giảm tới 80%.&lt;/li&gt;\r\n	&lt;li align=&quot;center&quot;&gt;Thoải mái lựa chọn kích cỡ phù hợp với số lượng sản phẩm khổng lồ.&lt;/li&gt;\r\n&lt;/ul&gt;\r\n\r\n&lt;p align=&quot;center&quot; style=&quot;margin-left:.25in;&quot;&gt;&lt;strong&gt;Vì sao bạn chọn WEORDER.VN&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li align=&quot;center&quot;&gt;Các nước Anh quốc , Italia. Đức , Pháp, Mỹ, Tây Ban Nha, Hàn Quốc là những nước các bạn có thể đặt hàng trên hệ thống vì các quốc gia này là các kinh đô thời trang hàng đầu trên thế giới và giá thành luôn là tốt nhất.&lt;/li&gt;\r\n	&lt;li align=&quot;center&quot;&gt;Khi đến với dathangquocte.vn – quí khách hàng sẽ được thấy toàn bộ các thông tin của các hãng, các chuyên trang thời trang quốc tế như hàng mới – giảm giá – khuyến mãi v.v.. được cập nhật hàng ngày tại trang chúng tôi. &lt;a href=&quot;http://dathangquocte.vn/index.php?route=news/news_category&amp;amp;cat_id=1&quot;&gt;(click here )&lt;/a&gt;&lt;/li&gt;\r\n	&lt;li align=&quot;center&quot;&gt;Quí khách hàng sẽ được hỗ trợ tư vấn miễn phí về sản phẩm bởi đội ngũ chăm sóc khách hàng chuyên nghiệp của chúng tôi.&lt;/li&gt;\r\n	&lt;li align=&quot;center&quot;&gt;Chúng tôi thường xuyên đưa ra những gợi ý mix đồ đẹp, rẻ cập nhật hàng ngày trên dathangquocte.vn&lt;/li&gt;\r\n	&lt;li align=&quot;center&quot;&gt;Quí khách được sử dụng công nghệ đặt hàng kiểu mới chuyên nghiệp, hiện đại , tiện dụng và đơn giản vô cùng. &lt;a href=&quot;http://dathangquocte.vn/index.php?route=information/information&amp;amp;information_id=8&quot;&gt;( click here )&lt;/a&gt;&lt;/li&gt;\r\n	&lt;li align=&quot;center&quot;&gt;Quí khách có thể theo dõi lịch sử đặt hàng – thông tin thu chi tài chính – tình trạng đơn hàng v.v… bằng tài khoản thành viên.&lt;/li&gt;\r\n	&lt;li align=&quot;center&quot;&gt;Chúng tôi hỗ trợ tối tất cả các hình thức thanh toán hiện nay.&lt;/li&gt;\r\n	&lt;li align=&quot;center&quot;&gt;Giao hàng nhanh nhất, an toàn nhất – ( Hàng về từ 5 – 10 ngày kể từ khi đặt hàng )&lt;/li&gt;\r\n	&lt;li align=&quot;center&quot;&gt;Đặc biệt, giá dịch vụ luôn luôn TỐT NHẤT &lt;a href=&quot;http://dathangquocte.vn/index.php?route=information/information&amp;amp;information_id=7&quot;&gt;( Xem tại đây )&lt;/a&gt;&lt;/li&gt;\r\n&lt;/ul&gt;\r\n\r\n&lt;p align=&quot;center&quot;&gt;&lt;strong&gt;Dathangquocte.vn lấy Uy tín làm tiêu chí hàng đầu để hợp tác – Được phục vụ quí khách là niềm vinh hạnh của chúng tôi&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p align=&quot;center&quot;&gt;&lt;a href=&quot;http://dathangquocte.vn/&quot;&gt;&lt;strong&gt;SHOP NOW&lt;/strong&gt;&lt;/a&gt;&lt;/p&gt;\r\n\r\n&lt;p align=&quot;center&quot;&gt;&lt;u&gt;DATHANGQUOCTE.VN&lt;/u&gt;&lt;/p&gt;\r\n'),
(5, 2, 'Các yêu cầu', '&lt;p style=&quot;text-align: justify; font-size: 11px; line-height: 14px; margin: 0px 0px 14px; padding: 0px; color: rgb(0, 0, 0); font-family: Arial, Helvetica, sans;&quot;&gt;&quot;Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.&quot;&lt;/p&gt;\r\n\r\n&lt;h3 style=&quot;margin: 0px 0px 14px; padding: 0px; font-weight: bold; font-size: 11px; color: rgb(0, 0, 0); font-family: Arial, Helvetica, sans; line-height: normal;&quot;&gt;Đoạn 1.10.32 trong &quot;De Finibus Bonorum et Malorum&quot; viết bởi Cicero năm 45 trước Công Nguyên&lt;/h3&gt;\r\n\r\n&lt;p style=&quot;text-align: justify; font-size: 11px; line-height: 14px; margin: 0px 0px 14px; padding: 0px; color: rgb(0, 0, 0); font-family: Arial, Helvetica, sans;&quot;&gt;&quot;Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?&quot;&lt;/p&gt;\r\n\r\n&lt;h3 style=&quot;margin: 0px 0px 14px; padding: 0px; font-weight: bold; font-size: 11px; color: rgb(0, 0, 0); font-family: Arial, Helvetica, sans; line-height: normal;&quot;&gt;Một đoạn dịch của H. Rackham năm 1914&lt;/h3&gt;\r\n\r\n&lt;p style=&quot;text-align: justify; font-size: 11px; line-height: 14px; margin: 0px 0px 14px; padding: 0px; color: rgb(0, 0, 0); font-family: Arial, Helvetica, sans;&quot;&gt;&quot;But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?&quot;&lt;/p&gt;\r\n\r\n&lt;h3 style=&quot;margin: 0px 0px 14px; padding: 0px; font-weight: bold; font-size: 11px; color: rgb(0, 0, 0); font-family: Arial, Helvetica, sans; line-height: normal;&quot;&gt;Đoạn 1.10.33 trong &quot;De Finibus Bonorum et Malorum&quot; viết bởi Cicero năm 45 trước Công Nguyên&lt;/h3&gt;\r\n\r\n&lt;p style=&quot;text-align: justify; font-size: 11px; line-height: 14px; margin: 0px 0px 14px; padding: 0px; color: rgb(0, 0, 0); font-family: Arial, Helvetica, sans;&quot;&gt;&quot;At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat.&quot;&lt;/p&gt;\r\n'),
(9, 2, 'Chính sách ưu đãi', '&lt;p style=&quot;text-align: justify; font-size: 11px; line-height: 14px; margin: 0px 0px 14px; padding: 0px; color: rgb(0, 0, 0); font-family: Arial, Helvetica, sans;&quot;&gt;&quot;Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.&quot;&lt;/p&gt;\r\n\r\n&lt;h3 style=&quot;margin: 0px 0px 14px; padding: 0px; font-weight: bold; font-size: 11px; color: rgb(0, 0, 0); font-family: Arial, Helvetica, sans; line-height: normal;&quot;&gt;Đoạn 1.10.32 trong &quot;De Finibus Bonorum et Malorum&quot; viết bởi Cicero năm 45 trước Công Nguyên&lt;/h3&gt;\r\n\r\n&lt;p style=&quot;text-align: justify; font-size: 11px; line-height: 14px; margin: 0px 0px 14px; padding: 0px; color: rgb(0, 0, 0); font-family: Arial, Helvetica, sans;&quot;&gt;&quot;Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?&quot;&lt;/p&gt;\r\n\r\n&lt;h3 style=&quot;margin: 0px 0px 14px; padding: 0px; font-weight: bold; font-size: 11px; color: rgb(0, 0, 0); font-family: Arial, Helvetica, sans; line-height: normal;&quot;&gt;Một đoạn dịch của H. Rackham năm 1914&lt;/h3&gt;\r\n\r\n&lt;p style=&quot;text-align: justify; font-size: 11px; line-height: 14px; margin: 0px 0px 14px; padding: 0px; color: rgb(0, 0, 0); font-family: Arial, Helvetica, sans;&quot;&gt;&quot;But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?&quot;&lt;/p&gt;\r\n\r\n&lt;h3 style=&quot;margin: 0px 0px 14px; padding: 0px; font-weight: bold; font-size: 11px; color: rgb(0, 0, 0); font-family: Arial, Helvetica, sans; line-height: normal;&quot;&gt;Đoạn 1.10.33 trong &quot;De Finibus Bonorum et Malorum&quot; viết bởi Cicero năm 45 trước Công Nguyên&lt;/h3&gt;\r\n\r\n&lt;p style=&quot;text-align: justify; font-size: 11px; line-height: 14px; margin: 0px 0px 14px; padding: 0px; color: rgb(0, 0, 0); font-family: Arial, Helvetica, sans;&quot;&gt;&quot;At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat.&quot;&lt;/p&gt;\r\n'),
(3, 2, 'Điều khoản và bảo mật', '&lt;p style=&quot;text-align: justify; font-size: 11px; line-height: 14px; margin: 0px 0px 14px; padding: 0px; color: rgb(0, 0, 0); font-family: Arial, Helvetica, sans;&quot;&gt;&quot;Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.&quot;&lt;/p&gt;\r\n\r\n&lt;h3 style=&quot;font-weight: bold; line-height: normal; margin: 0px 0px 14px; padding: 0px; font-size: 11px; color: rgb(0, 0, 0); font-family: Arial, Helvetica, sans;&quot;&gt;Đoạn 1.10.32 trong &quot;De Finibus Bonorum et Malorum&quot; viết bởi Cicero năm 45 trước Công Nguyên&lt;/h3&gt;\r\n\r\n&lt;p style=&quot;text-align: justify; font-size: 11px; line-height: 14px; margin: 0px 0px 14px; padding: 0px; color: rgb(0, 0, 0); font-family: Arial, Helvetica, sans;&quot;&gt;&quot;Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?&quot;&lt;/p&gt;\r\n\r\n&lt;h3 style=&quot;font-weight: bold; line-height: normal; margin: 0px 0px 14px; padding: 0px; font-size: 11px; color: rgb(0, 0, 0); font-family: Arial, Helvetica, sans;&quot;&gt;Một đoạn dịch của H. Rackham năm 1914&lt;/h3&gt;\r\n\r\n&lt;p style=&quot;text-align: justify; font-size: 11px; line-height: 14px; margin: 0px 0px 14px; padding: 0px; color: rgb(0, 0, 0); font-family: Arial, Helvetica, sans;&quot;&gt;&quot;But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?&quot;&lt;/p&gt;\r\n\r\n&lt;h3 style=&quot;font-weight: bold; line-height: normal; margin: 0px 0px 14px; padding: 0px; font-size: 11px; color: rgb(0, 0, 0); font-family: Arial, Helvetica, sans;&quot;&gt;Đoạn 1.10.33 trong &quot;De Finibus Bonorum et Malorum&quot; viết bởi Cicero năm 45 trước Công Nguyên&lt;/h3&gt;\r\n\r\n&lt;p style=&quot;text-align: justify; font-size: 11px; line-height: 14px; margin: 0px 0px 14px; padding: 0px; color: rgb(0, 0, 0); font-family: Arial, Helvetica, sans;&quot;&gt;&quot;At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat.&quot;&lt;/p&gt;\r\n');

-- --------------------------------------------------------

--
-- Table structure for table `information_to_layout`
--

CREATE TABLE IF NOT EXISTS `information_to_layout` (
  `information_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL,
  PRIMARY KEY (`information_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `information_to_store`
--

CREATE TABLE IF NOT EXISTS `information_to_store` (
  `information_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  PRIMARY KEY (`information_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `information_to_store`
--

INSERT INTO `information_to_store` (`information_id`, `store_id`) VALUES
(3, 0),
(4, 0),
(5, 0),
(6, 0),
(7, 0),
(8, 0),
(9, 0);

-- --------------------------------------------------------

--
-- Table structure for table `language`
--

CREATE TABLE IF NOT EXISTS `language` (
  `language_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `code` varchar(5) NOT NULL,
  `locale` varchar(255) NOT NULL,
  `image` varchar(64) NOT NULL,
  `directory` varchar(32) NOT NULL,
  `filename` varchar(64) NOT NULL,
  `sort_order` int(3) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`language_id`),
  KEY `name` (`name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `language`
--

INSERT INTO `language` (`language_id`, `name`, `code`, `locale`, `image`, `directory`, `filename`, `sort_order`, `status`) VALUES
(2, 'Vietnamese', 'vi', 'vi_VN.UTF-8,vi_VN,vi-vn,vietnamese', 'vn.png', 'vietnamese', 'vietnamese', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `layout`
--

CREATE TABLE IF NOT EXISTS `layout` (
  `layout_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`layout_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=16 ;

--
-- Dumping data for table `layout`
--

INSERT INTO `layout` (`layout_id`, `name`) VALUES
(1, 'Home'),
(2, 'Product'),
(3, 'Category'),
(4, 'Default'),
(5, 'Manufacturer'),
(6, 'Account'),
(7, 'Checkout'),
(8, 'Contact'),
(9, 'Sitemap'),
(10, 'Affiliate'),
(11, 'Information'),
(12, 'Danh mục tin tức'),
(13, 'Tin chi tiết');

-- --------------------------------------------------------

--
-- Table structure for table `layout_route`
--

CREATE TABLE IF NOT EXISTS `layout_route` (
  `layout_route_id` int(11) NOT NULL AUTO_INCREMENT,
  `layout_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `route` varchar(255) NOT NULL,
  PRIMARY KEY (`layout_route_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=44 ;

--
-- Dumping data for table `layout_route`
--

INSERT INTO `layout_route` (`layout_route_id`, `layout_id`, `store_id`, `route`) VALUES
(30, 6, 0, 'account'),
(17, 10, 0, 'affiliate/'),
(26, 1, 0, 'common/home'),
(20, 2, 0, 'product/product'),
(24, 11, 0, 'information/information'),
(22, 5, 0, 'product/manufacturer'),
(23, 7, 0, 'checkout/'),
(38, 8, 0, 'information/contact'),
(32, 9, 0, 'information/sitemap'),
(35, 12, 0, 'news/news_category'),
(36, 13, 0, 'news/news'),
(37, 13, 0, ''),
(43, 3, 0, 'product/category');

-- --------------------------------------------------------

--
-- Table structure for table `length_class`
--

CREATE TABLE IF NOT EXISTS `length_class` (
  `length_class_id` int(11) NOT NULL AUTO_INCREMENT,
  `value` decimal(15,8) NOT NULL,
  PRIMARY KEY (`length_class_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `length_class`
--

INSERT INTO `length_class` (`length_class_id`, `value`) VALUES
(1, '1.00000000'),
(2, '10.00000000'),
(3, '0.39370000');

-- --------------------------------------------------------

--
-- Table structure for table `length_class_description`
--

CREATE TABLE IF NOT EXISTS `length_class_description` (
  `length_class_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL,
  `title` varchar(32) NOT NULL,
  `unit` varchar(4) NOT NULL,
  PRIMARY KEY (`length_class_id`,`language_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `length_class_description`
--

INSERT INTO `length_class_description` (`length_class_id`, `language_id`, `title`, `unit`) VALUES
(1, 2, 'Centimeter', 'cm'),
(2, 2, 'Millimeter', 'mm'),
(3, 2, 'Inch', 'in');

-- --------------------------------------------------------

--
-- Table structure for table `manufacturer`
--

CREATE TABLE IF NOT EXISTS `manufacturer` (
  `manufacturer_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `description` text,
  `image` varchar(255) DEFAULT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`manufacturer_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=35 ;

--
-- Dumping data for table `manufacturer`
--

INSERT INTO `manufacturer` (`manufacturer_id`, `name`, `description`, `image`, `sort_order`) VALUES
(5, 'Converse', '', 'data/thuong_hieu/logo converse_logo.jpg', 0),
(6, 'Adidas', '', 'data/thuong_hieu/logo-adidas.jpg', 0),
(7, 'Louis Vuitton', '', 'data/thuong_hieu/louis-vuitton-logo.jpg', 0),
(8, 'Lacoste', '', 'data/lacoste_logo.jpg', 0),
(9, 'Zara', '&lt;p&gt;Thông tin thú vị về thương hiệu ZARA:&lt;/p&gt;\r\n\r\n&lt;p&gt;Năm 1975, Amancio Ortega – Ông chủ sở hữu thương hiệu ZARA - Lần đầu tiên cho ra đời một cửa hàng quần áo model riêng mang tên Zara. Lúc đó không ai nghĩ rằng Zara về sau là một thương hiệu quần áo model phụ nữ hàng đầu ở châu Âu nằm trong Tập đoàn Inditex (Tây Ban Nha) nổi tiếng, một nền thời trang rất mạnh với 3825 cửa hàng trên 68 quốc gia, bao gồm cả một chuỗi những shop nổi tiếng.&lt;/p&gt;\r\n\r\n&lt;p&gt;Bản thân giá của thương hiệu Zara đã đem lại cho Ortega hàng chục, thậm chí cả trăm triệu USD. Doanh số bán hàng của các sản phẩm mang tên Zara cũng chiếm tới gần một nửa tổng doanh số của cả tập đoàn và mãi là thương hiệu nổi tiếng nhất làm nên tên tuổi của Amancio Ortega và Inditex.&lt;/p&gt;\r\n\r\n&lt;p&gt;Hiện chuỗi cửa hàng bán lẻ của Zara đã có mặt tại 76 quốc gia với hơn 1400 cửa hàng sang trọng, mẫu mã thiết kế liên tục thay đổi, ra mắt khoảng 1000 mẫu mới mỗi năm. Tại Paris hay London, người ta đều thấy các cửa hàng thời trang Zara hãnh diện bên cạnh các thương hiệu danh giá khác như Gucci, Versace hay Armanie&lt;/p&gt;\r\n\r\n&lt;p&gt;(Nguồn: sưu tầm)&lt;/p&gt;\r\n', 'data/diesel.png', 0),
(23, 'Uni qlo', '', 'data/thuong hieu/uni qlo logo.jpg', 0),
(24, 'Miss Selfridge', '', 'data/cropped-miss-selfridge-blog-logo.gif', 0),
(25, 'H&amp;M', '', 'data/Thuyanh/img-thing.jpg', 0),
(26, 'Mango', '', 'data/mango logo.jpg', 0),
(27, 'Dorothy perkins', '', 'data/dorothyperkins logo.jpg', 0),
(28, 'SuperDry', '', 'data/thuong hieu/superdry_logo.gif', 0),
(29, 'Nordstrom', '', 'data/thuong hieu/nordstrom_logo.jpg', 0),
(30, 'J.Crew', '', 'data/thuong hieu/jcrew logo.jpg', 0),
(31, 'Burton london ', '', 'data/thuong hieu/burton logo.jpg', 0),
(32, 'Replay', '', 'data/replay logo.png', 0),
(33, 'Calvin Klein', '', 'data/thuong hieu/calvin klein logo.jpg', 0),
(10, 'Nike', '', 'data/thuong_hieu/nike-logo.jpg', 0),
(11, 'Tommy Hilfiger', '', 'data/thuong_hieu/thiet-ke-logo-thoi-trang-tommy_hilfiger_logo.jpg', 0),
(12, 'Armani', '', 'data/thuong_hieu/1667_armani_serris_img.jpg', 0),
(14, 'Energie', '', 'data/images.jpg', 0),
(15, 'Diesel', '&lt;p&gt;Trước sự nổi tiếng và phổ biến của Diesel, nhiều người không biết rằng, thương hiệu thời trang này chỉ mới xuất hiện cách đây 30 năm (1978) được tạo ra bởi Renzo Rosso. Renzo Rosso đã chọn cái tên Diesel cho thương hiệu của mình vì nó luôn được phát âm như nhau trong mọi thứ tiếng trên khắp thế giới. Điều ấy phù hợp với ý niệm của anh về một thế giới thời trang không bị phân cách bởi biên giới quốc gia, độ tuổi hay phong cách sống.&lt;/p&gt;\r\n\r\n&lt;p&gt;Năm 15 tuổi, Renzo theo học một trường dệt may tại địa phương. Trường học nhỏ này không ngờ đã đem đến những định hướng quan trọng trong cuộc đời của Renzo. Renzo Rosso đã tốt nghiệp với những kiến thức sơ khai nhất về thời trang và vải vóc như thế.&lt;/p&gt;\r\n\r\n&lt;p&gt;20 tuổi, Renzo bắt đầu thiết kế những trang phục đầu tiên của mình. Cũng trong năm này, 1975, anh vào làm việc trong một công ty dệt&amp;nbsp; may địa phương - công ty Moltex của Adriano Goldschimed. Đây là một công ty dệt may nhỏ nhưng rất đặc biệt bởi sản phẩm chính của công ty là quần.&lt;/p&gt;\r\n\r\n&lt;p&gt;Năm 1979, Renzo bắt đầu thiết kế trang phục nam hoàn chỉnh đầu tiên cho nhãn hiệu Diesel. Bộ sưu tập rất thành công càng khiến Renzo dồn hết tâm trí phát triển thương hiệu Diesel&amp;nbsp; của mình. Năm 1984, Renzo Rosso cho đời dòng sản phẩm mới Diesel Kids như một bước đầu tiên trong ước mơ mở rộng Diesel thành một thương hiệu thời trang nổi tiếng phù hợp với nhiều người.&lt;/p&gt;\r\n\r\n&lt;p&gt;Diesel ngày nay đã xuất hiện nhiều trên 80 quốc gia trên thế giới, 10.000 điểm bán hàng, 50 công ty trực thuộc và 150 phòng trưng bày sản phẩm. Người ta nói rằng: Diesel không chỉ định hướng thẩm mỹ và thời trang cho giới trẻ hiện đại mà đồ jeans mang thương hiệu này còn đang trở thành một phần trong văn hóa của giới trẻ hiện đại.&lt;/p&gt;\r\n\r\n&lt;p&gt;(Nguồn: sưu tầm)&lt;/p&gt;\r\n', 'data/thuong hieu/diesel logo.jpg', 0),
(16, 'Puma', '', 'data/puma logo.jpg', 0),
(17, 'Mr Porter', '', 'data/mr porter logo.jpg', 0),
(18, 'ASOS', '&lt;p&gt;ASOS là hệ thống thời trang bán lẻ cũng như trực tuyến lớn nhất UK, sau đó phát triển toàn cầu đến 160 nước trên thế giới, cung cấp tất cả các mặt hàng thời trang nam nữ, quần áo,&amp;nbsp;giày dép, túi xách cùng phụ kiện đủ loại của hơn 400 thương hiệu thời trang, và có khoảng 1.500 dòng sản phẩm mới được giới thiệu mỗi tuần.&lt;/p&gt;\r\n\r\n&lt;p&gt;ASOS là tổng hợp của rất nhiều Brand Name, High Street Fashion nổi tiếng và cao cấp trên thế giới, đông thời sở hữu riêng 1 dòng sản phẩm mang thương hiệu ASOS chất lượng tuyệt vời với&amp;nbsp;mẫu mã hết sức thời trang.&lt;/p&gt;\r\n\r\n&lt;p&gt;Website của ASOS thu hút hơn 23.2 triệu lượt người truy cập trong 1 tháng và tại thời điểm 31/5/2013 có 12.1 triệu thành viên đăng ký sử dụng, 6.5 triệu tài khoản hoạt động từ 241 quốc gia và vùng lãnh thổ.&lt;/p&gt;\r\n\r\n&lt;p&gt;(Nguồn Asos.com)&lt;/p&gt;\r\n', 'data/asos_logo1.jpg', 0),
(19, 'Abercrombie And Fitch', '&lt;p&gt;&lt;b style=&quot;color: rgb(0, 0, 0); font-family: sans-serif; font-size: 13px; line-height: 19.1875px;&quot;&gt;Abercrombie &amp;amp; Fitch&lt;/b&gt;&lt;span style=&quot;color: rgb(0, 0, 0); font-family: sans-serif; font-size: 13px; line-height: 19.1875px;&quot;&gt;&amp;nbsp;(A&amp;amp;F):&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;color: rgb(0, 0, 0); font-family: sans-serif; font-size: 13px; line-height: 19.1875px;&quot;&gt;là một công ty&amp;nbsp;bán lẻ tại&amp;nbsp;Mỹ bao gồm trang phục, phụ kiện, nước hoa dành cho&amp;nbsp;nam giới và nữ giới&amp;nbsp;độ tuổi từ 18 đến 22.&lt;/span&gt;&lt;span style=&quot;color: rgb(0, 0, 0); font-family: sans-serif; line-height: 10px; white-space: nowrap;&quot;&gt;&lt;font size=&quot;1&quot;&gt;&amp;nbsp;&lt;/font&gt;&lt;/span&gt;&lt;span style=&quot;color: rgb(0, 0, 0); font-family: sans-serif; font-size: 13px; line-height: 19.1875px;&quot;&gt;Hãng đã có hơn 300 chi nhánh tại&amp;nbsp;&lt;/span&gt;&lt;a href=&quot;http://vi.wikipedia.org/wiki/Hoa_K%E1%BB%B3&quot; style=&quot;text-decoration: none; color: rgb(11, 0, 128); background-image: none; font-family: sans-serif; font-size: 13px; line-height: 19.1875px;&quot; title=&quot;Hoa Kỳ&quot;&gt;Mỹ&lt;/a&gt;&lt;span style=&quot;color: rgb(0, 0, 0); font-family: sans-serif; font-size: 13px; line-height: 19.1875px;&quot;&gt;, và đang mở rộng trên toàn thế giới&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n', 'data/Abercrombie_logo3.jpg', 0),
(20, 'Topman', '', 'data/chỉ mục.jpg', 0),
(21, 'G2000', '', 'data/2.17.jpg', 0),
(22, 'Dolce &amp;Gabbana (D&amp;G)', '&lt;p&gt;&lt;strong&gt;Dolce &amp;amp; Gabbana&lt;/strong&gt;&amp;nbsp;(ˈdoltʃe ænd gaˈbana) là một nhãn hiệu thời trang cao cấp, được thành lập bởi hai nhà thiết kế thời trang người&amp;nbsp;&lt;a href=&quot;http://vi.wikipedia.org/wiki/%C3%9D&quot; title=&quot;Ý&quot;&gt;Ý&lt;/a&gt;&amp;nbsp;là&amp;nbsp;&lt;a href=&quot;http://vi.wikipedia.org/w/index.php?title=Domenico_Dolce&amp;amp;action=edit&amp;amp;redlink=1&quot; title=&quot;Domenico Dolce (trang chưa được viết)&quot;&gt;Domenico Dolce&lt;/a&gt;&amp;nbsp;(sinh gần&amp;nbsp;&lt;a href=&quot;http://vi.wikipedia.org/wiki/Palermo&quot; title=&quot;Palermo&quot;&gt;Palermo&lt;/a&gt;,&amp;nbsp;&lt;a href=&quot;http://vi.wikipedia.org/wiki/Sicilia&quot; title=&quot;Sicilia&quot;&gt;Sicilia&lt;/a&gt;) và&amp;nbsp;&lt;a href=&quot;http://vi.wikipedia.org/w/index.php?title=Stefano_Gabbana&amp;amp;action=edit&amp;amp;redlink=1&quot; title=&quot;Stefano Gabbana (trang chưa được viết)&quot;&gt;Stefano Gabbana&lt;/a&gt;&amp;nbsp;(sinh tại&amp;nbsp;&lt;a href=&quot;http://vi.wikipedia.org/wiki/Milano&quot; title=&quot;Milano&quot;&gt;Milano&lt;/a&gt;). Dolce &amp;amp; Gabbana là nhãn hiệu thời trang rất nổi tiếng trong giới&amp;nbsp;&lt;a href=&quot;http://vi.wikipedia.org/wiki/%C4%90i%E1%BB%87n_%E1%BA%A3nh_Hoa_K%E1%BB%B3&quot; title=&quot;Điện ảnh Hoa Kỳ&quot;&gt;Hollywood&lt;/a&gt;; họ đã thiết kế trang phục cho những ngôi sao như&amp;nbsp;&lt;a href=&quot;http://vi.wikipedia.org/wiki/Madonna_(ca_s%C4%A9)&quot; title=&quot;Madonna (ca sĩ)&quot;&gt;Madonna&lt;/a&gt;,&amp;nbsp;&lt;a href=&quot;http://vi.wikipedia.org/w/index.php?title=Gisele_B%C3%BCndchen&amp;amp;action=edit&amp;amp;redlink=1&quot; title=&quot;Gisele Bündchen (trang chưa được viết)&quot;&gt;Gisele Bündchen&lt;/a&gt;,&amp;nbsp;&lt;a href=&quot;http://vi.wikipedia.org/wiki/Monica_Bellucci&quot; title=&quot;Monica Bellucci&quot;&gt;Monica Bellucci&lt;/a&gt;,&amp;nbsp;&lt;a href=&quot;http://vi.wikipedia.org/wiki/Hamasaki_Ayumi&quot; title=&quot;Hamasaki Ayumi&quot;&gt;Ayumi Hamasaki&lt;/a&gt;,&amp;nbsp;&lt;a href=&quot;http://vi.wikipedia.org/wiki/Isabella_Rossellini&quot; title=&quot;Isabella Rossellini&quot;&gt;Isabella Rossellini&lt;/a&gt;,&amp;nbsp;&lt;a href=&quot;http://vi.wikipedia.org/wiki/Kylie_Minogue&quot; title=&quot;Kylie Minogue&quot;&gt;Kylie Minogue&lt;/a&gt;&amp;nbsp;cùng nhiều ngôi sao khác.&lt;/p&gt;\r\n\r\n&lt;p&gt;Trụ sở của công ty đặt tại Milano (Legnano). Cuộc sống riêng của hai nhà tạo mẫu Stefano Gabbana và Domenico Dolce trở nên nổi tiếng với công chúng năm 2005 khi họ chính thức tuyên bố sự cách ly trong đời sống riêng. Tuy nhiên, việc kinh doanh vẫn không thay đổi và cả hai vẫn tiếp tục thiết kế cùng nhau.&lt;/p&gt;\r\n\r\n&lt;p&gt;Dolce &amp;amp; Gabbana tập trung chủ yếu vào hai dòng sản phẩm cho lứa tuổi trưởng thành: D&amp;amp;G và Dolce&amp;amp;Gabbana, ngoài ra còn có dòng sản phẩm dành cho trẻ em D&amp;amp;G Junior&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;Dolce&amp;amp;Gabbana &lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;Dolce&amp;amp;Gabbana là dòng sản phẩm chuyên tập trung vào các phụ kiện đắt tiền, coi trọng trào lưu lâu dài hơn là những thay đổi mùa vụ, đây là dòng sản phẩm thể hiện ảnh hưởng và phong cách của các nhà tạo mẫu rõ rệt hơn.&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;D&amp;amp;G&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;D&amp;amp;G là dòng sản phẩm phổ biến hơn, chạy theo nguồn cảm hứng đô thị và cố gắng tạo ra các trào lưu hơn là chạy theo trào lưu. Cả hai dòng sản phẩm đều cung cấp quần áo bơi,&lt;a href=&quot;http://vi.wikipedia.org/w/index.php?title=%C4%90%E1%BB%93_l%C3%B3t&amp;amp;action=edit&amp;amp;redlink=1&quot; title=&quot;Đồ lót (trang chưa được viết)&quot;&gt;đồ lót&lt;/a&gt;,&lt;a href=&quot;http://vi.wikipedia.org/w/index.php?title=K%C3%ADnh_ki%E1%BB%83u&amp;amp;action=edit&amp;amp;redlink=1&quot; title=&quot;Kính kiểu (trang chưa được viết)&quot;&gt;kính kiểu&lt;/a&gt;&amp;nbsp;,&amp;nbsp;&lt;a href=&quot;http://vi.wikipedia.org/wiki/K%C3%ADnh_r%C3%A2m&quot; title=&quot;Kính râm&quot;&gt;kính râm&lt;/a&gt;và&amp;nbsp;&lt;a href=&quot;http://vi.wikipedia.org/wiki/N%C6%B0%E1%BB%9Bc_hoa&quot; title=&quot;Nước hoa&quot;&gt;nước hoa&lt;/a&gt;. Dòng sản phẩm D&amp;amp;G còn gồm cả đồ trang sức và đồng hồ. Năm 2005 và 2006, D&amp;amp;G và&amp;nbsp;&lt;a href=&quot;http://vi.wikipedia.org/wiki/Motorola&quot; title=&quot;Motorola&quot;&gt;Motorola&lt;/a&gt;&amp;nbsp;phối hợp hợp tác cho ra mắt hạn chế 1000 chiếc điện thoại&amp;nbsp;&lt;a href=&quot;http://vi.wikipedia.org/w/index.php?title=Motorola_RAZR_V3i&amp;amp;action=edit&amp;amp;redlink=1&quot; title=&quot;Motorola RAZR V3i (trang chưa được viết)&quot;&gt;Motorola RAZR V3i&lt;/a&gt;, chỉ được phân phối bởi các cửa hiệu của D&amp;amp;G và đại lý phân phối của Motorola.&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;D&amp;amp;G Junior&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;Dolce &amp;amp; Gabbana cũng thiết kế dòng sản phẩm D&amp;amp;G dành cho trẻ em, nhằm vào trẻ em dưới 15 tuổi. Cũng giống dòng sản phẩm D&amp;amp;G của người lớn, dòng sản phẩm D&amp;amp;G trẻ em chạy theo thay đổi thời vụ cho các bé trai và gái ở mọi lứa tuổi. Dòng D&amp;amp;G trẻ em bị ảnh hưởng rõ rệt bởi văn hóa đại chúng, so với D&amp;amp;G, ví dụ như dòng Ibiza của D&amp;amp;G trẻ em.&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;Phân phối&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;Dolce &amp;amp; Gabbana có 1 mạng lưới phân phối rộng lớn trên toàn cầu. Bao gồm 27 cửa hiệu tại&amp;nbsp;&lt;a href=&quot;http://vi.wikipedia.org/wiki/Hoa_K%E1%BB%B3&quot; title=&quot;Hoa Kỳ&quot;&gt;Mỹ&lt;/a&gt;:&amp;nbsp;&lt;a href=&quot;http://vi.wikipedia.org/wiki/Th%C3%A0nh_ph%E1%BB%91_New_York&quot; title=&quot;Thành phố New York&quot;&gt;New York&lt;/a&gt;,&amp;nbsp;&lt;a href=&quot;http://vi.wikipedia.org/wiki/Beverly_Hills&quot; title=&quot;Beverly Hills&quot;&gt;Beverly Hills&lt;/a&gt;,&amp;nbsp;&lt;a href=&quot;http://vi.wikipedia.org/wiki/Long_Island&quot; title=&quot;Long Island&quot;&gt;Long Island&lt;/a&gt;,&lt;a href=&quot;http://vi.wikipedia.org/wiki/Miami,_Florida&quot; title=&quot;Miami, Florida&quot;&gt;Miami&lt;/a&gt;,&amp;nbsp;&lt;a href=&quot;http://vi.wikipedia.org/wiki/Las_Vegas&quot; title=&quot;Las Vegas&quot;&gt;Las Vegas&lt;/a&gt;,&amp;nbsp;&lt;a href=&quot;http://vi.wikipedia.org/w/index.php?title=Short_Hills&amp;amp;action=edit&amp;amp;redlink=1&quot; title=&quot;Short Hills (trang chưa được viết)&quot;&gt;Short Hills&lt;/a&gt;,&amp;nbsp;&lt;a href=&quot;http://vi.wikipedia.org/wiki/Atlanta&quot; title=&quot;Atlanta&quot;&gt;Atlanta&lt;/a&gt;,&amp;nbsp;&lt;a href=&quot;http://vi.wikipedia.org/wiki/Chicago&quot; title=&quot;Chicago&quot;&gt;Chicago&lt;/a&gt;,&lt;a href=&quot;http://vi.wikipedia.org/wiki/Boston&quot; title=&quot;Boston&quot;&gt;Boston&lt;/a&gt;,&amp;nbsp;&lt;a href=&quot;http://vi.wikipedia.org/wiki/San_Francisco&quot; title=&quot;San Francisco&quot;&gt;San Francisco&lt;/a&gt;&amp;nbsp;và&amp;nbsp;&lt;a href=&quot;http://vi.wikipedia.org/wiki/Washington,_D.C.&quot; title=&quot;Washington, D.C.&quot;&gt;Washington D.C&lt;/a&gt;.,thông qua các cửa hàng nguồn và hệ thong các cửa hiệu bán lẻ lớn như: Bergdorf Goodman, Lord and Taylor, Neiman Marcus và Saks Fifth Avenue. ở Ý số cửa hàng là 19, ở&amp;nbsp;&lt;a href=&quot;http://vi.wikipedia.org/wiki/Nh%E1%BA%ADt_B%E1%BA%A3n&quot; title=&quot;Nhật Bản&quot;&gt;Nhật&lt;/a&gt;&amp;nbsp;là 7.Các của hàng phân phối tại&amp;nbsp;&lt;a href=&quot;http://vi.wikipedia.org/wiki/%C4%90%E1%BB%A9c&quot; title=&quot;Đức&quot;&gt;Đức&lt;/a&gt;,&amp;nbsp;&lt;a href=&quot;http://vi.wikipedia.org/wiki/%C3%81o&quot; title=&quot;Áo&quot;&gt;Áo&lt;/a&gt;,&amp;nbsp;&lt;a href=&quot;http://vi.wikipedia.org/wiki/B%E1%BB%89&quot; title=&quot;Bỉ&quot;&gt;Bỉ&lt;/a&gt;,&amp;nbsp;&lt;a href=&quot;http://vi.wikipedia.org/wiki/T%C3%A2y_Ban_Nha&quot; title=&quot;Tây Ban Nha&quot;&gt;Tây Ban Nha&lt;/a&gt;,&lt;a href=&quot;http://vi.wikipedia.org/wiki/Ph%C3%A1p&quot; title=&quot;Pháp&quot;&gt;Pháp&lt;/a&gt;,&amp;nbsp;&lt;a href=&quot;http://vi.wikipedia.org/wiki/Hy_L%E1%BA%A1p&quot; title=&quot;Hy Lạp&quot;&gt;Hy Lạp&lt;/a&gt;,&amp;nbsp;&lt;a href=&quot;http://vi.wikipedia.org/wiki/C%E1%BB%99ng_h%C3%B2a_Ireland&quot; title=&quot;Cộng hòa Ireland&quot;&gt;Ireland&lt;/a&gt;,&amp;nbsp;&lt;a href=&quot;http://vi.wikipedia.org/wiki/Anh&quot; title=&quot;Anh&quot;&gt;Anh&lt;/a&gt;,&amp;nbsp;&lt;a href=&quot;http://vi.wikipedia.org/wiki/H%C3%A0_Lan&quot; title=&quot;Hà Lan&quot;&gt;Hà Lan&lt;/a&gt;,&amp;nbsp;&lt;a href=&quot;http://vi.wikipedia.org/wiki/Nga&quot; title=&quot;Nga&quot;&gt;Nga&lt;/a&gt;,&lt;a href=&quot;http://vi.wikipedia.org/wiki/Th%E1%BB%A5y_S%C4%A9&quot; title=&quot;Thụy Sĩ&quot;&gt;Thụy Sĩ&lt;/a&gt;,&amp;nbsp;&lt;a href=&quot;http://vi.wikipedia.org/wiki/Ukraina&quot; title=&quot;Ukraina&quot;&gt;Ukraina&lt;/a&gt;,&amp;nbsp;&lt;a href=&quot;http://vi.wikipedia.org/wiki/%E1%BA%A2_R%E1%BA%ADp_Saudi&quot; title=&quot;Ả Rập Saudi&quot;&gt;Ả Rập Saudi&lt;/a&gt;,&amp;nbsp;&lt;a href=&quot;http://vi.wikipedia.org/wiki/H%C3%A0n_Qu%E1%BB%91c&quot; title=&quot;Hàn Quốc&quot;&gt;Hàn Quốc&lt;/a&gt;,&amp;nbsp;&lt;a href=&quot;http://vi.wikipedia.org/w/index.php?title=C%C3%A1c_Ti%E1%BB%83u_V%C6%B0%C6%A1ng_Qu%E1%BB%91c_%E1%BA%A2-_r%E1%BA%ADp&amp;amp;action=edit&amp;amp;redlink=1&quot; title=&quot;Các Tiểu Vương Quốc Ả- rập (trang chưa được viết)&quot;&gt;Các Tiểu Vương Quốc Ả- rập&lt;/a&gt;,&amp;nbsp;&lt;a href=&quot;http://vi.wikipedia.org/wiki/Trung_Qu%E1%BB%91c&quot; title=&quot;Trung Quốc&quot;&gt;Trung Quốc&lt;/a&gt;,&amp;nbsp;&lt;a href=&quot;http://vi.wikipedia.org/wiki/%E1%BA%A4n_%C4%90%E1%BB%99&quot; title=&quot;Ấn Độ&quot;&gt;Ấn Độ&lt;/a&gt;,&lt;a href=&quot;http://vi.wikipedia.org/wiki/Kuwait&quot; title=&quot;Kuwait&quot;&gt;Kuwait&lt;/a&gt;,&amp;nbsp;&lt;a href=&quot;http://vi.wikipedia.org/wiki/Liban&quot; title=&quot;Liban&quot;&gt;Liban&lt;/a&gt;,&amp;nbsp;&lt;a href=&quot;http://vi.wikipedia.org/wiki/Singapore&quot; title=&quot;Singapore&quot;&gt;Singapore&lt;/a&gt;,&amp;nbsp;&lt;a href=&quot;http://vi.wikipedia.org/wiki/Th%C3%A1i_Lan&quot; title=&quot;Thái Lan&quot;&gt;Thái Lan&lt;/a&gt;,&amp;nbsp;&lt;a href=&quot;http://vi.wikipedia.org/wiki/%C4%90%C3%A0i_Loan&quot; title=&quot;Đài Loan&quot;&gt;Đài Loan&lt;/a&gt;,&amp;nbsp;&lt;a href=&quot;http://vi.wikipedia.org/wiki/Canada&quot; title=&quot;Canada&quot;&gt;Canada&lt;/a&gt;,&amp;nbsp;&lt;a href=&quot;http://vi.wikipedia.org/wiki/M%C3%A9xico&quot; title=&quot;México&quot;&gt;Mexico&lt;/a&gt;,&amp;nbsp;&lt;a href=&quot;http://vi.wikipedia.org/wiki/Brasil&quot; title=&quot;Brasil&quot;&gt;Brasil&lt;/a&gt;,&lt;a href=&quot;http://vi.wikipedia.org/wiki/Argentina&quot; title=&quot;Argentina&quot;&gt;Argentina&lt;/a&gt;,&amp;nbsp;&lt;a href=&quot;http://vi.wikipedia.org/wiki/Chile&quot; title=&quot;Chile&quot;&gt;Chile&lt;/a&gt;&amp;nbsp;và&amp;nbsp;&lt;a href=&quot;http://vi.wikipedia.org/wiki/Cuba&quot; title=&quot;Cuba&quot;&gt;Cuba&lt;/a&gt;.&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;em&gt;(Nguồn: Wikipedia)&lt;/em&gt;&lt;/p&gt;\r\n', 'data/thuong hieu/images.jpg', 0),
(34, 'Burberry', '&lt;p&gt;Burberry là thương hiệu thời trang cao cấp nổi tiếng của Anh thành lập năm 1856 tại Luân Đôn.Ra đời từ những năm thuộc thế kỷ 19, Burberry có một lịch sử đáng tự hào. Thời điểm đáng ghi nhớ là năm 1879, Thomas Burberry, người sáng lập thương hiệu Burberry đã phát triển ra một loại vải mới mà có thể chịu đựng được thời tiết khắc nghiệt. Burberry sử dụng một quy trình sản xuất bí mật riêng để tạo ra một chất liệu mới không bị rách và chịu được mưa gió mà vẫn thoáng mát. Ông đăng kí thương hiệu và đặt tên cho loại vải đó là &quot;gabardine&quot;, loại vải này đi vào lịch sử ngành thời trang và được công chúng mến mộ. Những chiếc áo mưa bằng vải gabardine đầu tiên của Burberry xuất hiện vào đầu thế kỷ 20.&lt;/p&gt;\r\n\r\n&lt;p&gt;Những nhà thám hiểm Na Uy, thuyền trưởng Roald Amundsen Scott đã lựa chọn những sản phẩm của Burberry khi ông ta trở thành người đầu tiên đến Nam Cực. Ông ta đã để lại chiếc lều Burberry bằng vải gabardine tại Nam Cực để thông báo sứ mệnh thành công của cuộc thám hiểm. Tương tự như vậy, những phi công và những người đi bằng khinh khí cầu được sưởi ấm bằng ánh sáng mặt trời nhưng vẫn mặc áo khoác gió Burberry. Phi cơ trưởng, ngài William Alcock và trung úy Arthur Whitten Bronw đã mặc quân trang Burberry khi họ là người đàn ông đầu tiên bay qua Đại Tây Dương vào năm 1919.&lt;/p&gt;\r\n\r\n&lt;p&gt;Năm 1901, để tạo thêm nét đặc sắc cho thương hiệu của mình, Burberrry đã sáng chế ra một biểu tượng chung in lên trang phục và được sử dụng cho đến ngày nay. Đó là hình ảnh một hiệp sĩ mặc áp giáp cưỡi ngựa thấm đượm tinh thần hiệp sĩ của vương quốc Anh, biểu tượng cho sự chính trực và che chở. Nhãn hàng Burberry được vinh dự là nhà thiết kế chính cho phục trang quân đội Anh Quốc. Năm 1920, những đường sọc đặc trưng xuất hiện trên quân phục nước Anh , và cái tên Burberry trở thành thương hiệu thời trang được toàn thế giới biết đến.&lt;/p&gt;\r\n\r\n&lt;p&gt;Không phô trương, màu mè, Burberry còn được giới thời trang biết đến với những đường sọc cá tính, độc đáo nhưng không kém phần trang nhã. Mô típ caro đặc trưng của Burberry với 4 màu be đen, trắng và đỏ đã xuất hiện đầu tiên trên viền áo của sản phẩm áo khoác trendcoat vào năm 1924, thể hiện sự giàu có và sang trọng của giới quý tộc Anh thời kì đó.. Đây thật sự là mô típ được ưa chuộng và đặc trưng trên toàn thế giới.&lt;/p&gt;\r\n\r\n&lt;p&gt;Nhắc đến Burberry chính là nhắc đến kiểu dáng và chất lượng sản phẩm với một phong cách quý tộc Anh, sang trọng và thanh nhã. Biểu tượng dễ nhận thấy của dòng sản phẩm này là màu lạc đà lạ mắt, cổ áo măng tô diềm xếp, logo hiệp sĩ và những họa tiết sọc ca rô sang trọng. Ngày nay, Burberry đang quay lại với những sức mạnh của giá trị truyền thống, kết hợp với xu hướng thiết kế hiện đại để thổi hồn vào những sáng tạo của mình.Tất cả các họa tiết, đường may, kiểu dáng hòa quyện với nhau trên bộ trang phục khiến người mặc nó trở nên thật sành điệu và đẳng cấp. Ngoài quần áo, giày dép, Burberry còn sản xuất các mặt hàng như dù, va li, khăn quàng cổ.&lt;/p&gt;\r\n\r\n&lt;p&gt;Trong những năm gần đây, Burberry tiếp tục mở rộng lĩnh vực hoạt động của mình bằng việc tung ra rất nhiều sản phẩm gây tiếng vang như nước hoa và túi xách. Không dừng lại ở đó, Burberry lấn sân sang thị trường Bắc Mỹ và trở thành thương hiệu thời trang ưa chuộng của các ngôi sao hàng đầu Hollywood như Britney Spears, Justin Timberlake, Demi Moore, Maddona. Hàng loạt thiết kế Burberry xuất hiện trên màn ảnh Hollywood, nhờ đó, vị thế của nhãn hiệu này trong ngành thời trang thế giới được củng cố mạnh mẽ. Trải qua nhiều thay đổi về quy mô và kiểu dáng, Burbery vẫn luôn là thương hiệu đại diện cho sự thành công và sáng tạo được nhiều người ao ước.&lt;/p&gt;\r\n\r\n&lt;p&gt;(Nguồn: sưu tầm)&lt;/p&gt;\r\n', 'data/thuong hieu/burberry logo.jpg', 0);

-- --------------------------------------------------------

--
-- Table structure for table `manufacturer_to_store`
--

CREATE TABLE IF NOT EXISTS `manufacturer_to_store` (
  `manufacturer_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  PRIMARY KEY (`manufacturer_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `manufacturer_to_store`
--

INSERT INTO `manufacturer_to_store` (`manufacturer_id`, `store_id`) VALUES
(5, 0),
(6, 0),
(7, 0),
(8, 0),
(9, 0),
(10, 0),
(11, 0),
(12, 0),
(14, 0),
(15, 0),
(16, 0),
(17, 0),
(18, 0),
(19, 0),
(20, 0),
(21, 0),
(22, 0),
(23, 0),
(24, 0),
(25, 0),
(26, 0),
(27, 0),
(28, 0),
(29, 0),
(30, 0),
(31, 0),
(32, 0),
(33, 0),
(34, 0);

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE IF NOT EXISTS `messages` (
  `message_id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) DEFAULT NULL,
  `customer_id` int(10) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `content` text,
  `created_by` varchar(50) DEFAULT NULL,
  `is_read` tinyint(4) DEFAULT '0',
  `created` datetime DEFAULT NULL,
  PRIMARY KEY (`message_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `news`
--

CREATE TABLE IF NOT EXISTS `news` (
  `news_id` int(11) NOT NULL AUTO_INCREMENT,
  `manufacturer_id` int(11) DEFAULT NULL,
  `news_link` varchar(250) COLLATE utf8_bin DEFAULT NULL,
  `image` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `date_available` date NOT NULL,
  `sort_order` int(11) NOT NULL DEFAULT '0',
  `comment` tinyint(1) NOT NULL DEFAULT '0',
  `approved` tinyint(1) NOT NULL DEFAULT '0',
  `status` int(1) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `viewed` int(5) NOT NULL DEFAULT '0',
  PRIMARY KEY (`news_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=30 ;

--
-- Dumping data for table `news`
--

INSERT INTO `news` (`news_id`, `manufacturer_id`, `news_link`, `image`, `date_available`, `sort_order`, `comment`, `approved`, `status`, `date_added`, `date_modified`, `viewed`) VALUES
(15, 8, 'http://shop-uk.lacoste.com/on/demandware.store/Sites-GB-Site/en_GB/Default-Start?utm_source=newsletter_loyalty_2013-07-14&amp;utm_medium=emailing_int&amp;utm_campaign=sale_shoes_2013-07-14', 'data/welcomepage_double-push-bottom-left-uk.jpg', '2013-07-13', 1, 1, 1, 1, '2013-07-14 14:05:10', '0000-00-00 00:00:00', 5),
(13, 16, 'http://www.shop-eu.puma.com/on/demandware.store/Sites-EU-Site/de/Link-Category?cgid=20000', 'data/puma_eos_summer_sale_reminder_en_2013_07_r3_c3.jpg', '2013-07-13', 1, 1, 1, 1, '2013-07-14 13:32:03', '2013-07-14 14:02:48', 4),
(14, 17, 'http://www.mrporter.com/Shop/List/Alfresco_Dressing?viewall=on&amp;cm_mmc=Email-_-Trend-_-140713-_-INTL', 'data/hero_topnew.jpg', '2013-07-13', 1, 1, 1, 1, '2013-07-14 13:38:59', '2013-07-14 14:12:38', 5),
(16, 18, 'http://www.asos.com/Men/Sale/Accessories/Cat/pgecategory.aspx?affId=9603&amp;cid=2097&amp;WT.tsrc=Email', 'data/email_im_v2.gif', '2013-07-13', 1, 1, 1, 1, '2013-07-14 14:11:05', '2013-07-14 14:12:28', 5),
(17, 19, 'https://www.abercrombie.com/webapp/wcs/stores/servlet/CategoryDisplay?et_rid=&amp;med=email&amp;catalogId=10901&amp;om_mid=_BR4TM2B8z3G7Hm&amp;linkid=mainmsg&amp;om_rid=AA2tuJ&amp;cmp=EMM_071313ANFxEUUKunknownSATdenimGUIDE&amp;et_cid=2093969851&amp;s', 'data/new0710_Saturday_Editorial_AF_WOMEN_12.jpg', '2013-07-13', 1, 1, 1, 1, '2013-07-14 14:18:27', '0000-00-00 00:00:00', 4),
(18, 20, 'http://www.topman.com/webapp/wcs/stores/servlet/CatalogNavigationSearchResultCmd?catalogId=33056&amp;storeId=12555&amp;langId=-1&amp;viewAllFlag=false&amp;sort_field=Relevance&amp;categoryId=234016&amp;beginIndex=1&amp;pageSize=200&amp;intcmpid=ukd_s', 'data/WK46_Sale_10_OFF.jpg', '2013-07-13', 1, 1, 1, 1, '2013-07-14 14:23:06', '0000-00-00 00:00:00', 5),
(19, 21, 'http://www.g2000.com.sg/page/thecollections', 'data/content1.8.jpg', '2013-07-13', 1, 1, 1, 1, '2013-07-14 14:28:26', '0000-00-00 00:00:00', 43),
(21, 23, 'http://www.uniqlo.com/us/womens-clothing/collections/ut-tshirts?utm_source=NL-2013-07-14&amp;utm_medium=email&amp;utm_content=Promo-UT-MEN-WOMEN&amp;utm_campaign=WEEK-28-071413-UT-MEN-WOMEN', 'data/hero_ut_w.jpg', '2013-07-13', 1, 1, 1, 1, '2013-07-14 20:33:59', '2013-07-14 21:40:38', 5),
(22, 26, 'http://www.mango.com', 'data/Thuyanh/she_006.jpg', '2013-07-13', 1, 1, 1, 1, '2013-07-14 21:52:44', '2013-07-14 22:06:38', 9),
(23, 27, 'http://www.dorothyperkins.com/webapp/wcs/stores/servlet/CatalogNavigationSearchResultCmd?catalogId=33053&amp;storeId=12552&amp;langId=-1&amp;viewAllFlag=false&amp;sort_field=Relevance&amp;categoryId=228107&amp;parent_categoryId=226988&amp;beginIndex=', 'data/Thuyanh/UK_nl_sunday_wk47_1.jpg', '2013-07-13', 1, 1, 1, 1, '2013-07-14 21:59:32', '2013-07-14 22:06:03', 12),
(24, 28, 'http://www.superdry.com/mens/t-shirts/details/39970/warriors-t-shirt?utm_source=redeye&amp;utm_medium=email&amp;utm_campaign=20130714_whats_hot_UK', 'data/de79f963aec245c12a6adef0c7610a43a1ccf4f4.jpg', '2013-07-14', 1, 1, 1, 1, '2013-07-15 06:08:03', '0000-00-00 00:00:00', 4),
(25, 15, 'http://store.diesel.com/fashionshow.asp?gender=U&amp;mm=125&amp;tp=51952&amp;utm_source=11072013_DSL_SBL_FW13_EU&amp;utm_medium=email&amp;utm_campaign=eu', 'data/NL_ShopLook_03_01.jpg', '2013-07-14', 1, 1, 1, 1, '2013-07-15 06:11:02', '2013-07-15 06:24:32', 3),
(26, 30, 'http://www.jcrew.com/index.jsp?srcCode=EMSL06717&amp;em=welookvn@gmail.com', 'data/071413_jc_summersale_01.jpg', '2013-07-14', 1, 1, 1, 1, '2013-07-15 06:15:43', '0000-00-00 00:00:00', 3),
(27, 31, 'http://www.burton.co.uk/webapp/wcs/stores/servlet/CatalogNavigationSearchResultCmd?catalogId=33052&amp;storeId=12551&amp;langId=-1&amp;viewAllFlag=false&amp;sort_field=Relevance&amp;categoryId=330519&amp;beginIndex=1&amp;pageSize=20&amp;cmpid=nl_13_w', '', '2013-07-14', 1, 1, 1, 1, '2013-07-15 06:21:04', '0000-00-00 00:00:00', 4),
(28, 29, 'https://secure.nordstrom.com/instantcreditapproval/signin.aspx?cm_mmc=email-_-071313-_-eisiud_mens_sunglasses-_-bnr3_img1&amp;cm_em=31497269', 'data/hero7_1 (1).jpg', '2013-07-14', 1, 1, 1, 1, '2013-07-15 06:23:22', '0000-00-00 00:00:00', 13),
(29, 33, 'http://explore.calvinklein.com/', 'data/20130716_ck_ecom_13.jpg', '2013-07-15', 1, 1, 1, 1, '2013-07-16 15:02:13', '2013-07-16 15:04:41', 2);

-- --------------------------------------------------------

--
-- Table structure for table `news_category`
--

CREATE TABLE IF NOT EXISTS `news_category` (
  `news_category_id` int(11) NOT NULL AUTO_INCREMENT,
  `theme_id` int(11) DEFAULT '0',
  `image` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `top` tinyint(4) NOT NULL,
  `column` int(3) NOT NULL,
  `sort_order` int(3) NOT NULL DEFAULT '0',
  `status` int(1) NOT NULL,
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`news_category_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=4 ;

--
-- Dumping data for table `news_category`
--

INSERT INTO `news_category` (`news_category_id`, `theme_id`, `image`, `parent_id`, `top`, `column`, `sort_order`, `status`, `date_added`, `date_modified`) VALUES
(1, 0, '', 0, 1, 1, 4, 1, '2013-05-20 23:56:00', '2013-07-15 06:13:51'),
(2, 1, '', 0, 0, 1, 5, 1, '2013-05-23 23:20:14', '2013-05-29 00:17:44');

-- --------------------------------------------------------

--
-- Table structure for table `news_category_description`
--

CREATE TABLE IF NOT EXISTS `news_category_description` (
  `news_category_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `description` text COLLATE utf8_bin NOT NULL,
  `meta_description` varchar(255) COLLATE utf8_bin NOT NULL,
  `meta_keyword` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`news_category_id`,`language_id`),
  KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `news_category_description`
--

INSERT INTO `news_category_description` (`news_category_id`, `language_id`, `name`, `description`, `meta_description`, `meta_keyword`) VALUES
(2, 2, 'Báo chí / Truyền thông', '', '', ''),
(1, 2, 'Tin nóng hàng ngày ', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `news_category_to_layout`
--

CREATE TABLE IF NOT EXISTS `news_category_to_layout` (
  `news_category_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL,
  PRIMARY KEY (`news_category_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `news_category_to_store`
--

CREATE TABLE IF NOT EXISTS `news_category_to_store` (
  `news_category_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  PRIMARY KEY (`news_category_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `news_category_to_store`
--

INSERT INTO `news_category_to_store` (`news_category_id`, `store_id`) VALUES
(1, 0),
(2, 0);

-- --------------------------------------------------------

--
-- Table structure for table `news_comment`
--

CREATE TABLE IF NOT EXISTS `news_comment` (
  `comment_id` int(11) NOT NULL AUTO_INCREMENT,
  `news_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `author` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `email` varchar(96) COLLATE utf8_bin NOT NULL,
  `text` text COLLATE utf8_bin NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`comment_id`),
  KEY `product_id` (`news_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `news_description`
--

CREATE TABLE IF NOT EXISTS `news_description` (
  `news_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_bin NOT NULL,
  `short_description` text COLLATE utf8_bin NOT NULL,
  `description` text COLLATE utf8_bin NOT NULL,
  `meta_description` varchar(255) COLLATE utf8_bin NOT NULL,
  `meta_keyword` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`news_id`,`language_id`),
  KEY `name` (`name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=30 ;

--
-- Dumping data for table `news_description`
--

INSERT INTO `news_description` (`news_id`, `language_id`, `name`, `short_description`, `description`, `meta_description`, `meta_keyword`) VALUES
(14, 2, 'MR PORTER Giảm giá tới 70% - Rất nhiều hàng siêu đẹp', '', '&lt;div&gt;\r\n&lt;table align=&quot;center&quot; border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; width=&quot;735&quot;&gt;\r\n	&lt;tbody&gt;\r\n		&lt;tr&gt;\r\n			&lt;td style=&quot;border:solid 1px #cccccc&quot;&gt;\r\n			&lt;table align=&quot;center&quot; border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; width=&quot;735&quot;&gt;\r\n				&lt;tbody&gt;\r\n					&lt;tr&gt;\r\n						&lt;td&gt;&amp;nbsp;&lt;/td&gt;\r\n					&lt;/tr&gt;\r\n					&lt;tr&gt;\r\n						&lt;td align=&quot;center&quot; height=&quot;60&quot; style=&quot;font-family:Arial,Helvetica,sans-serif;font-size:11px;color:#7d7d7d&quot;&gt;&lt;a href=&quot;https://email.mrporter.com/pub/cc?_ri_=X0Gzc2X%3DWQpglLjHJlYQGsw5kzfzc8qW0bpJNGzgSu4PKqGzfuABzazcXzfsnVXtpKX%3DCCBUS&amp;amp;_ei_=Ej0gXptnOqCiPFxGE5mURiykBFg-9BrnTD9ZgXjybWIw1NU-wIMzGoEpThBPH7-sDc6sZaf8YlhxLrW5n-U1HlkAADAJOhsf2DPj9ms_kU8cVOTT0BN-H6mOIzt83bauQ07_DaFx.&quot; style=&quot;color:#8a0707&quot; target=&quot;_blank&quot;&gt;Shop the SALE&lt;/a&gt;&lt;br /&gt;\r\n						Problems viewing this email? Select &quot;always display images&quot; or &lt;a href=&quot;https://email.mrporter.com/pub/cc?_ri_=X0Gzc2X%3DWQpglLjHJlYQGsw5kzfzc8qW0bpJNGzgSu4PKqGzfuABzazcXzfsnVXtpKX%3DCCBUT&amp;amp;_ei_=Ej0gXptnOqCiPFxGE5mURiykBFg-9BrnTD9ZgXjybWIw1NU-wIMzGoEpThBPH7-sDc6sZaf8YlhxLrW5n-U1HllMWeVW5nwukdt91KsWeEzO999VbsAn3ME.&quot; style=&quot;color:#7d7d7d&quot; target=&quot;_blank&quot;&gt;click here&lt;/a&gt;&lt;/td&gt;\r\n					&lt;/tr&gt;\r\n					&lt;tr&gt;\r\n						&lt;td&gt;&lt;a href=&quot;https://email.mrporter.com/pub/cc?_ri_=X0Gzc2X%3DWQpglLjHJlYQGsw5kzfzc8qW0bpJNGzgSu4PKqGzfuABzazcXzfsnVXtpKX%3DCCBUU&amp;amp;_ei_=Ej0gXptnOqCiPFxGE5mURiykBFg-9BrnTD9ZgXjybWIw1NU-wIMzGoEpThBPH7-sDc6sZaf8YlhxLrW5n-U1HlkAADAJOhsf2DPj9ms_kU8cVOTT0BN-H6mOIzt83bauQ07_DaFx.&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;MR PORTER&quot; border=&quot;0&quot; height=&quot;43&quot; src=&quot;https://responsys.hs.llnwd.net/i5/responsysimages/mrporter/Trend_Q3_2013/Trend_140713_INTL/logo_top.jpg&quot; style=&quot;display:block&quot; width=&quot;735&quot; /&gt; &lt;/a&gt;&lt;/td&gt;\r\n					&lt;/tr&gt;\r\n					&lt;tr&gt;\r\n						&lt;td&gt;\r\n						&lt;table border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; width=&quot;735&quot;&gt;\r\n							&lt;tbody&gt;\r\n								&lt;tr&gt;\r\n									&lt;td&gt;&lt;a href=&quot;https://email.mrporter.com/pub/cc?_ri_=X0Gzc2X%3DWQpglLjHJlYQGsw5kzfzc8qW0bpJNGzgSu4PKqGzfuABzazcXzfsnVXtpKX%3DCCBUW&amp;amp;_ei_=Ej0gXptnOqCiPFxGE5mURiykBFg-9BrnTD9ZgXjybWIw1NU-wIMzGoEpThBPH7-sDc6sZaf8YlhxLrW5n-U1HlkAADAJOhsf2DPj9ms_kU8cVOTT0BN-H6mOIzt83bauQ07_DaFx.&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;What''s New&quot; border=&quot;0&quot; height=&quot;31&quot; src=&quot;https://responsys.hs.llnwd.net/i5/responsysimages/mrporter/Trend_Q3_2013/Trend_140713_INTL/nav1_sale.jpg&quot; width=&quot;159&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n									&lt;td&gt;&lt;a href=&quot;https://email.mrporter.com/pub/cc?_ri_=X0Gzc2X%3DWQpglLjHJlYQGsw5kzfzc8qW0bpJNGzgSu4PKqGzfuABzazcXzfsnVXtpKX%3DCCBUY&amp;amp;_ei_=Ej0gXptnOqCiPFxGE5mURiykBFg-9BrnTD9ZgXjybWIw1NU-wIMzGoEpThBPH7-sDc6sZaf8YlhxLrW5n-U1HlkAADAJOhsf2DPj9ms_kU8cVOTT0BN-H6mOIzt83bauQ07_DaFx.&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;Designers&quot; border=&quot;0&quot; height=&quot;31&quot; src=&quot;https://responsys.hs.llnwd.net/i5/responsysimages/mrporter/Trend_Q3_2013/Trend_140713_INTL/nav2_sale.jpg&quot; width=&quot;105&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n									&lt;td&gt;&lt;a href=&quot;https://email.mrporter.com/pub/cc?_ri_=X0Gzc2X%3DWQpglLjHJlYQGsw5kzfzc8qW0bpJNGzgSu4PKqGzfuABzazcXzfsnVXtpKX%3DCCBUA&amp;amp;_ei_=Ej0gXptnOqCiPFxGE5mURiykBFg-9BrnTD9ZgXjybWIw1NU-wIMzGoEpThBPH7-sDc6sZaf8YlhxLrW5n-U1HlkAADAJOhsf2DPj9ms_kU8cVOTT0BN-H6mOIzt83bauQ07_DaFx.&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;Clothing&quot; border=&quot;0&quot; height=&quot;31&quot; src=&quot;https://responsys.hs.llnwd.net/i5/responsysimages/mrporter/Trend_Q3_2013/Trend_140713_INTL/nav3_sale.jpg&quot; width=&quot;102&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n									&lt;td&gt;&lt;a href=&quot;https://email.mrporter.com/pub/cc?_ri_=X0Gzc2X%3DWQpglLjHJlYQGsw5kzfzc8qW0bpJNGzgSu4PKqGzfuABzazcXzfsnVXtpKX%3DCCBUB&amp;amp;_ei_=Ej0gXptnOqCiPFxGE5mURiykBFg-9BrnTD9ZgXjybWIw1NU-wIMzGoEpThBPH7-sDc6sZaf8YlhxLrW5n-U1HlkAADAJOhsf2DPj9ms_kU8cVOTT0BN-H6mOIzt83bauQ07_DaFx.&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;Shoes&quot; border=&quot;0&quot; height=&quot;31&quot; src=&quot;https://responsys.hs.llnwd.net/i5/responsysimages/mrporter/Trend_Q3_2013/Trend_140713_INTL/nav4_sale.jpg&quot; width=&quot;80&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n									&lt;td&gt;&lt;a href=&quot;https://email.mrporter.com/pub/cc?_ri_=X0Gzc2X%3DWQpglLjHJlYQGsw5kzfzc8qW0bpJNGzgSu4PKqGzfuABzazcXzfsnVXtpKX%3DCCBUC&amp;amp;_ei_=Ej0gXptnOqCiPFxGE5mURiykBFg-9BrnTD9ZgXjybWIw1NU-wIMzGoEpThBPH7-sDc6sZaf8YlhxLrW5n-U1HlkAADAJOhsf2DPj9ms_kU8cVOTT0BN-H6mOIzt83bauQ07_DaFx.&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;Home &amp;amp; Tech&quot; border=&quot;0&quot; height=&quot;31&quot; src=&quot;https://responsys.hs.llnwd.net/i5/responsysimages/mrporter/Trend_Q3_2013/Trend_140713_INTL/nav5_sale.jpg&quot; width=&quot;137&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n									&lt;td&gt;&lt;a href=&quot;https://email.mrporter.com/pub/cc?_ri_=X0Gzc2X%3DWQpglLjHJlYQGsw5kzfzc8qW0bpJNGzgSu4PKqGzfuABzazcXzfsnVXtpKX%3DCCBUS&amp;amp;_ei_=Ej0gXptnOqCiPFxGE5mURiykBFg-9BrnTD9ZgXjybWIw1NU-wIMzGoEpThBPH7-sDc6sZaf8YlhxLrW5n-U1HlkAADAJOhsf2DPj9ms_kU8cVOTT0BN-H6mOIzt83bauQ07_DaFx.&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;SALE&quot; border=&quot;0&quot; height=&quot;31&quot; src=&quot;https://responsys.hs.llnwd.net/i5/responsysimages/mrporter/Trend_Q3_2013/Trend_140713_INTL/nav6_sale.jpg&quot; width=&quot;152&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n								&lt;/tr&gt;\r\n							&lt;/tbody&gt;\r\n						&lt;/table&gt;\r\n						&lt;/td&gt;\r\n					&lt;/tr&gt;\r\n					&lt;tr&gt;\r\n						&lt;td&gt;&lt;a href=&quot;https://email.mrporter.com/pub/cc?_ri_=X0Gzc2X%3DWQpglLjHJlYQGsw5kzfzc8qW0bpJNGzgSu4PKqGzfuABzazcXzfsnVXtpKX%3DCCBUU&amp;amp;_ei_=Ej0gXptnOqCiPFxGE5mURiykBFg-9BrnTD9ZgXjybWIw1NU-wIMzGoEpThBPH7-sDc6sZaf8YlhxLrW5n-U1HlkAADAJOhsf2DPj9ms_kU8cVOTT0BN-H6mOIzt83bauQ07_DaFx.&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;THE TREND&quot; border=&quot;0&quot; height=&quot;56&quot; src=&quot;https://responsys.hs.llnwd.net/i5/responsysimages/mrporter/Trend_Q3_2013/Trend_140713_INTL/logo_bottom.jpg&quot; style=&quot;display:block&quot; width=&quot;735&quot; /&gt; &lt;/a&gt;&lt;/td&gt;\r\n					&lt;/tr&gt;\r\n					&lt;tr&gt;\r\n						&lt;td align=&quot;center&quot; width=&quot;735&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n					&lt;/tr&gt;\r\n					&lt;tr&gt;\r\n						&lt;td&gt;&lt;a href=&quot;https://email.mrporter.com/pub/cc?_ri_=X0Gzc2X%3DWQpglLjHJlYQGsw5kzfzc8qW0bpJNGzgSu4PKqGzfuABzazcXzfsnVXtpKX%3DCCBUU&amp;amp;_ei_=Ej0gXptnOqCiPFxGE5mURiykBFg-9BrnTD9ZgXjybWIw1NU-wIMzGoEpThBPH7-sDc6sZaf8YlhxLrW5n-U1HlkAADAJOhsf2DPj9ms_kU8cVOTT0BN-H6mOIzt83bauQ07_DaFx.&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;Alfresco Dressing: Look smart in the sun. Shop now&quot; border=&quot;0&quot; height=&quot;320&quot; src=&quot;https://responsys.hs.llnwd.net/i5/responsysimages/mrporter/Trend_Q3_2013/Trend_140713_INTL/hero_topnew.jpg&quot; style=&quot;display:block&quot; width=&quot;735&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n					&lt;/tr&gt;\r\n					&lt;tr&gt;\r\n						&lt;td&gt;&lt;a href=&quot;https://email.mrporter.com/pub/cc?_ri_=X0Gzc2X%3DWQpglLjHJlYQGsw5kzfzc8qW0bpJNGzgSu4PKqGzfuABzazcXzfsnVXtpKX%3DCCBUU&amp;amp;_ei_=Ej0gXptnOqCiPFxGE5mURiykBFg-9BrnTD9ZgXjybWIw1NU-wIMzGoEpThBPH7-sDc6sZaf8YlhxLrW5n-U1HlkAADAJOhsf2DPj9ms_kU8cVOTT0BN-H6mOIzt83bauQ07_DaFx.&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;&quot; border=&quot;0&quot; height=&quot;307&quot; src=&quot;https://responsys.hs.llnwd.net/i5/responsysimages/mrporter/Trend_Q3_2013/Trend_140713_INTL/hero_bottomnew.jpg&quot; style=&quot;display:block&quot; width=&quot;735&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n					&lt;/tr&gt;\r\n					&lt;tr&gt;\r\n						&lt;td&gt;\r\n						&lt;table align=&quot;center&quot; border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; width=&quot;735&quot;&gt;\r\n							&lt;tbody&gt;\r\n								&lt;tr&gt;\r\n									&lt;td&gt;&lt;a href=&quot;https://email.mrporter.com/pub/cc?_ri_=X0Gzc2X%3DWQpglLjHJlYQGsw5kzfzc8qW0bpJNGzgSu4PKqGzfuABzazcXzfsnVXtpKX%3DCCBUD&amp;amp;_ei_=Ej0gXptnOqCiPFxGE5mURiykBFg-9BrnTD9ZgXjybWIw1NU-wIMzGoEpThBPH7-sDc6sZaf8YlhxLrW5n-U1HlkAADAJOhsf2DPj9ms_kU8cVOTT0BN-H6mOIzt83bauQ07_DaFx.&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;Hat by Borsalino&quot; border=&quot;0&quot; height=&quot;45&quot; src=&quot;https://responsys.hs.llnwd.net/i5/responsysimages/mrporter/Trend_Q3_2013/Trend_140713_INTL/credit1.jpg&quot; style=&quot;display:block&quot; width=&quot;197&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n									&lt;td&gt;&lt;a href=&quot;https://email.mrporter.com/pub/cc?_ri_=X0Gzc2X%3DWQpglLjHJlYQGsw5kzfzc8qW0bpJNGzgSu4PKqGzfuABzazcXzfsnVXtpKX%3DCCBWR&amp;amp;_ei_=Ej0gXptnOqCiPFxGE5mURiykBFg-9BrnTD9ZgXjybWIw1NU-wIMzGoEpThBPH7-sDc6sZaf8YlhxLrW5n-U1HlkAADAJOhsf2DPj9ms_kU8cVOTT0BN-H6mOIzt83bauQ07_DaFx.&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;Sunglasses by Illesteva&quot; border=&quot;0&quot; height=&quot;45&quot; src=&quot;https://responsys.hs.llnwd.net/i5/responsysimages/mrporter/Trend_Q3_2013/Trend_140713_INTL/credit2.jpg&quot; style=&quot;display:block&quot; width=&quot;127&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n									&lt;td&gt;&lt;a href=&quot;https://email.mrporter.com/pub/cc?_ri_=X0Gzc2X%3DWQpglLjHJlYQGsw5kzfzc8qW0bpJNGzgSu4PKqGzfuABzazcXzfsnVXtpKX%3DCCBWS&amp;amp;_ei_=Ej0gXptnOqCiPFxGE5mURiykBFg-9BrnTD9ZgXjybWIw1NU-wIMzGoEpThBPH7-sDc6sZaf8YlhxLrW5n-U1HlkAADAJOhsf2DPj9ms_kU8cVOTT0BN-H6mOIzt83bauQ07_DaFx.&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;Flower Pin by Lanvin&quot; border=&quot;0&quot; height=&quot;45&quot; src=&quot;https://responsys.hs.llnwd.net/i5/responsysimages/mrporter/Trend_Q3_2013/Trend_140713_INTL/credit3.jpg&quot; style=&quot;display:block&quot; width=&quot;117&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n									&lt;td&gt;&lt;a href=&quot;https://email.mrporter.com/pub/cc?_ri_=X0Gzc2X%3DWQpglLjHJlYQGsw5kzfzc8qW0bpJNGzgSu4PKqGzfuABzazcXzfsnVXtpKX%3DCCBWT&amp;amp;_ei_=Ej0gXptnOqCiPFxGE5mURiykBFg-9BrnTD9ZgXjybWIw1NU-wIMzGoEpThBPH7-sDc6sZaf8YlhxLrW5n-U1HlkAADAJOhsf2DPj9ms_kU8cVOTT0BN-H6mOIzt83bauQ07_DaFx.&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;Shirt by Brioni&quot; border=&quot;0&quot; height=&quot;45&quot; src=&quot;https://responsys.hs.llnwd.net/i5/responsysimages/mrporter/Trend_Q3_2013/Trend_140713_INTL/credit4.jpg&quot; style=&quot;display:block&quot; width=&quot;87&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n									&lt;td&gt;&lt;a href=&quot;https://email.mrporter.com/pub/cc?_ri_=X0Gzc2X%3DWQpglLjHJlYQGsw5kzfzc8qW0bpJNGzgSu4PKqGzfuABzazcXzfsnVXtpKX%3DCCBWU&amp;amp;_ei_=Ej0gXptnOqCiPFxGE5mURiykBFg-9BrnTD9ZgXjybWIw1NU-wIMzGoEpThBPH7-sDc6sZaf8YlhxLrW5n-U1HlkAADAJOhsf2DPj9ms_kU8cVOTT0BN-H6mOIzt83bauQ07_DaFx.&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;Brogues by Grenson&quot; border=&quot;0&quot; height=&quot;45&quot; src=&quot;https://responsys.hs.llnwd.net/i5/responsysimages/mrporter/Trend_Q3_2013/Trend_140713_INTL/credit5.jpg&quot; style=&quot;display:block&quot; width=&quot;207&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n								&lt;/tr&gt;\r\n							&lt;/tbody&gt;\r\n						&lt;/table&gt;\r\n						&lt;/td&gt;\r\n					&lt;/tr&gt;\r\n					&lt;tr&gt;\r\n						&lt;td&gt;&lt;a href=&quot;https://email.mrporter.com/pub/cc?_ri_=X0Gzc2X%3DWQpglLjHJlYQGsw5kzfzc8qW0bpJNGzgSu4PKqGzfuABzazcXzfsnVXtpKX%3DCCBUU&amp;amp;_ei_=Ej0gXptnOqCiPFxGE5mURiykBFg-9BrnTD9ZgXjybWIw1NU-wIMzGoEpThBPH7-sDc6sZaf8YlhxLrW5n-U1HlkAADAJOhsf2DPj9ms_kU8cVOTT0BN-H6mOIzt83bauQ07_DaFx.&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;Editors'' Picks&quot; border=&quot;0&quot; height=&quot;50&quot; src=&quot;https://responsys.hs.llnwd.net/i5/responsysimages/mrporter/Trend_Q3_2013/Trend_140713_INTL/epsn.jpg&quot; style=&quot;display:block&quot; width=&quot;735&quot; /&gt; &lt;/a&gt;&lt;/td&gt;\r\n					&lt;/tr&gt;\r\n					&lt;tr&gt;\r\n						&lt;td&gt;\r\n						&lt;table border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; width=&quot;735&quot;&gt;\r\n							&lt;tbody&gt;\r\n								&lt;tr&gt;\r\n									&lt;td width=&quot;265&quot;&gt;&lt;a href=&quot;https://email.mrporter.com/pub/cc?_ri_=X0Gzc2X%3DWQpglLjHJlYQGsw5kzfzc8qW0bpJNGzgSu4PKqGzfuABzazcXzfsnVXtpKX%3DCCBWW&amp;amp;_ei_=Ej0gXptnOqCiPFxGE5mURiykBFg-9BrnTD9ZgXjybWIw1NU-wIMzGoEpThBPH7-sDc6sZaf8YlhxLrW5n-U1HlkAADAJOhsf2DPj9ms_kU8cVOTT0BN-H6mOIzt83bauQ07_DaFx.&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;LONDON COLLECTIONS: MEN. Agi &amp;amp; Sam Slim-Fit Hound''s-tooth Check Wool Blazer&quot; border=&quot;0&quot; height=&quot;363&quot; src=&quot;https://responsys.hs.llnwd.net/i5/responsysimages/mrporter/Trend_Q3_2013/Trend_140713_INTL/pid1n.jpg&quot; style=&quot;display:block&quot; width=&quot;265&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n									&lt;td width=&quot;205&quot;&gt;&lt;a href=&quot;https://email.mrporter.com/pub/cc?_ri_=X0Gzc2X%3DWQpglLjHJlYQGsw5kzfzc8qW0bpJNGzgSu4PKqGzfuABzazcXzfsnVXtpKX%3DCCBWY&amp;amp;_ei_=Ej0gXptnOqCiPFxGE5mURiykBFg-9BrnTD9ZgXjybWIw1NU-wIMzGoEpThBPH7-sDc6sZaf8YlhxLrW5n-U1HlkAADAJOhsf2DPj9ms_kU8cVOTT0BN-H6mOIzt83bauQ07_DaFx.&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;HARTFORD Linen Shirt&quot; border=&quot;0&quot; height=&quot;363&quot; src=&quot;https://responsys.hs.llnwd.net/i5/responsysimages/mrporter/Trend_Q3_2013/Trend_140713_INTL/pid2.jpg&quot; style=&quot;display:block&quot; width=&quot;205&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n									&lt;td width=&quot;265&quot;&gt;&lt;a href=&quot;https://email.mrporter.com/pub/cc?_ri_=X0Gzc2X%3DWQpglLjHJlYQGsw5kzfzc8qW0bpJNGzgSu4PKqGzfuABzazcXzfsnVXtpKX%3DCCBWA&amp;amp;_ei_=Ej0gXptnOqCiPFxGE5mURiykBFg-9BrnTD9ZgXjybWIw1NU-wIMzGoEpThBPH7-sDc6sZaf8YlhxLrW5n-U1HlkAADAJOhsf2DPj9ms_kU8cVOTT0BN-H6mOIzt83bauQ07_DaFx.&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;SUNSPEL Riviera Cotton-Mesh Polo Shirt&quot; border=&quot;0&quot; height=&quot;363&quot; src=&quot;https://responsys.hs.llnwd.net/i5/responsysimages/mrporter/Trend_Q3_2013/Trend_140713_INTL/pid3.jpg&quot; style=&quot;display:block&quot; width=&quot;265&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n								&lt;/tr&gt;\r\n								&lt;tr&gt;\r\n									&lt;td width=&quot;265&quot;&gt;&lt;a href=&quot;https://email.mrporter.com/pub/cc?_ri_=X0Gzc2X%3DWQpglLjHJlYQGsw5kzfzc8qW0bpJNGzgSu4PKqGzfuABzazcXzfsnVXtpKX%3DCCBWB&amp;amp;_ei_=Ej0gXptnOqCiPFxGE5mURiykBFg-9BrnTD9ZgXjybWIw1NU-wIMzGoEpThBPH7-sDc6sZaf8YlhxLrW5n-U1HlkAADAJOhsf2DPj9ms_kU8cVOTT0BN-H6mOIzt83bauQ07_DaFx.&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;SULKA Circle-Print Silk Tie&quot; border=&quot;0&quot; height=&quot;359&quot; src=&quot;https://responsys.hs.llnwd.net/i5/responsysimages/mrporter/Trend_Q3_2013/Trend_140713_INTL/pid4.jpg&quot; style=&quot;display:block&quot; width=&quot;265&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n									&lt;td width=&quot;205&quot;&gt;&lt;a href=&quot;https://email.mrporter.com/pub/cc?_ri_=X0Gzc2X%3DWQpglLjHJlYQGsw5kzfzc8qW0bpJNGzgSu4PKqGzfuABzazcXzfsnVXtpKX%3DCCBWC&amp;amp;_ei_=Ej0gXptnOqCiPFxGE5mURiykBFg-9BrnTD9ZgXjybWIw1NU-wIMzGoEpThBPH7-sDc6sZaf8YlhxLrW5n-U1HlkAADAJOhsf2DPj9ms_kU8cVOTT0BN-H6mOIzt83bauQ07_DaFx.&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;J.CREW 9 Inch Stanton Cotton-Twill Shorts&quot; border=&quot;0&quot; height=&quot;359&quot; src=&quot;https://responsys.hs.llnwd.net/i5/responsysimages/mrporter/Trend_Q3_2013/Trend_140713_INTL/pid5.jpg&quot; style=&quot;display:block&quot; width=&quot;205&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n									&lt;td width=&quot;265&quot;&gt;&lt;a href=&quot;https://email.mrporter.com/pub/cc?_ri_=X0Gzc2X%3DWQpglLjHJlYQGsw5kzfzc8qW0bpJNGzgSu4PKqGzfuABzazcXzfsnVXtpKX%3DCCBWD&amp;amp;_ei_=Ej0gXptnOqCiPFxGE5mURiykBFg-9BrnTD9ZgXjybWIw1NU-wIMzGoEpThBPH7-sDc6sZaf8YlhxLrW5n-U1HlkAADAJOhsf2DPj9ms_kU8cVOTT0BN-H6mOIzt83bauQ07_DaFx.&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;SLOWEAR Incotex Four Season Slim-Fit Cotton-Blend Chinos&quot; border=&quot;0&quot; height=&quot;359&quot; src=&quot;https://responsys.hs.llnwd.net/i5/responsysimages/mrporter/Trend_Q3_2013/Trend_140713_INTL/pid6.jpg&quot; style=&quot;display:block&quot; width=&quot;265&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n								&lt;/tr&gt;\r\n								&lt;tr&gt;\r\n									&lt;td width=&quot;265&quot;&gt;&lt;a href=&quot;https://email.mrporter.com/pub/cc?_ri_=X0Gzc2X%3DWQpglLjHJlYQGsw5kzfzc8qW0bpJNGzgSu4PKqGzfuABzazcXzfsnVXtpKX%3DCCBYR&amp;amp;_ei_=Ej0gXptnOqCiPFxGE5mURiykBFg-9BrnTD9ZgXjybWIw1NU-wIMzGoEpThBPH7-sDc6sZaf8YlhxLrW5n-U1HlkAADAJOhsf2DPj9ms_kU8cVOTT0BN-H6mOIzt83bauQ07_DaFx.&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;GUCCI Ragona Suede Derby Shoes&quot; border=&quot;0&quot; height=&quot;317&quot; src=&quot;https://responsys.hs.llnwd.net/i5/responsysimages/mrporter/Trend_Q3_2013/Trend_140713_INTL/pid7.jpg&quot; style=&quot;display:block&quot; width=&quot;265&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n									&lt;td width=&quot;205&quot;&gt;&lt;a href=&quot;https://email.mrporter.com/pub/cc?_ri_=X0Gzc2X%3DWQpglLjHJlYQGsw5kzfzc8qW0bpJNGzgSu4PKqGzfuABzazcXzfsnVXtpKX%3DCCBYS&amp;amp;_ei_=Ej0gXptnOqCiPFxGE5mURiykBFg-9BrnTD9ZgXjybWIw1NU-wIMzGoEpThBPH7-sDc6sZaf8YlhxLrW5n-U1HlkAADAJOhsf2DPj9ms_kU8cVOTT0BN-H6mOIzt83bauQ07_DaFx.&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;RAY-BAN Clubmaster Two-Tone Sunglasses&quot; border=&quot;0&quot; height=&quot;317&quot; src=&quot;https://responsys.hs.llnwd.net/i5/responsysimages/mrporter/Trend_Q3_2013/Trend_140713_INTL/pid8.jpg&quot; style=&quot;display:block&quot; width=&quot;205&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n									&lt;td width=&quot;265&quot;&gt;&lt;a href=&quot;https://email.mrporter.com/pub/cc?_ri_=X0Gzc2X%3DWQpglLjHJlYQGsw5kzfzc8qW0bpJNGzgSu4PKqGzfuABzazcXzfsnVXtpKX%3DCCBYT&amp;amp;_ei_=Ej0gXptnOqCiPFxGE5mURiykBFg-9BrnTD9ZgXjybWIw1NU-wIMzGoEpThBPH7-sDc6sZaf8YlhxLrW5n-U1HlkAADAJOhsf2DPj9ms_kU8cVOTT0BN-H6mOIzt83bauQ07_DaFx.&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;RIVIERAS Cotton Slip-On Shoes&quot; border=&quot;0&quot; height=&quot;317&quot; src=&quot;https://responsys.hs.llnwd.net/i5/responsysimages/mrporter/Trend_Q3_2013/Trend_140713_INTL/pid9.jpg&quot; style=&quot;display:block&quot; width=&quot;265&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n								&lt;/tr&gt;\r\n							&lt;/tbody&gt;\r\n						&lt;/table&gt;\r\n						&lt;/td&gt;\r\n					&lt;/tr&gt;\r\n					&lt;tr&gt;\r\n						&lt;td&gt;\r\n						&lt;table align=&quot;center&quot; border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; width=&quot;735&quot;&gt;\r\n							&lt;tbody&gt;\r\n								&lt;tr&gt;\r\n									&lt;td&gt;&lt;a href=&quot;https://email.mrporter.com/pub/cc?_ri_=X0Gzc2X%3DWQpglLjHJlYQGsw5kzfzc8qW0bpJNGzgSu4PKqGzfuABzazcXzfsnVXtpKX%3DCCBYU&amp;amp;_ei_=Ej0gXptnOqCiPFxGE5mURiykBFg-9BrnTD9ZgXjybWIw1NU-wIMzGoEpThBPH7-sDc6sZaf8YlhxLrW5n-U1HlkAADAJOhsf2DPj9ms_kU8cVOTT0BN-H6mOIzt83bauQ07_DaFx.&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;MR PORTER Sale - Now up to 70% Off. Shop now&quot; border=&quot;0&quot; height=&quot;239&quot; src=&quot;https://responsys.hs.llnwd.net/i5/responsysimages/mrporter/Trend_Q3_2013/Trend_140713_INTL/promo_sale.jpg&quot; style=&quot;display:block&quot; width=&quot;735&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n								&lt;/tr&gt;\r\n							&lt;/tbody&gt;\r\n						&lt;/table&gt;\r\n						&lt;/td&gt;\r\n					&lt;/tr&gt;\r\n					&lt;tr&gt;\r\n						&lt;td&gt;&lt;img alt=&quot;Follow Us&quot; border=&quot;0&quot; height=&quot;38&quot; src=&quot;https://responsys.hs.llnwd.net/i5/responsysimages/mrporter/Trend_Q3_2013/Trend_140713_INTL/follow_us.jpg&quot; style=&quot;display:block&quot; width=&quot;735&quot; /&gt;&lt;/td&gt;\r\n					&lt;/tr&gt;\r\n					&lt;tr&gt;\r\n						&lt;td&gt;\r\n						&lt;table border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; width=&quot;735&quot;&gt;\r\n							&lt;tbody&gt;\r\n								&lt;tr&gt;\r\n									&lt;td&gt;&lt;img alt=&quot;&quot; border=&quot;0&quot; height=&quot;36&quot; src=&quot;https://responsys.hs.llnwd.net/i5/responsysimages/mrporter/Trend_Q3_2013/Trend_140713_INTL/footer_left.jpg&quot; style=&quot;display:block&quot; width=&quot;287&quot; /&gt;&lt;/td&gt;\r\n									&lt;td&gt;&lt;a href=&quot;https://email.mrporter.com/pub/cc?_ri_=X0Gzc2X%3DWQpglLjHJlYQGsw5kzfzc8qW0bpJNGzgSu4PKqGzfuABzazcXzfsnVXtpKX%3DCCBYW&amp;amp;_ei_=Ej0gXptnOqCiPFxGE5mURiykBFg-9BrnTD9ZgXjybWIw1NU-wIMzGoEpThBPH7-sDc6sZaf8YlhxLrW5n-U1HllMWeVW5nwukdt91KsWeEzO999VbsAn3ME.&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;Facebook&quot; border=&quot;0&quot; height=&quot;36&quot; src=&quot;https://responsys.hs.llnwd.net/i5/responsysimages/mrporter/Trend_Q3_2013/Trend_140713_INTL/facebook_new.jpg&quot; width=&quot;25&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n									&lt;td&gt;&lt;a href=&quot;https://email.mrporter.com/pub/cc?_ri_=X0Gzc2X%3DWQpglLjHJlYQGsw5kzfzc8qW0bpJNGzgSu4PKqGzfuABzazcXzfsnVXtpKX%3DCCBYY&amp;amp;_ei_=Ej0gXptnOqCiPFxGE5mURiykBFg-9BrnTD9ZgXjybWIw1NU-wIMzGoEpThBPH7-sDc6sZaf8YlhxLrW5n-U1HllMWeVW5nwukdt91KsWeEzO999VbsAn3ME.&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;Twitter&quot; border=&quot;0&quot; height=&quot;36&quot; src=&quot;https://responsys.hs.llnwd.net/i5/responsysimages/mrporter/Trend_Q3_2013/Trend_140713_INTL/twitter_new.jpg&quot; width=&quot;25&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n									&lt;td&gt;&lt;a href=&quot;https://email.mrporter.com/pub/cc?_ri_=X0Gzc2X%3DWQpglLjHJlYQGsw5kzfzc8qW0bpJNGzgSu4PKqGzfuABzazcXzfsnVXtpKX%3DCCBYA&amp;amp;_ei_=Ej0gXptnOqCiPFxGE5mURiykBFg-9BrnTD9ZgXjybWIw1NU-wIMzGoEpThBPH7-sDc6sZaf8YlhxLrW5n-U1HllMWeVW5nwukdt91KsWeEzO999VbsAn3ME.&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;YouTube&quot; border=&quot;0&quot; height=&quot;36&quot; src=&quot;https://responsys.hs.llnwd.net/i5/responsysimages/mrporter/Trend_Q3_2013/Trend_140713_INTL/youtube_new.jpg&quot; width=&quot;25&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n									&lt;td&gt;&lt;a href=&quot;https://email.mrporter.com/pub/cc?_ri_=X0Gzc2X%3DWQpglLjHJlYQGsw5kzfzc8qW0bpJNGzgSu4PKqGzfuABzazcXzfsnVXtpKX%3DCCBYB&amp;amp;_ei_=Ej0gXptnOqCiPFxGE5mURiykBFg-9BrnTD9ZgXjybWIw1NU-wIMzGoEpThBPH7-sDc6sZaf8YlhxLrW5n-U1HllMWeVW5nwukdt91KsWeEzO999VbsAn3ME.&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;Google+&quot; border=&quot;0&quot; height=&quot;36&quot; src=&quot;https://responsys.hs.llnwd.net/i5/responsysimages/mrporter/Trend_Q3_2013/Trend_140713_INTL/googleplus_new.jpg&quot; width=&quot;35&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n									&lt;td&gt;&lt;a href=&quot;https://email.mrporter.com/pub/cc?_ri_=X0Gzc2X%3DWQpglLjHJlYQGsw5kzfzc8qW0bpJNGzgSu4PKqGzfuABzazcXzfsnVXtpKX%3DCCBYC&amp;amp;_ei_=Ej0gXptnOqCiPFxGE5mURiykBFg-9BrnTD9ZgXjybWIw1NU-wIMzGoEpThBPH7-sDc6sZaf8YlhxLrW5n-U1HllMWeVW5nwukdt91KsWeEzO999VbsAn3ME.&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;Tumblr&quot; border=&quot;0&quot; height=&quot;36&quot; src=&quot;https://responsys.hs.llnwd.net/i5/responsysimages/mrporter/Trend_Q3_2013/Trend_140713_INTL/tumblr_new.jpg&quot; width=&quot;28&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n									&lt;td&gt;&lt;a href=&quot;https://email.mrporter.com/pub/cc?_ri_=X0Gzc2X%3DWQpglLjHJlYQGsw5kzfzc8qW0bpJNGzgSu4PKqGzfuABzazcXzfsnVXtpKX%3DCCBYD&amp;amp;_ei_=Ej0gXptnOqCiPFxGE5mURiykBFg-9BrnTD9ZgXjybWIw1NU-wIMzGoEpThBPH7-sDc6sZaf8YlhxLrW5n-U1HllMWeVW5nwukdt91KsWeEzO999VbsAn3ME.&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;Instagram&quot; border=&quot;0&quot; height=&quot;36&quot; src=&quot;https://responsys.hs.llnwd.net/i5/responsysimages/mrporter/Trend_Q3_2013/Trend_140713_INTL/instagram_new.jpg&quot; width=&quot;26&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n									&lt;td&gt;&lt;img alt=&quot;&quot; border=&quot;0&quot; height=&quot;36&quot; src=&quot;https://responsys.hs.llnwd.net/i5/responsysimages/mrporter/Trend_Q3_2013/Trend_140713_INTL/footer_right.jpg&quot; style=&quot;display:block&quot; width=&quot;284&quot; /&gt;&lt;/td&gt;\r\n								&lt;/tr&gt;\r\n							&lt;/tbody&gt;\r\n						&lt;/table&gt;\r\n\r\n						&lt;table border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; width=&quot;735&quot;&gt;\r\n							&lt;tbody&gt;\r\n								&lt;tr&gt;\r\n									&lt;td&gt;&lt;a href=&quot;https://email.mrporter.com/pub/cc?_ri_=X0Gzc2X%3DWQpglLjHJlYQGsw5kzfzc8qW0bpJNGzgSu4PKqGzfuABzazcXzfsnVXtpKX%3DCCBAR&amp;amp;_ei_=Ej0gXptnOqCiPFxGE5mURiykBFg-9BrnTD9ZgXjybWIw1NU-wIMzGoEpThBPH7-sDc6sZaf8YlhxLrW5n-U1HlkAADAJOhsf2DPj9ms_kU8cVOTT0BN-H6mOIzt83bauQ07_DaFx.&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;Shipping Options: Next day and same day services available&quot; border=&quot;0&quot; height=&quot;175&quot; src=&quot;https://responsys.hs.llnwd.net/i5/responsysimages/mrporter/Trend_Q3_2013/Trend_140713_INTL/shipping.jpg&quot; width=&quot;257&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n									&lt;td&gt;&lt;a href=&quot;https://email.mrporter.com/pub/cc?_ri_=X0Gzc2X%3DWQpglLjHJlYQGsw5kzfzc8qW0bpJNGzgSu4PKqGzfuABzazcXzfsnVXtpKX%3DCCBAS&amp;amp;_ei_=Ej0gXptnOqCiPFxGE5mURiykBFg-9BrnTD9ZgXjybWIw1NU-wIMzGoEpThBPH7-sDc6sZaf8YlhxLrW5n-U1HlkAADAJOhsf2DPj9ms_kU8cVOTT0BN-H6mOIzt83bauQ07_DaFx.&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;Customer Care: We''re on hand 24 hours a day, seven days a week&quot; border=&quot;0&quot; height=&quot;175&quot; src=&quot;https://responsys.hs.llnwd.net/i5/responsysimages/mrporter/Trend_Q3_2013/Trend_140713_INTL/customer_care.jpg&quot; width=&quot;212&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n									&lt;td&gt;&lt;a href=&quot;https://email.mrporter.com/pub/cc?_ri_=X0Gzc2X%3DWQpglLjHJlYQGsw5kzfzc8qW0bpJNGzgSu4PKqGzfuABzazcXzfsnVXtpKX%3DCCBAT&amp;amp;_ei_=Ej0gXptnOqCiPFxGE5mURiykBFg-9BrnTD9ZgXjybWIw1NU-wIMzGoEpThBPH7-sDc6sZaf8YlhxLrW5n-U1HlkAADAJOhsf2DPj9ms_kU8cVOTT0BN-H6mOIzt83bauQ07_DaFx.&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;Returns Policy: Four-week return period and free collection service&quot; border=&quot;0&quot; height=&quot;175&quot; src=&quot;https://responsys.hs.llnwd.net/i5/responsysimages/mrporter/Trend_Q3_2013/Trend_140713_INTL/returns.jpg&quot; width=&quot;266&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n								&lt;/tr&gt;\r\n							&lt;/tbody&gt;\r\n						&lt;/table&gt;\r\n						&lt;/td&gt;\r\n					&lt;/tr&gt;\r\n					&lt;tr&gt;\r\n						&lt;td align=&quot;center&quot; style=&quot;font-family:Arial,Helvetica,sans-serif;font-size:11px;color:#7d7d7d;line-height:16px&quot; valign=&quot;top&quot;&gt;&lt;br /&gt;\r\n						&lt;br /&gt;\r\n						The sale is only open to customers that are registered to and shopping from the international&lt;br /&gt;\r\n						website (UK, Europe, Africa, Asia, Middle East and Oceania).&lt;br /&gt;\r\n						&lt;br /&gt;\r\n						This email was sent to &lt;a href=&quot;mailto:welookvn@gmail.com&quot; target=&quot;_blank&quot;&gt;welookvn@gmail.com&lt;/a&gt;.&lt;br /&gt;\r\n						To ensure that our messages get to you (and don''t go to your junk or bulk email folders),&lt;br /&gt;\r\n						please add &lt;strong&gt;&lt;a href=&quot;mailto:news@email.mrporter.com&quot; target=&quot;_blank&quot;&gt;news@email.mrporter.com&lt;/a&gt;&lt;/strong&gt; to your address book.&lt;br /&gt;\r\n						&lt;br /&gt;\r\n						MR PORTER is a registered trademark of THE NET-A-PORTER GROUP LTD in the European Community.&lt;br /&gt;\r\n						Registered Office: 1 The Village Offices, Westfield, Ariel Way, London, W12 7GF.&lt;br /&gt;\r\n						VAT Registration number: 743 7967 86 Company registered in London, number: 3820604&lt;br /&gt;\r\n						&lt;br /&gt;\r\n						To&lt;strong&gt; unsubscribe&lt;/strong&gt; &lt;a href=&quot;https://email.mrporter.com/pub/cc?_ri_=X0Gzc2X%3DWQpglLjHJlYQGsw5kzfzc8qW0bpJNGzgSu4PKqGzfuABzazcXzfsnVXtpKX%3DCCBAU&amp;amp;_ei_=Ej0gXptnOqCiPFxGE5mURiykBFg-9BrnTD9ZgXjybWIw1NU-wIMzGoEpThBPH7-sDc6sZaf8YlhxLrW5n-U1HllMWeVW5nwukdt91KsWeEzO999VbsAn3ME.&quot; style=&quot;color:#7d7d7d&quot; target=&quot;_blank&quot;&gt;click here&lt;/a&gt;&lt;br /&gt;\r\n						To view our Privacy Policy &lt;a href=&quot;https://email.mrporter.com/pub/cc?_ri_=X0Gzc2X%3DWQpglLjHJlYQGsw5kzfzc8qW0bpJNGzgSu4PKqGzfuABzazcXzfsnVXtpKX%3DCCBAW&amp;amp;_ei_=Ej0gXptnOqCiPFxGE5mURiykBFg-9BrnTD9ZgXjybWIw1NU-wIMzGoEpThBPH7-sDc6sZaf8YlhxLrW5n-U1HlkAADAJOhsf2DPj9ms_kU8cVOTT0BN-H6mOIzt83bauQ07_DaFx.&quot; style=&quot;color:#7d7d7d&quot; target=&quot;_blank&quot;&gt;click here&lt;/a&gt;&lt;br /&gt;\r\n						&amp;nbsp;&lt;/td&gt;\r\n					&lt;/tr&gt;\r\n					&lt;tr&gt;\r\n						&lt;td&gt;&lt;img alt=&quot;MR PORTER.COM&quot; border=&quot;0&quot; height=&quot;40&quot; src=&quot;https://responsys.hs.llnwd.net/i5/responsysimages/mrporter/Trend_Q3_2013/Trend_140713_INTL/signature_new.jpg&quot; style=&quot;display:block&quot; width=&quot;735&quot; /&gt;&lt;/td&gt;\r\n					&lt;/tr&gt;\r\n				&lt;/tbody&gt;\r\n			&lt;/table&gt;\r\n			&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n	&lt;/tbody&gt;\r\n&lt;/table&gt;\r\n&lt;img alt=&quot;&quot; border=&quot;0&quot; height=&quot;1&quot; src=&quot;https://r.turn.com/r/beacon?b2=hWMgnlRjiKih90k2axLhjTv8klV9lec119qARtaUhYyfekhKYTtoQ1v2fBWLapFGB_TwMMwa0q0c2CrP16wRyQ&amp;amp;cid=&quot; style=&quot;display:block&quot; width=&quot;1&quot; /&gt;&lt;br /&gt;\r\n&lt;br /&gt;\r\n&lt;img border=&quot;0&quot; height=&quot;3&quot; src=&quot;https://email.mrporter.com/pub/as?_ri_=X0Gzc2X%3DWQpglLjHJlYQGsw5kzfzc8qW0bpJNGzgSu4PKqGzfuABzazcXzfsnVXHkMX%3Dw&amp;amp;_ei_=Ej0gXptnOqCiPFxGE5mURiykBFg-9BrnTD9ZgXjybWIw1NU-wIMzGoEpThBPH7-sDc6sZaf8YlhxLrW5n-U1HllMWeVW5nwukdt91KsWeEzO999VbsAn3ME.&quot; width=&quot;3&quot; /&gt;\r\n&lt;div class=&quot;yj6qo&quot;&gt;&amp;nbsp;&lt;/div&gt;\r\n\r\n&lt;div class=&quot;adL&quot;&gt;&amp;nbsp;&lt;/div&gt;\r\n&lt;/div&gt;\r\n', '', '');
INSERT INTO `news_description` (`news_id`, `language_id`, `name`, `short_description`, `description`, `meta_description`, `meta_keyword`) VALUES
(16, 2, 'ASOS - SALE 70% riêng mặt hàng phụ kiện, còn quần áo vẫn đang giảm giá mạnh các bạn nhé', '', '&lt;table border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; width=&quot;744&quot;&gt;\r\n	&lt;tbody&gt;\r\n		&lt;tr&gt;\r\n			&lt;td width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n			&lt;td align=&quot;center&quot;&gt;\r\n			&lt;table border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; width=&quot;728&quot;&gt;\r\n				&lt;tbody&gt;\r\n					&lt;tr&gt;\r\n						&lt;td align=&quot;left&quot; style=&quot;LINE-HEIGHT:12px;FONT-FAMILY:Arial;COLOR:#6f6f6f;FONT-SIZE:9px&quot;&gt;Bags, belts, sunglasses &amp;amp;... more. Much more&lt;br /&gt;\r\n						If you are unable to view this email please click &lt;a href=&quot;http://replylink.com/go.asp?/bASO001/mHEKBJ8U1/q5FKTJ8U1/u5WF3PVS1/xE7NH19U1/cutf%2D8&quot; style=&quot;COLOR:#001;TEXT-DECORATION:none&quot; target=&quot;_blank&quot;&gt;here&lt;/a&gt;&lt;/td&gt;\r\n					&lt;/tr&gt;\r\n					&lt;tr&gt;\r\n						&lt;td height=&quot;14&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n					&lt;/tr&gt;\r\n					&lt;tr&gt;\r\n						&lt;td&gt;\r\n						&lt;table border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; width=&quot;728&quot;&gt;\r\n							&lt;tbody&gt;\r\n								&lt;tr&gt;\r\n									&lt;td align=&quot;left&quot;&gt;\r\n									&lt;table align=&quot;left&quot; border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot;&gt;\r\n										&lt;tbody&gt;\r\n											&lt;tr&gt;\r\n												&lt;td width=&quot;191&quot;&gt;&lt;a href=&quot;http://replylink.com/go.asp?/bASO001/mHEKBJ8U1/qNX2BJ8U1/u5WF3PVS1/xE7NH19U1/cutf%2D8&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;ASOS Discover Fashion Online&quot; border=&quot;0&quot; height=&quot;61&quot; src=&quot;http://images.asos.com/newsletter/140713_MW_UK_IM_TEST/media/images/email/asos_logo1.jpg&quot; style=&quot;DISPLAY:block&quot; width=&quot;159&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n											&lt;/tr&gt;\r\n										&lt;/tbody&gt;\r\n									&lt;/table&gt;\r\n									&lt;/td&gt;\r\n								&lt;/tr&gt;\r\n								&lt;tr&gt;\r\n									&lt;td height=&quot;6&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n								&lt;/tr&gt;\r\n								&lt;tr&gt;\r\n									&lt;td height=&quot;29&quot; style=&quot;BORDER-BOTTOM:#000 1px solid&quot;&gt;\r\n									&lt;table border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; width=&quot;728&quot;&gt;\r\n										&lt;tbody&gt;\r\n											&lt;tr&gt;\r\n												&lt;td align=&quot;left&quot; valign=&quot;bottom&quot;&gt;\r\n												&lt;table border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot;&gt;\r\n													&lt;tbody&gt;\r\n														&lt;tr&gt;\r\n															&lt;td style=&quot;TEXT-TRANSFORM:uppercase;FONT-FAMILY:Georgia;FONT-SIZE:11px&quot;&gt;&lt;a href=&quot;http://replylink.com/go.asp?/bASO001/mHEKBJ8U1/qW6TKJ8U1/u5WF3PVS1/xE7NH19U1/cutf%2D8&quot; style=&quot;COLOR:#001;TEXT-DECORATION:none&quot; target=&quot;_blank&quot;&gt;new in&lt;/a&gt;&lt;/td&gt;\r\n															&lt;td width=&quot;10&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n															&lt;td style=&quot;FONT-SIZE:11px&quot;&gt;|&lt;/td&gt;\r\n															&lt;td width=&quot;10&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n															&lt;td style=&quot;TEXT-TRANSFORM:uppercase;FONT-FAMILY:Georgia;FONT-SIZE:11px&quot;&gt;&lt;a href=&quot;http://replylink.com/go.asp?/bASO001/mHEKBJ8U1/qEXB2J8U1/u5WF3PVS1/xE7NH19U1/cutf%2D8&quot; style=&quot;COLOR:#001;TEXT-DECORATION:none&quot; target=&quot;_blank&quot;&gt;JACKETS &amp;amp; COATS&lt;/a&gt;&lt;/td&gt;\r\n															&lt;td width=&quot;10&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n															&lt;td style=&quot;FONT-SIZE:11px&quot;&gt;|&lt;/td&gt;\r\n															&lt;td width=&quot;10&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n															&lt;td style=&quot;TEXT-TRANSFORM:uppercase;FONT-FAMILY:Georgia;FONT-SIZE:11px&quot;&gt;&lt;a href=&quot;http://replylink.com/go.asp?/bASO001/mHEKBJ8U1/qN62KJ8U1/u5WF3PVS1/xE7NH19U1/cutf%2D8&quot; style=&quot;COLOR:#001;TEXT-DECORATION:none&quot; target=&quot;_blank&quot;&gt;JEANS&lt;/a&gt;&lt;/td&gt;\r\n															&lt;td width=&quot;10&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n															&lt;td style=&quot;FONT-SIZE:11px&quot;&gt;|&lt;/td&gt;\r\n															&lt;td width=&quot;10&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n															&lt;td style=&quot;TEXT-TRANSFORM:uppercase;FONT-FAMILY:Georgia;FONT-SIZE:11px&quot;&gt;&lt;a href=&quot;http://replylink.com/go.asp?/bASO001/mHEKBJ8U1/qWFKTJ8U1/u5WF3PVS1/xE7NH19U1/cutf%2D8&quot; style=&quot;COLOR:#001;TEXT-DECORATION:none&quot; target=&quot;_blank&quot;&gt;SHOES&lt;/a&gt;&lt;/td&gt;\r\n															&lt;td width=&quot;10&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n															&lt;td style=&quot;FONT-SIZE:11px&quot;&gt;|&lt;/td&gt;\r\n															&lt;td width=&quot;10&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n															&lt;td style=&quot;TEXT-TRANSFORM:uppercase;FONT-FAMILY:Georgia;FONT-SIZE:11px&quot;&gt;&lt;a href=&quot;http://replylink.com/go.asp?/bASO001/mHEKBJ8U1/qE6BBJ8U1/u5WF3PVS1/xE7NH19U1/cutf%2D8&quot; style=&quot;COLOR:#001;TEXT-DECORATION:none&quot; target=&quot;_blank&quot;&gt;ACCESSORIES&lt;/a&gt;&lt;/td&gt;\r\n															&lt;td width=&quot;10&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n															&lt;td style=&quot;FONT-SIZE:11px&quot;&gt;|&lt;/td&gt;\r\n															&lt;td width=&quot;10&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n															&lt;td style=&quot;TEXT-TRANSFORM:uppercase;FONT-FAMILY:Georgia;FONT-SIZE:11px&quot;&gt;&lt;a href=&quot;http://replylink.com/go.asp?/bASO001/mHEKBJ8U1/qNFTKJ8U1/u5WF3PVS1/xE7NH19U1/cutf%2D8&quot; style=&quot;COLOR:#001;TEXT-DECORATION:none&quot; target=&quot;_blank&quot;&gt;A-Z OF BRANDS&lt;/a&gt;&lt;/td&gt;\r\n															&lt;td width=&quot;10&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n															&lt;td style=&quot;FONT-SIZE:11px&quot;&gt;|&lt;/td&gt;\r\n															&lt;td width=&quot;10&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n															&lt;td style=&quot;TEXT-TRANSFORM:uppercase;FONT-FAMILY:Georgia;FONT-SIZE:11px&quot;&gt;&lt;a href=&quot;http://replylink.com/go.asp?/bASO001/mHEKBJ8U1/q56K2J8U1/u5WF3PVS1/xE7NH19U1/cutf%2D8&quot; style=&quot;COLOR:#001;TEXT-DECORATION:none&quot; target=&quot;_blank&quot;&gt;T-SHIRTS&lt;/a&gt;&lt;/td&gt;\r\n														&lt;/tr&gt;\r\n													&lt;/tbody&gt;\r\n												&lt;/table&gt;\r\n												&lt;/td&gt;\r\n												&lt;td&gt;&amp;nbsp;&lt;/td&gt;\r\n												&lt;td align=&quot;right&quot; valign=&quot;center&quot; width=&quot;24&quot;&gt;&lt;a href=&quot;http://replylink.com/go.asp?/bASO001/mHEKBJ8U1/qEF2KJ8U1/u5WF3PVS1/xE7NH19U1/cutf%2D8&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;facebook&quot; border=&quot;0&quot; height=&quot;20&quot; src=&quot;http://images.asos.com/newsletter/140713_MW_UK_IM_TEST/media/images/email/facebook_icon1.jpg&quot; style=&quot;DISPLAY:block&quot; width=&quot;20&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n												&lt;td align=&quot;right&quot; valign=&quot;center&quot; width=&quot;24&quot;&gt;&lt;a href=&quot;http://replylink.com/go.asp?/bASO001/mHEKBJ8U1/qNOKTJ8U1/u5WF3PVS1/xE7NH19U1/cutf%2D8&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;twitter&quot; border=&quot;0&quot; height=&quot;20&quot; src=&quot;http://images.asos.com/newsletter/140713_MW_UK_IM_TEST/media/images/email/twitter_icon1.jpg&quot; style=&quot;DISPLAY:block&quot; width=&quot;20&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n											&lt;/tr&gt;\r\n										&lt;/tbody&gt;\r\n									&lt;/table&gt;\r\n									&lt;/td&gt;\r\n								&lt;/tr&gt;\r\n							&lt;/tbody&gt;\r\n						&lt;/table&gt;\r\n						&lt;/td&gt;\r\n					&lt;/tr&gt;\r\n					&lt;tr&gt;\r\n						&lt;td height=&quot;0&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n					&lt;/tr&gt;\r\n					&lt;tr&gt;\r\n						&lt;td height=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n					&lt;/tr&gt;\r\n					&lt;tr&gt;\r\n						&lt;td&gt;&amp;nbsp;&lt;/td&gt;\r\n					&lt;/tr&gt;\r\n					&lt;tr&gt;\r\n						&lt;td&gt;\r\n						&lt;table border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; width=&quot;100%&quot;&gt;\r\n							&lt;tbody&gt;\r\n								&lt;tr&gt;\r\n									&lt;td bgcolor=&quot;#000000&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#000000&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#ea0101&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#ea0101&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#ea0101&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#ea0101&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#ea0101&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#ea0101&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#ea0101&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#ea0101&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#ea0101&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#ea0101&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#ea0101&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#ea0101&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#ea0101&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#cdcccc&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#cdcccc&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#cdcccc&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#cdcccc&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#cdcccc&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#cdcccc&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#cdcccc&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#cdcccc&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#cdcccc&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#cdcccc&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#cdcccc&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#cdcccc&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#cdcccc&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#000000&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#000000&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#000000&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#000000&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#000000&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#000000&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#000000&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#000000&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#000000&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#000000&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#000000&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#000000&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#000000&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#ea0101&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#ea0101&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#ea0101&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#ea0101&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#ea0101&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#ea0101&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#ea0101&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#ea0101&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#ea0101&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#ea0101&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#ea0101&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#ea0101&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#ea0101&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#cdcccc&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#cdcccc&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#cdcccc&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#cdcccc&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#cdcccc&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#cdcccc&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#cdcccc&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#cdcccc&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#cdcccc&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#cdcccc&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#cdcccc&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#cdcccc&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#cdcccc&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#000000&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#000000&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#000000&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#000000&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#000000&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#000000&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#000000&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#000000&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#000000&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#000000&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#000000&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#000000&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#ea0101&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#ea0101&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#ea0101&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#ea0101&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#ea0101&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#ea0101&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#ea0101&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#ea0101&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#ea0101&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#ea0101&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#ea0101&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#ea0101&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n								&lt;/tr&gt;\r\n								&lt;tr&gt;\r\n									&lt;td bgcolor=&quot;#cdcccc&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#cdcccc&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#cdcccc&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#cdcccc&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#cdcccc&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#cdcccc&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#cdcccc&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#cdcccc&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#cdcccc&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#cdcccc&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#cdcccc&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#cdcccc&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#cdcccc&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#000000&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#000000&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#000000&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#000000&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#000000&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#000000&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#000000&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#000000&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#000000&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#000000&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#000000&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#000000&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#ea0101&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#ea0101&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#ea0101&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#ea0101&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#ea0101&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#ea0101&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#ea0101&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#ea0101&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#ea0101&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#ea0101&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#ea0101&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#ea0101&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#cdcccc&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#cdcccc&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#cdcccc&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#cdcccc&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#cdcccc&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#cdcccc&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#cdcccc&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#cdcccc&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#cdcccc&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#cdcccc&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#cdcccc&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#cdcccc&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#cdcccc&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#cdcccc&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#000000&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#000000&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#000000&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#000000&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#000000&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#000000&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#000000&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#000000&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#000000&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#000000&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#000000&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#000000&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#ea0101&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#ea0101&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#ea0101&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#ea0101&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#ea0101&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#ea0101&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#ea0101&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#ea0101&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#ea0101&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#ea0101&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#ea0101&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#ea0101&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#cdcccc&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#cdcccc&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#cdcccc&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#cdcccc&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#cdcccc&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#cdcccc&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#cdcccc&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#cdcccc&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#cdcccc&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#cdcccc&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#cdcccc&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#cdcccc&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#cdcccc&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#cdcccc&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#000000&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#000000&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n								&lt;/tr&gt;\r\n							&lt;/tbody&gt;\r\n						&lt;/table&gt;\r\n						&lt;/td&gt;\r\n					&lt;/tr&gt;\r\n					&lt;tr&gt;\r\n						&lt;td height=&quot;16&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n					&lt;/tr&gt;\r\n					&lt;tr&gt;\r\n						&lt;td&gt;\r\n						&lt;table border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; width=&quot;728&quot;&gt;\r\n							&lt;tbody&gt;\r\n								&lt;tr&gt;\r\n									&lt;td&gt;\r\n									&lt;table bgcolor=&quot;#ffffff&quot; border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; width=&quot;360&quot;&gt;\r\n										&lt;tbody&gt;\r\n											&lt;tr&gt;\r\n												&lt;td align=&quot;center&quot; bgcolor=&quot;#ffffff&quot; colspan=&quot;1&quot; valign=&quot;center&quot; width=&quot;360&quot;&gt;\r\n												&lt;table border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot;&gt;\r\n													&lt;tbody&gt;\r\n														&lt;tr&gt;\r\n															&lt;td&gt;\r\n															&lt;table border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot;&gt;\r\n																&lt;tbody&gt;\r\n																	&lt;tr&gt;\r\n																		&lt;td height=&quot;7&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n																	&lt;/tr&gt;\r\n																	&lt;tr&gt;\r\n																		&lt;td align=&quot;center&quot; style=&quot;TEXT-ALIGN:center;LINE-HEIGHT:10px;TEXT-TRANSFORM:uppercase;FONT-FAMILY:Arial;LETTER-SPACING:2px;COLOR:#000001;FONT-SIZE:9px&quot;&gt;&lt;span style=&quot;COLOR:#000001&quot;&gt;&lt;a href=&quot;http://replylink.com/go.asp?/bASO001/mHEKBJ8U1/q5FBBJ8U1/u5WF3PVS1/xE7NH19U1/cutf%2D8&quot; style=&quot;COLOR:#000001;TEXT-DECORATION:none&quot; target=&quot;_blank&quot;&gt;&lt;font color=&quot;#000001&quot;&gt;it''s all in the details&lt;/font&gt;&lt;/a&gt;&lt;/span&gt;&lt;/td&gt;\r\n																	&lt;/tr&gt;\r\n																	&lt;tr&gt;\r\n																		&lt;td height=&quot;5&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n																	&lt;/tr&gt;\r\n																	&lt;tr&gt;\r\n																		&lt;td align=&quot;center&quot; style=&quot;TEXT-ALIGN:center;LINE-HEIGHT:36px;TEXT-TRANSFORM:uppercase;FONT-FAMILY:Arial Black,Arial;LETTER-SPACING:1px;COLOR:#000001;FONT-SIZE:30px;FONT-WEIGHT:900&quot; width=&quot;330&quot;&gt;&lt;a href=&quot;http://replylink.com/go.asp?/bASO001/mHEKBJ8U1/qEOTKJ8U1/u5WF3PVS1/xE7NH19U1/cutf%2D8&quot; style=&quot;COLOR:#000001;TEXT-DECORATION:none&quot; target=&quot;_blank&quot;&gt;up to 70% off accessories*&lt;/a&gt;&lt;/td&gt;\r\n																	&lt;/tr&gt;\r\n																	&lt;tr&gt;\r\n																		&lt;td height=&quot;5&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n																	&lt;/tr&gt;\r\n																	&lt;tr&gt;\r\n																		&lt;td align=&quot;center&quot; style=&quot;LINE-HEIGHT:15px;FONT-FAMILY:Arial;LETTER-SPACING:0.1pt!important;COLOR:#000001;FONT-SIZE:11px&quot; width=&quot;330&quot;&gt;&lt;a href=&quot;http://replylink.com/go.asp?/bASO001/mHEKBJ8U1/qW6K2J8U1/u5WF3PVS1/xE7NH19U1/cutf%2D8&quot; style=&quot;COLOR:#000001;TEXT-DECORATION:none&quot; target=&quot;_blank&quot;&gt;Upgrade your look for less by adding some powerful accessories into the mix, including the latest caps, sunglasses &amp;amp; backpacks&lt;/a&gt;&lt;/td&gt;\r\n																	&lt;/tr&gt;\r\n																	&lt;tr&gt;\r\n																		&lt;td height=&quot;10&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n																	&lt;/tr&gt;\r\n																	&lt;tr&gt;\r\n																		&lt;td align=&quot;center&quot;&gt;\r\n																		&lt;table align=&quot;center&quot; border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot;&gt;\r\n																			&lt;tbody&gt;\r\n																				&lt;tr&gt;\r\n																					&lt;td bgcolor=&quot;#000011&quot; height=&quot;3&quot; width=&quot;1&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n																					&lt;td bgcolor=&quot;#000011&quot; height=&quot;3&quot; width=&quot;2&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n																					&lt;td bgcolor=&quot;#000011&quot; height=&quot;3&quot; width=&quot;10&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n																					&lt;td bgcolor=&quot;#000011&quot; height=&quot;3&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n																					&lt;td bgcolor=&quot;#000011&quot; height=&quot;3&quot; width=&quot;10&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n																					&lt;td bgcolor=&quot;#000011&quot; height=&quot;3&quot; width=&quot;1&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n																					&lt;td bgcolor=&quot;#ffffff&quot; height=&quot;3&quot; width=&quot;3&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n																				&lt;/tr&gt;\r\n																				&lt;tr&gt;\r\n																					&lt;td bgcolor=&quot;#000011&quot; height=&quot;1&quot; width=&quot;3&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n																					&lt;td bgcolor=&quot;#ffffff&quot; height=&quot;1&quot; width=&quot;2&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n																					&lt;td bgcolor=&quot;#ffffff&quot; height=&quot;1&quot; width=&quot;10&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n																					&lt;td bgcolor=&quot;#ffffff&quot; height=&quot;1&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n																					&lt;td bgcolor=&quot;#ffffff&quot; height=&quot;1&quot; width=&quot;10&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n																					&lt;td bgcolor=&quot;#000011&quot; height=&quot;1&quot; width=&quot;3&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n																					&lt;td bgcolor=&quot;#ffffff&quot; height=&quot;1&quot; width=&quot;0&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n																				&lt;/tr&gt;\r\n																				&lt;tr&gt;\r\n																					&lt;td bgcolor=&quot;#000011&quot; height=&quot;2&quot; width=&quot;3&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n																					&lt;td bgcolor=&quot;#ffffff&quot; height=&quot;2&quot; width=&quot;2&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n																					&lt;td bgcolor=&quot;#ffffff&quot; height=&quot;2&quot; width=&quot;10&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n																					&lt;td bgcolor=&quot;#ffffff&quot; height=&quot;2&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n																					&lt;td bgcolor=&quot;#ffffff&quot; height=&quot;2&quot; width=&quot;10&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n																					&lt;td bgcolor=&quot;#000011&quot; height=&quot;2&quot; width=&quot;3&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n																					&lt;td bgcolor=&quot;#ffffff&quot; height=&quot;2&quot; width=&quot;0&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n																				&lt;/tr&gt;\r\n																				&lt;tr&gt;\r\n																					&lt;td bgcolor=&quot;#000011&quot; width=&quot;3&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n																					&lt;td bgcolor=&quot;#ffffff&quot; width=&quot;2&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n																					&lt;td bgcolor=&quot;#ffffff&quot; width=&quot;10&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n																					&lt;td align=&quot;center&quot; bgcolor=&quot;#ffffff&quot; style=&quot;TEXT-ALIGN:center;LINE-HEIGHT:21px;TEXT-TRANSFORM:uppercase;FONT-FAMILY:Arial;LETTER-SPACING:1px;COLOR:#000001;FONT-SIZE:12px;FONT-WEIGHT:bold&quot;&gt;&lt;a href=&quot;http://replylink.com/go.asp?/bASO001/mHEKBJ8U1/q5O2KJ8U1/u5WF3PVS1/xE7NH19U1/cutf%2D8&quot; style=&quot;COLOR:#000001;TEXT-DECORATION:none&quot; target=&quot;_blank&quot;&gt;SHOP accessories ›&lt;/a&gt;&lt;/td&gt;\r\n																					&lt;td bgcolor=&quot;#ffffff&quot; height=&quot;20&quot; width=&quot;10&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n																					&lt;td bgcolor=&quot;#000011&quot; width=&quot;3&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n																					&lt;td bgcolor=&quot;#ffffff&quot; width=&quot;0&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n																				&lt;/tr&gt;\r\n																				&lt;tr&gt;\r\n																					&lt;td bgcolor=&quot;#000011&quot; height=&quot;3&quot; width=&quot;3&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n																					&lt;td bgcolor=&quot;#ffffff&quot; height=&quot;3&quot; width=&quot;2&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n																					&lt;td bgcolor=&quot;#ffffff&quot; height=&quot;3&quot; width=&quot;10&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n																					&lt;td bgcolor=&quot;#ffffff&quot; height=&quot;3&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n																					&lt;td bgcolor=&quot;#ffffff&quot; height=&quot;3&quot; width=&quot;10&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n																					&lt;td bgcolor=&quot;#000011&quot; height=&quot;3&quot; width=&quot;3&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n																					&lt;td bgcolor=&quot;#ffffff&quot; height=&quot;3&quot; width=&quot;0&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n																				&lt;/tr&gt;\r\n																				&lt;tr&gt;\r\n																					&lt;td bgcolor=&quot;#000011&quot; height=&quot;2&quot; width=&quot;3&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n																					&lt;td bgcolor=&quot;#ffffff&quot; height=&quot;2&quot; width=&quot;2&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n																					&lt;td bgcolor=&quot;#ffffff&quot; height=&quot;2&quot; width=&quot;10&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n																					&lt;td bgcolor=&quot;#ffffff&quot; height=&quot;2&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n																					&lt;td bgcolor=&quot;#ffffff&quot; height=&quot;2&quot; width=&quot;10&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n																					&lt;td bgcolor=&quot;#000011&quot; height=&quot;2&quot; width=&quot;3&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n																					&lt;td bgcolor=&quot;#ffffff&quot; height=&quot;2&quot; width=&quot;0&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n																				&lt;/tr&gt;\r\n																				&lt;tr&gt;\r\n																					&lt;td bgcolor=&quot;#000011&quot; colspan=&quot;6&quot; height=&quot;3&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n																					&lt;td bgcolor=&quot;#ffffff&quot; height=&quot;3&quot; width=&quot;0&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n																				&lt;/tr&gt;\r\n																				&lt;tr&gt;\r\n																					&lt;td bgcolor=&quot;#ffffff&quot; height=&quot;0&quot; width=&quot;1&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n																					&lt;td bgcolor=&quot;#ffffff&quot; height=&quot;0&quot; width=&quot;2&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n																					&lt;td bgcolor=&quot;#ffffff&quot; height=&quot;0&quot; width=&quot;10&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n																					&lt;td bgcolor=&quot;#ffffff&quot; height=&quot;0&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n																					&lt;td bgcolor=&quot;#ffffff&quot; height=&quot;0&quot; width=&quot;10&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n																					&lt;td bgcolor=&quot;#ffffff&quot; height=&quot;0&quot; width=&quot;1&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n																					&lt;td bgcolor=&quot;#ffffff&quot; height=&quot;0&quot; width=&quot;3&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n																				&lt;/tr&gt;\r\n																			&lt;/tbody&gt;\r\n																		&lt;/table&gt;\r\n																		&lt;/td&gt;\r\n																	&lt;/tr&gt;\r\n																	&lt;tr&gt;\r\n																		&lt;td height=&quot;10&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n																	&lt;/tr&gt;\r\n																	&lt;tr&gt;\r\n																		&lt;td align=&quot;center&quot;&gt;\r\n																		&lt;table align=&quot;center&quot; border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot;&gt;\r\n																			&lt;tbody&gt;\r\n																				&lt;tr&gt;\r\n																					&lt;td bgcolor=&quot;#000011&quot; height=&quot;3&quot; width=&quot;1&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n																					&lt;td bgcolor=&quot;#000011&quot; height=&quot;3&quot; width=&quot;2&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n																					&lt;td bgcolor=&quot;#000011&quot; height=&quot;3&quot; width=&quot;10&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n																					&lt;td bgcolor=&quot;#000011&quot; height=&quot;3&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n																					&lt;td bgcolor=&quot;#000011&quot; height=&quot;3&quot; width=&quot;10&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n																					&lt;td bgcolor=&quot;#000011&quot; height=&quot;3&quot; width=&quot;1&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n																					&lt;td bgcolor=&quot;#ffffff&quot; height=&quot;3&quot; width=&quot;3&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n																				&lt;/tr&gt;\r\n																				&lt;tr&gt;\r\n																					&lt;td bgcolor=&quot;#000011&quot; height=&quot;1&quot; width=&quot;3&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n																					&lt;td bgcolor=&quot;#ffffff&quot; height=&quot;1&quot; width=&quot;2&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n																					&lt;td bgcolor=&quot;#ffffff&quot; height=&quot;1&quot; width=&quot;10&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n																					&lt;td bgcolor=&quot;#ffffff&quot; height=&quot;1&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n																					&lt;td bgcolor=&quot;#ffffff&quot; height=&quot;1&quot; width=&quot;10&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n																					&lt;td bgcolor=&quot;#000011&quot; height=&quot;1&quot; width=&quot;3&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n																					&lt;td bgcolor=&quot;#ffffff&quot; height=&quot;1&quot; width=&quot;0&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n																				&lt;/tr&gt;\r\n																				&lt;tr&gt;\r\n																					&lt;td bgcolor=&quot;#000011&quot; height=&quot;2&quot; width=&quot;3&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n																					&lt;td bgcolor=&quot;#ffffff&quot; height=&quot;2&quot; width=&quot;2&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n																					&lt;td bgcolor=&quot;#ffffff&quot; height=&quot;2&quot; width=&quot;10&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n																					&lt;td bgcolor=&quot;#ffffff&quot; height=&quot;2&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n																					&lt;td bgcolor=&quot;#ffffff&quot; height=&quot;2&quot; width=&quot;10&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n																					&lt;td bgcolor=&quot;#000011&quot; height=&quot;2&quot; width=&quot;3&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n																					&lt;td bgcolor=&quot;#ffffff&quot; height=&quot;2&quot; width=&quot;0&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n																				&lt;/tr&gt;\r\n																				&lt;tr&gt;\r\n																					&lt;td bgcolor=&quot;#000011&quot; width=&quot;3&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n																					&lt;td bgcolor=&quot;#ffffff&quot; width=&quot;2&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n																					&lt;td bgcolor=&quot;#ffffff&quot; width=&quot;10&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n																					&lt;td align=&quot;center&quot; bgcolor=&quot;#ffffff&quot; style=&quot;TEXT-ALIGN:center;LINE-HEIGHT:21px;TEXT-TRANSFORM:uppercase;FONT-FAMILY:Arial;LETTER-SPACING:1px;COLOR:#000001;FONT-SIZE:12px;FONT-WEIGHT:bold&quot;&gt;&lt;a href=&quot;http://replylink.com/go.asp?/bASO001/mHEKBJ8U1/qEXKTJ8U1/u5WF3PVS1/xE7NH19U1/cutf%2D8&quot; style=&quot;COLOR:#000001;TEXT-DECORATION:none&quot; target=&quot;_blank&quot;&gt;SHOP ALL SALE ›&lt;/a&gt;&lt;/td&gt;\r\n																					&lt;td bgcolor=&quot;#ffffff&quot; height=&quot;20&quot; width=&quot;10&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n																					&lt;td bgcolor=&quot;#000011&quot; width=&quot;3&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n																					&lt;td bgcolor=&quot;#ffffff&quot; width=&quot;0&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n																				&lt;/tr&gt;\r\n																				&lt;tr&gt;\r\n																					&lt;td bgcolor=&quot;#000011&quot; height=&quot;3&quot; width=&quot;3&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n																					&lt;td bgcolor=&quot;#ffffff&quot; height=&quot;3&quot; width=&quot;2&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n																					&lt;td bgcolor=&quot;#ffffff&quot; height=&quot;3&quot; width=&quot;10&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n																					&lt;td bgcolor=&quot;#ffffff&quot; height=&quot;3&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n																					&lt;td bgcolor=&quot;#ffffff&quot; height=&quot;3&quot; width=&quot;10&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n																					&lt;td bgcolor=&quot;#000011&quot; height=&quot;3&quot; width=&quot;3&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n																					&lt;td bgcolor=&quot;#ffffff&quot; height=&quot;3&quot; width=&quot;0&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n																				&lt;/tr&gt;\r\n																				&lt;tr&gt;\r\n																					&lt;td bgcolor=&quot;#000011&quot; height=&quot;2&quot; width=&quot;3&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n																					&lt;td bgcolor=&quot;#ffffff&quot; height=&quot;2&quot; width=&quot;2&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n																					&lt;td bgcolor=&quot;#ffffff&quot; height=&quot;2&quot; width=&quot;10&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n																					&lt;td bgcolor=&quot;#ffffff&quot; height=&quot;2&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n																					&lt;td bgcolor=&quot;#ffffff&quot; height=&quot;2&quot; width=&quot;10&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n																					&lt;td bgcolor=&quot;#000011&quot; height=&quot;2&quot; width=&quot;3&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n																					&lt;td bgcolor=&quot;#ffffff&quot; height=&quot;2&quot; width=&quot;0&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n																				&lt;/tr&gt;\r\n																				&lt;tr&gt;\r\n																					&lt;td bgcolor=&quot;#000011&quot; colspan=&quot;6&quot; height=&quot;3&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n																					&lt;td bgcolor=&quot;#ffffff&quot; height=&quot;3&quot; width=&quot;0&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n																				&lt;/tr&gt;\r\n																				&lt;tr&gt;\r\n																					&lt;td bgcolor=&quot;#ffffff&quot; height=&quot;0&quot; width=&quot;1&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n																					&lt;td bgcolor=&quot;#ffffff&quot; height=&quot;0&quot; width=&quot;2&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n																					&lt;td bgcolor=&quot;#ffffff&quot; height=&quot;0&quot; width=&quot;10&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n																					&lt;td bgcolor=&quot;#ffffff&quot; height=&quot;0&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n																					&lt;td bgcolor=&quot;#ffffff&quot; height=&quot;0&quot; width=&quot;10&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n																					&lt;td bgcolor=&quot;#ffffff&quot; height=&quot;0&quot; width=&quot;1&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n																					&lt;td bgcolor=&quot;#ffffff&quot; height=&quot;0&quot; width=&quot;3&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n																				&lt;/tr&gt;\r\n																			&lt;/tbody&gt;\r\n																		&lt;/table&gt;\r\n																		&lt;/td&gt;\r\n																	&lt;/tr&gt;\r\n																	&lt;tr&gt;\r\n																		&lt;td height=&quot;7&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n																	&lt;/tr&gt;\r\n																&lt;/tbody&gt;\r\n															&lt;/table&gt;\r\n															&lt;/td&gt;\r\n														&lt;/tr&gt;\r\n													&lt;/tbody&gt;\r\n												&lt;/table&gt;\r\n												&lt;/td&gt;\r\n											&lt;/tr&gt;\r\n										&lt;/tbody&gt;\r\n									&lt;/table&gt;\r\n									&lt;/td&gt;\r\n									&lt;td style=&quot;BORDER-COLLAPSE:collapse&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td&gt;\r\n									&lt;table bgcolor=&quot;#ffffff&quot; border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; width=&quot;360&quot;&gt;\r\n										&lt;tbody&gt;\r\n											&lt;tr&gt;\r\n												&lt;td align=&quot;center&quot; bgcolor=&quot;#ffffff&quot; colspan=&quot;1&quot; valign=&quot;top&quot; width=&quot;360&quot;&gt;\r\n												&lt;table border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot;&gt;\r\n													&lt;tbody&gt;\r\n														&lt;tr&gt;\r\n															&lt;td&gt;&lt;a href=&quot;http://replylink.com/go.asp?/bASO001/mHEKBJ8U1/qWFBBJ8U1/u5WF3PVS1/xE7NH19U1/cutf%2D8&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;animated_product_gif&quot; border=&quot;0&quot; height=&quot;458&quot; src=&quot;http://images.asos.com/newsletter/140713_MW_UK_IM_TEST/media/email_images/menswear/2013/july/08_07/email_im_v2.gif&quot; style=&quot;DISPLAY:block&quot; width=&quot;360&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n														&lt;/tr&gt;\r\n													&lt;/tbody&gt;\r\n												&lt;/table&gt;\r\n												&lt;/td&gt;\r\n											&lt;/tr&gt;\r\n										&lt;/tbody&gt;\r\n									&lt;/table&gt;\r\n									&lt;/td&gt;\r\n								&lt;/tr&gt;\r\n							&lt;/tbody&gt;\r\n						&lt;/table&gt;\r\n						&lt;/td&gt;\r\n					&lt;/tr&gt;\r\n					&lt;tr&gt;\r\n						&lt;td height=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n					&lt;/tr&gt;\r\n					&lt;tr&gt;\r\n						&lt;td height=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n					&lt;/tr&gt;\r\n					&lt;tr&gt;\r\n						&lt;td&gt;&amp;nbsp;&lt;/td&gt;\r\n					&lt;/tr&gt;\r\n					&lt;tr&gt;\r\n						&lt;td&gt;\r\n						&lt;table border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; width=&quot;100%&quot;&gt;\r\n							&lt;tbody&gt;\r\n								&lt;tr&gt;\r\n									&lt;td bgcolor=&quot;#000000&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#000000&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#ea0101&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#ea0101&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#ea0101&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#ea0101&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#ea0101&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#ea0101&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#ea0101&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#ea0101&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#ea0101&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#ea0101&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#ea0101&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#ea0101&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#ea0101&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#cdcccc&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#cdcccc&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#cdcccc&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#cdcccc&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#cdcccc&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#cdcccc&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#cdcccc&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#cdcccc&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#cdcccc&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#cdcccc&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#cdcccc&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#cdcccc&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#cdcccc&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#000000&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#000000&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#000000&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#000000&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#000000&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#000000&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#000000&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#000000&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#000000&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#000000&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#000000&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#000000&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#000000&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#ea0101&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#ea0101&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#ea0101&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#ea0101&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#ea0101&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#ea0101&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#ea0101&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#ea0101&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#ea0101&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#ea0101&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#ea0101&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#ea0101&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#ea0101&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#cdcccc&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#cdcccc&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#cdcccc&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#cdcccc&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#cdcccc&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#cdcccc&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#cdcccc&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#cdcccc&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#cdcccc&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#cdcccc&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#cdcccc&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#cdcccc&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#cdcccc&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#000000&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#000000&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#000000&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#000000&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#000000&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#000000&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#000000&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#000000&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#000000&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#000000&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#000000&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#000000&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#ea0101&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#ea0101&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#ea0101&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#ea0101&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#ea0101&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#ea0101&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#ea0101&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#ea0101&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#ea0101&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#ea0101&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#ea0101&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#ea0101&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n								&lt;/tr&gt;\r\n								&lt;tr&gt;\r\n									&lt;td bgcolor=&quot;#cdcccc&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#cdcccc&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#cdcccc&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#cdcccc&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#cdcccc&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#cdcccc&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#cdcccc&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#cdcccc&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#cdcccc&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#cdcccc&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#cdcccc&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#cdcccc&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#cdcccc&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#000000&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#000000&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#000000&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#000000&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#000000&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#000000&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#000000&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#000000&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#000000&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#000000&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#000000&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#000000&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#ea0101&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#ea0101&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#ea0101&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#ea0101&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#ea0101&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#ea0101&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#ea0101&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#ea0101&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#ea0101&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#ea0101&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#ea0101&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#ea0101&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#cdcccc&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#cdcccc&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#cdcccc&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#cdcccc&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#cdcccc&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#cdcccc&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#cdcccc&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#cdcccc&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#cdcccc&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#cdcccc&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#cdcccc&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#cdcccc&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#cdcccc&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#cdcccc&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#000000&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#000000&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#000000&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#000000&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#000000&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#000000&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#000000&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#000000&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#000000&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#000000&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#000000&quot; height=&quot;8&quot; width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r', '', '');
INSERT INTO `news_description` (`news_id`, `language_id`, `name`, `short_description`, `description`, `meta_description`, `meta_keyword`) VALUES
(17, 2, 'ABERCROMBIE AND FITCH - Hàng chục mẫu Jeans siêu HOT mới về', '', '&lt;table align=&quot;center&quot; border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; width=&quot;1440&quot;&gt;\r\n	&lt;tbody&gt;\r\n		&lt;tr&gt;\r\n			&lt;td align=&quot;left&quot; valign=&quot;top&quot;&gt;&lt;img alt=&quot;&quot; border=&quot;0&quot; height=&quot;20&quot; src=&quot;http://f.abercrombie-email.com/i/16/2089064817/1x2.gif&quot; style=&quot;display:block&quot; width=&quot;1&quot; /&gt;&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n	&lt;/tbody&gt;\r\n&lt;/table&gt;\r\n\r\n&lt;table align=&quot;center&quot; border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; width=&quot;1440&quot;&gt;\r\n	&lt;tbody&gt;\r\n		&lt;tr&gt;\r\n			&lt;td bgcolor=&quot;#393939&quot; width=&quot;16&quot;&gt;&lt;img alt=&quot;&quot; border=&quot;0&quot; height=&quot;2&quot; src=&quot;http://f.abercrombie-email.com/i/16/2089064817/1x2.gif&quot; style=&quot;display:block&quot; width=&quot;7&quot; /&gt;&lt;/td&gt;\r\n			&lt;td align=&quot;center&quot; bgcolor=&quot;#393939&quot; style=&quot;color:#666666;text-decoration:none;font-size:10px;line-height:14px;font-family:Arial,Helvetica,sans-serif&quot; valign=&quot;top&quot; width=&quot;1329&quot;&gt;&lt;a href=&quot;http://abercrombie-email.com/a/hBR4TM2B8hJlxB8z3G7AA2tuJe2/preheader?ET_RID=&quot; style=&quot;color:#666666;text-decoration:none&quot; target=&quot;_blank&quot;&gt;&lt;span style=&quot;color:#666666;text-decoration:none&quot;&gt;Find your perfect pair now!&lt;/span&gt;&lt;/a&gt;&lt;br /&gt;\r\n			View On &lt;a href=&quot;http://abercrombie-email.com/a/hBR4TM2B8hJlxB8z3G7AA2tuJe2/view?t_params=I_UNSUB_FOOTER%3D0%26EMAIL%3Dwelookvn%2540gmail.com&amp;amp;ET_RID=&quot; style=&quot;color:#666666&quot; target=&quot;_blank&quot;&gt;&lt;span style=&quot;color:#666666&quot;&gt;Web Browser&lt;/span&gt;&lt;/a&gt; | &lt;a href=&quot;http://abercrombie-email.com/a/hBR4TM2B8hJlxB8z3G7AA2tuJe2/viewmens?ET_RID=&quot; style=&quot;color:#666666&quot; target=&quot;_blank&quot;&gt;&lt;span style=&quot;color:#666666&quot;&gt;View Mens&lt;/span&gt;&lt;/a&gt;&lt;/td&gt;\r\n			&lt;td bgcolor=&quot;#393939&quot; width=&quot;16&quot;&gt;&lt;img alt=&quot;&quot; border=&quot;0&quot; height=&quot;2&quot; src=&quot;http://f.abercrombie-email.com/i/16/2089064817/1x2.gif&quot; style=&quot;display:block&quot; width=&quot;16&quot; /&gt;&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n	&lt;/tbody&gt;\r\n&lt;/table&gt;\r\n\r\n&lt;table border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; width=&quot;1361&quot;&gt;\r\n	&lt;tbody&gt;\r\n		&lt;tr&gt;\r\n			&lt;td align=&quot;left&quot; valign=&quot;top&quot;&gt;&lt;img alt=&quot;&quot; border=&quot;0&quot; height=&quot;10&quot; src=&quot;http://f.abercrombie-email.com/i/16/2089064817/1x2.gif&quot; style=&quot;display:block&quot; width=&quot;1&quot; /&gt;&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n	&lt;/tbody&gt;\r\n&lt;/table&gt;\r\n\r\n&lt;table border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot;&gt;\r\n	&lt;tbody&gt;\r\n		&lt;tr&gt;\r\n			&lt;td&gt;&lt;a href=&quot;http://abercrombie-email.com/a/hBR4TM2B8hJlxB8z3G7AA2tuJe2/mensnav?ET_RID=&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;MENS&quot; border=&quot;0&quot; height=&quot;60&quot; src=&quot;http://f.abercrombie-email.com/i/16/2089064817/0710_Saturday_Editorial_AF_WOMEN_01.jpg&quot; style=&quot;display:block&quot; width=&quot;79&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n			&lt;td&gt;&lt;a href=&quot;http://abercrombie-email.com/a/hBR4TM2B8hJlxB8z3G7AA2tuJe2/womensnav?ET_RID=&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;WOMENS&quot; border=&quot;0&quot; height=&quot;60&quot; src=&quot;http://f.abercrombie-email.com/i/16/2089064817/0710_Saturday_Editorial_AF_WOMEN_02.jpg&quot; style=&quot;display:block&quot; width=&quot;109&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n			&lt;td&gt;&lt;a href=&quot;http://abercrombie-email.com/a/hBR4TM2B8hJlxB8z3G7AA2tuJe2/denim?ET_RID=&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;JEANS&quot; border=&quot;0&quot; height=&quot;61&quot; src=&quot;http://f.abercrombie-email.com/i/16/2089064817/newerANF_DenimGuide_MEN_03.jpg&quot; style=&quot;display:block&quot; width=&quot;90&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n			&lt;td&gt;&lt;a href=&quot;http://abercrombie-email.com/a/hBR4TM2B8hJlxB8z3G7AA2tuJe2/aflooks?ET_RID=&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;A&amp;amp;F LOOKS&quot; border=&quot;0&quot; height=&quot;61&quot; src=&quot;http://f.abercrombie-email.com/i/16/2089064817/newerANF_DenimGuide_MEN_05_2.jpg&quot; style=&quot;display:block&quot; width=&quot;118&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n			&lt;td&gt;&lt;a href=&quot;http://abercrombie-email.com/a/hBR4TM2B8hJlxB8z3G7AA2tuJe2/storelocat?ET_RID=&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;FIND A STORE&quot; border=&quot;0&quot; height=&quot;61&quot; src=&quot;http://f.abercrombie-email.com/i/16/2089064817/newerANF_DenimGuide_MEN_05_01.jpg&quot; style=&quot;display:block&quot; width=&quot;491&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n			&lt;td&gt;&lt;a href=&quot;http://abercrombie-email.com/a/hBR4TM2B8hJlxB8z3G7AA2tuJe2/border1?ET_RID=&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;&quot; border=&quot;0&quot; height=&quot;60&quot; src=&quot;http://f.abercrombie-email.com/i/16/2089064817/0710_Saturday_Editorial_AF_WOMEN_06.jpg&quot; style=&quot;display:block&quot; width=&quot;688&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n			&lt;td&gt;&lt;a href=&quot;http://abercrombie-email.com/a/hBR4TM2B8hJlxB8z3G7AA2tuJe2/border2?ET_RID=&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;&quot; border=&quot;0&quot; height=&quot;60&quot; src=&quot;http://f.abercrombie-email.com/i/16/2089064817/0710_Saturday_Editorial_AF_WOMEN_07.jpg&quot; style=&quot;display:block&quot; width=&quot;687&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n			&lt;td&gt;&lt;a href=&quot;http://abercrombie-email.com/a/hBR4TM2B8hJlxB8z3G7AA2tuJe2/facebook?ET_RID=&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;CHECK OUT A&amp;amp;F ON FACEBOOK&quot; border=&quot;0&quot; height=&quot;60&quot; src=&quot;http://f.abercrombie-email.com/i/16/2089064817/0710_Saturday_Editorial_AF_WOMEN_08.jpg&quot; style=&quot;display:block&quot; width=&quot;270&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n			&lt;td&gt;&lt;a href=&quot;http://abercrombie-email.com/a/hBR4TM2B8hJlxB8z3G7AA2tuJe2/twitter?ET_RID=&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;TWITTER&quot; border=&quot;0&quot; height=&quot;60&quot; src=&quot;http://f.abercrombie-email.com/i/16/2089064817/0710_Saturday_Editorial_AF_WOMEN_09.jpg&quot; style=&quot;display:block&quot; width=&quot;82&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n			&lt;td&gt;&lt;a href=&quot;http://abercrombie-email.com/a/hBR4TM2B8hJlxB8z3G7AA2tuJe2/instagram?ET_RID=&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;INSTAGRAM&quot; border=&quot;0&quot; height=&quot;60&quot; src=&quot;http://f.abercrombie-email.com/i/16/2089064817/0710_Saturday_Editorial_AF_WOMEN_10.jpg&quot; style=&quot;display:block&quot; width=&quot;80&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n			&lt;td&gt;&lt;a href=&quot;http://abercrombie-email.com/a/hBR4TM2B8hJlxB8z3G7AA2tuJe2/pinterest?ET_RID=&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;PINTEREST&quot; border=&quot;0&quot; height=&quot;60&quot; src=&quot;http://f.abercrombie-email.com/i/16/2089064817/0710_Saturday_Editorial_AF_WOMEN_11.jpg&quot; style=&quot;display:block&quot; width=&quot;133&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n	&lt;/tbody&gt;\r\n&lt;/table&gt;\r\n\r\n&lt;table border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot;&gt;\r\n	&lt;tbody&gt;\r\n		&lt;tr&gt;\r\n			&lt;td&gt;&lt;a href=&quot;http://abercrombie-email.com/a/hBR4TM2B8hJlxB8z3G7AA2tuJe2/mainmsg?ET_RID=&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;A&amp;amp;F PRESENTS HOT NEW JEANS ON THE RISE THE EXCLUSIVE WASH &amp;amp; FIT \r\nGUIDE EXPERIENCE A&amp;amp;F JEANS&quot; border=&quot;0&quot; height=&quot;507&quot; src=&quot;http://f.abercrombie-email.com/i/16/2089064817/new0710_Saturday_Editorial_AF_WOMEN_12.jpg&quot; style=&quot;display:block&quot; width=&quot;530&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n			&lt;td&gt;&lt;a href=&quot;http://abercrombie-email.com/a/hBR4TM2B8hJlxB8z3G7AA2tuJe2/jeans1?ET_RID=&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;JEGGING     MID RISE JEGGING&quot; border=&quot;0&quot; height=&quot;507&quot; src=&quot;http://f.abercrombie-email.com/i/16/2089064817/new0710_Saturday_Editorial_AF_WOMEN_13.jpg&quot; style=&quot;display:block&quot; width=&quot;463&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n			&lt;td&gt;&lt;a href=&quot;http://abercrombie-email.com/a/hBR4TM2B8hJlxB8z3G7AA2tuJe2/jeans2?ET_RID=&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;SUPER SKINNY     HIGH RISE SUPER SKINNY&quot; border=&quot;0&quot; height=&quot;507&quot; src=&quot;http://f.abercrombie-email.com/i/16/2089064817/new0710_Saturday_Editorial_AF_WOMEN_14.jpg&quot; style=&quot;display:block&quot; width=&quot;469&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n			&lt;td&gt;&lt;a href=&quot;http://abercrombie-email.com/a/hBR4TM2B8hJlxB8z3G7AA2tuJe2/jeans3?ET_RID=&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;MID RISE SUPER SKINNY ANKLE     HIGH RISE SUPER SKINNY ANKLE HIGH&quot; border=&quot;0&quot; height=&quot;507&quot; src=&quot;http://f.abercrombie-email.com/i/16/2089064817/new0710_Saturday_Editorial_AF_WOMEN_15.jpg&quot; style=&quot;display:block&quot; width=&quot;533&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n			&lt;td&gt;&lt;a href=&quot;http://abercrombie-email.com/a/hBR4TM2B8hJlxB8z3G7AA2tuJe2/jeans4?ET_RID=&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;SKINNY   BOYFRIEND&quot; border=&quot;0&quot; height=&quot;507&quot; src=&quot;http://f.abercrombie-email.com/i/16/2089064817/new0710_Saturday_Editorial_AF_WOMEN_16.jpg&quot; style=&quot;display:block&quot; width=&quot;472&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n			&lt;td&gt;&lt;a href=&quot;http://abercrombie-email.com/a/hBR4TM2B8hJlxB8z3G7AA2tuJe2/jeans5?ET_RID=&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;BOOT&quot; border=&quot;0&quot; height=&quot;507&quot; src=&quot;http://f.abercrombie-email.com/i/16/2089064817/new0710_Saturday_Editorial_AF_WOMEN_17.jpg&quot; style=&quot;display:block&quot; width=&quot;365&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n	&lt;/tbody&gt;\r\n&lt;/table&gt;\r\n\r\n&lt;table border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot;&gt;\r\n	&lt;tbody&gt;\r\n		&lt;tr&gt;\r\n			&lt;td&gt;&lt;a href=&quot;http://abercrombie-email.com/a/hBR4TM2B8hJlxB8z3G7AA2tuJe2/mainmsg2?ET_RID=&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;&quot; border=&quot;0&quot; height=&quot;50&quot; src=&quot;http://f.abercrombie-email.com/i/16/2089064817/0710_Saturday_Editorial_AF_WOMEN_18.jpg&quot; style=&quot;display:block&quot; width=&quot;624&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n			&lt;td&gt;&lt;a href=&quot;http://abercrombie-email.com/a/hBR4TM2B8hJlxB8z3G7AA2tuJe2/mainmsg3?ET_RID=&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;&quot; border=&quot;0&quot; height=&quot;50&quot; src=&quot;http://f.abercrombie-email.com/i/16/2089064817/0710_Saturday_Editorial_AF_WOMEN_19.jpg&quot; style=&quot;display:block&quot; width=&quot;624&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n			&lt;td&gt;&lt;a href=&quot;http://abercrombie-email.com/a/hBR4TM2B8hJlxB8z3G7AA2tuJe2/mainmsg4?ET_RID=&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;&quot; border=&quot;0&quot; height=&quot;50&quot; src=&quot;http://f.abercrombie-email.com/i/16/2089064817/0710_Saturday_Editorial_AF_WOMEN_20.jpg&quot; style=&quot;display:block&quot; width=&quot;624&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n			&lt;td&gt;&lt;img alt=&quot;THIS EMAIL IS NOT ENDORSED OR SPONSORED BY ANY THIRD-PARTY SOCIAL \r\nMEDIA SITES. ALL SOCIAL MEDIA LOGOS AND TRADEMARKS IN THIS EMAIL ARE \r\nPROPERTY OF THEIR RESPECTIVE OWNERS.&quot; border=&quot;0&quot; height=&quot;50&quot; src=&quot;http://f.abercrombie-email.com/i/16/2089064817/0710_Saturday_Editorial_AF_WOMEN_21.jpg&quot; style=&quot;display:block&quot; width=&quot;624&quot; /&gt;&lt;/td&gt;\r\n			&lt;td&gt;&lt;img alt=&quot;&quot; border=&quot;0&quot; height=&quot;50&quot; src=&quot;http://f.abercrombie-email.com/i/16/2089064817/0710_Saturday_Editorial_AF_WOMEN_22.jpg&quot; style=&quot;display:block&quot; width=&quot;336&quot; /&gt;&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n	&lt;/tbody&gt;\r\n&lt;/table&gt;\r\n\r\n&lt;table align=&quot;center&quot; border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; width=&quot;1440&quot;&gt;\r\n	&lt;tbody&gt;\r\n		&lt;tr&gt;\r\n			&lt;td align=&quot;center&quot;&gt;&lt;br /&gt;\r\n			&lt;font style=&quot;font:9px Arial,Helvetica,sans-serif;color:#666666&quot;&gt;&lt;font style=&quot;font:9px Arial,Helvetica,sans-serif;color:#666666&quot;&gt;&lt;span style=&quot;color:#666666&quot;&gt;This is a product offering from Abercrombie &amp;amp; Fitch.&lt;/span&gt;&lt;br /&gt;\r\n			You have received this email since you submitted your email address to our list of subscribers&lt;br /&gt;\r\n			To unsubscribe, please click &lt;a href=&quot;http://abercrombie-email.com/a/hBR4TM2B8hJlxB8z3G7AA2tuJe2/unsub?email=welookvn@gmail.com&amp;amp;ET_RID=&quot; style=&quot;color:#666666&quot; target=&quot;_blank&quot;&gt;&lt;span style=&quot;color:#666666&quot;&gt; here&lt;/span&gt;&lt;/a&gt; and submit your email address.&lt;br /&gt;\r\n			&lt;br /&gt;\r\n			Please see our &lt;a href=&quot;http://abercrombie-email.com/a/hBR4TM2B8hJlxB8z3G7AA2tuJe2/terms&amp;amp;et_cid=2093969851?ET_RID=&quot; style=&quot;color:#666666&quot; target=&quot;_blank&quot;&gt;&lt;span style=&quot;color:#666666&quot;&gt;Website Terms of Use&lt;/span&gt;&lt;/a&gt;, and to know how we use your personal data,&lt;br /&gt;\r\n			please see our &lt;a href=&quot;http://abercrombie-email.com/a/hBR4TM2B8hJlxB8z3G7AA2tuJe2/privacy&amp;amp;et_cid=2093969851?ET_RID=&quot; style=&quot;color:#666666&quot; target=&quot;_blank&quot;&gt;&lt;span style=&quot;color:#666666&quot;&gt;Privacy Policy&lt;/span&gt;&lt;/a&gt;&lt;br /&gt;\r\n			&lt;br /&gt;\r\n			Abercrombie &amp;amp; Fitch - 720 Fifth Avenue - Attn: 8th Floor - New York, NY 10019&lt;br /&gt;\r\n			&lt;a href=&quot;http://abercrombie-email.com/a/hBR4TM2B8hJlxB8z3G7AA2tuJe2/bottomhome&amp;amp;et_cid=2093969851?ET_RID=&quot; style=&quot;color:#666666&quot; target=&quot;_blank&quot;&gt;&lt;span style=&quot;color:#666666&quot;&gt;www.Abercrombie.com&lt;/span&gt;&lt;/a&gt; &lt;/font&gt;&lt;/font&gt;&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n	&lt;/tbody&gt;\r\n&lt;/table&gt;\r\n', '', ''),
(15, 2, 'LACOSTE - Toàn bộ quần áo giầy dép đã sale tới 50% rồi các bạn nhé', '', '&lt;div&gt;\r\n&lt;table align=&quot;center&quot; border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; height=&quot;100&quot; width=&quot;700&quot;&gt;\r\n	&lt;tbody&gt;\r\n		&lt;tr&gt;\r\n			&lt;td align=&quot;center&quot; height=&quot;50&quot; style=&quot;font-size:12px;font-family:Arial,Helvetica,sans-serif;color:#03f;text-align:center;margin-top:10px;text-decoration:underline&quot; width=&quot;780&quot;&gt;&lt;a href=&quot;http://newsletter.lacoste.com/re?l=D0I93v2olI2of90jpI9I93gesr&quot; target=&quot;_blank&quot;&gt;Free delivery with the code NEWSLETTER&lt;/a&gt;&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td align=&quot;center&quot; height=&quot;50&quot; style=&quot;font-family:Arial,Helvetica,sans-serif;font-size:9px;color:#726f6b;text-align:center&quot; width=&quot;780&quot;&gt;If you are unable to view this email please click &lt;a href=&quot;http://newsletter.lacoste.com/public/read_message.jsp?tsp=1373789042987&amp;amp;custid=5727&amp;amp;uid=5830367749&amp;amp;sig=OIGKPMOFBBGMFBNC&amp;amp;mid=550684245&quot; style=&quot;text-decoration:underline;color:#726f6b&quot; target=&quot;_blank&quot;&gt;here&lt;/a&gt;.&lt;br /&gt;\r\n			To ensure delivery to your inbox, please add &lt;a href=&quot;mailto:news@newsletter.lacoste.com&quot; target=&quot;_blank&quot;&gt;news@newsletter.lacoste.com&lt;/a&gt; to your address book.&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n	&lt;/tbody&gt;\r\n&lt;/table&gt;\r\n\r\n&lt;table align=&quot;center&quot; border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; height=&quot;130&quot; width=&quot;700&quot;&gt;\r\n	&lt;tbody&gt;\r\n		&lt;tr&gt;\r\n			&lt;td colspan=&quot;8&quot; height=&quot;45&quot; width=&quot;700&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td colspan=&quot;4&quot; height=&quot;49&quot; width=&quot;321&quot;&gt;&lt;a href=&quot;http://newsletter.lacoste.com/re?l=D0I93v2olI2of90jpIaI93gesr&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;Lacoste&quot; border=&quot;0&quot; src=&quot;http://newsletter.lacoste.com/imgproxy/img/636488092/logo.jpg&quot; style=&quot;display:block&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n			&lt;td colspan=&quot;4&quot; height=&quot;49&quot; width=&quot;379&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td colspan=&quot;8&quot; height=&quot;7&quot; width=&quot;700&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td height=&quot;21&quot; width=&quot;69&quot;&gt;&lt;a href=&quot;http://newsletter.lacoste.com/re?l=D0I93v2olI2of90jpIbI93gesr&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;Men&quot; border=&quot;0&quot; src=&quot;http://newsletter.lacoste.com/imgproxy/img/636488093/homme.jpg&quot; style=&quot;display:block&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n			&lt;td height=&quot;21&quot; width=&quot;91&quot;&gt;&lt;a href=&quot;http://newsletter.lacoste.com/re?l=D0I93v2olI2of90jpIcI93gesr&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;Women&quot; border=&quot;0&quot; src=&quot;http://newsletter.lacoste.com/imgproxy/img/636488094/femme.jpg&quot; style=&quot;display:block&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n			&lt;td height=&quot;21&quot; width=&quot;84&quot;&gt;&lt;a href=&quot;http://newsletter.lacoste.com/re?l=D0I93v2olI2of90jpIdI93gesr&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;Children&quot; border=&quot;0&quot; src=&quot;http://newsletter.lacoste.com/imgproxy/img/636488095/enfant.jpg&quot; style=&quot;display:block&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n			&lt;td height=&quot;21&quot; width=&quot;85&quot;&gt;&lt;a href=&quot;http://newsletter.lacoste.com/re?l=D0I93v2olI2of90jpIeI93gesr&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;Polos&quot; border=&quot;0&quot; src=&quot;http://newsletter.lacoste.com/imgproxy/img/636488096/polos.jpg&quot; style=&quot;display:block&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n			&lt;td height=&quot;21&quot; width=&quot;74&quot;&gt;&lt;a href=&quot;http://newsletter.lacoste.com/re?l=D0I93v2olI2of90jpIfI93gesr&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;Shoes&quot; border=&quot;0&quot; src=&quot;http://newsletter.lacoste.com/imgproxy/img/636488097/chaussures.jpg&quot; style=&quot;display:block&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n			&lt;td height=&quot;21&quot; width=&quot;108&quot;&gt;&lt;a href=&quot;http://newsletter.lacoste.com/re?l=D0I93v2olI2of90jpIgI93gesr&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;Accessories&quot; border=&quot;0&quot; src=&quot;http://newsletter.lacoste.com/imgproxy/img/636488098/accessoires.jpg&quot; style=&quot;display:block&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n			&lt;td height=&quot;21&quot; width=&quot;71&quot;&gt;&lt;a href=&quot;http://newsletter.lacoste.com/re?l=D0I93v2olI2of90jpIhI93gesr&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;Home&quot; border=&quot;0&quot; src=&quot;http://newsletter.lacoste.com/imgproxy/img/636488099/maison.jpg&quot; style=&quot;display:block&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n			&lt;td height=&quot;21&quot; width=&quot;118&quot;&gt;&lt;a href=&quot;http://newsletter.lacoste.com/re?l=D0I93v2olI2of90jpIiI93gesr&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;Lacoste Live&quot; border=&quot;0&quot; src=&quot;http://newsletter.lacoste.com/imgproxy/img/636488100/live.jpg&quot; style=&quot;display:block&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n	&lt;/tbody&gt;\r\n&lt;/table&gt;\r\n\r\n&lt;table align=&quot;center&quot; border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; width=&quot;700&quot;&gt;\r\n	&lt;tbody&gt;\r\n		&lt;tr&gt;\r\n			&lt;td align=&quot;center&quot;&gt;\r\n			&lt;table align=&quot;center&quot; border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; height=&quot;616&quot; width=&quot;700&quot;&gt;\r\n				&lt;tbody&gt;\r\n					&lt;tr&gt;\r\n						&lt;td colspan=&quot;24&quot;&gt;&lt;a href=&quot;http://newsletter.lacoste.com/re?l=D0I93v2olI2of90jpIjI93gesr&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;code newsletter&quot; border=&quot;0&quot; height=&quot;48&quot; src=&quot;http://newsletter.lacoste.com/imgproxy/img/636488101/shoes-fr-redim.jpg&quot; style=&quot;display:block;margin:0&quot; width=&quot;700&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n					&lt;/tr&gt;\r\n					&lt;tr&gt;\r\n						&lt;td colspan=&quot;24&quot;&gt;&lt;a href=&quot;http://newsletter.lacoste.com/re?l=D0I93v2olI2of90jpIkI93gesr&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;sale footwear up to 50% off&quot; border=&quot;0&quot; height=&quot;250&quot; src=&quot;http://newsletter.lacoste.com/imgproxy/img/636488102/shoes-fr-redim-02.jpg&quot; style=&quot;display:block;margin:0&quot; width=&quot;700&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n					&lt;/tr&gt;\r\n					&lt;tr&gt;\r\n						&lt;td colspan=&quot;13&quot;&gt;&lt;a href=&quot;http://newsletter.lacoste.com/re?l=D0I93v2olI2of90jpIlI93gesr&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;see all mens&quot; border=&quot;0&quot; height=&quot;103&quot; src=&quot;http://newsletter.lacoste.com/imgproxy/img/636488103/shoes-fr-redim-03.jpg&quot; style=&quot;display:block;margin:0&quot; width=&quot;375&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n						&lt;td colspan=&quot;11&quot;&gt;&lt;a href=&quot;http://newsletter.lacoste.com/re?l=D0I93v2olI2of90jpImI93gesr&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;see all womens&quot; border=&quot;0&quot; height=&quot;103&quot; src=&quot;http://newsletter.lacoste.com/imgproxy/img/636488104/shoes-fr-redim-04.jpg&quot; style=&quot;display:block;margin:0&quot; width=&quot;325&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n					&lt;/tr&gt;\r\n					&lt;tr&gt;\r\n						&lt;td&gt;&lt;a href=&quot;http://newsletter.lacoste.com/re?l=D0I93v2olI2of90jpInI93gesr&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;6&quot; border=&quot;0&quot; height=&quot;62&quot; src=&quot;http://newsletter.lacoste.com/imgproxy/img/636488105/shoes-fr-redim-05.jpg&quot; style=&quot;display:block;margin:0&quot; width=&quot;37&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n						&lt;td&gt;&lt;a href=&quot;http://newsletter.lacoste.com/re?l=D0I93v2olI2of90jpIoI93gesr&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;6.5&quot; border=&quot;0&quot; height=&quot;62&quot; src=&quot;http://newsletter.lacoste.com/imgproxy/img/636488106/shoes-fr-redim-06.jpg&quot; style=&quot;display:block;margin:0&quot; width=&quot;27&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n						&lt;td&gt;&lt;a href=&quot;http://newsletter.lacoste.com/re?l=D0I93v2olI2of90jpIpI93gesr&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;7&quot; border=&quot;0&quot; height=&quot;62&quot; src=&quot;http://newsletter.lacoste.com/imgproxy/img/636488107/shoes-fr-redim-07.jpg&quot; style=&quot;display:block;margin:0&quot; width=&quot;27&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n						&lt;td&gt;&lt;a href=&quot;http://newsletter.lacoste.com/re?l=D0I93v2olI2of90jpIqI93gesr&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;7.5&quot; border=&quot;0&quot; height=&quot;62&quot; src=&quot;http://newsletter.lacoste.com/imgproxy/img/636488108/shoes-fr-redim-08.jpg&quot; style=&quot;display:block;margin:0&quot; width=&quot;27&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n						&lt;td&gt;&lt;a href=&quot;http://newsletter.lacoste.com/re?l=D0I93v2olI2of90jpIrI93gesr&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;8&quot; border=&quot;0&quot; height=&quot;62&quot; src=&quot;http://newsletter.lacoste.com/imgproxy/img/636488109/shoes-fr-redim-09.jpg&quot; style=&quot;display:block;margin:0&quot; width=&quot;27&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n						&lt;td&gt;&lt;a href=&quot;http://newsletter.lacoste.com/re?l=D0I93v2olI2of90jpIsI93gesr&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;8.5&quot; border=&quot;0&quot; height=&quot;62&quot; src=&quot;http://newsletter.lacoste.com/imgproxy/img/636488110/shoes-fr-redim-10.jpg&quot; style=&quot;display:block;margin:0&quot; width=&quot;27&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n						&lt;td&gt;&lt;a href=&quot;http://newsletter.lacoste.com/re?l=D0I93v2olI2of90jpItI93gesr&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;9&quot; border=&quot;0&quot; height=&quot;62&quot; src=&quot;http://newsletter.lacoste.com/imgproxy/img/636488111/shoes-fr-redim-11.jpg&quot; style=&quot;display:block;margin:0&quot; width=&quot;27&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n						&lt;td&gt;&lt;a href=&quot;http://newsletter.lacoste.com/re?l=D0I93v2olI2of90jpIuI93gesr&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;9.5&quot; border=&quot;0&quot; height=&quot;62&quot; src=&quot;http://newsletter.lacoste.com/imgproxy/img/636488112/shoes-fr-redim-12.jpg&quot; style=&quot;display:block;margin:0&quot; width=&quot;27&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n						&lt;td&gt;&lt;a href=&quot;http://newsletter.lacoste.com/re?l=D0I93v2olI2of90jpIvI93gesr&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;10&quot; border=&quot;0&quot; height=&quot;62&quot; src=&quot;http://newsletter.lacoste.com/imgproxy/img/636488113/shoes-fr-redim-13.jpg&quot; style=&quot;display:block;margin:0&quot; width=&quot;27&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n						&lt;td&gt;&lt;a href=&quot;http://newsletter.lacoste.com/re?l=D0I93v2olI2of90jpIwI93gesr&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;10.5&quot; border=&quot;0&quot; height=&quot;62&quot; src=&quot;http://newsletter.lacoste.com/imgproxy/img/636488114/shoes-fr-redim-14.jpg&quot; style=&quot;display:block;margin:0&quot; width=&quot;27&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n						&lt;td&gt;&lt;a href=&quot;http://newsletter.lacoste.com/re?l=D0I93v2olI2of90jpIxI93gesr&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;11&quot; border=&quot;0&quot; height=&quot;62&quot; src=&quot;http://newsletter.lacoste.com/imgproxy/img/636488115/shoes-fr-redim-15.jpg&quot; style=&quot;display:block;margin:0&quot; width=&quot;27&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n						&lt;td&gt;&lt;a href=&quot;http://newsletter.lacoste.com/re?l=D0I93v2olI2of90jpIyI93gesr&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;11.5&quot; border=&quot;0&quot; height=&quot;62&quot; src=&quot;http://newsletter.lacoste.com/imgproxy/img/636488116/shoes-fr-redim-16.jpg&quot; style=&quot;display:block;margin:0&quot; width=&quot;27&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n						&lt;td&gt;&lt;a href=&quot;http://newsletter.lacoste.com/re?l=D0I93v2olI2of90jpIzI93gesr&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;12&quot; border=&quot;0&quot; height=&quot;62&quot; src=&quot;http://newsletter.lacoste.com/imgproxy/img/636488117/shoes-fr-redim-17.jpg&quot; style=&quot;display:block;margin:0&quot; width=&quot;41&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n						&lt;td&gt;&lt;a href=&quot;http://newsletter.lacoste.com/re?l=D0I93v2olI2of90jpI10I93gesr&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;3&quot; border=&quot;0&quot; height=&quot;62&quot; src=&quot;http://newsletter.lacoste.com/imgproxy/img/636488118/shoes-fr-redim-18.jpg&quot; style=&quot;display:block;margin:0&quot; width=&quot;44&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n						&lt;td&gt;&lt;a href=&quot;http://newsletter.lacoste.com/re?l=D0I93v2olI2of90jpI11I93gesr&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;3.5&quot; border=&quot;0&quot; height=&quot;62&quot; src=&quot;http://newsletter.lacoste.com/imgproxy/img/636488119/shoes-fr-redim-19.jpg&quot; style=&quot;display:block;margin:0&quot; width=&quot;27&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n						&lt;td&gt;&lt;a href=&quot;http://newsletter.lacoste.com/re?l=D0I93v2olI2of90jpI12I93gesr&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;4&quot; border=&quot;0&quot; height=&quot;62&quot; src=&quot;http://newsletter.lacoste.com/imgproxy/img/636488120/shoes-fr-redim-20.jpg&quot; style=&quot;display:block;margin:0&quot; width=&quot;27&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n						&lt;td&gt;&lt;a href=&quot;http://newsletter.lacoste.com/re?l=D0I93v2olI2of90jpI13I93gesr&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;4.5&quot; border=&quot;0&quot; height=&quot;62&quot; src=&quot;http://newsletter.lacoste.com/imgproxy/img/636488121/shoes-fr-redim-21.jpg&quot; style=&quot;display:block;margin:0&quot; width=&quot;26&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n						&lt;td&gt;&lt;a href=&quot;http://newsletter.lacoste.com/re?l=D0I93v2olI2of90jpI14I93gesr&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;5&quot; border=&quot;0&quot; height=&quot;62&quot; src=&quot;http://newsletter.lacoste.com/imgproxy/img/636488122/shoes-fr-redim-22.jpg&quot; style=&quot;display:block;margin:0&quot; width=&quot;27&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n						&lt;td&gt;&lt;a href=&quot;http://newsletter.lacoste.com/re?l=D0I93v2olI2of90jpI15I93gesr&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;5.5&quot; border=&quot;0&quot; height=&quot;62&quot; src=&quot;http://newsletter.lacoste.com/imgproxy/img/636488123/shoes-fr-redim-23.jpg&quot; style=&quot;display:block;margin:0&quot; width=&quot;28&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n						&lt;td&gt;&lt;a href=&quot;http://newsletter.lacoste.com/re?l=D0I93v2olI2of90jpI16I93gesr&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;6&quot; border=&quot;0&quot; height=&quot;62&quot; src=&quot;http://newsletter.lacoste.com/imgproxy/img/636488124/shoes-fr-redim-24.jpg&quot; style=&quot;display:block;margin:0&quot; width=&quot;27&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n						&lt;td&gt;&lt;a href=&quot;http://newsletter.lacoste.com/re?l=D0I93v2olI2of90jpI17I93gesr&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;6.5&quot; border=&quot;0&quot; height=&quot;62&quot; src=&quot;http://newsletter.lacoste.com/imgproxy/img/636488125/shoes-fr-redim-25.jpg&quot; style=&quot;display:block;margin:0&quot; width=&quot;27&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n						&lt;td&gt;&lt;a href=&quot;http://newsletter.lacoste.com/re?l=D0I93v2olI2of90jpI18I93gesr&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;7&quot; border=&quot;0&quot; height=&quot;62&quot; src=&quot;http://newsletter.lacoste.com/imgproxy/img/636488126/shoes-fr-redim-26.jpg&quot; style=&quot;display:block;margin:0&quot; width=&quot;27&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n						&lt;td&gt;&lt;a href=&quot;http://newsletter.lacoste.com/re?l=D0I93v2olI2of90jpI19I93gesr&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;7.5&quot; border=&quot;0&quot; height=&quot;62&quot; src=&quot;http://newsletter.lacoste.com/imgproxy/img/636488127/shoes-fr-redim-27.jpg&quot; style=&quot;display:block;margin:0&quot; width=&quot;27&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n						&lt;td&gt;&lt;a href=&quot;http://newsletter.lacoste.com/re?l=D0I93v2olI2of90jpI1aI93gesr&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;8&quot; border=&quot;0&quot; height=&quot;62&quot; src=&quot;http://newsletter.lacoste.com/imgproxy/img/636488128/shoes-fr-redim-28.jpg&quot; style=&quot;display:block;margin:0&quot; width=&quot;38&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n					&lt;/tr&gt;\r\n					&lt;tr&gt;\r\n						&lt;td colspan=&quot;24&quot;&gt;&lt;a href=&quot;http://newsletter.lacoste.com/re?l=D0I93v2olI2of90jpI1bI93gesr&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;sale shoes for children&quot; border=&quot;0&quot; height=&quot;153&quot; src=&quot;http://newsletter.lacoste.com/imgproxy/img/636488129/shoes-fr-redim-29.jpg&quot; style=&quot;display:block;margin:0&quot; width=&quot;700&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n					&lt;/tr&gt;\r\n				&lt;/tbody&gt;\r\n			&lt;/table&gt;\r\n			&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n	&lt;/tbody&gt;\r\n&lt;/table&gt;\r\n\r\n&lt;table align=&quot;center&quot; border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; height=&quot;75&quot; width=&quot;700&quot;&gt;\r\n	&lt;tbody&gt;\r\n		&lt;tr&gt;\r\n			&lt;td colspan=&quot;4&quot; height=&quot;22&quot; width=&quot;700&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td height=&quot;42&quot; width=&quot;214&quot;&gt;&lt;a href=&quot;http://newsletter.lacoste.com/re?l=D0I93v2olI2of90jpI1cI93gesr&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;Free standard delivery&quot; border=&quot;0&quot; src=&quot;http://newsletter.lacoste.com/imgproxy/img/636488130/newsletter.jpg&quot; style=&quot;display:block&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n			&lt;td height=&quot;42&quot; width=&quot;182&quot;&gt;&lt;a href=&quot;http://newsletter.lacoste.com/re?l=D0I93v2olI2of90jpI1dI93gesr&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;Next day delivery&quot; border=&quot;0&quot; src=&quot;http://newsletter.lacoste.com/imgproxy/img/636488131/express.jpg&quot; style=&quot;display:block&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n			&lt;td height=&quot;42&quot; width=&quot;160&quot;&gt;&lt;a href=&quot;http://newsletter.lacoste.com/re?l=D0I93v2olI2of90jpI1eI93gesr&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;Free and easy returns&quot; border=&quot;0&quot; src=&quot;http://newsletter.lacoste.com/imgproxy/img/636488132/retours.jpg&quot; style=&quot;display:block&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n			&lt;td height=&quot;42&quot; width=&quot;144&quot;&gt;&lt;a href=&quot;http://newsletter.lacoste.com/re?l=D0I93v2olI2of90jpI1fI93gesr&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;Secure payment&quot; border=&quot;0&quot; src=&quot;http://newsletter.lacoste.com/imgproxy/img/636488133/paiement.jpg&quot; style=&quot;display:block&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td colspan=&quot;4&quot; height=&quot;35&quot; width=&quot;700&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td colspan=&quot;4&quot; height=&quot;1&quot; style=&quot;background-color:#c6c6c6&quot; width=&quot;700&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n	&lt;/tbody&gt;\r\n&lt;/table&gt;\r\n\r\n&lt;table align=&quot;center&quot; border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; height=&quot;101&quot; width=&quot;700&quot;&gt;\r\n	&lt;tbody&gt;\r\n		&lt;tr&gt;\r\n			&lt;td colspan=&quot;2&quot; height=&quot;23&quot; width=&quot;236&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n			&lt;td colspan=&quot;4&quot; height=&quot;23&quot; width=&quot;212&quot;&gt;&lt;img alt=&quot;Follow us&quot; src=&quot;http://newsletter.lacoste.com/imgproxy/img/636488134/rejoignez.jpg&quot; style=&quot;display:block&quot; /&gt;&lt;/td&gt;\r\n			&lt;td colspan=&quot;2&quot; height=&quot;23&quot; width=&quot;252&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td height=&quot;63&quot; width=&quot;195&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n			&lt;td height=&quot;63&quot; width=&quot;41&quot;&gt;&lt;a href=&quot;http://newsletter.lacoste.com/re?l=D0I93v2olI2of90jpI1gI93gesr&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;google+&quot; border=&quot;0&quot; src=&quot;http://newsletter.lacoste.com/imgproxy/img/636488135/google.jpg&quot; style=&quot;display:block&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n			&lt;td height=&quot;63&quot; width=&quot;48&quot;&gt;&lt;a href=&quot;http://newsletter.lacoste.com/re?l=D0I93v2olI2of90jpI1hI93gesr&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;facebook&quot; border=&quot;0&quot; src=&quot;http://newsletter.lacoste.com/imgproxy/img/636488136/facebook.jpg&quot; style=&quot;display:block&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n			&lt;td height=&quot;63&quot; width=&quot;53&quot;&gt;&lt;a href=&quot;http://newsletter.lacoste.com/re?l=D0I93v2olI2of90jpI1iI93gesr&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;youtube&quot; border=&quot;0&quot; src=&quot;http://newsletter.lacoste.com/imgproxy/img/636488137/youtube.jpg&quot; style=&quot;display:block&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n			&lt;td height=&quot;63&quot; width=&quot;68&quot;&gt;&lt;a href=&quot;http://newsletter.lacoste.com/re?l=D0I93v2olI2of90jpI1jI93gesr&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;itunes&quot; border=&quot;0&quot; src=&quot;http://newsletter.lacoste.com/imgproxy/img/636488138/itunes.jpg&quot; style=&quot;display:block&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n			&lt;td height=&quot;63&quot; width=&quot;43&quot;&gt;&lt;a href=&quot;http://newsletter.lacoste.com/re?l=D0I93v2olI2of90jpI1kI93gesr&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;pinterest&quot; border=&quot;0&quot; src=&quot;http://newsletter.lacoste.com/imgproxy/img/636488139/pinterest.jpg&quot; style=&quot;display:block&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n			&lt;td height=&quot;63&quot; width=&quot;50&quot;&gt;&lt;a href=&quot;http://newsletter.lacoste.com/re?l=D0I93v2olI2of90jpI1lI93gesr&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;tumblr&quot; border=&quot;0&quot; src=&quot;http://newsletter.lacoste.com/imgproxy/img/636488140/tumblr.jpg&quot; style=&quot;display:block&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n			&lt;td height=&quot;23&quot; width=&quot;202&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n	&lt;/tbody&gt;\r\n&lt;/table&gt;\r\n\r\n&lt;table align=&quot;center&quot; border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; width=&quot;700&quot;&gt;\r\n	&lt;tbody&gt;\r\n		&lt;tr&gt;\r\n			&lt;td align=&quot;center&quot; height=&quot;100&quot; style=&quot;font-family:Arial,Helvetica,sans-serif;font-size:9px;color:#726f6b;text-align:center&quot; valign=&quot;middle&quot;&gt;In accordance with the UK Data Protection Act 1998 we hereby specify that LACOSTE S.A. (8 rue de Castiglione, 75001 Paris, France) registered with the Information Commission (French CNIL) under registration no 1431933 as a Data Controller, and Devanlay E-commerce located at 92 rue Réaumur-75002 Paris, France, Lacoste are the sole recipient of the information sent via electronic mail. You have a right to access, correct and delete your personal data by contacting us by electronic mail at &lt;a href=&quot;mailto:service@shop-uk.lacoste.com&quot; target=&quot;_blank&quot;&gt;service@shop-uk.lacoste.com&lt;/a&gt;.&lt;br /&gt;\r\n			If you wish to unsubscribe from our newsletter, please click &lt;a href=&quot;http://newsletter.lacoste.com/public/unsubscribe.jsp?gid=550003184&amp;amp;uid=5830367749&amp;amp;mid=550684245&amp;amp;sig=HNIADJMBGDIOCLCP&amp;amp;st=0&quot; style=&quot;text-decoration:underline;color:#726f6b&quot; target=&quot;_blank&quot;&gt;here&lt;/a&gt;.&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n	&lt;/tbody&gt;\r\n&lt;/table&gt;\r\n&lt;img height=&quot;1&quot; src=&quot;http://newsletter.lacoste.com/ev/co/lacoste?eventid=550000107&amp;amp;mid=550684245&amp;amp;uid=5830367749&quot; width=&quot;1&quot; /&gt; &lt;img height=&quot;1&quot; src=&quot;http://newsletter.lacoste.com/tr/p.gif?uid=5830367749&amp;amp;mid=550684245&amp;amp;msd=1373788843359&amp;amp;st=0&quot; width=&quot;1&quot; /&gt;&lt;/div&gt;\r\n', '', '');
INSERT INTO `news_description` (`news_id`, `language_id`, `name`, `short_description`, `description`, `meta_description`, `meta_keyword`) VALUES
(13, 2, 'PUMA - Giảm giá rồi !', '', '&lt;table align=&quot;center&quot; border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; width=&quot;700&quot;&gt;\r\n	&lt;tbody&gt;\r\n		&lt;tr&gt;\r\n			&lt;td align=&quot;center&quot; height=&quot;25&quot; style=&quot;font-family:Arial,Helvetica,sans-serif;font-size:11px;color:#8c8c8c;line-height:20px&quot; valign=&quot;middle&quot; width=&quot;700&quot;&gt;If you are unable to see the message below, click &lt;a href=&quot;http://email-eu.puma.com/a/hBR4miTB8dSpHB8z2n1AAMtVctP/link2b-0?t_params=EMAIL%3Dwelookvn%2540gmail.com%26PASSWORD%3DB8dSpHAAMtVcBR4miTC9EMX3gAVTDu%26SOURCES%3DEURegister&quot; style=&quot;text-decoration:none;color:#8c8c8c&quot; target=&quot;_blank&quot;&gt;&lt;strong&gt;here&lt;/strong&gt;&lt;/a&gt; to view.&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td&gt;&lt;img alt=&quot;&quot; border=&quot;0&quot; height=&quot;14&quot; src=&quot;http://f.email-eu.puma.com/i/12/2087752692/2013_02_puma_new_arrivals_en_r1_c1.jpg&quot; style=&quot;display:block&quot; width=&quot;700&quot; /&gt;&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td&gt;\r\n			&lt;table align=&quot;left&quot; border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; width=&quot;700&quot;&gt;\r\n				&lt;tbody&gt;\r\n					&lt;tr&gt;\r\n						&lt;td&gt;&lt;img alt=&quot;&quot; border=&quot;0&quot; height=&quot;109&quot; src=&quot;http://f.email-eu.puma.com/i/12/2087752692/2013_02_puma_new_arrivals_en_r2_c1.jpg&quot; style=&quot;display:block&quot; width=&quot;12&quot; /&gt;&lt;/td&gt;\r\n						&lt;td&gt;\r\n						&lt;table align=&quot;left&quot; border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; width=&quot;99&quot;&gt;\r\n							&lt;tbody&gt;\r\n								&lt;tr&gt;\r\n									&lt;td&gt;&lt;img alt=&quot;&quot; border=&quot;0&quot; height=&quot;35&quot; src=&quot;http://f.email-eu.puma.com/i/12/2087752692/2013_02_puma_new_arrivals_en_r2_c2.jpg&quot; style=&quot;display:block&quot; width=&quot;99&quot; /&gt;&lt;/td&gt;\r\n								&lt;/tr&gt;\r\n								&lt;tr&gt;\r\n									&lt;td bgcolor=&quot;#FD2A19&quot;&gt;&lt;a href=&quot;http://email-eu.puma.com/a/hBR4miTB8dSpHB8z2n1AAMtVctP/link25-0&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;&quot; border=&quot;0&quot; height=&quot;54&quot; src=&quot;http://f.email-eu.puma.com/i/12/2087752692/2013_02_puma_new_arrivals_en_r3_c2.jpg&quot; style=&quot;display:block&quot; width=&quot;99&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n								&lt;/tr&gt;\r\n								&lt;tr&gt;\r\n									&lt;td&gt;&lt;img alt=&quot;&quot; border=&quot;0&quot; height=&quot;20&quot; src=&quot;http://f.email-eu.puma.com/i/12/2087752692/2013_02_puma_new_arrivals_en_r5_c2.jpg&quot; style=&quot;display:block&quot; width=&quot;99&quot; /&gt;&lt;/td&gt;\r\n								&lt;/tr&gt;\r\n							&lt;/tbody&gt;\r\n						&lt;/table&gt;\r\n						&lt;/td&gt;\r\n						&lt;td&gt;\r\n						&lt;table align=&quot;left&quot; border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; width=&quot;577&quot;&gt;\r\n							&lt;tbody&gt;\r\n								&lt;tr&gt;\r\n									&lt;td&gt;\r\n									&lt;table align=&quot;left&quot; border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; width=&quot;577&quot;&gt;\r\n										&lt;tbody&gt;\r\n											&lt;tr&gt;\r\n												&lt;td&gt;&lt;img alt=&quot;&quot; border=&quot;0&quot; height=&quot;49&quot; src=&quot;http://f.email-eu.puma.com/i/12/2087752692/2013_02_puma_new_arrivals_en_r2_c5.jpg&quot; style=&quot;display:block&quot; width=&quot;509&quot; /&gt;&lt;/td&gt;\r\n												&lt;td bgcolor=&quot;#FD2A19&quot;&gt;&lt;a href=&quot;http://email-eu.puma.com/a/hBR4miTB8dSpHB8z2n1AAMtVctP/link25a-0&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;PUMA&quot; border=&quot;0&quot; height=&quot;49&quot; src=&quot;http://f.email-eu.puma.com/i/12/2087752692/2013_02_puma_new_arrivals_en_r2_c22.jpg&quot; style=&quot;display:block&quot; title=&quot;PUMA&quot; width=&quot;68&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n											&lt;/tr&gt;\r\n										&lt;/tbody&gt;\r\n									&lt;/table&gt;\r\n									&lt;/td&gt;\r\n								&lt;/tr&gt;\r\n								&lt;tr&gt;\r\n									&lt;td bgcolor=&quot;#000000&quot;&gt;\r\n									&lt;table align=&quot;left&quot; border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; width=&quot;577&quot;&gt;\r\n										&lt;tbody&gt;\r\n											&lt;tr&gt;\r\n												&lt;td&gt;&lt;a href=&quot;http://email-eu.puma.com/a/hBR4miTB8dSpHB8z2n1AAMtVctP/link5-0&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;MEN&quot; border=&quot;0&quot; height=&quot;40&quot; src=&quot;http://f.email-eu.puma.com/i/12/2087752692/2013_02_puma_new_arrivals_en_r4_c5.jpg&quot; style=&quot;display:block&quot; title=&quot;MEN&quot; width=&quot;57&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n												&lt;td&gt;&lt;a href=&quot;http://email-eu.puma.com/a/hBR4miTB8dSpHB8z2n1AAMtVctP/link4-0&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;WOMEN&quot; border=&quot;0&quot; height=&quot;40&quot; src=&quot;http://f.email-eu.puma.com/i/12/2087752692/2013_02_puma_new_arrivals_en_r4_c7.jpg&quot; style=&quot;display:block&quot; title=&quot;WOMEN&quot; width=&quot;68&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n												&lt;td&gt;&lt;a href=&quot;http://email-eu.puma.com/a/hBR4miTB8dSpHB8z2n1AAMtVctP/link6-0&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;KIDS&quot; border=&quot;0&quot; height=&quot;40&quot; src=&quot;http://f.email-eu.puma.com/i/12/2087752692/2013_02_puma_new_arrivals_en_r4_c11.jpg&quot; style=&quot;display:block&quot; title=&quot;KIDS&quot; width=&quot;50&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n												&lt;td&gt;&lt;a href=&quot;http://email-eu.puma.com/a/hBR4miTB8dSpHB8z2n1AAMtVctP/link23-0&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;SPORT&quot; border=&quot;0&quot; height=&quot;40&quot; src=&quot;http://f.email-eu.puma.com/i/12/2087752692/2013_02_puma_new_arrivals_en_r4_c12.jpg&quot; style=&quot;display:block&quot; title=&quot;SPORT&quot; width=&quot;63&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n												&lt;td&gt;&lt;a href=&quot;http://email-eu.puma.com/a/hBR4miTB8dSpHB8z2n1AAMtVctP/link24-0&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;COLLECTIONS&quot; border=&quot;0&quot; height=&quot;40&quot; src=&quot;http://f.email-eu.puma.com/i/12/2087752692/2013_02_puma_new_arrivals_en_r4_c14.jpg&quot; style=&quot;display:block&quot; title=&quot;COLLECTIONS&quot; width=&quot;104&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n												&lt;td&gt;&lt;a href=&quot;http://email-eu.puma.com/a/hBR4miTB8dSpHB8z2n1AAMtVctP/link7b-0&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;SALE&quot; border=&quot;0&quot; height=&quot;40&quot; src=&quot;http://f.email-eu.puma.com/i/12/2087752692/2013_02_puma_new_arrivals_en_x.jpg&quot; style=&quot;display:block&quot; title=&quot;SALE&quot; width=&quot;57&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n												&lt;td width=&quot;110&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n												&lt;td&gt;&lt;img alt=&quot;&quot; border=&quot;0&quot; height=&quot;40&quot; src=&quot;http://f.email-eu.puma.com/i/12/2087752692/2013_02_puma_new_arrivals_en_r4_c22.jpg&quot; style=&quot;display:block&quot; width=&quot;68&quot; /&gt;&lt;/td&gt;\r\n											&lt;/tr&gt;\r\n										&lt;/tbody&gt;\r\n									&lt;/table&gt;\r\n									&lt;/td&gt;\r\n								&lt;/tr&gt;\r\n								&lt;tr&gt;\r\n									&lt;td&gt;&lt;img alt=&quot;&quot; border=&quot;0&quot; height=&quot;20&quot; src=&quot;http://f.email-eu.puma.com/i/12/2087752692/2013_02_puma_new_arrivals_en_r5_c5.jpg&quot; style=&quot;display:block&quot; width=&quot;577&quot; /&gt;&lt;/td&gt;\r\n								&lt;/tr&gt;\r\n							&lt;/tbody&gt;\r\n						&lt;/table&gt;\r\n						&lt;/td&gt;\r\n						&lt;td&gt;&lt;img alt=&quot;&quot; border=&quot;0&quot; height=&quot;109&quot; src=&quot;http://f.email-eu.puma.com/i/12/2087752692/2013_02_puma_new_arrivals_en_r2_c24.jpg&quot; style=&quot;display:block&quot; width=&quot;12&quot; /&gt;&lt;/td&gt;\r\n					&lt;/tr&gt;\r\n				&lt;/tbody&gt;\r\n			&lt;/table&gt;\r\n			&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td&gt;\r\n			&lt;table align=&quot;left&quot; border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; width=&quot;700&quot;&gt;\r\n				&lt;tbody&gt;\r\n					&lt;tr&gt;\r\n						&lt;td&gt;&lt;img alt=&quot;&quot; border=&quot;0&quot; height=&quot;416&quot; name=&quot;13fdc6dd3af14e74_puma_eos_summer_sale_reminder_en_2013_07_r2_c1&quot; src=&quot;http://f.email-eu.puma.com/i/12/2087752692/puma_eos_summer_sale_reminder_en_2013_07_r2_c1.jpg&quot; style=&quot;display:block&quot; width=&quot;12&quot; /&gt;&lt;/td&gt;\r\n						&lt;td bgcolor=&quot;#B61E1D&quot;&gt;\r\n						&lt;table align=&quot;left&quot; border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; width=&quot;676&quot;&gt;\r\n							&lt;tbody&gt;\r\n								&lt;tr&gt;\r\n									&lt;td&gt;&lt;img alt=&quot;&quot; border=&quot;0&quot; height=&quot;25&quot; name=&quot;13fdc6dd3af14e74_puma_eos_summer_sale_reminder_en_2013_07_r2_c2&quot; src=&quot;http://f.email-eu.puma.com/i/12/2087752692/puma_eos_summer_sale_reminder_en_2013_07_r2_c2.jpg&quot; style=&quot;display:block&quot; width=&quot;676&quot; /&gt;&lt;/td&gt;\r\n								&lt;/tr&gt;\r\n								&lt;tr&gt;\r\n									&lt;td&gt;\r\n									&lt;table align=&quot;left&quot; border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; width=&quot;676&quot;&gt;\r\n										&lt;tbody&gt;\r\n											&lt;tr&gt;\r\n												&lt;td&gt;&lt;img alt=&quot;&quot; border=&quot;0&quot; height=&quot;196&quot; name=&quot;13fdc6dd3af14e74_puma_eos_summer_sale_reminder_en_2013_07_r3_c2&quot; src=&quot;http://f.email-eu.puma.com/i/12/2087752692/puma_eos_summer_sale_reminder_en_2013_07_r3_c2.jpg&quot; style=&quot;display:block&quot; width=&quot;65&quot; /&gt;&lt;/td&gt;\r\n												&lt;td&gt;&lt;a href=&quot;http://email-eu.puma.com/a/hBR4miTB8dSpHB8z2n1AAMtVctP/link7c-0&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;SUMMER SALE MORE STYLES ADDED Up to -50% Off!&quot; border=&quot;0&quot; height=&quot;196&quot; name=&quot;13fdc6dd3af14e74_puma_eos_summer_sale_reminder_en_2013_07_r3_c3&quot; src=&quot;http://f.email-eu.puma.com/i/12/2087752692/puma_eos_summer_sale_reminder_en_2013_07_r3_c3.jpg&quot; style=&quot;display:block&quot; title=&quot;SUMMER SALE MORE STYLES ADDED Up to -50% Off!&quot; width=&quot;540&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n												&lt;td&gt;&lt;img alt=&quot;&quot; border=&quot;0&quot; height=&quot;196&quot; name=&quot;13fdc6dd3af14e74_puma_eos_summer_sale_reminder_en_2013_07_r3_c10&quot; src=&quot;http://f.email-eu.puma.com/i/12/2087752692/puma_eos_summer_sale_reminder_en_2013_07_r3_c10.jpg&quot; style=&quot;display:block&quot; width=&quot;71&quot; /&gt;&lt;/td&gt;\r\n											&lt;/tr&gt;\r\n										&lt;/tbody&gt;\r\n									&lt;/table&gt;\r\n									&lt;/td&gt;\r\n								&lt;/tr&gt;\r\n								&lt;tr&gt;\r\n									&lt;td&gt;&lt;img alt=&quot;&quot; border=&quot;0&quot; height=&quot;30&quot; name=&quot;13fdc6dd3af14e74_puma_eos_summer_sale_reminder_en_2013_07_r4_c2&quot; src=&quot;http://f.email-eu.puma.com/i/12/2087752692/puma_eos_summer_sale_reminder_en_2013_07_r4_c2.jpg&quot; style=&quot;display:block&quot; width=&quot;676&quot; /&gt;&lt;/td&gt;\r\n								&lt;/tr&gt;\r\n								&lt;tr&gt;\r\n									&lt;td&gt;\r\n									&lt;table align=&quot;left&quot; border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; width=&quot;676&quot;&gt;\r\n										&lt;tbody&gt;\r\n											&lt;tr&gt;\r\n												&lt;td&gt;&lt;img alt=&quot;&quot; border=&quot;0&quot; height=&quot;165&quot; name=&quot;13fdc6dd3af14e74_puma_eos_summer_sale_reminder_en_2013_07_r5_c2&quot; src=&quot;http://f.email-eu.puma.com/i/12/2087752692/puma_eos_summer_sale_reminder_en_2013_07_r5_c2.jpg&quot; style=&quot;display:block&quot; width=&quot;83&quot; /&gt;&lt;/td&gt;\r\n												&lt;td&gt;\r\n												&lt;table align=&quot;left&quot; border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; width=&quot;136&quot;&gt;\r\n													&lt;tbody&gt;\r\n														&lt;tr&gt;\r\n															&lt;td bgcolor=&quot;#FEFEFE&quot;&gt;&lt;a href=&quot;http://email-eu.puma.com/a/hBR4miTB8dSpHB8z2n1AAMtVctP/link13b-0&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;SHOP MENS &amp;gt;&quot; border=&quot;0&quot; height=&quot;38&quot; name=&quot;13fdc6dd3af14e74_puma_eos_summer_sale_reminder_en_2013_07_r5_c4&quot; src=&quot;http://f.email-eu.puma.com/i/12/2087752692/puma_eos_summer_sale_reminder_en_2013_07_r5_c4.jpg&quot; style=&quot;display:block&quot; title=&quot;SHOP MENS &amp;gt;&quot; width=&quot;136&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n														&lt;/tr&gt;\r\n														&lt;tr&gt;\r\n															&lt;td&gt;&lt;img alt=&quot;&quot; border=&quot;0&quot; height=&quot;11&quot; name=&quot;13fdc6dd3af14e74_puma_eos_summer_sale_reminder_en_2013_07_r6_c4&quot; src=&quot;http://f.email-eu.puma.com/i/12/2087752692/puma_eos_summer_sale_reminder_en_2013_07_r6_c4.jpg&quot; style=&quot;display:block&quot; width=&quot;136&quot; /&gt;&lt;/td&gt;\r\n														&lt;/tr&gt;\r\n														&lt;tr&gt;\r\n															&lt;td&gt;&lt;a href=&quot;http://email-eu.puma.com/a/hBR4miTB8dSpHB8z2n1AAMtVctP/link14b-0&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;Shoes&quot; border=&quot;0&quot; height=&quot;27&quot; name=&quot;13fdc6dd3af14e74_puma_eos_summer_sale_reminder_en_2013_07_r7_c4&quot; src=&quot;http://f.email-eu.puma.com/i/12/2087752692/puma_eos_summer_sale_reminder_en_2013_07_r7_c4.jpg&quot; style=&quot;display:block&quot; title=&quot;Shoes&quot; width=&quot;136&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n														&lt;/tr&gt;\r\n														&lt;tr&gt;\r\n															&lt;td&gt;&lt;a href=&quot;http://email-eu.puma.com/a/hBR4miTB8dSpHB8z2n1AAMtVctP/link15b-0&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;Clothing&quot; border=&quot;0&quot; height=&quot;25&quot; name=&quot;13fdc6dd3af14e74_puma_eos_summer_sale_reminder_en_2013_07_r8_c4&quot; src=&quot;http://f.email-eu.puma.com/i/12/2087752692/puma_eos_summer_sale_reminder_en_2013_07_r8_c4.jpg&quot; style=&quot;display:block&quot; title=&quot;Clothing&quot; width=&quot;136&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n														&lt;/tr&gt;\r\n														&lt;tr&gt;\r\n															&lt;td&gt;&lt;a href=&quot;http://email-eu.puma.com/a/hBR4miTB8dSpHB8z2n1AAMtVctP/link16b-0&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;Accessories&quot; border=&quot;0&quot; height=&quot;25&quot; name=&quot;13fdc6dd3af14e74_puma_eos_summer_sale_reminder_en_2013_07_r9_c4&quot; src=&quot;http://f.email-eu.puma.com/i/12/2087752692/puma_eos_summer_sale_reminder_en_2013_07_r9_c4.jpg&quot; style=&quot;display:block&quot; title=&quot;Accessories&quot; width=&quot;136&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n														&lt;/tr&gt;\r\n														&lt;tr&gt;\r\n															&lt;td&gt;&lt;a href=&quot;http://email-eu.puma.com/a/hBR4miTB8dSpHB8z2n1AAMtVctP/link17b-0&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;Sport&quot; border=&quot;0&quot; height=&quot;25&quot; name=&quot;13fdc6dd3af14e74_puma_eos_summer_sale_reminder_en_2013_07_r10_c4&quot; src=&quot;http://f.email-eu.puma.com/i/12/2087752692/puma_eos_summer_sale_reminder_en_2013_07_r10_c4.jpg&quot; style=&quot;display:block&quot; title=&quot;Sport&quot; width=&quot;136&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n														&lt;/tr&gt;\r\n														&lt;tr&gt;\r\n															&lt;td&gt;&lt;img alt=&quot;&quot; border=&quot;0&quot; height=&quot;14&quot; name=&quot;13fdc6dd3af14e74_puma_eos_summer_sale_reminder_en_2013_07_r11_c4&quot; src=&quot;http://f.email-eu.puma.com/i/12/2087752692/puma_eos_summer_sale_reminder_en_2013_07_r11_c4.jpg&quot; style=&quot;display:block&quot; width=&quot;136&quot; /&gt;&lt;/td&gt;\r\n														&lt;/tr&gt;\r\n													&lt;/tbody&gt;\r\n												&lt;/table&gt;\r\n												&lt;/td&gt;\r\n												&lt;td&gt;&lt;img alt=&quot;&quot; border=&quot;0&quot; height=&quot;165&quot; name=&quot;13fdc6dd3af14e74_puma_eos_summer_sale_reminder_en_2013_07_r5_c5&quot; src=&quot;http://f.email-eu.puma.com/i/12/2087752692/puma_eos_summer_sale_reminder_en_2013_07_r5_c5.jpg&quot; style=&quot;display:block&quot; width=&quot;49&quot; /&gt;&lt;/td&gt;\r\n												&lt;td&gt;\r\n												&lt;table align=&quot;left&quot; border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; width=&quot;137&quot;&gt;\r\n													&lt;tbody&gt;\r\n														&lt;tr&gt;\r\n															&lt;td bgcolor=&quot;#FEFEFE&quot;&gt;&lt;a href=&quot;http://email-eu.puma.com/a/hBR4miTB8dSpHB8z2n1AAMtVctP/link8b-0&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;SHOP WOMENS &amp;gt;&quot; border=&quot;0&quot; height=&quot;38&quot; name=&quot;13fdc6dd3af14e74_puma_eos_summer_sale_reminder_en_2013_07_r5_c6&quot; src=&quot;http://f.email-eu.puma.com/i/12/2087752692/puma_eos_summer_sale_reminder_en_2013_07_r5_c6.jpg&quot; style=&quot;display:block&quot; title=&quot;SHOP WOMENS &amp;gt;&quot; width=&quot;137&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n														&lt;/tr&gt;\r\n														&lt;tr&gt;\r\n															&lt;td&gt;&lt;img alt=&quot;&quot; border=&quot;0&quot; height=&quot;11&quot; name=&quot;13fdc6dd3af14e74_puma_eos_summer_sale_reminder_en_2013_07_r6_c6&quot; src=&quot;http://f.email-eu.puma.com/i/12/2087752692/puma_eos_summer_sale_reminder_en_2013_07_r6_c6.jpg&quot; style=&quot;display:block&quot; width=&quot;137&quot; /&gt;&lt;/td&gt;\r\n														&lt;/tr&gt;\r\n														&lt;tr&gt;\r\n															&lt;td&gt;&lt;a href=&quot;http://email-eu.puma.com/a/hBR4miTB8dSpHB8z2n1AAMtVctP/link9a-0&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;Shoes&quot; border=&quot;0&quot; height=&quot;27&quot; name=&quot;13fdc6dd3af14e74_puma_eos_summer_sale_reminder_en_2013_07_r7_c6&quot; src=&quot;http://f.email-eu.puma.com/i/12/2087752692/puma_eos_summer_sale_reminder_en_2013_07_r7_c6.jpg&quot; style=&quot;display:block&quot; title=&quot;Shoes&quot; width=&quot;137&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n														&lt;/tr&gt;\r\n														&lt;tr&gt;\r\n															&lt;td&gt;&lt;a href=&quot;http://email-eu.puma.com/a/hBR4miTB8dSpHB8z2n1AAMtVctP/link10b-0&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;Clothing&quot; border=&quot;0&quot; height=&quot;25&quot; name=&quot;13fdc6dd3af14e74_puma_eos_summer_sale_reminder_en_2013_07_r8_c6&quot; src=&quot;http://f.email-eu.puma.com/i/12/2087752692/puma_eos_summer_sale_reminder_en_2013_07_r8_c6.jpg&quot; style=&quot;display:block&quot; title=&quot;Clothing&quot; width=&quot;137&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n														&lt;/tr&gt;\r\n														&lt;tr&gt;\r\n															&lt;td&gt;&lt;a href=&quot;http://email-eu.puma.com/a/hBR4miTB8dSpHB8z2n1AAMtVctP/link11b-0&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;Accessories&quot; border=&quot;0&quot; height=&quot;25&quot; name=&quot;13fdc6dd3af14e74_puma_eos_summer_sale_reminder_en_2013_07_r9_c6&quot; src=&quot;http://f.email-eu.puma.com/i/12/2087752692/puma_eos_summer_sale_reminder_en_2013_07_r9_c6.jpg&quot; style=&quot;display:block&quot; title=&quot;Accessories&quot; width=&quot;137&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n														&lt;/tr&gt;\r\n														&lt;tr&gt;\r\n															&lt;td&gt;&lt;a href=&quot;http://email-eu.puma.com/a/hBR4miTB8dSpHB8z2n1AAMtVctP/link12b-0&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;Sport&quot; border=&quot;0&quot; height=&quot;25&quot; name=&quot;13fdc6dd3af14e74_puma_eos_summer_sale_reminder_en_2013_07_r10_c6&quot; src=&quot;http://f.email-eu.puma.com/i/12/2087752692/puma_eos_summer_sale_reminder_en_2013_07_r10_c6.jpg&quot; style=&quot;display:block&quot; title=&quot;Sport&quot; width=&quot;137&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n														&lt;/tr&gt;\r\n														&lt;tr&gt;\r\n															&lt;td&gt;&lt;img alt=&quot;&quot; border=&quot;0&quot; height=&quot;14&quot; name=&quot;13fdc6dd3af14e74_puma_eos_summer_sale_reminder_en_2013_07_r11_c6&quot; src=&quot;http://f.email-eu.puma.com/i/12/2087752692/puma_eos_summer_sale_reminder_en_2013_07_r11_c6.jpg&quot; style=&quot;display:block&quot; width=&quot;137&quot; /&gt;&lt;/td&gt;\r\n														&lt;/tr&gt;\r\n													&lt;/tbody&gt;\r\n												&lt;/table&gt;\r\n												&lt;/td&gt;\r\n												&lt;td&gt;&lt;img alt=&quot;&quot; border=&quot;0&quot; height=&quot;165&quot; name=&quot;13fdc6dd3af14e74_puma_eos_summer_sale_reminder_en_2013_07_r5_c7&quot; src=&quot;http://f.email-eu.puma.com/i/12/2087752692/puma_eos_summer_sale_reminder_en_2013_07_r5_c7.jpg&quot; style=&quot;display:block&quot; width=&quot;48&quot; /&gt;&lt;/td&gt;\r\n												&lt;td&gt;\r\n												&lt;table align=&quot;left&quot; border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; width=&quot;137&quot;&gt;\r\n													&lt;tbody&gt;\r\n														&lt;tr&gt;\r\n															&lt;td bgcolor=&quot;#FEFEFE&quot;&gt;&lt;a href=&quot;http://email-eu.puma.com/a/hBR4miTB8dSpHB8z2n1AAMtVctP/link18b-0&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;SHOP KIDS'' &amp;gt;&quot; border=&quot;0&quot; height=&quot;38&quot; name=&quot;13fdc6dd3af14e74_puma_eos_summer_sale_reminder_en_2013_07_r5_c8&quot; src=&quot;http://f.email-eu.puma.com/i/12/2087752692/puma_eos_summer_sale_reminder_en_2013_07_r5_c8.jpg&quot; style=&quot;display:block&quot; title=&quot;SHOP KIDS'' &amp;gt;&quot; width=&quot;137&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n														&lt;/tr&gt;\r\n														&lt;tr&gt;\r\n															&lt;td&gt;&lt;img alt=&quot;&quot; border=&quot;0&quot; height=&quot;11&quot; name=&quot;13fdc6dd3af14e74_puma_eos_summer_sale_reminder_en_2013_07_r6_c8&quot; src=&quot;http://f.email-eu.puma.com/i/12/2087752692/puma_eos_summer_sale_reminder_en_2013_07_r6_c8.jpg&quot; style=&quot;display:block&quot; width=&quot;137&quot; /&gt;&lt;/td&gt;\r\n														&lt;/tr&gt;\r\n														&lt;tr&gt;\r\n															&lt;td&gt;&lt;a href=&quot;http://email-eu.puma.com/a/hBR4miTB8dSpHB8z2n1AAMtVctP/link19b-0&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;Girls Shoes&quot; border=&quot;0&quot; height=&quot;27&quot; name=&quot;13fdc6dd3af14e74_puma_eos_summer_sale_reminder_en_2013_07_r7_c8&quot; src=&quot;http://f.email-eu.puma.com/i/12/2087752692/puma_eos_summer_sale_reminder_en_2013_07_r7_c8.jpg&quot; style=&quot;display:block&quot; title=&quot;Girls Shoes&quot; width=&quot;137&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n														&lt;/tr&gt;\r\n														&lt;tr&gt;\r\n															&lt;td&gt;&lt;a href=&quot;http://email-eu.puma.com/a/hBR4miTB8dSpHB8z2n1AAMtVctP/link20b-0&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;Girls Clothing&quot; border=&quot;0&quot; height=&quot;25&quot; name=&quot;13fdc6dd3af14e74_puma_eos_summer_sale_reminder_en_2013_07_r8_c8&quot; src=&quot;http://f.email-eu.puma.com/i/12/2087752692/puma_eos_summer_sale_reminder_en_2013_07_r8_c8.jpg&quot; style=&quot;display:block&quot; title=&quot;Girls Clothing&quot; width=&quot;137&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n														&lt;/tr&gt;\r\n														&lt;tr&gt;\r\n															&lt;td&gt;&lt;a href=&quot;http://email-eu.puma.com/a/hBR4miTB8dSpHB8z2n1AAMtVctP/link21b-0&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;Boys Shoes&quot; border=&quot;0&quot; height=&quot;25&quot; name=&quot;13fdc6dd3af14e74_puma_eos_summer_sale_reminder_en_2013_07_r9_c8&quot; src=&quot;http://f.email-eu.puma.com/i/12/2087752692/puma_eos_summer_sale_reminder_en_2013_07_r9_c8.jpg&quot; style=&quot;display:block&quot; title=&quot;Boys Shoes&quot; width=&quot;137&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n														&lt;/tr&gt;\r\n														&lt;tr&gt;\r\n															&lt;td&gt;&lt;a href=&quot;http://email-eu.puma.com/a/hBR4miTB8dSpHB8z2n1AAMtVctP/link22b-0&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;Boys Clothing&quot; border=&quot;0&quot; height=&quot;25&quot; name=&quot;13fdc6dd3af14e74_puma_eos_summer_sale_reminder_en_2013_07_r10_c8&quot; src=&quot;http://f.email-eu.puma.com/i/12/2087752692/puma_eos_summer_sale_reminder_en_2013_07_r10_c8.jpg&quot; style=&quot;display:block&quot; title=&quot;Boys Clothing&quot; width=&quot;137&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n														&lt;/tr&gt;\r\n														&lt;tr&gt;\r\n															&lt;td&gt;&lt;img alt=&quot;&quot; border=&quot;0&quot; height=&quot;14&quot; name=&quot;13fdc6dd3af14e74_puma_eos_summer_sale_reminder_en_2013_07_r11_c8&quot; src=&quot;http://f.email-eu.puma.com/i/12/2087752692/puma_eos_summer_sale_reminder_en_2013_07_r11_c8.jpg&quot; style=&quot;display:block&quot; width=&quot;137&quot; /&gt;&lt;/td&gt;\r\n														&lt;/tr&gt;\r\n													&lt;/tbody&gt;\r\n												&lt;/table&gt;\r\n												&lt;/td&gt;\r\n												&lt;td&gt;&lt;img alt=&quot;&quot; border=&quot;0&quot; height=&quot;165&quot; name=&quot;13fdc6dd3af14e74_puma_eos_summer_sale_reminder_en_2013_07_r5_c9&quot; src=&quot;http://f.email-eu.puma.com/i/12/2087752692/puma_eos_summer_sale_reminder_en_2013_07_r5_c9.jpg&quot; style=&quot;display:block&quot; width=&quot;86&quot; /&gt;&lt;/td&gt;\r\n											&lt;/tr&gt;\r\n										&lt;/tbody&gt;\r\n									&lt;/table&gt;\r\n									&lt;/td&gt;\r\n								&lt;/tr&gt;\r\n							&lt;/tbody&gt;\r\n						&lt;/table&gt;\r\n						&lt;/td&gt;\r\n						&lt;td&gt;&lt;img alt=&quot;&quot; border=&quot;0&quot; height=&quot;416&quot; name=&quot;13fdc6dd3af14e74_puma_eos_summer_sale_reminder_en_2013_07_r2_c11&quot; src=&quot;http://f.email-eu.puma.com/i/12/2087752692/puma_eos_summer_sale_reminder_en_2013_07_r2_c11.jpg&quot; style=&quot;display:block&quot; width=&quot;12&quot; /&gt;&lt;/td&gt;\r\n					&lt;/tr&gt;\r\n				&lt;/tbody&gt;\r\n			&lt;/table&gt;\r\n			&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td&gt;\r\n			&lt;table align=&quot;left&quot; border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; width=&quot;700&quot;&gt;\r\n				&lt;tbody&gt;\r\n					&lt;tr&gt;\r\n						&lt;td valign=&quot;top&quot;&gt;\r\n						&lt;table align=&quot;left&quot; border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; width=&quot;12&quot;&gt;\r\n							&lt;tbody&gt;\r\n								&lt;tr&gt;\r\n									&lt;td&gt;&lt;img alt=&quot;&quot; border=&quot;0&quot; height=&quot;104&quot; name=&quot;13fdc6dd3af14e74_puma_bvb_en_2013_07_r13_c1&quot; src=&quot;http://f.email-eu.puma.com/i/12/2087752692/puma_bvb_en_2013_07_r13_c1.jpg&quot; style=&quot;display:block&quot; width=&quot;12&quot; /&gt;&lt;/td&gt;\r\n								&lt;/tr&gt;\r\n								&lt;tr&gt;\r\n									&lt;td&gt;&lt;img alt=&quot;&quot; border=&quot;0&quot; height=&quot;35&quot; name=&quot;13fdc6dd3af14e74_puma_bvb_en_2013_07_r14_c1&quot; src=&quot;http://f.email-eu.puma.com/i/12/2087752692/puma_bvb_en_2013_07_r14_c1.jpg&quot; style=&quot;display:block&quot; width=&quot;12&quot; /&gt;&lt;/td&gt;\r\n								&lt;/tr&gt;\r\n							&lt;/tbody&gt;\r\n						&lt;/table&gt;\r\n						&lt;/td&gt;\r\n						&lt;td valign=&quot;top&quot;&gt;&lt;img alt=&quot;&quot; border=&quot;0&quot; height=&quot;104&quot; src=&quot;http://f.email-eu.puma.com/i/12/2087752692/2013_02_puma_new_arrivals_en_r18_c2.jpg&quot; style=&quot;display:block&quot; width=&quot;6&quot; /&gt;&lt;/td&gt;\r\n						&lt;td&gt;\r\n						&lt;table align=&quot;left&quot; border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; width=&quot;663&quot;&gt;\r\n							&lt;tbody&gt;\r\n								&lt;tr&gt;\r\n									&lt;td height=&quot;15&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n								&lt;/tr&gt;\r\n								&lt;tr&gt;\r\n									&lt;td bgcolor=&quot;#EBE9EA&quot;&gt;\r\n									&lt;table align=&quot;left&quot; border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; width=&quot;663&quot;&gt;\r\n										&lt;tbody&gt;\r\n											&lt;tr&gt;\r\n												&lt;td&gt;&lt;img alt=&quot;Free standard shipping on orders over € 30 (£ 25, CHF 50)&quot; border=&quot;0&quot; height=&quot;69&quot; src=&quot;http://f.email-eu.puma.com/i/12/2087752692/2013_02_puma_new_arrivals_en_r18_c3.jpg&quot; style=&quot;display:block&quot; title=&quot;Free standard shipping on orders over € 30 (£ 25, CHF 50)&quot; width=&quot;185&quot; /&gt;&lt;/td&gt;\r\n												&lt;td&gt;&lt;img alt=&quot;Delivery within 2-7 working days based on the country&quot; border=&quot;0&quot; height=&quot;69&quot; src=&quot;http://f.email-eu.puma.com/i/12/2087752692/2013_02_puma_new_arrivals_en_r18_c9.jpg&quot; style=&quot;display:block&quot; title=&quot;Delivery within 2-7 working days based on the country&quot; width=&quot;166&quot; /&gt;&lt;/td&gt;\r\n												&lt;td&gt;&lt;img alt=&quot;Cost free returns 40 days right to return&quot; border=&quot;0&quot; height=&quot;69&quot; src=&quot;http://f.email-eu.puma.com/i/12/2087752692/2013_02_puma_new_arrivals_en_r18_c16.jpg&quot; style=&quot;display:block&quot; title=&quot;Cost free returns 40 days right to return&quot; width=&quot;164&quot; /&gt;&lt;/td&gt;\r\n												&lt;td&gt;&lt;img alt=&quot;Largest PUMA Shop worldwide&quot; border=&quot;0&quot; height=&quot;69&quot; src=&quot;http://f.email-eu.puma.com/i/12/2087752692/2013_02_puma_new_arrivals_en_r18_c21.jpg&quot; style=&quot;display:block&quot; title=&quot;Largest PUMA Shop worldwide&quot; width=&quot;148&quot; /&gt;&lt;/td&gt;\r\n											&lt;/tr&gt;\r\n										&lt;/tbody&gt;\r\n									&lt;/table&gt;\r\n									&lt;/td&gt;\r\n								&lt;/tr&gt;\r\n								&lt;tr&gt;\r\n									&lt;td bgcolor=&quot;#EBE9EA&quot;&gt;\r\n									&lt;table align=&quot;left&quot; border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; width=&quot;663&quot;&gt;\r\n										&lt;tbody&gt;\r\n											&lt;tr&gt;\r\n												&lt;td&gt;&lt;img alt=&quot;&quot; border=&quot;0&quot; height=&quot;35&quot; src=&quot;http://f.email-eu.puma.com/i/12/2087752692/2013_02_puma_new_arrivals_en_r19_c3.jpg&quot; style=&quot;display:block&quot; width=&quot;199&quot; /&gt;&lt;/td&gt;\r\n												&lt;td&gt;&lt;img alt=&quot;&quot; border=&quot;0&quot; height=&quot;35&quot; src=&quot;http://f.email-eu.puma.com/i/12/2087752692/2013_02_puma_new_arrivals_en_r19_c10.jpg&quot; style=&quot;display:block&quot; width=&quot;269&quot; /&gt;&lt;/td&gt;\r\n												&lt;td&gt;&lt;img alt=&quot;&quot; border=&quot;0&quot; height=&quot;35&quot; src=&quot;http://f.email-eu.puma.com/i/12/2087752692/2013_02_puma_new_arrivals_en_r19_c18.jpg&quot; style=&quot;display:block&quot; width=&quot;195&quot; /&gt;&lt;/td&gt;\r\n											&lt;/tr&gt;\r\n										&lt;/tbody&gt;\r\n									&lt;/table&gt;\r\n									&lt;/td&gt;\r\n								&lt;/tr&gt;\r\n								&lt;tr&gt;\r\n									&lt;td height=&quot;10&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n								&lt;/tr&gt;\r\n								&lt;tr&gt;\r\n									&lt;td align=&quot;center&quot;&gt;&lt;img alt=&quot;FIND US ON:&quot; border=&quot;0&quot; height=&quot;20&quot; src=&quot;http://f.email-eu.puma.com/i/12/2087752692/2012_11_puma_suede_breakdancer_en_r22_c18.jpg&quot; style=&quot;display:block&quot; title=&quot;FIND US ON:&quot; width=&quot;104&quot; /&gt;&lt;/td&gt;\r\n								&lt;/tr&gt;\r\n							&lt;/tbody&gt;\r\n						&lt;/table&gt;\r\n						&lt;/td&gt;\r\n						&lt;td valign=&quot;top&quot;&gt;&lt;img alt=&quot;&quot; border=&quot;0&quot; height=&quot;104&quot; src=&quot;http://f.email-eu.puma.com/i/12/2087752692/2013_02_puma_new_arrivals_en_r18_c23.jpg&quot; style=&quot;display:block&quot; width=&quot;7&quot; /&gt;&lt;/td&gt;\r\n						&lt;td valign=&quot;top&quot;&gt;\r\n						&lt;table align=&quot;left&quot; border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; width=&quot;12&quot;&gt;\r\n							&lt;tbody&gt;\r\n								&lt;tr&gt;\r\n									&lt;td&gt;&lt;img alt=&quot;&quot; border=&quot;0&quot; height=&quot;104&quot; name=&quot;13fdc6dd3af14e74_puma_bvb_en_2013_07_r13_c10&quot; src=&quot;http://f.email-eu.puma.com/i/12/2087752692/puma_bvb_en_2013_07_r13_c10.jpg&quot; style=&quot;display:block&quot; width=&quot;12&quot; /&gt;&lt;/td&gt;\r\n								&lt;/tr&gt;\r\n								&lt;tr&gt;\r\n									&lt;td&gt;&lt;img alt=&quot;&quot; border=&quot;0&quot; height=&quot;35&quot; name=&quot;13fdc6dd3af14e74_puma_bvb_en_2013_07_r14_c10&quot; src=&quot;http://f.email-eu.puma.com/i/12/2087752692/puma_bvb_en_2013_07_r14_c10.jpg&quot; style=&quot;display:block&quot; width=&quot;12&quot; /&gt;&lt;/td&gt;\r\n								&lt;/tr&gt;\r\n							&lt;/tbody&gt;\r\n						&lt;/table&gt;\r\n						&lt;/td&gt;\r\n					&lt;/tr&gt;\r\n				&lt;/tbody&gt;\r\n			&lt;/table&gt;\r\n			&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td&gt;\r\n			&lt;table align=&quot;left&quot; border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; width=&quot;700&quot;&gt;\r\n				&lt;tbody&gt;\r\n					&lt;tr&gt;\r\n						&lt;td&gt;&lt;img alt=&quot;&quot; border=&quot;0&quot; height=&quot;88&quot; src=&quot;http://f.email-eu.puma.com/i/12/2087752692/2012_11_puma_suede_breakdancer_en_r23_c1.jpg&quot; style=&quot;display:block&quot; width=&quot;20&quot; /&gt;&lt;/td&gt;\r\n						&lt;td&gt;\r\n						&lt;table align=&quot;left&quot; border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; width=&quot;664&quot;&gt;\r\n							&lt;tbody&gt;\r\n								&lt;tr&gt;\r\n									&lt;td&gt;\r\n									&lt;table align=&quot;left&quot; border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; width=&quot;664&quot;&gt;\r\n										&lt;tbody&gt;\r\n											&lt;tr&gt;\r\n												&lt;td bgcolor=&quot;#065DAA&quot;&gt;&lt;a href=&quot;http://email-eu.puma.com/a/hBR4miTB8dSpHB8z2n1AAMtVctP/link28-0&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;Facebook&quot; border=&quot;0&quot; height=&quot;42&quot; src=&quot;http://f.email-eu.puma.com/i/12/2087752692/2012_11_puma_suede_breakdancer_en_r23_c5.jpg&quot; style=&quot;display:block&quot; title=&quot;Facebook&quot; width=&quot;221&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n												&lt;td bgcolor=&quot;#4DC3E7&quot;&gt;&lt;a href=&quot;http://email-eu.puma.com/a/hBR4miTB8dSpHB8z2n1AAMtVctP/link39-0&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;Twitter&quot; border=&quot;0&quot; height=&quot;42&quot; src=&quot;http://f.email-eu.puma.com/i/12/2087752692/2012_11_puma_suede_breakdancer_en_r23_c14.jpg&quot; style=&quot;display:block&quot; title=&quot;Twitter&quot; width=&quot;223&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n												&lt;td bgcolor=&quot;#EF2D36&quot;&gt;&lt;a href=&quot;http://email-eu.puma.com/a/hBR4miTB8dSpHB8z2n1AAMtVctP/link40-0&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;YouTube&quot; border=&quot;0&quot; height=&quot;42&quot; src=&quot;http://f.email-eu.puma.com/i/12/2087752692/2012_11_puma_suede_breakdancer_en_r23_c26.jpg&quot; style=&quot;display:block&quot; title=&quot;YouTube&quot; width=&quot;220&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n											&lt;/tr&gt;\r\n										&lt;/tbody&gt;\r\n									&lt;/table&gt;\r\n									&lt;/td&gt;\r\n								&lt;/tr&gt;\r\n								&lt;tr&gt;\r\n									&lt;td&gt;&lt;img alt=&quot;&quot; border=&quot;0&quot; height=&quot;46&quot; src=&quot;http://f.email-eu.puma.com/i/12/2087752692/2012_11_puma_suede_breakdancer_en_r24_c5.jpg&quot; style=&quot;display:block&quot; width=&quot;664&quot; /&gt;&lt;/td&gt;\r\n								&lt;/tr&gt;\r\n							&lt;/tbody&gt;\r\n						&lt;/table&gt;\r\n						&lt;/td&gt;\r\n						&lt;td&gt;&lt;img alt=&quot;&quot; border=&quot;0&quot; height=&quot;88&quot; src=&quot;http://f.email-eu.puma.com/i/12/2087752692/2012_11_puma_suede_breakdancer_en_r23_c36.jpg&quot; style=&quot;display:block&quot; width=&quot;16&quot; /&gt;&lt;/td&gt;\r\n					&lt;/tr&gt;\r\n				&lt;/tbody&gt;\r\n			&lt;/table&gt;\r\n			&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td align=&quot;center&quot; bgcolor=&quot;#FFFFFF&quot; height=&quot;48&quot; style=&quot;font-family:Arial,Helvetica,sans-serif;font-size:10px;color:#5e5e5e&quot; valign=&quot;top&quot;&gt;&lt;a href=&quot;http://email-eu.puma.com/a/hBR4miTB8dSpHB8z2n1AAMtVctP/link30-0&quot; style=&quot;text-decoration:none;color:#505050&quot; target=&quot;_blank&quot;&gt;PUMA&lt;/a&gt; | &lt;a href=&quot;http://email-eu.puma.com/a/hBR4miTB8dSpHB8z2n1AAMtVctP/link35-0&quot; style=&quot;text-decoration:none;color:#505050&quot; target=&quot;_blank&quot;&gt;FOOTBALL&lt;/a&gt; | &lt;a href=&quot;http://email-eu.puma.com/a/hBR4miTB8dSpHB8z2n1AAMtVctP/link38-0&quot; style=&quot;text-decoration:none;color:#505050&quot; target=&quot;_blank&quot;&gt;RUNNING&lt;/a&gt; | &lt;a href=&quot;http://email-eu.puma.com/a/hBR4miTB8dSpHB8z2n1AAMtVctP/link34-0&quot; style=&quot;text-decoration:none;color:#505050&quot; target=&quot;_blank&quot;&gt;FITNESS&lt;/a&gt; | &lt;a href=&quot;http://email-eu.puma.com/a/hBR4miTB8dSpHB8z2n1AAMtVctP/link36-0&quot; style=&quot;text-decoration:none;color:#505050&quot; target=&quot;_blank&quot;&gt;GOLF&lt;/a&gt; | &lt;a href=&quot;http://email-eu.puma.com/a/hBR4miTB8dSpHB8z2n1AAMtVctP/link37-0&quot; style=&quot;text-decoration:none;color:#505050&quot; target=&quot;_blank&quot;&gt;MOTORSPORT&lt;/a&gt;&lt;br /&gt;\r\n			&lt;a href=&quot;http://email-eu.puma.com/a/hBR4miTB8dSpHB8z2n1AAMtVctP/link29-0&quot; style=&quot;text-decoration:none;color:#505050&quot; target=&quot;_blank&quot;&gt;FRAGRANCES&lt;/a&gt; | &lt;a href=&quot;http://email-eu.puma.com/a/hBR4miTB8dSpHB8z2n1AAMtVctP/link31-0&quot; style=&quot;text-decoration:none;color:#505050&quot; target=&quot;_blank&quot;&gt;ALEXANDER McQUEEN&lt;/a&gt; | &lt;a href=&quot;http://email-eu.puma.com/a/hBR4miTB8dSpHB8z2n1AAMtVctP/link33-0&quot; style=&quot;text-decoration:none;color:#505050&quot; target=&quot;_blank&quot;&gt;MIHARA&lt;/a&gt; | &lt;a href=&quot;http://email-eu.puma.com/a/hBR4miTB8dSpHB8z2n1AAMtVctP/link32-0&quot; style=&quot;text-decoration:none;color:#505050&quot; target=&quot;_blank&quot;&gt;PUMA BY HUSSEIN CHALAYAN&lt;/a&gt;&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td bgcolor=&quot;#FFFFFF&quot;&gt;\r\n			&lt;table align=&quot;left&quot; border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; width=&quot;676&quot;&gt;\r\n				&lt;tbody&gt;\r\n					&lt;tr&gt;\r\n						&lt;td align=&quot;left&quot; height=&quot;30&quot; style=&quot;font-family:Arial,Helvetica,sans-serif;font-size:10px;color:#5e5e5e;padding-left:20px&quot; valign=&quot;top&quot; width=&quot;156&quot;&gt;Copyright 2013 by PUMA&lt;/td&gt;\r\n						&lt;td height=&quot;30&quot; width=&quot;135&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n						&lt;td align=&quot;right&quot; height=&quot;30&quot; style=&quot;font-family:Arial,Helvetica,sans-serif;font-size:10px;color:#5e5e5e;padding-right:16px&quot; valign=&quot;top&quot; width=&quot;366&quot;&gt;&lt;a href=&quot;http://email-eu.puma.com/a/hBR4miTB8dSpHB8z2n1AAMtVctP/link27-0&quot; style=&quot;text-decoration:none;color:#5e5e5e&quot; target=&quot;_blank&quot;&gt;PRIVACY POLICY&lt;/a&gt; | &lt;a href=&quot;http://email-eu.puma.com/a/hBR4miTB8dSpHB8z2n1AAMtVctP/link26-0&quot; style=&quot;text-decoration:none;color:#5e5e5e&quot; target=&quot;_blank&quot;&gt;IMPRINT&lt;/a&gt; | &lt;a href=&quot;http://email-eu.puma.com/a/hBR4miTB8dSpHB8z2n1AAMtVctP/link3b-0?password=B8dSpHAAMtVcBR4miTC9EMX3gAVTDu&quot; style=&quot;text-decoration:none;color:#5e5e5e&quot; target=&quot;_blank&quot;&gt;UPDATE PREFERENCES&lt;/a&gt; | &lt;a href=&quot;http://email-eu.puma.com/a/hBR4miTB8dSpHB8z2n1AAMtVctP/link1b-0&quot; style=&quot;text-decoration:none;color:#5e5e5e&quot; target=&quot;_blank&quot;&gt;UNSUBSCRIBE&lt;/a&gt;&lt;/td&gt;\r\n					&lt;/tr&gt;\r\n				&lt;/tbody&gt;\r\n			&lt;/table&gt;\r\n			&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td align=&quot;center&quot; bgcolor=&quot;#FFFFFF&quot; style=&quot;font-family:Arial,Helvetica,sans-serif;font-size:10px;color:#5e5e5e&quot; valign=&quot;top&quot;&gt;PUMA Retail AG | Ostringstrasse 17 | CH - 4702 Oensingen | Switzerland&lt;br /&gt;\r\n			&lt;br /&gt;\r\n			Registered Office: Oensingen | Commercial Register: Solothurn, CH-241.3.004.255-8 | VAT ID: DE 814 189 834&lt;br /&gt;\r\n			&lt;br /&gt;\r\n			Managing Director: Mrs Karin Baust&lt;br /&gt;\r\n			&lt;br /&gt;\r\n			Responsible for the content: PUMA Retail AG | PUMA Online Shop | Ostringstrasse 17 | CH – 4702 Oensingen&lt;br /&gt;\r\n			&lt;br /&gt;\r\n			Phone: +41 (0) 44 2 42 86 00 | Fax +41 (0) 44 2 42 86 01 | E-Mail: &lt;a href=&quot;mailto:service-eu@shop.puma.com&quot; style=&quot;text-decoration:none;color:#5e5e5e&quot; target=&quot;_blank&quot;&gt;service-eu@shop.puma.com&lt;/a&gt;&lt;br /&gt;\r\n			&lt;br /&gt;\r\n			&lt;br /&gt;\r\n			&lt;br /&gt;\r\n			To ensure that our messages get to you (and don''t go to your junk or bulk email folders), please add&lt;br /&gt;\r\n			&lt;a href=&quot;mailto:pumaonlineshop@email-eu.puma.com&quot; style=&quot;text-decoration:none;color:#5e5e5e&quot; target=&quot;_blank&quot;&gt;&lt;strong&gt;pumaonlineshop@email-eu.puma.&lt;wbr /&gt;com&lt;/strong&gt;&lt;/a&gt; to your address book.&lt;br /&gt;\r\n			&lt;br /&gt;\r\n			You are receiving the PUMA Newsletter because you have registered with your e-mail-address: &lt;a href=&quot;mailto:welookvn@gmail.com&quot; target=&quot;_blank&quot;&gt;welookvn@gmail.com&lt;/a&gt;&lt;br /&gt;\r\n			&lt;br /&gt;\r\n			EMAIL OPT-OUT&lt;br /&gt;\r\n			To unsubscribe to this mailing list &lt;a href=&quot;http://email-eu.puma.com/a/hBR4miTB8dSpHB8z2n1AAMtVctP/link1c-0&quot; style=&quot;color:#505050&quot; target=&quot;_blank&quot;&gt;click here&lt;/a&gt;&lt;br /&gt;\r\n			&lt;br /&gt;\r\n			UPDATE PREFERENCES &lt;a href=&quot;http://email-eu.puma.com/a/hBR4miTB8dSpHB8z2n1AAMtVctP/link3c-0?password=B8dSpHAAMtVcBR4miTC9EMX3gAVTDu&quot; style=&quot;color:#505050&quot; target=&quot;_blank&quot;&gt;click here&lt;/a&gt;&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td align=&quot;center&quot; bgcolor=&quot;#FFFFFF&quot; height=&quot;20&quot; style=&quot;font-family:Arial,Helvetica,sans-serif;font-size:10px;color:#5e5e5e&quot; valign=&quot;top&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n	&lt;/tbody&gt;\r\n&lt;/table&gt;\r\n', '', '');
INSERT INTO `news_description` (`news_id`, `language_id`, `name`, `short_description`, `description`, `meta_description`, `meta_keyword`) VALUES
(18, 2, 'TOPMAN - GIẢM GIÁ THÊM 10% cho các đơn hàng SALE OFF - Mua ngay!!!', '', '&lt;div bgcolor=&quot;#000000&quot; style=&quot;background-color:#000000&quot;&gt;\r\n&lt;div class=&quot;adM&quot;&gt;&amp;nbsp;&lt;/div&gt;\r\n\r\n&lt;table align=&quot;center&quot; border=&quot;0&quot; style=&quot;background-color:#000000&quot; width=&quot;700&quot;&gt;\r\n	&lt;tbody&gt;\r\n		&lt;tr&gt;\r\n			&lt;td&gt;\r\n			&lt;table border=&quot;0&quot; width=&quot;700&quot;&gt;\r\n				&lt;tbody&gt;\r\n					&lt;tr&gt;\r\n						&lt;td width=&quot;10&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n						&lt;td align=&quot;center&quot; style=&quot;color:#ffffff;font-family:Arial,Helvetica,sans-serif;font-size:10px&quot; valign=&quot;top&quot; width=&quot;680&quot;&gt;Trouble viewing the email? &lt;a href=&quot;http://topman.chtah.com/a/hBR3UW7Bzu2XWB8zz$5NslLlVwb/tmuk1?t_params=EMAIL%3Dwelookvn%2540gmail.com%26PASSWORD%3DBzu2XWNslLlVBR3UW7lQksRxcs1CFR&quot; style=&quot;color:#ff0066;text-decoration:underline;font-family:Arial,Helvetica,sans-serif;font-size:9px&quot; target=&quot;_blank&quot;&gt;&lt;span style=&quot;color:#bdff00;font-family:Arial,Helvetica,sans-serif;font-size:10px;text-decoration:underline&quot;&gt;View it online&lt;/span&gt;&lt;/a&gt;&lt;br /&gt;\r\n						&lt;br /&gt;\r\n						&lt;font style=&quot;color:#ffffff;font-family:Arial,Helvetica,sans-serif;font-size:11px&quot;&gt;&lt;strong&gt;Don''t keep a good thing to yourself&lt;/strong&gt; &lt;/font&gt;&amp;nbsp;&lt;a href=&quot;http://www.facebook.com/sharer.php?u=http://ebm.cheetahmail.com/c/tag/BR3UW7Bzu2XWB8zz$5AAAAAGTj/doc.html?t_params=EMAIL%3Dwelookvn%2540gmail.com%26PASSWORD%3DBzu2XWNslLlVBR3UW7lQksRxcs1CFR&quot; target=&quot;_blank&quot;&gt;&lt;img border=&quot;0&quot; src=&quot;http://f.chtah.com/s/0/0/facebook_share.png&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n						&lt;td width=&quot;10&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n					&lt;/tr&gt;\r\n				&lt;/tbody&gt;\r\n			&lt;/table&gt;\r\n			&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td&gt;\r\n			&lt;table border=&quot;0&quot; width=&quot;700&quot;&gt;\r\n				&lt;tbody&gt;\r\n					&lt;tr&gt;\r\n						&lt;td width=&quot;10&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n						&lt;td&gt;\r\n						&lt;table border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; width=&quot;680&quot;&gt;\r\n							&lt;tbody&gt;\r\n								&lt;tr&gt;\r\n									&lt;td colspan=&quot;2&quot; width=&quot;191&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td colspan=&quot;3&quot;&gt;&lt;a href=&quot;http://topman.chtah.com/a/hBR3UW7Bzu2XWB8zz$5NslLlVwb/tmuk32&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;Topman.com&quot; border=&quot;0&quot; height=&quot;83&quot; src=&quot;http://f.chtah.com/i/47/1941661142/TopNav_Email_02.gif&quot; style=&quot;display:block&quot; width=&quot;293&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n									&lt;td colspan=&quot;2&quot; width=&quot;196&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n								&lt;/tr&gt;\r\n								&lt;tr&gt;\r\n									&lt;td&gt;&lt;a href=&quot;http://topman.chtah.com/a/hBR3UW7Bzu2XWB8zz$5NslLlVwb/tmuk26&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;NEW IN&quot; border=&quot;0&quot; height=&quot;42&quot; src=&quot;http://f.chtah.com/i/47/1941661142/TopNav_Email_04.gif&quot; style=&quot;display:block&quot; width=&quot;100&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n									&lt;td&gt;&lt;a href=&quot;http://topman.chtah.com/a/hBR3UW7Bzu2XWB8zz$5NslLlVwb/tmuk30&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;SUITS&quot; border=&quot;0&quot; height=&quot;42&quot; src=&quot;http://f.chtah.com/i/47/1941661142/TopNav_Email_05.gif&quot; style=&quot;display:block&quot; width=&quot;91&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n									&lt;td&gt;&lt;a href=&quot;http://topman.chtah.com/a/hBR3UW7Bzu2XWB8zz$5NslLlVwb/tmuk27&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;BRANDS&quot; border=&quot;0&quot; height=&quot;42&quot; src=&quot;http://f.chtah.com/i/47/1941661142/TopNav_Email_06.gif&quot; style=&quot;display:block&quot; width=&quot;99&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n									&lt;td&gt;&lt;a href=&quot;http://topman.chtah.com/a/hBR3UW7Bzu2XWB8zz$5NslLlVwb/tmuk25&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;DEALS AND OFFERS&quot; border=&quot;0&quot; height=&quot;42&quot; src=&quot;http://f.chtah.com/i/47/1941661142/TopNav_Email_07.gif&quot; style=&quot;display:block&quot; width=&quot;163&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n									&lt;td colspan=&quot;2&quot;&gt;&lt;a href=&quot;http://topman.chtah.com/a/hBR3UW7Bzu2XWB8zz$5NslLlVwb/tmuk29&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;SALE&quot; border=&quot;0&quot; height=&quot;42&quot; src=&quot;http://f.chtah.com/i/47/1941661142/TopNav_Email_08.gif&quot; style=&quot;display:block&quot; width=&quot;88&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n									&lt;td&gt;&lt;a href=&quot;http://topman.chtah.com/a/hBR3UW7Bzu2XWB8zz$5NslLlVwb/tmuk28&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;INSPIRE ME&quot; border=&quot;0&quot; height=&quot;42&quot; src=&quot;http://f.chtah.com/i/47/1941661142/TopNav_Email_09.gif&quot; style=&quot;display:block&quot; width=&quot;139&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n								&lt;/tr&gt;\r\n								&lt;tr&gt;\r\n									&lt;td colspan=&quot;7&quot;&gt;&lt;img alt=&quot;&quot; height=&quot;45&quot; src=&quot;http://f.chtah.com/i/47/1941661142/TopNav_Email_10.gif&quot; width=&quot;680&quot; /&gt;&lt;/td&gt;\r\n								&lt;/tr&gt;\r\n								&lt;tr&gt;\r\n									&lt;td background=&quot;http://f.chtah.com/i/47/1941661142/spacer.gif&quot; height=&quot;1&quot; width=&quot;100&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td background=&quot;http://f.chtah.com/i/47/1941661142/spacer.gif&quot; height=&quot;1&quot; width=&quot;91&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td background=&quot;http://f.chtah.com/i/47/1941661142/spacer.gif&quot; height=&quot;1&quot; width=&quot;99&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td background=&quot;http://f.chtah.com/i/47/1941661142/spacer.gif&quot; height=&quot;1&quot; width=&quot;163&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td background=&quot;http://f.chtah.com/i/47/1941661142/spacer.gif&quot; height=&quot;1&quot; width=&quot;31&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td background=&quot;http://f.chtah.com/i/47/1941661142/spacer.gif&quot; height=&quot;1&quot; width=&quot;57&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td background=&quot;http://f.chtah.com/i/47/1941661142/spacer.gif&quot; height=&quot;1&quot; width=&quot;139&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n								&lt;/tr&gt;\r\n							&lt;/tbody&gt;\r\n						&lt;/table&gt;\r\n						&lt;/td&gt;\r\n						&lt;td width=&quot;10&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n					&lt;/tr&gt;\r\n				&lt;/tbody&gt;\r\n			&lt;/table&gt;\r\n			&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td&gt;\r\n			&lt;table border=&quot;0&quot; width=&quot;700&quot;&gt;\r\n				&lt;tbody&gt;\r\n					&lt;tr&gt;\r\n						&lt;td width=&quot;10&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n						&lt;td&gt;&lt;a href=&quot;http://topman.chtah.com/a/hBR3UW7Bzu2XWB8zz$5NslLlVwb/tmuk7&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;EXTRA 10% OFF SALE. SHOP NOW &amp;gt;&quot; border=&quot;0&quot; height=&quot;450&quot; src=&quot;http://f.chtah.com/i/47/1941661142/WK46_Sale_10_OFF.jpg&quot; style=&quot;display:block&quot; width=&quot;680&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n						&lt;td width=&quot;10&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n					&lt;/tr&gt;\r\n					&lt;tr&gt;\r\n						&lt;td colspan=&quot;3&quot; height=&quot;10&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n					&lt;/tr&gt;\r\n					&lt;tr&gt;\r\n						&lt;td colspan=&quot;3&quot; height=&quot;10&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n					&lt;/tr&gt;\r\n				&lt;/tbody&gt;\r\n			&lt;/table&gt;\r\n			&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td&gt;\r\n			&lt;table border=&quot;0&quot; width=&quot;700&quot;&gt;\r\n				&lt;tbody&gt;\r\n					&lt;tr&gt;\r\n						&lt;td width=&quot;10&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n						&lt;td&gt;\r\n						&lt;table border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; height=&quot;219&quot; width=&quot;680&quot;&gt;\r\n							&lt;tbody&gt;\r\n								&lt;tr&gt;\r\n									&lt;td&gt;&lt;a href=&quot;http://topman.chtah.com/a/hBR3UW7Bzu2XWB8zz$5NslLlVwb/tmuk13&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;FACEBBOK&quot; border=&quot;0&quot; height=&quot;28&quot; src=&quot;http://f.chtah.com/i/47/1941661142/BottomNav_Email_01.gif&quot; style=&quot;display:block&quot; width=&quot;33&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n									&lt;td&gt;&lt;a href=&quot;http://topman.chtah.com/a/hBR3UW7Bzu2XWB8zz$5NslLlVwb/tmuk12&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;TWITTER&quot; border=&quot;0&quot; height=&quot;28&quot; src=&quot;http://f.chtah.com/i/47/1941661142/BottomNav_Email_02.gif&quot; style=&quot;display:block&quot; width=&quot;36&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n									&lt;td&gt;&lt;a href=&quot;http://topman.chtah.com/a/hBR3UW7Bzu2XWB8zz$5NslLlVwb/tmuk2&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;INSTAGRAM&quot; border=&quot;0&quot; height=&quot;28&quot; src=&quot;http://f.chtah.com/i/47/1941661142/BottomNav_Email_03.gif&quot; style=&quot;display:block&quot; width=&quot;41&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n									&lt;td&gt;&lt;a href=&quot;http://topman.chtah.com/a/hBR3UW7Bzu2XWB8zz$5NslLlVwb/tmuk4&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;PINTREST&quot; border=&quot;0&quot; height=&quot;28&quot; src=&quot;http://f.chtah.com/i/47/1941661142/BottomNav_Email_04.gif&quot; style=&quot;display:block&quot; width=&quot;37&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n									&lt;td&gt;&lt;a href=&quot;http://topman.chtah.com/a/hBR3UW7Bzu2XWB8zz$5NslLlVwb/tmuk6&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;TUMBLER&quot; border=&quot;0&quot; height=&quot;28&quot; src=&quot;http://f.chtah.com/i/47/1941661142/BottomNav_Email_05.gif&quot; style=&quot;display:block&quot; width=&quot;39&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n									&lt;td colspan=&quot;2&quot;&gt;&lt;a href=&quot;http://topman.chtah.com/a/hBR3UW7Bzu2XWB8zz$5NslLlVwb/tmuk11&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;GOOGLE+&quot; border=&quot;0&quot; height=&quot;28&quot; src=&quot;http://f.chtah.com/i/47/1941661142/BottomNav_Email_06.gif&quot; style=&quot;display:block&quot; width=&quot;38&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n									&lt;td&gt;&lt;a href=&quot;http://topman.chtah.com/a/hBR3UW7Bzu2XWB8zz$5NslLlVwb/tmuk3&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;GENERATION&quot; border=&quot;0&quot; height=&quot;28&quot; src=&quot;http://f.chtah.com/i/47/1941661142/BottomNav_Email_07.gif&quot; style=&quot;display:block&quot; width=&quot;129&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n									&lt;td bgcolor=&quot;#000000&quot; colspan=&quot;2&quot; width=&quot;327&quot;&gt;&lt;img border=&quot;0&quot; height=&quot;28&quot; src=&quot;http://f.chtah.com/i/47/1941661142/BottomNav_Email_08.gif&quot; style=&quot;display:block&quot; width=&quot;327&quot; /&gt;&lt;/td&gt;\r\n									&lt;td background=&quot;http://f.chtah.com/i/47/1941661142/spacer.gif&quot; height=&quot;28&quot; width=&quot;1&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n								&lt;/tr&gt;\r\n								&lt;tr&gt;\r\n									&lt;td colspan=&quot;6&quot; style=&quot;background-color:#000000;color:#fff;font-family:Arial,Helvetica,sans-serif;font-size:10px;text-transform:uppercase;vertical-align:bottom&quot;&gt;shop with us:&lt;/td&gt;\r\n									&lt;td colspan=&quot;3&quot; style=&quot;background-color:#000000;color:#bdff00;font-family:Arial,Helvetica,sans-serif;font-size:10px;text-transform:uppercase;vertical-align:bottom&quot;&gt;&lt;a href=&quot;#13fc8b147775b7dc_&quot; style=&quot;background-color:#000000;color:#ffffff;font-family:Arial,Helvetica,sans-serif;font-size:10px;text-transform:uppercase;vertical-align:bottom;text-decoration:none&quot;&gt;HELP &amp;amp; CONTACT:&lt;/a&gt;&lt;/td&gt;\r\n									&lt;td rowspan=&quot;3&quot;&gt;&lt;a href=&quot;http://topman.chtah.com/a/hBR3UW7Bzu2XWB8zz$5NslLlVwb/tmuk28&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;SHOP ONLINE AND COLLECT IN STORE&quot; border=&quot;0&quot; height=&quot;63&quot; src=&quot;http://f.chtah.com/i/47/1941661142/BottomNav_Email_11.gif&quot; style=&quot;display:block&quot; width=&quot;227&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n									&lt;td&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td background=&quot;http://f.chtah.com/i/47/1941661142/spacer.gif&quot; height=&quot;32&quot; width=&quot;1&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n								&lt;/tr&gt;\r\n								&lt;tr&gt;\r\n									&lt;td colspan=&quot;6&quot; style=&quot;background-color:#000000;color:#bdff00;font-family:Arial,Helvetica,sans-serif;font-size:10px;text-transform:uppercase;vertical-align:bottom&quot;&gt;&lt;a href=&quot;http://topman.chtah.com/a/hBR3UW7Bzu2XWB8zz$5NslLlVwb/tmuk22&quot; style=&quot;background-color:#000000;color:#bdff00;font-family:Arial,Helvetica,sans-serif;font-size:10px;text-transform:uppercase;vertical-align:bottom;text-decoration:none&quot; target=&quot;_blank&quot;&gt;mobile&lt;/a&gt;&lt;/td&gt;\r\n									&lt;td colspan=&quot;3&quot; style=&quot;background-color:#000000;color:#bdff00;font-family:Arial,Helvetica,sans-serif;font-size:10px;text-transform:uppercase;vertical-align:bottom&quot;&gt;&lt;a href=&quot;http://topman.chtah.com/a/hBR3UW7Bzu2XWB8zz$5NslLlVwb/tmuk18#fragment-2&amp;amp;cmpid=em_y12_uk_sm&amp;amp;_$ja=tsid:19897&quot; style=&quot;background-color:#000000;color:#666;font-family:Arial,Helvetica,sans-serif;font-size:10px;text-transform:uppercase;vertical-align:bottom;text-decoration:none&quot; target=&quot;_blank&quot;&gt;DELIVERY &amp;amp; RETURNS&lt;/a&gt;&lt;/td&gt;\r\n									&lt;td background=&quot;http://f.chtah.com/i/47/1941661142/spacer.gif&quot; height=&quot;21&quot; width=&quot;1&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n								&lt;/tr&gt;\r\n								&lt;tr&gt;\r\n									&lt;td colspan=&quot;6&quot; rowspan=&quot;2&quot; style=&quot;background-color:#000000;color:#bdff00;font-family:Arial,Helvetica,sans-serif;font-size:10px;text-transform:uppercase;vertical-align:bottom&quot;&gt;&lt;a href=&quot;http://topman.chtah.com/a/hBR3UW7Bzu2XWB8zz$5NslLlVwb/tmuk10&quot; style=&quot;background-color:#000000;color:#bdff00;font-family:Arial,Helvetica,sans-serif;font-size:10px;text-transform:uppercase;vertical-align:bottom;text-decoration:none&quot; target=&quot;_blank&quot;&gt;IPAD &amp;amp; IPHONE APP&lt;/a&gt;&lt;/td&gt;\r\n									&lt;td colspan=&quot;3&quot; rowspan=&quot;2&quot; style=&quot;background-color:#000000;color:#bdff00;font-family:Arial,Helvetica,sans-serif;font-size:10px;text-transform:uppercase;vertical-align:bottom&quot;&gt;&lt;a href=&quot;http://topman.chtah.com/a/hBR3UW7Bzu2XWB8zz$5NslLlVwb/tmuk16#fragment-8&amp;amp;cmpid=em_y12_uk_sm&amp;amp;_$ja=tsid:19897&quot; style=&quot;background-color:#000000;color:#666;font-family:Arial,Helvetica,sans-serif;font-size:10px;text-transform:uppercase;vertical-align:bottom;text-decoration:none&quot; target=&quot;_blank&quot;&gt;HELP &amp;amp; FAQS&lt;/a&gt;&lt;/td&gt;\r\n									&lt;td background=&quot;http://f.chtah.com/i/47/1941661142/spacer.gif&quot; height=&quot;10&quot; width=&quot;1&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n								&lt;/tr&gt;\r\n								&lt;tr&gt;\r\n									&lt;td rowspan=&quot;4&quot;&gt;&lt;a href=&quot;http://topman.chtah.com/a/hBR3UW7Bzu2XWB8zz$5NslLlVwb/tmuk22&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;SHOP ON THE GO&quot; border=&quot;0&quot; height=&quot;57&quot; src=&quot;http://f.chtah.com/i/47/1941661142/BottomNav_Email_16.gif&quot; style=&quot;display:block&quot; width=&quot;227&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n									&lt;td background=&quot;http://f.chtah.com/i/47/1941661142/spacer.gif&quot; height=&quot;11&quot; width=&quot;1&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n								&lt;/tr&gt;\r\n								&lt;tr&gt;\r\n									&lt;td colspan=&quot;6&quot; style=&quot;background-color:#000000;color:#bdff00;font-family:Arial,Helvetica,sans-serif;font-size:10px;text-transform:uppercase;vertical-align:bottom&quot;&gt;&lt;a href=&quot;http://topman.chtah.com/a/hBR3UW7Bzu2XWB8zz$5NslLlVwb/tmuk23&quot; style=&quot;background-color:#000000;color:#bdff00;font-family:Arial,Helvetica,sans-serif;font-size:10px;text-transform:uppercase;vertical-align:bottom;text-decoration:none&quot; target=&quot;_blank&quot;&gt;STUDENT DISCOUNT&lt;/a&gt;&lt;/td&gt;\r\n									&lt;td colspan=&quot;3&quot; style=&quot;background-color:#000000;color:#bdff00;font-family:Arial,Helvetica,sans-serif;font-size:10px;text-transform:uppercase;vertical-align:bottom&quot;&gt;&lt;a href=&quot;http://topman.chtah.com/a/hBR3UW7Bzu2XWB8zz$5NslLlVwb/tmuk31&quot; style=&quot;background-color:#000000;color:#666;font-family:Arial,Helvetica,sans-serif;font-size:10px;text-transform:uppercase;vertical-align:bottom;text-decoration:none&quot; target=&quot;_blank&quot;&gt;CONTACT US&lt;/a&gt;&lt;/td&gt;\r\n									&lt;td background=&quot;http://f.chtah.com/i/47/1941661142/spacer.gif&quot; height=&quot;21&quot; width=&quot;1&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n								&lt;/tr&gt;\r\n								&lt;tr&gt;\r\n									&lt;td colspan=&quot;6&quot; style=&quot;background-color:#000000;color:#bdff00;font-family:Arial,Helvetica,sans-serif;font-size:10px;text-transform:uppercase;vertical-align:bottom&quot;&gt;&lt;a href=&quot;http://topman.chtah.com/a/hBR3UW7Bzu2XWB8zz$5NslLlVwb/tmuk24&quot; style=&quot;background-color:#000000;color:#bdff00;font-family:Arial,Helvetica,sans-serif;font-size:10px;text-transform:uppercase;vertical-align:bottom;text-decoration:none&quot; target=&quot;_blank&quot;&gt;GIFT CARD&lt;/a&gt;&lt;/td&gt;\r\n									&lt;td colspan=&quot;3&quot; style=&quot;background-color:#000000;color:#bdff00;font-family:Arial,Helvetica,sans-serif;font-size:10px;text-transform:uppercase;vertical-align:bottom&quot;&gt;&lt;a href=&quot;http://topman.chtah.com/a/hBR3UW7Bzu2XWB8zz$5NslLlVwb/tmuk20&quot; style=&quot;background-color:#000000;color:#666;font-family:Arial,Helvetica,sans-serif;font-size:10px;text-transform:uppercase;vertical-align:bottom;text-decoration:none&quot; target=&quot;_blank&quot;&gt;SITE MAP&lt;/a&gt;&lt;/td&gt;\r\n									&lt;td background=&quot;http://f.chtah.com/i/47/1941661142/spacer.gif&quot; height=&quot;21&quot; width=&quot;1&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n								&lt;/tr&gt;\r\n								&lt;tr&gt;\r\n									&lt;td colspan=&quot;6&quot; rowspan=&quot;2&quot; style=&quot;background-color:#000000;color:#bdff00;font-family:Arial,Helvetica,sans-serif;font-size:10px;text-transform:uppercase;vertical-align:bottom&quot;&gt;&lt;a href=&quot;http://topman.chtah.com/a/hBR3UW7Bzu2XWB8zz$5NslLlVwb/tmuk8&quot; style=&quot;background-color:#000000;color:#bdff00;font-family:Arial,Helvetica,sans-serif;font-size:10px;text-transform:uppercase;vertical-align:bottom;text-decoration:none&quot; target=&quot;_blank&quot;&gt;TOPMAN CARD&lt;/a&gt;&lt;/td&gt;\r\n									&lt;td colspan=&quot;3&quot; rowspan=&quot;2&quot; style=&quot;background-color:#000000;color:#bdff00;font-family:Arial,Helvetica,sans-serif;font-size:10px;text-transform:uppercase;vertical-align:bottom&quot;&gt;&lt;a href=&quot;http://topman.chtah.com/a/hBR3UW7Bzu2XWB8zz$5NslLlVwb/tmuk19#fragment-9&amp;amp;cmpid=em_y12_uk_sm&amp;amp;_$ja=tsid:19897&quot; style=&quot;background-color:#000000;color:#666;font-family:Arial,Helvetica,sans-serif;font-size:10px;text-transform:uppercase;vertical-align:bottom;text-decoration:none&quot; target=&quot;_blank&quot;&gt;PRIVACY &amp;amp; COOKIES&lt;/a&gt;&lt;/td&gt;\r\n									&lt;td background=&quot;http://f.chtah.com/i/47/1941661142/spacer.gif&quot; height=&quot;4&quot; width=&quot;1&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n								&lt;/tr&gt;\r\n								&lt;tr&gt;\r\n									&lt;td rowspan=&quot;4&quot;&gt;&lt;a href=&quot;http://topman.chtah.com/a/hBR3UW7Bzu2XWB8zz$5NslLlVwb/tmuk9#slide5&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;&quot; border=&quot;0&quot; height=&quot;70&quot; src=&quot;http://f.chtah.com/i/47/1941661142/BottomNav_Email_23.gif&quot; style=&quot;display:block&quot; width=&quot;227&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n									&lt;td background=&quot;http://f.chtah.com/i/47/1941661142/spacer.gif&quot; height=&quot;17&quot; width=&quot;1&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n								&lt;/tr&gt;\r\n								&lt;tr&gt;\r\n									&lt;td colspan=&quot;6&quot; style=&quot;background-color:#000000;color:#bdff00;font-family:Arial,Helvetica,sans-serif;font-size:10px;text-transform:uppercase;vertical-align:bottom&quot;&gt;&lt;a href=&quot;http://topman.chtah.com/a/hBR3UW7Bzu2XWB8zz$5NslLlVwb/tmuk15&quot; style=&quot;background-color:#000000;color:#bdff00;font-family:Arial,Helvetica,sans-serif;font-size:10px;text-transform:uppercase;vertical-align:bottom;text-decoration:none&quot; target=&quot;_blank&quot;&gt;PERSONAL SHOPPING&lt;/a&gt;&lt;/td&gt;\r\n									&lt;td colspan=&quot;3&quot; style=&quot;background-color:#000000;color:#bdff00;font-family:Arial,Helvetica,sans-serif;font-size:10px;text-transform:uppercase;vertical-align:bottom&quot;&gt;&lt;a href=&quot;http://topman.chtah.com/a/hBR3UW7Bzu2XWB8zz$5NslLlVwb/tmuk17#fragment-1&amp;amp;cmpid=em_y12_uk_sm&amp;amp;_$ja=tsid:19897&quot; style=&quot;background-color:#000000;color:#666;font-family:Arial,Helvetica,sans-serif;font-size:10px;text-transform:uppercase;vertical-align:bottom;text-decoration:none&quot; target=&quot;_blank&quot;&gt;TERMS AND CONDITIONS&lt;/a&gt;&lt;/td&gt;\r\n									&lt;td background=&quot;http://f.chtah.com/i/47/1941661142/spacer.gif&quot; height=&quot;21&quot; width=&quot;1&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n								&lt;/tr&gt;\r\n								&lt;tr&gt;\r\n									&lt;td colspan=&quot;6&quot; style=&quot;background-color:#000000;color:#bdff00;font-family:Arial,Helvetica,sans-serif;font-size:10px;text-transform:uppercase;vertical-align:bottom&quot;&gt;&lt;a href=&quot;http://topman.chtah.com/a/hBR3UW7Bzu2XWB8zz$5NslLlVwb/tmuk21&quot; style=&quot;background-color:#000000;color:#bdff00;font-family:Arial,Helvetica,sans-serif;font-size:10px;text-transform:uppercase;vertical-align:bottom;text-decoration:none&quot; target=&quot;_blank&quot;&gt;CUSTOMER REVIEWS&lt;/a&gt;&lt;/td&gt;\r\n									&lt;td colspan=&quot;3&quot; style=&quot;background-color:#000000;color:#bdff00;font-family:Arial,Helvetica,sans-serif;font-size:10px;text-transform:uppercase;vertical-align:bottom&quot;&gt;&lt;a href=&quot;http://topman.chtah.com/a/hBR3UW7Bzu2XWB8zz$5NslLlVwb/tmuk14&quot; style=&quot;background-color:#000000;color:#666;font-family:Arial,Helvetica,sans-serif;font-size:10px;text-transform:uppercase;vertical-align:bottom;text-decoration:none&quot; target=&quot;_blank&quot;&gt;WORK WITH US&lt;/a&gt;&lt;/td&gt;\r\n									&lt;td background=&quot;http://f.chtah.com/i/47/1941661142/spacer.gif&quot; height=&quot;21&quot; width=&quot;1&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n								&lt;/tr&gt;\r\n								&lt;tr&gt;\r\n									&lt;td colspan=&quot;6&quot; height=&quot;11&quot; width=&quot;220&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td colspan=&quot;3&quot; height=&quot;11&quot; width=&quot;233&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td background=&quot;http://f.chtah.com/i/47/1941661142/spacer.gif&quot; height=&quot;11&quot; width=&quot;1&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n								&lt;/tr&gt;\r\n								&lt;tr&gt;\r\n									&lt;td background=&quot;http://f.chtah.com/i/47/1941661142/spacer.gif&quot; height=&quot;1&quot; width=&quot;33&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td background=&quot;http://f.chtah.com/i/47/1941661142/spacer.gif&quot; height=&quot;1&quot; width=&quot;36&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td background=&quot;http://f.chtah.com/i/47/1941661142/spacer.gif&quot; height=&quot;1&quot; width=&quot;41&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td background=&quot;http://f.chtah.com/i/47/1941661142/spacer.gif&quot; height=&quot;1&quot; width=&quot;37&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td background=&quot;http://f.chtah.com/i/47/1941661142/spacer.gif&quot; height=&quot;1&quot; width=&quot;39&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td background=&quot;http://f.chtah.com/i/47/1941661142/spacer.gif&quot; height=&quot;1&quot; width=&quot;34&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td background=&quot;http://f.chtah.com/i/47/1941661142/spacer.gif&quot; height=&quot;1&quot; width=&quot;4&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td background=&quot;http://f.chtah.com/i/47/1941661142/spacer.gif&quot; height=&quot;1&quot; width=&quot;129&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td background=&quot;http://f.chtah.com/i/47/1941661142/spacer.gif&quot; height=&quot;1&quot; width=&quot;100&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td background=&quot;http://f.chtah.com/i/47/1941661142/spacer.gif&quot; height=&quot;1&quot; width=&quot;127&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n									&lt;td&gt;&amp;nbsp;&lt;/td&gt;\r\n								&lt;/tr&gt;\r\n							&lt;/tbody&gt;\r\n						&lt;/table&gt;\r\n						&lt;/td&gt;\r\n						&lt;td width=&quot;10&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n					&lt;/tr&gt;\r\n				&lt;/tbody&gt;\r\n			&lt;/table&gt;\r\n			&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td&gt;\r\n			&lt;table border=&quot;0&quot; width=&quot;700&quot;&gt;\r\n				&lt;tbody&gt;\r\n					&lt;tr&gt;\r\n						&lt;td style=&quot;padding:10pt 10pt 10pt 10pt;font-size:10px;font-family:Arial,Helvetica,sans-serif;color:#fff;text-align:left&quot;&gt;This Topman message was sent to &lt;strong&gt;&lt;a href=&quot;mailto:welookvn@gmail.com&quot; target=&quot;_blank&quot;&gt;welookvn@gmail.com&lt;/a&gt;&lt;/strong&gt;.&lt;br /&gt;\r\n						&lt;br /&gt;\r\n						&lt;a href=&quot;http://topman.chtah.com/a/hBR3UW7Bzu2XWB8zz$5NslLlVwb/tmuk5?password=Bzu2XWNslLlVBR3UW7lQksRxcs1CFR&quot; style=&quot;text-decoration:underline;color:#ffffff&quot; target=&quot;_blank&quot;&gt;&lt;span style=&quot;color:#ffffff;font-size:10px;padding:0px 0px 0px 0px;font-family:Arial,Helvetica,sans-serif&quot;&gt;Unsubscribe&lt;/span&gt;&lt;/a&gt; from the Topman email list&lt;br /&gt;\r\n						&lt;br /&gt;\r\n						&lt;strong&gt;Handy hint:&lt;/strong&gt; To ensure that our messages reach your inbox (rather than the junk or bulk email folders) please add &quot;&lt;a href=&quot;mailto:topman@mail.topman.com&quot; target=&quot;_blank&quot;&gt;topman@mail.topman.com&lt;/a&gt;&quot; to your Address Book.&lt;br /&gt;\r\n						&lt;br /&gt;\r\n						Arcadia Group Brands Limited (Company Number 1016191) trading as Topman is a company incorporated in England and Wales. Its registered office is at Colegrave House, 70 Berners Street, London W1T 3NL.&lt;br /&gt;\r\n						&lt;br /&gt;\r\n						VAT no. GB 169 0943 36&lt;/td&gt;\r\n					&lt;/tr&gt;\r\n				&lt;/tbody&gt;\r\n			&lt;/table&gt;\r\n			&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n	&lt;/tbody&gt;\r\n&lt;/table&gt;\r\n&lt;img src=&quot;http://topman.chtah.com/a/hBR3UW7Bzu2XWB8zz$5NslLlVwb/spacer.gif&quot; /&gt;\r\n&lt;div class=&quot;yj6qo&quot;&gt;&amp;nbsp;&lt;/div&gt;\r\n\r\n&lt;div class=&quot;adL&quot;&gt;&amp;nbsp;&lt;/div&gt;\r\n&lt;/div&gt;\r\n', '', ''),
(19, 2, 'G2000 - Nhanh tay chọn cho mình món đồ ưng ý nào!! SALE 50% - Toàn đồ đẹp các bạn nhé ^ ^', '', '&lt;div&gt;\r\n&lt;table align=&quot;center&quot; border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; width=&quot;569&quot;&gt;\r\n	&lt;tbody&gt;\r\n		&lt;tr&gt;\r\n			&lt;td align=&quot;center&quot; height=&quot;80&quot;&gt;&lt;font style=&quot;font-family:Arial,Helvetica,sans-serif;font-size:10px;color:#666666&quot;&gt;If you can''t view this mailer, please click&amp;nbsp;&lt;a href=&quot;http://us1.campaign-archive2.com/?u=b85f869bd9b00ebfba585468b&amp;amp;id=c89f241f9b&amp;amp;e=aa1810395b&quot; style=&quot;color:#666666&quot; target=&quot;_blank&quot;&gt;here&lt;/a&gt;. &lt;/font&gt;&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td align=&quot;center&quot; valign=&quot;top&quot;&gt;\r\n			&lt;table align=&quot;center&quot; border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; width=&quot;569&quot;&gt;\r\n				&lt;tbody&gt;\r\n					&lt;tr&gt;\r\n						&lt;td align=&quot;center&quot; valign=&quot;top&quot; width=&quot;569&quot;&gt;&lt;a href=&quot;http://g2000.us1.list-manage.com/track/click?u=b85f869bd9b00ebfba585468b&amp;amp;id=c6d19b5ca7&amp;amp;e=aa1810395b&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;Summer''13&quot; height=&quot;36&quot; src=&quot;http://gallery.mailchimp.com/b85f869bd9b00ebfba585468b/images/1.21.jpg&quot; style=&quot;display:block;border:none&quot; width=&quot;569&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n					&lt;/tr&gt;\r\n					&lt;tr&gt;\r\n						&lt;td align=&quot;center&quot; valign=&quot;top&quot;&gt;\r\n						&lt;table border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; width=&quot;569&quot;&gt;\r\n							&lt;tbody&gt;\r\n								&lt;tr&gt;\r\n									&lt;td align=&quot;left&quot; valign=&quot;top&quot;&gt;&lt;a href=&quot;http://g2000.us1.list-manage2.com/track/click?u=b85f869bd9b00ebfba585468b&amp;amp;id=84242d30e0&amp;amp;e=aa1810395b&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;G2000&quot; height=&quot;31&quot; src=&quot;http://gallery.mailchimp.com/b85f869bd9b00ebfba585468b/images/2.17.jpg&quot; style=&quot;display:block;border:none&quot; width=&quot;162&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n									&lt;td align=&quot;left&quot;&gt;\r\n									&lt;table border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; width=&quot;407&quot;&gt;\r\n										&lt;tbody&gt;\r\n											&lt;tr&gt;\r\n												&lt;td align=&quot;left&quot; valign=&quot;top&quot;&gt;&lt;img alt=&quot;&quot; height=&quot;10&quot; src=&quot;http://gallery.mailchimp.com/b85f869bd9b00ebfba585468b/images/3.18.jpg&quot; style=&quot;display:block;border:none&quot; width=&quot;407&quot; /&gt;&lt;/td&gt;\r\n											&lt;/tr&gt;\r\n											&lt;tr&gt;\r\n												&lt;td&gt;\r\n												&lt;table border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; width=&quot;407&quot;&gt;\r\n													&lt;tbody&gt;\r\n														&lt;tr&gt;\r\n															&lt;td height=&quot;13&quot;&gt;&lt;img alt=&quot;&quot; height=&quot;13&quot; src=&quot;http://gallery.mailchimp.com/b85f869bd9b00ebfba585468b/images/6.13.jpg&quot; style=&quot;display:block;border:none&quot; width=&quot;19&quot; /&gt;&lt;/td&gt;\r\n															&lt;td&gt;&lt;a href=&quot;http://g2000.us1.list-manage.com/track/click?u=b85f869bd9b00ebfba585468b&amp;amp;id=e2e8ce545e&amp;amp;e=aa1810395b&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;The Collections&quot; height=&quot;13&quot; src=&quot;http://gallery.mailchimp.com/b85f869bd9b00ebfba585468b/images/5.14.jpg&quot; style=&quot;display:block;border:none&quot; width=&quot;106&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n															&lt;td&gt;&lt;img alt=&quot;&quot; height=&quot;13&quot; src=&quot;http://gallery.mailchimp.com/b85f869bd9b00ebfba585468b/images/6.13.jpg&quot; style=&quot;display:block;border:none&quot; width=&quot;19&quot; /&gt;&lt;/td&gt;\r\n															&lt;td&gt;&lt;a href=&quot;http://g2000.us1.list-manage1.com/track/click?u=b85f869bd9b00ebfba585468b&amp;amp;id=8ae054553a&amp;amp;e=aa1810395b&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;News &amp;amp; Promotions&quot; height=&quot;13&quot; src=&quot;http://gallery.mailchimp.com/b85f869bd9b00ebfba585468b/images/7.13.jpg&quot; style=&quot;display:block;border:none&quot; width=&quot;125&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n															&lt;td&gt;&lt;img alt=&quot;&quot; height=&quot;13&quot; src=&quot;http://gallery.mailchimp.com/b85f869bd9b00ebfba585468b/images/6.13.jpg&quot; style=&quot;display:block;border:none&quot; width=&quot;19&quot; /&gt;&lt;/td&gt;\r\n															&lt;td&gt;&lt;a href=&quot;http://g2000.us1.list-manage1.com/track/click?u=b85f869bd9b00ebfba585468b&amp;amp;id=0adaa420dc&amp;amp;e=aa1810395b&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;G2K Membership&quot; height=&quot;13&quot; src=&quot;http://gallery.mailchimp.com/b85f869bd9b00ebfba585468b/images/9.10.jpg&quot; style=&quot;display:block;border:none&quot; width=&quot;100&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n															&lt;td&gt;&lt;img alt=&quot;&quot; height=&quot;13&quot; src=&quot;http://gallery.mailchimp.com/b85f869bd9b00ebfba585468b/images/6.13.jpg&quot; style=&quot;display:block;border:none&quot; width=&quot;19&quot; /&gt;&lt;/td&gt;\r\n														&lt;/tr&gt;\r\n													&lt;/tbody&gt;\r\n												&lt;/table&gt;\r\n												&lt;/td&gt;\r\n											&lt;/tr&gt;\r\n											&lt;tr&gt;\r\n												&lt;td align=&quot;left&quot; valign=&quot;top&quot;&gt;&lt;img alt=&quot;&quot; height=&quot;7&quot; src=&quot;http://gallery.mailchimp.com/b85f869bd9b00ebfba585468b/images/11.9.jpg&quot; style=&quot;display:block;border:none&quot; width=&quot;407&quot; /&gt;&lt;/td&gt;\r\n											&lt;/tr&gt;\r\n										&lt;/tbody&gt;\r\n									&lt;/table&gt;\r\n									&lt;/td&gt;\r\n								&lt;/tr&gt;\r\n							&lt;/tbody&gt;\r\n						&lt;/table&gt;\r\n						&lt;/td&gt;\r\n					&lt;/tr&gt;\r\n					&lt;tr&gt;\r\n						&lt;td align=&quot;center&quot; valign=&quot;top&quot;&gt;&lt;img alt=&quot;&quot; height=&quot;14&quot; src=&quot;http://gallery.mailchimp.com/b85f869bd9b00ebfba585468b/images/12.6.jpg&quot; style=&quot;display:block;border:none&quot; width=&quot;569&quot; /&gt;&lt;/td&gt;\r\n					&lt;/tr&gt;\r\n					&lt;tr&gt;\r\n						&lt;td align=&quot;center&quot; valign=&quot;top&quot;&gt;&lt;a href=&quot;http://g2000.us1.list-manage.com/track/click?u=b85f869bd9b00ebfba585468b&amp;amp;id=6e32fec37c&amp;amp;e=aa1810395b&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;Refresh your wardrobe at the G2000 end season sale. Up to 50% off storewide.&quot; height=&quot;370&quot; src=&quot;http://gallery.mailchimp.com/b85f869bd9b00ebfba585468b/images/content1.8.jpg&quot; style=&quot;display:block;border:none&quot; width=&quot;569&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n					&lt;/tr&gt;\r\n					&lt;tr&gt;\r\n						&lt;td align=&quot;center&quot; valign=&quot;top&quot;&gt;&lt;img alt=&quot;&quot; height=&quot;14&quot; src=&quot;http://gallery.mailchimp.com/b85f869bd9b00ebfba585468b/images/12.6.jpg&quot; style=&quot;display:block;border:none&quot; width=&quot;569&quot; /&gt;&lt;/td&gt;\r\n					&lt;/tr&gt;\r\n					&lt;tr&gt;\r\n						&lt;td align=&quot;center&quot; valign=&quot;top&quot;&gt;&lt;a href=&quot;http://g2000.us1.list-manage.com/track/click?u=b85f869bd9b00ebfba585468b&amp;amp;id=8e69a925c5&amp;amp;e=aa1810395b&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;Sizzling deals. Show off your hottest looks this season!&quot; height=&quot;223&quot; src=&quot;http://gallery.mailchimp.com/b85f869bd9b00ebfba585468b/images/content2.10.jpg&quot; style=&quot;display:block;border:none&quot; width=&quot;569&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n					&lt;/tr&gt;\r\n					&lt;tr&gt;\r\n						&lt;td align=&quot;center&quot; valign=&quot;top&quot;&gt;&lt;img alt=&quot;&quot; height=&quot;14&quot; src=&quot;http://gallery.mailchimp.com/b85f869bd9b00ebfba585468b/images/12.6.jpg&quot; style=&quot;display:block;border:none&quot; width=&quot;569&quot; /&gt;&lt;/td&gt;\r\n					&lt;/tr&gt;\r\n					&lt;tr&gt;\r\n						&lt;td align=&quot;center&quot; valign=&quot;top&quot;&gt;&lt;a href=&quot;http://g2000.us1.list-manage1.com/track/click?u=b85f869bd9b00ebfba585468b&amp;amp;id=1df759dba8&amp;amp;e=aa1810395b&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;Lifetime privileges are now easier. Join us as a G2K member today! Simply spend $250 nett* in a single receipt.&quot; height=&quot;115&quot; src=&quot;http://gallery.mailchimp.com/b85f869bd9b00ebfba585468b/images/content3.3.jpg&quot; style=&quot;display:block;border:none&quot; width=&quot;570&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n					&lt;/tr&gt;\r\n					&lt;tr&gt;\r\n						&lt;td align=&quot;center&quot; valign=&quot;top&quot;&gt;&lt;img alt=&quot;&quot; height=&quot;29&quot; src=&quot;http://gallery.mailchimp.com/b85f869bd9b00ebfba585468b/images/g10.jpg&quot; style=&quot;display:block;border:none&quot; width=&quot;569&quot; /&gt;&lt;/td&gt;\r\n					&lt;/tr&gt;\r\n					&lt;tr&gt;\r\n						&lt;td align=&quot;center&quot; valign=&quot;top&quot;&gt;\r\n						&lt;table border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; width=&quot;569&quot;&gt;\r\n							&lt;tbody&gt;\r\n								&lt;tr&gt;\r\n									&lt;td&gt;&lt;img alt=&quot;Let''s get social!&quot; height=&quot;31&quot; src=&quot;http://gallery.mailchimp.com/b85f869bd9b00ebfba585468b/images/get_social.jpg&quot; style=&quot;display:block;border:none&quot; width=&quot;366&quot; /&gt;&lt;/td&gt;\r\n									&lt;td&gt;&lt;a href=&quot;http://g2000.us1.list-manage.com/track/click?u=b85f869bd9b00ebfba585468b&amp;amp;id=4af07c686c&amp;amp;e=aa1810395b&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;Facebook&quot; height=&quot;31&quot; src=&quot;http://gallery.mailchimp.com/b85f869bd9b00ebfba585468b/images/fb.6.jpg&quot; style=&quot;display:block;border:none&quot; width=&quot;30&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n									&lt;td&gt;&lt;img alt=&quot;&quot; height=&quot;31&quot; src=&quot;http://gallery.mailchimp.com/b85f869bd9b00ebfba585468b/images/fb_vspacer1.jpg&quot; style=&quot;display:block;border:none&quot; width=&quot;12&quot; /&gt;&lt;/td&gt;\r\n									&lt;td&gt;&lt;a href=&quot;http://g2000.us1.list-manage.com/track/click?u=b85f869bd9b00ebfba585468b&amp;amp;id=2b953f7351&amp;amp;e=aa1810395b&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;Instagram&quot; height=&quot;31&quot; src=&quot;http://gallery.mailchimp.com/b85f869bd9b00ebfba585468b/images/instagram.jpg&quot; style=&quot;display:block;border:none&quot; width=&quot;32&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n									&lt;td&gt;&lt;img alt=&quot;&quot; height=&quot;31&quot; src=&quot;http://gallery.mailchimp.com/b85f869bd9b00ebfba585468b/images/fb_vspacer2.jpg&quot; style=&quot;display:block;border:none&quot; width=&quot;129&quot; /&gt;&lt;/td&gt;\r\n								&lt;/tr&gt;\r\n							&lt;/tbody&gt;\r\n						&lt;/table&gt;\r\n						&lt;/td&gt;\r\n					&lt;/tr&gt;\r\n					&lt;tr&gt;\r\n						&lt;td align=&quot;center&quot; valign=&quot;top&quot;&gt;&lt;img alt=&quot;&quot; height=&quot;34&quot; src=&quot;http://gallery.mailchimp.com/b85f869bd9b00ebfba585468b/images/g11.jpg&quot; style=&quot;display:block;border:none&quot; width=&quot;569&quot; /&gt;&lt;/td&gt;\r\n					&lt;/tr&gt;\r\n					&lt;tr&gt;\r\n						&lt;td align=&quot;center&quot; valign=&quot;top&quot;&gt;&lt;img alt=&quot;&quot; height=&quot;74&quot; src=&quot;http://gallery.mailchimp.com/b85f869bd9b00ebfba585468b/images/tc.jpg&quot; style=&quot;display:block;border:none&quot; width=&quot;569&quot; /&gt;&lt;/td&gt;\r\n					&lt;/tr&gt;\r\n				&lt;/tbody&gt;\r\n			&lt;/table&gt;\r\n			&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td align=&quot;center&quot; height=&quot;80&quot;&gt;&lt;font style=&quot;font-family:Arial,Helvetica,sans-serif;font-size:10px;color:#666666&quot;&gt;To unsubscribe from receiving further updates please click &lt;a href=&quot;http://g2000.us1.list-manage1.com/unsubscribe?u=b85f869bd9b00ebfba585468b&amp;amp;id=a48f0f2811&amp;amp;e=aa1810395b&amp;amp;c=c89f241f9b&quot; style=&quot;color:#666666&quot; target=&quot;_blank&quot;&gt;here&lt;/a&gt;. &lt;/font&gt;&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n	&lt;/tbody&gt;\r\n&lt;/table&gt;\r\n&lt;img height=&quot;1&quot; src=&quot;http://g2000.us1.list-manage.com/track/open.php?u=b85f869bd9b00ebfba585468b&amp;amp;id=c89f241f9b&amp;amp;e=aa1810395b&quot; width=&quot;1&quot; /&gt;&lt;/div&gt;\r\n', '', '');
INSERT INTO `news_description` (`news_id`, `language_id`, `name`, `short_description`, `description`, `meta_description`, `meta_keyword`) VALUES
(21, 2, 'UNI QLO - Xả hàng đồng giá 9.9 USD / UT tshirt !! Mua ngay mua ngay :D', '', '&lt;div&gt;\r\n&lt;table align=&quot;center&quot; border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; width=&quot;749&quot;&gt;\r\n	&lt;tbody&gt;\r\n		&lt;tr&gt;\r\n			&lt;td&gt;&amp;nbsp;&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td&gt;\r\n			&lt;table border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; width=&quot;749&quot;&gt;\r\n				&lt;tbody&gt;\r\n					&lt;tr&gt;\r\n						&lt;td width=&quot;590&quot;&gt;\r\n						&lt;p style=&quot;font-size:0.69em;color:#adadad;font-family:Arial,Helvetica,sans-serif;line-height:14px&quot;&gt;Shop our Sale! Don’t miss your chance to stock up your closet with summer-time essentials.&lt;br /&gt;\r\n						Having trouble viewing this message? &lt;a href=&quot;http://ml.uniqlo-usa.com/hosted?Z4gvKJo622IzTByWWzQ6RjhVFL8QbVX8Ylr-hBVP3-R4DHelBfUtA1MsomFWVja7gd6vzw==&quot; style=&quot;text-decoration:none;color:#ff0000&quot; target=&quot;_blank&quot;&gt;click here&lt;/a&gt;&lt;/p&gt;\r\n						&lt;/td&gt;\r\n						&lt;td align=&quot;right&quot; width=&quot;159&quot;&gt;&lt;img alt=&quot;share&quot; border=&quot;0&quot; height=&quot;32&quot; src=&quot;http://www.uniqlo.com/global_images/us/mail/nav/share.png&quot; width=&quot;78&quot; /&gt; &lt;a href=&quot;http://ml.uniqlo-usa.com/cgi-bin8/DM/t/nqMl0MyyGE0OYU0BIT50Ev&quot; style=&quot;text-decoration:none;display:inline-block&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;facebook&quot; border=&quot;0&quot; height=&quot;32&quot; src=&quot;http://www.uniqlo.com/global_images/us/mail/nav/facebook_button.png&quot; width=&quot;33&quot; /&gt;&lt;/a&gt;&lt;a href=&quot;https://twitter.com/intent/tweet?url=http://uniqlo.us/15BoEdj&amp;amp;text=Summer%20Savings!%20Stock%20up%20on%20cool%20UT%20T-shirts&quot; style=&quot;text-decoration:none&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;twitter&quot; border=&quot;0&quot; height=&quot;32&quot; src=&quot;http://www.uniqlo.com/global_images/us/mail/nav/twitter_button.png&quot; width=&quot;31&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n					&lt;/tr&gt;\r\n				&lt;/tbody&gt;\r\n			&lt;/table&gt;\r\n			&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td style=&quot;padding-top:10px&quot;&gt;\r\n			&lt;table border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; width=&quot;749&quot;&gt;\r\n				&lt;tbody&gt;\r\n					&lt;tr&gt;\r\n						&lt;td&gt;&lt;a href=&quot;http://ml.uniqlo-usa.com/cgi-bin8/DM/t/nqMl0MyyGE0OYU0BIT60Ew&quot; style=&quot;text-decoration:none;display:inline-block;outline:0&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;uniqlo-logo&quot; border=&quot;0&quot; height=&quot;60&quot; src=&quot;http://www.uniqlo.com/global_images/us/mail/nav/uniqlo_logo.png&quot; width=&quot;135&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n						&lt;td width=&quot;360&quot;&gt;\r\n						&lt;table border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot;&gt;\r\n							&lt;tbody&gt;\r\n								&lt;tr&gt;\r\n									&lt;td&gt;&lt;a href=&quot;http://ml.uniqlo-usa.com/cgi-bin8/DM/t/nqMl0MyyGE0OYU0BIT70Ex&quot; style=&quot;text-decoration:none;display:inline-block;outline:0&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;uniqlo-women&quot; border=&quot;0&quot; height=&quot;60&quot; src=&quot;http://www.uniqlo.com/global_images/us/mail/nav/nav_women.png&quot; width=&quot;60&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n									&lt;td&gt;&lt;a href=&quot;http://ml.uniqlo-usa.com/cgi-bin8/DM/t/nqMl0MyyGE0OYU0BIT80Ey&quot; style=&quot;text-decoration:none;display:inline-block;outline:0&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;uniqlo-men&quot; border=&quot;0&quot; height=&quot;60&quot; src=&quot;http://www.uniqlo.com/global_images/us/mail/nav/nav_men.png&quot; width=&quot;60&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n									&lt;td&gt;&lt;a href=&quot;http://ml.uniqlo-usa.com/cgi-bin8/DM/t/nqMl0MyyGE0OYU0BIUA0EA&quot; style=&quot;text-decoration:none;display:inline-block;outline:0&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;uniqlo-girl&quot; border=&quot;0&quot; height=&quot;60&quot; src=&quot;http://www.uniqlo.com/global_images/us/mail/nav/nav_girls.png&quot; width=&quot;60&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n									&lt;td&gt;&lt;a href=&quot;http://ml.uniqlo-usa.com/cgi-bin8/DM/t/nqMl0MyyGE0OYU0BIUB0EB&quot; style=&quot;text-decoration:none;display:inline-block;outline:0&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;uniqlo-boy&quot; border=&quot;0&quot; height=&quot;60&quot; src=&quot;http://www.uniqlo.com/global_images/us/mail/nav/nav_boys.png&quot; width=&quot;60&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n									&lt;td&gt;&lt;a href=&quot;http://ml.uniqlo-usa.com/cgi-bin8/DM/t/nqMl0MyyGE0OYU0BIUC0EC&quot; style=&quot;text-decoration:none;display:inline-block;outline:0&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;uniqlo-company&quot; border=&quot;0&quot; height=&quot;60&quot; src=&quot;http://www.uniqlo.com/global_images/us/mail/nav/nav_company.png&quot; width=&quot;60&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n									&lt;td&gt;&lt;a href=&quot;http://ml.uniqlo-usa.com/cgi-bin8/DM/t/nqMl0MyyGE0OYU0BIUD0ED&quot; style=&quot;text-decoration:none;display:inline-block;outline:0&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;uniqlo-help&quot; border=&quot;0&quot; height=&quot;60&quot; src=&quot;http://www.uniqlo.com/global_images/us/mail/nav/nav_help.png&quot; width=&quot;60&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n								&lt;/tr&gt;\r\n							&lt;/tbody&gt;\r\n						&lt;/table&gt;\r\n						&lt;/td&gt;\r\n					&lt;/tr&gt;\r\n				&lt;/tbody&gt;\r\n			&lt;/table&gt;\r\n			&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td style=&quot;padding:15px 0 0 0&quot;&gt;\r\n			&lt;table border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; width=&quot;749&quot;&gt;\r\n				&lt;tbody&gt;\r\n					&lt;tr&gt;\r\n						&lt;td&gt;&lt;a href=&quot;http://ml.uniqlo-usa.com/cgi-bin8/DM/t/nqMl0MyyGE0OYU0BIUE0EE&quot; style=&quot;text-decoration:none;outline:0&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;UT&quot; border=&quot;0&quot; height=&quot;279&quot; src=&quot;http://www.uniqlo.com/global_images/us/mail/20130714/hero_ut.gif&quot; style=&quot;display:block&quot; width=&quot;749&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n					&lt;/tr&gt;\r\n				&lt;/tbody&gt;\r\n			&lt;/table&gt;\r\n			&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td style=&quot;padding:15px 0 0 0&quot;&gt;\r\n			&lt;table border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; width=&quot;749&quot;&gt;\r\n				&lt;tbody&gt;\r\n					&lt;tr&gt;\r\n						&lt;td&gt;&lt;a href=&quot;http://ml.uniqlo-usa.com/cgi-bin8/DM/t/nqMl0MyyGE0OYU0BIUF0EF&quot; style=&quot;text-decoration:none;outline:0&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;UT&quot; border=&quot;0&quot; height=&quot;376&quot; src=&quot;http://www.uniqlo.com/global_images/us/mail/20130714/hero_ut_w.jpg&quot; style=&quot;display:block&quot; width=&quot;749&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n					&lt;/tr&gt;\r\n				&lt;/tbody&gt;\r\n			&lt;/table&gt;\r\n			&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td style=&quot;padding:15px 0 0 0&quot;&gt;\r\n			&lt;table border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; width=&quot;749&quot;&gt;\r\n				&lt;tbody&gt;\r\n					&lt;tr&gt;\r\n						&lt;td&gt;&lt;a href=&quot;http://www.uniqlo.com/us/store/lifewear/women-basquiat-ribbon-t-shirt/077611-31?utm_source=NL-2013-07-14&amp;amp;utm_medium=email&amp;amp;utm_content=Product-WOMEN-UT-1&amp;amp;utm_campaign=WEEK-28-071413-UT-MEN-WOMEN&quot; style=&quot;text-decoration:none;outline:0&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;WOMEN BASQUIAT T&quot; border=&quot;0&quot; height=&quot;220&quot; src=&quot;http://www.uniqlo.com/global_images/us/mail/20130714/prod_1_1.jpg&quot; style=&quot;display:block&quot; width=&quot;192&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n						&lt;td&gt;&lt;a href=&quot;http://www.uniqlo.com/us/store/lifewear/women-basquiat-front-ribbon-t-shirt/077607-65?utm_source=NL-2013-07-14&amp;amp;utm_medium=email&amp;amp;utm_content=Product-WOMEN-UT-2&amp;amp;utm_campaign=WEEK-28-071413-UT-MEN-WOMEN&quot; style=&quot;text-decoration:none;outline:0&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;WOMEN BASQUIAT T&quot; border=&quot;0&quot; height=&quot;220&quot; src=&quot;http://www.uniqlo.com/global_images/us/mail/20130714/prod_1_2.jpg&quot; style=&quot;display:block&quot; width=&quot;192&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n						&lt;td&gt;&lt;a href=&quot;http://www.uniqlo.com/us/store/lifewear/women-lulu-guinness-graphic-t-shirt/076706-09?utm_source=NL-2013-07-14&amp;amp;utm_medium=email&amp;amp;utm_content=Product-WOMEN-UT-3&amp;amp;utm_campaign=WEEK-28-071413-UT-MEN-WOMEN&quot; style=&quot;text-decoration:none;outline:0&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;WOMEN LULU GUINNESS T&quot; border=&quot;0&quot; height=&quot;220&quot; src=&quot;http://www.uniqlo.com/global_images/us/mail/20130714/prod_1_3.jpg&quot; style=&quot;display:block&quot; width=&quot;192&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n						&lt;td&gt;&lt;a href=&quot;http://www.uniqlo.com/us/store/lifewear/women-lulu-guinness-graphic-short-sleeve-t-shirt/076708-09-004?utm_source=NL-2013-07-14&amp;amp;utm_medium=email&amp;amp;utm_content=Product-WOMEN-UT-4&amp;amp;utm_campaign=WEEK-28-071413-UT-MEN-WOMEN&quot; style=&quot;text-decoration:none;outline:0&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;WOMEN LULU GUINNESS T&quot; border=&quot;0&quot; height=&quot;220&quot; src=&quot;http://www.uniqlo.com/global_images/us/mail/20130714/prod_1_4.jpg&quot; style=&quot;display:block&quot; width=&quot;173&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n					&lt;/tr&gt;\r\n				&lt;/tbody&gt;\r\n			&lt;/table&gt;\r\n			&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td style=&quot;padding:20px 0 0 0&quot;&gt;\r\n			&lt;table border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; width=&quot;749&quot;&gt;\r\n				&lt;tbody&gt;\r\n					&lt;tr&gt;\r\n						&lt;td&gt;&lt;a href=&quot;http://www.uniqlo.com/us/store/lifewear/women-karen-walker-short-sleeve-t-shirt/077760-69-003?utm_source=NL-2013-07-14&amp;amp;utm_medium=email&amp;amp;utm_content=Product-WOMEN-UT-5&amp;amp;utm_campaign=WEEK-28-071413-UT-MEN-WOMEN&quot; style=&quot;text-decoration:none;outline:0&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;WOMEN KAREN WALKER T&quot; border=&quot;0&quot; height=&quot;220&quot; src=&quot;http://www.uniqlo.com/global_images/us/mail/20130714/prod_1_5.jpg&quot; style=&quot;display:block&quot; width=&quot;192&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n						&lt;td&gt;&lt;a href=&quot;http://www.uniqlo.com/us/store/lifewear/women-karen-walker-short-sleeve-t-shirt/077762-69-005?utm_source=NL-2013-07-14&amp;amp;utm_medium=email&amp;amp;utm_content=Product-WOMEN-UT-6&amp;amp;utm_campaign=WEEK-28-071413-UT-MEN-WOMEN&quot; style=&quot;text-decoration:none;outline:0&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;WOMEN KAREN WALKER T&quot; border=&quot;0&quot; height=&quot;220&quot; src=&quot;http://www.uniqlo.com/global_images/us/mail/20130714/prod_1_6.jpg&quot; style=&quot;display:block&quot; width=&quot;192&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n						&lt;td&gt;&lt;a href=&quot;http://www.uniqlo.com/us/store/lifewear/women-snoopy-graphic-short-sleeve-t-shirt/075295-24?utm_source=NL-2013-07-14&amp;amp;utm_medium=email&amp;amp;utm_content=Product-WOMEN-UT-7&amp;amp;utm_campaign=WEEK-28-071413-UT-MEN-WOMEN&quot; style=&quot;text-decoration:none;outline:0&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;WOMEN SNOOPY T&quot; border=&quot;0&quot; height=&quot;220&quot; src=&quot;http://www.uniqlo.com/global_images/us/mail/20130714/prod_1_7.jpg&quot; style=&quot;display:block&quot; width=&quot;192&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n						&lt;td&gt;&lt;a href=&quot;http://www.uniqlo.com/us/store/lifewear/women-snoopy-graphic-short-sleeve-t-shirt/075297-03?utm_source=NL-2013-07-14&amp;amp;utm_medium=email&amp;amp;utm_content=Product-WOMEN-UT-8&amp;amp;utm_campaign=WEEK-28-071413-UT-MEN-WOMEN&quot; style=&quot;text-decoration:none;outline:0&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;WOMEN SNOOPY T&quot; border=&quot;0&quot; height=&quot;220&quot; src=&quot;http://www.uniqlo.com/global_images/us/mail/20130714/prod_1_8.jpg&quot; style=&quot;display:block&quot; width=&quot;173&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n					&lt;/tr&gt;\r\n				&lt;/tbody&gt;\r\n			&lt;/table&gt;\r\n			&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td style=&quot;padding:20px 0&quot;&gt;&lt;img alt=&quot;Uniqlo&quot; border=&quot;0&quot; height=&quot;1&quot; src=&quot;http://www.uniqlo.com/global_images/us/mail/nav/line_lg.gif&quot; style=&quot;display:block&quot; width=&quot;749&quot; /&gt;&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td&gt;\r\n			&lt;table border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; width=&quot;749&quot;&gt;\r\n				&lt;tbody&gt;\r\n					&lt;tr&gt;\r\n						&lt;td&gt;&lt;a href=&quot;http://ml.uniqlo-usa.com/cgi-bin8/DM/t/nqMl0MyyGE0OYU0BIUG0EG&quot; style=&quot;text-decoration:none;outline:0&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;UT MEN&quot; border=&quot;0&quot; height=&quot;388&quot; src=&quot;http://www.uniqlo.com/global_images/us/mail/20130714/hero_ut_m.jpg&quot; style=&quot;display:block&quot; width=&quot;749&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n					&lt;/tr&gt;\r\n				&lt;/tbody&gt;\r\n			&lt;/table&gt;\r\n			&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td style=&quot;padding:15px 0 0 0&quot;&gt;\r\n			&lt;table border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; width=&quot;749&quot;&gt;\r\n				&lt;tbody&gt;\r\n					&lt;tr&gt;\r\n						&lt;td&gt;&lt;a href=&quot;http://www.uniqlo.com/us/store/lifewear/men-pixar-graphic-short-sleeve-t-shirt/075398001-03-005?utm_source=NL-2013-07-14&amp;amp;utm_medium=email&amp;amp;utm_content=Product-MEN-UT-1&amp;amp;utm_campaign=WEEK-28-071413-UT-MEN-WOMEN&quot; style=&quot;text-decoration:none;outline:0&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;MEN PIXAR T&quot; border=&quot;0&quot; height=&quot;220&quot; src=&quot;http://www.uniqlo.com/global_images/us/mail/20130714/prod_2_1.jpg&quot; style=&quot;display:block&quot; width=&quot;192&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n						&lt;td&gt;&lt;a href=&quot;http://www.uniqlo.com/us/store/lifewear/men-kamawanu-graphic-short-sleeve-t-shirt/077178001-01-002?utm_source=NL-2013-07-14&amp;amp;utm_medium=email&amp;amp;utm_content=Product-MEN-UT-2&amp;amp;utm_campaign=WEEK-28-071413-UT-MEN-WOMEN&quot; style=&quot;text-decoration:none;outline:0&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;MEN KAMAWANU T&quot; border=&quot;0&quot; height=&quot;220&quot; src=&quot;http://www.uniqlo.com/global_images/us/mail/20130714/prod_2_2.jpg&quot; style=&quot;display:block&quot; width=&quot;192&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n						&lt;td&gt;&lt;a href=&quot;http://www.uniqlo.com/us/store/lifewear/men-monster-hunter-graphic-short-sleeve-t-shirt/076763002-03-003?utm_source=NL-2013-07-14&amp;amp;utm_medium=email&amp;amp;utm_content=Product-MEN-UT-3&amp;amp;utm_campaign=WEEK-28-071413-UT-MEN-WOMEN&quot; style=&quot;text-decoration:none;outline:0&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;MEN MONSTER HUNTER T&quot; border=&quot;0&quot; height=&quot;220&quot; src=&quot;http://www.uniqlo.com/global_images/us/mail/20130714/prod_2_3.jpg&quot; style=&quot;display:block&quot; width=&quot;192&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n						&lt;td&gt;&lt;a href=&quot;http://www.uniqlo.com/us/store/lifewear/men-andy-warhol-graphic-short-sleeve-t-shirt/076592-42-003?utm_source=NL-2013-07-14&amp;amp;utm_medium=email&amp;amp;utm_content=Product-MEN-UT-4&amp;amp;utm_campaign=WEEK-28-071413-UT-MEN-WOMEN&quot; style=&quot;text-decoration:none;outline:0&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;MEN ANDY WARHOL T&quot; border=&quot;0&quot; height=&quot;220&quot; src=&quot;http://www.uniqlo.com/global_images/us/mail/20130714/prod_2_4.jpg&quot; style=&quot;display:block&quot; width=&quot;173&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n					&lt;/tr&gt;\r\n				&lt;/tbody&gt;\r\n			&lt;/table&gt;\r\n			&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td style=&quot;padding:20px 0 0 0&quot;&gt;\r\n			&lt;table border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; width=&quot;749&quot;&gt;\r\n				&lt;tbody&gt;\r\n					&lt;tr&gt;\r\n						&lt;td&gt;&lt;a href=&quot;http://www.uniqlo.com/us/store/lifewear/men-star-wars-graphic-short-sleeve-t-shirt/077382001-11-006?utm_source=NL-2013-07-14&amp;amp;utm_medium=email&amp;amp;utm_content=Product-MEN-UT-5&amp;amp;utm_campaign=WEEK-28-071413-UT-MEN-WOMEN&quot; style=&quot;text-decoration:none;outline:0&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;MEN STAR WARS T&quot; border=&quot;0&quot; height=&quot;220&quot; src=&quot;http://www.uniqlo.com/global_images/us/mail/20130714/prod_2_5.jpg&quot; style=&quot;display:block&quot; width=&quot;192&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n						&lt;td&gt;&lt;a href=&quot;http://www.uniqlo.com/us/store/lifewear/men-fender-short-sleeve-t/077740001-03-003?utm_source=NL-2013-07-14&amp;amp;utm_medium=email&amp;amp;utm_content=Product-MEN-UT-6&amp;amp;utm_campaign=WEEK-28-071413-UT-MEN-WOMEN&quot; style=&quot;text-decoration:none;outline:0&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;MEN FENDER T&quot; border=&quot;0&quot; height=&quot;220&quot; src=&quot;http://www.uniqlo.com/global_images/us/mail/20130714/prod_2_6.jpg&quot; style=&quot;display:block&quot; width=&quot;192&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n						&lt;td&gt;&lt;a href=&quot;http://www.uniqlo.com/us/store/lifewear/men-national-geographic-short-sleeve-t-shirt/077649002-50-004?utm_source=NL-2013-07-14&amp;amp;utm_medium=email&amp;amp;utm_content=Product-MEN-UT-7&amp;amp;utm_campaign=WEEK-28-071413-UT-MEN-WOMEN&quot; style=&quot;text-decoration:none;outline:0&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;MEN NATIONAL GEOGRAPHIC T&quot; border=&quot;0&quot; height=&quot;220&quot; src=&quot;http://www.uniqlo.com/global_images/us/mail/20130714/prod_2_7.jpg&quot; style=&quot;display:block&quot; width=&quot;192&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n						&lt;td&gt;&lt;a href=&quot;http://www.uniqlo.com/us/store/lifewear/men-bearbrick-graphic-short-sleeve-t-shirt/078672-00-004?utm_source=NL-2013-07-14&amp;amp;utm_medium=email&amp;amp;utm_content=Product-MEN-UT-8&amp;amp;utm_campaign=WEEK-28-071413-UT-MEN-WOMEN&quot; style=&quot;text-decoration:none;outline:0&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;MEN BEARBRICK T&quot; border=&quot;0&quot; height=&quot;220&quot; src=&quot;http://www.uniqlo.com/global_images/us/mail/20130714/prod_2_8.jpg&quot; style=&quot;display:block&quot; width=&quot;173&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n					&lt;/tr&gt;\r\n				&lt;/tbody&gt;\r\n			&lt;/table&gt;\r\n			&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td style=&quot;padding:20px 0&quot;&gt;&lt;img alt=&quot;Uniqlo&quot; border=&quot;0&quot; height=&quot;1&quot; src=&quot;http://www.uniqlo.com/global_images/us/mail/nav/line_lg.gif&quot; style=&quot;display:block&quot; width=&quot;749&quot; /&gt;&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td&gt;\r\n			&lt;table border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; width=&quot;749&quot;&gt;\r\n				&lt;tbody&gt;\r\n					&lt;tr&gt;\r\n						&lt;td&gt;&lt;a href=&quot;http://www.uniqlo.com/us/featured/womens-clothing-sale?utm_source=NL-2013-07-14&amp;amp;utm_medium=email&amp;amp;utm_content=Product-WOMEN-CHINO-SHORTS-1&amp;amp;utm_campaign=WEEK-28-071413-UT-MEN-WOMEN&quot; style=&quot;text-decoration:none;outline:0&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;Sale Women&quot; border=&quot;0&quot; height=&quot;311&quot; src=&quot;http://www.uniqlo.com/global_images/us/mail/20130714/sale_w.gif&quot; style=&quot;display:block&quot; width=&quot;374&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n						&lt;td&gt;&lt;a href=&quot;http://www.uniqlo.com/us/featured/mens-clothing-sale?utm_source=NL-2013-07-14&amp;amp;utm_medium=email&amp;amp;utm_content=Product-WOMEN-CHINO-SHORTS-2&amp;amp;utm_campaign=WEEK-28-071413-UT-MEN-WOMEN&quot; style=&quot;text-decoration:none;outline:0&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;Sale Men&quot; border=&quot;0&quot; height=&quot;311&quot; src=&quot;http://www.uniqlo.com/global_images/us/mail/20130714/sale_m.gif&quot; style=&quot;display:block&quot; width=&quot;375&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n					&lt;/tr&gt;\r\n				&lt;/tbody&gt;\r\n			&lt;/table&gt;\r\n			&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td style=&quot;padding:20px 0&quot;&gt;&lt;img alt=&quot;Uniqlo&quot; border=&quot;0&quot; height=&quot;1&quot; src=&quot;http://www.uniqlo.com/global_images/us/mail/nav/line_lg.gif&quot; style=&quot;display:block&quot; width=&quot;749&quot; /&gt;&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td&gt;\r\n			&lt;table border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; width=&quot;749&quot;&gt;\r\n				&lt;tbody&gt;\r\n					&lt;tr&gt;\r\n						&lt;td width=&quot;585&quot;&gt;\r\n						&lt;p style=&quot;font-size:0.69em;font-family:Arial,Helvetica,sans-serif;color:#666666&quot;&gt;&lt;a href=&quot;http://ml.uniqlo-usa.com/cgi-bin8/DM/t/nqMl0MyyGE0OYU0BIUH0EH&quot; style=&quot;text-decoration:none;color:#666666&quot; target=&quot;_blank&quot;&gt;UNSUBSCRIBE&lt;/a&gt; | &lt;a href=&quot;http://ml.uniqlo-usa.com/cgi-bin8/DM/t/nqMl0MyyGE0OYU0BIUD0ED&quot; style=&quot;text-decoration:none;color:#666666&quot; target=&quot;_blank&quot;&gt;CUSTOMER SUPPORT&lt;/a&gt;&lt;/p&gt;\r\n\r\n						&lt;p style=&quot;font-size:0.69em;color:#666666;font-family:Arial,Helvetica,sans-serif;line-height:15px&quot;&gt;Don''t miss out, add &lt;a href=&quot;mailto:uniqlo@ml.uniqlo-usa.com&quot; target=&quot;_blank&quot;&gt;uniqlo@ml.uniqlo-usa.com&lt;/a&gt; to your address book to make sure you get our emails.&lt;br /&gt;\r\n						UNIQLO USA LLC 450 West 14th St, 7th floor New York, NY 10014 | &lt;a href=&quot;http://UNIQLO.COM&quot; target=&quot;_blank&quot;&gt;UNIQLO.COM&lt;/a&gt;&lt;/p&gt;\r\n						&lt;/td&gt;\r\n						&lt;td width=&quot;151&quot;&gt;&lt;img alt=&quot;be_in_touch&quot; height=&quot;32&quot; src=&quot;http://www.uniqlo.com/global_images/us/mail/nav/be_in_touch.png&quot; width=&quot;83&quot; /&gt;&lt;a href=&quot;http://ml.uniqlo-usa.com/cgi-bin8/DM/t/nqMl0MyyGE0OYU0BIUI0EI&quot; style=&quot;text-decoration:none;display:inline-block;border:0&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;facebook&quot; border=&quot;0&quot; height=&quot;32&quot; src=&quot;http://www.uniqlo.com/global_images/us/mail/nav/facebook_button.png&quot; width=&quot;33&quot; /&gt;&lt;/a&gt;&lt;a href=&quot;http://ml.uniqlo-usa.com/cgi-bin8/DM/t/nqMl0MyyGE0OYU0BIUJ0EJ&quot; style=&quot;text-decoration:none;display:inline-block;border:0&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;twitter&quot; border=&quot;0&quot; height=&quot;32&quot; src=&quot;http://www.uniqlo.com/global_images/us/mail/nav/twitter_button.png&quot; width=&quot;31&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n					&lt;/tr&gt;\r\n				&lt;/tbody&gt;\r\n			&lt;/table&gt;\r\n			&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td&gt;&amp;nbsp;&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n	&lt;/tbody&gt;\r\n&lt;/table&gt;\r\n&lt;/div&gt;\r\n', '', ''),
(22, 2, 'MANGO- Giảm giá tất cả các mặt hàng từ 50% - 70% ', '', '&lt;p&gt;&lt;img alt=&quot;&quot; border=&quot;0&quot; id=&quot;yui_3_7_2_1_1373824183943_2154&quot; src=&quot;http://st.mngbcn.com/web/rcsemail/2013/rebajas3/she_006.jpg&quot; title=&quot;&quot; /&gt;&lt;/p&gt;\r\n', '', '');
INSERT INTO `news_description` (`news_id`, `language_id`, `name`, `short_description`, `description`, `meta_description`, `meta_keyword`) VALUES
(23, 2, 'DOROTHY PERKIN - Giảm giá váy mùa hè chỉ còn từ 16GBP trở lên &amp; giảm thêm 20% cho đồ SALE', '', '&lt;table align=&quot;center&quot; bgcolor=&quot;#ffffff&quot; border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; id=&quot;yui_3_7_2_1_1373824183943_3346&quot; width=&quot;700&quot;&gt;\r\n	&lt;tbody id=&quot;yui_3_7_2_1_1373824183943_3345&quot;&gt;\r\n		&lt;tr id=&quot;yui_3_7_2_1_1373824183943_3344&quot;&gt;\r\n			&lt;td id=&quot;yui_3_7_2_1_1373824183943_3343&quot;&gt;\r\n			&lt;table align=&quot;center&quot; bgcolor=&quot;#ffffff&quot; border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; id=&quot;yui_3_7_2_1_1373824183943_3342&quot; width=&quot;700&quot;&gt;\r\n				&lt;tbody id=&quot;yui_3_7_2_1_1373824183943_3341&quot;&gt;\r\n					&lt;tr id=&quot;yui_3_7_2_1_1373824183943_3340&quot;&gt;\r\n						&lt;td align=&quot;right&quot; id=&quot;yui_3_7_2_1_1373824183943_3339&quot; style=&quot;background:#ffffff;&quot;&gt;\r\n						&lt;p id=&quot;yui_3_7_2_1_1373824183943_3338&quot; style=&quot;text-align:center;&quot;&gt;&amp;nbsp; If you are having trouble viewing this email, please &lt;a href=&quot;http://dorothyperkins.chtah.com/a/hBR4kx3B4YSy$B8z3AJNsiigE6u/dp2?email=ta.dg86@yahoo.com&amp;amp;fname=&amp;amp;password=B4YSy$NsiigEBR4kx3ZRMZfuDd5mAV&quot; rel=&quot;nofollow&quot; target=&quot;_blank&quot;&gt;click here&lt;/a&gt;.&lt;/p&gt;\r\n						&lt;/td&gt;\r\n					&lt;/tr&gt;\r\n				&lt;/tbody&gt;\r\n			&lt;/table&gt;\r\n			&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr id=&quot;yui_3_7_2_1_1373824183943_3360&quot;&gt;\r\n			&lt;td id=&quot;yui_3_7_2_1_1373824183943_3359&quot;&gt;\r\n			&lt;table align=&quot;center&quot; bgcolor=&quot;#ffffff&quot; border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; id=&quot;yui_3_7_2_1_1373824183943_3358&quot; width=&quot;700&quot;&gt;\r\n				&lt;tbody id=&quot;yui_3_7_2_1_1373824183943_3357&quot;&gt;\r\n					&lt;tr id=&quot;yui_3_7_2_1_1373824183943_3356&quot;&gt;\r\n						&lt;td align=&quot;center&quot; height=&quot;73&quot; id=&quot;yui_3_7_2_1_1373824183943_3355&quot; width=&quot;700&quot;&gt;&lt;a href=&quot;http://dorothyperkins.chtah.com/a/hBR4kx3B4YSy$B8z3AJNsiigE6u/dp35&quot; id=&quot;yui_3_7_2_1_1373824183943_3354&quot; rel=&quot;nofollow&quot; style=&quot;display:block;&quot; target=&quot;_blank&quot; title=&quot;Dorothy Perkins&quot;&gt;&lt;img alt=&quot;Dorothy Perkins&quot; border=&quot;0&quot; height=&quot;73&quot; id=&quot;yui_3_7_2_1_1373824183943_3353&quot; src=&quot;http://media.dorothyperkins.com/wcsstore/ConsumerDirectStorefrontAssetStore/images/colors/color3/cms/pages/email/email-0000016852/images/EU_nl_top_nav_wk38_1.jpg&quot; style=&quot;display:block;&quot; width=&quot;700&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n					&lt;/tr&gt;\r\n				&lt;/tbody&gt;\r\n			&lt;/table&gt;\r\n			&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr id=&quot;yui_3_7_2_1_1373824183943_3368&quot;&gt;\r\n			&lt;td id=&quot;yui_3_7_2_1_1373824183943_3367&quot;&gt;\r\n			&lt;table align=&quot;center&quot; bgcolor=&quot;#ffffff&quot; border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; id=&quot;yui_3_7_2_1_1373824183943_3366&quot; width=&quot;700&quot;&gt;\r\n				&lt;tbody id=&quot;yui_3_7_2_1_1373824183943_3365&quot;&gt;\r\n					&lt;tr id=&quot;yui_3_7_2_1_1373824183943_3364&quot;&gt;\r\n						&lt;td align=&quot;center&quot; height=&quot;36&quot; id=&quot;yui_3_7_2_1_1373824183943_3474&quot; width=&quot;117&quot;&gt;&lt;a href=&quot;http://dorothyperkins.chtah.com/a/hBR4kx3B4YSy$B8z3AJNsiigE6u/dp11&quot; id=&quot;yui_3_7_2_1_1373824183943_3473&quot; rel=&quot;nofollow&quot; style=&quot;display:block;&quot; target=&quot;_blank&quot; title=&quot;What''s New&quot;&gt;&lt;img alt=&quot;What''s New&quot; border=&quot;0&quot; height=&quot;36&quot; id=&quot;yui_3_7_2_1_1373824183943_3472&quot; src=&quot;http://media.dorothyperkins.com/wcsstore/ConsumerDirectStorefrontAssetStore/images/colors/color3/cms/pages/email/email-0000016852/images/UK_nl_top_nav_wk37_3.jpg&quot; style=&quot;display:block;&quot; width=&quot;117&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n						&lt;td align=&quot;center&quot; height=&quot;36&quot; id=&quot;yui_3_7_2_1_1373824183943_3471&quot; width=&quot;116&quot;&gt;&lt;a href=&quot;http://dorothyperkins.chtah.com/a/hBR4kx3B4YSy$B8z3AJNsiigE6u/dp9&quot; id=&quot;yui_3_7_2_1_1373824183943_3470&quot; rel=&quot;nofollow&quot; style=&quot;display:block;&quot; target=&quot;_blank&quot; title=&quot;Clothing&quot;&gt;&lt;img alt=&quot;Clothing&quot; border=&quot;0&quot; height=&quot;36&quot; id=&quot;yui_3_7_2_1_1373824183943_3469&quot; src=&quot;http://media.dorothyperkins.com/wcsstore/ConsumerDirectStorefrontAssetStore/images/colors/color3/cms/pages/email/email-0000016852/images/UK_nl_top_nav_wk37_4.jpg&quot; style=&quot;display:block;&quot; width=&quot;116&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n						&lt;td align=&quot;center&quot; height=&quot;36&quot; id=&quot;yui_3_7_2_1_1373824183943_3422&quot; width=&quot;105&quot;&gt;&lt;a href=&quot;http://dorothyperkins.chtah.com/a/hBR4kx3B4YSy$B8z3AJNsiigE6u/dp14&quot; id=&quot;yui_3_7_2_1_1373824183943_3421&quot; rel=&quot;nofollow&quot; style=&quot;display:block;&quot; target=&quot;_blank&quot; title=&quot;Dresses&quot;&gt;&lt;img alt=&quot;Dresses&quot; border=&quot;0&quot; height=&quot;36&quot; id=&quot;yui_3_7_2_1_1373824183943_3420&quot; src=&quot;http://media.dorothyperkins.com/wcsstore/ConsumerDirectStorefrontAssetStore/images/colors/color3/cms/pages/email/email-0000016852/images/UK_nl_top_nav_wk37_5.jpg&quot; style=&quot;display:block;&quot; width=&quot;105&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n						&lt;td align=&quot;center&quot; height=&quot;36&quot; id=&quot;yui_3_7_2_1_1373824183943_3465&quot; width=&quot;88&quot;&gt;&lt;a href=&quot;http://dorothyperkins.chtah.com/a/hBR4kx3B4YSy$B8z3AJNsiigE6u/dp12&quot; id=&quot;yui_3_7_2_1_1373824183943_3464&quot; rel=&quot;nofollow&quot; style=&quot;display:block;&quot; target=&quot;_blank&quot; title=&quot;Shoes &amp;amp; Boots&quot;&gt;&lt;img alt=&quot;Shoes &amp;amp; Boots&quot; border=&quot;0&quot; height=&quot;36&quot; id=&quot;yui_3_7_2_1_1373824183943_3463&quot; src=&quot;http://media.dorothyperkins.com/wcsstore/ConsumerDirectStorefrontAssetStore/images/colors/color3/cms/pages/email/email-0000016852/images/UK_nl_top_nav_wk37_6.jpg&quot; style=&quot;display:block;&quot; width=&quot;88&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n						&lt;td align=&quot;center&quot; height=&quot;36&quot; id=&quot;yui_3_7_2_1_1373824183943_3363&quot; width=&quot;138&quot;&gt;&lt;a href=&quot;http://dorothyperkins.chtah.com/a/hBR4kx3B4YSy$B8z3AJNsiigE6u/dp10&quot; id=&quot;yui_3_7_2_1_1373824183943_3362&quot; rel=&quot;nofollow&quot; style=&quot;display:block;&quot; target=&quot;_blank&quot; title=&quot;Accessories&quot;&gt;&lt;img alt=&quot;Accessories&quot; border=&quot;0&quot; height=&quot;36&quot; id=&quot;yui_3_7_2_1_1373824183943_3361&quot; src=&quot;http://media.dorothyperkins.com/wcsstore/ConsumerDirectStorefrontAssetStore/images/colors/color3/cms/pages/email/email-0000016852/images/UK_nl_top_nav_wk37_7.jpg&quot; style=&quot;display:block;&quot; width=&quot;138&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n						&lt;td align=&quot;center&quot; height=&quot;36&quot; id=&quot;yui_3_7_2_1_1373824183943_3468&quot; width=&quot;136&quot;&gt;&lt;a href=&quot;http://dorothyperkins.chtah.com/a/hBR4kx3B4YSy$B8z3AJNsiigE6u/dp15&quot; id=&quot;yui_3_7_2_1_1373824183943_3467&quot; rel=&quot;nofollow&quot; style=&quot;display:block;&quot; target=&quot;_blank&quot; title=&quot;Sale and Offers &quot;&gt;&lt;img alt=&quot;Sale and Offers &quot; border=&quot;0&quot; height=&quot;36&quot; id=&quot;yui_3_7_2_1_1373824183943_3466&quot; src=&quot;http://media.dorothyperkins.com/wcsstore/ConsumerDirectStorefrontAssetStore/images/colors/color3/cms/pages/email/email-0000016852/images/UK_nl_top_nav_wk37_8.jpg&quot; style=&quot;display:block;&quot; width=&quot;136&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n					&lt;/tr&gt;\r\n				&lt;/tbody&gt;\r\n			&lt;/table&gt;\r\n			&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr id=&quot;yui_3_7_2_1_1373824183943_3376&quot;&gt;\r\n			&lt;td id=&quot;yui_3_7_2_1_1373824183943_3375&quot;&gt;\r\n			&lt;table align=&quot;center&quot; bgcolor=&quot;#ffffff&quot; border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; id=&quot;yui_3_7_2_1_1373824183943_3374&quot; width=&quot;700&quot;&gt;\r\n				&lt;tbody id=&quot;yui_3_7_2_1_1373824183943_3373&quot;&gt;\r\n					&lt;tr id=&quot;yui_3_7_2_1_1373824183943_3372&quot;&gt;\r\n						&lt;td align=&quot;center&quot; height=&quot;394&quot; id=&quot;yui_3_7_2_1_1373824183943_3419&quot; width=&quot;420&quot;&gt;&lt;a href=&quot;http://dorothyperkins.chtah.com/a/hBR4kx3B4YSy$B8z3AJNsiigE6u/dp13&quot; id=&quot;yui_3_7_2_1_1373824183943_3418&quot; rel=&quot;nofollow&quot; style=&quot;display:block;&quot; target=&quot;_blank&quot; title=&quot;Shop dresses &quot;&gt;&lt;img alt=&quot;Shop dresses &quot; border=&quot;0&quot; height=&quot;394&quot; id=&quot;yui_3_7_2_1_1373824183943_3417&quot; src=&quot;http://media.dorothyperkins.com/wcsstore/ConsumerDirectStorefrontAssetStore/images/colors/color3/cms/pages/email/email-0000016852/images/UK_nl_sunday_wk47_1.jpg&quot; style=&quot;display:block;&quot; width=&quot;420&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n						&lt;td align=&quot;center&quot; height=&quot;394&quot; id=&quot;yui_3_7_2_1_1373824183943_3371&quot; width=&quot;280&quot;&gt;&lt;a href=&quot;http://dorothyperkins.chtah.com/a/hBR4kx3B4YSy$B8z3AJNsiigE6u/dp33&quot; id=&quot;yui_3_7_2_1_1373824183943_3370&quot; rel=&quot;nofollow&quot; style=&quot;display:block;&quot; target=&quot;_blank&quot; title=&quot;Black/white animal skater dress &quot;&gt;&lt;img alt=&quot;Black/white animal skater dress &quot; border=&quot;0&quot; height=&quot;394&quot; id=&quot;yui_3_7_2_1_1373824183943_3369&quot; src=&quot;http://media.dorothyperkins.com/wcsstore/ConsumerDirectStorefrontAssetStore/images/colors/color3/cms/pages/email/email-0000016852/images/UK_nl_sunday_wk47_2.jpg&quot; style=&quot;display:block;&quot; width=&quot;280&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n					&lt;/tr&gt;\r\n				&lt;/tbody&gt;\r\n			&lt;/table&gt;\r\n			&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr id=&quot;yui_3_7_2_1_1373824183943_3384&quot;&gt;\r\n			&lt;td id=&quot;yui_3_7_2_1_1373824183943_3383&quot;&gt;\r\n			&lt;table align=&quot;center&quot; bgcolor=&quot;#ffffff&quot; border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; id=&quot;yui_3_7_2_1_1373824183943_3382&quot; width=&quot;700&quot;&gt;\r\n				&lt;tbody id=&quot;yui_3_7_2_1_1373824183943_3381&quot;&gt;\r\n					&lt;tr id=&quot;yui_3_7_2_1_1373824183943_3380&quot;&gt;\r\n						&lt;td align=&quot;center&quot; height=&quot;389&quot; id=&quot;yui_3_7_2_1_1373824183943_3480&quot; width=&quot;197&quot;&gt;&lt;a href=&quot;http://dorothyperkins.chtah.com/a/hBR4kx3B4YSy$B8z3AJNsiigE6u/dp16&quot; id=&quot;yui_3_7_2_1_1373824183943_3479&quot; rel=&quot;nofollow&quot; style=&quot;display:block;&quot; target=&quot;_blank&quot; title=&quot;Shop maxis &quot;&gt;&lt;img alt=&quot;Shop maxis &quot; border=&quot;0&quot; height=&quot;389&quot; id=&quot;yui_3_7_2_1_1373824183943_3478&quot; src=&quot;http://media.dorothyperkins.com/wcsstore/ConsumerDirectStorefrontAssetStore/images/colors/color3/cms/pages/email/email-0000016852/images/UK_nl_sunday_wk47_3.jpg&quot; style=&quot;display:block;&quot; width=&quot;197&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n						&lt;td align=&quot;center&quot; height=&quot;389&quot; id=&quot;yui_3_7_2_1_1373824183943_3477&quot; width=&quot;153&quot;&gt;&lt;a href=&quot;http://dorothyperkins.chtah.com/a/hBR4kx3B4YSy$B8z3AJNsiigE6u/dp26&quot; id=&quot;yui_3_7_2_1_1373824183943_3476&quot; rel=&quot;nofollow&quot; style=&quot;display:block;&quot; target=&quot;_blank&quot; title=&quot;Check bandeau maxi dress &quot;&gt;&lt;img alt=&quot;Check bandeau maxi dress &quot; border=&quot;0&quot; height=&quot;389&quot; id=&quot;yui_3_7_2_1_1373824183943_3475&quot; src=&quot;http://media.dorothyperkins.com/wcsstore/ConsumerDirectStorefrontAssetStore/images/colors/color3/cms/pages/email/email-0000016852/images/UK_nl_sunday_wk47_4.jpg&quot; style=&quot;display:block;&quot; width=&quot;153&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n						&lt;td align=&quot;center&quot; height=&quot;389&quot; id=&quot;yui_3_7_2_1_1373824183943_3379&quot; width=&quot;175&quot;&gt;&lt;a href=&quot;http://dorothyperkins.chtah.com/a/hBR4kx3B4YSy$B8z3AJNsiigE6u/dp27&quot; id=&quot;yui_3_7_2_1_1373824183943_3378&quot; rel=&quot;nofollow&quot; style=&quot;display:block;&quot; target=&quot;_blank&quot; title=&quot;Merlot floral cutout maxi &quot;&gt;&lt;img alt=&quot;Merlot floral cutout maxi &quot; border=&quot;0&quot; height=&quot;389&quot; id=&quot;yui_3_7_2_1_1373824183943_3377&quot; src=&quot;http://media.dorothyperkins.com/wcsstore/ConsumerDirectStorefrontAssetStore/images/colors/color3/cms/pages/email/email-0000016852/images/UK_nl_sunday_wk47_5.jpg&quot; style=&quot;display:block;&quot; width=&quot;175&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n						&lt;td align=&quot;center&quot; height=&quot;389&quot; id=&quot;yui_3_7_2_1_1373824183943_3459&quot; width=&quot;175&quot;&gt;&lt;a href=&quot;http://dorothyperkins.chtah.com/a/hBR4kx3B4YSy$B8z3AJNsiigE6u/dp25&quot; id=&quot;yui_3_7_2_1_1373824183943_3458&quot; rel=&quot;nofollow&quot; style=&quot;display:block;&quot; target=&quot;_blank&quot; title=&quot;Ink/blush maxi dress &quot;&gt;&lt;img alt=&quot;Ink/blush maxi dress &quot; border=&quot;0&quot; height=&quot;389&quot; id=&quot;yui_3_7_2_1_1373824183943_3457&quot; src=&quot;http://media.dorothyperkins.com/wcsstore/ConsumerDirectStorefrontAssetStore/images/colors/color3/cms/pages/email/email-0000016852/images/UK_nl_sunday_wk47_6.jpg&quot; style=&quot;display:block;&quot; width=&quot;175&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n					&lt;/tr&gt;\r\n				&lt;/tbody&gt;\r\n			&lt;/table&gt;\r\n			&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr id=&quot;yui_3_7_2_1_1373824183943_3392&quot;&gt;\r\n			&lt;td id=&quot;yui_3_7_2_1_1373824183943_3391&quot;&gt;\r\n			&lt;table align=&quot;center&quot; bgcolor=&quot;#ffffff&quot; border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; id=&quot;yui_3_7_2_1_1373824183943_3390&quot; width=&quot;700&quot;&gt;\r\n				&lt;tbody id=&quot;yui_3_7_2_1_1373824183943_3389&quot;&gt;\r\n					&lt;tr id=&quot;yui_3_7_2_1_1373824183943_3388&quot;&gt;\r\n						&lt;td align=&quot;center&quot; height=&quot;362&quot; width=&quot;197&quot;&gt;&lt;a href=&quot;http://dorothyperkins.chtah.com/a/hBR4kx3B4YSy$B8z3AJNsiigE6u/dp22&quot; rel=&quot;nofollow&quot; style=&quot;display:block;&quot; target=&quot;_blank&quot; title=&quot;Shop pencil dresses &quot;&gt;&lt;img alt=&quot;Shop pencil dresses &quot; border=&quot;0&quot; height=&quot;362&quot; src=&quot;http://media.dorothyperkins.com/wcsstore/ConsumerDirectStorefrontAssetStore/images/colors/color3/cms/pages/email/email-0000016852/images/UK_nl_sunday_wk47_7.jpg&quot; style=&quot;display:block;&quot; width=&quot;197&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n						&lt;td align=&quot;center&quot; height=&quot;362&quot; width=&quot;153&quot;&gt;&lt;a href=&quot;http://dorothyperkins.chtah.com/a/hBR4kx3B4YSy$B8z3AJNsiigE6u/dp28&quot; rel=&quot;nofollow&quot; style=&quot;display:block;&quot; target=&quot;_blank&quot; title=&quot;Merlot tube dress &quot;&gt;&lt;img alt=&quot;Merlot tube dress &quot; border=&quot;0&quot; height=&quot;362&quot; src=&quot;http://media.dorothyperkins.com/wcsstore/ConsumerDirectStorefrontAssetStore/images/colors/color3/cms/pages/email/email-0000016852/images/UK_nl_sunday_wk47_8.jpg&quot; style=&quot;display:block;&quot; width=&quot;153&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n						&lt;td align=&quot;center&quot; height=&quot;362&quot; id=&quot;yui_3_7_2_1_1373824183943_3387&quot; width=&quot;175&quot;&gt;&lt;a href=&quot;http://dorothyperkins.chtah.com/a/hBR4kx3B4YSy$B8z3AJNsiigE6u/dp24&quot; id=&quot;yui_3_7_2_1_1373824183943_3386&quot; rel=&quot;nofollow&quot; style=&quot;display:block;&quot; target=&quot;_blank&quot; title=&quot;Kaleidoscope scuba dress &quot;&gt;&lt;img alt=&quot;Kaleidoscope scuba dress &quot; border=&quot;0&quot; height=&quot;362&quot; id=&quot;yui_3_7_2_1_1373824183943_3385&quot; src=&quot;http://media.dorothyperkins.com/wcsstore/ConsumerDirectStorefrontAssetStore/images/colors/color3/cms/pages/email/email-0000016852/images/UK_nl_sunday_wk47_9.jpg&quot; style=&quot;display:block;&quot; width=&quot;175&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n						&lt;td align=&quot;center&quot; height=&quot;362&quot; width=&quot;175&quot;&gt;&lt;a href=&quot;http://dorothyperkins.chtah.com/a/hBR4kx3B4YSy$B8z3AJNsiigE6u/dp32&quot; rel=&quot;nofollow&quot; style=&quot;display:block;&quot; target=&quot;_blank&quot; title=&quot;Camel and ivory sculpted dress &quot;&gt;&lt;img alt=&quot;Camel and ivory sculpted dress &quot; border=&quot;0&quot; height=&quot;362&quot; src=&quot;http://media.dorothyperkins.com/wcsstore/ConsumerDirectStorefrontAssetStore/images/colors/color3/cms/pages/email/email-0000016852/images/UK_nl_sunday_wk47_10.jpg&quot; style=&quot;display:block;&quot; width=&quot;175&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n					&lt;/tr&gt;\r\n				&lt;/tbody&gt;\r\n			&lt;/table&gt;\r\n			&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr id=&quot;yui_3_7_2_1_1373824183943_3400&quot;&gt;\r\n			&lt;td id=&quot;yui_3_7_2_1_1373824183943_3399&quot;&gt;\r\n			&lt;table align=&quot;center&quot; bgcolor=&quot;#ffffff&quot; border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; id=&quot;yui_3_7_2_1_1373824183943_3398&quot; width=&quot;700&quot;&gt;\r\n				&lt;tbody id=&quot;yui_3_7_2_1_1373824183943_3397&quot;&gt;\r\n					&lt;tr id=&quot;yui_3_7_2_1_1373824183943_3396&quot;&gt;\r\n						&lt;td align=&quot;center&quot; height=&quot;340&quot; width=&quot;197&quot;&gt;&lt;a href=&quot;http://dorothyperkins.chtah.com/a/hBR4kx3B4YSy$B8z3AJNsiigE6u/dp23&quot; rel=&quot;nofollow&quot; style=&quot;display:block;&quot; target=&quot;_blank&quot; title=&quot;Shop fit &amp;amp; flare dresses &quot;&gt;&lt;img alt=&quot;Shop fit &amp;amp; flare dresses &quot; border=&quot;0&quot; height=&quot;340&quot; src=&quot;http://media.dorothyperkins.com/wcsstore/ConsumerDirectStorefrontAssetStore/images/colors/color3/cms/pages/email/email-0000016852/images/UK_nl_sunday_wk47_11.jpg&quot; style=&quot;display:block;&quot; width=&quot;197&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n						&lt;td align=&quot;center&quot; height=&quot;340&quot; width=&quot;153&quot;&gt;&lt;a href=&quot;http://dorothyperkins.chtah.com/a/hBR4kx3B4YSy$B8z3AJNsiigE6u/dp31&quot; rel=&quot;nofollow&quot; style=&quot;display:block;&quot; target=&quot;_blank&quot; title=&quot;Ink lilly fit and flare dress &quot;&gt;&lt;img alt=&quot;Ink lilly fit and flare dress &quot; border=&quot;0&quot; height=&quot;340&quot; src=&quot;http://media.dorothyperkins.com/wcsstore/ConsumerDirectStorefrontAssetStore/images/colors/color3/cms/pages/email/email-0000016852/images/UK_nl_sunday_wk47_12.jpg&quot; style=&quot;display:block;&quot; width=&quot;153&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n						&lt;td align=&quot;center&quot; height=&quot;340&quot; id=&quot;yui_3_7_2_1_1373824183943_3395&quot; width=&quot;175&quot;&gt;&lt;a href=&quot;http://dorothyperkins.chtah.com/a/hBR4kx3B4YSy$B8z3AJNsiigE6u/dp29&quot; id=&quot;yui_3_7_2_1_1373824183943_3394&quot; rel=&quot;nofollow&quot; style=&quot;display:block;&quot; target=&quot;_blank&quot; title=&quot;Teal bow back dress &quot;&gt;&lt;img alt=&quot;Teal bow back dress &quot; border=&quot;0&quot; height=&quot;340&quot; id=&quot;yui_3_7_2_1_1373824183943_3393&quot; src=&quot;http://media.dorothyperkins.com/wcsstore/ConsumerDirectStorefrontAssetStore/images/colors/color3/cms/pages/email/email-0000016852/images/UK_nl_sunday_wk47_13.jpg&quot; style=&quot;display:block;&quot; width=&quot;175&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n						&lt;td align=&quot;center&quot; height=&quot;340&quot; width=&quot;175&quot;&gt;&lt;a href=&quot;http://dorothyperkins.chtah.com/a/hBR4kx3B4YSy$B8z3AJNsiigE6u/dp30&quot; rel=&quot;nofollow&quot; style=&quot;display:block;&quot; target=&quot;_blank&quot; title=&quot;Burgundy floral petal dress &quot;&gt;&lt;img alt=&quot;Burgundy floral petal dress &quot; border=&quot;0&quot; height=&quot;340&quot; src=&quot;http://media.dorothyperkins.com/wcsstore/ConsumerDirectStorefrontAssetStore/images/colors/color3/cms/pages/email/email-0000016852/images/UK_nl_sunday_wk47_14.jpg&quot; style=&quot;display:block;&quot; width=&quot;175&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n					&lt;/tr&gt;\r\n				&lt;/tbody&gt;\r\n			&lt;/table&gt;\r\n			&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr id=&quot;yui_3_7_2_1_1373824183943_3408&quot;&gt;\r\n			&lt;td id=&quot;yui_3_7_2_1_1373824183943_3407&quot;&gt;\r\n			&lt;table align=&quot;center&quot; bgcolor=&quot;#ffffff&quot; border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; id=&quot;yui_3_7_2_1_1373824183943_3406&quot; width=&quot;700&quot;&gt;\r\n				&lt;tbody id=&quot;yui_3_7_2_1_1373824183943_3405&quot;&gt;\r\n					&lt;tr id=&quot;yui_3_7_2_1_1373824183943_3404&quot;&gt;\r\n						&lt;td align=&quot;center&quot; height=&quot;240&quot; id=&quot;yui_3_7_2_1_1373824183943_3403&quot; width=&quot;700&quot;&gt;&lt;a href=&quot;http://dorothyperkins.chtah.com/a/hBR4kx3B4YSy$B8z3AJNsiigE6u/dp17&quot; id=&quot;yui_3_7_2_1_1373824183943_3402&quot; rel=&quot;nofollow&quot; style=&quot;display:block;&quot; target=&quot;_blank&quot; title=&quot;Sale &quot;&gt;&lt;img alt=&quot;Sale &quot; border=&quot;0&quot; height=&quot;240&quot; id=&quot;yui_3_7_2_1_1373824183943_3401&quot; src=&quot;http://media.dorothyperkins.com/wcsstore/ConsumerDirectStorefrontAssetStore/images/colors/color3/cms/pages/email/email-0000016852/images/UK_nl_sunday_wk47_15.gif&quot; style=&quot;display:block;&quot; width=&quot;700&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n					&lt;/tr&gt;\r\n				&lt;/tbody&gt;\r\n			&lt;/table&gt;\r\n			&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td&gt;\r\n			&lt;table align=&quot;center&quot; bgcolor=&quot;#ffffff&quot; border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; width=&quot;700&quot;&gt;\r\n				&lt;tbody&gt;\r\n					&lt;tr&gt;\r\n						&lt;td align=&quot;center&quot; height=&quot;43&quot; width=&quot;175&quot;&gt;&lt;a href=&quot;http://dorothyperkins.chtah.com/a/hBR4kx3B4YSy$B8z3AJNsiigE6u/dp21&quot; rel=&quot;nofollow&quot; style=&quot;display:block;&quot; target=&quot;_blank&quot; title=&quot;£5 and under &quot;&gt;&lt;img alt=&quot;£5 and under &quot; border=&quot;0&quot; height=&quot;43&quot; src=&quot;http://media.dorothyperkins.com/wcsstore/ConsumerDirectStorefrontAssetStore/images/colors/color3/cms/pages/email/email-0000016852/images/UK_nl_sunday_wk47_16.jpg&quot; style=&quot;display:block;&quot; width=&quot;175&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n						&lt;td align=&quot;center&quot; height=&quot;43&quot; width=&quot;175&quot;&gt;&lt;a href=&quot;http://dorothyperkins.chtah.com/a/hBR4kx3B4YSy$B8z3AJNsiigE6u/dp19&quot; rel=&quot;nofollow&quot; style=&quot;display:block;&quot; target=&quot;_blank&quot; title=&quot;£10 and under &quot;&gt;&lt;img alt=&quot;£10 and under &quot; border=&quot;0&quot; height=&quot;43&quot; src=&quot;http://media.dorothyperkins.com/wcsstore/ConsumerDirectStorefrontAssetStore/images/colors/color3/cms/pages/email/email-0000016852/images/UK_nl_sunday_wk47_17.jpg&quot; style=&quot;display:block;&quot; width=&quot;175&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n						&lt;td align=&quot;center&quot; height=&quot;43&quot; width=&quot;175&quot;&gt;&lt;a href=&quot;http://dorothyperkins.chtah.com/a/hBR4kx3B4YSy$B8z3AJNsiigE6u/dp20&quot; rel=&quot;nofollow&quot; style=&quot;display:block;&quot; target=&quot;_blank&quot; title=&quot;£15 and under &quot;&gt;&lt;img alt=&quot;£15 and under &quot; border=&quot;0&quot; height=&quot;43&quot; src=&quot;http://media.dorothyperkins.com/wcsstore/ConsumerDirectStorefrontAssetStore/images/colors/color3/cms/pages/email/email-0000016852/images/UK_nl_sunday_wk47_18_v2.jpg&quot; style=&quot;display:block;&quot; width=&quot;175&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n						&lt;td align=&quot;center&quot; height=&quot;43&quot; width=&quot;175&quot;&gt;&lt;a href=&quot;http://dorothyperkins.chtah.com/a/hBR4kx3B4YSy$B8z3AJNsiigE6u/dp18&quot; rel=&quot;nofollow&quot; style=&quot;display:block;&quot; target=&quot;_blank&quot; title=&quot;Shop all sale &quot;&gt;&lt;img alt=&quot;Shop all sale &quot; border=&quot;0&quot; height=&quot;43&quot; src=&quot;http://media.dorothyperkins.com/wcsstore/ConsumerDirectStorefrontAssetStore/images/colors/color3/cms/pages/email/email-0000016852/images/UK_nl_sunday_wk47_19.jpg&quot; style=&quot;display:block;&quot; width=&quot;175&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n					&lt;/tr&gt;\r\n				&lt;/tbody&gt;\r\n			&lt;/table&gt;\r\n			&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr id=&quot;yui_3_7_2_1_1373824183943_3416&quot;&gt;\r\n			&lt;td id=&quot;yui_3_7_2_1_1373824183943_3415&quot;&gt;\r\n			&lt;table align=&quot;center&quot; bgcolor=&quot;#ffffff&quot; border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; id=&quot;yui_3_7_2_1_1373824183943_3414&quot; width=&quot;700&quot;&gt;\r\n				&lt;tbody id=&quot;yui_3_7_2_1_1373824183943_3413&quot;&gt;\r\n					&lt;tr id=&quot;yui_3_7_2_1_1373824183943_3412&quot;&gt;\r\n						&lt;td align=&quot;center&quot; height=&quot;59&quot; width=&quot;233&quot;&gt;&lt;a href=&quot;http://dorothyperkins.chtah.com/a/hBR4kx3B4YSy$B8z3AJNsiigE6u/dp8&quot; rel=&quot;nofollow&quot; style=&quot;display:block;&quot; target=&quot;_blank&quot; title=&quot;Click and collect &quot;&gt;&lt;img alt=&quot;Click and collect &quot; border=&quot;0&quot; height=&quot;59&quot; src=&quot;http://media.dorothyperkins.com/wcsstore/ConsumerDirectStorefrontAssetStore/images/colors/color3/cms/pages/email/email-0000016852/images/UK_nl_footer_wk40_1.jpg&quot; style=&quot;display:block;&quot; width=&quot;233&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n						&lt;td align=&quot;center&quot; height=&quot;59&quot; id=&quot;yui_3_7_2_1_1373824183943_3411&quot; width=&quot;234&quot;&gt;&lt;a href=&quot;http://dorothyperkins.chtah.com/a/hBR4kx3B4YSy$B8z3AJNsiigE6u/dp39&quot; id=&quot;yui_3_7_2_1_1373824183943_3410&quot; rel=&quot;nofollow&quot; style=&quot;display:block;&quot; target=&quot;_blank&quot; title=&quot;Download the app&quot;&gt;&lt;img alt=&quot;Download the app&quot; border=&quot;0&quot; height=&quot;59&quot; id=&quot;yui_3_7_2_1_1373824183943_3409&quot; src=&quot;http://media.dorothyperkins.com/wcsstore/ConsumerDirectStorefrontAssetStore/images/colors/color3/cms/pages/email/email-0000016852/images/UK_nl_footer_wk40_2.jpg&quot; style=&quot;display:block;&quot; width=&quot;234&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n						&lt;td align=&quot;center&quot; height=&quot;59&quot; width=&quot;233&quot;&gt;&lt;a href=&quot;http://dorothyperkins.chtah.com/a/hBR4kx3B4YSy$B8z3AJNsiigE6u/dp36&quot; rel=&quot;nofollow&quot; style=&quot;display:block;&quot; target=&quot;_blank&quot; title=&quot;Shop on your mobile&quot;&gt;&lt;img alt=&quot;Shop on your mobile&quot; border=&quot;0&quot; height=&quot;59&quot; src=&quot;http://media.dorothyperkins.com/wcsstore/ConsumerDirectStorefrontAssetStore/images/colors/color3/cms/pages/email/email-0000016852/images/UK_nl_footer_wk40_3.jpg&quot; style=&quot;display:block;&quot; width=&quot;233&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n					&lt;/tr&gt;\r\n				&lt;/tbody&gt;\r\n			&lt;/table&gt;\r\n			&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td&gt;\r\n			&lt;table align=&quot;center&quot; bgcolor=&quot;#ffffff&quot; border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; width=&quot;700&quot;&gt;\r\n				&lt;tbody&gt;\r\n					&lt;tr&gt;\r\n						&lt;td align=&quot;center&quot; height=&quot;69&quot; width=&quot;249&quot;&gt;&lt;a href=&quot;http://dorothyperkins.chtah.com/a/hBR4kx3B4YSy$B8z3AJNsiigE6u/dp37&quot; rel=&quot;nofollow&quot; style=&quot;display:block;&quot; target=&quot;_blank&quot; title=&quot;Facebook&quot;&gt;&lt;img alt=&quot;Facebook&quot; border=&quot;0&quot; height=&quot;69&quot; src=&quot;http://media.dorothyperkins.com/wcsstore/ConsumerDirectStorefrontAssetStore/images/colors/color3/cms/pages/email/email-0000016852/images/UK_nl_footer_wk37_1.jpg&quot; style=&quot;display:block;&quot; width=&quot;249&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n						&lt;td align=&quot;center&quot; height=&quot;69&quot; width=&quot;52&quot;&gt;&lt;a href=&quot;http://dorothyperkins.chtah.com/a/hBR4kx3B4YSy$B8z3AJNsiigE6u/dp4&quot; rel=&quot;nofollow&quot; style=&quot;display:block;&quot; target=&quot;_blank&quot; title=&quot;Pinterest&quot;&gt;&lt;img alt=&quot;Pinterest&quot; border=&quot;0&quot; height=&quot;69&quot; src=&quot;http://media.dorothyperkins.com/wcsstore/ConsumerDirectStorefrontAssetStore/images/colors/color3/cms/pages/email/email-0000016852/images/UK_nl_footer_wk37_2.jpg&quot; style=&quot;display:block;&quot; width=&quot;52&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n						&lt;td align=&quot;center&quot; height=&quot;69&quot; width=&quot;49&quot;&gt;&lt;a href=&quot;http://dorothyperkins.chtah.com/a/hBR4kx3B4YSy$B8z3AJNsiigE6u/dp7&quot; rel=&quot;nofollow&quot; style=&quot;display:block;&quot; target=&quot;_blank&quot; title=&quot;Twitter&quot;&gt;&lt;img alt=&quot;Twitter&quot; border=&quot;0&quot; height=&quot;69&quot; src=&quot;http://media.dorothyperkins.com/wcsstore/ConsumerDirectStorefrontAssetStore/images/colors/color3/cms/pages/email/email-0000016852/images/UK_nl_footer_wk37_3.jpg&quot; style=&quot;display:block;&quot; width=&quot;49&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n						&lt;td align=&quot;center&quot; height=&quot;69&quot; width=&quot;52&quot;&gt;&lt;a href=&quot;http://dorothyperkins.chtah.com/a/hBR4kx3B4YSy$B8z3AJNsiigE6u/dp38&quot; rel=&quot;nofollow&quot; style=&quot;display:block;&quot; target=&quot;_blank&quot; title=&quot;You Tube&quot;&gt;&lt;img alt=&quot;You Tube&quot; border=&quot;0&quot; height=&quot;69&quot; src=&quot;http://media.dorothyperkins.com/wcsstore/ConsumerDirectStorefrontAssetStore/images/colors/color3/cms/pages/email/email-0000016852/images/UK_nl_footer_wk37_4.jpg&quot; style=&quot;display:block;&quot; width=&quot;52&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n						&lt;td align=&quot;center&quot; height=&quot;69&quot; width=&quot;49&quot;&gt;&lt;a href=&quot;http://dorothyperkins.chtah.com/a/hBR4kx3B4YSy$B8z3AJNsiigE6u/dp3&quot; rel=&quot;nofollow&quot; style=&quot;display:block;&quot; target=&quot;_blank&quot; title=&quot;Instagram&quot;&gt;&lt;img alt=&quot;Instagram&quot; border=&quot;0&quot; height=&quot;69&quot; src=&quot;http://media.dorothyperkins.com/wcsstore/ConsumerDirectStorefrontAssetStore/images/colors/color3/cms/pages/email/email-0000016852/images/UK_nl_footer_wk37_5.jpg&quot; style=&quot;display:block;&quot; width=&quot;49&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n						&lt;td align=&quot;center&quot; height=&quot;69&quot; width=&quot;249&quot;&gt;&lt;a href=&quot;http://dorothyperkins.chtah.com/a/hBR4kx3B4YSy$B8z3AJNsiigE6u/dp1&quot; rel=&quot;nofollow&quot; style=&quot;display:block;&quot; target=&quot;_blank&quot; title=&quot;Style HQ&quot;&gt;&lt;img alt=&quot;Style HQ&quot; border=&quot;0&quot; height=&quot;69&quot; src=&quot;http://media.dorothyperkins.com/wcsstore/ConsumerDirectStorefrontAssetStore/images/colors/color3/cms/pages/email/email-0000016852/images/UK_nl_footer_wk37_6.jpg&quot; style=&quot;display:block;&quot; width=&quot;249&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n					&lt;/tr&gt;\r\n				&lt;/tbody&gt;\r\n			&lt;/table&gt;\r\n			&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td&gt;\r\n			&lt;table align=&quot;center&quot; bgcolor=&quot;#ffffff&quot; border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; width=&quot;700&quot;&gt;\r\n				&lt;tbody&gt;\r\n					&lt;tr&gt;\r\n						&lt;td align=&quot;center&quot; height=&quot;43&quot; width=&quot;700&quot;&gt;&lt;img alt=&quot;Terms and conditions&quot; border=&quot;0&quot; height=&quot;43&quot; src=&quot;http://media.dorothyperkins.com/wcsstore/ConsumerDirectStorefrontAssetStore/images/colors/color3/cms/pages/email/email-0000016852/images/UK_nl_sunday_wk47_20.jpg&quot; style=&quot;display:block;&quot; width=&quot;700&quot; /&gt;&lt;/td&gt;\r\n					&lt;/tr&gt;\r\n				&lt;/tbody&gt;\r\n			&lt;/table&gt;\r\n			&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td&gt;\r\n			&lt;table align=&quot;center&quot; bgcolor=&quot;#ffffff&quot; border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; width=&quot;700&quot;&gt;\r\n				&lt;tbody&gt;\r\n					&lt;tr&gt;\r\n						&lt;td align=&quot;center&quot; style=&quot;background:#ffffff;&quot;&gt;\r\n						&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n						&lt;p dir=&quot;ltr&quot;&gt;&lt;span style=&quot;font-size:xx-small;color:#808080;&quot;&gt;&lt;span style=&quot;font-size:xx-small;color:#808080;&quot;&gt;&lt;span style=&quot;font-size:xx-small;color:#808080;&quot;&gt;&lt;span style=&quot;font-family:arial, helvetica, sans-serif;&quot;&gt;&lt;span style=&quot;font-size:x-small;&quot;&gt;&lt;span style=&quot;font-family:arial, helvetica, sans-serif;&quot;&gt;&lt;span style=&quot;font-family:arial, helvetica, sans-serif;&quot;&gt;&lt;span style=&quot;font-size:x-small;&quot;&gt;&lt;span style=&quot;color:#000000;&quot;&gt;&lt;span style=&quot;font-family:arial, helvetica, sans-serif;&quot;&gt;&lt;span style=&quot;font-size:x-small;&quot;&gt;&lt;span style=&quot;font-family:arial, helvetica, sans-serif;&quot;&gt;&lt;span style=&quot;font-size:x-small;&quot;&gt;&lt;span style=&quot;text-align:center;&quot;&gt;&lt;strong&gt;If you want to unsubscribe just click on the following link:&lt;/strong&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt; &lt;a href=&quot;http://dorothyperkins.chtah.com/a/hBR4kx3B4YSy$B8z3AJNsiigE6u/dp6?password=B4YSy$NsiigEBR4kx3ZRMZfuDd5mAV&quot; rel=&quot;nofollow&quot; style=&quot;text-decoration:none;color:#000000;&quot; target=&quot;_blank&quot;&gt;&lt;span style=&quot;font-size:10px;text-decoration:underline;&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-family:arial, helvetica, sans-serif;&quot;&gt;&lt;span style=&quot;font-size:x-small;&quot;&gt;&lt;span style=&quot;font-family:arial, helvetica, sans-serif;&quot;&gt;&lt;span style=&quot;font-size:x-small;&quot;&gt;&lt;span style=&quot;font-family:arial, helvetica, sans-serif;&quot;&gt;&lt;span style=&quot;font-size:x-small;&quot;&gt;UNSUBSCRIBE&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/strong&gt;&lt;/span&gt;&lt;/a&gt;&lt;br /&gt;\r\n						&lt;br /&gt;\r\n						&lt;span style=&quot;font-family:arial, helvetica, sans-serif;&quot;&gt;&lt;span style=&quot;font-size:x-small;&quot;&gt;&lt;span style=&quot;font-family:arial, helvetica, sans-serif;&quot;&gt;&lt;span style=&quot;font-size:x-small;&quot;&gt;&lt;span style=&quot;color:#000000;&quot;&gt;&lt;span style=&quot;font-family:arial, helvetica, sans-serif;&quot;&gt;&lt;span style=&quot;font-size:x-small;&quot;&gt;&lt;span style=&quot;font-family:arial, helvetica, sans-serif;&quot;&gt;&lt;span style=&quot;font-size:x-small;&quot;&gt;Arcadia Group Brands Limited (Co No: 1016191) trading as Dorothy Perkins is a company incorporated in England and Wales.&lt;br /&gt;\r\n						Its registered office is at Colegrave House, 70 Berners Street, London W1T 3NL&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n						&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n						&lt;p dir=&quot;ltr&quot;&gt;&lt;span style=&quot;font-size:xx-small;color:#808080;&quot;&gt;&lt;span style=&quot;font-size:xx-small;color:#808080;&quot;&gt;&lt;span style=&quot;font-size:xx-small;color:#808080;&quot;&gt;&lt;span style=&quot;font-family:arial, helvetica, sans-serif;&quot;&gt;&lt;span style=&quot;font-size:x-small;&quot;&gt;&lt;span style=&quot;font-family:arial, helvetica, sans-serif;&quot;&gt;&lt;span style=&quot;font-family:arial, helvetica, sans-serif;&quot;&gt;&lt;span style=&quot;font-size:x-small;&quot;&gt;&lt;span style=&quot;font-family:arial, helvetica, sans-serif;&quot;&gt;&lt;span style=&quot;font-size:x-small;&quot;&gt;&lt;span style=&quot;color:#000000;&quot;&gt;&lt;span style=&quot;font-family:arial, helvetica, sans-serif;&quot;&gt;&lt;span style=&quot;font-size:x-small;&quot;&gt;&lt;span style=&quot;font-family:arial, helvetica, sans-serif;&quot;&gt;&lt;span style=&quot;font-size:x-small;&quot;&gt;&lt;span style=&quot;font-family:arial, helvetica, sans-serif;&quot;&gt;To ensure our emails reach your inbox add &lt;span style=&quot;text-decoration:underline;&quot;&gt;dorothyperkins@mail.dorothyperkins.com&lt;/span&gt; to your address book&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n						&lt;/td&gt;\r\n					&lt;/tr&gt;\r\n				&lt;/tbody&gt;\r\n			&lt;/table&gt;\r\n			&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n	&lt;/tbody&gt;\r\n&lt;/table&gt;\r\n', '', '');
INSERT INTO `news_description` (`news_id`, `language_id`, `name`, `short_description`, `description`, `meta_description`, `meta_keyword`) VALUES
(24, 2, 'SUPER DRY - SĂN HÀNG NÓNG HÔM NAY', '', '&lt;table align=&quot;center&quot; border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot;&gt;\r\n	&lt;tbody&gt;\r\n		&lt;tr&gt;\r\n			&lt;td&gt;\r\n			&lt;table border=&quot;0&quot; cellpadding=&quot;18&quot; cellspacing=&quot;0&quot; width=&quot;660&quot;&gt;\r\n				&lt;tbody&gt;\r\n					&lt;tr&gt;\r\n						&lt;td&gt;\r\n						&lt;table border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; style=&quot;font-family:Arial,Helvetica,sans-serif;font-size:14px;line-height:16px&quot;&gt;\r\n							&lt;tbody&gt;\r\n								&lt;tr&gt;\r\n									&lt;td bgcolor=&quot;#FFFFFF&quot;&gt;\r\n									&lt;table border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; style=&quot;font-family:Arial,Helvetica,sans-serif;font-size:14px;line-height:16px&quot;&gt;\r\n										&lt;tbody&gt;\r\n											&lt;tr&gt;\r\n												&lt;td&gt;&lt;a href=&quot;http://reporting.supergroup.co.uk/cgi-bin/rr/nobook:345558,nosent:63961,nosrep:126554/http://www.superdry.com?utm_source=redeye&amp;amp;utm_medium=email&amp;amp;utm_campaign=20130714_whats_hot_UK&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;SUPERDRY&quot; border=&quot;0&quot; height=&quot;70&quot; src=&quot;http://reporting.supergroup.co.uk/images/36ded72aac9d0fe7b93b643a94c4c5f9b16861f3.jpg&quot; style=&quot;display:block&quot; width=&quot;660&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n											&lt;/tr&gt;\r\n										&lt;/tbody&gt;\r\n									&lt;/table&gt;\r\n\r\n									&lt;table border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; style=&quot;font-family:Arial,Helvetica,sans-serif;font-size:14px;line-height:16px&quot;&gt;\r\n										&lt;tbody&gt;\r\n											&lt;tr&gt;\r\n												&lt;td&gt;&lt;a href=&quot;http://reporting.supergroup.co.uk/cgi-bin/rr/nobook:345559,nosent:63961,nosrep:126554/http://www.superdry.com?utm_source=redeye&amp;amp;utm_medium=email&amp;amp;utm_campaign=20130714_whats_hot_UK&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;Free Delivery In The UK&quot; border=&quot;0&quot; height=&quot;40&quot; src=&quot;http://reporting.supergroup.co.uk/images/9365c23edba1fbcdfbc1747a44dfc4103cd88a66.jpg&quot; style=&quot;display:block&quot; width=&quot;315&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n												&lt;td&gt;&lt;a href=&quot;http://reporting.supergroup.co.uk/cgi-bin/rr/nobook:345560,nosent:63961,nosrep:126554/http://www.superdry.com/mens/whats-hot?utm_source=redeye&amp;amp;utm_medium=email&amp;amp;utm_campaign=20130714_whats_hot_UK&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;SUPERDRY HOME&quot; border=&quot;0&quot; height=&quot;40&quot; src=&quot;http://reporting.supergroup.co.uk/images/942f4a0a109f89631a1a6aaccdfcbd463ee97bb3.jpg&quot; style=&quot;display:block&quot; width=&quot;125&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n												&lt;td&gt;&lt;a href=&quot;http://reporting.supergroup.co.uk/cgi-bin/rr/nobook:345561,nosent:63961,nosrep:126554/http://www.superdry.com/mens?utm_source=redeye&amp;amp;utm_medium=email&amp;amp;utm_campaign=20130714_whats_hot_UK&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;SHOP MENS&quot; border=&quot;0&quot; height=&quot;40&quot; src=&quot;http://reporting.supergroup.co.uk/images/ffb3f0d4b16c216e1af3e9f14dfe9a02636ed19a.jpg&quot; style=&quot;display:block&quot; width=&quot;120&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n												&lt;td&gt;&lt;a href=&quot;http://reporting.supergroup.co.uk/cgi-bin/rr/nobook:345562,nosent:63961,nosrep:126554/http://www.superdry.com/womens?utm_source=redeye&amp;amp;utm_medium=email&amp;amp;utm_campaign=20130714_whats_hot_UK&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;SHOP WOMENS&quot; border=&quot;0&quot; height=&quot;40&quot; src=&quot;http://reporting.supergroup.co.uk/images/77484a9ade5778a397f35ef728a49b6e65c86579.jpg&quot; style=&quot;display:block&quot; width=&quot;100&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n											&lt;/tr&gt;\r\n										&lt;/tbody&gt;\r\n									&lt;/table&gt;\r\n\r\n									&lt;table border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; style=&quot;font-family:Arial,Helvetica,sans-serif;font-size:14px;line-height:16px&quot;&gt;\r\n										&lt;tbody&gt;\r\n											&lt;tr&gt;\r\n												&lt;td&gt;\r\n												&lt;table border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; width=&quot;100%&quot;&gt;\r\n													&lt;tbody&gt;\r\n														&lt;tr&gt;\r\n															&lt;td&gt;&lt;a href=&quot;http://reporting.supergroup.co.uk/cgi-bin/rr/nobook:345563,nosent:63961,nosrep:126554/http://www.superdry.com/?utm_source=redeye&amp;amp;utm_medium=email&amp;amp;utm_campaign=20130714_whats_hot_UK&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;What''s Hot At Superdry&quot; border=&quot;0&quot; src=&quot;http://reporting.supergroup.co.uk/images/3f92ba1e9c62f73311c8004b306929ea72052162.jpg&quot; style=&quot;display:block&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n														&lt;/tr&gt;\r\n													&lt;/tbody&gt;\r\n												&lt;/table&gt;\r\n												&lt;/td&gt;\r\n											&lt;/tr&gt;\r\n											&lt;tr&gt;\r\n												&lt;td&gt;\r\n												&lt;table border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; width=&quot;100%&quot;&gt;\r\n													&lt;tbody&gt;\r\n														&lt;tr&gt;\r\n															&lt;td&gt;&lt;a href=&quot;http://reporting.supergroup.co.uk/cgi-bin/rr/nobook:345564,nosent:63961,nosrep:126554/http://www.superdry.com/mens/t-shirts/details/39970/warriors-t-shirt?utm_source=redeye&amp;amp;utm_medium=email&amp;amp;utm_campaign=20130714_whats_hot_UK&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;Warriors T-shirt&quot; border=&quot;0&quot; src=&quot;http://reporting.supergroup.co.uk/images/de79f963aec245c12a6adef0c7610a43a1ccf4f4.jpg&quot; style=&quot;display:block&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n															&lt;td&gt;&lt;a href=&quot;http://reporting.supergroup.co.uk/cgi-bin/rr/nobook:345565,nosent:63961,nosrep:126554/http://www.superdry.com/womens/tops/details/39383/vintage-low-arm-vest?utm_source=redeye&amp;amp;utm_medium=email&amp;amp;utm_campaign=20130714_whats_hot_UK&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;Vintage Low Arm Vest&quot; border=&quot;0&quot; src=&quot;http://reporting.supergroup.co.uk/images/90954c41bfad3aa024c4713d7256bc6fe5ec7115.jpg&quot; style=&quot;display:block&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n														&lt;/tr&gt;\r\n													&lt;/tbody&gt;\r\n												&lt;/table&gt;\r\n												&lt;/td&gt;\r\n											&lt;/tr&gt;\r\n										&lt;/tbody&gt;\r\n									&lt;/table&gt;\r\n\r\n									&lt;table border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; style=&quot;font-family:Arial,Helvetica,sans-serif;font-size:14px;line-height:16px&quot; width=&quot;660&quot;&gt;\r\n									&lt;/table&gt;\r\n\r\n									&lt;table border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; style=&quot;font-family:Arial,Helvetica,sans-serif;font-size:14px;line-height:16px&quot;&gt;\r\n										&lt;tbody&gt;\r\n											&lt;tr&gt;\r\n												&lt;td&gt;&lt;a href=&quot;http://reporting.supergroup.co.uk/cgi-bin/rr/nobook:345566,nosent:63961,nosrep:126554/http://www.superdry.com/mens/whats-hot?utm_source=redeye&amp;amp;utm_medium=email&amp;amp;utm_campaign=20130714_whats_hot_UK&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;Mens What''s Hot&quot; border=&quot;0&quot; height=&quot;50&quot; src=&quot;http://reporting.supergroup.co.uk/images/ea442fd3f15cd96cdc06c9e31d2a56b595f8d87c.jpg&quot; style=&quot;display:block&quot; width=&quot;660&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n											&lt;/tr&gt;\r\n											&lt;tr&gt;\r\n												&lt;td&gt;\r\n												&lt;table border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; width=&quot;660&quot;&gt;\r\n													&lt;tbody&gt;\r\n														&lt;tr&gt;\r\n															&lt;td&gt;&lt;a href=&quot;http://reporting.supergroup.co.uk/cgi-bin/rr/nobook:345567,nosent:63961,nosrep:126554/http://www.superdry.com/mens/t-shirts/details/39971/warriors-t-shirt?utm_source=redeye&amp;amp;utm_medium=email&amp;amp;utm_campaign=20130714_whats_hot_UK&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;warriors t shirt&quot; border=&quot;0&quot; src=&quot;http://reporting.supergroup.co.uk/images/dc0205bd7b74cb66fdbd397a6a375e828ccea490.jpg&quot; style=&quot;display:block&quot; width=&quot;175&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n															&lt;td&gt;&lt;a href=&quot;http://reporting.supergroup.co.uk/cgi-bin/rr/nobook:345568,nosent:63961,nosrep:126554/http://www.superdry.com/mens/shorts/details/38137/premium-deck-shorts?utm_source=redeye&amp;amp;utm_medium=email&amp;amp;utm_campaign=20130714_whats_hot_UK&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;premium deck shorts&quot; border=&quot;0&quot; src=&quot;http://reporting.supergroup.co.uk/images/55331ceffd5c5a913585329ee03b771d3303ac7f.jpg&quot; style=&quot;display:block&quot; width=&quot;155&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n															&lt;td&gt;&lt;a href=&quot;http://reporting.supergroup.co.uk/cgi-bin/rr/nobook:345569,nosent:63961,nosrep:126554/http://www.superdry.com/mens/t-shirts/details/39960/osaka-t-shirt?utm_source=redeye&amp;amp;utm_medium=email&amp;amp;utm_campaign=20130714_whats_hot_UK&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;osaka t-shirt&quot; border=&quot;0&quot; src=&quot;http://reporting.supergroup.co.uk/images/43893b223b04f7a59a8b9a06379144fecd928831.jpg&quot; style=&quot;display:block&quot; width=&quot;155&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n															&lt;td&gt;&lt;a href=&quot;http://reporting.supergroup.co.uk/cgi-bin/rr/nobook:345570,nosent:63961,nosrep:126554/http://www.superdry.com/mens/tops/details/39266/grindle-pocket-vest?utm_source=redeye&amp;amp;utm_medium=email&amp;amp;utm_campaign=20130714_whats_hot_UK&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;grindle pocket vest&quot; border=&quot;0&quot; src=&quot;http://reporting.supergroup.co.uk/images/19c53561e42966dd56670634101ad32708d3f1ae.jpg&quot; style=&quot;display:block&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n														&lt;/tr&gt;\r\n														&lt;tr&gt;\r\n															&lt;td&gt;&lt;a href=&quot;http://reporting.supergroup.co.uk/cgi-bin/rr/nobook:345571,nosent:63961,nosrep:126554/http://www.superdry.com/mens/shorts/details/38778/officer-slim-shorts?utm_source=redeye&amp;amp;utm_medium=email&amp;amp;utm_campaign=20130714_whats_hot_UK&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;officer slim shorts&quot; border=&quot;0&quot; src=&quot;http://reporting.supergroup.co.uk/images/42f433c67d5eadb313f36ea3762dc15595b36378.jpg&quot; style=&quot;display:block&quot; width=&quot;175&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n															&lt;td&gt;&lt;a href=&quot;http://reporting.supergroup.co.uk/cgi-bin/rr/nobook:345572,nosent:63961,nosrep:126554/http://www.superdry.com/mens/shorts/details/38137/premium-deck-shorts?utm_source=redeye&amp;amp;utm_medium=email&amp;amp;utm_campaign=20130714_whats_hot_UK&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;premium deck shorts&quot; border=&quot;0&quot; src=&quot;http://reporting.supergroup.co.uk/images/ae8c3b074adafdf0f9807db566eed26625cc2f27.jpg&quot; style=&quot;display:block&quot; width=&quot;155&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n															&lt;td&gt;&lt;a href=&quot;http://reporting.supergroup.co.uk/cgi-bin/rr/nobook:345573,nosent:63961,nosrep:126554/http://www.superdry.com/mens/shorts/details/38779/officer-slim-shorts?utm_source=redeye&amp;amp;utm_medium=email&amp;amp;utm_campaign=20130714_whats_hot_UK&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;officer slim shorts&quot; border=&quot;0&quot; src=&quot;http://reporting.supergroup.co.uk/images/72f961bf7c0158054e9d2a356c969b5f6659a1a9.jpg&quot; style=&quot;display:block&quot; width=&quot;155&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n															&lt;td&gt;&lt;a href=&quot;http://reporting.supergroup.co.uk/cgi-bin/rr/nobook:345574,nosent:63961,nosrep:126554/http://www.superdry.com/mens/shorts/details/38557/commodity-chino-short?utm_source=redeye&amp;amp;utm_medium=email&amp;amp;utm_campaign=20130714_whats_hot_UK&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;commodity chino short&quot; border=&quot;0&quot; src=&quot;http://reporting.supergroup.co.uk/images/e1ce43ff397ab4a22670f0aa1d7c0a18f475236e.jpg&quot; style=&quot;display:block&quot; width=&quot;175&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n														&lt;/tr&gt;\r\n														&lt;tr&gt;\r\n															&lt;td&gt;&lt;a href=&quot;http://reporting.supergroup.co.uk/cgi-bin/rr/nobook:345575,nosent:63961,nosrep:126554/http://www.superdry.com/mens/t-shirts/details/39971/warriors-t-shirt?utm_source=redeye&amp;amp;utm_medium=email&amp;amp;utm_campaign=20130714_whats_hot_UK&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;warriors t shirt&quot; border=&quot;0&quot; height=&quot;55&quot; src=&quot;http://reporting.supergroup.co.uk/images/d905f42f5ef717e51a95e1582970fa842f114875.jpg&quot; style=&quot;display:block&quot; width=&quot;175&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n															&lt;td&gt;&lt;a href=&quot;http://reporting.supergroup.co.uk/cgi-bin/rr/nobook:345576,nosent:63961,nosrep:126554/http://www.superdry.com/mens/shorts/details/38137/premium-deck-shorts?utm_source=redeye&amp;amp;utm_medium=email&amp;amp;utm_campaign=20130714_whats_hot_UK&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;premium deck shorts&quot; border=&quot;0&quot; height=&quot;55&quot; src=&quot;http://reporting.supergroup.co.uk/images/3b385236ef2a0ef47bf9876a9d545424790ae45f.jpg&quot; style=&quot;display:block&quot; width=&quot;155&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n															&lt;td&gt;&lt;a href=&quot;http://reporting.supergroup.co.uk/cgi-bin/rr/nobook:345577,nosent:63961,nosrep:126554/http://www.superdry.com/mens/t-shirts/details/39960/osaka-t-shirt?utm_source=redeye&amp;amp;utm_medium=email&amp;amp;utm_campaign=20130714_whats_hot_UK&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;osaka t-shirt&quot; border=&quot;0&quot; height=&quot;55&quot; src=&quot;http://reporting.supergroup.co.uk/images/cf99b08a0842eaaadd8fee1d3794b942d1b6f3fa.jpg&quot; style=&quot;display:block&quot; width=&quot;155&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n															&lt;td&gt;&lt;a href=&quot;http://reporting.supergroup.co.uk/cgi-bin/rr/nobook:345578,nosent:63961,nosrep:126554/http://www.superdry.com/mens/tops/details/39266/grindle-pocket-vest?utm_source=redeye&amp;amp;utm_medium=email&amp;amp;utm_campaign=20130714_whats_hot_UK&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;grindle pocket vest&quot; border=&quot;0&quot; height=&quot;55&quot; src=&quot;http://reporting.supergroup.co.uk/images/37636604977fff100ccbe52e01584ec804acac04.jpg&quot; style=&quot;display:block&quot; width=&quot;175&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n														&lt;/tr&gt;\r\n														&lt;tr&gt;\r\n															&lt;td&gt;&lt;a href=&quot;http://reporting.supergroup.co.uk/cgi-bin/rr/nobook:345579,nosent:63961,nosrep:126554/http://www.superdry.com/mens/shorts/details/38778/officer-slim-shorts?utm_source=redeye&amp;amp;utm_medium=email&amp;amp;utm_campaign=20130714_whats_hot_UK&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;officer slim shorts&quot; border=&quot;0&quot; height=&quot;70&quot; src=&quot;http://reporting.supergroup.co.uk/images/8d549dde17679e28c3d75381ce00b387c9a22859.jpg&quot; style=&quot;display:block&quot; width=&quot;175&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n															&lt;td&gt;&lt;a href=&quot;http://reporting.supergroup.co.uk/cgi-bin/rr/nobook:345580,nosent:63961,nosrep:126554/http://www.superdry.com/mens/shorts/details/38137/premium-deck-shorts?utm_source=redeye&amp;amp;utm_medium=email&amp;amp;utm_campaign=20130714_whats_hot_UK&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;premium deck shorts&quot; border=&quot;0&quot; height=&quot;70&quot; src=&quot;http://reporting.supergroup.co.uk/images/0decfb8214c224ab5ea1029bf162bcfc395956bf.jpg&quot; style=&quot;display:block&quot; width=&quot;155&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n															&lt;td&gt;&lt;a href=&quot;http://reporting.supergroup.co.uk/cgi-bin/rr/nobook:345581,nosent:63961,nosrep:126554/http://www.superdry.com/mens/shorts/details/38779/officer-slim-shorts?utm_source=redeye&amp;amp;utm_medium=email&amp;amp;utm_campaign=20130714_whats_hot_UK&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;officer slim shorts&quot; border=&quot;0&quot; height=&quot;70&quot; src=&quot;http://reporting.supergroup.co.uk/images/148812b6f0f92f060474c05fdcf9a1188860473f.jpg&quot; style=&quot;display:block&quot; width=&quot;155&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n															&lt;td&gt;&lt;a href=&quot;http://reporting.supergroup.co.uk/cgi-bin/rr/nobook:345582,nosent:63961,nosrep:126554/http://www.superdry.com/mens/shorts/details/38557/commodity-chino-short?utm_source=redeye&amp;amp;utm_medium=email&amp;amp;utm_campaign=20130714_whats_hot_UK&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;commodity chino short&quot; border=&quot;0&quot; height=&quot;70&quot; src=&quot;http://reporting.supergroup.co.uk/images/aca7f2fb5f2c410030da2c4f4d02e47347627b68.jpg&quot; style=&quot;display:block&quot; width=&quot;175&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n														&lt;/tr&gt;\r\n													&lt;/tbody&gt;\r\n												&lt;/table&gt;\r\n												&lt;/td&gt;\r\n											&lt;/tr&gt;\r\n											&lt;tr&gt;\r\n												&lt;td&gt;&lt;a href=&quot;http://reporting.supergroup.co.uk/cgi-bin/rr/nobook:345583,nosent:63961,nosrep:126554/http://www.superdry.com/womens/whats-hot?utm_source=redeye&amp;amp;utm_medium=email&amp;amp;utm_campaign=20130714_whats_hot_UK&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;Womens What''s Hot&quot; border=&quot;0&quot; height=&quot;50&quot; src=&quot;http://reporting.supergroup.co.uk/images/a9995e26527ec94078b1c731b22aac224ab97211.jpg&quot; style=&quot;display:block&quot; width=&quot;660&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n											&lt;/tr&gt;\r\n											&lt;tr&gt;\r\n												&lt;td&gt;\r\n												&lt;table border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; width=&quot;660&quot;&gt;\r\n													&lt;tbody&gt;\r\n														&lt;tr&gt;\r\n															&lt;td&gt;&lt;a href=&quot;http://reporting.supergroup.co.uk/cgi-bin/rr/nobook:345584,nosent:63961,nosrep:126554/http://www.superdry.com/womens/t-shirts/details/39959/vintage-logo-t-shirt?utm_source=redeye&amp;amp;utm_medium=email&amp;amp;utm_campaign=20130714_whats_hot_UK&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;vinatge logo t shirt&quot; border=&quot;0&quot; src=&quot;http://reporting.supergroup.co.uk/images/534c586f3a0b1082383d681051067df4134e185c.jpg&quot; style=&quot;display:block&quot; width=&quot;175&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n															&lt;td&gt;&lt;a href=&quot;http://reporting.supergroup.co.uk/cgi-bin/rr/nobook:345585,nosent:63961,nosrep:126554/http://www.superdry.com/womens/dresses/details/38377/50s-colour-dress?utm_source=redeye&amp;amp;utm_medium=email&amp;amp;utm_campaign=20130714_whats_hot_UK&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;50s colour dress&quot; border=&quot;0&quot; src=&quot;http://reporting.supergroup.co.uk/images/e788872841c46059d9c0c356c464f28bfd1c44b1.jpg&quot; style=&quot;display:block&quot; width=&quot;155&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n															&lt;td&gt;&lt;a href=&quot;http://reporting.supergroup.co.uk/cgi-bin/rr/nobook:345586,nosent:63961,nosrep:126554/http://www.superdry.com/womens/swimwear/details/39048/tanga-stripe-bikini-top?utm_source=redeye&amp;amp;utm_medium=email&amp;amp;utm_campaign=20130714_whats_hot_UK&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;tanga bikini bottom&quot; border=&quot;0&quot; src=&quot;http://reporting.supergroup.co.uk/images/ccfb3251eb4842c444dc3f73f7b3a07343cc6ac8.jpg&quot; style=&quot;display:block&quot; width=&quot;155&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n															&lt;td&gt;&lt;a href=&quot;http://reporting.supergroup.co.uk/cgi-bin/rr/nobook:345587,nosent:63961,nosrep:126554/http://www.superdry.com/womens/tops/details/38200/ticket-type-top-dye-vest?utm_source=redeye&amp;amp;utm_medium=email&amp;amp;utm_campaign=20130714_whats_hot_UK&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;low rise hotpants&quot; border=&quot;0&quot; src=&quot;http://reporting.supergroup.co.uk/images/674e82f42e9988137574d14e55943895c2ca7b64.jpg&quot; style=&quot;display:block&quot; width=&quot;175&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n														&lt;/tr&gt;\r\n														&lt;tr&gt;\r\n															&lt;td&gt;&lt;a href=&quot;http://reporting.supergroup.co.uk/cgi-bin/rr/nobook:345588,nosent:63961,nosrep:126554/http://www.superdry.com/womens/shorts/details/38052/rockabilly-cut-off-short?utm_source=redeye&amp;amp;utm_medium=email&amp;amp;utm_campaign=20130714_whats_hot_UK&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;rockabilly cut off short&quot; border=&quot;0&quot; src=&quot;http://reporting.supergroup.co.uk/images/1cb3eadb35f3db8c81598c8f81030585a5497f02.jpg&quot; style=&quot;display:block&quot; width=&quot;175&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n															&lt;td&gt;&lt;a href=&quot;http://reporting.supergroup.co.uk/cgi-bin/rr/nobook:345589,nosent:63961,nosrep:126554/http://www.superdry.com/womens/dresses/details/38377/50s-colour-dress?utm_source=redeye&amp;amp;utm_medium=email&amp;amp;utm_campaign=20130714_whats_hot_UK&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;50s colour dress&quot; border=&quot;0&quot; src=&quot;http://reporting.supergroup.co.uk/images/07a80dddf92a1fc3c8158a0bcb75eef9b386216b.jpg&quot; style=&quot;display:block&quot; width=&quot;155&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n															&lt;td&gt;&lt;a href=&quot;http://reporting.supergroup.co.uk/cgi-bin/rr/nobook:345590,nosent:63961,nosrep:126554/http://www.superdry.com/womens/swimwear/details/39046/tanga-bikini-bottom?utm_source=redeye&amp;amp;utm_medium=email&amp;amp;utm_campaign=20130714_whats_hot_UK&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;tanga bikini bottom&quot; border=&quot;0&quot; height=&quot;220&quot; src=&quot;http://reporting.supergroup.co.uk/images/afb415472249f681f36db02286696fecae420b3a.jpg&quot; style=&quot;display:block&quot; width=&quot;155&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n															&lt;td&gt;&lt;a href=&quot;http://reporting.supergroup.co.uk/cgi-bin/rr/nobook:345591,nosent:63961,nosrep:126554/http://www.superdry.com/womens/shorts/details/39075/low-rise-hotpants?utm_source=redeye&amp;amp;utm_medium=email&amp;amp;utm_campaign=20130714_whats_hot_UK&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;low rise hotpants&quot; border=&quot;0&quot; height=&quot;220&quot; src=&quot;http://reporting.supergroup.co.uk/images/b49876344931c54f86df1cc6ac928ca9b8b3e581.jpg&quot; style=&quot;display:block&quot; width=&quot;175&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n														&lt;/tr&gt;\r\n														&lt;tr&gt;\r\n															&lt;td&gt;&lt;a href=&quot;http://reporting.supergroup.co.uk/cgi-bin/rr/nobook:345592,nosent:63961,nosrep:126554/http://www.superdry.com/womens/t-shirts/details/39959/vintage-logo-t-shirt?utm_source=redeye&amp;amp;utm_medium=email&amp;amp;utm_campaign=20130714_whats_hot_UK&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;vinatge logo t shirt&quot; border=&quot;0&quot; height=&quot;55&quot; src=&quot;http://reporting.supergroup.co.uk/images/699a45892531091901a1fe14297596851806b225.jpg&quot; style=&quot;display:block&quot; width=&quot;175&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n															&lt;td&gt;&lt;a href=&quot;http://reporting.supergroup.co.uk/cgi-bin/rr/nobook:345593,nosent:63961,nosrep:126554/http://www.superdry.com/womens/dresses/details/38377/50s-colour-dress?utm_source=redeye&amp;amp;utm_medium=email&amp;amp;utm_campaign=20130714_whats_hot_UK&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;50s colour dress&quot; border=&quot;0&quot; height=&quot;55&quot; src=&quot;http://reporting.supergroup.co.uk/images/767019916e9aecb6110700b810d21bfd0e45bcc7.jpg&quot; style=&quot;display:block&quot; width=&quot;155&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n															&lt;td&gt;&lt;a href=&quot;http://reporting.supergroup.co.uk/cgi-bin/rr/nobook:345594,nosent:63961,nosrep:126554/http://www.superdry.com/womens/swimwear/details/39048/tanga-stripe-bikini-top?utm_source=redeye&amp;amp;utm_medium=email&amp;amp;utm_campaign=20130714_whats_hot_UK&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;tanga bikini bottom&quot; border=&quot;0&quot; height=&quot;55&quot; src=&quot;http://reporting.supergroup.co.uk/images/c9366590005d1fdd50131c5945be4bdc72c15671.jpg&quot; style=&quot;display:block&quot; width=&quot;155&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n															&lt;td&gt;&lt;a href=&quot;http://reporting.supergroup.co.uk/cgi-bin/rr/nobook:345595,nosent:63961,nosrep:126554/http://www.superdry.com/womens/tops/details/38200/ticket-type-top-dye-vest?utm_source=redeye&amp;amp;utm_medium=email&amp;amp;utm_campaign=20130714_whats_hot_UK&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;low rise hotpants&quot; border=&quot;0&quot; height=&quot;55&quot; src=&quot;http://reporting.supergroup.co.uk/images/375398bd3c8404e7e3c39820593b7f1ba82c3905.jpg&quot; style=&quot;display:block&quot; width=&quot;175&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n														&lt;/tr&gt;\r\n														&lt;tr&gt;\r\n															&lt;td&gt;&lt;a href=&quot;http://reporting.supergroup.co.uk/cgi-bin/rr/nobook:345596,nosent:63961,nosrep:126554/http://www.superdry.com/womens/shorts/details/38052/rockabilly-cut-off-short?utm_source=redeye&amp;amp;utm_medium=email&amp;amp;utm_campaign=20130714_whats_hot_UK&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;rockabilly cut off short&quot; border=&quot;0&quot; height=&quot;70&quot; src=&quot;http://reporting.supergroup.co.uk/images/f767d1a9c43dd987721aae11fc67475b0dd60842.jpg&quot; style=&quot;display:block&quot; width=&quot;175&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n															&lt;td&gt;&lt;a href=&quot;http://reporting.supergroup.co.uk/cgi-bin/rr/nobook:345597,nosent:63961,nosrep:126554/http://www.superdry.com/womens/dresses/details/38377/50s-colour-dress?utm_source=redeye&amp;amp;utm_medium=email&amp;amp;utm_campaign=20130714_whats_hot_UK&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;50s colour dress&quot; border=&quot;0&quot; height=&quot;70&quot; src=&quot;http://reporting.supergroup.co.uk/images/a90dd9adb25cd81bf84ad6daaacd9921a381e864.jpg&quot; style=&quot;display:block&quot; width=&quot;155&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n															&lt;td&gt;&lt;a href=&quot;http://reporting.supergroup.co.uk/cgi-bin/rr/nobook:345598,nosent:63961,nosrep:126554/http://www.superdry.com/womens/swimwear/details/39046/tanga-bikini-bottom?utm_source=redeye&amp;amp;utm_medium=email&amp;amp;utm_campaign=20130714_whats_hot_UK&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;tanga bikini bottom&quot; border=&quot;0&quot; height=&quot;70&quot; src=&quot;http://reporting.supergroup.co.uk/images/45902c5b751be399286ade647eb5ae785178bad1.jpg&quot; style=&quot;display:block&quot; width=&quot;155&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n															&lt;td&gt;&lt;a href=&quot;http://reporting.supergroup.co.uk/cgi-bin/rr/nobook:345599,nosent:63961,nosrep:126554/http://www.superdry.com/womens/shorts/details/39075/low-rise-hotpants?utm_source=redeye&amp;amp;utm_medium=email&amp;amp;utm_campaign=20130714_whats_hot_UK&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;low rise hotpants&quot; border=&quot;0&quot; height=&quot;70&quot; src=&quot;http://reporting.supergroup.co.uk/images/36cae293c6cad264e2e49028e61faf93410ad49e.jpg&quot; style=&quot;display:block&quot; width=&quot;175&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n														&lt;/tr&gt;\r\n													&lt;/tbody&gt;\r\n												&lt;/table&gt;\r\n												&lt;/td&gt;\r\n											&lt;/tr&gt;\r\n											&lt;tr&gt;\r\n												&lt;td&gt;\r\n												&lt;table border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; width=&quot;100%&quot;&gt;\r\n													&lt;tbody&gt;\r\n														&lt;tr&gt;\r\n															&lt;td&gt;&lt;a href=&quot;http://reporting.supergroup.co.uk/cgi-bin/rr/nobook:345600,nosent:63961,nosrep:126554/http://www.superdry.com/mens/email-look?utm_source=redeye&amp;amp;utm_medium=email&amp;amp;utm_campaign=20130714_whats_hot_UK&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;Vintage Entry Tees&quot; border=&quot;0&quot; height=&quot;410&quot; src=&quot;http://reporting.supergroup.co.uk/images/f534ae5e880164aaf73fc72daada3ffba384716a.jpg&quot; style=&quot;display:block&quot; width=&quot;330&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n															&lt;td&gt;&lt;a href=&quot;http://reporting.supergroup.co.uk/cgi-bin/rr/nobook:345601,nosent:63961,nosrep:126554/http://www.superdry.com/womens/email-look?utm_source=redeye&amp;amp;utm_medium=email&amp;amp;utm_campaign=20130714_whats_hot_UK&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;Vintage Entry Tees&quot; border=&quot;0&quot; height=&quot;410&quot; src=&quot;http://reporting.supergroup.co.uk/images/e80b5b181958ed91fd05894bf74a5651b032be86.jpg&quot; style=&quot;display:block&quot; width=&quot;330&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n														&lt;/tr&gt;\r\n													&lt;/tbody&gt;\r\n												&lt;/table&gt;\r\n												&lt;/td&gt;\r\n											&lt;/tr&gt;\r\n											&lt;tr&gt;\r\n												&lt;td bgcolor=&quot;#212020&quot;&gt;\r\n												&lt;table border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; width=&quot;100%&quot;&gt;\r\n													&lt;tbody&gt;\r\n														&lt;tr&gt;\r\n															&lt;td height=&quot;25&quot; width=&quot;230&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n															&lt;td height=&quot;25&quot; width=&quot;25&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n															&lt;td height=&quot;25&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n															&lt;td height=&quot;25&quot; width=&quot;25&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n															&lt;td height=&quot;25&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n															&lt;td height=&quot;25&quot; width=&quot;25&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n															&lt;td height=&quot;25&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n															&lt;td height=&quot;25&quot; width=&quot;25&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n															&lt;td height=&quot;25&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n															&lt;td height=&quot;25&quot; width=&quot;25&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n															&lt;td height=&quot;25&quot; width=&quot;230&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n														&lt;/tr&gt;\r\n														&lt;tr&gt;\r\n															&lt;td&gt;&amp;nbsp;&lt;/td&gt;\r\n															&lt;td&gt;&lt;a href=&quot;http://reporting.supergroup.co.uk/cgi-bin/rr/nobook:345602,nosent:63961,nosrep:126554/http://www.facebook.com/Superdry?utm_source=redeye&amp;amp;utm_medium=email&amp;amp;utm_campaign=20130714_whats_hot_UK&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;facebook&quot; border=&quot;0&quot; height=&quot;30&quot; src=&quot;http://reporting.supergroup.co.uk/images/443e9426d31daa8760feb343022cca02ace80888.jpg&quot; style=&quot;display:block&quot; width=&quot;30&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n															&lt;td&gt;&amp;nbsp;&lt;/td&gt;\r\n															&lt;td&gt;&lt;a href=&quot;http://reporting.supergroup.co.uk/cgi-bin/rr/nobook:345603,nosent:63961,nosrep:126554/http://www.twitter.com/superdry?utm_source=redeye&amp;amp;utm_medium=email&amp;amp;utm_campaign=20130714_whats_hot_UK&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;twitter&quot; border=&quot;0&quot; height=&quot;30&quot; src=&quot;http://reporting.supergroup.co.uk/images/b6096603c65cdf4c2fbce6d06e15414c01dc33c0.jpg&quot; style=&quot;display:block&quot; width=&quot;30&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n															&lt;td&gt;&amp;nbsp;&lt;/td&gt;\r\n															&lt;td&gt;&lt;a href=&quot;http://reporting.supergroup.co.uk/cgi-bin/rr/nobook:345604,nosent:63961,nosrep:126554/http://plus.google.com/+superdry/?utm_source=redeye&amp;amp;utm_medium=email&amp;amp;utm_campaign=20130714_whats_hot_UK&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;google plus&quot; border=&quot;0&quot; height=&quot;30&quot; src=&quot;http://reporting.supergroup.co.uk/images/374f2db10188686f3fec6f3ebde7ddf21d0533d6.jpg&quot; style=&quot;display:block&quot; width=&quot;30&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n															&lt;td&gt;&amp;nbsp;&lt;/td&gt;\r\n															&lt;td&gt;&lt;a href=&quot;http://reporting.supergroup.co.uk/cgi-bin/rr/nobook:345605,nosent:63961,nosrep:126554/http://pinterest.com/superdryglobal/?utm_source=redeye&amp;amp;utm_medium=email&amp;amp;utm_campaign=20130714_whats_hot_UK&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;pinterest&quot; border=&quot;0&quot; height=&quot;30&quot; src=&quot;http://reporting.supergroup.co.uk/images/8932dc7de6d9788fc3da53c0c3ac7885190e503f.jpg&quot; style=&quot;display:block&quot; width=&quot;30&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n															&lt;td&gt;&amp;nbsp;&lt;/td&gt;\r\n															&lt;td&gt;&lt;a href=&quot;http://reporting.supergroup.co.uk/cgi-bin/rr/nobook:345606,nosent:63961,nosrep:126554/http://instagram.com/superdryglobal?utm_source=redeye&amp;amp;utm_medium=email&amp;amp;utm_campaign=20130714_whats_hot_UK&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;instagram&quot; border=&quot;0&quot; height=&quot;30&quot; src=&quot;http://reporting.supergroup.co.uk/images/ce41e1f88a47b354f5195f68fffa0a80e928dd1a.jpg&quot; style=&quot;display:block&quot; width=&quot;30&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n															&lt;td&gt;&amp;nbsp;&lt;/td&gt;\r\n														&lt;/tr&gt;\r\n													&lt;/tbody&gt;\r\n												&lt;/table&gt;\r\n												&lt;/td&gt;\r\n											&lt;/tr&gt;\r\n										&lt;/tbody&gt;\r\n									&lt;/table&gt;\r\n									&lt;/td&gt;\r\n								&lt;/tr&gt;\r\n							&lt;/tbody&gt;\r\n						&lt;/table&gt;\r\n						&lt;/td&gt;\r\n					&lt;/tr&gt;\r\n				&lt;/tbody&gt;\r\n			&lt;/table&gt;\r\n			&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n	&lt;/tbody&gt;\r\n&lt;/table&gt;\r\n', '', ''),
(25, 2, 'DIESEL - BỘ SƯU TẬP THU ĐÔNG 2013 !!', '', '&lt;div bgcolor=&quot;#FFFFFF&quot;&gt;\r\n&lt;table align=&quot;center&quot; border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; width=&quot;653&quot;&gt;\r\n	&lt;tbody&gt;\r\n		&lt;tr&gt;\r\n			&lt;td style=&quot;font-size:0pt&quot;&gt;\r\n			&lt;table align=&quot;center&quot; border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot;&gt;\r\n				&lt;tbody&gt;\r\n					&lt;tr&gt;\r\n						&lt;td&gt;&amp;nbsp;&lt;/td&gt;\r\n					&lt;/tr&gt;\r\n					&lt;tr&gt;\r\n						&lt;td style=&quot;font-size:0pt&quot;&gt;&lt;font color=&quot;#FFFFFF&quot; face=&quot;Verdana, Arial, Helvetica, Sans-serif&quot; style=&quot;font-size:2px&quot;&gt;For Successful Living&lt;/font&gt;&lt;/td&gt;\r\n					&lt;/tr&gt;\r\n					&lt;tr&gt;\r\n						&lt;td height=&quot;2&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n					&lt;/tr&gt;\r\n				&lt;/tbody&gt;\r\n			&lt;/table&gt;\r\n			&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td align=&quot;right&quot; colspan=&quot;5&quot; height=&quot;30&quot; style=&quot;font-size:0&quot;&gt;&lt;font color=&quot;#837e7e&quot; face=&quot;Arial,Arial,Helvetica,sans-serif&quot; size=&quot;1.5&quot;&gt;Problems viewing this email? &lt;a href=&quot;http://cs.nl.diesel.com/ov/2000389/1367/K0LfPmYJIT2HkAEnpmzD996PEQvTF2AGkhU2E6TXfn9%2FHUxcvXODKmZcPkvVsIg4&quot; target=&quot;_blank&quot;&gt;&lt;font color=&quot;#837e7e&quot; style=&quot;text-decoration:none&quot;&gt;Click here&lt;/font&gt;&lt;/a&gt;&lt;/font&gt;&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n	&lt;/tbody&gt;\r\n&lt;/table&gt;\r\n\r\n&lt;table align=&quot;center&quot; border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; style=&quot;font-size:0&quot; width=&quot;652&quot;&gt;\r\n	&lt;tbody&gt;\r\n		&lt;tr&gt;\r\n			&lt;td style=&quot;font-size:0&quot;&gt;\r\n			&lt;table align=&quot;center&quot; border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; style=&quot;font-size:0&quot; width=&quot;653&quot;&gt;\r\n				&lt;tbody&gt;\r\n					&lt;tr&gt;\r\n						&lt;td align=&quot;left&quot; width=&quot;95&quot;&gt;&lt;a href=&quot;http://t.nl.diesel.com/c/2000389/1367/20528001/22198&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;www.diesel.com&quot; border=&quot;0&quot; height=&quot;52&quot; src=&quot;http://nl.yoox.biz/os-nl/dieselWW/230312/gift_guide_diesel_03.jpg&quot; width=&quot;95&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n						&lt;td align=&quot;left&quot; width=&quot;111&quot;&gt;&lt;a href=&quot;http://t.nl.diesel.com/c/2000389/1367/20528001/22198&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;www.diesel.com&quot; border=&quot;0&quot; height=&quot;52&quot; src=&quot;http://nl.yoox.biz/os-nl/dieselWW/230312/gift_guide_diesel_04.jpg&quot; width=&quot;111&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n						&lt;td align=&quot;left&quot; width=&quot;120&quot;&gt;&lt;a href=&quot;http://t.nl.diesel.com/c/2000389/1367/20528001/22199&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;store.diesel.com&quot; border=&quot;0&quot; height=&quot;52&quot; src=&quot;http://nl.yoox.biz/os-nl/dieselWW/230312/gift_guide_diesel_05.jpg&quot; width=&quot;120&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n						&lt;td align=&quot;left&quot; width=&quot;121&quot;&gt;&lt;a href=&quot;http://t.nl.diesel.com/c/2000389/1367/20528001/22200&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;www.diesel.com/store-locator&quot; border=&quot;0&quot; height=&quot;52&quot; src=&quot;http://nl.yoox.biz/os-nl/dieselWW/230312/gift_guide_diesel_06.jpg&quot; width=&quot;121&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n						&lt;td align=&quot;left&quot; width=&quot;99&quot;&gt;&lt;a href=&quot;http://t.nl.diesel.com/c/2000389/1367/20528001/22201&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;campaign&quot; border=&quot;0&quot; height=&quot;52&quot; src=&quot;http://nl.yoox.biz/os-nl/dieselWW/230312/campaign.jpg&quot; style=&quot;display:block&quot; width=&quot;99&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n						&lt;td bgcolor=&quot;#1B1B1B&quot; width=&quot;107&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n					&lt;/tr&gt;\r\n				&lt;/tbody&gt;\r\n			&lt;/table&gt;\r\n			&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td bgcolor=&quot;#FFFFFF&quot; height=&quot;20&quot; style=&quot;font-size:0&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td bgcolor=&quot;#FFFFFF&quot; style=&quot;font-size:0&quot;&gt;\r\n			&lt;table border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; height=&quot;1260&quot; width=&quot;653&quot;&gt;\r\n				&lt;tbody&gt;\r\n					&lt;tr&gt;\r\n						&lt;td&gt;&lt;a href=&quot;http://t.nl.diesel.com/c/2000389/1367/20528001/22202&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;&quot; border=&quot;0&quot; height=&quot;665&quot; src=&quot;http://nl.yoox.biz/os-nl/dieselWW/_2013/110713/NL_ShopLook_03_01.jpg&quot; width=&quot;303&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n						&lt;td&gt;&lt;a href=&quot;http://t.nl.diesel.com/c/2000389/1367/20528001/22202&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;&quot; border=&quot;0&quot; height=&quot;665&quot; src=&quot;http://nl.yoox.biz/os-nl/dieselWW/_2013/110713/NL_ShopLook_03_02.jpg&quot; width=&quot;350&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n					&lt;/tr&gt;\r\n					&lt;tr&gt;\r\n						&lt;td&gt;&lt;a href=&quot;http://t.nl.diesel.com/c/2000389/1367/20528001/22203&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;&quot; border=&quot;0&quot; height=&quot;68&quot; src=&quot;http://nl.yoox.biz/os-nl/dieselWW/_2013/110713/NL_ShopLook_03_03.jpg&quot; width=&quot;303&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n						&lt;td&gt;&lt;a href=&quot;http://t.nl.diesel.com/c/2000389/1367/20528001/22204&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;&quot; border=&quot;0&quot; height=&quot;68&quot; src=&quot;http://nl.yoox.biz/os-nl/dieselWW/_2013/110713/NL_ShopLook_03_04.jpg&quot; width=&quot;350&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n					&lt;/tr&gt;\r\n					&lt;tr&gt;\r\n						&lt;td&gt;&lt;a href=&quot;http://t.nl.diesel.com/c/2000389/1367/20528001/22203&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;&quot; border=&quot;0&quot; height=&quot;527&quot; src=&quot;http://nl.yoox.biz/os-nl/dieselWW/_2013/110713/NL_ShopLook_03_05.jpg&quot; width=&quot;303&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n						&lt;td&gt;&lt;a href=&quot;http://t.nl.diesel.com/c/2000389/1367/20528001/22203&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;&quot; border=&quot;0&quot; height=&quot;527&quot; src=&quot;http://nl.yoox.biz/os-nl/dieselWW/_2013/110713/NL_ShopLook_03_06.jpg&quot; width=&quot;350&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n					&lt;/tr&gt;\r\n				&lt;/tbody&gt;\r\n			&lt;/table&gt;\r\n			&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td bgcolor=&quot;#FFFFFF&quot; style=&quot;font-size:0&quot;&gt;\r\n			&lt;table border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; height=&quot;0&quot; style=&quot;font-size:0&quot; width=&quot;653&quot;&gt;\r\n				&lt;tbody&gt;\r\n					&lt;tr&gt;\r\n						&lt;td style=&quot;font-size:0&quot;&gt;&lt;img alt=&quot;DIESEL 2011 P.IVA IT00642650246&quot; border=&quot;0&quot; height=&quot;52&quot; src=&quot;http://nl.yoox.biz/os-nl/dieselWW/_2013/110713/diesel_13.jpg&quot; style=&quot;display:block&quot; width=&quot;446&quot; /&gt;&lt;/td&gt;\r\n						&lt;td style=&quot;font-size:0&quot;&gt;&lt;a href=&quot;http://t.nl.diesel.com/c/2000389/1367/20528001/22205&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;OTB Foundation&quot; border=&quot;0&quot; height=&quot;52&quot; src=&quot;http://nl.yoox.biz/os-nl/dieselWW/230312/gift_guide_diesel_14.jpg&quot; style=&quot;display:block&quot; width=&quot;206&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n					&lt;/tr&gt;\r\n				&lt;/tbody&gt;\r\n			&lt;/table&gt;\r\n			&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td bgcolor=&quot;#FFFFFF&quot; style=&quot;font-size:0&quot;&gt;\r\n			&lt;table bgcolor=&quot;#000000&quot; border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; style=&quot;font-size:0&quot; width=&quot;653&quot;&gt;\r\n				&lt;tbody&gt;\r\n					&lt;tr&gt;\r\n						&lt;td align=&quot;left&quot; rowspan=&quot;4&quot; width=&quot;91&quot;&gt;&lt;a href=&quot;http://t.nl.diesel.com/c/2000389/1367/20528001/22206&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;www.diesel.com/collections&quot; border=&quot;0&quot; height=&quot;108&quot; src=&quot;http://nl.yoox.biz/os-nl/dieselWW/230312/gift_guide_diesel_17.jpg&quot; width=&quot;91&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n						&lt;td align=&quot;left&quot; rowspan=&quot;4&quot; width=&quot;82&quot;&gt;&lt;a href=&quot;http://t.nl.diesel.com/c/2000389/1367/20528001/22207&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;www.diesel.com/lifestyle&quot; border=&quot;0&quot; height=&quot;108&quot; src=&quot;http://nl.yoox.biz/os-nl/dieselWW/230312/gift_guide_diesel_18.jpg&quot; width=&quot;82&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n						&lt;td rowspan=&quot;4&quot; width=&quot;92&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n						&lt;td rowspan=&quot;4&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n						&lt;td rowspan=&quot;4&quot; width=&quot;340&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n						&lt;td&gt;&lt;a href=&quot;http://t.nl.diesel.com/c/2000389/1367/20528001/22208&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;www.youtube.com/dieselplanet&quot; border=&quot;0&quot; height=&quot;38&quot; src=&quot;http://nl.yoox.biz/os-nl/dieselWW/230312/gift_guide_diesel_20.jpg&quot; style=&quot;display:block&quot; width=&quot;78&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n					&lt;/tr&gt;\r\n					&lt;tr&gt;\r\n						&lt;td&gt;&lt;a href=&quot;http://t.nl.diesel.com/c/2000389/1367/20528001/22209&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;www.facebook.com/facebook&quot; border=&quot;0&quot; height=&quot;18&quot; src=&quot;http://nl.yoox.biz/os-nl/dieselWW/230312/gift_guide_diesel_21.jpg&quot; style=&quot;display:block&quot; width=&quot;78&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n					&lt;/tr&gt;\r\n					&lt;tr&gt;\r\n						&lt;td&gt;&lt;a href=&quot;http://t.nl.diesel.com/c/2000389/1367/20528001/22210&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;www.twitter.com/planetdiesel&quot; border=&quot;0&quot; height=&quot;19&quot; src=&quot;http://nl.yoox.biz/os-nl/dieselWW/230312/gift_guide_diesel_22.jpg&quot; style=&quot;display:block&quot; width=&quot;78&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n					&lt;/tr&gt;\r\n					&lt;tr&gt;\r\n						&lt;td&gt;\r\n						&lt;p&gt;&lt;a href=&quot;http://t.nl.diesel.com/c/2000389/1367/20528001/22211&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;www.flickr.com/dieselplanet&quot; border=&quot;0&quot; height=&quot;18&quot; src=&quot;http://nl.yoox.biz/os-nl/dieselWW/_2013/110713/Flickr.jpg&quot; style=&quot;display:block&quot; width=&quot;78&quot; /&gt;&lt;/a&gt;&lt;a href=&quot;http://t.nl.diesel.com/c/2000389/1367/20528001/22212&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;www.flickr.com/dieselplanet&quot; border=&quot;0&quot; height=&quot;32&quot; src=&quot;http://nl.yoox.biz/os-nl/dieselWW/_2013/110713/Pinterest.jpg&quot; style=&quot;display:block&quot; width=&quot;78&quot; /&gt;&lt;/a&gt;&lt;/p&gt;\r\n						&lt;/td&gt;\r\n					&lt;/tr&gt;\r\n				&lt;/tbody&gt;\r\n			&lt;/table&gt;\r\n			&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td align=&quot;center&quot; bgcolor=&quot;#FFFFFF&quot; colspan=&quot;12&quot;&gt;\r\n			&lt;table align=&quot;center&quot; border=&quot;0&quot; cellpadding=&quot;5&quot; cellspacing=&quot;5&quot; valign=&quot;middle&quot; width=&quot;600&quot;&gt;\r\n				&lt;tbody&gt;\r\n					&lt;tr&gt;\r\n						&lt;td align=&quot;center&quot; bgcolor=&quot;#FFFFFF&quot; height=&quot;50&quot;&gt;&lt;font color=&quot;#837e7e&quot; face=&quot;Arial,Arial,Helvetica,sans-serif&quot; size=&quot;1.5&quot; style=&quot;font-size:9px&quot;&gt;&lt;a href=&quot;http://t.nl.diesel.com/c/2000389/1367/20528001/22213&quot; style=&quot;color:#7e7e7c;font-size:9px;text-decoration:none&quot; target=&quot;_blank&quot;&gt;Customer Care&lt;/a&gt; | &lt;a href=&quot;http://t.nl.diesel.com/c/2000389/1367/20528001/22214&quot; style=&quot;color:#7e7e7c;font-size:9px;text-decoration:none&quot; target=&quot;_blank&quot;&gt;Contact Us&lt;/a&gt; | &lt;a href=&quot;http://t.nl.diesel.com/c/2000389/1367/20528001/22215&quot; style=&quot;color:#7e7e7c;font-size:9px;text-decoration:none&quot; target=&quot;_blank&quot;&gt;Privacy&lt;/a&gt;&lt;br /&gt;\r\n						&lt;br /&gt;\r\n						To ensure delivery of &lt;strong&gt;&lt;span class=&quot;il&quot;&gt;Diesel&lt;/span&gt; Online Store&lt;/strong&gt; e-mail to your inbox,&lt;br /&gt;\r\n						please add &lt;strong style=&quot;color:#7e7e7c;font-size:9px;text-decoration:none&quot;&gt;&lt;a href=&quot;mailto:newsletter@diesel.com&quot; target=&quot;_blank&quot;&gt;newsletter@&lt;span class=&quot;il&quot;&gt;diesel&lt;/span&gt;.com&lt;/a&gt;&lt;/strong&gt; to your address book.&lt;br /&gt;\r\n						You are subscribed to this e-mail as &lt;b style=&quot;color:#7e7e7c;font-size:9px;text-decoration:none&quot;&gt;&lt;a href=&quot;mailto:welookvn@gmail.com&quot; target=&quot;_blank&quot;&gt;welookvn@gmail.com&lt;/a&gt;&lt;/b&gt;&lt;br /&gt;\r\n						if you no longer wish to receive these messages, please click &lt;a href=&quot;http://t.nl.diesel.com/c/2000389/1367/20528001/22216?email=welookvn@gmail.com&quot; style=&quot;color:#7e7e7c;font-size:9px;text-decoration:none&quot; target=&quot;_blank&quot;&gt;Unsubscribe&lt;/a&gt;&lt;br /&gt;\r\n						&lt;br /&gt;\r\n						&lt;span class=&quot;il&quot;&gt;Diesel&lt;/span&gt; S.p.A. via dell''Industria, 4/6 n7 - 36042 Breganze (VI), Italy - P.I. n. 00642650246 © 2013 &lt;span class=&quot;il&quot;&gt;DIESEL&lt;/span&gt;&lt;/font&gt;&lt;/td&gt;\r\n					&lt;/tr&gt;\r\n				&lt;/tbody&gt;\r\n			&lt;/table&gt;\r\n			&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n	&lt;/tbody&gt;\r\n&lt;/table&gt;\r\n&lt;/div&gt;\r\n', '', '');
INSERT INTO `news_description` (`news_id`, `language_id`, `name`, `short_description`, `description`, `meta_description`, `meta_keyword`) VALUES
(26, 2, 'J.CREW - ĐỢT SALE CUỐI ĐẾN 40% !!', '', '&lt;div alink=&quot;#666666&quot; bgcolor=&quot;#ffffff&quot; link=&quot;#666666&quot; vlink=&quot;#666666&quot;&gt;\r\n&lt;div class=&quot;adM&quot;&gt;&amp;nbsp;&lt;/div&gt;\r\n\r\n&lt;table align=&quot;center&quot; border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; style=&quot;margin-bottom:10px&quot; width=&quot;580&quot;&gt;\r\n	&lt;tbody&gt;\r\n		&lt;tr&gt;\r\n			&lt;td align=&quot;center&quot;&gt;&lt;br /&gt;\r\n			&lt;br /&gt;\r\n			&lt;font style=&quot;font-family:verdana,arial,helvetica,sans-serif;font-size:10px;color:#71706c&quot;&gt;&lt;a href=&quot;http://e.jcrew.com/a/hBR4rUXBgTeL6B8z1uxNs7OVq8B/womenday-100?d_source=EMSL06717&amp;amp;email=welookvn@gmail.com&quot; style=&quot;text-decoration:underline&quot; target=&quot;_blank&quot;&gt;&lt;font color=&quot;#71706C&quot;&gt;40% off swim styles*&lt;/font&gt;&lt;/a&gt;&lt;br /&gt;\r\n			If you can''t see the images in this email, &lt;a href=&quot;http://e.jcrew.com/a/hBR4rUXBgTeL6B8z1uxNs7OVq8B/html-100?t_params=I_SOURCE%3D0%26EMAIL%3Dwelookvn%2540gmail.com%26PASSWORD%3DBgTeL6Ns7OVqBR4rUXM3QUZOU3y84s%26ZZ_COUNTRY%3DUS&quot; style=&quot;text-decoration:underline&quot; target=&quot;_blank&quot;&gt; &lt;font color=&quot;#71706C&quot;&gt;click here&lt;/font&gt;&lt;/a&gt;.&lt;br /&gt;\r\n			View this email on a &lt;a href=&quot;http://e.jcrew.com/a/hBR4rUXBgTeL6B8z1uxNs7OVq8B/mobile-100?t_params=I_SOURCE%3D0%26EMAIL%3Dwelookvn%2540gmail.com%26PASSWORD%3DBgTeL6Ns7OVqBR4rUXM3QUZOU3y84s%26ZZ_COUNTRY%3DUS&quot; style=&quot;text-decoration:underline&quot; target=&quot;_blank&quot;&gt; &lt;font color=&quot;#71706C&quot;&gt;mobile device&lt;/font&gt;&lt;/a&gt;.&lt;/font&gt;&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n	&lt;/tbody&gt;\r\n&lt;/table&gt;\r\n\r\n&lt;table align=&quot;center&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; style=&quot;border:0;padding:0&quot; width=&quot;580&quot;&gt;\r\n	&lt;tbody&gt;\r\n		&lt;tr&gt;\r\n			&lt;td align=&quot;center&quot; valign=&quot;top&quot;&gt;\r\n			&lt;table align=&quot;center&quot; border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; width=&quot;580&quot;&gt;\r\n				&lt;tbody&gt;\r\n					&lt;tr&gt;\r\n						&lt;td&gt;&lt;a href=&quot;http://e.jcrew.com/a/hBR4rUXBgTeL6B8z1uxNs7OVq8B/home-100?d_source=EMSL06717&amp;amp;email=welookvn@gmail.com&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;JCrew.com&quot; border=&quot;0&quot; height=&quot;90&quot; src=&quot;http://images.jcrew.com/fsi/emails/template/2013_narrow_template/nav_jc_580_black_june_2013.jpg&quot; style=&quot;display:block&quot; width=&quot;580&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n					&lt;/tr&gt;\r\n				&lt;/tbody&gt;\r\n			&lt;/table&gt;\r\n\r\n			&lt;table align=&quot;center&quot; border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; style=&quot;margin:0&quot; width=&quot;580&quot;&gt;\r\n				&lt;tbody&gt;\r\n					&lt;tr&gt;\r\n						&lt;td&gt;&lt;a href=&quot;http://e.jcrew.com/a/hBR4rUXBgTeL6B8z1uxNs7OVq8B/home-100?d_source=EMSL06717&amp;amp;email=welookvn@gmail.com&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;Women&quot; border=&quot;0&quot; height=&quot;27&quot; src=&quot;http://images.jcrew.com/fsi/emails/template/2013_narrow_template/jc_narrow_template_nav_1.gif&quot; style=&quot;display:block&quot; width=&quot;80&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n						&lt;td&gt;&lt;a href=&quot;http://e.jcrew.com/a/hBR4rUXBgTeL6B8z1uxNs7OVq8B/women-100?d_source=EMSL06717&amp;amp;email=welookvn@gmail.com&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;Women&quot; border=&quot;0&quot; height=&quot;27&quot; src=&quot;http://images.jcrew.com/fsi/emails/template/2013_narrow_template/jc_narrow_template_nav_2.gif&quot; style=&quot;display:block&quot; width=&quot;76&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n						&lt;td&gt;&lt;a href=&quot;http://e.jcrew.com/a/hBR4rUXBgTeL6B8z1uxNs7OVq8B/men-100?d_source=EMSL06717&amp;amp;email=welookvn@gmail.com&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;Men&quot; border=&quot;0&quot; height=&quot;27&quot; src=&quot;http://images.jcrew.com/fsi/emails/template/2013_narrow_template/jc_narrow_template_nav_3.gif&quot; style=&quot;display:block&quot; width=&quot;55&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n						&lt;td&gt;&lt;a href=&quot;http://e.jcrew.com/a/hBR4rUXBgTeL6B8z1uxNs7OVq8B/crewcuts-100?d_source=EMSL06717&amp;amp;email=welookvn@gmail.com&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;Kids&quot; border=&quot;0&quot; height=&quot;27&quot; src=&quot;http://images.jcrew.com/fsi/emails/template/2013_narrow_template/jc_narrow_template_nav_4.gif&quot; style=&quot;display:block&quot; width=&quot;53&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n						&lt;td&gt;&lt;a href=&quot;http://e.jcrew.com/a/hBR4rUXBgTeL6B8z1uxNs7OVq8B/wedding-100?d_source=EMSL06717&amp;amp;email=welookvn@gmail.com&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;Wedding&quot; border=&quot;0&quot; height=&quot;27&quot; src=&quot;http://images.jcrew.com/fsi/emails/template/2013_narrow_template/jc_narrow_template_nav_5.gif&quot; style=&quot;display:block&quot; width=&quot;91&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n						&lt;td&gt;&lt;a href=&quot;http://e.jcrew.com/a/hBR4rUXBgTeL6B8z1uxNs7OVq8B/sale-100?d_source=EMSL06717&amp;amp;email=welookvn@gmail.com&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;Sale&quot; border=&quot;0&quot; height=&quot;27&quot; src=&quot;http://images.jcrew.com/fsi/emails/template/2013_narrow_template/jc_narrow_template_nav_6.gif&quot; style=&quot;display:block&quot; width=&quot;55&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n						&lt;td&gt;&lt;a href=&quot;http://e.jcrew.com/a/hBR4rUXBgTeL6B8z1uxNs7OVq8B/blog-100?d_source=EMSL06717&amp;amp;email=welookvn@gmail.com&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;Sale&quot; border=&quot;0&quot; height=&quot;27&quot; src=&quot;http://images.jcrew.com/fsi/emails/template/2013_narrow_template/jc_narrow_template_nav_7.gif&quot; style=&quot;display:block&quot; width=&quot;60&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n						&lt;td&gt;&lt;a href=&quot;http://e.jcrew.com/a/hBR4rUXBgTeL6B8z1uxNs7OVq8B/home-100?d_source=EMSL06717&amp;amp;email=welookvn@gmail.com&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;Sale&quot; border=&quot;0&quot; height=&quot;27&quot; src=&quot;http://images.jcrew.com/fsi/emails/template/2013_narrow_template/jc_narrow_template_nav_8.gif&quot; style=&quot;display:block&quot; width=&quot;69&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n					&lt;/tr&gt;\r\n				&lt;/tbody&gt;\r\n			&lt;/table&gt;\r\n\r\n			&lt;table align=&quot;center&quot; border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; width=&quot;580&quot;&gt;\r\n				&lt;tbody&gt;\r\n					&lt;tr&gt;\r\n						&lt;td&gt;\r\n						&lt;center&gt;&lt;a href=&quot;http://e.jcrew.com/a/hBR4rUXBgTeL6B8z1uxNs7OVq8B/womenday-100?d_source=EMSL06717&amp;amp;email=welookvn@gmail.com&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;JCrew.com&quot; border=&quot;0&quot; src=&quot;http://images.jcrew.com/fsi/emails/2013/07/071413_jc_summersale_01.jpg&quot; style=&quot;display:block;width:580px;min-height:573px&quot; /&gt; &lt;/a&gt;&lt;/center&gt;\r\n						&lt;/td&gt;\r\n					&lt;/tr&gt;\r\n				&lt;/tbody&gt;\r\n			&lt;/table&gt;\r\n\r\n			&lt;table align=&quot;center&quot; border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; width=&quot;580&quot;&gt;\r\n				&lt;tbody&gt;\r\n					&lt;tr&gt;\r\n						&lt;td&gt;\r\n						&lt;center&gt;&lt;a href=&quot;http://e.jcrew.com/a/hBR4rUXBgTeL6B8z1uxNs7OVq8B/mendays-100?d_source=EMSL06717&amp;amp;email=welookvn@gmail.com&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;JCrew.com&quot; border=&quot;0&quot; src=&quot;http://images.jcrew.com/fsi/emails/2013/07/071413_jc_summersale_02.jpg&quot; style=&quot;display:block;width:580px;min-height:31px&quot; /&gt; &lt;/a&gt;&lt;/center&gt;\r\n						&lt;/td&gt;\r\n					&lt;/tr&gt;\r\n				&lt;/tbody&gt;\r\n			&lt;/table&gt;\r\n\r\n			&lt;table align=&quot;center&quot; border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; width=&quot;580&quot;&gt;\r\n				&lt;tbody&gt;\r\n					&lt;tr&gt;\r\n						&lt;td&gt;\r\n						&lt;center&gt;&lt;a href=&quot;http://e.jcrew.com/a/hBR4rUXBgTeL6B8z1uxNs7OVq8B/girlsday-100?d_source=EMSL06717&amp;amp;email=welookvn@gmail.com&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;JCrew.com&quot; border=&quot;0&quot; src=&quot;http://images.jcrew.com/fsi/emails/2013/07/071413_jc_summersale_03.jpg&quot; style=&quot;display:block;width:580px;min-height:29px&quot; /&gt; &lt;/a&gt;&lt;/center&gt;\r\n						&lt;/td&gt;\r\n					&lt;/tr&gt;\r\n				&lt;/tbody&gt;\r\n			&lt;/table&gt;\r\n\r\n			&lt;table align=&quot;center&quot; border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; width=&quot;580&quot;&gt;\r\n				&lt;tbody&gt;\r\n					&lt;tr&gt;\r\n						&lt;td&gt;\r\n						&lt;center&gt;&lt;a href=&quot;http://e.jcrew.com/a/hBR4rUXBgTeL6B8z1uxNs7OVq8B/boysday-100?d_source=EMSL06717&amp;amp;email=welookvn@gmail.com&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;JCrew.com&quot; border=&quot;0&quot; src=&quot;http://images.jcrew.com/fsi/emails/2013/07/071413_jc_summersale_04.jpg&quot; style=&quot;display:block;width:580px;min-height:36px&quot; /&gt; &lt;/a&gt;&lt;/center&gt;\r\n						&lt;/td&gt;\r\n					&lt;/tr&gt;\r\n				&lt;/tbody&gt;\r\n			&lt;/table&gt;\r\n\r\n			&lt;table align=&quot;center&quot; border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; width=&quot;580&quot;&gt;\r\n				&lt;tbody&gt;\r\n					&lt;tr&gt;\r\n						&lt;td&gt;\r\n						&lt;center&gt;&lt;a href=&quot;http://e.jcrew.com/a/hBR4rUXBgTeL6B8z1uxNs7OVq8B/womenday-100?d_source=EMSL06717&amp;amp;email=welookvn@gmail.com&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;JCrew.com&quot; border=&quot;0&quot; src=&quot;http://images.jcrew.com/fsi/emails/2013/07/071413_jc_summersale_05.jpg&quot; style=&quot;display:block;width:580px;min-height:92px&quot; /&gt; &lt;/a&gt;&lt;/center&gt;\r\n						&lt;/td&gt;\r\n					&lt;/tr&gt;\r\n				&lt;/tbody&gt;\r\n			&lt;/table&gt;\r\n\r\n			&lt;table align=&quot;center&quot; border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; width=&quot;580&quot;&gt;\r\n				&lt;tbody&gt;\r\n					&lt;tr&gt;\r\n						&lt;td&gt;\r\n						&lt;center&gt;&lt;a href=&quot;http://e.jcrew.com/a/hBR4rUXBgTeL6B8z1uxNs7OVq8B/home-100?d_source=EMSL06717&amp;amp;email=welookvn@gmail.com&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;JCrew.com&quot; border=&quot;0&quot; height=&quot;16&quot; src=&quot;http://images.jcrew.com/fsi/emails/template/2013_narrow_template/jc_narrow_template_bottom_spacer.gif&quot; style=&quot;display:block&quot; width=&quot;580&quot; /&gt; &lt;/a&gt;&lt;/center&gt;\r\n						&lt;/td&gt;\r\n					&lt;/tr&gt;\r\n				&lt;/tbody&gt;\r\n			&lt;/table&gt;\r\n\r\n			&lt;table align=&quot;center&quot; border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; width=&quot;580&quot;&gt;\r\n				&lt;tbody&gt;\r\n					&lt;tr&gt;\r\n						&lt;td&gt;\r\n						&lt;center&gt;&lt;a href=&quot;http://e.jcrew.com/a/hBR4rUXBgTeL6B8z1uxNs7OVq8B/home-100?d_source=EMSL06717&amp;amp;email=welookvn@gmail.com&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;JCrew.com&quot; border=&quot;0&quot; height=&quot;33&quot; src=&quot;http://images.jcrew.com/fsi/emails/template/2013_narrow_template/jc_narrow_template_social_1.gif&quot; style=&quot;display:block&quot; width=&quot;114&quot; /&gt; &lt;/a&gt;&lt;/center&gt;\r\n						&lt;/td&gt;\r\n						&lt;td&gt;\r\n						&lt;center&gt;&lt;a href=&quot;http://e.jcrew.com/a/hBR4rUXBgTeL6B8z1uxNs7OVq8B/facebook-100?d_source=EMSL06717&amp;amp;email=welookvn@gmail.com&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;JCrew.com&quot; border=&quot;0&quot; height=&quot;33&quot; src=&quot;http://images.jcrew.com/fsi/emails/template/2013_narrow_template/jc_narrow_template_social_2.gif&quot; style=&quot;display:block&quot; width=&quot;45&quot; /&gt; &lt;/a&gt;&lt;/center&gt;\r\n						&lt;/td&gt;\r\n						&lt;td&gt;\r\n						&lt;center&gt;&lt;a href=&quot;http://e.jcrew.com/a/hBR4rUXBgTeL6B8z1uxNs7OVq8B/pinterest-100?d_source=EMSL06717&amp;amp;email=welookvn@gmail.com&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;JCrew.com&quot; border=&quot;0&quot; height=&quot;33&quot; src=&quot;http://images.jcrew.com/fsi/emails/template/2013_narrow_template/jc_narrow_template_social_3.gif&quot; style=&quot;display:block&quot; width=&quot;44&quot; /&gt; &lt;/a&gt;&lt;/center&gt;\r\n						&lt;/td&gt;\r\n						&lt;td&gt;\r\n						&lt;center&gt;&lt;a href=&quot;http://e.jcrew.com/a/hBR4rUXBgTeL6B8z1uxNs7OVq8B/blog-100?d_source=EMSL06717&amp;amp;email=welookvn@gmail.com&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;JCrew.com&quot; border=&quot;0&quot; height=&quot;33&quot; src=&quot;http://images.jcrew.com/fsi/emails/template/2013_narrow_template/jc_narrow_template_social_4.gif&quot; style=&quot;display:block&quot; width=&quot;41&quot; /&gt; &lt;/a&gt;&lt;/center&gt;\r\n						&lt;/td&gt;\r\n						&lt;td&gt;\r\n						&lt;center&gt;&lt;a href=&quot;http://e.jcrew.com/a/hBR4rUXBgTeL6B8z1uxNs7OVq8B/instagram-100?d_source=EMSL06717&amp;amp;email=welookvn@gmail.com&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;JCrew.com&quot; border=&quot;0&quot; height=&quot;33&quot; src=&quot;http://images.jcrew.com/fsi/emails/template/2013_narrow_template/jc_narrow_template_social_5.gif&quot; style=&quot;display:block&quot; width=&quot;46&quot; /&gt; &lt;/a&gt;&lt;/center&gt;\r\n						&lt;/td&gt;\r\n						&lt;td&gt;\r\n						&lt;center&gt;&lt;a href=&quot;http://e.jcrew.com/a/hBR4rUXBgTeL6B8z1uxNs7OVq8B/youtube-100?d_source=EMSL06717&amp;amp;email=welookvn@gmail.com&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;JCrew.com&quot; border=&quot;0&quot; height=&quot;33&quot; src=&quot;http://images.jcrew.com/fsi/emails/template/2013_narrow_template/jc_narrow_template_social_6.gif&quot; style=&quot;display:block&quot; width=&quot;42&quot; /&gt; &lt;/a&gt;&lt;/center&gt;\r\n						&lt;/td&gt;\r\n						&lt;td&gt;\r\n						&lt;center&gt;&lt;a href=&quot;http://e.jcrew.com/a/hBR4rUXBgTeL6B8z1uxNs7OVq8B/plus-100&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;JCrew.com&quot; border=&quot;0&quot; height=&quot;33&quot; src=&quot;http://images.jcrew.com/fsi/emails/template/2013_narrow_template/jc_narrow_template_social_7.gif&quot; style=&quot;display:block&quot; width=&quot;44&quot; /&gt; &lt;/a&gt;&lt;/center&gt;\r\n						&lt;/td&gt;\r\n						&lt;td&gt;\r\n						&lt;center&gt;&lt;a href=&quot;http://e.jcrew.com/a/hBR4rUXBgTeL6B8z1uxNs7OVq8B/twitter-100&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;JCrew.com&quot; border=&quot;0&quot; height=&quot;33&quot; src=&quot;http://images.jcrew.com/fsi/emails/template/2013_narrow_template/jc_narrow_template_social_8.gif&quot; style=&quot;display:block&quot; width=&quot;47&quot; /&gt; &lt;/a&gt;&lt;/center&gt;\r\n						&lt;/td&gt;\r\n						&lt;td&gt;\r\n						&lt;center&gt;&lt;a href=&quot;http://e.jcrew.com/a/hBR4rUXBgTeL6B8z1uxNs7OVq8B/fwrdfrn-100?RAF_TRACK=&amp;amp;email=welookvn@gmail.com&amp;amp;d_source=EMSL06717&amp;amp;email=welookvn@gmail.com&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;JCrew.com&quot; border=&quot;0&quot; height=&quot;33&quot; src=&quot;http://images.jcrew.com/fsi/emails/template/2013_narrow_template/jc_narrow_template_social_9.gif&quot; style=&quot;display:block&quot; width=&quot;49&quot; /&gt; &lt;/a&gt;&lt;/center&gt;\r\n						&lt;/td&gt;\r\n						&lt;td&gt;\r\n						&lt;center&gt;&lt;a href=&quot;http://e.jcrew.com/a/hBR4rUXBgTeL6B8z1uxNs7OVq8B/home-100?d_source=EMSL06717&amp;amp;email=welookvn@gmail.com&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;JCrew.com&quot; border=&quot;0&quot; height=&quot;33&quot; src=&quot;http://images.jcrew.com/fsi/emails/template/2013_narrow_template/jc_narrow_template_social_10.gif&quot; style=&quot;display:block&quot; width=&quot;108&quot; /&gt; &lt;/a&gt;&lt;/center&gt;\r\n						&lt;/td&gt;\r\n					&lt;/tr&gt;\r\n				&lt;/tbody&gt;\r\n			&lt;/table&gt;\r\n			&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n	&lt;/tbody&gt;\r\n&lt;/table&gt;\r\n\r\n&lt;table align=&quot;center&quot; border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; width=&quot;580&quot;&gt;\r\n	&lt;tbody&gt;\r\n		&lt;tr&gt;\r\n			&lt;td align=&quot;center&quot;&gt;&lt;font style=&quot;font-family:verdana,arial,helvetica,sans-serif;font-size:10px;color:#71706c&quot;&gt;*Offer valid on purchases of full-price swim styles at &lt;a href=&quot;http://jcrew.com&quot; target=&quot;_blank&quot;&gt;jcrew.com&lt;/a&gt; on July 14, 2013, 12:01am to 11:59pm ET only. Offer not valid in J.Crew stores, J.Crew Factory stores, at &lt;a href=&quot;http://jcrewfactory.com&quot; target=&quot;_blank&quot;&gt;jcrewfactory.com&lt;/a&gt; or on phone orders. Offer cannot be applied to previous purchases or the purchase of gift cards and cannot be redeemed for cash or used in combination with any other offer. Offer not valid on third-party branded merchandise. To redeem, enter code SUNDAY in the promo code box at checkout. Limit one promo code per order. Offer valid in the U.S. and Canada only. Terms of offer are subject to change.&lt;br /&gt;\r\n			&lt;br /&gt;\r\n			Please add &lt;a href=&quot;mailto:jcrew@e.jcrew.com&quot; style=&quot;text-decoration:none&quot; target=&quot;_blank&quot;&gt;&lt;font color=&quot;#71706C&quot;&gt;jcrew@e.jcrew.com&lt;/font&gt;&lt;/a&gt; to your address book to ensure our emails reach your inbox.&lt;br /&gt;\r\n			If you received this email from a friend and would like to subscribe to our email list, &lt;a href=&quot;http://e.jcrew.com/a/hBR4rUXBgTeL6B8z1uxNs7OVq8B/sub-100?d_source=EMSL06717&quot; style=&quot;text-decoration:underline&quot; target=&quot;_blank&quot;&gt; &lt;font color=&quot;#71706C&quot;&gt;click here&lt;/font&gt;&lt;/a&gt;.&lt;br /&gt;\r\n			&lt;br /&gt;\r\n			If you wish to unsubscribe from all future emails, please &lt;a href=&quot;http://e.jcrew.com/a/hBR4rUXBgTeL6B8z1uxNs7OVq8B/unsub-100?password=BgTeL6Ns7OVqBR4rUXM3QUZOU3y84s&amp;amp;email=welookvn@gmail.com&quot; style=&quot;text-decoration:underline&quot; target=&quot;_blank&quot;&gt; &lt;font color=&quot;#71706C&quot;&gt;click here&lt;/font&gt;&lt;/a&gt; or go to the following web address - &lt;a href=&quot;http://reg.cheetahmail.com/regp?aid=1615717114&amp;amp;n=101&amp;amp;idc=BgTeL6Ns7OVqBR4rUXM3QUZOU3y84s&amp;amp;a=1&amp;amp;t=BR4rUXBgTeL6B8z1uxNs7OVq8B&amp;amp;email=welookvn@gmail.com&quot; target=&quot;_blank&quot;&gt;http://reg.cheetahmail.com/&lt;wbr /&gt;regp?aid=1615717114&amp;amp;n=101&amp;amp;idc=&lt;wbr /&gt;BgTeL6Ns7OVqBR4rUXM3QUZOU3y84s&lt;wbr /&gt;&amp;amp;a=1&amp;amp;t=&lt;wbr /&gt;BR4rUXBgTeL6B8z1uxNs7OVq8B&amp;amp;&lt;wbr /&gt;email=welookvn@gmail.com&lt;/a&gt;.&lt;br /&gt;\r\n			This email may be considered an advertising or promotional message.&lt;br /&gt;\r\n			&lt;br /&gt;\r\n			J.Crew Customer Relations | One Ivy Crescent | Lynchburg, VA 24513-1001 &lt;/font&gt;&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n	&lt;/tbody&gt;\r\n&lt;/table&gt;\r\n\r\n&lt;div&gt;&amp;nbsp;&lt;/div&gt;\r\n&lt;img border=&quot;0&quot; height=&quot;1&quot; src=&quot;https://owfhij7q.emltrk.com/owfhij7q?d=welookvn@gmail.com&quot; width=&quot;1&quot; /&gt; &lt;img src=&quot;http://e.jcrew.com/a/hBR4rUXBgTeL6B8z1uxNs7OVq8B/spacer-100.gif&quot; /&gt;\r\n&lt;div class=&quot;yj6qo&quot;&gt;&amp;nbsp;&lt;/div&gt;\r\n\r\n&lt;div class=&quot;adL&quot;&gt;&amp;nbsp;&lt;/div&gt;\r\n&lt;/div&gt;\r\n', '', '');
INSERT INTO `news_description` (`news_id`, `language_id`, `name`, `short_description`, `description`, `meta_description`, `meta_keyword`) VALUES
(27, 2, 'BURTON LONDON MENSWEAR - Sale off đến 50% !!', '', '&lt;table align=&quot;center&quot; bgcolor=&quot;#ffffff&quot; border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; width=&quot;700&quot;&gt;\r\n	&lt;tbody&gt;\r\n		&lt;tr&gt;\r\n			&lt;td&gt;\r\n			&lt;table align=&quot;center&quot; bgcolor=&quot;#ffffff&quot; border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; width=&quot;700&quot;&gt;\r\n				&lt;tbody&gt;\r\n					&lt;tr&gt;\r\n						&lt;td align=&quot;center&quot; style=&quot;background:#ffffff&quot;&gt;\r\n						&lt;p&gt;&lt;span style=&quot;color:#666666&quot;&gt;&lt;span style=&quot;font-size:small&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;Free delivery + 1 day only formalwear reductions! If you are having trouble viewing this email, &lt;a href=&quot;http://burton.chtah.com/a/hBR4ou7B4Yc6cB8z3ifNsjSkk8E/br2?email=welookvn@gmail.com&amp;amp;fname=&amp;amp;password=B4Yc6cNsjSkkBR4ou7vL8o6mV4d3LO&quot; style=&quot;color:#666666&quot; target=&quot;_blank&quot;&gt;&lt;span style=&quot;text-decoration:underline&quot;&gt;please follow this link&lt;/span&gt;&lt;/a&gt;. &lt;a href=&quot;http://burton.chtah.com/a/hBR4ou7B4Yc6cB8z3ifNsjSkk8E/br1?email=welookvn@gmail.com&amp;amp;fname=&amp;amp;password=B4Yc6cNsjSkkBR4ou7vL8o6mV4d3LO&quot; style=&quot;color:#666666&quot; target=&quot;_blank&quot; title=&quot;View on a mobile&quot;&gt;View on a mobile&lt;/a&gt;.&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n						&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n						&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n						&lt;/td&gt;\r\n					&lt;/tr&gt;\r\n				&lt;/tbody&gt;\r\n			&lt;/table&gt;\r\n			&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td&gt;\r\n			&lt;table align=&quot;center&quot; bgcolor=&quot;#ffffff&quot; border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; width=&quot;700&quot;&gt;\r\n				&lt;tbody&gt;\r\n					&lt;tr&gt;\r\n						&lt;td align=&quot;center&quot; height=&quot;34&quot; width=&quot;674&quot;&gt;&lt;a href=&quot;http://burton.chtah.com/a/hBR4ou7B4Yc6cB8z3ifNsjSkk8E/br32&quot; style=&quot;display:block&quot; target=&quot;_blank&quot; title=&quot;Facebook&quot;&gt;&lt;img alt=&quot;Facebook&quot; border=&quot;0&quot; height=&quot;34&quot; src=&quot;http://media.burton.co.uk/wcsstore/ConsumerDirectStorefrontAssetStore/images/colors/color2/cms/pages/email/email-0000039062/images/2013-email-temp_02_headerfacebook1.jpg&quot; style=&quot;display:block&quot; width=&quot;674&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n						&lt;td align=&quot;center&quot; height=&quot;34&quot; width=&quot;26&quot;&gt;&lt;a href=&quot;http://burton.chtah.com/a/hBR4ou7B4Yc6cB8z3ifNsjSkk8E/br38&quot; style=&quot;display:block&quot; target=&quot;_blank&quot; title=&quot;Twitter&quot;&gt;&lt;img alt=&quot;Twitter&quot; border=&quot;0&quot; height=&quot;34&quot; src=&quot;http://media.burton.co.uk/wcsstore/ConsumerDirectStorefrontAssetStore/images/colors/color2/cms/pages/email/email-0000039062/images/2013-email-temp_03_headertwitter1.jpg&quot; style=&quot;display:block&quot; width=&quot;26&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n					&lt;/tr&gt;\r\n				&lt;/tbody&gt;\r\n			&lt;/table&gt;\r\n			&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td&gt;\r\n			&lt;table align=&quot;center&quot; bgcolor=&quot;#ffffff&quot; border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; width=&quot;700&quot;&gt;\r\n				&lt;tbody&gt;\r\n					&lt;tr&gt;\r\n						&lt;td align=&quot;center&quot; height=&quot;72&quot; width=&quot;192&quot;&gt;&lt;a href=&quot;http://burton.chtah.com/a/hBR4ou7B4Yc6cB8z3ifNsjSkk8E/br30&quot; style=&quot;display:block&quot; target=&quot;_blank&quot; title=&quot;Burton&quot;&gt;&lt;img alt=&quot;Burton&quot; border=&quot;0&quot; height=&quot;72&quot; src=&quot;http://media.burton.co.uk/wcsstore/ConsumerDirectStorefrontAssetStore/images/colors/color2/cms/pages/email/email-0000039062/images/2013-email-temp_04_logo1.jpg&quot; style=&quot;display:block&quot; width=&quot;192&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n						&lt;td align=&quot;center&quot; height=&quot;72&quot; width=&quot;71&quot;&gt;&lt;a href=&quot;http://burton.chtah.com/a/hBR4ou7B4Yc6cB8z3ifNsjSkk8E/br22&quot; style=&quot;display:block&quot; target=&quot;_blank&quot; title=&quot;New In&quot;&gt;&lt;img alt=&quot;New In&quot; border=&quot;0&quot; height=&quot;72&quot; src=&quot;http://media.burton.co.uk/wcsstore/ConsumerDirectStorefrontAssetStore/images/colors/color2/cms/pages/email/email-0000039062/images/2013-email-temp_05_new1.jpg&quot; style=&quot;display:block&quot; width=&quot;71&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n						&lt;td align=&quot;center&quot; height=&quot;72&quot; width=&quot;76&quot;&gt;&lt;a href=&quot;http://burton.chtah.com/a/hBR4ou7B4Yc6cB8z3ifNsjSkk8E/br24&quot; style=&quot;display:block&quot; target=&quot;_blank&quot; title=&quot;Clothing&quot;&gt;&lt;img alt=&quot;Clothing&quot; border=&quot;0&quot; height=&quot;72&quot; src=&quot;http://media.burton.co.uk/wcsstore/ConsumerDirectStorefrontAssetStore/images/colors/color2/cms/pages/email/email-0000039062/images/2013-email-temp_06_clothing1.jpg&quot; style=&quot;display:block&quot; width=&quot;76&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n						&lt;td align=&quot;center&quot; height=&quot;72&quot; width=&quot;60&quot;&gt;&lt;a href=&quot;http://burton.chtah.com/a/hBR4ou7B4Yc6cB8z3ifNsjSkk8E/br26&quot; style=&quot;display:block&quot; target=&quot;_blank&quot; title=&quot;Suits&quot;&gt;&lt;img alt=&quot;Suits&quot; border=&quot;0&quot; height=&quot;72&quot; src=&quot;http://media.burton.co.uk/wcsstore/ConsumerDirectStorefrontAssetStore/images/colors/color2/cms/pages/email/email-0000039062/images/2013-email-temp_07_suits1.jpg&quot; style=&quot;display:block&quot; width=&quot;60&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n						&lt;td align=&quot;center&quot; height=&quot;72&quot; width=&quot;65&quot;&gt;&lt;a href=&quot;http://burton.chtah.com/a/hBR4ou7B4Yc6cB8z3ifNsjSkk8E/br23&quot; style=&quot;display:block&quot; target=&quot;_blank&quot; title=&quot;Shoes&quot;&gt;&lt;img alt=&quot;Shoes&quot; border=&quot;0&quot; height=&quot;72&quot; src=&quot;http://media.burton.co.uk/wcsstore/ConsumerDirectStorefrontAssetStore/images/colors/color2/cms/pages/email/email-0000039062/images/2013-email-temp_10_shoes1.jpg&quot; style=&quot;display:block&quot; width=&quot;65&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n						&lt;td align=&quot;center&quot; height=&quot;72&quot; width=&quot;84&quot;&gt;&lt;a href=&quot;http://burton.chtah.com/a/hBR4ou7B4Yc6cB8z3ifNsjSkk8E/br27&quot; style=&quot;display:block&quot; target=&quot;_blank&quot; title=&quot;Offers&quot;&gt;&lt;img alt=&quot;Offers&quot; border=&quot;0&quot; height=&quot;72&quot; src=&quot;http://media.burton.co.uk/wcsstore/ConsumerDirectStorefrontAssetStore/images/colors/color2/cms/pages/email/email-0000039062/images/2013-email-temp_11_offers1.jpg&quot; style=&quot;display:block&quot; width=&quot;84&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n						&lt;td align=&quot;center&quot; height=&quot;72&quot; width=&quot;152&quot;&gt;&lt;a href=&quot;http://burton.chtah.com/a/hBR4ou7B4Yc6cB8z3ifNsjSkk8E/br25&quot; style=&quot;display:block&quot; target=&quot;_blank&quot; title=&quot;Style Updates&quot;&gt;&lt;img alt=&quot;Style Updates&quot; border=&quot;0&quot; height=&quot;72&quot; src=&quot;http://media.burton.co.uk/wcsstore/ConsumerDirectStorefrontAssetStore/images/colors/color2/cms/pages/email/email-0000039062/images/2013-email-temp_12_styleupdates1.jpg&quot; style=&quot;display:block&quot; width=&quot;152&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n					&lt;/tr&gt;\r\n				&lt;/tbody&gt;\r\n			&lt;/table&gt;\r\n			&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td&gt;\r\n			&lt;table align=&quot;center&quot; bgcolor=&quot;#ffffff&quot; border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; width=&quot;700&quot;&gt;\r\n				&lt;tbody&gt;\r\n					&lt;tr&gt;\r\n						&lt;td align=&quot;center&quot; height=&quot;215&quot; width=&quot;700&quot;&gt;&lt;a href=&quot;http://burton.chtah.com/a/hBR4ou7B4Yc6cB8z3ifNsjSkk8E/br29&quot; style=&quot;display:block&quot; target=&quot;_blank&quot; title=&quot;Free Delivery&quot;&gt;&lt;img alt=&quot;Free Delivery&quot; border=&quot;0&quot; height=&quot;215&quot; src=&quot;http://media.burton.co.uk/wcsstore/ConsumerDirectStorefrontAssetStore/images/colors/color2/cms/pages/email/email-0000039062/images/UK_wk43_sun_1.jpg&quot; style=&quot;display:block&quot; width=&quot;700&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n					&lt;/tr&gt;\r\n				&lt;/tbody&gt;\r\n			&lt;/table&gt;\r\n			&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td&gt;\r\n			&lt;table align=&quot;center&quot; bgcolor=&quot;#ffffff&quot; border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; width=&quot;700&quot;&gt;\r\n				&lt;tbody&gt;\r\n					&lt;tr&gt;\r\n						&lt;td align=&quot;center&quot; height=&quot;241&quot; width=&quot;700&quot;&gt;&lt;a href=&quot;http://burton.chtah.com/a/hBR4ou7B4Yc6cB8z3ifNsjSkk8E/br10&quot; style=&quot;display:block&quot; target=&quot;_blank&quot; title=&quot;Fresh Prints&quot;&gt;&lt;img alt=&quot;Fresh Prints&quot; border=&quot;0&quot; height=&quot;241&quot; src=&quot;http://media.burton.co.uk/wcsstore/ConsumerDirectStorefrontAssetStore/images/colors/color2/cms/pages/email/email-0000039062/images/UK_wk43_sun_2.jpg&quot; style=&quot;display:block&quot; width=&quot;700&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n					&lt;/tr&gt;\r\n				&lt;/tbody&gt;\r\n			&lt;/table&gt;\r\n			&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td&gt;\r\n			&lt;table align=&quot;center&quot; bgcolor=&quot;#ffffff&quot; border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; width=&quot;700&quot;&gt;\r\n				&lt;tbody&gt;\r\n					&lt;tr&gt;\r\n						&lt;td align=&quot;center&quot; height=&quot;228&quot; width=&quot;475&quot;&gt;&lt;a href=&quot;http://burton.chtah.com/a/hBR4ou7B4Yc6cB8z3ifNsjSkk8E/br10&quot; style=&quot;display:block&quot; target=&quot;_blank&quot; title=&quot;Sunday Style Edit&quot;&gt;&lt;img alt=&quot;Sunday Style Edit&quot; border=&quot;0&quot; height=&quot;228&quot; src=&quot;http://media.burton.co.uk/wcsstore/ConsumerDirectStorefrontAssetStore/images/colors/color2/cms/pages/email/email-0000039062/images/UK_wk43_sun_5.jpg&quot; style=&quot;display:block&quot; width=&quot;475&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n						&lt;td align=&quot;center&quot; height=&quot;228&quot; width=&quot;225&quot;&gt;&lt;a href=&quot;http://burton.chtah.com/a/hBR4ou7B4Yc6cB8z3ifNsjSkk8E/br10&quot; style=&quot;display:block&quot; target=&quot;_blank&quot; title=&quot;Fresh Prints&quot;&gt;&lt;img alt=&quot;Fresh Prints&quot; border=&quot;0&quot; height=&quot;228&quot; src=&quot;http://media.burton.co.uk/wcsstore/ConsumerDirectStorefrontAssetStore/images/colors/color2/cms/pages/email/email-0000039062/images/UK_wk43_sun_7.jpg&quot; style=&quot;display:block&quot; width=&quot;225&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n					&lt;/tr&gt;\r\n				&lt;/tbody&gt;\r\n			&lt;/table&gt;\r\n			&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td&gt;\r\n			&lt;table align=&quot;center&quot; bgcolor=&quot;#ffffff&quot; border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; width=&quot;700&quot;&gt;\r\n				&lt;tbody&gt;\r\n					&lt;tr&gt;\r\n						&lt;td align=&quot;center&quot; height=&quot;155&quot; width=&quot;247&quot;&gt;&lt;a href=&quot;http://burton.chtah.com/a/hBR4ou7B4Yc6cB8z3ifNsjSkk8E/br20&quot; style=&quot;display:block&quot; target=&quot;_blank&quot; title=&quot;Yellow Print Shirt&quot;&gt;&lt;img alt=&quot;Yellow Print Shirt&quot; border=&quot;0&quot; height=&quot;155&quot; src=&quot;http://media.burton.co.uk/wcsstore/ConsumerDirectStorefrontAssetStore/images/colors/color2/cms/pages/email/email-0000039062/images/UK_wk43_sun_8.jpg&quot; style=&quot;display:block&quot; width=&quot;247&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n						&lt;td align=&quot;center&quot; height=&quot;155&quot; width=&quot;453&quot;&gt;&lt;a href=&quot;http://burton.chtah.com/a/hBR4ou7B4Yc6cB8z3ifNsjSkk8E/br11&quot; style=&quot;display:block&quot; target=&quot;_blank&quot; title=&quot;Denim Shorts&quot;&gt;&lt;img alt=&quot;Denim Shorts&quot; border=&quot;0&quot; height=&quot;155&quot; src=&quot;http://media.burton.co.uk/wcsstore/ConsumerDirectStorefrontAssetStore/images/colors/color2/cms/pages/email/email-0000039062/images/UK_wk43_sun_10.jpg&quot; style=&quot;display:block&quot; width=&quot;453&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n					&lt;/tr&gt;\r\n				&lt;/tbody&gt;\r\n			&lt;/table&gt;\r\n			&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td&gt;\r\n			&lt;table align=&quot;center&quot; bgcolor=&quot;#ffffff&quot; border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; width=&quot;700&quot;&gt;\r\n				&lt;tbody&gt;\r\n					&lt;tr&gt;\r\n						&lt;td align=&quot;center&quot; height=&quot;388&quot; width=&quot;235&quot;&gt;&lt;a href=&quot;http://burton.chtah.com/a/hBR4ou7B4Yc6cB8z3ifNsjSkk8E/br20&quot; style=&quot;display:block&quot; target=&quot;_blank&quot; title=&quot;Yellow Print Shirt&quot;&gt;&lt;img alt=&quot;Yellow Print Shirt&quot; border=&quot;0&quot; height=&quot;388&quot; src=&quot;http://media.burton.co.uk/wcsstore/ConsumerDirectStorefrontAssetStore/images/colors/color2/cms/pages/email/email-0000039062/images/RME_UK_wk47_sun_10.jpg&quot; style=&quot;display:block&quot; width=&quot;235&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n						&lt;td align=&quot;center&quot; height=&quot;388&quot; width=&quot;211&quot;&gt;&lt;a href=&quot;http://burton.chtah.com/a/hBR4ou7B4Yc6cB8z3ifNsjSkk8E/br28&quot; style=&quot;display:block&quot; target=&quot;_blank&quot; title=&quot;Fresh Prints &amp;gt; Shop Now&quot;&gt;&lt;img alt=&quot;Fresh Prints &amp;gt; Shop Now&quot; border=&quot;0&quot; height=&quot;388&quot; src=&quot;http://media.burton.co.uk/wcsstore/ConsumerDirectStorefrontAssetStore/images/colors/color2/cms/pages/email/email-0000039062/images/RME_UK_wk47_sun_11.jpg&quot; style=&quot;display:block&quot; width=&quot;211&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n						&lt;td align=&quot;center&quot; height=&quot;388&quot; width=&quot;254&quot;&gt;&lt;a href=&quot;http://burton.chtah.com/a/hBR4ou7B4Yc6cB8z3ifNsjSkk8E/br13&quot; style=&quot;display:block&quot; target=&quot;_blank&quot; title=&quot;Navy Plimpsols&quot;&gt;&lt;img alt=&quot;Navy Plimpsols&quot; border=&quot;0&quot; height=&quot;388&quot; src=&quot;http://media.burton.co.uk/wcsstore/ConsumerDirectStorefrontAssetStore/images/colors/color2/cms/pages/email/email-0000039062/images/RME_UK_wk47_sun_12.jpg&quot; style=&quot;display:block&quot; width=&quot;254&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n					&lt;/tr&gt;\r\n				&lt;/tbody&gt;\r\n			&lt;/table&gt;\r\n			&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td&gt;\r\n			&lt;table align=&quot;center&quot; bgcolor=&quot;#ffffff&quot; border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; width=&quot;700&quot;&gt;\r\n				&lt;tbody&gt;\r\n					&lt;tr&gt;\r\n						&lt;td align=&quot;center&quot; height=&quot;319&quot; width=&quot;348&quot;&gt;&lt;a href=&quot;http://burton.chtah.com/a/hBR4ou7B4Yc6cB8z3ifNsjSkk8E/br16&quot; style=&quot;display:block&quot; target=&quot;_blank&quot; title=&quot;Navy Chinos&quot;&gt;&lt;img alt=&quot;Navy Chinos&quot; border=&quot;0&quot; height=&quot;319&quot; src=&quot;http://media.burton.co.uk/wcsstore/ConsumerDirectStorefrontAssetStore/images/colors/color2/cms/pages/email/email-0000039062/images/UK_wk43_sun_11.jpg&quot; style=&quot;display:block&quot; width=&quot;348&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n						&lt;td align=&quot;center&quot; height=&quot;319&quot; width=&quot;352&quot;&gt;&lt;a href=&quot;http://burton.chtah.com/a/hBR4ou7B4Yc6cB8z3ifNsjSkk8E/br17&quot; style=&quot;display:block&quot; target=&quot;_blank&quot; title=&quot;The Cray T-Shirt&quot;&gt;&lt;img alt=&quot;The Cray T-Shirt&quot; border=&quot;0&quot; height=&quot;319&quot; src=&quot;http://media.burton.co.uk/wcsstore/ConsumerDirectStorefrontAssetStore/images/colors/color2/cms/pages/email/email-0000039062/images/RME_UK_wk47_sun_14.jpg&quot; style=&quot;display:block&quot; width=&quot;352&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n					&lt;/tr&gt;\r\n				&lt;/tbody&gt;\r\n			&lt;/table&gt;\r\n			&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td&gt;\r\n			&lt;table align=&quot;center&quot; bgcolor=&quot;#ffffff&quot; border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; width=&quot;700&quot;&gt;\r\n				&lt;tbody&gt;\r\n					&lt;tr&gt;\r\n						&lt;td align=&quot;center&quot; height=&quot;175&quot; width=&quot;700&quot;&gt;&lt;a href=&quot;http://burton.chtah.com/a/hBR4ou7B4Yc6cB8z3ifNsjSkk8E/br28&quot; style=&quot;display:block&quot; target=&quot;_blank&quot; title=&quot;Print Shop &amp;gt; Shop Now&quot;&gt;&lt;img alt=&quot;Print Shop &amp;gt; Shop Now&quot; border=&quot;0&quot; height=&quot;175&quot; src=&quot;http://media.burton.co.uk/wcsstore/ConsumerDirectStorefrontAssetStore/images/colors/color2/cms/pages/email/email-0000039062/images/UK_wk43_sun_12.jpg&quot; style=&quot;display:block&quot; width=&quot;700&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n					&lt;/tr&gt;\r\n				&lt;/tbody&gt;\r\n			&lt;/table&gt;\r\n			&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td&gt;\r\n			&lt;table align=&quot;center&quot; bgcolor=&quot;#ffffff&quot; border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; width=&quot;700&quot;&gt;\r\n				&lt;tbody&gt;\r\n					&lt;tr&gt;\r\n						&lt;td align=&quot;center&quot; height=&quot;131&quot; width=&quot;700&quot;&gt;&lt;a href=&quot;http://burton.chtah.com/a/hBR4ou7B4Yc6cB8z3ifNsjSkk8E/br19&quot; style=&quot;display:block&quot; target=&quot;_blank&quot; title=&quot;White Plimpsols&quot;&gt;&lt;img alt=&quot;White Plimpsols&quot; border=&quot;0&quot; height=&quot;131&quot; src=&quot;http://media.burton.co.uk/wcsstore/ConsumerDirectStorefrontAssetStore/images/colors/color2/cms/pages/email/email-0000039062/images/UK_wk43_sun_14.jpg&quot; style=&quot;display:block&quot; width=&quot;700&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n					&lt;/tr&gt;\r\n				&lt;/tbody&gt;\r\n			&lt;/table&gt;\r\n			&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td&gt;\r\n			&lt;table align=&quot;center&quot; bgcolor=&quot;#ffffff&quot; border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; width=&quot;700&quot;&gt;\r\n				&lt;tbody&gt;\r\n					&lt;tr&gt;\r\n						&lt;td align=&quot;center&quot; height=&quot;238&quot; width=&quot;350&quot;&gt;&lt;a href=&quot;http://burton.chtah.com/a/hBR4ou7B4Yc6cB8z3ifNsjSkk8E/br18&quot; style=&quot;display:block&quot; target=&quot;_blank&quot; title=&quot;White T-Shirt&quot;&gt;&lt;img alt=&quot;White T-Shirt&quot; border=&quot;0&quot; height=&quot;238&quot; src=&quot;http://media.burton.co.uk/wcsstore/ConsumerDirectStorefrontAssetStore/images/colors/color2/cms/pages/email/email-0000039062/images/UK_wk43_sun_15_01.jpg&quot; style=&quot;display:block&quot; width=&quot;350&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n						&lt;td align=&quot;center&quot; height=&quot;238&quot; width=&quot;350&quot;&gt;&lt;a href=&quot;http://burton.chtah.com/a/hBR4ou7B4Yc6cB8z3ifNsjSkk8E/br12&quot; style=&quot;display:block&quot; target=&quot;_blank&quot; title=&quot;Printed Shorts&quot;&gt;&lt;img alt=&quot;Printed Shorts&quot; border=&quot;0&quot; height=&quot;238&quot; src=&quot;http://media.burton.co.uk/wcsstore/ConsumerDirectStorefrontAssetStore/images/colors/color2/cms/pages/email/email-0000039062/images/UK_wk43_sun_15_02.jpg&quot; style=&quot;display:block&quot; width=&quot;350&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n					&lt;/tr&gt;\r\n				&lt;/tbody&gt;\r\n			&lt;/table&gt;\r\n			&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td&gt;\r\n			&lt;table align=&quot;center&quot; bgcolor=&quot;#ffffff&quot; border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; width=&quot;700&quot;&gt;\r\n				&lt;tbody&gt;\r\n					&lt;tr&gt;\r\n						&lt;td align=&quot;center&quot; height=&quot;195&quot; width=&quot;233&quot;&gt;&lt;a href=&quot;http://burton.chtah.com/a/hBR4ou7B4Yc6cB8z3ifNsjSkk8E/br18&quot; style=&quot;display:block&quot; target=&quot;_blank&quot; title=&quot;White T-Shirt&quot;&gt;&lt;img alt=&quot;White T-Shirt&quot; border=&quot;0&quot; height=&quot;195&quot; src=&quot;http://media.burton.co.uk/wcsstore/ConsumerDirectStorefrontAssetStore/images/colors/color2/cms/pages/email/email-0000039062/images/UK_wk43_sun_16_01.jpg&quot; style=&quot;display:block&quot; width=&quot;233&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n						&lt;td align=&quot;center&quot; height=&quot;195&quot; width=&quot;262&quot;&gt;&lt;a href=&quot;http://burton.chtah.com/a/hBR4ou7B4Yc6cB8z3ifNsjSkk8E/br28&quot; style=&quot;display:block&quot; target=&quot;_blank&quot; title=&quot;Print Shop&quot;&gt;&lt;img alt=&quot;Print Shop&quot; border=&quot;0&quot; height=&quot;195&quot; src=&quot;http://media.burton.co.uk/wcsstore/ConsumerDirectStorefrontAssetStore/images/colors/color2/cms/pages/email/email-0000039062/images/UK_wk43_sun_16_02.jpg&quot; style=&quot;display:block&quot; width=&quot;262&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n						&lt;td align=&quot;center&quot; height=&quot;195&quot; width=&quot;205&quot;&gt;&lt;a href=&quot;http://burton.chtah.com/a/hBR4ou7B4Yc6cB8z3ifNsjSkk8E/br12&quot; style=&quot;display:block&quot; target=&quot;_blank&quot; title=&quot;Shorts&quot;&gt;&lt;img alt=&quot;Shorts&quot; border=&quot;0&quot; height=&quot;195&quot; src=&quot;http://media.burton.co.uk/wcsstore/ConsumerDirectStorefrontAssetStore/images/colors/color2/cms/pages/email/email-0000039062/images/UK_wk43_sun_16_03.jpg&quot; style=&quot;display:block&quot; width=&quot;205&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n					&lt;/tr&gt;\r\n				&lt;/tbody&gt;\r\n			&lt;/table&gt;\r\n			&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td&gt;\r\n			&lt;table align=&quot;center&quot; bgcolor=&quot;#ffffff&quot; border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; width=&quot;700&quot;&gt;\r\n				&lt;tbody&gt;\r\n					&lt;tr&gt;\r\n						&lt;td align=&quot;center&quot; height=&quot;186&quot; width=&quot;700&quot;&gt;&lt;a href=&quot;http://burton.chtah.com/a/hBR4ou7B4Yc6cB8z3ifNsjSkk8E/br15&quot; style=&quot;display:block&quot; target=&quot;_blank&quot; title=&quot;Holdal&quot;&gt;&lt;img alt=&quot;Holdal&quot; border=&quot;0&quot; height=&quot;186&quot; src=&quot;http://media.burton.co.uk/wcsstore/ConsumerDirectStorefrontAssetStore/images/colors/color2/cms/pages/email/email-0000039062/images/RME_UK_wk47_sun_22.jpg&quot; style=&quot;display:block&quot; width=&quot;700&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n					&lt;/tr&gt;\r\n				&lt;/tbody&gt;\r\n			&lt;/table&gt;\r\n			&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td&gt;\r\n			&lt;table align=&quot;center&quot; bgcolor=&quot;#ffffff&quot; border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; width=&quot;700&quot;&gt;\r\n				&lt;tbody&gt;\r\n					&lt;tr&gt;\r\n						&lt;td align=&quot;center&quot; height=&quot;227&quot; width=&quot;700&quot;&gt;&lt;a href=&quot;http://burton.chtah.com/a/hBR4ou7B4Yc6cB8z3ifNsjSkk8E/br7&quot; style=&quot;display:block&quot; target=&quot;_blank&quot; title=&quot;The Knowlage Blog&quot;&gt;&lt;img alt=&quot;The Knowlage Blog&quot; border=&quot;0&quot; height=&quot;227&quot; src=&quot;http://media.burton.co.uk/wcsstore/ConsumerDirectStorefrontAssetStore/images/colors/color2/cms/pages/email/email-0000039062/images/RME_UK_wk47_sun_23-new.jpg&quot; style=&quot;display:block&quot; width=&quot;700&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n					&lt;/tr&gt;\r\n				&lt;/tbody&gt;\r\n			&lt;/table&gt;\r\n			&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td&gt;\r\n			&lt;table align=&quot;center&quot; bgcolor=&quot;#ffffff&quot; border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; width=&quot;700&quot;&gt;\r\n				&lt;tbody&gt;\r\n					&lt;tr&gt;\r\n						&lt;td align=&quot;center&quot; height=&quot;207&quot; width=&quot;700&quot;&gt;&lt;a href=&quot;http://burton.chtah.com/a/hBR4ou7B4Yc6cB8z3ifNsjSkk8E/br34&quot; style=&quot;display:block&quot; target=&quot;_blank&quot; title=&quot;Parker Competition&quot;&gt;&lt;img alt=&quot;Parker Competition&quot; border=&quot;0&quot; height=&quot;207&quot; src=&quot;http://media.burton.co.uk/wcsstore/ConsumerDirectStorefrontAssetStore/images/colors/color2/cms/pages/email/email-0000039062/images/RME_UK_wk47_sun_24-new.jpg&quot; style=&quot;display:block&quot; width=&quot;700&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n					&lt;/tr&gt;\r\n				&lt;/tbody&gt;\r\n			&lt;/table&gt;\r\n			&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td&gt;\r\n			&lt;table align=&quot;center&quot; bgcolor=&quot;#ffffff&quot; border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; width=&quot;700&quot;&gt;\r\n				&lt;tbody&gt;\r\n					&lt;tr&gt;\r\n						&lt;td align=&quot;center&quot; height=&quot;48&quot; width=&quot;271&quot;&gt;&lt;a href=&quot;http://burton.chtah.com/a/hBR4ou7B4Yc6cB8z3ifNsjSkk8E/br31&quot; style=&quot;display:block&quot; target=&quot;_blank&quot; title=&quot;Facebook&quot;&gt;&lt;img alt=&quot;Facebook&quot; border=&quot;0&quot; height=&quot;48&quot; src=&quot;http://media.burton.co.uk/wcsstore/ConsumerDirectStorefrontAssetStore/images/colors/color2/cms/pages/email/email-0000039062/images/2013-email-temp_15_facebook1.jpg&quot; style=&quot;display:block&quot; width=&quot;271&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n						&lt;td align=&quot;center&quot; height=&quot;48&quot; width=&quot;33&quot;&gt;&lt;a href=&quot;http://burton.chtah.com/a/hBR4ou7B4Yc6cB8z3ifNsjSkk8E/br37&quot; style=&quot;display:block&quot; target=&quot;_blank&quot; title=&quot;Twitter &quot;&gt;&lt;img alt=&quot;Twitter &quot; border=&quot;0&quot; height=&quot;48&quot; src=&quot;http://media.burton.co.uk/wcsstore/ConsumerDirectStorefrontAssetStore/images/colors/color2/cms/pages/email/email-0000039062/images/2013-email-temp_16_twitter1.jpg&quot; style=&quot;display:block&quot; width=&quot;33&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n						&lt;td align=&quot;center&quot; height=&quot;48&quot; width=&quot;30&quot;&gt;&lt;a href=&quot;http://burton.chtah.com/a/hBR4ou7B4Yc6cB8z3ifNsjSkk8E/br8&quot; style=&quot;display:block&quot; target=&quot;_blank&quot; title=&quot;The Knowledge Blog&quot;&gt;&lt;img alt=&quot;The Knowledge Blog&quot; border=&quot;0&quot; height=&quot;48&quot; src=&quot;http://media.burton.co.uk/wcsstore/ConsumerDirectStorefrontAssetStore/images/colors/color2/cms/pages/email/email-0000039062/images/2013-email-temp_17_blog1.jpg&quot; style=&quot;display:block&quot; width=&quot;30&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n						&lt;td align=&quot;center&quot; height=&quot;48&quot; width=&quot;26&quot;&gt;&lt;a href=&quot;http://burton.chtah.com/a/hBR4ou7B4Yc6cB8z3ifNsjSkk8E/br36&quot; style=&quot;display:block&quot; target=&quot;_blank&quot; title=&quot;Google Plus&quot;&gt;&lt;img alt=&quot;Google Plus&quot; border=&quot;0&quot; height=&quot;48&quot; src=&quot;http://media.burton.co.uk/wcsstore/ConsumerDirectStorefrontAssetStore/images/colors/color2/cms/pages/email/email-0000039062/images/2013-email-temp_18_googleplus1.jpg&quot; style=&quot;display:block&quot; width=&quot;26&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n						&lt;td align=&quot;center&quot; height=&quot;48&quot; width=&quot;27&quot;&gt;&lt;a href=&quot;http://burton.chtah.com/a/hBR4ou7B4Yc6cB8z3ifNsjSkk8E/br4&quot; style=&quot;display:block&quot; target=&quot;_blank&quot; title=&quot;Pintrest&quot;&gt;&lt;img alt=&quot;Pintrest&quot; border=&quot;0&quot; height=&quot;48&quot; src=&quot;http://media.burton.co.uk/wcsstore/ConsumerDirectStorefrontAssetStore/images/colors/color2/cms/pages/email/email-0000039062/images/2013-email-temp_19_pinterest1.jpg&quot; style=&quot;display:block&quot; width=&quot;27&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n						&lt;td align=&quot;center&quot; height=&quot;48&quot; width=&quot;27&quot;&gt;&lt;a href=&quot;http://burton.chtah.com/a/hBR4ou7B4Yc6cB8z3ifNsjSkk8E/br33&quot; style=&quot;display:block&quot; target=&quot;_blank&quot; title=&quot;You Tube&quot;&gt;&lt;img alt=&quot;You Tube&quot; border=&quot;0&quot; height=&quot;48&quot; src=&quot;http://media.burton.co.uk/wcsstore/ConsumerDirectStorefrontAssetStore/images/colors/color2/cms/pages/email/email-0000039062/images/2013-email-temp_20_youtube1.jpg&quot; style=&quot;display:block&quot; width=&quot;27&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n						&lt;td align=&quot;center&quot; height=&quot;48&quot; width=&quot;286&quot;&gt;&lt;a href=&quot;http://burton.chtah.com/a/hBR4ou7B4Yc6cB8z3ifNsjSkk8E/br3&quot; style=&quot;display:block&quot; target=&quot;_blank&quot; title=&quot;Instagram&quot;&gt;&lt;img alt=&quot;Instagram&quot; border=&quot;0&quot; height=&quot;48&quot; src=&quot;http://media.burton.co.uk/wcsstore/ConsumerDirectStorefrontAssetStore/images/colors/color2/cms/pages/email/email-0000039062/images/2013-email-temp_21_instagram1.jpg&quot; style=&quot;display:block&quot; width=&quot;286&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n					&lt;/tr&gt;\r\n				&lt;/tbody&gt;\r\n			&lt;/table&gt;\r\n			&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td&gt;\r\n			&lt;table align=&quot;center&quot; bgcolor=&quot;#ffffff&quot; border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; width=&quot;700&quot;&gt;\r\n				&lt;tbody&gt;\r\n					&lt;tr&gt;\r\n						&lt;td align=&quot;center&quot; height=&quot;48&quot; width=&quot;414&quot;&gt;&lt;a href=&quot;http://burton.chtah.com/a/hBR4ou7B4Yc6cB8z3ifNsjSkk8E/br21#fragment-2&amp;amp;cmpid=nl_13_w47_1_17&amp;amp;_$ja=tsid:32925&quot; style=&quot;display:block&quot; target=&quot;_blank&quot; title=&quot;Shipping&quot;&gt;&lt;img alt=&quot;Shipping&quot; border=&quot;0&quot; height=&quot;48&quot; src=&quot;http://media.burton.co.uk/wcsstore/ConsumerDirectStorefrontAssetStore/images/colors/color2/cms/pages/email/email-0000039062/images/2013-email-temp_22_shipping1.jpg&quot; style=&quot;display:block&quot; width=&quot;414&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n						&lt;td align=&quot;center&quot; height=&quot;48&quot; width=&quot;286&quot;&gt;&lt;a href=&quot;http://burton.chtah.com/a/hBR4ou7B4Yc6cB8z3ifNsjSkk8E/br35&quot; style=&quot;display:block&quot; target=&quot;_blank&quot; title=&quot;App&quot;&gt;&lt;img alt=&quot;App&quot; border=&quot;0&quot; height=&quot;48&quot; src=&quot;http://media.burton.co.uk/wcsstore/ConsumerDirectStorefrontAssetStore/images/colors/color2/cms/pages/email/email-0000039062/images/2013-email-temp_23_downloadapp.jpg&quot; style=&quot;display:block&quot; width=&quot;286&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n					&lt;/tr&gt;\r\n				&lt;/tbody&gt;\r\n			&lt;/table&gt;\r\n			&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td&gt;\r\n			&lt;table align=&quot;center&quot; bgcolor=&quot;#ffffff&quot; border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; width=&quot;700&quot;&gt;\r\n				&lt;tbody&gt;\r\n					&lt;tr&gt;\r\n						&lt;td align=&quot;center&quot; height=&quot;51&quot; width=&quot;700&quot;&gt;&lt;a href=&quot;http://burton.chtah.com/a/hBR4ou7B4Yc6cB8z3ifNsjSkk8E/br5?RAF_TRACK=&amp;amp;email=welookvn@gmail.com&quot; style=&quot;display:block&quot; target=&quot;_blank&quot; title=&quot;Forward to a friend&quot;&gt;&lt;img alt=&quot;Forward to a friend&quot; border=&quot;0&quot; height=&quot;51&quot; src=&quot;http://media.burton.co.uk/wcsstore/ConsumerDirectStorefrontAssetStore/images/colors/color2/cms/pages/email/email-0000039062/images/2013-email-temp_24_forwardtoafriend2.jpg&quot; style=&quot;display:block&quot; width=&quot;700&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n					&lt;/tr&gt;\r\n				&lt;/tbody&gt;\r\n			&lt;/table&gt;\r\n			&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td&gt;\r\n			&lt;table align=&quot;center&quot; bgcolor=&quot;#ffffff&quot; border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; width=&quot;700&quot;&gt;\r\n				&lt;tbody&gt;\r\n					&lt;tr&gt;\r\n						&lt;td align=&quot;center&quot; style=&quot;background:#ffffff&quot;&gt;\r\n						&lt;p style=&quot;padding:15px&quot;&gt;&lt;span style=&quot;font-size:x-small&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt;&lt;span style=&quot;color:#888888&quot;&gt;© Copyright 2013 Burton&lt;br /&gt;\r\n						&lt;br /&gt;\r\n						If you want to unsubscribe just click on the following link: &lt;a href=&quot;http://burton.chtah.com/a/hBR4ou7B4Yc6cB8z3ifNsjSkk8E/br6?password=B4Yc6cNsjSkkBR4ou7vL8o6mV4d3LO&quot; style=&quot;color:#0000ff&quot; target=&quot;_blank&quot;&gt;UNSUBSCRIBE&lt;/a&gt;&lt;br /&gt;\r\n						&lt;br /&gt;\r\n						Arcadia Group Brands Limited (Co No: 1016191) trading as Burton is a company incorporated in England and Wales. Its registered office is at Colegrave House, 70 Berners Street, London W1T 3NL&lt;br /&gt;\r\n						&lt;br /&gt;\r\n						The information in this email and in any attachment is confidential and is intended solely for the addressee. Internet communications are not secure against interception or modification. Arcadia Group Limited therefore can not guarantee that this message has not been modified in transit. If you have received this message in error please notify the sender and destroy your copies of the message and any attached files.&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n						&lt;/td&gt;\r\n					&lt;/tr&gt;\r\n				&lt;/tbody&gt;\r\n			&lt;/table&gt;\r\n			&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n	&lt;/tbody&gt;\r\n&lt;/table&gt;\r\n', '', '');
INSERT INTO `news_description` (`news_id`, `language_id`, `name`, `short_description`, `description`, `meta_description`, `meta_keyword`) VALUES
(28, 2, 'NORSTROM  - TOP KÍNH BÁN CHẠY NHẤT !! SHOP NOW', '', '&lt;table cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; width=&quot;598&quot;&gt;\r\n	&lt;tbody&gt;\r\n		&lt;tr&gt;\r\n			&lt;td align=&quot;center&quot; height=&quot;57&quot; valign=&quot;middle&quot; width=&quot;598&quot;&gt;\r\n			&lt;div style=&quot;font-size:11px;font-family:Arial,Helvetica,sans-serif;color:#787878;line-height:12px&quot;&gt;&lt;a href=&quot;https://em.nordstrom.com/pub/cc?_ri_=X0Gzc2X%3DWQpglLjHJlYQGjLLzbwfza6gmNwejeotsAqFMHudpHrG5hWFzaVXtpKX%3DWTRUWD&amp;amp;_ei_=EsP-heRyaRd3Gade7ICsub5cWDIGQa2H_AvhfYJE5el8RqL8VRIO5Y3cxaUzQ7sbKwvpXNMiVKo3t5RXLUs5iev50ZNjjY3As0rSENgY0J93gKDWFmeB_3wU6wx3eGxmUfdnjbB1rZ6d9Sr6OOiQNS9ChFLFAZfjgum0l7uR2AFCeF5uNiIJaK8sWi1-F4Jau-8uUSBKXydjya-unphKoQKXZi-1Ry90wmmAeKPJQfNMlNSD.&quot; style=&quot;color:#787878;line-height:12px;text-decoration:none&quot; target=&quot;_blank&quot;&gt;Updated classics from some of our favorite brands.&lt;/a&gt;&lt;br /&gt;\r\n			View this e-mail &lt;a href=&quot;https://em.nordstrom.com/pub/cc?_ri_=X0Gzc2X%3DWQpglLjHJlYQGjLLzbwfza6gmNwejeotsAqFMHudpHrG5hWFzaVXtpKX%3DWTRUYR&amp;amp;_ei_=EsP-heRyaRd3Gade7ICsub5cWDIGQa2H_AvhfYJE5el8RqL8VRIO5Y3cxaUzQ7sbKwvpXNMiVKo3t5RXLUs5iev50ZNjjY3As0rSENgY0J93gKDWFmeB_3wU6wx3eGxmUdkPlBHSiVtQiRsDhw_0KWnPlQOVgg.&quot; style=&quot;color:#787878;line-height:12px;text-decoration:underline&quot; target=&quot;_blank&quot;&gt;in web browser&lt;/a&gt;.&lt;/div&gt;\r\n			&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n	&lt;/tbody&gt;\r\n&lt;/table&gt;\r\n\r\n&lt;table cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; width=&quot;598&quot;&gt;\r\n	&lt;tbody&gt;\r\n		&lt;tr&gt;\r\n			&lt;td align=&quot;center&quot; height=&quot;63&quot; valign=&quot;middle&quot; width=&quot;598&quot;&gt;&lt;a href=&quot;https://em.nordstrom.com/pub/cc?_ri_=X0Gzc2X%3DWQpglLjHJlYQGjLLzbwfza6gmNwejeotsAqFMHudpHrG5hWFzaVXtpKX%3DWTRUYS&amp;amp;_ei_=EsP-heRyaRd3Gade7ICsub5cWDIGQa2H_AvhfYJE5el8RqL8VRIO5Y3cxaUzQ7sbKwvpXNMiVKo3t5RXLUs5iev50ZNjjY3As0rSENgY0J93gKDWFmeB_3wU6wx3eGxmUfdnjbB1rZ6d9Sr6OOiQNSbcrbpip8sHUDyydCvPnwZjMBv5uUZU7_PI-Az0io8CFlRpk33nXq2lfGcHtjT8_OVn4JbIaU2pgfoW8vhoxdJdlh7h.&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;MEN’S SHOP - NORDSTROM&quot; border=&quot;0&quot; height=&quot;63&quot; src=&quot;https://responsys.hs.llnwd.net/i5/responsysimages/nordstrom/20130713/20130713_Mens_Sunglasses/menslogo.gif&quot; style=&quot;display:block&quot; width=&quot;292&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n	&lt;/tbody&gt;\r\n&lt;/table&gt;\r\n\r\n&lt;table cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; width=&quot;598&quot;&gt;\r\n	&lt;tbody&gt;\r\n		&lt;tr&gt;\r\n			&lt;td align=&quot;center&quot; bgcolor=&quot;#000000&quot; height=&quot;2&quot; style=&quot;line-height:1px&quot; width=&quot;598&quot;&gt;&lt;img border=&quot;0&quot; height=&quot;1&quot; src=&quot;https://responsys.hs.llnwd.net/i5/responsysimages/nordstrom/20130713/20130713_Mens_Sunglasses/spcr.gif&quot; style=&quot;display:block&quot; width=&quot;1&quot; /&gt;&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n	&lt;/tbody&gt;\r\n&lt;/table&gt;\r\n\r\n&lt;table cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; width=&quot;598&quot;&gt;\r\n	&lt;tbody&gt;\r\n		&lt;tr&gt;\r\n			&lt;td align=&quot;center&quot; height=&quot;30&quot; valign=&quot;middle&quot; width=&quot;82&quot;&gt;\r\n			&lt;div style=&quot;font-size:12px;font-family:Arial,Helvetica,sans-serif;color:#646464;line-height:14px&quot;&gt;&lt;a href=&quot;https://em.nordstrom.com/pub/cc?_ri_=X0Gzc2X%3DWQpglLjHJlYQGjLLzbwfza6gmNwejeotsAqFMHudpHrG5hWFzaVXtpKX%3DWTRUYT&amp;amp;_ei_=EsP-heRyaRd3Gade7ICsub5cWDIGQa2H_AvhfYJE5el8RqL8VRIO5Y3cxaUzQ7sbKwvpXNMiVKo3t5RXLUs5iev50ZNjjY3As0rSENgY0J93gKDWFmeB_3wU6wx3eGxmUfdnjbB1rZ6d9Sr6OOiQNS8s8ISpVt3jOE6RIwICRLEBV_18h9qhKeuWurddLOGKtuSYNegBAArgnHZ69Mxl5Ndy-39JbTKVmIyLnICrw4iISG_7-0.&quot; style=&quot;color:#646464;line-height:14px;text-decoration:none&quot; target=&quot;_blank&quot;&gt;CLOTHING&lt;/a&gt;&lt;/div&gt;\r\n			&lt;/td&gt;\r\n			&lt;td align=&quot;center&quot; height=&quot;30&quot; valign=&quot;middle&quot; width=&quot;68&quot;&gt;\r\n			&lt;div style=&quot;font-size:12px;font-family:Arial,Helvetica,sans-serif;color:#646464;line-height:14px&quot;&gt;&lt;a href=&quot;https://em.nordstrom.com/pub/cc?_ri_=X0Gzc2X%3DWQpglLjHJlYQGjLLzbwfza6gmNwejeotsAqFMHudpHrG5hWFzaVXtpKX%3DWTRUYU&amp;amp;_ei_=EsP-heRyaRd3Gade7ICsub5cWDIGQa2H_AvhfYJE5el8RqL8VRIO5Y3cxaUzQ7sbKwvpXNMiVKo3t5RXLUs5iev50ZNjjY3As0rSENgY0J93gKDWFmeB_3wU6wx3eGxmUfdnjbB1rZ6d9Sr6OOiQNS9GWUGVDRPgfHjAieLI4Plh74CdW-zD3reeN8jZLlyhJ2OkmaleHVK_YSpX3D14hhPiTm-gLOyo_VN-fTxmQjncfw.&quot; style=&quot;color:#646464;line-height:14px;text-decoration:none&quot; target=&quot;_blank&quot;&gt;SHOES&lt;/a&gt;&lt;/div&gt;\r\n			&lt;/td&gt;\r\n			&lt;td align=&quot;center&quot; height=&quot;30&quot; valign=&quot;middle&quot; width=&quot;112&quot;&gt;\r\n			&lt;div style=&quot;font-size:12px;font-family:Arial,Helvetica,sans-serif;color:#646464;line-height:14px&quot;&gt;&lt;a href=&quot;https://em.nordstrom.com/pub/cc?_ri_=X0Gzc2X%3DWQpglLjHJlYQGjLLzbwfza6gmNwejeotsAqFMHudpHrG5hWFzaVXtpKX%3DWTRUYW&amp;amp;_ei_=EsP-heRyaRd3Gade7ICsub5cWDIGQa2H_AvhfYJE5el8RqL8VRIO5Y3cxaUzQ7sbKwvpXNMiVKo3t5RXLUs5iev50ZNjjY3As0rSENgY0J93gKDWFmeB_3wU6wx3eGxmUfdnjbB1rZ6d9Sr6OOiQNS9gSgYaMk9O4RmiBJ17X9gdy3B1z1kKAUtgPiR2oJeo4CkS4SDkqEppWofj9UJipZRFJmVJbWNoGjTS_Izbgn6X.&quot; style=&quot;color:#646464;line-height:14px;text-decoration:none&quot; target=&quot;_blank&quot;&gt;ACCESSORIES&lt;/a&gt;&lt;/div&gt;\r\n			&lt;/td&gt;\r\n			&lt;td align=&quot;center&quot; height=&quot;30&quot; valign=&quot;middle&quot; width=&quot;166&quot;&gt;\r\n			&lt;div style=&quot;font-size:12px;font-family:Arial,Helvetica,sans-serif;color:#646464;line-height:14px&quot;&gt;&lt;a href=&quot;https://em.nordstrom.com/pub/cc?_ri_=X0Gzc2X%3DWQpglLjHJlYQGjLLzbwfza6gmNwejeotsAqFMHudpHrG5hWFzaVXtpKX%3DWTRUYY&amp;amp;_ei_=EsP-heRyaRd3Gade7ICsub5cWDIGQa2H_AvhfYJE5el8RqL8VRIO5Y3cxaUzQ7sbKwvpXNMiVKo3t5RXLUs5iev50ZNjjY3As0rSENgY0J93gKDWFmeB_3wU6wx3eGxmUfdnjbB1rZ6d9Sr6OOiQNSaRlsqX1fYxctSc2y07vzp6Cb645TJ5hyjMN2hfRBgQwO_V8yPMkXfl_JeDIQDaVFiYB6XQSr93DC87lSh228Jc3g.&quot; style=&quot;color:#646464;line-height:14px;text-decoration:none&quot; target=&quot;_blank&quot;&gt;GROOMING &amp;amp; COLOGNE&lt;/a&gt;&lt;/div&gt;\r\n			&lt;/td&gt;\r\n			&lt;td align=&quot;center&quot; height=&quot;30&quot; valign=&quot;middle&quot; width=&quot;170&quot;&gt;\r\n			&lt;div style=&quot;font-size:12px;font-family:Arial,Helvetica,sans-serif;color:#646464;line-height:14px&quot;&gt;&lt;a href=&quot;https://em.nordstrom.com/pub/cc?_ri_=X0Gzc2X%3DWQpglLjHJlYQGjLLzbwfza6gmNwejeotsAqFMHudpHrG5hWFzaVXtpKX%3DWTRUYA&amp;amp;_ei_=EsP-heRyaRd3Gade7ICsub5cWDIGQa2H_AvhfYJE5el8RqL8VRIO5Y3cxaUzQ7sbKwvpXNMiVKo3t5RXLUs5iev50ZNjjY3As0rSENgY0J93gKDWFmeB_3wU6wx3eGxmUfdnjbB1rZ6d9Sr6OOiQNSbCto5dc0uVOR67ygnVxJWXuKZQklt7fNzXYjWJT6CgWHwmcwdfnPiwrSdFeB-HjNOxAx1wO7lHTi3ZTCkE88UfTPs.&quot; style=&quot;color:#646464;line-height:14px;text-decoration:none&quot; target=&quot;_blank&quot;&gt;DESIGNER COLLECTIONS&lt;/a&gt;&lt;/div&gt;\r\n			&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n	&lt;/tbody&gt;\r\n&lt;/table&gt;\r\n\r\n&lt;div style=&quot;float:left;overflow:hidden;width:0;max-height:0;line-height:0&quot;&gt;\r\n&lt;table cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; width=&quot;1&quot;&gt;\r\n	&lt;tbody&gt;\r\n		&lt;tr&gt;\r\n			&lt;td align=&quot;center&quot; height=&quot;0&quot; valign=&quot;middle&quot; width=&quot;1&quot;&gt;&lt;a href=&quot;https://em.nordstrom.com/pub/cc?_ri_=X0Gzc2X%3DWQpglLjHJlYQGjLLzbwfza6gmNwejeotsAqFMHudpHrG5hWFzaVXtpKX%3DWTRUYB&amp;amp;_ei_=EsP-heRyaRd3Gade7ICsub5cWDIGQa2H_AvhfYJE5el8RqL8VRIO5Y3cxaUzQ7sbKwvpXNMiVKo3t5RXLUs5iev50ZNjjY3As0rSENgY0J93gKDWFmeB_3wU6wx3eGxmUfdnjbB1rZ6d9Sr6OOiQNSbtI4rx9R4KeCdfDQuZXVGND51Wy6_8vN73a8PmZwN9RQ3eqRe3N1qYz2icjko-EAXsosurmJVKRITFMHPH2jz0qbjCg0.&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;Early Access! ANNIVERSARY SALE - BECOME A NORDSTROM CARDHOLDER TODAY - SHOP ANNIVERSARY SALE EARLY, JULY 10-18 - APPLY NOW&quot; border=&quot;0&quot; height=&quot;0&quot; src=&quot;https://responsys.hs.llnwd.net/i5/responsysimages/nordstrom/20130713/20130713_Mens_Sunglasses/bnr3_bg.gif&quot; style=&quot;display:block&quot; width=&quot;1&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n	&lt;/tbody&gt;\r\n&lt;/table&gt;\r\n&lt;/div&gt;\r\n\r\n&lt;table cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; width=&quot;598&quot;&gt;\r\n	&lt;tbody&gt;\r\n		&lt;tr&gt;\r\n			&lt;td align=&quot;center&quot; height=&quot;70&quot; valign=&quot;middle&quot; width=&quot;598&quot;&gt;&lt;a href=&quot;https://em.nordstrom.com/pub/cc?_ri_=X0Gzc2X%3DWQpglLjHJlYQGjLLzbwfza6gmNwejeotsAqFMHudpHrG5hWFzaVXtpKX%3DWTRUYB&amp;amp;_ei_=EsP-heRyaRd3Gade7ICsub5cWDIGQa2H_AvhfYJE5el8RqL8VRIO5Y3cxaUzQ7sbKwvpXNMiVKo3t5RXLUs5iev50ZNjjY3As0rSENgY0J93gKDWFmeB_3wU6wx3eGxmUfdnjbB1rZ6d9Sr6OOiQNSbtI4rx9R4KeCdfDQuZXVGND51Wy6_8vN73a8PmZwN9RQ3eqRe3N1qYz2icjko-EAXsosurmJVKRITFMHPH2jz0qbjCg0.&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;Early Access! ANNIVERSARY SALE - BECOME A NORDSTROM CARDHOLDER TODAY - SHOP ANNIVERSARY SALE EARLY, JULY 10-18 - APPLY NOW&quot; border=&quot;0&quot; height=&quot;70&quot; src=&quot;https://responsys.hs.llnwd.net/i5/responsysimages/nordstrom/20130713/20130713_Mens_Sunglasses/bnr3_1.gif&quot; style=&quot;display:block&quot; width=&quot;598&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n	&lt;/tbody&gt;\r\n&lt;/table&gt;\r\n\r\n&lt;table cellpadding=&quot;0&quot; cellspacing=&quot;0&quot;&gt;\r\n	&lt;tbody&gt;\r\n		&lt;tr&gt;\r\n			&lt;td height=&quot;5&quot; style=&quot;font-size:5px;line-height:5px&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n	&lt;/tbody&gt;\r\n&lt;/table&gt;\r\n\r\n&lt;table cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; width=&quot;598&quot;&gt;\r\n	&lt;tbody&gt;\r\n		&lt;tr&gt;\r\n			&lt;td height=&quot;762&quot; width=&quot;598&quot;&gt;&lt;a href=&quot;https://em.nordstrom.com/pub/cc?_ri_=X0Gzc2X%3DWQpglLjHJlYQGjLLzbwfza6gmNwejeotsAqFMHudpHrG5hWFzaVXtpKX%3DWTRUYC&amp;amp;_ei_=EsP-heRyaRd3Gade7ICsub5cWDIGQa2H_AvhfYJE5el8RqL8VRIO5Y3cxaUzQ7sbKwvpXNMiVKo3t5RXLUs5iev50ZNjjY3As0rSENgY0J93gKDWFmeB_3wU6wx3eGxmUfdnjbB1rZ6d9Sr6OOiQNSalzwnvOnUQ-eNd56E2cBx3YoAQfycp40Am6zBmvoz5kGQVNfVGiWRnwpKfecaZ7GXlTXq7gg6oOpUsM6Sz9WgdQYo-edA.&quot; target=&quot;_blank&quot;&gt;&lt;img border=&quot;0&quot; height=&quot;762&quot; src=&quot;https://responsys.hs.llnwd.net/i5/responsysimages/nordstrom/20130713/20130713_Mens_Sunglasses/hero7_1.jpg&quot; style=&quot;display:block&quot; width=&quot;598&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td align=&quot;center&quot; valign=&quot;top&quot; width=&quot;598&quot;&gt;\r\n			&lt;div style=&quot;line-height:50px;font-size:22px;font-family:Arial,Helvetica,sans-serif;font-weight:bold&quot;&gt;&lt;a href=&quot;https://em.nordstrom.com/pub/cc?_ri_=X0Gzc2X%3DWQpglLjHJlYQGjLLzbwfza6gmNwejeotsAqFMHudpHrG5hWFzaVXtpKX%3DWTRUYD&amp;amp;_ei_=EsP-heRyaRd3Gade7ICsub5cWDIGQa2H_AvhfYJE5el8RqL8VRIO5Y3cxaUzQ7sbKwvpXNMiVKo3t5RXLUs5iev50ZNjjY3As0rSENgY0J93gKDWFmeB_3wU6wx3eGxmUfdnjbB1rZ6d9Sr6OOiQNSalzwnvOnUQ-eNd56E2cBx3S5XEPd1gU5UCkyRLYNCmrOXcFnRnWOklqE2uOghnBWvAr9m8e8pIL2vVkrKvdkGDvzy5cS0.&quot; style=&quot;color:#010101;line-height:50px;text-decoration:none&quot; target=&quot;_blank&quot;&gt;PERFECT SHADES&lt;/a&gt;&lt;/div&gt;\r\n\r\n			&lt;div style=&quot;font-size:14px;font-family:Arial,Helvetica,sans-serif;color:#808080;line-height:16px&quot;&gt;Greet the heat with the latest eyewear from Ray-Ban and more.&lt;/div&gt;\r\n\r\n			&lt;table cellpadding=&quot;0&quot; cellspacing=&quot;0&quot;&gt;\r\n				&lt;tbody&gt;\r\n					&lt;tr&gt;\r\n						&lt;td height=&quot;12&quot; style=&quot;line-height:12px&quot;&gt;&lt;img border=&quot;0&quot; height=&quot;1&quot; src=&quot;https://responsys.hs.llnwd.net/i5/responsysimages/nordstrom/20130713/20130713_Mens_Sunglasses/spcr.gif&quot; style=&quot;display:block&quot; width=&quot;1&quot; /&gt;&lt;/td&gt;\r\n					&lt;/tr&gt;\r\n				&lt;/tbody&gt;\r\n			&lt;/table&gt;\r\n\r\n			&lt;div style=&quot;font-size:14px;font-family:Arial,Helvetica,sans-serif;color:#010101;line-height:16px&quot;&gt;&lt;a href=&quot;https://em.nordstrom.com/pub/cc?_ri_=X0Gzc2X%3DWQpglLjHJlYQGjLLzbwfza6gmNwejeotsAqFMHudpHrG5hWFzaVXtpKX%3DWTRUAR&amp;amp;_ei_=EsP-heRyaRd3Gade7ICsub5cWDIGQa2H_AvhfYJE5el8RqL8VRIO5Y3cxaUzQ7sbKwvpXNMiVKo3t5RXLUs5iev50ZNjjY3As0rSENgY0J93gKDWFmeB_3wU6wx3eGxmUfdnjbB1rZ6d9Sr6OOiQNSalzwnvOnUQ-eNd56E2cBx3Vy5JZ4dXk6ZGVcnfB2DVbCIRDDXOmPZt-DI-95fLU8gk5gHKHLZ8PLtxC5dvAWfDnAoeExA.&quot; style=&quot;color:#010101;line-height:16px;text-decoration:none&quot; target=&quot;_blank&quot;&gt;SHOP SUNGLASSES&amp;nbsp;&amp;gt;&lt;/a&gt;&lt;/div&gt;\r\n			&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td height=&quot;15&quot; style=&quot;line-height:15px&quot;&gt;&lt;img border=&quot;0&quot; height=&quot;1&quot; src=&quot;https://responsys.hs.llnwd.net/i5/responsysimages/nordstrom/20130713/20130713_Mens_Sunglasses/spcr.gif&quot; style=&quot;display:block&quot; width=&quot;1&quot; /&gt;&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n	&lt;/tbody&gt;\r\n&lt;/table&gt;\r\n\r\n&lt;table cellpadding=&quot;0&quot; cellspacing=&quot;0&quot;&gt;\r\n	&lt;tbody&gt;\r\n		&lt;tr&gt;\r\n			&lt;td height=&quot;14&quot; style=&quot;font-size:14px;line-height:14px&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n	&lt;/tbody&gt;\r\n&lt;/table&gt;\r\n\r\n&lt;div style=&quot;float:left;overflow:hidden;width:0;max-height:0;line-height:0&quot;&gt;\r\n&lt;table cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; width=&quot;1&quot;&gt;\r\n	&lt;tbody&gt;\r\n		&lt;tr&gt;\r\n			&lt;td height=&quot;0&quot; width=&quot;1&quot;&gt;&lt;a href=&quot;https://em.nordstrom.com/pub/cc?_ri_=X0Gzc2X%3DWQpglLjHJlYQGjLLzbwfza6gmNwejeotsAqFMHudpHrG5hWFzaVXtpKX%3DWTRUAS&amp;amp;_ei_=EsP-heRyaRd3Gade7ICsub5cWDIGQa2H_AvhfYJE5el8RqL8VRIO5Y3cxaUzQ7sbKwvpXNMiVKo3t5RXLUs5iev50ZNjjY3As0rSENgY0J93gKDWFmeB_3wU6wx3eGxmUfdnjbB1rZ6d9Sr6OOiQNSalzwnvOnUQ-eNd56E2cBx3g8eP2FK_W8evXVaMFW2hT4Cps-OleeP5QKSpcQnl1N4bygkKBpt6TkOsNDDUsO3bk3br2-8.&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;SLEEKER SNEAKER&quot; border=&quot;0&quot; height=&quot;0&quot; src=&quot;https://responsys.hs.llnwd.net/i5/responsysimages/nordstrom/20130713/20130713_Mens_Sunglasses/hero2_bg.jpg&quot; style=&quot;display:block&quot; width=&quot;1&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n	&lt;/tbody&gt;\r\n&lt;/table&gt;\r\n&lt;/div&gt;\r\n\r\n&lt;table cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; width=&quot;598&quot;&gt;\r\n	&lt;tbody&gt;\r\n		&lt;tr&gt;\r\n			&lt;td height=&quot;532&quot; width=&quot;598&quot;&gt;&lt;a href=&quot;https://em.nordstrom.com/pub/cc?_ri_=X0Gzc2X%3DWQpglLjHJlYQGjLLzbwfza6gmNwejeotsAqFMHudpHrG5hWFzaVXtpKX%3DWTRUAS&amp;amp;_ei_=EsP-heRyaRd3Gade7ICsub5cWDIGQa2H_AvhfYJE5el8RqL8VRIO5Y3cxaUzQ7sbKwvpXNMiVKo3t5RXLUs5iev50ZNjjY3As0rSENgY0J93gKDWFmeB_3wU6wx3eGxmUfdnjbB1rZ6d9Sr6OOiQNSalzwnvOnUQ-eNd56E2cBx3g8eP2FK_W8evXVaMFW2hT4Cps-OleeP5QKSpcQnl1N4bygkKBpt6TkOsNDDUsO3bk3br2-8.&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;SLEEKER SNEAKER&quot; border=&quot;0&quot; height=&quot;532&quot; src=&quot;https://responsys.hs.llnwd.net/i5/responsysimages/nordstrom/20130713/20130713_Mens_Sunglasses/hero2_3.jpg&quot; style=&quot;display:block&quot; width=&quot;598&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n	&lt;/tbody&gt;\r\n&lt;/table&gt;\r\n\r\n&lt;table cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; width=&quot;598&quot;&gt;\r\n	&lt;tbody&gt;\r\n		&lt;tr&gt;\r\n			&lt;td width=&quot;228&quot;&gt;&lt;a href=&quot;https://em.nordstrom.com/pub/cc?_ri_=X0Gzc2X%3DWQpglLjHJlYQGjLLzbwfza6gmNwejeotsAqFMHudpHrG5hWFzaVXtpKX%3DWTRUAS&amp;amp;_ei_=EsP-heRyaRd3Gade7ICsub5cWDIGQa2H_AvhfYJE5el8RqL8VRIO5Y3cxaUzQ7sbKwvpXNMiVKo3t5RXLUs5iev50ZNjjY3As0rSENgY0J93gKDWFmeB_3wU6wx3eGxmUfdnjbB1rZ6d9Sr6OOiQNSalzwnvOnUQ-eNd56E2cBx3g8eP2FK_W8evXVaMFW2hT4Cps-OleeP5QKSpcQnl1N4bygkKBpt6TkOsNDDUsO3bk3br2-8.&quot; target=&quot;_blank&quot;&gt;&lt;img border=&quot;0&quot; height=&quot;31&quot; src=&quot;https://responsys.hs.llnwd.net/i5/responsysimages/nordstrom/20130713/20130713_Mens_Sunglasses/hero2_5.jpg&quot; style=&quot;display:block&quot; width=&quot;228&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n			&lt;td align=&quot;center&quot; valign=&quot;middle&quot; width=&quot;150&quot;&gt;\r\n			&lt;div style=&quot;line-height:16px;font-size:14px;font-family:Arial,Helvetica,sans-serif&quot;&gt;&lt;a href=&quot;https://em.nordstrom.com/pub/cc?_ri_=X0Gzc2X%3DWQpglLjHJlYQGjLLzbwfza6gmNwejeotsAqFMHudpHrG5hWFzaVXtpKX%3DWTRUAT&amp;amp;_ei_=EsP-heRyaRd3Gade7ICsub5cWDIGQa2H_AvhfYJE5el8RqL8VRIO5Y3cxaUzQ7sbKwvpXNMiVKo3t5RXLUs5iev50ZNjjY3As0rSENgY0J93gKDWFmeB_3wU6wx3eGxmUfdnjbB1rZ6d9Sr6OOiQNSalzwnvOnUQ-eNd56E2cBx3eDDKCUT4eCXtpWpLKq3EJC6V31kePeVkLMhF0tu1MAOKf59L_n6Jmxh1RS9vxHJ92ICGS4w.&quot; style=&quot;color:#010101;line-height:16px;text-decoration:none&quot; target=&quot;_blank&quot;&gt;SHOP SNEAKERS&amp;nbsp;&amp;gt;&lt;/a&gt;&lt;/div&gt;\r\n			&lt;/td&gt;\r\n			&lt;td width=&quot;220&quot;&gt;&lt;a href=&quot;https://em.nordstrom.com/pub/cc?_ri_=X0Gzc2X%3DWQpglLjHJlYQGjLLzbwfza6gmNwejeotsAqFMHudpHrG5hWFzaVXtpKX%3DWTRUAS&amp;amp;_ei_=EsP-heRyaRd3Gade7ICsub5cWDIGQa2H_AvhfYJE5el8RqL8VRIO5Y3cxaUzQ7sbKwvpXNMiVKo3t5RXLUs5iev50ZNjjY3As0rSENgY0J93gKDWFmeB_3wU6wx3eGxmUfdnjbB1rZ6d9Sr6OOiQNSalzwnvOnUQ-eNd56E2cBx3g8eP2FK_W8evXVaMFW2hT4Cps-OleeP5QKSpcQnl1N4bygkKBpt6TkOsNDDUsO3bk3br2-8.&quot; target=&quot;_blank&quot;&gt;&lt;img border=&quot;0&quot; height=&quot;31&quot; src=&quot;https://responsys.hs.llnwd.net/i5/responsysimages/nordstrom/20130713/20130713_Mens_Sunglasses/hero2_6.jpg&quot; style=&quot;display:block&quot; width=&quot;220&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n	&lt;/tbody&gt;\r\n&lt;/table&gt;\r\n\r\n&lt;table cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; width=&quot;598&quot;&gt;\r\n	&lt;tbody&gt;\r\n		&lt;tr&gt;\r\n			&lt;td width=&quot;598&quot;&gt;&lt;a href=&quot;https://em.nordstrom.com/pub/cc?_ri_=X0Gzc2X%3DWQpglLjHJlYQGjLLzbwfza6gmNwejeotsAqFMHudpHrG5hWFzaVXtpKX%3DWTRUAS&amp;amp;_ei_=EsP-heRyaRd3Gade7ICsub5cWDIGQa2H_AvhfYJE5el8RqL8VRIO5Y3cxaUzQ7sbKwvpXNMiVKo3t5RXLUs5iev50ZNjjY3As0rSENgY0J93gKDWFmeB_3wU6wx3eGxmUfdnjbB1rZ6d9Sr6OOiQNSalzwnvOnUQ-eNd56E2cBx3g8eP2FK_W8evXVaMFW2hT4Cps-OleeP5QKSpcQnl1N4bygkKBpt6TkOsNDDUsO3bk3br2-8.&quot; target=&quot;_blank&quot;&gt;&lt;img border=&quot;0&quot; height=&quot;36&quot; src=&quot;https://responsys.hs.llnwd.net/i5/responsysimages/nordstrom/20130713/20130713_Mens_Sunglasses/hero2_7.jpg&quot; style=&quot;display:block&quot; width=&quot;598&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n	&lt;/tbody&gt;\r\n&lt;/table&gt;\r\n\r\n&lt;table cellpadding=&quot;0&quot; cellspacing=&quot;0&quot;&gt;\r\n	&lt;tbody&gt;\r\n		&lt;tr&gt;\r\n			&lt;td height=&quot;14&quot; style=&quot;font-size:14px;line-height:14px&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n	&lt;/tbody&gt;\r\n&lt;/table&gt;\r\n\r\n&lt;div style=&quot;float:left;overflow:hidden;width:0;max-height:0;line-height:0&quot;&gt;\r\n&lt;table cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; width=&quot;1&quot;&gt;\r\n	&lt;tbody&gt;\r\n		&lt;tr&gt;\r\n			&lt;td height=&quot;0&quot; width=&quot;1&quot;&gt;&lt;a href=&quot;https://em.nordstrom.com/pub/cc?_ri_=X0Gzc2X%3DWQpglLjHJlYQGjLLzbwfza6gmNwejeotsAqFMHudpHrG5hWFzaVXtpKX%3DWTRUAU&amp;amp;_ei_=EsP-heRyaRd3Gade7ICsub5cWDIGQa2H_AvhfYJE5el8RqL8VRIO5Y3cxaUzQ7sbKwvpXNMiVKo3t5RXLUs5iev50ZNjjY3As0rSENgY0J93gKDWFmeB_3wU6wx3eGxmUfdnjbB1rZ6d9Sr6OOiQNSalzwnvOnUQ-eNd56E2cBx3Oeo7BSnUcCx6Gh7Yw6cmXVCklV9DH_hVJo60TxqD1SgM0sqTlBXbpNZt6HI-Wb7MEb2PH6IJ.&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;JACK SPADE&quot; border=&quot;0&quot; height=&quot;0&quot; src=&quot;https://responsys.hs.llnwd.net/i5/responsysimages/nordstrom/20130713/20130713_Mens_Sunglasses/hero2b_bg.jpg&quot; style=&quot;display:block&quot; width=&quot;1&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n	&lt;/tbody&gt;\r\n&lt;/table&gt;\r\n&lt;/div&gt;\r\n\r\n&lt;table cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; width=&quot;598&quot;&gt;\r\n	&lt;tbody&gt;\r\n		&lt;tr&gt;\r\n			&lt;td height=&quot;67&quot; width=&quot;598&quot;&gt;&lt;a href=&quot;https://em.nordstrom.com/pub/cc?_ri_=X0Gzc2X%3DWQpglLjHJlYQGjLLzbwfza6gmNwejeotsAqFMHudpHrG5hWFzaVXtpKX%3DWTRUAU&amp;amp;_ei_=EsP-heRyaRd3Gade7ICsub5cWDIGQa2H_AvhfYJE5el8RqL8VRIO5Y3cxaUzQ7sbKwvpXNMiVKo3t5RXLUs5iev50ZNjjY3As0rSENgY0J93gKDWFmeB_3wU6wx3eGxmUfdnjbB1rZ6d9Sr6OOiQNSalzwnvOnUQ-eNd56E2cBx3Oeo7BSnUcCx6Gh7Yw6cmXVCklV9DH_hVJo60TxqD1SgM0sqTlBXbpNZt6HI-Wb7MEb2PH6IJ.&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;JACK SPADE&quot; border=&quot;0&quot; height=&quot;67&quot; src=&quot;https://responsys.hs.llnwd.net/i5/responsysimages/nordstrom/20130713/20130713_Mens_Sunglasses/hero2b_1.jpg&quot; style=&quot;display:block&quot; width=&quot;598&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n	&lt;/tbody&gt;\r\n&lt;/table&gt;\r\n\r\n&lt;table cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; width=&quot;598&quot;&gt;\r\n	&lt;tbody&gt;\r\n		&lt;tr&gt;\r\n			&lt;td width=&quot;47&quot;&gt;&lt;a href=&quot;https://em.nordstrom.com/pub/cc?_ri_=X0Gzc2X%3DWQpglLjHJlYQGjLLzbwfza6gmNwejeotsAqFMHudpHrG5hWFzaVXtpKX%3DWTRUAU&amp;amp;_ei_=EsP-heRyaRd3Gade7ICsub5cWDIGQa2H_AvhfYJE5el8RqL8VRIO5Y3cxaUzQ7sbKwvpXNMiVKo3t5RXLUs5iev50ZNjjY3As0rSENgY0J93gKDWFmeB_3wU6wx3eGxmUfdnjbB1rZ6d9Sr6OOiQNSalzwnvOnUQ-eNd56E2cBx3Oeo7BSnUcCx6Gh7Yw6cmXVCklV9DH_hVJo60TxqD1SgM0sqTlBXbpNZt6HI-Wb7MEb2PH6IJ.&quot; target=&quot;_blank&quot;&gt;&lt;img border=&quot;0&quot; height=&quot;24&quot; src=&quot;https://responsys.hs.llnwd.net/i5/responsysimages/nordstrom/20130713/20130713_Mens_Sunglasses/hero2b_5.jpg&quot; style=&quot;display:block&quot; width=&quot;47&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n			&lt;td align=&quot;center&quot; bgcolor=&quot;#fdfbf4&quot; valign=&quot;middle&quot; width=&quot;149&quot;&gt;\r\n			&lt;div style=&quot;line-height:16px;font-size:14px;font-family:Arial,Helvetica,sans-serif&quot;&gt;&lt;a href=&quot;https://em.nordstrom.com/pub/cc?_ri_=X0Gzc2X%3DWQpglLjHJlYQGjLLzbwfza6gmNwejeotsAqFMHudpHrG5hWFzaVXtpKX%3DWTRUAW&amp;amp;_ei_=EsP-heRyaRd3Gade7ICsub5cWDIGQa2H_AvhfYJE5el8RqL8VRIO5Y3cxaUzQ7sbKwvpXNMiVKo3t5RXLUs5iev50ZNjjY3As0rSENgY0J93gKDWFmeB_3wU6wx3eGxmUfdnjbB1rZ6d9Sr6OOiQNSalzwnvOnUQ-eNd56E2cBx3p863F3qJ7znfYhcuqFiOrgdhZ-pL-2zipf4EX4-4RLbab58Ov8EbbiDmnUBWkFxTpnfyYO3V.&quot; style=&quot;color:#010101;line-height:16px;text-decoration:none&quot; target=&quot;_blank&quot;&gt;SHOP WATCHES&amp;nbsp;&amp;gt;&lt;/a&gt;&lt;/div&gt;\r\n			&lt;/td&gt;\r\n			&lt;td width=&quot;402&quot;&gt;&lt;a href=&quot;https://em.nordstrom.com/pub/cc?_ri_=X0Gzc2X%3DWQpglLjHJlYQGjLLzbwfza6gmNwejeotsAqFMHudpHrG5hWFzaVXtpKX%3DWTRUAU&amp;amp;_ei_=EsP-heRyaRd3Gade7ICsub5cWDIGQa2H_AvhfYJE5el8RqL8VRIO5Y3cxaUzQ7sbKwvpXNMiVKo3t5RXLUs5iev50ZNjjY3As0rSENgY0J93gKDWFmeB_3wU6wx3eGxmUfdnjbB1rZ6d9Sr6OOiQNSalzwnvOnUQ-eNd56E2cBx3Oeo7BSnUcCx6Gh7Yw6cmXVCklV9DH_hVJo60TxqD1SgM0sqTlBXbpNZt6HI-Wb7MEb2PH6IJ.&quot; target=&quot;_blank&quot;&gt;&lt;img border=&quot;0&quot; height=&quot;24&quot; src=&quot;https://responsys.hs.llnwd.net/i5/responsysimages/nordstrom/20130713/20130713_Mens_Sunglasses/hero2b_6.jpg&quot; style=&quot;display:block&quot; width=&quot;402&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n	&lt;/tbody&gt;\r\n&lt;/table&gt;\r\n\r\n&lt;table cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; width=&quot;598&quot;&gt;\r\n	&lt;tbody&gt;\r\n		&lt;tr&gt;\r\n			&lt;td width=&quot;598&quot;&gt;&lt;a href=&quot;https://em.nordstrom.com/pub/cc?_ri_=X0Gzc2X%3DWQpglLjHJlYQGjLLzbwfza6gmNwejeotsAqFMHudpHrG5hWFzaVXtpKX%3DWTRUAU&amp;amp;_ei_=EsP-heRyaRd3Gade7ICsub5cWDIGQa2H_AvhfYJE5el8RqL8VRIO5Y3cxaUzQ7sbKwvpXNMiVKo3t5RXLUs5iev50ZNjjY3As0rSENgY0J93gKDWFmeB_3wU6wx3eGxmUfdnjbB1rZ6d9Sr6OOiQNSalzwnvOnUQ-eNd56E2cBx3Oeo7BSnUcCx6Gh7Yw6cmXVCklV9DH_hVJo60TxqD1SgM0sqTlBXbpNZt6HI-Wb7MEb2PH6IJ.&quot; target=&quot;_blank&quot;&gt;&lt;img border=&quot;0&quot; height=&quot;507&quot; src=&quot;https://responsys.hs.llnwd.net/i5/responsysimages/nordstrom/20130713/20130713_Mens_Sunglasses/hero2b_7.jpg&quot; style=&quot;display:block&quot; width=&quot;598&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n	&lt;/tbody&gt;\r\n&lt;/table&gt;\r\n\r\n&lt;table cellpadding=&quot;0&quot; cellspacing=&quot;0&quot;&gt;\r\n	&lt;tbody&gt;\r\n		&lt;tr&gt;\r\n			&lt;td height=&quot;14&quot; style=&quot;font-size:14px;line-height:14px&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n	&lt;/tbody&gt;\r\n&lt;/table&gt;\r\n\r\n&lt;table cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; width=&quot;598&quot;&gt;\r\n	&lt;tbody&gt;\r\n		&lt;tr&gt;\r\n			&lt;td valign=&quot;top&quot; width=&quot;292&quot;&gt;\r\n			&lt;div&gt;&lt;a href=&quot;https://em.nordstrom.com/pub/cc?_ri_=X0Gzc2X%3DWQpglLjHJlYQGjLLzbwfza6gmNwejeotsAqFMHudpHrG5hWFzaVXtpKX%3DWTRUAY&amp;amp;_ei_=EsP-heRyaRd3Gade7ICsub5cWDIGQa2H_AvhfYJE5el8RqL8VRIO5Y3cxaUzQ7sbKwvpXNMiVKo3t5RXLUs5iev50ZNjjY3As0rSENgY0J93gKDWFmeB_3wU6wx3eGxmUfdnjbB1rZ6d9Sr6OOiQNS8oCnEIhrNvnqpu2uyM9yARxzs2cG5phL1g-CnSvXOee3-1LGInC0PRLoVdvgYXGDKUAT9XjvZsAHiDnEYhpHlrMRCy4IZ4_0.&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;GET OUR APPS - For iPhone, iPad and Android. LEARN MORE&quot; border=&quot;0&quot; height=&quot;114&quot; src=&quot;https://responsys.hs.llnwd.net/i5/responsysimages/nordstrom/20130713/20130713_Mens_Sunglasses/rescue1_1.gif&quot; style=&quot;display:block&quot; width=&quot;292&quot; /&gt;&lt;/a&gt;&lt;/div&gt;\r\n\r\n			&lt;table cellpadding=&quot;0&quot; cellspacing=&quot;0&quot;&gt;\r\n				&lt;tbody&gt;\r\n					&lt;tr&gt;\r\n						&lt;td height=&quot;13&quot; style=&quot;font-size:13px;line-height:13px&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n					&lt;/tr&gt;\r\n				&lt;/tbody&gt;\r\n			&lt;/table&gt;\r\n			&lt;/td&gt;\r\n			&lt;td width=&quot;14&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n			&lt;td valign=&quot;top&quot; width=&quot;292&quot;&gt;\r\n			&lt;div&gt;&lt;a href=&quot;https://em.nordstrom.com/pub/cc?_ri_=X0Gzc2X%3DWQpglLjHJlYQGjLLzbwfza6gmNwejeotsAqFMHudpHrG5hWFzaVXtpKX%3DWTRUAA&amp;amp;_ei_=EsP-heRyaRd3Gade7ICsub5cWDIGQa2H_AvhfYJE5el8RqL8VRIO5Y3cxaUzQ7sbKwvpXNMiVKo3t5RXLUs5iev50ZNjjY3As0rSENgY0J93gKDWFmeB_3wU6wx3eGxmUfdnjbB1rZ6d9Sr6OOiQNS8oCnEIhrNvnqpu2uyM9yARcHo-099yMuBpIxhtnWKHc-ZKQpWVBQaEWtqKU3DyG2esv8500MgN96zzT4rOmSQ1Qh_U1JxNx0.&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;FREE SHIPPING. FREE RETURNS. ALL THE TIME. Details below.&quot; border=&quot;0&quot; height=&quot;114&quot; src=&quot;https://responsys.hs.llnwd.net/i5/responsysimages/nordstrom/20130713/20130713_Mens_Sunglasses/rescue1_2.gif&quot; style=&quot;display:block&quot; width=&quot;292&quot; /&gt;&lt;/a&gt;&lt;/div&gt;\r\n\r\n			&lt;table cellpadding=&quot;0&quot; cellspacing=&quot;0&quot;&gt;\r\n				&lt;tbody&gt;\r\n					&lt;tr&gt;\r\n						&lt;td height=&quot;13&quot; style=&quot;font-size:13px;line-height:13px&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n					&lt;/tr&gt;\r\n				&lt;/tbody&gt;\r\n			&lt;/table&gt;\r\n			&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n	&lt;/tbody&gt;\r\n&lt;/table&gt;\r\n\r\n&lt;table cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; width=&quot;598&quot;&gt;\r\n	&lt;tbody&gt;\r\n		&lt;tr&gt;\r\n			&lt;td height=&quot;24&quot; width=&quot;190&quot;&gt;\r\n			&lt;table cellpadding=&quot;0&quot; cellspacing=&quot;0&quot;&gt;\r\n				&lt;tbody&gt;\r\n					&lt;tr&gt;\r\n						&lt;td bgcolor=&quot;#cccccc&quot; height=&quot;1&quot; style=&quot;line-height:1px&quot; valign=&quot;middle&quot; width=&quot;190&quot;&gt;&lt;img border=&quot;0&quot; height=&quot;1&quot; src=&quot;https://responsys.hs.llnwd.net/i5/responsysimages/nordstrom/20130713/20130713_Mens_Sunglasses/spcr.gif&quot; style=&quot;display:block&quot; width=&quot;1&quot; /&gt;&lt;/td&gt;\r\n					&lt;/tr&gt;\r\n				&lt;/tbody&gt;\r\n			&lt;/table&gt;\r\n			&lt;/td&gt;\r\n			&lt;td width=&quot;10&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n			&lt;td width=&quot;23&quot;&gt;&lt;a href=&quot;https://em.nordstrom.com/pub/cc?_ri_=X0Gzc2X%3DWQpglLjHJlYQGjLLzbwfza6gmNwejeotsAqFMHudpHrG5hWFzaVXtpKX%3DWTRUAB&amp;amp;_ei_=EsP-heRyaRd3Gade7ICsub5cWDIGQa2H_AvhfYJE5el8RqL8VRIO5Y3cxaUzQ7sbKwvpXNMiVKo3t5RXLUs5iev50ZNjjY3As0rSENgY0J93gKDWFmeB_3wU6wx3eGxmUfdnjbB1rZ6d9Sr6OOiQNS9sdeGOF4qY24mViKslPjjqw-WkCvnRmzWGys-_qOK5UXDfZwEIcDLJuFEigwCEcSMrzcVBb1cOSqew5-HN6g.&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;Facebook&quot; border=&quot;0&quot; height=&quot;24&quot; src=&quot;https://responsys.hs.llnwd.net/i5/responsysimages/nordstrom/20130713/20130713_Mens_Sunglasses/sfb.gif&quot; style=&quot;display:block&quot; width=&quot;23&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n			&lt;td width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n			&lt;td width=&quot;23&quot;&gt;&lt;a href=&quot;https://em.nordstrom.com/pub/cc?_ri_=X0Gzc2X%3DWQpglLjHJlYQGjLLzbwfza6gmNwejeotsAqFMHudpHrG5hWFzaVXtpKX%3DWTRUAC&amp;amp;_ei_=EsP-heRyaRd3Gade7ICsub5cWDIGQa2H_AvhfYJE5el8RqL8VRIO5Y3cxaUzQ7sbKwvpXNMiVKo3t5RXLUs5iev50ZNjjY3As0rSENgY0J93gKDWFmeB_3wU6wx3eGxmUfdnjbB1rZ6d9Sr6OOiQNS9MsePra-dLXl0MigrY_4KIe3N2yzWovUPFhnuS-DNp9zH423AJ4Gyy5vXGkyOo0yAHUCyAijjGXA2XrkzPpw.&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;Twitter&quot; border=&quot;0&quot; height=&quot;24&quot; src=&quot;https://responsys.hs.llnwd.net/i5/responsysimages/nordstrom/20130713/20130713_Mens_Sunglasses/stw.gif&quot; style=&quot;display:block&quot; width=&quot;23&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n			&lt;td width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n			&lt;td width=&quot;24&quot;&gt;&lt;a href=&quot;https://em.nordstrom.com/pub/cc?_ri_=X0Gzc2X%3DWQpglLjHJlYQGjLLzbwfza6gmNwejeotsAqFMHudpHrG5hWFzaVXtpKX%3DWTRUAD&amp;amp;_ei_=EsP-heRyaRd3Gade7ICsub5cWDIGQa2H_AvhfYJE5el8RqL8VRIO5Y3cxaUzQ7sbKwvpXNMiVKo3t5RXLUs5iev50ZNjjY3As0rSENgY0J93gKDWFmeB_3wU6wx3eGxmUfdnjbB1rZ6d9Sr6OOiQNSbZ3iywpVGcZCp9nLjZuGwcV51NzMjMkS8NcUTqIXf4zTzU0LBrYvEYQcVCWUKAx42MEOt7Vooy19YvaDADXy8.&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;Pinterest&quot; border=&quot;0&quot; height=&quot;24&quot; src=&quot;https://responsys.hs.llnwd.net/i5/responsysimages/nordstrom/20130713/20130713_Mens_Sunglasses/spin.gif&quot; style=&quot;display:block&quot; width=&quot;24&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n			&lt;td width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n			&lt;td width=&quot;23&quot;&gt;&lt;a href=&quot;https://em.nordstrom.com/pub/cc?_ri_=X0Gzc2X%3DWQpglLjHJlYQGjLLzbwfza6gmNwejeotsAqFMHudpHrG5hWFzaVXtpKX%3DWTRUBR&amp;amp;_ei_=EsP-heRyaRd3Gade7ICsub5cWDIGQa2H_AvhfYJE5el8RqL8VRIO5Y3cxaUzQ7sbKwvpXNMiVKo3t5RXLUs5iev50ZNjjY3As0rSENgY0J93gKDWFmeB_3wU6wx3eGxmUfdnjbB1rZ6d9Sr6OOiQNSbYQd62BMB1bcGR1xlITVVbklsZItd4XfdK9A9M0iqbEuK6M4bPodyzu27yVkp3mgajXeNUAM6_n3LBfHpQBM.&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;Google+&quot; border=&quot;0&quot; height=&quot;24&quot; src=&quot;https://responsys.hs.llnwd.net/i5/responsysimages/nordstrom/20130713/20130713_Mens_Sunglasses/sgplus.gif&quot; style=&quot;display:block&quot; width=&quot;22&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n			&lt;td width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n			&lt;td width=&quot;23&quot;&gt;&lt;a href=&quot;https://em.nordstrom.com/pub/cc?_ri_=X0Gzc2X%3DWQpglLjHJlYQGjLLzbwfza6gmNwejeotsAqFMHudpHrG5hWFzaVXtpKX%3DWTRUBS&amp;amp;_ei_=EsP-heRyaRd3Gade7ICsub5cWDIGQa2H_AvhfYJE5el8RqL8VRIO5Y3cxaUzQ7sbKwvpXNMiVKo3t5RXLUs5iev50ZNjjY3As0rSENgY0J93gKDWFmeB_3wU6wx3eGxmUfdnjbB1rZ6d9Sr6OOiQNSaoz50e6YTV2wf5TbSnHjI_MNDcsKlO8Bi-Ny30T3kCBv_soq_b-uJK10tIIzlmyEN3e0nGFTbGbe0ww59SXM.&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;Instagram&quot; border=&quot;0&quot; height=&quot;24&quot; src=&quot;https://responsys.hs.llnwd.net/i5/responsysimages/nordstrom/20130713/20130713_Mens_Sunglasses/sig.gif&quot; style=&quot;display:block&quot; width=&quot;22&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n			&lt;td width=&quot;8&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n			&lt;td width=&quot;42&quot;&gt;&lt;a href=&quot;https://em.nordstrom.com/pub/cc?_ri_=X0Gzc2X%3DWQpglLjHJlYQGjLLzbwfza6gmNwejeotsAqFMHudpHrG5hWFzaVXtpKX%3DWTRUBT&amp;amp;_ei_=EsP-heRyaRd3Gade7ICsub5cWDIGQa2H_AvhfYJE5el8RqL8VRIO5Y3cxaUzQ7sbKwvpXNMiVKo3t5RXLUs5iev50ZNjjY3As0rSENgY0J93gKDWFmeB_3wU6wx3eGxmUfdnjbB1rZ6d9Sr6OOiQNSatEaCvbyQmI2fzsEqDcXvSeig1ky0Wva0r0O5xI5U1WFhZfCCvlhQDES3zlTk0ZQ3w8vqymfW2O8WlT8D8a0.&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;YouTube&quot; border=&quot;0&quot; height=&quot;24&quot; src=&quot;https://responsys.hs.llnwd.net/i5/responsysimages/nordstrom/20130713/20130713_Mens_Sunglasses/syt.gif&quot; style=&quot;display:block&quot; width=&quot;42&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n			&lt;td width=&quot;10&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n			&lt;td height=&quot;24&quot; width=&quot;190&quot;&gt;\r\n			&lt;table cellpadding=&quot;0&quot; cellspacing=&quot;0&quot;&gt;\r\n				&lt;tbody&gt;\r\n					&lt;tr&gt;\r\n						&lt;td bgcolor=&quot;#cccccc&quot; height=&quot;1&quot; style=&quot;line-height:1px&quot; valign=&quot;middle&quot; width=&quot;190&quot;&gt;&lt;img border=&quot;0&quot; height=&quot;1&quot; src=&quot;https://responsys.hs.llnwd.net/i5/responsysimages/nordstrom/20130713/20130713_Mens_Sunglasses/spcr.gif&quot; style=&quot;display:block&quot; width=&quot;1&quot; /&gt;&lt;/td&gt;\r\n					&lt;/tr&gt;\r\n				&lt;/tbody&gt;\r\n			&lt;/table&gt;\r\n			&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n	&lt;/tbody&gt;\r\n&lt;/table&gt;\r\n\r\n&lt;table cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; width=&quot;598&quot;&gt;\r\n	&lt;tbody&gt;\r\n		&lt;tr&gt;\r\n			&lt;td height=&quot;9&quot; style=&quot;line-height:9px&quot;&gt;&lt;img border=&quot;0&quot; height=&quot;1&quot; src=&quot;https://responsys.hs.llnwd.net/i5/responsysimages/nordstrom/20130713/20130713_Mens_Sunglasses/spcr.gif&quot; style=&quot;display:block&quot; width=&quot;1&quot; /&gt;&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n	&lt;/tbody&gt;\r\n&lt;/table&gt;\r\n\r\n&lt;table cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; width=&quot;598&quot;&gt;\r\n	&lt;tbody&gt;\r\n		&lt;tr&gt;\r\n			&lt;td width=&quot;121&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n			&lt;td align=&quot;center&quot; height=&quot;37&quot; valign=&quot;bottom&quot; width=&quot;63&quot;&gt;&lt;a href=&quot;https://em.nordstrom.com/pub/cc?_ri_=X0Gzc2X%3DWQpglLjHJlYQGjLLzbwfza6gmNwejeotsAqFMHudpHrG5hWFzaVXtpKX%3DWTRUBU&amp;amp;_ei_=EsP-heRyaRd3Gade7ICsub5cWDIGQa2H_AvhfYJE5el8RqL8VRIO5Y3cxaUzQ7sbKwvpXNMiVKo3t5RXLUs5iev50ZNjjY3As0rSENgY0J93gKDWFmeB_3wU6wx3eGxmUfdnjbB1rZ6d9Sr6OOiQNS8Rfqcfj8nZU0v8VD8CPm3nXRcyg2AcoZqQ_Mf6ZGaHQMoRZANHl7fuvpa9kWiDj0_w87gVG36Q_Ar-tXQd2hk.&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;NORDSTROM rack&quot; border=&quot;0&quot; height=&quot;34&quot; src=&quot;https://responsys.hs.llnwd.net/i5/responsysimages/nordstrom/20130713/20130713_Mens_Sunglasses/racklogo.png&quot; style=&quot;display:block&quot; width=&quot;63&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n			&lt;td width=&quot;30&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n			&lt;td align=&quot;center&quot; height=&quot;37&quot; valign=&quot;bottom&quot; width=&quot;93&quot;&gt;&lt;a href=&quot;https://em.nordstrom.com/pub/cc?_ri_=X0Gzc2X%3DWQpglLjHJlYQGjLLzbwfza6gmNwejeotsAqFMHudpHrG5hWFzaVXtpKX%3DWTRUBW&amp;amp;_ei_=EsP-heRyaRd3Gade7ICsub5cWDIGQa2H_AvhfYJE5el8RqL8VRIO5Y3cxaUzQ7sbKwvpXNMiVKo3t5RXLUs5iev50ZNjjY3As0rSENgY0J93gKDWFmeB_3wU6wx3eGxmUfdnjbB1rZ6d9Sr6OOiQNSaNYipLL0QHyn3Ytb4VbD9oPutJ7s3ufm9FzuEZVkDNgEz37DhwDh3mfVh5iLcklBM5yC4qjvix-Xyk6K3a6VfSYlLDow.&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;HAUTELOOK&quot; border=&quot;0&quot; height=&quot;21&quot; src=&quot;https://responsys.hs.llnwd.net/i5/responsysimages/nordstrom/20130713/20130713_Mens_Sunglasses/hllogo.png&quot; style=&quot;display:block&quot; width=&quot;93&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n			&lt;td width=&quot;23&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n			&lt;td align=&quot;center&quot; height=&quot;37&quot; valign=&quot;bottom&quot; width=&quot;143&quot;&gt;&lt;a href=&quot;https://em.nordstrom.com/pub/cc?_ri_=X0Gzc2X%3DWQpglLjHJlYQGjLLzbwfza6gmNwejeotsAqFMHudpHrG5hWFzaVXtpKX%3DWTRUBY&amp;amp;_ei_=EsP-heRyaRd3Gade7ICsub5cWDIGQa2H_AvhfYJE5el8RqL8VRIO5Y3cxaUzQ7sbKwvpXNMiVKo3t5RXLUs5iev50ZNjjY3As0rSENgY0J93gKDWFmeB_3wU6wx3eGxmUfdnjbB1rZ6d9Sr6OOiQNSaawm0yWICRLrJ1iI3xXEYaoyUKd4eGSe3pa47NALQEbMhm1hFiYnj0Klg5E0wKk2e7l49rGwLtmK8UIpHD11Y2kwb-2Of4iM.&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;treasure&amp;amp;bond&quot; border=&quot;0&quot; height=&quot;18&quot; src=&quot;https://responsys.hs.llnwd.net/i5/responsysimages/nordstrom/20130713/20130713_Mens_Sunglasses/tblogo.png&quot; style=&quot;display:block&quot; width=&quot;143&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n			&lt;td width=&quot;125&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n	&lt;/tbody&gt;\r\n&lt;/table&gt;\r\n\r\n&lt;table cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; width=&quot;598&quot;&gt;\r\n	&lt;tbody&gt;\r\n		&lt;tr&gt;\r\n			&lt;td height=&quot;27&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n	&lt;/tbody&gt;\r\n&lt;/table&gt;\r\n\r\n&lt;table cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; width=&quot;598&quot;&gt;\r\n	&lt;tbody&gt;\r\n		&lt;tr&gt;\r\n			&lt;td align=&quot;left&quot; valign=&quot;top&quot; width=&quot;598&quot;&gt;\r\n			&lt;div style=&quot;font-family:Arial,Helvetica,sans-serif;font-size:11px;color:#808080;line-height:12px&quot;&gt;FREE SHIPPING. FREE RETURNS. ALL THE TIME. Free Standard Shipping is not valid in Nordstrom Rack stores or on international orders. Free returns are not available for international orders. Nordstrom Rack Return Policy applies to all online Nordstrom Rack orders.&lt;br /&gt;\r\n			&lt;br /&gt;\r\n			Add &lt;a href=&quot;mailto:nordstrom@em.nordstrom.com&quot; style=&quot;color:#808080;line-height:12px;text-decoration:none&quot; target=&quot;_blank&quot;&gt;nordstrom@em.nordstrom.com&lt;/a&gt; to your address book to ensure that you receive our e-mails in your inbox.&lt;br /&gt;\r\n			&lt;br /&gt;\r\n			This is an advertising message from Nordstrom, &lt;span&gt;1600 Seventh Avenue, Suite 2600, Seattle, WA 98101&lt;/span&gt;.&lt;br /&gt;\r\n			&lt;a href=&quot;https://em.nordstrom.com/pub/cc?_ri_=X0Gzc2X%3DWQpglLjHJlYQGjLLzbwfza6gmNwejeotsAqFMHudpHrG5hWFzaVXtpKX%3DWTRUBA&amp;amp;_ei_=EsP-heRyaRd3Gade7ICsub5cWDIGQa2H_AvhfYJE5el8RqL8VRIO5Y3cxaUzQ7sbKwvpXNMiVKo3t5RXLUs5iev50ZNjjY3As0rSENgY0J93gKDWFmeB_3wU6wx3eGxmUfdnjbB1rZ6d9Sr6OOiQNS9g5Y5bIjg_2hMb0Wj3QglIwzypH44JfD-E_F60uckw_d1y-lXCslW4rU-TSYjqPx25XukphRUnp8tgf3DdiJpCxgI.&quot; style=&quot;color:#808080;line-height:12px;text-decoration:underline&quot; target=&quot;_blank&quot;&gt;Nordstrom Privacy Policy&lt;/a&gt;&lt;br /&gt;\r\n			&lt;br /&gt;\r\n			TO OPT-DOWN OR UNSUBSCRIBE: This e-mail was sent to you because you are a valued Nordstrom customer. To receive fewer updates or remove yourself from our e-mail program, please &lt;a href=&quot;https://em.nordstrom.com/pub/cc?_ri_=X0Gzc2X%3DWQpglLjHJlYQGjLLzbwfza6gmNwejeotsAqFMHudpHrG5hWFzaVXtpKX%3DWTRUBB&amp;amp;_ei_=EsP-heRyaRd3Gade7ICsub5cWDIGQa2H_AvhfYJE5el8RqL8VRIO5Y3cxaUzQ7sbKwvpXNMiVKo3t5RXLUs5iesdGqnRUOTyUEIbsrELICYO_Q09cudm1WHOEcLHo4gmUD4.&quot; style=&quot;color:#808080;line-height:12px;text-decoration:underline&quot; target=&quot;_blank&quot;&gt;change your e-mail preferences.&lt;/a&gt;&lt;/div&gt;\r\n			&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n	&lt;/tbody&gt;\r\n&lt;/table&gt;\r\n', '', '');
INSERT INTO `news_description` (`news_id`, `language_id`, `name`, `short_description`, `description`, `meta_description`, `meta_keyword`) VALUES
(29, 2, 'CAVIN KLEIN - SALE OFF ĐẾN 75 % MẶT HÀNG LỤA LÀ VA VÁY VÓC CHO CHỊ EM !! Mua ngay', '', '&lt;div&gt;\r\n&lt;div class=&quot;adM&quot;&gt;&amp;nbsp;&lt;/div&gt;\r\n\r\n&lt;table bgcolor=&quot;#ffffff&quot; border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; width=&quot;560&quot;&gt;\r\n	&lt;tbody&gt;\r\n		&lt;tr&gt;\r\n			&lt;td&gt;\r\n			&lt;table border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; width=&quot;560&quot;&gt;\r\n				&lt;tbody&gt;\r\n					&lt;tr&gt;\r\n						&lt;td&gt;&amp;nbsp;&lt;/td&gt;\r\n					&lt;/tr&gt;\r\n				&lt;/tbody&gt;\r\n			&lt;/table&gt;\r\n\r\n			&lt;table border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; width=&quot;560&quot;&gt;\r\n				&lt;tbody&gt;\r\n					&lt;tr&gt;\r\n						&lt;td align=&quot;center&quot;&gt;&lt;br /&gt;\r\n						&lt;font color=&quot;#999999&quot; face=&quot;Arial, Helvetica, sans-serif&quot; size=&quot;1&quot;&gt;&lt;a href=&quot;http://email.ck.com/a/hBR5RmnB7bUTCB8z6FDNskwlTgQ/semi19-0&quot; style=&quot;COLOR:#999999;TEXT-DECORATION:underline&quot; target=&quot;_blank&quot;&gt;Semi-Annual Sale - Up to 75% Off Dresses + Suit Separates at calvinklein.com &lt;/a&gt;&lt;br /&gt;\r\n						&lt;br /&gt;\r\n						&lt;a href=&quot;http://email.ck.com/a/hBR5RmnB7bUTCB8z6FDNskwlTgQ/semi2-0?email=welookvn@gmail.com&quot; style=&quot;COLOR:#999999;TEXT-DECORATION:underline&quot; target=&quot;_blank&quot;&gt;View in Browser&lt;/a&gt; &lt;a href=&quot;http://email.ck.com/a/hBR5RmnB7bUTCB8z6FDNskwlTgQ/semi20-0&quot; style=&quot;COLOR:#999999;TEXT-DECORATION:underline&quot; target=&quot;_blank&quot;&gt; Shop Our Mobile Site &lt;/a&gt; &lt;/font&gt;&lt;/td&gt;\r\n					&lt;/tr&gt;\r\n				&lt;/tbody&gt;\r\n			&lt;/table&gt;\r\n\r\n			&lt;table border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; width=&quot;560&quot;&gt;\r\n				&lt;tbody&gt;\r\n					&lt;tr&gt;\r\n						&lt;td&gt;&lt;img alt=&quot;&quot; height=&quot;32&quot; src=&quot;http://f.chtah.com/i/46/2070758594/20130716_ck_ecom_01.jpg&quot; style=&quot;display:block&quot; width=&quot;560&quot; /&gt;&lt;/td&gt;\r\n					&lt;/tr&gt;\r\n				&lt;/tbody&gt;\r\n			&lt;/table&gt;\r\n\r\n			&lt;table border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; width=&quot;560&quot;&gt;\r\n				&lt;tbody&gt;\r\n					&lt;tr&gt;\r\n						&lt;td&gt;&lt;a href=&quot;http://email.ck.com/a/hBR5RmnB7bUTCB8z6FDNskwlTgQ/semi6-0&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;SHOP WOMEN&quot; border=&quot;0&quot; height=&quot;21&quot; src=&quot;http://f.chtah.com/i/46/2070758594/20130716_ck_ecom_02.jpg&quot; style=&quot;display:block&quot; width=&quot;71&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n						&lt;td&gt;&lt;a href=&quot;http://email.ck.com/a/hBR5RmnB7bUTCB8z6FDNskwlTgQ/semi5-0&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;SHOP MEN&quot; border=&quot;0&quot; height=&quot;21&quot; src=&quot;http://f.chtah.com/i/46/2070758594/20130716_ck_ecom_03.jpg&quot; style=&quot;display:block&quot; width=&quot;46&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n						&lt;td&gt;&lt;a href=&quot;http://email.ck.com/a/hBR5RmnB7bUTCB8z6FDNskwlTgQ/semi11-0&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;SHOP UNDERWEAR&quot; border=&quot;0&quot; height=&quot;21&quot; src=&quot;http://f.chtah.com/i/46/2070758594/20130716_ck_ecom_04.jpg&quot; style=&quot;display:block&quot; width=&quot;72&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n						&lt;td&gt;&lt;a href=&quot;http://email.ck.com/a/hBR5RmnB7bUTCB8z6FDNskwlTgQ/semi7-0&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;SHOP SHOES + ACCESSORIES&quot; border=&quot;0&quot; height=&quot;21&quot; src=&quot;http://f.chtah.com/i/46/2070758594/20130716_ck_ecom_05.jpg&quot; style=&quot;display:block&quot; width=&quot;126&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n						&lt;td&gt;&lt;a href=&quot;http://email.ck.com/a/hBR5RmnB7bUTCB8z6FDNskwlTgQ/semi12-0&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;SHOP FRAGRANCE&quot; border=&quot;0&quot; height=&quot;21&quot; src=&quot;http://f.chtah.com/i/46/2070758594/20130716_ck_ecom_06.jpg&quot; style=&quot;display:block&quot; width=&quot;83&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n						&lt;td&gt;&lt;a href=&quot;http://email.ck.com/a/hBR5RmnB7bUTCB8z6FDNskwlTgQ/semi8-0&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;SHOP HOME COLLECTION&quot; border=&quot;0&quot; height=&quot;21&quot; src=&quot;http://f.chtah.com/i/46/2070758594/20130716_ck_ecom_07.jpg&quot; style=&quot;display:block&quot; width=&quot;100&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n						&lt;td&gt;&lt;a href=&quot;http://email.ck.com/a/hBR5RmnB7bUTCB8z6FDNskwlTgQ/semi9-0&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;SHOP SALE&quot; border=&quot;0&quot; height=&quot;21&quot; src=&quot;http://f.chtah.com/i/46/2070758594/20130716_ck_ecom_08.jpg&quot; style=&quot;display:block&quot; width=&quot;62&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n					&lt;/tr&gt;\r\n				&lt;/tbody&gt;\r\n			&lt;/table&gt;\r\n\r\n			&lt;table border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; width=&quot;560&quot;&gt;\r\n				&lt;tbody&gt;\r\n					&lt;tr&gt;\r\n						&lt;td&gt;&lt;a href=&quot;http://email.ck.com/a/hBR5RmnB7bUTCB8z6FDNskwlTgQ/semi18-0&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;CALVIN KLEIN&quot; border=&quot;0&quot; height=&quot;75&quot; src=&quot;http://f.chtah.com/i/46/2070758594/20130716_ck_ecom_09.jpg&quot; style=&quot;display:block&quot; width=&quot;158&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n						&lt;td&gt;&lt;img alt=&quot;&quot; height=&quot;75&quot; src=&quot;http://f.chtah.com/i/46/2070758594/20130716_ck_ecom_10.jpg&quot; style=&quot;display:block&quot; width=&quot;402&quot; /&gt;&lt;/td&gt;\r\n					&lt;/tr&gt;\r\n				&lt;/tbody&gt;\r\n			&lt;/table&gt;\r\n\r\n			&lt;table border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; width=&quot;560&quot;&gt;\r\n				&lt;tbody&gt;\r\n					&lt;tr&gt;\r\n						&lt;td&gt;&lt;a href=&quot;http://email.ck.com/a/hBR5RmnB7bUTCB8z6FDNskwlTgQ/semi14-0&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;&quot; border=&quot;0&quot; height=&quot;270&quot; src=&quot;http://f.chtah.com/i/46/2070758594/20130716_ck_ecom_11.jpg&quot; style=&quot;display:block&quot; width=&quot;189&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n						&lt;td&gt;&lt;img alt=&quot;SEMI-ANNUAL SALE CONTINUES SAVE UP TO 75% OFF DRESSES + SUIT SEPARATES&quot; height=&quot;270&quot; src=&quot;http://f.chtah.com/i/46/2070758594/20130716_ck_ecom_13.jpg&quot; style=&quot;display:block&quot; width=&quot;186&quot; /&gt;&lt;/td&gt;\r\n						&lt;td&gt;&lt;a href=&quot;http://email.ck.com/a/hBR5RmnB7bUTCB8z6FDNskwlTgQ/semi15-0&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;&quot; border=&quot;0&quot; height=&quot;270&quot; src=&quot;http://f.chtah.com/i/46/2070758594/20130716_ck_ecom_13-14.jpg&quot; style=&quot;display:block&quot; width=&quot;185&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n					&lt;/tr&gt;\r\n				&lt;/tbody&gt;\r\n			&lt;/table&gt;\r\n\r\n			&lt;table border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; width=&quot;560&quot;&gt;\r\n				&lt;tbody&gt;\r\n					&lt;tr&gt;\r\n						&lt;td&gt;&lt;a href=&quot;http://email.ck.com/a/hBR5RmnB7bUTCB8z6FDNskwlTgQ/semi14-0&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;&quot; border=&quot;0&quot; height=&quot;20&quot; src=&quot;http://f.chtah.com/i/46/2070758594/20130716_ck_ecom_14.jpg&quot; style=&quot;display:block&quot; width=&quot;190&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n						&lt;td&gt;&lt;a href=&quot;http://email.ck.com/a/hBR5RmnB7bUTCB8z6FDNskwlTgQ/semi13-0&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;SHOP DRESSES&quot; border=&quot;0&quot; height=&quot;20&quot; src=&quot;http://f.chtah.com/i/46/2070758594/20130716_ck_ecom_15.jpg&quot; style=&quot;display:block&quot; width=&quot;185&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n						&lt;td&gt;&lt;a href=&quot;http://email.ck.com/a/hBR5RmnB7bUTCB8z6FDNskwlTgQ/semi15-0&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;&quot; border=&quot;0&quot; height=&quot;20&quot; src=&quot;http://f.chtah.com/i/46/2070758594/20130716_ck_ecom_16.jpg&quot; style=&quot;display:block&quot; width=&quot;185&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n					&lt;/tr&gt;\r\n				&lt;/tbody&gt;\r\n			&lt;/table&gt;\r\n\r\n			&lt;table border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; width=&quot;560&quot;&gt;\r\n				&lt;tbody&gt;\r\n					&lt;tr&gt;\r\n						&lt;td&gt;&lt;a href=&quot;http://email.ck.com/a/hBR5RmnB7bUTCB8z6FDNskwlTgQ/semi14-0&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;&quot; border=&quot;0&quot; height=&quot;20&quot; src=&quot;http://f.chtah.com/i/46/2070758594/20130716_ck_ecom_18.jpg&quot; style=&quot;display:block&quot; width=&quot;189&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n						&lt;td&gt;&lt;img alt=&quot;&quot; height=&quot;20&quot; src=&quot;http://f.chtah.com/i/46/2070758594/20130716_ck_ecom_18-19.jpg&quot; style=&quot;display:block&quot; width=&quot;186&quot; /&gt;&lt;/td&gt;\r\n						&lt;td&gt;&lt;a href=&quot;http://email.ck.com/a/hBR5RmnB7bUTCB8z6FDNskwlTgQ/semi15-0&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;&quot; border=&quot;0&quot; height=&quot;20&quot; src=&quot;http://f.chtah.com/i/46/2070758594/20130716_ck_ecom_19.jpg&quot; style=&quot;display:block&quot; width=&quot;185&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n					&lt;/tr&gt;\r\n				&lt;/tbody&gt;\r\n			&lt;/table&gt;\r\n\r\n			&lt;table border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; width=&quot;560&quot;&gt;\r\n				&lt;tbody&gt;\r\n					&lt;tr&gt;\r\n						&lt;td&gt;&lt;a href=&quot;http://email.ck.com/a/hBR5RmnB7bUTCB8z6FDNskwlTgQ/semi14-0&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;&quot; border=&quot;0&quot; height=&quot;37&quot; src=&quot;http://f.chtah.com/i/46/2070758594/20130716_ck_ecom_21.jpg&quot; style=&quot;display:block&quot; width=&quot;190&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n						&lt;td&gt;&lt;img alt=&quot;&quot; height=&quot;37&quot; src=&quot;http://f.chtah.com/i/46/2070758594/20130716_ck_ecom_21-22.jpg&quot; style=&quot;display:block&quot; width=&quot;44&quot; /&gt;&lt;/td&gt;\r\n						&lt;td&gt;&lt;a href=&quot;http://email.ck.com/a/hBR5RmnB7bUTCB8z6FDNskwlTgQ/semi10-0&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;&quot; border=&quot;0&quot; height=&quot;37&quot; src=&quot;http://f.chtah.com/i/46/2070758594/20130716_ck_ecom_22.jpg&quot; style=&quot;display:block&quot; width=&quot;62&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n						&lt;td&gt;&lt;a href=&quot;http://email.ck.com/a/hBR5RmnB7bUTCB8z6FDNskwlTgQ/semi16-0&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;&quot; border=&quot;0&quot; height=&quot;37&quot; src=&quot;http://f.chtah.com/i/46/2070758594/20130716_ck_ecom_23.jpg&quot; style=&quot;display:block&quot; width=&quot;33&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n						&lt;td&gt;&lt;img alt=&quot;&quot; height=&quot;37&quot; src=&quot;http://f.chtah.com/i/46/2070758594/20130716_ck_ecom_24.jpg&quot; style=&quot;display:block&quot; width=&quot;46&quot; /&gt;&lt;/td&gt;\r\n						&lt;td&gt;&lt;a href=&quot;http://email.ck.com/a/hBR5RmnB7bUTCB8z6FDNskwlTgQ/semi15-0&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;&quot; border=&quot;0&quot; height=&quot;37&quot; src=&quot;http://f.chtah.com/i/46/2070758594/20130716_ck_ecom_25.jpg&quot; style=&quot;display:block&quot; width=&quot;185&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n					&lt;/tr&gt;\r\n				&lt;/tbody&gt;\r\n			&lt;/table&gt;\r\n\r\n			&lt;table border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; width=&quot;560&quot;&gt;\r\n				&lt;tbody&gt;\r\n					&lt;tr&gt;\r\n						&lt;td&gt;&lt;img alt=&quot;&quot; height=&quot;92&quot; src=&quot;http://f.chtah.com/i/46/2070758594/20130716_ck_ecom_26.jpg&quot; style=&quot;display:block&quot; width=&quot;560&quot; /&gt;&lt;/td&gt;\r\n					&lt;/tr&gt;\r\n				&lt;/tbody&gt;\r\n			&lt;/table&gt;\r\n\r\n			&lt;table border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; width=&quot;560&quot;&gt;\r\n				&lt;tbody&gt;\r\n					&lt;tr&gt;\r\n						&lt;td&gt;&lt;img alt=&quot;&quot; height=&quot;33&quot; src=&quot;http://f.chtah.com/i/46/2070758594/20130716_ck_ecom_27.jpg&quot; style=&quot;display:block&quot; width=&quot;71&quot; /&gt;&lt;/td&gt;\r\n						&lt;td&gt;&lt;a href=&quot;http://email.ck.com/a/hBR5RmnB7bUTCB8z6FDNskwlTgQ/semi27-0&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;&quot; border=&quot;0&quot; height=&quot;33&quot; src=&quot;http://f.chtah.com/i/46/2070758594/20130716_ck_ecom_13-29.jpg&quot; style=&quot;display:block&quot; width=&quot;24&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n						&lt;td&gt;&lt;a href=&quot;http://email.ck.com/a/hBR5RmnB7bUTCB8z6FDNskwlTgQ/semi4-0&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;&quot; border=&quot;0&quot; height=&quot;33&quot; src=&quot;http://f.chtah.com/i/46/2070758594/20130716_ck_ecom_14-30.jpg&quot; style=&quot;display:block&quot; width=&quot;26&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n						&lt;td&gt;&lt;a href=&quot;http://email.ck.com/a/hBR5RmnB7bUTCB8z6FDNskwlTgQ/semi1-0&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;&quot; border=&quot;0&quot; height=&quot;33&quot; src=&quot;http://f.chtah.com/i/46/2070758594/20130716_ck_ecom_15-31.jpg&quot; style=&quot;display:block&quot; width=&quot;26&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n						&lt;td&gt;&lt;a href=&quot;http://email.ck.com/a/hBR5RmnB7bUTCB8z6FDNskwlTgQ/semi28-0&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;&quot; border=&quot;0&quot; height=&quot;33&quot; src=&quot;http://f.chtah.com/i/46/2070758594/20130716_ck_ecom_16-32.jpg&quot; style=&quot;display:block&quot; width=&quot;43&quot; /&gt;&lt;/a&gt;&lt;/td&gt;\r\n						&lt;td&gt;&lt;img alt=&quot;&quot; height=&quot;33&quot; src=&quot;http://f.chtah.com/i/46/2070758594/20130716_ck_ecom_32.jpg&quot; style=&quot;display:block&quot; width=&quot;370&quot; /&gt;&lt;/td&gt;\r\n					&lt;/tr&gt;\r\n				&lt;/tbody&gt;\r\n			&lt;/table&gt;\r\n			&amp;nbsp;\r\n\r\n			&lt;table border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; width=&quot;560&quot;&gt;\r\n				&lt;tbody&gt;\r\n					&lt;tr&gt;\r\n						&lt;td align=&quot;left&quot;&gt;&lt;br /&gt;\r\n						&lt;font color=&quot;#999999&quot; face=&quot;Arial, Helvetica, sans-serif&quot; size=&quot;1&quot;&gt;Please add &lt;a href=&quot;mailto:calvinkleinonline@email.ck.com&quot; style=&quot;COLOR:#999999;TEXT-DECORATION:underline&quot; target=&quot;_blank&quot;&gt;calvinkleinonline@email.ck.com&lt;/a&gt; to your address book to ensure inbox delivery.&lt;br /&gt;\r\n						&lt;br /&gt;\r\n						&lt;font color=&quot;#999999&quot; face=&quot;Arial, Helvetica, sans-serif&quot; size=&quot;1&quot;&gt;Receive $25 for every $250 you spend as a member of the Calvin Klein Preferred Program. &lt;a href=&quot;http://email.ck.com/a/hBR5RmnB7bUTCB8z6FDNskwlTgQ/semi26-0&quot; style=&quot;COLOR:#00000;TEXT-DECORATION:underline&quot; target=&quot;_blank&quot;&gt;Sign up today.&lt;/a&gt;&lt;/font&gt;&lt;/font&gt;&lt;/td&gt;\r\n					&lt;/tr&gt;\r\n					&lt;tr&gt;\r\n						&lt;td align=&quot;left&quot;&gt;&lt;br /&gt;\r\n						&lt;font color=&quot;#999999&quot; face=&quot;Arial, Helvetica, sans-serif&quot; size=&quot;1&quot;&gt;&lt;a href=&quot;http://email.ck.com/a/hBR5RmnB7bUTCB8z6FDNskwlTgQ/semi24-0&quot; style=&quot;COLOR:#999999;TEXT-DECORATION:underline&quot; target=&quot;_blank&quot;&gt;Find the Retail or Company Store Nearest You&lt;/a&gt;&lt;br /&gt;\r\n						&lt;br /&gt;\r\n						You''ve registered to receive Calvin Klein emails. &lt;a href=&quot;http://email.ck.com/a/hBR5RmnB7bUTCB8z6FDNskwlTgQ/semi3-0?password=B7bUTCNskwlTBR5RmnXu1VYBaBSEHQ&quot; style=&quot;COLOR:#999999;TEXT-DECORATION:underline&quot; target=&quot;_blank&quot;&gt;UPDATE YOUR PREFERENCES&lt;/a&gt;&lt;br /&gt;\r\n						&lt;br /&gt;\r\n						View our &lt;a href=&quot;http://email.ck.com/a/hBR5RmnB7bUTCB8z6FDNskwlTgQ/semi17-0&quot; style=&quot;COLOR:#999999;TEXT-DECORATION:underline&quot; target=&quot;_blank&quot;&gt;privacy policy.&lt;/a&gt;&lt;br /&gt;\r\n						&lt;br /&gt;\r\n						Calvin Klein, 205 West 39th Street, New York, NY 10018 &lt;/font&gt;&lt;/td&gt;\r\n					&lt;/tr&gt;\r\n				&lt;/tbody&gt;\r\n			&lt;/table&gt;\r\n			&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n	&lt;/tbody&gt;\r\n&lt;/table&gt;\r\n&lt;img src=&quot;http://email.ck.com/a/hBR5RmnB7bUTCB8z6FDNskwlTgQ/spacer-0.gif&quot; /&gt;\r\n&lt;div class=&quot;yj6qo&quot;&gt;&amp;nbsp;&lt;/div&gt;\r\n\r\n&lt;div class=&quot;adL&quot;&gt;&amp;nbsp;&lt;/div&gt;\r\n&lt;/div&gt;\r\n', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `news_related`
--

CREATE TABLE IF NOT EXISTS `news_related` (
  `news_id` int(11) NOT NULL,
  `related_id` int(11) NOT NULL,
  PRIMARY KEY (`news_id`,`related_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `news_tag`
--

CREATE TABLE IF NOT EXISTS `news_tag` (
  `news_tag_id` int(11) NOT NULL AUTO_INCREMENT,
  `news_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `tag` varchar(32) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`news_tag_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=19 ;

-- --------------------------------------------------------

--
-- Table structure for table `news_to_category`
--

CREATE TABLE IF NOT EXISTS `news_to_category` (
  `news_id` int(11) NOT NULL,
  `news_category_id` int(11) NOT NULL,
  PRIMARY KEY (`news_id`,`news_category_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `news_to_category`
--

INSERT INTO `news_to_category` (`news_id`, `news_category_id`) VALUES
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(17, 1),
(18, 1),
(19, 1),
(21, 1),
(22, 1),
(23, 1),
(24, 1),
(25, 1),
(26, 1),
(27, 1),
(28, 1),
(29, 1);

-- --------------------------------------------------------

--
-- Table structure for table `news_to_layout`
--

CREATE TABLE IF NOT EXISTS `news_to_layout` (
  `news_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL,
  PRIMARY KEY (`news_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `news_to_store`
--

CREATE TABLE IF NOT EXISTS `news_to_store` (
  `news_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`news_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `news_to_store`
--

INSERT INTO `news_to_store` (`news_id`, `store_id`) VALUES
(13, 0),
(14, 0),
(15, 0),
(16, 0),
(17, 0),
(18, 0),
(19, 0),
(21, 0),
(22, 0),
(23, 0),
(24, 0),
(25, 0),
(26, 0),
(27, 0),
(28, 0),
(29, 0);

-- --------------------------------------------------------

--
-- Table structure for table `option`
--

CREATE TABLE IF NOT EXISTS `option` (
  `option_id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(32) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`option_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=17 ;

--
-- Dumping data for table `option`
--

INSERT INTO `option` (`option_id`, `type`, `sort_order`) VALUES
(16, 'radio', 5),
(14, 'radio', 2),
(15, 'radio', 3),
(13, 'image', 1);

-- --------------------------------------------------------

--
-- Table structure for table `option_description`
--

CREATE TABLE IF NOT EXISTS `option_description` (
  `option_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`option_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `option_description`
--

INSERT INTO `option_description` (`option_id`, `language_id`, `name`) VALUES
(16, 2, 'Kích cỡ khác:'),
(14, 2, 'Kích cỡ theo chữ'),
(15, 2, 'Kích cỡ theo số'),
(13, 2, 'Màu Sắc');

-- --------------------------------------------------------

--
-- Table structure for table `option_value`
--

CREATE TABLE IF NOT EXISTS `option_value` (
  `option_value_id` int(11) NOT NULL AUTO_INCREMENT,
  `option_id` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`option_value_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=97 ;

--
-- Dumping data for table `option_value`
--

INSERT INTO `option_value` (`option_value_id`, `option_id`, `image`, `sort_order`) VALUES
(52, 13, 'data/colors/xanh_muoc_bien.png', 4),
(53, 13, 'data/colors/teal.png', 5),
(51, 13, 'data/colors/xam.png', 3),
(50, 13, 'data/colors/mau_nau.png', 2),
(49, 13, 'data/colors/black.png', 1),
(54, 13, 'data/colors/xanh_la_cay.png', 6),
(55, 13, 'data/colors/da_cam.png', 7),
(56, 13, 'data/colors/do.png', 8),
(57, 13, 'data/colors/hong.png', 9),
(58, 13, 'data/colors/tim.png', 10),
(59, 14, '', 1),
(60, 14, '', 2),
(61, 14, '', 3),
(62, 14, '', 4),
(63, 14, '', 5),
(64, 14, '', 6),
(65, 14, '', 7),
(66, 14, '', 8),
(74, 15, 'no_image.jpg', 0),
(73, 15, 'no_image.jpg', 0),
(72, 15, 'no_image.jpg', 0),
(71, 15, 'no_image.jpg', 0),
(70, 15, 'no_image.jpg', 0),
(69, 15, 'no_image.jpg', 0),
(68, 15, 'no_image.jpg', 0),
(67, 15, 'no_image.jpg', 0),
(89, 16, 'no_image.jpg', 0),
(88, 16, 'no_image.jpg', 0),
(87, 16, 'no_image.jpg', 0),
(86, 16, 'no_image.jpg', 0),
(85, 16, 'no_image.jpg', 0),
(84, 16, 'no_image.jpg', 0),
(83, 16, 'no_image.jpg', 0),
(82, 16, 'no_image.jpg', 0),
(90, 16, 'no_image.jpg', 0),
(91, 16, 'no_image.jpg', 0),
(92, 16, 'no_image.jpg', 0),
(93, 16, 'no_image.jpg', 0),
(94, 16, 'no_image.jpg', 0),
(95, 16, 'no_image.jpg', 0),
(96, 16, 'no_image.jpg', 0),
(75, 15, 'no_image.jpg', 0),
(76, 15, 'no_image.jpg', 0),
(77, 15, 'no_image.jpg', 0),
(78, 15, 'no_image.jpg', 0),
(79, 15, 'no_image.jpg', 0),
(80, 15, 'no_image.jpg', 0),
(81, 15, 'no_image.jpg', 0);

-- --------------------------------------------------------

--
-- Table structure for table `option_value_description`
--

CREATE TABLE IF NOT EXISTS `option_value_description` (
  `option_value_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`option_value_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `option_value_description`
--

INSERT INTO `option_value_description` (`option_value_id`, `language_id`, `option_id`, `name`) VALUES
(54, 2, 13, 'Xanh lá cây'),
(55, 2, 13, 'Da cam'),
(53, 2, 13, 'Xanh dương'),
(52, 2, 13, 'Xanh nước biển'),
(51, 2, 13, 'Xám tro'),
(50, 2, 13, 'Nâu'),
(49, 2, 13, 'Đen'),
(56, 2, 13, 'Đỏ'),
(57, 2, 13, 'Hồng'),
(58, 2, 13, 'Tím'),
(59, 2, 14, 'XXXXL'),
(60, 2, 14, 'XS'),
(61, 2, 14, 'S'),
(62, 2, 14, 'M'),
(63, 2, 14, 'L'),
(64, 2, 14, 'XL'),
(65, 2, 14, 'XXL'),
(66, 2, 14, 'XXXL'),
(81, 2, 15, '40'),
(80, 2, 15, '39'),
(79, 2, 15, '38'),
(78, 2, 15, '37'),
(77, 2, 15, '36'),
(76, 2, 15, '35'),
(75, 2, 15, '34'),
(74, 2, 15, '33'),
(73, 2, 15, '32'),
(72, 2, 15, '31'),
(71, 2, 15, '30'),
(70, 2, 15, '29'),
(69, 2, 15, '28'),
(68, 2, 15, '27'),
(67, 2, 15, '26'),
(94, 2, 16, 'M'),
(93, 2, 16, 'L'),
(92, 2, 16, 'B80'),
(91, 2, 16, 'B75'),
(90, 2, 16, 'B70'),
(89, 2, 16, 'A85'),
(88, 2, 16, 'A80'),
(87, 2, 16, 'A75'),
(86, 2, 16, '4-XL'),
(85, 2, 16, '3-L'),
(84, 2, 16, '2-M'),
(83, 2, 16, '1-S'),
(82, 2, 16, '0-XS'),
(95, 2, 16, 'Onesize'),
(96, 2, 16, 'S');

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE IF NOT EXISTS `order` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `invoice_no` int(11) NOT NULL DEFAULT '0',
  `invoice_prefix` varchar(26) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT '0',
  `store_name` varchar(64) NOT NULL,
  `store_url` varchar(255) NOT NULL,
  `customer_id` int(11) NOT NULL DEFAULT '0',
  `customer_group_id` int(11) NOT NULL DEFAULT '0',
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `fax` varchar(32) NOT NULL,
  `payment_firstname` varchar(32) NOT NULL,
  `payment_lastname` varchar(32) NOT NULL,
  `payment_company` varchar(32) NOT NULL,
  `payment_company_id` varchar(32) NOT NULL,
  `payment_tax_id` varchar(32) NOT NULL,
  `payment_address_1` varchar(128) NOT NULL,
  `payment_address_2` varchar(128) NOT NULL,
  `payment_city` varchar(128) NOT NULL,
  `payment_postcode` varchar(10) NOT NULL,
  `payment_country` varchar(128) NOT NULL,
  `payment_country_id` int(11) NOT NULL,
  `payment_zone` varchar(128) NOT NULL,
  `payment_zone_id` int(11) NOT NULL,
  `payment_address_format` text NOT NULL,
  `payment_method` varchar(128) NOT NULL,
  `payment_code` varchar(128) NOT NULL,
  `shipping_firstname` varchar(32) NOT NULL,
  `shipping_lastname` varchar(32) NOT NULL,
  `shipping_company` varchar(32) NOT NULL,
  `shipping_address_1` varchar(128) NOT NULL,
  `shipping_address_2` varchar(128) NOT NULL,
  `shipping_city` varchar(128) NOT NULL,
  `shipping_postcode` varchar(10) NOT NULL,
  `shipping_country` varchar(128) NOT NULL,
  `shipping_country_id` int(11) NOT NULL,
  `shipping_zone` varchar(128) NOT NULL,
  `shipping_zone_id` int(11) NOT NULL,
  `shipping_address_format` text NOT NULL,
  `shipping_method` varchar(128) NOT NULL,
  `shipping_code` varchar(128) NOT NULL,
  `comment` text NOT NULL,
  `total` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `order_status_id` int(11) NOT NULL DEFAULT '0',
  `affiliate_id` int(11) NOT NULL,
  `commission` decimal(15,4) NOT NULL,
  `language_id` int(11) NOT NULL,
  `currency_id` int(11) NOT NULL,
  `currency_code` varchar(3) NOT NULL,
  `currency_value` decimal(15,8) NOT NULL DEFAULT '1.00000000',
  `ip` varchar(40) NOT NULL,
  `forwarded_ip` varchar(40) NOT NULL,
  `user_agent` varchar(255) NOT NULL,
  `accept_language` varchar(255) NOT NULL,
  `note` varchar(255) DEFAULT '',
  `note_shipping_fee` text,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=77 ;

--
-- Dumping data for table `order`
--

INSERT INTO `order` (`order_id`, `invoice_no`, `invoice_prefix`, `store_id`, `store_name`, `store_url`, `customer_id`, `customer_group_id`, `firstname`, `lastname`, `email`, `telephone`, `fax`, `payment_firstname`, `payment_lastname`, `payment_company`, `payment_company_id`, `payment_tax_id`, `payment_address_1`, `payment_address_2`, `payment_city`, `payment_postcode`, `payment_country`, `payment_country_id`, `payment_zone`, `payment_zone_id`, `payment_address_format`, `payment_method`, `payment_code`, `shipping_firstname`, `shipping_lastname`, `shipping_company`, `shipping_address_1`, `shipping_address_2`, `shipping_city`, `shipping_postcode`, `shipping_country`, `shipping_country_id`, `shipping_zone`, `shipping_zone_id`, `shipping_address_format`, `shipping_method`, `shipping_code`, `comment`, `total`, `order_status_id`, `affiliate_id`, `commission`, `language_id`, `currency_id`, `currency_code`, `currency_value`, `ip`, `forwarded_ip`, `user_agent`, `accept_language`, `note`, `note_shipping_fee`, `date_added`, `date_modified`) VALUES
(29, 0, 'INV-2013-00', 0, 'Đặt hàng quốc tế', 'http://localhost/weorder/', 3, 1, 'Son Tran', '', 'abc2@abc.com', '099999', '', 'Son Tran', '', '', '', '', 'Tu son', '', '', '', 'Viet Nam', 230, 'Bac Ninh', 3755, '', '', '', 'Son Tran', '', '', 'Tu son', '', '', '', 'Viet Nam', 230, 'Bac Ninh', 3755, '', '', '', '', '650000.0000', 1, 0, '0.0000', 2, 4, 'VND', '1.00000000', '::1', '', 'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0', 'en-US,en;q=0.5', NULL, NULL, '2013-06-16 23:43:20', '2013-06-16 23:43:20'),
(30, 0, 'INV-2013-00', 0, 'Đặt hàng quốc tế', 'http://localhost/weorder/', 3, 1, 'Son Tran', '', 'abc2@abc.com', '099999', '', 'Son Tran', '', '', '', '', 'Tu son', '', '', '', 'Viet Nam', 230, 'Bac Ninh', 3755, '', '', '', 'Son Tran', '', '', 'Tu son', '', '', '', 'Viet Nam', 230, 'Bac Ninh', 3755, '', '', '', '', '650000.0000', 1, 0, '0.0000', 2, 4, 'VND', '1.00000000', '::1', '', 'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0', 'en-US,en;q=0.5', NULL, NULL, '2013-06-16 23:43:33', '2013-06-16 23:43:33'),
(28, 0, 'INV-2013-00', 0, 'Đặt hàng quốc tế', 'http://localhost/weorder/', 3, 1, 'Son Tran', '', 'abc2@abc.com', '099999', '', 'Son Tran', '', '', '', '', 'Tu son', '', '', '', 'Viet Nam', 230, 'Bac Ninh', 3755, '', '', '', 'Son Tran', '', '', 'Tu son', '', '', '', 'Viet Nam', 230, 'Bac Ninh', 3755, '', '', '', '', '650000.0000', 1, 0, '0.0000', 2, 4, 'VND', '1.00000000', '::1', '', 'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0', 'en-US,en;q=0.5', NULL, NULL, '2013-06-16 23:43:18', '2013-06-16 23:43:18'),
(27, 0, 'INV-2013-00', 0, 'Đặt hàng quốc tế', 'http://localhost/weorder/', 3, 1, 'Son Tran', '', 'abc2@abc.com', '099999', '', 'Son Tran', '', '', '', '', 'Tu son', '', '', '', 'Viet Nam', 230, 'Bac Ninh', 3755, '', '', '', 'Son Tran', '', '', 'Tu son', '', '', '', 'Viet Nam', 230, 'Bac Ninh', 3755, '', '', '', '', '650000.0000', 1, 0, '0.0000', 2, 4, 'VND', '1.00000000', '::1', '', 'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0', 'en-US,en;q=0.5', NULL, NULL, '2013-06-16 23:38:54', '2013-06-16 23:38:54'),
(26, 0, 'INV-2013-00', 0, 'Đặt hàng quốc tế', 'http://localhost/weorder/', 8, 1, 'SƠn Trần', '', 'abc5@abc.com', '92385325', '', 'SƠn Trần', '', '', '', '', '346475865', '', '', '', 'Viet Nam', 230, 'Bac Ninh', 3755, '', '', '', 'SƠn Trần', '', '', '346475865', '', '', '', 'Viet Nam', 230, 'Bac Ninh', 3755, '', '', '', '', '390000.0000', 1, 0, '0.0000', 2, 4, 'VND', '1.00000000', '::1', '', 'Mozilla/5.0 (Windows NT 6.2; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/27.0.1453.94 Safari/537.36', 'en-US,en;q=0.8', NULL, NULL, '2013-06-16 22:57:57', '2013-06-16 22:57:57'),
(25, 0, 'INV-2013-00', 0, 'Đặt hàng quốc tế', 'http://localhost/weorder/', 9, 1, 'Testing...', '', 'hhh@abc.com', '3546436', '', 'Testing...', '', '', '', '', '363464', '', '', '', 'Viet Nam', 230, 'Bac Ninh', 3755, '', '', '', 'Testing...', '', '', '363464', '', '', '', 'Viet Nam', 230, 'Bac Ninh', 3755, '', '', '', '', '690000.0000', 1, 0, '0.0000', 2, 4, 'VND', '1.00000000', '::1', '', 'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0', 'en-US,en;q=0.5', NULL, NULL, '2013-06-16 20:40:00', '2013-06-16 20:40:00'),
(24, 0, 'INV-2013-00', 0, 'Đặt hàng quốc tế', 'http://localhost/weorder/', 9, 1, 'Testing...', '', 'hhh@abc.com', '3546436', '', 'Testing...', '', '', '', '', '363464', '', '', '', 'Viet Nam', 230, 'Bac Ninh', 3755, '', '', '', 'Testing...', '', '', '363464', '', '', '', 'Viet Nam', 230, 'Bac Ninh', 3755, '', '', '', '', '690000.0000', 1, 0, '0.0000', 2, 4, 'VND', '1.00000000', '::1', '', 'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0', 'en-US,en;q=0.5', NULL, NULL, '2013-06-16 20:38:44', '2013-06-16 20:38:44'),
(23, 0, 'INV-2013-00', 0, 'Đặt hàng quốc tế', 'http://localhost/weorder/', 7, 1, 'User 6', '', 'abhhh@abc.com', '0912222222', '', 'User 6', '', '', '', '', 'uSER 6 ĐỊA CHỈ', '', '', '', 'Viet Nam', 230, 'Binh Dinh', 3758, '', '', '', 'User 6', '', '', 'uSER 6 ĐỊA CHỈ', '', '', '', 'Viet Nam', 230, 'Binh Dinh', 3758, '', '', '', '', '390000.0000', 1, 0, '0.0000', 2, 4, 'VND', '1.00000000', '::1', '', 'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0', 'en-US,en;q=0.5', NULL, NULL, '2013-06-16 20:28:16', '2013-06-16 20:28:16'),
(22, 0, 'INV-2013-00', 0, 'Đặt hàng quốc tế', 'http://localhost/weorder/', 7, 1, 'User 6', '', 'abhhh@abc.com', '0912222222', '', 'User 6', '', '', '', '', 'uSER 6 ĐỊA CHỈ', '', '', '', 'Viet Nam', 230, 'Binh Dinh', 3758, '', '', '', 'User 6', '', '', 'uSER 6 ĐỊA CHỈ', '', '', '', 'Viet Nam', 230, 'Binh Dinh', 3758, '', '', '', '', '390000.0000', 1, 0, '0.0000', 2, 4, 'VND', '1.00000000', '::1', '', 'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0', 'en-US,en;q=0.5', NULL, NULL, '2013-06-16 20:27:58', '2013-06-16 20:27:58'),
(21, 0, 'INV-2013-00', 0, 'Đặt hàng quốc tế', 'http://localhost/weorder/', 7, 1, 'User 6', '', 'abhhh@abc.com', '0912222222', '', 'User 6', '', '', '', '', 'uSER 6 ĐỊA CHỈ', '', '', '', 'Viet Nam', 230, 'Binh Dinh', 3758, '', '', '', 'User 6', '', '', 'uSER 6 ĐỊA CHỈ', '', '', '', 'Viet Nam', 230, 'Binh Dinh', 3758, '', '', '', '', '390000.0000', 1, 0, '0.0000', 2, 4, 'VND', '1.00000000', '::1', '', 'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0', 'en-US,en;q=0.5', NULL, NULL, '2013-06-16 20:27:57', '2013-06-16 20:27:57'),
(20, 0, 'INV-2013-00', 0, 'Đặt hàng quốc tế', 'http://localhost/weorder/', 8, 1, 'SƠn Trần', '', 'abc5@abc.com', '92385325', '', 'SƠn Trần', '', '', '', '', '346475865', '', '', '', 'Viet Nam', 230, 'Bac Ninh', 3755, '', '', '', 'SƠn Trần', '', '', '346475865', '', '', '', 'Viet Nam', 230, 'Bac Ninh', 3755, '', '', '', '', '390000.0000', 1, 0, '0.0000', 2, 4, 'VND', '1.00000000', '::1', '', 'Mozilla/5.0 (Windows NT 6.2; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/27.0.1453.94 Safari/537.36', 'en-US,en;q=0.8', NULL, NULL, '2013-06-16 20:26:35', '2013-06-16 20:26:35'),
(19, 0, 'INV-2013-00', 0, 'Đặt hàng quốc tế', 'http://localhost/weorder/', 7, 1, 'User 6', '', 'abhhh@abc.com', '0912222222', '', 'User 6', '', '', '', '', 'uSER 6 ĐỊA CHỈ', '', '', '', 'Viet Nam', 230, 'Binh Dinh', 3758, '', '', '', 'User 6', '', '', 'uSER 6 ĐỊA CHỈ', '', '', '', 'Viet Nam', 230, 'Binh Dinh', 3758, '', '', '', '', '390000.0000', 1, 0, '0.0000', 2, 4, 'VND', '1.00000000', '::1', '', 'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0', 'en-US,en;q=0.5', NULL, NULL, '2013-06-16 20:18:06', '2013-06-16 20:18:06'),
(18, 0, 'INV-2013-00', 0, 'Đặt hàng quốc tế', 'http://localhost/weorder/', 7, 1, 'User 6', '', 'abhhh@abc.com', '0912222222', '', 'User 6', '', '', '', '', 'uSER 6 ĐỊA CHỈ', '', '', '', 'Viet Nam', 230, 'Binh Dinh', 3758, '', '', '', 'User 6', '', '', 'uSER 6 ĐỊA CHỈ', '', '', '', 'Viet Nam', 230, 'Binh Dinh', 3758, '', '', '', '', '390000.0000', 1, 0, '0.0000', 2, 4, 'VND', '1.00000000', '::1', '', 'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0', 'en-US,en;q=0.5', NULL, NULL, '2013-06-16 20:15:42', '2013-06-16 20:15:42'),
(17, 0, 'INV-2013-00', 0, 'Đặt hàng quốc tế', 'http://localhost/weorder/', 6, 1, 'sdgsdgds', '', 'abc32@abc.com', '3532534', '', 'sdgsdgds', '', '', '', '', '2356346457457', '', '', '', 'Viet Nam', 230, 'Bac Ninh', 3755, '', '', '', 'sdgsdgds', '', '', '2356346457457', '', '', '', 'Viet Nam', 230, 'Bac Ninh', 3755, '', '', '', '', '390000.0000', 1, 0, '0.0000', 2, 4, 'VND', '1.00000000', '::1', '', 'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0', 'en-US,en;q=0.5', NULL, NULL, '2013-06-16 20:14:25', '2013-06-16 20:14:25'),
(31, 0, 'INV-2013-00', 0, 'Đặt hàng quốc tế', 'http://localhost/weorder/', 3, 1, 'Son Tran', '', 'abc2@abc.com', '099999', '', 'Son Tran', '', '', '', '', 'Tu son', '', '', '', 'Viet Nam', 230, 'Bac Ninh', 3755, '', '', '', 'Son Tran', '', '', 'Tu son', '', '', '', 'Viet Nam', 230, 'Bac Ninh', 3755, '', '', '', '', '650000.0000', 1, 0, '0.0000', 2, 4, 'VND', '1.00000000', '::1', '', 'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0', 'en-US,en;q=0.5', NULL, NULL, '2013-06-16 23:48:11', '2013-06-16 23:48:11'),
(32, 0, 'INV-2013-00', 0, 'Đặt hàng quốc tế', 'http://localhost/weorder/', 3, 1, 'Son Tran', '', 'abc2@abc.com', '099999', '', 'Son Tran', '', '', '', '', 'Tu son', '', '', '', 'Viet Nam', 230, 'Bac Ninh', 3755, '', '', '', 'Son Tran', '', '', 'Tu son', '', '', '', 'Viet Nam', 230, 'Bac Ninh', 3755, '', '', '', '', '650000.0000', 1, 0, '0.0000', 2, 4, 'VND', '1.00000000', '::1', '', 'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0', 'en-US,en;q=0.5', NULL, NULL, '2013-06-17 00:07:21', '2013-06-17 00:07:21'),
(33, 0, 'INV-2013-00', 0, 'Đặt hàng quốc tế', 'http://localhost/weorder/', 3, 1, 'Son Tran', '', 'abc2@abc.com', '099999', '', 'Son Tran', '', '', '', '', 'Tu son', '', '', '', 'Viet Nam', 230, 'Bac Ninh', 3755, '', '', '', 'Son Tran', '', '', 'Tu son', '', '', '', 'Viet Nam', 230, 'Bac Ninh', 3755, '', '', '', '', '650000.0000', 1, 0, '0.0000', 2, 4, 'VND', '1.00000000', '::1', '', 'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0', 'en-US,en;q=0.5', NULL, NULL, '2013-06-17 00:07:36', '2013-06-17 00:07:36'),
(34, 0, 'INV-2013-00', 0, 'Đặt hàng quốc tế', 'http://localhost/weorder/', 3, 1, 'Son Tran', '', 'abc2@abc.com', '099999', '', 'Son Tran', '', '', '', '', 'Tu son', '', '', '', 'Viet Nam', 230, 'Bac Ninh', 3755, '', '', '', 'Son Tran', '', '', 'Tu son', '', '', '', 'Viet Nam', 230, 'Bac Ninh', 3755, '', '', '', '', '650000.0000', 1, 0, '0.0000', 2, 4, 'VND', '1.00000000', '::1', '', 'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0', 'en-US,en;q=0.5', NULL, NULL, '2013-06-17 00:07:38', '2013-06-17 00:07:38'),
(35, 0, 'INV-2013-00', 0, 'Đặt hàng quốc tế', 'http://localhost/weorder/', 3, 1, 'Son Tran', '', 'abc2@abc.com', '099999', '', 'Son Tran', '', '', '', '', 'Tu son', '', '', '', 'Viet Nam', 230, 'Bac Ninh', 3755, '', '', '', 'Son Tran', '', '', 'Tu son', '', '', '', 'Viet Nam', 230, 'Bac Ninh', 3755, '', '', '', '', '650000.0000', 1, 0, '0.0000', 2, 4, 'VND', '1.00000000', '::1', '', 'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0', 'en-US,en;q=0.5', NULL, NULL, '2013-06-17 00:07:46', '2013-06-17 00:07:46'),
(36, 0, 'INV-2013-00', 0, 'Đặt hàng quốc tế', 'http://localhost/weorder/', 3, 1, 'Son Tran', '', 'abc2@abc.com', '099999', '', 'Son Tran', '', '', '', '', 'Tu son', '', '', '', 'Viet Nam', 230, 'Bac Ninh', 3755, '', '', '', 'Son Tran', '', '', 'Tu son', '', '', '', 'Viet Nam', 230, 'Bac Ninh', 3755, '', '', '', '', '650000.0000', 1, 0, '0.0000', 2, 4, 'VND', '1.00000000', '::1', '', 'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0', 'en-US,en;q=0.5', NULL, NULL, '2013-06-17 00:07:48', '2013-06-17 00:07:48'),
(37, 0, 'INV-2013-00', 0, 'Đặt hàng quốc tế', 'http://localhost/weorder/', 3, 1, 'Son Tran', '', 'abc2@abc.com', '099999', '', 'Son Tran', '', '', '', '', 'Tu son', '', '', '', 'Viet Nam', 230, 'Bac Ninh', 3755, '', '', '', 'Son Tran', '', '', 'Tu son', '', '', '', 'Viet Nam', 230, 'Bac Ninh', 3755, '', '', '', '', '650000.0000', 1, 0, '0.0000', 2, 4, 'VND', '1.00000000', '::1', '', 'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0', 'en-US,en;q=0.5', NULL, NULL, '2013-06-17 00:08:21', '2013-06-17 00:08:21'),
(38, 0, 'INV-2013-00', 0, 'Đặt hàng quốc tế', 'http://localhost/weorder/', 3, 1, 'Son Tran', '', 'abc2@abc.com', '099999', '', 'Son Tran', '', '', '', '', 'Từ Sơn', '', '', '', 'Viet Nam', 230, 'Bac Ninh', 3755, '', '', '', 'Son Tran', '', '', 'Tu son', '', '', '', 'Viet Nam', 230, 'Bac Ninh', 3755, '', '', '', '', '2800000.0000', 1, 0, '0.0000', 2, 4, 'VND', '1.00000000', '::1', '', 'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0', 'en-US,en;q=0.5', NULL, NULL, '2013-06-17 00:08:54', '2013-06-23 22:41:40'),
(39, 0, 'INV-2013-00', 0, 'Đặt hàng quốc tế', 'http://localhost/weorder/', 3, 1, 'Son Tran', '', 'abc2@abc.com', '099999', '', 'Son Tran', '', '', '', '', 'Tu son', '', '', '', 'Viet Nam', 230, 'Bac Ninh', 3755, '', '', '', 'Son Tran', '', '', 'Tu son', '', '', '', 'Viet Nam', 230, 'Bac Ninh', 3755, '', '', '', '', '690000.0000', 1, 0, '0.0000', 2, 4, 'VND', '1.00000000', '::1', '', 'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0', 'en-US,en;q=0.5', NULL, NULL, '2013-06-20 21:05:16', '2013-06-23 22:41:02'),
(40, 0, 'INV-2013-00', 0, 'Đặt hàng quốc tế', 'http://localhost/weorder/', 10, 1, 'Sơn Trần', '', 'abcd@abc.com', '0900000', '', 'Sơn Trần', '', '', '', '', 'Từ Sơn', '', '', '', 'Viet Nam', 230, 'Bac Ninh', 3755, '', '', '', '', '', '', '', '', '', '', '', 0, '', 0, '{firstname} {lastname}\n{company}\n{address_1}\n{address_2}\n{city} {postcode}\n{zone}\n{country}', '', '', '', '250000.0000', 1, 0, '0.0000', 2, 4, 'VND', '1.00000000', '::1', '', 'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0', 'en-US,en;q=0.5', NULL, NULL, '2013-06-22 22:28:53', '2013-06-23 22:41:07'),
(41, 0, 'INV-2013-00', 0, 'Đặt hàng quốc tế', 'http://localhost/weorder/', 5, 1, 'Son Tran', '', 'abc4@abc.com', '0989999999999999', '', 'Son Tran', '', '', '', '', 'Tu Son Tesging', '', '', '', 'Viet Nam', 230, 'Bac Ninh', 3755, '', '', '', 'Son Tran', '', '', 'Tu Son Tesging', '', '', '', 'Viet Nam', 230, 'Bac Ninh', 3755, '', '', '', '', '100.0000', 1, 0, '0.0000', 2, 4, 'VND', '1.00000000', '::1', '', 'Mozilla/5.0 (Windows NT 6.2; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/27.0.1453.94 Safari/537.36', 'en-US,en;q=0.8', NULL, NULL, '2013-06-23 23:55:57', '2013-06-23 23:55:57'),
(42, 0, 'INV-2013-00', 0, 'Đặt hàng quốc tế', 'http://localhost/weorder/', 5, 1, 'Son Tran', '', 'abc4@abc.com', '0989999999999999', '', 'Son Tran', '', '', '', '', 'Tu Son Tesging', '', '', '', 'Viet Nam', 230, 'Bac Ninh', 3755, '', '', '', '', '', '', '', '', '', '', '', 0, '', 0, '', '', '', '', '202005.0000', 1, 0, '0.0000', 2, 4, 'VND', '1.00000000', '::1', '', 'Mozilla/5.0 (Windows NT 6.2; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/27.0.1453.94 Safari/537.36', 'en-US,en;q=0.8', NULL, NULL, '2013-06-24 00:00:22', '2013-06-24 00:00:22'),
(43, 0, 'INV-2013-00', 0, 'Đặt hàng quốc tế', 'http://localhost/weorder/', 5, 1, 'Son Tran', '', 'abc4@abc.com', '0989999999999999', '', 'Son Tran', '', '', '', '', 'Tu Son Tesging', '', '', '', 'Viet Nam', 230, 'Bac Ninh', 3755, '', '', '', '', '', '', '', '', '', '', '', 0, '', 0, '', '', '', '', '100000.0000', 1, 0, '0.0000', 2, 4, 'VND', '1.00000000', '::1', '', 'Mozilla/5.0 (Windows NT 6.2; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/27.0.1453.94 Safari/537.36', 'en-US,en;q=0.8', NULL, NULL, '2013-06-24 00:03:01', '2013-06-24 00:03:01'),
(44, 0, 'INV-2013-00', 0, 'Đặt hàng quốc tế', 'http://localhost/weorder/', 11, 1, 'Tester', '', 'abc10@abc.com', '235', '', 'Tester', '', '', '', '', '233265', '', '', '', 'Viet Nam', 230, 'Bac Giang', 3752, '', '', '', '', '', '', '', '', '', '', '', 0, '', 0, '', '', '', '', '500000.0000', 1, 0, '0.0000', 2, 4, 'VND', '1.00000000', '::1', '', 'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0', 'en-US,en;q=0.5', NULL, NULL, '2013-06-24 00:07:33', '2013-06-24 00:07:33'),
(45, 0, 'INV-2013-00', 0, 'Đặt hàng quốc tế', 'http://localhost/weorder/', 11, 1, 'Tester', '', 'abc10@abc.com', '235', '', 'Tester', '', '', '', '', '233265', '', '', '', 'Viet Nam', 230, 'Bac Giang', 3752, '', '', '', '', '', '', '', '', '', '', '', 0, '', 0, '', '', '', '', '53.0000', 1, 0, '0.0000', 2, 4, 'VND', '1.00000000', '::1', '', 'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0', 'en-US,en;q=0.5', NULL, NULL, '2013-06-24 00:09:05', '2013-06-24 00:09:05'),
(46, 0, 'INV-2013-00', 0, 'Đặt hàng quốc tế', 'http://localhost/weorder/', 11, 1, 'Tester', '', 'abc10@abc.com', '235', '', 'Tester', '', '', '', '', '233265', '', '', '', 'Viet Nam', 230, 'Bac Giang', 3752, '', '', '', '', '', '', '', '', '', '', '', 0, '', 0, '', '', '', '', '0.0000', 1, 0, '0.0000', 2, 4, 'VND', '1.00000000', '::1', '', 'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0', 'en-US,en;q=0.5', NULL, NULL, '2013-06-24 00:11:32', '2013-06-24 00:11:32'),
(47, 0, 'INV-2013-00', 0, 'Đặt hàng quốc tế', 'http://localhost/weorder/', 11, 1, 'Tester', '', 'abc10@abc.com', '235', '', 'Tester', '', '', '', '', '233265', '', '', '', 'Viet Nam', 230, 'Bac Giang', 3752, '', '', '', '', '', '', '', '', '', '', '', 0, '', 0, '', '', '', '', '250000.0000', 1, 0, '0.0000', 2, 4, 'VND', '1.00000000', '::1', '', 'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0', 'en-US,en;q=0.5', NULL, NULL, '2013-06-24 00:12:30', '2013-06-24 00:12:30'),
(48, 0, 'INV-2013-00', 0, 'Đặt hàng quốc tế', 'http://localhost/weorder/', 11, 1, 'Tester', '', 'abc10@abc.com', '235', '', 'Tester', '', '', '', '', '233265', '', '', '', 'Viet Nam', 230, 'Bac Giang', 3752, '', '', '', 'Tester', '', '', '233265', '', '', '', 'Viet Nam', 230, 'Bac Giang', 3752, '', '', '', '', '690000.0000', 1, 0, '0.0000', 2, 4, 'VND', '1.00000000', '::1', '', 'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0', 'en-US,en;q=0.5', NULL, NULL, '2013-06-24 00:16:32', '2013-06-24 00:16:32'),
(49, 0, 'INV-2013-00', 0, 'Đặt hàng quốc tế', 'http://localhost/weorder/', 11, 1, 'Tester', '', 'abc10@abc.com', '235', '', 'Tester', '', '', '', '', '233265', '', '', '', 'Viet Nam', 230, 'Bac Giang', 3752, '', '', '', 'Tester', '', '', '233265', '', '', '', 'Viet Nam', 230, 'Bac Giang', 3752, '', '', '', '', '690000.0000', 1, 0, '0.0000', 2, 4, 'VND', '1.00000000', '::1', '', 'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0', 'en-US,en;q=0.5', NULL, NULL, '2013-06-24 00:18:14', '2013-06-24 00:18:14'),
(50, 0, 'INV-2013-00', 0, 'Đặt hàng quốc tế', 'http://localhost/weorder/', 11, 1, 'Tester', '', 'abc10@abc.com', '235', '', 'Tester', '', '', '', '', '233265', '', '', '', 'Viet Nam', 230, 'Bac Giang', 3752, '', '', '', 'Tester', '', '', '233265', '', '', '', 'Viet Nam', 230, 'Bac Giang', 3752, '', '', '', '', '390000.0000', 1, 0, '0.0000', 2, 4, 'VND', '1.00000000', '::1', '', 'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0', 'en-US,en;q=0.5', NULL, NULL, '2013-06-24 00:18:38', '2013-06-24 00:18:38'),
(51, 0, 'INV-2013-00', 0, 'Đặt hàng quốc tế', 'http://localhost/weorder/', 2, 1, 'Son Tran', '', 'abc@abc.com', '0904449512', '', 'Son Tran', '', '', '', '', 'Từ Sơn - Châu kHêu', '', '', '', 'Viet Nam', 230, 'Can Tho', 3763, '', '', '', 'Son Tran', '', '', 'Từ Sơn - Châu kHêu', '', '', '', 'Viet Nam', 230, 'Can Tho', 3763, '', '', '', '', '690000.0000', 1, 0, '0.0000', 2, 4, 'VND', '1.00000000', '::1', '', 'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0', 'en-US,en;q=0.5', NULL, NULL, '2013-06-25 23:26:33', '2013-06-25 23:26:33'),
(52, 0, 'INV-2013-00', 0, 'Đặt hàng quốc tế', 'http://localhost/weorder/', 1, 1, 'Sơn', 'Trần', 'transontt@gmail.com', '0902222222222', '', 'Sơn', 'Trần', '', '', '', 'Từ SƠn ', '', 'Bắc Ninh', '', 'Viet Nam', 230, 'Bac Ninh', 3755, '', '', '', 'Sơn', 'Trần', '', 'Từ SƠn ', '', 'Bắc Ninh', '', 'Viet Nam', 230, 'Bac Ninh', 3755, '', '', '', '', '10807500.0000', 1, 0, '0.0000', 2, 4, 'VND', '1.00000000', '::1', '', 'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0', 'en-US,en;q=0.5', 'Vui lòng liên hệ với tôi khi có hàng sớm nhất', NULL, '2013-06-26 02:15:31', '2013-06-26 02:15:31'),
(53, 0, 'INV-2013-00', 0, 'Đặt hàng quốc tế', 'http://localhost/weorder/', 1, 1, 'Sơn', 'Trần', 'transontt@gmail.com', '0902222222222', '', 'Sơn', 'Trần', '', '', '', 'Từ SƠn ', '', 'Bắc Ninh', '', 'Viet Nam', 230, 'Bac Ninh', 3755, '', '', '', '', '', '', '', '', '', '', '', 0, '', 0, '', '', '', '', '10437000.0000', 1, 0, '0.0000', 2, 4, 'VND', '1.00000000', '::1', '', 'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0', 'en-US,en;q=0.5', 'Tôi cần giao hàng sớm', NULL, '2013-06-26 23:36:02', '2013-06-26 23:36:02'),
(54, 0, 'INV-2013-00', 0, 'Đặt hàng quốc tế', 'http://localhost/weorder/', 13, 1, 'Gia Bảo', '', 'giabao@abc.com', '09025346456', '', 'Gia Bảo', '', '', '', '', 'Từ Sơn', '', '', '', 'Viet Nam', 230, 'Bac Ninh', 3755, '', '', '', '', '', '', '', '', '', '', '', 0, '', 0, '', '', '', '', '852000.0000', 1, 0, '0.0000', 2, 4, 'VND', '1.00000000', '::1', '', 'Mozilla/5.0 (Windows NT 6.2; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/27.0.1453.94 Safari/537.36', 'en-US,en;q=0.8', '', NULL, '2013-06-30 12:30:28', '2013-06-30 12:30:28'),
(55, 0, 'INV-2013-00', 0, 'Đặt hàng quốc tế', 'http://localhost/weorder/', 1, 1, 'Sơn Trần', '', 'transontt@gmail.com', '0902222222222', '', 'Sơn', 'Trần', '', '', '', 'Từ SƠn ', '', 'Bắc Ninh', '', 'Viet Nam', 230, 'Bac Ninh', 3755, '', '', '', 'Sơn', 'Trần', '', 'Từ SƠn ', '', 'Bắc Ninh', '', 'Viet Nam', 230, 'Bac Ninh', 3755, '', '', '', '', '690000.0000', 1, 0, '0.0000', 2, 4, 'VND', '1.00000000', '::1', '', 'Mozilla/5.0 (Windows NT 6.2; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/27.0.1453.94 Safari/537.36', 'en-US,en;q=0.8', 'Tesing note', NULL, '2013-06-30 15:18:46', '2013-06-30 15:18:46'),
(56, 0, 'INV-2013-00', 0, 'Đặt hàng quốc tế', 'http://localhost/weorder/', 14, 1, 'Testing 2', '', 'dsgsdg@gsdgsd.sdg', '3464576457', '', 'sdgsdh', '', '', '', '', '457', '', '', '', 'Viet Nam', 230, 'Binh Phuoc', 3760, '', '', '', '', '', '', '', '', '', '', '', 0, '', 0, '{firstname} {lastname}\n{company}\n{address_1}\n{address_2}\n{city} {postcode}\n{zone}\n{country}', '', '', '', '63692.0000', 1, 0, '0.0000', 2, 4, 'VND', '1.00000000', '::1', '', 'Mozilla/5.0 (Windows NT 6.2; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/27.0.1453.94 Safari/537.36', 'en-US,en;q=0.8', '', NULL, '2013-07-04 20:45:22', '2013-07-04 22:22:55'),
(57, 0, 'INV-2013-00', 0, 'Đặt hàng quốc tế', 'http://localhost/weorder/', 15, 1, 'Testing', '', 'ddd@gsdg.com', '346457', '', 'Testing', '', '', '', '', 'sdghdh', '', '', '', 'Viet Nam', 230, 'Ca Mau', 3762, '', '', '', 'Testing', '', '', 'sdghdh', '', '', '', 'Viet Nam', 230, 'Ca Mau', 3762, '', '', '', '', '705000.0000', 18, 0, '0.0000', 2, 4, 'VND', '1.00000000', '::1', '', 'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:23.0) Gecko/20100101 Firefox/23.0', 'en-US,en;q=0.5', '', NULL, '2013-07-04 22:08:18', '2013-07-11 23:59:48'),
(58, 0, 'INV-2013-00', 0, 'Đặt hàng quốc tế', 'http://localhost/weorder/', 15, 1, 'fđfh', '', 'ddd@gsdg.com', '346457', '', 'fđfh', '', '', '', '', 'sdghdh', '', '', '', 'Viet Nam', 230, 'Ca Mau', 3762, '', '', '', '', '', '', '', '', '', '', '', 0, '', 0, '{firstname} {lastname}\n{company}\n{address_1}\n{address_2}\n{city} {postcode}\n{zone}\n{country}', '', '', '', '1853668.0000', 18, 0, '0.0000', 2, 4, 'VND', '1.00000000', '::1', '', 'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:23.0) Gecko/20100101 Firefox/23.0', 'en-US,en;q=0.5', '', NULL, '2013-07-04 23:12:02', '2013-07-11 23:55:15'),
(59, 0, 'INV-2013-00', 0, 'Đặt hàng quốc tế', 'http://localhost/weorder/', 1, 1, 'Sơn Trần', '', 'transontt@gmail.com', '0902222222222', '', 'Sơn', '', '', '', '', 'Từ SƠn ', '', 'Bắc Ninh', '', 'Viet Nam', 230, 'Bac Ninh', 3755, '', '', '', 'Sơn', '', '', 'Từ SƠn ', '', 'Bắc Ninh', '', 'Viet Nam', 230, 'Bac Ninh', 3755, '', '', '', '', '1300000.0000', 21, 0, '0.0000', 2, 4, 'VND', '1.00000000', '::1', '', 'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:23.0) Gecko/20100101 Firefox/23.0', 'en-US,en;q=0.5', '', NULL, '2013-07-09 21:04:42', '2013-07-12 00:00:30'),
(60, 0, 'INV-2013-00', 0, 'Đặt hàng quốc tế', 'http://localhost/weorder/', 1, 1, 'Sơn Trần', '', 'transontt@gmail.com', '0902222222222', '', 'Sơn', '', '', '', '', 'Từ SƠn ', '', 'Bắc Ninh', '', 'Viet Nam', 230, 'Bac Ninh', 3755, '', '', '', 'Sơn', '', '', 'Từ SƠn ', '', 'Bắc Ninh', '', 'Viet Nam', 230, 'Bac Ninh', 3755, '', '', '', '', '1250000.0000', 1, 0, '0.0000', 2, 4, 'VND', '1.00000000', '::1', '', 'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:23.0) Gecko/20100101 Firefox/23.0', 'en-US,en;q=0.5', '', NULL, '2013-07-12 00:01:27', '2013-07-12 07:39:58'),
(61, 0, 'INV-2013-00', 0, 'Đặt hàng quốc tế', 'http://dathangquocte.vn/', 1, 1, 'Sơn Trần', '', 'transontt@gmail.com', '0902222222222', '', 'Sơn', 'Trần', '', '', '', 'Từ SƠn ', '', 'Bắc Ninh', '', 'Viet Nam', 230, 'Bac Ninh', 3755, '', '', '', 'Sơn', 'Trần', '', 'Từ SƠn ', '', 'Bắc Ninh', '', 'Viet Nam', 230, 'Bac Ninh', 3755, '', '', '', '', '1152000.0000', 18, 0, '0.0000', 2, 4, 'VND', '1.00000000', '117.7.127.11', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0', 'vi-vn,vi;q=0.8,en-us;q=0.5,en;q=0.3', 'Testing', '&lt;p&gt;Phí vận chuyển 1: 1000.000 VNĐ&lt;/p&gt;\r\n\r\n&lt;p&gt;Phí vận chuyển 2: 2000.0000 VNĐ&lt;/p&gt;\r\n', '2013-07-12 07:41:54', '2013-07-14 09:15:25'),
(62, 0, 'INV-2013-00', 0, 'Đặt hàng quốc tế', 'http://dathangquocte.vn/', 17, 1, 'Dương Thượng Hảo', '', 'info@geckomedia.vn', '0936474346', '', 'Dương Thượng Hảo', '', '', '', '', '129 Phan Văn Trường - Cầu Giấy', '', '', '', 'Viet Nam', 230, 'Ha Noi', 3776, '', '', '', 'Dương Thượng Hảo', '', '', '129 Phan Văn Trường - Cầu Giấy', '', '', '', 'Viet Nam', 230, 'Ha Noi', 3776, '', '', '', '', '2720000.0000', 1, 0, '0.0000', 2, 4, 'VND', '1.00000000', '117.7.127.11', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0', 'vi-vn,vi;q=0.8,en-us;q=0.5,en;q=0.3', '', NULL, '2013-07-12 07:50:37', '2013-07-12 07:51:49'),
(63, 0, 'INV-2013-00', 0, 'Đặt hàng quốc tế', 'http://dathangquocte.vn/', 17, 1, 'Dương Thượng Hảo', '', 'info@geckomedia.vn', '0936474346', '', 'Dương Thượng Hảo', '', '', '', '', '129 Phan Văn Trường - Cầu Giấy', '', '', '', 'Viet Nam', 230, 'Ha Noi', 3776, '', '', '', 'Dương Thượng Hảo', '', '', '129 Phan Văn Trường - Cầu Giấy', '', '', '', 'Viet Nam', 230, 'Ha Noi', 3776, '', '', '', '', '1120100.0000', 1, 0, '0.0000', 2, 4, 'VND', '1.00000000', '117.7.127.11', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0', 'vi-vn,vi;q=0.8,en-us;q=0.5,en;q=0.3', '', NULL, '2013-07-12 08:08:51', '2013-07-12 08:08:51'),
(64, 0, 'INV-2013-00', 0, 'Đặt hàng quốc tế', 'http://dathangquocte.vn/', 17, 1, 'Dương Thượng Hảo', '', 'info@geckomedia.vn', '0936474346', '', 'Dương Thượng Hảo', '', '', '', '', '129 Phan Văn Trường - Cầu Giấy', '', '', '', 'Viet Nam', 230, 'Ha Noi', 3776, '', '', '', 'Dương Thượng Hảo', '', '', '129 Phan Văn Trường - Cầu Giấy', '', '', '', 'Viet Nam', 230, 'Ha Noi', 3776, '', '', '', '', '2500000.0000', 18, 0, '0.0000', 2, 4, 'VND', '1.00000000', '117.7.127.11', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0', 'vi-vn,vi;q=0.8,en-us;q=0.5,en;q=0.3', '', NULL, '2013-07-12 09:00:18', '2013-07-12 16:04:36'),
(65, 0, 'INV-2013-00', 0, 'Đặt hàng quốc tế', 'http://dathangquocte.vn/', 18, 1, 'Trần Minh Đức', '', 'duclicogi8999@gmail.com', '0944378999', '', 'Trần Minh Đức', '', '', '', '', '72-Vũ Hữu - Thanh Xuân', '', '', '', 'Viet Nam', 230, 'Ha Noi', 3776, '', '', '', 'Trần Minh Đức', '', '', '72-Vũ Hữu - Thanh Xuân', '', '', '', 'Viet Nam', 230, 'Ha Noi', 3776, '', '', '', '', '6224645.0000', 18, 0, '0.0000', 2, 4, 'VND', '1.00000000', '113.190.254.31', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0', 'vi-vn,vi;q=0.8,en-us;q=0.5,en;q=0.3', '', NULL, '2013-07-12 16:23:53', '2013-07-12 16:33:09'),
(66, 0, 'INV-2013-00', 0, 'Đặt hàng quốc tế', 'http://dathangquocte.vn/', 18, 1, 'Trần Minh Đức', '', 'duclicogi8999@gmail.com', '0944378999', '', 'Trần Minh Đức', '', '', '', '', '72-Vũ Hữu - Thanh Xuân', '', '', '', 'Viet Nam', 230, 'Ha Noi', 3776, '', '', '', 'Trần Minh Đức', '', '', '72-Vũ Hữu - Thanh Xuân', '', '', '', 'Viet Nam', 230, 'Ha Noi', 3776, '', '', '', '', '690000.0000', 18, 0, '0.0000', 2, 4, 'VND', '1.00000000', '113.190.254.31', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/28.0.1500.71 Safari/537.36', 'vi-VN,vi;q=0.8,fr-FR;q=0.6,fr;q=0.4,en-US;q=0.2,en;q=0.2', '', NULL, '2013-07-12 16:57:44', '2013-07-12 21:12:39'),
(67, 0, 'INV-2013-00', 0, 'Đặt hàng quốc tế', 'http://dathangquocte.vn/', 19, 1, 'Ngoc Anh', '', 'ngocanh82@gmail.com', '0983886601', '', 'Ngoc Anh', '', '', '', '', '303 CT8 ĐỊnh Công', '', '', '', 'Viet Nam', 230, 'Ha Noi', 3776, '', '', '', '', '', '', '', '', '', '', '', 0, '', 0, '{firstname} {lastname}\n{company}\n{address_1}\n{address_2}\n{city} {postcode}\n{zone}\n{country}', '', '', '', '1204415.0000', 18, 0, '0.0000', 2, 4, 'VND', '1.00000000', '101.99.13.138', '', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_4) AppleWebKit/536.30.1 (KHTML, like Gecko) Version/6.0.5 Safari/536.30.1', 'en-us', '', NULL, '2013-07-12 20:51:42', '2013-07-12 21:01:59'),
(68, 0, 'INV-2013-00', 0, 'Đặt hàng quốc tế', 'http://dathangquocte.vn/', 18, 1, 'Trần Minh Đức', '', 'duclicogi8999@gmail.com', '0944378999', '', 'Trần Minh Đức', '', '', '', '', '72-Vũ Hữu - Thanh Xuân', '', '', '', 'Viet Nam', 230, 'Ha Noi', 3776, '', '', '', 'Trần Minh Đức', '', '', '72-Vũ Hữu - Thanh Xuân', '', '', '', 'Viet Nam', 230, 'Ha Noi', 3776, '', '', '', '', '350000.0000', 18, 0, '0.0000', 2, 4, 'VND', '1.00000000', '113.190.254.31', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/28.0.1500.71 Safari/537.36', 'vi-VN,vi;q=0.8,fr-FR;q=0.6,fr;q=0.4,en-US;q=0.2,en;q=0.2', '', NULL, '2013-07-12 21:23:23', '2013-07-12 21:31:51'),
(69, 0, 'INV-2013-00', 0, 'Đặt hàng quốc tế', 'http://dathangquocte.vn/', 17, 1, 'Dương Thượng Hảo', '', 'info@geckomedia.vn', '0936474346', '', 'Dương Thượng Hảo', '', '', '', '', '129 Phan Văn Trường - Cầu Giấy', '', '', '', 'Viet Nam', 230, 'Ha Noi', 3776, '', '', '', 'Dương Thượng Hảo', '', '', '129 Phan Văn Trường - Cầu Giấy', '', '', '', 'Viet Nam', 230, 'Ha Noi', 3776, '', '', '', '', '2290000.0000', 1, 0, '0.0000', 2, 4, 'VND', '1.00000000', '1.55.215.94', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0', 'vi-vn,vi;q=0.8,en-us;q=0.5,en;q=0.3', '', '&lt;p&gt;tổng công là 300k anh chị nhé&lt;/p&gt;\r\n\r\n&lt;p&gt;sản phẩm 1 từ zara ship về hết .200k&lt;/p&gt;\r\n\r\n&lt;p&gt;sản phẩm 2 từ phan nguyễn hêt: 100k&lt;/p&gt;\r\n', '2013-07-13 07:29:44', '2013-07-15 08:14:24'),
(70, 0, 'INV-2013-00', 0, 'Đặt hàng quốc tế', 'http://dathangquocte.vn/', 18, 1, 'Trần Minh Đức', '', 'duclicogi8999@gmail.com', '0944378999', '', 'Trần Minh Đức', '', '', '', '', '72-Vũ Hữu - Thanh Xuân', '', '', '', 'Viet Nam', 230, 'Ha Noi', 3776, '', '', '', 'Trần Minh Đức', '', '', '72-Vũ Hữu - Thanh Xuân', '', '', '', 'Viet Nam', 230, 'Ha Noi', 3776, '', '', '', '', '0.0000', 1, 0, '0.0000', 2, 4, 'VND', '1.00000000', '222.252.85.98', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0', 'vi-vn,vi;q=0.8,en-us;q=0.5,en;q=0.3', '', NULL, '2013-07-14 10:50:58', '2013-07-14 10:50:58'),
(71, 0, 'INV-2013-00', 0, 'Đặt hàng quốc tế', 'http://dathangquocte.vn/', 20, 1, 'Đặng huyền ngọc', '', 'Anne.vy221011@gmail.com', '0934020289', '', 'Đặng huyền ngọc', '', '', '', '', 'Nhà 2,ngách 105/11,ngõ 105 Yên Hoà Cầu Giấy, Hà Nội', '', '', '', 'Viet Nam', 230, 'Ha Noi', 3776, '', '', '', '', '', '', '', '', '', '', '', 0, '', 0, '', '', '', '', '0.0000', 1, 0, '0.0000', 2, 4, 'VND', '1.00000000', '113.190.254.220', '', 'Mozilla/5.0 (iPad; CPU OS 5_1_1 like Mac OS X) AppleWebKit/534.46 (KHTML, like Gecko) Version/5.1 Mobile/9B206 Safari/7534.48.3', 'en-us', '', NULL, '2013-07-14 18:24:52', '2013-07-14 18:24:52'),
(72, 0, 'INV-2013-00', 0, 'Đặt hàng quốc tế', 'http://dathangquocte.vn/', 18, 1, 'Trần Minh Đức', '', 'duclicogi8999@gmail.com', '0944378999', '', 'Trần Minh Đức', '', '', '', '', '72-Vũ Hữu - Thanh Xuân', '', '', '', 'Viet Nam', 230, 'Ha Noi', 3776, '', '', '', 'Trần Minh Đức', '', '', '72-Vũ Hữu - Thanh Xuân', '', '', '', 'Viet Nam', 230, 'Ha Noi', 3776, '', '', '', '', '0.0000', 1, 0, '0.0000', 2, 4, 'VND', '1.00000000', '222.252.86.109', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0', 'vi-vn,vi;q=0.8,en-us;q=0.5,en;q=0.3', '', NULL, '2013-07-15 09:44:35', '2013-07-15 09:44:35'),
(73, 0, 'INV-2013-00', 0, 'Đặt hàng quốc tế', 'http://dathangquocte.vn/', 18, 1, 'Trần Minh Đức', '', 'duclicogi8999@gmail.com', '0944378999', '', 'Trần Minh Đức', '', '', '', '', '72-Vũ Hữu - Thanh Xuân', '', '', '', 'Viet Nam', 230, 'Ha Noi', 3776, '', '', '', 'Trần Minh Đức', '', '', '72-Vũ Hữu - Thanh Xuân', '', '', '', 'Viet Nam', 230, 'Ha Noi', 3776, '', '', '', '', '0.0000', 1, 0, '0.0000', 2, 4, 'VND', '1.00000000', '222.252.86.109', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0', 'vi-vn,vi;q=0.8,en-us;q=0.5,en;q=0.3', '', NULL, '2013-07-15 09:46:16', '2013-07-15 09:46:16'),
(74, 0, 'INV-2013-00', 0, 'Đặt hàng quốc tế', 'http://dathangquocte.vn/', 18, 1, 'Trần Minh Đức', '', 'duclicogi8999@gmail.com', '0944378999', '', 'Trần Minh Đức', '', '', '', '', '72-Vũ Hữu - Thanh Xuân', '', '', '', 'Viet Nam', 230, 'Ha Noi', 3776, '', '', '', 'Trần Minh Đức', '', '', '72-Vũ Hữu - Thanh Xuân', '', '', '', 'Viet Nam', 230, 'Ha Noi', 3776, '', '', '', '', '0.0000', 1, 0, '0.0000', 2, 4, 'VND', '1.00000000', '222.252.86.109', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0', 'vi-vn,vi;q=0.8,en-us;q=0.5,en;q=0.3', '', NULL, '2013-07-15 09:48:16', '2013-07-15 09:48:16'),
(75, 0, 'INV-2013-00', 0, 'Đặt hàng quốc tế', 'http://dathangquocte.vn/', 17, 1, 'Dương Thượng Hảo', '', 'info@geckomedia.vn', '0936474346', '', 'Dương Thượng Hảo', '', '', '', '', '129 Phan Văn Trường - Cầu Giấy', '', '', '', 'Viet Nam', 230, 'Ha Noi', 3776, '', '', '', 'Dương Thượng Hảo', '', '', '129 Phan Văn Trường - Cầu Giấy', '', '', '', 'Viet Nam', 230, 'Ha Noi', 3776, '', '', '', '', '0.0000', 1, 0, '0.0000', 2, 4, 'VND', '1.00000000', '117.7.112.92', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0', 'vi-vn,vi;q=0.8,en-us;q=0.5,en;q=0.3', '', NULL, '2013-07-16 05:57:23', '2013-07-16 05:57:23'),
(76, 0, 'INV-2013-00', 0, 'Đặt hàng quốc tế', 'http://dathangquocte.vn/', 18, 1, 'Trần Minh Đức', '', 'duclicogi8999@gmail.com', '0944378999', '', 'Trần Minh Đức', '', '', '', '', '72-Vũ Hữu - Thanh Xuân', '', '', '', 'Viet Nam', 230, 'Ha Noi', 3776, '', '', '', 'Trần Minh Đức', '', '', '72-Vũ Hữu - Thanh Xuân', '', '', '', 'Viet Nam', 230, 'Ha Noi', 3776, '', '', '', '', '0.0000', 1, 0, '0.0000', 2, 4, 'VND', '1.00000000', '113.190.254.54', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0', 'vi-vn,vi;q=0.8,en-us;q=0.5,en;q=0.3', '', NULL, '2013-07-16 14:14:16', '2013-07-16 14:14:16');

-- --------------------------------------------------------

--
-- Table structure for table `order_download`
--

CREATE TABLE IF NOT EXISTS `order_download` (
  `order_download_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `order_product_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `filename` varchar(128) NOT NULL,
  `mask` varchar(128) NOT NULL,
  `remaining` int(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`order_download_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `order_field`
--

CREATE TABLE IF NOT EXISTS `order_field` (
  `order_id` int(11) NOT NULL,
  `custom_field_id` int(11) NOT NULL,
  `custom_field_value_id` int(11) NOT NULL,
  `name` int(128) NOT NULL,
  `value` text NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`order_id`,`custom_field_id`,`custom_field_value_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `order_fraud`
--

CREATE TABLE IF NOT EXISTS `order_fraud` (
  `order_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `country_match` varchar(3) NOT NULL,
  `country_code` varchar(2) NOT NULL,
  `high_risk_country` varchar(3) NOT NULL,
  `distance` int(11) NOT NULL,
  `ip_region` varchar(255) NOT NULL,
  `ip_city` varchar(255) NOT NULL,
  `ip_latitude` decimal(10,6) NOT NULL,
  `ip_longitude` decimal(10,6) NOT NULL,
  `ip_isp` varchar(255) NOT NULL,
  `ip_org` varchar(255) NOT NULL,
  `ip_asnum` int(11) NOT NULL,
  `ip_user_type` varchar(255) NOT NULL,
  `ip_country_confidence` varchar(3) NOT NULL,
  `ip_region_confidence` varchar(3) NOT NULL,
  `ip_city_confidence` varchar(3) NOT NULL,
  `ip_postal_confidence` varchar(3) NOT NULL,
  `ip_postal_code` varchar(10) NOT NULL,
  `ip_accuracy_radius` int(11) NOT NULL,
  `ip_net_speed_cell` varchar(255) NOT NULL,
  `ip_metro_code` int(3) NOT NULL,
  `ip_area_code` int(3) NOT NULL,
  `ip_time_zone` varchar(255) NOT NULL,
  `ip_region_name` varchar(255) NOT NULL,
  `ip_domain` varchar(255) NOT NULL,
  `ip_country_name` varchar(255) NOT NULL,
  `ip_continent_code` varchar(2) NOT NULL,
  `ip_corporate_proxy` varchar(3) NOT NULL,
  `anonymous_proxy` varchar(3) NOT NULL,
  `proxy_score` int(3) NOT NULL,
  `is_trans_proxy` varchar(3) NOT NULL,
  `free_mail` varchar(3) NOT NULL,
  `carder_email` varchar(3) NOT NULL,
  `high_risk_username` varchar(3) NOT NULL,
  `high_risk_password` varchar(3) NOT NULL,
  `bin_match` varchar(10) NOT NULL,
  `bin_country` varchar(2) NOT NULL,
  `bin_name_match` varchar(3) NOT NULL,
  `bin_name` varchar(255) NOT NULL,
  `bin_phone_match` varchar(3) NOT NULL,
  `bin_phone` varchar(32) NOT NULL,
  `customer_phone_in_billing_location` varchar(8) NOT NULL,
  `ship_forward` varchar(3) NOT NULL,
  `city_postal_match` varchar(3) NOT NULL,
  `ship_city_postal_match` varchar(3) NOT NULL,
  `score` decimal(10,5) NOT NULL,
  `explanation` text NOT NULL,
  `risk_score` decimal(10,5) NOT NULL,
  `queries_remaining` int(11) NOT NULL,
  `maxmind_id` varchar(8) NOT NULL,
  `error` text NOT NULL,
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`order_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `order_history`
--

CREATE TABLE IF NOT EXISTS `order_history` (
  `order_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `order_status_id` int(5) NOT NULL,
  `notify` tinyint(1) NOT NULL DEFAULT '0',
  `comment` text NOT NULL,
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`order_history_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=68 ;

--
-- Dumping data for table `order_history`
--

INSERT INTO `order_history` (`order_history_id`, `order_id`, `order_status_id`, `notify`, `comment`, `date_added`) VALUES
(1, 24, 1, 1, '', '2013-06-16 20:38:44'),
(2, 25, 1, 1, '', '2013-06-16 20:40:00'),
(3, 26, 1, 1, '', '2013-06-16 22:57:57'),
(4, 27, 1, 1, '', '2013-06-16 23:38:54'),
(5, 28, 1, 1, '', '2013-06-16 23:43:18'),
(6, 29, 1, 1, '', '2013-06-16 23:43:20'),
(7, 30, 1, 1, '', '2013-06-16 23:43:33'),
(8, 31, 1, 1, '', '2013-06-16 23:48:11'),
(9, 32, 1, 1, '', '2013-06-17 00:07:21'),
(10, 33, 1, 1, '', '2013-06-17 00:07:36'),
(11, 34, 1, 1, '', '2013-06-17 00:07:38'),
(12, 35, 1, 1, '', '2013-06-17 00:07:46'),
(13, 36, 1, 1, '', '2013-06-17 00:07:48'),
(14, 37, 1, 1, '', '2013-06-17 00:08:21'),
(15, 38, 1, 1, '', '2013-06-17 00:08:54'),
(16, 38, 7, 0, '', '2013-06-19 20:04:33'),
(17, 39, 1, 1, '', '2013-06-20 21:05:16'),
(18, 40, 1, 1, '', '2013-06-22 22:28:53'),
(19, 41, 1, 1, '', '2013-06-23 23:55:57'),
(20, 42, 1, 1, '', '2013-06-24 00:00:22'),
(21, 43, 1, 1, '', '2013-06-24 00:03:01'),
(22, 44, 1, 1, '', '2013-06-24 00:07:33'),
(23, 45, 1, 1, '', '2013-06-24 00:09:05'),
(24, 46, 1, 1, '', '2013-06-24 00:11:32'),
(25, 47, 1, 1, '', '2013-06-24 00:12:30'),
(26, 48, 1, 1, '', '2013-06-24 00:16:32'),
(27, 49, 1, 1, '', '2013-06-24 00:18:14'),
(28, 50, 1, 1, '', '2013-06-24 00:18:38'),
(29, 51, 1, 1, '', '2013-06-25 23:26:33'),
(30, 52, 1, 1, '', '2013-06-26 02:15:31'),
(31, 53, 1, 1, '', '2013-06-26 23:36:02'),
(32, 54, 1, 1, '', '2013-06-30 12:30:28'),
(33, 55, 1, 1, '', '2013-06-30 15:18:46'),
(34, 56, 1, 1, '', '2013-07-04 20:45:22'),
(35, 57, 1, 1, '', '2013-07-04 22:08:18'),
(36, 58, 1, 1, '', '2013-07-04 23:12:02'),
(37, 58, 1, 1, 'Xin chào ', '2013-07-09 19:13:09'),
(38, 58, 18, 1, 'gsdgsdg', '2013-07-09 19:13:35'),
(39, 58, 18, 1, 'gsdgsdg', '2013-07-09 19:13:36'),
(40, 59, 1, 1, '', '2013-07-09 21:04:42'),
(41, 59, 18, 0, '', '2013-07-09 21:08:40'),
(42, 59, 21, 0, '', '2013-07-09 21:30:14'),
(43, 59, 20, 0, '', '2013-07-09 21:30:26'),
(44, 59, 21, 0, '', '2013-07-09 21:30:33'),
(45, 60, 1, 1, '', '2013-07-12 00:01:27'),
(46, 61, 1, 1, '', '2013-07-12 07:41:54'),
(47, 61, 18, 1, 'em đã đặt hàng anh chuyển tiền cho em nhé', '2013-07-12 07:44:58'),
(48, 62, 1, 1, '', '2013-07-12 07:50:37'),
(49, 63, 1, 1, '', '2013-07-12 08:08:51'),
(50, 64, 1, 1, '', '2013-07-12 09:00:18'),
(51, 64, 18, 1, '', '2013-07-12 16:04:36'),
(52, 65, 1, 1, '', '2013-07-12 16:23:53'),
(53, 66, 1, 1, '', '2013-07-12 16:57:44'),
(54, 67, 1, 1, '', '2013-07-12 20:51:42'),
(55, 67, 18, 1, 'Chào bạn Ngọc Anh! Đơn hàng đã được xác minh - Ngay sau khi bạn thanh toán, chúng tôi sẽ tiến hành mua hàng.', '2013-07-12 21:01:00'),
(56, 66, 1, 0, 'Thanh toán nhanh lên ko xóa đấy', '2013-07-12 21:12:21'),
(57, 66, 18, 1, 'Thanh toán nhanh lên', '2013-07-12 21:12:39'),
(58, 68, 1, 1, '', '2013-07-12 21:23:23'),
(59, 68, 18, 0, '', '2013-07-12 21:25:12'),
(60, 69, 1, 1, '', '2013-07-13 07:29:44'),
(61, 70, 1, 1, '', '2013-07-14 10:50:58'),
(62, 71, 1, 1, '', '2013-07-14 18:24:52'),
(63, 72, 1, 1, '', '2013-07-15 09:44:35'),
(64, 73, 1, 1, '', '2013-07-15 09:46:16'),
(65, 74, 1, 1, '', '2013-07-15 09:48:16'),
(66, 75, 1, 1, '', '2013-07-16 05:57:23'),
(67, 76, 1, 1, '', '2013-07-16 14:14:16');

-- --------------------------------------------------------

--
-- Table structure for table `order_option`
--

CREATE TABLE IF NOT EXISTS `order_option` (
  `order_option_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `order_product_id` int(11) NOT NULL,
  `product_option_id` int(11) NOT NULL,
  `product_option_value_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `value` text NOT NULL,
  `type` varchar(32) NOT NULL,
  PRIMARY KEY (`order_option_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `order_option`
--

INSERT INTO `order_option` (`order_option_id`, `order_id`, `order_product_id`, `product_option_id`, `product_option_value_id`, `name`, `value`, `type`) VALUES
(1, 1, 2, 227, 20, 'Màu Sắc', 'Xanh nước biển', 'image'),
(2, 1, 2, 228, 22, 'Kích cỡ theo chữ', 'M', 'radio'),
(3, 24, 25, 229, 23, 'Màu Sắc', 'Da cam', 'image'),
(4, 24, 25, 231, 29, 'Kích cỡ theo chữ', 'L', 'radio'),
(5, 24, 25, 230, 27, 'Kích cỡ theo số', '27', 'radio'),
(6, 25, 26, 229, 23, 'Màu Sắc', 'Da cam', 'image'),
(7, 25, 26, 231, 29, 'Kích cỡ theo chữ', 'L', 'radio'),
(8, 25, 26, 230, 27, 'Kích cỡ theo số', '27', 'radio'),
(10, 38, 40, 228, 21, 'Kích cỡ theo chữ', 'L', 'radio'),
(9, 38, 40, 227, 19, 'Màu Sắc', 'Nâu', 'image');

-- --------------------------------------------------------

--
-- Table structure for table `order_product`
--

CREATE TABLE IF NOT EXISTS `order_product` (
  `order_product_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `model` varchar(64) NOT NULL,
  `link` varchar(250) DEFAULT NULL,
  `size` varchar(250) DEFAULT NULL,
  `color` varchar(250) DEFAULT NULL,
  `quantity` int(4) NOT NULL,
  `price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `total` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `tax` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `reward` int(8) NOT NULL,
  PRIMARY KEY (`order_product_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=101 ;

--
-- Dumping data for table `order_product`
--

INSERT INTO `order_product` (`order_product_id`, `order_id`, `product_id`, `name`, `model`, `link`, `size`, `color`, `quantity`, `price`, `total`, `tax`, `reward`) VALUES
(1, 1, 41, 'Áo phông 2', 'Product 14', 'http://www.zara.com/us/en/man/jackets/synthetic-leather-jacket-c358050p1293384.html', 'L,M', 'Trắng ', 2, '650000.0000', '1300000.0000', '0.0000', 0),
(2, 1, 42, 'Áo sơ mi 1', 'Product 15', 'http://www.zara.com/us/en/man/jackets/synthetic-leather-jacket-c358050p1293384.html', 'XL', 'Đen', 2, '750000.0000', '1500000.0000', '0.0000', 200),
(3, 2, 31, 'Áo phông 3', 'Product 4', 'http://www.zara.com/us/en/man/jackets/synthetic-leather-jacket-c358050p1293384.html', NULL, NULL, 1, '390000.0000', '390000.0000', '0.0000', 0),
(4, 3, 31, 'Áo phông 3', 'Product 4', 'http://www.zara.com/us/en/man/jackets/synthetic-leather-jacket-c358050p1293384.html', NULL, NULL, 1, '390000.0000', '390000.0000', '0.0000', 0),
(5, 4, 31, 'Áo phông 3', 'Product 4', 'http://www.zara.com/us/en/man/jackets/synthetic-leather-jacket-c358050p1293384.html', NULL, NULL, 1, '390000.0000', '390000.0000', '0.0000', 0),
(6, 5, 31, 'Áo phông 3', 'Product 4', 'http://www.zara.com/us/en/man/jackets/synthetic-leather-jacket-c358050p1293384.html', NULL, NULL, 1, '390000.0000', '390000.0000', '0.0000', 0),
(7, 6, 31, 'Áo phông 3', 'Product 4', NULL, NULL, NULL, 1, '390000.0000', '390000.0000', '0.0000', 0),
(8, 7, 31, 'Áo phông 3', 'Product 4', 'http://www.zara.com/us/en/man/jackets/synthetic-leather-jacket-c358050p1293384.html', NULL, NULL, 1, '390000.0000', '390000.0000', '0.0000', 0),
(9, 8, 31, 'Áo phông 3', 'Product 4', 'http://www.zara.com/us/en/man/jackets/synthetic-leather-jacket-c358050p1293384.html', NULL, NULL, 1, '390000.0000', '390000.0000', '0.0000', 0),
(10, 9, 31, 'Áo phông 3', 'Product 4', 'http://www.zara.com/us/en/man/jackets/synthetic-leather-jacket-c35', NULL, NULL, 1, '390000.0000', '390000.0000', '0.0000', 0),
(11, 10, 31, 'Áo phông 3', 'Product 4', 'http://www.zara.com/us/en/man/jackets/synthetic-leather-jacket-c35', NULL, NULL, 1, '390000.0000', '390000.0000', '0.0000', 0),
(12, 11, 31, 'Áo phông 3', 'Product 4', 'http://www.zara.com/us/en/man/jackets/synthetic-leather-jacket-c35', NULL, NULL, 1, '390000.0000', '390000.0000', '0.0000', 0),
(13, 12, 31, 'Áo phông 3', 'Product 4', 'http://www.zara.com/us/en/man/jackets/synthetic-leather-jacket-c35', NULL, NULL, 1, '390000.0000', '390000.0000', '0.0000', 0),
(14, 13, 31, 'Áo phông 3', 'Product 4', NULL, NULL, NULL, 1, '390000.0000', '390000.0000', '0.0000', 0),
(15, 14, 31, 'Áo phông 3', 'Product 4', NULL, NULL, NULL, 1, '390000.0000', '390000.0000', '0.0000', 0),
(16, 15, 31, 'Áo phông 3', 'Product 4', NULL, NULL, NULL, 1, '390000.0000', '390000.0000', '0.0000', 0),
(17, 16, 31, 'Áo phông 3', 'Product 4', NULL, NULL, NULL, 1, '390000.0000', '390000.0000', '0.0000', 0),
(18, 17, 31, 'Áo phông 3', 'Product 4', NULL, NULL, NULL, 1, '390000.0000', '390000.0000', '0.0000', 0),
(19, 18, 31, 'Áo phông 3', 'Product 4', NULL, NULL, NULL, 1, '390000.0000', '390000.0000', '0.0000', 0),
(20, 19, 31, 'Áo phông 3', 'Product 4', NULL, NULL, NULL, 1, '390000.0000', '390000.0000', '0.0000', 0),
(21, 20, 31, 'Áo phông 3', 'Product 4', NULL, NULL, NULL, 1, '390000.0000', '390000.0000', '0.0000', 0),
(22, 21, 31, 'Áo phông 3', 'Product 4', NULL, NULL, NULL, 1, '390000.0000', '390000.0000', '0.0000', 0),
(23, 22, 31, 'Áo phông 3', 'Product 4', NULL, NULL, NULL, 1, '390000.0000', '390000.0000', '0.0000', 0),
(24, 23, 31, 'Áo phông 3', 'Product 4', NULL, NULL, NULL, 1, '390000.0000', '390000.0000', '0.0000', 0),
(25, 24, 30, 'Áo cánh mỏng', 'Product 3', NULL, NULL, NULL, 1, '690000.0000', '690000.0000', '0.0000', 200),
(26, 25, 30, 'Áo cánh mỏng', 'Product 3', NULL, NULL, NULL, 1, '690000.0000', '690000.0000', '0.0000', 200),
(27, 26, 31, 'Áo phông 3', 'Product 4', NULL, NULL, NULL, 1, '390000.0000', '390000.0000', '0.0000', 0),
(28, 27, 41, 'Áo phông 2', 'Product 14', 'http://www.zara.com/us/en/man/jackets/synthetic-leather-jacket-c358050p1293384.html', NULL, NULL, 1, '650000.0000', '650000.0000', '0.0000', 0),
(29, 28, 41, 'Áo phông 2', 'Product 14', 'http://www.zara.com/us/en/man/jackets/synthetic-leather-jacket-c358050p1293384.html', NULL, NULL, 1, '650000.0000', '650000.0000', '0.0000', 0),
(30, 29, 41, 'Áo phông 2', 'Product 14', 'http://www.zara.com/us/en/man/jackets/synthetic-leather-jacket-c358050p1293384.html', NULL, NULL, 1, '650000.0000', '650000.0000', '0.0000', 0),
(31, 30, 41, 'Áo phông 2', 'Product 14', 'http://www.zara.com/us/en/man/jackets/synthetic-leather-jacket-c358050p1293384.html', NULL, NULL, 1, '650000.0000', '650000.0000', '0.0000', 0),
(32, 31, 41, 'Áo phông 2', 'Product 14', 'http://www.zara.com/us/en/man/jackets/synthetic-leather-jacket-c358050p1293384.html', NULL, NULL, 1, '650000.0000', '650000.0000', '0.0000', 0),
(33, 32, 41, 'Áo phông 2', 'Product 14', 'http://www.zara.com/us/en/man/jackets/synthetic-leather-jacket-c358050p1293384.html', NULL, NULL, 1, '650000.0000', '650000.0000', '0.0000', 0),
(34, 33, 41, 'Áo phông 2', 'Product 14', 'http://www.zara.com/us/en/man/jackets/synthetic-leather-jacket-c358050p1293384.html', NULL, NULL, 1, '650000.0000', '650000.0000', '0.0000', 0),
(35, 34, 41, 'Áo phông 2', 'Product 14', 'http://www.zara.com/us/en/man/jackets/synthetic-leather-jacket-c358050p1293384.html', NULL, NULL, 1, '650000.0000', '650000.0000', '0.0000', 0),
(36, 35, 41, 'Áo phông 2', 'Product 14', 'http://www.zara.com/us/en/man/jackets/synthetic-leather-jacket-c358050p1293384.html', NULL, NULL, 1, '650000.0000', '650000.0000', '0.0000', 0),
(37, 36, 41, 'Áo phông 2', 'Product 14', 'http://www.zara.com/us/en/man/jackets/synthetic-leather-jacket-c358050p1293384.html', NULL, NULL, 1, '650000.0000', '650000.0000', '0.0000', 0),
(38, 37, 41, 'Áo phông 2', 'Product 14', 'http://www.zara.com/us/en/man/jackets/synthetic-leather-jacket-c358050p1293384.html', NULL, NULL, 1, '650000.0000', '650000.0000', '0.0000', 0),
(43, 41, 47, 'Áo sơ mi 2', 'Product 21', NULL, NULL, NULL, 1, '100.0000', '100.0000', '0.0000', 300),
(44, 42, 91, 'Testing', 'Tím', NULL, NULL, NULL, 1, '200000.0000', '200000.0000', '0.0000', 0),
(39, 38, 41, 'Áo phông 2', '', NULL, NULL, NULL, 2, '650000.0000', '1300000.0000', '0.0000', 0),
(40, 38, 42, 'Áo sơ mi 1', '', NULL, NULL, NULL, 2, '750000.0000', '1500000.0000', '0.0000', 200),
(41, 39, 30, 'Áo cánh mỏng', '', NULL, NULL, NULL, 1, '690000.0000', '690000.0000', '0.0000', 200),
(42, 40, 72, 'Testing', '', NULL, NULL, NULL, 1, '250000.0000', '250000.0000', '0.0000', 0),
(45, 42, 92, 'Test2', '', NULL, NULL, NULL, 1, '2005.0000', '2005.0000', '0.0000', 0),
(46, 43, 93, 'name', 'mau', 'mau', 'SIZE', '', 2, '50000.0000', '100000.0000', '0.0000', 0),
(47, 44, 94, 'Name', 'mau', 'Link', 'size', '', 1, '250000.0000', '250000.0000', '0.0000', 0),
(48, 44, 95, 'name', 'mau', 'link', 'size', '', 1, '0.0000', '0.0000', '0.0000', 0),
(49, 44, 96, 'name', 'color', 'link', 'size', '', 1, '250000.0000', '250000.0000', '0.0000', 0),
(50, 45, 97, 'sdg', 'dsg2', 'sdgsd', 'dg', '', 1, '53.0000', '53.0000', '0.0000', 0),
(51, 46, 98, 'dhdfhd', 'dfh', 'dg', 'fdh', 'Array', 1, '0.0000', '0.0000', '0.0000', 0),
(52, 47, 99, 'Sản phẩm', 'Color', 'link sản phẩm', 'size', 'Array', 1, '250000.0000', '250000.0000', '0.0000', 0),
(53, 48, 30, 'Áo cánh mỏng', 'Màu', 'http://www.zara.com/us/en/man/jackets/synthetic-leather-jacket-c358050p1293384.html', 'sdg', 'Array', 1, '690000.0000', '690000.0000', '0.0000', 200),
(54, 49, 30, 'Áo cánh mỏng', 'Product 3', 'http://www.zara.com/us/en/man/jackets/synthetic-leather-jacket-c358050p1293384.html', 'sdg', '', 1, '690000.0000', '690000.0000', '0.0000', 200),
(55, 50, 31, 'Áo phông 3', 'Product 4', 'http://www.geckomedia.vn', 'M', 'Trắng', 1, '390000.0000', '390000.0000', '0.0000', 0),
(56, 51, 30, 'Áo cánh mỏng', 'Product 3', 'http://www.zara.com/us/en/man/jackets/synthetic-leather-jacket-c358050p1293384.html', 'sdg', '', 1, '690000.0000', '690000.0000', '0.0000', 200),
(57, 52, 30, 'Áo cánh mỏng', 'Product 3', 'http://www.zara.com/us/en/man/jackets/synthetic-leather-jacket-c358050p1293384.html', 'sdg', '', 1, '690000.0000', '690000.0000', '0.0000', 200),
(58, 52, 108, 'sdg', '', 'http://www.abc.com', 'dsg', 'sdg', 2, '2556000.0000', '5112000.0000', '0.0000', 0),
(59, 52, 106, 'name', '', 'sdgsdg', 'sdg', 'dsgdsg', 1, '5005500.0000', '5005500.0000', '0.0000', 0),
(60, 53, 110, 'Testing', '', 'http://dbc.com', 'M', '', 1, '5325000.0000', '5325000.0000', '0.0000', 0),
(61, 53, 111, 'Testing 2', '', 'http://abc.com', 'L', 'Trắng', 2, '2556000.0000', '5112000.0000', '0.0000', 0),
(62, 54, 112, 'Áo Converse', '', 'http://www.converse.com.vn', 'M', 'Trắng', 1, '852000.0000', '852000.0000', '0.0000', 0),
(63, 55, 30, 'Áo cánh mỏng', 'Product 3', 'http://www.zara.com/us/en/man/jackets/synthetic-leather-jacket-c358050p1293384.html', 'sdg', '', 1, '690000.0000', '690000.0000', '0.0000', 200),
(64, 56, 113, 'sdg', '', NULL, NULL, NULL, 1, '63692.0000', '63692.0000', '0.0000', 0),
(65, 57, 41, 'Áo phông 2', '', NULL, NULL, NULL, 1, '650000.0000', '650000.0000', '0.0000', 0),
(66, 58, 137, 'ds', '', NULL, NULL, NULL, 2, '0.0000', '0.0000', '0.0000', 0),
(67, 58, 138, 'sdgdsg', '', NULL, NULL, NULL, 2, '923534.0000', '1847068.0000', '0.0000', 0),
(71, 59, 30, 'Áo cánh mỏng', '', NULL, NULL, NULL, 1, '690000.0000', '690000.0000', '0.0000', 200),
(72, 59, 28, 'Áo phông 1', '', NULL, NULL, NULL, 1, '500000.0000', '500000.0000', '0.0000', 400),
(73, 60, 30, 'Áo cánh mỏng', '', NULL, NULL, NULL, 1, '690000.0000', '690000.0000', '0.0000', 200),
(74, 61, 40, 'Áo phông 3', '', NULL, NULL, NULL, 1, '652000.0000', '652000.0000', '0.0000', 0),
(77, 63, 47, 'Áo sơ mi 2', 'Product 21', 'http://www.geckomedia.vn', '', '', 1, '100.0000', '100.0000', '0.0000', 300),
(75, 62, 31, 'Áo phông 3', '', NULL, NULL, NULL, 1, '390000.0000', '390000.0000', '0.0000', 0),
(76, 62, 145, 'quần bồ raza', '', NULL, NULL, NULL, 2, '1065000.0000', '2130000.0000', '0.0000', 0),
(78, 63, 145, 'quần bồ raza', 'zara1', 'http://www.zara.com/us/en/man/jeans/studded-ripped-jeans-c436140p1048671.html', 'L', 'xanh', 2, '560000.0000', '1120000.0000', '0.0000', 0),
(88, 67, 151, 'Áo thun ENERGIE', '', NULL, NULL, NULL, 1, '954415.0000', '954415.0000', '0.0000', 0),
(80, 64, 41, 'Áo phông 2', '', NULL, NULL, NULL, 1, '650000.0000', '650000.0000', '0.0000', 0),
(79, 64, 28, 'Áo phông 1', '', NULL, NULL, NULL, 1, '500000.0000', '500000.0000', '0.0000', 400),
(81, 64, 31, 'Áo phông 3', '', NULL, NULL, NULL, 1, '390000.0000', '390000.0000', '0.0000', 0),
(82, 64, 145, 'quần bồ raza', '', NULL, NULL, NULL, 1, '560000.0000', '560000.0000', '0.0000', 0),
(87, 66, 30, 'Áo cánh mỏng', 'Product 3', 'http://www.zara.com/us/en/man/jackets/synthetic-leather-jacket-c358050p1293384.html', 'sdg', '', 1, '690000.0000', '690000.0000', '0.0000', 200),
(85, 65, 147, 'Quần Jeans Energie', '', NULL, NULL, NULL, 1, '2048100.0000', '2048100.0000', '0.0000', 0),
(86, 65, 148, 'Áo khoác Zara', '', NULL, NULL, NULL, 1, '851787.0000', '851787.0000', '0.0000', 0),
(83, 65, 149, 'Áo polo Lacoste', '', NULL, NULL, NULL, 1, '1687838.0000', '1687838.0000', '0.0000', 0),
(84, 65, 150, 'Cặp da quai chéo ASOS', '', NULL, NULL, NULL, 1, '636920.0000', '636920.0000', '0.0000', 0),
(89, 68, 152, 'Áo phông Energie', '', NULL, NULL, NULL, 1, '954415.0000', '954415.0000', '0.0000', 0),
(94, 72, 161, 'Áo sơ mi nam Zara', 'Zar-Shi7a', 'http://www.zara.com/us/en/man/shirts/printed-shirt-c436197p1292510.html', '', '', 1, '630000.0000', '630000.0000', '0.0000', 0),
(90, 69, 153, 'Áo khoác zara', '', NULL, NULL, NULL, 1, '1250000.0000', '1250000.0000', '0.0000', 0),
(91, 69, 30, 'Áo cánh mỏng', '', NULL, NULL, NULL, 1, '690000.0000', '690000.0000', '0.0000', 200),
(92, 70, 154, 'Áo sơ mi nam zara', 'Zar-Shi1', 'http://www.zara.com/us/en/man/shirts/striped-denim-shirt-c436197p1047855.html', '', '', 1, '630000.0000', '630000.0000', '0.0000', 0),
(93, 71, 167, 'Charles &amp; keith', '', 'http://www.charleskeith.com/INTLStore/CK/product?dest=MYS&amp;art=CK2-30150233&amp;color=09&amp;source=bags', 'S', '', 1, '0.0000', '0.0000', '0.0000', 0),
(95, 73, 160, 'Áo sơ mi nam Zara', 'Zar-Shi7', 'http://www.zara.com/us/en/man/shirts/floral-shirt-c436197p1047931.html', '', '', 1, '630000.0000', '630000.0000', '0.0000', 0),
(96, 74, 159, 'Áo sơ mi nam Zara', 'Zar-Shi6', 'http://www.zara.com/us/en/man/shirts/fine-striped-shirt-with-contrasting-collar-c436197p1167013.html', 'S', 'xanh', 1, '630000.0000', '630000.0000', '0.0000', 0),
(97, 75, 176, 'Áo sơ mi nam Diesel', 'Die-Shi4', 'http://store.diesel.com/gb/shirts_cod38299926cq.html', '', '', 1, '4420000.0000', '4420000.0000', '0.0000', 0),
(98, 75, 153, 'Áo khoác zara', 'Zar-Jac1', 'http://www.zara.com/us/en/man/jackets/jacket-with-contrasting-sleeves-c436192p1047748.html', '', '', 1, '1250000.0000', '1250000.0000', '0.0000', 0),
(99, 76, 201, 'Áo polo nam Diesel', 'Die-pol1', 'http://store.diesel.com/gb/polo_cod37444557jf.html', 'S', 'xanh', 2, '1904000.0000', '3808000.0000', '0.0000', 0),
(100, 76, 208, 'Áo polo ASOS', '', 'http://www.asos.com/ASOS/ASOS-Polo-In-Pique-Jersey/Prod/pgeproduct.aspx?iid=3131065&amp;cid=4616&amp;sh=0&amp;pge=0&amp;pgesize=36&amp;sort=-1&amp;clr=Overdyed+red', 'S', 'Đỏ', 1, '460600.0000', '460600.0000', '0.0000', 0);

-- --------------------------------------------------------

--
-- Table structure for table `order_status`
--

CREATE TABLE IF NOT EXISTS `order_status` (
  `order_status_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `sort_order` int(11) DEFAULT NULL,
  PRIMARY KEY (`order_status_id`,`language_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=24 ;

--
-- Dumping data for table `order_status`
--

INSERT INTO `order_status` (`order_status_id`, `language_id`, `name`, `sort_order`) VALUES
(19, 2, 'Đang mua hàng', 3),
(21, 2, 'Giao dịch thành công', 5),
(20, 2, 'Đang chuyển hàng', 4),
(1, 2, 'Chờ xác minh', 1),
(18, 2, 'Chờ thanh toán', 2);

-- --------------------------------------------------------

--
-- Table structure for table `order_total`
--

CREATE TABLE IF NOT EXISTS `order_total` (
  `order_total_id` int(10) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `code` varchar(32) NOT NULL,
  `title` varchar(255) NOT NULL,
  `text` varchar(255) NOT NULL,
  `value` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`order_total_id`),
  KEY `idx_orders_total_orders_id` (`order_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=324 ;

--
-- Dumping data for table `order_total`
--

INSERT INTO `order_total` (`order_total_id`, `order_id`, `code`, `title`, `text`, `value`, `sort_order`) VALUES
(1, 1, 'sub_total', 'Tổng giá trị là', '2,800,000 VNĐ', '2800000.0000', 1),
(2, 1, 'shipping', 'Phí vận chuyển cố định', '5 VNĐ', '5.0000', 3),
(3, 1, 'total', 'Tổng cộng :', '2,800,005 VNĐ', '2800005.0000', 9),
(4, 2, 'sub_total', 'Tổng giá trị là', '390,000 VNĐ', '390000.0000', 1),
(5, 2, 'total', 'Thành tiền', '390,000 VNĐ', '390000.0000', 9),
(6, 3, 'sub_total', 'Tổng giá trị là', '390,000 VNĐ', '390000.0000', 1),
(7, 3, 'total', 'Thành tiền', '390,000 VNĐ', '390000.0000', 9),
(8, 4, 'sub_total', 'Tổng giá trị là', '390,000 VNĐ', '390000.0000', 1),
(9, 4, 'total', 'Thành tiền', '390,000 VNĐ', '390000.0000', 9),
(10, 5, 'sub_total', 'Tổng giá trị là', '390,000 VNĐ', '390000.0000', 1),
(11, 5, 'total', 'Thành tiền', '390,000 VNĐ', '390000.0000', 9),
(12, 6, 'sub_total', 'Tổng giá trị là', '390,000 VNĐ', '390000.0000', 1),
(13, 6, 'total', 'Thành tiền', '390,000 VNĐ', '390000.0000', 9),
(14, 7, 'sub_total', 'Tổng giá trị là', '390,000 VNĐ', '390000.0000', 1),
(15, 7, 'total', 'Thành tiền', '390,000 VNĐ', '390000.0000', 9),
(16, 8, 'sub_total', 'Tổng giá trị là', '390,000 VNĐ', '390000.0000', 1),
(17, 8, 'total', 'Thành tiền', '390,000 VNĐ', '390000.0000', 9),
(18, 9, 'sub_total', 'Tổng giá trị là', '390,000 VNĐ', '390000.0000', 1),
(19, 9, 'total', 'Thành tiền', '390,000 VNĐ', '390000.0000', 9),
(20, 10, 'sub_total', 'Tổng giá trị là', '390,000 VNĐ', '390000.0000', 1),
(21, 10, 'total', 'Thành tiền', '390,000 VNĐ', '390000.0000', 9),
(22, 11, 'sub_total', 'Tổng giá trị là', '390,000 VNĐ', '390000.0000', 1),
(23, 11, 'total', 'Thành tiền', '390,000 VNĐ', '390000.0000', 9),
(24, 12, 'sub_total', 'Tổng giá trị là', '390,000 VNĐ', '390000.0000', 1),
(25, 12, 'total', 'Thành tiền', '390,000 VNĐ', '390000.0000', 9),
(26, 13, 'sub_total', 'Tổng giá trị là', '390,000 VNĐ', '390000.0000', 1),
(27, 13, 'total', 'Thành tiền', '390,000 VNĐ', '390000.0000', 9),
(28, 14, 'sub_total', 'Tổng giá trị là', '390,000 VNĐ', '390000.0000', 1),
(29, 14, 'total', 'Thành tiền', '390,000 VNĐ', '390000.0000', 9),
(30, 15, 'sub_total', 'Tổng giá trị là', '390,000 VNĐ', '390000.0000', 1),
(31, 15, 'total', 'Thành tiền', '390,000 VNĐ', '390000.0000', 9),
(32, 16, 'sub_total', 'Tổng giá trị là', '390,000 VNĐ', '390000.0000', 1),
(33, 16, 'total', 'Thành tiền', '390,000 VNĐ', '390000.0000', 9),
(34, 17, 'sub_total', 'Tổng giá trị là', '390,000 VNĐ', '390000.0000', 1),
(35, 17, 'total', 'Thành tiền', '390,000 VNĐ', '390000.0000', 9),
(36, 18, 'sub_total', 'Tổng giá trị là', '390,000 VNĐ', '390000.0000', 1),
(37, 18, 'total', 'Thành tiền', '390,000 VNĐ', '390000.0000', 9),
(38, 19, 'sub_total', 'Tổng giá trị là', '390,000 VNĐ', '390000.0000', 1),
(39, 19, 'total', 'Thành tiền', '390,000 VNĐ', '390000.0000', 9),
(40, 20, 'sub_total', 'Tổng giá trị là', '390,000 VNĐ', '390000.0000', 1),
(41, 20, 'total', 'Thành tiền', '390,000 VNĐ', '390000.0000', 9),
(42, 21, 'sub_total', 'Tổng giá trị là', '390,000 VNĐ', '390000.0000', 1),
(43, 21, 'total', 'Thành tiền', '390,000 VNĐ', '390000.0000', 9),
(44, 22, 'sub_total', 'Tổng giá trị là', '390,000 VNĐ', '390000.0000', 1),
(45, 22, 'total', 'Thành tiền', '390,000 VNĐ', '390000.0000', 9),
(46, 23, 'sub_total', 'Tổng giá trị là', '390,000 VNĐ', '390000.0000', 1),
(47, 23, 'total', 'Thành tiền', '390,000 VNĐ', '390000.0000', 9),
(48, 24, 'sub_total', 'Tổng giá trị là', '690,000 VNĐ', '690000.0000', 1),
(49, 24, 'total', 'Thành tiền', '690,000 VNĐ', '690000.0000', 9),
(50, 25, 'sub_total', 'Tổng giá trị là', '690,000 VNĐ', '690000.0000', 1),
(51, 25, 'total', 'Thành tiền', '690,000 VNĐ', '690000.0000', 9),
(52, 26, 'sub_total', 'Tổng giá trị là', '390,000 VNĐ', '390000.0000', 1),
(53, 26, 'total', 'Thành tiền', '390,000 VNĐ', '390000.0000', 9),
(54, 27, 'sub_total', 'Tổng giá trị là', '650,000 VNĐ', '650000.0000', 1),
(55, 27, 'total', 'Thành tiền', '650,000 VNĐ', '650000.0000', 9),
(56, 28, 'sub_total', 'Tổng giá trị là', '650,000 VNĐ', '650000.0000', 1),
(57, 28, 'total', 'Thành tiền', '650,000 VNĐ', '650000.0000', 9),
(58, 29, 'sub_total', 'Tổng giá trị là', '650,000 VNĐ', '650000.0000', 1),
(59, 29, 'total', 'Thành tiền', '650,000 VNĐ', '650000.0000', 9),
(60, 30, 'sub_total', 'Tổng giá trị là', '650,000 VNĐ', '650000.0000', 1),
(61, 30, 'total', 'Thành tiền', '650,000 VNĐ', '650000.0000', 9),
(62, 31, 'sub_total', 'Tổng giá trị là', '650,000 VNĐ', '650000.0000', 1),
(63, 31, 'total', 'Thành tiền', '650,000 VNĐ', '650000.0000', 9),
(64, 32, 'sub_total', 'Tổng giá trị là', '650,000 VNĐ', '650000.0000', 1),
(65, 32, 'total', 'Thành tiền', '650,000 VNĐ', '650000.0000', 9),
(66, 33, 'sub_total', 'Tổng giá trị là', '650,000 VNĐ', '650000.0000', 1),
(67, 33, 'total', 'Thành tiền', '650,000 VNĐ', '650000.0000', 9),
(68, 34, 'sub_total', 'Tổng giá trị là', '650,000 VNĐ', '650000.0000', 1),
(69, 34, 'total', 'Thành tiền', '650,000 VNĐ', '650000.0000', 9),
(70, 35, 'sub_total', 'Tổng giá trị là', '650,000 VNĐ', '650000.0000', 1),
(71, 35, 'total', 'Thành tiền', '650,000 VNĐ', '650000.0000', 9),
(72, 36, 'sub_total', 'Tổng giá trị là', '650,000 VNĐ', '650000.0000', 1),
(73, 36, 'total', 'Thành tiền', '650,000 VNĐ', '650000.0000', 9),
(74, 37, 'sub_total', 'Tổng giá trị là', '650,000 VNĐ', '650000.0000', 1),
(75, 37, 'total', 'Thành tiền', '650,000 VNĐ', '650000.0000', 9),
(77, 38, 'total', 'Thành tiền', '2,800,000 VNĐ', '2800000.0000', 9),
(76, 38, 'sub_total', 'Tổng giá trị là', '2,800,000 VNĐ', '2800000.0000', 1),
(78, 39, 'sub_total', 'Tổng giá trị là', '690,000 VNĐ', '690000.0000', 1),
(80, 40, 'sub_total', 'Tổng giá trị là', '250,000 VNĐ', '250000.0000', 1),
(79, 39, 'total', 'Thành tiền', '690,000 VNĐ', '690000.0000', 9),
(81, 40, 'total', 'Thành tiền', '250,000 VNĐ', '250000.0000', 9),
(82, 41, 'sub_total', 'Tổng giá trị là', '100 VNĐ', '100.0000', 1),
(83, 41, 'total', 'Thành tiền', '100 VNĐ', '100.0000', 9),
(84, 42, 'sub_total', 'Tổng giá trị là', '202,005 VNĐ', '202005.0000', 1),
(85, 42, 'total', 'Thành tiền', '202,005 VNĐ', '202005.0000', 9),
(86, 43, 'sub_total', 'Tổng giá trị là', '100,000 VNĐ', '100000.0000', 1),
(87, 43, 'total', 'Thành tiền', '100,000 VNĐ', '100000.0000', 9),
(88, 44, 'sub_total', 'Tổng giá trị là', '500,000 VNĐ', '500000.0000', 1),
(89, 44, 'total', 'Thành tiền', '500,000 VNĐ', '500000.0000', 9),
(90, 45, 'sub_total', 'Tổng giá trị là', '53 VNĐ', '53.0000', 1),
(91, 45, 'total', 'Thành tiền', '53 VNĐ', '53.0000', 9),
(92, 46, 'sub_total', 'Tổng giá trị là', '0 VNĐ', '0.0000', 1),
(93, 46, 'total', 'Thành tiền', '0 VNĐ', '0.0000', 9),
(94, 47, 'sub_total', 'Tổng giá trị là', '250,000 VNĐ', '250000.0000', 1),
(95, 47, 'total', 'Thành tiền', '250,000 VNĐ', '250000.0000', 9),
(96, 48, 'sub_total', 'Tổng giá trị là', '690,000 VNĐ', '690000.0000', 1),
(97, 48, 'total', 'Thành tiền', '690,000 VNĐ', '690000.0000', 9),
(98, 49, 'sub_total', 'Tổng giá trị là', '690,000 VNĐ', '690000.0000', 1),
(99, 49, 'total', 'Thành tiền', '690,000 VNĐ', '690000.0000', 9),
(100, 50, 'sub_total', 'Tổng giá trị là', '390,000 VNĐ', '390000.0000', 1),
(101, 50, 'total', 'Thành tiền', '390,000 VNĐ', '390000.0000', 9),
(102, 51, 'sub_total', 'Tổng giá trị là', '690,000 VNĐ', '690000.0000', 1),
(103, 51, 'total', 'Thành tiền', '690,000 VNĐ', '690000.0000', 9),
(104, 52, 'sub_total', 'Tổng giá trị là', '10,807,500 VNĐ', '10807500.0000', 1),
(105, 52, 'total', 'Thành tiền', '10,807,500 VNĐ', '10807500.0000', 9),
(106, 53, 'sub_total', 'Tổng giá trị là', '10,437,000 VNĐ', '10437000.0000', 1),
(107, 53, 'total', 'Thành tiền', '10,437,000 VNĐ', '10437000.0000', 9),
(108, 54, 'sub_total', 'Tổng giá trị là', '852,000 VNĐ', '852000.0000', 1),
(109, 54, 'total', 'Thành tiền', '852,000 VNĐ', '852000.0000', 9),
(110, 55, 'sub_total', 'Tổng giá trị là', '690,000 VNĐ', '690000.0000', 1),
(111, 55, 'total', 'Thành tiền', '690,000 VNĐ', '690000.0000', 9),
(112, 56, 'sub_total', 'Tổng giá trị là', '63,692 VNĐ', '63692.0000', 1),
(113, 56, 'total', 'Thành tiền', '63,692 VNĐ', '63692.0000', 9),
(117, 58, 'total', 'Thành tiền', '1,847,368 VNĐ', '1853668.0000', 9),
(187, 59, 'total', 'Thành tiền', '1,300,000 VNĐ', '1300000.0000', 9),
(186, 59, 'sub_total', 'Tổng giá trị là', '1,190,000 VNĐ', '1190000.0000', 1),
(263, 59, 'shipping_fee', 'Phí vận chuyển quốc tế', '100,000 VNĐ', '100000.0000', 2),
(264, 59, 'shipping_pay', 'Tiền công', '10,000 VNĐ', '10000.0000', 3),
(166, 58, 'shipping_fee', 'Phí vận chuyển quốc tế', '5,000 VNĐ', '5000.0000', 3),
(116, 58, 'sub_total', 'Tổng giá trị là', '1,847,068 VNĐ', '1847068.0000', 1),
(114, 57, 'sub_total', 'Tổng giá trị là', '650,000 VNĐ', '650000.0000', 1),
(167, 58, 'shipping_pay', 'Tiền công', '2,000 VNĐ', '2000.0000', 4),
(266, 57, 'shipping_fee', 'Phí vận chuyển quốc tế', '5,000 VNĐ', '5000.0000', 3),
(265, 57, 'shipping_pay', 'Tiền công', '50,000 VNĐ', '50000.0000', 4),
(115, 57, 'total', 'Thành tiền', '705,000 VNĐ', '705000.0000', 9),
(268, 60, 'total', 'Thành tiền', '1,250,000 VNĐ', '1250000.0000', 9),
(267, 60, 'sub_total', 'Tổng giá trị là', '690,000 VNĐ', '690000.0000', 1),
(270, 60, 'shipping_fee', 'Phí vận chuyển quốc tế', '5,500,000 VNĐ', '5500000.0000', 2),
(269, 60, 'shipping_pay', 'Tiền công', '60,000 VNĐ', '60000.0000', 3),
(272, 61, 'total', 'Thành tiền', '1,152,000 VNĐ', '1152000.0000', 9),
(271, 61, 'sub_total', 'Tổng giá trị là', '652,000 VNĐ', '652000.0000', 1),
(273, 61, 'shipping_pay', 'Tiền công', '200,000 VNĐ', '200000.0000', 3),
(274, 61, 'shipping_fee', 'Phí vận chuyển quốc tế', '300,000 VNĐ', '300000.0000', 2),
(278, 62, 'shipping_fee', 'Phí vận chuyển quốc tế', '100,000 VNĐ', '100000.0000', 2),
(277, 62, 'shipping_pay', 'Tiền công', '100,000 VNĐ', '100000.0000', 3),
(275, 62, 'sub_total', 'Tổng giá trị là', '2,520,000 VNĐ', '2520000.0000', 1),
(276, 62, 'total', 'Thành tiền', '2,720,000 VNĐ', '2720000.0000', 9),
(279, 63, 'sub_total', 'Tổng giá trị là', '1,120,100 VNĐ', '1120100.0000', 1),
(280, 63, 'total', 'Thành tiền', '1,120,100 VNĐ', '1120100.0000', 9),
(281, 64, 'sub_total', 'Tổng giá trị là', '2,100,000 VNĐ', '2100000.0000', 1),
(282, 64, 'total', 'Thành tiền', '2,500,000 VNĐ', '2500000.0000', 9),
(284, 64, 'shipping_fee', 'Phí vận chuyển quốc tế', '200,000 VNĐ', '200000.0000', 2),
(283, 64, 'shipping_pay', 'Tiền công', '200,000 VNĐ', '200000.0000', 3),
(288, 65, 'shipping_fee', 'Phí vận chuyển quốc tế', '700,000 VNĐ', '700000.0000', 2),
(287, 65, 'shipping_pay', 'Tiền công', '300,000 VNĐ', '300000.0000', 3),
(285, 65, 'sub_total', 'Tổng giá trị là', '5,224,645 VNĐ', '5224645.0000', 1),
(286, 65, 'total', 'Thành tiền', '6,224,645 VNĐ', '6224645.0000', 9),
(289, 66, 'sub_total', 'Tổng giá trị là', '690,000 VNĐ', '690000.0000', 1),
(290, 66, 'total', 'Thành tiền', '690,000 VNĐ', '690000.0000', 9),
(294, 67, 'shipping_fee', 'Phí vận chuyển quốc tế', '200,000 VNĐ', '200000.0000', 2),
(293, 67, 'shipping_pay', 'Tiền công', '50,000 VNĐ', '50000.0000', 3),
(291, 67, 'sub_total', 'Tổng giá trị là', '954,415 VNĐ', '954415.0000', 1),
(292, 67, 'total', 'Thành tiền', '1,204,415 VNĐ', '1204415.0000', 9),
(308, 69, 'shipping_fee', 'Phí vận chuyển quốc tế', '300,000 VNĐ', '300000.0000', 2),
(295, 68, 'sub_total', 'Tổng giá trị là', '954,415 VNĐ', '954415.0000', 1),
(296, 68, 'credit', 'Store Credit', '-954,415 VNĐ', '-954415.0000', 7),
(297, 68, 'total', 'Thành tiền', '350,000 VNĐ', '350000.0000', 9),
(299, 68, 'shipping_fee', 'Phí vận chuyển quốc tế', '300,000 VNĐ', '300000.0000', 2),
(298, 68, 'shipping_pay', 'Tiền công', '50,000 VNĐ', '50000.0000', 3),
(307, 69, 'shipping_pay', 'Tiền công', '50,000 VNĐ', '50000.0000', 3),
(302, 70, 'sub_total', 'Tổng giá trị là', '630,000 VNĐ', '630000.0000', 1),
(303, 70, 'credit', 'Đã thanh toán', '-630,000 VNĐ', '-630000.0000', 7),
(304, 70, 'total', 'Thành tiền', '0 VNĐ', '0.0000', 9),
(305, 71, 'sub_total', 'Tổng giá trị là', '0 VNĐ', '0.0000', 1),
(306, 71, 'total', 'Thành tiền', '0 VNĐ', '0.0000', 9),
(300, 69, 'sub_total', 'Tổng giá trị là', '1,940,000 VNĐ', '1940000.0000', 1),
(301, 69, 'total', 'Thành tiền', '2,290,000 VNĐ', '2290000.0000', 9),
(309, 72, 'sub_total', 'Tổng giá trị là', '630,000 VNĐ', '630000.0000', 1),
(310, 72, 'credit', 'Đã thanh toán', '-630,000 VNĐ', '-630000.0000', 7),
(311, 72, 'total', 'Thành tiền', '0 VNĐ', '0.0000', 9),
(312, 73, 'sub_total', 'Tổng giá trị là', '630,000 VNĐ', '630000.0000', 1),
(313, 73, 'credit', 'Đã thanh toán', '-630,000 VNĐ', '-630000.0000', 7),
(314, 73, 'total', 'Thành tiền', '0 VNĐ', '0.0000', 9),
(315, 74, 'sub_total', 'Tổng giá trị là', '630,000 VNĐ', '630000.0000', 1),
(316, 74, 'credit', 'Đã thanh toán', '-630,000 VNĐ', '-630000.0000', 7),
(317, 74, 'total', 'Thành tiền', '0 VNĐ', '0.0000', 9),
(318, 75, 'sub_total', 'Tổng giá trị là', '5,670,000 VNĐ', '5670000.0000', 1),
(319, 75, 'credit', 'Đã thanh toán', '-5,670,000 VNĐ', '-5670000.0000', 7),
(320, 75, 'total', 'Thành tiền', '0 VNĐ', '0.0000', 9),
(321, 76, 'sub_total', 'Tổng giá trị là', '4,268,600 VNĐ', '4268600.0000', 1),
(322, 76, 'credit', 'Đã thanh toán', '-4,268,600 VNĐ', '-4268600.0000', 7),
(323, 76, 'total', 'Thành tiền', '0 VNĐ', '0.0000', 9);

-- --------------------------------------------------------

--
-- Table structure for table `order_voucher`
--

CREATE TABLE IF NOT EXISTS `order_voucher` (
  `order_voucher_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `voucher_id` int(11) NOT NULL,
  `description` varchar(255) NOT NULL,
  `code` varchar(10) NOT NULL,
  `from_name` varchar(64) NOT NULL,
  `from_email` varchar(96) NOT NULL,
  `to_name` varchar(64) NOT NULL,
  `to_email` varchar(96) NOT NULL,
  `voucher_theme_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  PRIMARY KEY (`order_voucher_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE IF NOT EXISTS `product` (
  `product_id` int(11) NOT NULL AUTO_INCREMENT,
  `model` varchar(64) NOT NULL,
  `sku` varchar(64) NOT NULL,
  `upc` varchar(12) NOT NULL,
  `ean` varchar(14) NOT NULL,
  `jan` varchar(13) NOT NULL,
  `isbn` varchar(13) NOT NULL,
  `mpn` varchar(64) NOT NULL,
  `location` varchar(128) NOT NULL,
  `quantity` int(4) NOT NULL DEFAULT '0',
  `stock_status_id` int(11) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `manufacturer_id` int(11) NOT NULL,
  `shipping` tinyint(1) NOT NULL DEFAULT '1',
  `price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `points` int(8) NOT NULL DEFAULT '0',
  `tax_class_id` int(11) NOT NULL,
  `date_available` date NOT NULL,
  `link` varchar(250) DEFAULT NULL,
  `size` varchar(250) DEFAULT NULL,
  `color` varchar(250) DEFAULT NULL,
  `weight` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  `weight_class_id` int(11) NOT NULL DEFAULT '0',
  `length` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  `width` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  `height` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  `length_class_id` int(11) NOT NULL DEFAULT '0',
  `subtract` tinyint(1) NOT NULL DEFAULT '1',
  `minimum` int(11) NOT NULL DEFAULT '1',
  `sort_order` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `viewed` int(5) NOT NULL DEFAULT '0',
  PRIMARY KEY (`product_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=210 ;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`product_id`, `model`, `sku`, `upc`, `ean`, `jan`, `isbn`, `mpn`, `location`, `quantity`, `stock_status_id`, `image`, `manufacturer_id`, `shipping`, `price`, `points`, `tax_class_id`, `date_available`, `link`, `size`, `color`, `weight`, `weight_class_id`, `length`, `width`, `height`, `length_class_id`, `subtract`, `minimum`, `sort_order`, `status`, `date_added`, `date_modified`, `viewed`) VALUES
(169, 'Zar-Dre1', '', '', '', '', '', '', 'UK', 100, 7, 'data/Thuyanh/7495039615_2_1_1.jpg', 9, 1, '1360000.0000', 0, 0, '2013-07-13', 'http://www.zara.com/uk/en/new-collection/woman/dresses/floral-print-dress-c269185p1341030.html', NULL, NULL, '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, '2013-07-14 21:23:01', '2013-07-14 21:32:32', 10),
(154, 'Zar-Shi1', '', '', '', '', '', '', 'UK', 99, 7, 'data/7248400400_1_1_1.jpg', 9, 1, '630000.0000', 0, 0, '2013-07-13', 'http://www.zara.com/us/en/man/shirts/striped-denim-shirt-c436197p1047855.html', NULL, NULL, '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, '2013-07-14 10:12:53', '2013-07-14 15:45:29', 63),
(155, 'Zar-Shi2', '', '', '', '', '', '', '', 100, 7, 'data/4085527505_1_1_1.jpg', 9, 1, '630000.0000', 0, 0, '2013-07-13', 'http://www.zara.com/us/en/man/shirts/shirt-with-contrasting-collar-c436197p1103036.html', NULL, NULL, '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, '2013-07-14 10:18:10', '2013-07-14 15:44:06', 2),
(156, 'Zar-Shi3', '', '', '', '', '', '', '', 100, 7, 'data/4164414400_1_1_1.jpg', 9, 1, '630000.0000', 0, 0, '2013-07-13', 'http://www.zara.com/us/en/man/shirts/geometric-print-shirt-c436197p1103024.html', NULL, NULL, '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, '2013-07-14 10:23:20', '2013-07-14 15:44:21', 0),
(157, 'Zar-Shi4', '', '', '', '', '', '', '', 100, 7, 'data/6519405250_1_1_1.jpg', 9, 1, '520000.0000', 0, 0, '2013-07-13', 'http://www.zara.com/us/en/man/shirts/poplin-shirt-with-club-collar-c436197p1079508.html', NULL, NULL, '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, '2013-07-14 10:29:51', '2013-07-14 15:44:38', 0),
(158, 'Zar-Shi5', '', '', '', '', '', '', '', 100, 7, 'data/5445300700_1_1_1.jpg', 9, 1, '639999.0000', 0, 0, '2013-07-13', 'http://www.zara.com/us/en/man/shirts/oxford-shirt-c436197p1201491.html', NULL, NULL, '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, '2013-07-14 10:36:23', '2013-07-14 15:44:51', 0),
(50, '', '', '', '', '', '', '', '', 1, 0, NULL, 0, 0, '450000.0000', 0, 0, '0000-00-00', 'http://www.dantri.vn', NULL, NULL, '0.00000000', 0, '0.00000000', '0.00000000', '0.00000000', 0, 0, 0, 0, 0, '2013-06-20 23:58:26', '0000-00-00 00:00:00', 0),
(51, '', '', '', '', '', '', '', '', 0, 0, NULL, 0, 0, '0.0000', 0, 0, '0000-00-00', '', NULL, NULL, '0.00000000', 0, '0.00000000', '0.00000000', '0.00000000', 0, 0, 0, 0, 0, '2013-06-22 00:25:32', '0000-00-00 00:00:00', 0),
(52, '', '', '', '', '', '', '', '', 22, 0, NULL, 0, 0, '235532.0000', 0, 0, '0000-00-00', '6436436', NULL, NULL, '0.00000000', 0, '0.00000000', '0.00000000', '0.00000000', 0, 0, 0, 0, 0, '2013-06-22 00:31:11', '0000-00-00 00:00:00', 0),
(53, '', '', '', '', '', '', '', '', 22, 0, NULL, 0, 0, '235532.0000', 0, 0, '0000-00-00', '6436436', NULL, NULL, '0.00000000', 0, '0.00000000', '0.00000000', '0.00000000', 0, 0, 0, 0, 0, '2013-06-22 00:32:56', '0000-00-00 00:00:00', 0),
(54, '', '', '', '', '', '', '', '', 33, 0, NULL, 0, 0, '3463.0000', 0, 0, '0000-00-00', '345346346', NULL, NULL, '0.00000000', 0, '0.00000000', '0.00000000', '0.00000000', 0, 0, 0, 0, 0, '2013-06-22 00:33:30', '0000-00-00 00:00:00', 0),
(55, '', '', '', '', '', '', '', '', 10, 0, NULL, 0, 0, '12000.0000', 0, 0, '0000-00-00', 'http://dantri.vn', NULL, NULL, '0.00000000', 0, '0.00000000', '0.00000000', '0.00000000', 0, 0, 0, 0, 1, '2013-06-22 00:35:47', '0000-00-00 00:00:00', 0),
(56, '', '', '', '', '', '', '', '', 0, 0, NULL, 0, 0, '0.0000', 0, 0, '0000-00-00', '', NULL, NULL, '0.00000000', 0, '0.00000000', '0.00000000', '0.00000000', 0, 0, 0, 0, 1, '2013-06-22 00:36:17', '0000-00-00 00:00:00', 0),
(57, '', '', '', '', '', '', '', '', 0, 0, NULL, 0, 0, '0.0000', 0, 0, '0000-00-00', '', NULL, NULL, '0.00000000', 0, '0.00000000', '0.00000000', '0.00000000', 0, 0, 0, 0, 1, '2013-06-22 00:36:25', '0000-00-00 00:00:00', 0),
(58, '', '', '', '', '', '', '', '', 0, 0, NULL, 0, 0, '0.0000', 0, 0, '0000-00-00', '', NULL, NULL, '0.00000000', 0, '0.00000000', '0.00000000', '0.00000000', 0, 0, 0, 0, 1, '2013-06-22 00:36:39', '0000-00-00 00:00:00', 0),
(59, '', '', '', '', '', '', '', '', 1, 0, NULL, 0, 0, '2500000.0000', 0, 0, '0000-00-00', 'http://link.com', NULL, NULL, '0.00000000', 0, '0.00000000', '0.00000000', '0.00000000', 0, 0, 0, 0, 1, '2013-06-22 00:38:01', '0000-00-00 00:00:00', 0),
(62, '', '', '', '', '', '', '', '', 74, 0, NULL, 0, 0, '0.0000', 0, 0, '0000-00-00', 'nhjhf', NULL, NULL, '0.00000000', 0, '0.00000000', '0.00000000', '0.00000000', 0, 0, 0, 0, 1, '2013-06-22 01:14:58', '0000-00-00 00:00:00', 0),
(168, 'mis-dre1', '', '', '', '', '', '', '', 100, 7, 'data/26D01MRED_large.jpg', 24, 1, '1800000.0000', 0, 0, '2013-07-13', 'http://www.missselfridge.com/webapp/wcs/stores/servlet/ProductDisplay?beginIndex=0&amp;viewAllFlag=&amp;catalogId=33055&amp;storeId=12554&amp;productId=10983225&amp;langId=-1&amp;categoryId=&amp;parent_category_rn=&amp;searchTerm=MS26D01MRED&amp;resu', NULL, NULL, '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, '2013-07-14 21:06:38', '0000-00-00 00:00:00', 15),
(161, 'Zar-Shi7a', '', '', '', '', '', '', '', 99, 7, 'data/4286417400_1_1_1.jpg', 9, 1, '630000.0000', 0, 0, '2013-07-13', 'http://www.zara.com/us/en/man/shirts/printed-shirt-c436197p1292510.html', NULL, NULL, '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, '2013-07-14 11:22:40', '2013-07-14 15:46:41', 16),
(162, 'Zar-Shi8', '', '', '', '', '', '', '', 100, 7, 'data/4202265403_1_1_1.jpg', 9, 1, '630000.0000', 0, 0, '2013-07-13', 'http://www.zara.com/us/en/man/shirts/striped-shirt-c436197p1047633.html', NULL, NULL, '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, '2013-07-14 11:26:40', '2013-07-14 15:46:56', 23),
(163, 'Zar-Shi9', '', '', '', '', '', '', '', 100, 7, 'data/6103403250_1_1_1.jpg', 9, 1, '630000.0000', 0, 0, '2013-07-13', 'http://www.zara.com/es/en/man/shirts/shirt-with-mao-collar-and-contrast-detailing-c436268p1048026.html', NULL, NULL, '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, '2013-07-14 13:20:46', '2013-07-14 15:47:09', 23),
(160, 'Zar-Shi7', '', '', '', '', '', '', '', 99, 7, 'data/6887402400_1_1_1.jpg', 9, 1, '630000.0000', 0, 0, '2013-07-13', 'http://www.zara.com/us/en/man/shirts/floral-shirt-c436197p1047931.html', NULL, NULL, '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, '2013-07-14 11:06:48', '2013-07-14 15:46:00', 21),
(153, 'Zar-Jac1', '', '', '', '', '', '', '', 98, 7, 'data/2398400711_1_1_1.jpg', 9, 1, '1250000.0000', 0, 0, '2013-07-12', 'http://www.zara.com/us/en/man/jackets/jacket-with-contrasting-sleeves-c436192p1047748.html', NULL, NULL, '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, '2013-07-13 07:27:15', '2013-07-14 15:42:18', 73),
(159, 'Zar-Shi6', '', '', '', '', '', '', 'UK', 99, 7, 'data/4202265403_1_1_1.jpg', 9, 1, '630000.0000', 0, 0, '2013-07-13', 'http://www.zara.com/us/en/man/shirts/fine-striped-shirt-with-contrasting-collar-c436197p1167013.html', NULL, NULL, '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, '2013-07-14 11:02:50', '2013-07-14 15:45:43', 7),
(170, 'HM-Dre1', '', '', '', '', '', '', 'UK', 100, 7, 'data/Thuyanh/hmprod.jpg', 25, 1, '680000.0000', 0, 0, '2013-07-13', 'http://www.hm.com/gb/product/16273?article=16273-A', NULL, NULL, '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, '2013-07-14 21:37:35', '2013-07-14 21:40:50', 13),
(173, 'Die-Shi1', '', '', '', '', '', '', 'UK', 100, 7, 'data/38314688kc_12_e.jpg', 15, 1, '5440000.0000', 0, 0, '2013-07-14', 'http://store.diesel.com/gb/shirts_cod38314688kc.html', NULL, NULL, '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, '2013-07-15 15:57:53', '2013-07-15 16:09:57', 4),
(174, 'Die-Shi2', '', '', '', '', '', '', 'UK', 100, 7, 'data/san_pham/38290867gl_12_f.jpg', 15, 1, '2890000.0000', 0, 0, '2013-07-14', 'http://store.diesel.com/gb/shirts_cod38290867gl.html', NULL, NULL, '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, '2013-07-15 16:09:44', '2013-07-15 16:24:48', 23),
(175, 'Die-Shi3', '', '', '', '', '', '', 'UK', 100, 7, 'data/38314680ck_12_f.jpg', 15, 1, '5440000.0000', 0, 0, '2013-07-14', 'http://store.diesel.com/gb/shirts_cod38314680ck.html', NULL, NULL, '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, '2013-07-15 16:32:21', '2013-07-15 16:38:00', 6),
(176, 'Die-Shi4', '', '', '', '', '', '', 'UK', 99, 7, 'data/san_pham/38299926cq_12_f.jpg', 15, 1, '4420000.0000', 0, 0, '2013-07-14', 'http://store.diesel.com/gb/shirts_cod38299926cq.html', NULL, NULL, '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, '2013-07-15 16:37:20', '2013-07-15 16:38:27', 5),
(177, 'Die-Shi5', '', '', '', '', '', '', '', 100, 7, 'data/san_pham/38299879ef_12_f.jpg', 15, 1, '3400000.0000', 0, 0, '2013-07-14', 'http://store.diesel.com/gb/shirts_cod38299879ef.html', NULL, NULL, '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, '2013-07-15 16:43:56', '0000-00-00 00:00:00', 6),
(178, 'Die-Shi6', '', '', '', '', '', '', 'UK', 100, 7, 'data/san_pham/38299884tg_12_f.jpg', 15, 1, '2210000.0000', 0, 0, '2013-07-14', 'http://store.diesel.com/gb/shirts_cod38299884tg.html', NULL, NULL, '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, '2013-07-15 16:49:03', '0000-00-00 00:00:00', 7),
(179, 'Die-Shi7', '', '', '', '', '', '', 'UK', 100, 7, 'data/san_pham/38299883tn_12_f.jpg', 0, 1, '2210000.0000', 0, 0, '2013-07-14', 'http://store.diesel.com/gb/shirts_cod38299883tn.html', NULL, NULL, '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, '2013-07-15 16:53:38', '2013-07-15 16:54:09', 0),
(187, 'Rep-Jea6', '', '', '', '', '', '', 'UK', 100, 7, 'data/san_pham/foto_1 (5).jpg', 32, 1, '1955000.0000', 0, 0, '2013-07-15', 'http://shop.replay.it/en/Replay/SS13/Man/Jeans/rogob-118-150-regular-fit-791.html', NULL, NULL, '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, '2013-07-16 08:36:21', '0000-00-00 00:00:00', 0),
(182, 'Rep-Jea1', '', '', '', '', '', '', 'UK', 100, 7, 'data/san_pham/foto_1.jpg', 32, 1, '2295000.0000', 0, 0, '2013-07-15', 'http://shop.replay.it/en/Replay/SS13/Man/Jeans/tomlin-118-150-worker-fit-716.html', NULL, NULL, '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, '2013-07-16 07:40:15', '2013-07-16 07:41:02', 0),
(183, 'Rep-Jea2', '', '', '', '', '', '', 'UK', 100, 7, 'data/foto_1 (1).jpg', 32, 1, '2125000.0000', 0, 0, '2013-07-15', 'http://shop.replay.it/en/Replay/SS13/Man/Jeans/marnel-118-150-regular-slim-fit-766.html', NULL, NULL, '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, '2013-07-16 07:49:27', '0000-00-00 00:00:00', 4),
(184, 'Rep-Jea3', '', '', '', '', '', '', 'UK', 100, 7, 'data/san_pham/foto_2 (1).jpg', 32, 1, '2550000.0000', 0, 0, '2013-07-15', 'http://shop.replay.it/en/Replay/SS13/Man/Jeans/smarin-118-150-regular-slim-fit-841.html', NULL, NULL, '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, '2013-07-16 08:00:34', '0000-00-00 00:00:00', 0),
(185, 'Rep-Jea4', '', '', '', '', '', '', 'UK', 100, 7, 'data/foto_1 (3).jpg', 32, 1, '2499000.0000', 0, 0, '2013-07-15', 'http://shop.replay.it/en/Replay/SS13/Man/Jeans/anbass-118-160-slim-fit-738.html', NULL, NULL, '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, '2013-07-16 08:11:11', '0000-00-00 00:00:00', 2),
(186, 'Rep-Jea5', '', '', '', '', '', '', 'Uk', 100, 7, 'data/san_pham/foto_1 (4).jpg', 32, 1, '3570000.0000', 0, 0, '2013-07-15', 'http://shop.replay.it/en/We-Are-Replay/SS13/Man/Jeans/regular-waist-slimfit-droppedcrotch-stretch-jeans-with-crumple-effect-rivet-on-fly-1432.html', NULL, NULL, '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, '2013-07-16 08:28:36', '0000-00-00 00:00:00', 2),
(188, 'Zar-Jea1', '', '', '', '', '', '', 'UK', 100, 7, 'data/0905400800_2_1_1.jpg', 9, 1, '1100000.0000', 0, 0, '2013-07-15', 'http://www.zara.com/us/en/man/jeans/studded-jeans-c436140p1048639.html', NULL, NULL, '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, '2013-07-16 08:50:34', '0000-00-00 00:00:00', 0),
(189, 'Zar-Jea2', '', '', '', '', '', '', 'UK', 100, 7, 'data/san_pham/0905403407_2_1_1.jpg', 9, 1, '1100000.0000', 0, 0, '2013-07-15', 'http://www.zara.com/us/en/man/jeans/studded-ripped-jeans-c436140p1048671.html', NULL, NULL, '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, '2013-07-16 08:53:35', '0000-00-00 00:00:00', 0),
(190, 'Zar-Jea3', '', '', '', '', '', '', 'UK', 100, 7, 'data/san_pham/2627400407_2_1_1.jpg', 9, 1, '1100000.0000', 0, 0, '2013-07-15', 'http://www.zara.com/us/en/man/jeans/studded-jeans-with-chain-c436140p1047950.html', NULL, NULL, '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, '2013-07-16 08:56:17', '0000-00-00 00:00:00', 2),
(191, 'Zar-Jea4', '', '', '', '', '', '', 'UK', 100, 7, 'data/san_pham/7215408407_2_1_1.jpg', 9, 1, '1100000.0000', 0, 0, '2013-07-15', 'http://www.zara.com/us/en/man/jeans/jeans-with-contrasting-interior-c436140p1048934.html', NULL, NULL, '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, '2013-07-16 08:59:56', '0000-00-00 00:00:00', 0),
(192, 'Zar-Jea5', '', '', '', '', '', '', 'UK', 100, 7, 'data/san_pham/2627402407_2_1_1.jpg', 9, 1, '1100000.0000', 0, 0, '2013-07-15', 'http://www.zara.com/us/en/man/jeans/studded-jeans-c436140p1047952.html', NULL, NULL, '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, '2013-07-16 09:03:36', '0000-00-00 00:00:00', 4),
(193, 'Zar-Jea6', '', '', '', '', '', '', 'UK', 100, 7, 'data/san_pham/7215401446_2_1_1.jpg', 9, 1, '845000.0000', 0, 0, '2013-07-15', 'http://www.zara.com/us/en/man/jeans/two-tone-jeans-c436140p1048363.html', NULL, NULL, '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, '2013-07-16 10:22:24', '0000-00-00 00:00:00', 2),
(194, 'Zar-Jea7', '', '', '', '', '', '', 'UK', 100, 7, 'data/san_pham/2721430407_2_1_1.jpg', 9, 1, '1100000.0000', 0, 0, '2013-07-15', 'http://www.zara.com/us/en/man/jeans/ripped-jeans-c436140p1049178.html', NULL, NULL, '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, '2013-07-16 10:28:53', '0000-00-00 00:00:00', 2),
(195, 'Zar-Jea8', '', '', '', '', '', '', 'UK', 100, 7, 'data/san_pham/0905402407_2_1_1.jpg', 9, 1, '1100000.0000', 0, 0, '2013-07-15', 'http://www.zara.com/us/en/man/jeans/studded-jeans-c436140p1048670.html', NULL, NULL, '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, '2013-07-16 10:31:53', '0000-00-00 00:00:00', 0),
(196, 'Zar-Jea9', '', '', '', '', '', '', 'UK', 100, 7, 'data/san_pham/6594400406_2_1_1.jpg', 9, 1, '850000.0000', 0, 0, '2013-07-15', 'http://www.zara.com/us/en/man/jeans/studded-jeans-c436140p1047778.html', NULL, NULL, '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, '2013-07-16 10:54:52', '0000-00-00 00:00:00', 0),
(197, 'Zar-Jea10', '', '', '', '', '', '', 'UK', 1, 7, 'data/san_pham/5575444400_2_1_1.jpg', 9, 1, '572000.0000', 0, 0, '2013-07-15', 'http://www.zara.com/us/en/man/jeans/5-pocket-bull-denim-trousers-c436140p1199296.html', NULL, NULL, '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, '2013-07-16 11:01:15', '0000-00-00 00:00:00', 0),
(198, 'Zar-Jea11', '', '', '', '', '', '', 'UK', 100, 7, 'data/san_pham/6594400406_2_1_1.jpg', 9, 1, '1100000.0000', 0, 0, '2013-07-15', 'http://www.zara.com/us/en/man/jeans/contrasting-jeans-c436140p1156533.html', NULL, NULL, '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, '2013-07-16 11:05:18', '0000-00-00 00:00:00', 0),
(199, 'Zar-Jea12', '', '', '', '', '', '', 'UK', 100, 7, 'data/san_pham/5575444800_2_1_1.jpg', 9, 1, '580000.0000', 0, 0, '2013-07-15', 'http://www.zara.com/us/en/man/jeans/5-pocket-bull-denim-trousers-c436140p1199300.html', NULL, NULL, '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, '2013-07-16 11:09:01', '0000-00-00 00:00:00', 0),
(200, 'Zar-Jea13', '', '', '', '', '', '', 'UK', 100, 7, 'data/san_pham/3951401407_2_1_1.jpg', 9, 1, '1100000.0000', 0, 0, '2013-07-15', 'http://www.zara.com/us/en/man/jeans/jeans-with-seamed-yoke-c436140p1048475.html', NULL, NULL, '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, '2013-07-16 11:11:47', '0000-00-00 00:00:00', 0),
(201, 'Die-pol1', '', '', '', '', '', '', 'UK', 98, 7, 'data/san_pham/37444557jf_12_f.jpg', 15, 1, '1904000.0000', 0, 0, '2013-07-15', 'http://store.diesel.com/gb/polo_cod37444557jf.html', NULL, NULL, '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, '2013-07-16 11:28:16', '0000-00-00 00:00:00', 5),
(202, 'Die-pol2', '', '', '', '', '', '', 'UK', 100, 7, 'data/san_pham/37444557qp_12_f.jpg', 15, 1, '1904000.0000', 0, 0, '2013-07-15', 'http://store.diesel.com/gb/polo_cod37444557jf.html', NULL, NULL, '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, '2013-07-16 11:32:10', '0000-00-00 00:00:00', 5),
(203, 'Die-pol3', '', '', '', '', '', '', 'UK', 100, 7, 'data/san_pham/37390306ba_12_f.jpg', 15, 1, '1870000.0000', 0, 0, '2013-07-15', 'http://store.diesel.com/gb/polo_cod37390306fe.html', NULL, NULL, '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, '2013-07-16 11:38:37', '2013-07-16 15:28:08', 5),
(204, 'Die-pol4', '', '', '', '', '', '', 'UK', 100, 7, 'data/san_pham/37444602hm_12_f.jpg', 15, 1, '2720000.0000', 0, 0, '2013-07-15', 'http://store.diesel.com/gb/polo_cod37444602hm.html', NULL, NULL, '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, '2013-07-16 11:46:36', '0000-00-00 00:00:00', 2),
(205, 'Die-pol5', '', '', '', '', '', '', 'UK', 100, 7, 'data/san_pham/37390307fv_12_f.jpg', 15, 1, '1870000.0000', 0, 0, '2013-07-15', 'Áo polo nam Diesel phong cách đến từ ITALIA rất đẹp, Áo thường thiết kế theo kiểu ôm thân, hãng sử dụng các tông mầu tươi và mài bụi khiến ngừoi mặc trông trẻ trung, khỏe mạnh, nam tính hơn. Áo phù hợp với hầu hết các loại quần Jeans. Diesel thường g', NULL, NULL, '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, '2013-07-16 11:59:00', '0000-00-00 00:00:00', 6),
(206, 'Die-pol6', '', '', '', '', '', '', 'UK', 100, 7, 'data/san_pham/37465287bb_12_f.jpg', 15, 1, '2720000.0000', 0, 0, '2013-07-15', 'http://store.diesel.com/gb/polo_cod37465287iw.html', NULL, NULL, '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, '2013-07-16 12:03:50', '2013-07-16 15:28:23', 0),
(207, 'Die-Tsh1', '', '', '', '', '', '', 'UK', 100, 7, 'data/san_pham/37465358qv_12_f.jpg', 15, 1, '5440000.0000', 0, 0, '2013-07-15', 'http://store.diesel.com/gb/short-sleeves_cod37465358tk.html', NULL, NULL, '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, '2013-07-16 12:12:08', '0000-00-00 00:00:00', 8),
(209, 'Zar-Jac3', '', '', '', '', '', '', 'UK', 100, 7, 'data/san_pham/5862421441_1_1_1.jpg', 9, 1, '1320000.0000', 0, 0, '2013-07-15', 'http://www.zara.com/us/en/man/jackets/jacket-with-white-seams-c436192p1048592.html', NULL, NULL, '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, '2013-07-16 14:45:57', '0000-00-00 00:00:00', 6);

-- --------------------------------------------------------

--
-- Table structure for table `product_attribute`
--

CREATE TABLE IF NOT EXISTS `product_attribute` (
  `product_id` int(11) NOT NULL,
  `attribute_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `text` text NOT NULL,
  PRIMARY KEY (`product_id`,`attribute_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `product_description`
--

CREATE TABLE IF NOT EXISTS `product_description` (
  `product_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `sort_description` text NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `meta_keyword` varchar(255) NOT NULL,
  `tag` text NOT NULL,
  PRIMARY KEY (`product_id`,`language_id`),
  KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `product_description`
--

INSERT INTO `product_description` (`product_id`, `language_id`, `name`, `description`, `sort_description`, `meta_description`, `meta_keyword`, `tag`) VALUES
(158, 2, 'Áo sơ mi nam Zara', '&lt;p&gt;Áo sơ mi nam zara với thiết kế cực kì sang trọng, mầu sắc đơn giản, nam tính. Áo rất đẹp khi mặc đi làm&lt;/p&gt;\r\n\r\n&lt;hr /&gt;\r\n&lt;p&gt;&lt;img alt=&quot;Image 1 of OXFORD SHIRT from Zara &quot; class=&quot;image-big gaViewEvent sbdraggable draggableMain&quot; data-=&quot;&quot; data-category=&quot;436197&quot; data-color=&quot;700&quot; data-ga-props=&quot;{action:''Super_Zoom'', opt_label:''Ampliar''}&quot; data-id=&quot;1113098&quot; data-ref=&quot;05445300-V2013&quot; data-zoom-index=&quot;0&quot; data-zoom-url=&quot;//static.zara.net/photos//2013/V/0/2/p/5445/300/700/2/w/1920/5445300700_1_1_1.jpg?timestamp=1373480149908&quot; id=&quot;bigImage&quot; name=&quot;OXFORD SHIRT&quot; src=&quot;//static.zara.net/photos//2013/V/0/2/p/5445/300/700/2/w/400/5445300700_1_1_1.jpg?timestamp=1373480149908&quot; style=&quot;background: none repeat scroll 0% 0% transparent; min-height: 0px; display: inline; visibility: visible; opacity: 1;&quot; /&gt;&lt;img alt=&quot;Image 2 of OXFORD SHIRT from Zara &quot; class=&quot;image-big gaViewEvent sbdraggable draggableMain&quot; data-=&quot;&quot; data-category=&quot;436197&quot; data-color=&quot;700&quot; data-ga-props=&quot;{action:''Super_Zoom'', opt_label:''Ampliar''}&quot; data-id=&quot;1113098&quot; data-ref=&quot;05445300-V2013&quot; data-zoom-index=&quot;1&quot; data-zoom-url=&quot;//static.zara.net/photos//2013/V/0/2/p/5445/300/700/2/w/1920/5445300700_2_1_1.jpg?timestamp=1373480149908&quot; name=&quot;OXFORD SHIRT&quot; src=&quot;//static.zara.net/photos//2013/V/0/2/p/5445/300/700/2/w/400/5445300700_2_1_1.jpg?timestamp=1373480149908&quot; style=&quot;background: none repeat scroll 0% 0% transparent; min-height: 0px; display: inline; visibility: visible; opacity: 1;&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;Image 3 of OXFORD SHIRT from Zara &quot; class=&quot;image-big gaViewEvent sbdraggable draggableMain&quot; data-=&quot;&quot; data-category=&quot;436197&quot; data-color=&quot;700&quot; data-ga-props=&quot;{action:''Super_Zoom'', opt_label:''Ampliar''}&quot; data-id=&quot;1113098&quot; data-ref=&quot;05445300-V2013&quot; data-zoom-index=&quot;2&quot; data-zoom-url=&quot;//static.zara.net/photos//2013/V/0/2/p/5445/300/700/2/w/1920/5445300700_2_2_1.jpg?timestamp=1373480149908&quot; name=&quot;OXFORD SHIRT&quot; src=&quot;//static.zara.net/photos//2013/V/0/2/p/5445/300/700/2/w/400/5445300700_2_2_1.jpg?timestamp=1373480149908&quot; style=&quot;background: none repeat scroll 0% 0% transparent; min-height: 0px; display: inline; visibility: visible; opacity: 1;&quot; /&gt;&lt;img alt=&quot;Image 4 of OXFORD SHIRT from Zara &quot; class=&quot;image-big gaViewEvent sbdraggable draggableMain&quot; data-=&quot;&quot; data-category=&quot;436197&quot; data-color=&quot;700&quot; data-ga-props=&quot;{action:''Super_Zoom'', opt_label:''Ampliar''}&quot; data-id=&quot;1113098&quot; data-ref=&quot;05445300-V2013&quot; data-zoom-index=&quot;3&quot; data-zoom-url=&quot;//static.zara.net/photos//2013/V/0/2/p/5445/300/700/2/w/1920/5445300700_2_3_1.jpg?timestamp=1373480149908&quot; name=&quot;OXFORD SHIRT&quot; src=&quot;//static.zara.net/photos//2013/V/0/2/p/5445/300/700/2/w/400/5445300700_2_3_1.jpg?timestamp=1373480149908&quot; style=&quot;background: none repeat scroll 0% 0% transparent; min-height: 0px; display: inline; visibility: visible; opacity: 1;&quot; /&gt;&lt;/p&gt;\r\n', '&lt;p&gt;Áo sơ mi đơn mầu của zara đây, dáng fit còn 5 mầu cho các anh lựa chọn nhé. Chỉ còn size to.&lt;/p&gt;\r\n', 'Áo sơ mi nam', 'Áo sơ mi zara', 'áo zara, áo sơ mi zara, áo sơ mi, áo sơ mi nam zara, zara'),
(159, 2, 'Áo sơ mi nam Zara', '&lt;p&gt;Áo sơ mi nam zara cổ tầu nhỏ gọn mầu trắng nổi bật, thân áo mầu xanh nhã nhặn đơn giản, dáng áo ôm thân gọn gàng. Áo rất đẹp khi mặc với quần Âu đi làm&lt;/p&gt;\r\n\r\n&lt;hr /&gt;\r\n&lt;p&gt;&lt;img alt=&quot;Image 1 of FINE STRIPED SHIRT WITH CONTRASTING COLLAR from Zara &quot; class=&quot;image-big gaViewEvent sbdraggable draggableMain&quot; data-=&quot;&quot; data-category=&quot;436197&quot; data-color=&quot;403&quot; data-ga-props=&quot;{action:''Super_Zoom'', opt_label:''Ampliar''}&quot; data-id=&quot;1167013&quot; data-ref=&quot;04202265-V2013&quot; data-zoom-index=&quot;0&quot; data-zoom-url=&quot;//static.zara.net/photos//2013/V/0/2/p/4202/265/403/2/w/1920/4202265403_1_1_1.jpg?timestamp=1373480147568&quot; id=&quot;bigImage&quot; name=&quot;FINE STRIPED SHIRT WITH CONTRASTING COLLAR&quot; src=&quot;//static.zara.net/photos//2013/V/0/2/p/4202/265/403/2/w/400/4202265403_1_1_1.jpg?timestamp=1373480147568&quot; style=&quot;background: none repeat scroll 0% 0% transparent; min-height: 0px; display: inline; visibility: visible; opacity: 1;&quot; /&gt;&lt;img alt=&quot;Image 2 of FINE STRIPED SHIRT WITH CONTRASTING COLLAR from Zara &quot; class=&quot;image-big gaViewEvent sbdraggable draggableMain&quot; data-=&quot;&quot; data-category=&quot;436197&quot; data-color=&quot;403&quot; data-ga-props=&quot;{action:''Super_Zoom'', opt_label:''Ampliar''}&quot; data-id=&quot;1167013&quot; data-ref=&quot;04202265-V2013&quot; data-zoom-index=&quot;1&quot; data-zoom-url=&quot;//static.zara.net/photos//2013/V/0/2/p/4202/265/403/2/w/1920/4202265403_2_1_1.jpg?timestamp=1373480147568&quot; name=&quot;FINE STRIPED SHIRT WITH CONTRASTING COLLAR&quot; src=&quot;//static.zara.net/photos//2013/V/0/2/p/4202/265/403/2/w/400/4202265403_2_1_1.jpg?timestamp=1373480147568&quot; style=&quot;background: none repeat scroll 0% 0% transparent; min-height: 0px; display: inline; visibility: visible; opacity: 1;&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;Image 3 of FINE STRIPED SHIRT WITH CONTRASTING COLLAR from Zara &quot; class=&quot;image-big gaViewEvent sbdraggable draggableMain&quot; data-=&quot;&quot; data-category=&quot;436197&quot; data-color=&quot;403&quot; data-ga-props=&quot;{action:''Super_Zoom'', opt_label:''Ampliar''}&quot; data-id=&quot;1167013&quot; data-ref=&quot;04202265-V2013&quot; data-zoom-index=&quot;2&quot; data-zoom-url=&quot;//static.zara.net/photos//2013/V/0/2/p/4202/265/403/2/w/1920/4202265403_2_2_1.jpg?timestamp=1373480147568&quot; name=&quot;FINE STRIPED SHIRT WITH CONTRASTING COLLAR&quot; src=&quot;//static.zara.net/photos//2013/V/0/2/p/4202/265/403/2/w/400/4202265403_2_2_1.jpg?timestamp=1373480147568&quot; style=&quot;background: none repeat scroll 0% 0% transparent; min-height: 0px; display: inline; visibility: visible; opacity: 1;&quot; /&gt;&lt;img alt=&quot;Image 4 of FINE STRIPED SHIRT WITH CONTRASTING COLLAR from Zara &quot; class=&quot;image-big gaViewEvent sbdraggable draggableMain&quot; data-=&quot;&quot; data-category=&quot;436197&quot; data-color=&quot;403&quot; data-ga-props=&quot;{action:''Super_Zoom'', opt_label:''Ampliar''}&quot; data-id=&quot;1167013&quot; data-ref=&quot;04202265-V2013&quot; data-zoom-index=&quot;3&quot; data-zoom-url=&quot;//static.zara.net/photos//2013/V/0/2/p/4202/265/403/2/w/1920/4202265403_2_3_1.jpg?timestamp=1373480147568&quot; name=&quot;FINE STRIPED SHIRT WITH CONTRASTING COLLAR&quot; src=&quot;//static.zara.net/photos//2013/V/0/2/p/4202/265/403/2/w/400/4202265403_2_3_1.jpg?timestamp=1373480147568&quot; style=&quot;background: none repeat scroll 0% 0% transparent; min-height: 0px; display: inline; visibility: visible; opacity: 1;&quot; /&gt;&lt;/p&gt;\r\n', '&lt;p&gt;Áo sơ mi zara cổ tầu nhỏ giá chỉ còn 30 USD :D&lt;/p&gt;\r\n', 'áo sơ mi nam', 'áo sơ mi zara', 'áo zara, áo sơ mi zara, áo sơ mi, áo sơ mi nam zara, zara'),
(153, 2, 'Áo khoác zara', '&lt;p&gt;Áo khoác da zara được thiết kế với phong cách bụi bặm, nam tính nhưng vẫn giữ được nét trẻ trung vốn có. Nhà thiết kế sử dụng tông mầu ghi trầm cơ bản với độ mài trên mặt vải vừa phải tạo cảm giác tự nhiên. Dáng áo ôm thân nhỏ gọn, đường nét đơn giản. Áo rất dễ phối với các loại quần Jeans hay quần kaki tối mầu.&lt;/p&gt;\r\n\r\n&lt;hr /&gt;\r\n&lt;p&gt;&lt;img alt=&quot;Image 1 of JACKET WITH CONTRASTING SLEEVES from Zara &quot; src=&quot;http://static.zara.net/photos//2013/V/0/2/p/2398/400/711/2/w/400/2398400711_1_1_1.jpg?timestamp=1373480146648&quot; /&gt;&lt;img alt=&quot;Image 2 of JACKET WITH CONTRASTING SLEEVES from Zara &quot; src=&quot;http://static.zara.net/photos//2013/V/0/2/p/2398/400/711/2/w/400/2398400711_2_1_1.jpg?timestamp=1373480146648&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;Image 3 of JACKET WITH CONTRASTING SLEEVES from Zara &quot; src=&quot;http://static.zara.net/photos//2013/V/0/2/p/2398/400/711/2/w/400/2398400711_2_2_1.jpg?timestamp=1373480146648&quot; /&gt;&lt;img alt=&quot;Image 4 of JACKET WITH CONTRASTING SLEEVES from Zara &quot; src=&quot;http://static.zara.net/photos//2013/V/0/2/p/2398/400/711/2/w/400/2398400711_2_3_1.jpg?timestamp=1373480146648&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n', '&lt;p&gt;Áo khoác da siêu đẹp của zara đang sale off các bạn nhé&lt;/p&gt;\r\n', 'Áo khoác zara làm từ chất liệu da', 'Áo khoác zara', 'áo khoác, áo khoác zara, zara, áo khoác da, áo khoác da zara'),
(154, 2, 'Áo sơ mi nam zara', '&lt;p&gt;Áo sơ mi bò zara được thiết kế với dáng áo nhỏ gọn ôm thân,chi tiết áo là những đường kẻ sọc dọc chìm, mầu xanh trẻ trung nhạt mài nhẹ là mầu chủ đạo. Áo phù hợp với quần Jeans hoặc quần Kaki&lt;/p&gt;\r\n\r\n&lt;hr /&gt;\r\n&lt;p&gt;&lt;img alt=&quot;Image 1 of STRIPED DENIM SHIRT from Zara &quot; class=&quot;image-big gaViewEvent sbdraggable draggableMain&quot; data-=&quot;&quot; data-category=&quot;436197&quot; data-color=&quot;400&quot; data-ga-props=&quot;{action:''Super_Zoom'', opt_label:''Ampliar''}&quot; data-id=&quot;1047855&quot; data-ref=&quot;07248400-V2013&quot; data-zoom-index=&quot;0&quot; data-zoom-url=&quot;//static.zara.net/photos//2013/V/0/2/p/7248/400/400/2/w/1920/7248400400_1_1_1.jpg?timestamp=1373480154348&quot; id=&quot;bigImage&quot; name=&quot;STRIPED DENIM SHIRT&quot; src=&quot;//static.zara.net/photos//2013/V/0/2/p/7248/400/400/2/w/400/7248400400_1_1_1.jpg?timestamp=1373480154348&quot; style=&quot;background: none repeat scroll 0% 0% transparent; min-height: 0px; display: inline; visibility: visible; opacity: 1;&quot; /&gt;&lt;img alt=&quot;Image 2 of STRIPED DENIM SHIRT from Zara &quot; class=&quot;image-big gaViewEvent sbdraggable draggableMain&quot; data-=&quot;&quot; data-category=&quot;436197&quot; data-color=&quot;400&quot; data-ga-props=&quot;{action:''Super_Zoom'', opt_label:''Ampliar''}&quot; data-id=&quot;1047855&quot; data-ref=&quot;07248400-V2013&quot; data-zoom-index=&quot;1&quot; data-zoom-url=&quot;//static.zara.net/photos//2013/V/0/2/p/7248/400/400/2/w/1920/7248400400_2_1_1.jpg?timestamp=1373480154348&quot; name=&quot;STRIPED DENIM SHIRT&quot; src=&quot;//static.zara.net/photos//2013/V/0/2/p/7248/400/400/2/w/400/7248400400_2_1_1.jpg?timestamp=1373480154348&quot; style=&quot;background: none repeat scroll 0% 0% transparent; min-height: 0px; display: inline; visibility: visible; opacity: 1;&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;Image 3 of STRIPED DENIM SHIRT from Zara &quot; class=&quot;image-big gaViewEvent sbdraggable draggableMain&quot; data-=&quot;&quot; data-category=&quot;436197&quot; data-color=&quot;400&quot; data-ga-props=&quot;{action:''Super_Zoom'', opt_label:''Ampliar''}&quot; data-id=&quot;1047855&quot; data-ref=&quot;07248400-V2013&quot; data-zoom-index=&quot;2&quot; data-zoom-url=&quot;//static.zara.net/photos//2013/V/0/2/p/7248/400/400/2/w/1920/7248400400_2_2_1.jpg?timestamp=1373480154348&quot; name=&quot;STRIPED DENIM SHIRT&quot; src=&quot;//static.zara.net/photos//2013/V/0/2/p/7248/400/400/2/w/400/7248400400_2_2_1.jpg?timestamp=1373480154348&quot; style=&quot;background: none repeat scroll 0% 0% transparent; min-height: 0px; display: inline; visibility: visible; opacity: 1;&quot; /&gt;&lt;img alt=&quot;Image 4 of STRIPED DENIM SHIRT from Zara &quot; class=&quot;image-big gaViewEvent sbdraggable draggableMain&quot; data-=&quot;&quot; data-category=&quot;436197&quot; data-color=&quot;400&quot; data-ga-props=&quot;{action:''Super_Zoom'', opt_label:''Ampliar''}&quot; data-id=&quot;1047855&quot; data-ref=&quot;07248400-V2013&quot; data-zoom-index=&quot;3&quot; data-zoom-url=&quot;//static.zara.net/photos//2013/V/0/2/p/7248/400/400/2/w/1920/7248400400_2_3_1.jpg?timestamp=1373480154348&quot; name=&quot;STRIPED DENIM SHIRT&quot; src=&quot;//static.zara.net/photos//2013/V/0/2/p/7248/400/400/2/w/400/7248400400_2_3_1.jpg?timestamp=1373480154348&quot; style=&quot;background: none repeat scroll 0% 0% transparent; min-height: 0px; display: inline; visibility: visible; opacity: 1;&quot; /&gt;&lt;/p&gt;\r\n', '&lt;p&gt;Áo sơ mi bò sáng mầu Zara chỉ còn 30 USD thôi! Nhanh tay nào anh em ơi :D Vẫn đang còn đủ size nhé&lt;/p&gt;\r\n', 'Áo sơ mi cho nam', 'Áo sơ mi zara', 'áo zara, áo sơ mi zara, áo sơ mi, áo sơ mi nam zara, zara'),
(155, 2, 'Áo sơ mi nam Zara', '&lt;p&gt;Áo sơ mi nam Zara được thiết kế đặc biệt với mầu cổ áo là mầu đỏ tạo điểm nhấn, thân áo mầu nâu nhạt rất sang trọng, dáng áo nhỏ gọn ôm thân thật là đẹp&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;Image 5 of SHIRT WITH CONTRASTING COLLAR from Zara &quot; class=&quot;image-big gaViewEvent sbdraggable draggableMain&quot; data-=&quot;&quot; data-category=&quot;436197&quot; data-color=&quot;505&quot; data-ga-props=&quot;{action:''Super_Zoom'', opt_label:''Ampliar''}&quot; data-id=&quot;1103036&quot; data-ref=&quot;04085527-V2013&quot; data-zoom-index=&quot;4&quot; data-zoom-url=&quot;//static.zara.net/photos//2013/V/0/2/p/4085/527/505/2/w/1920/4085527505_2_4_1.jpg?timestamp=1373480147368&quot; name=&quot;SHIRT WITH CONTRASTING COLLAR&quot; src=&quot;//static.zara.net/photos//2013/V/0/2/p/4085/527/505/2/w/400/4085527505_2_4_1.jpg?timestamp=1373480147368&quot; style=&quot;background: none repeat scroll 0% 0% transparent; min-height: 0px; display: inline; visibility: visible; opacity: 1;&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;Image 1 of SHIRT WITH CONTRASTING COLLAR from Zara &quot; class=&quot;image-big gaViewEvent sbdraggable draggableMain&quot; data-=&quot;&quot; data-category=&quot;436197&quot; data-color=&quot;505&quot; data-ga-props=&quot;{action:''Super_Zoom'', opt_label:''Ampliar''}&quot; data-id=&quot;1103036&quot; data-ref=&quot;04085527-V2013&quot; data-zoom-index=&quot;0&quot; data-zoom-url=&quot;//static.zara.net/photos//2013/V/0/2/p/4085/527/505/2/w/1920/4085527505_1_1_1.jpg?timestamp=1373480147368&quot; id=&quot;bigImage&quot; name=&quot;SHIRT WITH CONTRASTING COLLAR&quot; src=&quot;//static.zara.net/photos//2013/V/0/2/p/4085/527/505/2/w/400/4085527505_1_1_1.jpg?timestamp=1373480147368&quot; style=&quot;background: none repeat scroll 0% 0% transparent; min-height: 0px; display: inline; visibility: visible; opacity: 1;&quot; /&gt;&lt;img alt=&quot;Image 2 of SHIRT WITH CONTRASTING COLLAR from Zara &quot; class=&quot;image-big gaViewEvent sbdraggable draggableMain&quot; data-=&quot;&quot; data-category=&quot;436197&quot; data-color=&quot;505&quot; data-ga-props=&quot;{action:''Super_Zoom'', opt_label:''Ampliar''}&quot; data-id=&quot;1103036&quot; data-ref=&quot;04085527-V2013&quot; data-zoom-index=&quot;1&quot; data-zoom-url=&quot;//static.zara.net/photos//2013/V/0/2/p/4085/527/505/2/w/1920/4085527505_2_1_1.jpg?timestamp=1373480147368&quot; name=&quot;SHIRT WITH CONTRASTING COLLAR&quot; src=&quot;//static.zara.net/photos//2013/V/0/2/p/4085/527/505/2/w/400/4085527505_2_1_1.jpg?timestamp=1373480147368&quot; style=&quot;background: none repeat scroll 0% 0% transparent; min-height: 0px; display: inline; visibility: visible; opacity: 1;&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;Image 3 of SHIRT WITH CONTRASTING COLLAR from Zara &quot; class=&quot;image-big gaViewEvent sbdraggable draggableMain&quot; data-=&quot;&quot; data-category=&quot;436197&quot; data-color=&quot;505&quot; data-ga-props=&quot;{action:''Super_Zoom'', opt_label:''Ampliar''}&quot; data-id=&quot;1103036&quot; data-ref=&quot;04085527-V2013&quot; data-zoom-index=&quot;2&quot; data-zoom-url=&quot;//static.zara.net/photos//2013/V/0/2/p/4085/527/505/2/w/1920/4085527505_2_2_1.jpg?timestamp=1373480147368&quot; name=&quot;SHIRT WITH CONTRASTING COLLAR&quot; src=&quot;//static.zara.net/photos//2013/V/0/2/p/4085/527/505/2/w/400/4085527505_2_2_1.jpg?timestamp=1373480147368&quot; style=&quot;background: none repeat scroll 0% 0% transparent; min-height: 0px; display: inline; visibility: visible; opacity: 1;&quot; /&gt;&lt;img alt=&quot;Image 4 of SHIRT WITH CONTRASTING COLLAR from Zara &quot; class=&quot;image-big gaViewEvent sbdraggable draggableMain&quot; data-=&quot;&quot; data-category=&quot;436197&quot; data-color=&quot;505&quot; data-ga-props=&quot;{action:''Super_Zoom'', opt_label:''Ampliar''}&quot; data-id=&quot;1103036&quot; data-ref=&quot;04085527-V2013&quot; data-zoom-index=&quot;3&quot; data-zoom-url=&quot;//static.zara.net/photos//2013/V/0/2/p/4085/527/505/2/w/1920/4085527505_2_3_1.jpg?timestamp=1373480147368&quot; name=&quot;SHIRT WITH CONTRASTING COLLAR&quot; src=&quot;//static.zara.net/photos//2013/V/0/2/p/4085/527/505/2/w/400/4085527505_2_3_1.jpg?timestamp=1373480147368&quot; style=&quot;background: none repeat scroll 0% 0% transparent; min-height: 0px; display: inline; visibility: visible; opacity: 1;&quot; /&gt;&lt;/p&gt;\r\n', '&lt;p&gt;Áo sơ mi zara mẫu cổ đỏ HOT giá đang giảm chỉ còn 30 USD, chất liệu siêu mát nhé.&lt;/p&gt;\r\n', 'Áo sơ mi nam zara', 'Áo sơ mi zara', 'áo zara, áo sơ mi zara, áo sơ mi, áo sơ mi nam zara, zara'),
(156, 2, 'Áo sơ mi nam Zara', '&lt;p&gt;Áo sơ mi nam zara mầu xanh nước biển , với chất liệu 100% cotton rất mát mẻ. Dáng áo ôm thân. Mặc với quần Âu hay quần Jeans đều đẹp&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;Image 1 of GEOMETRIC PRINT SHIRT from Zara &quot; class=&quot;image-big gaViewEvent sbdraggable draggableMain&quot; data-=&quot;&quot; data-category=&quot;436197&quot; data-color=&quot;400&quot; data-ga-props=&quot;{action:''Super_Zoom'', opt_label:''Ampliar''}&quot; data-id=&quot;1103024&quot; data-ref=&quot;04164414-V2013&quot; data-zoom-index=&quot;0&quot; data-zoom-url=&quot;//static.zara.net/photos//2013/V/0/2/p/4164/414/400/2/w/1920/4164414400_1_1_1.jpg?timestamp=1373480147508&quot; id=&quot;bigImage&quot; name=&quot;GEOMETRIC PRINT SHIRT&quot; src=&quot;//static.zara.net/photos//2013/V/0/2/p/4164/414/400/2/w/400/4164414400_1_1_1.jpg?timestamp=1373480147508&quot; style=&quot;background: none repeat scroll 0% 0% transparent; min-height: 0px; display: inline; visibility: visible; opacity: 1;&quot; /&gt;&lt;img alt=&quot;Image 2 of GEOMETRIC PRINT SHIRT from Zara &quot; class=&quot;image-big gaViewEvent sbdraggable draggableMain&quot; data-=&quot;&quot; data-category=&quot;436197&quot; data-color=&quot;400&quot; data-ga-props=&quot;{action:''Super_Zoom'', opt_label:''Ampliar''}&quot; data-id=&quot;1103024&quot; data-ref=&quot;04164414-V2013&quot; data-zoom-index=&quot;1&quot; data-zoom-url=&quot;//static.zara.net/photos//2013/V/0/2/p/4164/414/400/2/w/1920/4164414400_2_1_1.jpg?timestamp=1373480147508&quot; name=&quot;GEOMETRIC PRINT SHIRT&quot; src=&quot;//static.zara.net/photos//2013/V/0/2/p/4164/414/400/2/w/400/4164414400_2_1_1.jpg?timestamp=1373480147508&quot; style=&quot;background: none repeat scroll 0% 0% transparent; min-height: 0px; display: inline; visibility: visible; opacity: 1;&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;Image 3 of GEOMETRIC PRINT SHIRT from Zara &quot; class=&quot;image-big gaViewEvent sbdraggable draggableMain&quot; data-=&quot;&quot; data-category=&quot;436197&quot; data-color=&quot;400&quot; data-ga-props=&quot;{action:''Super_Zoom'', opt_label:''Ampliar''}&quot; data-id=&quot;1103024&quot; data-ref=&quot;04164414-V2013&quot; data-zoom-index=&quot;2&quot; data-zoom-url=&quot;//static.zara.net/photos//2013/V/0/2/p/4164/414/400/2/w/1920/4164414400_2_2_1.jpg?timestamp=1373480147508&quot; name=&quot;GEOMETRIC PRINT SHIRT&quot; src=&quot;//static.zara.net/photos//2013/V/0/2/p/4164/414/400/2/w/400/4164414400_2_2_1.jpg?timestamp=1373480147508&quot; style=&quot;background: none repeat scroll 0% 0% transparent; min-height: 0px; display: inline; visibility: visible; opacity: 1;&quot; /&gt;&lt;img alt=&quot;Image 4 of GEOMETRIC PRINT SHIRT from Zara &quot; class=&quot;image-big gaViewEvent sbdraggable draggableMain&quot; data-=&quot;&quot; data-category=&quot;436197&quot; data-color=&quot;400&quot; data-ga-props=&quot;{action:''Super_Zoom'', opt_label:''Ampliar''}&quot; data-id=&quot;1103024&quot; data-ref=&quot;04164414-V2013&quot; data-zoom-index=&quot;3&quot; data-zoom-url=&quot;//static.zara.net/photos//2013/V/0/2/p/4164/414/400/2/w/1920/4164414400_2_3_1.jpg?timestamp=1373480147508&quot; name=&quot;GEOMETRIC PRINT SHIRT&quot; src=&quot;//static.zara.net/photos//2013/V/0/2/p/4164/414/400/2/w/400/4164414400_2_3_1.jpg?timestamp=1373480147508&quot; style=&quot;background: none repeat scroll 0% 0% transparent; min-height: 0px; display: inline; visibility: visible; opacity: 1;&quot; /&gt;&lt;/p&gt;\r\n', '&lt;p&gt;Áo sơ mi hình thoi xanh bạc hà cực mát đây!! Đồng giá 30 USD&lt;/p&gt;\r\n', 'Áo sơ mi cho nam', 'Áo sơ mi zara', 'áo zara, áo sơ mi zara, áo sơ mi, áo sơ mi nam zara, zara'),
(157, 2, 'Áo sơ mi nam Zara', '&lt;p&gt;Áo sơ mi trắng của zara chất liệu cotton mát nhẹ, dáng áo gọn gàng ôm thân. Áo rất đẹp khi mặc với quần Âu&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;Image 1 of POPLIN SHIRT WITH CLUB COLLAR from Zara &quot; class=&quot;image-big gaViewEvent sbdraggable draggableMain&quot; data-=&quot;&quot; data-category=&quot;436197&quot; data-color=&quot;250&quot; data-ga-props=&quot;{action:''Super_Zoom'', opt_label:''Ampliar''}&quot; data-id=&quot;1079508&quot; data-ref=&quot;06519405-V2013&quot; data-zoom-index=&quot;0&quot; data-zoom-url=&quot;//static.zara.net/photos//2013/V/0/2/p/6519/405/250/2/w/1920/6519405250_1_1_1.jpg?timestamp=1373480109538&quot; id=&quot;bigImage&quot; name=&quot;POPLIN SHIRT WITH CLUB COLLAR&quot; src=&quot;//static.zara.net/photos//2013/V/0/2/p/6519/405/250/2/w/400/6519405250_1_1_1.jpg?timestamp=1373480109538&quot; style=&quot;background: none repeat scroll 0% 0% transparent; min-height: 0px; display: inline; visibility: visible; opacity: 1;&quot; /&gt;&lt;img alt=&quot;Image 2 of POPLIN SHIRT WITH CLUB COLLAR from Zara &quot; class=&quot;image-big gaViewEvent sbdraggable draggableMain&quot; data-=&quot;&quot; data-category=&quot;436197&quot; data-color=&quot;250&quot; data-ga-props=&quot;{action:''Super_Zoom'', opt_label:''Ampliar''}&quot; data-id=&quot;1079508&quot; data-ref=&quot;06519405-V2013&quot; data-zoom-index=&quot;1&quot; data-zoom-url=&quot;//static.zara.net/photos//2013/V/0/2/p/6519/405/250/2/w/1920/6519405250_2_1_1.jpg?timestamp=1373480109538&quot; name=&quot;POPLIN SHIRT WITH CLUB COLLAR&quot; src=&quot;//static.zara.net/photos//2013/V/0/2/p/6519/405/250/2/w/400/6519405250_2_1_1.jpg?timestamp=1373480109538&quot; style=&quot;background: none repeat scroll 0% 0% transparent; min-height: 0px; display: inline; visibility: visible; opacity: 1;&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;Image 3 of POPLIN SHIRT WITH CLUB COLLAR from Zara &quot; class=&quot;image-big gaViewEvent sbdraggable draggableMain&quot; data-=&quot;&quot; data-category=&quot;436197&quot; data-color=&quot;250&quot; data-ga-props=&quot;{action:''Super_Zoom'', opt_label:''Ampliar''}&quot; data-id=&quot;1079508&quot; data-ref=&quot;06519405-V2013&quot; data-zoom-index=&quot;2&quot; data-zoom-url=&quot;//static.zara.net/photos//2013/V/0/2/p/6519/405/250/2/w/1920/6519405250_2_2_1.jpg?timestamp=1373480109538&quot; name=&quot;POPLIN SHIRT WITH CLUB COLLAR&quot; src=&quot;//static.zara.net/photos//2013/V/0/2/p/6519/405/250/2/w/400/6519405250_2_2_1.jpg?timestamp=1373480109538&quot; style=&quot;background: none repeat scroll 0% 0% transparent; min-height: 0px; display: inline; visibility: visible; opacity: 1;&quot; /&gt;&lt;img alt=&quot;Image 4 of POPLIN SHIRT WITH CLUB COLLAR from Zara &quot; class=&quot;image-big gaViewEvent sbdraggable draggableMain&quot; data-=&quot;&quot; data-category=&quot;436197&quot; data-color=&quot;250&quot; data-ga-props=&quot;{action:''Super_Zoom'', opt_label:''Ampliar''}&quot; data-id=&quot;1079508&quot; data-ref=&quot;06519405-V2013&quot; data-zoom-index=&quot;3&quot; data-zoom-url=&quot;//static.zara.net/photos//2013/V/0/2/p/6519/405/250/2/w/1920/6519405250_2_3_1.jpg?timestamp=1373480109538&quot; name=&quot;POPLIN SHIRT WITH CLUB COLLAR&quot; src=&quot;//static.zara.net/photos//2013/V/0/2/p/6519/405/250/2/w/400/6519405250_2_3_1.jpg?timestamp=1373480109538&quot; style=&quot;background: none repeat scroll 0% 0% transparent; min-height: 0px; display: inline; visibility: visible; opacity: 1;&quot; /&gt;&lt;/p&gt;\r\n', '&lt;p&gt;Áo sơ mi trắng zara cổ góc tròn cực sang ! Giá chỉ còn 26 USD&lt;/p&gt;\r\n', 'Áo sơ mi nam', 'Áo sơ mi zara', ''),
(160, 2, 'Áo sơ mi nam Zara', '&lt;p&gt;Ao sơ mi zara được làm từ chất liệu cotton mỏng mặc rất mát, họa tiết hoa nhỏ là điểm nhấn của áo tạo cảm giác nhẹ nhàng, thanh lịch. Dáng áo nhỏ gọn, áo rất đẹp khi mặc với quần kaki hoặc quần jeans&lt;/p&gt;\r\n\r\n&lt;hr /&gt;\r\n&lt;p&gt;&lt;img alt=&quot;Image 1 of FLORAL SHIRT from Zara &quot; class=&quot;image-big gaViewEvent sbdraggable draggableMain&quot; data-=&quot;&quot; data-category=&quot;436197&quot; data-color=&quot;400&quot; data-ga-props=&quot;{action:''Super_Zoom'', opt_label:''Ampliar''}&quot; data-id=&quot;1047931&quot; data-ref=&quot;06887402-V2013&quot; data-zoom-index=&quot;0&quot; data-zoom-url=&quot;//static.zara.net/photos//2013/V/0/2/p/6887/402/400/2/w/1920/6887402400_1_1_1.jpg?timestamp=1373480110308&quot; id=&quot;bigImage&quot; name=&quot;FLORAL SHIRT&quot; src=&quot;//static.zara.net/photos//2013/V/0/2/p/6887/402/400/2/w/400/6887402400_1_1_1.jpg?timestamp=1373480110308&quot; style=&quot;background: none repeat scroll 0% 0% transparent; min-height: 0px; display: inline; visibility: visible; opacity: 1;&quot; /&gt;&lt;img alt=&quot;Image 2 of FLORAL SHIRT from Zara &quot; class=&quot;image-big gaViewEvent sbdraggable draggableMain&quot; data-=&quot;&quot; data-category=&quot;436197&quot; data-color=&quot;400&quot; data-ga-props=&quot;{action:''Super_Zoom'', opt_label:''Ampliar''}&quot; data-id=&quot;1047931&quot; data-ref=&quot;06887402-V2013&quot; data-zoom-index=&quot;1&quot; data-zoom-url=&quot;//static.zara.net/photos//2013/V/0/2/p/6887/402/400/2/w/1920/6887402400_2_1_1.jpg?timestamp=1373480110308&quot; name=&quot;FLORAL SHIRT&quot; src=&quot;//static.zara.net/photos//2013/V/0/2/p/6887/402/400/2/w/400/6887402400_2_1_1.jpg?timestamp=1373480110308&quot; style=&quot;background: none repeat scroll 0% 0% transparent; min-height: 0px; display: inline; visibility: visible; opacity: 1;&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;Image 3 of FLORAL SHIRT from Zara &quot; class=&quot;image-big gaViewEvent sbdraggable draggableMain&quot; data-=&quot;&quot; data-category=&quot;436197&quot; data-color=&quot;400&quot; data-ga-props=&quot;{action:''Super_Zoom'', opt_label:''Ampliar''}&quot; data-id=&quot;1047931&quot; data-ref=&quot;06887402-V2013&quot; data-zoom-index=&quot;2&quot; data-zoom-url=&quot;//static.zara.net/photos//2013/V/0/2/p/6887/402/400/2/w/1920/6887402400_2_2_1.jpg?timestamp=1373480110308&quot; name=&quot;FLORAL SHIRT&quot; src=&quot;//static.zara.net/photos//2013/V/0/2/p/6887/402/400/2/w/400/6887402400_2_2_1.jpg?timestamp=1373480110308&quot; style=&quot;background: none repeat scroll 0% 0% transparent; min-height: 0px; display: inline; visibility: visible; opacity: 1;&quot; /&gt;&lt;img alt=&quot;Image 4 of FLORAL SHIRT from Zara &quot; class=&quot;image-big gaViewEvent sbdraggable draggableMain&quot; data-=&quot;&quot; data-category=&quot;436197&quot; data-color=&quot;400&quot; data-ga-props=&quot;{action:''Super_Zoom'', opt_label:''Ampliar''}&quot; data-id=&quot;1047931&quot; data-ref=&quot;06887402-V2013&quot; data-zoom-index=&quot;3&quot; data-zoom-url=&quot;//static.zara.net/photos//2013/V/0/2/p/6887/402/400/2/w/1920/6887402400_2_3_1.jpg?timestamp=1373480110308&quot; name=&quot;FLORAL SHIRT&quot; src=&quot;//static.zara.net/photos//2013/V/0/2/p/6887/402/400/2/w/400/6887402400_2_3_1.jpg?timestamp=1373480110308&quot; style=&quot;background: none repeat scroll 0% 0% transparent; min-height: 0px; display: inline; visibility: visible; opacity: 1;&quot; /&gt;&lt;/p&gt;\r\n', '&lt;p&gt;Áo sơ mi zara hoa nhỏ mốt năm nay đây anh em. Sale off còn 30 USD nhé&lt;/p&gt;\r\n', 'Áo sơ mi nam', 'Áo sơ mi zara', 'áo zara, áo sơ mi zara, áo sơ mi, áo sơ mi nam zara, zara'),
(161, 2, 'Áo sơ mi nam Zara', '&lt;p&gt;Áo sơ mi zara được thiết kế với phong cách trẻ trung, nhà thiết kế sử dụng tông mầu xanh nhẹ tạo cảm giác tươi mát cho người mặc, dáng áo nhỏ gọn ôm thân thích hợp khi mặc với quần Jeans hoặc quần kaki&lt;/p&gt;\r\n\r\n&lt;hr /&gt;\r\n&lt;p&gt;&lt;img alt=&quot;Image 1 of PRINTED SHIRT from Zara &quot; class=&quot;image-big gaViewEvent sbdraggable draggableMain&quot; data-=&quot;&quot; data-category=&quot;436197&quot; data-color=&quot;400&quot; data-ga-props=&quot;{action:''Super_Zoom'', opt_label:''Ampliar''}&quot; data-id=&quot;1292510&quot; data-ref=&quot;04286417-V2013&quot; data-zoom-index=&quot;0&quot; data-zoom-url=&quot;//static.zara.net/photos//2013/V/0/2/p/4286/417/400/2/w/1920/4286417400_1_1_1.jpg?timestamp=1373480154048&quot; id=&quot;bigImage&quot; name=&quot;PRINTED SHIRT&quot; src=&quot;//static.zara.net/photos//2013/V/0/2/p/4286/417/400/2/w/400/4286417400_1_1_1.jpg?timestamp=1373480154048&quot; style=&quot;background: none repeat scroll 0% 0% transparent; min-height: 0px; display: inline; visibility: visible; opacity: 1;&quot; /&gt;&lt;img alt=&quot;Image 2 of PRINTED SHIRT from Zara &quot; class=&quot;image-big gaViewEvent sbdraggable draggableMain&quot; data-=&quot;&quot; data-category=&quot;436197&quot; data-color=&quot;400&quot; data-ga-props=&quot;{action:''Super_Zoom'', opt_label:''Ampliar''}&quot; data-id=&quot;1292510&quot; data-ref=&quot;04286417-V2013&quot; data-zoom-index=&quot;1&quot; data-zoom-url=&quot;//static.zara.net/photos//2013/V/0/2/p/4286/417/400/2/w/1920/4286417400_2_1_1.jpg?timestamp=1373480154048&quot; name=&quot;PRINTED SHIRT&quot; src=&quot;//static.zara.net/photos//2013/V/0/2/p/4286/417/400/2/w/400/4286417400_2_1_1.jpg?timestamp=1373480154048&quot; style=&quot;background: none repeat scroll 0% 0% transparent; min-height: 0px; display: inline; visibility: visible; opacity: 1;&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;Image 3 of PRINTED SHIRT from Zara &quot; class=&quot;image-big gaViewEvent sbdraggable draggableMain&quot; data-=&quot;&quot; data-category=&quot;436197&quot; data-color=&quot;400&quot; data-ga-props=&quot;{action:''Super_Zoom'', opt_label:''Ampliar''}&quot; data-id=&quot;1292510&quot; data-ref=&quot;04286417-V2013&quot; data-zoom-index=&quot;2&quot; data-zoom-url=&quot;//static.zara.net/photos//2013/V/0/2/p/4286/417/400/2/w/1920/4286417400_2_2_1.jpg?timestamp=1373480154048&quot; name=&quot;PRINTED SHIRT&quot; src=&quot;//static.zara.net/photos//2013/V/0/2/p/4286/417/400/2/w/400/4286417400_2_2_1.jpg?timestamp=1373480154048&quot; style=&quot;background: none repeat scroll 0% 0% transparent; min-height: 0px; display: inline; visibility: visible; opacity: 1;&quot; /&gt;&lt;img alt=&quot;Image 4 of PRINTED SHIRT from Zara &quot; class=&quot;image-big gaViewEvent sbdraggable draggableMain&quot; data-=&quot;&quot; data-category=&quot;436197&quot; data-color=&quot;400&quot; data-ga-props=&quot;{action:''Super_Zoom'', opt_label:''Ampliar''}&quot; data-id=&quot;1292510&quot; data-ref=&quot;04286417-V2013&quot; data-zoom-index=&quot;3&quot; data-zoom-url=&quot;//static.zara.net/photos//2013/V/0/2/p/4286/417/400/2/w/1920/4286417400_2_3_1.jpg?timestamp=1373480154048&quot; name=&quot;PRINTED SHIRT&quot; src=&quot;//static.zara.net/photos//2013/V/0/2/p/4286/417/400/2/w/400/4286417400_2_3_1.jpg?timestamp=1373480154048&quot; style=&quot;background: none repeat scroll 0% 0% transparent; min-height: 0px; display: inline; visibility: visible; opacity: 1;&quot; /&gt;&lt;/p&gt;\r\n', '&lt;p&gt;Áo sơ mi zara mầu xanh bạc hà siêu đẹp. Mua ngay giá chỉ 30USD&lt;/p&gt;\r\n', 'Áo sơ mi nam', 'Áo sơ mi zara', 'áo zara, áo sơ mi zara, áo sơ mi, áo sơ mi nam zara, zara'),
(162, 2, 'Áo sơ mi nam Zara', '&lt;p&gt;Áo sơ mi nam zara kẻ sọc nhỏ mầu xanh, cổ góc tròn nhỏ rất sang trọng, dáng áo ôm thân gọn gàng trẻ trung, áo rất đẹp khi mặc với quần Âu đi làm&lt;/p&gt;\r\n\r\n&lt;hr /&gt;\r\n&lt;p&gt;&lt;img alt=&quot;Image 1 of STRIPED SHIRT from Zara &quot; class=&quot;image-big gaViewEvent sbdraggable draggableMain&quot; data-=&quot;&quot; data-category=&quot;436197&quot; data-color=&quot;400&quot; data-ga-props=&quot;{action:''Super_Zoom'', opt_label:''Ampliar''}&quot; data-id=&quot;1047633&quot; data-ref=&quot;03894400-V2013&quot; data-zoom-index=&quot;0&quot; data-zoom-url=&quot;//static.zara.net/photos//2013/V/0/2/p/3894/400/400/2/w/1920/3894400400_1_1_1.jpg?timestamp=1373480146988&quot; id=&quot;bigImage&quot; name=&quot;STRIPED SHIRT&quot; src=&quot;//static.zara.net/photos//2013/V/0/2/p/3894/400/400/2/w/400/3894400400_1_1_1.jpg?timestamp=1373480146988&quot; style=&quot;background: none repeat scroll 0% 0% transparent; min-height: 0px; display: inline; visibility: visible; opacity: 1;&quot; /&gt;&lt;img alt=&quot;Image 2 of STRIPED SHIRT from Zara &quot; class=&quot;image-big gaViewEvent sbdraggable draggableMain&quot; data-=&quot;&quot; data-category=&quot;436197&quot; data-color=&quot;400&quot; data-ga-props=&quot;{action:''Super_Zoom'', opt_label:''Ampliar''}&quot; data-id=&quot;1047633&quot; data-ref=&quot;03894400-V2013&quot; data-zoom-index=&quot;1&quot; data-zoom-url=&quot;//static.zara.net/photos//2013/V/0/2/p/3894/400/400/2/w/1920/3894400400_2_1_1.jpg?timestamp=1373480146988&quot; name=&quot;STRIPED SHIRT&quot; src=&quot;//static.zara.net/photos//2013/V/0/2/p/3894/400/400/2/w/400/3894400400_2_1_1.jpg?timestamp=1373480146988&quot; style=&quot;background: none repeat scroll 0% 0% transparent; min-height: 0px; display: inline; visibility: visible; opacity: 1;&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;Image 3 of STRIPED SHIRT from Zara &quot; class=&quot;image-big gaViewEvent sbdraggable draggableMain&quot; data-=&quot;&quot; data-category=&quot;436197&quot; data-color=&quot;400&quot; data-ga-props=&quot;{action:''Super_Zoom'', opt_label:''Ampliar''}&quot; data-id=&quot;1047633&quot; data-ref=&quot;03894400-V2013&quot; data-zoom-index=&quot;2&quot; data-zoom-url=&quot;//static.zara.net/photos//2013/V/0/2/p/3894/400/400/2/w/1920/3894400400_2_2_1.jpg?timestamp=1373480146988&quot; name=&quot;STRIPED SHIRT&quot; src=&quot;//static.zara.net/photos//2013/V/0/2/p/3894/400/400/2/w/400/3894400400_2_2_1.jpg?timestamp=1373480146988&quot; style=&quot;background: none repeat scroll 0% 0% transparent; min-height: 0px; display: inline; visibility: visible; opacity: 1;&quot; /&gt;&lt;img alt=&quot;Image 4 of STRIPED SHIRT from Zara &quot; class=&quot;image-big gaViewEvent sbdraggable draggableMain&quot; data-=&quot;&quot; data-category=&quot;436197&quot; data-color=&quot;400&quot; data-ga-props=&quot;{action:''Super_Zoom'', opt_label:''Ampliar''}&quot; data-id=&quot;1047633&quot; data-ref=&quot;03894400-V2013&quot; data-zoom-index=&quot;3&quot; data-zoom-url=&quot;//static.zara.net/photos//2013/V/0/2/p/3894/400/400/2/w/1920/3894400400_2_3_1.jpg?timestamp=1373480146988&quot; name=&quot;STRIPED SHIRT&quot; src=&quot;//static.zara.net/photos//2013/V/0/2/p/3894/400/400/2/w/400/3894400400_2_3_1.jpg?timestamp=1373480146988&quot; style=&quot;background: none repeat scroll 0% 0% transparent; min-height: 0px; display: inline; visibility: visible; opacity: 1;&quot; /&gt;&lt;/p&gt;\r\n', '&lt;p&gt;Áo sơ mi zara kẻ sọc mốt năm nay. Giá 30 USD&lt;/p&gt;\r\n', 'Áo sơ mi nam', 'Áo sơ mi zara', 'áo zara, áo sơ mi zara, áo sơ mi, áo sơ mi nam zara, zara'),
(163, 2, 'Áo sơ mi nam Zara', '&lt;p&gt;Áo sơ mi nam zara mầu trắng chủ đạo, các đường viền đỏ là điểm nhấn của áo tạo cảm giác sang trọng cho người mặc. Áo với thiết kế gọn gàng, màu sắc tổng thể trẻ trung. Áo đẹp nhất khi mặc với quần Âu&lt;/p&gt;\r\n\r\n&lt;hr /&gt;\r\n&lt;p&gt;&lt;img alt=&quot;Image 1 of SHIRT WITH MAO COLLAR AND CONTRAST DETAILING from Zara &quot; class=&quot;image-big gaViewEvent sbdraggable draggableMain&quot; data-=&quot;&quot; data-category=&quot;436268&quot; data-color=&quot;250&quot; data-ga-props=&quot;{action:''Super_Zoom'', opt_label:''Ampliar''}&quot; data-id=&quot;1048026&quot; data-ref=&quot;06103403-V2013&quot; data-zoom-index=&quot;0&quot; data-zoom-url=&quot;//static.zara.net/photos//2013/V/0/2/p/6103/403/250/2/w/1920/6103403250_1_1_1.jpg?timestamp=1373480140528&quot; id=&quot;bigImage&quot; name=&quot;SHIRT WITH MAO COLLAR AND CONTRAST DETAILING&quot; src=&quot;//static.zara.net/photos//2013/V/0/2/p/6103/403/250/2/w/400/6103403250_1_1_1.jpg?timestamp=1373480140528&quot; style=&quot;background: none repeat scroll 0% 0% transparent; min-height: 0px; display: inline; visibility: visible; opacity: 1;&quot; /&gt;&lt;img alt=&quot;Image 2 of SHIRT WITH MAO COLLAR AND CONTRAST DETAILING from Zara &quot; class=&quot;image-big gaViewEvent sbdraggable draggableMain&quot; data-=&quot;&quot; data-category=&quot;436268&quot; data-color=&quot;250&quot; data-ga-props=&quot;{action:''Super_Zoom'', opt_label:''Ampliar''}&quot; data-id=&quot;1048026&quot; data-ref=&quot;06103403-V2013&quot; data-zoom-index=&quot;1&quot; data-zoom-url=&quot;//static.zara.net/photos//2013/V/0/2/p/6103/403/250/2/w/1920/6103403250_2_1_1.jpg?timestamp=1373480140528&quot; name=&quot;SHIRT WITH MAO COLLAR AND CONTRAST DETAILING&quot; src=&quot;//static.zara.net/photos//2013/V/0/2/p/6103/403/250/2/w/400/6103403250_2_1_1.jpg?timestamp=1373480140528&quot; style=&quot;background: none repeat scroll 0% 0% transparent; min-height: 0px; display: inline; visibility: visible; opacity: 1;&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;Image 3 of SHIRT WITH MAO COLLAR AND CONTRAST DETAILING from Zara &quot; class=&quot;image-big gaViewEvent sbdraggable draggableMain&quot; data-=&quot;&quot; data-category=&quot;436268&quot; data-color=&quot;250&quot; data-ga-props=&quot;{action:''Super_Zoom'', opt_label:''Ampliar''}&quot; data-id=&quot;1048026&quot; data-ref=&quot;06103403-V2013&quot; data-zoom-index=&quot;2&quot; data-zoom-url=&quot;//static.zara.net/photos//2013/V/0/2/p/6103/403/250/2/w/1920/6103403250_2_2_1.jpg?timestamp=1373480140528&quot; name=&quot;SHIRT WITH MAO COLLAR AND CONTRAST DETAILING&quot; src=&quot;//static.zara.net/photos//2013/V/0/2/p/6103/403/250/2/w/400/6103403250_2_2_1.jpg?timestamp=1373480140528&quot; style=&quot;background: none repeat scroll 0% 0% transparent; min-height: 0px; display: inline; visibility: visible; opacity: 1;&quot; /&gt;&lt;/p&gt;\r\n', '&lt;p&gt;Áo sơ mi zara tuyệt đẹp. Giá 30 USD&lt;/p&gt;\r\n', 'Áo sơ mi zara', 'Áo sơ mi zara', 'áo zara, áo sơ mi zara, áo sơ mi, áo sơ mi nam zara, zara'),
(168, 2, 'Váy nữ Miss Selfridge', '&lt;p&gt;Váy nữ Miss Selfridge sang trọng cổ điển mầu đỏ tươi rất đẹp và tôn da, dáng áo ôm thân nổi bật đường cong. Áo đẹp hơn khi kết hợp với các phụ kiện đơn giản&lt;/p&gt;\r\n', '&lt;p&gt;Váy nữ Miss Selfridge mầu đỏ tươi rất sang! Giá 49 bảng này chị em ơii :D&lt;/p&gt;\r\n', 'Váy nữ Miss Selfridge', 'Váy nữ Miss Selfridge', 'váy nữ,Miss Selfridge '),
(169, 2, 'Váy nữ Zara', '&lt;p&gt;&lt;span style=&quot;font-size: 13px;&quot;&gt;Với 97% là cotton, chiếc váy hoa này của Zara thực sự mang đến cho bạn 1 cảm giác thoải mái khi mặc nó cùng với thiết kế hoa và cổ chữ V khoét rộng sang 2 bên&amp;nbsp;vai độc đáo làm bạn trông trẻ trung hơn.&amp;nbsp;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;hr /&gt;\r\n&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;http://dathangquocte.vn/image/data/Thuyanh/7495039615_2_1_1.jpg&quot; style=&quot;width: 400px; height: 496px;&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;http://dathangquocte.vn/image/data/Thuyanh/7495039615_2_2_1.jpg&quot; style=&quot;width: 400px; height: 496px;&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;http://dathangquocte.vn/image/data/Thuyanh/7495039615_2_3_1.jpg&quot; style=&quot;width: 400px; height: 496px;&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;http://dathangquocte.vn/image/data/Thuyanh/7495039615_6_1_1.jpg&quot; style=&quot;width: 400px; height: 496px;&quot; /&gt;&lt;/p&gt;\r\n', '&lt;p&gt;Váy của zara đang sale chỉ còn 39.99 bảng. Họa tiết hoa rất đẹp!&lt;/p&gt;\r\n', 'Weorder cung cấp mặt hàng váy nữ Zara chính hiệu ', 'Váy nữ Zara', 'váy, váy zara, váy hoa, thời trang '),
(170, 2, 'Váy nữ H&amp;M', '&lt;p&gt;Váy bodycon chất co giãn&amp;nbsp;với cổ đứng được trang trí bởi tua rua mềm mại và đính hạt tôn lên đường cong gợi cảm cho các chị em. Đây là m&lt;span style=&quot;font-size: 13px;&quot;&gt;ột trong những chiếc váy thuộc new collection của H&amp;amp;M cũng là&lt;/span&gt;&lt;span style=&quot;font-size: 13px;&quot;&gt;&amp;nbsp;một trong những items k thể thiếu trong tủ quần áo của các chị em.&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;hr /&gt;\r\n&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;http://dathangquocte.vn/image/data/Thuyanh/hmprod.jpg&quot; style=&quot;width: 384px; height: 449px;&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;http://dathangquocte.vn/image/data/Thuyanh/hmprod (1).jpg&quot; style=&quot;width: 384px; height: 449px;&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;http://dathangquocte.vn/image/data/Thuyanh/hmprod (2).jpg&quot; style=&quot;width: 384px; height: 449px;&quot; /&gt;&lt;/p&gt;\r\n', '&lt;p&gt;New collection của H&amp;amp;M, váy đẹp, chất co giãn mặc dễ chịu, giá lại phải chăng. Mua ngay kẻo hết size!!!&lt;/p&gt;\r\n', 'Weorder chuyên cung cấp mặt hàng váy nữ H&amp;M chính hiệu', 'Váy nữ H&amp;M', 'váy, váy H&amp;M, váy bodycon, váy nữ, thời trang'),
(173, 2, 'Áo sơ mi nam Diesel', '&lt;p&gt;Áo sơ mi bò Diesel luôn được coi là đẳng cấp nhất trong các loại áo bò khác, ngoài chất liệu bền nhẹ đặc biệt ra, những chi tiết tạo điểm nhấn, logo áo và cách mài mầu là nét nổi bật nhất. Áo đem lại cho người mặc trông nam tính, mạnh mẽ hơn. Thích hợp khi mặc với quần Jeans&lt;/p&gt;\r\n\r\n&lt;hr /&gt;\r\n&lt;p&gt;&lt;img alt=&quot;DIESEL - Shirts - SONORA-NE&quot; class=&quot;photo&quot; height=&quot;405&quot; id=&quot;bigImage&quot; src=&quot;http://cdn.yoox.biz/38/38314688kc_12_f.jpg&quot; style=&quot;width: 404.592px; height: 537.245px;&quot; width=&quot;305&quot; /&gt;&lt;img alt=&quot;DIESEL - Shirts - SONORA-NE&quot; class=&quot;photo&quot; height=&quot;405&quot; id=&quot;bigImage&quot; src=&quot;http://cdn.yoox.biz/38/38314688kc_12_e.jpg&quot; style=&quot;width: 404.592px; height: 537.245px;&quot; width=&quot;305&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;DIESEL - Shirts - SONORA-NE&quot; class=&quot;photo&quot; height=&quot;405&quot; id=&quot;bigImage&quot; src=&quot;http://cdn.yoox.biz/38/38314688kc_12_r.jpg&quot; style=&quot;width: 404.592px; height: 537.245px;&quot; width=&quot;305&quot; /&gt;&lt;img alt=&quot;DIESEL - Shirts - SONORA-NE&quot; class=&quot;photo&quot; height=&quot;405&quot; id=&quot;bigImage&quot; src=&quot;http://cdn.yoox.biz/38/38314688kc_12_d.jpg&quot; style=&quot;width: 404.592px; height: 537.245px;&quot; width=&quot;305&quot; /&gt;&lt;/p&gt;\r\n', '&lt;p&gt;Áo bò Diesel siêu đẹp cho các anh đây! Hàng cực chất mới về trên web. Giá 160 bảng&lt;/p&gt;\r\n', 'Áo sơ mi bò diesel', 'Áo sơ mi diesel', 'áo sơ mi nam, sơ mi diesel, diesel, áo bò diesel'),
(174, 2, 'Áo sơ mi nam Diesel', '&lt;p&gt;Ao sơ mi bò Diesel được thiết kế mài bụi bặm đem lại cho người mặc cảm giác khỏe mạnh nam tính. Logo thương hiệu Diesel 1978 được đính bằng đồng lên ngực trái áo. Áo rất đẹp khi kết hợp với quần jeans hoặc quần kaki&lt;/p&gt;\r\n\r\n&lt;hr /&gt;\r\n&lt;p&gt;&lt;img alt=&quot;DIESEL - Shirts - SONORA&quot; class=&quot;photo&quot; height=&quot;405&quot; id=&quot;bigImage&quot; src=&quot;http://cdn.yoox.biz/38/38290867gl_12_f.jpg&quot; style=&quot;width: 404.592px; height: 537.245px;&quot; width=&quot;305&quot; /&gt;&lt;img alt=&quot;DIESEL - Shirts - SONORA&quot; class=&quot;photo&quot; height=&quot;405&quot; id=&quot;bigImage&quot; src=&quot;http://cdn.yoox.biz/38/38290867gl_12_e.jpg&quot; style=&quot;width: 404.592px; height: 537.245px;&quot; width=&quot;305&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;DIESEL - Shirts - SONORA&quot; class=&quot;photo&quot; height=&quot;405&quot; id=&quot;bigImage&quot; src=&quot;http://cdn.yoox.biz/38/38290867gl_12_r.jpg&quot; style=&quot;width: 404.592px; height: 537.245px;&quot; width=&quot;305&quot; /&gt;&lt;img alt=&quot;DIESEL - Shirts - SONORA&quot; class=&quot;photo&quot; height=&quot;405&quot; id=&quot;bigImage&quot; src=&quot;http://cdn.yoox.biz/38/38290867gl_12_d.jpg&quot; style=&quot;width: 404.592px; height: 537.245px;&quot; width=&quot;305&quot; /&gt;&lt;/p&gt;\r\n', '&lt;p&gt;Mẫu HOT của Diesel - Sơ mi bò siêu đẹp - Giá đang sale 50% còn 85GBP. Mua ngay&lt;/p&gt;\r\n', 'Áo sơ mi Diesel', 'Áo sơ mi Diesel', 'áo sơ mi nam, sơ mi diesel, diesel, áo bò diesel'),
(175, 2, 'Áo sơ mi nam Diesel', '&lt;p&gt;Áo sơ mi bò Diesel luôn là sự lựa chọn số 1 cho những tín đồ thích chơi hàng bụi bặm, nam tính. Áo được thiết kế với 2 túi hộp trước ngực, logo Diesel đính bên túi áo trái. Dáng áo ôm thân gọn gàng.&lt;/p&gt;\r\n\r\n&lt;hr /&gt;\r\n&lt;p&gt;&lt;img alt=&quot;DIESEL - Shirts - SONORA&quot; class=&quot;photo&quot; height=&quot;405&quot; id=&quot;bigImage&quot; src=&quot;http://cdn.yoox.biz/38/38314680ck_12_f.jpg&quot; style=&quot;width: 404.592px; height: 537.245px;&quot; width=&quot;305&quot; /&gt;&lt;img alt=&quot;DIESEL - Shirts - SONORA&quot; class=&quot;photo&quot; height=&quot;405&quot; id=&quot;bigImage&quot; src=&quot;http://cdn.yoox.biz/38/38314680ck_12_e.jpg&quot; style=&quot;width: 404.592px; height: 537.245px;&quot; width=&quot;305&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;DIESEL - Shirts - SONORA&quot; class=&quot;photo&quot; height=&quot;405&quot; id=&quot;bigImage&quot; src=&quot;http://cdn.yoox.biz/38/38314680ck_12_r.jpg&quot; style=&quot;width: 404.592px; height: 537.245px;&quot; width=&quot;305&quot; /&gt;&lt;img alt=&quot;DIESEL - Shirts - SONORA&quot; class=&quot;photo&quot; height=&quot;405&quot; id=&quot;bigImage&quot; src=&quot;http://cdn.yoox.biz/38/38314680ck_12_d.jpg&quot; style=&quot;width: 404.592px; height: 537.245px;&quot; width=&quot;305&quot; /&gt;&lt;/p&gt;\r\n', '&lt;p&gt;Áo sơ mi bò Diesel mẫu chữ D cổ điển mầu cực đẹp! Hàng mới giá 160 GBP&lt;/p&gt;\r\n', 'Áo sơ mi nam Diesel', 'Áo sơ mi Diesel', 'áo sơ mi nam, sơ mi diesel, diesel, áo bò diesel'),
(176, 2, 'Áo sơ mi nam Diesel', '&lt;p&gt;Áo sơ mi bò Diesel STEPY-B được thiết kế với chất liệu denim mỏng nhẹ nhàng cho người mặc cảm giác thoải mái. Áo với những đường sọc dọc rất lạ và cầu vai áo là điểm nhấn.&lt;/p&gt;\r\n\r\n&lt;hr /&gt;\r\n&lt;p&gt;&lt;img alt=&quot;DIESEL - Shirts - STEPY-B&quot; class=&quot;photo&quot; height=&quot;405&quot; id=&quot;bigImage&quot; src=&quot;http://cdn.yoox.biz/38/38299926cq_12_f.jpg&quot; style=&quot;width: 404.592px; height: 537.245px;&quot; width=&quot;305&quot; /&gt;&lt;img alt=&quot;DIESEL - Shirts - STEPY-B&quot; class=&quot;photo&quot; height=&quot;405&quot; id=&quot;bigImage&quot; src=&quot;http://cdn.yoox.biz/38/38299926cq_12_e.jpg&quot; style=&quot;width: 404.592px; height: 537.245px;&quot; width=&quot;305&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;DIESEL - Shirts - STEPY-B&quot; class=&quot;photo&quot; height=&quot;405&quot; id=&quot;bigImage&quot; src=&quot;http://cdn.yoox.biz/38/38299926cq_12_r.jpg&quot; style=&quot;width: 404.592px; height: 537.245px;&quot; width=&quot;305&quot; /&gt;&lt;img alt=&quot;DIESEL - Shirts - STEPY-B&quot; class=&quot;photo&quot; height=&quot;405&quot; id=&quot;bigImage&quot; src=&quot;http://cdn.yoox.biz/38/38299926cq_12_d.jpg&quot; style=&quot;width: 404.592px; height: 537.245px;&quot; width=&quot;305&quot; /&gt;&lt;/p&gt;\r\n', '&lt;p&gt;Sơ mi Diesel STEPY-B giá 130 GBP - Mua ngay&lt;/p&gt;\r\n', 'Áo sơ mi nam Diesel', 'Áo sơ mi Diesel', 'áo sơ mi nam, sơ mi diesel, diesel, áo bò diesel');
INSERT INTO `product_description` (`product_id`, `language_id`, `name`, `description`, `sort_description`, `meta_description`, `meta_keyword`, `tag`) VALUES
(177, 2, 'Áo sơ mi nam Diesel', '&lt;p&gt;Áo sơ mi bò SONORA của Diesel mầu khói mài xám rất đẹp. Dáng áo ôm thân gọn gàng rất tôn dáng. Áo đẹp hơn khi mặc với quần Jeans hoặc quần Kaki. Áo được thiết kế với 2 túi ngực khỏe mạnh là điểm nhấn&lt;/p&gt;\r\n\r\n&lt;hr /&gt;\r\n&lt;p&gt;&lt;img alt=&quot;DIESEL - Shirts - SONORA&quot; class=&quot;photo&quot; height=&quot;405&quot; id=&quot;bigImage&quot; src=&quot;http://cdn.yoox.biz/38/38299879ef_12_f.jpg&quot; style=&quot;width: 404.592px; height: 537.245px;&quot; width=&quot;305&quot; /&gt;&lt;img alt=&quot;DIESEL - Shirts - SONORA&quot; class=&quot;photo&quot; height=&quot;405&quot; id=&quot;bigImage&quot; src=&quot;http://cdn.yoox.biz/38/38299879ef_12_e.jpg&quot; style=&quot;width: 404.592px; height: 537.245px;&quot; width=&quot;305&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;DIESEL - Shirts - SONORA&quot; class=&quot;photo&quot; height=&quot;405&quot; id=&quot;bigImage&quot; src=&quot;http://cdn.yoox.biz/38/38299879ef_12_r.jpg&quot; style=&quot;width: 404.592px; height: 537.245px;&quot; width=&quot;305&quot; /&gt;&lt;img alt=&quot;DIESEL - Shirts - SONORA&quot; class=&quot;photo&quot; height=&quot;405&quot; id=&quot;bigImage&quot; src=&quot;http://cdn.yoox.biz/38/38299879ef_12_d.jpg&quot; style=&quot;width: 404.592px; height: 537.245px;&quot; width=&quot;305&quot; /&gt;&lt;/p&gt;\r\n', '&lt;p&gt;Áo sơ mi Diesel SONORA mầu khói xám cực chất. Giá SALE 50% chỉ còn 100 GBP&lt;/p&gt;\r\n', 'Áo sơ mi nam Diesel', 'Áo sơ mi Diesel', 'áo sơ mi nam, sơ mi diesel, diesel, áo bò diesel'),
(178, 2, 'Áo sơ mi nam Diesel', '&lt;p&gt;Áo sơ mi bò Diesel SONORA sử dụng vải denim mỏng mịn để may tạo cảm giác thoải mái, tông mầu xanh dương nhạt nhã nhặn. Áo thiết kế đơn giản dễ mặc. Dáng áo ôm thân gọn gàng.&lt;/p&gt;\r\n\r\n&lt;hr /&gt;\r\n&lt;p&gt;&lt;img alt=&quot;DIESEL - Shirts - SONORA&quot; class=&quot;photo&quot; height=&quot;405&quot; id=&quot;bigImage&quot; src=&quot;http://cdn.yoox.biz/38/38299884tg_12_f.jpg&quot; style=&quot;width: 404.592px; height: 537.245px;&quot; width=&quot;305&quot; /&gt;&lt;img alt=&quot;DIESEL - Shirts - SONORA&quot; class=&quot;photo&quot; height=&quot;405&quot; id=&quot;bigImage&quot; src=&quot;http://cdn.yoox.biz/38/38299884tg_12_e.jpg&quot; style=&quot;width: 404.592px; height: 537.245px;&quot; width=&quot;305&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;DIESEL - Shirts - SONORA&quot; class=&quot;photo&quot; height=&quot;405&quot; id=&quot;bigImage&quot; src=&quot;http://cdn.yoox.biz/38/38299884tg_12_r.jpg&quot; style=&quot;width: 404.592px; height: 537.245px;&quot; width=&quot;305&quot; /&gt;&lt;img alt=&quot;DIESEL - Shirts - SONORA&quot; class=&quot;photo&quot; height=&quot;405&quot; id=&quot;bigImage&quot; src=&quot;http://cdn.yoox.biz/38/38299884tg_12_d.jpg&quot; style=&quot;width: 404.592px; height: 537.245px;&quot; width=&quot;305&quot; /&gt;&lt;/p&gt;\r\n', '&lt;p&gt;Áo sơ mi Diesel SONORA dạng mỏng rất mát. SALE 50% còn 65 GBP&lt;/p&gt;\r\n', 'Áo sơ mi nam Diesel', 'Áo sơ mi Diesel', 'áo sơ mi nam, sơ mi diesel, diesel, áo bò diesel'),
(179, 2, 'Áo sơ mi nam Diesel', '&lt;p&gt;Áo sơ mi bò Diesel SONORA xanh trắng thời trang. Áo được thiết kế với kiểu dáng slim ôm thân. Mầu áo rất đẹp khi mặc với các quần Jeans hay kaki tông đậm. Áo phù hợp với phong cách khỏe mạnh, nam tính.&lt;/p&gt;\r\n\r\n&lt;hr /&gt;\r\n&lt;p&gt;&lt;img alt=&quot;DIESEL - Shirts - SONORA&quot; class=&quot;photo&quot; height=&quot;405&quot; id=&quot;bigImage&quot; src=&quot;http://cdn.yoox.biz/38/38299883tn_12_f.jpg&quot; style=&quot;width: 404.592px; height: 537.245px;&quot; width=&quot;305&quot; /&gt;&lt;img alt=&quot;DIESEL - Shirts - SONORA&quot; class=&quot;photo&quot; height=&quot;405&quot; id=&quot;bigImage&quot; src=&quot;http://cdn.yoox.biz/38/38299883tn_12_e.jpg&quot; style=&quot;width: 404.592px; height: 537.245px;&quot; width=&quot;305&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;DIESEL - Shirts - SONORA&quot; class=&quot;photo&quot; height=&quot;405&quot; id=&quot;bigImage&quot; src=&quot;http://cdn.yoox.biz/38/38299883tn_12_r.jpg&quot; style=&quot;width: 404.592px; height: 537.245px;&quot; width=&quot;305&quot; /&gt;&lt;img alt=&quot;DIESEL - Shirts - SONORA&quot; class=&quot;photo&quot; height=&quot;405&quot; id=&quot;bigImage&quot; src=&quot;http://cdn.yoox.biz/38/38299883tn_12_d.jpg&quot; style=&quot;width: 404.592px; height: 537.245px;&quot; width=&quot;305&quot; /&gt;&lt;/p&gt;\r\n', '&lt;p&gt;Áo sơ mi bò Diesel SONORA xanh trắng tuyệt đẹp! SALE 50% còn 70 GBP nhé&lt;/p&gt;\r\n', 'Áo sơ mi nam Diesel ', 'Áo sơ mi Diesel', 'áo sơ mi nam, sơ mi diesel, diesel, áo bò diesel'),
(187, 2, 'Quần Jeans nam Replay', '&lt;p&gt;Quần Jeans nam Replay mầu xanh nhạt mài nhẹ độc đáo. Quần phù hợp với phong cách nam tính, trẻ trung, khỏe mạnh. Dáng quần ôm chân nhỏ gọn dễ mặc&lt;/p&gt;\r\n\r\n&lt;hr /&gt;\r\n&lt;p&gt;&lt;img src=&quot;http://shop.replay.it/thumbs/dettaglio_indossato_R_ss13/480x716/docs/varianti/791/foto_1.jpg&quot; /&gt;&lt;img src=&quot;http://shop.replay.it/thumbs/dettaglio_indossato_R_ss13/480x716/docs/varianti/791/foto_2.jpg?random=1373948912581&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img src=&quot;http://shop.replay.it/thumbs/dettaglio_indossato_R_ss13/480x716/docs/varianti/791/foto_3.jpg?random=1373948929461&quot; /&gt;&lt;/p&gt;\r\n', '&lt;p&gt;Quần Jeans nam ROGOB 118 150 - Regular Fit cực chất. WEB đang SALE còn 57.5 bảng&lt;/p&gt;\r\n', 'Quần Jeans nam Replay', 'quần bò Replay', 'quần replay, quần bò replay, replay, quần bò, quần jeans, quần jeans replay, jeans, jeans replay'),
(182, 2, 'Quần Jeans nam Replay', '&lt;p&gt;Replay là thương hiệu đã khẳng định tên tuổi trên thị trường đồ Jeans toàn cầu. Quần dáng đứng, mài nhẹ, mầu xanh nhạt với 2 túi bên may phá cách tạo điểm nhấn. Quần phù hợp cho nam giới phong cách bụi bặm.&lt;/p&gt;\r\n\r\n&lt;hr /&gt;\r\n&lt;p&gt;&lt;img src=&quot;http://shop.replay.it/thumbs/dettaglio_indossato_R_ss13/480x716/docs/varianti/716/foto_1.jpg?random=1373945913721&quot; /&gt;&lt;img src=&quot;http://shop.replay.it/thumbs/dettaglio_indossato_R_ss13/480x716/docs/varianti/716/foto_3.jpg?random=1373945531080&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img src=&quot;http://shop.replay.it/thumbs/dettaglio_accessori/480x716/docs/varianti/716/foto_5.jpg?random=1373945582572&quot; /&gt;&lt;img src=&quot;http://shop.replay.it/thumbs/dettaglio_accessori/480x716/docs/varianti/716/foto_7.jpg?random=1373945633206&quot; /&gt;&lt;/p&gt;\r\n', '&lt;p&gt;Quần bò Replay siêu đẹp mới về TOMLIN 118 150 - Worker Fit - Giá đang Sale mạnh chỉ còn 67,5 bảng&lt;/p&gt;\r\n', 'Quần Jeans nam Replay', 'Quần bò replay', 'quần replay, quần bò replay, replay, quần bò, quần jeans, quần jeans replay, jeans, jeans replay'),
(183, 2, 'Quần Jeans nam Replay', '&lt;p&gt;Quần jeans nam Replay được sản xuất dưới công nghệ đặc biệt và những nhà thiết kế giầu kinh nghiệm. Quần rất nhẹ, mát và kiểu dáng rất nam tính khỏe mạnh&lt;/p&gt;\r\n\r\n&lt;hr /&gt;\r\n&lt;p&gt;&lt;img src=&quot;http://shop.replay.it/thumbs/dettaglio_indossato_R_ss13/480x716/docs/varianti/766/foto_1.jpg&quot; /&gt;&lt;img src=&quot;http://shop.replay.it/thumbs/dettaglio_indossato_R_ss13/480x716/docs/varianti/766/foto_2.jpg?random=1373946090756&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img src=&quot;http://shop.replay.it/thumbs/dettaglio_indossato_R_ss13/480x716/docs/varianti/766/foto_3.jpg?random=1373946105012&quot; /&gt;&lt;img src=&quot;http://shop.replay.it/thumbs/dettaglio_accessori/480x716/docs/varianti/766/foto_5.jpg?random=1373946156845&quot; /&gt;&lt;/p&gt;\r\n', '&lt;p&gt;Quần Jeans Replay MARNEL 118 150 - Regular Slim Fit 62.5 bảng thôi anh em nhé. ĐANG SALE&lt;/p&gt;\r\n', 'Quần Jeans nam Replay', 'Quần bò Replay', 'quần replay, quần bò replay, replay, quần bò, quần jeans, quần jeans replay, jeans, jeans replay'),
(184, 2, 'Quần Jeans nam Replay', '&lt;p&gt;Quần Jeans nam Replay mài nhẹ phớt hai bên đùi, dáng quần ôm chân gọn gàng cho người mặc cảm giác thoải mái, khỏe mạnh, năng động. quần rất đẹp khi mặc với các áo tối mầu&lt;/p&gt;\r\n\r\n&lt;hr /&gt;\r\n&lt;p&gt;&lt;img src=&quot;http://shop.replay.it/thumbs/dettaglio_indossato_R_ss13/480x716/docs/varianti/841/foto_1.jpg&quot; /&gt;&lt;img src=&quot;http://shop.replay.it/thumbs/dettaglio_indossato_R_ss13/480x716/docs/varianti/841/foto_2.jpg?random=1373946665779&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img src=&quot;http://shop.replay.it/thumbs/dettaglio_indossato_R_ss13/480x716/docs/varianti/841/foto_3.jpg?random=1373946679072&quot; /&gt;&lt;img src=&quot;http://shop.replay.it/thumbs/dettaglio_accessori/480x716/docs/varianti/841/foto_6.jpg?random=1373946700660&quot; /&gt;&lt;/p&gt;\r\n', '&lt;p&gt;Quần Jeans nam Replay SMARIN 118 150 - Regular Slim Fit Giá đang SALE còn 75 bảng&lt;/p&gt;\r\n', 'Quần Jeans nam Replay', 'Quần bò Replay', 'quần replay, quần bò replay, replay, quần bò, quần jeans, quần jeans replay, jeans, jeans replay'),
(185, 2, 'Quần Jeans nam Replay', '&lt;p&gt;Quần Jeans Replay được thiết kế với phong cách mới hiện đại, phù hợp với phong cách nam tính, bụi bặm, quần rất đẹp khi mặc quần áo thun đơn giản.&lt;/p&gt;\r\n\r\n&lt;hr /&gt;\r\n&lt;p&gt;&lt;img src=&quot;http://shop.replay.it/thumbs/dettaglio_indossato_R_ss13/480x716/docs/varianti/738/foto_2.jpg?random=1373947352248&quot; /&gt;&lt;img src=&quot;http://shop.replay.it/thumbs/dettaglio_indossato_R_ss13/480x716/docs/varianti/738/foto_1.jpg&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img src=&quot;http://shop.replay.it/thumbs/dettaglio_indossato_R_ss13/480x716/docs/varianti/738/foto_3.jpg?random=1373947363614&quot; /&gt;&lt;img src=&quot;http://shop.replay.it/thumbs/dettaglio_accessori/480x716/docs/varianti/738/foto_7.jpg?random=1373947391875&quot; /&gt;&lt;/p&gt;\r\n', '&lt;p&gt;Quần bò replay ANBASS 118 160 - Slim Fit đang SALE off giá chỉ còn 73.5 bảng.&lt;/p&gt;\r\n', 'quần jeans nam replay', 'quần bò replay', 'quần replay, quần bò replay, replay, quần bò, quần jeans, quần jeans replay, jeans, jeans replay'),
(186, 2, 'Quần Jeans nam WeAreReplay', '&lt;p&gt;WE ARE REPLAY là dòng cao cấp của Replay, quần được sử dụng chất liệu đặc biệt cao cấp, với kiểu dáng ôm chân gọn gàng. chất liệu nhẹ giúp người mặc có cảm giác năng động, thoải mái.&lt;/p&gt;\r\n\r\n&lt;hr /&gt;\r\n&lt;p&gt;&lt;img src=&quot;http://shop.replay.it/thumbs/dettaglio_indossato_W_ss13/480x716/docs/varianti/1432/foto_1.jpg&quot; /&gt;&lt;img src=&quot;http://shop.replay.it/thumbs/dettaglio_indossato_W_ss13/480x716/docs/varianti/1432/foto_3.jpg?random=1373948655043&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img src=&quot;http://shop.replay.it/thumbs/dettaglio_accessori/480x716/docs/varianti/1432/foto_7.jpg?random=1373948676189&quot; /&gt;&lt;/p&gt;\r\n', '&lt;p&gt;Quần Jeans nam WE ARE REPLAY mầu đen siêu đẹp ! Đang SALE còn 105 bảng&lt;/p&gt;\r\n', 'Quần jeans nam Replay', 'Quần bò Replay', 'quần replay, quần bò replay, replay, quần bò, quần jeans, quần jeans replay, jeans, jeans replay'),
(188, 2, 'Quần Jeans nam Zara', '&lt;p&gt;Quần Jeans Nam Zara được thiết kế rất đẹp, dáng quần thường ôm chân nhỏ gọn làm cho ngưởi mặc trôn thanh thoát hơn. Quần sử dụng những chất liệu coton thoáng mát, đặc biệt các đường mài nhẹ nhàng hoặc tông mầu tươi tắn luôn là điểm mạnh của quần Jeans Zara. Quần phù hợp cho nhiều lứa tuổi và phong cách&lt;/p&gt;\r\n\r\n&lt;hr /&gt;\r\n&lt;p&gt;&lt;img alt=&quot;Image 2 of STUDDED JEANS from Zara &quot; src=&quot;http://static.zara.net/photos//2013/V/0/2/p/0905/400/800/2/w/400/0905400800_2_1_1.jpg?timestamp=1373480145488&quot; /&gt;&lt;img alt=&quot;Image 3 of STUDDED JEANS from Zara &quot; src=&quot;http://static.zara.net/photos//2013/V/0/2/p/0905/400/800/2/w/400/0905400800_2_2_1.jpg?timestamp=1373480145488&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;Image 4 of STUDDED JEANS from Zara &quot; src=&quot;http://static.zara.net/photos//2013/V/0/2/p/0905/400/800/2/w/400/0905400800_2_3_1.jpg?timestamp=1373480145488&quot; /&gt;&lt;img alt=&quot;Image 5 of STUDDED JEANS from Zara &quot; src=&quot;http://static.zara.net/photos//2013/V/0/2/p/0905/400/800/2/w/400/0905400800_2_4_1.jpg?timestamp=1373480145488&quot; /&gt;&lt;/p&gt;\r\n', '&lt;p&gt;Quần Jeans nam Zara STUDDED JEANS mầu đen, mẫu HOT năm nay nhé. Giá SALE còn 49.99 USD&lt;/p&gt;\r\n', 'Quần Jeans nam Zara', 'Quần bò Zara', 'Quần Zara, quần bò zara, quần jeans zara, jeans zara, zara'),
(189, 2, 'Quần Jeans nam Zara', '&lt;p&gt;Quần Jeans Nam Zara được thiết kế rất đẹp, dáng quần thường ôm chân nhỏ gọn làm cho ngưởi mặc trôn thanh thoát hơn. Quần sử dụng những chất liệu coton thoáng mát, đặc biệt các đường mài nhẹ nhàng hoặc tông mầu tươi tắn luôn là điểm mạnh của quần Jeans Zara. Quần phù hợp cho nhiều lứa tuổi và phong cách&lt;/p&gt;\r\n\r\n&lt;hr /&gt;\r\n&lt;p&gt;&lt;img alt=&quot;Image 2 of STUDDED RIPPED JEANS from Zara &quot; src=&quot;http://static.zara.net/photos//2013/V/0/2/p/0905/403/407/2/w/400/0905403407_2_1_1.jpg?timestamp=1373480145498&quot; /&gt;&lt;img alt=&quot;Image 3 of STUDDED RIPPED JEANS from Zara &quot; src=&quot;http://static.zara.net/photos//2013/V/0/2/p/0905/403/407/2/w/400/0905403407_2_2_1.jpg?timestamp=1373480145498&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;Image 4 of STUDDED RIPPED JEANS from Zara &quot; src=&quot;http://static.zara.net/photos//2013/V/0/2/p/0905/403/407/2/w/400/0905403407_2_3_1.jpg?timestamp=1373480145498&quot; /&gt;&lt;img alt=&quot;Image 1 of STUDDED RIPPED JEANS from Zara &quot; src=&quot;http://static.zara.net/photos//2013/V/0/2/p/0905/403/407/2/w/400/0905403407_1_1_1.jpg?timestamp=1373480145498&quot; /&gt;&lt;/p&gt;\r\n', '&lt;p&gt;Quần bò Zara STUDDED RIPPED JEANS cực chất. Giá đang sale còn 49.99 USD&lt;/p&gt;\r\n', 'Quần Jeans nam Zara', 'Quần bò zara', 'Quần Zara, quần bò zara, quần jeans zara, jeans zara, zara'),
(190, 2, 'Quần Jeans nam Zara', '&lt;p&gt;Quần Jeans Nam Zara được thiết kế rất đẹp, dáng quần thường ôm chân nhỏ gọn làm cho ngưởi mặc trôn thanh thoát hơn. Quần sử dụng những chất liệu coton thoáng mát, đặc biệt các đường mài nhẹ nhàng hoặc tông mầu tươi tắn luôn là điểm mạnh của quần Jeans Zara. Quần phù hợp cho nhiều lứa tuổi và phong cách&lt;/p&gt;\r\n\r\n&lt;hr /&gt;\r\n&lt;p&gt;&lt;img alt=&quot;Image 1 of STUDDED JEANS WITH CHAIN from Zara &quot; src=&quot;http://static.zara.net/photos//2013/V/0/2/p/2627/400/407/2/w/400/2627400407_1_1_1.jpg?timestamp=1373480146658&quot; /&gt;&lt;img alt=&quot;Image 2 of STUDDED JEANS WITH CHAIN from Zara &quot; src=&quot;http://static.zara.net/photos//2013/V/0/2/p/2627/400/407/2/w/400/2627400407_2_1_1.jpg?timestamp=1373480146658&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;Image 3 of STUDDED JEANS WITH CHAIN from Zara &quot; src=&quot;http://static.zara.net/photos//2013/V/0/2/p/2627/400/407/2/w/400/2627400407_2_2_1.jpg?timestamp=1373480146658&quot; /&gt;&lt;img alt=&quot;Image 4 of STUDDED JEANS WITH CHAIN from Zara &quot; src=&quot;http://static.zara.net/photos//2013/V/0/2/p/2627/400/407/2/w/400/2627400407_2_3_1.jpg?timestamp=1373480146658&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;Image 5 of STUDDED JEANS WITH CHAIN from Zara &quot; src=&quot;http://static.zara.net/photos//2013/V/0/2/p/2627/400/407/2/w/400/2627400407_2_4_1.jpg?timestamp=1373480146658&quot; /&gt;&lt;/p&gt;\r\n', '&lt;p&gt;Quần Jeans Zara STUDDED JEANS WITH CHAIN rất đẹp nhé. Giá 49.99 USD&lt;/p&gt;\r\n', 'Quần Jeans nam Zara', 'quần bò zara', 'Quần Zara, quần bò zara, quần jeans zara, jeans zara, zara'),
(191, 2, 'Quần Jeans nam Zara', '&lt;p&gt;Quần Jeans Nam Zara được thiết kế rất đẹp, dáng quần thường ôm chân nhỏ gọn làm cho ngưởi mặc trôn thanh thoát hơn. Quần sử dụng những chất liệu coton thoáng mát, đặc biệt các đường mài nhẹ nhàng hoặc tông mầu tươi tắn luôn là điểm mạnh của quần Jeans Zara. Quần phù hợp cho nhiều lứa tuổi và phong cách&lt;/p&gt;\r\n\r\n&lt;hr /&gt;\r\n&lt;p&gt;&lt;img alt=&quot;Image 2 of JEANS WITH CONTRASTING INTERIOR from Zara &quot; src=&quot;http://static.zara.net/photos//2013/V/0/2/p/7215/408/407/2/w/400/7215408407_2_1_1.jpg?timestamp=1373480110598&quot; /&gt;&lt;img alt=&quot;Image 3 of JEANS WITH CONTRASTING INTERIOR from Zara &quot; src=&quot;http://static.zara.net/photos//2013/V/0/2/p/7215/408/407/2/w/400/7215408407_2_2_1.jpg?timestamp=1373480110598&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;Image 4 of JEANS WITH CONTRASTING INTERIOR from Zara &quot; src=&quot;http://static.zara.net/photos//2013/V/0/2/p/7215/408/407/2/w/400/7215408407_2_3_1.jpg?timestamp=1373480110598&quot; /&gt;&lt;img alt=&quot;Image 1 of JEANS WITH CONTRASTING INTERIOR from Zara &quot; src=&quot;http://static.zara.net/photos//2013/V/0/2/p/7215/408/407/2/w/400/7215408407_1_1_1.jpg?timestamp=1373480110598&quot; /&gt;&lt;/p&gt;\r\n', '&lt;p&gt;Quần Jeans Zara JEANS WITH CONTRASTING INTERIOR đang SALE 50 USD&lt;/p&gt;\r\n', 'Quần Jeans nam Zara', 'quần bò zara', 'Quần Zara, quần bò zara, quần jeans zara, jeans zara, zara'),
(192, 2, 'Quần Jeans nam Zara', '&lt;p&gt;Quần Jeans Nam Zara được thiết kế rất đẹp, dáng quần thường ôm chân nhỏ gọn làm cho ngưởi mặc trôn thanh thoát hơn. Quần sử dụng những chất liệu coton thoáng mát, đặc biệt các đường mài nhẹ nhàng hoặc tông mầu tươi tắn luôn là điểm mạnh của quần Jeans Zara. Quần phù hợp cho nhiều lứa tuổi và phong cách&lt;/p&gt;\r\n\r\n&lt;hr /&gt;\r\n&lt;p&gt;&lt;img alt=&quot;Image 2 of STUDDED JEANS from Zara &quot; src=&quot;http://static.zara.net/photos//2013/V/0/2/p/2627/402/407/2/w/400/2627402407_2_1_1.jpg?timestamp=1373480146668&quot; /&gt;&lt;img alt=&quot;Image 3 of STUDDED JEANS from Zara &quot; src=&quot;http://static.zara.net/photos//2013/V/0/2/p/2627/402/407/2/w/400/2627402407_2_2_1.jpg?timestamp=1373480146668&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;Image 4 of STUDDED JEANS from Zara &quot; src=&quot;http://static.zara.net/photos//2013/V/0/2/p/2627/402/407/2/w/400/2627402407_2_3_1.jpg?timestamp=1373480146668&quot; /&gt;&lt;img alt=&quot;Image 1 of STUDDED JEANS from Zara &quot; src=&quot;http://static.zara.net/photos//2013/V/0/2/p/2627/402/407/2/w/400/2627402407_1_1_1.jpg?timestamp=1373480146668&quot; /&gt;&lt;/p&gt;\r\n', '&lt;p&gt;Quần Jeans Zara STUDDED JEANS đang sale còn 49.99 USD.&lt;/p&gt;\r\n', 'Quần Jeans nam Zara', 'quần bò zara', 'Quần Zara, quần bò zara, quần jeans zara, jeans zara, zara'),
(193, 2, 'Quần Jeans nam Zara', '&lt;p&gt;Quần Jeans Nam Zara được thiết kế rất đẹp, dáng quần thường ôm chân nhỏ gọn làm cho ngưởi mặc trôn thanh thoát hơn. Quần sử dụng những chất liệu coton thoáng mát, đặc biệt các đường mài nhẹ nhàng hoặc tông mầu tươi tắn luôn là điểm mạnh của quần Jeans Zara. Quần phù hợp cho nhiều lứa tuổi và phong cách&lt;/p&gt;\r\n\r\n&lt;hr /&gt;\r\n&lt;p&gt;&lt;img alt=&quot;Image 1 of TWO-TONE JEANS from Zara &quot; src=&quot;http://static.zara.net/photos//2013/V/0/2/p/7215/401/446/2/w/400/7215401446_1_1_1.jpg?timestamp=1373480110568&quot; /&gt;&lt;img alt=&quot;Image 2 of TWO-TONE JEANS from Zara &quot; src=&quot;http://static.zara.net/photos//2013/V/0/2/p/7215/401/446/2/w/400/7215401446_2_1_1.jpg?timestamp=1373480110568&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;Image 3 of TWO-TONE JEANS from Zara &quot; src=&quot;http://static.zara.net/photos//2013/V/0/2/p/7215/401/446/2/w/400/7215401446_2_2_1.jpg?timestamp=1373480110568&quot; /&gt;&lt;img alt=&quot;Image 4 of TWO-TONE JEANS from Zara &quot; src=&quot;http://static.zara.net/photos//2013/V/0/2/p/7215/401/446/2/w/400/7215401446_2_3_1.jpg?timestamp=1373480110568&quot; /&gt;&lt;/p&gt;\r\n', '&lt;p&gt;Quần jeans nam Zara TWO-TONE JEANS siêu đẹp, giá chỉ 39,9 USD&lt;/p&gt;\r\n', 'Quần Jeans nam Zara', 'quần bò zara', 'Quần Zara, quần bò zara, quần jeans zara, jeans zara, zara'),
(194, 2, 'Quần Jeans nam Zara', '&lt;p&gt;Quần Jeans Nam Zara được thiết kế rất đẹp, dáng quần thường ôm chân nhỏ gọn làm cho ngưởi mặc trôn thanh thoát hơn. Quần sử dụng những chất liệu coton thoáng mát, đặc biệt các đường mài nhẹ nhàng hoặc tông mầu tươi tắn luôn là điểm mạnh của quần Jeans Zara. Quần phù hợp cho nhiều lứa tuổi và phong cách&lt;/p&gt;\r\n\r\n&lt;hr /&gt;\r\n&lt;p&gt;&lt;img alt=&quot;Image 1 of RIPPED JEANS from Zara &quot; src=&quot;http://static.zara.net/photos//2013/V/0/2/p/2721/430/407/2/w/400/2721430407_1_1_1.jpg?timestamp=1373480131508&quot; /&gt;&lt;img alt=&quot;Image 2 of RIPPED JEANS from Zara &quot; src=&quot;http://static.zara.net/photos//2013/V/0/2/p/2721/430/407/2/w/400/2721430407_2_1_1.jpg?timestamp=1373480131508&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;Image 3 of RIPPED JEANS from Zara &quot; src=&quot;http://static.zara.net/photos//2013/V/0/2/p/2721/430/407/2/w/400/2721430407_2_2_1.jpg?timestamp=1373480131508&quot; /&gt;&lt;img alt=&quot;Image 4 of RIPPED JEANS from Zara &quot; src=&quot;http://static.zara.net/photos//2013/V/0/2/p/2721/430/407/2/w/400/2721430407_2_3_1.jpg?timestamp=1373480131508&quot; /&gt;&lt;/p&gt;\r\n', '&lt;p&gt;Quần Jeans Zara RIPPED JEANS 49.99 USD đang SALE nhé&lt;/p&gt;\r\n', 'Quần Jeans nam Zara', 'quần bò zara', 'Quần Zara, quần bò zara, quần jeans zara, jeans zara, zara'),
(195, 2, 'Quần Jeans nam Zara', '&lt;p&gt;Quần Jeans Nam Zara được thiết kế rất đẹp, dáng quần thường ôm chân nhỏ gọn làm cho ngưởi mặc trôn thanh thoát hơn. Quần sử dụng những chất liệu coton thoáng mát, đặc biệt các đường mài nhẹ nhàng hoặc tông mầu tươi tắn luôn là điểm mạnh của quần Jeans Zara. Quần phù hợp cho nhiều lứa tuổi và phong cách&lt;/p&gt;\r\n\r\n&lt;hr /&gt;\r\n&lt;p&gt;&lt;img alt=&quot;Image 1 of STUDDED JEANS from Zara &quot; src=&quot;http://static.zara.net/photos//2013/V/0/2/p/0905/402/407/2/w/400/0905402407_1_1_1.jpg?timestamp=1373480145498&quot; /&gt;&lt;img alt=&quot;Image 2 of STUDDED JEANS from Zara &quot; src=&quot;http://static.zara.net/photos//2013/V/0/2/p/0905/402/407/2/w/400/0905402407_2_1_1.jpg?timestamp=1373480145498&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;Image 3 of STUDDED JEANS from Zara &quot; src=&quot;http://static.zara.net/photos//2013/V/0/2/p/0905/402/407/2/w/400/0905402407_2_2_1.jpg?timestamp=1373480145498&quot; /&gt;&lt;img alt=&quot;Image 4 of STUDDED JEANS from Zara &quot; src=&quot;http://static.zara.net/photos//2013/V/0/2/p/0905/402/407/2/w/400/0905402407_2_3_1.jpg?timestamp=1373480145498&quot; /&gt;&lt;/p&gt;\r\n', '&lt;p&gt;Quần Jeans Zara STUDDED JEANS siêu đẹp. Giá chỉ 49.9 USD&lt;/p&gt;\r\n', 'Quần Jeans nam Zara', 'quần bò zara', 'Quần Zara, quần bò zara, quần jeans zara, jeans zara, zara'),
(196, 2, 'Quần Jeans nam Zara', '&lt;p&gt;Quần Jeans Nam Zara được thiết kế rất đẹp, dáng quần thường ôm chân nhỏ gọn làm cho ngưởi mặc trôn thanh thoát hơn. Quần sử dụng những chất liệu coton thoáng mát, đặc biệt các đường mài nhẹ nhàng hoặc tông mầu tươi tắn luôn là điểm mạnh của quần Jeans Zara. Quần phù hợp cho nhiều lứa tuổi và phong cách&lt;/p&gt;\r\n\r\n&lt;hr /&gt;\r\n&lt;p&gt;&lt;img alt=&quot;Image 1 of STUDDED JEANS from Zara &quot; src=&quot;http://static.zara.net/photos//2013/V/0/2/p/6594/400/406/2/w/400/6594400406_1_1_1.jpg?timestamp=1373480109548&quot; /&gt;&lt;img alt=&quot;Image 2 of STUDDED JEANS from Zara &quot; src=&quot;http://static.zara.net/photos//2013/V/0/2/p/6594/400/406/2/w/400/6594400406_2_1_1.jpg?timestamp=1373480109548&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;Image 3 of STUDDED JEANS from Zara &quot; src=&quot;http://static.zara.net/photos//2013/V/0/2/p/6594/400/406/2/w/400/6594400406_2_2_1.jpg?timestamp=1373480109548&quot; /&gt;&lt;img alt=&quot;Image 4 of STUDDED JEANS from Zara &quot; src=&quot;http://static.zara.net/photos//2013/V/0/2/p/6594/400/406/2/w/400/6594400406_2_3_1.jpg?timestamp=1373480109548&quot; /&gt;&lt;/p&gt;\r\n', '&lt;p&gt;Quần Jeans Zara STUDDED JEANS sáng mầu cực đẹp. Giá 39.99 USD&lt;/p&gt;\r\n', 'Quần Jeans nam Zara', 'quần bò Zara', 'Quần Zara, quần bò zara, quần jeans zara, jeans zara, zara'),
(197, 2, 'Quần Jeans nam Zara', '&lt;p&gt;Quần Jeans Nam Zara được thiết kế rất đẹp, dáng quần thường ôm chân nhỏ gọn làm cho ngưởi mặc trôn thanh thoát hơn. Quần sử dụng những chất liệu coton thoáng mát, đặc biệt các đường mài nhẹ nhàng hoặc tông mầu tươi tắn luôn là điểm mạnh của quần Jeans Zara. Quần phù hợp cho nhiều lứa tuổi và phong cách&lt;/p&gt;\r\n\r\n&lt;hr /&gt;\r\n&lt;p&gt;&lt;img alt=&quot;Image 1 of 5 POCKET BULL DENIM TROUSERS from Zara &quot; src=&quot;http://static.zara.net/photos//2013/V/0/2/p/5575/444/400/2/w/400/5575444400_1_1_1.jpg?timestamp=1373480148168&quot; /&gt;&lt;img alt=&quot;Image 2 of 5 POCKET BULL DENIM TROUSERS from Zara &quot; src=&quot;http://static.zara.net/photos//2013/V/0/2/p/5575/444/400/2/w/400/5575444400_2_1_1.jpg?timestamp=1373480148168&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;Image 3 of 5 POCKET BULL DENIM TROUSERS from Zara &quot; src=&quot;http://static.zara.net/photos//2013/V/0/2/p/5575/444/400/2/w/400/5575444400_2_2_1.jpg?timestamp=1373480148168&quot; /&gt;&lt;img alt=&quot;Image 4 of 5 POCKET BULL DENIM TROUSERS from Zara &quot; src=&quot;http://static.zara.net/photos//2013/V/0/2/p/5575/444/400/2/w/400/5575444400_2_3_1.jpg?timestamp=1373480148168&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;Image 5 of 5 POCKET BULL DENIM TROUSERS from Zara &quot; src=&quot;http://static.zara.net/photos//2013/V/0/2/p/5575/444/400/2/w/400/5575444400_2_4_1.jpg?timestamp=1373480148168&quot; /&gt;&lt;/p&gt;\r\n', '&lt;p&gt;Quần Jeans Zara 5 POCKET BULL DENIM TROUSERS nhiều mầu đẹp quá. Giá chỉ 25.99 USD&lt;/p&gt;\r\n', 'Quần Jeans nam Zara', 'quần bò zara', 'Quần Zara, quần bò zara, quần jeans zara, jeans zara, zara'),
(198, 2, 'Quần Jeans nam Zara', '&lt;p&gt;Quần Jeans Nam Zara được thiết kế rất đẹp, dáng quần thường ôm chân nhỏ gọn làm cho ngưởi mặc trôn thanh thoát hơn. Quần sử dụng những chất liệu coton thoáng mát, đặc biệt các đường mài nhẹ nhàng hoặc tông mầu tươi tắn luôn là điểm mạnh của quần Jeans Zara. Quần phù hợp cho nhiều lứa tuổi và phong cách&lt;/p&gt;\r\n\r\n&lt;hr /&gt;\r\n&lt;p&gt;&lt;img alt=&quot;Image 1 of CONTRASTING JEANS from Zara &quot; src=&quot;http://static.zara.net/photos//2013/V/0/2/p/7215/450/406/2/w/400/7215450406_1_1_1.jpg?timestamp=1373480110608&quot; /&gt;&lt;img alt=&quot;Image 2 of CONTRASTING JEANS from Zara &quot; src=&quot;http://static.zara.net/photos//2013/V/0/2/p/7215/450/406/2/w/400/7215450406_2_1_1.jpg?timestamp=1373480110608&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;Image 3 of CONTRASTING JEANS from Zara &quot; src=&quot;http://static.zara.net/photos//2013/V/0/2/p/7215/450/406/2/w/400/7215450406_2_2_1.jpg?timestamp=1373480110608&quot; /&gt;&lt;img alt=&quot;Image 4 of CONTRASTING JEANS from Zara &quot; src=&quot;http://static.zara.net/photos//2013/V/0/2/p/7215/450/406/2/w/400/7215450406_2_3_1.jpg?timestamp=1373480110608&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;Image 5 of CONTRASTING JEANS from Zara &quot; src=&quot;http://static.zara.net/photos//2013/V/0/2/p/7215/450/406/2/w/400/7215450406_2_4_1.jpg?timestamp=1373480110608&quot; /&gt;&lt;/p&gt;\r\n', '&lt;p&gt;Quần Jeans nam zara CONSTRETING giá 49.99 USD - Mua ngay&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n', 'Quần Jeans nam Zara', 'quần bò zara', 'Quần Zara, quần bò zara, quần jeans zara, jeans zara, zara'),
(199, 2, 'Quần Jeans nam Zara', '&lt;p&gt;Quần Jeans Nam Zara được thiết kế rất đẹp, dáng quần thường ôm chân nhỏ gọn làm cho ngưởi mặc trôn thanh thoát hơn. Quần sử dụng những chất liệu coton thoáng mát, đặc biệt các đường mài nhẹ nhàng hoặc tông mầu tươi tắn luôn là điểm mạnh của quần Jeans Zara. Quần phù hợp cho nhiều lứa tuổi và phong cách&lt;/p&gt;\r\n\r\n&lt;hr /&gt;\r\n&lt;p&gt;&lt;img alt=&quot;Image 1 of 1 POCKET BULL DENIM TROUSERS from Zara &quot; src=&quot;http://static.zara.net/photos//2013/V/0/2/p/5575/444/800/2/w/400/5575444800_1_1_1.jpg?timestamp=1373480148168&quot; /&gt;&lt;img alt=&quot;Image 2 of 2 POCKET BULL DENIM TROUSERS from Zara &quot; src=&quot;http://static.zara.net/photos//2013/V/0/2/p/5575/444/800/2/w/400/5575444800_2_1_1.jpg?timestamp=1373480148168&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;Image 3 of 3 POCKET BULL DENIM TROUSERS from Zara &quot; src=&quot;http://static.zara.net/photos//2013/V/0/2/p/5575/444/800/2/w/400/5575444800_2_2_1.jpg?timestamp=1373480148168&quot; /&gt;&lt;img alt=&quot;Image 4 of 4 POCKET BULL DENIM TROUSERS from Zara &quot; src=&quot;http://static.zara.net/photos//2013/V/0/2/p/5575/444/800/2/w/400/5575444800_2_3_1.jpg?timestamp=1373480148168&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;Image 5 of 5 POCKET BULL DENIM TROUSERS from Zara &quot; src=&quot;http://static.zara.net/photos//2013/V/0/2/p/5575/444/800/2/w/400/5575444800_2_4_1.jpg?timestamp=1373480148168&quot; /&gt;&lt;/p&gt;\r\n', '&lt;p&gt;Quần Jeans nam Zara mầu đen siêu đẹp. Giá chỉ 25.99 USD&lt;/p&gt;\r\n', 'Quần Jeans nam Zara', 'Quần bò Zara', 'Quần Zara, quần bò zara, quần jeans zara, jeans zara, zara'),
(200, 2, 'Quần Jeans nam Zara', '&lt;p&gt;Quần Jeans Nam Zara được thiết kế rất đẹp, dáng quần thường ôm chân nhỏ gọn làm cho ngưởi mặc trôn thanh thoát hơn. Quần sử dụng những chất liệu coton thoáng mát, đặc biệt các đường mài nhẹ nhàng hoặc tông mầu tươi tắn luôn là điểm mạnh của quần Jeans Zara. Quần phù hợp cho nhiều lứa tuổi và phong cách&lt;/p&gt;\r\n\r\n&lt;hr /&gt;\r\n&lt;p&gt;&lt;img alt=&quot;Image 1 of JEANS WITH SEAMED YOKE from Zara &quot; src=&quot;http://static.zara.net/photos//2013/V/0/2/p/3951/401/407/2/w/400/3951401407_1_1_1.jpg?timestamp=1373480110698&quot; /&gt;&lt;img alt=&quot;Image 2 of JEANS WITH SEAMED YOKE from Zara &quot; src=&quot;http://static.zara.net/photos//2013/V/0/2/p/3951/401/407/2/w/400/3951401407_2_1_1.jpg?timestamp=1373480110698&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;Image 3 of JEANS WITH SEAMED YOKE from Zara &quot; src=&quot;http://static.zara.net/photos//2013/V/0/2/p/3951/401/407/2/w/400/3951401407_2_2_1.jpg?timestamp=1373480110698&quot; /&gt;&lt;img alt=&quot;Image 4 of JEANS WITH SEAMED YOKE from Zara &quot; src=&quot;http://static.zara.net/photos//2013/V/0/2/p/3951/401/407/2/w/400/3951401407_2_3_1.jpg?timestamp=1373480110698&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;Image 5 of JEANS WITH SEAMED YOKE from Zara &quot; src=&quot;http://static.zara.net/photos//2013/V/0/2/p/3951/401/407/2/w/400/3951401407_2_5_1.jpg?timestamp=1373480110698&quot; /&gt;&lt;/p&gt;\r\n', '&lt;p&gt;Quần Jeans nam Zara JEANS WITH SEAMED YOKE quá đẹp. Giá 49.99 USD&lt;/p&gt;\r\n', 'Quần Jeans nam Zara', 'Quần bò zara', 'Quần Zara, quần bò zara, quần jeans zara, jeans zara, zara'),
(201, 2, 'Áo polo nam Diesel', '&lt;p style=&quot;margin-left:1.0in;&quot;&gt;Áo polo nam Diesel phong cách đến từ ITALIA rất đẹp, Áo thường thiết kế theo kiểu ôm thân, hãng sử dụng các tông mầu tươi và mài bụi khiến ngừoi mặc trông trẻ trung, khỏe mạnh, nam tính hơn. Áo phù hợp với hầu hết các loại quần Jeans. Diesel thường gắn logo của hãng cách điệu theo các mẫu khác nhau tạo điểm nhấn cho áo.&lt;/p&gt;\r\n\r\n&lt;hr /&gt;\r\n&lt;p&gt;&lt;img alt=&quot;DIESEL - Polo - T-HUMOR-S&quot; src=&quot;http://cdn.yoox.biz/37/37444557JF_12_f.jpg&quot; /&gt;&lt;img alt=&quot;DIESEL - Polo - T-HUMOR-S&quot; src=&quot;http://cdn.yoox.biz/37/37444557jf_12_e.jpg&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;DIESEL - Polo - T-HUMOR-S&quot; src=&quot;http://cdn.yoox.biz/37/37444557jf_12_r.jpg&quot; /&gt;&lt;img alt=&quot;DIESEL - Polo - T-HUMOR-S&quot; src=&quot;http://cdn.yoox.biz/37/37444557jf_12_d.jpg&quot; /&gt;&lt;/p&gt;\r\n', '&lt;p&gt;Áo polo Diesel T-HUMOR-S Giá đang SALE chỉ còn 56 GBP.&lt;/p&gt;\r\n', 'Áo polo nam Diesel', 'Áo polo Diesel', 'Áo polo Diesel, áo diesel, áo phông diesel, áo có cổ diesel, diesel'),
(202, 2, 'Áo polo nam Diesel', '&lt;p style=&quot;margin-left:1.0in;&quot;&gt;Áo polo nam Diesel phong cách đến từ ITALIA rất đẹp, Áo thường thiết kế theo kiểu ôm thân, hãng sử dụng các tông mầu tươi và mài bụi khiến ngừoi mặc trông trẻ trung, khỏe mạnh, nam tính hơn. Áo phù hợp với hầu hết các loại quần Jeans. Diesel thường gắn logo của hãng cách điệu theo các mẫu khác nhau tạo điểm nhấn cho áo.&lt;/p&gt;\r\n\r\n&lt;hr /&gt;\r\n&lt;p&gt;&lt;img alt=&quot;DIESEL - Polo - T-HUMOR-S&quot; src=&quot;http://cdn.yoox.biz/37/37444557qp_12_f.jpg&quot; /&gt;&lt;img alt=&quot;DIESEL - Polo - T-HUMOR-S&quot; src=&quot;http://cdn.yoox.biz/37/37444557qp_12_e.jpg&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;DIESEL - Polo - T-HUMOR-S&quot; src=&quot;http://cdn.yoox.biz/37/37444557qp_12_r.jpg&quot; /&gt;&lt;img alt=&quot;DIESEL - Polo - T-HUMOR-S&quot; src=&quot;http://cdn.yoox.biz/37/37444557qp_12_d.jpg&quot; /&gt;&lt;/p&gt;\r\n', '&lt;p&gt;Áo polo nam Diesel mầu cam cực đẹp. Giá đang SALE còn 56 bảng&lt;/p&gt;\r\n', 'Áo polo nam Diesel', 'Áo polo Diesel', 'Áo polo Diesel, áo diesel, áo phông diesel, áo có cổ diesel, diesel'),
(203, 2, 'Áo polo nam Diesel', '&lt;p style=&quot;margin-left:1.0in;&quot;&gt;Áo polo nam Diesel phong cách đến từ ITALIA rất đẹp, Áo thường thiết kế theo kiểu ôm thân, hãng sử dụng các tông mầu tươi và mài bụi khiến ngừoi mặc trông trẻ trung, khỏe mạnh, nam tính hơn. Áo phù hợp với hầu hết các loại quần Jeans. Diesel thường gắn logo của hãng cách điệu theo các mẫu khác nhau tạo điểm nhấn cho áo.&lt;/p&gt;\r\n\r\n&lt;hr /&gt;\r\n&lt;p&gt;&lt;img alt=&quot;DIESEL - Polo - T-ERINNI-S&quot; src=&quot;http://cdn.yoox.biz/37/37390306nv_12_f.jpg&quot; /&gt;&lt;img alt=&quot;DIESEL - Polo - T-ERINNI-S&quot; src=&quot;http://cdn.yoox.biz/37/37390306nv_12_e.jpg&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;DIESEL - Polo - T-ERINNI-S&quot; src=&quot;http://cdn.yoox.biz/37/37390306nv_12_r.jpg&quot; /&gt;&lt;img alt=&quot;DIESEL - Polo - T-ERINNI-S&quot; src=&quot;http://cdn.yoox.biz/37/37390306nv_12_d.jpg&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;DIESEL - Polo - T-ERINNI-S&quot; src=&quot;http://cdn.yoox.biz/37/37390306fe_12_f.jpg&quot; /&gt;&lt;img alt=&quot;DIESEL - Polo - T-ERINNI-S&quot; src=&quot;http://cdn.yoox.biz/37/37390306fe_12_e.jpg&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;DIESEL - Polo - T-ERINNI-S&quot; src=&quot;http://cdn.yoox.biz/37/37390306fe_12_r.jpg&quot; /&gt;&lt;img alt=&quot;DIESEL - Polo - T-ERINNI-S&quot; src=&quot;http://cdn.yoox.biz/37/37390306fe_12_d.jpg&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;DIESEL - Polo - T-ERINNI-S&quot; src=&quot;http://cdn.yoox.biz/37/37390306hn_12_f.jpg&quot; /&gt;&lt;img alt=&quot;DIESEL - Polo - T-ERINNI-S&quot; src=&quot;http://cdn.yoox.biz/37/37390306hn_12_e.jpg&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;DIESEL - Polo - T-ERINNI-S&quot; src=&quot;http://cdn.yoox.biz/37/37390306xl_12_f.jpg&quot; /&gt;&lt;img alt=&quot;DIESEL - Polo - T-ERINNI-S&quot; src=&quot;http://cdn.yoox.biz/37/37390306xl_12_e.jpg&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;DIESEL - Polo - T-ERINNI-S&quot; src=&quot;http://cdn.yoox.biz/37/37390306sg_12_f.jpg&quot; /&gt;&lt;img alt=&quot;DIESEL - Polo - T-ERINNI-S&quot; src=&quot;http://cdn.yoox.biz/37/37390306sg_12_e.jpg&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;DIESEL - Polo - T-ERINNI-S&quot; src=&quot;http://cdn.yoox.biz/37/37390306eo_12_f.jpg&quot; /&gt;&lt;img alt=&quot;DIESEL - Polo - T-ERINNI-S&quot; src=&quot;http://cdn.yoox.biz/37/37390306eo_12_e.jpg&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;DIESEL - Polo - T-ERINNI-S&quot; src=&quot;http://cdn.yoox.biz/37/37390306dc_12_e.jpg&quot; /&gt;&lt;img alt=&quot;DIESEL - Polo - T-ERINNI-S&quot; src=&quot;http://cdn.yoox.biz/37/37390306dc_12_f.jpg&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;DIESEL - Polo - T-ERINNI-S&quot; src=&quot;http://cdn.yoox.biz/37/37390306ba_12_f.jpg&quot; /&gt;&lt;img alt=&quot;DIESEL - Polo - T-ERINNI-S&quot; src=&quot;http://cdn.yoox.biz/37/37390306ba_12_e.jpg&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;DIESEL - Polo - T-ERINNI-S&quot; src=&quot;http://cdn.yoox.biz/37/37390306ba_12_r.jpg&quot; /&gt;&lt;img alt=&quot;DIESEL - Polo - T-ERINNI-S&quot; src=&quot;http://cdn.yoox.biz/37/37390306ba_12_d.jpg&quot; /&gt;&lt;/p&gt;\r\n', '&lt;p&gt;Áo polo Diesel T-ERINNI-S mới về giá 55 GBP. Mua ngay&lt;/p&gt;\r\n', 'Áo polo nam Diesel', 'Áo polo Diesel', 'Áo polo Diesel, áo diesel, áo phông diesel, áo có cổ diesel, diesel'),
(204, 2, 'Áo polo nam Diesel', '&lt;p style=&quot;margin-left:1.0in;&quot;&gt;Áo polo nam Diesel phong cách đến từ ITALIA rất đẹp, Áo thường thiết kế theo kiểu ôm thân, hãng sử dụng các tông mầu tươi và mài bụi khiến ngừoi mặc trông trẻ trung, khỏe mạnh, nam tính hơn. Áo phù hợp với hầu hết các loại quần Jeans. Diesel thường gắn logo của hãng cách điệu theo các mẫu khác nhau tạo điểm nhấn cho áo.&lt;/p&gt;\r\n\r\n&lt;hr /&gt;\r\n&lt;p&gt;&lt;img alt=&quot;DIESEL - Polo - T-SNISIP&quot; src=&quot;http://cdn.yoox.biz/37/37444602HM_12_f.jpg&quot; /&gt;&lt;img alt=&quot;DIESEL - Polo - T-SNISIP&quot; src=&quot;http://cdn.yoox.biz/37/37444602hm_12_e.jpg&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;DIESEL - Polo - T-SNISIP&quot; src=&quot;http://cdn.yoox.biz/37/37444602hm_12_r.jpg&quot; /&gt;&lt;img alt=&quot;DIESEL - Polo - T-SNISIP&quot; src=&quot;http://cdn.yoox.biz/37/37444602hm_12_d.jpg&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;DIESEL - Polo - T-SNISIP&quot; src=&quot;http://cdn.yoox.biz/37/37444602qf_12_f.jpg&quot; /&gt;&lt;img alt=&quot;DIESEL - Polo - T-SNISIP&quot; src=&quot;http://cdn.yoox.biz/37/37444602qf_12_e.jpg&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;DIESEL - Polo - T-SNISIP&quot; src=&quot;http://cdn.yoox.biz/37/37444602qf_12_r.jpg&quot; /&gt;&lt;img alt=&quot;DIESEL - Polo - T-SNISIP&quot; src=&quot;http://cdn.yoox.biz/37/37444602qf_12_d.jpg&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;DIESEL - Polo - T-SNISIP&quot; src=&quot;http://cdn.yoox.biz/37/37444602ip_12_f.jpg&quot; /&gt;&lt;img alt=&quot;DIESEL - Polo - T-SNISIP&quot; src=&quot;http://cdn.yoox.biz/37/37444602ip_12_e.jpg&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;DIESEL - Polo - T-SNISIP&quot; src=&quot;http://cdn.yoox.biz/37/37444602ip_12_r.jpg&quot; /&gt;&lt;img alt=&quot;DIESEL - Polo - T-SNISIP&quot; src=&quot;http://cdn.yoox.biz/37/37444602ip_12_d.jpg&quot; /&gt;&lt;/p&gt;\r\n', '&lt;p&gt;Áo polo nam Diesel T-SNISIP mài WASH cực chất - Hàng mới giá 80 bảng&lt;/p&gt;\r\n', 'Áo polo nam Diesel', 'Áo polo Diesel', 'Áo polo Diesel, áo diesel, áo phông diesel, áo có cổ diesel, diesel'),
(205, 2, 'Áo polo nam Diesel', '&lt;p style=&quot;margin-left:1.0in;&quot;&gt;Áo polo nam Diesel phong cách đến từ ITALIA rất đẹp, Áo thường thiết kế theo kiểu ôm thân, hãng sử dụng các tông mầu tươi và mài bụi khiến ngừoi mặc trông trẻ trung, khỏe mạnh, nam tính hơn. Áo phù hợp với hầu hết các loại quần Jeans. Diesel thường gắn logo của hãng cách điệu theo các mẫu khác nhau tạo điểm nhấn cho áo.&lt;/p&gt;\r\n\r\n&lt;hr /&gt;\r\n&lt;p&gt;&lt;img alt=&quot;DIESEL - Polo - T-NYX-S&quot; src=&quot;http://cdn.yoox.biz/37/37390307hx_12_f.jpg&quot; /&gt;&lt;img alt=&quot;DIESEL - Polo - T-NYX-S&quot; src=&quot;http://cdn.yoox.biz/37/37390307hx_12_e.jpg&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;DIESEL - Polo - T-NYX-S&quot; src=&quot;http://cdn.yoox.biz/37/37390307hx_12_r.jpg&quot; /&gt;&lt;img alt=&quot;DIESEL - Polo - T-NYX-S&quot; src=&quot;http://cdn.yoox.biz/37/37390307hx_12_d.jpg&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;DIESEL - Polo - T-NYX-S&quot; src=&quot;http://cdn.yoox.biz/37/37390307ww_12_f.jpg&quot; /&gt;&lt;img alt=&quot;DIESEL - Polo - T-NYX-S&quot; src=&quot;http://cdn.yoox.biz/37/37390307ww_12_e.jpg&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;DIESEL - Polo - T-NYX-S&quot; src=&quot;http://cdn.yoox.biz/37/37390307ag_12_f.jpg&quot; /&gt;&lt;img alt=&quot;DIESEL - Polo - T-NYX-S&quot; src=&quot;http://cdn.yoox.biz/37/37390307ag_12_e.jpg&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;DIESEL - Polo - T-NYX-S&quot; src=&quot;http://cdn.yoox.biz/37/37390307ob_12_f.jpg&quot; /&gt;&lt;img alt=&quot;DIESEL - Polo - T-NYX-S&quot; src=&quot;http://cdn.yoox.biz/37/37390307ob_12_e.jpg&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;DIESEL - Polo - T-NYX-S&quot; src=&quot;http://cdn.yoox.biz/37/37390307dx_12_f.jpg&quot; /&gt;&lt;img alt=&quot;DIESEL - Polo - T-NYX-S&quot; src=&quot;http://cdn.yoox.biz/37/37390307dx_12_e.jpg&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;DIESEL - Polo - T-NYX-S&quot; src=&quot;http://cdn.yoox.biz/37/37390307jh_12_e.jpg&quot; /&gt;&lt;img alt=&quot;DIESEL - Polo - T-NYX-S&quot; src=&quot;http://cdn.yoox.biz/37/37390307jh_12_f.jpg&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;DIESEL - Polo - T-NYX-S&quot; src=&quot;http://cdn.yoox.biz/37/37390307ox_12_f.jpg&quot; /&gt;&lt;img alt=&quot;DIESEL - Polo - T-NYX-S&quot; src=&quot;http://cdn.yoox.biz/37/37390307ox_12_e.jpg&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;DIESEL - Polo - T-NYX-S&quot; src=&quot;http://cdn.yoox.biz/37/37390307dg_12_f.jpg&quot; /&gt;&lt;img alt=&quot;DIESEL - Polo - T-NYX-S&quot; src=&quot;http://cdn.yoox.biz/37/37390307dg_12_e.jpg&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;DIESEL - Polo - T-NYX-S&quot; src=&quot;http://cdn.yoox.biz/37/37390307du_12_f.jpg&quot; /&gt;&lt;img alt=&quot;DIESEL - Polo - T-NYX-S&quot; src=&quot;http://cdn.yoox.biz/37/37390307du_12_e.jpg&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;DIESEL - Polo - T-NYX-S&quot; src=&quot;http://cdn.yoox.biz/37/37390307bq_12_f.jpg&quot; /&gt;&lt;img alt=&quot;DIESEL - Polo - T-NYX-S&quot; src=&quot;http://cdn.yoox.biz/37/37390307bq_12_e.jpg&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;DIESEL - Polo - T-NYX-S&quot; src=&quot;http://cdn.yoox.biz/37/37390307wl_12_f.jpg&quot; /&gt;&lt;img alt=&quot;DIESEL - Polo - T-NYX-S&quot; src=&quot;http://cdn.yoox.biz/37/37390307wl_12_e.jpg&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;DIESEL - Polo - T-NYX-S&quot; src=&quot;http://cdn.yoox.biz/37/37390307fv_12_f.jpg&quot; /&gt;&lt;img alt=&quot;DIESEL - Polo - T-NYX-S&quot; src=&quot;http://cdn.yoox.biz/37/37390307fv_12_e.jpg&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n', '&lt;p&gt;Áo polo nam Diesel T-NYX-S cổ điển nhiều mầu rất đẹp. Giá 55 bảng !!!&lt;/p&gt;\r\n', 'Áo polo nam Diesel', 'Áo polo Diesel', 'Áo polo Diesel, áo diesel, áo phông diesel, áo có cổ diesel, diesel'),
(206, 2, 'Áo polo nam Diesel ', '&lt;p style=&quot;margin-left:1.0in;&quot;&gt;Áo polo nam Diesel phong cách đến từ ITALIA rất đẹp, Áo thường thiết kế theo kiểu ôm thân, hãng sử dụng các tông mầu tươi và mài bụi khiến ngừoi mặc trông trẻ trung, khỏe mạnh, nam tính hơn. Áo phù hợp với hầu hết các loại quần Jeans. Diesel thường gắn logo của hãng cách điệu theo các mẫu khác nhau tạo điểm nhấn cho áo.&lt;/p&gt;\r\n\r\n&lt;hr /&gt;\r\n&lt;p&gt;&lt;img alt=&quot;DIESEL - Polo - T-NORMAN-S 0GABS&quot; src=&quot;http://cdn.yoox.biz/37/37465287iw_12_f.jpg&quot; /&gt;&lt;img alt=&quot;DIESEL - Polo - T-NORMAN-S 0GABS&quot; src=&quot;http://cdn.yoox.biz/37/37465287iw_12_e.jpg&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;DIESEL - Polo - T-NORMAN-S 0GABS&quot; src=&quot;http://cdn.yoox.biz/37/37465287iw_12_r.jpg&quot; /&gt;&lt;img alt=&quot;DIESEL - Polo - T-NORMAN-S 0GABS&quot; src=&quot;http://cdn.yoox.biz/37/37465287iw_12_d.jpg&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;DIESEL - Polo - T-NORMAN-S 0GABS&quot; src=&quot;http://cdn.yoox.biz/37/37465287bb_12_f.jpg&quot; /&gt;&lt;img alt=&quot;DIESEL - Polo - T-NORMAN-S 0GABS&quot; src=&quot;http://cdn.yoox.biz/37/37465287bb_12_e.jpg&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;DIESEL - Polo - T-NORMAN-S 0GABS&quot; src=&quot;http://cdn.yoox.biz/37/37465287ah_12_f.jpg&quot; /&gt;&lt;img alt=&quot;DIESEL - Polo - T-NORMAN-S 0GABS&quot; src=&quot;http://cdn.yoox.biz/37/37465287ah_12_e.jpg&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;DIESEL - Polo - T-NORMAN-S 0GABS&quot; src=&quot;http://cdn.yoox.biz/37/37465287qf_12_f.jpg&quot; /&gt;&lt;img alt=&quot;DIESEL - Polo - T-NORMAN-S 0GABS&quot; src=&quot;http://cdn.yoox.biz/37/37465287qf_12_e.jpg&quot; /&gt;&lt;/p&gt;\r\n', '&lt;p&gt;Áo polo nam Diesel T-NORMAN-S 0GABS cổ bò có 4 mầu cực chất. Giá 80 bảng.&lt;/p&gt;\r\n', 'Áo polo nam Diesel ', 'Áo polo Diesel ', 'Áo polo Diesel, áo diesel, áo phông diesel, áo có cổ diesel, diesel'),
(207, 2, 'Áo phông nam Diesel', '&lt;p style=&quot;margin-left:1.0in;&quot;&gt;Áo phông nam Diesel phong cách đến từ ITALIA rất đẹp, Áo thường thiết kế theo kiểu ôm thân, hãng sử dụng các tông mầu tươi và mài bụi khiến ngừoi mặc trông trẻ trung, khỏe mạnh, nam tính hơn. Áo phù hợp với hầu hết các loại quần Jeans. Diesel thường gắn logo của hãng hoặc trang trí các họa tiết chữ to hoặc hình hài đặc sắc cách điệu theo các mẫu khác nhau tạo điểm nhấn cho áo.&lt;/p&gt;\r\n\r\n&lt;hr /&gt;\r\n&lt;p&gt;&lt;img alt=&quot;DIESEL - Short sleeves - T-DAU&quot; src=&quot;http://cdn.yoox.biz/37/37465358tk_12_f.jpg&quot; /&gt;&lt;img alt=&quot;DIESEL - Short sleeves - T-DAU&quot; src=&quot;http://cdn.yoox.biz/37/37465358tk_12_e.jpg&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;DIESEL - Short sleeves - T-DAU&quot; src=&quot;http://cdn.yoox.biz/37/37465358tk_12_r.jpg&quot; /&gt;&lt;img alt=&quot;DIESEL - Short sleeves - T-DAU&quot; src=&quot;http://cdn.yoox.biz/37/37465358tk_12_d.jpg&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;DIESEL - Short sleeves - T-DAU&quot; src=&quot;http://cdn.yoox.biz/37/37465358qv_12_f.jpg&quot; /&gt;&lt;img alt=&quot;DIESEL - Short sleeves - T-DAU&quot; src=&quot;http://cdn.yoox.biz/37/37465358qv_12_e.jpg&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;DIESEL - Short sleeves - T-DAU&quot; src=&quot;http://cdn.yoox.biz/37/37465358qv_12_r.jpg&quot; /&gt;&lt;img alt=&quot;DIESEL - Short sleeves - T-DAU&quot; src=&quot;http://cdn.yoox.biz/37/37465358qv_12_d.jpg&quot; /&gt;&lt;/p&gt;\r\n', '&lt;p&gt;Áo Diesel T-DAU Mới về dòng cao cấp cực chất. Giá 140 bảng !!!&lt;/p&gt;\r\n', 'Áo phông nam Diesel', 'Áo phông Diesel', 'áo phông Diesel, áo diesel, áo thun Diesel, diesel');
INSERT INTO `product_description` (`product_id`, `language_id`, `name`, `description`, `sort_description`, `meta_description`, `meta_keyword`, `tag`) VALUES
(209, 2, 'Áo khoác nam Zara', '&lt;p style=&quot;margin-left:1.0in;&quot;&gt;Áo khoác nam Zara được thiết kế theo phong cách hiện đại, chi tiết áo rất đơn giản phù hợp với phong cách lịch lãm, trẻ trung. Áo thường được may theo kiểu dáng ôm thân nhỏ gọn. Zara là hãng đi đầu trong lĩnh vực sản xuất các mặt hàng thời trang trẻ. Đây là sự lựa chọn không thể thiếu cho các chàng trai&lt;/p&gt;\r\n\r\n&lt;hr /&gt;\r\n&lt;p&gt;&lt;img alt=&quot;Image 1 of JACKET WITH WHITE SEAMS from Zara &quot; class=&quot;image-big gaViewEvent sbdraggable draggableMain&quot; data-=&quot;&quot; data-category=&quot;436192&quot; data-color=&quot;441&quot; data-ga-props=&quot;{action:''Super_Zoom'', opt_label:''Ampliar''}&quot; data-id=&quot;1048592&quot; data-ref=&quot;05862421-V2013&quot; data-zoom-index=&quot;0&quot; data-zoom-url=&quot;//static.zara.net/photos//2013/V/0/2/p/5862/421/441/2/w/1920/5862421441_1_1_1.jpg?timestamp=1373480108178&quot; id=&quot;bigImage&quot; name=&quot;JACKET WITH WHITE SEAMS&quot; src=&quot;//static.zara.net/photos//2013/V/0/2/p/5862/421/441/2/w/400/5862421441_1_1_1.jpg?timestamp=1373480108178&quot; style=&quot;background: none repeat scroll 0% 0% transparent; min-height: 0px; display: inline; visibility: visible; opacity: 1;&quot; /&gt;&lt;img alt=&quot;Image 2 of JACKET WITH WHITE SEAMS from Zara &quot; class=&quot;image-big gaViewEvent sbdraggable draggableMain&quot; data-=&quot;&quot; data-category=&quot;436192&quot; data-color=&quot;441&quot; data-ga-props=&quot;{action:''Super_Zoom'', opt_label:''Ampliar''}&quot; data-id=&quot;1048592&quot; data-ref=&quot;05862421-V2013&quot; data-zoom-index=&quot;1&quot; data-zoom-url=&quot;//static.zara.net/photos//2013/V/0/2/p/5862/421/441/2/w/1920/5862421441_2_1_1.jpg?timestamp=1373480108178&quot; name=&quot;JACKET WITH WHITE SEAMS&quot; src=&quot;//static.zara.net/photos//2013/V/0/2/p/5862/421/441/2/w/400/5862421441_2_1_1.jpg?timestamp=1373480108178&quot; style=&quot;background: none repeat scroll 0% 0% transparent; min-height: 0px; display: inline; visibility: visible; opacity: 1;&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;Image 3 of JACKET WITH WHITE SEAMS from Zara &quot; class=&quot;image-big gaViewEvent sbdraggable draggableMain&quot; data-=&quot;&quot; data-category=&quot;436192&quot; data-color=&quot;441&quot; data-ga-props=&quot;{action:''Super_Zoom'', opt_label:''Ampliar''}&quot; data-id=&quot;1048592&quot; data-ref=&quot;05862421-V2013&quot; data-zoom-index=&quot;2&quot; data-zoom-url=&quot;//static.zara.net/photos//2013/V/0/2/p/5862/421/441/2/w/1920/5862421441_2_2_1.jpg?timestamp=1373480108178&quot; name=&quot;JACKET WITH WHITE SEAMS&quot; src=&quot;//static.zara.net/photos//2013/V/0/2/p/5862/421/441/2/w/400/5862421441_2_2_1.jpg?timestamp=1373480108178&quot; style=&quot;background: none repeat scroll 0% 0% transparent; min-height: 0px; display: inline; visibility: visible; opacity: 1;&quot; /&gt;&lt;img alt=&quot;Image 4 of JACKET WITH WHITE SEAMS from Zara &quot; class=&quot;image-big gaViewEvent sbdraggable draggableMain&quot; data-=&quot;&quot; data-category=&quot;436192&quot; data-color=&quot;441&quot; data-ga-props=&quot;{action:''Super_Zoom'', opt_label:''Ampliar''}&quot; data-id=&quot;1048592&quot; data-ref=&quot;05862421-V2013&quot; data-zoom-index=&quot;3&quot; data-zoom-url=&quot;//static.zara.net/photos//2013/V/0/2/p/5862/421/441/2/w/1920/5862421441_2_3_1.jpg?timestamp=1373480108178&quot; name=&quot;JACKET WITH WHITE SEAMS&quot; src=&quot;//static.zara.net/photos//2013/V/0/2/p/5862/421/441/2/w/400/5862421441_2_3_1.jpg?timestamp=1373480108178&quot; style=&quot;background: none repeat scroll 0% 0% transparent; min-height: 0px; display: inline; visibility: visible; opacity: 1;&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;Image 5 of JACKET WITH WHITE SEAMS from Zara &quot; class=&quot;image-big gaViewEvent sbdraggable draggableMain&quot; data-=&quot;&quot; data-category=&quot;436192&quot; data-color=&quot;441&quot; data-ga-props=&quot;{action:''Super_Zoom'', opt_label:''Ampliar''}&quot; data-id=&quot;1048592&quot; data-ref=&quot;05862421-V2013&quot; data-zoom-index=&quot;4&quot; data-zoom-url=&quot;//static.zara.net/photos//2013/V/0/2/p/5862/421/441/2/w/1920/5862421441_2_4_1.jpg?timestamp=1373480108178&quot; name=&quot;JACKET WITH WHITE SEAMS&quot; src=&quot;//static.zara.net/photos//2013/V/0/2/p/5862/421/441/2/w/400/5862421441_2_4_1.jpg?timestamp=1373480108178&quot; style=&quot;background: none repeat scroll 0% 0% transparent; min-height: 0px; display: inline; visibility: visible; opacity: 1;&quot; /&gt;&lt;img alt=&quot;Image 6 of JACKET WITH WHITE SEAMS from Zara &quot; class=&quot;image-big gaViewEvent sbdraggable draggableMain&quot; data-=&quot;&quot; data-category=&quot;436192&quot; data-color=&quot;441&quot; data-ga-props=&quot;{action:''Super_Zoom'', opt_label:''Ampliar''}&quot; data-id=&quot;1048592&quot; data-ref=&quot;05862421-V2013&quot; data-zoom-index=&quot;5&quot; data-zoom-url=&quot;//static.zara.net/photos//2013/V/0/2/p/5862/421/441/2/w/1920/5862421441_2_5_1.jpg?timestamp=1373480108178&quot; name=&quot;JACKET WITH WHITE SEAMS&quot; src=&quot;//static.zara.net/photos//2013/V/0/2/p/5862/421/441/2/w/400/5862421441_2_5_1.jpg?timestamp=1373480108178&quot; style=&quot;background: none repeat scroll 0% 0% transparent; min-height: 0px; display: inline; visibility: visible; opacity: 1;&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;Image 7 of JACKET WITH WHITE SEAMS from Zara &quot; class=&quot;image-big gaViewEvent sbdraggable draggableMain&quot; data-=&quot;&quot; data-category=&quot;436192&quot; data-color=&quot;441&quot; data-ga-props=&quot;{action:''Super_Zoom'', opt_label:''Ampliar''}&quot; data-id=&quot;1048592&quot; data-ref=&quot;05862421-V2013&quot; data-zoom-index=&quot;6&quot; data-zoom-url=&quot;//static.zara.net/photos//2013/V/0/2/p/5862/421/441/2/w/1920/5862421441_2_6_1.jpg?timestamp=1373480108178&quot; name=&quot;JACKET WITH WHITE SEAMS&quot; src=&quot;//static.zara.net/photos//2013/V/0/2/p/5862/421/441/2/w/400/5862421441_2_6_1.jpg?timestamp=1373480108178&quot; style=&quot;background: none repeat scroll 0% 0% transparent; min-height: 0px; display: inline; visibility: visible; opacity: 1;&quot; /&gt;&lt;/p&gt;\r\n', '&lt;p&gt;Áo bò nam Zara vừa về trên web, giá chỉ 59.99 USD - Mua ngay nào&lt;/p&gt;\r\n', 'Áo khoác nam Zara', 'áo khoác zara', 'áo khoác, áo khoác nam, áo khoác zara, áo bò, thời trang');

-- --------------------------------------------------------

--
-- Table structure for table `product_discount`
--

CREATE TABLE IF NOT EXISTS `product_discount` (
  `product_discount_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  `quantity` int(4) NOT NULL DEFAULT '0',
  `priority` int(5) NOT NULL DEFAULT '1',
  `price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `date_start` date NOT NULL DEFAULT '0000-00-00',
  `date_end` date NOT NULL DEFAULT '0000-00-00',
  PRIMARY KEY (`product_discount_id`),
  KEY `product_id` (`product_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=495 ;

-- --------------------------------------------------------

--
-- Table structure for table `product_filter`
--

CREATE TABLE IF NOT EXISTS `product_filter` (
  `product_id` int(11) NOT NULL,
  `filter_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`filter_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `product_image`
--

CREATE TABLE IF NOT EXISTS `product_image` (
  `product_image_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `sort_order` int(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`product_image_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2909 ;

--
-- Dumping data for table `product_image`
--

INSERT INTO `product_image` (`product_image_id`, `product_id`, `image`, `sort_order`) VALUES
(2685, 157, 'data/6519405250_1_1_1.jpg', 0),
(2684, 157, 'data/6519405250_2_3_1.jpg', 0),
(2683, 157, 'data/6519405250_2_2_1.jpg', 0),
(2681, 156, 'data/4164414400_2_1_1.jpg', 0),
(2680, 156, 'data/4164414400_1_1_1.jpg', 0),
(2682, 157, 'data/6519405250_2_1_1.jpg', 0),
(2689, 158, 'data/5445300700_2_1_1.jpg', 0),
(2688, 158, 'data/5445300700_2_2_1.jpg', 0),
(2677, 155, 'data/4085527505_2_2_1.jpg', 0),
(2679, 156, 'data/4164414400_2_2_1.jpg', 0),
(2678, 156, 'data/4164414400_2_3_1.jpg', 0),
(2672, 153, 'data/2398400711_1_1_1.jpg', 0),
(2692, 154, 'data/7248400400_2_3_1.jpg', 0),
(2691, 154, 'data/7248400400_2_2_1.jpg', 0),
(2690, 154, 'data/7248400400_2_1_1.jpg', 0),
(2676, 155, 'data/4085527505_1_1_1.jpg', 0),
(2675, 155, 'data/4085527505_2_1_1.jpg', 0),
(2674, 155, 'data/4085527505_2_4_1.jpg', 0),
(2673, 155, 'data/4085527505_2_3_1.jpg', 0),
(2671, 153, 'data/2398400711_2_2_1.jpg', 0),
(2670, 153, 'data/2398400711_2_3_1.jpg', 0),
(2669, 153, 'data/2398400711_2_5_1.jpg', 0),
(2668, 153, 'data/2398400711_2_1_1.jpg', 0),
(2687, 158, 'data/5445300700_1_1_1.jpg', 0),
(2686, 158, 'data/5445300700_2_3_1.jpg', 0),
(2696, 159, 'data/4202265403_1_1_1.jpg', 0),
(2695, 159, 'data/4202265403_2_1_1.jpg', 0),
(2694, 159, 'data/4202265403_2_3_1.jpg', 0),
(2693, 159, 'data/4202265403_2_2_1.jpg', 0),
(2700, 160, 'data/6887402400_2_1_1.jpg', 0),
(2699, 160, 'data/6887402400_2_3_1.jpg', 0),
(2698, 160, 'data/6887402400_2_2_1.jpg', 0),
(2697, 160, 'data/6887402400_1_1_1.jpg', 0),
(2704, 161, 'data/4286417400_2_2_1.jpg', 0),
(2703, 161, 'data/4286417400_2_1_1.jpg', 0),
(2702, 161, 'data/4286417400_2_3_1.jpg', 0),
(2701, 161, 'data/4286417400_1_1_1.jpg', 0),
(2708, 162, 'data/4202265403_1_1_1.jpg', 0),
(2707, 162, 'data/4202265403_2_1_1.jpg', 0),
(2706, 162, 'data/4202265403_2_3_1.jpg', 0),
(2705, 162, 'data/4202265403_2_2_1.jpg', 0),
(2711, 163, 'data/6103403250_2_2_1.jpg', 0),
(2710, 163, 'data/6103403250_2_1_1.jpg', 0),
(2709, 163, 'data/6103403250_1_1_1.jpg', 0),
(2746, 174, 'data/san_pham/38290867gl_12_d.jpg', 0),
(2714, 168, 'data/26D01MRED_3_large.jpg', 0),
(2713, 168, 'data/26D01MRED_large.jpg', 0),
(2712, 168, 'data/26D01MRED_2_large.jpg', 0),
(2738, 173, 'data/38314688kc_12_e.jpg', 0),
(2737, 173, 'data/38314688kc_12_r.jpg', 0),
(2736, 173, 'data/38314688kc_12_f.jpg', 0),
(2735, 173, 'data/38314688kc_12_d.jpg', 0),
(2745, 174, 'data/san_pham/38290867gl_12_f.jpg', 0),
(2744, 174, 'data/san_pham/38290867gl_12_e.jpg', 0),
(2743, 174, 'data/san_pham/38290867gl_12_r.jpg', 0),
(2758, 175, 'data/38314680ck_12_r.jpg', 0),
(2757, 175, 'data/38314680ck_12_f.jpg', 0),
(2756, 175, 'data/38314680ck_12_e.jpg', 0),
(2755, 175, 'data/38314680ck_12_d.jpg', 0),
(2762, 176, 'data/san_pham/38299926cq_12_e.jpg', 0),
(2761, 176, 'data/san_pham/38299926cq_12_r.jpg', 0),
(2760, 176, 'data/san_pham/38299926cq_12_f.jpg', 0),
(2759, 176, 'data/san_pham/38299926cq_12_d.jpg', 0),
(2763, 177, 'data/san_pham/38299879ef_12_d.jpg', 0),
(2764, 177, 'data/san_pham/38299879ef_12_r.jpg', 0),
(2765, 177, 'data/san_pham/38299879ef_12_e.jpg', 0),
(2766, 177, 'data/san_pham/38299879ef_12_f.jpg', 0),
(2767, 178, 'data/san_pham/38299884tg_12_d.jpg', 0),
(2768, 178, 'data/san_pham/38299884tg_12_r.jpg', 0),
(2769, 178, 'data/san_pham/38299884tg_12_e.jpg', 0),
(2770, 178, 'data/san_pham/38299884tg_12_f.jpg', 0),
(2778, 179, 'data/san_pham/38299883tn_12_f.jpg', 0),
(2777, 179, 'data/san_pham/38299883tn_12_r.jpg', 0),
(2776, 179, 'data/san_pham/38299883tn_12_e.jpg', 0),
(2775, 179, 'data/san_pham/38299883tn_12_d.jpg', 0),
(2790, 182, 'data/san_pham/foto_1.jpg', 0),
(2789, 182, 'data/san_pham/foto_3.jpg', 0),
(2788, 182, 'data/san_pham/foto_7.jpg', 0),
(2787, 182, 'data/san_pham/foto_5.jpg', 0),
(2791, 183, 'data/foto_1 (1).jpg', 0),
(2792, 183, 'data/foto_5 (1).jpg', 0),
(2793, 183, 'data/foto_3 (1).jpg', 0),
(2794, 183, 'data/foto_2.jpg', 0),
(2795, 183, 'data/foto_7.jpg', 0),
(2796, 184, 'data/san_pham/foto_1 (2).jpg', 0),
(2797, 184, 'data/san_pham/foto_2 (1).jpg', 0),
(2798, 184, 'data/san_pham/foto_3 (2).jpg', 0),
(2799, 184, 'data/san_pham/foto_6.jpg', 0),
(2800, 185, 'data/foto_1 (3).jpg', 0),
(2801, 185, 'data/foto_7 (1).jpg', 0),
(2802, 185, 'data/foto_2 (2).jpg', 0),
(2803, 185, 'data/foto_3 (3).jpg', 0),
(2804, 186, 'data/san_pham/foto_1 (4).jpg', 0),
(2805, 186, 'data/san_pham/foto_7 (2).jpg', 0),
(2806, 186, 'data/san_pham/foto_3 (4).jpg', 0),
(2807, 187, 'data/san_pham/foto_1 (5).jpg', 0),
(2808, 187, 'data/san_pham/foto_3 (5).jpg', 0),
(2809, 187, 'data/san_pham/foto_2 (3).jpg', 0),
(2810, 188, 'data/0905400800_2_1_1.jpg', 0),
(2811, 188, 'data/0905400800_2_2_1.jpg', 0),
(2812, 188, 'data/0905400800_2_4_1.jpg', 0),
(2813, 188, 'data/0905400800_2_3_1.jpg', 0),
(2814, 189, 'data/san_pham/0905403407_2_1_1.jpg', 0),
(2815, 189, 'data/san_pham/0905403407_2_2_1.jpg', 0),
(2816, 189, 'data/san_pham/0905403407_2_3_1.jpg', 0),
(2817, 190, 'data/san_pham/2627400407_2_1_1.jpg', 0),
(2818, 190, 'data/san_pham/2627400407_2_2_1.jpg', 0),
(2819, 190, 'data/san_pham/2627400407_2_4_1.jpg', 0),
(2820, 190, 'data/san_pham/2627400407_2_3_1.jpg', 0),
(2821, 190, 'data/san_pham/2627400407_2_5_1.jpg', 0),
(2822, 191, 'data/san_pham/7215408407_2_1_1.jpg', 0),
(2823, 191, 'data/san_pham/7215408407_2_2_1.jpg', 0),
(2824, 191, 'data/san_pham/7215408407_2_3_1.jpg', 0),
(2825, 192, 'data/san_pham/2627402407_2_1_1.jpg', 0),
(2826, 192, 'data/san_pham/2627402407_2_3_1.jpg', 0),
(2827, 192, 'data/san_pham/2627402407_2_2_1.jpg', 0),
(2828, 193, 'data/san_pham/7215401446_1_1_1.jpg', 0),
(2829, 193, 'data/san_pham/7215401446_2_1_1.jpg', 0),
(2830, 193, 'data/san_pham/7215401446_2_3_1.jpg', 0),
(2831, 193, 'data/san_pham/7215401446_2_2_1.jpg', 0),
(2832, 194, 'data/san_pham/2721430407_2_3_1.jpg', 0),
(2833, 194, 'data/san_pham/2721430407_1_1_1.jpg', 0),
(2834, 194, 'data/san_pham/2721430407_2_2_1.jpg', 0),
(2835, 194, 'data/san_pham/2721430407_2_1_1.jpg', 0),
(2836, 195, 'data/san_pham/0905402407_1_1_1.jpg', 0),
(2837, 195, 'data/san_pham/0905402407_2_3_1.jpg', 0),
(2838, 195, 'data/san_pham/0905402407_2_2_1.jpg', 0),
(2839, 195, 'data/san_pham/0905402407_2_1_1.jpg', 0),
(2840, 196, 'data/san_pham/6594400406_1_1_1.jpg', 0),
(2841, 196, 'data/san_pham/6594400406_2_1_1.jpg', 0),
(2842, 196, 'data/san_pham/6594400406_2_3_1.jpg', 0),
(2843, 196, 'data/san_pham/6594400406_2_2_1.jpg', 0),
(2844, 197, 'data/san_pham/5575444400_1_1_1.jpg', 0),
(2845, 197, 'data/san_pham/5575444400_2_1_1.jpg', 0),
(2846, 197, 'data/san_pham/5575444400_2_2_1.jpg', 0),
(2847, 197, 'data/san_pham/5575444400_2_4_1.jpg', 0),
(2848, 197, 'data/san_pham/5575444400_2_3_1.jpg', 0),
(2849, 198, 'data/san_pham/7215450406_1_1_1.jpg', 0),
(2850, 198, 'data/san_pham/7215450406_2_4_1.jpg', 0),
(2851, 198, 'data/san_pham/7215450406_2_1_1.jpg', 0),
(2852, 198, 'data/san_pham/7215450406_2_3_1.jpg', 0),
(2853, 198, 'data/san_pham/7215450406_2_2_1.jpg', 0),
(2854, 199, 'data/san_pham/5575444800_1_1_1.jpg', 0),
(2855, 199, 'data/san_pham/5575444800_2_3_1.jpg', 0),
(2856, 199, 'data/san_pham/5575444800_2_4_1.jpg', 0),
(2857, 199, 'data/san_pham/5575444800_2_1_1.jpg', 0),
(2858, 199, 'data/san_pham/5575444800_2_2_1.jpg', 0),
(2859, 200, 'data/san_pham/3951401407_1_1_1.jpg', 0),
(2860, 200, 'data/san_pham/3951401407_2_1_1.jpg', 0),
(2861, 200, 'data/san_pham/3951401407_2_2_1.jpg', 0),
(2862, 200, 'data/san_pham/3951401407_2_3_1.jpg', 0),
(2863, 200, 'data/san_pham/3951401407_2_5_1.jpg', 0),
(2864, 201, 'data/san_pham/37444557jf_12_d.jpg', 0),
(2865, 201, 'data/san_pham/37444557jf_12_f.jpg', 0),
(2866, 201, 'data/san_pham/37444557jf_12_r.jpg', 0),
(2867, 201, 'data/san_pham/37444557jf_12_e.jpg', 0),
(2868, 202, 'data/san_pham/37444557qp_12_d.jpg', 0),
(2869, 202, 'data/san_pham/37444557qp_12_e.jpg', 0),
(2870, 202, 'data/san_pham/37444557qp_12_f.jpg', 0),
(2871, 202, 'data/san_pham/37444557qp_12_r.jpg', 0),
(2904, 203, 'data/san_pham/37390306eo_12_f.jpg', 0),
(2903, 203, 'data/san_pham/37390306sg_12_f.jpg', 0),
(2902, 203, 'data/san_pham/37390306fe_12_f.jpg', 0),
(2901, 203, 'data/san_pham/37390306ba_12_f.jpg', 0),
(2900, 203, 'data/san_pham/37390306xl_12_f.jpg', 0),
(2877, 204, 'data/san_pham/37444602hm_12_f.jpg', 0),
(2878, 204, 'data/san_pham/37444602ip_12_f.jpg', 0),
(2879, 204, 'data/san_pham/37444602qf_12_f.jpg', 0),
(2880, 205, 'data/san_pham/37390307fv_12_f.jpg', 0),
(2881, 205, 'data/san_pham/37390307ob_12_f.jpg', 0),
(2882, 205, 'data/san_pham/37390307jh_12_f.jpg', 0),
(2883, 205, 'data/san_pham/37390307dx_12_f.jpg', 0),
(2884, 205, 'data/san_pham/37390307hx_12_f.jpg', 0),
(2908, 206, 'data/san_pham/37465287qf_12_f.jpg', 0),
(2907, 206, 'data/san_pham/37465287iw_12_f.jpg', 0),
(2906, 206, 'data/san_pham/37465287bb_12_f.jpg', 0),
(2905, 206, 'data/san_pham/37465287ah_12_f.jpg', 0),
(2889, 207, 'data/san_pham/37465358qv_12_e.jpg', 0),
(2890, 207, 'data/san_pham/37465358qv_12_f.jpg', 0),
(2891, 207, 'data/san_pham/37465358qv_12_f (1).jpg', 0),
(2892, 207, 'data/san_pham/37465358qv_12_r.jpg', 0),
(2893, 209, 'data/san_pham/5862421441_1_1_1.jpg', 0),
(2894, 209, 'data/san_pham/5862421441_2_4_1.jpg', 0),
(2895, 209, 'data/san_pham/5862421441_2_1_1.jpg', 0),
(2896, 209, 'data/san_pham/5862421441_2_3_1.jpg', 0),
(2897, 209, 'data/san_pham/5862421441_2_6_1.jpg', 0),
(2898, 209, 'data/san_pham/5862421441_2_5_1.jpg', 0),
(2899, 209, 'data/san_pham/5862421441_2_2_1.jpg', 0);

-- --------------------------------------------------------

--
-- Table structure for table `product_option`
--

CREATE TABLE IF NOT EXISTS `product_option` (
  `product_option_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `option_value` text NOT NULL,
  `required` tinyint(1) NOT NULL,
  PRIMARY KEY (`product_option_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=236 ;

-- --------------------------------------------------------

--
-- Table structure for table `product_option_value`
--

CREATE TABLE IF NOT EXISTS `product_option_value` (
  `product_option_value_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_option_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `option_value_id` int(11) NOT NULL,
  `quantity` int(3) NOT NULL,
  `subtract` tinyint(1) NOT NULL,
  `price` decimal(15,4) NOT NULL,
  `price_prefix` varchar(1) NOT NULL,
  `points` int(8) NOT NULL,
  `points_prefix` varchar(1) NOT NULL,
  `weight` decimal(15,8) NOT NULL,
  `weight_prefix` varchar(1) NOT NULL,
  PRIMARY KEY (`product_option_value_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=42 ;

-- --------------------------------------------------------

--
-- Table structure for table `product_related`
--

CREATE TABLE IF NOT EXISTS `product_related` (
  `product_id` int(11) NOT NULL,
  `related_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`related_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `product_reward`
--

CREATE TABLE IF NOT EXISTS `product_reward` (
  `product_reward_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL DEFAULT '0',
  `customer_group_id` int(11) NOT NULL DEFAULT '0',
  `points` int(8) NOT NULL DEFAULT '0',
  PRIMARY KEY (`product_reward_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=714 ;

--
-- Dumping data for table `product_reward`
--

INSERT INTO `product_reward` (`product_reward_id`, `product_id`, `customer_group_id`, `points`) VALUES
(655, 159, 1, 0),
(653, 158, 1, 0),
(662, 169, 1, 0),
(659, 163, 1, 0),
(654, 154, 1, 0),
(658, 162, 1, 0),
(660, 168, 1, 0),
(650, 155, 1, 0),
(656, 160, 1, 0),
(651, 156, 1, 0),
(649, 153, 1, 0),
(666, 170, 1, 0),
(652, 157, 1, 0),
(657, 161, 1, 0),
(672, 173, 1, 0),
(674, 174, 1, 0),
(677, 175, 1, 0),
(678, 176, 1, 0),
(679, 177, 1, 0),
(680, 178, 1, 0),
(682, 179, 1, 0),
(685, 182, 1, 0),
(686, 183, 1, 0),
(687, 184, 1, 0),
(688, 185, 1, 0),
(689, 186, 1, 0),
(690, 187, 1, 0),
(691, 188, 1, 0),
(692, 189, 1, 0),
(693, 190, 1, 0),
(694, 191, 1, 0),
(695, 192, 1, 0),
(696, 193, 1, 0),
(697, 194, 1, 0),
(698, 195, 1, 0),
(699, 196, 1, 0),
(700, 197, 1, 0),
(701, 198, 1, 0),
(702, 199, 1, 0),
(703, 200, 1, 0),
(704, 201, 1, 0),
(705, 202, 1, 0),
(712, 203, 1, 0),
(707, 204, 1, 0),
(708, 205, 1, 0),
(713, 206, 1, 0),
(710, 207, 1, 0),
(711, 209, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `product_special`
--

CREATE TABLE IF NOT EXISTS `product_special` (
  `product_special_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  `priority` int(5) NOT NULL DEFAULT '1',
  `price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `date_start` date NOT NULL DEFAULT '0000-00-00',
  `date_end` date NOT NULL DEFAULT '0000-00-00',
  PRIMARY KEY (`product_special_id`),
  KEY `product_id` (`product_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=473 ;

-- --------------------------------------------------------

--
-- Table structure for table `product_to_category`
--

CREATE TABLE IF NOT EXISTS `product_to_category` (
  `product_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`category_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `product_to_category`
--

INSERT INTO `product_to_category` (`product_id`, `category_id`) VALUES
(153, 33),
(153, 70),
(154, 33),
(154, 69),
(155, 69),
(156, 69),
(157, 69),
(158, 69),
(159, 33),
(159, 69),
(160, 33),
(160, 69),
(161, 33),
(161, 69),
(162, 33),
(162, 69),
(163, 33),
(163, 69),
(168, 25),
(168, 92),
(169, 25),
(169, 92),
(170, 25),
(170, 92),
(173, 33),
(173, 69),
(174, 33),
(174, 69),
(175, 33),
(175, 69),
(176, 33),
(176, 69),
(177, 33),
(177, 69),
(178, 33),
(178, 69),
(182, 33),
(182, 71),
(183, 33),
(183, 71),
(184, 33),
(184, 71),
(185, 33),
(185, 71),
(186, 33),
(186, 71),
(187, 33),
(187, 71),
(188, 33),
(188, 71),
(189, 33),
(189, 71),
(190, 33),
(190, 71),
(191, 33),
(191, 71),
(192, 33),
(192, 71),
(193, 33),
(193, 71),
(194, 33),
(194, 71),
(195, 33),
(195, 71),
(196, 33),
(196, 71),
(197, 33),
(197, 71),
(198, 33),
(198, 71),
(199, 33),
(199, 71),
(200, 33),
(200, 71),
(201, 33),
(201, 61),
(202, 33),
(202, 61),
(203, 33),
(203, 61),
(204, 33),
(204, 61),
(205, 33),
(205, 61),
(206, 33),
(206, 61),
(207, 33),
(207, 61),
(209, 33),
(209, 70);

-- --------------------------------------------------------

--
-- Table structure for table `product_to_download`
--

CREATE TABLE IF NOT EXISTS `product_to_download` (
  `product_id` int(11) NOT NULL,
  `download_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`download_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `product_to_layout`
--

CREATE TABLE IF NOT EXISTS `product_to_layout` (
  `product_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `product_to_store`
--

CREATE TABLE IF NOT EXISTS `product_to_store` (
  `product_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`product_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `product_to_store`
--

INSERT INTO `product_to_store` (`product_id`, `store_id`) VALUES
(62, 0),
(153, 0),
(154, 0),
(155, 0),
(156, 0),
(157, 0),
(158, 0),
(159, 0),
(160, 0),
(161, 0),
(162, 0),
(163, 0),
(168, 0),
(169, 0),
(170, 0),
(173, 0),
(174, 0),
(175, 0),
(176, 0),
(177, 0),
(178, 0),
(179, 0),
(182, 0),
(183, 0),
(184, 0),
(185, 0),
(186, 0),
(187, 0),
(188, 0),
(189, 0),
(190, 0),
(191, 0),
(192, 0),
(193, 0),
(194, 0),
(195, 0),
(196, 0),
(197, 0),
(198, 0),
(199, 0),
(200, 0),
(201, 0),
(202, 0),
(203, 0),
(204, 0),
(205, 0),
(206, 0),
(207, 0),
(209, 0);

-- --------------------------------------------------------

--
-- Table structure for table `return`
--

CREATE TABLE IF NOT EXISTS `return` (
  `return_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `product` varchar(255) NOT NULL,
  `model` varchar(64) NOT NULL,
  `quantity` int(4) NOT NULL,
  `opened` tinyint(1) NOT NULL,
  `return_reason_id` int(11) NOT NULL,
  `return_action_id` int(11) NOT NULL,
  `return_status_id` int(11) NOT NULL,
  `comment` text,
  `date_ordered` date NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`return_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `return_action`
--

CREATE TABLE IF NOT EXISTS `return_action` (
  `return_action_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`return_action_id`,`language_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `return_action`
--

INSERT INTO `return_action` (`return_action_id`, `language_id`, `name`) VALUES
(1, 2, 'Refunded'),
(2, 2, 'Credit Issued'),
(3, 2, 'Replacement Sent');

-- --------------------------------------------------------

--
-- Table structure for table `return_history`
--

CREATE TABLE IF NOT EXISTS `return_history` (
  `return_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `return_id` int(11) NOT NULL,
  `return_status_id` int(11) NOT NULL,
  `notify` tinyint(1) NOT NULL,
  `comment` text NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`return_history_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `return_reason`
--

CREATE TABLE IF NOT EXISTS `return_reason` (
  `return_reason_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`return_reason_id`,`language_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `return_reason`
--

INSERT INTO `return_reason` (`return_reason_id`, `language_id`, `name`) VALUES
(1, 2, 'Dead On Arrival'),
(2, 2, 'Received Wrong Item'),
(3, 2, 'Order Error'),
(4, 2, 'Faulty, please supply details'),
(5, 2, 'Other, please supply details');

-- --------------------------------------------------------

--
-- Table structure for table `return_status`
--

CREATE TABLE IF NOT EXISTS `return_status` (
  `return_status_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(32) NOT NULL,
  PRIMARY KEY (`return_status_id`,`language_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `return_status`
--

INSERT INTO `return_status` (`return_status_id`, `language_id`, `name`) VALUES
(1, 2, 'Pending'),
(3, 2, 'Complete'),
(2, 2, 'Awaiting Products');

-- --------------------------------------------------------

--
-- Table structure for table `review`
--

CREATE TABLE IF NOT EXISTS `review` (
  `review_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `author` varchar(64) NOT NULL,
  `text` text NOT NULL,
  `rating` int(1) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`review_id`),
  KEY `product_id` (`product_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- Table structure for table `setting`
--

CREATE TABLE IF NOT EXISTS `setting` (
  `setting_id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) NOT NULL DEFAULT '0',
  `group` varchar(32) NOT NULL,
  `key` varchar(64) NOT NULL,
  `value` text NOT NULL,
  `serialized` tinyint(1) NOT NULL,
  PRIMARY KEY (`setting_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4999 ;

--
-- Dumping data for table `setting`
--

INSERT INTO `setting` (`setting_id`, `store_id`, `group`, `key`, `value`, `serialized`) VALUES
(1, 0, 'shipping', 'shipping_sort_order', '3', 0),
(2, 0, 'sub_total', 'sub_total_sort_order', '1', 0),
(3, 0, 'sub_total', 'sub_total_status', '1', 0),
(4, 0, 'tax', 'tax_status', '1', 0),
(5, 0, 'total', 'total_sort_order', '9', 0),
(6, 0, 'total', 'total_status', '1', 0),
(7, 0, 'tax', 'tax_sort_order', '5', 0),
(4045, 0, 'free_checkout', 'free_checkout_sort_order', '2', 0),
(4040, 0, 'cod', 'cod_geo_zone_id', '0', 0),
(4039, 0, 'cod', 'cod_order_status_id', '1', 0),
(4038, 0, 'cod', 'cod_total', '0.01', 0),
(14, 0, 'shipping', 'shipping_status', '1', 0),
(15, 0, 'shipping', 'shipping_estimator', '1', 0),
(27, 0, 'coupon', 'coupon_sort_order', '4', 0),
(28, 0, 'coupon', 'coupon_status', '1', 0),
(34, 0, 'flat', 'flat_sort_order', '1', 0),
(35, 0, 'flat', 'flat_status', '1', 0),
(36, 0, 'flat', 'flat_geo_zone_id', '0', 0),
(37, 0, 'flat', 'flat_tax_class_id', '9', 0),
(341, 0, 'featured', 'product', '', 0),
(342, 0, 'featured', 'featured_product', '43,40,42,49,46,47,28', 0),
(41, 0, 'flat', 'flat_cost', '5.00', 0),
(42, 0, 'credit', 'credit_sort_order', '7', 0),
(43, 0, 'credit', 'credit_status', '1', 0),
(53, 0, 'reward', 'reward_sort_order', '2', 0),
(54, 0, 'reward', 'reward_status', '1', 0),
(4388, 0, 'category', 'category_module', 'a:2:{i:0;a:4:{s:9:"layout_id";s:1:"3";s:8:"position";s:11:"column_left";s:6:"status";s:1:"1";s:10:"sort_order";s:1:"1";}i:1;a:4:{s:9:"layout_id";s:2:"13";s:8:"position";s:12:"column_right";s:6:"status";s:1:"1";s:10:"sort_order";s:1:"1";}}', 1),
(4429, 0, 'account', 'account_module', 'a:1:{i:0;a:4:{s:9:"layout_id";s:1:"6";s:8:"position";s:12:"column_right";s:6:"status";s:1:"1";s:10:"sort_order";s:1:"1";}}', 1),
(94, 0, 'voucher', 'voucher_sort_order', '8', 0),
(95, 0, 'voucher', 'voucher_status', '1', 0),
(4044, 0, 'free_checkout', 'free_checkout_status', '1', 0),
(4043, 0, 'free_checkout', 'free_checkout_order_status_id', '1', 0),
(4992, 0, 'config', 'config_google_analytics', '', 0),
(4991, 0, 'config', 'config_error_filename', 'error.txt', 0),
(4980, 0, 'config', 'config_shared', '0', 0),
(4981, 0, 'config', 'config_robots', 'abot\r\ndbot\r\nebot\r\nhbot\r\nkbot\r\nlbot\r\nmbot\r\nnbot\r\nobot\r\npbot\r\nrbot\r\nsbot\r\ntbot\r\nvbot\r\nybot\r\nzbot\r\nbot.\r\nbot/\r\n_bot\r\n.bot\r\n/bot\r\n-bot\r\n:bot\r\n(bot\r\ncrawl\r\nslurp\r\nspider\r\nseek\r\naccoona\r\nacoon\r\nadressendeutschland\r\nah-ha.com\r\nahoy\r\naltavista\r\nananzi\r\nanthill\r\nappie\r\narachnophilia\r\narale\r\naraneo\r\naranha\r\narchitext\r\naretha\r\narks\r\nasterias\r\natlocal\r\natn\r\natomz\r\naugurfind\r\nbackrub\r\nbannana_bot\r\nbaypup\r\nbdfetch\r\nbig brother\r\nbiglotron\r\nbjaaland\r\nblackwidow\r\nblaiz\r\nblog\r\nblo.\r\nbloodhound\r\nboitho\r\nbooch\r\nbradley\r\nbutterfly\r\ncalif\r\ncassandra\r\nccubee\r\ncfetch\r\ncharlotte\r\nchurl\r\ncienciaficcion\r\ncmc\r\ncollective\r\ncomagent\r\ncombine\r\ncomputingsite\r\ncsci\r\ncurl\r\ncusco\r\ndaumoa\r\ndeepindex\r\ndelorie\r\ndepspid\r\ndeweb\r\ndie blinde kuh\r\ndigger\r\nditto\r\ndmoz\r\ndocomo\r\ndownload express\r\ndtaagent\r\ndwcp\r\nebiness\r\nebingbong\r\ne-collector\r\nejupiter\r\nemacs-w3 search engine\r\nesther\r\nevliya celebi\r\nezresult\r\nfalcon\r\nfelix ide\r\nferret\r\nfetchrover\r\nfido\r\nfindlinks\r\nfireball\r\nfish search\r\nfouineur\r\nfunnelweb\r\ngazz\r\ngcreep\r\ngenieknows\r\ngetterroboplus\r\ngeturl\r\nglx\r\ngoforit\r\ngolem\r\ngrabber\r\ngrapnel\r\ngralon\r\ngriffon\r\ngromit\r\ngrub\r\ngulliver\r\nhamahakki\r\nharvest\r\nhavindex\r\nhelix\r\nheritrix\r\nhku www octopus\r\nhomerweb\r\nhtdig\r\nhtml index\r\nhtml_analyzer\r\nhtmlgobble\r\nhubater\r\nhyper-decontextualizer\r\nia_archiver\r\nibm_planetwide\r\nichiro\r\niconsurf\r\niltrovatore\r\nimage.kapsi.net\r\nimagelock\r\nincywincy\r\nindexer\r\ninfobee\r\ninformant\r\ningrid\r\ninktomisearch.com\r\ninspector web\r\nintelliagent\r\ninternet shinchakubin\r\nip3000\r\niron33\r\nisraeli-search\r\nivia\r\njack\r\njakarta\r\njavabee\r\njetbot\r\njumpstation\r\nkatipo\r\nkdd-explorer\r\nkilroy\r\nknowledge\r\nkototoi\r\nkretrieve\r\nlabelgrabber\r\nlachesis\r\nlarbin\r\nlegs\r\nlibwww\r\nlinkalarm\r\nlink validator\r\nlinkscan\r\nlockon\r\nlwp\r\nlycos\r\nmagpie\r\nmantraagent\r\nmapoftheinternet\r\nmarvin/\r\nmattie\r\nmediafox\r\nmediapartners\r\nmercator\r\nmerzscope\r\nmicrosoft url control\r\nminirank\r\nmiva\r\nmj12\r\nmnogosearch\r\nmoget\r\nmonster\r\nmoose\r\nmotor\r\nmultitext\r\nmuncher\r\nmuscatferret\r\nmwd.search\r\nmyweb\r\nnajdi\r\nnameprotect\r\nnationaldirectory\r\nnazilla\r\nncsa beta\r\nnec-meshexplorer\r\nnederland.zoek\r\nnetcarta webmap engine\r\nnetmechanic\r\nnetresearchserver\r\nnetscoop\r\nnewscan-online\r\nnhse\r\nnokia6682/\r\nnomad\r\nnoyona\r\nnutch\r\nnzexplorer\r\nobjectssearch\r\noccam\r\nomni\r\nopen text\r\nopenfind\r\nopenintelligencedata\r\norb search\r\nosis-project\r\npack rat\r\npageboy\r\npagebull\r\npage_verifier\r\npanscient\r\nparasite\r\npartnersite\r\npatric\r\npear.\r\npegasus\r\nperegrinator\r\npgp key agent\r\nphantom\r\nphpdig\r\npicosearch\r\npiltdownman\r\npimptrain\r\npinpoint\r\npioneer\r\npiranha\r\nplumtreewebaccessor\r\npogodak\r\npoirot\r\npompos\r\npoppelsdorf\r\npoppi\r\npopular iconoclast\r\npsycheclone\r\npublisher\r\npython\r\nrambler\r\nraven search\r\nroach\r\nroad runner\r\nroadhouse\r\nrobbie\r\nrobofox\r\nrobozilla\r\nrules\r\nsalty\r\nsbider\r\nscooter\r\nscoutjet\r\nscrubby\r\nsearch.\r\nsearchprocess\r\nsemanticdiscovery\r\nsenrigan\r\nsg-scout\r\nshai''hulud\r\nshark\r\nshopwiki\r\nsidewinder\r\nsift\r\nsilk\r\nsimmany\r\nsite searcher\r\nsite valet\r\nsitetech-rover\r\nskymob.com\r\nsleek\r\nsmartwit\r\nsna-\r\nsnappy\r\nsnooper\r\nsohu\r\nspeedfind\r\nsphere\r\nsphider\r\nspinner\r\nspyder\r\nsteeler/\r\nsuke\r\nsuntek\r\nsupersnooper\r\nsurfnomore\r\nsven\r\nsygol\r\nszukacz\r\ntach black widow\r\ntarantula\r\ntempleton\r\n/teoma\r\nt-h-u-n-d-e-r-s-t-o-n-e\r\ntheophrastus\r\ntitan\r\ntitin\r\ntkwww\r\ntoutatis\r\nt-rex\r\ntutorgig\r\ntwiceler\r\ntwisted\r\nucsd\r\nudmsearch\r\nurl check\r\nupdated\r\nvagabondo\r\nvalkyrie\r\nverticrawl\r\nvictoria\r\nvision-search\r\nvolcano\r\nvoyager/\r\nvoyager-hc\r\nw3c_validator\r\nw3m2\r\nw3mir\r\nwalker\r\nwallpaper\r\nwanderer\r\nwauuu\r\nwavefire\r\nweb core\r\nweb hopper\r\nweb wombat\r\nwebbandit\r\nwebcatcher\r\nwebcopy\r\nwebfoot\r\nweblayers\r\nweblinker\r\nweblog monitor\r\nwebmirror\r\nwebmonkey\r\nwebquest\r\nwebreaper\r\nwebsitepulse\r\nwebsnarf\r\nwebstolperer\r\nwebvac\r\nwebwalk\r\nwebwatch\r\nwebwombat\r\nwebzinger\r\nwhizbang\r\nwhowhere\r\nwild ferret\r\nworldlight\r\nwwwc\r\nwwwster\r\nxenu\r\nxget\r\nxift\r\nxirq\r\nyandex\r\nyanga\r\nyeti\r\nyodao\r\nzao\r\nzippp\r\nzyborg', 0),
(4986, 0, 'config', 'config_password', '1', 0),
(4987, 0, 'config', 'config_encryption', '7f339d82bc9ee711ed084c4a101fbb25', 0),
(4988, 0, 'config', 'config_compression', '0', 0),
(4989, 0, 'config', 'config_error_display', '0', 0),
(4990, 0, 'config', 'config_error_log', '1', 0),
(4425, 0, 'slideshow', 'slideshow_module', 'a:2:{i:0;a:7:{s:9:"banner_id";s:1:"8";s:5:"width";s:3:"759";s:6:"height";s:3:"380";s:9:"layout_id";s:2:"12";s:8:"position";s:11:"content_top";s:6:"status";s:1:"1";s:10:"sort_order";s:1:"2";}i:1;a:7:{s:9:"banner_id";s:1:"7";s:5:"width";s:3:"996";s:6:"height";s:3:"481";s:9:"layout_id";s:1:"1";s:8:"position";s:11:"content_top";s:6:"status";s:1:"1";s:10:"sort_order";s:1:"1";}}', 1),
(4782, 0, 'viewed', 'viewed_module', 'a:1:{i:0;a:6:{s:11:"image_width";s:3:"400";s:12:"image_height";s:3:"600";s:9:"layout_id";s:1:"2";s:8:"position";s:14:"content_bottom";s:6:"status";s:1:"1";s:10:"sort_order";s:1:"1";}}', 1),
(4984, 0, 'config', 'config_file_mime_allowed', 'text/plain\r\nimage/png\r\nimage/jpeg\r\nimage/jpeg\r\nimage/jpeg\r\nimage/gif\r\nimage/bmp\r\nimage/vnd.microsoft.icon\r\nimage/tiff\r\nimage/tiff\r\nimage/svg+xml\r\nimage/svg+xml\r\napplication/zip\r\napplication/x-rar-compressed\r\napplication/x-msdownload\r\napplication/vnd.ms-cab-compressed\r\naudio/mpeg\r\nvideo/quicktime\r\nvideo/quicktime\r\napplication/pdf\r\nimage/vnd.adobe.photoshop\r\napplication/postscript\r\napplication/postscript\r\napplication/postscript\r\napplication/msword\r\napplication/rtf\r\napplication/vnd.ms-excel\r\napplication/vnd.ms-powerpoint\r\napplication/vnd.oasis.opendocument.text\r\napplication/vnd.oasis.opendocument.spreadsheet', 0),
(4982, 0, 'config', 'config_seo_url', '1', 0),
(4983, 0, 'config', 'config_file_extension_allowed', 'txt\r\npng\r\njpe\r\njpeg\r\njpg\r\ngif\r\nbmp\r\nico\r\ntiff\r\ntif\r\nsvg\r\nsvgz\r\nzip\r\nrar\r\nmsi\r\ncab\r\nmp3\r\nqt\r\nmov\r\npdf\r\npsd\r\nai\r\neps\r\nps\r\ndoc\r\nrtf\r\nxls\r\nppt\r\nodt\r\nods', 0),
(4979, 0, 'config', 'config_secure', '0', 0),
(4978, 0, 'config', 'config_fraud_status_id', '1', 0),
(4977, 0, 'config', 'config_fraud_score', '', 0),
(4976, 0, 'config', 'config_fraud_key', '', 0),
(4975, 0, 'config', 'config_fraud_detection', '0', 0),
(4974, 0, 'config', 'config_alert_emails', '', 0),
(4973, 0, 'config', 'config_account_mail', '0', 0),
(4972, 0, 'config', 'config_alert_mail', '0', 0),
(4971, 0, 'config', 'config_smtp_timeout', '5', 0),
(4395, 0, 'manufacturersdropdown', 'manufacturersdropdown_module', 'a:1:{i:0;a:4:{s:9:"layout_id";s:1:"3";s:8:"position";s:11:"column_left";s:6:"status";s:1:"1";s:10:"sort_order";s:1:"2";}}', 1),
(4394, 0, 'filteroption', 'filteroption_module', 'a:1:{i:0;a:4:{s:9:"layout_id";s:1:"3";s:8:"position";s:11:"column_left";s:6:"status";s:1:"1";s:10:"sort_order";s:1:"3";}}', 1),
(4970, 0, 'config', 'config_smtp_port', '25', 0),
(4969, 0, 'config', 'config_smtp_password', '', 0),
(4968, 0, 'config', 'config_smtp_username', '', 0),
(4967, 0, 'config', 'config_smtp_host', '', 0),
(4966, 0, 'config', 'config_mail_parameter', '', 0),
(4965, 0, 'config', 'config_mail_protocol', 'mail', 0),
(4964, 0, 'config', 'config_ftp_status', '0', 0),
(4963, 0, 'config', 'config_ftp_root', '', 0),
(4962, 0, 'config', 'config_ftp_password', '', 0),
(4961, 0, 'config', 'config_ftp_username', '', 0),
(4959, 0, 'config', 'config_ftp_host', 'localhost', 0),
(4960, 0, 'config', 'config_ftp_port', '21', 0),
(4958, 0, 'config', 'config_image_cart_height', '100', 0),
(4955, 0, 'config', 'config_image_wishlist_width', '47', 0),
(4957, 0, 'config', 'config_image_cart_width', '120', 0),
(4956, 0, 'config', 'config_image_wishlist_height', '47', 0),
(4954, 0, 'config', 'config_image_compare_height', '90', 0),
(4953, 0, 'config', 'config_image_compare_width', '90', 0),
(4952, 0, 'config', 'config_image_related_height', '640', 0),
(4951, 0, 'config', 'config_image_related_width', '400', 0),
(4950, 0, 'config', 'config_image_additional_height', '150', 0),
(4949, 0, 'config', 'config_image_additional_width', '150', 0),
(4948, 0, 'config', 'config_image_product_height', '640', 0),
(4946, 0, 'config', 'config_image_popup_height', '600', 0),
(4947, 0, 'config', 'config_image_product_width', '400', 0),
(4945, 0, 'config', 'config_image_popup_width', '400', 0),
(4942, 0, 'config', 'config_image_news_height', '341', 0),
(4944, 0, 'config', 'config_image_thumb_height', '228', 0),
(4943, 0, 'config', 'config_image_thumb_width', '228', 0),
(4941, 0, 'config', 'config_image_news_width', '242', 0),
(4940, 0, 'config', 'config_image_category_height', '80', 0),
(4939, 0, 'config', 'config_image_category_width', '80', 0),
(4938, 0, 'config', 'config_icon', 'data/cart.png', 0),
(4937, 0, 'config', 'config_logo', 'data/wesale.jpg', 0),
(4936, 0, 'config', 'config_return_status_id', '2', 0),
(4935, 0, 'config', 'config_return_id', '0', 0),
(4934, 0, 'config', 'config_commission', '5', 0),
(4933, 0, 'config', 'config_affiliate_id', '4', 0),
(4931, 0, 'config', 'config_stock_checkout', '0', 0),
(4932, 0, 'config', 'config_stock_status_id', '7', 0),
(4930, 0, 'config', 'config_stock_warning', '0', 0),
(4929, 0, 'config', 'config_stock_display', '0', 0),
(4928, 0, 'config', 'config_complete_status_id', '1', 0),
(4926, 0, 'config', 'config_invoice_prefix', 'INV-2013-00', 0),
(4927, 0, 'config', 'config_order_status_id', '1', 0),
(4925, 0, 'config', 'config_order_edit', '100', 0),
(4924, 0, 'config', 'config_checkout_id', '3', 0),
(4032, 0, 'bank_transfer', 'bank_transfer_bank_2', 'Thông tin ngân hàng', 0),
(4033, 0, 'bank_transfer', 'bank_transfer_total', '', 0),
(4034, 0, 'bank_transfer', 'bank_transfer_order_status_id', '1', 0),
(4035, 0, 'bank_transfer', 'bank_transfer_geo_zone_id', '0', 0),
(4036, 0, 'bank_transfer', 'bank_transfer_status', '1', 0),
(4037, 0, 'bank_transfer', 'bank_transfer_sort_order', '3', 0),
(4041, 0, 'cod', 'cod_status', '1', 0),
(4042, 0, 'cod', 'cod_sort_order', '1', 0),
(4781, 0, 'viewed', 'show_on_product', '1', 0),
(4780, 0, 'viewed', 'viewed_count', '10', 0),
(4985, 0, 'config', 'config_maintenance', '0', 0),
(4923, 0, 'config', 'config_guest_checkout', '1', 0),
(4922, 0, 'config', 'config_cart_weight', '1', 0),
(4921, 0, 'config', 'config_account_id', '5', 0),
(4920, 0, 'config', 'config_customer_price', '0', 0),
(4919, 0, 'config', 'config_customer_group_display', 'a:1:{i:0;s:1:"1";}', 1),
(4918, 0, 'config', 'config_customer_group_id', '1', 0),
(4917, 0, 'config', 'config_customer_online', '0', 0),
(4916, 0, 'config', 'config_tax_customer', 'shipping', 0),
(4915, 0, 'config', 'config_tax_default', 'shipping', 0),
(4914, 0, 'config', 'config_vat', '0', 0),
(4913, 0, 'config', 'config_tax', '0', 0),
(4912, 0, 'config', 'config_voucher_max', '1000', 0),
(4911, 0, 'config', 'config_voucher_min', '1', 0),
(4910, 0, 'config', 'config_download', '1', 0),
(4909, 0, 'config', 'config_review_status', '1', 0),
(4908, 0, 'config', 'config_product_count', '1', 0),
(4907, 0, 'config', 'config_admin_limit', '20', 0),
(4904, 0, 'config', 'config_length_class_id', '1', 0),
(4906, 0, 'config', 'config_catalog_limit', '8', 0),
(4905, 0, 'config', 'config_weight_class_id', '1', 0),
(4903, 0, 'config', 'config_currency_auto', '1', 0),
(4902, 0, 'config', 'config_currency', 'VND', 0),
(4901, 0, 'config', 'config_admin_language', 'vi', 0),
(4900, 0, 'config', 'config_language', 'vi', 0),
(4899, 0, 'config', 'config_zone_id', '3776', 0),
(4898, 0, 'config', 'config_country_id', '230', 0),
(4897, 0, 'config', 'config_layout_id', '4', 0),
(4896, 0, 'config', 'config_template', 'default', 0),
(4895, 0, 'config', 'config_meta_description', 'Weorder', 0),
(4894, 0, 'config', 'config_title', 'Đặt hàng quốc tế - Weorder', 0),
(4892, 0, 'config', 'config_telephone', '123456789', 0),
(4893, 0, 'config', 'config_fax', '', 0),
(4889, 0, 'config', 'config_owner', 'Đặt hàng quốc tế', 0),
(4891, 0, 'config', 'config_email', 'admin@admin.com', 0),
(4890, 0, 'config', 'config_address', 'Address 1', 0),
(4888, 0, 'config', 'config_name', 'Đặt hàng quốc tế', 0),
(4434, 0, 'banner', 'banner_module', 'a:4:{i:0;a:7:{s:9:"banner_id";s:2:"11";s:5:"width";s:3:"228";s:6:"height";s:3:"183";s:9:"layout_id";s:2:"12";s:8:"position";s:12:"column_right";s:6:"status";s:1:"1";s:10:"sort_order";s:1:"1";}i:1;a:7:{s:9:"banner_id";s:2:"12";s:5:"width";s:3:"228";s:6:"height";s:3:"183";s:9:"layout_id";s:2:"12";s:8:"position";s:12:"column_right";s:6:"status";s:1:"1";s:10:"sort_order";s:1:"2";}i:2;a:7:{s:9:"banner_id";s:2:"13";s:5:"width";s:3:"996";s:6:"height";s:2:"43";s:9:"layout_id";s:2:"12";s:8:"position";s:11:"content_top";s:6:"status";s:1:"0";s:10:"sort_order";s:1:"1";}i:3;a:7:{s:9:"banner_id";s:2:"13";s:5:"width";s:3:"996";s:6:"height";s:2:"43";s:9:"layout_id";s:1:"2";s:8:"position";s:11:"content_top";s:6:"status";s:1:"0";s:10:"sort_order";s:1:"1";}}', 1),
(4997, 0, 'google_talk', 'google_talk_code', '&lt;script type=&quot;text/javascript&quot;&gt;var subiz_account_id = &quot;1411&quot;;(function() { var sbz = document.createElement(&quot;script&quot;); sbz.type = &quot;text/javascript&quot;; sbz.async = true; sbz.src = (&quot;https:&quot; == document.location.protocol ? &quot;https://&quot; : &quot;http://&quot;) + &quot;widget.subiz.com/static/js/loader.js?v=&quot;+ (new Date()).getFullYear() + (&quot;0&quot; + ((new Date()).getMonth() + 1)).slice(-2) + (&quot;0&quot; + (new Date()).getDate()).slice(-2); var s = document.getElementsByTagName(&quot;script&quot;)[0]; s.parentNode.insertBefore(sbz, s);})();&lt;/script&gt;', 0),
(4998, 0, 'google_talk', 'google_talk_module', 'a:12:{i:0;a:4:{s:9:"layout_id";s:1:"1";s:8:"position";s:14:"content_bottom";s:6:"status";s:1:"1";s:10:"sort_order";s:2:"10";}i:1;a:4:{s:9:"layout_id";s:2:"10";s:8:"position";s:14:"content_bottom";s:6:"status";s:1:"1";s:10:"sort_order";s:0:"";}i:2;a:4:{s:9:"layout_id";s:1:"3";s:8:"position";s:14:"content_bottom";s:6:"status";s:1:"1";s:10:"sort_order";s:0:"";}i:3;a:4:{s:9:"layout_id";s:1:"7";s:8:"position";s:14:"content_bottom";s:6:"status";s:1:"1";s:10:"sort_order";s:0:"";}i:4;a:4:{s:9:"layout_id";s:1:"8";s:8:"position";s:14:"content_bottom";s:6:"status";s:1:"1";s:10:"sort_order";s:0:"";}i:5;a:4:{s:9:"layout_id";s:2:"12";s:8:"position";s:14:"content_bottom";s:6:"status";s:1:"1";s:10:"sort_order";s:0:"";}i:6;a:4:{s:9:"layout_id";s:1:"4";s:8:"position";s:11:"content_top";s:6:"status";s:1:"1";s:10:"sort_order";s:0:"";}i:7;a:4:{s:9:"layout_id";s:2:"11";s:8:"position";s:11:"content_top";s:6:"status";s:1:"1";s:10:"sort_order";s:0:"";}i:8;a:4:{s:9:"layout_id";s:1:"5";s:8:"position";s:11:"content_top";s:6:"status";s:1:"1";s:10:"sort_order";s:0:"";}i:9;a:4:{s:9:"layout_id";s:1:"2";s:8:"position";s:11:"content_top";s:6:"status";s:1:"1";s:10:"sort_order";s:0:"";}i:10;a:4:{s:9:"layout_id";s:1:"9";s:8:"position";s:11:"content_top";s:6:"status";s:1:"1";s:10:"sort_order";s:0:"";}i:11;a:4:{s:9:"layout_id";s:2:"13";s:8:"position";s:11:"content_top";s:6:"status";s:1:"1";s:10:"sort_order";s:0:"";}}', 1);

-- --------------------------------------------------------

--
-- Table structure for table `stock_status`
--

CREATE TABLE IF NOT EXISTS `stock_status` (
  `stock_status_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  PRIMARY KEY (`stock_status_id`,`language_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `stock_status`
--

INSERT INTO `stock_status` (`stock_status_id`, `language_id`, `name`) VALUES
(7, 2, 'In Stock'),
(8, 2, 'Pre-Order'),
(5, 2, 'Out Of Stock'),
(6, 2, '2 - 3 Days');

-- --------------------------------------------------------

--
-- Table structure for table `store`
--

CREATE TABLE IF NOT EXISTS `store` (
  `store_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `url` varchar(255) NOT NULL,
  `ssl` varchar(255) NOT NULL,
  PRIMARY KEY (`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tax_class`
--

CREATE TABLE IF NOT EXISTS `tax_class` (
  `tax_class_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(32) NOT NULL,
  `description` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`tax_class_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `tax_class`
--

INSERT INTO `tax_class` (`tax_class_id`, `title`, `description`, `date_added`, `date_modified`) VALUES
(9, 'Taxable Goods', 'Taxed Stuff', '2009-01-06 23:21:53', '2011-09-23 14:07:50'),
(10, 'Downloadable Products', 'Downloadable', '2011-09-21 22:19:39', '2011-09-22 10:27:36');

-- --------------------------------------------------------

--
-- Table structure for table `tax_rate`
--

CREATE TABLE IF NOT EXISTS `tax_rate` (
  `tax_rate_id` int(11) NOT NULL AUTO_INCREMENT,
  `geo_zone_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(32) NOT NULL,
  `rate` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `type` char(1) NOT NULL,
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`tax_rate_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=88 ;

--
-- Dumping data for table `tax_rate`
--

INSERT INTO `tax_rate` (`tax_rate_id`, `geo_zone_id`, `name`, `rate`, `type`, `date_added`, `date_modified`) VALUES
(86, 3, 'VAT (17.5%)', '17.5000', 'P', '2011-03-09 21:17:10', '2011-09-22 22:24:29'),
(87, 3, 'Eco Tax (-2.00)', '2.0000', 'F', '2011-09-21 21:49:23', '2011-09-23 00:40:19');

-- --------------------------------------------------------

--
-- Table structure for table `tax_rate_to_customer_group`
--

CREATE TABLE IF NOT EXISTS `tax_rate_to_customer_group` (
  `tax_rate_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  PRIMARY KEY (`tax_rate_id`,`customer_group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tax_rate_to_customer_group`
--

INSERT INTO `tax_rate_to_customer_group` (`tax_rate_id`, `customer_group_id`) VALUES
(86, 1),
(87, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tax_rule`
--

CREATE TABLE IF NOT EXISTS `tax_rule` (
  `tax_rule_id` int(11) NOT NULL AUTO_INCREMENT,
  `tax_class_id` int(11) NOT NULL,
  `tax_rate_id` int(11) NOT NULL,
  `based` varchar(10) NOT NULL,
  `priority` int(5) NOT NULL DEFAULT '1',
  PRIMARY KEY (`tax_rule_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=129 ;

--
-- Dumping data for table `tax_rule`
--

INSERT INTO `tax_rule` (`tax_rule_id`, `tax_class_id`, `tax_rate_id`, `based`, `priority`) VALUES
(121, 10, 86, 'payment', 1),
(120, 10, 87, 'store', 0),
(128, 9, 86, 'shipping', 1),
(127, 9, 87, 'shipping', 2);

-- --------------------------------------------------------

--
-- Table structure for table `url_alias`
--

CREATE TABLE IF NOT EXISTS `url_alias` (
  `url_alias_id` int(11) NOT NULL AUTO_INCREMENT,
  `query` varchar(255) NOT NULL,
  `keyword` varchar(255) NOT NULL,
  PRIMARY KEY (`url_alias_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1080 ;

--
-- Dumping data for table `url_alias`
--

INSERT INTO `url_alias` (`url_alias_id`, `query`, `keyword`) VALUES
(1014, 'category_id=25', 'nu'),
(1016, 'category_id=33', 'nam'),
(959, 'manufacturer_id=8', 'lascote'),
(1029, 'information_id=4', 'about_us'),
(898, 'category_id=79', 'tui-xach-nam'),
(780, 'category_id=59', 'tre-em'),
(974, 'product_id=153', 'Ao-khoac-da-zara'),
(1078, 'manufacturer_id=9', 'zara'),
(893, 'category_id=74', 'do-cong-so'),
(887, 'category_id=61', 'ao-phong-nam'),
(845, 'category_id=62', 'phu-kien'),
(802, 'category_id=63', 'quan'),
(807, 'category_id=65', 'phu-kien'),
(843, 'news_category_id=2', 'bao-chi-truyen-thong'),
(888, 'category_id=69', 'ao-so-mi'),
(889, 'category_id=70', 'ao-khoac-nam'),
(890, 'category_id=71', 'quan-bo-nam'),
(891, 'category_id=72', 'quan-short'),
(892, 'category_id=73', 'quan-vai'),
(894, 'category_id=75', 'do-boi'),
(895, 'category_id=76', 'do-lot-nam'),
(896, 'category_id=77', 'nuoc-hoa-nam'),
(897, 'category_id=78', 'Vi-da-nam'),
(954, 'manufacturer_id=16', 'hang-puma'),
(955, 'manufacturer_id=17', 'mr-porter'),
(856, 'manufacturer_id=10', 'nike'),
(857, 'manufacturer_id=7', 'louis-vuitton'),
(858, 'manufacturer_id=5', 'converse'),
(969, 'manufacturer_id=6', 'adidas'),
(860, 'manufacturer_id=11', 'tommy-hilfiger'),
(861, 'manufacturer_id=12', 'armani'),
(979, 'product_id=154', 'ao-so-mi-zara-Shi1'),
(980, 'product_id=159', 'ao-so-mi-zara-Shi6'),
(899, 'category_id=80', 'dong-ho-nam'),
(900, 'category_id=81', 'kinh-nam'),
(901, 'category_id=82', 'giay-nam'),
(902, 'category_id=83', 'that-lung-nam'),
(903, 'category_id=84', 'ca-vat-nam'),
(904, 'category_id=85', 'khan-nam'),
(905, 'category_id=86', 'vali-nam'),
(906, 'category_id=87', 'phu-kien-nam'),
(907, 'category_id=88', 'ao-kieu-nu'),
(908, 'category_id=89', 'ao-phong-nu'),
(909, 'category_id=90', 'ao-so-mi-nu'),
(910, 'category_id=91', 'Ao-khoac-nu'),
(911, 'category_id=92', 'vay-nu'),
(912, 'category_id=93', 'chan-vay-nu'),
(913, 'category_id=94', 'quan-vai-nu'),
(914, 'category_id=95', 'quan-bo-nu'),
(915, 'category_id=96', 'quan-short-nu'),
(916, 'category_id=97', 'do-cong-so-nu'),
(917, 'category_id=98', 'do-bau'),
(918, 'category_id=99', 'do-ngu'),
(919, 'category_id=100', 'bikini'),
(920, 'category_id=101', 'do-lot-nu'),
(921, 'category_id=102', 'nuoc-hoa-nu'),
(922, 'category_id=103', 'vi-nu'),
(923, 'category_id=104', 'tui-xach-nu'),
(924, 'category_id=105', 'dong-ho-nu'),
(925, 'category_id=106', 'mu-nu'),
(926, 'category_id=107', 'Kinh-nu'),
(933, 'category_id=108', 'giay-nu'),
(934, 'category_id=109', 'that-lung-nu'),
(929, 'category_id=110', 'nu-trang'),
(930, 'category_id=111', 'khan-nu'),
(931, 'category_id=112', 'vali-nu'),
(932, 'category_id=113', 'trang-suc-nu'),
(975, 'product_id=155', 'ao-so-mi-zara-Shi2'),
(976, 'product_id=156', 'ao-so-mi-zara-Shi3'),
(977, 'product_id=157', 'ao-so-mi-zara-Shi4'),
(978, 'product_id=158', 'ao-so-mi-zara-Shi5'),
(981, 'product_id=160', 'ao-so-mi-zara-Shi7'),
(983, 'product_id=162', 'ao-so-mi-zara-Shi8'),
(984, 'product_id=163', 'ao-so-mi-zara-Shi9'),
(957, 'news_id=13', 'puma-giam-gia-roi-.html'),
(963, 'news_id=14', 'mr-porter-giam-gia-toi-70-rat-nhieu-hang-sieu-dep.html'),
(958, 'news_id=15', 'lacoste-toan-bo-quan-ao-giay-dep-da-sale-toi-50-roi-cac-ban-nhe.html'),
(962, 'news_id=16', 'asos-sale-70-rieng-mat-hang-phu-kien-con-quan-ao-van-dang-giam-gia-manh-cac-ban-nhe.html'),
(1079, 'manufacturer_id=18', 'hang-asos'),
(964, 'news_id=17', 'abercrombie-and-fitch-hang-chuc-mau-jeans-sieu-hot-moi-ve.html'),
(965, 'news_id=18', 'top-man-g.html'),
(966, 'manufacturer_id=21', 'hãng G2000'),
(967, 'news_id=19', 'g2000-nhanh-tay-chon-cho-minh-mon-do-ung-y-nao-sale-50-toan-do-dep-cac-ban-nhe-^-^.html'),
(982, 'product_id=161', 'ao-so-mi-zara-Shi7a'),
(986, 'manufacturer_id=23', 'hãng-uni-qlo'),
(991, 'news_id=21', 'uni-qlo-xa-hang-dong-gia-9.9-usd---ut-tshirt-mua-ngay-mua-ngay-:d.html'),
(989, 'product_id=168', 'vay-nu-miss-selfridge-mis-sel1'),
(990, 'manufacturer_id=25', 'H&amp;M'),
(999, 'news_id=22', 'mango-giam-gia-tat-ca-cac-mat-hang-tu-50-70.html'),
(998, 'news_id=23', 'dorothy-perkin-giam-gia-vay-mua-he-chi-con-tu-16gbp-tro-len-giam-them-20-cho-do-sale.html'),
(996, 'manufacturer_id=26', 'hang-mango'),
(997, 'manufacturer_id=27', 'hang-dorothy-perkins'),
(1000, 'manufacturer_id=28', 'hang-super-dry'),
(1001, 'manufacturer_id=29', 'hang-nordstrom'),
(1002, 'news_id=24', 'super-dry-san-hang-nong-hom-nay.html'),
(1012, 'news_id=25', 'diesel-bo-suu-tap-thu-dong-2013-.html'),
(1006, 'manufacturer_id=30', 'hang-jcrew'),
(1008, 'news_category_id=1', 'tin-nong-hang-ngay'),
(1009, 'news_id=26', 'j.crew-dot-sale-cuoi-den-40-.html'),
(1010, 'news_id=27', 'burton-london-menswear-sale-off-den-50-.html'),
(1011, 'news_id=28', 'norstrom-top-kinh-ban-chay-nhat-shop-now.html'),
(1033, 'product_id=173', 'ao-so-mi-diesel-Die-Shi1'),
(1035, 'product_id=174', 'ao-so-mi-diesel-Die-Shi2'),
(1038, 'product_id=175', 'ao-so-mi-diesel-Die-Shi3'),
(1039, 'product_id=176', 'ao-so-mi-diesel-Die-Shi4'),
(1040, 'product_id=177', 'ao-so-mi-diesel-Die-Shi5'),
(1041, 'product_id=178', 'ao-so-mi-diesel-Die-Shi6'),
(1043, 'product_id=179', 'ao-so-mi-diesel-Die-Shi7'),
(1044, 'manufacturer_id=32', 'Hang-replay'),
(1046, 'product_id=182', 'quan-replay-Rep-Jea1'),
(1047, 'product_id=183', 'quan-replay-Rep-Jea2'),
(1048, 'product_id=184', 'quan-replay-Rep-Jea3'),
(1049, 'product_id=185', 'quan-replay-Rep-Jea4'),
(1050, 'product_id=186', 'quan-replay-Rep-Jea5'),
(1051, 'product_id=187', 'quan-replay-Rep-Jea6'),
(1052, 'product_id=188', 'quan-bo-zara-Zar-Jea1'),
(1053, 'product_id=189', 'quan-bo-zara-Zar-Jea2'),
(1054, 'product_id=190', 'quan-bo-zara-Zar-Jea3'),
(1055, 'product_id=191', 'quan-bo-zara-Zar-Jea4'),
(1056, 'product_id=192', 'quan-bo-zara-Zar-Jea5'),
(1057, 'product_id=193', 'quan-bo-zara-Zar-Jea6'),
(1058, 'product_id=194', 'quan-bo-zara-Zar-Jea7'),
(1059, 'product_id=195', 'quan-bo-zara-Zar-Jea8'),
(1060, 'product_id=196', 'quan-bo-zara-Zar-Jea9'),
(1061, 'product_id=197', 'quan-bo-zara-Zar-Jea10'),
(1062, 'product_id=198', 'quan-bo-zara-Zar-Jea11'),
(1063, 'product_id=199', 'quan-bo-zara-Zar-Jea12'),
(1064, 'product_id=200', 'quan-bo-zara-Zar-Jea13'),
(1065, 'product_id=201', 'ao-polo-diesel-Die-pol1'),
(1066, 'product_id=202', 'ao-polo-diesel-Die-pol2'),
(1076, 'product_id=203', 'ao-polo-diesel-Die-pol3'),
(1068, 'product_id=204', 'ao-polo-diesel-Die-pol4'),
(1069, 'product_id=205', 'ao-polo-diesel-Die-pol5'),
(1077, 'product_id=206', 'ao-polo-diesel-Die-pol6'),
(1071, 'product_id=207', 'ao-phong-diesel-Die-Tsh1'),
(1072, 'product_id=209', 'ao-khoac-zara-Zar-Jac3'),
(1075, 'news_id=29', 'cavin-klein-sale-off-den-75-mat-hang-lua-la-va-vay-voc-cho-chi-em-mua-ngay.html'),
(1074, 'manufacturer_id=33', 'hang-calvin-klein');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_group_id` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(40) NOT NULL,
  `salt` varchar(9) NOT NULL,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `code` varchar(40) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `user_group_id`, `username`, `password`, `salt`, `firstname`, `lastname`, `email`, `code`, `ip`, `status`, `date_added`) VALUES
(1, 1, 'admin', 'eb3b619f4e511cdecae9a01f958f9322a445eeb6', '16c32b3ef', '', '', 'admin@admin.com', '', '123.24.1.57', 1, '2013-05-16 23:52:20');

-- --------------------------------------------------------

--
-- Table structure for table `user_group`
--

CREATE TABLE IF NOT EXISTS `user_group` (
  `user_group_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `permission` text NOT NULL,
  PRIMARY KEY (`user_group_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `user_group`
--

INSERT INTO `user_group` (`user_group_id`, `name`, `permission`) VALUES
(1, 'Top Administrator', 'a:2:{s:6:"access";a:144:{i:0;s:17:"catalog/attribute";i:1;s:23:"catalog/attribute_group";i:2;s:16:"catalog/category";i:3;s:16:"catalog/download";i:4;s:14:"catalog/filter";i:5;s:19:"catalog/information";i:6;s:20:"catalog/manufacturer";i:7;s:15:"catalog/message";i:8;s:12:"catalog/news";i:9;s:21:"catalog/news_category";i:10;s:20:"catalog/news_comment";i:11;s:14:"catalog/option";i:12;s:15:"catalog/product";i:13;s:14:"catalog/review";i:14;s:18:"common/filemanager";i:15;s:13:"design/banner";i:16;s:19:"design/custom_field";i:17;s:13:"design/layout";i:18;s:14:"extension/feed";i:19;s:17:"extension/manager";i:20;s:16:"extension/module";i:21;s:17:"extension/payment";i:22;s:18:"extension/shipping";i:23;s:15:"extension/total";i:24;s:16:"feed/google_base";i:25;s:19:"feed/google_sitemap";i:26;s:20:"localisation/country";i:27;s:21:"localisation/currency";i:28;s:21:"localisation/geo_zone";i:29;s:21:"localisation/language";i:30;s:25:"localisation/length_class";i:31;s:25:"localisation/order_status";i:32;s:26:"localisation/return_action";i:33;s:26:"localisation/return_reason";i:34;s:26:"localisation/return_status";i:35;s:25:"localisation/stock_status";i:36;s:22:"localisation/tax_class";i:37;s:21:"localisation/tax_rate";i:38;s:25:"localisation/weight_class";i:39;s:17:"localisation/zone";i:40;s:14:"module/account";i:41;s:16:"module/affiliate";i:42;s:13:"module/banner";i:43;s:17:"module/bestseller";i:44;s:15:"module/carousel";i:45;s:15:"module/category";i:46;s:15:"module/featured";i:47;s:13:"module/filter";i:48;s:19:"module/filteroption";i:49;s:18:"module/google_talk";i:50;s:18:"module/information";i:51;s:13:"module/latest";i:52;s:28:"module/manufacturersdropdown";i:53;s:20:"module/news_category";i:54;s:19:"module/newsfeatured";i:55;s:17:"module/newslatest";i:56;s:16:"module/slideshow";i:57;s:14:"module/special";i:58;s:12:"module/store";i:59;s:18:"module/tnt_newscat";i:60;s:13:"module/viewed";i:61;s:20:"module/vqmod_manager";i:62;s:14:"module/welcome";i:63;s:24:"payment/authorizenet_aim";i:64;s:21:"payment/bank_transfer";i:65;s:14:"payment/cheque";i:66;s:11:"payment/cod";i:67;s:21:"payment/free_checkout";i:68;s:22:"payment/klarna_account";i:69;s:22:"payment/klarna_invoice";i:70;s:14:"payment/liqpay";i:71;s:20:"payment/moneybookers";i:72;s:14:"payment/nochex";i:73;s:15:"payment/paymate";i:74;s:16:"payment/paypoint";i:75;s:13:"payment/payza";i:76;s:26:"payment/perpetual_payments";i:77;s:14:"payment/pp_pro";i:78;s:17:"payment/pp_pro_uk";i:79;s:19:"payment/pp_standard";i:80;s:15:"payment/sagepay";i:81;s:22:"payment/sagepay_direct";i:82;s:18:"payment/sagepay_us";i:83;s:19:"payment/twocheckout";i:84;s:28:"payment/web_payment_software";i:85;s:16:"payment/worldpay";i:86;s:27:"report/affiliate_commission";i:87;s:22:"report/customer_credit";i:88;s:22:"report/customer_online";i:89;s:21:"report/customer_order";i:90;s:22:"report/customer_reward";i:91;s:24:"report/product_purchased";i:92;s:21:"report/product_viewed";i:93;s:18:"report/sale_coupon";i:94;s:17:"report/sale_order";i:95;s:18:"report/sale_return";i:96;s:20:"report/sale_shipping";i:97;s:15:"report/sale_tax";i:98;s:14:"sale/affiliate";i:99;s:12:"sale/contact";i:100;s:11:"sale/coupon";i:101;s:13:"sale/customer";i:102;s:20:"sale/customer_ban_ip";i:103;s:19:"sale/customer_group";i:104;s:10:"sale/order";i:105;s:11:"sale/return";i:106;s:12:"sale/voucher";i:107;s:18:"sale/voucher_theme";i:108;s:15:"setting/setting";i:109;s:13:"setting/store";i:110;s:16:"shipping/auspost";i:111;s:17:"shipping/citylink";i:112;s:14:"shipping/fedex";i:113;s:13:"shipping/flat";i:114;s:13:"shipping/free";i:115;s:13:"shipping/item";i:116;s:23:"shipping/parcelforce_48";i:117;s:15:"shipping/pickup";i:118;s:19:"shipping/royal_mail";i:119;s:12:"shipping/ups";i:120;s:13:"shipping/usps";i:121;s:15:"shipping/weight";i:122;s:11:"tool/backup";i:123;s:14:"tool/error_log";i:124;s:12:"total/coupon";i:125;s:12:"total/credit";i:126;s:14:"total/handling";i:127;s:16:"total/klarna_fee";i:128;s:19:"total/low_order_fee";i:129;s:12:"total/reward";i:130;s:14:"total/shipping";i:131;s:15:"total/sub_total";i:132;s:9:"total/tax";i:133;s:11:"total/total";i:134;s:13:"total/voucher";i:135;s:9:"user/user";i:136;s:20:"user/user_permission";i:137;s:14:"module/special";i:138;s:14:"module/welcome";i:139;s:12:"module/store";i:140;s:19:"feed/google_sitemap";i:141;s:16:"feed/google_base";i:142;s:18:"module/google_talk";i:143;s:12:"module/store";}s:6:"modify";a:144:{i:0;s:17:"catalog/attribute";i:1;s:23:"catalog/attribute_group";i:2;s:16:"catalog/category";i:3;s:16:"catalog/download";i:4;s:14:"catalog/filter";i:5;s:19:"catalog/information";i:6;s:20:"catalog/manufacturer";i:7;s:15:"catalog/message";i:8;s:12:"catalog/news";i:9;s:21:"catalog/news_category";i:10;s:20:"catalog/news_comment";i:11;s:14:"catalog/option";i:12;s:15:"catalog/product";i:13;s:14:"catalog/review";i:14;s:18:"common/filemanager";i:15;s:13:"design/banner";i:16;s:19:"design/custom_field";i:17;s:13:"design/layout";i:18;s:14:"extension/feed";i:19;s:17:"extension/manager";i:20;s:16:"extension/module";i:21;s:17:"extension/payment";i:22;s:18:"extension/shipping";i:23;s:15:"extension/total";i:24;s:16:"feed/google_base";i:25;s:19:"feed/google_sitemap";i:26;s:20:"localisation/country";i:27;s:21:"localisation/currency";i:28;s:21:"localisation/geo_zone";i:29;s:21:"localisation/language";i:30;s:25:"localisation/length_class";i:31;s:25:"localisation/order_status";i:32;s:26:"localisation/return_action";i:33;s:26:"localisation/return_reason";i:34;s:26:"localisation/return_status";i:35;s:25:"localisation/stock_status";i:36;s:22:"localisation/tax_class";i:37;s:21:"localisation/tax_rate";i:38;s:25:"localisation/weight_class";i:39;s:17:"localisation/zone";i:40;s:14:"module/account";i:41;s:16:"module/affiliate";i:42;s:13:"module/banner";i:43;s:17:"module/bestseller";i:44;s:15:"module/carousel";i:45;s:15:"module/category";i:46;s:15:"module/featured";i:47;s:13:"module/filter";i:48;s:19:"module/filteroption";i:49;s:18:"module/google_talk";i:50;s:18:"module/information";i:51;s:13:"module/latest";i:52;s:28:"module/manufacturersdropdown";i:53;s:20:"module/news_category";i:54;s:19:"module/newsfeatured";i:55;s:17:"module/newslatest";i:56;s:16:"module/slideshow";i:57;s:14:"module/special";i:58;s:12:"module/store";i:59;s:18:"module/tnt_newscat";i:60;s:13:"module/viewed";i:61;s:20:"module/vqmod_manager";i:62;s:14:"module/welcome";i:63;s:24:"payment/authorizenet_aim";i:64;s:21:"payment/bank_transfer";i:65;s:14:"payment/cheque";i:66;s:11:"payment/cod";i:67;s:21:"payment/free_checkout";i:68;s:22:"payment/klarna_account";i:69;s:22:"payment/klarna_invoice";i:70;s:14:"payment/liqpay";i:71;s:20:"payment/moneybookers";i:72;s:14:"payment/nochex";i:73;s:15:"payment/paymate";i:74;s:16:"payment/paypoint";i:75;s:13:"payment/payza";i:76;s:26:"payment/perpetual_payments";i:77;s:14:"payment/pp_pro";i:78;s:17:"payment/pp_pro_uk";i:79;s:19:"payment/pp_standard";i:80;s:15:"payment/sagepay";i:81;s:22:"payment/sagepay_direct";i:82;s:18:"payment/sagepay_us";i:83;s:19:"payment/twocheckout";i:84;s:28:"payment/web_payment_software";i:85;s:16:"payment/worldpay";i:86;s:27:"report/affiliate_commission";i:87;s:22:"report/customer_credit";i:88;s:22:"report/customer_online";i:89;s:21:"report/customer_order";i:90;s:22:"report/customer_reward";i:91;s:24:"report/product_purchased";i:92;s:21:"report/product_viewed";i:93;s:18:"report/sale_coupon";i:94;s:17:"report/sale_order";i:95;s:18:"report/sale_return";i:96;s:20:"report/sale_shipping";i:97;s:15:"report/sale_tax";i:98;s:14:"sale/affiliate";i:99;s:12:"sale/contact";i:100;s:11:"sale/coupon";i:101;s:13:"sale/customer";i:102;s:20:"sale/customer_ban_ip";i:103;s:19:"sale/customer_group";i:104;s:10:"sale/order";i:105;s:11:"sale/return";i:106;s:12:"sale/voucher";i:107;s:18:"sale/voucher_theme";i:108;s:15:"setting/setting";i:109;s:13:"setting/store";i:110;s:16:"shipping/auspost";i:111;s:17:"shipping/citylink";i:112;s:14:"shipping/fedex";i:113;s:13:"shipping/flat";i:114;s:13:"shipping/free";i:115;s:13:"shipping/item";i:116;s:23:"shipping/parcelforce_48";i:117;s:15:"shipping/pickup";i:118;s:19:"shipping/royal_mail";i:119;s:12:"shipping/ups";i:120;s:13:"shipping/usps";i:121;s:15:"shipping/weight";i:122;s:11:"tool/backup";i:123;s:14:"tool/error_log";i:124;s:12:"total/coupon";i:125;s:12:"total/credit";i:126;s:14:"total/handling";i:127;s:16:"total/klarna_fee";i:128;s:19:"total/low_order_fee";i:129;s:12:"total/reward";i:130;s:14:"total/shipping";i:131;s:15:"total/sub_total";i:132;s:9:"total/tax";i:133;s:11:"total/total";i:134;s:13:"total/voucher";i:135;s:9:"user/user";i:136;s:20:"user/user_permission";i:137;s:14:"module/special";i:138;s:14:"module/welcome";i:139;s:12:"module/store";i:140;s:19:"feed/google_sitemap";i:141;s:16:"feed/google_base";i:142;s:18:"module/google_talk";i:143;s:12:"module/store";}}'),
(10, 'Demonstration', '');

-- --------------------------------------------------------

--
-- Table structure for table `voucher`
--

CREATE TABLE IF NOT EXISTS `voucher` (
  `voucher_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `code` varchar(10) NOT NULL,
  `from_name` varchar(64) NOT NULL,
  `from_email` varchar(96) NOT NULL,
  `to_name` varchar(64) NOT NULL,
  `to_email` varchar(96) NOT NULL,
  `voucher_theme_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`voucher_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `voucher_history`
--

CREATE TABLE IF NOT EXISTS `voucher_history` (
  `voucher_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `voucher_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`voucher_history_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `voucher_theme`
--

CREATE TABLE IF NOT EXISTS `voucher_theme` (
  `voucher_theme_id` int(11) NOT NULL AUTO_INCREMENT,
  `image` varchar(255) NOT NULL,
  PRIMARY KEY (`voucher_theme_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `voucher_theme`
--

INSERT INTO `voucher_theme` (`voucher_theme_id`, `image`) VALUES
(8, 'data/demo/canon_eos_5d_2.jpg'),
(7, 'data/demo/gift-voucher-birthday.jpg'),
(6, 'data/demo/apple_logo.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `voucher_theme_description`
--

CREATE TABLE IF NOT EXISTS `voucher_theme_description` (
  `voucher_theme_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  PRIMARY KEY (`voucher_theme_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `voucher_theme_description`
--

INSERT INTO `voucher_theme_description` (`voucher_theme_id`, `language_id`, `name`) VALUES
(6, 2, 'Christmas'),
(7, 2, 'Birthday'),
(8, 2, 'General');

-- --------------------------------------------------------

--
-- Table structure for table `weight_class`
--

CREATE TABLE IF NOT EXISTS `weight_class` (
  `weight_class_id` int(11) NOT NULL AUTO_INCREMENT,
  `value` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  PRIMARY KEY (`weight_class_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `weight_class`
--

INSERT INTO `weight_class` (`weight_class_id`, `value`) VALUES
(1, '1.00000000'),
(2, '1000.00000000'),
(5, '2.20460000'),
(6, '35.27400000');

-- --------------------------------------------------------

--
-- Table structure for table `weight_class_description`
--

CREATE TABLE IF NOT EXISTS `weight_class_description` (
  `weight_class_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL,
  `title` varchar(32) NOT NULL,
  `unit` varchar(4) NOT NULL,
  PRIMARY KEY (`weight_class_id`,`language_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `weight_class_description`
--

INSERT INTO `weight_class_description` (`weight_class_id`, `language_id`, `title`, `unit`) VALUES
(1, 2, 'Kilogram', 'kg'),
(2, 2, 'Gram', 'g'),
(5, 2, 'Pound ', 'lb'),
(6, 2, 'Ounce', 'oz');

-- --------------------------------------------------------

--
-- Table structure for table `zone`
--

CREATE TABLE IF NOT EXISTS `zone` (
  `zone_id` int(11) NOT NULL AUTO_INCREMENT,
  `country_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `code` varchar(32) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`zone_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4033 ;

--
-- Dumping data for table `zone`
--

INSERT INTO `zone` (`zone_id`, `country_id`, `name`, `code`, `status`) VALUES
(1, 1, 'Badakhshan', 'BDS', 1),
(2, 1, 'Badghis', 'BDG', 1),
(3, 1, 'Baghlan', 'BGL', 1),
(4, 1, 'Balkh', 'BAL', 1),
(5, 1, 'Bamian', 'BAM', 1),
(6, 1, 'Farah', 'FRA', 1),
(7, 1, 'Faryab', 'FYB', 1),
(8, 1, 'Ghazni', 'GHA', 1),
(9, 1, 'Ghowr', 'GHO', 1),
(10, 1, 'Helmand', 'HEL', 1),
(11, 1, 'Herat', 'HER', 1),
(12, 1, 'Jowzjan', 'JOW', 1),
(13, 1, 'Kabul', 'KAB', 1),
(14, 1, 'Kandahar', 'KAN', 1),
(15, 1, 'Kapisa', 'KAP', 1),
(16, 1, 'Khost', 'KHO', 1),
(17, 1, 'Konar', 'KNR', 1),
(18, 1, 'Kondoz', 'KDZ', 1),
(19, 1, 'Laghman', 'LAG', 1),
(20, 1, 'Lowgar', 'LOW', 1),
(21, 1, 'Nangrahar', 'NAN', 1),
(22, 1, 'Nimruz', 'NIM', 1),
(23, 1, 'Nurestan', 'NUR', 1),
(24, 1, 'Oruzgan', 'ORU', 1),
(25, 1, 'Paktia', 'PIA', 1),
(26, 1, 'Paktika', 'PKA', 1),
(27, 1, 'Parwan', 'PAR', 1),
(28, 1, 'Samangan', 'SAM', 1),
(29, 1, 'Sar-e Pol', 'SAR', 1),
(30, 1, 'Takhar', 'TAK', 1),
(31, 1, 'Wardak', 'WAR', 1),
(32, 1, 'Zabol', 'ZAB', 1),
(33, 2, 'Berat', 'BR', 1),
(34, 2, 'Bulqize', 'BU', 1),
(35, 2, 'Delvine', 'DL', 1),
(36, 2, 'Devoll', 'DV', 1),
(37, 2, 'Diber', 'DI', 1),
(38, 2, 'Durres', 'DR', 1),
(39, 2, 'Elbasan', 'EL', 1),
(40, 2, 'Kolonje', 'ER', 1),
(41, 2, 'Fier', 'FR', 1),
(42, 2, 'Gjirokaster', 'GJ', 1),
(43, 2, 'Gramsh', 'GR', 1),
(44, 2, 'Has', 'HA', 1),
(45, 2, 'Kavaje', 'KA', 1),
(46, 2, 'Kurbin', 'KB', 1),
(47, 2, 'Kucove', 'KC', 1),
(48, 2, 'Korce', 'KO', 1),
(49, 2, 'Kruje', 'KR', 1),
(50, 2, 'Kukes', 'KU', 1),
(51, 2, 'Librazhd', 'LB', 1),
(52, 2, 'Lezhe', 'LE', 1),
(53, 2, 'Lushnje', 'LU', 1),
(54, 2, 'Malesi e Madhe', 'MM', 1),
(55, 2, 'Mallakaster', 'MK', 1),
(56, 2, 'Mat', 'MT', 1),
(57, 2, 'Mirdite', 'MR', 1),
(58, 2, 'Peqin', 'PQ', 1),
(59, 2, 'Permet', 'PR', 1),
(60, 2, 'Pogradec', 'PG', 1),
(61, 2, 'Puke', 'PU', 1),
(62, 2, 'Shkoder', 'SH', 1),
(63, 2, 'Skrapar', 'SK', 1),
(64, 2, 'Sarande', 'SR', 1),
(65, 2, 'Tepelene', 'TE', 1),
(66, 2, 'Tropoje', 'TP', 1),
(67, 2, 'Tirane', 'TR', 1),
(68, 2, 'Vlore', 'VL', 1),
(69, 3, 'Adrar', 'ADR', 1),
(70, 3, 'Ain Defla', 'ADE', 1),
(71, 3, 'Ain Temouchent', 'ATE', 1),
(72, 3, 'Alger', 'ALG', 1),
(73, 3, 'Annaba', 'ANN', 1),
(74, 3, 'Batna', 'BAT', 1),
(75, 3, 'Bechar', 'BEC', 1),
(76, 3, 'Bejaia', 'BEJ', 1),
(77, 3, 'Biskra', 'BIS', 1),
(78, 3, 'Blida', 'BLI', 1),
(79, 3, 'Bordj Bou Arreridj', 'BBA', 1),
(80, 3, 'Bouira', 'BOA', 1),
(81, 3, 'Boumerdes', 'BMD', 1),
(82, 3, 'Chlef', 'CHL', 1),
(83, 3, 'Constantine', 'CON', 1),
(84, 3, 'Djelfa', 'DJE', 1),
(85, 3, 'El Bayadh', 'EBA', 1),
(86, 3, 'El Oued', 'EOU', 1),
(87, 3, 'El Tarf', 'ETA', 1),
(88, 3, 'Ghardaia', 'GHA', 1),
(89, 3, 'Guelma', 'GUE', 1),
(90, 3, 'Illizi', 'ILL', 1),
(91, 3, 'Jijel', 'JIJ', 1),
(92, 3, 'Khenchela', 'KHE', 1),
(93, 3, 'Laghouat', 'LAG', 1),
(94, 3, 'Muaskar', 'MUA', 1),
(95, 3, 'Medea', 'MED', 1),
(96, 3, 'Mila', 'MIL', 1),
(97, 3, 'Mostaganem', 'MOS', 1),
(98, 3, 'M''Sila', 'MSI', 1),
(99, 3, 'Naama', 'NAA', 1),
(100, 3, 'Oran', 'ORA', 1),
(101, 3, 'Ouargla', 'OUA', 1),
(102, 3, 'Oum el-Bouaghi', 'OEB', 1),
(103, 3, 'Relizane', 'REL', 1),
(104, 3, 'Saida', 'SAI', 1),
(105, 3, 'Setif', 'SET', 1),
(106, 3, 'Sidi Bel Abbes', 'SBA', 1),
(107, 3, 'Skikda', 'SKI', 1),
(108, 3, 'Souk Ahras', 'SAH', 1),
(109, 3, 'Tamanghasset', 'TAM', 1),
(110, 3, 'Tebessa', 'TEB', 1),
(111, 3, 'Tiaret', 'TIA', 1),
(112, 3, 'Tindouf', 'TIN', 1),
(113, 3, 'Tipaza', 'TIP', 1),
(114, 3, 'Tissemsilt', 'TIS', 1),
(115, 3, 'Tizi Ouzou', 'TOU', 1),
(116, 3, 'Tlemcen', 'TLE', 1),
(117, 4, 'Eastern', 'E', 1),
(118, 4, 'Manu''a', 'M', 1),
(119, 4, 'Rose Island', 'R', 1),
(120, 4, 'Swains Island', 'S', 1),
(121, 4, 'Western', 'W', 1),
(122, 5, 'Andorra la Vella', 'ALV', 1),
(123, 5, 'Canillo', 'CAN', 1),
(124, 5, 'Encamp', 'ENC', 1),
(125, 5, 'Escaldes-Engordany', 'ESE', 1),
(126, 5, 'La Massana', 'LMA', 1),
(127, 5, 'Ordino', 'ORD', 1),
(128, 5, 'Sant Julia de Loria', 'SJL', 1),
(129, 6, 'Bengo', 'BGO', 1),
(130, 6, 'Benguela', 'BGU', 1),
(131, 6, 'Bie', 'BIE', 1),
(132, 6, 'Cabinda', 'CAB', 1),
(133, 6, 'Cuando-Cubango', 'CCU', 1),
(134, 6, 'Cuanza Norte', 'CNO', 1),
(135, 6, 'Cuanza Sul', 'CUS', 1),
(136, 6, 'Cunene', 'CNN', 1),
(137, 6, 'Huambo', 'HUA', 1),
(138, 6, 'Huila', 'HUI', 1),
(139, 6, 'Luanda', 'LUA', 1),
(140, 6, 'Lunda Norte', 'LNO', 1),
(141, 6, 'Lunda Sul', 'LSU', 1),
(142, 6, 'Malange', 'MAL', 1),
(143, 6, 'Moxico', 'MOX', 1),
(144, 6, 'Namibe', 'NAM', 1),
(145, 6, 'Uige', 'UIG', 1),
(146, 6, 'Zaire', 'ZAI', 1),
(147, 9, 'Saint George', 'ASG', 1),
(148, 9, 'Saint John', 'ASJ', 1),
(149, 9, 'Saint Mary', 'ASM', 1),
(150, 9, 'Saint Paul', 'ASL', 1),
(151, 9, 'Saint Peter', 'ASR', 1),
(152, 9, 'Saint Philip', 'ASH', 1),
(153, 9, 'Barbuda', 'BAR', 1),
(154, 9, 'Redonda', 'RED', 1),
(155, 10, 'Antartida e Islas del Atlantico', 'AN', 1),
(156, 10, 'Buenos Aires', 'BA', 1),
(157, 10, 'Catamarca', 'CA', 1),
(158, 10, 'Chaco', 'CH', 1),
(159, 10, 'Chubut', 'CU', 1),
(160, 10, 'Cordoba', 'CO', 1),
(161, 10, 'Corrientes', 'CR', 1),
(162, 10, 'Distrito Federal', 'DF', 1),
(163, 10, 'Entre Rios', 'ER', 1),
(164, 10, 'Formosa', 'FO', 1),
(165, 10, 'Jujuy', 'JU', 1),
(166, 10, 'La Pampa', 'LP', 1),
(167, 10, 'La Rioja', 'LR', 1),
(168, 10, 'Mendoza', 'ME', 1),
(169, 10, 'Misiones', 'MI', 1),
(170, 10, 'Neuquen', 'NE', 1),
(171, 10, 'Rio Negro', 'RN', 1),
(172, 10, 'Salta', 'SA', 1),
(173, 10, 'San Juan', 'SJ', 1),
(174, 10, 'San Luis', 'SL', 1),
(175, 10, 'Santa Cruz', 'SC', 1),
(176, 10, 'Santa Fe', 'SF', 1),
(177, 10, 'Santiago del Estero', 'SD', 1),
(178, 10, 'Tierra del Fuego', 'TF', 1),
(179, 10, 'Tucuman', 'TU', 1),
(180, 11, 'Aragatsotn', 'AGT', 1),
(181, 11, 'Ararat', 'ARR', 1),
(182, 11, 'Armavir', 'ARM', 1),
(183, 11, 'Geghark''unik''', 'GEG', 1),
(184, 11, 'Kotayk''', 'KOT', 1),
(185, 11, 'Lorri', 'LOR', 1),
(186, 11, 'Shirak', 'SHI', 1),
(187, 11, 'Syunik''', 'SYU', 1),
(188, 11, 'Tavush', 'TAV', 1),
(189, 11, 'Vayots'' Dzor', 'VAY', 1),
(190, 11, 'Yerevan', 'YER', 1),
(191, 13, 'Australian Capital Territory', 'ACT', 1),
(192, 13, 'New South Wales', 'NSW', 1),
(193, 13, 'Northern Territory', 'NT', 1),
(194, 13, 'Queensland', 'QLD', 1),
(195, 13, 'South Australia', 'SA', 1),
(196, 13, 'Tasmania', 'TAS', 1),
(197, 13, 'Victoria', 'VIC', 1),
(198, 13, 'Western Australia', 'WA', 1),
(199, 14, 'Burgenland', 'BUR', 1),
(200, 14, 'Kärnten', 'KAR', 1),
(201, 14, 'Nieder&ouml;sterreich', 'NOS', 1),
(202, 14, 'Ober&ouml;sterreich', 'OOS', 1),
(203, 14, 'Salzburg', 'SAL', 1),
(204, 14, 'Steiermark', 'STE', 1),
(205, 14, 'Tirol', 'TIR', 1),
(206, 14, 'Vorarlberg', 'VOR', 1),
(207, 14, 'Wien', 'WIE', 1),
(208, 15, 'Ali Bayramli', 'AB', 1),
(209, 15, 'Abseron', 'ABS', 1),
(210, 15, 'AgcabAdi', 'AGC', 1),
(211, 15, 'Agdam', 'AGM', 1),
(212, 15, 'Agdas', 'AGS', 1),
(213, 15, 'Agstafa', 'AGA', 1),
(214, 15, 'Agsu', 'AGU', 1),
(215, 15, 'Astara', 'AST', 1),
(216, 15, 'Baki', 'BA', 1),
(217, 15, 'BabAk', 'BAB', 1),
(218, 15, 'BalakAn', 'BAL', 1),
(219, 15, 'BArdA', 'BAR', 1),
(220, 15, 'Beylaqan', 'BEY', 1),
(221, 15, 'Bilasuvar', 'BIL', 1),
(222, 15, 'Cabrayil', 'CAB', 1),
(223, 15, 'Calilabab', 'CAL', 1),
(224, 15, 'Culfa', 'CUL', 1),
(225, 15, 'Daskasan', 'DAS', 1),
(226, 15, 'Davaci', 'DAV', 1),
(227, 15, 'Fuzuli', 'FUZ', 1),
(228, 15, 'Ganca', 'GA', 1),
(229, 15, 'Gadabay', 'GAD', 1),
(230, 15, 'Goranboy', 'GOR', 1),
(231, 15, 'Goycay', 'GOY', 1),
(232, 15, 'Haciqabul', 'HAC', 1),
(233, 15, 'Imisli', 'IMI', 1),
(234, 15, 'Ismayilli', 'ISM', 1),
(235, 15, 'Kalbacar', 'KAL', 1),
(236, 15, 'Kurdamir', 'KUR', 1),
(237, 15, 'Lankaran', 'LA', 1),
(238, 15, 'Lacin', 'LAC', 1),
(239, 15, 'Lankaran', 'LAN', 1),
(240, 15, 'Lerik', 'LER', 1),
(241, 15, 'Masalli', 'MAS', 1),
(242, 15, 'Mingacevir', 'MI', 1),
(243, 15, 'Naftalan', 'NA', 1),
(244, 15, 'Neftcala', 'NEF', 1),
(245, 15, 'Oguz', 'OGU', 1),
(246, 15, 'Ordubad', 'ORD', 1),
(247, 15, 'Qabala', 'QAB', 1),
(248, 15, 'Qax', 'QAX', 1),
(249, 15, 'Qazax', 'QAZ', 1),
(250, 15, 'Qobustan', 'QOB', 1),
(251, 15, 'Quba', 'QBA', 1),
(252, 15, 'Qubadli', 'QBI', 1),
(253, 15, 'Qusar', 'QUS', 1),
(254, 15, 'Saki', 'SA', 1),
(255, 15, 'Saatli', 'SAT', 1),
(256, 15, 'Sabirabad', 'SAB', 1),
(257, 15, 'Sadarak', 'SAD', 1),
(258, 15, 'Sahbuz', 'SAH', 1),
(259, 15, 'Saki', 'SAK', 1),
(260, 15, 'Salyan', 'SAL', 1),
(261, 15, 'Sumqayit', 'SM', 1),
(262, 15, 'Samaxi', 'SMI', 1),
(263, 15, 'Samkir', 'SKR', 1),
(264, 15, 'Samux', 'SMX', 1),
(265, 15, 'Sarur', 'SAR', 1),
(266, 15, 'Siyazan', 'SIY', 1),
(267, 15, 'Susa', 'SS', 1),
(268, 15, 'Susa', 'SUS', 1),
(269, 15, 'Tartar', 'TAR', 1),
(270, 15, 'Tovuz', 'TOV', 1),
(271, 15, 'Ucar', 'UCA', 1),
(272, 15, 'Xankandi', 'XA', 1),
(273, 15, 'Xacmaz', 'XAC', 1),
(274, 15, 'Xanlar', 'XAN', 1),
(275, 15, 'Xizi', 'XIZ', 1),
(276, 15, 'Xocali', 'XCI', 1),
(277, 15, 'Xocavand', 'XVD', 1),
(278, 15, 'Yardimli', 'YAR', 1),
(279, 15, 'Yevlax', 'YEV', 1),
(280, 15, 'Zangilan', 'ZAN', 1),
(281, 15, 'Zaqatala', 'ZAQ', 1),
(282, 15, 'Zardab', 'ZAR', 1),
(283, 15, 'Naxcivan', 'NX', 1),
(284, 16, 'Acklins', 'ACK', 1),
(285, 16, 'Berry Islands', 'BER', 1),
(286, 16, 'Bimini', 'BIM', 1),
(287, 16, 'Black Point', 'BLK', 1),
(288, 16, 'Cat Island', 'CAT', 1),
(289, 16, 'Central Abaco', 'CAB', 1),
(290, 16, 'Central Andros', 'CAN', 1),
(291, 16, 'Central Eleuthera', 'CEL', 1),
(292, 16, 'City of Freeport', 'FRE', 1),
(293, 16, 'Crooked Island', 'CRO', 1),
(294, 16, 'East Grand Bahama', 'EGB', 1),
(295, 16, 'Exuma', 'EXU', 1),
(296, 16, 'Grand Cay', 'GRD', 1),
(297, 16, 'Harbour Island', 'HAR', 1),
(298, 16, 'Hope Town', 'HOP', 1),
(299, 16, 'Inagua', 'INA', 1),
(300, 16, 'Long Island', 'LNG', 1),
(301, 16, 'Mangrove Cay', 'MAN', 1),
(302, 16, 'Mayaguana', 'MAY', 1),
(303, 16, 'Moore''s Island', 'MOO', 1),
(304, 16, 'North Abaco', 'NAB', 1),
(305, 16, 'North Andros', 'NAN', 1),
(306, 16, 'North Eleuthera', 'NEL', 1),
(307, 16, 'Ragged Island', 'RAG', 1),
(308, 16, 'Rum Cay', 'RUM', 1),
(309, 16, 'San Salvador', 'SAL', 1),
(310, 16, 'South Abaco', 'SAB', 1),
(311, 16, 'South Andros', 'SAN', 1),
(312, 16, 'South Eleuthera', 'SEL', 1),
(313, 16, 'Spanish Wells', 'SWE', 1),
(314, 16, 'West Grand Bahama', 'WGB', 1),
(315, 17, 'Capital', 'CAP', 1),
(316, 17, 'Central', 'CEN', 1),
(317, 17, 'Muharraq', 'MUH', 1),
(318, 17, 'Northern', 'NOR', 1),
(319, 17, 'Southern', 'SOU', 1),
(320, 18, 'Barisal', 'BAR', 1),
(321, 18, 'Chittagong', 'CHI', 1),
(322, 18, 'Dhaka', 'DHA', 1),
(323, 18, 'Khulna', 'KHU', 1),
(324, 18, 'Rajshahi', 'RAJ', 1),
(325, 18, 'Sylhet', 'SYL', 1),
(326, 19, 'Christ Church', 'CC', 1),
(327, 19, 'Saint Andrew', 'AND', 1),
(328, 19, 'Saint George', 'GEO', 1),
(329, 19, 'Saint James', 'JAM', 1),
(330, 19, 'Saint John', 'JOH', 1),
(331, 19, 'Saint Joseph', 'JOS', 1),
(332, 19, 'Saint Lucy', 'LUC', 1),
(333, 19, 'Saint Michael', 'MIC', 1),
(334, 19, 'Saint Peter', 'PET', 1),
(335, 19, 'Saint Philip', 'PHI', 1),
(336, 19, 'Saint Thomas', 'THO', 1),
(337, 20, 'Brestskaya (Brest)', 'BR', 1),
(338, 20, 'Homyel''skaya (Homyel'')', 'HO', 1),
(339, 20, 'Horad Minsk', 'HM', 1),
(340, 20, 'Hrodzyenskaya (Hrodna)', 'HR', 1),
(341, 20, 'Mahilyowskaya (Mahilyow)', 'MA', 1),
(342, 20, 'Minskaya', 'MI', 1),
(343, 20, 'Vitsyebskaya (Vitsyebsk)', 'VI', 1),
(344, 21, 'Antwerpen', 'VAN', 1),
(345, 21, 'Brabant Wallon', 'WBR', 1),
(346, 21, 'Hainaut', 'WHT', 1),
(347, 21, 'Liège', 'WLG', 1),
(348, 21, 'Limburg', 'VLI', 1),
(349, 21, 'Luxembourg', 'WLX', 1),
(350, 21, 'Namur', 'WNA', 1),
(351, 21, 'Oost-Vlaanderen', 'VOV', 1),
(352, 21, 'Vlaams Brabant', 'VBR', 1),
(353, 21, 'West-Vlaanderen', 'VWV', 1),
(354, 22, 'Belize', 'BZ', 1),
(355, 22, 'Cayo', 'CY', 1),
(356, 22, 'Corozal', 'CR', 1),
(357, 22, 'Orange Walk', 'OW', 1),
(358, 22, 'Stann Creek', 'SC', 1),
(359, 22, 'Toledo', 'TO', 1),
(360, 23, 'Alibori', 'AL', 1),
(361, 23, 'Atakora', 'AK', 1),
(362, 23, 'Atlantique', 'AQ', 1),
(363, 23, 'Borgou', 'BO', 1),
(364, 23, 'Collines', 'CO', 1),
(365, 23, 'Donga', 'DO', 1),
(366, 23, 'Kouffo', 'KO', 1),
(367, 23, 'Littoral', 'LI', 1),
(368, 23, 'Mono', 'MO', 1),
(369, 23, 'Oueme', 'OU', 1),
(370, 23, 'Plateau', 'PL', 1),
(371, 23, 'Zou', 'ZO', 1),
(372, 24, 'Devonshire', 'DS', 1),
(373, 24, 'Hamilton City', 'HC', 1),
(374, 24, 'Hamilton', 'HA', 1),
(375, 24, 'Paget', 'PG', 1),
(376, 24, 'Pembroke', 'PB', 1),
(377, 24, 'Saint George City', 'GC', 1),
(378, 24, 'Saint George''s', 'SG', 1),
(379, 24, 'Sandys', 'SA', 1),
(380, 24, 'Smith''s', 'SM', 1),
(381, 24, 'Southampton', 'SH', 1),
(382, 24, 'Warwick', 'WA', 1),
(383, 25, 'Bumthang', 'BUM', 1),
(384, 25, 'Chukha', 'CHU', 1),
(385, 25, 'Dagana', 'DAG', 1),
(386, 25, 'Gasa', 'GAS', 1),
(387, 25, 'Haa', 'HAA', 1),
(388, 25, 'Lhuntse', 'LHU', 1),
(389, 25, 'Mongar', 'MON', 1),
(390, 25, 'Paro', 'PAR', 1),
(391, 25, 'Pemagatshel', 'PEM', 1),
(392, 25, 'Punakha', 'PUN', 1),
(393, 25, 'Samdrup Jongkhar', 'SJO', 1),
(394, 25, 'Samtse', 'SAT', 1),
(395, 25, 'Sarpang', 'SAR', 1),
(396, 25, 'Thimphu', 'THI', 1),
(397, 25, 'Trashigang', 'TRG', 1),
(398, 25, 'Trashiyangste', 'TRY', 1),
(399, 25, 'Trongsa', 'TRO', 1),
(400, 25, 'Tsirang', 'TSI', 1),
(401, 25, 'Wangdue Phodrang', 'WPH', 1),
(402, 25, 'Zhemgang', 'ZHE', 1),
(403, 26, 'Beni', 'BEN', 1),
(404, 26, 'Chuquisaca', 'CHU', 1),
(405, 26, 'Cochabamba', 'COC', 1),
(406, 26, 'La Paz', 'LPZ', 1),
(407, 26, 'Oruro', 'ORU', 1),
(408, 26, 'Pando', 'PAN', 1),
(409, 26, 'Potosi', 'POT', 1),
(410, 26, 'Santa Cruz', 'SCZ', 1),
(411, 26, 'Tarija', 'TAR', 1),
(412, 27, 'Brcko district', 'BRO', 1),
(413, 27, 'Unsko-Sanski Kanton', 'FUS', 1),
(414, 27, 'Posavski Kanton', 'FPO', 1),
(415, 27, 'Tuzlanski Kanton', 'FTU', 1),
(416, 27, 'Zenicko-Dobojski Kanton', 'FZE', 1),
(417, 27, 'Bosanskopodrinjski Kanton', 'FBP', 1),
(418, 27, 'Srednjebosanski Kanton', 'FSB', 1),
(419, 27, 'Hercegovacko-neretvanski Kanton', 'FHN', 1),
(420, 27, 'Zapadnohercegovacka Zupanija', 'FZH', 1),
(421, 27, 'Kanton Sarajevo', 'FSA', 1),
(422, 27, 'Zapadnobosanska', 'FZA', 1),
(423, 27, 'Banja Luka', 'SBL', 1),
(424, 27, 'Doboj', 'SDO', 1),
(425, 27, 'Bijeljina', 'SBI', 1),
(426, 27, 'Vlasenica', 'SVL', 1),
(427, 27, 'Sarajevo-Romanija or Sokolac', 'SSR', 1),
(428, 27, 'Foca', 'SFO', 1),
(429, 27, 'Trebinje', 'STR', 1),
(430, 28, 'Central', 'CE', 1),
(431, 28, 'Ghanzi', 'GH', 1),
(432, 28, 'Kgalagadi', 'KD', 1),
(433, 28, 'Kgatleng', 'KT', 1),
(434, 28, 'Kweneng', 'KW', 1),
(435, 28, 'Ngamiland', 'NG', 1),
(436, 28, 'North East', 'NE', 1),
(437, 28, 'North West', 'NW', 1),
(438, 28, 'South East', 'SE', 1),
(439, 28, 'Southern', 'SO', 1),
(440, 30, 'Acre', 'AC', 1),
(441, 30, 'Alagoas', 'AL', 1),
(442, 30, 'Amapá', 'AP', 1),
(443, 30, 'Amazonas', 'AM', 1),
(444, 30, 'Bahia', 'BA', 1),
(445, 30, 'Ceará', 'CE', 1),
(446, 30, 'Distrito Federal', 'DF', 1),
(447, 30, 'Espírito Santo', 'ES', 1),
(448, 30, 'Goiás', 'GO', 1),
(449, 30, 'Maranhão', 'MA', 1),
(450, 30, 'Mato Grosso', 'MT', 1),
(451, 30, 'Mato Grosso do Sul', 'MS', 1),
(452, 30, 'Minas Gerais', 'MG', 1),
(453, 30, 'Pará', 'PA', 1),
(454, 30, 'Paraíba', 'PB', 1),
(455, 30, 'Paraná', 'PR', 1),
(456, 30, 'Pernambuco', 'PE', 1),
(457, 30, 'Piauí', 'PI', 1),
(458, 30, 'Rio de Janeiro', 'RJ', 1),
(459, 30, 'Rio Grande do Norte', 'RN', 1),
(460, 30, 'Rio Grande do Sul', 'RS', 1),
(461, 30, 'Rondônia', 'RO', 1),
(462, 30, 'Roraima', 'RR', 1),
(463, 30, 'Santa Catarina', 'SC', 1),
(464, 30, 'São Paulo', 'SP', 1),
(465, 30, 'Sergipe', 'SE', 1),
(466, 30, 'Tocantins', 'TO', 1),
(467, 31, 'Peros Banhos', 'PB', 1),
(468, 31, 'Salomon Islands', 'SI', 1),
(469, 31, 'Nelsons Island', 'NI', 1),
(470, 31, 'Three Brothers', 'TB', 1),
(471, 31, 'Eagle Islands', 'EA', 1),
(472, 31, 'Danger Island', 'DI', 1),
(473, 31, 'Egmont Islands', 'EG', 1),
(474, 31, 'Diego Garcia', 'DG', 1),
(475, 32, 'Belait', 'BEL', 1),
(476, 32, 'Brunei and Muara', 'BRM', 1),
(477, 32, 'Temburong', 'TEM', 1),
(478, 32, 'Tutong', 'TUT', 1),
(479, 33, 'Blagoevgrad', '', 1),
(480, 33, 'Burgas', '', 1),
(481, 33, 'Dobrich', '', 1),
(482, 33, 'Gabrovo', '', 1),
(483, 33, 'Haskovo', '', 1),
(484, 33, 'Kardjali', '', 1),
(485, 33, 'Kyustendil', '', 1),
(486, 33, 'Lovech', '', 1),
(487, 33, 'Montana', '', 1),
(488, 33, 'Pazardjik', '', 1),
(489, 33, 'Pernik', '', 1),
(490, 33, 'Pleven', '', 1),
(491, 33, 'Plovdiv', '', 1),
(492, 33, 'Razgrad', '', 1),
(493, 33, 'Shumen', '', 1),
(494, 33, 'Silistra', '', 1),
(495, 33, 'Sliven', '', 1),
(496, 33, 'Smolyan', '', 1),
(497, 33, 'Sofia', '', 1),
(498, 33, 'Sofia - town', '', 1),
(499, 33, 'Stara Zagora', '', 1),
(500, 33, 'Targovishte', '', 1),
(501, 33, 'Varna', '', 1),
(502, 33, 'Veliko Tarnovo', '', 1),
(503, 33, 'Vidin', '', 1),
(504, 33, 'Vratza', '', 1),
(505, 33, 'Yambol', '', 1),
(506, 34, 'Bale', 'BAL', 1),
(507, 34, 'Bam', 'BAM', 1),
(508, 34, 'Banwa', 'BAN', 1),
(509, 34, 'Bazega', 'BAZ', 1),
(510, 34, 'Bougouriba', 'BOR', 1),
(511, 34, 'Boulgou', 'BLG', 1),
(512, 34, 'Boulkiemde', 'BOK', 1),
(513, 34, 'Comoe', 'COM', 1),
(514, 34, 'Ganzourgou', 'GAN', 1),
(515, 34, 'Gnagna', 'GNA', 1),
(516, 34, 'Gourma', 'GOU', 1),
(517, 34, 'Houet', 'HOU', 1),
(518, 34, 'Ioba', 'IOA', 1),
(519, 34, 'Kadiogo', 'KAD', 1),
(520, 34, 'Kenedougou', 'KEN', 1),
(521, 34, 'Komondjari', 'KOD', 1),
(522, 34, 'Kompienga', 'KOP', 1),
(523, 34, 'Kossi', 'KOS', 1),
(524, 34, 'Koulpelogo', 'KOL', 1),
(525, 34, 'Kouritenga', 'KOT', 1),
(526, 34, 'Kourweogo', 'KOW', 1),
(527, 34, 'Leraba', 'LER', 1),
(528, 34, 'Loroum', 'LOR', 1),
(529, 34, 'Mouhoun', 'MOU', 1),
(530, 34, 'Nahouri', 'NAH', 1),
(531, 34, 'Namentenga', 'NAM', 1),
(532, 34, 'Nayala', 'NAY', 1),
(533, 34, 'Noumbiel', 'NOU', 1),
(534, 34, 'Oubritenga', 'OUB', 1),
(535, 34, 'Oudalan', 'OUD', 1),
(536, 34, 'Passore', 'PAS', 1),
(537, 34, 'Poni', 'PON', 1),
(538, 34, 'Sanguie', 'SAG', 1),
(539, 34, 'Sanmatenga', 'SAM', 1),
(540, 34, 'Seno', 'SEN', 1),
(541, 34, 'Sissili', 'SIS', 1),
(542, 34, 'Soum', 'SOM', 1),
(543, 34, 'Sourou', 'SOR', 1),
(544, 34, 'Tapoa', 'TAP', 1),
(545, 34, 'Tuy', 'TUY', 1),
(546, 34, 'Yagha', 'YAG', 1),
(547, 34, 'Yatenga', 'YAT', 1),
(548, 34, 'Ziro', 'ZIR', 1),
(549, 34, 'Zondoma', 'ZOD', 1),
(550, 34, 'Zoundweogo', 'ZOW', 1),
(551, 35, 'Bubanza', 'BB', 1),
(552, 35, 'Bujumbura', 'BJ', 1),
(553, 35, 'Bururi', 'BR', 1),
(554, 35, 'Cankuzo', 'CA', 1),
(555, 35, 'Cibitoke', 'CI', 1),
(556, 35, 'Gitega', 'GI', 1),
(557, 35, 'Karuzi', 'KR', 1),
(558, 35, 'Kayanza', 'KY', 1),
(559, 35, 'Kirundo', 'KI', 1),
(560, 35, 'Makamba', 'MA', 1),
(561, 35, 'Muramvya', 'MU', 1),
(562, 35, 'Muyinga', 'MY', 1),
(563, 35, 'Mwaro', 'MW', 1),
(564, 35, 'Ngozi', 'NG', 1),
(565, 35, 'Rutana', 'RT', 1),
(566, 35, 'Ruyigi', 'RY', 1),
(567, 36, 'Phnom Penh', 'PP', 1),
(568, 36, 'Preah Seihanu (Kompong Som or Sihanoukville)', 'PS', 1),
(569, 36, 'Pailin', 'PA', 1),
(570, 36, 'Keb', 'KB', 1),
(571, 36, 'Banteay Meanchey', 'BM', 1),
(572, 36, 'Battambang', 'BA', 1),
(573, 36, 'Kampong Cham', 'KM', 1),
(574, 36, 'Kampong Chhnang', 'KN', 1),
(575, 36, 'Kampong Speu', 'KU', 1),
(576, 36, 'Kampong Som', 'KO', 1),
(577, 36, 'Kampong Thom', 'KT', 1),
(578, 36, 'Kampot', 'KP', 1),
(579, 36, 'Kandal', 'KL', 1),
(580, 36, 'Kaoh Kong', 'KK', 1),
(581, 36, 'Kratie', 'KR', 1),
(582, 36, 'Mondul Kiri', 'MK', 1),
(583, 36, 'Oddar Meancheay', 'OM', 1),
(584, 36, 'Pursat', 'PU', 1),
(585, 36, 'Preah Vihear', 'PR', 1),
(586, 36, 'Prey Veng', 'PG', 1),
(587, 36, 'Ratanak Kiri', 'RK', 1),
(588, 36, 'Siemreap', 'SI', 1),
(589, 36, 'Stung Treng', 'ST', 1),
(590, 36, 'Svay Rieng', 'SR', 1),
(591, 36, 'Takeo', 'TK', 1),
(592, 37, 'Adamawa (Adamaoua)', 'ADA', 1),
(593, 37, 'Centre', 'CEN', 1),
(594, 37, 'East (Est)', 'EST', 1),
(595, 37, 'Extreme North (Extreme-Nord)', 'EXN', 1),
(596, 37, 'Littoral', 'LIT', 1),
(597, 37, 'North (Nord)', 'NOR', 1),
(598, 37, 'Northwest (Nord-Ouest)', 'NOT', 1),
(599, 37, 'West (Ouest)', 'OUE', 1),
(600, 37, 'South (Sud)', 'SUD', 1),
(601, 37, 'Southwest (Sud-Ouest).', 'SOU', 1),
(602, 38, 'Alberta', 'AB', 1),
(603, 38, 'British Columbia', 'BC', 1),
(604, 38, 'Manitoba', 'MB', 1),
(605, 38, 'New Brunswick', 'NB', 1),
(606, 38, 'Newfoundland and Labrador', 'NL', 1),
(607, 38, 'Northwest Territories', 'NT', 1),
(608, 38, 'Nova Scotia', 'NS', 1),
(609, 38, 'Nunavut', 'NU', 1),
(610, 38, 'Ontario', 'ON', 1),
(611, 38, 'Prince Edward Island', 'PE', 1),
(612, 38, 'Qu&eacute;bec', 'QC', 1),
(613, 38, 'Saskatchewan', 'SK', 1),
(614, 38, 'Yukon Territory', 'YT', 1),
(615, 39, 'Boa Vista', 'BV', 1),
(616, 39, 'Brava', 'BR', 1),
(617, 39, 'Calheta de Sao Miguel', 'CS', 1),
(618, 39, 'Maio', 'MA', 1),
(619, 39, 'Mosteiros', 'MO', 1),
(620, 39, 'Paul', 'PA', 1),
(621, 39, 'Porto Novo', 'PN', 1),
(622, 39, 'Praia', 'PR', 1),
(623, 39, 'Ribeira Grande', 'RG', 1),
(624, 39, 'Sal', 'SL', 1),
(625, 39, 'Santa Catarina', 'CA', 1),
(626, 39, 'Santa Cruz', 'CR', 1),
(627, 39, 'Sao Domingos', 'SD', 1),
(628, 39, 'Sao Filipe', 'SF', 1),
(629, 39, 'Sao Nicolau', 'SN', 1),
(630, 39, 'Sao Vicente', 'SV', 1),
(631, 39, 'Tarrafal', 'TA', 1),
(632, 40, 'Creek', 'CR', 1),
(633, 40, 'Eastern', 'EA', 1),
(634, 40, 'Midland', 'ML', 1),
(635, 40, 'South Town', 'ST', 1),
(636, 40, 'Spot Bay', 'SP', 1),
(637, 40, 'Stake Bay', 'SK', 1),
(638, 40, 'West End', 'WD', 1),
(639, 40, 'Western', 'WN', 1),
(640, 41, 'Bamingui-Bangoran', 'BBA', 1),
(641, 41, 'Basse-Kotto', 'BKO', 1),
(642, 41, 'Haute-Kotto', 'HKO', 1),
(643, 41, 'Haut-Mbomou', 'HMB', 1),
(644, 41, 'Kemo', 'KEM', 1),
(645, 41, 'Lobaye', 'LOB', 1),
(646, 41, 'Mambere-KadeÔ', 'MKD', 1),
(647, 41, 'Mbomou', 'MBO', 1),
(648, 41, 'Nana-Mambere', 'NMM', 1),
(649, 41, 'Ombella-M''Poko', 'OMP', 1),
(650, 41, 'Ouaka', 'OUK', 1),
(651, 41, 'Ouham', 'OUH', 1),
(652, 41, 'Ouham-Pende', 'OPE', 1),
(653, 41, 'Vakaga', 'VAK', 1),
(654, 41, 'Nana-Grebizi', 'NGR', 1),
(655, 41, 'Sangha-Mbaere', 'SMB', 1),
(656, 41, 'Bangui', 'BAN', 1),
(657, 42, 'Batha', 'BA', 1),
(658, 42, 'Biltine', 'BI', 1),
(659, 42, 'Borkou-Ennedi-Tibesti', 'BE', 1),
(660, 42, 'Chari-Baguirmi', 'CB', 1),
(661, 42, 'Guera', 'GU', 1),
(662, 42, 'Kanem', 'KA', 1),
(663, 42, 'Lac', 'LA', 1),
(664, 42, 'Logone Occidental', 'LC', 1),
(665, 42, 'Logone Oriental', 'LR', 1),
(666, 42, 'Mayo-Kebbi', 'MK', 1),
(667, 42, 'Moyen-Chari', 'MC', 1),
(668, 42, 'Ouaddai', 'OU', 1),
(669, 42, 'Salamat', 'SA', 1),
(670, 42, 'Tandjile', 'TA', 1),
(671, 43, 'Aisen del General Carlos Ibanez', 'AI', 1),
(672, 43, 'Antofagasta', 'AN', 1),
(673, 43, 'Araucania', 'AR', 1),
(674, 43, 'Atacama', 'AT', 1),
(675, 43, 'Bio-Bio', 'BI', 1),
(676, 43, 'Coquimbo', 'CO', 1),
(677, 43, 'Libertador General Bernardo O''Hi', 'LI', 1),
(678, 43, 'Los Lagos', 'LL', 1),
(679, 43, 'Magallanes y de la Antartica Chi', 'MA', 1),
(680, 43, 'Maule', 'ML', 1),
(681, 43, 'Region Metropolitana', 'RM', 1),
(682, 43, 'Tarapaca', 'TA', 1),
(683, 43, 'Valparaiso', 'VS', 1),
(684, 44, 'Anhui', 'AN', 1),
(685, 44, 'Beijing', 'BE', 1),
(686, 44, 'Chongqing', 'CH', 1),
(687, 44, 'Fujian', 'FU', 1),
(688, 44, 'Gansu', 'GA', 1),
(689, 44, 'Guangdong', 'GU', 1),
(690, 44, 'Guangxi', 'GX', 1),
(691, 44, 'Guizhou', 'GZ', 1),
(692, 44, 'Hainan', 'HA', 1),
(693, 44, 'Hebei', 'HB', 1),
(694, 44, 'Heilongjiang', 'HL', 1),
(695, 44, 'Henan', 'HE', 1),
(696, 44, 'Hong Kong', 'HK', 1),
(697, 44, 'Hubei', 'HU', 1),
(698, 44, 'Hunan', 'HN', 1),
(699, 44, 'Inner Mongolia', 'IM', 1),
(700, 44, 'Jiangsu', 'JI', 1),
(701, 44, 'Jiangxi', 'JX', 1),
(702, 44, 'Jilin', 'JL', 1),
(703, 44, 'Liaoning', 'LI', 1),
(704, 44, 'Macau', 'MA', 1),
(705, 44, 'Ningxia', 'NI', 1),
(706, 44, 'Shaanxi', 'SH', 1),
(707, 44, 'Shandong', 'SA', 1),
(708, 44, 'Shanghai', 'SG', 1),
(709, 44, 'Shanxi', 'SX', 1),
(710, 44, 'Sichuan', 'SI', 1),
(711, 44, 'Tianjin', 'TI', 1),
(712, 44, 'Xinjiang', 'XI', 1),
(713, 44, 'Yunnan', 'YU', 1),
(714, 44, 'Zhejiang', 'ZH', 1),
(715, 46, 'Direction Island', 'D', 1),
(716, 46, 'Home Island', 'H', 1),
(717, 46, 'Horsburgh Island', 'O', 1),
(718, 46, 'South Island', 'S', 1),
(719, 46, 'West Island', 'W', 1),
(720, 47, 'Amazonas', 'AMZ', 1),
(721, 47, 'Antioquia', 'ANT', 1),
(722, 47, 'Arauca', 'ARA', 1),
(723, 47, 'Atlantico', 'ATL', 1),
(724, 47, 'Bogota D.C.', 'BDC', 1),
(725, 47, 'Bolivar', 'BOL', 1),
(726, 47, 'Boyaca', 'BOY', 1),
(727, 47, 'Caldas', 'CAL', 1),
(728, 47, 'Caqueta', 'CAQ', 1),
(729, 47, 'Casanare', 'CAS', 1),
(730, 47, 'Cauca', 'CAU', 1),
(731, 47, 'Cesar', 'CES', 1),
(732, 47, 'Choco', 'CHO', 1),
(733, 47, 'Cordoba', 'COR', 1),
(734, 47, 'Cundinamarca', 'CAM', 1),
(735, 47, 'Guainia', 'GNA', 1),
(736, 47, 'Guajira', 'GJR', 1),
(737, 47, 'Guaviare', 'GVR', 1),
(738, 47, 'Huila', 'HUI', 1),
(739, 47, 'Magdalena', 'MAG', 1),
(740, 47, 'Meta', 'MET', 1),
(741, 47, 'Narino', 'NAR', 1),
(742, 47, 'Norte de Santander', 'NDS', 1),
(743, 47, 'Putumayo', 'PUT', 1),
(744, 47, 'Quindio', 'QUI', 1),
(745, 47, 'Risaralda', 'RIS', 1),
(746, 47, 'San Andres y Providencia', 'SAP', 1),
(747, 47, 'Santander', 'SAN', 1),
(748, 47, 'Sucre', 'SUC', 1),
(749, 47, 'Tolima', 'TOL', 1),
(750, 47, 'Valle del Cauca', 'VDC', 1),
(751, 47, 'Vaupes', 'VAU', 1),
(752, 47, 'Vichada', 'VIC', 1),
(753, 48, 'Grande Comore', 'G', 1),
(754, 48, 'Anjouan', 'A', 1),
(755, 48, 'Moheli', 'M', 1),
(756, 49, 'Bouenza', 'BO', 1),
(757, 49, 'Brazzaville', 'BR', 1),
(758, 49, 'Cuvette', 'CU', 1),
(759, 49, 'Cuvette-Ouest', 'CO', 1),
(760, 49, 'Kouilou', 'KO', 1),
(761, 49, 'Lekoumou', 'LE', 1),
(762, 49, 'Likouala', 'LI', 1),
(763, 49, 'Niari', 'NI', 1),
(764, 49, 'Plateaux', 'PL', 1),
(765, 49, 'Pool', 'PO', 1),
(766, 49, 'Sangha', 'SA', 1),
(767, 50, 'Pukapuka', 'PU', 1),
(768, 50, 'Rakahanga', 'RK', 1),
(769, 50, 'Manihiki', 'MK', 1),
(770, 50, 'Penrhyn', 'PE', 1),
(771, 50, 'Nassau Island', 'NI', 1),
(772, 50, 'Surwarrow', 'SU', 1),
(773, 50, 'Palmerston', 'PA', 1),
(774, 50, 'Aitutaki', 'AI', 1),
(775, 50, 'Manuae', 'MA', 1),
(776, 50, 'Takutea', 'TA', 1),
(777, 50, 'Mitiaro', 'MT', 1),
(778, 50, 'Atiu', 'AT', 1),
(779, 50, 'Mauke', 'MU', 1),
(780, 50, 'Rarotonga', 'RR', 1),
(781, 50, 'Mangaia', 'MG', 1),
(782, 51, 'Alajuela', 'AL', 1),
(783, 51, 'Cartago', 'CA', 1),
(784, 51, 'Guanacaste', 'GU', 1),
(785, 51, 'Heredia', 'HE', 1),
(786, 51, 'Limon', 'LI', 1),
(787, 51, 'Puntarenas', 'PU', 1),
(788, 51, 'San Jose', 'SJ', 1),
(789, 52, 'Abengourou', 'ABE', 1),
(790, 52, 'Abidjan', 'ABI', 1),
(791, 52, 'Aboisso', 'ABO', 1),
(792, 52, 'Adiake', 'ADI', 1),
(793, 52, 'Adzope', 'ADZ', 1),
(794, 52, 'Agboville', 'AGB', 1),
(795, 52, 'Agnibilekrou', 'AGN', 1),
(796, 52, 'Alepe', 'ALE', 1),
(797, 52, 'Bocanda', 'BOC', 1),
(798, 52, 'Bangolo', 'BAN', 1),
(799, 52, 'Beoumi', 'BEO', 1),
(800, 52, 'Biankouma', 'BIA', 1),
(801, 52, 'Bondoukou', 'BDK', 1),
(802, 52, 'Bongouanou', 'BGN', 1),
(803, 52, 'Bouafle', 'BFL', 1),
(804, 52, 'Bouake', 'BKE', 1),
(805, 52, 'Bouna', 'BNA', 1),
(806, 52, 'Boundiali', 'BDL', 1),
(807, 52, 'Dabakala', 'DKL', 1),
(808, 52, 'Dabou', 'DBU', 1),
(809, 52, 'Daloa', 'DAL', 1),
(810, 52, 'Danane', 'DAN', 1),
(811, 52, 'Daoukro', 'DAO', 1),
(812, 52, 'Dimbokro', 'DIM', 1),
(813, 52, 'Divo', 'DIV', 1),
(814, 52, 'Duekoue', 'DUE', 1),
(815, 52, 'Ferkessedougou', 'FER', 1),
(816, 52, 'Gagnoa', 'GAG', 1),
(817, 52, 'Grand-Bassam', 'GBA', 1),
(818, 52, 'Grand-Lahou', 'GLA', 1),
(819, 52, 'Guiglo', 'GUI', 1),
(820, 52, 'Issia', 'ISS', 1),
(821, 52, 'Jacqueville', 'JAC', 1),
(822, 52, 'Katiola', 'KAT', 1),
(823, 52, 'Korhogo', 'KOR', 1),
(824, 52, 'Lakota', 'LAK', 1),
(825, 52, 'Man', 'MAN', 1),
(826, 52, 'Mankono', 'MKN', 1),
(827, 52, 'Mbahiakro', 'MBA', 1),
(828, 52, 'Odienne', 'ODI', 1),
(829, 52, 'Oume', 'OUM', 1),
(830, 52, 'Sakassou', 'SAK', 1),
(831, 52, 'San-Pedro', 'SPE', 1),
(832, 52, 'Sassandra', 'SAS', 1),
(833, 52, 'Seguela', 'SEG', 1),
(834, 52, 'Sinfra', 'SIN', 1),
(835, 52, 'Soubre', 'SOU', 1),
(836, 52, 'Tabou', 'TAB', 1),
(837, 52, 'Tanda', 'TAN', 1),
(838, 52, 'Tiebissou', 'TIE', 1),
(839, 52, 'Tingrela', 'TIN', 1),
(840, 52, 'Tiassale', 'TIA', 1),
(841, 52, 'Touba', 'TBA', 1),
(842, 52, 'Toulepleu', 'TLP', 1),
(843, 52, 'Toumodi', 'TMD', 1),
(844, 52, 'Vavoua', 'VAV', 1),
(845, 52, 'Yamoussoukro', 'YAM', 1),
(846, 52, 'Zuenoula', 'ZUE', 1),
(847, 53, 'Bjelovar-Bilogora', 'BB', 1),
(848, 53, 'City of Zagreb', 'CZ', 1),
(849, 53, 'Dubrovnik-Neretva', 'DN', 1),
(850, 53, 'Istra', 'IS', 1),
(851, 53, 'Karlovac', 'KA', 1),
(852, 53, 'Koprivnica-Krizevci', 'KK', 1),
(853, 53, 'Krapina-Zagorje', 'KZ', 1),
(854, 53, 'Lika-Senj', 'LS', 1),
(855, 53, 'Medimurje', 'ME', 1),
(856, 53, 'Osijek-Baranja', 'OB', 1),
(857, 53, 'Pozega-Slavonia', 'PS', 1),
(858, 53, 'Primorje-Gorski Kotar', 'PG', 1),
(859, 53, 'Sibenik', 'SI', 1),
(860, 53, 'Sisak-Moslavina', 'SM', 1),
(861, 53, 'Slavonski Brod-Posavina', 'SB', 1),
(862, 53, 'Split-Dalmatia', 'SD', 1),
(863, 53, 'Varazdin', 'VA', 1),
(864, 53, 'Virovitica-Podravina', 'VP', 1),
(865, 53, 'Vukovar-Srijem', 'VS', 1),
(866, 53, 'Zadar-Knin', 'ZK', 1),
(867, 53, 'Zagreb', 'ZA', 1),
(868, 54, 'Camaguey', 'CA', 1),
(869, 54, 'Ciego de Avila', 'CD', 1),
(870, 54, 'Cienfuegos', 'CI', 1),
(871, 54, 'Ciudad de La Habana', 'CH', 1),
(872, 54, 'Granma', 'GR', 1),
(873, 54, 'Guantanamo', 'GU', 1),
(874, 54, 'Holguin', 'HO', 1),
(875, 54, 'Isla de la Juventud', 'IJ', 1),
(876, 54, 'La Habana', 'LH', 1),
(877, 54, 'Las Tunas', 'LT', 1),
(878, 54, 'Matanzas', 'MA', 1),
(879, 54, 'Pinar del Rio', 'PR', 1),
(880, 54, 'Sancti Spiritus', 'SS', 1),
(881, 54, 'Santiago de Cuba', 'SC', 1),
(882, 54, 'Villa Clara', 'VC', 1),
(883, 55, 'Famagusta', 'F', 1),
(884, 55, 'Kyrenia', 'K', 1),
(885, 55, 'Larnaca', 'A', 1),
(886, 55, 'Limassol', 'I', 1),
(887, 55, 'Nicosia', 'N', 1),
(888, 55, 'Paphos', 'P', 1),
(889, 56, 'Ústecký', 'U', 1),
(890, 56, 'Jihočeský', 'C', 1),
(891, 56, 'Jihomoravský', 'B', 1),
(892, 56, 'Karlovarský', 'K', 1),
(893, 56, 'Královehradecký', 'H', 1),
(894, 56, 'Liberecký', 'L', 1),
(895, 56, 'Moravskoslezský', 'T', 1),
(896, 56, 'Olomoucký', 'M', 1),
(897, 56, 'Pardubický', 'E', 1),
(898, 56, 'Plzeňský', 'P', 1),
(899, 56, 'Praha', 'A', 1),
(900, 56, 'Středočeský', 'S', 1),
(901, 56, 'Vysočina', 'J', 1),
(902, 56, 'Zlínský', 'Z', 1),
(903, 57, 'Arhus', 'AR', 1),
(904, 57, 'Bornholm', 'BH', 1),
(905, 57, 'Copenhagen', 'CO', 1),
(906, 57, 'Faroe Islands', 'FO', 1),
(907, 57, 'Frederiksborg', 'FR', 1),
(908, 57, 'Fyn', 'FY', 1),
(909, 57, 'Kobenhavn', 'KO', 1),
(910, 57, 'Nordjylland', 'NO', 1),
(911, 57, 'Ribe', 'RI', 1),
(912, 57, 'Ringkobing', 'RK', 1),
(913, 57, 'Roskilde', 'RO', 1),
(914, 57, 'Sonderjylland', 'SO', 1),
(915, 57, 'Storstrom', 'ST', 1),
(916, 57, 'Vejle', 'VK', 1),
(917, 57, 'Vestj&aelig;lland', 'VJ', 1),
(918, 57, 'Viborg', 'VB', 1),
(919, 58, '''Ali Sabih', 'S', 1),
(920, 58, 'Dikhil', 'K', 1),
(921, 58, 'Djibouti', 'J', 1),
(922, 58, 'Obock', 'O', 1),
(923, 58, 'Tadjoura', 'T', 1),
(924, 59, 'Saint Andrew Parish', 'AND', 1),
(925, 59, 'Saint David Parish', 'DAV', 1),
(926, 59, 'Saint George Parish', 'GEO', 1),
(927, 59, 'Saint John Parish', 'JOH', 1),
(928, 59, 'Saint Joseph Parish', 'JOS', 1),
(929, 59, 'Saint Luke Parish', 'LUK', 1),
(930, 59, 'Saint Mark Parish', 'MAR', 1),
(931, 59, 'Saint Patrick Parish', 'PAT', 1),
(932, 59, 'Saint Paul Parish', 'PAU', 1),
(933, 59, 'Saint Peter Parish', 'PET', 1),
(934, 60, 'Distrito Nacional', 'DN', 1),
(935, 60, 'Azua', 'AZ', 1),
(936, 60, 'Baoruco', 'BC', 1),
(937, 60, 'Barahona', 'BH', 1),
(938, 60, 'Dajabon', 'DJ', 1),
(939, 60, 'Duarte', 'DU', 1),
(940, 60, 'Elias Pina', 'EL', 1),
(941, 60, 'El Seybo', 'SY', 1),
(942, 60, 'Espaillat', 'ET', 1),
(943, 60, 'Hato Mayor', 'HM', 1),
(944, 60, 'Independencia', 'IN', 1),
(945, 60, 'La Altagracia', 'AL', 1),
(946, 60, 'La Romana', 'RO', 1),
(947, 60, 'La Vega', 'VE', 1),
(948, 60, 'Maria Trinidad Sanchez', 'MT', 1),
(949, 60, 'Monsenor Nouel', 'MN', 1),
(950, 60, 'Monte Cristi', 'MC', 1),
(951, 60, 'Monte Plata', 'MP', 1),
(952, 60, 'Pedernales', 'PD', 1),
(953, 60, 'Peravia (Bani)', 'PR', 1),
(954, 60, 'Puerto Plata', 'PP', 1),
(955, 60, 'Salcedo', 'SL', 1),
(956, 60, 'Samana', 'SM', 1),
(957, 60, 'Sanchez Ramirez', 'SH', 1),
(958, 60, 'San Cristobal', 'SC', 1),
(959, 60, 'San Jose de Ocoa', 'JO', 1),
(960, 60, 'San Juan', 'SJ', 1),
(961, 60, 'San Pedro de Macoris', 'PM', 1),
(962, 60, 'Santiago', 'SA', 1),
(963, 60, 'Santiago Rodriguez', 'ST', 1),
(964, 60, 'Santo Domingo', 'SD', 1),
(965, 60, 'Valverde', 'VA', 1),
(966, 61, 'Aileu', 'AL', 1),
(967, 61, 'Ainaro', 'AN', 1),
(968, 61, 'Baucau', 'BA', 1),
(969, 61, 'Bobonaro', 'BO', 1),
(970, 61, 'Cova Lima', 'CO', 1),
(971, 61, 'Dili', 'DI', 1),
(972, 61, 'Ermera', 'ER', 1),
(973, 61, 'Lautem', 'LA', 1),
(974, 61, 'Liquica', 'LI', 1),
(975, 61, 'Manatuto', 'MT', 1),
(976, 61, 'Manufahi', 'MF', 1),
(977, 61, 'Oecussi', 'OE', 1),
(978, 61, 'Viqueque', 'VI', 1),
(979, 62, 'Azuay', 'AZU', 1),
(980, 62, 'Bolivar', 'BOL', 1),
(981, 62, 'Ca&ntilde;ar', 'CAN', 1),
(982, 62, 'Carchi', 'CAR', 1),
(983, 62, 'Chimborazo', 'CHI', 1),
(984, 62, 'Cotopaxi', 'COT', 1),
(985, 62, 'El Oro', 'EOR', 1),
(986, 62, 'Esmeraldas', 'ESM', 1),
(987, 62, 'Gal&aacute;pagos', 'GPS', 1),
(988, 62, 'Guayas', 'GUA', 1),
(989, 62, 'Imbabura', 'IMB', 1),
(990, 62, 'Loja', 'LOJ', 1),
(991, 62, 'Los Rios', 'LRO', 1),
(992, 62, 'Manab&iacute;', 'MAN', 1),
(993, 62, 'Morona Santiago', 'MSA', 1),
(994, 62, 'Napo', 'NAP', 1),
(995, 62, 'Orellana', 'ORE', 1),
(996, 62, 'Pastaza', 'PAS', 1),
(997, 62, 'Pichincha', 'PIC', 1),
(998, 62, 'Sucumb&iacute;os', 'SUC', 1),
(999, 62, 'Tungurahua', 'TUN', 1),
(1000, 62, 'Zamora Chinchipe', 'ZCH', 1),
(1001, 63, 'Ad Daqahliyah', 'DHY', 1),
(1002, 63, 'Al Bahr al Ahmar', 'BAM', 1),
(1003, 63, 'Al Buhayrah', 'BHY', 1),
(1004, 63, 'Al Fayyum', 'FYM', 1),
(1005, 63, 'Al Gharbiyah', 'GBY', 1),
(1006, 63, 'Al Iskandariyah', 'IDR', 1),
(1007, 63, 'Al Isma''iliyah', 'IML', 1),
(1008, 63, 'Al Jizah', 'JZH', 1),
(1009, 63, 'Al Minufiyah', 'MFY', 1),
(1010, 63, 'Al Minya', 'MNY', 1),
(1011, 63, 'Al Qahirah', 'QHR', 1),
(1012, 63, 'Al Qalyubiyah', 'QLY', 1),
(1013, 63, 'Al Wadi al Jadid', 'WJD', 1),
(1014, 63, 'Ash Sharqiyah', 'SHQ', 1),
(1015, 63, 'As Suways', 'SWY', 1),
(1016, 63, 'Aswan', 'ASW', 1),
(1017, 63, 'Asyut', 'ASY', 1),
(1018, 63, 'Bani Suwayf', 'BSW', 1),
(1019, 63, 'Bur Sa''id', 'BSD', 1),
(1020, 63, 'Dumyat', 'DMY', 1),
(1021, 63, 'Janub Sina''', 'JNS', 1),
(1022, 63, 'Kafr ash Shaykh', 'KSH', 1),
(1023, 63, 'Matruh', 'MAT', 1),
(1024, 63, 'Qina', 'QIN', 1),
(1025, 63, 'Shamal Sina''', 'SHS', 1),
(1026, 63, 'Suhaj', 'SUH', 1),
(1027, 64, 'Ahuachapan', 'AH', 1),
(1028, 64, 'Cabanas', 'CA', 1),
(1029, 64, 'Chalatenango', 'CH', 1),
(1030, 64, 'Cuscatlan', 'CU', 1),
(1031, 64, 'La Libertad', 'LB', 1),
(1032, 64, 'La Paz', 'PZ', 1),
(1033, 64, 'La Union', 'UN', 1),
(1034, 64, 'Morazan', 'MO', 1),
(1035, 64, 'San Miguel', 'SM', 1),
(1036, 64, 'San Salvador', 'SS', 1),
(1037, 64, 'San Vicente', 'SV', 1),
(1038, 64, 'Santa Ana', 'SA', 1),
(1039, 64, 'Sonsonate', 'SO', 1),
(1040, 64, 'Usulutan', 'US', 1),
(1041, 65, 'Provincia Annobon', 'AN', 1),
(1042, 65, 'Provincia Bioko Norte', 'BN', 1),
(1043, 65, 'Provincia Bioko Sur', 'BS', 1),
(1044, 65, 'Provincia Centro Sur', 'CS', 1),
(1045, 65, 'Provincia Kie-Ntem', 'KN', 1),
(1046, 65, 'Provincia Litoral', 'LI', 1),
(1047, 65, 'Provincia Wele-Nzas', 'WN', 1),
(1048, 66, 'Central (Maekel)', 'MA', 1),
(1049, 66, 'Anseba (Keren)', 'KE', 1),
(1050, 66, 'Southern Red Sea (Debub-Keih-Bahri)', 'DK', 1),
(1051, 66, 'Northern Red Sea (Semien-Keih-Bahri)', 'SK', 1),
(1052, 66, 'Southern (Debub)', 'DE', 1),
(1053, 66, 'Gash-Barka (Barentu)', 'BR', 1),
(1054, 67, 'Harjumaa (Tallinn)', 'HA', 1),
(1055, 67, 'Hiiumaa (Kardla)', 'HI', 1),
(1056, 67, 'Ida-Virumaa (Johvi)', 'IV', 1),
(1057, 67, 'Jarvamaa (Paide)', 'JA', 1),
(1058, 67, 'Jogevamaa (Jogeva)', 'JO', 1),
(1059, 67, 'Laane-Virumaa (Rakvere)', 'LV', 1),
(1060, 67, 'Laanemaa (Haapsalu)', 'LA', 1),
(1061, 67, 'Parnumaa (Parnu)', 'PA', 1),
(1062, 67, 'Polvamaa (Polva)', 'PO', 1),
(1063, 67, 'Raplamaa (Rapla)', 'RA', 1),
(1064, 67, 'Saaremaa (Kuessaare)', 'SA', 1),
(1065, 67, 'Tartumaa (Tartu)', 'TA', 1),
(1066, 67, 'Valgamaa (Valga)', 'VA', 1),
(1067, 67, 'Viljandimaa (Viljandi)', 'VI', 1),
(1068, 67, 'Vorumaa (Voru)', 'VO', 1),
(1069, 68, 'Afar', 'AF', 1),
(1070, 68, 'Amhara', 'AH', 1),
(1071, 68, 'Benishangul-Gumaz', 'BG', 1),
(1072, 68, 'Gambela', 'GB', 1),
(1073, 68, 'Hariai', 'HR', 1),
(1074, 68, 'Oromia', 'OR', 1),
(1075, 68, 'Somali', 'SM', 1),
(1076, 68, 'Southern Nations - Nationalities and Peoples Region', 'SN', 1),
(1077, 68, 'Tigray', 'TG', 1),
(1078, 68, 'Addis Ababa', 'AA', 1),
(1079, 68, 'Dire Dawa', 'DD', 1),
(1080, 71, 'Central Division', 'C', 1),
(1081, 71, 'Northern Division', 'N', 1),
(1082, 71, 'Eastern Division', 'E', 1),
(1083, 71, 'Western Division', 'W', 1),
(1084, 71, 'Rotuma', 'R', 1),
(1085, 72, 'Ahvenanmaan Laani', 'AL', 1),
(1086, 72, 'Etela-Suomen Laani', 'ES', 1),
(1087, 72, 'Ita-Suomen Laani', 'IS', 1),
(1088, 72, 'Lansi-Suomen Laani', 'LS', 1),
(1089, 72, 'Lapin Lanani', 'LA', 1),
(1090, 72, 'Oulun Laani', 'OU', 1),
(1114, 74, 'Ain', '01', 1),
(1115, 74, 'Aisne', '02', 1),
(1116, 74, 'Allier', '03', 1),
(1117, 74, 'Alpes de Haute Provence', '04', 1),
(1118, 74, 'Hautes-Alpes', '05', 1),
(1119, 74, 'Alpes Maritimes', '06', 1),
(1120, 74, 'Ard&egrave;che', '07', 1),
(1121, 74, 'Ardennes', '08', 1),
(1122, 74, 'Ari&egrave;ge', '09', 1),
(1123, 74, 'Aube', '10', 1),
(1124, 74, 'Aude', '11', 1),
(1125, 74, 'Aveyron', '12', 1),
(1126, 74, 'Bouches du Rh&ocirc;ne', '13', 1),
(1127, 74, 'Calvados', '14', 1),
(1128, 74, 'Cantal', '15', 1),
(1129, 74, 'Charente', '16', 1),
(1130, 74, 'Charente Maritime', '17', 1),
(1131, 74, 'Cher', '18', 1),
(1132, 74, 'Corr&egrave;ze', '19', 1),
(1133, 74, 'Corse du Sud', '2A', 1),
(1134, 74, 'Haute Corse', '2B', 1),
(1135, 74, 'C&ocirc;te d&#039;or', '21', 1),
(1136, 74, 'C&ocirc;tes d&#039;Armor', '22', 1),
(1137, 74, 'Creuse', '23', 1),
(1138, 74, 'Dordogne', '24', 1),
(1139, 74, 'Doubs', '25', 1),
(1140, 74, 'Dr&ocirc;me', '26', 1),
(1141, 74, 'Eure', '27', 1),
(1142, 74, 'Eure et Loir', '28', 1),
(1143, 74, 'Finist&egrave;re', '29', 1),
(1144, 74, 'Gard', '30', 1),
(1145, 74, 'Haute Garonne', '31', 1),
(1146, 74, 'Gers', '32', 1),
(1147, 74, 'Gironde', '33', 1),
(1148, 74, 'H&eacute;rault', '34', 1),
(1149, 74, 'Ille et Vilaine', '35', 1),
(1150, 74, 'Indre', '36', 1),
(1151, 74, 'Indre et Loire', '37', 1),
(1152, 74, 'Is&eacute;re', '38', 1),
(1153, 74, 'Jura', '39', 1),
(1154, 74, 'Landes', '40', 1),
(1155, 74, 'Loir et Cher', '41', 1),
(1156, 74, 'Loire', '42', 1),
(1157, 74, 'Haute Loire', '43', 1),
(1158, 74, 'Loire Atlantique', '44', 1),
(1159, 74, 'Loiret', '45', 1),
(1160, 74, 'Lot', '46', 1),
(1161, 74, 'Lot et Garonne', '47', 1),
(1162, 74, 'Loz&egrave;re', '48', 1),
(1163, 74, 'Maine et Loire', '49', 1),
(1164, 74, 'Manche', '50', 1),
(1165, 74, 'Marne', '51', 1),
(1166, 74, 'Haute Marne', '52', 1),
(1167, 74, 'Mayenne', '53', 1),
(1168, 74, 'Meurthe et Moselle', '54', 1),
(1169, 74, 'Meuse', '55', 1),
(1170, 74, 'Morbihan', '56', 1),
(1171, 74, 'Moselle', '57', 1),
(1172, 74, 'Ni&egrave;vre', '58', 1),
(1173, 74, 'Nord', '59', 1),
(1174, 74, 'Oise', '60', 1),
(1175, 74, 'Orne', '61', 1),
(1176, 74, 'Pas de Calais', '62', 1),
(1177, 74, 'Puy de D&ocirc;me', '63', 1),
(1178, 74, 'Pyr&eacute;n&eacute;es Atlantiques', '64', 1),
(1179, 74, 'Hautes Pyr&eacute;n&eacute;es', '65', 1),
(1180, 74, 'Pyr&eacute;n&eacute;es Orientales', '66', 1),
(1181, 74, 'Bas Rhin', '67', 1),
(1182, 74, 'Haut Rhin', '68', 1),
(1183, 74, 'Rh&ocirc;ne', '69', 1),
(1184, 74, 'Haute Sa&ocirc;ne', '70', 1),
(1185, 74, 'Sa&ocirc;ne et Loire', '71', 1),
(1186, 74, 'Sarthe', '72', 1),
(1187, 74, 'Savoie', '73', 1),
(1188, 74, 'Haute Savoie', '74', 1),
(1189, 74, 'Paris', '75', 1),
(1190, 74, 'Seine Maritime', '76', 1),
(1191, 74, 'Seine et Marne', '77', 1),
(1192, 74, 'Yvelines', '78', 1),
(1193, 74, 'Deux S&egrave;vres', '79', 1),
(1194, 74, 'Somme', '80', 1),
(1195, 74, 'Tarn', '81', 1),
(1196, 74, 'Tarn et Garonne', '82', 1),
(1197, 74, 'Var', '83', 1),
(1198, 74, 'Vaucluse', '84', 1),
(1199, 74, 'Vend&eacute;e', '85', 1),
(1200, 74, 'Vienne', '86', 1),
(1201, 74, 'Haute Vienne', '87', 1),
(1202, 74, 'Vosges', '88', 1),
(1203, 74, 'Yonne', '89', 1),
(1204, 74, 'Territoire de Belfort', '90', 1),
(1205, 74, 'Essonne', '91', 1),
(1206, 74, 'Hauts de Seine', '92', 1),
(1207, 74, 'Seine St-Denis', '93', 1),
(1208, 74, 'Val de Marne', '94', 1),
(1209, 74, 'Val d''Oise', '95', 1),
(1210, 76, 'Archipel des Marquises', 'M', 1),
(1211, 76, 'Archipel des Tuamotu', 'T', 1),
(1212, 76, 'Archipel des Tubuai', 'I', 1),
(1213, 76, 'Iles du Vent', 'V', 1),
(1214, 76, 'Iles Sous-le-Vent', 'S', 1),
(1215, 77, 'Iles Crozet', 'C', 1),
(1216, 77, 'Iles Kerguelen', 'K', 1),
(1217, 77, 'Ile Amsterdam', 'A', 1),
(1218, 77, 'Ile Saint-Paul', 'P', 1),
(1219, 77, 'Adelie Land', 'D', 1),
(1220, 78, 'Estuaire', 'ES', 1),
(1221, 78, 'Haut-Ogooue', 'HO', 1),
(1222, 78, 'Moyen-Ogooue', 'MO', 1),
(1223, 78, 'Ngounie', 'NG', 1),
(1224, 78, 'Nyanga', 'NY', 1),
(1225, 78, 'Ogooue-Ivindo', 'OI', 1),
(1226, 78, 'Ogooue-Lolo', 'OL', 1),
(1227, 78, 'Ogooue-Maritime', 'OM', 1),
(1228, 78, 'Woleu-Ntem', 'WN', 1),
(1229, 79, 'Banjul', 'BJ', 1),
(1230, 79, 'Basse', 'BS', 1),
(1231, 79, 'Brikama', 'BR', 1),
(1232, 79, 'Janjangbure', 'JA', 1),
(1233, 79, 'Kanifeng', 'KA', 1),
(1234, 79, 'Kerewan', 'KE', 1),
(1235, 79, 'Kuntaur', 'KU', 1),
(1236, 79, 'Mansakonko', 'MA', 1),
(1237, 79, 'Lower River', 'LR', 1),
(1238, 79, 'Central River', 'CR', 1),
(1239, 79, 'North Bank', 'NB', 1),
(1240, 79, 'Upper River', 'UR', 1),
(1241, 79, 'Western', 'WE', 1),
(1242, 80, 'Abkhazia', 'AB', 1),
(1243, 80, 'Ajaria', 'AJ', 1),
(1244, 80, 'Tbilisi', 'TB', 1),
(1245, 80, 'Guria', 'GU', 1),
(1246, 80, 'Imereti', 'IM', 1),
(1247, 80, 'Kakheti', 'KA', 1),
(1248, 80, 'Kvemo Kartli', 'KK', 1),
(1249, 80, 'Mtskheta-Mtianeti', 'MM', 1),
(1250, 80, 'Racha Lechkhumi and Kvemo Svanet', 'RL', 1),
(1251, 80, 'Samegrelo-Zemo Svaneti', 'SZ', 1),
(1252, 80, 'Samtskhe-Javakheti', 'SJ', 1),
(1253, 80, 'Shida Kartli', 'SK', 1),
(1254, 81, 'Baden-W&uuml;rttemberg', 'BAW', 1),
(1255, 81, 'Bayern', 'BAY', 1),
(1256, 81, 'Berlin', 'BER', 1),
(1257, 81, 'Brandenburg', 'BRG', 1),
(1258, 81, 'Bremen', 'BRE', 1),
(1259, 81, 'Hamburg', 'HAM', 1),
(1260, 81, 'Hessen', 'HES', 1),
(1261, 81, 'Mecklenburg-Vorpommern', 'MEC', 1),
(1262, 81, 'Niedersachsen', 'NDS', 1),
(1263, 81, 'Nordrhein-Westfalen', 'NRW', 1),
(1264, 81, 'Rheinland-Pfalz', 'RHE', 1),
(1265, 81, 'Saarland', 'SAR', 1),
(1266, 81, 'Sachsen', 'SAS', 1),
(1267, 81, 'Sachsen-Anhalt', 'SAC', 1),
(1268, 81, 'Schleswig-Holstein', 'SCN', 1),
(1269, 81, 'Th&uuml;ringen', 'THE', 1),
(1270, 82, 'Ashanti Region', 'AS', 1),
(1271, 82, 'Brong-Ahafo Region', 'BA', 1),
(1272, 82, 'Central Region', 'CE', 1),
(1273, 82, 'Eastern Region', 'EA', 1),
(1274, 82, 'Greater Accra Region', 'GA', 1),
(1275, 82, 'Northern Region', 'NO', 1),
(1276, 82, 'Upper East Region', 'UE', 1),
(1277, 82, 'Upper West Region', 'UW', 1),
(1278, 82, 'Volta Region', 'VO', 1),
(1279, 82, 'Western Region', 'WE', 1),
(1280, 84, 'Attica', 'AT', 1),
(1281, 84, 'Central Greece', 'CN', 1),
(1282, 84, 'Central Macedonia', 'CM', 1),
(1283, 84, 'Crete', 'CR', 1),
(1284, 84, 'East Macedonia and Thrace', 'EM', 1),
(1285, 84, 'Epirus', 'EP', 1),
(1286, 84, 'Ionian Islands', 'II', 1),
(1287, 84, 'North Aegean', 'NA', 1),
(1288, 84, 'Peloponnesos', 'PP', 1),
(1289, 84, 'South Aegean', 'SA', 1),
(1290, 84, 'Thessaly', 'TH', 1),
(1291, 84, 'West Greece', 'WG', 1),
(1292, 84, 'West Macedonia', 'WM', 1),
(1293, 85, 'Avannaa', 'A', 1),
(1294, 85, 'Tunu', 'T', 1),
(1295, 85, 'Kitaa', 'K', 1),
(1296, 86, 'Saint Andrew', 'A', 1),
(1297, 86, 'Saint David', 'D', 1),
(1298, 86, 'Saint George', 'G', 1),
(1299, 86, 'Saint John', 'J', 1),
(1300, 86, 'Saint Mark', 'M', 1),
(1301, 86, 'Saint Patrick', 'P', 1),
(1302, 86, 'Carriacou', 'C', 1),
(1303, 86, 'Petit Martinique', 'Q', 1),
(1304, 89, 'Alta Verapaz', 'AV', 1),
(1305, 89, 'Baja Verapaz', 'BV', 1),
(1306, 89, 'Chimaltenango', 'CM', 1),
(1307, 89, 'Chiquimula', 'CQ', 1),
(1308, 89, 'El Peten', 'PE', 1),
(1309, 89, 'El Progreso', 'PR', 1),
(1310, 89, 'El Quiche', 'QC', 1),
(1311, 89, 'Escuintla', 'ES', 1),
(1312, 89, 'Guatemala', 'GU', 1),
(1313, 89, 'Huehuetenango', 'HU', 1),
(1314, 89, 'Izabal', 'IZ', 1),
(1315, 89, 'Jalapa', 'JA', 1),
(1316, 89, 'Jutiapa', 'JU', 1),
(1317, 89, 'Quetzaltenango', 'QZ', 1),
(1318, 89, 'Retalhuleu', 'RE', 1),
(1319, 89, 'Sacatepequez', 'ST', 1),
(1320, 89, 'San Marcos', 'SM', 1),
(1321, 89, 'Santa Rosa', 'SR', 1),
(1322, 89, 'Solola', 'SO', 1),
(1323, 89, 'Suchitepequez', 'SU', 1),
(1324, 89, 'Totonicapan', 'TO', 1),
(1325, 89, 'Zacapa', 'ZA', 1),
(1326, 90, 'Conakry', 'CNK', 1),
(1327, 90, 'Beyla', 'BYL', 1),
(1328, 90, 'Boffa', 'BFA', 1),
(1329, 90, 'Boke', 'BOK', 1),
(1330, 90, 'Coyah', 'COY', 1),
(1331, 90, 'Dabola', 'DBL', 1),
(1332, 90, 'Dalaba', 'DLB', 1),
(1333, 90, 'Dinguiraye', 'DGR', 1),
(1334, 90, 'Dubreka', 'DBR', 1),
(1335, 90, 'Faranah', 'FRN', 1),
(1336, 90, 'Forecariah', 'FRC', 1),
(1337, 90, 'Fria', 'FRI', 1),
(1338, 90, 'Gaoual', 'GAO', 1),
(1339, 90, 'Gueckedou', 'GCD', 1),
(1340, 90, 'Kankan', 'KNK', 1),
(1341, 90, 'Kerouane', 'KRN', 1),
(1342, 90, 'Kindia', 'KND', 1),
(1343, 90, 'Kissidougou', 'KSD', 1),
(1344, 90, 'Koubia', 'KBA', 1),
(1345, 90, 'Koundara', 'KDA', 1),
(1346, 90, 'Kouroussa', 'KRA', 1),
(1347, 90, 'Labe', 'LAB', 1),
(1348, 90, 'Lelouma', 'LLM', 1),
(1349, 90, 'Lola', 'LOL', 1),
(1350, 90, 'Macenta', 'MCT', 1),
(1351, 90, 'Mali', 'MAL', 1),
(1352, 90, 'Mamou', 'MAM', 1),
(1353, 90, 'Mandiana', 'MAN', 1),
(1354, 90, 'Nzerekore', 'NZR', 1),
(1355, 90, 'Pita', 'PIT', 1),
(1356, 90, 'Siguiri', 'SIG', 1),
(1357, 90, 'Telimele', 'TLM', 1),
(1358, 90, 'Tougue', 'TOG', 1),
(1359, 90, 'Yomou', 'YOM', 1),
(1360, 91, 'Bafata Region', 'BF', 1),
(1361, 91, 'Biombo Region', 'BB', 1),
(1362, 91, 'Bissau Region', 'BS', 1),
(1363, 91, 'Bolama Region', 'BL', 1),
(1364, 91, 'Cacheu Region', 'CA', 1),
(1365, 91, 'Gabu Region', 'GA', 1),
(1366, 91, 'Oio Region', 'OI', 1),
(1367, 91, 'Quinara Region', 'QU', 1),
(1368, 91, 'Tombali Region', 'TO', 1),
(1369, 92, 'Barima-Waini', 'BW', 1),
(1370, 92, 'Cuyuni-Mazaruni', 'CM', 1),
(1371, 92, 'Demerara-Mahaica', 'DM', 1),
(1372, 92, 'East Berbice-Corentyne', 'EC', 1),
(1373, 92, 'Essequibo Islands-West Demerara', 'EW', 1),
(1374, 92, 'Mahaica-Berbice', 'MB', 1),
(1375, 92, 'Pomeroon-Supenaam', 'PM', 1),
(1376, 92, 'Potaro-Siparuni', 'PI', 1),
(1377, 92, 'Upper Demerara-Berbice', 'UD', 1),
(1378, 92, 'Upper Takutu-Upper Essequibo', 'UT', 1),
(1379, 93, 'Artibonite', 'AR', 1),
(1380, 93, 'Centre', 'CE', 1),
(1381, 93, 'Grand''Anse', 'GA', 1),
(1382, 93, 'Nord', 'ND', 1),
(1383, 93, 'Nord-Est', 'NE', 1),
(1384, 93, 'Nord-Ouest', 'NO', 1),
(1385, 93, 'Ouest', 'OU', 1),
(1386, 93, 'Sud', 'SD', 1),
(1387, 93, 'Sud-Est', 'SE', 1),
(1388, 94, 'Flat Island', 'F', 1),
(1389, 94, 'McDonald Island', 'M', 1),
(1390, 94, 'Shag Island', 'S', 1),
(1391, 94, 'Heard Island', 'H', 1),
(1392, 95, 'Atlantida', 'AT', 1),
(1393, 95, 'Choluteca', 'CH', 1),
(1394, 95, 'Colon', 'CL', 1),
(1395, 95, 'Comayagua', 'CM', 1),
(1396, 95, 'Copan', 'CP', 1),
(1397, 95, 'Cortes', 'CR', 1),
(1398, 95, 'El Paraiso', 'PA', 1),
(1399, 95, 'Francisco Morazan', 'FM', 1),
(1400, 95, 'Gracias a Dios', 'GD', 1),
(1401, 95, 'Intibuca', 'IN', 1),
(1402, 95, 'Islas de la Bahia (Bay Islands)', 'IB', 1),
(1403, 95, 'La Paz', 'PZ', 1),
(1404, 95, 'Lempira', 'LE', 1),
(1405, 95, 'Ocotepeque', 'OC', 1),
(1406, 95, 'Olancho', 'OL', 1),
(1407, 95, 'Santa Barbara', 'SB', 1),
(1408, 95, 'Valle', 'VA', 1),
(1409, 95, 'Yoro', 'YO', 1),
(1410, 96, 'Central and Western Hong Kong Island', 'HCW', 1),
(1411, 96, 'Eastern Hong Kong Island', 'HEA', 1),
(1412, 96, 'Southern Hong Kong Island', 'HSO', 1),
(1413, 96, 'Wan Chai Hong Kong Island', 'HWC', 1),
(1414, 96, 'Kowloon City Kowloon', 'KKC', 1),
(1415, 96, 'Kwun Tong Kowloon', 'KKT', 1),
(1416, 96, 'Sham Shui Po Kowloon', 'KSS', 1),
(1417, 96, 'Wong Tai Sin Kowloon', 'KWT', 1),
(1418, 96, 'Yau Tsim Mong Kowloon', 'KYT', 1),
(1419, 96, 'Islands New Territories', 'NIS', 1),
(1420, 96, 'Kwai Tsing New Territories', 'NKT', 1),
(1421, 96, 'North New Territories', 'NNO', 1),
(1422, 96, 'Sai Kung New Territories', 'NSK', 1),
(1423, 96, 'Sha Tin New Territories', 'NST', 1),
(1424, 96, 'Tai Po New Territories', 'NTP', 1),
(1425, 96, 'Tsuen Wan New Territories', 'NTW', 1),
(1426, 96, 'Tuen Mun New Territories', 'NTM', 1),
(1427, 96, 'Yuen Long New Territories', 'NYL', 1),
(1428, 97, 'Bacs-Kiskun', 'BK', 1),
(1429, 97, 'Baranya', 'BA', 1),
(1430, 97, 'Bekes', 'BE', 1),
(1431, 97, 'Bekescsaba', 'BS', 1),
(1432, 97, 'Borsod-Abauj-Zemplen', 'BZ', 1),
(1433, 97, 'Budapest', 'BU', 1),
(1434, 97, 'Csongrad', 'CS', 1),
(1435, 97, 'Debrecen', 'DE', 1),
(1436, 97, 'Dunaujvaros', 'DU', 1),
(1437, 97, 'Eger', 'EG', 1),
(1438, 97, 'Fejer', 'FE', 1),
(1439, 97, 'Gyor', 'GY', 1),
(1440, 97, 'Gyor-Moson-Sopron', 'GM', 1),
(1441, 97, 'Hajdu-Bihar', 'HB', 1),
(1442, 97, 'Heves', 'HE', 1),
(1443, 97, 'Hodmezovasarhely', 'HO', 1),
(1444, 97, 'Jasz-Nagykun-Szolnok', 'JN', 1),
(1445, 97, 'Kaposvar', 'KA', 1),
(1446, 97, 'Kecskemet', 'KE', 1),
(1447, 97, 'Komarom-Esztergom', 'KO', 1),
(1448, 97, 'Miskolc', 'MI', 1),
(1449, 97, 'Nagykanizsa', 'NA', 1),
(1450, 97, 'Nograd', 'NO', 1),
(1451, 97, 'Nyiregyhaza', 'NY', 1),
(1452, 97, 'Pecs', 'PE', 1),
(1453, 97, 'Pest', 'PS', 1),
(1454, 97, 'Somogy', 'SO', 1),
(1455, 97, 'Sopron', 'SP', 1),
(1456, 97, 'Szabolcs-Szatmar-Bereg', 'SS', 1),
(1457, 97, 'Szeged', 'SZ', 1),
(1458, 97, 'Szekesfehervar', 'SE', 1),
(1459, 97, 'Szolnok', 'SL', 1),
(1460, 97, 'Szombathely', 'SM', 1),
(1461, 97, 'Tatabanya', 'TA', 1),
(1462, 97, 'Tolna', 'TO', 1),
(1463, 97, 'Vas', 'VA', 1),
(1464, 97, 'Veszprem', 'VE', 1),
(1465, 97, 'Zala', 'ZA', 1),
(1466, 97, 'Zalaegerszeg', 'ZZ', 1),
(1467, 98, 'Austurland', 'AL', 1),
(1468, 98, 'Hofuoborgarsvaeoi', 'HF', 1),
(1469, 98, 'Norourland eystra', 'NE', 1),
(1470, 98, 'Norourland vestra', 'NV', 1),
(1471, 98, 'Suourland', 'SL', 1),
(1472, 98, 'Suournes', 'SN', 1),
(1473, 98, 'Vestfiroir', 'VF', 1),
(1474, 98, 'Vesturland', 'VL', 1),
(1475, 99, 'Andaman and Nicobar Islands', 'AN', 1),
(1476, 99, 'Andhra Pradesh', 'AP', 1),
(1477, 99, 'Arunachal Pradesh', 'AR', 1),
(1478, 99, 'Assam', 'AS', 1),
(1479, 99, 'Bihar', 'BI', 1),
(1480, 99, 'Chandigarh', 'CH', 1),
(1481, 99, 'Dadra and Nagar Haveli', 'DA', 1),
(1482, 99, 'Daman and Diu', 'DM', 1),
(1483, 99, 'Delhi', 'DE', 1),
(1484, 99, 'Goa', 'GO', 1),
(1485, 99, 'Gujarat', 'GU', 1),
(1486, 99, 'Haryana', 'HA', 1),
(1487, 99, 'Himachal Pradesh', 'HP', 1),
(1488, 99, 'Jammu and Kashmir', 'JA', 1),
(1489, 99, 'Karnataka', 'KA', 1),
(1490, 99, 'Kerala', 'KE', 1),
(1491, 99, 'Lakshadweep Islands', 'LI', 1),
(1492, 99, 'Madhya Pradesh', 'MP', 1),
(1493, 99, 'Maharashtra', 'MA', 1),
(1494, 99, 'Manipur', 'MN', 1),
(1495, 99, 'Meghalaya', 'ME', 1),
(1496, 99, 'Mizoram', 'MI', 1),
(1497, 99, 'Nagaland', 'NA', 1),
(1498, 99, 'Orissa', 'OR', 1),
(1499, 99, 'Pondicherry', 'PO', 1),
(1500, 99, 'Punjab', 'PU', 1),
(1501, 99, 'Rajasthan', 'RA', 1),
(1502, 99, 'Sikkim', 'SI', 1),
(1503, 99, 'Tamil Nadu', 'TN', 1),
(1504, 99, 'Tripura', 'TR', 1),
(1505, 99, 'Uttar Pradesh', 'UP', 1),
(1506, 99, 'West Bengal', 'WB', 1),
(1507, 100, 'Aceh', 'AC', 1),
(1508, 100, 'Bali', 'BA', 1),
(1509, 100, 'Banten', 'BT', 1),
(1510, 100, 'Bengkulu', 'BE', 1),
(1511, 100, 'BoDeTaBek', 'BD', 1),
(1512, 100, 'Gorontalo', 'GO', 1),
(1513, 100, 'Jakarta Raya', 'JK', 1),
(1514, 100, 'Jambi', 'JA', 1),
(1515, 100, 'Jawa Barat', 'JB', 1),
(1516, 100, 'Jawa Tengah', 'JT', 1),
(1517, 100, 'Jawa Timur', 'JI', 1),
(1518, 100, 'Kalimantan Barat', 'KB', 1),
(1519, 100, 'Kalimantan Selatan', 'KS', 1),
(1520, 100, 'Kalimantan Tengah', 'KT', 1),
(1521, 100, 'Kalimantan Timur', 'KI', 1),
(1522, 100, 'Kepulauan Bangka Belitung', 'BB', 1),
(1523, 100, 'Lampung', 'LA', 1),
(1524, 100, 'Maluku', 'MA', 1),
(1525, 100, 'Maluku Utara', 'MU', 1),
(1526, 100, 'Nusa Tenggara Barat', 'NB', 1),
(1527, 100, 'Nusa Tenggara Timur', 'NT', 1),
(1528, 100, 'Papua', 'PA', 1),
(1529, 100, 'Riau', 'RI', 1),
(1530, 100, 'Sulawesi Selatan', 'SN', 1),
(1531, 100, 'Sulawesi Tengah', 'ST', 1),
(1532, 100, 'Sulawesi Tenggara', 'SG', 1),
(1533, 100, 'Sulawesi Utara', 'SA', 1),
(1534, 100, 'Sumatera Barat', 'SB', 1),
(1535, 100, 'Sumatera Selatan', 'SS', 1),
(1536, 100, 'Sumatera Utara', 'SU', 1),
(1537, 100, 'Yogyakarta', 'YO', 1),
(1538, 101, 'Tehran', 'TEH', 1),
(1539, 101, 'Qom', 'QOM', 1),
(1540, 101, 'Markazi', 'MKZ', 1),
(1541, 101, 'Qazvin', 'QAZ', 1),
(1542, 101, 'Gilan', 'GIL', 1),
(1543, 101, 'Ardabil', 'ARD', 1),
(1544, 101, 'Zanjan', 'ZAN', 1),
(1545, 101, 'East Azarbaijan', 'EAZ', 1),
(1546, 101, 'West Azarbaijan', 'WEZ', 1),
(1547, 101, 'Kurdistan', 'KRD', 1),
(1548, 101, 'Hamadan', 'HMD', 1),
(1549, 101, 'Kermanshah', 'KRM', 1),
(1550, 101, 'Ilam', 'ILM', 1),
(1551, 101, 'Lorestan', 'LRS', 1),
(1552, 101, 'Khuzestan', 'KZT', 1),
(1553, 101, 'Chahar Mahaal and Bakhtiari', 'CMB', 1),
(1554, 101, 'Kohkiluyeh and Buyer Ahmad', 'KBA', 1),
(1555, 101, 'Bushehr', 'BSH', 1),
(1556, 101, 'Fars', 'FAR', 1),
(1557, 101, 'Hormozgan', 'HRM', 1),
(1558, 101, 'Sistan and Baluchistan', 'SBL', 1);
INSERT INTO `zone` (`zone_id`, `country_id`, `name`, `code`, `status`) VALUES
(1559, 101, 'Kerman', 'KRB', 1),
(1560, 101, 'Yazd', 'YZD', 1),
(1561, 101, 'Esfahan', 'EFH', 1),
(1562, 101, 'Semnan', 'SMN', 1),
(1563, 101, 'Mazandaran', 'MZD', 1),
(1564, 101, 'Golestan', 'GLS', 1),
(1565, 101, 'North Khorasan', 'NKH', 1),
(1566, 101, 'Razavi Khorasan', 'RKH', 1),
(1567, 101, 'South Khorasan', 'SKH', 1),
(1568, 102, 'Baghdad', 'BD', 1),
(1569, 102, 'Salah ad Din', 'SD', 1),
(1570, 102, 'Diyala', 'DY', 1),
(1571, 102, 'Wasit', 'WS', 1),
(1572, 102, 'Maysan', 'MY', 1),
(1573, 102, 'Al Basrah', 'BA', 1),
(1574, 102, 'Dhi Qar', 'DQ', 1),
(1575, 102, 'Al Muthanna', 'MU', 1),
(1576, 102, 'Al Qadisyah', 'QA', 1),
(1577, 102, 'Babil', 'BB', 1),
(1578, 102, 'Al Karbala', 'KB', 1),
(1579, 102, 'An Najaf', 'NJ', 1),
(1580, 102, 'Al Anbar', 'AB', 1),
(1581, 102, 'Ninawa', 'NN', 1),
(1582, 102, 'Dahuk', 'DH', 1),
(1583, 102, 'Arbil', 'AL', 1),
(1584, 102, 'At Ta''mim', 'TM', 1),
(1585, 102, 'As Sulaymaniyah', 'SL', 1),
(1586, 103, 'Carlow', 'CA', 1),
(1587, 103, 'Cavan', 'CV', 1),
(1588, 103, 'Clare', 'CL', 1),
(1589, 103, 'Cork', 'CO', 1),
(1590, 103, 'Donegal', 'DO', 1),
(1591, 103, 'Dublin', 'DU', 1),
(1592, 103, 'Galway', 'GA', 1),
(1593, 103, 'Kerry', 'KE', 1),
(1594, 103, 'Kildare', 'KI', 1),
(1595, 103, 'Kilkenny', 'KL', 1),
(1596, 103, 'Laois', 'LA', 1),
(1597, 103, 'Leitrim', 'LE', 1),
(1598, 103, 'Limerick', 'LI', 1),
(1599, 103, 'Longford', 'LO', 1),
(1600, 103, 'Louth', 'LU', 1),
(1601, 103, 'Mayo', 'MA', 1),
(1602, 103, 'Meath', 'ME', 1),
(1603, 103, 'Monaghan', 'MO', 1),
(1604, 103, 'Offaly', 'OF', 1),
(1605, 103, 'Roscommon', 'RO', 1),
(1606, 103, 'Sligo', 'SL', 1),
(1607, 103, 'Tipperary', 'TI', 1),
(1608, 103, 'Waterford', 'WA', 1),
(1609, 103, 'Westmeath', 'WE', 1),
(1610, 103, 'Wexford', 'WX', 1),
(1611, 103, 'Wicklow', 'WI', 1),
(1612, 104, 'Be''er Sheva', 'BS', 1),
(1613, 104, 'Bika''at Hayarden', 'BH', 1),
(1614, 104, 'Eilat and Arava', 'EA', 1),
(1615, 104, 'Galil', 'GA', 1),
(1616, 104, 'Haifa', 'HA', 1),
(1617, 104, 'Jehuda Mountains', 'JM', 1),
(1618, 104, 'Jerusalem', 'JE', 1),
(1619, 104, 'Negev', 'NE', 1),
(1620, 104, 'Semaria', 'SE', 1),
(1621, 104, 'Sharon', 'SH', 1),
(1622, 104, 'Tel Aviv (Gosh Dan)', 'TA', 1),
(3860, 105, 'Caltanissetta', 'CL', 1),
(3842, 105, 'Agrigento', 'AG', 1),
(3843, 105, 'Alessandria', 'AL', 1),
(3844, 105, 'Ancona', 'AN', 1),
(3845, 105, 'Aosta', 'AO', 1),
(3846, 105, 'Arezzo', 'AR', 1),
(3847, 105, 'Ascoli Piceno', 'AP', 1),
(3848, 105, 'Asti', 'AT', 1),
(3849, 105, 'Avellino', 'AV', 1),
(3850, 105, 'Bari', 'BA', 1),
(3851, 105, 'Belluno', 'BL', 1),
(3852, 105, 'Benevento', 'BN', 1),
(3853, 105, 'Bergamo', 'BG', 1),
(3854, 105, 'Biella', 'BI', 1),
(3855, 105, 'Bologna', 'BO', 1),
(3856, 105, 'Bolzano', 'BZ', 1),
(3857, 105, 'Brescia', 'BS', 1),
(3858, 105, 'Brindisi', 'BR', 1),
(3859, 105, 'Cagliari', 'CA', 1),
(1643, 106, 'Clarendon Parish', 'CLA', 1),
(1644, 106, 'Hanover Parish', 'HAN', 1),
(1645, 106, 'Kingston Parish', 'KIN', 1),
(1646, 106, 'Manchester Parish', 'MAN', 1),
(1647, 106, 'Portland Parish', 'POR', 1),
(1648, 106, 'Saint Andrew Parish', 'AND', 1),
(1649, 106, 'Saint Ann Parish', 'ANN', 1),
(1650, 106, 'Saint Catherine Parish', 'CAT', 1),
(1651, 106, 'Saint Elizabeth Parish', 'ELI', 1),
(1652, 106, 'Saint James Parish', 'JAM', 1),
(1653, 106, 'Saint Mary Parish', 'MAR', 1),
(1654, 106, 'Saint Thomas Parish', 'THO', 1),
(1655, 106, 'Trelawny Parish', 'TRL', 1),
(1656, 106, 'Westmoreland Parish', 'WML', 1),
(1657, 107, 'Aichi', 'AI', 1),
(1658, 107, 'Akita', 'AK', 1),
(1659, 107, 'Aomori', 'AO', 1),
(1660, 107, 'Chiba', 'CH', 1),
(1661, 107, 'Ehime', 'EH', 1),
(1662, 107, 'Fukui', 'FK', 1),
(1663, 107, 'Fukuoka', 'FU', 1),
(1664, 107, 'Fukushima', 'FS', 1),
(1665, 107, 'Gifu', 'GI', 1),
(1666, 107, 'Gumma', 'GU', 1),
(1667, 107, 'Hiroshima', 'HI', 1),
(1668, 107, 'Hokkaido', 'HO', 1),
(1669, 107, 'Hyogo', 'HY', 1),
(1670, 107, 'Ibaraki', 'IB', 1),
(1671, 107, 'Ishikawa', 'IS', 1),
(1672, 107, 'Iwate', 'IW', 1),
(1673, 107, 'Kagawa', 'KA', 1),
(1674, 107, 'Kagoshima', 'KG', 1),
(1675, 107, 'Kanagawa', 'KN', 1),
(1676, 107, 'Kochi', 'KO', 1),
(1677, 107, 'Kumamoto', 'KU', 1),
(1678, 107, 'Kyoto', 'KY', 1),
(1679, 107, 'Mie', 'MI', 1),
(1680, 107, 'Miyagi', 'MY', 1),
(1681, 107, 'Miyazaki', 'MZ', 1),
(1682, 107, 'Nagano', 'NA', 1),
(1683, 107, 'Nagasaki', 'NG', 1),
(1684, 107, 'Nara', 'NR', 1),
(1685, 107, 'Niigata', 'NI', 1),
(1686, 107, 'Oita', 'OI', 1),
(1687, 107, 'Okayama', 'OK', 1),
(1688, 107, 'Okinawa', 'ON', 1),
(1689, 107, 'Osaka', 'OS', 1),
(1690, 107, 'Saga', 'SA', 1),
(1691, 107, 'Saitama', 'SI', 1),
(1692, 107, 'Shiga', 'SH', 1),
(1693, 107, 'Shimane', 'SM', 1),
(1694, 107, 'Shizuoka', 'SZ', 1),
(1695, 107, 'Tochigi', 'TO', 1),
(1696, 107, 'Tokushima', 'TS', 1),
(1697, 107, 'Tokyo', 'TK', 1),
(1698, 107, 'Tottori', 'TT', 1),
(1699, 107, 'Toyama', 'TY', 1),
(1700, 107, 'Wakayama', 'WA', 1),
(1701, 107, 'Yamagata', 'YA', 1),
(1702, 107, 'Yamaguchi', 'YM', 1),
(1703, 107, 'Yamanashi', 'YN', 1),
(1704, 108, '''Amman', 'AM', 1),
(1705, 108, 'Ajlun', 'AJ', 1),
(1706, 108, 'Al ''Aqabah', 'AA', 1),
(1707, 108, 'Al Balqa''', 'AB', 1),
(1708, 108, 'Al Karak', 'AK', 1),
(1709, 108, 'Al Mafraq', 'AL', 1),
(1710, 108, 'At Tafilah', 'AT', 1),
(1711, 108, 'Az Zarqa''', 'AZ', 1),
(1712, 108, 'Irbid', 'IR', 1),
(1713, 108, 'Jarash', 'JA', 1),
(1714, 108, 'Ma''an', 'MA', 1),
(1715, 108, 'Madaba', 'MD', 1),
(1716, 109, 'Almaty', 'AL', 1),
(1717, 109, 'Almaty City', 'AC', 1),
(1718, 109, 'Aqmola', 'AM', 1),
(1719, 109, 'Aqtobe', 'AQ', 1),
(1720, 109, 'Astana City', 'AS', 1),
(1721, 109, 'Atyrau', 'AT', 1),
(1722, 109, 'Batys Qazaqstan', 'BA', 1),
(1723, 109, 'Bayqongyr City', 'BY', 1),
(1724, 109, 'Mangghystau', 'MA', 1),
(1725, 109, 'Ongtustik Qazaqstan', 'ON', 1),
(1726, 109, 'Pavlodar', 'PA', 1),
(1727, 109, 'Qaraghandy', 'QA', 1),
(1728, 109, 'Qostanay', 'QO', 1),
(1729, 109, 'Qyzylorda', 'QY', 1),
(1730, 109, 'Shyghys Qazaqstan', 'SH', 1),
(1731, 109, 'Soltustik Qazaqstan', 'SO', 1),
(1732, 109, 'Zhambyl', 'ZH', 1),
(1733, 110, 'Central', 'CE', 1),
(1734, 110, 'Coast', 'CO', 1),
(1735, 110, 'Eastern', 'EA', 1),
(1736, 110, 'Nairobi Area', 'NA', 1),
(1737, 110, 'North Eastern', 'NE', 1),
(1738, 110, 'Nyanza', 'NY', 1),
(1739, 110, 'Rift Valley', 'RV', 1),
(1740, 110, 'Western', 'WE', 1),
(1741, 111, 'Abaiang', 'AG', 1),
(1742, 111, 'Abemama', 'AM', 1),
(1743, 111, 'Aranuka', 'AK', 1),
(1744, 111, 'Arorae', 'AO', 1),
(1745, 111, 'Banaba', 'BA', 1),
(1746, 111, 'Beru', 'BE', 1),
(1747, 111, 'Butaritari', 'bT', 1),
(1748, 111, 'Kanton', 'KA', 1),
(1749, 111, 'Kiritimati', 'KR', 1),
(1750, 111, 'Kuria', 'KU', 1),
(1751, 111, 'Maiana', 'MI', 1),
(1752, 111, 'Makin', 'MN', 1),
(1753, 111, 'Marakei', 'ME', 1),
(1754, 111, 'Nikunau', 'NI', 1),
(1755, 111, 'Nonouti', 'NO', 1),
(1756, 111, 'Onotoa', 'ON', 1),
(1757, 111, 'Tabiteuea', 'TT', 1),
(1758, 111, 'Tabuaeran', 'TR', 1),
(1759, 111, 'Tamana', 'TM', 1),
(1760, 111, 'Tarawa', 'TW', 1),
(1761, 111, 'Teraina', 'TE', 1),
(1762, 112, 'Chagang-do', 'CHA', 1),
(1763, 112, 'Hamgyong-bukto', 'HAB', 1),
(1764, 112, 'Hamgyong-namdo', 'HAN', 1),
(1765, 112, 'Hwanghae-bukto', 'HWB', 1),
(1766, 112, 'Hwanghae-namdo', 'HWN', 1),
(1767, 112, 'Kangwon-do', 'KAN', 1),
(1768, 112, 'P''yongan-bukto', 'PYB', 1),
(1769, 112, 'P''yongan-namdo', 'PYN', 1),
(1770, 112, 'Ryanggang-do (Yanggang-do)', 'YAN', 1),
(1771, 112, 'Rason Directly Governed City', 'NAJ', 1),
(1772, 112, 'P''yongyang Special City', 'PYO', 1),
(1773, 113, 'Ch''ungch''ong-bukto', 'CO', 1),
(1774, 113, 'Ch''ungch''ong-namdo', 'CH', 1),
(1775, 113, 'Cheju-do', 'CD', 1),
(1776, 113, 'Cholla-bukto', 'CB', 1),
(1777, 113, 'Cholla-namdo', 'CN', 1),
(1778, 113, 'Inch''on-gwangyoksi', 'IG', 1),
(1779, 113, 'Kangwon-do', 'KA', 1),
(1780, 113, 'Kwangju-gwangyoksi', 'KG', 1),
(1781, 113, 'Kyonggi-do', 'KD', 1),
(1782, 113, 'Kyongsang-bukto', 'KB', 1),
(1783, 113, 'Kyongsang-namdo', 'KN', 1),
(1784, 113, 'Pusan-gwangyoksi', 'PG', 1),
(1785, 113, 'Soul-t''ukpyolsi', 'SO', 1),
(1786, 113, 'Taegu-gwangyoksi', 'TA', 1),
(1787, 113, 'Taejon-gwangyoksi', 'TG', 1),
(1788, 114, 'Al ''Asimah', 'AL', 1),
(1789, 114, 'Al Ahmadi', 'AA', 1),
(1790, 114, 'Al Farwaniyah', 'AF', 1),
(1791, 114, 'Al Jahra''', 'AJ', 1),
(1792, 114, 'Hawalli', 'HA', 1),
(1793, 115, 'Bishkek', 'GB', 1),
(1794, 115, 'Batken', 'B', 1),
(1795, 115, 'Chu', 'C', 1),
(1796, 115, 'Jalal-Abad', 'J', 1),
(1797, 115, 'Naryn', 'N', 1),
(1798, 115, 'Osh', 'O', 1),
(1799, 115, 'Talas', 'T', 1),
(1800, 115, 'Ysyk-Kol', 'Y', 1),
(1801, 116, 'Vientiane', 'VT', 1),
(1802, 116, 'Attapu', 'AT', 1),
(1803, 116, 'Bokeo', 'BK', 1),
(1804, 116, 'Bolikhamxai', 'BL', 1),
(1805, 116, 'Champasak', 'CH', 1),
(1806, 116, 'Houaphan', 'HO', 1),
(1807, 116, 'Khammouan', 'KH', 1),
(1808, 116, 'Louang Namtha', 'LM', 1),
(1809, 116, 'Louangphabang', 'LP', 1),
(1810, 116, 'Oudomxai', 'OU', 1),
(1811, 116, 'Phongsali', 'PH', 1),
(1812, 116, 'Salavan', 'SL', 1),
(1813, 116, 'Savannakhet', 'SV', 1),
(1814, 116, 'Vientiane', 'VI', 1),
(1815, 116, 'Xaignabouli', 'XA', 1),
(1816, 116, 'Xekong', 'XE', 1),
(1817, 116, 'Xiangkhoang', 'XI', 1),
(1818, 116, 'Xaisomboun', 'XN', 1),
(1819, 117, 'Aizkraukles Rajons', 'AIZ', 1),
(1820, 117, 'Aluksnes Rajons', 'ALU', 1),
(1821, 117, 'Balvu Rajons', 'BAL', 1),
(1822, 117, 'Bauskas Rajons', 'BAU', 1),
(1823, 117, 'Cesu Rajons', 'CES', 1),
(1824, 117, 'Daugavpils Rajons', 'DGR', 1),
(1825, 117, 'Dobeles Rajons', 'DOB', 1),
(1826, 117, 'Gulbenes Rajons', 'GUL', 1),
(1827, 117, 'Jekabpils Rajons', 'JEK', 1),
(1828, 117, 'Jelgavas Rajons', 'JGR', 1),
(1829, 117, 'Kraslavas Rajons', 'KRA', 1),
(1830, 117, 'Kuldigas Rajons', 'KUL', 1),
(1831, 117, 'Liepajas Rajons', 'LPR', 1),
(1832, 117, 'Limbazu Rajons', 'LIM', 1),
(1833, 117, 'Ludzas Rajons', 'LUD', 1),
(1834, 117, 'Madonas Rajons', 'MAD', 1),
(1835, 117, 'Ogres Rajons', 'OGR', 1),
(1836, 117, 'Preilu Rajons', 'PRE', 1),
(1837, 117, 'Rezeknes Rajons', 'RZR', 1),
(1838, 117, 'Rigas Rajons', 'RGR', 1),
(1839, 117, 'Saldus Rajons', 'SAL', 1),
(1840, 117, 'Talsu Rajons', 'TAL', 1),
(1841, 117, 'Tukuma Rajons', 'TUK', 1),
(1842, 117, 'Valkas Rajons', 'VLK', 1),
(1843, 117, 'Valmieras Rajons', 'VLM', 1),
(1844, 117, 'Ventspils Rajons', 'VSR', 1),
(1845, 117, 'Daugavpils', 'DGV', 1),
(1846, 117, 'Jelgava', 'JGV', 1),
(1847, 117, 'Jurmala', 'JUR', 1),
(1848, 117, 'Liepaja', 'LPK', 1),
(1849, 117, 'Rezekne', 'RZK', 1),
(1850, 117, 'Riga', 'RGA', 1),
(1851, 117, 'Ventspils', 'VSL', 1),
(1852, 119, 'Berea', 'BE', 1),
(1853, 119, 'Butha-Buthe', 'BB', 1),
(1854, 119, 'Leribe', 'LE', 1),
(1855, 119, 'Mafeteng', 'MF', 1),
(1856, 119, 'Maseru', 'MS', 1),
(1857, 119, 'Mohale''s Hoek', 'MH', 1),
(1858, 119, 'Mokhotlong', 'MK', 1),
(1859, 119, 'Qacha''s Nek', 'QN', 1),
(1860, 119, 'Quthing', 'QT', 1),
(1861, 119, 'Thaba-Tseka', 'TT', 1),
(1862, 120, 'Bomi', 'BI', 1),
(1863, 120, 'Bong', 'BG', 1),
(1864, 120, 'Grand Bassa', 'GB', 1),
(1865, 120, 'Grand Cape Mount', 'CM', 1),
(1866, 120, 'Grand Gedeh', 'GG', 1),
(1867, 120, 'Grand Kru', 'GK', 1),
(1868, 120, 'Lofa', 'LO', 1),
(1869, 120, 'Margibi', 'MG', 1),
(1870, 120, 'Maryland', 'ML', 1),
(1871, 120, 'Montserrado', 'MS', 1),
(1872, 120, 'Nimba', 'NB', 1),
(1873, 120, 'River Cess', 'RC', 1),
(1874, 120, 'Sinoe', 'SN', 1),
(1875, 121, 'Ajdabiya', 'AJ', 1),
(1876, 121, 'Al ''Aziziyah', 'AZ', 1),
(1877, 121, 'Al Fatih', 'FA', 1),
(1878, 121, 'Al Jabal al Akhdar', 'JA', 1),
(1879, 121, 'Al Jufrah', 'JU', 1),
(1880, 121, 'Al Khums', 'KH', 1),
(1881, 121, 'Al Kufrah', 'KU', 1),
(1882, 121, 'An Nuqat al Khams', 'NK', 1),
(1883, 121, 'Ash Shati''', 'AS', 1),
(1884, 121, 'Awbari', 'AW', 1),
(1885, 121, 'Az Zawiyah', 'ZA', 1),
(1886, 121, 'Banghazi', 'BA', 1),
(1887, 121, 'Darnah', 'DA', 1),
(1888, 121, 'Ghadamis', 'GD', 1),
(1889, 121, 'Gharyan', 'GY', 1),
(1890, 121, 'Misratah', 'MI', 1),
(1891, 121, 'Murzuq', 'MZ', 1),
(1892, 121, 'Sabha', 'SB', 1),
(1893, 121, 'Sawfajjin', 'SW', 1),
(1894, 121, 'Surt', 'SU', 1),
(1895, 121, 'Tarabulus (Tripoli)', 'TL', 1),
(1896, 121, 'Tarhunah', 'TH', 1),
(1897, 121, 'Tubruq', 'TU', 1),
(1898, 121, 'Yafran', 'YA', 1),
(1899, 121, 'Zlitan', 'ZL', 1),
(1900, 122, 'Vaduz', 'V', 1),
(1901, 122, 'Schaan', 'A', 1),
(1902, 122, 'Balzers', 'B', 1),
(1903, 122, 'Triesen', 'N', 1),
(1904, 122, 'Eschen', 'E', 1),
(1905, 122, 'Mauren', 'M', 1),
(1906, 122, 'Triesenberg', 'T', 1),
(1907, 122, 'Ruggell', 'R', 1),
(1908, 122, 'Gamprin', 'G', 1),
(1909, 122, 'Schellenberg', 'L', 1),
(1910, 122, 'Planken', 'P', 1),
(1911, 123, 'Alytus', 'AL', 1),
(1912, 123, 'Kaunas', 'KA', 1),
(1913, 123, 'Klaipeda', 'KL', 1),
(1914, 123, 'Marijampole', 'MA', 1),
(1915, 123, 'Panevezys', 'PA', 1),
(1916, 123, 'Siauliai', 'SI', 1),
(1917, 123, 'Taurage', 'TA', 1),
(1918, 123, 'Telsiai', 'TE', 1),
(1919, 123, 'Utena', 'UT', 1),
(1920, 123, 'Vilnius', 'VI', 1),
(1921, 124, 'Diekirch', 'DD', 1),
(1922, 124, 'Clervaux', 'DC', 1),
(1923, 124, 'Redange', 'DR', 1),
(1924, 124, 'Vianden', 'DV', 1),
(1925, 124, 'Wiltz', 'DW', 1),
(1926, 124, 'Grevenmacher', 'GG', 1),
(1927, 124, 'Echternach', 'GE', 1),
(1928, 124, 'Remich', 'GR', 1),
(1929, 124, 'Luxembourg', 'LL', 1),
(1930, 124, 'Capellen', 'LC', 1),
(1931, 124, 'Esch-sur-Alzette', 'LE', 1),
(1932, 124, 'Mersch', 'LM', 1),
(1933, 125, 'Our Lady Fatima Parish', 'OLF', 1),
(1934, 125, 'St. Anthony Parish', 'ANT', 1),
(1935, 125, 'St. Lazarus Parish', 'LAZ', 1),
(1936, 125, 'Cathedral Parish', 'CAT', 1),
(1937, 125, 'St. Lawrence Parish', 'LAW', 1),
(1938, 127, 'Antananarivo', 'AN', 1),
(1939, 127, 'Antsiranana', 'AS', 1),
(1940, 127, 'Fianarantsoa', 'FN', 1),
(1941, 127, 'Mahajanga', 'MJ', 1),
(1942, 127, 'Toamasina', 'TM', 1),
(1943, 127, 'Toliara', 'TL', 1),
(1944, 128, 'Balaka', 'BLK', 1),
(1945, 128, 'Blantyre', 'BLT', 1),
(1946, 128, 'Chikwawa', 'CKW', 1),
(1947, 128, 'Chiradzulu', 'CRD', 1),
(1948, 128, 'Chitipa', 'CTP', 1),
(1949, 128, 'Dedza', 'DDZ', 1),
(1950, 128, 'Dowa', 'DWA', 1),
(1951, 128, 'Karonga', 'KRG', 1),
(1952, 128, 'Kasungu', 'KSG', 1),
(1953, 128, 'Likoma', 'LKM', 1),
(1954, 128, 'Lilongwe', 'LLG', 1),
(1955, 128, 'Machinga', 'MCG', 1),
(1956, 128, 'Mangochi', 'MGC', 1),
(1957, 128, 'Mchinji', 'MCH', 1),
(1958, 128, 'Mulanje', 'MLJ', 1),
(1959, 128, 'Mwanza', 'MWZ', 1),
(1960, 128, 'Mzimba', 'MZM', 1),
(1961, 128, 'Ntcheu', 'NTU', 1),
(1962, 128, 'Nkhata Bay', 'NKB', 1),
(1963, 128, 'Nkhotakota', 'NKH', 1),
(1964, 128, 'Nsanje', 'NSJ', 1),
(1965, 128, 'Ntchisi', 'NTI', 1),
(1966, 128, 'Phalombe', 'PHL', 1),
(1967, 128, 'Rumphi', 'RMP', 1),
(1968, 128, 'Salima', 'SLM', 1),
(1969, 128, 'Thyolo', 'THY', 1),
(1970, 128, 'Zomba', 'ZBA', 1),
(1971, 129, 'Johor', 'JO', 1),
(1972, 129, 'Kedah', 'KE', 1),
(1973, 129, 'Kelantan', 'KL', 1),
(1974, 129, 'Labuan', 'LA', 1),
(1975, 129, 'Melaka', 'ME', 1),
(1976, 129, 'Negeri Sembilan', 'NS', 1),
(1977, 129, 'Pahang', 'PA', 1),
(1978, 129, 'Perak', 'PE', 1),
(1979, 129, 'Perlis', 'PR', 1),
(1980, 129, 'Pulau Pinang', 'PP', 1),
(1981, 129, 'Sabah', 'SA', 1),
(1982, 129, 'Sarawak', 'SR', 1),
(1983, 129, 'Selangor', 'SE', 1),
(1984, 129, 'Terengganu', 'TE', 1),
(1985, 129, 'Wilayah Persekutuan', 'WP', 1),
(1986, 130, 'Thiladhunmathi Uthuru', 'THU', 1),
(1987, 130, 'Thiladhunmathi Dhekunu', 'THD', 1),
(1988, 130, 'Miladhunmadulu Uthuru', 'MLU', 1),
(1989, 130, 'Miladhunmadulu Dhekunu', 'MLD', 1),
(1990, 130, 'Maalhosmadulu Uthuru', 'MAU', 1),
(1991, 130, 'Maalhosmadulu Dhekunu', 'MAD', 1),
(1992, 130, 'Faadhippolhu', 'FAA', 1),
(1993, 130, 'Male Atoll', 'MAA', 1),
(1994, 130, 'Ari Atoll Uthuru', 'AAU', 1),
(1995, 130, 'Ari Atoll Dheknu', 'AAD', 1),
(1996, 130, 'Felidhe Atoll', 'FEA', 1),
(1997, 130, 'Mulaku Atoll', 'MUA', 1),
(1998, 130, 'Nilandhe Atoll Uthuru', 'NAU', 1),
(1999, 130, 'Nilandhe Atoll Dhekunu', 'NAD', 1),
(2000, 130, 'Kolhumadulu', 'KLH', 1),
(2001, 130, 'Hadhdhunmathi', 'HDH', 1),
(2002, 130, 'Huvadhu Atoll Uthuru', 'HAU', 1),
(2003, 130, 'Huvadhu Atoll Dhekunu', 'HAD', 1),
(2004, 130, 'Fua Mulaku', 'FMU', 1),
(2005, 130, 'Addu', 'ADD', 1),
(2006, 131, 'Gao', 'GA', 1),
(2007, 131, 'Kayes', 'KY', 1),
(2008, 131, 'Kidal', 'KD', 1),
(2009, 131, 'Koulikoro', 'KL', 1),
(2010, 131, 'Mopti', 'MP', 1),
(2011, 131, 'Segou', 'SG', 1),
(2012, 131, 'Sikasso', 'SK', 1),
(2013, 131, 'Tombouctou', 'TB', 1),
(2014, 131, 'Bamako Capital District', 'CD', 1),
(2015, 132, 'Attard', 'ATT', 1),
(2016, 132, 'Balzan', 'BAL', 1),
(2017, 132, 'Birgu', 'BGU', 1),
(2018, 132, 'Birkirkara', 'BKK', 1),
(2019, 132, 'Birzebbuga', 'BRZ', 1),
(2020, 132, 'Bormla', 'BOR', 1),
(2021, 132, 'Dingli', 'DIN', 1),
(2022, 132, 'Fgura', 'FGU', 1),
(2023, 132, 'Floriana', 'FLO', 1),
(2024, 132, 'Gudja', 'GDJ', 1),
(2025, 132, 'Gzira', 'GZR', 1),
(2026, 132, 'Gargur', 'GRG', 1),
(2027, 132, 'Gaxaq', 'GXQ', 1),
(2028, 132, 'Hamrun', 'HMR', 1),
(2029, 132, 'Iklin', 'IKL', 1),
(2030, 132, 'Isla', 'ISL', 1),
(2031, 132, 'Kalkara', 'KLK', 1),
(2032, 132, 'Kirkop', 'KRK', 1),
(2033, 132, 'Lija', 'LIJ', 1),
(2034, 132, 'Luqa', 'LUQ', 1),
(2035, 132, 'Marsa', 'MRS', 1),
(2036, 132, 'Marsaskala', 'MKL', 1),
(2037, 132, 'Marsaxlokk', 'MXL', 1),
(2038, 132, 'Mdina', 'MDN', 1),
(2039, 132, 'Melliea', 'MEL', 1),
(2040, 132, 'Mgarr', 'MGR', 1),
(2041, 132, 'Mosta', 'MST', 1),
(2042, 132, 'Mqabba', 'MQA', 1),
(2043, 132, 'Msida', 'MSI', 1),
(2044, 132, 'Mtarfa', 'MTF', 1),
(2045, 132, 'Naxxar', 'NAX', 1),
(2046, 132, 'Paola', 'PAO', 1),
(2047, 132, 'Pembroke', 'PEM', 1),
(2048, 132, 'Pieta', 'PIE', 1),
(2049, 132, 'Qormi', 'QOR', 1),
(2050, 132, 'Qrendi', 'QRE', 1),
(2051, 132, 'Rabat', 'RAB', 1),
(2052, 132, 'Safi', 'SAF', 1),
(2053, 132, 'San Giljan', 'SGI', 1),
(2054, 132, 'Santa Lucija', 'SLU', 1),
(2055, 132, 'San Pawl il-Bahar', 'SPB', 1),
(2056, 132, 'San Gwann', 'SGW', 1),
(2057, 132, 'Santa Venera', 'SVE', 1),
(2058, 132, 'Siggiewi', 'SIG', 1),
(2059, 132, 'Sliema', 'SLM', 1),
(2060, 132, 'Swieqi', 'SWQ', 1),
(2061, 132, 'Ta Xbiex', 'TXB', 1),
(2062, 132, 'Tarxien', 'TRX', 1),
(2063, 132, 'Valletta', 'VLT', 1),
(2064, 132, 'Xgajra', 'XGJ', 1),
(2065, 132, 'Zabbar', 'ZBR', 1),
(2066, 132, 'Zebbug', 'ZBG', 1),
(2067, 132, 'Zejtun', 'ZJT', 1),
(2068, 132, 'Zurrieq', 'ZRQ', 1),
(2069, 132, 'Fontana', 'FNT', 1),
(2070, 132, 'Ghajnsielem', 'GHJ', 1),
(2071, 132, 'Gharb', 'GHR', 1),
(2072, 132, 'Ghasri', 'GHS', 1),
(2073, 132, 'Kercem', 'KRC', 1),
(2074, 132, 'Munxar', 'MUN', 1),
(2075, 132, 'Nadur', 'NAD', 1),
(2076, 132, 'Qala', 'QAL', 1),
(2077, 132, 'Victoria', 'VIC', 1),
(2078, 132, 'San Lawrenz', 'SLA', 1),
(2079, 132, 'Sannat', 'SNT', 1),
(2080, 132, 'Xagra', 'ZAG', 1),
(2081, 132, 'Xewkija', 'XEW', 1),
(2082, 132, 'Zebbug', 'ZEB', 1),
(2083, 133, 'Ailinginae', 'ALG', 1),
(2084, 133, 'Ailinglaplap', 'ALL', 1),
(2085, 133, 'Ailuk', 'ALK', 1),
(2086, 133, 'Arno', 'ARN', 1),
(2087, 133, 'Aur', 'AUR', 1),
(2088, 133, 'Bikar', 'BKR', 1),
(2089, 133, 'Bikini', 'BKN', 1),
(2090, 133, 'Bokak', 'BKK', 1),
(2091, 133, 'Ebon', 'EBN', 1),
(2092, 133, 'Enewetak', 'ENT', 1),
(2093, 133, 'Erikub', 'EKB', 1),
(2094, 133, 'Jabat', 'JBT', 1),
(2095, 133, 'Jaluit', 'JLT', 1),
(2096, 133, 'Jemo', 'JEM', 1),
(2097, 133, 'Kili', 'KIL', 1),
(2098, 133, 'Kwajalein', 'KWJ', 1),
(2099, 133, 'Lae', 'LAE', 1),
(2100, 133, 'Lib', 'LIB', 1),
(2101, 133, 'Likiep', 'LKP', 1),
(2102, 133, 'Majuro', 'MJR', 1),
(2103, 133, 'Maloelap', 'MLP', 1),
(2104, 133, 'Mejit', 'MJT', 1),
(2105, 133, 'Mili', 'MIL', 1),
(2106, 133, 'Namorik', 'NMK', 1),
(2107, 133, 'Namu', 'NAM', 1),
(2108, 133, 'Rongelap', 'RGL', 1),
(2109, 133, 'Rongrik', 'RGK', 1),
(2110, 133, 'Toke', 'TOK', 1),
(2111, 133, 'Ujae', 'UJA', 1),
(2112, 133, 'Ujelang', 'UJL', 1),
(2113, 133, 'Utirik', 'UTK', 1),
(2114, 133, 'Wotho', 'WTH', 1),
(2115, 133, 'Wotje', 'WTJ', 1),
(2116, 135, 'Adrar', 'AD', 1),
(2117, 135, 'Assaba', 'AS', 1),
(2118, 135, 'Brakna', 'BR', 1),
(2119, 135, 'Dakhlet Nouadhibou', 'DN', 1),
(2120, 135, 'Gorgol', 'GO', 1),
(2121, 135, 'Guidimaka', 'GM', 1),
(2122, 135, 'Hodh Ech Chargui', 'HC', 1),
(2123, 135, 'Hodh El Gharbi', 'HG', 1),
(2124, 135, 'Inchiri', 'IN', 1),
(2125, 135, 'Tagant', 'TA', 1),
(2126, 135, 'Tiris Zemmour', 'TZ', 1),
(2127, 135, 'Trarza', 'TR', 1),
(2128, 135, 'Nouakchott', 'NO', 1),
(2129, 136, 'Beau Bassin-Rose Hill', 'BR', 1),
(2130, 136, 'Curepipe', 'CU', 1),
(2131, 136, 'Port Louis', 'PU', 1),
(2132, 136, 'Quatre Bornes', 'QB', 1),
(2133, 136, 'Vacoas-Phoenix', 'VP', 1),
(2134, 136, 'Agalega Islands', 'AG', 1),
(2135, 136, 'Cargados Carajos Shoals (Saint Brandon Islands)', 'CC', 1),
(2136, 136, 'Rodrigues', 'RO', 1),
(2137, 136, 'Black River', 'BL', 1),
(2138, 136, 'Flacq', 'FL', 1),
(2139, 136, 'Grand Port', 'GP', 1),
(2140, 136, 'Moka', 'MO', 1),
(2141, 136, 'Pamplemousses', 'PA', 1),
(2142, 136, 'Plaines Wilhems', 'PW', 1),
(2143, 136, 'Port Louis', 'PL', 1),
(2144, 136, 'Riviere du Rempart', 'RR', 1),
(2145, 136, 'Savanne', 'SA', 1),
(2146, 138, 'Baja California Norte', 'BN', 1),
(2147, 138, 'Baja California Sur', 'BS', 1),
(2148, 138, 'Campeche', 'CA', 1),
(2149, 138, 'Chiapas', 'CI', 1),
(2150, 138, 'Chihuahua', 'CH', 1),
(2151, 138, 'Coahuila de Zaragoza', 'CZ', 1),
(2152, 138, 'Colima', 'CL', 1),
(2153, 138, 'Distrito Federal', 'DF', 1),
(2154, 138, 'Durango', 'DU', 1),
(2155, 138, 'Guanajuato', 'GA', 1),
(2156, 138, 'Guerrero', 'GE', 1),
(2157, 138, 'Hidalgo', 'HI', 1),
(2158, 138, 'Jalisco', 'JA', 1),
(2159, 138, 'Mexico', 'ME', 1),
(2160, 138, 'Michoacan de Ocampo', 'MI', 1),
(2161, 138, 'Morelos', 'MO', 1),
(2162, 138, 'Nayarit', 'NA', 1),
(2163, 138, 'Nuevo Leon', 'NL', 1),
(2164, 138, 'Oaxaca', 'OA', 1),
(2165, 138, 'Puebla', 'PU', 1),
(2166, 138, 'Queretaro de Arteaga', 'QA', 1),
(2167, 138, 'Quintana Roo', 'QR', 1),
(2168, 138, 'San Luis Potosi', 'SA', 1),
(2169, 138, 'Sinaloa', 'SI', 1),
(2170, 138, 'Sonora', 'SO', 1),
(2171, 138, 'Tabasco', 'TB', 1),
(2172, 138, 'Tamaulipas', 'TM', 1),
(2173, 138, 'Tlaxcala', 'TL', 1),
(2174, 138, 'Veracruz-Llave', 'VE', 1),
(2175, 138, 'Yucatan', 'YU', 1),
(2176, 138, 'Zacatecas', 'ZA', 1),
(2177, 139, 'Chuuk', 'C', 1),
(2178, 139, 'Kosrae', 'K', 1),
(2179, 139, 'Pohnpei', 'P', 1),
(2180, 139, 'Yap', 'Y', 1),
(2181, 140, 'Gagauzia', 'GA', 1),
(2182, 140, 'Chisinau', 'CU', 1),
(2183, 140, 'Balti', 'BA', 1),
(2184, 140, 'Cahul', 'CA', 1),
(2185, 140, 'Edinet', 'ED', 1),
(2186, 140, 'Lapusna', 'LA', 1),
(2187, 140, 'Orhei', 'OR', 1),
(2188, 140, 'Soroca', 'SO', 1),
(2189, 140, 'Tighina', 'TI', 1),
(2190, 140, 'Ungheni', 'UN', 1),
(2191, 140, 'St‚nga Nistrului', 'SN', 1),
(2192, 141, 'Fontvieille', 'FV', 1),
(2193, 141, 'La Condamine', 'LC', 1),
(2194, 141, 'Monaco-Ville', 'MV', 1),
(2195, 141, 'Monte-Carlo', 'MC', 1),
(2196, 142, 'Ulanbaatar', '1', 1),
(2197, 142, 'Orhon', '035', 1),
(2198, 142, 'Darhan uul', '037', 1),
(2199, 142, 'Hentiy', '039', 1),
(2200, 142, 'Hovsgol', '041', 1),
(2201, 142, 'Hovd', '043', 1),
(2202, 142, 'Uvs', '046', 1),
(2203, 142, 'Tov', '047', 1),
(2204, 142, 'Selenge', '049', 1),
(2205, 142, 'Suhbaatar', '051', 1),
(2206, 142, 'Omnogovi', '053', 1),
(2207, 142, 'Ovorhangay', '055', 1),
(2208, 142, 'Dzavhan', '057', 1),
(2209, 142, 'DundgovL', '059', 1),
(2210, 142, 'Dornod', '061', 1),
(2211, 142, 'Dornogov', '063', 1),
(2212, 142, 'Govi-Sumber', '064', 1),
(2213, 142, 'Govi-Altay', '065', 1),
(2214, 142, 'Bulgan', '067', 1),
(2215, 142, 'Bayanhongor', '069', 1),
(2216, 142, 'Bayan-Olgiy', '071', 1),
(2217, 142, 'Arhangay', '073', 1),
(2218, 143, 'Saint Anthony', 'A', 1),
(2219, 143, 'Saint Georges', 'G', 1),
(2220, 143, 'Saint Peter', 'P', 1),
(2221, 144, 'Agadir', 'AGD', 1),
(2222, 144, 'Al Hoceima', 'HOC', 1),
(2223, 144, 'Azilal', 'AZI', 1),
(2224, 144, 'Beni Mellal', 'BME', 1),
(2225, 144, 'Ben Slimane', 'BSL', 1),
(2226, 144, 'Boulemane', 'BLM', 1),
(2227, 144, 'Casablanca', 'CBL', 1),
(2228, 144, 'Chaouen', 'CHA', 1),
(2229, 144, 'El Jadida', 'EJA', 1),
(2230, 144, 'El Kelaa des Sraghna', 'EKS', 1),
(2231, 144, 'Er Rachidia', 'ERA', 1),
(2232, 144, 'Essaouira', 'ESS', 1),
(2233, 144, 'Fes', 'FES', 1),
(2234, 144, 'Figuig', 'FIG', 1),
(2235, 144, 'Guelmim', 'GLM', 1),
(2236, 144, 'Ifrane', 'IFR', 1),
(2237, 144, 'Kenitra', 'KEN', 1),
(2238, 144, 'Khemisset', 'KHM', 1),
(2239, 144, 'Khenifra', 'KHN', 1),
(2240, 144, 'Khouribga', 'KHO', 1),
(2241, 144, 'Laayoune', 'LYN', 1),
(2242, 144, 'Larache', 'LAR', 1),
(2243, 144, 'Marrakech', 'MRK', 1),
(2244, 144, 'Meknes', 'MKN', 1),
(2245, 144, 'Nador', 'NAD', 1),
(2246, 144, 'Ouarzazate', 'ORZ', 1),
(2247, 144, 'Oujda', 'OUJ', 1),
(2248, 144, 'Rabat-Sale', 'RSA', 1),
(2249, 144, 'Safi', 'SAF', 1),
(2250, 144, 'Settat', 'SET', 1),
(2251, 144, 'Sidi Kacem', 'SKA', 1),
(2252, 144, 'Tangier', 'TGR', 1),
(2253, 144, 'Tan-Tan', 'TAN', 1),
(2254, 144, 'Taounate', 'TAO', 1),
(2255, 144, 'Taroudannt', 'TRD', 1),
(2256, 144, 'Tata', 'TAT', 1),
(2257, 144, 'Taza', 'TAZ', 1),
(2258, 144, 'Tetouan', 'TET', 1),
(2259, 144, 'Tiznit', 'TIZ', 1),
(2260, 144, 'Ad Dakhla', 'ADK', 1),
(2261, 144, 'Boujdour', 'BJD', 1),
(2262, 144, 'Es Smara', 'ESM', 1),
(2263, 145, 'Cabo Delgado', 'CD', 1),
(2264, 145, 'Gaza', 'GZ', 1),
(2265, 145, 'Inhambane', 'IN', 1),
(2266, 145, 'Manica', 'MN', 1),
(2267, 145, 'Maputo (city)', 'MC', 1),
(2268, 145, 'Maputo', 'MP', 1),
(2269, 145, 'Nampula', 'NA', 1),
(2270, 145, 'Niassa', 'NI', 1),
(2271, 145, 'Sofala', 'SO', 1),
(2272, 145, 'Tete', 'TE', 1),
(2273, 145, 'Zambezia', 'ZA', 1),
(2274, 146, 'Ayeyarwady', 'AY', 1),
(2275, 146, 'Bago', 'BG', 1),
(2276, 146, 'Magway', 'MG', 1),
(2277, 146, 'Mandalay', 'MD', 1),
(2278, 146, 'Sagaing', 'SG', 1),
(2279, 146, 'Tanintharyi', 'TN', 1),
(2280, 146, 'Yangon', 'YG', 1),
(2281, 146, 'Chin State', 'CH', 1),
(2282, 146, 'Kachin State', 'KC', 1),
(2283, 146, 'Kayah State', 'KH', 1),
(2284, 146, 'Kayin State', 'KN', 1),
(2285, 146, 'Mon State', 'MN', 1),
(2286, 146, 'Rakhine State', 'RK', 1),
(2287, 146, 'Shan State', 'SH', 1),
(2288, 147, 'Caprivi', 'CA', 1),
(2289, 147, 'Erongo', 'ER', 1),
(2290, 147, 'Hardap', 'HA', 1),
(2291, 147, 'Karas', 'KR', 1),
(2292, 147, 'Kavango', 'KV', 1),
(2293, 147, 'Khomas', 'KH', 1),
(2294, 147, 'Kunene', 'KU', 1),
(2295, 147, 'Ohangwena', 'OW', 1),
(2296, 147, 'Omaheke', 'OK', 1),
(2297, 147, 'Omusati', 'OT', 1),
(2298, 147, 'Oshana', 'ON', 1),
(2299, 147, 'Oshikoto', 'OO', 1),
(2300, 147, 'Otjozondjupa', 'OJ', 1),
(2301, 148, 'Aiwo', 'AO', 1),
(2302, 148, 'Anabar', 'AA', 1),
(2303, 148, 'Anetan', 'AT', 1),
(2304, 148, 'Anibare', 'AI', 1),
(2305, 148, 'Baiti', 'BA', 1),
(2306, 148, 'Boe', 'BO', 1),
(2307, 148, 'Buada', 'BU', 1),
(2308, 148, 'Denigomodu', 'DE', 1),
(2309, 148, 'Ewa', 'EW', 1),
(2310, 148, 'Ijuw', 'IJ', 1),
(2311, 148, 'Meneng', 'ME', 1),
(2312, 148, 'Nibok', 'NI', 1),
(2313, 148, 'Uaboe', 'UA', 1),
(2314, 148, 'Yaren', 'YA', 1),
(2315, 149, 'Bagmati', 'BA', 1),
(2316, 149, 'Bheri', 'BH', 1),
(2317, 149, 'Dhawalagiri', 'DH', 1),
(2318, 149, 'Gandaki', 'GA', 1),
(2319, 149, 'Janakpur', 'JA', 1),
(2320, 149, 'Karnali', 'KA', 1),
(2321, 149, 'Kosi', 'KO', 1),
(2322, 149, 'Lumbini', 'LU', 1),
(2323, 149, 'Mahakali', 'MA', 1),
(2324, 149, 'Mechi', 'ME', 1),
(2325, 149, 'Narayani', 'NA', 1),
(2326, 149, 'Rapti', 'RA', 1),
(2327, 149, 'Sagarmatha', 'SA', 1),
(2328, 149, 'Seti', 'SE', 1),
(2329, 150, 'Drenthe', 'DR', 1),
(2330, 150, 'Flevoland', 'FL', 1),
(2331, 150, 'Friesland', 'FR', 1),
(2332, 150, 'Gelderland', 'GE', 1),
(2333, 150, 'Groningen', 'GR', 1),
(2334, 150, 'Limburg', 'LI', 1),
(2335, 150, 'Noord Brabant', 'NB', 1),
(2336, 150, 'Noord Holland', 'NH', 1),
(2337, 150, 'Overijssel', 'OV', 1),
(2338, 150, 'Utrecht', 'UT', 1),
(2339, 150, 'Zeeland', 'ZE', 1),
(2340, 150, 'Zuid Holland', 'ZH', 1),
(2341, 152, 'Iles Loyaute', 'L', 1),
(2342, 152, 'Nord', 'N', 1),
(2343, 152, 'Sud', 'S', 1),
(2344, 153, 'Auckland', 'AUK', 1),
(2345, 153, 'Bay of Plenty', 'BOP', 1),
(2346, 153, 'Canterbury', 'CAN', 1),
(2347, 153, 'Coromandel', 'COR', 1),
(2348, 153, 'Gisborne', 'GIS', 1),
(2349, 153, 'Fiordland', 'FIO', 1),
(2350, 153, 'Hawke''s Bay', 'HKB', 1),
(2351, 153, 'Marlborough', 'MBH', 1),
(2352, 153, 'Manawatu-Wanganui', 'MWT', 1),
(2353, 153, 'Mt Cook-Mackenzie', 'MCM', 1),
(2354, 153, 'Nelson', 'NSN', 1),
(2355, 153, 'Northland', 'NTL', 1),
(2356, 153, 'Otago', 'OTA', 1),
(2357, 153, 'Southland', 'STL', 1),
(2358, 153, 'Taranaki', 'TKI', 1),
(2359, 153, 'Wellington', 'WGN', 1),
(2360, 153, 'Waikato', 'WKO', 1),
(2361, 153, 'Wairarapa', 'WAI', 1),
(2362, 153, 'West Coast', 'WTC', 1),
(2363, 154, 'Atlantico Norte', 'AN', 1),
(2364, 154, 'Atlantico Sur', 'AS', 1),
(2365, 154, 'Boaco', 'BO', 1),
(2366, 154, 'Carazo', 'CA', 1),
(2367, 154, 'Chinandega', 'CI', 1),
(2368, 154, 'Chontales', 'CO', 1),
(2369, 154, 'Esteli', 'ES', 1),
(2370, 154, 'Granada', 'GR', 1),
(2371, 154, 'Jinotega', 'JI', 1),
(2372, 154, 'Leon', 'LE', 1),
(2373, 154, 'Madriz', 'MD', 1),
(2374, 154, 'Managua', 'MN', 1),
(2375, 154, 'Masaya', 'MS', 1),
(2376, 154, 'Matagalpa', 'MT', 1),
(2377, 154, 'Nuevo Segovia', 'NS', 1),
(2378, 154, 'Rio San Juan', 'RS', 1),
(2379, 154, 'Rivas', 'RI', 1),
(2380, 155, 'Agadez', 'AG', 1),
(2381, 155, 'Diffa', 'DF', 1),
(2382, 155, 'Dosso', 'DS', 1),
(2383, 155, 'Maradi', 'MA', 1),
(2384, 155, 'Niamey', 'NM', 1),
(2385, 155, 'Tahoua', 'TH', 1),
(2386, 155, 'Tillaberi', 'TL', 1),
(2387, 155, 'Zinder', 'ZD', 1),
(2388, 156, 'Abia', 'AB', 1),
(2389, 156, 'Abuja Federal Capital Territory', 'CT', 1),
(2390, 156, 'Adamawa', 'AD', 1),
(2391, 156, 'Akwa Ibom', 'AK', 1),
(2392, 156, 'Anambra', 'AN', 1),
(2393, 156, 'Bauchi', 'BC', 1),
(2394, 156, 'Bayelsa', 'BY', 1),
(2395, 156, 'Benue', 'BN', 1),
(2396, 156, 'Borno', 'BO', 1),
(2397, 156, 'Cross River', 'CR', 1),
(2398, 156, 'Delta', 'DE', 1),
(2399, 156, 'Ebonyi', 'EB', 1),
(2400, 156, 'Edo', 'ED', 1),
(2401, 156, 'Ekiti', 'EK', 1),
(2402, 156, 'Enugu', 'EN', 1),
(2403, 156, 'Gombe', 'GO', 1),
(2404, 156, 'Imo', 'IM', 1),
(2405, 156, 'Jigawa', 'JI', 1),
(2406, 156, 'Kaduna', 'KD', 1),
(2407, 156, 'Kano', 'KN', 1),
(2408, 156, 'Katsina', 'KT', 1),
(2409, 156, 'Kebbi', 'KE', 1),
(2410, 156, 'Kogi', 'KO', 1),
(2411, 156, 'Kwara', 'KW', 1),
(2412, 156, 'Lagos', 'LA', 1),
(2413, 156, 'Nassarawa', 'NA', 1),
(2414, 156, 'Niger', 'NI', 1),
(2415, 156, 'Ogun', 'OG', 1),
(2416, 156, 'Ondo', 'ONG', 1),
(2417, 156, 'Osun', 'OS', 1),
(2418, 156, 'Oyo', 'OY', 1),
(2419, 156, 'Plateau', 'PL', 1),
(2420, 156, 'Rivers', 'RI', 1),
(2421, 156, 'Sokoto', 'SO', 1),
(2422, 156, 'Taraba', 'TA', 1),
(2423, 156, 'Yobe', 'YO', 1),
(2424, 156, 'Zamfara', 'ZA', 1),
(2425, 159, 'Northern Islands', 'N', 1),
(2426, 159, 'Rota', 'R', 1),
(2427, 159, 'Saipan', 'S', 1),
(2428, 159, 'Tinian', 'T', 1),
(2429, 160, 'Akershus', 'AK', 1),
(2430, 160, 'Aust-Agder', 'AA', 1),
(2431, 160, 'Buskerud', 'BU', 1),
(2432, 160, 'Finnmark', 'FM', 1),
(2433, 160, 'Hedmark', 'HM', 1),
(2434, 160, 'Hordaland', 'HL', 1),
(2435, 160, 'More og Romdal', 'MR', 1),
(2436, 160, 'Nord-Trondelag', 'NT', 1),
(2437, 160, 'Nordland', 'NL', 1),
(2438, 160, 'Ostfold', 'OF', 1),
(2439, 160, 'Oppland', 'OP', 1),
(2440, 160, 'Oslo', 'OL', 1),
(2441, 160, 'Rogaland', 'RL', 1),
(2442, 160, 'Sor-Trondelag', 'ST', 1),
(2443, 160, 'Sogn og Fjordane', 'SJ', 1),
(2444, 160, 'Svalbard', 'SV', 1),
(2445, 160, 'Telemark', 'TM', 1),
(2446, 160, 'Troms', 'TR', 1),
(2447, 160, 'Vest-Agder', 'VA', 1),
(2448, 160, 'Vestfold', 'VF', 1),
(2449, 161, 'Ad Dakhiliyah', 'DA', 1),
(2450, 161, 'Al Batinah', 'BA', 1),
(2451, 161, 'Al Wusta', 'WU', 1),
(2452, 161, 'Ash Sharqiyah', 'SH', 1),
(2453, 161, 'Az Zahirah', 'ZA', 1),
(2454, 161, 'Masqat', 'MA', 1),
(2455, 161, 'Musandam', 'MU', 1),
(2456, 161, 'Zufar', 'ZU', 1),
(2457, 162, 'Balochistan', 'B', 1),
(2458, 162, 'Federally Administered Tribal Areas', 'T', 1),
(2459, 162, 'Islamabad Capital Territory', 'I', 1),
(2460, 162, 'North-West Frontier', 'N', 1),
(2461, 162, 'Punjab', 'P', 1),
(2462, 162, 'Sindh', 'S', 1),
(2463, 163, 'Aimeliik', 'AM', 1),
(2464, 163, 'Airai', 'AR', 1),
(2465, 163, 'Angaur', 'AN', 1),
(2466, 163, 'Hatohobei', 'HA', 1),
(2467, 163, 'Kayangel', 'KA', 1),
(2468, 163, 'Koror', 'KO', 1),
(2469, 163, 'Melekeok', 'ME', 1),
(2470, 163, 'Ngaraard', 'NA', 1),
(2471, 163, 'Ngarchelong', 'NG', 1),
(2472, 163, 'Ngardmau', 'ND', 1),
(2473, 163, 'Ngatpang', 'NT', 1),
(2474, 163, 'Ngchesar', 'NC', 1),
(2475, 163, 'Ngeremlengui', 'NR', 1),
(2476, 163, 'Ngiwal', 'NW', 1),
(2477, 163, 'Peleliu', 'PE', 1),
(2478, 163, 'Sonsorol', 'SO', 1),
(2479, 164, 'Bocas del Toro', 'BT', 1),
(2480, 164, 'Chiriqui', 'CH', 1),
(2481, 164, 'Cocle', 'CC', 1),
(2482, 164, 'Colon', 'CL', 1),
(2483, 164, 'Darien', 'DA', 1),
(2484, 164, 'Herrera', 'HE', 1),
(2485, 164, 'Los Santos', 'LS', 1),
(2486, 164, 'Panama', 'PA', 1),
(2487, 164, 'San Blas', 'SB', 1),
(2488, 164, 'Veraguas', 'VG', 1),
(2489, 165, 'Bougainville', 'BV', 1),
(2490, 165, 'Central', 'CE', 1),
(2491, 165, 'Chimbu', 'CH', 1),
(2492, 165, 'Eastern Highlands', 'EH', 1),
(2493, 165, 'East New Britain', 'EB', 1),
(2494, 165, 'East Sepik', 'ES', 1),
(2495, 165, 'Enga', 'EN', 1),
(2496, 165, 'Gulf', 'GU', 1),
(2497, 165, 'Madang', 'MD', 1),
(2498, 165, 'Manus', 'MN', 1),
(2499, 165, 'Milne Bay', 'MB', 1),
(2500, 165, 'Morobe', 'MR', 1),
(2501, 165, 'National Capital', 'NC', 1),
(2502, 165, 'New Ireland', 'NI', 1),
(2503, 165, 'Northern', 'NO', 1),
(2504, 165, 'Sandaun', 'SA', 1),
(2505, 165, 'Southern Highlands', 'SH', 1),
(2506, 165, 'Western', 'WE', 1),
(2507, 165, 'Western Highlands', 'WH', 1),
(2508, 165, 'West New Britain', 'WB', 1),
(2509, 166, 'Alto Paraguay', 'AG', 1),
(2510, 166, 'Alto Parana', 'AN', 1),
(2511, 166, 'Amambay', 'AM', 1),
(2512, 166, 'Asuncion', 'AS', 1),
(2513, 166, 'Boqueron', 'BO', 1),
(2514, 166, 'Caaguazu', 'CG', 1),
(2515, 166, 'Caazapa', 'CZ', 1),
(2516, 166, 'Canindeyu', 'CN', 1),
(2517, 166, 'Central', 'CE', 1),
(2518, 166, 'Concepcion', 'CC', 1),
(2519, 166, 'Cordillera', 'CD', 1),
(2520, 166, 'Guaira', 'GU', 1),
(2521, 166, 'Itapua', 'IT', 1),
(2522, 166, 'Misiones', 'MI', 1),
(2523, 166, 'Neembucu', 'NE', 1),
(2524, 166, 'Paraguari', 'PA', 1),
(2525, 166, 'Presidente Hayes', 'PH', 1),
(2526, 166, 'San Pedro', 'SP', 1),
(2527, 167, 'Amazonas', 'AM', 1),
(2528, 167, 'Ancash', 'AN', 1),
(2529, 167, 'Apurimac', 'AP', 1),
(2530, 167, 'Arequipa', 'AR', 1),
(2531, 167, 'Ayacucho', 'AY', 1),
(2532, 167, 'Cajamarca', 'CJ', 1),
(2533, 167, 'Callao', 'CL', 1),
(2534, 167, 'Cusco', 'CU', 1),
(2535, 167, 'Huancavelica', 'HV', 1),
(2536, 167, 'Huanuco', 'HO', 1),
(2537, 167, 'Ica', 'IC', 1),
(2538, 167, 'Junin', 'JU', 1),
(2539, 167, 'La Libertad', 'LD', 1),
(2540, 167, 'Lambayeque', 'LY', 1),
(2541, 167, 'Lima', 'LI', 1),
(2542, 167, 'Loreto', 'LO', 1),
(2543, 167, 'Madre de Dios', 'MD', 1),
(2544, 167, 'Moquegua', 'MO', 1),
(2545, 167, 'Pasco', 'PA', 1),
(2546, 167, 'Piura', 'PI', 1),
(2547, 167, 'Puno', 'PU', 1),
(2548, 167, 'San Martin', 'SM', 1),
(2549, 167, 'Tacna', 'TA', 1),
(2550, 167, 'Tumbes', 'TU', 1),
(2551, 167, 'Ucayali', 'UC', 1),
(2552, 168, 'Abra', 'ABR', 1),
(2553, 168, 'Agusan del Norte', 'ANO', 1),
(2554, 168, 'Agusan del Sur', 'ASU', 1),
(2555, 168, 'Aklan', 'AKL', 1),
(2556, 168, 'Albay', 'ALB', 1),
(2557, 168, 'Antique', 'ANT', 1),
(2558, 168, 'Apayao', 'APY', 1),
(2559, 168, 'Aurora', 'AUR', 1),
(2560, 168, 'Basilan', 'BAS', 1),
(2561, 168, 'Bataan', 'BTA', 1),
(2562, 168, 'Batanes', 'BTE', 1),
(2563, 168, 'Batangas', 'BTG', 1),
(2564, 168, 'Biliran', 'BLR', 1),
(2565, 168, 'Benguet', 'BEN', 1),
(2566, 168, 'Bohol', 'BOL', 1),
(2567, 168, 'Bukidnon', 'BUK', 1),
(2568, 168, 'Bulacan', 'BUL', 1),
(2569, 168, 'Cagayan', 'CAG', 1),
(2570, 168, 'Camarines Norte', 'CNO', 1),
(2571, 168, 'Camarines Sur', 'CSU', 1),
(2572, 168, 'Camiguin', 'CAM', 1),
(2573, 168, 'Capiz', 'CAP', 1),
(2574, 168, 'Catanduanes', 'CAT', 1),
(2575, 168, 'Cavite', 'CAV', 1),
(2576, 168, 'Cebu', 'CEB', 1),
(2577, 168, 'Compostela', 'CMP', 1),
(2578, 168, 'Davao del Norte', 'DNO', 1),
(2579, 168, 'Davao del Sur', 'DSU', 1),
(2580, 168, 'Davao Oriental', 'DOR', 1),
(2581, 168, 'Eastern Samar', 'ESA', 1),
(2582, 168, 'Guimaras', 'GUI', 1),
(2583, 168, 'Ifugao', 'IFU', 1),
(2584, 168, 'Ilocos Norte', 'INO', 1),
(2585, 168, 'Ilocos Sur', 'ISU', 1),
(2586, 168, 'Iloilo', 'ILO', 1),
(2587, 168, 'Isabela', 'ISA', 1),
(2588, 168, 'Kalinga', 'KAL', 1),
(2589, 168, 'Laguna', 'LAG', 1),
(2590, 168, 'Lanao del Norte', 'LNO', 1),
(2591, 168, 'Lanao del Sur', 'LSU', 1),
(2592, 168, 'La Union', 'UNI', 1),
(2593, 168, 'Leyte', 'LEY', 1),
(2594, 168, 'Maguindanao', 'MAG', 1),
(2595, 168, 'Marinduque', 'MRN', 1),
(2596, 168, 'Masbate', 'MSB', 1),
(2597, 168, 'Mindoro Occidental', 'MIC', 1),
(2598, 168, 'Mindoro Oriental', 'MIR', 1),
(2599, 168, 'Misamis Occidental', 'MSC', 1),
(2600, 168, 'Misamis Oriental', 'MOR', 1),
(2601, 168, 'Mountain', 'MOP', 1),
(2602, 168, 'Negros Occidental', 'NOC', 1),
(2603, 168, 'Negros Oriental', 'NOR', 1),
(2604, 168, 'North Cotabato', 'NCT', 1),
(2605, 168, 'Northern Samar', 'NSM', 1),
(2606, 168, 'Nueva Ecija', 'NEC', 1),
(2607, 168, 'Nueva Vizcaya', 'NVZ', 1),
(2608, 168, 'Palawan', 'PLW', 1),
(2609, 168, 'Pampanga', 'PMP', 1),
(2610, 168, 'Pangasinan', 'PNG', 1),
(2611, 168, 'Quezon', 'QZN', 1),
(2612, 168, 'Quirino', 'QRN', 1),
(2613, 168, 'Rizal', 'RIZ', 1),
(2614, 168, 'Romblon', 'ROM', 1),
(2615, 168, 'Samar', 'SMR', 1),
(2616, 168, 'Sarangani', 'SRG', 1),
(2617, 168, 'Siquijor', 'SQJ', 1),
(2618, 168, 'Sorsogon', 'SRS', 1),
(2619, 168, 'South Cotabato', 'SCO', 1),
(2620, 168, 'Southern Leyte', 'SLE', 1),
(2621, 168, 'Sultan Kudarat', 'SKU', 1),
(2622, 168, 'Sulu', 'SLU', 1),
(2623, 168, 'Surigao del Norte', 'SNO', 1),
(2624, 168, 'Surigao del Sur', 'SSU', 1),
(2625, 168, 'Tarlac', 'TAR', 1),
(2626, 168, 'Tawi-Tawi', 'TAW', 1),
(2627, 168, 'Zambales', 'ZBL', 1),
(2628, 168, 'Zamboanga del Norte', 'ZNO', 1),
(2629, 168, 'Zamboanga del Sur', 'ZSU', 1),
(2630, 168, 'Zamboanga Sibugay', 'ZSI', 1),
(2631, 170, 'Dolnoslaskie', 'DO', 1),
(2632, 170, 'Kujawsko-Pomorskie', 'KP', 1),
(2633, 170, 'Lodzkie', 'LO', 1),
(2634, 170, 'Lubelskie', 'LL', 1),
(2635, 170, 'Lubuskie', 'LU', 1),
(2636, 170, 'Malopolskie', 'ML', 1),
(2637, 170, 'Mazowieckie', 'MZ', 1),
(2638, 170, 'Opolskie', 'OP', 1),
(2639, 170, 'Podkarpackie', 'PP', 1),
(2640, 170, 'Podlaskie', 'PL', 1),
(2641, 170, 'Pomorskie', 'PM', 1),
(2642, 170, 'Slaskie', 'SL', 1),
(2643, 170, 'Swietokrzyskie', 'SW', 1),
(2644, 170, 'Warminsko-Mazurskie', 'WM', 1),
(2645, 170, 'Wielkopolskie', 'WP', 1),
(2646, 170, 'Zachodniopomorskie', 'ZA', 1),
(2647, 198, 'Saint Pierre', 'P', 1),
(2648, 198, 'Miquelon', 'M', 1),
(2649, 171, 'A&ccedil;ores', 'AC', 1),
(2650, 171, 'Aveiro', 'AV', 1),
(2651, 171, 'Beja', 'BE', 1),
(2652, 171, 'Braga', 'BR', 1),
(2653, 171, 'Bragan&ccedil;a', 'BA', 1),
(2654, 171, 'Castelo Branco', 'CB', 1),
(2655, 171, 'Coimbra', 'CO', 1),
(2656, 171, '&Eacute;vora', 'EV', 1),
(2657, 171, 'Faro', 'FA', 1),
(2658, 171, 'Guarda', 'GU', 1),
(2659, 171, 'Leiria', 'LE', 1),
(2660, 171, 'Lisboa', 'LI', 1),
(2661, 171, 'Madeira', 'ME', 1),
(2662, 171, 'Portalegre', 'PO', 1),
(2663, 171, 'Porto', 'PR', 1),
(2664, 171, 'Santar&eacute;m', 'SA', 1),
(2665, 171, 'Set&uacute;bal', 'SE', 1),
(2666, 171, 'Viana do Castelo', 'VC', 1),
(2667, 171, 'Vila Real', 'VR', 1),
(2668, 171, 'Viseu', 'VI', 1),
(2669, 173, 'Ad Dawhah', 'DW', 1),
(2670, 173, 'Al Ghuwayriyah', 'GW', 1),
(2671, 173, 'Al Jumayliyah', 'JM', 1),
(2672, 173, 'Al Khawr', 'KR', 1),
(2673, 173, 'Al Wakrah', 'WK', 1),
(2674, 173, 'Ar Rayyan', 'RN', 1),
(2675, 173, 'Jarayan al Batinah', 'JB', 1),
(2676, 173, 'Madinat ash Shamal', 'MS', 1),
(2677, 173, 'Umm Sa''id', 'UD', 1),
(2678, 173, 'Umm Salal', 'UL', 1),
(2679, 175, 'Alba', 'AB', 1),
(2680, 175, 'Arad', 'AR', 1),
(2681, 175, 'Arges', 'AG', 1),
(2682, 175, 'Bacau', 'BC', 1),
(2683, 175, 'Bihor', 'BH', 1),
(2684, 175, 'Bistrita-Nasaud', 'BN', 1),
(2685, 175, 'Botosani', 'BT', 1),
(2686, 175, 'Brasov', 'BV', 1),
(2687, 175, 'Braila', 'BR', 1),
(2688, 175, 'Bucuresti', 'B', 1),
(2689, 175, 'Buzau', 'BZ', 1),
(2690, 175, 'Caras-Severin', 'CS', 1),
(2691, 175, 'Calarasi', 'CL', 1),
(2692, 175, 'Cluj', 'CJ', 1),
(2693, 175, 'Constanta', 'CT', 1),
(2694, 175, 'Covasna', 'CV', 1),
(2695, 175, 'Dimbovita', 'DB', 1),
(2696, 175, 'Dolj', 'DJ', 1),
(2697, 175, 'Galati', 'GL', 1),
(2698, 175, 'Giurgiu', 'GR', 1),
(2699, 175, 'Gorj', 'GJ', 1),
(2700, 175, 'Harghita', 'HR', 1),
(2701, 175, 'Hunedoara', 'HD', 1),
(2702, 175, 'Ialomita', 'IL', 1),
(2703, 175, 'Iasi', 'IS', 1),
(2704, 175, 'Ilfov', 'IF', 1),
(2705, 175, 'Maramures', 'MM', 1),
(2706, 175, 'Mehedinti', 'MH', 1),
(2707, 175, 'Mures', 'MS', 1),
(2708, 175, 'Neamt', 'NT', 1),
(2709, 175, 'Olt', 'OT', 1),
(2710, 175, 'Prahova', 'PH', 1),
(2711, 175, 'Satu-Mare', 'SM', 1),
(2712, 175, 'Salaj', 'SJ', 1),
(2713, 175, 'Sibiu', 'SB', 1),
(2714, 175, 'Suceava', 'SV', 1),
(2715, 175, 'Teleorman', 'TR', 1),
(2716, 175, 'Timis', 'TM', 1),
(2717, 175, 'Tulcea', 'TL', 1),
(2718, 175, 'Vaslui', 'VS', 1),
(2719, 175, 'Valcea', 'VL', 1),
(2720, 175, 'Vrancea', 'VN', 1),
(2721, 176, 'Abakan', 'AB', 1),
(2722, 176, 'Aginskoye', 'AG', 1),
(2723, 176, 'Anadyr', 'AN', 1),
(2724, 176, 'Arkahangelsk', 'AR', 1),
(2725, 176, 'Astrakhan', 'AS', 1),
(2726, 176, 'Barnaul', 'BA', 1),
(2727, 176, 'Belgorod', 'BE', 1),
(2728, 176, 'Birobidzhan', 'BI', 1),
(2729, 176, 'Blagoveshchensk', 'BL', 1),
(2730, 176, 'Bryansk', 'BR', 1),
(2731, 176, 'Cheboksary', 'CH', 1),
(2732, 176, 'Chelyabinsk', 'CL', 1),
(2733, 176, 'Cherkessk', 'CR', 1),
(2734, 176, 'Chita', 'CI', 1),
(2735, 176, 'Dudinka', 'DU', 1),
(2736, 176, 'Elista', 'EL', 1),
(2737, 176, 'Gomo-Altaysk', 'GO', 1),
(2738, 176, 'Gorno-Altaysk', 'GA', 1),
(2739, 176, 'Groznyy', 'GR', 1),
(2740, 176, 'Irkutsk', 'IR', 1),
(2741, 176, 'Ivanovo', 'IV', 1),
(2742, 176, 'Izhevsk', 'IZ', 1),
(2743, 176, 'Kalinigrad', 'KA', 1),
(2744, 176, 'Kaluga', 'KL', 1),
(2745, 176, 'Kasnodar', 'KS', 1),
(2746, 176, 'Kazan', 'KZ', 1),
(2747, 176, 'Kemerovo', 'KE', 1),
(2748, 176, 'Khabarovsk', 'KH', 1),
(2749, 176, 'Khanty-Mansiysk', 'KM', 1),
(2750, 176, 'Kostroma', 'KO', 1),
(2751, 176, 'Krasnodar', 'KR', 1),
(2752, 176, 'Krasnoyarsk', 'KN', 1),
(2753, 176, 'Kudymkar', 'KU', 1),
(2754, 176, 'Kurgan', 'KG', 1),
(2755, 176, 'Kursk', 'KK', 1),
(2756, 176, 'Kyzyl', 'KY', 1),
(2757, 176, 'Lipetsk', 'LI', 1),
(2758, 176, 'Magadan', 'MA', 1),
(2759, 176, 'Makhachkala', 'MK', 1),
(2760, 176, 'Maykop', 'MY', 1),
(2761, 176, 'Moscow', 'MO', 1),
(2762, 176, 'Murmansk', 'MU', 1),
(2763, 176, 'Nalchik', 'NA', 1),
(2764, 176, 'Naryan Mar', 'NR', 1),
(2765, 176, 'Nazran', 'NZ', 1),
(2766, 176, 'Nizhniy Novgorod', 'NI', 1),
(2767, 176, 'Novgorod', 'NO', 1),
(2768, 176, 'Novosibirsk', 'NV', 1),
(2769, 176, 'Omsk', 'OM', 1),
(2770, 176, 'Orel', 'OR', 1),
(2771, 176, 'Orenburg', 'OE', 1),
(2772, 176, 'Palana', 'PA', 1),
(2773, 176, 'Penza', 'PE', 1),
(2774, 176, 'Perm', 'PR', 1),
(2775, 176, 'Petropavlovsk-Kamchatskiy', 'PK', 1),
(2776, 176, 'Petrozavodsk', 'PT', 1),
(2777, 176, 'Pskov', 'PS', 1),
(2778, 176, 'Rostov-na-Donu', 'RO', 1),
(2779, 176, 'Ryazan', 'RY', 1),
(2780, 176, 'Salekhard', 'SL', 1),
(2781, 176, 'Samara', 'SA', 1),
(2782, 176, 'Saransk', 'SR', 1),
(2783, 176, 'Saratov', 'SV', 1),
(2784, 176, 'Smolensk', 'SM', 1),
(2785, 176, 'St. Petersburg', 'SP', 1),
(2786, 176, 'Stavropol', 'ST', 1),
(2787, 176, 'Syktyvkar', 'SY', 1),
(2788, 176, 'Tambov', 'TA', 1),
(2789, 176, 'Tomsk', 'TO', 1),
(2790, 176, 'Tula', 'TU', 1),
(2791, 176, 'Tura', 'TR', 1),
(2792, 176, 'Tver', 'TV', 1),
(2793, 176, 'Tyumen', 'TY', 1),
(2794, 176, 'Ufa', 'UF', 1),
(2795, 176, 'Ul''yanovsk', 'UL', 1),
(2796, 176, 'Ulan-Ude', 'UU', 1),
(2797, 176, 'Ust''-Ordynskiy', 'US', 1),
(2798, 176, 'Vladikavkaz', 'VL', 1),
(2799, 176, 'Vladimir', 'VA', 1),
(2800, 176, 'Vladivostok', 'VV', 1),
(2801, 176, 'Volgograd', 'VG', 1),
(2802, 176, 'Vologda', 'VD', 1),
(2803, 176, 'Voronezh', 'VO', 1),
(2804, 176, 'Vyatka', 'VY', 1),
(2805, 176, 'Yakutsk', 'YA', 1),
(2806, 176, 'Yaroslavl', 'YR', 1),
(2807, 176, 'Yekaterinburg', 'YE', 1),
(2808, 176, 'Yoshkar-Ola', 'YO', 1),
(2809, 177, 'Butare', 'BU', 1),
(2810, 177, 'Byumba', 'BY', 1),
(2811, 177, 'Cyangugu', 'CY', 1),
(2812, 177, 'Gikongoro', 'GK', 1),
(2813, 177, 'Gisenyi', 'GS', 1),
(2814, 177, 'Gitarama', 'GT', 1),
(2815, 177, 'Kibungo', 'KG', 1),
(2816, 177, 'Kibuye', 'KY', 1),
(2817, 177, 'Kigali Rurale', 'KR', 1),
(2818, 177, 'Kigali-ville', 'KV', 1),
(2819, 177, 'Ruhengeri', 'RU', 1),
(2820, 177, 'Umutara', 'UM', 1),
(2821, 178, 'Christ Church Nichola Town', 'CCN', 1),
(2822, 178, 'Saint Anne Sandy Point', 'SAS', 1),
(2823, 178, 'Saint George Basseterre', 'SGB', 1),
(2824, 178, 'Saint George Gingerland', 'SGG', 1),
(2825, 178, 'Saint James Windward', 'SJW', 1),
(2826, 178, 'Saint John Capesterre', 'SJC', 1),
(2827, 178, 'Saint John Figtree', 'SJF', 1),
(2828, 178, 'Saint Mary Cayon', 'SMC', 1),
(2829, 178, 'Saint Paul Capesterre', 'CAP', 1),
(2830, 178, 'Saint Paul Charlestown', 'CHA', 1),
(2831, 178, 'Saint Peter Basseterre', 'SPB', 1),
(2832, 178, 'Saint Thomas Lowland', 'STL', 1),
(2833, 178, 'Saint Thomas Middle Island', 'STM', 1),
(2834, 178, 'Trinity Palmetto Point', 'TPP', 1),
(2835, 179, 'Anse-la-Raye', 'AR', 1),
(2836, 179, 'Castries', 'CA', 1),
(2837, 179, 'Choiseul', 'CH', 1),
(2838, 179, 'Dauphin', 'DA', 1),
(2839, 179, 'Dennery', 'DE', 1),
(2840, 179, 'Gros-Islet', 'GI', 1),
(2841, 179, 'Laborie', 'LA', 1),
(2842, 179, 'Micoud', 'MI', 1),
(2843, 179, 'Praslin', 'PR', 1),
(2844, 179, 'Soufriere', 'SO', 1),
(2845, 179, 'Vieux-Fort', 'VF', 1),
(2846, 180, 'Charlotte', 'C', 1),
(2847, 180, 'Grenadines', 'R', 1),
(2848, 180, 'Saint Andrew', 'A', 1),
(2849, 180, 'Saint David', 'D', 1),
(2850, 180, 'Saint George', 'G', 1),
(2851, 180, 'Saint Patrick', 'P', 1),
(2852, 181, 'A''ana', 'AN', 1),
(2853, 181, 'Aiga-i-le-Tai', 'AI', 1),
(2854, 181, 'Atua', 'AT', 1),
(2855, 181, 'Fa''asaleleaga', 'FA', 1),
(2856, 181, 'Gaga''emauga', 'GE', 1),
(2857, 181, 'Gagaifomauga', 'GF', 1),
(2858, 181, 'Palauli', 'PA', 1),
(2859, 181, 'Satupa''itea', 'SA', 1),
(2860, 181, 'Tuamasaga', 'TU', 1),
(2861, 181, 'Va''a-o-Fonoti', 'VF', 1),
(2862, 181, 'Vaisigano', 'VS', 1),
(2863, 182, 'Acquaviva', 'AC', 1),
(2864, 182, 'Borgo Maggiore', 'BM', 1),
(2865, 182, 'Chiesanuova', 'CH', 1),
(2866, 182, 'Domagnano', 'DO', 1),
(2867, 182, 'Faetano', 'FA', 1),
(2868, 182, 'Fiorentino', 'FI', 1),
(2869, 182, 'Montegiardino', 'MO', 1),
(2870, 182, 'Citta di San Marino', 'SM', 1),
(2871, 182, 'Serravalle', 'SE', 1),
(2872, 183, 'Sao Tome', 'S', 1),
(2873, 183, 'Principe', 'P', 1),
(2874, 184, 'Al Bahah', 'BH', 1),
(2875, 184, 'Al Hudud ash Shamaliyah', 'HS', 1),
(2876, 184, 'Al Jawf', 'JF', 1),
(2877, 184, 'Al Madinah', 'MD', 1),
(2878, 184, 'Al Qasim', 'QS', 1),
(2879, 184, 'Ar Riyad', 'RD', 1),
(2880, 184, 'Ash Sharqiyah (Eastern)', 'AQ', 1),
(2881, 184, '''Asir', 'AS', 1),
(2882, 184, 'Ha''il', 'HL', 1),
(2883, 184, 'Jizan', 'JZ', 1),
(2884, 184, 'Makkah', 'ML', 1),
(2885, 184, 'Najran', 'NR', 1),
(2886, 184, 'Tabuk', 'TB', 1),
(2887, 185, 'Dakar', 'DA', 1),
(2888, 185, 'Diourbel', 'DI', 1),
(2889, 185, 'Fatick', 'FA', 1),
(2890, 185, 'Kaolack', 'KA', 1),
(2891, 185, 'Kolda', 'KO', 1),
(2892, 185, 'Louga', 'LO', 1),
(2893, 185, 'Matam', 'MA', 1),
(2894, 185, 'Saint-Louis', 'SL', 1),
(2895, 185, 'Tambacounda', 'TA', 1),
(2896, 185, 'Thies', 'TH', 1),
(2897, 185, 'Ziguinchor', 'ZI', 1),
(2898, 186, 'Anse aux Pins', 'AP', 1),
(2899, 186, 'Anse Boileau', 'AB', 1),
(2900, 186, 'Anse Etoile', 'AE', 1),
(2901, 186, 'Anse Louis', 'AL', 1),
(2902, 186, 'Anse Royale', 'AR', 1),
(2903, 186, 'Baie Lazare', 'BL', 1),
(2904, 186, 'Baie Sainte Anne', 'BS', 1),
(2905, 186, 'Beau Vallon', 'BV', 1),
(2906, 186, 'Bel Air', 'BA', 1),
(2907, 186, 'Bel Ombre', 'BO', 1),
(2908, 186, 'Cascade', 'CA', 1),
(2909, 186, 'Glacis', 'GL', 1),
(2910, 186, 'Grand'' Anse (on Mahe)', 'GM', 1),
(2911, 186, 'Grand'' Anse (on Praslin)', 'GP', 1),
(2912, 186, 'La Digue', 'DG', 1),
(2913, 186, 'La Riviere Anglaise', 'RA', 1),
(2914, 186, 'Mont Buxton', 'MB', 1),
(2915, 186, 'Mont Fleuri', 'MF', 1),
(2916, 186, 'Plaisance', 'PL', 1),
(2917, 186, 'Pointe La Rue', 'PR', 1),
(2918, 186, 'Port Glaud', 'PG', 1),
(2919, 186, 'Saint Louis', 'SL', 1),
(2920, 186, 'Takamaka', 'TA', 1),
(2921, 187, 'Eastern', 'E', 1),
(2922, 187, 'Northern', 'N', 1),
(2923, 187, 'Southern', 'S', 1),
(2924, 187, 'Western', 'W', 1),
(2925, 189, 'Banskobystrický', 'BA', 1),
(2926, 189, 'Bratislavský', 'BR', 1),
(2927, 189, 'Košický', 'KO', 1),
(2928, 189, 'Nitriansky', 'NI', 1),
(2929, 189, 'Prešovský', 'PR', 1),
(2930, 189, 'Trenčiansky', 'TC', 1),
(2931, 189, 'Trnavský', 'TV', 1),
(2932, 189, 'Žilinský', 'ZI', 1),
(2933, 191, 'Central', 'CE', 1),
(2934, 191, 'Choiseul', 'CH', 1),
(2935, 191, 'Guadalcanal', 'GC', 1),
(2936, 191, 'Honiara', 'HO', 1),
(2937, 191, 'Isabel', 'IS', 1),
(2938, 191, 'Makira', 'MK', 1),
(2939, 191, 'Malaita', 'ML', 1),
(2940, 191, 'Rennell and Bellona', 'RB', 1),
(2941, 191, 'Temotu', 'TM', 1),
(2942, 191, 'Western', 'WE', 1),
(2943, 192, 'Awdal', 'AW', 1),
(2944, 192, 'Bakool', 'BK', 1),
(2945, 192, 'Banaadir', 'BN', 1),
(2946, 192, 'Bari', 'BR', 1),
(2947, 192, 'Bay', 'BY', 1),
(2948, 192, 'Galguduud', 'GA', 1),
(2949, 192, 'Gedo', 'GE', 1),
(2950, 192, 'Hiiraan', 'HI', 1),
(2951, 192, 'Jubbada Dhexe', 'JD', 1),
(2952, 192, 'Jubbada Hoose', 'JH', 1),
(2953, 192, 'Mudug', 'MU', 1),
(2954, 192, 'Nugaal', 'NU', 1),
(2955, 192, 'Sanaag', 'SA', 1),
(2956, 192, 'Shabeellaha Dhexe', 'SD', 1),
(2957, 192, 'Shabeellaha Hoose', 'SH', 1),
(2958, 192, 'Sool', 'SL', 1),
(2959, 192, 'Togdheer', 'TO', 1),
(2960, 192, 'Woqooyi Galbeed', 'WG', 1),
(2961, 193, 'Eastern Cape', 'EC', 1),
(2962, 193, 'Free State', 'FS', 1),
(2963, 193, 'Gauteng', 'GT', 1),
(2964, 193, 'KwaZulu-Natal', 'KN', 1),
(2965, 193, 'Limpopo', 'LP', 1),
(2966, 193, 'Mpumalanga', 'MP', 1),
(2967, 193, 'North West', 'NW', 1),
(2968, 193, 'Northern Cape', 'NC', 1),
(2969, 193, 'Western Cape', 'WC', 1),
(2970, 195, 'La Coru&ntilde;a', 'CA', 1),
(2971, 195, '&Aacute;lava', 'AL', 1),
(2972, 195, 'Albacete', 'AB', 1),
(2973, 195, 'Alicante', 'AC', 1),
(2974, 195, 'Almeria', 'AM', 1),
(2975, 195, 'Asturias', 'AS', 1),
(2976, 195, '&Aacute;vila', 'AV', 1),
(2977, 195, 'Badajoz', 'BJ', 1),
(2978, 195, 'Baleares', 'IB', 1),
(2979, 195, 'Barcelona', 'BA', 1),
(2980, 195, 'Burgos', 'BU', 1),
(2981, 195, 'C&aacute;ceres', 'CC', 1),
(2982, 195, 'C&aacute;diz', 'CZ', 1),
(2983, 195, 'Cantabria', 'CT', 1),
(2984, 195, 'Castell&oacute;n', 'CL', 1),
(2985, 195, 'Ceuta', 'CE', 1),
(2986, 195, 'Ciudad Real', 'CR', 1),
(2987, 195, 'C&oacute;rdoba', 'CD', 1),
(2988, 195, 'Cuenca', 'CU', 1),
(2989, 195, 'Girona', 'GI', 1),
(2990, 195, 'Granada', 'GD', 1),
(2991, 195, 'Guadalajara', 'GJ', 1),
(2992, 195, 'Guip&uacute;zcoa', 'GP', 1),
(2993, 195, 'Huelva', 'HL', 1),
(2994, 195, 'Huesca', 'HS', 1),
(2995, 195, 'Ja&eacute;n', 'JN', 1),
(2996, 195, 'La Rioja', 'RJ', 1),
(2997, 195, 'Las Palmas', 'PM', 1),
(2998, 195, 'Leon', 'LE', 1),
(2999, 195, 'Lleida', 'LL', 1),
(3000, 195, 'Lugo', 'LG', 1),
(3001, 195, 'Madrid', 'MD', 1),
(3002, 195, 'Malaga', 'MA', 1),
(3003, 195, 'Melilla', 'ML', 1),
(3004, 195, 'Murcia', 'MU', 1),
(3005, 195, 'Navarra', 'NV', 1),
(3006, 195, 'Ourense', 'OU', 1),
(3007, 195, 'Palencia', 'PL', 1),
(3008, 195, 'Pontevedra', 'PO', 1),
(3009, 195, 'Salamanca', 'SL', 1),
(3010, 195, 'Santa Cruz de Tenerife', 'SC', 1),
(3011, 195, 'Segovia', 'SG', 1),
(3012, 195, 'Sevilla', 'SV', 1),
(3013, 195, 'Soria', 'SO', 1),
(3014, 195, 'Tarragona', 'TA', 1),
(3015, 195, 'Teruel', 'TE', 1),
(3016, 195, 'Toledo', 'TO', 1),
(3017, 195, 'Valencia', 'VC', 1),
(3018, 195, 'Valladolid', 'VD', 1),
(3019, 195, 'Vizcaya', 'VZ', 1),
(3020, 195, 'Zamora', 'ZM', 1),
(3021, 195, 'Zaragoza', 'ZR', 1),
(3022, 196, 'Central', 'CE', 1),
(3023, 196, 'Eastern', 'EA', 1),
(3024, 196, 'North Central', 'NC', 1),
(3025, 196, 'Northern', 'NO', 1),
(3026, 196, 'North Western', 'NW', 1),
(3027, 196, 'Sabaragamuwa', 'SA', 1),
(3028, 196, 'Southern', 'SO', 1),
(3029, 196, 'Uva', 'UV', 1),
(3030, 196, 'Western', 'WE', 1),
(3031, 197, 'Ascension', 'A', 1),
(3032, 197, 'Saint Helena', 'S', 1),
(3033, 197, 'Tristan da Cunha', 'T', 1),
(3034, 199, 'A''ali an Nil', 'ANL', 1),
(3035, 199, 'Al Bahr al Ahmar', 'BAM', 1),
(3036, 199, 'Al Buhayrat', 'BRT', 1),
(3037, 199, 'Al Jazirah', 'JZR', 1),
(3038, 199, 'Al Khartum', 'KRT', 1),
(3039, 199, 'Al Qadarif', 'QDR', 1),
(3040, 199, 'Al Wahdah', 'WDH', 1),
(3041, 199, 'An Nil al Abyad', 'ANB', 1),
(3042, 199, 'An Nil al Azraq', 'ANZ', 1),
(3043, 199, 'Ash Shamaliyah', 'ASH', 1),
(3044, 199, 'Bahr al Jabal', 'BJA', 1),
(3045, 199, 'Gharb al Istiwa''iyah', 'GIS', 1),
(3046, 199, 'Gharb Bahr al Ghazal', 'GBG', 1),
(3047, 199, 'Gharb Darfur', 'GDA', 1),
(3048, 199, 'Gharb Kurdufan', 'GKU', 1),
(3049, 199, 'Janub Darfur', 'JDA', 1),
(3050, 199, 'Janub Kurdufan', 'JKU', 1),
(3051, 199, 'Junqali', 'JQL', 1),
(3052, 199, 'Kassala', 'KSL', 1),
(3053, 199, 'Nahr an Nil', 'NNL', 1),
(3054, 199, 'Shamal Bahr al Ghazal', 'SBG', 1),
(3055, 199, 'Shamal Darfur', 'SDA', 1),
(3056, 199, 'Shamal Kurdufan', 'SKU', 1),
(3057, 199, 'Sharq al Istiwa''iyah', 'SIS', 1),
(3058, 199, 'Sinnar', 'SNR', 1);
INSERT INTO `zone` (`zone_id`, `country_id`, `name`, `code`, `status`) VALUES
(3059, 199, 'Warab', 'WRB', 1),
(3060, 200, 'Brokopondo', 'BR', 1),
(3061, 200, 'Commewijne', 'CM', 1),
(3062, 200, 'Coronie', 'CR', 1),
(3063, 200, 'Marowijne', 'MA', 1),
(3064, 200, 'Nickerie', 'NI', 1),
(3065, 200, 'Para', 'PA', 1),
(3066, 200, 'Paramaribo', 'PM', 1),
(3067, 200, 'Saramacca', 'SA', 1),
(3068, 200, 'Sipaliwini', 'SI', 1),
(3069, 200, 'Wanica', 'WA', 1),
(3070, 202, 'Hhohho', 'H', 1),
(3071, 202, 'Lubombo', 'L', 1),
(3072, 202, 'Manzini', 'M', 1),
(3073, 202, 'Shishelweni', 'S', 1),
(3074, 203, 'Blekinge', 'K', 1),
(3075, 203, 'Dalarna', 'W', 1),
(3076, 203, 'G&auml;vleborg', 'X', 1),
(3077, 203, 'Gotland', 'I', 1),
(3078, 203, 'Halland', 'N', 1),
(3079, 203, 'J&auml;mtland', 'Z', 1),
(3080, 203, 'J&ouml;nk&ouml;ping', 'F', 1),
(3081, 203, 'Kalmar', 'H', 1),
(3082, 203, 'Kronoberg', 'G', 1),
(3083, 203, 'Norrbotten', 'BD', 1),
(3084, 203, '&Ouml;rebro', 'T', 1),
(3085, 203, '&Ouml;sterg&ouml;tland', 'E', 1),
(3086, 203, 'Sk&aring;ne', 'M', 1),
(3087, 203, 'S&ouml;dermanland', 'D', 1),
(3088, 203, 'Stockholm', 'AB', 1),
(3089, 203, 'Uppsala', 'C', 1),
(3090, 203, 'V&auml;rmland', 'S', 1),
(3091, 203, 'V&auml;sterbotten', 'AC', 1),
(3092, 203, 'V&auml;sternorrland', 'Y', 1),
(3093, 203, 'V&auml;stmanland', 'U', 1),
(3094, 203, 'V&auml;stra G&ouml;taland', 'O', 1),
(3095, 204, 'Aargau', 'AG', 1),
(3096, 204, 'Appenzell Ausserrhoden', 'AR', 1),
(3097, 204, 'Appenzell Innerrhoden', 'AI', 1),
(3098, 204, 'Basel-Stadt', 'BS', 1),
(3099, 204, 'Basel-Landschaft', 'BL', 1),
(3100, 204, 'Bern', 'BE', 1),
(3101, 204, 'Fribourg', 'FR', 1),
(3102, 204, 'Gen&egrave;ve', 'GE', 1),
(3103, 204, 'Glarus', 'GL', 1),
(3104, 204, 'Graub&uuml;nden', 'GR', 1),
(3105, 204, 'Jura', 'JU', 1),
(3106, 204, 'Luzern', 'LU', 1),
(3107, 204, 'Neuch&acirc;tel', 'NE', 1),
(3108, 204, 'Nidwald', 'NW', 1),
(3109, 204, 'Obwald', 'OW', 1),
(3110, 204, 'St. Gallen', 'SG', 1),
(3111, 204, 'Schaffhausen', 'SH', 1),
(3112, 204, 'Schwyz', 'SZ', 1),
(3113, 204, 'Solothurn', 'SO', 1),
(3114, 204, 'Thurgau', 'TG', 1),
(3115, 204, 'Ticino', 'TI', 1),
(3116, 204, 'Uri', 'UR', 1),
(3117, 204, 'Valais', 'VS', 1),
(3118, 204, 'Vaud', 'VD', 1),
(3119, 204, 'Zug', 'ZG', 1),
(3120, 204, 'Z&uuml;rich', 'ZH', 1),
(3121, 205, 'Al Hasakah', 'HA', 1),
(3122, 205, 'Al Ladhiqiyah', 'LA', 1),
(3123, 205, 'Al Qunaytirah', 'QU', 1),
(3124, 205, 'Ar Raqqah', 'RQ', 1),
(3125, 205, 'As Suwayda', 'SU', 1),
(3126, 205, 'Dara', 'DA', 1),
(3127, 205, 'Dayr az Zawr', 'DZ', 1),
(3128, 205, 'Dimashq', 'DI', 1),
(3129, 205, 'Halab', 'HL', 1),
(3130, 205, 'Hamah', 'HM', 1),
(3131, 205, 'Hims', 'HI', 1),
(3132, 205, 'Idlib', 'ID', 1),
(3133, 205, 'Rif Dimashq', 'RD', 1),
(3134, 205, 'Tartus', 'TA', 1),
(3135, 206, 'Chang-hua', 'CH', 1),
(3136, 206, 'Chia-i', 'CI', 1),
(3137, 206, 'Hsin-chu', 'HS', 1),
(3138, 206, 'Hua-lien', 'HL', 1),
(3139, 206, 'I-lan', 'IL', 1),
(3140, 206, 'Kao-hsiung county', 'KH', 1),
(3141, 206, 'Kin-men', 'KM', 1),
(3142, 206, 'Lien-chiang', 'LC', 1),
(3143, 206, 'Miao-li', 'ML', 1),
(3144, 206, 'Nan-t''ou', 'NT', 1),
(3145, 206, 'P''eng-hu', 'PH', 1),
(3146, 206, 'P''ing-tung', 'PT', 1),
(3147, 206, 'T''ai-chung', 'TG', 1),
(3148, 206, 'T''ai-nan', 'TA', 1),
(3149, 206, 'T''ai-pei county', 'TP', 1),
(3150, 206, 'T''ai-tung', 'TT', 1),
(3151, 206, 'T''ao-yuan', 'TY', 1),
(3152, 206, 'Yun-lin', 'YL', 1),
(3153, 206, 'Chia-i city', 'CC', 1),
(3154, 206, 'Chi-lung', 'CL', 1),
(3155, 206, 'Hsin-chu', 'HC', 1),
(3156, 206, 'T''ai-chung', 'TH', 1),
(3157, 206, 'T''ai-nan', 'TN', 1),
(3158, 206, 'Kao-hsiung city', 'KC', 1),
(3159, 206, 'T''ai-pei city', 'TC', 1),
(3160, 207, 'Gorno-Badakhstan', 'GB', 1),
(3161, 207, 'Khatlon', 'KT', 1),
(3162, 207, 'Sughd', 'SU', 1),
(3163, 208, 'Arusha', 'AR', 1),
(3164, 208, 'Dar es Salaam', 'DS', 1),
(3165, 208, 'Dodoma', 'DO', 1),
(3166, 208, 'Iringa', 'IR', 1),
(3167, 208, 'Kagera', 'KA', 1),
(3168, 208, 'Kigoma', 'KI', 1),
(3169, 208, 'Kilimanjaro', 'KJ', 1),
(3170, 208, 'Lindi', 'LN', 1),
(3171, 208, 'Manyara', 'MY', 1),
(3172, 208, 'Mara', 'MR', 1),
(3173, 208, 'Mbeya', 'MB', 1),
(3174, 208, 'Morogoro', 'MO', 1),
(3175, 208, 'Mtwara', 'MT', 1),
(3176, 208, 'Mwanza', 'MW', 1),
(3177, 208, 'Pemba North', 'PN', 1),
(3178, 208, 'Pemba South', 'PS', 1),
(3179, 208, 'Pwani', 'PW', 1),
(3180, 208, 'Rukwa', 'RK', 1),
(3181, 208, 'Ruvuma', 'RV', 1),
(3182, 208, 'Shinyanga', 'SH', 1),
(3183, 208, 'Singida', 'SI', 1),
(3184, 208, 'Tabora', 'TB', 1),
(3185, 208, 'Tanga', 'TN', 1),
(3186, 208, 'Zanzibar Central/South', 'ZC', 1),
(3187, 208, 'Zanzibar North', 'ZN', 1),
(3188, 208, 'Zanzibar Urban/West', 'ZU', 1),
(3189, 209, 'Amnat Charoen', 'Amnat Charoen', 1),
(3190, 209, 'Ang Thong', 'Ang Thong', 1),
(3191, 209, 'Ayutthaya', 'Ayutthaya', 1),
(3192, 209, 'Bangkok', 'Bangkok', 1),
(3193, 209, 'Buriram', 'Buriram', 1),
(3194, 209, 'Chachoengsao', 'Chachoengsao', 1),
(3195, 209, 'Chai Nat', 'Chai Nat', 1),
(3196, 209, 'Chaiyaphum', 'Chaiyaphum', 1),
(3197, 209, 'Chanthaburi', 'Chanthaburi', 1),
(3198, 209, 'Chiang Mai', 'Chiang Mai', 1),
(3199, 209, 'Chiang Rai', 'Chiang Rai', 1),
(3200, 209, 'Chon Buri', 'Chon Buri', 1),
(3201, 209, 'Chumphon', 'Chumphon', 1),
(3202, 209, 'Kalasin', 'Kalasin', 1),
(3203, 209, 'Kamphaeng Phet', 'Kamphaeng Phet', 1),
(3204, 209, 'Kanchanaburi', 'Kanchanaburi', 1),
(3205, 209, 'Khon Kaen', 'Khon Kaen', 1),
(3206, 209, 'Krabi', 'Krabi', 1),
(3207, 209, 'Lampang', 'Lampang', 1),
(3208, 209, 'Lamphun', 'Lamphun', 1),
(3209, 209, 'Loei', 'Loei', 1),
(3210, 209, 'Lop Buri', 'Lop Buri', 1),
(3211, 209, 'Mae Hong Son', 'Mae Hong Son', 1),
(3212, 209, 'Maha Sarakham', 'Maha Sarakham', 1),
(3213, 209, 'Mukdahan', 'Mukdahan', 1),
(3214, 209, 'Nakhon Nayok', 'Nakhon Nayok', 1),
(3215, 209, 'Nakhon Pathom', 'Nakhon Pathom', 1),
(3216, 209, 'Nakhon Phanom', 'Nakhon Phanom', 1),
(3217, 209, 'Nakhon Ratchasima', 'Nakhon Ratchasima', 1),
(3218, 209, 'Nakhon Sawan', 'Nakhon Sawan', 1),
(3219, 209, 'Nakhon Si Thammarat', 'Nakhon Si Thammarat', 1),
(3220, 209, 'Nan', 'Nan', 1),
(3221, 209, 'Narathiwat', 'Narathiwat', 1),
(3222, 209, 'Nong Bua Lamphu', 'Nong Bua Lamphu', 1),
(3223, 209, 'Nong Khai', 'Nong Khai', 1),
(3224, 209, 'Nonthaburi', 'Nonthaburi', 1),
(3225, 209, 'Pathum Thani', 'Pathum Thani', 1),
(3226, 209, 'Pattani', 'Pattani', 1),
(3227, 209, 'Phangnga', 'Phangnga', 1),
(3228, 209, 'Phatthalung', 'Phatthalung', 1),
(3229, 209, 'Phayao', 'Phayao', 1),
(3230, 209, 'Phetchabun', 'Phetchabun', 1),
(3231, 209, 'Phetchaburi', 'Phetchaburi', 1),
(3232, 209, 'Phichit', 'Phichit', 1),
(3233, 209, 'Phitsanulok', 'Phitsanulok', 1),
(3234, 209, 'Phrae', 'Phrae', 1),
(3235, 209, 'Phuket', 'Phuket', 1),
(3236, 209, 'Prachin Buri', 'Prachin Buri', 1),
(3237, 209, 'Prachuap Khiri Khan', 'Prachuap Khiri Khan', 1),
(3238, 209, 'Ranong', 'Ranong', 1),
(3239, 209, 'Ratchaburi', 'Ratchaburi', 1),
(3240, 209, 'Rayong', 'Rayong', 1),
(3241, 209, 'Roi Et', 'Roi Et', 1),
(3242, 209, 'Sa Kaeo', 'Sa Kaeo', 1),
(3243, 209, 'Sakon Nakhon', 'Sakon Nakhon', 1),
(3244, 209, 'Samut Prakan', 'Samut Prakan', 1),
(3245, 209, 'Samut Sakhon', 'Samut Sakhon', 1),
(3246, 209, 'Samut Songkhram', 'Samut Songkhram', 1),
(3247, 209, 'Sara Buri', 'Sara Buri', 1),
(3248, 209, 'Satun', 'Satun', 1),
(3249, 209, 'Sing Buri', 'Sing Buri', 1),
(3250, 209, 'Sisaket', 'Sisaket', 1),
(3251, 209, 'Songkhla', 'Songkhla', 1),
(3252, 209, 'Sukhothai', 'Sukhothai', 1),
(3253, 209, 'Suphan Buri', 'Suphan Buri', 1),
(3254, 209, 'Surat Thani', 'Surat Thani', 1),
(3255, 209, 'Surin', 'Surin', 1),
(3256, 209, 'Tak', 'Tak', 1),
(3257, 209, 'Trang', 'Trang', 1),
(3258, 209, 'Trat', 'Trat', 1),
(3259, 209, 'Ubon Ratchathani', 'Ubon Ratchathani', 1),
(3260, 209, 'Udon Thani', 'Udon Thani', 1),
(3261, 209, 'Uthai Thani', 'Uthai Thani', 1),
(3262, 209, 'Uttaradit', 'Uttaradit', 1),
(3263, 209, 'Yala', 'Yala', 1),
(3264, 209, 'Yasothon', 'Yasothon', 1),
(3265, 210, 'Kara', 'K', 1),
(3266, 210, 'Plateaux', 'P', 1),
(3267, 210, 'Savanes', 'S', 1),
(3268, 210, 'Centrale', 'C', 1),
(3269, 210, 'Maritime', 'M', 1),
(3270, 211, 'Atafu', 'A', 1),
(3271, 211, 'Fakaofo', 'F', 1),
(3272, 211, 'Nukunonu', 'N', 1),
(3273, 212, 'Ha''apai', 'H', 1),
(3274, 212, 'Tongatapu', 'T', 1),
(3275, 212, 'Vava''u', 'V', 1),
(3276, 213, 'Couva/Tabaquite/Talparo', 'CT', 1),
(3277, 213, 'Diego Martin', 'DM', 1),
(3278, 213, 'Mayaro/Rio Claro', 'MR', 1),
(3279, 213, 'Penal/Debe', 'PD', 1),
(3280, 213, 'Princes Town', 'PT', 1),
(3281, 213, 'Sangre Grande', 'SG', 1),
(3282, 213, 'San Juan/Laventille', 'SL', 1),
(3283, 213, 'Siparia', 'SI', 1),
(3284, 213, 'Tunapuna/Piarco', 'TP', 1),
(3285, 213, 'Port of Spain', 'PS', 1),
(3286, 213, 'San Fernando', 'SF', 1),
(3287, 213, 'Arima', 'AR', 1),
(3288, 213, 'Point Fortin', 'PF', 1),
(3289, 213, 'Chaguanas', 'CH', 1),
(3290, 213, 'Tobago', 'TO', 1),
(3291, 214, 'Ariana', 'AR', 1),
(3292, 214, 'Beja', 'BJ', 1),
(3293, 214, 'Ben Arous', 'BA', 1),
(3294, 214, 'Bizerte', 'BI', 1),
(3295, 214, 'Gabes', 'GB', 1),
(3296, 214, 'Gafsa', 'GF', 1),
(3297, 214, 'Jendouba', 'JE', 1),
(3298, 214, 'Kairouan', 'KR', 1),
(3299, 214, 'Kasserine', 'KS', 1),
(3300, 214, 'Kebili', 'KB', 1),
(3301, 214, 'Kef', 'KF', 1),
(3302, 214, 'Mahdia', 'MH', 1),
(3303, 214, 'Manouba', 'MN', 1),
(3304, 214, 'Medenine', 'ME', 1),
(3305, 214, 'Monastir', 'MO', 1),
(3306, 214, 'Nabeul', 'NA', 1),
(3307, 214, 'Sfax', 'SF', 1),
(3308, 214, 'Sidi', 'SD', 1),
(3309, 214, 'Siliana', 'SL', 1),
(3310, 214, 'Sousse', 'SO', 1),
(3311, 214, 'Tataouine', 'TA', 1),
(3312, 214, 'Tozeur', 'TO', 1),
(3313, 214, 'Tunis', 'TU', 1),
(3314, 214, 'Zaghouan', 'ZA', 1),
(3315, 215, 'Adana', 'ADA', 1),
(3316, 215, 'Adıyaman', 'ADI', 1),
(3317, 215, 'Afyonkarahisar', 'AFY', 1),
(3318, 215, 'Ağrı', 'AGR', 1),
(3319, 215, 'Aksaray', 'AKS', 1),
(3320, 215, 'Amasya', 'AMA', 1),
(3321, 215, 'Ankara', 'ANK', 1),
(3322, 215, 'Antalya', 'ANT', 1),
(3323, 215, 'Ardahan', 'ARD', 1),
(3324, 215, 'Artvin', 'ART', 1),
(3325, 215, 'Aydın', 'AYI', 1),
(3326, 215, 'Balıkesir', 'BAL', 1),
(3327, 215, 'Bartın', 'BAR', 1),
(3328, 215, 'Batman', 'BAT', 1),
(3329, 215, 'Bayburt', 'BAY', 1),
(3330, 215, 'Bilecik', 'BIL', 1),
(3331, 215, 'Bingöl', 'BIN', 1),
(3332, 215, 'Bitlis', 'BIT', 1),
(3333, 215, 'Bolu', 'BOL', 1),
(3334, 215, 'Burdur', 'BRD', 1),
(3335, 215, 'Bursa', 'BRS', 1),
(3336, 215, 'Çanakkale', 'CKL', 1),
(3337, 215, 'Çankırı', 'CKR', 1),
(3338, 215, 'Çorum', 'COR', 1),
(3339, 215, 'Denizli', 'DEN', 1),
(3340, 215, 'Diyarbakir', 'DIY', 1),
(3341, 215, 'Düzce', 'DUZ', 1),
(3342, 215, 'Edirne', 'EDI', 1),
(3343, 215, 'Elazığ', 'ELA', 1),
(3344, 215, 'Erzincan', 'EZC', 1),
(3345, 215, 'Erzurum', 'EZR', 1),
(3346, 215, 'Eskişehir', 'ESK', 1),
(3347, 215, 'Gaziantep', 'GAZ', 1),
(3348, 215, 'Giresun', 'GIR', 1),
(3349, 215, 'Gümüşhane', 'GMS', 1),
(3350, 215, 'Hakkari', 'HKR', 1),
(3351, 215, 'Hatay', 'HTY', 1),
(3352, 215, 'Iğdır', 'IGD', 1),
(3353, 215, 'Isparta', 'ISP', 1),
(3354, 215, 'İstanbul', 'IST', 1),
(3355, 215, 'İzmir', 'IZM', 1),
(3356, 215, 'Kahramanmaraş', 'KAH', 1),
(3357, 215, 'Karabük', 'KRB', 1),
(3358, 215, 'Karaman', 'KRM', 1),
(3359, 215, 'Kars', 'KRS', 1),
(3360, 215, 'Kastamonu', 'KAS', 1),
(3361, 215, 'Kayseri', 'KAY', 1),
(3362, 215, 'Kilis', 'KLS', 1),
(3363, 215, 'Kırıkkale', 'KRK', 1),
(3364, 215, 'Kırklareli', 'KLR', 1),
(3365, 215, 'Kırşehir', 'KRH', 1),
(3366, 215, 'Kocaeli', 'KOC', 1),
(3367, 215, 'Konya', 'KON', 1),
(3368, 215, 'Kütahya', 'KUT', 1),
(3369, 215, 'Malatya', 'MAL', 1),
(3370, 215, 'Manisa', 'MAN', 1),
(3371, 215, 'Mardin', 'MAR', 1),
(3372, 215, 'Mersin', 'MER', 1),
(3373, 215, 'Muğla', 'MUG', 1),
(3374, 215, 'Muş', 'MUS', 1),
(3375, 215, 'Nevşehir', 'NEV', 1),
(3376, 215, 'Niğde', 'NIG', 1),
(3377, 215, 'Ordu', 'ORD', 1),
(3378, 215, 'Osmaniye', 'OSM', 1),
(3379, 215, 'Rize', 'RIZ', 1),
(3380, 215, 'Sakarya', 'SAK', 1),
(3381, 215, 'Samsun', 'SAM', 1),
(3382, 215, 'Şanlıurfa', 'SAN', 1),
(3383, 215, 'Siirt', 'SII', 1),
(3384, 215, 'Sinop', 'SIN', 1),
(3385, 215, 'Şırnak', 'SIR', 1),
(3386, 215, 'Sivas', 'SIV', 1),
(3387, 215, 'Tekirdağ', 'TEL', 1),
(3388, 215, 'Tokat', 'TOK', 1),
(3389, 215, 'Trabzon', 'TRA', 1),
(3390, 215, 'Tunceli', 'TUN', 1),
(3391, 215, 'Uşak', 'USK', 1),
(3392, 215, 'Van', 'VAN', 1),
(3393, 215, 'Yalova', 'YAL', 1),
(3394, 215, 'Yozgat', 'YOZ', 1),
(3395, 215, 'Zonguldak', 'ZON', 1),
(3396, 216, 'Ahal Welayaty', 'A', 1),
(3397, 216, 'Balkan Welayaty', 'B', 1),
(3398, 216, 'Dashhowuz Welayaty', 'D', 1),
(3399, 216, 'Lebap Welayaty', 'L', 1),
(3400, 216, 'Mary Welayaty', 'M', 1),
(3401, 217, 'Ambergris Cays', 'AC', 1),
(3402, 217, 'Dellis Cay', 'DC', 1),
(3403, 217, 'French Cay', 'FC', 1),
(3404, 217, 'Little Water Cay', 'LW', 1),
(3405, 217, 'Parrot Cay', 'RC', 1),
(3406, 217, 'Pine Cay', 'PN', 1),
(3407, 217, 'Salt Cay', 'SL', 1),
(3408, 217, 'Grand Turk', 'GT', 1),
(3409, 217, 'South Caicos', 'SC', 1),
(3410, 217, 'East Caicos', 'EC', 1),
(3411, 217, 'Middle Caicos', 'MC', 1),
(3412, 217, 'North Caicos', 'NC', 1),
(3413, 217, 'Providenciales', 'PR', 1),
(3414, 217, 'West Caicos', 'WC', 1),
(3415, 218, 'Nanumanga', 'NMG', 1),
(3416, 218, 'Niulakita', 'NLK', 1),
(3417, 218, 'Niutao', 'NTO', 1),
(3418, 218, 'Funafuti', 'FUN', 1),
(3419, 218, 'Nanumea', 'NME', 1),
(3420, 218, 'Nui', 'NUI', 1),
(3421, 218, 'Nukufetau', 'NFT', 1),
(3422, 218, 'Nukulaelae', 'NLL', 1),
(3423, 218, 'Vaitupu', 'VAI', 1),
(3424, 219, 'Kalangala', 'KAL', 1),
(3425, 219, 'Kampala', 'KMP', 1),
(3426, 219, 'Kayunga', 'KAY', 1),
(3427, 219, 'Kiboga', 'KIB', 1),
(3428, 219, 'Luwero', 'LUW', 1),
(3429, 219, 'Masaka', 'MAS', 1),
(3430, 219, 'Mpigi', 'MPI', 1),
(3431, 219, 'Mubende', 'MUB', 1),
(3432, 219, 'Mukono', 'MUK', 1),
(3433, 219, 'Nakasongola', 'NKS', 1),
(3434, 219, 'Rakai', 'RAK', 1),
(3435, 219, 'Sembabule', 'SEM', 1),
(3436, 219, 'Wakiso', 'WAK', 1),
(3437, 219, 'Bugiri', 'BUG', 1),
(3438, 219, 'Busia', 'BUS', 1),
(3439, 219, 'Iganga', 'IGA', 1),
(3440, 219, 'Jinja', 'JIN', 1),
(3441, 219, 'Kaberamaido', 'KAB', 1),
(3442, 219, 'Kamuli', 'KML', 1),
(3443, 219, 'Kapchorwa', 'KPC', 1),
(3444, 219, 'Katakwi', 'KTK', 1),
(3445, 219, 'Kumi', 'KUM', 1),
(3446, 219, 'Mayuge', 'MAY', 1),
(3447, 219, 'Mbale', 'MBA', 1),
(3448, 219, 'Pallisa', 'PAL', 1),
(3449, 219, 'Sironko', 'SIR', 1),
(3450, 219, 'Soroti', 'SOR', 1),
(3451, 219, 'Tororo', 'TOR', 1),
(3452, 219, 'Adjumani', 'ADJ', 1),
(3453, 219, 'Apac', 'APC', 1),
(3454, 219, 'Arua', 'ARU', 1),
(3455, 219, 'Gulu', 'GUL', 1),
(3456, 219, 'Kitgum', 'KIT', 1),
(3457, 219, 'Kotido', 'KOT', 1),
(3458, 219, 'Lira', 'LIR', 1),
(3459, 219, 'Moroto', 'MRT', 1),
(3460, 219, 'Moyo', 'MOY', 1),
(3461, 219, 'Nakapiripirit', 'NAK', 1),
(3462, 219, 'Nebbi', 'NEB', 1),
(3463, 219, 'Pader', 'PAD', 1),
(3464, 219, 'Yumbe', 'YUM', 1),
(3465, 219, 'Bundibugyo', 'BUN', 1),
(3466, 219, 'Bushenyi', 'BSH', 1),
(3467, 219, 'Hoima', 'HOI', 1),
(3468, 219, 'Kabale', 'KBL', 1),
(3469, 219, 'Kabarole', 'KAR', 1),
(3470, 219, 'Kamwenge', 'KAM', 1),
(3471, 219, 'Kanungu', 'KAN', 1),
(3472, 219, 'Kasese', 'KAS', 1),
(3473, 219, 'Kibaale', 'KBA', 1),
(3474, 219, 'Kisoro', 'KIS', 1),
(3475, 219, 'Kyenjojo', 'KYE', 1),
(3476, 219, 'Masindi', 'MSN', 1),
(3477, 219, 'Mbarara', 'MBR', 1),
(3478, 219, 'Ntungamo', 'NTU', 1),
(3479, 219, 'Rukungiri', 'RUK', 1),
(3480, 220, 'Cherkasy', 'CK', 1),
(3481, 220, 'Chernihiv', 'CH', 1),
(3482, 220, 'Chernivtsi', 'CV', 1),
(3483, 220, 'Crimea', 'CR', 1),
(3484, 220, 'Dnipropetrovs''k', 'DN', 1),
(3485, 220, 'Donets''k', 'DO', 1),
(3486, 220, 'Ivano-Frankivs''k', 'IV', 1),
(3487, 220, 'Kharkiv Kherson', 'KL', 1),
(3488, 220, 'Khmel''nyts''kyy', 'KM', 1),
(3489, 220, 'Kirovohrad', 'KR', 1),
(3490, 220, 'Kiev', 'KV', 1),
(3491, 220, 'Kyyiv', 'KY', 1),
(3492, 220, 'Luhans''k', 'LU', 1),
(3493, 220, 'L''viv', 'LV', 1),
(3494, 220, 'Mykolayiv', 'MY', 1),
(3495, 220, 'Odesa', 'OD', 1),
(3496, 220, 'Poltava', 'PO', 1),
(3497, 220, 'Rivne', 'RI', 1),
(3498, 220, 'Sevastopol', 'SE', 1),
(3499, 220, 'Sumy', 'SU', 1),
(3500, 220, 'Ternopil''', 'TE', 1),
(3501, 220, 'Vinnytsya', 'VI', 1),
(3502, 220, 'Volyn''', 'VO', 1),
(3503, 220, 'Zakarpattya', 'ZK', 1),
(3504, 220, 'Zaporizhzhya', 'ZA', 1),
(3505, 220, 'Zhytomyr', 'ZH', 1),
(3506, 221, 'Abu Zaby', 'AZ', 1),
(3507, 221, '''Ajman', 'AJ', 1),
(3508, 221, 'Al Fujayrah', 'FU', 1),
(3509, 221, 'Ash Shariqah', 'SH', 1),
(3510, 221, 'Dubayy', 'DU', 1),
(3511, 221, 'R''as al Khaymah', 'RK', 1),
(3512, 221, 'Umm al Qaywayn', 'UQ', 1),
(3513, 222, 'Aberdeen', 'ABN', 1),
(3514, 222, 'Aberdeenshire', 'ABNS', 1),
(3515, 222, 'Anglesey', 'ANG', 1),
(3516, 222, 'Angus', 'AGS', 1),
(3517, 222, 'Argyll and Bute', 'ARY', 1),
(3518, 222, 'Bedfordshire', 'BEDS', 1),
(3519, 222, 'Berkshire', 'BERKS', 1),
(3520, 222, 'Blaenau Gwent', 'BLA', 1),
(3521, 222, 'Bridgend', 'BRI', 1),
(3522, 222, 'Bristol', 'BSTL', 1),
(3523, 222, 'Buckinghamshire', 'BUCKS', 1),
(3524, 222, 'Caerphilly', 'CAE', 1),
(3525, 222, 'Cambridgeshire', 'CAMBS', 1),
(3526, 222, 'Cardiff', 'CDF', 1),
(3527, 222, 'Carmarthenshire', 'CARM', 1),
(3528, 222, 'Ceredigion', 'CDGN', 1),
(3529, 222, 'Cheshire', 'CHES', 1),
(3530, 222, 'Clackmannanshire', 'CLACK', 1),
(3531, 222, 'Conwy', 'CON', 1),
(3532, 222, 'Cornwall', 'CORN', 1),
(3533, 222, 'Denbighshire', 'DNBG', 1),
(3534, 222, 'Derbyshire', 'DERBY', 1),
(3535, 222, 'Devon', 'DVN', 1),
(3536, 222, 'Dorset', 'DOR', 1),
(3537, 222, 'Dumfries and Galloway', 'DGL', 1),
(3538, 222, 'Dundee', 'DUND', 1),
(3539, 222, 'Durham', 'DHM', 1),
(3540, 222, 'East Ayrshire', 'ARYE', 1),
(3541, 222, 'East Dunbartonshire', 'DUNBE', 1),
(3542, 222, 'East Lothian', 'LOTE', 1),
(3543, 222, 'East Renfrewshire', 'RENE', 1),
(3544, 222, 'East Riding of Yorkshire', 'ERYS', 1),
(3545, 222, 'East Sussex', 'SXE', 1),
(3546, 222, 'Edinburgh', 'EDIN', 1),
(3547, 222, 'Essex', 'ESX', 1),
(3548, 222, 'Falkirk', 'FALK', 1),
(3549, 222, 'Fife', 'FFE', 1),
(3550, 222, 'Flintshire', 'FLINT', 1),
(3551, 222, 'Glasgow', 'GLAS', 1),
(3552, 222, 'Gloucestershire', 'GLOS', 1),
(3553, 222, 'Greater London', 'LDN', 1),
(3554, 222, 'Greater Manchester', 'MCH', 1),
(3555, 222, 'Gwynedd', 'GDD', 1),
(3556, 222, 'Hampshire', 'HANTS', 1),
(3557, 222, 'Herefordshire', 'HWR', 1),
(3558, 222, 'Hertfordshire', 'HERTS', 1),
(3559, 222, 'Highlands', 'HLD', 1),
(3560, 222, 'Inverclyde', 'IVER', 1),
(3561, 222, 'Isle of Wight', 'IOW', 1),
(3562, 222, 'Kent', 'KNT', 1),
(3563, 222, 'Lancashire', 'LANCS', 1),
(3564, 222, 'Leicestershire', 'LEICS', 1),
(3565, 222, 'Lincolnshire', 'LINCS', 1),
(3566, 222, 'Merseyside', 'MSY', 1),
(3567, 222, 'Merthyr Tydfil', 'MERT', 1),
(3568, 222, 'Midlothian', 'MLOT', 1),
(3569, 222, 'Monmouthshire', 'MMOUTH', 1),
(3570, 222, 'Moray', 'MORAY', 1),
(3571, 222, 'Neath Port Talbot', 'NPRTAL', 1),
(3572, 222, 'Newport', 'NEWPT', 1),
(3573, 222, 'Norfolk', 'NOR', 1),
(3574, 222, 'North Ayrshire', 'ARYN', 1),
(3575, 222, 'North Lanarkshire', 'LANN', 1),
(3576, 222, 'North Yorkshire', 'YSN', 1),
(3577, 222, 'Northamptonshire', 'NHM', 1),
(3578, 222, 'Northumberland', 'NLD', 1),
(3579, 222, 'Nottinghamshire', 'NOT', 1),
(3580, 222, 'Orkney Islands', 'ORK', 1),
(3581, 222, 'Oxfordshire', 'OFE', 1),
(3582, 222, 'Pembrokeshire', 'PEM', 1),
(3583, 222, 'Perth and Kinross', 'PERTH', 1),
(3584, 222, 'Powys', 'PWS', 1),
(3585, 222, 'Renfrewshire', 'REN', 1),
(3586, 222, 'Rhondda Cynon Taff', 'RHON', 1),
(3587, 222, 'Rutland', 'RUT', 1),
(3588, 222, 'Scottish Borders', 'BOR', 1),
(3589, 222, 'Shetland Islands', 'SHET', 1),
(3590, 222, 'Shropshire', 'SPE', 1),
(3591, 222, 'Somerset', 'SOM', 1),
(3592, 222, 'South Ayrshire', 'ARYS', 1),
(3593, 222, 'South Lanarkshire', 'LANS', 1),
(3594, 222, 'South Yorkshire', 'YSS', 1),
(3595, 222, 'Staffordshire', 'SFD', 1),
(3596, 222, 'Stirling', 'STIR', 1),
(3597, 222, 'Suffolk', 'SFK', 1),
(3598, 222, 'Surrey', 'SRY', 1),
(3599, 222, 'Swansea', 'SWAN', 1),
(3600, 222, 'Torfaen', 'TORF', 1),
(3601, 222, 'Tyne and Wear', 'TWR', 1),
(3602, 222, 'Vale of Glamorgan', 'VGLAM', 1),
(3603, 222, 'Warwickshire', 'WARKS', 1),
(3604, 222, 'West Dunbartonshire', 'WDUN', 1),
(3605, 222, 'West Lothian', 'WLOT', 1),
(3606, 222, 'West Midlands', 'WMD', 1),
(3607, 222, 'West Sussex', 'SXW', 1),
(3608, 222, 'West Yorkshire', 'YSW', 1),
(3609, 222, 'Western Isles', 'WIL', 1),
(3610, 222, 'Wiltshire', 'WLT', 1),
(3611, 222, 'Worcestershire', 'WORCS', 1),
(3612, 222, 'Wrexham', 'WRX', 1),
(3613, 223, 'Alabama', 'AL', 1),
(3614, 223, 'Alaska', 'AK', 1),
(3615, 223, 'American Samoa', 'AS', 1),
(3616, 223, 'Arizona', 'AZ', 1),
(3617, 223, 'Arkansas', 'AR', 1),
(3618, 223, 'Armed Forces Africa', 'AF', 1),
(3619, 223, 'Armed Forces Americas', 'AA', 1),
(3620, 223, 'Armed Forces Canada', 'AC', 1),
(3621, 223, 'Armed Forces Europe', 'AE', 1),
(3622, 223, 'Armed Forces Middle East', 'AM', 1),
(3623, 223, 'Armed Forces Pacific', 'AP', 1),
(3624, 223, 'California', 'CA', 1),
(3625, 223, 'Colorado', 'CO', 1),
(3626, 223, 'Connecticut', 'CT', 1),
(3627, 223, 'Delaware', 'DE', 1),
(3628, 223, 'District of Columbia', 'DC', 1),
(3629, 223, 'Federated States Of Micronesia', 'FM', 1),
(3630, 223, 'Florida', 'FL', 1),
(3631, 223, 'Georgia', 'GA', 1),
(3632, 223, 'Guam', 'GU', 1),
(3633, 223, 'Hawaii', 'HI', 1),
(3634, 223, 'Idaho', 'ID', 1),
(3635, 223, 'Illinois', 'IL', 1),
(3636, 223, 'Indiana', 'IN', 1),
(3637, 223, 'Iowa', 'IA', 1),
(3638, 223, 'Kansas', 'KS', 1),
(3639, 223, 'Kentucky', 'KY', 1),
(3640, 223, 'Louisiana', 'LA', 1),
(3641, 223, 'Maine', 'ME', 1),
(3642, 223, 'Marshall Islands', 'MH', 1),
(3643, 223, 'Maryland', 'MD', 1),
(3644, 223, 'Massachusetts', 'MA', 1),
(3645, 223, 'Michigan', 'MI', 1),
(3646, 223, 'Minnesota', 'MN', 1),
(3647, 223, 'Mississippi', 'MS', 1),
(3648, 223, 'Missouri', 'MO', 1),
(3649, 223, 'Montana', 'MT', 1),
(3650, 223, 'Nebraska', 'NE', 1),
(3651, 223, 'Nevada', 'NV', 1),
(3652, 223, 'New Hampshire', 'NH', 1),
(3653, 223, 'New Jersey', 'NJ', 1),
(3654, 223, 'New Mexico', 'NM', 1),
(3655, 223, 'New York', 'NY', 1),
(3656, 223, 'North Carolina', 'NC', 1),
(3657, 223, 'North Dakota', 'ND', 1),
(3658, 223, 'Northern Mariana Islands', 'MP', 1),
(3659, 223, 'Ohio', 'OH', 1),
(3660, 223, 'Oklahoma', 'OK', 1),
(3661, 223, 'Oregon', 'OR', 1),
(3662, 223, 'Palau', 'PW', 1),
(3663, 223, 'Pennsylvania', 'PA', 1),
(3664, 223, 'Puerto Rico', 'PR', 1),
(3665, 223, 'Rhode Island', 'RI', 1),
(3666, 223, 'South Carolina', 'SC', 1),
(3667, 223, 'South Dakota', 'SD', 1),
(3668, 223, 'Tennessee', 'TN', 1),
(3669, 223, 'Texas', 'TX', 1),
(3670, 223, 'Utah', 'UT', 1),
(3671, 223, 'Vermont', 'VT', 1),
(3672, 223, 'Virgin Islands', 'VI', 1),
(3673, 223, 'Virginia', 'VA', 1),
(3674, 223, 'Washington', 'WA', 1),
(3675, 223, 'West Virginia', 'WV', 1),
(3676, 223, 'Wisconsin', 'WI', 1),
(3677, 223, 'Wyoming', 'WY', 1),
(3678, 224, 'Baker Island', 'BI', 1),
(3679, 224, 'Howland Island', 'HI', 1),
(3680, 224, 'Jarvis Island', 'JI', 1),
(3681, 224, 'Johnston Atoll', 'JA', 1),
(3682, 224, 'Kingman Reef', 'KR', 1),
(3683, 224, 'Midway Atoll', 'MA', 1),
(3684, 224, 'Navassa Island', 'NI', 1),
(3685, 224, 'Palmyra Atoll', 'PA', 1),
(3686, 224, 'Wake Island', 'WI', 1),
(3687, 225, 'Artigas', 'AR', 1),
(3688, 225, 'Canelones', 'CA', 1),
(3689, 225, 'Cerro Largo', 'CL', 1),
(3690, 225, 'Colonia', 'CO', 1),
(3691, 225, 'Durazno', 'DU', 1),
(3692, 225, 'Flores', 'FS', 1),
(3693, 225, 'Florida', 'FA', 1),
(3694, 225, 'Lavalleja', 'LA', 1),
(3695, 225, 'Maldonado', 'MA', 1),
(3696, 225, 'Montevideo', 'MO', 1),
(3697, 225, 'Paysandu', 'PA', 1),
(3698, 225, 'Rio Negro', 'RN', 1),
(3699, 225, 'Rivera', 'RV', 1),
(3700, 225, 'Rocha', 'RO', 1),
(3701, 225, 'Salto', 'SL', 1),
(3702, 225, 'San Jose', 'SJ', 1),
(3703, 225, 'Soriano', 'SO', 1),
(3704, 225, 'Tacuarembo', 'TA', 1),
(3705, 225, 'Treinta y Tres', 'TT', 1),
(3706, 226, 'Andijon', 'AN', 1),
(3707, 226, 'Buxoro', 'BU', 1),
(3708, 226, 'Farg''ona', 'FA', 1),
(3709, 226, 'Jizzax', 'JI', 1),
(3710, 226, 'Namangan', 'NG', 1),
(3711, 226, 'Navoiy', 'NW', 1),
(3712, 226, 'Qashqadaryo', 'QA', 1),
(3713, 226, 'Qoraqalpog''iston Republikasi', 'QR', 1),
(3714, 226, 'Samarqand', 'SA', 1),
(3715, 226, 'Sirdaryo', 'SI', 1),
(3716, 226, 'Surxondaryo', 'SU', 1),
(3717, 226, 'Toshkent City', 'TK', 1),
(3718, 226, 'Toshkent Region', 'TO', 1),
(3719, 226, 'Xorazm', 'XO', 1),
(3720, 227, 'Malampa', 'MA', 1),
(3721, 227, 'Penama', 'PE', 1),
(3722, 227, 'Sanma', 'SA', 1),
(3723, 227, 'Shefa', 'SH', 1),
(3724, 227, 'Tafea', 'TA', 1),
(3725, 227, 'Torba', 'TO', 1),
(3726, 229, 'Amazonas', 'AM', 1),
(3727, 229, 'Anzoategui', 'AN', 1),
(3728, 229, 'Apure', 'AP', 1),
(3729, 229, 'Aragua', 'AR', 1),
(3730, 229, 'Barinas', 'BA', 1),
(3731, 229, 'Bolivar', 'BO', 1),
(3732, 229, 'Carabobo', 'CA', 1),
(3733, 229, 'Cojedes', 'CO', 1),
(3734, 229, 'Delta Amacuro', 'DA', 1),
(3735, 229, 'Dependencias Federales', 'DF', 1),
(3736, 229, 'Distrito Federal', 'DI', 1),
(3737, 229, 'Falcon', 'FA', 1),
(3738, 229, 'Guarico', 'GU', 1),
(3739, 229, 'Lara', 'LA', 1),
(3740, 229, 'Merida', 'ME', 1),
(3741, 229, 'Miranda', 'MI', 1),
(3742, 229, 'Monagas', 'MO', 1),
(3743, 229, 'Nueva Esparta', 'NE', 1),
(3744, 229, 'Portuguesa', 'PO', 1),
(3745, 229, 'Sucre', 'SU', 1),
(3746, 229, 'Tachira', 'TA', 1),
(3747, 229, 'Trujillo', 'TR', 1),
(3748, 229, 'Vargas', 'VA', 1),
(3749, 229, 'Yaracuy', 'YA', 1),
(3750, 229, 'Zulia', 'ZU', 1),
(3751, 230, 'An Giang', 'AG', 1),
(3752, 230, 'Bac Giang', 'BG', 1),
(3753, 230, 'Bac Kan', 'BK', 1),
(3754, 230, 'Bac Lieu', 'BL', 1),
(3755, 230, 'Bac Ninh', 'BC', 1),
(3756, 230, 'Ba Ria-Vung Tau', 'BR', 1),
(3757, 230, 'Ben Tre', 'BN', 1),
(3758, 230, 'Binh Dinh', 'BH', 1),
(3759, 230, 'Binh Duong', 'BU', 1),
(3760, 230, 'Binh Phuoc', 'BP', 1),
(3761, 230, 'Binh Thuan', 'BT', 1),
(3762, 230, 'Ca Mau', 'CM', 1),
(3763, 230, 'Can Tho', 'CT', 1),
(3764, 230, 'Cao Bang', 'CB', 1),
(3765, 230, 'Dak Lak', 'DL', 1),
(3766, 230, 'Dak Nong', 'DG', 1),
(3767, 230, 'Da Nang', 'DN', 1),
(3768, 230, 'Dien Bien', 'DB', 1),
(3769, 230, 'Dong Nai', 'DI', 1),
(3770, 230, 'Dong Thap', 'DT', 1),
(3771, 230, 'Gia Lai', 'GL', 1),
(3772, 230, 'Ha Giang', 'HG', 1),
(3773, 230, 'Hai Duong', 'HD', 1),
(3774, 230, 'Hai Phong', 'HP', 1),
(3775, 230, 'Ha Nam', 'HM', 1),
(3776, 230, 'Ha Noi', 'HI', 1),
(3777, 230, 'Ha Tay', 'HT', 1),
(3778, 230, 'Ha Tinh', 'HH', 1),
(3779, 230, 'Hoa Binh', 'HB', 1),
(3780, 230, 'Ho Chi Minh City', 'HC', 1),
(3781, 230, 'Hau Giang', 'HU', 1),
(3782, 230, 'Hung Yen', 'HY', 1),
(3783, 232, 'Saint Croix', 'C', 1),
(3784, 232, 'Saint John', 'J', 1),
(3785, 232, 'Saint Thomas', 'T', 1),
(3786, 233, 'Alo', 'A', 1),
(3787, 233, 'Sigave', 'S', 1),
(3788, 233, 'Wallis', 'W', 1),
(3789, 235, 'Abyan', 'AB', 1),
(3790, 235, 'Adan', 'AD', 1),
(3791, 235, 'Amran', 'AM', 1),
(3792, 235, 'Al Bayda', 'BA', 1),
(3793, 235, 'Ad Dali', 'DA', 1),
(3794, 235, 'Dhamar', 'DH', 1),
(3795, 235, 'Hadramawt', 'HD', 1),
(3796, 235, 'Hajjah', 'HJ', 1),
(3797, 235, 'Al Hudaydah', 'HU', 1),
(3798, 235, 'Ibb', 'IB', 1),
(3799, 235, 'Al Jawf', 'JA', 1),
(3800, 235, 'Lahij', 'LA', 1),
(3801, 235, 'Ma''rib', 'MA', 1),
(3802, 235, 'Al Mahrah', 'MR', 1),
(3803, 235, 'Al Mahwit', 'MW', 1),
(3804, 235, 'Sa''dah', 'SD', 1),
(3805, 235, 'San''a', 'SN', 1),
(3806, 235, 'Shabwah', 'SH', 1),
(3807, 235, 'Ta''izz', 'TA', 1),
(3812, 237, 'Bas-Congo', 'BC', 1),
(3813, 237, 'Bandundu', 'BN', 1),
(3814, 237, 'Equateur', 'EQ', 1),
(3815, 237, 'Katanga', 'KA', 1),
(3816, 237, 'Kasai-Oriental', 'KE', 1),
(3817, 237, 'Kinshasa', 'KN', 1),
(3818, 237, 'Kasai-Occidental', 'KW', 1),
(3819, 237, 'Maniema', 'MA', 1),
(3820, 237, 'Nord-Kivu', 'NK', 1),
(3821, 237, 'Orientale', 'OR', 1),
(3822, 237, 'Sud-Kivu', 'SK', 1),
(3823, 238, 'Central', 'CE', 1),
(3824, 238, 'Copperbelt', 'CB', 1),
(3825, 238, 'Eastern', 'EA', 1),
(3826, 238, 'Luapula', 'LP', 1),
(3827, 238, 'Lusaka', 'LK', 1),
(3828, 238, 'Northern', 'NO', 1),
(3829, 238, 'North-Western', 'NW', 1),
(3830, 238, 'Southern', 'SO', 1),
(3831, 238, 'Western', 'WE', 1),
(3832, 239, 'Bulawayo', 'BU', 1),
(3833, 239, 'Harare', 'HA', 1),
(3834, 239, 'Manicaland', 'ML', 1),
(3835, 239, 'Mashonaland Central', 'MC', 1),
(3836, 239, 'Mashonaland East', 'ME', 1),
(3837, 239, 'Mashonaland West', 'MW', 1),
(3838, 239, 'Masvingo', 'MV', 1),
(3839, 239, 'Matabeleland North', 'MN', 1),
(3840, 239, 'Matabeleland South', 'MS', 1),
(3841, 239, 'Midlands', 'MD', 1),
(3861, 105, 'Campobasso', 'CB', 1),
(3862, 105, 'Carbonia-Iglesias', 'CI', 1),
(3863, 105, 'Caserta', 'CE', 1),
(3864, 105, 'Catania', 'CT', 1),
(3865, 105, 'Catanzaro', 'CZ', 1),
(3866, 105, 'Chieti', 'CH', 1),
(3867, 105, 'Como', 'CO', 1),
(3868, 105, 'Cosenza', 'CS', 1),
(3869, 105, 'Cremona', 'CR', 1),
(3870, 105, 'Crotone', 'KR', 1),
(3871, 105, 'Cuneo', 'CN', 1),
(3872, 105, 'Enna', 'EN', 1),
(3873, 105, 'Ferrara', 'FE', 1),
(3874, 105, 'Firenze', 'FI', 1),
(3875, 105, 'Foggia', 'FG', 1),
(3876, 105, 'Forli-Cesena', 'FC', 1),
(3877, 105, 'Frosinone', 'FR', 1),
(3878, 105, 'Genova', 'GE', 1),
(3879, 105, 'Gorizia', 'GO', 1),
(3880, 105, 'Grosseto', 'GR', 1),
(3881, 105, 'Imperia', 'IM', 1),
(3882, 105, 'Isernia', 'IS', 1),
(3883, 105, 'L&#39;Aquila', 'AQ', 1),
(3884, 105, 'La Spezia', 'SP', 1),
(3885, 105, 'Latina', 'LT', 1),
(3886, 105, 'Lecce', 'LE', 1),
(3887, 105, 'Lecco', 'LC', 1),
(3888, 105, 'Livorno', 'LI', 1),
(3889, 105, 'Lodi', 'LO', 1),
(3890, 105, 'Lucca', 'LU', 1),
(3891, 105, 'Macerata', 'MC', 1),
(3892, 105, 'Mantova', 'MN', 1),
(3893, 105, 'Massa-Carrara', 'MS', 1),
(3894, 105, 'Matera', 'MT', 1),
(3895, 105, 'Medio Campidano', 'VS', 1),
(3896, 105, 'Messina', 'ME', 1),
(3897, 105, 'Milano', 'MI', 1),
(3898, 105, 'Modena', 'MO', 1),
(3899, 105, 'Napoli', 'NA', 1),
(3900, 105, 'Novara', 'NO', 1),
(3901, 105, 'Nuoro', 'NU', 1),
(3902, 105, 'Ogliastra', 'OG', 1),
(3903, 105, 'Olbia-Tempio', 'OT', 1),
(3904, 105, 'Oristano', 'OR', 1),
(3905, 105, 'Padova', 'PD', 1),
(3906, 105, 'Palermo', 'PA', 1),
(3907, 105, 'Parma', 'PR', 1),
(3908, 105, 'Pavia', 'PV', 1),
(3909, 105, 'Perugia', 'PG', 1),
(3910, 105, 'Pesaro e Urbino', 'PU', 1),
(3911, 105, 'Pescara', 'PE', 1),
(3912, 105, 'Piacenza', 'PC', 1),
(3913, 105, 'Pisa', 'PI', 1),
(3914, 105, 'Pistoia', 'PT', 1),
(3915, 105, 'Pordenone', 'PN', 1),
(3916, 105, 'Potenza', 'PZ', 1),
(3917, 105, 'Prato', 'PO', 1),
(3918, 105, 'Ragusa', 'RG', 1),
(3919, 105, 'Ravenna', 'RA', 1),
(3920, 105, 'Reggio Calabria', 'RC', 1),
(3921, 105, 'Reggio Emilia', 'RE', 1),
(3922, 105, 'Rieti', 'RI', 1),
(3923, 105, 'Rimini', 'RN', 1),
(3924, 105, 'Roma', 'RM', 1),
(3925, 105, 'Rovigo', 'RO', 1),
(3926, 105, 'Salerno', 'SA', 1),
(3927, 105, 'Sassari', 'SS', 1),
(3928, 105, 'Savona', 'SV', 1),
(3929, 105, 'Siena', 'SI', 1),
(3930, 105, 'Siracusa', 'SR', 1),
(3931, 105, 'Sondrio', 'SO', 1),
(3932, 105, 'Taranto', 'TA', 1),
(3933, 105, 'Teramo', 'TE', 1),
(3934, 105, 'Terni', 'TR', 1),
(3935, 105, 'Torino', 'TO', 1),
(3936, 105, 'Trapani', 'TP', 1),
(3937, 105, 'Trento', 'TN', 1),
(3938, 105, 'Treviso', 'TV', 1),
(3939, 105, 'Trieste', 'TS', 1),
(3940, 105, 'Udine', 'UD', 1),
(3941, 105, 'Varese', 'VA', 1),
(3942, 105, 'Venezia', 'VE', 1),
(3943, 105, 'Verbano-Cusio-Ossola', 'VB', 1),
(3944, 105, 'Vercelli', 'VC', 1),
(3945, 105, 'Verona', 'VR', 1),
(3946, 105, 'Vibo Valentia', 'VV', 1),
(3947, 105, 'Vicenza', 'VI', 1),
(3948, 105, 'Viterbo', 'VT', 1),
(3949, 222, 'County Antrim', 'ANT', 1),
(3950, 222, 'County Armagh', 'ARM', 1),
(3951, 222, 'County Down', 'DOW', 1),
(3952, 222, 'County Fermanagh', 'FER', 1),
(3953, 222, 'County Londonderry', 'LDY', 1),
(3954, 222, 'County Tyrone', 'TYR', 1),
(3955, 222, 'Cumbria', 'CMA', 1),
(3956, 190, 'Pomurska', '1', 1),
(3957, 190, 'Podravska', '2', 1),
(3958, 190, 'Koroška', '3', 1),
(3959, 190, 'Savinjska', '4', 1),
(3960, 190, 'Zasavska', '5', 1),
(3961, 190, 'Spodnjeposavska', '6', 1),
(3962, 190, 'Jugovzhodna Slovenija', '7', 1),
(3963, 190, 'Osrednjeslovenska', '8', 1),
(3964, 190, 'Gorenjska', '9', 1),
(3965, 190, 'Notranjsko-kraška', '10', 1),
(3966, 190, 'Goriška', '11', 1),
(3967, 190, 'Obalno-kraška', '12', 1),
(3968, 33, 'Ruse', '', 1),
(3969, 101, 'Alborz', 'ALB', 1),
(3970, 21, 'Brussels-Capital Region', 'BRU', 1),
(3971, 138, 'Aguascalientes', 'AG', 1),
(3972, 222, 'Isle of Man', 'IOM', 1),
(3973, 242, 'Andrijevica', '01', 1),
(3974, 242, 'Bar', '02', 1),
(3975, 242, 'Berane', '03', 1),
(3976, 242, 'Bijelo Polje', '04', 1),
(3977, 242, 'Budva', '05', 1),
(3978, 242, 'Cetinje', '06', 1),
(3979, 242, 'Danilovgrad', '07', 1),
(3980, 242, 'Herceg-Novi', '08', 1),
(3981, 242, 'Kolašin', '09', 1),
(3982, 242, 'Kotor', '10', 1),
(3983, 242, 'Mojkovac', '11', 1),
(3984, 242, 'Nikšić', '12', 1),
(3985, 242, 'Plav', '13', 1),
(3986, 242, 'Pljevlja', '14', 1),
(3987, 242, 'Plužine', '15', 1),
(3988, 242, 'Podgorica', '16', 1),
(3989, 242, 'Rožaje', '17', 1),
(3990, 242, 'Šavnik', '18', 1),
(3991, 242, 'Tivat', '19', 1),
(3992, 242, 'Ulcinj', '20', 1),
(3993, 242, 'Žabljak', '21', 1),
(3994, 243, 'Belgrade', '00', 1),
(3995, 243, 'North Bačka', '01', 1),
(3996, 243, 'Central Banat', '02', 1),
(3997, 243, 'North Banat', '03', 1),
(3998, 243, 'South Banat', '04', 1),
(3999, 243, 'West Bačka', '05', 1),
(4000, 243, 'South Bačka', '06', 1),
(4001, 243, 'Srem', '07', 1),
(4002, 243, 'Mačva', '08', 1),
(4003, 243, 'Kolubara', '09', 1),
(4004, 243, 'Podunavlje', '10', 1),
(4005, 243, 'Braničevo', '11', 1),
(4006, 243, 'Šumadija', '12', 1),
(4007, 243, 'Pomoravlje', '13', 1),
(4008, 243, 'Bor', '14', 1),
(4009, 243, 'Zaječar', '15', 1),
(4010, 243, 'Zlatibor', '16', 1),
(4011, 243, 'Moravica', '17', 1),
(4012, 243, 'Raška', '18', 1),
(4013, 243, 'Rasina', '19', 1),
(4014, 243, 'Nišava', '20', 1),
(4015, 243, 'Toplica', '21', 1),
(4016, 243, 'Pirot', '22', 1),
(4017, 243, 'Jablanica', '23', 1),
(4018, 243, 'Pčinja', '24', 1),
(4019, 243, 'Kosovo', 'KM', 1),
(4020, 245, 'Bonaire', 'BO', 1),
(4021, 245, 'Saba', 'SA', 1),
(4022, 245, 'Sint Eustatius', 'SE', 1),
(4023, 248, 'Central Equatoria', 'EC', 1),
(4024, 248, 'Eastern Equatoria', 'EE', 1),
(4025, 248, 'Jonglei', 'JG', 1),
(4026, 248, 'Lakes', 'LK', 1),
(4027, 248, 'Northern Bahr el-Ghazal', 'BN', 1),
(4028, 248, 'Unity', 'UY', 1),
(4029, 248, 'Upper Nile', 'NU', 1),
(4030, 248, 'Warrap', 'WR', 1),
(4031, 248, 'Western Bahr el-Ghazal', 'BW', 1),
(4032, 248, 'Western Equatoria', 'EW', 1);

-- --------------------------------------------------------

--
-- Table structure for table `zone_to_geo_zone`
--

CREATE TABLE IF NOT EXISTS `zone_to_geo_zone` (
  `zone_to_geo_zone_id` int(11) NOT NULL AUTO_INCREMENT,
  `country_id` int(11) NOT NULL,
  `zone_id` int(11) NOT NULL DEFAULT '0',
  `geo_zone_id` int(11) NOT NULL,
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`zone_to_geo_zone_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=66 ;

--
-- Dumping data for table `zone_to_geo_zone`
--

INSERT INTO `zone_to_geo_zone` (`zone_to_geo_zone_id`, `country_id`, `zone_id`, `geo_zone_id`, `date_added`, `date_modified`) VALUES
(57, 222, 0, 3, '2010-02-26 22:33:24', '0000-00-00 00:00:00'),
(65, 222, 0, 4, '2010-12-15 15:18:13', '0000-00-00 00:00:00');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

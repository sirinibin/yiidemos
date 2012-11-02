-- phpMyAdmin SQL Dump
-- version 3.4.10.1deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Nov 02, 2012 at 10:40 AM
-- Server version: 5.5.24
-- PHP Version: 5.3.10-1ubuntu3.4

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `leaveagift`
--

-- --------------------------------------------------------

--
-- Table structure for table `lag_brand_images`
--

CREATE TABLE IF NOT EXISTS `lag_brand_images` (
  `id_image` int(11) NOT NULL AUTO_INCREMENT,
  `id_brand` int(11) NOT NULL,
  `filename` varchar(300) COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` int(11) NOT NULL,
  PRIMARY KEY (`id_image`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=7 ;

--
-- Dumping data for table `lag_brand_images`
--

INSERT INTO `lag_brand_images` (`id_image`, `id_brand`, `filename`, `position`) VALUES
(1, 1, 'brand-barc-big.jpg122559.jpg', 0),
(2, 2, 'brand-barc-big.jpg222559.jpg', 0),
(3, 2, 'brand-barc-big.jpg210026.222222222222.jpg', 2),
(4, 2, 'brand-barc-big.jpg222559.jpg', 1),
(5, 1, 'brand-barc-big.jpg122559.jpg110026.222222222222.jpg', 2),
(6, 1, 'brand-barc-big.jpg122559.jpg', 1);

-- --------------------------------------------------------

--
-- Table structure for table `lag_order_voucher`
--

CREATE TABLE IF NOT EXISTS `lag_order_voucher` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `id_order` int(128) NOT NULL,
  `id_voucher` int(128) NOT NULL,
  `validity` datetime NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_order`),
  UNIQUE KEY `id` (`id`),
  KEY `id_voucher` (`id_voucher`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=14 ;

--
-- Dumping data for table `lag_order_voucher`
--

INSERT INTO `lag_order_voucher` (`id`, `id_order`, `id_voucher`, `validity`, `timestamp`) VALUES
(3, 2312312, 2, '2013-01-13 00:00:00', '2012-10-17 16:11:45'),
(1, 2312314, 406, '2013-01-08 00:00:00', '2012-10-15 05:29:51'),
(2, 2312318, 1, '2013-01-13 00:00:00', '2012-10-16 19:48:07'),
(5, 2312388, 407, '2013-01-08 00:00:00', '2012-10-21 07:55:35'),
(4, 2312394, 406, '2013-01-08 00:00:00', '2012-10-21 07:20:39'),
(6, 2312404, 3, '2013-01-13 00:00:00', '2012-10-21 07:57:19'),
(7, 2312406, 408, '2013-01-08 00:00:00', '2012-10-21 08:02:07'),
(8, 2312407, 4, '2013-01-13 00:00:00', '2012-10-21 08:10:15'),
(9, 2312411, 1361, '2012-12-31 00:00:00', '2012-10-23 14:22:32'),
(10, 2312423, 5, '2013-01-13 00:00:00', '2012-10-23 15:30:25'),
(11, 2312425, 6, '2013-01-13 00:00:00', '2012-10-23 17:22:19'),
(13, 2312427, 8, '2013-01-13 00:00:00', '2012-10-27 08:20:18'),
(12, 2312428, 7, '2013-01-13 00:00:00', '2012-10-24 07:07:08');

-- --------------------------------------------------------

--
-- Table structure for table `lag_papacj`
--

CREATE TABLE IF NOT EXISTS `lag_papacj` (
  `id_papacj` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) NOT NULL,
  `date_add` datetime NOT NULL,
  `date_upd` datetime NOT NULL,
  PRIMARY KEY (`id_papacj`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=5 ;

--
-- Dumping data for table `lag_papacj`
--

INSERT INTO `lag_papacj` (`id_papacj`, `id_user`, `date_add`, `date_upd`) VALUES
(2, 26, '2012-10-16 00:00:00', '2012-10-16 00:00:00'),
(3, 28, '2012-10-16 13:58:49', '2012-10-16 13:58:49'),
(4, 27, '2012-10-16 16:21:07', '2012-10-16 16:21:07');

-- --------------------------------------------------------

--
-- Table structure for table `lag_payment`
--

CREATE TABLE IF NOT EXISTS `lag_payment` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `pgTxnNo` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `TxRefNo` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` float NOT NULL,
  `TxMsg` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `TxStatus` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_order` int(64) NOT NULL,
  `starttime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `endtime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=33 ;

--
-- Dumping data for table `lag_payment`
--

INSERT INTO `lag_payment` (`id`, `pgTxnNo`, `TxRefNo`, `amount`, `TxMsg`, `TxStatus`, `id_order`, `starttime`, `endtime`) VALUES
(1, '', '', 0, '', 'IN PAYMENT', 2312313, '2012-10-13 12:49:00', '0000-00-00 00:00:00'),
(2, '', '', 0, '', 'IN PAYMENT', 2312313, '2012-10-13 13:10:30', '0000-00-00 00:00:00'),
(3, '', '', 0, '', 'IN PAYMENT', 2312315, '2012-10-13 13:57:23', '0000-00-00 00:00:00'),
(4, '', '', 0, '', 'IN PAYMENT', 2312320, '2012-10-15 09:30:04', '0000-00-00 00:00:00'),
(5, '', '', 0, '', 'IN PAYMENT', 2312336, '2012-10-16 12:36:43', '0000-00-00 00:00:00'),
(6, '', '', 0, '', 'IN PAYMENT', 2312336, '2012-10-16 12:36:51', '0000-00-00 00:00:00'),
(7, '', '', 0, '', 'IN PAYMENT', 2312336, '2012-10-16 12:36:56', '0000-00-00 00:00:00'),
(8, '', '', 0, '', 'IN PAYMENT', 2312336, '2012-10-16 12:37:30', '0000-00-00 00:00:00'),
(9, '', '', 0, '', 'IN PAYMENT', 2312338, '2012-10-16 12:59:08', '0000-00-00 00:00:00'),
(10, '', '', 0, '', 'IN PAYMENT', 2312338, '2012-10-16 12:59:18', '0000-00-00 00:00:00'),
(11, '', '', 0, '', 'IN PAYMENT', 2312340, '2012-10-16 13:56:18', '0000-00-00 00:00:00'),
(12, '', '', 0, '', 'IN PAYMENT', 2312340, '2012-10-16 13:56:22', '0000-00-00 00:00:00'),
(13, '', '', 0, '', 'IN PAYMENT', 2312338, '2012-10-16 13:56:49', '0000-00-00 00:00:00'),
(14, '', '', 0, '', 'IN PAYMENT', 2312338, '2012-10-16 13:56:52', '0000-00-00 00:00:00'),
(15, '', '', 0, '', 'IN PAYMENT', 2312358, '2012-10-17 13:37:27', '0000-00-00 00:00:00'),
(16, '', '', 0, '', 'IN PAYMENT', 2312358, '2012-10-17 13:37:34', '0000-00-00 00:00:00'),
(17, '', '', 0, '', 'IN PAYMENT', 2312361, '2012-10-17 14:20:54', '0000-00-00 00:00:00'),
(18, '', '', 0, '', 'IN PAYMENT', 2312361, '2012-10-17 14:20:59', '0000-00-00 00:00:00'),
(19, '', '', 0, '', 'IN PAYMENT', 2312362, '2012-10-17 14:26:34', '0000-00-00 00:00:00'),
(20, '', '', 0, '', 'IN PAYMENT', 2312370, '2012-10-18 10:58:01', '0000-00-00 00:00:00'),
(21, '', '', 0, '', 'IN PAYMENT', 2312372, '2012-10-18 13:38:24', '0000-00-00 00:00:00'),
(22, '', '', 0, '', 'IN PAYMENT', 2312379, '2012-10-20 07:33:00', '0000-00-00 00:00:00'),
(23, '', '', 0, '', 'IN PAYMENT', 2312392, '2012-10-21 06:58:42', '0000-00-00 00:00:00'),
(24, '', '', 0, '', 'IN PAYMENT', 2312393, '2012-10-21 07:12:35', '0000-00-00 00:00:00'),
(25, '', '', 0, '', 'IN PAYMENT', 2312393, '2012-10-21 07:12:39', '0000-00-00 00:00:00'),
(26, '', '', 0, '', 'IN PAYMENT', 2312439, '2012-10-27 13:00:15', '0000-00-00 00:00:00'),
(27, '', '', 0, '', 'IN PAYMENT', 2312441, '2012-10-29 09:34:59', '0000-00-00 00:00:00'),
(28, '', '', 0, '', 'IN PAYMENT', 2312441, '2012-10-29 09:35:03', '0000-00-00 00:00:00'),
(29, '', '', 0, '', 'IN PAYMENT', 2312466, '2012-10-31 15:14:52', '0000-00-00 00:00:00'),
(30, '', '', 0, '', 'IN PAYMENT', 2312466, '2012-10-31 15:14:56', '0000-00-00 00:00:00'),
(31, '', '', 0, '', 'IN PAYMENT', 2312466, '2012-10-31 15:15:00', '0000-00-00 00:00:00'),
(32, '', '', 0, '', 'IN PAYMENT', 2312466, '2012-10-31 15:15:02', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `lag_product_template`
--

CREATE TABLE IF NOT EXISTS `lag_product_template` (
  `id_template` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_tag` int(11) NOT NULL,
  `id_supplier` int(11) NOT NULL,
  `id_brand` int(11) NOT NULL,
  `id_category` int(11) NOT NULL DEFAULT '1',
  `logo_choice` int(11) NOT NULL,
  `is_return_gift` int(11) NOT NULL DEFAULT '0',
  `description` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `features` varchar(3000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `event` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_validity` int(128) NOT NULL DEFAULT '30',
  `redirection_url` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `sender_limit` int(11) NOT NULL,
  `receiver_limit` int(11) NOT NULL,
  `terms` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `tips` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_add` datetime NOT NULL,
  `date_upd` datetime NOT NULL,
  PRIMARY KEY (`id_template`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=20 ;

--
-- Dumping data for table `lag_product_template`
--

INSERT INTO `lag_product_template` (`id_template`, `name`, `id_tag`, `id_supplier`, `id_brand`, `id_category`, `logo_choice`, `is_return_gift`, `description`, `features`, `event`, `user_validity`, `redirection_url`, `sender_limit`, `receiver_limit`, `terms`, `tips`, `date_add`, `date_upd`) VALUES
(1, 'BSFC200NRM121011', 4, 1, 0, 1, 1, 0, 'beStylish.com - committed to deliver an excellent Shoe Shopping experience in India', 'The gift card voucher can be used as cash at beStylish.com ', 'Happy birthday', 30, 'http://www.bestylish.com/?utm_source=LeaveAGIFT', 3, 3, '', '', '2012-10-13 10:07:13', '2012-10-13 10:07:13'),
(2, 'BTPG998NRM121012diwali', 2, 3, 0, 1, 1, 0, 'This Diwali no fumes, no flames, & no worries. ', 'The gift card voucher can be used as cash to order a pair of Philips Led Candles worth Rs. 998.\r\n', 'Happy Diwali', 30, 'http://www.bulbtiger.com/Philips-LED-Candle-Tea-Light-BDS100-69144-pid-1666-cat-144.html/?utm_source=LeaveAGift', 3, 3, '', '', '2012-10-13 10:24:02', '2012-10-13 10:24:02'),
(3, 'HKPC1500NRM121011', 4, 4, 0, 1, 1, 0, 'Online Store for Premium health and beauty brands. ', 'The gift card voucher can be used as cash at healthkart.com \r\n', 'Happy birthday', 30, 'http://www.healthkart.com/?utm_source=LeaveAGift', 3, 3, '', '', '2012-10-13 10:40:35', '2012-10-13 10:40:35'),
(4, 'BSPC1500NRM121011', 5, 1, 0, 1, 1, 0, 'beStylish.com - India''s Largest Online Footwear Store.', 'The gift card voucher can be used as cash at beStylish.com \r\n', 'Happy birth day', 30, 'http://www.bestylish.com/?utm_source=LeaveAGIFT', 3, 3, '', '', '2012-10-13 10:56:23', '2012-10-13 10:58:16'),
(5, 'GKFC150NRM121011', 4, 2, 0, 1, 1, 0, 'India''s largest online eyewear store.\r\n', 'The gift card voucher can be used as cash at gkboptical.com \r\n', 'Happy birthday', 30, 'http://www.gkboptical.com/?utm_source=LeaveAGift', 3, 3, '', '', '2012-10-13 11:08:38', '2012-10-13 11:08:38'),
(6, 'GKPC2000NRM121011', 5, 2, 0, 1, 1, 0, 'India''s largest online eyewear store.\r\n', 'The gift card voucher can be used as cash at healthkart.com \r\n', 'Happy birthday', 30, 'http://www.gkboptical.com/?utm_source=LeaveAGift', 3, 3, '', '', '2012-10-13 11:18:25', '2012-10-13 11:18:25'),
(7, 'HKPC1000NRM121011 ', 5, 4, 0, 1, 1, 0, 'Online Store for Premium sports and beauty products.', 'The gift card voucher can be used as cash at healthkart.com \r\n', 'Happy birthday', 30, 'http://www.healthkart.com/?utm_source=LeaveAGift', 3, 3, '', '', '2012-10-13 11:37:14', '2012-10-13 11:37:51'),
(8, 'GKPC1000NRM121011', 5, 2, 0, 1, 1, 0, 'India''s largest online eyewear store.\r\n', 'The gift card voucher can be used as cash at gkboptical.com \r\n', 'Happy birthday', 30, 'http://www.gkboptical.com/?utm_source=LeaveAGift', 3, 3, '', '', '2012-10-13 12:05:45', '2012-10-13 12:05:45'),
(9, 'PCJPC400CRT121011', 3, 5, 0, 2, 1, 0, 'Gift Rs. 400 to Papa Cj''s Child One Charity.', 'For every gift you send Papa CJ and LeaveAGift together will donate Rs 400 to Child One.', 'Gift to Papa Cj''s Child One Charity', 30, 'http://www.papacj.com/charity.htm', 100, 100, '', '', '2012-10-13 12:49:49', '2012-10-13 12:49:49'),
(10, 'FKMT500SLD121012', 6, 8, 0, 1, 1, 0, 'Two movie tickets at any PVR.', 'The gift card can be redeemed only at PVR website.', 'Happy birthday', 30, 'http://www.pvrcinemas.com/', 3, 3, '', '', '2012-10-13 13:06:02', '2012-10-13 13:06:02'),
(11, 'SJPC700CRT121011 ', 3, 9, 0, 2, 1, 0, 'Donate Rs. 700 to Satyamev Jayate.', 'For every gift you send, LeaveAGift will donate Rs. 700 to Satyamev Jayate.', 'Happy birthday', 30, 'http://www.satyamevjayate.in/', 300, 300, '', '', '2012-10-13 13:22:58', '2012-10-13 13:22:58'),
(12, 'PVRPC500SLD121011', 6, 10, 0, 1, 1, 0, 'Gift two tickets for any movie at PVR cinemas.', 'Gift Card can be redeemed online only.', 'Gift Movie Tickets', 30, 'http://www.pvrcinemas.com/', 3, 3, '', '', '2012-10-13 13:35:35', '2012-10-13 13:39:40'),
(13, 'KHPC1000NRM121012', 5, 6, 0, 1, 1, 0, 'Private You, Fun You. Gift some intimacy ;) ', 'The gift card voucher can be used as cash at kamahoo.com \r\n', 'Happy birthday', 30, 'http://www.kamahoo.com/?utm_source=LeaveAGift', 3, 3, '', '', '2012-10-13 14:10:06', '2012-10-13 14:10:06'),
(14, 'PMGC1999NRM121012', 2, 7, 0, 1, 1, 0, 'Racy, naughty, hilarious, fun and cool  party game made in India for India.', 'The gift card can be used as cash to order Pure Mischief at Kamahoo.com', 'Happy birthday', 30, 'http://www.kamahoo.com/Products/Pure-Mischief-Game-Pure-Mischief/Kamahoo/KAMAHOO-Pure-Mischief-Naughty-Fun-Party-Game/pid-954007.aspx', 3, 3, '', '', '2012-10-13 14:22:57', '2012-10-13 14:22:57'),
(15, 'LGBSPC900CHA121015', 3, 11, 0, 2, 1, 0, 'Donate to beStylish''s Elles Breast Cancer Campaign', 'The amount donated will be used to promoted better breast health by ELLE Breast Cancer Campaign.', 'Donate to Charity', 30, 'http://www.bestylish.com/?utm_source=LeaveAGIFT', 3, 3, '', '', '2012-10-15 04:51:24', '2012-10-15 04:51:24'),
(16, 'LGBS900CHA121015', 3, 11, 0, 2, 1, 0, 'Donate to beStylish''s Elles Breast Cancer Campaign', 'The amount donated will be used to promoted better breast health by ELLE Breast Cancer Campaign.', 'Donate to Charity', 30, 'http://www.bestylish.com/?utm_source=LeaveAGIFT', 3, 3, '', '', '2012-10-15 04:51:56', '2012-10-15 04:51:56'),
(17, 'LGBS900CHA121015', 3, 11, 0, 1, 1, 0, 'Donate Rs. 900 to beStylish ELLE Breast Cancer Campaign.', 'The amount donated goes to ELLE Breast Cancer Campaign for better breast health in India.', 'Donate to Charity', 30, 'http://www.bestylish.com/?utm_source=LeaveAGIFT', 3, 3, '', '', '2012-10-15 05:01:08', '2012-10-15 05:01:08'),
(18, 'LGBS900CHA121015', 3, 11, 0, 2, 1, 0, 'Donate to beStylish Elle''s Breast Cancer Campaign.', 'The amount donated will be used for better breast health in India by The Ogaan Cancer Foundation.', 'Donate to Charity', 30, 'https://www.facebook.com/ELLEIndiaBreastCancerCampaign', 3, 3, '', '', '2012-10-15 06:12:44', '2012-10-15 06:12:44'),
(19, 'LGBLPG1199NRM121015', 2, 11, 0, 1, 1, 0, 'Davidoff Cool Water - Get carried away on a wave of want with Davidoff Cool Water.', 'You can send Davidoff Cool Water directly from LeaveAGift to your friends.', 'Happy birthday', 30, 'http://www.bodynlife.com/Products/Beauty-Fragrances-FOR-MEN/DAVIDOFF/davidoff-cool-water-natural-spray-for-men/pid-831368.aspx', 3, 3, '', '', '2012-10-15 17:24:44', '2012-10-15 17:24:44');

-- --------------------------------------------------------

--
-- Table structure for table `lag_supplier_images`
--

CREATE TABLE IF NOT EXISTS `lag_supplier_images` (
  `id_image` int(11) NOT NULL AUTO_INCREMENT,
  `id_supplier` int(11) NOT NULL,
  `filename` varchar(300) COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` int(11) NOT NULL,
  PRIMARY KEY (`id_image`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=60 ;

--
-- Dumping data for table `lag_supplier_images`
--

INSERT INTO `lag_supplier_images` (`id_image`, `id_supplier`, `filename`, `position`) VALUES
(2, 1, 'bestylish large logo.png122559.png', 1),
(3, 2, 'gkb-small-logo.png219030.png', 0),
(4, 2, 'gkb large logo.png222559.png', 1),
(5, 3, 'bulbtiger-small-logp.png319030.png', 0),
(6, 3, 'bulbtiger large logo.png322559.png', 1),
(7, 4, 'healthkart_small_logo.png419030.png', 0),
(8, 4, 'healthkart large logo.png422559.png', 1),
(9, 5, 'one-child-small-logo.png519030.png', 0),
(10, 5, 'one child large logo.png522559.png', 1),
(11, 6, 'kamahoo-small-logo.png619030.png', 0),
(12, 6, 'kamahoo large logo.png6300136.png', 1),
(13, 7, 'puremichief-small-logo.png719030.png', 0),
(14, 7, 'purmischief-logo.png722559.png', 1),
(15, 8, 'flipkart-small-logo.png819030.png', 0),
(16, 8, 'flipkart large logo.png822559.png', 1),
(17, 9, 'satyamev_jayte_small-logo.png919030.png', 0),
(18, 9, 'satyameve_jayate large logo.png922559.png', 1),
(19, 10, 'pvr_small_logo.png1019030.png', 0),
(20, 10, 'pvr_logo_large.png1022559.png', 1),
(21, 11, 'leaveagift-small-logo.png1119030.png', 0),
(22, 11, 'leaveagift_logo-large.png1121045.png', 1),
(23, 1, 'bestylish_small_logo.png119030.png110015.789473684211.png', 2),
(24, 2, 'gkb-small-logo.png219030.png210015.789473684211.png', 2),
(25, 4, 'healthkart_small_logo.png419030.png410015.789473684211.png', 2),
(26, 7, 'puremichief-small-logo.png719030.png710015.789473684211.png', 2),
(27, 12, 'brand-02.gif129324.gif', 0),
(28, 13, 'brand-02.gif139324.gif', 0),
(29, 14, 'brand-02.gif149324.gif', 0),
(30, 15, 'brand-02.gif159324.gif', 0),
(31, 16, 'brand-02.gif169324.gif', 0),
(32, 17, 'brand-02.gif179324.gif', 0),
(33, 18, 'brand-02.gif189324.gif', 0),
(34, 19, 'brand-02.gif199324.gif', 0),
(35, 20, 'brand-02.gif209324.gif', 0),
(36, 21, 'brand-02.gif219324.gif', 0),
(37, 22, 'brand-02.gif229324.gif', 0),
(38, 23, 'brand-02.gif239324.gif', 0),
(39, 24, 'brand-02.gif249324.gif', 0),
(40, 25, 'brand-02.gif259324.gif', 0),
(41, 26, 'brand-04.gif267624.gif', 0),
(42, 27, 'brand-04.gif277624.gif', 0),
(43, 28, 'brand-04.gif287624.gif', 0),
(44, 29, 'brand-04.gif297624.gif', 0),
(45, 30, 'brand-04.gif307624.gif', 0),
(46, 31, 'brand-04.gif317624.gif', 0),
(47, 32, 'brand-04.gif327624.gif', 0),
(48, 32, 'brand-04.gif3210031.578947368421.gif', 2),
(49, 32, 'brand-barc-big.jpg3222559.jpg', 1),
(50, 33, 'brand-04.gif337624.gif', 0),
(51, 33, 'brand-04.gif3310031.578947368421.gif', 2),
(52, 33, 'brand-barc-big.jpg3322559.jpg', 1),
(53, 34, 'brand-04.gif347624.gif', 0),
(54, 34, 'brand-04.gif3410031.578947368421.gif', 2),
(55, 34, 'brand-barc-big.jpg3422559.jpg', 1),
(56, 5, 'one-child-small-logo.png519030.png510015.789473684211.png', 2),
(57, 11, 'leaveagift-small-logo.png1119030.png1110015.789473684211.png', 2),
(58, 1, 'flowers_021.jpg36f4d832825380f102846560a5104c90150150.jpg1150150.jpg', 0),
(59, 1, 'flowers_021.jpg36f4d832825380f102846560a5104c90150150.jpg13434.jpg', 2);

-- --------------------------------------------------------

--
-- Table structure for table `lag_template_image`
--

CREATE TABLE IF NOT EXISTS `lag_template_image` (
  `id_image` int(11) NOT NULL AUTO_INCREMENT,
  `id_template` int(11) NOT NULL,
  `filename` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` int(11) NOT NULL,
  PRIMARY KEY (`id_image`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=39 ;

--
-- Dumping data for table `lag_template_image`
--

INSERT INTO `lag_template_image` (`id_image`, `id_template`, `filename`, `position`) VALUES
(1, 1, 'bestylish_b_small.jpg1199138.jpg', 0),
(2, 1, 'bestylish_b.jpg1280199.jpg', 1),
(3, 2, 'bulbtigersmall.jpg2199138.jpg', 0),
(4, 2, 'bulbtiger.jpg2280199.jpg', 1),
(5, 3, 'healthkart_small.jpg3199138.jpg', 0),
(6, 3, 'healthkart.jpg3280199.jpg', 1),
(7, 4, 'bestylish_b_small.jpg4199138.jpg', 0),
(8, 4, 'bestylish_b.jpg4280199.jpg', 1),
(9, 5, 'gkbsmall150.png5199138.png', 0),
(10, 5, 'gkblarge150.jpg5280199.jpg', 1),
(11, 6, 'gkbsmall2000.png6199138.png', 0),
(12, 6, 'gkblarge2000.jpg6280199.jpg', 1),
(13, 7, 'healthkart_b-small.jpg7199138.jpg', 0),
(14, 7, 'healthkart_b.jpg7280199.jpg', 1),
(15, 8, 'gkb_small_a.png8199138.png', 0),
(16, 8, 'gkb.png8280199.png', 1),
(17, 9, 'papacj_small.png9199138.png', 0),
(18, 9, 'papacj.jpg9280199.jpg', 1),
(19, 10, 'pvr small.png10199138.png', 0),
(20, 10, 'pvr big.jpg10280199.jpg', 1),
(21, 11, 'satyamev_jayte_small_a.png11199138.png', 0),
(22, 11, 'satyamev_jayte_a.png11280199.png', 1),
(23, 12, 'pvr small.png12199138.png', 0),
(24, 12, 'pvr big.jpg12280199.jpg', 1),
(25, 13, 'kamahoo_small.jpg13199138.jpg', 0),
(26, 13, 'kamahoo.jpg13280199.jpg', 1),
(27, 14, 'kamahoo_small_a.jpg14199138.jpg', 0),
(28, 14, 'kamahoo_a.jpg14280199.jpg', 1),
(29, 15, 'juvalia_small.jpg15199138.jpg', 0),
(30, 15, 'juvalia.jpg15280199.jpg', 1),
(31, 16, 'juvalia_small.jpg16199138.jpg', 0),
(32, 16, 'juvalia.jpg16280199.jpg', 1),
(33, 17, 'juvalia_small1.jpg17199138.jpg', 0),
(34, 17, 'juvalia3.jpg17280199.jpg', 1),
(35, 18, 'best chrits.jpg18199138.jpg', 0),
(36, 18, 'best chrit.jpg18280199.jpg', 1),
(37, 19, 'LEAveagift small.jpg19199138.jpg', 0),
(38, 19, 'LeaveAGIGT BIG.jpg19280199.jpg', 1);

-- --------------------------------------------------------

--
-- Table structure for table `lag_user`
--

CREATE TABLE IF NOT EXISTS `lag_user` (
  `id_user` int(64) unsigned NOT NULL AUTO_INCREMENT,
  `id_customer` int(64) NOT NULL,
  `facebook_userid` varchar(32) DEFAULT NULL,
  `facebook_oauthid` varchar(512) NOT NULL,
  `facebook_email` varchar(128) NOT NULL,
  `name` varchar(128) NOT NULL,
  `date_add` datetime NOT NULL,
  `date_upd` datetime NOT NULL,
  `last_login` datetime NOT NULL,
  `is_admin` int(11) NOT NULL DEFAULT '0',
  `is_blocked` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_user`),
  UNIQUE KEY `facebook_email` (`facebook_email`),
  KEY `facebook_oauthid` (`facebook_oauthid`(255))
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=54 ;

--
-- Dumping data for table `lag_user`
--

INSERT INTO `lag_user` (`id_user`, `id_customer`, `facebook_userid`, `facebook_oauthid`, `facebook_email`, `name`, `date_add`, `date_upd`, `last_login`, `is_admin`, `is_blocked`) VALUES
(25, 21, '690782095', 'AAAGxFKYxAIEBALOWneMM28Rc8M9zfiZBjSVFQZCwXoKZAYCt55tKT6JKC3QGEoxL8jCar5syG39siusBY8qZCvORYVWJZBFdgrFIQ3EnMwwZDZD', 'ashima.gupta@gmail.com', 'Ashima Gupta', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
(26, 22, '100000105382499', 'AAAFZCJyKdfz8BAOlVo3vakCFI75YP1E9LlJXzVFq6Jfubda6CuSRWfT2UoRzTbsebxmHyZBkKFWV33huhSJFDTeMZBxY4kZAE5pkZBnJ4cgZDZD', 'sirin_ibin@yahoo.co.in', 'Sirin Ibin', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2012-11-01 17:47:21', 1, 0),
(27, 23, '651991381', 'AAAGxFKYxAIEBAH9tvxrfEIlkEO1BW9ZBQbY2opG0KVoZCVucRh9gAoM99GjPZA0TUawNTqdytE0aCOAAC7VgcpuiFKEGJ1N298pUX61egZDZD', 'rsomeshwar@gmail.com', 'Ravi Someshwar', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(28, 24, '626837', 'AAAGxFKYxAIEBAFu13TAyx94oAGgOgJcty7dZASFXkCKW8A9igAea66H3Llo2UyASX1cwDsvXOfGsH0qkBsZAybTZA8Jy18ZD', 'jaideep.singh.wg02@wharton.upenn.edu', 'Jaideep Singh', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(30, 26, '100002229502264', 'AAAGxFKYxAIEBAEajvlz61YwdS0yZBaJRJcZAFxRO5zbmvX6eP9O5giRYMJn1dZCPGyEbJ4aO7eYkejFISXWfok3zssuQiAtd9xNXDPPaawB5zHcJ2dZC', 'cityville.player57@gmail.com', 'Rose Cartercity', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
(31, 27, '1220500771', 'AAAGxFKYxAIEBANafWfnkPjsZAI9uSowhW4Mh6wlvevzLZA4ptlhes5W912uLQjs4T7plplCEaQLSmAzelreyZBiDDfNXCXF5BOa9zM5FgZDZD', 'instinct.iitk@gmail.com', 'Gaurav K Sharma', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(32, 28, '100002437700849', 'AAAFZCJyKdfz8BADlzkCPmO0cFg9MGuHBpafZAQZCh9K42p0Xa1xwV67KmtusZBZANmEkFoWAoGhmqUB8Ho3I8m48CMWWZAl9GyIcKdZCr5gGQZDZD', 'sirink89@gmail.com', 'Sirin Ibin', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
(33, 29, '100003667228176', 'AAAGxFKYxAIEBAGzJYhVZBFAJFGyZCFzZBoFg8SQRUt0v0Xqsu6B9bUZCUHX0f67zzu7vXUK6QY1HHKhCp9Nf7qsadSpBJZCZAMtFHFfXKviAZDZD', 'ravi@straksinc.com', 'Ravi Someshwar', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
(34, 30, '1756545693', 'AAAGxFKYxAIEBAKTVZA34T38gu02ZAbvdz4ZArBdkWlpre03uqv0ZA2SPNLIkOyBE6OZBbuX4oIcKepb30cfjWLDyGlw0jK9UEWyuxTEVXVgZDZD', 'amit@metadesignsolutions.com', 'Amit Gupta', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
(35, 31, '100004329824179', 'AAAFZCJyKdfz8BAORe9ZAf1JUcq339U8joguvIucrP4SaEaf2JY4Kf9ZBZBvpiRfnsisseGw0jEKpoGAKpbfryHFDZBYpsEZAsmTZAr0rF2mvwZDZD', 'jaideep@leaveagift.com', 'Jaideep Singh', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
(36, 32, '100002694354270', 'AAAGxFKYxAIEBAH1dUiVsovBBLJEELoncqnsHCgdK9h9vLIDU6xWfRoA3QcZC7VzeViKCPDL6wHr2KGvhirZArtck9RcreoQ48tdaZAzOAZDZD', 'sirink2@gmail.com', 'Sirin Ibnu Abdul Latheef', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
(37, 33, '1484323208', 'AAAGxFKYxAIEBAKmfb5ZCpEX9n1s511rZCSQoqvVa7LU9ygyLQ9NSKEzX7ozQ0Rznj7EWR7Pn2vdSbTAE8nks6qCzZALNZCfEtxwAKHWb6gZDZD', 'bishttech23@gmail.com', 'UX King', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
(38, 34, '517951591', 'AAAGxFKYxAIEBAFtW1aunUQ5fpmawjW70TxWXji1Ga9J2NmwCVQJ19f2XxIsrK8iTJRav0fUOBR0HcFW5ZALoxSasITnJwPQIeoz7n3QZDZD', 'rakshitmonga@yahoo.com', 'Rakshit Monga', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(39, 35, '100004124527628', 'AAAGxFKYxAIEBAHC7yn94312f4aruiqpvs9SRur26yJ9DFQVtBcF9sECErzIgYlt6I9oQbZCBFwXn6UauU5zvZCOh03mGVTKBynjVf4YAZDZD', 'peeyush@metadesignsolutions.com', 'Peeyush Tuli', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
(40, 36, '548110856', 'AAAGxFKYxAIEBAAJyhzjMQ9SSkiXIAtPp0PimMgRZBQ7dtZCkpunDVih5ZCzqjMSmpZCQDjOvUGix0ZCBSYA9YMnntfCikPk9ONvYhOu4peAZDZD', 'peeyush2000@gmail.com', 'Peeyush Jain', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
(41, 37, '607600003', 'AAAGxFKYxAIEBANsBN2CiWZALVdPMnFGazbg9EKYZAZAVNsnHfw1rhD0LNKgtNbP92HnCOSJWqrktZADZBYYYQgDo5MJ9QZAbj0nt9ZBERnPIwZDZD', 'jay@bhatti.com', 'Jatinder Bhatti', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
(42, 38, '635353781', 'AAAGxFKYxAIEBAEFfM6F1LEUn6HvLlC6gmUCmmorZAgxDwF9ZBv2oifbtISPfckUf4AcDyWJLn5HmnectjGqMZC4PM0SDivuZAtaZBvUthzAZDZD', 'girishkherauk@yahoo.co.uk', 'Girish Khera', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
(43, 39, '578692260', 'AAAGxFKYxAIEBAC0kQ4q7VGMtBHkZClwr45Y01064OqFnhMzDAOdDVOEkTolKoJ06gQIZCPFEon9ydoOsFZB9kP1LM9hfU4AlABwlVd6jAZDZD', 'ldatwani@gmail.com', 'Leena Datwani', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
(48, 1, '100000705883513', 'AAAGxFKYxAIEBAIhWxSgh1FlKSC6P4svcFwSTp3Q655wNpZC36z9czN1G9JmifyyM6ZAXOizHEt2pMZCOaIjF0udHmZAjGZBLftJpyc4XpmgZDZD', 'love.manish1@gmail.com', 'Manish Singh', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
(49, 2, '100004488310146', 'AAAGxFKYxAIEBAPg98QIEaD5Ap4ZAxCkqVXyZBgoN4zNu8PTuhO0ZAKKl8HPZCmc0fZAA2ppV6zKrsZAkeZBeMYmm1fITofZBqUuk1ZAZCsWNVieQZDZD', 'gaurav@leaveagift.com', 'Gaurav Sharma', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
(50, 3, '100000445301878', 'AAAGxFKYxAIEBANVXrAYJGcwjUq9EAcwT1IHitZCw0IKzMmFCncVZAnIBAdRyOJtf81cdL6Ne18ZCcHRWaPM8xs0PIzyVhPAFvd9gmTLWAZDZD', 'ravijoon52@gmail.com', 'Ravi Joon', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
(51, 4, '657120979', 'AAAGxFKYxAIEBAG1HY2RjP00sEgX1LmQZB662dXjw1GdNKIUom06siZBUqS2KzGF6NHlddz3ROTZBOqf3iWTMhpxB6P0iVxZCaLbaXCzKfwZDZD', 'prakhar.seriouslyfunny@gmail.com', 'Prakhar Misra', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
(52, 5, '1324929959', 'AAAGxFKYxAIEBANHbipSBaeN0zJZCNtbcozaVIeEUX3lBeY6GAfxB0KdzbZANOmnZCw7ocfcUJseqwbO52GsOtZCFtnXFxYJZACJF4HiEYrQZDZD', 'didwania.gourav@gmail.com', 'Gourav Didwania', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
(53, 6, '586145188', 'AAAGxFKYxAIEBAM5xvpmsaE3ovfiMtu5qZB3RK1EABI6nUgIeWjaD9ZBbJaHibyspVxf2ljFjEJf1qwdNs3ntPQWjtlIJj5UIpKTSYf0AZDZD', 'seemaxshah@gmail.com', 'Seema Shah', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `lag_user_order`
--

CREATE TABLE IF NOT EXISTS `lag_user_order` (
  `id_user_gift` int(64) unsigned NOT NULL AUTO_INCREMENT,
  `id_cart` int(64) unsigned NOT NULL,
  `id_product` int(64) unsigned NOT NULL,
  `id_user` int(64) unsigned NOT NULL,
  `receiver_fbid` varchar(128) DEFAULT NULL,
  `receiver_fbfirstname` varchar(64) DEFAULT NULL,
  `receiver_fbemail` varchar(128) DEFAULT NULL,
  `notify_email` varchar(128) DEFAULT NULL,
  `img_url` varchar(128) DEFAULT NULL,
  `message_card` text,
  `message_post` text,
  `title` varchar(128) NOT NULL,
  `delivery_date` datetime DEFAULT NULL,
  `order_status` varchar(128) NOT NULL DEFAULT 'PENDING' COMMENT 'PENDING/SUCCESS/CANCELED/FAILED',
  `end_time` datetime NOT NULL,
  `greeting` varchar(32) NOT NULL,
  `gift_opened` varchar(8) NOT NULL,
  `gift_rating` varchar(8) NOT NULL,
  `facebook_postid` varchar(64) DEFAULT NULL,
  `post_email_status` bit(3) DEFAULT b'0',
  `thankyouid` int(64) DEFAULT NULL COMMENT 'its value will be equal to sender''s gift id in case of  thank you gift.',
  `date_add` datetime DEFAULT NULL,
  `date_upd` datetime NOT NULL,
  PRIMARY KEY (`id_user_gift`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2312471 ;

--
-- Dumping data for table `lag_user_order`
--

INSERT INTO `lag_user_order` (`id_user_gift`, `id_cart`, `id_product`, `id_user`, `receiver_fbid`, `receiver_fbfirstname`, `receiver_fbemail`, `notify_email`, `img_url`, `message_card`, `message_post`, `title`, `delivery_date`, `order_status`, `end_time`, `greeting`, `gift_opened`, `gift_rating`, `facebook_postid`, `post_email_status`, `thankyouid`, `date_add`, `date_upd`) VALUES
(2312348, 0, 8, 26, '100003233927984', 'Salman', NULL, NULL, NULL, 'Gift To Charity is dedicated to raising additional funds for various causes in India. ', NULL, 'Gift To Charity', NULL, 'PENDING', '0000-00-00 00:00:00', 'Salman', '', '', NULL, b'000', NULL, '2012-10-17 11:04:40', '2012-10-17 11:10:09'),
(2312349, 0, 8, 26, '100003233927984', 'Salman', NULL, NULL, 'flowers_021.jpg767b2cc82cecc0385fe6f1086dd2c748300300.jpg', 'Gift To Charity is dedicated to raising additional funds for various causes in India. ', NULL, 'Gift To Charity', NULL, 'PENDING', '0000-00-00 00:00:00', 'Salman', '', '', NULL, b'000', NULL, '2012-10-17 11:12:33', '2012-10-17 11:12:33'),
(2312350, 0, 8, 26, '100003233927984', 'Salman', NULL, NULL, 'red_roses_flowers-1920x1200.jpgfa8dbbcb682699544e4e8f2212115f7319201200.jpg', 'Gift To Charity is dedicated to raising additional funds for various causes in India. ', NULL, 'Gift To Charity', NULL, 'PENDING', '0000-00-00 00:00:00', 'Salman', '', '', NULL, b'000', NULL, '2012-10-17 11:29:55', '2012-10-17 11:29:55'),
(2312351, 0, 8, 26, '100003233927984', 'Salman', NULL, NULL, 'red_roses_flowers-1920x1200.jpgbdcc41211aa62a8f10f26d1a2d1727bf19201200.jpg', '<p>(Updated)</p><p>Dear Salman,</p><p><br> (Updated)Gift To Charity is dedicated to raising additional funds for various causes in India. <br> Love,<br> Sirin</p>', NULL, '(Updated)Gift To Charity', NULL, 'PENDING', '0000-00-00 00:00:00', '(Updated)Salman', '', '', NULL, b'000', NULL, '2012-10-17 11:31:14', '2012-10-17 12:29:07'),
(2312352, 0, 8, 26, '651989551', 'Nitya', NULL, NULL, 'red_roses_flowers-1920x1200.jpgbdcc41211aa62a8f10f26d1a2d1727bf19201200.jpg', '<p>hello Nithya<br></p><p>Gift To Charity is dedicated to raising additional funds for various causes in India</p><p><br></p><p><br></p>', NULL, 'Gift To Charity', NULL, 'PENDING', '0000-00-00 00:00:00', 'Nitya', '', '', NULL, b'000', NULL, '2012-10-17 14:21:29', '2012-10-17 15:01:24'),
(2312353, 0, 8, 26, '100002195855879', 'AnilBaby', NULL, NULL, NULL, '<p> Dear AnilBaby,</p><p>hello<br> Gift To Charity is dedicated to raising additional funds for various causes in India. <br> Love,<br> Sirin</p>', NULL, 'Gift To Charity', NULL, 'PENDING', '0000-00-00 00:00:00', 'AnilBaby', '', '', NULL, b'000', NULL, '2012-10-17 14:33:50', '2012-10-17 14:33:50'),
(2312354, 0, 8, 26, '100001623009199', 'Sunil', NULL, NULL, NULL, '<p> Dear Sunil,<br> <strong>Gift To Charity i</strong>s dedicated to raising additional funds for various causes in India. <br> Love,<br> Sirin</p>', NULL, 'Gift To Charity', NULL, 'PENDING', '0000-00-00 00:00:00', 'Sunil', '', '', NULL, b'000', NULL, '2012-10-17 14:35:43', '2012-10-17 14:35:43'),
(2312355, 0, 8, 26, '100002195855879', 'AnilBaby', NULL, NULL, NULL, '<p>hey,daaaaaa machu</p><p>AnilBaby,<br> Gift To Charity is dedicated to raising additional funds for various causes in India. <br> Love,<br> Sirin</p>', NULL, 'Gift To Charity', NULL, 'PENDING', '0000-00-00 00:00:00', 'AnilBaby', '', '', NULL, b'000', NULL, '2012-10-17 17:20:34', '2012-10-17 17:20:34'),
(2312356, 0, 8, 26, '100000941474503', 'Anitha', NULL, NULL, NULL, 'Gift To Charity is dedicated to raising additional funds for various causes in India. ', NULL, 'Gift To Charity', NULL, 'PENDING', '0000-00-00 00:00:00', 'Anitha', '', '', NULL, b'000', NULL, '2012-10-17 18:16:53', '2012-10-17 18:16:53'),
(2312357, 0, 8, 26, '100000941474503', 'Anitha', NULL, NULL, NULL, 'Gift To Charity is dedicated to raising additional funds for various causes in India. ', NULL, 'Gift To Charity', NULL, 'PENDING', '0000-00-00 00:00:00', 'Anitha', '', '', NULL, b'000', NULL, '2012-10-17 19:06:30', '2012-10-17 19:06:30'),
(2312358, 0, 8, 26, '100002195855879', 'AnilBaby', '', 'sirin_ibin@yahoo.co.in', NULL, 'Gift To Charity is dedicated to raising additional funds for various causes in India. ', 'Hey AnilBaby, Surprise! I’ve left a gift for you.  I picked it out myself.  Hope you can use it.', 'Gift To Charity', '2012-10-17 00:00:00', 'PENDING', '0000-00-00 00:00:00', 'AnilBaby', '', '', NULL, b'000', NULL, '2012-10-17 19:07:11', '2012-10-17 19:07:11'),
(2312359, 0, 8, 26, '100002195855879', 'AnilBaby', NULL, NULL, NULL, 'Gift To Charity is dedicated to raising additional funds for various causes in India. ', NULL, 'Gift To Charity', NULL, 'PENDING', '0000-00-00 00:00:00', 'AnilBaby', '', '', NULL, b'000', NULL, '2012-10-17 19:09:13', '2012-10-17 19:09:13'),
(2312360, 0, 8, 26, '100002195855879', 'AnilBaby', NULL, NULL, NULL, 'Gift To Charity is dedicated to raising additional funds for various causes in India. ', NULL, 'Gift To Charity', NULL, 'PENDING', '0000-00-00 00:00:00', 'AnilBaby', '', '', NULL, b'000', NULL, '2012-10-17 19:24:03', '2012-10-17 19:24:03'),
(2312361, 0, 8, 26, '100002195855879', 'AnilBaby', '', 'sirin_ibin@yahoo.co.in', NULL, 'Gift To Charity is dedicated to raising additional funds for various causes in India. ', 'Hey AnilBaby, Surprise! I’ve left a gift for you.  I picked it out myself.  Hope you can use it.', 'Gift To Charity', '2012-10-31 00:00:00', 'PENDING', '0000-00-00 00:00:00', 'AnilBaby', '', '', NULL, b'000', NULL, '2012-10-17 19:44:47', '2012-10-17 19:44:47'),
(2312362, 0, 8, 26, '100002195855879', 'AnilBaby', '', 'sirin_ibin@yahoo.co.in', NULL, 'Gift To Charity is dedicated to raising additional funds for various causes in India. ', 'Hey AnilBaby, Surprise! I’ve left a gift for you.  I picked it out myself.  Hope you can use it.', 'Gift To Charity', '2012-10-22 00:00:00', 'PENDING', '0000-00-00 00:00:00', 'AnilBaby', '', '', NULL, b'000', NULL, '2012-10-17 19:53:04', '2012-10-17 19:57:21'),
(2312363, 0, 1, 26, '100002437700849', 'Sirin', 'sirinibin2006@gmail.com', 'sirinibin2006@gmail.com', 'flowers_021.jpg02180771a9b609a26dcea07f272e141f150150.jpg', 'As you celebrate your day, I celebrate the beautiful friendship we share! Happy Birthday, dearest friend!', 'Hey Sirin, Surprise! I''ve left a gift for you.  I picked it out myself.  Hope you can use it.', 'Happy Birthday', '2012-10-17 00:00:00', 'SUCCESS', '0000-00-00 00:00:00', 'Sirin', '', '', '100002437700849_482052555161677', b'111', NULL, '2012-10-17 21:40:02', '2012-10-17 21:40:02'),
(2312364, 0, 1, 26, '1220500771', 'Gaurav K Sharma', 'instinct.iitk@gmail.com', 'sirin_ibin@yahoo.co.in', NULL, 'Gaurav K Sharma, thank you so much for your Online Gift - E-Cash.  It was a great surprise.  Can’t wait to use it !', 'Gaurav K Sharma, thank you so much for your Online Gift - E-Cash.  It was a great surprise.  Can’t wait to use it !', 'Thank you Gaurav K Sharma.', '2012-10-17 00:00:00', 'PENDING', '0000-00-00 00:00:00', 'Gaurav K Sharma', '', '', '1220500771_369243059823556', b'111', 2312312, '2012-10-17 00:00:00', '2012-10-17 00:00:00'),
(2312365, 0, 12, 26, '1620891846', 'Mahshooque', NULL, NULL, NULL, 'As you celebrate your day, I celebrate the beautiful friendship we share! Happy Birthday, dearest friend!', NULL, 'Happy Birthday', NULL, 'PENDING', '0000-00-00 00:00:00', 'Mahshooque', '', '', NULL, b'000', NULL, '2012-10-18 11:25:08', '2012-10-18 11:25:08'),
(2312366, 0, 12, 26, '1620891846', 'Mahshooque', NULL, NULL, NULL, 'As you celebrate your day, I celebrate the beautiful friendship we share! Happy Birthday, dearest friend!', NULL, 'Happy Birthday', NULL, 'PENDING', '0000-00-00 00:00:00', 'Mahshooque', '', '', NULL, b'000', NULL, '2012-10-18 11:57:58', '2012-10-18 11:57:58'),
(2312367, 0, 1, 26, '100004488310146', 'Gaurav Sharma', 'gaurav@leaveagift.com', 'sirin_ibin@yahoo.co.in', NULL, 'Gaurav Sharma, thank you so much for your Online Gift - E-Cash.  It was a great surprise.  Can''t wait to use it !', 'Gaurav Sharma, thank you so much for your Online Gift - E-Cash.  It was a great surprise.  Can''t wait to use it !', 'Thank you Gaurav Sharma.', '2012-10-18 00:00:00', 'PENDING', '0000-00-00 00:00:00', 'Gaurav Sharma', '', '', '100004488310146_279560592163024', b'111', 2312318, '2012-10-18 00:00:00', '2012-10-18 00:00:00'),
(2312368, 0, 8, 26, '1620891846', 'Mahshooque', NULL, NULL, NULL, 'Gift To Charity is dedicated to raising additional funds for various causes in India. ', NULL, 'Gift To Charity', NULL, 'PENDING', '0000-00-00 00:00:00', 'Mahshooque', '', '', NULL, b'000', NULL, '2012-10-18 14:20:24', '2012-10-18 14:20:24'),
(2312369, 0, 6, 26, '1620891846', 'Mahshooque', NULL, NULL, NULL, 'As you celebrate your day, I celebrate the beautiful friendship we share! Happy Birthday, dearest friend!', NULL, 'Happy Birthday', NULL, 'PENDING', '0000-00-00 00:00:00', 'Mahshooque', '', '', NULL, b'000', NULL, '2012-10-18 14:22:03', '2012-10-18 14:22:03'),
(2312370, 0, 12, 26, '100002195855879', 'AnilBaby', '', 'sirin_ibin@yahoo.co.in', NULL, 'As you celebrate your day, I celebrate the beautiful friendship we share! Happy Birthday, dearest friend!', 'Hey AnilBaby, Surprise! I''ve left a gift for you.  I picked it out myself.  Hope you can use it.', 'Happy Birthday', '2012-10-18 00:00:00', 'PENDING', '0000-00-00 00:00:00', 'AnilBaby', '', '', NULL, b'000', NULL, '2012-10-18 16:27:38', '2012-10-18 16:27:38'),
(2312371, 0, 8, 26, '1620891846', 'Mahshooque', NULL, NULL, 'LocalCommunityProjects_TortoiseshellButterflyandBeesonDevilsBitScabious-320x160.jpg8cbe9ce23f42628c98f80fa0fac8b19a16080.jpg', 'Gift To Charity is dedicated to raising additional funds for various causes in India. ', NULL, 'Gift To Charity', NULL, 'PENDING', '0000-00-00 00:00:00', 'Mahshooque', '', '', NULL, b'000', NULL, '2012-10-18 18:45:56', '2012-10-18 18:45:56'),
(2312372, 0, 8, 26, '1620891846', 'Mahshooque', '', 'sirin_ibin@yahoo.co.in', 'plan_zuker-320x160.jpg2a38a4a9316c49e5a833517c45d3107016080.jpg', 'Gift To Charity is dedicated to raising additional funds for various causes in India. ', 'Hey Mahshooque, Surprise! I''ve left a gift for you.  I picked it out myself.  Hope you can use it.', 'Gift To Charity', '2012-12-01 00:00:00', 'PENDING', '0000-00-00 00:00:00', 'Mahshooque', '', '', NULL, b'000', NULL, '2012-10-18 19:07:30', '2012-10-18 19:07:30'),
(2312373, 0, 8, 26, '100002368966773', 'Silhoutte', NULL, NULL, NULL, '            Dear Silhoutte,<br>      Gift To Charity is dedicated to raising additional funds for various causes in India.       <br>      Love,<br>      Sirin', NULL, 'Gift To Charity', NULL, 'PENDING', '0000-00-00 00:00:00', 'Silhoutte', '', '', NULL, b'000', NULL, '2012-10-20 12:08:08', '2012-10-20 12:08:08'),
(2312374, 0, 8, 26, '100002368966773', 'Silhoutte', NULL, NULL, NULL, '            Dear Silhoutte,<br>      Gift To Charity is dedicated to raising additional funds for various causes in India.       <br>      Love,<br>      Sirin', NULL, 'Gift To Charity', NULL, 'PENDING', '0000-00-00 00:00:00', 'Silhoutte', '', '', NULL, b'000', NULL, '2012-10-20 12:08:11', '2012-10-20 12:08:11'),
(2312375, 0, 8, 26, '100002368966773', 'Silhoutte', NULL, NULL, NULL, '            Dear Silhoutte,<br>      Gift To Charity is dedicated to raising additional funds for various causes in India.       <br>      Love,<br>      Sirin', NULL, 'Gift To Charity', NULL, 'PENDING', '0000-00-00 00:00:00', 'Silhoutte', '', '', NULL, b'000', NULL, '2012-10-20 12:08:13', '2012-10-20 12:08:13'),
(2312376, 0, 8, 26, '100002368966773', 'Silhoutte', NULL, NULL, NULL, 'Gift To Charity is dedicated to raising additional funds for various causes in India. ', NULL, 'Gift To Charity', NULL, 'PENDING', '0000-00-00 00:00:00', 'Silhoutte', '', '', NULL, b'000', NULL, '2012-10-20 12:24:31', '2012-10-20 12:24:31'),
(2312377, 0, 8, 26, '100002368966773', 'Silhoutte', NULL, NULL, NULL, 'Gift To Charity is dedicated to raising additional funds for various causes in India. ', NULL, 'Gift To Charity', NULL, 'PENDING', '0000-00-00 00:00:00', 'Silhoutte', '', '', NULL, b'000', NULL, '2012-10-20 12:44:09', '2012-10-20 12:44:09'),
(2312378, 0, 8, 26, '100003233927984', 'Salman', NULL, NULL, NULL, 'Gift To Charity is dedicated to raising additional funds for various causes in India. ', NULL, 'Gift To Charity', NULL, 'PENDING', '0000-00-00 00:00:00', 'Salman', '', '', NULL, b'000', NULL, '2012-10-20 13:01:10', '2012-10-20 13:01:10'),
(2312379, 0, 8, 26, '100003289913041', 'Salman Khan', '', 'sirin_ibin@yahoo.co.in', NULL, 'Gift To Charity is dedicated to raising additional funds for various causes in India. ', 'Hey Salman Khan, Surprise! I''ve left a gift for you.  I picked it out myself.  Hope you can use it.', 'Gift To Charity', '2012-10-23 00:00:00', 'PENDING', '0000-00-00 00:00:00', 'Salman Khan', '', '', NULL, b'000', NULL, '2012-10-20 13:02:41', '2012-10-20 15:01:46'),
(2312380, 0, 4, 26, '100002437700849', 'Sirin', 'sirink89@gmail.com', 'sirin_ibin@yahoo.co.in', NULL, 'As you celebrate your day, I celebrate the beautiful friendship we share! Happy Birthday, dearest friend!', 'Hey Sirin, Surprise! I''ve left a gift for you.  I picked it out myself.  Hope you can use it.', 'Happy Birthday', '2012-10-20 00:00:00', 'SUCCESS', '0000-00-00 00:00:00', 'Sirin', '', '', '100002437700849_440070922707053', b'111', NULL, '2012-10-20 20:55:43', '2012-10-20 20:55:43'),
(2312381, 0, 4, 26, '100002437700849', 'Sirin', 'sirink89@gmail.com', 'sirin_ibin@yahoo.co.in', NULL, 'As you celebrate your day, I celebrate the beautiful friendship we share! Happy Birthday, dearest friend!', 'Hey Sirin, Surprise! I''ve left a gift for you.  I picked it out myself.  Hope you can use it.', 'Happy Birthday', '2012-10-20 00:00:00', 'SUCCESS', '0000-00-00 00:00:00', 'Sirin', '', '', '100002437700849_360058094082246', b'111', NULL, '2012-10-20 20:57:49', '2012-10-20 20:57:49'),
(2312382, 0, 4, 26, '100002437700849', 'Sirin', 'sirink89@gmail.com', 'sirin_ibin@yahoo.co.in', NULL, 'As you celebrate your day, I celebrate the beautiful friendship we share! Happy Birthday, dearest friend!', 'Hey Sirin, Surprise! I''ve left a gift for you.  I picked it out myself.  Hope you can use it.', 'Happy Birthday', '2012-10-20 00:00:00', 'SUCCESS', '0000-00-00 00:00:00', 'Sirin', '', '', '100002437700849_292307550878733', b'111', NULL, '2012-10-20 20:59:48', '2012-10-20 20:59:48'),
(2312383, 0, 4, 26, '100002437700849', 'Sirin', 'sirink89@gmail.com', 'sirin_ibin@yahoo.co.in', NULL, 'As you celebrate your day, I celebrate the beautiful friendship we share! Happy Birthday, dearest friend!', 'Hey Sirin, Surprise! I''ve left a gift for you.  I picked it out myself.  Hope you can use it.', 'Happy Birthday', '2012-10-20 00:00:00', 'SUCCESS', '0000-00-00 00:00:00', 'Sirin', '', '', '100002437700849_416865665043159', b'111', NULL, '2012-10-20 21:01:36', '2012-10-20 21:01:36'),
(2312384, 0, 4, 26, '100002437700849', 'Sirin', 'sirink89@gmail.com', 'sirin_ibin@yahoo.co.in', NULL, 'As you celebrate your day, I celebrate the beautiful friendship we share! Happy Birthday, dearest friend!', 'Hey Sirin, Surprise! I''ve left a gift for you.  I picked it out myself.  Hope you can use it.', 'Happy Birthday', '2012-10-20 00:00:00', 'SUCCESS', '0000-00-00 00:00:00', 'Sirin', '', '', '100002437700849_498351536856726', b'111', NULL, '2012-10-20 21:03:00', '2012-10-20 21:03:00'),
(2312385, 0, 4, 26, '100002437700849', 'Sirin', 'sirink89@gmail.com', 'sirin_ibin@yahoo.co.in', NULL, 'As you celebrate your day, I celebrate the beautiful friendship we share! Happy Birthday, dearest friend!', 'Hey Sirin, Surprise! I''ve left a gift for you.  I picked it out myself.  Hope you can use it.', 'Happy Birthday', '2012-10-20 00:00:00', 'SUCCESS', '0000-00-00 00:00:00', 'Sirin', '', '', '100002437700849_123194464498924', b'111', NULL, '2012-10-20 21:05:44', '2012-10-20 21:05:44'),
(2312386, 0, 4, 26, '100002437700849', 'Sirin', 'sirink89@gmail.com', 'sirin_ibin@yahoo.co.in', NULL, 'As you celebrate your day, I celebrate the beautiful friendship we share! Happy Birthday, dearest friend!', 'Hey Sirin, Surprise! I''ve left a gift for you.  I picked it out myself.  Hope you can use it.', 'Happy Birthday', '2012-10-20 00:00:00', 'SUCCESS', '0000-00-00 00:00:00', 'Sirin', '', '', '100002437700849_293038040804918', b'111', NULL, '2012-10-20 21:06:38', '2012-10-20 21:06:38'),
(2312387, 0, 4, 26, '100002437700849', 'Sirin', 'sirink89@gmail.com', 'sirin_ibin@yahoo.co.in', NULL, 'As you celebrate your day, I celebrate the beautiful friendship we share! Happy Birthday, dearest friend!', 'Hey Sirin, Surprise! I''ve left a gift for you.  I picked it out myself.  Hope you can use it.', 'Happy Birthday', '2012-10-20 00:00:00', 'SUCCESS', '0000-00-00 00:00:00', 'Sirin', '', '', '100002437700849_285048634940214', b'111', NULL, '2012-10-20 21:07:18', '2012-10-20 21:07:18'),
(2312388, 0, 4, 26, '100002437700849', 'Sirin', 'sirink89@gmail.com', 'sirin_ibin@yahoo.co.in', NULL, 'As you celebrate your day, I celebrate the beautiful friendship we share! Happy Birthday, dearest friend!', 'Hey Sirin, Surprise! I''ve left a gift for you.  I picked it out myself.  Hope you can use it.', 'Happy Birthday', '2012-10-20 00:00:00', 'SUCCESS', '0000-00-00 00:00:00', 'Sirin', '', '', '100002437700849_356081561151384', b'111', NULL, '2012-10-20 21:22:09', '2012-10-20 21:22:09'),
(2312389, 0, 8, 26, '100002437700849', 'Sirin', NULL, NULL, 'flowers_213.jpg487d4c6a324446b3fa45b30cfcee5337160120.jpg', '<p>(Updated)<br></p>', NULL, 'Gift To Charity(Updated)', NULL, 'PENDING', '0000-00-00 00:00:00', 'Sirin(Updated)', '', '', NULL, b'000', NULL, '2012-10-21 12:12:39', '2012-10-21 12:14:23'),
(2312390, 0, 8, 26, '100002437700849', 'Sirin', NULL, NULL, 'flowers_213.jpg487d4c6a324446b3fa45b30cfcee5337160120.jpg', '<p>(Updated)<br></p>', NULL, '<p>(Updated)<br></p>', NULL, 'PENDING', '0000-00-00 00:00:00', '<p>(Updated)<br></p>', '', '', NULL, b'000', NULL, '2012-10-21 12:15:23', '2012-10-21 12:15:23'),
(2312391, 0, 8, 26, '100002437700849', 'Sirin', NULL, NULL, 'roseswithpinkteddy.jpg0de5d1a081a3095d62b416e44e055e7a160160.jpg', '<p> Dear Sirin,(updated)<br> Gift To Charity is dedicated to raising additional funds for various causes in India. <br> Love,<br> Sirin</p>', NULL, 'Gift To Charity(Updated)', NULL, 'PENDING', '0000-00-00 00:00:00', 'Sirin(Updated)', '', '', NULL, b'000', NULL, '2012-10-21 12:22:06', '2012-10-21 12:22:06'),
(2312392, 0, 8, 26, '100002437700849', 'Sirin', 'sirink89@gmail.com', 'sirin_ibin@yahoo.co.in', '26390130-MobMasala.Com.jpg354ac345fd8c6d7ef634d9a8e3d47b83160106.66666666667.jpg', '<p> Dear Sirin,(updated)<br> Gift To Charity is dedicated to raising additional funds for various causes in India. <br> Love,<br> Sirin</p>', 'Hey Sirin, Surprise! I''ve left a gift for you.  I picked it out myself.  Hope you can use it.', 'Gift To Chari(Updated)ty', '2012-10-21 00:00:00', 'PENDING', '0000-00-00 00:00:00', 'Sirin(Updated)', '', '', NULL, b'000', NULL, '2012-10-21 12:28:37', '2012-10-21 12:28:37'),
(2312393, 0, 8, 26, '100002437700849', 'Sirin', 'sirinibin2006@gmail.com', 'sirin_ibin@yahoo.co.in', 'flowers_021.jpgdc40b7120e77741d191c0d2b82cea7be160160.jpg', '<p> Dear Sirin,(Updated)<br> Gift To Charity is dedicated to raising additional funds for various causes in India. <br> Love,<br> Sirin</p>', 'Hey Sirin, Surprise! I''ve left a gift for you.  I picked it out myself.  Hope you can use it.', 'Gift To Charity(updated)', '2012-10-21 00:00:00', 'PENDING', '0000-00-00 00:00:00', 'Sirin(updated)', '', '', NULL, b'000', NULL, '2012-10-21 12:42:28', '2012-10-21 12:42:28'),
(2312394, 0, 4, 26, '100002437700849', 'Sirin', 'sirink89@gmail.com', 'sirin_ibin@yahoo.co.in', '26390130-MobMasala.Com.jpg9365ae980268ef00988a8048fa732226160106.66666666667.jpg', '<p> Dear Sirin,(Updated</p><p>)<br> As you celebrate your day, I celebrate the beautiful friendship we share! Happy Birthday, dearest friend! <br> Love,<br> Sirin</p>', 'Hey Sirin, Surprise! I''ve left a gift for you.  I picked it out myself.  Hope you can use it.', 'Happy Birthday(Updated)', '2012-10-21 00:00:00', 'SUCCESS', '0000-00-00 00:00:00', 'Sirin(Updated)', '', '', '100002437700849_372963106113033', b'111', NULL, '2012-10-21 12:43:54', '2012-10-21 12:43:54'),
(2312395, 0, 1, 32, '100000105382499', 'Sirin Ibin', 'sirin_ibin@yahoo.co.in', 'sirink89@gmail.com', NULL, 'Sirin Ibin, thank you so much for your gift.  It was a great surprise.  Can''t wait to use it !', 'Sirin Ibin, thank you so much for your gift.  It was a great surprise.  Can''t wait to use it !', 'Thank you Sirin Ibin.', '2012-10-21 00:00:00', 'PENDING', '0000-00-00 00:00:00', 'Sirin Ibin', '', '', NULL, b'000', 2312394, '2012-10-21 00:00:00', '2012-10-21 00:00:00'),
(2312396, 0, 1, 32, '100000105382499', 'Sirin Ibin', 'sirin_ibin@yahoo.co.in', 'sirink89@gmail.com', NULL, 'Sirin Ibin, thank you so much for your gift.  It was a great surprise.  Can''t wait to use it !', 'Sirin Ibin, thank you so much for your gift.  It was a great surprise.  Can''t wait to use it !', 'Thank you Sirin Ibin.', '2012-10-21 00:00:00', 'PENDING', '0000-00-00 00:00:00', 'Sirin Ibin', '', '', NULL, b'000', 2312394, '2012-10-21 00:00:00', '2012-10-21 00:00:00'),
(2312397, 0, 1, 32, '100000105382499', 'Sirin Ibin', 'sirin_ibin@yahoo.co.in', 'sirink89@gmail.com', NULL, 'Sirin Ibin, thank you so much for your gift.  It was a great surprise.  Can''t wait to use it !', 'Sirin Ibin, thank you so much for your gift.  It was a great surprise.  Can''t wait to use it !', 'Thank you Sirin Ibin.', '2012-10-21 00:00:00', 'PENDING', '0000-00-00 00:00:00', 'Sirin Ibin', '', '', NULL, b'000', 2312394, '2012-10-21 00:00:00', '2012-10-21 00:00:00'),
(2312398, 0, 1, 32, '100000105382499', 'Sirin Ibin', 'sirin_ibin@yahoo.co.in', 'sirink89@gmail.com', NULL, 'Sirin Ibin, thank you so much for your gift.  It was a great surprise.  Can''t wait to use it !', 'Sirin Ibin, thank you so much for your gift.  It was a great surprise.  Can''t wait to use it !', 'Thank you Sirin Ibin.', '2012-10-21 00:00:00', 'PENDING', '0000-00-00 00:00:00', 'Sirin Ibin', '', '', NULL, b'000', 2312394, '2012-10-21 00:00:00', '2012-10-21 00:00:00'),
(2312399, 0, 1, 32, '100000105382499', 'Sirin Ibin', 'sirin_ibin@yahoo.co.in', 'sirink89@gmail.com', NULL, 'Sirin Ibin, thank you so much for your gift.  It was a great surprise.  Can''t wait to use it !', 'Sirin Ibin, thank you so much for your gift.  It was a great surprise.  Can''t wait to use it !', 'Thank you Sirin Ibin.', '2012-10-21 00:00:00', 'PENDING', '0000-00-00 00:00:00', 'Sirin Ibin', '', '', NULL, b'000', 2312394, '2012-10-21 00:00:00', '2012-10-21 00:00:00'),
(2312400, 0, 1, 32, '100000105382499', 'Sirin Ibin', 'sirin_ibin@yahoo.co.in', 'sirink89@gmail.com', NULL, 'Sirin Ibin, thank you so much for your gift.  It was a great surprise.  Can''t wait to use it !', 'Sirin Ibin, thank you so much for your gift.  It was a great surprise.  Can''t wait to use it !', 'Thank you Sirin Ibin.', '2012-10-21 00:00:00', 'PENDING', '0000-00-00 00:00:00', 'Sirin Ibin', '', '', NULL, b'010', 2312394, '2012-10-21 00:00:00', '2012-10-21 00:00:00'),
(2312401, 0, 1, 32, '100000105382499', 'Sirin Ibin', 'sirin_ibin@yahoo.co.in', 'sirink89@gmail.com', NULL, 'Sirin Ibin, thank you so much for your gift.  It was a great surprise.  Can''t wait to use it !', 'Sirin Ibin, thank you so much for your gift.  It was a great surprise.  Can''t wait to use it !', 'Thank you Sirin Ibin.', '2012-10-21 00:00:00', 'PENDING', '0000-00-00 00:00:00', 'Sirin Ibin', '', '', NULL, b'000', 2312394, '2012-10-21 00:00:00', '2012-10-21 00:00:00'),
(2312402, 0, 1, 26, '1220500771', 'Gaurav K Sharma', 'instinct.iitk@gmail.com', 'sirin_ibin@yahoo.co.in', NULL, 'Gaurav K Sharma, thank you so much for your gift.  It was a great surprise.  Can''t wait to use it !', 'Gaurav K Sharma, thank you so much for your gift.  It was a great surprise.  Can''t wait to use it !', 'Thank you Gaurav K Sharma.', '2012-10-21 00:00:00', 'PENDING', '0000-00-00 00:00:00', 'Gaurav K Sharma', '', '', '1220500771_251704958285904', b'111', 2312312, '2012-10-21 00:00:00', '2012-10-21 00:00:00'),
(2312403, 0, 1, 32, '100000105382499', 'Sirin Ibin', 'sirin_ibin@yahoo.co.in', 'sirink89@gmail.com', NULL, 'Sirin Ibin, thank you so much for your gift.  It was a great surprise.  Can''t wait to use it !', 'Sirin Ibin, thank you so much for your gift.  It was a great surprise.  Can''t wait to use it !', 'Thank you Sirin Ibin.', '2012-10-21 00:00:00', 'PENDING', '0000-00-00 00:00:00', 'Sirin Ibin', '', '', '100000105382499_299362603510989', b'111', 2312394, '2012-10-21 00:00:00', '2012-10-21 00:00:00'),
(2312404, 0, 1, 32, '100000105382499', 'Sirin Ibin', 'sirin_ibin@yahoo.co.in', 'sirink89@gmail.com', NULL, 'Sirin Ibin, thank you so much for your gift.  It was a great surprise.  Can''t wait to use it !', 'Sirin Ibin, thank you so much for your gift.  It was a great surprise.  Can''t wait to use it !', 'Thank you Sirin Ibin.', '2012-10-21 00:00:00', 'PENDING', '0000-00-00 00:00:00', 'Sirin Ibin', '', '', '100000105382499_428669863849634', b'111', 2312388, '2012-10-21 00:00:00', '2012-10-21 00:00:00'),
(2312405, 0, 1, 26, '100002437700849', 'Sirin Ibin', 'sirink89@gmail.com', 'sirin_ibin@yahoo.co.in', NULL, 'Sirin Ibin, thank you so much for your gift.  It was a great surprise.  Can''t wait to use it !', 'Sirin Ibin, thank you so much for your gift.  It was a great surprise.  Can''t wait to use it !', 'Thank you Sirin Ibin.', '2012-10-21 00:00:00', 'PENDING', '0000-00-00 00:00:00', 'Sirin Ibin', '', '', '100002437700849_367189323369841', b'111', 2312404, '2012-10-21 00:00:00', '2012-10-21 00:00:00'),
(2312406, 0, 4, 26, '100002437700849', 'Sirin', 'sirinibin2006@gmail.com', 'sirinibin2006@gmail.com', 'LocalCommunityProjects_TortoiseshellButterflyandBeesonDevilsBitScabious-320x160.jpgc0a62e133894cdce435bcb4a5df1db2d16080.jpg', '<p> Dear Sirin,(Final)<br> As you celebrate your day, I celebrate the beautiful friendship we share! Happy Birthday, dearest friend! <br> Love,<br> Sirin</p>', 'Hey Sirin, Surprise! I''ve left a gift for you.  I picked it out myself.  Hope you can use it.', 'Happy Birthday(final)', '2012-10-21 00:00:00', 'SUCCESS', '0000-00-00 00:00:00', 'Sirin(Final)', '', '', '100002437700849_429699743753765', b'111', NULL, '2012-10-21 13:30:36', '2012-10-21 13:30:36'),
(2312407, 0, 1, 32, '100000105382499', 'Sirin Ibin', 'sirin_ibin@yahoo.co.in', 'sirink89@gmail.com', NULL, 'Sirin Ibin, thank you so much for your gift.  It was a great surprise.  Can''t wait to use it !', 'Sirin Ibin, thank you so much for your gift.  It was a great surprise.  Can''t wait to use it !', 'Thank you Sirin Ibin.', '2012-10-21 00:00:00', 'SUCCESS', '0000-00-00 00:00:00', 'Sirin Ibin', '', '', '100000105382499_238415136285352', b'111', 2312406, '2012-10-21 00:00:00', '2012-10-21 00:00:00'),
(2312408, 0, 4, 26, '100002437700849', 'Sirin', NULL, NULL, NULL, 'As you celebrate your day, I celebrate the beautiful friendship we share! Happy Birthday, dearest friend!', NULL, 'Happy Birthday', NULL, 'PENDING', '0000-00-00 00:00:00', 'Sirin', '', '', NULL, b'000', NULL, '2012-10-21 15:03:15', '2012-10-21 15:03:15'),
(2312409, 0, 4, 26, '1434309672', 'Arun', NULL, NULL, NULL, 'As you celebrate your day, I celebrate the beautiful friendship we share! Happy Birthday, dearest friend!', NULL, 'Happy Birthday', NULL, 'PENDING', '0000-00-00 00:00:00', 'Arun', '', '', NULL, b'000', NULL, '2012-10-21 20:03:37', '2012-10-21 20:03:37'),
(2312410, 0, 2, 26, '100004488310146', 'Gaurav Sharma', 'gaurav@leaveagift.com', 'sirin_ibin@yahoo.co.in', NULL, 'Gaurav Sharma, thank you so much for your gift.  It was a great surprise.  Can''t wait to use it !', 'Gaurav Sharma, thank you so much for your gift.  It was a great surprise.  Can''t wait to use it !', 'Thank you Gaurav Sharma.', '2012-10-21 00:00:00', 'SUCCESS', '0000-00-00 00:00:00', 'Gaurav Sharma', '', '', '100004488310146_291760740940060', b'111', 2312318, '2012-10-21 00:00:00', '2012-10-21 00:00:00'),
(2312411, 0, 12, 26, '100004329824179', 'Jaideep', 'jaideep@leaveagift.com', 'sirin_ibin@yahoo.co.in', 'flowers_021.jpg0d2b2061826a5df3221116a5085a6052160160.jpg', 'As you celebrate your day, I celebrate the beautiful friendship we share! Happy Birthday, dearest friend!', 'Hey Jaideep, Surprise! I''ve left a gift for you.  I picked it out myself.  Hope you can use it.', 'Happy Birthday', '2012-10-23 00:00:00', 'SUCCESS', '0000-00-00 00:00:00', 'Jaideep', '', '', '100004329824179_380645168678327', b'111', NULL, '2012-10-23 19:16:46', '2012-10-23 19:16:46'),
(2312412, 0, 1, 35, '100000105382499', 'Sirin Ibin', 'sirin_ibin@yahoo.co.in', 'jaideep@leaveagift.com', NULL, 'Sirin Ibin, thank you so much for your gift.  It was a great surprise.  Can''t wait to use it !', 'Sirin Ibin, thank you so much for your gift.  It was a great surprise.  Can''t wait to use it !', 'Thank you Sirin Ibin.', '2012-10-23 00:00:00', 'SUCCESS', '0000-00-00 00:00:00', 'Sirin Ibin', '', '', NULL, b'000', 2312411, '2012-10-23 00:00:00', '2012-10-23 00:00:00'),
(2312413, 0, 1, 35, '100000105382499', 'Sirin Ibin', 'sirin_ibin@yahoo.co.in', 'jaideep@leaveagift.com', NULL, 'Sirin Ibin, thank you so much for your gift.  It was a great surprise.  Can''t wait to use it !', 'Sirin Ibin, thank you so much for your gift.  It was a great surprise.  Can''t wait to use it !', 'Thank you Sirin Ibin.', '2012-10-23 00:00:00', 'SUCCESS', '0000-00-00 00:00:00', 'Sirin Ibin', '', '', NULL, b'000', 2312411, '2012-10-23 00:00:00', '2012-10-23 00:00:00'),
(2312414, 0, 2, 35, '100000105382499', 'Sirin Ibin', 'sirin_ibin@yahoo.co.in', 'jaideep@leaveagift.com', NULL, 'Sirin Ibin, thank you so much for your gift.  It was a great surprise.  Can''t wait to use it !', 'Sirin Ibin, thank you so much for your gift.  It was a great surprise.  Can''t wait to use it !', 'Thank you Sirin Ibin.', '2012-10-23 00:00:00', 'SUCCESS', '0000-00-00 00:00:00', 'Sirin Ibin', '', '', NULL, b'000', 2312411, '2012-10-23 00:00:00', '2012-10-23 00:00:00'),
(2312415, 0, 1, 35, '100000105382499', 'Sirin Ibin', 'sirin_ibin@yahoo.co.in', 'jaideep@leaveagift.com', NULL, 'Sirin Ibin, thank you so much for your gift.  It was a great surprise.  Can''t wait to use it !', 'Sirin Ibin, thank you so much for your gift.  It was a great surprise.  Can''t wait to use it !', 'Thank you Sirin Ibin.', '2012-10-23 00:00:00', 'SUCCESS', '0000-00-00 00:00:00', 'Sirin Ibin', '', '', NULL, b'010', 2312411, '2012-10-23 00:00:00', '2012-10-23 00:00:00'),
(2312416, 0, 1, 35, '100000105382499', 'Sirin Ibin', 'sirin_ibin@yahoo.co.in', 'jaideep@leaveagift.com', NULL, 'Sirin Ibin, thank you so much for your gift.  It was a great surprise.  Can''t wait to use it !', 'Sirin Ibin, thank you so much for your gift.  It was a great surprise.  Can''t wait to use it !', 'Thank you Sirin Ibin.', '2012-10-23 00:00:00', 'SUCCESS', '0000-00-00 00:00:00', 'Sirin Ibin', '', '', NULL, b'000', 2312411, '2012-10-23 00:00:00', '2012-10-23 00:00:00'),
(2312417, 0, 1, 35, '100000105382499', 'Sirin Ibin', 'sirin_ibin@yahoo.co.in', 'jaideep@leaveagift.com', NULL, 'Sirin Ibin, thank you so much for your gift.  It was a great surprise.  Can''t wait to use it !', 'Sirin Ibin, thank you so much for your gift.  It was a great surprise.  Can''t wait to use it !', 'Thank you Sirin Ibin.', '2012-10-23 00:00:00', 'SUCCESS', '0000-00-00 00:00:00', 'Sirin Ibin', '', '', NULL, b'000', 2312411, '2012-10-23 00:00:00', '2012-10-23 00:00:00'),
(2312418, 0, 1, 35, '100000105382499', 'Sirin Ibin', 'sirin_ibin@yahoo.co.in', 'jaideep@leaveagift.com', NULL, 'Sirin Ibin, thank you so much for your gift.  It was a great surprise.  Can''t wait to use it !', 'Sirin Ibin, thank you so much for your gift.  It was a great surprise.  Can''t wait to use it !', 'Thank you Sirin Ibin.', '2012-10-23 00:00:00', 'SUCCESS', '0000-00-00 00:00:00', 'Sirin Ibin', '', '', NULL, b'000', 2312411, '2012-10-23 00:00:00', '2012-10-23 00:00:00'),
(2312419, 0, 1, 35, '100000105382499', 'Sirin Ibin', 'sirin_ibin@yahoo.co.in', 'jaideep@leaveagift.com', NULL, 'Sirin Ibin, thank you so much for your gift.  It was a great surprise.  Can''t wait to use it !', 'Sirin Ibin, thank you so much for your gift.  It was a great surprise.  Can''t wait to use it !', 'Thank you Sirin Ibin.', '2012-10-23 00:00:00', 'SUCCESS', '0000-00-00 00:00:00', 'Sirin Ibin', '', '', NULL, b'000', 2312411, '2012-10-23 00:00:00', '2012-10-23 00:00:00'),
(2312420, 0, 1, 35, '100000105382499', 'Sirin Ibin', 'sirin_ibin@yahoo.co.in', 'jaideep@leaveagift.com', NULL, 'Sirin Ibin, thank you so much for your gift.  It was a great surprise.  Can''t wait to use it !', 'Sirin Ibin, thank you so much for your gift.  It was a great surprise.  Can''t wait to use it !', 'Thank you Sirin Ibin.', '2012-10-23 00:00:00', 'SUCCESS', '0000-00-00 00:00:00', 'Sirin Ibin', '', '', NULL, b'000', 2312411, '2012-10-23 00:00:00', '2012-10-23 00:00:00'),
(2312421, 0, 1, 35, '100000105382499', 'Sirin Ibin', 'sirin_ibin@yahoo.co.in', 'jaideep@leaveagift.com', NULL, 'Sirin Ibin, thank you so much for your gift.  It was a great surprise.  Can''t wait to use it !', 'Sirin Ibin, thank you so much for your gift.  It was a great surprise.  Can''t wait to use it !', 'Thank you Sirin Ibin.', '2012-10-23 00:00:00', 'SUCCESS', '0000-00-00 00:00:00', 'Sirin Ibin', '', '', NULL, b'000', 2312411, '2012-10-23 00:00:00', '2012-10-23 00:00:00'),
(2312422, 0, 1, 35, '100000105382499', 'Sirin Ibin', 'sirin_ibin@yahoo.co.in', 'jaideep@leaveagift.com', NULL, 'Sirin Ibin, thank you so much for your gift.  It was a great surprise.  Can''t wait to use it !', 'Sirin Ibin, thank you so much for your gift.  It was a great surprise.  Can''t wait to use it !', 'Thank you Sirin Ibin.', '2012-10-23 00:00:00', 'SUCCESS', '0000-00-00 00:00:00', 'Sirin Ibin', '', '', NULL, b'000', 2312411, '2012-10-23 00:00:00', '2012-10-23 00:00:00'),
(2312423, 0, 1, 32, '100000105382499', 'Sirin Ibin', 'sirin_ibin@yahoo.co.in', 'sirink89@gmail.com', NULL, 'Sirin Ibin, thank you so much for your gift.  It was a great surprise.  Can''t wait to use it !', 'Sirin Ibin, thank you so much for your gift.  It was a great surprise.  Can''t wait to use it !', 'Thank you Sirin Ibin.', '2012-10-23 00:00:00', 'SUCCESS', '0000-00-00 00:00:00', 'Sirin Ibin', '', '', '100000105382499_410010415730841', b'111', 2312388, '2012-10-23 00:00:00', '2012-10-23 00:00:00'),
(2312424, 0, 1, 35, '100000105382499', 'Sirin Ibin', 'sirin_ibin@yahoo.co.in', 'jaideep@leaveagift.com', NULL, 'Sirin Ibin, thank you so much for your gift.  It was a great surprise.  Can''t wait to use it !', 'Sirin Ibin, thank you so much for your gift.  It was a great surprise.  Can''t wait to use it !', 'Thank you Sirin Ibin.', '2012-10-23 00:00:00', 'SUCCESS', '0000-00-00 00:00:00', 'Sirin Ibin', '', '', NULL, b'000', 2312411, '2012-10-23 00:00:00', '2012-10-23 00:00:00'),
(2312425, 0, 1, 35, '100000105382499', 'Sirin Ibin', 'sirin_ibin@yahoo.co.in', 'jaideep@leaveagift.com', NULL, 'Sirin Ibin, thank you so much for your gift.  It was a great surprise.  Can''t wait to use it !', 'Sirin Ibin, thank you so much for your gift.  It was a great surprise.  Can''t wait to use it !', 'Thank you Sirin Ibin.', '2012-10-23 00:00:00', 'SUCCESS', '0000-00-00 00:00:00', 'Sirin Ibin', '', '', NULL, b'000', 2312411, '2012-10-23 00:00:00', '2012-10-23 00:00:00'),
(2312426, 0, 1, 32, '100000105382499', 'Sirin Ibin', 'sirin_ibin@yahoo.co.in', 'sirink89@gmail.com', NULL, 'Sirin Ibin, thank you so much for your gift.  It was a great surprise.  Can''t wait to use it !', 'Sirin Ibin, thank you so much for your gift.  It was a great surprise.  Can''t wait to use it !', 'Thank you Sirin Ibin.', '2012-10-23 00:00:00', 'SUCCESS', '0000-00-00 00:00:00', 'Sirin Ibin', '', '', '100000105382499_483098998390877', b'111', 2312406, '2012-10-23 00:00:00', '2012-10-23 00:00:00'),
(2312427, 0, 1, 35, '100000105382499', 'Sirin Ibin', 'sirin_ibin@yahoo.co.in', 'jaideep@leaveagift.com', NULL, 'Sirin Ibin, thank you so much for your gift.  It was a great surprise.  Can''t wait to use it !', 'Sirin Ibin, thank you so much for your gift.  It was a great surprise.  Can''t wait to use it !', 'Thank you Sirin Ibin.', '2012-10-23 00:00:00', 'SUCCESS', '0000-00-00 00:00:00', 'Sirin Ibin', '', '', '100000105382499_485605894806524', b'111', 2312411, '2012-10-23 00:00:00', '2012-10-23 00:00:00'),
(2312428, 0, 1, 35, '100000105382499', 'Sirin Ibin', 'sirin_ibin@yahoo.co.in', 'jaideep@leaveagift.com', NULL, 'Sirin Ibin, thank you so much for your gift.  It was a great surprise.  Can''t wait to use it !', 'Sirin Ibin, thank you so much for your gift.  It was a great surprise.  Can''t wait to use it !', 'Thank you Sirin Ibin.', '2012-10-23 00:00:00', 'SUCCESS', '0000-00-00 00:00:00', 'Sirin Ibin', '', '', '100000105382499_460740620636431', b'111', 2312411, '2012-10-23 00:00:00', '2012-10-23 00:00:00'),
(2312429, 0, 5, 26, '100002437700849', 'Sirin', NULL, NULL, NULL, '<p>Dear Sirin(Updated)123<br>As you celebrate your day, I celebrate the beautiful friendship we share! Happy Birthday, dearest friend! <br> Love,<br>Sirin</p>', NULL, 'Happy Birthday', NULL, 'PENDING', '0000-00-00 00:00:00', 'Sirin', '', '', NULL, b'000', NULL, '2012-10-25 20:17:49', '2012-10-25 21:31:46'),
(2312430, 0, 12, 26, '100002437700849', 'Sirin', NULL, NULL, NULL, 'Dear Sirin<br />As you celebrate your day, I celebrate the beautiful friendship we share! Happy Birthday, dearest friend! <br />\n	              Love,<br />Sirin', NULL, 'Happy Birthday', NULL, 'PENDING', '0000-00-00 00:00:00', 'Sirin', '', '', NULL, b'000', NULL, '2012-10-25 20:28:19', '2012-10-25 20:28:19'),
(2312431, 0, 12, 26, '1729306690', 'Naohiko', NULL, NULL, NULL, 'Dear Sirin<br />As you celebrate your day, I celebrate the beautiful friendship we share! Happy Birthday, dearest friend! <br />\n	              Love,<br />Sirin', NULL, 'Happy Birthday', NULL, 'PENDING', '0000-00-00 00:00:00', 'Sirin', '', '', NULL, b'000', NULL, '2012-10-25 20:47:07', '2012-10-25 20:47:07'),
(2312432, 0, 12, 26, '1729306690', 'Naohiko', NULL, NULL, NULL, '<p>Dear Naohiko<br>As you celebrate your day, I celebrate the </p><p>beautiful friendship we share! Happy Birthday, </p><p>dearest friend! <br> Love,<br>Sirin</p><p>kdnckj<br></p><p>kjdcnkj<br></p><p>lkndcklj<br></p><p>,kdncj<br></p>', NULL, 'Happy Birthday', NULL, 'PENDING', '0000-00-00 00:00:00', 'Naohiko', '', '', NULL, b'000', NULL, '2012-10-26 18:43:04', '2012-10-26 18:43:04'),
(2312433, 0, 12, 26, '1729306690', 'Naohiko', NULL, NULL, NULL, '<p>Dear Naohiko<br>As you celebrate your day, I celebrate the <br> Love,<br>Sirin</p>', NULL, 'Happy Birthday', NULL, 'PENDING', '0000-00-00 00:00:00', 'Naohiko', '', '', NULL, b'000', NULL, '2012-10-26 18:47:58', '2012-10-26 18:47:58'),
(2312434, 0, 23, 26, '100001303623284', 'Varun', NULL, NULL, NULL, 'Dear Varun<br />As you celebrate your day, I celebrate the beautiful friendship we share! Happy Birthday, dearest friend! <br />\n	              Love,<br />Sirin', NULL, 'Happy Birthday', NULL, 'PENDING', '0000-00-00 00:00:00', 'Varun', '', '', NULL, b'000', NULL, '2012-10-27 13:49:48', '2012-10-27 13:49:48'),
(2312435, 0, 23, 26, '100001303623284', 'Varun', NULL, NULL, NULL, 'Dear Varun<br />As you celebrate your day, I celebrate the beautiful friendship we share! Happy Birthday, dearest friend! <br />\n	              Love,<br />Sirin', NULL, 'Happy Birthday', NULL, 'PENDING', '0000-00-00 00:00:00', 'Arun', '', '', NULL, b'000', NULL, '2012-10-27 14:06:42', '2012-10-27 14:06:42'),
(2312436, 0, 23, 26, '100001303623284', 'Varun', NULL, NULL, NULL, 'Dear Varun<br />As you celebrate your day, I celebrate the beautiful friendship we share! Happy Birthday, dearest friend! <br />\n	              Love,<br />Sirin', NULL, 'Happy Birthday', NULL, 'PENDING', '0000-00-00 00:00:00', 'Varun', '', '', NULL, b'000', NULL, '2012-10-27 14:47:59', '2012-10-27 14:47:59'),
(2312437, 0, 24, 26, '100001303623284', 'Varun', NULL, NULL, NULL, 'Dear Varun<br />As you celebrate your day, I celebrate the beautiful friendship we share! Happy Birthday, dearest friend! <br />\n	              Love,<br />Sirin', NULL, 'Happy Birthday', NULL, 'PENDING', '0000-00-00 00:00:00', 'Varun', '', '', NULL, b'000', NULL, '2012-10-27 15:07:15', '2012-10-27 15:07:15'),
(2312438, 0, 24, 26, '100001303623284', 'Varun', NULL, NULL, NULL, '<p>jgschjuadbvs khgsdc7uqgay udigcfieuwhdc<br></p><p>kdncbkjdsnck ijednciuehdncu iehdiewu iuedhie <br></p>', NULL, 'Happy Birthday', NULL, 'PENDING', '0000-00-00 00:00:00', 'Varun', '', '', NULL, b'000', NULL, '2012-10-27 15:57:28', '2012-10-27 15:57:28'),
(2312439, 0, 24, 26, '100001303623284', 'Varun', '', 'sirin_ibin@yahoo.co.in', NULL, '<p>abc</p><p>ujqevfhjvr jhdvycvebwd jhugfvyudvsbjwvfu jwegfvjhvd<br></p><p>&nbsp;jbrfibvwj hwbvfhewhj bvfhuevshj hevfcyuhgbvs<br></p><p>lkjfnvdkj<br></p><p>ecf<br></p><p><br></p>', 'Hey Varun, Surprise! I''ve left a gift for you.  I picked it out myself.  Hope you can use it.', 'Happy Birthday', '2012-10-29 00:00:00', 'PENDING', '0000-00-00 00:00:00', 'Varun', '', '', NULL, b'000', NULL, '2012-10-27 18:28:05', '2012-10-27 18:28:05'),
(2312440, 0, 22, 26, '1729306690', 'Naohiko', NULL, NULL, NULL, '          <p>Dear Naohiko<br>As you celebrate your day, I celebrate the <br> Love,<br>Sirin</p>', NULL, 'ej', NULL, 'PENDING', '0000-00-00 00:00:00', 'kbkj', '', '', NULL, b'000', NULL, '2012-10-29 13:03:05', '2012-10-29 13:03:05'),
(2312441, 0, 22, 26, '100002669284303', 'Anoop Keezhillath', '', 'sirin_ibin@yahoo.co.in', NULL, 'Dear Anoop Keezhillath<br />As you celebrate your day, I celebrate the beautiful friendship we share! Happy Birthday, dearest friend! <br />\n	              Love,<br />Sirin', 'Hey Anoop Keezhillath, Surprise! I''ve left a gift for you.  I picked it out myself.  Hope you can use it.', 'Happy Birthday', '2013-01-27 00:00:00', 'PENDING', '0000-00-00 00:00:00', 'Anoop Keezhillath', '', '', NULL, b'000', NULL, '2012-10-29 14:54:46', '2012-10-29 14:54:46'),
(2312442, 0, 22, 26, '100002669284303', 'Anoop Keezhillath', NULL, NULL, NULL, 'Dear Anoop Keezhillath<br />As you celebrate your day, I celebrate the beautiful friendship we share! Happy Birthday, dearest friend! <br />\n	              Love,<br />Sirin', NULL, 'Happy Birthday', NULL, 'PENDING', '0000-00-00 00:00:00', 'Anoop Keezhillath', '', '', NULL, b'000', NULL, '2012-10-29 15:05:44', '2012-10-29 15:05:44'),
(2312443, 0, 25, 26, '100002669284303', 'Anoop Keezhillath', NULL, NULL, NULL, 'Dear Anoop Keezhillath<br />As you celebrate your day, I celebrate the beautiful friendship we share! Happy Birthday, dearest friend! <br />\n	              Love,<br />Sirin', NULL, 'Happy Birthday', NULL, 'PENDING', '0000-00-00 00:00:00', 'Anoop Keezhillath', '', '', NULL, b'000', NULL, '2012-10-29 15:41:16', '2012-10-29 15:41:16'),
(2312444, 0, 25, 26, '100001303623284', 'Varun', NULL, NULL, NULL, 'Dear Varun<br />As you celebrate your day, I celebrate the beautiful friendship we share! Happy Birthday, dearest friend! <br />\n	              Love,<br />Sirin', NULL, 'Happy Birthday', NULL, 'PENDING', '0000-00-00 00:00:00', 'Varun', '', '', NULL, b'000', NULL, '2012-10-29 16:47:53', '2012-10-29 16:47:53'),
(2312445, 0, 25, 26, '100003100808585', 'Taj', NULL, NULL, NULL, 'Dear Taj<br />As you celebrate your day, I celebrate the beautiful friendship we share! Happy Birthday, dearest friend! <br />\n	              Love,<br />Sirin', NULL, 'Happy Birthday', NULL, 'PENDING', '0000-00-00 00:00:00', 'Taj', '', '', NULL, b'000', NULL, '2012-10-30 17:24:21', '2012-10-30 17:24:21'),
(2312446, 0, 10, 26, '783274419', 'Abdul', NULL, NULL, NULL, 'Dear Abdul<br />Gift To Charity is dedicated to raising additional funds for various causes in India.  <br />\n	              Love,<br />Sirin', NULL, 'Gift To Charity', NULL, 'PENDING', '0000-00-00 00:00:00', 'Abdul', '', '', NULL, b'000', NULL, '2012-10-30 17:31:21', '2012-10-30 17:31:21'),
(2312447, 0, 23, 0, '100002437700849', 'Sirin', NULL, NULL, NULL, '          Dear Sirin<br>As you celebrate your day, I celebrate the beautiful friendship we share! Happy Birthday, dearest friend! <br>              Love,<br>Sirin', NULL, 'Happy Birthday', NULL, 'PENDING', '0000-00-00 00:00:00', 'Sirin', '', '', NULL, b'000', NULL, '2012-10-31 13:07:29', '2012-10-31 13:07:29'),
(2312448, 0, 23, 0, '1351680198', 'Nafseer', NULL, NULL, NULL, '          Dear Nafseer<br>(Updated)As you celebrate your day, I celebrate the beautiful friendship we share! Happy Birthday, dearest friend! <br>              Love,<br>Sirin', NULL, 'Happy Birthday', NULL, 'PENDING', '0000-00-00 00:00:00', 'Nafseer', '', '', NULL, b'000', NULL, '2012-10-31 13:08:56', '2012-10-31 13:08:56'),
(2312449, 0, 23, 0, '1351680198', 'Nafseer', NULL, NULL, NULL, 'Dear Nafseer<br /><p>(Updated)</p>\r\n<p>As you <strong>celebrate</strong> your day, I celebrate the beautiful friendship we share! Happy Birthday, dearest friend!</p> <br />\n	              Love,<br />Sirin', NULL, 'Happy Birthday', NULL, 'PENDING', '0000-00-00 00:00:00', 'Nafseer', '', '', NULL, b'000', NULL, '2012-10-31 13:14:57', '2012-10-31 13:14:57'),
(2312450, 0, 24, 0, '100002905089223', 'Sam', NULL, NULL, NULL, 'Dear Sam<br /><p>(Updated)</p>\r\n<p>As you <strong>celebrate</strong> your day, I celebrate the beautiful friendship we share! Happy Birthday, dearest friend!</p> <br />\n	              Love,<br />Sirin', NULL, 'Happy Birthday', NULL, 'PENDING', '0000-00-00 00:00:00', 'Timm', '', '', NULL, b'000', NULL, '2012-10-31 13:39:15', '2012-10-31 13:39:15'),
(2312451, 0, 12, 26, '100002905089223', 'Sam', NULL, NULL, NULL, 'Dear Sam<br /><p>(Updated)</p>\r\n<p>As you <strong>celebrate</strong> your day, I celebrate the beautiful friendship we share! Happy Birthday, dearest friend!</p> <br />\n	              Love,<br />Sirin', NULL, 'Happy Birthday', NULL, 'PENDING', '0000-00-00 00:00:00', 'Sam', '', '', NULL, b'000', NULL, '2012-10-31 17:33:17', '2012-10-31 17:33:17'),
(2312452, 0, 4, 26, '640051761', 'Raymond', NULL, NULL, NULL, 'Dear Raymond<br /><p>(Updated)</p>\r\n<p>As you <strong>celebrate</strong> your day, I celebrate the beautiful friendship we share! Happy Birthday, dearest friend!</p> <br />\n	              Love,<br />Sirin', NULL, 'Happy Birthday', NULL, 'PENDING', '0000-00-00 00:00:00', 'Raymond', '', '', NULL, b'000', NULL, '2012-10-31 17:48:55', '2012-10-31 17:48:55'),
(2312453, 0, 12, 26, '640051761', 'Raymond', NULL, NULL, NULL, 'Dear Raymond<br /><p>(Updated)</p>\r\n<p>As you <strong>celebrate</strong> your day, I celebrate the beautiful friendship we share! Happy Birthday, dearest friend!</p> <br />\n	              Love,<br />Sirin', NULL, 'Happy Birthday', NULL, 'PENDING', '0000-00-00 00:00:00', 'Raymond', '', '', NULL, b'000', NULL, '2012-10-31 18:27:03', '2012-10-31 18:27:03'),
(2312454, 0, 5, 26, '1075638487', 'Victor', NULL, NULL, NULL, 'Dear Victor<br /><p>(Updated)</p>\r\n<p>As you <strong>celebrate</strong> your day, I celebrate the beautiful friendship we share! Happy Birthday, dearest friend!</p> <br />\n	              Love,<br />Sirin', NULL, 'Happy Birthday', NULL, 'PENDING', '0000-00-00 00:00:00', 'Victor', '', '', NULL, b'000', NULL, '2012-10-31 18:27:55', '2012-10-31 18:27:55'),
(2312455, 0, 10, 26, '640051761', 'Raymond', NULL, NULL, NULL, 'Dear Raymond<br /><p>I''m sending a gift to charity for you. We''re both helping to make the world a little better and spread some happiness.</p>\r\n<p>Best,</p> <br />\n	              Love,<br />Sirin', NULL, 'Gift To Charity', NULL, 'PENDING', '0000-00-00 00:00:00', 'Raymond', '', '', NULL, b'000', NULL, '2012-10-31 18:28:16', '2012-10-31 18:28:16'),
(2312456, 0, 12, 26, '100000220065163', 'Muhammad', NULL, NULL, NULL, 'Dear Muhammad<br /><p>(Updated)</p>\r\n<p>As you <strong>celebrate</strong> your day, I celebrate the beautiful friendship we share! Happy Birthday, dearest friend!</p> <br />\n	              Love,<br />Sirin', NULL, 'Happy Birthday', NULL, 'PENDING', '0000-00-00 00:00:00', 'Muhammad', '', '', NULL, b'000', NULL, '2012-10-31 18:28:42', '2012-10-31 18:28:42'),
(2312457, 0, 12, 26, '100000220065163', 'Muhammad', NULL, NULL, NULL, 'Dear Muhammad<br /><p>(Updated)</p>\r\n<p>As you <strong>celebrate</strong> your day, I celebrate the beautiful friendship we share! Happy Birthday, dearest friend!</p> <br />\n	              Love,<br />Sirin', NULL, 'Happy Birthday', NULL, 'PENDING', '0000-00-00 00:00:00', 'Muhammad', '', '', NULL, b'000', NULL, '2012-10-31 18:33:25', '2012-10-31 18:33:25'),
(2312458, 0, 12, 26, '100000220065163', 'Muhammad', NULL, NULL, NULL, 'Dear Muhammad<br /><p>(Updated)</p>\r\n<p>As you <strong>celebrate</strong> your day, I celebrate the beautiful friendship we share! Happy Birthday, dearest friend!</p> <br />\n	              Love,<br />Sirin', NULL, 'Happy Birthday', NULL, 'PENDING', '0000-00-00 00:00:00', 'Muhammad', '', '', NULL, b'000', NULL, '2012-10-31 18:39:17', '2012-10-31 18:39:17'),
(2312459, 0, 12, 26, '640051761', 'Raymond', NULL, NULL, NULL, 'Dear Raymond<br /><p>(Updated)</p>\r\n<p>As you <strong>celebrate</strong> your day, I celebrate the beautiful friendship we share! Happy Birthday, dearest friend!</p> <br />\n	              Love,<br />Sirin', NULL, 'Happy Birthday', NULL, 'PENDING', '0000-00-00 00:00:00', 'Raymond', '', '', NULL, b'000', NULL, '2012-10-31 18:40:37', '2012-10-31 18:40:37'),
(2312460, 0, 12, 26, '640051761', 'Raymond', NULL, NULL, NULL, 'Dear Raymond<br /><p>(Updated)</p>\r\n<p>As you <strong>celebrate</strong> your day, I celebrate the beautiful friendship we share! Happy Birthday, dearest friend!</p> <br />\n	              Love,<br />Sirin', NULL, 'Happy Birthday', NULL, 'PENDING', '0000-00-00 00:00:00', 'Raymond', '', '', NULL, b'000', NULL, '2012-10-31 18:51:21', '2012-10-31 18:51:21');
INSERT INTO `lag_user_order` (`id_user_gift`, `id_cart`, `id_product`, `id_user`, `receiver_fbid`, `receiver_fbfirstname`, `receiver_fbemail`, `notify_email`, `img_url`, `message_card`, `message_post`, `title`, `delivery_date`, `order_status`, `end_time`, `greeting`, `gift_opened`, `gift_rating`, `facebook_postid`, `post_email_status`, `thankyouid`, `date_add`, `date_upd`) VALUES
(2312461, 0, 12, 26, '640051761', 'Raymond', NULL, NULL, NULL, 'Dear Raymond<br /><p>(Updated)</p>\r\n<p>As you <strong>celebrate</strong> your day, I celebrate the beautiful friendship we share! Happy Birthday, dearest friend!</p> <br />\n	              Love,<br />Sirin', NULL, 'Happy Birthday', NULL, 'PENDING', '0000-00-00 00:00:00', 'Raymond', '', '', NULL, b'000', NULL, '2012-10-31 19:24:04', '2012-10-31 19:24:04'),
(2312462, 0, 12, 26, '640051761', 'Raymond', '', 'sirin_ibin@yahoo.co.in', NULL, 'Dear Raymond<br /><p>(Updated)</p>\r\n<p>As you <strong>celebrate</strong> your day, I celebrate the beautiful friendship we share! Happy Birthday, dearest friend!</p> <br />\n	              Love,<br />Sirin', 'Hey Raymond, Surprise! I''ve left a gift for you.  I picked it out myself.  Hope you can use it.', 'Happy Birthday', '2012-10-31 00:00:00', 'PENDING', '0000-00-00 00:00:00', 'Raymond', '', '', NULL, b'010', NULL, '2012-10-31 19:26:41', '2012-10-31 19:26:41'),
(2312463, 0, 12, 26, '1351680198', 'Nafseer', '', 'sirin_ibin@yahoo.co.in', NULL, 'Dear Nafseer<br /><p>(Updated)</p>\r\n<p>As you <strong>celebrate</strong> your day, I celebrate the beautiful friendship we share! Happy Birthday, dearest friend!</p> <br />\n	              Love,<br />Sirin', 'Hey Nafseer, Surprise! I''ve left a gift for you.  I picked it out myself.  Hope you can use it.', 'Happy Birthday', '2012-11-01 00:00:00', 'SUCCESS', '0000-00-00 00:00:00', 'Nafseer', '', '', NULL, b'000', NULL, '2012-10-31 19:44:45', '2012-10-31 19:44:45'),
(2312464, 0, 12, 26, '100002905089223', 'Sam', NULL, NULL, NULL, 'Dear Sam<br /><p>(Updated)</p>\r\n<p>As you <strong>celebrate</strong> your day, I celebrate the beautiful friendship we share! Happy Birthday, dearest friend!</p> <br />\n	              Love,<br />Sirin', NULL, 'Happy Birthday', NULL, 'PENDING', '0000-00-00 00:00:00', 'Sam', '', '', NULL, b'000', NULL, '2012-10-31 20:05:13', '2012-10-31 20:05:13'),
(2312465, 0, 12, 26, '100000220065163', 'Muhammad', '', 'sirin_ibin@yahoo.co.in', NULL, 'Dear Muhammad<br /><p>(Updated)</p>\r\n<p>As you <strong>celebrate</strong> your day, I celebrate the beautiful friendship we share! Happy Birthday, dearest friend!</p> <br />\n	              Love,<br />Sirin', 'Hey Muhammad, Surprise! I''ve left a gift for you.  I picked it out myself.  Hope you can use it.', 'Happy Birthday', '2012-10-04 00:00:00', 'SUCCESS', '0000-00-00 00:00:00', 'Muhammad', '', '', NULL, b'000', NULL, '2012-10-31 20:07:16', '2012-10-31 20:07:16'),
(2312466, 0, 10, 26, '640051761', 'Raymond', '', 'sirin_ibin@yahoo.co.in', NULL, 'Dear Raymond<br /><p>I''m sending a gift to charity for you. We''re both helping to make the world a little better and spread some happiness.</p>\r\n<p>Best,</p> <br />\n	              Love,<br />Sirin', 'Hey Raymond, Surprise! I''ve left a gift for you.  I picked it out myself.  Hope you can use it.', 'Gift To Charity', '1970-01-01 00:00:00', 'PENDING', '0000-00-00 00:00:00', 'Raymond', '', '', NULL, b'000', NULL, '2012-10-31 20:44:30', '2012-10-31 20:44:30'),
(2312467, 0, 12, 26, '100000220065163', 'Muhammad', NULL, NULL, NULL, 'Dear Muhammad<br /><p>(Updated)</p>\r\n<p>As you <strong>celebrate</strong> your day, I celebrate the beautiful friendship we share! Happy Birthday, dearest friend!</p> <br />\n	              Love,<br />Sirin', NULL, 'Happy Birthday', NULL, 'PENDING', '0000-00-00 00:00:00', 'Muhammad', '', '', NULL, b'000', NULL, '2012-10-31 20:46:12', '2012-10-31 20:46:12'),
(2312468, 0, 12, 26, '100002905089223', 'Sam', NULL, NULL, NULL, 'Dear Sam<br /><p>(Updated)</p>\r\n<p>As you <strong>celebrate</strong> your day, I celebrate the beautiful friendship we share! Happy Birthday, dearest friend!</p> <br />\n	              Love,<br />Sirin', NULL, 'Happy Birthday', NULL, 'PENDING', '0000-00-00 00:00:00', 'Sam', '', '', NULL, b'000', NULL, '2012-10-31 20:57:11', '2012-10-31 20:57:11'),
(2312469, 0, 4, 26, '825732229', 'Vishnu', '', 'sirin_ibin@yahoo.co.in', NULL, 'Dear Vishnu<br /><p>(Updated)</p>\r\n<p>As you <strong>celebrate</strong> your day, I celebrate the beautiful friendship we share! Happy Birthday, dearest friend!</p> <br />\n	              Love,<br />Sirin', 'Hey Vishnu, Surprise! I''ve left a gift for you.  I picked it out myself.  Hope you can use it.', 'Happy Birthday', '1970-01-01 00:00:00', 'SUCCESS', '0000-00-00 00:00:00', 'Vishnu', '', '', '825732229_391841380886186', b'111', NULL, '2012-11-01 11:25:54', '2012-11-01 11:25:54'),
(2312470, 0, 12, 26, '100001404031645', 'Alishba', NULL, NULL, NULL, 'Dear Alishba<br /><p>(Updated)</p>\r\n<p>As you <strong>celebrate</strong> your day, I celebrate the beautiful friendship we share! Happy Birthday, dearest friend!</p> <br />\n	              Love,<br />Sirin', NULL, 'Happy Birthday', NULL, 'PENDING', '0000-00-00 00:00:00', 'Alishba', '', '', NULL, b'000', NULL, '2012-11-01 11:32:46', '2012-11-01 11:32:46');

-- --------------------------------------------------------

--
-- Table structure for table `lag_vouchers`
--

CREATE TABLE IF NOT EXISTS `lag_vouchers` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `voucher_code` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_product` int(64) NOT NULL,
  `value` float NOT NULL,
  `validity` datetime NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT 'status code(1=>active,2=>sold,3=>redeemed,4=>inactive)',
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `id_product` (`id_product`),
  KEY `status` (`status`),
  KEY `voucher_code` (`voucher_code`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=1629 ;

--
-- Dumping data for table `lag_vouchers`
--

INSERT INTO `lag_vouchers` (`id`, `voucher_code`, `id_product`, `value`, `validity`, `status`, `timestamp`) VALUES
(1, 'SCS2FB7bcrzpt', 1, 200, '2013-01-13 00:00:00', 2, '2012-10-16 19:48:07'),
(2, 'SCS2FBhJ2tznd', 1, 200, '2013-01-13 00:00:00', 2, '2012-10-17 16:11:45'),
(3, 'SCS2FBxJKNcz8', 1, 200, '2013-01-13 00:00:00', 2, '2012-10-21 07:57:19'),
(4, 'SCS2FBkLRF7TC', 1, 200, '2013-01-13 00:00:00', 2, '2012-10-21 08:10:16'),
(5, 'SCS2FBYnrPV4T', 1, 200, '2013-01-13 00:00:00', 2, '2012-10-23 15:30:25'),
(6, 'SCS2FBNwqp3Jn', 1, 200, '2013-01-13 00:00:00', 2, '2012-10-23 17:22:19'),
(7, 'SCS2FBhprcCbJ', 1, 200, '2013-01-13 00:00:00', 2, '2012-10-24 07:07:08'),
(8, 'SCS2FBQrzXPkv', 1, 200, '2013-01-13 00:00:00', 2, '2012-10-27 08:20:18'),
(9, 'SCS2FBk4cmLjH', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(10, 'SCS2FBdM2gymw', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(11, 'SCS2FBzWKLXpB', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(12, 'SCS2FB28rGDbh', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(13, 'SCS2FBY2KgM4C', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(14, 'SCS2FBpdNnXq2', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(15, 'SCS2FBQWRN6rn', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(16, 'SCS2FB6h3KznC', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(17, 'SCS2FBbnrqtpD', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(18, 'SCS2FBFX7yCJr', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(19, 'SCS2FBxwf7TNy', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(20, 'SCS2FByFfnm6X', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(21, 'SCS2FB49hTVxL', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(22, 'SCS2FBK8m3NXk', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(23, 'SCS2FBNfWC7Mn', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(24, 'SCS2FBDPCK8Qx', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(25, 'SCS2FByZTGtnc', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(26, 'SCS2FB2pdLwBC', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(27, 'SCS2FBpK8jCL3', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(28, 'SCS2FBtmJK6GR', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(29, 'SCS2FBY7pQqKT', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(30, 'SCS2FBV4ybNQ7', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(31, 'SCS2FBJw2rfqP', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(32, 'SCS2FBRfgBdNn', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(33, 'SCS2FBqrpGJkV', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(34, 'SCS2FBwN4dJRp', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(35, 'SCS2FB2f8DpRH', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(36, 'SCS2FBWpRqmJ3', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(37, 'SCS2FBvCJwyPz', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(38, 'SCS2FBqHhpdcN', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(39, 'SCS2FBmhWVyPk', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(40, 'SCS2FBc6FNBwX', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(41, 'SCS2FB49V7LTk', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(42, 'SCS2FBYCdXwtK', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(43, 'SCS2FBjvfqgdY', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(44, 'SCS2FB78WjCvH', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(45, 'SCS2FBGqnDQfM', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(46, 'SCS2FBfbn47Kk', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(47, 'SCS2FBNHnr23Z', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(48, 'SCS2FBDjMhHBN', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(49, 'SCS2FB9xtZnQ6', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(50, 'SCS2FB8j2RwzZ', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(51, 'SCS2FBTGNkJ6V', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(52, 'SCS2FBhDt2xzw', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(53, 'SCS2FBBqyvYnQ', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(54, 'SCS2FBWgp4PFq', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(55, 'SCS2FBZr7WyGv', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(56, 'SCS2FBqp6rvN4', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(57, 'SCS2FB8qXmP3N', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(58, 'SCS2FBjLfzxgm', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(59, 'SCS2FBzrMkmTL', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(60, 'SCS2FBMZjtmFR', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(61, 'SCS2FBH3qXypR', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(62, 'SCS2FBLPKwX2V', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(63, 'SCS2FBRFQZNzX', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(64, 'SCS2FBkBrjQZD', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(65, 'SCS2FBCtDcdN8', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(66, 'SCS2FBPpGBdMW', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(67, 'SCS2FBj8XbJK4', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(68, 'SCS2FBkVGyv6f', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(69, 'SCS2FBY6nQfVX', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(70, 'SCS2FBpb8N6tk', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(71, 'SCS2FB7nygFPJ', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(72, 'SCS2FB9jMFxgL', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(73, 'SCS2FBRw3GvQV', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(74, 'SCS2FBQvLW2Gr', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(75, 'SCS2FBkmpRBVF', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(76, 'SCS2FBbVYZxqf', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(77, 'SCS2FB7mDxWp8', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(78, 'SCS2FBjN4WyqZ', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(79, 'SCS2FB3cvyWb9', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(80, 'SCS2FBq4tGJkQ', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(81, 'SCS2FBPM3bdxw', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(82, 'SCS2FBdr7z6nN', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(83, 'SCS2FBdWB4Tjp', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(84, 'SCS2FBhnxbzKd', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(85, 'SCS2FBkXcm9Ff', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(86, 'SCS2FBLFPX4bv', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(87, 'SCS2FByjHM7KZ', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(88, 'SCS2FBZwdkYW8', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(89, 'SCS2FBydbBY2T', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(90, 'SCS2FB4x6rVTt', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(91, 'SCS2FBBnLwgbv', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(92, 'SCS2FBHnMwgKt', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(93, 'SCS2FBcTwXDzF', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(94, 'SCS2FBdkmVzDn', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(95, 'SCS2FBcQqDMjy', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(96, 'SCS2FBJN6gv3w', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(97, 'SCS2FBb8xR4Wr', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(98, 'SCS2FBhQbL3pq', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(99, 'SCS2FBrK3Wt2b', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(100, 'SCS2FBvr4HmMC', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(101, 'SCS2FBf9dt3Cr', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(102, 'SCS2FBf9DTpWH', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(103, 'SCS2FBygH3dzq', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(104, 'SCS2FBLZzKjHT', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(105, 'SCS2FBcT3h2Kw', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(106, 'SCS2FBT6LnVjZ', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(107, 'SCS2FBmWQXZTb', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(108, 'SCS2FBGxvtYNd', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(109, 'SCS2FBqVv2Ryg', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(110, 'SCS2FBnZ93kN4', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(111, 'SCS2FBZXTH4nc', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(112, 'SCS2FB2GqDkXJ', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(113, 'SCS2FB3qmwRQX', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(114, 'SCS2FBFKj6w9N', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(115, 'SCS2FBwfbLNrp', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(116, 'SCS2FBVrY6L8Z', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(117, 'SCS2FB79KvZ3q', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(118, 'SCS2FBBf93hFW', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(119, 'SCS2FBckRFYqZ', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(120, 'SCS2FBXLtBCdv', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(121, 'SCS2FBwzhHctP', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(122, 'SCS2FBMBtwn2X', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(123, 'SCS2FBrRTKYjP', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(124, 'SCS2FBDcnwMCy', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(125, 'SCS2FBprFQtwT', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(126, 'SCS2FBqF8fCbP', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(127, 'SCS2FBMX7hK89', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(128, 'SCS2FBdxQZ9RX', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(129, 'SCS2FBQYrcgRW', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(130, 'SCS2FByrp9nJQ', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(131, 'SCS2FBt4b2jRm', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(132, 'SCS2FBjDhQTrn', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(133, 'SCS2FBBbqwW7y', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(134, 'SCS2FB9f4qd6F', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(135, 'SCS2FBLqFt8gV', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(136, 'SCS2FBMYK7cPW', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(137, 'SCS2FBpD6Cn2w', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(138, 'SCS2FBfqy6mj2', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(139, 'SCS2FBJCYVzmf', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(140, 'SCS2FBYDc8M4B', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(141, 'SCS2FBLbXkhQN', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(142, 'SCS2FBkKrGFLC', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(143, 'SCS2FB6ZW9knL', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(144, 'SCS2FBXp2Q6HF', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(145, 'SCS2FBrK76Xzp', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(146, 'SCS2FBmFbv6J3', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(147, 'SCS2FBCJt9hkm', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(148, 'SCS2FByfVPngj', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(149, 'SCS2FBGBC8fTW', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(150, 'SCS2FBkH34Dcw', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(151, 'SCS2FBGJP7j8H', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(152, 'SCS2FBw6fHT4G', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(153, 'SCS2FBNtBmKRL', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(154, 'SCS2FBpWvg37X', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(155, 'SCS2FBBjcmhv2', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(156, 'SCS2FBpVNtWhF', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(157, 'SCS2FBRKVhYB9', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(158, 'SCS2FBxdYk96G', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(159, 'SCS2FB4pLDPMm', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(160, 'SCS2FBPLCghBV', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(161, 'SCS2FBKvbxHGy', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(162, 'SCS2FBYRwhjMm', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(163, 'SCS2FBPRTdhk3', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(164, 'SCS2FBQC7r6jx', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(165, 'SCS2FBf2yLCpV', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(166, 'SCS2FBGfDdTmh', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(167, 'SCS2FB9TRDNxt', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(168, 'SCS2FBQgjhTzP', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(169, 'SCS2FB3T7FVjh', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(170, 'SCS2FBP8R9pDg', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(171, 'SCS2FBkpfn6Cv', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(172, 'SCS2FBMkNjW9Y', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(173, 'SCS2FBTbDxvK4', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(174, 'SCS2FBN4MnFHR', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(175, 'SCS2FB4ZFRzXY', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(176, 'SCS2FBkHR4PqZ', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(177, 'SCS2FBYGJcgvZ', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(178, 'SCS2FBHpBMzZT', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(179, 'SCS2FBqPTw36v', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(180, 'SCS2FBLZYJKb7', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(181, 'SCS2FBMdc692Q', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(182, 'SCS2FByWnYhZf', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(183, 'SCS2FBNn6qVF2', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(184, 'SCS2FBdv4pXGP', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(185, 'SCS2FBqzTm2kb', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(186, 'SCS2FBbjCVT8W', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(187, 'SCS2FBqC4kDhf', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(188, 'SCS2FBvThb4Pt', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(189, 'SCS2FBmgWhMrJ', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(190, 'SCS2FBFbVwNht', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(191, 'SCS2FBF6cTD8f', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(192, 'SCS2FBhd4ZzGB', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(193, 'SCS2FBkRrZxFG', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(194, 'SCS2FBgQFm3R7', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(195, 'SCS2FB9FDQxPL', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(196, 'SCS2FBfLDz7Cd', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(197, 'SCS2FB6ZqXdKk', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(198, 'SCS2FBdTKrFYR', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(199, 'SCS2FBZGCWmXw', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(200, 'SCS2FBKkr3T72', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(201, 'SCS2FB9WMDKTZ', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(202, 'SCS2FBnzRxv2C', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(203, 'SCS2FBdjncxFZ', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(204, 'SCS2FBVpRbXLc', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(205, 'SCS2FBGC6PLRm', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(206, 'SCS2FB8LgJRqp', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(207, 'SCS2FBjxwyMFv', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(208, 'SCS2FBLmqv7Xn', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(209, 'SCS2FBXpRGH8F', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(210, 'SCS2FBmByjzWK', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(211, 'SCS2FB9hyHVvn', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(212, 'SCS2FBcQkqBYR', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(213, 'SCS2FBZzBMJ3n', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(214, 'SCS2FBR7yXKkT', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(215, 'SCS2FBXMrFz8k', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(216, 'SCS2FBQN47TJn', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(217, 'SCS2FB4Lzwdf8', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(218, 'SCS2FBbvNFDcr', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(219, 'SCS2FBdBKLQhx', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(220, 'SCS2FBzrQBDt6', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(221, 'SCS2FBydcBG2D', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(222, 'SCS2FBfYDmWg6', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(223, 'SCS2FBPvK7fNF', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(224, 'SCS2FBgG2Chw4', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(225, 'SCS2FBTqfVzvB', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(226, 'SCS2FBjDJfbRx', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(227, 'SCS2FBYdjPBfZ', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(228, 'SCS2FB4ymMHX2', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(229, 'SCS2FBFm4ryQd', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(230, 'SCS2FBmM83jhq', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(231, 'SCS2FBk4vGVcM', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(232, 'SCS2FBdpBwxfX', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(233, 'SCS2FBDyzL3hK', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(234, 'SCS2FB8CQNm9n', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(235, 'SCS2FBBHVnDKQ', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(236, 'SCS2FBF39J4C2', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(237, 'SCS2FBZK3jMrR', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(238, 'SCS2FBBNwhZRz', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(239, 'SCS2FBYCNcQVF', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(240, 'SCS2FBHJg4GVx', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(241, 'SCS2FB8jG7K3Q', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(242, 'SCS2FBM3XpFYj', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(243, 'SCS2FBgW8h9Y6', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(244, 'SCS2FB7YmFjRp', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(245, 'SCS2FBDYdhKWC', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(246, 'SCS2FB3xjkc8d', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(247, 'SCS2FBT6YqgWK', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(248, 'SCS2FBTKFp3Xt', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(249, 'SCS2FB3x8cDk6', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(250, 'SCS2FBQH7LJyV', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(251, 'SCS2FBZTD8Nyn', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(252, 'SCS2FBkZJjKNC', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(253, 'SCS2FBGWRyQLm', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(254, 'SCS2FBXjmxVdB', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(255, 'SCS2FBqXTCyK2', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(256, 'SCS2FB4YJDrXN', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(257, 'SCS2FBpqwW7b8', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(258, 'SCS2FBTjXkD7q', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(259, 'SCS2FBgYzkf6P', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(260, 'SCS2FBHDKgfjd', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(261, 'SCS2FBjKPZQhm', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(262, 'SCS2FBQjgLK9y', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(263, 'SCS2FBYTgDyFW', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(264, 'SCS2FBkwrXQCq', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(265, 'SCS2FB6YzXtKw', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(266, 'SCS2FBztCVw9N', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(267, 'SCS2FBXpg6JfN', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(268, 'SCS2FBYdvJyxG', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(269, 'SCS2FBpDn3dKR', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(270, 'SCS2FB4ZqhzmR', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(271, 'SCS2FB8gZ4cxW', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(272, 'SCS2FBcP2VfyQ', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(273, 'SCS2FBdvY6QHD', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(274, 'SCS2FBRGLMhHN', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(275, 'SCS2FBHFLpfct', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(276, 'SCS2FBwb3vR27', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(277, 'SCS2FBYzP7MC4', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(278, 'SCS2FBQdYvMZk', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(279, 'SCS2FB2g4hFqc', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(280, 'SCS2FBRg7b3TJ', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(281, 'SCS2FBYRdNmqJ', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(282, 'SCS2FB7z34rMB', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(283, 'SCS2FBP7wkLMR', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(284, 'SCS2FBnKt2LX7', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(285, 'SCS2FBW9jBbg6', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(286, 'SCS2FB8B2FytT', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(287, 'SCS2FBhvgyNbD', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(288, 'SCS2FBHNGgB4f', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(289, 'SCS2FBkQ38Xdz', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(290, 'SCS2FBPJM2hCK', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(291, 'SCS2FBmCKBNzf', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(292, 'SCS2FBxzHB6Nw', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(293, 'SCS2FBWtTrL4m', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(294, 'SCS2FBF6c4bW3', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(295, 'SCS2FBX4Tmcyb', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(296, 'SCS2FBgTNzG3W', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(297, 'SCS2FBVC6WJNP', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(298, 'SCS2FBv4w6Pgd', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(299, 'SCS2FBk8QB6Tp', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(300, 'SCS2FBnM6p9cg', 1, 200, '2013-01-13 00:00:00', 1, '2012-10-13 10:09:37'),
(301, 'HKVECZPK1500', 2, 1500, '2012-12-31 00:00:00', 1, '2012-10-13 10:43:04'),
(302, 'HK27261H1500', 2, 1500, '2012-12-31 00:00:00', 1, '2012-10-13 10:43:04'),
(303, 'HKNC2NQK1500', 2, 1500, '2012-12-31 00:00:00', 1, '2012-10-13 10:43:04'),
(304, 'HKF8523W1500', 2, 1500, '2012-12-31 00:00:00', 1, '2012-10-13 10:43:04'),
(305, 'HK5PL9HV1500', 2, 1500, '2012-12-31 00:00:00', 1, '2012-10-13 10:43:04'),
(306, 'SCS2PNvtZWXQ', 3, 1500, '2013-01-11 00:00:00', 1, '2012-10-13 11:00:08'),
(307, 'SCS2PYNDWMb3', 3, 1500, '2013-01-11 00:00:00', 1, '2012-10-13 11:00:08'),
(308, 'SCS2PpWTMFGH', 3, 1500, '2013-01-11 00:00:00', 1, '2012-10-13 11:00:08'),
(309, 'SCS2P3h9jg2b', 3, 1500, '2013-01-11 00:00:00', 1, '2012-10-13 11:00:08'),
(310, 'SCS2PV6qfGmv', 3, 1500, '2013-01-11 00:00:00', 1, '2012-10-13 11:00:08'),
(311, 'SCS2PDTMxKcR', 3, 1500, '2013-01-11 00:00:00', 1, '2012-10-13 11:00:08'),
(312, 'SCS2PR6YKHGM', 3, 1500, '2013-01-11 00:00:00', 1, '2012-10-13 11:00:08'),
(313, 'SCS2P8X7tpbr', 3, 1500, '2013-01-11 00:00:00', 1, '2012-10-13 11:00:08'),
(314, 'SCS2PDgp9vLG', 3, 1500, '2013-01-11 00:00:00', 1, '2012-10-13 11:00:08'),
(315, 'SCS2PrHjc8W7', 3, 1500, '2013-01-11 00:00:00', 1, '2012-10-13 11:00:08'),
(316, 'SCS2PXL7bP4W', 3, 1500, '2013-01-11 00:00:00', 1, '2012-10-13 11:00:08'),
(317, 'SCS2PTkMrYZy', 3, 1500, '2013-01-11 00:00:00', 1, '2012-10-13 11:00:08'),
(318, 'SCS2PZNJzrq4', 3, 1500, '2013-01-11 00:00:00', 1, '2012-10-13 11:00:08'),
(319, 'SCS2PnykdQgD', 3, 1500, '2013-01-11 00:00:00', 1, '2012-10-13 11:00:08'),
(320, 'SCS2PhzVfvQd', 3, 1500, '2013-01-11 00:00:00', 1, '2012-10-13 11:00:08'),
(321, 'SCS2P2NVdBMC', 3, 1500, '2013-01-11 00:00:00', 1, '2012-10-13 11:00:08'),
(322, 'SCS2P3HpMymG', 3, 1500, '2013-01-11 00:00:00', 1, '2012-10-13 11:00:08'),
(323, 'SCS2PZprMt2T', 3, 1500, '2013-01-11 00:00:00', 1, '2012-10-13 11:00:08'),
(324, 'SCS2PLb8cCHh', 3, 1500, '2013-01-11 00:00:00', 1, '2012-10-13 11:00:08'),
(325, 'SCS2Pn2phbqr', 3, 1500, '2013-01-11 00:00:00', 1, '2012-10-13 11:00:08'),
(326, 'SCS2PD7Kxh9g', 3, 1500, '2013-01-11 00:00:00', 1, '2012-10-13 11:00:08'),
(327, 'SCS2PYy63GCx', 3, 1500, '2013-01-11 00:00:00', 1, '2012-10-13 11:00:08'),
(328, 'SCS2PCdZv3GK', 3, 1500, '2013-01-11 00:00:00', 1, '2012-10-13 11:00:08'),
(329, 'SCS2Pxk7PYqK', 3, 1500, '2013-01-11 00:00:00', 1, '2012-10-13 11:00:08'),
(330, 'SCS2PFxt7RNW', 3, 1500, '2013-01-11 00:00:00', 1, '2012-10-13 11:00:08'),
(331, 'SCS2Pz6WqFnj', 3, 1500, '2013-01-11 00:00:00', 1, '2012-10-13 11:00:08'),
(332, 'SCS2PyR7LBhn', 3, 1500, '2013-01-11 00:00:00', 1, '2012-10-13 11:00:08'),
(333, 'SCS2PKYjLVtr', 3, 1500, '2013-01-11 00:00:00', 1, '2012-10-13 11:00:08'),
(334, 'SCS2Pf96Rg3P', 3, 1500, '2013-01-11 00:00:00', 1, '2012-10-13 11:00:08'),
(335, 'SCS2PYfbNKdB', 3, 1500, '2013-01-11 00:00:00', 1, '2012-10-13 11:00:08'),
(336, 'SCS2PHyYJLkK', 3, 1500, '2013-01-11 00:00:00', 1, '2012-10-13 11:00:08'),
(337, 'SCS2PvwRbqG8', 3, 1500, '2013-01-11 00:00:00', 1, '2012-10-13 11:00:08'),
(338, 'SCS2P2xGynft', 3, 1500, '2013-01-11 00:00:00', 1, '2012-10-13 11:00:08'),
(339, 'SCS2PgmdCF6Q', 3, 1500, '2013-01-11 00:00:00', 1, '2012-10-13 11:00:08'),
(340, 'SCS2Ph9JMYm6', 3, 1500, '2013-01-11 00:00:00', 1, '2012-10-13 11:00:08'),
(341, 'SCS2PcKRZ8tz', 3, 1500, '2013-01-11 00:00:00', 1, '2012-10-13 11:00:08'),
(342, 'SCS2PcwWtP7h', 3, 1500, '2013-01-11 00:00:00', 1, '2012-10-13 11:00:08'),
(343, 'SCS2PDGqbWRC', 3, 1500, '2013-01-11 00:00:00', 1, '2012-10-13 11:00:08'),
(344, 'SCS2PM2pCDbr', 3, 1500, '2013-01-11 00:00:00', 1, '2012-10-13 11:00:08'),
(345, 'SCS2PQcHFt8M', 3, 1500, '2013-01-11 00:00:00', 1, '2012-10-13 11:00:08'),
(346, 'SCS2PDcv8NMm', 3, 1500, '2013-01-11 00:00:00', 1, '2012-10-13 11:00:08'),
(347, 'SCS2PZ8hYzMv', 3, 1500, '2013-01-11 00:00:00', 1, '2012-10-13 11:00:08'),
(348, 'SCS2Prk8KLBF', 3, 1500, '2013-01-11 00:00:00', 1, '2012-10-13 11:00:08'),
(349, 'SCS2PDh2VBKb', 3, 1500, '2013-01-11 00:00:00', 1, '2012-10-13 11:00:08'),
(350, 'SCS2PXfhV7Tz', 3, 1500, '2013-01-11 00:00:00', 1, '2012-10-13 11:00:08'),
(351, 'SCS2PwT82jxF', 3, 1500, '2013-01-11 00:00:00', 1, '2012-10-13 11:00:08'),
(352, 'SCS2PfyYH89P', 3, 1500, '2013-01-11 00:00:00', 1, '2012-10-13 11:00:08'),
(353, 'SCS2Pnk67dLb', 3, 1500, '2013-01-11 00:00:00', 1, '2012-10-13 11:00:08'),
(354, 'SCS2Pj4hmVyc', 3, 1500, '2013-01-11 00:00:00', 1, '2012-10-13 11:00:08'),
(355, 'SCS2PQrp8M7z', 3, 1500, '2013-01-11 00:00:00', 1, '2012-10-13 11:00:08'),
(356, 'SCS2PWrM3BwT', 3, 1500, '2013-01-11 00:00:00', 1, '2012-10-13 11:00:08'),
(357, 'SCS2PdRX9fQr', 3, 1500, '2013-01-11 00:00:00', 1, '2012-10-13 11:00:08'),
(358, 'SCS2PrVXxbQy', 3, 1500, '2013-01-11 00:00:00', 1, '2012-10-13 11:00:08'),
(359, 'SCS2Pkr7qJdV', 3, 1500, '2013-01-11 00:00:00', 1, '2012-10-13 11:00:08'),
(360, 'SCS2PxhZnfzN', 3, 1500, '2013-01-11 00:00:00', 1, '2012-10-13 11:00:08'),
(361, 'SCS2PfjtdPz6', 3, 1500, '2013-01-11 00:00:00', 1, '2012-10-13 11:00:08'),
(362, 'SCS2PhtYWxgX', 3, 1500, '2013-01-11 00:00:00', 1, '2012-10-13 11:00:08'),
(363, 'SCS2PnC2vwXN', 3, 1500, '2013-01-11 00:00:00', 1, '2012-10-13 11:00:08'),
(364, 'SCS2PYWTMFwg', 3, 1500, '2013-01-11 00:00:00', 1, '2012-10-13 11:00:08'),
(365, 'SCS2PcgVdJ2B', 3, 1500, '2013-01-11 00:00:00', 1, '2012-10-13 11:00:08'),
(366, 'SCS2PJwxvrGg', 3, 1500, '2013-01-11 00:00:00', 1, '2012-10-13 11:00:08'),
(367, 'SCS2PY7JN9MC', 3, 1500, '2013-01-11 00:00:00', 1, '2012-10-13 11:00:08'),
(368, 'SCS2PTF9YP4h', 3, 1500, '2013-01-11 00:00:00', 1, '2012-10-13 11:00:08'),
(369, 'SCS2P9RmXDWT', 3, 1500, '2013-01-11 00:00:00', 1, '2012-10-13 11:00:08'),
(370, 'SCS2PKVQzcyF', 3, 1500, '2013-01-11 00:00:00', 1, '2012-10-13 11:00:08'),
(371, 'SCS2PQVbYDwN', 3, 1500, '2013-01-11 00:00:00', 1, '2012-10-13 11:00:08'),
(372, 'SCS2PDTtgcvk', 3, 1500, '2013-01-11 00:00:00', 1, '2012-10-13 11:00:08'),
(373, 'SCS2PKBQZXqC', 3, 1500, '2013-01-11 00:00:00', 1, '2012-10-13 11:00:08'),
(374, 'SCS2PkLVXzrY', 3, 1500, '2013-01-11 00:00:00', 1, '2012-10-13 11:00:08'),
(375, 'SCS2P8ZLDtzb', 3, 1500, '2013-01-11 00:00:00', 1, '2012-10-13 11:00:08'),
(376, 'SCS2PWTB8J2k', 3, 1500, '2013-01-11 00:00:00', 1, '2012-10-13 11:00:08'),
(377, 'SCS2PjdDc3Rt', 3, 1500, '2013-01-11 00:00:00', 1, '2012-10-13 11:00:08'),
(378, 'SCS2Pd6nrczq', 3, 1500, '2013-01-11 00:00:00', 1, '2012-10-13 11:00:08'),
(379, 'SCS2P6gGnhfH', 3, 1500, '2013-01-11 00:00:00', 1, '2012-10-13 11:00:08'),
(380, 'SCS2PwJQDnxq', 3, 1500, '2013-01-11 00:00:00', 1, '2012-10-13 11:00:08'),
(381, 'SCS2PK9N76ch', 3, 1500, '2013-01-11 00:00:00', 1, '2012-10-13 11:00:08'),
(382, 'SCS2PFgZcjVd', 3, 1500, '2013-01-11 00:00:00', 1, '2012-10-13 11:00:08'),
(383, 'SCS2PR7B9WDc', 3, 1500, '2013-01-11 00:00:00', 1, '2012-10-13 11:00:08'),
(384, 'SCS2P382M4JB', 3, 1500, '2013-01-11 00:00:00', 1, '2012-10-13 11:00:08'),
(385, 'SCS2Px4q2dNf', 3, 1500, '2013-01-11 00:00:00', 1, '2012-10-13 11:00:08'),
(386, 'SCS2PM6wjPHt', 3, 1500, '2013-01-11 00:00:00', 1, '2012-10-13 11:00:08'),
(387, 'SCS2PXFbrTn3', 3, 1500, '2013-01-11 00:00:00', 1, '2012-10-13 11:00:08'),
(388, 'SCS2P8mPKj64', 3, 1500, '2013-01-11 00:00:00', 1, '2012-10-13 11:00:08'),
(389, 'SCS2PvNnrzxK', 3, 1500, '2013-01-11 00:00:00', 1, '2012-10-13 11:00:08'),
(390, 'SCS2PWR9hr3N', 3, 1500, '2013-01-11 00:00:00', 1, '2012-10-13 11:00:08'),
(391, 'SCS2PGZJnqNr', 3, 1500, '2013-01-11 00:00:00', 1, '2012-10-13 11:00:08'),
(392, 'SCS2PHNVpWRm', 3, 1500, '2013-01-11 00:00:00', 1, '2012-10-13 11:00:08'),
(393, 'SCS2PYFnD8tP', 3, 1500, '2013-01-11 00:00:00', 1, '2012-10-13 11:00:08'),
(394, 'SCS2PymqWBGk', 3, 1500, '2013-01-11 00:00:00', 1, '2012-10-13 11:00:08'),
(395, 'SCS2PryXkQ67', 3, 1500, '2013-01-11 00:00:00', 1, '2012-10-13 11:00:08'),
(396, 'SCS2PKLNMvHR', 3, 1500, '2013-01-11 00:00:00', 1, '2012-10-13 11:00:08'),
(397, 'SCS2PWm4GCQj', 3, 1500, '2013-01-11 00:00:00', 1, '2012-10-13 11:00:08'),
(398, 'SCS2PkbRMm2z', 3, 1500, '2013-01-11 00:00:00', 1, '2012-10-13 11:00:08'),
(399, 'SCS2PCWdm4Jb', 3, 1500, '2013-01-11 00:00:00', 1, '2012-10-13 11:00:08'),
(400, 'SCS2PrXn3RdZ', 3, 1500, '2013-01-11 00:00:00', 1, '2012-10-13 11:00:08'),
(401, 'SCS2P6bWDjLg', 3, 1500, '2013-01-11 00:00:00', 1, '2012-10-13 11:00:08'),
(402, 'SCS2PfDxZ2bG', 3, 1500, '2013-01-11 00:00:00', 1, '2012-10-13 11:00:08'),
(403, 'SCS2PPHLd9rm', 3, 1500, '2013-01-11 00:00:00', 1, '2012-10-13 11:00:08'),
(404, 'SCS2PpwMf834', 3, 1500, '2013-01-11 00:00:00', 1, '2012-10-13 11:00:08'),
(405, 'SCS2PC3yQT6c', 3, 1500, '2013-01-11 00:00:00', 1, '2012-10-13 11:00:08'),
(406, 'GIFT150GKB0BKT6', 4, 150, '2013-01-08 00:00:00', 2, '2012-10-21 07:20:39'),
(407, 'GIFT150GKBURXHH', 4, 150, '2013-01-08 00:00:00', 2, '2012-10-21 07:55:35'),
(408, 'GIFT150GKBUFC97', 4, 150, '2013-01-08 00:00:00', 2, '2012-10-21 08:02:07'),
(409, 'GIFT150GKB1AOPH', 4, 150, '2013-01-08 00:00:00', 1, '2012-10-13 11:11:46'),
(410, 'GIFT150GKB6JKXX', 4, 150, '2013-01-08 00:00:00', 1, '2012-10-13 11:11:46'),
(411, 'GIFT150GKBHF1D9', 4, 150, '2013-01-08 00:00:00', 1, '2012-10-13 11:11:46'),
(412, 'GIFT150GKBU0PHS', 4, 150, '2013-01-08 00:00:00', 1, '2012-10-13 11:11:46'),
(413, 'GIFT150GKBLSTG2', 4, 150, '2013-01-08 00:00:00', 1, '2012-10-13 11:11:46'),
(414, 'GIFT150GKB0WEXA', 4, 150, '2013-01-08 00:00:00', 1, '2012-10-13 11:11:46'),
(415, 'GIFT150GKB08KD9', 4, 150, '2013-01-08 00:00:00', 1, '2012-10-13 11:11:46'),
(416, 'GIFT150GKB152RT', 4, 150, '2013-01-08 00:00:00', 1, '2012-10-13 11:11:46'),
(417, 'GIFT150GKB0L2WB', 4, 150, '2013-01-08 00:00:00', 1, '2012-10-13 11:11:46'),
(418, 'GIFT150GKB1DWNK', 4, 150, '2013-01-08 00:00:00', 1, '2012-10-13 11:11:46'),
(419, 'GIFT150GKB0M14N', 4, 150, '2013-01-08 00:00:00', 1, '2012-10-13 11:11:46'),
(420, 'GIFT150GKB109EW', 4, 150, '2013-01-08 00:00:00', 1, '2012-10-13 11:11:46'),
(421, 'GIFT150GKBTT7SV', 4, 150, '2013-01-08 00:00:00', 1, '2012-10-13 11:11:46'),
(422, 'GIFT150GKB0M3NS', 4, 150, '2013-01-08 00:00:00', 1, '2012-10-13 11:11:46'),
(423, 'GIFT150GKBL4YSY', 4, 150, '2013-01-08 00:00:00', 1, '2012-10-13 11:11:46'),
(424, 'GIFT150GKB1XCFK', 4, 150, '2013-01-08 00:00:00', 1, '2012-10-13 11:11:46'),
(425, 'GIFT150GKB1EGF3', 4, 150, '2013-01-08 00:00:00', 1, '2012-10-13 11:11:46'),
(426, 'GIFT150GKB3D1RW', 4, 150, '2013-01-08 00:00:00', 1, '2012-10-13 11:11:46'),
(427, 'GIFT150GKB02QS1', 4, 150, '2013-01-08 00:00:00', 1, '2012-10-13 11:11:46'),
(428, 'GIFT150GKB0RJ5S', 4, 150, '2013-01-08 00:00:00', 1, '2012-10-13 11:11:46'),
(429, 'GIFT150GKB1PO43', 4, 150, '2013-01-08 00:00:00', 1, '2012-10-13 11:11:46'),
(430, 'GIFT150GKB0JIWK', 4, 150, '2013-01-08 00:00:00', 1, '2012-10-13 11:11:46'),
(431, 'GIFT150GKBTBJHT', 4, 150, '2013-01-08 00:00:00', 1, '2012-10-13 11:11:46'),
(432, 'GIFT150GKB1ZXCU', 4, 150, '2013-01-08 00:00:00', 1, '2012-10-13 11:11:46'),
(433, 'GIFT150GKB0TTWG', 4, 150, '2013-01-08 00:00:00', 1, '2012-10-13 11:11:46'),
(434, 'GIFT150GKB1XVVX', 4, 150, '2013-01-08 00:00:00', 1, '2012-10-13 11:11:46'),
(435, 'GIFT150GKB1JJ7O', 4, 150, '2013-01-08 00:00:00', 1, '2012-10-13 11:11:46'),
(436, 'GIFT150GKB1TSK1', 4, 150, '2013-01-08 00:00:00', 1, '2012-10-13 11:11:46'),
(437, 'GIFT150GKB1MPXV', 4, 150, '2013-01-08 00:00:00', 1, '2012-10-13 11:11:46'),
(438, 'GIFT150GKB0MU0B', 4, 150, '2013-01-08 00:00:00', 1, '2012-10-13 11:11:46'),
(439, 'GIFT150GKB136BL', 4, 150, '2013-01-08 00:00:00', 1, '2012-10-13 11:11:46'),
(440, 'GIFT150GKB1A7OI', 4, 150, '2013-01-08 00:00:00', 1, '2012-10-13 11:11:46'),
(441, 'GIFT150GKBHDMCZ', 4, 150, '2013-01-08 00:00:00', 1, '2012-10-13 11:11:46'),
(442, 'GIFT150GKB5XZ2A', 4, 150, '2013-01-08 00:00:00', 1, '2012-10-13 11:11:46'),
(443, 'GIFT150GKB0PYKN', 4, 150, '2013-01-08 00:00:00', 1, '2012-10-13 11:11:46'),
(444, 'GIFT150GKB2SU1H', 4, 150, '2013-01-08 00:00:00', 1, '2012-10-13 11:11:46'),
(445, 'GIFT150GKB0T2C2', 4, 150, '2013-01-08 00:00:00', 1, '2012-10-13 11:11:46'),
(446, 'GIFT150GKB6LV2W', 4, 150, '2013-01-08 00:00:00', 1, '2012-10-13 11:11:46'),
(447, 'GIFT150GKBCXBWZ', 4, 150, '2013-01-08 00:00:00', 1, '2012-10-13 11:11:46'),
(448, 'GIFT150GKB1HTT9', 4, 150, '2013-01-08 00:00:00', 1, '2012-10-13 11:11:46'),
(449, 'GIFT150GKB037WX', 4, 150, '2013-01-08 00:00:00', 1, '2012-10-13 11:11:46'),
(450, 'GIFT150GKBGAVUV', 4, 150, '2013-01-08 00:00:00', 1, '2012-10-13 11:11:46'),
(451, 'GIFT150GKB1TFZU', 4, 150, '2013-01-08 00:00:00', 1, '2012-10-13 11:11:46'),
(452, 'GIFT150GKBAXKUW', 4, 150, '2013-01-08 00:00:00', 1, '2012-10-13 11:11:46'),
(453, 'GIFT150GKB0VHFG', 4, 150, '2013-01-08 00:00:00', 1, '2012-10-13 11:11:46'),
(454, 'GIFT150GKBSRYQH', 4, 150, '2013-01-08 00:00:00', 1, '2012-10-13 11:11:46'),
(455, 'GIFT150GKBYZP8R', 4, 150, '2013-01-08 00:00:00', 1, '2012-10-13 11:11:46'),
(456, 'GIFT150GKB0SYY6', 4, 150, '2013-01-08 00:00:00', 1, '2012-10-13 11:11:46'),
(457, 'GIFT150GKB0JZUC', 4, 150, '2013-01-08 00:00:00', 1, '2012-10-13 11:11:46'),
(458, 'GIFT150GKB1NBDC', 4, 150, '2013-01-08 00:00:00', 1, '2012-10-13 11:11:46'),
(459, 'GIFT150GKBUMX01', 4, 150, '2013-01-08 00:00:00', 1, '2012-10-13 11:11:46'),
(460, 'GIFT150GKBYJMEY', 4, 150, '2013-01-08 00:00:00', 1, '2012-10-13 11:11:46'),
(461, 'GIFT150GKBPR1PD', 4, 150, '2013-01-08 00:00:00', 1, '2012-10-13 11:11:46'),
(462, 'GIFT150GKBMRQXM', 4, 150, '2013-01-08 00:00:00', 1, '2012-10-13 11:11:46'),
(463, 'GIFT150GKBD3ME2', 4, 150, '2013-01-08 00:00:00', 1, '2012-10-13 11:11:46'),
(464, 'GIFT150GKBPJOFJ', 4, 150, '2013-01-08 00:00:00', 1, '2012-10-13 11:11:46'),
(465, 'GIFT150GKB1ODMP', 4, 150, '2013-01-08 00:00:00', 1, '2012-10-13 11:11:46'),
(466, 'GIFT150GKB73ZE5', 4, 150, '2013-01-08 00:00:00', 1, '2012-10-13 11:11:46'),
(467, 'GIFT150GKBDM0UR', 4, 150, '2013-01-08 00:00:00', 1, '2012-10-13 11:11:46'),
(468, 'GIFT150GKB1TB0U', 4, 150, '2013-01-08 00:00:00', 1, '2012-10-13 11:11:46'),
(469, 'GIFT150GKBPW3G2', 4, 150, '2013-01-08 00:00:00', 1, '2012-10-13 11:11:46'),
(470, 'GIFT150GKB1ADVE', 4, 150, '2013-01-08 00:00:00', 1, '2012-10-13 11:11:46'),
(471, 'GIFT150GKBDQLUL', 4, 150, '2013-01-08 00:00:00', 1, '2012-10-13 11:11:46'),
(472, 'GIFT150GKB2J4EU', 4, 150, '2013-01-08 00:00:00', 1, '2012-10-13 11:11:46'),
(473, 'GIFT150GKB1IZLL', 4, 150, '2013-01-08 00:00:00', 1, '2012-10-13 11:11:46'),
(474, 'GIFT150GKB1XERZ', 4, 150, '2013-01-08 00:00:00', 1, '2012-10-13 11:11:46'),
(475, 'GIFT150GKB1BQGB', 4, 150, '2013-01-08 00:00:00', 1, '2012-10-13 11:11:46'),
(476, 'GIFT150GKBRGFNZ', 4, 150, '2013-01-08 00:00:00', 1, '2012-10-13 11:11:46'),
(477, 'GIFT150GKB1GNOM', 4, 150, '2013-01-08 00:00:00', 1, '2012-10-13 11:11:46'),
(478, 'GIFT150GKBPM9FS', 4, 150, '2013-01-08 00:00:00', 1, '2012-10-13 11:11:46'),
(479, 'GIFT150GKBI8MKU', 4, 150, '2013-01-08 00:00:00', 1, '2012-10-13 11:11:46'),
(480, 'GIFT150GKB13JYO', 4, 150, '2013-01-08 00:00:00', 1, '2012-10-13 11:11:46'),
(481, 'GIFT150GKB12G4O', 4, 150, '2013-01-08 00:00:00', 1, '2012-10-13 11:11:46'),
(482, 'GIFT150GKBBSWP4', 4, 150, '2013-01-08 00:00:00', 1, '2012-10-13 11:11:46'),
(483, 'GIFT150GKB0N9MR', 4, 150, '2013-01-08 00:00:00', 1, '2012-10-13 11:11:46'),
(484, 'GIFT150GKBPGFI4', 4, 150, '2013-01-08 00:00:00', 1, '2012-10-13 11:11:46'),
(485, 'GIFT150GKBTHACF', 4, 150, '2013-01-08 00:00:00', 1, '2012-10-13 11:11:46'),
(486, 'GIFT150GKB1OEXE', 4, 150, '2013-01-08 00:00:00', 1, '2012-10-13 11:11:46'),
(487, 'GIFT150GKB1IMWK', 4, 150, '2013-01-08 00:00:00', 1, '2012-10-13 11:11:46'),
(488, 'GIFT150GKBUTD4V', 4, 150, '2013-01-08 00:00:00', 1, '2012-10-13 11:11:46'),
(489, 'GIFT150GKB1OVLP', 4, 150, '2013-01-08 00:00:00', 1, '2012-10-13 11:11:46'),
(490, 'GIFT150GKBOM0BA', 4, 150, '2013-01-08 00:00:00', 1, '2012-10-13 11:11:46'),
(491, 'GIFT150GKB1GJPG', 4, 150, '2013-01-08 00:00:00', 1, '2012-10-13 11:11:46'),
(492, 'GIFT150GKBOMCNR', 4, 150, '2013-01-08 00:00:00', 1, '2012-10-13 11:11:46'),
(493, 'GIFT150GKBOTOUJ', 4, 150, '2013-01-08 00:00:00', 1, '2012-10-13 11:11:46'),
(494, 'GIFT150GKBA2Q05', 4, 150, '2013-01-08 00:00:00', 1, '2012-10-13 11:11:46'),
(495, 'GIFT150GKB0EVYO', 4, 150, '2013-01-08 00:00:00', 1, '2012-10-13 11:11:46'),
(496, 'GIFT150GKB0OEUM', 4, 150, '2013-01-08 00:00:00', 1, '2012-10-13 11:11:46'),
(497, 'GIFT150GKBFNBER', 4, 150, '2013-01-08 00:00:00', 1, '2012-10-13 11:11:46'),
(498, 'GIFT150GKB1FVSS', 4, 150, '2013-01-08 00:00:00', 1, '2012-10-13 11:11:46'),
(499, 'GIFT150GKBH29JG', 4, 150, '2013-01-08 00:00:00', 1, '2012-10-13 11:11:46'),
(500, 'GIFT150GKB13GHX', 4, 150, '2013-01-08 00:00:00', 1, '2012-10-13 11:11:46'),
(501, 'GIFT150GKB0PXZ0', 4, 150, '2013-01-08 00:00:00', 1, '2012-10-13 11:11:46'),
(502, 'GIFT150GKBB15IH', 4, 150, '2013-01-08 00:00:00', 1, '2012-10-13 11:11:46'),
(503, 'GIFT150GKB2NDUI', 4, 150, '2013-01-08 00:00:00', 1, '2012-10-13 11:11:46'),
(504, 'GIFT150GKBGZQAU', 4, 150, '2013-01-08 00:00:00', 1, '2012-10-13 11:11:46'),
(505, 'GIFT150GKBDXUAO', 4, 150, '2013-01-08 00:00:00', 1, '2012-10-13 11:11:46'),
(506, 'GIFT150GKB0MYB9', 4, 150, '2013-01-08 00:00:00', 1, '2012-10-13 11:11:46'),
(507, 'GIFT150GKB1U3OB', 4, 150, '2013-01-08 00:00:00', 1, '2012-10-13 11:11:46'),
(508, 'GIFT150GKB0XFI4', 4, 150, '2013-01-08 00:00:00', 1, '2012-10-13 11:11:46'),
(509, 'GIFT150GKB7HJBC', 4, 150, '2013-01-08 00:00:00', 1, '2012-10-13 11:11:46'),
(510, 'GIFT150GKB0IHKN', 4, 150, '2013-01-08 00:00:00', 1, '2012-10-13 11:11:46'),
(511, 'GIFT150GKB1TLUU', 4, 150, '2013-01-08 00:00:00', 1, '2012-10-13 11:11:46'),
(512, 'GIFT150GKBQVZXL', 4, 150, '2013-01-08 00:00:00', 1, '2012-10-13 11:11:46'),
(513, 'GIFT150GKBJL6S7', 4, 150, '2013-01-08 00:00:00', 1, '2012-10-13 11:11:46'),
(514, 'GIFT150GKB1HLTD', 4, 150, '2013-01-08 00:00:00', 1, '2012-10-13 11:11:46'),
(515, 'GIFT150GKBTDORO', 4, 150, '2013-01-08 00:00:00', 1, '2012-10-13 11:11:46'),
(516, 'GIFT150GKB1ZOXR', 4, 150, '2013-01-08 00:00:00', 1, '2012-10-13 11:11:46'),
(517, 'GIFT150GKB1T4EO', 4, 150, '2013-01-08 00:00:00', 1, '2012-10-13 11:11:46'),
(518, 'GIFT150GKB345O7', 4, 150, '2013-01-08 00:00:00', 1, '2012-10-13 11:11:46'),
(519, 'GIFT150GKBS9K8Q', 4, 150, '2013-01-08 00:00:00', 1, '2012-10-13 11:11:46'),
(520, 'GIFT150GKBYIKJ8', 4, 150, '2013-01-08 00:00:00', 1, '2012-10-13 11:11:46'),
(521, 'GIFT150GKBGSD1J', 4, 150, '2013-01-08 00:00:00', 1, '2012-10-13 11:11:46'),
(522, 'GIFT150GKBSNQG5', 4, 150, '2013-01-08 00:00:00', 1, '2012-10-13 11:11:46'),
(523, 'GIFT150GKBAR9WF', 4, 150, '2013-01-08 00:00:00', 1, '2012-10-13 11:11:46'),
(524, 'GIFT150GKBEJGDA', 4, 150, '2013-01-08 00:00:00', 1, '2012-10-13 11:11:46'),
(525, 'GIFT150GKB0GDRN', 4, 150, '2013-01-08 00:00:00', 1, '2012-10-13 11:11:46'),
(526, 'GIFT150GKB0OJQM', 4, 150, '2013-01-08 00:00:00', 1, '2012-10-13 11:11:46'),
(527, 'GIFT150GKB1WZLV', 4, 150, '2013-01-08 00:00:00', 1, '2012-10-13 11:11:46'),
(528, 'GIFT150GKB0ZTGX', 4, 150, '2013-01-08 00:00:00', 1, '2012-10-13 11:11:46'),
(529, 'GIFT150GKB1W20U', 4, 150, '2013-01-08 00:00:00', 1, '2012-10-13 11:11:46'),
(530, 'GIFT150GKB1IMUR', 4, 150, '2013-01-08 00:00:00', 1, '2012-10-13 11:11:46'),
(531, 'GIFT150GKB0KHRY', 4, 150, '2013-01-08 00:00:00', 1, '2012-10-13 11:11:46'),
(532, 'GIFT150GKB1K4NM', 4, 150, '2013-01-08 00:00:00', 1, '2012-10-13 11:11:46'),
(533, 'GIFT150GKB0MI8Y', 4, 150, '2013-01-08 00:00:00', 1, '2012-10-13 11:11:46'),
(534, 'GIFT150GKBZDUAU', 4, 150, '2013-01-08 00:00:00', 1, '2012-10-13 11:11:46'),
(535, 'GIFT150GKBPFJVJ', 4, 150, '2013-01-08 00:00:00', 1, '2012-10-13 11:11:46'),
(536, 'GIFT150GKBOQGJH', 4, 150, '2013-01-08 00:00:00', 1, '2012-10-13 11:11:46'),
(537, 'GIFT150GKB0TLNY', 4, 150, '2013-01-08 00:00:00', 1, '2012-10-13 11:11:46'),
(538, 'GIFT150GKB0T8NP', 4, 150, '2013-01-08 00:00:00', 1, '2012-10-13 11:11:46'),
(539, 'GIFT150GKB0ZKM4', 4, 150, '2013-01-08 00:00:00', 1, '2012-10-13 11:11:46'),
(540, 'GIFT150GKB6NH07', 4, 150, '2013-01-08 00:00:00', 1, '2012-10-13 11:11:46'),
(541, 'GIFT150GKBPGBUA', 4, 150, '2013-01-08 00:00:00', 1, '2012-10-13 11:11:46'),
(542, 'GIFT150GKBXZWKH', 4, 150, '2013-01-08 00:00:00', 1, '2012-10-13 11:11:46'),
(543, 'GIFT150GKB1ZOVF', 4, 150, '2013-01-08 00:00:00', 1, '2012-10-13 11:11:46'),
(544, 'GIFT150GKB1PH2O', 4, 150, '2013-01-08 00:00:00', 1, '2012-10-13 11:11:46'),
(545, 'GIFT150GKB1603M', 4, 150, '2013-01-08 00:00:00', 1, '2012-10-13 11:11:46'),
(546, 'GIFT150GKB0GUFD', 4, 150, '2013-01-08 00:00:00', 1, '2012-10-13 11:11:46'),
(547, 'GIFT150GKBTEFSD', 4, 150, '2013-01-08 00:00:00', 1, '2012-10-13 11:11:46'),
(548, 'GIFT150GKBS3LYY', 4, 150, '2013-01-08 00:00:00', 1, '2012-10-13 11:11:46'),
(549, 'GIFT150GKBWOC3G', 4, 150, '2013-01-08 00:00:00', 1, '2012-10-13 11:11:46'),
(550, 'GIFT150GKBFRWT9', 4, 150, '2013-01-08 00:00:00', 1, '2012-10-13 11:11:46'),
(551, 'GIFT150GKBJQXKQ', 4, 150, '2013-01-08 00:00:00', 1, '2012-10-13 11:11:46'),
(552, 'GIFT150GKB1V4YP', 4, 150, '2013-01-08 00:00:00', 1, '2012-10-13 11:11:46'),
(553, 'GIFT150GKBOP7SL', 4, 150, '2013-01-08 00:00:00', 1, '2012-10-13 11:11:46'),
(554, 'GIFT150GKB0G8U1', 4, 150, '2013-01-08 00:00:00', 1, '2012-10-13 11:11:46'),
(555, 'GIFT150GKB1PKZ2', 4, 150, '2013-01-08 00:00:00', 1, '2012-10-13 11:11:46'),
(556, 'GIFT150GKBYLVOC', 4, 150, '2013-01-08 00:00:00', 1, '2012-10-13 11:11:46'),
(557, 'GIFT150GKBMQQFW', 4, 150, '2013-01-08 00:00:00', 1, '2012-10-13 11:11:46'),
(558, 'GIFT150GKBRD71I', 4, 150, '2013-01-08 00:00:00', 1, '2012-10-13 11:11:46'),
(559, 'GIFT150GKB0S9YE', 4, 150, '2013-01-08 00:00:00', 1, '2012-10-13 11:11:46'),
(560, 'GIFT150GKB0FLYO', 4, 150, '2013-01-08 00:00:00', 1, '2012-10-13 11:11:46'),
(561, 'GIFT150GKB1YGD3', 4, 150, '2013-01-08 00:00:00', 1, '2012-10-13 11:11:46'),
(562, 'GIFT150GKB13GP3', 4, 150, '2013-01-08 00:00:00', 1, '2012-10-13 11:11:46'),
(563, 'GIFT150GKBWNM3J', 4, 150, '2013-01-08 00:00:00', 1, '2012-10-13 11:11:46'),
(564, 'GIFT150GKB7CHFJ', 4, 150, '2013-01-08 00:00:00', 1, '2012-10-13 11:11:46'),
(565, 'GIFT150GKB2BQMA', 4, 150, '2013-01-08 00:00:00', 1, '2012-10-13 11:11:46'),
(566, 'GIFT150GKBW4DQO', 4, 150, '2013-01-08 00:00:00', 1, '2012-10-13 11:11:46'),
(567, 'GIFT150GKB1OXZQ', 4, 150, '2013-01-08 00:00:00', 1, '2012-10-13 11:11:46'),
(568, 'GIFT150GKBTZI73', 4, 150, '2013-01-08 00:00:00', 1, '2012-10-13 11:11:46'),
(569, 'GIFT150GKB16MIF', 4, 150, '2013-01-08 00:00:00', 1, '2012-10-13 11:11:46'),
(570, 'GIFT150GKB1RXZM', 4, 150, '2013-01-08 00:00:00', 1, '2012-10-13 11:11:46'),
(571, 'GIFT150GKBAV1VG', 4, 150, '2013-01-08 00:00:00', 1, '2012-10-13 11:11:46'),
(572, 'GIFT150GKBQTBHS', 4, 150, '2013-01-08 00:00:00', 1, '2012-10-13 11:11:46'),
(573, 'GIFT150GKB1CLPO', 4, 150, '2013-01-08 00:00:00', 1, '2012-10-13 11:11:46'),
(574, 'GIFT150GKB1GFRC', 4, 150, '2013-01-08 00:00:00', 1, '2012-10-13 11:11:46'),
(575, 'GIFT150GKB00CIO', 4, 150, '2013-01-08 00:00:00', 1, '2012-10-13 11:11:46'),
(576, 'GIFT150GKBGRW30', 4, 150, '2013-01-08 00:00:00', 1, '2012-10-13 11:11:46'),
(577, 'GIFT150GKB1LQRO', 4, 150, '2013-01-08 00:00:00', 1, '2012-10-13 11:11:46'),
(578, 'GIFT150GKB0ZPE2', 4, 150, '2013-01-08 00:00:00', 1, '2012-10-13 11:11:46'),
(579, 'GIFT150GKB143W9', 4, 150, '2013-01-08 00:00:00', 1, '2012-10-13 11:11:46'),
(580, 'GIFT150GKBGLCDV', 4, 150, '2013-01-08 00:00:00', 1, '2012-10-13 11:11:46'),
(581, 'GIFT150GKB0P0XE', 4, 150, '2013-01-08 00:00:00', 1, '2012-10-13 11:11:46'),
(582, 'GIFT150GKB3BVBR', 4, 150, '2013-01-08 00:00:00', 1, '2012-10-13 11:11:46'),
(583, 'GIFT150GKB24YVO', 4, 150, '2013-01-08 00:00:00', 1, '2012-10-13 11:11:46'),
(584, 'GIFT150GKBP2DCS', 4, 150, '2013-01-08 00:00:00', 1, '2012-10-13 11:11:46'),
(585, 'GIFT150GKB1KSLX', 4, 150, '2013-01-08 00:00:00', 1, '2012-10-13 11:11:46'),
(586, 'GIFT150GKB1LDOM', 4, 150, '2013-01-08 00:00:00', 1, '2012-10-13 11:11:46'),
(587, 'GIFT150GKB9YZUG', 4, 150, '2013-01-08 00:00:00', 1, '2012-10-13 11:11:46'),
(588, 'GIFT150GKBBROAC', 4, 150, '2013-01-08 00:00:00', 1, '2012-10-13 11:11:46'),
(589, 'GIFT150GKBAOOOA', 4, 150, '2013-01-08 00:00:00', 1, '2012-10-13 11:11:46'),
(590, 'GIFT150GKB1ZQ0P', 4, 150, '2013-01-08 00:00:00', 1, '2012-10-13 11:11:46'),
(591, 'GIFT150GKB17P1J', 4, 150, '2013-01-08 00:00:00', 1, '2012-10-13 11:11:46'),
(592, 'GIFT150GKB1OW64', 4, 150, '2013-01-08 00:00:00', 1, '2012-10-13 11:11:46'),
(593, 'GIFT150GKBSMVK3', 4, 150, '2013-01-08 00:00:00', 1, '2012-10-13 11:11:46'),
(594, 'GIFT150GKBHWDQ5', 4, 150, '2013-01-08 00:00:00', 1, '2012-10-13 11:11:46'),
(595, 'GIFT150GKB1UPAD', 4, 150, '2013-01-08 00:00:00', 1, '2012-10-13 11:11:46'),
(596, 'GIFT150GKB0IZZ7', 4, 150, '2013-01-08 00:00:00', 1, '2012-10-13 11:11:46'),
(597, 'GIFT150GKB0YXR7', 4, 150, '2013-01-08 00:00:00', 1, '2012-10-13 11:11:46'),
(598, 'GIFT150GKBL8G46', 4, 150, '2013-01-08 00:00:00', 1, '2012-10-13 11:11:46'),
(599, 'GIFT150GKBMRA7Q', 4, 150, '2013-01-08 00:00:00', 1, '2012-10-13 11:11:46'),
(600, 'GIFT150GKB0U2KG', 4, 150, '2013-01-08 00:00:00', 1, '2012-10-13 11:11:46'),
(601, 'GIFT150GKB7YQMG', 4, 150, '2013-01-08 00:00:00', 1, '2012-10-13 11:11:46'),
(602, 'GIFT150GKB10VOO', 4, 150, '2013-01-08 00:00:00', 1, '2012-10-13 11:11:46'),
(603, 'GIFT150GKB0OVDE', 4, 150, '2013-01-08 00:00:00', 1, '2012-10-13 11:11:46'),
(604, 'GIFT150GKB1GDVS', 4, 150, '2013-01-08 00:00:00', 1, '2012-10-13 11:11:46'),
(605, 'GIFT150GKBNQV0Y', 4, 150, '2013-01-08 00:00:00', 1, '2012-10-13 11:11:46'),
(606, 'GIFT150GKBEIVBI', 4, 150, '2013-01-08 00:00:00', 1, '2012-10-13 11:11:46'),
(607, 'GIFT150GKBTPNZO', 4, 150, '2013-01-08 00:00:00', 1, '2012-10-13 11:11:46'),
(608, 'GIFT150GKB0HLT5', 4, 150, '2013-01-08 00:00:00', 1, '2012-10-13 11:11:46'),
(609, 'GIFT150GKB0RTEU', 4, 150, '2013-01-08 00:00:00', 1, '2012-10-13 11:11:46'),
(610, 'GIFT150GKBOGEK9', 4, 150, '2013-01-08 00:00:00', 1, '2012-10-13 11:11:46'),
(611, 'GIFT150GKBDZ16K', 4, 150, '2013-01-08 00:00:00', 1, '2012-10-13 11:11:46'),
(612, 'GIFT150GKB0BS7B', 4, 150, '2013-01-08 00:00:00', 1, '2012-10-13 11:11:46'),
(613, 'GIFT150GKBLE1S8', 4, 150, '2013-01-08 00:00:00', 1, '2012-10-13 11:11:46'),
(614, 'GIFT150GKB49G15', 4, 150, '2013-01-08 00:00:00', 1, '2012-10-13 11:11:46'),
(615, 'GIFT150GKBGIQON', 4, 150, '2013-01-08 00:00:00', 1, '2012-10-13 11:11:46'),
(616, 'GIFT150GKBJFSOC', 4, 150, '2013-01-08 00:00:00', 1, '2012-10-13 11:11:46'),
(617, 'GIFT150GKBI2FIZ', 4, 150, '2013-01-08 00:00:00', 1, '2012-10-13 11:11:46'),
(618, 'GIFT150GKB0AMRO', 4, 150, '2013-01-08 00:00:00', 1, '2012-10-13 11:11:46'),
(619, 'GIFT150GKBNJHPO', 4, 150, '2013-01-08 00:00:00', 1, '2012-10-13 11:11:46'),
(620, 'GIFT150GKB0ILSE', 4, 150, '2013-01-08 00:00:00', 1, '2012-10-13 11:11:46'),
(621, 'GIFT150GKB1KIA4', 4, 150, '2013-01-08 00:00:00', 1, '2012-10-13 11:11:46'),
(622, 'GIFT150GKBU3BEC', 4, 150, '2013-01-08 00:00:00', 1, '2012-10-13 11:11:46'),
(623, 'GIFT150GKB1TUKE', 4, 150, '2013-01-08 00:00:00', 1, '2012-10-13 11:11:46'),
(624, 'GIFT150GKBLEYGY', 4, 150, '2013-01-08 00:00:00', 1, '2012-10-13 11:11:46'),
(625, 'GIFT150GKB08ZWK', 4, 150, '2013-01-08 00:00:00', 1, '2012-10-13 11:11:46'),
(626, 'GIFT150GKB1JWDW', 4, 150, '2013-01-08 00:00:00', 1, '2012-10-13 11:11:46'),
(627, 'GIFT150GKBVAVIF', 4, 150, '2013-01-08 00:00:00', 1, '2012-10-13 11:11:46');
INSERT INTO `lag_vouchers` (`id`, `voucher_code`, `id_product`, `value`, `validity`, `status`, `timestamp`) VALUES
(628, 'GIFT150GKBM1LSY', 4, 150, '2013-01-08 00:00:00', 1, '2012-10-13 11:11:46'),
(629, 'GIFT150GKBRHJWD', 4, 150, '2013-01-08 00:00:00', 1, '2012-10-13 11:11:46'),
(630, 'GIFT150GKB0FGVY', 4, 150, '2013-01-08 00:00:00', 1, '2012-10-13 11:11:46'),
(631, 'GIFT150GKBDJEF9', 4, 150, '2013-01-08 00:00:00', 1, '2012-10-13 11:11:46'),
(632, 'GIFT150GKB7U6HN', 4, 150, '2013-01-08 00:00:00', 1, '2012-10-13 11:11:46'),
(633, 'GIFT150GKB0Y5KR', 4, 150, '2013-01-08 00:00:00', 1, '2012-10-13 11:11:46'),
(634, 'GIFT150GKBYHTKP', 4, 150, '2013-01-08 00:00:00', 1, '2012-10-13 11:11:46'),
(635, 'GIFT150GKB5GXAZ', 4, 150, '2013-01-08 00:00:00', 1, '2012-10-13 11:11:46'),
(636, 'GIFT150GKBJEPAW', 4, 150, '2013-01-08 00:00:00', 1, '2012-10-13 11:11:46'),
(637, 'GIFT150GKB0FDV0', 4, 150, '2013-01-08 00:00:00', 1, '2012-10-13 11:11:46'),
(638, 'GIFT150GKB1ZB3E', 4, 150, '2013-01-08 00:00:00', 1, '2012-10-13 11:11:46'),
(639, 'GIFT150GKBVGSMS', 4, 150, '2013-01-08 00:00:00', 1, '2012-10-13 11:11:46'),
(640, 'GIFT150GKB1QWAV', 4, 150, '2013-01-08 00:00:00', 1, '2012-10-13 11:11:46'),
(641, 'GIFT150GKBYUAVT', 4, 150, '2013-01-08 00:00:00', 1, '2012-10-13 11:11:46'),
(642, 'GIFT150GKB0MMIP', 4, 150, '2013-01-08 00:00:00', 1, '2012-10-13 11:11:46'),
(643, 'GIFT150GKB1FODJ', 4, 150, '2013-01-08 00:00:00', 1, '2012-10-13 11:11:46'),
(644, 'GIFT150GKB17L4R', 4, 150, '2013-01-08 00:00:00', 1, '2012-10-13 11:11:46'),
(645, 'GIFT150GKBLLBJO', 4, 150, '2013-01-08 00:00:00', 1, '2012-10-13 11:11:46'),
(646, 'GIFT150GKB1ELFC', 4, 150, '2013-01-08 00:00:00', 1, '2012-10-13 11:11:46'),
(647, 'GIFT150GKBIIS2Z', 4, 150, '2013-01-08 00:00:00', 1, '2012-10-13 11:11:46'),
(648, 'GIFT150GKB1ACHE', 4, 150, '2013-01-08 00:00:00', 1, '2012-10-13 11:11:46'),
(649, 'GIFT150GKB1D0UJ', 4, 150, '2013-01-08 00:00:00', 1, '2012-10-13 11:11:46'),
(650, 'GIFT150GKB1ZC9S', 4, 150, '2013-01-08 00:00:00', 1, '2012-10-13 11:11:46'),
(651, 'GIFT150GKB6VLB8', 4, 150, '2013-01-08 00:00:00', 1, '2012-10-13 11:11:46'),
(652, 'GIFT150GKB0OYHM', 4, 150, '2013-01-08 00:00:00', 1, '2012-10-13 11:11:46'),
(653, 'GIFT150GKBF5WLY', 4, 150, '2013-01-08 00:00:00', 1, '2012-10-13 11:11:46'),
(654, 'GIFT150GKBGG2DG', 4, 150, '2013-01-08 00:00:00', 1, '2012-10-13 11:11:46'),
(655, 'GIFT150GKBJIH06', 4, 150, '2013-01-08 00:00:00', 1, '2012-10-13 11:11:46'),
(656, 'GIFT2000GKBGCYIV', 5, 2000, '2013-07-08 00:00:00', 1, '2012-10-13 11:21:22'),
(657, 'GIFT2000GKBRNB5T', 5, 2000, '2013-07-08 00:00:00', 1, '2012-10-13 11:21:22'),
(658, 'GIFT2000GKB0SWVZ', 5, 2000, '2013-07-08 00:00:00', 1, '2012-10-13 11:21:22'),
(659, 'GIFT2000GKB0A2NM', 5, 2000, '2013-07-08 00:00:00', 1, '2012-10-13 11:21:22'),
(660, 'GIFT2000GKBJGMIW', 5, 2000, '2013-07-08 00:00:00', 1, '2012-10-13 11:21:22'),
(661, 'GIFT2000GKBHNGGX', 5, 2000, '2013-07-08 00:00:00', 1, '2012-10-13 11:21:22'),
(662, 'GIFT2000GKBVARBH', 5, 2000, '2013-07-08 00:00:00', 1, '2012-10-13 11:21:22'),
(663, 'GIFT2000GKB1RCOQ', 5, 2000, '2013-07-08 00:00:00', 1, '2012-10-13 11:21:22'),
(664, 'GIFT2000GKBVZSGK', 5, 2000, '2013-07-08 00:00:00', 1, '2012-10-13 11:21:22'),
(665, 'GIFT2000GKB0O4WC', 5, 2000, '2013-07-08 00:00:00', 1, '2012-10-13 11:21:22'),
(666, 'GIFT2000GKBM5WLJ', 5, 2000, '2013-07-08 00:00:00', 1, '2012-10-13 11:21:22'),
(667, 'GIFT2000GKBAWYQ6', 5, 2000, '2013-07-08 00:00:00', 1, '2012-10-13 11:21:22'),
(668, 'GIFT2000GKBZ3PIQ', 5, 2000, '2013-07-08 00:00:00', 1, '2012-10-13 11:21:22'),
(669, 'GIFT2000GKBONNTQ', 5, 2000, '2013-07-08 00:00:00', 1, '2012-10-13 11:21:22'),
(670, 'GIFT2000GKBGGBQH', 5, 2000, '2013-07-08 00:00:00', 1, '2012-10-13 11:21:22'),
(671, 'GIFT2000GKB62GAS', 5, 2000, '2013-07-08 00:00:00', 1, '2012-10-13 11:21:22'),
(672, 'GIFT2000GKB3ENOG', 5, 2000, '2013-07-08 00:00:00', 1, '2012-10-13 11:21:22'),
(673, 'GIFT2000GKB9QRRF', 5, 2000, '2013-07-08 00:00:00', 1, '2012-10-13 11:21:22'),
(674, 'GIFT2000GKB1WGIE', 5, 2000, '2013-07-08 00:00:00', 1, '2012-10-13 11:21:22'),
(675, 'GIFT2000GKB01I9G', 5, 2000, '2013-07-08 00:00:00', 1, '2012-10-13 11:21:22'),
(676, 'GIFT2000GKBBSS4M', 5, 2000, '2013-07-08 00:00:00', 1, '2012-10-13 11:21:22'),
(677, 'GIFT2000GKB2MQOV', 5, 2000, '2013-07-08 00:00:00', 1, '2012-10-13 11:21:22'),
(678, 'GIFT2000GKB1FSCF', 5, 2000, '2013-07-08 00:00:00', 1, '2012-10-13 11:21:22'),
(679, 'GIFT2000GKB1004O', 5, 2000, '2013-07-08 00:00:00', 1, '2012-10-13 11:21:22'),
(680, 'GIFT2000GKB1KM5O', 5, 2000, '2013-07-08 00:00:00', 1, '2012-10-13 11:21:22'),
(681, 'GIFT2000GKB1QQ0F', 5, 2000, '2013-07-08 00:00:00', 1, '2012-10-13 11:21:22'),
(682, 'GIFT2000GKBSQPUE', 5, 2000, '2013-07-08 00:00:00', 1, '2012-10-13 11:21:22'),
(683, 'GIFT2000GKBH2SZR', 5, 2000, '2013-07-08 00:00:00', 1, '2012-10-13 11:21:22'),
(684, 'GIFT2000GKB4JUPU', 5, 2000, '2013-07-08 00:00:00', 1, '2012-10-13 11:21:22'),
(685, 'GIFT2000GKB1NT7D', 5, 2000, '2013-07-08 00:00:00', 1, '2012-10-13 11:21:22'),
(686, 'GIFT2000GKB0XHFR', 5, 2000, '2013-07-08 00:00:00', 1, '2012-10-13 11:21:22'),
(687, 'GIFT2000GKB0G7JR', 5, 2000, '2013-07-08 00:00:00', 1, '2012-10-13 11:21:22'),
(688, 'GIFT2000GKBUXZJC', 5, 2000, '2013-07-08 00:00:00', 1, '2012-10-13 11:21:22'),
(689, 'GIFT2000GKBNLCRB', 5, 2000, '2013-07-08 00:00:00', 1, '2012-10-13 11:21:22'),
(690, 'GIFT2000GKB2OEYB', 5, 2000, '2013-07-08 00:00:00', 1, '2012-10-13 11:21:22'),
(691, 'GIFT2000GKBYRYX0', 5, 2000, '2013-07-08 00:00:00', 1, '2012-10-13 11:21:22'),
(692, 'GIFT2000GKB1J9V4', 5, 2000, '2013-07-08 00:00:00', 1, '2012-10-13 11:21:22'),
(693, 'GIFT2000GKBLXYRG', 5, 2000, '2013-07-08 00:00:00', 1, '2012-10-13 11:21:22'),
(694, 'GIFT2000GKBTA0LG', 5, 2000, '2013-07-08 00:00:00', 1, '2012-10-13 11:21:22'),
(695, 'GIFT2000GKB0PLAA', 5, 2000, '2013-07-08 00:00:00', 1, '2012-10-13 11:21:22'),
(696, 'GIFT2000GKBAKS7I', 5, 2000, '2013-07-08 00:00:00', 1, '2012-10-13 11:21:22'),
(697, 'GIFT2000GKBI0LJK', 5, 2000, '2013-07-08 00:00:00', 1, '2012-10-13 11:21:22'),
(698, 'GIFT2000GKB0HR2S', 5, 2000, '2013-07-08 00:00:00', 1, '2012-10-13 11:21:22'),
(699, 'GIFT2000GKB1AZMC', 5, 2000, '2013-07-08 00:00:00', 1, '2012-10-13 11:21:22'),
(700, 'GIFT2000GKBIL4JR', 5, 2000, '2013-07-08 00:00:00', 1, '2012-10-13 11:21:22'),
(701, 'GIFT2000GKBULQSA', 5, 2000, '2013-07-08 00:00:00', 1, '2012-10-13 11:21:22'),
(702, 'GIFT2000GKB2EFLA', 5, 2000, '2013-07-08 00:00:00', 1, '2012-10-13 11:21:22'),
(703, 'GIFT2000GKB0TC1S', 5, 2000, '2013-07-08 00:00:00', 1, '2012-10-13 11:21:22'),
(704, 'GIFT2000GKBRYHZV', 5, 2000, '2013-07-08 00:00:00', 1, '2012-10-13 11:21:22'),
(705, 'GIFT2000GKBWQVSL', 5, 2000, '2013-07-08 00:00:00', 1, '2012-10-13 11:21:22'),
(706, 'HKZT8N9C1000', 6, 1000, '2012-12-31 00:00:00', 1, '2012-10-13 11:41:52'),
(707, 'HKT6LC461000', 6, 1000, '2012-12-31 00:00:00', 1, '2012-10-13 11:41:52'),
(708, 'HK6F7UG91000', 6, 1000, '2012-12-31 00:00:00', 1, '2012-10-13 11:41:52'),
(709, 'HK9M37H61000', 6, 1000, '2012-12-31 00:00:00', 1, '2012-10-13 11:41:52'),
(710, 'HKR11QX51000', 6, 1000, '2012-12-31 00:00:00', 1, '2012-10-13 11:41:52'),
(711, 'GIFT1000GKBF1NOC', 7, 1000, '2013-07-08 00:00:00', 1, '2012-10-13 12:15:10'),
(712, 'GIFT1000GKBRH2WB', 7, 1000, '2013-07-08 00:00:00', 1, '2012-10-13 12:15:10'),
(713, 'GIFT1000GKB1O479', 7, 1000, '2013-07-08 00:00:00', 1, '2012-10-13 12:15:10'),
(714, 'GIFT1000GKB1MHZ9', 7, 1000, '2013-07-08 00:00:00', 1, '2012-10-13 12:15:10'),
(715, 'GIFT1000GKBWZCTI', 7, 1000, '2013-07-08 00:00:00', 1, '2012-10-13 12:15:10'),
(716, 'GIFT1000GKB1EWF7', 7, 1000, '2013-07-08 00:00:00', 1, '2012-10-13 12:15:10'),
(717, 'GIFT1000GKB0XWWM', 7, 1000, '2013-07-08 00:00:00', 1, '2012-10-13 12:15:10'),
(718, 'GIFT1000GKB12I74', 7, 1000, '2013-07-08 00:00:00', 1, '2012-10-13 12:15:10'),
(719, 'GIFT1000GKBOX3AG', 7, 1000, '2013-07-08 00:00:00', 1, '2012-10-13 12:15:10'),
(720, 'GIFT1000GKB0EVJ7', 7, 1000, '2013-07-08 00:00:00', 1, '2012-10-13 12:15:10'),
(721, 'GIFT1000GKBUQKQ6', 7, 1000, '2013-07-08 00:00:00', 1, '2012-10-13 12:15:10'),
(722, 'GIFT1000GKBGWEAK', 7, 1000, '2013-07-08 00:00:00', 1, '2012-10-13 12:15:10'),
(723, 'GIFT1000GKB1EAV3', 7, 1000, '2013-07-08 00:00:00', 1, '2012-10-13 12:15:10'),
(724, 'GIFT1000GKBO3ECS', 7, 1000, '2013-07-08 00:00:00', 1, '2012-10-13 12:15:10'),
(725, 'GIFT1000GKB1VIAE', 7, 1000, '2013-07-08 00:00:00', 1, '2012-10-13 12:15:10'),
(726, 'GIFT1000GKBGNDL5', 7, 1000, '2013-07-08 00:00:00', 1, '2012-10-13 12:15:10'),
(727, 'GIFT1000GKB0Z3FV', 7, 1000, '2013-07-08 00:00:00', 1, '2012-10-13 12:15:10'),
(728, 'GIFT1000GKB1DIAT', 7, 1000, '2013-07-08 00:00:00', 1, '2012-10-13 12:15:10'),
(729, 'GIFT1000GKB0NYR3', 7, 1000, '2013-07-08 00:00:00', 1, '2012-10-13 12:15:10'),
(730, 'GIFT1000GKBEYNMB', 7, 1000, '2013-07-08 00:00:00', 1, '2012-10-13 12:15:10'),
(731, 'GIFT1000GKB0I9PN', 7, 1000, '2013-07-08 00:00:00', 1, '2012-10-13 12:15:10'),
(732, 'GIFT1000GKB0FETE', 7, 1000, '2013-07-08 00:00:00', 1, '2012-10-13 12:15:10'),
(733, 'GIFT1000GKB1PXIS', 7, 1000, '2013-07-08 00:00:00', 1, '2012-10-13 12:15:10'),
(734, 'GIFT1000GKBELNBD', 7, 1000, '2013-07-08 00:00:00', 1, '2012-10-13 12:15:10'),
(735, 'GIFT1000GKB1DW34', 7, 1000, '2013-07-08 00:00:00', 1, '2012-10-13 12:15:10'),
(736, 'GIFT1000GKB1SA9B', 7, 1000, '2013-07-08 00:00:00', 1, '2012-10-13 12:15:10'),
(737, 'GIFT1000GKB14UZZ', 7, 1000, '2013-07-08 00:00:00', 1, '2012-10-13 12:15:10'),
(738, 'GIFT1000GKBVEFGJ', 7, 1000, '2013-07-08 00:00:00', 1, '2012-10-13 12:15:10'),
(739, 'GIFT1000GKBL0EHL', 7, 1000, '2013-07-08 00:00:00', 1, '2012-10-13 12:15:10'),
(740, 'GIFT1000GKB1PIYC', 7, 1000, '2013-07-08 00:00:00', 1, '2012-10-13 12:15:10'),
(741, 'GIFT1000GKB0OG6L', 7, 1000, '2013-07-08 00:00:00', 1, '2012-10-13 12:15:10'),
(742, 'GIFT1000GKB0IZCW', 7, 1000, '2013-07-08 00:00:00', 1, '2012-10-13 12:15:10'),
(743, 'GIFT1000GKBMNI8K', 7, 1000, '2013-07-08 00:00:00', 1, '2012-10-13 12:15:10'),
(744, 'GIFT1000GKBGMWVD', 7, 1000, '2013-07-08 00:00:00', 1, '2012-10-13 12:15:10'),
(745, 'GIFT1000GKBRU5BQ', 7, 1000, '2013-07-08 00:00:00', 1, '2012-10-13 12:15:10'),
(746, 'GIFT1000GKB10AOY', 7, 1000, '2013-07-08 00:00:00', 1, '2012-10-13 12:15:10'),
(747, 'GIFT1000GKB0VPGL', 7, 1000, '2013-07-08 00:00:00', 1, '2012-10-13 12:15:10'),
(748, 'GIFT1000GKBUFI4H', 7, 1000, '2013-07-08 00:00:00', 1, '2012-10-13 12:15:10'),
(749, 'GIFT1000GKBK7EOC', 7, 1000, '2013-07-08 00:00:00', 1, '2012-10-13 12:15:10'),
(750, 'GIFT1000GKB0TYMZ', 7, 1000, '2013-07-08 00:00:00', 1, '2012-10-13 12:15:10'),
(751, 'GIFT1000GKB1FQH3', 7, 1000, '2013-07-08 00:00:00', 1, '2012-10-13 12:15:10'),
(752, 'GIFT1000GKB01JP2', 7, 1000, '2013-07-08 00:00:00', 1, '2012-10-13 12:15:10'),
(753, 'GIFT1000GKB0WLU9', 7, 1000, '2013-07-08 00:00:00', 1, '2012-10-13 12:15:10'),
(754, 'GIFT1000GKB1ZTG0', 7, 1000, '2013-07-08 00:00:00', 1, '2012-10-13 12:15:10'),
(755, 'GIFT1000GKB10UCZ', 7, 1000, '2013-07-08 00:00:00', 1, '2012-10-13 12:15:10'),
(756, 'GIFT1000GKBVKDTH', 7, 1000, '2013-07-08 00:00:00', 1, '2012-10-13 12:15:10'),
(757, 'GIFT1000GKB1MDZ6', 7, 1000, '2013-07-08 00:00:00', 1, '2012-10-13 12:15:10'),
(758, 'GIFT1000GKBVJ8XD', 7, 1000, '2013-07-08 00:00:00', 1, '2012-10-13 12:15:10'),
(759, 'GIFT1000GKBAJQJF', 7, 1000, '2013-07-08 00:00:00', 1, '2012-10-13 12:15:10'),
(760, 'GIFT1000GKB1BVQD', 7, 1000, '2013-07-08 00:00:00', 1, '2012-10-13 12:15:10'),
(761, 'Childone2', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(762, 'Childone3', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(763, 'Childone4', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(764, 'Childone5', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(765, 'Childone6', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(766, 'Childone7', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(767, 'Childone8', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(768, 'Childone9', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(769, 'Childone10', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(770, 'Childone11', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(771, 'Childone12', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(772, 'Childone13', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(773, 'Childone14', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(774, 'Childone15', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(775, 'Childone16', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(776, 'Childone17', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(777, 'Childone18', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(778, 'Childone19', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(779, 'Childone20', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(780, 'Childone21', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(781, 'Childone22', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(782, 'Childone23', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(783, 'Childone24', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(784, 'Childone25', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(785, 'Childone26', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(786, 'Childone27', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(787, 'Childone28', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(788, 'Childone29', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(789, 'Childone30', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(790, 'Childone31', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(791, 'Childone32', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(792, 'Childone33', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(793, 'Childone34', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(794, 'Childone35', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(795, 'Childone36', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(796, 'Childone37', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(797, 'Childone38', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(798, 'Childone39', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(799, 'Childone40', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(800, 'Childone41', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(801, 'Childone42', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(802, 'Childone43', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(803, 'Childone44', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(804, 'Childone45', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(805, 'Childone46', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(806, 'Childone47', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(807, 'Childone48', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(808, 'Childone49', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(809, 'Childone50', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(810, 'Childone51', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(811, 'Childone52', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(812, 'Childone53', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(813, 'Childone54', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(814, 'Childone55', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(815, 'Childone56', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(816, 'Childone57', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(817, 'Childone58', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(818, 'Childone59', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(819, 'Childone60', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(820, 'Childone61', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(821, 'Childone62', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(822, 'Childone63', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(823, 'Childone64', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(824, 'Childone65', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(825, 'Childone66', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(826, 'Childone67', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(827, 'Childone68', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(828, 'Childone69', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(829, 'Childone70', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(830, 'Childone71', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(831, 'Childone72', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(832, 'Childone73', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(833, 'Childone74', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(834, 'Childone75', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(835, 'Childone76', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(836, 'Childone77', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(837, 'Childone78', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(838, 'Childone79', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(839, 'Childone80', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(840, 'Childone81', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(841, 'Childone82', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(842, 'Childone83', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(843, 'Childone84', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(844, 'Childone85', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(845, 'Childone86', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(846, 'Childone87', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(847, 'Childone88', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(848, 'Childone89', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(849, 'Childone90', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(850, 'Childone91', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(851, 'Childone92', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(852, 'Childone93', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(853, 'Childone94', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(854, 'Childone95', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(855, 'Childone96', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(856, 'Childone97', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(857, 'Childone98', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(858, 'Childone99', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(859, 'Childone100', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(860, 'Childone101', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(861, 'Childone102', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(862, 'Childone103', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(863, 'Childone104', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(864, 'Childone105', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(865, 'Childone106', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(866, 'Childone107', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(867, 'Childone108', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(868, 'Childone109', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(869, 'Childone110', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(870, 'Childone111', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(871, 'Childone112', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(872, 'Childone113', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(873, 'Childone114', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(874, 'Childone115', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(875, 'Childone116', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(876, 'Childone117', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(877, 'Childone118', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(878, 'Childone119', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(879, 'Childone120', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(880, 'Childone121', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(881, 'Childone122', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(882, 'Childone123', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(883, 'Childone124', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(884, 'Childone125', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(885, 'Childone126', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(886, 'Childone127', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(887, 'Childone128', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(888, 'Childone129', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(889, 'Childone130', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(890, 'Childone131', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(891, 'Childone132', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(892, 'Childone133', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(893, 'Childone134', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(894, 'Childone135', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(895, 'Childone136', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(896, 'Childone137', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(897, 'Childone138', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(898, 'Childone139', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(899, 'Childone140', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(900, 'Childone141', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(901, 'Childone142', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(902, 'Childone143', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(903, 'Childone144', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(904, 'Childone145', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(905, 'Childone146', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(906, 'Childone147', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(907, 'Childone148', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(908, 'Childone149', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(909, 'Childone150', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(910, 'Childone151', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(911, 'Childone152', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(912, 'Childone153', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(913, 'Childone154', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(914, 'Childone155', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(915, 'Childone156', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(916, 'Childone157', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(917, 'Childone158', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(918, 'Childone159', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(919, 'Childone160', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(920, 'Childone161', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(921, 'Childone162', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(922, 'Childone163', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(923, 'Childone164', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(924, 'Childone165', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(925, 'Childone166', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(926, 'Childone167', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(927, 'Childone168', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(928, 'Childone169', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(929, 'Childone170', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(930, 'Childone171', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(931, 'Childone172', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(932, 'Childone173', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(933, 'Childone174', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(934, 'Childone175', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(935, 'Childone176', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(936, 'Childone177', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(937, 'Childone178', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(938, 'Childone179', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(939, 'Childone180', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(940, 'Childone181', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(941, 'Childone182', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(942, 'Childone183', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(943, 'Childone184', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(944, 'Childone185', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(945, 'Childone186', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(946, 'Childone187', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(947, 'Childone188', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(948, 'Childone189', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(949, 'Childone190', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(950, 'Childone191', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(951, 'Childone192', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(952, 'Childone193', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(953, 'Childone194', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(954, 'Childone195', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(955, 'Childone196', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(956, 'Childone197', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(957, 'Childone198', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(958, 'Childone199', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(959, 'Childone200', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(960, 'Childone201', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(961, 'Childone202', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(962, 'Childone203', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(963, 'Childone204', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(964, 'Childone205', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(965, 'Childone206', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(966, 'Childone207', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(967, 'Childone208', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(968, 'Childone209', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(969, 'Childone210', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(970, 'Childone211', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(971, 'Childone212', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(972, 'Childone213', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(973, 'Childone214', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(974, 'Childone215', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(975, 'Childone216', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(976, 'Childone217', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(977, 'Childone218', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(978, 'Childone219', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(979, 'Childone220', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(980, 'Childone221', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(981, 'Childone222', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(982, 'Childone223', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(983, 'Childone224', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(984, 'Childone225', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(985, 'Childone226', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(986, 'Childone227', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(987, 'Childone228', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(988, 'Childone229', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(989, 'Childone230', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(990, 'Childone231', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(991, 'Childone232', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(992, 'Childone233', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(993, 'Childone234', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(994, 'Childone235', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(995, 'Childone236', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(996, 'Childone237', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(997, 'Childone238', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(998, 'Childone239', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(999, 'Childone240', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(1000, 'Childone241', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(1001, 'Childone242', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(1002, 'Childone243', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(1003, 'Childone244', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(1004, 'Childone245', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(1005, 'Childone246', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(1006, 'Childone247', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(1007, 'Childone248', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(1008, 'Childone249', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(1009, 'Childone250', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(1010, 'Childone251', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(1011, 'Childone252', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(1012, 'Childone253', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(1013, 'Childone254', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(1014, 'Childone255', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(1015, 'Childone256', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(1016, 'Childone257', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(1017, 'Childone258', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(1018, 'Childone259', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(1019, 'Childone260', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(1020, 'Childone261', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(1021, 'Childone262', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(1022, 'Childone263', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(1023, 'Childone264', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(1024, 'Childone265', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(1025, 'Childone266', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(1026, 'Childone267', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(1027, 'Childone268', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(1028, 'Childone269', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(1029, 'Childone270', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(1030, 'Childone271', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(1031, 'Childone272', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(1032, 'Childone273', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(1033, 'Childone274', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(1034, 'Childone275', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(1035, 'Childone276', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(1036, 'Childone277', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(1037, 'Childone278', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(1038, 'Childone279', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(1039, 'Childone280', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(1040, 'Childone281', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(1041, 'Childone282', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(1042, 'Childone283', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(1043, 'Childone284', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(1044, 'Childone285', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(1045, 'Childone286', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(1046, 'Childone287', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(1047, 'Childone288', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(1048, 'Childone289', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(1049, 'Childone290', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(1050, 'Childone291', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(1051, 'Childone292', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(1052, 'Childone293', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(1053, 'Childone294', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(1054, 'Childone295', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(1055, 'Childone296', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(1056, 'Childone297', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(1057, 'Childone298', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(1058, 'Childone299', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(1059, 'Childone300', 8, 400, '2012-12-31 00:00:00', 1, '2012-10-13 12:53:44'),
(1060, 'FKT001SLD', 9, 100, '2012-12-31 00:00:00', 1, '2012-10-13 13:09:55'),
(1061, 'smj002', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1062, 'smj003', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1063, 'smj004', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1064, 'smj005', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1065, 'smj006', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1066, 'smj007', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1067, 'smj008', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1068, 'smj009', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1069, 'smj010', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1070, 'smj011', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1071, 'smj012', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1072, 'smj013', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1073, 'smj014', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1074, 'smj015', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1075, 'smj016', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1076, 'smj017', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1077, 'smj018', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1078, 'smj019', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1079, 'smj020', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1080, 'smj021', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1081, 'smj022', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1082, 'smj023', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1083, 'smj024', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1084, 'smj025', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1085, 'smj026', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1086, 'smj027', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1087, 'smj028', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1088, 'smj029', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1089, 'smj030', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1090, 'smj031', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1091, 'smj032', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1092, 'smj033', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1093, 'smj034', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1094, 'smj035', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1095, 'smj036', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1096, 'smj037', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1097, 'smj038', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1098, 'smj039', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1099, 'smj040', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1100, 'smj041', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1101, 'smj042', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1102, 'smj043', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1103, 'smj044', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1104, 'smj045', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1105, 'smj046', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1106, 'smj047', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1107, 'smj048', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1108, 'smj049', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1109, 'smj050', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1110, 'smj051', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1111, 'smj052', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1112, 'smj053', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1113, 'smj054', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1114, 'smj055', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1115, 'smj056', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1116, 'smj057', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1117, 'smj058', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1118, 'smj059', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1119, 'smj060', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1120, 'smj061', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1121, 'smj062', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1122, 'smj063', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1123, 'smj064', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1124, 'smj065', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1125, 'smj066', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1126, 'smj067', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1127, 'smj068', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1128, 'smj069', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1129, 'smj070', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1130, 'smj071', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1131, 'smj072', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1132, 'smj073', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1133, 'smj074', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1134, 'smj075', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1135, 'smj076', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1136, 'smj077', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1137, 'smj078', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1138, 'smj079', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1139, 'smj080', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1140, 'smj081', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1141, 'smj082', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1142, 'smj083', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1143, 'smj084', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1144, 'smj085', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1145, 'smj086', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1146, 'smj087', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1147, 'smj088', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1148, 'smj089', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1149, 'smj090', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1150, 'smj091', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1151, 'smj092', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1152, 'smj093', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1153, 'smj094', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1154, 'smj095', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1155, 'smj096', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1156, 'smj097', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1157, 'smj098', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1158, 'smj099', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1159, 'smj100', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1160, 'smj101', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1161, 'smj102', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1162, 'smj103', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1163, 'smj104', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1164, 'smj105', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1165, 'smj106', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1166, 'smj107', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1167, 'smj108', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1168, 'smj109', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1169, 'smj110', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1170, 'smj111', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1171, 'smj112', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1172, 'smj113', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1173, 'smj114', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1174, 'smj115', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1175, 'smj116', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1176, 'smj117', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1177, 'smj118', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1178, 'smj119', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1179, 'smj120', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1180, 'smj121', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1181, 'smj122', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1182, 'smj123', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1183, 'smj124', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1184, 'smj125', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1185, 'smj126', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1186, 'smj127', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1187, 'smj128', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1188, 'smj129', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1189, 'smj130', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1190, 'smj131', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1191, 'smj132', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1192, 'smj133', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1193, 'smj134', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1194, 'smj135', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1195, 'smj136', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1196, 'smj137', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1197, 'smj138', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1198, 'smj139', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1199, 'smj140', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1200, 'smj141', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1201, 'smj142', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1202, 'smj143', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1203, 'smj144', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1204, 'smj145', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1205, 'smj146', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1206, 'smj147', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1207, 'smj148', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1208, 'smj149', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1209, 'smj150', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1210, 'smj151', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1211, 'smj152', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1212, 'smj153', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1213, 'smj154', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1214, 'smj155', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1215, 'smj156', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1216, 'smj157', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1217, 'smj158', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1218, 'smj159', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1219, 'smj160', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1220, 'smj161', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1221, 'smj162', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1222, 'smj163', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1223, 'smj164', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1224, 'smj165', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1225, 'smj166', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1226, 'smj167', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1227, 'smj168', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1228, 'smj169', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1229, 'smj170', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1230, 'smj171', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1231, 'smj172', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1232, 'smj173', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1233, 'smj174', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1234, 'smj175', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1235, 'smj176', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1236, 'smj177', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1237, 'smj178', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1238, 'smj179', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1239, 'smj180', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1240, 'smj181', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1241, 'smj182', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1242, 'smj183', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1243, 'smj184', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1244, 'smj185', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1245, 'smj186', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1246, 'smj187', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1247, 'smj188', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1248, 'smj189', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1249, 'smj190', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1250, 'smj191', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1251, 'smj192', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1252, 'smj193', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1253, 'smj194', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1254, 'smj195', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1255, 'smj196', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1256, 'smj197', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1257, 'smj198', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1258, 'smj199', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1259, 'smj200', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1260, 'smj201', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1261, 'smj202', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1262, 'smj203', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1263, 'smj204', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1264, 'smj205', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1265, 'smj206', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1266, 'smj207', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1267, 'smj208', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1268, 'smj209', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1269, 'smj210', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1270, 'smj211', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1271, 'smj212', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1272, 'smj213', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1273, 'smj214', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1274, 'smj215', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29');
INSERT INTO `lag_vouchers` (`id`, `voucher_code`, `id_product`, `value`, `validity`, `status`, `timestamp`) VALUES
(1275, 'smj216', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1276, 'smj217', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1277, 'smj218', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1278, 'smj219', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1279, 'smj220', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1280, 'smj221', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1281, 'smj222', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1282, 'smj223', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1283, 'smj224', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1284, 'smj225', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1285, 'smj226', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1286, 'smj227', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1287, 'smj228', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1288, 'smj229', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1289, 'smj230', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1290, 'smj231', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1291, 'smj232', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1292, 'smj233', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1293, 'smj234', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1294, 'smj235', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1295, 'smj236', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1296, 'smj237', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1297, 'smj238', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1298, 'smj239', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1299, 'smj240', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1300, 'smj241', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1301, 'smj242', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1302, 'smj243', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1303, 'smj244', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1304, 'smj245', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1305, 'smj246', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1306, 'smj247', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1307, 'smj248', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1308, 'smj249', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1309, 'smj250', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1310, 'smj251', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1311, 'smj252', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1312, 'smj253', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1313, 'smj254', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1314, 'smj255', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1315, 'smj256', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1316, 'smj257', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1317, 'smj258', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1318, 'smj259', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1319, 'smj260', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1320, 'smj261', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1321, 'smj262', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1322, 'smj263', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1323, 'smj264', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1324, 'smj265', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1325, 'smj266', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1326, 'smj267', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1327, 'smj268', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1328, 'smj269', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1329, 'smj270', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1330, 'smj271', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1331, 'smj272', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1332, 'smj273', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1333, 'smj274', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1334, 'smj275', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1335, 'smj276', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1336, 'smj277', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1337, 'smj278', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1338, 'smj279', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1339, 'smj280', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1340, 'smj281', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1341, 'smj282', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1342, 'smj283', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1343, 'smj284', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1344, 'smj285', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1345, 'smj286', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1346, 'smj287', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1347, 'smj288', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1348, 'smj289', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1349, 'smj290', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1350, 'smj291', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1351, 'smj292', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1352, 'smj293', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1353, 'smj294', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1354, 'smj295', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1355, 'smj296', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1356, 'smj297', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1357, 'smj298', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1358, 'smj299', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1359, 'smj300', 10, 700, '2012-12-31 00:00:00', 1, '2012-10-13 13:25:29'),
(1360, 'PVR001', 11, 500, '2012-12-31 00:00:00', 1, '2012-10-13 13:37:15'),
(1361, 'FB8EF9A9', 12, 1000, '2012-12-31 00:00:00', 2, '2012-10-23 14:22:32'),
(1362, 'D99E6DE9', 12, 1000, '2012-12-31 00:00:00', 1, '2012-10-13 14:12:09'),
(1363, '6D27D154', 12, 1000, '2012-12-31 00:00:00', 1, '2012-10-13 14:12:09'),
(1364, '66011FFA', 12, 1000, '2012-12-31 00:00:00', 1, '2012-10-13 14:12:09'),
(1365, 'E678FB29', 12, 1000, '2012-12-31 00:00:00', 1, '2012-10-13 14:12:09'),
(1366, '594F8CE5', 12, 1000, '2012-12-31 00:00:00', 1, '2012-10-13 14:12:09'),
(1367, '23597456', 12, 1000, '2012-12-31 00:00:00', 1, '2012-10-13 14:12:09'),
(1368, 'C55E2650', 12, 1000, '2012-12-31 00:00:00', 1, '2012-10-13 14:12:09'),
(1369, '794734BD', 12, 1000, '2012-12-31 00:00:00', 1, '2012-10-13 14:12:09'),
(1370, 'F7649B26', 12, 1000, '2012-12-31 00:00:00', 1, '2012-10-13 14:12:09'),
(1371, '20098175', 13, 1999, '2012-12-31 00:00:00', 1, '2012-10-13 14:24:31'),
(1372, '8686F6AD', 13, 1999, '2012-12-31 00:00:00', 1, '2012-10-13 14:24:31'),
(1373, '8FF6718F', 13, 1999, '2012-12-31 00:00:00', 1, '2012-10-13 14:24:31'),
(1374, 'BAA99DF4', 13, 1999, '2012-12-31 00:00:00', 1, '2012-10-13 14:24:31'),
(1375, 'AE4314E6', 13, 1999, '2012-12-31 00:00:00', 1, '2012-10-13 14:24:31'),
(1376, 'C26201F3', 13, 1999, '2012-12-31 00:00:00', 1, '2012-10-13 14:24:31'),
(1377, '22A6DBF9', 13, 1999, '2012-12-31 00:00:00', 1, '2012-10-13 14:24:31'),
(1378, '6888D934', 13, 1999, '2012-12-31 00:00:00', 1, '2012-10-13 14:24:31'),
(1379, '36197263', 13, 1999, '2012-12-31 00:00:00', 1, '2012-10-13 14:24:31'),
(1380, 'ED44EDFA', 13, 1999, '2012-12-31 00:00:00', 1, '2012-10-13 14:24:31'),
(1381, 'LGBGELLE002', 19, 900, '2012-12-31 00:00:00', 1, '2012-10-15 06:33:25'),
(1382, 'LGBGELLE003', 19, 900, '2012-12-31 00:00:00', 1, '2012-10-15 06:33:25'),
(1383, 'LGBGELLE004', 19, 900, '2012-12-31 00:00:00', 1, '2012-10-15 06:33:25'),
(1384, 'LGBGELLE005', 19, 900, '2012-12-31 00:00:00', 1, '2012-10-15 06:33:25'),
(1385, 'LGBGELLE006', 19, 900, '2012-12-31 00:00:00', 1, '2012-10-15 06:33:25'),
(1386, 'LGBGELLE007', 19, 900, '2012-12-31 00:00:00', 1, '2012-10-15 06:33:25'),
(1387, 'LGBGELLE008', 19, 900, '2012-12-31 00:00:00', 1, '2012-10-15 06:33:25'),
(1388, 'LGBGELLE009', 19, 900, '2012-12-31 00:00:00', 1, '2012-10-15 06:33:25'),
(1389, 'LGBGELLE010', 19, 900, '2012-12-31 00:00:00', 1, '2012-10-15 06:33:25'),
(1390, 'LGBGELLE011', 19, 900, '2012-12-31 00:00:00', 1, '2012-10-15 06:33:25'),
(1391, 'LGBGELLE012', 19, 900, '2012-12-31 00:00:00', 1, '2012-10-15 06:33:25'),
(1392, 'LGBGELLE013', 19, 900, '2012-12-31 00:00:00', 1, '2012-10-15 06:33:25'),
(1393, 'LGBGELLE014', 19, 900, '2012-12-31 00:00:00', 1, '2012-10-15 06:33:25'),
(1394, 'LGBGELLE015', 19, 900, '2012-12-31 00:00:00', 1, '2012-10-15 06:33:25'),
(1395, 'LGBGELLE016', 19, 900, '2012-12-31 00:00:00', 1, '2012-10-15 06:33:25'),
(1396, 'LGBGELLE017', 19, 900, '2012-12-31 00:00:00', 1, '2012-10-15 06:33:25'),
(1397, 'LGBGELLE018', 19, 900, '2012-12-31 00:00:00', 1, '2012-10-15 06:33:25'),
(1398, 'LGBGELLE019', 19, 900, '2012-12-31 00:00:00', 1, '2012-10-15 06:33:25'),
(1399, 'LGBGELLE020', 19, 900, '2012-12-31 00:00:00', 1, '2012-10-15 06:33:25'),
(1400, 'LGBGELLE021', 19, 900, '2012-12-31 00:00:00', 1, '2012-10-15 06:33:25'),
(1401, 'LGBGELLE022', 19, 900, '2012-12-31 00:00:00', 1, '2012-10-15 06:33:25'),
(1402, 'LGBGELLE023', 19, 900, '2012-12-31 00:00:00', 1, '2012-10-15 06:33:25'),
(1403, 'LGBGELLE024', 19, 900, '2012-12-31 00:00:00', 1, '2012-10-15 06:33:25'),
(1404, 'LGBGELLE025', 19, 900, '2012-12-31 00:00:00', 1, '2012-10-15 06:33:25'),
(1405, 'LGBGELLE026', 19, 900, '2012-12-31 00:00:00', 1, '2012-10-15 06:33:25'),
(1406, 'LGBGELLE027', 19, 900, '2012-12-31 00:00:00', 1, '2012-10-15 06:33:25'),
(1407, 'LGBGELLE028', 19, 900, '2012-12-31 00:00:00', 1, '2012-10-15 06:33:25'),
(1408, 'LGBGELLE029', 19, 900, '2012-12-31 00:00:00', 1, '2012-10-15 06:33:25'),
(1409, 'LGBGELLE030', 19, 900, '2012-12-31 00:00:00', 1, '2012-10-15 06:33:25'),
(1410, 'LGBGELLE031', 19, 900, '2012-12-31 00:00:00', 1, '2012-10-15 06:33:25'),
(1411, 'LGBGELLE032', 19, 900, '2012-12-31 00:00:00', 1, '2012-10-15 06:33:25'),
(1412, 'LGBGELLE033', 19, 900, '2012-12-31 00:00:00', 1, '2012-10-15 06:33:25'),
(1413, 'LGBGELLE034', 19, 900, '2012-12-31 00:00:00', 1, '2012-10-15 06:33:25'),
(1414, 'LGBGELLE035', 19, 900, '2012-12-31 00:00:00', 1, '2012-10-15 06:33:25'),
(1415, 'LGBGELLE036', 19, 900, '2012-12-31 00:00:00', 1, '2012-10-15 06:33:25'),
(1416, 'LGBGELLE037', 19, 900, '2012-12-31 00:00:00', 1, '2012-10-15 06:33:25'),
(1417, 'LGBGELLE038', 19, 900, '2012-12-31 00:00:00', 1, '2012-10-15 06:33:25'),
(1418, 'LGBGELLE039', 19, 900, '2012-12-31 00:00:00', 1, '2012-10-15 06:33:25'),
(1419, 'LGBGELLE040', 19, 900, '2012-12-31 00:00:00', 1, '2012-10-15 06:33:25'),
(1420, 'LGBGELLE041', 19, 900, '2012-12-31 00:00:00', 1, '2012-10-15 06:33:25'),
(1421, 'LGBGELLE042', 19, 900, '2012-12-31 00:00:00', 1, '2012-10-15 06:33:25'),
(1422, 'LGBGELLE043', 19, 900, '2012-12-31 00:00:00', 1, '2012-10-15 06:33:25'),
(1423, 'LGBGELLE044', 19, 900, '2012-12-31 00:00:00', 1, '2012-10-15 06:33:25'),
(1424, 'LGBGELLE045', 19, 900, '2012-12-31 00:00:00', 1, '2012-10-15 06:33:25'),
(1425, 'LGBGELLE046', 19, 900, '2012-12-31 00:00:00', 1, '2012-10-15 06:33:25'),
(1426, 'LGBGELLE047', 19, 900, '2012-12-31 00:00:00', 1, '2012-10-15 06:33:25'),
(1427, 'LGBGELLE048', 19, 900, '2012-12-31 00:00:00', 1, '2012-10-15 06:33:25'),
(1428, 'LGBGELLE049', 19, 900, '2012-12-31 00:00:00', 1, '2012-10-15 06:33:25'),
(1429, 'LGBGELLE050', 19, 900, '2012-12-31 00:00:00', 1, '2012-10-15 06:33:25'),
(1430, 'LGBGELLE051', 19, 900, '2012-12-31 00:00:00', 1, '2012-10-15 06:33:25'),
(1431, 'LGBGELLE052', 19, 900, '2012-12-31 00:00:00', 1, '2012-10-15 06:33:25'),
(1432, 'LGBGELLE053', 19, 900, '2012-12-31 00:00:00', 1, '2012-10-15 06:33:25'),
(1433, 'LGBGELLE054', 19, 900, '2012-12-31 00:00:00', 1, '2012-10-15 06:33:25'),
(1434, 'LGBGELLE055', 19, 900, '2012-12-31 00:00:00', 1, '2012-10-15 06:33:25'),
(1435, 'LGBGELLE056', 19, 900, '2012-12-31 00:00:00', 1, '2012-10-15 06:33:25'),
(1436, 'LGBGELLE057', 19, 900, '2012-12-31 00:00:00', 1, '2012-10-15 06:33:25'),
(1437, 'LGBGELLE058', 19, 900, '2012-12-31 00:00:00', 1, '2012-10-15 06:33:25'),
(1438, 'LGBGELLE059', 19, 900, '2012-12-31 00:00:00', 1, '2012-10-15 06:33:25'),
(1439, 'LGBGELLE060', 19, 900, '2012-12-31 00:00:00', 1, '2012-10-15 06:33:25'),
(1440, 'LGBGELLE061', 19, 900, '2012-12-31 00:00:00', 1, '2012-10-15 06:33:25'),
(1441, 'LGBGELLE062', 19, 900, '2012-12-31 00:00:00', 1, '2012-10-15 06:33:25'),
(1442, 'LGBGELLE063', 19, 900, '2012-12-31 00:00:00', 1, '2012-10-15 06:33:25'),
(1443, 'LGBGELLE064', 19, 900, '2012-12-31 00:00:00', 1, '2012-10-15 06:33:25'),
(1444, 'LGBGELLE065', 19, 900, '2012-12-31 00:00:00', 1, '2012-10-15 06:33:25'),
(1445, 'LGBGELLE066', 19, 900, '2012-12-31 00:00:00', 1, '2012-10-15 06:33:25'),
(1446, 'LGBGELLE067', 19, 900, '2012-12-31 00:00:00', 1, '2012-10-15 06:33:25'),
(1447, 'LGBGELLE068', 19, 900, '2012-12-31 00:00:00', 1, '2012-10-15 06:33:25'),
(1448, 'LGBGELLE069', 19, 900, '2012-12-31 00:00:00', 1, '2012-10-15 06:33:25'),
(1449, 'LGBGELLE070', 19, 900, '2012-12-31 00:00:00', 1, '2012-10-15 06:33:25'),
(1450, 'LGBGELLE071', 19, 900, '2012-12-31 00:00:00', 1, '2012-10-15 06:33:25'),
(1451, 'LGBGELLE072', 19, 900, '2012-12-31 00:00:00', 1, '2012-10-15 06:33:25'),
(1452, 'LGBGELLE073', 19, 900, '2012-12-31 00:00:00', 1, '2012-10-15 06:33:25'),
(1453, 'LGBGELLE074', 19, 900, '2012-12-31 00:00:00', 1, '2012-10-15 06:33:25'),
(1454, 'LGBGELLE075', 19, 900, '2012-12-31 00:00:00', 1, '2012-10-15 06:33:25'),
(1455, 'LGBGELLE076', 19, 900, '2012-12-31 00:00:00', 1, '2012-10-15 06:33:25'),
(1456, 'LGBGELLE077', 19, 900, '2012-12-31 00:00:00', 1, '2012-10-15 06:33:25'),
(1457, 'LGBGELLE078', 19, 900, '2012-12-31 00:00:00', 1, '2012-10-15 06:33:25'),
(1458, 'LGBGELLE079', 19, 900, '2012-12-31 00:00:00', 1, '2012-10-15 06:33:25'),
(1459, 'LGBGELLE080', 19, 900, '2012-12-31 00:00:00', 1, '2012-10-15 06:33:25'),
(1460, 'LGBGELLE081', 19, 900, '2012-12-31 00:00:00', 1, '2012-10-15 06:33:25'),
(1461, 'LGBGELLE082', 19, 900, '2012-12-31 00:00:00', 1, '2012-10-15 06:33:25'),
(1462, 'LGBGELLE083', 19, 900, '2012-12-31 00:00:00', 1, '2012-10-15 06:33:25'),
(1463, 'LGBGELLE084', 19, 900, '2012-12-31 00:00:00', 1, '2012-10-15 06:33:25'),
(1464, 'LGBGELLE085', 19, 900, '2012-12-31 00:00:00', 1, '2012-10-15 06:33:25'),
(1465, 'LGBGELLE086', 19, 900, '2012-12-31 00:00:00', 1, '2012-10-15 06:33:25'),
(1466, 'LGBGELLE087', 19, 900, '2012-12-31 00:00:00', 1, '2012-10-15 06:33:25'),
(1467, 'LGBGELLE088', 19, 900, '2012-12-31 00:00:00', 1, '2012-10-15 06:33:25'),
(1468, 'LGBGELLE089', 19, 900, '2012-12-31 00:00:00', 1, '2012-10-15 06:33:25'),
(1469, 'LGBGELLE090', 19, 900, '2012-12-31 00:00:00', 1, '2012-10-15 06:33:25'),
(1470, 'LGBGELLE091', 19, 900, '2012-12-31 00:00:00', 1, '2012-10-15 06:33:25'),
(1471, 'LGBGELLE092', 19, 900, '2012-12-31 00:00:00', 1, '2012-10-15 06:33:25'),
(1472, 'LGBGELLE093', 19, 900, '2012-12-31 00:00:00', 1, '2012-10-15 06:33:25'),
(1473, 'LGBGELLE094', 19, 900, '2012-12-31 00:00:00', 1, '2012-10-15 06:33:25'),
(1474, 'LGBGELLE095', 19, 900, '2012-12-31 00:00:00', 1, '2012-10-15 06:33:25'),
(1475, 'LGBGELLE096', 19, 900, '2012-12-31 00:00:00', 1, '2012-10-15 06:33:25'),
(1476, 'LGBGELLE097', 19, 900, '2012-12-31 00:00:00', 1, '2012-10-15 06:33:25'),
(1477, 'LGBGELLE098', 19, 900, '2012-12-31 00:00:00', 1, '2012-10-15 06:33:25'),
(1478, 'LGBGELLE099', 19, 900, '2012-12-31 00:00:00', 1, '2012-10-15 06:33:25'),
(1479, 'LGBGELLE100', 19, 900, '2012-12-31 00:00:00', 1, '2012-10-15 06:33:25'),
(1480, 'LGBGELLE002', 20, 900, '2012-12-31 00:00:00', 1, '2012-10-15 06:45:04'),
(1481, 'LGBGELLE003', 20, 900, '2012-12-31 00:00:00', 1, '2012-10-15 06:45:04'),
(1482, 'LGBGELLE004', 20, 900, '2012-12-31 00:00:00', 1, '2012-10-15 06:45:04'),
(1483, 'LGBGELLE005', 20, 900, '2012-12-31 00:00:00', 1, '2012-10-15 06:45:04'),
(1484, 'LGBGELLE006', 20, 900, '2012-12-31 00:00:00', 1, '2012-10-15 06:45:04'),
(1485, 'LGBGELLE007', 20, 900, '2012-12-31 00:00:00', 1, '2012-10-15 06:45:04'),
(1486, 'LGBGELLE008', 20, 900, '2012-12-31 00:00:00', 1, '2012-10-15 06:45:04'),
(1487, 'LGBGELLE009', 20, 900, '2012-12-31 00:00:00', 1, '2012-10-15 06:45:04'),
(1488, 'LGBGELLE010', 20, 900, '2012-12-31 00:00:00', 1, '2012-10-15 06:45:04'),
(1489, 'LGBGELLE011', 20, 900, '2012-12-31 00:00:00', 1, '2012-10-15 06:45:04'),
(1490, 'LGBGELLE012', 20, 900, '2012-12-31 00:00:00', 1, '2012-10-15 06:45:04'),
(1491, 'LGBGELLE013', 20, 900, '2012-12-31 00:00:00', 1, '2012-10-15 06:45:04'),
(1492, 'LGBGELLE014', 20, 900, '2012-12-31 00:00:00', 1, '2012-10-15 06:45:04'),
(1493, 'LGBGELLE015', 20, 900, '2012-12-31 00:00:00', 1, '2012-10-15 06:45:04'),
(1494, 'LGBGELLE016', 20, 900, '2012-12-31 00:00:00', 1, '2012-10-15 06:45:04'),
(1495, 'LGBGELLE017', 20, 900, '2012-12-31 00:00:00', 1, '2012-10-15 06:45:04'),
(1496, 'LGBGELLE018', 20, 900, '2012-12-31 00:00:00', 1, '2012-10-15 06:45:04'),
(1497, 'LGBGELLE019', 20, 900, '2012-12-31 00:00:00', 1, '2012-10-15 06:45:04'),
(1498, 'LGBGELLE020', 20, 900, '2012-12-31 00:00:00', 1, '2012-10-15 06:45:04'),
(1499, 'LGBGELLE021', 20, 900, '2012-12-31 00:00:00', 1, '2012-10-15 06:45:04'),
(1500, 'LGBGELLE022', 20, 900, '2012-12-31 00:00:00', 1, '2012-10-15 06:45:04'),
(1501, 'LGBGELLE023', 20, 900, '2012-12-31 00:00:00', 1, '2012-10-15 06:45:04'),
(1502, 'LGBGELLE024', 20, 900, '2012-12-31 00:00:00', 1, '2012-10-15 06:45:04'),
(1503, 'LGBGELLE025', 20, 900, '2012-12-31 00:00:00', 1, '2012-10-15 06:45:04'),
(1504, 'LGBGELLE026', 20, 900, '2012-12-31 00:00:00', 1, '2012-10-15 06:45:04'),
(1505, 'LGBGELLE027', 20, 900, '2012-12-31 00:00:00', 1, '2012-10-15 06:45:04'),
(1506, 'LGBGELLE028', 20, 900, '2012-12-31 00:00:00', 1, '2012-10-15 06:45:04'),
(1507, 'LGBGELLE029', 20, 900, '2012-12-31 00:00:00', 1, '2012-10-15 06:45:04'),
(1508, 'LGBGELLE030', 20, 900, '2012-12-31 00:00:00', 1, '2012-10-15 06:45:04'),
(1509, 'LGBGELLE031', 20, 900, '2012-12-31 00:00:00', 1, '2012-10-15 06:45:04'),
(1510, 'LGBGELLE032', 20, 900, '2012-12-31 00:00:00', 1, '2012-10-15 06:45:04'),
(1511, 'LGBGELLE033', 20, 900, '2012-12-31 00:00:00', 1, '2012-10-15 06:45:04'),
(1512, 'LGBGELLE034', 20, 900, '2012-12-31 00:00:00', 1, '2012-10-15 06:45:04'),
(1513, 'LGBGELLE035', 20, 900, '2012-12-31 00:00:00', 1, '2012-10-15 06:45:04'),
(1514, 'LGBGELLE036', 20, 900, '2012-12-31 00:00:00', 1, '2012-10-15 06:45:04'),
(1515, 'LGBGELLE037', 20, 900, '2012-12-31 00:00:00', 1, '2012-10-15 06:45:04'),
(1516, 'LGBGELLE038', 20, 900, '2012-12-31 00:00:00', 1, '2012-10-15 06:45:04'),
(1517, 'LGBGELLE039', 20, 900, '2012-12-31 00:00:00', 1, '2012-10-15 06:45:04'),
(1518, 'LGBGELLE040', 20, 900, '2012-12-31 00:00:00', 1, '2012-10-15 06:45:04'),
(1519, 'LGBGELLE041', 20, 900, '2012-12-31 00:00:00', 1, '2012-10-15 06:45:04'),
(1520, 'LGBGELLE042', 20, 900, '2012-12-31 00:00:00', 1, '2012-10-15 06:45:04'),
(1521, 'LGBGELLE043', 20, 900, '2012-12-31 00:00:00', 1, '2012-10-15 06:45:04'),
(1522, 'LGBGELLE044', 20, 900, '2012-12-31 00:00:00', 1, '2012-10-15 06:45:04'),
(1523, 'LGBGELLE045', 20, 900, '2012-12-31 00:00:00', 1, '2012-10-15 06:45:04'),
(1524, 'LGBGELLE046', 20, 900, '2012-12-31 00:00:00', 1, '2012-10-15 06:45:04'),
(1525, 'LGBGELLE047', 20, 900, '2012-12-31 00:00:00', 1, '2012-10-15 06:45:04'),
(1526, 'LGBGELLE048', 20, 900, '2012-12-31 00:00:00', 1, '2012-10-15 06:45:04'),
(1527, 'LGBGELLE049', 20, 900, '2012-12-31 00:00:00', 1, '2012-10-15 06:45:04'),
(1528, 'LGBGELLE050', 20, 900, '2012-12-31 00:00:00', 1, '2012-10-15 06:45:04'),
(1529, 'LGBGELLE051', 20, 900, '2012-12-31 00:00:00', 1, '2012-10-15 06:45:04'),
(1530, 'LGBGELLE052', 20, 900, '2012-12-31 00:00:00', 1, '2012-10-15 06:45:04'),
(1531, 'LGBGELLE053', 20, 900, '2012-12-31 00:00:00', 1, '2012-10-15 06:45:04'),
(1532, 'LGBGELLE054', 20, 900, '2012-12-31 00:00:00', 1, '2012-10-15 06:45:04'),
(1533, 'LGBGELLE055', 20, 900, '2012-12-31 00:00:00', 1, '2012-10-15 06:45:04'),
(1534, 'LGBGELLE056', 20, 900, '2012-12-31 00:00:00', 1, '2012-10-15 06:45:04'),
(1535, 'LGBGELLE057', 20, 900, '2012-12-31 00:00:00', 1, '2012-10-15 06:45:04'),
(1536, 'LGBGELLE058', 20, 900, '2012-12-31 00:00:00', 1, '2012-10-15 06:45:04'),
(1537, 'LGBGELLE059', 20, 900, '2012-12-31 00:00:00', 1, '2012-10-15 06:45:04'),
(1538, 'LGBGELLE060', 20, 900, '2012-12-31 00:00:00', 1, '2012-10-15 06:45:04'),
(1539, 'LGBGELLE061', 20, 900, '2012-12-31 00:00:00', 1, '2012-10-15 06:45:04'),
(1540, 'LGBGELLE062', 20, 900, '2012-12-31 00:00:00', 1, '2012-10-15 06:45:04'),
(1541, 'LGBGELLE063', 20, 900, '2012-12-31 00:00:00', 1, '2012-10-15 06:45:04'),
(1542, 'LGBGELLE064', 20, 900, '2012-12-31 00:00:00', 1, '2012-10-15 06:45:04'),
(1543, 'LGBGELLE065', 20, 900, '2012-12-31 00:00:00', 1, '2012-10-15 06:45:04'),
(1544, 'LGBGELLE066', 20, 900, '2012-12-31 00:00:00', 1, '2012-10-15 06:45:04'),
(1545, 'LGBGELLE067', 20, 900, '2012-12-31 00:00:00', 1, '2012-10-15 06:45:04'),
(1546, 'LGBGELLE068', 20, 900, '2012-12-31 00:00:00', 1, '2012-10-15 06:45:04'),
(1547, 'LGBGELLE069', 20, 900, '2012-12-31 00:00:00', 1, '2012-10-15 06:45:04'),
(1548, 'LGBGELLE070', 20, 900, '2012-12-31 00:00:00', 1, '2012-10-15 06:45:04'),
(1549, 'LGBGELLE071', 20, 900, '2012-12-31 00:00:00', 1, '2012-10-15 06:45:04'),
(1550, 'LGBGELLE072', 20, 900, '2012-12-31 00:00:00', 1, '2012-10-15 06:45:04'),
(1551, 'LGBGELLE073', 20, 900, '2012-12-31 00:00:00', 1, '2012-10-15 06:45:04'),
(1552, 'LGBGELLE074', 20, 900, '2012-12-31 00:00:00', 1, '2012-10-15 06:45:04'),
(1553, 'LGBGELLE075', 20, 900, '2012-12-31 00:00:00', 1, '2012-10-15 06:45:04'),
(1554, 'LGBGELLE076', 20, 900, '2012-12-31 00:00:00', 1, '2012-10-15 06:45:04'),
(1555, 'LGBGELLE077', 20, 900, '2012-12-31 00:00:00', 1, '2012-10-15 06:45:04'),
(1556, 'LGBGELLE078', 20, 900, '2012-12-31 00:00:00', 1, '2012-10-15 06:45:04'),
(1557, 'LGBGELLE079', 20, 900, '2012-12-31 00:00:00', 1, '2012-10-15 06:45:04'),
(1558, 'LGBGELLE080', 20, 900, '2012-12-31 00:00:00', 1, '2012-10-15 06:45:04'),
(1559, 'LGBGELLE081', 20, 900, '2012-12-31 00:00:00', 1, '2012-10-15 06:45:04'),
(1560, 'LGBGELLE082', 20, 900, '2012-12-31 00:00:00', 1, '2012-10-15 06:45:04'),
(1561, 'LGBGELLE083', 20, 900, '2012-12-31 00:00:00', 1, '2012-10-15 06:45:04'),
(1562, 'LGBGELLE084', 20, 900, '2012-12-31 00:00:00', 1, '2012-10-15 06:45:04'),
(1563, 'LGBGELLE085', 20, 900, '2012-12-31 00:00:00', 1, '2012-10-15 06:45:04'),
(1564, 'LGBGELLE086', 20, 900, '2012-12-31 00:00:00', 1, '2012-10-15 06:45:04'),
(1565, 'LGBGELLE087', 20, 900, '2012-12-31 00:00:00', 1, '2012-10-15 06:45:04'),
(1566, 'LGBGELLE088', 20, 900, '2012-12-31 00:00:00', 1, '2012-10-15 06:45:04'),
(1567, 'LGBGELLE089', 20, 900, '2012-12-31 00:00:00', 1, '2012-10-15 06:45:04'),
(1568, 'LGBGELLE090', 20, 900, '2012-12-31 00:00:00', 1, '2012-10-15 06:45:04'),
(1569, 'LGBGELLE091', 20, 900, '2012-12-31 00:00:00', 1, '2012-10-15 06:45:04'),
(1570, 'LGBGELLE092', 20, 900, '2012-12-31 00:00:00', 1, '2012-10-15 06:45:04'),
(1571, 'LGBGELLE093', 20, 900, '2012-12-31 00:00:00', 1, '2012-10-15 06:45:04'),
(1572, 'LGBGELLE094', 20, 900, '2012-12-31 00:00:00', 1, '2012-10-15 06:45:04'),
(1573, 'LGBGELLE095', 20, 900, '2012-12-31 00:00:00', 1, '2012-10-15 06:45:04'),
(1574, 'LGBGELLE096', 20, 900, '2012-12-31 00:00:00', 1, '2012-10-15 06:45:04'),
(1575, 'LGBGELLE097', 20, 900, '2012-12-31 00:00:00', 1, '2012-10-15 06:45:04'),
(1576, 'LGBGELLE098', 20, 900, '2012-12-31 00:00:00', 1, '2012-10-15 06:45:04'),
(1577, 'LGBGELLE099', 20, 900, '2012-12-31 00:00:00', 1, '2012-10-15 06:45:04'),
(1578, 'LGBGELLE100', 20, 900, '2012-12-31 00:00:00', 1, '2012-10-15 06:45:04'),
(1579, '15JBCB3', 21, 999, '2012-11-16 00:00:00', 1, '2012-10-16 05:13:27'),
(1580, '25J85DJ', 21, 999, '2012-11-16 00:00:00', 1, '2012-10-16 05:13:27'),
(1581, '25OBJ33', 21, 999, '2012-11-16 00:00:00', 1, '2012-10-16 05:13:27'),
(1582, '45JBBJD', 21, 999, '2012-11-16 00:00:00', 1, '2012-10-16 05:13:27'),
(1583, '45OBQC3', 21, 999, '2012-11-16 00:00:00', 1, '2012-10-16 05:13:27'),
(1584, '4DBJ5CC', 21, 999, '2012-11-16 00:00:00', 1, '2012-10-16 05:13:27'),
(1585, '4DQ3WWO', 21, 999, '2012-11-16 00:00:00', 1, '2012-10-16 05:13:27'),
(1586, '9DB88WO', 21, 999, '2012-11-16 00:00:00', 1, '2012-10-16 05:13:27'),
(1587, 'ADBJBJQ', 21, 999, '2012-11-16 00:00:00', 1, '2012-10-16 05:13:27'),
(1588, 'ADQC53J', 21, 999, '2012-11-16 00:00:00', 1, '2012-10-16 05:13:27'),
(1589, 'E5O8O83', 21, 999, '2012-11-16 00:00:00', 1, '2012-10-16 05:13:27'),
(1590, 'FDQ38WD', 21, 999, '2012-11-16 00:00:00', 1, '2012-10-16 05:13:27'),
(1591, 'I5J8BJW', 21, 999, '2012-11-16 00:00:00', 1, '2012-10-16 05:13:27'),
(1592, 'I5OWJDW', 21, 999, '2012-11-16 00:00:00', 1, '2012-10-16 05:13:27'),
(1593, 'KDQCJ55', 21, 999, '2012-11-16 00:00:00', 1, '2012-10-16 05:13:27'),
(1594, 'M5JJBJ8', 21, 999, '2012-11-16 00:00:00', 1, '2012-10-16 05:13:27'),
(1595, 'M5OCCWQ', 21, 999, '2012-11-16 00:00:00', 1, '2012-10-16 05:13:27'),
(1596, 'MCCOB8C', 21, 999, '2012-11-16 00:00:00', 1, '2012-10-16 05:13:27'),
(1597, 'NDQC3W3', 21, 999, '2012-11-16 00:00:00', 1, '2012-10-16 05:13:27'),
(1598, 'NO5D8DC', 21, 999, '2012-11-16 00:00:00', 1, '2012-10-16 05:13:27'),
(1599, 'P5W535O', 21, 999, '2012-11-16 00:00:00', 1, '2012-10-16 05:13:27'),
(1600, 'PD8WWBQ', 21, 999, '2012-11-16 00:00:00', 1, '2012-10-16 05:13:27'),
(1601, 'S5J8CB8', 21, 999, '2012-11-16 00:00:00', 1, '2012-10-16 05:13:27'),
(1602, 'S5OWD3O', 21, 999, '2012-11-16 00:00:00', 1, '2012-10-16 05:13:27'),
(1603, 'U5OWC58', 21, 999, '2012-11-16 00:00:00', 1, '2012-10-16 05:13:27'),
(1604, 'V5O8BQ8', 21, 999, '2012-11-16 00:00:00', 1, '2012-10-16 05:13:27'),
(1605, 'X5JJCWQ', 21, 999, '2012-11-16 00:00:00', 1, '2012-10-16 05:13:27'),
(1606, 'XODDOWD', 21, 999, '2012-11-16 00:00:00', 1, '2012-10-16 05:13:27'),
(1607, 'Y5JJ55C', 21, 999, '2012-11-16 00:00:00', 1, '2012-10-16 05:13:27'),
(1608, 'ZDQQOJ5', 21, 999, '2012-11-16 00:00:00', 1, '2012-10-16 05:13:27'),
(1609, 'abc1', 22, 0, '2012-12-05 00:00:00', 1, '2012-10-26 13:51:12'),
(1610, 'abc2', 22, 0, '2012-12-05 00:00:00', 1, '2012-10-26 13:51:12'),
(1611, 'abc3', 22, 0, '2012-12-05 00:00:00', 1, '2012-10-26 13:51:12'),
(1612, 'abc4', 22, 0, '2012-12-05 00:00:00', 1, '2012-10-26 13:51:12'),
(1613, 'abc5', 22, 0, '2012-12-05 00:00:00', 1, '2012-10-26 13:51:12'),
(1614, 'efg1', 23, 300, '2012-08-25 00:00:00', 1, '2012-10-26 13:51:14'),
(1615, 'efg2', 23, 300, '2012-08-25 00:00:00', 1, '2012-10-26 13:51:14'),
(1616, 'efg3', 23, 300, '2012-08-25 00:00:00', 1, '2012-10-26 13:51:14'),
(1617, 'efg4', 23, 300, '2012-08-25 00:00:00', 1, '2012-10-26 13:51:14'),
(1618, 'efg5', 23, 300, '2012-08-25 00:00:00', 1, '2012-10-26 13:51:14'),
(1619, 'abc1', 24, 0, '2012-12-05 00:00:00', 1, '2012-10-26 13:51:37'),
(1620, 'abc2', 24, 0, '2012-12-05 00:00:00', 1, '2012-10-26 13:51:37'),
(1621, 'abc3', 24, 0, '2012-12-05 00:00:00', 1, '2012-10-26 13:51:37'),
(1622, 'abc4', 24, 0, '2012-12-05 00:00:00', 1, '2012-10-26 13:51:37'),
(1623, 'abc5', 24, 0, '2012-12-05 00:00:00', 1, '2012-10-26 13:51:37'),
(1624, 'efg1', 25, 300, '2012-08-25 00:00:00', 1, '2012-10-26 13:51:38'),
(1625, 'efg2', 25, 300, '2012-08-25 00:00:00', 1, '2012-10-26 13:51:38'),
(1626, 'efg3', 25, 300, '2012-08-25 00:00:00', 1, '2012-10-26 13:51:38'),
(1627, 'efg4', 25, 300, '2012-08-25 00:00:00', 1, '2012-10-26 13:51:38'),
(1628, 'efg5', 25, 300, '2012-08-25 00:00:00', 1, '2012-10-26 13:51:38');

-- --------------------------------------------------------

--
-- Table structure for table `ps_access`
--

CREATE TABLE IF NOT EXISTS `ps_access` (
  `id_profile` int(10) unsigned NOT NULL,
  `id_tab` int(10) unsigned NOT NULL,
  `view` int(11) NOT NULL,
  `add` int(11) NOT NULL,
  `edit` int(11) NOT NULL,
  `delete` int(11) NOT NULL,
  PRIMARY KEY (`id_profile`,`id_tab`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ps_accessory`
--

CREATE TABLE IF NOT EXISTS `ps_accessory` (
  `id_product_1` int(64) unsigned NOT NULL,
  `id_product_2` int(64) unsigned NOT NULL,
  PRIMARY KEY (`id_product_1`,`id_product_2`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ps_address`
--

CREATE TABLE IF NOT EXISTS `ps_address` (
  `id_address` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_country` int(10) unsigned NOT NULL,
  `id_state` int(10) unsigned DEFAULT NULL,
  `state` varchar(128) NOT NULL,
  `id_customer` int(64) unsigned NOT NULL DEFAULT '0',
  `id_user` int(64) NOT NULL,
  `id_manufacturer` int(10) unsigned NOT NULL DEFAULT '0',
  `id_supplier` int(10) unsigned NOT NULL DEFAULT '0',
  `alias` varchar(32) NOT NULL,
  `company` varchar(32) DEFAULT NULL,
  `lastname` varchar(32) NOT NULL,
  `firstname` varchar(32) NOT NULL,
  `address1` varchar(128) NOT NULL,
  `email` varchar(128) DEFAULT NULL,
  `postcode` varchar(12) DEFAULT NULL,
  `city` varchar(64) NOT NULL,
  `other` text,
  `phone` varchar(16) DEFAULT NULL,
  `phone_mobile` varchar(16) DEFAULT NULL,
  `vat_number` varchar(32) DEFAULT NULL,
  `dni` varchar(16) DEFAULT NULL,
  `date_add` datetime NOT NULL,
  `date_upd` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `active` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `deleted` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_user`),
  UNIQUE KEY `id_address` (`id_address`),
  KEY `address_customer` (`id_customer`),
  KEY `id_country` (`id_country`),
  KEY `id_state` (`id_state`),
  KEY `id_manufacturer` (`id_manufacturer`),
  KEY `id_supplier` (`id_supplier`),
  KEY `id_customer` (`id_customer`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=25 ;

--
-- Dumping data for table `ps_address`
--

INSERT INTO `ps_address` (`id_address`, `id_country`, `id_state`, `state`, `id_customer`, `id_user`, `id_manufacturer`, `id_supplier`, `alias`, `company`, `lastname`, `firstname`, `address1`, `email`, `postcode`, `city`, `other`, `phone`, `phone_mobile`, `vat_number`, `dni`, `date_add`, `date_upd`, `active`, `deleted`) VALUES
(22, 0, NULL, '', 0, 25, 0, 0, '', NULL, 'Gupta', 'Ashima', '', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, '2012-10-15 15:49:24', '2012-10-15 10:19:24', 1, 0),
(6, 0, NULL, '', 0, 26, 0, 0, '', NULL, 'Ibin', 'Sirin', '', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, '2012-10-09 10:42:51', '2012-10-09 10:42:51', 1, 0),
(7, 0, NULL, '', 0, 27, 0, 0, '', NULL, 'Someshwar', 'Ravi', '', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, '2012-10-09 10:58:51', '2012-10-09 10:58:51', 1, 0),
(4, 0, NULL, 'Haryana', 0, 28, 0, 0, '', NULL, 'Singh', 'Jaideep', 'G-301 ambience lagoon apartments', 'jaideep.singh.wg02@wharton.upenn.edu', '122001', 'gurgaon', NULL, '9818140869', NULL, NULL, NULL, '2012-10-09 08:14:57', '0000-00-00 00:00:00', 1, 0),
(2, 0, NULL, 'Uttar Pradesh', 0, 31, 0, 0, '', NULL, 'Sharma', 'Gaurav', '594 radhika vihar , mathura', 'instinct.iitk@gmail.com', '281001', 'Mathura', NULL, '8743990571', NULL, NULL, NULL, '2012-10-09 08:00:13', '2012-10-25 00:00:00', 1, 0),
(15, 0, NULL, '', 0, 32, 0, 0, '', NULL, 'Ibin', 'Sirin', '', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, '2012-10-12 11:15:47', '2012-10-12 11:15:47', 1, 0),
(12, 0, NULL, '', 0, 33, 0, 0, '', NULL, 'Someshwar', 'Ravi', '', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, '2012-10-10 10:53:24', '2012-10-10 10:53:24', 1, 0),
(24, 0, NULL, '', 0, 35, 0, 0, '', NULL, 'Singh', 'Jaideep', '', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, '2012-10-23 19:13:21', '2012-10-23 13:43:21', 1, 0),
(10, 0, NULL, '', 0, 37, 0, 0, '', NULL, 'King', 'UX', '', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, '2012-10-10 04:55:00', '2012-10-10 04:55:00', 1, 0),
(5, 0, NULL, '', 0, 38, 0, 0, '', NULL, 'Monga', 'Rakshit', '', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, '2012-10-09 10:39:36', '2012-10-09 10:39:36', 1, 0),
(8, 0, NULL, '', 0, 41, 0, 0, '', NULL, 'Bhatti', 'Jatinder', '', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, '2012-10-10 02:24:10', '2012-10-10 02:24:10', 1, 0),
(3, 0, NULL, '', 0, 42, 0, 0, '', NULL, 'Khera', 'Girish', '', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, '2012-10-09 08:13:19', '0000-00-00 00:00:00', 1, 0),
(9, 0, NULL, '', 0, 43, 0, 0, '', NULL, 'Datwani', 'Leena', '', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, '2012-10-10 03:45:00', '2012-10-10 03:45:00', 1, 0),
(11, 0, NULL, '', 0, 44, 0, 0, '', NULL, 'Pal', 'Ashish', '', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, '2012-10-10 10:08:13', '2012-10-10 10:08:13', 1, 0),
(13, 0, NULL, '', 0, 45, 0, 0, '', NULL, 'Malik', 'Shreya', '', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, '2012-10-11 05:51:43', '2012-10-11 05:51:43', 1, 0),
(14, 0, NULL, '', 0, 46, 0, 0, '', NULL, 'Thakore', 'Trivikram', '', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, '2012-10-11 11:47:01', '2012-10-11 11:47:01', 1, 0),
(16, 0, NULL, '', 0, 47, 0, 0, '', NULL, 'Pv', 'Ahamed', '', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, '2012-10-13 11:39:04', '2012-10-13 11:39:04', 1, 0),
(17, 0, NULL, '', 0, 48, 0, 0, '', NULL, 'Singh', 'Manish', '', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, '2012-10-13 21:35:48', '2012-10-13 21:35:48', 1, 0),
(18, 0, NULL, '', 0, 49, 0, 0, '', NULL, 'Sharma', 'Gaurav', '', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, '2012-10-15 05:00:31', '2012-10-15 05:00:31', 1, 0),
(19, 0, NULL, '', 0, 50, 0, 0, '', NULL, 'Joon', 'Ravi', '', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, '2012-10-15 14:55:28', '2012-10-15 09:25:28', 1, 0),
(20, 0, NULL, '', 0, 51, 0, 0, '', NULL, 'Misra', 'Prakhar', '', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, '2012-10-15 15:43:41', '2012-10-15 10:13:41', 1, 0),
(21, 0, NULL, '', 0, 52, 0, 0, '', NULL, 'Didwania', 'Gourav', '', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, '2012-10-15 15:48:08', '2012-10-15 10:18:08', 1, 0),
(23, 0, NULL, '', 0, 53, 0, 0, '', NULL, 'Shah', 'Seema', '', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, '2012-10-16 12:45:37', '2012-10-16 07:15:37', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `ps_address_format`
--

CREATE TABLE IF NOT EXISTS `ps_address_format` (
  `id_country` int(10) unsigned NOT NULL,
  `format` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id_country`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ps_alias`
--

CREATE TABLE IF NOT EXISTS `ps_alias` (
  `id_alias` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `alias` varchar(255) NOT NULL,
  `search` varchar(255) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_alias`),
  UNIQUE KEY `alias` (`alias`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ps_attachment`
--

CREATE TABLE IF NOT EXISTS `ps_attachment` (
  `id_attachment` int(64) unsigned NOT NULL AUTO_INCREMENT,
  `file` varchar(40) NOT NULL,
  `file_name` varchar(128) NOT NULL,
  `mime` varchar(128) NOT NULL,
  PRIMARY KEY (`id_attachment`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ps_attachment_lang`
--

CREATE TABLE IF NOT EXISTS `ps_attachment_lang` (
  `id_attachment` int(64) unsigned NOT NULL,
  `id_lang` int(10) unsigned NOT NULL,
  `name` varchar(32) DEFAULT NULL,
  `description` text,
  PRIMARY KEY (`id_attachment`,`id_lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ps_attribute`
--

CREATE TABLE IF NOT EXISTS `ps_attribute` (
  `id_attribute` int(64) unsigned NOT NULL AUTO_INCREMENT,
  `id_attribute_group` int(10) unsigned NOT NULL,
  `color` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id_attribute`),
  KEY `attribute_group` (`id_attribute_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ps_attribute_group`
--

CREATE TABLE IF NOT EXISTS `ps_attribute_group` (
  `id_attribute_group` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `is_color_group` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_attribute_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ps_attribute_group_lang`
--

CREATE TABLE IF NOT EXISTS `ps_attribute_group_lang` (
  `id_attribute_group` int(10) unsigned NOT NULL,
  `id_lang` int(10) unsigned NOT NULL,
  `name` varchar(128) NOT NULL,
  `public_name` varchar(64) NOT NULL,
  PRIMARY KEY (`id_attribute_group`,`id_lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ps_attribute_impact`
--

CREATE TABLE IF NOT EXISTS `ps_attribute_impact` (
  `id_attribute_impact` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_product` int(64) unsigned NOT NULL,
  `id_attribute` int(11) unsigned NOT NULL,
  `weight` float NOT NULL,
  `price` decimal(17,2) NOT NULL,
  PRIMARY KEY (`id_attribute_impact`),
  UNIQUE KEY `id_product` (`id_product`,`id_attribute`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ps_attribute_lang`
--

CREATE TABLE IF NOT EXISTS `ps_attribute_lang` (
  `id_attribute` int(10) unsigned NOT NULL,
  `id_lang` int(10) unsigned NOT NULL,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`id_attribute`,`id_lang`),
  KEY `id_lang` (`id_lang`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ps_brand`
--

CREATE TABLE IF NOT EXISTS `ps_brand` (
  `id_brand` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `brand_code` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `logo` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_add` datetime DEFAULT NULL,
  `date_upd` datetime DEFAULT NULL,
  PRIMARY KEY (`id_brand`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `ps_brand`
--

INSERT INTO `ps_brand` (`id_brand`, `name`, `brand_code`, `logo`, `date_add`, `date_upd`) VALUES
(1, 'b1', 'B1', NULL, '2012-10-21 19:12:19', '2012-10-21 19:41:58'),
(2, 'be', 'B1', NULL, '2012-10-21 19:40:10', '2012-10-21 19:40:10');

-- --------------------------------------------------------

--
-- Table structure for table `ps_carrier`
--

CREATE TABLE IF NOT EXISTS `ps_carrier` (
  `id_carrier` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_tax_rules_group` int(10) unsigned DEFAULT '0',
  `name` varchar(64) NOT NULL,
  `url` varchar(255) DEFAULT NULL,
  `active` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `deleted` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `shipping_handling` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `range_behavior` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `is_module` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `is_free` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `shipping_external` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `need_range` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `external_module_name` varchar(64) DEFAULT NULL,
  `shipping_method` int(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_carrier`),
  KEY `deleted` (`deleted`,`active`),
  KEY `id_tax_rules_group` (`id_tax_rules_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ps_carrier_group`
--

CREATE TABLE IF NOT EXISTS `ps_carrier_group` (
  `id_carrier` int(10) unsigned NOT NULL,
  `id_group` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_carrier`,`id_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ps_carrier_lang`
--

CREATE TABLE IF NOT EXISTS `ps_carrier_lang` (
  `id_carrier` int(10) unsigned NOT NULL,
  `id_lang` int(10) unsigned NOT NULL,
  `delay` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id_carrier`,`id_lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ps_carrier_zone`
--

CREATE TABLE IF NOT EXISTS `ps_carrier_zone` (
  `id_carrier` int(10) unsigned NOT NULL,
  `id_zone` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_carrier`,`id_zone`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ps_cart`
--

CREATE TABLE IF NOT EXISTS `ps_cart` (
  `id_cart` int(64) unsigned NOT NULL AUTO_INCREMENT,
  `id_carrier` int(10) unsigned NOT NULL,
  `id_lang` int(10) unsigned NOT NULL,
  `id_address_delivery` int(10) unsigned NOT NULL,
  `id_address_invoice` int(10) unsigned NOT NULL,
  `id_currency` int(10) unsigned NOT NULL,
  `id_customer` int(64) unsigned NOT NULL,
  `id_guest` int(10) unsigned NOT NULL,
  `secure_key` varchar(32) NOT NULL DEFAULT '-1',
  `recyclable` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `gift` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `gift_message` text,
  `date_add` datetime NOT NULL,
  `date_upd` datetime NOT NULL,
  PRIMARY KEY (`id_cart`),
  KEY `cart_customer` (`id_customer`),
  KEY `id_address_delivery` (`id_address_delivery`),
  KEY `id_address_invoice` (`id_address_invoice`),
  KEY `id_carrier` (`id_carrier`),
  KEY `id_lang` (`id_lang`),
  KEY `id_currency` (`id_currency`),
  KEY `id_guest` (`id_guest`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ps_cart_discount`
--

CREATE TABLE IF NOT EXISTS `ps_cart_discount` (
  `id_cart` int(64) unsigned NOT NULL,
  `id_discount` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_cart`,`id_discount`),
  KEY `id_discount` (`id_discount`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ps_cart_product`
--

CREATE TABLE IF NOT EXISTS `ps_cart_product` (
  `id_cart` int(64) unsigned NOT NULL,
  `id_product` int(64) unsigned NOT NULL,
  `id_product_attribute` int(64) unsigned NOT NULL DEFAULT '0',
  `quantity` int(10) unsigned NOT NULL DEFAULT '0',
  `date_add` datetime NOT NULL,
  PRIMARY KEY (`id_cart`,`id_product`,`id_product_attribute`),
  KEY `id_product_attribute` (`id_product_attribute`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ps_category`
--

CREATE TABLE IF NOT EXISTS `ps_category` (
  `id_category` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_parent` int(10) unsigned NOT NULL,
  `level_depth` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `nleft` int(10) unsigned NOT NULL DEFAULT '0',
  `nright` int(10) unsigned NOT NULL DEFAULT '0',
  `active` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `date_add` datetime NOT NULL,
  `date_upd` datetime NOT NULL,
  `position` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_category`),
  KEY `category_parent` (`id_parent`),
  KEY `nleftright` (`nleft`,`nright`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `ps_category`
--

INSERT INTO `ps_category` (`id_category`, `id_parent`, `level_depth`, `nleft`, `nright`, `active`, `date_add`, `date_upd`, `position`) VALUES
(1, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0),
(2, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0),
(3, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0);

-- --------------------------------------------------------

--
-- Table structure for table `ps_category_group`
--

CREATE TABLE IF NOT EXISTS `ps_category_group` (
  `id_category` int(10) unsigned NOT NULL,
  `id_group` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_category`,`id_group`),
  KEY `id_category` (`id_category`),
  KEY `id_group` (`id_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ps_category_lang`
--

CREATE TABLE IF NOT EXISTS `ps_category_lang` (
  `id_category` int(10) unsigned NOT NULL,
  `id_lang` int(10) unsigned NOT NULL,
  `name` varchar(128) NOT NULL,
  `description` text,
  `link_rewrite` varchar(128) NOT NULL,
  `meta_title` varchar(128) DEFAULT NULL,
  `meta_keywords` varchar(255) DEFAULT NULL,
  `meta_description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_category`),
  KEY `category_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ps_category_lang`
--

INSERT INTO `ps_category_lang` (`id_category`, `id_lang`, `name`, `description`, `link_rewrite`, `meta_title`, `meta_keywords`, `meta_description`) VALUES
(1, 0, 'Happy Birthday', '<p>(Updated)</p>\r\n<p>As you <strong>celebrate</strong> your day, I celebrate the beautiful friendship we share! Happy Birthday, dearest friend!</p>', '', NULL, NULL, NULL),
(2, 0, 'Gift To Charity', '<p>I''m sending a gift to charity for you. We''re both helping to make the world a little better and spread some happiness.</p>\r\n<p>Best,</p>', '', NULL, NULL, NULL),
(3, 0, 'Happy Diwali', 'This Diwali no fumes, no flames & no worries. Wish you a happy and safe diwali!', '', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ps_category_product`
--

CREATE TABLE IF NOT EXISTS `ps_category_product` (
  `id_category` int(10) unsigned NOT NULL,
  `id_product` int(64) unsigned NOT NULL,
  `position` int(10) unsigned NOT NULL DEFAULT '0',
  UNIQUE KEY `category_product_index` (`id_category`,`id_product`),
  KEY `id_product` (`id_product`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ps_category_product`
--

INSERT INTO `ps_category_product` (`id_category`, `id_product`, `position`) VALUES
(1, 1, 0),
(1, 2, 0),
(1, 3, 0),
(1, 4, 0),
(1, 5, 0),
(1, 6, 0),
(1, 7, 0),
(1, 9, 0),
(1, 11, 0),
(1, 12, 0),
(1, 13, 0),
(1, 22, 0),
(1, 23, 0),
(1, 24, 0),
(1, 25, 0),
(2, 8, 0),
(2, 10, 0),
(2, 19, 0),
(2, 20, 0),
(3, 21, 0);

-- --------------------------------------------------------

--
-- Table structure for table `ps_cms`
--

CREATE TABLE IF NOT EXISTS `ps_cms` (
  `id_cms` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_cms_category` int(10) unsigned NOT NULL,
  `position` int(10) unsigned NOT NULL DEFAULT '0',
  `active` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_cms`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ps_cms_category`
--

CREATE TABLE IF NOT EXISTS `ps_cms_category` (
  `id_cms_category` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_parent` int(10) unsigned NOT NULL,
  `level_depth` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `active` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `date_add` datetime NOT NULL,
  `date_upd` datetime NOT NULL,
  `position` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_cms_category`),
  KEY `category_parent` (`id_parent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ps_cms_category_lang`
--

CREATE TABLE IF NOT EXISTS `ps_cms_category_lang` (
  `id_cms_category` int(10) unsigned NOT NULL,
  `id_lang` int(10) unsigned NOT NULL,
  `name` varchar(128) NOT NULL,
  `description` text,
  `link_rewrite` varchar(128) NOT NULL,
  `meta_title` varchar(128) DEFAULT NULL,
  `meta_keywords` varchar(255) DEFAULT NULL,
  `meta_description` varchar(255) DEFAULT NULL,
  UNIQUE KEY `category_lang_index` (`id_cms_category`,`id_lang`),
  KEY `category_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ps_cms_lang`
--

CREATE TABLE IF NOT EXISTS `ps_cms_lang` (
  `id_cms` int(10) unsigned NOT NULL,
  `id_lang` int(10) unsigned NOT NULL,
  `meta_title` varchar(128) NOT NULL,
  `meta_description` varchar(255) DEFAULT NULL,
  `meta_keywords` varchar(255) DEFAULT NULL,
  `content` longtext,
  `link_rewrite` varchar(128) NOT NULL,
  PRIMARY KEY (`id_cms`,`id_lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ps_compare`
--

CREATE TABLE IF NOT EXISTS `ps_compare` (
  `id_compare` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_customer` int(64) unsigned NOT NULL,
  PRIMARY KEY (`id_compare`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ps_compare_product`
--

CREATE TABLE IF NOT EXISTS `ps_compare_product` (
  `id_compare` int(10) unsigned NOT NULL,
  `id_product` int(64) unsigned NOT NULL,
  `date_add` datetime NOT NULL,
  `date_upd` datetime NOT NULL,
  PRIMARY KEY (`id_compare`,`id_product`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ps_configuration`
--

CREATE TABLE IF NOT EXISTS `ps_configuration` (
  `id_configuration` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `value` text,
  `date_add` datetime NOT NULL,
  `date_upd` datetime NOT NULL,
  PRIMARY KEY (`id_configuration`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ps_configuration_lang`
--

CREATE TABLE IF NOT EXISTS `ps_configuration_lang` (
  `id_configuration` int(10) unsigned NOT NULL,
  `id_lang` int(10) unsigned NOT NULL,
  `value` text,
  `date_upd` datetime DEFAULT NULL,
  PRIMARY KEY (`id_configuration`,`id_lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ps_connections`
--

CREATE TABLE IF NOT EXISTS `ps_connections` (
  `id_connections` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_guest` int(10) unsigned NOT NULL,
  `id_page` int(10) unsigned NOT NULL,
  `ip_address` bigint(20) DEFAULT NULL,
  `date_add` datetime NOT NULL,
  `http_referer` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_connections`),
  KEY `id_guest` (`id_guest`),
  KEY `date_add` (`date_add`),
  KEY `id_page` (`id_page`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ps_connections_page`
--

CREATE TABLE IF NOT EXISTS `ps_connections_page` (
  `id_connections` int(10) unsigned NOT NULL,
  `id_page` int(10) unsigned NOT NULL,
  `time_start` datetime NOT NULL,
  `time_end` datetime DEFAULT NULL,
  PRIMARY KEY (`id_connections`,`id_page`,`time_start`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ps_connections_source`
--

CREATE TABLE IF NOT EXISTS `ps_connections_source` (
  `id_connections_source` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_connections` int(10) unsigned NOT NULL,
  `http_referer` varchar(255) DEFAULT NULL,
  `request_uri` varchar(255) DEFAULT NULL,
  `keywords` varchar(255) DEFAULT NULL,
  `date_add` datetime NOT NULL,
  PRIMARY KEY (`id_connections_source`),
  KEY `connections` (`id_connections`),
  KEY `orderby` (`date_add`),
  KEY `http_referer` (`http_referer`),
  KEY `request_uri` (`request_uri`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ps_contact`
--

CREATE TABLE IF NOT EXISTS `ps_contact` (
  `id_contact` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(128) NOT NULL,
  `customer_service` tinyint(1) NOT NULL DEFAULT '0',
  `position` tinyint(2) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_contact`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ps_contact_lang`
--

CREATE TABLE IF NOT EXISTS `ps_contact_lang` (
  `id_contact` int(10) unsigned NOT NULL,
  `id_lang` int(10) unsigned NOT NULL,
  `name` varchar(32) NOT NULL,
  `description` text,
  PRIMARY KEY (`id_contact`,`id_lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ps_country`
--

CREATE TABLE IF NOT EXISTS `ps_country` (
  `id_country` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_zone` int(10) unsigned NOT NULL,
  `id_currency` int(10) unsigned NOT NULL DEFAULT '0',
  `iso_code` varchar(3) NOT NULL,
  `call_ps` int(10) NOT NULL DEFAULT '0',
  `active` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `contains_states` tinyint(1) NOT NULL DEFAULT '0',
  `need_identification_number` tinyint(1) NOT NULL DEFAULT '0',
  `need_zip_code` tinyint(1) NOT NULL DEFAULT '1',
  `zip_code_format` varchar(12) NOT NULL DEFAULT '',
  `display_tax_label` tinyint(1) NOT NULL,
  PRIMARY KEY (`id_country`),
  KEY `country_iso_code` (`iso_code`),
  KEY `country_` (`id_zone`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ps_country_lang`
--

CREATE TABLE IF NOT EXISTS `ps_country_lang` (
  `id_country` int(10) unsigned NOT NULL,
  `id_lang` int(10) unsigned NOT NULL,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`id_country`,`id_lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ps_county`
--

CREATE TABLE IF NOT EXISTS `ps_county` (
  `id_county` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `id_state` int(11) NOT NULL,
  `active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id_county`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ps_county_zip_code`
--

CREATE TABLE IF NOT EXISTS `ps_county_zip_code` (
  `id_county` int(11) NOT NULL,
  `from_zip_code` int(11) NOT NULL,
  `to_zip_code` int(11) NOT NULL,
  PRIMARY KEY (`id_county`,`from_zip_code`,`to_zip_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ps_currency`
--

CREATE TABLE IF NOT EXISTS `ps_currency` (
  `id_currency` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `iso_code` varchar(3) NOT NULL DEFAULT '0',
  `iso_code_num` varchar(3) NOT NULL DEFAULT '0',
  `sign` varchar(8) NOT NULL,
  `blank` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `format` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `decimals` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `conversion_rate` decimal(13,6) NOT NULL,
  `deleted` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `active` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_currency`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ps_customer`
--

CREATE TABLE IF NOT EXISTS `ps_customer` (
  `id_customer` int(64) unsigned NOT NULL AUTO_INCREMENT,
  `id_gender` int(10) unsigned NOT NULL,
  `id_default_group` int(10) unsigned NOT NULL DEFAULT '1',
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(128) NOT NULL,
  `passwd` varchar(32) NOT NULL,
  `last_passwd_gen` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `birthday` date DEFAULT NULL,
  `newsletter` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ip_registration_newsletter` varchar(15) DEFAULT NULL,
  `newsletter_date_add` datetime DEFAULT NULL,
  `optin` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `secure_key` varchar(32) NOT NULL DEFAULT '-1',
  `note` text,
  `active` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `is_guest` tinyint(1) NOT NULL DEFAULT '0',
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `date_add` datetime NOT NULL,
  `date_upd` datetime NOT NULL,
  PRIMARY KEY (`id_customer`),
  KEY `customer_email` (`email`),
  KEY `customer_login` (`email`,`passwd`),
  KEY `id_customer_passwd` (`id_customer`,`passwd`),
  KEY `id_gender` (`id_gender`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `ps_customer`
--

INSERT INTO `ps_customer` (`id_customer`, `id_gender`, `id_default_group`, `firstname`, `lastname`, `email`, `passwd`, `last_passwd_gen`, `birthday`, `newsletter`, `ip_registration_newsletter`, `newsletter_date_add`, `optin`, `secure_key`, `note`, `active`, `is_guest`, `deleted`, `date_add`, `date_upd`) VALUES
(1, 0, 1, '', '', 'love.manish1@gmail.com', '', '2012-10-13 21:35:48', NULL, 0, NULL, NULL, 0, '-1', NULL, 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 0, 1, '', '', 'gaurav@leaveagift.com', '', '2012-10-15 05:00:31', NULL, 0, NULL, NULL, 0, '-1', NULL, 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, 0, 1, '', '', 'ravijoon52@gmail.com', '', '2012-10-15 09:25:28', NULL, 0, NULL, NULL, 0, '-1', NULL, 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4, 0, 1, '', '', 'prakhar.seriouslyfunny@gmail.com', '', '2012-10-15 10:13:41', NULL, 0, NULL, NULL, 0, '-1', NULL, 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5, 0, 1, '', '', 'didwania.gourav@gmail.com', '', '2012-10-15 10:18:08', NULL, 0, NULL, NULL, 0, '-1', NULL, 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(6, 0, 1, '', '', 'seemaxshah@gmail.com', '', '2012-10-16 07:15:37', NULL, 0, NULL, NULL, 0, '-1', NULL, 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `ps_customer_group`
--

CREATE TABLE IF NOT EXISTS `ps_customer_group` (
  `id_customer` int(64) unsigned NOT NULL,
  `id_group` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_customer`,`id_group`),
  KEY `customer_login` (`id_group`),
  KEY `id_customer` (`id_customer`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ps_customer_message`
--

CREATE TABLE IF NOT EXISTS `ps_customer_message` (
  `id_customer_message` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_customer_thread` int(11) DEFAULT NULL,
  `id_employee` int(10) unsigned DEFAULT NULL,
  `message` text NOT NULL,
  `file_name` varchar(18) DEFAULT NULL,
  `ip_address` int(11) DEFAULT NULL,
  `user_agent` varchar(128) DEFAULT NULL,
  `date_add` datetime NOT NULL,
  PRIMARY KEY (`id_customer_message`),
  KEY `id_customer_thread` (`id_customer_thread`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ps_customer_thread`
--

CREATE TABLE IF NOT EXISTS `ps_customer_thread` (
  `id_customer_thread` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_lang` int(10) unsigned NOT NULL,
  `id_contact` int(10) unsigned NOT NULL,
  `id_customer` int(64) unsigned DEFAULT NULL,
  `id_order` int(64) unsigned DEFAULT NULL,
  `id_product` int(64) unsigned DEFAULT NULL,
  `status` enum('open','closed','pending1','pending2') NOT NULL DEFAULT 'open',
  `email` varchar(128) NOT NULL,
  `token` varchar(12) DEFAULT NULL,
  `date_add` datetime NOT NULL,
  `date_upd` datetime NOT NULL,
  PRIMARY KEY (`id_customer_thread`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ps_customization`
--

CREATE TABLE IF NOT EXISTS `ps_customization` (
  `id_customization` int(64) unsigned NOT NULL AUTO_INCREMENT,
  `id_product_attribute` int(64) unsigned NOT NULL DEFAULT '0',
  `id_cart` int(64) unsigned NOT NULL,
  `id_product` int(64) NOT NULL,
  `quantity` int(10) NOT NULL,
  `quantity_refunded` int(11) NOT NULL DEFAULT '0',
  `quantity_returned` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_customization`,`id_cart`,`id_product`),
  KEY `id_product_attribute` (`id_product_attribute`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ps_customization_field`
--

CREATE TABLE IF NOT EXISTS `ps_customization_field` (
  `id_customization_field` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_product` int(64) unsigned NOT NULL,
  `type` tinyint(1) NOT NULL,
  `required` tinyint(1) NOT NULL,
  PRIMARY KEY (`id_customization_field`),
  KEY `id_product` (`id_product`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ps_customization_field_lang`
--

CREATE TABLE IF NOT EXISTS `ps_customization_field_lang` (
  `id_customization_field` int(10) unsigned NOT NULL,
  `id_lang` int(10) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id_customization_field`,`id_lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ps_customized_data`
--

CREATE TABLE IF NOT EXISTS `ps_customized_data` (
  `id_customization` int(10) unsigned NOT NULL,
  `type` tinyint(1) NOT NULL,
  `index` int(3) NOT NULL,
  `value` varchar(255) NOT NULL,
  PRIMARY KEY (`id_customization`,`type`,`index`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ps_date_range`
--

CREATE TABLE IF NOT EXISTS `ps_date_range` (
  `id_date_range` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `time_start` datetime NOT NULL,
  `time_end` datetime NOT NULL,
  PRIMARY KEY (`id_date_range`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ps_delivery`
--

CREATE TABLE IF NOT EXISTS `ps_delivery` (
  `id_delivery` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_carrier` int(10) unsigned NOT NULL,
  `id_range_price` int(10) unsigned DEFAULT NULL,
  `id_range_weight` int(10) unsigned DEFAULT NULL,
  `id_zone` int(10) unsigned NOT NULL,
  `price` decimal(20,6) NOT NULL,
  PRIMARY KEY (`id_delivery`),
  KEY `id_zone` (`id_zone`),
  KEY `id_carrier` (`id_carrier`,`id_zone`),
  KEY `id_range_price` (`id_range_price`),
  KEY `id_range_weight` (`id_range_weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ps_discount`
--

CREATE TABLE IF NOT EXISTS `ps_discount` (
  `id_discount` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_discount_type` int(10) unsigned NOT NULL,
  `behavior_not_exhausted` tinyint(3) DEFAULT '1',
  `id_customer` int(64) unsigned NOT NULL,
  `id_group` int(10) unsigned NOT NULL DEFAULT '0',
  `id_currency` int(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(32) NOT NULL,
  `value` decimal(17,2) NOT NULL DEFAULT '0.00',
  `quantity` int(10) unsigned NOT NULL DEFAULT '0',
  `quantity_per_user` int(10) unsigned NOT NULL DEFAULT '1',
  `cumulable` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `cumulable_reduction` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `date_from` datetime NOT NULL,
  `date_to` datetime NOT NULL,
  `minimal` decimal(17,2) DEFAULT NULL,
  `include_tax` tinyint(1) NOT NULL DEFAULT '0',
  `active` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `cart_display` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `date_add` datetime NOT NULL,
  `date_upd` datetime NOT NULL,
  PRIMARY KEY (`id_discount`),
  KEY `discount_name` (`name`),
  KEY `discount_customer` (`id_customer`),
  KEY `id_discount_type` (`id_discount_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ps_discount_category`
--

CREATE TABLE IF NOT EXISTS `ps_discount_category` (
  `id_category` int(11) unsigned NOT NULL,
  `id_discount` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id_category`,`id_discount`),
  KEY `discount` (`id_discount`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ps_discount_lang`
--

CREATE TABLE IF NOT EXISTS `ps_discount_lang` (
  `id_discount` int(10) unsigned NOT NULL,
  `id_lang` int(10) unsigned NOT NULL,
  `description` text,
  PRIMARY KEY (`id_discount`,`id_lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ps_discount_type`
--

CREATE TABLE IF NOT EXISTS `ps_discount_type` (
  `id_discount_type` int(10) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id_discount_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ps_discount_type_lang`
--

CREATE TABLE IF NOT EXISTS `ps_discount_type_lang` (
  `id_discount_type` int(10) unsigned NOT NULL,
  `id_lang` int(10) unsigned NOT NULL,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`id_discount_type`,`id_lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ps_employee`
--

CREATE TABLE IF NOT EXISTS `ps_employee` (
  `id_employee` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_profile` int(10) unsigned NOT NULL,
  `id_lang` int(10) unsigned NOT NULL DEFAULT '0',
  `lastname` varchar(32) NOT NULL,
  `firstname` varchar(32) NOT NULL,
  `email` varchar(128) NOT NULL,
  `passwd` varchar(32) NOT NULL,
  `last_passwd_gen` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `stats_date_from` date DEFAULT NULL,
  `stats_date_to` date DEFAULT NULL,
  `bo_color` varchar(32) DEFAULT NULL,
  `bo_theme` varchar(32) DEFAULT NULL,
  `bo_uimode` enum('hover','click') DEFAULT 'click',
  `bo_show_screencast` tinyint(1) NOT NULL DEFAULT '1',
  `active` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_employee`),
  KEY `employee_login` (`email`,`passwd`),
  KEY `id_employee_passwd` (`id_employee`,`passwd`),
  KEY `id_profile` (`id_profile`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ps_feature`
--

CREATE TABLE IF NOT EXISTS `ps_feature` (
  `id_feature` int(10) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id_feature`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ps_feature_lang`
--

CREATE TABLE IF NOT EXISTS `ps_feature_lang` (
  `id_feature` int(10) unsigned NOT NULL,
  `id_lang` int(10) unsigned NOT NULL,
  `name` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id_feature`,`id_lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ps_feature_product`
--

CREATE TABLE IF NOT EXISTS `ps_feature_product` (
  `id_feature` int(10) unsigned NOT NULL,
  `id_product` int(64) unsigned NOT NULL,
  `id_feature_value` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_feature`,`id_product`),
  KEY `id_feature_value` (`id_feature_value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ps_feature_product`
--

INSERT INTO `ps_feature_product` (`id_feature`, `id_product`, `id_feature_value`) VALUES
(3, 1, 1),
(3, 2, 2),
(3, 3, 3),
(3, 4, 4),
(3, 5, 5),
(3, 6, 6),
(3, 7, 7),
(3, 8, 8),
(3, 9, 9),
(3, 10, 10),
(3, 11, 11),
(3, 12, 12),
(3, 13, 13),
(3, 14, 14),
(3, 15, 15),
(3, 16, 16),
(3, 17, 17),
(3, 18, 18),
(3, 19, 19),
(3, 20, 20),
(3, 21, 21),
(3, 22, 22),
(3, 23, 23),
(3, 24, 24),
(3, 25, 25);

-- --------------------------------------------------------

--
-- Table structure for table `ps_feature_value`
--

CREATE TABLE IF NOT EXISTS `ps_feature_value` (
  `id_feature_value` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_feature` int(10) unsigned NOT NULL,
  `custom` tinyint(3) unsigned DEFAULT NULL,
  PRIMARY KEY (`id_feature_value`),
  KEY `feature` (`id_feature`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=26 ;

--
-- Dumping data for table `ps_feature_value`
--

INSERT INTO `ps_feature_value` (`id_feature_value`, `id_feature`, `custom`) VALUES
(1, 3, NULL),
(2, 3, NULL),
(3, 3, NULL),
(4, 3, NULL),
(5, 3, NULL),
(6, 3, NULL),
(7, 3, NULL),
(8, 3, NULL),
(9, 3, NULL),
(10, 3, NULL),
(11, 3, NULL),
(12, 3, NULL),
(13, 3, NULL),
(14, 3, NULL),
(15, 3, NULL),
(16, 3, NULL),
(17, 3, NULL),
(18, 3, NULL),
(19, 3, NULL),
(20, 3, NULL),
(21, 3, NULL),
(22, 3, NULL),
(23, 3, NULL),
(24, 3, NULL),
(25, 3, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ps_feature_value_lang`
--

CREATE TABLE IF NOT EXISTS `ps_feature_value_lang` (
  `id_feature_value` int(10) unsigned NOT NULL,
  `id_lang` int(10) unsigned NOT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_feature_value`,`id_lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ps_feature_value_lang`
--

INSERT INTO `ps_feature_value_lang` (`id_feature_value`, `id_lang`, `value`) VALUES
(1, 0, 'The gift card voucher can be used as cash at beStylish.com '),
(2, 0, 'The gift card voucher can be used as cash at healthkart.com \r\n'),
(3, 0, 'The gift card voucher can be used as cash at beStylish.com \r\n'),
(4, 0, 'The gift card voucher can be used as cash at gkboptical.com \r\n'),
(5, 0, 'The gift card voucher can be used as cash at healthkart.com \r\n'),
(6, 0, 'The gift card voucher can be used as cash at healthkart.com \r\n'),
(7, 0, 'The gift card voucher can be used as cash at gkboptical.com \r\n'),
(8, 0, 'For every gift you send Papa CJ and LeaveAGift together will donate Rs 400 to Child One.'),
(9, 0, 'The gift card can be redeemed only at PVR website.'),
(10, 0, 'For every gift you send, LeaveAGift will donate Rs. 700 to Satyamev Jayate.'),
(11, 0, 'Gift Card can be redeemed online only.'),
(12, 0, 'The gift card voucher can be used as cash at kamahoo.com \r\n'),
(13, 0, 'The gift card can be used as cash to order Pure Mischief at Kamahoo.com'),
(14, 0, 'The amount donated will be used for better breast health in India by The Ogaan Cancer Foundation.'),
(15, 0, 'The amount donated will be used for better breast health in India by The Ogaan Cancer Foundation.'),
(16, 0, 'The amount donated will be used for better breast health in India by The Ogaan Cancer Foundation.'),
(17, 0, 'The amount donated will be used for better breast health in India by The Ogaan Cancer Foundation.'),
(18, 0, 'The amount donated will be used for better breast health in India by The Ogaan Cancer Foundation.'),
(19, 0, 'The amount donated will be used for better breast health in India by The Ogaan Cancer Foundation.'),
(20, 0, 'The amount donated will be used for better breast health in India by The Ogaan Cancer Foundation.'),
(21, 0, 'The gift card voucher can be used as cash to order a pair of Philips Led Candles worth Rs. 998.\r\n'),
(22, 0, 'The gift card voucher can be used as cash at healthkart.com \r\n'),
(23, 0, 'The gift card voucher can be used as cash at healthkart.com \r\n'),
(24, 0, 'The gift card voucher can be used as cash at healthkart.com \r\n'),
(25, 0, 'The gift card voucher can be used as cash at healthkart.com \r\n');

-- --------------------------------------------------------

--
-- Table structure for table `ps_group`
--

CREATE TABLE IF NOT EXISTS `ps_group` (
  `id_group` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `reduction` decimal(17,2) NOT NULL DEFAULT '0.00',
  `price_display_method` tinyint(4) NOT NULL DEFAULT '0',
  `date_add` datetime NOT NULL,
  `date_upd` datetime NOT NULL,
  PRIMARY KEY (`id_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ps_group_lang`
--

CREATE TABLE IF NOT EXISTS `ps_group_lang` (
  `id_group` int(10) unsigned NOT NULL,
  `id_lang` int(10) unsigned NOT NULL,
  `name` varchar(32) NOT NULL,
  PRIMARY KEY (`id_group`,`id_lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ps_group_reduction`
--

CREATE TABLE IF NOT EXISTS `ps_group_reduction` (
  `id_group_reduction` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `id_group` int(10) unsigned NOT NULL,
  `id_category` int(10) unsigned NOT NULL,
  `reduction` decimal(4,3) NOT NULL,
  PRIMARY KEY (`id_group_reduction`),
  UNIQUE KEY `id_group` (`id_group`,`id_category`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ps_guest`
--

CREATE TABLE IF NOT EXISTS `ps_guest` (
  `id_guest` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_operating_system` int(10) unsigned DEFAULT NULL,
  `id_web_browser` int(10) unsigned DEFAULT NULL,
  `id_customer` int(64) unsigned DEFAULT NULL,
  `javascript` tinyint(1) DEFAULT '0',
  `screen_resolution_x` smallint(5) unsigned DEFAULT NULL,
  `screen_resolution_y` smallint(5) unsigned DEFAULT NULL,
  `screen_color` tinyint(3) unsigned DEFAULT NULL,
  `sun_java` tinyint(1) DEFAULT NULL,
  `adobe_flash` tinyint(1) DEFAULT NULL,
  `adobe_director` tinyint(1) DEFAULT NULL,
  `apple_quicktime` tinyint(1) DEFAULT NULL,
  `real_player` tinyint(1) DEFAULT NULL,
  `windows_media` tinyint(1) DEFAULT NULL,
  `accept_language` varchar(8) DEFAULT NULL,
  PRIMARY KEY (`id_guest`),
  KEY `id_customer` (`id_customer`),
  KEY `id_operating_system` (`id_operating_system`),
  KEY `id_web_browser` (`id_web_browser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ps_help_access`
--

CREATE TABLE IF NOT EXISTS `ps_help_access` (
  `id_help_access` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(45) NOT NULL,
  `version` varchar(8) NOT NULL,
  PRIMARY KEY (`id_help_access`),
  UNIQUE KEY `label` (`label`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ps_hook`
--

CREATE TABLE IF NOT EXISTS `ps_hook` (
  `id_hook` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `title` varchar(64) NOT NULL,
  `description` text,
  `position` tinyint(1) NOT NULL DEFAULT '1',
  `live_edit` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_hook`),
  UNIQUE KEY `hook_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ps_hook_module`
--

CREATE TABLE IF NOT EXISTS `ps_hook_module` (
  `id_module` int(10) unsigned NOT NULL,
  `id_hook` int(10) unsigned NOT NULL,
  `position` tinyint(2) unsigned NOT NULL,
  PRIMARY KEY (`id_module`,`id_hook`),
  KEY `id_hook` (`id_hook`),
  KEY `id_module` (`id_module`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ps_hook_module_exceptions`
--

CREATE TABLE IF NOT EXISTS `ps_hook_module_exceptions` (
  `id_hook_module_exceptions` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_module` int(10) unsigned NOT NULL,
  `id_hook` int(10) unsigned NOT NULL,
  `file_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_hook_module_exceptions`),
  KEY `id_module` (`id_module`),
  KEY `id_hook` (`id_hook`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ps_image`
--

CREATE TABLE IF NOT EXISTS `ps_image` (
  `id_image` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `filename` varchar(200) NOT NULL,
  `id_product` int(64) unsigned NOT NULL,
  `position` smallint(2) unsigned NOT NULL DEFAULT '0',
  `cover` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_image`),
  KEY `image_product` (`id_product`),
  KEY `id_product_cover` (`id_product`,`cover`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=64 ;

--
-- Dumping data for table `ps_image`
--

INSERT INTO `ps_image` (`id_image`, `filename`, `id_product`, `position`, `cover`) VALUES
(4, 'bestylish_smal.png1199138.png', 1, 0, 0),
(5, 'bestylish.jpg1280199.jpg', 1, 1, 0),
(8, 'healthkart_small.jpg2199138.jpg', 2, 0, 0),
(9, 'healthkart.jpg2280199.jpg', 2, 1, 0),
(12, 'bestylish_small_a.png3199138.png', 3, 0, 0),
(13, 'bestylish_a.jpg3280199.jpg', 3, 1, 0),
(16, 'gkbsmall150.png4199138.png', 4, 0, 0),
(17, 'gkblarge150.jpg4280199.jpg', 4, 1, 0),
(20, 'gkbsmall2000.png5199138.png', 5, 0, 0),
(21, 'gkblarge2000.jpg5280199.jpg', 5, 1, 0),
(24, 'healthkart_b-small.jpg6199138.jpg', 6, 0, 0),
(25, 'healthkart_b.jpg6280199.jpg', 6, 1, 0),
(28, 'gkb_small_a.png7199138.png', 7, 0, 0),
(29, 'gkb.png7280199.png', 7, 1, 0),
(34, 'papacj_small.png8199138.png', 8, 0, 0),
(35, 'papacj.jpg8280199.jpg', 8, 1, 0),
(36, 'flipkart_small_b.png9199138.png', 9, 0, 0),
(37, 'flipkart_b.jpg9280199.jpg', 9, 1, 0),
(40, 'satyamev_jayte_small_a.png10199138.png', 10, 0, 0),
(41, 'satyamev_jayte_a.png10280199.png', 10, 1, 0),
(44, 'pvr small.png11199138.png', 11, 0, 0),
(45, 'pvr big.jpg11280199.jpg', 11, 1, 0),
(46, 'kamahoo_small.jpg13199138.jpg12199199.jpg', 12, 0, 0),
(47, 'kamahoo_small.jpg13199138.jpg12280199.jpg', 12, 1, 0),
(48, 'kamahoo_small_a.jpg14199138.jpg13199199.jpg', 13, 0, 0),
(49, 'kamahoo_small_a.jpg14199138.jpg13280199.jpg', 13, 1, 0),
(50, 'best chrits.jpg18199138.jpg19199199.jpg', 19, 0, 0),
(51, 'best chrits.jpg18199138.jpg19280199.jpg', 19, 1, 0),
(52, 'best chrits.jpg18199138.jpg20199199.jpg', 20, 0, 0),
(53, 'best chrits.jpg18199138.jpg20280199.jpg', 20, 1, 0),
(54, 'bulbtigersmall.jpg2199138.jpg21199199.jpg', 21, 0, 0),
(55, 'bulbtigersmall.jpg2199138.jpg21280199.jpg', 21, 1, 0),
(56, 'healthkart_small.jpg3199138.jpg22199199.jpg', 22, 0, 0),
(57, 'healthkart_small.jpg3199138.jpg22280199.jpg', 22, 1, 0),
(58, 'healthkart_small.jpg3199138.jpg23199199.jpg', 23, 0, 0),
(59, 'healthkart_small.jpg3199138.jpg23280199.jpg', 23, 1, 0),
(60, 'healthkart_small.jpg3199138.jpg24199199.jpg', 24, 0, 0),
(61, 'healthkart_small.jpg3199138.jpg24280199.jpg', 24, 1, 0),
(62, 'healthkart_small.jpg3199138.jpg25199199.jpg', 25, 0, 0),
(63, 'healthkart_small.jpg3199138.jpg25280199.jpg', 25, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `ps_image_lang`
--

CREATE TABLE IF NOT EXISTS `ps_image_lang` (
  `id_image` int(10) unsigned NOT NULL,
  `id_lang` int(10) unsigned NOT NULL,
  `legend` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id_image`,`id_lang`),
  KEY `id_image` (`id_image`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ps_image_type`
--

CREATE TABLE IF NOT EXISTS `ps_image_type` (
  `id_image_type` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(16) NOT NULL,
  `width` int(10) unsigned NOT NULL,
  `height` int(10) unsigned NOT NULL,
  `products` tinyint(1) NOT NULL DEFAULT '1',
  `categories` tinyint(1) NOT NULL DEFAULT '1',
  `manufacturers` tinyint(1) NOT NULL DEFAULT '1',
  `suppliers` tinyint(1) NOT NULL DEFAULT '1',
  `scenes` tinyint(1) NOT NULL DEFAULT '1',
  `stores` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_image_type`),
  KEY `image_type_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ps_import_match`
--

CREATE TABLE IF NOT EXISTS `ps_import_match` (
  `id_import_match` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `match` text NOT NULL,
  `skip` int(2) NOT NULL,
  PRIMARY KEY (`id_import_match`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ps_lang`
--

CREATE TABLE IF NOT EXISTS `ps_lang` (
  `id_lang` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `active` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `iso_code` char(2) NOT NULL,
  `language_code` char(5) NOT NULL,
  `date_format_lite` char(32) NOT NULL DEFAULT 'Y-m-d',
  `date_format_full` char(32) NOT NULL DEFAULT 'Y-m-d H:i:s',
  `is_rtl` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_lang`),
  KEY `lang_iso_code` (`iso_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ps_log`
--

CREATE TABLE IF NOT EXISTS `ps_log` (
  `id_log` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `severity` tinyint(1) NOT NULL,
  `error_code` int(11) DEFAULT NULL,
  `message` text NOT NULL,
  `object_type` varchar(32) DEFAULT NULL,
  `object_id` int(10) unsigned DEFAULT NULL,
  `date_add` datetime NOT NULL,
  `date_upd` datetime NOT NULL,
  PRIMARY KEY (`id_log`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ps_manufacturer`
--

CREATE TABLE IF NOT EXISTS `ps_manufacturer` (
  `id_manufacturer` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `date_add` datetime NOT NULL,
  `date_upd` datetime NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_manufacturer`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ps_manufacturer_lang`
--

CREATE TABLE IF NOT EXISTS `ps_manufacturer_lang` (
  `id_manufacturer` int(10) unsigned NOT NULL,
  `id_lang` int(10) unsigned NOT NULL,
  `description` text,
  `short_description` varchar(254) DEFAULT NULL,
  `meta_title` varchar(128) DEFAULT NULL,
  `meta_keywords` varchar(255) DEFAULT NULL,
  `meta_description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_manufacturer`,`id_lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ps_memcached_servers`
--

CREATE TABLE IF NOT EXISTS `ps_memcached_servers` (
  `id_memcached_server` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ip` varchar(254) NOT NULL,
  `port` int(11) unsigned NOT NULL,
  `weight` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id_memcached_server`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ps_message`
--

CREATE TABLE IF NOT EXISTS `ps_message` (
  `id_message` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_cart` int(64) unsigned DEFAULT NULL,
  `id_customer` int(64) unsigned NOT NULL,
  `id_employee` int(10) unsigned DEFAULT NULL,
  `id_order` int(64) unsigned NOT NULL,
  `message` text NOT NULL,
  `private` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `date_add` datetime NOT NULL,
  PRIMARY KEY (`id_message`),
  KEY `message_order` (`id_order`),
  KEY `id_cart` (`id_cart`),
  KEY `id_customer` (`id_customer`),
  KEY `id_employee` (`id_employee`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ps_message_readed`
--

CREATE TABLE IF NOT EXISTS `ps_message_readed` (
  `id_message` int(10) unsigned NOT NULL,
  `id_employee` int(10) unsigned NOT NULL,
  `date_add` datetime NOT NULL,
  PRIMARY KEY (`id_message`,`id_employee`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ps_meta`
--

CREATE TABLE IF NOT EXISTS `ps_meta` (
  `id_meta` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `page` varchar(64) NOT NULL,
  PRIMARY KEY (`id_meta`),
  KEY `meta_name` (`page`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ps_meta_lang`
--

CREATE TABLE IF NOT EXISTS `ps_meta_lang` (
  `id_meta` int(10) unsigned NOT NULL,
  `id_lang` int(10) unsigned NOT NULL,
  `title` varchar(128) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `keywords` varchar(255) DEFAULT NULL,
  `url_rewrite` varchar(254) NOT NULL,
  PRIMARY KEY (`id_meta`,`id_lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ps_module`
--

CREATE TABLE IF NOT EXISTS `ps_module` (
  `id_module` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `active` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_module`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ps_module_country`
--

CREATE TABLE IF NOT EXISTS `ps_module_country` (
  `id_module` int(10) unsigned NOT NULL,
  `id_country` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_module`,`id_country`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ps_module_currency`
--

CREATE TABLE IF NOT EXISTS `ps_module_currency` (
  `id_module` int(10) unsigned NOT NULL,
  `id_currency` int(11) NOT NULL,
  PRIMARY KEY (`id_module`,`id_currency`),
  KEY `id_module` (`id_module`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ps_module_group`
--

CREATE TABLE IF NOT EXISTS `ps_module_group` (
  `id_module` int(10) unsigned NOT NULL,
  `id_group` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id_module`,`id_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ps_operating_system`
--

CREATE TABLE IF NOT EXISTS `ps_operating_system` (
  `id_operating_system` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id_operating_system`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ps_orders`
--

CREATE TABLE IF NOT EXISTS `ps_orders` (
  `id_order` int(64) unsigned NOT NULL AUTO_INCREMENT,
  `id_carrier` int(10) unsigned NOT NULL,
  `id_lang` int(10) unsigned NOT NULL,
  `id_customer` int(64) unsigned NOT NULL,
  `id_cart` int(64) unsigned NOT NULL,
  `id_currency` int(10) unsigned NOT NULL,
  `id_address_delivery` int(10) unsigned NOT NULL,
  `id_address_invoice` int(10) unsigned NOT NULL,
  `secure_key` varchar(32) NOT NULL DEFAULT '-1',
  `payment` varchar(255) NOT NULL,
  `conversion_rate` decimal(13,6) NOT NULL DEFAULT '1.000000',
  `module` varchar(255) DEFAULT NULL,
  `recyclable` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `gift` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `gift_message` text,
  `shipping_number` varchar(32) DEFAULT NULL,
  `total_discounts` decimal(17,2) NOT NULL DEFAULT '0.00',
  `total_paid` decimal(17,2) NOT NULL DEFAULT '0.00',
  `total_paid_real` decimal(17,2) NOT NULL DEFAULT '0.00',
  `total_products` decimal(17,2) NOT NULL DEFAULT '0.00',
  `total_products_wt` decimal(17,2) NOT NULL DEFAULT '0.00',
  `total_shipping` decimal(17,2) NOT NULL DEFAULT '0.00',
  `carrier_tax_rate` decimal(10,3) NOT NULL DEFAULT '0.000',
  `total_wrapping` decimal(17,2) NOT NULL DEFAULT '0.00',
  `invoice_number` int(10) unsigned NOT NULL DEFAULT '0',
  `delivery_number` int(10) unsigned NOT NULL DEFAULT '0',
  `invoice_date` datetime NOT NULL,
  `delivery_date` datetime NOT NULL,
  `valid` int(1) unsigned NOT NULL DEFAULT '0',
  `date_add` datetime NOT NULL,
  `date_upd` datetime NOT NULL,
  PRIMARY KEY (`id_order`),
  KEY `id_customer` (`id_customer`),
  KEY `id_cart` (`id_cart`),
  KEY `invoice_number` (`invoice_number`),
  KEY `id_carrier` (`id_carrier`),
  KEY `id_lang` (`id_lang`),
  KEY `id_currency` (`id_currency`),
  KEY `id_address_delivery` (`id_address_delivery`),
  KEY `id_address_invoice` (`id_address_invoice`),
  KEY `date_add` (`date_add`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `ps_orders`
--

INSERT INTO `ps_orders` (`id_order`, `id_carrier`, `id_lang`, `id_customer`, `id_cart`, `id_currency`, `id_address_delivery`, `id_address_invoice`, `secure_key`, `payment`, `conversion_rate`, `module`, `recyclable`, `gift`, `gift_message`, `shipping_number`, `total_discounts`, `total_paid`, `total_paid_real`, `total_products`, `total_products_wt`, `total_shipping`, `carrier_tax_rate`, `total_wrapping`, `invoice_number`, `delivery_number`, `invoice_date`, `delivery_date`, `valid`, `date_add`, `date_upd`) VALUES
(1, 0, 0, 27, 0, 0, 0, 0, '-1', '', 1.000000, NULL, 0, 0, NULL, NULL, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.000, 0.00, 0, 0, '0000-00-00 00:00:00', '2012-10-13 00:00:00', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 0, 0, 27, 0, 0, 0, 0, '-1', '', 1.000000, NULL, 0, 0, NULL, NULL, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.000, 0.00, 0, 0, '0000-00-00 00:00:00', '2012-10-13 00:00:00', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, 0, 0, 33, 0, 0, 0, 0, '-1', '', 1.000000, NULL, 0, 0, NULL, NULL, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.000, 0.00, 0, 0, '0000-00-00 00:00:00', '2012-10-13 00:00:00', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4, 0, 0, 27, 0, 0, 0, 0, '-1', '', 1.000000, NULL, 0, 0, NULL, NULL, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.000, 0.00, 0, 0, '0000-00-00 00:00:00', '2012-10-13 00:00:00', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5, 0, 0, 33, 0, 0, 0, 0, '-1', '', 1.000000, NULL, 0, 0, NULL, NULL, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.000, 0.00, 0, 0, '0000-00-00 00:00:00', '2012-10-14 00:00:00', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(6, 0, 0, 3, 0, 0, 0, 0, '-1', '', 1.000000, NULL, 0, 0, NULL, NULL, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.000, 0.00, 0, 0, '0000-00-00 00:00:00', '2012-10-18 00:00:00', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(7, 0, 0, 3, 0, 0, 0, 0, '-1', '', 1.000000, NULL, 0, 0, NULL, NULL, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.000, 0.00, 0, 0, '0000-00-00 00:00:00', '2012-11-04 00:00:00', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(8, 0, 0, 21, 0, 0, 0, 0, '-1', '', 1.000000, NULL, 0, 0, NULL, NULL, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.000, 0.00, 0, 0, '0000-00-00 00:00:00', '2012-10-15 00:00:00', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `ps_order_detail`
--

CREATE TABLE IF NOT EXISTS `ps_order_detail` (
  `id_order_detail` int(64) unsigned NOT NULL AUTO_INCREMENT,
  `id_order` int(64) unsigned NOT NULL,
  `product_id` int(64) unsigned NOT NULL,
  `product_attribute_id` int(64) unsigned DEFAULT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_quantity` int(10) unsigned NOT NULL DEFAULT '0',
  `product_quantity_in_stock` int(10) NOT NULL DEFAULT '0',
  `product_quantity_refunded` int(10) unsigned NOT NULL DEFAULT '0',
  `product_quantity_return` int(10) unsigned NOT NULL DEFAULT '0',
  `product_quantity_reinjected` int(10) unsigned NOT NULL DEFAULT '0',
  `product_price` decimal(20,6) NOT NULL DEFAULT '0.000000',
  `reduction_percent` decimal(10,2) NOT NULL DEFAULT '0.00',
  `reduction_amount` decimal(20,6) NOT NULL DEFAULT '0.000000',
  `group_reduction` decimal(10,2) NOT NULL DEFAULT '0.00',
  `product_quantity_discount` decimal(20,6) NOT NULL DEFAULT '0.000000',
  `product_ean13` varchar(13) DEFAULT NULL,
  `product_upc` varchar(12) DEFAULT NULL,
  `product_reference` varchar(32) DEFAULT NULL,
  `product_supplier_reference` varchar(32) DEFAULT NULL,
  `product_weight` float NOT NULL,
  `tax_name` varchar(40) NOT NULL,
  `tax_rate` decimal(10,3) NOT NULL DEFAULT '0.000',
  `ecotax` decimal(21,6) NOT NULL DEFAULT '0.000000',
  `ecotax_tax_rate` decimal(5,3) NOT NULL DEFAULT '0.000',
  `discount_quantity_applied` tinyint(1) NOT NULL DEFAULT '0',
  `download_hash` varchar(255) DEFAULT NULL,
  `download_nb` int(10) unsigned DEFAULT '0',
  `download_deadline` datetime DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id_order_detail`),
  KEY `order_detail_order` (`id_order`),
  KEY `product_id` (`product_id`),
  KEY `product_attribute_id` (`product_attribute_id`),
  KEY `id_order_id_order_detail` (`id_order`,`id_order_detail`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ps_order_discount`
--

CREATE TABLE IF NOT EXISTS `ps_order_discount` (
  `id_order_discount` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_order` int(64) unsigned NOT NULL,
  `id_discount` int(10) unsigned NOT NULL,
  `name` varchar(32) NOT NULL,
  `value` decimal(17,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id_order_discount`),
  KEY `order_discount_order` (`id_order`),
  KEY `id_discount` (`id_discount`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ps_order_history`
--

CREATE TABLE IF NOT EXISTS `ps_order_history` (
  `id_order_history` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_employee` int(10) unsigned NOT NULL,
  `id_order` int(64) unsigned NOT NULL,
  `id_order_state` int(10) unsigned NOT NULL,
  `date_add` datetime NOT NULL,
  PRIMARY KEY (`id_order_history`),
  KEY `order_history_order` (`id_order`),
  KEY `id_employee` (`id_employee`),
  KEY `id_order_state` (`id_order_state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ps_order_message`
--

CREATE TABLE IF NOT EXISTS `ps_order_message` (
  `id_order_message` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `date_add` datetime NOT NULL,
  PRIMARY KEY (`id_order_message`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ps_order_message_lang`
--

CREATE TABLE IF NOT EXISTS `ps_order_message_lang` (
  `id_order_message` int(10) unsigned NOT NULL,
  `id_lang` int(10) unsigned NOT NULL,
  `name` varchar(128) NOT NULL,
  `message` text NOT NULL,
  PRIMARY KEY (`id_order_message`,`id_lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ps_order_return`
--

CREATE TABLE IF NOT EXISTS `ps_order_return` (
  `id_order_return` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_customer` int(64) unsigned NOT NULL,
  `id_order` int(64) unsigned NOT NULL,
  `state` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `question` text NOT NULL,
  `date_add` datetime NOT NULL,
  `date_upd` datetime NOT NULL,
  PRIMARY KEY (`id_order_return`),
  KEY `order_return_customer` (`id_customer`),
  KEY `id_order` (`id_order`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ps_order_return_detail`
--

CREATE TABLE IF NOT EXISTS `ps_order_return_detail` (
  `id_order_return` int(10) unsigned NOT NULL,
  `id_order_detail` int(64) unsigned NOT NULL,
  `id_customization` int(10) unsigned NOT NULL DEFAULT '0',
  `product_quantity` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_order_return`,`id_order_detail`,`id_customization`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ps_order_return_state`
--

CREATE TABLE IF NOT EXISTS `ps_order_return_state` (
  `id_order_return_state` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `color` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id_order_return_state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ps_order_return_state_lang`
--

CREATE TABLE IF NOT EXISTS `ps_order_return_state_lang` (
  `id_order_return_state` int(10) unsigned NOT NULL,
  `id_lang` int(10) unsigned NOT NULL,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`id_order_return_state`,`id_lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ps_order_slip`
--

CREATE TABLE IF NOT EXISTS `ps_order_slip` (
  `id_order_slip` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `conversion_rate` decimal(13,6) NOT NULL DEFAULT '1.000000',
  `id_customer` int(64) unsigned NOT NULL,
  `id_order` int(64) unsigned NOT NULL,
  `shipping_cost` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `date_add` datetime NOT NULL,
  `date_upd` datetime NOT NULL,
  PRIMARY KEY (`id_order_slip`),
  KEY `order_slip_customer` (`id_customer`),
  KEY `id_order` (`id_order`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ps_order_slip_detail`
--

CREATE TABLE IF NOT EXISTS `ps_order_slip_detail` (
  `id_order_slip` int(10) unsigned NOT NULL,
  `id_order_detail` int(64) unsigned NOT NULL,
  `product_quantity` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_order_slip`,`id_order_detail`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ps_order_state`
--

CREATE TABLE IF NOT EXISTS `ps_order_state` (
  `id_order_state` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `invoice` tinyint(1) unsigned DEFAULT '0',
  `send_email` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `color` varchar(32) DEFAULT NULL,
  `unremovable` tinyint(1) unsigned NOT NULL,
  `hidden` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `logable` tinyint(1) NOT NULL DEFAULT '0',
  `delivery` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `deleted` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_order_state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ps_order_state_lang`
--

CREATE TABLE IF NOT EXISTS `ps_order_state_lang` (
  `id_order_state` int(10) unsigned NOT NULL,
  `id_lang` int(10) unsigned NOT NULL,
  `name` varchar(64) NOT NULL,
  `template` varchar(64) NOT NULL,
  PRIMARY KEY (`id_order_state`,`id_lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ps_order_tax`
--

CREATE TABLE IF NOT EXISTS `ps_order_tax` (
  `id_order` int(64) NOT NULL,
  `tax_name` varchar(40) NOT NULL,
  `tax_rate` decimal(6,3) NOT NULL,
  `amount` decimal(20,6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ps_pack`
--

CREATE TABLE IF NOT EXISTS `ps_pack` (
  `id_product_pack` int(10) unsigned NOT NULL,
  `id_product_item` int(10) unsigned NOT NULL,
  `quantity` int(10) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_product_pack`,`id_product_item`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ps_page`
--

CREATE TABLE IF NOT EXISTS `ps_page` (
  `id_page` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_page_type` int(10) unsigned NOT NULL,
  `id_object` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id_page`),
  KEY `id_page_type` (`id_page_type`),
  KEY `id_object` (`id_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ps_page_type`
--

CREATE TABLE IF NOT EXISTS `ps_page_type` (
  `id_page_type` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id_page_type`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ps_page_viewed`
--

CREATE TABLE IF NOT EXISTS `ps_page_viewed` (
  `id_page` int(10) unsigned NOT NULL,
  `id_date_range` int(10) unsigned NOT NULL,
  `counter` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_page`,`id_date_range`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ps_payment_cc`
--

CREATE TABLE IF NOT EXISTS `ps_payment_cc` (
  `id_payment_cc` int(11) NOT NULL AUTO_INCREMENT,
  `id_order` int(64) DEFAULT NULL,
  `id_currency` int(10) unsigned NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `transaction_id` varchar(254) DEFAULT NULL,
  `card_number` varchar(254) DEFAULT NULL,
  `card_brand` varchar(254) DEFAULT NULL,
  `card_expiration` char(7) DEFAULT NULL,
  `card_holder` varchar(254) DEFAULT NULL,
  `date_add` datetime NOT NULL,
  PRIMARY KEY (`id_payment_cc`),
  KEY `id_order` (`id_order`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ps_product`
--

CREATE TABLE IF NOT EXISTS `ps_product` (
  `id_product` int(64) unsigned NOT NULL AUTO_INCREMENT,
  `id_template` int(11) NOT NULL,
  `id_supplier` int(32) unsigned DEFAULT NULL,
  `id_brand` int(11) DEFAULT NULL,
  `id_manufacturer` int(32) unsigned DEFAULT NULL,
  `id_tax_rules_group` int(10) unsigned NOT NULL,
  `id_category_default` int(10) unsigned DEFAULT NULL,
  `id_color_default` int(10) unsigned DEFAULT NULL,
  `status` tinyint(4) NOT NULL,
  `position` int(100) NOT NULL,
  `on_sale` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `online_only` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ean13` varchar(13) DEFAULT NULL,
  `upc` varchar(12) DEFAULT NULL,
  `ecotax` decimal(17,6) NOT NULL DEFAULT '0.000000',
  `quantity` int(10) NOT NULL DEFAULT '0',
  `minimal_quantity` int(10) unsigned NOT NULL DEFAULT '1',
  `price` decimal(20,2) NOT NULL DEFAULT '0.00',
  `wholesale_price` decimal(20,2) NOT NULL DEFAULT '0.00',
  `unity` varchar(255) DEFAULT NULL,
  `unit_price_ratio` decimal(20,6) NOT NULL DEFAULT '0.000000',
  `additional_shipping_cost` decimal(20,2) NOT NULL DEFAULT '0.00',
  `reference` varchar(32) DEFAULT NULL,
  `supplier_reference` varchar(32) DEFAULT NULL,
  `location` varchar(64) DEFAULT NULL,
  `width` float NOT NULL DEFAULT '0',
  `height` float NOT NULL DEFAULT '0',
  `depth` float NOT NULL DEFAULT '0',
  `weight` float NOT NULL DEFAULT '0',
  `out_of_stock` int(10) unsigned NOT NULL DEFAULT '0',
  `quantity_discount` tinyint(1) DEFAULT '0',
  `customizable` tinyint(2) NOT NULL DEFAULT '0',
  `uploadable_files` tinyint(4) NOT NULL DEFAULT '0',
  `text_fields` tinyint(4) NOT NULL DEFAULT '0',
  `active` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `available_for_order` tinyint(1) NOT NULL DEFAULT '1',
  `condition` enum('new','used','refurbished') NOT NULL DEFAULT 'new',
  `show_price` tinyint(1) NOT NULL DEFAULT '1',
  `indexed` tinyint(1) NOT NULL DEFAULT '0',
  `cache_is_pack` tinyint(1) NOT NULL DEFAULT '0',
  `cache_has_attachments` tinyint(1) NOT NULL DEFAULT '0',
  `cache_default_attribute` int(10) unsigned DEFAULT NULL,
  `event` varchar(100) DEFAULT NULL,
  `is_return_gift` int(11) NOT NULL DEFAULT '0',
  `logo_choice` int(11) NOT NULL DEFAULT '1',
  `min_purchase` decimal(20,6) DEFAULT NULL,
  `redeem_valid_days` int(11) NOT NULL DEFAULT '30',
  `product_value` decimal(20,6) NOT NULL DEFAULT '0.000000',
  `features` varchar(3000) NOT NULL DEFAULT '- Use as cash on the site for up to the value on the card - No minimums',
  `is_published` tinyint(1) NOT NULL DEFAULT '1',
  `sender_limit` int(11) NOT NULL,
  `receiver_limit` int(11) NOT NULL,
  `user_validity` int(11) NOT NULL DEFAULT '30',
  `voucher_validity` datetime DEFAULT NULL,
  `terms` text NOT NULL,
  `tips` text NOT NULL,
  `redirection_url` text,
  `date_add` datetime NOT NULL,
  `date_upd` datetime NOT NULL,
  PRIMARY KEY (`id_product`),
  KEY `product_supplier` (`id_supplier`),
  KEY `product_manufacturer` (`id_manufacturer`),
  KEY `id_category_default` (`id_category_default`),
  KEY `id_color_default` (`id_color_default`),
  KEY `date_add` (`date_add`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=26 ;

--
-- Dumping data for table `ps_product`
--

INSERT INTO `ps_product` (`id_product`, `id_template`, `id_supplier`, `id_brand`, `id_manufacturer`, `id_tax_rules_group`, `id_category_default`, `id_color_default`, `status`, `position`, `on_sale`, `online_only`, `ean13`, `upc`, `ecotax`, `quantity`, `minimal_quantity`, `price`, `wholesale_price`, `unity`, `unit_price_ratio`, `additional_shipping_cost`, `reference`, `supplier_reference`, `location`, `width`, `height`, `depth`, `weight`, `out_of_stock`, `quantity_discount`, `customizable`, `uploadable_files`, `text_fields`, `active`, `available_for_order`, `condition`, `show_price`, `indexed`, `cache_is_pack`, `cache_has_attachments`, `cache_default_attribute`, `event`, `is_return_gift`, `logo_choice`, `min_purchase`, `redeem_valid_days`, `product_value`, `features`, `is_published`, `sender_limit`, `receiver_limit`, `user_validity`, `voucher_validity`, `terms`, `tips`, `redirection_url`, `date_add`, `date_upd`) VALUES
(1, 1, 1, NULL, NULL, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0.000000, 297, 1, 0.00, 0.00, NULL, 0.000000, 0.00, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 'new', 1, 0, 0, 0, NULL, 'Happy birth day', 2, 1, 0.000000, 30, 200.000000, '<p>The gift card voucher can be used as cash at beStylish.com</p>', 1, 10, 10, 30, NULL, '<ul>\r\n<li>Gift Cards cannot be replaced if lost or stolen.</li>\r\n<li>Gift Cards purchased online may be redeemed at {SUPPLIER URL}</li>\r\n<li>Gift Cards cannot be redeemed for cash.</li>\r\n<li>Gift cards expire 30 days after their date of issue.</li>\r\n<li>Gift Cards purchased for $supplierURL expire 90 days after their date of issue.</li>\r\n<li>LeaveAGift.com maintains the right to dishonor gift cards for invalid Facebook accounts.</li>\r\n</ul>', '<ul>\r\n<li>tip1:Gift Cards cannot be replaced if lost or stolen.</li>\r\n<li>tip2:Gift Cards cannot be redeemed for cash.</li>\r\n<li>tip3:Gift cards expire 30 days after their date of issue.</li>\r\n<li>tip4:Gift Cards purchased for $supplierURL expire 90 days after their date of issue.</li>\r\n<li>tip5:LeaveAGift.com maintains the right to dishonor gift cards for invalid Facebook accounts.</li>\r\n</ul>', NULL, '2012-10-13 10:09:37', '2012-10-17 21:43:00'),
(2, 3, 4, NULL, NULL, 0, NULL, NULL, 0, 3, 0, 0, NULL, NULL, 0.000000, 5, 1, 0.00, 0.00, NULL, 0.000000, 0.00, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 'new', 1, 0, 0, 0, NULL, 'Happy birth day', 2, 1, 0.000000, 30, 1500.000000, '<p>The gift card voucher can be used as cash at healthkart.com</p>', 1, 3, 3, 30, NULL, '<ul>\r\n<li>Gift Cards cannot be replaced if lost or stolen.</li>\r\n<li>Gift Cards purchased online may be redeemed at {SUPPLIER URL}</li>\r\n<li>Gift Cards cannot be redeemed for cash.</li>\r\n<li>Gift cards expire 30 days after their date of issue.</li>\r\n<li>Gift Cards purchased for $supplierURL expire 90 days after their date of issue.</li>\r\n<li>LeaveAGift.com maintains the right to dishonor gift cards for invalid Facebook accounts.</li>\r\n</ul>', '<ul>\r\n<li>tip1:Gift Cards cannot be replaced if lost or stolen.</li>\r\n<li>tip2:Gift Cards cannot be redeemed for cash.</li>\r\n<li>tip3:Gift cards expire 30 days after their date of issue.</li>\r\n<li>tip4:Gift Cards purchased for $supplierURL expire 90 days after their date of issue.</li>\r\n<li>tip5:LeaveAGift.com maintains the right to dishonor gift cards for invalid Facebook accounts.</li>\r\n</ul>', 'https://bestylish.com', '2012-10-13 10:43:03', '2012-10-21 20:21:41'),
(3, 4, 1, NULL, NULL, 0, NULL, NULL, 0, 12, 0, 0, NULL, NULL, 0.000000, 100, 1, 1500.00, 0.00, NULL, 0.000000, 0.00, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 'new', 1, 0, 0, 0, NULL, 'Happy birthday', 0, 1, 0.000000, 30, 1500.000000, 'The gift card voucher can be used as cash at beStylish.com \r\n', 1, 3, 3, 30, NULL, '', '', NULL, '2012-10-13 11:00:08', '2012-10-15 12:37:41'),
(4, 5, 2, NULL, NULL, 0, NULL, NULL, 0, 1, 0, 0, NULL, NULL, 0.000000, 241, 1, 0.00, 0.00, NULL, 0.000000, 0.00, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 'new', 1, 0, 0, 0, NULL, 'Happy birth day', 0, 1, 0.000000, 30, 150.000000, '<p>The gift card voucher can be used as cash at gkboptical.com</p>', 1, 20, 20, 30, NULL, '<ul>\r\n<li>Gift Cards cannot be replaced if lost or stolen.</li>\r\n<li>Gift Cards purchased online may be redeemed at {SUPPLIER URL}</li>\r\n<li>Gift Cards cannot be redeemed for cash.</li>\r\n<li>Gift cards expire 30 days after their date of issue.</li>\r\n<li>Gift Cards purchased for $supplierURL expire 90 days after their date of issue.</li>\r\n<li>LeaveAGift.com maintains the right to dishonor gift cards for invalid Facebook accounts.</li>\r\n</ul>', '<ul>\r\n<li>tip1:Gift Cards cannot be replaced if lost or stolen.</li>\r\n<li>tip2:Gift Cards cannot be redeemed for cash.</li>\r\n<li>tip3:Gift cards expire 30 days after their date of issue.</li>\r\n<li>tip4:Gift Cards purchased for $supplierURL expire 90 days after their date of issue.</li>\r\n<li>tip5:LeaveAGift.com maintains the right to dishonor gift cards for invalid Facebook accounts.</li>\r\n</ul>', 'https://bestylish.com', '2012-10-13 11:11:45', '2012-10-20 21:01:22'),
(5, 6, 2, NULL, NULL, 0, NULL, NULL, 0, 8, 0, 0, NULL, NULL, 0.000000, 50, 1, 2000.00, 0.00, NULL, 0.000000, 0.00, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 'new', 1, 0, 0, 0, NULL, 'Happy birthday', 0, 1, 0.000000, 30, 2000.000000, 'The gift card voucher can be used as cash at gkboptical.com \r\n', 1, 3, 3, 30, NULL, '', '', NULL, '2012-10-13 11:21:21', '2012-10-15 12:37:12'),
(6, 7, 4, NULL, NULL, 0, NULL, NULL, 0, 9, 0, 0, NULL, NULL, 0.000000, 5, 1, 1000.00, 0.00, NULL, 0.000000, 0.00, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 'new', 1, 0, 0, 0, NULL, 'Happy birthday', 0, 1, 0.000000, 30, 1000.000000, 'The gift card voucher can be used as cash at healthkart.com \r\n', 1, 3, 3, 30, NULL, '', '', NULL, '2012-10-13 11:41:51', '2012-10-13 11:42:55'),
(7, 8, 2, NULL, NULL, 0, NULL, NULL, 0, 13, 0, 0, NULL, NULL, 0.000000, 50, 1, 1000.00, 0.00, NULL, 0.000000, 0.00, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 'new', 1, 0, 0, 0, NULL, 'Happy birthday', 0, 1, 0.000000, 30, 1000.000000, 'The gift card voucher can be used as cash at gkboptical.com \r\n', 1, 3, 3, 30, NULL, '', '', NULL, '2012-10-13 12:15:10', '2012-10-13 12:41:42'),
(8, 9, 5, NULL, NULL, 0, NULL, NULL, 0, 4, 0, 0, NULL, NULL, 0.000000, 300, 1, 0.00, 0.00, NULL, 0.000000, 0.00, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 'new', 1, 0, 0, 0, NULL, 'Happy birth day', 2, 1, 0.000000, 30, 400.000000, '<p>For every gift you send Papa CJ and LeaveAGift together will donate Rs 400 to Child One.</p>', 1, 100, 100, 30, NULL, '<ul>\r\n<li>Gift Cards cannot be replaced if lost or stolen.</li>\r\n<li>Gift Cards purchased online may be redeemed at {SUPPLIER URL}</li>\r\n<li>Gift Cards cannot be redeemed for cash.</li>\r\n<li>Gift cards expire 30 days after their date of issue.</li>\r\n<li>Gift Cards purchased for $supplierURL expire 90 days after their date of issue.</li>\r\n<li>LeaveAGift.com maintains the right to dishonor gift cards for invalid Facebook accounts.</li>\r\n</ul>', '<ul>\r\n<li>tip1:Gift Cards cannot be replaced if lost or stolen.</li>\r\n<li>tip2:Gift Cards cannot be redeemed for cash.</li>\r\n<li>tip3:Gift cards expire 30 days after their date of issue.</li>\r\n<li>tip4:Gift Cards purchased for $supplierURL expire 90 days after their date of issue.</li>\r\n<li>tip5:LeaveAGift.com maintains the right to dishonor gift cards for invalid Facebook accounts.</li>\r\n</ul>', 'http://www.bestylish.com', '2012-10-13 12:53:43', '2012-10-23 19:12:02'),
(9, 10, 8, NULL, NULL, 0, NULL, NULL, 0, 10, 0, 0, NULL, NULL, 0.000000, 1, 1, 0.00, 0.00, NULL, 0.000000, 0.00, NULL, NULL, NULL, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 'new', 1, 0, 0, 0, NULL, 'Happy birthday', 0, 1, 0.000000, 30, 100.000000, 'The gift card can be redeemed only at flipkart.com', 0, 3, 3, 30, NULL, '', '', NULL, '2012-10-13 13:09:55', '2012-10-13 13:17:44'),
(10, 11, 9, NULL, NULL, 0, NULL, NULL, 0, 11, 0, 0, NULL, NULL, 0.000000, 299, 1, 700.00, 0.00, NULL, 0.000000, 0.00, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 'new', 1, 0, 0, 0, NULL, 'Gift to chairty.', 0, 1, 0.000000, 30, 700.000000, 'Donate Rs. 700 to Satyamev Jayate on behalf of your loved ones today.', 1, 300, 300, 30, NULL, '', '', NULL, '2012-10-13 13:25:29', '2012-10-13 13:30:35'),
(11, 12, 10, NULL, NULL, 0, NULL, NULL, 0, 13, 0, 0, NULL, NULL, 0.000000, 1, 1, 500.00, 0.00, NULL, 0.000000, 0.00, NULL, NULL, NULL, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 'new', 1, 0, 0, 0, NULL, 'Happy birthday', 0, 1, 0.000000, 30, 500.000000, 'Gift Card can be redeemed online only.', 1, 3, 3, 30, NULL, '', '', NULL, '2012-10-13 13:37:15', '2012-10-15 12:30:36'),
(12, 13, 6, NULL, NULL, 0, NULL, NULL, 0, 5, 0, 0, NULL, NULL, 0.000000, 1, 1, 0.00, 0.00, NULL, 0.000000, 0.00, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 'new', 1, 0, 0, 0, NULL, 'Happy birth day', 0, 1, 0.000000, 30, 1000.000000, '<p>The gift card voucher can be used as cash at kamahoo.com. Kamahoo products cater to the private and fun sides of your personality.</p>', 1, 100, 100, 30, NULL, '<ul>\r\n<li>Gift Cards cannot be replaced if lost or stolen.</li>\r\n<li>Gift Cards purchased online may be redeemed at {SUPPLIER URL}</li>\r\n<li>Gift Cards cannot be redeemed for cash.</li>\r\n<li>Gift cards expire 30 days after their date of issue.</li>\r\n<li>Gift Cards purchased for $supplierURL expire 90 days after their date of issue.</li>\r\n<li>LeaveAGift.com maintains the right to dishonor gift cards for invalid Facebook accounts.</li>\r\n</ul>', '<ul>\r\n<li>tip1:Gift Cards cannot be replaced if lost or stolen.</li>\r\n<li>tip2:Gift Cards cannot be redeemed for cash.</li>\r\n<li>tip3:Gift cards expire 30 days after their date of issue.</li>\r\n<li>tip4:Gift Cards purchased for $supplierURL expire 90 days after their date of issue.</li>\r\n<li>tip5:LeaveAGift.com maintains the right to dishonor gift cards for invalid Facebook accounts.</li>\r\n</ul>', 'http://www.bestylish.com', '2012-10-13 14:12:09', '2012-10-23 19:15:52'),
(13, 14, 7, NULL, NULL, 0, NULL, NULL, 0, 6, 0, 0, NULL, NULL, 0.000000, 10, 1, 1999.00, 0.00, NULL, 0.000000, 0.00, NULL, NULL, NULL, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 'new', 1, 0, 0, 0, NULL, 'Happy birthday', 0, 1, 0.000000, 30, 1999.000000, 'The gift card can be used as cash to order Pure Mischief at Kamahoo.com', 1, 3, 3, 30, NULL, '', '', NULL, '2012-10-13 14:24:31', '2012-10-13 14:25:12'),
(19, 18, 11, NULL, NULL, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0.000000, 99, 1, 0.00, 0.00, NULL, 0.000000, 0.00, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 'new', 1, 0, 0, 0, NULL, 'Happy birth day', 0, 1, 0.000000, 30, 900.000000, '<p>The amount donated will be used for better breast health in India by The Ogaan Cancer Foundation.</p>', 0, 3, 3, 30, NULL, '<ul>\r\n<li>Gift Cards cannot be replaced if lost or stolen.</li>\r\n<li>Gift Cards purchased online may be redeemed at {SUPPLIER URL}</li>\r\n<li>Gift Cards cannot be redeemed for cash.</li>\r\n<li>Gift cards expire 30 days after their date of issue.</li>\r\n<li>Gift Cards purchased for $supplierURL expire 90 days after their date of issue.</li>\r\n<li>LeaveAGift.com maintains the right to dishonor gift cards for invalid Facebook accounts.</li>\r\n</ul>', '<ul>\r\n<li>tip1:Gift Cards cannot be replaced if lost or stolen.</li>\r\n<li>tip2:Gift Cards cannot be redeemed for cash.</li>\r\n<li>tip3:Gift cards expire 30 days after their date of issue.</li>\r\n<li>tip4:Gift Cards purchased for $supplierURL expire 90 days after their date of issue.</li>\r\n<li>tip5:LeaveAGift.com maintains the right to dishonor gift cards for invalid Facebook accounts.</li>\r\n</ul>', 'http://www.bestylish.com', '2012-10-15 06:33:24', '2012-10-23 19:07:49'),
(20, 18, 11, NULL, NULL, 0, NULL, NULL, 0, 7, 0, 0, NULL, NULL, 0.000000, 99, 1, 0.00, 0.00, NULL, 0.000000, 0.00, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 'new', 1, 0, 0, 0, NULL, 'Happy birth day', 2, 1, 0.000000, 30, 900.000000, '<p>The amount donated will be used for better breast health in India by The Ogaan Cancer Foundation.</p>', 1, 3, 3, 30, NULL, '<ul>\r\n<li>Gift Cards cannot be replaced if lost or stolen.</li>\r\n<li>Gift Cards purchased online may be redeemed at {SUPPLIER URL}</li>\r\n<li>Gift Cards cannot be redeemed for cash.</li>\r\n<li>Gift cards expire 30 days after their date of issue.</li>\r\n<li>Gift Cards purchased for $supplierURL expire 90 days after their date of issue.</li>\r\n<li>LeaveAGift.com maintains the right to dishonor gift cards for invalid Facebook accounts.</li>\r\n</ul>', '<ul>\r\n<li>tip1:Gift Cards cannot be replaced if lost or stolen.</li>\r\n<li>tip2:Gift Cards cannot be redeemed for cash.</li>\r\n<li>tip3:Gift cards expire 30 days after their date of issue.</li>\r\n<li>tip4:Gift Cards purchased for $supplierURL expire 90 days after their date of issue.</li>\r\n<li>tip5:LeaveAGift.com maintains the right to dishonor gift cards for invalid Facebook accounts.</li>\r\n</ul>', 'http://www.bestylish.com', '2012-10-15 06:45:04', '2012-10-23 19:05:57'),
(21, 2, 3, NULL, NULL, 0, NULL, NULL, 0, 2, 0, 0, NULL, NULL, 0.000000, 30, 1, 999.00, 0.00, NULL, 0.000000, 0.00, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 'new', 1, 0, 0, 0, NULL, 'Happy birth day', 0, 1, 0.000000, 30, 999.000000, '<p>The gift card voucher can be used as cash to order a pair of Philips Led Candles worth Rs. 999.</p>', 0, 8, 3, 30, NULL, '<ul>\r\n<li>Gift Cards cannot be replaced if lost or stolen.</li>\r\n<li>Gift Cards purchased online may be redeemed at bulbtiger.com</li>\r\n<li>Gift Cards cannot be redeemed for cash.</li>\r\n<li>Gift cards will expire on 16th November, 2012</li>\r\n<li>LeaveAGift.com maintains the right to dishonor gift cards for invalid Facebook accounts.</li>\r\n</ul>', '<ul>\r\n<li>tip1:Gift Cards cannot be replaced if lost or stolen.</li>\r\n<li>tip2:Gift Cards cannot be redeemed for cash..</li>\r\n<li>tip3:Gift Cards purchased for bulbtiger expire on 16th November. 2012</li>\r\n<li>tip4:LeaveAGift.com maintains the right to dishonor gift cards for invalid Facebook accounts.</li>\r\n</ul>', 'https://bestylish.com', '2012-10-16 10:43:26', '2012-10-20 20:38:42'),
(22, 3, 4, 0, NULL, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0.000000, 4, 1, 200.00, 0.00, NULL, 0.000000, 0.00, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 'new', 1, 0, 0, 0, NULL, 'Happy birthday', 0, 1, 0.000000, 30, 0.000000, 'The gift card voucher can be used as cash at healthkart.com \r\n', 1, 3, 3, 30, '2012-12-05 00:00:00', '', '', 'http://www.healthkart.com/?utm_source=LeaveAGift', '2012-10-26 19:21:08', '2012-10-26 19:21:08'),
(23, 3, 4, 0, NULL, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0.000000, 5, 1, 0.00, 0.00, NULL, 0.000000, 0.00, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 'new', 1, 0, 0, 0, NULL, 'Happy birthday', 0, 1, 500.000000, 30, 300.000000, 'The gift card voucher can be used as cash at healthkart.com \r\n', 1, 3, 3, 30, '2012-08-25 00:00:00', '', '', 'http://www.healthkart.com/?utm_source=LeaveAGift', '2012-10-26 19:21:12', '2012-10-26 19:21:12'),
(24, 3, 4, 0, NULL, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0.000000, 4, 1, 200.00, 0.00, NULL, 0.000000, 0.00, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 'new', 1, 0, 0, 0, NULL, 'Happy birthday', 0, 1, 0.000000, 30, 0.000000, 'The gift card voucher can be used as cash at healthkart.com \r\n', 1, 3, 3, 30, '2012-12-05 00:00:00', '', '', 'http://www.healthkart.com/?utm_source=LeaveAGift', '2012-10-26 19:21:34', '2012-10-26 19:21:34'),
(25, 3, 4, 0, NULL, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 0.000000, 5, 1, 0.00, 0.00, NULL, 0.000000, 0.00, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 'new', 1, 0, 0, 0, NULL, 'Happy birthday', 0, 1, 500.000000, 30, 300.000000, 'The gift card voucher can be used as cash at healthkart.com \r\n', 1, 3, 3, 30, '2012-08-25 00:00:00', '', '', 'http://www.healthkart.com/?utm_source=LeaveAGift', '2012-10-26 19:21:37', '2012-10-26 19:21:37');

-- --------------------------------------------------------

--
-- Table structure for table `ps_product_attachment`
--

CREATE TABLE IF NOT EXISTS `ps_product_attachment` (
  `id_product` int(64) unsigned NOT NULL,
  `id_attachment` int(64) unsigned NOT NULL,
  PRIMARY KEY (`id_product`,`id_attachment`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ps_product_attribute`
--

CREATE TABLE IF NOT EXISTS `ps_product_attribute` (
  `id_product_attribute` int(64) unsigned NOT NULL AUTO_INCREMENT,
  `id_product` int(64) unsigned NOT NULL,
  `reference` varchar(32) DEFAULT NULL,
  `supplier_reference` varchar(32) DEFAULT NULL,
  `location` varchar(64) DEFAULT NULL,
  `ean13` varchar(13) DEFAULT NULL,
  `upc` varchar(12) DEFAULT NULL,
  `wholesale_price` decimal(20,6) NOT NULL DEFAULT '0.000000',
  `price` decimal(20,6) NOT NULL DEFAULT '0.000000',
  `ecotax` decimal(17,6) NOT NULL DEFAULT '0.000000',
  `quantity` int(10) NOT NULL DEFAULT '0',
  `weight` float NOT NULL DEFAULT '0',
  `unit_price_impact` decimal(17,2) NOT NULL DEFAULT '0.00',
  `default_on` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `minimal_quantity` int(10) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_product_attribute`),
  KEY `product_attribute_product` (`id_product`),
  KEY `reference` (`reference`),
  KEY `supplier_reference` (`supplier_reference`),
  KEY `product_default` (`id_product`,`default_on`),
  KEY `id_product_id_product_attribute` (`id_product_attribute`,`id_product`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ps_product_attribute_combination`
--

CREATE TABLE IF NOT EXISTS `ps_product_attribute_combination` (
  `id_attribute` int(10) unsigned NOT NULL,
  `id_product_attribute` int(64) unsigned NOT NULL,
  PRIMARY KEY (`id_attribute`,`id_product_attribute`),
  KEY `id_product_attribute` (`id_product_attribute`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ps_product_attribute_image`
--

CREATE TABLE IF NOT EXISTS `ps_product_attribute_image` (
  `id_product_attribute` int(64) unsigned NOT NULL,
  `id_image` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_product_attribute`,`id_image`),
  KEY `id_image` (`id_image`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ps_product_country_tax`
--

CREATE TABLE IF NOT EXISTS `ps_product_country_tax` (
  `id_product` int(64) NOT NULL,
  `id_country` int(11) NOT NULL,
  `id_tax` int(11) NOT NULL,
  PRIMARY KEY (`id_product`,`id_country`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ps_product_download`
--

CREATE TABLE IF NOT EXISTS `ps_product_download` (
  `id_product_download` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_product` int(64) unsigned NOT NULL,
  `display_filename` varchar(255) DEFAULT NULL,
  `physically_filename` varchar(255) DEFAULT NULL,
  `date_deposit` datetime NOT NULL,
  `date_expiration` datetime DEFAULT NULL,
  `nb_days_accessible` int(10) unsigned DEFAULT NULL,
  `nb_downloadable` int(10) unsigned DEFAULT '1',
  `active` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_product_download`),
  KEY `product_active` (`id_product`,`active`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ps_product_group_reduction_cache`
--

CREATE TABLE IF NOT EXISTS `ps_product_group_reduction_cache` (
  `id_product` int(10) unsigned NOT NULL,
  `id_group` int(10) unsigned NOT NULL,
  `reduction` decimal(4,3) NOT NULL,
  PRIMARY KEY (`id_product`,`id_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ps_product_lang`
--

CREATE TABLE IF NOT EXISTS `ps_product_lang` (
  `id_product` int(64) unsigned NOT NULL,
  `id_lang` int(10) unsigned NOT NULL,
  `description` text,
  `description_short` text,
  `link_rewrite` varchar(128) NOT NULL,
  `meta_description` varchar(255) DEFAULT NULL,
  `meta_keywords` varchar(255) DEFAULT NULL,
  `meta_title` varchar(128) DEFAULT NULL,
  `name` varchar(128) NOT NULL,
  `available_now` varchar(255) DEFAULT NULL,
  `available_later` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_product`,`id_lang`),
  KEY `id_lang` (`id_lang`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ps_product_lang`
--

INSERT INTO `ps_product_lang` (`id_product`, `id_lang`, `description`, `description_short`, `link_rewrite`, `meta_description`, `meta_keywords`, `meta_title`, `name`, `available_now`, `available_later`) VALUES
(1, 0, 'beStylish.com - India''s Largest Online Footwear Store. ', NULL, '', NULL, NULL, NULL, '', NULL, NULL),
(2, 0, 'Online Store for Premium health and beauty brands. ', NULL, '', NULL, NULL, NULL, '', NULL, NULL),
(3, 0, 'beStylish.com - India''s Largest Online Footwear Store.', NULL, '', NULL, NULL, NULL, '', NULL, NULL),
(4, 0, 'India''s largest online eyewear store.\r\n', NULL, '', NULL, NULL, NULL, '', NULL, NULL),
(5, 0, 'India''s largest online eyewear store.\r\n', NULL, '', NULL, NULL, NULL, '', NULL, NULL),
(6, 0, 'Online Store for Premium sports and beauty products.', NULL, '', NULL, NULL, NULL, '', NULL, NULL),
(7, 0, 'India''s largest online eyewear store.\r\n', NULL, '', NULL, NULL, NULL, '', NULL, NULL),
(8, 0, 'Gift Rs. 400 to Papa Cj''s Child One Charity.', NULL, '', NULL, NULL, NULL, '', NULL, NULL),
(9, 0, 'The largest online store in India..', NULL, '', NULL, NULL, NULL, '', NULL, NULL),
(10, 0, 'Donate Rs. 700 to Satyamev Jayate on behalf of your loved ones.', NULL, '', NULL, NULL, NULL, '', NULL, NULL),
(11, 0, 'Gift two tickets for any movie at PVR cinemas.', NULL, '', NULL, NULL, NULL, '', NULL, NULL),
(12, 0, 'Private You, Fun You. ', NULL, '', NULL, NULL, NULL, '', NULL, NULL),
(13, 0, 'Racy, naughty, hilarious, fun and cool  party game made in India for India.', NULL, '', NULL, NULL, NULL, '', NULL, NULL),
(19, 0, 'Donate to beStylish Elle''s Breast Cancer Campaign.', NULL, '', NULL, NULL, NULL, '', NULL, NULL),
(20, 0, 'Donate to beStylish Elle''s Breast Cancer Campaign.', NULL, '', NULL, NULL, NULL, '', NULL, NULL),
(21, 0, '<p>This Diwali no fumes, no flames, &amp; no worries.</p>', NULL, '', NULL, NULL, NULL, '', NULL, NULL),
(22, 0, 'Online Store for Premium health and beauty brands. ', NULL, '', NULL, NULL, NULL, '', NULL, NULL),
(23, 0, 'Online Store for Premium health and beauty brands. ', NULL, '', NULL, NULL, NULL, '', NULL, NULL),
(24, 0, 'Online Store for Premium health and beauty brands. ', NULL, '', NULL, NULL, NULL, '', NULL, NULL),
(25, 0, 'Online Store for Premium health and beauty brands. ', NULL, '', NULL, NULL, NULL, '', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ps_product_sale`
--

CREATE TABLE IF NOT EXISTS `ps_product_sale` (
  `id_product` int(64) unsigned NOT NULL,
  `quantity` int(10) unsigned NOT NULL DEFAULT '0',
  `sale_nbr` int(10) unsigned NOT NULL DEFAULT '0',
  `date_upd` date NOT NULL,
  PRIMARY KEY (`id_product`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ps_product_tag`
--

CREATE TABLE IF NOT EXISTS `ps_product_tag` (
  `id_product` int(64) unsigned NOT NULL,
  `id_tag` int(64) unsigned NOT NULL,
  PRIMARY KEY (`id_product`,`id_tag`),
  KEY `id_tag` (`id_tag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ps_product_tag`
--

INSERT INTO `ps_product_tag` (`id_product`, `id_tag`) VALUES
(13, 2),
(21, 2),
(8, 3),
(10, 3),
(19, 3),
(20, 3),
(1, 4),
(4, 4),
(9, 4),
(22, 4),
(23, 4),
(24, 4),
(25, 4),
(2, 5),
(3, 5),
(5, 5),
(6, 5),
(7, 5),
(12, 5),
(11, 6);

-- --------------------------------------------------------

--
-- Table structure for table `ps_profile`
--

CREATE TABLE IF NOT EXISTS `ps_profile` (
  `id_profile` int(10) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id_profile`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ps_profile_lang`
--

CREATE TABLE IF NOT EXISTS `ps_profile_lang` (
  `id_lang` int(10) unsigned NOT NULL,
  `id_profile` int(10) unsigned NOT NULL,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`id_profile`,`id_lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ps_quick_access`
--

CREATE TABLE IF NOT EXISTS `ps_quick_access` (
  `id_quick_access` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `new_window` tinyint(1) NOT NULL DEFAULT '0',
  `link` varchar(128) NOT NULL,
  PRIMARY KEY (`id_quick_access`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ps_quick_access_lang`
--

CREATE TABLE IF NOT EXISTS `ps_quick_access_lang` (
  `id_quick_access` int(10) unsigned NOT NULL,
  `id_lang` int(10) unsigned NOT NULL,
  `name` varchar(32) NOT NULL,
  PRIMARY KEY (`id_quick_access`,`id_lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ps_range_price`
--

CREATE TABLE IF NOT EXISTS `ps_range_price` (
  `id_range_price` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_carrier` int(10) unsigned NOT NULL,
  `delimiter1` decimal(20,6) NOT NULL,
  `delimiter2` decimal(20,6) NOT NULL,
  PRIMARY KEY (`id_range_price`),
  UNIQUE KEY `id_carrier` (`id_carrier`,`delimiter1`,`delimiter2`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ps_range_weight`
--

CREATE TABLE IF NOT EXISTS `ps_range_weight` (
  `id_range_weight` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_carrier` int(10) unsigned NOT NULL,
  `delimiter1` decimal(20,6) NOT NULL,
  `delimiter2` decimal(20,6) NOT NULL,
  PRIMARY KEY (`id_range_weight`),
  UNIQUE KEY `id_carrier` (`id_carrier`,`delimiter1`,`delimiter2`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ps_referrer`
--

CREATE TABLE IF NOT EXISTS `ps_referrer` (
  `id_referrer` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `passwd` varchar(32) DEFAULT NULL,
  `http_referer_regexp` varchar(64) DEFAULT NULL,
  `http_referer_like` varchar(64) DEFAULT NULL,
  `request_uri_regexp` varchar(64) DEFAULT NULL,
  `request_uri_like` varchar(64) DEFAULT NULL,
  `http_referer_regexp_not` varchar(64) DEFAULT NULL,
  `http_referer_like_not` varchar(64) DEFAULT NULL,
  `request_uri_regexp_not` varchar(64) DEFAULT NULL,
  `request_uri_like_not` varchar(64) DEFAULT NULL,
  `base_fee` decimal(5,2) NOT NULL DEFAULT '0.00',
  `percent_fee` decimal(5,2) NOT NULL DEFAULT '0.00',
  `click_fee` decimal(5,2) NOT NULL DEFAULT '0.00',
  `cache_visitors` int(11) DEFAULT NULL,
  `cache_visits` int(11) DEFAULT NULL,
  `cache_pages` int(11) DEFAULT NULL,
  `cache_registrations` int(11) DEFAULT NULL,
  `cache_orders` int(11) DEFAULT NULL,
  `cache_sales` decimal(17,2) DEFAULT NULL,
  `cache_reg_rate` decimal(5,4) DEFAULT NULL,
  `cache_order_rate` decimal(5,4) DEFAULT NULL,
  `date_add` datetime NOT NULL,
  PRIMARY KEY (`id_referrer`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ps_referrer_cache`
--

CREATE TABLE IF NOT EXISTS `ps_referrer_cache` (
  `id_connections_source` int(11) unsigned NOT NULL,
  `id_referrer` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id_connections_source`,`id_referrer`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ps_required_field`
--

CREATE TABLE IF NOT EXISTS `ps_required_field` (
  `id_required_field` int(11) NOT NULL AUTO_INCREMENT,
  `object_name` varchar(32) NOT NULL,
  `field_name` varchar(32) NOT NULL,
  PRIMARY KEY (`id_required_field`),
  KEY `object_name` (`object_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ps_scene`
--

CREATE TABLE IF NOT EXISTS `ps_scene` (
  `id_scene` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_scene`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ps_scene_category`
--

CREATE TABLE IF NOT EXISTS `ps_scene_category` (
  `id_scene` int(10) unsigned NOT NULL,
  `id_category` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_scene`,`id_category`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ps_scene_lang`
--

CREATE TABLE IF NOT EXISTS `ps_scene_lang` (
  `id_scene` int(10) unsigned NOT NULL,
  `id_lang` int(10) unsigned NOT NULL,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id_scene`,`id_lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ps_scene_products`
--

CREATE TABLE IF NOT EXISTS `ps_scene_products` (
  `id_scene` int(10) unsigned NOT NULL,
  `id_product` int(64) unsigned NOT NULL,
  `x_axis` int(4) NOT NULL,
  `y_axis` int(4) NOT NULL,
  `zone_width` int(3) NOT NULL,
  `zone_height` int(3) NOT NULL,
  PRIMARY KEY (`id_scene`,`id_product`,`x_axis`,`y_axis`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ps_search_engine`
--

CREATE TABLE IF NOT EXISTS `ps_search_engine` (
  `id_search_engine` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `server` varchar(64) NOT NULL,
  `getvar` varchar(16) NOT NULL,
  PRIMARY KEY (`id_search_engine`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ps_supplier`
--

CREATE TABLE IF NOT EXISTS `ps_supplier` (
  `id_supplier` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `supplier_code` varchar(10) NOT NULL,
  `supplier_url` text NOT NULL,
  `date_add` datetime NOT NULL,
  `date_upd` datetime NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `logo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_supplier`),
  KEY `supplier_code` (`supplier_code`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=35 ;

--
-- Dumping data for table `ps_supplier`
--

INSERT INTO `ps_supplier` (`id_supplier`, `name`, `supplier_code`, `supplier_url`, `date_add`, `date_upd`, `active`, `logo`) VALUES
(1, 'beStylish', 'Bes001', '', '2012-10-13 09:38:24', '2012-10-30 11:24:05', 0, NULL),
(2, 'GKB optical', 'GKB001', '', '2012-10-13 09:38:58', '2012-10-13 09:38:58', 0, NULL),
(3, 'Bulbtiger', 'BLB001', '', '2012-10-13 09:39:46', '2012-10-13 09:39:46', 0, NULL),
(4, 'Healthkart', 'HKT001', '', '2012-10-13 09:40:12', '2012-10-13 09:40:12', 0, NULL),
(5, 'Papa CJ', 'PPC001', '', '2012-10-13 09:40:54', '2012-10-13 09:40:54', 0, NULL),
(6, 'Kamahoo', 'KMH001', '', '2012-10-13 09:41:18', '2012-10-13 09:41:18', 0, NULL),
(7, 'Pure Mischief', 'PM001', '', '2012-10-13 09:57:00', '2012-10-13 09:57:00', 0, NULL),
(8, 'Flipkart', 'FLP001', '', '2012-10-13 09:57:37', '2012-10-13 09:57:37', 0, NULL),
(9, 'Satyamev Jayate', 'SMJ001', '', '2012-10-13 09:58:25', '2012-10-13 09:58:25', 0, NULL),
(10, 'PVR', 'PVR001', '', '2012-10-13 09:59:03', '2012-10-13 09:59:03', 0, NULL),
(11, 'LeaveAGift', 'LAG001', '', '2012-10-13 09:59:32', '2012-10-13 09:59:32', 0, NULL),
(12, 'test supplier1', 'test', '', '2012-10-21 19:13:51', '2012-10-21 19:13:51', 0, NULL),
(13, 'test supplier1', 'test', '', '2012-10-21 19:15:49', '2012-10-21 19:15:49', 0, NULL),
(14, 'test supplier1', 'test', '', '2012-10-21 19:16:05', '2012-10-21 19:16:05', 0, NULL),
(15, 'test supplier1', 'test', '', '2012-10-21 19:16:26', '2012-10-21 19:16:26', 0, NULL),
(16, 'test supplier1', 'test', '', '2012-10-21 19:17:12', '2012-10-21 19:17:12', 0, NULL),
(17, 'test supplier1', 'test', '', '2012-10-21 19:19:54', '2012-10-21 19:19:54', 0, NULL),
(18, 'test supplier1', 'test', '', '2012-10-21 19:20:08', '2012-10-21 19:20:08', 0, NULL),
(19, 'test supplier1', 'test', '', '2012-10-21 19:20:19', '2012-10-21 19:20:19', 0, NULL),
(20, 'test supplier1', 'test', '', '2012-10-21 19:20:50', '2012-10-21 19:20:50', 0, NULL),
(21, 'test supplier1', 'test', '', '2012-10-21 19:21:05', '2012-10-21 19:21:05', 0, NULL),
(22, 'test supplier1', 'test', '', '2012-10-21 19:21:22', '2012-10-21 19:21:22', 0, NULL),
(23, 'test supplier1', 'test', '', '2012-10-21 19:23:23', '2012-10-21 19:23:23', 0, NULL),
(24, 'test supplier1', 'test', '', '2012-10-21 19:28:45', '2012-10-21 19:28:45', 0, NULL),
(25, 'test supplier1', 'test', '', '2012-10-21 19:29:23', '2012-10-21 19:29:23', 0, NULL),
(26, 'supplier5', 'S2', '', '2012-10-21 19:29:46', '2012-10-21 19:29:46', 0, NULL),
(27, 'supplier5', 'S2', '', '2012-10-21 19:30:39', '2012-10-21 19:30:39', 0, NULL),
(28, 'supplier5', 'S2', '', '2012-10-21 19:30:59', '2012-10-21 19:30:59', 0, NULL),
(29, 'supplier5', 'S2', '', '2012-10-21 19:32:02', '2012-10-21 19:32:02', 0, NULL),
(30, 'supplier5', 'S2', '', '2012-10-21 19:32:22', '2012-10-21 19:32:22', 0, NULL),
(31, 'supplier5', 'S2', '', '2012-10-21 19:33:22', '2012-10-21 19:33:22', 0, NULL),
(32, 'supplier5', 'S2', '', '2012-10-21 19:36:02', '2012-10-21 19:36:02', 0, NULL),
(33, 'supplier5', 'S2', '', '2012-10-21 19:37:17', '2012-10-21 19:37:17', 0, NULL),
(34, 'supplier5', 'S2', '', '2012-10-21 19:37:54', '2012-10-21 19:37:54', 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ps_tag`
--

CREATE TABLE IF NOT EXISTS `ps_tag` (
  `id_tag` int(64) unsigned NOT NULL AUTO_INCREMENT,
  `id_lang` int(10) unsigned NOT NULL,
  `name` varchar(32) NOT NULL,
  PRIMARY KEY (`id_tag`),
  KEY `tag_name` (`name`),
  KEY `id_lang` (`id_lang`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `ps_tag`
--

INSERT INTO `ps_tag` (`id_tag`, `id_lang`, `name`) VALUES
(1, 0, 'E-Voucher'),
(2, 0, 'Gift A Product'),
(3, 0, 'Gift To Charity'),
(4, 0, 'Online Gift - E-Cash'),
(5, 0, 'Online Store Gift Card'),
(6, 0, 'Movie Tickets');

-- --------------------------------------------------------

--
-- Table structure for table `ps_tax`
--

CREATE TABLE IF NOT EXISTS `ps_tax` (
  `id_tax` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rate` decimal(10,3) NOT NULL,
  `active` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_tax`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ps_tax_lang`
--

CREATE TABLE IF NOT EXISTS `ps_tax_lang` (
  `id_tax` int(10) unsigned NOT NULL,
  `id_lang` int(10) unsigned NOT NULL,
  `name` varchar(32) NOT NULL,
  PRIMARY KEY (`id_tax`,`id_lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ps_tax_rule`
--

CREATE TABLE IF NOT EXISTS `ps_tax_rule` (
  `id_tax_rule` int(11) NOT NULL AUTO_INCREMENT,
  `id_tax_rules_group` int(11) NOT NULL,
  `id_country` int(11) NOT NULL,
  `id_state` int(11) NOT NULL,
  `id_county` int(11) NOT NULL,
  `id_tax` int(11) NOT NULL,
  `state_behavior` int(11) NOT NULL,
  `county_behavior` int(11) NOT NULL,
  PRIMARY KEY (`id_tax_rule`),
  UNIQUE KEY `tax_rule` (`id_tax_rules_group`,`id_country`,`id_state`,`id_county`),
  KEY `id_tax_rules_group` (`id_tax_rules_group`),
  KEY `id_tax` (`id_tax`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ps_tax_rules_group`
--

CREATE TABLE IF NOT EXISTS `ps_tax_rules_group` (
  `id_tax_rules_group` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `active` int(11) NOT NULL,
  PRIMARY KEY (`id_tax_rules_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ps_timezone`
--

CREATE TABLE IF NOT EXISTS `ps_timezone` (
  `id_timezone` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  PRIMARY KEY (`id_timezone`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ps_webservice_account`
--

CREATE TABLE IF NOT EXISTS `ps_webservice_account` (
  `id_webservice_account` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(32) NOT NULL,
  `description` text,
  `class_name` varchar(50) NOT NULL DEFAULT 'WebserviceRequest',
  `is_module` tinyint(2) NOT NULL DEFAULT '0',
  `module_name` varchar(50) DEFAULT NULL,
  `active` tinyint(2) NOT NULL,
  PRIMARY KEY (`id_webservice_account`),
  KEY `key` (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ps_webservice_permission`
--

CREATE TABLE IF NOT EXISTS `ps_webservice_permission` (
  `id_webservice_permission` int(11) NOT NULL AUTO_INCREMENT,
  `resource` varchar(50) NOT NULL,
  `method` enum('GET','POST','PUT','DELETE','HEAD') NOT NULL,
  `id_webservice_account` int(11) NOT NULL,
  PRIMARY KEY (`id_webservice_permission`),
  UNIQUE KEY `resource_2` (`resource`,`method`,`id_webservice_account`),
  KEY `resource` (`resource`),
  KEY `method` (`method`),
  KEY `id_webservice_account` (`id_webservice_account`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ps_web_browser`
--

CREATE TABLE IF NOT EXISTS `ps_web_browser` (
  `id_web_browser` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id_web_browser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ps_zone`
--

CREATE TABLE IF NOT EXISTS `ps_zone` (
  `id_zone` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `active` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_zone`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

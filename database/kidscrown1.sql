-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 21, 2024 at 03:49 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kidscrown1`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `status` enum('1','0') NOT NULL DEFAULT '1' COMMENT '1-cart,0-sold'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `user_id`, `product_id`, `quantity`, `status`) VALUES
(9, 13, 31, 2, '1'),
(10, 13, 12, 5, '1'),
(11, 9, 32, 3, '0'),
(12, 9, 36, 4, '0'),
(13, 15, 53, 2, '1'),
(14, 15, 50, 3, '1'),
(15, 12, 41, 5, '1'),
(16, 12, 42, 3, '1'),
(17, 20, 49, 2, '1'),
(18, 20, 40, 3, '1'),
(19, 18, 38, 4, '1'),
(20, 18, 39, 7, '1'),
(21, 17, 44, 3, '1'),
(23, 22, 51, 7, '1'),
(24, 22, 40, 1, '1'),
(25, 22, 36, 3, '1'),
(26, 28, 47, 15, '1'),
(27, 28, 50, 7, '1'),
(28, 27, 52, 11, '1'),
(29, 27, 51, 5, '1'),
(30, 9, 40, 1, '0');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `cat_slug` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `name`, `cat_slug`) VALUES
(1, ' Refill Products', 'laptops'),
(2, ' Kit Products', 'desktop-pc'),
(3, ' Miscellaneous Products', 'tablets'),
(4, ' Airotors', ''),
(5, 'Dental Materials Products', ''),
(6, 'Anesthetic Agents', ''),
(7, 'Preventive Pediatric Dentistry', '');

-- --------------------------------------------------------

--
-- Table structure for table `contact_us`
--

CREATE TABLE `contact_us` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `ClinicName` varchar(200) NOT NULL,
  `Address1` varchar(250) NOT NULL,
  `Address2` varchar(250) NOT NULL,
  `City` varchar(200) NOT NULL,
  `State` varchar(250) NOT NULL,
  `ZipCode` varchar(200) NOT NULL,
  `Country` varchar(250) NOT NULL,
  `mobNo` varchar(250) NOT NULL,
  `Email` varchar(250) NOT NULL,
  `Message` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `contact_us`
--

INSERT INTO `contact_us` (`id`, `name`, `ClinicName`, `Address1`, `Address2`, `City`, `State`, `ZipCode`, `Country`, `mobNo`, `Email`, `Message`) VALUES
(1, '0', 'MedLife CARE', ' gujrat', 'vd', 'fghj', 'tyui', '233227', 'india', ' 9794485787', 'nehalkhan4639@gmail.com', 'hi, i would like to purchase'),
(2, 'NEHAAL', 'MedLife CARE', ' gujrat', 'vd', 'fghj', 'tyui', '233227', 'india', ' 9794485787', 'nehalkhan4639@gmail.com', 'hi, i would like to purchase'),
(3, 'nrjr', 'uk', ' yuio', 'oh', 'yu', 'oj', '56', 'irnf', ' 6540', 'nehalkhan4639@gmail.com', 'no'),
(4, 'nrjr', 'uk', ' yuio', 'oh', 'yu', 'oj', '56', 'irnf', ' 6540', 'nehalkhan4639@gmail.com', 'no'),
(5, 'hjk', 'ukl', ' hjk', 'hjkl', 'yuk', 'ghjk', 'hjk', 'ioij', ' 456+', 'nehalkhan4639@gmail.com', 'no'),
(6, 'mehul', 'mehul clinic', ' fatehgunj,Vadodara', '', 'vadodara', 'gujrat', '416012', 'india', ' 7878456678', 'mehul23@gmail.com', 'Nice Service'),
(7, 'mn', 'MedLife CARE', ' gujrat', 'ggfghj', 'vadodara', 'Utar prades', '233227', 'inidia', ' 6540', 'nehalkhan4639@gmail.com', 'nt intrested');

-- --------------------------------------------------------

--
-- Table structure for table `details`
--

CREATE TABLE `details` (
  `id` int(11) NOT NULL,
  `sales_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `details`
--

INSERT INTO `details` (`id`, `sales_id`, `product_id`, `quantity`) VALUES
(14, 9, 11, 2),
(15, 9, 13, 5),
(16, 9, 3, 2),
(17, 9, 1, 3),
(18, 10, 13, 3),
(19, 10, 2, 4),
(20, 10, 19, 5),
(21, 16, 39, 3),
(22, 17, 39, 3),
(23, 18, 30, 1);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `name` text NOT NULL,
  `description` text NOT NULL,
  `slug` varchar(200) NOT NULL,
  `price` double NOT NULL,
  `photo` varchar(200) NOT NULL,
  `date_view` date NOT NULL,
  `counter` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `category_id`, `name`, `description`, `slug`, `price`, `photo`, `date_view`, `counter`) VALUES
(12, 2, ' KIDS CROWN SS PRIMARY MOLAR INTRO KIT (48 CROWNS)', '<p><em><strong>-&nbsp; 1 Crown of each size (Total 48 Crowns) </strong></em></p>\r\n', 'kids-crown-ss-primary-molar-intro-kit-48-crowns', 5000, 'kids-crown-ss-primary-molar-intro-kit-48-crowns_1710945695.png', '2018-05-12', 3),
(30, 2, 'KIDS CROWN SS PRIMARY MOLAR INTRO KIT (96 CROWNS)', '<div style=\"background:#dedede; border:0px; padding:0px\">\r\n<div style=\"background:transparent; border:0px; padding:0px 15px\">\r\n<div style=\"background:#ffffff; border:0px; padding:20px\">\r\n<div style=\"background:transparent; border:0px; padding:0px 20px\">\r\n<div style=\"background:transparent; border:0px; padding:0px\">2 Crown of each size (Total 96 Crowns)</div>\r\nBuy Now</div>\r\n</div>\r\n</div>\r\n</div>\r\n', 'kids-crown-ss-primary-molar-intro-kit-96-crowns', 4000, 'kids-crown-ss-primary-molar-intro-kit-96-crowns_1710945765.png', '2024-03-21', 1),
(31, 2, 'VITAPEX (2GM SYRINGE)', '<div style=\"background:#dedede; border:0px; padding:0px\">\r\n<div style=\"background:transparent; border:0px; padding:0px 15px\">\r\n<div style=\"background:#ffffff; border:0px; padding:20px\">\r\n<div style=\"background:transparent; border:0px; padding:0px 20px\">\r\n<div style=\"background:transparent; border:0px; padding:0px\">\r\n<ol>\r\n	<li><strong>Premixed paste</strong>&nbsp;- for immediate use with minimal material waste and clean-up</li>\r\n	<li><strong>Syringe tip dilivery</strong>&nbsp;- for excellent access and control during placement</li>\r\n	<li><strong>Formulated with iodoform</strong>&nbsp;- for increased radiopacity and antibacterial effect</li>\r\n	<li><strong>Optimized consistency</strong>&nbsp;- for easier handling and more precies application</li>\r\n	<li><strong>Treatment options</strong>&nbsp;- can also be used with gutty percha and root canal cements</li>\r\n	<li><strong>Economical</strong>&nbsp;- up to 50 filling per syring&nbsp;</li>\r\n</ol>\r\n</div>\r\n&nbsp;</div>\r\n</div>\r\n</div>\r\n</div>\r\n', 'vitapex-2gm-syringe', 600, 'vitapex-2gm-syringe_1710946874.png', '0000-00-00', 0),
(32, 2, 'PERMA CROWN SS MOLAR INTRO KIT (48 CROWNS)', '<div style=\"background:#dedede; border:0px; padding:0px\">\r\n<div style=\"background:transparent; border:0px; padding:0px 15px\">\r\n<div style=\"background:#ffffff; border:0px; padding:20px\">\r\n<div style=\"background:transparent; border:0px; padding:0px 20px\">\r\n<div style=\"background:transparent; border:0px; padding:0px\">\r\n<ol>\r\n	<li><em><strong>Permanent teeth in children or adults</strong></em></li>\r\n	<li><em><strong>Restoration of immature molar enamel or dentin abnormalities (Adolescent patients)</strong></em></li>\r\n	<li><em><strong>Temporary use (After implant fixture placement or Temporary prosthesis)</strong></em></li>\r\n	<li><em><strong>Observation after endo treatment with a poor prognosis and possibility of implantation</strong></em></li>\r\n</ol>\r\n</div>\r\n<em><strong>&nbsp;</strong></em></div>\r\n</div>\r\n</div>\r\n</div>\r\n', 'perma-crown-ss-molar-intro-kit-48-crowns', 300, 'perma-crown-ss-molar-intro-kit-48-crowns_1710946844.png', '2024-03-20', 1),
(33, 2, 'KIDS CROWN WITH RING SS PRIMARY MOLAR INTRO KIT (48 CROWNS)', '<div style=\"background:#dedede; border:0px; padding:0px\">\r\n<div style=\"background:transparent; border:0px; padding:0px 15px\">\r\n<div style=\"background:#ffffff; border:0px; padding:20px\">\r\n<div style=\"background:transparent; border:0px; padding:0px 20px\">\r\n<div style=\"background:transparent; border:0px; padding:0px\">\r\n<ol>\r\n	<li>The ring allows for tying by dental floss, perventing children from swallowing or chewing the crown during application</li>\r\n	<li>Adds extra safety to existing Kids Crown</li>\r\n	<li>The ring can easily be removed with a How Plier</li>\r\n	<li>A total of 48 different sizes (identical configuration to the Kids Crown)</li>\r\n</ol>\r\n</div>\r\n&nbsp;</div>\r\n</div>\r\n</div>\r\n</div>\r\n', 'kids-crown-ring-ss-primary-molar-intro-kit-48-crowns', 700, 'kids-crown-ring-ss-primary-molar-intro-kit-48-crowns_1710945843.png', '0000-00-00', 0),
(34, 1, 'KIDS GOLDEN CROWN SS PRIMARY MOLAR REFILLS', '<ol>\r\n	<li><em><strong>A natural golden luster through titanium coating. Once applied, the color fits seamlessly with surrounding teeth and achieves a high quality aesthetic finish</strong></em></li>\r\n	<li><em><strong>An ergonomic design which eases application without need for furthe work. Pre-trimmed, Pre-contoured and Pre-crimped crowns simulate natural teeth</strong></em></li>\r\n	<li><em><strong>Easy maneuverability reduces procedure time for quick and easy treatment of younger patients&nbsp; &nbsp;</strong></em></li>\r\n</ol>\r\n', 'kids-golden-crown-ss-primary-molar-refills', 300, 'kids-golden-crown-ss-primary-molar-refills.png', '0000-00-00', 0),
(35, 1, ' KIDS CROWN SS PRIMARY MOLAR REFILLS(Stainles Steel)', '<div style=\"background:#dedede; border:0px; padding:0px\">\r\n<div style=\"background:transparent; border:0px; padding:0px 15px\">\r\n<div style=\"background:#ffffff; border:0px; padding:20px\">\r\n<div style=\"background:transparent; border:0px; padding:0px 20px\">\r\n<div style=\"background:transparent; border:0px; padding:0px\"><em><strong>Stainless steel crown protecting damaged deciduous tooth</strong></em></div>\r\n<em><strong>Buy Now</strong></em></div>\r\n</div>\r\n</div>\r\n</div>\r\n', 'kids-crown-ss-primary-molar-refills-stainles-steel', 100, 'kids-crown-ss-primary-molar-refills-stainles-steel_1710946686.png', '2024-03-20', 1),
(36, 1, ' Kids Zirconia Crown', '<div style=\"background:#dedede; border:0px; padding:0px\">\r\n<div style=\"background:transparent; border:0px; padding:0px 15px\">\r\n<div style=\"background:#ffffff; border:0px; padding:20px\">\r\n<div style=\"background:transparent; border:0px; padding:0px 20px\">\r\n<div style=\"background:transparent; border:0px; padding:0px\">\r\n<p><em><strong>1. Minimal Thickness: Which can save your chair time.<br />\r\n2. High Adhesiveness: Special surface treatment gives you strong adhesive with cement.<br />\r\n3. Similar to Natural Tooth in Shape &amp; Color: Designated shape and color to each tooth for esthetically resemble to natural teeth.</strong></em></p>\r\n</div>\r\n<em><strong>&nbsp;</strong></em></div>\r\n</div>\r\n</div>\r\n</div>\r\n', 'kids-zirconia-crown', 740, 'kids-zirconia-crown.png', '2024-03-20', 1),
(37, 1, 'PERMA GOLDEN CROWN SS MOLAR REFILLS', '<div style=\"background:#dedede; border:0px; padding:0px\">\r\n<div style=\"background:transparent; border:0px; padding:0px 15px\">\r\n<div style=\"background:#ffffff; border:0px; padding:20px\">\r\n<div style=\"background:transparent; border:0px; padding:0px 20px\">\r\n<div style=\"background:transparent; border:0px; padding:0px\">\r\n<ol>\r\n	<li><em><strong>If prosthetic treatment is difficult due to the height of remaining teeth</strong></em></li>\r\n	<li><em><strong>If periapical prognosis suspects of confirms teeth agitation</strong></em></li>\r\n	<li><em><strong>If restoration of existing crown is impractical due to possibility of future tooth extraction</strong></em></li>\r\n	<li><em><strong>If prosthetic restoration is difficult due to financial reasons</strong></em></li>\r\n	<li><em><strong>For restoration of immature molar enamel or dentin abnormalities (adolescent patients)</strong></em></li>\r\n</ol>\r\n</div>\r\n<em><strong>&nbsp;</strong></em></div>\r\n</div>\r\n</div>\r\n</div>\r\n', 'perma-golden-crown-ss-molar-refills', 450, 'perma-golden-crown-ss-molar-refills.png', '0000-00-00', 0),
(38, 1, 'STRIP CROWN REFILL', '<p><em><strong>Kids Strip Crown </strong></em></p>\r\n', 'strip-crown-refill', 350, 'strip-crown-refill_1710947543.png', '0000-00-00', 0),
(39, 3, 'Pedo Drapes (Design 1)', '<div style=\"background:#dedede; border:0px; padding:0px\">\r\n<div style=\"background:transparent; border:0px; padding:0px 15px\">\r\n<div style=\"background:#ffffff; border:0px; padding:20px\">\r\n<div style=\"background:transparent; border:0px; padding:0px 20px\">\r\n<div style=\"background:transparent; border:0px; padding:0px\">\r\n<p><em><strong>Made in cotton and washable</strong></em></p>\r\n</div>\r\n<em><strong>&nbsp;</strong></em></div>\r\n</div>\r\n</div>\r\n</div>\r\n', 'pedo-drapes-design-1', 440, 'pedo-drapes-design-1.png', '2024-03-20', 5),
(40, 3, 'Pedo Drapes (Design 3)', '<p><em><strong>Made in cotton and washable </strong></em></p>\r\n', 'pedo-drapes-design-3', 900, 'pedo-drapes-design-3.png', '2024-03-20', 2),
(41, 3, ' Pedo Drapes (Design 4)', '<p>&nbsp;</p>\r\n\r\n<p><em><strong>Pedo Drapes (Design 4) </strong></em></p>\r\n', 'pedo-drapes-design-4', 520, 'pedo-drapes-design-4_1710946722.png', '0000-00-00', 0),
(42, 3, ' Aspiratiing Syringe sleeves', '<p><em><strong>Aspiratiing Syringe sleeves&nbsp; </strong></em></p>\r\n', 'aspiratiing-syringe-sleeves', 250, 'aspiratiing-syringe-sleeves.png', '0000-00-00', 0),
(43, 4, 'Mayox Sicher PLX-100 15W Power Ultra Mini Head Airotor', '<h1>Mayox Sicher PLX-100 15W Power Ultra Mini Head Airotor</h1>\r\n', 'mayox-sicher-plx-100-15w-power-ultra-mini-head-airotor', 500, 'mayox-sicher-plx-100-15w-power-ultra-mini-head-airotor_1710945811.png', '2024-03-12', 1),
(44, 4, ' Ultra Mini head super slim body Px Max 1 Airotor', '<p><em><strong>Mini head Airotor </strong></em></p>\r\n', 'ultra-mini-head-super-slim-body-px-max-1-airotor', 850, 'ultra-mini-head-super-slim-body-px-max-1-airotor.png', '0000-00-00', 0),
(45, 5, ' Root ZX Mini Compact and Accurate', '<p><em><strong>Apex Locator ( Most accurate ) </strong></em></p>\r\n', 'root-zx-mini-compact-and-accurate', 300, 'root-zx-mini-compact-and-accurate.png', '0000-00-00', 0),
(46, 5, ' Voco Twinky Star', '<p><em><strong>Light colored copomer with glitter effects </strong></em></p>\r\n', 'voco-twinky-star', 600, 'voco-twinky-star.png', '0000-00-00', 0),
(47, 5, ' Voco Twinky Star Flow syringe 2g(Pink)', '<p><em><strong>Flowable composite in blue color </strong></em></p>\r\n', 'voco-twinky-star-flow-syringe-2g-pink', 500, 'voco-twinky-star-flow-syringe-2g-pink.png', '2024-03-13', 1),
(48, 5, 'Voco fissurit F pit and fissure sealant 2*2ml syringe', '<p><strong><em>light cured fissure sealant with fluoride realising property </em></strong></p>\r\n', 'voco-fissurit-f-pit-and-fissure-sealant-2-2ml-syringe', 800, 'voco-fissurit-f-pit-and-fissure-sealant-2-2ml-syringe.png', '0000-00-00', 0),
(49, 5, ' NT pedo Gold Files', '<p><em><strong>Advanced heat treated Niti File system </strong></em></p>\r\n', 'nt-pedo-gold-files', 1000, 'nt-pedo-gold-files_1710946776.png', '0000-00-00', 0),
(50, 6, 'Septodont Progel –B', '<p><em><strong>Pre aneasthetic Gel </strong></em></p>\r\n', 'septodont-progel-b', 1200, 'septodont-progel-b.png', '2024-03-13', 1),
(51, 6, ' Septodont Septanest adrenaline (1/100000)', '<p>50 cartridges</p>\r\n', 'septodont-septanest-adrenaline-1-100000', 1300, 'septodont-septanest-adrenaline-1-100000.png', '2024-03-13', 1),
(52, 7, ' Fagamin SDF (per 5ml bottle)', '<div style=\"background:#dedede; border:0px; padding:0px\">\r\n<div style=\"background:transparent; border:0px; padding:0px 15px\">\r\n<div style=\"background:#ffffff; border:0px; padding:20px\">\r\n<div style=\"background:transparent; border:0px; padding:0px 20px\">\r\n<div style=\"background:transparent; border:0px; padding:0px\">\r\n<p><em><strong>SDF is a colorless liquid with a pH of 10, 24.4-28.8% (253, 870 ppm) volume of silver, 5.0-5.9% fluoride (44,800 ppm), and ammonia7,9. This alkaline solution has been shown to aid in the formation of covalent bonds of phosphate groups onto proteins and crystallites to grow10.</strong></em></p>\r\n</div>\r\n<em><strong>Buy Now</strong></em></div>\r\n</div>\r\n</div>\r\n</div>\r\n', 'fagamin-sdf-per-5ml-bottle', 1300, 'fagamin-sdf-per-5ml-bottle.png', '2024-03-13', 1),
(53, 7, 'NT Clear Varnish per Blister (0.4ml) Apple Flavour', '<p><em><strong>Tooth adsorption and excellent coating. Continuous release affect of fluoride. The Protection of dental caries,the effect of hypersensitivity treatment,the function of promoting remineralization. </strong></em></p>\r\n', 'nt-clear-varnish-per-blister-0-4ml-apple-flavour', 1420, 'nt-clear-varnish-per-blister-0-4ml-apple-flavour.png', '0000-00-00', 0),
(54, 7, 'NT Clear Varnish per Blister (0.4ml) Orange Flavour', '<div style=\"background:transparent; border:0px; padding:0px\">\r\n<div style=\"background:transparent; border:0px; padding:0px\">\r\n<div style=\"background:transparent; border:0px; padding:0px\">\r\n<div style=\"background:transparent; border:0px; padding:0px 15px\">\r\n<div style=\"background:transparent; border:0px; padding:0px\">\r\n<div style=\"background:transparent; border:0px; padding:0px\">\r\n<div style=\"background:transparent; border:0px; padding:0px 15px\">\r\n<div style=\"background:#ffffff; border:0px; padding:20px\">\r\n<div style=\"background:transparent; border:0px; padding:0px 20px\">\r\n<div style=\"background:transparent; border:0px; padding:0px\">\r\n<p><em><strong>Tooth adsorption and excellent coating. Continuous release affect of fluoride. The Protection of dental caries,the effect of hypersensitivity treatment,the function of promoting remineralization.</strong></em></p>\r\n</div>\r\n&nbsp;</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n', 'nt-clear-varnish-per-blister-0-4ml-orange-flavour', 555, 'nt-clear-varnish-per-blister-0-4ml-orange-flavour.png', '0000-00-00', 0);

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE `sales` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `pay_id` varchar(50) NOT NULL,
  `sales_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `sales`
--

INSERT INTO `sales` (`id`, `user_id`, `pay_id`, `sales_date`) VALUES
(9, 9, 'PAY-1RT494832H294925RLLZ7TZA', '2018-05-10'),
(10, 9, 'PAY-21700797GV667562HLLZ7ZVY', '2018-05-10'),
(11, 9, 'pi_3OwKBa04T1oBltFO0GhBAc66', '2024-03-20'),
(12, 24, 'pi_3OwLJo04T1oBltFO1mboBlt0', '2024-03-20'),
(13, 24, 'pi_3OwLbl04T1oBltFO1x9k2R9T', '2024-03-20'),
(14, 24, 'pi_3OwLig04T1oBltFO0v3Ec4D5', '2024-03-20'),
(15, 24, 'pi_3OwM8M04T1oBltFO1UXvU2KJ', '2024-03-20'),
(16, 24, 'pi_3OwMDd04T1oBltFO0CuyhDye', '2024-03-20'),
(17, 24, 'pi_3OwMGr04T1oBltFO1EWQaoXr', '2024-03-20'),
(18, 24, 'pi_3Owe6s04T1oBltFO1dBpsCyj', '2024-03-21');

-- --------------------------------------------------------

--
-- Table structure for table `shipping_address`
--

CREATE TABLE `shipping_address` (
  `shipping_id` int(12) NOT NULL,
  `address1` varchar(250) NOT NULL,
  `address2` varchar(250) NOT NULL,
  `city` varchar(250) NOT NULL,
  `state` varchar(250) NOT NULL,
  `pincode` varchar(250) NOT NULL,
  `mobile` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `shipping_address`
--

INSERT INTO `shipping_address` (`shipping_id`, `address1`, `address2`, `city`, `state`, `pincode`, `mobile`) VALUES
(1, 'gct', 'vns', 'lucknow', 'up', '233227 ', '9794485787');

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` int(11) NOT NULL,
  `customer_name` varchar(50) NOT NULL,
  `customer_email` varchar(50) NOT NULL,
  `item_name` varchar(255) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `item_price` float(10,2) NOT NULL,
  `item_price_currency` varchar(10) NOT NULL,
  `paid_amount` float(10,2) NOT NULL,
  `paid_amount_currency` varchar(10) NOT NULL,
  `txn_id` varchar(50) NOT NULL,
  `payment_status` varchar(25) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id`, `customer_name`, `customer_email`, `item_name`, `user_id`, `item_price`, `item_price_currency`, `paid_amount`, `paid_amount_currency`, `txn_id`, `payment_status`, `created`, `modified`) VALUES
(5, 'Harry Den', 'harry@den.com', 'Demo Product', 9, 4760.00, 'USD', 4760.00, 'usd', 'pi_3OwKBa04T1oBltFO0GhBAc66', 'succeeded', '2024-03-20 13:37:29', '2024-03-20 13:37:29'),
(6, 'Prem Ghodake', 'premghodake08@gmail.com', 'Demo Product', 24, 880.00, 'USD', 880.00, 'usd', 'pi_3OwLJo04T1oBltFO1mboBlt0', 'succeeded', '2024-03-20 14:50:18', '2024-03-20 14:50:18'),
(7, 'Prem Ghodake', 'premghodake08@gmail.com', 'Demo Product', 24, 1320.00, 'USD', 1320.00, 'usd', 'pi_3OwLbl04T1oBltFO1x9k2R9T', 'succeeded', '2024-03-20 15:08:16', '2024-03-20 15:08:16'),
(8, 'Prem Ghodake', 'premghodake08@gmail.com', 'Demo Product', 24, 1320.00, 'USD', 1320.00, 'usd', 'pi_3OwLig04T1oBltFO0v3Ec4D5', 'succeeded', '2024-03-20 15:15:25', '2024-03-20 15:15:25'),
(9, 'Prem Ghodake', 'premghodake08@gmail.com', 'Demo Product', 24, 1320.00, 'USD', 1320.00, 'usd', 'pi_3OwM8M04T1oBltFO1UXvU2KJ', 'succeeded', '2024-03-20 15:41:54', '2024-03-20 15:41:54'),
(10, 'Prem Ghodake', 'premghodake08@gmail.com', 'Demo Product', 24, 1320.00, 'USD', 1320.00, 'usd', 'pi_3OwMDd04T1oBltFO0CuyhDye', 'succeeded', '2024-03-20 15:47:30', '2024-03-20 15:47:30'),
(11, 'Prem Ghodake', 'premghodake08@gmail.com', 'Demo Product', 24, 1320.00, 'USD', 1320.00, 'usd', 'pi_3OwMGr04T1oBltFO1EWQaoXr', 'succeeded', '2024-03-20 15:51:00', '2024-03-20 15:51:00'),
(12, 'Prem Ghodake', 'premghodake08@gmail.com', 'Demo Product', 24, 4000.00, 'USD', 4000.00, 'usd', 'pi_3Owe6s04T1oBltFO1dBpsCyj', 'succeeded', '2024-03-21 10:53:38', '2024-03-21 10:53:38');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` varchar(200) NOT NULL,
  `password` varchar(60) NOT NULL,
  `type` int(1) NOT NULL,
  `firstname` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `address` text NOT NULL,
  `contact_info` varchar(100) NOT NULL,
  `photo` varchar(200) NOT NULL,
  `status` int(1) NOT NULL,
  `activate_code` varchar(15) NOT NULL,
  `reset_code` varchar(15) NOT NULL,
  `created_on` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `password`, `type`, `firstname`, `lastname`, `address`, `contact_info`, `photo`, `status`, `activate_code`, `reset_code`, `created_on`) VALUES
(1, 'admin@admin.com', '$2y$10$0SHFfoWzz8WZpdu9Qw//E.tWamILbiNCX7bqhy3od0gvK5.kSJ8N2', 1, ' Dentist', 'Application', '', '', 'KidCrown.png', 1, '', '', '2018-05-01'),
(9, 'harry@den.com', '$2y$10$Oongyx.Rv0Y/vbHGOxywl.qf18bXFiZOcEaI4ZpRRLzFNGKAhObSC', 0, 'Harry', 'Den', 'Silay City, Negros Occidental', '09092735719', 'male2.png', 1, 'k8FBpynQfqsv', 'wzPGkX5IODlTYHg', '2018-05-09'),
(12, 'christine@gmail.com', '$2y$10$ozW4c8r313YiBsf7HD7m6egZwpvoE983IHfZsPRxrO1hWXfPRpxHO', 0, 'Christine', 'becker', 'demo', '7542214500', 'female3.jpg', 1, '', '', '2018-07-09'),
(13, 'nehalkhan4639@gmail.om', '$2y$10$WS6l6mej5zh0lAIoUbg4X.UaGK4HWIOf3w1jBkD0wbUKzClDY6vhu', 0, 'Nehal', 'Khan', 'Varansi , Uttar Pradesh', '9794485787', 'User-Avatar-Profile-PNG.png', 1, '', '', '2024-03-09'),
(14, 'prem123@gmail.com', '$2y$10$gY6JD5YrAEnXtZ/4bmDbRO7/YWV4jMG8XIhfQXFLxYbJE5H0eU4HS', 0, 'Prem', 'Chopra', 'Kolhapur , Mahrastra', '8299471456', 'download (1).jpeg', 1, '', '', '2024-03-09'),
(15, 'nawaj@123gmail.com', '$2y$10$h6gJomsdcmfYRmQuA2yVSupWdo2h8162NI0fzXfRKc0/IqGI0eTe.', 0, 'Nawaj', 'Khan', 'Rajsthan', '8115059646', 'download.jpeg', 1, '', '', '2024-03-09'),
(16, 'kartik@gmail.com', '$2y$10$IYm0XqnnPF6r/blxwXX9W.jxKUJLNPqpz9.9CGHCfizDWuANgoDW.', 0, 'Kartik', 'Singh', 'Gorwa Gujrat', '8176059646', 'kartik.jpeg', 1, '', '', '2024-03-09'),
(17, 'malcolmx@gmail.com', '$2y$10$Z12BvG4J0RCHQj38WRoW7uiyiu0Wm/GP/jiLPM8osHo0siEPc3XOS', 0, 'Malcolm', 'X', 'USA ', '3565654554', 'david.jpeg', 1, '', '', '2024-03-09'),
(18, 'davidwarnr@gmail.com', '$2y$10$tEKXTSLpK3i8MCMpZnOHAOr79GmR1fDgaAyemXDj7LL/ur1RPzsBO', 0, 'David  ', 'Warner', 'Australlia', '2332274554', 'david.jpeg', 1, '', '', '2024-03-09'),
(19, 'johndoe@gmail.com', '$2y$10$QlQStEGTvvxm8dxC5DdjJupKGJYpRaOkErabu7Y/LxbBTBsDrnCUS', 0, 'John', 'Doe', 'United Kingdom', '6565233241', 'john 1.jpeg', 1, '', '', '2024-03-09'),
(20, 'jessygill@gmail.com', '$2y$10$73.oH0d.xlC1lqeioCzHZ.kJhABhvA6LaQPsABnXSOyMmhUKi7FpO', 0, 'Jessy', 'Gill', 'Brampton , South Africa', '8558788741', 'jessy.jpeg', 1, '', '', '2024-03-09'),
(21, 'oyostay@gmail.com', '$2y$10$N/M4S7xvfWAWcuhJQ3dTyOBfZTdKhMBRMOxHPLpSgaoAOt.upxnny', 0, 'oyo', 'stay', '', '', '', 1, 'CZVS5kiwxFmr', '', '2024-03-11'),
(22, 'rajshrivastav@gmail.com', '$2y$10$RO9gdE6lH7.B9.HrpmbJt.C7q6kLDrMUuIAVUgzNKHQKb87NQ1Olm', 0, 'raj', 'shrvastav', '', '', '', 1, 'rJ2AnE9XDBNi', '', '2024-03-11'),
(23, 'nehalkhan4639@gmail.com', '$2y$10$yXq3cnLC3LnBUfn6aaj/t.ZbTwY8k5Xi295HMx5MP63CB9SzCsg7S', 0, 'test', 'k', '', '', '', 1, 'oiVGaAYRTQs2', '', '2024-03-13'),
(24, 'premghodake08@gmail.com', '$2y$10$Vv8jlKsGsFCWcqRpkGPz8uRJrWUqaF3p6GYNC4LJ9Tkz3tlJgATRK', 0, 'Prem', 'Ghodake', 'kolhapur, Maharashtra', '8080288529', 'profile.jpg', 1, 'a3RFqIb571DX', '', '2024-03-13'),
(25, 'singhram16900@gmail.com', '$2y$10$Am1PuNO18B6GXbSURybX0eXlRLHYJyDjt6YeO6gXvSiF3rc1E/kHi', 0, 'kartik', 'singh', '', '', '', 0, 'LbmFO87ePwVz', '', '2024-03-13'),
(26, 'shinanbhamani2016@gmail.com', '$2y$10$gkrgaUeuitAAqaZWVrD/g.hn54w9g.db2QqOGLMUbZr6edD8/gqVu', 0, 'shinan', 'bhamani', '', '', '', 1, 'mSfQUcqB452N', '', '2024-03-13'),
(27, 'shinanbhamani1612@gmail.com', '$2y$10$rYxA7vCNwZp.eF/7Za7Vfe/Nc5Vtf4K5B37tqnVgCR86Sy6XiYmhy', 0, 'shinan', 'bhamani', '', '', '', 1, 'XzdSubGmlaVy', '', '2024-03-13'),
(28, 'katickcric15@gmail.com', '$2y$10$KAtAblx7I8On19we8md4vu2hpUNDDordqu1eO4FJyP.4q7EvKSjVy', 0, ' katiyaa', 'singh', '', '', '', 1, 'LEBYfGKpSVTt', '', '2024-03-13'),
(29, 'permanented12@paruluniversity.ac.in', '$2y$10$YoexpVD4z2fYxsu2lZc3CefcDAI7wRJWXOgIzAHR6E4VdLNo19z1C', 0, 'test', 'test', 'test', '8080288529', 'aboutus.PNG', 1, '', '', '2024-03-21');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contact_us`
--
ALTER TABLE `contact_us`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `details`
--
ALTER TABLE `details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shipping_address`
--
ALTER TABLE `shipping_address`
  ADD PRIMARY KEY (`shipping_id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `contact_us`
--
ALTER TABLE `contact_us`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `details`
--
ALTER TABLE `details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT for table `sales`
--
ALTER TABLE `sales`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `shipping_address`
--
ALTER TABLE `shipping_address`
  MODIFY `shipping_id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

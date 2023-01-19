-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Sep 19, 2022 at 01:23 PM
-- Server version: 5.7.36
-- PHP Version: 8.1.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `reklam`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '0 is passif, 1 is opened',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `title`, `status`, `created_at`, `updated_at`) VALUES
(1, 'BillBoard', 1, '2022-05-07 06:56:29', '2022-05-07 06:56:29'),
(2, 'Sabit Çatı Pano', 1, '2022-05-07 06:56:44', '2022-05-07 06:56:44'),
(3, 'Sabit Pano', 1, '2022-05-07 06:56:52', '2022-05-07 06:56:52'),
(4, 'Prizmatik Pano', 1, '2022-05-07 06:57:01', '2022-05-07 06:57:01'),
(5, 'Lightbox', 1, '2022-05-07 06:57:31', '2022-05-07 06:57:31'),
(6, 'Display Pano', 1, '2022-05-07 06:57:36', '2022-05-07 06:57:36'),
(7, 'Paravan', 1, '2022-05-07 06:57:45', '2022-05-07 06:57:45'),
(8, 'Duvar Pano', 1, '2022-05-07 06:58:53', '2022-05-07 06:58:53'),
(9, 'TAK', 1, '2022-05-07 06:59:00', '2022-05-07 06:59:00'),
(10, 'Yürüyen Merdiven', 1, '2022-05-07 06:59:18', '2022-05-07 06:59:18');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Stand-in structure for view `items_v`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `items_v`;
CREATE TABLE IF NOT EXISTS `items_v` (
`item_id` bigint(20) unsigned
,`id` bigint(20) unsigned
,`product_id` bigint(20) unsigned
,`reservationEndTime` datetime
,`item_status` tinyint(1)
,`reservationStartTime` datetime
,`location_title` varchar(255)
,`category_title` varchar(255)
,`sideName` varchar(255)
,`side_type` enum('front','backend')
,`categories_id` bigint(20) unsigned
,`locations_id` bigint(20) unsigned
,`lat` varchar(255)
,`lng` varchar(255)
,`name` varchar(255)
,`currency_type` enum('constantPrice','uniquePrice')
,`constantPrices` decimal(9,2)
,`m2Square` int(11)
,`frontSideImg` varchar(255)
,`backendSideImg` varchar(255)
,`status` tinyint(1)
,`created_at` timestamp
,`updated_at` timestamp
,`products_id` bigint(20) unsigned
,`product_price_id` bigint(20) unsigned
,`dollarM2Price` decimal(9,2)
,`gpM2Price` decimal(9,2)
,`tlM2Price` decimal(9,2)
,`euroM2Price` decimal(9,2)
,`dollarM2PriceTotal` decimal(9,2)
,`gpM2PriceTotal` decimal(9,2)
,`tlM2PriceTotal` decimal(9,2)
,`euroM2PriceTotal` decimal(9,2)
);

-- --------------------------------------------------------

--
-- Table structure for table `locations`
--

DROP TABLE IF EXISTS `locations`;
CREATE TABLE IF NOT EXISTS `locations` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `locations`
--

INSERT INTO `locations` (`id`, `title`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Lefkoşa', 1, '2022-05-07 07:00:47', '2022-05-07 07:00:47'),
(2, 'Girne', 1, '2022-05-07 07:01:36', '2022-05-07 07:01:36'),
(3, 'Girne Ana Yolu Üzeri', 1, '2022-05-07 07:02:38', '2022-05-07 07:02:38'),
(4, 'Mağusa - İskele Ana Yolu Üzeri', 1, '2022-05-07 07:02:59', '2022-05-07 07:02:59'),
(5, 'Lefke', 1, '2022-05-07 07:03:15', '2022-05-07 07:03:15'),
(6, 'Boğaz', 1, '2022-05-07 07:03:28', '2022-05-07 07:03:28'),
(7, 'Ercan Hava Limanı Yolu Üzeri', 1, '2022-05-07 07:04:19', '2022-05-07 07:04:19'),
(8, 'Erülkü Yolu Üzeri / Demirhan', 1, '2022-05-07 07:05:37', '2022-05-07 07:05:37'),
(9, 'Alsancak', 1, '2022-05-07 07:05:55', '2022-05-07 07:05:55'),
(10, 'Mağusa', 1, '2022-05-07 07:06:18', '2022-05-07 07:06:18');

-- --------------------------------------------------------

--
-- Table structure for table `location_categories`
--

DROP TABLE IF EXISTS `location_categories`;
CREATE TABLE IF NOT EXISTS `location_categories` (
  `relation_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `locations_id` bigint(20) UNSIGNED DEFAULT NULL,
  `categories_id` bigint(20) UNSIGNED DEFAULT NULL,
  PRIMARY KEY (`relation_id`),
  KEY `location_categories_locations_id_foreign` (`locations_id`),
  KEY `location_categories_categories_id_foreign` (`categories_id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `location_categories`
--

INSERT INTO `location_categories` (`relation_id`, `locations_id`, `categories_id`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 1, 4),
(5, 2, 1),
(6, 2, 2),
(7, 2, 3),
(8, 2, 4),
(9, 3, 1),
(10, 3, 2),
(11, 3, 3),
(12, 3, 4),
(13, 4, 5),
(14, 4, 6),
(15, 4, 7),
(16, 4, 8),
(17, 4, 9),
(18, 5, 1),
(19, 5, 2),
(20, 5, 3),
(21, 5, 4),
(22, 6, 1),
(23, 6, 2),
(24, 6, 3),
(25, 6, 4),
(30, 7, 1),
(31, 7, 2),
(32, 7, 3),
(33, 7, 4),
(34, 8, 1),
(35, 8, 2),
(36, 8, 3),
(37, 8, 4),
(38, 9, 1),
(39, 9, 2),
(40, 9, 3),
(41, 9, 4),
(42, 10, 1),
(43, 10, 2),
(44, 10, 3),
(45, 10, 4);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2022_02_19_114852_create_categories_table', 1),
(6, '2022_02_19_134244_create_locations_table', 1),
(8, '2022_02_19_165023_create_products_table', 3),
(9, '2022_02_22_181038_create_product_items_table', 3),
(10, '2022_02_22_191950_create_product_prices_table', 4),
(11, '2022_02_05_135018_create_reservations_table', 5),
(12, '2022_02_05_140846_create_reservation_items_table', 5),
(13, '2022_02_19_134832_create_location_categories_table', 6);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
CREATE TABLE IF NOT EXISTS `products` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `categories_id` bigint(20) UNSIGNED DEFAULT NULL,
  `locations_id` bigint(20) UNSIGNED DEFAULT NULL,
  `lat` varchar(255) DEFAULT NULL,
  `lng` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `currency_type` enum('constantPrice','uniquePrice') NOT NULL,
  `constantPrices` decimal(9,2) DEFAULT NULL,
  `m2Square` int(11) DEFAULT NULL,
  `frontSideImg` varchar(255) DEFAULT NULL,
  `backendSideImg` varchar(255) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `products_locations_id_foreign` (`locations_id`),
  KEY `products_categories_id_foreign` (`categories_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `categories_id`, `locations_id`, `lat`, `lng`, `name`, `currency_type`, `constantPrices`, `m2Square`, `frontSideImg`, `backendSideImg`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '35.1829146', '33.3617652', 'Beach Volley Arena önü', 'constantPrice', '50000.00', 0, 'beach-volley-arena-onu-f-image.jpeg', 'no-image.jpg', 1, '2022-06-08 12:58:46', '2022-06-08 12:58:46'),
(3, 4, 1, '35.1855659', '33.38227639999999', 'Alpet karşısı - Sosyal konutlar önü', 'uniquePrice', '0.00', 10, 'alpet-karsisi-sosyal-konutlar-onu-f-image.png', 'alpet-karsisi-sosyal-konutlar-onu-b-image.png', 1, '2022-06-08 13:40:22', '2022-06-08 13:40:22'),
(4, 1, 1, '35.1829146', '33.3617652', 'Dereboyu - Metehan kavşağı', 'constantPrice', '5000.00', 0, 'dereboyu-metehan-kavsagi-f-image.png', 'dereboyu-metehan-kavsagi-b-image.png', 1, '2022-06-08 13:42:23', '2022-06-08 13:42:23');

-- --------------------------------------------------------

--
-- Stand-in structure for view `products_v`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `products_v`;
CREATE TABLE IF NOT EXISTS `products_v` (
`location_title` varchar(255)
,`category_title` varchar(255)
,`id` bigint(20) unsigned
,`categories_id` bigint(20) unsigned
,`locations_id` bigint(20) unsigned
,`lat` varchar(255)
,`lng` varchar(255)
,`name` varchar(255)
,`currency_type` enum('constantPrice','uniquePrice')
,`constantPrices` decimal(9,2)
,`m2Square` int(11)
,`frontSideImg` varchar(255)
,`backendSideImg` varchar(255)
,`status` tinyint(1)
,`sideName` varchar(255)
,`created_at` timestamp
,`updated_at` timestamp
);

-- --------------------------------------------------------

--
-- Table structure for table `product_items`
--

DROP TABLE IF EXISTS `product_items`;
CREATE TABLE IF NOT EXISTS `product_items` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `products_id` bigint(20) UNSIGNED DEFAULT NULL,
  `sideName` varchar(255) DEFAULT NULL,
  `side_type` enum('front','backend') DEFAULT NULL,
  `reservationStartTime` datetime DEFAULT NULL,
  `reservationEndTime` datetime DEFAULT NULL,
  `sideImg` varchar(255) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_items_products_id_foreign` (`products_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `product_items`
--

INSERT INTO `product_items` (`id`, `products_id`, `sideName`, `side_type`, `reservationStartTime`, `reservationEndTime`, `sideImg`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, '1A', 'front', '2022-06-01 00:00:00', NULL, 'no-image.png', 1, NULL, NULL),
(3, 3, '2A', 'front', '2022-06-08 00:00:00', '2022-06-30 00:00:00', 'no-image.png', 0, NULL, '2022-06-11 03:51:48'),
(4, 3, '2B', 'backend', '2022-06-08 00:00:00', NULL, 'no-image.png', 1, NULL, NULL),
(5, 4, '3A', 'front', NULL, NULL, 'no-image.png', 1, NULL, NULL),
(6, 4, '3B', 'backend', NULL, NULL, 'no-image.png', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `product_prices`
--

DROP TABLE IF EXISTS `product_prices`;
CREATE TABLE IF NOT EXISTS `product_prices` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `products_id` bigint(20) UNSIGNED DEFAULT NULL,
  `dollarM2Price` decimal(9,2) DEFAULT NULL,
  `gpM2Price` decimal(9,2) DEFAULT NULL,
  `tlM2Price` decimal(9,2) DEFAULT NULL,
  `euroM2Price` decimal(9,2) DEFAULT NULL,
  `dollarM2PriceTotal` decimal(9,2) DEFAULT NULL,
  `gpM2PriceTotal` decimal(9,2) DEFAULT NULL,
  `tlM2PriceTotal` decimal(9,2) DEFAULT NULL,
  `euroM2PriceTotal` decimal(9,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_prices_products_id_foreign` (`products_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `product_prices`
--

INSERT INTO `product_prices` (`id`, `products_id`, `dollarM2Price`, `gpM2Price`, `tlM2Price`, `euroM2Price`, `dollarM2PriceTotal`, `gpM2PriceTotal`, `tlM2PriceTotal`, `euroM2PriceTotal`, `created_at`, `updated_at`) VALUES
(1, 3, '5.00', '5.00', '5.00', '5.00', '50.00', '50.00', '50.00', '50.00', '2022-06-08 13:40:22', '2022-06-08 13:40:22');

-- --------------------------------------------------------

--
-- Table structure for table `reservations`
--

DROP TABLE IF EXISTS `reservations`;
CREATE TABLE IF NOT EXISTS `reservations` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `rezervasyon_notu` text COLLATE utf8mb4_unicode_ci,
  `pay_currency_tag` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `buyer_surname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `buyer_phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `buyer_email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `buyer_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reservation_status` enum('0','1','2','3') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT '0 onay beklemede, 1 onaylandı reservasyon devam ediyor, 2 iptal edildi, 3 reservasyon tamamlandı',
  `toplam_firma_rezervasyon_bedeli` decimal(8,2) DEFAULT NULL COMMENT 'toplam firma anlaşma bedeli',
  `company_detail` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `reservations`
--

INSERT INTO `reservations` (`id`, `rezervasyon_notu`, `pay_currency_tag`, `buyer_surname`, `buyer_phone`, `buyer_email`, `buyer_name`, `reservation_status`, `toplam_firma_rezervasyon_bedeli`, `company_detail`, `created_at`, `updated_at`) VALUES
(1, NULL, '£', 'HaaDOmtugbK', '376', 'isalemuc@seninak.at', 'Nuv', '3', '51665.00', NULL, '2022-06-08 16:27:11', '2022-06-11 02:05:22'),
(2, NULL, '£', 'Hays', '13', 'ramar@mailinator.com', 'Brynn Fields', '3', '5995.00', NULL, '2022-06-08 20:14:45', '2022-06-08 17:27:41'),
(3, NULL, '₺', 'Hays', '13', 'ramar@mailinator.com', 'Brynn Fields', '3', '10086.00', NULL, '2022-06-08 20:28:15', '2022-06-08 18:10:13'),
(4, NULL, '£', 'Hays', '13', 'ramar@mailinator.com', 'Brynn Fields', '0', '10086.00', NULL, '2022-06-08 21:10:20', '2022-06-08 18:37:17');

-- --------------------------------------------------------

--
-- Table structure for table `reservation_items`
--

DROP TABLE IF EXISTS `reservation_items`;
CREATE TABLE IF NOT EXISTS `reservation_items` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `reservation_id` bigint(20) NOT NULL,
  `item_id` bigint(20) NOT NULL,
  `category_id` int(11) NOT NULL,
  `relation_id` int(11) DEFAULT NULL COMMENT 'location_categories deki ID',
  `baski_montaj_bedeli` decimal(9,2) DEFAULT NULL,
  `toplam_baski_bedeli` decimal(9,2) DEFAULT NULL,
  `reservation_start_datetime` datetime DEFAULT NULL,
  `reservation_end_datetime` datetime DEFAULT NULL,
  `toplam_baski_montaj_sokme_bedeli` decimal(9,2) DEFAULT NULL,
  `toplam_kira_bedeli` decimal(8,2) DEFAULT NULL,
  `toplam_rezarvasyon_bedeli` decimal(8,2) DEFAULT NULL,
  `item_status` enum('0','1','2','3') CHARACTER SET utf8 DEFAULT NULL COMMENT '0 onaylı , 1 iptal edildi',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `pay_currency_tag` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `reservation_items`
--

INSERT INTO `reservation_items` (`id`, `reservation_id`, `item_id`, `category_id`, `relation_id`, `baski_montaj_bedeli`, `toplam_baski_bedeli`, `reservation_start_datetime`, `reservation_end_datetime`, `toplam_baski_montaj_sokme_bedeli`, `toplam_kira_bedeli`, `toplam_rezarvasyon_bedeli`, `item_status`, `created_at`, `updated_at`, `pay_currency_tag`, `product_id`) VALUES
(1, 1, 1, 1, NULL, '555.00', '555.00', '2022-06-04 00:00:00', '2022-06-30 00:00:00', '555.00', NULL, '51665.00', '3', NULL, '2022-06-11 02:05:22', '£', 1),
(2, 2, 4, 4, NULL, '555.00', '55.00', '2022-06-04 00:00:00', '2022-06-30 00:00:00', '55.00', NULL, '5830.00', '3', NULL, '2022-06-08 17:27:41', '£', 3),
(3, 2, 6, 1, NULL, '55.00', '55.00', '2022-06-04 00:00:00', '2022-06-30 00:00:00', '55.00', NULL, '5995.00', '3', NULL, '2022-06-08 17:27:41', '£', 4),
(4, 2, 5, 1, NULL, '55.00', '55.00', '2022-06-04 00:00:00', '2022-06-30 00:00:00', '55.00', NULL, '5165.00', '3', NULL, '2022-06-08 17:27:41', '£', 4),
(5, 3, 4, 4, NULL, '5.00', '5.00', '2022-06-04 00:00:00', '2022-06-30 00:00:00', '5.00', NULL, '65.00', '3', NULL, '2022-06-08 18:10:13', '₺', 3),
(6, 3, 6, 1, NULL, '3.00', '3.00', '2022-06-04 00:00:00', '2022-06-30 00:00:00', '3.00', NULL, '5009.00', '3', NULL, '2022-06-08 18:10:13', '₺', 4),
(7, 3, 5, 1, NULL, '4.00', '4.00', '2022-06-04 00:00:00', '2022-06-30 00:00:00', '4.00', NULL, '5012.00', '3', NULL, '2022-06-08 18:10:13', '₺', 4),
(8, 4, 4, 4, NULL, '3.00', '3.00', '2022-06-04 00:00:00', '2022-06-30 00:00:00', '3.00', NULL, '59.00', '0', NULL, '2022-06-08 18:37:17', '£', 3),
(9, 4, 6, 1, NULL, '4.00', '4.00', '2022-06-04 00:00:00', '2022-06-30 00:00:00', '4.00', NULL, '5012.00', '0', NULL, '2022-06-08 18:37:17', '£', 4),
(10, 4, 5, 1, NULL, '5.00', '5.00', '2022-06-04 00:00:00', '2022-06-30 00:00:00', '5.00', NULL, '5015.00', '0', NULL, '2022-06-08 18:37:17', '£', 4);

-- --------------------------------------------------------

--
-- Stand-in structure for view `reservation_items_v`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `reservation_items_v`;
CREATE TABLE IF NOT EXISTS `reservation_items_v` (
`location_title` varchar(255)
,`category_title` varchar(255)
,`title` varchar(255)
,`sideName` varchar(255)
,`imageF` varchar(255)
,`imageB` varchar(255)
,`ebat` int(11)
,`lat` varchar(255)
,`lng` varchar(255)
,`reservation_item_id` bigint(20) unsigned
,`category_id` int(11)
,`reservation_id` bigint(20)
,`pay_currency_tag` varchar(255)
,`baski_montaj_bedeli` decimal(9,2)
,`toplam_baski_bedeli` decimal(9,2)
,`reservation_start_datetime` datetime
,`reservation_end_datetime` datetime
,`toplam_baski_montaj_sokme_bedeli` decimal(9,2)
,`toplam_kira_bedeli` decimal(8,2)
,`toplam_rezarvasyon_bedeli` decimal(8,2)
,`item_id` bigint(20)
,`item_status` enum('0','1','2','3')
,`tlM2Price` decimal(9,2)
,`dollarM2Price` decimal(9,2)
,`gpM2Price` decimal(9,2)
,`euroM2Price` decimal(9,2)
,`dollarM2PriceTotal` decimal(9,2)
,`gpM2PriceTotal` decimal(9,2)
,`tlM2PriceTotal` decimal(9,2)
,`euroM2PriceTotal` decimal(9,2)
,`currency_type` varchar(13)
,`constantPrices` decimal(9,2)
,`created_at` timestamp
,`updated_at` timestamp
);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Güven', 'admin@kibristareklam.com', '2022-02-19 14:43:56', '$2a$12$WrcuWnKKfzd7CyZE90isS.Rp5H9ekZ6.W36Gufbt3bMrNIBMD8nSu', 'fUAKQ7TIwvR2kQutAYUqVI43hz1PM462g7EHlu238SM3miStpBYQ8fxi7QEB', '2022-02-19 14:44:07', '2022-02-19 14:44:09');

-- --------------------------------------------------------

--
-- Structure for view `items_v`
--
DROP TABLE IF EXISTS `items_v`;

DROP VIEW IF EXISTS `items_v`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `items_v`  AS SELECT `pi`.`id` AS `item_id`, `pi`.`id` AS `id`, `products`.`id` AS `product_id`, `pi`.`reservationEndTime` AS `reservationEndTime`, `pi`.`status` AS `item_status`, `pi`.`reservationStartTime` AS `reservationStartTime`, `l`.`title` AS `location_title`, `c`.`title` AS `category_title`, `pi`.`sideName` AS `sideName`, `pi`.`side_type` AS `side_type`, `products`.`categories_id` AS `categories_id`, `products`.`locations_id` AS `locations_id`, `products`.`lat` AS `lat`, `products`.`lng` AS `lng`, `products`.`name` AS `name`, `products`.`currency_type` AS `currency_type`, `products`.`constantPrices` AS `constantPrices`, `products`.`m2Square` AS `m2Square`, `products`.`frontSideImg` AS `frontSideImg`, `products`.`backendSideImg` AS `backendSideImg`, `products`.`status` AS `status`, `products`.`created_at` AS `created_at`, `products`.`updated_at` AS `updated_at`, `pp`.`products_id` AS `products_id`, `pp`.`id` AS `product_price_id`, `pp`.`dollarM2Price` AS `dollarM2Price`, `pp`.`gpM2Price` AS `gpM2Price`, `pp`.`tlM2Price` AS `tlM2Price`, `pp`.`euroM2Price` AS `euroM2Price`, `pp`.`dollarM2PriceTotal` AS `dollarM2PriceTotal`, `pp`.`gpM2PriceTotal` AS `gpM2PriceTotal`, `pp`.`tlM2PriceTotal` AS `tlM2PriceTotal`, `pp`.`euroM2PriceTotal` AS `euroM2PriceTotal` FROM ((((`products` left join `product_items` `pi` on((`products`.`id` = `pi`.`products_id`))) left join `categories` `c` on((`products`.`categories_id` = `c`.`id`))) left join `locations` `l` on((`products`.`locations_id` = `l`.`id`))) left join `product_prices` `pp` on((`products`.`id` = `pp`.`products_id`))) ;

-- --------------------------------------------------------

--
-- Structure for view `products_v`
--
DROP TABLE IF EXISTS `products_v`;

DROP VIEW IF EXISTS `products_v`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `products_v`  AS SELECT `l`.`title` AS `location_title`, `c`.`title` AS `category_title`, `products`.`id` AS `id`, `products`.`categories_id` AS `categories_id`, `products`.`locations_id` AS `locations_id`, `products`.`lat` AS `lat`, `products`.`lng` AS `lng`, `products`.`name` AS `name`, `products`.`currency_type` AS `currency_type`, `products`.`constantPrices` AS `constantPrices`, `products`.`m2Square` AS `m2Square`, `products`.`frontSideImg` AS `frontSideImg`, `products`.`backendSideImg` AS `backendSideImg`, `products`.`status` AS `status`, `pi`.`sideName` AS `sideName`, `products`.`created_at` AS `created_at`, `products`.`updated_at` AS `updated_at` FROM (((`products` left join `locations` `l` on((`products`.`locations_id` = `l`.`id`))) left join `categories` `c` on((`products`.`categories_id` = `c`.`id`))) left join `product_items` `pi` on((`products`.`id` = `pi`.`products_id`))) ;

-- --------------------------------------------------------

--
-- Structure for view `reservation_items_v`
--
DROP TABLE IF EXISTS `reservation_items_v`;

DROP VIEW IF EXISTS `reservation_items_v`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `reservation_items_v`  AS SELECT `items_v`.`location_title` AS `location_title`, `items_v`.`category_title` AS `category_title`, `items_v`.`name` AS `title`, `items_v`.`sideName` AS `sideName`, `items_v`.`frontSideImg` AS `imageF`, `items_v`.`backendSideImg` AS `imageB`, `items_v`.`m2Square` AS `ebat`, `items_v`.`lat` AS `lat`, `items_v`.`lng` AS `lng`, `reservation_items`.`id` AS `reservation_item_id`, `reservation_items`.`category_id` AS `category_id`, `reservation_items`.`reservation_id` AS `reservation_id`, `reservation_items`.`pay_currency_tag` AS `pay_currency_tag`, `reservation_items`.`baski_montaj_bedeli` AS `baski_montaj_bedeli`, `reservation_items`.`toplam_baski_bedeli` AS `toplam_baski_bedeli`, `reservation_items`.`reservation_start_datetime` AS `reservation_start_datetime`, `reservation_items`.`reservation_end_datetime` AS `reservation_end_datetime`, `reservation_items`.`toplam_baski_montaj_sokme_bedeli` AS `toplam_baski_montaj_sokme_bedeli`, `reservation_items`.`toplam_kira_bedeli` AS `toplam_kira_bedeli`, `reservation_items`.`toplam_rezarvasyon_bedeli` AS `toplam_rezarvasyon_bedeli`, `reservation_items`.`item_id` AS `item_id`, `reservation_items`.`item_status` AS `item_status`, `pp`.`tlM2Price` AS `tlM2Price`, `pp`.`dollarM2Price` AS `dollarM2Price`, `pp`.`gpM2Price` AS `gpM2Price`, `pp`.`euroM2Price` AS `euroM2Price`, `pp`.`dollarM2PriceTotal` AS `dollarM2PriceTotal`, `pp`.`gpM2PriceTotal` AS `gpM2PriceTotal`, `pp`.`tlM2PriceTotal` AS `tlM2PriceTotal`, `pp`.`euroM2PriceTotal` AS `euroM2PriceTotal`, (select `p`.`currency_type` from `products` `p` where (`p`.`id` = `reservation_items`.`product_id`)) AS `currency_type`, (select `p`.`constantPrices` from `products` `p` where (`p`.`id` = `reservation_items`.`product_id`)) AS `constantPrices`, `reservation_items`.`created_at` AS `created_at`, `reservation_items`.`updated_at` AS `updated_at` FROM (((`reservation_items` left join `items_v` on((`reservation_items`.`item_id` = `items_v`.`item_id`))) left join `product_prices` `pp` on((`items_v`.`product_price_id` = `pp`.`id`))) left join `products` `p` on((`p`.`id` = `pp`.`products_id`))) ;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `location_categories`
--
ALTER TABLE `location_categories`
  ADD CONSTRAINT `location_categories_categories_id_foreign` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `location_categories_locations_id_foreign` FOREIGN KEY (`locations_id`) REFERENCES `locations` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_categories_id_foreign` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `products_locations_id_foreign` FOREIGN KEY (`locations_id`) REFERENCES `locations` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_items`
--
ALTER TABLE `product_items`
  ADD CONSTRAINT `product_items_products_id_foreign` FOREIGN KEY (`products_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_prices`
--
ALTER TABLE `product_prices`
  ADD CONSTRAINT `product_prices_products_id_foreign` FOREIGN KEY (`products_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

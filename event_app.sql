-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Sep 19, 2022 at 01:20 PM
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
-- Database: `event_app`
--

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

DROP TABLE IF EXISTS `cities`;
CREATE TABLE IF NOT EXISTS `cities` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `CityName` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Positions` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'locations lng and lnt',
  `Status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cities`
--

INSERT INTO `cities` (`id`, `CityName`, `Positions`, `Status`, `created_at`, `updated_at`) VALUES
(11, 'Mağusa', '{\"lat\":35.1149116,\"lng\":33.919245}', 1, '2022-09-04 10:51:54', '2022-09-04 10:51:54'),
(9, 'Girne', '{\"lat\":35.3322825,\"lng\":33.3195479}', 1, '2022-07-24 13:45:29', '2022-07-24 13:45:29');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
CREATE TABLE IF NOT EXISTS `customers` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `surname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Status` tinyint(1) NOT NULL DEFAULT '1',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `name`, `surname`, `email`, `phone`, `email_verified_at`, `password`, `Status`, `remember_token`, `created_at`, `updated_at`) VALUES
(15, 'Azamat', 'Yadygerov', 'azamat1696@gmail.com', '05488321631', NULL, '$2y$10$XzZrsi3U.z4X2HE.OWsSzOFWNpOsVs8wTlPBOdJMp8sppKGlcE92m', 1, NULL, '2022-09-05 16:50:06', '2022-09-05 17:02:22');

-- --------------------------------------------------------

--
-- Table structure for table `districts`
--

DROP TABLE IF EXISTS `districts`;
CREATE TABLE IF NOT EXISTS `districts` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `city_id` bigint(20) UNSIGNED DEFAULT NULL,
  `DistrictName` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Positions` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `districts_city_id_foreign` (`city_id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `districts`
--

INSERT INTO `districts` (`id`, `city_id`, `DistrictName`, `Positions`, `Status`, `created_at`, `updated_at`) VALUES
(9, 11, 'Gazimağusa Limanı, Havva Şentürk Yolu Sokak, Famagusta', '{\"lat\":35.1937,\"lng\":33.357}', 1, '2022-09-04 18:15:38', '2022-09-04 18:15:38'),
(7, 9, 'Lapta Sahil Yürüyüş Yolu, Lapta', '{\"lat\":35.3565305,\"lng\":33.1509125}', 1, '2022-07-24 13:48:01', '2022-07-24 13:55:23');

-- --------------------------------------------------------

--
-- Stand-in structure for view `eventcustomers`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `eventcustomers`;
CREATE TABLE IF NOT EXISTS `eventcustomers` (
`customer_id` bigint(20) unsigned
,`name` varchar(255)
,`surname` varchar(255)
,`email` varchar(255)
,`phone` varchar(255)
,`EventName` varchar(255)
,`id` bigint(20) unsigned
,`Status` tinyint(1)
,`EventDescription` longtext
,`Banner` varchar(255)
,`StartDateTime` datetime
,`EndDateTime` datetime
,`restaurant_id` bigint(20)
);

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

DROP TABLE IF EXISTS `events`;
CREATE TABLE IF NOT EXISTS `events` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `EventName` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `restaurant_id` bigint(20) NOT NULL,
  `EventDescription` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `Status` tinyint(1) NOT NULL,
  `Banner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `StartDateTime` datetime NOT NULL,
  `EndDateTime` datetime NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `events_restaurant_id_foreign` (`restaurant_id`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`id`, `EventName`, `restaurant_id`, `EventDescription`, `Status`, `Banner`, `StartDateTime`, `EndDateTime`, `created_at`, `updated_at`) VALUES
(18, 'Deneme Etkinlik 1', 17, 'Merit Hootel  etkinlik Açıklama', 1, 'deneme-etkinlik-1-150544.jpg', '2022-09-09 20:00:00', '2022-09-09 23:00:00', '2022-09-08 01:10:54', '2022-09-08 01:10:54'),
(17, 'Bahar Şenliği 2', 17, 'Açıklama buraya geleccek', 1, 'bahar-senligi-2-626547.jpg', '2022-09-09 20:00:00', '2022-09-09 23:00:00', '2022-09-08 01:07:58', '2022-09-08 01:07:58'),
(16, 'Etkinlik deneme 1', 18, 'Etkinlik deneme', 1, 'etkinlik-deneme-1-467237.jpg', '2022-09-08 12:30:00', '2022-09-08 12:55:00', '2022-09-05 18:02:29', '2022-09-05 18:02:29'),
(15, 'Etkinlik deneme 2', 18, 'Etkinlik deneme', 1, 'etkinlik-deneme-1-684832.jpg', '2022-09-08 12:30:00', '2022-09-08 12:55:00', '2022-09-05 18:02:07', '2022-09-05 18:31:06'),
(14, 'Etkinlik deneme 3', 18, 'Etkinlik deneme', 1, 'etkinlik-deneme-1-487748.jpg', '2022-09-08 12:30:00', '2022-09-08 12:55:00', '2022-09-05 17:57:49', '2022-09-05 18:31:17'),
(13, 'Etkinlik deneme', 18, 'Etkinlik deneme', 1, 'etkinlik-deneme-1-151562.jpg', '2022-09-08 12:30:00', '2022-09-08 12:55:00', '2022-09-05 17:51:38', '2022-09-05 18:31:31'),
(12, 'Bahar Şenlği', 17, 'Bahar şenliğpi Açıklama', 1, 'bahar-senlgi-22041.jpg', '2022-09-20 20:00:00', '2022-09-20 12:00:00', '2022-09-04 18:21:22', '2022-09-04 18:21:22');

-- --------------------------------------------------------

--
-- Stand-in structure for view `eventsandcustomers`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `eventsandcustomers`;
CREATE TABLE IF NOT EXISTS `eventsandcustomers` (
`customer_id` bigint(20) unsigned
,`name` varchar(255)
,`surname` varchar(255)
,`email` varchar(255)
,`phone` varchar(255)
,`EventName` varchar(255)
,`id` bigint(20) unsigned
,`Status` tinyint(1)
,`EventDescription` longtext
,`Banner` varchar(255)
,`StartDateTime` datetime
,`EndDateTime` datetime
,`restaurant_id` bigint(20)
);

-- --------------------------------------------------------

--
-- Table structure for table `event_customer_register`
--

DROP TABLE IF EXISTS `event_customer_register`;
CREATE TABLE IF NOT EXISTS `event_customer_register` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `event_id` bigint(20) NOT NULL,
  `customer_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `event_customer_register_event_id_foreign` (`event_id`),
  KEY `event_customer_register_customer_id_foreign` (`customer_id`)
) ENGINE=MyISAM AUTO_INCREMENT=99 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `event_customer_register`
--

INSERT INTO `event_customer_register` (`id`, `event_id`, `customer_id`) VALUES
(98, 15, 15),
(97, 13, 15),
(96, 16, 15),
(91, 12, 15);

-- --------------------------------------------------------

--
-- Stand-in structure for view `event_rest_users`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `event_rest_users`;
CREATE TABLE IF NOT EXISTS `event_rest_users` (
`rest_user_id` bigint(20) unsigned
,`EventName` varchar(255)
,`id` bigint(20) unsigned
,`Status` tinyint(1)
,`EventDescription` longtext
,`Banner` varchar(255)
,`StartDateTime` datetime
,`EndDateTime` datetime
,`restaurant_id` bigint(20)
);

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2022_07_20_095056_create_cities_table', 1),
(2, '2022_07_20_095129_create_districts_table', 2),
(4, '2022_07_28_164708_create_events_table', 3),
(5, '2022_08_03_162520_event_customer', 4),
(6, '2022_08_22_203736_create_sliders_table', 5);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_resets`
--

INSERT INTO `password_resets` (`email`, `token`, `created_at`) VALUES
('azamat1696@gmail.com', '$2y$10$saKeZ7lkmLxqiZAGmc6.reuzaM/ipo2R5O747/IkOQSmvtANtaZAi', '2022-08-07 07:53:40');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=255 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `created_at`, `updated_at`) VALUES
(254, 'App\\Models\\User', 43, 'auth_token', 'cac17831a63c30bdf015e83f689fd7d2610faefdff01f4ba460898fa898e2c0f', '[\"*\"]', '2022-09-08 01:10:54', '2022-09-08 01:06:15', '2022-09-08 01:10:54'),
(251, 'App\\Models\\RestCustomers', 8, 'auth_token', '5fa3edd56962081882dcfc601dc0b746bdc967bd82016ec855350b72426984bc', '[\"*\"]', '2022-09-05 16:27:50', '2022-09-05 16:27:36', '2022-09-05 16:27:50'),
(252, 'App\\Models\\RestCustomers', 9, 'auth_token', '9481d7e4f76862106d5948263ded986b948b187d9bd5ff01614d6ddcd1fc6cb5', '[\"*\"]', '2022-09-05 18:31:51', '2022-09-05 16:54:14', '2022-09-05 18:31:51'),
(253, 'App\\Models\\Customers', 15, 'auth_token', '0c3462c56042f7a73652d49fd24ab6afb62a8b7c10d9b1e078aab357af30fdb2', '[\"*\"]', '2022-09-07 16:42:25', '2022-09-05 17:03:02', '2022-09-07 16:42:25');

-- --------------------------------------------------------

--
-- Table structure for table `restaurant_types`
--

DROP TABLE IF EXISTS `restaurant_types`;
CREATE TABLE IF NOT EXISTS `restaurant_types` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `RestName` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Status` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `Banner` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `restaurant_types`
--

INSERT INTO `restaurant_types` (`id`, `RestName`, `Status`, `created_at`, `updated_at`, `Banner`) VALUES
(17, 'Tatlıcı', 1, '2022-09-04 18:16:09', '2022-09-04 18:16:09', 'tatlici-454760.png'),
(16, 'Hotel', 1, '2022-09-04 18:14:40', '2022-09-04 18:14:40', 'hotel-5897.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `rest_customers`
--

DROP TABLE IF EXISTS `rest_customers`;
CREATE TABLE IF NOT EXISTS `rest_customers` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `restaurant_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `rest_customers_restaurant_id_foreign` (`restaurant_id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `rest_customers`
--

INSERT INTO `rest_customers` (`id`, `restaurant_id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(9, 18, 'Saray kuyllıcı', 'saray@gmail.com', NULL, '$2y$10$DR4xjPFBdgTgk.DDJ6Agqe5ji1SdyAss.ZEnfs6ngqvothEss1viq', NULL, '2022-09-05 16:31:15', '2022-09-05 16:31:15'),
(8, 17, 'Merit Kullanıcısı', 'merituser@gmail.com', NULL, '$2y$10$EkFcdseyYLu1/YevKy/8NOciy1NvQB5/iJ2r.2H.qAJ8M2mLmAj4u', NULL, '2022-09-04 18:22:28', '2022-09-05 16:27:27');

-- --------------------------------------------------------

--
-- Table structure for table `sliders`
--

DROP TABLE IF EXISTS `sliders`;
CREATE TABLE IF NOT EXISTS `sliders` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `SliderName` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `SliderImage` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Status` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sliders`
--

INSERT INTO `sliders` (`id`, `SliderName`, `SliderImage`, `Status`, `created_at`, `updated_at`) VALUES
(1, 'Slider başlığı1', 'slider-basligi-990482.jpg', 1, '2022-08-23 17:29:45', '2022-08-30 06:06:53'),
(5, 'Hotels', 'hotels-251359.jpg', 1, '2022-08-24 02:28:49', '2022-08-30 06:07:01'),
(7, 'Club', 'club-266741.jpg', 1, '2022-08-24 02:29:26', '2022-08-24 02:29:26'),
(9, 'Jazz', 'jazz-640172.jpg', 1, '2022-08-24 02:30:47', '2022-09-04 18:14:51');

-- --------------------------------------------------------

--
-- Table structure for table `subscribed_places`
--

DROP TABLE IF EXISTS `subscribed_places`;
CREATE TABLE IF NOT EXISTS `subscribed_places` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `PlaceName` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city_id` bigint(20) UNSIGNED DEFAULT NULL,
  `district_id` bigint(20) UNSIGNED DEFAULT NULL,
  `rest_type_id` bigint(20) UNSIGNED NOT NULL,
  `Status` tinyint(1) NOT NULL,
  `PlaceAddress` text COLLATE utf8mb4_unicode_ci,
  `Positions` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Banner` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `PlaceLogo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Descriptions` longtext COLLATE utf8mb4_unicode_ci,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `MembershipPackage` enum('3','6','12') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '3' COMMENT '3 , 6, 12 Aylık üyelik',
  `IsArchived` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 ---> not archived , 1 ----> archived',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `subscribed_places_rest_type_id_foreign` (`rest_type_id`),
  KEY `subscribed_places_city_id_foreign` (`city_id`),
  KEY `subscribed_places_district_id_foreign` (`district_id`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `subscribed_places`
--

INSERT INTO `subscribed_places` (`id`, `PlaceName`, `city_id`, `district_id`, `rest_type_id`, `Status`, `PlaceAddress`, `Positions`, `Banner`, `PlaceLogo`, `Descriptions`, `email`, `phone`, `MembershipPackage`, `IsArchived`, `created_at`, `updated_at`) VALUES
(17, 'Merit Hotel', 9, 7, 16, 1, 'Açık Adress', '{\"lat\":35.3538535,\"lng\":33.2107858}', 'merit-hotel-294895.png', 'merit-hotel-704218.png', 'Açıklama test', 'merit@gmail.com', '+905488321631', '6', 0, '2022-09-04 18:19:33', '2022-09-04 18:19:33'),
(18, 'Saray hotel', 11, 9, 17, 1, 'Açık Adress alanıdır bu', '{\"lat\":35.1149116,\"lng\":33.919245}', 'saray-hotel-580918.jpg', 'saray-hotel-889363.png', 'Sadece açıklama', 'sarayuser@gmail.com', '232323233', '6', 0, '2022-09-05 16:30:17', '2022-09-05 16:30:17');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(43, 'Azamat', 'azamat1696@gmail.com', NULL, '$2y$10$5wjkbManwbEOPhviPYyIE.iWNWmVAn6Z1LUFAz.tnCRG.Mg2D9wuq', NULL, NULL, '2022-09-04 11:29:58');

-- --------------------------------------------------------

--
-- Structure for view `eventcustomers`
--
DROP TABLE IF EXISTS `eventcustomers`;

DROP VIEW IF EXISTS `eventcustomers`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `eventcustomers`  AS SELECT `c`.`id` AS `customer_id`, `c`.`name` AS `name`, `c`.`surname` AS `surname`, `c`.`email` AS `email`, `c`.`phone` AS `phone`, `e`.`EventName` AS `EventName`, `e`.`id` AS `id`, `e`.`Status` AS `Status`, `e`.`EventDescription` AS `EventDescription`, `e`.`Banner` AS `Banner`, `e`.`StartDateTime` AS `StartDateTime`, `e`.`EndDateTime` AS `EndDateTime`, `e`.`restaurant_id` AS `restaurant_id` FROM ((`event_customer_register` left join `customers` `c` on((`c`.`id` = `event_customer_register`.`customer_id`))) left join `events` `e` on((`e`.`id` = `event_customer_register`.`event_id`))) ;

-- --------------------------------------------------------

--
-- Structure for view `eventsandcustomers`
--
DROP TABLE IF EXISTS `eventsandcustomers`;

DROP VIEW IF EXISTS `eventsandcustomers`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `eventsandcustomers`  AS SELECT `c`.`id` AS `customer_id`, `c`.`name` AS `name`, `c`.`surname` AS `surname`, `c`.`email` AS `email`, `c`.`phone` AS `phone`, `e`.`EventName` AS `EventName`, `e`.`id` AS `id`, `e`.`Status` AS `Status`, `e`.`EventDescription` AS `EventDescription`, `e`.`Banner` AS `Banner`, `e`.`StartDateTime` AS `StartDateTime`, `e`.`EndDateTime` AS `EndDateTime`, `e`.`restaurant_id` AS `restaurant_id` FROM ((`event_customer_register` left join `customers` `c` on((`c`.`id` = `event_customer_register`.`customer_id`))) left join `events` `e` on((`e`.`id` = `event_customer_register`.`event_id`))) ;

-- --------------------------------------------------------

--
-- Structure for view `event_rest_users`
--
DROP TABLE IF EXISTS `event_rest_users`;

DROP VIEW IF EXISTS `event_rest_users`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `event_rest_users`  AS SELECT `rc`.`id` AS `rest_user_id`, `e`.`EventName` AS `EventName`, `e`.`id` AS `id`, `e`.`Status` AS `Status`, `e`.`EventDescription` AS `EventDescription`, `e`.`Banner` AS `Banner`, `e`.`StartDateTime` AS `StartDateTime`, `e`.`EndDateTime` AS `EndDateTime`, `e`.`restaurant_id` AS `restaurant_id` FROM (`events` `e` left join `rest_customers` `rc` on((`e`.`restaurant_id` = `rc`.`restaurant_id`))) ;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

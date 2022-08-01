-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Aug 01, 2022 at 04:05 PM
-- Server version: 5.7.23-23
-- PHP Version: 7.4.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `a1636cz7_appgrm`
--

-- --------------------------------------------------------

--
-- Table structure for table `account_transactions`
--

CREATE TABLE `account_transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `from_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `from_id` bigint(20) NOT NULL,
  `current_balance` decimal(24,2) NOT NULL,
  `amount` decimal(24,2) NOT NULL,
  `method` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ref` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `add_ons`
--

CREATE TABLE `add_ons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` decimal(24,2) NOT NULL DEFAULT '0.00',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `store_id` bigint(20) UNSIGNED NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `f_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `l_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `zone_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `f_name`, `l_name`, `phone`, `email`, `image`, `password`, `remember_token`, `created_at`, `updated_at`, `role_id`, `zone_id`) VALUES
(1, 'Chaturvedisfoods', 'ADMIN', '7701908492', 'admin@email.com', NULL, '$2y$10$6Kk36UWVj0hsM36v0kDoZ.Wum.f/w6XkGa6Jcq0iNNqRoOf97K6Nu', 'UuH8il5YByzRh1Q6FvKLiw8nAIsYpx9K0OmTzc1kFrBFAMDZT23LyTvB8tGc', '2022-07-07 00:44:52', '2022-07-07 16:25:37', 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `admin_roles`
--

CREATE TABLE `admin_roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `modules` text COLLATE utf8mb4_unicode_ci,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_roles`
--

INSERT INTO `admin_roles` (`id`, `name`, `modules`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Master admin', NULL, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `admin_wallets`
--

CREATE TABLE `admin_wallets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `admin_id` bigint(20) UNSIGNED NOT NULL,
  `total_commission_earning` decimal(24,2) NOT NULL DEFAULT '0.00',
  `digital_received` decimal(24,2) NOT NULL DEFAULT '0.00',
  `manual_received` decimal(24,2) NOT NULL DEFAULT '0.00',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `delivery_charge` decimal(8,2) NOT NULL DEFAULT '0.00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `attributes`
--

CREATE TABLE `attributes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `banners`
--

CREATE TABLE `banners` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `data` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `zone_id` bigint(20) UNSIGNED NOT NULL,
  `module_id` bigint(20) UNSIGNED NOT NULL,
  `featured` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `business_settings`
--

CREATE TABLE `business_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `business_settings`
--

INSERT INTO `business_settings` (`id`, `key`, `value`, `created_at`, `updated_at`) VALUES
(1, 'cash_on_delivery', '{\"status\":\"1\"}', '2021-07-01 15:51:17', '2021-07-01 15:51:17'),
(2, 'stripe', '{\"status\":\"0\",\"api_key\":null,\"published_key\":null}', '2021-05-11 03:57:02', '2022-03-23 04:22:00'),
(4, 'mail_config', '{\"name\":\"6am Mart\",\"host\":\"mail.6amtech.com\",\"driver\":\"smtp\",\"port\":\"587\",\"username\":\"info@6amtech.com\",\"email_id\":\"info@6amtech.com\",\"encryption\":\"tls\",\"password\":\"password\"}', NULL, '2022-03-23 04:24:52'),
(5, 'fcm_project_id', 'e-food-9e6e3', NULL, NULL),
(6, 'push_notification_key', 'AAAAkTmu1f0:APA91bESxx-p9YQwiq27mjmxLv5RCuP62v4yjcnVMUVqrPOD1R6NXwMWbV9FBmHDNvtyly-TjqaGnZ35QbWkdrw5uvxxUQ0H-pggaxaG3UKZ4Bw8YwpjQyZe04S9UAkORrzjOF_ppJkI', NULL, NULL),
(7, 'order_pending_message', '{\"status\":1,\"message\":\"Your order is successfully placed\"}', NULL, NULL),
(8, 'order_confirmation_msg', '{\"status\":1,\"message\":\"Your order is confirmed\"}', NULL, NULL),
(9, 'order_processing_message', '{\"status\":1,\"message\":\"Your order is started for cooking\"}', NULL, NULL),
(10, 'out_for_delivery_message', '{\"status\":1,\"message\":\"Your food is ready for delivery\"}', NULL, NULL),
(11, 'order_delivered_message', '{\"status\":1,\"message\":\"Your order is delivered\"}', NULL, NULL),
(12, 'delivery_boy_assign_message', '{\"status\":1,\"message\":\"Your order has been assigned to a delivery man\"}', NULL, NULL),
(13, 'delivery_boy_start_message', '{\"status\":1,\"message\":\"Your order is picked up by delivery man\"}', NULL, NULL),
(14, 'delivery_boy_delivered_message', '{\"status\":1,\"message\":\"Order delivered successfully\"}', NULL, NULL),
(15, 'terms_and_conditions', NULL, NULL, '2022-07-25 16:04:34'),
(16, 'business_name', 'Shivam Liquor', NULL, NULL),
(17, 'currency', 'INR', NULL, NULL),
(18, 'logo', '2022-07-25-62de7306266ed.png', NULL, NULL),
(19, 'phone', '+910123456789', NULL, NULL),
(20, 'email_address', 'admin@gmail.com', NULL, NULL),
(21, 'address', 'sdfdsf', NULL, NULL),
(22, 'footer_text', 'Demo footer text @ 2021', NULL, NULL),
(23, 'customer_verification', '0', NULL, NULL),
(24, 'map_api_key', 'AIzaSyCqoSmKSniwllQSEgM-GFoTIqsjgS9vNWQ', NULL, NULL),
(25, 'about_us', '<p>Shivam&nbsp;Liquor</p>', NULL, '2022-07-25 16:04:49'),
(26, 'privacy_policy', NULL, NULL, '2022-07-25 16:04:24'),
(27, 'minimum_shipping_charge', '0', NULL, NULL),
(28, 'per_km_shipping_charge', '0', NULL, NULL),
(29, 'digital_payment', '{\"status\":\"1\"}', '2021-07-01 14:27:38', '2021-08-22 00:47:42'),
(30, 'ssl_commerz_payment', '{\"status\":\"0\",\"store_id\":null,\"store_password\":null}', '2021-07-04 15:41:24', '2022-03-23 04:21:28'),
(31, 'razor_pay', '{\"status\":\"0\",\"razor_key\":null,\"razor_secret\":null}', '2021-07-04 15:41:28', '2022-03-23 04:21:38'),
(32, 'paypal', '{\"status\":\"0\",\"paypal_client_id\":null,\"paypal_secret\":null}', '2021-07-04 15:41:34', '2022-03-23 04:21:49'),
(33, 'paystack', '{\"status\":\"0\",\"publicKey\":null,\"secretKey\":null,\"paymentUrl\":null,\"merchantEmail\":null}', '2021-07-04 15:41:42', '2022-03-23 04:22:15'),
(34, 'senang_pay', '{\"status\":\"1\",\"secret_key\":null,\"published_key\":null,\"merchant_id\":null}', '2021-07-04 15:41:48', '2022-03-23 04:22:25'),
(35, 'order_handover_message', '{\"status\":1,\"message\":\"Delivery man is on the way\"}', NULL, NULL),
(36, 'order_cancled_message', '{\"status\":1,\"message\":\"Order is canceled by your request\"}', NULL, NULL),
(37, 'timezone', 'Asia/Calcutta', NULL, NULL),
(38, 'order_delivery_verification', '0', NULL, NULL),
(39, 'currency_symbol_position', 'left', NULL, NULL),
(40, 'schedule_order', '1', NULL, NULL),
(41, 'app_minimum_version', '0', NULL, NULL),
(42, 'tax', NULL, NULL, NULL),
(43, 'admin_commission', '10', NULL, NULL),
(44, 'country', 'IN', NULL, NULL),
(45, 'app_url', 'https://www.google.com', NULL, NULL),
(46, 'default_location', '{\"lat\":\"0\",\"lng\":\"0\"}', NULL, NULL),
(47, 'twilio_sms', '{\"status\":\"0\",\"sid\":null,\"messaging_service_id\":null,\"token\":null,\"from\":null,\"otp_template\":\"Your otp is #OTP#.\"}', '2022-03-23 15:16:08', '2022-03-23 15:16:08'),
(48, 'nexmo_sms', '{\"status\":\"0\",\"api_key\":null,\"api_secret\":null,\"signature_secret\":\"\",\"private_key\":\"\",\"application_id\":\"\",\"from\":null,\"otp_template\":\"Your otp is #OTP#.\"}', '2022-03-23 15:16:18', '2022-03-23 15:16:18'),
(49, '2factor_sms', '{\"status\":\"0\",\"api_key\":null}', '2022-03-23 15:16:26', '2022-03-23 15:16:26'),
(50, 'msg91_sms', '{\"status\":\"0\",\"template_id\":null,\"authkey\":null}', '2022-03-23 15:16:33', '2022-03-23 15:16:33'),
(51, 'free_delivery_over', NULL, NULL, NULL),
(52, 'maintenance_mode', '0', '2021-09-08 15:44:28', '2021-09-08 15:44:28'),
(53, 'app_minimum_version_ios', NULL, '2021-09-21 22:54:10', '2021-09-21 22:54:10'),
(54, 'app_minimum_version_android', NULL, '2021-09-21 22:54:10', '2021-09-21 22:54:10'),
(55, 'app_url_ios', NULL, '2021-09-21 22:54:10', '2021-09-21 22:54:10'),
(56, 'app_url_android', NULL, '2021-09-21 22:54:10', '2021-09-21 22:54:10'),
(57, 'flutterwave', '{\"status\":1,\"public_key\":\"FLWPUBK_TEST-3f6a0b6c3d621c4ecbb9beeff516c92b-X\",\"secret_key\":\"FLWSECK_TEST-ec27426eb062491500a9eb95723b5436-X\",\"hash\":\"FLWSECK_TEST951e36220f66\"}', '2021-09-21 22:54:10', '2021-09-21 22:54:10'),
(58, 'dm_maximum_orders', '2', '2021-09-24 17:46:13', '2021-09-24 17:46:13'),
(59, 'order_confirmation_model', 'deliveryman', '2021-10-17 00:05:08', '2021-10-17 00:05:08'),
(60, 'popular_food', '1', '2021-10-17 00:05:08', '2021-10-17 00:05:08'),
(61, 'popular_restaurant', '1', '2021-10-17 00:05:08', '2021-10-17 00:05:08'),
(62, 'new_restaurant', '1', '2021-10-17 00:05:08', '2021-10-17 00:05:08'),
(63, 'mercadopago', '{\"status\":1,\"public_key\":\"\",\"access_token\":\"\"}', '2021-10-17 00:05:08', '2021-10-17 00:05:08'),
(64, 'map_api_key_server', 'AIzaSyCqoSmKSniwllQSEgM-GFoTIqsjgS9vNWQ', NULL, NULL),
(66, 'most_reviewed_foods', '1', '2021-11-15 15:55:37', '2021-11-15 15:55:37'),
(67, 'landing_page_text', '{\"header_title_1\":\"Liquor App\",\"header_title_2\":\"Why stay thirsty  when you can order from Shivam Liquor\",\"header_title_3\":\"Get 10% OFF on your first order\",\"about_title\":\"Shivam Liquor is Best Delivery Service Near You\",\"why_choose_us\":\"Why Choose Us?\",\"why_choose_us_title\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit.\",\"testimonial_title\":\"Trusted by Customer & Restaurant Owner\",\"mobile_app_section_heading\":null,\"mobile_app_section_text\":null,\"feature_section_description\":null,\"feature_section_title\":null,\"footer_article\":\"Suspendisse ultrices at diam lectus nullam. Nisl, sagittis viverra enim erat tortor ultricies massa turpis. Arcu pulvinar.\"}', '2021-11-15 15:55:37', '2021-11-15 15:55:37'),
(68, 'landing_page_links', '{\"app_url_android_status\":\"1\",\"app_url_android\":\"https:\\/\\/play.google.com\",\"app_url_ios_status\":\"1\",\"app_url_ios\":\"https:\\/\\/www.apple.com\\/app-store\",\"web_app_url_status\":\"1\",\"web_app_url\":\"https:\\/\\/creativeshi.com\\/\"}', '2021-11-15 15:55:37', '2021-11-15 15:55:37'),
(69, 'speciality', '[{\"img\":\"clean_&_cheap_icon.png\",\"title\":\"Clean & Cheap Price\"},{\"img\":\"best_dishes_icon.png\",\"title\":\"Best Dishes Near You\"},{\"img\":\"virtual_restaurant_icon.png\",\"title\":\"Your Own Virtual Restaurant\"}]', '2021-11-15 15:55:37', '2021-11-15 15:55:37'),
(70, 'testimonial', '[{\"img\":\"img-1.png\",\"name\":\"Barry Allen\",\"position\":\"Web Designer\",\"detail\":\"Lorem ipsum dolor sit amet, consectetur adipisicing elit. A\\r\\n                    aliquam amet animi blanditiis consequatur debitis dicta\\r\\n                    distinctio, enim error eum iste libero modi nam natus\\r\\n                    perferendis possimus quasi sint sit tempora voluptatem. Est,\\r\\n                    exercitationem id ipsa ipsum laboriosam perferendis temporibus!\"},{\"img\":\"img-2.png\",\"name\":\"Sophia Martino\",\"position\":\"Web Designer\",\"detail\":\"Lorem ipsum dolor sit amet, consectetur adipisicing elit. A aliquam amet animi blanditiis consequatur debitis dicta distinctio, enim error eum iste libero modi nam natus perferendis possimus quasi sint sit tempora voluptatem. Est, exercitationem id ipsa ipsum laboriosam perferendis temporibus!\"},{\"img\":\"img-3.png\",\"name\":\"Alan Turing\",\"position\":\"Web Designer\",\"detail\":\"Lorem ipsum dolor sit amet, consectetur adipisicing elit. A aliquam amet animi blanditiis consequatur debitis dicta distinctio, enim error eum iste libero modi nam natus perferendis possimus quasi sint sit tempora voluptatem. Est, exercitationem id ipsa ipsum laboriosam perferendis temporibus!\"},{\"img\":\"img-4.png\",\"name\":\"Ann Marie\",\"position\":\"Web Designer\",\"detail\":\"Lorem ipsum dolor sit amet, consectetur adipisicing elit. A aliquam amet animi blanditiis consequatur debitis dicta distinctio, enim error eum iste libero modi nam natus perferendis possimus quasi sint sit tempora voluptatem. Est, exercitationem id ipsa ipsum laboriosam perferendis temporibus!\"}]', '2021-11-15 15:55:37', '2021-11-15 15:55:37'),
(71, 'landing_page_images', '{\"top_content_image\":\"2022-07-25-62de726f1464f.png\",\"about_us_image\":\"2022-07-25-62de72dbbfc6e.png\"}', '2021-11-15 15:55:37', '2021-11-15 15:55:37'),
(72, 'paymob_accept', '{\"status\":\"0\",\"api_key\":null,\"iframe_id\":null,\"integration_id\":null,\"hmac\":null}', '2021-11-15 15:55:37', '2021-11-15 15:55:37'),
(73, 'admin_order_notification', '0', NULL, NULL),
(74, 'swish_payment', '{\"status\":\"1\"}', NULL, '2021-12-28 12:02:40'),
(76, 'service_charge', '12', NULL, NULL),
(77, 'social_login', '[{\"login_medium\":\"google\",\"client_id\":null,\"client_secret\":null,\"status\":\"0\"},{\"login_medium\":\"facebook\",\"client_id\":null,\"client_secret\":null,\"status\":\"0\"}]', NULL, '2022-01-04 13:09:23'),
(78, 'language', '[\"en\",\"hi\"]', NULL, NULL),
(79, 'timeformat', '24', NULL, NULL),
(80, 'canceled_by_restaurant', '0', NULL, NULL),
(81, 'canceled_by_deliveryman', '0', NULL, NULL),
(82, 'show_dm_earning', '0', NULL, NULL),
(83, 'recaptcha', '{\"status\":\"0\",\"site_key\":null,\"secret_key\":null}', '2022-03-23 15:17:39', '2022-03-23 15:17:39'),
(84, 'toggle_veg_non_veg', '1', NULL, NULL),
(85, 'toggle_dm_registration', '0', NULL, NULL),
(86, 'toggle_restaurant_registration', '1', NULL, NULL),
(87, 'order_refunded_message', '{\"status\":1,\"message\":\"Order is refunded successfully\"}', NULL, NULL),
(88, 'liqpay', '{\"status\":\"1\",\"public_key\":null,\"private_key\":null}', NULL, '2022-02-27 05:15:40'),
(89, 'klarna', '{\"status\":\"1\",\"region\":\"america\",\"username\":\"PN06804_1a368db08f6d\",\"password\":\"6ljrP6BDJNKT6F2y\"}', NULL, '2022-01-26 08:30:51'),
(90, 'fatoorah', '{\"status\":\"1\",\"api_key\":\"rLtt6JWvbUHDDhsZnfpAhpYk4dxYDQkbcPTyGaKp2TYqQgG7FGZ5Th_WD53Oq8Ebz6A53njUoo1w3pjU1D4vs_ZMqFiz_j0urb_BH9Oq9VZoKFoJEDAbRZepGcQanImyYrry7Kt6MnMdgfG5jn4HngWoRdKduNNyP4kzcp3mRv7x00ahkm9LAK7ZRieg7k1PDAnBIOG3EyVSJ5kK4WLMvYr7sCwHbHcu4A5WwelxYK0GMJy37bNAarSJDFQsJ2ZvJjvMDmfWwDVFEVe_5tOomfVNt6bOg9mexbGjMrnHBnKnZR1vQbBtQieDlQepzTZMuQrSuKn-t5XZM7V6fCW7oP-uXGX-sMOajeX65JOf6XVpk29DP6ro8WTAflCDANC193yof8-f5_EYY-3hXhJj7RBXmizDpneEQDSaSz5sFk0sV5qPcARJ9zGG73vuGFyenjPPmtDtXtpx35A-BVcOSBYVIWe9kndG3nclfefjKEuZ3m4jL9Gg1h2JBvmXSMYiZtp9MR5I6pvbvylU_PP5xJFSjVTIz7IQSjcVGO41npnwIxRXNRxFOdIUHn0tjQ-7LwvEcTXyPsHXcMD8WtgBh-wxR8aKX7WPSsT1O8d8reb2aR7K3rkV3K82K_0OgawImEpwSvp9MNKynEAJQS6ZHe_J_l77652xwPNxMRTMASk1ZsJL\"}', NULL, '2022-02-20 11:05:26'),
(91, 'bkash', '{\"status\":\"1\",\"api_key\":\"5tunt4masn6pv2hnvte1sb5n3j\",\"api_secret\":\"1vggbqd4hqk9g96o9rrrp2jftvek578v7d2bnerim12a87dbrrka\",\"username\":\"sandboxTestUser\",\"password\":\"hWD@8vtzw0\"}', NULL, '2022-02-27 04:37:26'),
(92, 'paytabs', '{\"status\":\"1\",\"profile_id\":null,\"server_key\":null,\"base_url\":null}', NULL, '2022-02-27 06:06:19'),
(93, 'paytm', '{\"status\":\"1\",\"paytm_merchant_key\":null,\"paytm_merchant_mid\":null,\"paytm_merchant_website\":null,\"paytm_refund_url\":null}', NULL, '2022-02-27 06:06:37'),
(94, 'schedule_order_slot_duration', '0', NULL, NULL),
(95, 'digit_after_decimal_point', '0', NULL, NULL),
(96, 'icon', '2022-07-25-62de730626e89.png', NULL, NULL),
(97, 'toggle_store_registration', '0', NULL, NULL),
(98, 'canceled_by_store', '0', NULL, NULL),
(99, 'parcel_per_km_shipping_charge', '0', NULL, NULL),
(100, 'parcel_minimum_shipping_charge', '0', NULL, NULL),
(101, 'parcel_commission_dm', '0', NULL, NULL),
(102, 'landing_page_links', '{\"app_url_android_status\":\"1\",\"app_url_android\":\"https:\\/\\/play.google.com\",\"app_url_ios_status\":\"1\",\"app_url_ios\":\"https:\\/\\/www.apple.com\\/app-store\",\"web_app_url_status\":\"1\",\"web_app_url\":\"https:\\/\\/stackfood.6amtech.com\\/\"}', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `campaigns`
--

CREATE TABLE `campaigns` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `admin_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  `module_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `campaign_store`
--

CREATE TABLE `campaign_store` (
  `campaign_id` bigint(20) UNSIGNED NOT NULL,
  `store_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'def.png',
  `parent_id` int(11) NOT NULL,
  `position` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `priority` int(11) NOT NULL DEFAULT '0',
  `module_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `image`, `parent_id`, `position`, `status`, `created_at`, `updated_at`, `priority`, `module_id`) VALUES
(1, 'Indian', '2022-07-07-62c7256bf1e77.png', 0, 0, 1, '2022-07-07 23:56:51', '2022-07-07 23:56:51', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `expire_date` date DEFAULT NULL,
  `min_purchase` decimal(24,2) NOT NULL DEFAULT '0.00',
  `max_discount` decimal(24,2) NOT NULL DEFAULT '0.00',
  `discount` decimal(24,2) NOT NULL DEFAULT '0.00',
  `discount_type` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'percentage',
  `coupon_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default',
  `limit` int(11) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `data` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_uses` bigint(20) DEFAULT '0',
  `module_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `currencies`
--

CREATE TABLE `currencies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency_symbol` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `exchange_rate` decimal(8,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `currencies`
--

INSERT INTO `currencies` (`id`, `country`, `currency_code`, `currency_symbol`, `exchange_rate`, `created_at`, `updated_at`) VALUES
(1, 'US Dollar', 'USD', '$', '1.00', NULL, NULL),
(2, 'Canadian Dollar', 'CAD', 'CA$', '1.00', NULL, NULL),
(3, 'Euro', 'EUR', '€', '1.00', NULL, NULL),
(4, 'United Arab Emirates Dirham', 'AED', 'د.إ.‏', '1.00', NULL, NULL),
(5, 'Afghan Afghani', 'AFN', '؋', '1.00', NULL, NULL),
(6, 'Albanian Lek', 'ALL', 'L', '1.00', NULL, NULL),
(7, 'Armenian Dram', 'AMD', '֏', '1.00', NULL, NULL),
(8, 'Argentine Peso', 'ARS', '$', '1.00', NULL, NULL),
(9, 'Australian Dollar', 'AUD', '$', '1.00', NULL, NULL),
(10, 'Azerbaijani Manat', 'AZN', '₼', '1.00', NULL, NULL),
(11, 'Bosnia-Herzegovina Convertible Mark', 'BAM', 'KM', '1.00', NULL, NULL),
(12, 'Bangladeshi Taka', 'BDT', '৳', '1.00', NULL, NULL),
(13, 'Bulgarian Lev', 'BGN', 'лв.', '1.00', NULL, NULL),
(14, 'Bahraini Dinar', 'BHD', 'د.ب.‏', '1.00', NULL, NULL),
(15, 'Burundian Franc', 'BIF', 'FBu', '1.00', NULL, NULL),
(16, 'Brunei Dollar', 'BND', 'B$', '1.00', NULL, NULL),
(17, 'Bolivian Boliviano', 'BOB', 'Bs', '1.00', NULL, NULL),
(18, 'Brazilian Real', 'BRL', 'R$', '1.00', NULL, NULL),
(19, 'Botswanan Pula', 'BWP', 'P', '1.00', NULL, NULL),
(20, 'Belarusian Ruble', 'BYN', 'Br', '1.00', NULL, NULL),
(21, 'Belize Dollar', 'BZD', '$', '1.00', NULL, NULL),
(22, 'Congolese Franc', 'CDF', 'FC', '1.00', NULL, NULL),
(23, 'Swiss Franc', 'CHF', 'CHf', '1.00', NULL, NULL),
(24, 'Chilean Peso', 'CLP', '$', '1.00', NULL, NULL),
(25, 'Chinese Yuan', 'CNY', '¥', '1.00', NULL, NULL),
(26, 'Colombian Peso', 'COP', '$', '1.00', NULL, NULL),
(27, 'Costa Rican Colón', 'CRC', '₡', '1.00', NULL, NULL),
(28, 'Cape Verdean Escudo', 'CVE', '$', '1.00', NULL, NULL),
(29, 'Czech Republic Koruna', 'CZK', 'Kč', '1.00', NULL, NULL),
(30, 'Djiboutian Franc', 'DJF', 'Fdj', '1.00', NULL, NULL),
(31, 'Danish Krone', 'DKK', 'Kr.', '1.00', NULL, NULL),
(32, 'Dominican Peso', 'DOP', 'RD$', '1.00', NULL, NULL),
(33, 'Algerian Dinar', 'DZD', 'د.ج.‏', '1.00', NULL, NULL),
(34, 'Estonian Kroon', 'EEK', 'kr', '1.00', NULL, NULL),
(35, 'Egyptian Pound', 'EGP', 'E£‏', '1.00', NULL, NULL),
(36, 'Eritrean Nakfa', 'ERN', 'Nfk', '1.00', NULL, NULL),
(37, 'Ethiopian Birr', 'ETB', 'Br', '1.00', NULL, NULL),
(38, 'British Pound Sterling', 'GBP', '£', '1.00', NULL, NULL),
(39, 'Georgian Lari', 'GEL', 'GEL', '1.00', NULL, NULL),
(40, 'Ghanaian Cedi', 'GHS', 'GH¢', '1.00', NULL, NULL),
(41, 'Guinean Franc', 'GNF', 'FG', '1.00', NULL, NULL),
(42, 'Guatemalan Quetzal', 'GTQ', 'Q', '1.00', NULL, NULL),
(43, 'Hong Kong Dollar', 'HKD', 'HK$', '1.00', NULL, NULL),
(44, 'Honduran Lempira', 'HNL', 'L', '1.00', NULL, NULL),
(45, 'Croatian Kuna', 'HRK', 'kn', '1.00', NULL, NULL),
(46, 'Hungarian Forint', 'HUF', 'Ft', '1.00', NULL, NULL),
(47, 'Indonesian Rupiah', 'IDR', 'Rp', '1.00', NULL, NULL),
(48, 'Israeli New Sheqel', 'ILS', '₪', '1.00', NULL, NULL),
(49, 'Indian Rupee', 'INR', '₹', '1.00', NULL, NULL),
(50, 'Iraqi Dinar', 'IQD', 'ع.د', '1.00', NULL, NULL),
(51, 'Iranian Rial', 'IRR', '﷼', '1.00', NULL, NULL),
(52, 'Icelandic Króna', 'ISK', 'kr', '1.00', NULL, NULL),
(53, 'Jamaican Dollar', 'JMD', '$', '1.00', NULL, NULL),
(54, 'Jordanian Dinar', 'JOD', 'د.ا‏', '1.00', NULL, NULL),
(55, 'Japanese Yen', 'JPY', '¥', '1.00', NULL, NULL),
(56, 'Kenyan Shilling', 'KES', 'Ksh', '1.00', NULL, NULL),
(57, 'Cambodian Riel', 'KHR', '៛', '1.00', NULL, NULL),
(58, 'Comorian Franc', 'KMF', 'FC', '1.00', NULL, NULL),
(59, 'South Korean Won', 'KRW', 'CF', '1.00', NULL, NULL),
(60, 'Kuwaiti Dinar', 'KWD', 'د.ك.‏', '1.00', NULL, NULL),
(61, 'Kazakhstani Tenge', 'KZT', '₸.', '1.00', NULL, NULL),
(62, 'Lebanese Pound', 'LBP', 'ل.ل.‏', '1.00', NULL, NULL),
(63, 'Sri Lankan Rupee', 'LKR', 'Rs', '1.00', NULL, NULL),
(64, 'Lithuanian Litas', 'LTL', 'Lt', '1.00', NULL, NULL),
(65, 'Latvian Lats', 'LVL', 'Ls', '1.00', NULL, NULL),
(66, 'Libyan Dinar', 'LYD', 'د.ل.‏', '1.00', NULL, NULL),
(67, 'Moroccan Dirham', 'MAD', 'د.م.‏', '1.00', NULL, NULL),
(68, 'Moldovan Leu', 'MDL', 'L', '1.00', NULL, NULL),
(69, 'Malagasy Ariary', 'MGA', 'Ar', '1.00', NULL, NULL),
(70, 'Macedonian Denar', 'MKD', 'Ден', '1.00', NULL, NULL),
(71, 'Myanma Kyat', 'MMK', 'K', '1.00', NULL, NULL),
(72, 'Macanese Pataca', 'MOP', 'MOP$', '1.00', NULL, NULL),
(73, 'Mauritian Rupee', 'MUR', 'Rs', '1.00', NULL, NULL),
(74, 'Mexican Peso', 'MXN', '$', '1.00', NULL, NULL),
(75, 'Malaysian Ringgit', 'MYR', 'RM', '1.00', NULL, NULL),
(76, 'Mozambican Metical', 'MZN', 'MT', '1.00', NULL, NULL),
(77, 'Namibian Dollar', 'NAD', 'N$', '1.00', NULL, NULL),
(78, 'Nigerian Naira', 'NGN', '₦', '1.00', NULL, NULL),
(79, 'Nicaraguan Córdoba', 'NIO', 'C$', '1.00', NULL, NULL),
(80, 'Norwegian Krone', 'NOK', 'kr', '1.00', NULL, NULL),
(81, 'Nepalese Rupee', 'NPR', 'Re.', '1.00', NULL, NULL),
(82, 'New Zealand Dollar', 'NZD', '$', '1.00', NULL, NULL),
(83, 'Omani Rial', 'OMR', 'ر.ع.‏', '1.00', NULL, NULL),
(84, 'Panamanian Balboa', 'PAB', 'B/.', '1.00', NULL, NULL),
(85, 'Peruvian Nuevo Sol', 'PEN', 'S/', '1.00', NULL, NULL),
(86, 'Philippine Peso', 'PHP', '₱', '1.00', NULL, NULL),
(87, 'Pakistani Rupee', 'PKR', 'Rs', '1.00', NULL, NULL),
(88, 'Polish Zloty', 'PLN', 'zł', '1.00', NULL, NULL),
(89, 'Paraguayan Guarani', 'PYG', '₲', '1.00', NULL, NULL),
(90, 'Qatari Rial', 'QAR', 'ر.ق.‏', '1.00', NULL, NULL),
(91, 'Romanian Leu', 'RON', 'lei', '1.00', NULL, NULL),
(92, 'Serbian Dinar', 'RSD', 'din.', '1.00', NULL, NULL),
(93, 'Russian Ruble', 'RUB', '₽.', '1.00', NULL, NULL),
(94, 'Rwandan Franc', 'RWF', 'FRw', '1.00', NULL, NULL),
(95, 'Saudi Riyal', 'SAR', 'ر.س.‏', '1.00', NULL, NULL),
(96, 'Sudanese Pound', 'SDG', 'ج.س.', '1.00', NULL, NULL),
(97, 'Swedish Krona', 'SEK', 'kr', '1.00', NULL, NULL),
(98, 'Singapore Dollar', 'SGD', '$', '1.00', NULL, NULL),
(99, 'Somali Shilling', 'SOS', 'Sh.so.', '1.00', NULL, NULL),
(100, 'Syrian Pound', 'SYP', 'LS‏', '1.00', NULL, NULL),
(101, 'Thai Baht', 'THB', '฿', '1.00', NULL, NULL),
(102, 'Tunisian Dinar', 'TND', 'د.ت‏', '1.00', NULL, NULL),
(103, 'Tongan Paʻanga', 'TOP', 'T$', '1.00', NULL, NULL),
(104, 'Turkish Lira', 'TRY', '₺', '1.00', NULL, NULL),
(105, 'Trinidad and Tobago Dollar', 'TTD', '$', '1.00', NULL, NULL),
(106, 'New Taiwan Dollar', 'TWD', 'NT$', '1.00', NULL, NULL),
(107, 'Tanzanian Shilling', 'TZS', 'TSh', '1.00', NULL, NULL),
(108, 'Ukrainian Hryvnia', 'UAH', '₴', '1.00', NULL, NULL),
(109, 'Ugandan Shilling', 'UGX', 'USh', '1.00', NULL, NULL),
(110, 'Uruguayan Peso', 'UYU', '$', '1.00', NULL, NULL),
(111, 'Uzbekistan Som', 'UZS', 'so\'m', '1.00', NULL, NULL),
(112, 'Venezuelan Bolívar', 'VEF', 'Bs.F.', '1.00', NULL, NULL),
(113, 'Vietnamese Dong', 'VND', '₫', '1.00', NULL, NULL),
(114, 'CFA Franc BEAC', 'XAF', 'FCFA', '1.00', NULL, NULL),
(115, 'CFA Franc BCEAO', 'XOF', 'CFA', '1.00', NULL, NULL),
(116, 'Yemeni Rial', 'YER', '﷼‏', '1.00', NULL, NULL),
(117, 'South African Rand', 'ZAR', 'R', '1.00', NULL, NULL),
(118, 'Zambian Kwacha', 'ZMK', 'ZK', '1.00', NULL, NULL),
(119, 'Zimbabwean Dollar', 'ZWL', 'Z$', '1.00', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `customer_addresses`
--

CREATE TABLE `customer_addresses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `address_type` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_person_number` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` text COLLATE utf8mb4_unicode_ci,
  `latitude` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `longitude` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `contact_person_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `zone_id` bigint(20) UNSIGNED NOT NULL,
  `floor` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `road` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `house` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `delivery_histories`
--

CREATE TABLE `delivery_histories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED DEFAULT NULL,
  `delivery_man_id` bigint(20) UNSIGNED DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `longitude` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `latitude` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `delivery_man_wallets`
--

CREATE TABLE `delivery_man_wallets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `delivery_man_id` bigint(20) UNSIGNED NOT NULL,
  `collected_cash` decimal(24,2) NOT NULL DEFAULT '0.00',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `total_earning` decimal(24,2) NOT NULL DEFAULT '0.00',
  `total_withdrawn` decimal(24,2) NOT NULL DEFAULT '0.00',
  `pending_withdraw` decimal(24,2) NOT NULL DEFAULT '0.00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `delivery_men`
--

CREATE TABLE `delivery_men` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `f_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `l_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `identity_number` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `identity_type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `identity_image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `auth_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fcm_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zone_id` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `earning` tinyint(1) NOT NULL DEFAULT '1',
  `current_orders` int(11) NOT NULL DEFAULT '0',
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'zone_wise',
  `store_id` bigint(20) DEFAULT NULL,
  `application_status` enum('approved','denied','pending') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'approved',
  `order_count` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `assigned_order_count` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `delivery_men`
--

INSERT INTO `delivery_men` (`id`, `f_name`, `l_name`, `phone`, `email`, `identity_number`, `identity_type`, `identity_image`, `image`, `password`, `auth_token`, `fcm_token`, `zone_id`, `created_at`, `updated_at`, `status`, `active`, `earning`, `current_orders`, `type`, `store_id`, `application_status`, `order_count`, `assigned_order_count`) VALUES
(1, 'Prashant', 'Makhija', '+919833664141', 'contactmakhija@gmail.com', 'test123', 'driving_license', '[\"2022-07-08-62c7272a51174.png\"]', '2022-07-08-62c7272a4eff1.png', '$2y$10$QZs66c8hOkS0Rt5A0t8WJ.TdIPLjeI9nWs.vhE8H4LWJwINp75hxa', 'VIXuFYm0sPH9YyD1q8vk4e65BmopqlMsd8W851vOKohHe9N84DdnPSlO1GqFgFvMujtV7A4RpBKESqkIk4ON7ZYaqE8B5dxdy5roGLaor158UDqRCXlUtCJJ', 'fjgMzbpvnUTqqwhWAhRBH5:APA91bE-4N31W_TmGIMbqpsgCTk6gVQ0ZYktCwPARUlAMaUUWjY4QtFvQnaXKdR_Qmq9vZQuwUSgM09cHg4G4-ukJiVLxphIC3c3D5ZEJ-SyuykS6h__eS1az69FndSrBtc48xdzH1mq', 1, '2022-07-08 00:04:18', '2022-07-25 13:33:22', 1, 1, 1, 2, 'zone_wise', NULL, 'approved', 0, 2);

-- --------------------------------------------------------

--
-- Table structure for table `discounts`
--

CREATE TABLE `discounts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  `min_purchase` decimal(24,2) NOT NULL DEFAULT '0.00',
  `max_discount` decimal(24,2) NOT NULL DEFAULT '0.00',
  `discount` decimal(24,2) NOT NULL DEFAULT '0.00',
  `discount_type` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'percentage',
  `store_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `d_m_reviews`
--

CREATE TABLE `d_m_reviews` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `delivery_man_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `comment` mediumtext COLLATE utf8mb4_unicode_ci,
  `attachment` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rating` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `email_verifications`
--

CREATE TABLE `email_verifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `employee_roles`
--

CREATE TABLE `employee_roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `modules` text COLLATE utf8mb4_unicode_ci,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `store_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE `items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `image` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `category_ids` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `variations` text COLLATE utf8mb4_unicode_ci,
  `add_ons` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attributes` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `choice_options` text COLLATE utf8mb4_unicode_ci,
  `price` decimal(24,2) NOT NULL DEFAULT '0.00',
  `tax` decimal(24,2) NOT NULL DEFAULT '0.00',
  `tax_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'percent',
  `discount` decimal(24,2) NOT NULL DEFAULT '0.00',
  `discount_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'percent',
  `available_time_starts` time DEFAULT NULL,
  `available_time_ends` time DEFAULT NULL,
  `veg` tinyint(1) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `store_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `order_count` int(11) NOT NULL DEFAULT '0',
  `avg_rating` double(16,14) NOT NULL DEFAULT '0.00000000000000',
  `rating_count` int(11) NOT NULL DEFAULT '0',
  `rating` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `module_id` bigint(20) UNSIGNED NOT NULL,
  `stock` int(11) DEFAULT '0',
  `unit_id` bigint(20) UNSIGNED DEFAULT NULL,
  `images` json DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`id`, `name`, `description`, `image`, `category_id`, `category_ids`, `variations`, `add_ons`, `attributes`, `choice_options`, `price`, `tax`, `tax_type`, `discount`, `discount_type`, `available_time_starts`, `available_time_ends`, `veg`, `status`, `store_id`, `created_at`, `updated_at`, `order_count`, `avg_rating`, `rating_count`, `rating`, `module_id`, `stock`, `unit_id`, `images`) VALUES
(1, 'Paneer Tikka', 'Cottage Cheese marinated with indian spices', '2022-07-07-62c725b8b1463.png', 1, '[{\"id\":\"1\",\"position\":1}]', '[]', '[]', '[]', '[]', '300.00', '0.00', 'percent', '0.00', 'percent', '00:00:00', '23:59:00', 1, 1, 1, '2022-07-07 23:58:08', '2022-07-07 23:58:08', 0, 0.00000000000000, 0, NULL, 1, 0, NULL, '[\"2022-07-07-62c725b8b0a71.png\"]');

-- --------------------------------------------------------

--
-- Table structure for table `item_campaigns`
--

CREATE TABLE `item_campaigns` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `admin_id` bigint(20) UNSIGNED NOT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  `category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `category_ids` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `variations` text COLLATE utf8mb4_unicode_ci,
  `add_ons` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attributes` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `choice_options` text COLLATE utf8mb4_unicode_ci,
  `price` decimal(24,2) NOT NULL DEFAULT '0.00',
  `tax` decimal(24,2) NOT NULL DEFAULT '0.00',
  `tax_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'percent',
  `discount` decimal(24,2) NOT NULL DEFAULT '0.00',
  `discount_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'percent',
  `store_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `veg` tinyint(1) NOT NULL DEFAULT '0',
  `module_id` bigint(20) UNSIGNED NOT NULL,
  `stock` int(11) DEFAULT '0',
  `unit_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2016_06_01_000001_create_oauth_auth_codes_table', 30),
(2, '2016_06_01_000002_create_oauth_access_tokens_table', 30),
(3, '2016_06_01_000003_create_oauth_refresh_tokens_table', 30),
(4, '2016_06_01_000004_create_oauth_clients_table', 30),
(5, '2016_06_01_000005_create_oauth_personal_access_clients_table', 30),
(8, '2021_06_17_054551_create_soft_credentials_table', 31),
(9, '2022_04_10_030533_create_newsletters_table', 32),
(10, '2022_04_12_015827_create_social_media_table', 32),
(11, '2022_04_12_215009_create_jobs_table', 32),
(12, '2022_04_21_145207_add_column_to_modules_table', 32),
(13, '2022_05_12_170027_add_column_to_customer_addresses_table', 33),
(14, '2022_05_14_155444_add_all_zones_column_to_modules_table', 33),
(15, '2022_05_26_120821_change_data_column_to_user_notifiations_table', 33);

-- --------------------------------------------------------

--
-- Table structure for table `modules`
--

CREATE TABLE `modules` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `module_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `module_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `thumbnail` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `stores_count` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `icon` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `theme_id` int(11) NOT NULL DEFAULT '1',
  `description` text COLLATE utf8mb4_unicode_ci,
  `all_zone_service` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `modules`
--

INSERT INTO `modules` (`id`, `module_name`, `module_type`, `thumbnail`, `status`, `stores_count`, `created_at`, `updated_at`, `icon`, `theme_id`, `description`, `all_zone_service`) VALUES
(1, 'Restaurant', 'food', '2022-07-07-62c722beba235.png', 1, 1, '2022-07-07 23:45:26', '2022-07-07 23:48:42', '2022-07-07-62c722beb4dff.png', 2, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `module_types`
--

CREATE TABLE `module_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `newsletters`
--

CREATE TABLE `newsletters` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Subscribers email',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `image` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `tergat` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zone_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('1b956a8c678a33962e3a91ac2e1d49f7502619566451208c8217a04c7bb5a3d48a4f9bcf8178472b', 1, 3, 'RestaurantCustomerAuth', '[]', 0, '2022-07-08 02:22:50', '2022-07-08 02:22:50', '2023-07-08 02:22:50'),
('3324f0611f752dc1a6710fd270c3f66bfda835524dcc02848d9e25eaca8e00b3d584eabc1d8aab7b', 1, 3, 'RestaurantCustomerAuth', '[]', 0, '2022-07-08 02:41:51', '2022-07-08 02:41:51', '2023-07-08 02:41:51'),
('364213c904d7448e8a8147ecd9ed4d3e8401105f4076df9aad8931a4ccfdbb4da0646fe4c5cdff08', 1, 3, 'RestaurantCustomerAuth', '[]', 0, '2022-07-08 16:05:59', '2022-07-08 16:05:59', '2023-07-08 16:05:59'),
('707b9339d4f64085ae05f5ead58077a9c9d712e084a8e1deccc043eed7c4afb19c04df5b33c3c1a8', 1, 3, 'RestaurantCustomerAuth', '[]', 0, '2022-07-08 02:26:27', '2022-07-08 02:26:27', '2023-07-08 02:26:27'),
('b1576e4b58b0770858207d452b041dc025805e832d9f513d096dd944d0c287d1fa072737d5c931f2', 1, 3, 'RestaurantCustomerAuth', '[]', 0, '2022-07-25 13:24:49', '2022-07-25 13:24:49', '2023-07-25 13:24:49'),
('c436ef4be73e3721a879ec8c9c87be8c5de17cbaa9d76edcef1aae88a38e44ccab0b061f9be9fe41', 1, 3, 'RestaurantCustomerAuth', '[]', 0, '2022-07-08 02:21:55', '2022-07-08 02:21:55', '2023-07-08 02:21:55'),
('e890c3e12f3603cfe263374110f3a104f932dc7ef3dc49f76f167591152161a38d41c781b4dde6ba', 1, 3, 'RestaurantCustomerAuth', '[]', 0, '2022-07-10 03:02:23', '2022-07-10 03:02:23', '2023-07-10 03:02:23'),
('f343e8daf915b80ee4dd2f175723ac8f5fc9e038c07179eec7f65bb129611e04215a3f4828700634', 1, 3, 'RestaurantCustomerAuth', '[]', 0, '2022-07-09 15:56:23', '2022-07-09 15:56:23', '2023-07-09 15:56:23');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `provider`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Laravel Personal Access Client', 'qBN0j6SW6nIf47748tgxaKxnqKqCacTxa6gii8yc', NULL, 'http://localhost', 1, 0, 0, '2021-08-19 20:44:50', '2021-08-19 20:44:50'),
(2, NULL, 'Laravel Password Grant Client', 'oqQ90HOU0egjgQ01LRzHo9rADUavq16jzWm1TrjT', 'users', 'http://localhost', 0, 1, 0, '2021-08-19 20:44:50', '2021-08-19 20:44:50'),
(3, NULL, 'stackfood Personal Access Client', 'iRxXixYp4CDo7TWbWNCMelAUwgtScaEMGudnbHQk', NULL, 'http://localhost', 1, 0, 0, '2022-01-05 10:22:36', '2022-01-05 10:22:36'),
(4, NULL, 'stackfood Password Grant Client', 'FzGJ1vSlbfGP2mWqF6V575QgVCEfbBHVNA41ApeC', 'users', 'http://localhost', 0, 1, 0, '2022-01-05 10:22:36', '2022-01-05 10:22:36');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2021-08-19 20:44:50', '2021-08-19 20:44:50'),
(2, 3, '2022-01-05 10:22:36', '2022-01-05 10:22:36');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `order_amount` decimal(24,2) NOT NULL DEFAULT '0.00',
  `coupon_discount_amount` decimal(24,2) NOT NULL DEFAULT '0.00',
  `coupon_discount_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'unpaid',
  `order_status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `total_tax_amount` decimal(24,2) NOT NULL DEFAULT '0.00',
  `payment_method` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transaction_reference` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `delivery_address_id` bigint(20) DEFAULT NULL,
  `delivery_man_id` bigint(20) UNSIGNED DEFAULT NULL,
  `coupon_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_note` text COLLATE utf8mb4_unicode_ci,
  `order_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'delivery',
  `checked` tinyint(1) NOT NULL DEFAULT '0',
  `store_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `delivery_charge` decimal(24,2) NOT NULL DEFAULT '0.00',
  `schedule_at` timestamp NULL DEFAULT NULL,
  `callback` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `otp` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pending` timestamp NULL DEFAULT NULL,
  `accepted` timestamp NULL DEFAULT NULL,
  `confirmed` timestamp NULL DEFAULT NULL,
  `processing` timestamp NULL DEFAULT NULL,
  `handover` timestamp NULL DEFAULT NULL,
  `picked_up` timestamp NULL DEFAULT NULL,
  `delivered` timestamp NULL DEFAULT NULL,
  `canceled` timestamp NULL DEFAULT NULL,
  `refund_requested` timestamp NULL DEFAULT NULL,
  `refunded` timestamp NULL DEFAULT NULL,
  `delivery_address` text COLLATE utf8mb4_unicode_ci,
  `scheduled` tinyint(1) NOT NULL DEFAULT '0',
  `store_discount_amount` decimal(24,2) NOT NULL DEFAULT '0.00',
  `original_delivery_charge` decimal(24,2) NOT NULL DEFAULT '0.00',
  `failed` timestamp NULL DEFAULT NULL,
  `adjusment` decimal(24,2) NOT NULL DEFAULT '0.00',
  `edited` tinyint(1) NOT NULL DEFAULT '0',
  `delivery_time` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zone_id` bigint(20) UNSIGNED DEFAULT NULL,
  `module_id` bigint(20) UNSIGNED NOT NULL,
  `order_attachment` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parcel_category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `receiver_details` json DEFAULT NULL,
  `charge_payer` enum('sender','receiver') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `distance` double(16,3) NOT NULL DEFAULT '0.000'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `order_amount`, `coupon_discount_amount`, `coupon_discount_title`, `payment_status`, `order_status`, `total_tax_amount`, `payment_method`, `transaction_reference`, `delivery_address_id`, `delivery_man_id`, `coupon_code`, `order_note`, `order_type`, `checked`, `store_id`, `created_at`, `updated_at`, `delivery_charge`, `schedule_at`, `callback`, `otp`, `pending`, `accepted`, `confirmed`, `processing`, `handover`, `picked_up`, `delivered`, `canceled`, `refund_requested`, `refunded`, `delivery_address`, `scheduled`, `store_discount_amount`, `original_delivery_charge`, `failed`, `adjusment`, `edited`, `delivery_time`, `zone_id`, `module_id`, `order_attachment`, `parcel_category_id`, `receiver_details`, `charge_payer`, `distance`) VALUES
(100001, 1, '2174.00', '0.00', '', 'unpaid', 'pending', '54.00', 'cash_on_delivery', NULL, NULL, NULL, NULL, 'Add extra spoons', 'delivery', 1, 1, '2022-07-08 02:32:15', '2022-07-08 03:44:12', '1820.00', '2022-07-08 02:32:15', NULL, '6377', '2022-07-08 02:32:15', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"contact_person_name\":\"ankit kumar\",\"contact_person_number\":\"+917701908492\",\"address_type\":\"others\",\"address\":\"Mumbai, Maharashtra, India\",\"floor\":\"1st\",\"road\":\"bhiwandi\",\"house\":\"h-103, bhiwandi\",\"longitude\":\"72.87765573710203\",\"latitude\":\"19.075983832120244\"}', 0, '0.00', '1820.00', NULL, '0.00', 0, NULL, 1, 1, NULL, NULL, NULL, NULL, 910.093),
(100002, 1, '2174.00', '0.00', '', 'unpaid', 'confirmed', '54.00', 'cash_on_delivery', NULL, NULL, 1, NULL, NULL, 'delivery', 1, 1, '2022-07-08 02:43:13', '2022-07-08 03:44:12', '1820.00', '2022-07-08 02:43:13', NULL, '3618', '2022-07-08 02:43:13', '2022-07-08 03:43:34', '2022-07-08 03:43:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"contact_person_name\":\"ankit kumar\",\"contact_person_number\":\"+917701908492\",\"address_type\":\"others\",\"address\":\"Mumbai, Maharashtra, India\",\"floor\":null,\"road\":null,\"house\":null,\"longitude\":\"72.87765573710203\",\"latitude\":\"19.075983832120244\"}', 0, '0.00', '1820.00', NULL, '0.00', 0, NULL, 1, 1, NULL, NULL, NULL, NULL, 910.093),
(100003, 1, '354.00', '0.00', '', 'unpaid', 'accepted', '54.00', 'cash_on_delivery', NULL, NULL, 1, NULL, NULL, 'delivery', 1, 1, '2022-07-25 13:31:26', '2022-07-25 13:33:22', '0.00', '2022-07-25 13:31:26', NULL, '3689', '2022-07-25 13:31:26', '2022-07-25 13:33:22', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"contact_person_name\":\"ankit kumar\",\"contact_person_number\":\"+917701908492\",\"address_type\":\"others\",\"address\":\"J9HR+782, Sector 63, Noida, Uttar Pradesh 201307, India\",\"floor\":null,\"road\":null,\"house\":null,\"longitude\":\"77.3907011\",\"latitude\":\"28.628236\"}', 0, '0.00', '0.00', NULL, '0.00', 0, NULL, 1, 1, NULL, NULL, NULL, NULL, 1085.960);

-- --------------------------------------------------------

--
-- Table structure for table `order_delivery_histories`
--

CREATE TABLE `order_delivery_histories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED DEFAULT NULL,
  `delivery_man_id` bigint(20) UNSIGNED DEFAULT NULL,
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `start_location` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `end_location` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `item_id` bigint(20) UNSIGNED DEFAULT NULL,
  `order_id` bigint(20) UNSIGNED DEFAULT NULL,
  `price` decimal(24,2) NOT NULL DEFAULT '0.00',
  `item_details` text COLLATE utf8mb4_unicode_ci,
  `variation` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `add_ons` text COLLATE utf8mb4_unicode_ci,
  `discount_on_item` decimal(24,2) DEFAULT NULL,
  `discount_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'amount',
  `quantity` int(11) NOT NULL DEFAULT '1',
  `tax_amount` decimal(24,2) NOT NULL DEFAULT '1.00',
  `variant` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `item_campaign_id` bigint(20) UNSIGNED DEFAULT NULL,
  `total_add_on_price` decimal(24,2) NOT NULL DEFAULT '0.00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_details`
--

INSERT INTO `order_details` (`id`, `item_id`, `order_id`, `price`, `item_details`, `variation`, `add_ons`, `discount_on_item`, `discount_type`, `quantity`, `tax_amount`, `variant`, `created_at`, `updated_at`, `item_campaign_id`, `total_add_on_price`) VALUES
(1, 1, 100001, '300.00', '{\"id\":1,\"name\":\"Paneer Tikka\",\"description\":\"Cottage Cheese marinated with indian spices\",\"image\":\"2022-07-07-62c725b8b1463.png\",\"category_id\":1,\"category_ids\":[{\"id\":\"1\",\"position\":1}],\"variations\":[],\"add_ons\":[],\"attributes\":[],\"choice_options\":[],\"price\":300,\"tax\":17.989999999999998436805981327779591083526611328125,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"percent\",\"available_time_starts\":\"00:00:00\",\"available_time_ends\":\"23:59:00\",\"veg\":1,\"status\":1,\"store_id\":1,\"created_at\":\"2022-07-07T18:28:08.000000Z\",\"updated_at\":\"2022-07-07T18:28:08.000000Z\",\"order_count\":0,\"avg_rating\":0,\"rating_count\":0,\"module_id\":1,\"stock\":0,\"unit_id\":null,\"images\":[\"2022-07-07-62c725b8b0a71.png\"],\"store_name\":\"Pet Pooja\",\"store_discount\":0,\"schedule_order\":false,\"unit_type\":null,\"module\":{\"id\":1,\"module_name\":\"Restaurant\",\"module_type\":\"food\",\"thumbnail\":\"2022-07-07-62c722beba235.png\",\"status\":\"1\",\"stores_count\":1,\"created_at\":\"2022-07-07T18:15:26.000000Z\",\"updated_at\":\"2022-07-07T18:18:42.000000Z\",\"icon\":\"2022-07-07-62c722beb4dff.png\",\"theme_id\":2,\"description\":null,\"all_zone_service\":0,\"translations\":[]},\"unit\":null}', '[]', '[]', '0.00', 'discount_on_product', 1, '54.00', '\"\"', '2022-07-08 02:32:15', '2022-07-08 02:32:15', NULL, '0.00'),
(2, 1, 100002, '300.00', '{\"id\":1,\"name\":\"Paneer Tikka\",\"description\":\"Cottage Cheese marinated with indian spices\",\"image\":\"2022-07-07-62c725b8b1463.png\",\"category_id\":1,\"category_ids\":[{\"id\":\"1\",\"position\":1}],\"variations\":[],\"add_ons\":[],\"attributes\":[],\"choice_options\":[],\"price\":300,\"tax\":17.989999999999998436805981327779591083526611328125,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"percent\",\"available_time_starts\":\"00:00:00\",\"available_time_ends\":\"23:59:00\",\"veg\":1,\"status\":1,\"store_id\":1,\"created_at\":\"2022-07-07T18:28:08.000000Z\",\"updated_at\":\"2022-07-07T18:28:08.000000Z\",\"order_count\":0,\"avg_rating\":0,\"rating_count\":0,\"module_id\":1,\"stock\":0,\"unit_id\":null,\"images\":[\"2022-07-07-62c725b8b0a71.png\"],\"store_name\":\"Pet Pooja\",\"store_discount\":0,\"schedule_order\":false,\"unit_type\":null,\"module\":{\"id\":1,\"module_name\":\"Restaurant\",\"module_type\":\"food\",\"thumbnail\":\"2022-07-07-62c722beba235.png\",\"status\":\"1\",\"stores_count\":1,\"created_at\":\"2022-07-07T18:15:26.000000Z\",\"updated_at\":\"2022-07-07T18:18:42.000000Z\",\"icon\":\"2022-07-07-62c722beb4dff.png\",\"theme_id\":2,\"description\":null,\"all_zone_service\":0,\"translations\":[]},\"unit\":null}', '[]', '[]', '0.00', 'discount_on_product', 1, '54.00', '\"\"', '2022-07-08 02:43:13', '2022-07-08 02:43:13', NULL, '0.00'),
(3, 1, 100003, '300.00', '{\"id\":1,\"name\":\"Paneer Tikka\",\"description\":\"Cottage Cheese marinated with indian spices\",\"image\":\"2022-07-07-62c725b8b1463.png\",\"category_id\":1,\"category_ids\":[{\"id\":\"1\",\"position\":1}],\"variations\":[],\"add_ons\":[],\"attributes\":[],\"choice_options\":[],\"price\":300,\"tax\":17.989999999999998436805981327779591083526611328125,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"percent\",\"available_time_starts\":\"00:00:00\",\"available_time_ends\":\"23:59:00\",\"veg\":1,\"status\":1,\"store_id\":1,\"created_at\":\"2022-07-07T18:28:08.000000Z\",\"updated_at\":\"2022-07-07T18:28:08.000000Z\",\"order_count\":0,\"avg_rating\":0,\"rating_count\":0,\"module_id\":1,\"stock\":0,\"unit_id\":null,\"images\":[\"2022-07-07-62c725b8b0a71.png\"],\"store_name\":\"Pet Pooja\",\"store_discount\":0,\"schedule_order\":true,\"unit_type\":null,\"module\":{\"id\":1,\"module_name\":\"Restaurant\",\"module_type\":\"food\",\"thumbnail\":\"2022-07-07-62c722beba235.png\",\"status\":\"1\",\"stores_count\":1,\"created_at\":\"2022-07-07T18:15:26.000000Z\",\"updated_at\":\"2022-07-07T18:18:42.000000Z\",\"icon\":\"2022-07-07-62c722beb4dff.png\",\"theme_id\":2,\"description\":null,\"all_zone_service\":0,\"translations\":[]},\"unit\":null}', '[]', '[]', '0.00', 'discount_on_product', 1, '54.00', '\"\"', '2022-07-25 13:31:26', '2022-07-25 13:31:26', NULL, '0.00');

-- --------------------------------------------------------

--
-- Table structure for table `order_transactions`
--

CREATE TABLE `order_transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `vendor_id` bigint(20) UNSIGNED DEFAULT NULL,
  `delivery_man_id` bigint(20) UNSIGNED DEFAULT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `order_amount` decimal(24,2) NOT NULL,
  `store_amount` decimal(24,2) NOT NULL DEFAULT '0.00',
  `admin_commission` decimal(24,2) NOT NULL,
  `received_by` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `delivery_charge` decimal(24,2) NOT NULL DEFAULT '0.00',
  `original_delivery_charge` decimal(24,2) NOT NULL DEFAULT '0.00',
  `tax` decimal(24,2) NOT NULL DEFAULT '0.00',
  `zone_id` bigint(20) UNSIGNED DEFAULT NULL,
  `module_id` bigint(20) UNSIGNED NOT NULL,
  `parcel_catgory_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `parcel_categories`
--

CREATE TABLE `parcel_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `orders_count` int(11) NOT NULL DEFAULT '0',
  `module_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `phone_verifications`
--

CREATE TABLE `phone_verifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `provide_d_m_earnings`
--

CREATE TABLE `provide_d_m_earnings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `delivery_man_id` bigint(20) UNSIGNED NOT NULL,
  `amount` decimal(24,2) NOT NULL DEFAULT '0.00',
  `method` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ref` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `item_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `comment` mediumtext COLLATE utf8mb4_unicode_ci,
  `attachment` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rating` int(11) NOT NULL DEFAULT '0',
  `order_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `item_campaign_id` bigint(20) UNSIGNED DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  `module_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `social_media`
--

CREATE TABLE `social_media` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `link` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `soft_credentials`
--

CREATE TABLE `soft_credentials` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` longtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `stores`
--

CREATE TABLE `stores` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `logo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `latitude` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `longitude` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci,
  `footer_text` text COLLATE utf8mb4_unicode_ci,
  `minimum_order` decimal(24,2) NOT NULL DEFAULT '0.00',
  `comission` decimal(24,2) DEFAULT NULL,
  `schedule_order` tinyint(1) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `vendor_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `free_delivery` tinyint(1) NOT NULL DEFAULT '0',
  `rating` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cover_photo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `delivery` tinyint(1) NOT NULL DEFAULT '1',
  `take_away` tinyint(1) NOT NULL DEFAULT '1',
  `item_section` tinyint(1) NOT NULL DEFAULT '1',
  `tax` decimal(24,2) NOT NULL DEFAULT '0.00',
  `zone_id` bigint(20) UNSIGNED DEFAULT NULL,
  `reviews_section` tinyint(1) NOT NULL DEFAULT '1',
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `off_day` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ' ',
  `gst` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `self_delivery_system` tinyint(1) NOT NULL DEFAULT '0',
  `pos_system` tinyint(1) NOT NULL DEFAULT '0',
  `delivery_charge` decimal(24,2) NOT NULL DEFAULT '0.00',
  `delivery_time` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '30-40',
  `veg` tinyint(1) NOT NULL DEFAULT '1',
  `non_veg` tinyint(1) NOT NULL DEFAULT '1',
  `order_count` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `total_order` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `module_id` bigint(20) UNSIGNED NOT NULL,
  `order_place_to_schedule_interval` int(11) DEFAULT '0',
  `featured` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `stores`
--

INSERT INTO `stores` (`id`, `name`, `phone`, `email`, `logo`, `latitude`, `longitude`, `address`, `footer_text`, `minimum_order`, `comission`, `schedule_order`, `status`, `vendor_id`, `created_at`, `updated_at`, `free_delivery`, `rating`, `cover_photo`, `delivery`, `take_away`, `item_section`, `tax`, `zone_id`, `reviews_section`, `active`, `off_day`, `gst`, `self_delivery_system`, `pos_system`, `delivery_charge`, `delivery_time`, `veg`, `non_veg`, `order_count`, `total_order`, `module_id`, `order_place_to_schedule_interval`, `featured`) VALUES
(1, 'Pet Pooja', '9819772556', 'prashantmakhija07@gmail.com', '2022-07-07-62c723821c610.png', '20.59567292983786', '80.37432826483028', '604 MAA Building Gate No 8 Malad West', NULL, '0.00', NULL, 1, 1, 1, '2022-07-07 23:48:42', '2022-07-25 13:31:26', 0, NULL, '2022-07-07-62c723821cdce.png', 1, 1, 1, '17.99', 1, 1, 1, ' ', NULL, 0, 0, '0.00', '30-40 min', 1, 1, 0, 3, 1, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `store_schedule`
--

CREATE TABLE `store_schedule` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `store_id` bigint(20) UNSIGNED NOT NULL,
  `day` int(11) NOT NULL,
  `opening_time` time DEFAULT NULL,
  `closing_time` time DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `store_schedule`
--

INSERT INTO `store_schedule` (`id`, `store_id`, `day`, `opening_time`, `closing_time`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '00:00:00', '23:59:59', '2022-07-08 00:10:01', '2022-07-08 00:10:01'),
(2, 1, 2, '00:00:00', '23:59:59', '2022-07-08 00:10:06', '2022-07-08 00:10:06'),
(3, 1, 3, '00:00:00', '23:59:59', '2022-07-08 00:10:09', '2022-07-08 00:10:09'),
(4, 1, 4, '00:00:00', '23:59:59', '2022-07-08 00:10:11', '2022-07-08 00:10:11'),
(5, 1, 5, '00:00:00', '23:59:59', '2022-07-08 00:10:13', '2022-07-08 00:10:13'),
(6, 1, 6, '00:00:00', '23:59:59', '2022-07-08 00:10:16', '2022-07-08 00:10:16'),
(7, 1, 0, '00:00:00', '23:59:59', '2022-07-08 00:10:18', '2022-07-08 00:10:18');

-- --------------------------------------------------------

--
-- Table structure for table `store_wallets`
--

CREATE TABLE `store_wallets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `vendor_id` bigint(20) UNSIGNED NOT NULL,
  `total_earning` decimal(24,2) NOT NULL DEFAULT '0.00',
  `total_withdrawn` decimal(24,2) NOT NULL DEFAULT '0.00',
  `pending_withdraw` decimal(24,2) NOT NULL DEFAULT '0.00',
  `collected_cash` decimal(24,2) NOT NULL DEFAULT '0.00',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `store_wallets`
--

INSERT INTO `store_wallets` (`id`, `vendor_id`, `total_earning`, `total_withdrawn`, `pending_withdraw`, `collected_cash`, `created_at`, `updated_at`) VALUES
(1, 1, '0.00', '0.00', '0.00', '0.00', '2022-07-08 00:07:52', '2022-07-08 00:07:52');

-- --------------------------------------------------------

--
-- Table structure for table `track_deliverymen`
--

CREATE TABLE `track_deliverymen` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED DEFAULT NULL,
  `delivery_man_id` bigint(20) UNSIGNED DEFAULT NULL,
  `longitude` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `latitude` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `translations`
--

CREATE TABLE `translations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `translationable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `translationable_id` bigint(20) UNSIGNED NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `units`
--

CREATE TABLE `units` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `unit` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `f_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `l_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_phone_verified` tinyint(1) NOT NULL DEFAULT '0',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `interest` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cm_firebase_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `order_count` int(11) NOT NULL DEFAULT '0',
  `login_medium` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `social_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zone_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `f_name`, `l_name`, `phone`, `email`, `image`, `is_phone_verified`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `interest`, `cm_firebase_token`, `status`, `order_count`, `login_medium`, `social_id`, `zone_id`) VALUES
(1, 'ankit', 'kumar', '+917701908492', 'guser3288@gmail.com', NULL, 0, NULL, '$2y$10$PRGvEhgtp.lKH08DRLmtDu3w.zrxYO0aCDHkHMSztIo8N7nWSpsBe', NULL, '2022-07-08 02:21:55', '2022-07-25 13:31:26', NULL, '@', 1, 0, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `user_notifications`
--

CREATE TABLE `user_notifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `data` text COLLATE utf8mb4_unicode_ci,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `vendor_id` bigint(20) UNSIGNED DEFAULT NULL,
  `delivery_man_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_notifications`
--

INSERT INTO `user_notifications` (`id`, `data`, `status`, `user_id`, `vendor_id`, `delivery_man_id`, `created_at`, `updated_at`) VALUES
(1, '{\"title\":\"Order\",\"description\":\"Your order is successfully placed\",\"order_id\":100001,\"image\":\"\",\"type\":\"order_status\"}', 1, 1, NULL, NULL, '2022-07-08 02:32:16', '2022-07-08 02:32:16'),
(2, '{\"title\":\"Order\",\"description\":\"Your order is successfully placed\",\"order_id\":100002,\"image\":\"\",\"type\":\"order_status\"}', 1, 1, NULL, NULL, '2022-07-08 02:43:13', '2022-07-08 02:43:13'),
(3, '{\"title\":\"Order\",\"description\":\"Your order is confirmed\",\"order_id\":100002,\"image\":\"\",\"type\":\"order_status\"}', 1, 1, NULL, NULL, '2022-07-08 03:43:46', '2022-07-08 03:43:46'),
(4, '{\"title\":\"Order\",\"description\":\"New order placed\",\"order_id\":100002,\"image\":\"\",\"type\":\"new_order\"}', 1, NULL, 1, NULL, '2022-07-08 03:43:47', '2022-07-08 03:43:47'),
(5, '{\"title\":\"Order\",\"description\":\"Your order is successfully placed\",\"order_id\":100003,\"image\":\"\",\"type\":\"order_status\"}', 1, 1, NULL, NULL, '2022-07-25 13:31:26', '2022-07-25 13:31:26'),
(6, '{\"title\":\"Order\",\"description\":\"Your order has been assigned to a delivery man\",\"order_id\":100003,\"image\":\"\",\"type\":\"order_status\"}', 1, 1, NULL, NULL, '2022-07-25 13:33:22', '2022-07-25 13:33:22'),
(7, '{\"title\":\"Order\",\"description\":\"You are assigned to a order\",\"order_id\":100003,\"image\":\"\",\"type\":\"assign\"}', 1, NULL, NULL, 1, '2022-07-25 13:33:22', '2022-07-25 13:33:22');

-- --------------------------------------------------------

--
-- Table structure for table `vendors`
--

CREATE TABLE `vendors` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `f_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `l_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `bank_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `branch` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `holder_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  `firebase_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `auth_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `vendors`
--

INSERT INTO `vendors` (`id`, `f_name`, `l_name`, `phone`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `bank_name`, `branch`, `holder_name`, `account_no`, `image`, `status`, `firebase_token`, `auth_token`) VALUES
(1, 'Prashant', 'Makhija', '9819772556', 'prashantmakhija07@gmail.com', NULL, '$2y$10$3KvsI9DqhM9o4jMmySMaPOeyvcnbBZB4FArKB94Jl7Tz.d8OxuVS6', NULL, '2022-07-07 23:48:42', '2022-07-14 19:18:41', NULL, NULL, NULL, NULL, NULL, 1, 'dXkgzo6zT4G0VkeGZE5zEN:APA91bEnfFGws7izcnFKOfDyEbdrTK8bjUn53tm_R3btzNSMF2r40fdewVIIEzrlSOT7feirQGPGUiqlzkoFmOFaWMk5vp7xDUIav_q_AOyUTw4BRMhoYYvspu25TjDAzBqRJMt-T4WZ', 'Q48BY7TLjWNZaiCGphSLGq8srjEavOf80O6EXCW2Ky4Zu4IQD43YiZw2QF0IbU2OHNPC9Qi3qIkUxG4kUE29rsLmfdUOlEUen0lu8WZgMFnnq3BCpyZ5kn8j');

-- --------------------------------------------------------

--
-- Table structure for table `vendor_employees`
--

CREATE TABLE `vendor_employees` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `f_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `l_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `employee_role_id` bigint(20) UNSIGNED NOT NULL,
  `vendor_id` bigint(20) UNSIGNED NOT NULL,
  `store_id` bigint(20) UNSIGNED NOT NULL,
  `password` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `firebase_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `auth_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wishlists`
--

CREATE TABLE `wishlists` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `item_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `store_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `withdraw_requests`
--

CREATE TABLE `withdraw_requests` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `vendor_id` bigint(20) UNSIGNED NOT NULL,
  `admin_id` bigint(20) UNSIGNED DEFAULT NULL,
  `transaction_note` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` decimal(8,2) NOT NULL DEFAULT '0.00',
  `approved` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `zones`
--

CREATE TABLE `zones` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `coordinates` polygon NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `store_wise_topic` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_wise_topic` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deliveryman_wise_topic` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `zones`
--

INSERT INTO `zones` (`id`, `name`, `coordinates`, `status`, `created_at`, `updated_at`, `store_wise_topic`, `customer_wise_topic`, `deliveryman_wise_topic`) VALUES
(1, 'Entire India', 0x000000000103000000010000000b0000001d5189b7ab8d5140c384835fe33f2e401d5189b7eb5a53400c945dd2d82e21401d5189b7eb2a564050ceec8f827635401d5189b72b715740a7ce724b504736401d5189b7eb46584036425aaf33d93b401d5189b72b90564036425aaf33d93b401d5189b7ebb4534031a287b3273440401d5189b72b1a5440149d99488a3b42401d5189b72b585240d7d6e3e6d4ee42401d5189b7eb3e51403438e835705539401d5189b7ab8d5140c384835fe33f2e40, 1, '2022-07-07 23:35:30', '2022-07-07 23:35:30', 'zone_1_store', 'zone_1_customer', 'zone_1_delivery_man');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account_transactions`
--
ALTER TABLE `account_transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `add_ons`
--
ALTER TABLE `add_ons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admins_email_unique` (`email`);

--
-- Indexes for table `admin_roles`
--
ALTER TABLE `admin_roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin_wallets`
--
ALTER TABLE `admin_wallets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `attributes`
--
ALTER TABLE `attributes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `banners`
--
ALTER TABLE `banners`
  ADD PRIMARY KEY (`id`),
  ADD KEY `banners_module_id_foreign` (`module_id`);

--
-- Indexes for table `business_settings`
--
ALTER TABLE `business_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `campaigns`
--
ALTER TABLE `campaigns`
  ADD PRIMARY KEY (`id`),
  ADD KEY `campaigns_module_id_foreign` (`module_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categories_module_id_foreign` (`module_id`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `coupons_code_unique` (`code`),
  ADD KEY `coupons_module_id_foreign` (`module_id`);

--
-- Indexes for table `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer_addresses`
--
ALTER TABLE `customer_addresses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `delivery_histories`
--
ALTER TABLE `delivery_histories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `delivery_man_wallets`
--
ALTER TABLE `delivery_man_wallets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `delivery_men`
--
ALTER TABLE `delivery_men`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `delivery_men_phone_unique` (`phone`);

--
-- Indexes for table `discounts`
--
ALTER TABLE `discounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `d_m_reviews`
--
ALTER TABLE `d_m_reviews`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `email_verifications`
--
ALTER TABLE `email_verifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employee_roles`
--
ALTER TABLE `employee_roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `items_module_id_foreign` (`module_id`);

--
-- Indexes for table `item_campaigns`
--
ALTER TABLE `item_campaigns`
  ADD PRIMARY KEY (`id`),
  ADD KEY `item_campaigns_module_id_foreign` (`module_id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `modules`
--
ALTER TABLE `modules`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `module_types`
--
ALTER TABLE `module_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `newsletters`
--
ALTER TABLE `newsletters`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `newsletters_email_unique` (`email`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_auth_codes_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `zone_id` (`zone_id`),
  ADD KEY `orders_module_id_foreign` (`module_id`);

--
-- Indexes for table `order_delivery_histories`
--
ALTER TABLE `order_delivery_histories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_transactions`
--
ALTER TABLE `order_transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_transactions_zone_id_index` (`zone_id`),
  ADD KEY `order_transactions_module_id_foreign` (`module_id`);

--
-- Indexes for table `parcel_categories`
--
ALTER TABLE `parcel_categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `parcel_categories_name_unique` (`name`),
  ADD KEY `parcel_categories_module_id_foreign` (`module_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `phone_verifications`
--
ALTER TABLE `phone_verifications`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `phone_verifications_phone_unique` (`phone`);

--
-- Indexes for table `provide_d_m_earnings`
--
ALTER TABLE `provide_d_m_earnings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reviews_module_id_foreign` (`module_id`);

--
-- Indexes for table `social_media`
--
ALTER TABLE `social_media`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `soft_credentials`
--
ALTER TABLE `soft_credentials`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stores`
--
ALTER TABLE `stores`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `restaurants_phone_unique` (`phone`),
  ADD KEY `stores_module_id_foreign` (`module_id`);

--
-- Indexes for table `store_schedule`
--
ALTER TABLE `store_schedule`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `store_wallets`
--
ALTER TABLE `store_wallets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `track_deliverymen`
--
ALTER TABLE `track_deliverymen`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `translations`
--
ALTER TABLE `translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `translations_translationable_id_index` (`translationable_id`),
  ADD KEY `translations_locale_index` (`locale`);

--
-- Indexes for table `units`
--
ALTER TABLE `units`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_phone_unique` (`phone`),
  ADD KEY `users_zone_id_index` (`zone_id`);

--
-- Indexes for table `user_notifications`
--
ALTER TABLE `user_notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vendors`
--
ALTER TABLE `vendors`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `vendors_phone_unique` (`phone`),
  ADD UNIQUE KEY `vendors_email_unique` (`email`);

--
-- Indexes for table `vendor_employees`
--
ALTER TABLE `vendor_employees`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `vendor_employees_email_unique` (`email`);

--
-- Indexes for table `wishlists`
--
ALTER TABLE `wishlists`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `withdraw_requests`
--
ALTER TABLE `withdraw_requests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zones`
--
ALTER TABLE `zones`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `zones_name_unique` (`name`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `account_transactions`
--
ALTER TABLE `account_transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `add_ons`
--
ALTER TABLE `add_ons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `admin_roles`
--
ALTER TABLE `admin_roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `admin_wallets`
--
ALTER TABLE `admin_wallets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `attributes`
--
ALTER TABLE `attributes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `banners`
--
ALTER TABLE `banners`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `business_settings`
--
ALTER TABLE `business_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=103;

--
-- AUTO_INCREMENT for table `campaigns`
--
ALTER TABLE `campaigns`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `currencies`
--
ALTER TABLE `currencies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=120;

--
-- AUTO_INCREMENT for table `customer_addresses`
--
ALTER TABLE `customer_addresses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `delivery_histories`
--
ALTER TABLE `delivery_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `delivery_man_wallets`
--
ALTER TABLE `delivery_man_wallets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `delivery_men`
--
ALTER TABLE `delivery_men`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `discounts`
--
ALTER TABLE `discounts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `d_m_reviews`
--
ALTER TABLE `d_m_reviews`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `email_verifications`
--
ALTER TABLE `email_verifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `employee_roles`
--
ALTER TABLE `employee_roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `item_campaigns`
--
ALTER TABLE `item_campaigns`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `modules`
--
ALTER TABLE `modules`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `module_types`
--
ALTER TABLE `module_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `newsletters`
--
ALTER TABLE `newsletters`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=100004;

--
-- AUTO_INCREMENT for table `order_delivery_histories`
--
ALTER TABLE `order_delivery_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `order_transactions`
--
ALTER TABLE `order_transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `parcel_categories`
--
ALTER TABLE `parcel_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `phone_verifications`
--
ALTER TABLE `phone_verifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `provide_d_m_earnings`
--
ALTER TABLE `provide_d_m_earnings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `social_media`
--
ALTER TABLE `social_media`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `soft_credentials`
--
ALTER TABLE `soft_credentials`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `stores`
--
ALTER TABLE `stores`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `store_schedule`
--
ALTER TABLE `store_schedule`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `store_wallets`
--
ALTER TABLE `store_wallets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `track_deliverymen`
--
ALTER TABLE `track_deliverymen`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `translations`
--
ALTER TABLE `translations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `units`
--
ALTER TABLE `units`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `user_notifications`
--
ALTER TABLE `user_notifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `vendors`
--
ALTER TABLE `vendors`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `vendor_employees`
--
ALTER TABLE `vendor_employees`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wishlists`
--
ALTER TABLE `wishlists`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `withdraw_requests`
--
ALTER TABLE `withdraw_requests`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `zones`
--
ALTER TABLE `zones`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `banners`
--
ALTER TABLE `banners`
  ADD CONSTRAINT `banners_module_id_foreign` FOREIGN KEY (`module_id`) REFERENCES `modules` (`id`);

--
-- Constraints for table `campaigns`
--
ALTER TABLE `campaigns`
  ADD CONSTRAINT `campaigns_module_id_foreign` FOREIGN KEY (`module_id`) REFERENCES `modules` (`id`);

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_module_id_foreign` FOREIGN KEY (`module_id`) REFERENCES `modules` (`id`);

--
-- Constraints for table `coupons`
--
ALTER TABLE `coupons`
  ADD CONSTRAINT `coupons_module_id_foreign` FOREIGN KEY (`module_id`) REFERENCES `modules` (`id`);

--
-- Constraints for table `items`
--
ALTER TABLE `items`
  ADD CONSTRAINT `items_module_id_foreign` FOREIGN KEY (`module_id`) REFERENCES `modules` (`id`);

--
-- Constraints for table `item_campaigns`
--
ALTER TABLE `item_campaigns`
  ADD CONSTRAINT `item_campaigns_module_id_foreign` FOREIGN KEY (`module_id`) REFERENCES `modules` (`id`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_module_id_foreign` FOREIGN KEY (`module_id`) REFERENCES `modules` (`id`);

--
-- Constraints for table `order_transactions`
--
ALTER TABLE `order_transactions`
  ADD CONSTRAINT `order_transactions_module_id_foreign` FOREIGN KEY (`module_id`) REFERENCES `modules` (`id`);

--
-- Constraints for table `parcel_categories`
--
ALTER TABLE `parcel_categories`
  ADD CONSTRAINT `parcel_categories_module_id_foreign` FOREIGN KEY (`module_id`) REFERENCES `modules` (`id`);

--
-- Constraints for table `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `reviews_module_id_foreign` FOREIGN KEY (`module_id`) REFERENCES `modules` (`id`);

--
-- Constraints for table `stores`
--
ALTER TABLE `stores`
  ADD CONSTRAINT `stores_module_id_foreign` FOREIGN KEY (`module_id`) REFERENCES `modules` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

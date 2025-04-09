-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Apr 09, 2025 at 04:10 PM
-- Server version: 10.11.10-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `soft_ultimate_pos_laravel`
--

-- --------------------------------------------------------

--
-- Table structure for table `blog_categories`
--

CREATE TABLE `blog_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `business_locations`
--

CREATE TABLE `business_locations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `store_id` bigint(20) UNSIGNED NOT NULL,
  `landmark` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `zip_code` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `created_by` bigint(20) UNSIGNED NOT NULL,
  `updated_by` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `business_locations`
--

INSERT INTO `business_locations` (`id`, `store_id`, `landmark`, `city`, `zip_code`, `state`, `country`, `status`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 12, 'sm sunlight group', 'Naogaon', '6500', 'Rajshahi', 'Bangladesh', 1, 1, 1, '2024-12-24 10:35:51', '2024-12-24 10:35:51'),
(2, 13, 'Sunlight Battery House', 'বরুণকান্দি মোড়, বদলগাছি রোড, নওগাঁ ।', '6500', 'Rajshahi', 'Bangladesh', 1, 1, 1, '2024-12-24 10:36:51', '2024-12-24 10:36:51'),
(3, 14, 'Mayer Doa Battery & IPS', 'আশিক প্লাজা, গোস্তহাটির মোড়, নওগাঁ।', '6500', 'Rajshahi', 'Bangladesh', 1, 1, 1, '2024-12-24 10:37:38', '2024-12-24 10:37:38'),
(4, 15, 'Sunlight Battery & IPS', 'মেইন রোড, দেলুয়াবাড়ি বাজার, মান্দা, নওগাঁ ।', '6510', 'Rajshahi', 'Bangladesh', 1, 1, 1, '2024-12-24 10:38:09', '2024-12-24 10:38:09'),
(5, 16, 'Rongdhonu Battery House', 'আত্রাই রোড, রেল-স্টেশনের পাশে, রানীনগর, নওগাঁ ।', '6500', 'Rajshahi', 'Bangladesh', 1, 1, 1, '2024-12-24 10:38:46', '2024-12-24 10:38:46'),
(6, 17, 'Sunlight Battery House-2', 'Badalgachi, Naogaon', '6500', 'Rajshahi', 'Bangladesh', 1, 1, 1, '2024-12-24 10:39:19', '2024-12-24 10:39:19'),
(7, 18, 'Sunlight Battery House-3', 'Vobanigang, Baghmara, Rajshahi', '6500', 'Rajshahi', 'Bangladesh', 1, 1, 1, '2024-12-24 10:40:07', '2024-12-24 10:40:07'),
(8, 19, 'Sunlight Battery House-4', 'সোহাগ ফিলিং স্টেশনের বিপরীত পাশে, নতুন শাহাপুর, নওগাঁ।', '6500', 'Rajshahi', 'Bangladesh', 1, 1, 1, '2024-12-24 10:40:24', '2024-12-24 10:40:24');

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cache`
--

INSERT INTO `cache` (`key`, `value`, `expiration`) VALUES
('mdshihsbsardar71@gmail.com|182.252.76.16', 'i:4;', 1737202909),
('mdshihsbsardar71@gmail.com|182.252.76.16:timer', 'i:1737202909;', 1737202909);

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `contact_id` char(36) NOT NULL,
  `store_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `father_name` varchar(255) NOT NULL,
  `role` enum('customer','supplier') NOT NULL DEFAULT 'customer',
  `nid` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `district` varchar(255) NOT NULL,
  `thana` varchar(255) NOT NULL,
  `post_office` varchar(255) NOT NULL,
  `village` varchar(255) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`id`, `contact_id`, `store_id`, `name`, `father_name`, `role`, `nid`, `phone`, `district`, `thana`, `post_office`, `village`, `address`, `created_by`, `updated_by`, `status`, `created_at`, `updated_at`) VALUES
(16, 'SBH-03', 17, 'Md. Firoz Hosen', '', 'customer', '', '01750612580', 'Naogaon', 'Badalgachi ', 'New Rasulpur', 'Adhaipur', 'Adhaipur, New Rasulpur, Badalgachi ,Naogaon', NULL, NULL, 1, '2025-01-18 12:33:58', '2025-01-19 16:43:13'),
(17, 'SBH-01', 17, 'Md. Mosarof Hosen', '', 'customer', NULL, '01301895449', '', '', '', '', 'Village: Adibpur ; Post: Vandarpur :Thana: Badalgachi ; District: Naogaon', NULL, NULL, 1, '2025-01-19 15:58:22', '2025-01-19 15:58:27'),
(18, 'SBH-02', 17, 'Bisshonath', '', 'customer', NULL, '01751944800', '', '', '', '', 'Village: Madhob Para; Post: Nittorasulpur ; Thana: Badalgachi; District: Naogaon', NULL, NULL, 1, '2025-01-19 16:42:57', '2025-01-20 07:35:28'),
(19, 'SBH-04', 17, 'Md. Rezaul Karim', '', 'customer', NULL, '01795054572', '', '', '', '', 'Village: Faizabad Post: Badalgachi Thana: Badalgachi District: Naogaon', NULL, NULL, 1, '2025-01-19 16:49:06', '2025-01-19 16:49:10'),
(20, 'SBH-05', 17, 'Bakul Chandra', '', 'customer', NULL, '01760355260', '', '', '', '', 'Village: Vandarpur Post: Vandarpur Thana: Badalgachi District: Naogaon', NULL, NULL, 1, '2025-01-19 16:50:46', '2025-01-19 16:51:17'),
(21, 'SBH-06', 17, 'Md. Nazrul Islam', '', 'customer', NULL, '01706151057', '', '', '', '', 'Village: Uttar Mirjapur ; Post: Badalgachi :Thana: Badalgachi ; District: Naogaon', NULL, NULL, 1, '2025-01-19 16:53:46', '2025-01-19 16:53:49'),
(22, 'SBH-07', 17, 'Sondip', '', 'customer', NULL, '01763752912', '', '', '', '', 'Village: Chilahat; Post: Badalgachi :Thana: Badalgachi ; District: Naogaon', NULL, NULL, 1, '2025-01-19 16:55:08', '2025-01-20 07:35:30'),
(23, 'SBH-08', 17, 'Sukumar', '', 'customer', NULL, '01719685132', '', '', '', '', 'Village: Hapaniya; Post: Badalgachi :Thana: Badalgachi ; District: Naogaon', NULL, NULL, 1, '2025-01-19 16:56:10', '2025-01-19 16:56:13'),
(24, 'SBH-09', 17, 'Md. Mostofa', '', 'customer', NULL, '01733610731', '', '', '', '', 'Village: Adittopur; Post: Vandarpur :Thana: Badalgachi ; District: Naogaon', NULL, NULL, 1, '2025-01-19 16:57:31', '2025-01-19 16:57:40'),
(25, 'SBH-EV-01', 17, 'Md. Yusuf Ali', '', 'customer', NULL, '01756950829', '', '', '', '', 'Village: Gondhobpur; Post: Mithapur; Thana: Badalgachi; District: Naogaon', NULL, NULL, 1, '2025-01-19 17:57:40', '2025-01-19 18:00:57'),
(26, 'SBH-EV-02', 17, 'Md. Belal Hosen', '', 'customer', NULL, '01319550297', '', '', '', '', 'Village: Uttar Paik Para; Post: Kirtipur; Thana: Naogaon Sadar; District: Naogaon', NULL, NULL, 1, '2025-01-19 18:00:53', '2025-01-19 18:00:58'),
(27, 'SBH-EV-03', 17, 'Md. Rafiqul Islam', '', 'customer', NULL, '01791905293', '', '', '', '', 'Village: Gondhobpur; Post: Mithapur; Thana: Badalgachi; District: Naogaon', NULL, NULL, 1, '2025-01-19 18:02:26', '2025-01-19 18:02:28'),
(28, 'SM Sunlight Group', 19, 'Sunlight Battery House-4', '', 'supplier', NULL, '01332844913', '', '', '', '', NULL, NULL, NULL, 1, '2025-04-06 06:39:03', '2025-04-06 07:15:57'),
(29, 'SBH4-0001', 19, 'Md. Monwar Hosen Mintu', '', 'customer', NULL, '01793684929', '', '', '', '', 'pathorkuta, Shantaher, Adamdighi, Bogura', NULL, NULL, 1, '2025-04-06 06:47:51', '2025-04-06 07:15:56'),
(30, 'SBH4-0002', 19, 'Md. Akther Hosen', '', 'customer', NULL, '01964302002', '', '', '', '', 'Ontahar, satoyan, Adamdighi, Bogura', NULL, NULL, 1, '2025-04-06 07:13:17', '2025-04-06 07:15:54'),
(31, 'SBH4-0003', 19, 'Md. Zahangir Alam', '', 'customer', NULL, '01779518393', '', '', '', '', 'Uttarpara, Tarapur, Santaher, Adamdighi, Bogura', NULL, NULL, 1, '2025-04-06 07:26:49', '2025-04-06 07:29:03'),
(32, 'SBH4-0004', 19, 'Md. Abdur Razzak PK', '', 'customer', NULL, '01796610313', '', '', '', '', 'Kuriayapara, Turukbaria, Manda, Naogaon', NULL, NULL, 1, '2025-04-06 07:32:48', '2025-04-06 07:38:36'),
(33, 'SBH4-05', 19, 'Md. Mizanur Rahman', '', 'customer', NULL, '01723989522', '', '', '', '', 'Baghbari, Satiangram, Adamdighi, Bogura', NULL, NULL, 1, '2025-04-06 07:41:16', '2025-04-06 07:44:01'),
(34, 'SBH4-0006', 19, 'Md. Imrul', '', 'customer', NULL, '01714798151', '', '', '', '', 'Sultanpur, Naogaon', NULL, NULL, 1, '2025-04-06 07:48:54', '2025-04-06 08:04:07'),
(35, 'SBH4-07', 19, 'Md. Zahid Hosen Polash', '', 'customer', NULL, '01799648218', '', '', '', '', 'Dogachi, Shantaher, Naogaon', NULL, NULL, 1, '2025-04-06 07:52:26', '2025-04-06 08:04:05'),
(36, 'SBH4-08', 19, 'Shree Shadhon Kurmar', '', 'customer', NULL, '01854805074', '', '', '', '', 'Dhokhin per Naogaon, Naogaon', NULL, NULL, 1, '2025-04-06 08:05:51', '2025-04-06 08:15:31'),
(37, 'SBH4-09', 19, 'Md. Foridul Islam', '', 'customer', NULL, '01755825817', '', '', '', '', 'Kalaikuri, Kalaikuri, Adhamdighi, Bogura', NULL, NULL, 1, '2025-04-06 08:09:48', '2025-04-06 08:15:29'),
(38, 'SBH4-0010', 19, 'Md. Helal Uddin PK', '', 'customer', NULL, '01743608624', '', '', '', '', 'Koromji, Tetuliya, Koromji, Dupchaciya, Bogura', NULL, NULL, 1, '2025-04-06 08:13:00', '2025-04-06 08:15:28'),
(39, 'SBH4-0011', 19, 'Md. Rana', '', 'customer', NULL, '01725673250', '', '', '', '', 'Malshon, Sthantaher, Adamdighi, Bogura', NULL, NULL, 1, '2025-04-06 08:19:05', '2025-04-06 08:24:06'),
(40, 'SBH4-0012', 19, 'Md. Abdul Hamid', '', 'customer', NULL, '01865508054', '', '', '', '', 'Shahapur, Kandhoypara, Shantaher, Naogaon', NULL, NULL, 1, '2025-04-06 08:22:34', '2025-04-06 08:24:04'),
(41, 'SBH4-0013', 19, 'Md. Shohidul Islam', '', 'customer', NULL, '01780175820', '', '', '', '', 'Kalaikuri, koikuri, Adhamdighi, Bogura', NULL, NULL, 1, '2025-04-06 08:25:28', '2025-04-06 08:25:32'),
(42, 'SBH4-ER-0001', 19, 'Md. Zihad Islam', '', 'customer', NULL, '01822187678', '', '', '', '', 'Rampura, Bisiya, Adamdighi, Bogura', NULL, NULL, 1, '2025-04-06 09:20:40', '2025-04-06 09:24:18'),
(43, 'SBH4-ER-0002', 19, 'Md. Alamgir hosen', '', 'customer', NULL, '01315107919', '', '', '', '', 'Pirganj, Rangpur', NULL, NULL, 1, '2025-04-06 09:27:19', '2025-04-06 09:34:10'),
(44, 'SBH4-ER-0003', 19, 'Md. Abu Bakkar', '', 'customer', NULL, '01332844913', '', '', '', '', 'Satiyan, Adamdighi, Bogura', NULL, NULL, 1, '2025-04-06 09:30:15', '2025-04-06 09:34:08'),
(45, 'SBH4-ER-0004', 19, 'Md. Momin', '', 'customer', NULL, '01783328317', '', '', '', '', 'Naogaon', NULL, NULL, 1, '2025-04-06 09:33:22', '2025-04-06 09:34:07');

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `customer_payments`
--

CREATE TABLE `customer_payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) UNSIGNED NOT NULL,
  `amount` decimal(15,2) NOT NULL,
  `payment_method` varchar(255) NOT NULL,
  `paid_on` datetime NOT NULL,
  `payment_account_id` bigint(20) UNSIGNED DEFAULT NULL,
  `document` varchar(255) DEFAULT NULL,
  `payment_note` text DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customer_payments`
--

INSERT INTO `customer_payments` (`id`, `customer_id`, `amount`, `payment_method`, `paid_on`, `payment_account_id`, `document`, `payment_note`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 16, 2000.00, 'cash', '2025-01-18 19:02:00', NULL, NULL, 'Othhg', 6, '2025-01-18 13:02:55', '2025-01-18 13:02:55'),
(2, 16, 2000.00, 'cash', '2025-01-18 19:55:00', NULL, NULL, '789866', 1, '2025-01-18 13:56:02', '2025-01-18 13:56:02'),
(3, 17, 11700.00, 'cash', '2024-12-15 10:16:00', NULL, NULL, NULL, 7, '2025-01-19 16:16:21', '2025-01-19 16:16:21'),
(4, 17, 3000.00, 'cash', '2024-12-18 14:27:00', NULL, NULL, NULL, 7, '2025-01-19 16:27:40', '2025-01-19 16:27:40'),
(5, 18, 13983.00, 'cash', '2024-12-29 16:06:00', NULL, NULL, NULL, 7, '2025-01-19 17:06:47', '2025-01-19 17:06:47'),
(6, 16, 14500.00, 'cash', '2024-12-30 10:15:00', NULL, NULL, NULL, 7, '2025-01-19 17:15:45', '2025-01-19 17:15:45'),
(7, 22, 14987.00, 'cash', '2025-01-05 15:36:00', NULL, NULL, NULL, 7, '2025-01-19 17:36:47', '2025-01-19 17:36:47'),
(8, 23, 15891.00, 'cash', '2025-01-06 14:41:00', NULL, NULL, NULL, 7, '2025-01-19 17:43:06', '2025-01-19 17:43:06'),
(9, 25, 37500.00, 'cash', '2025-01-11 15:11:00', NULL, NULL, '500 tk less', 7, '2025-01-19 18:11:43', '2025-01-19 18:11:43'),
(10, 30, 5000.00, 'cash', '2025-03-15 13:16:00', NULL, NULL, NULL, 8, '2025-04-06 07:17:05', '2025-04-06 07:17:05'),
(11, 31, 8000.00, 'cash', '2025-03-15 13:29:00', NULL, NULL, NULL, 8, '2025-04-06 07:29:22', '2025-04-06 07:29:22'),
(12, 32, 4000.00, 'cash', '2025-03-15 13:38:00', NULL, NULL, NULL, 8, '2025-04-06 07:38:52', '2025-04-06 07:38:52'),
(13, 32, 4000.00, 'cash', '2025-03-28 13:38:00', NULL, NULL, NULL, 8, '2025-04-06 07:39:09', '2025-04-06 07:39:09'),
(14, 33, 37500.00, 'cash', '2025-03-28 13:44:00', NULL, NULL, NULL, 8, '2025-04-06 07:44:19', '2025-04-06 07:44:19'),
(15, 38, 10000.00, 'cash', '2025-03-23 14:15:00', NULL, NULL, NULL, 8, '2025-04-06 08:16:05', '2025-04-06 08:16:05'),
(16, 42, 10000.00, 'cash', '2025-03-14 15:24:00', NULL, NULL, NULL, 8, '2025-04-06 09:24:37', '2025-04-06 09:24:37');

-- --------------------------------------------------------

--
-- Table structure for table `expenses`
--

CREATE TABLE `expenses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `store_id` bigint(20) UNSIGNED NOT NULL,
  `expense_category_id` bigint(20) UNSIGNED NOT NULL,
  `reference_no` varchar(255) NOT NULL,
  `expense_date` date DEFAULT NULL,
  `expense_for_id` bigint(20) UNSIGNED DEFAULT NULL,
  `expense_for_contact` bigint(20) UNSIGNED DEFAULT NULL,
  `document` varchar(255) DEFAULT NULL,
  `total_amount` decimal(15,2) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `expenses`
--

INSERT INTO `expenses` (`id`, `store_id`, `expense_category_id`, `reference_no`, `expense_date`, `expense_for_id`, `expense_for_contact`, `document`, `total_amount`, `status`, `created_at`, `updated_at`) VALUES
(2, 17, 8, '4444444444444', '2025-01-05', 7, NULL, 'documents/CigcUQobNBldQDdx90OeGVjfUzGD7jkpEpxjb0k2.jpg', 200000.00, 1, '2025-01-20 10:40:10', '2025-01-20 10:40:10');

-- --------------------------------------------------------

--
-- Table structure for table `expense_category`
--

CREATE TABLE `expense_category` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `expense_category`
--

INSERT INTO `expense_category` (`id`, `name`, `code`, `created_at`, `updated_at`) VALUES
(1, 'Electric Bill', 'EB', '2024-12-24 03:35:06', '2024-12-24 09:51:54'),
(2, 'Office Vara', 'OV', '2024-12-24 03:35:06', '2024-12-24 09:52:12'),
(3, 'Utilities', 'U', '2024-12-24 03:35:06', '2024-12-24 09:52:20'),
(4, 'Marketing', 'M', '2024-12-24 03:35:06', '2024-12-24 09:52:34'),
(5, 'Employee Benefits', 'EmB', '2024-12-24 03:35:06', '2024-12-24 09:52:51'),
(6, 'Other Cost', 'OC', '2024-12-24 09:53:02', '2024-12-24 09:53:02'),
(7, 'Employee Salary', 'ES', '2024-12-24 09:53:37', '2024-12-24 09:53:37'),
(8, 'Bank Deposite', 'BD', '2025-01-20 10:36:10', '2025-01-20 10:36:10');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invoices`
--

CREATE TABLE `invoices` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invoice_products`
--

CREATE TABLE `invoice_products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ledgers`
--

CREATE TABLE `ledgers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2014_10_12_100000_create_password_resets_table', 1),
(5, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(6, '2024_06_04_111141_laratrust_setup_tables', 1),
(7, '2024_06_05_051337_create_site_settings_table', 1),
(8, '2024_06_29_190834_create_blog_categories_table', 1),
(9, '2024_07_11_195326_create_countries_table', 1),
(10, '2024_10_10_055741_create_stores_table', 1),
(11, '2024_10_10_055849_create_contacts_table', 1),
(12, '2024_10_10_055902_create_product_categories_table', 1),
(13, '2024_10_10_055907_create_products_table', 1),
(14, '2024_10_10_055922_create_purchases_table', 1),
(15, '2024_10_10_060000_create_ledgers_table', 1),
(16, '2024_10_10_060014_create_invoices_table', 1),
(17, '2024_10_10_060031_create_invoice_products_table', 1),
(18, '2024_10_10_060051_create_stock_managers_table', 1),
(19, '2024_10_10_060127_create_stock_transfers_table', 1),
(20, '2024_11_01_040039_create_purchase_items_table', 1),
(21, '2024_11_01_040105_create_purchase_payments_table', 1),
(22, '2024_11_01_040352_create_shipping_details_table', 1),
(23, '2024_11_01_184122_create_sells_table', 1),
(24, '2024_11_01_184133_create_sell_items_table', 1),
(25, '2024_11_01_184149_create_sell_payments_table', 1),
(26, '2024_11_01_184213_create_sell_shipping_details_table', 1),
(27, '2024_11_08_152106_create_pos_table', 1),
(28, '2024_11_08_152332_create_pos_product_table', 1),
(29, '2024_11_11_211624_create_user_stores_table', 1),
(30, '2024_11_12_180346_create_expense_category_table', 1),
(31, '2024_11_15_113233_create_expenses_table', 1),
(32, '2024_11_21_160648_create_business_locations_table', 1),
(33, '2024_11_21_162319_create_product_transfers_table', 1),
(34, '2024_11_22_080902_create_plans_table', 1),
(35, '2024_11_25_142319_create_purchase_returns_table', 1),
(36, '2024_11_25_142326_create_purchase_return_items_table', 1),
(37, '2024_11_27_101329_create_sell_returns_table', 1),
(38, '2024_11_27_101334_create_sell_return_items_table', 1),
(39, '2024_12_15_163638_create_payment_accounts_table', 1),
(40, '2024_12_16_162346_create_customer_payments_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment_accounts`
--

CREATE TABLE `payment_accounts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `account_type` varchar(255) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `display_name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `category` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `display_name`, `description`, `category`, `created_at`, `updated_at`) VALUES
(1, 'dashboard_view', 'View Dashboard', 'Can view dashboard', 'Dashboard', NULL, NULL),
(2, 'store_view', 'View Stores', 'Can view store list', 'Stores', NULL, NULL),
(3, 'store_create', 'Create Store', 'Can create new store', 'Stores', NULL, NULL),
(4, 'store_edit', 'Edit Store', 'Can edit store details', 'Stores', NULL, NULL),
(5, 'store_delete', 'Delete Store', 'Can delete store', 'Stores', NULL, NULL),
(6, 'stock_transfer_view', 'View Stock Transfers', 'Can view stock transfer list', 'Stock Transfer', NULL, NULL),
(7, 'stock_transfer_create', 'Create Stock Transfer', 'Can create stock transfer', 'Stock Transfer', NULL, NULL),
(8, 'stock_transfer_edit', 'Edit Stock Transfer', 'Can edit stock transfer', 'Stock Transfer', NULL, NULL),
(9, 'stock_transfer_delete', 'Delete Stock Transfer', 'Can delete stock transfer', 'Stock Transfer', NULL, NULL),
(10, 'pos_view', 'View POS', 'Can access Point of Sale', 'Point of Sale', NULL, NULL),
(11, 'pos_create', 'Create POS Sale', 'Can create POS sale', 'Point of Sale', NULL, NULL),
(12, 'pos_report_view', 'View POS Reports', 'Can view POS reports', 'Point of Sale', NULL, NULL),
(13, 'contact_view', 'View Contacts', 'Can view contact list', 'Contacts', NULL, NULL),
(14, 'contact_create', 'Create Contact', 'Can create new contact', 'Contacts', NULL, NULL),
(15, 'contact_edit', 'Edit Contact', 'Can edit contact details', 'Contacts', NULL, NULL),
(16, 'contact_delete', 'Delete Contact', 'Can delete contact', 'Contacts', NULL, NULL),
(17, 'customer_view', 'View Customers', 'Can view customer list', 'Customers', NULL, NULL),
(18, 'customer_create', 'Create Customer', 'Can create new customer', 'Customers', NULL, NULL),
(19, 'customer_edit', 'Edit Customer', 'Can edit customer details', 'Customers', NULL, NULL),
(20, 'customer_delete', 'Delete Customer', 'Can delete customer', 'Customers', NULL, NULL),
(21, 'supplier_view', 'View Suppliers', 'Can view supplier list', 'Suppliers', NULL, NULL),
(22, 'supplier_create', 'Create Supplier', 'Can create new supplier', 'Suppliers', NULL, NULL),
(23, 'supplier_edit', 'Edit Supplier', 'Can edit supplier details', 'Suppliers', NULL, NULL),
(24, 'supplier_delete', 'Delete Supplier', 'Can delete supplier', 'Suppliers', NULL, NULL),
(25, 'sell_view', 'View Sells', 'Can view sell list', 'Sells', NULL, NULL),
(26, 'sell_create', 'Create Sell', 'Can create new sell', 'Sells', NULL, NULL),
(27, 'sell_edit', 'Edit Sell', 'Can edit sell details', 'Sells', NULL, NULL),
(28, 'sell_delete', 'Delete Sell', 'Can delete sell', 'Sells', NULL, NULL),
(29, 'purchase_view', 'View Purchases', 'Can view purchase list', 'Purchases', NULL, NULL),
(30, 'purchase_create', 'Create Purchase', 'Can create new purchase', 'Purchases', NULL, NULL),
(31, 'purchase_edit', 'Edit Purchase', 'Can edit purchase details', 'Purchases', NULL, NULL),
(32, 'purchase_delete', 'Delete Purchase', 'Can delete purchase', 'Purchases', NULL, NULL),
(33, 'product_category_view', 'View Product Categories', 'Can view product category list', 'Product Category', NULL, NULL),
(34, 'product_category_create', 'Create Product Category', 'Can create new product category', 'Product Category', NULL, NULL),
(35, 'product_category_edit', 'Edit Product Category', 'Can edit product category details', 'Product Category', NULL, NULL),
(36, 'product_category_delete', 'Delete Product Category', 'Can delete product category', 'Product Category', NULL, NULL),
(37, 'product_view', 'View Products', 'Can view product list', 'Products', NULL, NULL),
(38, 'product_create', 'Create Product', 'Can create new product', 'Products', NULL, NULL),
(39, 'product_edit', 'Edit Product', 'Can edit product details', 'Products', NULL, NULL),
(40, 'product_delete', 'Delete Product', 'Can delete product', 'Products', NULL, NULL),
(41, 'expense_view', 'View Expenses', 'Can view expense list', 'Expenses', NULL, NULL),
(42, 'expense_create', 'Create Expense', 'Can create new expense', 'Expenses', NULL, NULL),
(43, 'expense_edit', 'Edit Expense', 'Can edit expense details', 'Expenses', NULL, NULL),
(44, 'expense_delete', 'Delete Expense', 'Can delete expense', 'Expenses', NULL, NULL),
(45, 'expense_category_view', 'View Expense Categories', 'Can view expense category list', 'Expense Categories', NULL, NULL),
(46, 'expense_category_create', 'Create Expense Category', 'Can create new expense category', 'Expense Categories', NULL, NULL),
(47, 'expense_category_edit', 'Edit Expense Category', 'Can edit expense category details', 'Expense Categories', NULL, NULL),
(48, 'expense_category_delete', 'Delete Expense Category', 'Can delete expense category', 'Expense Categories', NULL, NULL),
(49, 'expense_report_view', 'View Expense Reports', 'Can view expense reports', 'Reports', NULL, NULL),
(50, 'profit_loss_report_view', 'View Profit/Loss Reports', 'Can view profit and loss reports', 'Reports', NULL, NULL),
(51, 'role_assignment_manage', 'Manage Role Assignments', 'Can manage user role assignments', 'Settings', NULL, NULL),
(52, 'business_location_view', 'View Business Locations', 'Can view business location list', 'Business Location', NULL, NULL),
(53, 'business_location_create', 'Create Business Location', 'Can create new business location', 'Business Location', NULL, NULL),
(54, 'business_location_edit', 'Edit Business Location', 'Can edit business location details', 'Business Location', NULL, NULL),
(55, 'business_location_delete', 'Delete Business Location', 'Can delete business location', 'Business Location', NULL, NULL),
(56, 'user_view', 'View Users', 'Can view user list', 'Users', NULL, NULL),
(57, 'user_create', 'Create User', 'Can create new user', 'Users', NULL, NULL),
(58, 'user_edit', 'Edit User', 'Can edit user details', 'Users', NULL, NULL),
(59, 'user_delete', 'Delete User', 'Can delete user', 'Users', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `permission_role`
--

CREATE TABLE `permission_role` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permission_role`
--

INSERT INTO `permission_role` (`permission_id`, `role_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(6, 2),
(7, 1),
(7, 2),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1);

-- --------------------------------------------------------

--
-- Table structure for table `permission_user`
--

CREATE TABLE `permission_user` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `user_type` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permission_user`
--

INSERT INTO `permission_user` (`permission_id`, `user_id`, `user_type`) VALUES
(1, 1, 'App\\Models\\User'),
(2, 1, 'App\\Models\\User'),
(3, 1, 'App\\Models\\User'),
(4, 1, 'App\\Models\\User'),
(5, 1, 'App\\Models\\User'),
(6, 1, 'App\\Models\\User'),
(7, 1, 'App\\Models\\User'),
(8, 1, 'App\\Models\\User'),
(9, 1, 'App\\Models\\User'),
(10, 1, 'App\\Models\\User'),
(11, 1, 'App\\Models\\User'),
(12, 1, 'App\\Models\\User'),
(13, 1, 'App\\Models\\User'),
(14, 1, 'App\\Models\\User'),
(15, 1, 'App\\Models\\User'),
(16, 1, 'App\\Models\\User'),
(17, 1, 'App\\Models\\User'),
(18, 1, 'App\\Models\\User'),
(19, 1, 'App\\Models\\User'),
(20, 1, 'App\\Models\\User'),
(21, 1, 'App\\Models\\User'),
(22, 1, 'App\\Models\\User'),
(23, 1, 'App\\Models\\User'),
(24, 1, 'App\\Models\\User'),
(25, 1, 'App\\Models\\User'),
(26, 1, 'App\\Models\\User'),
(27, 1, 'App\\Models\\User'),
(28, 1, 'App\\Models\\User'),
(29, 1, 'App\\Models\\User'),
(30, 1, 'App\\Models\\User'),
(31, 1, 'App\\Models\\User'),
(32, 1, 'App\\Models\\User'),
(33, 1, 'App\\Models\\User'),
(34, 1, 'App\\Models\\User'),
(35, 1, 'App\\Models\\User'),
(36, 1, 'App\\Models\\User'),
(37, 1, 'App\\Models\\User'),
(38, 1, 'App\\Models\\User'),
(39, 1, 'App\\Models\\User'),
(40, 1, 'App\\Models\\User'),
(41, 1, 'App\\Models\\User'),
(42, 1, 'App\\Models\\User'),
(43, 1, 'App\\Models\\User'),
(44, 1, 'App\\Models\\User'),
(45, 1, 'App\\Models\\User'),
(46, 1, 'App\\Models\\User'),
(47, 1, 'App\\Models\\User'),
(48, 1, 'App\\Models\\User'),
(49, 1, 'App\\Models\\User'),
(50, 1, 'App\\Models\\User'),
(51, 1, 'App\\Models\\User'),
(52, 1, 'App\\Models\\User'),
(53, 1, 'App\\Models\\User'),
(54, 1, 'App\\Models\\User'),
(55, 1, 'App\\Models\\User'),
(56, 1, 'App\\Models\\User'),
(57, 1, 'App\\Models\\User'),
(58, 1, 'App\\Models\\User'),
(59, 1, 'App\\Models\\User'),
(1, 2, 'App\\Models\\User'),
(2, 2, 'App\\Models\\User'),
(3, 2, 'App\\Models\\User'),
(4, 2, 'App\\Models\\User'),
(5, 2, 'App\\Models\\User'),
(6, 2, 'App\\Models\\User'),
(7, 2, 'App\\Models\\User'),
(8, 2, 'App\\Models\\User'),
(9, 2, 'App\\Models\\User'),
(10, 2, 'App\\Models\\User'),
(11, 2, 'App\\Models\\User'),
(12, 2, 'App\\Models\\User'),
(13, 2, 'App\\Models\\User'),
(14, 2, 'App\\Models\\User'),
(15, 2, 'App\\Models\\User'),
(16, 2, 'App\\Models\\User'),
(17, 2, 'App\\Models\\User'),
(18, 2, 'App\\Models\\User'),
(19, 2, 'App\\Models\\User'),
(20, 2, 'App\\Models\\User'),
(21, 2, 'App\\Models\\User'),
(22, 2, 'App\\Models\\User'),
(23, 2, 'App\\Models\\User'),
(24, 2, 'App\\Models\\User'),
(25, 2, 'App\\Models\\User'),
(26, 2, 'App\\Models\\User'),
(27, 2, 'App\\Models\\User'),
(28, 2, 'App\\Models\\User'),
(29, 2, 'App\\Models\\User'),
(30, 2, 'App\\Models\\User'),
(31, 2, 'App\\Models\\User'),
(32, 2, 'App\\Models\\User'),
(33, 2, 'App\\Models\\User'),
(34, 2, 'App\\Models\\User'),
(35, 2, 'App\\Models\\User'),
(36, 2, 'App\\Models\\User'),
(37, 2, 'App\\Models\\User'),
(38, 2, 'App\\Models\\User'),
(39, 2, 'App\\Models\\User'),
(40, 2, 'App\\Models\\User'),
(41, 2, 'App\\Models\\User'),
(42, 2, 'App\\Models\\User'),
(43, 2, 'App\\Models\\User'),
(44, 2, 'App\\Models\\User'),
(45, 2, 'App\\Models\\User'),
(46, 2, 'App\\Models\\User'),
(47, 2, 'App\\Models\\User'),
(48, 2, 'App\\Models\\User'),
(49, 2, 'App\\Models\\User'),
(50, 2, 'App\\Models\\User'),
(51, 2, 'App\\Models\\User'),
(52, 2, 'App\\Models\\User'),
(53, 2, 'App\\Models\\User'),
(54, 2, 'App\\Models\\User'),
(55, 2, 'App\\Models\\User'),
(56, 2, 'App\\Models\\User'),
(57, 2, 'App\\Models\\User'),
(58, 2, 'App\\Models\\User'),
(59, 2, 'App\\Models\\User'),
(1, 6, 'App\\Models\\User'),
(2, 6, 'App\\Models\\User'),
(6, 6, 'App\\Models\\User'),
(7, 6, 'App\\Models\\User'),
(13, 6, 'App\\Models\\User'),
(14, 6, 'App\\Models\\User'),
(15, 6, 'App\\Models\\User'),
(17, 6, 'App\\Models\\User'),
(18, 6, 'App\\Models\\User'),
(19, 6, 'App\\Models\\User'),
(25, 6, 'App\\Models\\User'),
(26, 6, 'App\\Models\\User'),
(33, 6, 'App\\Models\\User'),
(37, 6, 'App\\Models\\User'),
(41, 6, 'App\\Models\\User'),
(42, 6, 'App\\Models\\User'),
(45, 6, 'App\\Models\\User'),
(49, 6, 'App\\Models\\User'),
(1, 7, 'App\\Models\\User'),
(2, 7, 'App\\Models\\User'),
(6, 7, 'App\\Models\\User'),
(7, 7, 'App\\Models\\User'),
(13, 7, 'App\\Models\\User'),
(14, 7, 'App\\Models\\User'),
(15, 7, 'App\\Models\\User'),
(17, 7, 'App\\Models\\User'),
(18, 7, 'App\\Models\\User'),
(19, 7, 'App\\Models\\User'),
(25, 7, 'App\\Models\\User'),
(26, 7, 'App\\Models\\User'),
(37, 7, 'App\\Models\\User'),
(41, 7, 'App\\Models\\User'),
(42, 7, 'App\\Models\\User'),
(45, 7, 'App\\Models\\User'),
(49, 7, 'App\\Models\\User'),
(1, 8, 'App\\Models\\User'),
(2, 8, 'App\\Models\\User'),
(6, 8, 'App\\Models\\User'),
(7, 8, 'App\\Models\\User'),
(13, 8, 'App\\Models\\User'),
(14, 8, 'App\\Models\\User'),
(17, 8, 'App\\Models\\User'),
(18, 8, 'App\\Models\\User'),
(25, 8, 'App\\Models\\User'),
(26, 8, 'App\\Models\\User'),
(33, 8, 'App\\Models\\User'),
(37, 8, 'App\\Models\\User'),
(41, 8, 'App\\Models\\User'),
(42, 8, 'App\\Models\\User'),
(45, 8, 'App\\Models\\User'),
(46, 8, 'App\\Models\\User'),
(52, 8, 'App\\Models\\User'),
(1, 9, 'App\\Models\\User'),
(2, 9, 'App\\Models\\User'),
(6, 9, 'App\\Models\\User'),
(7, 9, 'App\\Models\\User'),
(13, 9, 'App\\Models\\User'),
(14, 9, 'App\\Models\\User'),
(17, 9, 'App\\Models\\User'),
(18, 9, 'App\\Models\\User'),
(25, 9, 'App\\Models\\User'),
(26, 9, 'App\\Models\\User'),
(33, 9, 'App\\Models\\User'),
(34, 9, 'App\\Models\\User'),
(37, 9, 'App\\Models\\User'),
(41, 9, 'App\\Models\\User'),
(42, 9, 'App\\Models\\User'),
(45, 9, 'App\\Models\\User'),
(52, 9, 'App\\Models\\User');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `plans`
--

CREATE TABLE `plans` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `stripe_id` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pos`
--

CREATE TABLE `pos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `contact_id` bigint(20) UNSIGNED NOT NULL,
  `location` varchar(255) DEFAULT NULL,
  `invoiceNo` varchar(255) DEFAULT NULL,
  `shippingAddress` varchar(255) DEFAULT NULL,
  `transaction_date` datetime NOT NULL,
  `quantity` decimal(10,2) NOT NULL,
  `subtotal` decimal(10,2) NOT NULL,
  `discount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `order_tax` decimal(10,2) NOT NULL DEFAULT 0.00,
  `shipping_cost` decimal(10,2) NOT NULL DEFAULT 0.00,
  `total` decimal(10,2) NOT NULL,
  `payment_method` enum('cash','card','multiple') NOT NULL DEFAULT 'cash',
  `transaction_status` enum('draft','quotation','suspend','credit_sale','completed','canceled') NOT NULL DEFAULT 'draft',
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pos_products`
--

CREATE TABLE `pos_products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `pos_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `quantity` decimal(10,2) DEFAULT NULL,
  `unit_cost` decimal(10,2) DEFAULT NULL,
  `discount_percent` decimal(5,2) NOT NULL DEFAULT 0.00,
  `unit_cost_before_tax` decimal(10,2) DEFAULT NULL,
  `tax_amount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `net_cost` decimal(10,2) DEFAULT NULL,
  `profit_margin` decimal(5,2) DEFAULT NULL,
  `unit_selling_price` decimal(10,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `store_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `quantity` int(11) NOT NULL,
  `min_stock` int(11) NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `slug` varchar(255) NOT NULL,
  `sku` varchar(255) NOT NULL,
  `manage_stock` tinyint(1) NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `store_id`, `user_id`, `created_by`, `updated_by`, `name`, `description`, `image`, `price`, `quantity`, `min_stock`, `category_id`, `slug`, `sku`, `manage_stock`, `status`, `created_at`, `updated_at`) VALUES
(10, 17, 1, 1, 1, 'Smart Power', 'Smart Power', 'upload/products/1821693990665108.jpg', 18000.00, 4, 1, 2, 'smart-power', 'SKU-TDN9', 1, 1, '2025-01-19 16:06:11', '2025-01-19 16:07:17'),
(11, 17, 1, 1, 1, 'Smart Power ( Van Battery )', '( Van Battery )', 'upload/products/1821697507573266.jpg', 8500.00, 0, 1, 2, 'smart-power-van-battery', 'SKU-JTJZ', 0, 1, '2025-01-19 16:11:46', '2025-01-19 17:02:05'),
(12, 17, 1, 1, 1, 'Dowedo 60 KG Battery', 'Dowedo 60 KG Battery', 'upload/products/1821697459528418.jpeg', 8500.00, 0, 1, 1, 'dowedo-60-kg-battery', 'SKU-HOTS', 1, 1, '2025-01-19 17:00:15', '2025-01-19 17:46:46'),
(13, 17, 1, 1, 1, 'Dowedo 76 KG Battery', '76 KG Battery', 'upload/products/1821699281160492.jpg', 10000.00, 0, 1, 1, 'dowedo-76-kg-battery', 'SKU-ACX4', 1, 0, '2025-01-19 17:30:16', '2025-01-19 17:34:10'),
(14, 17, 1, 1, 1, '5 Star Battery', NULL, 'upload/products/1821701364744958.jpg', 18000.00, 0, 1, 2, '5-star-battery', 'SKU-8YNZ', 1, 1, '2025-01-19 18:03:23', '2025-01-19 18:24:45'),
(15, 17, 1, 1, 1, 'RED SUN Battery', NULL, 'upload/products/1821701472964572.jpg', 18000.00, 0, 1, 2, 'red-sun-battery', 'SKU-WZZR', 0, 1, '2025-01-19 18:05:07', '2025-01-19 18:15:59'),
(16, 17, 1, 1, 1, 'New Energy Battery', NULL, 'upload/products/1821701524010961.png', 18000.00, 0, 1, 2, 'new-energy-battery', 'SKU-YV1H', 0, 1, '2025-01-19 18:05:55', '2025-01-19 18:23:20'),
(17, 19, 1, 1, 1, 'Smart Power Model 220', 'Model 220v', 'upload/products/1828627944983904.jpg', 18000.00, 0, 1, 2, 'smart-power-model-220', 'SKU-LZO0', 0, 0, '2025-04-06 04:58:25', '2025-04-06 04:58:25'),
(18, 19, 1, 1, 1, 'Dynamic Power Model 220', 'Model 220', 'upload/products/1828628045953794.jpg', 18000.00, 2, 1, 2, 'dynamic-power-model-220', 'SKU-P61Z', 0, 1, '2025-04-06 05:00:01', '2025-04-06 10:01:35'),
(19, 19, 1, 1, 1, 'Korean Power 220', 'Korean Power 220', 'upload/products/1828628323690659.jpg', 18000.00, 0, 1, 2, 'korean-power-220', 'SKU-KVPX', 0, 0, '2025-04-06 05:04:26', '2025-04-06 05:04:26'),
(20, 19, 1, 1, 1, 'Energy King 220', 'Energy King 220', 'upload/products/1828628579333396.jpg', 18000.00, 0, 1, 2, 'energy-king-220', 'SKU-FNAL', 0, 0, '2025-04-06 05:08:30', '2025-04-06 05:08:30'),
(21, 19, 1, 1, 1, 'Total Power 220', 'Total Power 220', 'upload/products/1828628670719154.jpg', 18000.00, 0, 1, 2, 'total-power-220', 'SKU-VMJD', 0, 0, '2025-04-06 05:09:57', '2025-04-06 05:09:57'),
(22, 19, 1, 1, 1, 'Amazon Pro 220', 'Amazon Pro 220', 'upload/products/1828628768619522.jpg', 18000.00, 0, 1, 2, 'amazon-pro-220', 'SKU-TR7G', 0, 0, '2025-04-06 05:11:30', '2025-04-06 05:11:30'),
(23, 19, 1, 1, 1, 'RED SUN 220', 'RED SUN 220', 'upload/products/1828629703174037.jpg', 18500.00, 5, 1, 2, 'red-sun-220', 'SKU-J73P', 0, 1, '2025-04-06 05:26:22', '2025-04-06 10:01:43'),
(27, 19, 1, 1, 1, '5 Star 220', NULL, 'upload/products/1828629772909097.jpg', 18000.00, 0, 1, 2, '5-star-220', 'SKU-G9XH', 0, 0, '2025-04-06 05:27:28', '2025-04-06 05:27:28'),
(28, 19, 1, 1, 1, 'Power Plus SPT 220', 'Power Plus SPT 220', 'upload/products/1828629857221136.jpg', 18000.00, 0, 1, 2, 'power-plus-spt-220', 'SKU-JZRL', 0, 0, '2025-04-06 05:28:49', '2025-04-06 05:28:49'),
(29, 19, 1, 1, 1, 'Toffee 220', 'Toffee 220', 'upload/products/1828629940012494.jpg', 18000.00, 0, 1, 2, 'toffee-220', 'SKU-YM76', 0, 0, '2025-04-06 05:30:08', '2025-04-06 05:30:08'),
(30, 19, 1, 1, 1, 'Z-Gold', NULL, 'upload/products/1828630001967147.jpg', 18000.00, 0, 1, 2, 'z-gold', 'SKU-Z3HZ', 0, 0, '2025-04-06 05:31:07', '2025-04-06 05:31:07'),
(31, 19, 1, 1, 1, 'RoadKing 220', NULL, 'upload/products/1828630075316193.jpg', 18000.00, 0, 1, 2, 'roadking-220', 'SKU-KEL9', 0, 0, '2025-04-06 05:32:17', '2025-04-06 05:32:17'),
(32, 19, 1, 1, 1, 'Power Touch 220', NULL, 'upload/products/1828630144313637.jpg', 18000.00, 0, 1, 2, 'power-touch-220', 'SKU-RZAY', 0, 0, '2025-04-06 05:33:22', '2025-04-06 05:33:22'),
(33, 19, 1, 1, 1, 'Ok Battery', NULL, 'upload/products/1828630214797874.jpg', 18000.00, 14, 1, 2, 'ok-battery', 'SKU-BW6I', 0, 1, '2025-04-06 05:34:30', '2025-04-06 09:41:59'),
(34, 19, 1, 1, 1, 'New Long Life', NULL, 'upload/products/1828630288851465.jpg', 18000.00, 13, 1, 2, 'new-long-life', 'SKU-WYRA', 0, 1, '2025-04-06 05:35:40', '2025-04-06 10:01:22'),
(35, 19, 1, 1, 1, 'Green Leaf 220', NULL, 'upload/products/1828630348344982.jpg', 18000.00, 0, 1, 2, 'green-leaf-220', 'SKU-E1V8', 0, 0, '2025-04-06 05:36:37', '2025-04-06 05:36:37'),
(36, 19, 1, 1, 1, 'Fresh Gold 220', NULL, 'upload/products/1828630418977035.jpg', 18000.00, 0, 1, 1, 'fresh-gold-220', 'SKU-CUZ2', 0, 0, '2025-04-06 05:37:44', '2025-04-06 05:37:44'),
(37, 19, 1, 1, 1, 'Fighter Battery', NULL, 'upload/products/1828631382984404.jpg', 18000.00, 6, 1, 2, 'fighter-battery', 'SKU-QCZ8', 0, 1, '2025-04-06 05:53:04', '2025-04-06 10:25:05'),
(38, 19, 1, 1, 1, 'Magpie Battery', NULL, 'upload/products/1828631428526136.jpg', 18000.00, 4, 1, 2, 'magpie-battery', 'SKU-TVXR', 0, 1, '2025-04-06 05:53:47', '2025-04-06 09:43:43'),
(39, 19, 1, 1, 1, 'SM Sunlight Lithium Battery 150AH', 'SM Sunlight Lithium Battery 150AH', 'upload/products/1828632239360618.jpg', 130000.00, 0, 1, 2, 'sm-sunlight-lithium-battery-150ah', 'SKU-L4GN', 0, 0, '2025-04-06 06:06:40', '2025-04-06 06:06:40'),
(40, 19, 1, 1, 1, 'Smart Power 60 KG', NULL, 'upload/products/1828632461071044.jpg', 7000.00, 0, 1, 1, 'smart-power-60-kg', 'SKU-MIAV', 0, 0, '2025-04-06 06:10:12', '2025-04-06 06:10:12'),
(41, 19, 1, 1, 1, 'Smart Power 76 KG', 'Smart Power 76 KG', 'upload/products/1828632501415124.jpg', 9000.00, 0, 1, 1, 'smart-power-76-kg', 'SKU-LDVF', 0, 0, '2025-04-06 06:10:50', '2025-04-06 06:10:50'),
(42, 19, 1, 1, 1, 'Changshou 60 KG', 'Changshou 60 KG', 'upload/products/1828632593856062.jpg', 7000.00, 0, 1, 1, 'changshou-60-kg', 'SKU-F8UY', 0, 0, '2025-04-06 06:12:18', '2025-04-06 06:12:18'),
(43, 19, 1, 1, 1, 'Changshou 76 KG', 'Changshou 76 KG', 'upload/products/1828632631338668.jpg', 9000.00, 0, 1, 1, 'changshou-76-kg', 'SKU-3L5P', 0, 0, '2025-04-06 06:12:54', '2025-04-06 06:12:54'),
(44, 19, 1, 1, 1, 'China King 60 KG', 'China King 60 KG', 'upload/products/1828632703921438.jpg', 7000.00, 0, 1, 1, 'china-king-60-kg', 'SKU-XPBM', 0, 0, '2025-04-06 06:14:03', '2025-04-06 06:14:03'),
(45, 19, 1, 1, 1, 'China King 76 KG', 'China King 76 KG', 'upload/products/1828632748915022.jpg', 9000.00, 0, 1, 1, 'china-king-76-kg', 'SKU-AKED', 0, 0, '2025-04-06 06:14:46', '2025-04-06 06:14:46'),
(46, 19, 1, 1, 1, 'Toffee 60 KG', 'Toffee 60 KG', 'upload/products/1828632886616794.jpg', 7000.00, 0, 1, 1, 'toffee-60-kg', 'SKU-UQ3M', 0, 0, '2025-04-06 06:16:58', '2025-04-06 06:16:58'),
(47, 19, 1, 1, 1, 'Toffee 68 KG', 'Toffee 68 KG', 'upload/products/1828632925669845.jpg', 8000.00, 0, 1, 1, 'toffee-68-kg', 'SKU-QBGY', 0, 0, '2025-04-06 06:17:24', '2025-04-07 05:33:03'),
(48, 19, 1, 1, 1, 'Toffee 76 KG', 'Toffee 76 KG', 'upload/products/1828632963665657.jpg', 9000.00, 0, 1, 1, 'toffee-76-kg', 'SKU-HSOC', 0, 0, '2025-04-06 06:18:11', '2025-04-06 06:18:11'),
(49, 19, 1, 1, 1, 'DOWEDO 60 KG', 'DOWEDO 60 KG', 'upload/products/1828633050847241.jpg', 7500.00, 0, 1, 1, 'dowedo-60-kg', 'SKU-XZN0', 0, 0, '2025-04-06 06:19:34', '2025-04-06 06:19:34'),
(50, 19, 1, 1, 1, 'DOWEDO 76 KG', 'DOWEDO 76 KG', 'upload/products/1828633084812577.jpg', 9500.00, 0, 1, 1, 'dowedo-76-kg', 'SKU-7RQB', 0, 0, '2025-04-06 06:20:07', '2025-04-06 09:35:56'),
(51, 19, 1, 1, 1, 'Saif Power 5L', 'Saif Power 5L', 'upload/products/1828633307080578.jpg', 120.00, 15, 1, 3, 'saif-power-5l', 'SKU-ZM2F', 0, 1, '2025-04-06 06:23:39', '2025-04-06 10:01:04'),
(52, 19, 1, 1, 1, 'IPS 700 VA', 'IPS 700 VA', 'upload/products/1828633431703214.jpg', 11000.00, 0, 1, 5, 'ips-700-va', 'SKU-XQ83', 0, 0, '2025-04-06 06:25:37', '2025-04-06 06:25:37'),
(53, 19, 1, 1, 1, 'IPS 800 VA NEO', 'IPS 800 VA NEO', 'upload/products/1828633486241866.jpg', 12000.00, 0, 1, 5, 'ips-800-va-neo', 'SKU-KS5P', 0, 0, '2025-04-06 06:26:30', '2025-04-06 06:26:30'),
(54, 19, 1, 1, 1, 'IPS 900 VA NEO', 'IPS 900 VA NEO', 'upload/products/1828633522357009.jpg', 13000.00, 0, 1, 5, 'ips-900-va-neo', 'SKU-FCEI', 0, 0, '2025-04-06 06:27:04', '2025-04-06 06:27:04'),
(55, 19, 1, 1, 1, 'IPS 1050 VA NEO', 'IPS 1050 VA NEO', 'upload/products/1828633562953636.jpg', 14000.00, 0, 1, 5, 'ips-1050-va-neo', 'SKU-CXUF', 0, 0, '2025-04-06 06:27:43', '2025-04-06 06:27:43'),
(56, 19, 1, 1, 1, 'IPS 1150 VA NEO', 'IPS 1150 VA NEO', 'upload/products/1828633612443479.jpg', 15000.00, 0, 1, 5, 'ips-1150-va-neo', 'SKU-RJB6', 0, 0, '2025-04-06 06:28:30', '2025-04-06 06:28:30'),
(57, 19, 1, 1, 1, 'IPS 1250 VA NEO', 'IPS 1250 VA NEO', 'upload/products/1828633651208848.jpg', 17000.00, 0, 1, 5, 'ips-1250-va-neo', 'SKU-ZPL3', 0, 0, '2025-04-06 06:29:07', '2025-04-06 06:29:07'),
(58, 19, 1, 1, 1, 'IPS 1450 VA NEO', 'IPS 1450 VA NEO', 'upload/products/1828633716178062.jpg', 18000.00, 0, 1, 5, 'ips-1450-va-neo', 'SKU-CES3', 0, 0, '2025-04-06 06:30:09', '2025-04-06 06:30:09'),
(59, 19, 1, 1, 1, 'IPS 1750 VA NEO', 'IPS 1750 VA NEO', 'upload/products/1828633767608235.jpg', 19000.00, 0, 1, 5, 'ips-1750-va-neo', 'SKU-SLEA', 0, 0, '2025-04-06 06:30:58', '2025-04-06 06:30:58'),
(60, 19, 1, 1, 1, 'Smart Power 220 AH', 'Smart Power 220 AH', 'upload/products/1828633907852273.jpg', 32000.00, 0, 1, 6, 'smart-power-220-ah', 'SKU-606P', 0, 0, '2025-04-06 06:33:12', '2025-04-06 06:33:12'),
(61, 19, 1, 1, 1, 'Smart Power 190 AH', 'Smart Power 190 AH', 'upload/products/1828633950550628.jpg', 28000.00, 0, 1, 6, 'smart-power-190-ah', 'SKU-QIM5', 0, 0, '2025-04-06 06:33:52', '2025-04-06 06:33:52'),
(62, 19, 1, 1, 1, 'Bir Battery 60 KG', 'Bir Battery 60 KG', 'upload/products/1828643502395518.jpg', 9000.00, 0, 1, 1, 'bir-battery-60-kg', 'SKU-N4DX', 0, 0, '2025-04-06 09:05:42', '2025-04-06 09:28:34'),
(63, 19, 1, 1, 1, 'Hydro Meter', 'Hydro Meter', 'upload/products/1828646452598414.jpg', 200.00, 19, 1, 9, 'hydro-meter', 'SKU-LONT', 0, 1, '2025-04-06 09:52:35', '2025-04-06 10:00:53'),
(64, 19, 1, 1, 1, 'Acid 1280 Gravity', 'Acid 1280 Gravity', 'upload/products/1828646535247137.jpg', 1500.00, 36, 1, 10, 'acid-1280-gravity', 'SKU-UJLA', 0, 1, '2025-04-06 09:53:54', '2025-04-06 10:00:50'),
(65, 19, 1, 1, 1, 'Dry Charger 180 AH', 'Dry Charger 180 AH', 'upload/products/1828646673668248.jpg', 1800.00, 84, 1, 8, 'dry-charger-180-ah', 'SKU-SPKS', 0, 1, '2025-04-06 09:56:06', '2025-04-06 10:00:47'),
(66, 19, 1, 1, 1, 'Dry Charger 200 AH', 'Dry Charger 200 AH', 'upload/products/1828646712013321.jpg', 2500.00, 2, 1, 7, 'dry-charger-200-ah', 'SKU-9FRH', 0, 1, '2025-04-06 09:56:43', '2025-04-06 10:00:45'),
(67, 17, 7, NULL, NULL, 'Fighter Battery', NULL, 'upload/products/1828648497196006.jpg', 18000.00, 3, 1, 2, 'fighter-battery-1743935105', 'Fighter Battery-17-1743935105', 0, 0, '2025-04-06 10:25:05', '2025-04-06 10:25:05');

-- --------------------------------------------------------

--
-- Table structure for table `product_categories`
--

CREATE TABLE `product_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_categories`
--

INSERT INTO `product_categories` (`id`, `name`, `slug`, `status`, `created_at`, `updated_at`) VALUES
(1, 'ER Battery', 'er-battery', 1, '2024-12-24 03:35:06', '2024-12-24 09:48:54'),
(2, 'EV Battery', 'ev-battery', 1, '2024-12-24 03:35:06', '2024-12-24 09:48:45'),
(3, 'DM Water', 'dm-water', 1, '2024-12-24 03:35:06', '2024-12-24 09:49:02'),
(5, 'Home Appliance', 'home-appliance', 1, '2024-12-24 03:35:06', '2024-12-24 09:49:50'),
(6, 'IPS Battery', 'ips-battery', 1, '2025-04-06 06:31:33', '2025-04-06 06:31:33'),
(7, 'Dry Charger 200 AH', 'dry-charger-200-ah', 1, '2025-04-06 09:07:01', '2025-04-06 09:07:01'),
(8, 'Dry Charger 180 AH', 'dry-charger-180-ah', 1, '2025-04-06 09:07:12', '2025-04-06 09:07:12'),
(9, 'Hydro Meter', 'hydro-meter', 1, '2025-04-06 09:07:32', '2025-04-06 09:07:32'),
(10, 'Acid 1280G', 'acid-1280g', 1, '2025-04-06 09:07:55', '2025-04-06 09:08:13');

-- --------------------------------------------------------

--
-- Table structure for table `product_transfers`
--

CREATE TABLE `product_transfers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `from_store_id` bigint(20) UNSIGNED NOT NULL,
  `to_store_id` bigint(20) UNSIGNED NOT NULL,
  `store_product_id` bigint(20) UNSIGNED NOT NULL,
  `quantity` int(11) NOT NULL,
  `status` enum('pending','accepted','rejected') NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_transfers`
--

INSERT INTO `product_transfers` (`id`, `from_store_id`, `to_store_id`, `store_product_id`, `quantity`, `status`, `created_at`, `updated_at`) VALUES
(1, 19, 13, 37, 3, 'rejected', '2025-04-06 10:21:03', '2025-04-06 10:22:10'),
(2, 19, 17, 37, 3, 'accepted', '2025-04-06 10:23:05', '2025-04-06 10:25:05');

-- --------------------------------------------------------

--
-- Table structure for table `purchases`
--

CREATE TABLE `purchases` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `store_id` bigint(20) UNSIGNED NOT NULL,
  `supplier_id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `reference_no` varchar(255) NOT NULL,
  `purchase_date` date NOT NULL,
  `purchase_status` varchar(255) NOT NULL,
  `payment_term` varchar(255) DEFAULT NULL,
  `payment_term_type` varchar(255) DEFAULT NULL,
  `document_path` varchar(255) DEFAULT NULL,
  `total_before_tax` decimal(10,2) NOT NULL,
  `tax_amount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `discount_type` varchar(255) DEFAULT NULL,
  `discount_amount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `discount_percentage` decimal(5,2) NOT NULL DEFAULT 0.00,
  `net_total` decimal(10,2) DEFAULT NULL,
  `additional_notes` text DEFAULT NULL,
  `advance_balance` decimal(10,2) NOT NULL DEFAULT 0.00,
  `payment_due` decimal(10,2) NOT NULL DEFAULT 0.00,
  `payment_status` varchar(255) NOT NULL DEFAULT 'pending',
  `payment_due_date` date DEFAULT NULL,
  `purchase_type` varchar(255) DEFAULT NULL,
  `is_advance_payment` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `purchases`
--

INSERT INTO `purchases` (`id`, `store_id`, `supplier_id`, `customer_id`, `reference_no`, `purchase_date`, `purchase_status`, `payment_term`, `payment_term_type`, `document_path`, `total_before_tax`, `tax_amount`, `discount_type`, `discount_amount`, `discount_percentage`, `net_total`, `additional_notes`, `advance_balance`, `payment_due`, `payment_status`, `payment_due_date`, `purchase_type`, `is_advance_payment`, `created_at`, `updated_at`) VALUES
(10, 19, 28, NULL, '2550', '2025-02-05', 'completed', '0', 'days', NULL, 90000.00, 0.00, 'fixed', 0.00, 12.00, 90000.00, 'dfgndgnghnghn', 90000.00, 0.00, 'paid', NULL, NULL, 0, '2025-04-06 06:42:42', '2025-04-06 06:42:42'),
(11, 19, 28, NULL, '2551', '2025-02-12', 'completed', '1', 'months', NULL, 90000.00, 0.00, 'fixed', 0.00, 12.00, 90000.00, NULL, 90000.00, 0.00, 'paid', NULL, NULL, 0, '2025-04-06 06:57:32', '2025-04-06 06:57:32'),
(12, 19, 28, NULL, '2552', '2025-01-06', 'completed', '3', 'days', NULL, 180000.00, 0.00, 'fixed', 0.00, 12.00, 180000.00, NULL, 180000.00, 0.00, 'paid', NULL, NULL, 0, '2025-04-06 07:01:44', '2025-04-06 07:01:44'),
(13, 19, 28, NULL, '2553', '2025-01-01', 'completed', '3', 'months', NULL, 72000.00, 0.00, 'fixed', 0.00, 12.00, 72000.00, NULL, 72000.00, 0.00, 'paid', NULL, NULL, 0, '2025-04-06 07:03:30', '2025-04-06 07:03:30'),
(15, 19, 28, NULL, '2554', '2025-01-01', 'completed', '3', 'months', NULL, 270000.00, 0.00, 'fixed', 0.00, 12.00, 270000.00, NULL, 270000.00, 0.00, 'paid', NULL, NULL, 0, '2025-04-06 07:04:36', '2025-04-06 07:04:36'),
(16, 19, 28, NULL, '2555', '2025-01-01', 'completed', '3', 'months', NULL, 270000.00, 0.00, 'fixed', 0.00, 12.00, 270000.00, NULL, 270000.00, 0.00, 'paid', NULL, NULL, 0, '2025-04-06 07:06:29', '2025-04-06 07:06:29'),
(17, 19, 28, NULL, '2556', '2025-01-01', 'completed', '3', 'months', NULL, 180000.00, 0.00, NULL, 0.00, 12.00, 180000.00, NULL, 180000.00, 0.00, 'paid', NULL, NULL, 0, '2025-04-06 07:07:29', '2025-04-06 07:07:29'),
(18, 19, 28, NULL, 'qrqrfqe', '2025-04-06', 'completed', '1', 'months', NULL, 42000.00, 0.00, 'fixed', 0.00, 12.00, 42000.00, NULL, 42000.00, 0.00, 'paid', NULL, NULL, 0, '2025-04-06 09:11:57', '2025-04-06 09:11:57'),
(19, 19, 28, NULL, '788767576576576576', '2025-04-06', 'completed', '3', 'months', NULL, 85500.00, 0.00, 'fixed', 0.00, 12.00, 85500.00, NULL, 0.00, 85500.00, 'pending', NULL, NULL, 0, '2025-04-06 09:17:52', '2025-04-06 09:17:52'),
(20, 19, 28, NULL, '1111111111111', '2025-04-06', 'completed', '6', 'months', NULL, 252000.00, 0.00, 'fixed', 0.00, 12.00, 252000.00, NULL, 0.00, 252000.00, 'pending', NULL, NULL, 0, '2025-04-06 09:41:23', '2025-04-06 09:41:23'),
(21, 19, 28, NULL, '2222222222222', '2025-04-06', 'completed', '6', 'months', NULL, 72000.00, 0.00, NULL, 0.00, 12.00, 72000.00, NULL, 0.00, 72000.00, 'pending', NULL, NULL, 0, '2025-04-06 09:43:25', '2025-04-06 09:43:25'),
(22, 19, 28, NULL, '333333333333333333', '2025-04-06', 'completed', '6', 'months', NULL, 162000.00, 0.00, NULL, 0.00, 12.00, 162000.00, NULL, 0.00, 162000.00, 'pending', NULL, NULL, 0, '2025-04-06 09:44:51', '2025-04-06 09:44:51'),
(23, 19, 28, NULL, '44444444444444444', '2025-04-06', 'completed', '6', 'months', NULL, 234000.00, 0.00, NULL, 0.00, 12.00, 234000.00, NULL, 0.00, 234000.00, 'pending', NULL, NULL, 0, '2025-04-06 09:47:24', '2025-04-06 09:47:24'),
(24, 19, 28, NULL, '5555555555555555', '2025-04-06', 'completed', '6', 'months', NULL, 92500.00, 0.00, NULL, 0.00, 12.00, 92500.00, NULL, 0.00, 92500.00, 'pending', NULL, NULL, 0, '2025-04-06 09:48:10', '2025-04-06 09:48:10'),
(25, 19, 28, NULL, '666666666666', '2025-04-06', 'completed', '6', 'months', NULL, 36000.00, 0.00, NULL, 0.00, 12.00, 36000.00, NULL, 0.00, 36000.00, 'pending', NULL, NULL, 0, '2025-04-06 09:48:53', '2025-04-06 09:48:53'),
(26, 19, 28, NULL, '77777777777777', '2025-04-06', 'completed', '6', 'months', NULL, 1800.00, 0.00, NULL, 0.00, 12.00, 1800.00, NULL, 0.00, 1800.00, 'pending', NULL, NULL, 0, '2025-04-06 09:50:50', '2025-04-06 09:50:50'),
(27, 19, 28, NULL, '8888888888888888', '2025-04-06', 'completed', '6', 'months', NULL, 3800.00, 0.00, NULL, 0.00, 12.00, 3800.00, NULL, 0.00, 3800.00, 'pending', NULL, NULL, 0, '2025-04-06 09:57:49', '2025-04-06 09:57:49'),
(28, 19, 28, NULL, '99999999999999', '2025-04-06', 'completed', '6', 'months', NULL, 54000.00, 0.00, NULL, 0.00, 12.00, 54000.00, NULL, 0.00, 54000.00, 'pending', NULL, NULL, 0, '2025-04-06 09:58:39', '2025-04-06 09:58:39'),
(29, 19, 28, NULL, '101010101010', '2025-04-06', 'completed', '6', 'months', NULL, 151200.00, 0.00, NULL, 0.00, 12.00, 151200.00, NULL, 0.00, 151200.00, 'pending', NULL, NULL, 0, '2025-04-06 09:59:30', '2025-04-06 09:59:30'),
(30, 19, 28, NULL, '1212121', '2025-04-06', 'completed', '6', 'months', NULL, 5000.00, 0.00, NULL, 0.00, 12.00, 5000.00, NULL, 0.00, 5000.00, 'pending', NULL, NULL, 0, '2025-04-06 10:00:15', '2025-04-06 10:00:15');

-- --------------------------------------------------------

--
-- Table structure for table `purchase_items`
--

CREATE TABLE `purchase_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `purchase_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `quantity` decimal(10,2) NOT NULL,
  `unit_cost` decimal(10,2) NOT NULL,
  `discount_percent` decimal(5,2) NOT NULL DEFAULT 0.00,
  `unit_cost_before_tax` decimal(10,2) NOT NULL,
  `tax_amount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `net_cost` decimal(10,2) NOT NULL,
  `profit_margin` decimal(5,2) NOT NULL,
  `unit_selling_price` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `purchase_items`
--

INSERT INTO `purchase_items` (`id`, `purchase_id`, `product_id`, `quantity`, `unit_cost`, `discount_percent`, `unit_cost_before_tax`, `tax_amount`, `net_cost`, `profit_margin`, `unit_selling_price`, `created_at`, `updated_at`) VALUES
(10, 10, 37, 5.00, 18000.00, 0.00, 18000.00, 0.00, 18000.00, 0.00, 18000.00, '2025-04-06 06:42:42', '2025-04-06 06:42:42'),
(11, 11, 23, 5.00, 18000.00, 0.00, 18000.00, 0.00, 18000.00, 0.00, 18000.00, '2025-04-06 06:57:32', '2025-04-06 06:57:32'),
(12, 12, 33, 10.00, 18000.00, 0.00, 18000.00, 0.00, 18000.00, 0.00, 18000.00, '2025-04-06 07:01:44', '2025-04-06 07:01:44'),
(13, 13, 23, 4.00, 18000.00, 0.00, 18000.00, 0.00, 18000.00, 0.00, 18000.00, '2025-04-06 07:03:30', '2025-04-06 07:03:30'),
(15, 15, 34, 15.00, 18000.00, 0.00, 18000.00, 0.00, 18000.00, 0.00, 18000.00, '2025-04-06 07:04:36', '2025-04-06 07:04:36'),
(16, 16, 37, 15.00, 18000.00, 0.00, 18000.00, 0.00, 18000.00, 0.00, 18000.00, '2025-04-06 07:06:29', '2025-04-06 07:06:29'),
(17, 17, 38, 10.00, 18000.00, 0.00, 18000.00, 0.00, 18000.00, 0.00, 18000.00, '2025-04-06 07:07:29', '2025-04-06 07:07:29'),
(18, 18, 62, 6.00, 7000.00, 0.00, 7000.00, 0.00, 7000.00, 0.00, 7000.00, '2025-04-06 09:11:57', '2025-04-06 09:11:57'),
(19, 19, 50, 9.00, 9500.00, 0.00, 9500.00, 0.00, 9500.00, 0.00, 9500.00, '2025-04-06 09:17:52', '2025-04-06 09:17:52'),
(20, 20, 33, 14.00, 18000.00, 0.00, 18000.00, 0.00, 18000.00, 0.00, 18000.00, '2025-04-06 09:41:23', '2025-04-06 09:41:23'),
(21, 21, 38, 4.00, 18000.00, 0.00, 18000.00, 0.00, 18000.00, 0.00, 18000.00, '2025-04-06 09:43:25', '2025-04-06 09:43:25'),
(22, 22, 37, 9.00, 18000.00, 0.00, 18000.00, 0.00, 18000.00, 0.00, 18000.00, '2025-04-06 09:44:51', '2025-04-06 09:44:51'),
(23, 23, 34, 13.00, 18000.00, 0.00, 18000.00, 0.00, 18000.00, 0.00, 18000.00, '2025-04-06 09:47:24', '2025-04-06 09:47:24'),
(24, 24, 23, 5.00, 18500.00, 0.00, 18500.00, 0.00, 18500.00, 0.00, 18500.00, '2025-04-06 09:48:10', '2025-04-06 09:48:10'),
(25, 25, 18, 2.00, 18000.00, 0.00, 18000.00, 0.00, 18000.00, 0.00, 18000.00, '2025-04-06 09:48:53', '2025-04-06 09:48:53'),
(26, 26, 51, 15.00, 120.00, 0.00, 120.00, 0.00, 120.00, 0.00, 120.00, '2025-04-06 09:50:50', '2025-04-06 09:50:50'),
(27, 27, 63, 19.00, 200.00, 0.00, 200.00, 0.00, 200.00, 0.00, 200.00, '2025-04-06 09:57:49', '2025-04-06 09:57:49'),
(28, 28, 64, 36.00, 1500.00, 0.00, 1500.00, 0.00, 1500.00, 0.00, 1500.00, '2025-04-06 09:58:39', '2025-04-06 09:58:39'),
(29, 29, 65, 84.00, 1800.00, 0.00, 1800.00, 0.00, 1800.00, 0.00, 1800.00, '2025-04-06 09:59:30', '2025-04-06 09:59:30'),
(30, 30, 66, 2.00, 2500.00, 0.00, 2500.00, 0.00, 2500.00, 0.00, 2500.00, '2025-04-06 10:00:15', '2025-04-06 10:00:15');

-- --------------------------------------------------------

--
-- Table structure for table `purchase_payments`
--

CREATE TABLE `purchase_payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `purchase_id` bigint(20) UNSIGNED NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `paid_on` varchar(255) NOT NULL,
  `payment_method` varchar(255) NOT NULL,
  `payment_account` varchar(255) DEFAULT NULL,
  `payment_status` varchar(255) NOT NULL DEFAULT 'completed',
  `transaction_reference` varchar(255) DEFAULT NULL,
  `payment_note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `purchase_payments`
--

INSERT INTO `purchase_payments` (`id`, `purchase_id`, `amount`, `paid_on`, `payment_method`, `payment_account`, `payment_status`, `transaction_reference`, `payment_note`, `created_at`, `updated_at`) VALUES
(2, 10, 90000.00, '2025-04-06 06:42:42', 'cash', NULL, 'completed', NULL, 'fdfgdgnd', '2025-04-06 06:42:42', '2025-04-06 06:42:42'),
(3, 11, 90000.00, '2025-04-06 06:57:32', 'cash', NULL, 'completed', NULL, NULL, '2025-04-06 06:57:32', '2025-04-06 06:57:32'),
(4, 12, 180000.00, '2025-04-06 07:01:44', 'cash', NULL, 'completed', NULL, NULL, '2025-04-06 07:01:44', '2025-04-06 07:01:44'),
(5, 13, 72000.00, '2025-04-06 07:03:30', 'cash', NULL, 'completed', NULL, NULL, '2025-04-06 07:03:30', '2025-04-06 07:03:30'),
(6, 15, 270000.00, '2025-04-06 07:04:36', 'cash', NULL, 'completed', NULL, NULL, '2025-04-06 07:04:36', '2025-04-06 07:04:36'),
(7, 16, 270000.00, '2025-04-06 07:06:29', 'cash', NULL, 'completed', NULL, NULL, '2025-04-06 07:06:29', '2025-04-06 07:06:29'),
(8, 17, 180000.00, '2025-04-06 07:07:29', 'cash', NULL, 'completed', NULL, NULL, '2025-04-06 07:07:29', '2025-04-06 07:07:29'),
(9, 18, 42000.00, '2025-04-06 09:11:57', 'cash', NULL, 'completed', NULL, NULL, '2025-04-06 09:11:57', '2025-04-06 09:11:57');

-- --------------------------------------------------------

--
-- Table structure for table `purchase_returns`
--

CREATE TABLE `purchase_returns` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `purchase_id` bigint(20) UNSIGNED NOT NULL,
  `return_date` date NOT NULL,
  `reason` varchar(255) DEFAULT NULL,
  `total_return_amount` decimal(10,2) NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'processed',
  `notes` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `purchase_return_items`
--

CREATE TABLE `purchase_return_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `purchase_return_id` bigint(20) UNSIGNED NOT NULL,
  `purchase_item_id` bigint(20) UNSIGNED NOT NULL,
  `quantity` decimal(10,2) NOT NULL,
  `unit_cost` decimal(10,2) NOT NULL,
  `total_return_amount` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `display_name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `display_name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'Admin', NULL, NULL, NULL),
(2, 'manager', 'Manager', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `role_user`
--

CREATE TABLE `role_user` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `user_type` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_user`
--

INSERT INTO `role_user` (`role_id`, `user_id`, `user_type`) VALUES
(1, 1, 'App\\Models\\User'),
(2, 2, 'App\\Models\\User'),
(2, 6, 'App\\Models\\User'),
(2, 7, 'App\\Models\\User'),
(2, 8, 'App\\Models\\User'),
(2, 9, 'App\\Models\\User'),
(2, 10, 'App\\Models\\User');

-- --------------------------------------------------------

--
-- Table structure for table `sells`
--

CREATE TABLE `sells` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `store_id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) UNSIGNED NOT NULL,
  `reference_no` varchar(255) NOT NULL,
  `invoice_no` varchar(255) NOT NULL,
  `sell_date` date NOT NULL,
  `sell_status` varchar(255) NOT NULL,
  `payment_term` varchar(255) DEFAULT NULL,
  `payment_term_type` varchar(255) DEFAULT NULL,
  `total_before_tax` decimal(10,2) NOT NULL,
  `tax_amount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `discount_type` varchar(255) DEFAULT NULL,
  `discount_amount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `discount_percentage` decimal(5,2) NOT NULL DEFAULT 0.00,
  `net_total` decimal(10,2) DEFAULT NULL,
  `advance_balance` decimal(10,2) NOT NULL DEFAULT 0.00,
  `payment_due` decimal(10,2) NOT NULL DEFAULT 0.00,
  `payment_status` varchar(255) NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sells`
--

INSERT INTO `sells` (`id`, `store_id`, `customer_id`, `reference_no`, `invoice_no`, `sell_date`, `sell_status`, `payment_term`, `payment_term_type`, `total_before_tax`, `tax_amount`, `discount_type`, `discount_amount`, `discount_percentage`, `net_total`, `advance_balance`, `payment_due`, `payment_status`, `created_at`, `updated_at`) VALUES
(4, 17, 17, '01758997258', 'BB49B0313D7E0C35E469B454A11652', '2024-12-15', 'completed', '2', 'months', 34000.00, 0.00, 'fixed', 4000.00, 0.00, 30000.00, 11700.00, 15300.00, 'partial', '2025-01-19 16:26:36', '2025-01-19 16:27:40'),
(5, 17, 18, 'Kalam', '26F8401E01DF9B93161D5B755CE5AA', '2024-12-29', 'completed', NULL, NULL, 34000.00, 0.00, 'fixed', 5000.00, 0.00, 29000.00, 15017.00, 0.00, 'paid', '2025-01-19 17:05:06', '2025-01-19 17:06:47'),
(7, 17, 16, '01707212930 =Son; 01723999609=Siddik', 'B84D22D717B3DF25723F0256D08A9F', '2024-12-30', 'completed', '2', 'months', 34000.00, 0.00, 'fixed', 2500.00, 0.00, 31500.00, 14500.00, 17000.00, 'completed', '2025-01-19 17:20:43', '2025-01-19 17:20:43'),
(8, 17, 19, '01758218360=(Moznu)', '3ECEA7AAAE808CB53DFBEC718E23A7', '2024-12-31', 'completed', '2', 'months', 34000.00, 0.00, 'fixed', 2000.00, 0.00, 32000.00, 12607.00, 19393.00, 'completed', '2025-01-19 17:24:28', '2025-01-19 17:24:28'),
(9, 17, 20, '01758997258=Ahad ali', '9B03E624B1CB99AA6A89D778D25BC8', '2025-01-04', 'completed', '2', 'months', 34000.00, 0.00, 'fixed', 1800.00, 0.00, 32200.00, 13500.00, 18700.00, 'completed', '2025-01-19 17:26:58', '2025-01-19 17:26:58'),
(10, 17, 21, '01740001368 = Abdur Rahim', '3D5E867534307EC3B239C3E7F8B092', '2025-01-05', 'completed', '2', 'months', 40000.00, 0.00, 'fixed', 2500.00, 0.00, 37500.00, 14140.00, 23360.00, 'completed', '2025-01-19 17:33:16', '2025-01-19 17:33:16'),
(11, 17, 22, 'AE72237898D42E97', '968662783177B82D126EC821B55D9E', '2025-01-05', 'completed', NULL, NULL, 34000.00, 0.00, 'fixed', 5000.00, 0.00, 29000.00, 14013.00, 0.00, 'paid', '2025-01-19 17:35:44', '2025-01-19 17:36:47'),
(12, 17, 23, '87B030F6BB2B5151', 'EE707E4E8C44632DF6645C0F105C69', '2025-01-06', 'completed', NULL, NULL, 34000.00, 0.00, 'fixed', 5500.00, 0.00, 28500.00, 12609.00, 0.00, 'paid', '2025-01-19 17:41:33', '2025-01-19 17:43:06'),
(13, 17, 24, '01758997258=Ahsak ali', '973343D46A1C8C3156DC3ED9B8E900', '2025-01-14', 'completed', '2', 'months', 34000.00, 0.00, 'fixed', 1500.00, 0.00, 32500.00, 12348.00, 20152.00, 'completed', '2025-01-19 17:46:46', '2025-01-19 17:46:46'),
(14, 17, 25, '01723272548=Bakul', '0BF7E1C0C1E90E808E2578CC965AA0', '2025-01-06', 'completed', '7', 'days', 90000.00, 0.00, 'fixed', 14000.00, 0.00, 76000.00, 38000.00, 500.00, 'partial', '2025-01-19 18:10:49', '2025-01-19 18:11:43'),
(15, 17, 26, '01721615319 = Sujon 017319550297= Tara Banu', '5C536CF118DF04992EB3147F361734', '2025-01-13', 'completed', '3', 'months', 72000.00, 0.00, 'fixed', 4000.00, 0.00, 68000.00, 30400.00, 37600.00, 'completed', '2025-01-19 18:15:59', '2025-01-19 18:15:59'),
(17, 17, 27, '01756950829=Yusuf', 'F43251EE4A47DB96626698CB06AF75', '2025-01-15', 'completed', '15', 'days', 90000.00, 0.00, 'fixed', 14000.00, 0.00, 76000.00, 38000.00, 38000.00, 'completed', '2025-01-19 18:24:45', '2025-01-19 18:24:45'),
(18, 19, 29, '30B1552E98E4F959', 'E4D20088537750CCC3B6CF2F76F6E1', '2025-02-06', 'completed', '6', 'months', 90000.00, 0.00, 'fixed', 4000.00, 0.00, 86000.00, 30000.00, 56000.00, 'completed', '2025-04-06 06:50:25', '2025-04-06 06:50:25'),
(19, 19, 30, '017', '57779EAFA10F4C98B2C86FB8965B4E', '2025-02-12', 'completed', '6', 'months', 90000.00, 0.00, 'fixed', 5000.00, 0.00, 85000.00, 30000.00, 50000.00, 'partial', '2025-04-06 07:15:27', '2025-04-06 07:17:05'),
(20, 19, 31, '027', '08B9F67145E264214EDE81F5E7EFBB', '2025-02-23', 'completed', '4', 'months', 90000.00, 0.00, 'fixed', 10000.00, 0.00, 80000.00, 40000.00, 32000.00, 'partial', '2025-04-06 07:28:45', '2025-04-06 07:29:22'),
(21, 19, 32, '030', 'D7236031F35076457BCBAE4E2BF4A6', '2025-03-03', 'completed', '6', 'months', 74000.00, 0.00, 'fixed', 1000.00, 0.00, 73000.00, 20000.00, 45000.00, 'partial', '2025-04-06 07:38:21', '2025-04-06 07:39:09'),
(22, 19, 33, '3D53758223B7E904', '97E778BCAC3B872B2F3AA79E3F1451', '2025-03-03', 'completed', '6', 'months', 90000.00, 0.00, 'fixed', 4000.00, 0.00, 86000.00, 37500.00, 11000.00, 'partial', '2025-04-06 07:43:44', '2025-04-06 07:44:19'),
(23, 19, 34, '901', '34F291679C6D300228C2822C4CE628', '2025-03-04', 'completed', NULL, NULL, 90000.00, 0.00, 'fixed', 15000.00, 0.00, 75000.00, 75000.00, 0.00, 'completed', '2025-04-06 07:50:47', '2025-04-06 07:50:47'),
(24, 19, 35, '031', '76F6AEB70D7FE44723AC1FECC2DD66', '2025-03-04', 'completed', '6', 'months', 90000.00, 0.00, 'fixed', 7000.00, 0.00, 85000.00, 45000.00, 40000.00, 'completed', '2025-04-06 07:55:56', '2025-04-06 07:55:56'),
(25, 19, 36, '8DC2476A67E46A98', 'FA90EBD48689F129023C2300ED6BB2', '2025-03-17', 'completed', '6', 'months', 90000.00, 0.00, 'fixed', 4000.00, 0.00, 86000.00, 40000.00, 46000.00, 'completed', '2025-04-06 08:07:19', '2025-04-06 08:07:19'),
(26, 19, 37, '243482EA3A878014', 'E7A678FE4CC04D082D82B2B7A4A1D0', '2025-03-18', 'completed', '6', 'months', 90000.00, 0.00, 'fixed', 4000.00, 0.00, 86000.00, 39500.00, 46500.00, 'completed', '2025-04-06 08:11:20', '2025-04-06 08:11:20'),
(27, 19, 38, '8C983885CA30EBDF', 'A93D9C56B857C793DD94EAB666B693', '2025-03-18', 'completed', '6', 'months', 90000.00, 0.00, 'fixed', 4000.00, 0.00, 86000.00, 37000.00, 39000.00, 'partial', '2025-04-06 08:15:17', '2025-04-06 08:16:05'),
(28, 19, 39, '40831ADCE0F58F7D', '87DFC93FCA25575061D88F4345D22D', '2025-03-22', 'completed', '6', 'months', 90000.00, 0.00, 'fixed', 5500.00, 0.00, 84500.00, 38500.00, 46000.00, 'completed', '2025-04-06 08:20:17', '2025-04-06 08:20:17'),
(29, 19, 40, 'F4C94B0C49CFD66E', '34C0D45F30770A17E34C4C5423D916', '2025-03-24', 'completed', '6', 'months', 90000.00, 0.00, 'fixed', 4000.00, 0.00, 86000.00, 35000.00, 51000.00, 'completed', '2025-04-06 08:23:52', '2025-04-06 08:23:52'),
(30, 19, 41, 'F18F7B9D3C1DB3F6', '47B1E4069193D3DC906086CE287E95', '2025-03-29', 'completed', '6', 'months', 90000.00, 0.00, 'fixed', 4000.00, 0.00, 86000.00, 47000.00, 39000.00, 'completed', '2025-04-06 08:26:41', '2025-04-06 08:26:41'),
(31, 19, 42, '8145892E5DE027F4', '5AA697BD5B45B3D695C68E0F6C9055', '2025-01-23', 'completed', '3', 'months', 36000.00, 0.00, 'fixed', 6000.00, 0.00, 30000.00, 12600.00, 7400.00, 'partial', '2025-04-06 09:24:04', '2025-04-06 09:24:37'),
(32, 19, 43, 'C03A1F63EF69644B', '2648CBE38EC6BF4D34462854DB40F7', '2025-02-13', 'completed', NULL, NULL, 18000.00, 0.00, 'fixed', 5000.00, 0.00, 13000.00, 13000.00, 0.00, 'completed', '2025-04-06 09:28:34', '2025-04-06 09:28:34'),
(33, 19, 44, '12F936A6303E99CB', 'A3AF9DA2C856A5CAA5E87D98DD4F01', '2025-03-16', 'completed', NULL, NULL, 47500.00, 0.00, 'fixed', 3000.00, 0.00, 44500.00, 44500.00, 0.00, 'completed', '2025-04-06 09:32:11', '2025-04-06 09:32:11'),
(34, 19, 45, 'FEF600F61F68D8D1', '26575D54A1C7A035EBCB0988F2144D', '2025-03-28', 'completed', NULL, NULL, 38000.00, 0.00, 'fixed', 4000.00, 0.00, 34000.00, 34000.00, 0.00, 'completed', '2025-04-06 09:35:56', '2025-04-06 09:35:56');

-- --------------------------------------------------------

--
-- Table structure for table `sell_items`
--

CREATE TABLE `sell_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sell_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `quantity` decimal(10,2) DEFAULT NULL,
  `unit_cost_before_tax` decimal(10,2) DEFAULT NULL,
  `tax_amount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `net_cost` decimal(10,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sell_items`
--

INSERT INTO `sell_items` (`id`, `sell_id`, `product_id`, `quantity`, `unit_cost_before_tax`, `tax_amount`, `net_cost`, `created_at`, `updated_at`) VALUES
(4, 4, 11, 4.00, 8500.00, 0.00, 34000.00, '2025-01-19 16:26:36', '2025-01-19 16:26:36'),
(5, 5, 12, 4.00, 8500.00, 0.00, 34000.00, '2025-01-19 17:05:06', '2025-01-19 17:05:06'),
(7, 7, 12, 4.00, 8500.00, 0.00, 34000.00, '2025-01-19 17:20:43', '2025-01-19 17:20:43'),
(8, 8, 12, 4.00, 8500.00, 0.00, 34000.00, '2025-01-19 17:24:28', '2025-01-19 17:24:28'),
(9, 9, 12, 4.00, 8500.00, 0.00, 34000.00, '2025-01-19 17:26:58', '2025-01-19 17:26:58'),
(10, 10, 13, 4.00, 10000.00, 0.00, 40000.00, '2025-01-19 17:33:16', '2025-01-19 17:33:16'),
(11, 11, 12, 4.00, 8500.00, 0.00, 34000.00, '2025-01-19 17:35:44', '2025-01-19 17:35:44'),
(12, 12, 12, 4.00, 8500.00, 0.00, 34000.00, '2025-01-19 17:41:33', '2025-01-19 17:41:33'),
(13, 13, 12, 4.00, 8500.00, 0.00, 34000.00, '2025-01-19 17:46:46', '2025-01-19 17:46:46'),
(14, 14, 16, 5.00, 18000.00, 0.00, 90000.00, '2025-01-19 18:10:49', '2025-01-19 18:10:49'),
(15, 15, 15, 4.00, 18000.00, 0.00, 72000.00, '2025-01-19 18:15:59', '2025-01-19 18:15:59'),
(17, 17, 14, 5.00, 18000.00, 0.00, 90000.00, '2025-01-19 18:24:45', '2025-01-19 18:24:45'),
(18, 18, 37, 5.00, 18000.00, 0.00, 90000.00, '2025-04-06 06:50:25', '2025-04-06 06:50:25'),
(19, 19, 23, 5.00, 18000.00, 0.00, 90000.00, '2025-04-06 07:15:27', '2025-04-06 07:15:27'),
(20, 20, 33, 5.00, 18000.00, 0.00, 90000.00, '2025-04-06 07:28:45', '2025-04-06 07:28:45'),
(21, 21, 23, 4.00, 18500.00, 0.00, 74000.00, '2025-04-06 07:38:21', '2025-04-06 07:38:21'),
(22, 22, 34, 5.00, 18000.00, 0.00, 90000.00, '2025-04-06 07:43:44', '2025-04-06 07:43:44'),
(23, 23, 34, 5.00, 18000.00, 0.00, 90000.00, '2025-04-06 07:50:47', '2025-04-06 07:50:47'),
(24, 24, 34, 5.00, 18000.00, 0.00, 90000.00, '2025-04-06 07:55:56', '2025-04-06 07:55:56'),
(25, 25, 37, 5.00, 18000.00, 0.00, 90000.00, '2025-04-06 08:07:19', '2025-04-06 08:07:19'),
(26, 26, 37, 5.00, 18000.00, 0.00, 90000.00, '2025-04-06 08:11:20', '2025-04-06 08:11:20'),
(27, 27, 37, 5.00, 18000.00, 0.00, 90000.00, '2025-04-06 08:15:17', '2025-04-06 08:15:17'),
(28, 28, 38, 5.00, 18000.00, 0.00, 90000.00, '2025-04-06 08:20:17', '2025-04-06 08:20:17'),
(29, 29, 38, 5.00, 18000.00, 0.00, 90000.00, '2025-04-06 08:23:52', '2025-04-06 08:23:52'),
(30, 30, 33, 5.00, 18000.00, 0.00, 90000.00, '2025-04-06 08:26:41', '2025-04-06 08:26:41'),
(31, 31, 62, 4.00, 9000.00, 0.00, 36000.00, '2025-04-06 09:24:04', '2025-04-06 09:24:04'),
(32, 32, 62, 2.00, 9000.00, 0.00, 18000.00, '2025-04-06 09:28:34', '2025-04-06 09:28:34'),
(33, 33, 50, 5.00, 9500.00, 0.00, 47500.00, '2025-04-06 09:32:11', '2025-04-06 09:32:11'),
(34, 34, 50, 4.00, 9500.00, 0.00, 38000.00, '2025-04-06 09:35:56', '2025-04-06 09:35:56');

-- --------------------------------------------------------

--
-- Table structure for table `sell_payments`
--

CREATE TABLE `sell_payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sell_id` bigint(20) UNSIGNED NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `paid_on` varchar(255) NOT NULL,
  `payment_method` varchar(255) NOT NULL,
  `payment_account` varchar(255) DEFAULT NULL,
  `payment_status` varchar(255) NOT NULL DEFAULT 'completed',
  `transaction_reference` varchar(255) DEFAULT NULL,
  `payment_note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sell_payments`
--

INSERT INTO `sell_payments` (`id`, `sell_id`, `amount`, `paid_on`, `payment_method`, `payment_account`, `payment_status`, `transaction_reference`, `payment_note`, `created_at`, `updated_at`) VALUES
(7, 4, 11700.00, '2025-01-19 16:26:36', 'cash', NULL, 'completed', NULL, NULL, '2025-01-19 16:26:36', '2025-01-19 16:26:36'),
(8, 4, 3000.00, '2024-12-18T14:27', 'cash', NULL, 'completed', NULL, NULL, '2025-01-19 16:27:40', '2025-01-19 16:27:40'),
(9, 5, 15017.00, '2025-01-19 17:05:06', 'cash', NULL, 'completed', NULL, NULL, '2025-01-19 17:05:06', '2025-01-19 17:05:06'),
(10, 5, 13983.00, '2024-12-29T16:06', 'cash', NULL, 'completed', NULL, NULL, '2025-01-19 17:06:47', '2025-01-19 17:06:47'),
(13, 7, 14500.00, '2025-01-19 17:20:43', 'cash', NULL, 'completed', NULL, NULL, '2025-01-19 17:20:43', '2025-01-19 17:20:43'),
(14, 8, 12607.00, '2025-01-19 17:24:28', 'cash', NULL, 'completed', NULL, NULL, '2025-01-19 17:24:28', '2025-01-19 17:24:28'),
(15, 9, 13500.00, '2025-01-19 17:26:58', 'cash', NULL, 'completed', NULL, NULL, '2025-01-19 17:26:58', '2025-01-19 17:26:58'),
(16, 10, 14140.00, '2025-01-19 17:33:16', 'cash', NULL, 'completed', NULL, NULL, '2025-01-19 17:33:16', '2025-01-19 17:33:16'),
(17, 11, 14013.00, '2025-01-19 17:35:44', 'cash', NULL, 'completed', NULL, NULL, '2025-01-19 17:35:44', '2025-01-19 17:35:44'),
(18, 11, 14987.00, '2025-01-05T15:36', 'cash', NULL, 'completed', NULL, NULL, '2025-01-19 17:36:47', '2025-01-19 17:36:47'),
(19, 12, 12609.00, '2025-01-19 17:41:33', 'cash', NULL, 'completed', NULL, NULL, '2025-01-19 17:41:33', '2025-01-19 17:41:33'),
(20, 12, 15891.00, '2025-01-06T14:41', 'cash', NULL, 'completed', NULL, NULL, '2025-01-19 17:43:06', '2025-01-19 17:43:06'),
(21, 13, 12348.00, '2025-01-19 17:46:46', 'cash', NULL, 'completed', NULL, NULL, '2025-01-19 17:46:46', '2025-01-19 17:46:46'),
(22, 14, 38000.00, '2025-01-19 18:10:49', 'cash', NULL, 'completed', NULL, NULL, '2025-01-19 18:10:49', '2025-01-19 18:10:49'),
(23, 14, 37500.00, '2025-01-11T15:11', 'cash', NULL, 'completed', NULL, '500 tk less', '2025-01-19 18:11:43', '2025-01-19 18:11:43'),
(24, 15, 30400.00, '2025-01-19 18:15:59', 'cash', NULL, 'completed', NULL, NULL, '2025-01-19 18:15:59', '2025-01-19 18:15:59'),
(26, 17, 38000.00, '2025-01-19 18:24:45', 'cash', '38000', 'completed', NULL, NULL, '2025-01-19 18:24:45', '2025-01-19 18:24:45'),
(27, 18, 30000.00, '2025-04-06 06:50:25', 'cash', NULL, 'completed', NULL, NULL, '2025-04-06 06:50:25', '2025-04-06 06:50:25'),
(28, 19, 30000.00, '2025-04-06 07:15:27', 'cash', NULL, 'completed', NULL, NULL, '2025-04-06 07:15:27', '2025-04-06 07:15:27'),
(29, 19, 5000.00, '2025-03-15T13:16', 'cash', NULL, 'completed', NULL, NULL, '2025-04-06 07:17:05', '2025-04-06 07:17:05'),
(30, 20, 40000.00, '2025-04-06 07:28:45', 'cash', NULL, 'completed', NULL, NULL, '2025-04-06 07:28:45', '2025-04-06 07:28:45'),
(31, 20, 8000.00, '2025-03-15T13:29', 'cash', NULL, 'completed', NULL, NULL, '2025-04-06 07:29:22', '2025-04-06 07:29:22'),
(32, 21, 20000.00, '2025-04-06 07:38:21', 'cash', NULL, 'completed', NULL, NULL, '2025-04-06 07:38:21', '2025-04-06 07:38:21'),
(33, 21, 4000.00, '2025-03-15T13:38', 'cash', NULL, 'completed', NULL, NULL, '2025-04-06 07:38:52', '2025-04-06 07:38:52'),
(34, 21, 4000.00, '2025-03-28T13:38', 'cash', NULL, 'completed', NULL, NULL, '2025-04-06 07:39:09', '2025-04-06 07:39:09'),
(35, 22, 37500.00, '2025-04-06 07:43:44', 'cash', NULL, 'completed', NULL, NULL, '2025-04-06 07:43:44', '2025-04-06 07:43:44'),
(36, 22, 37500.00, '2025-03-28T13:44', 'cash', NULL, 'completed', NULL, NULL, '2025-04-06 07:44:19', '2025-04-06 07:44:19'),
(37, 23, 75000.00, '2025-04-06 07:50:47', 'cash', NULL, 'completed', NULL, NULL, '2025-04-06 07:50:47', '2025-04-06 07:50:47'),
(38, 24, 45000.00, '2025-04-06 07:55:56', 'cash', NULL, 'completed', NULL, NULL, '2025-04-06 07:55:56', '2025-04-06 07:55:56'),
(39, 25, 40000.00, '2025-04-06 08:07:19', 'cash', NULL, 'completed', NULL, NULL, '2025-04-06 08:07:19', '2025-04-06 08:07:19'),
(40, 26, 39500.00, '2025-04-06 08:11:20', 'cash', NULL, 'completed', NULL, NULL, '2025-04-06 08:11:20', '2025-04-06 08:11:20'),
(41, 27, 37000.00, '2025-04-06 08:15:17', 'cash', NULL, 'completed', NULL, NULL, '2025-04-06 08:15:17', '2025-04-06 08:15:17'),
(42, 27, 10000.00, '2025-03-23T14:15', 'cash', NULL, 'completed', NULL, NULL, '2025-04-06 08:16:05', '2025-04-06 08:16:05'),
(43, 28, 38500.00, '2025-04-06 08:20:17', 'cash', NULL, 'completed', NULL, NULL, '2025-04-06 08:20:17', '2025-04-06 08:20:17'),
(44, 29, 35000.00, '2025-04-06 08:23:52', 'cash', NULL, 'completed', NULL, NULL, '2025-04-06 08:23:52', '2025-04-06 08:23:52'),
(45, 30, 47000.00, '2025-04-06 08:26:41', 'cash', NULL, 'completed', NULL, NULL, '2025-04-06 08:26:41', '2025-04-06 08:26:41'),
(46, 31, 12600.00, '2025-04-06 09:24:04', 'cash', NULL, 'completed', NULL, NULL, '2025-04-06 09:24:04', '2025-04-06 09:24:04'),
(47, 31, 10000.00, '2025-03-14T15:24', 'cash', NULL, 'completed', NULL, NULL, '2025-04-06 09:24:37', '2025-04-06 09:24:37'),
(48, 32, 13000.00, '2025-04-06 09:28:34', 'cash', NULL, 'completed', NULL, NULL, '2025-04-06 09:28:34', '2025-04-06 09:28:34'),
(49, 33, 44500.00, '2025-04-06 09:32:11', 'cash', NULL, 'completed', NULL, NULL, '2025-04-06 09:32:11', '2025-04-06 09:32:11'),
(50, 34, 34000.00, '2025-04-06 09:35:56', 'cash', NULL, 'completed', NULL, NULL, '2025-04-06 09:35:56', '2025-04-06 09:35:56');

-- --------------------------------------------------------

--
-- Table structure for table `sell_returns`
--

CREATE TABLE `sell_returns` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sell_id` bigint(20) UNSIGNED NOT NULL,
  `return_date` date NOT NULL,
  `reason` varchar(255) DEFAULT NULL,
  `total_return_amount` decimal(10,2) NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'processed',
  `notes` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sell_return_items`
--

CREATE TABLE `sell_return_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sell_return_id` bigint(20) UNSIGNED NOT NULL,
  `sell_item_id` bigint(20) UNSIGNED NOT NULL,
  `quantity` decimal(10,2) NOT NULL,
  `unit_cost` decimal(10,2) NOT NULL,
  `total_return_amount` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sell_shipping_details`
--

CREATE TABLE `sell_shipping_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sell_id` bigint(20) UNSIGNED NOT NULL,
  `shipping_address` varchar(255) NOT NULL,
  `shipping_method` varchar(255) DEFAULT NULL,
  `shipping_cost` decimal(10,2) NOT NULL DEFAULT 0.00,
  `expected_delivery_date` date DEFAULT NULL,
  `tracking_number` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('0emzusVaXgFlq1KXIgPdo1U1v9j0i90h2TJoaZhC', NULL, '27.147.169.192', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQXhCTkhmVHhtMDBTeVZwcVVXNXE2bnhoYzhJdnMyWFZzWFFOdDhGRCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHBzOi8vc29mdC5zbXN1bmxpZ2h0LmNvbSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1744214675),
('9tMsMDQysnnCLTN2r5hbdRCoWfTaaxAOJmeKmgbt', 1, '27.147.169.192', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiQk02NDdFTmRabnU2cWl5WG1ad3VIcmhMMHRmT3ZnQmZFeFJLTHFFNyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDM6Imh0dHBzOi8vc29mdC5zbXN1bmxpZ2h0LmNvbS9hZG1pbi9jdXN0b21lcnMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToxO30=', 1744187539);

-- --------------------------------------------------------

--
-- Table structure for table `shipping_details`
--

CREATE TABLE `shipping_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `purchase_id` bigint(20) UNSIGNED NOT NULL,
  `shipping_address` varchar(255) NOT NULL,
  `shipping_method` varchar(255) DEFAULT NULL,
  `shipping_cost` decimal(10,2) NOT NULL DEFAULT 0.00,
  `expected_delivery_date` date DEFAULT NULL,
  `tracking_number` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shipping_details`
--

INSERT INTO `shipping_details` (`id`, `purchase_id`, `shipping_address`, `shipping_method`, `shipping_cost`, `expected_delivery_date`, `tracking_number`, `created_at`, `updated_at`) VALUES
(2, 10, 'gnn', 'gngn gh', 0.00, '2025-04-06', NULL, '2025-04-06 06:42:42', '2025-04-06 06:42:42'),
(3, 11, 'sdeer', 'efcercf', 0.00, '2025-04-06', NULL, '2025-04-06 06:57:32', '2025-04-06 06:57:32'),
(4, 12, 'dcdsc', 'cdvdfvsf', 0.00, '2025-01-06', NULL, '2025-04-06 07:01:44', '2025-04-06 07:01:44'),
(5, 13, 'asdcasdc', 'asdada', 0.00, '2025-01-01', NULL, '2025-04-06 07:03:30', '2025-04-06 07:03:30'),
(6, 15, 'sdcdf', 'sdfdf', 0.00, '2025-01-01', NULL, '2025-04-06 07:04:36', '2025-04-06 07:04:36'),
(7, 16, 'sdfefre', 'asefaefae', 0.00, '2025-01-01', NULL, '2025-04-06 07:06:29', '2025-04-06 07:06:29'),
(8, 17, 'awefdawefa', 'asefwefer', 0.00, '2025-01-01', NULL, '2025-04-06 07:07:29', '2025-04-06 07:07:29'),
(9, 18, 'weeqerr', 'wererq4', 0.00, '2025-04-06', NULL, '2025-04-06 09:11:57', '2025-04-06 09:11:57'),
(10, 19, 'trddttftyvg', 'jnhjknjoju9ijui', 0.00, '2025-04-06', NULL, '2025-04-06 09:17:52', '2025-04-06 09:17:52'),
(11, 20, 'thdtjdy', 'yjyjfujfu', 0.00, '2025-04-06', NULL, '2025-04-06 09:41:23', '2025-04-06 09:41:23'),
(12, 21, 'dfrferer', 'sdrfsdrgsdrg', 0.00, '2025-04-06', NULL, '2025-04-06 09:43:25', '2025-04-06 09:43:25'),
(13, 22, 'sertgrdtdtrh', 'rytrhdtjyj', 0.00, '2025-04-06', NULL, '2025-04-06 09:44:51', '2025-04-06 09:44:51'),
(14, 23, 'kjjkkjkjk', 'kjkjknjkhj', 0.00, '2025-04-06', NULL, '2025-04-06 09:47:24', '2025-04-06 09:47:24'),
(15, 24, 'kjjjk', 'okjkjknj', 0.00, '2025-04-06', NULL, '2025-04-06 09:48:10', '2025-04-06 09:48:10'),
(16, 25, 'knjkjjjn', 'jknjknjknjk', 0.00, '2025-04-06', NULL, '2025-04-06 09:48:53', '2025-04-06 09:48:53'),
(17, 26, 'ygghcfgcfg', 'jhbhjknjknj', 0.00, '2025-04-06', NULL, '2025-04-06 09:50:50', '2025-04-06 09:50:50'),
(18, 27, 'dgsergser', 'sfsrfser', 0.00, '2025-04-06', NULL, '2025-04-06 09:57:49', '2025-04-06 09:57:49'),
(19, 28, 'sgsrgs', 'sergsrgs', 0.00, '2025-04-06', NULL, '2025-04-06 09:58:39', '2025-04-06 09:58:39'),
(20, 29, 'zdfgvsdrfvsd', 'fdfvxfbfg', 0.00, '2025-04-06', NULL, '2025-04-06 09:59:30', '2025-04-06 09:59:30'),
(21, 30, 'dfgtg', 'dfgtgtr', 0.00, '2025-04-06', NULL, '2025-04-06 10:00:15', '2025-04-06 10:00:15');

-- --------------------------------------------------------

--
-- Table structure for table `site_settings`
--

CREATE TABLE `site_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `site_name` varchar(255) NOT NULL,
  `site_title` varchar(255) DEFAULT NULL,
  `site_description` varchar(255) DEFAULT NULL,
  `site_phone` varchar(255) DEFAULT NULL,
  `site_email` varchar(255) DEFAULT NULL,
  `site_address` varchar(255) DEFAULT NULL,
  `site_map` varchar(255) DEFAULT NULL,
  `facebook` varchar(255) DEFAULT NULL,
  `youtube` varchar(255) DEFAULT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `favicon` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `stock_managers`
--

CREATE TABLE `stock_managers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `stock_transfers`
--

CREATE TABLE `stock_transfers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `date` varchar(255) NOT NULL,
  `reference_no` varchar(255) NOT NULL,
  `from_store` varchar(255) NOT NULL,
  `to_store` varchar(255) NOT NULL,
  `shipping_charge` varchar(255) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `total_qty` varchar(255) NOT NULL,
  `created_by` bigint(20) UNSIGNED NOT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `stores`
--

CREATE TABLE `stores` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `created_by` bigint(20) UNSIGNED NOT NULL,
  `updated_by` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `stores`
--

INSERT INTO `stores` (`id`, `name`, `address`, `status`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(12, 'SM Sunlight Group', 'Head Office', 1, 1, 1, NULL, NULL),
(13, 'সানলাইট ব্যাটারি হাউজ', 'বরুণকান্দি মোড়, বদলগাছি রোড, নওগাঁ ।', 1, 1, 1, NULL, '2024-12-24 09:38:50'),
(14, 'মায়ের দোয়া ব্যাটারি & IPS', 'আশিক প্লাজা, গোস্তহাটির মোড়, নওগাঁ।', 1, 1, 1, NULL, NULL),
(15, 'সানলাইট ব্যাটারি & IPS', 'মেইন রোড, দেলুয়াবাড়ি বাজার, মান্দা, নওগাঁ ।', 1, 1, 1, NULL, NULL),
(16, 'রংধনু ব্যাটারি হাউজ', 'আত্রাই রোড, রেল-স্টেশনের পাশে, রানীনগর, নওগাঁ ।', 1, 1, 1, NULL, NULL),
(17, 'সানলাইট ব্যাটারি হাউজ-2', 'Badalgachi, Naogaon', 1, 1, 1, NULL, NULL),
(18, 'সানলাইট ব্যাটারি হাউজ-3', 'Vobanigang, Baghmara, Rajshahi', 1, 1, 1, NULL, NULL),
(19, 'সানলাইট ব্যাটারি হাউজ-4', 'সোহাগ ফিলিং স্টেশনের বিপরীত পাশে, নতুন শাহাপুর, নওগাঁ।\r\n', 1, 1, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `role` enum('admin','manager') NOT NULL DEFAULT 'manager',
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `is_subscribed` tinyint(1) NOT NULL DEFAULT 0,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `phone`, `password`, `photo`, `address`, `email_verified_at`, `role`, `status`, `is_subscribed`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'admin@gmail.com', NULL, '$2y$12$cCeek.6jngGFM.fiDVVy5ez2JDTNpyqH1qMnSR94Fwk0yJRG7nbgW', NULL, NULL, '2024-12-24 03:34:55', 'admin', 1, 0, 'A3RIGMSra9Zg7mF0b2BG5jSIXCLMaJRna2INLs506cYm3X4aHZq8JUCxjx3P', '2024-12-24 03:34:55', '2024-12-24 03:34:55'),
(2, 'Manager', 'manager@gmail.com', NULL, '$2y$12$L1mEoFunuuqr7slhvJNS.eP1A7YSBZDGvLBVuml08CumARKebZzNe', NULL, NULL, '2024-12-24 03:34:55', 'manager', 1, 0, 'uZxdBrVwgz', '2024-12-24 03:34:55', '2024-12-24 03:34:55'),
(6, 'Md. Zahidur Rahman Sumon', 'zahedurrahman65086@gmail.com', '01780137981', '$2y$12$/a5oE6fEAEz45sGQJeWiKeogvpvUgqUqxMhm9mHhRtRRXS8Q1uoiC', 'upload/user/1819337100293991.png', 'Naogaon', NULL, 'manager', 1, 0, NULL, '2024-12-24 09:44:25', '2024-12-24 09:44:25'),
(7, 'Sunlight Battery House-2', 'mdnaimislam939@gmail.com', '01332844904', '$2y$12$kPSA5bZMd8N4gd8BiYfiieMO71bvIL4MRqHkByjDYJX2El/UDoT1m', 'upload/user/1828649579903301.png', 'Bodolgachi', NULL, 'manager', 1, 0, NULL, '2025-01-18 12:17:42', '2025-04-06 10:43:23'),
(8, 'Md. Rashedul Islam', 'rashedulislamripon5141@gmail.com', '01332844913', '$2y$12$OlaxmJcWjA3GWruQwEFRwuBFZ/hcBW7rQoGNbsPVaAo6reaErko8W', 'upload/user/1828650476688509.png', 'Notun Shahapur', NULL, 'manager', 1, 0, NULL, '2025-04-06 04:45:14', '2025-04-06 10:56:33'),
(9, 'Mayer Doa Battery & IPS', 'annurima746@gmail.com', '01332844902', '$2y$12$q4jq3jIG/3/QwBcPbVKeTua0ujfXMDZxE0lGizOQA7Vjv.uAgLIvq', 'upload/user/1828649842207953.png', 'Gustohati', NULL, 'manager', 1, 0, NULL, '2025-04-06 10:46:28', '2025-04-06 10:46:28'),
(10, 'Sunlight Battery House', 'mdrostumrana1234@gmail.com', '01332844910', '$2y$12$RhH7l5qMrMK8fIvQP77KCOADpHnY.21b0.l22fCRwyNaZNFQlxFZO', 'upload/user/1828650009924492.png', 'Borunkandi', NULL, 'manager', 1, 0, NULL, '2025-04-06 10:49:08', '2025-04-06 10:49:08');

-- --------------------------------------------------------

--
-- Table structure for table `user_stores`
--

CREATE TABLE `user_stores` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `store_id` bigint(20) UNSIGNED NOT NULL,
  `role` varchar(255) NOT NULL DEFAULT 'staff',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_stores`
--

INSERT INTO `user_stores` (`id`, `user_id`, `store_id`, `role`, `created_at`, `updated_at`) VALUES
(1, 6, 15, 'staff', '2024-12-24 09:44:42', '2024-12-24 09:44:46'),
(2, 7, 17, 'staff', '2025-01-18 12:17:55', '2025-01-18 12:18:37'),
(3, 8, 19, 'staff', '2025-04-06 04:45:31', '2025-04-06 10:10:21'),
(4, 9, 14, 'staff', '2025-04-06 10:50:50', '2025-04-06 10:50:53'),
(5, 10, 13, 'staff', '2025-04-06 10:51:01', '2025-04-06 10:51:01');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `blog_categories`
--
ALTER TABLE `blog_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `business_locations`
--
ALTER TABLE `business_locations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `business_locations_store_id_unique` (`store_id`),
  ADD KEY `business_locations_created_by_foreign` (`created_by`),
  ADD KEY `business_locations_updated_by_foreign` (`updated_by`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `contacts_created_by_foreign` (`created_by`),
  ADD KEY `contacts_updated_by_foreign` (`updated_by`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer_payments`
--
ALTER TABLE `customer_payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customer_payments_customer_id_foreign` (`customer_id`),
  ADD KEY `customer_payments_payment_account_id_foreign` (`payment_account_id`),
  ADD KEY `customer_payments_created_by_foreign` (`created_by`);

--
-- Indexes for table `expenses`
--
ALTER TABLE `expenses`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `expenses_reference_no_unique` (`reference_no`),
  ADD KEY `expenses_store_id_foreign` (`store_id`),
  ADD KEY `expenses_expense_category_id_foreign` (`expense_category_id`);

--
-- Indexes for table `expense_category`
--
ALTER TABLE `expense_category`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `expense_category_code_unique` (`code`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `invoices`
--
ALTER TABLE `invoices`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `invoice_products`
--
ALTER TABLE `invoice_products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ledgers`
--
ALTER TABLE `ledgers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `payment_accounts`
--
ALTER TABLE `payment_accounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_unique` (`name`);

--
-- Indexes for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `permission_role_role_id_foreign` (`role_id`);

--
-- Indexes for table `permission_user`
--
ALTER TABLE `permission_user`
  ADD PRIMARY KEY (`user_id`,`permission_id`,`user_type`),
  ADD KEY `permission_user_permission_id_foreign` (`permission_id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `plans`
--
ALTER TABLE `plans`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `plans_slug_unique` (`slug`),
  ADD UNIQUE KEY `plans_stripe_id_unique` (`stripe_id`);

--
-- Indexes for table `pos`
--
ALTER TABLE `pos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pos_contact_id_foreign` (`contact_id`),
  ADD KEY `pos_created_by_foreign` (`created_by`),
  ADD KEY `pos_updated_by_foreign` (`updated_by`);

--
-- Indexes for table `pos_products`
--
ALTER TABLE `pos_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pos_products_pos_id_foreign` (`pos_id`),
  ADD KEY `pos_products_product_id_foreign` (`product_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `products_slug_unique` (`slug`),
  ADD UNIQUE KEY `products_sku_unique` (`sku`),
  ADD KEY `products_user_id_foreign` (`user_id`),
  ADD KEY `products_store_id_foreign` (`store_id`),
  ADD KEY `products_category_id_foreign` (`category_id`),
  ADD KEY `products_created_by_foreign` (`created_by`),
  ADD KEY `products_updated_by_foreign` (`updated_by`);

--
-- Indexes for table `product_categories`
--
ALTER TABLE `product_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_transfers`
--
ALTER TABLE `product_transfers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_transfers_from_store_id_foreign` (`from_store_id`),
  ADD KEY `product_transfers_to_store_id_foreign` (`to_store_id`),
  ADD KEY `product_transfers_store_product_id_foreign` (`store_product_id`);

--
-- Indexes for table `purchases`
--
ALTER TABLE `purchases`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `purchases_reference_no_unique` (`reference_no`),
  ADD KEY `purchases_store_id_foreign` (`store_id`),
  ADD KEY `purchases_supplier_id_foreign` (`supplier_id`),
  ADD KEY `purchases_customer_id_foreign` (`customer_id`);

--
-- Indexes for table `purchase_items`
--
ALTER TABLE `purchase_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `purchase_items_purchase_id_foreign` (`purchase_id`),
  ADD KEY `purchase_items_product_id_foreign` (`product_id`);

--
-- Indexes for table `purchase_payments`
--
ALTER TABLE `purchase_payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `purchase_payments_purchase_id_foreign` (`purchase_id`);

--
-- Indexes for table `purchase_returns`
--
ALTER TABLE `purchase_returns`
  ADD PRIMARY KEY (`id`),
  ADD KEY `purchase_returns_purchase_id_foreign` (`purchase_id`);

--
-- Indexes for table `purchase_return_items`
--
ALTER TABLE `purchase_return_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `purchase_return_items_purchase_return_id_foreign` (`purchase_return_id`),
  ADD KEY `purchase_return_items_purchase_item_id_foreign` (`purchase_item_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_unique` (`name`);

--
-- Indexes for table `role_user`
--
ALTER TABLE `role_user`
  ADD PRIMARY KEY (`user_id`,`role_id`,`user_type`),
  ADD KEY `role_user_role_id_foreign` (`role_id`);

--
-- Indexes for table `sells`
--
ALTER TABLE `sells`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `sells_reference_no_unique` (`reference_no`),
  ADD UNIQUE KEY `sells_invoice_no_unique` (`invoice_no`),
  ADD KEY `sells_store_id_foreign` (`store_id`),
  ADD KEY `sells_customer_id_foreign` (`customer_id`);

--
-- Indexes for table `sell_items`
--
ALTER TABLE `sell_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sell_items_sell_id_foreign` (`sell_id`),
  ADD KEY `sell_items_product_id_foreign` (`product_id`);

--
-- Indexes for table `sell_payments`
--
ALTER TABLE `sell_payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sell_payments_sell_id_foreign` (`sell_id`);

--
-- Indexes for table `sell_returns`
--
ALTER TABLE `sell_returns`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sell_returns_sell_id_foreign` (`sell_id`);

--
-- Indexes for table `sell_return_items`
--
ALTER TABLE `sell_return_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sell_return_items_sell_return_id_foreign` (`sell_return_id`),
  ADD KEY `sell_return_items_sell_item_id_foreign` (`sell_item_id`);

--
-- Indexes for table `sell_shipping_details`
--
ALTER TABLE `sell_shipping_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sell_shipping_details_sell_id_foreign` (`sell_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `shipping_details`
--
ALTER TABLE `shipping_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `shipping_details_purchase_id_foreign` (`purchase_id`);

--
-- Indexes for table `site_settings`
--
ALTER TABLE `site_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stock_managers`
--
ALTER TABLE `stock_managers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stock_transfers`
--
ALTER TABLE `stock_transfers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `stock_transfers_product_id_foreign` (`product_id`),
  ADD KEY `stock_transfers_created_by_foreign` (`created_by`),
  ADD KEY `stock_transfers_updated_by_foreign` (`updated_by`);

--
-- Indexes for table `stores`
--
ALTER TABLE `stores`
  ADD PRIMARY KEY (`id`),
  ADD KEY `stores_created_by_foreign` (`created_by`),
  ADD KEY `stores_updated_by_foreign` (`updated_by`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_phone_unique` (`phone`);

--
-- Indexes for table `user_stores`
--
ALTER TABLE `user_stores`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_stores_user_id_foreign` (`user_id`),
  ADD KEY `user_stores_store_id_foreign` (`store_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `blog_categories`
--
ALTER TABLE `blog_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `business_locations`
--
ALTER TABLE `business_locations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `customer_payments`
--
ALTER TABLE `customer_payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `expenses`
--
ALTER TABLE `expenses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `expense_category`
--
ALTER TABLE `expense_category`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `invoices`
--
ALTER TABLE `invoices`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `invoice_products`
--
ALTER TABLE `invoice_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ledgers`
--
ALTER TABLE `ledgers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `payment_accounts`
--
ALTER TABLE `payment_accounts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `plans`
--
ALTER TABLE `plans`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pos`
--
ALTER TABLE `pos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pos_products`
--
ALTER TABLE `pos_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;

--
-- AUTO_INCREMENT for table `product_categories`
--
ALTER TABLE `product_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `product_transfers`
--
ALTER TABLE `product_transfers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `purchases`
--
ALTER TABLE `purchases`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `purchase_items`
--
ALTER TABLE `purchase_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `purchase_payments`
--
ALTER TABLE `purchase_payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `purchase_returns`
--
ALTER TABLE `purchase_returns`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `purchase_return_items`
--
ALTER TABLE `purchase_return_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `sells`
--
ALTER TABLE `sells`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `sell_items`
--
ALTER TABLE `sell_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `sell_payments`
--
ALTER TABLE `sell_payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `sell_returns`
--
ALTER TABLE `sell_returns`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sell_return_items`
--
ALTER TABLE `sell_return_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sell_shipping_details`
--
ALTER TABLE `sell_shipping_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `shipping_details`
--
ALTER TABLE `shipping_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `site_settings`
--
ALTER TABLE `site_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `stock_managers`
--
ALTER TABLE `stock_managers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `stock_transfers`
--
ALTER TABLE `stock_transfers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `stores`
--
ALTER TABLE `stores`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `user_stores`
--
ALTER TABLE `user_stores`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `business_locations`
--
ALTER TABLE `business_locations`
  ADD CONSTRAINT `business_locations_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `business_locations_store_id_foreign` FOREIGN KEY (`store_id`) REFERENCES `stores` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `business_locations_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`);

--
-- Constraints for table `contacts`
--
ALTER TABLE `contacts`
  ADD CONSTRAINT `contacts_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `contacts_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`);

--
-- Constraints for table `customer_payments`
--
ALTER TABLE `customer_payments`
  ADD CONSTRAINT `customer_payments_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `customer_payments_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `contacts` (`id`),
  ADD CONSTRAINT `customer_payments_payment_account_id_foreign` FOREIGN KEY (`payment_account_id`) REFERENCES `payment_accounts` (`id`);

--
-- Constraints for table `expenses`
--
ALTER TABLE `expenses`
  ADD CONSTRAINT `expenses_expense_category_id_foreign` FOREIGN KEY (`expense_category_id`) REFERENCES `expense_category` (`id`),
  ADD CONSTRAINT `expenses_store_id_foreign` FOREIGN KEY (`store_id`) REFERENCES `stores` (`id`);

--
-- Constraints for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `permission_user`
--
ALTER TABLE `permission_user`
  ADD CONSTRAINT `permission_user_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `pos`
--
ALTER TABLE `pos`
  ADD CONSTRAINT `pos_contact_id_foreign` FOREIGN KEY (`contact_id`) REFERENCES `contacts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `pos_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `pos_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `pos_products`
--
ALTER TABLE `pos_products`
  ADD CONSTRAINT `pos_products_pos_id_foreign` FOREIGN KEY (`pos_id`) REFERENCES `pos` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `pos_products_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `product_categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `products_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `products_store_id_foreign` FOREIGN KEY (`store_id`) REFERENCES `stores` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `products_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `products_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_transfers`
--
ALTER TABLE `product_transfers`
  ADD CONSTRAINT `product_transfers_from_store_id_foreign` FOREIGN KEY (`from_store_id`) REFERENCES `stores` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_transfers_store_product_id_foreign` FOREIGN KEY (`store_product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_transfers_to_store_id_foreign` FOREIGN KEY (`to_store_id`) REFERENCES `stores` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `purchases`
--
ALTER TABLE `purchases`
  ADD CONSTRAINT `purchases_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `stores` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `purchases_store_id_foreign` FOREIGN KEY (`store_id`) REFERENCES `stores` (`id`),
  ADD CONSTRAINT `purchases_supplier_id_foreign` FOREIGN KEY (`supplier_id`) REFERENCES `contacts` (`id`);

--
-- Constraints for table `purchase_items`
--
ALTER TABLE `purchase_items`
  ADD CONSTRAINT `purchase_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `purchase_items_purchase_id_foreign` FOREIGN KEY (`purchase_id`) REFERENCES `purchases` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `purchase_payments`
--
ALTER TABLE `purchase_payments`
  ADD CONSTRAINT `purchase_payments_purchase_id_foreign` FOREIGN KEY (`purchase_id`) REFERENCES `purchases` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `purchase_returns`
--
ALTER TABLE `purchase_returns`
  ADD CONSTRAINT `purchase_returns_purchase_id_foreign` FOREIGN KEY (`purchase_id`) REFERENCES `purchases` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `purchase_return_items`
--
ALTER TABLE `purchase_return_items`
  ADD CONSTRAINT `purchase_return_items_purchase_item_id_foreign` FOREIGN KEY (`purchase_item_id`) REFERENCES `purchase_items` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `purchase_return_items_purchase_return_id_foreign` FOREIGN KEY (`purchase_return_id`) REFERENCES `purchase_returns` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_user`
--
ALTER TABLE `role_user`
  ADD CONSTRAINT `role_user_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sells`
--
ALTER TABLE `sells`
  ADD CONSTRAINT `sells_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `contacts` (`id`),
  ADD CONSTRAINT `sells_store_id_foreign` FOREIGN KEY (`store_id`) REFERENCES `stores` (`id`);

--
-- Constraints for table `sell_items`
--
ALTER TABLE `sell_items`
  ADD CONSTRAINT `sell_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `sell_items_sell_id_foreign` FOREIGN KEY (`sell_id`) REFERENCES `sells` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sell_payments`
--
ALTER TABLE `sell_payments`
  ADD CONSTRAINT `sell_payments_sell_id_foreign` FOREIGN KEY (`sell_id`) REFERENCES `sells` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sell_returns`
--
ALTER TABLE `sell_returns`
  ADD CONSTRAINT `sell_returns_sell_id_foreign` FOREIGN KEY (`sell_id`) REFERENCES `sells` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sell_return_items`
--
ALTER TABLE `sell_return_items`
  ADD CONSTRAINT `sell_return_items_sell_item_id_foreign` FOREIGN KEY (`sell_item_id`) REFERENCES `sell_items` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `sell_return_items_sell_return_id_foreign` FOREIGN KEY (`sell_return_id`) REFERENCES `sell_returns` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sell_shipping_details`
--
ALTER TABLE `sell_shipping_details`
  ADD CONSTRAINT `sell_shipping_details_sell_id_foreign` FOREIGN KEY (`sell_id`) REFERENCES `sells` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `shipping_details`
--
ALTER TABLE `shipping_details`
  ADD CONSTRAINT `shipping_details_purchase_id_foreign` FOREIGN KEY (`purchase_id`) REFERENCES `purchases` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `stock_transfers`
--
ALTER TABLE `stock_transfers`
  ADD CONSTRAINT `stock_transfers_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `stock_transfers_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `stock_transfers_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`);

--
-- Constraints for table `stores`
--
ALTER TABLE `stores`
  ADD CONSTRAINT `stores_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `stores_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`);

--
-- Constraints for table `user_stores`
--
ALTER TABLE `user_stores`
  ADD CONSTRAINT `user_stores_store_id_foreign` FOREIGN KEY (`store_id`) REFERENCES `stores` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_stores_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

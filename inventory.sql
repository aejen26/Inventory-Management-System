-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 13, 2025 at 10:34 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `inventory`
--

-- --------------------------------------------------------

--
-- Table structure for table `audit_log`
--

CREATE TABLE `audit_log` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `action` varchar(80) NOT NULL,
  `entity` varchar(80) NOT NULL,
  `entity_id` int(11) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `old_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`old_data`)),
  `new_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`new_data`)),
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `audit_log`
--

INSERT INTO `audit_log` (`id`, `user_id`, `action`, `entity`, `entity_id`, `description`, `old_data`, `new_data`, `created_at`) VALUES
(1, 1, 'create', 'suppliers', 1, 'Supplier created', NULL, '{\"name\":\"Ajara Marketing\",\"contact\":\"Jojo Basbano\",\"phone\":\"09394127891\",\"email\":\"ajaramarketing@yahoo.com\",\"address\":\"Iloilo City\"}', '2025-10-30 17:02:19'),
(2, 1, 'create', 'suppliers', 2, 'Supplier created', NULL, '{\"name\":\"Ajara Marketing\",\"contact\":\"Jojo Basbano\",\"phone\":\"09394127891\",\"email\":\"ajaramarketing@yahoo.com\",\"address\":\"\"}', '2025-10-30 17:02:27'),
(3, 1, 'create', 'suppliers', 3, 'Supplier created', NULL, '{\"name\":\"Ajara Marketing\",\"contact\":\"Jojo Basbano\",\"phone\":\"09394127891\",\"email\":\"ajaramarketing@yahoo.com\",\"address\":\"\"}', '2025-10-30 17:02:49'),
(4, 1, 'delete', 'suppliers', 3, 'Supplier deleted', NULL, NULL, '2025-10-30 17:02:52'),
(5, 1, 'delete', 'suppliers', 3, 'Supplier deleted', NULL, NULL, '2025-10-30 17:03:07'),
(6, 1, 'delete', 'suppliers', 2, 'Supplier deleted', NULL, NULL, '2025-10-30 17:03:10'),
(7, 1, 'create', 'suppliers', 4, 'Supplier created', NULL, '{\"name\":\"Alot Rice Center\",\"contact\":\"John Pillena\",\"phone\":\"099686553160\",\"email\":\"Atcenter@gmail.com\",\"address\":\"\"}', '2025-10-30 17:04:30'),
(8, 1, 'create', 'categories', 1, 'Category created', NULL, '{\"name\":\"Rice Retail\",\"description\":\"\"}', '2025-10-30 17:06:00'),
(9, 1, 'create', 'products', 1, 'Product created', NULL, '{\"code\":\"P0001\",\"name\":\"Hasmin Blue\",\"category\":\"\",\"category_id\":1,\"supplier_id\":4,\"location_id\":1,\"cost_price\":30,\"sell_price\":45,\"barcode\":\"\",\"low_stock_threshold\":5,\"sold_by\":\"each\",\"unit\":\"pc\"}', '2025-10-30 17:07:36'),
(10, NULL, '', '', NULL, 'Stock adjusted (1 items)', NULL, '{\"meta\":{\"type\":\"stock_adjust\"},\"items\":[{\"product_id\":1,\"before\":0,\"after\":275,\"delta\":275}]}', '2025-10-30 17:07:50'),
(11, NULL, '', '', NULL, 'Stock adjusted (1 items)', NULL, '{\"meta\":{\"type\":\"stock_adjust\"},\"items\":[{\"product_id\":1,\"before\":275,\"after\":0,\"delta\":-275}]}', '2025-10-30 17:08:27'),
(12, 1, 'create', 'transactions', 1, 'purchase recorded', NULL, '{\"items\":[{\"product_id\":1,\"qty\":275,\"unit_price\":30}],\"extra_discount_type\":null,\"extra_discount_value\":null,\"sale_mode\":null}', '2025-10-30 17:08:52'),
(13, NULL, '', '', NULL, 'Stock adjusted (1 items)', NULL, '{\"meta\":{\"type\":\"stock_adjust\"},\"items\":[{\"product_id\":1,\"before\":275,\"after\":300,\"delta\":25}]}', '2025-10-30 17:09:27'),
(14, 1, 'create', 'transactions', 2, 'sale recorded', NULL, '{\"items\":[{\"product_id\":1,\"qty\":10,\"unit_price\":45,\"discount_type\":null,\"discount_value\":null,\"price_tier\":\"retail\"}],\"extra_discount_type\":null,\"extra_discount_value\":null,\"sale_mode\":\"retail\"}', '2025-10-30 17:10:24'),
(15, 1, 'create', 'transactions', 3, 'sale recorded', NULL, '{\"items\":[{\"product_id\":1,\"qty\":10,\"unit_price\":45,\"discount_type\":null,\"discount_value\":null,\"price_tier\":\"retail\"}],\"extra_discount_type\":null,\"extra_discount_value\":null,\"sale_mode\":\"retail\"}', '2025-10-30 17:10:24'),
(16, 1, 'create', 'transactions', 4, 'sale recorded', NULL, '{\"items\":[{\"product_id\":1,\"qty\":5,\"unit_price\":45,\"discount_type\":null,\"discount_value\":null,\"price_tier\":\"retail\"}],\"extra_discount_type\":null,\"extra_discount_value\":null,\"sale_mode\":\"retail\"}', '2025-10-30 17:11:30'),
(18, 1, '', '', NULL, 'Refund created for sale_id=4, refund_tx=6', NULL, '{\"type\":\"refund\",\"sale_id\":4,\"sale_date\":\"2025-10-30\",\"refund_tx\":6,\"refund_date\":\"2025-10-30\",\"items\":[{\"line_id\":4,\"product_id\":1,\"qty\":1,\"unit_price\":45,\"code\":\"P0001\",\"name\":\"Hasmin Blue\"}]}', '2025-10-30 17:28:41'),
(19, 1, '', '', NULL, 'Refund created for sale_id=4, refund_tx=7', NULL, '{\"type\":\"refund\",\"sale_id\":4,\"sale_date\":\"2025-10-30\",\"refund_tx\":7,\"refund_date\":\"2025-10-30\",\"items\":[{\"line_id\":4,\"product_id\":1,\"qty\":1,\"unit_price\":45,\"code\":\"P0001\",\"name\":\"Hasmin Blue\"}]}', '2025-10-30 18:56:14'),
(20, 1, '', '', NULL, 'Refund created for sale_id=3, refund_tx=8', NULL, '{\"type\":\"refund\",\"sale_id\":3,\"sale_date\":\"2025-10-30\",\"refund_tx\":8,\"refund_date\":\"2025-10-30\",\"items\":[{\"line_id\":3,\"product_id\":1,\"qty\":1,\"unit_price\":45,\"code\":\"P0001\",\"name\":\"Hasmin Blue\"}]}', '2025-10-30 18:58:18'),
(21, 1, '', '', NULL, 'Refund created for sale_id=3, refund_tx=9', NULL, '{\"type\":\"refund\",\"sale_id\":3,\"sale_date\":\"2025-10-30\",\"refund_tx\":9,\"refund_date\":\"2025-10-30\",\"items\":[{\"line_id\":3,\"product_id\":1,\"qty\":1,\"unit_price\":45,\"code\":\"P0001\",\"name\":\"Hasmin Blue\"}]}', '2025-10-30 19:00:15'),
(22, 1, 'create', 'suppliers', 5, 'Supplier created', NULL, '{\"name\":\"Falcor Marketing\",\"contact\":\"Crista Panillo\",\"phone\":\"09171689997\",\"email\":\"falcormarketing@gmail.com\",\"address\":\"\"}', '2025-10-31 02:31:59'),
(23, 1, 'create', 'suppliers', 6, 'Supplier created', NULL, '{\"name\":\"Pharex Metro\",\"contact\":\"Jehan Lee\",\"phone\":\"09989785678\",\"email\":\"Pharezmetro@gmail.com\",\"address\":\"\"}', '2025-10-31 02:32:26'),
(24, 1, 'create', 'categories', 2, 'Category created', NULL, '{\"name\":\"Dog Food Retail\",\"description\":\"\"}', '2025-10-31 02:33:10'),
(25, 1, 'create', 'categories', 3, 'Category created', NULL, '{\"name\":\"Dog Food Wholesale\",\"description\":\"\"}', '2025-10-31 02:33:35'),
(26, 1, 'create', 'categories', 4, 'Category created', NULL, '{\"name\":\"Rice Wholesale\",\"description\":\"\"}', '2025-10-31 02:33:51'),
(27, 1, 'create', 'products', 2, 'Product created', NULL, '{\"code\":\"P0002\",\"name\":\"Top Breed Adult\",\"category\":\"\",\"category_id\":3,\"supplier_id\":5,\"location_id\":1,\"cost_price\":1000,\"sell_price\":1500,\"barcode\":\"\",\"low_stock_threshold\":null,\"sold_by\":\"each\",\"unit\":\"pc\"}', '2025-10-31 02:35:35'),
(28, 1, 'update', 'products', 2, 'Product updated', '{\"code\":\"P0002\",\"name\":\"Top Breed Adult\",\"category\":\"\",\"category_id\":3,\"supplier_id\":5,\"location_id\":1,\"cost_price\":\"1000.00\",\"sell_price\":\"1500.00\",\"barcode\":\"\",\"low_stock_threshold\":null,\"sold_by\":\"each\",\"unit\":\"pc\",\"id\":2,\"location\":null,\"promo_discount_type\":null,\"promo_discount_value\":null,\"wholesale_price\":\"0.00\",\"stock_qty\":\"0.000\",\"reserved_qty\":0,\"is_active\":1,\"created_at\":\"2025-10-31 10:35:35\",\"updated_at\":null,\"retail_stock\":\"0.000\",\"wholesale_stock\":\"0.000\"}', '{\"code\":\"P0002\",\"name\":\"Top Breed Adult\",\"category\":\"\",\"category_id\":3,\"supplier_id\":5,\"location_id\":1,\"cost_price\":1000,\"sell_price\":1500,\"barcode\":\"\",\"low_stock_threshold\":5,\"sold_by\":\"each\",\"unit\":\"pc\"}', '2025-10-31 02:35:40'),
(29, 1, 'create', 'products', 3, 'Product created', NULL, '{\"code\":\"P0003\",\"name\":\"Top Breed Adult-1 Kilo\",\"category\":\"\",\"category_id\":2,\"supplier_id\":5,\"location_id\":1,\"cost_price\":50,\"sell_price\":85,\"barcode\":\"\",\"low_stock_threshold\":null,\"sold_by\":\"each\",\"unit\":\"pc\"}', '2025-10-31 02:36:22'),
(30, 1, 'create', 'products', 4, 'Product created', NULL, '{\"code\":\"P0004\",\"name\":\"Hasmin Blue-25 kls.\",\"category\":\"\",\"category_id\":3,\"supplier_id\":4,\"location_id\":1,\"cost_price\":900,\"sell_price\":1050,\"barcode\":\"\",\"low_stock_threshold\":null,\"sold_by\":\"each\",\"unit\":\"pc\"}', '2025-10-31 02:37:12'),
(31, 1, 'create', 'transactions', 10, 'purchase recorded', NULL, '{\"items\":[{\"product_id\":4,\"qty\":150,\"unit_price\":900}],\"extra_discount_type\":null,\"extra_discount_value\":null,\"sale_mode\":null}', '2025-10-31 02:37:41'),
(32, 1, 'create', 'transactions', 11, 'purchase recorded', NULL, '{\"items\":[{\"product_id\":2,\"qty\":130,\"unit_price\":1000}],\"extra_discount_type\":null,\"extra_discount_value\":null,\"sale_mode\":null}', '2025-10-31 02:37:58'),
(33, 1, 'create', 'transactions', 12, 'purchase recorded', NULL, '{\"items\":[{\"product_id\":3,\"qty\":25,\"unit_price\":50}],\"extra_discount_type\":null,\"extra_discount_value\":null,\"sale_mode\":null}', '2025-10-31 02:38:24'),
(34, NULL, '', '', NULL, 'Stock adjusted (1 items)', NULL, '{\"meta\":{\"type\":\"stock_adjust\"},\"items\":[{\"product_id\":1,\"before\":282,\"after\":285,\"delta\":3}]}', '2025-10-31 04:51:19'),
(35, 1, '', '', NULL, 'Refund created for sale_id=3, refund_tx=13', NULL, '{\"type\":\"refund\",\"sale_id\":3,\"sale_date\":\"2025-10-30\",\"refund_tx\":13,\"refund_date\":\"2025-10-30\",\"items\":[{\"line_id\":3,\"product_id\":1,\"qty\":3,\"unit_price\":45,\"code\":\"P0001\",\"name\":\"Hasmin Blue\"}]}', '2025-10-31 04:52:33'),
(36, 1, 'create', 'products', 5, 'Product created', NULL, '{\"code\":\"P0005\",\"name\":\"African Mix\",\"category\":\"Feeds Retail\",\"category_id\":5,\"supplier_id\":null,\"location_id\":null,\"cost_price\":50,\"sell_price\":76,\"barcode\":\"\",\"low_stock_threshold\":null,\"sold_by\":\"each\",\"unit\":\"pc\"}', '2025-10-31 04:57:33'),
(37, 1, 'create', 'transactions', 14, 'purchase recorded', NULL, '{\"items\":[{\"product_id\":5,\"qty\":10,\"unit_price\":50}],\"extra_discount_type\":null,\"extra_discount_value\":null,\"sale_mode\":null}', '2025-10-31 04:58:11'),
(38, 1, 'create', 'products', 6, 'Product created', NULL, '{\"code\":\"P0006\",\"name\":\"Nike LeBron Witness V\",\"category\":\"\",\"category_id\":2,\"supplier_id\":null,\"location_id\":null,\"cost_price\":11,\"sell_price\":15,\"barcode\":\"\",\"low_stock_threshold\":null,\"sold_by\":\"each\",\"unit\":\"pc\"}', '2025-10-31 05:01:26'),
(39, 1, 'archive', 'products', 6, 'Product archived', NULL, NULL, '2025-11-11 18:42:35'),
(40, 1, 'create', 'transactions', 15, 'purchase recorded', NULL, '{\"items\":[{\"product_id\":3,\"qty\":20,\"unit_price\":50}],\"extra_discount_type\":null,\"extra_discount_value\":null,\"sale_mode\":null}', '2025-11-13 03:49:59'),
(41, 1, 'create', 'transactions', 16, 'sale recorded', NULL, '{\"items\":[{\"product_id\":3,\"qty\":5,\"unit_price\":85,\"discount_type\":null,\"discount_value\":null,\"price_tier\":\"retail\"}],\"extra_discount_type\":null,\"extra_discount_value\":null,\"sale_mode\":\"retail\"}', '2025-11-13 03:50:48'),
(42, 1, 'create', 'transactions', 17, 'sale recorded', NULL, '{\"items\":[{\"product_id\":1,\"qty\":5,\"unit_price\":45,\"discount_type\":null,\"discount_value\":null,\"price_tier\":\"retail\"}],\"extra_discount_type\":null,\"extra_discount_value\":null,\"sale_mode\":\"retail\"}', '2025-11-13 04:56:32'),
(43, 1, 'create', 'transactions', 18, 'sale recorded', NULL, '{\"items\":[{\"product_id\":1,\"qty\":2,\"unit_price\":45,\"discount_type\":null,\"discount_value\":null,\"price_tier\":\"retail\"},{\"product_id\":2,\"qty\":2,\"unit_price\":1500,\"discount_type\":null,\"discount_value\":null,\"price_tier\":\"retail\"}],\"extra_discount_type\":null,\"extra_discount_value\":null,\"sale_mode\":\"retail\"}', '2025-11-13 04:57:31');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `description`, `created_at`) VALUES
(1, 'Rice Retail', '', '2025-10-30 17:06:00'),
(2, 'Dog Food Retail', '', '2025-10-31 02:33:10'),
(3, 'Dog Food Wholesale', '', '2025-10-31 02:33:35'),
(4, 'Rice Wholesale', '', '2025-10-31 02:33:51'),
(5, 'Feeds Retail', NULL, '2025-10-31 04:57:33');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` int(11) NOT NULL,
  `name` varchar(160) NOT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `email` varchar(160) DEFAULT NULL,
  `address` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `locations`
--

CREATE TABLE `locations` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `locations`
--

INSERT INTO `locations` (`id`, `name`, `description`, `created_at`) VALUES
(1, 'Iloilo City', NULL, '2025-09-02 16:17:29');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `code` varchar(64) NOT NULL,
  `name` varchar(200) NOT NULL,
  `category` varchar(120) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `location_id` int(11) DEFAULT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `location` varchar(120) DEFAULT NULL,
  `cost_price` decimal(12,2) DEFAULT 0.00,
  `sell_price` decimal(12,2) DEFAULT 0.00,
  `promo_discount_type` enum('percent','amount') DEFAULT NULL,
  `promo_discount_value` decimal(10,2) DEFAULT NULL,
  `sold_by` enum('each','weight') NOT NULL DEFAULT 'each',
  `unit` enum('pc','kg','g','lb') NOT NULL DEFAULT 'pc',
  `wholesale_price` decimal(10,2) NOT NULL DEFAULT 0.00,
  `barcode` varchar(128) DEFAULT NULL,
  `low_stock_threshold` int(11) DEFAULT NULL,
  `stock_qty` decimal(12,3) NOT NULL DEFAULT 0.000,
  `reserved_qty` int(11) NOT NULL DEFAULT 0,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  `retail_stock` decimal(12,3) NOT NULL DEFAULT 0.000,
  `wholesale_stock` decimal(12,3) NOT NULL DEFAULT 0.000
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `code`, `name`, `category`, `category_id`, `location_id`, `supplier_id`, `location`, `cost_price`, `sell_price`, `promo_discount_type`, `promo_discount_value`, `sold_by`, `unit`, `wholesale_price`, `barcode`, `low_stock_threshold`, `stock_qty`, `reserved_qty`, `is_active`, `created_at`, `updated_at`, `retail_stock`, `wholesale_stock`) VALUES
(1, 'P0001', 'Hasmin Blue', '', 1, 1, 4, NULL, 30.00, 45.00, NULL, NULL, 'each', 'pc', 0.00, '', 5, 281.000, 0, 1, '2025-10-30 17:07:36', '2025-11-13 04:57:31', 288.000, 288.000),
(2, 'P0002', 'Top Breed Adult', '', 3, 1, 5, NULL, 1000.00, 1500.00, NULL, NULL, 'each', 'pc', 0.00, '', 5, 128.000, 0, 1, '2025-10-31 02:35:35', '2025-11-13 04:57:31', 0.000, 0.000),
(3, 'P0003', 'Top Breed Adult-1 Kilo', '', 2, 1, 5, NULL, 50.00, 85.00, NULL, NULL, 'each', 'pc', 0.00, '', NULL, 40.000, 0, 1, '2025-10-31 02:36:22', '2025-11-13 03:50:48', 0.000, 0.000),
(4, 'P0004', 'Hasmin Blue-25 kls.', '', 3, 1, 4, NULL, 900.00, 1050.00, NULL, NULL, 'each', 'pc', 0.00, '', NULL, 150.000, 0, 1, '2025-10-31 02:37:12', '2025-10-31 02:37:41', 0.000, 0.000),
(5, 'P0005', 'African Mix', 'Feeds Retail', 5, NULL, NULL, NULL, 50.00, 76.00, NULL, NULL, 'each', 'pc', 0.00, '', NULL, 10.000, 0, 1, '2025-10-31 04:57:33', '2025-10-31 04:58:11', 0.000, 0.000),
(6, 'P0006', 'Nike LeBron Witness V', '', 2, NULL, NULL, NULL, 11.00, 15.00, NULL, NULL, 'each', 'pc', 0.00, '', NULL, 0.000, 0, 0, '2025-10-31 05:01:26', '2025-11-11 18:42:35', 0.000, 0.000);

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(11) NOT NULL,
  `key` varchar(100) NOT NULL,
  `value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `key`, `value`) VALUES
(1, 'low_stock_default', '5'),
(9, 'product_seq', '1');

-- --------------------------------------------------------

--
-- Table structure for table `suppliers`
--

CREATE TABLE `suppliers` (
  `id` int(11) NOT NULL,
  `name` varchar(160) NOT NULL,
  `contact` varchar(160) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `email` varchar(160) DEFAULT NULL,
  `address` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `suppliers`
--

INSERT INTO `suppliers` (`id`, `name`, `contact`, `phone`, `email`, `address`) VALUES
(1, 'Ajara Marketing', 'Jojo Basbano', '09394127891', 'ajaramarketing@yahoo.com', 'Iloilo City'),
(4, 'Alot Rice Center', 'John Pillena', '099686553160', 'Atcenter@gmail.com', ''),
(5, 'Falcor Marketing', 'Crista Panillo', '09171689997', 'falcormarketing@gmail.com', ''),
(6, 'Pharex Metro', 'Jehan Lee', '09989785678', 'Pharezmetro@gmail.com', '');

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` int(11) NOT NULL,
  `type` enum('purchase','sale','return','transfer_in','transfer_out','damage','adjustment','refund') NOT NULL,
  `ref_no` varchar(64) DEFAULT NULL,
  `date` date NOT NULL,
  `user_id` int(11) NOT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `sale_mode` enum('retail','wholesale') DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `extra_discount_type` enum('percent','amount') DEFAULT NULL,
  `extra_discount_value` decimal(12,2) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `refers_to` int(11) DEFAULT NULL,
  `net_value` decimal(12,2) NOT NULL DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id`, `type`, `ref_no`, `date`, `user_id`, `supplier_id`, `customer_id`, `sale_mode`, `notes`, `extra_discount_type`, `extra_discount_value`, `created_at`, `refers_to`, `net_value`) VALUES
(1, 'purchase', 'P_20251030_180852', '2025-10-30', 1, 4, NULL, NULL, '', NULL, NULL, '2025-10-30 17:08:52', NULL, 0.00),
(2, 'sale', 'S_20251030_181024', '2025-10-30', 1, NULL, NULL, 'retail', '', NULL, NULL, '2025-10-30 17:10:24', NULL, 0.00),
(3, 'sale', 'S_20251030_181024', '2025-10-30', 1, NULL, NULL, 'retail', '', NULL, NULL, '2025-10-30 17:10:24', NULL, 0.00),
(4, 'sale', 'S_20251030_181130', '2025-10-30', 1, NULL, NULL, 'retail', '', NULL, NULL, '2025-10-30 17:11:30', NULL, 0.00),
(5, 'refund', 'R_20251030_2788', '2025-10-30', 1, NULL, NULL, NULL, '', NULL, NULL, '2025-10-30 10:12:12', 4, -135.00),
(6, 'refund', 'R_20251031_5267', '2025-10-30', 1, NULL, NULL, NULL, '', NULL, NULL, '2025-10-30 17:28:41', NULL, -45.00),
(7, 'refund', 'R_20251031_4173', '2025-10-30', 1, NULL, NULL, NULL, '', NULL, NULL, '2025-10-30 18:56:14', NULL, -45.00),
(8, 'refund', 'R_20251031_7891', '2025-10-30', 1, NULL, NULL, NULL, '', NULL, NULL, '2025-10-30 18:58:18', NULL, -45.00),
(9, 'refund', 'R_20251031_3747', '2025-10-30', 1, NULL, NULL, NULL, '', NULL, NULL, '2025-10-30 19:00:15', NULL, -45.00),
(10, 'purchase', 'P_20251031_033741', '2025-10-31', 1, NULL, NULL, NULL, '', NULL, NULL, '2025-10-31 02:37:41', NULL, 0.00),
(11, 'purchase', 'P_20251031_033758', '2025-10-31', 1, NULL, NULL, NULL, '', NULL, NULL, '2025-10-31 02:37:58', NULL, 0.00),
(12, 'purchase', 'P_20251031_033824', '2025-10-31', 1, NULL, NULL, NULL, '', NULL, NULL, '2025-10-31 02:38:24', NULL, 0.00),
(13, 'refund', 'R_20251031_6152', '2025-10-30', 1, NULL, NULL, NULL, '', NULL, NULL, '2025-10-31 04:52:33', NULL, -135.00),
(14, 'purchase', 'P_20251031_055811', '2025-10-31', 1, NULL, NULL, NULL, '', NULL, NULL, '2025-10-31 04:58:11', NULL, 0.00),
(15, 'purchase', 'P_20251113_044959', '2025-11-13', 1, NULL, NULL, NULL, '', NULL, NULL, '2025-11-13 03:49:59', NULL, 0.00),
(16, 'sale', 'S_20251113_045048', '2025-11-13', 1, NULL, NULL, 'retail', '', NULL, NULL, '2025-11-13 03:50:48', NULL, 0.00),
(17, 'sale', 'S_20251113_055632', '2025-11-05', 1, NULL, NULL, 'retail', '', NULL, NULL, '2025-11-13 04:56:32', NULL, 0.00),
(18, 'sale', 'S_20251113_055731', '2025-11-06', 1, NULL, NULL, 'retail', '', NULL, NULL, '2025-11-13 04:57:31', NULL, 0.00);

-- --------------------------------------------------------

--
-- Table structure for table `transaction_items`
--

CREATE TABLE `transaction_items` (
  `id` int(11) NOT NULL,
  `transaction_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `qty` decimal(12,3) NOT NULL,
  `unit_price` decimal(12,2) NOT NULL DEFAULT 0.00,
  `cost_at_sale` decimal(10,2) DEFAULT NULL,
  `price_tier` enum('retail','wholesale') DEFAULT NULL,
  `discount_type` enum('percent','amount') DEFAULT NULL,
  `discount_value` decimal(12,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transaction_items`
--

INSERT INTO `transaction_items` (`id`, `transaction_id`, `product_id`, `qty`, `unit_price`, `cost_at_sale`, `price_tier`, `discount_type`, `discount_value`) VALUES
(1, 1, 1, 275.000, 30.00, NULL, NULL, NULL, NULL),
(2, 2, 1, 10.000, 45.00, 30.00, 'retail', NULL, NULL),
(3, 3, 1, 10.000, 45.00, 30.00, 'retail', NULL, NULL),
(4, 4, 1, 5.000, 45.00, 30.00, 'retail', NULL, NULL),
(5, 5, 1, 3.000, 45.00, NULL, NULL, NULL, NULL),
(6, 6, 1, 1.000, 45.00, NULL, NULL, NULL, NULL),
(7, 7, 1, 1.000, 45.00, NULL, NULL, NULL, NULL),
(8, 8, 1, 1.000, 45.00, NULL, NULL, NULL, NULL),
(9, 9, 1, 1.000, 45.00, NULL, NULL, NULL, NULL),
(10, 10, 4, 150.000, 900.00, NULL, NULL, NULL, NULL),
(11, 11, 2, 130.000, 1000.00, NULL, NULL, NULL, NULL),
(12, 12, 3, 25.000, 50.00, NULL, NULL, NULL, NULL),
(13, 13, 1, 3.000, 45.00, NULL, NULL, NULL, NULL),
(14, 14, 5, 10.000, 50.00, NULL, NULL, NULL, NULL),
(15, 15, 3, 20.000, 50.00, NULL, NULL, NULL, NULL),
(16, 16, 3, 5.000, 85.00, 50.00, 'retail', NULL, NULL),
(17, 17, 1, 5.000, 45.00, 30.00, 'retail', NULL, NULL),
(18, 18, 1, 2.000, 45.00, 30.00, 'retail', NULL, NULL),
(19, 18, 2, 2.000, 1500.00, 1000.00, 'retail', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(120) NOT NULL,
  `email` varchar(160) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `role` enum('admin','staff','auditor') NOT NULL DEFAULT 'staff',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password_hash`, `role`, `created_at`) VALUES
(1, 'Admin', 'admin@example.com', '$2y$10$QWlTBzz.IoExqFv6G//A9uBszMw5vN4mkMG6iB98mbd8Uf8iASlE.', 'admin', '2025-08-28 07:25:26'),
(2, 'Staff User', 'staff@example.com', '$2y$10$snqnHD0FpFz7FLpSOSJA/.ZNslb2ZDhfh766Lpk86/I9WQsNjrXhS', 'staff', '2025-08-29 15:43:52'),
(3, 'Auditor User', 'auditor@example.com', '$2y$10$B8dR7TlJsxgJqUgnN.2wt.hYr65a31yGh6G3gvrXUV5pnRe1vWbRi', 'auditor', '2025-08-29 15:43:52');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `audit_log`
--
ALTER TABLE `audit_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `action` (`action`),
  ADD KEY `entity` (`entity`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `locations`
--
ALTER TABLE `locations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`),
  ADD KEY `fk_products_supplier` (`supplier_id`),
  ADD KEY `idx_products_category_id` (`category_id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `key` (`key`);

--
-- Indexes for table `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_trx_user` (`user_id`),
  ADD KEY `fk_trx_supplier` (`supplier_id`),
  ADD KEY `fk_trx_customer` (`customer_id`);

--
-- Indexes for table `transaction_items`
--
ALTER TABLE `transaction_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_item_trx` (`transaction_id`),
  ADD KEY `fk_item_product` (`product_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `audit_log`
--
ALTER TABLE `audit_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `locations`
--
ALTER TABLE `locations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `transaction_items`
--
ALTER TABLE `transaction_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `fk_products_supplier` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `fk_trx_customer` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_trx_supplier` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_trx_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `transaction_items`
--
ALTER TABLE `transaction_items`
  ADD CONSTRAINT `fk_item_product` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_item_trx` FOREIGN KEY (`transaction_id`) REFERENCES `transactions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

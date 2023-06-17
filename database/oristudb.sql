-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jun 17, 2023 at 12:33 PM
-- Server version: 8.0.33-0ubuntu0.20.04.2
-- PHP Version: 7.4.3-4ubuntu2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `oristu2`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

CREATE TABLE `accounts` (
  `id` int UNSIGNED NOT NULL,
  `business_id` int NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `account_number` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `account_type_id` int DEFAULT NULL,
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_by` int NOT NULL,
  `is_closed` tinyint(1) NOT NULL DEFAULT '0',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `accounts`
--

INSERT INTO `accounts` (`id`, `business_id`, `name`, `account_number`, `account_type_id`, `note`, `created_by`, `is_closed`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 3, 'Advertising', 'Adv001', 0, NULL, 9, 0, NULL, '2023-06-03 15:35:14', '2023-06-03 15:35:14'),
(2, 3, 'Accounts Payable', 'AP001', 1, NULL, 9, 0, NULL, '2023-06-03 15:51:56', '2023-06-03 15:51:56'),
(3, 3, 'Fixed operating cost', 'FXD001', 0, NULL, 9, 0, NULL, '2023-06-03 16:07:07', '2023-06-03 16:07:07');

-- --------------------------------------------------------

--
-- Table structure for table `account_transactions`
--

CREATE TABLE `account_transactions` (
  `id` int UNSIGNED NOT NULL,
  `account_id` int NOT NULL,
  `type` enum('debit','credit') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sub_type` enum('opening_balance','fund_transfer','deposit') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` decimal(22,4) NOT NULL,
  `reff_no` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `operation_date` datetime NOT NULL,
  `created_by` int NOT NULL,
  `transaction_id` int DEFAULT NULL,
  `transaction_payment_id` int DEFAULT NULL,
  `transfer_transaction_id` int DEFAULT NULL,
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `account_transactions`
--

INSERT INTO `account_transactions` (`id`, `account_id`, `type`, `sub_type`, `amount`, `reff_no`, `operation_date`, `created_by`, `transaction_id`, `transaction_payment_id`, `transfer_transaction_id`, `note`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 3, 'debit', NULL, '70000.0000', NULL, '2023-06-03 15:57:49', 9, 397, 33, NULL, NULL, NULL, '2023-06-03 15:57:49', '2023-06-03 16:16:31'),
(2, 2, 'debit', 'fund_transfer', '70000.0000', NULL, '2023-06-03 16:08:00', 9, NULL, NULL, 3, NULL, NULL, '2023-06-03 16:08:32', '2023-06-03 16:08:32'),
(3, 3, 'credit', 'fund_transfer', '70000.0000', NULL, '2023-06-03 16:08:00', 9, NULL, NULL, 2, NULL, NULL, '2023-06-03 16:08:32', '2023-06-03 16:08:32');

-- --------------------------------------------------------

--
-- Table structure for table `account_types`
--

CREATE TABLE `account_types` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_account_type_id` int DEFAULT NULL,
  `business_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `account_types`
--

INSERT INTO `account_types` (`id`, `name`, `parent_account_type_id`, `business_id`, `created_at`, `updated_at`) VALUES
(1, 'Advertising', NULL, 3, '2023-06-03 15:35:44', '2023-06-03 15:35:44'),
(3, 'Rent', NULL, 3, '2023-06-03 16:07:33', '2023-06-03 16:07:33'),
(4, 'Cash', NULL, 3, '2023-06-03 16:14:52', '2023-06-03 16:14:52');

-- --------------------------------------------------------

--
-- Table structure for table `activity_log`
--

CREATE TABLE `activity_log` (
  `id` int UNSIGNED NOT NULL,
  `log_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject_id` int DEFAULT NULL,
  `subject_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `causer_id` int DEFAULT NULL,
  `causer_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `properties` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `activity_log`
--

INSERT INTO `activity_log` (`id`, `log_name`, `description`, `subject_id`, `subject_type`, `causer_id`, `causer_type`, `properties`, `created_at`, `updated_at`) VALUES
(1, 'default', 'edited', 39, 'App\\Transaction', 2, 'App\\User', '[]', '2023-05-16 15:51:22', '2023-05-16 15:51:22'),
(2, 'default', 'edited', 39, 'App\\Transaction', 2, 'App\\User', '[]', '2023-05-16 15:52:17', '2023-05-16 15:52:17'),
(3, 'default', 'edited', 39, 'App\\Transaction', 2, 'App\\User', '[]', '2023-05-16 15:53:38', '2023-05-16 15:53:38'),
(4, 'default', 'edited', 41, 'App\\Transaction', 2, 'App\\User', '[]', '2023-05-16 16:09:54', '2023-05-16 16:09:54'),
(5, 'default', 'edited', 42, 'App\\Transaction', 7, 'App\\User', '[]', '2023-05-16 16:43:33', '2023-05-16 16:43:33'),
(6, 'default', 'edited', 42, 'App\\Transaction', 7, 'App\\User', '[]', '2023-05-16 18:21:30', '2023-05-16 18:21:30'),
(7, 'default', 'edited', 42, 'App\\Transaction', 7, 'App\\User', '[]', '2023-05-16 18:29:10', '2023-05-16 18:29:10');

-- --------------------------------------------------------

--
-- Table structure for table `barcodes`
--

CREATE TABLE `barcodes` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `width` double(22,4) DEFAULT NULL,
  `height` double(22,4) DEFAULT NULL,
  `paper_width` double(22,4) DEFAULT NULL,
  `paper_height` double(22,4) DEFAULT NULL,
  `top_margin` double(22,4) DEFAULT NULL,
  `left_margin` double(22,4) DEFAULT NULL,
  `row_distance` double(22,4) DEFAULT NULL,
  `col_distance` double(22,4) DEFAULT NULL,
  `stickers_in_one_row` int DEFAULT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT '0',
  `is_continuous` tinyint(1) NOT NULL DEFAULT '0',
  `stickers_in_one_sheet` int DEFAULT NULL,
  `business_id` int UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `barcodes`
--

INSERT INTO `barcodes` (`id`, `name`, `description`, `width`, `height`, `paper_width`, `paper_height`, `top_margin`, `left_margin`, `row_distance`, `col_distance`, `stickers_in_one_row`, `is_default`, `is_continuous`, `stickers_in_one_sheet`, `business_id`, `created_at`, `updated_at`) VALUES
(1, '20 Labels per Sheet - (8.5\" x 11\")', 'Sheet Size: 8.5\" x 11\"\\r\\nLabel Size: 4\" x 1\"\\r\\nLabels per sheet: 20', 3.7500, 1.0000, 8.5000, 11.0000, 0.5000, 0.5000, 0.0000, 0.1562, 2, 0, 0, 20, NULL, '2017-12-18 06:13:44', '2017-12-18 06:13:44'),
(2, '30 Labels per sheet - (8.5\" x 11\")', 'Sheet Size: 8.5\" x 11\"\\r\\nLabel Size: 2.625\" x 1\"\\r\\nLabels per sheet: 30', 2.6250, 1.0000, 8.5000, 11.0000, 0.5000, 0.2198, 0.0000, 0.1400, 3, 0, 0, 30, NULL, '2017-12-18 06:04:39', '2017-12-18 06:10:40'),
(3, '32 Labels per sheet - (8.5\" x 11\")', 'Sheet Size: 8.5\" x 11\"\\r\\nLabel Size: 2\" x 1.25\"\\r\\nLabels per sheet: 32', 2.0000, 1.2500, 8.5000, 11.0000, 0.5000, 0.2500, 0.0000, 0.0000, 4, 0, 0, 32, NULL, '2017-12-18 05:55:40', '2017-12-18 05:55:40'),
(4, '40 Labels per sheet - (8.5\" x 11\")', 'Sheet Size: 8.5\" x 11\"\\r\\nLabel Size: 2\" x 1\"\\r\\nLabels per sheet: 40', 2.0000, 1.0000, 8.5000, 11.0000, 0.5000, 0.2500, 0.0000, 0.0000, 4, 0, 0, 40, NULL, '2017-12-18 05:58:40', '2017-12-18 05:58:40'),
(5, '50 Labels per Sheet - (8.5\" x 11\")', 'Sheet Size: 8.5\" x 11\"\\r\\nLabel Size: 1.5\" x 1\"\\r\\nLabels per sheet: 50', 1.5000, 1.0000, 8.5000, 11.0000, 0.5000, 0.5000, 0.0000, 0.0000, 5, 0, 0, 50, NULL, '2017-12-18 05:51:10', '2017-12-18 05:51:10'),
(6, 'Continuous Rolls - 31.75mm x 25.4mm', 'Label Size: 31.75mm x 25.4mm\\r\\nGap: 3.18mm', 1.2500, 1.0000, 1.2500, 0.0000, 0.1250, 0.0000, 0.1250, 0.0000, 1, 0, 1, NULL, NULL, '2017-12-18 05:51:10', '2017-12-18 05:51:10');

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE `bookings` (
  `id` int UNSIGNED NOT NULL,
  `contact_id` int UNSIGNED NOT NULL,
  `waiter_id` int UNSIGNED DEFAULT NULL,
  `table_id` int UNSIGNED DEFAULT NULL,
  `correspondent_id` int DEFAULT NULL,
  `business_id` int UNSIGNED NOT NULL,
  `location_id` int UNSIGNED NOT NULL,
  `booking_start` datetime NOT NULL,
  `booking_end` datetime NOT NULL,
  `created_by` int UNSIGNED NOT NULL,
  `booking_status` enum('booked','completed','cancelled') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `booking_note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` int UNSIGNED NOT NULL,
  `business_id` int UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_by` int UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `business`
--

CREATE TABLE `business` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency_id` int UNSIGNED NOT NULL,
  `start_date` date DEFAULT NULL,
  `tax_number_1` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax_label_1` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax_number_2` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax_label_2` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `default_sales_tax` int UNSIGNED DEFAULT NULL,
  `default_profit_percent` double(5,2) NOT NULL DEFAULT '0.00',
  `owner_id` int UNSIGNED NOT NULL,
  `time_zone` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Asia/Kolkata',
  `fy_start_month` tinyint NOT NULL DEFAULT '1',
  `accounting_method` enum('fifo','lifo','avco') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'fifo',
  `default_sales_discount` decimal(5,2) DEFAULT NULL,
  `sell_price_tax` enum('includes','excludes') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'includes',
  `logo` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sku_prefix` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `enable_product_expiry` tinyint(1) NOT NULL DEFAULT '0',
  `expiry_type` enum('add_expiry','add_manufacturing') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'add_expiry',
  `on_product_expiry` enum('keep_selling','stop_selling','auto_delete') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'keep_selling',
  `stop_selling_before` int NOT NULL COMMENT 'Stop selling expied item n days before expiry',
  `enable_tooltip` tinyint(1) NOT NULL DEFAULT '1',
  `purchase_in_diff_currency` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Allow purchase to be in different currency then the business currency',
  `purchase_currency_id` int UNSIGNED DEFAULT NULL,
  `p_exchange_rate` decimal(20,3) NOT NULL DEFAULT '1.000',
  `transaction_edit_days` int UNSIGNED NOT NULL DEFAULT '30',
  `stock_expiry_alert_days` int UNSIGNED NOT NULL DEFAULT '30',
  `keyboard_shortcuts` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `pos_settings` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `weighing_scale_setting` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'used to store the configuration of weighing scale',
  `enable_brand` tinyint(1) NOT NULL DEFAULT '1',
  `enable_category` tinyint(1) NOT NULL DEFAULT '1',
  `enable_sub_category` tinyint(1) NOT NULL DEFAULT '1',
  `enable_price_tax` tinyint(1) NOT NULL DEFAULT '1',
  `enable_purchase_status` tinyint(1) DEFAULT '1',
  `enable_lot_number` tinyint(1) NOT NULL DEFAULT '0',
  `default_unit` int DEFAULT NULL,
  `enable_sub_units` tinyint(1) NOT NULL DEFAULT '0',
  `enable_racks` tinyint(1) NOT NULL DEFAULT '0',
  `enable_row` tinyint(1) NOT NULL DEFAULT '0',
  `enable_position` tinyint(1) NOT NULL DEFAULT '0',
  `enable_editing_product_from_purchase` tinyint(1) NOT NULL DEFAULT '1',
  `sales_cmsn_agnt` enum('logged_in_user','user','cmsn_agnt') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `item_addition_method` tinyint(1) NOT NULL DEFAULT '1',
  `enable_inline_tax` tinyint(1) NOT NULL DEFAULT '1',
  `currency_symbol_placement` enum('before','after') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'before',
  `enabled_modules` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `date_format` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'm/d/Y',
  `time_format` enum('12','24') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '24',
  `ref_no_prefixes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `theme_color` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `enable_rp` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'rp is the short form of reward points',
  `rp_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'rp is the short form of reward points',
  `amount_for_unit_rp` decimal(22,4) NOT NULL DEFAULT '1.0000' COMMENT 'rp is the short form of reward points',
  `min_order_total_for_rp` decimal(22,4) NOT NULL DEFAULT '1.0000' COMMENT 'rp is the short form of reward points',
  `max_rp_per_order` int DEFAULT NULL COMMENT 'rp is the short form of reward points',
  `redeem_amount_per_unit_rp` decimal(22,4) NOT NULL DEFAULT '1.0000' COMMENT 'rp is the short form of reward points',
  `min_order_total_for_redeem` decimal(22,4) NOT NULL DEFAULT '1.0000' COMMENT 'rp is the short form of reward points',
  `min_redeem_point` int DEFAULT NULL COMMENT 'rp is the short form of reward points',
  `max_redeem_point` int DEFAULT NULL COMMENT 'rp is the short form of reward points',
  `rp_expiry_period` int DEFAULT NULL COMMENT 'rp is the short form of reward points',
  `rp_expiry_type` enum('month','year') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'year' COMMENT 'rp is the short form of reward points',
  `email_settings` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `sms_settings` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `custom_labels` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `common_settings` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `business`
--

INSERT INTO `business` (`id`, `name`, `currency_id`, `start_date`, `tax_number_1`, `tax_label_1`, `tax_number_2`, `tax_label_2`, `default_sales_tax`, `default_profit_percent`, `owner_id`, `time_zone`, `fy_start_month`, `accounting_method`, `default_sales_discount`, `sell_price_tax`, `logo`, `sku_prefix`, `enable_product_expiry`, `expiry_type`, `on_product_expiry`, `stop_selling_before`, `enable_tooltip`, `purchase_in_diff_currency`, `purchase_currency_id`, `p_exchange_rate`, `transaction_edit_days`, `stock_expiry_alert_days`, `keyboard_shortcuts`, `pos_settings`, `weighing_scale_setting`, `enable_brand`, `enable_category`, `enable_sub_category`, `enable_price_tax`, `enable_purchase_status`, `enable_lot_number`, `default_unit`, `enable_sub_units`, `enable_racks`, `enable_row`, `enable_position`, `enable_editing_product_from_purchase`, `sales_cmsn_agnt`, `item_addition_method`, `enable_inline_tax`, `currency_symbol_placement`, `enabled_modules`, `date_format`, `time_format`, `ref_no_prefixes`, `theme_color`, `created_by`, `enable_rp`, `rp_name`, `amount_for_unit_rp`, `min_order_total_for_rp`, `max_rp_per_order`, `redeem_amount_per_unit_rp`, `min_order_total_for_redeem`, `min_redeem_point`, `max_redeem_point`, `rp_expiry_period`, `rp_expiry_type`, `email_settings`, `sms_settings`, `custom_labels`, `common_settings`, `is_active`, `created_at`, `updated_at`) VALUES
(2, 'MCFRIES GOURMET', 133, '2022-10-01', NULL, NULL, NULL, NULL, NULL, 25.00, 2, 'Africa/Nairobi', 1, 'fifo', '0.00', 'includes', NULL, NULL, 0, 'add_expiry', 'keep_selling', 0, 1, 0, NULL, '1.000', 30, 30, '{\"pos\":{\"express_checkout\":\"shift+e\",\"pay_n_ckeckout\":\"shift+p\",\"draft\":\"shift+d\",\"cancel\":\"shift+c\",\"recent_product_quantity\":\"f2\",\"weighing_scale\":null,\"edit_discount\":\"shift+i\",\"edit_order_tax\":\"shift+t\",\"add_payment_row\":\"shift+r\",\"finalize_payment\":\"shift+f\",\"add_new_product\":\"f4\"}}', '{\"amount_rounding_method\":null,\"allow_overselling\":\"1\",\"show_credit_sale_button\":\"1\",\"disable_pay_checkout\":0,\"disable_draft\":0,\"disable_express_checkout\":0,\"hide_product_suggestion\":0,\"hide_recent_trans\":0,\"disable_discount\":0,\"disable_order_tax\":0,\"is_pos_subtotal_editable\":0}', '{\"label_prefix\":null,\"product_sku_length\":\"4\",\"qty_length\":\"3\",\"qty_length_decimal\":\"2\"}', 1, 1, 1, 1, 1, 0, NULL, 0, 0, 0, 0, 1, NULL, 1, 0, 'before', '[\"purchases\",\"add_sale\",\"pos_sale\",\"stock_transfers\",\"stock_adjustment\",\"expenses\",\"tables\",\"kitchen\"]', 'm/d/Y', '24', '{\"purchase\":\"PO\",\"purchase_return\":null,\"stock_transfer\":\"ST\",\"stock_adjustment\":\"SA\",\"sell_return\":\"CN\",\"expense\":\"EP\",\"contacts\":\"CO\",\"purchase_payment\":\"PP\",\"sell_payment\":\"SP\",\"expense_payment\":null,\"business_location\":\"BL\",\"username\":null,\"subscription\":null}', NULL, NULL, 0, NULL, '1.0000', '1.0000', NULL, '1.0000', '1.0000', NULL, NULL, NULL, 'year', '{\"mail_driver\":\"smtp\",\"mail_host\":null,\"mail_port\":null,\"mail_username\":\"Admin\",\"mail_password\":\"Lads2010!\",\"mail_encryption\":null,\"mail_from_address\":null,\"mail_from_name\":null}', '{\"url\":null,\"send_to_param_name\":\"to\",\"msg_param_name\":\"text\",\"request_method\":\"post\",\"param_1\":null,\"param_val_1\":null,\"param_2\":null,\"param_val_2\":null,\"param_3\":null,\"param_val_3\":null,\"param_4\":null,\"param_val_4\":null,\"param_5\":null,\"param_val_5\":null,\"param_6\":null,\"param_val_6\":null,\"param_7\":null,\"param_val_7\":null,\"param_8\":null,\"param_val_8\":null,\"param_9\":null,\"param_val_9\":null,\"param_10\":null,\"param_val_10\":null}', '{\"payments\":{\"custom_pay_1\":\"Mpesa_Till\",\"custom_pay_2\":null,\"custom_pay_3\":null},\"contact\":{\"custom_field_1\":null,\"custom_field_2\":null,\"custom_field_3\":null,\"custom_field_4\":null},\"product\":{\"custom_field_1\":null,\"custom_field_2\":null,\"custom_field_3\":null,\"custom_field_4\":null},\"location\":{\"custom_field_1\":null,\"custom_field_2\":null,\"custom_field_3\":null,\"custom_field_4\":null},\"user\":{\"custom_field_1\":null,\"custom_field_2\":null,\"custom_field_3\":null,\"custom_field_4\":null},\"purchase\":{\"custom_field_1\":null,\"custom_field_2\":null,\"custom_field_3\":null,\"custom_field_4\":null},\"sell\":{\"custom_field_1\":null,\"custom_field_2\":null,\"custom_field_3\":null,\"custom_field_4\":null},\"types_of_service\":{\"custom_field_1\":null,\"custom_field_2\":null,\"custom_field_3\":null,\"custom_field_4\":null}}', '{\"default_datatable_page_entries\":\"25\"}', 1, '2022-10-13 17:35:41', '2023-05-16 15:57:00'),
(3, 'ORITSU KENYA', 133, '2023-05-01', NULL, NULL, NULL, NULL, NULL, 25.00, 8, 'Africa/Nairobi', 1, 'fifo', '0.00', 'includes', NULL, NULL, 0, 'add_expiry', 'keep_selling', 0, 1, 0, NULL, '1.000', 30, 30, '{\"pos\":{\"express_checkout\":\"shift+e\",\"pay_n_ckeckout\":\"shift+p\",\"draft\":\"shift+d\",\"cancel\":\"shift+c\",\"recent_product_quantity\":\"f2\",\"weighing_scale\":null,\"edit_discount\":\"shift+i\",\"edit_order_tax\":\"shift+t\",\"add_payment_row\":\"shift+r\",\"finalize_payment\":\"shift+f\",\"add_new_product\":\"f4\"}}', '{\"amount_rounding_method\":null,\"enable_transaction_date\":\"1\",\"show_credit_sale_button\":\"1\",\"disable_pay_checkout\":0,\"disable_draft\":0,\"disable_express_checkout\":0,\"hide_product_suggestion\":0,\"hide_recent_trans\":0,\"disable_discount\":0,\"disable_order_tax\":0,\"is_pos_subtotal_editable\":0}', '{\"label_prefix\":null,\"product_sku_length\":\"4\",\"qty_length\":\"3\",\"qty_length_decimal\":\"2\"}', 1, 1, 1, 1, 1, 0, 5, 0, 0, 0, 0, 1, NULL, 1, 0, 'before', '[\"purchases\",\"add_sale\",\"pos_sale\",\"stock_transfers\",\"stock_adjustment\",\"expenses\",\"account\"]', 'm/d/Y', '24', '{\"purchase\":\"PO\",\"purchase_return\":null,\"stock_transfer\":\"ST\",\"stock_adjustment\":\"SA\",\"sell_return\":\"CN\",\"expense\":\"EP\",\"contacts\":\"CO\",\"purchase_payment\":\"PP\",\"sell_payment\":\"SP\",\"expense_payment\":null,\"business_location\":\"BL\",\"username\":null,\"subscription\":null}', NULL, NULL, 0, NULL, '1.0000', '1.0000', NULL, '1.0000', '1.0000', NULL, NULL, NULL, 'year', '{\"mail_driver\":\"smtp\",\"mail_host\":null,\"mail_port\":null,\"mail_username\":null,\"mail_password\":null,\"mail_encryption\":null,\"mail_from_address\":null,\"mail_from_name\":null}', '{\"url\":null,\"send_to_param_name\":\"to\",\"msg_param_name\":\"text\",\"request_method\":\"post\",\"param_1\":null,\"param_val_1\":null,\"param_2\":null,\"param_val_2\":null,\"param_3\":null,\"param_val_3\":null,\"param_4\":null,\"param_val_4\":null,\"param_5\":null,\"param_val_5\":null,\"param_6\":null,\"param_val_6\":null,\"param_7\":null,\"param_val_7\":null,\"param_8\":null,\"param_val_8\":null,\"param_9\":null,\"param_val_9\":null,\"param_10\":null,\"param_val_10\":null}', '{\"payments\":{\"custom_pay_1\":\"Mpesa_Till\",\"custom_pay_2\":null,\"custom_pay_3\":null},\"contact\":{\"custom_field_1\":null,\"custom_field_2\":null,\"custom_field_3\":null,\"custom_field_4\":null},\"product\":{\"custom_field_1\":null,\"custom_field_2\":null,\"custom_field_3\":null,\"custom_field_4\":null},\"location\":{\"custom_field_1\":null,\"custom_field_2\":null,\"custom_field_3\":null,\"custom_field_4\":null},\"user\":{\"custom_field_1\":null,\"custom_field_2\":null,\"custom_field_3\":null,\"custom_field_4\":null},\"purchase\":{\"custom_field_1\":null,\"custom_field_2\":null,\"custom_field_3\":null,\"custom_field_4\":null},\"sell\":{\"custom_field_1\":null,\"custom_field_2\":null,\"custom_field_3\":null,\"custom_field_4\":null},\"types_of_service\":{\"custom_field_1\":null,\"custom_field_2\":null,\"custom_field_3\":null,\"custom_field_4\":null}}', '{\"default_datatable_page_entries\":\"25\"}', 1, '2023-05-30 00:03:44', '2023-06-17 13:36:33'),
(4, 'JURGEN HOLDINGS LTD', 133, '2023-06-01', NULL, NULL, NULL, NULL, NULL, 25.00, 10, 'Africa/Nairobi', 1, 'fifo', NULL, 'includes', NULL, NULL, 0, 'add_expiry', 'keep_selling', 0, 1, 0, NULL, '1.000', 30, 30, '{\"pos\":{\"express_checkout\":\"shift+e\",\"pay_n_ckeckout\":\"shift+p\",\"draft\":\"shift+d\",\"cancel\":\"shift+c\",\"edit_discount\":\"shift+i\",\"edit_order_tax\":\"shift+t\",\"add_payment_row\":\"shift+r\",\"finalize_payment\":\"shift+f\",\"recent_product_quantity\":\"f2\",\"add_new_product\":\"f4\"}}', NULL, '', 1, 1, 1, 1, 1, 0, NULL, 0, 0, 0, 0, 1, NULL, 1, 0, 'before', '[\"purchases\",\"add_sale\",\"pos_sale\",\"stock_transfers\",\"stock_adjustment\",\"expenses\"]', 'm/d/Y', '24', '{\"purchase\":\"PO\",\"stock_transfer\":\"ST\",\"stock_adjustment\":\"SA\",\"sell_return\":\"CN\",\"expense\":\"EP\",\"contacts\":\"CO\",\"purchase_payment\":\"PP\",\"sell_payment\":\"SP\",\"business_location\":\"BL\"}', NULL, NULL, 0, NULL, '1.0000', '1.0000', NULL, '1.0000', '1.0000', NULL, NULL, NULL, 'year', NULL, NULL, NULL, NULL, 1, '2023-06-13 13:27:15', '2023-06-13 13:27:15');

-- --------------------------------------------------------

--
-- Table structure for table `business_locations`
--

CREATE TABLE `business_locations` (
  `id` int UNSIGNED NOT NULL,
  `business_id` int UNSIGNED NOT NULL,
  `location_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `landmark` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `country` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `zip_code` char(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `invoice_scheme_id` int UNSIGNED NOT NULL,
  `invoice_layout_id` int UNSIGNED NOT NULL,
  `selling_price_group_id` int DEFAULT NULL,
  `print_receipt_on_invoice` tinyint(1) DEFAULT '1',
  `receipt_printer_type` enum('browser','printer') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'browser',
  `printer_id` int DEFAULT NULL,
  `mobile` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alternate_number` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `website` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `featured_products` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `default_payment_accounts` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `custom_field1` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field2` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field3` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field4` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `business_locations`
--

INSERT INTO `business_locations` (`id`, `business_id`, `location_id`, `name`, `landmark`, `country`, `state`, `city`, `zip_code`, `invoice_scheme_id`, `invoice_layout_id`, `selling_price_group_id`, `print_receipt_on_invoice`, `receipt_printer_type`, `printer_id`, `mobile`, `alternate_number`, `email`, `website`, `featured_products`, `is_active`, `default_payment_accounts`, `custom_field1`, `custom_field2`, `custom_field3`, `custom_field4`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 2, 'BL0001', 'MCFRIES GOURMET', 'LIMURU', 'KENYA', 'Nairobi', 'LIMURU', '254', 1, 1, NULL, 1, 'browser', NULL, '', '', '', '', NULL, 1, '{\"cash\":{\"is_enabled\":1,\"account\":null},\"card\":{\"is_enabled\":1,\"account\":null},\"cheque\":{\"is_enabled\":1,\"account\":null},\"bank_transfer\":{\"is_enabled\":1,\"account\":null},\"other\":{\"is_enabled\":1,\"account\":null},\"custom_pay_1\":{\"is_enabled\":1,\"account\":null},\"custom_pay_2\":{\"is_enabled\":1,\"account\":null},\"custom_pay_3\":{\"is_enabled\":1,\"account\":null}}', NULL, NULL, NULL, NULL, NULL, '2022-10-13 17:35:41', '2022-10-13 17:35:41'),
(2, 3, 'BL0001', 'ORITSU KENYA', 'Platinum Plaza,Ground Floor Shop G14', 'KENYA', 'NAIROBI', 'NAIROBI', '254', 2, 2, 0, 1, 'browser', NULL, '0725125396', '0724475495', NULL, NULL, NULL, 1, '{\"cash\":{\"is_enabled\":\"1\",\"account\":null},\"card\":{\"account\":null},\"cheque\":{\"account\":null},\"bank_transfer\":{\"account\":null},\"other\":{\"account\":null},\"custom_pay_1\":{\"is_enabled\":\"1\",\"account\":null},\"custom_pay_2\":{\"account\":null},\"custom_pay_3\":{\"account\":null}}', NULL, NULL, NULL, NULL, NULL, '2023-05-30 00:03:44', '2023-06-01 11:40:47'),
(3, 4, 'BL0001', 'JURGEN HOLDINGS LTD', 'SIAYA', 'KENYA', 'SIAYA', 'SIAYA', '254', 3, 3, NULL, 1, 'browser', NULL, '0721205055', '', '', '', NULL, 1, '{\"cash\":{\"is_enabled\":1,\"account\":null},\"card\":{\"is_enabled\":1,\"account\":null},\"cheque\":{\"is_enabled\":1,\"account\":null},\"bank_transfer\":{\"is_enabled\":1,\"account\":null},\"other\":{\"is_enabled\":1,\"account\":null},\"custom_pay_1\":{\"is_enabled\":1,\"account\":null},\"custom_pay_2\":{\"is_enabled\":1,\"account\":null},\"custom_pay_3\":{\"is_enabled\":1,\"account\":null}}', NULL, NULL, NULL, NULL, NULL, '2023-06-13 13:27:15', '2023-06-13 13:27:15'),
(4, 4, 'BL0002', 'Transit-KCB', NULL, 'SIAYA', 'SIAYA', 'SIAYA', '254', 3, 3, 0, 1, 'browser', NULL, '07656667', NULL, NULL, NULL, NULL, 1, '{\"cash\":{\"is_enabled\":\"1\"},\"card\":{\"is_enabled\":\"1\"},\"cheque\":{\"is_enabled\":\"1\"},\"bank_transfer\":{\"is_enabled\":\"1\"},\"other\":{\"is_enabled\":\"1\"},\"custom_pay_1\":{\"is_enabled\":\"1\"},\"custom_pay_2\":{\"is_enabled\":\"1\"},\"custom_pay_3\":{\"is_enabled\":\"1\"}}', NULL, NULL, NULL, NULL, NULL, '2023-06-13 13:00:01', '2023-06-13 13:00:01');

-- --------------------------------------------------------

--
-- Table structure for table `cash_registers`
--

CREATE TABLE `cash_registers` (
  `id` int UNSIGNED NOT NULL,
  `business_id` int UNSIGNED NOT NULL,
  `location_id` int DEFAULT NULL,
  `user_id` int UNSIGNED DEFAULT NULL,
  `status` enum('close','open') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'open',
  `closed_at` datetime DEFAULT NULL,
  `closing_amount` decimal(22,4) NOT NULL DEFAULT '0.0000',
  `total_card_slips` int NOT NULL DEFAULT '0',
  `total_cheques` int NOT NULL DEFAULT '0',
  `closing_note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cash_registers`
--

INSERT INTO `cash_registers` (`id`, `business_id`, `location_id`, `user_id`, `status`, `closed_at`, `closing_amount`, `total_card_slips`, `total_cheques`, `closing_note`, `created_at`, `updated_at`) VALUES
(1, 2, 1, 2, 'open', NULL, '0.0000', 0, 0, NULL, '2022-10-13 17:45:00', '2022-10-13 17:45:20'),
(2, 2, 1, 5, 'open', NULL, '0.0000', 0, 0, NULL, '2022-10-22 11:17:00', '2022-10-22 11:17:55'),
(3, 2, 1, 7, 'open', NULL, '0.0000', 0, 0, NULL, '2023-05-16 16:35:00', '2023-05-16 16:35:32'),
(4, 3, 2, 8, 'open', NULL, '0.0000', 0, 0, NULL, '2023-05-30 13:11:00', '2023-05-30 13:11:40'),
(5, 3, 2, 9, 'close', '2023-06-01 09:36:05', '2100.0000', 0, 0, NULL, '2023-05-31 11:41:00', '2023-06-01 09:36:05'),
(6, 3, 2, 9, 'open', NULL, '0.0000', 0, 0, NULL, '2023-06-01 09:37:00', '2023-06-01 09:37:12'),
(7, 4, 3, 10, 'open', NULL, '0.0000', 0, 0, NULL, '2023-06-13 12:57:00', '2023-06-13 12:57:34'),
(8, 4, 4, 11, 'open', NULL, '0.0000', 0, 0, NULL, '2023-06-14 08:35:00', '2023-06-14 08:35:47');

-- --------------------------------------------------------

--
-- Table structure for table `cash_register_transactions`
--

CREATE TABLE `cash_register_transactions` (
  `id` int UNSIGNED NOT NULL,
  `cash_register_id` int UNSIGNED NOT NULL,
  `amount` decimal(22,4) NOT NULL DEFAULT '0.0000',
  `pay_method` enum('cash','card','cheque','bank_transfer','custom_pay_1','custom_pay_2','custom_pay_3','other') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` enum('debit','credit') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `transaction_type` enum('initial','sell','transfer','refund') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `transaction_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cash_register_transactions`
--

INSERT INTO `cash_register_transactions` (`id`, `cash_register_id`, `amount`, `pay_method`, `type`, `transaction_type`, `transaction_id`, `created_at`, `updated_at`) VALUES
(1, 1, '0.0000', 'cash', 'credit', 'initial', NULL, '2022-10-13 17:45:20', '2022-10-13 17:45:20'),
(2, 1, '125.0000', 'cash', 'credit', 'sell', 3, '2022-10-13 19:12:55', '2022-10-13 19:12:55'),
(3, 1, '0.0000', 'cash', 'credit', 'sell', 3, '2022-10-13 19:12:55', '2022-10-13 19:12:55'),
(4, 2, '250.0000', 'cash', 'credit', 'initial', NULL, '2022-10-22 11:17:55', '2022-10-22 11:17:55'),
(5, 2, '200.0000', 'cash', 'credit', 'sell', 19, '2022-10-22 11:51:17', '2022-10-22 11:51:17'),
(6, 2, '0.0000', 'cash', 'credit', 'sell', 19, '2022-10-22 11:51:17', '2022-10-22 11:51:17'),
(7, 2, '80.0000', 'cash', 'credit', 'sell', 20, '2022-10-22 11:52:45', '2022-10-22 11:52:45'),
(8, 2, '0.0000', 'cash', 'credit', 'sell', 20, '2022-10-22 11:52:45', '2022-10-22 11:52:45'),
(9, 2, '160.0000', 'cash', 'credit', 'sell', 21, '2022-10-22 11:53:16', '2022-10-22 11:53:16'),
(10, 2, '0.0000', 'cash', 'credit', 'sell', 21, '2022-10-22 11:53:16', '2022-10-22 11:53:16'),
(11, 2, '100.0000', 'cash', 'credit', 'sell', 22, '2022-10-22 11:54:09', '2022-10-22 11:54:09'),
(12, 2, '0.0000', 'cash', 'credit', 'sell', 22, '2022-10-22 11:54:09', '2022-10-22 11:54:09'),
(13, 2, '150.0000', 'cash', 'credit', 'sell', 23, '2022-10-22 11:56:44', '2022-10-22 11:56:44'),
(14, 2, '0.0000', 'cash', 'credit', 'sell', 23, '2022-10-22 11:56:44', '2022-10-22 11:56:44'),
(15, 2, '120.0000', 'cash', 'credit', 'sell', 24, '2022-10-22 12:08:06', '2022-10-22 12:08:06'),
(16, 2, '0.0000', 'cash', 'credit', 'sell', 24, '2022-10-22 12:08:06', '2022-10-22 12:08:06'),
(17, 2, '30.0000', 'cash', 'credit', 'sell', 25, '2022-10-22 12:08:46', '2022-10-22 12:08:46'),
(18, 2, '0.0000', 'cash', 'credit', 'sell', 25, '2022-10-22 12:08:46', '2022-10-22 12:08:46'),
(19, 2, '220.0000', 'cash', 'credit', 'sell', 26, '2022-10-22 12:09:27', '2022-10-22 12:09:27'),
(20, 2, '0.0000', 'cash', 'credit', 'sell', 26, '2022-10-22 12:09:27', '2022-10-22 12:09:27'),
(21, 2, '80.0000', 'cash', 'credit', 'sell', 27, '2022-10-22 12:09:56', '2022-10-22 12:09:56'),
(22, 2, '0.0000', 'cash', 'credit', 'sell', 27, '2022-10-22 12:09:56', '2022-10-22 12:09:56'),
(23, 2, '160.0000', 'cash', 'credit', 'sell', 28, '2022-10-22 12:14:55', '2022-10-22 12:14:55'),
(24, 2, '0.0000', 'cash', 'credit', 'sell', 28, '2022-10-22 12:14:55', '2022-10-22 12:14:55'),
(25, 2, '250.0000', 'custom_pay_1', 'credit', 'sell', 30, '2022-10-22 12:24:33', '2022-10-22 12:24:33'),
(26, 2, '0.0000', 'cash', 'credit', 'sell', 30, '2022-10-22 12:24:33', '2022-10-22 12:24:33'),
(27, 2, '160.0000', 'cash', 'credit', 'sell', 36, '2022-10-22 14:45:30', '2022-10-22 14:45:30'),
(28, 2, '0.0000', 'cash', 'credit', 'sell', 36, '2022-10-22 14:45:30', '2022-10-22 14:45:30'),
(29, 1, '210.0000', 'cash', 'credit', 'sell', 37, '2022-11-10 10:05:04', '2022-11-10 10:05:04'),
(30, 1, '0.0000', 'cash', 'credit', 'sell', 37, '2022-11-10 10:05:04', '2022-11-10 10:05:04'),
(31, 1, '480.0000', 'cash', 'credit', 'sell', 39, '2023-05-16 15:53:38', '2023-05-16 15:53:38'),
(32, 1, '0.0000', 'cash', 'credit', 'sell', 39, '2023-05-16 15:53:38', '2023-05-16 15:53:38'),
(33, 1, '140.0000', 'cash', 'credit', 'sell', 41, '2023-05-16 16:09:54', '2023-05-16 16:09:54'),
(34, 1, '0.0000', 'cash', 'credit', 'sell', 41, '2023-05-16 16:09:54', '2023-05-16 16:09:54'),
(35, 3, '100.0000', 'cash', 'credit', 'initial', NULL, '2023-05-16 16:35:32', '2023-05-16 16:35:32'),
(36, 3, '390.0000', 'cash', 'credit', 'sell', 42, '2023-05-16 18:29:10', '2023-05-16 18:29:10'),
(37, 3, '0.0000', 'cash', 'credit', 'sell', 42, '2023-05-16 18:29:10', '2023-05-16 18:29:10'),
(38, 4, '0.0000', 'cash', 'credit', 'initial', NULL, '2023-05-30 13:11:40', '2023-05-30 13:11:40'),
(39, 5, '1300.0000', 'cash', 'credit', 'initial', NULL, '2023-05-31 11:41:31', '2023-05-31 11:41:31'),
(40, 5, '200.0000', 'custom_pay_1', 'credit', 'sell', 304, '2023-05-31 12:04:13', '2023-05-31 12:04:13'),
(41, 5, '0.0000', 'cash', 'credit', 'sell', 304, '2023-05-31 12:04:13', '2023-05-31 12:04:13'),
(42, 5, '200.0000', 'custom_pay_1', 'credit', 'sell', 305, '2023-05-31 13:49:40', '2023-05-31 13:49:40'),
(43, 5, '0.0000', 'cash', 'credit', 'sell', 305, '2023-05-31 13:49:40', '2023-05-31 13:49:40'),
(44, 5, '350.0000', 'custom_pay_1', 'credit', 'sell', 307, '2023-05-31 14:25:05', '2023-05-31 14:25:05'),
(45, 5, '0.0000', 'cash', 'credit', 'sell', 307, '2023-05-31 14:25:05', '2023-05-31 14:25:05'),
(46, 5, '300.0000', 'cash', 'credit', 'sell', 310, '2023-05-31 18:26:09', '2023-05-31 18:26:09'),
(47, 5, '0.0000', 'cash', 'credit', 'sell', 310, '2023-05-31 18:26:09', '2023-05-31 18:26:09'),
(48, 5, '500.0000', 'cash', 'credit', 'sell', 311, '2023-05-31 19:24:59', '2023-05-31 19:24:59'),
(49, 5, '0.0000', 'cash', 'credit', 'sell', 311, '2023-05-31 19:24:59', '2023-05-31 19:24:59'),
(50, 6, '1800.0000', 'cash', 'credit', 'initial', NULL, '2023-06-01 09:37:12', '2023-06-01 09:37:12'),
(51, 6, '4500.0000', 'custom_pay_1', 'credit', 'sell', 312, '2023-06-01 12:20:14', '2023-06-01 12:20:14'),
(52, 6, '0.0000', 'cash', 'credit', 'sell', 312, '2023-06-01 12:20:14', '2023-06-01 12:20:14'),
(53, 6, '200.0000', 'custom_pay_1', 'credit', 'sell', 313, '2023-06-01 14:10:29', '2023-06-01 14:10:29'),
(54, 6, '0.0000', 'cash', 'credit', 'sell', 313, '2023-06-01 14:10:29', '2023-06-01 14:10:29'),
(55, 6, '3500.0000', 'cash', 'credit', 'sell', 314, '2023-06-01 18:24:34', '2023-06-01 18:24:34'),
(56, 6, '0.0000', 'cash', 'credit', 'sell', 314, '2023-06-01 18:24:34', '2023-06-01 18:24:34'),
(57, 6, '1100.0000', 'custom_pay_1', 'credit', 'sell', 315, '2023-06-02 18:46:44', '2023-06-02 18:46:44'),
(58, 6, '0.0000', 'cash', 'credit', 'sell', 315, '2023-06-02 18:46:44', '2023-06-02 18:46:44'),
(59, 6, '3000.0000', 'custom_pay_1', 'credit', 'sell', 392, '2023-06-03 11:53:42', '2023-06-03 11:53:42'),
(60, 6, '0.0000', 'cash', 'credit', 'sell', 392, '2023-06-03 11:53:42', '2023-06-03 11:53:42'),
(61, 6, '4000.0000', 'cash', 'credit', 'sell', 396, '2023-06-03 15:13:46', '2023-06-03 15:13:46'),
(62, 6, '0.0000', 'cash', 'credit', 'sell', 396, '2023-06-03 15:13:46', '2023-06-03 15:13:46'),
(63, 6, '300.0000', 'cash', 'credit', 'sell', 399, '2023-06-03 17:09:08', '2023-06-03 17:09:08'),
(64, 6, '0.0000', 'cash', 'credit', 'sell', 399, '2023-06-03 17:09:08', '2023-06-03 17:09:08'),
(65, 6, '1300.0000', 'custom_pay_1', 'credit', 'sell', 400, '2023-06-05 15:02:11', '2023-06-05 15:02:11'),
(66, 6, '0.0000', 'cash', 'credit', 'sell', 400, '2023-06-05 15:02:11', '2023-06-05 15:02:11'),
(67, 6, '250.0000', 'custom_pay_1', 'credit', 'sell', 407, '2023-06-08 09:58:56', '2023-06-08 09:58:56'),
(68, 6, '0.0000', 'cash', 'credit', 'sell', 407, '2023-06-08 09:58:56', '2023-06-08 09:58:56'),
(69, 6, '600.0000', 'cash', 'credit', 'sell', 408, '2023-06-08 13:09:58', '2023-06-08 13:09:58'),
(70, 6, '0.0000', 'cash', 'credit', 'sell', 408, '2023-06-08 13:09:58', '2023-06-08 13:09:58'),
(71, 6, '500.0000', 'custom_pay_1', 'credit', 'sell', 409, '2023-06-08 18:14:30', '2023-06-08 18:14:30'),
(72, 6, '0.0000', 'cash', 'credit', 'sell', 409, '2023-06-08 18:14:30', '2023-06-08 18:14:30'),
(73, 6, '150.0000', 'cash', 'credit', 'sell', 411, '2023-06-08 18:45:53', '2023-06-08 18:45:53'),
(74, 6, '0.0000', 'cash', 'credit', 'sell', 411, '2023-06-08 18:45:53', '2023-06-08 18:45:53'),
(75, 6, '5500.0000', 'custom_pay_1', 'credit', 'sell', 412, '2023-06-09 17:52:03', '2023-06-09 17:52:03'),
(76, 6, '0.0000', 'cash', 'credit', 'sell', 412, '2023-06-09 17:52:03', '2023-06-09 17:52:03'),
(77, 6, '1100.0000', 'cash', 'credit', 'sell', 414, '2023-06-12 14:40:11', '2023-06-12 14:40:11'),
(78, 6, '0.0000', 'cash', 'credit', 'sell', 414, '2023-06-12 14:40:11', '2023-06-12 14:40:11'),
(79, 6, '300.0000', 'cash', 'credit', 'sell', 415, '2023-06-12 17:10:26', '2023-06-12 17:10:26'),
(80, 6, '0.0000', 'cash', 'credit', 'sell', 415, '2023-06-12 17:10:26', '2023-06-12 17:10:26'),
(81, 6, '6500.0000', 'custom_pay_1', 'credit', 'sell', 416, '2023-06-13 11:42:43', '2023-06-13 11:42:43'),
(82, 6, '0.0000', 'cash', 'credit', 'sell', 416, '2023-06-13 11:42:43', '2023-06-13 11:42:43'),
(83, 7, '0.0000', 'cash', 'credit', 'initial', NULL, '2023-06-13 12:57:34', '2023-06-13 12:57:34'),
(84, 7, '800.0000', 'cash', 'credit', 'sell', 449, '2023-06-13 12:58:08', '2023-06-13 12:58:08'),
(85, 7, '0.0000', 'cash', 'credit', 'sell', 449, '2023-06-13 12:58:08', '2023-06-13 12:58:08'),
(86, 6, '200.0000', 'custom_pay_1', 'credit', 'sell', 450, '2023-06-13 18:09:24', '2023-06-13 18:09:24'),
(87, 6, '0.0000', 'cash', 'credit', 'sell', 450, '2023-06-13 18:09:24', '2023-06-13 18:09:24'),
(88, 6, '5000.0000', 'cash', 'credit', 'sell', 451, '2023-06-13 18:13:23', '2023-06-13 18:13:23'),
(89, 6, '0.0000', 'cash', 'credit', 'sell', 451, '2023-06-13 18:13:23', '2023-06-13 18:13:23'),
(90, 8, '0.0000', 'cash', 'credit', 'initial', NULL, '2023-06-14 08:35:47', '2023-06-14 08:35:47'),
(91, 6, '6500.0000', 'custom_pay_1', 'credit', 'sell', 456, '2023-06-14 12:00:40', '2023-06-14 12:00:40'),
(92, 6, '0.0000', 'cash', 'credit', 'sell', 456, '2023-06-14 12:00:40', '2023-06-14 12:00:40'),
(93, 6, '1200.0000', 'custom_pay_1', 'credit', 'sell', 457, '2023-06-15 12:10:40', '2023-06-15 12:10:40'),
(94, 6, '0.0000', 'cash', 'credit', 'sell', 457, '2023-06-15 12:10:40', '2023-06-15 12:10:40'),
(95, 6, '250.0000', 'custom_pay_1', 'credit', 'sell', 458, '2023-06-16 09:14:06', '2023-06-16 09:14:06'),
(96, 6, '0.0000', 'cash', 'credit', 'sell', 458, '2023-06-16 09:14:06', '2023-06-16 09:14:06'),
(97, 6, '1350.0000', 'cash', 'credit', 'sell', 459, '2023-06-16 18:43:57', '2023-06-16 18:43:57'),
(98, 6, '0.0000', 'cash', 'credit', 'sell', 459, '2023-06-16 18:43:57', '2023-06-16 18:43:57');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `business_id` int UNSIGNED NOT NULL,
  `short_code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int NOT NULL,
  `created_by` int UNSIGNED NOT NULL,
  `category_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `slug` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `business_id`, `short_code`, `parent_id`, `created_by`, `category_type`, `description`, `slug`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'BITES', 2, 'BT', 0, 2, 'product', NULL, NULL, NULL, '2022-10-13 17:41:43', '2022-10-22 10:43:03'),
(2, 'HOT DRINKS', 2, 'HD', 0, 2, 'product', NULL, NULL, NULL, '2022-10-13 17:41:58', '2022-10-22 10:42:48'),
(3, 'CHICKEN', 2, 'CHK', 0, 2, 'product', NULL, NULL, NULL, '2022-10-13 17:42:13', '2022-10-13 17:42:13'),
(4, 'MEALS', 2, 'ML', 0, 2, 'product', NULL, NULL, NULL, '2022-10-22 10:43:35', '2022-10-22 10:43:35'),
(5, 'SOFT DRINKS', 2, 'SD', 0, 2, 'product', NULL, NULL, NULL, '2022-10-22 13:05:30', '2022-10-22 13:05:30'),
(6, 'MARBLE COVER', 3, 'MC', 0, 8, 'product', NULL, NULL, NULL, '2023-05-30 11:35:09', '2023-05-30 11:35:09'),
(7, 'CABLES', 3, 'CB', 0, 8, 'product', NULL, NULL, NULL, '2023-05-30 11:35:38', '2023-05-30 11:35:38'),
(8, 'LEATHER COVER', 3, 'LC', 0, 8, 'product', NULL, NULL, NULL, '2023-05-30 11:42:32', '2023-05-30 11:42:32'),
(9, 'CHARGERS', 3, 'CHS', 0, 8, 'product', NULL, NULL, NULL, '2023-05-30 11:43:24', '2023-05-30 11:43:24'),
(10, 'HEADPHONES', 3, 'HDP', 0, 8, 'product', NULL, NULL, NULL, '2023-05-31 10:33:27', '2023-05-31 10:33:27'),
(11, 'EARPHONES', 3, 'EPH', 0, 8, 'product', NULL, NULL, NULL, '2023-05-31 10:34:19', '2023-05-31 10:34:19'),
(12, 'NECKBANDS', 3, 'NBD', 0, 8, 'product', NULL, NULL, NULL, '2023-05-31 10:35:31', '2023-05-31 10:35:31'),
(13, 'EARBUDS', 3, 'ERD', 0, 8, 'product', NULL, NULL, NULL, '2023-05-31 10:36:35', '2023-05-31 10:36:35'),
(14, 'SMART WATCH CHARGER', 3, 'SWC', 0, 8, 'product', NULL, NULL, NULL, '2023-05-31 10:37:49', '2023-05-31 10:37:49'),
(15, 'MOUSE', 3, 'MS', 0, 8, 'product', NULL, NULL, NULL, '2023-05-31 10:38:18', '2023-05-31 10:38:18'),
(16, 'BORNE CONDUCTORS', 3, 'BD', 0, 8, 'product', NULL, NULL, NULL, '2023-05-31 10:39:11', '2023-05-31 10:39:11'),
(17, 'POWER BANKS', 3, 'PB', 0, 8, 'product', NULL, NULL, NULL, '2023-05-31 10:39:59', '2023-05-31 10:39:59'),
(18, 'ADAPTERS', 3, 'ADP', 0, 8, 'product', NULL, NULL, NULL, '2023-05-31 10:40:35', '2023-05-31 10:40:35'),
(19, 'CAR MODULATORS', 3, 'CM', 0, 8, 'product', NULL, NULL, NULL, '2023-05-31 10:42:47', '2023-05-31 10:42:47'),
(20, 'SMART WATCHES', 3, 'SW', 0, 8, 'product', NULL, NULL, NULL, '2023-05-31 10:43:52', '2023-05-31 10:43:52'),
(21, 'HOLDER', 3, 'HD', 0, 8, 'product', NULL, NULL, NULL, '2023-05-31 10:44:26', '2023-05-31 10:44:26'),
(22, 'GAME CONTROLLERS', 3, 'GC', 0, 8, 'product', NULL, NULL, NULL, '2023-05-31 10:45:03', '2023-05-31 10:45:03'),
(23, 'PROTECTORS', 3, 'SP', 0, 9, 'product', NULL, NULL, NULL, '2023-05-31 14:35:42', '2023-06-03 11:19:26'),
(24, 'RGB/GLASS', 4, 'RG', 0, 10, 'product', NULL, NULL, NULL, '2023-06-13 11:40:38', '2023-06-13 11:40:38'),
(25, 'PETS', 4, 'PC', 0, 10, 'product', NULL, NULL, NULL, '2023-06-13 11:41:05', '2023-06-13 11:43:58'),
(26, 'WATER', 4, 'WT', 0, 10, 'product', NULL, NULL, NULL, '2023-06-13 11:41:38', '2023-06-13 11:41:38'),
(27, 'ENERGY', 4, 'EN', 0, 10, 'product', NULL, NULL, NULL, '2023-06-13 11:42:07', '2023-06-13 11:42:07');

-- --------------------------------------------------------

--
-- Table structure for table `categorizables`
--

CREATE TABLE `categorizables` (
  `category_id` int NOT NULL,
  `categorizable_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `categorizable_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `id` int UNSIGNED NOT NULL,
  `business_id` int UNSIGNED NOT NULL,
  `type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `supplier_business_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `prefix` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `first_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `middle_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_status` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `tax_number` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address_line_1` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `address_line_2` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `zip_code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `mobile` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `landline` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alternate_number` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pay_term_number` int DEFAULT NULL,
  `pay_term_type` enum('days','months') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `credit_limit` decimal(22,4) DEFAULT NULL,
  `created_by` int UNSIGNED NOT NULL,
  `total_rp` int NOT NULL DEFAULT '0' COMMENT 'rp is the short form of reward points',
  `total_rp_used` int NOT NULL DEFAULT '0' COMMENT 'rp is the short form of reward points',
  `total_rp_expired` int NOT NULL DEFAULT '0' COMMENT 'rp is the short form of reward points',
  `is_default` tinyint(1) NOT NULL DEFAULT '0',
  `shipping_address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `position` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_group_id` int DEFAULT NULL,
  `custom_field1` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field2` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field3` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field4` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`id`, `business_id`, `type`, `supplier_business_name`, `name`, `prefix`, `first_name`, `middle_name`, `last_name`, `email`, `contact_id`, `contact_status`, `tax_number`, `city`, `state`, `country`, `address_line_1`, `address_line_2`, `zip_code`, `dob`, `mobile`, `landline`, `alternate_number`, `pay_term_number`, `pay_term_type`, `credit_limit`, `created_by`, `total_rp`, `total_rp_used`, `total_rp_expired`, `is_default`, `shipping_address`, `position`, `customer_group_id`, `custom_field1`, `custom_field2`, `custom_field3`, `custom_field4`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 2, 'customer', NULL, 'Walk-In Customer', NULL, NULL, NULL, NULL, NULL, 'CO0001', 'active', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, 2, 0, 0, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-10-13 17:35:41', '2022-10-13 17:35:41'),
(2, 3, 'customer', NULL, 'Walk-In Customer', NULL, NULL, NULL, NULL, NULL, 'CO0001', 'active', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, 8, 0, 0, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-30 00:03:44', '2023-05-30 00:03:44'),
(3, 3, 'customer', NULL, 'Mr Mwaura  ', 'Mr', 'Mwaura', NULL, NULL, NULL, 'CO0002', 'active', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0725263425', NULL, NULL, NULL, NULL, NULL, 9, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-31 14:55:57', '2023-05-31 14:55:57'),
(4, 3, 'supplier', 'Fadecent Kenya', ' GITHERE  ', NULL, 'GITHERE', NULL, NULL, NULL, 'CO0003', 'active', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0722289640', NULL, NULL, NULL, NULL, NULL, 9, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-31 15:31:56', '2023-05-31 15:31:56'),
(5, 3, 'customer', NULL, ' Kennedy Gachihi Mwangi', NULL, 'Kennedy', 'Gachihi', 'Mwangi', NULL, 'CO0004', 'active', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0724429281', NULL, NULL, NULL, NULL, NULL, 9, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-06-01 12:19:25', '2023-06-01 12:19:25'),
(6, 3, 'customer', NULL, ' Janiffer  ', NULL, 'Janiffer', NULL, NULL, NULL, 'CO0005', 'active', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0725125396', NULL, NULL, NULL, NULL, '0.0000', 9, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-06-03 11:52:58', '2023-06-03 15:20:30'),
(7, 3, 'customer', NULL, ' Ndirangu Maina  ', NULL, 'Ndirangu Maina', NULL, NULL, NULL, 'CO0006', 'active', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0724475495', NULL, NULL, NULL, NULL, NULL, 9, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-06-03 11:56:59', '2023-06-03 11:56:59'),
(8, 3, 'supplier', 'Yuko Glass LCD', 'Miss Yuki Glass ', 'Miss', 'Yuki', 'Glass', NULL, NULL, 'CO0007', 'active', NULL, NULL, NULL, 'China', NULL, NULL, NULL, NULL, '+86552063', NULL, NULL, NULL, NULL, NULL, 9, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-06-03 12:55:31', '2023-06-03 12:55:31'),
(9, 3, 'supplier', 'Voma Bluetooth', 'Mr Weke Voma Bluetooth ', 'Mr', 'Weke', 'Voma Bluetooth', NULL, NULL, 'CO0008', 'active', NULL, NULL, NULL, 'China', NULL, NULL, NULL, NULL, '+86000065', NULL, NULL, NULL, NULL, NULL, 9, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-06-03 12:58:54', '2023-06-03 12:58:54'),
(10, 4, 'customer', NULL, 'Walk-In Customer', NULL, NULL, NULL, NULL, NULL, 'CO0001', 'active', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, 10, 0, 0, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-06-13 13:27:15', '2023-06-13 13:27:15');

-- --------------------------------------------------------

--
-- Table structure for table `currencies`
--

CREATE TABLE `currencies` (
  `id` int UNSIGNED NOT NULL,
  `country` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `symbol` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `thousand_separator` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `decimal_separator` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `currencies`
--

INSERT INTO `currencies` (`id`, `country`, `currency`, `code`, `symbol`, `thousand_separator`, `decimal_separator`, `created_at`, `updated_at`) VALUES
(1, 'Albania', 'Leke', 'ALL', 'Lek', ',', '.', NULL, NULL),
(2, 'America', 'Dollars', 'USD', '$', ',', '.', NULL, NULL),
(3, 'Afghanistan', 'Afghanis', 'AF', '؋', ',', '.', NULL, NULL),
(4, 'Argentina', 'Pesos', 'ARS', '$', ',', '.', NULL, NULL),
(5, 'Aruba', 'Guilders', 'AWG', 'ƒ', ',', '.', NULL, NULL),
(6, 'Australia', 'Dollars', 'AUD', '$', ',', '.', NULL, NULL),
(7, 'Azerbaijan', 'New Manats', 'AZ', 'ман', ',', '.', NULL, NULL),
(8, 'Bahamas', 'Dollars', 'BSD', '$', ',', '.', NULL, NULL),
(9, 'Barbados', 'Dollars', 'BBD', '$', ',', '.', NULL, NULL),
(10, 'Belarus', 'Rubles', 'BYR', 'p.', ',', '.', NULL, NULL),
(11, 'Belgium', 'Euro', 'EUR', '€', ',', '.', NULL, NULL),
(12, 'Beliz', 'Dollars', 'BZD', 'BZ$', ',', '.', NULL, NULL),
(13, 'Bermuda', 'Dollars', 'BMD', '$', ',', '.', NULL, NULL),
(14, 'Bolivia', 'Bolivianos', 'BOB', '$b', ',', '.', NULL, NULL),
(15, 'Bosnia and Herzegovina', 'Convertible Marka', 'BAM', 'KM', ',', '.', NULL, NULL),
(16, 'Botswana', 'Pula\'s', 'BWP', 'P', ',', '.', NULL, NULL),
(17, 'Bulgaria', 'Leva', 'BG', 'лв', ',', '.', NULL, NULL),
(18, 'Brazil', 'Reais', 'BRL', 'R$', ',', '.', NULL, NULL),
(19, 'Britain [United Kingdom]', 'Pounds', 'GBP', '£', ',', '.', NULL, NULL),
(20, 'Brunei Darussalam', 'Dollars', 'BND', '$', ',', '.', NULL, NULL),
(21, 'Cambodia', 'Riels', 'KHR', '៛', ',', '.', NULL, NULL),
(22, 'Canada', 'Dollars', 'CAD', '$', ',', '.', NULL, NULL),
(23, 'Cayman Islands', 'Dollars', 'KYD', '$', ',', '.', NULL, NULL),
(24, 'Chile', 'Pesos', 'CLP', '$', ',', '.', NULL, NULL),
(25, 'China', 'Yuan Renminbi', 'CNY', '¥', ',', '.', NULL, NULL),
(26, 'Colombia', 'Pesos', 'COP', '$', ',', '.', NULL, NULL),
(27, 'Costa Rica', 'Colón', 'CRC', '₡', ',', '.', NULL, NULL),
(28, 'Croatia', 'Kuna', 'HRK', 'kn', ',', '.', NULL, NULL),
(29, 'Cuba', 'Pesos', 'CUP', '₱', ',', '.', NULL, NULL),
(30, 'Cyprus', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(31, 'Czech Republic', 'Koruny', 'CZK', 'Kč', ',', '.', NULL, NULL),
(32, 'Denmark', 'Kroner', 'DKK', 'kr', ',', '.', NULL, NULL),
(33, 'Dominican Republic', 'Pesos', 'DOP ', 'RD$', ',', '.', NULL, NULL),
(34, 'East Caribbean', 'Dollars', 'XCD', '$', ',', '.', NULL, NULL),
(35, 'Egypt', 'Pounds', 'EGP', '£', ',', '.', NULL, NULL),
(36, 'El Salvador', 'Colones', 'SVC', '$', ',', '.', NULL, NULL),
(37, 'England [United Kingdom]', 'Pounds', 'GBP', '£', ',', '.', NULL, NULL),
(38, 'Euro', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(39, 'Falkland Islands', 'Pounds', 'FKP', '£', ',', '.', NULL, NULL),
(40, 'Fiji', 'Dollars', 'FJD', '$', ',', '.', NULL, NULL),
(41, 'France', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(42, 'Ghana', 'Cedis', 'GHC', '¢', ',', '.', NULL, NULL),
(43, 'Gibraltar', 'Pounds', 'GIP', '£', ',', '.', NULL, NULL),
(44, 'Greece', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(45, 'Guatemala', 'Quetzales', 'GTQ', 'Q', ',', '.', NULL, NULL),
(46, 'Guernsey', 'Pounds', 'GGP', '£', ',', '.', NULL, NULL),
(47, 'Guyana', 'Dollars', 'GYD', '$', ',', '.', NULL, NULL),
(48, 'Holland [Netherlands]', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(49, 'Honduras', 'Lempiras', 'HNL', 'L', ',', '.', NULL, NULL),
(50, 'Hong Kong', 'Dollars', 'HKD', '$', ',', '.', NULL, NULL),
(51, 'Hungary', 'Forint', 'HUF', 'Ft', ',', '.', NULL, NULL),
(52, 'Iceland', 'Kronur', 'ISK', 'kr', ',', '.', NULL, NULL),
(53, 'India', 'Rupees', 'INR', '₹', ',', '.', NULL, NULL),
(54, 'Indonesia', 'Rupiahs', 'IDR', 'Rp', ',', '.', NULL, NULL),
(55, 'Iran', 'Rials', 'IRR', '﷼', ',', '.', NULL, NULL),
(56, 'Ireland', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(57, 'Isle of Man', 'Pounds', 'IMP', '£', ',', '.', NULL, NULL),
(58, 'Israel', 'New Shekels', 'ILS', '₪', ',', '.', NULL, NULL),
(59, 'Italy', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(60, 'Jamaica', 'Dollars', 'JMD', 'J$', ',', '.', NULL, NULL),
(61, 'Japan', 'Yen', 'JPY', '¥', ',', '.', NULL, NULL),
(62, 'Jersey', 'Pounds', 'JEP', '£', ',', '.', NULL, NULL),
(63, 'Kazakhstan', 'Tenge', 'KZT', 'лв', ',', '.', NULL, NULL),
(64, 'Korea [North]', 'Won', 'KPW', '₩', ',', '.', NULL, NULL),
(65, 'Korea [South]', 'Won', 'KRW', '₩', ',', '.', NULL, NULL),
(66, 'Kyrgyzstan', 'Soms', 'KGS', 'лв', ',', '.', NULL, NULL),
(67, 'Laos', 'Kips', 'LAK', '₭', ',', '.', NULL, NULL),
(68, 'Latvia', 'Lati', 'LVL', 'Ls', ',', '.', NULL, NULL),
(69, 'Lebanon', 'Pounds', 'LBP', '£', ',', '.', NULL, NULL),
(70, 'Liberia', 'Dollars', 'LRD', '$', ',', '.', NULL, NULL),
(71, 'Liechtenstein', 'Switzerland Francs', 'CHF', 'CHF', ',', '.', NULL, NULL),
(72, 'Lithuania', 'Litai', 'LTL', 'Lt', ',', '.', NULL, NULL),
(73, 'Luxembourg', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(74, 'Macedonia', 'Denars', 'MKD', 'ден', ',', '.', NULL, NULL),
(75, 'Malaysia', 'Ringgits', 'MYR', 'RM', ',', '.', NULL, NULL),
(76, 'Malta', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(77, 'Mauritius', 'Rupees', 'MUR', '₨', ',', '.', NULL, NULL),
(78, 'Mexico', 'Pesos', 'MXN', '$', ',', '.', NULL, NULL),
(79, 'Mongolia', 'Tugriks', 'MNT', '₮', ',', '.', NULL, NULL),
(80, 'Mozambique', 'Meticais', 'MZ', 'MT', ',', '.', NULL, NULL),
(81, 'Namibia', 'Dollars', 'NAD', '$', ',', '.', NULL, NULL),
(82, 'Nepal', 'Rupees', 'NPR', '₨', ',', '.', NULL, NULL),
(83, 'Netherlands Antilles', 'Guilders', 'ANG', 'ƒ', ',', '.', NULL, NULL),
(84, 'Netherlands', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(85, 'New Zealand', 'Dollars', 'NZD', '$', ',', '.', NULL, NULL),
(86, 'Nicaragua', 'Cordobas', 'NIO', 'C$', ',', '.', NULL, NULL),
(87, 'Nigeria', 'Nairas', 'NG', '₦', ',', '.', NULL, NULL),
(88, 'North Korea', 'Won', 'KPW', '₩', ',', '.', NULL, NULL),
(89, 'Norway', 'Krone', 'NOK', 'kr', ',', '.', NULL, NULL),
(90, 'Oman', 'Rials', 'OMR', '﷼', ',', '.', NULL, NULL),
(91, 'Pakistan', 'Rupees', 'PKR', '₨', ',', '.', NULL, NULL),
(92, 'Panama', 'Balboa', 'PAB', 'B/.', ',', '.', NULL, NULL),
(93, 'Paraguay', 'Guarani', 'PYG', 'Gs', ',', '.', NULL, NULL),
(94, 'Peru', 'Nuevos Soles', 'PE', 'S/.', ',', '.', NULL, NULL),
(95, 'Philippines', 'Pesos', 'PHP', 'Php', ',', '.', NULL, NULL),
(96, 'Poland', 'Zlotych', 'PL', 'zł', ',', '.', NULL, NULL),
(97, 'Qatar', 'Rials', 'QAR', '﷼', ',', '.', NULL, NULL),
(98, 'Romania', 'New Lei', 'RO', 'lei', ',', '.', NULL, NULL),
(99, 'Russia', 'Rubles', 'RUB', 'руб', ',', '.', NULL, NULL),
(100, 'Saint Helena', 'Pounds', 'SHP', '£', ',', '.', NULL, NULL),
(101, 'Saudi Arabia', 'Riyals', 'SAR', '﷼', ',', '.', NULL, NULL),
(102, 'Serbia', 'Dinars', 'RSD', 'Дин.', ',', '.', NULL, NULL),
(103, 'Seychelles', 'Rupees', 'SCR', '₨', ',', '.', NULL, NULL),
(104, 'Singapore', 'Dollars', 'SGD', '$', ',', '.', NULL, NULL),
(105, 'Slovenia', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(106, 'Solomon Islands', 'Dollars', 'SBD', '$', ',', '.', NULL, NULL),
(107, 'Somalia', 'Shillings', 'SOS', 'S', ',', '.', NULL, NULL),
(108, 'South Africa', 'Rand', 'ZAR', 'R', ',', '.', NULL, NULL),
(109, 'South Korea', 'Won', 'KRW', '₩', ',', '.', NULL, NULL),
(110, 'Spain', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(111, 'Sri Lanka', 'Rupees', 'LKR', '₨', ',', '.', NULL, NULL),
(112, 'Sweden', 'Kronor', 'SEK', 'kr', ',', '.', NULL, NULL),
(113, 'Switzerland', 'Francs', 'CHF', 'CHF', ',', '.', NULL, NULL),
(114, 'Suriname', 'Dollars', 'SRD', '$', ',', '.', NULL, NULL),
(115, 'Syria', 'Pounds', 'SYP', '£', ',', '.', NULL, NULL),
(116, 'Taiwan', 'New Dollars', 'TWD', 'NT$', ',', '.', NULL, NULL),
(117, 'Thailand', 'Baht', 'THB', '฿', ',', '.', NULL, NULL),
(118, 'Trinidad and Tobago', 'Dollars', 'TTD', 'TT$', ',', '.', NULL, NULL),
(119, 'Turkey', 'Lira', 'TRY', 'TL', ',', '.', NULL, NULL),
(120, 'Turkey', 'Liras', 'TRL', '£', ',', '.', NULL, NULL),
(121, 'Tuvalu', 'Dollars', 'TVD', '$', ',', '.', NULL, NULL),
(122, 'Ukraine', 'Hryvnia', 'UAH', '₴', ',', '.', NULL, NULL),
(123, 'United Kingdom', 'Pounds', 'GBP', '£', ',', '.', NULL, NULL),
(124, 'United States of America', 'Dollars', 'USD', '$', ',', '.', NULL, NULL),
(125, 'Uruguay', 'Pesos', 'UYU', '$U', ',', '.', NULL, NULL),
(126, 'Uzbekistan', 'Sums', 'UZS', 'лв', ',', '.', NULL, NULL),
(127, 'Vatican City', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(128, 'Venezuela', 'Bolivares Fuertes', 'VEF', 'Bs', ',', '.', NULL, NULL),
(129, 'Vietnam', 'Dong', 'VND', '₫', ',', '.', NULL, NULL),
(130, 'Yemen', 'Rials', 'YER', '﷼', ',', '.', NULL, NULL),
(131, 'Zimbabwe', 'Zimbabwe Dollars', 'ZWD', 'Z$', ',', '.', NULL, NULL),
(132, 'Iraq', 'Iraqi dinar', 'IQD', 'د.ع', ',', '.', NULL, NULL),
(133, 'Kenya', 'Kenyan shilling', 'KES', 'KSh', ',', '.', NULL, NULL),
(134, 'Bangladesh', 'Taka', 'BDT', '৳', ',', '.', NULL, NULL),
(135, 'Algerie', 'Algerian dinar', 'DZD', 'د.ج', ' ', '.', NULL, NULL),
(136, 'United Arab Emirates', 'United Arab Emirates dirham', 'AED', 'د.إ', ',', '.', NULL, NULL),
(137, 'Uganda', 'Uganda shillings', 'UGX', 'USh', ',', '.', NULL, NULL),
(138, 'Tanzania', 'Tanzanian shilling', 'TZS', 'TSh', ',', '.', NULL, NULL),
(139, 'Angola', 'Kwanza', 'AOA', 'Kz', ',', '.', NULL, NULL),
(140, 'Kuwait', 'Kuwaiti dinar', 'KWD', 'KD', ',', '.', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `customer_groups`
--

CREATE TABLE `customer_groups` (
  `id` int UNSIGNED NOT NULL,
  `business_id` int UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` double(5,2) NOT NULL,
  `created_by` int UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dashboard_configurations`
--

CREATE TABLE `dashboard_configurations` (
  `id` int UNSIGNED NOT NULL,
  `business_id` int UNSIGNED NOT NULL,
  `created_by` int NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `color` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `configuration` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `discounts`
--

CREATE TABLE `discounts` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `business_id` int NOT NULL,
  `brand_id` int DEFAULT NULL,
  `category_id` int DEFAULT NULL,
  `location_id` int DEFAULT NULL,
  `priority` int DEFAULT NULL,
  `discount_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount_amount` decimal(22,4) NOT NULL DEFAULT '0.0000',
  `starts_at` datetime DEFAULT NULL,
  `ends_at` datetime DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `applicable_in_spg` tinyint(1) DEFAULT '0',
  `applicable_in_cg` tinyint(1) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `document_and_notes`
--

CREATE TABLE `document_and_notes` (
  `id` int UNSIGNED NOT NULL,
  `business_id` int NOT NULL,
  `notable_id` int NOT NULL,
  `notable_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `heading` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `is_private` tinyint(1) NOT NULL DEFAULT '0',
  `created_by` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `expense_categories`
--

CREATE TABLE `expense_categories` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `business_id` int UNSIGNED NOT NULL,
  `code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `expense_categories`
--

INSERT INTO `expense_categories` (`id`, `name`, `business_id`, `code`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Food Expenses', 2, 'FE', NULL, '2022-10-22 12:42:17', '2022-10-22 12:42:17'),
(2, 'Salaries & Wages', 2, 'SW', NULL, '2022-10-22 12:42:38', '2022-10-22 12:42:38'),
(3, 'Hotel Accesories', 2, 'HA', NULL, '2022-10-22 12:43:16', '2022-10-22 12:43:16'),
(4, 'Kitchen Expenses', 2, 'KE', NULL, '2022-10-22 12:43:51', '2022-10-22 12:43:51'),
(5, 'Advertising', 3, 'ADV', NULL, '2023-06-03 11:30:54', '2023-06-03 11:30:54'),
(6, 'Rent', 3, 'RT', NULL, '2023-06-03 11:31:07', '2023-06-03 11:31:07'),
(7, 'Transport', 3, 'TS', NULL, '2023-06-03 11:31:30', '2023-06-03 11:31:30'),
(8, 'Salaries&Wages', 3, 'SW', NULL, '2023-06-03 11:31:48', '2023-06-03 11:31:48'),
(9, 'Bank Charges', 3, 'BC', NULL, '2023-06-03 12:08:34', '2023-06-03 12:08:34');

-- --------------------------------------------------------

--
-- Table structure for table `group_sub_taxes`
--

CREATE TABLE `group_sub_taxes` (
  `group_tax_id` int UNSIGNED NOT NULL,
  `tax_id` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invoice_layouts`
--

CREATE TABLE `invoice_layouts` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `header_text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `invoice_no_prefix` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quotation_no_prefix` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `invoice_heading` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_heading_line1` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_heading_line2` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_heading_line3` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_heading_line4` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_heading_line5` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `invoice_heading_not_paid` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `invoice_heading_paid` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quotation_heading` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_total_label` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount_label` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax_label` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_label` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `round_off_label` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_due_label` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paid_label` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `show_client_id` tinyint(1) NOT NULL DEFAULT '0',
  `client_id_label` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `client_tax_label` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_label` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_time_format` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `show_time` tinyint(1) NOT NULL DEFAULT '1',
  `show_brand` tinyint(1) NOT NULL DEFAULT '0',
  `show_sku` tinyint(1) NOT NULL DEFAULT '1',
  `show_cat_code` tinyint(1) NOT NULL DEFAULT '1',
  `show_expiry` tinyint(1) NOT NULL DEFAULT '0',
  `show_lot` tinyint(1) NOT NULL DEFAULT '0',
  `show_image` tinyint(1) NOT NULL DEFAULT '0',
  `show_sale_description` tinyint(1) NOT NULL DEFAULT '0',
  `sales_person_label` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `show_sales_person` tinyint(1) NOT NULL DEFAULT '0',
  `table_product_label` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `table_qty_label` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `table_unit_price_label` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `table_subtotal_label` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cat_code_label` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `logo` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `show_logo` tinyint(1) NOT NULL DEFAULT '0',
  `show_business_name` tinyint(1) NOT NULL DEFAULT '0',
  `show_location_name` tinyint(1) NOT NULL DEFAULT '1',
  `show_landmark` tinyint(1) NOT NULL DEFAULT '1',
  `show_city` tinyint(1) NOT NULL DEFAULT '1',
  `show_state` tinyint(1) NOT NULL DEFAULT '1',
  `show_zip_code` tinyint(1) NOT NULL DEFAULT '1',
  `show_country` tinyint(1) NOT NULL DEFAULT '1',
  `show_mobile_number` tinyint(1) NOT NULL DEFAULT '1',
  `show_alternate_number` tinyint(1) NOT NULL DEFAULT '0',
  `show_email` tinyint(1) NOT NULL DEFAULT '0',
  `show_tax_1` tinyint(1) NOT NULL DEFAULT '1',
  `show_tax_2` tinyint(1) NOT NULL DEFAULT '0',
  `show_barcode` tinyint(1) NOT NULL DEFAULT '0',
  `show_payments` tinyint(1) NOT NULL DEFAULT '0',
  `show_customer` tinyint(1) NOT NULL DEFAULT '0',
  `customer_label` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `show_reward_point` tinyint(1) NOT NULL DEFAULT '0',
  `highlight_color` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `footer_text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `module_info` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `common_settings` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `is_default` tinyint(1) NOT NULL DEFAULT '0',
  `business_id` int UNSIGNED NOT NULL,
  `design` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'classic',
  `cn_heading` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'cn = credit note',
  `cn_no_label` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cn_amount_label` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `table_tax_headings` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `show_previous_bal` tinyint(1) NOT NULL DEFAULT '0',
  `prev_bal_label` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `change_return_label` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_custom_fields` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `contact_custom_fields` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `location_custom_fields` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `invoice_layouts`
--

INSERT INTO `invoice_layouts` (`id`, `name`, `header_text`, `invoice_no_prefix`, `quotation_no_prefix`, `invoice_heading`, `sub_heading_line1`, `sub_heading_line2`, `sub_heading_line3`, `sub_heading_line4`, `sub_heading_line5`, `invoice_heading_not_paid`, `invoice_heading_paid`, `quotation_heading`, `sub_total_label`, `discount_label`, `tax_label`, `total_label`, `round_off_label`, `total_due_label`, `paid_label`, `show_client_id`, `client_id_label`, `client_tax_label`, `date_label`, `date_time_format`, `show_time`, `show_brand`, `show_sku`, `show_cat_code`, `show_expiry`, `show_lot`, `show_image`, `show_sale_description`, `sales_person_label`, `show_sales_person`, `table_product_label`, `table_qty_label`, `table_unit_price_label`, `table_subtotal_label`, `cat_code_label`, `logo`, `show_logo`, `show_business_name`, `show_location_name`, `show_landmark`, `show_city`, `show_state`, `show_zip_code`, `show_country`, `show_mobile_number`, `show_alternate_number`, `show_email`, `show_tax_1`, `show_tax_2`, `show_barcode`, `show_payments`, `show_customer`, `customer_label`, `show_reward_point`, `highlight_color`, `footer_text`, `module_info`, `common_settings`, `is_default`, `business_id`, `design`, `cn_heading`, `cn_no_label`, `cn_amount_label`, `table_tax_headings`, `show_previous_bal`, `prev_bal_label`, `change_return_label`, `product_custom_fields`, `contact_custom_fields`, `location_custom_fields`, `created_at`, `updated_at`) VALUES
(1, 'Default', NULL, 'Invoice No.', NULL, 'Invoice', NULL, NULL, NULL, NULL, NULL, '', '', NULL, 'Subtotal', 'Discount', 'Tax', 'Total', NULL, 'Total Due', 'Total Paid', 0, NULL, NULL, 'Date', NULL, 1, 0, 1, 1, 0, 0, 0, 0, NULL, 0, 'Product', 'Quantity', 'Unit Price', 'Subtotal', NULL, NULL, 0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 0, 0, 1, 1, 'Customer', 0, '#000000', '', NULL, NULL, 1, 2, 'classic', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-10-13 17:35:41', '2022-10-13 17:35:41'),
(2, 'Default', NULL, 'Invoice No.', NULL, 'Cash/Invoice', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Subtotal', 'Discount', 'Tax', 'Total', NULL, 'Total Due', 'Total Paid', 0, NULL, NULL, 'Date', NULL, 1, 0, 1, 1, 0, 0, 0, 0, NULL, 0, 'Item', 'Qty', '@', 'Subtotal', NULL, NULL, 0, 0, 1, 1, 1, 0, 0, 0, 1, 0, 0, 1, 0, 0, 1, 1, 'Customer', 0, '#000000', NULL, NULL, '{\"due_date_label\":null,\"total_quantity_label\":null}', 1, 3, 'slim', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2023-05-30 00:03:44', '2023-06-01 11:41:29'),
(3, 'Default', NULL, 'Invoice No.', NULL, 'Invoice', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Subtotal', 'Discount', 'Tax', 'Total', NULL, 'Total Due', 'Total Paid', 0, NULL, NULL, 'Date', NULL, 1, 0, 1, 1, 0, 0, 0, 0, NULL, 0, 'Product', 'Quantity', 'Unit Price', 'Subtotal', NULL, NULL, 0, 0, 1, 0, 1, 0, 0, 0, 1, 0, 1, 1, 0, 0, 1, 1, 'Customer', 0, '#000000', NULL, NULL, '{\"due_date_label\":null,\"total_quantity_label\":null}', 1, 4, 'slim', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2023-06-13 13:27:15', '2023-06-13 13:21:50');

-- --------------------------------------------------------

--
-- Table structure for table `invoice_schemes`
--

CREATE TABLE `invoice_schemes` (
  `id` int UNSIGNED NOT NULL,
  `business_id` int UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `scheme_type` enum('blank','year') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `prefix` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start_number` int DEFAULT NULL,
  `invoice_count` int NOT NULL DEFAULT '0',
  `total_digits` int DEFAULT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `invoice_schemes`
--

INSERT INTO `invoice_schemes` (`id`, `business_id`, `name`, `scheme_type`, `prefix`, `start_number`, `invoice_count`, `total_digits`, `is_default`, `created_at`, `updated_at`) VALUES
(1, 2, 'Default', 'blank', '', 1, 18, 4, 1, '2022-10-13 17:35:41', '2023-05-16 18:29:10'),
(2, 3, 'Default', 'blank', '', 1, 33, 4, 1, '2023-05-30 00:03:44', '2023-06-16 18:43:57'),
(3, 4, 'Default', 'blank', '', 1, 1, 4, 1, '2023-06-13 13:27:15', '2023-06-13 12:58:08');

-- --------------------------------------------------------

--
-- Table structure for table `media`
--

CREATE TABLE `media` (
  `id` int UNSIGNED NOT NULL,
  `business_id` int NOT NULL,
  `file_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `uploaded_by` int DEFAULT NULL,
  `model_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `media`
--

INSERT INTO `media` (`id`, `business_id`, `file_name`, `description`, `uploaded_by`, `model_type`, `model_id`, `created_at`, `updated_at`) VALUES
(1, 2, '1666424893_1425426368_mandazi.jpeg', NULL, 2, 'App\\Variation', 4, '2022-10-22 10:48:13', '2022-10-22 10:48:13'),
(2, 2, '1666424953_816278889_tea.jpeg', NULL, 2, 'App\\Variation', 3, '2022-10-22 10:49:13', '2022-10-22 10:49:13'),
(3, 2, '1666425324_890900524_french-fries-5332766__340.jpg', NULL, 2, 'App\\Variation', 5, '2022-10-22 10:55:24', '2022-10-22 10:55:24'),
(4, 2, '1666425402_456226617_tea.jpeg', NULL, 2, 'App\\Variation', 6, '2022-10-22 10:56:42', '2022-10-22 10:56:42'),
(5, 2, '1666425488_831121648_samosa.webp', NULL, 2, 'App\\Variation', 7, '2022-10-22 10:58:08', '2022-10-22 10:58:08'),
(6, 2, '1666425561_653468358_chapati.jpeg', NULL, 2, 'App\\Variation', 8, '2022-10-22 10:59:21', '2022-10-22 10:59:21'),
(7, 2, '1666425639_55583645_Donut.webp', NULL, 2, 'App\\Variation', 9, '2022-10-22 11:00:39', '2022-10-22 11:00:39'),
(8, 2, '1666425711_1313310574_nduma.jpeg', NULL, 2, 'App\\Variation', 10, '2022-10-22 11:01:51', '2022-10-22 11:01:51'),
(9, 2, '1666425809_2104274784_ngwaci.jpeg', NULL, 2, 'App\\Variation', 11, '2022-10-22 11:03:29', '2022-10-22 11:03:29'),
(10, 2, '1666425913_183273073_scrambledeggs.jpg', NULL, 2, 'App\\Variation', 12, '2022-10-22 11:05:13', '2022-10-22 11:05:13'),
(11, 2, '1666426022_78231189_friedeggs.jpeg', NULL, 2, 'App\\Variation', 13, '2022-10-22 11:07:02', '2022-10-22 11:07:02'),
(12, 2, '1666426097_1525204053_Boiled.jpg', NULL, 2, 'App\\Variation', 14, '2022-10-22 11:08:17', '2022-10-22 11:08:17'),
(13, 2, '1666426186_1450707483_kienyejieggs.jpg', NULL, 2, 'App\\Variation', 15, '2022-10-22 11:09:46', '2022-10-22 11:09:46'),
(14, 2, '1666426386_223641197_ricevegetable.jpg', NULL, 2, 'App\\Variation', 16, '2022-10-22 11:13:06', '2022-10-22 11:13:06'),
(15, 2, '1666426487_987495477_riceimages.jpg', NULL, 2, 'App\\Variation', 17, '2022-10-22 11:14:47', '2022-10-22 11:14:47'),
(16, 2, '1666426574_137273567_ricechapo.jpeg', NULL, 2, 'App\\Variation', 18, '2022-10-22 11:16:14', '2022-10-22 11:16:14'),
(17, 2, '1666430636_1425683560_ugalichicken.jpg', NULL, 5, 'App\\Variation', 19, '2022-10-22 12:23:56', '2022-10-22 12:23:56'),
(18, 2, '1666433529_2113234263_Bottledwater.jpg', NULL, 2, 'App\\Variation', 20, '2022-10-22 13:12:09', '2022-10-22 13:12:09'),
(19, 2, '1666433723_801775849_cokesoda.jpg', NULL, 2, 'App\\Variation', 21, '2022-10-22 13:15:23', '2022-10-22 13:15:23'),
(20, 2, '1666433870_2033754432_Delmonte.jpg', NULL, 2, 'App\\Variation', 22, '2022-10-22 13:17:50', '2022-10-22 13:17:50'),
(21, 2, '1666437549_1769433785_beefstew.jpeg', NULL, 5, 'App\\Variation', 23, '2022-10-22 14:19:09', '2022-10-22 14:19:09');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2017_07_05_071953_create_currencies_table', 1),
(4, '2017_07_05_073658_create_business_table', 1),
(5, '2017_07_22_075923_add_business_id_users_table', 1),
(6, '2017_07_23_113209_create_brands_table', 1),
(7, '2017_07_26_083429_create_permission_tables', 1),
(8, '2017_07_26_110000_create_tax_rates_table', 1),
(9, '2017_07_26_122313_create_units_table', 1),
(10, '2017_07_27_075706_create_contacts_table', 1),
(11, '2017_08_04_071038_create_categories_table', 1),
(12, '2017_08_08_115903_create_products_table', 1),
(13, '2017_08_09_061616_create_variation_templates_table', 1),
(14, '2017_08_09_061638_create_variation_value_templates_table', 1),
(15, '2017_08_10_061146_create_product_variations_table', 1),
(16, '2017_08_10_061216_create_variations_table', 1),
(17, '2017_08_19_054827_create_transactions_table', 1),
(18, '2017_08_31_073533_create_purchase_lines_table', 1),
(19, '2017_10_15_064638_create_transaction_payments_table', 1),
(20, '2017_10_31_065621_add_default_sales_tax_to_business_table', 1),
(21, '2017_11_20_051930_create_table_group_sub_taxes', 1),
(22, '2017_11_20_063603_create_transaction_sell_lines', 1),
(23, '2017_11_21_064540_create_barcodes_table', 1),
(24, '2017_11_23_181237_create_invoice_schemes_table', 1),
(25, '2017_12_25_122822_create_business_locations_table', 1),
(26, '2017_12_25_160253_add_location_id_to_transactions_table', 1),
(27, '2017_12_25_163227_create_variation_location_details_table', 1),
(28, '2018_01_04_115627_create_sessions_table', 1),
(29, '2018_01_05_112817_create_invoice_layouts_table', 1),
(30, '2018_01_06_112303_add_invoice_scheme_id_and_invoice_layout_id_to_business_locations', 1),
(31, '2018_01_08_104124_create_expense_categories_table', 1),
(32, '2018_01_08_123327_modify_transactions_table_for_expenses', 1),
(33, '2018_01_09_111005_modify_payment_status_in_transactions_table', 1),
(34, '2018_01_09_111109_add_paid_on_column_to_transaction_payments_table', 1),
(35, '2018_01_25_172439_add_printer_related_fields_to_business_locations_table', 1),
(36, '2018_01_27_184322_create_printers_table', 1),
(37, '2018_01_30_181442_create_cash_registers_table', 1),
(38, '2018_01_31_125836_create_cash_register_transactions_table', 1),
(39, '2018_02_07_173326_modify_business_table', 1),
(40, '2018_02_08_105425_add_enable_product_expiry_column_to_business_table', 1),
(41, '2018_02_08_111027_add_expiry_period_and_expiry_period_type_columns_to_products_table', 1),
(42, '2018_02_08_131118_add_mfg_date_and_exp_date_purchase_lines_table', 1),
(43, '2018_02_08_155348_add_exchange_rate_to_transactions_table', 1),
(44, '2018_02_09_124945_modify_transaction_payments_table_for_contact_payments', 1),
(45, '2018_02_12_113640_create_transaction_sell_lines_purchase_lines_table', 1),
(46, '2018_02_12_114605_add_quantity_sold_in_purchase_lines_table', 1),
(47, '2018_02_13_183323_alter_decimal_fields_size', 1),
(48, '2018_02_14_161928_add_transaction_edit_days_to_business_table', 1),
(49, '2018_02_15_161032_add_document_column_to_transactions_table', 1),
(50, '2018_02_17_124709_add_more_options_to_invoice_layouts', 1),
(51, '2018_02_19_111517_add_keyboard_shortcut_column_to_business_table', 1),
(52, '2018_02_19_121537_stock_adjustment_move_to_transaction_table', 1),
(53, '2018_02_20_165505_add_is_direct_sale_column_to_transactions_table', 1),
(54, '2018_02_21_105329_create_system_table', 1),
(55, '2018_02_23_100549_version_1_2', 1),
(56, '2018_02_23_125648_add_enable_editing_sp_from_purchase_column_to_business_table', 1),
(57, '2018_02_26_103612_add_sales_commission_agent_column_to_business_table', 1),
(58, '2018_02_26_130519_modify_users_table_for_sales_cmmsn_agnt', 1),
(59, '2018_02_26_134500_add_commission_agent_to_transactions_table', 1),
(60, '2018_02_27_121422_add_item_addition_method_to_business_table', 1),
(61, '2018_02_27_170232_modify_transactions_table_for_stock_transfer', 1),
(62, '2018_03_05_153510_add_enable_inline_tax_column_to_business_table', 1),
(63, '2018_03_06_210206_modify_product_barcode_types', 1),
(64, '2018_03_13_181541_add_expiry_type_to_business_table', 1),
(65, '2018_03_16_113446_product_expiry_setting_for_business', 1),
(66, '2018_03_19_113601_add_business_settings_options', 1),
(67, '2018_03_26_125334_add_pos_settings_to_business_table', 1),
(68, '2018_03_26_165350_create_customer_groups_table', 1),
(69, '2018_03_27_122720_customer_group_related_changes_in_tables', 1),
(70, '2018_03_29_110138_change_tax_field_to_nullable_in_business_table', 1),
(71, '2018_03_29_115502_add_changes_for_sr_number_in_products_and_sale_lines_table', 1),
(72, '2018_03_29_134340_add_inline_discount_fields_in_purchase_lines', 1),
(73, '2018_03_31_140921_update_transactions_table_exchange_rate', 1),
(74, '2018_04_03_103037_add_contact_id_to_contacts_table', 1),
(75, '2018_04_03_122709_add_changes_to_invoice_layouts_table', 1),
(76, '2018_04_09_135320_change_exchage_rate_size_in_business_table', 1),
(77, '2018_04_17_123122_add_lot_number_to_business', 1),
(78, '2018_04_17_160845_add_product_racks_table', 1),
(79, '2018_04_20_182015_create_res_tables_table', 1),
(80, '2018_04_24_105246_restaurant_fields_in_transaction_table', 1),
(81, '2018_04_24_114149_add_enabled_modules_business_table', 1),
(82, '2018_04_24_133704_add_modules_fields_in_invoice_layout_table', 1),
(83, '2018_04_27_132653_quotation_related_change', 1),
(84, '2018_05_02_104439_add_date_format_and_time_format_to_business', 1),
(85, '2018_05_02_111939_add_sell_return_to_transaction_payments', 1),
(86, '2018_05_14_114027_add_rows_positions_for_products', 1),
(87, '2018_05_14_125223_add_weight_to_products_table', 1),
(88, '2018_05_14_164754_add_opening_stock_permission', 1),
(89, '2018_05_15_134729_add_design_to_invoice_layouts', 1),
(90, '2018_05_16_183307_add_tax_fields_invoice_layout', 1),
(91, '2018_05_18_191956_add_sell_return_to_transaction_table', 1),
(92, '2018_05_21_131349_add_custom_fileds_to_contacts_table', 1),
(93, '2018_05_21_131607_invoice_layout_fields_for_sell_return', 1),
(94, '2018_05_21_131949_add_custom_fileds_and_website_to_business_locations_table', 1),
(95, '2018_05_22_123527_create_reference_counts_table', 1),
(96, '2018_05_22_154540_add_ref_no_prefixes_column_to_business_table', 1),
(97, '2018_05_24_132620_add_ref_no_column_to_transaction_payments_table', 1),
(98, '2018_05_24_161026_add_location_id_column_to_business_location_table', 1),
(99, '2018_05_25_180603_create_modifiers_related_table', 1),
(100, '2018_05_29_121714_add_purchase_line_id_to_stock_adjustment_line_table', 1),
(101, '2018_05_31_114645_add_res_order_status_column_to_transactions_table', 1),
(102, '2018_06_05_103530_rename_purchase_line_id_in_stock_adjustment_lines_table', 1),
(103, '2018_06_05_111905_modify_products_table_for_modifiers', 1),
(104, '2018_06_06_110524_add_parent_sell_line_id_column_to_transaction_sell_lines_table', 1),
(105, '2018_06_07_152443_add_is_service_staff_to_roles_table', 1),
(106, '2018_06_07_182258_add_image_field_to_products_table', 1),
(107, '2018_06_13_133705_create_bookings_table', 1),
(108, '2018_06_15_173636_add_email_column_to_contacts_table', 1),
(109, '2018_06_27_182835_add_superadmin_related_fields_business', 1),
(110, '2018_07_10_101913_add_custom_fields_to_products_table', 1),
(111, '2018_07_17_103434_add_sales_person_name_label_to_invoice_layouts_table', 1),
(112, '2018_07_17_163920_add_theme_skin_color_column_to_business_table', 1),
(113, '2018_07_24_160319_add_lot_no_line_id_to_transaction_sell_lines_table', 1),
(114, '2018_07_25_110004_add_show_expiry_and_show_lot_colums_to_invoice_layouts_table', 1),
(115, '2018_07_25_172004_add_discount_columns_to_transaction_sell_lines_table', 1),
(116, '2018_07_26_124720_change_design_column_type_in_invoice_layouts_table', 1),
(117, '2018_07_26_170424_add_unit_price_before_discount_column_to_transaction_sell_line_table', 1),
(118, '2018_07_28_103614_add_credit_limit_column_to_contacts_table', 1),
(119, '2018_08_08_110755_add_new_payment_methods_to_transaction_payments_table', 1),
(120, '2018_08_08_122225_modify_cash_register_transactions_table_for_new_payment_methods', 1),
(121, '2018_08_14_104036_add_opening_balance_type_to_transactions_table', 1),
(122, '2018_09_04_155900_create_accounts_table', 1),
(123, '2018_09_06_114438_create_selling_price_groups_table', 1),
(124, '2018_09_06_154057_create_variation_group_prices_table', 1),
(125, '2018_09_07_102413_add_permission_to_access_default_selling_price', 1),
(126, '2018_09_07_134858_add_selling_price_group_id_to_transactions_table', 1),
(127, '2018_09_10_112448_update_product_type_to_single_if_null_in_products_table', 1),
(128, '2018_09_10_152703_create_account_transactions_table', 1),
(129, '2018_09_10_173656_add_account_id_column_to_transaction_payments_table', 1),
(130, '2018_09_19_123914_create_notification_templates_table', 1),
(131, '2018_09_22_110504_add_sms_and_email_settings_columns_to_business_table', 1),
(132, '2018_09_24_134942_add_lot_no_line_id_to_stock_adjustment_lines_table', 1),
(133, '2018_09_26_105557_add_transaction_payments_for_existing_expenses', 1),
(134, '2018_09_27_111609_modify_transactions_table_for_purchase_return', 1),
(135, '2018_09_27_131154_add_quantity_returned_column_to_purchase_lines_table', 1),
(136, '2018_10_02_131401_add_return_quantity_column_to_transaction_sell_lines_table', 1),
(137, '2018_10_03_104918_add_qty_returned_column_to_transaction_sell_lines_purchase_lines_table', 1),
(138, '2018_10_03_185947_add_default_notification_templates_to_database', 1),
(139, '2018_10_09_153105_add_business_id_to_transaction_payments_table', 1),
(140, '2018_10_16_135229_create_permission_for_sells_and_purchase', 1),
(141, '2018_10_22_114441_add_columns_for_variable_product_modifications', 1),
(142, '2018_10_22_134428_modify_variable_product_data', 1),
(143, '2018_10_30_181558_add_table_tax_headings_to_invoice_layout', 1),
(144, '2018_10_31_122619_add_pay_terms_field_transactions_table', 1),
(145, '2018_10_31_161328_add_new_permissions_for_pos_screen', 1),
(146, '2018_10_31_174752_add_access_selected_contacts_only_to_users_table', 1),
(147, '2018_10_31_175627_add_user_contact_access', 1),
(148, '2018_10_31_180559_add_auto_send_sms_column_to_notification_templates_table', 1),
(149, '2018_11_02_171949_change_card_type_column_to_varchar_in_transaction_payments_table', 1),
(150, '2018_11_08_105621_add_role_permissions', 1),
(151, '2018_11_26_114135_add_is_suspend_column_to_transactions_table', 1),
(152, '2018_11_28_104410_modify_units_table_for_multi_unit', 1),
(153, '2018_11_28_170952_add_sub_unit_id_to_purchase_lines_and_sell_lines', 1),
(154, '2018_11_29_115918_add_primary_key_in_system_table', 1),
(155, '2018_12_03_185546_add_product_description_column_to_products_table', 1),
(156, '2018_12_06_114937_modify_system_table_and_users_table', 1),
(157, '2018_12_13_160007_add_custom_fields_display_options_to_invoice_layouts_table', 1),
(158, '2018_12_14_103307_modify_system_table', 1),
(159, '2018_12_18_133837_add_prev_balance_due_columns_to_invoice_layouts_table', 1),
(160, '2018_12_18_170656_add_invoice_token_column_to_transaction_table', 1),
(161, '2018_12_20_133639_add_date_time_format_column_to_invoice_layouts_table', 1),
(162, '2018_12_21_120659_add_recurring_invoice_fields_to_transactions_table', 1),
(163, '2018_12_24_154933_create_notifications_table', 1),
(164, '2019_01_08_112015_add_document_column_to_transaction_payments_table', 1),
(165, '2019_01_10_124645_add_account_permission', 1),
(166, '2019_01_16_125825_add_subscription_no_column_to_transactions_table', 1),
(167, '2019_01_28_111647_add_order_addresses_column_to_transactions_table', 1),
(168, '2019_02_13_173821_add_is_inactive_column_to_products_table', 1),
(169, '2019_02_19_103118_create_discounts_table', 1),
(170, '2019_02_21_120324_add_discount_id_column_to_transaction_sell_lines_table', 1),
(171, '2019_02_21_134324_add_permission_for_discount', 1),
(172, '2019_03_04_170832_add_service_staff_columns_to_transaction_sell_lines_table', 1),
(173, '2019_03_09_102425_add_sub_type_column_to_transactions_table', 1),
(174, '2019_03_09_124457_add_indexing_transaction_sell_lines_purchase_lines_table', 1),
(175, '2019_03_12_120336_create_activity_log_table', 1),
(176, '2019_03_15_132925_create_media_table', 1),
(177, '2019_05_08_130339_add_indexing_to_parent_id_in_transaction_payments_table', 1),
(178, '2019_05_10_132311_add_missing_column_indexing', 1),
(179, '2019_05_14_091812_add_show_image_column_to_invoice_layouts_table', 1),
(180, '2019_05_25_104922_add_view_purchase_price_permission', 1),
(181, '2019_06_17_103515_add_profile_informations_columns_to_users_table', 1),
(182, '2019_06_18_135524_add_permission_to_view_own_sales_only', 1),
(183, '2019_06_19_112058_add_database_changes_for_reward_points', 1),
(184, '2019_06_28_133732_change_type_column_to_string_in_transactions_table', 1),
(185, '2019_07_13_111420_add_is_created_from_api_column_to_transactions_table', 1),
(186, '2019_07_15_165136_add_fields_for_combo_product', 1),
(187, '2019_07_19_103446_add_mfg_quantity_used_column_to_purchase_lines_table', 1),
(188, '2019_07_22_152649_add_not_for_selling_in_product_table', 1),
(189, '2019_07_29_185351_add_show_reward_point_column_to_invoice_layouts_table', 1),
(190, '2019_08_08_162302_add_sub_units_related_fields', 1),
(191, '2019_08_26_133419_update_price_fields_decimal_point', 1),
(192, '2019_09_02_160054_remove_location_permissions_from_roles', 1),
(193, '2019_09_03_185259_add_permission_for_pos_screen', 1),
(194, '2019_09_04_163141_add_location_id_to_cash_registers_table', 1),
(195, '2019_09_04_184008_create_types_of_services_table', 1),
(196, '2019_09_06_131445_add_types_of_service_fields_to_transactions_table', 1),
(197, '2019_09_09_134810_add_default_selling_price_group_id_column_to_business_locations_table', 1),
(198, '2019_09_12_105616_create_product_locations_table', 1),
(199, '2019_09_17_122522_add_custom_labels_column_to_business_table', 1),
(200, '2019_09_18_164319_add_shipping_fields_to_transactions_table', 1),
(201, '2019_09_19_170927_close_all_active_registers', 1),
(202, '2019_09_23_161906_add_media_description_cloumn_to_media_table', 1),
(203, '2019_10_18_155633_create_account_types_table', 1),
(204, '2019_10_22_163335_add_common_settings_column_to_business_table', 1),
(205, '2019_10_29_132521_add_update_purchase_status_permission', 1),
(206, '2019_11_09_110522_add_indexing_to_lot_number', 1),
(207, '2019_11_19_170824_add_is_active_column_to_business_locations_table', 1),
(208, '2019_11_21_162913_change_quantity_field_types_to_decimal', 1),
(209, '2019_11_25_160340_modify_categories_table_for_polymerphic_relationship', 1),
(210, '2019_12_02_105025_create_warranties_table', 1),
(211, '2019_12_03_180342_add_common_settings_field_to_invoice_layouts_table', 1),
(212, '2019_12_05_183955_add_more_fields_to_users_table', 1),
(213, '2019_12_06_174904_add_change_return_label_column_to_invoice_layouts_table', 1),
(214, '2019_12_11_121307_add_draft_and_quotation_list_permissions', 1),
(215, '2019_12_12_180126_copy_expense_total_to_total_before_tax', 1),
(216, '2019_12_19_181412_make_alert_quantity_field_nullable_on_products_table', 1),
(217, '2019_12_25_173413_create_dashboard_configurations_table', 1),
(218, '2020_01_08_133506_create_document_and_notes_table', 1),
(219, '2020_01_09_113252_add_cc_bcc_column_to_notification_templates_table', 1),
(220, '2020_01_16_174818_add_round_off_amount_field_to_transactions_table', 1),
(221, '2020_01_28_162345_add_weighing_scale_settings_in_business_settings_table', 1),
(222, '2020_02_18_172447_add_import_fields_to_transactions_table', 1),
(223, '2020_03_13_135844_add_is_active_column_to_selling_price_groups_table', 1),
(224, '2020_03_16_115449_add_contact_status_field_to_contacts_table', 1),
(225, '2020_03_26_124736_add_allow_login_column_in_users_table', 1),
(226, '2020_04_13_154150_add_feature_products_column_to_business_loactions', 1),
(227, '2020_04_15_151802_add_user_type_to_users_table', 1),
(228, '2020_04_22_153905_add_subscription_repeat_on_column_to_transactions_table', 1),
(229, '2020_04_28_111436_add_shipping_address_to_contacts_table', 1),
(230, '2020_06_01_094654_add_max_sale_discount_column_to_users_table', 1),
(231, '2020_06_12_162245_modify_contacts_table', 1),
(232, '2020_06_22_103104_change_recur_interval_default_to_one', 1);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` int UNSIGNED NOT NULL,
  `model_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_permissions`
--

INSERT INTO `model_has_permissions` (`permission_id`, `model_type`, `model_id`) VALUES
(79, 'App\\User', 3),
(77, 'App\\User', 5),
(77, 'App\\User', 7),
(77, 'App\\User', 8),
(77, 'App\\User', 9),
(83, 'App\\User', 11);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` int UNSIGNED NOT NULL,
  `model_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(3, 'App\\User', 2),
(4, 'App\\User', 3),
(4, 'App\\User', 5),
(4, 'App\\User', 7),
(5, 'App\\User', 8),
(5, 'App\\User', 9),
(7, 'App\\User', 10),
(8, 'App\\User', 11);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` bigint UNSIGNED NOT NULL,
  `data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notification_templates`
--

CREATE TABLE `notification_templates` (
  `id` int UNSIGNED NOT NULL,
  `business_id` int NOT NULL,
  `template_for` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_body` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `sms_body` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `subject` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cc` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bcc` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `auto_send` tinyint(1) NOT NULL DEFAULT '0',
  `auto_send_sms` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notification_templates`
--

INSERT INTO `notification_templates` (`id`, `business_id`, `template_for`, `email_body`, `sms_body`, `subject`, `cc`, `bcc`, `auto_send`, `auto_send_sms`, `created_at`, `updated_at`) VALUES
(1, 2, 'new_sale', '<p>Dear {contact_name},</p>\n\n                    <p>Your invoice number is {invoice_number}<br />\n                    Total amount: {total_amount}<br />\n                    Paid amount: {received_amount}</p>\n\n                    <p>Thank you for shopping with us.</p>\n\n                    <p>{business_logo}</p>\n\n                    <p>&nbsp;</p>', 'Dear {contact_name}, Thank you for shopping with us. {business_name}', 'Thank you from {business_name}', NULL, NULL, 0, 0, '2022-10-13 17:35:41', '2022-10-13 17:35:41'),
(2, 2, 'payment_received', '<p>Dear {contact_name},</p>\n\n                <p>We have received a payment of {received_amount}</p>\n\n                <p>{business_logo}</p>', 'Dear {contact_name}, We have received a payment of {received_amount}. {business_name}', 'Payment Received, from {business_name}', NULL, NULL, 0, 0, '2022-10-13 17:35:41', '2022-10-13 17:35:41'),
(3, 2, 'payment_reminder', '<p>Dear {contact_name},</p>\n\n                    <p>This is to remind you that you have pending payment of {due_amount}. Kindly pay it as soon as possible.</p>\n\n                    <p>{business_logo}</p>', 'Dear {contact_name}, You have pending payment of {due_amount}. Kindly pay it as soon as possible. {business_name}', 'Payment Reminder, from {business_name}', NULL, NULL, 0, 0, '2022-10-13 17:35:41', '2022-10-13 17:35:41'),
(4, 2, 'new_booking', '<p>Dear {contact_name},</p>\n\n                    <p>Your booking is confirmed</p>\n\n                    <p>Date: {start_time} to {end_time}</p>\n\n                    <p>Table: {table}</p>\n\n                    <p>Location: {location}</p>\n\n                    <p>{business_logo}</p>', 'Dear {contact_name}, Your booking is confirmed. Date: {start_time} to {end_time}, Table: {table}, Location: {location}', 'Booking Confirmed - {business_name}', NULL, NULL, 0, 0, '2022-10-13 17:35:41', '2022-10-13 17:35:41'),
(5, 2, 'new_order', '<p>Dear {contact_name},</p>\n\n                    <p>We have a new order with reference number {order_ref_number}. Kindly process the products as soon as possible.</p>\n\n                    <p>{business_name}<br />\n                    {business_logo}</p>', 'Dear {contact_name}, We have a new order with reference number {order_ref_number}. Kindly process the products as soon as possible. {business_name}', 'New Order, from {business_name}', NULL, NULL, 0, 0, '2022-10-13 17:35:41', '2022-10-13 17:35:41'),
(6, 2, 'payment_paid', '<p>Dear {contact_name},</p>\n\n                    <p>We have paid amount {paid_amount} again invoice number {order_ref_number}.<br />\n                    Kindly note it down.</p>\n\n                    <p>{business_name}<br />\n                    {business_logo}</p>', 'We have paid amount {paid_amount} again invoice number {order_ref_number}.\n                    Kindly note it down. {business_name}', 'Payment Paid, from {business_name}', NULL, NULL, 0, 0, '2022-10-13 17:35:41', '2022-10-13 17:35:41'),
(7, 2, 'items_received', '<p>Dear {contact_name},</p>\n\n                    <p>We have received all items from invoice reference number {order_ref_number}. Thank you for processing it.</p>\n\n                    <p>{business_name}<br />\n                    {business_logo}</p>', 'We have received all items from invoice reference number {order_ref_number}. Thank you for processing it. {business_name}', 'Items received, from {business_name}', NULL, NULL, 0, 0, '2022-10-13 17:35:41', '2022-10-13 17:35:41'),
(8, 2, 'items_pending', '<p>Dear {contact_name},<br />\n                    This is to remind you that we have not yet received some items from invoice reference number {order_ref_number}. Please process it as soon as possible.</p>\n\n                    <p>{business_name}<br />\n                    {business_logo}</p>', 'This is to remind you that we have not yet received some items from invoice reference number {order_ref_number} . Please process it as soon as possible.{business_name}', 'Items Pending, from {business_name}', NULL, NULL, 0, 0, '2022-10-13 17:35:41', '2022-10-13 17:35:41'),
(9, 3, 'new_sale', '<p>Dear {contact_name},</p>\n\n                    <p>Your invoice number is {invoice_number}<br />\n                    Total amount: {total_amount}<br />\n                    Paid amount: {received_amount}</p>\n\n                    <p>Thank you for shopping with us.</p>\n\n                    <p>{business_logo}</p>\n\n                    <p>&nbsp;</p>', 'Dear {contact_name}, Thank you for shopping with us. {business_name}', 'Thank you from {business_name}', NULL, NULL, 0, 0, '2023-05-30 00:03:44', '2023-05-30 00:03:44'),
(10, 3, 'payment_received', '<p>Dear {contact_name},</p>\n\n                <p>We have received a payment of {received_amount}</p>\n\n                <p>{business_logo}</p>', 'Dear {contact_name}, We have received a payment of {received_amount}. {business_name}', 'Payment Received, from {business_name}', NULL, NULL, 0, 0, '2023-05-30 00:03:44', '2023-05-30 00:03:44'),
(11, 3, 'payment_reminder', '<p>Dear {contact_name},</p>\n\n                    <p>This is to remind you that you have pending payment of {due_amount}. Kindly pay it as soon as possible.</p>\n\n                    <p>{business_logo}</p>', 'Dear {contact_name}, You have pending payment of {due_amount}. Kindly pay it as soon as possible. {business_name}', 'Payment Reminder, from {business_name}', NULL, NULL, 0, 0, '2023-05-30 00:03:44', '2023-05-30 00:03:44'),
(12, 3, 'new_booking', '<p>Dear {contact_name},</p>\n\n                    <p>Your booking is confirmed</p>\n\n                    <p>Date: {start_time} to {end_time}</p>\n\n                    <p>Table: {table}</p>\n\n                    <p>Location: {location}</p>\n\n                    <p>{business_logo}</p>', 'Dear {contact_name}, Your booking is confirmed. Date: {start_time} to {end_time}, Table: {table}, Location: {location}', 'Booking Confirmed - {business_name}', NULL, NULL, 0, 0, '2023-05-30 00:03:44', '2023-05-30 00:03:44'),
(13, 3, 'new_order', '<p>Dear {contact_name},</p>\n\n                    <p>We have a new order with reference number {order_ref_number}. Kindly process the products as soon as possible.</p>\n\n                    <p>{business_name}<br />\n                    {business_logo}</p>', 'Dear {contact_name}, We have a new order with reference number {order_ref_number}. Kindly process the products as soon as possible. {business_name}', 'New Order, from {business_name}', NULL, NULL, 0, 0, '2023-05-30 00:03:44', '2023-05-30 00:03:44'),
(14, 3, 'payment_paid', '<p>Dear {contact_name},</p>\n\n                    <p>We have paid amount {paid_amount} again invoice number {order_ref_number}.<br />\n                    Kindly note it down.</p>\n\n                    <p>{business_name}<br />\n                    {business_logo}</p>', 'We have paid amount {paid_amount} again invoice number {order_ref_number}.\n                    Kindly note it down. {business_name}', 'Payment Paid, from {business_name}', NULL, NULL, 0, 0, '2023-05-30 00:03:44', '2023-05-30 00:03:44'),
(15, 3, 'items_received', '<p>Dear {contact_name},</p>\n\n                    <p>We have received all items from invoice reference number {order_ref_number}. Thank you for processing it.</p>\n\n                    <p>{business_name}<br />\n                    {business_logo}</p>', 'We have received all items from invoice reference number {order_ref_number}. Thank you for processing it. {business_name}', 'Items received, from {business_name}', NULL, NULL, 0, 0, '2023-05-30 00:03:44', '2023-05-30 00:03:44'),
(16, 3, 'items_pending', '<p>Dear {contact_name},<br />\n                    This is to remind you that we have not yet received some items from invoice reference number {order_ref_number}. Please process it as soon as possible.</p>\n\n                    <p>{business_name}<br />\n                    {business_logo}</p>', 'This is to remind you that we have not yet received some items from invoice reference number {order_ref_number} . Please process it as soon as possible.{business_name}', 'Items Pending, from {business_name}', NULL, NULL, 0, 0, '2023-05-30 00:03:44', '2023-05-30 00:03:44'),
(17, 4, 'new_sale', '<p>Dear {contact_name},</p>\n\n                    <p>Your invoice number is {invoice_number}<br />\n                    Total amount: {total_amount}<br />\n                    Paid amount: {received_amount}</p>\n\n                    <p>Thank you for shopping with us.</p>\n\n                    <p>{business_logo}</p>\n\n                    <p>&nbsp;</p>', 'Dear {contact_name}, Thank you for shopping with us. {business_name}', 'Thank you from {business_name}', NULL, NULL, 0, 0, '2023-06-13 13:27:15', '2023-06-13 13:27:15'),
(18, 4, 'payment_received', '<p>Dear {contact_name},</p>\n\n                <p>We have received a payment of {received_amount}</p>\n\n                <p>{business_logo}</p>', 'Dear {contact_name}, We have received a payment of {received_amount}. {business_name}', 'Payment Received, from {business_name}', NULL, NULL, 0, 0, '2023-06-13 13:27:15', '2023-06-13 13:27:15'),
(19, 4, 'payment_reminder', '<p>Dear {contact_name},</p>\n\n                    <p>This is to remind you that you have pending payment of {due_amount}. Kindly pay it as soon as possible.</p>\n\n                    <p>{business_logo}</p>', 'Dear {contact_name}, You have pending payment of {due_amount}. Kindly pay it as soon as possible. {business_name}', 'Payment Reminder, from {business_name}', NULL, NULL, 0, 0, '2023-06-13 13:27:15', '2023-06-13 13:27:15'),
(20, 4, 'new_booking', '<p>Dear {contact_name},</p>\n\n                    <p>Your booking is confirmed</p>\n\n                    <p>Date: {start_time} to {end_time}</p>\n\n                    <p>Table: {table}</p>\n\n                    <p>Location: {location}</p>\n\n                    <p>{business_logo}</p>', 'Dear {contact_name}, Your booking is confirmed. Date: {start_time} to {end_time}, Table: {table}, Location: {location}', 'Booking Confirmed - {business_name}', NULL, NULL, 0, 0, '2023-06-13 13:27:15', '2023-06-13 13:27:15'),
(21, 4, 'new_order', '<p>Dear {contact_name},</p>\n\n                    <p>We have a new order with reference number {order_ref_number}. Kindly process the products as soon as possible.</p>\n\n                    <p>{business_name}<br />\n                    {business_logo}</p>', 'Dear {contact_name}, We have a new order with reference number {order_ref_number}. Kindly process the products as soon as possible. {business_name}', 'New Order, from {business_name}', NULL, NULL, 0, 0, '2023-06-13 13:27:15', '2023-06-13 13:27:15'),
(22, 4, 'payment_paid', '<p>Dear {contact_name},</p>\n\n                    <p>We have paid amount {paid_amount} again invoice number {order_ref_number}.<br />\n                    Kindly note it down.</p>\n\n                    <p>{business_name}<br />\n                    {business_logo}</p>', 'We have paid amount {paid_amount} again invoice number {order_ref_number}.\n                    Kindly note it down. {business_name}', 'Payment Paid, from {business_name}', NULL, NULL, 0, 0, '2023-06-13 13:27:15', '2023-06-13 13:27:15'),
(23, 4, 'items_received', '<p>Dear {contact_name},</p>\n\n                    <p>We have received all items from invoice reference number {order_ref_number}. Thank you for processing it.</p>\n\n                    <p>{business_name}<br />\n                    {business_logo}</p>', 'We have received all items from invoice reference number {order_ref_number}. Thank you for processing it. {business_name}', 'Items received, from {business_name}', NULL, NULL, 0, 0, '2023-06-13 13:27:15', '2023-06-13 13:27:15'),
(24, 4, 'items_pending', '<p>Dear {contact_name},<br />\n                    This is to remind you that we have not yet received some items from invoice reference number {order_ref_number}. Please process it as soon as possible.</p>\n\n                    <p>{business_name}<br />\n                    {business_logo}</p>', 'This is to remind you that we have not yet received some items from invoice reference number {order_ref_number} . Please process it as soon as possible.{business_name}', 'Items Pending, from {business_name}', NULL, NULL, 0, 0, '2023-06-13 13:27:15', '2023-06-13 13:27:15');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'profit_loss_report.view', 'web', '2022-10-13 17:12:27', NULL),
(2, 'direct_sell.access', 'web', '2022-10-13 17:12:27', NULL),
(3, 'product.opening_stock', 'web', '2022-10-13 17:12:30', '2022-10-13 17:12:30'),
(4, 'crud_all_bookings', 'web', '2022-10-13 17:12:31', '2022-10-13 17:12:31'),
(5, 'crud_own_bookings', 'web', '2022-10-13 17:12:31', '2022-10-13 17:12:31'),
(6, 'access_default_selling_price', 'web', '2022-10-13 17:12:32', '2022-10-13 17:12:32'),
(7, 'purchase.payments', 'web', '2022-10-13 17:12:32', '2022-10-13 17:12:32'),
(8, 'sell.payments', 'web', '2022-10-13 17:12:32', '2022-10-13 17:12:32'),
(9, 'edit_product_price_from_sale_screen', 'web', '2022-10-13 17:12:33', '2022-10-13 17:12:33'),
(10, 'edit_product_discount_from_sale_screen', 'web', '2022-10-13 17:12:33', '2022-10-13 17:12:33'),
(11, 'roles.view', 'web', '2022-10-13 17:12:33', '2022-10-13 17:12:33'),
(12, 'roles.create', 'web', '2022-10-13 17:12:33', '2022-10-13 17:12:33'),
(13, 'roles.update', 'web', '2022-10-13 17:12:33', '2022-10-13 17:12:33'),
(14, 'roles.delete', 'web', '2022-10-13 17:12:33', '2022-10-13 17:12:33'),
(15, 'account.access', 'web', '2022-10-13 17:12:33', '2022-10-13 17:12:33'),
(16, 'discount.access', 'web', '2022-10-13 17:12:34', '2022-10-13 17:12:34'),
(17, 'view_purchase_price', 'web', '2022-10-13 17:12:34', '2022-10-13 17:12:34'),
(18, 'view_own_sell_only', 'web', '2022-10-13 17:12:34', '2022-10-13 17:12:34'),
(19, 'edit_product_discount_from_pos_screen', 'web', '2022-10-13 17:12:35', '2022-10-13 17:12:35'),
(20, 'edit_product_price_from_pos_screen', 'web', '2022-10-13 17:12:36', '2022-10-13 17:12:36'),
(21, 'access_shipping', 'web', '2022-10-13 17:12:36', '2022-10-13 17:12:36'),
(22, 'purchase.update_status', 'web', '2022-10-13 17:12:36', '2022-10-13 17:12:36'),
(23, 'list_drafts', 'web', '2022-10-13 17:12:37', '2022-10-13 17:12:37'),
(24, 'list_quotations', 'web', '2022-10-13 17:12:37', '2022-10-13 17:12:37'),
(25, 'user.view', 'web', '2022-10-13 17:12:51', NULL),
(26, 'user.create', 'web', '2022-10-13 17:12:51', NULL),
(27, 'user.update', 'web', '2022-10-13 17:12:51', NULL),
(28, 'user.delete', 'web', '2022-10-13 17:12:51', NULL),
(29, 'supplier.view', 'web', '2022-10-13 17:12:51', NULL),
(30, 'supplier.create', 'web', '2022-10-13 17:12:51', NULL),
(31, 'supplier.update', 'web', '2022-10-13 17:12:51', NULL),
(32, 'supplier.delete', 'web', '2022-10-13 17:12:51', NULL),
(33, 'customer.view', 'web', '2022-10-13 17:12:51', NULL),
(34, 'customer.create', 'web', '2022-10-13 17:12:51', NULL),
(35, 'customer.update', 'web', '2022-10-13 17:12:51', NULL),
(36, 'customer.delete', 'web', '2022-10-13 17:12:51', NULL),
(37, 'product.view', 'web', '2022-10-13 17:12:51', NULL),
(38, 'product.create', 'web', '2022-10-13 17:12:51', NULL),
(39, 'product.update', 'web', '2022-10-13 17:12:51', NULL),
(40, 'product.delete', 'web', '2022-10-13 17:12:51', NULL),
(41, 'purchase.view', 'web', '2022-10-13 17:12:51', NULL),
(42, 'purchase.create', 'web', '2022-10-13 17:12:51', NULL),
(43, 'purchase.update', 'web', '2022-10-13 17:12:51', NULL),
(44, 'purchase.delete', 'web', '2022-10-13 17:12:51', NULL),
(45, 'sell.view', 'web', '2022-10-13 17:12:51', NULL),
(46, 'sell.create', 'web', '2022-10-13 17:12:51', NULL),
(47, 'sell.update', 'web', '2022-10-13 17:12:51', NULL),
(48, 'sell.delete', 'web', '2022-10-13 17:12:51', NULL),
(49, 'purchase_n_sell_report.view', 'web', '2022-10-13 17:12:51', NULL),
(50, 'contacts_report.view', 'web', '2022-10-13 17:12:51', NULL),
(51, 'stock_report.view', 'web', '2022-10-13 17:12:51', NULL),
(52, 'tax_report.view', 'web', '2022-10-13 17:12:51', NULL),
(53, 'trending_product_report.view', 'web', '2022-10-13 17:12:51', NULL),
(54, 'register_report.view', 'web', '2022-10-13 17:12:51', NULL),
(55, 'sales_representative.view', 'web', '2022-10-13 17:12:51', NULL),
(56, 'expense_report.view', 'web', '2022-10-13 17:12:51', NULL),
(57, 'business_settings.access', 'web', '2022-10-13 17:12:51', NULL),
(58, 'barcode_settings.access', 'web', '2022-10-13 17:12:51', NULL),
(59, 'invoice_settings.access', 'web', '2022-10-13 17:12:51', NULL),
(60, 'brand.view', 'web', '2022-10-13 17:12:51', NULL),
(61, 'brand.create', 'web', '2022-10-13 17:12:51', NULL),
(62, 'brand.update', 'web', '2022-10-13 17:12:51', NULL),
(63, 'brand.delete', 'web', '2022-10-13 17:12:51', NULL),
(64, 'tax_rate.view', 'web', '2022-10-13 17:12:51', NULL),
(65, 'tax_rate.create', 'web', '2022-10-13 17:12:51', NULL),
(66, 'tax_rate.update', 'web', '2022-10-13 17:12:51', NULL),
(67, 'tax_rate.delete', 'web', '2022-10-13 17:12:51', NULL),
(68, 'unit.view', 'web', '2022-10-13 17:12:51', NULL),
(69, 'unit.create', 'web', '2022-10-13 17:12:51', NULL),
(70, 'unit.update', 'web', '2022-10-13 17:12:51', NULL),
(71, 'unit.delete', 'web', '2022-10-13 17:12:51', NULL),
(72, 'category.view', 'web', '2022-10-13 17:12:51', NULL),
(73, 'category.create', 'web', '2022-10-13 17:12:51', NULL),
(74, 'category.update', 'web', '2022-10-13 17:12:51', NULL),
(75, 'category.delete', 'web', '2022-10-13 17:12:51', NULL),
(76, 'expense.access', 'web', '2022-10-13 17:12:51', NULL),
(77, 'access_all_locations', 'web', '2022-10-13 17:12:51', NULL),
(78, 'dashboard.data', 'web', '2022-10-13 17:12:51', NULL),
(79, 'location.1', 'web', '2022-10-13 17:35:41', '2022-10-13 17:35:41'),
(80, 'location.2', 'web', '2023-05-30 00:03:44', '2023-05-30 00:03:44'),
(81, 'selling_price_group.1', 'web', '2023-06-08 10:04:55', '2023-06-08 10:04:55'),
(82, 'location.3', 'web', '2023-06-13 13:27:15', '2023-06-13 13:27:15'),
(83, 'location.4', 'web', '2023-06-13 13:00:01', '2023-06-13 13:00:01');

-- --------------------------------------------------------

--
-- Table structure for table `printers`
--

CREATE TABLE `printers` (
  `id` int UNSIGNED NOT NULL,
  `business_id` int UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection_type` enum('network','windows','linux') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `capability_profile` enum('default','simple','SP2000','TEP-200M','P822D') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default',
  `char_per_line` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ip_address` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `port` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `path` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` int UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `business_id` int UNSIGNED NOT NULL,
  `type` enum('single','variable','modifier','combo') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `unit_id` int UNSIGNED DEFAULT NULL,
  `sub_unit_ids` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `brand_id` int UNSIGNED DEFAULT NULL,
  `category_id` int UNSIGNED DEFAULT NULL,
  `sub_category_id` int UNSIGNED DEFAULT NULL,
  `tax` int UNSIGNED DEFAULT NULL,
  `tax_type` enum('inclusive','exclusive') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `enable_stock` tinyint(1) NOT NULL DEFAULT '0',
  `alert_quantity` decimal(22,4) DEFAULT NULL,
  `sku` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `barcode_type` enum('C39','C128','EAN13','EAN8','UPCA','UPCE') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'C128',
  `expiry_period` decimal(4,2) DEFAULT NULL,
  `expiry_period_type` enum('days','months') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `enable_sr_no` tinyint(1) NOT NULL DEFAULT '0',
  `weight` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_custom_field1` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_custom_field2` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_custom_field3` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_custom_field4` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_by` int UNSIGNED NOT NULL,
  `warranty_id` int DEFAULT NULL,
  `is_inactive` tinyint(1) NOT NULL DEFAULT '0',
  `not_for_selling` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `business_id`, `type`, `unit_id`, `sub_unit_ids`, `brand_id`, `category_id`, `sub_category_id`, `tax`, `tax_type`, `enable_stock`, `alert_quantity`, `sku`, `barcode_type`, `expiry_period`, `expiry_period_type`, `enable_sr_no`, `weight`, `product_custom_field1`, `product_custom_field2`, `product_custom_field3`, `product_custom_field4`, `image`, `product_description`, `created_by`, `warranty_id`, `is_inactive`, `not_for_selling`, `created_at`, `updated_at`) VALUES
(193, 'Test', 3, 'single', 5, NULL, NULL, 7, NULL, NULL, 'exclusive', 1, NULL, '0193', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, NULL, 0, 0, '2023-05-31 11:19:55', '2023-05-31 11:19:55'),
(194, 'Oraimo Cable Micro', 3, 'single', 5, NULL, NULL, 7, NULL, NULL, 'inclusive', 1, '0.0000', '0194', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '', NULL, 8, NULL, 0, 0, '2023-05-31 11:28:41', '2023-06-08 14:13:04'),
(195, 'Oraimo Cable Type C', 3, 'single', 5, NULL, NULL, 7, NULL, NULL, 'inclusive', 1, '0.0000', '0195', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 8, NULL, 0, 0, '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(196, 'K Fulai 1M', 3, 'single', 5, NULL, NULL, 7, NULL, NULL, 'inclusive', 1, '0.0000', '0196', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '', NULL, 8, NULL, 0, 0, '2023-05-31 11:28:41', '2023-06-08 14:00:13'),
(197, 'K Fulai 2M', 3, 'single', 5, NULL, NULL, 7, NULL, NULL, 'inclusive', 1, '0.0000', '0197', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 8, NULL, 0, 0, '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(198, 'Lighting Cable', 3, 'single', 5, NULL, NULL, 7, NULL, NULL, 'inclusive', 1, '0.0000', '0198', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 8, NULL, 0, 0, '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(199, 'Power Bank Cable', 3, 'single', 5, NULL, NULL, 7, NULL, NULL, 'inclusive', 1, '0.0000', '0199', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 8, NULL, 0, 0, '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(200, 'X max Cable', 3, 'single', 5, NULL, NULL, 7, NULL, NULL, 'inclusive', 1, '0.0000', '0200', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 8, NULL, 0, 0, '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(201, 'FDK cables', 3, 'single', 5, NULL, NULL, 7, NULL, NULL, 'inclusive', 1, '0.0000', '0201', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '', NULL, 8, NULL, 0, 0, '2023-05-31 11:28:41', '2023-06-03 10:27:01'),
(202, 'FDK C to C', 3, 'single', 5, NULL, NULL, 7, NULL, NULL, 'inclusive', 1, '0.0000', '0202', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 8, NULL, 0, 0, '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(203, 'Samsung C to C 2M cable', 3, 'single', 5, NULL, NULL, 7, NULL, NULL, 'inclusive', 1, '0.0000', '0203', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 8, NULL, 0, 0, '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(204, 'K Fulai C to C', 3, 'single', 5, NULL, NULL, 7, NULL, NULL, 'inclusive', 1, '0.0000', '0204', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 8, NULL, 0, 0, '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(205, 'Type C to iPhone cable', 3, 'single', 5, NULL, NULL, 7, NULL, NULL, 'inclusive', 1, '0.0000', '0205', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 8, NULL, 0, 0, '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(206, 'iPhone to Auxilliary cable', 3, 'single', 5, NULL, NULL, 7, NULL, NULL, 'inclusive', 1, '0.0000', '0206', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 8, NULL, 0, 0, '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(207, 'Jack to Jack Cable', 3, 'single', 5, NULL, NULL, 7, NULL, NULL, 'inclusive', 1, '0.0000', '0207', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 8, NULL, 0, 0, '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(208, 'Just for music', 3, 'single', 5, NULL, NULL, 7, NULL, NULL, 'inclusive', 1, '0.0000', '0208', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 8, NULL, 0, 0, '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(209, 'iPhone 14 pro max', 3, 'single', 5, NULL, NULL, 6, NULL, NULL, 'inclusive', 1, '0.0000', '0209', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 8, NULL, 0, 0, '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(210, 'iPhone 13 Pro max', 3, 'single', 5, NULL, NULL, 6, NULL, NULL, 'inclusive', 1, '0.0000', '0210', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 8, NULL, 0, 0, '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(211, 'iPhone 11 pro Max', 3, 'single', 5, NULL, NULL, 6, NULL, NULL, 'inclusive', 1, '0.0000', '0211', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 8, NULL, 0, 0, '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(212, 'iPhone 11', 3, 'single', 5, NULL, NULL, 6, NULL, NULL, 'inclusive', 1, '0.0000', '0212', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 8, NULL, 0, 0, '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(213, 'iPhone 7G', 3, 'single', 5, NULL, NULL, 6, NULL, NULL, 'inclusive', 1, '0.0000', '0213', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 8, NULL, 0, 0, '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(214, 'iPhone 12', 3, 'single', 5, NULL, NULL, 6, NULL, NULL, 'inclusive', 1, '0.0000', '0214', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 8, NULL, 0, 0, '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(215, 'iPhone x', 3, 'single', 5, NULL, NULL, 6, NULL, NULL, 'inclusive', 1, '0.0000', '0215', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 8, NULL, 0, 0, '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(216, 'iPhone 7P', 3, 'single', 5, NULL, NULL, 6, NULL, NULL, 'inclusive', 1, '0.0000', '0216', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 8, NULL, 0, 0, '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(217, 'Samsung A51', 3, 'single', 5, NULL, NULL, 6, NULL, NULL, 'inclusive', 1, '0.0000', '0217', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 8, NULL, 0, 0, '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(218, 'Samsung A12', 3, 'single', 5, NULL, NULL, 6, NULL, NULL, 'inclusive', 1, '0.0000', '0218', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 8, NULL, 0, 0, '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(219, 'Samsung A21S', 3, 'single', 5, NULL, NULL, 6, NULL, NULL, 'inclusive', 1, '0.0000', '0219', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 8, NULL, 0, 0, '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(220, 'Samsung A23', 3, 'single', 5, NULL, NULL, 6, NULL, NULL, 'inclusive', 1, '0.0000', '0220', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 8, NULL, 0, 0, '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(221, 'Samsung A04S', 3, 'single', 5, NULL, NULL, 6, NULL, NULL, 'inclusive', 1, '0.0000', '0221', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 8, NULL, 0, 0, '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(222, 'Samsung A20', 3, 'single', 5, NULL, NULL, 6, NULL, NULL, 'inclusive', 1, '0.0000', '0222', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 8, NULL, 0, 0, '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(223, 'Samsung A33', 3, 'single', 5, NULL, NULL, 6, NULL, NULL, 'inclusive', 1, '0.0000', '0223', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 8, NULL, 0, 0, '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(224, 'Samsung A52', 3, 'single', 5, NULL, NULL, 6, NULL, NULL, 'inclusive', 1, '0.0000', '0224', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 8, NULL, 0, 0, '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(225, 'Samsung A73', 3, 'single', 5, NULL, NULL, 6, NULL, NULL, 'inclusive', 1, '0.0000', '0225', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 8, NULL, 0, 0, '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(226, 'Samsung A53', 3, 'single', 5, NULL, NULL, 6, NULL, NULL, 'inclusive', 1, '0.0000', '0226', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 8, NULL, 0, 0, '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(227, 'Samsung S22 Ultra', 3, 'single', 5, NULL, NULL, 6, NULL, NULL, 'inclusive', 1, '0.0000', '0227', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 8, NULL, 0, 0, '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(228, 'Samsung A04E', 3, 'single', 5, NULL, NULL, 6, NULL, NULL, 'inclusive', 1, '0.0000', '0228', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 8, NULL, 0, 0, '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(229, 'Samsung S9 Plus', 3, 'single', 5, NULL, NULL, 6, NULL, NULL, 'inclusive', 1, '0.0000', '0229', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 8, NULL, 0, 0, '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(230, 'Samsung A13', 3, 'single', 5, NULL, NULL, 6, NULL, NULL, 'inclusive', 1, '0.0000', '0230', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 8, NULL, 0, 0, '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(231, 'Samsung A03S', 3, 'single', 5, NULL, NULL, 6, NULL, NULL, 'inclusive', 1, '0.0000', '0231', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 8, NULL, 0, 0, '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(232, 'Samsung A03 Core', 3, 'single', 5, NULL, NULL, 6, NULL, NULL, 'inclusive', 1, '0.0000', '0232', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 8, NULL, 0, 0, '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(233, 'Realme C33', 3, 'single', 5, NULL, NULL, 6, NULL, NULL, 'inclusive', 1, '0.0000', '0233', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 8, NULL, 0, 0, '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(234, 'Realme C35', 3, 'single', 5, NULL, NULL, 6, NULL, NULL, 'inclusive', 1, '0.0000', '0234', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 8, NULL, 0, 0, '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(235, 'Realme C30S', 3, 'single', 5, NULL, NULL, 6, NULL, NULL, 'inclusive', 1, '0.0000', '0235', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 8, NULL, 0, 0, '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(236, 'Tecno Smart 5', 3, 'single', 5, NULL, NULL, 6, NULL, NULL, 'inclusive', 1, '0.0000', '0236', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 8, NULL, 0, 0, '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(237, 'Redmi 10C', 3, 'single', 5, NULL, NULL, 6, NULL, NULL, 'inclusive', 1, '0.0000', '0237', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 8, NULL, 0, 0, '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(238, 'Redmi A1+', 3, 'single', 5, NULL, NULL, 6, NULL, NULL, 'inclusive', 1, '0.0000', '0238', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 8, NULL, 0, 0, '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(239, 'Tecno  Spark 9', 3, 'single', 5, NULL, NULL, 6, NULL, NULL, 'inclusive', 1, '0.0000', '0239', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 8, NULL, 0, 0, '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(240, 'Tecno Spark 7', 3, 'single', 5, NULL, NULL, 6, NULL, NULL, 'inclusive', 1, '0.0000', '0240', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 8, NULL, 0, 0, '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(241, 'Tecno  Pop', 3, 'single', 5, NULL, NULL, 6, NULL, NULL, 'inclusive', 1, '0.0000', '0241', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 8, NULL, 0, 0, '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(242, 'Tecno Pop 6 Go', 3, 'single', 5, NULL, NULL, 6, NULL, NULL, 'inclusive', 1, '0.0000', '0242', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 8, NULL, 0, 0, '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(243, 'Tecno Camon 12', 3, 'single', 5, NULL, NULL, 6, NULL, NULL, 'inclusive', 1, '0.0000', '0243', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 8, NULL, 0, 0, '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(244, 'Tecno Camon 15', 3, 'single', 5, NULL, NULL, 6, NULL, NULL, 'inclusive', 1, '0.0000', '0244', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 8, NULL, 0, 0, '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(245, 'Tecno Camon 17', 3, 'single', 5, NULL, NULL, 6, NULL, NULL, 'inclusive', 1, '0.0000', '0245', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 8, NULL, 0, 0, '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(246, 'Tecno Pop 6 Pro', 3, 'single', 5, NULL, NULL, 6, NULL, NULL, 'inclusive', 1, '0.0000', '0246', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 8, NULL, 0, 0, '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(247, 'Infinix 12i', 3, 'single', 5, NULL, NULL, 6, NULL, NULL, 'inclusive', 1, '0.0000', '0247', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 8, NULL, 0, 0, '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(248, 'Infinix Hot 20i', 3, 'single', 5, NULL, NULL, 6, NULL, NULL, 'inclusive', 1, '0.0000', '0248', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 8, NULL, 0, 0, '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(249, 'Infinix Hot 8', 3, 'single', 5, NULL, NULL, 8, NULL, NULL, 'inclusive', 1, '0.0000', '0249', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 8, NULL, 0, 0, '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(250, 'C33', 3, 'single', 5, NULL, NULL, 8, NULL, NULL, 'inclusive', 1, '0.0000', '0250', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 8, NULL, 0, 0, '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(251, 'Infinix Hot 20i', 3, 'single', 5, NULL, NULL, 8, NULL, NULL, 'inclusive', 1, '0.0000', '0251', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 8, NULL, 0, 0, '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(252, 'Camon 19', 3, 'single', 5, NULL, NULL, 8, NULL, NULL, 'inclusive', 1, '0.0000', '0252', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 8, NULL, 0, 0, '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(253, 'A73', 3, 'single', 5, NULL, NULL, 8, NULL, NULL, 'inclusive', 1, '0.0000', '0253', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 8, NULL, 0, 0, '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(254, 'A53', 3, 'single', 5, NULL, NULL, 8, NULL, NULL, 'inclusive', 1, '0.0000', '0254', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 8, NULL, 0, 0, '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(255, 'Samsung A 23', 3, 'single', 5, NULL, NULL, 8, NULL, NULL, 'inclusive', 1, '0.0000', '0255', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '', NULL, 8, NULL, 0, 0, '2023-05-31 11:28:42', '2023-05-31 11:59:07'),
(256, 'Samrk 6 plus', 3, 'single', 5, NULL, NULL, 8, NULL, NULL, 'inclusive', 1, '0.0000', '0256', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 8, NULL, 0, 0, '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(257, '9A', 3, 'single', 5, NULL, NULL, 8, NULL, NULL, 'inclusive', 1, '0.0000', '0257', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 8, NULL, 0, 0, '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(258, 'A96', 3, 'single', 5, NULL, NULL, 8, NULL, NULL, 'inclusive', 1, '0.0000', '0258', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 8, NULL, 0, 0, '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(259, 'A17', 3, 'single', 5, NULL, NULL, 8, NULL, NULL, 'inclusive', 1, '0.0000', '0259', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 8, NULL, 0, 0, '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(260, 'A32', 3, 'single', 5, NULL, NULL, 8, NULL, NULL, 'inclusive', 1, '0.0000', '0260', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 8, NULL, 0, 0, '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(261, 'A50', 3, 'single', 5, NULL, NULL, 8, NULL, NULL, 'inclusive', 1, '0.0000', '0261', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 8, NULL, 0, 0, '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(262, 'A03s', 3, 'single', 5, NULL, NULL, 8, NULL, NULL, 'inclusive', 1, '0.0000', '0262', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 8, NULL, 0, 0, '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(263, 'Smart 6', 3, 'single', 5, NULL, NULL, 8, NULL, NULL, 'inclusive', 1, '0.0000', '0263', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 8, NULL, 0, 0, '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(264, 'Smart 9 T', 3, 'single', 5, NULL, NULL, 8, NULL, NULL, 'inclusive', 1, '0.0000', '0264', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 8, NULL, 0, 0, '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(265, 'Spark 8C', 3, 'single', 5, NULL, NULL, 8, NULL, NULL, 'inclusive', 1, '0.0000', '0265', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 8, NULL, 0, 0, '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(266, 'A04s', 3, 'single', 5, NULL, NULL, 8, NULL, NULL, 'inclusive', 1, '0.0000', '0266', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 8, NULL, 0, 0, '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(267, 'A04', 3, 'single', 5, NULL, NULL, 8, NULL, NULL, 'inclusive', 1, '0.0000', '0267', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 8, NULL, 0, 0, '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(268, 'Pop 6 Pro', 3, 'single', 5, NULL, NULL, 8, NULL, NULL, 'inclusive', 1, '0.0000', '0268', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 8, NULL, 0, 0, '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(269, 'Spark 9', 3, 'single', 5, NULL, NULL, 8, NULL, NULL, 'inclusive', 1, '0.0000', '0269', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 8, NULL, 0, 0, '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(270, 'Smart 6 plus', 3, 'single', 5, NULL, NULL, 8, NULL, NULL, 'inclusive', 1, '0.0000', '0270', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 8, NULL, 0, 0, '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(271, 'Infinix Hot 12', 3, 'single', 5, NULL, NULL, 8, NULL, NULL, 'inclusive', 1, '0.0000', '0271', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 8, NULL, 0, 0, '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(272, 'Realme C35', 3, 'single', 5, NULL, NULL, 8, NULL, NULL, 'inclusive', 1, '0.0000', '0272', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 8, NULL, 0, 0, '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(273, 'Infinix Hot 12 play', 3, 'single', 5, NULL, NULL, 8, NULL, NULL, 'inclusive', 1, '0.0000', '0273', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 8, NULL, 0, 0, '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(274, 'Redmi A1+', 3, 'single', 5, NULL, NULL, 6, NULL, NULL, 'inclusive', 1, '0.0000', '0274', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '', NULL, 8, NULL, 0, 0, '2023-05-31 11:28:42', '2023-06-08 13:15:22'),
(275, 'Redmi 10C', 3, 'single', 5, NULL, NULL, 8, NULL, NULL, 'inclusive', 1, '0.0000', '0275', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 8, NULL, 0, 0, '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(276, '45 w car charger', 3, 'single', 5, NULL, NULL, 9, NULL, NULL, 'inclusive', 1, '0.0000', '0276', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 8, NULL, 0, 0, '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(277, 'Samsung Android Charger', 3, 'single', 5, NULL, NULL, 9, NULL, NULL, 'inclusive', 1, '0.0000', '0277', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 8, NULL, 0, 0, '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(278, 'Dadu chargers', 3, 'single', 5, NULL, NULL, 9, NULL, NULL, 'inclusive', 1, '0.0000', '0278', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 8, NULL, 0, 0, '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(279, 'FDK Chargers', 3, 'single', 5, NULL, NULL, 9, NULL, NULL, 'inclusive', 1, '0.0000', '0279', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 8, NULL, 0, 0, '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(280, '45 W C to C Charger', 3, 'single', 5, NULL, NULL, 9, NULL, NULL, 'inclusive', 1, '0.0000', '0280', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 8, NULL, 0, 0, '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(281, '65 W C to C Charger', 3, 'single', 5, NULL, NULL, 9, NULL, NULL, 'inclusive', 1, '0.0000', '0281', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 8, NULL, 0, 0, '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(282, '20 W iPhone Charger', 3, 'single', 5, NULL, NULL, 9, NULL, NULL, 'inclusive', 1, '0.0000', '0282', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 8, NULL, 0, 0, '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(283, '35 W iPhone charger', 3, 'single', 5, NULL, NULL, 9, NULL, NULL, 'inclusive', 1, '0.0000', '0283', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 8, NULL, 0, 0, '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(284, 'Oraimo Micro Charger', 3, 'single', 5, NULL, NULL, 9, NULL, NULL, 'inclusive', 1, '0.0000', '0284', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 8, NULL, 0, 0, '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(285, 'Oraimo Type C Charger', 3, 'single', 5, NULL, NULL, 9, NULL, NULL, 'inclusive', 1, '0.0000', '0285', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '', NULL, 8, NULL, 0, 0, '2023-05-31 11:28:42', '2023-06-08 14:13:46'),
(286, 'RXD iPhone earphone', 3, 'single', 5, NULL, NULL, 11, NULL, NULL, 'inclusive', 1, '0.0000', '0286', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 8, NULL, 0, 0, '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(287, 'RXD rubber earphone', 3, 'single', 5, NULL, NULL, 11, NULL, NULL, 'inclusive', 1, '0.0000', '0287', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 8, NULL, 0, 0, '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(288, 'YJ Earphone Samsung', 3, 'single', 5, NULL, NULL, 11, NULL, NULL, 'inclusive', 1, '0.0000', '0288', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 8, NULL, 0, 0, '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(289, 'FDK rubber earphone', 3, 'single', 5, NULL, NULL, 11, NULL, NULL, 'inclusive', 1, '0.0000', '0289', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 8, NULL, 0, 0, '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(290, 'FDK iPhone earphone', 3, 'single', 5, NULL, NULL, 11, NULL, NULL, 'inclusive', 1, '0.0000', '0290', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 8, NULL, 0, 0, '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(291, 'S8/S9 earphone', 3, 'single', 5, NULL, NULL, 11, NULL, NULL, 'inclusive', 1, '0.0000', '0291', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '', NULL, 8, NULL, 0, 0, '2023-05-31 11:28:42', '2023-06-12 17:09:09'),
(292, 'type C earphone', 3, 'single', 5, NULL, NULL, 11, NULL, NULL, 'inclusive', 1, '0.0000', '0292', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 8, NULL, 0, 0, '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(293, 'Vidvie hs  605', 3, 'single', 5, NULL, NULL, 11, NULL, NULL, 'inclusive', 1, '0.0000', '0293', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '', NULL, 8, NULL, 0, 0, '2023-05-31 11:28:42', '2023-06-08 14:27:22'),
(294, 'Skull Candy earphone', 3, 'single', 5, NULL, NULL, 11, NULL, NULL, 'inclusive', 1, '0.0000', '0294', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 8, NULL, 0, 0, '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(295, 'Vidvie hs  645', 3, 'single', 5, NULL, NULL, 11, NULL, NULL, 'inclusive', 1, '0.0000', '0295', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '', NULL, 8, NULL, 0, 0, '2023-05-31 11:28:42', '2023-06-08 14:28:38'),
(296, 'Inkax Earphone', 3, 'single', 5, NULL, NULL, 11, NULL, NULL, 'inclusive', 1, '0.0000', '0296', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 8, NULL, 0, 0, '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(297, 'Pop up earphone iPhone', 3, 'single', 5, NULL, NULL, 11, NULL, NULL, 'inclusive', 1, '0.0000', '0297', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 8, NULL, 0, 0, '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(298, 'X1 vision earphone', 3, 'single', 5, NULL, NULL, 11, NULL, NULL, 'inclusive', 1, '0.0000', '0298', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 8, NULL, 0, 0, '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(299, 'X2 vision earphone', 3, 'single', 5, NULL, NULL, 11, NULL, NULL, 'inclusive', 1, '0.0000', '0299', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 8, NULL, 0, 0, '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(300, 'X4 earphone', 3, 'single', 5, NULL, NULL, 11, NULL, NULL, 'inclusive', 1, '0.0000', '0300', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 8, NULL, 0, 0, '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(301, 'G6 Celebrat earphone', 3, 'single', 5, NULL, NULL, 11, NULL, NULL, 'inclusive', 1, '0.0000', '0301', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 8, NULL, 0, 0, '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(302, 'D1 celebrate earphone', 3, 'single', 5, NULL, NULL, 11, NULL, NULL, 'inclusive', 1, '0.0000', '0302', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 8, NULL, 0, 0, '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(303, 'D2 celebrate earphone', 3, 'single', 5, NULL, NULL, 11, NULL, NULL, 'inclusive', 1, '0.0000', '0303', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 8, NULL, 0, 0, '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(304, 'G4 celebrate earphone', 3, 'single', 5, NULL, NULL, 11, NULL, NULL, 'inclusive', 1, '0.0000', '0304', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 8, NULL, 0, 0, '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(305, 'G12 celebrate earphone', 3, 'single', 5, NULL, NULL, 11, NULL, NULL, 'inclusive', 1, '0.0000', '0305', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 8, NULL, 0, 0, '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(306, 'L350', 3, 'single', 5, NULL, NULL, 10, NULL, NULL, 'inclusive', 1, '0.0000', '0306', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 8, NULL, 0, 0, '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(307, 'L300', 3, 'single', 5, NULL, NULL, 10, NULL, NULL, 'inclusive', 1, '0.0000', '0307', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 8, NULL, 0, 0, '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(308, '7 Max Headphone', 3, 'single', 5, NULL, NULL, 10, NULL, NULL, 'inclusive', 1, '0.0000', '0308', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 8, NULL, 0, 0, '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(309, 'Lelisu Ls 210', 3, 'single', 5, NULL, NULL, 10, NULL, NULL, 'inclusive', 1, '0.0000', '0309', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 8, NULL, 0, 0, '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(310, 'Lelisu Ls 212', 3, 'single', 5, NULL, NULL, 10, NULL, NULL, 'inclusive', 1, '0.0000', '0310', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 8, NULL, 0, 0, '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(311, 'A18 Celebrate headphone', 3, 'single', 5, NULL, NULL, 10, NULL, NULL, 'inclusive', 1, '0.0000', '0311', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 8, NULL, 0, 0, '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(312, 'A23 Celebrate headphone', 3, 'single', 5, NULL, NULL, 10, NULL, NULL, 'inclusive', 1, '0.0000', '0312', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 8, NULL, 0, 0, '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(313, 'A16 Celebrate Neckband', 3, 'single', 5, NULL, NULL, 12, NULL, NULL, 'inclusive', 1, '0.0000', '0313', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '', NULL, 8, NULL, 0, 0, '2023-05-31 11:28:42', '2023-06-08 13:18:17'),
(314, 'Lelisu Ls 29', 3, 'single', 5, NULL, NULL, 12, NULL, NULL, 'inclusive', 1, '0.0000', '0314', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 8, NULL, 0, 0, '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(315, 'Lelisu Ls 03A', 3, 'single', 5, NULL, NULL, 12, NULL, NULL, 'inclusive', 1, '0.0000', '0315', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 8, NULL, 0, 0, '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(316, 'Az30A', 3, 'single', 5, NULL, NULL, 12, NULL, NULL, 'inclusive', 1, '0.0000', '0316', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 8, NULL, 0, 0, '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(317, 'Vidvie neckband', 3, 'single', 5, NULL, NULL, 12, NULL, NULL, 'inclusive', 1, '0.0000', '0317', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 8, NULL, 0, 0, '2023-05-31 11:28:43', '2023-05-31 11:28:43'),
(318, 'Airdot', 3, 'single', 5, NULL, NULL, 13, NULL, NULL, 'inclusive', 1, '0.0000', '0318', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 8, NULL, 0, 0, '2023-05-31 11:28:43', '2023-05-31 11:28:43'),
(319, 'HQ - 12 Air pod', 3, 'single', 5, NULL, NULL, 13, NULL, NULL, 'inclusive', 1, '0.0000', '0319', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 8, NULL, 0, 0, '2023-05-31 11:28:43', '2023-05-31 11:28:43'),
(320, '204 Wireless', 3, 'single', 5, NULL, NULL, 13, NULL, NULL, 'inclusive', 1, '0.0000', '0320', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 8, NULL, 0, 0, '2023-05-31 11:28:43', '2023-05-31 11:28:43'),
(321, 'Bose S30 Airpod', 3, 'single', 5, NULL, NULL, 13, NULL, NULL, 'inclusive', 1, '0.0000', '0321', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '', NULL, 8, NULL, 0, 0, '2023-05-31 11:28:43', '2023-06-05 17:06:15'),
(322, 'I9S Airpod', 3, 'single', 5, NULL, NULL, 13, NULL, NULL, 'inclusive', 1, '0.0000', '0322', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 8, NULL, 0, 0, '2023-05-31 11:28:43', '2023-05-31 11:28:43'),
(323, 'F9 TWS', 3, 'single', 5, NULL, NULL, 13, NULL, NULL, 'inclusive', 1, '0.0000', '0323', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 8, NULL, 0, 0, '2023-05-31 11:28:43', '2023-05-31 11:28:43'),
(324, 'iPhone Lighting Connctor Pods', 3, 'single', 5, NULL, NULL, 13, NULL, NULL, 'inclusive', 1, '0.0000', '0324', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 8, NULL, 0, 0, '2023-05-31 11:28:43', '2023-05-31 11:28:43'),
(325, 'Smart Watch Charger.Wireless', 3, 'single', 5, NULL, NULL, 14, NULL, NULL, 'inclusive', 1, '0.0000', '0325', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '', NULL, 8, NULL, 0, 0, '2023-05-31 11:28:43', '2023-05-31 14:08:28'),
(326, 'WHOO2 Mouse', 3, 'single', 5, NULL, NULL, 15, NULL, NULL, 'inclusive', 1, '0.0000', '0326', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 8, NULL, 0, 0, '2023-05-31 11:28:43', '2023-05-31 11:28:43'),
(327, 'WL24 Wireless Mouse', 3, 'single', 5, NULL, NULL, 15, NULL, NULL, 'inclusive', 1, '0.0000', '0327', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 8, NULL, 0, 0, '2023-05-31 11:28:43', '2023-05-31 11:28:43'),
(328, 'Rechargeable Mouse', 3, 'single', 5, NULL, NULL, 15, NULL, NULL, 'inclusive', 1, '0.0000', '0328', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '', NULL, 8, NULL, 0, 0, '2023-05-31 11:28:43', '2023-06-08 14:16:34'),
(329, 'U9 Borne Conductor', 3, 'single', 5, NULL, NULL, 16, NULL, NULL, 'inclusive', 1, '0.0000', '0329', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 8, NULL, 0, 0, '2023-05-31 11:28:43', '2023-05-31 11:28:43'),
(330, 'Vidvie Borne Conductor', 3, 'single', 5, NULL, NULL, 16, NULL, NULL, 'inclusive', 1, '0.0000', '0330', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 8, NULL, 0, 0, '2023-05-31 11:28:43', '2023-05-31 11:28:43'),
(331, '20000 Polymer Power Bank', 3, 'single', 5, NULL, NULL, 17, NULL, NULL, 'inclusive', 1, '0.0000', '0331', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 8, NULL, 0, 0, '2023-05-31 11:28:43', '2023-05-31 11:28:43'),
(332, '11200 Polymer Power Bank', 3, 'single', 5, NULL, NULL, 17, NULL, NULL, 'inclusive', 1, '0.0000', '0332', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '', NULL, 8, NULL, 0, 0, '2023-05-31 11:28:43', '2023-06-08 10:14:41'),
(333, '8000 Polymer Power Bank', 3, 'single', 5, NULL, NULL, 17, NULL, NULL, 'inclusive', 1, '0.0000', '0333', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 8, NULL, 0, 0, '2023-05-31 11:28:43', '2023-05-31 11:28:43'),
(334, 'V2i 10000', 3, 'single', 5, NULL, NULL, 17, NULL, NULL, 'inclusive', 1, '0.0000', '0334', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 8, NULL, 0, 0, '2023-05-31 11:28:43', '2023-05-31 11:28:43'),
(335, 'PXZ V23 20000 Power bank', 3, 'single', 5, NULL, NULL, 17, NULL, NULL, 'inclusive', 1, '0.0000', '0335', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 8, NULL, 0, 0, '2023-05-31 11:28:43', '2023-05-31 11:28:43'),
(336, 'Samsung Adapter', 3, 'single', 5, NULL, NULL, 18, NULL, NULL, 'inclusive', 1, '0.0000', '0336', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 8, NULL, 0, 0, '2023-05-31 11:28:43', '2023-05-31 11:28:43'),
(337, '2 USB travel adapter', 3, 'single', 5, NULL, NULL, 18, NULL, NULL, 'inclusive', 1, '0.0000', '0337', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 8, NULL, 0, 0, '2023-05-31 11:28:43', '2023-05-31 11:28:43'),
(338, '6 in 1 Adapter', 3, 'single', 5, NULL, NULL, 18, NULL, NULL, 'inclusive', 1, '0.0000', '0338', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 8, NULL, 0, 0, '2023-05-31 11:28:43', '2023-05-31 11:28:43'),
(339, '11 in 1', 3, 'single', 5, NULL, NULL, 18, NULL, NULL, 'inclusive', 1, '0.0000', '0339', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '', NULL, 8, NULL, 0, 0, '2023-05-31 11:28:43', '2023-06-08 10:06:30'),
(340, '20 W iPhone Adapter', 3, 'single', 5, NULL, NULL, 18, NULL, NULL, 'inclusive', 1, '0.0000', '0340', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 8, NULL, 0, 0, '2023-05-31 11:28:43', '2023-05-31 11:28:43'),
(341, '35 W iPhone Adapter', 3, 'single', 5, NULL, NULL, 18, NULL, NULL, 'inclusive', 1, '0.0000', '0341', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 8, NULL, 0, 0, '2023-05-31 11:28:43', '2023-05-31 11:28:43'),
(342, '25 W C to C Adapter', 3, 'single', 5, NULL, NULL, 18, NULL, NULL, 'inclusive', 1, '0.0000', '0342', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '', NULL, 8, NULL, 0, 0, '2023-05-31 11:28:43', '2023-06-05 09:51:50'),
(343, 'Q7 Car Modulator', 3, 'single', 5, NULL, NULL, 19, NULL, NULL, 'inclusive', 1, '0.0000', '0343', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 8, NULL, 0, 0, '2023-05-31 11:28:43', '2023-05-31 11:28:43'),
(344, 'Q17 Modulator', 3, 'single', 5, NULL, NULL, 19, NULL, NULL, 'inclusive', 1, '0.0000', '0344', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 8, NULL, 0, 0, '2023-05-31 11:28:43', '2023-05-31 11:28:43'),
(345, 'A 30 Modulator', 3, 'single', 5, NULL, NULL, 19, NULL, NULL, 'inclusive', 1, '0.0000', '0345', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 8, NULL, 0, 0, '2023-05-31 11:28:43', '2023-05-31 11:28:43'),
(346, 'Haino Teko RW-15', 3, 'single', 5, NULL, NULL, 20, NULL, NULL, 'inclusive', 1, '0.0000', '0346', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '', NULL, 8, NULL, 0, 0, '2023-05-31 11:28:43', '2023-06-07 14:48:16'),
(347, 'Haino Teko RW-31 3 in 1.', 3, 'single', 5, NULL, NULL, 20, NULL, NULL, 'inclusive', 1, '0.0000', '0347', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '', NULL, 8, NULL, 0, 0, '2023-05-31 11:28:43', '2023-06-13 18:20:46'),
(348, 'Haino Teko RW-16', 3, 'single', 5, NULL, NULL, 20, NULL, NULL, 'inclusive', 1, '0.0000', '0348', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '', NULL, 8, NULL, 0, 0, '2023-05-31 11:28:43', '2023-06-08 13:45:04'),
(349, 'Haino Teko G8 Max Golden Edition', 3, 'single', 5, NULL, NULL, 20, NULL, NULL, 'inclusive', 1, '0.0000', '0349', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '', NULL, 8, NULL, 0, 0, '2023-05-31 11:28:43', '2023-06-14 12:06:48'),
(350, 'Haino Teko T93 Ultra Max', 3, 'single', 5, NULL, NULL, 20, NULL, NULL, 'inclusive', 1, '0.0000', '0350', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '', NULL, 8, NULL, 0, 0, '2023-05-31 11:28:43', '2023-06-13 18:23:26'),
(351, 'Haino Teko T86 Max', 3, 'single', 5, NULL, NULL, 20, NULL, NULL, 'inclusive', 1, '0.0000', '0351', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '', NULL, 8, NULL, 0, 0, '2023-05-31 11:28:43', '2023-06-14 12:05:33'),
(352, 'Haino Teko T87 Max', 3, 'single', 5, NULL, NULL, 20, NULL, NULL, 'inclusive', 1, '0.0000', '0352', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '', NULL, 8, NULL, 0, 0, '2023-05-31 11:28:43', '2023-06-14 12:08:13'),
(353, 'Haino Teko S1', 3, 'single', 5, NULL, NULL, 20, NULL, NULL, 'inclusive', 1, '0.0000', '0353', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '', NULL, 8, NULL, 0, 0, '2023-05-31 11:28:43', '2023-06-13 18:15:20'),
(354, 'Haino Teko G9 Ultra Max', 3, 'single', 5, NULL, NULL, 20, NULL, NULL, 'inclusive', 1, '0.0000', '0354', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '', NULL, 8, NULL, 0, 0, '2023-05-31 11:28:43', '2023-06-09 17:51:09'),
(355, 'Tablet holder', 3, 'single', 5, NULL, NULL, 21, NULL, NULL, 'inclusive', 1, '0.0000', '0355', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 8, NULL, 0, 0, '2023-05-31 11:28:43', '2023-05-31 11:28:43'),
(356, 'Desktop Holder', 3, 'single', 5, NULL, NULL, 21, NULL, NULL, 'inclusive', 1, '0.0000', '0356', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 8, NULL, 0, 0, '2023-05-31 11:28:43', '2023-05-31 11:28:43'),
(357, 'PS3', 3, 'single', 5, NULL, NULL, 22, NULL, NULL, 'inclusive', 1, '0.0000', '0357', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 8, NULL, 0, 0, '2023-05-31 11:28:43', '2023-05-31 11:28:43'),
(358, 'PS4', 3, 'single', 5, NULL, NULL, 22, NULL, NULL, 'inclusive', 1, '0.0000', '0358', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 8, NULL, 0, 0, '2023-05-31 11:28:43', '2023-05-31 11:28:43'),
(359, 'Smart Watch Charger', 3, 'single', 5, NULL, NULL, 14, NULL, NULL, 'inclusive', 1, '0.0000', '0359', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, NULL, 0, 0, '2023-05-31 14:17:14', '2023-05-31 14:23:11'),
(360, 'iPhone Lens Protector', 3, 'single', 5, NULL, NULL, 23, NULL, NULL, 'exclusive', 1, NULL, '0360', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, NULL, 0, 0, '2023-05-31 14:42:20', '2023-06-08 14:09:26'),
(361, 'IPhone 12 3D protector', 3, 'single', 5, NULL, NULL, 23, NULL, NULL, 'inclusive', 1, '0.0000', '0361', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '', NULL, 9, NULL, 0, 0, '2023-06-03 11:20:15', '2023-06-10 13:05:20'),
(362, 'iPhone 12 Pro Max 3D protector', 3, 'single', 5, NULL, NULL, 23, NULL, NULL, 'inclusive', 1, '0.0000', '0362', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '', NULL, 9, NULL, 0, 0, '2023-06-03 11:20:15', '2023-06-10 13:06:46'),
(363, 'iPhone 7G 3D protector', 3, 'single', 5, NULL, NULL, 23, NULL, NULL, 'inclusive', 1, '0.0000', '0363', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '', NULL, 9, NULL, 0, 0, '2023-06-03 11:20:15', '2023-06-10 13:07:42'),
(364, 'iPhone 6Plus 3D protector', 3, 'single', 5, NULL, NULL, 23, NULL, NULL, 'inclusive', 1, '0.0000', '0364', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 9, NULL, 0, 0, '2023-06-03 11:20:15', '2023-06-03 11:20:15'),
(365, 'iPhone XR 3D protector', 3, 'single', 5, NULL, NULL, 23, NULL, NULL, 'inclusive', 1, '0.0000', '0365', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 9, NULL, 0, 0, '2023-06-03 11:20:15', '2023-06-03 11:20:15'),
(366, 'iPhone X/XS 3D protector', 3, 'single', 5, NULL, NULL, 23, NULL, NULL, 'inclusive', 1, '0.0000', '0366', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 9, NULL, 0, 0, '2023-06-03 11:20:15', '2023-06-03 11:20:15'),
(367, 'iPhone & Plus 3D protector', 3, 'single', 5, NULL, NULL, 23, NULL, NULL, 'inclusive', 1, '0.0000', '0367', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 9, NULL, 0, 0, '2023-06-03 11:20:15', '2023-06-03 11:20:15'),
(368, 'IPhone 13 3D protector', 3, 'single', 5, NULL, NULL, 23, NULL, NULL, 'inclusive', 1, '0.0000', '0368', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 9, NULL, 0, 0, '2023-06-03 11:20:15', '2023-06-03 11:20:15'),
(369, 'iPhone 13 Pro Max protector', 3, 'single', 5, NULL, NULL, 23, NULL, NULL, 'inclusive', 1, '0.0000', '0369', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 9, NULL, 0, 0, '2023-06-03 11:20:15', '2023-06-03 11:20:15'),
(370, 'IPhone 14 3D protector', 3, 'single', 5, NULL, NULL, 23, NULL, NULL, 'inclusive', 1, '0.0000', '0370', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 9, NULL, 0, 0, '2023-06-03 11:20:15', '2023-06-03 11:20:15'),
(371, 'iPhone 14 Pro Max 3D protector', 3, 'single', 5, NULL, NULL, 23, NULL, NULL, 'inclusive', 1, '0.0000', '0371', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 9, NULL, 0, 0, '2023-06-03 11:20:15', '2023-06-03 11:20:15'),
(372, 'IPhone 14 Anti-Dust', 3, 'single', 5, NULL, NULL, 23, NULL, NULL, 'inclusive', 1, '0.0000', '0372', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 9, NULL, 0, 0, '2023-06-03 11:20:15', '2023-06-03 11:20:15'),
(373, 'iPhone Pro Max Anti-Dust', 3, 'single', 5, NULL, NULL, 23, NULL, NULL, 'inclusive', 1, '0.0000', '0373', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 9, NULL, 0, 0, '2023-06-03 11:20:15', '2023-06-03 11:20:15'),
(374, 'Samsung A13 PS Protector', 3, 'single', 5, NULL, NULL, 23, NULL, NULL, 'inclusive', 1, '0.0000', '0374', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 9, NULL, 0, 0, '2023-06-03 11:20:15', '2023-06-03 11:20:15'),
(375, 'Samsung A53 PS Protector', 3, 'single', 5, NULL, NULL, 23, NULL, NULL, 'inclusive', 1, '0.0000', '0375', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 9, NULL, 0, 0, '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(376, 'Samsung A70 PS Protector', 3, 'single', 5, NULL, NULL, 23, NULL, NULL, 'inclusive', 1, '0.0000', '0376', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 9, NULL, 0, 0, '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(377, 'Samsung A03 Core PS Protector', 3, 'single', 5, NULL, NULL, 23, NULL, NULL, 'inclusive', 1, '0.0000', '0377', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 9, NULL, 0, 0, '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(378, 'Samsung  A32 PS Protector', 3, 'single', 5, NULL, NULL, 23, NULL, NULL, 'inclusive', 1, '0.0000', '0378', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 9, NULL, 0, 0, '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(379, 'Samsung A73 PS Protector', 3, 'single', 5, NULL, NULL, 23, NULL, NULL, 'inclusive', 1, '0.0000', '0379', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 9, NULL, 0, 0, '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(380, 'Samsung A71 PS Protector', 3, 'single', 5, NULL, NULL, 23, NULL, NULL, 'inclusive', 1, '0.0000', '0380', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 9, NULL, 0, 0, '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(381, 'Samsung A10S PS Protector', 3, 'single', 5, NULL, NULL, 23, NULL, NULL, 'inclusive', 1, '0.0000', '0381', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 9, NULL, 0, 0, '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(382, 'Samsung A21 PS Protector', 3, 'single', 5, NULL, NULL, 23, NULL, NULL, 'inclusive', 1, '0.0000', '0382', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 9, NULL, 0, 0, '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(383, 'Samsung A22 PS Protector', 3, 'single', 5, NULL, NULL, 23, NULL, NULL, 'inclusive', 1, '0.0000', '0383', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 9, NULL, 0, 0, '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(384, 'Samsung A33 PS Protector', 3, 'single', 5, NULL, NULL, 23, NULL, NULL, 'inclusive', 1, '0.0000', '0384', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 9, NULL, 0, 0, '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(385, 'Samsung A20 PS Protector', 3, 'single', 5, NULL, NULL, 23, NULL, NULL, 'inclusive', 1, '0.0000', '0385', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 9, NULL, 0, 0, '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(386, 'Samsung A23 PS Protector', 3, 'single', 5, NULL, NULL, 23, NULL, NULL, 'inclusive', 1, '0.0000', '0386', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 9, NULL, 0, 0, '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(387, 'Samsung A50 PS Protector', 3, 'single', 5, NULL, NULL, 23, NULL, NULL, 'inclusive', 1, '0.0000', '0387', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 9, NULL, 0, 0, '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(388, 'iPhone 11/XP PS Protector', 3, 'single', 5, NULL, NULL, 23, NULL, NULL, 'inclusive', 1, '0.0000', '0388', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 9, NULL, 0, 0, '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(389, 'iPhone 11 Pro/X/XS PS Protector', 3, 'single', 5, NULL, NULL, 23, NULL, NULL, 'inclusive', 1, '0.0000', '0389', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 9, NULL, 0, 0, '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(390, 'iPhone 12 Pro Max PS Protector', 3, 'single', 5, NULL, NULL, 23, NULL, NULL, 'inclusive', 1, '0.0000', '0390', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 9, NULL, 0, 0, '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(391, 'iPhone 13 Pro PS Protector', 3, 'single', 5, NULL, NULL, 23, NULL, NULL, 'inclusive', 1, '0.0000', '0391', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 9, NULL, 0, 0, '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(392, 'IPhone 14 PS Protector', 3, 'single', 5, NULL, NULL, 23, NULL, NULL, 'inclusive', 1, '0.0000', '0392', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 9, NULL, 0, 0, '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(393, 'iPhone Pro PS Protector', 3, 'single', 5, NULL, NULL, 23, NULL, NULL, 'inclusive', 1, '0.0000', '0393', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 9, NULL, 0, 0, '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(394, 'iPhone 14 Pro Max PS Protector', 3, 'single', 5, NULL, NULL, 23, NULL, NULL, 'inclusive', 1, '0.0000', '0394', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 9, NULL, 0, 0, '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(395, 'Samsung S22 FG Protector', 3, 'single', 5, NULL, NULL, 23, NULL, NULL, 'inclusive', 1, '0.0000', '0395', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 9, NULL, 0, 0, '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(396, 'Samsung A21FG Protector', 3, 'single', 5, NULL, NULL, 23, NULL, NULL, 'inclusive', 1, '0.0000', '0396', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 9, NULL, 0, 0, '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(397, 'Samsung A22 Ultra FG Protector', 3, 'single', 5, NULL, NULL, 23, NULL, NULL, 'inclusive', 1, '0.0000', '0397', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 9, NULL, 0, 0, '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(398, 'Samsung S20+ FG Protector', 3, 'single', 5, NULL, NULL, 23, NULL, NULL, 'inclusive', 1, '0.0000', '0398', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 9, NULL, 0, 0, '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(399, 'Samsung Note 8 FG Protector', 3, 'single', 5, NULL, NULL, 23, NULL, NULL, 'inclusive', 1, '0.0000', '0399', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 9, NULL, 0, 0, '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(400, 'Samsung Note9 FG Protector', 3, 'single', 5, NULL, NULL, 23, NULL, NULL, 'inclusive', 1, '0.0000', '0400', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 9, NULL, 0, 0, '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(401, 'Samsung Note 9+ FG Protector', 3, 'single', 5, NULL, NULL, 23, NULL, NULL, 'inclusive', 1, '0.0000', '0401', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 9, NULL, 0, 0, '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(402, 'Samsung A21 Ultra FG Protector', 3, 'single', 5, NULL, NULL, 23, NULL, NULL, 'inclusive', 1, '0.0000', '0402', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 9, NULL, 0, 0, '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(403, 'Samsung A20+ FG Protector', 3, 'single', 5, NULL, NULL, 23, NULL, NULL, 'inclusive', 1, '0.0000', '0403', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 9, NULL, 0, 0, '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(404, 'Camon 12 MG Protector', 3, 'single', 5, NULL, NULL, 23, NULL, NULL, 'inclusive', 1, '0.0000', '0404', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 9, NULL, 0, 0, '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(405, 'Camon 18 MG Protector', 3, 'single', 5, NULL, NULL, 23, NULL, NULL, 'inclusive', 1, '0.0000', '0405', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 9, NULL, 0, 0, '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(406, 'Camon MG Protector', 3, 'single', 5, NULL, NULL, 23, NULL, NULL, 'inclusive', 1, '0.0000', '0406', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 9, NULL, 0, 0, '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(407, 'Samsung A70 MG Protector', 3, 'single', 5, NULL, NULL, 23, NULL, NULL, 'inclusive', 1, '0.0000', '0407', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 9, NULL, 0, 0, '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(408, 'Samsung A71 MG Protector', 3, 'single', 5, NULL, NULL, 23, NULL, NULL, 'inclusive', 1, '0.0000', '0408', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 9, NULL, 0, 0, '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(409, 'Samsung A73 MG Protector', 3, 'single', 5, NULL, NULL, 23, NULL, NULL, 'inclusive', 1, '0.0000', '0409', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 9, NULL, 0, 0, '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(410, 'Samsung A10S MG Protector', 3, 'single', 5, NULL, NULL, 23, NULL, NULL, 'inclusive', 1, '0.0000', '0410', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 9, NULL, 0, 0, '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(411, 'Samsung A21S MG Protector', 3, 'single', 5, NULL, NULL, 23, NULL, NULL, 'inclusive', 1, '0.0000', '0411', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 9, NULL, 0, 0, '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(412, 'Samsung A13 MG Protector', 3, 'single', 5, NULL, NULL, 23, NULL, NULL, 'inclusive', 1, '0.0000', '0412', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 9, NULL, 0, 0, '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(413, 'Tecno Pop 6 MG Protector', 3, 'single', 5, NULL, NULL, 23, NULL, NULL, 'inclusive', 1, '0.0000', '0413', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 9, NULL, 0, 0, '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(414, 'Tecno Hot 10 Play MG Protector', 3, 'single', 5, NULL, NULL, 23, NULL, NULL, 'inclusive', 1, '0.0000', '0414', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 9, NULL, 0, 0, '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(415, 'Tecno Spark 5 Air 3D protector', 3, 'single', 5, NULL, NULL, 23, NULL, NULL, 'inclusive', 1, '0.0000', '0415', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 9, NULL, 0, 0, '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(416, 'Infinix Note 12 3D protector', 3, 'single', 5, NULL, NULL, 23, NULL, NULL, 'inclusive', 1, '0.0000', '0416', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 9, NULL, 0, 0, '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(417, 'Tecno Pova Neo 12 3D protector', 3, 'single', 5, NULL, NULL, 23, NULL, NULL, 'inclusive', 1, '0.0000', '0417', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 9, NULL, 0, 0, '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(418, 'Infinix Note 8i 3D protector', 3, 'single', 5, NULL, NULL, 23, NULL, NULL, 'inclusive', 1, '0.0000', '0418', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 9, NULL, 0, 0, '2023-06-03 11:20:16', '2023-06-03 11:20:16');
INSERT INTO `products` (`id`, `name`, `business_id`, `type`, `unit_id`, `sub_unit_ids`, `brand_id`, `category_id`, `sub_category_id`, `tax`, `tax_type`, `enable_stock`, `alert_quantity`, `sku`, `barcode_type`, `expiry_period`, `expiry_period_type`, `enable_sr_no`, `weight`, `product_custom_field1`, `product_custom_field2`, `product_custom_field3`, `product_custom_field4`, `image`, `product_description`, `created_by`, `warranty_id`, `is_inactive`, `not_for_selling`, `created_at`, `updated_at`) VALUES
(419, 'Oppo A54 3D protector', 3, 'single', 5, NULL, NULL, 23, NULL, NULL, 'inclusive', 1, '0.0000', '0419', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 9, NULL, 0, 0, '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(420, 'Infinix Hot 8 3D protector', 3, 'single', 5, NULL, NULL, 23, NULL, NULL, 'inclusive', 1, '0.0000', '0420', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 9, NULL, 0, 0, '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(421, 'Tecno Spark 8 C 3D protector', 3, 'single', 5, NULL, NULL, 23, NULL, NULL, 'inclusive', 1, '0.0000', '0421', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 9, NULL, 0, 0, '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(422, 'Infinix Note 11 Pro 3D protector', 3, 'single', 5, NULL, NULL, 23, NULL, NULL, 'inclusive', 1, '0.0000', '0422', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 9, NULL, 0, 0, '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(423, 'Infinix Note 12 3D protector', 3, 'single', 5, NULL, NULL, 23, NULL, NULL, 'inclusive', 1, '0.0000', '0423', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 9, NULL, 0, 0, '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(424, 'Oppo Reno 5 3D protector', 3, 'single', 5, NULL, NULL, 23, NULL, NULL, 'inclusive', 1, '0.0000', '0424', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 9, NULL, 0, 0, '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(425, 'Tecno Camon 12 3D protector', 3, 'single', 5, NULL, NULL, 23, NULL, NULL, 'inclusive', 1, '0.0000', '0425', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 9, NULL, 0, 0, '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(426, 'Tecno Camon 15 3D protector', 3, 'single', 5, NULL, NULL, 23, NULL, NULL, 'inclusive', 1, '0.0000', '0426', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 9, NULL, 0, 0, '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(427, 'Tecno Camon 17 3D protector', 3, 'single', 5, NULL, NULL, 23, NULL, NULL, 'inclusive', 1, '0.0000', '0427', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 9, NULL, 0, 0, '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(428, 'Oppo Reno 4 3D protector', 3, 'single', 5, NULL, NULL, 23, NULL, NULL, 'inclusive', 1, '0.0000', '0428', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 9, NULL, 0, 0, '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(429, 'Oppo Reno 8 3D protector', 3, 'single', 5, NULL, NULL, 23, NULL, NULL, 'inclusive', 1, '0.0000', '0429', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 9, NULL, 0, 0, '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(430, 'Oppo 7 3D protector', 3, 'single', 5, NULL, NULL, 23, NULL, NULL, 'inclusive', 1, '0.0000', '0430', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 9, NULL, 0, 0, '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(431, 'Oppo A 55 3D protector', 3, 'single', 5, NULL, NULL, 23, NULL, NULL, 'inclusive', 1, '0.0000', '0431', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 9, NULL, 0, 0, '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(432, 'Oppo A53 3D protector', 3, 'single', 5, NULL, NULL, 23, NULL, NULL, 'inclusive', 1, '0.0000', '0432', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 9, NULL, 0, 0, '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(433, 'Oppo Reno 5F 3D protector', 3, 'single', 5, NULL, NULL, 23, NULL, NULL, 'inclusive', 1, '0.0000', '0433', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 9, NULL, 0, 0, '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(434, 'Oppo A 54 3D protector', 3, 'single', 5, NULL, NULL, 23, NULL, NULL, 'inclusive', 1, '0.0000', '0434', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 9, NULL, 0, 0, '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(435, 'iPhone 14 Pro Max AB Protector', 3, 'single', 5, NULL, NULL, 23, NULL, NULL, 'inclusive', 1, '0.0000', '0435', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 9, NULL, 0, 0, '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(436, 'iPhone 13 Pro Max AB Protector', 3, 'single', 5, NULL, NULL, 23, NULL, NULL, 'inclusive', 1, '0.0000', '0436', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 9, NULL, 0, 0, '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(437, 'Oraimo Earphones', 3, 'single', 5, NULL, NULL, 11, NULL, NULL, 'exclusive', 1, NULL, '0437', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, NULL, 0, 0, '2023-06-08 09:39:39', '2023-06-08 09:57:59'),
(438, 'PZX Cables', 3, 'single', 6, NULL, NULL, NULL, NULL, NULL, 'exclusive', 1, NULL, '0438', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, NULL, 0, 0, '2023-06-08 18:36:25', '2023-06-08 18:36:25'),
(439, 'SODA 200ml', 4, 'single', 7, NULL, NULL, NULL, NULL, NULL, 'inclusive', 1, '0.0000', '0439', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 10, NULL, 0, 0, '2023-06-13 12:10:29', '2023-06-13 12:10:29'),
(440, 'SODA 300ml', 4, 'single', 7, NULL, NULL, NULL, NULL, NULL, 'inclusive', 1, '0.0000', '0440', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 10, NULL, 0, 0, '2023-06-13 12:10:29', '2023-06-13 12:10:29'),
(441, 'SODA 500ml', 4, 'single', 7, NULL, NULL, NULL, NULL, NULL, 'inclusive', 1, '0.0000', '0441', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 10, NULL, 0, 0, '2023-06-13 12:10:29', '2023-06-13 12:10:29'),
(442, '300ml Schweeps', 4, 'single', 7, NULL, NULL, NULL, NULL, NULL, 'inclusive', 1, '0.0000', '0442', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 10, NULL, 0, 0, '2023-06-13 12:10:29', '2023-06-13 12:10:29'),
(443, 'RGB Novida', 4, 'single', 7, NULL, NULL, NULL, NULL, NULL, 'inclusive', 1, '0.0000', '0443', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 10, NULL, 0, 0, '2023-06-13 12:10:29', '2023-06-13 12:10:29'),
(444, 'Pet 350ml/ Mm Refresh', 4, 'single', 7, NULL, NULL, NULL, NULL, NULL, 'inclusive', 1, '0.0000', '0444', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 10, NULL, 0, 0, '2023-06-13 12:10:29', '2023-06-13 12:10:29'),
(445, 'Pet 350ml Novida', 4, 'single', 7, NULL, NULL, NULL, NULL, NULL, 'inclusive', 1, '0.0000', '0445', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 10, NULL, 0, 0, '2023-06-13 12:10:29', '2023-06-13 12:10:29'),
(446, 'Pet 350ml Original', 4, 'single', 7, NULL, NULL, NULL, NULL, NULL, 'inclusive', 1, '0.0000', '0446', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 10, NULL, 0, 0, '2023-06-13 12:10:29', '2023-06-13 12:10:29'),
(447, 'Pet 500ml', 4, 'single', 7, NULL, NULL, NULL, NULL, NULL, 'inclusive', 1, '0.0000', '0447', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 10, NULL, 0, 0, '2023-06-13 12:10:29', '2023-06-13 12:10:29'),
(448, 'Pet 500ml (soda water)', 4, 'single', 7, NULL, NULL, NULL, NULL, NULL, 'inclusive', 1, '0.0000', '0448', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 10, NULL, 0, 0, '2023-06-13 12:10:29', '2023-06-13 12:10:29'),
(449, 'Pet 1000ml 1ltr', 4, 'single', 7, NULL, NULL, NULL, NULL, NULL, 'inclusive', 1, '0.0000', '0449', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 10, NULL, 0, 0, '2023-06-13 12:10:29', '2023-06-13 12:10:29'),
(450, 'Pet 1.2ltrs', 4, 'single', 7, NULL, NULL, NULL, NULL, NULL, 'inclusive', 1, '0.0000', '0450', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 10, NULL, 0, 0, '2023-06-13 12:10:29', '2023-06-13 12:10:29'),
(451, 'Pet 2ltrs', 4, 'single', 7, NULL, NULL, NULL, NULL, NULL, 'inclusive', 1, '0.0000', '0451', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 10, NULL, 0, 0, '2023-06-13 12:10:29', '2023-06-13 12:10:29'),
(452, 'Power play', 4, 'single', 7, NULL, NULL, NULL, NULL, NULL, 'inclusive', 1, '0.0000', '0452', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 10, NULL, 0, 0, '2023-06-13 12:10:29', '2023-06-13 12:10:29'),
(453, 'Predator 400ml', 4, 'single', 7, NULL, NULL, NULL, NULL, NULL, 'inclusive', 1, '0.0000', '0453', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 10, NULL, 0, 0, '2023-06-13 12:10:29', '2023-06-13 12:10:29'),
(454, 'Predator 400ml Mayhem', 4, 'single', 7, NULL, NULL, NULL, NULL, NULL, 'inclusive', 1, '0.0000', '0454', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 10, NULL, 0, 0, '2023-06-13 12:10:29', '2023-06-13 12:10:29'),
(455, 'Dasani 500ml', 4, 'single', 7, NULL, NULL, NULL, NULL, NULL, 'inclusive', 1, '0.0000', '0455', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 10, NULL, 0, 0, '2023-06-13 12:10:29', '2023-06-13 12:10:29'),
(456, 'Dasani 1ltr', 4, 'single', 7, NULL, NULL, NULL, NULL, NULL, 'inclusive', 1, '0.0000', '0456', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 10, NULL, 0, 0, '2023-06-13 12:10:29', '2023-06-13 12:10:29'),
(457, 'Coke energy 330ml', 4, 'single', 7, NULL, NULL, NULL, NULL, NULL, 'inclusive', 1, '0.0000', '0457', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 10, NULL, 0, 0, '2023-06-13 12:10:29', '2023-06-13 12:10:29'),
(458, 'Keringet 500ml', 4, 'single', 7, NULL, NULL, NULL, NULL, NULL, 'inclusive', 1, '0.0000', '0458', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 10, NULL, 0, 0, '2023-06-13 12:10:29', '2023-06-13 12:10:29'),
(459, 'Keringet 1ltr', 4, 'single', 7, NULL, NULL, NULL, NULL, NULL, 'inclusive', 1, '0.0000', '0459', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 10, NULL, 0, 0, '2023-06-13 12:10:29', '2023-06-13 12:10:29'),
(460, 'Keringet 18.9ltrs', 4, 'single', 7, NULL, NULL, NULL, NULL, NULL, 'inclusive', 1, '0.0000', '0460', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 10, NULL, 0, 0, '2023-06-13 12:10:29', '2023-06-13 12:10:29'),
(461, 'M/maid Fruity Boost', 4, 'single', 7, NULL, NULL, NULL, NULL, NULL, 'inclusive', 1, '0.0000', '0461', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 10, NULL, 0, 0, '2023-06-13 12:10:29', '2023-06-13 12:10:29'),
(462, 'M/maid 400ml PULPY', 4, 'single', 7, NULL, NULL, NULL, NULL, NULL, 'inclusive', 1, '0.0000', '0462', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 10, NULL, 0, 0, '2023-06-13 12:10:29', '2023-06-13 12:10:29'),
(463, 'M/maid 400ml', 4, 'single', 7, NULL, NULL, NULL, NULL, NULL, 'inclusive', 1, '0.0000', '0463', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 10, NULL, 0, 0, '2023-06-13 12:10:29', '2023-06-13 12:10:29'),
(464, 'Power Ade (M-blast)', 4, 'single', 7, NULL, NULL, NULL, NULL, NULL, 'inclusive', 1, '0.0000', '0464', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 10, NULL, 0, 0, '2023-06-13 12:10:29', '2023-06-13 12:10:29'),
(465, 'M/maid 1lt Pulpy', 4, 'single', 7, NULL, NULL, NULL, NULL, NULL, 'inclusive', 1, '0.0000', '0465', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 10, NULL, 0, 0, '2023-06-13 12:10:29', '2023-06-13 12:10:29'),
(466, 'M/maid 1lt', 4, 'single', 7, NULL, NULL, NULL, NULL, NULL, 'inclusive', 1, '0.0000', '0466', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 10, NULL, 0, 0, '2023-06-13 12:10:29', '2023-06-13 12:10:29'),
(467, 'M/maid 1lt (NECTAR)', 4, 'single', 7, NULL, NULL, NULL, NULL, NULL, 'inclusive', 1, '0.0000', '0467', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 10, NULL, 0, 0, '2023-06-13 12:10:29', '2023-06-13 12:10:29'),
(468, 'Keringet 5 ltrs', 4, 'single', 7, NULL, NULL, NULL, NULL, NULL, 'inclusive', 1, '0.0000', '0468', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 10, NULL, 0, 0, '2023-06-13 12:10:29', '2023-06-13 12:10:29'),
(469, 'Keringet 10 ltrs', 4, 'single', 7, NULL, NULL, NULL, NULL, NULL, 'inclusive', 1, '0.0000', '0469', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 10, NULL, 0, 0, '2023-06-13 12:10:29', '2023-06-13 12:10:29'),
(470, 'Monster', 4, 'single', 7, NULL, NULL, NULL, NULL, NULL, 'inclusive', 1, '0.0000', '0470', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 10, NULL, 0, 0, '2023-06-13 12:10:29', '2023-06-13 12:10:29'),
(471, 'Lelisu Headphones 213', 3, 'single', 5, NULL, NULL, 10, NULL, NULL, 'exclusive', 1, NULL, '0471', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, NULL, 0, 0, '2023-06-17 12:52:13', '2023-06-17 12:52:13'),
(472, 'Redmi 9C Marble Cover', 3, 'single', 5, NULL, NULL, 6, NULL, NULL, 'exclusive', 1, NULL, '0472', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, NULL, 0, 0, '2023-06-17 13:00:45', '2023-06-17 13:00:45'),
(473, 'Redmi Note 11 Pro', 3, 'single', 5, NULL, NULL, 6, NULL, NULL, 'exclusive', 1, NULL, '0473', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, NULL, 0, 0, '2023-06-17 13:07:05', '2023-06-17 13:07:05'),
(474, 'iPhone 12 Pro Max', 3, 'single', 5, NULL, NULL, 23, NULL, NULL, 'exclusive', 1, NULL, '0474', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, NULL, 0, 0, '2023-06-17 13:21:35', '2023-06-17 13:21:35'),
(475, 'iPhone 11 Pro Max', 3, 'single', 5, NULL, NULL, 23, NULL, NULL, 'exclusive', 1, NULL, '0475', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, NULL, 0, 0, '2023-06-17 13:27:08', '2023-06-17 13:27:08');

-- --------------------------------------------------------

--
-- Table structure for table `product_locations`
--

CREATE TABLE `product_locations` (
  `product_id` int NOT NULL,
  `location_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_locations`
--

INSERT INTO `product_locations` (`product_id`, `location_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(17, 1),
(18, 1),
(19, 1),
(20, 1),
(21, 1),
(22, 1),
(23, 1),
(24, 2),
(25, 2),
(26, 2),
(27, 2),
(28, 2),
(29, 2),
(30, 2),
(31, 2),
(32, 2),
(33, 2),
(34, 2),
(35, 2),
(36, 2),
(37, 2),
(38, 2),
(39, 2),
(40, 2),
(41, 2),
(42, 2),
(43, 2),
(44, 2),
(45, 2),
(46, 2),
(47, 2),
(48, 2),
(49, 2),
(50, 2),
(51, 2),
(52, 2),
(53, 2),
(54, 2),
(55, 2),
(56, 2),
(57, 2),
(58, 2),
(59, 2),
(60, 2),
(61, 2),
(62, 2),
(63, 2),
(64, 2),
(65, 2),
(66, 2),
(67, 2),
(68, 2),
(69, 2),
(70, 2),
(71, 2),
(72, 2),
(73, 2),
(74, 2),
(75, 2),
(76, 2),
(77, 2),
(78, 2),
(79, 2),
(80, 2),
(81, 2),
(82, 2),
(83, 2),
(84, 2),
(85, 2),
(86, 2),
(87, 2),
(88, 2),
(89, 2),
(90, 2),
(91, 2),
(92, 2),
(93, 2),
(94, 2),
(95, 2),
(96, 2),
(97, 2),
(98, 2),
(99, 2),
(100, 2),
(101, 2),
(102, 2),
(103, 2),
(104, 2),
(105, 2),
(106, 2),
(107, 2),
(108, 2),
(109, 2),
(110, 2),
(111, 2),
(112, 2),
(113, 2),
(114, 2),
(115, 2),
(116, 2),
(117, 2),
(118, 2),
(119, 2),
(120, 2),
(121, 2),
(122, 2),
(123, 2),
(124, 2),
(125, 2),
(126, 2),
(127, 2),
(128, 2),
(129, 2),
(130, 2),
(131, 2),
(132, 2),
(133, 2),
(134, 2),
(135, 2),
(136, 2),
(137, 2),
(138, 2),
(139, 2),
(140, 2),
(141, 2),
(142, 2),
(143, 2),
(144, 2),
(145, 2),
(146, 2),
(147, 2),
(148, 2),
(149, 2),
(150, 2),
(151, 2),
(152, 2),
(153, 2),
(154, 2),
(155, 2),
(156, 2),
(157, 2),
(158, 2),
(159, 2),
(160, 2),
(161, 2),
(162, 2),
(163, 2),
(164, 2),
(165, 2),
(166, 2),
(167, 2),
(168, 2),
(169, 2),
(170, 2),
(171, 2),
(172, 2),
(173, 2),
(174, 2),
(175, 2),
(176, 2),
(177, 2),
(178, 2),
(179, 2),
(180, 2),
(181, 2),
(182, 2),
(183, 2),
(184, 2),
(185, 2),
(186, 2),
(187, 2),
(188, 2),
(189, 2),
(190, 2),
(191, 2),
(192, 2),
(193, 2),
(194, 2),
(195, 2),
(196, 2),
(197, 2),
(198, 2),
(199, 2),
(200, 2),
(201, 2),
(202, 2),
(203, 2),
(204, 2),
(205, 2),
(206, 2),
(207, 2),
(208, 2),
(209, 2),
(210, 2),
(211, 2),
(212, 2),
(213, 2),
(214, 2),
(215, 2),
(216, 2),
(217, 2),
(218, 2),
(219, 2),
(220, 2),
(221, 2),
(222, 2),
(223, 2),
(224, 2),
(225, 2),
(226, 2),
(227, 2),
(228, 2),
(229, 2),
(230, 2),
(231, 2),
(232, 2),
(233, 2),
(234, 2),
(235, 2),
(236, 2),
(237, 2),
(238, 2),
(239, 2),
(240, 2),
(241, 2),
(242, 2),
(243, 2),
(244, 2),
(245, 2),
(246, 2),
(247, 2),
(248, 2),
(249, 2),
(250, 2),
(251, 2),
(252, 2),
(253, 2),
(254, 2),
(255, 2),
(256, 2),
(257, 2),
(258, 2),
(259, 2),
(260, 2),
(261, 2),
(262, 2),
(263, 2),
(264, 2),
(265, 2),
(266, 2),
(267, 2),
(268, 2),
(269, 2),
(270, 2),
(271, 2),
(272, 2),
(273, 2),
(274, 2),
(275, 2),
(276, 2),
(277, 2),
(278, 2),
(279, 2),
(280, 2),
(281, 2),
(282, 2),
(283, 2),
(284, 2),
(285, 2),
(286, 2),
(287, 2),
(288, 2),
(289, 2),
(290, 2),
(291, 2),
(292, 2),
(293, 2),
(294, 2),
(295, 2),
(296, 2),
(297, 2),
(298, 2),
(299, 2),
(300, 2),
(301, 2),
(302, 2),
(303, 2),
(304, 2),
(305, 2),
(306, 2),
(307, 2),
(308, 2),
(309, 2),
(310, 2),
(311, 2),
(312, 2),
(313, 2),
(314, 2),
(315, 2),
(316, 2),
(317, 2),
(318, 2),
(319, 2),
(320, 2),
(321, 2),
(322, 2),
(323, 2),
(324, 2),
(325, 2),
(326, 2),
(327, 2),
(328, 2),
(329, 2),
(330, 2),
(331, 2),
(332, 2),
(333, 2),
(334, 2),
(335, 2),
(336, 2),
(337, 2),
(338, 2),
(339, 2),
(340, 2),
(341, 2),
(342, 2),
(343, 2),
(344, 2),
(345, 2),
(346, 2),
(347, 2),
(348, 2),
(349, 2),
(350, 2),
(351, 2),
(352, 2),
(353, 2),
(354, 2),
(355, 2),
(356, 2),
(357, 2),
(358, 2),
(359, 2),
(360, 2),
(361, 2),
(362, 2),
(363, 2),
(364, 2),
(365, 2),
(366, 2),
(367, 2),
(368, 2),
(369, 2),
(370, 2),
(371, 2),
(372, 2),
(373, 2),
(374, 2),
(375, 2),
(376, 2),
(377, 2),
(378, 2),
(379, 2),
(380, 2),
(381, 2),
(382, 2),
(383, 2),
(384, 2),
(385, 2),
(386, 2),
(387, 2),
(388, 2),
(389, 2),
(390, 2),
(391, 2),
(392, 2),
(393, 2),
(394, 2),
(395, 2),
(396, 2),
(397, 2),
(398, 2),
(399, 2),
(400, 2),
(401, 2),
(402, 2),
(403, 2),
(404, 2),
(405, 2),
(406, 2),
(407, 2),
(408, 2),
(409, 2),
(410, 2),
(411, 2),
(412, 2),
(413, 2),
(414, 2),
(415, 2),
(416, 2),
(417, 2),
(418, 2),
(419, 2),
(420, 2),
(421, 2),
(422, 2),
(423, 2),
(424, 2),
(425, 2),
(426, 2),
(427, 2),
(428, 2),
(429, 2),
(430, 2),
(431, 2),
(432, 2),
(433, 2),
(434, 2),
(435, 2),
(436, 2),
(437, 2),
(438, 2),
(439, 3),
(440, 3),
(441, 3),
(442, 3),
(443, 3),
(444, 3),
(445, 3),
(446, 3),
(447, 3),
(448, 3),
(449, 3),
(450, 3),
(451, 3),
(452, 3),
(453, 3),
(454, 3),
(455, 3),
(456, 3),
(457, 3),
(458, 3),
(459, 3),
(460, 3),
(461, 3),
(462, 3),
(463, 3),
(464, 3),
(465, 3),
(466, 3),
(467, 3),
(468, 3),
(469, 3),
(470, 3),
(471, 2),
(472, 2),
(473, 2),
(474, 2),
(475, 2);

-- --------------------------------------------------------

--
-- Table structure for table `product_racks`
--

CREATE TABLE `product_racks` (
  `id` int UNSIGNED NOT NULL,
  `business_id` int UNSIGNED NOT NULL,
  `location_id` int UNSIGNED NOT NULL,
  `product_id` int UNSIGNED NOT NULL,
  `rack` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `row` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_variations`
--

CREATE TABLE `product_variations` (
  `id` int UNSIGNED NOT NULL,
  `variation_template_id` int DEFAULT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` int UNSIGNED NOT NULL,
  `is_dummy` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_variations`
--

INSERT INTO `product_variations` (`id`, `variation_template_id`, `name`, `product_id`, `is_dummy`, `created_at`, `updated_at`) VALUES
(193, NULL, 'DUMMY', 193, 1, '2023-05-31 11:19:55', '2023-05-31 11:19:55'),
(194, NULL, 'DUMMY', 194, 1, '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(195, NULL, 'DUMMY', 195, 1, '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(196, NULL, 'DUMMY', 196, 1, '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(197, NULL, 'DUMMY', 197, 1, '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(198, NULL, 'DUMMY', 198, 1, '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(199, NULL, 'DUMMY', 199, 1, '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(200, NULL, 'DUMMY', 200, 1, '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(201, NULL, 'DUMMY', 201, 1, '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(202, NULL, 'DUMMY', 202, 1, '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(203, NULL, 'DUMMY', 203, 1, '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(204, NULL, 'DUMMY', 204, 1, '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(205, NULL, 'DUMMY', 205, 1, '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(206, NULL, 'DUMMY', 206, 1, '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(207, NULL, 'DUMMY', 207, 1, '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(208, NULL, 'DUMMY', 208, 1, '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(209, NULL, 'DUMMY', 209, 1, '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(210, NULL, 'DUMMY', 210, 1, '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(211, NULL, 'DUMMY', 211, 1, '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(212, NULL, 'DUMMY', 212, 1, '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(213, NULL, 'DUMMY', 213, 1, '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(214, NULL, 'DUMMY', 214, 1, '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(215, NULL, 'DUMMY', 215, 1, '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(216, NULL, 'DUMMY', 216, 1, '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(217, NULL, 'DUMMY', 217, 1, '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(218, NULL, 'DUMMY', 218, 1, '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(219, NULL, 'DUMMY', 219, 1, '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(220, NULL, 'DUMMY', 220, 1, '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(221, NULL, 'DUMMY', 221, 1, '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(222, NULL, 'DUMMY', 222, 1, '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(223, NULL, 'DUMMY', 223, 1, '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(224, NULL, 'DUMMY', 224, 1, '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(225, NULL, 'DUMMY', 225, 1, '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(226, NULL, 'DUMMY', 226, 1, '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(227, NULL, 'DUMMY', 227, 1, '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(228, NULL, 'DUMMY', 228, 1, '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(229, NULL, 'DUMMY', 229, 1, '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(230, NULL, 'DUMMY', 230, 1, '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(231, NULL, 'DUMMY', 231, 1, '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(232, NULL, 'DUMMY', 232, 1, '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(233, NULL, 'DUMMY', 233, 1, '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(234, NULL, 'DUMMY', 234, 1, '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(235, NULL, 'DUMMY', 235, 1, '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(236, NULL, 'DUMMY', 236, 1, '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(237, NULL, 'DUMMY', 237, 1, '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(238, NULL, 'DUMMY', 238, 1, '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(239, NULL, 'DUMMY', 239, 1, '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(240, NULL, 'DUMMY', 240, 1, '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(241, NULL, 'DUMMY', 241, 1, '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(242, NULL, 'DUMMY', 242, 1, '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(243, NULL, 'DUMMY', 243, 1, '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(244, NULL, 'DUMMY', 244, 1, '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(245, NULL, 'DUMMY', 245, 1, '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(246, NULL, 'DUMMY', 246, 1, '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(247, NULL, 'DUMMY', 247, 1, '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(248, NULL, 'DUMMY', 248, 1, '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(249, NULL, 'DUMMY', 249, 1, '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(250, NULL, 'DUMMY', 250, 1, '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(251, NULL, 'DUMMY', 251, 1, '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(252, NULL, 'DUMMY', 252, 1, '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(253, NULL, 'DUMMY', 253, 1, '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(254, NULL, 'DUMMY', 254, 1, '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(255, NULL, 'DUMMY', 255, 1, '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(256, NULL, 'DUMMY', 256, 1, '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(257, NULL, 'DUMMY', 257, 1, '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(258, NULL, 'DUMMY', 258, 1, '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(259, NULL, 'DUMMY', 259, 1, '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(260, NULL, 'DUMMY', 260, 1, '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(261, NULL, 'DUMMY', 261, 1, '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(262, NULL, 'DUMMY', 262, 1, '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(263, NULL, 'DUMMY', 263, 1, '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(264, NULL, 'DUMMY', 264, 1, '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(265, NULL, 'DUMMY', 265, 1, '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(266, NULL, 'DUMMY', 266, 1, '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(267, NULL, 'DUMMY', 267, 1, '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(268, NULL, 'DUMMY', 268, 1, '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(269, NULL, 'DUMMY', 269, 1, '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(270, NULL, 'DUMMY', 270, 1, '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(271, NULL, 'DUMMY', 271, 1, '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(272, NULL, 'DUMMY', 272, 1, '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(273, NULL, 'DUMMY', 273, 1, '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(274, NULL, 'DUMMY', 274, 1, '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(275, NULL, 'DUMMY', 275, 1, '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(276, NULL, 'DUMMY', 276, 1, '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(277, NULL, 'DUMMY', 277, 1, '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(278, NULL, 'DUMMY', 278, 1, '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(279, NULL, 'DUMMY', 279, 1, '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(280, NULL, 'DUMMY', 280, 1, '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(281, NULL, 'DUMMY', 281, 1, '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(282, NULL, 'DUMMY', 282, 1, '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(283, NULL, 'DUMMY', 283, 1, '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(284, NULL, 'DUMMY', 284, 1, '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(285, NULL, 'DUMMY', 285, 1, '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(286, NULL, 'DUMMY', 286, 1, '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(287, NULL, 'DUMMY', 287, 1, '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(288, NULL, 'DUMMY', 288, 1, '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(289, NULL, 'DUMMY', 289, 1, '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(290, NULL, 'DUMMY', 290, 1, '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(291, NULL, 'DUMMY', 291, 1, '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(292, NULL, 'DUMMY', 292, 1, '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(293, NULL, 'DUMMY', 293, 1, '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(294, NULL, 'DUMMY', 294, 1, '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(295, NULL, 'DUMMY', 295, 1, '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(296, NULL, 'DUMMY', 296, 1, '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(297, NULL, 'DUMMY', 297, 1, '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(298, NULL, 'DUMMY', 298, 1, '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(299, NULL, 'DUMMY', 299, 1, '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(300, NULL, 'DUMMY', 300, 1, '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(301, NULL, 'DUMMY', 301, 1, '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(302, NULL, 'DUMMY', 302, 1, '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(303, NULL, 'DUMMY', 303, 1, '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(304, NULL, 'DUMMY', 304, 1, '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(305, NULL, 'DUMMY', 305, 1, '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(306, NULL, 'DUMMY', 306, 1, '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(307, NULL, 'DUMMY', 307, 1, '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(308, NULL, 'DUMMY', 308, 1, '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(309, NULL, 'DUMMY', 309, 1, '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(310, NULL, 'DUMMY', 310, 1, '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(311, NULL, 'DUMMY', 311, 1, '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(312, NULL, 'DUMMY', 312, 1, '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(313, NULL, 'DUMMY', 313, 1, '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(314, NULL, 'DUMMY', 314, 1, '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(315, NULL, 'DUMMY', 315, 1, '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(316, NULL, 'DUMMY', 316, 1, '2023-05-31 11:28:43', '2023-05-31 11:28:43'),
(317, NULL, 'DUMMY', 317, 1, '2023-05-31 11:28:43', '2023-05-31 11:28:43'),
(318, NULL, 'DUMMY', 318, 1, '2023-05-31 11:28:43', '2023-05-31 11:28:43'),
(319, NULL, 'DUMMY', 319, 1, '2023-05-31 11:28:43', '2023-05-31 11:28:43'),
(320, NULL, 'DUMMY', 320, 1, '2023-05-31 11:28:43', '2023-05-31 11:28:43'),
(321, NULL, 'DUMMY', 321, 1, '2023-05-31 11:28:43', '2023-05-31 11:28:43'),
(322, NULL, 'DUMMY', 322, 1, '2023-05-31 11:28:43', '2023-05-31 11:28:43'),
(323, NULL, 'DUMMY', 323, 1, '2023-05-31 11:28:43', '2023-05-31 11:28:43'),
(324, NULL, 'DUMMY', 324, 1, '2023-05-31 11:28:43', '2023-05-31 11:28:43'),
(325, NULL, 'DUMMY', 325, 1, '2023-05-31 11:28:43', '2023-05-31 11:28:43'),
(326, NULL, 'DUMMY', 326, 1, '2023-05-31 11:28:43', '2023-05-31 11:28:43'),
(327, NULL, 'DUMMY', 327, 1, '2023-05-31 11:28:43', '2023-05-31 11:28:43'),
(328, NULL, 'DUMMY', 328, 1, '2023-05-31 11:28:43', '2023-05-31 11:28:43'),
(329, NULL, 'DUMMY', 329, 1, '2023-05-31 11:28:43', '2023-05-31 11:28:43'),
(330, NULL, 'DUMMY', 330, 1, '2023-05-31 11:28:43', '2023-05-31 11:28:43'),
(331, NULL, 'DUMMY', 331, 1, '2023-05-31 11:28:43', '2023-05-31 11:28:43'),
(332, NULL, 'DUMMY', 332, 1, '2023-05-31 11:28:43', '2023-05-31 11:28:43'),
(333, NULL, 'DUMMY', 333, 1, '2023-05-31 11:28:43', '2023-05-31 11:28:43'),
(334, NULL, 'DUMMY', 334, 1, '2023-05-31 11:28:43', '2023-05-31 11:28:43'),
(335, NULL, 'DUMMY', 335, 1, '2023-05-31 11:28:43', '2023-05-31 11:28:43'),
(336, NULL, 'DUMMY', 336, 1, '2023-05-31 11:28:43', '2023-05-31 11:28:43'),
(337, NULL, 'DUMMY', 337, 1, '2023-05-31 11:28:43', '2023-05-31 11:28:43'),
(338, NULL, 'DUMMY', 338, 1, '2023-05-31 11:28:43', '2023-05-31 11:28:43'),
(339, NULL, 'DUMMY', 339, 1, '2023-05-31 11:28:43', '2023-05-31 11:28:43'),
(340, NULL, 'DUMMY', 340, 1, '2023-05-31 11:28:43', '2023-05-31 11:28:43'),
(341, NULL, 'DUMMY', 341, 1, '2023-05-31 11:28:43', '2023-05-31 11:28:43'),
(342, NULL, 'DUMMY', 342, 1, '2023-05-31 11:28:43', '2023-05-31 11:28:43'),
(343, NULL, 'DUMMY', 343, 1, '2023-05-31 11:28:43', '2023-05-31 11:28:43'),
(344, NULL, 'DUMMY', 344, 1, '2023-05-31 11:28:43', '2023-05-31 11:28:43'),
(345, NULL, 'DUMMY', 345, 1, '2023-05-31 11:28:43', '2023-05-31 11:28:43'),
(346, NULL, 'DUMMY', 346, 1, '2023-05-31 11:28:43', '2023-05-31 11:28:43'),
(347, NULL, 'DUMMY', 347, 1, '2023-05-31 11:28:43', '2023-05-31 11:28:43'),
(348, NULL, 'DUMMY', 348, 1, '2023-05-31 11:28:43', '2023-05-31 11:28:43'),
(349, NULL, 'DUMMY', 349, 1, '2023-05-31 11:28:43', '2023-05-31 11:28:43'),
(350, NULL, 'DUMMY', 350, 1, '2023-05-31 11:28:43', '2023-05-31 11:28:43'),
(351, NULL, 'DUMMY', 351, 1, '2023-05-31 11:28:43', '2023-05-31 11:28:43'),
(352, NULL, 'DUMMY', 352, 1, '2023-05-31 11:28:43', '2023-05-31 11:28:43'),
(353, NULL, 'DUMMY', 353, 1, '2023-05-31 11:28:43', '2023-05-31 11:28:43'),
(354, NULL, 'DUMMY', 354, 1, '2023-05-31 11:28:43', '2023-05-31 11:28:43'),
(355, NULL, 'DUMMY', 355, 1, '2023-05-31 11:28:43', '2023-05-31 11:28:43'),
(356, NULL, 'DUMMY', 356, 1, '2023-05-31 11:28:43', '2023-05-31 11:28:43'),
(357, NULL, 'DUMMY', 357, 1, '2023-05-31 11:28:43', '2023-05-31 11:28:43'),
(358, NULL, 'DUMMY', 358, 1, '2023-05-31 11:28:43', '2023-05-31 11:28:43'),
(359, NULL, 'DUMMY', 359, 1, '2023-05-31 14:17:14', '2023-05-31 14:17:14'),
(360, NULL, 'DUMMY', 360, 1, '2023-05-31 14:42:20', '2023-05-31 14:42:20'),
(361, NULL, 'DUMMY', 361, 1, '2023-06-03 11:20:15', '2023-06-03 11:20:15'),
(362, NULL, 'DUMMY', 362, 1, '2023-06-03 11:20:15', '2023-06-03 11:20:15'),
(363, NULL, 'DUMMY', 363, 1, '2023-06-03 11:20:15', '2023-06-03 11:20:15'),
(364, NULL, 'DUMMY', 364, 1, '2023-06-03 11:20:15', '2023-06-03 11:20:15'),
(365, NULL, 'DUMMY', 365, 1, '2023-06-03 11:20:15', '2023-06-03 11:20:15'),
(366, NULL, 'DUMMY', 366, 1, '2023-06-03 11:20:15', '2023-06-03 11:20:15'),
(367, NULL, 'DUMMY', 367, 1, '2023-06-03 11:20:15', '2023-06-03 11:20:15'),
(368, NULL, 'DUMMY', 368, 1, '2023-06-03 11:20:15', '2023-06-03 11:20:15'),
(369, NULL, 'DUMMY', 369, 1, '2023-06-03 11:20:15', '2023-06-03 11:20:15'),
(370, NULL, 'DUMMY', 370, 1, '2023-06-03 11:20:15', '2023-06-03 11:20:15'),
(371, NULL, 'DUMMY', 371, 1, '2023-06-03 11:20:15', '2023-06-03 11:20:15'),
(372, NULL, 'DUMMY', 372, 1, '2023-06-03 11:20:15', '2023-06-03 11:20:15'),
(373, NULL, 'DUMMY', 373, 1, '2023-06-03 11:20:15', '2023-06-03 11:20:15'),
(374, NULL, 'DUMMY', 374, 1, '2023-06-03 11:20:15', '2023-06-03 11:20:15'),
(375, NULL, 'DUMMY', 375, 1, '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(376, NULL, 'DUMMY', 376, 1, '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(377, NULL, 'DUMMY', 377, 1, '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(378, NULL, 'DUMMY', 378, 1, '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(379, NULL, 'DUMMY', 379, 1, '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(380, NULL, 'DUMMY', 380, 1, '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(381, NULL, 'DUMMY', 381, 1, '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(382, NULL, 'DUMMY', 382, 1, '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(383, NULL, 'DUMMY', 383, 1, '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(384, NULL, 'DUMMY', 384, 1, '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(385, NULL, 'DUMMY', 385, 1, '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(386, NULL, 'DUMMY', 386, 1, '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(387, NULL, 'DUMMY', 387, 1, '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(388, NULL, 'DUMMY', 388, 1, '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(389, NULL, 'DUMMY', 389, 1, '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(390, NULL, 'DUMMY', 390, 1, '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(391, NULL, 'DUMMY', 391, 1, '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(392, NULL, 'DUMMY', 392, 1, '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(393, NULL, 'DUMMY', 393, 1, '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(394, NULL, 'DUMMY', 394, 1, '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(395, NULL, 'DUMMY', 395, 1, '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(396, NULL, 'DUMMY', 396, 1, '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(397, NULL, 'DUMMY', 397, 1, '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(398, NULL, 'DUMMY', 398, 1, '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(399, NULL, 'DUMMY', 399, 1, '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(400, NULL, 'DUMMY', 400, 1, '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(401, NULL, 'DUMMY', 401, 1, '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(402, NULL, 'DUMMY', 402, 1, '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(403, NULL, 'DUMMY', 403, 1, '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(404, NULL, 'DUMMY', 404, 1, '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(405, NULL, 'DUMMY', 405, 1, '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(406, NULL, 'DUMMY', 406, 1, '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(407, NULL, 'DUMMY', 407, 1, '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(408, NULL, 'DUMMY', 408, 1, '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(409, NULL, 'DUMMY', 409, 1, '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(410, NULL, 'DUMMY', 410, 1, '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(411, NULL, 'DUMMY', 411, 1, '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(412, NULL, 'DUMMY', 412, 1, '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(413, NULL, 'DUMMY', 413, 1, '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(414, NULL, 'DUMMY', 414, 1, '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(415, NULL, 'DUMMY', 415, 1, '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(416, NULL, 'DUMMY', 416, 1, '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(417, NULL, 'DUMMY', 417, 1, '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(418, NULL, 'DUMMY', 418, 1, '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(419, NULL, 'DUMMY', 419, 1, '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(420, NULL, 'DUMMY', 420, 1, '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(421, NULL, 'DUMMY', 421, 1, '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(422, NULL, 'DUMMY', 422, 1, '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(423, NULL, 'DUMMY', 423, 1, '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(424, NULL, 'DUMMY', 424, 1, '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(425, NULL, 'DUMMY', 425, 1, '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(426, NULL, 'DUMMY', 426, 1, '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(427, NULL, 'DUMMY', 427, 1, '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(428, NULL, 'DUMMY', 428, 1, '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(429, NULL, 'DUMMY', 429, 1, '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(430, NULL, 'DUMMY', 430, 1, '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(431, NULL, 'DUMMY', 431, 1, '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(432, NULL, 'DUMMY', 432, 1, '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(433, NULL, 'DUMMY', 433, 1, '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(434, NULL, 'DUMMY', 434, 1, '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(435, NULL, 'DUMMY', 435, 1, '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(436, NULL, 'DUMMY', 436, 1, '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(437, NULL, 'DUMMY', 437, 1, '2023-06-08 09:39:39', '2023-06-08 09:39:39'),
(438, NULL, 'DUMMY', 438, 1, '2023-06-08 18:36:25', '2023-06-08 18:36:25'),
(439, NULL, 'DUMMY', 439, 1, '2023-06-13 12:10:29', '2023-06-13 12:10:29'),
(440, NULL, 'DUMMY', 440, 1, '2023-06-13 12:10:29', '2023-06-13 12:10:29'),
(441, NULL, 'DUMMY', 441, 1, '2023-06-13 12:10:29', '2023-06-13 12:10:29'),
(442, NULL, 'DUMMY', 442, 1, '2023-06-13 12:10:29', '2023-06-13 12:10:29'),
(443, NULL, 'DUMMY', 443, 1, '2023-06-13 12:10:29', '2023-06-13 12:10:29'),
(444, NULL, 'DUMMY', 444, 1, '2023-06-13 12:10:29', '2023-06-13 12:10:29'),
(445, NULL, 'DUMMY', 445, 1, '2023-06-13 12:10:29', '2023-06-13 12:10:29'),
(446, NULL, 'DUMMY', 446, 1, '2023-06-13 12:10:29', '2023-06-13 12:10:29'),
(447, NULL, 'DUMMY', 447, 1, '2023-06-13 12:10:29', '2023-06-13 12:10:29'),
(448, NULL, 'DUMMY', 448, 1, '2023-06-13 12:10:29', '2023-06-13 12:10:29'),
(449, NULL, 'DUMMY', 449, 1, '2023-06-13 12:10:29', '2023-06-13 12:10:29'),
(450, NULL, 'DUMMY', 450, 1, '2023-06-13 12:10:29', '2023-06-13 12:10:29'),
(451, NULL, 'DUMMY', 451, 1, '2023-06-13 12:10:29', '2023-06-13 12:10:29'),
(452, NULL, 'DUMMY', 452, 1, '2023-06-13 12:10:29', '2023-06-13 12:10:29'),
(453, NULL, 'DUMMY', 453, 1, '2023-06-13 12:10:29', '2023-06-13 12:10:29'),
(454, NULL, 'DUMMY', 454, 1, '2023-06-13 12:10:29', '2023-06-13 12:10:29'),
(455, NULL, 'DUMMY', 455, 1, '2023-06-13 12:10:29', '2023-06-13 12:10:29'),
(456, NULL, 'DUMMY', 456, 1, '2023-06-13 12:10:29', '2023-06-13 12:10:29'),
(457, NULL, 'DUMMY', 457, 1, '2023-06-13 12:10:29', '2023-06-13 12:10:29'),
(458, NULL, 'DUMMY', 458, 1, '2023-06-13 12:10:29', '2023-06-13 12:10:29'),
(459, NULL, 'DUMMY', 459, 1, '2023-06-13 12:10:29', '2023-06-13 12:10:29'),
(460, NULL, 'DUMMY', 460, 1, '2023-06-13 12:10:29', '2023-06-13 12:10:29'),
(461, NULL, 'DUMMY', 461, 1, '2023-06-13 12:10:29', '2023-06-13 12:10:29'),
(462, NULL, 'DUMMY', 462, 1, '2023-06-13 12:10:29', '2023-06-13 12:10:29'),
(463, NULL, 'DUMMY', 463, 1, '2023-06-13 12:10:29', '2023-06-13 12:10:29'),
(464, NULL, 'DUMMY', 464, 1, '2023-06-13 12:10:29', '2023-06-13 12:10:29'),
(465, NULL, 'DUMMY', 465, 1, '2023-06-13 12:10:29', '2023-06-13 12:10:29'),
(466, NULL, 'DUMMY', 466, 1, '2023-06-13 12:10:29', '2023-06-13 12:10:29'),
(467, NULL, 'DUMMY', 467, 1, '2023-06-13 12:10:29', '2023-06-13 12:10:29'),
(468, NULL, 'DUMMY', 468, 1, '2023-06-13 12:10:29', '2023-06-13 12:10:29'),
(469, NULL, 'DUMMY', 469, 1, '2023-06-13 12:10:29', '2023-06-13 12:10:29'),
(470, NULL, 'DUMMY', 470, 1, '2023-06-13 12:10:29', '2023-06-13 12:10:29'),
(471, NULL, 'DUMMY', 471, 1, '2023-06-17 12:52:13', '2023-06-17 12:52:13'),
(472, NULL, 'DUMMY', 472, 1, '2023-06-17 13:00:45', '2023-06-17 13:00:45'),
(473, NULL, 'DUMMY', 473, 1, '2023-06-17 13:07:05', '2023-06-17 13:07:05'),
(474, NULL, 'DUMMY', 474, 1, '2023-06-17 13:21:35', '2023-06-17 13:21:35'),
(475, NULL, 'DUMMY', 475, 1, '2023-06-17 13:27:08', '2023-06-17 13:27:08');

-- --------------------------------------------------------

--
-- Table structure for table `purchase_lines`
--

CREATE TABLE `purchase_lines` (
  `id` int UNSIGNED NOT NULL,
  `transaction_id` int UNSIGNED NOT NULL,
  `product_id` int UNSIGNED NOT NULL,
  `variation_id` int UNSIGNED NOT NULL,
  `quantity` decimal(22,4) NOT NULL DEFAULT '0.0000',
  `pp_without_discount` decimal(22,4) NOT NULL DEFAULT '0.0000' COMMENT 'Purchase price before inline discounts',
  `discount_percent` decimal(5,2) NOT NULL DEFAULT '0.00' COMMENT 'Inline discount percentage',
  `purchase_price` decimal(22,4) NOT NULL,
  `purchase_price_inc_tax` decimal(22,4) NOT NULL DEFAULT '0.0000',
  `item_tax` decimal(22,4) NOT NULL COMMENT 'Tax for one quantity',
  `tax_id` int UNSIGNED DEFAULT NULL,
  `quantity_sold` decimal(22,4) NOT NULL DEFAULT '0.0000' COMMENT 'Quanity sold from this purchase line',
  `quantity_adjusted` decimal(22,4) NOT NULL DEFAULT '0.0000' COMMENT 'Quanity adjusted in stock adjustment from this purchase line',
  `quantity_returned` decimal(22,4) NOT NULL DEFAULT '0.0000',
  `mfg_quantity_used` decimal(22,4) NOT NULL DEFAULT '0.0000',
  `mfg_date` date DEFAULT NULL,
  `exp_date` date DEFAULT NULL,
  `lot_number` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_unit_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `purchase_lines`
--

INSERT INTO `purchase_lines` (`id`, `transaction_id`, `product_id`, `variation_id`, `quantity`, `pp_without_discount`, `discount_percent`, `purchase_price`, `purchase_price_inc_tax`, `item_tax`, `tax_id`, `quantity_sold`, `quantity_adjusted`, `quantity_returned`, `mfg_quantity_used`, `mfg_date`, `exp_date`, `lot_number`, `sub_unit_id`, `created_at`, `updated_at`) VALUES
(119, 140, 194, 194, '100.0000', '78.0000', '0.00', '78.0000', '78.0000', '0.0000', NULL, '3.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-05-31 11:28:41', '2023-06-13 18:09:24'),
(120, 141, 195, 195, '56.0000', '130.0000', '0.00', '130.0000', '130.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(121, 142, 196, 196, '5.0000', '150.0000', '0.00', '150.0000', '150.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(122, 143, 197, 197, '3.0000', '200.0000', '0.00', '200.0000', '200.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(123, 144, 198, 198, '4.0000', '100.0000', '0.00', '100.0000', '100.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(124, 145, 199, 199, '2.0000', '150.0000', '0.00', '150.0000', '150.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(125, 146, 200, 200, '2.0000', '200.0000', '0.00', '200.0000', '200.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(126, 147, 201, 201, '3.0000', '300.0000', '0.00', '300.0000', '300.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(127, 148, 202, 202, '3.0000', '200.0000', '0.00', '200.0000', '200.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(128, 149, 203, 203, '1.0000', '300.0000', '0.00', '300.0000', '300.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(129, 150, 204, 204, '1.0000', '200.0000', '0.00', '200.0000', '200.0000', '0.0000', NULL, '1.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-05-31 11:28:41', '2023-05-31 18:26:09'),
(130, 151, 205, 205, '1.0000', '300.0000', '0.00', '300.0000', '300.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(131, 152, 206, 206, '2.0000', '250.0000', '0.00', '250.0000', '250.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(132, 153, 207, 207, '4.0000', '100.0000', '0.00', '100.0000', '100.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(133, 154, 208, 208, '2.0000', '200.0000', '0.00', '200.0000', '200.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(134, 155, 209, 209, '4.0000', '150.0000', '0.00', '150.0000', '150.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(135, 156, 210, 210, '2.0000', '150.0000', '0.00', '150.0000', '150.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(136, 157, 211, 211, '2.0000', '150.0000', '0.00', '150.0000', '150.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(137, 158, 212, 212, '3.0000', '150.0000', '0.00', '150.0000', '150.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(138, 159, 213, 213, '1.0000', '150.0000', '0.00', '150.0000', '150.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(139, 160, 214, 214, '2.0000', '150.0000', '0.00', '150.0000', '150.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(140, 161, 215, 215, '3.0000', '150.0000', '0.00', '150.0000', '150.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(141, 162, 216, 216, '1.0000', '150.0000', '0.00', '150.0000', '150.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(142, 163, 217, 217, '5.0000', '150.0000', '0.00', '150.0000', '150.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(143, 164, 218, 218, '4.0000', '150.0000', '0.00', '150.0000', '150.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(144, 165, 219, 219, '1.0000', '150.0000', '0.00', '150.0000', '150.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(145, 166, 220, 220, '1.0000', '150.0000', '0.00', '150.0000', '150.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(146, 167, 221, 221, '4.0000', '150.0000', '0.00', '150.0000', '150.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(147, 168, 222, 222, '3.0000', '150.0000', '0.00', '150.0000', '150.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(148, 169, 223, 223, '1.0000', '150.0000', '0.00', '150.0000', '150.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(149, 170, 224, 224, '1.0000', '150.0000', '0.00', '150.0000', '150.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(150, 171, 225, 225, '5.0000', '150.0000', '0.00', '150.0000', '150.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(151, 172, 226, 226, '1.0000', '150.0000', '0.00', '150.0000', '150.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(152, 173, 227, 227, '6.0000', '150.0000', '0.00', '150.0000', '150.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(153, 174, 228, 228, '5.0000', '150.0000', '0.00', '150.0000', '150.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(154, 175, 229, 229, '4.0000', '150.0000', '0.00', '150.0000', '150.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(155, 176, 230, 230, '1.0000', '150.0000', '0.00', '150.0000', '150.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(156, 177, 231, 231, '3.0000', '150.0000', '0.00', '150.0000', '150.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(157, 178, 232, 232, '5.0000', '150.0000', '0.00', '150.0000', '150.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(158, 179, 233, 233, '2.0000', '150.0000', '0.00', '150.0000', '150.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(159, 180, 234, 234, '3.0000', '150.0000', '0.00', '150.0000', '150.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(160, 181, 235, 235, '1.0000', '150.0000', '0.00', '150.0000', '150.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(161, 182, 236, 236, '5.0000', '150.0000', '0.00', '150.0000', '150.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(162, 183, 237, 237, '1.0000', '150.0000', '0.00', '150.0000', '150.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(163, 184, 238, 238, '1.0000', '150.0000', '0.00', '150.0000', '150.0000', '0.0000', NULL, '1.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-05-31 11:28:41', '2023-06-03 17:09:08'),
(164, 185, 239, 239, '4.0000', '150.0000', '0.00', '150.0000', '150.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(165, 186, 240, 240, '2.0000', '150.0000', '0.00', '150.0000', '150.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(166, 187, 241, 241, '3.0000', '150.0000', '0.00', '150.0000', '150.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(167, 188, 242, 242, '3.0000', '150.0000', '0.00', '150.0000', '150.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(168, 189, 243, 243, '3.0000', '150.0000', '0.00', '150.0000', '150.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(169, 190, 244, 244, '1.0000', '150.0000', '0.00', '150.0000', '150.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(170, 191, 245, 245, '2.0000', '150.0000', '0.00', '150.0000', '150.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(171, 192, 246, 246, '3.0000', '150.0000', '0.00', '150.0000', '150.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(172, 193, 247, 247, '3.0000', '150.0000', '0.00', '150.0000', '150.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(173, 194, 248, 248, '3.0000', '150.0000', '0.00', '150.0000', '150.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(174, 195, 249, 249, '2.0000', '100.0000', '0.00', '100.0000', '100.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(175, 196, 250, 250, '2.0000', '100.0000', '0.00', '100.0000', '100.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(176, 197, 251, 251, '2.0000', '100.0000', '0.00', '100.0000', '100.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(177, 198, 252, 252, '1.0000', '100.0000', '0.00', '100.0000', '100.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(178, 199, 253, 253, '5.0000', '100.0000', '0.00', '100.0000', '100.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(179, 200, 254, 254, '2.0000', '100.0000', '0.00', '100.0000', '100.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(180, 201, 255, 255, '6.0000', '100.0000', '0.00', '100.0000', '100.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(181, 202, 256, 256, '3.0000', '100.0000', '0.00', '100.0000', '100.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(182, 203, 257, 257, '2.0000', '100.0000', '0.00', '100.0000', '100.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(183, 204, 258, 258, '2.0000', '100.0000', '0.00', '100.0000', '100.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(184, 205, 259, 259, '3.0000', '100.0000', '0.00', '100.0000', '100.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(185, 206, 260, 260, '2.0000', '100.0000', '0.00', '100.0000', '100.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(186, 207, 261, 261, '1.0000', '100.0000', '0.00', '100.0000', '100.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(187, 208, 262, 262, '3.0000', '100.0000', '0.00', '100.0000', '100.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(188, 209, 263, 263, '3.0000', '100.0000', '0.00', '100.0000', '100.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(189, 210, 264, 264, '4.0000', '100.0000', '0.00', '100.0000', '100.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(190, 211, 265, 265, '3.0000', '100.0000', '0.00', '100.0000', '100.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(191, 212, 266, 266, '3.0000', '100.0000', '0.00', '100.0000', '100.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(192, 213, 267, 267, '5.0000', '100.0000', '0.00', '100.0000', '100.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(193, 214, 268, 268, '4.0000', '100.0000', '0.00', '100.0000', '100.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(194, 215, 269, 269, '4.0000', '100.0000', '0.00', '100.0000', '100.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(195, 216, 270, 270, '1.0000', '100.0000', '0.00', '100.0000', '100.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(196, 217, 271, 271, '1.0000', '100.0000', '0.00', '100.0000', '100.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(197, 218, 272, 272, '2.0000', '100.0000', '0.00', '100.0000', '100.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(198, 219, 273, 273, '2.0000', '100.0000', '0.00', '100.0000', '100.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(199, 220, 274, 274, '2.0000', '100.0000', '0.00', '100.0000', '100.0000', '0.0000', NULL, '2.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-05-31 11:28:42', '2023-06-08 13:09:58'),
(200, 221, 275, 275, '2.0000', '100.0000', '0.00', '100.0000', '100.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(201, 222, 276, 276, '3.0000', '700.0000', '0.00', '700.0000', '700.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(202, 223, 277, 277, '3.0000', '400.0000', '0.00', '400.0000', '400.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(203, 224, 278, 278, '9.0000', '500.0000', '0.00', '500.0000', '500.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(204, 225, 279, 279, '3.0000', '400.0000', '0.00', '400.0000', '400.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(205, 226, 280, 280, '1.0000', '1000.0000', '0.00', '1000.0000', '1000.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(206, 227, 281, 281, '2.0000', '1200.0000', '0.00', '1200.0000', '1200.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(207, 228, 282, 282, '1.0000', '900.0000', '0.00', '900.0000', '900.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(208, 229, 283, 283, '1.0000', '1000.0000', '0.00', '1000.0000', '1000.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(209, 230, 284, 284, '25.0000', '360.0000', '0.00', '360.0000', '360.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(210, 231, 285, 285, '26.0000', '360.0000', '0.00', '360.0000', '360.0000', '0.0000', NULL, '1.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-05-31 11:28:42', '2023-06-08 14:13:56'),
(211, 232, 286, 286, '9.0000', '100.0000', '0.00', '100.0000', '100.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(212, 233, 287, 287, '9.0000', '100.0000', '0.00', '100.0000', '100.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(213, 234, 288, 288, '9.0000', '80.0000', '0.00', '80.0000', '80.0000', '0.0000', NULL, '1.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-05-31 11:28:42', '2023-05-31 13:49:40'),
(214, 235, 289, 289, '10.0000', '70.0000', '0.00', '70.0000', '70.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(215, 236, 290, 290, '10.0000', '80.0000', '0.00', '80.0000', '80.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(216, 237, 291, 291, '1.0000', '150.0000', '0.00', '150.0000', '150.0000', '0.0000', NULL, '1.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-05-31 11:28:42', '2023-06-12 17:10:26'),
(217, 238, 292, 292, '2.0000', '500.0000', '0.00', '500.0000', '500.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(218, 239, 293, 293, '2.0000', '350.0000', '0.00', '350.0000', '350.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-05-31 11:28:42', '2023-06-08 14:27:31'),
(219, 240, 294, 294, '2.0000', '250.0000', '0.00', '250.0000', '250.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(220, 241, 295, 295, '2.0000', '250.0000', '0.00', '250.0000', '250.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-05-31 11:28:42', '2023-06-08 14:28:48'),
(221, 242, 296, 296, '2.0000', '1500.0000', '0.00', '1500.0000', '1500.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(222, 243, 297, 297, '2.0000', '400.0000', '0.00', '400.0000', '400.0000', '0.0000', NULL, '1.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-05-31 11:28:42', '2023-05-31 19:24:59'),
(223, 244, 298, 298, '2.0000', '200.0000', '0.00', '200.0000', '200.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(224, 245, 299, 299, '2.0000', '200.0000', '0.00', '200.0000', '200.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(225, 246, 300, 300, '2.0000', '250.0000', '0.00', '250.0000', '250.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(226, 247, 301, 301, '2.0000', '250.0000', '0.00', '250.0000', '250.0000', '0.0000', NULL, '1.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-05-31 11:28:42', '2023-06-08 18:14:30'),
(227, 248, 302, 302, '1.0000', '150.0000', '0.00', '150.0000', '150.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(228, 249, 303, 303, '1.0000', '150.0000', '0.00', '150.0000', '150.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(229, 250, 304, 304, '2.0000', '170.0000', '0.00', '170.0000', '170.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(230, 251, 306, 306, '1.0000', '1300.0000', '0.00', '1300.0000', '1300.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(231, 252, 307, 307, '1.0000', '1300.0000', '0.00', '1300.0000', '1300.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(232, 253, 308, 308, '1.0000', '1300.0000', '0.00', '1300.0000', '1300.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(233, 254, 309, 309, '1.0000', '1000.0000', '0.00', '1000.0000', '1000.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(234, 255, 310, 310, '1.0000', '1000.0000', '0.00', '1000.0000', '1000.0000', '0.0000', NULL, '1.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-05-31 11:28:42', '2023-06-15 12:10:40'),
(235, 256, 311, 311, '2.0000', '1800.0000', '0.00', '1800.0000', '1800.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(236, 257, 312, 312, '1.0000', '1500.0000', '0.00', '1500.0000', '1500.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(237, 258, 313, 313, '1.0000', '1200.0000', '0.00', '1200.0000', '1200.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(238, 259, 314, 314, '1.0000', '800.0000', '0.00', '800.0000', '800.0000', '0.0000', NULL, '1.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-05-31 11:28:42', '2023-06-02 18:46:44'),
(239, 260, 315, 315, '1.0000', '800.0000', '0.00', '800.0000', '800.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(240, 261, 316, 316, '1.0000', '800.0000', '0.00', '800.0000', '800.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-05-31 11:28:43', '2023-05-31 11:28:43'),
(241, 262, 317, 317, '1.0000', '1000.0000', '0.00', '1000.0000', '1000.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-05-31 11:28:43', '2023-05-31 11:28:43'),
(242, 263, 318, 318, '2.0000', '700.0000', '0.00', '700.0000', '700.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-05-31 11:28:43', '2023-05-31 11:28:43'),
(243, 264, 319, 319, '2.0000', '1000.0000', '0.00', '1000.0000', '1000.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-05-31 11:28:43', '2023-05-31 11:28:43'),
(244, 265, 320, 320, '1.0000', '1500.0000', '0.00', '1500.0000', '1500.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-05-31 11:28:43', '2023-05-31 11:28:43'),
(245, 266, 321, 321, '2.0000', '1700.0000', '0.00', '1700.0000', '1700.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-05-31 11:28:43', '2023-06-05 17:06:53'),
(246, 267, 322, 322, '2.0000', '900.0000', '0.00', '900.0000', '900.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-05-31 11:28:43', '2023-05-31 11:28:43'),
(247, 268, 323, 323, '1.0000', '800.0000', '0.00', '800.0000', '800.0000', '0.0000', NULL, '1.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-05-31 11:28:43', '2023-06-05 15:02:11'),
(248, 269, 324, 324, '2.0000', '1300.0000', '0.00', '1300.0000', '1300.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-05-31 11:28:43', '2023-05-31 11:28:43'),
(249, 270, 325, 325, '3.0000', '300.0000', '0.00', '300.0000', '300.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-05-31 11:28:43', '2023-05-31 11:28:43'),
(250, 271, 326, 326, '2.0000', '450.0000', '0.00', '450.0000', '450.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-05-31 11:28:43', '2023-05-31 11:28:43'),
(251, 272, 327, 327, '2.0000', '350.0000', '0.00', '350.0000', '350.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-05-31 11:28:43', '2023-05-31 11:28:43'),
(252, 273, 328, 328, '1.0000', '450.0000', '0.00', '450.0000', '450.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-05-31 11:28:43', '2023-06-08 14:16:59'),
(253, 274, 329, 329, '2.0000', '1000.0000', '0.00', '1000.0000', '1000.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-05-31 11:28:43', '2023-05-31 11:28:43'),
(254, 275, 330, 330, '1.0000', '2500.0000', '0.00', '2500.0000', '2500.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-05-31 11:28:43', '2023-05-31 11:28:43'),
(255, 276, 331, 331, '2.0000', '1500.0000', '0.00', '1500.0000', '1500.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-05-31 11:28:43', '2023-05-31 11:28:43'),
(256, 277, 332, 332, '2.0000', '1000.0000', '0.00', '1000.0000', '1000.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-05-31 11:28:43', '2023-05-31 11:28:43'),
(257, 278, 333, 333, '2.0000', '800.0000', '0.00', '800.0000', '800.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-05-31 11:28:43', '2023-05-31 11:28:43'),
(258, 279, 334, 334, '2.0000', '1300.0000', '0.00', '1300.0000', '1300.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-05-31 11:28:43', '2023-05-31 11:28:43'),
(259, 280, 335, 335, '2.0000', '2500.0000', '0.00', '2500.0000', '2500.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-05-31 11:28:43', '2023-05-31 11:28:43'),
(260, 281, 336, 336, '2.0000', '300.0000', '0.00', '300.0000', '300.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-05-31 11:28:43', '2023-05-31 11:28:43'),
(261, 282, 337, 337, '3.0000', '500.0000', '0.00', '500.0000', '500.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-05-31 11:28:43', '2023-05-31 11:28:43'),
(262, 283, 338, 338, '2.0000', '4000.0000', '0.00', '4000.0000', '4000.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-05-31 11:28:43', '2023-05-31 11:28:43'),
(263, 284, 339, 339, '2.0000', '4500.0000', '0.00', '4500.0000', '4500.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-05-31 11:28:43', '2023-05-31 11:28:43'),
(264, 285, 340, 340, '1.0000', '900.0000', '0.00', '900.0000', '900.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-05-31 11:28:43', '2023-05-31 11:28:43'),
(265, 286, 341, 341, '1.0000', '1000.0000', '0.00', '1000.0000', '1000.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-05-31 11:28:43', '2023-05-31 11:28:43'),
(266, 287, 342, 342, '3.0000', '800.0000', '0.00', '800.0000', '800.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-05-31 11:28:43', '2023-05-31 11:28:43'),
(267, 288, 343, 343, '3.0000', '400.0000', '0.00', '400.0000', '400.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-05-31 11:28:43', '2023-05-31 11:28:43'),
(268, 289, 344, 344, '3.0000', '400.0000', '0.00', '400.0000', '400.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-05-31 11:28:43', '2023-05-31 11:28:43'),
(269, 290, 345, 345, '1.0000', '550.0000', '0.00', '550.0000', '550.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-05-31 11:28:43', '2023-05-31 11:28:43'),
(270, 291, 346, 346, '7.0000', '3000.0000', '0.00', '3000.0000', '3000.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-05-31 11:28:43', '2023-06-08 09:46:28'),
(271, 292, 347, 347, '9.0000', '2900.0000', '0.00', '2900.0000', '2900.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-05-31 11:28:43', '2023-05-31 11:28:43'),
(272, 293, 348, 348, '11.0000', '2700.0000', '0.00', '2700.0000', '2700.0000', '0.0000', NULL, '3.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-05-31 11:28:43', '2023-06-08 13:45:27'),
(273, 294, 349, 349, '9.0000', '3400.0000', '0.00', '3400.0000', '3400.0000', '0.0000', NULL, '1.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-05-31 11:28:43', '2023-06-14 12:00:40'),
(274, 295, 350, 350, '10.0000', '3000.0000', '0.00', '3000.0000', '3000.0000', '0.0000', NULL, '1.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-05-31 11:28:43', '2023-06-13 18:13:23'),
(275, 296, 351, 351, '9.0000', '2300.0000', '0.00', '2300.0000', '2300.0000', '0.0000', NULL, '3.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-05-31 11:28:43', '2023-06-05 12:14:29'),
(276, 297, 352, 352, '10.0000', '2850.0000', '0.00', '2850.0000', '2850.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-05-31 11:28:43', '2023-05-31 11:28:43'),
(277, 298, 353, 353, '9.0000', '2400.0000', '0.00', '2400.0000', '2400.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-05-31 11:28:43', '2023-05-31 11:28:43'),
(278, 299, 354, 354, '7.0000', '3200.0000', '0.00', '3200.0000', '3200.0000', '0.0000', NULL, '3.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-05-31 11:28:43', '2023-06-13 11:42:43'),
(279, 300, 355, 355, '1.0000', '800.0000', '0.00', '800.0000', '800.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-05-31 11:28:43', '2023-05-31 11:28:43'),
(280, 301, 356, 356, '1.0000', '300.0000', '0.00', '300.0000', '300.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-05-31 11:28:43', '2023-05-31 11:28:43'),
(281, 302, 357, 357, '1.0000', '900.0000', '0.00', '900.0000', '900.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-05-31 11:28:43', '2023-05-31 11:28:43'),
(282, 303, 358, 358, '1.0000', '2000.0000', '0.00', '2000.0000', '2000.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-05-31 11:28:43', '2023-05-31 11:28:43'),
(283, 306, 359, 359, '3.0000', '300.0000', '0.00', '300.0000', '300.0000', '0.0000', NULL, '1.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-05-31 14:23:19', '2023-05-31 14:25:05'),
(284, 308, 360, 360, '13.0000', '300.0000', '0.00', '300.0000', '300.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-05-31 14:42:33', '2023-06-08 14:08:31'),
(285, 316, 361, 361, '2.0000', '150.0000', '0.00', '150.0000', '150.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-06-03 11:20:15', '2023-06-10 13:05:38'),
(286, 317, 362, 362, '2.0000', '150.0000', '0.00', '150.0000', '150.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-06-03 11:20:15', '2023-06-10 13:07:00'),
(287, 318, 363, 363, '1.0000', '150.0000', '0.00', '150.0000', '150.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-06-03 11:20:15', '2023-06-10 13:07:54'),
(288, 319, 364, 364, '3.0000', '150.0000', '0.00', '150.0000', '150.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-06-03 11:20:15', '2023-06-03 11:20:15'),
(289, 320, 365, 365, '4.0000', '150.0000', '0.00', '150.0000', '150.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-06-03 11:20:15', '2023-06-03 11:20:15'),
(290, 321, 366, 366, '2.0000', '150.0000', '0.00', '150.0000', '150.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-06-03 11:20:15', '2023-06-03 11:20:15'),
(291, 322, 367, 367, '2.0000', '150.0000', '0.00', '150.0000', '150.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-06-03 11:20:15', '2023-06-03 11:20:15'),
(292, 323, 368, 368, '3.0000', '150.0000', '0.00', '150.0000', '150.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-06-03 11:20:15', '2023-06-03 11:20:15'),
(293, 324, 369, 369, '3.0000', '150.0000', '0.00', '150.0000', '150.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-06-03 11:20:15', '2023-06-03 11:20:15'),
(294, 325, 370, 370, '1.0000', '150.0000', '0.00', '150.0000', '150.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-06-03 11:20:15', '2023-06-03 11:20:15'),
(295, 326, 371, 371, '1.0000', '150.0000', '0.00', '150.0000', '150.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-06-03 11:20:15', '2023-06-03 11:20:15'),
(296, 327, 372, 372, '1.0000', '200.0000', '0.00', '200.0000', '200.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-06-03 11:20:15', '2023-06-03 11:20:15'),
(297, 328, 373, 373, '2.0000', '200.0000', '0.00', '200.0000', '200.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-06-03 11:20:15', '2023-06-03 11:20:15'),
(298, 329, 374, 374, '4.0000', '200.0000', '0.00', '200.0000', '200.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(299, 330, 375, 375, '2.0000', '200.0000', '0.00', '200.0000', '200.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(300, 331, 376, 376, '4.0000', '200.0000', '0.00', '200.0000', '200.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(301, 332, 377, 377, '2.0000', '200.0000', '0.00', '200.0000', '200.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(302, 333, 378, 378, '2.0000', '200.0000', '0.00', '200.0000', '200.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(303, 334, 379, 379, '3.0000', '200.0000', '0.00', '200.0000', '200.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(304, 335, 380, 380, '1.0000', '200.0000', '0.00', '200.0000', '200.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(305, 336, 381, 381, '2.0000', '200.0000', '0.00', '200.0000', '200.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(306, 337, 382, 382, '3.0000', '200.0000', '0.00', '200.0000', '200.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(307, 338, 383, 383, '1.0000', '200.0000', '0.00', '200.0000', '200.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(308, 339, 384, 384, '5.0000', '200.0000', '0.00', '200.0000', '200.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(309, 340, 385, 385, '4.0000', '200.0000', '0.00', '200.0000', '200.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(310, 341, 386, 386, '1.0000', '200.0000', '0.00', '200.0000', '200.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(311, 342, 387, 387, '1.0000', '200.0000', '0.00', '200.0000', '200.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(312, 343, 388, 388, '4.0000', '200.0000', '0.00', '200.0000', '200.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(313, 344, 389, 389, '3.0000', '200.0000', '0.00', '200.0000', '200.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(314, 345, 390, 390, '1.0000', '200.0000', '0.00', '200.0000', '200.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(315, 346, 391, 391, '1.0000', '200.0000', '0.00', '200.0000', '200.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(316, 347, 392, 392, '5.0000', '200.0000', '0.00', '200.0000', '200.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(317, 348, 393, 393, '1.0000', '200.0000', '0.00', '200.0000', '200.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(318, 349, 394, 394, '6.0000', '200.0000', '0.00', '200.0000', '200.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(319, 350, 395, 395, '5.0000', '250.0000', '0.00', '250.0000', '250.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(320, 351, 396, 396, '4.0000', '250.0000', '0.00', '250.0000', '250.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(321, 352, 397, 397, '1.0000', '250.0000', '0.00', '250.0000', '250.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(322, 353, 398, 398, '3.0000', '250.0000', '0.00', '250.0000', '250.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(323, 354, 399, 399, '5.0000', '250.0000', '0.00', '250.0000', '250.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(324, 355, 400, 400, '2.0000', '250.0000', '0.00', '250.0000', '250.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(325, 356, 401, 401, '3.0000', '250.0000', '0.00', '250.0000', '250.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(326, 357, 402, 402, '1.0000', '250.0000', '0.00', '250.0000', '250.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(327, 358, 403, 403, '5.0000', '250.0000', '0.00', '250.0000', '250.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(328, 359, 404, 404, '1.0000', '200.0000', '0.00', '200.0000', '200.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(329, 360, 405, 405, '1.0000', '200.0000', '0.00', '200.0000', '200.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(330, 361, 406, 406, '4.0000', '200.0000', '0.00', '200.0000', '200.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(331, 362, 407, 407, '2.0000', '200.0000', '0.00', '200.0000', '200.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(332, 363, 408, 408, '3.0000', '200.0000', '0.00', '200.0000', '200.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(333, 364, 409, 409, '3.0000', '200.0000', '0.00', '200.0000', '200.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(334, 365, 410, 410, '3.0000', '200.0000', '0.00', '200.0000', '200.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(335, 366, 411, 411, '1.0000', '200.0000', '0.00', '200.0000', '200.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(336, 367, 412, 412, '2.0000', '200.0000', '0.00', '200.0000', '200.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(337, 368, 413, 413, '3.0000', '200.0000', '0.00', '200.0000', '200.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(338, 369, 414, 414, '3.0000', '200.0000', '0.00', '200.0000', '200.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(339, 370, 415, 415, '3.0000', '60.0000', '0.00', '60.0000', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(340, 371, 416, 416, '2.0000', '60.0000', '0.00', '60.0000', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(341, 372, 417, 417, '2.0000', '60.0000', '0.00', '60.0000', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(342, 373, 418, 418, '2.0000', '60.0000', '0.00', '60.0000', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(343, 374, 419, 419, '1.0000', '60.0000', '0.00', '60.0000', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(344, 375, 420, 420, '5.0000', '60.0000', '0.00', '60.0000', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(345, 376, 421, 421, '2.0000', '60.0000', '0.00', '60.0000', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(346, 377, 422, 422, '6.0000', '60.0000', '0.00', '60.0000', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(347, 378, 423, 423, '3.0000', '60.0000', '0.00', '60.0000', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(348, 379, 424, 424, '2.0000', '60.0000', '0.00', '60.0000', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(349, 380, 425, 425, '2.0000', '60.0000', '0.00', '60.0000', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(350, 381, 426, 426, '3.0000', '60.0000', '0.00', '60.0000', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(351, 382, 427, 427, '2.0000', '60.0000', '0.00', '60.0000', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(352, 383, 428, 428, '1.0000', '60.0000', '0.00', '60.0000', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(353, 384, 429, 429, '3.0000', '60.0000', '0.00', '60.0000', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(354, 385, 430, 430, '3.0000', '60.0000', '0.00', '60.0000', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(355, 386, 431, 431, '4.0000', '60.0000', '0.00', '60.0000', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(356, 387, 432, 432, '3.0000', '60.0000', '0.00', '60.0000', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(357, 388, 433, 433, '3.0000', '60.0000', '0.00', '60.0000', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(358, 389, 434, 434, '5.0000', '60.0000', '0.00', '60.0000', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(359, 390, 435, 435, '4.0000', '500.0000', '0.00', '500.0000', '500.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(360, 391, 436, 436, '4.0000', '500.0000', '0.00', '500.0000', '500.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(361, 394, 323, 323, '100.0000', '800.0000', '0.00', '800.0000', '800.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-06-03 13:05:17', '2023-06-03 13:07:11'),
(362, 398, 315, 315, '1.0000', '800.0000', '0.00', '800.0000', '800.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-06-03 17:04:57', '2023-06-03 17:04:57'),
(363, 404, 437, 437, '50.0000', '145.0000', '0.00', '145.0000', '145.0000', '0.0000', NULL, '2.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-06-08 09:39:53', '2023-06-16 09:14:06'),
(364, 410, 438, 438, '5.0000', '100.0000', '0.00', '100.0000', '100.0000', '0.0000', NULL, '1.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-06-08 18:36:49', '2023-06-08 18:45:53'),
(365, 413, 323, 323, '2.0000', '800.0000', '0.00', '800.0000', '800.0000', '0.0000', NULL, '2.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-06-10 13:03:26', '2023-06-16 18:43:57');
INSERT INTO `purchase_lines` (`id`, `transaction_id`, `product_id`, `variation_id`, `quantity`, `pp_without_discount`, `discount_percent`, `purchase_price`, `purchase_price_inc_tax`, `item_tax`, `tax_id`, `quantity_sold`, `quantity_adjusted`, `quantity_returned`, `mfg_quantity_used`, `mfg_date`, `exp_date`, `lot_number`, `sub_unit_id`, `created_at`, `updated_at`) VALUES
(366, 417, 439, 439, '133.0000', '200.0000', '0.00', '200.0000', '200.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-06-13 12:10:29', '2023-06-13 12:10:29'),
(367, 418, 440, 440, '3478.0000', '200.0000', '0.00', '200.0000', '200.0000', '0.0000', NULL, '5.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-06-13 12:10:29', '2023-06-14 08:36:48'),
(368, 419, 441, 441, '1989.0000', '200.0000', '0.00', '200.0000', '200.0000', '0.0000', NULL, '10.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-06-13 12:10:29', '2023-06-14 08:43:50'),
(369, 420, 442, 442, '5.0000', '200.0000', '0.00', '200.0000', '200.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-06-13 12:10:29', '2023-06-13 12:10:29'),
(370, 421, 443, 443, '90.0000', '200.0000', '0.00', '200.0000', '200.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-06-13 12:10:29', '2023-06-13 12:10:29'),
(371, 422, 444, 444, '184.0000', '200.0000', '0.00', '200.0000', '200.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-06-13 12:10:29', '2023-06-13 12:10:29'),
(372, 423, 445, 445, '76.0000', '200.0000', '0.00', '200.0000', '200.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-06-13 12:10:29', '2023-06-13 12:10:29'),
(373, 424, 446, 446, '588.0000', '200.0000', '0.00', '200.0000', '200.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-06-13 12:10:29', '2023-06-13 12:10:29'),
(374, 425, 447, 447, '97.0000', '200.0000', '0.00', '200.0000', '200.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-06-13 12:10:29', '2023-06-13 12:10:29'),
(375, 426, 448, 448, '50.0000', '200.0000', '0.00', '200.0000', '200.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-06-13 12:10:29', '2023-06-13 12:10:29'),
(376, 427, 449, 449, '193.0000', '200.0000', '0.00', '200.0000', '200.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-06-13 12:10:29', '2023-06-13 12:10:29'),
(377, 428, 450, 450, '192.0000', '200.0000', '0.00', '200.0000', '200.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-06-13 12:10:29', '2023-06-13 12:10:29'),
(378, 429, 451, 451, '162.0000', '200.0000', '0.00', '200.0000', '200.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-06-13 12:10:29', '2023-06-13 12:10:29'),
(379, 430, 452, 452, '486.0000', '200.0000', '0.00', '200.0000', '200.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-06-13 12:10:29', '2023-06-13 12:10:29'),
(380, 431, 453, 453, '767.0000', '200.0000', '0.00', '200.0000', '200.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-06-13 12:10:29', '2023-06-13 12:10:29'),
(381, 432, 454, 454, '45.0000', '200.0000', '0.00', '200.0000', '200.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-06-13 12:10:29', '2023-06-13 12:10:29'),
(382, 433, 455, 455, '634.0000', '200.0000', '0.00', '200.0000', '200.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-06-13 12:10:29', '2023-06-13 12:10:29'),
(383, 434, 456, 456, '307.0000', '200.0000', '0.00', '200.0000', '200.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-06-13 12:10:29', '2023-06-13 12:10:29'),
(384, 435, 457, 457, '10.0000', '200.0000', '0.00', '200.0000', '200.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-06-13 12:10:29', '2023-06-13 12:10:29'),
(385, 436, 458, 458, '10.0000', '200.0000', '0.00', '200.0000', '200.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-06-13 12:10:29', '2023-06-13 12:10:29'),
(386, 437, 459, 459, '10.0000', '200.0000', '0.00', '200.0000', '200.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-06-13 12:10:29', '2023-06-13 12:10:29'),
(387, 438, 460, 460, '35.0000', '200.0000', '0.00', '200.0000', '200.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-06-13 12:10:29', '2023-06-13 12:10:29'),
(388, 439, 461, 461, '17.0000', '200.0000', '0.00', '200.0000', '200.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-06-13 12:10:29', '2023-06-13 12:10:29'),
(389, 440, 462, 462, '20.0000', '200.0000', '0.00', '200.0000', '200.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-06-13 12:10:29', '2023-06-13 12:10:29'),
(390, 441, 463, 463, '291.0000', '200.0000', '0.00', '200.0000', '200.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-06-13 12:10:29', '2023-06-13 12:10:29'),
(391, 442, 464, 464, '20.0000', '200.0000', '0.00', '200.0000', '200.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-06-13 12:10:29', '2023-06-13 12:10:29'),
(392, 443, 465, 465, '20.0000', '200.0000', '0.00', '200.0000', '200.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-06-13 12:10:29', '2023-06-13 12:10:29'),
(393, 444, 466, 466, '66.0000', '200.0000', '0.00', '200.0000', '200.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-06-13 12:10:29', '2023-06-13 12:10:29'),
(394, 445, 467, 467, '20.0000', '200.0000', '0.00', '200.0000', '200.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-06-13 12:10:29', '2023-06-13 12:10:29'),
(395, 446, 468, 468, '20.0000', '200.0000', '0.00', '200.0000', '200.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-06-13 12:10:29', '2023-06-13 12:10:29'),
(396, 447, 469, 469, '20.0000', '200.0000', '0.00', '200.0000', '200.0000', '0.0000', NULL, '1.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-06-13 12:10:29', '2023-06-13 12:58:08'),
(397, 448, 470, 470, '718.0000', '200.0000', '0.00', '200.0000', '200.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-06-13 12:10:29', '2023-06-13 12:10:29'),
(398, 453, 440, 440, '5.0000', '0.0000', '0.00', '200.0000', '200.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-06-14 08:36:48', '2023-06-14 08:36:48'),
(399, 455, 441, 441, '10.0000', '0.0000', '0.00', '200.0000', '200.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-06-14 08:43:50', '2023-06-14 08:43:50'),
(400, 460, 323, 323, '3.0000', '800.0000', '0.00', '800.0000', '800.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-06-17 12:41:32', '2023-06-17 12:41:32'),
(401, 461, 471, 471, '1.0000', '1000.0000', '0.00', '1000.0000', '1000.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-06-17 12:54:47', '2023-06-17 12:54:47'),
(402, 462, 472, 472, '3.0000', '150.0000', '0.00', '150.0000', '150.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-06-17 13:02:17', '2023-06-17 13:02:17'),
(403, 462, 472, 472, '1.0000', '150.0000', '0.00', '150.0000', '150.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-06-17 13:02:17', '2023-06-17 13:02:17'),
(404, 463, 473, 473, '2.0000', '150.0000', '0.00', '150.0000', '150.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-06-17 13:11:49', '2023-06-17 13:11:49'),
(405, 464, 297, 297, '1.0000', '400.0000', '0.00', '400.0000', '400.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2023-06-17 13:36:33', '2023-06-17 13:36:33');

-- --------------------------------------------------------

--
-- Table structure for table `reference_counts`
--

CREATE TABLE `reference_counts` (
  `id` int UNSIGNED NOT NULL,
  `ref_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ref_count` int NOT NULL,
  `business_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `reference_counts`
--

INSERT INTO `reference_counts` (`id`, `ref_type`, `ref_count`, `business_id`, `created_at`, `updated_at`) VALUES
(1, 'contacts', 1, 2, '2022-10-13 17:35:41', '2022-10-13 17:35:41'),
(2, 'business_location', 1, 2, '2022-10-13 17:35:41', '2022-10-13 17:35:41'),
(3, 'username', 3, 2, '2022-10-13 18:54:37', '2023-05-16 16:28:45'),
(4, 'sell_payment', 17, 2, '2022-10-13 19:12:55', '2023-05-16 18:29:10'),
(5, 'expense', 1, 2, '2022-10-22 12:55:00', '2022-10-22 12:55:00'),
(6, 'contacts', 8, 3, '2023-05-30 00:03:44', '2023-06-03 12:58:54'),
(7, 'business_location', 1, 3, '2023-05-30 00:03:44', '2023-05-30 00:03:44'),
(8, 'username', 1, 3, '2023-05-31 11:36:56', '2023-05-31 11:36:56'),
(9, 'sell_payment', 31, 3, '2023-05-31 12:04:13', '2023-06-16 18:43:57'),
(10, 'purchase', 8, 3, '2023-06-03 13:05:17', '2023-06-17 13:36:33'),
(11, 'purchase_payment', 3, 3, '2023-06-03 13:05:17', '2023-06-10 13:03:26'),
(12, 'expense', 1, 3, '2023-06-03 15:57:49', '2023-06-03 15:57:49'),
(13, 'sell_return', 1, 3, '2023-06-08 09:46:28', '2023-06-08 09:46:28'),
(14, 'contacts', 1, 4, '2023-06-13 13:27:15', '2023-06-13 13:27:15'),
(15, 'business_location', 2, 4, '2023-06-13 13:27:15', '2023-06-13 13:00:01'),
(16, 'sell_payment', 1, 4, '2023-06-13 12:58:08', '2023-06-13 12:58:08'),
(17, 'username', 1, 4, '2023-06-14 08:34:05', '2023-06-14 08:34:05'),
(18, 'stock_transfer', 2, 4, '2023-06-14 08:36:48', '2023-06-14 08:43:50');

-- --------------------------------------------------------

--
-- Table structure for table `res_product_modifier_sets`
--

CREATE TABLE `res_product_modifier_sets` (
  `modifier_set_id` int UNSIGNED NOT NULL,
  `product_id` int UNSIGNED NOT NULL COMMENT 'Table use to store the modifier sets applicable for a product'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `res_tables`
--

CREATE TABLE `res_tables` (
  `id` int UNSIGNED NOT NULL,
  `business_id` int UNSIGNED NOT NULL,
  `location_id` int UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_by` int UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `res_tables`
--

INSERT INTO `res_tables` (`id`, `business_id`, `location_id`, `name`, `description`, `created_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 2, 1, 'ONE', NULL, 2, NULL, '2022-10-13 18:58:24', '2022-10-13 18:58:24'),
(2, 2, 1, 'TWO', NULL, 2, NULL, '2022-10-13 18:58:34', '2022-10-13 18:58:34');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `business_id` int UNSIGNED NOT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT '0',
  `is_service_staff` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `business_id`, `is_default`, `is_service_staff`, `created_at`, `updated_at`) VALUES
(3, 'Admin#2', 'web', 2, 1, 0, '2022-10-13 17:35:41', '2022-10-13 17:35:41'),
(4, 'Cashier#2', 'web', 2, 0, 0, '2022-10-13 17:35:41', '2022-10-13 17:35:41'),
(5, 'Admin#3', 'web', 3, 1, 0, '2023-05-30 00:03:44', '2023-05-30 00:03:44'),
(6, 'Cashier#3', 'web', 3, 0, 0, '2023-05-30 00:03:44', '2023-05-30 00:03:44'),
(7, 'Admin#4', 'web', 4, 1, 0, '2023-06-13 13:27:15', '2023-06-13 13:27:15'),
(8, 'Cashier#4', 'web', 4, 0, 0, '2023-06-13 13:27:15', '2023-06-13 13:27:15');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` int UNSIGNED NOT NULL,
  `role_id` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(9, 4),
(18, 4),
(20, 4),
(23, 4),
(45, 4),
(46, 4),
(47, 4),
(48, 4),
(54, 4),
(55, 4),
(56, 4),
(76, 4),
(2, 6),
(9, 6),
(10, 6),
(16, 6),
(17, 6),
(18, 6),
(19, 6),
(20, 6),
(23, 6),
(29, 6),
(30, 6),
(33, 6),
(34, 6),
(37, 6),
(38, 6),
(39, 6),
(45, 6),
(46, 6),
(47, 6),
(48, 6),
(72, 6),
(73, 6),
(33, 8),
(34, 8),
(37, 8),
(45, 8),
(46, 8),
(47, 8),
(48, 8),
(78, 8);

-- --------------------------------------------------------

--
-- Table structure for table `selling_price_groups`
--

CREATE TABLE `selling_price_groups` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `business_id` int UNSIGNED NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `selling_price_groups`
--

INSERT INTO `selling_price_groups` (`id`, `name`, `description`, `business_id`, `is_active`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Wholesale', 'WS', 3, 1, NULL, '2023-06-08 10:04:55', '2023-06-08 10:04:55');

-- --------------------------------------------------------

--
-- Table structure for table `sell_line_warranties`
--

CREATE TABLE `sell_line_warranties` (
  `sell_line_id` int NOT NULL,
  `warranty_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `payload` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `stock_adjustments_temp`
--

CREATE TABLE `stock_adjustments_temp` (
  `id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `stock_adjustment_lines`
--

CREATE TABLE `stock_adjustment_lines` (
  `id` int UNSIGNED NOT NULL,
  `transaction_id` int UNSIGNED NOT NULL,
  `product_id` int UNSIGNED NOT NULL,
  `variation_id` int UNSIGNED NOT NULL,
  `quantity` decimal(22,4) NOT NULL,
  `unit_price` decimal(22,4) DEFAULT NULL COMMENT 'Last purchase unit price',
  `removed_purchase_line` int DEFAULT NULL,
  `lot_no_line_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `system`
--

CREATE TABLE `system` (
  `id` int UNSIGNED NOT NULL,
  `key` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `system`
--

INSERT INTO `system` (`id`, `key`, `value`) VALUES
(1, 'db_version', '3.4'),
(2, 'default_business_active_status', '1');

-- --------------------------------------------------------

--
-- Table structure for table `tax_rates`
--

CREATE TABLE `tax_rates` (
  `id` int UNSIGNED NOT NULL,
  `business_id` int UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` double(22,4) NOT NULL,
  `is_tax_group` tinyint(1) NOT NULL DEFAULT '0',
  `created_by` int UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` int UNSIGNED NOT NULL,
  `business_id` int UNSIGNED NOT NULL,
  `location_id` int UNSIGNED DEFAULT NULL,
  `res_table_id` int UNSIGNED DEFAULT NULL COMMENT 'fields to restaurant module',
  `res_waiter_id` int UNSIGNED DEFAULT NULL COMMENT 'fields to restaurant module',
  `res_order_status` enum('received','cooked','served') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('received','pending','ordered','draft','final') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_quotation` tinyint(1) NOT NULL DEFAULT '0',
  `payment_status` enum('paid','due','partial') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `adjustment_type` enum('normal','abnormal') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_id` int UNSIGNED DEFAULT NULL,
  `customer_group_id` int DEFAULT NULL COMMENT 'used to add customer group while selling',
  `invoice_no` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ref_no` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subscription_no` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subscription_repeat_on` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transaction_date` datetime NOT NULL,
  `total_before_tax` decimal(22,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total before the purchase/invoice tax, this includeds the indivisual product tax',
  `tax_id` int UNSIGNED DEFAULT NULL,
  `tax_amount` decimal(22,4) NOT NULL DEFAULT '0.0000',
  `discount_type` enum('fixed','percentage') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount_amount` decimal(22,4) DEFAULT '0.0000',
  `rp_redeemed` int NOT NULL DEFAULT '0' COMMENT 'rp is the short form of reward points',
  `rp_redeemed_amount` decimal(22,4) NOT NULL DEFAULT '0.0000' COMMENT 'rp is the short form of reward points',
  `shipping_details` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `shipping_status` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `delivered_to` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_charges` decimal(22,4) NOT NULL DEFAULT '0.0000',
  `additional_notes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `staff_note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `round_off_amount` decimal(22,4) NOT NULL DEFAULT '0.0000' COMMENT 'Difference of rounded total and actual total',
  `final_total` decimal(22,4) NOT NULL DEFAULT '0.0000',
  `expense_category_id` int UNSIGNED DEFAULT NULL,
  `expense_for` int UNSIGNED DEFAULT NULL,
  `commission_agent` int DEFAULT NULL,
  `document` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_direct_sale` tinyint(1) NOT NULL DEFAULT '0',
  `is_suspend` tinyint(1) NOT NULL DEFAULT '0',
  `exchange_rate` decimal(20,3) NOT NULL DEFAULT '1.000',
  `total_amount_recovered` decimal(22,4) DEFAULT NULL COMMENT 'Used for stock adjustment.',
  `transfer_parent_id` int DEFAULT NULL,
  `return_parent_id` int DEFAULT NULL,
  `opening_stock_product_id` int DEFAULT NULL,
  `created_by` int UNSIGNED NOT NULL,
  `import_batch` int DEFAULT NULL,
  `import_time` datetime DEFAULT NULL,
  `types_of_service_id` int DEFAULT NULL,
  `packing_charge` decimal(22,4) DEFAULT NULL,
  `packing_charge_type` enum('fixed','percent') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `service_custom_field_1` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `service_custom_field_2` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `service_custom_field_3` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `service_custom_field_4` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `is_created_from_api` tinyint(1) NOT NULL DEFAULT '0',
  `rp_earned` int NOT NULL DEFAULT '0' COMMENT 'rp is the short form of reward points',
  `order_addresses` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `is_recurring` tinyint(1) NOT NULL DEFAULT '0',
  `recur_interval` double(22,4) DEFAULT NULL,
  `recur_interval_type` enum('days','months','years') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `recur_repetitions` int DEFAULT NULL,
  `recur_stopped_on` datetime DEFAULT NULL,
  `recur_parent_id` int DEFAULT NULL,
  `invoice_token` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pay_term_number` int DEFAULT NULL,
  `pay_term_type` enum('days','months') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `selling_price_group_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id`, `business_id`, `location_id`, `res_table_id`, `res_waiter_id`, `res_order_status`, `type`, `sub_type`, `status`, `is_quotation`, `payment_status`, `adjustment_type`, `contact_id`, `customer_group_id`, `invoice_no`, `ref_no`, `subscription_no`, `subscription_repeat_on`, `transaction_date`, `total_before_tax`, `tax_id`, `tax_amount`, `discount_type`, `discount_amount`, `rp_redeemed`, `rp_redeemed_amount`, `shipping_details`, `shipping_address`, `shipping_status`, `delivered_to`, `shipping_charges`, `additional_notes`, `staff_note`, `round_off_amount`, `final_total`, `expense_category_id`, `expense_for`, `commission_agent`, `document`, `is_direct_sale`, `is_suspend`, `exchange_rate`, `total_amount_recovered`, `transfer_parent_id`, `return_parent_id`, `opening_stock_product_id`, `created_by`, `import_batch`, `import_time`, `types_of_service_id`, `packing_charge`, `packing_charge_type`, `service_custom_field_1`, `service_custom_field_2`, `service_custom_field_3`, `service_custom_field_4`, `is_created_from_api`, `rp_earned`, `order_addresses`, `is_recurring`, `recur_interval`, `recur_interval_type`, `recur_repetitions`, `recur_stopped_on`, `recur_parent_id`, `invoice_token`, `pay_term_number`, `pay_term_type`, `selling_price_group_id`, `created_at`, `updated_at`) VALUES
(1, 2, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 17:48:11', '10000.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '10000.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 1, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-10-13 17:48:11', '2022-10-13 17:48:11'),
(2, 2, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 18:11:29', '600.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '600.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-10-13 18:11:29', '2022-10-13 18:11:29'),
(3, 2, 1, NULL, NULL, 'cooked', 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '0001', '', NULL, NULL, '2022-10-13 19:12:55', '125.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '125.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-10-13 19:12:55', '2023-05-16 18:24:16'),
(4, 2, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 10:45:48', '2500.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '2500.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 3, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-10-22 10:45:48', '2022-10-22 10:45:48'),
(5, 2, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 10:47:27', '1000.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 4, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-10-22 10:47:27', '2022-10-22 10:47:27'),
(6, 2, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 10:55:31', '10000.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '10000.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 5, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-10-22 10:55:31', '2022-10-22 10:55:31'),
(7, 2, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 10:58:16', '1500.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '1500.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 7, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-10-22 10:58:16', '2022-10-22 10:58:16'),
(8, 2, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 11:00:46', '400.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '400.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 9, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-10-22 11:00:46', '2022-10-22 11:00:46'),
(9, 2, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 11:02:00', '2500.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '2500.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 10, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-10-22 11:02:00', '2022-10-22 11:02:00'),
(10, 2, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 11:03:41', '2500.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '2500.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 11, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-10-22 11:03:41', '2022-10-22 11:03:41'),
(11, 2, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 11:05:19', '800.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '800.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 12, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-10-22 11:05:19', '2022-10-22 11:05:19'),
(12, 2, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 11:07:09', '800.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '800.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 13, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-10-22 11:07:09', '2022-10-22 11:07:09'),
(13, 2, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 11:08:24', '1600.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '1600.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 14, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-10-22 11:08:24', '2022-10-22 11:08:24'),
(14, 2, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 11:09:53', '2500.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '2500.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 15, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-10-22 11:09:53', '2022-10-22 11:09:53'),
(15, 2, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 11:13:16', '6000.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '6000.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 16, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-10-22 11:13:16', '2022-10-22 11:13:16'),
(16, 2, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 11:14:55', '4000.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '4000.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 17, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-10-22 11:14:55', '2022-10-22 11:14:55'),
(17, 2, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 11:16:22', '4000.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '4000.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 18, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-10-22 11:16:22', '2022-10-22 11:16:22'),
(18, 2, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 11:20:11', '300.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '300.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 8, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-10-22 11:20:11', '2022-10-22 11:20:11'),
(19, 2, 1, NULL, NULL, 'cooked', 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '0002', '', NULL, NULL, '2022-10-22 11:51:16', '200.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '200.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, NULL, '2022-10-22 11:51:16', '2023-05-16 18:24:11'),
(20, 2, 1, NULL, NULL, 'cooked', 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '0003', '', NULL, NULL, '2022-10-22 11:52:45', '80.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '80.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, NULL, '2022-10-22 11:52:45', '2023-05-16 18:24:14'),
(21, 2, 1, NULL, NULL, 'cooked', 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '0004', '', NULL, NULL, '2022-10-22 11:53:16', '160.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '160.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, NULL, '2022-10-22 11:53:16', '2023-05-16 18:24:06'),
(22, 2, 1, NULL, NULL, 'cooked', 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '0005', '', NULL, NULL, '2022-10-22 11:54:09', '100.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '100.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, NULL, '2022-10-22 11:54:09', '2023-05-16 18:24:08'),
(23, 2, 1, NULL, NULL, 'cooked', 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '0006', '', NULL, NULL, '2022-10-22 11:56:44', '150.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '150.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, NULL, '2022-10-22 11:56:44', '2023-05-16 18:24:01'),
(24, 2, 1, NULL, NULL, 'cooked', 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '0007', '', NULL, NULL, '2022-10-22 12:08:06', '120.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '120.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, NULL, '2022-10-22 12:08:06', '2023-05-16 18:24:03'),
(25, 2, 1, NULL, NULL, 'cooked', 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '0008', '', NULL, NULL, '2022-10-22 12:08:46', '30.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '30.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, NULL, '2022-10-22 12:08:46', '2023-05-16 18:23:56'),
(26, 2, 1, NULL, NULL, 'cooked', 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '0009', '', NULL, NULL, '2022-10-22 12:09:27', '220.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '220.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, NULL, '2022-10-22 12:09:27', '2023-05-16 18:23:58'),
(27, 2, 1, NULL, NULL, 'cooked', 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '0010', '', NULL, NULL, '2022-10-22 12:09:56', '80.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '80.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, NULL, '2022-10-22 12:09:56', '2023-05-16 18:23:51'),
(28, 2, 1, NULL, NULL, 'cooked', 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '0011', '', NULL, NULL, '2022-10-22 12:14:55', '160.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '160.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, NULL, '2022-10-22 12:14:55', '2023-05-16 18:23:53'),
(29, 2, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 12:24:03', '2000.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '2000.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 19, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-10-22 12:24:03', '2022-10-22 12:24:03'),
(30, 2, 1, NULL, NULL, 'cooked', 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '0012', '', NULL, NULL, '2022-10-22 12:24:33', '250.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '250.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, NULL, '2022-10-22 12:24:33', '2023-05-16 18:23:45'),
(31, 2, 1, NULL, NULL, NULL, 'expense', NULL, 'final', 0, 'due', NULL, NULL, NULL, NULL, 'EP2022/0001', NULL, NULL, '2022-10-22 12:44:00', '500.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', 'Tomato sauce and Chilli sauce', NULL, '0.0000', '500.0000', 3, 5, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-10-22 12:55:00', '2022-10-22 12:55:00'),
(32, 2, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 13:12:32', '440.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '440.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 20, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-10-22 13:12:32', '2022-10-22 13:12:32'),
(33, 2, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 13:16:18', '448.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '448.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 21, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-10-22 13:16:18', '2022-10-22 13:16:18'),
(34, 2, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 13:17:59', '1100.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '1100.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 22, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-10-22 13:17:59', '2022-10-22 13:17:59'),
(35, 2, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 14:19:19', '2000.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '2000.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 23, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-10-22 14:19:19', '2022-10-22 14:19:19'),
(36, 2, 1, NULL, NULL, 'cooked', 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '0013', '', NULL, NULL, '2022-10-22 14:45:30', '160.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '160.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, NULL, '2022-10-22 14:45:30', '2023-05-16 15:58:21'),
(37, 2, 1, NULL, NULL, 'cooked', 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '0014', '', NULL, NULL, '2022-11-10 10:05:03', '210.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '210.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-11-10 10:05:03', '2023-05-16 15:58:31'),
(38, 2, 1, NULL, NULL, 'cooked', 'sell', NULL, 'final', 0, 'due', NULL, 1, NULL, '0015', '', NULL, NULL, '2023-05-16 11:17:14', '60.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', 'Kims', NULL, '0.0000', '60.0000', NULL, NULL, NULL, NULL, 0, 1, '1.000', NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2023-05-16 11:17:14', '2023-05-16 18:23:48'),
(39, 2, 1, NULL, NULL, 'cooked', 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '0016', '', NULL, NULL, '2023-05-16 15:50:15', '480.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '480.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-16 15:50:15', '2023-05-16 18:23:42'),
(40, 2, 1, 1, NULL, NULL, 'sell', NULL, 'draft', 0, NULL, NULL, 1, NULL, 'SdYcR', '', NULL, NULL, '2023-05-16 16:04:27', '30.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '30.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2023-05-16 16:04:27', '2023-05-16 16:04:27'),
(41, 2, 1, 2, NULL, 'cooked', 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '0017', '', NULL, NULL, '2023-05-16 16:08:39', '140.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '140.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-16 16:08:39', '2023-05-16 18:23:38'),
(42, 2, 1, 1, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '0018', '', NULL, NULL, '2023-05-16 16:37:47', '390.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '390.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 7, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-16 16:37:47', '2023-05-16 18:29:10'),
(43, 2, 1, 1, NULL, NULL, 'sell', NULL, 'draft', 0, NULL, NULL, 1, NULL, 'IRsDO', '', NULL, NULL, '2023-05-16 18:26:20', '240.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '240.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 7, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-16 18:26:20', '2023-05-16 18:26:20'),
(44, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 11:49:43', '7800.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '7800.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 24, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-30 11:49:43', '2023-05-30 11:49:43'),
(45, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 12:30:00', '1500.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '1500.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 25, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-30 12:30:00', '2023-05-30 12:30:00'),
(46, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 12:33:48', '1500.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '1500.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 26, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-30 12:33:48', '2023-05-30 12:33:48'),
(47, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 13:04:27', '1500.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '1500.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 27, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-30 13:04:27', '2023-05-30 13:04:27'),
(48, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 13:09:22', '7800.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '7800.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 28, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-30 13:09:22', '2023-05-30 13:09:22'),
(49, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 13:09:22', '7280.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '7280.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 29, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-30 13:09:22', '2023-05-30 13:09:22'),
(50, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 13:09:22', '750.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '750.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 30, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-30 13:09:22', '2023-05-30 13:09:22'),
(51, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 13:09:22', '600.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '600.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 31, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-30 13:09:22', '2023-05-30 13:09:22'),
(52, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 13:09:22', '400.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '400.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 32, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-30 13:09:22', '2023-05-30 13:09:22'),
(53, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 13:09:22', '300.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '300.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 33, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-30 13:09:22', '2023-05-30 13:09:22'),
(54, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 13:09:22', '400.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '400.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 34, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-30 13:09:22', '2023-05-30 13:09:22'),
(55, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 13:09:22', '900.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '900.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 35, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-30 13:09:22', '2023-05-30 13:09:22'),
(56, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 13:09:22', '600.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '600.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 36, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-30 13:09:22', '2023-05-30 13:09:22'),
(57, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 13:09:22', '300.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '300.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 37, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-30 13:09:22', '2023-05-30 13:09:22'),
(58, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 13:09:22', '200.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '200.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 38, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-30 13:09:22', '2023-05-30 13:09:22'),
(59, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 13:09:22', '300.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '300.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 39, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-30 13:09:22', '2023-05-30 13:09:22'),
(60, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 13:09:22', '500.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '500.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 40, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-30 13:09:22', '2023-05-30 13:09:22'),
(61, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 13:09:22', '400.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '400.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 41, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-30 13:09:22', '2023-05-30 13:09:22'),
(62, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 13:09:22', '400.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '400.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 42, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-30 13:09:22', '2023-05-30 13:09:22'),
(63, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 13:09:22', '600.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '600.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 43, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-30 13:09:22', '2023-05-30 13:09:22'),
(64, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 13:09:22', '300.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '300.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 44, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-30 13:09:22', '2023-05-30 13:09:22'),
(65, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 13:09:22', '300.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '300.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 45, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-30 13:09:22', '2023-05-30 13:09:22'),
(66, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 13:09:22', '450.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '450.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 46, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-30 13:09:22', '2023-05-30 13:09:22'),
(67, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 13:09:22', '150.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '150.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 47, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-30 13:09:22', '2023-05-30 13:09:22'),
(68, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 13:09:22', '300.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '300.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 48, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-30 13:09:22', '2023-05-30 13:09:22'),
(69, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 13:09:22', '450.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '450.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 49, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-30 13:09:22', '2023-05-30 13:09:22'),
(70, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 13:09:23', '150.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '150.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 50, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-30 13:09:23', '2023-05-30 13:09:23'),
(71, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 13:09:23', '750.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '750.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 51, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-30 13:09:23', '2023-05-30 13:09:23'),
(72, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 13:09:23', '600.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '600.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 52, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-30 13:09:23', '2023-05-30 13:09:23'),
(73, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 13:09:23', '150.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '150.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 53, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-30 13:09:23', '2023-05-30 13:09:23'),
(74, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 13:09:23', '150.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '150.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 54, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-30 13:09:23', '2023-05-30 13:09:23'),
(75, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 13:09:23', '600.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '600.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 55, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-30 13:09:23', '2023-05-30 13:09:23'),
(76, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 13:09:23', '450.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '450.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 56, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-30 13:09:23', '2023-05-30 13:09:23'),
(77, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 13:09:23', '150.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '150.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 57, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-30 13:09:23', '2023-05-30 13:09:23'),
(78, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 13:09:23', '150.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '150.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 58, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-30 13:09:23', '2023-05-30 13:09:23'),
(79, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 13:09:23', '750.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '750.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 59, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-30 13:09:23', '2023-05-30 13:09:23'),
(80, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 13:09:23', '150.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '150.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 60, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-30 13:09:23', '2023-05-30 13:09:23'),
(81, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 13:09:23', '900.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '900.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 61, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-30 13:09:23', '2023-05-30 13:09:23'),
(82, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 13:09:23', '750.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '750.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 62, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-30 13:09:23', '2023-05-30 13:09:23'),
(83, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 13:09:23', '600.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '600.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 63, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-30 13:09:23', '2023-05-30 13:09:23'),
(84, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 13:09:23', '150.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '150.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 64, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-30 13:09:23', '2023-05-30 13:09:23'),
(85, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 13:09:23', '450.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '450.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 65, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-30 13:09:23', '2023-05-30 13:09:23'),
(86, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 13:09:23', '750.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '750.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 66, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-30 13:09:23', '2023-05-30 13:09:23'),
(87, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 13:09:23', '300.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '300.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 67, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-30 13:09:23', '2023-05-30 13:09:23'),
(88, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 13:09:23', '450.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '450.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 68, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-30 13:09:23', '2023-05-30 13:09:23'),
(89, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 13:09:23', '150.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '150.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 69, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-30 13:09:23', '2023-05-30 13:09:23'),
(90, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 13:09:23', '750.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '750.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 70, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-30 13:09:23', '2023-05-30 13:09:23'),
(91, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 13:09:23', '150.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '150.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 71, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-30 13:09:23', '2023-05-30 13:09:23'),
(92, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 13:09:23', '150.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '150.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 72, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-30 13:09:23', '2023-05-30 13:09:23'),
(93, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 13:09:23', '600.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '600.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 73, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-30 13:09:23', '2023-05-30 13:09:23'),
(94, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 13:09:23', '300.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '300.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 74, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-30 13:09:23', '2023-05-30 13:09:23'),
(95, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 13:09:23', '450.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '450.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 75, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-30 13:09:23', '2023-05-30 13:09:23'),
(96, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 13:09:23', '450.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '450.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 76, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-30 13:09:23', '2023-05-30 13:09:23'),
(97, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 13:09:23', '450.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '450.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 77, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-30 13:09:23', '2023-05-30 13:09:23');
INSERT INTO `transactions` (`id`, `business_id`, `location_id`, `res_table_id`, `res_waiter_id`, `res_order_status`, `type`, `sub_type`, `status`, `is_quotation`, `payment_status`, `adjustment_type`, `contact_id`, `customer_group_id`, `invoice_no`, `ref_no`, `subscription_no`, `subscription_repeat_on`, `transaction_date`, `total_before_tax`, `tax_id`, `tax_amount`, `discount_type`, `discount_amount`, `rp_redeemed`, `rp_redeemed_amount`, `shipping_details`, `shipping_address`, `shipping_status`, `delivered_to`, `shipping_charges`, `additional_notes`, `staff_note`, `round_off_amount`, `final_total`, `expense_category_id`, `expense_for`, `commission_agent`, `document`, `is_direct_sale`, `is_suspend`, `exchange_rate`, `total_amount_recovered`, `transfer_parent_id`, `return_parent_id`, `opening_stock_product_id`, `created_by`, `import_batch`, `import_time`, `types_of_service_id`, `packing_charge`, `packing_charge_type`, `service_custom_field_1`, `service_custom_field_2`, `service_custom_field_3`, `service_custom_field_4`, `is_created_from_api`, `rp_earned`, `order_addresses`, `is_recurring`, `recur_interval`, `recur_interval_type`, `recur_repetitions`, `recur_stopped_on`, `recur_parent_id`, `invoice_token`, `pay_term_number`, `pay_term_type`, `selling_price_group_id`, `created_at`, `updated_at`) VALUES
(98, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 13:09:23', '150.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '150.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 78, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-30 13:09:23', '2023-05-30 13:09:23'),
(99, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 13:09:23', '300.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '300.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 79, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-30 13:09:23', '2023-05-30 13:09:23'),
(100, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 13:09:23', '450.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '450.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 80, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-30 13:09:23', '2023-05-30 13:09:23'),
(101, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 13:09:23', '450.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '450.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 81, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-30 13:09:23', '2023-05-30 13:09:23'),
(102, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 13:09:23', '450.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '450.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 82, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-30 13:09:23', '2023-05-30 13:09:23'),
(103, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 13:09:23', '200.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '200.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 83, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-30 13:09:23', '2023-05-30 13:09:23'),
(104, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 13:09:23', '200.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '200.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 84, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-30 13:09:23', '2023-05-30 13:09:23'),
(105, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 13:09:23', '200.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '200.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 85, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-30 13:09:23', '2023-05-30 13:09:23'),
(106, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 13:09:23', '100.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '100.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 86, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-30 13:09:23', '2023-05-30 13:09:23'),
(107, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 13:09:23', '500.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '500.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 87, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-30 13:09:23', '2023-05-30 13:09:23'),
(108, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 13:09:23', '200.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '200.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 88, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-30 13:09:23', '2023-05-30 13:09:23'),
(109, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 13:09:23', '600.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '600.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 89, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-30 13:09:23', '2023-05-30 13:09:23'),
(110, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 13:09:23', '300.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '300.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 90, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-30 13:09:23', '2023-05-30 13:09:23'),
(111, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 13:09:23', '200.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '200.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 91, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-30 13:09:23', '2023-05-30 13:09:23'),
(112, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 13:09:23', '200.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '200.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 92, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-30 13:09:23', '2023-05-30 13:09:23'),
(113, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 13:09:23', '300.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '300.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 93, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-30 13:09:23', '2023-05-30 13:09:23'),
(114, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 13:09:23', '200.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '200.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 94, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-30 13:09:23', '2023-05-30 13:09:23'),
(115, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 13:09:23', '100.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '100.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 95, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-30 13:09:23', '2023-05-30 13:09:23'),
(116, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 13:09:23', '300.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '300.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 96, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-30 13:09:23', '2023-05-30 13:09:23'),
(117, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 13:09:23', '300.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '300.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 97, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-30 13:09:23', '2023-05-30 13:09:23'),
(118, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 13:09:24', '400.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '400.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 98, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-30 13:09:24', '2023-05-30 13:09:24'),
(119, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 13:09:24', '300.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '300.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 99, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-30 13:09:24', '2023-05-30 13:09:24'),
(120, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 13:09:24', '300.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '300.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 100, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-30 13:09:24', '2023-05-30 13:09:24'),
(121, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 13:09:24', '500.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '500.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 101, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-30 13:09:24', '2023-05-30 13:09:24'),
(122, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 13:09:24', '400.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '400.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 102, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-30 13:09:24', '2023-05-30 13:09:24'),
(123, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 13:09:24', '400.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '400.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 103, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-30 13:09:24', '2023-05-30 13:09:24'),
(124, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 13:09:24', '100.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '100.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 104, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-30 13:09:24', '2023-05-30 13:09:24'),
(125, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 13:09:24', '100.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '100.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 105, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-30 13:09:24', '2023-05-30 13:09:24'),
(126, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 13:09:24', '200.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '200.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 106, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-30 13:09:24', '2023-05-30 13:09:24'),
(127, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 13:09:24', '200.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '200.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 107, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-30 13:09:24', '2023-05-30 13:09:24'),
(128, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 13:09:24', '200.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '200.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 108, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-30 13:09:24', '2023-05-30 13:09:24'),
(129, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 13:09:24', '200.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '200.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 109, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-30 13:09:24', '2023-05-30 13:09:24'),
(130, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 13:09:24', '2100.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '2100.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 110, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-30 13:09:24', '2023-05-30 13:09:24'),
(131, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 13:09:24', '1200.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '1200.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 111, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-30 13:09:24', '2023-05-30 13:09:24'),
(132, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 13:09:24', '4500.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '4500.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 112, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-30 13:09:24', '2023-05-30 13:09:24'),
(133, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 13:09:24', '1200.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '1200.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 113, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-30 13:09:24', '2023-05-30 13:09:24'),
(134, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 13:09:24', '1000.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 114, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-30 13:09:24', '2023-05-30 13:09:24'),
(135, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 13:09:24', '2400.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '2400.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 115, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-30 13:09:24', '2023-05-30 13:09:24'),
(136, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 13:09:24', '900.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '900.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 116, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-30 13:09:24', '2023-05-30 13:09:24'),
(137, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 13:09:24', '1000.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 117, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-30 13:09:24', '2023-05-30 13:09:24'),
(138, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 13:09:24', '9000.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '9000.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 118, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-30 13:09:24', '2023-05-30 13:09:24'),
(139, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 13:09:24', '9000.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '9000.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 119, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-30 13:09:24', '2023-05-30 13:09:24'),
(140, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 11:28:41', '7800.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '7800.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 194, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-31 11:28:41', '2023-06-08 14:13:14'),
(141, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 11:28:41', '7280.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '7280.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 195, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(142, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 11:28:41', '750.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '750.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 196, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(143, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 11:28:41', '600.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '600.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 197, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(144, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 11:28:41', '400.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '400.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 198, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(145, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 11:28:41', '300.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '300.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 199, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(146, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 11:28:41', '400.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '400.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 200, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(147, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 11:28:41', '900.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '900.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 201, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(148, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 11:28:41', '600.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '600.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 202, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(149, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 11:28:41', '300.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '300.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 203, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(150, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 11:28:41', '200.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '200.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 204, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(151, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 11:28:41', '300.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '300.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 205, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(152, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 11:28:41', '500.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '500.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 206, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(153, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 11:28:41', '400.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '400.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 207, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(154, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 11:28:41', '400.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '400.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 208, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(155, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 11:28:41', '600.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '600.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 209, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(156, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 11:28:41', '300.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '300.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 210, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(157, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 11:28:41', '300.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '300.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 211, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(158, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 11:28:41', '450.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '450.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 212, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(159, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 11:28:41', '150.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '150.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 213, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(160, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 11:28:41', '300.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '300.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 214, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(161, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 11:28:41', '450.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '450.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 215, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(162, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 11:28:41', '150.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '150.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 216, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(163, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 11:28:41', '750.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '750.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 217, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(164, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 11:28:41', '600.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '600.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 218, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(165, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 11:28:41', '150.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '150.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 219, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(166, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 11:28:41', '150.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '150.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 220, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(167, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 11:28:41', '600.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '600.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 221, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(168, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 11:28:41', '450.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '450.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 222, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(169, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 11:28:41', '150.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '150.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 223, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(170, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 11:28:41', '150.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '150.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 224, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(171, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 11:28:41', '750.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '750.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 225, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(172, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 11:28:41', '150.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '150.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 226, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(173, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 11:28:41', '900.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '900.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 227, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(174, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 11:28:41', '750.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '750.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 228, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(175, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 11:28:41', '600.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '600.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 229, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(176, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 11:28:41', '150.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '150.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 230, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(177, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 11:28:41', '450.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '450.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 231, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(178, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 11:28:41', '750.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '750.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 232, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(179, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 11:28:41', '300.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '300.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 233, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(180, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 11:28:41', '450.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '450.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 234, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(181, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 11:28:41', '150.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '150.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 235, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(182, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 11:28:41', '750.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '750.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 236, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(183, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 11:28:41', '150.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '150.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 237, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(184, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 11:28:41', '150.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '150.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 238, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(185, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 11:28:41', '600.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '600.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 239, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(186, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 11:28:41', '300.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '300.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 240, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(187, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 11:28:41', '450.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '450.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 241, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(188, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 11:28:41', '450.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '450.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 242, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(189, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 11:28:41', '450.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '450.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 243, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(190, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 11:28:41', '150.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '150.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 244, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(191, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 11:28:41', '300.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '300.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 245, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(192, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 11:28:41', '450.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '450.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 246, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(193, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 11:28:41', '450.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '450.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 247, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(194, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 11:28:41', '450.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '450.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 248, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-31 11:28:41', '2023-05-31 11:28:41');
INSERT INTO `transactions` (`id`, `business_id`, `location_id`, `res_table_id`, `res_waiter_id`, `res_order_status`, `type`, `sub_type`, `status`, `is_quotation`, `payment_status`, `adjustment_type`, `contact_id`, `customer_group_id`, `invoice_no`, `ref_no`, `subscription_no`, `subscription_repeat_on`, `transaction_date`, `total_before_tax`, `tax_id`, `tax_amount`, `discount_type`, `discount_amount`, `rp_redeemed`, `rp_redeemed_amount`, `shipping_details`, `shipping_address`, `shipping_status`, `delivered_to`, `shipping_charges`, `additional_notes`, `staff_note`, `round_off_amount`, `final_total`, `expense_category_id`, `expense_for`, `commission_agent`, `document`, `is_direct_sale`, `is_suspend`, `exchange_rate`, `total_amount_recovered`, `transfer_parent_id`, `return_parent_id`, `opening_stock_product_id`, `created_by`, `import_batch`, `import_time`, `types_of_service_id`, `packing_charge`, `packing_charge_type`, `service_custom_field_1`, `service_custom_field_2`, `service_custom_field_3`, `service_custom_field_4`, `is_created_from_api`, `rp_earned`, `order_addresses`, `is_recurring`, `recur_interval`, `recur_interval_type`, `recur_repetitions`, `recur_stopped_on`, `recur_parent_id`, `invoice_token`, `pay_term_number`, `pay_term_type`, `selling_price_group_id`, `created_at`, `updated_at`) VALUES
(195, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 11:28:42', '200.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '200.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 249, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(196, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 11:28:42', '200.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '200.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 250, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(197, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 11:28:42', '200.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '200.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 251, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(198, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 11:28:42', '100.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '100.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 252, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(199, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 11:28:42', '500.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '500.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 253, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(200, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 11:28:42', '200.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '200.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 254, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(201, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 11:28:42', '600.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '600.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 255, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(202, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 11:28:42', '300.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '300.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 256, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(203, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 11:28:42', '200.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '200.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 257, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(204, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 11:28:42', '200.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '200.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 258, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(205, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 11:28:42', '300.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '300.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 259, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(206, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 11:28:42', '200.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '200.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 260, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(207, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 11:28:42', '100.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '100.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 261, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(208, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 11:28:42', '300.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '300.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 262, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(209, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 11:28:42', '300.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '300.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 263, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(210, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 11:28:42', '400.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '400.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 264, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(211, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 11:28:42', '300.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '300.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 265, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(212, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 11:28:42', '300.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '300.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 266, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(213, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 11:28:42', '500.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '500.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 267, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(214, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 11:28:42', '400.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '400.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 268, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(215, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 11:28:42', '400.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '400.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 269, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(216, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 11:28:42', '100.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '100.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 270, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(217, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 11:28:42', '100.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '100.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 271, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(218, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 11:28:42', '200.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '200.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 272, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(219, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 11:28:42', '200.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '200.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 273, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(220, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 11:28:42', '200.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '200.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 274, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(221, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 11:28:42', '200.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '200.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 275, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(222, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 11:28:42', '2100.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '2100.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 276, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(223, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 11:28:42', '1200.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '1200.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 277, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(224, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 11:28:42', '4500.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '4500.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 278, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(225, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 11:28:42', '1200.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '1200.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 279, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(226, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 11:28:42', '1000.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 280, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(227, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 11:28:42', '2400.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '2400.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 281, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(228, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 11:28:42', '900.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '900.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 282, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(229, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 11:28:42', '1000.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 283, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(230, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 11:28:42', '9000.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '9000.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 284, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(231, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 11:28:42', '9360.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '9360.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 285, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-31 11:28:42', '2023-06-08 14:13:56'),
(232, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 11:28:42', '900.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '900.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 286, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(233, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 11:28:42', '900.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '900.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 287, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(234, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 11:28:42', '720.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '720.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 288, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(235, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 11:28:42', '700.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '700.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 289, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(236, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 11:28:42', '800.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '800.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 290, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(237, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 11:28:42', '150.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '150.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 291, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(238, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 11:28:42', '1000.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 292, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(239, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 11:28:42', '700.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '700.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 293, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-31 11:28:42', '2023-06-08 14:27:31'),
(240, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 11:28:42', '500.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '500.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 294, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(241, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 11:28:42', '500.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '500.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 295, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-31 11:28:42', '2023-06-08 14:28:48'),
(242, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 11:28:42', '3000.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '3000.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 296, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(243, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 11:28:42', '800.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '800.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 297, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(244, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 11:28:42', '400.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '400.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 298, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(245, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 11:28:42', '400.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '400.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 299, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(246, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 11:28:42', '500.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '500.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 300, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(247, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 11:28:42', '500.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '500.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 301, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(248, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 11:28:42', '150.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '150.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 302, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(249, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 11:28:42', '150.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '150.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 303, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(250, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 11:28:42', '340.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '340.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 304, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(251, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 11:28:42', '1300.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '1300.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 306, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(252, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 11:28:42', '1300.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '1300.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 307, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(253, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 11:28:42', '1300.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '1300.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 308, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(254, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 11:28:42', '1000.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 309, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(255, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 11:28:42', '1000.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 310, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(256, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 11:28:42', '3600.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '3600.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 311, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(257, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 11:28:42', '1500.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '1500.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 312, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(258, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 11:28:42', '1200.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '1200.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 313, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(259, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 11:28:42', '800.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '800.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 314, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(260, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 11:28:42', '800.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '800.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 315, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(261, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 11:28:43', '800.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '800.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 316, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-31 11:28:43', '2023-05-31 11:28:43'),
(262, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 11:28:43', '1000.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 317, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-31 11:28:43', '2023-05-31 11:28:43'),
(263, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 11:28:43', '1400.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '1400.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 318, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-31 11:28:43', '2023-05-31 11:28:43'),
(264, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 11:28:43', '2000.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '2000.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 319, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-31 11:28:43', '2023-05-31 11:28:43'),
(265, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 11:28:43', '1500.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '1500.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 320, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-31 11:28:43', '2023-05-31 11:28:43'),
(266, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 11:28:43', '3400.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '3400.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 321, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-31 11:28:43', '2023-06-05 17:06:53'),
(267, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 11:28:43', '1800.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '1800.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 322, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-31 11:28:43', '2023-05-31 11:28:43'),
(268, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 11:28:43', '800.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '800.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 323, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-31 11:28:43', '2023-05-31 11:28:43'),
(269, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 11:28:43', '2600.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '2600.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 324, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-31 11:28:43', '2023-05-31 11:28:43'),
(270, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 11:28:43', '900.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '900.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 325, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-31 11:28:43', '2023-05-31 11:28:43'),
(271, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 11:28:43', '900.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '900.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 326, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-31 11:28:43', '2023-05-31 11:28:43'),
(272, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 11:28:43', '700.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '700.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 327, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-31 11:28:43', '2023-05-31 11:28:43'),
(273, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 11:28:43', '450.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '450.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 328, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-31 11:28:43', '2023-06-08 14:16:59'),
(274, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 11:28:43', '2000.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '2000.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 329, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-31 11:28:43', '2023-05-31 11:28:43'),
(275, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 11:28:43', '2500.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '2500.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 330, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-31 11:28:43', '2023-05-31 11:28:43'),
(276, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 11:28:43', '3000.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '3000.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 331, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-31 11:28:43', '2023-05-31 11:28:43'),
(277, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 11:28:43', '2000.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '2000.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 332, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-31 11:28:43', '2023-05-31 11:28:43'),
(278, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 11:28:43', '1600.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '1600.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 333, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-31 11:28:43', '2023-05-31 11:28:43'),
(279, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 11:28:43', '2600.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '2600.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 334, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-31 11:28:43', '2023-05-31 11:28:43'),
(280, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 11:28:43', '5000.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '5000.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 335, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-31 11:28:43', '2023-05-31 11:28:43'),
(281, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 11:28:43', '600.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '600.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 336, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-31 11:28:43', '2023-05-31 11:28:43'),
(282, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 11:28:43', '1500.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '1500.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 337, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-31 11:28:43', '2023-05-31 11:28:43'),
(283, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 11:28:43', '8000.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '8000.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 338, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-31 11:28:43', '2023-05-31 11:28:43'),
(284, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 11:28:43', '9000.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '9000.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 339, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-31 11:28:43', '2023-05-31 11:28:43'),
(285, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 11:28:43', '900.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '900.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 340, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-31 11:28:43', '2023-05-31 11:28:43'),
(286, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 11:28:43', '1000.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 341, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-31 11:28:43', '2023-05-31 11:28:43'),
(287, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 11:28:43', '2400.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '2400.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 342, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-31 11:28:43', '2023-05-31 11:28:43'),
(288, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 11:28:43', '1200.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '1200.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 343, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-31 11:28:43', '2023-05-31 11:28:43'),
(289, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 11:28:43', '1200.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '1200.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 344, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-31 11:28:43', '2023-05-31 11:28:43'),
(290, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 11:28:43', '550.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '550.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 345, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-31 11:28:43', '2023-05-31 11:28:43'),
(291, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 11:28:43', '21000.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '21000.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 346, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-31 11:28:43', '2023-05-31 11:28:43');
INSERT INTO `transactions` (`id`, `business_id`, `location_id`, `res_table_id`, `res_waiter_id`, `res_order_status`, `type`, `sub_type`, `status`, `is_quotation`, `payment_status`, `adjustment_type`, `contact_id`, `customer_group_id`, `invoice_no`, `ref_no`, `subscription_no`, `subscription_repeat_on`, `transaction_date`, `total_before_tax`, `tax_id`, `tax_amount`, `discount_type`, `discount_amount`, `rp_redeemed`, `rp_redeemed_amount`, `shipping_details`, `shipping_address`, `shipping_status`, `delivered_to`, `shipping_charges`, `additional_notes`, `staff_note`, `round_off_amount`, `final_total`, `expense_category_id`, `expense_for`, `commission_agent`, `document`, `is_direct_sale`, `is_suspend`, `exchange_rate`, `total_amount_recovered`, `transfer_parent_id`, `return_parent_id`, `opening_stock_product_id`, `created_by`, `import_batch`, `import_time`, `types_of_service_id`, `packing_charge`, `packing_charge_type`, `service_custom_field_1`, `service_custom_field_2`, `service_custom_field_3`, `service_custom_field_4`, `is_created_from_api`, `rp_earned`, `order_addresses`, `is_recurring`, `recur_interval`, `recur_interval_type`, `recur_repetitions`, `recur_stopped_on`, `recur_parent_id`, `invoice_token`, `pay_term_number`, `pay_term_type`, `selling_price_group_id`, `created_at`, `updated_at`) VALUES
(292, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 11:28:43', '26100.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '26100.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 347, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-31 11:28:43', '2023-05-31 11:28:43'),
(293, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 11:28:43', '29700.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '29700.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 348, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-31 11:28:43', '2023-06-08 13:45:27'),
(294, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 11:28:43', '30600.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '30600.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 349, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-31 11:28:43', '2023-05-31 11:28:43'),
(295, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 11:28:43', '30000.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '30000.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 350, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-31 11:28:43', '2023-05-31 11:28:43'),
(296, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 11:28:43', '20700.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '20700.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 351, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-31 11:28:43', '2023-06-05 12:14:29'),
(297, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 11:28:43', '28500.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '28500.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 352, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-31 11:28:43', '2023-05-31 11:28:43'),
(298, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 11:28:43', '21600.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '21600.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 353, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-31 11:28:43', '2023-05-31 11:28:43'),
(299, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 11:28:43', '22400.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '22400.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 354, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-31 11:28:43', '2023-05-31 11:28:43'),
(300, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 11:28:43', '800.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '800.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 355, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-31 11:28:43', '2023-05-31 11:28:43'),
(301, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 11:28:43', '300.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '300.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 356, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-31 11:28:43', '2023-05-31 11:28:43'),
(302, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 11:28:43', '900.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '900.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 357, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-31 11:28:43', '2023-05-31 11:28:43'),
(303, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 11:28:43', '2000.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '2000.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 358, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-31 11:28:43', '2023-05-31 11:28:43'),
(304, 3, 2, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 2, NULL, '0001', '', NULL, NULL, '2023-05-31 12:04:13', '200.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '200.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 9, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-31 12:04:13', '2023-05-31 12:04:13'),
(305, 3, 2, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 2, NULL, '0002', '', NULL, NULL, '2023-05-31 13:49:40', '200.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '200.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 9, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-31 13:49:40', '2023-05-31 13:49:40'),
(306, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 14:23:19', '900.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '900.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 359, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-31 14:23:19', '2023-05-31 14:23:19'),
(307, 3, 2, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 2, NULL, '0003', '', NULL, NULL, '2023-05-31 14:25:05', '350.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '350.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 9, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-31 14:25:05', '2023-05-31 14:25:05'),
(308, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 14:42:33', '3900.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '3900.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 360, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-31 14:42:33', '2023-06-08 14:08:31'),
(309, 3, 2, NULL, NULL, NULL, 'sell', NULL, 'draft', 0, NULL, NULL, 2, NULL, 'HTS0e', '', NULL, NULL, '2023-05-31 14:52:15', '600.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '600.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 9, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2023-05-31 14:52:15', '2023-05-31 14:52:15'),
(310, 3, 2, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 2, NULL, '0004', '', NULL, NULL, '2023-05-31 18:26:09', '300.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '300.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 9, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2023-05-31 18:26:09', '2023-05-31 18:26:09'),
(311, 3, 2, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 2, NULL, '0005', '', NULL, NULL, '2023-05-31 19:24:59', '500.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '500.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 9, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2023-05-31 19:24:59', '2023-05-31 19:24:59'),
(312, 3, 2, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 5, NULL, '0006', '', NULL, NULL, '2023-05-27 12:15:00', '4500.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '4500.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 9, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2023-06-01 12:20:14', '2023-06-01 12:20:14'),
(313, 3, 2, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 2, NULL, '0007', '', NULL, NULL, '2023-06-01 12:15:00', '200.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '200.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 9, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2023-06-01 14:10:29', '2023-06-01 14:10:29'),
(314, 3, 2, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 2, NULL, '0008', '', NULL, NULL, '2023-06-01 18:21:00', '3500.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '3500.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 9, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2023-06-01 18:24:34', '2023-06-01 18:24:34'),
(315, 3, 2, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 2, NULL, '0009', '', NULL, NULL, '2023-06-02 18:43:00', '1100.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '1100.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 9, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2023-06-02 18:46:44', '2023-06-02 18:46:44'),
(316, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 11:20:15', '300.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '300.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 361, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-06-03 11:20:15', '2023-06-10 13:05:38'),
(317, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 11:20:15', '300.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '300.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 362, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-06-03 11:20:15', '2023-06-10 13:07:00'),
(318, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 11:20:15', '150.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '150.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 363, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-06-03 11:20:15', '2023-06-10 13:07:54'),
(319, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 11:20:15', '450.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '450.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 364, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-06-03 11:20:15', '2023-06-03 11:20:15'),
(320, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 11:20:15', '600.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '600.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 365, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-06-03 11:20:15', '2023-06-03 11:20:15'),
(321, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 11:20:15', '300.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '300.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 366, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-06-03 11:20:15', '2023-06-03 11:20:15'),
(322, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 11:20:15', '300.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '300.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 367, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-06-03 11:20:15', '2023-06-03 11:20:15'),
(323, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 11:20:15', '450.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '450.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 368, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-06-03 11:20:15', '2023-06-03 11:20:15'),
(324, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 11:20:15', '450.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '450.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 369, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-06-03 11:20:15', '2023-06-03 11:20:15'),
(325, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 11:20:15', '150.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '150.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 370, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-06-03 11:20:15', '2023-06-03 11:20:15'),
(326, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 11:20:15', '150.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '150.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 371, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-06-03 11:20:15', '2023-06-03 11:20:15'),
(327, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 11:20:15', '200.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '200.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 372, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-06-03 11:20:15', '2023-06-03 11:20:15'),
(328, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 11:20:15', '400.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '400.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 373, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-06-03 11:20:15', '2023-06-03 11:20:15'),
(329, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 11:20:16', '800.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '800.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 374, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(330, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 11:20:16', '400.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '400.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 375, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(331, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 11:20:16', '800.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '800.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 376, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(332, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 11:20:16', '400.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '400.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 377, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(333, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 11:20:16', '400.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '400.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 378, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(334, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 11:20:16', '600.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '600.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 379, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(335, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 11:20:16', '200.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '200.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 380, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(336, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 11:20:16', '400.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '400.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 381, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(337, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 11:20:16', '600.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '600.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 382, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(338, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 11:20:16', '200.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '200.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 383, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(339, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 11:20:16', '1000.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 384, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(340, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 11:20:16', '800.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '800.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 385, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(341, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 11:20:16', '200.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '200.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 386, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(342, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 11:20:16', '200.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '200.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 387, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(343, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 11:20:16', '800.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '800.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 388, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(344, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 11:20:16', '600.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '600.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 389, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(345, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 11:20:16', '200.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '200.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 390, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(346, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 11:20:16', '200.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '200.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 391, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(347, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 11:20:16', '1000.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 392, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(348, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 11:20:16', '200.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '200.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 393, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(349, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 11:20:16', '1200.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '1200.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 394, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(350, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 11:20:16', '1250.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '1250.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 395, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(351, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 11:20:16', '1000.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 396, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(352, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 11:20:16', '250.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '250.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 397, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(353, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 11:20:16', '750.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '750.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 398, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(354, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 11:20:16', '1250.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '1250.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 399, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(355, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 11:20:16', '500.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '500.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 400, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(356, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 11:20:16', '750.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '750.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 401, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(357, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 11:20:16', '250.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '250.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 402, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(358, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 11:20:16', '1250.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '1250.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 403, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(359, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 11:20:16', '200.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '200.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 404, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(360, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 11:20:16', '200.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '200.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 405, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(361, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 11:20:16', '800.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '800.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 406, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(362, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 11:20:16', '400.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '400.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 407, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(363, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 11:20:16', '600.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '600.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 408, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(364, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 11:20:16', '600.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '600.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 409, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(365, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 11:20:16', '600.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '600.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 410, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(366, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 11:20:16', '200.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '200.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 411, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(367, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 11:20:16', '400.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '400.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 412, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(368, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 11:20:16', '600.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '600.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 413, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(369, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 11:20:16', '600.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '600.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 414, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(370, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 11:20:16', '180.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '180.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 415, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(371, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 11:20:16', '120.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '120.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 416, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(372, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 11:20:16', '120.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '120.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 417, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(373, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 11:20:16', '120.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '120.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 418, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(374, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 11:20:16', '60.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '60.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 419, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(375, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 11:20:16', '300.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '300.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 420, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(376, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 11:20:16', '120.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '120.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 421, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(377, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 11:20:16', '360.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '360.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 422, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(378, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 11:20:16', '180.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '180.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 423, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(379, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 11:20:16', '120.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '120.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 424, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(380, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 11:20:16', '120.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '120.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 425, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(381, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 11:20:16', '180.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '180.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 426, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(382, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 11:20:16', '120.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '120.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 427, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(383, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 11:20:16', '60.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '60.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 428, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(384, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 11:20:16', '180.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '180.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 429, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(385, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 11:20:16', '180.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '180.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 430, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(386, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 11:20:16', '240.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '240.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 431, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(387, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 11:20:16', '180.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '180.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 432, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(388, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 11:20:16', '180.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '180.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 433, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-06-03 11:20:16', '2023-06-03 11:20:16');
INSERT INTO `transactions` (`id`, `business_id`, `location_id`, `res_table_id`, `res_waiter_id`, `res_order_status`, `type`, `sub_type`, `status`, `is_quotation`, `payment_status`, `adjustment_type`, `contact_id`, `customer_group_id`, `invoice_no`, `ref_no`, `subscription_no`, `subscription_repeat_on`, `transaction_date`, `total_before_tax`, `tax_id`, `tax_amount`, `discount_type`, `discount_amount`, `rp_redeemed`, `rp_redeemed_amount`, `shipping_details`, `shipping_address`, `shipping_status`, `delivered_to`, `shipping_charges`, `additional_notes`, `staff_note`, `round_off_amount`, `final_total`, `expense_category_id`, `expense_for`, `commission_agent`, `document`, `is_direct_sale`, `is_suspend`, `exchange_rate`, `total_amount_recovered`, `transfer_parent_id`, `return_parent_id`, `opening_stock_product_id`, `created_by`, `import_batch`, `import_time`, `types_of_service_id`, `packing_charge`, `packing_charge_type`, `service_custom_field_1`, `service_custom_field_2`, `service_custom_field_3`, `service_custom_field_4`, `is_created_from_api`, `rp_earned`, `order_addresses`, `is_recurring`, `recur_interval`, `recur_interval_type`, `recur_repetitions`, `recur_stopped_on`, `recur_parent_id`, `invoice_token`, `pay_term_number`, `pay_term_type`, `selling_price_group_id`, `created_at`, `updated_at`) VALUES
(389, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 11:20:16', '300.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '300.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 434, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(390, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 11:20:16', '2000.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '2000.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 435, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(391, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 11:20:16', '2000.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '2000.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 436, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(392, 3, 2, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 6, NULL, '0010', '', NULL, NULL, '2023-06-01 11:51:00', '6000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '6000.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 9, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2023-06-03 11:53:42', '2023-06-03 15:21:13'),
(393, 3, 2, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'due', NULL, 7, NULL, '0011', '', NULL, NULL, '2023-06-03 11:56:00', '250.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '250.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 9, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2023-06-03 11:58:38', '2023-06-03 11:58:39'),
(394, 3, 2, NULL, NULL, NULL, 'purchase', NULL, 'ordered', 0, 'paid', NULL, 9, NULL, NULL, 'PO2023/0001', NULL, NULL, '2023-06-03 12:59:00', '80000.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '80000.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-06-03 13:05:17', '2023-06-03 13:07:11'),
(396, 3, 2, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 3, NULL, '0013', '', NULL, NULL, '2023-06-03 15:12:00', '4000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '4000.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 9, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2023-06-03 15:13:46', '2023-06-03 15:13:46'),
(397, 3, 2, NULL, NULL, NULL, 'expense', NULL, 'final', 0, 'paid', NULL, NULL, NULL, NULL, 'ACCRA TRADING CENTRE LTD', NULL, NULL, '2023-06-03 15:55:00', '70000.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', 'Rent for June 2023', NULL, '0.0000', '70000.0000', 6, 8, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-06-03 15:57:49', '2023-06-03 15:57:49'),
(398, 3, 2, NULL, NULL, NULL, 'purchase', NULL, 'received', 0, 'paid', NULL, 4, NULL, NULL, 'PO2023/0002', NULL, NULL, '2023-06-03 17:02:00', '800.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '800.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-06-03 17:04:57', '2023-06-03 17:04:57'),
(399, 3, 2, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 2, NULL, '0014', '', NULL, NULL, '2023-06-03 17:08:00', '300.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '300.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 9, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2023-06-03 17:09:08', '2023-06-03 17:09:08'),
(400, 3, 2, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 2, NULL, '0015', '', NULL, NULL, '2023-06-05 15:00:00', '1300.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '1300.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 9, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2023-06-05 15:02:11', '2023-06-05 15:02:11'),
(401, 3, 2, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'due', NULL, 2, NULL, '0016', '', NULL, NULL, '2023-06-06 21:58:00', '6300.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '6300.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 9, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2023-06-06 22:04:58', '2023-06-06 22:04:58'),
(402, 3, 2, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'due', NULL, 2, NULL, '0017', '', NULL, NULL, '2023-06-06 21:58:00', '6500.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '6500.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 9, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2023-06-06 22:12:42', '2023-06-06 22:12:42'),
(403, 3, 2, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'due', NULL, 2, NULL, '0018', '', NULL, NULL, '2023-06-07 14:49:00', '5500.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '5500.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 9, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2023-06-07 14:49:31', '2023-06-07 14:49:31'),
(404, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 09:39:53', '7250.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '7250.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 437, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-06-08 09:39:53', '2023-06-08 09:58:08'),
(405, 3, 2, NULL, NULL, NULL, 'sell_return', NULL, 'final', 0, 'due', NULL, 2, NULL, 'CN2023/0001', NULL, NULL, NULL, '2023-06-07 00:00:00', '5500.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '5500.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, 403, NULL, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-06-08 09:46:28', '2023-06-08 09:46:28'),
(406, 3, 2, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'due', NULL, 2, NULL, '0019', '', NULL, NULL, '2023-06-06 09:49:00', '5800.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '5800.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 9, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2023-06-08 09:51:36', '2023-06-08 09:51:36'),
(407, 3, 2, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 2, NULL, '0020', '', NULL, NULL, '2023-06-08 09:58:00', '250.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '250.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 9, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2023-06-08 09:58:56', '2023-06-08 09:58:56'),
(408, 3, 2, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 2, NULL, '0021', '', NULL, NULL, '2023-06-08 13:06:00', '600.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '600.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 9, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2023-06-08 13:09:58', '2023-06-08 13:09:58'),
(409, 3, 2, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 2, NULL, '0022', '', NULL, NULL, '2023-06-08 18:04:00', '500.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '500.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 9, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2023-06-08 18:14:30', '2023-06-08 18:14:30'),
(410, 3, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 18:36:49', '500.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '500.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 438, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-06-08 18:36:49', '2023-06-08 18:36:49'),
(411, 3, 2, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 2, NULL, '0023', '', NULL, NULL, '2023-06-08 18:43:00', '150.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '150.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 9, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2023-06-08 18:45:53', '2023-06-08 18:45:53'),
(412, 3, 2, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 2, NULL, '0024', '', NULL, NULL, '2023-06-09 17:51:00', '5500.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '5500.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 9, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2023-06-09 17:52:03', '2023-06-09 17:52:03'),
(413, 3, 2, NULL, NULL, NULL, 'purchase', NULL, 'received', 0, 'paid', NULL, 4, NULL, NULL, 'PO2023/0003', NULL, NULL, '2023-06-10 13:01:00', '1600.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '1600.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-06-10 13:03:26', '2023-06-10 13:03:26'),
(414, 3, 2, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 2, NULL, '0025', '', NULL, NULL, '2023-06-12 14:39:00', '1100.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '1100.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 9, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2023-06-12 14:40:11', '2023-06-12 14:40:11'),
(415, 3, 2, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 2, NULL, '0026', '', NULL, NULL, '2023-06-12 17:09:00', '300.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '300.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 9, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2023-06-12 17:10:26', '2023-06-12 17:10:26'),
(416, 3, 2, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 2, NULL, '0027', '', NULL, NULL, '2023-06-13 11:42:00', '6500.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '6500.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 9, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2023-06-13 11:42:43', '2023-06-13 11:42:43'),
(417, 4, 3, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 12:10:29', '26600.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '26600.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 439, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-06-13 12:10:29', '2023-06-13 12:10:29'),
(418, 4, 3, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 12:10:29', '695600.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '695600.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 440, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-06-13 12:10:29', '2023-06-13 12:10:29'),
(419, 4, 3, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 12:10:29', '397800.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '397800.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 441, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-06-13 12:10:29', '2023-06-13 12:10:29'),
(420, 4, 3, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 12:10:29', '1000.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 442, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-06-13 12:10:29', '2023-06-13 12:10:29'),
(421, 4, 3, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 12:10:29', '18000.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '18000.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 443, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-06-13 12:10:29', '2023-06-13 12:10:29'),
(422, 4, 3, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 12:10:29', '36800.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '36800.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 444, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-06-13 12:10:29', '2023-06-13 12:10:29'),
(423, 4, 3, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 12:10:29', '15200.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '15200.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 445, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-06-13 12:10:29', '2023-06-13 12:10:29'),
(424, 4, 3, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 12:10:29', '117600.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '117600.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 446, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-06-13 12:10:29', '2023-06-13 12:10:29'),
(425, 4, 3, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 12:10:29', '19400.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '19400.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 447, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-06-13 12:10:29', '2023-06-13 12:10:29'),
(426, 4, 3, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 12:10:29', '10000.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '10000.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 448, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-06-13 12:10:29', '2023-06-13 12:10:29'),
(427, 4, 3, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 12:10:29', '38600.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '38600.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 449, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-06-13 12:10:29', '2023-06-13 12:10:29'),
(428, 4, 3, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 12:10:29', '38400.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '38400.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 450, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-06-13 12:10:29', '2023-06-13 12:10:29'),
(429, 4, 3, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 12:10:29', '32400.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '32400.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 451, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-06-13 12:10:29', '2023-06-13 12:10:29'),
(430, 4, 3, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 12:10:29', '97200.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '97200.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 452, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-06-13 12:10:29', '2023-06-13 12:10:29'),
(431, 4, 3, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 12:10:29', '153400.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '153400.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 453, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-06-13 12:10:29', '2023-06-13 12:10:29'),
(432, 4, 3, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 12:10:29', '9000.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '9000.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 454, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-06-13 12:10:29', '2023-06-13 12:10:29'),
(433, 4, 3, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 12:10:29', '126800.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '126800.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 455, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-06-13 12:10:29', '2023-06-13 12:10:29'),
(434, 4, 3, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 12:10:29', '61400.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '61400.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 456, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-06-13 12:10:29', '2023-06-13 12:10:29'),
(435, 4, 3, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 12:10:29', '2000.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '2000.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 457, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-06-13 12:10:29', '2023-06-13 12:10:29'),
(436, 4, 3, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 12:10:29', '2000.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '2000.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 458, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-06-13 12:10:29', '2023-06-13 12:10:29'),
(437, 4, 3, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 12:10:29', '2000.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '2000.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 459, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-06-13 12:10:29', '2023-06-13 12:10:29'),
(438, 4, 3, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 12:10:29', '7000.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '7000.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 460, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-06-13 12:10:29', '2023-06-13 12:10:29'),
(439, 4, 3, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 12:10:29', '3400.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '3400.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 461, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-06-13 12:10:29', '2023-06-13 12:10:29'),
(440, 4, 3, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 12:10:29', '4000.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '4000.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 462, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-06-13 12:10:29', '2023-06-13 12:10:29'),
(441, 4, 3, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 12:10:29', '58200.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '58200.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 463, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-06-13 12:10:29', '2023-06-13 12:10:29'),
(442, 4, 3, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 12:10:29', '4000.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '4000.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 464, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-06-13 12:10:29', '2023-06-13 12:10:29'),
(443, 4, 3, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 12:10:29', '4000.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '4000.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 465, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-06-13 12:10:29', '2023-06-13 12:10:29'),
(444, 4, 3, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 12:10:29', '13200.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '13200.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 466, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-06-13 12:10:29', '2023-06-13 12:10:29'),
(445, 4, 3, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 12:10:29', '4000.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '4000.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 467, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-06-13 12:10:29', '2023-06-13 12:10:29'),
(446, 4, 3, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 12:10:29', '4000.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '4000.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 468, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-06-13 12:10:29', '2023-06-13 12:10:29'),
(447, 4, 3, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 12:10:29', '4000.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '4000.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 469, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-06-13 12:10:29', '2023-06-13 12:10:29'),
(448, 4, 3, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 12:10:29', '143600.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '143600.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 470, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-06-13 12:10:29', '2023-06-13 12:10:29'),
(449, 4, 3, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 10, NULL, '0001', '', NULL, NULL, '2023-06-13 12:58:08', '800.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '800.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 10, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2023-06-13 12:58:08', '2023-06-13 12:58:08'),
(450, 3, 2, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 2, NULL, '0028', '', NULL, NULL, '2023-06-13 18:08:00', '200.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '200.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 9, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2023-06-13 18:09:24', '2023-06-13 18:09:24'),
(451, 3, 2, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 2, NULL, '0029', '', NULL, NULL, '2023-06-13 18:12:00', '5000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '5000.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 9, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2023-06-13 18:13:23', '2023-06-13 18:13:23'),
(452, 4, 3, NULL, NULL, NULL, 'sell_transfer', NULL, 'final', 0, 'paid', NULL, NULL, NULL, NULL, 'ST2023/0001', NULL, NULL, '2023-06-14 08:36:00', '1000.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-06-14 08:36:48', '2023-06-14 08:36:48'),
(453, 4, 4, NULL, NULL, NULL, 'purchase_transfer', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, 'ST2023/0001', NULL, NULL, '2023-06-14 08:36:00', '1000.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, 452, NULL, NULL, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-06-14 08:36:48', '2023-06-14 08:36:48'),
(454, 4, 3, NULL, NULL, NULL, 'sell_transfer', NULL, 'final', 0, 'paid', NULL, NULL, NULL, NULL, 'ST2023/0002', NULL, NULL, '2023-06-14 08:43:00', '2000.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '2000.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-06-14 08:43:50', '2023-06-14 08:43:50'),
(455, 4, 4, NULL, NULL, NULL, 'purchase_transfer', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, 'ST2023/0002', NULL, NULL, '2023-06-14 08:43:00', '2000.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '2000.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, 454, NULL, NULL, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-06-14 08:43:50', '2023-06-14 08:43:50'),
(456, 3, 2, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 2, NULL, '0030', '', NULL, NULL, '2023-06-14 11:58:00', '6500.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '6500.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 9, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2023-06-14 12:00:40', '2023-06-14 12:00:40'),
(457, 3, 2, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 2, NULL, '0031', '', NULL, NULL, '2023-06-15 12:10:00', '1200.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '1200.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 9, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2023-06-15 12:10:40', '2023-06-15 12:10:40'),
(458, 3, 2, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 2, NULL, '0032', '', NULL, NULL, '2023-06-16 09:13:00', '250.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '250.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 9, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2023-06-16 09:14:06', '2023-06-16 09:14:06'),
(459, 3, 2, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 2, NULL, '0033', '', NULL, NULL, '2023-06-16 18:42:00', '1350.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '1350.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 9, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2023-06-16 18:43:57', '2023-06-16 18:43:57'),
(460, 3, 2, NULL, NULL, NULL, 'purchase', NULL, 'received', 0, 'due', NULL, 4, NULL, NULL, 'PO2023/0004', NULL, NULL, '2023-06-17 12:37:00', '2400.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '2400.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-06-17 12:41:32', '2023-06-17 12:41:32'),
(461, 3, 2, NULL, NULL, NULL, 'purchase', NULL, 'received', 0, 'due', NULL, 4, NULL, NULL, 'PO2023/0005', NULL, NULL, '2023-06-17 12:52:00', '1000.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-06-17 12:54:47', '2023-06-17 12:54:47'),
(462, 3, 2, NULL, NULL, NULL, 'purchase', NULL, 'received', 0, 'due', NULL, 4, NULL, NULL, 'PO2023/0006', NULL, NULL, '2023-06-17 12:58:00', '600.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '600.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-06-17 13:02:17', '2023-06-17 13:02:17'),
(463, 3, 2, NULL, NULL, NULL, 'purchase', NULL, 'received', 0, 'due', NULL, 4, NULL, NULL, 'PO2023/0007', NULL, NULL, '2023-06-17 13:11:00', '300.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '300.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-06-17 13:11:49', '2023-06-17 13:11:49'),
(464, 3, 2, NULL, NULL, NULL, 'purchase', NULL, 'received', 0, 'due', NULL, 4, NULL, NULL, 'PO2023/0008', NULL, NULL, '2023-06-17 13:33:00', '400.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '400.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-06-17 13:36:33', '2023-06-17 13:36:33');

-- --------------------------------------------------------

--
-- Table structure for table `transaction_payments`
--

CREATE TABLE `transaction_payments` (
  `id` int UNSIGNED NOT NULL,
  `transaction_id` int UNSIGNED DEFAULT NULL,
  `business_id` int DEFAULT NULL,
  `is_return` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Used during sales to return the change',
  `amount` decimal(22,4) NOT NULL DEFAULT '0.0000',
  `method` enum('cash','card','cheque','bank_transfer','custom_pay_1','custom_pay_2','custom_pay_3','other') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transaction_no` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_transaction_number` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_number` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_holder_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_month` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_year` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_security` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cheque_number` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_account_number` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paid_on` datetime DEFAULT NULL,
  `created_by` int NOT NULL,
  `payment_for` int DEFAULT NULL,
  `parent_id` int DEFAULT NULL,
  `note` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `document` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_ref_no` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transaction_payments`
--

INSERT INTO `transaction_payments` (`id`, `transaction_id`, `business_id`, `is_return`, `amount`, `method`, `transaction_no`, `card_transaction_number`, `card_number`, `card_type`, `card_holder_name`, `card_month`, `card_year`, `card_security`, `cheque_number`, `bank_account_number`, `paid_on`, `created_by`, `payment_for`, `parent_id`, `note`, `document`, `payment_ref_no`, `account_id`, `created_at`, `updated_at`) VALUES
(1, 3, 2, 0, '125.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-10-13 19:12:55', 2, 1, NULL, NULL, NULL, 'SP2022/0001', NULL, '2022-10-13 19:12:55', '2022-10-13 19:12:55'),
(2, 19, 2, 0, '200.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-10-22 11:51:16', 5, 1, NULL, NULL, NULL, 'SP2022/0002', NULL, '2022-10-22 11:51:16', '2022-10-22 11:51:16'),
(3, 20, 2, 0, '80.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-10-22 11:52:45', 5, 1, NULL, NULL, NULL, 'SP2022/0003', NULL, '2022-10-22 11:52:45', '2022-10-22 11:52:45'),
(4, 21, 2, 0, '160.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-10-22 11:53:16', 5, 1, NULL, NULL, NULL, 'SP2022/0004', NULL, '2022-10-22 11:53:16', '2022-10-22 11:53:16'),
(5, 22, 2, 0, '100.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-10-22 11:54:09', 5, 1, NULL, NULL, NULL, 'SP2022/0005', NULL, '2022-10-22 11:54:09', '2022-10-22 11:54:09'),
(6, 23, 2, 0, '150.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-10-22 11:56:44', 5, 1, NULL, NULL, NULL, 'SP2022/0006', NULL, '2022-10-22 11:56:44', '2022-10-22 11:56:44'),
(7, 24, 2, 0, '120.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-10-22 12:08:06', 5, 1, NULL, NULL, NULL, 'SP2022/0007', NULL, '2022-10-22 12:08:06', '2022-10-22 12:08:06'),
(8, 25, 2, 0, '30.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-10-22 12:08:46', 5, 1, NULL, NULL, NULL, 'SP2022/0008', NULL, '2022-10-22 12:08:46', '2022-10-22 12:08:46'),
(9, 26, 2, 0, '220.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-10-22 12:09:27', 5, 1, NULL, NULL, NULL, 'SP2022/0009', NULL, '2022-10-22 12:09:27', '2022-10-22 12:09:27'),
(10, 27, 2, 0, '80.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-10-22 12:09:56', 5, 1, NULL, NULL, NULL, 'SP2022/0010', NULL, '2022-10-22 12:09:56', '2022-10-22 12:09:56'),
(11, 28, 2, 0, '160.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-10-22 12:14:55', 5, 1, NULL, NULL, NULL, 'SP2022/0011', NULL, '2022-10-22 12:14:55', '2022-10-22 12:14:55'),
(12, 30, 2, 0, '250.0000', 'custom_pay_1', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-10-22 12:24:33', 5, 1, NULL, NULL, NULL, 'SP2022/0012', NULL, '2022-10-22 12:24:33', '2022-10-22 12:24:33'),
(13, 36, 2, 0, '160.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-10-22 14:45:30', 5, 1, NULL, NULL, NULL, 'SP2022/0013', NULL, '2022-10-22 14:45:30', '2022-10-22 14:45:30'),
(14, 37, 2, 0, '210.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-10 10:05:04', 2, 1, NULL, NULL, NULL, 'SP2022/0014', NULL, '2022-11-10 10:05:04', '2022-11-10 10:05:04'),
(15, 39, 2, 0, '480.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-16 15:53:38', 2, 1, NULL, NULL, NULL, 'SP2023/0015', NULL, '2023-05-16 15:53:38', '2023-05-16 15:53:38'),
(16, 41, 2, 0, '140.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-16 16:09:54', 2, 1, NULL, NULL, NULL, 'SP2023/0016', NULL, '2023-05-16 16:09:54', '2023-05-16 16:09:54'),
(17, 42, 2, 0, '390.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-16 18:29:10', 7, 1, NULL, NULL, NULL, 'SP2023/0017', NULL, '2023-05-16 18:29:10', '2023-05-16 18:29:10'),
(18, 304, 3, 0, '200.0000', 'custom_pay_1', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-31 12:04:13', 9, 2, NULL, NULL, NULL, 'SP2023/0001', NULL, '2023-05-31 12:04:13', '2023-05-31 12:04:13'),
(19, 305, 3, 0, '200.0000', 'custom_pay_1', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-31 13:49:40', 9, 2, NULL, NULL, NULL, 'SP2023/0002', NULL, '2023-05-31 13:49:40', '2023-05-31 13:49:40'),
(20, 307, 3, 0, '350.0000', 'custom_pay_1', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-31 14:25:05', 9, 2, NULL, NULL, NULL, 'SP2023/0003', NULL, '2023-05-31 14:25:05', '2023-05-31 14:25:05'),
(21, 310, 3, 0, '300.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-31 18:26:09', 9, 2, NULL, NULL, NULL, 'SP2023/0004', NULL, '2023-05-31 18:26:09', '2023-05-31 18:26:09'),
(22, 311, 3, 0, '500.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-31 19:24:59', 9, 2, NULL, NULL, NULL, 'SP2023/0005', NULL, '2023-05-31 19:24:59', '2023-05-31 19:24:59'),
(23, 312, 3, 0, '4500.0000', 'custom_pay_1', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2023-06-01 12:20:14', 9, 5, NULL, NULL, NULL, 'SP2023/0006', NULL, '2023-06-01 12:20:14', '2023-06-01 12:20:14'),
(24, 313, 3, 0, '200.0000', 'custom_pay_1', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2023-06-01 14:10:29', 9, 2, NULL, NULL, NULL, 'SP2023/0007', NULL, '2023-06-01 14:10:29', '2023-06-01 14:10:29'),
(25, 314, 3, 0, '3500.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2023-06-01 18:24:34', 9, 2, NULL, NULL, NULL, 'SP2023/0008', NULL, '2023-06-01 18:24:34', '2023-06-01 18:24:34'),
(26, 315, 3, 0, '1100.0000', 'custom_pay_1', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2023-06-02 18:46:44', 9, 2, NULL, NULL, NULL, 'SP2023/0009', NULL, '2023-06-02 18:46:44', '2023-06-02 18:46:44'),
(27, 392, 3, 0, '3000.0000', 'custom_pay_1', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2023-06-03 11:53:42', 9, 6, NULL, NULL, NULL, 'SP2023/0010', NULL, '2023-06-03 11:53:42', '2023-06-03 11:53:42'),
(28, 392, 3, 0, '1000.0000', 'custom_pay_1', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2023-06-03 11:55:00', 9, 6, NULL, NULL, NULL, 'SP2023/0011', NULL, '2023-06-03 11:55:40', '2023-06-03 11:55:40'),
(29, 394, 3, 0, '80000.0000', 'bank_transfer', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, '0260284166067', '2023-06-03 13:05:17', 9, 9, NULL, 'Goods ordered and paid', NULL, 'PP2023/0001', NULL, '2023-06-03 13:05:17', '2023-06-03 13:05:17'),
(30, 396, 3, 0, '4000.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2023-06-03 15:13:46', 9, 3, NULL, NULL, NULL, 'SP2023/0012', NULL, '2023-06-03 15:13:46', '2023-06-03 15:13:46'),
(31, NULL, 3, 0, '2000.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2023-06-03 15:20:00', 9, 6, NULL, NULL, NULL, 'SP2023/0013', NULL, '2023-06-03 15:21:13', '2023-06-03 15:21:13'),
(32, 392, 3, 0, '2000.0000', 'cash', 'cash', NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2023-06-03 15:20:00', 9, 6, 31, NULL, NULL, 'SP2023/0014', NULL, '2023-06-03 15:21:13', '2023-06-03 15:21:13'),
(33, 397, 3, 0, '70000.0000', 'cheque', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, '00001', NULL, '2023-06-03 15:57:49', 9, NULL, NULL, NULL, NULL, 'SP2023/0015', 3, '2023-06-03 15:57:49', '2023-06-03 16:16:31'),
(34, 398, 3, 0, '800.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2023-06-03 17:04:57', 9, 4, NULL, NULL, NULL, 'PP2023/0002', NULL, '2023-06-03 17:04:57', '2023-06-03 17:04:57'),
(35, 399, 3, 0, '300.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2023-06-03 17:09:08', 9, 2, NULL, NULL, NULL, 'SP2023/0016', NULL, '2023-06-03 17:09:08', '2023-06-03 17:09:08'),
(36, 400, 3, 0, '1300.0000', 'custom_pay_1', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2023-06-05 15:02:11', 9, 2, NULL, NULL, NULL, 'SP2023/0017', NULL, '2023-06-05 15:02:11', '2023-06-05 15:02:11'),
(37, 407, 3, 0, '250.0000', 'custom_pay_1', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2023-06-08 09:58:56', 9, 2, NULL, NULL, NULL, 'SP2023/0018', NULL, '2023-06-08 09:58:56', '2023-06-08 09:58:56'),
(38, 408, 3, 0, '600.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2023-06-08 13:09:58', 9, 2, NULL, NULL, NULL, 'SP2023/0019', NULL, '2023-06-08 13:09:58', '2023-06-08 13:09:58'),
(39, 409, 3, 0, '500.0000', 'custom_pay_1', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2023-06-08 18:14:30', 9, 2, NULL, NULL, NULL, 'SP2023/0020', NULL, '2023-06-08 18:14:30', '2023-06-08 18:14:30'),
(40, 411, 3, 0, '150.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2023-06-08 18:45:53', 9, 2, NULL, NULL, NULL, 'SP2023/0021', NULL, '2023-06-08 18:45:53', '2023-06-08 18:45:53'),
(41, 412, 3, 0, '5500.0000', 'custom_pay_1', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2023-06-09 17:52:03', 9, 2, NULL, NULL, NULL, 'SP2023/0022', NULL, '2023-06-09 17:52:03', '2023-06-09 17:52:03'),
(42, 413, 3, 0, '1600.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2023-06-10 13:03:26', 8, 4, NULL, NULL, NULL, 'PP2023/0003', NULL, '2023-06-10 13:03:26', '2023-06-10 13:03:26'),
(43, 414, 3, 0, '1100.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2023-06-12 14:40:11', 9, 2, NULL, NULL, NULL, 'SP2023/0023', NULL, '2023-06-12 14:40:11', '2023-06-12 14:40:11'),
(44, 415, 3, 0, '300.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2023-06-12 17:10:26', 9, 2, NULL, NULL, NULL, 'SP2023/0024', NULL, '2023-06-12 17:10:26', '2023-06-12 17:10:26'),
(45, 416, 3, 0, '6500.0000', 'custom_pay_1', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2023-06-13 11:42:43', 9, 2, NULL, NULL, NULL, 'SP2023/0025', NULL, '2023-06-13 11:42:43', '2023-06-13 11:42:43'),
(46, 449, 4, 0, '800.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2023-06-13 12:58:08', 10, 10, NULL, NULL, NULL, 'SP2023/0001', NULL, '2023-06-13 12:58:08', '2023-06-13 12:58:08'),
(47, 450, 3, 0, '200.0000', 'custom_pay_1', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2023-06-13 18:09:24', 9, 2, NULL, NULL, NULL, 'SP2023/0026', NULL, '2023-06-13 18:09:24', '2023-06-13 18:09:24'),
(48, 451, 3, 0, '5000.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2023-06-13 18:13:23', 9, 2, NULL, NULL, NULL, 'SP2023/0027', NULL, '2023-06-13 18:13:23', '2023-06-13 18:13:23'),
(49, 456, 3, 0, '6500.0000', 'custom_pay_1', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2023-06-14 12:00:40', 9, 2, NULL, NULL, NULL, 'SP2023/0028', NULL, '2023-06-14 12:00:40', '2023-06-14 12:00:40'),
(50, 457, 3, 0, '1200.0000', 'custom_pay_1', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2023-06-15 12:10:40', 9, 2, NULL, NULL, NULL, 'SP2023/0029', NULL, '2023-06-15 12:10:40', '2023-06-15 12:10:40'),
(51, 458, 3, 0, '250.0000', 'custom_pay_1', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2023-06-16 09:14:06', 9, 2, NULL, NULL, NULL, 'SP2023/0030', NULL, '2023-06-16 09:14:06', '2023-06-16 09:14:06'),
(52, 459, 3, 0, '1350.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2023-06-16 18:43:57', 9, 2, NULL, NULL, NULL, 'SP2023/0031', NULL, '2023-06-16 18:43:57', '2023-06-16 18:43:57');

-- --------------------------------------------------------

--
-- Table structure for table `transaction_sell_lines`
--

CREATE TABLE `transaction_sell_lines` (
  `id` int UNSIGNED NOT NULL,
  `transaction_id` int UNSIGNED NOT NULL,
  `product_id` int UNSIGNED NOT NULL,
  `variation_id` int UNSIGNED NOT NULL,
  `quantity` decimal(22,4) NOT NULL DEFAULT '0.0000',
  `quantity_returned` decimal(20,4) NOT NULL DEFAULT '0.0000',
  `unit_price_before_discount` decimal(22,4) NOT NULL DEFAULT '0.0000',
  `unit_price` decimal(22,4) DEFAULT NULL COMMENT 'Sell price excluding tax',
  `line_discount_type` enum('fixed','percentage') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `line_discount_amount` decimal(22,4) NOT NULL DEFAULT '0.0000',
  `unit_price_inc_tax` decimal(22,4) DEFAULT NULL COMMENT 'Sell price including tax',
  `item_tax` decimal(22,4) NOT NULL COMMENT 'Tax for one quantity',
  `tax_id` int UNSIGNED DEFAULT NULL,
  `discount_id` int DEFAULT NULL,
  `lot_no_line_id` int DEFAULT NULL,
  `sell_line_note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `res_service_staff_id` int DEFAULT NULL,
  `res_line_order_status` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_sell_line_id` int DEFAULT NULL,
  `children_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'Type of children for the parent, like modifier or combo',
  `sub_unit_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transaction_sell_lines`
--

INSERT INTO `transaction_sell_lines` (`id`, `transaction_id`, `product_id`, `variation_id`, `quantity`, `quantity_returned`, `unit_price_before_discount`, `unit_price`, `line_discount_type`, `line_discount_amount`, `unit_price_inc_tax`, `item_tax`, `tax_id`, `discount_id`, `lot_no_line_id`, `sell_line_note`, `res_service_staff_id`, `res_line_order_status`, `parent_sell_line_id`, `children_type`, `sub_unit_id`, `created_at`, `updated_at`) VALUES
(46, 304, 194, 194, '1.0000', '0.0000', '200.0000', '200.0000', 'fixed', '0.0000', '200.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2023-05-31 12:04:13', '2023-05-31 12:04:13'),
(47, 305, 288, 288, '1.0000', '0.0000', '200.0000', '200.0000', 'fixed', '0.0000', '200.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2023-05-31 13:49:40', '2023-05-31 13:49:40'),
(48, 307, 359, 359, '1.0000', '0.0000', '350.0000', '350.0000', 'fixed', '0.0000', '350.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2023-05-31 14:25:05', '2023-05-31 14:25:05'),
(49, 309, 360, 360, '1.0000', '0.0000', '600.0000', '600.0000', 'fixed', '0.0000', '600.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2023-05-31 14:52:15', '2023-05-31 14:52:15'),
(50, 310, 204, 204, '1.0000', '0.0000', '300.0000', '300.0000', 'fixed', '0.0000', '300.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2023-05-31 18:26:09', '2023-05-31 18:26:09'),
(51, 311, 297, 297, '1.0000', '0.0000', '500.0000', '500.0000', 'fixed', '0.0000', '500.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2023-05-31 19:24:59', '2023-05-31 19:24:59'),
(52, 312, 351, 351, '1.0000', '0.0000', '4500.0000', '4500.0000', 'fixed', '0.0000', '4500.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2023-06-01 12:20:14', '2023-06-01 12:20:14'),
(53, 313, 194, 194, '1.0000', '0.0000', '200.0000', '200.0000', 'fixed', '0.0000', '200.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2023-06-01 14:10:29', '2023-06-01 14:10:29'),
(54, 314, 351, 351, '1.0000', '0.0000', '3500.0000', '3500.0000', 'fixed', '0.0000', '3500.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2023-06-01 18:24:34', '2023-06-01 18:24:34'),
(55, 315, 314, 314, '1.0000', '0.0000', '1100.0000', '1100.0000', 'fixed', '0.0000', '1100.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2023-06-02 18:46:44', '2023-06-02 18:46:44'),
(56, 392, 348, 348, '1.0000', '0.0000', '6000.0000', '6000.0000', 'fixed', '0.0000', '6000.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2023-06-03 11:53:42', '2023-06-03 11:53:42'),
(57, 393, 285, 285, '1.0000', '0.0000', '250.0000', '250.0000', 'fixed', '0.0000', '250.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2023-06-03 11:58:38', '2023-06-03 11:58:38'),
(59, 396, 351, 351, '1.0000', '0.0000', '4000.0000', '4000.0000', 'fixed', '0.0000', '4000.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2023-06-03 15:13:46', '2023-06-03 15:13:46'),
(60, 399, 238, 238, '1.0000', '0.0000', '300.0000', '300.0000', 'fixed', '0.0000', '300.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2023-06-03 17:09:08', '2023-06-03 17:09:08'),
(61, 400, 323, 323, '1.0000', '0.0000', '1300.0000', '1300.0000', 'fixed', '0.0000', '1300.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2023-06-05 15:02:11', '2023-06-05 15:02:11'),
(62, 401, 348, 348, '1.0000', '0.0000', '6300.0000', '6300.0000', 'fixed', '0.0000', '6300.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2023-06-06 22:04:58', '2023-06-06 22:04:58'),
(63, 402, 354, 354, '1.0000', '0.0000', '6500.0000', '6500.0000', 'fixed', '0.0000', '6500.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2023-06-06 22:12:42', '2023-06-06 22:12:42'),
(64, 403, 346, 346, '1.0000', '1.0000', '5500.0000', '5500.0000', 'fixed', '0.0000', '5500.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2023-06-07 14:49:31', '2023-06-08 09:46:28'),
(65, 406, 348, 348, '1.0000', '0.0000', '5800.0000', '5800.0000', 'fixed', '0.0000', '5800.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2023-06-08 09:51:36', '2023-06-08 09:51:36'),
(66, 407, 437, 437, '1.0000', '0.0000', '250.0000', '250.0000', 'fixed', '0.0000', '250.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2023-06-08 09:58:56', '2023-06-08 09:58:56'),
(67, 408, 274, 274, '2.0000', '0.0000', '300.0000', '300.0000', 'fixed', '0.0000', '300.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2023-06-08 13:09:58', '2023-06-08 13:09:58'),
(68, 409, 301, 301, '1.0000', '0.0000', '500.0000', '500.0000', 'fixed', '0.0000', '500.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2023-06-08 18:14:30', '2023-06-08 18:14:30'),
(69, 411, 438, 438, '1.0000', '0.0000', '150.0000', '150.0000', 'fixed', '0.0000', '150.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2023-06-08 18:45:53', '2023-06-08 18:45:53'),
(70, 412, 354, 354, '1.0000', '0.0000', '5500.0000', '5500.0000', 'fixed', '0.0000', '5500.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2023-06-09 17:52:03', '2023-06-09 17:52:03'),
(71, 414, 323, 323, '1.0000', '0.0000', '1100.0000', '1100.0000', 'fixed', '0.0000', '1100.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2023-06-12 14:40:11', '2023-06-12 14:40:11'),
(72, 415, 291, 291, '1.0000', '0.0000', '300.0000', '300.0000', 'fixed', '0.0000', '300.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2023-06-12 17:10:26', '2023-06-12 17:10:26'),
(73, 416, 354, 354, '1.0000', '0.0000', '6500.0000', '6500.0000', 'fixed', '0.0000', '6500.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2023-06-13 11:42:43', '2023-06-13 11:42:43'),
(74, 449, 469, 469, '1.0000', '0.0000', '800.0000', '800.0000', 'fixed', '0.0000', '800.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2023-06-13 12:58:08', '2023-06-13 12:58:08'),
(75, 450, 194, 194, '1.0000', '0.0000', '200.0000', '200.0000', 'fixed', '0.0000', '200.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2023-06-13 18:09:24', '2023-06-13 18:09:24'),
(76, 451, 350, 350, '1.0000', '0.0000', '5000.0000', '5000.0000', 'fixed', '0.0000', '5000.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2023-06-13 18:13:23', '2023-06-13 18:13:23'),
(77, 452, 440, 440, '5.0000', '0.0000', '200.0000', '200.0000', NULL, '0.0000', '200.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2023-06-14 08:36:48', '2023-06-14 08:36:48'),
(78, 454, 441, 441, '10.0000', '0.0000', '200.0000', '200.0000', NULL, '0.0000', '200.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2023-06-14 08:43:50', '2023-06-14 08:43:50'),
(79, 456, 349, 349, '1.0000', '0.0000', '6500.0000', '6500.0000', 'fixed', '0.0000', '6500.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2023-06-14 12:00:40', '2023-06-14 12:00:40'),
(80, 457, 310, 310, '1.0000', '0.0000', '1200.0000', '1200.0000', 'fixed', '0.0000', '1200.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2023-06-15 12:10:40', '2023-06-15 12:10:40'),
(81, 458, 437, 437, '1.0000', '0.0000', '250.0000', '250.0000', 'fixed', '0.0000', '250.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2023-06-16 09:14:06', '2023-06-16 09:14:06'),
(82, 459, 323, 323, '1.0000', '0.0000', '1350.0000', '1350.0000', 'fixed', '0.0000', '1350.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2023-06-16 18:43:57', '2023-06-16 18:43:57');

-- --------------------------------------------------------

--
-- Table structure for table `transaction_sell_lines_purchase_lines`
--

CREATE TABLE `transaction_sell_lines_purchase_lines` (
  `id` int UNSIGNED NOT NULL,
  `sell_line_id` int UNSIGNED DEFAULT NULL COMMENT 'id from transaction_sell_lines',
  `stock_adjustment_line_id` int UNSIGNED DEFAULT NULL COMMENT 'id from stock_adjustment_lines',
  `purchase_line_id` int UNSIGNED NOT NULL COMMENT 'id from purchase_lines',
  `quantity` decimal(22,4) NOT NULL,
  `qty_returned` decimal(22,4) NOT NULL DEFAULT '0.0000',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transaction_sell_lines_purchase_lines`
--

INSERT INTO `transaction_sell_lines_purchase_lines` (`id`, `sell_line_id`, `stock_adjustment_line_id`, `purchase_line_id`, `quantity`, `qty_returned`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, 1, '1.0000', '0.0000', '2022-10-13 19:12:55', '2022-10-13 19:12:55'),
(2, 2, NULL, 3, '2.0000', '0.0000', '2022-10-22 11:51:17', '2022-10-22 11:51:17'),
(3, 3, NULL, 6, '1.0000', '0.0000', '2022-10-22 11:51:17', '2022-10-22 11:51:17'),
(4, 4, NULL, 2, '1.0000', '0.0000', '2022-10-22 11:51:17', '2022-10-22 11:51:17'),
(5, 5, NULL, 17, '1.0000', '0.0000', '2022-10-22 11:51:17', '2022-10-22 11:51:17'),
(6, 6, NULL, 3, '1.0000', '0.0000', '2022-10-22 11:52:45', '2022-10-22 11:52:45'),
(7, 7, NULL, 4, '2.0000', '0.0000', '2022-10-22 11:52:45', '2022-10-22 11:52:45'),
(8, 8, NULL, 6, '4.0000', '0.0000', '2022-10-22 11:53:16', '2022-10-22 11:53:16'),
(9, 9, NULL, 3, '1.0000', '0.0000', '2022-10-22 11:54:09', '2022-10-22 11:54:09'),
(10, 10, NULL, 9, '1.0000', '0.0000', '2022-10-22 11:54:10', '2022-10-22 11:54:10'),
(11, 11, NULL, 4, '4.0000', '0.0000', '2022-10-22 11:56:44', '2022-10-22 11:56:44'),
(12, 12, NULL, 17, '1.0000', '0.0000', '2022-10-22 11:56:44', '2022-10-22 11:56:44'),
(13, 13, NULL, 3, '1.0000', '0.0000', '2022-10-22 11:56:44', '2022-10-22 11:56:44'),
(14, 14, NULL, 3, '1.0000', '0.0000', '2022-10-22 12:08:06', '2022-10-22 12:08:06'),
(15, 15, NULL, 8, '1.0000', '0.0000', '2022-10-22 12:08:06', '2022-10-22 12:08:06'),
(16, 16, NULL, 17, '1.0000', '0.0000', '2022-10-22 12:08:46', '2022-10-22 12:08:46'),
(17, 17, NULL, 3, '1.0000', '0.0000', '2022-10-22 12:09:27', '2022-10-22 12:09:27'),
(18, 18, NULL, 6, '2.0000', '0.0000', '2022-10-22 12:09:27', '2022-10-22 12:09:27'),
(19, 19, NULL, 2, '2.0000', '0.0000', '2022-10-22 12:09:27', '2022-10-22 12:09:27'),
(20, 20, NULL, 6, '2.0000', '0.0000', '2022-10-22 12:09:56', '2022-10-22 12:09:56'),
(21, 21, NULL, 1, '1.0000', '0.0000', '2022-10-22 12:14:55', '2022-10-22 12:14:55'),
(22, 22, NULL, 6, '1.0000', '0.0000', '2022-10-22 12:14:55', '2022-10-22 12:14:55'),
(23, 23, NULL, 18, '1.0000', '0.0000', '2022-10-22 12:24:33', '2022-10-22 12:24:33'),
(24, 24, NULL, 0, '2.0000', '0.0000', '2022-10-22 14:45:30', '2022-10-22 14:45:30'),
(25, 25, NULL, 9, '1.0000', '0.0000', '2022-10-22 14:45:30', '2022-10-22 14:45:30'),
(26, 26, NULL, 5, '1.0000', '0.0000', '2022-11-10 10:05:04', '2022-11-10 10:05:04'),
(27, 27, NULL, 11, '1.0000', '0.0000', '2022-11-10 10:05:04', '2022-11-10 10:05:04'),
(28, 28, NULL, 12, '1.0000', '0.0000', '2023-05-16 11:17:14', '2023-05-16 11:17:14'),
(29, 29, NULL, 5, '1.0000', '0.0000', '2023-05-16 15:53:38', '2023-05-16 15:53:38'),
(30, 30, NULL, 17, '1.0000', '0.0000', '2023-05-16 15:53:38', '2023-05-16 15:53:38'),
(31, 31, NULL, 21, '1.0000', '0.0000', '2023-05-16 15:53:38', '2023-05-16 15:53:38'),
(32, 33, NULL, 11, '1.0000', '0.0000', '2023-05-16 16:09:54', '2023-05-16 16:09:54'),
(33, 34, NULL, 8, '1.0000', '0.0000', '2023-05-16 16:09:54', '2023-05-16 16:09:54'),
(34, 39, NULL, 0, '1.0000', '0.0000', '2023-05-16 18:29:10', '2023-05-16 18:29:10'),
(35, 40, NULL, 1, '1.0000', '0.0000', '2023-05-16 18:29:10', '2023-05-16 18:29:10'),
(36, 41, NULL, 13, '2.0000', '0.0000', '2023-05-16 18:29:10', '2023-05-16 18:29:10'),
(37, 42, NULL, 17, '2.0000', '0.0000', '2023-05-16 18:29:10', '2023-05-16 18:29:10'),
(38, 46, NULL, 119, '1.0000', '0.0000', '2023-05-31 12:04:13', '2023-05-31 12:04:13'),
(39, 47, NULL, 213, '1.0000', '0.0000', '2023-05-31 13:49:40', '2023-05-31 13:49:40'),
(40, 48, NULL, 283, '1.0000', '0.0000', '2023-05-31 14:25:05', '2023-05-31 14:25:05'),
(41, 50, NULL, 129, '1.0000', '0.0000', '2023-05-31 18:26:09', '2023-05-31 18:26:09'),
(42, 51, NULL, 222, '1.0000', '0.0000', '2023-05-31 19:24:59', '2023-05-31 19:24:59'),
(43, 52, NULL, 275, '1.0000', '0.0000', '2023-06-01 12:20:14', '2023-06-01 12:20:14'),
(44, 53, NULL, 119, '1.0000', '0.0000', '2023-06-01 14:10:29', '2023-06-01 14:10:29'),
(45, 54, NULL, 275, '1.0000', '0.0000', '2023-06-01 18:24:34', '2023-06-01 18:24:34'),
(46, 55, NULL, 238, '1.0000', '0.0000', '2023-06-02 18:46:44', '2023-06-02 18:46:44'),
(47, 56, NULL, 272, '1.0000', '0.0000', '2023-06-03 11:53:42', '2023-06-03 11:53:42'),
(48, 57, NULL, 210, '1.0000', '0.0000', '2023-06-03 11:58:39', '2023-06-03 11:58:39'),
(50, 59, NULL, 275, '1.0000', '0.0000', '2023-06-03 15:13:46', '2023-06-03 15:13:46'),
(51, 60, NULL, 163, '1.0000', '0.0000', '2023-06-03 17:09:08', '2023-06-03 17:09:08'),
(52, 61, NULL, 247, '1.0000', '0.0000', '2023-06-05 15:02:11', '2023-06-05 15:02:11'),
(53, 62, NULL, 272, '1.0000', '0.0000', '2023-06-06 22:04:58', '2023-06-06 22:04:58'),
(54, 63, NULL, 278, '1.0000', '0.0000', '2023-06-06 22:12:42', '2023-06-06 22:12:42'),
(55, 64, NULL, 270, '1.0000', '1.0000', '2023-06-07 14:49:31', '2023-06-08 09:46:28'),
(56, 65, NULL, 272, '1.0000', '0.0000', '2023-06-08 09:51:36', '2023-06-08 09:51:36'),
(57, 66, NULL, 363, '1.0000', '0.0000', '2023-06-08 09:58:56', '2023-06-08 09:58:56'),
(58, 67, NULL, 199, '2.0000', '0.0000', '2023-06-08 13:09:58', '2023-06-08 13:09:58'),
(59, 68, NULL, 226, '1.0000', '0.0000', '2023-06-08 18:14:30', '2023-06-08 18:14:30'),
(60, 69, NULL, 364, '1.0000', '0.0000', '2023-06-08 18:45:53', '2023-06-08 18:45:53'),
(61, 70, NULL, 278, '1.0000', '0.0000', '2023-06-09 17:52:03', '2023-06-09 17:52:03'),
(62, 71, NULL, 365, '1.0000', '0.0000', '2023-06-12 14:40:11', '2023-06-12 14:40:11'),
(63, 72, NULL, 216, '1.0000', '0.0000', '2023-06-12 17:10:26', '2023-06-12 17:10:26'),
(64, 73, NULL, 278, '1.0000', '0.0000', '2023-06-13 11:42:43', '2023-06-13 11:42:43'),
(65, 74, NULL, 396, '1.0000', '0.0000', '2023-06-13 12:58:08', '2023-06-13 12:58:08'),
(66, 75, NULL, 119, '1.0000', '0.0000', '2023-06-13 18:09:24', '2023-06-13 18:09:24'),
(67, 76, NULL, 274, '1.0000', '0.0000', '2023-06-13 18:13:23', '2023-06-13 18:13:23'),
(68, 77, NULL, 367, '5.0000', '0.0000', '2023-06-14 08:36:48', '2023-06-14 08:36:48'),
(69, 78, NULL, 368, '10.0000', '0.0000', '2023-06-14 08:43:50', '2023-06-14 08:43:50'),
(70, 79, NULL, 273, '1.0000', '0.0000', '2023-06-14 12:00:40', '2023-06-14 12:00:40'),
(71, 80, NULL, 234, '1.0000', '0.0000', '2023-06-15 12:10:40', '2023-06-15 12:10:40'),
(72, 81, NULL, 363, '1.0000', '0.0000', '2023-06-16 09:14:06', '2023-06-16 09:14:06'),
(73, 82, NULL, 365, '1.0000', '0.0000', '2023-06-16 18:43:57', '2023-06-16 18:43:57');

-- --------------------------------------------------------

--
-- Table structure for table `types_of_services`
--

CREATE TABLE `types_of_services` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `business_id` int NOT NULL,
  `location_price_group` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `packing_charge` decimal(22,4) DEFAULT NULL,
  `packing_charge_type` enum('fixed','percent') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `enable_custom_fields` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `units`
--

CREATE TABLE `units` (
  `id` int UNSIGNED NOT NULL,
  `business_id` int UNSIGNED NOT NULL,
  `actual_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `allow_decimal` tinyint(1) NOT NULL,
  `base_unit_id` int DEFAULT NULL,
  `base_unit_multiplier` decimal(20,4) DEFAULT NULL,
  `created_by` int UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `units`
--

INSERT INTO `units` (`id`, `business_id`, `actual_name`, `short_name`, `allow_decimal`, `base_unit_id`, `base_unit_multiplier`, `created_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 2, 'Pieces', 'Pc(s)', 0, NULL, NULL, 2, NULL, '2022-10-13 17:35:41', '2022-10-13 17:35:41'),
(2, 2, 'Cup', 'cp', 1, NULL, NULL, 2, NULL, '2022-10-22 10:44:46', '2022-10-22 10:44:46'),
(3, 2, 'Per Plate', 'Pla', 1, NULL, NULL, 2, NULL, '2022-10-22 10:54:16', '2022-10-22 10:54:16'),
(4, 2, 'Per Plate', 'pp', 0, NULL, NULL, 2, NULL, '2022-10-22 11:12:41', '2022-10-22 11:12:41'),
(5, 3, 'Pieces', 'Pc(s)', 0, NULL, NULL, 8, NULL, '2023-05-30 00:03:44', '2023-05-30 00:03:44'),
(6, 3, 'PZX', 'PZX', 1, NULL, NULL, 9, NULL, '2023-06-08 18:31:03', '2023-06-08 18:31:03'),
(7, 4, 'Pieces', 'Pc(s)', 0, NULL, NULL, 10, NULL, '2023-06-13 13:27:15', '2023-06-13 13:27:15');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int UNSIGNED NOT NULL,
  `user_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'user',
  `surname` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `first_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `username` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `language` char(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'en',
  `contact_no` char(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `business_id` int UNSIGNED DEFAULT NULL,
  `max_sales_discount_percent` decimal(5,2) DEFAULT NULL,
  `allow_login` tinyint(1) NOT NULL DEFAULT '1',
  `status` enum('active','inactive','terminated') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `is_cmmsn_agnt` tinyint(1) NOT NULL DEFAULT '0',
  `cmmsn_percent` decimal(4,2) NOT NULL DEFAULT '0.00',
  `selected_contacts` tinyint(1) NOT NULL DEFAULT '0',
  `dob` date DEFAULT NULL,
  `gender` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `marital_status` enum('married','unmarried','divorced') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `blood_group` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_number` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fb_link` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `twitter_link` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `social_media_1` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `social_media_2` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `permanent_address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `current_address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `guardian_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field_1` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field_2` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field_3` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field_4` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_details` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `id_proof_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_proof_number` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `user_type`, `surname`, `first_name`, `last_name`, `username`, `email`, `password`, `language`, `contact_no`, `address`, `remember_token`, `business_id`, `max_sales_discount_percent`, `allow_login`, `status`, `is_cmmsn_agnt`, `cmmsn_percent`, `selected_contacts`, `dob`, `gender`, `marital_status`, `blood_group`, `contact_number`, `fb_link`, `twitter_link`, `social_media_1`, `social_media_2`, `permanent_address`, `current_address`, `guardian_name`, `custom_field_1`, `custom_field_2`, `custom_field_3`, `custom_field_4`, `bank_details`, `id_proof_name`, `id_proof_number`, `deleted_at`, `created_at`, `updated_at`) VALUES
(2, 'user', 'MR', 'Geofrey', 'Gikonyo', 'Admin', 'admin@localhost.com', '$2y$10$FdJ7jduqa7G88biQAwsdK.DS2S2SCfc.jkzm/8q6LB4xyUdy/O.qO', 'en', NULL, NULL, NULL, 2, NULL, 1, 'active', 0, '0.00', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-10-13 17:35:41', '2022-10-13 17:35:41'),
(3, 'user', 'Miss', 'Jane', NULL, 'Janew', 'jane@gmail.com', '$2y$10$XSKrtXyQHQ/w3wl7wfTGTuM2bXIWLeIECWnIdmWGYWcJKNWPbliMO', 'en', NULL, NULL, NULL, 2, NULL, 1, 'active', 0, '0.00', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"account_holder_name\":null,\"account_number\":null,\"bank_name\":null,\"bank_code\":null,\"branch\":null,\"tax_payer_id\":null}', NULL, NULL, NULL, '2022-10-13 18:54:37', '2022-10-13 18:54:37'),
(4, 'user', 'Mr', 'Peter', 'Mwangi', NULL, 'ddd@gmail.com', NULL, 'en', NULL, NULL, NULL, 2, NULL, 0, 'active', 1, '10.00', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-10-13 18:56:27', '2022-10-13 18:56:27'),
(5, 'user', 'Mr', 'Kelvin', 'Kuria', 'Kelvin', 'kuriakelvin189@gmail.com', '$2y$10$4WXgCCYth2aHN2j5I4tnQOB1Fqya2eoOzpNQO6oKIbg9bOTbdcPs2', 'en', NULL, NULL, NULL, 2, NULL, 1, 'active', 0, '0.00', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"account_holder_name\":null,\"account_number\":null,\"bank_name\":null,\"bank_code\":null,\"branch\":null,\"tax_payer_id\":null}', NULL, NULL, NULL, '2022-10-22 10:40:51', '2022-10-22 10:40:51'),
(6, 'user', NULL, 'James', 'Mwangi', NULL, NULL, NULL, 'en', NULL, NULL, NULL, 2, NULL, 0, 'active', 1, '10.00', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-16 15:59:25', '2023-05-16 15:59:25'),
(7, 'user', NULL, 'Peter', NULL, 'peter', 'peter123@gmail.com', '$2y$10$6yd8suvAKGDpeGgFonUYwunOdrORE8B1H37SQecHKzOwxS5cI1v66', 'en', NULL, NULL, 'Mx4FdmO9MFErAhcWRJUDw4xFN2WzrNGQ2oRlZuZRuqZoN0du0QS46HsR497n', 2, NULL, 1, 'active', 0, '0.00', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"account_holder_name\":null,\"account_number\":null,\"bank_name\":null,\"bank_code\":null,\"branch\":null,\"tax_payer_id\":null}', NULL, NULL, NULL, '2023-05-16 16:28:45', '2023-05-16 16:28:45'),
(8, 'user', 'Mr', 'GEORGE', 'NDIRANGU', 'GEORGE', 'oristuemallkenyaltd@gmail.com', '$2y$10$u3eNgt9rYUmPRXx3PBl/ruOxheMuV4PsWZPrrnDhPYPWRRbIr6qN2', 'en', NULL, NULL, 'bk1MQ1Bbaf2pIrHteOQQnIDTVnGuvOfuTTLhoXGSgm4d7bBtMBamZg7oHihu', 3, NULL, 1, 'active', 0, '0.00', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"account_holder_name\":null,\"account_number\":null,\"bank_name\":null,\"bank_code\":null,\"branch\":null,\"tax_payer_id\":null}', NULL, NULL, NULL, '2023-05-30 00:03:44', '2023-06-09 12:50:40'),
(9, 'user', 'Mr', 'FRANCIS', 'MWANGI', 'FRANCIS', 'machfrancis94@gmail.com', '$2y$10$E.3Par9V5s6SO4G2bwTbDeEaULHsAx1xb8J45kwot0DXpUmnN3gGG', 'en', NULL, NULL, 'MqKkivyU5D8DoY4v0HQEw5oBbVbTFI2zUo87JWCEYRlMah6NLtem7EIwfusY', 3, NULL, 1, 'active', 0, '0.00', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"account_holder_name\":null,\"account_number\":null,\"bank_name\":null,\"bank_code\":null,\"branch\":null,\"tax_payer_id\":null}', NULL, NULL, NULL, '2023-05-31 11:36:56', '2023-06-17 12:56:28'),
(10, 'user', 'Mr', 'Edward', 'Onyango', 'edward', 'jurgenholdingsltd@gmail.com', '$2y$10$zK3Ds8JXrDyQrqq497o6oO/Flu6P4eBC1Bk2hwOa/vzCNz8v9Wt8u', 'en', NULL, NULL, NULL, 4, NULL, 1, 'active', 0, '0.00', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-06-13 13:27:15', '2023-06-13 13:27:15'),
(11, 'user', NULL, 'James', NULL, 'james', 'jamoh@gmail.com', '$2y$10$gye4VISPUCnYGhSdd8LDA.arJWVT77UxXjjYk24WBNI9bhKagcZGG', 'en', NULL, NULL, NULL, 4, NULL, 1, 'active', 0, '0.00', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"account_holder_name\":null,\"account_number\":null,\"bank_name\":null,\"bank_code\":null,\"branch\":null,\"tax_payer_id\":null}', NULL, NULL, NULL, '2023-06-14 08:34:05', '2023-06-14 08:45:27');

-- --------------------------------------------------------

--
-- Table structure for table `user_contact_access`
--

CREATE TABLE `user_contact_access` (
  `id` int UNSIGNED NOT NULL,
  `user_id` int NOT NULL,
  `contact_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `variations`
--

CREATE TABLE `variations` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` int UNSIGNED NOT NULL,
  `sub_sku` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_variation_id` int UNSIGNED NOT NULL,
  `variation_value_id` int DEFAULT NULL,
  `default_purchase_price` decimal(22,4) DEFAULT NULL,
  `dpp_inc_tax` decimal(22,4) NOT NULL DEFAULT '0.0000',
  `profit_percent` decimal(22,4) NOT NULL DEFAULT '0.0000',
  `default_sell_price` decimal(22,4) DEFAULT NULL,
  `sell_price_inc_tax` decimal(22,4) DEFAULT NULL COMMENT 'Sell price including tax',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `combo_variations` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Contains the combo variation details'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `variations`
--

INSERT INTO `variations` (`id`, `name`, `product_id`, `sub_sku`, `product_variation_id`, `variation_value_id`, `default_purchase_price`, `dpp_inc_tax`, `profit_percent`, `default_sell_price`, `sell_price_inc_tax`, `created_at`, `updated_at`, `deleted_at`, `combo_variations`) VALUES
(193, 'DUMMY', 193, '0193', 193, NULL, '10.0000', '10.0000', '25.0000', '12.5000', '12.5000', '2023-05-31 11:19:55', '2023-05-31 11:19:55', NULL, '[]'),
(194, 'DUMMY', 194, '0194', 194, NULL, '78.0000', '78.0000', '25.0000', '200.0000', '200.0000', '2023-05-31 11:28:41', '2023-06-08 14:13:04', NULL, '[]'),
(195, 'DUMMY', 195, '0195', 195, NULL, '130.0000', '130.0000', '25.0000', '300.0000', '300.0000', '2023-05-31 11:28:41', '2023-05-31 11:28:41', NULL, '[]'),
(196, 'DUMMY', 196, '0196', 196, NULL, '150.0000', '150.0000', '25.0000', '300.0000', '300.0000', '2023-05-31 11:28:41', '2023-06-08 14:00:13', NULL, '[]'),
(197, 'DUMMY', 197, '0197', 197, NULL, '200.0000', '200.0000', '25.0000', '400.0000', '400.0000', '2023-05-31 11:28:41', '2023-05-31 11:28:41', NULL, '[]'),
(198, 'DUMMY', 198, '0198', 198, NULL, '100.0000', '100.0000', '25.0000', '200.0000', '200.0000', '2023-05-31 11:28:41', '2023-05-31 11:28:41', NULL, '[]'),
(199, 'DUMMY', 199, '0199', 199, NULL, '150.0000', '150.0000', '25.0000', '250.0000', '250.0000', '2023-05-31 11:28:41', '2023-05-31 11:28:41', NULL, '[]'),
(200, 'DUMMY', 200, '0200', 200, NULL, '200.0000', '200.0000', '25.0000', '400.0000', '400.0000', '2023-05-31 11:28:41', '2023-05-31 11:28:41', NULL, '[]'),
(201, 'DUMMY', 201, '0201', 201, NULL, '200.0000', '200.0000', '150.0000', '500.0000', '500.0000', '2023-05-31 11:28:41', '2023-06-03 10:27:01', NULL, '[]'),
(202, 'DUMMY', 202, '0202', 202, NULL, '200.0000', '200.0000', '25.0000', '400.0000', '400.0000', '2023-05-31 11:28:41', '2023-05-31 11:28:41', NULL, '[]'),
(203, 'DUMMY', 203, '0203', 203, NULL, '300.0000', '300.0000', '25.0000', '500.0000', '500.0000', '2023-05-31 11:28:41', '2023-05-31 11:28:41', NULL, '[]'),
(204, 'DUMMY', 204, '0204', 204, NULL, '200.0000', '200.0000', '25.0000', '400.0000', '400.0000', '2023-05-31 11:28:41', '2023-05-31 11:28:41', NULL, '[]'),
(205, 'DUMMY', 205, '0205', 205, NULL, '300.0000', '300.0000', '25.0000', '500.0000', '500.0000', '2023-05-31 11:28:41', '2023-05-31 11:28:41', NULL, '[]'),
(206, 'DUMMY', 206, '0206', 206, NULL, '250.0000', '250.0000', '25.0000', '500.0000', '500.0000', '2023-05-31 11:28:41', '2023-05-31 11:28:41', NULL, '[]'),
(207, 'DUMMY', 207, '0207', 207, NULL, '100.0000', '100.0000', '25.0000', '200.0000', '200.0000', '2023-05-31 11:28:41', '2023-05-31 11:28:41', NULL, '[]'),
(208, 'DUMMY', 208, '0208', 208, NULL, '200.0000', '200.0000', '25.0000', '400.0000', '400.0000', '2023-05-31 11:28:41', '2023-05-31 11:28:41', NULL, '[]'),
(209, 'DUMMY', 209, '0209', 209, NULL, '150.0000', '150.0000', '25.0000', '300.0000', '300.0000', '2023-05-31 11:28:41', '2023-05-31 11:28:41', NULL, '[]'),
(210, 'DUMMY', 210, '0210', 210, NULL, '150.0000', '150.0000', '25.0000', '300.0000', '300.0000', '2023-05-31 11:28:41', '2023-05-31 11:28:41', NULL, '[]'),
(211, 'DUMMY', 211, '0211', 211, NULL, '150.0000', '150.0000', '25.0000', '300.0000', '300.0000', '2023-05-31 11:28:41', '2023-05-31 11:28:41', NULL, '[]'),
(212, 'DUMMY', 212, '0212', 212, NULL, '150.0000', '150.0000', '25.0000', '300.0000', '300.0000', '2023-05-31 11:28:41', '2023-05-31 11:28:41', NULL, '[]'),
(213, 'DUMMY', 213, '0213', 213, NULL, '150.0000', '150.0000', '25.0000', '300.0000', '300.0000', '2023-05-31 11:28:41', '2023-05-31 11:28:41', NULL, '[]'),
(214, 'DUMMY', 214, '0214', 214, NULL, '150.0000', '150.0000', '25.0000', '300.0000', '300.0000', '2023-05-31 11:28:41', '2023-05-31 11:28:41', NULL, '[]'),
(215, 'DUMMY', 215, '0215', 215, NULL, '150.0000', '150.0000', '25.0000', '300.0000', '300.0000', '2023-05-31 11:28:41', '2023-05-31 11:28:41', NULL, '[]'),
(216, 'DUMMY', 216, '0216', 216, NULL, '150.0000', '150.0000', '25.0000', '300.0000', '300.0000', '2023-05-31 11:28:41', '2023-05-31 11:28:41', NULL, '[]'),
(217, 'DUMMY', 217, '0217', 217, NULL, '150.0000', '150.0000', '25.0000', '300.0000', '300.0000', '2023-05-31 11:28:41', '2023-05-31 11:28:41', NULL, '[]'),
(218, 'DUMMY', 218, '0218', 218, NULL, '150.0000', '150.0000', '25.0000', '300.0000', '300.0000', '2023-05-31 11:28:41', '2023-05-31 11:28:41', NULL, '[]'),
(219, 'DUMMY', 219, '0219', 219, NULL, '150.0000', '150.0000', '25.0000', '300.0000', '300.0000', '2023-05-31 11:28:41', '2023-05-31 11:28:41', NULL, '[]'),
(220, 'DUMMY', 220, '0220', 220, NULL, '150.0000', '150.0000', '25.0000', '300.0000', '300.0000', '2023-05-31 11:28:41', '2023-05-31 11:28:41', NULL, '[]'),
(221, 'DUMMY', 221, '0221', 221, NULL, '150.0000', '150.0000', '25.0000', '300.0000', '300.0000', '2023-05-31 11:28:41', '2023-05-31 11:28:41', NULL, '[]'),
(222, 'DUMMY', 222, '0222', 222, NULL, '150.0000', '150.0000', '25.0000', '300.0000', '300.0000', '2023-05-31 11:28:41', '2023-05-31 11:28:41', NULL, '[]'),
(223, 'DUMMY', 223, '0223', 223, NULL, '150.0000', '150.0000', '25.0000', '300.0000', '300.0000', '2023-05-31 11:28:41', '2023-05-31 11:28:41', NULL, '[]'),
(224, 'DUMMY', 224, '0224', 224, NULL, '150.0000', '150.0000', '25.0000', '300.0000', '300.0000', '2023-05-31 11:28:41', '2023-05-31 11:28:41', NULL, '[]'),
(225, 'DUMMY', 225, '0225', 225, NULL, '150.0000', '150.0000', '25.0000', '300.0000', '300.0000', '2023-05-31 11:28:41', '2023-05-31 11:28:41', NULL, '[]'),
(226, 'DUMMY', 226, '0226', 226, NULL, '150.0000', '150.0000', '25.0000', '300.0000', '300.0000', '2023-05-31 11:28:41', '2023-05-31 11:28:41', NULL, '[]'),
(227, 'DUMMY', 227, '0227', 227, NULL, '150.0000', '150.0000', '25.0000', '300.0000', '300.0000', '2023-05-31 11:28:41', '2023-05-31 11:28:41', NULL, '[]'),
(228, 'DUMMY', 228, '0228', 228, NULL, '150.0000', '150.0000', '25.0000', '300.0000', '300.0000', '2023-05-31 11:28:41', '2023-05-31 11:28:41', NULL, '[]'),
(229, 'DUMMY', 229, '0229', 229, NULL, '150.0000', '150.0000', '25.0000', '300.0000', '300.0000', '2023-05-31 11:28:41', '2023-05-31 11:28:41', NULL, '[]'),
(230, 'DUMMY', 230, '0230', 230, NULL, '150.0000', '150.0000', '25.0000', '300.0000', '300.0000', '2023-05-31 11:28:41', '2023-05-31 11:28:41', NULL, '[]'),
(231, 'DUMMY', 231, '0231', 231, NULL, '150.0000', '150.0000', '25.0000', '300.0000', '300.0000', '2023-05-31 11:28:41', '2023-05-31 11:28:41', NULL, '[]'),
(232, 'DUMMY', 232, '0232', 232, NULL, '150.0000', '150.0000', '25.0000', '300.0000', '300.0000', '2023-05-31 11:28:41', '2023-05-31 11:28:41', NULL, '[]'),
(233, 'DUMMY', 233, '0233', 233, NULL, '150.0000', '150.0000', '25.0000', '300.0000', '300.0000', '2023-05-31 11:28:41', '2023-05-31 11:28:41', NULL, '[]'),
(234, 'DUMMY', 234, '0234', 234, NULL, '150.0000', '150.0000', '25.0000', '300.0000', '300.0000', '2023-05-31 11:28:41', '2023-05-31 11:28:41', NULL, '[]'),
(235, 'DUMMY', 235, '0235', 235, NULL, '150.0000', '150.0000', '25.0000', '300.0000', '300.0000', '2023-05-31 11:28:41', '2023-05-31 11:28:41', NULL, '[]'),
(236, 'DUMMY', 236, '0236', 236, NULL, '150.0000', '150.0000', '25.0000', '300.0000', '300.0000', '2023-05-31 11:28:41', '2023-05-31 11:28:41', NULL, '[]'),
(237, 'DUMMY', 237, '0237', 237, NULL, '150.0000', '150.0000', '25.0000', '300.0000', '300.0000', '2023-05-31 11:28:41', '2023-05-31 11:28:41', NULL, '[]'),
(238, 'DUMMY', 238, '0238', 238, NULL, '150.0000', '150.0000', '25.0000', '300.0000', '300.0000', '2023-05-31 11:28:41', '2023-05-31 11:28:41', NULL, '[]'),
(239, 'DUMMY', 239, '0239', 239, NULL, '150.0000', '150.0000', '25.0000', '300.0000', '300.0000', '2023-05-31 11:28:41', '2023-05-31 11:28:41', NULL, '[]'),
(240, 'DUMMY', 240, '0240', 240, NULL, '150.0000', '150.0000', '25.0000', '300.0000', '300.0000', '2023-05-31 11:28:41', '2023-05-31 11:28:41', NULL, '[]'),
(241, 'DUMMY', 241, '0241', 241, NULL, '150.0000', '150.0000', '25.0000', '300.0000', '300.0000', '2023-05-31 11:28:41', '2023-05-31 11:28:41', NULL, '[]'),
(242, 'DUMMY', 242, '0242', 242, NULL, '150.0000', '150.0000', '25.0000', '300.0000', '300.0000', '2023-05-31 11:28:41', '2023-05-31 11:28:41', NULL, '[]'),
(243, 'DUMMY', 243, '0243', 243, NULL, '150.0000', '150.0000', '25.0000', '300.0000', '300.0000', '2023-05-31 11:28:41', '2023-05-31 11:28:41', NULL, '[]'),
(244, 'DUMMY', 244, '0244', 244, NULL, '150.0000', '150.0000', '25.0000', '300.0000', '300.0000', '2023-05-31 11:28:41', '2023-05-31 11:28:41', NULL, '[]'),
(245, 'DUMMY', 245, '0245', 245, NULL, '150.0000', '150.0000', '25.0000', '300.0000', '300.0000', '2023-05-31 11:28:41', '2023-05-31 11:28:41', NULL, '[]'),
(246, 'DUMMY', 246, '0246', 246, NULL, '150.0000', '150.0000', '25.0000', '300.0000', '300.0000', '2023-05-31 11:28:41', '2023-05-31 11:28:41', NULL, '[]'),
(247, 'DUMMY', 247, '0247', 247, NULL, '150.0000', '150.0000', '25.0000', '300.0000', '300.0000', '2023-05-31 11:28:41', '2023-05-31 11:28:41', NULL, '[]'),
(248, 'DUMMY', 248, '0248', 248, NULL, '150.0000', '150.0000', '25.0000', '300.0000', '300.0000', '2023-05-31 11:28:41', '2023-05-31 11:28:41', NULL, '[]'),
(249, 'DUMMY', 249, '0249', 249, NULL, '100.0000', '100.0000', '25.0000', '200.0000', '200.0000', '2023-05-31 11:28:42', '2023-05-31 11:28:42', NULL, '[]'),
(250, 'DUMMY', 250, '0250', 250, NULL, '100.0000', '100.0000', '25.0000', '200.0000', '200.0000', '2023-05-31 11:28:42', '2023-05-31 11:28:42', NULL, '[]'),
(251, 'DUMMY', 251, '0251', 251, NULL, '100.0000', '100.0000', '25.0000', '200.0000', '200.0000', '2023-05-31 11:28:42', '2023-05-31 11:28:42', NULL, '[]'),
(252, 'DUMMY', 252, '0252', 252, NULL, '100.0000', '100.0000', '25.0000', '200.0000', '200.0000', '2023-05-31 11:28:42', '2023-05-31 11:28:42', NULL, '[]'),
(253, 'DUMMY', 253, '0253', 253, NULL, '100.0000', '100.0000', '25.0000', '200.0000', '200.0000', '2023-05-31 11:28:42', '2023-05-31 11:28:42', NULL, '[]'),
(254, 'DUMMY', 254, '0254', 254, NULL, '100.0000', '100.0000', '25.0000', '200.0000', '200.0000', '2023-05-31 11:28:42', '2023-05-31 11:28:42', NULL, '[]'),
(255, 'DUMMY', 255, '0255', 255, NULL, '100.0000', '100.0000', '25.0000', '200.0000', '200.0000', '2023-05-31 11:28:42', '2023-05-31 11:59:07', NULL, '[]'),
(256, 'DUMMY', 256, '0256', 256, NULL, '100.0000', '100.0000', '25.0000', '200.0000', '200.0000', '2023-05-31 11:28:42', '2023-05-31 11:28:42', NULL, '[]'),
(257, 'DUMMY', 257, '0257', 257, NULL, '100.0000', '100.0000', '25.0000', '200.0000', '200.0000', '2023-05-31 11:28:42', '2023-05-31 11:28:42', NULL, '[]'),
(258, 'DUMMY', 258, '0258', 258, NULL, '100.0000', '100.0000', '25.0000', '200.0000', '200.0000', '2023-05-31 11:28:42', '2023-05-31 11:28:42', NULL, '[]'),
(259, 'DUMMY', 259, '0259', 259, NULL, '100.0000', '100.0000', '25.0000', '200.0000', '200.0000', '2023-05-31 11:28:42', '2023-05-31 11:28:42', NULL, '[]'),
(260, 'DUMMY', 260, '0260', 260, NULL, '100.0000', '100.0000', '25.0000', '200.0000', '200.0000', '2023-05-31 11:28:42', '2023-05-31 11:28:42', NULL, '[]'),
(261, 'DUMMY', 261, '0261', 261, NULL, '100.0000', '100.0000', '25.0000', '200.0000', '200.0000', '2023-05-31 11:28:42', '2023-05-31 11:28:42', NULL, '[]'),
(262, 'DUMMY', 262, '0262', 262, NULL, '100.0000', '100.0000', '25.0000', '200.0000', '200.0000', '2023-05-31 11:28:42', '2023-05-31 11:28:42', NULL, '[]'),
(263, 'DUMMY', 263, '0263', 263, NULL, '100.0000', '100.0000', '25.0000', '200.0000', '200.0000', '2023-05-31 11:28:42', '2023-05-31 11:28:42', NULL, '[]'),
(264, 'DUMMY', 264, '0264', 264, NULL, '100.0000', '100.0000', '25.0000', '200.0000', '200.0000', '2023-05-31 11:28:42', '2023-05-31 11:28:42', NULL, '[]'),
(265, 'DUMMY', 265, '0265', 265, NULL, '100.0000', '100.0000', '25.0000', '200.0000', '200.0000', '2023-05-31 11:28:42', '2023-05-31 11:28:42', NULL, '[]'),
(266, 'DUMMY', 266, '0266', 266, NULL, '100.0000', '100.0000', '25.0000', '200.0000', '200.0000', '2023-05-31 11:28:42', '2023-05-31 11:28:42', NULL, '[]'),
(267, 'DUMMY', 267, '0267', 267, NULL, '100.0000', '100.0000', '25.0000', '200.0000', '200.0000', '2023-05-31 11:28:42', '2023-05-31 11:28:42', NULL, '[]'),
(268, 'DUMMY', 268, '0268', 268, NULL, '100.0000', '100.0000', '25.0000', '200.0000', '200.0000', '2023-05-31 11:28:42', '2023-05-31 11:28:42', NULL, '[]'),
(269, 'DUMMY', 269, '0269', 269, NULL, '100.0000', '100.0000', '25.0000', '200.0000', '200.0000', '2023-05-31 11:28:42', '2023-05-31 11:28:42', NULL, '[]'),
(270, 'DUMMY', 270, '0270', 270, NULL, '100.0000', '100.0000', '25.0000', '200.0000', '200.0000', '2023-05-31 11:28:42', '2023-05-31 11:28:42', NULL, '[]'),
(271, 'DUMMY', 271, '0271', 271, NULL, '100.0000', '100.0000', '25.0000', '200.0000', '200.0000', '2023-05-31 11:28:42', '2023-05-31 11:28:42', NULL, '[]'),
(272, 'DUMMY', 272, '0272', 272, NULL, '100.0000', '100.0000', '25.0000', '200.0000', '200.0000', '2023-05-31 11:28:42', '2023-05-31 11:28:42', NULL, '[]'),
(273, 'DUMMY', 273, '0273', 273, NULL, '100.0000', '100.0000', '25.0000', '200.0000', '200.0000', '2023-05-31 11:28:42', '2023-05-31 11:28:42', NULL, '[]'),
(274, 'DUMMY', 274, '0274', 274, NULL, '150.0000', '150.0000', '100.0000', '300.0000', '300.0000', '2023-05-31 11:28:42', '2023-06-08 13:14:55', NULL, '[]'),
(275, 'DUMMY', 275, '0275', 275, NULL, '100.0000', '100.0000', '25.0000', '200.0000', '200.0000', '2023-05-31 11:28:42', '2023-05-31 11:28:42', NULL, '[]'),
(276, 'DUMMY', 276, '0276', 276, NULL, '700.0000', '700.0000', '25.0000', '1500.0000', '1500.0000', '2023-05-31 11:28:42', '2023-05-31 11:28:42', NULL, '[]'),
(277, 'DUMMY', 277, '0277', 277, NULL, '400.0000', '400.0000', '25.0000', '800.0000', '800.0000', '2023-05-31 11:28:42', '2023-05-31 11:28:42', NULL, '[]'),
(278, 'DUMMY', 278, '0278', 278, NULL, '500.0000', '500.0000', '25.0000', '1000.0000', '1000.0000', '2023-05-31 11:28:42', '2023-05-31 11:28:42', NULL, '[]'),
(279, 'DUMMY', 279, '0279', 279, NULL, '400.0000', '400.0000', '25.0000', '800.0000', '800.0000', '2023-05-31 11:28:42', '2023-05-31 11:28:42', NULL, '[]'),
(280, 'DUMMY', 280, '0280', 280, NULL, '1000.0000', '1000.0000', '25.0000', '1500.0000', '1500.0000', '2023-05-31 11:28:42', '2023-05-31 11:28:42', NULL, '[]'),
(281, 'DUMMY', 281, '0281', 281, NULL, '1200.0000', '1200.0000', '25.0000', '2400.0000', '2400.0000', '2023-05-31 11:28:42', '2023-05-31 11:28:42', NULL, '[]'),
(282, 'DUMMY', 282, '0282', 282, NULL, '900.0000', '900.0000', '25.0000', '1500.0000', '1500.0000', '2023-05-31 11:28:42', '2023-05-31 11:28:42', NULL, '[]'),
(283, 'DUMMY', 283, '0283', 283, NULL, '1000.0000', '1000.0000', '25.0000', '1500.0000', '1500.0000', '2023-05-31 11:28:42', '2023-05-31 11:28:42', NULL, '[]'),
(284, 'DUMMY', 284, '0284', 284, NULL, '360.0000', '360.0000', '25.0000', '600.0000', '600.0000', '2023-05-31 11:28:42', '2023-05-31 11:28:42', NULL, '[]'),
(285, 'DUMMY', 285, '0285', 285, NULL, '360.0000', '360.0000', '25.0000', '300.0000', '300.0000', '2023-05-31 11:28:42', '2023-06-08 14:13:46', NULL, '[]'),
(286, 'DUMMY', 286, '0286', 286, NULL, '100.0000', '100.0000', '25.0000', '200.0000', '200.0000', '2023-05-31 11:28:42', '2023-05-31 11:28:42', NULL, '[]'),
(287, 'DUMMY', 287, '0287', 287, NULL, '100.0000', '100.0000', '25.0000', '200.0000', '200.0000', '2023-05-31 11:28:42', '2023-05-31 11:28:42', NULL, '[]'),
(288, 'DUMMY', 288, '0288', 288, NULL, '80.0000', '80.0000', '25.0000', '200.0000', '200.0000', '2023-05-31 11:28:42', '2023-05-31 11:28:42', NULL, '[]'),
(289, 'DUMMY', 289, '0289', 289, NULL, '70.0000', '70.0000', '25.0000', '200.0000', '200.0000', '2023-05-31 11:28:42', '2023-05-31 11:28:42', NULL, '[]'),
(290, 'DUMMY', 290, '0290', 290, NULL, '80.0000', '80.0000', '25.0000', '200.0000', '200.0000', '2023-05-31 11:28:42', '2023-05-31 11:28:42', NULL, '[]'),
(291, 'DUMMY', 291, '0291', 291, NULL, '150.0000', '150.0000', '25.0000', '300.0000', '300.0000', '2023-05-31 11:28:42', '2023-06-12 17:09:09', NULL, '[]'),
(292, 'DUMMY', 292, '0292', 292, NULL, '500.0000', '500.0000', '25.0000', '800.0000', '800.0000', '2023-05-31 11:28:42', '2023-05-31 11:28:42', NULL, '[]'),
(293, 'DUMMY', 293, '0293', 293, NULL, '350.0000', '350.0000', '25.0000', '600.0000', '600.0000', '2023-05-31 11:28:42', '2023-06-08 14:27:22', NULL, '[]'),
(294, 'DUMMY', 294, '0294', 294, NULL, '250.0000', '250.0000', '25.0000', '500.0000', '500.0000', '2023-05-31 11:28:42', '2023-05-31 11:28:42', NULL, '[]'),
(295, 'DUMMY', 295, '0295', 295, NULL, '250.0000', '250.0000', '25.0000', '500.0000', '500.0000', '2023-05-31 11:28:42', '2023-06-08 14:28:38', NULL, '[]'),
(296, 'DUMMY', 296, '0296', 296, NULL, '1500.0000', '1500.0000', '25.0000', '2500.0000', '2500.0000', '2023-05-31 11:28:42', '2023-05-31 11:28:42', NULL, '[]'),
(297, 'DUMMY', 297, '0297', 297, NULL, '400.0000', '400.0000', '25.0000', '800.0000', '800.0000', '2023-05-31 11:28:42', '2023-05-31 11:28:42', NULL, '[]'),
(298, 'DUMMY', 298, '0298', 298, NULL, '200.0000', '200.0000', '25.0000', '400.0000', '400.0000', '2023-05-31 11:28:42', '2023-05-31 11:28:42', NULL, '[]'),
(299, 'DUMMY', 299, '0299', 299, NULL, '200.0000', '200.0000', '25.0000', '400.0000', '400.0000', '2023-05-31 11:28:42', '2023-05-31 11:28:42', NULL, '[]'),
(300, 'DUMMY', 300, '0300', 300, NULL, '250.0000', '250.0000', '25.0000', '500.0000', '500.0000', '2023-05-31 11:28:42', '2023-05-31 11:28:42', NULL, '[]'),
(301, 'DUMMY', 301, '0301', 301, NULL, '250.0000', '250.0000', '25.0000', '500.0000', '500.0000', '2023-05-31 11:28:42', '2023-05-31 11:28:42', NULL, '[]'),
(302, 'DUMMY', 302, '0302', 302, NULL, '150.0000', '150.0000', '25.0000', '300.0000', '300.0000', '2023-05-31 11:28:42', '2023-05-31 11:28:42', NULL, '[]'),
(303, 'DUMMY', 303, '0303', 303, NULL, '150.0000', '150.0000', '25.0000', '300.0000', '300.0000', '2023-05-31 11:28:42', '2023-05-31 11:28:42', NULL, '[]'),
(304, 'DUMMY', 304, '0304', 304, NULL, '170.0000', '170.0000', '25.0000', '300.0000', '300.0000', '2023-05-31 11:28:42', '2023-05-31 11:28:42', NULL, '[]'),
(305, 'DUMMY', 305, '0305', 305, NULL, '170.0000', '170.0000', '25.0000', '300.0000', '300.0000', '2023-05-31 11:28:42', '2023-05-31 11:28:42', NULL, '[]'),
(306, 'DUMMY', 306, '0306', 306, NULL, '1300.0000', '1300.0000', '25.0000', '2500.0000', '2500.0000', '2023-05-31 11:28:42', '2023-05-31 11:28:42', NULL, '[]'),
(307, 'DUMMY', 307, '0307', 307, NULL, '1300.0000', '1300.0000', '25.0000', '2500.0000', '2500.0000', '2023-05-31 11:28:42', '2023-05-31 11:28:42', NULL, '[]'),
(308, 'DUMMY', 308, '0308', 308, NULL, '1300.0000', '1300.0000', '25.0000', '2500.0000', '2500.0000', '2023-05-31 11:28:42', '2023-05-31 11:28:42', NULL, '[]'),
(309, 'DUMMY', 309, '0309', 309, NULL, '1000.0000', '1000.0000', '25.0000', '1500.0000', '1500.0000', '2023-05-31 11:28:42', '2023-05-31 11:28:42', NULL, '[]'),
(310, 'DUMMY', 310, '0310', 310, NULL, '1000.0000', '1000.0000', '25.0000', '1500.0000', '1500.0000', '2023-05-31 11:28:42', '2023-05-31 11:28:42', NULL, '[]'),
(311, 'DUMMY', 311, '0311', 311, NULL, '1800.0000', '1800.0000', '25.0000', '3000.0000', '3000.0000', '2023-05-31 11:28:42', '2023-05-31 11:28:42', NULL, '[]'),
(312, 'DUMMY', 312, '0312', 312, NULL, '1500.0000', '1500.0000', '25.0000', '2500.0000', '2500.0000', '2023-05-31 11:28:42', '2023-05-31 11:28:42', NULL, '[]'),
(313, 'DUMMY', 313, '0313', 313, NULL, '1200.0000', '1200.0000', '100.0000', '2400.0000', '2400.0000', '2023-05-31 11:28:42', '2023-06-08 13:17:58', NULL, '[]'),
(314, 'DUMMY', 314, '0314', 314, NULL, '800.0000', '800.0000', '25.0000', '1500.0000', '1500.0000', '2023-05-31 11:28:42', '2023-05-31 11:28:42', NULL, '[]'),
(315, 'DUMMY', 315, '0315', 315, NULL, '800.0000', '800.0000', '25.0000', '1500.0000', '1500.0000', '2023-05-31 11:28:42', '2023-05-31 11:28:42', NULL, '[]'),
(316, 'DUMMY', 316, '0316', 316, NULL, '800.0000', '800.0000', '25.0000', '1500.0000', '1500.0000', '2023-05-31 11:28:43', '2023-05-31 11:28:43', NULL, '[]'),
(317, 'DUMMY', 317, '0317', 317, NULL, '1000.0000', '1000.0000', '25.0000', '2000.0000', '2000.0000', '2023-05-31 11:28:43', '2023-05-31 11:28:43', NULL, '[]'),
(318, 'DUMMY', 318, '0318', 318, NULL, '700.0000', '700.0000', '25.0000', '1500.0000', '1500.0000', '2023-05-31 11:28:43', '2023-05-31 11:28:43', NULL, '[]'),
(319, 'DUMMY', 319, '0319', 319, NULL, '1000.0000', '1000.0000', '25.0000', '2000.0000', '2000.0000', '2023-05-31 11:28:43', '2023-05-31 11:28:43', NULL, '[]'),
(320, 'DUMMY', 320, '0320', 320, NULL, '1500.0000', '1500.0000', '25.0000', '2500.0000', '2500.0000', '2023-05-31 11:28:43', '2023-05-31 11:28:43', NULL, '[]'),
(321, 'DUMMY', 321, '0321', 321, NULL, '1200.0000', '1200.0000', '100.0000', '2400.0000', '2400.0000', '2023-05-31 11:28:43', '2023-06-05 17:06:15', NULL, '[]'),
(322, 'DUMMY', 322, '0322', 322, NULL, '900.0000', '900.0000', '25.0000', '1500.0000', '1500.0000', '2023-05-31 11:28:43', '2023-05-31 11:28:43', NULL, '[]'),
(323, 'DUMMY', 323, '0323', 323, NULL, '800.0000', '800.0000', '25.0000', '1500.0000', '1500.0000', '2023-05-31 11:28:43', '2023-05-31 11:28:43', NULL, '[]'),
(324, 'DUMMY', 324, '0324', 324, NULL, '1300.0000', '1300.0000', '25.0000', '2500.0000', '2500.0000', '2023-05-31 11:28:43', '2023-05-31 11:28:43', NULL, '[]'),
(325, 'DUMMY', 325, '0325', 325, NULL, '300.0000', '300.0000', '25.0000', '600.0000', '600.0000', '2023-05-31 11:28:43', '2023-05-31 14:08:28', NULL, '[]'),
(326, 'DUMMY', 326, '0326', 326, NULL, '450.0000', '450.0000', '25.0000', '800.0000', '800.0000', '2023-05-31 11:28:43', '2023-05-31 11:28:43', NULL, '[]'),
(327, 'DUMMY', 327, '0327', 327, NULL, '350.0000', '350.0000', '25.0000', '700.0000', '700.0000', '2023-05-31 11:28:43', '2023-05-31 11:28:43', NULL, '[]'),
(328, 'DUMMY', 328, '0328', 328, NULL, '450.0000', '450.0000', '25.0000', '800.0000', '800.0000', '2023-05-31 11:28:43', '2023-06-08 14:16:34', NULL, '[]'),
(329, 'DUMMY', 329, '0329', 329, NULL, '1000.0000', '1000.0000', '25.0000', '1500.0000', '1500.0000', '2023-05-31 11:28:43', '2023-05-31 11:28:43', NULL, '[]'),
(330, 'DUMMY', 330, '0330', 330, NULL, '2500.0000', '2500.0000', '25.0000', '4000.0000', '4000.0000', '2023-05-31 11:28:43', '2023-05-31 11:28:43', NULL, '[]'),
(331, 'DUMMY', 331, '0331', 331, NULL, '1500.0000', '1500.0000', '25.0000', '2500.0000', '2500.0000', '2023-05-31 11:28:43', '2023-05-31 11:28:43', NULL, '[]'),
(332, 'DUMMY', 332, '0332', 332, NULL, '1000.0000', '1000.0000', '25.0000', '2000.0000', '2000.0000', '2023-05-31 11:28:43', '2023-06-08 10:14:41', NULL, '[]'),
(333, 'DUMMY', 333, '0333', 333, NULL, '800.0000', '800.0000', '25.0000', '1500.0000', '1500.0000', '2023-05-31 11:28:43', '2023-05-31 11:28:43', NULL, '[]'),
(334, 'DUMMY', 334, '0334', 334, NULL, '1300.0000', '1300.0000', '25.0000', '2500.0000', '2500.0000', '2023-05-31 11:28:43', '2023-05-31 11:28:43', NULL, '[]'),
(335, 'DUMMY', 335, '0335', 335, NULL, '2500.0000', '2500.0000', '25.0000', '3500.0000', '3500.0000', '2023-05-31 11:28:43', '2023-05-31 11:28:43', NULL, '[]'),
(336, 'DUMMY', 336, '0336', 336, NULL, '300.0000', '300.0000', '25.0000', '600.0000', '600.0000', '2023-05-31 11:28:43', '2023-05-31 11:28:43', NULL, '[]'),
(337, 'DUMMY', 337, '0337', 337, NULL, '500.0000', '500.0000', '25.0000', '1000.0000', '1000.0000', '2023-05-31 11:28:43', '2023-05-31 11:28:43', NULL, '[]'),
(338, 'DUMMY', 338, '0338', 338, NULL, '4000.0000', '4000.0000', '25.0000', '6000.0000', '6000.0000', '2023-05-31 11:28:43', '2023-05-31 11:28:43', NULL, '[]'),
(339, 'DUMMY', 339, '0339', 339, NULL, '4500.0000', '4500.0000', '25.0000', '7000.0000', '7000.0000', '2023-05-31 11:28:43', '2023-06-08 10:06:16', NULL, '[]'),
(340, 'DUMMY', 340, '0340', 340, NULL, '900.0000', '900.0000', '25.0000', '1500.0000', '1500.0000', '2023-05-31 11:28:43', '2023-05-31 11:28:43', NULL, '[]'),
(341, 'DUMMY', 341, '0341', 341, NULL, '1000.0000', '1000.0000', '25.0000', '2000.0000', '2000.0000', '2023-05-31 11:28:43', '2023-05-31 11:28:43', NULL, '[]'),
(342, 'DUMMY', 342, '0342', 342, NULL, '650.0000', '650.0000', '115.3800', '1400.0000', '1400.0000', '2023-05-31 11:28:43', '2023-06-05 09:51:50', NULL, '[]'),
(343, 'DUMMY', 343, '0343', 343, NULL, '400.0000', '400.0000', '25.0000', '800.0000', '800.0000', '2023-05-31 11:28:43', '2023-05-31 11:28:43', NULL, '[]'),
(344, 'DUMMY', 344, '0344', 344, NULL, '400.0000', '400.0000', '25.0000', '800.0000', '800.0000', '2023-05-31 11:28:43', '2023-05-31 11:28:43', NULL, '[]'),
(345, 'DUMMY', 345, '0345', 345, NULL, '550.0000', '550.0000', '25.0000', '1000.0000', '1000.0000', '2023-05-31 11:28:43', '2023-05-31 11:28:43', NULL, '[]'),
(346, 'DUMMY', 346, '0346', 346, NULL, '3000.0000', '3000.0000', '100.0000', '6000.0000', '6000.0000', '2023-05-31 11:28:43', '2023-06-07 14:48:16', NULL, '[]'),
(347, 'DUMMY', 347, '0347', 347, NULL, '3400.0000', '3400.0000', '105.8800', '7000.0000', '7000.0000', '2023-05-31 11:28:43', '2023-06-13 18:20:46', NULL, '[]'),
(348, 'DUMMY', 348, '0348', 348, NULL, '3400.0000', '3400.0000', '85.2900', '6300.0000', '6300.0000', '2023-05-31 11:28:43', '2023-06-08 13:45:04', NULL, '[]'),
(349, 'DUMMY', 349, '0349', 349, NULL, '3700.0000', '3700.0000', '75.6800', '6500.0000', '6500.0000', '2023-05-31 11:28:43', '2023-06-14 12:06:48', NULL, '[]'),
(350, 'DUMMY', 350, '0350', 350, NULL, '3000.0000', '3000.0000', '90.0000', '5700.0000', '5700.0000', '2023-05-31 11:28:43', '2023-06-13 18:23:26', NULL, '[]'),
(351, 'DUMMY', 351, '0351', 351, NULL, '2850.0000', '2850.0000', '57.8900', '4500.0000', '4500.0000', '2023-05-31 11:28:43', '2023-06-14 12:05:33', NULL, '[]'),
(352, 'DUMMY', 352, '0352', 352, NULL, '2850.0000', '2850.0000', '92.9800', '5500.0000', '5500.0000', '2023-05-31 11:28:43', '2023-06-14 12:08:13', NULL, '[]'),
(353, 'DUMMY', 353, '0353', 353, NULL, '2800.0000', '2800.0000', '67.8600', '4700.0000', '4700.0000', '2023-05-31 11:28:43', '2023-06-13 18:15:20', NULL, '[]'),
(354, 'DUMMY', 354, '0354', 354, NULL, '3600.0000', '3600.0000', '94.4400', '7000.0000', '7000.0000', '2023-05-31 11:28:43', '2023-06-09 17:51:09', NULL, '[]'),
(355, 'DUMMY', 355, '0355', 355, NULL, '800.0000', '800.0000', '25.0000', '1500.0000', '1500.0000', '2023-05-31 11:28:43', '2023-05-31 11:28:43', NULL, '[]'),
(356, 'DUMMY', 356, '0356', 356, NULL, '300.0000', '300.0000', '25.0000', '600.0000', '600.0000', '2023-05-31 11:28:43', '2023-05-31 11:28:43', NULL, '[]'),
(357, 'DUMMY', 357, '0357', 357, NULL, '900.0000', '900.0000', '25.0000', '1500.0000', '1500.0000', '2023-05-31 11:28:43', '2023-05-31 11:28:43', NULL, '[]'),
(358, 'DUMMY', 358, '0358', 358, NULL, '2000.0000', '2000.0000', '25.0000', '3000.0000', '3000.0000', '2023-05-31 11:28:43', '2023-05-31 11:28:43', NULL, '[]'),
(359, 'DUMMY', 359, '0359', 359, NULL, '300.0000', '300.0000', '66.6700', '500.0000', '500.0000', '2023-05-31 14:17:14', '2023-05-31 14:23:11', NULL, '[]'),
(360, 'DUMMY', 360, '0360', 360, NULL, '300.0000', '300.0000', '100.0000', '600.0000', '600.0000', '2023-05-31 14:42:20', '2023-06-08 14:09:26', NULL, '[]'),
(361, 'DUMMY', 361, '0361', 361, NULL, '150.0000', '150.0000', '25.0000', '300.0000', '300.0000', '2023-06-03 11:20:15', '2023-06-10 13:05:20', NULL, '[]'),
(362, 'DUMMY', 362, '0362', 362, NULL, '150.0000', '150.0000', '25.0000', '300.0000', '300.0000', '2023-06-03 11:20:15', '2023-06-10 13:06:46', NULL, '[]'),
(363, 'DUMMY', 363, '0363', 363, NULL, '150.0000', '150.0000', '25.0000', '300.0000', '300.0000', '2023-06-03 11:20:15', '2023-06-10 13:07:42', NULL, '[]'),
(364, 'DUMMY', 364, '0364', 364, NULL, '150.0000', '150.0000', '25.0000', '300.0000', '300.0000', '2023-06-03 11:20:15', '2023-06-03 11:20:15', NULL, '[]'),
(365, 'DUMMY', 365, '0365', 365, NULL, '150.0000', '150.0000', '25.0000', '300.0000', '300.0000', '2023-06-03 11:20:15', '2023-06-03 11:20:15', NULL, '[]'),
(366, 'DUMMY', 366, '0366', 366, NULL, '150.0000', '150.0000', '25.0000', '300.0000', '300.0000', '2023-06-03 11:20:15', '2023-06-03 11:20:15', NULL, '[]'),
(367, 'DUMMY', 367, '0367', 367, NULL, '150.0000', '150.0000', '25.0000', '300.0000', '300.0000', '2023-06-03 11:20:15', '2023-06-03 11:20:15', NULL, '[]'),
(368, 'DUMMY', 368, '0368', 368, NULL, '150.0000', '150.0000', '25.0000', '300.0000', '300.0000', '2023-06-03 11:20:15', '2023-06-03 11:20:15', NULL, '[]'),
(369, 'DUMMY', 369, '0369', 369, NULL, '150.0000', '150.0000', '25.0000', '300.0000', '300.0000', '2023-06-03 11:20:15', '2023-06-03 11:20:15', NULL, '[]'),
(370, 'DUMMY', 370, '0370', 370, NULL, '150.0000', '150.0000', '25.0000', '300.0000', '300.0000', '2023-06-03 11:20:15', '2023-06-03 11:20:15', NULL, '[]'),
(371, 'DUMMY', 371, '0371', 371, NULL, '150.0000', '150.0000', '25.0000', '300.0000', '300.0000', '2023-06-03 11:20:15', '2023-06-03 11:20:15', NULL, '[]'),
(372, 'DUMMY', 372, '0372', 372, NULL, '200.0000', '200.0000', '25.0000', '400.0000', '400.0000', '2023-06-03 11:20:15', '2023-06-03 11:20:15', NULL, '[]'),
(373, 'DUMMY', 373, '0373', 373, NULL, '200.0000', '200.0000', '25.0000', '400.0000', '400.0000', '2023-06-03 11:20:15', '2023-06-03 11:20:15', NULL, '[]'),
(374, 'DUMMY', 374, '0374', 374, NULL, '200.0000', '200.0000', '25.0000', '400.0000', '400.0000', '2023-06-03 11:20:15', '2023-06-03 11:20:15', NULL, '[]'),
(375, 'DUMMY', 375, '0375', 375, NULL, '200.0000', '200.0000', '25.0000', '400.0000', '400.0000', '2023-06-03 11:20:16', '2023-06-03 11:20:16', NULL, '[]'),
(376, 'DUMMY', 376, '0376', 376, NULL, '200.0000', '200.0000', '25.0000', '400.0000', '400.0000', '2023-06-03 11:20:16', '2023-06-03 11:20:16', NULL, '[]'),
(377, 'DUMMY', 377, '0377', 377, NULL, '200.0000', '200.0000', '25.0000', '400.0000', '400.0000', '2023-06-03 11:20:16', '2023-06-03 11:20:16', NULL, '[]'),
(378, 'DUMMY', 378, '0378', 378, NULL, '200.0000', '200.0000', '25.0000', '400.0000', '400.0000', '2023-06-03 11:20:16', '2023-06-03 11:20:16', NULL, '[]'),
(379, 'DUMMY', 379, '0379', 379, NULL, '200.0000', '200.0000', '25.0000', '400.0000', '400.0000', '2023-06-03 11:20:16', '2023-06-03 11:20:16', NULL, '[]'),
(380, 'DUMMY', 380, '0380', 380, NULL, '200.0000', '200.0000', '25.0000', '400.0000', '400.0000', '2023-06-03 11:20:16', '2023-06-03 11:20:16', NULL, '[]'),
(381, 'DUMMY', 381, '0381', 381, NULL, '200.0000', '200.0000', '25.0000', '400.0000', '400.0000', '2023-06-03 11:20:16', '2023-06-03 11:20:16', NULL, '[]'),
(382, 'DUMMY', 382, '0382', 382, NULL, '200.0000', '200.0000', '25.0000', '400.0000', '400.0000', '2023-06-03 11:20:16', '2023-06-03 11:20:16', NULL, '[]'),
(383, 'DUMMY', 383, '0383', 383, NULL, '200.0000', '200.0000', '25.0000', '400.0000', '400.0000', '2023-06-03 11:20:16', '2023-06-03 11:20:16', NULL, '[]'),
(384, 'DUMMY', 384, '0384', 384, NULL, '200.0000', '200.0000', '25.0000', '400.0000', '400.0000', '2023-06-03 11:20:16', '2023-06-03 11:20:16', NULL, '[]'),
(385, 'DUMMY', 385, '0385', 385, NULL, '200.0000', '200.0000', '25.0000', '400.0000', '400.0000', '2023-06-03 11:20:16', '2023-06-03 11:20:16', NULL, '[]'),
(386, 'DUMMY', 386, '0386', 386, NULL, '200.0000', '200.0000', '25.0000', '400.0000', '400.0000', '2023-06-03 11:20:16', '2023-06-03 11:20:16', NULL, '[]'),
(387, 'DUMMY', 387, '0387', 387, NULL, '200.0000', '200.0000', '25.0000', '400.0000', '400.0000', '2023-06-03 11:20:16', '2023-06-03 11:20:16', NULL, '[]'),
(388, 'DUMMY', 388, '0388', 388, NULL, '200.0000', '200.0000', '25.0000', '400.0000', '400.0000', '2023-06-03 11:20:16', '2023-06-03 11:20:16', NULL, '[]'),
(389, 'DUMMY', 389, '0389', 389, NULL, '200.0000', '200.0000', '25.0000', '400.0000', '400.0000', '2023-06-03 11:20:16', '2023-06-03 11:20:16', NULL, '[]'),
(390, 'DUMMY', 390, '0390', 390, NULL, '200.0000', '200.0000', '25.0000', '400.0000', '400.0000', '2023-06-03 11:20:16', '2023-06-03 11:20:16', NULL, '[]'),
(391, 'DUMMY', 391, '0391', 391, NULL, '200.0000', '200.0000', '25.0000', '400.0000', '400.0000', '2023-06-03 11:20:16', '2023-06-03 11:20:16', NULL, '[]'),
(392, 'DUMMY', 392, '0392', 392, NULL, '200.0000', '200.0000', '25.0000', '400.0000', '400.0000', '2023-06-03 11:20:16', '2023-06-03 11:20:16', NULL, '[]'),
(393, 'DUMMY', 393, '0393', 393, NULL, '200.0000', '200.0000', '25.0000', '400.0000', '400.0000', '2023-06-03 11:20:16', '2023-06-03 11:20:16', NULL, '[]'),
(394, 'DUMMY', 394, '0394', 394, NULL, '200.0000', '200.0000', '25.0000', '400.0000', '400.0000', '2023-06-03 11:20:16', '2023-06-03 11:20:16', NULL, '[]'),
(395, 'DUMMY', 395, '0395', 395, NULL, '250.0000', '250.0000', '25.0000', '500.0000', '500.0000', '2023-06-03 11:20:16', '2023-06-03 11:20:16', NULL, '[]'),
(396, 'DUMMY', 396, '0396', 396, NULL, '250.0000', '250.0000', '25.0000', '500.0000', '500.0000', '2023-06-03 11:20:16', '2023-06-03 11:20:16', NULL, '[]'),
(397, 'DUMMY', 397, '0397', 397, NULL, '250.0000', '250.0000', '25.0000', '500.0000', '500.0000', '2023-06-03 11:20:16', '2023-06-03 11:20:16', NULL, '[]'),
(398, 'DUMMY', 398, '0398', 398, NULL, '250.0000', '250.0000', '25.0000', '500.0000', '500.0000', '2023-06-03 11:20:16', '2023-06-03 11:20:16', NULL, '[]'),
(399, 'DUMMY', 399, '0399', 399, NULL, '250.0000', '250.0000', '25.0000', '500.0000', '500.0000', '2023-06-03 11:20:16', '2023-06-03 11:20:16', NULL, '[]'),
(400, 'DUMMY', 400, '0400', 400, NULL, '250.0000', '250.0000', '25.0000', '500.0000', '500.0000', '2023-06-03 11:20:16', '2023-06-03 11:20:16', NULL, '[]'),
(401, 'DUMMY', 401, '0401', 401, NULL, '250.0000', '250.0000', '25.0000', '500.0000', '500.0000', '2023-06-03 11:20:16', '2023-06-03 11:20:16', NULL, '[]'),
(402, 'DUMMY', 402, '0402', 402, NULL, '250.0000', '250.0000', '25.0000', '500.0000', '500.0000', '2023-06-03 11:20:16', '2023-06-03 11:20:16', NULL, '[]'),
(403, 'DUMMY', 403, '0403', 403, NULL, '250.0000', '250.0000', '25.0000', '500.0000', '500.0000', '2023-06-03 11:20:16', '2023-06-03 11:20:16', NULL, '[]'),
(404, 'DUMMY', 404, '0404', 404, NULL, '200.0000', '200.0000', '25.0000', '400.0000', '400.0000', '2023-06-03 11:20:16', '2023-06-03 11:20:16', NULL, '[]'),
(405, 'DUMMY', 405, '0405', 405, NULL, '200.0000', '200.0000', '25.0000', '400.0000', '400.0000', '2023-06-03 11:20:16', '2023-06-03 11:20:16', NULL, '[]'),
(406, 'DUMMY', 406, '0406', 406, NULL, '200.0000', '200.0000', '25.0000', '250.0000', '250.0000', '2023-06-03 11:20:16', '2023-06-03 11:20:16', NULL, '[]'),
(407, 'DUMMY', 407, '0407', 407, NULL, '200.0000', '200.0000', '25.0000', '250.0000', '250.0000', '2023-06-03 11:20:16', '2023-06-03 11:20:16', NULL, '[]'),
(408, 'DUMMY', 408, '0408', 408, NULL, '200.0000', '200.0000', '25.0000', '250.0000', '250.0000', '2023-06-03 11:20:16', '2023-06-03 11:20:16', NULL, '[]'),
(409, 'DUMMY', 409, '0409', 409, NULL, '200.0000', '200.0000', '25.0000', '250.0000', '250.0000', '2023-06-03 11:20:16', '2023-06-03 11:20:16', NULL, '[]'),
(410, 'DUMMY', 410, '0410', 410, NULL, '200.0000', '200.0000', '25.0000', '250.0000', '250.0000', '2023-06-03 11:20:16', '2023-06-03 11:20:16', NULL, '[]'),
(411, 'DUMMY', 411, '0411', 411, NULL, '200.0000', '200.0000', '25.0000', '250.0000', '250.0000', '2023-06-03 11:20:16', '2023-06-03 11:20:16', NULL, '[]'),
(412, 'DUMMY', 412, '0412', 412, NULL, '200.0000', '200.0000', '25.0000', '250.0000', '250.0000', '2023-06-03 11:20:16', '2023-06-03 11:20:16', NULL, '[]'),
(413, 'DUMMY', 413, '0413', 413, NULL, '200.0000', '200.0000', '25.0000', '250.0000', '250.0000', '2023-06-03 11:20:16', '2023-06-03 11:20:16', NULL, '[]'),
(414, 'DUMMY', 414, '0414', 414, NULL, '200.0000', '200.0000', '25.0000', '250.0000', '250.0000', '2023-06-03 11:20:16', '2023-06-03 11:20:16', NULL, '[]'),
(415, 'DUMMY', 415, '0415', 415, NULL, '60.0000', '60.0000', '25.0000', '75.0000', '75.0000', '2023-06-03 11:20:16', '2023-06-03 11:20:16', NULL, '[]'),
(416, 'DUMMY', 416, '0416', 416, NULL, '60.0000', '60.0000', '25.0000', '75.0000', '75.0000', '2023-06-03 11:20:16', '2023-06-03 11:20:16', NULL, '[]'),
(417, 'DUMMY', 417, '0417', 417, NULL, '60.0000', '60.0000', '25.0000', '75.0000', '75.0000', '2023-06-03 11:20:16', '2023-06-03 11:20:16', NULL, '[]'),
(418, 'DUMMY', 418, '0418', 418, NULL, '60.0000', '60.0000', '25.0000', '75.0000', '75.0000', '2023-06-03 11:20:16', '2023-06-03 11:20:16', NULL, '[]'),
(419, 'DUMMY', 419, '0419', 419, NULL, '60.0000', '60.0000', '25.0000', '75.0000', '75.0000', '2023-06-03 11:20:16', '2023-06-03 11:20:16', NULL, '[]'),
(420, 'DUMMY', 420, '0420', 420, NULL, '60.0000', '60.0000', '25.0000', '75.0000', '75.0000', '2023-06-03 11:20:16', '2023-06-03 11:20:16', NULL, '[]'),
(421, 'DUMMY', 421, '0421', 421, NULL, '60.0000', '60.0000', '25.0000', '75.0000', '75.0000', '2023-06-03 11:20:16', '2023-06-03 11:20:16', NULL, '[]'),
(422, 'DUMMY', 422, '0422', 422, NULL, '60.0000', '60.0000', '25.0000', '75.0000', '75.0000', '2023-06-03 11:20:16', '2023-06-03 11:20:16', NULL, '[]'),
(423, 'DUMMY', 423, '0423', 423, NULL, '60.0000', '60.0000', '25.0000', '75.0000', '75.0000', '2023-06-03 11:20:16', '2023-06-03 11:20:16', NULL, '[]'),
(424, 'DUMMY', 424, '0424', 424, NULL, '60.0000', '60.0000', '25.0000', '75.0000', '75.0000', '2023-06-03 11:20:16', '2023-06-03 11:20:16', NULL, '[]'),
(425, 'DUMMY', 425, '0425', 425, NULL, '60.0000', '60.0000', '25.0000', '75.0000', '75.0000', '2023-06-03 11:20:16', '2023-06-03 11:20:16', NULL, '[]'),
(426, 'DUMMY', 426, '0426', 426, NULL, '60.0000', '60.0000', '25.0000', '75.0000', '75.0000', '2023-06-03 11:20:16', '2023-06-03 11:20:16', NULL, '[]'),
(427, 'DUMMY', 427, '0427', 427, NULL, '60.0000', '60.0000', '25.0000', '75.0000', '75.0000', '2023-06-03 11:20:16', '2023-06-03 11:20:16', NULL, '[]'),
(428, 'DUMMY', 428, '0428', 428, NULL, '60.0000', '60.0000', '25.0000', '75.0000', '75.0000', '2023-06-03 11:20:16', '2023-06-03 11:20:16', NULL, '[]'),
(429, 'DUMMY', 429, '0429', 429, NULL, '60.0000', '60.0000', '25.0000', '75.0000', '75.0000', '2023-06-03 11:20:16', '2023-06-03 11:20:16', NULL, '[]'),
(430, 'DUMMY', 430, '0430', 430, NULL, '60.0000', '60.0000', '25.0000', '75.0000', '75.0000', '2023-06-03 11:20:16', '2023-06-03 11:20:16', NULL, '[]'),
(431, 'DUMMY', 431, '0431', 431, NULL, '60.0000', '60.0000', '25.0000', '75.0000', '75.0000', '2023-06-03 11:20:16', '2023-06-03 11:20:16', NULL, '[]'),
(432, 'DUMMY', 432, '0432', 432, NULL, '60.0000', '60.0000', '25.0000', '75.0000', '75.0000', '2023-06-03 11:20:16', '2023-06-03 11:20:16', NULL, '[]'),
(433, 'DUMMY', 433, '0433', 433, NULL, '60.0000', '60.0000', '25.0000', '75.0000', '75.0000', '2023-06-03 11:20:16', '2023-06-03 11:20:16', NULL, '[]'),
(434, 'DUMMY', 434, '0434', 434, NULL, '60.0000', '60.0000', '25.0000', '75.0000', '75.0000', '2023-06-03 11:20:16', '2023-06-03 11:20:16', NULL, '[]'),
(435, 'DUMMY', 435, '0435', 435, NULL, '500.0000', '500.0000', '25.0000', '625.0000', '625.0000', '2023-06-03 11:20:16', '2023-06-03 11:20:16', NULL, '[]'),
(436, 'DUMMY', 436, '0436', 436, NULL, '500.0000', '500.0000', '25.0000', '625.0000', '625.0000', '2023-06-03 11:20:16', '2023-06-03 11:20:16', NULL, '[]'),
(437, 'DUMMY', 437, '0437', 437, NULL, '145.0000', '145.0000', '106.9000', '300.0000', '300.0000', '2023-06-08 09:39:39', '2023-06-08 09:57:59', NULL, '[]'),
(438, 'DUMMY', 438, '0438', 438, NULL, '100.0000', '100.0000', '100.0000', '200.0000', '200.0000', '2023-06-08 18:36:25', '2023-06-08 18:36:25', NULL, '[]'),
(439, 'DUMMY', 439, '0439', 439, NULL, '200.0000', '200.0000', '25.0000', '920.0000', '920.0000', '2023-06-13 12:10:29', '2023-06-13 12:10:29', NULL, '[]'),
(440, 'DUMMY', 440, '0440', 440, NULL, '200.0000', '200.0000', '25.0000', '1240.0000', '1240.0000', '2023-06-13 12:10:29', '2023-06-13 12:10:29', NULL, '[]'),
(441, 'DUMMY', 441, '0441', 441, NULL, '200.0000', '200.0000', '25.0000', '1460.0000', '1460.0000', '2023-06-13 12:10:29', '2023-06-13 12:10:29', NULL, '[]'),
(442, 'DUMMY', 442, '0442', 442, NULL, '200.0000', '200.0000', '25.0000', '1460.0000', '1460.0000', '2023-06-13 12:10:29', '2023-06-13 12:10:29', NULL, '[]'),
(443, 'DUMMY', 443, '0443', 443, NULL, '200.0000', '200.0000', '25.0000', '1240.0000', '1240.0000', '2023-06-13 12:10:29', '2023-06-13 12:10:29', NULL, '[]'),
(444, 'DUMMY', 444, '0444', 444, NULL, '200.0000', '200.0000', '25.0000', '400.0000', '400.0000', '2023-06-13 12:10:29', '2023-06-13 12:10:29', NULL, '[]'),
(445, 'DUMMY', 445, '0445', 445, NULL, '200.0000', '200.0000', '25.0000', '450.0000', '450.0000', '2023-06-13 12:10:29', '2023-06-13 12:10:29', NULL, '[]'),
(446, 'DUMMY', 446, '0446', 446, NULL, '200.0000', '200.0000', '25.0000', '1000.0000', '1000.0000', '2023-06-13 12:10:29', '2023-06-13 12:10:29', NULL, '[]'),
(447, 'DUMMY', 447, '0447', 447, NULL, '200.0000', '200.0000', '25.0000', '1270.0000', '1270.0000', '2023-06-13 12:10:29', '2023-06-13 12:10:29', NULL, '[]'),
(448, 'DUMMY', 448, '0448', 448, NULL, '200.0000', '200.0000', '25.0000', '1000.0000', '1000.0000', '2023-06-13 12:10:29', '2023-06-13 12:10:29', NULL, '[]'),
(449, 'DUMMY', 449, '0449', 449, NULL, '200.0000', '200.0000', '25.0000', '1050.0000', '1050.0000', '2023-06-13 12:10:29', '2023-06-13 12:10:29', NULL, '[]'),
(450, 'DUMMY', 450, '0450', 450, NULL, '200.0000', '200.0000', '25.0000', '1300.0000', '1300.0000', '2023-06-13 12:10:29', '2023-06-13 12:10:29', NULL, '[]'),
(451, 'DUMMY', 451, '0451', 451, NULL, '200.0000', '200.0000', '25.0000', '1005.0000', '1005.0000', '2023-06-13 12:10:29', '2023-06-13 12:10:29', NULL, '[]'),
(452, 'DUMMY', 452, '0452', 452, NULL, '200.0000', '200.0000', '25.0000', '650.0000', '650.0000', '2023-06-13 12:10:29', '2023-06-13 12:10:29', NULL, '[]'),
(453, 'DUMMY', 453, '0453', 453, NULL, '200.0000', '200.0000', '25.0000', '650.0000', '650.0000', '2023-06-13 12:10:29', '2023-06-13 12:10:29', NULL, '[]'),
(454, 'DUMMY', 454, '0454', 454, NULL, '200.0000', '200.0000', '25.0000', '500.0000', '500.0000', '2023-06-13 12:10:29', '2023-06-13 12:10:29', NULL, '[]'),
(455, 'DUMMY', 455, '0455', 455, NULL, '200.0000', '200.0000', '25.0000', '325.0000', '325.0000', '2023-06-13 12:10:29', '2023-06-13 12:10:29', NULL, '[]'),
(456, 'DUMMY', 456, '0456', 456, NULL, '200.0000', '200.0000', '25.0000', '580.0000', '580.0000', '2023-06-13 12:10:29', '2023-06-13 12:10:29', NULL, '[]'),
(457, 'DUMMY', 457, '0457', 457, NULL, '200.0000', '200.0000', '25.0000', '300.0000', '300.0000', '2023-06-13 12:10:29', '2023-06-13 12:10:29', NULL, '[]'),
(458, 'DUMMY', 458, '0458', 458, NULL, '200.0000', '200.0000', '25.0000', '300.0000', '300.0000', '2023-06-13 12:10:29', '2023-06-13 12:10:29', NULL, '[]'),
(459, 'DUMMY', 459, '0459', 459, NULL, '200.0000', '200.0000', '25.0000', '300.0000', '300.0000', '2023-06-13 12:10:29', '2023-06-13 12:10:29', NULL, '[]'),
(460, 'DUMMY', 460, '0460', 460, NULL, '200.0000', '200.0000', '25.0000', '1575.0000', '1575.0000', '2023-06-13 12:10:29', '2023-06-13 12:10:29', NULL, '[]'),
(461, 'DUMMY', 461, '0461', 461, NULL, '200.0000', '200.0000', '25.0000', '900.0000', '900.0000', '2023-06-13 12:10:29', '2023-06-13 12:10:29', NULL, '[]'),
(462, 'DUMMY', 462, '0462', 462, NULL, '200.0000', '200.0000', '25.0000', '700.0000', '700.0000', '2023-06-13 12:10:29', '2023-06-13 12:10:29', NULL, '[]'),
(463, 'DUMMY', 463, '0463', 463, NULL, '200.0000', '200.0000', '25.0000', '750.0000', '750.0000', '2023-06-13 12:10:29', '2023-06-13 12:10:29', NULL, '[]'),
(464, 'DUMMY', 464, '0464', 464, NULL, '200.0000', '200.0000', '25.0000', '600.0000', '600.0000', '2023-06-13 12:10:29', '2023-06-13 12:10:29', NULL, '[]'),
(465, 'DUMMY', 465, '0465', 465, NULL, '200.0000', '200.0000', '25.0000', '600.0000', '600.0000', '2023-06-13 12:10:29', '2023-06-13 12:10:29', NULL, '[]'),
(466, 'DUMMY', 466, '0466', 466, NULL, '200.0000', '200.0000', '25.0000', '1400.0000', '1400.0000', '2023-06-13 12:10:29', '2023-06-13 12:10:29', NULL, '[]'),
(467, 'DUMMY', 467, '0467', 467, NULL, '200.0000', '200.0000', '25.0000', '700.0000', '700.0000', '2023-06-13 12:10:29', '2023-06-13 12:10:29', NULL, '[]'),
(468, 'DUMMY', 468, '0468', 468, NULL, '200.0000', '200.0000', '25.0000', '700.0000', '700.0000', '2023-06-13 12:10:29', '2023-06-13 12:10:29', NULL, '[]'),
(469, 'DUMMY', 469, '0469', 469, NULL, '200.0000', '200.0000', '25.0000', '800.0000', '800.0000', '2023-06-13 12:10:29', '2023-06-13 12:10:29', NULL, '[]'),
(470, 'DUMMY', 470, '0470', 470, NULL, '200.0000', '200.0000', '25.0000', '730.0000', '730.0000', '2023-06-13 12:10:29', '2023-06-13 12:10:29', NULL, '[]'),
(471, 'DUMMY', 471, '0471', 471, NULL, '1000.0000', '1000.0000', '100.0000', '2000.0000', '2000.0000', '2023-06-17 12:52:13', '2023-06-17 12:52:13', NULL, '[]'),
(472, 'DUMMY', 472, '0472', 472, NULL, '150.0000', '150.0000', '100.0000', '300.0000', '300.0000', '2023-06-17 13:00:45', '2023-06-17 13:00:45', NULL, '[]'),
(473, 'DUMMY', 473, '0473', 473, NULL, '150.0000', '150.0000', '100.0000', '300.0000', '300.0000', '2023-06-17 13:07:05', '2023-06-17 13:07:05', NULL, '[]'),
(474, 'DUMMY', 474, '0474', 474, NULL, '150.0000', '150.0000', '100.0000', '300.0000', '300.0000', '2023-06-17 13:21:35', '2023-06-17 13:21:35', NULL, '[]'),
(475, 'DUMMY', 475, '0475', 475, NULL, '150.0000', '150.0000', '100.0000', '300.0000', '300.0000', '2023-06-17 13:27:08', '2023-06-17 13:27:08', NULL, '[]');

-- --------------------------------------------------------

--
-- Table structure for table `variation_group_prices`
--

CREATE TABLE `variation_group_prices` (
  `id` int UNSIGNED NOT NULL,
  `variation_id` int UNSIGNED NOT NULL,
  `price_group_id` int UNSIGNED NOT NULL,
  `price_inc_tax` decimal(22,4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `variation_group_prices`
--

INSERT INTO `variation_group_prices` (`id`, `variation_id`, `price_group_id`, `price_inc_tax`, `created_at`, `updated_at`) VALUES
(1, 339, 1, '6500.0000', '2023-06-08 10:06:30', '2023-06-08 10:19:45'),
(2, 199, 1, '200.0000', '2023-06-08 10:19:45', '2023-06-08 10:19:45'),
(3, 274, 1, '250.0000', '2023-06-08 13:15:22', '2023-06-08 13:15:22'),
(4, 313, 1, '2000.0000', '2023-06-08 13:18:17', '2023-06-08 13:18:17');

-- --------------------------------------------------------

--
-- Table structure for table `variation_location_details`
--

CREATE TABLE `variation_location_details` (
  `id` int UNSIGNED NOT NULL,
  `product_id` int UNSIGNED NOT NULL,
  `product_variation_id` int UNSIGNED NOT NULL COMMENT 'id from product_variations table',
  `variation_id` int UNSIGNED NOT NULL,
  `location_id` int UNSIGNED NOT NULL,
  `qty_available` decimal(22,4) NOT NULL DEFAULT '0.0000',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `variation_location_details`
--

INSERT INTO `variation_location_details` (`id`, `product_id`, `product_variation_id`, `variation_id`, `location_id`, `qty_available`, `created_at`, `updated_at`) VALUES
(120, 194, 194, 194, 2, '97.0000', '2023-05-31 11:28:41', '2023-06-13 18:09:24'),
(121, 195, 195, 195, 2, '56.0000', '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(122, 196, 196, 196, 2, '5.0000', '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(123, 197, 197, 197, 2, '3.0000', '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(124, 198, 198, 198, 2, '4.0000', '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(125, 199, 199, 199, 2, '2.0000', '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(126, 200, 200, 200, 2, '2.0000', '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(127, 201, 201, 201, 2, '3.0000', '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(128, 202, 202, 202, 2, '3.0000', '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(129, 203, 203, 203, 2, '1.0000', '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(130, 204, 204, 204, 2, '0.0000', '2023-05-31 11:28:41', '2023-05-31 18:26:09'),
(131, 205, 205, 205, 2, '1.0000', '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(132, 206, 206, 206, 2, '2.0000', '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(133, 207, 207, 207, 2, '4.0000', '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(134, 208, 208, 208, 2, '2.0000', '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(135, 209, 209, 209, 2, '4.0000', '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(136, 210, 210, 210, 2, '2.0000', '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(137, 211, 211, 211, 2, '2.0000', '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(138, 212, 212, 212, 2, '3.0000', '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(139, 213, 213, 213, 2, '1.0000', '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(140, 214, 214, 214, 2, '2.0000', '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(141, 215, 215, 215, 2, '3.0000', '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(142, 216, 216, 216, 2, '1.0000', '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(143, 217, 217, 217, 2, '5.0000', '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(144, 218, 218, 218, 2, '4.0000', '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(145, 219, 219, 219, 2, '1.0000', '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(146, 220, 220, 220, 2, '1.0000', '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(147, 221, 221, 221, 2, '4.0000', '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(148, 222, 222, 222, 2, '3.0000', '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(149, 223, 223, 223, 2, '1.0000', '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(150, 224, 224, 224, 2, '1.0000', '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(151, 225, 225, 225, 2, '5.0000', '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(152, 226, 226, 226, 2, '1.0000', '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(153, 227, 227, 227, 2, '6.0000', '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(154, 228, 228, 228, 2, '5.0000', '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(155, 229, 229, 229, 2, '4.0000', '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(156, 230, 230, 230, 2, '1.0000', '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(157, 231, 231, 231, 2, '3.0000', '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(158, 232, 232, 232, 2, '5.0000', '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(159, 233, 233, 233, 2, '2.0000', '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(160, 234, 234, 234, 2, '3.0000', '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(161, 235, 235, 235, 2, '1.0000', '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(162, 236, 236, 236, 2, '5.0000', '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(163, 237, 237, 237, 2, '1.0000', '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(164, 238, 238, 238, 2, '0.0000', '2023-05-31 11:28:41', '2023-06-03 17:09:08'),
(165, 239, 239, 239, 2, '4.0000', '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(166, 240, 240, 240, 2, '2.0000', '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(167, 241, 241, 241, 2, '3.0000', '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(168, 242, 242, 242, 2, '3.0000', '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(169, 243, 243, 243, 2, '3.0000', '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(170, 244, 244, 244, 2, '1.0000', '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(171, 245, 245, 245, 2, '2.0000', '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(172, 246, 246, 246, 2, '3.0000', '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(173, 247, 247, 247, 2, '3.0000', '2023-05-31 11:28:41', '2023-05-31 11:28:41'),
(174, 248, 248, 248, 2, '3.0000', '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(175, 249, 249, 249, 2, '2.0000', '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(176, 250, 250, 250, 2, '2.0000', '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(177, 251, 251, 251, 2, '2.0000', '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(178, 252, 252, 252, 2, '1.0000', '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(179, 253, 253, 253, 2, '5.0000', '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(180, 254, 254, 254, 2, '2.0000', '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(181, 255, 255, 255, 2, '6.0000', '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(182, 256, 256, 256, 2, '3.0000', '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(183, 257, 257, 257, 2, '2.0000', '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(184, 258, 258, 258, 2, '2.0000', '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(185, 259, 259, 259, 2, '3.0000', '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(186, 260, 260, 260, 2, '2.0000', '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(187, 261, 261, 261, 2, '1.0000', '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(188, 262, 262, 262, 2, '3.0000', '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(189, 263, 263, 263, 2, '3.0000', '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(190, 264, 264, 264, 2, '4.0000', '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(191, 265, 265, 265, 2, '3.0000', '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(192, 266, 266, 266, 2, '3.0000', '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(193, 267, 267, 267, 2, '5.0000', '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(194, 268, 268, 268, 2, '4.0000', '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(195, 269, 269, 269, 2, '4.0000', '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(196, 270, 270, 270, 2, '1.0000', '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(197, 271, 271, 271, 2, '1.0000', '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(198, 272, 272, 272, 2, '2.0000', '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(199, 273, 273, 273, 2, '2.0000', '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(200, 274, 274, 274, 2, '0.0000', '2023-05-31 11:28:42', '2023-06-08 13:09:58'),
(201, 275, 275, 275, 2, '2.0000', '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(202, 276, 276, 276, 2, '3.0000', '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(203, 277, 277, 277, 2, '3.0000', '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(204, 278, 278, 278, 2, '9.0000', '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(205, 279, 279, 279, 2, '3.0000', '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(206, 280, 280, 280, 2, '1.0000', '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(207, 281, 281, 281, 2, '2.0000', '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(208, 282, 282, 282, 2, '1.0000', '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(209, 283, 283, 283, 2, '1.0000', '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(210, 284, 284, 284, 2, '25.0000', '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(211, 285, 285, 285, 2, '25.0000', '2023-05-31 11:28:42', '2023-06-08 14:13:56'),
(212, 286, 286, 286, 2, '9.0000', '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(213, 287, 287, 287, 2, '9.0000', '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(214, 288, 288, 288, 2, '8.0000', '2023-05-31 11:28:42', '2023-05-31 13:49:40'),
(215, 289, 289, 289, 2, '10.0000', '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(216, 290, 290, 290, 2, '10.0000', '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(217, 291, 291, 291, 2, '0.0000', '2023-05-31 11:28:42', '2023-06-12 17:10:26'),
(218, 292, 292, 292, 2, '2.0000', '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(219, 293, 293, 293, 2, '2.0000', '2023-05-31 11:28:42', '2023-06-08 14:27:31'),
(220, 294, 294, 294, 2, '2.0000', '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(221, 295, 295, 295, 2, '2.0000', '2023-05-31 11:28:42', '2023-06-08 14:28:48'),
(222, 296, 296, 296, 2, '2.0000', '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(223, 297, 297, 297, 2, '2.0000', '2023-05-31 11:28:42', '2023-06-17 13:36:33'),
(224, 298, 298, 298, 2, '2.0000', '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(225, 299, 299, 299, 2, '2.0000', '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(226, 300, 300, 300, 2, '2.0000', '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(227, 301, 301, 301, 2, '1.0000', '2023-05-31 11:28:42', '2023-06-08 18:14:30'),
(228, 302, 302, 302, 2, '1.0000', '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(229, 303, 303, 303, 2, '1.0000', '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(230, 304, 304, 304, 2, '2.0000', '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(231, 306, 306, 306, 2, '1.0000', '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(232, 307, 307, 307, 2, '1.0000', '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(233, 308, 308, 308, 2, '1.0000', '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(234, 309, 309, 309, 2, '1.0000', '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(235, 310, 310, 310, 2, '0.0000', '2023-05-31 11:28:42', '2023-06-15 12:10:40'),
(236, 311, 311, 311, 2, '2.0000', '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(237, 312, 312, 312, 2, '1.0000', '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(238, 313, 313, 313, 2, '1.0000', '2023-05-31 11:28:42', '2023-05-31 11:28:42'),
(239, 314, 314, 314, 2, '0.0000', '2023-05-31 11:28:42', '2023-06-02 18:46:44'),
(240, 315, 315, 315, 2, '2.0000', '2023-05-31 11:28:42', '2023-06-03 17:04:57'),
(241, 316, 316, 316, 2, '1.0000', '2023-05-31 11:28:43', '2023-05-31 11:28:43'),
(242, 317, 317, 317, 2, '1.0000', '2023-05-31 11:28:43', '2023-05-31 11:28:43'),
(243, 318, 318, 318, 2, '2.0000', '2023-05-31 11:28:43', '2023-05-31 11:28:43'),
(244, 319, 319, 319, 2, '2.0000', '2023-05-31 11:28:43', '2023-05-31 11:28:43'),
(245, 320, 320, 320, 2, '1.0000', '2023-05-31 11:28:43', '2023-05-31 11:28:43'),
(246, 321, 321, 321, 2, '2.0000', '2023-05-31 11:28:43', '2023-06-05 17:06:53'),
(247, 322, 322, 322, 2, '2.0000', '2023-05-31 11:28:43', '2023-05-31 11:28:43'),
(248, 323, 323, 323, 2, '3.0000', '2023-05-31 11:28:43', '2023-06-17 12:41:32'),
(249, 324, 324, 324, 2, '2.0000', '2023-05-31 11:28:43', '2023-05-31 11:28:43'),
(250, 325, 325, 325, 2, '3.0000', '2023-05-31 11:28:43', '2023-05-31 11:28:43'),
(251, 326, 326, 326, 2, '2.0000', '2023-05-31 11:28:43', '2023-05-31 11:28:43'),
(252, 327, 327, 327, 2, '2.0000', '2023-05-31 11:28:43', '2023-05-31 11:28:43'),
(253, 328, 328, 328, 2, '1.0000', '2023-05-31 11:28:43', '2023-06-08 14:16:59'),
(254, 329, 329, 329, 2, '2.0000', '2023-05-31 11:28:43', '2023-05-31 11:28:43'),
(255, 330, 330, 330, 2, '1.0000', '2023-05-31 11:28:43', '2023-05-31 11:28:43'),
(256, 331, 331, 331, 2, '2.0000', '2023-05-31 11:28:43', '2023-05-31 11:28:43'),
(257, 332, 332, 332, 2, '2.0000', '2023-05-31 11:28:43', '2023-05-31 11:28:43'),
(258, 333, 333, 333, 2, '2.0000', '2023-05-31 11:28:43', '2023-05-31 11:28:43'),
(259, 334, 334, 334, 2, '2.0000', '2023-05-31 11:28:43', '2023-05-31 11:28:43'),
(260, 335, 335, 335, 2, '2.0000', '2023-05-31 11:28:43', '2023-05-31 11:28:43'),
(261, 336, 336, 336, 2, '2.0000', '2023-05-31 11:28:43', '2023-05-31 11:28:43'),
(262, 337, 337, 337, 2, '3.0000', '2023-05-31 11:28:43', '2023-05-31 11:28:43'),
(263, 338, 338, 338, 2, '2.0000', '2023-05-31 11:28:43', '2023-05-31 11:28:43'),
(264, 339, 339, 339, 2, '2.0000', '2023-05-31 11:28:43', '2023-05-31 11:28:43'),
(265, 340, 340, 340, 2, '1.0000', '2023-05-31 11:28:43', '2023-05-31 11:28:43'),
(266, 341, 341, 341, 2, '1.0000', '2023-05-31 11:28:43', '2023-05-31 11:28:43'),
(267, 342, 342, 342, 2, '3.0000', '2023-05-31 11:28:43', '2023-05-31 11:28:43'),
(268, 343, 343, 343, 2, '3.0000', '2023-05-31 11:28:43', '2023-05-31 11:28:43'),
(269, 344, 344, 344, 2, '3.0000', '2023-05-31 11:28:43', '2023-05-31 11:28:43'),
(270, 345, 345, 345, 2, '1.0000', '2023-05-31 11:28:43', '2023-05-31 11:28:43'),
(271, 346, 346, 346, 2, '7.0000', '2023-05-31 11:28:43', '2023-06-08 09:46:28'),
(272, 347, 347, 347, 2, '9.0000', '2023-05-31 11:28:43', '2023-05-31 11:28:43'),
(273, 348, 348, 348, 2, '8.0000', '2023-05-31 11:28:43', '2023-06-08 13:45:27'),
(274, 349, 349, 349, 2, '8.0000', '2023-05-31 11:28:43', '2023-06-14 12:00:40'),
(275, 350, 350, 350, 2, '9.0000', '2023-05-31 11:28:43', '2023-06-13 18:13:23'),
(276, 351, 351, 351, 2, '6.0000', '2023-05-31 11:28:43', '2023-06-05 12:14:29'),
(277, 352, 352, 352, 2, '10.0000', '2023-05-31 11:28:43', '2023-05-31 11:28:43'),
(278, 353, 353, 353, 2, '9.0000', '2023-05-31 11:28:43', '2023-05-31 11:28:43'),
(279, 354, 354, 354, 2, '4.0000', '2023-05-31 11:28:43', '2023-06-13 11:42:43'),
(280, 355, 355, 355, 2, '1.0000', '2023-05-31 11:28:43', '2023-05-31 11:28:43'),
(281, 356, 356, 356, 2, '1.0000', '2023-05-31 11:28:43', '2023-05-31 11:28:43'),
(282, 357, 357, 357, 2, '1.0000', '2023-05-31 11:28:43', '2023-05-31 11:28:43'),
(283, 358, 358, 358, 2, '1.0000', '2023-05-31 11:28:43', '2023-05-31 11:28:43'),
(284, 359, 359, 359, 2, '2.0000', '2023-05-31 14:23:19', '2023-05-31 14:25:05'),
(285, 360, 360, 360, 2, '13.0000', '2023-05-31 14:42:33', '2023-06-08 14:08:31'),
(286, 361, 361, 361, 2, '2.0000', '2023-06-03 11:20:15', '2023-06-10 13:05:38'),
(287, 362, 362, 362, 2, '2.0000', '2023-06-03 11:20:15', '2023-06-10 13:07:00'),
(288, 363, 363, 363, 2, '1.0000', '2023-06-03 11:20:15', '2023-06-10 13:07:54'),
(289, 364, 364, 364, 2, '3.0000', '2023-06-03 11:20:15', '2023-06-03 11:20:15'),
(290, 365, 365, 365, 2, '4.0000', '2023-06-03 11:20:15', '2023-06-03 11:20:15'),
(291, 366, 366, 366, 2, '2.0000', '2023-06-03 11:20:15', '2023-06-03 11:20:15'),
(292, 367, 367, 367, 2, '2.0000', '2023-06-03 11:20:15', '2023-06-03 11:20:15'),
(293, 368, 368, 368, 2, '3.0000', '2023-06-03 11:20:15', '2023-06-03 11:20:15'),
(294, 369, 369, 369, 2, '3.0000', '2023-06-03 11:20:15', '2023-06-03 11:20:15'),
(295, 370, 370, 370, 2, '1.0000', '2023-06-03 11:20:15', '2023-06-03 11:20:15'),
(296, 371, 371, 371, 2, '1.0000', '2023-06-03 11:20:15', '2023-06-03 11:20:15'),
(297, 372, 372, 372, 2, '1.0000', '2023-06-03 11:20:15', '2023-06-03 11:20:15'),
(298, 373, 373, 373, 2, '2.0000', '2023-06-03 11:20:15', '2023-06-03 11:20:15'),
(299, 374, 374, 374, 2, '4.0000', '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(300, 375, 375, 375, 2, '2.0000', '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(301, 376, 376, 376, 2, '4.0000', '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(302, 377, 377, 377, 2, '2.0000', '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(303, 378, 378, 378, 2, '2.0000', '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(304, 379, 379, 379, 2, '3.0000', '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(305, 380, 380, 380, 2, '1.0000', '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(306, 381, 381, 381, 2, '2.0000', '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(307, 382, 382, 382, 2, '3.0000', '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(308, 383, 383, 383, 2, '1.0000', '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(309, 384, 384, 384, 2, '5.0000', '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(310, 385, 385, 385, 2, '4.0000', '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(311, 386, 386, 386, 2, '1.0000', '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(312, 387, 387, 387, 2, '1.0000', '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(313, 388, 388, 388, 2, '4.0000', '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(314, 389, 389, 389, 2, '3.0000', '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(315, 390, 390, 390, 2, '1.0000', '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(316, 391, 391, 391, 2, '1.0000', '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(317, 392, 392, 392, 2, '5.0000', '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(318, 393, 393, 393, 2, '1.0000', '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(319, 394, 394, 394, 2, '6.0000', '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(320, 395, 395, 395, 2, '5.0000', '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(321, 396, 396, 396, 2, '4.0000', '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(322, 397, 397, 397, 2, '1.0000', '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(323, 398, 398, 398, 2, '3.0000', '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(324, 399, 399, 399, 2, '5.0000', '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(325, 400, 400, 400, 2, '2.0000', '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(326, 401, 401, 401, 2, '3.0000', '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(327, 402, 402, 402, 2, '1.0000', '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(328, 403, 403, 403, 2, '5.0000', '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(329, 404, 404, 404, 2, '1.0000', '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(330, 405, 405, 405, 2, '1.0000', '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(331, 406, 406, 406, 2, '4.0000', '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(332, 407, 407, 407, 2, '2.0000', '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(333, 408, 408, 408, 2, '3.0000', '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(334, 409, 409, 409, 2, '3.0000', '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(335, 410, 410, 410, 2, '3.0000', '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(336, 411, 411, 411, 2, '1.0000', '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(337, 412, 412, 412, 2, '2.0000', '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(338, 413, 413, 413, 2, '3.0000', '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(339, 414, 414, 414, 2, '3.0000', '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(340, 415, 415, 415, 2, '3.0000', '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(341, 416, 416, 416, 2, '2.0000', '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(342, 417, 417, 417, 2, '2.0000', '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(343, 418, 418, 418, 2, '2.0000', '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(344, 419, 419, 419, 2, '1.0000', '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(345, 420, 420, 420, 2, '5.0000', '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(346, 421, 421, 421, 2, '2.0000', '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(347, 422, 422, 422, 2, '6.0000', '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(348, 423, 423, 423, 2, '3.0000', '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(349, 424, 424, 424, 2, '2.0000', '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(350, 425, 425, 425, 2, '2.0000', '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(351, 426, 426, 426, 2, '3.0000', '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(352, 427, 427, 427, 2, '2.0000', '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(353, 428, 428, 428, 2, '1.0000', '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(354, 429, 429, 429, 2, '3.0000', '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(355, 430, 430, 430, 2, '3.0000', '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(356, 431, 431, 431, 2, '4.0000', '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(357, 432, 432, 432, 2, '3.0000', '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(358, 433, 433, 433, 2, '3.0000', '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(359, 434, 434, 434, 2, '5.0000', '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(360, 435, 435, 435, 2, '4.0000', '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(361, 436, 436, 436, 2, '4.0000', '2023-06-03 11:20:16', '2023-06-03 11:20:16'),
(362, 437, 437, 437, 2, '48.0000', '2023-06-08 09:39:53', '2023-06-16 09:14:06'),
(363, 438, 438, 438, 2, '4.0000', '2023-06-08 18:36:49', '2023-06-08 18:45:53'),
(364, 439, 439, 439, 3, '133.0000', '2023-06-13 12:10:29', '2023-06-13 12:10:29'),
(365, 440, 440, 440, 3, '3473.0000', '2023-06-13 12:10:29', '2023-06-14 08:36:48'),
(366, 441, 441, 441, 3, '1979.0000', '2023-06-13 12:10:29', '2023-06-14 08:43:50'),
(367, 442, 442, 442, 3, '5.0000', '2023-06-13 12:10:29', '2023-06-13 12:10:29'),
(368, 443, 443, 443, 3, '90.0000', '2023-06-13 12:10:29', '2023-06-13 12:10:29'),
(369, 444, 444, 444, 3, '184.0000', '2023-06-13 12:10:29', '2023-06-13 12:10:29'),
(370, 445, 445, 445, 3, '76.0000', '2023-06-13 12:10:29', '2023-06-13 12:10:29'),
(371, 446, 446, 446, 3, '588.0000', '2023-06-13 12:10:29', '2023-06-13 12:10:29'),
(372, 447, 447, 447, 3, '97.0000', '2023-06-13 12:10:29', '2023-06-13 12:10:29'),
(373, 448, 448, 448, 3, '50.0000', '2023-06-13 12:10:29', '2023-06-13 12:10:29'),
(374, 449, 449, 449, 3, '193.0000', '2023-06-13 12:10:29', '2023-06-13 12:10:29'),
(375, 450, 450, 450, 3, '192.0000', '2023-06-13 12:10:29', '2023-06-13 12:10:29'),
(376, 451, 451, 451, 3, '162.0000', '2023-06-13 12:10:29', '2023-06-13 12:10:29'),
(377, 452, 452, 452, 3, '486.0000', '2023-06-13 12:10:29', '2023-06-13 12:10:29'),
(378, 453, 453, 453, 3, '767.0000', '2023-06-13 12:10:29', '2023-06-13 12:10:29'),
(379, 454, 454, 454, 3, '45.0000', '2023-06-13 12:10:29', '2023-06-13 12:10:29'),
(380, 455, 455, 455, 3, '634.0000', '2023-06-13 12:10:29', '2023-06-13 12:10:29'),
(381, 456, 456, 456, 3, '307.0000', '2023-06-13 12:10:29', '2023-06-13 12:10:29'),
(382, 457, 457, 457, 3, '10.0000', '2023-06-13 12:10:29', '2023-06-13 12:10:29'),
(383, 458, 458, 458, 3, '10.0000', '2023-06-13 12:10:29', '2023-06-13 12:10:29'),
(384, 459, 459, 459, 3, '10.0000', '2023-06-13 12:10:29', '2023-06-13 12:10:29'),
(385, 460, 460, 460, 3, '35.0000', '2023-06-13 12:10:29', '2023-06-13 12:10:29'),
(386, 461, 461, 461, 3, '17.0000', '2023-06-13 12:10:29', '2023-06-13 12:10:29'),
(387, 462, 462, 462, 3, '20.0000', '2023-06-13 12:10:29', '2023-06-13 12:10:29'),
(388, 463, 463, 463, 3, '291.0000', '2023-06-13 12:10:29', '2023-06-13 12:10:29'),
(389, 464, 464, 464, 3, '20.0000', '2023-06-13 12:10:29', '2023-06-13 12:10:29'),
(390, 465, 465, 465, 3, '20.0000', '2023-06-13 12:10:29', '2023-06-13 12:10:29'),
(391, 466, 466, 466, 3, '66.0000', '2023-06-13 12:10:29', '2023-06-13 12:10:29'),
(392, 467, 467, 467, 3, '20.0000', '2023-06-13 12:10:29', '2023-06-13 12:10:29'),
(393, 468, 468, 468, 3, '20.0000', '2023-06-13 12:10:29', '2023-06-13 12:10:29'),
(394, 469, 469, 469, 3, '19.0000', '2023-06-13 12:10:29', '2023-06-13 12:58:08'),
(395, 470, 470, 470, 3, '718.0000', '2023-06-13 12:10:29', '2023-06-13 12:10:29'),
(396, 440, 440, 440, 4, '5.0000', '2023-06-14 08:36:48', '2023-06-14 08:36:48'),
(397, 441, 441, 441, 4, '10.0000', '2023-06-14 08:43:50', '2023-06-14 08:43:50'),
(398, 471, 471, 471, 2, '1.0000', '2023-06-17 12:54:47', '2023-06-17 12:54:47'),
(399, 472, 472, 472, 2, '4.0000', '2023-06-17 13:02:17', '2023-06-17 13:02:17'),
(400, 473, 473, 473, 2, '2.0000', '2023-06-17 13:11:49', '2023-06-17 13:11:49');

-- --------------------------------------------------------

--
-- Table structure for table `variation_templates`
--

CREATE TABLE `variation_templates` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `business_id` int UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `variation_value_templates`
--

CREATE TABLE `variation_value_templates` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `variation_template_id` int UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `warranties`
--

CREATE TABLE `warranties` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `business_id` int NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `duration` int NOT NULL,
  `duration_type` enum('days','months','years') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `account_transactions`
--
ALTER TABLE `account_transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `account_transactions_account_id_index` (`account_id`),
  ADD KEY `account_transactions_transaction_id_index` (`transaction_id`),
  ADD KEY `account_transactions_transaction_payment_id_index` (`transaction_payment_id`),
  ADD KEY `account_transactions_transfer_transaction_id_index` (`transfer_transaction_id`),
  ADD KEY `account_transactions_created_by_index` (`created_by`);

--
-- Indexes for table `account_types`
--
ALTER TABLE `account_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `activity_log`
--
ALTER TABLE `activity_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `activity_log_log_name_index` (`log_name`);

--
-- Indexes for table `barcodes`
--
ALTER TABLE `barcodes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `barcodes_business_id_foreign` (`business_id`);

--
-- Indexes for table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bookings_contact_id_foreign` (`contact_id`),
  ADD KEY `bookings_business_id_foreign` (`business_id`),
  ADD KEY `bookings_created_by_foreign` (`created_by`),
  ADD KEY `bookings_table_id_index` (`table_id`),
  ADD KEY `bookings_waiter_id_index` (`waiter_id`),
  ADD KEY `bookings_location_id_index` (`location_id`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`),
  ADD KEY `brands_business_id_foreign` (`business_id`),
  ADD KEY `brands_created_by_foreign` (`created_by`);

--
-- Indexes for table `business`
--
ALTER TABLE `business`
  ADD PRIMARY KEY (`id`),
  ADD KEY `business_owner_id_foreign` (`owner_id`),
  ADD KEY `business_currency_id_foreign` (`currency_id`),
  ADD KEY `business_default_sales_tax_foreign` (`default_sales_tax`);

--
-- Indexes for table `business_locations`
--
ALTER TABLE `business_locations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `business_locations_business_id_index` (`business_id`),
  ADD KEY `business_locations_invoice_scheme_id_foreign` (`invoice_scheme_id`),
  ADD KEY `business_locations_invoice_layout_id_foreign` (`invoice_layout_id`);

--
-- Indexes for table `cash_registers`
--
ALTER TABLE `cash_registers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cash_registers_business_id_foreign` (`business_id`),
  ADD KEY `cash_registers_user_id_foreign` (`user_id`),
  ADD KEY `cash_registers_location_id_index` (`location_id`);

--
-- Indexes for table `cash_register_transactions`
--
ALTER TABLE `cash_register_transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cash_register_transactions_cash_register_id_foreign` (`cash_register_id`),
  ADD KEY `cash_register_transactions_transaction_id_index` (`transaction_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categories_business_id_foreign` (`business_id`),
  ADD KEY `categories_created_by_foreign` (`created_by`);

--
-- Indexes for table `categorizables`
--
ALTER TABLE `categorizables`
  ADD KEY `categorizables_categorizable_type_categorizable_id_index` (`categorizable_type`,`categorizable_id`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `contacts_business_id_foreign` (`business_id`),
  ADD KEY `contacts_created_by_foreign` (`created_by`),
  ADD KEY `contacts_type_index` (`type`),
  ADD KEY `contacts_contact_status_index` (`contact_status`);

--
-- Indexes for table `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer_groups`
--
ALTER TABLE `customer_groups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customer_groups_business_id_foreign` (`business_id`);

--
-- Indexes for table `dashboard_configurations`
--
ALTER TABLE `dashboard_configurations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `dashboard_configurations_business_id_foreign` (`business_id`);

--
-- Indexes for table `discounts`
--
ALTER TABLE `discounts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `discounts_business_id_index` (`business_id`),
  ADD KEY `discounts_brand_id_index` (`brand_id`),
  ADD KEY `discounts_category_id_index` (`category_id`),
  ADD KEY `discounts_location_id_index` (`location_id`),
  ADD KEY `discounts_priority_index` (`priority`);

--
-- Indexes for table `document_and_notes`
--
ALTER TABLE `document_and_notes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `document_and_notes_business_id_index` (`business_id`),
  ADD KEY `document_and_notes_notable_id_index` (`notable_id`),
  ADD KEY `document_and_notes_created_by_index` (`created_by`);

--
-- Indexes for table `expense_categories`
--
ALTER TABLE `expense_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `expense_categories_business_id_foreign` (`business_id`);

--
-- Indexes for table `group_sub_taxes`
--
ALTER TABLE `group_sub_taxes`
  ADD KEY `group_sub_taxes_group_tax_id_foreign` (`group_tax_id`),
  ADD KEY `group_sub_taxes_tax_id_foreign` (`tax_id`);

--
-- Indexes for table `invoice_layouts`
--
ALTER TABLE `invoice_layouts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoice_layouts_business_id_foreign` (`business_id`);

--
-- Indexes for table `invoice_schemes`
--
ALTER TABLE `invoice_schemes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoice_schemes_business_id_foreign` (`business_id`);

--
-- Indexes for table `media`
--
ALTER TABLE `media`
  ADD PRIMARY KEY (`id`),
  ADD KEY `media_model_type_model_id_index` (`model_type`,`model_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_type_model_id_index` (`model_type`,`model_id`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_type_model_id_index` (`model_type`,`model_id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`);

--
-- Indexes for table `notification_templates`
--
ALTER TABLE `notification_templates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `printers`
--
ALTER TABLE `printers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `printers_business_id_foreign` (`business_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_brand_id_foreign` (`brand_id`),
  ADD KEY `products_category_id_foreign` (`category_id`),
  ADD KEY `products_sub_category_id_foreign` (`sub_category_id`),
  ADD KEY `products_tax_foreign` (`tax`),
  ADD KEY `products_name_index` (`name`),
  ADD KEY `products_business_id_index` (`business_id`),
  ADD KEY `products_unit_id_index` (`unit_id`),
  ADD KEY `products_created_by_index` (`created_by`),
  ADD KEY `products_warranty_id_index` (`warranty_id`);

--
-- Indexes for table `product_locations`
--
ALTER TABLE `product_locations`
  ADD KEY `product_locations_product_id_index` (`product_id`),
  ADD KEY `product_locations_location_id_index` (`location_id`);

--
-- Indexes for table `product_racks`
--
ALTER TABLE `product_racks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_variations`
--
ALTER TABLE `product_variations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_variations_name_index` (`name`),
  ADD KEY `product_variations_product_id_index` (`product_id`);

--
-- Indexes for table `purchase_lines`
--
ALTER TABLE `purchase_lines`
  ADD PRIMARY KEY (`id`),
  ADD KEY `purchase_lines_transaction_id_foreign` (`transaction_id`),
  ADD KEY `purchase_lines_product_id_foreign` (`product_id`),
  ADD KEY `purchase_lines_variation_id_foreign` (`variation_id`),
  ADD KEY `purchase_lines_tax_id_foreign` (`tax_id`),
  ADD KEY `purchase_lines_sub_unit_id_index` (`sub_unit_id`),
  ADD KEY `purchase_lines_lot_number_index` (`lot_number`);

--
-- Indexes for table `reference_counts`
--
ALTER TABLE `reference_counts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `res_product_modifier_sets`
--
ALTER TABLE `res_product_modifier_sets`
  ADD KEY `res_product_modifier_sets_modifier_set_id_foreign` (`modifier_set_id`);

--
-- Indexes for table `res_tables`
--
ALTER TABLE `res_tables`
  ADD PRIMARY KEY (`id`),
  ADD KEY `res_tables_business_id_foreign` (`business_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `roles_business_id_foreign` (`business_id`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `selling_price_groups`
--
ALTER TABLE `selling_price_groups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `selling_price_groups_business_id_foreign` (`business_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD UNIQUE KEY `sessions_id_unique` (`id`);

--
-- Indexes for table `stock_adjustment_lines`
--
ALTER TABLE `stock_adjustment_lines`
  ADD PRIMARY KEY (`id`),
  ADD KEY `stock_adjustment_lines_product_id_foreign` (`product_id`),
  ADD KEY `stock_adjustment_lines_variation_id_foreign` (`variation_id`),
  ADD KEY `stock_adjustment_lines_transaction_id_index` (`transaction_id`);

--
-- Indexes for table `system`
--
ALTER TABLE `system`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tax_rates`
--
ALTER TABLE `tax_rates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tax_rates_business_id_foreign` (`business_id`),
  ADD KEY `tax_rates_created_by_foreign` (`created_by`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transactions_tax_id_foreign` (`tax_id`),
  ADD KEY `transactions_business_id_index` (`business_id`),
  ADD KEY `transactions_type_index` (`type`),
  ADD KEY `transactions_contact_id_index` (`contact_id`),
  ADD KEY `transactions_transaction_date_index` (`transaction_date`),
  ADD KEY `transactions_created_by_index` (`created_by`),
  ADD KEY `transactions_location_id_index` (`location_id`),
  ADD KEY `transactions_expense_for_foreign` (`expense_for`),
  ADD KEY `transactions_expense_category_id_index` (`expense_category_id`),
  ADD KEY `transactions_sub_type_index` (`sub_type`),
  ADD KEY `transactions_return_parent_id_index` (`return_parent_id`),
  ADD KEY `type` (`type`);

--
-- Indexes for table `transaction_payments`
--
ALTER TABLE `transaction_payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transaction_payments_transaction_id_foreign` (`transaction_id`),
  ADD KEY `transaction_payments_created_by_index` (`created_by`),
  ADD KEY `transaction_payments_parent_id_index` (`parent_id`);

--
-- Indexes for table `transaction_sell_lines`
--
ALTER TABLE `transaction_sell_lines`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transaction_sell_lines_transaction_id_foreign` (`transaction_id`),
  ADD KEY `transaction_sell_lines_product_id_foreign` (`product_id`),
  ADD KEY `transaction_sell_lines_variation_id_foreign` (`variation_id`),
  ADD KEY `transaction_sell_lines_tax_id_foreign` (`tax_id`),
  ADD KEY `transaction_sell_lines_children_type_index` (`children_type`),
  ADD KEY `transaction_sell_lines_parent_sell_line_id_index` (`parent_sell_line_id`);

--
-- Indexes for table `transaction_sell_lines_purchase_lines`
--
ALTER TABLE `transaction_sell_lines_purchase_lines`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sell_line_id` (`sell_line_id`),
  ADD KEY `stock_adjustment_line_id` (`stock_adjustment_line_id`),
  ADD KEY `purchase_line_id` (`purchase_line_id`);

--
-- Indexes for table `types_of_services`
--
ALTER TABLE `types_of_services`
  ADD PRIMARY KEY (`id`),
  ADD KEY `types_of_services_business_id_index` (`business_id`);

--
-- Indexes for table `units`
--
ALTER TABLE `units`
  ADD PRIMARY KEY (`id`),
  ADD KEY `units_business_id_foreign` (`business_id`),
  ADD KEY `units_created_by_foreign` (`created_by`),
  ADD KEY `units_base_unit_id_index` (`base_unit_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_username_unique` (`username`),
  ADD KEY `users_business_id_foreign` (`business_id`),
  ADD KEY `users_user_type_index` (`user_type`);

--
-- Indexes for table `user_contact_access`
--
ALTER TABLE `user_contact_access`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `variations`
--
ALTER TABLE `variations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `variations_product_id_foreign` (`product_id`),
  ADD KEY `variations_product_variation_id_foreign` (`product_variation_id`),
  ADD KEY `variations_name_index` (`name`),
  ADD KEY `variations_sub_sku_index` (`sub_sku`),
  ADD KEY `variations_variation_value_id_index` (`variation_value_id`);

--
-- Indexes for table `variation_group_prices`
--
ALTER TABLE `variation_group_prices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `variation_group_prices_variation_id_foreign` (`variation_id`),
  ADD KEY `variation_group_prices_price_group_id_foreign` (`price_group_id`);

--
-- Indexes for table `variation_location_details`
--
ALTER TABLE `variation_location_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `variation_location_details_location_id_foreign` (`location_id`),
  ADD KEY `variation_location_details_product_id_index` (`product_id`),
  ADD KEY `variation_location_details_product_variation_id_index` (`product_variation_id`),
  ADD KEY `variation_location_details_variation_id_index` (`variation_id`);

--
-- Indexes for table `variation_templates`
--
ALTER TABLE `variation_templates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `variation_templates_business_id_foreign` (`business_id`);

--
-- Indexes for table `variation_value_templates`
--
ALTER TABLE `variation_value_templates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `variation_value_templates_name_index` (`name`),
  ADD KEY `variation_value_templates_variation_template_id_index` (`variation_template_id`);

--
-- Indexes for table `warranties`
--
ALTER TABLE `warranties`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accounts`
--
ALTER TABLE `accounts`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `account_transactions`
--
ALTER TABLE `account_transactions`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `account_types`
--
ALTER TABLE `account_types`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `activity_log`
--
ALTER TABLE `activity_log`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `barcodes`
--
ALTER TABLE `barcodes`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `business`
--
ALTER TABLE `business`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `business_locations`
--
ALTER TABLE `business_locations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `cash_registers`
--
ALTER TABLE `cash_registers`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `cash_register_transactions`
--
ALTER TABLE `cash_register_transactions`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=99;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `currencies`
--
ALTER TABLE `currencies`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=141;

--
-- AUTO_INCREMENT for table `customer_groups`
--
ALTER TABLE `customer_groups`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dashboard_configurations`
--
ALTER TABLE `dashboard_configurations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `discounts`
--
ALTER TABLE `discounts`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `document_and_notes`
--
ALTER TABLE `document_and_notes`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `expense_categories`
--
ALTER TABLE `expense_categories`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `invoice_layouts`
--
ALTER TABLE `invoice_layouts`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `invoice_schemes`
--
ALTER TABLE `invoice_schemes`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `media`
--
ALTER TABLE `media`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=233;

--
-- AUTO_INCREMENT for table `notification_templates`
--
ALTER TABLE `notification_templates`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=84;

--
-- AUTO_INCREMENT for table `printers`
--
ALTER TABLE `printers`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=476;

--
-- AUTO_INCREMENT for table `product_racks`
--
ALTER TABLE `product_racks`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_variations`
--
ALTER TABLE `product_variations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=476;

--
-- AUTO_INCREMENT for table `purchase_lines`
--
ALTER TABLE `purchase_lines`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=406;

--
-- AUTO_INCREMENT for table `reference_counts`
--
ALTER TABLE `reference_counts`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `res_tables`
--
ALTER TABLE `res_tables`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `selling_price_groups`
--
ALTER TABLE `selling_price_groups`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `stock_adjustment_lines`
--
ALTER TABLE `stock_adjustment_lines`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `system`
--
ALTER TABLE `system`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tax_rates`
--
ALTER TABLE `tax_rates`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=465;

--
-- AUTO_INCREMENT for table `transaction_payments`
--
ALTER TABLE `transaction_payments`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `transaction_sell_lines`
--
ALTER TABLE `transaction_sell_lines`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=83;

--
-- AUTO_INCREMENT for table `transaction_sell_lines_purchase_lines`
--
ALTER TABLE `transaction_sell_lines_purchase_lines`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=74;

--
-- AUTO_INCREMENT for table `types_of_services`
--
ALTER TABLE `types_of_services`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `units`
--
ALTER TABLE `units`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `user_contact_access`
--
ALTER TABLE `user_contact_access`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `variations`
--
ALTER TABLE `variations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=476;

--
-- AUTO_INCREMENT for table `variation_group_prices`
--
ALTER TABLE `variation_group_prices`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `variation_location_details`
--
ALTER TABLE `variation_location_details`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=401;

--
-- AUTO_INCREMENT for table `variation_templates`
--
ALTER TABLE `variation_templates`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `variation_value_templates`
--
ALTER TABLE `variation_value_templates`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `warranties`
--
ALTER TABLE `warranties`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `barcodes`
--
ALTER TABLE `barcodes`
  ADD CONSTRAINT `barcodes_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `bookings`
--
ALTER TABLE `bookings`
  ADD CONSTRAINT `bookings_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `bookings_contact_id_foreign` FOREIGN KEY (`contact_id`) REFERENCES `contacts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `bookings_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `brands`
--
ALTER TABLE `brands`
  ADD CONSTRAINT `brands_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `brands_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `business`
--
ALTER TABLE `business`
  ADD CONSTRAINT `business_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`),
  ADD CONSTRAINT `business_default_sales_tax_foreign` FOREIGN KEY (`default_sales_tax`) REFERENCES `tax_rates` (`id`),
  ADD CONSTRAINT `business_owner_id_foreign` FOREIGN KEY (`owner_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `business_locations`
--
ALTER TABLE `business_locations`
  ADD CONSTRAINT `business_locations_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `business_locations_invoice_layout_id_foreign` FOREIGN KEY (`invoice_layout_id`) REFERENCES `invoice_layouts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `business_locations_invoice_scheme_id_foreign` FOREIGN KEY (`invoice_scheme_id`) REFERENCES `invoice_schemes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `cash_registers`
--
ALTER TABLE `cash_registers`
  ADD CONSTRAINT `cash_registers_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cash_registers_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `cash_register_transactions`
--
ALTER TABLE `cash_register_transactions`
  ADD CONSTRAINT `cash_register_transactions_cash_register_id_foreign` FOREIGN KEY (`cash_register_id`) REFERENCES `cash_registers` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `categories_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `contacts`
--
ALTER TABLE `contacts`
  ADD CONSTRAINT `contacts_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `contacts_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `customer_groups`
--
ALTER TABLE `customer_groups`
  ADD CONSTRAINT `customer_groups_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `dashboard_configurations`
--
ALTER TABLE `dashboard_configurations`
  ADD CONSTRAINT `dashboard_configurations_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `expense_categories`
--
ALTER TABLE `expense_categories`
  ADD CONSTRAINT `expense_categories_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `group_sub_taxes`
--
ALTER TABLE `group_sub_taxes`
  ADD CONSTRAINT `group_sub_taxes_group_tax_id_foreign` FOREIGN KEY (`group_tax_id`) REFERENCES `tax_rates` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `group_sub_taxes_tax_id_foreign` FOREIGN KEY (`tax_id`) REFERENCES `tax_rates` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `invoice_layouts`
--
ALTER TABLE `invoice_layouts`
  ADD CONSTRAINT `invoice_layouts_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `invoice_schemes`
--
ALTER TABLE `invoice_schemes`
  ADD CONSTRAINT `invoice_schemes_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `printers`
--
ALTER TABLE `printers`
  ADD CONSTRAINT `printers_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_brand_id_foreign` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `products_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `products_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `products_sub_category_id_foreign` FOREIGN KEY (`sub_category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `products_tax_foreign` FOREIGN KEY (`tax`) REFERENCES `tax_rates` (`id`),
  ADD CONSTRAINT `products_unit_id_foreign` FOREIGN KEY (`unit_id`) REFERENCES `units` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_variations`
--
ALTER TABLE `product_variations`
  ADD CONSTRAINT `product_variations_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `purchase_lines`
--
ALTER TABLE `purchase_lines`
  ADD CONSTRAINT `purchase_lines_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `purchase_lines_tax_id_foreign` FOREIGN KEY (`tax_id`) REFERENCES `tax_rates` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `purchase_lines_transaction_id_foreign` FOREIGN KEY (`transaction_id`) REFERENCES `transactions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `purchase_lines_variation_id_foreign` FOREIGN KEY (`variation_id`) REFERENCES `variations` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `res_product_modifier_sets`
--
ALTER TABLE `res_product_modifier_sets`
  ADD CONSTRAINT `res_product_modifier_sets_modifier_set_id_foreign` FOREIGN KEY (`modifier_set_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `res_tables`
--
ALTER TABLE `res_tables`
  ADD CONSTRAINT `res_tables_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `roles`
--
ALTER TABLE `roles`
  ADD CONSTRAINT `roles_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `selling_price_groups`
--
ALTER TABLE `selling_price_groups`
  ADD CONSTRAINT `selling_price_groups_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `stock_adjustment_lines`
--
ALTER TABLE `stock_adjustment_lines`
  ADD CONSTRAINT `stock_adjustment_lines_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `stock_adjustment_lines_transaction_id_foreign` FOREIGN KEY (`transaction_id`) REFERENCES `transactions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `stock_adjustment_lines_variation_id_foreign` FOREIGN KEY (`variation_id`) REFERENCES `variations` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tax_rates`
--
ALTER TABLE `tax_rates`
  ADD CONSTRAINT `tax_rates_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `tax_rates_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `transactions_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `transactions_contact_id_foreign` FOREIGN KEY (`contact_id`) REFERENCES `contacts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `transactions_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `transactions_expense_category_id_foreign` FOREIGN KEY (`expense_category_id`) REFERENCES `expense_categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `transactions_expense_for_foreign` FOREIGN KEY (`expense_for`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `transactions_location_id_foreign` FOREIGN KEY (`location_id`) REFERENCES `business_locations` (`id`),
  ADD CONSTRAINT `transactions_tax_id_foreign` FOREIGN KEY (`tax_id`) REFERENCES `tax_rates` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `transaction_payments`
--
ALTER TABLE `transaction_payments`
  ADD CONSTRAINT `transaction_payments_transaction_id_foreign` FOREIGN KEY (`transaction_id`) REFERENCES `transactions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `transaction_sell_lines`
--
ALTER TABLE `transaction_sell_lines`
  ADD CONSTRAINT `transaction_sell_lines_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `transaction_sell_lines_tax_id_foreign` FOREIGN KEY (`tax_id`) REFERENCES `tax_rates` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `transaction_sell_lines_transaction_id_foreign` FOREIGN KEY (`transaction_id`) REFERENCES `transactions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `transaction_sell_lines_variation_id_foreign` FOREIGN KEY (`variation_id`) REFERENCES `variations` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `units`
--
ALTER TABLE `units`
  ADD CONSTRAINT `units_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `units_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `variations`
--
ALTER TABLE `variations`
  ADD CONSTRAINT `variations_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `variations_product_variation_id_foreign` FOREIGN KEY (`product_variation_id`) REFERENCES `product_variations` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `variation_group_prices`
--
ALTER TABLE `variation_group_prices`
  ADD CONSTRAINT `variation_group_prices_price_group_id_foreign` FOREIGN KEY (`price_group_id`) REFERENCES `selling_price_groups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `variation_group_prices_variation_id_foreign` FOREIGN KEY (`variation_id`) REFERENCES `variations` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `variation_location_details`
--
ALTER TABLE `variation_location_details`
  ADD CONSTRAINT `variation_location_details_location_id_foreign` FOREIGN KEY (`location_id`) REFERENCES `business_locations` (`id`),
  ADD CONSTRAINT `variation_location_details_variation_id_foreign` FOREIGN KEY (`variation_id`) REFERENCES `variations` (`id`);

--
-- Constraints for table `variation_templates`
--
ALTER TABLE `variation_templates`
  ADD CONSTRAINT `variation_templates_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `variation_value_templates`
--
ALTER TABLE `variation_value_templates`
  ADD CONSTRAINT `variation_value_templates_variation_template_id_foreign` FOREIGN KEY (`variation_template_id`) REFERENCES `variation_templates` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

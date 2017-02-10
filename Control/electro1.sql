-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Feb 09, 2017 at 11:17 PM
-- Server version: 5.7.17-0ubuntu0.16.04.1
-- PHP Version: 7.0.13-0ubuntu0.16.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `electro`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `category_id` int(10) UNSIGNED NOT NULL,
  `category_name` varchar(20) NOT NULL,
  `parent_cat_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `interests`
--

CREATE TABLE `interests` (
  `userinter_id` int(10) UNSIGNED NOT NULL,
  `catinter_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `log`
--

CREATE TABLE `log` (
  `orderlog_id` int(10) UNSIGNED NOT NULL,
  `userlog_id` int(10) UNSIGNED NOT NULL,
  `order_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(10) UNSIGNED NOT NULL,
  `prodorder_id` int(10) UNSIGNED NOT NULL,
  `orderquantity` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(10) UNSIGNED NOT NULL,
  `product_name` varchar(40) NOT NULL,
  `pic_path` varchar(100) NOT NULL,
  `quantity` int(11) NOT NULL,
  `brand` varchar(20) NOT NULL,
  `description` varchar(100) DEFAULT NULL,
  `subcat_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `shopping_cart`
--

CREATE TABLE `shopping_cart` (
  `usercart_id` int(10) UNSIGNED NOT NULL,
  `prodcart_id` int(10) UNSIGNED NOT NULL,
  `order_quantity` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `user_name` varchar(30) NOT NULL,
  `birthday` date NOT NULL,
  `job` varchar(40) NOT NULL,
  `email` varchar(40) NOT NULL,
  `password` varchar(20) NOT NULL,
  `credit` int(11) NOT NULL,
  `address` varchar(100) NOT NULL,
  `delete_admin_id` int(11) DEFAULT NULL,
  `delete_reason` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `interests`
--
ALTER TABLE `interests`
  ADD PRIMARY KEY (`userinter_id`,`catinter_id`),
  ADD KEY `userinter_id` (`userinter_id`),
  ADD KEY `catinter_id` (`catinter_id`);

--
-- Indexes for table `log`
--
ALTER TABLE `log`
  ADD PRIMARY KEY (`orderlog_id`),
  ADD KEY `userlog_id` (`userlog_id`),
  ADD KEY `orderlog_id` (`orderlog_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`,`prodorder_id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `prodorder_id` (`prodorder_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`),
  ADD UNIQUE KEY `cat_id_12` (`subcat_id`),
  ADD KEY `cat_id` (`subcat_id`),
  ADD KEY `cat_id_2` (`subcat_id`),
  ADD KEY `cat_id_3` (`subcat_id`),
  ADD KEY `cat_id_4` (`subcat_id`),
  ADD KEY `cat_id_5` (`subcat_id`),
  ADD KEY `cat_id_6` (`subcat_id`),
  ADD KEY `cat_id_7` (`subcat_id`),
  ADD KEY `cat_id_8` (`subcat_id`),
  ADD KEY `cat_id_9` (`subcat_id`),
  ADD KEY `cat_id_10` (`subcat_id`),
  ADD KEY `cat_id_11` (`subcat_id`);

--
-- Indexes for table `shopping_cart`
--
ALTER TABLE `shopping_cart`
  ADD PRIMARY KEY (`usercart_id`,`prodcart_id`),
  ADD KEY `usercart_id` (`usercart_id`),
  ADD KEY `prodcart_id` (`prodcart_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `category_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `interests`
--
ALTER TABLE `interests`
  ADD CONSTRAINT `interests_ibfk_1` FOREIGN KEY (`userinter_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `interests_ibfk_2` FOREIGN KEY (`catinter_id`) REFERENCES `category` (`category_id`);

--
-- Constraints for table `log`
--
ALTER TABLE `log`
  ADD CONSTRAINT `log_ibfk_1` FOREIGN KEY (`userlog_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `log_ibfk_2` FOREIGN KEY (`orderlog_id`) REFERENCES `orders` (`order_id`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`prodorder_id`) REFERENCES `products` (`product_id`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`subcat_id`) REFERENCES `category` (`category_id`);

--
-- Constraints for table `shopping_cart`
--
ALTER TABLE `shopping_cart`
  ADD CONSTRAINT `shopping_cart_ibfk_1` FOREIGN KEY (`usercart_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `shopping_cart_ibfk_2` FOREIGN KEY (`prodcart_id`) REFERENCES `products` (`product_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

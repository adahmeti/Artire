-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Oct 28, 2021 at 03:34 PM
-- Server version: 5.7.31
-- PHP Version: 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `shopping`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
CREATE TABLE IF NOT EXISTS `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `creationDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updationDate` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `username`, `password`, `creationDate`, `updationDate`) VALUES
(1, 'admin', '202cb962ac59075b964b07152d234b70', '2017-01-24 16:21:18', '22-10-2021 01:47:53 PM');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
CREATE TABLE IF NOT EXISTS `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `categoryName` varchar(255) DEFAULT NULL,
  `categoryDescription` longtext,
  `creationDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updationDate` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `categoryName`, `categoryDescription`, `creationDate`, `updationDate`) VALUES
(3, 'CLOTHING', 'traditional', '2017-01-24 19:17:37', '30-01-2017 12:22:24 AM'),
(4, 'JEWELRY', 'handmade', '2017-01-24 19:19:32', ''),
(5, 'DECORS', 'wood products', '2017-01-24 19:19:54', ''),
(6, 'FOOD', 'mothers food', '2017-02-20 19:18:52', ''),
(7, 'CARE', 'care', '2021-10-21 12:59:50', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

DROP TABLE IF EXISTS `contact`;
CREATE TABLE IF NOT EXISTS `contact` (
  `user_id` int(11) NOT NULL,
  `seller_id` int(11) NOT NULL,
  `subject` longtext,
  `message` longtext,
  PRIMARY KEY (`user_id`,`seller_id`),
  KEY `seller_id` (`seller_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `contact`
--

INSERT INTO `contact` (`user_id`, `seller_id`, `subject`, `message`) VALUES
(3, 1, 'dallame', 'i need a red one'),
(3, 3, 'sda', 'sdfs'),
(5, 1, 'sh', 'askjdh'),
(5, 3, 'hej', 'we need a neclase');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
CREATE TABLE IF NOT EXISTS `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) DEFAULT NULL,
  `productId` varchar(255) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `orderDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `paymentMethod` varchar(50) DEFAULT NULL,
  `orderStatus` varchar(55) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `userId`, `productId`, `quantity`, `orderDate`, `paymentMethod`, `orderStatus`) VALUES
(1, 1, '3', 1, '2017-03-07 19:32:57', 'COD', NULL),
(4, 1, '17', 1, '2017-03-08 16:14:17', 'COD', 'in Process'),
(5, 1, '3', 1, '2017-03-08 19:21:38', 'COD', NULL),
(6, 1, '4', 1, '2017-03-08 19:21:38', 'COD', NULL),
(7, 4, '15', 1, '2021-10-21 09:43:43', 'Debit / Credit card', 'Delivered'),
(8, 4, '2', 45540809, '2021-10-21 10:26:51', 'Internet Banking', 'Delivered'),
(9, 4, '15', 1, '2021-10-21 16:18:43', 'Debit / Credit card', 'Delivered');

-- --------------------------------------------------------

--
-- Table structure for table `ordertrackhistory`
--

DROP TABLE IF EXISTS `ordertrackhistory`;
CREATE TABLE IF NOT EXISTS `ordertrackhistory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderId` int(11) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `remark` mediumtext,
  `postingDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ordertrackhistory`
--

INSERT INTO `ordertrackhistory` (`id`, `orderId`, `status`, `remark`, `postingDate`) VALUES
(1, 3, 'in Process', 'Order has been Shipped.', '2017-03-10 19:36:45'),
(2, 1, 'Delivered', 'Order Has been delivered', '2017-03-10 19:37:31'),
(3, 3, 'Delivered', 'Product delivered successfully', '2017-03-10 19:43:04'),
(4, 4, 'in Process', 'Product ready for Shipping', '2017-03-10 19:50:36'),
(5, 7, 'in Process', 'we r processing', '2021-10-21 09:46:01'),
(6, 7, 'Delivered', 'done', '2021-10-21 09:55:44'),
(7, 8, 'Delivered', 'u dergua', '2021-10-21 13:14:47'),
(8, 9, 'in Process', 'jj', '2021-10-22 07:52:40'),
(9, 9, 'Delivered', 'yes', '2021-10-22 07:52:55');

-- --------------------------------------------------------

--
-- Table structure for table `productreviews`
--

DROP TABLE IF EXISTS `productreviews`;
CREATE TABLE IF NOT EXISTS `productreviews` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `productId` int(11) DEFAULT NULL,
  `quality` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `value` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `summary` varchar(255) DEFAULT NULL,
  `review` longtext,
  `reviewDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `productreviews`
--

INSERT INTO `productreviews` (`id`, `productId`, `quality`, `price`, `value`, `name`, `summary`, `review`, `reviewDate`) VALUES
(2, 3, 4, 5, 5, 'Anuj Kumar', 'BEST PRODUCT FOR ME :)', 'BEST PRODUCT FOR ME :)', '2017-02-26 20:43:57'),
(3, 3, 3, 4, 3, 'Sarita pandey', 'Nice Product', 'Value for money', '2017-02-26 20:52:46'),
(4, 3, 3, 4, 3, 'Sarita pandey', 'Nice Product', 'Value for money', '2017-02-26 20:59:19');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
CREATE TABLE IF NOT EXISTS `products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category` int(11) NOT NULL,
  `subCategory` int(11) DEFAULT NULL,
  `productName` varchar(255) DEFAULT NULL,
  `productCompany` varchar(255) DEFAULT NULL,
  `productPrice` int(11) DEFAULT NULL,
  `productPriceBeforeDiscount` int(11) DEFAULT NULL,
  `productDescription` longtext,
  `productImage1` varchar(255) DEFAULT NULL,
  `productImage2` varchar(255) DEFAULT NULL,
  `productImage3` varchar(255) DEFAULT NULL,
  `shippingCharge` int(11) DEFAULT NULL,
  `productAvailability` varchar(255) DEFAULT NULL,
  `postingDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updationDate` varchar(255) DEFAULT NULL,
  `seller_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `seller_id` (`seller_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `category`, `subCategory`, `productName`, `productCompany`, `productPrice`, `productPriceBeforeDiscount`, `productDescription`, `productImage1`, `productImage2`, `productImage3`, `shippingCharge`, `productAvailability`, `postingDate`, `updationDate`, `seller_id`) VALUES
(1, 4, 2, 'Flower earrings', 'AlDa', 20, 23, '', 'b2v.jpg', 'b2v.jpg', 'b2v.jpg', 0, 'In Stock', '2017-01-30 16:54:35', '', 1),
(15, 3, 8, 'Dallame', 'AlDa', 205, 250, '', 'v2.1.jpg', 'v2.1.jpg', 'v2.jpg', 50, 'In Stock', '2017-02-04 04:35:13', '', 1),
(16, 3, 8, 'Dallame', 'AlDa', 240, 0, '', 'v4.jpg', 'v4.jpg', 'v4.jpg', 0, 'In Stock', '2017-02-04 04:36:23', '', 1),
(17, 5, 9, 'Jeleke', 'AlDa', 300, 400, '', 'v1d.png', 'v1d.png', 'v1d.png', 0, 'In Stock', '2017-02-04 04:40:37', '', 1),
(19, 6, 12, 'Mjalte Terfili', 'AlDa', 60, 50, '', 'f1m.1.png', 'f1m.png', 'f1m.png', 0, 'In Stock', '2017-03-10 20:16:03', '', 3),
(21, 3, 8, 'Dallame', 'AlDa ', 450, 500, 'traditional', 'v1.png', 'v1.1.png', 'v1.2.png', 0, 'In Stock', '2021-10-21 13:07:12', NULL, 1),
(23, 6, 12, 'Mjalte geshtenje', 'AlDa', 40, 50, 'mjalte bio', 'f4m.1.png', '41m.png', 'f4m.1.png', 0, 'In Stock', '2021-10-21 16:24:34', NULL, 3),
(24, 7, 13, 'lavender soap', 'AlDa', 20, 23, 'fresh soap', 'k1.jpg', 'k1.jpg', 'k1.jpg', 0, 'In Stock', '2021-10-21 18:11:23', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `sellers`
--

DROP TABLE IF EXISTS `sellers`;
CREATE TABLE IF NOT EXISTS `sellers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bussines_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `contact_number` int(11) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sellers`
--

INSERT INTO `sellers` (`id`, `bussines_name`, `email`, `contact_number`, `password`) VALUES
(1, 'AlDa', 'altinarexha@gmail.com', 2392391, '69cac4ee00a89948d8b9aa651dd5f752'),
(3, 'Dfood', 'dafina@gmail.com', 34242423, '202cb962ac59075b964b07152d234b70');

-- --------------------------------------------------------

--
-- Table structure for table `subcategory`
--

DROP TABLE IF EXISTS `subcategory`;
CREATE TABLE IF NOT EXISTS `subcategory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `categoryid` int(11) DEFAULT NULL,
  `subcategory` varchar(255) DEFAULT NULL,
  `creationDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updationDate` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `categoryid` (`categoryid`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `subcategory`
--

INSERT INTO `subcategory` (`id`, `categoryid`, `subcategory`, `creationDate`, `updationDate`) VALUES
(2, 4, 'Earrings', '2017-01-26 16:24:52', '21-10-2021 06:28:24 PM'),
(3, 4, 'Varese', '2017-01-26 16:29:09', '21-10-2021 06:25:56 PM'),
(8, 3, 'Women', '2017-02-04 04:13:54', '21-10-2021 06:28:46 PM'),
(9, 3, 'Men', '2017-02-04 04:36:45', '21-10-2021 06:28:56 PM'),
(10, 5, 'Frame', '2017-02-04 04:37:02', '21-10-2021 06:30:51 PM'),
(11, 6, 'Cheese', '2017-02-04 04:37:51', '21-10-2021 06:29:20 PM'),
(12, 6, 'Honey', '2017-03-10 20:12:59', '21-10-2021 06:28:13 PM'),
(13, 7, 'Soaps', '2021-10-21 10:01:52', '21-10-2021 06:30:11 PM'),
(14, 5, 'Carpet', '2021-10-21 13:00:36', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `userlog`
--

DROP TABLE IF EXISTS `userlog`;
CREATE TABLE IF NOT EXISTS `userlog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userEmail` varchar(255) DEFAULT NULL,
  `userip` binary(16) DEFAULT NULL,
  `loginTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `logout` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `userlog`
--

INSERT INTO `userlog` (`id`, `userEmail`, `userip`, `loginTime`, `logout`, `status`) VALUES
(24, 'altinarexha@gmail.com', 0x3a3a3100000000000000000000000000, '2021-10-20 21:01:03', NULL, 1),
(25, 'altinare@gmail.com', 0x3a3a3100000000000000000000000000, '2021-10-21 09:42:48', NULL, 1),
(26, 'altinare@gmail.com', 0x3a3a3100000000000000000000000000, '2021-10-21 10:26:15', NULL, 1),
(27, 'altinare@gmail.com', 0x3a3a3100000000000000000000000000, '2021-10-21 13:20:57', NULL, 1),
(28, 'altinare@gmail.com', 0x3a3a3100000000000000000000000000, '2021-10-21 16:18:27', '21-10-2021 09:49:53 PM', 1),
(29, 'altinare@gmail.com', 0x3a3a3100000000000000000000000000, '2021-10-21 17:02:25', '21-10-2021 10:50:59 PM', 1),
(30, 'altinare@gmail.com', 0x3a3a3100000000000000000000000000, '2021-10-22 07:40:56', '22-10-2021 01:15:58 PM', 1),
(31, 'altinare@gmail.com', 0x3a3a3100000000000000000000000000, '2021-10-22 07:55:54', NULL, 0),
(32, 'altinare@gmail.com', 0x3a3a3100000000000000000000000000, '2021-10-22 07:56:06', NULL, 1),
(33, 'vjosa@gmail.com', 0x3a3a3100000000000000000000000000, '2021-10-22 08:23:25', '22-10-2021 01:53:32 PM', 1),
(34, 'vjosa@gmail.com', 0x3a3a3100000000000000000000000000, '2021-10-22 10:12:39', '22-10-2021 03:44:32 PM', 1),
(35, 'vjosa@gmail.com', 0x3a3a3100000000000000000000000000, '2021-10-22 11:26:01', '22-10-2021 05:09:17 PM', 1),
(36, 'vjosa@gmail.com', 0x3a3a3100000000000000000000000000, '2021-10-22 13:25:16', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `contactno` bigint(11) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `shippingAddress` longtext,
  `shippingState` varchar(255) DEFAULT NULL,
  `shippingCity` varchar(255) DEFAULT NULL,
  `shippingPincode` int(11) DEFAULT NULL,
  `billingAddress` longtext,
  `billingState` varchar(255) DEFAULT NULL,
  `billingCity` varchar(255) DEFAULT NULL,
  `billingPincode` int(11) DEFAULT NULL,
  `regDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updationDate` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `contactno`, `password`, `shippingAddress`, `shippingState`, `shippingCity`, `shippingPincode`, `billingAddress`, `billingState`, `billingCity`, `billingPincode`, `regDate`, `updationDate`) VALUES
(2, 'Amit ', 'amit@gmail.com', 8285703355, '5c428d8875d2948607f3e3fe134d71b4', '', '', '', 0, '', '', '', 0, '2017-03-15 17:21:22', ''),
(3, 'hg', 'hgfhgf@gmass.com', 1121312312, '827ccb0eea8a706c4c34a16891f84e7b', '', '', '', 0, '', '', '', 0, '2018-04-29 09:30:32', ''),
(4, 'altina', 'altinare@gmail.com', 34343434, '6a82d05c0384e2aab0319b02d7ed2358', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-10-21 09:42:27', NULL),
(5, 'Vjosa', 'vjosa@gmail.com', 45453532, '202cb962ac59075b964b07152d234b70', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-10-22 08:23:10', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `wishlist`
--

DROP TABLE IF EXISTS `wishlist`;
CREATE TABLE IF NOT EXISTS `wishlist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) DEFAULT NULL,
  `productId` int(11) DEFAULT NULL,
  `postingDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `wishlist`
--

INSERT INTO `wishlist` (`id`, `userId`, `productId`, `postingDate`) VALUES
(1, 1, 0, '2017-02-27 18:53:17');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `contact`
--
ALTER TABLE `contact`
  ADD CONSTRAINT `contact_ibfk_1` FOREIGN KEY (`seller_id`) REFERENCES `sellers` (`id`),
  ADD CONSTRAINT `contact_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`seller_id`) REFERENCES `sellers` (`id`);

--
-- Constraints for table `subcategory`
--
ALTER TABLE `subcategory`
  ADD CONSTRAINT `subcategory_ibfk_1` FOREIGN KEY (`categoryid`) REFERENCES `category` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

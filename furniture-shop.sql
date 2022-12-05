-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 10, 2022 at 08:42 AM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `furniture-shop`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `image` varchar(100) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `name`, `image`, `email`, `password`) VALUES
(1, 'admin', '', 'admin@gmail.com', 'hamza123');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `cart_id` int(11) NOT NULL,
  `cust_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`cart_id`, `cust_id`, `product_id`, `quantity`) VALUES
(28, 5, 42, 1),
(86, 4, 42, 1),
(87, 4, 40, 1),
(88, 4, 41, 1),
(89, 4, 37, 1),
(90, 5, 40, 1),
(91, 5, 13, 1);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `category` varchar(100) CHARACTER SET latin1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `category`) VALUES
(1, 'bed set'),
(2, 'Dining set'),
(3, 'Chairs'),
(4, 'Table'),
(5, 'Sofa'),
(6, 'cupboard'),
(9, 'abc');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `cust_id` int(11) NOT NULL,
  `cust_name` varchar(100) NOT NULL,
  `cust_email` varchar(100) NOT NULL,
  `cust_pass` varchar(100) NOT NULL,
  `cust_add` varchar(200) NOT NULL,
  `cust_city` varchar(50) NOT NULL,
  `cust_postalcode` varchar(50) NOT NULL,
  `cust_number` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`cust_id`, `cust_name`, `cust_email`, `cust_pass`, `cust_add`, `cust_city`, `cust_postalcode`, `cust_number`) VALUES
(4, 'Hamza Mughal', 'mhamzaq869@gmail.com', '11111111', 'h#3,St#62,area dar ul islam', 'lahore', '54810', '03077087412'),
(5, 'demo', 'demo@gmail.com', '11111111', 'lahore cantt', 'lahore', '54840', '03224987258'),
(6, 'nam', 'phanvannam03030@gmail.com', '11111111', '185 Lê Duẩn', 'dn', '204', '1234567890'),
(7, 'nam', 'phanvannam03030@gmail.com', '11111111', '185 Lê Duẩn', 'dn', '204', '1234567890'),
(8, 'nam124313', 'nam@gmail.com', '11111111', 'dn2323', 'dn', '23', '123456789');

-- --------------------------------------------------------

--
-- Table structure for table `customer_order`
--

CREATE TABLE `customer_order` (
  `order_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `customer_email` varchar(100) NOT NULL,
  `customer_fullname` varchar(100) NOT NULL,
  `customer_address` varchar(225) NOT NULL,
  `customer_city` varchar(50) NOT NULL,
  `customer_pcode` int(11) NOT NULL,
  `customer_phonenumber` varchar(100) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_amount` int(11) NOT NULL,
  `invoice_no` int(11) NOT NULL,
  `products_qty` int(11) NOT NULL,
  `order_date` varchar(100) NOT NULL,
  `order_status` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer_order`
--

INSERT INTO `customer_order` (`order_id`, `customer_id`, `customer_email`, `customer_fullname`, `customer_address`, `customer_city`, `customer_pcode`, `customer_phonenumber`, `product_id`, `product_amount`, `invoice_no`, `products_qty`, `order_date`, `order_status`) VALUES
(65, 4, 'mhamzaq869@gmail.com', 'muhammad hamza qadri', 'h#3,St#62,area dar ul islam', 'lahore', 54810, '03077087412', 4, 22000, 1767434801, 1, '11-08-2020', 'verified'),
(66, 4, 'mhamzaq869@gmail.com', 'muhammad hamza qadri', 'h#3,St#62,area dar ul islam', 'lahore', 54810, '03077087412', 4, 22000, 1945132454, 1, '18-08-2020', 'delivered'),
(67, 4, 'mhamzaq869@gmail.com', 'muhammad hamza qadri', 'h#3,St#62,area dar ul islam', 'lahore', 54810, '03077087412', 5, 19000, 1945132454, 1, '18-08-2020', 'verified'),
(68, 4, 'mhamzaq869@gmail.com', 'muhammad hamza qadri', 'h#3,St#62,area dar ul islam', 'lahore', 54810, '03077087412', 41, 12050, 1773695355, 1, '21-08-2020', 'pending'),
(69, 4, 'mhamzaq869@gmail.com', 'muhammad hamza qadri', 'h#3,St#62,area dar ul islam', 'lahore', 54810, '03077087412', 35, 54050, 1773695355, 1, '21-08-2020', 'pending'),
(70, 4, 'mhamzaq869@gmail.com', 'muhammad hamza qadri', 'h#3,St#62,area dar ul islam', 'lahore', 54810, '03077087412', 34, 14600, 1773695355, 1, '21-08-2020', 'delivered'),
(71, 5, 'demo@gmail.com', 'demo', 'lahore cantt', 'lahore', 54840, '03224987258', 39, 49800, 1637501531, 2, '23-08-2020', 'pending'),
(72, 5, 'demo@gmail.com', 'demo', 'lahore cantt', 'lahore', 54840, '03224987258', 32, 65000, 1637501531, 1, '23-08-2020', 'pending'),
(73, 5, 'demo@gmail.com', 'demo', 'lahore cantt', 'lahore', 54840, '03224987258', 34, 14600, 1637501531, 1, '23-08-2020', 'pending'),
(74, 6, 'phanvannam03030@gmail.com', 'nam', '185 Lê Du?n', 'dn', 204, '1234567890', 42, 12050, 346693241, 1, '10-11-2022', 'pending'),
(75, 7, 'phanvannam03030@gmail.com', 'nam', '185 Lê Du?n', 'dn', 204, '1234567890', 42, 24100, 1020474244, 2, '10-11-2022', 'delivered'),
(76, 8, 'nam@gmail.com', 'nam', 'dn', 'dn', 23, '123456789', 42, 12050, 1124586425, 1, '10-11-2022', 'delivered');

-- --------------------------------------------------------

--
-- Table structure for table `furniture_product`
--

CREATE TABLE `furniture_product` (
  `pid` int(11) NOT NULL,
  `title` varchar(80) NOT NULL,
  `category` int(11) NOT NULL,
  `detail` text NOT NULL,
  `price` int(11) NOT NULL,
  `size` varchar(40) NOT NULL,
  `image` varchar(200) NOT NULL,
  `date` varchar(100) NOT NULL,
  `status` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `furniture_product`
--

INSERT INTO `furniture_product` (`pid`, `title`, `category`, `detail`, `price`, `size`, `image`, `date`, `status`) VALUES
(31, 'Mocca Double Bed', 1, '<p>A haven of peace, comfort, and durability, Haven makes its hard to get up in the morning. The soothing appeal that comes off with the fine upholstery in white, it simply takes you to heaven!</p>\r\n', 68500, '80w x 33h', '36_60ec496a-a99e-4f51-bd5a-d33c003218ad_1024x1024.jpg', '21-08-2020', 'publish'),
(32, 'Spruce Double Bed', 1, '<p>This elegant bed is a simple yet aesthetic design that would make a gorgeous choice for your bedroom. </p>\r\n', 65000, '50w X 35h', '32aaaaa_1024x1024.jpg', '21-08-2020', 'publish'),
(33, 'Meyer Bed Set', 1, '<p>Leatheriod Kikar wood +MDF (without mattress)</p>\r\n', 92250, '60w X 35h', '10_c3e2fbce-3ef1-4566-a44e-2d53c7be4cf5_1024x1024.webp', '21-08-2020', 'publish'),
(34, 'Aurore Dining Table', 2, '<p>Material:Dining Table glass top size 4.5x2.5 legs made of solid wood with black polish. Hieght: 30 Inches Width: 31 Inches Length: 53.5 Inches</p>\r\n', 14600, '31w x 53.5h', 'AURORE_9646f9ee-7510-406a-b2c4-72b8bfb62501_1024x1024.webp', '21-08-2020', 'publish'),
(35, 'Raimi Dining Set', 2, '<p>Table Height: 29 inchesWidth: 36 inchesMaterial: Melamine faced water and heat resistant MDF and iron legsChair Height: 27 inchesWidth: 16 inches</p>\r\n', 54050, '27w x 16h', 'raimi_2_14e717a7-b66f-471c-9f7d-70d564968d3e_1024x1024.webp', '21-08-2020', 'publish'),
(36, 'Tapert Dining Set-Black', 2, '<p>Table Height: 30 inchesWidth: 34 inchesMaterial: Melamine faced water and heat resistant MDF and beechwood legsChair Height: 39 inchesWidth: 19 inchesMaterial: Beechwood legs, Foam padded PU leather upholstery.</p>\r\n', 54550, '39w x 19h', 'tapert_black_3_148f8213-457b-491d-9434-6cd40cc16471_1024x1024.webp', '21-08-2020', 'publish'),
(37, 'Tapert Dining Set-White', 2, '<p>Table Height: 30 inchesWidth: 34 inchesMaterial: Melamine faced water and heat resistant MDF and beechwood legsChair Height: 39 inchesWidth: 19 inchesMaterial: Beechwood legs, Foam padded PU leather upholstery.</p>\r\n', 57000, '39w x 19h', 'tapert_a5df0f6b-6717-4707-abe7-da623cdcdf2c_1024x1024.webp', '21-08-2020', 'publish'),
(38, 'Sienna Table', 2, '<p>Height: 31 inchesLength: 48 inchesWidth: 24 inches</p>\r\n', 27150, '75w x 24h', 'SIENNA_3c7d4f3f-9d24-4fa2-93f3-4430ca022f8b_1024x1024.webp', '21-08-2020', 'publish'),
(39, 'Lorenzo Table', 4, '<p>Top made of MDF covered with PVC paper having four stools, frame made of MS pipe powder coated black color.</p>\r\n', 24900, '25w X 22h', 'coffee-table-design-glass-and-wood-scandinavian-fiord-l-110xp60xh45cm.jpg', '21-08-2020', 'publish'),
(40, 'Estela Table', 4, '<p>Height: 4 inches. Width: 20 inches. Length: 5.5 inches.Top made of printed tempered glass, legs made of MS pipe powder coated black color.</p>\r\n', 12400, '20w x 4h', 'aza_1024x1024.jpg', '21-08-2020', 'publish'),
(41, 'Diogo Table', 1, '<p>Height: 4 inches. Width: 18 inches. Length: 8 inches. Top made of MDF wood texture, legs made of MS powder coated black.</p>\r\n', 12050, '18w x 4h', 'FC-FUR-BS-510_1024x1024.jpg', '21-08-2020', 'publish'),
(42, 'Erico Table', 4, '<p>Height: 4 inches. Width: 20 inches. Length: 5.5 inches.Top made of printed tempered glass, legs made of MS pipe powder coated black color.</p>\r\n', 12050, '20w X 5.5h', 'sads_1024x1024.jpg', '21-08-2020', 'publish'),
(43, '1', 3, '<p>ewtegsrhrhrsthsh</p>\r\n', 222222, '24 24', 'sads_1024x1024.jpg', '10-11-2022', 'publish');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`cart_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`cust_id`);

--
-- Indexes for table `customer_order`
--
ALTER TABLE `customer_order`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `customer_id` (`customer_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `furniture_product`
--
ALTER TABLE `furniture_product`
  ADD PRIMARY KEY (`pid`),
  ADD KEY `category` (`category`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `cart_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=95;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `cust_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `customer_order`
--
ALTER TABLE `customer_order`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=77;

--
-- AUTO_INCREMENT for table `furniture_product`
--
ALTER TABLE `furniture_product`
  MODIFY `pid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

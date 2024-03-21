
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
CREATE TABLE IF NOT EXISTS `customers` (
  `customer_id` int NOT NULL,
  `cust_name` text NOT NULL,
  `city` text NOT NULL,
  `grade` int NOT NULL,
  `salesman_id` int NOT NULL,
  PRIMARY KEY (`customer_id`),
  KEY `customers_ibfk_1` (`salesman_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`customer_id`, `cust_name`, `city`, `grade`, `salesman_id`) VALUES
(1, 'Sarif', 'Mysuru', 50, 1),
(2, 'Hirwani', 'Bengaluru', 48, 2),
(3, 'Lewis', 'Bengaluru', 44, 2),
(4, 'Surya', 'Bengaluru', 60, 3),
(5, 'Haseena', 'Mysuru', 50, 5),
(6, 'Paseena', 'Mangaluru', 45, 4);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
CREATE TABLE IF NOT EXISTS `orders` (
  `ord_no` int NOT NULL,
  `purchase_amt` int NOT NULL,
  `ord_date` date NOT NULL,
  `customer_id` int NOT NULL,
  `salesman_id` int NOT NULL,
  PRIMARY KEY (`ord_no`),
  KEY `customer_id` (`customer_id`),
  KEY `orders_ibfk_2` (`salesman_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`ord_no`, `purchase_amt`, `ord_date`, `customer_id`, `salesman_id`) VALUES
(1, 400, '2021-10-17', 3, 1),
(2, 400, '2021-10-18', 1, 1),
(3, 800, '2021-10-15', 5, 4),
(4, 1800, '2021-09-15', 3, 3),
(5, 1200, '2021-09-16', 3, 3);

-- --------------------------------------------------------

--
-- Table structure for table `salesman`
--

DROP TABLE IF EXISTS `salesman`;
CREATE TABLE IF NOT EXISTS `salesman` (
  `salesman_id` int NOT NULL,
  `name` text NOT NULL,
  `city` text NOT NULL,
  `commission` int NOT NULL,
  PRIMARY KEY (`salesman_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `salesman`
--

INSERT INTO `salesman` (`salesman_id`, `name`, `city`, `commission`) VALUES
(1, 'Amar', 'Bengaluru', 12),
(2, 'Akbar', 'Mysuru', 10),
(3, 'Sony', 'Bengaluru', 8),
(4, 'Tony', 'Mysuru', 11),
(5, 'Penga', 'Mangaluru', 8);

-- --------------------------------------------------------

--
-- Stand-in structure for view `sps`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `sps`;
CREATE TABLE IF NOT EXISTS `sps` (
`salesman_id` int
,`ord_date` date
,`SP` decimal(32,0)
);

-- --------------------------------------------------------

--
-- Structure for view `sps`
--
DROP TABLE IF EXISTS `sps`;

DROP VIEW IF EXISTS `sps`;
CREATE  SQL SECURITY DEFINER VIEW `sps`  AS SELECT `o`.`salesman_id` AS `salesman_id`, `o`.`ord_date` AS `ord_date`, sum(`o`.`purchase_amt`) AS `SP` FROM `orders` AS `o` GROUP BY `o`.`salesman_id`, `o`.`ord_date` ORDER BY `SP` DESC LIMIT 0, 1 ;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `customers`
--
ALTER TABLE `customers`
  ADD CONSTRAINT `customers_ibfk_1` FOREIGN KEY (`salesman_id`) REFERENCES `salesman` (`salesman_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`salesman_id`) REFERENCES `salesman` (`salesman_id`) ON DELETE CASCADE ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

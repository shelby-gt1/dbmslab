
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
CREATE TABLE IF NOT EXISTS `department` (
  `dno` int NOT NULL,
  `dname` text NOT NULL,
  `mgrstartdate` date NOT NULL,
  `mgrssn` int NOT NULL,
  PRIMARY KEY (`dno`),
  KEY `mgrssn` (`mgrssn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`dno`, `dname`, `mgrstartdate`, `mgrssn`) VALUES
(1, 'Accounts', '2023-10-06', 101),
(2, 'CSE', '2023-10-05', 101),
(3, 'ISE', '2023-10-05', 107),
(4, 'AIML', '2023-10-05', 108),
(5, 'ECE', '2023-10-05', 103);

-- --------------------------------------------------------

--
-- Table structure for table `dlocation`
--

DROP TABLE IF EXISTS `dlocation`;
CREATE TABLE IF NOT EXISTS `dlocation` (
  `dno` int NOT NULL,
  `dloc` varchar(100) NOT NULL,
  PRIMARY KEY (`dno`,`dloc`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `dlocation`
--

INSERT INTO `dlocation` (`dno`, `dloc`) VALUES
(1, 'ADBLOCK'),
(2, 'CSBLOCK'),
(3, 'ECEBLOCK'),
(4, 'LIBBLOCK'),
(5, 'ECEBLOCK');

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
CREATE TABLE IF NOT EXISTS `employee` (
  `ssn` int NOT NULL,
  `name` text NOT NULL,
  `address` text NOT NULL,
  `sex` text NOT NULL,
  `salary` int NOT NULL,
  `superssn` int DEFAULT NULL,
  `dno` int DEFAULT NULL,
  PRIMARY KEY (`ssn`),
  KEY `dno` (`dno`),
  KEY `superssn` (`superssn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`ssn`, `name`, `address`, `sex`, `salary`, `superssn`, `dno`) VALUES
(101, 'Scott', 'KPNagar', 'Male', 800000, NULL, 1),
(102, 'Sherlin', 'KRNagar', 'Female', 700000, 101, 1),
(103, 'Romy', 'KRNagar', 'Male', 400000, 101, 1),
(104, 'Puma', 'KRNagar', 'Male', 140000, 103, 1),
(105, 'Ruma', 'KRNagar', 'Male', 600000, 103, 1),
(106, 'Laks', 'KRNagar', 'Female', 400000, 105, 1),
(107, 'Smith', 'KRNagar', 'Male', 400000, 102, 2),
(108, 'Eliana', 'KRNagar', 'Female', 800000, 102, 2);

-- --------------------------------------------------------

--
-- Table structure for table `project`
--

DROP TABLE IF EXISTS `project`;
CREATE TABLE IF NOT EXISTS `project` (
  `pno` int NOT NULL,
  `pname` text NOT NULL,
  `ploc` text NOT NULL,
  `dno` int NOT NULL,
  PRIMARY KEY (`pno`),
  KEY `dno` (`dno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `project`
--

INSERT INTO `project` (`pno`, `pname`, `ploc`, `dno`) VALUES
(1, 'IoT', 'X', 1),
(2, 'Project2', 'Y', 2),
(3, 'BigData', 'Y', 5),
(4, 'NLP', 'Y', 5),
(5, 'GAI', 'Y', 5);

-- --------------------------------------------------------

--
-- Table structure for table `workson`
--

DROP TABLE IF EXISTS `workson`;
CREATE TABLE IF NOT EXISTS `workson` (
  `ssn` int NOT NULL,
  `pno` int NOT NULL,
  `hours` int NOT NULL,
  PRIMARY KEY (`ssn`,`pno`),
  KEY `pno` (`pno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `workson`
--

INSERT INTO `workson` (`ssn`, `pno`, `hours`) VALUES
(101, 1, 5),
(101, 3, 3),
(102, 2, 5),
(103, 1, 5),
(103, 3, 5),
(103, 4, 4),
(103, 5, 1);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `department`
--
ALTER TABLE `department`
  ADD CONSTRAINT `department_ibfk_1` FOREIGN KEY (`mgrssn`) REFERENCES `employee` (`ssn`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `employee`
--
ALTER TABLE `employee`
  ADD CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`dno`) REFERENCES `department` (`dno`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `employee_ibfk_2` FOREIGN KEY (`superssn`) REFERENCES `employee` (`ssn`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `project`
--
ALTER TABLE `project`
  ADD CONSTRAINT `project_ibfk_1` FOREIGN KEY (`dno`) REFERENCES `department` (`dno`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `workson`
--
ALTER TABLE `workson`
  ADD CONSTRAINT `workson_ibfk_1` FOREIGN KEY (`pno`) REFERENCES `project` (`pno`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

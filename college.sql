SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

-- --------------------------------------------------------

--
-- Table structure for table `class`
--

DROP TABLE IF EXISTS `class`;
CREATE TABLE IF NOT EXISTS `class` (
  `usn` varchar(30) NOT NULL,
  `ssid` int NOT NULL,
  PRIMARY KEY (`usn`,`ssid`),
  KEY `ssid` (`ssid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `class`
--

INSERT INTO `class` (`usn`, `ssid`) VALUES
('4JN21AI001', 1),
('4JN21AI002', 2),
('4JN21AI003', 2),
('4JN21AI004', 4),
('4JN21AI005', 4);

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
CREATE TABLE IF NOT EXISTS `course` (
  `subcode` varchar(50) NOT NULL,
  `title` text NOT NULL,
  `sem` int NOT NULL,
  `credits` int NOT NULL,
  PRIMARY KEY (`subcode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `course`
--

INSERT INTO `course` (`subcode`, `title`, `sem`, `credits`) VALUES
('21AI64', 'PAI', 6, 3),
('21CS42', 'DSA', 4, 3),
('21CS61', 'ATC', 6, 3),
('21CS62', 'CN', 6, 5),
('21CS63', 'DBMS', 6, 3),
('21CS81', 'RI', 8, 3),
('21CS82', 'NLP', 8, 5);

-- --------------------------------------------------------

--
-- Stand-in structure for view `iam`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `iam`;
CREATE TABLE IF NOT EXISTS `iam` (
`subcode` varchar(50)
,`test1` int
);

-- --------------------------------------------------------

--
-- Table structure for table `iamarks`
--

DROP TABLE IF EXISTS `iamarks`;
CREATE TABLE IF NOT EXISTS `iamarks` (
  `usn` varchar(30) NOT NULL,
  `subcode` varchar(50) NOT NULL,
  `ssid` int NOT NULL,
  `test1` int NOT NULL,
  `test2` int NOT NULL,
  `test3` int NOT NULL,
  `finalia` int NOT NULL,
  PRIMARY KEY (`usn`,`subcode`,`ssid`),
  KEY `subcode` (`subcode`),
  KEY `ssid` (`ssid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `iamarks`
--

INSERT INTO `iamarks` (`usn`, `subcode`, `ssid`, `test1`, `test2`, `test3`, `finalia`) VALUES
('1BI15CS101', '21CS42', 5, 17, 20, 15, 19),
('1BI15CS101', '21CS62', 4, 19, 20, 15, 20),
('1BI15CS101', '21CS63', 5, 17, 19, 15, 18),
('4JN21AI001', '21AI64', 1, 18, 14, 16, 17),
('4JN21AI001', '21CS61', 1, 18, 13, 19, 19),
('4JN21AI002', '21CS81', 2, 17, 13, 11, 15),
('4JN21AI002', '21CS82', 2, 17, 15, 15, 16),
('4JN21AI005', '21CS42', 4, 17, 20, 15, 19);

-- --------------------------------------------------------

--
-- Table structure for table `semsec`
--

DROP TABLE IF EXISTS `semsec`;
CREATE TABLE IF NOT EXISTS `semsec` (
  `ssid` int NOT NULL,
  `sem` int NOT NULL,
  `sec` varchar(10) NOT NULL,
  PRIMARY KEY (`ssid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `semsec`
--

INSERT INTO `semsec` (`ssid`, `sem`, `sec`) VALUES
(1, 8, 'A'),
(2, 8, 'A'),
(3, 4, 'B'),
(4, 4, 'C'),
(5, 4, 'C');

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
CREATE TABLE IF NOT EXISTS `student` (
  `usn` varchar(30) NOT NULL,
  `sname` text NOT NULL,
  `address` text NOT NULL,
  `phone` bigint NOT NULL,
  `gender` text NOT NULL,
  PRIMARY KEY (`usn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`usn`, `sname`, `address`, `phone`, `gender`) VALUES
('1BI15CS101', 'Bora', 'Banglore', 9000910006, 'Male'),
('4JN21AI001', 'Alia', 'JNNCE', 9000910001, 'Female'),
('4JN21AI002', 'Sam', 'JNNCE', 9000910003, 'Male'),
('4JN21AI003', 'Avin', 'JNNCE', 9000910003, 'Male'),
('4JN21AI004', 'Romy', 'JNNCE', 9000910004, 'Female'),
('4JN21AI005', 'Pommy', 'JNNCE', 9000910005, 'Female');

-- --------------------------------------------------------

--
-- Structure for view `iam`
--
DROP TABLE IF EXISTS `iam`;

DROP VIEW IF EXISTS `iam`;
CREATE ALGORITHM=UNDEFINED DEFINER SQL SECURITY DEFINER VIEW `iam`  AS SELECT `i`.`subcode` AS `subcode`, `i`.`test1` AS `test1` FROM `iamarks` AS `i` WHERE (`i`.`usn` = '1BI15CS101') ;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `class`
--
ALTER TABLE `class`
  ADD CONSTRAINT `class_ibfk_1` FOREIGN KEY (`usn`) REFERENCES `student` (`usn`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `class_ibfk_2` FOREIGN KEY (`ssid`) REFERENCES `semsec` (`ssid`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `iamarks`
--
ALTER TABLE `iamarks`
  ADD CONSTRAINT `iamarks_ibfk_1` FOREIGN KEY (`usn`) REFERENCES `student` (`usn`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `iamarks_ibfk_2` FOREIGN KEY (`subcode`) REFERENCES `course` (`subcode`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `iamarks_ibfk_3` FOREIGN KEY (`ssid`) REFERENCES `semsec` (`ssid`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

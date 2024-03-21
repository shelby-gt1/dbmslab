SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

-- --------------------------------------------------------

--
-- Table structure for table `actor`
--

DROP TABLE IF EXISTS `actor`;
CREATE TABLE IF NOT EXISTS `actor` (
  `act_id` int NOT NULL,
  `act_name` text NOT NULL,
  `act_gender` text NOT NULL,
  PRIMARY KEY (`act_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `actor`
--

INSERT INTO `actor` (`act_id`, `act_name`, `act_gender`) VALUES
(1, 'Sherlock', 'Male'),
(2, 'Shilly', 'Female'),
(3, 'Romy', 'Male'),
(4, 'Paru', 'Female'),
(5, 'Subbu', 'Male');

-- --------------------------------------------------------

--
-- Table structure for table `director`
--

DROP TABLE IF EXISTS `director`;
CREATE TABLE IF NOT EXISTS `director` (
  `dir_id` int NOT NULL,
  `dir_name` text NOT NULL,
  `dir_phone` bigint NOT NULL,
  PRIMARY KEY (`dir_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `director`
--

INSERT INTO `director` (`dir_id`, `dir_name`, `dir_phone`) VALUES
(1, 'Hitchcock', 9900923001),
(2, 'Steven Spielberg', 9900923002),
(3, 'Karan', 9900923003),
(4, 'Monika', 9900923004),
(5, 'Kapil', 9900923005);

-- --------------------------------------------------------

--
-- Table structure for table `movies`
--

DROP TABLE IF EXISTS `movies`;
CREATE TABLE IF NOT EXISTS `movies` (
  `mov_id` int NOT NULL,
  `mov_title` text NOT NULL,
  `mov_year` int NOT NULL,
  `mov_lang` text NOT NULL,
  `dir_id` int NOT NULL,
  PRIMARY KEY (`mov_id`),
  KEY `dir_id` (`dir_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `movies`
--

INSERT INTO `movies` (`mov_id`, `mov_title`, `mov_year`, `mov_lang`, `dir_id`) VALUES
(1, 'Three Live Ghosts', 1999, 'English', 1),
(2, 'Always Tell Your Wife', 2003, 'English', 1),
(3, 'Elsetree Calling', 2015, 'English', 1),
(4, 'The Spanish Tree', 2017, 'Spanish', 1),
(5, 'Lincoin', 2015, 'English', 2),
(6, 'The Fabelmans', 2021, 'English', 2);

-- --------------------------------------------------------

--
-- Table structure for table `movie_cast`
--

DROP TABLE IF EXISTS `movie_cast`;
CREATE TABLE IF NOT EXISTS `movie_cast` (
  `act_id` int NOT NULL,
  `mov_id` int NOT NULL,
  `role` text NOT NULL,
  PRIMARY KEY (`act_id`,`mov_id`),
  KEY `mov_id` (`mov_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `movie_cast`
--

INSERT INTO `movie_cast` (`act_id`, `mov_id`, `role`) VALUES
(1, 1, 'Hero'),
(1, 2, 'Hero'),
(1, 3, 'Detective'),
(1, 6, 'Hero'),
(2, 2, 'Heroin'),
(3, 4, 'Hero');

-- --------------------------------------------------------

--
-- Table structure for table `rating`
--

DROP TABLE IF EXISTS `rating`;
CREATE TABLE IF NOT EXISTS `rating` (
  `mov_id` int NOT NULL,
  `rev_starts` int NOT NULL,
  PRIMARY KEY (`mov_id`,`rev_starts`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `rating`
--

INSERT INTO `rating` (`mov_id`, `rev_starts`) VALUES
(1, 5),
(2, 4),
(3, 3),
(3, 4),
(5, 5),
(6, 4),
(6, 5);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `movies`
--
ALTER TABLE `movies`
  ADD CONSTRAINT `movies_ibfk_1` FOREIGN KEY (`dir_id`) REFERENCES `director` (`dir_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `movie_cast`
--
ALTER TABLE `movie_cast`
  ADD CONSTRAINT `movie_cast_ibfk_1` FOREIGN KEY (`act_id`) REFERENCES `actor` (`act_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `movie_cast_ibfk_2` FOREIGN KEY (`mov_id`) REFERENCES `movies` (`mov_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `rating`
--
ALTER TABLE `rating`
  ADD CONSTRAINT `rating_ibfk_1` FOREIGN KEY (`mov_id`) REFERENCES `movies` (`mov_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

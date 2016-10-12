
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `wishlist`
--
CREATE DATABASE IF NOT EXISTS `wishlist` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `wishlist`;

-- --------------------------------------------------------

--
-- Table structure for table `wishers`
--

DROP TABLE IF EXISTS `wishers`;
CREATE TABLE `wishers` (
  `id` int(11) NOT NULL,
  `name` char(50) NOT NULL,
  `password` char(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wishers`
--

INSERT INTO `wishers` (`id`, `name`, `password`) VALUES
(1, 'Tom', 'tomcat'),
(2, 'Jerry', 'jerrymouse'),
(3, 'Bob', 'testpass');

-- --------------------------------------------------------

--
-- Table structure for table `wishes`
--

DROP TABLE IF EXISTS `wishes`;
CREATE TABLE `wishes` (
  `id` int(11) NOT NULL,
  `wisher_id` int(11) NOT NULL,
  `description` char(255) NOT NULL,
  `due_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wishes`
--

INSERT INTO `wishes` (`id`, `wisher_id`, `description`, `due_date`) VALUES
(1, 1, 'Sausage', '2008-04-01'),
(2, 1, 'Icecream', NULL),
(3, 2, 'Cheese', '2008-05-01'),
(4, 2, 'Candle', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `wishers`
--
ALTER TABLE `wishers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `wishes`
--
ALTER TABLE `wishes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wisher_id` (`wisher_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `wishers`
--
ALTER TABLE `wishers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `wishes`
--
ALTER TABLE `wishes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `wishes`
--
ALTER TABLE `wishes`
  ADD CONSTRAINT `wishes_ibfk_1` FOREIGN KEY (`wisher_id`) REFERENCES `wishers` (`id`);

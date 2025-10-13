-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 07, 2025 at 04:35 PM
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
-- Database: `auth_system`
--

-- --------------------------------------------------------

--
-- Table structure for table `otps`
--

CREATE TABLE `otps` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `otp` varchar(6) NOT NULL,
  `purpose` enum('login','forgot_password') NOT NULL DEFAULT 'login',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `otps`
--

INSERT INTO `otps` (`id`, `user_id`, `otp`, `purpose`, `created_at`) VALUES
(1, 1, '701635', 'login', '2025-09-22 10:31:30'),
(2, 1, '109843', 'login', '2025-09-22 10:46:25'),
(3, 1, '115592', 'forgot_password', '2025-09-22 10:46:40'),
(4, 1, '477186', 'forgot_password', '2025-09-22 10:53:44'),
(5, 1, '617389', 'login', '2025-09-22 10:55:18'),
(7, 1, '271874', 'login', '2025-09-22 17:37:37'),
(8, 1, '877503', 'login', '2025-09-22 17:39:07'),
(9, 2, '953537', 'login', '2025-09-22 17:40:18'),
(10, 2, '299682', 'login', '2025-09-22 17:40:23'),
(11, 2, '334898', 'login', '2025-09-22 17:41:44'),
(12, 2, '520437', 'login', '2025-09-22 17:41:53'),
(13, 2, '933518', 'login', '2025-09-22 17:43:02'),
(16, 2, '925316', 'login', '2025-09-22 18:48:15'),
(26, 1, '691564', 'forgot_password', '2025-09-23 06:51:39'),
(37, 1, '122509', 'login', '2025-09-23 08:52:47'),
(38, 1, '926761', 'login', '2025-09-23 08:59:24'),
(40, 1, '618767', 'login', '2025-09-23 09:04:57'),
(42, 1, '860885', 'login', '2025-09-23 09:12:01'),
(49, 1, '580518', 'login', '2025-09-23 12:19:49'),
(67, 1, '256568', 'forgot_password', '2025-09-23 14:38:20'),
(77, 2, '759519', 'login', '2025-09-27 17:44:33'),
(78, 2, '244705', 'login', '2025-09-27 17:44:37'),
(79, 2, '279712', 'login', '2025-09-27 17:51:58'),
(103, 2, '223472', 'login', '2025-10-07 13:39:41');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `password`, `created_at`) VALUES
(1, 'shabbir10505@gmail.com', 'edee29f882543b956620b26d0ee0e7e950399b1c4222f5de05e06425b4c995e9', '2025-09-22 10:31:12'),
(2, 'anika.toma@northsouth.edu', '03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4', '2025-09-22 17:39:40');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `otps`
--
ALTER TABLE `otps`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

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
-- AUTO_INCREMENT for table `otps`
--
ALTER TABLE `otps`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=105;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `otps`
--
ALTER TABLE `otps`
  ADD CONSTRAINT `otps_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

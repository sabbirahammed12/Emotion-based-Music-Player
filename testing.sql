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
-- Database: `testing`
--

-- --------------------------------------------------------

--
-- Table structure for table `all_songs`
--

CREATE TABLE `all_songs` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `artist` varchar(255) DEFAULT NULL,
  `cloud_url` varchar(255) NOT NULL,
  `thumbnail` varchar(255) DEFAULT NULL,
  `emotion` varchar(50) NOT NULL,
  `lyrics` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `all_songs`
--

INSERT INTO `all_songs` (`id`, `title`, `artist`, `cloud_url`, `thumbnail`, `emotion`, `lyrics`) VALUES
(1, 'Die With A Smile', 'Lady Gaga, Bruno Mars', 'https://res.cloudinary.com/dwdzo5ldo/video/upload/v1758388887/Die_With_A_Smile_w5dc86.mp3', 'https://res.cloudinary.com/dwdzo5ldo/image/upload/v1758881070/lady-gaga-bruno-mars-die-with-a-smile-tgj-1_oen2bk.jpg', 'sad', '(Ooh, ooh)\nI, I just woke up from a dream\nWhere you and I had to say goodbye\nAnd I don\'t know what it all means\nBut since I survived, I realized\n\nWherever you go, that\'s where I\'ll follow\nNobody\'s promised tomorrow\nSo I\'ma love you every night like it\'s the last night\nLike it\'s the last night\n\nIf the world was ending\nI\'d wanna be next to you\nIf the party was over\nAnd our time on Earth was through\nI\'d wanna hold you just for a while\nAnd die with a smile\nIf the world was ending\nI\'d wanna be next to you\n\n(Ooh, ooh)\n\nOoh, lost, lost in the words that we scream\nI don\'t even wanna do this anymore\n\'Cause you already know what you mean to me\nAnd our love\'s the only one worth fighting for\n\nWherever you go, that\'s where I\'ll follow\nNobody\'s promised tomorrow\nSo I\'ma love you every night like it\'s the last night\nLike it\'s the last night\n\nIf the world was ending\nI\'d wanna be next to you\nIf the party was over\nAnd our time on Earth was through\nI\'d wanna hold you just for a while\nAnd die with a smile\nIf the world was ending\nI\'d wanna be next to you\n\nRight next to you\nNext to you\nRight next to you\nOh-oh\n\nIf the world was ending\nI\'d wanna be next to you\nIf the party was over\nAnd our time on Earth was through\nI\'d wanna hold you just for a while\nAnd die with a smile\nIf the world was ending\nI\'d wanna be next to you\nIf the world was ending\nI\'d wanna be next to you\n\n(Ooh, ooh)\nI\'d wanna be next to you'),
(2, 'Apt Apt', 'Rosé and Bruno Mars', 'https://res.cloudinary.com/dwdzo5ldo/video/upload/v1758388887/APT_lvu2rj.mp3', 'https://res.cloudinary.com/dwdzo5ldo/image/upload/v1758448533/APT-English-2024-20241018035656-500x500_v2pixu.jpg', 'sad', '[Chorus]\nApateu, apateu\nApateu, apateu\nApateu, apateu\nUh, uh-huh, uh-huh\nApateu, apateu\nApateu, apateu\nApateu, apateu\nUh, uh-huh, uh-huh\n\n[Verse 1]\nKissy face, kissy face\nSent to your phone but\nI\'m trying to kiss your lips for real\nRed hearts, red hearts\nThat’s what I’m on yeah\nCome give me something I can feel\nOh oh oh\n\n[Pre-Chorus]\nDon\'t you want me like I want you, baby\nDon\'t you need me like I need you now\nSleep tomorrow but tonight go crazy\nAll you gotta do is just meet me at the\n\n[Chorus]\nApateu, apateu\nApateu, apateu\nApateu, apateu\nUh, uh-huh, uh-huh\nApateu, apateu\nApateu, apateu\nApateu, apateu\nUh, uh-huh, uh-huh\n\n[Verse 2]\nIt’s whatever it’s whatever it’s whatever you like\nTurn this apateu into a club\nI’m talking drink, dance, smoke, freak, party all night\nGeonbae geonbae girl what’s up\nOh-oh-oh\n\n[Pre-Chorus]\nDon\'t you want me like I want you, baby\nDon\'t you need me like I need you now\nSleep tomorrow but tonight go crazy\nAll you gotta do is just meet me at the\n\n[Chorus]\nApateu, apateu\nApateu, apateu\nApateu, apateu\nUh, uh-huh, uh-huh\nApateu, apateu\nApateu, apateu\nApateu, apateu\nUh, uh-huh, uh-huh\n\n[Bridge]\nHey so now you know the game\nAre you ready?\nCause I’m comin to get ya\nGet ya, get ya\nHold on, hold on\nI’m on my way\nYeah yeah yeah yeah yeah\nI’m on my way\nHold on, hold on\nI’m on my way\nYeah yeah yeah yeah yeah\nI’m on my way\n\n[Pre-Chorus]\nDon\'t you want me like I want you, baby\nDon\'t you need me like I need you now\nSleep tomorrow but tonight go crazy\nAll you gotta do is just meet me at the\n\n[Chorus]\nApateu, apateu\nApateu, apateu\nApateu, apateu\nJust meet me at the\n(Uh, uh-huh, uh-huh)\nApateu, apateu\nApateu, apateu\nApateu, apateu\nJust meet me at the\n(Uh, uh-huh, uh-huh)\nApateu, apateu\nApateu, apateu\nApateu, apateu\nJust meet me at the\n(Uh, uh-huh, uh-huh)\nApateu, apateu\nApateu, apateu\nApateu, apateu\nUh, uh-huh, uh-huh');

-- --------------------------------------------------------

--
-- Table structure for table `liked_songs`
--

CREATE TABLE `liked_songs` (
  `id` int(11) NOT NULL,
  `song_id` int(11) NOT NULL,
  `liked_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `liked_songs`
--

INSERT INTO `liked_songs` (`id`, `song_id`, `liked_at`) VALUES
(5, 1, '2025-09-30 23:18:53');

-- --------------------------------------------------------

--
-- Table structure for table `liked_themes`
--

CREATE TABLE `liked_themes` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `color` varchar(20) NOT NULL,
  `saved_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `liked_themes`
--

INSERT INTO `liked_themes` (`id`, `user_id`, `color`, `saved_at`) VALUES
(34, 1, '#00426b,#e00007', '2025-09-30 17:14:33'),
(35, 1, '#ff7a9e,#3a1f1f', '2025-09-30 17:15:02');

-- --------------------------------------------------------

--
-- Table structure for table `recently_played`
--

CREATE TABLE `recently_played` (
  `id` int(11) NOT NULL,
  `song_id` int(11) NOT NULL,
  `played_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `recently_played`
--

INSERT INTO `recently_played` (`id`, `song_id`, `played_at`) VALUES
(1, 2, '2025-10-07 19:40:01'),
(2, 1, '2025-10-07 19:40:31');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `all_songs`
--
ALTER TABLE `all_songs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_emotion` (`emotion`);

--
-- Indexes for table `liked_songs`
--
ALTER TABLE `liked_songs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `song_id` (`song_id`),
  ADD KEY `idx_liked_at` (`liked_at`);

--
-- Indexes for table `liked_themes`
--
ALTER TABLE `liked_themes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `recently_played`
--
ALTER TABLE `recently_played`
  ADD PRIMARY KEY (`id`),
  ADD KEY `song_id` (`song_id`),
  ADD KEY `idx_played_at` (`played_at`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `all_songs`
--
ALTER TABLE `all_songs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `liked_songs`
--
ALTER TABLE `liked_songs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `liked_themes`
--
ALTER TABLE `liked_themes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `recently_played`
--
ALTER TABLE `recently_played`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `liked_songs`
--
ALTER TABLE `liked_songs`
  ADD CONSTRAINT `liked_songs_ibfk_1` FOREIGN KEY (`song_id`) REFERENCES `all_songs` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `recently_played`
--
ALTER TABLE `recently_played`
  ADD CONSTRAINT `recently_played_ibfk_1` FOREIGN KEY (`song_id`) REFERENCES `all_songs` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

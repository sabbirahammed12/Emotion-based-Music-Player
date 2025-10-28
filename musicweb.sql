-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 28, 2025 at 04:50 PM
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
-- Database: `musicweb`
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
(2, 'Afsos', 'Anuv Jain, AP Dhillon', 'https://res.cloudinary.com/dem7atifi/video/upload/v1759676180/ytmp3free.cc_anuv-jain-afsos-ft-ap-dhillon-official-visualizer-youtubemp3free.org_qyahny.mp3', 'https://res.cloudinary.com/dem7atifi/image/upload/v1759676268/ab67616d0000b2738537cf974af2c408bdd8e1a6_pmae21.jpg', 'sad', 'Haan\nTeri yaadan yaadan\nTeri yaadan le ke betha\nKai raatan raatan\n\nPar aaj\nEna raatan picho\nMeinu sab sach nazar ae aunda\nKivein akhan akhan?\n\nJo guroor si\nOh fizool si\nMeinu aaj pata laga\nKi kasoor si\n\nMere dil de noor\nMain si mash-hoor\nTenu karta dur\nOh, bekasoor!\n\nKinj gairan nu\nMain apna mann\nMileya mere apne nu\nGair ban\n\nEh taan zaroor\nDil karta choor\nTera\n\nTe haan\nMain duniya vekhi\nTere dil nu vekh na paya\nMain jhalla jhalla\n\nKarda si\nWadeya nawan di\nGallan gallan\n\nHun ethe\nMarda janda\nMain kalla kalla\n\nHun kyun\nAfsos hoya?\nHun ki fayeda?\nMilna ni\nJe chahaan chahaan\n\nMain hun\nGhadiya de hath te\nKivein modha\nRukh samay da\nTe rahaan rahaan?\n\nChand pal do pal\nTeri sunda battan je\n\nTere nal hi\nSab katda rattan je\n\nTere hanju dekhda\nVich barsattan je\n\nKitte karda teh\nEh dil di vattan je\n\nKaisi shaam si\nTere naam si\nJo padheya na main\nKi pegham si?\n\nMain hairan si\nNaadan si\nKis gallon meri jaan\nPareshan si?\n\nTenu hasde vekh ke\nBaar baar\nTenu puchi na main kadey tere\nDil di saar\n\nTera intezar\nMeri samjho baar\nKidda katey ne tu din metho\nHaar haar?\n\nHaan\nJo pyaar si tera\nThoda vi samajh na paya\nMain jhalla jhalla\n\nHaan\nEh dil pachtave\nTere bin hun reh na pave\nEh kalla kalla\n\nHun kyun\nAfsos hoya?\nHun ki fayeda?\nMilna ni\nJe chahaan chahaan\n\nMain hun\nGhadiya de hath te\nKivein modha\nRukh samay da\nTe rahaan rahaan?\n\nTe rahaan rahaan\nTe rahaan rahaan'),
(3, 'Long_Distance_Love', 'Ankan Kumar Roy, Afrin', 'https://res.cloudinary.com/dem7atifi/image/upload/v1760468363/long_D_L_couxz7.jpg', 'https://res.cloudinary.com/dem7atifi/video/upload/v1760468333/ytmp3free.cc_long-distance-love-coke-studio-bangla-season-3-ankan-x-afrin-shuvendu-youtubemp3free.org_ba0ixm.mp3', 'sad', 'Na Elo Na\nSe Thake Kar Vhorasay\nE Kotha Jay\nBatashe Mishe Jay\nSe Ashe Na\nThake Na Shoto Barone\nDorjay\nDarie Thaka Day\n\nNa Gelo Na\nAr Asha Rakha Gelo Na\nE Byatha Jay\nAndhare She Milay\nSe Janena\nMane Na Kono Karone\nJanalay\nDarie Thaka Day\n\nJodi Biroho Thake Amio Thaki\nKe Bolo Shesh Hobe Age?\nKeno Je Eto Bhalobasha More Jay\nShudhu Shomoy Mone Rakhe\n\nEto Shunnota\nE Mone Rakhi Je Ami\nDekhe Na Keu To Ar\nBole Eshob-I Paglami\nKate Na Jamini\nBiroho Jeno Kete Jay\nThame Na Borsha\nTomare Daki Je Ami\n\n(Ar)\nSe Thake Kar Vhorasay\nE Kotha Jay\nBatashe Mishe Jay\nSe Ashe Na\nThake Na Shoto Barone\nE Dorjay\nDarie Thaka Day\n\nAmi Eka Hoye Boshe Achi\nBirohito Moner Sookshmo Hashi\nAmi...\nShudhu Cheyechi Tomake Shuru Theke\nJani\nAsbe Na To Aaj\nOshomapto Golpo\nLikhe Jai Ami Tumi\nTomar Bhalobasha\nAmi Chai Ni\n\nEkhono Hoy Ni Raat\nAkashe Koto Je Tara\nDekho Na Tumi Ar\nAmi-O Je Dishehara\nEkhane Borsha\nKeboli Bhore Je Ashe\nDakena Keu Jokhon\nThakena Tomar-I Pashe\n\nE Ekaki Moner Sthirata Tumi\nTene Eno Amar Gaan\nMoner Gohi-Ne Shudhu Tomar-I Roop\nBatase Jodi Dao Kan\n\nEto Shunnota\nE Mone Rakhi Je Ami\nDekhe Na Keu To Ar\nBole Eshob-I Paglami\nKate Na Jamini\nBiroho Jeno Kete Jay\nThame Na Borsha\nTomare Daki Je Ami\n\nEto Shunnota\nE Mone Rakhi Je Ami\nDekhe Na Keu To Ar\nBole Eshob-I Paglami\nKate Na Jamini\nBiroho Jeno Kete Jay\nThame Na Borsha\nTomare Daki Je Ami'),
(4, 'Tumi', 'Aiedid Rashid', 'https://res.cloudinary.com/dem7atifi/video/upload/v1760469982/ytmp3free.cc_tumi-video-song-utshob-sadia-ayman-shommo-jyoti-level-five-dope-chorki-youtubemp3free.org_uc9lhh.mp3', 'https://res.cloudinary.com/dem7atifi/image/upload/v1760470125/tumi_xkdoxy.jpg', 'romantic', 'Tumi saman nei, tao tumi bhaso\n\nManer majhe lukie ekatukhani hasso\n\n\nSwapne amar tomar chhabi\nChupty kare aases\nSakal thek rater sheshe\nThako amar pashe\n\nPratirate amader katha bala\nTomar saathe hazaro galp lekha\nAmader anule jot baandha\nAmader bhalo laaga\n\nAlo jwale, alo jwale\nAmar mane, amar mane\nTomar chhabi chokher saman ase bhase\n\nVrushti pade, vrushti pade\nThonter majhe galp jam\nToma aami khunji sarakshan\n\nEi amar mana\nEi amar mana\nEi amar mana\n\n\nTumi...'),
(5, 'Baby', 'Justin Bieber ft. Ludacris', 'https://res.cloudinary.com/dem7atifi/video/upload/v1760470412/ytmp3free.cc_justin-bieber-baby-ft-ludacris-youtubemp3free.org_hokuvq.mp3', 'https://res.cloudinary.com/dem7atifi/image/upload/v1760470464/baby_glb53l.jpg', 'happy', 'Ooooh.\nOoooh.\nOoooh, oh oh.\nYou know you love me,\nyou know I care.\nAnd we will never ever ever be apart.\nAre we an item?\nGirl, quit playin\'.\nJust shout whenever and I\'ll be there.\nWe\'re just friends, what are you sayin\'?\nYou are my love,\nyou are my heart.\nSaid \"There\'s another\" and\nAnd I was like baby, baby, baby, oh!\nI thought you\'d always be mine, mine.\nLike baby, baby, baby, no!\nLike baby, baby, baby, oh!\nMy first love broke my\nheart for the first time...\nlooked right in my eyes.\nBaby, baby, baby, oh!\nAnd I wanna play it cool,\nI thought you\'d always be mine.\nLike baby, baby, baby, no!\nLike baby, baby, baby, oh!\nOh, for you I would have done whatever,\nand I just can\'t believe\nwe ain\'t together.\nbut I\'m losing you\nAnd I\'m in pieces, baby fix me,\nI\'ll buy you any ring.\nI\'ll buy you anything,\nI\'m goin\' down, down, down, down,\nand I just can\'t believe my\nand just shake me \'till you\nfirst love won\'t be around...\nwake me from this bad dream.\nAnd I\'m like baby, baby, baby, oh!\nBaby, baby, baby, oh!\nI had my first love.\nI thought you\'d always be mine, mine.\nI thought you\'d always be mine.\nLike baby, baby, baby, no!\nLike baby, baby, baby, oh!\nShe had me goin\' crazy,\nThere was nobody to compare to my baby,\nWhen I was thirteen,\nand nobody came between us\noh I was starstruck.\nor would ever come above.\nShe woke me up daily,\nBut I really wanna see\nI skip a beat when I\'d see her on the\nShe made my heart pound,\ndon\'t need no Starbucks.\nher on the weekend,\nshe know she got me dazin\',\nstreet and at school on the playground.\'cause she was so amazin\'.\nAnd now my heart is breakin\',\nBaby, baby, baby, oh!\nI thought you\'d always be mine, mine.\nLike baby, baby, baby, no!\nLike baby, baby, baby, oh!\nbut I just keep on sayin\'...\nLike baby, baby, baby, no!\nI thought you\'d always be mine.\nI\'m gone...\nLike baby, baby, baby, oh!\nNow I\'m all gone, gone, gone.\nNow I\'m all gone.'),
(6, 'F.R.I.E.N.D.S', 'Marshmello & Anne-Marie', 'https://res.cloudinary.com/dem7atifi/video/upload/v1760471154/Marshmello___Anne-Marie_-_FRIENDS_Music_Video_OFFICIAL_FRIENDZONE_ANTHEM_gy1ic9.mp3', 'https://res.cloudinary.com/dem7atifi/image/upload/v1760471119/mashmallo_iv5qup.jpg', 'sad', 'Ooh ooh, ooh ooh.\nOoh ooh, ooh ooh.\n\nYou say you love me, I say you crazy.\nWe\'re nothing more than friends.\nYou\'re not my lover, more like a brother.\nI known you since we were like 10.\nYeah, don\'t mess it up talking that ish.\nOnly gonna push me away, that\'s it.\nWhen you say you love me, that make me crazy.\nHere we go again.\nDon\'t go look at me with that look in your eye.\nYou really ain\'t going away without a fight.\nYou can\'t be reasoned with, I\'m done being polite.\nI\'ve told you 1, 2, 3, 4, 5, 6 thousand times.\n\nHaven\'t I made it obvious?\nHaven\'t I made it clear?\nWant me to spell it out for ya?\nF-R-I-E-N-D-S\nHaven\'t I made it obvious?\nHaven\'t I made it clear?\nWant me to spell it out for ya?\nF-R-I-E-N-D-S\nF-R-I-E-N-D-S\n\nHave you got no shame?\nYou lookin\' insane turning up at my door.\nIt\'s 2 in the morning, the rain is pouring.\nHaven\'t we been here before?\nDon\'t mess it up talking that ish.\nOnly gonna push me away, that\'s it.\nHave you got no shame?\nYou lookin\' insane.\nHere we go again.\nSo don\'t go look at me with that look in your eye.\nYou really ain\'t going away without a fight.\nYou can\'t be reasoned with, I\'m done being polite.\nI\'ve told you 1, 2, 3, 4, 5, 6 thousand times.\n\nHaven\'t I made it obvious?\nHaven\'t I made it clear?\nWant me to spell it out for ya?\nF-R-I-E-N-D-S\nHaven\'t I made it obvious?\nHaven\'t I made it clear?\nWant me to spell it out for ya?\nF-R-I-E-N-D-S\nF-R-I-E-N-D-S\n\nF-R-I-E-N-D-S, that\'s how you f***ing spell \"friends.\"\nF-R-I-E-N-D-S, get that inside your head.\nNo, no.\nYeah, uh, uhh.\nF-R-I-E-N-D-S\nWe\'re just friends.\nSo don\'t go look at me with that look in your eye.\nYou really ain\'t going away without a fight.\nYou can\'t be reasoned with, I\'m done being polite.\nI\'ve told you 1, 2, 3, 4, 5, 6 thousand times.\n\nHaven\'t I made it obvious?\nHaven\'t I made it clear?\nWant me to spell it out for ya?\nF-R-I-E-N-D-S\nHaven\'t I made it obvious?\nHaven\'t I made it clear?\nWant me to spell it out for ya?\nF-R-I-E-N-D-S\nF-R-I-E-N-D-S\n\nOoh, ooh, ooh, ooh.\nOh, oh, oh.');

-- --------------------------------------------------------

--
-- Table structure for table `liked_songs`
--

CREATE TABLE `liked_songs` (
  `id` int(11) NOT NULL,
  `song_id` int(11) NOT NULL,
  `liked_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `liked_songs`
--
ALTER TABLE `liked_songs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `recently_played`
--
ALTER TABLE `recently_played`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

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

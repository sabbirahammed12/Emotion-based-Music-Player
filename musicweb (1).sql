-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 14, 2025 at 05:29 PM
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
(4, 'Tumi', 'Aiedid Rashid', 'https://res.cloudinary.com/dem7atifi/video/upload/v1760469982/ytmp3free.cc_tumi-video-song-utshob-sadia-ayman-shommo-jyoti-level-five-dope-chorki-youtubemp3free.org_uc9lhh.mp3', 'https://res.cloudinary.com/dem7atifi/image/upload/v1760470125/tumi_xkdoxy.jpg', 'happy', 'Tumi saman nei, tao tumi bhaso\n\nManer majhe lukie ekatukhani hasso\n\n\nSwapne amar tomar chhabi\nChupty kare aases\nSakal thek rater sheshe\nThako amar pashe\n\nPratirate amader katha bala\nTomar saathe hazaro galp lekha\nAmader anule jot baandha\nAmader bhalo laaga\n\nAlo jwale, alo jwale\nAmar mane, amar mane\nTomar chhabi chokher saman ase bhase\n\nVrushti pade, vrushti pade\nThonter majhe galp jam\nToma aami khunji sarakshan\n\nEi amar mana\nEi amar mana\nEi amar mana\n\n\nTumi...'),
(5, 'Baby', 'Justin Bieber ft. Ludacris', 'https://res.cloudinary.com/dem7atifi/video/upload/v1760470412/ytmp3free.cc_justin-bieber-baby-ft-ludacris-youtubemp3free.org_hokuvq.mp3', 'https://res.cloudinary.com/dem7atifi/image/upload/v1760470464/baby_glb53l.jpg', 'happy', 'Ooooh.\nOoooh.\nOoooh, oh oh.\nYou know you love me,\nyou know I care.\nAnd we will never ever ever be apart.\nAre we an item?\nGirl, quit playin\'.\nJust shout whenever and I\'ll be there.\nWe\'re just friends, what are you sayin\'?\nYou are my love,\nyou are my heart.\nSaid \"There\'s another\" and\nAnd I was like baby, baby, baby, oh!\nI thought you\'d always be mine, mine.\nLike baby, baby, baby, no!\nLike baby, baby, baby, oh!\nMy first love broke my\nheart for the first time...\nlooked right in my eyes.\nBaby, baby, baby, oh!\nAnd I wanna play it cool,\nI thought you\'d always be mine.\nLike baby, baby, baby, no!\nLike baby, baby, baby, oh!\nOh, for you I would have done whatever,\nand I just can\'t believe\nwe ain\'t together.\nbut I\'m losing you\nAnd I\'m in pieces, baby fix me,\nI\'ll buy you any ring.\nI\'ll buy you anything,\nI\'m goin\' down, down, down, down,\nand I just can\'t believe my\nand just shake me \'till you\nfirst love won\'t be around...\nwake me from this bad dream.\nAnd I\'m like baby, baby, baby, oh!\nBaby, baby, baby, oh!\nI had my first love.\nI thought you\'d always be mine, mine.\nI thought you\'d always be mine.\nLike baby, baby, baby, no!\nLike baby, baby, baby, oh!\nShe had me goin\' crazy,\nThere was nobody to compare to my baby,\nWhen I was thirteen,\nand nobody came between us\noh I was starstruck.\nor would ever come above.\nShe woke me up daily,\nBut I really wanna see\nI skip a beat when I\'d see her on the\nShe made my heart pound,\ndon\'t need no Starbucks.\nher on the weekend,\nshe know she got me dazin\',\nstreet and at school on the playground.\'cause she was so amazin\'.\nAnd now my heart is breakin\',\nBaby, baby, baby, oh!\nI thought you\'d always be mine, mine.\nLike baby, baby, baby, no!\nLike baby, baby, baby, oh!\nbut I just keep on sayin\'...\nLike baby, baby, baby, no!\nI thought you\'d always be mine.\nI\'m gone...\nLike baby, baby, baby, oh!\nNow I\'m all gone, gone, gone.\nNow I\'m all gone.'),
(6, 'F.R.I.E.N.D.S', 'Marshmello & Anne-Marie', 'https://res.cloudinary.com/dem7atifi/video/upload/v1760471154/Marshmello___Anne-Marie_-_FRIENDS_Music_Video_OFFICIAL_FRIENDZONE_ANTHEM_gy1ic9.mp3', 'https://res.cloudinary.com/dem7atifi/image/upload/v1760471119/mashmallo_iv5qup.jpg', 'sad', 'Ooh ooh, ooh ooh.\nOoh ooh, ooh ooh.\n\nYou say you love me, I say you crazy.\nWe\'re nothing more than friends.\nYou\'re not my lover, more like a brother.\nI known you since we were like 10.\nYeah, don\'t mess it up talking that ish.\nOnly gonna push me away, that\'s it.\nWhen you say you love me, that make me crazy.\nHere we go again.\nDon\'t go look at me with that look in your eye.\nYou really ain\'t going away without a fight.\nYou can\'t be reasoned with, I\'m done being polite.\nI\'ve told you 1, 2, 3, 4, 5, 6 thousand times.\n\nHaven\'t I made it obvious?\nHaven\'t I made it clear?\nWant me to spell it out for ya?\nF-R-I-E-N-D-S\nHaven\'t I made it obvious?\nHaven\'t I made it clear?\nWant me to spell it out for ya?\nF-R-I-E-N-D-S\nF-R-I-E-N-D-S\n\nHave you got no shame?\nYou lookin\' insane turning up at my door.\nIt\'s 2 in the morning, the rain is pouring.\nHaven\'t we been here before?\nDon\'t mess it up talking that ish.\nOnly gonna push me away, that\'s it.\nHave you got no shame?\nYou lookin\' insane.\nHere we go again.\nSo don\'t go look at me with that look in your eye.\nYou really ain\'t going away without a fight.\nYou can\'t be reasoned with, I\'m done being polite.\nI\'ve told you 1, 2, 3, 4, 5, 6 thousand times.\n\nHaven\'t I made it obvious?\nHaven\'t I made it clear?\nWant me to spell it out for ya?\nF-R-I-E-N-D-S\nHaven\'t I made it obvious?\nHaven\'t I made it clear?\nWant me to spell it out for ya?\nF-R-I-E-N-D-S\nF-R-I-E-N-D-S\n\nF-R-I-E-N-D-S, that\'s how you f***ing spell \"friends.\"\nF-R-I-E-N-D-S, get that inside your head.\nNo, no.\nYeah, uh, uhh.\nF-R-I-E-N-D-S\nWe\'re just friends.\nSo don\'t go look at me with that look in your eye.\nYou really ain\'t going away without a fight.\nYou can\'t be reasoned with, I\'m done being polite.\nI\'ve told you 1, 2, 3, 4, 5, 6 thousand times.\n\nHaven\'t I made it obvious?\nHaven\'t I made it clear?\nWant me to spell it out for ya?\nF-R-I-E-N-D-S\nHaven\'t I made it obvious?\nHaven\'t I made it clear?\nWant me to spell it out for ya?\nF-R-I-E-N-D-S\nF-R-I-E-N-D-S\n\nOoh, ooh, ooh, ooh.\nOh, oh, oh.'),
(7, 'Perfect', 'Ed Sheeran', 'https://res.cloudinary.com/dwdzo5ldo/video/upload/v1758388887/Die_With_A_Smile_w5dc86.mp3', 'https://res.cloudinary.com/dwdzo5ldo/image/upload/v1758881070/lady-gaga-bruno-mars-die-with-a-smile-tgj-1_oen2bk.jpg', 'happy', 'I found a love for me\nOh, darling, just dive right in and follow my lead\nWell, I found a girl, beautiful and sweet\nOh, I never knew you were the someone waitin\' for me\n\n\'Cause we were just kids when we fell in love, not knowin\' what it was\nI will not give you up this time\nOh, darling, just kiss me slow, your heart is all I own\nAnd in your eyes, you\'re holding mine\n\nBaby, I\'m dancin\' in the dark with you between my arms\nBarefoot on the grass while listenin\' to our favourite song\nWhen you said you looked a mess, I whispered underneath my breath\nBut you heard it, \"Darling, you look perfect tonight\"\n\nWell, I found a woman, stronger than anyone I know\nShe shares my dreams, I hope that someday, I\'ll share her home\nI found a love to carry more than just my secrets\nTo carry love, to carry children of our own\n\nWe are still kids, but we\'re so in love, fightin\' against all odds\nI know we\'ll be alright this time\nDarling, just hold my hand, be my girl, I\'ll be your man\nI see my future in your eyes\n\nOh, baby, I\'m dancin\' in the dark with you between my arms\nBarefoot on the grass while listenin\' to our favourite song\nWhen I saw you in that dress, lookin\' so beautiful\nI don\'t deserve this, darling, you look perfect tonight\n\nNo, no, no\nMm, oh\n\nBaby, I\'m dancin\' in the dark with you between my arms\nBarefoot on the grass while listenin\' to our favourite song\nI have faith in what I see, now I know I have met\nAn angel in person, and she looks perfect\nThough I don\'t deserve this, you look perfect tonight'),
(8, 'Lover', 'Taylor Swift', 'https://res.cloudinary.com/dem7atifi/video/upload/v1763135111/Taylor_Swift_-_Lover_Official_Music_Video_os6h0d.mp3', 'https://res.cloudinary.com/dem7atifi/image/upload/v1763135053/lover_g5mm9a.jpg', 'happy', 'We could leave the Christmas lights up \'til January\nThis is our place, we make the rules\nAnd there\'s a dazzling haze, a mysterious way about you, dear\nHave I known you twenty seconds or twenty years?\n\nCan I go where you go?\nCan we always be this close forever and ever?\nAnd ah, take me out and take me home\nYou\'re my, my, my, my\nLover\n\nWe could let our friends crash in the living room\nThis is our place, we make the call\nAnd I\'m highly suspicious that everyone who sees you wants you\nI\'ve loved you three summers now, honey, but I want \'em all\n\nCan I go where you go?\nCan we always be this close forever and ever?\nAnd ah, take me out and take me home (Forever and ever)\nYou\'re my, my, my, my\nLover\n\nLadies and gentlemen, will you please stand?\nWith every guitar string scar on my hand\nI take this magnetic force of a man to be my\nLover\nMy heart\'s been borrowed and yours has been blue\nAll\'s well that ends well to end up with you\nSwear to be over-dramatic and true to my\nLover\n\nAnd you\'ll save all your dirtiest jokes for me\nAnd at every table, I\'ll save you a seat\nLover\n\nCan I go where you go?\nCan we always be this close forever and ever?\nAnd ah, take me out and take me home (Forever and ever)\nYou\'re my, my, my, my\nOh, you\'re my, my, my, my\nDarling, you\'re my, my, my, my\nLover'),
(9, 'We Don\'t Talk Anymore', 'Charlie Puth feat. Selena Gomez', 'https://res.cloudinary.com/dem7atifi/video/upload/v1763135766/Charlie_Puth_-_We_Don_t_Talk_Anymore_feat._Selena_Gomez_Official_Video_l7cbto.mp3', 'https://res.cloudinary.com/dem7atifi/image/upload/v1763135812/we_dont_talk_anymore_ozupxn.webp', 'sad', 'We don\'t talk anymore\nWe don\'t talk anymore\nWe don\'t talk anymore\nLike we used to do\nWe don\'t laugh anymore\nWhat was all of it for?\nOh, we don\'t talk anymore\nLike we used to do\n\nI just heard you found the one you\'ve been looking—\nYou\'ve been looking for\nI wish I would have known that wasn\'t me\n\'Cause even after all this time I still wonder\nWhy I can\'t move on\nJust the way you did so easily\n\nDon\'t wanna know\nKind of dress you\'re wearing tonight\nIf he\'s holdin\' onto you so tight\nThe way I did before\nI overdosed\nShould\'ve known your love was a game\nNow I can\'t get you out of my brain\nOh, it\'s such a shame\n\nThat we don\'t talk anymore\nWe don\'t talk anymore\nWe don\'t talk anymore\nLike we used to do\nWe don\'t laugh anymore\nWhat was all of it for?\nOh, we don\'t talk anymore\nLike we used to do\n\n[Selena Gomez:]\nI just hope you\'re lying next to somebody\nWho knows how to love you like me\nThere must be a good reason that you\'re gone\nEvery now and then I think you might want me to\nCome show up at your door\nBut I\'m just too afraid that I\'ll be wrong\n\nDon\'t wanna know\nIf you\'re looking into her eyes\nIf she\'s holdin\' onto you so tight\nThe way I did before\nI overdosed\nShould\'ve known your love was a game\nNow I can\'t get you out of my brain\nOh, it\'s such a shame\n\n[Charlie Puth & Selena Gomez:]\nThat we don\'t talk anymore\n(we don\'t, we don\'t)\nWe don\'t talk anymore\n(we don\'t, we don\'t)\nWe don\'t talk anymore\nLike we used to do\nWe don\'t laugh anymore\n(we don\'t, we don\'t)\nWhat was all of it for?\n(we don\'t, we don\'t)\nOh, we don\'t talk anymore\nLike we used to do\n\nLike we used to do\n\nDon\'t wanna know\nKind of dress you\'re wearing tonight\nIf he\'s giving it to you just right\nThe way I did before\nI overdosed\nShould\'ve known your love was a game\nNow I can\'t get you out of my brain\nOh, it\'s such a shame\n\nThat we don\'t talk anymore\n(we don\'t, we don\'t)\nWe don\'t talk anymore\n(we don\'t, we don\'t)\nWe don\'t talk anymore\nLike we used to do\nWe don\'t laugh anymore\n(we don\'t, we don\'t)\nWhat was all of it for?\n(we don\'t, we don\'t)\nOh, we don\'t talk anymore\nLike we used to do\n\nWe don\'t talk anymore\n\nDon\'t wanna know\nKind of dress you\'re wearing tonight, oh\nIf he\'s holding onto you so tight, oh\nThe way I did before\n\nWe don\'t talk anymore\n\nI overdosed\nShould\'ve known your love was a game, oh\nNow I can\'t get you out of my brain, whoa\nOh, it\'s such a shame\n\nThat we don\'t talk anymore'),
(10, 'Levitating', 'Dua Lipa', 'https://res.cloudinary.com/dem7atifi/video/upload/v1763136376/Dua_Lipa_-_Levitating_Featuring_DaBaby_Official_Music_Video_zhv45w.mp3', 'https://res.cloudinary.com/dem7atifi/image/upload/v1763136104/levitating_q4rbhp.jpg', 'neutral', 'If you wanna run away with me\nI know a galaxy and I can take you for a ride\nI had a premonition that we fell into a rhythm\nWhere the music don\'t stop for life\nGlitter in the sky, glitter in my eyes\nShining just the way I like\nIf you\'re feeling like you need a little bit of company\nYou met me at the perfect time\n\nYou want me, I want you, baby\nMy sugarboo, I\'m levitating\nThe Milky Way, we\'re renegading\n(Yeah, yeah, yeah, yeah, yeah)\n\nI got you, moonlight, you\'re my starlight\nI need you, all night\nCome on, dance with me\n(I\'m levitating)\nYou, moonlight, you\'re my starlight\nI need you, all night\nCome on, dance with me\n(I\'m levitating)\n\nI believe that you\'re for me, I feel it in our energy\nI see us written in the stars\nWe can go wherever, so let\'s do it now or never\nBaby, nothing\'s ever, ever too far\nGlitter in the sky, glitter in our eyes\nShining just the way we are\nI feel like we\'re forever, every time we get together\nBut whatever, let\'s get lost on Mars\n\nYou want me, I want you, baby\nMy sugarboo, I\'m levitating\nThe Milky Way, we\'re renegading\n(Yeah, yeah, yeah, yeah, yeah)\n\nI got you, moonlight, you\'re my starlight\nI need you, all night\nCome on, dance with me\n(I\'m levitating)\nYou, moonlight, you\'re my starlight\nI need you, all night\nCome on, dance with me\n(I\'m levitating)\n\nYou can fly away with me tonight\nYou can fly away with me tonight\nBaby, let me take you for a ride\n(Yeah, yeah, yeah, yeah, yeah)\n(I\'m levitating)\nYou can fly away with me tonight\nYou can fly away with me tonight\nBaby, let me take you for a ride\n(Yeah, yeah, yeah, yeah, yeah)\n\nMy love is like a rocket, watch it blast off\nAnd I\'m feeling so electric, dance my ass off\nAnd even if I wanted to, I can\'t stop\n(Yeah, yeah, yeah, yeah, yeah)\nMy love is like a rocket, watch it blast off\nAnd I\'m feeling so electric, dance my ass off\nAnd even if I wanted to, I can\'t stop\n(Yeah, yeah, yeah, yeah, yeah)\n\nYou want me, I want you, baby\nMy sugarboo, I\'m levitating\nThe Milky Way, we\'re renegading\n\nI got you, moonlight, you\'re my starlight\nI need you, all night\nCome on, dance with me\n(I\'m levitating)\n\nYou can fly away with me tonight\nYou can fly away with me tonight\nBaby, let me take you for a ride\n(Yeah, yeah, yeah, yeah, yeah)\n(I\'m levitating)\nYou can fly away with me tonight\nYou can fly away with me tonight\nBaby, let me take you for a ride\n(Yeah, yeah, yeah, yeah, yeah)\n\nI got you, moonlight, you\'re my starlight\nI need you, all night\nCome on, dance with me\n(I\'m levitating)\nYou, moonlight, you\'re my starlight\nI need you, all night\nCome on, dance with me\n(I\'m levitating)'),
(11, 'Pasoori', 'Ali Sethi & Shae Gill', 'https://res.cloudinary.com/dem7atifi/video/upload/v1763136838/Coke_Studio___Season_14___Pasoori___Ali_Sethi_x_Shae_Gill_mp2ejh.mp3', 'https://res.cloudinary.com/dem7atifi/image/upload/v1763136859/pasoori_xf4cax.webp', 'angry', 'Agg Lavan Majboori Nu\nAan Jaan Di Pasoori Nu\nZehar Bane Haan Teri\nPee Jaavan Main Poori Nu Aana Si Oh Nahi Aaya\nDil Baang Baang Mera Takraya\nKaga Bol Ke Dass Jaave\nPaavan Gheyo Dee Choori Nu Ranwan Ch Banwan Ch\nOh Nu Lukavan\nKoyi Mainu Na Roke Mere Dhol Judaiyan Di\nTainu Khabar Kivein Hove\nAa Jaave Dil Tera\nPoora Vi Na Hove Haan Baniya Banaiyan Di\nGalbaat Kivein Hove\nAa Jaave Dil Tera\nPoora Vi Na Hove Bhool Gayi Majboori Nu\nDuniya Di Dastoori Nu\nSaath Tera Hai Bathera\nPoora Kar Zaroori Nu Aana Si Oh Nai Aaya\nRaasta Na Dikhlaya\nDil Humara De Sahara\nKhwahishat Adhoori Nu Waari Main Jaavan\nMain Tainu Bulawan\nGall Saari Taan Hove Mere Dhol Judaiyan Di\nTainu Khabar Kivein Hove\nAa Jaave Dil Tera\nPoora Vi Na Hove Oh Haan Baniya Banaiyan Di\nGalbaat Kivein Hove\nAa Jaave Dil Tera\nPoora Vi Na Hove Mere Dhol Judaiyan Di\nSardaari Na Hove\nMere Dhol Judaiyan Di Mere Dhol Judaiyan Di\nSardaari Na Hove\nDildaran Di Sab Yaaran Di\nAazaari Na Hove Dildaran Di Sab Yaaran Di\nAazaari Na Hove Aa Chale Leke Tujhe\nHai Jahan Silsile\nTu Hai Wahin Hai Teri Kami\nBanade Saja De Panaah De Humein\nBanade Saja De Panaah De Humein Agg Lawan Majboori Nu\nAan Jaan Di Pasoori Nu\nZehar Bane Haan Teri\nPee Jaavan Main Poori Nu Ranwan Ch Banwan Ch\nOh Nu Lukavan\nKoyi Mainu Na Roke Mere Dhol Judaiyan Di\nTainu Khabar Kivein Hove\nAa Jaaye Dil Tera\nPoora Vi Na Hove Oh Haan Baniya Banaiyan Di\nGalbaat Kivein Hove\nAa Jaave Dil Tera\nPoora Vi Na Hove Poora Vi Na Hove\nPoora Vi Na Hove');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

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

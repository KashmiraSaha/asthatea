-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 09, 2023 at 11:20 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `astha_tea`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role_id` int(191) NOT NULL DEFAULT 0,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `shop_name` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `email`, `phone`, `role_id`, `photo`, `password`, `status`, `remember_token`, `created_at`, `updated_at`, `shop_name`) VALUES
(1, 'Mr. Shaon', 'admin@gmail.com', '8910017948', 0, '1568863396user-admin.png', '$2y$10$7pc6FU.fN/koNZkCyDMoSOuZK4EI/JQqmuICTseHKO.doywx/iT.u', 1, 'Ltr7AOzCJYryANAgIT4M8FjmqV7vIyaJsG53ZXwvbFHP32BZGwj6z6BkW4bw', '2019-09-18 21:23:16', '2022-08-19 09:51:11', 'ASTHA TEA'),
(13, 'Staff', 'staff@asthatea.com', '9876543210', 18, '16609109481651663452logo(3).png', '$2y$10$.5rKNFhvvklkFi526zdi1eUS/9Bki4lQ.vVx2xy2FSqjVGYeuw3te', 1, 'iz3x7PkwS1NOc24V7RRYcIcL3uXeH3sJiiMLHRy1ocNVf0WR6DfE0S1JK3AF', '2022-02-15 07:23:24', '2022-08-19 12:09:08', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `admin_languages`
--

CREATE TABLE `admin_languages` (
  `id` int(191) NOT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT 0,
  `language` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `file` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `rtl` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin_languages`
--

INSERT INTO `admin_languages` (`id`, `is_default`, `language`, `file`, `name`, `rtl`) VALUES
(1, 1, 'English', '1567232745AoOcvCtY.json', '1567232745AoOcvCtY', 0),
(2, 0, 'RTL English', '1584887310NzfWDhO8.json', '1584887310NzfWDhO8', 1);

-- --------------------------------------------------------

--
-- Table structure for table `admin_user_conversations`
--

CREATE TABLE `admin_user_conversations` (
  `id` int(191) NOT NULL,
  `subject` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(191) NOT NULL,
  `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `type` enum('Ticket','Dispute') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_number` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin_user_conversations`
--

INSERT INTO `admin_user_conversations` (`id`, `subject`, `user_id`, `message`, `created_at`, `updated_at`, `type`, `order_number`) VALUES
(11, 'test', 35, 'test message', '2022-03-28 10:17:29', '2022-03-28 10:17:29', NULL, NULL),
(12, 'tes', 35, 'fs', '2022-03-28 10:18:14', '2022-03-28 10:18:14', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `admin_user_messages`
--

CREATE TABLE `admin_user_messages` (
  `id` int(191) NOT NULL,
  `conversation_id` int(191) NOT NULL,
  `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin_user_messages`
--

INSERT INTO `admin_user_messages` (`id`, `conversation_id`, `message`, `user_id`, `created_at`, `updated_at`) VALUES
(12, 11, 'test message', NULL, '2022-03-28 10:17:29', '2022-03-28 10:17:29'),
(13, 12, 'fs', NULL, '2022-03-28 10:18:14', '2022-03-28 10:18:14');

-- --------------------------------------------------------

--
-- Table structure for table `attributes`
--

CREATE TABLE `attributes` (
  `id` int(11) NOT NULL,
  `attributable_id` int(11) DEFAULT NULL,
  `attributable_type` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `input_name` varchar(255) DEFAULT NULL,
  `price_status` int(3) NOT NULL DEFAULT 1 COMMENT '0 - hide, 1- show	',
  `details_status` int(3) NOT NULL DEFAULT 1 COMMENT '0 - hide, 1- show	',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `attribute_options`
--

CREATE TABLE `attribute_options` (
  `id` int(11) NOT NULL,
  `attribute_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `banners`
--

CREATE TABLE `banners` (
  `id` int(191) NOT NULL,
  `photo` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` enum('Large','TopSmall','BottomSmall') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `blogs`
--

CREATE TABLE `blogs` (
  `id` int(10) UNSIGNED NOT NULL,
  `category_id` int(191) NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `details` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `source` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `views` int(11) NOT NULL DEFAULT 0,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `meta_tag` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tags` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `blogs`
--

INSERT INTO `blogs` (`id`, `category_id`, `title`, `details`, `photo`, `source`, `views`, `status`, `meta_tag`, `meta_description`, `tags`, `created_at`) VALUES
(9, 2, 'How to design effective arts?', '<div align=\"justify\">The recording starts with the patter of a summer squall. Later, a \r\ndrifting tone like that of a not-quite-tuned-in radio station \r\n                                        rises and for a while drowns out\r\n the patter. These are the sounds encountered by NASA’s Cassini \r\nspacecraft as it dove \r\n                                        the gap between Saturn and its \r\ninnermost ring on April 26, the first of 22 such encounters before it \r\nwill plunge into \r\n                                        atmosphere in September. What \r\nCassini did not detect were many of the collisions of dust particles \r\nhitting the spacecraft\r\n                                        it passed through the plane of \r\nthe ringsen the charged particles oscillate in unison.<br><br></div><h3 align=\"justify\">How its Works ?</h3>\r\n                                    <p align=\"justify\">\r\n                                        MIAMI — For decades, South \r\nFlorida schoolchildren and adults fascinated by far-off galaxies, \r\nearthly ecosystems, the proper\r\n                                        ties of light and sound and \r\nother wonders of science had only a quaint, antiquated museum here in \r\nwhich to explore their \r\n                                        interests. Now, with the \r\nlong-delayed opening of a vast new science museum downtown set for \r\nMonday, visitors will be able \r\n                                        to stand underneath a suspended,\r\n 500,000-gallon aquarium tank and gaze at hammerhead and tiger sharks, \r\nmahi mahi, devil\r\n                                        rays and other creatures through\r\n a 60,000-pound oculus. <br></p><p align=\"justify\">Lens that will give the impression of seeing the fish from the bottom of\r\n a huge cocktail glass. And that’s just one of many\r\n                                        attractions and exhibits. \r\nOfficials at the $305 million Phillip and Patricia Frost Museum of \r\nScience promise that it will be a \r\n                                        vivid expression of modern \r\nscientific inquiry and exposition. Its opening follows a series of \r\nsetbacks and lawsuits and a \r\n                                        scramble to finish the \r\n250,000-square-foot structure. At one point, the project ran \r\nprecariously short of money. The museum\r\n                                        high-profile opening is \r\nespecially significant in a state s <br></p><p align=\"justify\"><br></p><h3 align=\"justify\">Top 5 reason to choose us</h3>\r\n                                    <p align=\"justify\">\r\n                                        Mauna Loa, the biggest volcano \r\non Earth — and one of the most active — covers half the Island of \r\nHawaii. Just 35 miles to the \r\n                                        northeast, Mauna Kea, known to \r\nnative Hawaiians as Mauna a Wakea, rises nearly 14,000 feet above sea \r\nlevel. To them it repre\r\n                                        sents a spiritual connection \r\nbetween our planet and the heavens above. These volcanoes, which have \r\nbeguiled millions of \r\n                                        tourists visiting the Hawaiian \r\nislands, have also plagued scientists with a long-running mystery: If \r\nthey are so close together, \r\n                                        how did they develop in two \r\nparallel tracks along the Hawaiian-Emperor chain formed over the same \r\nhot spot in the Pacific \r\n                                        Ocean — and why are their \r\nchemical compositions so different? \"We knew this was related to \r\nsomething much deeper,\r\n                                        but we couldn’t see what,” said \r\nTim Jones.\r\n                                    </p>', '15542700986-min.jpg', 'www.geniusocean.com', 36, 1, 'b1,b2,b3', 'Mauna Loa, the biggest volcano on Earth — and one of the most active — covers half the Island of Hawaii. Just 35 miles to the northeast, Mauna Kea, known to native Hawaiians as Mauna a Wakea, rises nearly 14,000 feet above sea level.', 'Business,Research,Mechanical,Process,Innovation,Engineering', '2018-02-06 09:53:41'),
(10, 3, 'How to design effective arts?', '<div align=\"justify\">The recording starts with the patter of a summer squall. Later, a \r\ndrifting tone like that of a not-quite-tuned-in radio station \r\n                                        rises and for a while drowns out\r\n the patter. These are the sounds encountered by NASA’s Cassini \r\nspacecraft as it dove \r\n                                        the gap between Saturn and its \r\ninnermost ring on April 26, the first of 22 such encounters before it \r\nwill plunge into \r\n                                        atmosphere in September. What \r\nCassini did not detect were many of the collisions of dust particles \r\nhitting the spacecraft\r\n                                        it passed through the plane of \r\nthe ringsen the charged particles oscillate in unison.<br><br></div><h3 align=\"justify\">How its Works ?</h3>\r\n                                    <p align=\"justify\">\r\n                                        MIAMI — For decades, South \r\nFlorida schoolchildren and adults fascinated by far-off galaxies, \r\nearthly ecosystems, the proper\r\n                                        ties of light and sound and \r\nother wonders of science had only a quaint, antiquated museum here in \r\nwhich to explore their \r\n                                        interests. Now, with the \r\nlong-delayed opening of a vast new science museum downtown set for \r\nMonday, visitors will be able \r\n                                        to stand underneath a suspended,\r\n 500,000-gallon aquarium tank and gaze at hammerhead and tiger sharks, \r\nmahi mahi, devil\r\n                                        rays and other creatures through\r\n a 60,000-pound oculus. <br></p><p align=\"justify\">Lens that will give the impression of seeing the fish from the bottom of\r\n a huge cocktail glass. And that’s just one of many\r\n                                        attractions and exhibits. \r\nOfficials at the $305 million Phillip and Patricia Frost Museum of \r\nScience promise that it will be a \r\n                                        vivid expression of modern \r\nscientific inquiry and exposition. Its opening follows a series of \r\nsetbacks and lawsuits and a \r\n                                        scramble to finish the \r\n250,000-square-foot structure. At one point, the project ran \r\nprecariously short of money. The museum\r\n                                        high-profile opening is \r\nespecially significant in a state s <br></p><p align=\"justify\"><br></p><h3 align=\"justify\">Top 5 reason to choose us</h3>\r\n                                    <p align=\"justify\">\r\n                                        Mauna Loa, the biggest volcano \r\non Earth — and one of the most active — covers half the Island of \r\nHawaii. Just 35 miles to the \r\n                                        northeast, Mauna Kea, known to \r\nnative Hawaiians as Mauna a Wakea, rises nearly 14,000 feet above sea \r\nlevel. To them it repre\r\n                                        sents a spiritual connection \r\nbetween our planet and the heavens above. These volcanoes, which have \r\nbeguiled millions of \r\n                                        tourists visiting the Hawaiian \r\nislands, have also plagued scientists with a long-running mystery: If \r\nthey are so close together, \r\n                                        how did they develop in two \r\nparallel tracks along the Hawaiian-Emperor chain formed over the same \r\nhot spot in the Pacific \r\n                                        Ocean — and why are their \r\nchemical compositions so different? \"We knew this was related to \r\nsomething much deeper,\r\n                                        but we couldn’t see what,” said \r\nTim Jones.\r\n                                    </p>', '15542700902-min.jpg', 'www.geniusocean.com', 14, 1, NULL, NULL, 'Business,Research,Mechanical,Process,Innovation,Engineering', '2018-03-06 09:54:21'),
(12, 2, 'How to design effective arts?', '<div align=\"justify\">The recording starts with the patter of a summer squall. Later, a \r\ndrifting tone like that of a not-quite-tuned-in radio station \r\n                                        rises and for a while drowns out\r\n the patter. These are the sounds encountered by NASA’s Cassini \r\nspacecraft as it dove \r\n                                        the gap between Saturn and its \r\ninnermost ring on April 26, the first of 22 such encounters before it \r\nwill plunge into \r\n                                        atmosphere in September. What \r\nCassini did not detect were many of the collisions of dust particles \r\nhitting the spacecraft\r\n                                        it passed through the plane of \r\nthe ringsen the charged particles oscillate in unison.<br><br></div><h3 align=\"justify\">How its Works ?</h3>\r\n                                    <p align=\"justify\">\r\n                                        MIAMI — For decades, South \r\nFlorida schoolchildren and adults fascinated by far-off galaxies, \r\nearthly ecosystems, the proper\r\n                                        ties of light and sound and \r\nother wonders of science had only a quaint, antiquated museum here in \r\nwhich to explore their \r\n                                        interests. Now, with the \r\nlong-delayed opening of a vast new science museum downtown set for \r\nMonday, visitors will be able \r\n                                        to stand underneath a suspended,\r\n 500,000-gallon aquarium tank and gaze at hammerhead and tiger sharks, \r\nmahi mahi, devil\r\n                                        rays and other creatures through\r\n a 60,000-pound oculus. <br></p><p align=\"justify\">Lens that will give the impression of seeing the fish from the bottom of\r\n a huge cocktail glass. And that’s just one of many\r\n                                        attractions and exhibits. \r\nOfficials at the $305 million Phillip and Patricia Frost Museum of \r\nScience promise that it will be a \r\n                                        vivid expression of modern \r\nscientific inquiry and exposition. Its opening follows a series of \r\nsetbacks and lawsuits and a \r\n                                        scramble to finish the \r\n250,000-square-foot structure. At one point, the project ran \r\nprecariously short of money. The museum\r\n                                        high-profile opening is \r\nespecially significant in a state s <br></p><p align=\"justify\"><br></p><h3 align=\"justify\">Top 5 reason to choose us</h3>\r\n                                    <p align=\"justify\">\r\n                                        Mauna Loa, the biggest volcano \r\non Earth — and one of the most active — covers half the Island of \r\nHawaii. Just 35 miles to the \r\n                                        northeast, Mauna Kea, known to \r\nnative Hawaiians as Mauna a Wakea, rises nearly 14,000 feet above sea \r\nlevel. To them it repre\r\n                                        sents a spiritual connection \r\nbetween our planet and the heavens above. These volcanoes, which have \r\nbeguiled millions of \r\n                                        tourists visiting the Hawaiian \r\nislands, have also plagued scientists with a long-running mystery: If \r\nthey are so close together, \r\n                                        how did they develop in two \r\nparallel tracks along the Hawaiian-Emperor chain formed over the same \r\nhot spot in the Pacific \r\n                                        Ocean — and why are their \r\nchemical compositions so different? \"We knew this was related to \r\nsomething much deeper,\r\n                                        but we couldn’t see what,” said \r\nTim Jones.\r\n                                    </p>', '15542700821-min.jpg', 'www.geniusocean.com', 19, 1, NULL, NULL, 'Business,Research,Mechanical,Process,Innovation,Engineering', '2018-04-06 22:04:20'),
(13, 3, 'How to design effective arts?', '<div align=\"justify\">The recording starts with the patter of a summer squall. Later, a \r\ndrifting tone like that of a not-quite-tuned-in radio station \r\n                                        rises and for a while drowns out\r\n the patter. These are the sounds encountered by NASA’s Cassini \r\nspacecraft as it dove \r\n                                        the gap between Saturn and its \r\ninnermost ring on April 26, the first of 22 such encounters before it \r\nwill plunge into \r\n                                        atmosphere in September. What \r\nCassini did not detect were many of the collisions of dust particles \r\nhitting the spacecraft\r\n                                        it passed through the plane of \r\nthe ringsen the charged particles oscillate in unison.<br><br></div><h3 align=\"justify\">How its Works ?</h3>\r\n                                    <p align=\"justify\">\r\n                                        MIAMI — For decades, South \r\nFlorida schoolchildren and adults fascinated by far-off galaxies, \r\nearthly ecosystems, the proper\r\n                                        ties of light and sound and \r\nother wonders of science had only a quaint, antiquated museum here in \r\nwhich to explore their \r\n                                        interests. Now, with the \r\nlong-delayed opening of a vast new science museum downtown set for \r\nMonday, visitors will be able \r\n                                        to stand underneath a suspended,\r\n 500,000-gallon aquarium tank and gaze at hammerhead and tiger sharks, \r\nmahi mahi, devil\r\n                                        rays and other creatures through\r\n a 60,000-pound oculus. <br></p><p align=\"justify\">Lens that will give the impression of seeing the fish from the bottom of\r\n a huge cocktail glass. And that’s just one of many\r\n                                        attractions and exhibits. \r\nOfficials at the $305 million Phillip and Patricia Frost Museum of \r\nScience promise that it will be a \r\n                                        vivid expression of modern \r\nscientific inquiry and exposition. Its opening follows a series of \r\nsetbacks and lawsuits and a \r\n                                        scramble to finish the \r\n250,000-square-foot structure. At one point, the project ran \r\nprecariously short of money. The museum\r\n                                        high-profile opening is \r\nespecially significant in a state s <br></p><p align=\"justify\"><br></p><h3 align=\"justify\">Top 5 reason to choose us</h3>\r\n                                    <p align=\"justify\">\r\n                                        Mauna Loa, the biggest volcano \r\non Earth — and one of the most active — covers half the Island of \r\nHawaii. Just 35 miles to the \r\n                                        northeast, Mauna Kea, known to \r\nnative Hawaiians as Mauna a Wakea, rises nearly 14,000 feet above sea \r\nlevel. To them it repre\r\n                                        sents a spiritual connection \r\nbetween our planet and the heavens above. These volcanoes, which have \r\nbeguiled millions of \r\n                                        tourists visiting the Hawaiian \r\nislands, have also plagued scientists with a long-running mystery: If \r\nthey are so close together, \r\n                                        how did they develop in two \r\nparallel tracks along the Hawaiian-Emperor chain formed over the same \r\nhot spot in the Pacific \r\n                                        Ocean — and why are their \r\nchemical compositions so different? \"We knew this was related to \r\nsomething much deeper,\r\n                                        but we couldn’t see what,” said \r\nTim Jones.\r\n                                    </p>', '15542700676-min.jpg', 'www.geniusocean.com', 57, 1, NULL, NULL, 'Business,Research,Mechanical,Process,Innovation,Engineering', '2018-05-06 22:04:36'),
(14, 2, 'How to design effective arts?', '<div align=\"justify\">The recording starts with the patter of a summer squall. Later, a drifting tone like that of a not-quite-tuned-in radio station rises and for a while drowns out the patter. These are the sounds encountered by NASA’s Cassini spacecraft as it dove the gap between Saturn and its innermost ring on April 26, the first of 22 such encounters before it will plunge into atmosphere in September. What Cassini did not detect were many of the collisions of dust particles hitting the spacecraft it passed through the plane of the ringsen the charged particles oscillate in unison.<br><br></div><h3 align=\"justify\" style=\"font-family: \" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" color:=\"\" rgb(51,=\"\" 51,=\"\" 51);\"=\"\">How its Works ?</h3><p align=\"justify\">MIAMI — For decades, South Florida schoolchildren and adults fascinated by far-off galaxies, earthly ecosystems, the proper ties of light and sound and other wonders of science had only a quaint, antiquated museum here in which to explore their interests. Now, with the long-delayed opening of a vast new science museum downtown set for Monday, visitors will be able to stand underneath a suspended, 500,000-gallon aquarium tank and gaze at hammerhead and tiger sharks, mahi mahi, devil rays and other creatures through a 60,000-pound oculus.&nbsp;<br></p><p align=\"justify\">Lens that will give the impression of seeing the fish from the bottom of a huge cocktail glass. And that’s just one of many attractions and exhibits. Officials at the $305 million Phillip and Patricia Frost Museum of Science promise that it will be a vivid expression of modern scientific inquiry and exposition. Its opening follows a series of setbacks and lawsuits and a scramble to finish the 250,000-square-foot structure. At one point, the project ran precariously short of money. The museum high-profile opening is especially significant in a state s&nbsp;<br></p><p align=\"justify\"><br></p><h3 align=\"justify\" style=\"font-family: \" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" color:=\"\" rgb(51,=\"\" 51,=\"\" 51);\"=\"\">Top 5 reason to choose us</h3><p align=\"justify\">Mauna Loa, the biggest volcano on Earth — and one of the most active — covers half the Island of Hawaii. Just 35 miles to the northeast, Mauna Kea, known to native Hawaiians as Mauna a Wakea, rises nearly 14,000 feet above sea level. To them it repre sents a spiritual connection between our planet and the heavens above. These volcanoes, which have beguiled millions of tourists visiting the Hawaiian islands, have also plagued scientists with a long-running mystery: If they are so close together, how did they develop in two parallel tracks along the Hawaiian-Emperor chain formed over the same hot spot in the Pacific Ocean — and why are their chemical compositions so different? \"We knew this was related to something much deeper, but we couldn’t see what,” said Tim Jones.</p>', '15542700595-min.jpg', 'www.geniusocean.com', 3, 1, NULL, NULL, 'Business,Research,Mechanical,Process,Innovation,Engineering', '2018-06-03 06:02:30'),
(15, 3, 'How to design effective arts?', '<div align=\"justify\">The recording starts with the patter of a summer squall. Later, a drifting tone like that of a not-quite-tuned-in radio station rises and for a while drowns out the patter. These are the sounds encountered by NASA’s Cassini spacecraft as it dove the gap between Saturn and its innermost ring on April 26, the first of 22 such encounters before it will plunge into atmosphere in September. What Cassini did not detect were many of the collisions of dust particles hitting the spacecraft it passed through the plane of the ringsen the charged particles oscillate in unison.<br><br></div><h3 align=\"justify\" style=\"font-family: \" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" color:=\"\" rgb(51,=\"\" 51,=\"\" 51);\"=\"\">How its Works ?</h3><p align=\"justify\">MIAMI — For decades, South Florida schoolchildren and adults fascinated by far-off galaxies, earthly ecosystems, the proper ties of light and sound and other wonders of science had only a quaint, antiquated museum here in which to explore their interests. Now, with the long-delayed opening of a vast new science museum downtown set for Monday, visitors will be able to stand underneath a suspended, 500,000-gallon aquarium tank and gaze at hammerhead and tiger sharks, mahi mahi, devil rays and other creatures through a 60,000-pound oculus.&nbsp;<br></p><p align=\"justify\">Lens that will give the impression of seeing the fish from the bottom of a huge cocktail glass. And that’s just one of many attractions and exhibits. Officials at the $305 million Phillip and Patricia Frost Museum of Science promise that it will be a vivid expression of modern scientific inquiry and exposition. Its opening follows a series of setbacks and lawsuits and a scramble to finish the 250,000-square-foot structure. At one point, the project ran precariously short of money. The museum high-profile opening is especially significant in a state s&nbsp;<br></p><p align=\"justify\"><br></p><h3 align=\"justify\" style=\"font-family: \" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" color:=\"\" rgb(51,=\"\" 51,=\"\" 51);\"=\"\">Top 5 reason to choose us</h3><p align=\"justify\">Mauna Loa, the biggest volcano on Earth — and one of the most active — covers half the Island of Hawaii. Just 35 miles to the northeast, Mauna Kea, known to native Hawaiians as Mauna a Wakea, rises nearly 14,000 feet above sea level. To them it repre sents a spiritual connection between our planet and the heavens above. These volcanoes, which have beguiled millions of tourists visiting the Hawaiian islands, have also plagued scientists with a long-running mystery: If they are so close together, how did they develop in two parallel tracks along the Hawaiian-Emperor chain formed over the same hot spot in the Pacific Ocean — and why are their chemical compositions so different? \"We knew this was related to something much deeper, but we couldn’t see what,” said Tim Jones.</p>', '15542700464-min.jpg', 'www.geniusocean.com', 6, 1, NULL, NULL, 'Business,Research,Mechanical,Process,Innovation,Engineering', '2018-07-03 06:02:53'),
(16, 2, 'How to design effective arts?', '<div align=\"justify\">The recording starts with the patter of a summer squall. Later, a drifting tone like that of a not-quite-tuned-in radio station rises and for a while drowns out the patter. These are the sounds encountered by NASA’s Cassini spacecraft as it dove the gap between Saturn and its innermost ring on April 26, the first of 22 such encounters before it will plunge into atmosphere in September. What Cassini did not detect were many of the collisions of dust particles hitting the spacecraft it passed through the plane of the ringsen the charged particles oscillate in unison.<br><br></div><h3 align=\"justify\" style=\"font-family: \" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" color:=\"\" rgb(51,=\"\" 51,=\"\" 51);\"=\"\">How its Works ?</h3><p align=\"justify\">MIAMI — For decades, South Florida schoolchildren and adults fascinated by far-off galaxies, earthly ecosystems, the proper ties of light and sound and other wonders of science had only a quaint, antiquated museum here in which to explore their interests. Now, with the long-delayed opening of a vast new science museum downtown set for Monday, visitors will be able to stand underneath a suspended, 500,000-gallon aquarium tank and gaze at hammerhead and tiger sharks, mahi mahi, devil rays and other creatures through a 60,000-pound oculus.&nbsp;<br></p><p align=\"justify\">Lens that will give the impression of seeing the fish from the bottom of a huge cocktail glass. And that’s just one of many attractions and exhibits. Officials at the $305 million Phillip and Patricia Frost Museum of Science promise that it will be a vivid expression of modern scientific inquiry and exposition. Its opening follows a series of setbacks and lawsuits and a scramble to finish the 250,000-square-foot structure. At one point, the project ran precariously short of money. The museum high-profile opening is especially significant in a state s&nbsp;<br></p><p align=\"justify\"><br></p><h3 align=\"justify\" style=\"font-family: \" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" color:=\"\" rgb(51,=\"\" 51,=\"\" 51);\"=\"\">Top 5 reason to choose us</h3><p align=\"justify\">Mauna Loa, the biggest volcano on Earth — and one of the most active — covers half the Island of Hawaii. Just 35 miles to the northeast, Mauna Kea, known to native Hawaiians as Mauna a Wakea, rises nearly 14,000 feet above sea level. To them it repre sents a spiritual connection between our planet and the heavens above. These volcanoes, which have beguiled millions of tourists visiting the Hawaiian islands, have also plagued scientists with a long-running mystery: If they are so close together, how did they develop in two parallel tracks along the Hawaiian-Emperor chain formed over the same hot spot in the Pacific Ocean — and why are their chemical compositions so different? \"We knew this was related to something much deeper, but we couldn’t see what,” said Tim Jones.</p>', '15542700383-min.jpg', 'www.geniusocean.com', 5, 1, NULL, NULL, 'Business,Research,Mechanical,Process,Innovation,Engineering', '2018-08-03 06:03:14'),
(17, 3, 'How to design effective arts?', '<div align=\"justify\">The recording starts with the patter of a summer squall. Later, a drifting tone like that of a not-quite-tuned-in radio station rises and for a while drowns out the patter. These are the sounds encountered by NASA’s Cassini spacecraft as it dove the gap between Saturn and its innermost ring on April 26, the first of 22 such encounters before it will plunge into atmosphere in September. What Cassini did not detect were many of the collisions of dust particles hitting the spacecraft it passed through the plane of the ringsen the charged particles oscillate in unison.<br><br></div><h3 align=\"justify\" style=\"font-family: \" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" color:=\"\" rgb(51,=\"\" 51,=\"\" 51);\"=\"\">How its Works ?</h3><p align=\"justify\">MIAMI — For decades, South Florida schoolchildren and adults fascinated by far-off galaxies, earthly ecosystems, the proper ties of light and sound and other wonders of science had only a quaint, antiquated museum here in which to explore their interests. Now, with the long-delayed opening of a vast new science museum downtown set for Monday, visitors will be able to stand underneath a suspended, 500,000-gallon aquarium tank and gaze at hammerhead and tiger sharks, mahi mahi, devil rays and other creatures through a 60,000-pound oculus.&nbsp;<br></p><p align=\"justify\">Lens that will give the impression of seeing the fish from the bottom of a huge cocktail glass. And that’s just one of many attractions and exhibits. Officials at the $305 million Phillip and Patricia Frost Museum of Science promise that it will be a vivid expression of modern scientific inquiry and exposition. Its opening follows a series of setbacks and lawsuits and a scramble to finish the 250,000-square-foot structure. At one point, the project ran precariously short of money. The museum high-profile opening is especially significant in a state s&nbsp;<br></p><p align=\"justify\"><br></p><h3 align=\"justify\" style=\"font-family: \" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" color:=\"\" rgb(51,=\"\" 51,=\"\" 51);\"=\"\">Top 5 reason to choose us</h3><p align=\"justify\">Mauna Loa, the biggest volcano on Earth — and one of the most active — covers half the Island of Hawaii. Just 35 miles to the northeast, Mauna Kea, known to native Hawaiians as Mauna a Wakea, rises nearly 14,000 feet above sea level. To them it repre sents a spiritual connection between our planet and the heavens above. These volcanoes, which have beguiled millions of tourists visiting the Hawaiian islands, have also plagued scientists with a long-running mystery: If they are so close together, how did they develop in two parallel tracks along the Hawaiian-Emperor chain formed over the same hot spot in the Pacific Ocean — and why are their chemical compositions so different? \"We knew this was related to something much deeper, but we couldn’t see what,” said Tim Jones.</p>', '15542700322-min.jpg', 'www.geniusocean.com', 50, 1, NULL, NULL, 'Business,Research,Mechanical,Process,Innovation,Engineering', '2019-01-03 06:03:37'),
(18, 2, 'How to design effective arts?', '<div align=\"justify\">The recording starts with the patter of a summer squall. Later, a drifting tone like that of a not-quite-tuned-in radio station rises and for a while drowns out the patter. These are the sounds encountered by NASA’s Cassini spacecraft as it dove the gap between Saturn and its innermost ring on April 26, the first of 22 such encounters before it will plunge into atmosphere in September. What Cassini did not detect were many of the collisions of dust particles hitting the spacecraft it passed through the plane of the ringsen the charged particles oscillate in unison.<br><br></div><h3 align=\"justify\" style=\"font-family: \" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" color:=\"\" rgb(51,=\"\" 51,=\"\" 51);\"=\"\">How its Works ?</h3><p align=\"justify\">MIAMI — For decades, South Florida schoolchildren and adults fascinated by far-off galaxies, earthly ecosystems, the proper ties of light and sound and other wonders of science had only a quaint, antiquated museum here in which to explore their interests. Now, with the long-delayed opening of a vast new science museum downtown set for Monday, visitors will be able to stand underneath a suspended, 500,000-gallon aquarium tank and gaze at hammerhead and tiger sharks, mahi mahi, devil rays and other creatures through a 60,000-pound oculus.&nbsp;<br></p><p align=\"justify\">Lens that will give the impression of seeing the fish from the bottom of a huge cocktail glass. And that’s just one of many attractions and exhibits. Officials at the $305 million Phillip and Patricia Frost Museum of Science promise that it will be a vivid expression of modern scientific inquiry and exposition. Its opening follows a series of setbacks and lawsuits and a scramble to finish the 250,000-square-foot structure. At one point, the project ran precariously short of money. The museum high-profile opening is especially significant in a state s&nbsp;<br></p><p align=\"justify\"><br></p><h3 align=\"justify\" style=\"font-family: \" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" color:=\"\" rgb(51,=\"\" 51,=\"\" 51);\"=\"\">Top 5 reason to choose us</h3><p align=\"justify\">Mauna Loa, the biggest volcano on Earth — and one of the most active — covers half the Island of Hawaii. Just 35 miles to the northeast, Mauna Kea, known to native Hawaiians as Mauna a Wakea, rises nearly 14,000 feet above sea level. To them it repre sents a spiritual connection between our planet and the heavens above. These volcanoes, which have beguiled millions of tourists visiting the Hawaiian islands, have also plagued scientists with a long-running mystery: If they are so close together, how did they develop in two parallel tracks along the Hawaiian-Emperor chain formed over the same hot spot in the Pacific Ocean — and why are their chemical compositions so different? \"We knew this was related to something much deeper, but we couldn’t see what,” said Tim Jones.</p>', '15542700251-min.jpg', 'www.geniusocean.com', 151, 1, NULL, NULL, 'Business,Research,Mechanical,Process,Innovation,Engineering', '2019-01-03 06:03:59'),
(20, 2, 'How to design effective arts?', '<div align=\"justify\">The recording starts with the patter of a summer squall. Later, a drifting tone like that of a not-quite-tuned-in radio station rises and for a while drowns out the patter. These are the sounds encountered by NASA’s Cassini spacecraft as it dove the gap between Saturn and its innermost ring on April 26, the first of 22 such encounters before it will plunge into atmosphere in September. What Cassini did not detect were many of the collisions of dust particles hitting the spacecraft it passed through the plane of the ringsen the charged particles oscillate in unison.<br><br></div><h3 align=\"justify\" style=\"font-family: \" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" color:=\"\" rgb(51,=\"\" 51,=\"\" 51);\"=\"\">How its Works ?</h3><p align=\"justify\">MIAMI — For decades, South Florida schoolchildren and adults fascinated by far-off galaxies, earthly ecosystems, the proper ties of light and sound and other wonders of science had only a quaint, antiquated museum here in which to explore their interests. Now, with the long-delayed opening of a vast new science museum downtown set for Monday, visitors will be able to stand underneath a suspended, 500,000-gallon aquarium tank and gaze at hammerhead and tiger sharks, mahi mahi, devil rays and other creatures through a 60,000-pound oculus.&nbsp;<br></p><p align=\"justify\">Lens that will give the impression of seeing the fish from the bottom of a huge cocktail glass. And that’s just one of many attractions and exhibits. Officials at the $305 million Phillip and Patricia Frost Museum of Science promise that it will be a vivid expression of modern scientific inquiry and exposition. Its opening follows a series of setbacks and lawsuits and a scramble to finish the 250,000-square-foot structure. At one point, the project ran precariously short of money. The museum high-profile opening is especially significant in a state s&nbsp;<br></p><p align=\"justify\"><br></p><h3 align=\"justify\" style=\"font-family: \" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" color:=\"\" rgb(51,=\"\" 51,=\"\" 51);\"=\"\">Top 5 reason to choose us</h3><p align=\"justify\">Mauna Loa, the biggest volcano on Earth — and one of the most active — covers half the Island of Hawaii. Just 35 miles to the northeast, Mauna Kea, known to native Hawaiians as Mauna a Wakea, rises nearly 14,000 feet above sea level. To them it repre sents a spiritual connection between our planet and the heavens above. These volcanoes, which have beguiled millions of tourists visiting the Hawaiian islands, have also plagued scientists with a long-running mystery: If they are so close together, how did they develop in two parallel tracks along the Hawaiian-Emperor chain formed over the same hot spot in the Pacific Ocean — and why are their chemical compositions so different? \"We knew this was related to something much deeper, but we couldn’t see what,” said Tim Jones.</p>', '15542699136-min.jpg', 'www.geniusocean.com', 10, 1, NULL, NULL, 'Business,Research,Mechanical,Process,Innovation,Engineering', '2018-08-03 06:03:14'),
(21, 3, 'How to design effective arts?', '<div align=\"justify\">The recording starts with the patter of a summer squall. Later, a drifting tone like that of a not-quite-tuned-in radio station rises and for a while drowns out the patter. These are the sounds encountered by NASA’s Cassini spacecraft as it dove the gap between Saturn and its innermost ring on April 26, the first of 22 such encounters before it will plunge into atmosphere in September. What Cassini did not detect were many of the collisions of dust particles hitting the spacecraft it passed through the plane of the ringsen the charged particles oscillate in unison.<br><br></div><h3 align=\"justify\" style=\"font-family: \" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" color:=\"\" rgb(51,=\"\" 51,=\"\" 51);\"=\"\">How its Works ?</h3><p align=\"justify\">MIAMI — For decades, South Florida schoolchildren and adults fascinated by far-off galaxies, earthly ecosystems, the proper ties of light and sound and other wonders of science had only a quaint, antiquated museum here in which to explore their interests. Now, with the long-delayed opening of a vast new science museum downtown set for Monday, visitors will be able to stand underneath a suspended, 500,000-gallon aquarium tank and gaze at hammerhead and tiger sharks, mahi mahi, devil rays and other creatures through a 60,000-pound oculus.&nbsp;<br></p><p align=\"justify\">Lens that will give the impression of seeing the fish from the bottom of a huge cocktail glass. And that’s just one of many attractions and exhibits. Officials at the $305 million Phillip and Patricia Frost Museum of Science promise that it will be a vivid expression of modern scientific inquiry and exposition. Its opening follows a series of setbacks and lawsuits and a scramble to finish the 250,000-square-foot structure. At one point, the project ran precariously short of money. The museum high-profile opening is especially significant in a state s&nbsp;<br></p><p align=\"justify\"><br></p><h3 align=\"justify\" style=\"font-family: \" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" color:=\"\" rgb(51,=\"\" 51,=\"\" 51);\"=\"\">Top 5 reason to choose us</h3><p align=\"justify\">Mauna Loa, the biggest volcano on Earth — and one of the most active — covers half the Island of Hawaii. Just 35 miles to the northeast, Mauna Kea, known to native Hawaiians as Mauna a Wakea, rises nearly 14,000 feet above sea level. To them it repre sents a spiritual connection between our planet and the heavens above. These volcanoes, which have beguiled millions of tourists visiting the Hawaiian islands, have also plagued scientists with a long-running mystery: If they are so close together, how did they develop in two parallel tracks along the Hawaiian-Emperor chain formed over the same hot spot in the Pacific Ocean — and why are their chemical compositions so different? \"We knew this was related to something much deeper, but we couldn’t see what,” said Tim Jones.</p>', '15542699045-min.jpg', 'www.geniusocean.com', 36, 1, NULL, NULL, 'Business,Research,Mechanical,Process,Innovation,Engineering', '2019-01-03 06:03:37'),
(22, 2, 'How to design effective arts?', '<div align=\"justify\">The recording starts with the patter of a summer squall. Later, a drifting tone like that of a not-quite-tuned-in radio station rises and for a while drowns out the patter. These are the sounds encountered by NASA’s Cassini spacecraft as it dove the gap between Saturn and its innermost ring on April 26, the first of 22 such encounters before it will plunge into atmosphere in September. What Cassini did not detect were many of the collisions of dust particles hitting the spacecraft it passed through the plane of the ringsen the charged particles oscillate in unison.<br><br></div><h3 align=\"justify\" style=\"font-family: \" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" color:=\"\" rgb(51,=\"\" 51,=\"\" 51);\"=\"\">How its Works ?</h3><p align=\"justify\">MIAMI — For decades, South Florida schoolchildren and adults fascinated by far-off galaxies, earthly ecosystems, the proper ties of light and sound and other wonders of science had only a quaint, antiquated museum here in which to explore their interests. Now, with the long-delayed opening of a vast new science museum downtown set for Monday, visitors will be able to stand underneath a suspended, 500,000-gallon aquarium tank and gaze at hammerhead and tiger sharks, mahi mahi, devil rays and other creatures through a 60,000-pound oculus.&nbsp;<br></p><p align=\"justify\">Lens that will give the impression of seeing the fish from the bottom of a huge cocktail glass. And that’s just one of many attractions and exhibits. Officials at the $305 million Phillip and Patricia Frost Museum of Science promise that it will be a vivid expression of modern scientific inquiry and exposition. Its opening follows a series of setbacks and lawsuits and a scramble to finish the 250,000-square-foot structure. At one point, the project ran precariously short of money. The museum high-profile opening is especially significant in a state s&nbsp;<br></p><p align=\"justify\"><br></p><h3 align=\"justify\" style=\"font-family: \" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" color:=\"\" rgb(51,=\"\" 51,=\"\" 51);\"=\"\">Top 5 reason to choose us</h3><p align=\"justify\">Mauna Loa, the biggest volcano on Earth — and one of the most active — covers half the Island of Hawaii. Just 35 miles to the northeast, Mauna Kea, known to native Hawaiians as Mauna a Wakea, rises nearly 14,000 feet above sea level. To them it repre sents a spiritual connection between our planet and the heavens above. These volcanoes, which have beguiled millions of tourists visiting the Hawaiian islands, have also plagued scientists with a long-running mystery: If they are so close together, how did they develop in two parallel tracks along the Hawaiian-Emperor chain formed over the same hot spot in the Pacific Ocean — and why are their chemical compositions so different? \"We knew this was related to something much deeper, but we couldn’t see what,” said Tim Jones.</p>', '15542698954-min.jpg', 'www.geniusocean.com', 68, 1, NULL, NULL, 'Business,Research,Mechanical,Process,Innovation,Engineering', '2019-01-03 06:03:59'),
(23, 7, 'How to design effective arts?', '<div align=\"justify\">The recording starts with the patter of a summer squall. Later, a drifting tone like that of a not-quite-tuned-in radio station rises and for a while drowns out the patter. These are the sounds encountered by NASA’s Cassini spacecraft as it dove the gap between Saturn and its innermost ring on April 26, the first of 22 such encounters before it will plunge into atmosphere in September. What Cassini did not detect were many of the collisions of dust particles hitting the spacecraft it passed through the plane of the ringsen the charged particles oscillate in unison.<br><br></div><h3 align=\"justify\" style=\"font-family: \" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" color:=\"\" rgb(51,=\"\" 51,=\"\" 51);\"=\"\">How its Works ?</h3><p align=\"justify\">MIAMI — For decades, South Florida schoolchildren and adults fascinated by far-off galaxies, earthly ecosystems, the proper ties of light and sound and other wonders of science had only a quaint, antiquated museum here in which to explore their interests. Now, with the long-delayed opening of a vast new science museum downtown set for Monday, visitors will be able to stand underneath a suspended, 500,000-gallon aquarium tank and gaze at hammerhead and tiger sharks, mahi mahi, devil rays and other creatures through a 60,000-pound oculus.&nbsp;<br></p><p align=\"justify\">Lens that will give the impression of seeing the fish from the bottom of a huge cocktail glass. And that’s just one of many attractions and exhibits. Officials at the $305 million Phillip and Patricia Frost Museum of Science promise that it will be a vivid expression of modern scientific inquiry and exposition. Its opening follows a series of setbacks and lawsuits and a scramble to finish the 250,000-square-foot structure. At one point, the project ran precariously short of money. The museum high-profile opening is especially significant in a state s&nbsp;<br></p><p align=\"justify\"><br></p><h3 align=\"justify\" style=\"font-family: \" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" color:=\"\" rgb(51,=\"\" 51,=\"\" 51);\"=\"\">Top 5 reason to choose us</h3><p align=\"justify\">Mauna Loa, the biggest volcano on Earth — and one of the most active — covers half the Island of Hawaii. Just 35 miles to the northeast, Mauna Kea, known to native Hawaiians as Mauna a Wakea, rises nearly 14,000 feet above sea level. To them it repre sents a spiritual connection between our planet and the heavens above. These volcanoes, which have beguiled millions of tourists visiting the Hawaiian islands, have also plagued scientists with a long-running mystery: If they are so close together, how did they develop in two parallel tracks along the Hawaiian-Emperor chain formed over the same hot spot in the Pacific Ocean — and why are their chemical compositions so different? \"We knew this was related to something much deeper, but we couldn’t see what,” said Tim Jones.</p>', '15542698893-min.jpg', 'www.geniusocean.com', 5, 1, NULL, NULL, 'Business,Research,Mechanical,Process,Innovation,Engineering', '2018-08-03 06:03:14'),
(24, 3, 'How to design effective arts?', '<div align=\"justify\">The recording starts with the patter of a summer squall. Later, a drifting tone like that of a not-quite-tuned-in radio station rises and for a while drowns out the patter. These are the sounds encountered by NASA’s Cassini spacecraft as it dove the gap between Saturn and its innermost ring on April 26, the first of 22 such encounters before it will plunge into atmosphere in September. What Cassini did not detect were many of the collisions of dust particles hitting the spacecraft it passed through the plane of the ringsen the charged particles oscillate in unison.<br><br></div><h3 align=\"justify\" style=\"font-family: \" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" color:=\"\" rgb(51,=\"\" 51,=\"\" 51);\"=\"\">How its Works ?</h3><p align=\"justify\">MIAMI — For decades, South Florida schoolchildren and adults fascinated by far-off galaxies, earthly ecosystems, the proper ties of light and sound and other wonders of science had only a quaint, antiquated museum here in which to explore their interests. Now, with the long-delayed opening of a vast new science museum downtown set for Monday, visitors will be able to stand underneath a suspended, 500,000-gallon aquarium tank and gaze at hammerhead and tiger sharks, mahi mahi, devil rays and other creatures through a 60,000-pound oculus.&nbsp;<br></p><p align=\"justify\">Lens that will give the impression of seeing the fish from the bottom of a huge cocktail glass. And that’s just one of many attractions and exhibits. Officials at the $305 million Phillip and Patricia Frost Museum of Science promise that it will be a vivid expression of modern scientific inquiry and exposition. Its opening follows a series of setbacks and lawsuits and a scramble to finish the 250,000-square-foot structure. At one point, the project ran precariously short of money. The museum high-profile opening is especially significant in a state s&nbsp;<br></p><p align=\"justify\"><br></p><h3 align=\"justify\" style=\"font-family: \" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" color:=\"\" rgb(51,=\"\" 51,=\"\" 51);\"=\"\">Top 5 reason to choose us</h3><p align=\"justify\">Mauna Loa, the biggest volcano on Earth — and one of the most active — covers half the Island of Hawaii. Just 35 miles to the northeast, Mauna Kea, known to native Hawaiians as Mauna a Wakea, rises nearly 14,000 feet above sea level. To them it repre sents a spiritual connection between our planet and the heavens above. These volcanoes, which have beguiled millions of tourists visiting the Hawaiian islands, have also plagued scientists with a long-running mystery: If they are so close together, how did they develop in two parallel tracks along the Hawaiian-Emperor chain formed over the same hot spot in the Pacific Ocean — and why are their chemical compositions so different? \"We knew this was related to something much deeper, but we couldn’t see what,” said Tim Jones.</p>', '15542698832-min.jpg', 'www.geniusocean.com', 35, 1, NULL, NULL, 'Business,Research,Mechanical,Process,Innovation,Engineering', '2019-01-03 06:03:37');
INSERT INTO `blogs` (`id`, `category_id`, `title`, `details`, `photo`, `source`, `views`, `status`, `meta_tag`, `meta_description`, `tags`, `created_at`) VALUES
(25, 3, 'How to design effective arts?', '<div align=\"justify\">The recording starts with the patter of a summer squall. Later, a drifting tone like that of a not-quite-tuned-in radio station rises and for a while drowns out the patter. These are the sounds encountered by NASA’s Cassini spacecraft as it dove the gap between Saturn and its innermost ring on April 26, the first of 22 such encounters before it will plunge into atmosphere in September. What Cassini did not detect were many of the collisions of dust particles hitting the spacecraft it passed through the plane of the ringsen the charged particles oscillate in unison.<br><br></div><h3 align=\"justify\" style=\"font-family: \" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" color:=\"\" rgb(51,=\"\" 51,=\"\" 51);\"=\"\">How its Works ?</h3><p align=\"justify\">MIAMI — For decades, South Florida schoolchildren and adults fascinated by far-off galaxies, earthly ecosystems, the proper ties of light and sound and other wonders of science had only a quaint, antiquated museum here in which to explore their interests. Now, with the long-delayed opening of a vast new science museum downtown set for Monday, visitors will be able to stand underneath a suspended, 500,000-gallon aquarium tank and gaze at hammerhead and tiger sharks, mahi mahi, devil rays and other creatures through a 60,000-pound oculus.&nbsp;<br></p><p align=\"justify\">Lens that will give the impression of seeing the fish from the bottom of a huge cocktail glass. And that’s just one of many attractions and exhibits. Officials at the $305 million Phillip and Patricia Frost Museum of Science promise that it will be a vivid expression of modern scientific inquiry and exposition. Its opening follows a series of setbacks and lawsuits and a scramble to finish the 250,000-square-foot structure. At one point, the project ran precariously short of money. The museum high-profile opening is especially significant in a state s&nbsp;<br></p><p align=\"justify\"><br></p><h3 align=\"justify\" style=\"font-family: \" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" color:=\"\" rgb(51,=\"\" 51,=\"\" 51);\"=\"\">Top 5 reason to choose us</h3><p align=\"justify\">Mauna Loa, the biggest volcano on Earth — and one of the most active — covers half the Island of Hawaii. Just 35 miles to the northeast, Mauna Kea, known to native Hawaiians as Mauna a Wakea, rises nearly 14,000 feet above sea level. To them it repre sents a spiritual connection between our planet and the heavens above. These volcanoes, which have beguiled millions of tourists visiting the Hawaiian islands, have also plagued scientists with a long-running mystery: If they are so close together, how did they develop in two parallel tracks along the Hawaiian-Emperor chain formed over the same hot spot in the Pacific Ocean — and why are their chemical compositions so different? \"We knew this was related to something much deeper, but we couldn’t see what,” said Tim Jones.</p>', '15557542831-min.jpg', 'www.geniusocean.com', 42, 1, NULL, NULL, 'Business,Research,Mechanical,Process,Innovation,Engineering', '2019-01-03 06:03:59');

-- --------------------------------------------------------

--
-- Table structure for table `blog_categories`
--

CREATE TABLE `blog_categories` (
  `id` int(191) NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `blog_categories`
--

INSERT INTO `blog_categories` (`id`, `name`, `slug`) VALUES
(2, 'Oil & gas', 'oil-and-gas'),
(3, 'Manufacturing', 'manufacturing'),
(4, 'Chemical Research', 'chemical_research'),
(5, 'Agriculture', 'agriculture'),
(6, 'Mechanical', 'mechanical'),
(7, 'Entrepreneurs', 'entrepreneurs'),
(8, 'Technology', 'technology');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(191) NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `photo` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_featured` tinyint(1) NOT NULL DEFAULT 0,
  `image` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `commission` double NOT NULL DEFAULT 0,
  `commission_type` enum('fixed','percentage') NOT NULL DEFAULT 'percentage'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`, `status`, `photo`, `is_featured`, `image`, `commission`, `commission_type`) VALUES
(4, 'Milk Powder', 'milk-powder', 1, '16558196491.png', 0, '1568709131f6.jpg', 0, 'fixed'),
(5, 'Biscuits And Cookies', 'biscuits-and-cookies', 1, '16558196782.png', 0, '1568709123f1.jpg', 3, 'fixed'),
(8, 'Tea Coffee Cup', 'tea-coffee-cup', 1, '16558196293.png', 0, '1568709577f8.jpg', 0, 'fixed'),
(11, 'Sugar', 'sugar', 1, '16558196144.png', 0, '1568709050f8.jpg', 0, 'fixed'),
(18, 'Tea Leaf', 'tea-leaf', 1, '16558195805.png', 0, NULL, 1, 'fixed'),
(20, 'Coffee', 'Coffee', 1, '1659798116coffee.png', 0, NULL, 0, 'percentage');

-- --------------------------------------------------------

--
-- Table structure for table `childcategories`
--

CREATE TABLE `childcategories` (
  `id` int(191) NOT NULL,
  `subcategory_id` int(191) NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `childcategories`
--

INSERT INTO `childcategories` (`id`, `subcategory_id`, `name`, `slug`, `status`) VALUES
(1, 2, 'LCD TV', 'lcd-tv', 1);

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int(191) NOT NULL,
  `user_id` int(191) UNSIGNED NOT NULL,
  `product_id` int(191) UNSIGNED NOT NULL,
  `text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `conversations`
--

CREATE TABLE `conversations` (
  `id` int(191) NOT NULL,
  `subject` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sent_user` int(191) NOT NULL,
  `recieved_user` int(191) NOT NULL,
  `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `conversations`
--

INSERT INTO `conversations` (`id`, `subject`, `sent_user`, `recieved_user`, `message`, `created_at`, `updated_at`) VALUES
(2, 'tes', 40, 40, 'hj', '2022-05-11 08:28:34', '2022-05-11 08:28:34');

-- --------------------------------------------------------

--
-- Table structure for table `counters`
--

CREATE TABLE `counters` (
  `id` int(11) NOT NULL,
  `type` enum('referral','browser') NOT NULL DEFAULT 'referral',
  `referral` varchar(255) DEFAULT NULL,
  `total_count` int(11) NOT NULL DEFAULT 0,
  `todays_count` int(11) NOT NULL DEFAULT 0,
  `today` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `id` int(11) NOT NULL,
  `country_code` varchar(2) NOT NULL DEFAULT '',
  `country_name` varchar(100) NOT NULL DEFAULT '',
  `tax` double NOT NULL DEFAULT 0,
  `status` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `country_code`, `country_name`, `tax`, `status`) VALUES
(1, 'AF', 'Afghanistan', 0, 0),
(2, 'AL', 'Albania', 0, 0),
(3, 'DZ', 'Algeria', 0, 0),
(4, 'DS', 'American Samoa', 0, 0),
(5, 'AD', 'Andorra', 0, 0),
(6, 'AO', 'Angola', 0, 0),
(7, 'AI', 'Anguilla', 0, 0),
(8, 'AQ', 'Antarctica', 0, 0),
(9, 'AG', 'Antigua and Barbuda', 0, 0),
(10, 'AR', 'Argentina', 0, 0),
(11, 'AM', 'Armenia', 0, 0),
(12, 'AW', 'Aruba', 0, 0),
(13, 'AU', 'Australia', 0, 0),
(14, 'AT', 'Austria', 0, 0),
(15, 'AZ', 'Azerbaijan', 0, 0),
(16, 'BS', 'Bahamas', 0, 0),
(17, 'BH', 'Bahrain', 0, 0),
(18, 'BD', 'Bangladesh', 0, 0),
(19, 'BB', 'Barbados', 0, 0),
(20, 'BY', 'Belarus', 0, 0),
(21, 'BE', 'Belgium', 0, 0),
(22, 'BZ', 'Belize', 0, 0),
(23, 'BJ', 'Benin', 0, 0),
(24, 'BM', 'Bermuda', 0, 0),
(25, 'BT', 'Bhutan', 0, 0),
(26, 'BO', 'Bolivia', 0, 0),
(27, 'BA', 'Bosnia and Herzegovina', 0, 0),
(28, 'BW', 'Botswana', 0, 0),
(29, 'BV', 'Bouvet Island', 0, 0),
(30, 'BR', 'Brazil', 0, 0),
(31, 'IO', 'British Indian Ocean Territory', 0, 0),
(32, 'BN', 'Brunei Darussalam', 0, 0),
(33, 'BG', 'Bulgaria', 0, 0),
(34, 'BF', 'Burkina Faso', 0, 0),
(35, 'BI', 'Burundi', 0, 0),
(36, 'KH', 'Cambodia', 0, 0),
(37, 'CM', 'Cameroon', 0, 0),
(38, 'CA', 'Canada', 0, 0),
(39, 'CV', 'Cape Verde', 0, 0),
(40, 'KY', 'Cayman Islands', 0, 0),
(41, 'CF', 'Central African Republic', 0, 0),
(42, 'TD', 'Chad', 0, 0),
(43, 'CL', 'Chile', 0, 0),
(44, 'CN', 'China', 0, 0),
(45, 'CX', 'Christmas Island', 0, 0),
(46, 'CC', 'Cocos (Keeling) Islands', 0, 0),
(47, 'CO', 'Colombia', 0, 0),
(48, 'KM', 'Comoros', 0, 0),
(49, 'CD', 'Democratic Republic of the Congo', 0, 0),
(50, 'CG', 'Republic of Congo', 0, 0),
(51, 'CK', 'Cook Islands', 0, 0),
(52, 'CR', 'Costa Rica', 0, 0),
(53, 'HR', 'Croatia (Hrvatska)', 0, 0),
(54, 'CU', 'Cuba', 0, 0),
(55, 'CY', 'Cyprus', 0, 0),
(56, 'CZ', 'Czech Republic', 0, 0),
(57, 'DK', 'Denmark', 0, 0),
(58, 'DJ', 'Djibouti', 0, 0),
(59, 'DM', 'Dominica', 0, 0),
(60, 'DO', 'Dominican Republic', 0, 0),
(61, 'TP', 'East Timor', 0, 0),
(62, 'EC', 'Ecuador', 0, 0),
(63, 'EG', 'Egypt', 0, 0),
(64, 'SV', 'El Salvador', 0, 0),
(65, 'GQ', 'Equatorial Guinea', 0, 0),
(66, 'ER', 'Eritrea', 0, 0),
(67, 'EE', 'Estonia', 0, 0),
(68, 'ET', 'Ethiopia', 0, 0),
(69, 'FK', 'Falkland Islands (Malvinas)', 0, 0),
(70, 'FO', 'Faroe Islands', 0, 0),
(71, 'FJ', 'Fiji', 0, 0),
(72, 'FI', 'Finland', 0, 0),
(73, 'FR', 'France', 0, 0),
(74, 'FX', 'France, Metropolitan', 0, 0),
(75, 'GF', 'French Guiana', 0, 0),
(76, 'PF', 'French Polynesia', 0, 0),
(77, 'TF', 'French Southern Territories', 0, 0),
(78, 'GA', 'Gabon', 0, 0),
(79, 'GM', 'Gambia', 0, 0),
(80, 'GE', 'Georgia', 0, 0),
(81, 'DE', 'Germany', 0, 0),
(82, 'GH', 'Ghana', 0, 0),
(83, 'GI', 'Gibraltar', 0, 0),
(84, 'GK', 'Guernsey', 0, 0),
(85, 'GR', 'Greece', 0, 0),
(86, 'GL', 'Greenland', 0, 0),
(87, 'GD', 'Grenada', 0, 0),
(88, 'GP', 'Guadeloupe', 0, 0),
(89, 'GU', 'Guam', 0, 0),
(90, 'GT', 'Guatemala', 0, 0),
(91, 'GN', 'Guinea', 0, 0),
(92, 'GW', 'Guinea-Bissau', 0, 0),
(93, 'GY', 'Guyana', 0, 0),
(94, 'HT', 'Haiti', 0, 0),
(95, 'HM', 'Heard and Mc Donald Islands', 0, 0),
(96, 'HN', 'Honduras', 0, 0),
(97, 'HK', 'Hong Kong', 0, 0),
(98, 'HU', 'Hungary', 0, 0),
(99, 'IS', 'Iceland', 0, 0),
(100, 'IN', 'India', 0, 1),
(101, 'IM', 'Isle of Man', 0, 0),
(102, 'ID', 'Indonesia', 0, 0),
(103, 'IR', 'Iran (Islamic Republic of)', 0, 0),
(104, 'IQ', 'Iraq', 0, 0),
(105, 'IE', 'Ireland', 0, 0),
(106, 'IL', 'Israel', 0, 0),
(107, 'IT', 'Italy', 0, 0),
(108, 'CI', 'Ivory Coast', 0, 0),
(109, 'JE', 'Jersey', 0, 0),
(110, 'JM', 'Jamaica', 0, 0),
(111, 'JP', 'Japan', 0, 0),
(112, 'JO', 'Jordan', 0, 0),
(113, 'KZ', 'Kazakhstan', 0, 0),
(114, 'KE', 'Kenya', 0, 0),
(115, 'KI', 'Kiribati', 0, 0),
(116, 'KP', 'Korea, Democratic People\'s Republic of', 0, 0),
(117, 'KR', 'Korea, Republic of', 0, 0),
(118, 'XK', 'Kosovo', 0, 0),
(119, 'KW', 'Kuwait', 0, 0),
(120, 'KG', 'Kyrgyzstan', 0, 0),
(121, 'LA', 'Lao People\'s Democratic Republic', 0, 0),
(122, 'LV', 'Latvia', 0, 0),
(123, 'LB', 'Lebanon', 0, 0),
(124, 'LS', 'Lesotho', 0, 0),
(125, 'LR', 'Liberia', 0, 0),
(126, 'LY', 'Libyan Arab Jamahiriya', 0, 0),
(127, 'LI', 'Liechtenstein', 0, 0),
(128, 'LT', 'Lithuania', 0, 0),
(129, 'LU', 'Luxembourg', 0, 0),
(130, 'MO', 'Macau', 0, 0),
(131, 'MK', 'North Macedonia', 0, 0),
(132, 'MG', 'Madagascar', 0, 0),
(133, 'MW', 'Malawi', 0, 0),
(134, 'MY', 'Malaysia', 0, 0),
(135, 'MV', 'Maldives', 0, 0),
(136, 'ML', 'Mali', 0, 0),
(137, 'MT', 'Malta', 0, 0),
(138, 'MH', 'Marshall Islands', 0, 0),
(139, 'MQ', 'Martinique', 0, 0),
(140, 'MR', 'Mauritania', 0, 0),
(141, 'MU', 'Mauritius', 0, 0),
(142, 'TY', 'Mayotte', 0, 0),
(143, 'MX', 'Mexico', 0, 0),
(144, 'FM', 'Micronesia, Federated States of', 0, 0),
(145, 'MD', 'Moldova, Republic of', 0, 0),
(146, 'MC', 'Monaco', 0, 0),
(147, 'MN', 'Mongolia', 0, 0),
(148, 'ME', 'Montenegro', 0, 0),
(149, 'MS', 'Montserrat', 0, 0),
(150, 'MA', 'Morocco', 0, 0),
(151, 'MZ', 'Mozambique', 0, 0),
(152, 'MM', 'Myanmar', 0, 0),
(153, 'NA', 'Namibia', 0, 0),
(154, 'NR', 'Nauru', 0, 0),
(155, 'NP', 'Nepal', 0, 0),
(156, 'NL', 'Netherlands', 0, 0),
(157, 'AN', 'Netherlands Antilles', 0, 0),
(158, 'NC', 'New Caledonia', 0, 0),
(159, 'NZ', 'New Zealand', 0, 0),
(160, 'NI', 'Nicaragua', 0, 0),
(161, 'NE', 'Niger', 0, 0),
(162, 'NG', 'Nigeria', 0, 0),
(163, 'NU', 'Niue', 0, 0),
(164, 'NF', 'Norfolk Island', 0, 0),
(165, 'MP', 'Northern Mariana Islands', 0, 0),
(166, 'NO', 'Norway', 0, 0),
(167, 'OM', 'Oman', 0, 0),
(168, 'PK', 'Pakistan', 0, 0),
(169, 'PW', 'Palau', 0, 0),
(170, 'PS', 'Palestine', 0, 0),
(171, 'PA', 'Panama', 0, 0),
(172, 'PG', 'Papua New Guinea', 0, 0),
(173, 'PY', 'Paraguay', 0, 0),
(174, 'PE', 'Peru', 0, 0),
(175, 'PH', 'Philippines', 0, 0),
(176, 'PN', 'Pitcairn', 0, 0),
(177, 'PL', 'Poland', 0, 0),
(178, 'PT', 'Portugal', 0, 0),
(179, 'PR', 'Puerto Rico', 0, 0),
(180, 'QA', 'Qatar', 0, 0),
(181, 'RE', 'Reunion', 0, 0),
(182, 'RO', 'Romania', 0, 0),
(183, 'RU', 'Russian Federation', 0, 0),
(184, 'RW', 'Rwanda', 0, 0),
(185, 'KN', 'Saint Kitts and Nevis', 0, 0),
(186, 'LC', 'Saint Lucia', 0, 0),
(187, 'VC', 'Saint Vincent and the Grenadines', 0, 0),
(188, 'WS', 'Samoa', 0, 0),
(189, 'SM', 'San Marino', 0, 0),
(190, 'ST', 'Sao Tome and Principe', 0, 0),
(191, 'SA', 'Saudi Arabia', 0, 0),
(192, 'SN', 'Senegal', 0, 0),
(193, 'RS', 'Serbia', 0, 0),
(194, 'SC', 'Seychelles', 0, 0),
(195, 'SL', 'Sierra Leone', 0, 0),
(196, 'SG', 'Singapore', 0, 0),
(197, 'SK', 'Slovakia', 0, 0),
(198, 'SI', 'Slovenia', 0, 0),
(199, 'SB', 'Solomon Islands', 0, 0),
(200, 'SO', 'Somalia', 0, 0),
(201, 'ZA', 'South Africa', 0, 0),
(202, 'GS', 'South Georgia South Sandwich Islands', 0, 0),
(203, 'SS', 'South Sudan', 0, 0),
(204, 'ES', 'Spain', 0, 0),
(205, 'LK', 'Sri Lanka', 0, 0),
(206, 'SH', 'St. Helena', 0, 0),
(207, 'PM', 'St. Pierre and Miquelon', 0, 0),
(208, 'SD', 'Sudan', 0, 0),
(209, 'SR', 'Suriname', 0, 0),
(210, 'SJ', 'Svalbard and Jan Mayen Islands', 0, 0),
(211, 'SZ', 'Swaziland', 0, 0),
(212, 'SE', 'Sweden', 0, 0),
(213, 'CH', 'Switzerland', 0, 0),
(214, 'SY', 'Syrian Arab Republic', 0, 0),
(215, 'TW', 'Taiwan', 0, 0),
(216, 'TJ', 'Tajikistan', 0, 0),
(217, 'TZ', 'Tanzania, United Republic of', 0, 0),
(218, 'TH', 'Thailand', 0, 0),
(219, 'TG', 'Togo', 0, 0),
(220, 'TK', 'Tokelau', 0, 0),
(221, 'TO', 'Tonga', 0, 0),
(222, 'TT', 'Trinidad and Tobago', 0, 0),
(223, 'TN', 'Tunisia', 0, 0),
(224, 'TR', 'Turkey', 0, 0),
(225, 'TM', 'Turkmenistan', 0, 0),
(226, 'TC', 'Turks and Caicos Islands', 0, 0),
(227, 'TV', 'Tuvalu', 0, 0),
(228, 'UG', 'Uganda', 0, 0),
(229, 'UA', 'Ukraine', 0, 0),
(230, 'AE', 'United Arab Emirates', 0, 0),
(231, 'GB', 'United Kingdom', 0, 0),
(232, 'US', 'United States', 0, 0),
(233, 'UM', 'United States minor outlying islands', 0, 0),
(234, 'UY', 'Uruguay', 0, 0),
(235, 'UZ', 'Uzbekistan', 0, 0),
(236, 'VU', 'Vanuatu', 0, 0),
(237, 'VA', 'Vatican City State', 0, 0),
(238, 'VE', 'Venezuela', 0, 0),
(239, 'VN', 'Vietnam', 0, 0),
(240, 'VG', 'Virgin Islands (British)', 0, 0),
(241, 'VI', 'Virgin Islands (U.S.)', 0, 0),
(242, 'WF', 'Wallis and Futuna Islands', 0, 0),
(243, 'EH', 'Western Sahara', 0, 0),
(244, 'YE', 'Yemen', 0, 0),
(245, 'ZM', 'Zambia', 5, 0),
(246, 'ZW', 'Zimbabwe', 3, 0);

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` int(11) NOT NULL,
  `code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` tinyint(4) NOT NULL,
  `price` double NOT NULL,
  `times` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `used` int(191) UNSIGNED NOT NULL DEFAULT 0,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `coupon_type` varchar(255) DEFAULT NULL,
  `category` int(11) DEFAULT NULL,
  `sub_category` int(11) DEFAULT NULL,
  `child_category` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `coupons`
--

INSERT INTO `coupons` (`id`, `code`, `type`, `price`, `times`, `used`, `status`, `start_date`, `end_date`, `coupon_type`, `category`, `sub_category`, `child_category`) VALUES
(1, 'eqwe', 1, 12.22, '990', 18, 1, '2019-01-15', '2020-08-20', NULL, NULL, NULL, NULL),
(2, 'sdsdsasd', 0, 11, NULL, 2, 1, '2019-05-23', '2022-05-26', NULL, NULL, NULL, NULL),
(3, 'werwd', 0, 22, NULL, 3, 1, '2019-05-23', '2023-06-08', NULL, NULL, NULL, NULL),
(4, 'asdasd', 1, 23.5, NULL, 1, 1, '2019-05-23', '2020-05-28', NULL, NULL, NULL, NULL),
(5, 'kopakopakopa', 0, 40, NULL, 3, 1, '2019-05-23', '2032-05-20', NULL, NULL, NULL, NULL),
(6, 'rererere', 1, 9, '665', 1, 1, '2021-05-24', '2023-05-25', 'category', 4, NULL, NULL),
(7, '1234', 1, 50, '5', 0, 1, '2021-03-16', '2021-03-27', 'category', 4, NULL, NULL),
(8, 'aaaa', 0, 50, '5', 0, 1, '2021-03-31', '2023-03-31', 'sub_category', NULL, 2, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cross_selling_products`
--

CREATE TABLE `cross_selling_products` (
  `id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `cross_selling_product_id` int(11) DEFAULT NULL,
  `type` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'vendor / admin',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `owner_id` int(11) NOT NULL DEFAULT 0,
  `preloaded` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cross_selling_products`
--

INSERT INTO `cross_selling_products` (`id`, `product_id`, `cross_selling_product_id`, `type`, `created_at`, `updated_at`, `owner_id`, `preloaded`) VALUES
(7, 179, 135, 'vendor', '2021-02-09 02:15:04', '2021-02-09 02:15:04', 0, 0),
(8, 179, 144, 'vendor', '2021-02-09 02:15:04', '2021-02-09 02:15:04', 0, 0),
(9, 179, 119, 'vendor', '2021-02-09 02:15:04', '2021-02-09 02:15:04', 0, 0),
(10, 179, 166, 'admin', '2021-02-09 02:15:05', '2021-02-09 02:15:05', 0, 0),
(11, 178, 135, 'vendor', '2021-02-09 02:15:23', '2021-02-09 02:15:23', 0, 0),
(12, 178, 144, 'vendor', '2021-02-09 02:15:23', '2021-02-09 02:15:23', 0, 0),
(13, 178, 116, 'vendor', '2021-02-09 02:15:23', '2021-02-09 02:15:23', 0, 0),
(14, 175, 135, 'vendor', '2021-02-09 02:15:40', '2021-02-09 02:15:40', 0, 0),
(15, 175, 144, 'vendor', '2021-02-09 02:15:40', '2021-02-09 02:15:40', 0, 0),
(16, 175, 119, 'vendor', '2021-02-09 02:15:40', '2021-02-09 02:15:40', 0, 0),
(17, 175, 93, 'admin', '2021-02-09 02:15:40', '2021-02-09 02:15:40', 0, 0),
(18, 175, 166, 'admin', '2021-02-09 02:15:40', '2021-02-09 02:15:40', 0, 0),
(19, 173, 135, 'vendor', '2021-02-09 02:16:04', '2021-02-09 02:16:04', 0, 0),
(20, 173, 144, 'vendor', '2021-02-09 02:16:04', '2021-02-09 02:16:04', 0, 0),
(21, 173, 119, 'vendor', '2021-02-09 02:16:04', '2021-02-09 02:16:04', 0, 0),
(22, 170, 135, 'vendor', '2021-02-09 02:16:18', '2021-02-09 02:16:18', 0, 0),
(23, 170, 144, 'vendor', '2021-02-09 02:16:18', '2021-02-09 02:16:18', 0, 0),
(24, 170, 117, 'vendor', '2021-02-09 02:16:18', '2021-02-09 02:16:18', 0, 0),
(25, 170, 93, 'admin', '2021-02-09 02:16:18', '2021-02-09 02:16:18', 0, 0),
(26, 168, 112, 'vendor', '2021-02-09 02:17:42', '2021-02-09 02:17:42', 0, 0),
(27, 168, 114, 'vendor', '2021-02-09 02:17:42', '2021-02-09 02:17:42', 0, 0),
(28, 168, 179, 'vendor', '2021-02-09 02:17:42', '2021-02-09 02:17:42', 0, 0),
(29, 167, 144, 'vendor', '2021-02-09 02:19:54', '2021-02-09 02:19:54', 0, 0),
(30, 167, 166, 'admin', '2021-02-09 02:19:54', '2021-02-09 02:19:54', 0, 0),
(37, 180, 135, 'vendor', '2021-03-11 03:27:13', '2021-03-11 03:27:13', 0, 0),
(38, 180, 144, 'vendor', '2021-03-11 03:27:13', '2021-03-11 03:27:13', 0, 0),
(39, 180, 99, 'vendor', '2021-03-11 03:27:13', '2021-03-11 03:27:13', 0, 0),
(40, 180, 164, 'vendor', '2021-03-11 03:27:13', '2021-03-11 03:27:13', 0, 0),
(41, 180, 93, 'admin', '2021-03-11 03:27:13', '2021-03-11 03:27:13', 0, 0),
(42, 180, 166, 'admin', '2021-03-11 03:27:13', '2021-03-11 03:27:13', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `cs_category_relations`
--

CREATE TABLE `cs_category_relations` (
  `id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `category_type` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cs_category_id` int(11) DEFAULT NULL,
  `cs_category_type` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `search_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'random' COMMENT 'random - related products will be shown randomly, keyword - related products will be shown keyword wise',
  `owner_id` int(11) NOT NULL DEFAULT 0,
  `preloaded` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cs_category_relations`
--

INSERT INTO `cs_category_relations` (`id`, `category_id`, `category_type`, `cs_category_id`, `cs_category_type`, `search_type`, `owner_id`, `preloaded`) VALUES
(22, 4, 'App\\Models\\Category', 5, 'App\\Models\\Category', 'random', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `currencies`
--

CREATE TABLE `currencies` (
  `id` int(191) NOT NULL,
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sign` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` double NOT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `currencies`
--

INSERT INTO `currencies` (`id`, `name`, `sign`, `value`, `is_default`) VALUES
(1, 'INR', '₹', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `customtea_orders`
--

CREATE TABLE `customtea_orders` (
  `id` int(11) NOT NULL,
  `order_type` varchar(20) NOT NULL DEFAULT 'online',
  `salesman_id` bigint(20) DEFAULT NULL,
  `deliver_by` bigint(20) DEFAULT NULL,
  `user_id` int(191) DEFAULT NULL,
  `p1` bigint(20) DEFAULT NULL,
  `p1_percent` varchar(20) DEFAULT NULL,
  `p1_price` varchar(20) DEFAULT NULL,
  `p1_weight` varchar(20) DEFAULT NULL,
  `p2` bigint(20) DEFAULT NULL,
  `p2_percent` varchar(20) DEFAULT NULL,
  `p2_price` varchar(20) DEFAULT NULL,
  `p2_weight` varchar(20) DEFAULT NULL,
  `total_price` varchar(20) DEFAULT NULL,
  `method` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping` varchar(255) DEFAULT NULL,
  `totalweight` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `pay_amount` float NOT NULL,
  `wallet_price` double NOT NULL DEFAULT 0,
  `txnid` varchar(255) DEFAULT NULL,
  `order_number` varchar(255) NOT NULL,
  `payment_status` varchar(255) NOT NULL,
  `customer_email` varchar(255) NOT NULL,
  `customer_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `customer_country` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_phone` varchar(255) NOT NULL,
  `customer_address` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `customer_city` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `customer_zip` varchar(255) DEFAULT NULL,
  `shipping_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `shipping_country` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_email` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `shipping_phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `shipping_address` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `shipping_city` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `shipping_zip` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `order_note` text CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `coupon_code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `coupon_discount` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('pending','processing','completed','declined','on delivery','delivered','refund') NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `currency_sign` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency_value` double NOT NULL,
  `shipping_cost` double NOT NULL,
  `dp` tinyint(1) NOT NULL DEFAULT 0,
  `wallet_reward` varchar(20) DEFAULT NULL,
  `rating` int(10) NOT NULL DEFAULT 0,
  `comment` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `custom_tea`
--

CREATE TABLE `custom_tea` (
  `id` bigint(20) NOT NULL,
  `name` text DEFAULT NULL,
  `type` enum('1','2') DEFAULT NULL,
  `price` varchar(20) DEFAULT NULL,
  `stock` varchar(20) DEFAULT NULL,
  `status` enum('0','1','3') DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `custom_tea`
--

INSERT INTO `custom_tea` (`id`, `name`, `type`, `price`, `stock`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Darjeeling Leaf Luxury Tea', '1', '1.5', '10000', '1', '2022-08-18 15:59:26', '2022-08-18 15:59:26'),
(2, 'Darjeeling Fanning Tea', '1', '0.6', '10000', '1', '2022-08-18 16:00:00', '2022-08-18 16:00:00'),
(3, 'Assam Leaf Luxury Tea', '1', '0.8', '10000', '1', '2022-08-18 16:01:09', '2022-08-18 16:07:52'),
(4, 'Assam Leaf Premium Tea', '1', '0.5', '10000', '1', '2022-08-18 16:01:45', '2022-08-18 16:07:39'),
(5, 'Assam CTC Luxury Blend Tea', '2', '0.8', '10000', '1', '2022-08-18 16:05:25', '2022-08-19 10:36:05'),
(6, 'Assam CTC Premium Blend Tea', '2', '0.6', '10000', '1', '2022-08-18 16:05:55', '2022-08-19 10:35:49'),
(7, 'Assam CTC Gold Blend Tea', '2', '0.4', '10000', '1', '2022-08-18 16:06:14', '2022-08-19 10:35:29'),
(8, 'Assam CTC Silver Blend Tea', '2', '0.3', '10000', '1', '2022-08-18 16:06:25', '2022-08-19 10:34:56');

-- --------------------------------------------------------

--
-- Table structure for table `delivery_boys`
--

CREATE TABLE `delivery_boys` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `govt_id_proof` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vehicle_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `commission` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `collection_amount` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` tinyint(10) NOT NULL DEFAULT 0,
  `ban` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `delivery_boys`
--

INSERT INTO `delivery_boys` (`id`, `name`, `photo`, `address`, `phone`, `govt_id_proof`, `vehicle_number`, `email`, `password`, `commission`, `collection_amount`, `created_at`, `updated_at`, `status`, `ban`) VALUES
(1, 'Test', NULL, 'Sheoraphuli,Hooghly,pin:712223', '9876543210', '1649747548arrow.png', 'fsf', 'jackfruitwork@gmail.com', '$2y$10$n/hD5G2HEUmc2eFv2l0AUevQdt7lKCUO5FOYqvzp2iJTD.OaF15H6', '2518.8', '0', '2022-02-16 07:43:34', '2022-05-25 09:51:07', 1, 0),
(36, 'Akash Sarkar', '1649083569remove-1.png', 'Sheoraphuli,Hooghly,pin:712223\r\nNear shibmandir', '9876543211', '1649747302WhatsAppImage2022-04-11at6.20.38PM.jpeg', 'akasdhba5435', 'akash1@gmail.com', '$2y$10$gL3w7pCCUmtq.cMZSpah0eZqytLSRLH1Ij8PQu6I.X2tzo0L0i736', '0', '0', '2022-04-04 09:16:09', '2022-04-12 01:38:22', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `deposits`
--

CREATE TABLE `deposits` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `currency` blob DEFAULT NULL,
  `currency_code` varchar(255) DEFAULT NULL,
  `amount` double DEFAULT 0,
  `currency_value` double DEFAULT 0,
  `method` varchar(255) DEFAULT NULL,
  `txnid` varchar(255) DEFAULT NULL,
  `flutter_id` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `deposits`
--

INSERT INTO `deposits` (`id`, `user_id`, `currency`, `currency_code`, `amount`, `currency_value`, `method`, `txnid`, `flutter_id`, `status`, `created_at`, `updated_at`) VALUES
(1, 22, 0x24, 'USD', 5, 1, 'Stripe', 'txn_1IQmxmJlIV5dN9n7xuTnQ1pv', NULL, 1, '2021-03-02 23:09:35', '2021-03-02 23:09:35'),
(2, 22, 0x24, 'USD', 5, 1, 'Stripe', 'txn_1IQmzeJlIV5dN9n7Y6iRAhSV', NULL, 1, '2021-03-02 23:11:31', '2021-03-02 23:11:31'),
(3, 22, 0x24, 'USD', 5, 1, 'Stripe', 'txn_1IQn1DJlIV5dN9n7d6bO5Wwd', NULL, 1, '2021-03-02 23:13:08', '2021-03-02 23:13:08'),
(4, 22, 0x24, 'USD', 30, 1, 'Paypal', '3KH19577707326145', NULL, 1, '2021-03-03 00:00:16', '2021-03-03 00:00:16'),
(5, 22, 0x24, 'USD', 30, 1, 'Paypal', '3KH19577707326145', NULL, 1, '2021-03-03 00:00:44', '2021-03-03 00:00:44'),
(6, 22, 0xe282b9, 'INR', 0.43509789702683, 68.95, 'Instamojo', '1b194ca1b1854589b24e87428041800f', NULL, 1, '2021-03-29 00:03:27', '2021-03-29 00:03:27'),
(7, 22, 0xe282b9, 'INR', 0.43509789702683, 68.95, 'Instamojo', '1b194ca1b1854589b24e87428041800f', NULL, 1, '2021-03-29 00:04:23', '2021-03-29 00:04:23'),
(8, 22, 0x24, 'USD', 6.53, 1, 'Molly Payment', 'tr_uWkNvcmwh9', NULL, 1, '2021-03-29 00:05:41', '2021-03-29 00:05:41'),
(9, 22, 0x24, 'USD', 6.53, 1, 'Molly Payment', 'tr_uWkNvcmwh9', NULL, 1, '2021-03-29 00:05:57', '2021-03-29 00:05:57'),
(10, 22, 0x24, 'USD', 8.47, 1, 'Molly Payment', 'tr_4pWN6bU6UQ', NULL, 1, '2021-03-29 00:07:01', '2021-03-29 00:07:01'),
(11, 22, 0xe282b9, 'INR', 3.6258158085569, 68.95, 'Paytm', NULL, NULL, 0, '2021-03-29 00:07:53', '2021-03-29 00:07:53'),
(12, 22, 0xe282b9, 'INR', 3.6258158085569, 68.95, 'Paytm', '20210329111212800110168070702479700', NULL, 1, '2021-03-29 00:09:00', '2021-03-29 00:09:10'),
(13, 22, 0xe282b9, 'INR', 3.6258158085569, 68.95, 'Razorpay', 'pay_GsMjgm05O4gjRM', NULL, 1, '2021-03-29 00:09:55', '2021-03-29 00:10:43'),
(14, 13, 0xe282b9, 'INR', 3.6258158085569, 68.95, 'Instamojo', '9a5e276203404dc29da9afae2c82ec86', NULL, 1, '2021-03-29 02:06:11', '2021-03-29 02:06:11'),
(15, 13, 0x24, 'USD', 30, 1, 'Molly Payment', 'tr_V8amzjzWTQ', NULL, 1, '2021-03-29 02:06:43', '2021-03-29 02:06:43'),
(16, 13, 0xe282b9, 'INR', 3.6258158085569, 68.95, 'Paytm', '20210329111212800110168912902492199', NULL, 1, '2021-03-29 02:07:08', '2021-03-29 02:07:18'),
(17, 22, 0x24, 'USD', 0, 1, 'Voguepay', NULL, NULL, 1, '2021-04-10 00:01:18', '2021-04-10 00:01:18'),
(18, 22, 0x24, 'USD', 30, 1, 'Paypal', '4EG4604311330433X', NULL, 1, '2021-04-10 02:33:22', '2021-04-10 02:33:22'),
(19, 22, 0x24, 'USD', 0, 1, 'Stripe', '1236616467', NULL, 1, '2021-05-08 03:22:52', '2021-05-08 03:22:52'),
(20, 22, 0x24, 'USD', 30, 1, 'Voguepay', NULL, NULL, 1, '2021-05-22 04:05:27', '2021-05-22 04:05:27'),
(21, 22, 0x24, 'USD', 30, 1, 'Voguepay', NULL, NULL, 1, '2021-05-22 04:07:20', '2021-05-22 04:07:20'),
(22, 22, 0x24, 'USD', 30, 1, 'Voguepay', NULL, NULL, 1, '2021-05-22 04:07:42', '2021-05-22 04:07:42'),
(23, 22, 0xe282a6, 'NGN', 0.082435926675991, 363.919, 'Flutterwave', NULL, 'OjKz1621678255', 0, '2021-05-22 04:10:55', '2021-05-22 04:10:55'),
(24, 22, 0xe282a6, 'NGN', 0.082435926675991, 363.919, 'Flutterwave', NULL, '9E7e1621678314', 0, '2021-05-22 04:11:54', '2021-05-22 04:11:54'),
(25, 22, 0x24, 'USD', 30, 1, 'Flutterwave', NULL, 'Eqer1621740219', 0, '2021-05-22 21:23:39', '2021-05-22 21:23:39'),
(26, 22, 0x24, 'USD', 30, 1, 'Flutterwave', '2169937', 'BM4B1621740322', 1, '2021-05-22 21:25:22', '2021-05-22 21:26:58'),
(27, 31, 0x24, 'USD', 30, 1, 'Molly Payment', 'tr_NbQmvzkRB7', NULL, 1, '2021-05-22 21:51:06', '2021-05-22 21:51:06'),
(28, 31, 0x24, 'USD', 0, 1, 'Stripe', '1237026395', NULL, 1, '2021-05-22 21:52:26', '2021-05-22 21:52:26'),
(29, 22, 0x24, 'USD', 30, 1, 'Stripe', 'txn_1IxSt3JlIV5dN9n7mwAnAiRL', NULL, 1, '2021-06-01 02:23:45', '2021-06-01 02:23:45'),
(30, 22, 0x24, 'USD', 4.2, 1, 'Stripe', 'txn_1IxStZJlIV5dN9n7urHmoKgR', NULL, 1, '2021-06-01 02:24:17', '2021-06-01 02:24:17'),
(31, 22, 0x24, 'USD', 29, 1, 'Paypal', '7RE45971877283057', NULL, 1, '2021-06-01 02:26:45', '2021-06-01 02:26:45'),
(32, 22, 0x24, 'USD', 29, 1, 'Paypal', '7RE45971877283057', NULL, 1, '2021-06-01 02:26:46', '2021-06-01 02:26:46'),
(33, 22, 0x24, 'USD', 31, 1, 'Paypal', '0L139347RN190154K', NULL, 1, '2021-06-01 02:28:36', '2021-06-01 02:28:36'),
(34, 22, 0x24, 'USD', 30, 1, 'Molly Payment', 'tr_hzPkx4845T', NULL, 1, '2021-06-01 02:29:11', '2021-06-01 02:29:11'),
(35, 22, 0xe0a7b3, 'BDT', 3.5448422545197, 84.63, 'SSLCommerz', 'SSLCZ_TXN_60b5eff5053d3', NULL, 1, '2021-06-01 02:29:41', '2021-06-01 02:30:11');

-- --------------------------------------------------------

--
-- Table structure for table `email_templates`
--

CREATE TABLE `email_templates` (
  `id` int(11) NOT NULL,
  `email_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email_subject` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `email_body` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `email_templates`
--

INSERT INTO `email_templates` (`id`, `email_type`, `email_subject`, `email_body`, `status`) VALUES
(1, 'new_order', 'Your Order Placed Successfully', '<p>Hello {customer_name},<br>Your Order Number is {order_number}<br>Your order of amount {<span style=\"color: rgb(33, 37, 41);\">order_amount}&nbsp;</span>has been placed successfully</p>', 1),
(2, 'new_registration', 'Welcome To Astha Tea', '<p>Hello {customer_name},<br>You have successfully registered to {website_title}, We wish you will have a wonderful experience using our service.</p><p>Thank You<br></p>', 1),
(6, 'wallet_deposit', 'Balance Added to Your Account.', '<p>Hello {customer_name},<br>${deposit_amount} has been deposited in your account. Your current balance is ${wallet_balance}</p><p>Thank You<br></p>', 1);

-- --------------------------------------------------------

--
-- Table structure for table `faqs`
--

CREATE TABLE `faqs` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `details` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `faqs`
--

INSERT INTO `faqs` (`id`, `title`, `details`, `status`) VALUES
(1, 'Right my front it wound cause fully', '<span style=\"color: rgb(70, 85, 65); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 16px;\">Nam enim risus, molestie et, porta ac, aliquam ac, risus. Quisque lobortis. Phasellus pellentesque purus in massa. Aenean in pede. Phasellus ac libero ac tellus pellentesque semper. Sed ac felis. Sed commodo, magna quis lacinia ornare, quam ante aliquam nisi, eu iaculis leo purus venenatis dui.</span><br>', 1),
(3, 'Man particular insensible celebrated', '<span style=\"color: rgb(70, 85, 65); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 16px;\">Nam enim risus, molestie et, porta ac, aliquam ac, risus. Quisque lobortis. Phasellus pellentesque purus in massa. Aenean in pede. Phasellus ac libero ac tellus pellentesque semper. Sed ac felis. Sed commodo, magna quis lacinia ornare, quam ante aliquam nisi, eu iaculis leo purus venenatis dui.</span><br>', 1),
(4, 'Civilly why how end viewing related', '<span style=\"color: rgb(70, 85, 65); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 16px;\">Nam enim risus, molestie et, porta ac, aliquam ac, risus. Quisque lobortis. Phasellus pellentesque purus in massa. Aenean in pede. Phasellus ac libero ac tellus pellentesque semper. Sed ac felis. Sed commodo, magna quis lacinia ornare, quam ante aliquam nisi, eu iaculis leo purus venenatis dui.</span><br>', 0),
(5, 'Six started far placing saw respect', '<span style=\"color: rgb(70, 85, 65); font-family: \" open=\"\" sans\",=\"\" sans-serif;=\"\" font-size:=\"\" 16px;\"=\"\">Nam enim risus, molestie et, porta ac, aliquam ac, risus. Quisque lobortis. Phasellus pellentesque purus in massa. Aenean in pede. Phasellus ac libero ac tellus pellentesque semper. Sed ac felis. Sed commodo, magna quis lacinia ornare, quam ante aliquam nisi, eu iaculis leo purus venenatis dui.</span><br>', 0),
(6, 'She jointure goodness interest debat', '<div style=\"text-align: center;\"><div style=\"text-align: center;\"><br></div></div><div style=\"text-align: center;\"><span style=\"color: rgb(70, 85, 65); font-family: \" open=\"\" sans\",=\"\" sans-serif;=\"\" font-size:=\"\" 16px;\"=\"\">Nam enim risus, molestie et, porta ac, aliquam ac, risus. Quisque lobortis. Phasellus pellentesque purus in massa. Aenean in pede. Phasellus ac libero ac tellus pellentesque semper. Sed ac felis. Sed commodo, magna quis lacinia ornare, quam ante aliquam nisi, eu iaculis leo purus venenatis dui.<br></span></div>', 0);

-- --------------------------------------------------------

--
-- Table structure for table `favorite_sellers`
--

CREATE TABLE `favorite_sellers` (
  `id` int(191) NOT NULL,
  `user_id` int(191) NOT NULL,
  `vendor_id` int(191) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `galleries`
--

CREATE TABLE `galleries` (
  `id` int(191) UNSIGNED NOT NULL,
  `product_id` int(191) UNSIGNED NOT NULL,
  `photo` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `galleries`
--

INSERT INTO `galleries` (`id`, `product_id`, `photo`) VALUES
(6, 93, '156801646314-min.jpg'),
(7, 93, '156801646315-min.jpg'),
(8, 93, '156801646316-min.jpg'),
(116, 93, '1568026950y7ihS4wE.jpg'),
(229, 184, '1621766252156422490902.jpg'),
(230, 184, '16217662531564224753007.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `generalsettings`
--

CREATE TABLE `generalsettings` (
  `id` int(191) NOT NULL,
  `logo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `favicon` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `header_email` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `header_phone` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `footer` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `copyright` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `colors` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `loader` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `admin_loader` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_talkto` tinyint(1) NOT NULL DEFAULT 1,
  `capcha_secret_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `capcha_site_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `talkto` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_language` tinyint(1) NOT NULL DEFAULT 1,
  `is_loader` tinyint(1) NOT NULL DEFAULT 1,
  `map_key` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_disqus` tinyint(1) NOT NULL DEFAULT 0,
  `disqus` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_contact` tinyint(1) NOT NULL DEFAULT 0,
  `is_faq` tinyint(1) NOT NULL DEFAULT 0,
  `guest_checkout` tinyint(1) NOT NULL DEFAULT 0,
  `stripe_check` tinyint(1) NOT NULL DEFAULT 0,
  `cod_check` tinyint(1) NOT NULL DEFAULT 0,
  `currency_format` tinyint(1) NOT NULL DEFAULT 0,
  `withdraw_fee` double NOT NULL DEFAULT 0,
  `withdraw_charge` double NOT NULL DEFAULT 0,
  `tax` double NOT NULL DEFAULT 0,
  `shipping_cost` double NOT NULL DEFAULT 0,
  `smtp_host` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `smtp_port` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `smtp_user` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `smtp_pass` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `from_email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `from_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_smtp` tinyint(1) NOT NULL DEFAULT 0,
  `is_comment` tinyint(1) NOT NULL DEFAULT 1,
  `is_currency` tinyint(1) NOT NULL DEFAULT 1,
  `add_cart` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `out_stock` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `add_wish` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `already_wish` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `wish_remove` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `add_compare` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `already_compare` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `compare_remove` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color_change` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `coupon_found` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `no_coupon` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `already_coupon` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_title` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_text` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_affilate` tinyint(1) NOT NULL DEFAULT 1,
  `affilate_charge` int(100) NOT NULL DEFAULT 0,
  `affilate_banner` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `already_cart` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fixed_commission` double NOT NULL DEFAULT 0,
  `percentage_commission` double NOT NULL DEFAULT 0,
  `multiple_shipping` tinyint(1) NOT NULL DEFAULT 0,
  `multiple_packaging` tinyint(4) NOT NULL DEFAULT 0,
  `vendor_ship_info` tinyint(1) NOT NULL DEFAULT 0,
  `reg_vendor` tinyint(1) NOT NULL DEFAULT 0,
  `cod_text` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `header_color` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `footer_color` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `copyright_color` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_admin_loader` tinyint(1) NOT NULL DEFAULT 0,
  `menu_color` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `menu_hover_color` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_home` tinyint(1) NOT NULL DEFAULT 0,
  `is_verification_email` tinyint(1) NOT NULL DEFAULT 0,
  `wholesell` int(191) NOT NULL DEFAULT 0,
  `is_capcha` tinyint(1) NOT NULL DEFAULT 0,
  `error_banner` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_popup` tinyint(1) NOT NULL DEFAULT 0,
  `popup_title` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `popup_text` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `popup_background` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `invoice_logo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vendor_color` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_secure` tinyint(1) NOT NULL DEFAULT 0,
  `is_report` tinyint(1) NOT NULL,
  `footer_logo` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_encryption` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `show_stock` tinyint(1) NOT NULL DEFAULT 0,
  `is_maintain` tinyint(1) NOT NULL DEFAULT 0,
  `maintain_text` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_physical` tinyint(4) NOT NULL DEFAULT 1,
  `is_digital` tinyint(4) NOT NULL DEFAULT 1,
  `is_license` tinyint(4) NOT NULL DEFAULT 1,
  `is_affiliate` tinyint(4) NOT NULL DEFAULT 1,
  `is_bulk` tinyint(4) NOT NULL DEFAULT 1,
  `newsletter_banner` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `login_background` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `login_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `login_text` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_reward` tinyint(4) NOT NULL DEFAULT 1,
  `reward_point` int(11) NOT NULL DEFAULT 0,
  `reward_dolar` int(11) NOT NULL DEFAULT 0,
  `sales_person_commission` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `delivery_boy_commission` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_cashback` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `generalsettings`
--

INSERT INTO `generalsettings` (`id`, `logo`, `favicon`, `title`, `header_email`, `header_phone`, `footer`, `copyright`, `colors`, `loader`, `admin_loader`, `is_talkto`, `capcha_secret_key`, `capcha_site_key`, `talkto`, `is_language`, `is_loader`, `map_key`, `is_disqus`, `disqus`, `is_contact`, `is_faq`, `guest_checkout`, `stripe_check`, `cod_check`, `currency_format`, `withdraw_fee`, `withdraw_charge`, `tax`, `shipping_cost`, `smtp_host`, `smtp_port`, `smtp_user`, `smtp_pass`, `from_email`, `from_name`, `is_smtp`, `is_comment`, `is_currency`, `add_cart`, `out_stock`, `add_wish`, `already_wish`, `wish_remove`, `add_compare`, `already_compare`, `compare_remove`, `color_change`, `coupon_found`, `no_coupon`, `already_coupon`, `order_title`, `order_text`, `is_affilate`, `affilate_charge`, `affilate_banner`, `already_cart`, `fixed_commission`, `percentage_commission`, `multiple_shipping`, `multiple_packaging`, `vendor_ship_info`, `reg_vendor`, `cod_text`, `header_color`, `footer_color`, `copyright_color`, `is_admin_loader`, `menu_color`, `menu_hover_color`, `is_home`, `is_verification_email`, `wholesell`, `is_capcha`, `error_banner`, `is_popup`, `popup_title`, `popup_text`, `popup_background`, `invoice_logo`, `user_image`, `vendor_color`, `is_secure`, `is_report`, `footer_logo`, `email_encryption`, `show_stock`, `is_maintain`, `maintain_text`, `is_physical`, `is_digital`, `is_license`, `is_affiliate`, `is_bulk`, `newsletter_banner`, `login_background`, `login_title`, `login_text`, `is_reward`, `reward_point`, `reward_dolar`, `sales_person_commission`, `delivery_boy_commission`, `customer_cashback`) VALUES
(1, '1651663452logo.png', '1648531631ashta-logo-final.png', 'Astha Tea', 'smtp', '0123 456789', 'As Astha Tea Family, we aim to deliver high-quality, sustainable, and innovative products, that will delight consumers. The best ingredients, the best practices, the best technology—experience the journey that brings you the perfect cup of tea, every time.', '© Copyright 2022 Astha Tea. All Rights Reserved.', '#4c9a2a', '1564224328loading3.gif', '1564224329loading3.gif', 0, '6LcnPoEaAAAAACV_xC4jdPqumaYKBnxz9Sj6y0zk', '6LcnPoEaAAAAAF6QhKPZ8V4744yiEnr41li3SYDn', '<script type=\"text/javascript\">\r\nvar Tawk_API=Tawk_API||{}, Tawk_LoadStart=new Date();\r\n(function(){\r\nvar s1=document.createElement(\"script\"),s0=document.getElementsByTagName(\"script\")[0];\r\ns1.async=true;\r\ns1.src=\'https://embed.tawk.to/5bc2019c61d0b77092512d03/default\';\r\ns1.charset=\'UTF-8\';\r\ns1.setAttribute(\'crossorigin\',\'*\');\r\ns0.parentNode.insertBefore(s1,s0);\r\n})();\r\n</script>', 1, 0, 'AIzaSyB1GpE4qeoJ__70UZxvX9CTMUTZRZNHcu8', 0, '<div id=\"disqus_thread\">         \r\n    <script>\r\n    /**\r\n    *  RECOMMENDED CONFIGURATION VARIABLES: EDIT AND UNCOMMENT THE SECTION BELOW TO INSERT DYNAMIC VALUES FROM YOUR PLATFORM OR CMS.\r\n    *  LEARN WHY DEFINING THESE VARIABLES IS IMPORTANT: https://disqus.com/admin/universalcode/#configuration-variables*/\r\n    /*\r\n    var disqus_config = function () {\r\n    this.page.url = PAGE_URL;  // Replace PAGE_URL with your page\'s canonical URL variable\r\n    this.page.identifier = PAGE_IDENTIFIER; // Replace PAGE_IDENTIFIER with your page\'s unique identifier variable\r\n    };\r\n    */\r\n    (function() { // DON\'T EDIT BELOW THIS LINE\r\n    var d = document, s = d.createElement(\'script\');\r\n    s.src = \'https://junnun.disqus.com/embed.js\';\r\n    s.setAttribute(\'data-timestamp\', +new Date());\r\n    (d.head || d.body).appendChild(s);\r\n    })();\r\n    </script>\r\n    <noscript>Please enable JavaScript to view the <a href=\"https://disqus.com/?ref_noscript\">comments powered by Disqus.</a></noscript>\r\n    </div>', 1, 1, 0, 1, 1, 0, 5, 5, 0, 5, 'mail.asthatea.com', '465', 'support@asthatea.com', 'k5oSagaHh2rP', 'support@asthatea.com', 'Astha Tea', 1, 1, 1, 'Successfully Added To Cart', 'Out Of Stock', 'Add To Wishlist', 'Already Added To Wishlist', 'Successfully Removed From The Wishlist', 'Successfully Added To Compare', 'Already Added To Compare', 'Successfully Removed From The Compare', 'Successfully Changed The Color', 'Coupon Found', 'No Coupon Found', 'Coupon Already Applied', 'THANK YOU FOR YOUR PURCHASE.', 'We\'ll email you an order confirmation with details and tracking info.', 1, 8, '15587771131554048228onepiece.jpeg', 'Already Added To Cart', 0, 0, 1, 1, 0, 1, 'Pay with cash upon delivery.', '#ffffff', '#4c9a2a', '#174b00', 1, '#ff5500', '#02020c', 0, 1, 6, 1, '1566878455404.png', 1, 'NEWSLETTER', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Expedita porro ipsa nulla, alias, ab minus.', '1584934329adv-banner.jpg', '1651663528logo.png', '1567655174profile.jpg', '#666666', 1, 1, '1651663516footer-logo.png', 'ssl', 0, 0, '<div style=\"text-align: center;\"><font size=\"5\"><br></font></div><h1 style=\"text-align: center;\"><font size=\"6\">UNDER MAINTENANCE</font></h1>', 1, 0, 0, 0, 0, '1619497146Newsletter-Background-Full.jpg', '1619499366mse-login-bg.jpg', 'Hello, Friend!', 'Welcome to Astha Tea', 1, 5, 1, '1', '12', '1');

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `id` int(191) NOT NULL,
  `rtl` tinyint(4) NOT NULL DEFAULT 0,
  `is_default` tinyint(1) NOT NULL DEFAULT 0,
  `language` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `file` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `preloaded` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`id`, `rtl`, `is_default`, `language`, `name`, `file`, `preloaded`) VALUES
(1, 0, 1, 'English', '4rxEKDWRbR', '4rxEKDWRbR.json', 0),
(11, 0, 0, 'Arabic', '1621835677hOWy7KAX', '1621835677hOWy7KAX.json', 0),
(12, 1, 0, 'English RTL', '1621835652BnusOhcE', '1621835652BnusOhcE.json', 0);

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` int(191) NOT NULL,
  `conversation_id` int(191) NOT NULL,
  `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sent_user` int(191) DEFAULT NULL,
  `recieved_user` int(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`id`, `conversation_id`, `message`, `sent_user`, `recieved_user`, `created_at`, `updated_at`) VALUES
(1, 1, 'Hello', 13, NULL, '2021-03-29 02:07:56', '2021-03-29 02:07:56'),
(2, 2, 'hj', 40, NULL, '2022-05-11 08:28:34', '2022-05-11 08:28:34');

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` int(191) NOT NULL,
  `order_id` int(191) UNSIGNED DEFAULT NULL,
  `user_id` int(191) DEFAULT NULL,
  `vendor_id` int(191) DEFAULT NULL,
  `product_id` int(191) DEFAULT NULL,
  `conversation_id` int(191) DEFAULT NULL,
  `is_read` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `order_id`, `user_id`, `vendor_id`, `product_id`, `conversation_id`, `is_read`, `created_at`, `updated_at`) VALUES
(92, NULL, NULL, NULL, NULL, 2, 1, '2021-03-29 02:09:14', '2021-04-25 23:54:27'),
(93, NULL, NULL, NULL, NULL, 3, 1, '2021-03-29 02:10:02', '2021-04-25 23:54:27'),
(94, NULL, NULL, NULL, NULL, 4, 1, '2021-03-29 02:10:31', '2021-04-25 23:54:27'),
(95, NULL, NULL, NULL, NULL, 5, 1, '2021-03-29 02:14:13', '2021-04-25 23:54:27'),
(96, NULL, NULL, NULL, NULL, 6, 1, '2021-03-29 02:14:28', '2021-04-25 23:54:27'),
(126, NULL, NULL, NULL, 183, NULL, 1, '2021-05-24 02:09:09', '2022-02-15 04:39:26'),
(127, NULL, NULL, NULL, 168, NULL, 1, '2021-05-24 02:09:09', '2022-02-15 04:39:26'),
(128, NULL, NULL, NULL, 183, NULL, 1, '2021-05-24 02:16:03', '2022-02-15 04:39:26'),
(129, NULL, NULL, NULL, 168, NULL, 1, '2021-05-24 02:16:04', '2022-02-15 04:39:26'),
(133, NULL, NULL, NULL, 183, NULL, 1, '2021-05-24 22:37:04', '2022-02-15 04:39:26'),
(145, NULL, 35, NULL, NULL, NULL, 1, '2022-02-16 07:46:28', '2022-03-28 10:19:27'),
(146, 138, NULL, NULL, NULL, NULL, 1, '2022-02-16 08:02:18', '2022-03-28 10:19:37'),
(147, 139, NULL, NULL, NULL, NULL, 1, '2022-02-16 08:16:46', '2022-03-28 10:19:37'),
(148, 140, NULL, NULL, NULL, NULL, 1, '2022-03-18 23:56:18', '2022-03-28 10:19:37'),
(149, 141, NULL, NULL, NULL, NULL, 1, '2022-03-18 23:56:21', '2022-03-28 10:19:37'),
(150, 142, NULL, NULL, NULL, NULL, 1, '2022-03-18 23:56:23', '2022-03-28 10:19:37'),
(151, 143, NULL, NULL, NULL, NULL, 1, '2022-03-18 23:56:23', '2022-03-28 10:19:36'),
(152, 144, NULL, NULL, NULL, NULL, 1, '2022-03-18 23:56:46', '2022-03-28 10:19:36'),
(153, 145, NULL, NULL, NULL, NULL, 1, '2022-03-19 00:04:10', '2022-03-28 10:19:36'),
(154, 146, NULL, NULL, NULL, NULL, 1, '2022-03-19 00:05:42', '2022-03-28 10:19:36'),
(155, 147, NULL, NULL, NULL, NULL, 1, '2022-03-19 00:08:04', '2022-03-28 10:19:36'),
(156, 148, NULL, NULL, NULL, NULL, 1, '2022-03-19 00:08:04', '2022-03-28 10:19:36'),
(157, 149, NULL, NULL, NULL, NULL, 1, '2022-05-10 01:33:04', '2022-06-10 05:46:52'),
(158, 150, NULL, NULL, NULL, NULL, 1, '2022-05-10 01:33:06', '2022-06-10 05:46:52'),
(159, 151, NULL, NULL, NULL, NULL, 1, '2022-05-10 01:33:08', '2022-06-10 05:46:52'),
(160, 152, NULL, NULL, NULL, NULL, 1, '2022-05-10 01:33:11', '2022-06-10 05:46:52'),
(161, 153, NULL, NULL, NULL, NULL, 1, '2022-05-10 01:34:05', '2022-06-10 05:46:52'),
(162, 153, NULL, NULL, NULL, NULL, 1, '2022-05-10 01:34:40', '2022-06-10 05:46:52'),
(163, 154, NULL, NULL, NULL, NULL, 1, '2022-05-12 08:24:29', '2022-06-10 05:46:52'),
(164, 154, NULL, NULL, NULL, NULL, 1, '2022-05-12 08:24:56', '2022-06-10 05:46:52'),
(165, 155, NULL, NULL, NULL, NULL, 1, '2022-05-16 02:50:37', '2022-06-10 05:46:52'),
(166, 3, NULL, NULL, NULL, NULL, 1, '2022-05-16 10:09:33', '2022-06-10 05:46:52'),
(167, 4, NULL, NULL, NULL, NULL, 1, '2022-05-16 10:14:02', '2022-06-10 05:46:52'),
(168, 4, NULL, NULL, NULL, NULL, 1, '2022-05-16 10:18:58', '2022-06-10 05:46:52'),
(169, 5, NULL, NULL, NULL, NULL, 1, '2022-05-17 00:20:35', '2022-06-10 05:46:52'),
(170, 5, NULL, NULL, NULL, NULL, 1, '2022-05-17 00:21:01', '2022-06-10 05:46:52'),
(171, 6, NULL, NULL, NULL, NULL, 1, '2022-05-17 00:26:17', '2022-06-10 05:46:52'),
(172, 7, NULL, NULL, NULL, NULL, 1, '2022-05-17 00:30:43', '2022-06-10 05:46:52'),
(173, 8, NULL, NULL, NULL, NULL, 1, '2022-05-17 00:43:28', '2022-06-10 05:46:52'),
(174, 8, NULL, NULL, NULL, NULL, 1, '2022-05-17 00:43:56', '2022-06-10 05:46:52'),
(175, 9, NULL, NULL, NULL, NULL, 1, '2022-05-17 00:49:32', '2022-06-10 05:46:52'),
(176, 9, NULL, NULL, NULL, NULL, 1, '2022-05-17 00:49:53', '2022-06-10 05:46:52'),
(177, 10, NULL, NULL, NULL, NULL, 1, '2022-05-17 04:53:51', '2022-06-10 05:46:52'),
(178, 11, NULL, NULL, NULL, NULL, 1, '2022-05-17 04:53:52', '2022-06-10 05:46:52'),
(179, 12, NULL, NULL, NULL, NULL, 1, '2022-05-17 04:53:53', '2022-06-10 05:46:52'),
(180, 12, NULL, NULL, NULL, NULL, 1, '2022-05-17 04:54:12', '2022-06-10 05:46:52'),
(181, 13, NULL, NULL, NULL, NULL, 1, '2022-05-17 09:07:06', '2022-06-10 05:46:52'),
(182, 13, NULL, NULL, NULL, NULL, 1, '2022-05-17 09:08:14', '2022-06-10 05:46:52'),
(183, 14, NULL, NULL, NULL, NULL, 1, '2022-05-17 09:38:11', '2022-06-10 05:46:52'),
(184, 14, NULL, NULL, NULL, NULL, 1, '2022-05-17 09:38:25', '2022-06-10 05:46:52'),
(185, 1, NULL, NULL, NULL, NULL, 1, '2022-05-17 23:49:26', '2022-06-10 05:46:52'),
(186, 1, NULL, NULL, NULL, NULL, 1, '2022-05-17 23:49:51', '2022-06-10 05:46:52'),
(187, 159, NULL, NULL, NULL, NULL, 1, '2022-05-23 10:51:46', '2022-06-10 05:46:52'),
(188, NULL, NULL, NULL, 185, NULL, 1, '2022-05-23 10:51:46', '2022-08-19 09:54:07'),
(189, 160, NULL, NULL, NULL, NULL, 1, '2022-05-23 10:53:35', '2022-06-10 05:46:52'),
(190, NULL, NULL, NULL, 185, NULL, 1, '2022-05-23 10:53:35', '2022-08-19 09:54:07'),
(191, 161, NULL, NULL, NULL, NULL, 1, '2022-05-23 10:56:22', '2022-06-10 05:46:52'),
(192, NULL, NULL, NULL, 185, NULL, 1, '2022-05-23 10:56:22', '2022-08-19 09:54:07'),
(193, 2, NULL, NULL, NULL, NULL, 1, '2022-05-24 02:27:19', '2022-06-10 05:46:52'),
(194, 162, NULL, NULL, NULL, NULL, 1, '2022-05-24 02:37:50', '2022-06-10 05:46:52'),
(195, 163, NULL, NULL, NULL, NULL, 1, '2022-05-24 02:47:34', '2022-06-10 05:46:52'),
(196, 164, NULL, NULL, NULL, NULL, 1, '2022-05-24 02:50:18', '2022-06-10 05:46:52'),
(197, 3, NULL, NULL, NULL, NULL, 1, '2022-05-25 06:44:23', '2022-06-10 05:46:52'),
(198, 4, NULL, NULL, NULL, NULL, 1, '2022-05-25 09:29:48', '2022-06-10 05:46:52'),
(199, 5, NULL, NULL, NULL, NULL, 1, '2022-05-25 09:39:56', '2022-06-10 05:46:52'),
(200, 1, NULL, NULL, NULL, NULL, 1, '2022-06-18 11:51:21', '2022-08-19 09:47:05'),
(201, 1, NULL, NULL, NULL, NULL, 1, '2022-08-08 11:47:49', '2022-08-19 09:47:05'),
(202, 1, NULL, NULL, NULL, NULL, 1, '2022-09-14 18:55:35', '2022-09-19 15:44:11'),
(203, 2, NULL, NULL, NULL, NULL, 1, '2022-11-14 09:32:12', '2023-03-01 07:02:50'),
(204, 3, NULL, NULL, NULL, NULL, 1, '2022-11-14 09:32:19', '2023-03-01 07:02:50'),
(205, 4, NULL, NULL, NULL, NULL, 1, '2022-11-26 16:46:24', '2023-03-01 07:02:50'),
(206, NULL, NULL, NULL, 3, NULL, 0, '2022-11-26 16:46:24', '2022-11-26 16:46:24');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `order_type` varchar(20) DEFAULT 'online',
  `salesman_id` varchar(20) DEFAULT NULL,
  `deliver_by` bigint(20) DEFAULT NULL,
  `user_id` int(191) DEFAULT NULL,
  `cart` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `method` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pickup_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `totalQty` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `pay_amount` float NOT NULL,
  `wallet_price` double NOT NULL DEFAULT 0,
  `txnid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `charge_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_number` varchar(255) NOT NULL,
  `payment_status` varchar(255) NOT NULL,
  `customer_email` varchar(255) NOT NULL,
  `customer_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `customer_country` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_phone` varchar(255) NOT NULL,
  `customer_address` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `customer_city` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `customer_zip` varchar(255) DEFAULT NULL,
  `shipping_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `shipping_country` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_email` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `shipping_phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `shipping_address` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `shipping_city` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `shipping_zip` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `order_note` text CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `coupon_code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `coupon_discount` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('pending','processing','completed','declined','on delivery','delivered','refund') NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `affilate_user` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `affilate_charge` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency_sign` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency_value` double NOT NULL,
  `shipping_cost` double NOT NULL,
  `packing_cost` double NOT NULL DEFAULT 0,
  `tax` double NOT NULL DEFAULT 0,
  `tax_location` varchar(255) NOT NULL,
  `dp` tinyint(1) NOT NULL DEFAULT 0,
  `commission` double NOT NULL DEFAULT 0,
  `pay_id` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vendor_shipping_id` int(191) NOT NULL DEFAULT 0,
  `vendor_packing_id` int(191) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `order_type`, `salesman_id`, `deliver_by`, `user_id`, `cart`, `method`, `shipping`, `pickup_location`, `totalQty`, `pay_amount`, `wallet_price`, `txnid`, `charge_id`, `order_number`, `payment_status`, `customer_email`, `customer_name`, `customer_country`, `customer_phone`, `customer_address`, `customer_city`, `customer_zip`, `shipping_name`, `shipping_country`, `shipping_email`, `shipping_phone`, `shipping_address`, `shipping_city`, `shipping_zip`, `order_note`, `coupon_code`, `coupon_discount`, `status`, `created_at`, `updated_at`, `affilate_user`, `affilate_charge`, `currency_sign`, `currency_value`, `shipping_cost`, `packing_cost`, `tax`, `tax_location`, `dp`, `commission`, `pay_id`, `vendor_shipping_id`, `vendor_packing_id`) VALUES
(1, 'online', '1', NULL, 15, '{\"totalQty\":1,\"totalPrice\":250,\"items\":{\"13\":{\"qty\":1,\"size_key\":0,\"size_qty\":\"\",\"size_price\":\"\",\"size\":\"\",\"color\":\"\",\"stock\":199,\"price\":250,\"item\":{\"id\":13,\"user_id\":\"0\",\"slug\":\"darjeeling-tea-wrc3833bu2\",\"name\":\"Darjeeling Tea\",\"photo\":\"p5LwzVsAh6.png\",\"size\":\"\",\"size_qty\":\"\",\"size_price\":\"\",\"color\":\"\",\"price\":250,\"stock\":\"200\",\"type\":\"Physical\",\"file\":null,\"link\":null,\"license\":\"\",\"license_qty\":\"\",\"measure\":null,\"whole_sell_qty\":\"\",\"whole_sell_discount\":\"\",\"attributes\":null,\"category_id\":\"18\"},\"license\":\"\",\"dp\":\"0\",\"keys\":\"\",\"values\":\"\",\"item_price\":250}}}', 'Cash On Delivery', 'shipto', '789654', '1', 299, 0, NULL, NULL, '4CZY5wNFkC', 'Completed', 'shibashispal.13@g.com', 'Shibashis pal', 'India', '7980160048', 'Madhur Math bospara khardah', 'Kolkata', '123456', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', '2022-09-14 18:55:35', '2022-09-14 18:55:35', NULL, NULL, '₹', 1, 49, 0, 0, 'India', 0, 0, NULL, 0, 0),
(2, 'online', NULL, NULL, 39, '{\"totalQty\":1,\"totalPrice\":30,\"items\":{\"60\":{\"qty\":1,\"size_key\":0,\"size_qty\":\"\",\"size_price\":\"\",\"size\":\"\",\"color\":\"\",\"stock\":99,\"price\":30,\"item\":{\"id\":60,\"user_id\":\"0\",\"slug\":\"membership-only-astha-tea-gwy5340dkw\",\"name\":\"Membership Only Astha Tea\",\"photo\":\"FqX69Ao6sw.png\",\"size\":\"\",\"size_qty\":\"\",\"size_price\":\"\",\"color\":\"\",\"price\":30,\"stock\":\"100\",\"type\":\"Physical\",\"file\":null,\"link\":null,\"license\":\"\",\"license_qty\":\"\",\"measure\":null,\"whole_sell_qty\":\"\",\"whole_sell_discount\":\"\",\"attributes\":null,\"category_id\":\"18\"},\"license\":\"\",\"dp\":\"0\",\"keys\":\"\",\"values\":\"\",\"item_price\":30}}}', 'Razorpay', 'shipto', '789654', '1', 79, 0, NULL, NULL, 'hLd23ppCqK', 'Pending', 'rathindrabhadra99@gmail.com', 'Rathindra Bhadra', 'India', '9163888041', 'Milangarh.khardah.kol=700119', 'Kolkata', '700119', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', '2022-11-14 09:32:12', '2022-11-14 09:32:12', NULL, NULL, '₹', 1, 49, 0, 0, 'West Bengal', 0, 0, NULL, 0, 0),
(3, 'online', NULL, NULL, 39, '{\"totalQty\":1,\"totalPrice\":30,\"items\":{\"60\":{\"qty\":1,\"size_key\":0,\"size_qty\":\"\",\"size_price\":\"\",\"size\":\"\",\"color\":\"\",\"stock\":99,\"price\":30,\"item\":{\"id\":60,\"user_id\":\"0\",\"slug\":\"membership-only-astha-tea-gwy5340dkw\",\"name\":\"Membership Only Astha Tea\",\"photo\":\"FqX69Ao6sw.png\",\"size\":\"\",\"size_qty\":\"\",\"size_price\":\"\",\"color\":\"\",\"price\":30,\"stock\":\"100\",\"type\":\"Physical\",\"file\":null,\"link\":null,\"license\":\"\",\"license_qty\":\"\",\"measure\":null,\"whole_sell_qty\":\"\",\"whole_sell_discount\":\"\",\"attributes\":null,\"category_id\":\"18\"},\"license\":\"\",\"dp\":\"0\",\"keys\":\"\",\"values\":\"\",\"item_price\":30}}}', 'Razorpay', 'shipto', '789654', '1', 79, 0, NULL, NULL, 'f4Lzf07c50', 'Pending', 'rathindrabhadra99@gmail.com', 'Rathindra Bhadra', 'India', '9163888041', 'Milangarh.khardah.kol=700119', 'Kolkata', '700119', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', '2022-11-14 09:32:19', '2022-11-14 09:32:19', NULL, NULL, '₹', 1, 49, 0, 0, 'West Bengal', 0, 0, NULL, 0, 0),
(4, 'online', NULL, NULL, 41, '{\"totalQty\":1,\"totalPrice\":40,\"items\":{\"3\":{\"qty\":1,\"size_key\":0,\"size_qty\":\"\",\"size_price\":\"\",\"size\":\"\",\"color\":\"\",\"stock\":1,\"price\":40,\"item\":{\"id\":3,\"user_id\":\"0\",\"slug\":\"dehydrated-d2r1381k7p\",\"name\":\"Dehydrated\",\"photo\":\"T5IDdIMPwS.png\",\"size\":\"\",\"size_qty\":\"\",\"size_price\":\"\",\"color\":\"\",\"price\":40,\"stock\":\"2\",\"type\":\"Physical\",\"file\":null,\"link\":null,\"license\":\"\",\"license_qty\":\"\",\"measure\":null,\"whole_sell_qty\":\"\",\"whole_sell_discount\":\"\",\"attributes\":null,\"category_id\":\"4\"},\"license\":\"\",\"dp\":\"0\",\"keys\":\"\",\"values\":\"\",\"item_price\":40}}}', 'Razorpay', 'shipto', '789654', '1', 40, 0, NULL, NULL, '3ntykJLsih', 'Pending', 'bidhanronit@gmail.com', 'bidhan roy', 'India', '6289003270', '503229620460', 'KOLKATA', '700116', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Skimmed milk', NULL, NULL, 'pending', '2022-11-26 16:46:24', '2022-11-26 16:46:24', NULL, NULL, '₹', 1, 49, 0, 0, 'West Bengal', 0, 0, NULL, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `order_tracks`
--

CREATE TABLE `order_tracks` (
  `id` int(191) NOT NULL,
  `order_id` int(191) NOT NULL,
  `title` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `order_tracks`
--

INSERT INTO `order_tracks` (`id`, `order_id`, `title`, `text`, `created_at`, `updated_at`) VALUES
(1, 1, 'Pending', 'You have successfully placed your order.', '2022-08-08 11:47:49', '2022-08-08 11:47:49'),
(2, 1, 'Pending', 'You have successfully placed your order.', '2022-09-14 18:55:35', '2022-09-14 18:55:35'),
(3, 2, 'Pending', 'You have successfully placed your order.', '2022-11-14 09:32:12', '2022-11-14 09:32:12'),
(4, 3, 'Pending', 'You have successfully placed your order.', '2022-11-14 09:32:19', '2022-11-14 09:32:19'),
(5, 4, 'Pending', 'You have successfully placed your order.', '2022-11-26 16:46:24', '2022-11-26 16:46:24');

-- --------------------------------------------------------

--
-- Table structure for table `packages`
--

CREATE TABLE `packages` (
  `id` int(191) NOT NULL,
  `user_id` int(191) NOT NULL DEFAULT 0,
  `title` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subtitle` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` double NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `packages`
--

INSERT INTO `packages` (`id`, `user_id`, `title`, `subtitle`, `price`) VALUES
(1, 0, 'Default Packaging', 'Default packaging by store', 0),
(2, 0, 'Gift Packaging', 'Exclusive Gift packaging', 15);

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` int(191) NOT NULL,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `details` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_tag` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `header` tinyint(1) NOT NULL DEFAULT 0,
  `footer` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `title`, `slug`, `details`, `meta_tag`, `meta_description`, `header`, `footer`) VALUES
(2, 'Privacy & Policy', 'privacy-policy', '<h1>Privacy Policy</h1>\r\n<p>Last updated: May 19, 2022</p>\r\n<p>This Privacy Policy describes Our policies and procedures on the collection, use and disclosure of Your information when You use the Service and tells You about Your privacy rights and how the law protects You.</p>\r\n<p>We use Your Personal data to provide and improve the Service. By using the Service, You agree to the collection and use of information in accordance with this Privacy Policy. This Privacy Policy has been created with the help of the <a href=\"https://www.termsfeed.com/privacy-policy-generator/\" target=\"_blank\">Privacy Policy Generator</a>.</p>\r\n<h1>Interpretation and Definitions</h1>\r\n<h2>Interpretation</h2>\r\n<p>The words of which the initial letter is capitalized have meanings defined under the following conditions. The following definitions shall have the same meaning regardless of whether they appear in singular or in plural.</p>\r\n<h2>Definitions</h2>\r\n<p>For the purposes of this Privacy Policy:</p>\r\n<ul>\r\n<li>\r\n<p><strong>Account</strong> means a unique account created for You to access our Service or parts of our Service.</p>\r\n</li>\r\n<li>\r\n<p><strong>Company</strong> (referred to as either \"the Company\", \"We\", \"Us\" or \"Our\" in this Agreement) refers to Astha Tea.</p>\r\n</li>\r\n<li>\r\n<p><strong>Cookies</strong> are small files that are placed on Your computer, mobile device or any other device by a website, containing the details of Your browsing history on that website among its many uses.</p>\r\n</li>\r\n<li>\r\n<p><strong>Country</strong> refers to: West Bengal,  India</p>\r\n</li>\r\n<li>\r\n<p><strong>Device</strong> means any device that can access the Service such as a computer, a cellphone or a digital tablet.</p>\r\n</li>\r\n<li>\r\n<p><strong>Personal Data</strong> is any information that relates to an identified or identifiable individual.</p>\r\n</li>\r\n<li>\r\n<p><strong>Service</strong> refers to the Website.</p>\r\n</li>\r\n<li>\r\n<p><strong>Service Provider</strong> means any natural or legal person who processes the data on behalf of the Company. It refers to third-party companies or individuals employed by the Company to facilitate the Service, to provide the Service on behalf of the Company, to perform services related to the Service or to assist the Company in analyzing how the Service is used.</p>\r\n</li>\r\n<li>\r\n<p><strong>Usage Data</strong> refers to data collected automatically, either generated by the use of the Service or from the Service infrastructure itself (for example, the duration of a page visit).</p>\r\n</li>\r\n<li>\r\n<p><strong>Website</strong> refers to Astha Tea, accessible from <a href=\"https://asthatea.com/\" rel=\"external nofollow noopener\" target=\"_blank\">https://asthatea.com/</a></p>\r\n</li>\r\n<li>\r\n<p><strong>You</strong> means the individual accessing or using the Service, or the company, or other legal entity on behalf of which such individual is accessing or using the Service, as applicable.</p>\r\n</li>\r\n</ul>\r\n<h1>Collecting and Using Your Personal Data</h1>\r\n<h2>Types of Data Collected</h2>\r\n<h3>Personal Data</h3>\r\n<p>While using Our Service, We may ask You to provide Us with certain personally identifiable information that can be used to contact or identify You. Personally identifiable information may include, but is not limited to:</p>\r\n<ul>\r\n<li>\r\n<p>Email address</p>\r\n</li>\r\n<li>\r\n<p>Phone number</p>\r\n</li>\r\n<li>\r\n<p>Usage Data</p>\r\n</li>\r\n</ul>\r\n<h3>Usage Data</h3>\r\n<p>Usage Data is collected automatically when using the Service.</p>\r\n<p>Usage Data may include information such as Your Device\'s Internet Protocol address (e.g. IP address), browser type, browser version, the pages of our Service that You visit, the time and date of Your visit, the time spent on those pages, unique device identifiers and other diagnostic data.</p>\r\n<p>When You access the Service by or through a mobile device, We may collect certain information automatically, including, but not limited to, the type of mobile device You use, Your mobile device unique ID, the IP address of Your mobile device, Your mobile operating system, the type of mobile Internet browser You use, unique device identifiers and other diagnostic data.</p>\r\n<p>We may also collect information that Your browser sends whenever You visit our Service or when You access the Service by or through a mobile device.</p>\r\n<h3>Tracking Technologies and Cookies</h3>\r\n<p>We use Cookies and similar tracking technologies to track the activity on Our Service and store certain information. Tracking technologies used are beacons, tags, and scripts to collect and track information and to improve and analyze Our Service. The technologies We use may include:</p>\r\n<ul>\r\n<li><strong>Cookies or Browser Cookies.</strong> A cookie is a small file placed on Your Device. You can instruct Your browser to refuse all Cookies or to indicate when a Cookie is being sent. However, if You do not accept Cookies, You may not be able to use some parts of our Service. Unless you have adjusted Your browser setting so that it will refuse Cookies, our Service may use Cookies.</li>\r\n<li><strong>Flash Cookies.</strong> Certain features of our Service may use local stored objects (or Flash Cookies) to collect and store information about Your preferences or Your activity on our Service. Flash Cookies are not managed by the same browser settings as those used for Browser Cookies. For more information on how You can delete Flash Cookies, please read \"Where can I change the settings for disabling, or deleting local shared objects?\" available at <a href=\"https://helpx.adobe.com/flash-player/kb/disable-local-shared-objects-flash.html#main_Where_can_I_change_the_settings_for_disabling__or_deleting_local_shared_objects_\" rel=\"external nofollow noopener\" target=\"_blank\">https://helpx.adobe.com/flash-player/kb/disable-local-shared-objects-flash.html#main_Where_can_I_change_the_settings_for_disabling__or_deleting_local_shared_objects_</a></li>\r\n<li><strong>Web Beacons.</strong> Certain sections of our Service and our emails may contain small electronic files known as web beacons (also referred to as clear gifs, pixel tags, and single-pixel gifs) that permit the Company, for example, to count users who have visited those pages or opened an email and for other related website statistics (for example, recording the popularity of a certain section and verifying system and server integrity).</li>\r\n</ul>\r\n<p>Cookies can be \"Persistent\" or \"Session\" Cookies. Persistent Cookies remain on Your personal computer or mobile device when You go offline, while Session Cookies are deleted as soon as You close Your web browser. You can learn more about cookies here: <a href=\"https://www.termsfeed.com/privacy-policy-generator/#faq-8\" target=\"_blank\">Cookies by TermsFeed Generator</a>.</p>\r\n<p>We use both Session and Persistent Cookies for the purposes set out below:</p>\r\n<ul>\r\n<li>\r\n<p><strong>Necessary / Essential Cookies</strong></p>\r\n<p>Type: Session Cookies</p>\r\n<p>Administered by: Us</p>\r\n<p>Purpose: These Cookies are essential to provide You with services available through the Website and to enable You to use some of its features. They help to authenticate users and prevent fraudulent use of user accounts. Without these Cookies, the services that You have asked for cannot be provided, and We only use these Cookies to provide You with those services.</p>\r\n</li>\r\n<li>\r\n<p><strong>Cookies Policy / Notice Acceptance Cookies</strong></p>\r\n<p>Type: Persistent Cookies</p>\r\n<p>Administered by: Us</p>\r\n<p>Purpose: These Cookies identify if users have accepted the use of cookies on the Website.</p>\r\n</li>\r\n<li>\r\n<p><strong>Functionality Cookies</strong></p>\r\n<p>Type: Persistent Cookies</p>\r\n<p>Administered by: Us</p>\r\n<p>Purpose: These Cookies allow us to remember choices You make when You use the Website, such as remembering your login details or language preference. The purpose of these Cookies is to provide You with a more personal experience and to avoid You having to re-enter your preferences every time You use the Website.</p>\r\n</li>\r\n</ul>\r\n<p>For more information about the cookies we use and your choices regarding cookies, please visit our Cookies Policy or the Cookies section of our Privacy Policy.</p>\r\n<h2>Use of Your Personal Data</h2>\r\n<p>The Company may use Personal Data for the following purposes:</p>\r\n<ul>\r\n<li>\r\n<p><strong>To provide and maintain our Service</strong>, including to monitor the usage of our Service.</p>\r\n</li>\r\n<li>\r\n<p><strong>To manage Your Account:</strong> to manage Your registration as a user of the Service. The Personal Data You provide can give You access to different functionalities of the Service that are available to You as a registered user.</p>\r\n</li>\r\n<li>\r\n<p><strong>For the performance of a contract:</strong> the development, compliance and undertaking of the purchase contract for the products, items or services You have purchased or of any other contract with Us through the Service.</p>\r\n</li>\r\n<li>\r\n<p><strong>To contact You:</strong> To contact You by email, telephone calls, SMS, or other equivalent forms of electronic communication, such as a mobile application\'s push notifications regarding updates or informative communications related to the functionalities, products or contracted services, including the security updates, when necessary or reasonable for their implementation.</p>\r\n</li>\r\n<li>\r\n<p><strong>To provide You</strong> with news, special offers and general information about other goods, services and events which we offer that are similar to those that you have already purchased or enquired about unless You have opted not to receive such information.</p>\r\n</li>\r\n<li>\r\n<p><strong>To manage Your requests:</strong> To attend and manage Your requests to Us.</p>\r\n</li>\r\n<li>\r\n<p><strong>For business transfers:</strong> We may use Your information to evaluate or conduct a merger, divestiture, restructuring, reorganization, dissolution, or other sale or transfer of some or all of Our assets, whether as a going concern or as part of bankruptcy, liquidation, or similar proceeding, in which Personal Data held by Us about our Service users is among the assets transferred.</p>\r\n</li>\r\n<li>\r\n<p><strong>For other purposes</strong>: We may use Your information for other purposes, such as data analysis, identifying usage trends, determining the effectiveness of our promotional campaigns and to evaluate and improve our Service, products, services, marketing and your experience.</p>\r\n</li>\r\n</ul>\r\n<p>We may share Your personal information in the following situations:</p>\r\n<ul>\r\n<li><strong>With Service Providers:</strong> We may share Your personal information with Service Providers to monitor and analyze the use of our Service,  to contact You.</li>\r\n<li><strong>For business transfers:</strong> We may share or transfer Your personal information in connection with, or during negotiations of, any merger, sale of Company assets, financing, or acquisition of all or a portion of Our business to another company.</li>\r\n<li><strong>With Affiliates:</strong> We may share Your information with Our affiliates, in which case we will require those affiliates to honor this Privacy Policy. Affiliates include Our parent company and any other subsidiaries, joint venture partners or other companies that We control or that are under common control with Us.</li>\r\n<li><strong>With business partners:</strong> We may share Your information with Our business partners to offer You certain products, services or promotions.</li>\r\n<li><strong>With other users:</strong> when You share personal information or otherwise interact in the public areas with other users, such information may be viewed by all users and may be publicly distributed outside.</li>\r\n<li><strong>With Your consent</strong>: We may disclose Your personal information for any other purpose with Your consent.</li>\r\n</ul>\r\n<h2>Retention of Your Personal Data</h2>\r\n<p>The Company will retain Your Personal Data only for as long as is necessary for the purposes set out in this Privacy Policy. We will retain and use Your Personal Data to the extent necessary to comply with our legal obligations (for example, if we are required to retain your data to comply with applicable laws), resolve disputes, and enforce our legal agreements and policies.</p>\r\n<p>The Company will also retain Usage Data for internal analysis purposes. Usage Data is generally retained for a shorter period of time, except when this data is used to strengthen the security or to improve the functionality of Our Service, or We are legally obligated to retain this data for longer time periods.</p>\r\n<h2>Transfer of Your Personal Data</h2>\r\n<p>Your information, including Personal Data, is processed at the Company\'s operating offices and in any other places where the parties involved in the processing are located. It means that this information may be transferred to — and maintained on — computers located outside of Your state, province, country or other governmental jurisdiction where the data protection laws may differ than those from Your jurisdiction.</p>\r\n<p>Your consent to this Privacy Policy followed by Your submission of such information represents Your agreement to that transfer.</p>\r\n<p>The Company will take all steps reasonably necessary to ensure that Your data is treated securely and in accordance with this Privacy Policy and no transfer of Your Personal Data will take place to an organization or a country unless there are adequate controls in place including the security of Your data and other personal information.</p>\r\n<h2>Disclosure of Your Personal Data</h2>\r\n<h3>Business Transactions</h3>\r\n<p>If the Company is involved in a merger, acquisition or asset sale, Your Personal Data may be transferred. We will provide notice before Your Personal Data is transferred and becomes subject to a different Privacy Policy.</p>\r\n<h3>Law enforcement</h3>\r\n<p>Under certain circumstances, the Company may be required to disclose Your Personal Data if required to do so by law or in response to valid requests by public authorities (e.g. a court or a government agency).</p>\r\n<h3>Other legal requirements</h3>\r\n<p>The Company may disclose Your Personal Data in the good faith belief that such action is necessary to:</p>\r\n<ul>\r\n<li>Comply with a legal obligation</li>\r\n<li>Protect and defend the rights or property of the Company</li>\r\n<li>Prevent or investigate possible wrongdoing in connection with the Service</li>\r\n<li>Protect the personal safety of Users of the Service or the public</li>\r\n<li>Protect against legal liability</li>\r\n</ul>\r\n<h2>Security of Your Personal Data</h2>\r\n<p>The security of Your Personal Data is important to Us, but remember that no method of transmission over the Internet, or method of electronic storage is 100% secure. While We strive to use commercially acceptable means to protect Your Personal Data, We cannot guarantee its absolute security.</p>\r\n<h1>Children\'s Privacy</h1>\r\n<p>Our Service does not address anyone under the age of 13. We do not knowingly collect personally identifiable information from anyone under the age of 13. If You are a parent or guardian and You are aware that Your child has provided Us with Personal Data, please contact Us. If We become aware that We have collected Personal Data from anyone under the age of 13 without verification of parental consent, We take steps to remove that information from Our servers.</p>\r\n<p>If We need to rely on consent as a legal basis for processing Your information and Your country requires consent from a parent, We may require Your parent\'s consent before We collect and use that information.</p>\r\n<h1>Links to Other Websites</h1>\r\n<p>Our Service may contain links to other websites that are not operated by Us. If You click on a third party link, You will be directed to that third party\'s site. We strongly advise You to review the Privacy Policy of every site You visit.</p>\r\n<p>We have no control over and assume no responsibility for the content, privacy policies or practices of any third party sites or services.</p>\r\n<h1>Changes to this Privacy Policy</h1>\r\n<p>We may update Our Privacy Policy from time to time. We will notify You of any changes by posting the new Privacy Policy on this page.</p>\r\n<p>We will let You know via email and/or a prominent notice on Our Service, prior to the change becoming effective and update the \"Last updated\" date at the top of this Privacy Policy.</p>\r\n<p>You are advised to review this Privacy Policy periodically for any changes. Changes to this Privacy Policy are effective when they are posted on this page.</p>\r\n<h1>Contact Us</h1>\r\n<p>If you have any questions about this Privacy Policy, You can contact us:</p>\r\n<ul>\r\n<li>\r\n<p>By email: info@asthatea.com</p>\r\n</li>\r\n<li>\r\n<p>By phone number: 86972 28555</p>\r\n</li>\r\n</ul>', NULL, NULL, 0, 1),
(3, 'Terms & Condition', 'terms-conditions', '<h1>Terms and Conditions</h1>\r\n<p>Last updated: May 19, 2022</p>\r\n<p>Please read these terms and conditions carefully before using Our Service.</p>\r\n<h1>Interpretation and Definitions</h1>\r\n<h2>Interpretation</h2>\r\n<p>The words of which the initial letter is capitalized have meanings defined under the following conditions. The following definitions shall have the same meaning regardless of whether they appear in singular or in plural.</p>\r\n<h2>Definitions</h2>\r\n<p>For the purposes of these Terms and Conditions:</p>\r\n<ul>\r\n<li>\r\n<p><strong>Affiliate</strong> means an entity that controls, is controlled by or is under common control with a party, where \"control\" means ownership of 50% or more of the shares, equity interest or other securities entitled to vote for election of directors or other managing authority.</p>\r\n</li>\r\n<li>\r\n<p><strong>Country</strong> refers to: West Bengal,  India</p>\r\n</li>\r\n<li>\r\n<p><strong>Company</strong> (referred to as either \"the Company\", \"We\", \"Us\" or \"Our\" in this Agreement) refers to Astha tea.</p>\r\n</li>\r\n<li>\r\n<p><strong>Device</strong> means any device that can access the Service such as a computer, a cellphone or a digital tablet.</p>\r\n</li>\r\n<li>\r\n<p><strong>Service</strong> refers to the Website.</p>\r\n</li>\r\n<li>\r\n<p><strong>Terms and Conditions</strong> (also referred as \"Terms\") mean these Terms and Conditions that form the entire agreement between You and the Company regarding the use of the Service. This Terms and Conditions agreement has been created with the help of the <a href=\"https://www.termsfeed.com/terms-conditions-generator/\" target=\"_blank\">Terms and Conditions Generator</a>.</p>\r\n</li>\r\n<li>\r\n<p><strong>Third-party Social Media Service</strong> means any services or content (including data, information, products or services) provided by a third-party that may be displayed, included or made available by the Service.</p>\r\n</li>\r\n<li>\r\n<p><strong>Website</strong> refers to Astha tea, accessible from <a href=\"https://asthatea.com\" rel=\"external nofollow noopener\" target=\"_blank\">https://asthatea.com</a></p>\r\n</li>\r\n<li>\r\n<p><strong>You</strong> means the individual accessing or using the Service, or the company, or other legal entity on behalf of which such individual is accessing or using the Service, as applicable.</p>\r\n</li>\r\n</ul>\r\n<h1>Acknowledgment</h1>\r\n<p>These are the Terms and Conditions governing the use of this Service and the agreement that operates between You and the Company. These Terms and Conditions set out the rights and obligations of all users regarding the use of the Service.</p>\r\n<p>Your access to and use of the Service is conditioned on Your acceptance of and compliance with these Terms and Conditions. These Terms and Conditions apply to all visitors, users and others who access or use the Service.</p>\r\n<p>By accessing or using the Service You agree to be bound by these Terms and Conditions. If You disagree with any part of these Terms and Conditions then You may not access the Service.</p>\r\n<p>You represent that you are over the age of 18. The Company does not permit those under 18 to use the Service.</p>\r\n<p>Your access to and use of the Service is also conditioned on Your acceptance of and compliance with the Privacy Policy of the Company. Our Privacy Policy describes Our policies and procedures on the collection, use and disclosure of Your personal information when You use the Application or the Website and tells You about Your privacy rights and how the law protects You. Please read Our Privacy Policy carefully before using Our Service.</p>\r\n<h1>Links to Other Websites</h1>\r\n<p>Our Service may contain links to third-party web sites or services that are not owned or controlled by the Company.</p>\r\n<p>The Company has no control over, and assumes no responsibility for, the content, privacy policies, or practices of any third party web sites or services. You further acknowledge and agree that the Company shall not be responsible or liable, directly or indirectly, for any damage or loss caused or alleged to be caused by or in connection with the use of or reliance on any such content, goods or services available on or through any such web sites or services.</p>\r\n<p>We strongly advise You to read the terms and conditions and privacy policies of any third-party web sites or services that You visit.</p>\r\n<h1>Termination</h1>\r\n<p>We may terminate or suspend Your access immediately, without prior notice or liability, for any reason whatsoever, including without limitation if You breach these Terms and Conditions.</p>\r\n<p>Upon termination, Your right to use the Service will cease immediately.</p>\r\n<h1>Limitation of Liability</h1>\r\n<p>Notwithstanding any damages that You might incur, the entire liability of the Company and any of its suppliers under any provision of this Terms and Your exclusive remedy for all of the foregoing shall be limited to the amount actually paid by You through the Service or 100 USD if You haven\'t purchased anything through the Service.</p>\r\n<p>To the maximum extent permitted by applicable law, in no event shall the Company or its suppliers be liable for any special, incidental, indirect, or consequential damages whatsoever (including, but not limited to, damages for loss of profits, loss of data or other information, for business interruption, for personal injury, loss of privacy arising out of or in any way related to the use of or inability to use the Service, third-party software and/or third-party hardware used with the Service, or otherwise in connection with any provision of this Terms), even if the Company or any supplier has been advised of the possibility of such damages and even if the remedy fails of its essential purpose.</p>\r\n<p>Some states do not allow the exclusion of implied warranties or limitation of liability for incidental or consequential damages, which means that some of the above limitations may not apply. In these states, each party\'s liability will be limited to the greatest extent permitted by law.</p>\r\n<h1>\"AS IS\" and \"AS AVAILABLE\" Disclaimer</h1>\r\n<p>The Service is provided to You \"AS IS\" and \"AS AVAILABLE\" and with all faults and defects without warranty of any kind. To the maximum extent permitted under applicable law, the Company, on its own behalf and on behalf of its Affiliates and its and their respective licensors and service providers, expressly disclaims all warranties, whether express, implied, statutory or otherwise, with respect to the Service, including all implied warranties of merchantability, fitness for a particular purpose, title and non-infringement, and warranties that may arise out of course of dealing, course of performance, usage or trade practice. Without limitation to the foregoing, the Company provides no warranty or undertaking, and makes no representation of any kind that the Service will meet Your requirements, achieve any intended results, be compatible or work with any other software, applications, systems or services, operate without interruption, meet any performance or reliability standards or be error free or that any errors or defects can or will be corrected.</p>\r\n<p>Without limiting the foregoing, neither the Company nor any of the company\'s provider makes any representation or warranty of any kind, express or implied: (i) as to the operation or availability of the Service, or the information, content, and materials or products included thereon; (ii) that the Service will be uninterrupted or error-free; (iii) as to the accuracy, reliability, or currency of any information or content provided through the Service; or (iv) that the Service, its servers, the content, or e-mails sent from or on behalf of the Company are free of viruses, scripts, trojan horses, worms, malware, timebombs or other harmful components.</p>\r\n<p>Some jurisdictions do not allow the exclusion of certain types of warranties or limitations on applicable statutory rights of a consumer, so some or all of the above exclusions and limitations may not apply to You. But in such a case the exclusions and limitations set forth in this section shall be applied to the greatest extent enforceable under applicable law.</p>\r\n<h1>Governing Law</h1>\r\n<p>The laws of the Country, excluding its conflicts of law rules, shall govern this Terms and Your use of the Service. Your use of the Application may also be subject to other local, state, national, or international laws.</p>\r\n<h1>Disputes Resolution</h1>\r\n<p>If You have any concern or dispute about the Service, You agree to first try to resolve the dispute informally by contacting the Company.</p>\r\n<h1>For European Union (EU) Users</h1>\r\n<p>If You are a European Union consumer, you will benefit from any mandatory provisions of the law of the country in which you are resident in.</p>\r\n<h1>United States Legal Compliance</h1>\r\n<p>You represent and warrant that (i) You are not located in a country that is subject to the United States government embargo, or that has been designated by the United States government as a \"terrorist supporting\" country, and (ii) You are not listed on any United States government list of prohibited or restricted parties.</p>\r\n<h1>Severability and Waiver</h1>\r\n<h2>Severability</h2>\r\n<p>If any provision of these Terms is held to be unenforceable or invalid, such provision will be changed and interpreted to accomplish the objectives of such provision to the greatest extent possible under applicable law and the remaining provisions will continue in full force and effect.</p>\r\n<h2>Waiver</h2>\r\n<p>Except as provided herein, the failure to exercise a right or to require performance of an obligation under these Terms shall not effect a party\'s ability to exercise such right or require such performance at any time thereafter nor shall the waiver of a breach constitute a waiver of any subsequent breach.</p>\r\n<h1>Translation Interpretation</h1>\r\n<p>These Terms and Conditions may have been translated if We have made them available to You on our Service.\r\nYou agree that the original English text shall prevail in the case of a dispute.</p>\r\n<h1>Changes to These Terms and Conditions</h1>\r\n<p>We reserve the right, at Our sole discretion, to modify or replace these Terms at any time. If a revision is material We will make reasonable efforts to provide at least 30 days\' notice prior to any new terms taking effect. What constitutes a material change will be determined at Our sole discretion.</p>\r\n<p>By continuing to access or use Our Service after those revisions become effective, You agree to be bound by the revised terms. If You do not agree to the new terms, in whole or in part, please stop using the website and the Service.</p>\r\n<h1>Contact Us</h1>\r\n<p>If you have any questions about these Terms and Conditions, You can contact us:</p>\r\n<ul>\r\n<li>\r\n<p>By email: info@asthatea.com</p>\r\n</li>\r\n<li>\r\n<p>By phone number: +91 86972 28555</p>\r\n</li>\r\n</ul>', NULL, NULL, 0, 1),
(4, 'Return & Refund Policy', 'return-refund', '<h1>Return and Refund Policy</h1>\r\n<p>Last updated: May 19, 2022</p>\r\n<p>Thank you for shopping at Astha tea.</p>\r\n<p>Products once sold can not be returned or refunded.</p>\r\n<p>If, for any reason, You are not completely satisfied with a purchase We invite You to review our policy on refunds and returns. This Return and Refund Policy has been created with the help of the <a href=\"https://www.termsfeed.com/return-refund-policy-generator/\" target=\"_blank\">Return and Refund Policy Generator</a>.</p>\r\n<p>The following terms are applicable for any products that You purchased with Us.</p>\r\n<h1>Interpretation and Definitions</h1>\r\n<h2>Interpretation</h2>\r\n<p>The words of which the initial letter is capitalized have meanings defined under the following conditions. The following definitions shall have the same meaning regardless of whether they appear in singular or in plural.</p>\r\n<h2>Definitions</h2>\r\n<p>For the purposes of this Return and Refund Policy:</p>\r\n<ul>\r\n<li>\r\n<p><strong>Company</strong> (referred to as either \"the Company\", \"We\", \"Us\" or \"Our\" in this Agreement) refers to Astha tea.</p>\r\n</li>\r\n<li>\r\n<p><strong>Goods</strong> refer to the items offered for sale on the Service.</p>\r\n</li>\r\n<li>\r\n<p><strong>Orders</strong> mean a request by You to purchase Goods from Us.</p>\r\n</li>\r\n<li>\r\n<p><strong>Service</strong> refers to the Website.</p>\r\n</li>\r\n<li>\r\n<p><strong>Website</strong> refers to Astha tea, accessible from <a href=\"https://asthatea.com\" rel=\"external nofollow noopener\" target=\"_blank\">https://asthatea.com</a></p>\r\n</li>\r\n<li>\r\n<p><strong>You</strong> means the individual accessing or using the Service, or the company, or other legal entity on behalf of which such individual is accessing or using the Service, as applicable.</p>\r\n</li>\r\n</ul>\r\n<h1>Your Order Cancellation Rights</h1>\r\n<p>You are entitled to cancel Your Order within&nbsp; days without giving any reason for doing so.</p>\r\n<p>The deadline for cancelling an Order is 7 days from the date on which You received the Goods or on which a third party you have appointed, who is not the carrier, takes possession of the product delivered.</p>\r\n<p>In order to exercise Your right of cancellation, You must inform Us of your decision by means of a clear statement. You can inform us of your decision by:</p>\r\n<ul>\r\n<li>By email: info@asthatea.com</li>\r\n</ul>\r\n<p>We will reimburse You no later than 14 days from the day on which We receive the returned Goods. We will use the same means of payment as You used for the Order, and You will not incur any fees for such reimbursement.</p>\r\n<h1>Conditions for Returns</h1>\r\n<p>In order for the Goods to be eligible for a return, please make sure that:</p>\r\n<ul>\r\n<li>The Goods were purchased in the last 7 days</li>\r\n<li>The Goods are in the original packaging</li>\r\n</ul>\r\n<p>The following Goods cannot be returned:</p>\r\n<ul>\r\n<li>The supply of Goods made to Your specifications or clearly personalized.</li>\r\n<li>The supply of Goods which according to their nature are not suitable to be returned, deteriorate rapidly or where the date of expiry is over.</li>\r\n<li>The supply of Goods which are not suitable for return due to health protection or hygiene reasons and were unsealed after delivery.</li>\r\n<li>The supply of Goods which are, after delivery, according to their nature, inseparably mixed with other items.</li>\r\n</ul>\r\n<p>We reserve the right to refuse returns of any merchandise that does not meet the above return conditions in our sole discretion.</p>\r\n<p>Only regular priced Goods may be refunded. Unfortunately, Goods on sale cannot be refunded. This exclusion may not apply to You if it is not permitted by applicable law.</p>\r\n<h1>Returning Goods</h1>\r\n<p>You are responsible for the cost and risk of returning the Goods to Us. You should send the Goods at the following address:</p>\r\n<p>No need We Pickup</p>\r\n<p>We cannot be held responsible for Goods damaged or lost in return shipment. Therefore, We recommend an insured and trackable mail service. We are unable to issue a refund without actual receipt of the Goods or proof of received return delivery.</p>\r\n<h1>Gifts</h1>\r\n<p>If the Goods were marked as a gift when purchased and then shipped directly to you, You\'ll receive a gift credit for the value of your return. Once the returned product is received, a gift certificate will be mailed to You.</p>\r\n<p>If the Goods weren\'t marked as a gift when purchased, or the gift giver had the Order shipped to themselves to give it to You later, We will send the refund to the gift giver.</p>\r\n<h2>Contact Us</h2>\r\n<p>If you have any questions about our Returns and Refunds Policy, please contact us:</p>\r\n<ul>\r\n<li>By email: info@asthatea.com</li>\r\n</ul>', NULL, NULL, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `pagesettings`
--

CREATE TABLE `pagesettings` (
  `id` int(10) UNSIGNED NOT NULL,
  `contact_success` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_title` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_text` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `side_title` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `side_text` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `street` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fax` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `site` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slider` tinyint(1) NOT NULL DEFAULT 1,
  `service` tinyint(1) NOT NULL DEFAULT 1,
  `featured` tinyint(1) NOT NULL DEFAULT 1,
  `small_banner` tinyint(1) NOT NULL DEFAULT 1,
  `best` tinyint(1) NOT NULL DEFAULT 1,
  `top_rated` tinyint(1) NOT NULL DEFAULT 1,
  `large_banner` tinyint(1) NOT NULL DEFAULT 1,
  `big` tinyint(1) NOT NULL DEFAULT 1,
  `hot_sale` tinyint(1) NOT NULL DEFAULT 1,
  `partners` tinyint(1) NOT NULL DEFAULT 0,
  `review_blog` tinyint(1) NOT NULL DEFAULT 1,
  `best_seller_banner` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `best_seller_banner_link` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `big_save_banner` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `big_save_banner_link` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bottom_small` tinyint(1) NOT NULL DEFAULT 0,
  `flash_deal` tinyint(1) NOT NULL DEFAULT 0,
  `best_seller_banner1` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `best_seller_banner_link1` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `big_save_banner1` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `big_save_banner_link1` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `featured_category` int(1) NOT NULL DEFAULT 0,
  `slider_right_banner1` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slider_right_banner2` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slider_right_banner_link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gallery_large_banner` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slider_right_banner_link1` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gallery_large_banner_link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gallery_small_banner1` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gallery_small_banner2` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gallery_small_banner3` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gallery_small_banner4` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gallery_small_banner_link1` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gallery_small_banner_link2` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gallery_small_banner_link3` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gallery_small_banner_link4` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pagesettings`
--

INSERT INTO `pagesettings` (`id`, `contact_success`, `contact_email`, `contact_title`, `contact_text`, `side_title`, `side_text`, `street`, `phone`, `fax`, `email`, `site`, `slider`, `service`, `featured`, `small_banner`, `best`, `top_rated`, `large_banner`, `big`, `hot_sale`, `partners`, `review_blog`, `best_seller_banner`, `best_seller_banner_link`, `big_save_banner`, `big_save_banner_link`, `bottom_small`, `flash_deal`, `best_seller_banner1`, `best_seller_banner_link1`, `big_save_banner1`, `big_save_banner_link1`, `featured_category`, `slider_right_banner1`, `slider_right_banner2`, `slider_right_banner_link`, `gallery_large_banner`, `slider_right_banner_link1`, `gallery_large_banner_link`, `gallery_small_banner1`, `gallery_small_banner2`, `gallery_small_banner3`, `gallery_small_banner4`, `gallery_small_banner_link1`, `gallery_small_banner_link2`, `gallery_small_banner_link3`, `gallery_small_banner_link4`) VALUES
(1, 'Success! Thanks for contacting us, we will get back to you shortly.', 'info@asthatea.com', 'Get In Touch With Us', 'Your email address will not be published. Required fields are marked.', '<h4 class=\"title\" style=\"margin-bottom: 10px; font-weight: 600; line-height: 28px; font-size: 28px;\">Let\'s Connect</h4>', '<span style=\"color: rgb(51, 51, 51);\">Get in touch with us</span>', 'Khardaha, West Bengal, Kolkata-700117', '+91 86972 28555', '00 000 000 000', 'info@asthatea.com', 'https://asthatea.com', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, '1622434741Side-banner(2).jpg', 'http://google.com', '1622434848side-banner(1).jpg', 'http://google.com', 1, 1, '1622434741Side-banner(3).jpg', 'http://google.com', '1622434848side-banner(2).jpg', 'http://google.com', 1, '1622438483bottombig.jpg', '1622438483Big.jpg', 'https://www.google.com/', '1655885121Natural.png', 'https://www.google.com/', '/category/tea-leaf', '1622434213TOp-small(1).jpg', '1622434213TOp-small(2).jpg', '1622434213Topsmallbanner(1).jpg', '1622434213Topsmallbanner(2).jpg', 'https://www.google.com/', 'https://www.google.com/', 'https://www.google.com/', 'https://www.google.com/');

-- --------------------------------------------------------

--
-- Table structure for table `partners`
--

CREATE TABLE `partners` (
  `id` int(191) NOT NULL,
  `photo` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `partners`
--

INSERT INTO `partners` (`id`, `photo`, `link`) VALUES
(1, '1563165366brand-1.png', 'https://www.google.com/'),
(2, '1563165383brand-2.png', 'https://www.google.com/'),
(3, '1563165393brand-3.png', 'https://www.google.com/'),
(4, '1563165400brand-1.png', NULL),
(5, '1563165411brand-2.png', NULL),
(6, '1563165444brand-3.png', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `payment_gateways`
--

CREATE TABLE `payment_gateways` (
  `id` int(191) NOT NULL,
  `subtitle` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `details` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` enum('manual','automatic') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'manual',
  `information` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `keyword` varchar(191) DEFAULT NULL,
  `is_checkout` tinyint(10) NOT NULL DEFAULT 1,
  `is_deposite` tinyint(5) NOT NULL DEFAULT 1,
  `is_subscription` tinyint(5) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `payment_gateways`
--

INSERT INTO `payment_gateways` (`id`, `subtitle`, `title`, `details`, `name`, `type`, `information`, `keyword`, `is_checkout`, `is_deposite`, `is_subscription`) VALUES
(1, 'Pay with cash upon delivery.', 'Cash On Delivery', NULL, NULL, 'manual', NULL, 'cod', 1, 0, 0),
(8, NULL, NULL, NULL, 'Authorize.Net', 'automatic', '{\"login_id\":\"76zu9VgUSxrJ\",\"txn_key\":\"2Vj62a6skSrP5U3X\",\"sandbox_check\":1,\"text\":\"Pay Via Authorize.Net\"}', 'authorize.net', 0, 1, 1),
(9, NULL, NULL, NULL, 'Razorpay', 'automatic', '{\"key\":\"rzp_live_fjaFXQqBDqwol9\",\"secret\":\"zn9V5B3ONH3CFG4qieHU2Ana\",\"text\":\"Pay via your Razorpay account.\"}', 'razorpay', 1, 1, 1),
(11, NULL, NULL, NULL, 'Paytm', 'automatic', '{\"merchant\":\"tkogux49985047638244\",\"secret\":\"LhNGUUKE9xCQ9xY8\",\"website\":\"WEBSTAGING\",\"industry\":\"Retail\",\"sandbox_check\":1,\"text\":\"Pay via your Paytm account.\"}', 'paytm', 0, 1, 1),
(12, NULL, NULL, NULL, 'Paystack', 'automatic', '{\"key\":\"pk_test_162a56d42131cbb01932ed0d2c48f9cb99d8e8e2\",\"email\":\"junnuns@gmail.com\",\"text\":\"Pay via your Paystack account.\"}', 'paystack', 0, 1, 1),
(13, NULL, NULL, NULL, 'Instamojo', 'automatic', '{\"key\":\"test_172371aa837ae5cad6047dc3052\",\"token\":\"test_4ac5a785e25fc596b67dbc5c267\",\"sandbox_check\":1,\"text\":\"Pay via your Instamojo account.\"}', 'instamojo', 0, 1, 1),
(14, NULL, NULL, NULL, 'Stripe', 'automatic', '{\"key\":\"pk_test_UnU1Coi1p5qFGwtpjZMRMgJM\",\"secret\":\"sk_test_QQcg3vGsKRPlW6T3dXcNJsor\",\"text\":\"Pay via your Credit Card.\"}', 'stripe', 0, 1, 1),
(15, NULL, NULL, NULL, 'Paypal', 'automatic', '{\"client_id\":\"AcWYnysKa_elsQIAnlfsJXokR64Z31CeCbpis9G3msDC-BvgcbAwbacfDfEGSP-9Dp9fZaGgD05pX5Qi\",\"client_secret\":\"EGZXTq6d6vBPq8kysVx8WQA5NpavMpDzOLVOb9u75UfsJ-cFzn6aeBXIMyJW2lN1UZtJg5iDPNL9ocYE\",\"sandbox_check\":1,\"text\":\"Pay via your PayPal account.\"}', 'paypal', 0, 1, 1),
(17, NULL, NULL, NULL, 'Mollie Payment', 'automatic', '{\"key\":\"test_5HcWVs9qc5pzy36H9Tu9mwAyats33J\",\"text\":\"Pay with Mollie Payment.\"}', 'mollie', 0, 1, 1),
(21, NULL, NULL, NULL, 'SSLCommerz', 'automatic', '{\"store_id\":\"geniu5e1b00621f81e\",\"store_password\":\"geniu5e1b00621f81e@ssl\",\"sandbox_check\":1,\"text\":\"Pay Via SSLCommerz.\"}', 'sslcommerz', 0, 1, 1),
(117, NULL, NULL, NULL, 'Mercadopago', 'automatic', '{\"public_key\":\"TEST-6f72a502-51c8-4e9a-8ca3-cb7fa0addad8\",\"token\":\"TEST-6068652511264159-022306-e78da379f3963916b1c7130ff2906826-529753482\",\"sandbox_check\":1,\"text\":\"Pay Via MercadoPago\"}', 'mercadopago', 0, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `pickups`
--

CREATE TABLE `pickups` (
  `id` int(191) UNSIGNED NOT NULL,
  `location` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pickups`
--

INSERT INTO `pickups` (`id`, `location`) VALUES
(6, '789654'),
(7, '712223'),
(8, '700109'),
(9, '700117');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(191) UNSIGNED NOT NULL,
  `sku` varchar(255) DEFAULT NULL,
  `product_type` enum('normal','affiliate') NOT NULL DEFAULT 'normal',
  `affiliate_link` text DEFAULT NULL,
  `user_id` int(191) NOT NULL DEFAULT 0,
  `category_id` int(191) UNSIGNED NOT NULL,
  `subcategory_id` int(191) UNSIGNED DEFAULT NULL,
  `childcategory_id` int(191) UNSIGNED DEFAULT NULL,
  `attributes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `thumbnail` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size_qty` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size_price` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` double NOT NULL,
  `previous_price` double DEFAULT NULL,
  `details` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `stock` int(191) DEFAULT NULL,
  `min_qty` int(11) NOT NULL DEFAULT 1,
  `policy` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `specification` text DEFAULT NULL,
  `status` tinyint(2) UNSIGNED NOT NULL DEFAULT 1,
  `views` int(191) UNSIGNED NOT NULL DEFAULT 0,
  `tags` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `features` text DEFAULT NULL,
  `colors` text DEFAULT NULL,
  `product_condition` tinyint(1) NOT NULL DEFAULT 0,
  `ship` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_meta` tinyint(1) NOT NULL DEFAULT 0,
  `meta_tag` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `youtube` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` enum('Physical','Digital','License') NOT NULL,
  `license` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `license_qty` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `platform` varchar(255) DEFAULT NULL,
  `region` varchar(255) DEFAULT NULL,
  `licence_type` varchar(255) DEFAULT NULL,
  `measure` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `featured` tinyint(2) UNSIGNED NOT NULL DEFAULT 0,
  `best` tinyint(10) UNSIGNED NOT NULL DEFAULT 0,
  `top` tinyint(10) UNSIGNED NOT NULL DEFAULT 0,
  `hot` tinyint(10) UNSIGNED NOT NULL DEFAULT 0,
  `latest` tinyint(10) UNSIGNED NOT NULL DEFAULT 0,
  `big` tinyint(10) UNSIGNED NOT NULL DEFAULT 0,
  `trending` tinyint(1) NOT NULL DEFAULT 0,
  `sale` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_discount` tinyint(1) NOT NULL DEFAULT 0,
  `discount_date` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `whole_sell_qty` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `whole_sell_discount` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_catalog` tinyint(1) NOT NULL DEFAULT 0,
  `catalog_id` int(191) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `sku`, `product_type`, `affiliate_link`, `user_id`, `category_id`, `subcategory_id`, `childcategory_id`, `attributes`, `name`, `slug`, `photo`, `thumbnail`, `file`, `size`, `size_qty`, `size_price`, `color`, `price`, `previous_price`, `details`, `stock`, `min_qty`, `policy`, `specification`, `status`, `views`, `tags`, `features`, `colors`, `product_condition`, `ship`, `is_meta`, `meta_tag`, `meta_description`, `youtube`, `type`, `license`, `license_qty`, `link`, `platform`, `region`, `licence_type`, `measure`, `featured`, `best`, `top`, `hot`, `latest`, `big`, `trending`, `sale`, `created_at`, `updated_at`, `is_discount`, `discount_date`, `whole_sell_qty`, `whole_sell_discount`, `is_catalog`, `catalog_id`) VALUES
(2, 'aft0504LIs', 'normal', NULL, 0, 4, 6, NULL, NULL, 'Skimmed', 'skimmed-aft0504lis', 'LHXBnnyV92.png', '6TYsCGy2HB.jpg', NULL, NULL, NULL, NULL, NULL, 60, 80, 'Powdered milk is frequently used in the manufacture of infant formula, confectionery such as chocolate and caramel candy, and in recipes for baked goods where adding liquid milk would render the product too thin.<br>', 2, 1, '<br>', 'Powdered milk is frequently used in the manufacture of infant formula, confectionery such as chocolate and caramel candy, and in recipes for baked goods where adding liquid milk would render the product too thin.<br>', 1, 111, 'Milk', 'Milk', '#000000', 0, NULL, 0, NULL, NULL, NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, 0, 0, 0, '2022-08-06 10:13:29', '2023-03-18 01:47:48', 0, NULL, NULL, NULL, 0, 0),
(3, 'd2R1381k7p', 'normal', NULL, 0, 4, NULL, NULL, NULL, 'Dehydrated', 'dehydrated-d2r1381k7p', 'T5IDdIMPwS.png', 'eSZMk9kyOx.jpg', NULL, NULL, NULL, NULL, NULL, 40, 70, 'Powdered milk is frequently used in the manufacture of infant formula, confectionery such as chocolate and caramel candy, and in recipes for baked goods where adding liquid milk would render the product too thin.<br>', 1, 1, '<br>', 'Powdered milk is frequently used in the manufacture of infant formula, confectionery such as chocolate and caramel candy, and in recipes for baked goods where adding liquid milk would render the product too thin.<br>', 1, 116, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, 0, 0, 0, '2022-08-06 10:29:05', '2023-03-18 01:47:49', 0, NULL, NULL, NULL, 0, 0),
(4, 'QuA1622SAF', 'normal', NULL, 0, 5, 2, NULL, NULL, 'Rolled Biscuits', 'rolled-biscuits-qua1622saf', 'w43oGWtcld.png', '8BS4EDb0uo.jpg', NULL, NULL, NULL, NULL, NULL, 60, 100, 'Definitions of rolled biscuit. biscuit made from dough rolled and cut. type of: biscuit. small round bread leavened with baking-powder or soda.<br>', 10, 1, '<br>', 'Definitions of rolled biscuit. biscuit made from dough rolled and cut. type of: biscuit. small round bread leavened with baking-powder or soda.<br>', 1, 59, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 0, 0, 0, 0, 0, 0, '2022-08-06 10:32:02', '2023-03-18 01:47:49', 0, NULL, NULL, NULL, 0, 0),
(5, 'lKZ1750Te0', 'normal', NULL, 0, 5, 18, NULL, NULL, 'Chocolate Chip Cookies', 'chocolate-chip-cookies-lkz1750te0', 'DGZw3ljzZO.png', 'ZyQJoBB7FB.jpg', NULL, NULL, NULL, NULL, NULL, 100, 150, 'These super soft and chewy chocolate chip cookies are the most popular cookie recipe on my website for good reason.<br>', 10, 1, '<br>', 'These super soft and chewy chocolate chip cookies are the most popular cookie recipe on my website for good reason.<br>', 1, 120, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 0, 0, 0, 0, 0, '2022-08-06 10:47:25', '2023-03-18 01:47:49', 0, NULL, NULL, NULL, 0, 0),
(6, 'vrW2746bDU', 'normal', NULL, 0, 5, 19, NULL, NULL, 'Drop Biscuits', 'drop-biscuits-vrw2746bdu', 'wghwfTA2cj.png', 'TRzK8tpOpH.jpg', NULL, NULL, NULL, NULL, NULL, 50, 80, 'Drop biscuits have more milk or other liquid added to the dough than rolled biscuits. The dough is moister and cannot be kneaded or rolled; simply drop tablespoons of dough onto the baking sheet.&nbsp;<br>', 20, 1, '<br>', 'Drop biscuits have more milk or other liquid added to the dough than rolled biscuits. The dough is moister and cannot be kneaded or rolled; simply drop tablespoons of dough onto the baking sheet.&nbsp;<br>', 1, 82, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '2022-08-06 10:50:23', '2023-03-18 01:47:48', 0, NULL, NULL, NULL, 0, 0),
(7, '3oo2857NUo', 'normal', NULL, 0, 8, 21, NULL, NULL, 'Porcelain', 'porcelain-3oo2857nuo', 'qhwKjmkH0d.png', 'Qc1RI8vSGw.jpg', NULL, NULL, NULL, NULL, NULL, 200, 250, 'In other words, porcelain is just a “fancy” type of ceramic. The finer, smooth texture characterizes porcelain. Both ceramic and porcelain mugs are usually covered with a glaze. Porcelain should feel pretty glass-like when made right, while ceramic can vary from smooth to rough. Porcelain.<br>', 14, 1, '<br>', 'In other words, porcelain is just a “fancy” type of ceramic. The finer, smooth texture characterizes porcelain. Both ceramic and porcelain mugs are usually covered with a glaze. Porcelain should feel pretty glass-like when made right, while ceramic can vary from smooth to rough. Porcelain.<br>', 1, 104, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, 0, 0, 0, '2022-08-06 10:52:46', '2023-03-18 01:47:49', 0, NULL, NULL, NULL, 0, 0),
(8, 'hKm3000dnG', 'normal', NULL, 0, 8, 22, NULL, NULL, 'Steel Cup', 'steel-cup-hkm3000dng', 'ySCYtmcZ6C.png', 'u0s3u3vkUJ.jpg', NULL, NULL, NULL, NULL, NULL, 150, 120, 'Well-known for its antibacterial and hygienic properties, stainless steel is widely used in the food and beverage industry — and even in the most sterile surgical environments. Steelys cups and bottles do not leach chemicals or require a synthetic lining or interior coating.<br>', 100, 1, '<br>', 'Well-known for its antibacterial and hygienic properties, stainless steel is widely used in the food and beverage industry — and even in the most sterile surgical environments. Steelys cups and bottles do not leach chemicals or require a synthetic lining or interior coating.<br>', 1, 92, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, 0, 0, 0, '2022-08-06 10:54:34', '2023-03-18 01:47:50', 0, NULL, NULL, NULL, 0, 0),
(9, 'xf23347cFx', 'normal', NULL, 0, 11, 23, NULL, NULL, 'Regular Sugar', 'regular-sugar-xf23347cfx', 'xWlrUj05W3.png', 'tK8dG2vEOw.jpg', NULL, NULL, NULL, NULL, NULL, 150, 130, 'Granulated sugar: Also commonly called regular sugar or white sugar, granulated sugar is refined sugar that food processors whiten and grind into a size similar to table salt. Baking recipes commonly call for this type of sugar.<br>', 150, 1, '<br>', 'Granulated sugar: Also commonly called regular sugar or white sugar, granulated sugar is refined sugar that food processors whiten and grind into a size similar to table salt. Baking recipes commonly call for this type of sugar.<br>', 1, 68, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '2022-08-06 11:00:28', '2023-03-18 01:47:48', 0, NULL, NULL, NULL, 0, 0),
(10, 'wld3444MhG', 'normal', NULL, 0, 11, 24, NULL, NULL, 'Sanding Sugar', 'sanding-sugar-wld3444mhg', 'XpcwXtN6n3.png', 'wXYpoIXfbt.jpg', NULL, NULL, NULL, NULL, NULL, 180, 150, 'Sanding sugar is a type of coarse-grained sugar made of extremely pure sucrose crystals that is used for decorating cookies, muffins and other baked goods and confections. It\'s often, but not always, colored in bright colors.<br>', NULL, 1, '<br>', 'Sanding sugar is a type of coarse-grained sugar made of extremely pure sucrose crystals that is used for decorating cookies, muffins and other baked goods and confections. It\'s often, but not always, colored in bright colors.<br>', 1, 112, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '2022-08-06 11:02:07', '2023-03-18 01:47:48', 0, NULL, NULL, NULL, 0, 0),
(11, 'B6V3561J6V', 'normal', NULL, 0, 11, 25, NULL, NULL, 'Brown Sugar', 'brown-sugar-b6v3561j6v', 'Jf6OZ1dq1k.png', 'Lx2JeZCpES.jpg', NULL, NULL, NULL, NULL, NULL, 175, 155, 'Brown sugar (an adulterated form of heroin), also called smack, junk, skag, dope, and chaw, is a semi-synthetic opioid derived from the morphine extracted from poppy plants. Pure heroin accounts for only 20% of the brown sugar drug; the remaining 80% comes in the form of chalk powder, zinc oxide, and even strychnine.<br>', 50, 1, '<br>', 'Brown sugar (an adulterated form of heroin), also called smack, junk, skag, dope, and chaw, is a semi-synthetic opioid derived from the morphine extracted from poppy plants. Pure heroin accounts for only 20% of the brown sugar drug; the remaining 80% comes in the form of chalk powder, zinc oxide, and even strychnine.<br>', 1, 56, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '2022-08-06 11:04:04', '2023-03-18 01:47:49', 0, NULL, NULL, NULL, 0, 0),
(12, 'Mte3670XTN', 'normal', NULL, 0, 18, 26, NULL, NULL, 'Assam Tea', 'assam-tea-mte3670xtn', '09BF11HHj3.png', '5dDU9mv02r.jpg', NULL, NULL, NULL, NULL, NULL, 250, 280, 'Assam tea is a black tea named after the region of its production, Assam, India. It is manufactured specifically from the plant Camellia sinensis var.Assam tea is a black tea named after the region of its production, Assam, India. It is manufactured specifically from the plant Camellia sinensis var.<br>', 150, 1, '<br>', 'Assam tea is a black tea named after the region of its production, Assam, India. It is manufactured specifically from the plant Camellia sinensis var.Assam tea is a black tea named after the region of its production, Assam, India. It is manufactured specifically from the plant Camellia sinensis var.<br>', 1, 128, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '2022-08-06 11:06:39', '2023-03-18 01:47:34', 0, NULL, NULL, NULL, 0, 0),
(13, 'Wrc3833Bu2', 'normal', NULL, 0, 18, 27, NULL, NULL, 'Darjeeling Tea', 'darjeeling-tea-wrc3833bu2', 'p5LwzVsAh6.png', 'ivSsdlrmfr.jpg', NULL, NULL, NULL, NULL, NULL, 250, 280, 'So what makes Darjeeling tea so special? Darjeeling Tea is the only tea in the world to get protection under the Geographical Indication (GI) trademark. It is said that these teas are the highest elevation produced teas world over and it is the altitude that creates an ideal environment for the tea plant.<br>', 199, 1, '<br>', 'So what makes Darjeeling tea so special? Darjeeling Tea is the only tea in the world to get protection under the Geographical Indication (GI) trademark. It is said that these teas are the highest elevation produced teas world over and it is the altitude that creates an ideal environment for the tea plant.<br>', 1, 97, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '2022-08-06 11:08:30', '2023-03-18 01:47:33', 0, NULL, NULL, NULL, 0, 0),
(14, 'G9V3921WMJ', 'normal', NULL, 0, 20, 28, NULL, NULL, 'Crushed Coffee', 'crushed-coffee-g9v3921wmj', 'KOr3TfMprd.png', '7peuPJmKA3.jpg', NULL, NULL, NULL, NULL, NULL, 150, 180, 'Crushed Coffee<br>', 250, 1, '<br>', 'Crushed Coffee<br>', 1, 88, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '2022-08-06 11:10:41', '2023-03-18 01:47:44', 0, NULL, NULL, NULL, 0, 0),
(15, 'djr4046DJk', 'normal', NULL, 0, 20, 29, NULL, NULL, 'Roasted Coffee', 'roasted-coffee-djr4046djk', 'zAVNrvcvuq.png', '8bITmF3aSr.jpg', NULL, NULL, NULL, NULL, NULL, 280, 300, 'Roasted Coffee&nbsp;<br>', 120, 1, '<br>', 'Roasted Coffee&nbsp;<br>', 1, 58, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '2022-08-06 11:12:13', '2023-03-18 01:47:44', 0, NULL, NULL, NULL, 0, 0),
(16, 'Kui1517LvM', 'normal', NULL, 0, 18, 26, NULL, NULL, 'Assam CTC Luxury Blend Tea 100 gm', 'assam-ctc-luxury-blend-tea-100-gm-kui1517lvm', 'c3Ge7oTwcD.png', 'dZTt53acFc.jpg', NULL, NULL, NULL, NULL, NULL, 80, 160, 'Assam CTC Luxury Blend Tea 100 gm<br>', 100, 1, '<br>', '<br>', 1, 92, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '2022-08-20 16:09:50', '2023-03-18 01:47:34', 0, NULL, NULL, NULL, 0, 0),
(17, 'QVF18772R9', 'normal', NULL, 0, 18, 26, NULL, NULL, 'Assam CTC Luxury Blend Tea 250 gm', 'assam-ctc-luxury-blend-tea-250-gm-qvf18772r9', 'rYKHCp77Lu.png', '7Z6Umve9lj.jpg', NULL, NULL, NULL, NULL, NULL, 200, 399.99, 'Assam CTC Luxury Blend Tea 250 gm<br>', 100, 1, '<br>', '<br>', 1, 74, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '2022-08-20 16:13:06', '2023-03-16 03:37:47', 0, NULL, NULL, NULL, 0, 0),
(18, 'XoW2003Blk', 'normal', NULL, 0, 18, 26, NULL, NULL, 'Assam CTC Luxury Blend Tea 500 gm', 'assam-ctc-luxury-blend-tea-500-gm-xow2003blk', 'Cn1hnhhaRD.png', '1USBU1kT1A.jpg', NULL, NULL, NULL, NULL, NULL, 400, 800, 'Assam CTC Luxury Blend Tea 250 gm<br>', 100, 1, '<br>', '<br>', 1, 81, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '2022-08-20 16:14:22', '2023-03-16 02:26:51', 0, NULL, NULL, NULL, 0, 0),
(19, 'anL2150Uv4', 'normal', NULL, 0, 18, 26, NULL, NULL, 'Assam CTC Luxury Blend Tea 1kg', 'assam-ctc-luxury-blend-tea-1kg-anl2150uv4', 'jfEryVPz2K.png', 'JbD0ScZflQ.jpg', NULL, NULL, NULL, NULL, NULL, 800, 1600, 'Assam CTC Luxury Blend Tea 1kg<br>', NULL, 1, '<br>', '<br>', 1, 80, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '2022-08-20 16:17:26', '2023-03-18 01:47:34', 0, NULL, NULL, NULL, 0, 0),
(20, 'Utd230101X', 'normal', NULL, 0, 18, 26, NULL, NULL, 'Assam CTC Premium Blend Tea 100 gm', 'assam-ctc-premium-blend-tea-100-gm-utd230101x', 'xswWv7NnG2.png', 'MKfF09V9JL.jpg', NULL, NULL, NULL, NULL, NULL, 60, 120, 'Assam CTC Premium Blend Tea 100 gm<br>', 100, 1, '<br>', '<br>', 1, 79, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '2022-08-20 16:20:00', '2023-03-18 01:47:34', 0, NULL, NULL, NULL, 0, 0),
(21, 'KJ32444lUn', 'normal', NULL, 0, 18, 26, NULL, NULL, 'Assam CTC Premium Blend Tea 250 gm', 'assam-ctc-premium-blend-tea-250-gm-kj32444lun', 'L4vTh4HKIo.png', 'fkyD1yLtPG.jpg', NULL, NULL, NULL, NULL, NULL, 150, 300, 'Assam CTC Premium Blend Tea 250 gm<br>', 100, 1, '<br>', '<br>', 1, 80, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '2022-08-20 16:21:47', '2023-03-16 03:01:28', 0, NULL, NULL, NULL, 0, 0),
(22, 'xIP2512ySp', 'normal', NULL, 0, 18, 26, NULL, NULL, 'Assam CTC Premium Blend Tea 500 gm', 'assam-ctc-premium-blend-tea-500-gm-xip2512ysp', '3s5VIVcTZP.png', 'JMFy5zJTbV.jpg', NULL, NULL, NULL, NULL, NULL, 300, 600, 'Assam CTC Premium Blend Tea 500 gm<br>', 100, 1, '<br>', '<br>', 1, 82, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '2022-08-20 16:22:27', '2023-03-14 19:51:35', 0, NULL, NULL, NULL, 0, 0),
(23, 'PiG2564ZAD', 'normal', NULL, 0, 18, 26, NULL, NULL, 'Assam CTC Premium Blend Tea 1kg', 'assam-ctc-premium-blend-tea-1kg-pig2564zad', 'kpf21MpvCp.png', 'uzpuHeW4y3.jpg', NULL, NULL, NULL, NULL, NULL, 600, 1200, 'Assam CTC Premium Blend Tea 1kg<br>', 100, 1, '<br>', '<br>', 1, 63, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '2022-08-20 16:23:25', '2023-03-18 01:47:34', 0, NULL, NULL, NULL, 0, 0),
(24, 'tgZ2639z4m', 'normal', NULL, 0, 18, 26, NULL, NULL, 'Assam CTC Gold Blend Tea 100 gm', 'assam-ctc-gold-blend-tea-100-gm-tgz2639z4m', '0LQ678JRGW.png', 'Oty833CPa3.jpg', NULL, NULL, NULL, NULL, NULL, 40, 80, 'Assam CTC Gold Blend Tea 100 gm<br>', 100, 1, '<br>', '<br>', 1, 60, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '2022-08-20 16:24:58', '2023-03-18 01:47:48', 0, NULL, NULL, NULL, 0, 0),
(25, 'wgq2702oiT', 'normal', NULL, 0, 18, 26, NULL, NULL, 'Assam CTC Gold Blend Tea 250 gm', 'assam-ctc-gold-blend-tea-250-gm-wgq2702oit', 'D7l4QYazIi.png', 'lVimAYkcEm.jpg', NULL, NULL, NULL, NULL, NULL, 100, 200, 'Assam CTC Gold Blend Tea 250 gm<br>', 100, 1, '<br>', '<br>', 1, 70, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '2022-08-20 16:26:24', '2023-03-18 01:47:47', 0, NULL, NULL, NULL, 0, 0),
(26, 'vPs2787uIZ', 'normal', NULL, 0, 18, 26, NULL, NULL, 'Assam CTC Gold Blend Tea 500 gm', 'assam-ctc-gold-blend-tea-500-gm-vps2787uiz', 'BI0Cae5jRM.png', 'Ef2xpuzoQh.jpg', NULL, NULL, NULL, NULL, NULL, 200, 400, 'Assam CTC Gold Blend Tea 500 gm<br>', 100, 1, '<br>', '<br>', 1, 69, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '2022-08-20 16:27:27', '2023-03-13 09:56:48', 0, NULL, NULL, NULL, 0, 0),
(27, 'FdF2853mps', 'normal', NULL, 0, 18, 26, NULL, NULL, 'Assam CTC Gold Blend Tea 1kg', 'assam-ctc-gold-blend-tea-1kg-fdf2853mps', 'sHWHN1x2wQ.png', 'p0IfQyCPfr.jpg', NULL, NULL, NULL, NULL, NULL, 400, 799.99, 'Assam CTC Gold Blend Tea 1kg<br>', 100, 1, '<br>', '<br>', 1, 69, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '2022-08-20 16:28:16', '2023-03-18 01:47:48', 0, NULL, NULL, NULL, 0, 0),
(28, 'fXG2901ztF', 'normal', NULL, 0, 18, 26, NULL, NULL, 'Assam CTC Silver Blend 100 gm', 'assam-ctc-silver-blend-100-gm-fxg2901ztf', 'TWzAzF228V.png', 'l3HiUzEjRw.jpg', NULL, NULL, NULL, NULL, NULL, 30, 59.99, 'Assam CTC Silver Blend 100 gm<br>', 100, 1, '<br>', '<br>', 1, 68, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '2022-08-20 16:29:48', '2023-03-18 01:47:47', 0, NULL, NULL, NULL, 0, 0),
(29, 'X8q3015yIJ', 'normal', NULL, 0, 18, 26, NULL, NULL, 'Assam CTC Silver Blend 250 gm', 'assam-ctc-silver-blend-250-gm-x8q3015yij', '8WGkFeFHXk.png', '1pvOrILqHM.jpg', NULL, NULL, NULL, NULL, NULL, 75, 150, 'Assam CTC Silver Blend 250 gm<br>', 100, 1, '<br>', '<br>', 1, 73, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '2022-08-20 16:31:40', '2023-03-18 01:47:47', 0, NULL, NULL, NULL, 0, 0),
(30, 'PBI3111TDK', 'normal', NULL, 0, 18, 26, NULL, NULL, 'Assam CTC Silver Blend 500 gm', 'assam-ctc-silver-blend-500-gm-pbi3111tdk', 'SF1IEoTbff.png', 'KiGEKRGfwo.jpg', NULL, NULL, NULL, NULL, NULL, 150, 300, 'Assam CTC Silver Blend 500 gm<br>', NULL, 1, '<br>', '<br>', 1, 63, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '2022-08-20 16:32:26', '2023-03-18 01:47:47', 0, NULL, NULL, NULL, 0, 0),
(31, 'MLy31486F4', 'normal', NULL, 0, 18, 26, NULL, NULL, 'Assam CTC Silver Blend 1kg', 'assam-ctc-silver-blend-1kg-mly31486f4', 'xD8lxEmDgL.png', 'gsKXuxOecL.jpg', NULL, NULL, NULL, NULL, NULL, 300, 600, 'Assam CTC Silver Blend 1kg<br>', 100, 1, '<br>', '<br>', 1, 72, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '2022-08-20 16:33:20', '2023-03-18 01:47:47', 0, NULL, NULL, NULL, 0, 0),
(32, 'nJO3336KHO', 'normal', NULL, 0, 18, 26, NULL, NULL, 'Assam Leaf Tea Premium 100 gm', 'assam-leaf-tea-premium-100-gm-njo3336kho', 'nXAkyN44sE.png', 'nqJt2L9Qbm.jpg', NULL, NULL, NULL, NULL, NULL, 80, 160, 'Assam Leaf Tea Premium 100 gm<br>', 100, 1, '<br>', '<br>', 1, 66, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '2022-08-20 16:36:49', '2023-03-18 01:47:47', 0, NULL, NULL, NULL, 0, 0),
(33, 'PCP3413RVy', 'normal', NULL, 0, 18, 26, NULL, NULL, 'Assam Leaf Tea Premium 250 gm', 'assam-leaf-tea-premium-250-gm-pcp3413rvy', 'TD9KJATeS3.png', '2wMrDmU9OL.jpg', NULL, NULL, NULL, NULL, NULL, 200, 400, 'Assam Leaf Tea Premium 250 gm<br>', 100, 1, '<br>', '<br>', 1, 50, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '2022-08-20 16:37:36', '2023-03-18 01:47:47', 0, NULL, NULL, NULL, 0, 0),
(34, 'LLH34630bA', 'normal', NULL, 0, 18, 26, NULL, NULL, 'Assam Leaf Tea Premium 500 gm', 'assam-leaf-tea-premium-500-gm-llh34630ba', 'M2pjVF3aa7.png', '20atonOM7d.jpg', NULL, NULL, NULL, NULL, NULL, 400, 800, 'Assam Leaf Tea Premium 500 gm<br>', 100, 1, '<br>', '<br>', 1, 70, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '2022-08-20 16:38:25', '2023-03-18 01:47:47', 0, NULL, NULL, NULL, 0, 0),
(35, 'S2q3508gml', 'normal', NULL, 0, 18, 26, NULL, NULL, 'Assam Leaf Tea Premium 1kg', 'assam-leaf-tea-premium-1kg-s2q3508gml', 'Xf6uxHuO68.png', 'ij0GW194dm.jpg', NULL, NULL, NULL, NULL, NULL, 800, 1600, 'Assam Leaf Tea Premium 1kg<br>', 100, 1, '<br>', '<br>', 1, 72, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '2022-08-20 16:39:05', '2023-03-18 01:47:47', 0, NULL, NULL, NULL, 0, 0),
(36, 'sp23554yio', 'normal', NULL, 0, 18, 26, NULL, NULL, 'Assam Leaf Tea Gold 100 gm', 'assam-leaf-tea-gold-100-gm-sp23554yio', 'boI7r4cs78.png', 'zChAbxosNI.jpg', NULL, NULL, NULL, NULL, NULL, 50, 100, 'Assam Leaf Tea Gold 100 gm<br>', 100, 1, '<br>', '<br>', 1, 57, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '2022-08-20 16:41:04', '2023-03-18 01:47:47', 0, NULL, NULL, NULL, 0, 0),
(37, 'b4C3666F2k', 'normal', NULL, 0, 18, 26, NULL, NULL, 'Assam Leaf Tea Gold 250 gm', 'assam-leaf-tea-gold-250-gm-b4c3666f2k', 'PsIFKoPjHU.png', 'irg8sVG7K0.jpg', NULL, NULL, NULL, NULL, NULL, 125, 250, 'Assam Leaf Tea Gold 250 gm<br>', 100, 1, '<br>', '<br>', 1, 69, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '2022-08-20 16:42:14', '2023-03-18 01:47:46', 0, NULL, NULL, NULL, 0, 0),
(38, 'RhX3738y6U', 'normal', NULL, 0, 18, 26, NULL, NULL, 'Assam Leaf Tea Gold 500 gm', 'assam-leaf-tea-gold-500-gm-rhx3738y6u', 'VCzVRGQDM4.png', 'JuHG2fxVBj.jpg', NULL, NULL, NULL, NULL, NULL, 250, 500, 'Assam Leaf Tea Gold 500 gm<br>', 100, 1, '<br>', '<br>', 1, 53, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '2022-08-20 16:42:55', '2023-03-18 01:47:46', 0, NULL, NULL, NULL, 0, 0),
(39, 'E2Z3777sIf', 'normal', NULL, 0, 18, 26, NULL, NULL, 'Assam Leaf Tea Gold 1kg', 'assam-leaf-tea-gold-1kg-e2z3777sif', 'K9MzAIWVz1.png', 'JuftQuffZu.jpg', NULL, NULL, NULL, NULL, NULL, 500, 1000, 'Assam Leaf Tea Gold 1kg<br>', 100, 1, '<br>', '<br>', 1, 64, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '2022-08-20 16:43:36', '2023-03-18 01:47:46', 0, NULL, NULL, NULL, 0, 0),
(40, '5d63844m5i', 'normal', NULL, 0, 18, 30, NULL, NULL, 'Green Tea Luxury 100 gm', 'green-tea-luxury-100-gm-5d63844m5i', 'alta3MdIge.png', 'wwaShoLrJw.jpg', NULL, NULL, NULL, NULL, NULL, 150, 300, 'Green Tea Luxury 100 gm<br>', 100, 1, '<br>', '<br>', 1, 69, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '2022-08-20 16:46:11', '2023-03-18 01:47:46', 0, NULL, NULL, NULL, 0, 0),
(41, 'RVE404810o', 'normal', NULL, 0, 18, 30, NULL, NULL, 'Green Tea Luxury 250 gm', 'green-tea-luxury-250-gm-rve404810o', 'RN0j3n9uPb.png', 'Yu6ySCqeY3.jpg', NULL, NULL, NULL, NULL, NULL, 375, 750, 'Green Tea Luxury 250 gm<br>', 100, 1, '<br>', '<br>', 1, 59, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '2022-08-20 16:48:44', '2023-03-18 01:47:46', 0, NULL, NULL, NULL, 0, 0),
(42, 'pWv4128pk2', 'normal', NULL, 0, 18, 30, NULL, NULL, 'Green Tea Luxury 500 gm', 'green-tea-luxury-500-gm-pwv4128pk2', 'yOXsYJceeV.png', 'HQu5Gsz9Qa.jpg', NULL, NULL, NULL, NULL, NULL, 750, 1500, 'Green Tea Luxury 500 gm<br>', 100, 1, '<br>', '<br>', 1, 61, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '2022-08-20 16:49:33', '2023-03-18 01:47:46', 0, NULL, NULL, NULL, 0, 0),
(43, 'aGp4176ijt', 'normal', NULL, 0, 18, 30, NULL, NULL, 'Green Tea Luxury 1kg', 'green-tea-luxury-1kg-agp4176ijt', 'fTXtrRdOJY.png', 'clp4CM1ngc.jpg', NULL, NULL, NULL, NULL, NULL, 1500, 3000, 'Green Tea Luxury 1kg<br>', 100, 1, '<br>', '<br>', 1, 77, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '2022-08-20 16:50:47', '2023-03-18 01:47:46', 0, NULL, NULL, NULL, 0, 0),
(44, 'sq542609BP', 'normal', NULL, 0, 18, 30, NULL, NULL, 'Green Tea Premium 100 gm', 'green-tea-premium-100-gm-sq542609bp', 'WM3gDufmBq.png', 'ZNArTk3qzc.jpg', NULL, NULL, NULL, NULL, NULL, 100, 200, 'Green Tea Premium 100 gm<br>', 100, 1, '<br>', '<br>', 1, 59, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '2022-08-20 16:51:54', '2023-03-18 01:47:46', 0, NULL, NULL, NULL, 0, 0),
(45, 'WZ54317I9M', 'normal', NULL, 0, 18, 30, NULL, NULL, 'Green Tea Premium 250 gm', 'green-tea-premium-250-gm-wz54317i9m', 'l3vQ5EYKnV.png', 'gEPX5jdl19.jpg', NULL, NULL, NULL, NULL, NULL, 250, 500, 'Green Tea Premium 250 gm<br>', 100, 1, '<br>', '<br>', 1, 68, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '2022-08-20 16:53:10', '2023-03-18 01:47:46', 0, NULL, NULL, NULL, 0, 0),
(46, 'T4I4393dSV', 'normal', NULL, 0, 18, 30, NULL, NULL, 'Green Tea Premium 500 gm', 'green-tea-premium-500-gm-t4i4393dsv', 'cuOsjK7gLG.png', 'r5Q9kLNc8R.jpg', NULL, NULL, NULL, NULL, NULL, 500, 1000, 'Green Tea Premium 500 gm<br>', 100, 1, '<br>', '<br>', 1, 64, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '2022-08-20 16:53:53', '2023-03-18 01:47:46', 0, NULL, NULL, NULL, 0, 0),
(47, 'LtK4436uoi', 'normal', NULL, 0, 18, 30, NULL, NULL, 'Green Tea Premium 1kg', 'green-tea-premium-1kg-ltk4436uoi', 'DAtGzMQfey.png', '6JcncxLvMx.jpg', NULL, NULL, NULL, NULL, NULL, 1000, 2000, 'Green Tea Premium 1kg<br>', 100, 1, '<br>', '<br>', 1, 81, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '2022-08-20 16:54:39', '2023-03-18 01:47:46', 0, NULL, NULL, NULL, 0, 0),
(48, '4Tr4483QUK', 'normal', NULL, 0, 18, 30, NULL, NULL, 'Green Tea Gold 100 gm', 'green-tea-gold-100-gm-4tr4483quk', 'Q8y3dHlWS5.png', 'JWD41XLqhk.jpg', NULL, NULL, NULL, NULL, NULL, 80, 160, 'Green Tea Gold 100 gm<br>', 100, 1, '<br>', '<br>', 1, 55, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '2022-08-20 16:56:07', '2023-03-18 01:47:46', 0, NULL, NULL, NULL, 0, 0),
(49, 'Lp9456984M', 'normal', NULL, 0, 18, 30, NULL, NULL, 'Green Tea Gold 250 gm', 'green-tea-gold-250-gm-lp9456984m', 'IOGWFnGHLC.png', 'Be55BqnTjz.jpg', NULL, NULL, NULL, NULL, NULL, 200, 400, 'Green Tea Gold 250 gm<br>', 100, 1, '<br>', '<br>', 1, 66, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '2022-08-20 16:56:54', '2023-03-18 01:47:45', 0, NULL, NULL, NULL, 0, 0),
(50, '9b04617L3J', 'normal', NULL, 0, 18, 30, NULL, NULL, 'Green Tea Gold 500 gm', 'green-tea-gold-500-gm-9b04617l3j', 'EmRcRB0t6C.png', 'KuWezSk6Uv.jpg', NULL, NULL, NULL, NULL, NULL, 400, 800, 'Green Tea Gold 500 gm<br>', 100, 1, '<br>', '<br>', 1, 66, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '2022-08-20 16:57:49', '2023-03-18 01:47:45', 0, NULL, NULL, NULL, 0, 0),
(51, 'jXd4670Otp', 'normal', NULL, 0, 18, 30, NULL, NULL, 'Green Tea Gold 1kg', 'green-tea-gold-1kg-jxd4670otp', '76gwaPvirr.png', 'g4ft11hPya.jpg', NULL, NULL, NULL, NULL, NULL, 800, 1600, 'Green Tea Gold 1kg<br>', 100, 1, '<br>', '<br>', 1, 86, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '2022-08-20 16:58:27', '2023-03-18 01:47:45', 0, NULL, NULL, NULL, 0, 0),
(52, 'bQD4728A6T', 'normal', NULL, 0, 18, 27, NULL, NULL, 'Darjeeling Fanning Tea 100 gm', 'darjeeling-fanning-tea-100-gm-bqd4728a6t', 'rInEfL7FTk.png', '26M7MHtvAQ.jpg', NULL, NULL, NULL, NULL, NULL, 60, 120, 'Darjeeling Fanning Tea 100 gm<br>', 100, 1, '<br>', '<br>', 1, 62, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '2022-08-20 16:59:42', '2023-03-18 01:47:45', 0, NULL, NULL, NULL, 0, 0),
(53, 'Ngg4785m3x', 'normal', NULL, 0, 18, 27, NULL, NULL, 'Darjeeling Fanning Tea 250 gm', 'darjeeling-fanning-tea-250-gm-ngg4785m3x', '8QWLwCqeRh.png', 'jhIinzzKXy.jpg', NULL, NULL, NULL, NULL, NULL, 150, 300, 'Darjeeling Fanning Tea 250 gm<br>', 100, 1, '<br>', '<br>', 1, 74, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '2022-08-20 17:00:28', '2023-03-18 01:47:45', 0, NULL, NULL, NULL, 0, 0),
(54, 'QR04830cA1', 'normal', NULL, 0, 18, 27, NULL, NULL, 'Darjeeling Fanning Tea 500 gm', 'darjeeling-fanning-tea-500-gm-qr04830ca1', 'rSjjMDjiUa.png', 'WGN2HIC9CT.jpg', NULL, NULL, NULL, NULL, NULL, 300, 600, 'Darjeeling Fanning Tea 500 gm<br>', 100, 1, '<br>', '<br>', 1, 75, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '2022-08-20 17:01:11', '2023-03-18 01:47:45', 0, NULL, NULL, NULL, 0, 0),
(55, 'ksM4876s1q', 'normal', NULL, 0, 18, 27, NULL, NULL, 'Darjeeling Fanning Tea 1kg', 'darjeeling-fanning-tea-1kg-ksm4876s1q', 'Lf7zwzqjK5.png', 'ttI1jINQAU.jpg', NULL, NULL, NULL, NULL, NULL, 600, 1200, 'Darjeeling Fanning Tea 1kg<br>', 100, 1, '<br>', '<br>', 1, 71, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '2022-08-20 17:01:59', '2023-03-10 16:02:38', 0, NULL, NULL, NULL, 0, 0),
(56, 'Svv4950kEK', 'normal', NULL, 0, 18, 27, NULL, NULL, 'Darjeeling Leaf Tea 100 gm', 'darjeeling-leaf-tea-100-gm-svv4950kek', 'Jiur7Mv6qA.png', 'z8uRqZNukB.jpg', NULL, NULL, NULL, NULL, NULL, 150, 300, 'Darjeeling Leaf Tea 100 gm<br>', 100, 1, '<br>', '<br>', 1, 72, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '2022-08-20 17:03:55', '2023-03-18 01:47:45', 0, NULL, NULL, NULL, 0, 0),
(57, '0ZQ5038Wuc', 'normal', NULL, 0, 18, 27, NULL, NULL, 'Darjeeling Leaf Tea 250 gm', 'darjeeling-leaf-tea-250-gm-0zq5038wuc', '0kiMH6te2N.png', 'AnWRwNsFM7.jpg', NULL, NULL, NULL, NULL, NULL, 375, 750, 'Darjeeling Leaf Tea 250 gm<br>', 100, 1, '<br>', '<br>', 1, 77, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '2022-08-20 17:05:05', '2023-03-18 01:47:45', 0, NULL, NULL, NULL, 0, 0),
(58, 'ggS5107NoO', 'normal', NULL, 0, 18, 27, NULL, NULL, 'Darjeeling Leaf Tea 500 gm', 'darjeeling-leaf-tea-500-gm-ggs5107noo', 'rDqlUOsq28.png', 'uotEjX8NuU.jpg', NULL, NULL, NULL, NULL, NULL, 750, 1500, 'Darjeeling Leaf Tea 500 gm<br>', 100, 1, '<br>', '<br>', 1, 83, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '2022-08-20 17:05:59', '2023-03-18 01:47:45', 0, NULL, NULL, NULL, 0, 0),
(59, 'bef5167F5k', 'normal', NULL, 0, 18, 27, NULL, NULL, 'Darjeeling Leaf Tea 1kg', 'darjeeling-leaf-tea-1kg-bef5167f5k', 'vlYhSWxpa4.png', 'HlIdDR26zy.jpg', NULL, NULL, NULL, NULL, NULL, 1500, 3000, 'Darjeeling Leaf Tea 1kg<br>', 100, 1, '<br>', '<br>', 1, 80, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '2022-08-20 17:06:43', '2023-03-18 01:47:45', 0, NULL, NULL, NULL, 0, 0),
(60, 'gwy5340dKw', 'normal', NULL, 0, 18, NULL, NULL, NULL, 'Membership Only Astha Tea', 'membership-only-astha-tea-gwy5340dkw', 'FqX69Ao6sw.png', 'lTpMQAUfuR.jpg', NULL, NULL, NULL, NULL, NULL, 30, 60, 'Membership Only Astha Tea<br>', 99, 1, '<br>', '<br>', 1, 77, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '2022-08-20 17:09:47', '2023-03-18 01:47:45', 0, NULL, NULL, NULL, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `product_clicks`
--

CREATE TABLE `product_clicks` (
  `id` int(191) NOT NULL,
  `product_id` int(191) NOT NULL,
  `date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product_clicks`
--

INSERT INTO `product_clicks` (`id`, `product_id`, `date`) VALUES
(992, 184, '2021-05-24'),
(993, 184, '2021-05-24'),
(994, 184, '2021-05-24'),
(995, 184, '2021-05-24'),
(998, 184, '2021-05-24'),
(999, 184, '2021-05-24'),
(1004, 184, '2021-05-24'),
(1005, 184, '2021-05-24'),
(1006, 184, '2021-05-24'),
(1007, 184, '2021-05-24'),
(1008, 184, '2021-05-24'),
(1009, 184, '2021-05-24'),
(1010, 184, '2021-05-24'),
(1011, 184, '2021-05-24'),
(1051, 184, '2022-02-14'),
(1055, 185, '2022-03-19'),
(1056, 185, '2022-03-19'),
(1057, 185, '2022-03-19'),
(1058, 185, '2022-03-19'),
(1059, 185, '2022-03-19'),
(1060, 185, '2022-03-19'),
(1061, 185, '2022-03-19'),
(1062, 185, '2022-03-19'),
(1067, 185, '2022-03-19'),
(1068, 185, '2022-03-28'),
(1069, 185, '2022-03-28'),
(1072, 185, '2022-05-07'),
(1076, 185, '2022-05-09'),
(1082, 185, '2022-05-10'),
(1143, 185, '2022-05-10'),
(1144, 185, '2022-05-10'),
(1145, 185, '2022-05-10'),
(1146, 185, '2022-05-10'),
(1147, 185, '2022-05-10'),
(1148, 185, '2022-05-10'),
(1149, 93, '2022-05-10'),
(1150, 93, '2022-05-10'),
(1151, 93, '2022-05-10'),
(1152, 93, '2022-05-10'),
(1153, 93, '2022-05-10'),
(1154, 93, '2022-05-10'),
(1155, 93, '2022-05-10'),
(1156, 93, '2022-05-10'),
(1157, 93, '2022-05-10'),
(1158, 93, '2022-05-10'),
(1159, 93, '2022-05-10'),
(1160, 93, '2022-05-10'),
(1161, 93, '2022-05-10'),
(1162, 93, '2022-05-10'),
(1163, 93, '2022-05-10'),
(1164, 93, '2022-05-10'),
(1165, 93, '2022-05-10'),
(1166, 93, '2022-05-10'),
(1167, 93, '2022-05-10'),
(1168, 93, '2022-05-10'),
(1169, 93, '2022-05-10'),
(1170, 93, '2022-05-10'),
(1171, 93, '2022-05-10'),
(1172, 93, '2022-05-10'),
(1173, 93, '2022-05-10'),
(1174, 93, '2022-05-10'),
(1175, 93, '2022-05-10'),
(1176, 93, '2022-05-10'),
(1177, 93, '2022-05-10'),
(1178, 93, '2022-05-10'),
(1179, 93, '2022-05-10'),
(1180, 93, '2022-05-10'),
(1181, 93, '2022-05-10'),
(1182, 93, '2022-05-10'),
(1183, 93, '2022-05-10'),
(1184, 93, '2022-05-10'),
(1185, 93, '2022-05-10'),
(1186, 93, '2022-05-10'),
(1187, 93, '2022-05-10'),
(1188, 93, '2022-05-10'),
(1189, 93, '2022-05-10'),
(1190, 93, '2022-05-10'),
(1191, 93, '2022-05-10'),
(1192, 93, '2022-05-10'),
(1193, 93, '2022-05-10'),
(1194, 93, '2022-05-10'),
(1195, 93, '2022-05-10'),
(1223, 185, '2022-05-11'),
(1316, 185, '2022-05-20'),
(1317, 185, '2022-05-20'),
(1318, 185, '2022-05-20'),
(1319, 185, '2022-05-20'),
(1320, 184, '2022-05-20'),
(1321, 185, '2022-05-23'),
(1322, 184, '2022-05-24'),
(1323, 185, '2022-05-26'),
(1324, 6, '2022-08-06'),
(1325, 8, '2022-08-06'),
(1326, 12, '2022-08-06'),
(1327, 11, '2022-08-06'),
(1328, 11, '2022-08-06'),
(1329, 5, '2022-08-06'),
(1330, 14, '2022-08-06'),
(1331, 13, '2022-08-06'),
(1332, 3, '2022-08-06'),
(1333, 6, '2022-08-06'),
(1334, 7, '2022-08-06'),
(1335, 9, '2022-08-06'),
(1336, 15, '2022-08-06'),
(1337, 4, '2022-08-06'),
(1338, 10, '2022-08-06'),
(1339, 2, '2022-08-06'),
(1340, 8, '2022-08-06'),
(1341, 12, '2022-08-07'),
(1342, 11, '2022-08-07'),
(1343, 11, '2022-08-07'),
(1344, 5, '2022-08-07'),
(1345, 14, '2022-08-07'),
(1346, 13, '2022-08-07'),
(1347, 13, '2022-08-07'),
(1348, 3, '2022-08-07'),
(1349, 6, '2022-08-07'),
(1350, 7, '2022-08-07'),
(1351, 9, '2022-08-07'),
(1352, 9, '2022-08-07'),
(1353, 15, '2022-08-07'),
(1354, 4, '2022-08-07'),
(1355, 4, '2022-08-07'),
(1356, 10, '2022-08-07'),
(1357, 10, '2022-08-07'),
(1358, 2, '2022-08-07'),
(1359, 8, '2022-08-07'),
(1360, 5, '2022-08-09'),
(1361, 10, '2022-08-09'),
(1362, 3, '2022-08-09'),
(1363, 2, '2022-08-09'),
(1364, 3, '2022-08-09'),
(1365, 12, '2022-08-09'),
(1366, 3, '2022-08-09'),
(1367, 11, '2022-08-09'),
(1368, 12, '2022-08-09'),
(1369, 6, '2022-08-09'),
(1370, 2, '2022-08-09'),
(1371, 7, '2022-08-09'),
(1372, 10, '2022-08-09'),
(1373, 9, '2022-08-09'),
(1374, 4, '2022-08-09'),
(1375, 8, '2022-08-09'),
(1376, 14, '2022-08-09'),
(1377, 5, '2022-08-09'),
(1378, 8, '2022-08-09'),
(1379, 4, '2022-08-09'),
(1380, 5, '2022-08-10'),
(1381, 8, '2022-08-10'),
(1382, 4, '2022-08-10'),
(1383, 14, '2022-08-11'),
(1384, 10, '2022-08-11'),
(1385, 13, '2022-08-11'),
(1386, 12, '2022-08-11'),
(1387, 15, '2022-08-11'),
(1388, 12, '2022-08-11'),
(1389, 15, '2022-08-11'),
(1390, 4, '2022-08-12'),
(1391, 8, '2022-08-12'),
(1392, 9, '2022-08-12'),
(1393, 5, '2022-08-12'),
(1394, 6, '2022-08-12'),
(1395, 3, '2022-08-12'),
(1396, 13, '2022-08-12'),
(1397, 2, '2022-08-12'),
(1398, 12, '2022-08-12'),
(1399, 7, '2022-08-12'),
(1400, 14, '2022-08-12'),
(1401, 11, '2022-08-12'),
(1402, 15, '2022-08-12'),
(1403, 10, '2022-08-12'),
(1404, 3, '2022-08-12'),
(1405, 3, '2022-08-12'),
(1406, 15, '2022-08-12'),
(1407, 14, '2022-08-12'),
(1408, 10, '2022-08-12'),
(1409, 6, '2022-08-12'),
(1410, 6, '2022-08-13'),
(1411, 6, '2022-08-13'),
(1412, 8, '2022-08-13'),
(1413, 7, '2022-08-14'),
(1414, 4, '2022-08-14'),
(1415, 9, '2022-08-14'),
(1416, 3, '2022-08-14'),
(1417, 11, '2022-08-14'),
(1418, 10, '2022-08-14'),
(1419, 12, '2022-08-14'),
(1420, 13, '2022-08-14'),
(1421, 2, '2022-08-14'),
(1422, 9, '2022-08-14'),
(1423, 10, '2022-08-14'),
(1424, 14, '2022-08-14'),
(1425, 12, '2022-08-14'),
(1426, 7, '2022-08-14'),
(1427, 4, '2022-08-14'),
(1428, 6, '2022-08-14'),
(1429, 13, '2022-08-14'),
(1430, 11, '2022-08-15'),
(1431, 3, '2022-08-15'),
(1432, 8, '2022-08-15'),
(1433, 2, '2022-08-15'),
(1434, 9, '2022-08-15'),
(1435, 10, '2022-08-15'),
(1436, 14, '2022-08-15'),
(1437, 11, '2022-08-15'),
(1438, 2, '2022-08-15'),
(1439, 10, '2022-08-15'),
(1440, 12, '2022-08-16'),
(1441, 3, '2022-08-16'),
(1442, 10, '2022-08-16'),
(1443, 11, '2022-08-16'),
(1444, 7, '2022-08-17'),
(1445, 2, '2022-08-17'),
(1446, 12, '2022-08-17'),
(1447, 6, '2022-08-17'),
(1448, 10, '2022-08-17'),
(1449, 7, '2022-08-17'),
(1450, 9, '2022-08-17'),
(1451, 12, '2022-08-17'),
(1452, 10, '2022-08-17'),
(1453, 3, '2022-08-17'),
(1454, 7, '2022-08-17'),
(1455, 11, '2022-08-17'),
(1456, 12, '2022-08-17'),
(1457, 2, '2022-08-17'),
(1458, 10, '2022-08-17'),
(1459, 6, '2022-08-17'),
(1460, 7, '2022-08-17'),
(1461, 10, '2022-08-18'),
(1462, 12, '2022-08-18'),
(1463, 9, '2022-08-18'),
(1464, 7, '2022-08-18'),
(1465, 14, '2022-08-18'),
(1466, 3, '2022-08-18'),
(1467, 6, '2022-08-18'),
(1468, 10, '2022-08-18'),
(1469, 12, '2022-08-18'),
(1470, 2, '2022-08-18'),
(1471, 9, '2022-08-18'),
(1472, 7, '2022-08-18'),
(1473, 11, '2022-08-18'),
(1474, 10, '2022-08-18'),
(1475, 12, '2022-08-18'),
(1476, 7, '2022-08-18'),
(1477, 14, '2022-08-18'),
(1478, 12, '2022-08-18'),
(1479, 10, '2022-08-18'),
(1480, 7, '2022-08-18'),
(1481, 3, '2022-08-18'),
(1482, 6, '2022-08-18'),
(1483, 9, '2022-08-18'),
(1484, 9, '2022-08-18'),
(1485, 2, '2022-08-18'),
(1486, 12, '2022-08-19'),
(1487, 10, '2022-08-19'),
(1488, 11, '2022-08-19'),
(1489, 7, '2022-08-19'),
(1490, 12, '2022-08-19'),
(1491, 10, '2022-08-19'),
(1492, 6, '2022-08-19'),
(1493, 7, '2022-08-19'),
(1494, 14, '2022-08-19'),
(1495, 13, '2022-08-19'),
(1496, 13, '2022-08-19'),
(1497, 8, '2022-08-19'),
(1498, 3, '2022-08-19'),
(1499, 2, '2022-08-19'),
(1500, 14, '2022-08-19'),
(1501, 2, '2022-08-19'),
(1502, 2, '2022-08-19'),
(1503, 2, '2022-08-19'),
(1504, 2, '2022-08-19'),
(1505, 2, '2022-08-19'),
(1506, 2, '2022-08-19'),
(1507, 2, '2022-08-19'),
(1508, 2, '2022-08-19'),
(1509, 8, '2022-08-19'),
(1510, 8, '2022-08-19'),
(1511, 2, '2022-08-19'),
(1512, 8, '2022-08-19'),
(1513, 2, '2022-08-19'),
(1514, 2, '2022-08-19'),
(1515, 11, '2022-08-19'),
(1516, 8, '2022-08-19'),
(1517, 8, '2022-08-19'),
(1518, 8, '2022-08-19'),
(1519, 11, '2022-08-19'),
(1520, 7, '2022-08-19'),
(1521, 7, '2022-08-19'),
(1522, 6, '2022-08-19'),
(1523, 7, '2022-08-19'),
(1524, 7, '2022-08-19'),
(1525, 3, '2022-08-19'),
(1526, 3, '2022-08-19'),
(1527, 5, '2022-08-19'),
(1528, 2, '2022-08-19'),
(1529, 2, '2022-08-19'),
(1530, 8, '2022-08-19'),
(1531, 3, '2022-08-19'),
(1532, 2, '2022-08-19'),
(1533, 10, '2022-08-19'),
(1534, 3, '2022-08-19'),
(1535, 5, '2022-08-19'),
(1536, 3, '2022-08-19'),
(1537, 3, '2022-08-19'),
(1538, 3, '2022-08-19'),
(1539, 3, '2022-08-19'),
(1540, 3, '2022-08-19'),
(1541, 3, '2022-08-19'),
(1542, 3, '2022-08-19'),
(1543, 3, '2022-08-19'),
(1544, 3, '2022-08-19'),
(1545, 3, '2022-08-19'),
(1546, 3, '2022-08-19'),
(1547, 3, '2022-08-19'),
(1548, 3, '2022-08-19'),
(1549, 5, '2022-08-19'),
(1550, 3, '2022-08-19'),
(1551, 8, '2022-08-19'),
(1552, 3, '2022-08-19'),
(1553, 5, '2022-08-19'),
(1554, 5, '2022-08-19'),
(1555, 5, '2022-08-19'),
(1556, 5, '2022-08-19'),
(1557, 5, '2022-08-19'),
(1558, 5, '2022-08-19'),
(1559, 5, '2022-08-19'),
(1560, 5, '2022-08-19'),
(1561, 5, '2022-08-19'),
(1562, 5, '2022-08-19'),
(1563, 5, '2022-08-19'),
(1564, 5, '2022-08-19'),
(1565, 5, '2022-08-19'),
(1566, 5, '2022-08-19'),
(1567, 3, '2022-08-19'),
(1568, 3, '2022-08-19'),
(1569, 5, '2022-08-19'),
(1570, 5, '2022-08-19'),
(1571, 5, '2022-08-19'),
(1572, 5, '2022-08-19'),
(1573, 5, '2022-08-19'),
(1574, 5, '2022-08-19'),
(1575, 5, '2022-08-19'),
(1576, 5, '2022-08-19'),
(1577, 15, '2022-08-19'),
(1578, 15, '2022-08-19'),
(1579, 15, '2022-08-19'),
(1580, 5, '2022-08-19'),
(1581, 5, '2022-08-19'),
(1582, 5, '2022-08-19'),
(1583, 5, '2022-08-19'),
(1584, 5, '2022-08-19'),
(1585, 5, '2022-08-19'),
(1586, 5, '2022-08-19'),
(1587, 5, '2022-08-19'),
(1588, 5, '2022-08-19'),
(1589, 5, '2022-08-19'),
(1590, 5, '2022-08-19'),
(1591, 5, '2022-08-19'),
(1592, 5, '2022-08-19'),
(1593, 5, '2022-08-19'),
(1594, 5, '2022-08-19'),
(1595, 5, '2022-08-19'),
(1596, 5, '2022-08-19'),
(1597, 5, '2022-08-19'),
(1598, 5, '2022-08-19'),
(1599, 5, '2022-08-19'),
(1600, 5, '2022-08-19'),
(1601, 5, '2022-08-19'),
(1602, 5, '2022-08-19'),
(1603, 5, '2022-08-19'),
(1604, 9, '2022-08-19'),
(1605, 2, '2022-08-19'),
(1606, 12, '2022-08-19'),
(1607, 10, '2022-08-19'),
(1608, 7, '2022-08-19'),
(1609, 2, '2022-08-19'),
(1610, 11, '2022-08-19'),
(1611, 12, '2022-08-19'),
(1612, 10, '2022-08-19'),
(1613, 7, '2022-08-19'),
(1614, 14, '2022-08-20'),
(1615, 3, '2022-08-20'),
(1616, 10, '2022-08-20'),
(1617, 12, '2022-08-20'),
(1618, 6, '2022-08-20'),
(1619, 9, '2022-08-20'),
(1620, 2, '2022-08-20'),
(1621, 7, '2022-08-20'),
(1622, 11, '2022-08-20'),
(1623, 10, '2022-08-20'),
(1624, 12, '2022-08-20'),
(1625, 7, '2022-08-20'),
(1626, 16, '2022-08-20'),
(1627, 20, '2022-08-20'),
(1628, 58, '2022-08-20'),
(1629, 47, '2022-08-20'),
(1630, 47, '2022-08-20'),
(1631, 47, '2022-08-20'),
(1632, 13, '2022-08-20'),
(1633, 18, '2022-08-20'),
(1634, 57, '2022-08-20'),
(1635, 57, '2022-08-20'),
(1636, 14, '2022-08-20'),
(1637, 10, '2022-08-20'),
(1638, 12, '2022-08-20'),
(1639, 3, '2022-08-20'),
(1640, 7, '2022-08-20'),
(1641, 6, '2022-08-20'),
(1642, 9, '2022-08-20'),
(1643, 2, '2022-08-20'),
(1644, 10, '2022-08-21'),
(1645, 12, '2022-08-21'),
(1646, 12, '2022-08-21'),
(1647, 11, '2022-08-21'),
(1648, 7, '2022-08-21'),
(1649, 10, '2022-08-21'),
(1650, 12, '2022-08-21'),
(1651, 7, '2022-08-21'),
(1652, 14, '2022-08-21'),
(1653, 3, '2022-08-21'),
(1654, 6, '2022-08-21'),
(1655, 9, '2022-08-21'),
(1656, 10, '2022-08-21'),
(1657, 2, '2022-08-21'),
(1658, 12, '2022-08-21'),
(1659, 7, '2022-08-21'),
(1660, 11, '2022-08-21'),
(1661, 10, '2022-08-21'),
(1662, 12, '2022-08-21'),
(1663, 7, '2022-08-21'),
(1664, 14, '2022-08-22'),
(1665, 10, '2022-08-22'),
(1666, 3, '2022-08-22'),
(1667, 12, '2022-08-22'),
(1668, 6, '2022-08-22'),
(1669, 9, '2022-08-22'),
(1670, 2, '2022-08-22'),
(1671, 7, '2022-08-22'),
(1672, 7, '2022-08-22'),
(1673, 5, '2022-08-22'),
(1674, 5, '2022-08-22'),
(1675, 11, '2022-08-22'),
(1676, 10, '2022-08-22'),
(1677, 12, '2022-08-22'),
(1678, 7, '2022-08-22'),
(1679, 10, '2022-08-22'),
(1680, 14, '2022-08-22'),
(1681, 12, '2022-08-22'),
(1682, 3, '2022-08-22'),
(1683, 7, '2022-08-22'),
(1684, 6, '2022-08-22'),
(1685, 9, '2022-08-22'),
(1686, 2, '2022-08-22'),
(1687, 10, '2022-08-22'),
(1688, 12, '2022-08-22'),
(1689, 11, '2022-08-22'),
(1690, 7, '2022-08-23'),
(1691, 24, '2022-08-23'),
(1692, 24, '2022-08-23'),
(1693, 25, '2022-08-23'),
(1694, 26, '2022-08-23'),
(1695, 16, '2022-08-23'),
(1696, 16, '2022-08-23'),
(1697, 19, '2022-08-23'),
(1698, 17, '2022-08-23'),
(1699, 17, '2022-08-23'),
(1700, 18, '2022-08-23'),
(1701, 18, '2022-08-23'),
(1702, 20, '2022-08-23'),
(1703, 20, '2022-08-23'),
(1704, 23, '2022-08-23'),
(1705, 21, '2022-08-23'),
(1706, 21, '2022-08-23'),
(1707, 22, '2022-08-23'),
(1708, 28, '2022-08-23'),
(1709, 28, '2022-08-23'),
(1710, 33, '2022-08-23'),
(1711, 34, '2022-08-23'),
(1712, 34, '2022-08-23'),
(1713, 53, '2022-08-23'),
(1714, 53, '2022-08-23'),
(1715, 10, '2022-08-23'),
(1716, 54, '2022-08-23'),
(1717, 54, '2022-08-23'),
(1718, 24, '2022-08-23'),
(1719, 24, '2022-08-23'),
(1720, 25, '2022-08-23'),
(1721, 25, '2022-08-23'),
(1722, 12, '2022-08-23'),
(1723, 26, '2022-08-23'),
(1724, 26, '2022-08-23'),
(1725, 16, '2022-08-23'),
(1726, 27, '2022-08-23'),
(1727, 19, '2022-08-23'),
(1728, 19, '2022-08-23'),
(1729, 17, '2022-08-23'),
(1730, 17, '2022-08-23'),
(1731, 18, '2022-08-23'),
(1732, 20, '2022-08-23'),
(1733, 7, '2022-08-23'),
(1734, 23, '2022-08-23'),
(1735, 23, '2022-08-23'),
(1736, 14, '2022-08-23'),
(1737, 21, '2022-08-23'),
(1738, 21, '2022-08-23'),
(1739, 22, '2022-08-23'),
(1740, 28, '2022-08-23'),
(1741, 31, '2022-08-23'),
(1742, 29, '2022-08-23'),
(1743, 30, '2022-08-23'),
(1744, 30, '2022-08-23'),
(1745, 36, '2022-08-23'),
(1746, 36, '2022-08-23'),
(1747, 3, '2022-08-23'),
(1748, 37, '2022-08-23'),
(1749, 37, '2022-08-23'),
(1750, 38, '2022-08-23'),
(1751, 38, '2022-08-23'),
(1752, 6, '2022-08-23'),
(1753, 32, '2022-08-23'),
(1754, 32, '2022-08-23'),
(1755, 35, '2022-08-23'),
(1756, 35, '2022-08-23'),
(1757, 33, '2022-08-23'),
(1758, 34, '2022-08-23'),
(1759, 34, '2022-08-23'),
(1760, 10, '2022-08-23'),
(1761, 9, '2022-08-23'),
(1762, 2, '2022-08-23'),
(1763, 52, '2022-08-23'),
(1764, 52, '2022-08-23'),
(1765, 12, '2022-08-23'),
(1766, 13, '2022-08-23'),
(1767, 13, '2022-08-23'),
(1768, 12, '2022-08-23'),
(1769, 27, '2022-08-23'),
(1770, 27, '2022-08-23'),
(1771, 29, '2022-08-23'),
(1772, 30, '2022-08-23'),
(1773, 32, '2022-08-23'),
(1774, 52, '2022-08-23'),
(1775, 39, '2022-08-23'),
(1776, 55, '2022-08-23'),
(1777, 53, '2022-08-23'),
(1778, 54, '2022-08-23'),
(1779, 54, '2022-08-23'),
(1780, 7, '2022-08-23'),
(1781, 56, '2022-08-23'),
(1782, 59, '2022-08-23'),
(1783, 59, '2022-08-23'),
(1784, 57, '2022-08-23'),
(1785, 58, '2022-08-23'),
(1786, 40, '2022-08-23'),
(1787, 11, '2022-08-23'),
(1788, 31, '2022-08-23'),
(1789, 31, '2022-08-23'),
(1790, 36, '2022-08-23'),
(1791, 36, '2022-08-23'),
(1792, 37, '2022-08-23'),
(1793, 37, '2022-08-23'),
(1794, 38, '2022-08-23'),
(1795, 38, '2022-08-23'),
(1796, 35, '2022-08-23'),
(1797, 55, '2022-08-23'),
(1798, 55, '2022-08-23'),
(1799, 56, '2022-08-23'),
(1800, 56, '2022-08-23'),
(1801, 57, '2022-08-23'),
(1802, 57, '2022-08-23'),
(1803, 58, '2022-08-23'),
(1804, 49, '2022-08-23'),
(1805, 50, '2022-08-23'),
(1806, 10, '2022-08-23'),
(1807, 12, '2022-08-23'),
(1808, 13, '2022-08-23'),
(1809, 39, '2022-08-23'),
(1810, 39, '2022-08-23'),
(1811, 59, '2022-08-23'),
(1812, 12, '2022-08-23'),
(1813, 40, '2022-08-23'),
(1814, 41, '2022-08-23'),
(1815, 41, '2022-08-23'),
(1816, 44, '2022-08-23'),
(1817, 44, '2022-08-23'),
(1818, 45, '2022-08-23'),
(1819, 45, '2022-08-23'),
(1820, 46, '2022-08-23'),
(1821, 60, '2022-08-23'),
(1822, 48, '2022-08-23'),
(1823, 48, '2022-08-23'),
(1824, 43, '2022-08-23'),
(1825, 43, '2022-08-23'),
(1826, 41, '2022-08-23'),
(1827, 42, '2022-08-23'),
(1828, 42, '2022-08-23'),
(1829, 7, '2022-08-23'),
(1830, 44, '2022-08-23'),
(1831, 51, '2022-08-23'),
(1832, 51, '2022-08-23'),
(1833, 48, '2022-08-23'),
(1834, 51, '2022-08-23'),
(1835, 49, '2022-08-23'),
(1836, 50, '2022-08-23'),
(1837, 50, '2022-08-23'),
(1838, 43, '2022-08-23'),
(1839, 43, '2022-08-23'),
(1840, 42, '2022-08-23'),
(1841, 47, '2022-08-23'),
(1842, 47, '2022-08-23'),
(1843, 47, '2022-08-23'),
(1844, 14, '2022-08-23'),
(1845, 45, '2022-08-23'),
(1846, 46, '2022-08-23'),
(1847, 60, '2022-08-23'),
(1848, 60, '2022-08-23'),
(1849, 10, '2022-08-24'),
(1850, 3, '2022-08-24'),
(1851, 12, '2022-08-24'),
(1852, 6, '2022-08-24'),
(1853, 9, '2022-08-24'),
(1854, 2, '2022-08-24'),
(1855, 7, '2022-08-24'),
(1856, 11, '2022-08-24'),
(1857, 7, '2022-08-24'),
(1858, 10, '2022-08-24'),
(1859, 12, '2022-08-24'),
(1860, 3, '2022-08-24'),
(1861, 7, '2022-08-24'),
(1862, 8, '2022-08-24'),
(1863, 10, '2022-08-24'),
(1864, 12, '2022-08-24'),
(1865, 14, '2022-08-24'),
(1866, 3, '2022-08-24'),
(1867, 7, '2022-08-24'),
(1868, 6, '2022-08-24'),
(1869, 9, '2022-08-24'),
(1870, 2, '2022-08-24'),
(1871, 10, '2022-08-24'),
(1872, 12, '2022-08-24'),
(1873, 11, '2022-08-24'),
(1874, 7, '2022-08-24'),
(1875, 14, '2022-08-25'),
(1876, 10, '2022-08-25'),
(1877, 12, '2022-08-25'),
(1878, 15, '2022-08-25'),
(1879, 7, '2022-08-25'),
(1880, 14, '2022-08-25'),
(1881, 3, '2022-08-25'),
(1882, 6, '2022-08-25'),
(1883, 9, '2022-08-25'),
(1884, 2, '2022-08-25'),
(1885, 10, '2022-08-25'),
(1886, 12, '2022-08-25'),
(1887, 7, '2022-08-25'),
(1888, 11, '2022-08-25'),
(1889, 10, '2022-08-25'),
(1890, 12, '2022-08-25'),
(1891, 2, '2022-08-25'),
(1892, 2, '2022-08-25'),
(1893, 2, '2022-08-25'),
(1894, 7, '2022-08-25'),
(1895, 3, '2022-08-25'),
(1896, 7, '2022-08-26'),
(1897, 9, '2022-08-26'),
(1898, 3, '2022-08-26'),
(1899, 10, '2022-08-26'),
(1900, 4, '2022-08-26'),
(1901, 2, '2022-08-26'),
(1902, 2, '2022-08-26'),
(1903, 14, '2022-08-26'),
(1904, 8, '2022-08-26'),
(1905, 5, '2022-08-26'),
(1906, 5, '2022-08-26'),
(1907, 3, '2022-08-26'),
(1908, 3, '2022-08-26'),
(1909, 8, '2022-08-26'),
(1910, 6, '2022-08-26'),
(1911, 7, '2022-08-26'),
(1912, 7, '2022-08-26'),
(1913, 9, '2022-08-26'),
(1914, 10, '2022-08-27'),
(1915, 10, '2022-08-27'),
(1916, 2, '2022-08-28'),
(1917, 3, '2022-08-28'),
(1918, 12, '2022-08-28'),
(1919, 7, '2022-08-29'),
(1920, 2, '2022-09-02'),
(1921, 3, '2022-09-02'),
(1922, 41, '2022-09-02'),
(1923, 42, '2022-09-02'),
(1924, 14, '2022-09-02'),
(1925, 32, '2022-09-02'),
(1926, 31, '2022-09-02'),
(1927, 15, '2022-09-02'),
(1928, 35, '2022-09-02'),
(1929, 39, '2022-09-02'),
(1930, 54, '2022-09-02'),
(1931, 46, '2022-09-02'),
(1932, 58, '2022-09-02'),
(1933, 2, '2022-09-02'),
(1934, 52, '2022-09-02'),
(1935, 8, '2022-09-02'),
(1936, 6, '2022-09-02'),
(1937, 43, '2022-09-02'),
(1938, 8, '2022-09-02'),
(1939, 59, '2022-09-02'),
(1940, 9, '2022-09-02'),
(1941, 55, '2022-09-02'),
(1942, 12, '2022-09-02'),
(1943, 6, '2022-09-02'),
(1944, 4, '2022-09-02'),
(1945, 58, '2022-09-02'),
(1946, 52, '2022-09-02'),
(1947, 2, '2022-09-02'),
(1948, 19, '2022-09-02'),
(1949, 43, '2022-09-02'),
(1950, 59, '2022-09-02'),
(1951, 12, '2022-09-02'),
(1952, 4, '2022-09-02'),
(1953, 47, '2022-09-02'),
(1954, 20, '2022-09-02'),
(1955, 60, '2022-09-02'),
(1956, 38, '2022-09-02'),
(1957, 53, '2022-09-02'),
(1958, 49, '2022-09-02'),
(1959, 11, '2022-09-02'),
(1960, 44, '2022-09-02'),
(1961, 56, '2022-09-02'),
(1962, 5, '2022-09-02'),
(1963, 3, '2022-09-02'),
(1964, 12, '2022-09-02'),
(1965, 55, '2022-09-04'),
(1966, 51, '2022-09-04'),
(1967, 51, '2022-09-04'),
(1968, 34, '2022-09-04'),
(1969, 31, '2022-09-05'),
(1970, 30, '2022-09-05'),
(1971, 43, '2022-09-05'),
(1972, 20, '2022-09-05'),
(1973, 19, '2022-09-05'),
(1974, 26, '2022-09-05'),
(1975, 55, '2022-09-05'),
(1976, 22, '2022-09-05'),
(1977, 30, '2022-09-05'),
(1978, 33, '2022-09-05'),
(1979, 51, '2022-09-05'),
(1980, 27, '2022-09-06'),
(1981, 25, '2022-09-06'),
(1982, 51, '2022-09-06'),
(1983, 33, '2022-09-06'),
(1984, 29, '2022-09-06'),
(1985, 55, '2022-09-06'),
(1986, 60, '2022-09-06'),
(1987, 2, '2022-09-07'),
(1988, 12, '2022-09-07'),
(1989, 13, '2022-09-07'),
(1990, 13, '2022-09-07'),
(1991, 16, '2022-09-07'),
(1992, 16, '2022-09-07'),
(1993, 19, '2022-09-07'),
(1994, 17, '2022-09-07'),
(1995, 18, '2022-09-07'),
(1996, 18, '2022-09-07'),
(1997, 20, '2022-09-07'),
(1998, 3, '2022-09-07'),
(1999, 21, '2022-09-07'),
(2000, 21, '2022-09-07'),
(2001, 13, '2022-09-07'),
(2002, 12, '2022-09-07'),
(2003, 16, '2022-09-07'),
(2004, 19, '2022-09-07'),
(2005, 17, '2022-09-07'),
(2006, 17, '2022-09-07'),
(2007, 18, '2022-09-07'),
(2008, 20, '2022-09-07'),
(2009, 20, '2022-09-07'),
(2010, 21, '2022-09-07'),
(2011, 30, '2022-09-07'),
(2012, 20, '2022-09-08'),
(2013, 25, '2022-09-08'),
(2014, 12, '2022-09-08'),
(2015, 33, '2022-09-08'),
(2016, 53, '2022-09-08'),
(2017, 47, '2022-09-08'),
(2018, 34, '2022-09-08'),
(2019, 18, '2022-09-08'),
(2020, 19, '2022-09-08'),
(2021, 27, '2022-09-08'),
(2022, 16, '2022-09-08'),
(2023, 22, '2022-09-08'),
(2024, 52, '2022-09-08'),
(2025, 28, '2022-09-08'),
(2026, 27, '2022-09-08'),
(2027, 28, '2022-09-08'),
(2028, 26, '2022-09-09'),
(2029, 23, '2022-09-09'),
(2030, 52, '2022-09-09'),
(2031, 22, '2022-09-09'),
(2032, 12, '2022-09-09'),
(2033, 22, '2022-09-10'),
(2034, 22, '2022-09-10'),
(2035, 27, '2022-09-10'),
(2036, 53, '2022-09-11'),
(2037, 53, '2022-09-11'),
(2038, 54, '2022-09-11'),
(2039, 54, '2022-09-11'),
(2040, 52, '2022-09-11'),
(2041, 52, '2022-09-11'),
(2042, 24, '2022-09-11'),
(2043, 25, '2022-09-11'),
(2044, 25, '2022-09-11'),
(2045, 26, '2022-09-11'),
(2046, 55, '2022-09-11'),
(2047, 56, '2022-09-11'),
(2048, 56, '2022-09-11'),
(2049, 23, '2022-09-11'),
(2050, 57, '2022-09-11'),
(2051, 58, '2022-09-11'),
(2052, 58, '2022-09-11'),
(2053, 28, '2022-09-11'),
(2054, 28, '2022-09-11'),
(2055, 33, '2022-09-11'),
(2056, 33, '2022-09-11'),
(2057, 34, '2022-09-11'),
(2058, 34, '2022-09-11'),
(2059, 59, '2022-09-11'),
(2060, 59, '2022-09-11'),
(2061, 51, '2022-09-11'),
(2062, 51, '2022-09-11'),
(2063, 49, '2022-09-11'),
(2064, 50, '2022-09-11'),
(2065, 50, '2022-09-11'),
(2066, 52, '2022-09-11'),
(2067, 28, '2022-09-11'),
(2068, 28, '2022-09-11'),
(2069, 25, '2022-09-11'),
(2070, 25, '2022-09-11'),
(2071, 31, '2022-09-11'),
(2072, 26, '2022-09-11'),
(2073, 29, '2022-09-11'),
(2074, 29, '2022-09-11'),
(2075, 30, '2022-09-11'),
(2076, 30, '2022-09-11'),
(2077, 27, '2022-09-11'),
(2078, 36, '2022-09-11'),
(2079, 36, '2022-09-11'),
(2080, 37, '2022-09-11'),
(2081, 37, '2022-09-11'),
(2082, 55, '2022-09-11'),
(2083, 55, '2022-09-11'),
(2084, 38, '2022-09-11'),
(2085, 38, '2022-09-11'),
(2086, 60, '2022-09-11'),
(2087, 53, '2022-09-11'),
(2088, 53, '2022-09-11'),
(2089, 32, '2022-09-11'),
(2090, 32, '2022-09-11'),
(2091, 54, '2022-09-11'),
(2092, 54, '2022-09-11'),
(2093, 35, '2022-09-11'),
(2094, 35, '2022-09-11'),
(2095, 33, '2022-09-11'),
(2096, 59, '2022-09-11'),
(2097, 15, '2022-09-11'),
(2098, 24, '2022-09-12'),
(2099, 24, '2022-09-12'),
(2100, 57, '2022-09-12'),
(2101, 34, '2022-09-12'),
(2102, 58, '2022-09-12'),
(2103, 58, '2022-09-12'),
(2104, 49, '2022-09-12'),
(2105, 49, '2022-09-12'),
(2106, 50, '2022-09-12'),
(2107, 56, '2022-09-12'),
(2108, 56, '2022-09-12'),
(2109, 27, '2022-09-12'),
(2110, 39, '2022-09-12'),
(2111, 39, '2022-09-12'),
(2112, 23, '2022-09-12'),
(2113, 29, '2022-09-12'),
(2114, 29, '2022-09-12'),
(2115, 30, '2022-09-12'),
(2116, 40, '2022-09-12'),
(2117, 40, '2022-09-12'),
(2118, 41, '2022-09-12'),
(2119, 44, '2022-09-12'),
(2120, 45, '2022-09-12'),
(2121, 45, '2022-09-12'),
(2122, 40, '2022-09-12'),
(2123, 40, '2022-09-12'),
(2124, 46, '2022-09-12'),
(2125, 51, '2022-09-12'),
(2126, 51, '2022-09-12'),
(2127, 32, '2022-09-12'),
(2128, 31, '2022-09-12'),
(2129, 31, '2022-09-12'),
(2130, 36, '2022-09-12'),
(2131, 48, '2022-09-12'),
(2132, 37, '2022-09-12'),
(2133, 37, '2022-09-12'),
(2134, 38, '2022-09-12'),
(2135, 35, '2022-09-12'),
(2136, 35, '2022-09-12'),
(2137, 43, '2022-09-12'),
(2138, 43, '2022-09-12'),
(2139, 48, '2022-09-12'),
(2140, 42, '2022-09-12'),
(2141, 43, '2022-09-12'),
(2142, 43, '2022-09-12'),
(2143, 47, '2022-09-12'),
(2144, 47, '2022-09-12'),
(2145, 41, '2022-09-12'),
(2146, 41, '2022-09-12'),
(2147, 42, '2022-09-12'),
(2148, 42, '2022-09-12'),
(2149, 44, '2022-09-12'),
(2150, 44, '2022-09-12'),
(2151, 39, '2022-09-12'),
(2152, 47, '2022-09-12'),
(2153, 45, '2022-09-12'),
(2154, 45, '2022-09-12'),
(2155, 46, '2022-09-12'),
(2156, 60, '2022-09-12'),
(2157, 60, '2022-09-12'),
(2158, 14, '2022-09-12'),
(2159, 14, '2022-09-12'),
(2160, 15, '2022-09-12'),
(2161, 43, '2022-09-12'),
(2162, 58, '2022-09-13'),
(2163, 43, '2022-09-13'),
(2164, 18, '2022-09-13'),
(2165, 24, '2022-09-13'),
(2166, 35, '2022-09-13'),
(2167, 47, '2022-09-13'),
(2168, 2, '2022-09-13'),
(2169, 2, '2022-09-13'),
(2170, 9, '2022-09-13'),
(2171, 9, '2022-09-13'),
(2172, 7, '2022-09-13'),
(2173, 7, '2022-09-13'),
(2174, 25, '2022-09-13'),
(2175, 10, '2022-09-13'),
(2176, 51, '2022-09-13'),
(2177, 2, '2022-09-13'),
(2178, 3, '2022-09-13'),
(2179, 4, '2022-09-13'),
(2180, 4, '2022-09-13'),
(2181, 8, '2022-09-13'),
(2182, 8, '2022-09-13'),
(2183, 8, '2022-09-13'),
(2184, 5, '2022-09-13'),
(2185, 5, '2022-09-13'),
(2186, 7, '2022-09-13'),
(2187, 14, '2022-09-13'),
(2188, 10, '2022-09-13'),
(2189, 6, '2022-09-13'),
(2190, 6, '2022-09-13'),
(2191, 10, '2022-09-13'),
(2192, 10, '2022-09-13'),
(2193, 3, '2022-09-13'),
(2194, 32, '2022-09-14'),
(2195, 56, '2022-09-14'),
(2196, 5, '2022-09-14'),
(2197, 59, '2022-09-14'),
(2198, 35, '2022-09-14'),
(2199, 35, '2022-09-14'),
(2200, 20, '2022-09-14'),
(2201, 25, '2022-09-14'),
(2202, 59, '2022-09-15'),
(2203, 25, '2022-09-15'),
(2204, 18, '2022-09-15'),
(2205, 22, '2022-09-15'),
(2206, 20, '2022-09-15'),
(2207, 29, '2022-09-15'),
(2208, 23, '2022-09-15'),
(2209, 16, '2022-09-15'),
(2210, 31, '2022-09-15'),
(2211, 26, '2022-09-15'),
(2212, 27, '2022-09-15'),
(2213, 17, '2022-09-15'),
(2214, 21, '2022-09-15'),
(2215, 28, '2022-09-15'),
(2216, 24, '2022-09-15'),
(2217, 19, '2022-09-15'),
(2218, 45, '2022-09-16'),
(2219, 51, '2022-09-16'),
(2220, 60, '2022-09-16'),
(2221, 16, '2022-09-16'),
(2222, 36, '2022-09-16'),
(2223, 3, '2022-09-16'),
(2224, 35, '2022-09-16'),
(2225, 25, '2022-09-16'),
(2226, 7, '2022-09-16'),
(2227, 7, '2022-09-16'),
(2228, 2, '2022-09-16'),
(2229, 43, '2022-09-16'),
(2230, 55, '2022-09-16'),
(2231, 49, '2022-09-16'),
(2232, 57, '2022-09-16'),
(2233, 17, '2022-09-16'),
(2234, 53, '2022-09-17'),
(2235, 24, '2022-09-17'),
(2236, 24, '2022-09-17'),
(2237, 58, '2022-09-17'),
(2238, 31, '2022-09-17'),
(2239, 47, '2022-09-17'),
(2240, 23, '2022-09-17'),
(2241, 48, '2022-09-17'),
(2242, 16, '2022-09-17'),
(2243, 39, '2022-09-17'),
(2244, 35, '2022-09-17'),
(2245, 29, '2022-09-17'),
(2246, 32, '2022-09-17'),
(2247, 52, '2022-09-17'),
(2248, 56, '2022-09-17'),
(2249, 44, '2022-09-17'),
(2250, 53, '2022-09-17'),
(2251, 47, '2022-09-18'),
(2252, 16, '2022-09-18'),
(2253, 17, '2022-09-19'),
(2254, 31, '2022-09-19'),
(2255, 21, '2022-09-19'),
(2256, 25, '2022-09-19'),
(2257, 20, '2022-09-19'),
(2258, 27, '2022-09-19'),
(2259, 28, '2022-09-19'),
(2260, 23, '2022-09-19'),
(2261, 16, '2022-09-19'),
(2262, 19, '2022-09-19'),
(2263, 29, '2022-09-19'),
(2264, 24, '2022-09-19'),
(2265, 26, '2022-09-19'),
(2266, 22, '2022-09-19'),
(2267, 18, '2022-09-19'),
(2268, 25, '2022-09-19'),
(2269, 55, '2022-09-19'),
(2270, 59, '2022-09-19'),
(2271, 4, '2022-09-19'),
(2272, 7, '2022-09-19'),
(2273, 7, '2022-09-19'),
(2274, 7, '2022-09-19'),
(2275, 41, '2022-09-19'),
(2276, 57, '2022-09-19'),
(2277, 26, '2022-09-19'),
(2278, 23, '2022-09-20'),
(2279, 47, '2022-09-20'),
(2280, 34, '2022-09-20'),
(2281, 21, '2022-09-20'),
(2282, 43, '2022-09-20'),
(2283, 49, '2022-09-20'),
(2284, 60, '2022-09-20'),
(2285, 35, '2022-09-20'),
(2286, 38, '2022-09-20'),
(2287, 39, '2022-09-20'),
(2288, 2, '2022-09-21'),
(2289, 38, '2022-09-21'),
(2290, 59, '2022-09-21'),
(2291, 43, '2022-09-21'),
(2292, 50, '2022-09-21'),
(2293, 60, '2022-09-21'),
(2294, 12, '2022-09-21'),
(2295, 13, '2022-09-21'),
(2296, 23, '2022-09-21'),
(2297, 56, '2022-09-21'),
(2298, 16, '2022-09-21'),
(2299, 19, '2022-09-21'),
(2300, 17, '2022-09-21'),
(2301, 18, '2022-09-21'),
(2302, 20, '2022-09-21'),
(2303, 20, '2022-09-21'),
(2304, 21, '2022-09-21'),
(2305, 42, '2022-09-22'),
(2306, 5, '2022-09-22'),
(2307, 16, '2022-09-22'),
(2308, 16, '2022-09-22'),
(2309, 19, '2022-09-22'),
(2310, 17, '2022-09-22'),
(2311, 18, '2022-09-22'),
(2312, 20, '2022-09-22'),
(2313, 21, '2022-09-22'),
(2314, 21, '2022-09-22'),
(2315, 13, '2022-09-22'),
(2316, 12, '2022-09-22'),
(2317, 11, '2022-09-22'),
(2318, 11, '2022-09-22'),
(2319, 24, '2022-09-22'),
(2320, 24, '2022-09-22'),
(2321, 53, '2022-09-22'),
(2322, 55, '2022-09-22'),
(2323, 55, '2022-09-22'),
(2324, 53, '2022-09-22'),
(2325, 56, '2022-09-22'),
(2326, 54, '2022-09-22'),
(2327, 33, '2022-09-22'),
(2328, 33, '2022-09-22'),
(2329, 56, '2022-09-22'),
(2330, 58, '2022-09-22'),
(2331, 34, '2022-09-22'),
(2332, 19, '2022-09-22'),
(2333, 43, '2022-09-22'),
(2334, 41, '2022-09-22'),
(2335, 7, '2022-09-22'),
(2336, 6, '2022-09-22'),
(2337, 28, '2022-09-22'),
(2338, 23, '2022-09-22'),
(2339, 4, '2022-09-22'),
(2340, 30, '2022-09-22'),
(2341, 17, '2022-09-22'),
(2342, 40, '2022-09-22'),
(2343, 14, '2022-09-22'),
(2344, 21, '2022-09-22'),
(2345, 29, '2022-09-22'),
(2346, 9, '2022-09-22'),
(2347, 51, '2022-09-22'),
(2348, 51, '2022-09-22'),
(2349, 41, '2022-09-22'),
(2350, 43, '2022-09-22'),
(2351, 23, '2022-09-22'),
(2352, 28, '2022-09-22'),
(2353, 42, '2022-09-22'),
(2354, 12, '2022-09-22'),
(2355, 60, '2022-09-22'),
(2356, 60, '2022-09-22'),
(2357, 5, '2022-09-22'),
(2358, 12, '2022-09-22'),
(2359, 37, '2022-09-22'),
(2360, 36, '2022-09-22'),
(2361, 47, '2022-09-22'),
(2362, 50, '2022-09-22'),
(2363, 18, '2022-09-22'),
(2364, 18, '2022-09-22'),
(2365, 15, '2022-09-22'),
(2366, 49, '2022-09-22'),
(2367, 49, '2022-09-22'),
(2368, 2, '2022-09-22'),
(2369, 2, '2022-09-22'),
(2370, 42, '2022-09-22'),
(2371, 31, '2022-09-22'),
(2372, 26, '2022-09-22'),
(2373, 26, '2022-09-22'),
(2374, 8, '2022-09-22'),
(2375, 45, '2022-09-22'),
(2376, 48, '2022-09-22'),
(2377, 46, '2022-09-22'),
(2378, 8, '2022-09-22'),
(2379, 13, '2022-09-22'),
(2380, 46, '2022-09-22'),
(2381, 22, '2022-09-22'),
(2382, 52, '2022-09-22'),
(2383, 22, '2022-09-22'),
(2384, 22, '2022-09-22'),
(2385, 13, '2022-09-22'),
(2386, 59, '2022-09-22'),
(2387, 8, '2022-09-22'),
(2388, 53, '2022-09-22'),
(2389, 54, '2022-09-22'),
(2390, 10, '2022-09-22'),
(2391, 25, '2022-09-22'),
(2392, 35, '2022-09-22'),
(2393, 38, '2022-09-22'),
(2394, 39, '2022-09-22'),
(2395, 20, '2022-09-22'),
(2396, 20, '2022-09-22'),
(2397, 57, '2022-09-22'),
(2398, 32, '2022-09-22'),
(2399, 32, '2022-09-22'),
(2400, 40, '2022-09-22'),
(2401, 41, '2022-09-22'),
(2402, 43, '2022-09-22'),
(2403, 3, '2022-09-22'),
(2404, 38, '2022-09-22'),
(2405, 12, '2022-09-22'),
(2406, 16, '2022-09-22'),
(2407, 21, '2022-09-22'),
(2408, 17, '2022-09-22'),
(2409, 19, '2022-09-22'),
(2410, 18, '2022-09-22'),
(2411, 39, '2022-09-22'),
(2412, 27, '2022-09-22'),
(2413, 44, '2022-09-22'),
(2414, 35, '2022-09-22'),
(2415, 20, '2022-09-22'),
(2416, 32, '2022-09-22'),
(2417, 32, '2022-09-22'),
(2418, 60, '2022-09-22'),
(2419, 51, '2022-09-22'),
(2420, 50, '2022-09-22'),
(2421, 59, '2022-09-22'),
(2422, 37, '2022-09-22'),
(2423, 48, '2022-09-22'),
(2424, 47, '2022-09-22'),
(2425, 27, '2022-09-22'),
(2426, 16, '2022-09-22'),
(2427, 16, '2022-09-22'),
(2428, 52, '2022-09-22'),
(2429, 57, '2022-09-22'),
(2430, 56, '2022-09-22'),
(2431, 55, '2022-09-22'),
(2432, 13, '2022-09-22'),
(2433, 16, '2022-09-22'),
(2434, 16, '2022-09-22'),
(2435, 58, '2022-09-22'),
(2436, 54, '2022-09-22'),
(2437, 11, '2022-09-22'),
(2438, 19, '2022-09-22'),
(2439, 19, '2022-09-22'),
(2440, 5, '2022-09-22'),
(2441, 10, '2022-09-22'),
(2442, 48, '2022-09-22'),
(2443, 43, '2022-09-22'),
(2444, 42, '2022-09-22'),
(2445, 45, '2022-09-22'),
(2446, 41, '2022-09-22'),
(2447, 40, '2022-09-22'),
(2448, 44, '2022-09-22'),
(2449, 37, '2022-09-22'),
(2450, 46, '2022-09-22'),
(2451, 39, '2022-09-22'),
(2452, 9, '2022-09-22'),
(2453, 35, '2022-09-22'),
(2454, 20, '2022-09-22'),
(2455, 17, '2022-09-22'),
(2456, 12, '2022-09-22'),
(2457, 18, '2022-09-22'),
(2458, 13, '2022-09-22'),
(2459, 52, '2022-09-22'),
(2460, 43, '2022-09-22'),
(2461, 51, '2022-09-22'),
(2462, 53, '2022-09-22'),
(2463, 50, '2022-09-22'),
(2464, 55, '2022-09-22'),
(2465, 57, '2022-09-22'),
(2466, 14, '2022-09-22'),
(2467, 15, '2022-09-22'),
(2468, 19, '2022-09-22'),
(2469, 59, '2022-09-22'),
(2470, 54, '2022-09-22'),
(2471, 29, '2022-09-22'),
(2472, 21, '2022-09-22'),
(2473, 22, '2022-09-22'),
(2474, 47, '2022-09-22'),
(2475, 16, '2022-09-22'),
(2476, 58, '2022-09-22'),
(2477, 49, '2022-09-22'),
(2478, 56, '2022-09-22'),
(2479, 11, '2022-09-22'),
(2480, 44, '2022-09-22'),
(2481, 9, '2022-09-22'),
(2482, 10, '2022-09-22'),
(2483, 60, '2022-09-22'),
(2484, 17, '2022-09-22'),
(2485, 12, '2022-09-22'),
(2486, 18, '2022-09-22'),
(2487, 18, '2022-09-22'),
(2488, 20, '2022-09-22'),
(2489, 29, '2022-09-22'),
(2490, 26, '2022-09-22'),
(2491, 6, '2022-09-22'),
(2492, 16, '2022-09-22'),
(2493, 21, '2022-09-22'),
(2494, 22, '2022-09-22'),
(2495, 13, '2022-09-22'),
(2496, 37, '2022-09-22'),
(2497, 52, '2022-09-22'),
(2498, 19, '2022-09-22'),
(2499, 24, '2022-09-22'),
(2500, 42, '2022-09-22'),
(2501, 23, '2022-09-22'),
(2502, 20, '2022-09-22'),
(2503, 11, '2022-09-22'),
(2504, 5, '2022-09-22'),
(2505, 54, '2022-09-22'),
(2506, 53, '2022-09-22'),
(2507, 51, '2022-09-22'),
(2508, 56, '2022-09-22'),
(2509, 59, '2022-09-22'),
(2510, 4, '2022-09-22'),
(2511, 43, '2022-09-22'),
(2512, 55, '2022-09-22'),
(2513, 36, '2022-09-22'),
(2514, 41, '2022-09-22'),
(2515, 30, '2022-09-22'),
(2516, 8, '2022-09-22'),
(2517, 8, '2022-09-22'),
(2518, 27, '2022-09-22'),
(2519, 23, '2022-09-22'),
(2520, 10, '2022-09-22'),
(2521, 9, '2022-09-22'),
(2522, 7, '2022-09-22'),
(2523, 51, '2022-09-22'),
(2524, 3, '2022-09-22'),
(2525, 2, '2022-09-22'),
(2526, 40, '2022-09-22'),
(2527, 27, '2022-09-22'),
(2528, 36, '2022-09-22'),
(2529, 58, '2022-09-22'),
(2530, 43, '2022-09-22'),
(2531, 47, '2022-09-22'),
(2532, 47, '2022-09-22'),
(2533, 33, '2022-09-22'),
(2534, 37, '2022-09-22'),
(2535, 13, '2022-09-22'),
(2536, 31, '2022-09-22'),
(2537, 13, '2022-09-22'),
(2538, 57, '2022-09-22'),
(2539, 22, '2022-09-22'),
(2540, 46, '2022-09-22'),
(2541, 2, '2022-09-22'),
(2542, 2, '2022-09-22'),
(2543, 46, '2022-09-22'),
(2544, 39, '2022-09-22'),
(2545, 35, '2022-09-22'),
(2546, 19, '2022-09-22'),
(2547, 35, '2022-09-22'),
(2548, 14, '2022-09-22'),
(2549, 20, '2022-09-22'),
(2550, 16, '2022-09-22'),
(2551, 12, '2022-09-22'),
(2552, 39, '2022-09-22'),
(2553, 18, '2022-09-22'),
(2554, 38, '2022-09-22'),
(2555, 33, '2022-09-22'),
(2556, 56, '2022-09-22'),
(2557, 44, '2022-09-22'),
(2558, 47, '2022-09-22'),
(2559, 14, '2022-09-22'),
(2560, 28, '2022-09-22'),
(2561, 15, '2022-09-22'),
(2562, 34, '2022-09-22'),
(2563, 58, '2022-09-22'),
(2564, 57, '2022-09-22'),
(2565, 54, '2022-09-22'),
(2566, 50, '2022-09-22'),
(2567, 17, '2022-09-22'),
(2568, 49, '2022-09-22'),
(2569, 60, '2022-09-22'),
(2570, 45, '2022-09-22'),
(2571, 31, '2022-09-22'),
(2572, 8, '2022-09-22'),
(2573, 52, '2022-09-22'),
(2574, 59, '2022-09-22'),
(2575, 51, '2022-09-22'),
(2576, 55, '2022-09-22'),
(2577, 55, '2022-09-22'),
(2578, 58, '2022-09-22'),
(2579, 21, '2022-09-22'),
(2580, 48, '2022-09-22'),
(2581, 52, '2022-09-22'),
(2582, 40, '2022-09-22'),
(2583, 59, '2022-09-22'),
(2584, 11, '2022-09-22'),
(2585, 48, '2022-09-22'),
(2586, 48, '2022-09-22'),
(2587, 3, '2022-09-22'),
(2588, 4, '2022-09-22'),
(2589, 25, '2022-09-22'),
(2590, 12, '2022-09-22'),
(2591, 45, '2022-09-22'),
(2592, 5, '2022-09-22'),
(2593, 15, '2022-09-22'),
(2594, 53, '2022-09-22'),
(2595, 30, '2022-09-22'),
(2596, 38, '2022-09-22'),
(2597, 29, '2022-09-22'),
(2598, 6, '2022-09-22'),
(2599, 32, '2022-09-22'),
(2600, 13, '2022-09-22'),
(2601, 37, '2022-09-22'),
(2602, 22, '2022-09-22'),
(2603, 17, '2022-09-22'),
(2604, 52, '2022-09-22'),
(2605, 29, '2022-09-22'),
(2606, 23, '2022-09-22'),
(2607, 23, '2022-09-22'),
(2608, 20, '2022-09-22'),
(2609, 26, '2022-09-22'),
(2610, 12, '2022-09-22'),
(2611, 39, '2022-09-22'),
(2612, 12, '2022-09-22'),
(2613, 35, '2022-09-22'),
(2614, 16, '2022-09-22'),
(2615, 6, '2022-09-22'),
(2616, 21, '2022-09-22'),
(2617, 42, '2022-09-22'),
(2618, 50, '2022-09-22'),
(2619, 60, '2022-09-22'),
(2620, 49, '2022-09-22'),
(2621, 18, '2022-09-22'),
(2622, 49, '2022-09-22'),
(2623, 25, '2022-09-22'),
(2624, 19, '2022-09-22'),
(2625, 19, '2022-09-22'),
(2626, 41, '2022-09-22'),
(2627, 24, '2022-09-22'),
(2628, 16, '2022-09-22'),
(2629, 24, '2022-09-22'),
(2630, 13, '2022-09-22'),
(2631, 18, '2022-09-22'),
(2632, 14, '2022-09-22'),
(2633, 7, '2022-09-22'),
(2634, 17, '2022-09-22'),
(2635, 22, '2022-09-22'),
(2636, 12, '2022-09-22'),
(2637, 21, '2022-09-22'),
(2638, 43, '2022-09-22'),
(2639, 26, '2022-09-22'),
(2640, 47, '2022-09-22'),
(2641, 28, '2022-09-22'),
(2642, 53, '2022-09-22'),
(2643, 15, '2022-09-22'),
(2644, 9, '2022-09-22'),
(2645, 56, '2022-09-22'),
(2646, 57, '2022-09-22'),
(2647, 52, '2022-09-22'),
(2648, 55, '2022-09-22'),
(2649, 51, '2022-09-22'),
(2650, 27, '2022-09-22'),
(2651, 54, '2022-09-22'),
(2652, 58, '2022-09-22'),
(2653, 10, '2022-09-22'),
(2654, 55, '2022-09-22'),
(2655, 59, '2022-09-22'),
(2656, 54, '2022-09-22'),
(2657, 53, '2022-09-22'),
(2658, 9, '2022-09-22'),
(2659, 10, '2022-09-22'),
(2660, 32, '2022-09-22'),
(2661, 20, '2022-09-22'),
(2662, 20, '2022-09-22'),
(2663, 19, '2022-09-22'),
(2664, 5, '2022-09-22'),
(2665, 37, '2022-09-22'),
(2666, 41, '2022-09-22'),
(2667, 34, '2022-09-22'),
(2668, 44, '2022-09-22'),
(2669, 40, '2022-09-22'),
(2670, 43, '2022-09-22'),
(2671, 16, '2022-09-22'),
(2672, 42, '2022-09-22'),
(2673, 11, '2022-09-22'),
(2674, 11, '2022-09-22'),
(2675, 7, '2022-09-22'),
(2676, 51, '2022-09-22'),
(2677, 32, '2022-09-22'),
(2678, 2, '2022-09-22'),
(2679, 8, '2022-09-22'),
(2680, 4, '2022-09-22'),
(2681, 3, '2022-09-22'),
(2682, 50, '2022-09-22'),
(2683, 45, '2022-09-22'),
(2684, 13, '2022-09-22'),
(2685, 18, '2022-09-22'),
(2686, 6, '2022-09-22'),
(2687, 17, '2022-09-22'),
(2688, 12, '2022-09-22'),
(2689, 5, '2022-09-22'),
(2690, 58, '2022-09-22'),
(2691, 57, '2022-09-22'),
(2692, 59, '2022-09-22'),
(2693, 52, '2022-09-22'),
(2694, 55, '2022-09-22'),
(2695, 56, '2022-09-22'),
(2696, 38, '2022-09-22'),
(2697, 53, '2022-09-22'),
(2698, 44, '2022-09-22'),
(2699, 51, '2022-09-22'),
(2700, 49, '2022-09-22'),
(2701, 58, '2022-09-22'),
(2702, 54, '2022-09-22'),
(2703, 21, '2022-09-22'),
(2704, 2, '2022-09-22'),
(2705, 56, '2022-09-22'),
(2706, 49, '2022-09-22'),
(2707, 50, '2022-09-22'),
(2708, 28, '2022-09-22'),
(2709, 23, '2022-09-22'),
(2710, 34, '2022-09-22'),
(2711, 45, '2022-09-22'),
(2712, 39, '2022-09-22'),
(2713, 15, '2022-09-22'),
(2714, 3, '2022-09-22'),
(2715, 3, '2022-09-22'),
(2716, 39, '2022-09-22'),
(2717, 48, '2022-09-22'),
(2718, 46, '2022-09-22'),
(2719, 43, '2022-09-22'),
(2720, 45, '2022-09-22'),
(2721, 41, '2022-09-22'),
(2722, 47, '2022-09-22'),
(2723, 37, '2022-09-22'),
(2724, 40, '2022-09-22'),
(2725, 8, '2022-09-22'),
(2726, 44, '2022-09-22'),
(2727, 13, '2022-09-22'),
(2728, 50, '2022-09-22'),
(2729, 14, '2022-09-22'),
(2730, 55, '2022-09-22'),
(2731, 57, '2022-09-22'),
(2732, 59, '2022-09-22'),
(2733, 22, '2022-09-22'),
(2734, 56, '2022-09-22'),
(2735, 58, '2022-09-22'),
(2736, 54, '2022-09-22'),
(2737, 26, '2022-09-22'),
(2738, 25, '2022-09-22'),
(2739, 27, '2022-09-22'),
(2740, 6, '2022-09-22'),
(2741, 21, '2022-09-22'),
(2742, 21, '2022-09-22'),
(2743, 31, '2022-09-22'),
(2744, 13, '2022-09-22'),
(2745, 22, '2022-09-22'),
(2746, 60, '2022-09-22'),
(2747, 6, '2022-09-22'),
(2748, 16, '2022-09-22'),
(2749, 17, '2022-09-22'),
(2750, 19, '2022-09-22'),
(2751, 37, '2022-09-22'),
(2752, 41, '2022-09-22'),
(2753, 41, '2022-09-22'),
(2754, 10, '2022-09-22'),
(2755, 10, '2022-09-22'),
(2756, 36, '2022-09-22'),
(2757, 27, '2022-09-22'),
(2758, 53, '2022-09-22'),
(2759, 12, '2022-09-22'),
(2760, 26, '2022-09-22'),
(2761, 20, '2022-09-22'),
(2762, 29, '2022-09-22'),
(2763, 32, '2022-09-22'),
(2764, 46, '2022-09-22'),
(2765, 55, '2022-09-22'),
(2766, 39, '2022-09-22'),
(2767, 37, '2022-09-22'),
(2768, 28, '2022-09-22'),
(2769, 45, '2022-09-22'),
(2770, 56, '2022-09-22'),
(2771, 60, '2022-09-22'),
(2772, 34, '2022-09-22'),
(2773, 17, '2022-09-22'),
(2774, 38, '2022-09-22'),
(2775, 24, '2022-09-22'),
(2776, 31, '2022-09-22'),
(2777, 33, '2022-09-22'),
(2778, 33, '2022-09-22'),
(2779, 47, '2022-09-22'),
(2780, 48, '2022-09-22'),
(2781, 44, '2022-09-22'),
(2782, 40, '2022-09-22'),
(2783, 42, '2022-09-22'),
(2784, 43, '2022-09-22'),
(2785, 41, '2022-09-22'),
(2786, 46, '2022-09-22'),
(2787, 50, '2022-09-22'),
(2788, 52, '2022-09-22'),
(2789, 54, '2022-09-22'),
(2790, 59, '2022-09-22'),
(2791, 58, '2022-09-22'),
(2792, 51, '2022-09-22'),
(2793, 53, '2022-09-22'),
(2794, 49, '2022-09-22'),
(2795, 57, '2022-09-22'),
(2796, 55, '2022-09-22'),
(2797, 24, '2022-09-22'),
(2798, 39, '2022-09-22'),
(2799, 13, '2022-09-22'),
(2800, 22, '2022-09-22'),
(2801, 45, '2022-09-22'),
(2802, 56, '2022-09-22'),
(2803, 35, '2022-09-22'),
(2804, 21, '2022-09-22'),
(2805, 4, '2022-09-22'),
(2806, 5, '2022-09-22'),
(2807, 51, '2022-09-22'),
(2808, 53, '2022-09-22'),
(2809, 49, '2022-09-22'),
(2810, 52, '2022-09-22'),
(2811, 20, '2022-09-22'),
(2812, 12, '2022-09-22'),
(2813, 13, '2022-09-22'),
(2814, 43, '2022-09-22'),
(2815, 48, '2022-09-22'),
(2816, 41, '2022-09-22'),
(2817, 40, '2022-09-22'),
(2818, 47, '2022-09-22'),
(2819, 45, '2022-09-22'),
(2820, 44, '2022-09-22'),
(2821, 42, '2022-09-22'),
(2822, 46, '2022-09-22'),
(2823, 50, '2022-09-22'),
(2824, 18, '2022-09-22'),
(2825, 54, '2022-09-22'),
(2826, 58, '2022-09-22'),
(2827, 17, '2022-09-22'),
(2828, 57, '2022-09-22'),
(2829, 43, '2022-09-22'),
(2830, 29, '2022-09-22'),
(2831, 20, '2022-09-22'),
(2832, 56, '2022-09-22'),
(2833, 16, '2022-09-22'),
(2834, 17, '2022-09-22'),
(2835, 21, '2022-09-22'),
(2836, 19, '2022-09-22'),
(2837, 55, '2022-09-22'),
(2838, 59, '2022-09-22'),
(2839, 54, '2022-09-22'),
(2840, 58, '2022-09-22'),
(2841, 53, '2022-09-22'),
(2842, 10, '2022-09-22'),
(2843, 38, '2022-09-22'),
(2844, 11, '2022-09-22'),
(2845, 24, '2022-09-22'),
(2846, 34, '2022-09-22'),
(2847, 46, '2022-09-22'),
(2848, 56, '2022-09-22'),
(2849, 37, '2022-09-22'),
(2850, 20, '2022-09-22'),
(2851, 30, '2022-09-23'),
(2852, 11, '2022-09-23'),
(2853, 3, '2022-09-23'),
(2854, 11, '2022-09-23'),
(2855, 14, '2022-09-23'),
(2856, 8, '2022-09-23'),
(2857, 5, '2022-09-23'),
(2858, 15, '2022-09-23'),
(2859, 8, '2022-09-23'),
(2860, 15, '2022-09-23'),
(2861, 10, '2022-09-23'),
(2862, 9, '2022-09-23'),
(2863, 9, '2022-09-23'),
(2864, 23, '2022-09-23'),
(2865, 3, '2022-09-23'),
(2866, 2, '2022-09-23'),
(2867, 9, '2022-09-23'),
(2868, 14, '2022-09-23'),
(2869, 53, '2022-09-23'),
(2870, 51, '2022-09-24'),
(2871, 56, '2022-09-24'),
(2872, 37, '2022-09-24'),
(2873, 59, '2022-09-24'),
(2874, 38, '2022-09-24'),
(2875, 56, '2022-09-24'),
(2876, 57, '2022-09-24'),
(2877, 34, '2022-09-24'),
(2878, 32, '2022-09-25'),
(2879, 50, '2022-09-25'),
(2880, 33, '2022-09-26'),
(2881, 34, '2022-09-26'),
(2882, 59, '2022-09-26'),
(2883, 25, '2022-09-26'),
(2884, 27, '2022-09-26'),
(2885, 24, '2022-09-26'),
(2886, 26, '2022-09-26'),
(2887, 19, '2022-09-26'),
(2888, 16, '2022-09-26'),
(2889, 17, '2022-09-26'),
(2890, 20, '2022-09-26'),
(2891, 18, '2022-09-26'),
(2892, 23, '2022-09-26'),
(2893, 22, '2022-09-26'),
(2894, 21, '2022-09-26'),
(2895, 28, '2022-09-26'),
(2896, 31, '2022-09-26'),
(2897, 30, '2022-09-26'),
(2898, 36, '2022-09-26'),
(2899, 29, '2022-09-26'),
(2900, 39, '2022-09-26'),
(2901, 38, '2022-09-26'),
(2902, 37, '2022-09-26'),
(2903, 32, '2022-09-26'),
(2904, 33, '2022-09-26'),
(2905, 35, '2022-09-26'),
(2906, 11, '2022-09-26'),
(2907, 12, '2022-09-26'),
(2908, 34, '2022-09-26'),
(2909, 5, '2022-09-26'),
(2910, 14, '2022-09-26'),
(2911, 52, '2022-09-26'),
(2912, 55, '2022-09-26'),
(2913, 53, '2022-09-26'),
(2914, 54, '2022-09-26'),
(2915, 59, '2022-09-26'),
(2916, 56, '2022-09-26'),
(2917, 57, '2022-09-26'),
(2918, 58, '2022-09-26'),
(2919, 3, '2022-09-26'),
(2920, 13, '2022-09-26'),
(2921, 6, '2022-09-26'),
(2922, 48, '2022-09-26'),
(2923, 51, '2022-09-26'),
(2924, 40, '2022-09-26'),
(2925, 49, '2022-09-26'),
(2926, 50, '2022-09-26'),
(2927, 41, '2022-09-26'),
(2928, 42, '2022-09-26'),
(2929, 43, '2022-09-26'),
(2930, 47, '2022-09-26'),
(2931, 44, '2022-09-26'),
(2932, 45, '2022-09-26'),
(2933, 7, '2022-09-26'),
(2934, 60, '2022-09-26'),
(2935, 46, '2022-09-26'),
(2936, 9, '2022-09-26'),
(2937, 4, '2022-09-26'),
(2938, 15, '2022-09-26'),
(2939, 10, '2022-09-26'),
(2940, 2, '2022-09-26'),
(2941, 8, '2022-09-26'),
(2942, 20, '2022-09-26'),
(2943, 59, '2022-09-26'),
(2944, 22, '2022-09-27'),
(2945, 22, '2022-09-27'),
(2946, 47, '2022-09-27'),
(2947, 22, '2022-09-27'),
(2948, 22, '2022-09-27'),
(2949, 52, '2022-09-28'),
(2950, 19, '2022-09-28'),
(2951, 16, '2022-09-29'),
(2952, 3, '2022-09-29'),
(2953, 24, '2022-09-29'),
(2954, 58, '2022-09-29'),
(2955, 55, '2022-09-29'),
(2956, 21, '2022-09-29'),
(2957, 18, '2022-09-29'),
(2958, 12, '2022-09-29'),
(2959, 13, '2022-09-29'),
(2960, 23, '2022-09-29'),
(2961, 40, '2022-09-29'),
(2962, 50, '2022-09-30'),
(2963, 53, '2022-09-30'),
(2964, 54, '2022-09-30'),
(2965, 22, '2022-09-30'),
(2966, 57, '2022-09-30'),
(2967, 29, '2022-09-30'),
(2968, 36, '2022-09-30'),
(2969, 58, '2022-09-30'),
(2970, 59, '2022-09-30'),
(2971, 26, '2022-09-30'),
(2972, 51, '2022-09-30'),
(2973, 51, '2022-09-30'),
(2974, 25, '2022-09-30'),
(2975, 21, '2022-09-30'),
(2976, 46, '2022-09-30'),
(2977, 55, '2022-09-30'),
(2978, 26, '2022-09-30'),
(2979, 44, '2022-10-01'),
(2980, 35, '2022-10-01'),
(2981, 35, '2022-10-01'),
(2982, 47, '2022-10-02'),
(2983, 8, '2022-10-02'),
(2984, 51, '2022-10-03'),
(2985, 53, '2022-10-03'),
(2986, 54, '2022-10-03'),
(2987, 54, '2022-10-03'),
(2988, 52, '2022-10-04'),
(2989, 55, '2022-10-04'),
(2990, 56, '2022-10-04'),
(2991, 57, '2022-10-04'),
(2992, 58, '2022-10-04'),
(2993, 58, '2022-10-04'),
(2994, 59, '2022-10-04'),
(2995, 59, '2022-10-04'),
(2996, 51, '2022-10-04'),
(2997, 51, '2022-10-04'),
(2998, 49, '2022-10-04'),
(2999, 50, '2022-10-04'),
(3000, 54, '2022-10-04'),
(3001, 60, '2022-10-04'),
(3002, 60, '2022-10-04'),
(3003, 40, '2022-10-04'),
(3004, 51, '2022-10-04'),
(3005, 51, '2022-10-04'),
(3006, 37, '2022-10-04'),
(3007, 37, '2022-10-04'),
(3008, 38, '2022-10-04'),
(3009, 49, '2022-10-04'),
(3010, 6, '2022-10-04'),
(3011, 52, '2022-10-04'),
(3012, 52, '2022-10-04'),
(3013, 55, '2022-10-04'),
(3014, 53, '2022-10-04'),
(3015, 31, '2022-10-04'),
(3016, 29, '2022-10-04'),
(3017, 24, '2022-10-04'),
(3018, 30, '2022-10-04'),
(3019, 25, '2022-10-04'),
(3020, 28, '2022-10-04'),
(3021, 36, '2022-10-04'),
(3022, 26, '2022-10-04'),
(3023, 39, '2022-10-04'),
(3024, 44, '2022-10-04'),
(3025, 44, '2022-10-04'),
(3026, 45, '2022-10-04'),
(3027, 54, '2022-10-04'),
(3028, 54, '2022-10-04'),
(3029, 21, '2022-10-04'),
(3030, 42, '2022-10-04'),
(3031, 42, '2022-10-04'),
(3032, 40, '2022-10-04'),
(3033, 41, '2022-10-04'),
(3034, 47, '2022-10-04'),
(3035, 15, '2022-10-04'),
(3036, 15, '2022-10-04'),
(3037, 48, '2022-10-04'),
(3038, 48, '2022-10-04'),
(3039, 27, '2022-10-05'),
(3040, 27, '2022-10-05'),
(3041, 32, '2022-10-05'),
(3042, 56, '2022-10-05'),
(3043, 25, '2022-10-05'),
(3044, 25, '2022-10-05'),
(3045, 26, '2022-10-05'),
(3046, 26, '2022-10-05'),
(3047, 34, '2022-10-05'),
(3048, 34, '2022-10-05'),
(3049, 46, '2022-10-05'),
(3050, 46, '2022-10-05'),
(3051, 48, '2022-10-05'),
(3052, 48, '2022-10-05'),
(3053, 33, '2022-10-05'),
(3054, 35, '2022-10-05'),
(3055, 35, '2022-10-05'),
(3056, 43, '2022-10-05'),
(3057, 43, '2022-10-05'),
(3058, 43, '2022-10-05'),
(3059, 50, '2022-10-05'),
(3060, 50, '2022-10-05'),
(3061, 23, '2022-10-05'),
(3062, 41, '2022-10-05'),
(3063, 44, '2022-10-05'),
(3064, 29, '2022-10-05'),
(3065, 59, '2022-10-05'),
(3066, 59, '2022-10-05'),
(3067, 34, '2022-10-05'),
(3068, 34, '2022-10-05'),
(3069, 38, '2022-10-05'),
(3070, 35, '2022-10-05'),
(3071, 35, '2022-10-05'),
(3072, 57, '2022-10-05'),
(3073, 57, '2022-10-05'),
(3074, 28, '2022-10-05'),
(3075, 28, '2022-10-05'),
(3076, 58, '2022-10-05'),
(3077, 42, '2022-10-05'),
(3078, 30, '2022-10-05'),
(3079, 14, '2022-10-05'),
(3080, 60, '2022-10-05'),
(3081, 60, '2022-10-05'),
(3082, 47, '2022-10-05'),
(3083, 24, '2022-10-05'),
(3084, 24, '2022-10-05'),
(3085, 45, '2022-10-05'),
(3086, 27, '2022-10-05'),
(3087, 27, '2022-10-05'),
(3088, 31, '2022-10-05'),
(3089, 46, '2022-10-05'),
(3090, 46, '2022-10-05'),
(3091, 32, '2022-10-05'),
(3092, 32, '2022-10-05'),
(3093, 39, '2022-10-05'),
(3094, 36, '2022-10-05'),
(3095, 23, '2022-10-05'),
(3096, 23, '2022-10-05'),
(3097, 37, '2022-10-05'),
(3098, 7, '2022-10-05'),
(3099, 9, '2022-10-05'),
(3100, 9, '2022-10-05'),
(3101, 8, '2022-10-05'),
(3102, 2, '2022-10-05'),
(3103, 2, '2022-10-05'),
(3104, 18, '2022-10-05'),
(3105, 10, '2022-10-05'),
(3106, 10, '2022-10-05'),
(3107, 2, '2022-10-05'),
(3108, 4, '2022-10-05'),
(3109, 7, '2022-10-05'),
(3110, 7, '2022-10-05'),
(3111, 5, '2022-10-05'),
(3112, 3, '2022-10-05'),
(3113, 3, '2022-10-05'),
(3114, 6, '2022-10-05'),
(3115, 6, '2022-10-05'),
(3116, 8, '2022-10-05'),
(3117, 14, '2022-10-05'),
(3118, 14, '2022-10-05'),
(3119, 3, '2022-10-05'),
(3120, 43, '2022-10-05'),
(3121, 31, '2022-10-05'),
(3122, 27, '2022-10-06'),
(3123, 12, '2022-10-06'),
(3124, 12, '2022-10-06'),
(3125, 13, '2022-10-06'),
(3126, 13, '2022-10-06'),
(3127, 40, '2022-10-06'),
(3128, 16, '2022-10-06'),
(3129, 19, '2022-10-06'),
(3130, 19, '2022-10-06'),
(3131, 17, '2022-10-06'),
(3132, 17, '2022-10-06'),
(3133, 18, '2022-10-06'),
(3134, 20, '2022-10-06'),
(3135, 21, '2022-10-06'),
(3136, 28, '2022-10-06'),
(3137, 39, '2022-10-06'),
(3138, 45, '2022-10-06'),
(3139, 47, '2022-10-06'),
(3140, 51, '2022-10-07'),
(3141, 12, '2022-10-07'),
(3142, 22, '2022-10-07'),
(3143, 53, '2022-10-07'),
(3144, 52, '2022-10-07'),
(3145, 54, '2022-10-07'),
(3146, 55, '2022-10-07'),
(3147, 55, '2022-10-07'),
(3148, 56, '2022-10-07'),
(3149, 56, '2022-10-07'),
(3150, 57, '2022-10-07'),
(3151, 58, '2022-10-07'),
(3152, 58, '2022-10-07'),
(3153, 59, '2022-10-07'),
(3154, 51, '2022-10-07'),
(3155, 49, '2022-10-07'),
(3156, 50, '2022-10-07'),
(3157, 52, '2022-10-07'),
(3158, 60, '2022-10-07'),
(3159, 55, '2022-10-07'),
(3160, 31, '2022-10-07'),
(3161, 53, '2022-10-07'),
(3162, 53, '2022-10-07'),
(3163, 29, '2022-10-07'),
(3164, 54, '2022-10-07'),
(3165, 30, '2022-10-07'),
(3166, 36, '2022-10-07'),
(3167, 59, '2022-10-07'),
(3168, 59, '2022-10-07'),
(3169, 37, '2022-10-07'),
(3170, 57, '2022-10-07'),
(3171, 38, '2022-10-07'),
(3172, 58, '2022-10-07'),
(3173, 32, '2022-10-07'),
(3174, 15, '2022-10-07'),
(3175, 56, '2022-10-07'),
(3176, 35, '2022-10-07'),
(3177, 49, '2022-10-07'),
(3178, 14, '2022-10-07'),
(3179, 14, '2022-10-07'),
(3180, 33, '2022-10-07'),
(3181, 50, '2022-10-07'),
(3182, 50, '2022-10-07'),
(3183, 34, '2022-10-07'),
(3184, 16, '2022-10-07'),
(3185, 51, '2022-10-07'),
(3186, 28, '2022-10-07'),
(3187, 25, '2022-10-07'),
(3188, 16, '2022-10-07'),
(3189, 39, '2022-10-07'),
(3190, 26, '2022-10-07'),
(3191, 27, '2022-10-07'),
(3192, 40, '2022-10-07'),
(3193, 40, '2022-10-07'),
(3194, 40, '2022-10-07'),
(3195, 40, '2022-10-07'),
(3196, 41, '2022-10-07'),
(3197, 44, '2022-10-07'),
(3198, 44, '2022-10-07'),
(3199, 45, '2022-10-07'),
(3200, 45, '2022-10-07'),
(3201, 46, '2022-10-07'),
(3202, 24, '2022-10-07'),
(3203, 25, '2022-10-07'),
(3204, 25, '2022-10-07'),
(3205, 26, '2022-10-07'),
(3206, 29, '2022-10-07'),
(3207, 29, '2022-10-07'),
(3208, 48, '2022-10-07'),
(3209, 43, '2022-10-07'),
(3210, 43, '2022-10-07'),
(3211, 23, '2022-10-07'),
(3212, 41, '2022-10-07'),
(3213, 48, '2022-10-07'),
(3214, 43, '2022-10-07'),
(3215, 28, '2022-10-07'),
(3216, 42, '2022-10-07'),
(3217, 42, '2022-10-07'),
(3218, 42, '2022-10-07'),
(3219, 33, '2022-10-07'),
(3220, 33, '2022-10-07'),
(3221, 47, '2022-10-07'),
(3222, 44, '2022-10-07'),
(3223, 34, '2022-10-07'),
(3224, 34, '2022-10-07'),
(3225, 24, '2022-10-07'),
(3226, 47, '2022-10-07'),
(3227, 45, '2022-10-07'),
(3228, 60, '2022-10-07'),
(3229, 46, '2022-10-07'),
(3230, 23, '2022-10-07'),
(3231, 27, '2022-10-07'),
(3232, 27, '2022-10-07'),
(3233, 30, '2022-10-07'),
(3234, 30, '2022-10-07'),
(3235, 32, '2022-10-07'),
(3236, 32, '2022-10-07'),
(3237, 7, '2022-10-07'),
(3238, 31, '2022-10-07'),
(3239, 9, '2022-10-07'),
(3240, 36, '2022-10-07'),
(3241, 37, '2022-10-07'),
(3242, 38, '2022-10-07'),
(3243, 57, '2022-10-07'),
(3244, 14, '2022-10-07'),
(3245, 54, '2022-10-07'),
(3246, 46, '2022-10-07'),
(3247, 10, '2022-10-07'),
(3248, 51, '2022-10-07'),
(3249, 30, '2022-10-07'),
(3250, 11, '2022-10-07'),
(3251, 53, '2022-10-07'),
(3252, 41, '2022-10-07'),
(3253, 48, '2022-10-07'),
(3254, 26, '2022-10-07'),
(3255, 31, '2022-10-07'),
(3256, 10, '2022-10-07'),
(3257, 10, '2022-10-07'),
(3258, 2, '2022-10-07'),
(3259, 2, '2022-10-07'),
(3260, 35, '2022-10-07'),
(3261, 35, '2022-10-07'),
(3262, 39, '2022-10-07'),
(3263, 8, '2022-10-07'),
(3264, 2, '2022-10-08'),
(3265, 3, '2022-10-08'),
(3266, 3, '2022-10-08'),
(3267, 4, '2022-10-08'),
(3268, 7, '2022-10-08'),
(3269, 5, '2022-10-08'),
(3270, 5, '2022-10-08'),
(3271, 2, '2022-10-08'),
(3272, 2, '2022-10-08'),
(3273, 6, '2022-10-08'),
(3274, 8, '2022-10-08'),
(3275, 14, '2022-10-08'),
(3276, 12, '2022-10-08'),
(3277, 12, '2022-10-08'),
(3278, 13, '2022-10-08'),
(3279, 3, '2022-10-08'),
(3280, 16, '2022-10-08'),
(3281, 16, '2022-10-08'),
(3282, 19, '2022-10-08'),
(3283, 17, '2022-10-08'),
(3284, 17, '2022-10-08'),
(3285, 18, '2022-10-08'),
(3286, 18, '2022-10-08'),
(3287, 20, '2022-10-08'),
(3288, 21, '2022-10-08'),
(3289, 16, '2022-10-08'),
(3290, 16, '2022-10-08'),
(3291, 19, '2022-10-08'),
(3292, 17, '2022-10-08'),
(3293, 18, '2022-10-08'),
(3294, 20, '2022-10-08'),
(3295, 13, '2022-10-08'),
(3296, 21, '2022-10-08'),
(3297, 21, '2022-10-08'),
(3298, 12, '2022-10-08'),
(3299, 45, '2022-10-08'),
(3300, 57, '2022-10-09'),
(3301, 24, '2022-10-09'),
(3302, 4, '2022-10-09'),
(3303, 58, '2022-10-09'),
(3304, 46, '2022-10-09'),
(3305, 37, '2022-10-09'),
(3306, 10, '2022-10-10'),
(3307, 13, '2022-10-10'),
(3308, 15, '2022-10-10'),
(3309, 49, '2022-10-10'),
(3310, 59, '2022-10-10'),
(3311, 28, '2022-10-10'),
(3312, 53, '2022-10-10'),
(3313, 43, '2022-10-10'),
(3314, 34, '2022-10-11'),
(3315, 60, '2022-10-11'),
(3316, 33, '2022-10-11'),
(3317, 44, '2022-10-11'),
(3318, 36, '2022-10-11'),
(3319, 51, '2022-10-11'),
(3320, 58, '2022-10-11'),
(3321, 8, '2022-10-11'),
(3322, 8, '2022-10-11'),
(3323, 54, '2022-10-11'),
(3324, 45, '2022-10-11'),
(3325, 32, '2022-10-11'),
(3326, 56, '2022-10-12'),
(3327, 55, '2022-10-12'),
(3328, 50, '2022-10-12'),
(3329, 47, '2022-10-12');
INSERT INTO `product_clicks` (`id`, `product_id`, `date`) VALUES
(3330, 33, '2022-10-13'),
(3331, 32, '2022-10-13'),
(3332, 56, '2022-10-13'),
(3333, 25, '2022-10-13'),
(3334, 16, '2022-10-13'),
(3335, 22, '2022-10-13'),
(3336, 31, '2022-10-13'),
(3337, 26, '2022-10-13'),
(3338, 19, '2022-10-13'),
(3339, 21, '2022-10-13'),
(3340, 23, '2022-10-13'),
(3341, 24, '2022-10-13'),
(3342, 17, '2022-10-13'),
(3343, 28, '2022-10-13'),
(3344, 18, '2022-10-13'),
(3345, 29, '2022-10-13'),
(3346, 20, '2022-10-13'),
(3347, 27, '2022-10-13'),
(3348, 18, '2022-10-13'),
(3349, 29, '2022-10-13'),
(3350, 26, '2022-10-13'),
(3351, 24, '2022-10-13'),
(3352, 20, '2022-10-13'),
(3353, 23, '2022-10-13'),
(3354, 27, '2022-10-13'),
(3355, 19, '2022-10-13'),
(3356, 25, '2022-10-13'),
(3357, 17, '2022-10-13'),
(3358, 16, '2022-10-13'),
(3359, 31, '2022-10-13'),
(3360, 28, '2022-10-13'),
(3361, 21, '2022-10-13'),
(3362, 22, '2022-10-13'),
(3363, 10, '2022-10-14'),
(3364, 3, '2022-10-14'),
(3365, 16, '2022-10-15'),
(3366, 11, '2022-10-15'),
(3367, 2, '2022-10-15'),
(3368, 6, '2022-10-15'),
(3369, 22, '2022-10-15'),
(3370, 51, '2022-10-15'),
(3371, 49, '2022-10-15'),
(3372, 51, '2022-10-16'),
(3373, 8, '2022-10-16'),
(3374, 58, '2022-10-16'),
(3375, 49, '2022-10-16'),
(3376, 59, '2022-10-16'),
(3377, 57, '2022-10-16'),
(3378, 24, '2022-10-16'),
(3379, 26, '2022-10-16'),
(3380, 16, '2022-10-16'),
(3381, 49, '2022-10-16'),
(3382, 56, '2022-10-16'),
(3383, 47, '2022-10-16'),
(3384, 51, '2022-10-16'),
(3385, 50, '2022-10-17'),
(3386, 13, '2022-10-17'),
(3387, 35, '2022-10-17'),
(3388, 3, '2022-10-17'),
(3389, 47, '2022-10-17'),
(3390, 9, '2022-10-17'),
(3391, 32, '2022-10-17'),
(3392, 3, '2022-10-17'),
(3393, 33, '2022-10-17'),
(3394, 60, '2022-10-17'),
(3395, 59, '2022-10-17'),
(3396, 5, '2022-10-17'),
(3397, 5, '2022-10-17'),
(3398, 47, '2022-10-17'),
(3399, 40, '2022-10-17'),
(3400, 38, '2022-10-17'),
(3401, 29, '2022-10-17'),
(3402, 53, '2022-10-18'),
(3403, 58, '2022-10-18'),
(3404, 36, '2022-10-18'),
(3405, 33, '2022-10-18'),
(3406, 39, '2022-10-18'),
(3407, 17, '2022-10-18'),
(3408, 7, '2022-10-18'),
(3409, 31, '2022-10-18'),
(3410, 8, '2022-10-18'),
(3411, 25, '2022-10-18'),
(3412, 55, '2022-10-18'),
(3413, 55, '2022-10-18'),
(3414, 3, '2022-10-18'),
(3415, 8, '2022-10-18'),
(3416, 52, '2022-10-18'),
(3417, 3, '2022-10-18'),
(3418, 44, '2022-10-18'),
(3419, 22, '2022-10-18'),
(3420, 48, '2022-10-18'),
(3421, 54, '2022-10-18'),
(3422, 34, '2022-10-18'),
(3423, 44, '2022-10-19'),
(3424, 28, '2022-10-19'),
(3425, 19, '2022-10-19'),
(3426, 21, '2022-10-19'),
(3427, 7, '2022-10-19'),
(3428, 45, '2022-10-19'),
(3429, 37, '2022-10-19'),
(3430, 41, '2022-10-20'),
(3431, 4, '2022-10-20'),
(3432, 43, '2022-10-20'),
(3433, 5, '2022-10-20'),
(3434, 26, '2022-10-20'),
(3435, 23, '2022-10-20'),
(3436, 12, '2022-10-21'),
(3437, 23, '2022-10-21'),
(3438, 25, '2022-10-21'),
(3439, 3, '2022-10-21'),
(3440, 35, '2022-10-21'),
(3441, 6, '2022-10-21'),
(3442, 12, '2022-10-21'),
(3443, 42, '2022-10-21'),
(3444, 8, '2022-10-22'),
(3445, 27, '2022-10-22'),
(3446, 8, '2022-10-22'),
(3447, 40, '2022-10-22'),
(3448, 5, '2022-10-22'),
(3449, 12, '2022-10-22'),
(3450, 16, '2022-10-22'),
(3451, 16, '2022-10-22'),
(3452, 19, '2022-10-22'),
(3453, 17, '2022-10-22'),
(3454, 17, '2022-10-22'),
(3455, 18, '2022-10-22'),
(3456, 20, '2022-10-22'),
(3457, 21, '2022-10-22'),
(3458, 13, '2022-10-22'),
(3459, 16, '2022-10-22'),
(3460, 19, '2022-10-22'),
(3461, 19, '2022-10-22'),
(3462, 17, '2022-10-22'),
(3463, 18, '2022-10-22'),
(3464, 20, '2022-10-22'),
(3465, 21, '2022-10-22'),
(3466, 21, '2022-10-22'),
(3467, 13, '2022-10-22'),
(3468, 13, '2022-10-22'),
(3469, 12, '2022-10-22'),
(3470, 12, '2022-10-22'),
(3471, 8, '2022-10-23'),
(3472, 7, '2022-10-23'),
(3473, 60, '2022-10-23'),
(3474, 5, '2022-10-23'),
(3475, 59, '2022-10-23'),
(3476, 3, '2022-10-23'),
(3477, 4, '2022-10-23'),
(3478, 58, '2022-10-23'),
(3479, 2, '2022-10-23'),
(3480, 6, '2022-10-23'),
(3481, 57, '2022-10-23'),
(3482, 11, '2022-10-23'),
(3483, 15, '2022-10-23'),
(3484, 56, '2022-10-23'),
(3485, 10, '2022-10-23'),
(3486, 14, '2022-10-23'),
(3487, 55, '2022-10-23'),
(3488, 9, '2022-10-23'),
(3489, 54, '2022-10-23'),
(3490, 53, '2022-10-23'),
(3491, 52, '2022-10-23'),
(3492, 51, '2022-10-23'),
(3493, 50, '2022-10-23'),
(3494, 49, '2022-10-23'),
(3495, 12, '2022-10-23'),
(3496, 13, '2022-10-23'),
(3497, 16, '2022-10-23'),
(3498, 17, '2022-10-23'),
(3499, 18, '2022-10-23'),
(3500, 19, '2022-10-23'),
(3501, 20, '2022-10-23'),
(3502, 21, '2022-10-23'),
(3503, 39, '2022-10-23'),
(3504, 22, '2022-10-23'),
(3505, 38, '2022-10-23'),
(3506, 23, '2022-10-23'),
(3507, 37, '2022-10-23'),
(3508, 24, '2022-10-23'),
(3509, 36, '2022-10-23'),
(3510, 25, '2022-10-23'),
(3511, 35, '2022-10-23'),
(3512, 48, '2022-10-23'),
(3513, 26, '2022-10-23'),
(3514, 34, '2022-10-23'),
(3515, 47, '2022-10-23'),
(3516, 27, '2022-10-23'),
(3517, 33, '2022-10-23'),
(3518, 46, '2022-10-23'),
(3519, 28, '2022-10-23'),
(3520, 32, '2022-10-23'),
(3521, 45, '2022-10-23'),
(3522, 29, '2022-10-23'),
(3523, 31, '2022-10-23'),
(3524, 44, '2022-10-23'),
(3525, 30, '2022-10-23'),
(3526, 43, '2022-10-23'),
(3527, 42, '2022-10-23'),
(3528, 41, '2022-10-23'),
(3529, 40, '2022-10-23'),
(3530, 47, '2022-10-23'),
(3531, 38, '2022-10-23'),
(3532, 56, '2022-10-23'),
(3533, 40, '2022-10-23'),
(3534, 11, '2022-10-23'),
(3535, 39, '2022-10-23'),
(3536, 22, '2022-10-23'),
(3537, 51, '2022-10-24'),
(3538, 16, '2022-10-24'),
(3539, 53, '2022-10-24'),
(3540, 22, '2022-10-24'),
(3541, 22, '2022-10-24'),
(3542, 20, '2022-10-25'),
(3543, 48, '2022-10-25'),
(3544, 58, '2022-10-26'),
(3545, 45, '2022-10-26'),
(3546, 9, '2022-10-26'),
(3547, 47, '2022-10-26'),
(3548, 53, '2022-10-26'),
(3549, 52, '2022-10-26'),
(3550, 54, '2022-10-26'),
(3551, 57, '2022-10-26'),
(3552, 57, '2022-10-26'),
(3553, 51, '2022-10-26'),
(3554, 51, '2022-10-26'),
(3555, 59, '2022-10-27'),
(3556, 58, '2022-10-27'),
(3557, 55, '2022-10-27'),
(3558, 49, '2022-10-27'),
(3559, 50, '2022-10-27'),
(3560, 56, '2022-10-27'),
(3561, 52, '2022-10-27'),
(3562, 60, '2022-10-27'),
(3563, 55, '2022-10-27'),
(3564, 15, '2022-10-27'),
(3565, 15, '2022-10-27'),
(3566, 58, '2022-10-27'),
(3567, 53, '2022-10-27'),
(3568, 59, '2022-10-27'),
(3569, 59, '2022-10-27'),
(3570, 56, '2022-10-27'),
(3571, 14, '2022-10-27'),
(3572, 49, '2022-10-27'),
(3573, 54, '2022-10-27'),
(3574, 50, '2022-10-27'),
(3575, 50, '2022-10-27'),
(3576, 57, '2022-10-27'),
(3577, 7, '2022-10-27'),
(3578, 9, '2022-10-27'),
(3579, 8, '2022-10-27'),
(3580, 10, '2022-10-27'),
(3581, 10, '2022-10-27'),
(3582, 31, '2022-10-27'),
(3583, 31, '2022-10-27'),
(3584, 30, '2022-10-27'),
(3585, 36, '2022-10-27'),
(3586, 2, '2022-10-27'),
(3587, 32, '2022-10-27'),
(3588, 37, '2022-10-27'),
(3589, 35, '2022-10-27'),
(3590, 3, '2022-10-27'),
(3591, 31, '2022-10-27'),
(3592, 54, '2022-10-27'),
(3593, 33, '2022-10-27'),
(3594, 33, '2022-10-27'),
(3595, 34, '2022-10-27'),
(3596, 34, '2022-10-27'),
(3597, 34, '2022-10-27'),
(3598, 6, '2022-10-27'),
(3599, 28, '2022-10-27'),
(3600, 28, '2022-10-27'),
(3601, 7, '2022-10-27'),
(3602, 7, '2022-10-27'),
(3603, 5, '2022-10-27'),
(3604, 40, '2022-10-27'),
(3605, 39, '2022-10-27'),
(3606, 6, '2022-10-28'),
(3607, 6, '2022-10-28'),
(3608, 8, '2022-10-28'),
(3609, 29, '2022-10-28'),
(3610, 38, '2022-10-28'),
(3611, 44, '2022-10-28'),
(3612, 44, '2022-10-28'),
(3613, 43, '2022-10-28'),
(3614, 45, '2022-10-28'),
(3615, 45, '2022-10-28'),
(3616, 40, '2022-10-28'),
(3617, 46, '2022-10-28'),
(3618, 41, '2022-10-28'),
(3619, 41, '2022-10-28'),
(3620, 44, '2022-10-28'),
(3621, 44, '2022-10-28'),
(3622, 60, '2022-10-28'),
(3623, 48, '2022-10-28'),
(3624, 43, '2022-10-28'),
(3625, 47, '2022-10-28'),
(3626, 45, '2022-10-28'),
(3627, 42, '2022-10-28'),
(3628, 26, '2022-10-28'),
(3629, 26, '2022-10-28'),
(3630, 27, '2022-10-28'),
(3631, 42, '2022-10-28'),
(3632, 42, '2022-10-28'),
(3633, 46, '2022-10-28'),
(3634, 4, '2022-10-28'),
(3635, 25, '2022-10-28'),
(3636, 47, '2022-10-28'),
(3637, 29, '2022-10-28'),
(3638, 29, '2022-10-28'),
(3639, 51, '2022-10-28'),
(3640, 41, '2022-10-28'),
(3641, 2, '2022-10-28'),
(3642, 2, '2022-10-28'),
(3643, 14, '2022-10-28'),
(3644, 3, '2022-10-28'),
(3645, 24, '2022-10-28'),
(3646, 24, '2022-10-28'),
(3647, 25, '2022-10-28'),
(3648, 25, '2022-10-28'),
(3649, 26, '2022-10-28'),
(3650, 26, '2022-10-28'),
(3651, 28, '2022-10-28'),
(3652, 23, '2022-10-28'),
(3653, 34, '2022-10-28'),
(3654, 34, '2022-10-28'),
(3655, 27, '2022-10-28'),
(3656, 33, '2022-10-28'),
(3657, 32, '2022-10-28'),
(3658, 31, '2022-10-28'),
(3659, 31, '2022-10-28'),
(3660, 36, '2022-10-28'),
(3661, 37, '2022-10-28'),
(3662, 35, '2022-10-28'),
(3663, 38, '2022-10-28'),
(3664, 39, '2022-10-28'),
(3665, 30, '2022-10-28'),
(3666, 23, '2022-10-28'),
(3667, 48, '2022-10-28'),
(3668, 13, '2022-10-29'),
(3669, 12, '2022-10-29'),
(3670, 22, '2022-10-29'),
(3671, 5, '2022-10-29'),
(3672, 11, '2022-10-29'),
(3673, 36, '2022-10-29'),
(3674, 44, '2022-10-30'),
(3675, 23, '2022-10-30'),
(3676, 21, '2022-10-30'),
(3677, 15, '2022-10-30'),
(3678, 59, '2022-10-30'),
(3679, 2, '2022-10-30'),
(3680, 27, '2022-10-30'),
(3681, 8, '2022-10-30'),
(3682, 53, '2022-10-30'),
(3683, 24, '2022-10-31'),
(3684, 48, '2022-10-31'),
(3685, 46, '2022-10-31'),
(3686, 40, '2022-10-31'),
(3687, 14, '2022-10-31'),
(3688, 3, '2022-10-31'),
(3689, 56, '2022-10-31'),
(3690, 28, '2022-10-31'),
(3691, 9, '2022-10-31'),
(3692, 29, '2022-10-31'),
(3693, 47, '2022-10-31'),
(3694, 47, '2022-10-31'),
(3695, 35, '2022-10-31'),
(3696, 4, '2022-10-31'),
(3697, 19, '2022-10-31'),
(3698, 50, '2022-10-31'),
(3699, 57, '2022-10-31'),
(3700, 26, '2022-11-01'),
(3701, 13, '2022-11-01'),
(3702, 51, '2022-11-01'),
(3703, 60, '2022-11-01'),
(3704, 58, '2022-11-01'),
(3705, 10, '2022-11-01'),
(3706, 18, '2022-11-01'),
(3707, 10, '2022-11-01'),
(3708, 31, '2022-11-01'),
(3709, 37, '2022-11-01'),
(3710, 55, '2022-11-02'),
(3711, 20, '2022-11-02'),
(3712, 53, '2022-11-03'),
(3713, 41, '2022-11-03'),
(3714, 33, '2022-11-03'),
(3715, 54, '2022-11-03'),
(3716, 27, '2022-11-03'),
(3717, 19, '2022-11-03'),
(3718, 52, '2022-11-03'),
(3719, 5, '2022-11-03'),
(3720, 55, '2022-11-03'),
(3721, 58, '2022-11-03'),
(3722, 33, '2022-11-03'),
(3723, 22, '2022-11-03'),
(3724, 22, '2022-11-03'),
(3725, 3, '2022-11-03'),
(3726, 16, '2022-11-03'),
(3727, 43, '2022-11-03'),
(3728, 57, '2022-11-03'),
(3729, 7, '2022-11-03'),
(3730, 49, '2022-11-03'),
(3731, 34, '2022-11-03'),
(3732, 52, '2022-11-04'),
(3733, 60, '2022-11-04'),
(3734, 41, '2022-11-04'),
(3735, 23, '2022-11-04'),
(3736, 58, '2022-11-04'),
(3737, 6, '2022-11-05'),
(3738, 18, '2022-11-05'),
(3739, 43, '2022-11-05'),
(3740, 55, '2022-11-05'),
(3741, 21, '2022-11-05'),
(3742, 17, '2022-11-05'),
(3743, 48, '2022-11-05'),
(3744, 28, '2022-11-05'),
(3745, 32, '2022-11-05'),
(3746, 42, '2022-11-05'),
(3747, 44, '2022-11-05'),
(3748, 46, '2022-11-05'),
(3749, 2, '2022-11-05'),
(3750, 43, '2022-11-05'),
(3751, 45, '2022-11-05'),
(3752, 57, '2022-11-05'),
(3753, 11, '2022-11-05'),
(3754, 12, '2022-11-05'),
(3755, 16, '2022-11-05'),
(3756, 19, '2022-11-06'),
(3757, 17, '2022-11-06'),
(3758, 18, '2022-11-06'),
(3759, 20, '2022-11-06'),
(3760, 21, '2022-11-06'),
(3761, 58, '2022-11-06'),
(3762, 13, '2022-11-06'),
(3763, 13, '2022-11-06'),
(3764, 39, '2022-11-06'),
(3765, 16, '2022-11-06'),
(3766, 19, '2022-11-06'),
(3767, 19, '2022-11-06'),
(3768, 17, '2022-11-06'),
(3769, 18, '2022-11-06'),
(3770, 51, '2022-11-06'),
(3771, 20, '2022-11-06'),
(3772, 58, '2022-11-06'),
(3773, 21, '2022-11-06'),
(3774, 30, '2022-11-06'),
(3775, 12, '2022-11-07'),
(3776, 13, '2022-11-07'),
(3777, 25, '2022-11-07'),
(3778, 26, '2022-11-07'),
(3779, 16, '2022-11-07'),
(3780, 24, '2022-11-07'),
(3781, 27, '2022-11-07'),
(3782, 16, '2022-11-07'),
(3783, 27, '2022-11-07'),
(3784, 26, '2022-11-07'),
(3785, 24, '2022-11-07'),
(3786, 25, '2022-11-07'),
(3787, 59, '2022-11-08'),
(3788, 21, '2022-11-10'),
(3789, 31, '2022-11-10'),
(3790, 26, '2022-11-10'),
(3791, 23, '2022-11-10'),
(3792, 56, '2022-11-10'),
(3793, 7, '2022-11-10'),
(3794, 29, '2022-11-10'),
(3795, 22, '2022-11-10'),
(3796, 55, '2022-11-10'),
(3797, 60, '2022-11-10'),
(3798, 10, '2022-11-10'),
(3799, 20, '2022-11-10'),
(3800, 57, '2022-11-10'),
(3801, 40, '2022-11-11'),
(3802, 26, '2022-11-11'),
(3803, 6, '2022-11-11'),
(3804, 15, '2022-11-11'),
(3805, 4, '2022-11-12'),
(3806, 35, '2022-11-12'),
(3807, 38, '2022-11-12'),
(3808, 45, '2022-11-12'),
(3809, 10, '2022-11-12'),
(3810, 35, '2022-11-12'),
(3811, 39, '2022-11-12'),
(3812, 46, '2022-11-12'),
(3813, 22, '2022-11-12'),
(3814, 59, '2022-11-12'),
(3815, 21, '2022-11-12'),
(3816, 13, '2022-11-12'),
(3817, 57, '2022-11-12'),
(3818, 18, '2022-11-12'),
(3819, 9, '2022-11-12'),
(3820, 46, '2022-11-12'),
(3821, 49, '2022-11-12'),
(3822, 2, '2022-11-12'),
(3823, 39, '2022-11-12'),
(3824, 15, '2022-11-12'),
(3825, 28, '2022-11-12'),
(3826, 5, '2022-11-12'),
(3827, 30, '2022-11-12'),
(3828, 49, '2022-11-12'),
(3829, 53, '2022-11-12'),
(3830, 4, '2022-11-12'),
(3831, 13, '2022-11-13'),
(3832, 22, '2022-11-13'),
(3833, 12, '2022-11-13'),
(3834, 10, '2022-11-13'),
(3835, 5, '2022-11-13'),
(3836, 48, '2022-11-13'),
(3837, 28, '2022-11-13'),
(3838, 41, '2022-11-13'),
(3839, 14, '2022-11-14'),
(3840, 12, '2022-11-14'),
(3841, 44, '2022-11-14'),
(3842, 31, '2022-11-14'),
(3843, 24, '2022-11-14'),
(3844, 8, '2022-11-14'),
(3845, 24, '2022-11-14'),
(3846, 56, '2022-11-14'),
(3847, 6, '2022-11-14'),
(3848, 58, '2022-11-14'),
(3849, 29, '2022-11-15'),
(3850, 29, '2022-11-15'),
(3851, 49, '2022-11-15'),
(3852, 14, '2022-11-15'),
(3853, 53, '2022-11-15'),
(3854, 53, '2022-11-15'),
(3855, 52, '2022-11-15'),
(3856, 18, '2022-11-15'),
(3857, 54, '2022-11-15'),
(3858, 57, '2022-11-15'),
(3859, 57, '2022-11-15'),
(3860, 51, '2022-11-15'),
(3861, 59, '2022-11-15'),
(3862, 59, '2022-11-15'),
(3863, 58, '2022-11-15'),
(3864, 55, '2022-11-15'),
(3865, 12, '2022-11-15'),
(3866, 49, '2022-11-16'),
(3867, 50, '2022-11-16'),
(3868, 50, '2022-11-16'),
(3869, 56, '2022-11-16'),
(3870, 10, '2022-11-16'),
(3871, 47, '2022-11-16'),
(3872, 38, '2022-11-16'),
(3873, 10, '2022-11-16'),
(3874, 35, '2022-11-16'),
(3875, 40, '2022-11-16'),
(3876, 16, '2022-11-16'),
(3877, 25, '2022-11-16'),
(3878, 50, '2022-11-16'),
(3879, 47, '2022-11-16'),
(3880, 30, '2022-11-16'),
(3881, 13, '2022-11-16'),
(3882, 16, '2022-11-16'),
(3883, 53, '2022-11-17'),
(3884, 49, '2022-11-17'),
(3885, 7, '2022-11-17'),
(3886, 57, '2022-11-17'),
(3887, 2, '2022-11-17'),
(3888, 50, '2022-11-17'),
(3889, 54, '2022-11-17'),
(3890, 59, '2022-11-17'),
(3891, 3, '2022-11-17'),
(3892, 52, '2022-11-17'),
(3893, 14, '2022-11-17'),
(3894, 23, '2022-11-17'),
(3895, 60, '2022-11-17'),
(3896, 15, '2022-11-17'),
(3897, 7, '2022-11-17'),
(3898, 10, '2022-11-17'),
(3899, 12, '2022-11-17'),
(3900, 9, '2022-11-17'),
(3901, 9, '2022-11-17'),
(3902, 10, '2022-11-17'),
(3903, 8, '2022-11-17'),
(3904, 58, '2022-11-17'),
(3905, 5, '2022-11-17'),
(3906, 56, '2022-11-17'),
(3907, 39, '2022-11-17'),
(3908, 8, '2022-11-17'),
(3909, 6, '2022-11-17'),
(3910, 4, '2022-11-17'),
(3911, 41, '2022-11-17'),
(3912, 19, '2022-11-17'),
(3913, 26, '2022-11-17'),
(3914, 30, '2022-11-17'),
(3915, 13, '2022-11-17'),
(3916, 3, '2022-11-17'),
(3917, 2, '2022-11-17'),
(3918, 31, '2022-11-17'),
(3919, 33, '2022-11-17'),
(3920, 33, '2022-11-17'),
(3921, 40, '2022-11-17'),
(3922, 39, '2022-11-17'),
(3923, 60, '2022-11-17'),
(3924, 60, '2022-11-17'),
(3925, 43, '2022-11-17'),
(3926, 43, '2022-11-17'),
(3927, 43, '2022-11-17'),
(3928, 42, '2022-11-17'),
(3929, 44, '2022-11-17'),
(3930, 35, '2022-11-18'),
(3931, 46, '2022-11-18'),
(3932, 29, '2022-11-18'),
(3933, 57, '2022-11-18'),
(3934, 48, '2022-11-18'),
(3935, 29, '2022-11-18'),
(3936, 51, '2022-11-18'),
(3937, 42, '2022-11-18'),
(3938, 42, '2022-11-18'),
(3939, 30, '2022-11-18'),
(3940, 30, '2022-11-18'),
(3941, 34, '2022-11-18'),
(3942, 14, '2022-11-18'),
(3943, 14, '2022-11-18'),
(3944, 32, '2022-11-18'),
(3945, 47, '2022-11-18'),
(3946, 47, '2022-11-18'),
(3947, 41, '2022-11-18'),
(3948, 45, '2022-11-18'),
(3949, 47, '2022-11-18'),
(3950, 46, '2022-11-18'),
(3951, 45, '2022-11-18'),
(3952, 36, '2022-11-18'),
(3953, 26, '2022-11-18'),
(3954, 2, '2022-11-18'),
(3955, 27, '2022-11-18'),
(3956, 60, '2022-11-18'),
(3957, 60, '2022-11-18'),
(3958, 28, '2022-11-18'),
(3959, 4, '2022-11-18'),
(3960, 4, '2022-11-18'),
(3961, 25, '2022-11-18'),
(3962, 37, '2022-11-18'),
(3963, 37, '2022-11-18'),
(3964, 55, '2022-11-18'),
(3965, 40, '2022-11-18'),
(3966, 3, '2022-11-18'),
(3967, 24, '2022-11-18'),
(3968, 25, '2022-11-18'),
(3969, 13, '2022-11-18'),
(3970, 3, '2022-11-18'),
(3971, 6, '2022-11-18'),
(3972, 32, '2022-11-18'),
(3973, 48, '2022-11-18'),
(3974, 42, '2022-11-18'),
(3975, 51, '2022-11-18'),
(3976, 34, '2022-11-18'),
(3977, 44, '2022-11-18'),
(3978, 36, '2022-11-18'),
(3979, 24, '2022-11-18'),
(3980, 28, '2022-11-18'),
(3981, 26, '2022-11-18'),
(3982, 44, '2022-11-18'),
(3983, 34, '2022-11-18'),
(3984, 27, '2022-11-18'),
(3985, 33, '2022-11-18'),
(3986, 23, '2022-11-18'),
(3987, 32, '2022-11-18'),
(3988, 31, '2022-11-18'),
(3989, 41, '2022-11-18'),
(3990, 36, '2022-11-18'),
(3991, 37, '2022-11-18'),
(3992, 48, '2022-11-18'),
(3993, 38, '2022-11-18'),
(3994, 39, '2022-11-18'),
(3995, 30, '2022-11-18'),
(3996, 35, '2022-11-18'),
(3997, 23, '2022-11-18'),
(3998, 13, '2022-11-19'),
(3999, 9, '2022-11-19'),
(4000, 5, '2022-11-19'),
(4001, 14, '2022-11-19'),
(4002, 55, '2022-11-19'),
(4003, 14, '2022-11-19'),
(4004, 37, '2022-11-19'),
(4005, 30, '2022-11-19'),
(4006, 5, '2022-11-19'),
(4007, 38, '2022-11-20'),
(4008, 4, '2022-11-20'),
(4009, 6, '2022-11-20'),
(4010, 11, '2022-11-20'),
(4011, 43, '2022-11-20'),
(4012, 17, '2022-11-20'),
(4013, 20, '2022-11-20'),
(4014, 8, '2022-11-20'),
(4015, 59, '2022-11-20'),
(4016, 37, '2022-11-20'),
(4017, 14, '2022-11-20'),
(4018, 4, '2022-11-20'),
(4019, 45, '2022-11-20'),
(4020, 15, '2022-11-20'),
(4021, 12, '2022-11-20'),
(4022, 16, '2022-11-20'),
(4023, 19, '2022-11-20'),
(4024, 17, '2022-11-20'),
(4025, 18, '2022-11-20'),
(4026, 20, '2022-11-20'),
(4027, 21, '2022-11-20'),
(4028, 13, '2022-11-20'),
(4029, 16, '2022-11-20'),
(4030, 19, '2022-11-20'),
(4031, 17, '2022-11-20'),
(4032, 18, '2022-11-20'),
(4033, 20, '2022-11-21'),
(4034, 21, '2022-11-21'),
(4035, 22, '2022-11-21'),
(4036, 6, '2022-11-21'),
(4037, 12, '2022-11-21'),
(4038, 41, '2022-11-21'),
(4039, 12, '2022-11-21'),
(4040, 44, '2022-11-21'),
(4041, 13, '2022-11-21'),
(4042, 58, '2022-11-21'),
(4043, 27, '2022-11-22'),
(4044, 40, '2022-11-22'),
(4045, 14, '2022-11-22'),
(4046, 24, '2022-11-22'),
(4047, 60, '2022-11-22'),
(4048, 12, '2022-11-22'),
(4049, 53, '2022-11-22'),
(4050, 49, '2022-11-22'),
(4051, 5, '2022-11-22'),
(4052, 28, '2022-11-22'),
(4053, 60, '2022-11-22'),
(4054, 13, '2022-11-23'),
(4055, 8, '2022-11-23'),
(4056, 27, '2022-11-24'),
(4057, 55, '2022-11-24'),
(4058, 39, '2022-11-24'),
(4059, 48, '2022-11-24'),
(4060, 18, '2022-11-24'),
(4061, 3, '2022-11-24'),
(4062, 37, '2022-11-24'),
(4063, 59, '2022-11-24'),
(4064, 4, '2022-11-25'),
(4065, 24, '2022-11-25'),
(4066, 45, '2022-11-25'),
(4067, 10, '2022-11-25'),
(4068, 45, '2022-11-25'),
(4069, 15, '2022-11-26'),
(4070, 36, '2022-11-26'),
(4071, 38, '2022-11-26'),
(4072, 46, '2022-11-26'),
(4073, 28, '2022-11-27'),
(4074, 5, '2022-11-27'),
(4075, 29, '2022-11-27'),
(4076, 41, '2022-11-27'),
(4077, 9, '2022-11-27'),
(4078, 6, '2022-11-27'),
(4079, 2, '2022-11-27'),
(4080, 30, '2022-11-28'),
(4081, 58, '2022-11-28'),
(4082, 26, '2022-11-28'),
(4083, 49, '2022-11-28'),
(4084, 10, '2022-11-28'),
(4085, 53, '2022-11-28'),
(4086, 39, '2022-11-29'),
(4087, 60, '2022-11-29'),
(4088, 13, '2022-11-30'),
(4089, 55, '2022-11-30'),
(4090, 22, '2022-12-01'),
(4091, 22, '2022-12-01'),
(4092, 14, '2022-12-01'),
(4093, 3, '2022-12-01'),
(4094, 48, '2022-12-01'),
(4095, 12, '2022-12-01'),
(4096, 18, '2022-12-01'),
(4097, 37, '2022-12-01'),
(4098, 38, '2022-12-01'),
(4099, 45, '2022-12-02'),
(4100, 46, '2022-12-02'),
(4101, 16, '2022-12-02'),
(4102, 28, '2022-12-02'),
(4103, 19, '2022-12-02'),
(4104, 8, '2022-12-02'),
(4105, 42, '2022-12-02'),
(4106, 9, '2022-12-03'),
(4107, 29, '2022-12-03'),
(4108, 10, '2022-12-03'),
(4109, 47, '2022-12-03'),
(4110, 3, '2022-12-03'),
(4111, 10, '2022-12-03'),
(4112, 43, '2022-12-04'),
(4113, 31, '2022-12-04'),
(4114, 30, '2022-12-04'),
(4115, 52, '2022-12-05'),
(4116, 54, '2022-12-05'),
(4117, 57, '2022-12-05'),
(4118, 6, '2022-12-05'),
(4119, 51, '2022-12-05'),
(4120, 51, '2022-12-05'),
(4121, 55, '2022-12-05'),
(4122, 59, '2022-12-05'),
(4123, 53, '2022-12-05'),
(4124, 58, '2022-12-05'),
(4125, 56, '2022-12-05'),
(4126, 49, '2022-12-05'),
(4127, 50, '2022-12-05'),
(4128, 60, '2022-12-05'),
(4129, 13, '2022-12-06'),
(4130, 13, '2022-12-06'),
(4131, 18, '2022-12-06'),
(4132, 16, '2022-12-06'),
(4133, 20, '2022-12-06'),
(4134, 21, '2022-12-06'),
(4135, 21, '2022-12-06'),
(4136, 19, '2022-12-06'),
(4137, 23, '2022-12-06'),
(4138, 4, '2022-12-07'),
(4139, 8, '2022-12-07'),
(4140, 20, '2022-12-07'),
(4141, 49, '2022-12-07'),
(4142, 3, '2022-12-07'),
(4143, 56, '2022-12-07'),
(4144, 52, '2022-12-07'),
(4145, 57, '2022-12-07'),
(4146, 7, '2022-12-07'),
(4147, 15, '2022-12-07'),
(4148, 15, '2022-12-07'),
(4149, 19, '2022-12-07'),
(4150, 16, '2022-12-07'),
(4151, 6, '2022-12-07'),
(4152, 9, '2022-12-07'),
(4153, 2, '2022-12-07'),
(4154, 21, '2022-12-07'),
(4155, 41, '2022-12-07'),
(4156, 5, '2022-12-07'),
(4157, 17, '2022-12-07'),
(4158, 3, '2022-12-07'),
(4159, 53, '2022-12-07'),
(4160, 14, '2022-12-07'),
(4161, 58, '2022-12-07'),
(4162, 50, '2022-12-07'),
(4163, 10, '2022-12-07'),
(4164, 54, '2022-12-07'),
(4165, 8, '2022-12-07'),
(4166, 13, '2022-12-07'),
(4167, 59, '2022-12-07'),
(4168, 7, '2022-12-07'),
(4169, 18, '2022-12-07'),
(4170, 12, '2022-12-07'),
(4171, 29, '2022-12-07'),
(4172, 29, '2022-12-07'),
(4173, 12, '2022-12-07'),
(4174, 60, '2022-12-07'),
(4175, 43, '2022-12-07'),
(4176, 42, '2022-12-08'),
(4177, 51, '2022-12-08'),
(4178, 51, '2022-12-08'),
(4179, 33, '2022-12-08'),
(4180, 40, '2022-12-08'),
(4181, 40, '2022-12-08'),
(4182, 60, '2022-12-08'),
(4183, 43, '2022-12-08'),
(4184, 55, '2022-12-08'),
(4185, 44, '2022-12-08'),
(4186, 44, '2022-12-08'),
(4187, 46, '2022-12-08'),
(4188, 39, '2022-12-08'),
(4189, 4, '2022-12-08'),
(4190, 42, '2022-12-08'),
(4191, 45, '2022-12-08'),
(4192, 2, '2022-12-08'),
(4193, 48, '2022-12-08'),
(4194, 35, '2022-12-08'),
(4195, 47, '2022-12-08'),
(4196, 30, '2022-12-08'),
(4197, 30, '2022-12-08'),
(4198, 14, '2022-12-08'),
(4199, 40, '2022-12-08'),
(4200, 46, '2022-12-08'),
(4201, 45, '2022-12-08'),
(4202, 36, '2022-12-08'),
(4203, 31, '2022-12-08'),
(4204, 34, '2022-12-08'),
(4205, 47, '2022-12-08'),
(4206, 32, '2022-12-08'),
(4207, 28, '2022-12-08'),
(4208, 28, '2022-12-08'),
(4209, 37, '2022-12-08'),
(4210, 2, '2022-12-08'),
(4211, 2, '2022-12-08'),
(4212, 41, '2022-12-08'),
(4213, 59, '2022-12-08'),
(4214, 8, '2022-12-08'),
(4215, 26, '2022-12-08'),
(4216, 26, '2022-12-08'),
(4217, 27, '2022-12-08'),
(4218, 29, '2022-12-08'),
(4219, 25, '2022-12-08'),
(4220, 25, '2022-12-08'),
(4221, 29, '2022-12-08'),
(4222, 17, '2022-12-08'),
(4223, 42, '2022-12-08'),
(4224, 3, '2022-12-08'),
(4225, 17, '2022-12-08'),
(4226, 28, '2022-12-08'),
(4227, 24, '2022-12-08'),
(4228, 24, '2022-12-08'),
(4229, 44, '2022-12-08'),
(4230, 41, '2022-12-08'),
(4231, 26, '2022-12-08'),
(4232, 58, '2022-12-08'),
(4233, 33, '2022-12-08'),
(4234, 37, '2022-12-08'),
(4235, 25, '2022-12-08'),
(4236, 8, '2022-12-09'),
(4237, 34, '2022-12-09'),
(4238, 32, '2022-12-09'),
(4239, 39, '2022-12-09'),
(4240, 30, '2022-12-09'),
(4241, 48, '2022-12-09'),
(4242, 48, '2022-12-09'),
(4243, 23, '2022-12-09'),
(4244, 31, '2022-12-09'),
(4245, 31, '2022-12-09'),
(4246, 23, '2022-12-09'),
(4247, 23, '2022-12-09'),
(4248, 35, '2022-12-09'),
(4249, 35, '2022-12-09'),
(4250, 27, '2022-12-09'),
(4251, 38, '2022-12-09'),
(4252, 24, '2022-12-09'),
(4253, 24, '2022-12-09'),
(4254, 16, '2022-12-09'),
(4255, 16, '2022-12-09'),
(4256, 22, '2022-12-09'),
(4257, 22, '2022-12-09'),
(4258, 36, '2022-12-09'),
(4259, 40, '2022-12-09'),
(4260, 28, '2022-12-10'),
(4261, 48, '2022-12-10'),
(4262, 25, '2022-12-10'),
(4263, 54, '2022-12-10'),
(4264, 32, '2022-12-10'),
(4265, 18, '2022-12-10'),
(4266, 12, '2022-12-10'),
(4267, 43, '2022-12-10'),
(4268, 56, '2022-12-10'),
(4269, 31, '2022-12-11'),
(4270, 19, '2022-12-11'),
(4271, 6, '2022-12-11'),
(4272, 22, '2022-12-12'),
(4273, 5, '2022-12-12'),
(4274, 23, '2022-12-12'),
(4275, 10, '2022-12-12'),
(4276, 59, '2022-12-12'),
(4277, 51, '2022-12-12'),
(4278, 60, '2022-12-13'),
(4279, 35, '2022-12-13'),
(4280, 47, '2022-12-13'),
(4281, 43, '2022-12-13'),
(4282, 60, '2022-12-13'),
(4283, 37, '2022-12-14'),
(4284, 51, '2022-12-14'),
(4285, 59, '2022-12-14'),
(4286, 29, '2022-12-14'),
(4287, 24, '2022-12-14'),
(4288, 16, '2022-12-15'),
(4289, 45, '2022-12-15'),
(4290, 28, '2022-12-15'),
(4291, 32, '2022-12-15'),
(4292, 40, '2022-12-15'),
(4293, 60, '2022-12-16'),
(4294, 20, '2022-12-16'),
(4295, 5, '2022-12-16'),
(4296, 19, '2022-12-17'),
(4297, 6, '2022-12-17'),
(4298, 2, '2022-12-17'),
(4299, 35, '2022-12-17'),
(4300, 21, '2022-12-17'),
(4301, 13, '2022-12-18'),
(4302, 23, '2022-12-18'),
(4303, 42, '2022-12-18'),
(4304, 33, '2022-12-18'),
(4305, 22, '2022-12-19'),
(4306, 22, '2022-12-19'),
(4307, 36, '2022-12-19'),
(4308, 47, '2022-12-20'),
(4309, 20, '2022-12-20'),
(4310, 34, '2022-12-20'),
(4311, 53, '2022-12-21'),
(4312, 33, '2022-12-21'),
(4313, 53, '2022-12-21'),
(4314, 26, '2022-12-21'),
(4315, 58, '2022-12-21'),
(4316, 10, '2022-12-21'),
(4317, 27, '2022-12-21'),
(4318, 28, '2022-12-21'),
(4319, 22, '2022-12-22'),
(4320, 19, '2022-12-22'),
(4321, 13, '2022-12-22'),
(4322, 19, '2022-12-22'),
(4323, 15, '2022-12-22'),
(4324, 18, '2022-12-22'),
(4325, 18, '2022-12-22'),
(4326, 20, '2022-12-22'),
(4327, 20, '2022-12-22'),
(4328, 21, '2022-12-22'),
(4329, 21, '2022-12-22'),
(4330, 27, '2022-12-23'),
(4331, 19, '2022-12-23'),
(4332, 16, '2022-12-23'),
(4333, 30, '2022-12-23'),
(4334, 20, '2022-12-23'),
(4335, 19, '2022-12-23'),
(4336, 21, '2022-12-23'),
(4337, 21, '2022-12-23'),
(4338, 17, '2022-12-24'),
(4339, 17, '2022-12-24'),
(4340, 16, '2022-12-24'),
(4341, 16, '2022-12-24'),
(4342, 18, '2022-12-24'),
(4343, 13, '2022-12-24'),
(4344, 13, '2022-12-24'),
(4345, 12, '2022-12-24'),
(4346, 10, '2022-12-24'),
(4347, 12, '2022-12-24'),
(4348, 22, '2022-12-24'),
(4349, 17, '2022-12-24'),
(4350, 17, '2022-12-24'),
(4351, 54, '2022-12-24'),
(4352, 54, '2022-12-24'),
(4353, 55, '2022-12-24'),
(4354, 40, '2022-12-24'),
(4355, 51, '2022-12-24'),
(4356, 51, '2022-12-24'),
(4357, 11, '2022-12-24'),
(4358, 30, '2022-12-24'),
(4359, 29, '2022-12-24'),
(4360, 59, '2022-12-24'),
(4361, 59, '2022-12-24'),
(4362, 50, '2022-12-24'),
(4363, 20, '2022-12-24'),
(4364, 3, '2022-12-25'),
(4365, 56, '2022-12-25'),
(4366, 56, '2022-12-25'),
(4367, 49, '2022-12-25'),
(4368, 57, '2022-12-25'),
(4369, 57, '2022-12-25'),
(4370, 58, '2022-12-25'),
(4371, 58, '2022-12-25'),
(4372, 46, '2022-12-25'),
(4373, 28, '2022-12-25'),
(4374, 42, '2022-12-25'),
(4375, 49, '2022-12-25'),
(4376, 49, '2022-12-25'),
(4377, 37, '2022-12-25'),
(4378, 53, '2022-12-25'),
(4379, 50, '2022-12-25'),
(4380, 50, '2022-12-25'),
(4381, 30, '2022-12-25'),
(4382, 9, '2022-12-25'),
(4383, 57, '2022-12-25'),
(4384, 52, '2022-12-25'),
(4385, 34, '2022-12-25'),
(4386, 60, '2022-12-25'),
(4387, 22, '2022-12-25'),
(4388, 4, '2022-12-25'),
(4389, 39, '2022-12-25'),
(4390, 8, '2022-12-25'),
(4391, 56, '2022-12-25'),
(4392, 24, '2022-12-25'),
(4393, 43, '2022-12-25'),
(4394, 30, '2022-12-25'),
(4395, 44, '2022-12-25'),
(4396, 25, '2022-12-25'),
(4397, 58, '2022-12-25'),
(4398, 51, '2022-12-25'),
(4399, 54, '2022-12-25'),
(4400, 33, '2022-12-26'),
(4401, 51, '2022-12-26'),
(4402, 13, '2022-12-26'),
(4403, 12, '2022-12-26'),
(4404, 32, '2022-12-26'),
(4405, 16, '2022-12-27'),
(4406, 7, '2022-12-27'),
(4407, 52, '2022-12-27'),
(4408, 57, '2022-12-27'),
(4409, 57, '2022-12-27'),
(4410, 56, '2022-12-27'),
(4411, 9, '2022-12-27'),
(4412, 8, '2022-12-27'),
(4413, 8, '2022-12-27'),
(4414, 2, '2022-12-27'),
(4415, 36, '2022-12-27'),
(4416, 15, '2022-12-27'),
(4417, 15, '2022-12-27'),
(4418, 6, '2022-12-27'),
(4419, 6, '2022-12-27'),
(4420, 8, '2022-12-27'),
(4421, 8, '2022-12-27'),
(4422, 3, '2022-12-27'),
(4423, 3, '2022-12-27'),
(4424, 53, '2022-12-27'),
(4425, 5, '2022-12-27'),
(4426, 5, '2022-12-27'),
(4427, 58, '2022-12-27'),
(4428, 12, '2022-12-27'),
(4429, 10, '2022-12-27'),
(4430, 14, '2022-12-27'),
(4431, 7, '2022-12-27'),
(4432, 50, '2022-12-27'),
(4433, 50, '2022-12-27'),
(4434, 54, '2022-12-27'),
(4435, 54, '2022-12-27'),
(4436, 49, '2022-12-27'),
(4437, 59, '2022-12-27'),
(4438, 60, '2022-12-27'),
(4439, 60, '2022-12-27'),
(4440, 19, '2022-12-27'),
(4441, 29, '2022-12-27'),
(4442, 29, '2022-12-27'),
(4443, 51, '2022-12-27'),
(4444, 7, '2022-12-27'),
(4445, 55, '2022-12-27'),
(4446, 43, '2022-12-27'),
(4447, 60, '2022-12-28'),
(4448, 60, '2022-12-28'),
(4449, 42, '2022-12-28'),
(4450, 22, '2022-12-28'),
(4451, 14, '2022-12-28'),
(4452, 32, '2022-12-28'),
(4453, 46, '2022-12-28'),
(4454, 46, '2022-12-28'),
(4455, 4, '2022-12-28'),
(4456, 45, '2022-12-28'),
(4457, 48, '2022-12-28'),
(4458, 47, '2022-12-28'),
(4459, 40, '2022-12-28'),
(4460, 40, '2022-12-28'),
(4461, 40, '2022-12-28'),
(4462, 43, '2022-12-28'),
(4463, 28, '2022-12-28'),
(4464, 44, '2022-12-28'),
(4465, 44, '2022-12-28'),
(4466, 33, '2022-12-28'),
(4467, 42, '2022-12-28'),
(4468, 42, '2022-12-28'),
(4469, 31, '2022-12-28'),
(4470, 45, '2022-12-28'),
(4471, 39, '2022-12-28'),
(4472, 47, '2022-12-28'),
(4473, 35, '2022-12-28'),
(4474, 30, '2022-12-28'),
(4475, 2, '2022-12-28'),
(4476, 41, '2022-12-28'),
(4477, 36, '2022-12-28'),
(4478, 36, '2022-12-28'),
(4479, 34, '2022-12-28'),
(4480, 32, '2022-12-28'),
(4481, 28, '2022-12-28'),
(4482, 37, '2022-12-28'),
(4483, 31, '2022-12-28'),
(4484, 46, '2022-12-28'),
(4485, 46, '2022-12-28'),
(4486, 26, '2022-12-28'),
(4487, 26, '2022-12-28'),
(4488, 27, '2022-12-28'),
(4489, 29, '2022-12-28'),
(4490, 25, '2022-12-28'),
(4491, 53, '2022-12-28'),
(4492, 47, '2022-12-28'),
(4493, 5, '2022-12-29'),
(4494, 13, '2022-12-29'),
(4495, 56, '2022-12-29'),
(4496, 7, '2022-12-29'),
(4497, 17, '2022-12-29'),
(4498, 59, '2022-12-29'),
(4499, 48, '2022-12-29'),
(4500, 26, '2022-12-29'),
(4501, 43, '2022-12-29'),
(4502, 57, '2022-12-29'),
(4503, 14, '2022-12-29'),
(4504, 54, '2022-12-29'),
(4505, 46, '2022-12-29'),
(4506, 10, '2022-12-29'),
(4507, 51, '2022-12-29'),
(4508, 30, '2022-12-29'),
(4509, 11, '2022-12-29'),
(4510, 53, '2022-12-29'),
(4511, 41, '2022-12-29'),
(4512, 48, '2022-12-29'),
(4513, 26, '2022-12-29'),
(4514, 31, '2022-12-29'),
(4515, 49, '2022-12-29'),
(4516, 40, '2022-12-29'),
(4517, 59, '2022-12-29'),
(4518, 52, '2022-12-29'),
(4519, 24, '2022-12-29'),
(4520, 37, '2022-12-29'),
(4521, 28, '2022-12-30'),
(4522, 25, '2022-12-30'),
(4523, 23, '2022-12-30'),
(4524, 60, '2022-12-30'),
(4525, 20, '2022-12-30'),
(4526, 5, '2022-12-30'),
(4527, 27, '2022-12-30'),
(4528, 36, '2022-12-31'),
(4529, 38, '2022-12-31'),
(4530, 38, '2022-12-31'),
(4531, 34, '2022-12-31'),
(4532, 2, '2022-12-31'),
(4533, 15, '2022-12-31'),
(4534, 18, '2023-01-01'),
(4535, 41, '2023-01-01'),
(4536, 37, '2023-01-01'),
(4537, 37, '2023-01-01'),
(4538, 25, '2023-01-01'),
(4539, 25, '2023-01-01'),
(4540, 34, '2023-01-01'),
(4541, 34, '2023-01-01'),
(4542, 32, '2023-01-01'),
(4543, 32, '2023-01-01'),
(4544, 39, '2023-01-01'),
(4545, 39, '2023-01-01'),
(4546, 21, '2023-01-01'),
(4547, 30, '2023-01-01'),
(4548, 31, '2023-01-01'),
(4549, 31, '2023-01-01'),
(4550, 23, '2023-01-01'),
(4551, 35, '2023-01-01'),
(4552, 35, '2023-01-01'),
(4553, 27, '2023-01-01'),
(4554, 27, '2023-01-01'),
(4555, 38, '2023-01-01'),
(4556, 38, '2023-01-01'),
(4557, 36, '2023-01-01'),
(4558, 36, '2023-01-01'),
(4559, 10, '2023-01-01'),
(4560, 14, '2023-01-01'),
(4561, 32, '2023-01-02'),
(4562, 56, '2023-01-02'),
(4563, 33, '2023-01-02'),
(4564, 58, '2023-01-02'),
(4565, 23, '2023-01-03'),
(4566, 29, '2023-01-03'),
(4567, 39, '2023-01-03'),
(4568, 56, '2023-01-03'),
(4569, 31, '2023-01-04'),
(4570, 47, '2023-01-04'),
(4571, 46, '2023-01-04'),
(4572, 49, '2023-01-04'),
(4573, 38, '2023-01-04'),
(4574, 22, '2023-01-04'),
(4575, 57, '2023-01-05'),
(4576, 57, '2023-01-05'),
(4577, 16, '2023-01-05'),
(4578, 3, '2023-01-05'),
(4579, 30, '2023-01-05'),
(4580, 59, '2023-01-05'),
(4581, 59, '2023-01-05'),
(4582, 26, '2023-01-06'),
(4583, 8, '2023-01-06'),
(4584, 50, '2023-01-06'),
(4585, 49, '2023-01-06'),
(4586, 26, '2023-01-06'),
(4587, 45, '2023-01-06'),
(4588, 55, '2023-01-06'),
(4589, 10, '2023-01-06'),
(4590, 28, '2023-01-06'),
(4591, 3, '2023-01-06'),
(4592, 32, '2023-01-06'),
(4593, 4, '2023-01-06'),
(4594, 39, '2023-01-06'),
(4595, 3, '2023-01-06'),
(4596, 27, '2023-01-06'),
(4597, 14, '2023-01-06'),
(4598, 41, '2023-01-06'),
(4599, 54, '2023-01-06'),
(4600, 37, '2023-01-06'),
(4601, 9, '2023-01-06'),
(4602, 36, '2023-01-06'),
(4603, 42, '2023-01-06'),
(4604, 50, '2023-01-06'),
(4605, 16, '2023-01-06'),
(4606, 14, '2023-01-06'),
(4607, 57, '2023-01-06'),
(4608, 18, '2023-01-06'),
(4609, 17, '2023-01-06'),
(4610, 13, '2023-01-07'),
(4611, 16, '2023-01-07'),
(4612, 18, '2023-01-07'),
(4613, 18, '2023-01-07'),
(4614, 20, '2023-01-07'),
(4615, 6, '2023-01-07'),
(4616, 19, '2023-01-07'),
(4617, 16, '2023-01-07'),
(4618, 21, '2023-01-07'),
(4619, 29, '2023-01-08'),
(4620, 13, '2023-01-08'),
(4621, 2, '2023-01-08'),
(4622, 18, '2023-01-08'),
(4623, 22, '2023-01-08'),
(4624, 22, '2023-01-08'),
(4625, 58, '2023-01-08'),
(4626, 55, '2023-01-08'),
(4627, 34, '2023-01-08'),
(4628, 51, '2023-01-09'),
(4629, 26, '2023-01-09'),
(4630, 60, '2023-01-09'),
(4631, 58, '2023-01-09'),
(4632, 39, '2023-01-09'),
(4633, 51, '2023-01-09'),
(4634, 12, '2023-01-09'),
(4635, 12, '2023-01-09'),
(4636, 12, '2023-01-09'),
(4637, 12, '2023-01-10'),
(4638, 12, '2023-01-10'),
(4639, 20, '2023-01-10'),
(4640, 20, '2023-01-10'),
(4641, 16, '2023-01-10'),
(4642, 16, '2023-01-10'),
(4643, 18, '2023-01-10'),
(4644, 51, '2023-01-10'),
(4645, 13, '2023-01-10'),
(4646, 13, '2023-01-10'),
(4647, 21, '2023-01-10'),
(4648, 31, '2023-01-10'),
(4649, 17, '2023-01-10'),
(4650, 17, '2023-01-10'),
(4651, 17, '2023-01-10'),
(4652, 17, '2023-01-10'),
(4653, 19, '2023-01-10'),
(4654, 4, '2023-01-11'),
(4655, 12, '2023-01-12'),
(4656, 7, '2023-01-13'),
(4657, 6, '2023-01-14'),
(4658, 15, '2023-01-14'),
(4659, 10, '2023-01-14'),
(4660, 39, '2023-01-14'),
(4661, 54, '2023-01-14'),
(4662, 54, '2023-01-14'),
(4663, 56, '2023-01-14'),
(4664, 14, '2023-01-14'),
(4665, 8, '2023-01-14'),
(4666, 49, '2023-01-14'),
(4667, 43, '2023-01-14'),
(4668, 58, '2023-01-14'),
(4669, 58, '2023-01-14'),
(4670, 53, '2023-01-14'),
(4671, 53, '2023-01-14'),
(4672, 51, '2023-01-14'),
(4673, 51, '2023-01-14'),
(4674, 52, '2023-01-14'),
(4675, 52, '2023-01-14'),
(4676, 59, '2023-01-15'),
(4677, 59, '2023-01-15'),
(4678, 43, '2023-01-15'),
(4679, 57, '2023-01-15'),
(4680, 57, '2023-01-15'),
(4681, 55, '2023-01-15'),
(4682, 50, '2023-01-15'),
(4683, 50, '2023-01-15'),
(4684, 22, '2023-01-16'),
(4685, 22, '2023-01-16'),
(4686, 7, '2023-01-17'),
(4687, 7, '2023-01-17'),
(4688, 52, '2023-01-17'),
(4689, 52, '2023-01-17'),
(4690, 8, '2023-01-17'),
(4691, 56, '2023-01-17'),
(4692, 56, '2023-01-17'),
(4693, 54, '2023-01-17'),
(4694, 50, '2023-01-17'),
(4695, 50, '2023-01-17'),
(4696, 49, '2023-01-17'),
(4697, 49, '2023-01-17'),
(4698, 59, '2023-01-17'),
(4699, 59, '2023-01-17'),
(4700, 10, '2023-01-17'),
(4701, 10, '2023-01-17'),
(4702, 9, '2023-01-17'),
(4703, 5, '2023-01-17'),
(4704, 5, '2023-01-17'),
(4705, 52, '2023-01-17'),
(4706, 51, '2023-01-17'),
(4707, 29, '2023-01-17'),
(4708, 29, '2023-01-17'),
(4709, 2, '2023-01-17'),
(4710, 2, '2023-01-17'),
(4711, 55, '2023-01-17'),
(4712, 55, '2023-01-17'),
(4713, 60, '2023-01-17'),
(4714, 14, '2023-01-17'),
(4715, 14, '2023-01-17'),
(4716, 7, '2023-01-18'),
(4717, 7, '2023-01-18'),
(4718, 15, '2023-01-18'),
(4719, 15, '2023-01-18'),
(4720, 8, '2023-01-18'),
(4721, 8, '2023-01-18'),
(4722, 53, '2023-01-18'),
(4723, 23, '2023-01-18'),
(4724, 6, '2023-01-18'),
(4725, 6, '2023-01-18'),
(4726, 3, '2023-01-18'),
(4727, 57, '2023-01-18'),
(4728, 57, '2023-01-18'),
(4729, 58, '2023-01-18'),
(4730, 5, '2023-01-18'),
(4731, 14, '2023-01-18'),
(4732, 14, '2023-01-18'),
(4733, 60, '2023-01-18'),
(4734, 60, '2023-01-18'),
(4735, 43, '2023-01-18'),
(4736, 43, '2023-01-18'),
(4737, 46, '2023-01-18'),
(4738, 13, '2023-01-18'),
(4739, 45, '2023-01-18'),
(4740, 45, '2023-01-18'),
(4741, 48, '2023-01-18'),
(4742, 48, '2023-01-18'),
(4743, 4, '2023-01-18'),
(4744, 42, '2023-01-18'),
(4745, 47, '2023-01-18'),
(4746, 47, '2023-01-18'),
(4747, 43, '2023-01-18'),
(4748, 43, '2023-01-18'),
(4749, 42, '2023-01-19'),
(4750, 42, '2023-01-19'),
(4751, 53, '2023-01-19'),
(4752, 35, '2023-01-19'),
(4753, 39, '2023-01-19'),
(4754, 39, '2023-01-19'),
(4755, 32, '2023-01-19'),
(4756, 32, '2023-01-19'),
(4757, 47, '2023-01-19'),
(4758, 47, '2023-01-19'),
(4759, 30, '2023-01-19'),
(4760, 30, '2023-01-19'),
(4761, 55, '2023-01-19'),
(4762, 2, '2023-01-19'),
(4763, 28, '2023-01-19'),
(4764, 41, '2023-01-19'),
(4765, 41, '2023-01-19'),
(4766, 27, '2023-01-19'),
(4767, 27, '2023-01-19'),
(4768, 59, '2023-01-19'),
(4769, 28, '2023-01-19'),
(4770, 28, '2023-01-19'),
(4771, 29, '2023-01-19'),
(4772, 29, '2023-01-19'),
(4773, 40, '2023-01-19'),
(4774, 40, '2023-01-19'),
(4775, 33, '2023-01-19'),
(4776, 44, '2023-01-19'),
(4777, 44, '2023-01-19'),
(4778, 37, '2023-01-19'),
(4779, 37, '2023-01-19'),
(4780, 25, '2023-01-19'),
(4781, 26, '2023-01-19'),
(4782, 26, '2023-01-19'),
(4783, 36, '2023-01-20'),
(4784, 36, '2023-01-20'),
(4785, 46, '2023-01-20'),
(4786, 46, '2023-01-20'),
(4787, 45, '2023-01-20'),
(4788, 31, '2023-01-20'),
(4789, 31, '2023-01-20'),
(4790, 34, '2023-01-20'),
(4791, 34, '2023-01-20'),
(4792, 21, '2023-01-21'),
(4793, 29, '2023-01-21'),
(4794, 22, '2023-01-21'),
(4795, 40, '2023-01-21'),
(4796, 40, '2023-01-21'),
(4797, 37, '2023-01-22'),
(4798, 37, '2023-01-22'),
(4799, 25, '2023-01-23'),
(4800, 25, '2023-01-23'),
(4801, 34, '2023-01-23'),
(4802, 34, '2023-01-23'),
(4803, 32, '2023-01-23'),
(4804, 32, '2023-01-23'),
(4805, 39, '2023-01-23'),
(4806, 13, '2023-01-23'),
(4807, 30, '2023-01-23'),
(4808, 18, '2023-01-23'),
(4809, 18, '2023-01-23'),
(4810, 23, '2023-01-23'),
(4811, 27, '2023-01-23'),
(4812, 27, '2023-01-23'),
(4813, 16, '2023-01-23'),
(4814, 36, '2023-01-23'),
(4815, 21, '2023-01-23'),
(4816, 21, '2023-01-23'),
(4817, 38, '2023-01-23'),
(4818, 31, '2023-01-23'),
(4819, 31, '2023-01-23'),
(4820, 35, '2023-01-23'),
(4821, 35, '2023-01-23'),
(4822, 26, '2023-01-24'),
(4823, 20, '2023-01-24'),
(4824, 20, '2023-01-24'),
(4825, 19, '2023-01-24'),
(4826, 5, '2023-01-24'),
(4827, 14, '2023-01-25'),
(4828, 57, '2023-01-25'),
(4829, 4, '2023-01-25'),
(4830, 12, '2023-01-25'),
(4831, 37, '2023-01-25'),
(4832, 20, '2023-01-25'),
(4833, 13, '2023-01-25'),
(4834, 13, '2023-01-25'),
(4835, 16, '2023-01-25'),
(4836, 18, '2023-01-25'),
(4837, 21, '2023-01-25'),
(4838, 12, '2023-01-25'),
(4839, 37, '2023-01-26'),
(4840, 26, '2023-01-26'),
(4841, 17, '2023-01-26'),
(4842, 19, '2023-01-26'),
(4843, 9, '2023-01-26'),
(4844, 35, '2023-01-26'),
(4845, 13, '2023-01-26'),
(4846, 20, '2023-01-26'),
(4847, 17, '2023-01-26'),
(4848, 52, '2023-01-26'),
(4849, 25, '2023-01-26'),
(4850, 53, '2023-01-26'),
(4851, 43, '2023-01-26'),
(4852, 14, '2023-01-27'),
(4853, 44, '2023-01-27'),
(4854, 15, '2023-01-27'),
(4855, 14, '2023-01-27'),
(4856, 29, '2023-01-27'),
(4857, 8, '2023-01-27'),
(4858, 48, '2023-01-27'),
(4859, 22, '2023-01-28'),
(4860, 22, '2023-01-28'),
(4861, 14, '2023-01-28'),
(4862, 40, '2023-01-28'),
(4863, 5, '2023-01-28'),
(4864, 13, '2023-01-28'),
(4865, 27, '2023-01-28'),
(4866, 59, '2023-01-28'),
(4867, 12, '2023-01-28'),
(4868, 32, '2023-01-28'),
(4869, 30, '2023-01-28'),
(4870, 25, '2023-01-28'),
(4871, 8, '2023-01-28'),
(4872, 25, '2023-01-28'),
(4873, 53, '2023-01-28'),
(4874, 28, '2023-01-28'),
(4875, 57, '2023-01-28'),
(4876, 50, '2023-01-28'),
(4877, 51, '2023-01-28'),
(4878, 27, '2023-01-28'),
(4879, 22, '2023-01-28'),
(4880, 23, '2023-01-29'),
(4881, 11, '2023-01-29'),
(4882, 49, '2023-01-29'),
(4883, 9, '2023-01-29'),
(4884, 19, '2023-01-29'),
(4885, 34, '2023-01-29'),
(4886, 45, '2023-01-29'),
(4887, 26, '2023-01-29'),
(4888, 22, '2023-01-29'),
(4889, 60, '2023-01-29'),
(4890, 54, '2023-01-29'),
(4891, 33, '2023-01-29'),
(4892, 58, '2023-01-29'),
(4893, 34, '2023-01-29'),
(4894, 38, '2023-01-29'),
(4895, 36, '2023-01-29'),
(4896, 24, '2023-01-29'),
(4897, 41, '2023-01-29'),
(4898, 55, '2023-01-29'),
(4899, 47, '2023-01-29'),
(4900, 6, '2023-01-29'),
(4901, 42, '2023-01-29'),
(4902, 3, '2023-01-29'),
(4903, 6, '2023-01-29'),
(4904, 4, '2023-01-29'),
(4905, 7, '2023-01-29'),
(4906, 36, '2023-01-29'),
(4907, 60, '2023-01-29'),
(4908, 37, '2023-01-30'),
(4909, 46, '2023-01-30'),
(4910, 5, '2023-01-30'),
(4911, 17, '2023-01-30'),
(4912, 56, '2023-01-30'),
(4913, 18, '2023-01-30'),
(4914, 2, '2023-01-30'),
(4915, 54, '2023-01-30'),
(4916, 22, '2023-01-30'),
(4917, 41, '2023-01-30'),
(4918, 45, '2023-01-30'),
(4919, 24, '2023-01-30'),
(4920, 8, '2023-01-30'),
(4921, 8, '2023-01-30'),
(4922, 8, '2023-01-30'),
(4923, 26, '2023-01-30'),
(4924, 39, '2023-01-30'),
(4925, 19, '2023-01-30'),
(4926, 42, '2023-01-31'),
(4927, 31, '2023-01-31'),
(4928, 26, '2023-01-31'),
(4929, 10, '2023-01-31'),
(4930, 9, '2023-01-31'),
(4931, 56, '2023-01-31'),
(4932, 59, '2023-01-31'),
(4933, 8, '2023-01-31'),
(4934, 50, '2023-01-31'),
(4935, 47, '2023-01-31'),
(4936, 10, '2023-01-31'),
(4937, 16, '2023-01-31'),
(4938, 35, '2023-01-31'),
(4939, 22, '2023-01-31'),
(4940, 47, '2023-02-01'),
(4941, 29, '2023-02-01'),
(4942, 18, '2023-02-01'),
(4943, 47, '2023-02-01'),
(4944, 11, '2023-02-01'),
(4945, 12, '2023-02-01'),
(4946, 7, '2023-02-01'),
(4947, 40, '2023-02-01'),
(4948, 39, '2023-02-01'),
(4949, 9, '2023-02-01'),
(4950, 51, '2023-02-01'),
(4951, 21, '2023-02-01'),
(4952, 3, '2023-02-01'),
(4953, 38, '2023-02-01'),
(4954, 17, '2023-02-01'),
(4955, 28, '2023-02-01'),
(4956, 5, '2023-02-01'),
(4957, 17, '2023-02-01'),
(4958, 19, '2023-02-01'),
(4959, 10, '2023-02-01'),
(4960, 18, '2023-02-01'),
(4961, 11, '2023-02-01'),
(4962, 6, '2023-02-01'),
(4963, 21, '2023-02-01'),
(4964, 12, '2023-02-01'),
(4965, 13, '2023-02-01'),
(4966, 23, '2023-02-01'),
(4967, 9, '2023-02-01'),
(4968, 22, '2023-02-01'),
(4969, 7, '2023-02-01'),
(4970, 16, '2023-02-01'),
(4971, 2, '2023-02-01'),
(4972, 20, '2023-02-01'),
(4973, 24, '2023-02-01'),
(4974, 30, '2023-02-01'),
(4975, 25, '2023-02-01'),
(4976, 31, '2023-02-01'),
(4977, 32, '2023-02-01'),
(4978, 37, '2023-02-01'),
(4979, 35, '2023-02-01'),
(4980, 36, '2023-02-01'),
(4981, 34, '2023-02-01'),
(4982, 23, '2023-02-01'),
(4983, 38, '2023-02-01'),
(4984, 52, '2023-02-02'),
(4985, 15, '2023-02-02'),
(4986, 46, '2023-02-02'),
(4987, 58, '2023-02-02'),
(4988, 25, '2023-02-02'),
(4989, 4, '2023-02-02'),
(4990, 25, '2023-02-02'),
(4991, 12, '2023-02-02'),
(4992, 49, '2023-02-02'),
(4993, 2, '2023-02-02'),
(4994, 8, '2023-02-02'),
(4995, 21, '2023-02-02'),
(4996, 13, '2023-02-02'),
(4997, 5, '2023-02-02'),
(4998, 57, '2023-02-02'),
(4999, 59, '2023-02-02'),
(5000, 20, '2023-02-02'),
(5001, 32, '2023-02-02'),
(5002, 33, '2023-02-02'),
(5003, 48, '2023-02-02'),
(5004, 10, '2023-02-02'),
(5005, 48, '2023-02-03'),
(5006, 27, '2023-02-03'),
(5007, 14, '2023-02-03'),
(5008, 45, '2023-02-03'),
(5009, 30, '2023-02-03'),
(5010, 43, '2023-02-03'),
(5011, 15, '2023-02-03'),
(5012, 41, '2023-02-03'),
(5013, 57, '2023-02-03'),
(5014, 13, '2023-02-03'),
(5015, 51, '2023-02-03'),
(5016, 49, '2023-02-03'),
(5017, 31, '2023-02-03'),
(5018, 29, '2023-02-03'),
(5019, 47, '2023-02-03'),
(5020, 53, '2023-02-03'),
(5021, 34, '2023-02-04'),
(5022, 36, '2023-02-04'),
(5023, 40, '2023-02-04'),
(5024, 44, '2023-02-04'),
(5025, 4, '2023-02-04'),
(5026, 6, '2023-02-04'),
(5027, 52, '2023-02-04'),
(5028, 9, '2023-02-04'),
(5029, 54, '2023-02-04'),
(5030, 54, '2023-02-04'),
(5031, 56, '2023-02-04'),
(5032, 56, '2023-02-04'),
(5033, 49, '2023-02-04'),
(5034, 58, '2023-02-04'),
(5035, 58, '2023-02-04'),
(5036, 22, '2023-02-04'),
(5037, 22, '2023-02-04'),
(5038, 53, '2023-02-04'),
(5039, 51, '2023-02-04'),
(5040, 51, '2023-02-04'),
(5041, 33, '2023-02-04'),
(5042, 11, '2023-02-04'),
(5043, 43, '2023-02-04'),
(5044, 36, '2023-02-04'),
(5045, 2, '2023-02-04'),
(5046, 14, '2023-02-04'),
(5047, 58, '2023-02-04'),
(5048, 52, '2023-02-04'),
(5049, 24, '2023-02-04'),
(5050, 59, '2023-02-04'),
(5051, 57, '2023-02-04'),
(5052, 57, '2023-02-04'),
(5053, 55, '2023-02-04'),
(5054, 55, '2023-02-04'),
(5055, 45, '2023-02-05'),
(5056, 34, '2023-02-05'),
(5057, 56, '2023-02-05'),
(5058, 35, '2023-02-05'),
(5059, 44, '2023-02-05'),
(5060, 31, '2023-02-05'),
(5061, 19, '2023-02-05'),
(5062, 58, '2023-02-05'),
(5063, 5, '2023-02-05'),
(5064, 7, '2023-02-05'),
(5065, 39, '2023-02-05'),
(5066, 36, '2023-02-05'),
(5067, 50, '2023-02-05'),
(5068, 37, '2023-02-05'),
(5069, 50, '2023-02-05'),
(5070, 50, '2023-02-05'),
(5071, 55, '2023-02-05'),
(5072, 54, '2023-02-05'),
(5073, 56, '2023-02-05'),
(5074, 54, '2023-02-05'),
(5075, 46, '2023-02-05'),
(5076, 60, '2023-02-05'),
(5077, 35, '2023-02-05'),
(5078, 24, '2023-02-06'),
(5079, 8, '2023-02-06'),
(5080, 37, '2023-02-06'),
(5081, 26, '2023-02-06'),
(5082, 47, '2023-02-06'),
(5083, 27, '2023-02-06'),
(5084, 50, '2023-02-06'),
(5085, 16, '2023-02-06'),
(5086, 7, '2023-02-06'),
(5087, 15, '2023-02-06'),
(5088, 7, '2023-02-06'),
(5089, 8, '2023-02-06'),
(5090, 8, '2023-02-06'),
(5091, 52, '2023-02-06'),
(5092, 52, '2023-02-06'),
(5093, 56, '2023-02-07'),
(5094, 54, '2023-02-07'),
(5095, 54, '2023-02-07'),
(5096, 50, '2023-02-07'),
(5097, 50, '2023-02-07'),
(5098, 10, '2023-02-07'),
(5099, 26, '2023-02-07'),
(5100, 23, '2023-02-07'),
(5101, 17, '2023-02-07'),
(5102, 59, '2023-02-07'),
(5103, 59, '2023-02-07'),
(5104, 49, '2023-02-07'),
(5105, 9, '2023-02-07'),
(5106, 10, '2023-02-07'),
(5107, 5, '2023-02-07'),
(5108, 5, '2023-02-07'),
(5109, 11, '2023-02-07'),
(5110, 29, '2023-02-07'),
(5111, 29, '2023-02-07'),
(5112, 51, '2023-02-07'),
(5113, 6, '2023-02-07'),
(5114, 6, '2023-02-07'),
(5115, 55, '2023-02-07'),
(5116, 60, '2023-02-07'),
(5117, 38, '2023-02-07'),
(5118, 2, '2023-02-07'),
(5119, 2, '2023-02-07'),
(5120, 15, '2023-02-07'),
(5121, 15, '2023-02-07'),
(5122, 40, '2023-02-07'),
(5123, 51, '2023-02-07'),
(5124, 58, '2023-02-07'),
(5125, 28, '2023-02-07'),
(5126, 3, '2023-02-07'),
(5127, 14, '2023-02-07'),
(5128, 53, '2023-02-07'),
(5129, 53, '2023-02-07'),
(5130, 60, '2023-02-07'),
(5131, 3, '2023-02-07'),
(5132, 3, '2023-02-07'),
(5133, 57, '2023-02-07'),
(5134, 7, '2023-02-07'),
(5135, 8, '2023-02-07'),
(5136, 8, '2023-02-07'),
(5137, 58, '2023-02-07'),
(5138, 58, '2023-02-07'),
(5139, 18, '2023-02-07'),
(5140, 38, '2023-02-07'),
(5141, 14, '2023-02-07'),
(5142, 13, '2023-02-07'),
(5143, 60, '2023-02-08'),
(5144, 60, '2023-02-08'),
(5145, 43, '2023-02-08'),
(5146, 46, '2023-02-08'),
(5147, 45, '2023-02-08'),
(5148, 45, '2023-02-08'),
(5149, 48, '2023-02-08'),
(5150, 42, '2023-02-08'),
(5151, 42, '2023-02-08'),
(5152, 39, '2023-02-08'),
(5153, 4, '2023-02-08'),
(5154, 47, '2023-02-08'),
(5155, 13, '2023-02-08'),
(5156, 18, '2023-02-08'),
(5157, 18, '2023-02-08'),
(5158, 13, '2023-02-08'),
(5159, 4, '2023-02-08'),
(5160, 16, '2023-02-08'),
(5161, 16, '2023-02-08'),
(5162, 21, '2023-02-08'),
(5163, 21, '2023-02-08'),
(5164, 49, '2023-02-08'),
(5165, 21, '2023-02-08'),
(5166, 17, '2023-02-08'),
(5167, 25, '2023-02-08'),
(5168, 51, '2023-02-08'),
(5169, 29, '2023-02-08'),
(5170, 43, '2023-02-08'),
(5171, 43, '2023-02-08'),
(5172, 42, '2023-02-08'),
(5173, 42, '2023-02-08'),
(5174, 39, '2023-02-09'),
(5175, 3, '2023-02-09'),
(5176, 53, '2023-02-09'),
(5177, 32, '2023-02-09'),
(5178, 22, '2023-02-09'),
(5179, 35, '2023-02-09'),
(5180, 35, '2023-02-09'),
(5181, 20, '2023-02-09'),
(5182, 20, '2023-02-09'),
(5183, 21, '2023-02-09'),
(5184, 32, '2023-02-09'),
(5185, 32, '2023-02-09'),
(5186, 32, '2023-02-09'),
(5187, 47, '2023-02-09'),
(5188, 30, '2023-02-09'),
(5189, 30, '2023-02-09'),
(5190, 19, '2023-02-09'),
(5191, 41, '2023-02-09'),
(5192, 41, '2023-02-09'),
(5193, 57, '2023-02-09'),
(5194, 47, '2023-02-09'),
(5195, 28, '2023-02-09'),
(5196, 28, '2023-02-09'),
(5197, 2, '2023-02-09'),
(5198, 2, '2023-02-09'),
(5199, 27, '2023-02-09'),
(5200, 18, '2023-02-09'),
(5201, 27, '2023-02-09'),
(5202, 27, '2023-02-09'),
(5203, 14, '2023-02-09'),
(5204, 23, '2023-02-09'),
(5205, 48, '2023-02-09'),
(5206, 29, '2023-02-09'),
(5207, 29, '2023-02-09'),
(5208, 18, '2023-02-09'),
(5209, 33, '2023-02-09'),
(5210, 40, '2023-02-09'),
(5211, 40, '2023-02-09'),
(5212, 44, '2023-02-09'),
(5213, 44, '2023-02-09'),
(5214, 52, '2023-02-09'),
(5215, 9, '2023-02-09'),
(5216, 37, '2023-02-09'),
(5217, 37, '2023-02-09'),
(5218, 25, '2023-02-09'),
(5219, 25, '2023-02-09'),
(5220, 26, '2023-02-09'),
(5221, 36, '2023-02-09'),
(5222, 36, '2023-02-09'),
(5223, 46, '2023-02-09'),
(5224, 46, '2023-02-09'),
(5225, 12, '2023-02-09'),
(5226, 22, '2023-02-09'),
(5227, 47, '2023-02-09'),
(5228, 5, '2023-02-09'),
(5229, 42, '2023-02-09'),
(5230, 31, '2023-02-09'),
(5231, 23, '2023-02-09'),
(5232, 24, '2023-02-09'),
(5233, 13, '2023-02-09'),
(5234, 13, '2023-02-09'),
(5235, 45, '2023-02-10'),
(5236, 45, '2023-02-10'),
(5237, 8, '2023-02-10'),
(5238, 20, '2023-02-10'),
(5239, 20, '2023-02-10'),
(5240, 16, '2023-02-10'),
(5241, 16, '2023-02-10'),
(5242, 34, '2023-02-10'),
(5243, 59, '2023-02-10'),
(5244, 21, '2023-02-10'),
(5245, 2, '2023-02-10'),
(5246, 12, '2023-02-10'),
(5247, 31, '2023-02-10'),
(5248, 18, '2023-02-10'),
(5249, 18, '2023-02-10'),
(5250, 5, '2023-02-10'),
(5251, 46, '2023-02-10'),
(5252, 17, '2023-02-10'),
(5253, 17, '2023-02-10'),
(5254, 19, '2023-02-10'),
(5255, 19, '2023-02-10'),
(5256, 34, '2023-02-10'),
(5257, 34, '2023-02-10'),
(5258, 6, '2023-02-10'),
(5259, 16, '2023-02-10'),
(5260, 10, '2023-02-10'),
(5261, 20, '2023-02-10'),
(5262, 33, '2023-02-10'),
(5263, 37, '2023-02-10'),
(5264, 19, '2023-02-10'),
(5265, 12, '2023-02-10'),
(5266, 12, '2023-02-10'),
(5267, 30, '2023-02-10'),
(5268, 53, '2023-02-11'),
(5269, 31, '2023-02-11'),
(5270, 7, '2023-02-11'),
(5271, 42, '2023-02-11'),
(5272, 52, '2023-02-11'),
(5273, 19, '2023-02-11'),
(5274, 56, '2023-02-11'),
(5275, 40, '2023-02-11'),
(5276, 40, '2023-02-11'),
(5277, 36, '2023-02-11'),
(5278, 28, '2023-02-11'),
(5279, 17, '2023-02-11'),
(5280, 35, '2023-02-11'),
(5281, 6, '2023-02-11'),
(5282, 4, '2023-02-11'),
(5283, 56, '2023-02-11'),
(5284, 16, '2023-02-11'),
(5285, 45, '2023-02-12'),
(5286, 44, '2023-02-12'),
(5287, 49, '2023-02-12'),
(5288, 54, '2023-02-12'),
(5289, 39, '2023-02-12'),
(5290, 37, '2023-02-12'),
(5291, 37, '2023-02-12'),
(5292, 40, '2023-02-12'),
(5293, 4, '2023-02-12'),
(5294, 15, '2023-02-12'),
(5295, 25, '2023-02-12'),
(5296, 54, '2023-02-12'),
(5297, 11, '2023-02-12'),
(5298, 60, '2023-02-12'),
(5299, 34, '2023-02-12'),
(5300, 34, '2023-02-12'),
(5301, 39, '2023-02-12'),
(5302, 2, '2023-02-12'),
(5303, 46, '2023-02-12'),
(5304, 32, '2023-02-12'),
(5305, 32, '2023-02-12'),
(5306, 12, '2023-02-13'),
(5307, 45, '2023-02-13'),
(5308, 30, '2023-02-13'),
(5309, 30, '2023-02-13'),
(5310, 23, '2023-02-13'),
(5311, 27, '2023-02-13'),
(5312, 27, '2023-02-13'),
(5313, 43, '2023-02-13'),
(5314, 40, '2023-02-13'),
(5315, 13, '2023-02-13'),
(5316, 36, '2023-02-13'),
(5317, 38, '2023-02-13'),
(5318, 31, '2023-02-13'),
(5319, 31, '2023-02-13'),
(5320, 35, '2023-02-13'),
(5321, 35, '2023-02-13'),
(5322, 57, '2023-02-13'),
(5323, 8, '2023-02-14'),
(5324, 7, '2023-02-14'),
(5325, 5, '2023-02-14'),
(5326, 4, '2023-02-14'),
(5327, 3, '2023-02-14'),
(5328, 2, '2023-02-14'),
(5329, 6, '2023-02-14'),
(5330, 9, '2023-02-14'),
(5331, 10, '2023-02-14'),
(5332, 11, '2023-02-14'),
(5333, 12, '2023-02-14'),
(5334, 13, '2023-02-14'),
(5335, 16, '2023-02-14'),
(5336, 17, '2023-02-14'),
(5337, 18, '2023-02-14'),
(5338, 19, '2023-02-14'),
(5339, 20, '2023-02-14'),
(5340, 21, '2023-02-14'),
(5341, 22, '2023-02-14'),
(5342, 23, '2023-02-14'),
(5343, 24, '2023-02-14'),
(5344, 25, '2023-02-14'),
(5345, 26, '2023-02-14'),
(5346, 27, '2023-02-14'),
(5347, 28, '2023-02-14'),
(5348, 29, '2023-02-14'),
(5349, 30, '2023-02-14'),
(5350, 31, '2023-02-14'),
(5351, 32, '2023-02-14'),
(5352, 33, '2023-02-14'),
(5353, 34, '2023-02-14'),
(5354, 35, '2023-02-14'),
(5355, 36, '2023-02-14'),
(5356, 37, '2023-02-14'),
(5357, 38, '2023-02-14'),
(5358, 39, '2023-02-14'),
(5359, 40, '2023-02-14'),
(5360, 41, '2023-02-14'),
(5361, 42, '2023-02-14'),
(5362, 43, '2023-02-14'),
(5363, 44, '2023-02-14'),
(5364, 45, '2023-02-14'),
(5365, 46, '2023-02-14'),
(5366, 47, '2023-02-14'),
(5367, 48, '2023-02-14'),
(5368, 49, '2023-02-14'),
(5369, 50, '2023-02-14'),
(5370, 51, '2023-02-14'),
(5371, 52, '2023-02-14'),
(5372, 53, '2023-02-14'),
(5373, 54, '2023-02-14'),
(5374, 55, '2023-02-14'),
(5375, 56, '2023-02-14'),
(5376, 57, '2023-02-14'),
(5377, 58, '2023-02-14'),
(5378, 59, '2023-02-14'),
(5379, 60, '2023-02-14'),
(5380, 14, '2023-02-14'),
(5381, 15, '2023-02-14'),
(5382, 59, '2023-02-15'),
(5383, 22, '2023-02-15'),
(5384, 22, '2023-02-15'),
(5385, 53, '2023-02-16'),
(5386, 20, '2023-02-16'),
(5387, 52, '2023-02-17'),
(5388, 55, '2023-02-17'),
(5389, 12, '2023-02-17'),
(5390, 4, '2023-02-18'),
(5391, 5, '2023-02-18'),
(5392, 54, '2023-02-18'),
(5393, 14, '2023-02-18'),
(5394, 19, '2023-02-18'),
(5395, 58, '2023-02-19'),
(5396, 35, '2023-02-21'),
(5397, 49, '2023-02-21'),
(5398, 5, '2023-02-21'),
(5399, 2, '2023-02-22'),
(5400, 3, '2023-02-22'),
(5401, 57, '2023-02-22'),
(5402, 22, '2023-02-23'),
(5403, 22, '2023-02-23'),
(5404, 54, '2023-02-24'),
(5405, 54, '2023-02-24'),
(5406, 56, '2023-02-24'),
(5407, 56, '2023-02-24'),
(5408, 58, '2023-02-24'),
(5409, 58, '2023-02-24'),
(5410, 49, '2023-02-24'),
(5411, 53, '2023-02-24'),
(5412, 51, '2023-02-24'),
(5413, 51, '2023-02-24'),
(5414, 52, '2023-02-24'),
(5415, 59, '2023-02-24'),
(5416, 13, '2023-02-25'),
(5417, 57, '2023-02-25'),
(5418, 57, '2023-02-25'),
(5419, 10, '2023-02-25'),
(5420, 27, '2023-02-25');
INSERT INTO `product_clicks` (`id`, `product_id`, `date`) VALUES
(5421, 18, '2023-02-25'),
(5422, 18, '2023-02-25'),
(5423, 55, '2023-02-25'),
(5424, 16, '2023-02-25'),
(5425, 21, '2023-02-25'),
(5426, 21, '2023-02-25'),
(5427, 40, '2023-02-25'),
(5428, 11, '2023-02-25'),
(5429, 20, '2023-02-25'),
(5430, 50, '2023-02-25'),
(5431, 50, '2023-02-25'),
(5432, 19, '2023-02-25'),
(5433, 19, '2023-02-25'),
(5434, 31, '2023-02-26'),
(5435, 29, '2023-02-26'),
(5436, 19, '2023-02-26'),
(5437, 4, '2023-02-26'),
(5438, 12, '2023-02-26'),
(5439, 12, '2023-02-26'),
(5440, 14, '2023-02-26'),
(5441, 7, '2023-02-26'),
(5442, 7, '2023-02-26'),
(5443, 13, '2023-02-26'),
(5444, 13, '2023-02-26'),
(5445, 8, '2023-02-26'),
(5446, 54, '2023-02-26'),
(5447, 54, '2023-02-26'),
(5448, 20, '2023-02-27'),
(5449, 16, '2023-02-27'),
(5450, 16, '2023-02-27'),
(5451, 59, '2023-02-27'),
(5452, 59, '2023-02-27'),
(5453, 21, '2023-02-27'),
(5454, 49, '2023-02-27'),
(5455, 56, '2023-02-27'),
(5456, 52, '2023-02-27'),
(5457, 52, '2023-02-27'),
(5458, 50, '2023-02-27'),
(5459, 50, '2023-02-27'),
(5460, 9, '2023-02-27'),
(5461, 18, '2023-02-27'),
(5462, 17, '2023-02-27'),
(5463, 17, '2023-02-27'),
(5464, 19, '2023-02-27'),
(5465, 12, '2023-02-27'),
(5466, 10, '2023-02-27'),
(5467, 51, '2023-02-27'),
(5468, 55, '2023-02-27'),
(5469, 53, '2023-02-27'),
(5470, 57, '2023-02-27'),
(5471, 57, '2023-02-27'),
(5472, 15, '2023-02-27'),
(5473, 15, '2023-02-27'),
(5474, 14, '2023-02-27'),
(5475, 58, '2023-02-27'),
(5476, 29, '2023-02-27'),
(5477, 29, '2023-02-27'),
(5478, 5, '2023-02-27'),
(5479, 5, '2023-02-27'),
(5480, 49, '2023-02-27'),
(5481, 17, '2023-02-27'),
(5482, 6, '2023-02-27'),
(5483, 6, '2023-02-27'),
(5484, 2, '2023-02-27'),
(5485, 2, '2023-02-27'),
(5486, 60, '2023-02-28'),
(5487, 3, '2023-02-28'),
(5488, 3, '2023-02-28'),
(5489, 7, '2023-02-28'),
(5490, 8, '2023-02-28'),
(5491, 8, '2023-02-28'),
(5492, 14, '2023-02-28'),
(5493, 60, '2023-02-28'),
(5494, 60, '2023-02-28'),
(5495, 4, '2023-02-28'),
(5496, 6, '2023-02-28'),
(5497, 43, '2023-02-28'),
(5498, 45, '2023-02-28'),
(5499, 45, '2023-02-28'),
(5500, 48, '2023-02-28'),
(5501, 46, '2023-02-28'),
(5502, 42, '2023-02-28'),
(5503, 47, '2023-02-28'),
(5504, 42, '2023-02-28'),
(5505, 42, '2023-02-28'),
(5506, 43, '2023-02-28'),
(5507, 39, '2023-03-01'),
(5508, 32, '2023-03-01'),
(5509, 32, '2023-03-01'),
(5510, 51, '2023-03-01'),
(5511, 51, '2023-03-01'),
(5512, 30, '2023-03-01'),
(5513, 30, '2023-03-01'),
(5514, 47, '2023-03-01'),
(5515, 47, '2023-03-01'),
(5516, 35, '2023-03-01'),
(5517, 35, '2023-03-01'),
(5518, 41, '2023-03-01'),
(5519, 41, '2023-03-01'),
(5520, 44, '2023-03-01'),
(5521, 44, '2023-03-01'),
(5522, 29, '2023-03-01'),
(5523, 29, '2023-03-01'),
(5524, 33, '2023-03-01'),
(5525, 2, '2023-03-01'),
(5526, 27, '2023-03-01'),
(5527, 37, '2023-03-01'),
(5528, 37, '2023-03-01'),
(5529, 46, '2023-03-01'),
(5530, 46, '2023-03-01'),
(5531, 36, '2023-03-01'),
(5532, 36, '2023-03-01'),
(5533, 40, '2023-03-01'),
(5534, 40, '2023-03-01'),
(5535, 45, '2023-03-01'),
(5536, 25, '2023-03-02'),
(5537, 25, '2023-03-02'),
(5538, 26, '2023-03-02'),
(5539, 28, '2023-03-02'),
(5540, 28, '2023-03-02'),
(5541, 40, '2023-03-02'),
(5542, 54, '2023-03-02'),
(5543, 28, '2023-03-02'),
(5544, 31, '2023-03-02'),
(5545, 31, '2023-03-02'),
(5546, 34, '2023-03-02'),
(5547, 34, '2023-03-02'),
(5548, 7, '2023-03-02'),
(5549, 10, '2023-03-02'),
(5550, 27, '2023-03-02'),
(5551, 60, '2023-03-03'),
(5552, 57, '2023-03-03'),
(5553, 31, '2023-03-03'),
(5554, 38, '2023-03-03'),
(5555, 6, '2023-03-03'),
(5556, 35, '2023-03-03'),
(5557, 17, '2023-03-03'),
(5558, 4, '2023-03-03'),
(5559, 28, '2023-03-03'),
(5560, 40, '2023-03-03'),
(5561, 40, '2023-03-03'),
(5562, 45, '2023-03-04'),
(5563, 19, '2023-03-04'),
(5564, 5, '2023-03-04'),
(5565, 30, '2023-03-04'),
(5566, 47, '2023-03-04'),
(5567, 55, '2023-03-04'),
(5568, 32, '2023-03-05'),
(5569, 14, '2023-03-05'),
(5570, 33, '2023-03-05'),
(5571, 39, '2023-03-05'),
(5572, 49, '2023-03-05'),
(5573, 37, '2023-03-05'),
(5574, 25, '2023-03-05'),
(5575, 25, '2023-03-05'),
(5576, 47, '2023-03-05'),
(5577, 34, '2023-03-05'),
(5578, 34, '2023-03-05'),
(5579, 39, '2023-03-05'),
(5580, 32, '2023-03-05'),
(5581, 32, '2023-03-05'),
(5582, 44, '2023-03-05'),
(5583, 30, '2023-03-05'),
(5584, 3, '2023-03-05'),
(5585, 23, '2023-03-05'),
(5586, 58, '2023-03-05'),
(5587, 27, '2023-03-05'),
(5588, 34, '2023-03-05'),
(5589, 36, '2023-03-05'),
(5590, 50, '2023-03-05'),
(5591, 6, '2023-03-06'),
(5592, 54, '2023-03-06'),
(5593, 22, '2023-03-06'),
(5594, 38, '2023-03-06'),
(5595, 31, '2023-03-06'),
(5596, 31, '2023-03-06'),
(5597, 35, '2023-03-06'),
(5598, 50, '2023-03-06'),
(5599, 57, '2023-03-06'),
(5600, 22, '2023-03-06'),
(5601, 22, '2023-03-06'),
(5602, 5, '2023-03-06'),
(5603, 58, '2023-03-06'),
(5604, 43, '2023-03-06'),
(5605, 24, '2023-03-06'),
(5606, 8, '2023-03-07'),
(5607, 30, '2023-03-07'),
(5608, 29, '2023-03-07'),
(5609, 15, '2023-03-07'),
(5610, 46, '2023-03-07'),
(5611, 23, '2023-03-07'),
(5612, 48, '2023-03-08'),
(5613, 22, '2023-03-08'),
(5614, 29, '2023-03-08'),
(5615, 24, '2023-03-08'),
(5616, 34, '2023-03-08'),
(5617, 16, '2023-03-08'),
(5618, 12, '2023-03-08'),
(5619, 42, '2023-03-08'),
(5620, 57, '2023-03-08'),
(5621, 51, '2023-03-09'),
(5622, 10, '2023-03-09'),
(5623, 19, '2023-03-09'),
(5624, 52, '2023-03-09'),
(5625, 13, '2023-03-09'),
(5626, 25, '2023-03-09'),
(5627, 23, '2023-03-09'),
(5628, 60, '2023-03-09'),
(5629, 60, '2023-03-09'),
(5630, 58, '2023-03-09'),
(5631, 25, '2023-03-09'),
(5632, 38, '2023-03-09'),
(5633, 15, '2023-03-09'),
(5634, 42, '2023-03-09'),
(5635, 21, '2023-03-09'),
(5636, 7, '2023-03-09'),
(5637, 48, '2023-03-09'),
(5638, 30, '2023-03-09'),
(5639, 18, '2023-03-09'),
(5640, 4, '2023-03-09'),
(5641, 23, '2023-03-09'),
(5642, 47, '2023-03-09'),
(5643, 29, '2023-03-09'),
(5644, 19, '2023-03-09'),
(5645, 20, '2023-03-09'),
(5646, 46, '2023-03-09'),
(5647, 41, '2023-03-09'),
(5648, 31, '2023-03-09'),
(5649, 2, '2023-03-09'),
(5650, 49, '2023-03-09'),
(5651, 54, '2023-03-09'),
(5652, 28, '2023-03-09'),
(5653, 55, '2023-03-09'),
(5654, 45, '2023-03-09'),
(5655, 26, '2023-03-09'),
(5656, 3, '2023-03-10'),
(5657, 31, '2023-03-10'),
(5658, 38, '2023-03-10'),
(5659, 60, '2023-03-10'),
(5660, 17, '2023-03-10'),
(5661, 55, '2023-03-10'),
(5662, 3, '2023-03-10'),
(5663, 14, '2023-03-11'),
(5664, 3, '2023-03-11'),
(5665, 41, '2023-03-11'),
(5666, 60, '2023-03-11'),
(5667, 4, '2023-03-11'),
(5668, 43, '2023-03-11'),
(5669, 39, '2023-03-12'),
(5670, 5, '2023-03-12'),
(5671, 14, '2023-03-12'),
(5672, 35, '2023-03-12'),
(5673, 6, '2023-03-12'),
(5674, 37, '2023-03-13'),
(5675, 15, '2023-03-13'),
(5676, 40, '2023-03-13'),
(5677, 35, '2023-03-13'),
(5678, 6, '2023-03-13'),
(5679, 13, '2023-03-13'),
(5680, 22, '2023-03-13'),
(5681, 26, '2023-03-13'),
(5682, 18, '2023-03-13'),
(5683, 18, '2023-03-13'),
(5684, 49, '2023-03-13'),
(5685, 36, '2023-03-13'),
(5686, 54, '2023-03-13'),
(5687, 16, '2023-03-13'),
(5688, 21, '2023-03-13'),
(5689, 21, '2023-03-13'),
(5690, 34, '2023-03-13'),
(5691, 18, '2023-03-13'),
(5692, 19, '2023-03-13'),
(5693, 20, '2023-03-13'),
(5694, 60, '2023-03-14'),
(5695, 46, '2023-03-14'),
(5696, 22, '2023-03-14'),
(5697, 22, '2023-03-14'),
(5698, 47, '2023-03-14'),
(5699, 7, '2023-03-15'),
(5700, 45, '2023-03-15'),
(5701, 21, '2023-03-15'),
(5702, 53, '2023-03-15'),
(5703, 12, '2023-03-15'),
(5704, 12, '2023-03-15'),
(5705, 13, '2023-03-15'),
(5706, 13, '2023-03-15'),
(5707, 13, '2023-03-15'),
(5708, 12, '2023-03-15'),
(5709, 18, '2023-03-15'),
(5710, 10, '2023-03-15'),
(5711, 53, '2023-03-15'),
(5712, 19, '2023-03-16'),
(5713, 20, '2023-03-16'),
(5714, 16, '2023-03-16'),
(5715, 16, '2023-03-16'),
(5716, 18, '2023-03-16'),
(5717, 21, '2023-03-16'),
(5718, 17, '2023-03-16'),
(5719, 17, '2023-03-16'),
(5720, 13, '2023-03-18'),
(5721, 23, '2023-03-18'),
(5722, 16, '2023-03-18'),
(5723, 12, '2023-03-18'),
(5724, 19, '2023-03-18'),
(5725, 20, '2023-03-18'),
(5726, 15, '2023-03-18'),
(5727, 14, '2023-03-18'),
(5728, 60, '2023-03-18'),
(5729, 59, '2023-03-18'),
(5730, 58, '2023-03-18'),
(5731, 57, '2023-03-18'),
(5732, 56, '2023-03-18'),
(5733, 54, '2023-03-18'),
(5734, 52, '2023-03-18'),
(5735, 53, '2023-03-18'),
(5736, 51, '2023-03-18'),
(5737, 50, '2023-03-18'),
(5738, 49, '2023-03-18'),
(5739, 48, '2023-03-18'),
(5740, 47, '2023-03-18'),
(5741, 46, '2023-03-18'),
(5742, 45, '2023-03-18'),
(5743, 44, '2023-03-18'),
(5744, 43, '2023-03-18'),
(5745, 42, '2023-03-18'),
(5746, 40, '2023-03-18'),
(5747, 41, '2023-03-18'),
(5748, 39, '2023-03-18'),
(5749, 37, '2023-03-18'),
(5750, 38, '2023-03-18'),
(5751, 35, '2023-03-18'),
(5752, 36, '2023-03-18'),
(5753, 34, '2023-03-18'),
(5754, 33, '2023-03-18'),
(5755, 31, '2023-03-18'),
(5756, 29, '2023-03-18'),
(5757, 30, '2023-03-18'),
(5758, 28, '2023-03-18'),
(5759, 32, '2023-03-18'),
(5760, 25, '2023-03-18'),
(5761, 10, '2023-03-18'),
(5762, 24, '2023-03-18'),
(5763, 6, '2023-03-18'),
(5764, 2, '2023-03-18'),
(5765, 9, '2023-03-18'),
(5766, 27, '2023-03-18'),
(5767, 11, '2023-03-18'),
(5768, 3, '2023-03-18'),
(5769, 4, '2023-03-18'),
(5770, 5, '2023-03-18'),
(5771, 7, '2023-03-18'),
(5772, 8, '2023-03-18');

-- --------------------------------------------------------

--
-- Table structure for table `ratings`
--

CREATE TABLE `ratings` (
  `id` int(191) NOT NULL,
  `user_id` int(191) NOT NULL,
  `product_id` int(191) NOT NULL,
  `review` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rating` tinyint(2) NOT NULL,
  `review_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `refunds`
--

CREATE TABLE `refunds` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `order_number` varchar(255) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `replies`
--

CREATE TABLE `replies` (
  `id` int(11) NOT NULL,
  `user_id` int(191) UNSIGNED NOT NULL,
  `comment_id` int(191) UNSIGNED NOT NULL,
  `text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `reports`
--

CREATE TABLE `reports` (
  `id` int(191) NOT NULL,
  `user_id` int(191) NOT NULL,
  `product_id` int(192) NOT NULL,
  `title` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `id` int(10) UNSIGNED NOT NULL,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subtitle` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`id`, `photo`, `title`, `subtitle`, `details`) VALUES
(4, '1557343012img.jpg', 'Jhon Smith', 'CEO & Founder', 'Lorem ipsum dolor sit amet, consectetur elitad adipiscing Cras non placerat mi.'),
(5, '1557343018img.jpg', 'Jhon Smith', 'CEO & Founder', 'Lorem ipsum dolor sit amet, consectetur elitad adipiscing Cras non placerat mi.'),
(6, '1557343024img.jpg', 'Jhon Smith', 'CEO & Founder', 'Lorem ipsum dolor sit amet, consectetur elitad adipiscing Cras non placerat mi.');

-- --------------------------------------------------------

--
-- Table structure for table `rewards`
--

CREATE TABLE `rewards` (
  `id` bigint(20) NOT NULL,
  `order_amount` double NOT NULL DEFAULT 0,
  `reward` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `rewards`
--

INSERT INTO `rewards` (`id`, `order_amount`, `reward`) VALUES
(9, 200, 15),
(10, 300, 20);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(191) NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `section` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `section`) VALUES
(16, 'Manager', 'orders , products , affilate_products , customers , vendors , vendor_subscription_plans , categories , bulk_product_upload , product_discussion , set_coupons , blog , messages , general_settings , home_page_settings , menu_page_settings , emails_settings , payment_settings , social_settings , language_settings , seo_tools , subscribers,\'role'),
(17, 'Moderator', 'orders , products , customers , vendors , categories , blog , messages , home_page_settings , payment_settings , social_settings , language_settings , seo_tools , subscribers'),
(18, 'Staff', 'orders , custom_tea_order');

-- --------------------------------------------------------

--
-- Table structure for table `sales_person`
--

CREATE TABLE `sales_person` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `govt_id_proof` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `commission` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` tinyint(10) NOT NULL DEFAULT 0,
  `ban` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sales_person`
--

INSERT INTO `sales_person` (`id`, `name`, `photo`, `address`, `phone`, `govt_id_proof`, `email`, `password`, `commission`, `created_at`, `updated_at`, `status`, `ban`) VALUES
(1, 'Test Sales Persons', '1649752060WhatsAppImage2022-04-11at6.20.39PM.jpeg', 'Sheoraphuli,Hooghly,pin:712223\r\nNear shibmandir', '9876543210', '1649752060ashta-logo-final.png', 'salesperon@yopmail.com', '$2y$10$n/hD5G2HEUmc2eFv2l0AUevQdt7lKCUO5FOYqvzp2iJTD.OaF15H6', '95.58', '2022-04-12 02:57:40', '2022-09-14 18:55:35', 1, 0),
(2, 'Subhasish ghosh', '166607552620221014_133008.jpg', 'Mahishya para.khardah kol 700117', '8697228555', '1666075526IMG-20210928-WA0006.jpeg', 'Ghosh.subhasish1985@gmail.com', '$2y$10$cb3Coq/PP4fo3Zw86BWMtOm6GVjAHEGvmkX96LfIP2o2NHpGn23KK', '0', '2022-10-18 06:45:26', '2022-10-18 06:45:26', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `seotools`
--

CREATE TABLE `seotools` (
  `id` int(10) UNSIGNED NOT NULL,
  `google_analytics` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_keys` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `facebook_pixels` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `seotools`
--

INSERT INTO `seotools` (`id`, `google_analytics`, `meta_keys`, `facebook_pixels`, `meta_title`, `meta_description`) VALUES
(1, '<script>//Google Analytics Scriptfffffffffffffffffffffffssssfffffs</script>', '[\"fkhk\",\"fgujdfjk\",\"jfhjd\",\"dtyii\"]', '<script>//Google Pixels Script</script>', 'dsfdsaf', 'asdfads');

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `id` int(191) NOT NULL,
  `user_id` int(191) NOT NULL DEFAULT 0,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `details` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `services`
--

INSERT INTO `services` (`id`, `user_id`, `title`, `details`, `photo`) VALUES
(2, 0, 'FREE SHIPPING', 'Free Shipping All Order', '1651817708free-50x50.png'),
(3, 0, 'PAYMENT METHOD', 'Secure Payment', '1651817722pay-1-50x50.png'),
(4, 0, '7 DAY RETURNS', '7-Day Return Policy', '1651817743fast-50x50.png'),
(5, 0, 'HELP CENTER', '24/7 Support System', '165181767124x7-50x50.png');

-- --------------------------------------------------------

--
-- Table structure for table `shippings`
--

CREATE TABLE `shippings` (
  `id` int(11) NOT NULL,
  `user_id` int(191) NOT NULL DEFAULT 0,
  `title` text DEFAULT NULL,
  `subtitle` text DEFAULT NULL,
  `price` double NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `shippings`
--

INSERT INTO `shippings` (`id`, `user_id`, `title`, `subtitle`, `price`) VALUES
(1, 0, 'Shipping: Free', '(10 - 12 days)', 0),
(2, 0, 'Shipping: 49.00', '(5 - 6 days)', 49);

-- --------------------------------------------------------

--
-- Table structure for table `sliders`
--

CREATE TABLE `sliders` (
  `id` int(191) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `subtitle_text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subtitle_size` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subtitle_color` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subtitle_anime` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title_text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title_size` varchar(50) DEFAULT NULL,
  `title_color` varchar(50) DEFAULT NULL,
  `title_anime` varchar(50) DEFAULT NULL,
  `details_text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `details_size` varchar(50) DEFAULT NULL,
  `details_color` varchar(50) DEFAULT NULL,
  `details_anime` varchar(50) DEFAULT NULL,
  `photo` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sliders`
--

INSERT INTO `sliders` (`id`, `user_id`, `subtitle_text`, `subtitle_size`, `subtitle_color`, `subtitle_anime`, `title_text`, `title_size`, `title_color`, `title_anime`, `details_text`, `details_size`, `details_color`, `details_anime`, `photo`, `position`, `link`) VALUES
(9, NULL, 'Natural', '24', '#1f224f', 'slideInUp', 'Tea Brewing', '60', '#1f224f', 'slideInDown', 'Natural Tea Make Us Happy', '16', '#1f224f', 'slideInDown', 'zonzWTtNAstha Tea.png', 'slide-three', '/custom-tea'),
(10, NULL, 'Take The First Step', '24', '#1f224f', 'slideInUp', 'Toward A', '60', '#1f224f', 'slideInDown', 'Healthy Lifestyle', '16', '#1f224f', 'slideInLeft', 'ZYS8hK3K1.png', 'slide-one', '/category/tea-leaf'),
(12, 13, 'World Fashion', '24', '#c32d2d', 'slideInUp', 'Get Up to 40% Off', '60', '#bc2727', 'slideInDown', 'Highlight your personality  and look with these fabulous and exquisite fashion.', '16', '#c51d1d', 'slideInLeft', '16194231771564224870012.jpg', 'slide-one', 'https://www.google.com/'),
(13, 13, 'World Fashion', '24', '#ffffff', 'slideInUp', 'Get Up to 40% Off', '60', '#ffffff', 'slideInDown', 'Highlight your personality  and look with these fabulous and exquisite fashion.', '16', '#ffffff', 'slideInDown', '1619423602FUxWhdGr1564224753007.jpg', 'slide-one', 'https://www.linkedin.com/'),
(15, 22, 'Reference site about Lorem Ipsum,', '45', '#000000', 'fadeIn', 'Reference site about Lorem Ipsum', '45', '#000000', 'fadeIn', 'Reference site about Lorem Ipsum,', '54', '#000000', 'fadeIn', '16217659481564224753007.jpg', 'slide-two', 'https://www.google.com/');

-- --------------------------------------------------------

--
-- Table structure for table `socialsettings`
--

CREATE TABLE `socialsettings` (
  `id` int(10) UNSIGNED NOT NULL,
  `facebook` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gplus` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `twitter` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `linkedin` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dribble` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `instagram` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `f_status` tinyint(4) NOT NULL DEFAULT 1,
  `g_status` tinyint(4) NOT NULL DEFAULT 1,
  `t_status` tinyint(4) NOT NULL DEFAULT 1,
  `l_status` tinyint(4) NOT NULL DEFAULT 1,
  `d_status` tinyint(4) NOT NULL DEFAULT 1,
  `i_status` tinyint(4) DEFAULT 1,
  `f_check` tinyint(10) DEFAULT NULL,
  `g_check` tinyint(10) DEFAULT NULL,
  `fclient_id` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fclient_secret` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fredirect` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gclient_id` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gclient_secret` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gredirect` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `socialsettings`
--

INSERT INTO `socialsettings` (`id`, `facebook`, `gplus`, `twitter`, `linkedin`, `dribble`, `instagram`, `f_status`, `g_status`, `t_status`, `l_status`, `d_status`, `i_status`, `f_check`, `g_check`, `fclient_id`, `fclient_secret`, `fredirect`, `gclient_id`, `gclient_secret`, `gredirect`) VALUES
(1, 'https://www.facebook.com/asthatea.india', 'https://plus.google.com/', 'https://twitter.com/', 'https://www.linkedin.com/', 'https://dribbble.com/', 'https://www.instagram.com/astha.tea/', 1, 0, 0, 0, 0, 1, 1, 1, '503140663460329', 'f66cd670ec43d14209a2728af26dcc43', 'https://localhost/geniuscart1.7.4/auth/facebook/callback', '904681031719-sh1aolu42k7l93ik0bkiddcboghbpcfi.apps.googleusercontent.com', 'yGBWmUpPtn5yWhDAsXnswEX3', 'http://localhost/geniuscart1.7.4/auth/google/callback');

-- --------------------------------------------------------

--
-- Table structure for table `social_providers`
--

CREATE TABLE `social_providers` (
  `id` int(191) NOT NULL,
  `user_id` int(191) NOT NULL,
  `provider_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `provider` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `states`
--

CREATE TABLE `states` (
  `id` bigint(20) NOT NULL,
  `country_id` int(11) NOT NULL DEFAULT 0,
  `state` varchar(111) DEFAULT NULL,
  `tax` double NOT NULL DEFAULT 0,
  `status` int(11) NOT NULL DEFAULT 1,
  `owner_id` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `states`
--

INSERT INTO `states` (`id`, `country_id`, `state`, `tax`, `status`, `owner_id`) VALUES
(1, 246, 'Virginia', 100, 1, 0),
(2, 245, 'New Youk', 2, 1, 0),
(3, 246, 'dhaka', 10, 1, 0),
(5, 100, 'Andhra Pradesh', 0, 1, 0),
(6, 100, 'Andaman and Nicobar Islands', 0, 1, 0),
(7, 100, 'Arunachal Pradesh', 0, 1, 0),
(8, 100, 'Assam', 0, 1, 0),
(9, 100, 'Bihar', 0, 1, 0),
(10, 100, 'Chandigarh', 0, 1, 0),
(11, 100, 'Chhattisgarh', 0, 1, 0),
(12, 100, 'Dadar and Nagar Haveli', 0, 1, 0),
(13, 100, 'Daman and Diu', 0, 1, 0),
(14, 100, 'Delhi', 0, 1, 0),
(15, 100, 'Lakshadweep', 0, 1, 0),
(16, 100, 'Puducherry', 0, 1, 0),
(17, 100, 'Goa', 0, 1, 0),
(18, 100, 'Gujarat', 0, 1, 0),
(19, 100, 'Haryana', 0, 1, 0),
(20, 100, 'Himachal Pradesh', 0, 1, 0),
(21, 100, 'Jammu and Kashmir', 0, 1, 0),
(22, 100, 'Jharkhand', 0, 1, 0),
(23, 100, 'Karnataka', 0, 1, 0),
(24, 100, 'Kerala', 0, 1, 0),
(25, 100, 'Madhya Pradesh', 0, 1, 0),
(26, 100, 'Maharashtra', 0, 1, 0),
(27, 100, 'Manipur', 0, 1, 0),
(28, 100, 'Meghalaya', 0, 1, 0),
(29, 100, 'Mizoram', 0, 1, 0),
(30, 100, 'Nagaland', 0, 1, 0),
(31, 100, 'Odisha', 0, 1, 0),
(32, 100, 'Punjab', 0, 1, 0),
(33, 100, 'Rajasthan', 0, 1, 0),
(34, 100, 'Sikkim', 0, 1, 0),
(35, 100, 'Tamil Nadu', 0, 1, 0),
(36, 100, 'Telangana', 0, 1, 0),
(37, 100, 'Tripura', 0, 1, 0),
(38, 100, 'Uttar Pradesh', 0, 1, 0),
(39, 100, 'Uttarakhand', 0, 1, 0),
(40, 100, 'West Bengal', 0, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `subcategories`
--

CREATE TABLE `subcategories` (
  `id` int(191) NOT NULL,
  `category_id` int(191) NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `subcategories`
--

INSERT INTO `subcategories` (`id`, `category_id`, `name`, `slug`, `status`) VALUES
(2, 5, 'Rolled Biscuits', 'rolled-biscuits', 1),
(6, 4, 'Skimmed Milk Powder', 'skimmed-milk-powder', 1),
(7, 4, 'Dehydrated', 'dehydrated', 1),
(18, 5, 'Chocolate Chip Cookies', 'chocolate-chip-cookies', 1),
(19, 5, 'Drop Biscuits', 'drop-biscuits', 1),
(20, 5, 'Sugar Cookies', 'sugar-cookies', 1),
(21, 8, 'Porcelain', 'porcelain', 1),
(22, 8, 'Stainless Steel', 'stainless-steel', 1),
(23, 11, 'Regular', 'regular', 1),
(24, 11, 'Sanding Sugar', 'sanding-sugar', 1),
(25, 11, 'Brown Sugar', 'brown-sugar', 1),
(26, 18, 'Assam', 'assam', 1),
(27, 18, 'Darjeeling', 'darjeeling', 1),
(28, 20, 'Crushed', 'crushed', 1),
(29, 20, 'Roasted', 'Roasted', 1),
(30, 18, 'Green Tea', 'green-tea', 1);

-- --------------------------------------------------------

--
-- Table structure for table `subscribers`
--

CREATE TABLE `subscribers` (
  `id` int(191) NOT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `subscribers`
--

INSERT INTO `subscribers` (`id`, `email`) VALUES
(1, 'admin@gmail.com'),
(2, 'a34dmin@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `subscriptions`
--

CREATE TABLE `subscriptions` (
  `id` int(11) NOT NULL,
  `title` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double NOT NULL DEFAULT 0,
  `days` int(11) NOT NULL,
  `allowed_products` int(11) NOT NULL DEFAULT 0,
  `details` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `subscriptions`
--

INSERT INTO `subscriptions` (`id`, `title`, `price`, `days`, `allowed_products`, `details`) VALUES
(5, 'Standard', 60, 45, 25, '<ol><li>Lorem ipsum dolor sit amet<br></li><li>Lorem ipsum dolor sit ame<br></li><li>Lorem ipsum dolor sit am<br></li></ol>'),
(6, 'Premium', 120, 90, 90, '<span style=\"color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" text-align:=\"\" justify;\"=\"\">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</span><br>'),
(7, 'Unlimited', 250, 365, 0, '<span style=\"color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" text-align:=\"\" justify;\"=\"\">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</span><br>'),
(8, 'Basic', 0, 30, 0, '<ol><li>Lorem ipsum dolor sit amet<br></li><li>Lorem ipsum dolor sit ame<br></li><li>Lorem ipsum dolor sit am<br></li></ol>'),
(9, 'Khana', 50, 30, 0, 'gfjhetueryur');

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` int(11) NOT NULL,
  `user_id` int(191) DEFAULT NULL,
  `txn_number` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` double DEFAULT 0,
  `currency_sign` blob DEFAULT NULL,
  `currency_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency_value` double NOT NULL DEFAULT 0,
  `method` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `txnid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `details` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reward_point` int(11) NOT NULL DEFAULT 0,
  `reward_dolar` double NOT NULL DEFAULT 0,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'plus, minus , reward',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id`, `user_id`, `txn_number`, `amount`, `currency_sign`, `currency_code`, `currency_value`, `method`, `txnid`, `details`, `reward_point`, `reward_dolar`, `type`, `created_at`, `updated_at`) VALUES
(25, 22, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, 5, 1, 'reward', '2021-05-21 22:26:34', '2021-05-21 22:26:34'),
(26, 22, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, 20, 4, 'reward', '2021-05-21 22:30:41', '2021-05-21 22:30:41'),
(27, 22, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, 5, 1, 'reward', '2021-05-21 22:31:09', '2021-05-21 22:31:09'),
(28, 22, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, 5, 1, 'reward', '2021-05-21 22:31:41', '2021-05-21 22:31:41'),
(29, 22, 'cwg7927ze0', 30, 0x24, 'USD', 1, 'Voguepay', NULL, 'Payment Deposit', 0, 0, 'plus', '2021-05-22 04:05:27', '2021-05-22 04:05:27'),
(30, 22, '8fc8040B1J', 30, 0x24, 'USD', 1, 'Voguepay', NULL, 'Payment Deposit', 0, 0, 'plus', '2021-05-22 04:07:20', '2021-05-22 04:07:20'),
(31, 22, 'rdL80628D3', 30, 0x24, 'USD', 1, 'Voguepay', NULL, 'Payment Deposit', 0, 0, 'plus', '2021-05-22 04:07:42', '2021-05-22 04:07:42'),
(32, 22, 'prP0419AxH', 30, 0x24, 'USD', 1, 'Flutterwave', '2169937', 'Payment Deposit', 0, 0, 'plus', '2021-05-22 21:26:59', '2021-05-22 21:26:59'),
(33, 22, 'lSn0462tO6', 30, 0x24, 'USD', 1, 'Flutterwave', '2169937', 'Payment Deposit', 0, 0, 'plus', '2021-05-22 21:27:42', '2021-05-22 21:27:42'),
(34, 31, '2cZ1866LpX', 30, 0x24, 'USD', 1, 'Molly Payment', 'tr_NbQmvzkRB7', 'Payment Deposit', 0, 0, 'plus', '2021-05-22 21:51:06', '2021-05-22 21:51:06'),
(35, 31, '3P919464t5', 0, 0x24, 'USD', 0, 'Stripe', '1237026395', 'Payment Deposit', 0, 0, 'plus', '2021-05-22 21:52:26', '2021-05-22 21:52:26'),
(36, 22, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, 55, 11, 'reward', '2021-05-23 04:38:26', '2021-05-23 04:38:26'),
(37, 22, 'j3Q5825kTR', 30, 0x24, 'USD', 1, 'Stripe', 'txn_1IxSt3JlIV5dN9n7mwAnAiRL', 'Payment Deposit', 0, 0, 'plus', '2021-06-01 02:23:45', '2021-06-01 02:23:45'),
(38, 22, 'YMW5857Q2O', 4.2, 0x24, 'USD', 1, 'Stripe', 'txn_1IxStZJlIV5dN9n7urHmoKgR', 'Payment Deposit', 0, 0, 'plus', '2021-06-01 02:24:17', '2021-06-01 02:24:17'),
(39, 22, '5oE6005YAw', 29, 0x24, 'USD', 1, 'Paypal', '7RE45971877283057', 'Payment Deposit', 0, 0, 'plus', '2021-06-01 02:26:45', '2021-06-01 02:26:45'),
(40, 22, 'EHH6006k34', 29, 0x24, 'USD', 1, 'Paypal', '7RE45971877283057', 'Payment Deposit', 0, 0, 'plus', '2021-06-01 02:26:46', '2021-06-01 02:26:46'),
(41, 22, 'xBZ6117S25', 31, 0x24, 'USD', 1, 'Paypal', '0L139347RN190154K', 'Payment Deposit', 0, 0, 'plus', '2021-06-01 02:28:37', '2021-06-01 02:28:37'),
(42, 22, '5Dy6151hzm', 30, 0x24, 'USD', 1, 'Molly Payment', 'tr_hzPkx4845T', 'Payment Deposit', 0, 0, 'plus', '2021-06-01 02:29:11', '2021-06-01 02:29:11'),
(43, 22, 'nUo6211t04', 3.5448422545197, 0xe0a7b3, 'BDT', 84.63, 'SSLCommerz', 'SSLCZ_TXN_60b5eff5053d3', 'Payment Deposit', 0, 0, 'plus', '2021-06-01 02:30:11', '2021-06-01 02:30:11'),
(44, 13, 'tSC0622DQN', 14503.263234228, 0xe282b9, 'INR', 68.95, NULL, NULL, '1162123', 0, 0, 'plus', '2022-02-16 03:07:02', '2022-02-16 03:07:02'),
(45, 22, 'XDh7578ooL', 120, 0xe282b9, 'INR', 1, NULL, NULL, 'Payment Via Wallet', 0, 0, 'minus', '2022-03-18 23:56:18', '2022-03-18 23:56:18'),
(46, 22, 'xzc7581YWS', 120, 0xe282b9, 'INR', 1, NULL, NULL, 'Payment Via Wallet', 0, 0, 'minus', '2022-03-18 23:56:21', '2022-03-18 23:56:21'),
(47, 22, 'fqn7583HV8', 120, 0xe282b9, 'INR', 1, NULL, NULL, 'Payment Via Wallet', 0, 0, 'minus', '2022-03-18 23:56:23', '2022-03-18 23:56:23'),
(48, 22, 'g9m75830Li', 120, 0xe282b9, 'INR', 1, NULL, NULL, 'Payment Via Wallet', 0, 0, 'minus', '2022-03-18 23:56:23', '2022-03-18 23:56:23'),
(49, 22, 'yqL76069WD', 120, 0xe282b9, 'INR', 1, NULL, NULL, 'Payment Via Wallet', 0, 0, 'minus', '2022-03-18 23:56:46', '2022-03-18 23:56:46'),
(50, 22, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, 330, 66, 'reward', '2022-03-18 23:59:25', '2022-03-18 23:59:25'),
(51, 22, 'P2p8050Lgp', 360, 0xe282b9, 'INR', 1, NULL, NULL, 'Payment Via Wallet', 0, 0, 'minus', '2022-03-19 00:04:10', '2022-03-19 00:04:10'),
(52, 22, 'HXB81423SG', 360, 0x24, 'USD', 1, NULL, NULL, 'Payment Via Wallet', 0, 0, 'minus', '2022-03-19 00:05:42', '2022-03-19 00:05:42'),
(53, 22, 'BNS8284Yec', 20, 0x24, 'USD', 1, NULL, NULL, 'Payment Via Wallet', 0, 0, 'minus', '2022-03-19 00:08:04', '2022-03-19 00:08:04'),
(54, 22, 'PDD8284QhM', 20, 0x24, 'USD', 1, NULL, NULL, 'Payment Via Wallet', 0, 0, 'minus', '2022-03-19 00:08:04', '2022-03-19 00:08:04'),
(55, 40, 'rGH3669XAm', 3, 0xe282b9, 'INR', 1, NULL, NULL, 'Payment Via Wallet', 0, 0, 'minus', '2022-05-12 08:24:29', '2022-05-12 08:24:29'),
(56, 40, 'qgf5842tzm', 2, 0xe282b9, 'INR', 1, NULL, NULL, 'Payment Via Wallet', 0, 0, 'minus', '2022-05-16 10:14:02', '2022-05-16 10:14:02'),
(57, 40, 'qck1166ZXR', 2, 0xe282b9, 'INR', 1, NULL, NULL, 'Payment Via Wallet', 0, 0, 'minus', '2022-05-17 23:49:26', '2022-05-17 23:49:26'),
(58, 40, 'B0j96704Tm', 5, 0xe282b9, 'INR', 1, NULL, NULL, 'Payment Via Wallet', 0, 0, 'minus', '2022-05-24 02:37:50', '2022-05-24 02:37:50'),
(59, 40, 'ZZH0254Zul', 1, 0xe282b9, 'INR', 1, NULL, NULL, 'Payment Via Wallet', 0, 0, 'minus', '2022-05-24 02:47:34', '2022-05-24 02:47:34'),
(60, 40, 'Xr20788WmU', 1, 0xe282b9, 'INR', 1, NULL, NULL, 'Payment Via Wallet', 0, 0, 'minus', '2022-05-25 09:29:48', '2022-05-25 09:29:48');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `registered_by` bigint(20) DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` int(11) DEFAULT 0,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `family_member` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currently_using_tea_brand` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `monthly_consuming_tea_weight` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `monthly_tea_cost` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tea_type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `preferred_time_to_receive_call_from_our_tea_expert` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_type` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'domestic',
  `fax` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_provider` tinyint(10) NOT NULL DEFAULT 0,
  `status` tinyint(10) NOT NULL DEFAULT 0,
  `verification_link` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified` enum('Yes','No') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'No',
  `f_url` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `g_url` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `t_url` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `l_url` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `f_check` tinyint(1) NOT NULL DEFAULT 0,
  `g_check` tinyint(1) NOT NULL DEFAULT 0,
  `t_check` tinyint(1) NOT NULL DEFAULT 0,
  `l_check` tinyint(1) NOT NULL DEFAULT 0,
  `mail_sent` tinyint(1) NOT NULL DEFAULT 0,
  `shipping_cost` double NOT NULL DEFAULT 0,
  `current_balance` double NOT NULL DEFAULT 0,
  `balance` double NOT NULL DEFAULT 0,
  `date` date DEFAULT NULL,
  `ban` tinyint(1) NOT NULL DEFAULT 0,
  `reward` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `registered_by`, `name`, `photo`, `zip`, `city`, `country`, `state`, `address`, `phone`, `family_member`, `currently_using_tea_brand`, `monthly_consuming_tea_weight`, `monthly_tea_cost`, `tea_type`, `preferred_time_to_receive_call_from_our_tea_expert`, `user_type`, `fax`, `email`, `password`, `remember_token`, `created_at`, `updated_at`, `is_provider`, `status`, `verification_link`, `email_verified`, `f_url`, `g_url`, `t_url`, `l_url`, `f_check`, `g_check`, `t_check`, `l_check`, `mail_sent`, `shipping_cost`, `current_balance`, `balance`, `date`, `ban`, `reward`) VALUES
(1, NULL, 'Sougat Basu', NULL, NULL, NULL, NULL, 0, NULL, '8981365361', NULL, NULL, NULL, NULL, NULL, NULL, 'domestic', NULL, 'jackfruitwork@gmail.com', NULL, NULL, '2022-08-19 11:24:28', '2022-08-19 11:24:28', 0, 0, NULL, 'No', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0),
(2, 1, 'ARBIND KUMAR SINGH', NULL, NULL, NULL, NULL, 0, 'GODREJ PRAKRITI.SODEPORE.KABERI \r\nROOM NO 1001', '9903090119', '4+1', 'Red lebel', '3 kgs', '3000', NULL, NULL, 'domestic', NULL, 'arbind.singh@tmtsshipping.com', '$2y$10$H70elDe8BfVFFPsjfzH5geQpz0iKvSrlzidB9RGifLSL10gLuHvXu', NULL, '2022-08-21 16:16:47', '2022-08-21 16:16:47', 0, 0, NULL, 'No', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0),
(3, 1, 'Balaran barman', NULL, NULL, NULL, NULL, 0, 'DANGA DIKHLA KHAR BAGAN.PATULIA KHARDAH.KOL 700119', '9330062418', '2+1', 'Loose tea', '500', '200', NULL, NULL, 'domestic', NULL, NULL, '$2y$10$mJenBqN2DMezjC53DSQx7eeyV/AjfdW1ARyfkJ6kSkIonPS5zo9xq', NULL, '2022-08-24 06:28:01', '2022-08-24 06:28:01', 0, 0, NULL, 'No', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0),
(4, 1, 'musatac ahmed', NULL, NULL, NULL, NULL, 0, 'p.k.biswas road khardah', '9330222525', '4', 'TATA TEA', '500', '300', NULL, NULL, 'domestic', NULL, 'mustaque.ahmad21@GMAIL.COM', '$2y$10$GX0OY/yst7DP5HClfStBNuHcUEADbB/65Hts0za4YkA0ioMR9ZTYa', NULL, '2022-08-24 16:24:50', '2022-08-24 16:24:50', 0, 0, NULL, 'No', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0),
(5, 1, 'Komol Das', NULL, NULL, NULL, NULL, 0, 'Sodero bajar berackpur code', '8017298604', '3', 'TATA primium', '400gm', '30/-', NULL, NULL, 'domestic', NULL, 'kd2166345@gmail.com', '$2y$10$L7rkTV5j/TsuQNIDWnSVTe/ANBuDMdPwWn.xfRBxvr/0eGlKUcUcC', NULL, '2022-08-25 15:44:24', '2022-08-25 15:44:24', 0, 0, NULL, 'No', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0),
(6, 1, 'SHUBHASISH HALDER', NULL, NULL, NULL, NULL, 0, '91/1 DESHBANDHU ROAD.BARANAGAR.KOL 700035', '7003747894', '6+1', 'Tata gold', '500', '300', NULL, NULL, 'domestic', NULL, 'halder.subhasis0@gmail.com', '$2y$10$K9UoVf9lR3SeYixmDV.hReerD/pZLAKd7MsG4NylU2NqS5.ZX6Jfi', NULL, '2022-08-26 06:38:26', '2022-08-26 06:38:26', 0, 0, NULL, 'No', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0),
(7, 1, 'Prodip Sethi', NULL, NULL, NULL, NULL, 0, 'Panihati near axis bank', '6290862226', '4', 'TATA primium', '400gm', '200', NULL, NULL, 'domestic', NULL, 'timpradip6@gmail.com', '$2y$10$bP74M8S3cLlDAXW04GPVXOU2VSitRTasqoGwPKs0cvM1qaAltU0Ma', NULL, '2022-08-28 12:57:51', '2022-08-28 12:57:51', 0, 0, NULL, 'No', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0),
(8, 1, 'JINIA GUHA THAKURTA', NULL, NULL, NULL, NULL, 0, '1 no Sursosen Nagar.khardah.kol 700117', '7980210150', '2+2', 'Tata tea ayurveda', '250', '75', NULL, NULL, 'domestic', NULL, 'jiniaguhathakurta1986@gmail.com', '$2y$10$lOOzhZjtxiSZcHWuG93M0.WDwIKif0MPQ22HXueTagM/4igUAS172', NULL, '2022-08-31 16:35:09', '2022-08-31 16:35:09', 0, 0, NULL, 'No', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0),
(9, 1, 'SHOVON DAS', NULL, NULL, NULL, NULL, 0, 'Khardah.daspara.near cesc office', '9831934403', '8+2', 'TATA TEA', '1kgs', '300', NULL, NULL, 'domestic', NULL, 'shovon.tuku@gmail.com', '$2y$10$lP7L4BhN3TcqCdoRrWwJReSJHTpjulB8W/Wi5CLpxumMG5pXZgpnu', NULL, '2022-09-06 16:35:27', '2022-09-06 16:35:27', 0, 0, NULL, 'No', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0),
(10, 1, 'Golam murshek', NULL, NULL, NULL, NULL, 0, '24no Bajaj Mahal sador bajer berackpur', '9883187629', '3', 'TATA', '300', '165', NULL, NULL, 'domestic', NULL, 'gmurshed8@g.com', '$2y$10$ou09A4AcFX33PpLoT718lOQQgTbyjR13NQz6XlqsmU9Vc/YyaBtUe', NULL, '2022-09-07 13:38:27', '2022-09-07 13:38:27', 0, 0, NULL, 'No', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0),
(11, 1, 'MD NAYYAR AZAM', NULL, NULL, NULL, NULL, 0, 'Suryanagar. P/o jugberia.east tegoria.sdp', '9831455636', '2+2', 'TATA GOLD RED LEBEL BROOKE BOND', '1kgs', '900', NULL, NULL, 'domestic', NULL, 'mdnayyarazam@gmail.com', '$2y$10$5c6zVvv1Ivd8bzrkJCvPJ.KIUVohRYSw92GEmtxiDcKpfN4qcaeDO', NULL, '2022-09-08 14:45:33', '2022-09-08 14:45:33', 0, 0, NULL, 'No', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0),
(12, 1, 'Dipak pathak', NULL, NULL, NULL, NULL, 0, 'Ghosh bagan.khadah kol 700117', '7980436694', '2', 'TATA TEA GOLD', '1kgs', '300', NULL, NULL, 'domestic', NULL, 'dipakpathak@gmail.com', '$2y$10$L248XFuk71pXCDlc8YGJGuSm8OWCpLEdWexNTqbzi8H.0A11TEQTu', NULL, '2022-09-09 14:24:19', '2022-09-09 14:24:19', 0, 0, NULL, 'No', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0),
(13, 1, 'MD ASLAM', NULL, NULL, NULL, NULL, 0, 'Cheque post.solo para.old calcutta road.kol 119 near solo para jama masdid', '9831572991', '6', 'Local tea', '500', '150', NULL, NULL, 'domestic', NULL, NULL, '$2y$10$Qbyfi6LFhl71Z/SkxCqOWuyIGQTj2QN5k9Ddb6RfASQp7AAHEpS8W', NULL, '2022-09-11 11:28:50', '2022-09-11 11:28:50', 0, 0, NULL, 'No', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0),
(14, 1, 'Sk juel', NULL, NULL, NULL, NULL, 0, 'Old calcutta road mondol para kol 700119 near sona cycle', '9831636616', '4+1', 'Local tea', '500', '150', NULL, NULL, 'domestic', NULL, NULL, '$2y$10$jq2fedQZp90TgmFnDsrzqu/MIL/XWPvry.qEW4PTnXsos.n7jgUPa', NULL, '2022-09-11 11:34:24', '2022-09-11 11:34:24', 0, 0, NULL, 'No', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0),
(15, 1, 'Shibashis pal', NULL, NULL, NULL, NULL, 0, 'Madhur Math bospara khardah', '7980160048', '4', 'TATA', '1KG', '1000', NULL, NULL, 'domestic', NULL, 'shibashispal.13@g.com', '$2y$10$Mr6GYg0jaJdS9BkUkMl2DO6zVi6LRzPbhccHY.YN/gHYp47F5.pu.', NULL, '2022-09-11 16:29:42', '2022-09-11 16:29:42', 0, 0, NULL, 'No', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0),
(16, 1, 'Eshika goshami', NULL, NULL, NULL, NULL, 0, 'Ramkrishna polli Rahara', '8910392548', '5+1', 'TATA', '500gm', '250', NULL, NULL, 'domestic', NULL, 'Eshika.eleektical1990@g.com', '$2y$10$kd4qaBjzgs.P5trcjx7w8uhU.bZ0IEsuiwmh6Z1gxNwhNYEQW3aDi', NULL, '2022-09-13 15:19:44', '2022-09-13 15:19:44', 0, 0, NULL, 'No', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0),
(17, 1, 'Arindam das', NULL, NULL, NULL, NULL, 0, 'Sodepur', '8902812098', '3', 'Lokal', '300', '75', NULL, NULL, 'domestic', NULL, 'dasrudhro@gmail.com', '$2y$10$Q9iEPltABwFZ.vZH/RchXu.nCQyM6ezRzc0b3zXoR551N/YkfMg9.', NULL, '2022-09-27 14:39:02', '2022-09-27 14:39:02', 0, 0, NULL, 'No', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0),
(18, 1, 'Alok kumerbhatacharji', NULL, NULL, NULL, NULL, 0, 'E5/104piarlesh ngor', '9674328260', '2', 'Boshak tea', '500', '300', NULL, NULL, 'domestic', NULL, 'Ab138861@gmeil.com', '$2y$10$ExnIkYpkmVF2uaJfW7SJKerGRF83sTegiBdLVywB/3WFsLIryVl/O', NULL, '2022-09-27 14:50:09', '2022-09-27 14:50:09', 0, 0, NULL, 'No', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0),
(19, 1, 'Shidharto biswas', NULL, NULL, NULL, NULL, 0, 'E48Adorsho polli', '7980027278', '3', 'Darjiling', '250', '500', NULL, NULL, 'domestic', NULL, 'Erem.biswas@gmail.com', '$2y$10$tnl/IGp7MzcvqCLpamS7XOCjEtXGl6sLgpbCxJ0AYHKeTD/DQOqnm', NULL, '2022-09-30 15:35:02', '2022-09-30 15:35:02', 0, 0, NULL, 'No', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0),
(20, 1, 'ABHIJIT ROY', NULL, NULL, NULL, NULL, 0, 'Adarsha pally.khardah.E/35 kol 700116', '8777862543', '2+1', 'Tata tea premium', '250', '200', NULL, NULL, 'domestic', NULL, 'abhijitr2002@yahoo.com', '$2y$10$fxbtunFfp.sPgV/VjZ.fg.6Lz.RLOyD8QuWdeDgP18EBvj.wggnRO', NULL, '2022-10-01 07:01:45', '2022-10-01 07:01:45', 0, 0, NULL, 'No', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0),
(21, 1, 'Mohuya das', NULL, NULL, NULL, NULL, 0, 'Lichu bagan', '9051945442', '3', 'TATA', '500', '500', NULL, NULL, 'domestic', NULL, 'swapaildas18403@gilme.com', '$2y$10$Ns858hLV5NgZb/0SMRDBSOnnF9MPBLKg8HrxCD5Q/OoD/qv0CZfxq', NULL, '2022-10-01 15:27:44', '2022-10-01 15:27:44', 0, 0, NULL, 'No', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0),
(22, 1, 'Sanjan jhunjhun wola', NULL, NULL, NULL, NULL, 0, 'Boloram apartment Ms mukharji rode', '9831193885', '3', 'TATA', '1kg', '1000gm', NULL, NULL, 'domestic', NULL, 'sanjanjhunwola94@gmail.com', '$2y$10$V9gRqZoFthUGSZsAstmZcutMv0i89sIatRYy8w9aDMpXbkWpPG9F.', NULL, '2022-10-02 17:31:52', '2022-10-02 17:31:52', 0, 0, NULL, 'No', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0),
(23, 1, 'Sahid aktar', NULL, NULL, NULL, NULL, 0, '6no station road titagor', '9331217422', '5+3', 'Normal', '500', '250', NULL, NULL, 'domestic', NULL, 'shahidd251@gemil.com', '$2y$10$sdoxOKX8SB0B6JYKurTSQ.pq0fi3cjc6z.EwNJQQOq1ghLV5c.7j.', NULL, '2022-10-07 12:47:27', '2022-10-07 12:47:27', 0, 0, NULL, 'No', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0),
(24, 1, 'Partho Sinha', NULL, NULL, NULL, NULL, 0, 'Echa pur', '7980233503', '3+1', 'TATA', '500', '250', NULL, NULL, 'domestic', NULL, 'sinhapartho79@gemil.com', '$2y$10$G96/2sSaQ4bMKhHq/wctfO5hofCbGC/2vTuaiUViA5hpyEWd/PiCi', NULL, '2022-10-07 16:02:15', '2022-10-07 16:02:15', 0, 0, NULL, 'No', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0),
(25, 1, 'Pankaj bharadwaj', NULL, NULL, NULL, NULL, 0, 'Khardah kol 700117', '8745923724', '3+1', 'TATA primium', '1KG', '500', NULL, NULL, 'domestic', NULL, NULL, '$2y$10$Hs.JhB3FP1eHypDYZBzQCe06CB6YUzgfma7r8w4gwhpGHFCf.D0Tq', NULL, '2022-10-07 17:23:52', '2022-10-07 17:23:52', 0, 0, NULL, 'No', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0),
(26, 1, 'Alok ray', NULL, NULL, NULL, NULL, 0, '58/48biti rode khardah', '9002079938', '3', 'TATA', '250', '200', NULL, NULL, 'domestic', NULL, 'Alokeray966@gmail.com', '$2y$10$weBm5mBq54r6BATJGUdv/.aehUvqLqNP2pxPPBnOwfid5bhMVKcyK', NULL, '2022-10-08 14:37:59', '2022-10-08 14:37:59', 0, 0, NULL, 'No', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0),
(27, 1, 'Md rezwan ansari', NULL, NULL, NULL, NULL, 0, '10 M G ROAD TITAGHAR PURANI BAZAR', '7980807539', '22', '11', '5 kg', '10000', NULL, NULL, 'domestic', NULL, 'ansari.ali0905@gmail.com', '$2y$10$CRnprlGfUV1.iWqo20uIIesFV41HYIReuRT7fMjSQOEI.p2jzxSL.', NULL, '2022-10-12 15:22:10', '2022-10-12 15:22:10', 0, 0, NULL, 'No', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0),
(28, 1, 'RAMIZ HASSAN', NULL, NULL, NULL, NULL, 0, 'G 211.BATTIKAL 2ND LANE.near sbi atm.gardenreach.kol 700024', '7439220982', '4', 'Makaibari', '2 kgs', '1000', NULL, NULL, 'domestic', NULL, 'rhansari15@gmail.com', '$2y$10$LOqfQDd0mKDdngwXSti29uU4ccmmiwqPK5aPT4Wm4CC1BBUrwYsWW', NULL, '2022-10-15 15:14:21', '2022-10-15 15:14:21', 0, 0, NULL, 'No', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0),
(29, 1, 'SANDIP SAHA', NULL, NULL, NULL, NULL, 0, '53.muchi more.sadar bazar barrackpore.', '7980633846', '2', 'TATA TEA GOLD', '300', '100', NULL, NULL, 'domestic', NULL, 'sandipsahara088@gmail.com', '$2y$10$cX/l1UKuy1LHY9qYWyjgKuLd/cggjKJkJ2moVo20L.Tv4cujgGx8S', NULL, '2022-10-16 14:47:40', '2022-10-16 14:47:40', 0, 0, NULL, 'No', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0),
(30, 1, 'Dinesh mishra', NULL, NULL, NULL, NULL, 0, 'Ghosh bagan.khardah', '9123636772', '4+1', 'Loose tea', '1kgs', '610', NULL, NULL, 'domestic', NULL, NULL, '$2y$10$Ro9r27ZPMCoaWc8dNRSb1.h3cB7Re66ogtObRrTcvi0JOPU3l1JRu', NULL, '2022-10-16 15:22:49', '2022-10-16 15:22:49', 0, 0, NULL, 'No', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0),
(31, 1, 'Tanweer', NULL, NULL, NULL, NULL, 0, '327/133 Arbinda Nagar moral par lal each khola 700118', '9831669603', '4', 'Tata', '1kgs', '610', NULL, NULL, 'domestic', NULL, 'tanweer.n@yahoo.com', '$2y$10$RxibDR5WNAqFxO1AGBazveipbmttiMNrl5N5y5UlYspTHGo7BmE/2', NULL, '2022-10-16 16:48:43', '2022-10-16 16:48:43', 0, 0, NULL, 'No', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0),
(32, 1, 'gaya singh', NULL, NULL, NULL, NULL, 0, 'r.p.gupta path.po titagarh.thana khardah.near angli vernacular high school.kol 700119', '9875501052', '2+1', 'local tea', '300', '100', NULL, NULL, 'domestic', NULL, 'singhgaya728@gmail.com', '$2y$10$Srm1O9SBpd94JaqSj52lK.GnjC0qYkCzgR5fD7vrHxGLxVQEe.VW6', NULL, '2022-10-18 13:14:03', '2022-10-18 13:14:03', 0, 0, NULL, 'No', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0),
(33, 1, 'ranjan chhuria', NULL, NULL, NULL, NULL, 0, 'dr s p mukherjee road.3 no rail gate.belgharia.kol-700056', '7889310770', '3', 'tata', '250', '150', NULL, NULL, 'domestic', NULL, 'ranjanchhuria02@gmail.com', '$2y$10$Kvf/xMUA/i4TEGSE0cRCLeWDGbIXszSc88f6fLPDv1nQr6YtLZirC', NULL, '2022-10-18 13:23:03', '2022-10-18 13:23:03', 0, 0, NULL, 'No', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0),
(34, 1, 'radha shaw', NULL, NULL, NULL, NULL, 0, 'k.s.path road.kali mandir bara masjid.khardah.kol700117', '8777405182', '3+1', 'tata tea', '200', '150', NULL, NULL, 'domestic', NULL, 'radhashaw03@gmail.com', '$2y$10$RoQW4VwUw.I0QUJ3NpcgPOteyU/r3QliGpfSUfW5JOnYAa6hOLyFO', NULL, '2022-10-18 15:49:31', '2022-10-18 15:49:31', 0, 0, NULL, 'No', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0),
(35, 1, 'Arnesta chakraborty', NULL, NULL, NULL, NULL, 0, 'Mahisya para.khardah.kol 700117', '6291771496', '2+1', 'Tata tea', '250', '150', NULL, NULL, 'domestic', NULL, 'arnesta@gmail.com', '$2y$10$Yhr.X5gv0cyb9Vx8VvvkFOys0mHr5o2pS.eCFiPFqvGGJanH9V66a', NULL, '2022-10-21 11:24:02', '2022-10-21 11:24:02', 0, 0, NULL, 'No', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0),
(36, 1, 'Sonali baidya', NULL, NULL, NULL, NULL, 0, 'Khardah.natun pally.post-titagarh\r\nKol-700119', '9875582500', '1', 'Tata tea premium', '250', '100', NULL, NULL, 'domestic', NULL, 'sonalichowdhury09582@gmail.com', '$2y$10$rsFZ1NlNsqEYszvD/FphEeTfgCD9SVcnsuAxSfq/LX8RSKpJ/jDH2', NULL, '2022-10-21 15:16:43', '2022-10-21 15:16:43', 0, 0, NULL, 'No', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0),
(37, 1, 'NITISH BISWAS', NULL, NULL, NULL, NULL, 0, 'Rahara.anandanagar.kol 700118', '9433805067', '3+1', 'Local', '500', '500', NULL, NULL, 'domestic', NULL, NULL, '$2y$10$/aprbAZ5crPsBvJX8G9zFOC2L0uJqJJUErcZNjXP2JdEuxQAIimdm', NULL, '2022-10-23 16:38:38', '2022-10-23 16:38:38', 0, 0, NULL, 'No', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0),
(38, 1, 'Sristi sinjh', NULL, NULL, NULL, NULL, 0, 'Titagor', '9147129462', '5', 'TATA', '250', '200', NULL, NULL, 'domestic', NULL, 'shristi799@gmail.com', '$2y$10$bXtNwWMUyDVn1DldPnKDBeItKTec3vaJ5V/ilan.nD.0NhP3X4UIu', NULL, '2022-11-10 17:27:19', '2022-11-10 17:27:19', 0, 0, NULL, 'No', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0),
(39, NULL, 'Rathindra Bhadra', NULL, NULL, 'Kolkata', NULL, 0, 'Milangarh.khardah.kol=700119', '9163888041', '3', 'Tata tea', '250', '100', 'CTC Tea', '6:00 pm - 8:00 pm', 'domestic', NULL, 'rathindrabhadra99@gmail.com', NULL, NULL, '2022-11-14 09:28:02', '2022-11-14 09:32:19', 0, 0, NULL, 'No', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 30),
(40, 1, 'RAJ SHAH', NULL, NULL, NULL, NULL, 0, '25.banglo river side road.bkp kol=120', '9836566085', '4', 'Tata tea gold', '500', '250', NULL, NULL, 'domestic', NULL, 'rajshah181@gmail.com', '$2y$10$1sLjZgHAFQUEs.B7fuegXubYREsaI0L7p8Iy1ztvKiEwQ.x4rXYIy', NULL, '2022-11-16 17:43:38', '2022-11-16 17:43:38', 0, 0, NULL, 'No', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0),
(41, 1, 'bidhan roy', NULL, NULL, NULL, NULL, 0, 'khardah  lichubagan.pravu nityananda apartment.kol700116', '6289003270', '3', 'tata tea gpold', '250', '150', NULL, NULL, 'domestic', NULL, 'bidhanronit@gmail.com', '$2y$10$nOWBUeaM1rFSVLz.efY0C.r1hB6qA.GuwczX9atB1ecKhBJ.hq2SC', NULL, '2022-11-26 16:38:58', '2022-11-26 16:46:24', 0, 0, NULL, 'No', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 15),
(42, 1, 'tanmoy banerjee', NULL, NULL, NULL, NULL, 0, 'adarshapally.khardah.near adarshapally play ground.kolkata 700116', '9874016199', '2', 'tata tea', '250', '150', NULL, NULL, 'domestic', NULL, 'onlytanmoy.banerjee@gmail.com', '$2y$10$7PHyuV8U84xlAH.YCB6/pekbEDZ1Rq9ibcOMXRs6SvsydFo.IbJYe', NULL, '2022-11-28 13:59:56', '2022-11-28 13:59:56', 0, 0, NULL, 'No', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0),
(43, 1, 'chayan paul', NULL, NULL, NULL, NULL, 0, 'ruia paschim para.khardah.kol 700119', '9038587872', '3', 'local', '300', '150', NULL, NULL, 'domestic', NULL, 'paul.chayan26@gmail.com', '$2y$10$Qgzi1wTaS2XuSg98DaFiBOYrV75WaelyZ2GfnzS7ICEMve70HpCs6', NULL, '2022-11-28 14:10:51', '2022-11-28 14:10:51', 0, 0, NULL, 'No', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0),
(44, 1, 'amit dasgupta', NULL, NULL, NULL, NULL, 0, 'bibek nagar.khardahkol 700117', '7044405816', '5+1', 'tata tea gold', '500', '150', NULL, NULL, 'domestic', NULL, 'amitdasguptaa2000@gmail.com', '$2y$10$M2lUbDku2VtXmY3ngHN9geVobB.AuDU9aQfKzlQfGXgwFaCsOx1dO', NULL, '2022-12-02 15:34:53', '2022-12-02 15:34:53', 0, 0, NULL, 'No', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0),
(45, 1, 'Raju Nayak', NULL, NULL, NULL, NULL, 0, 'Shiv Durga apartment benarji para talpukur', '9073453309', '2+1', 'TATA', '250', '300', NULL, NULL, 'domestic', NULL, 'Rajunayak839@gmail.com', '$2y$10$RhdVBBhJugMpCFtxfxeEnu3MsTAfZ31/wGpVR81Ih9WLWiFFg5BMu', NULL, '2022-12-03 13:59:12', '2022-12-03 13:59:12', 0, 0, NULL, 'No', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0),
(46, 1, 'Sarfaraj ahemad', NULL, NULL, NULL, NULL, 0, 'Angush hugli', '9331883597', '3+1', 'TATA', '500', '200', NULL, NULL, 'domestic', NULL, 'sarfarazpappu7@gmail.com', '$2y$10$BYWDFGKpgg7av93pB6cBZuufE.Nm/imAGUgIJuKseiAAnTk0Jor7C', NULL, '2022-12-06 16:35:28', '2022-12-06 16:35:28', 0, 0, NULL, 'No', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0),
(47, 1, 'SUBROTO BHOUMIK', NULL, NULL, NULL, NULL, 0, '56/a Tata gate.khardah.kol 119', '9330173126', '3', 'Local tea', '300', '500', NULL, NULL, 'domestic', NULL, NULL, '$2y$10$HggNmvePSKct2t2./20ra.n4JqhiPvclkBPw0pn5MmK9YE7lSg5cu', NULL, '2023-01-03 13:04:36', '2023-01-03 13:04:36', 0, 0, NULL, 'No', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0),
(48, NULL, 'Purnima gachi', NULL, NULL, NULL, NULL, 0, NULL, '8910099831', NULL, NULL, NULL, NULL, NULL, NULL, 'domestic', NULL, 'rpuja8151@gmail.com', NULL, NULL, '2023-03-01 07:18:34', '2023-03-01 07:18:34', 0, 0, NULL, 'No', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `user_custom_tea`
--

CREATE TABLE `user_custom_tea` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `smell` bigint(20) DEFAULT NULL,
  `color` bigint(20) DEFAULT NULL,
  `weight` varchar(20) DEFAULT NULL,
  `smell_per` bigint(20) DEFAULT NULL,
  `color_per` bigint(20) DEFAULT NULL,
  `price` bigint(20) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_custom_tea`
--

INSERT INTO `user_custom_tea` (`id`, `user_id`, `smell`, `color`, `weight`, `smell_per`, `color_per`, `price`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 5, '500', 25, 75, 488, '2022-08-19 11:24:45', '2022-08-19 11:26:00');

-- --------------------------------------------------------

--
-- Table structure for table `user_notifications`
--

CREATE TABLE `user_notifications` (
  `id` int(191) NOT NULL,
  `user_id` int(191) NOT NULL,
  `order_number` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_read` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user_subscriptions`
--

CREATE TABLE `user_subscriptions` (
  `id` int(191) NOT NULL,
  `user_id` int(191) NOT NULL,
  `subscription_id` int(191) NOT NULL,
  `title` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double NOT NULL DEFAULT 0,
  `days` int(11) NOT NULL,
  `allowed_products` int(11) NOT NULL DEFAULT 0,
  `details` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `method` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Free',
  `txnid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `charge_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `payment_number` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `flutter_id` varchar(191) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `vendor_orders`
--

CREATE TABLE `vendor_orders` (
  `id` int(191) NOT NULL,
  `user_id` int(191) NOT NULL,
  `order_id` int(191) NOT NULL,
  `qty` int(191) NOT NULL,
  `price` double NOT NULL,
  `order_number` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('pending','processing','completed','declined','on delivery') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `verifications`
--

CREATE TABLE `verifications` (
  `id` int(191) NOT NULL,
  `user_id` int(191) NOT NULL,
  `attachments` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('Pending','Verified','Declined') DEFAULT NULL,
  `text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `admin_warning` tinyint(1) NOT NULL DEFAULT 0,
  `warning_reason` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `verifications`
--

INSERT INTO `verifications` (`id`, `user_id`, `attachments`, `status`, `text`, `admin_warning`, `warning_reason`, `created_at`, `updated_at`) VALUES
(4, 13, '1573723849Baby.tux-800x800.png,1573723849Baby.tux-800x800.png', 'Verified', 'TEst', 0, NULL, '2019-11-14 03:30:49', '2019-11-14 03:34:06');

-- --------------------------------------------------------

--
-- Table structure for table `wishlists`
--

CREATE TABLE `wishlists` (
  `id` int(191) UNSIGNED NOT NULL,
  `user_id` int(191) UNSIGNED NOT NULL,
  `product_id` int(191) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `wishlists`
--

INSERT INTO `wishlists` (`id`, `user_id`, `product_id`) VALUES
(19, 40, 185),
(21, 40, 93),
(26, 1, 7),
(27, 1, 5);

-- --------------------------------------------------------

--
-- Table structure for table `withdraws`
--

CREATE TABLE `withdraws` (
  `id` int(191) NOT NULL,
  `user_id` int(191) DEFAULT NULL,
  `method` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `acc_email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `iban` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `acc_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `swift` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reference` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` float DEFAULT NULL,
  `fee` float DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `status` enum('pending','completed','rejected') NOT NULL DEFAULT 'pending',
  `type` enum('user','vendor') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admins_email_unique` (`email`);

--
-- Indexes for table `admin_languages`
--
ALTER TABLE `admin_languages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin_user_conversations`
--
ALTER TABLE `admin_user_conversations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin_user_messages`
--
ALTER TABLE `admin_user_messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `attributes`
--
ALTER TABLE `attributes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `attribute_options`
--
ALTER TABLE `attribute_options`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `banners`
--
ALTER TABLE `banners`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blogs`
--
ALTER TABLE `blogs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blog_categories`
--
ALTER TABLE `blog_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `childcategories`
--
ALTER TABLE `childcategories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `conversations`
--
ALTER TABLE `conversations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `counters`
--
ALTER TABLE `counters`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cross_selling_products`
--
ALTER TABLE `cross_selling_products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cs_category_relations`
--
ALTER TABLE `cs_category_relations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customtea_orders`
--
ALTER TABLE `customtea_orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `custom_tea`
--
ALTER TABLE `custom_tea`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `delivery_boys`
--
ALTER TABLE `delivery_boys`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `deposits`
--
ALTER TABLE `deposits`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `email_templates`
--
ALTER TABLE `email_templates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `faqs`
--
ALTER TABLE `faqs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `favorite_sellers`
--
ALTER TABLE `favorite_sellers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `galleries`
--
ALTER TABLE `galleries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `generalsettings`
--
ALTER TABLE `generalsettings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_tracks`
--
ALTER TABLE `order_tracks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `packages`
--
ALTER TABLE `packages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pagesettings`
--
ALTER TABLE `pagesettings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `partners`
--
ALTER TABLE `partners`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payment_gateways`
--
ALTER TABLE `payment_gateways`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pickups`
--
ALTER TABLE `pickups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);
ALTER TABLE `products` ADD FULLTEXT KEY `name` (`name`);
ALTER TABLE `products` ADD FULLTEXT KEY `attributes` (`attributes`);

--
-- Indexes for table `product_clicks`
--
ALTER TABLE `product_clicks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ratings`
--
ALTER TABLE `ratings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `refunds`
--
ALTER TABLE `refunds`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `replies`
--
ALTER TABLE `replies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reports`
--
ALTER TABLE `reports`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rewards`
--
ALTER TABLE `rewards`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sales_person`
--
ALTER TABLE `sales_person`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `seotools`
--
ALTER TABLE `seotools`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shippings`
--
ALTER TABLE `shippings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sliders`
--
ALTER TABLE `sliders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `socialsettings`
--
ALTER TABLE `socialsettings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `social_providers`
--
ALTER TABLE `social_providers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `states`
--
ALTER TABLE `states`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subcategories`
--
ALTER TABLE `subcategories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subscribers`
--
ALTER TABLE `subscribers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subscriptions`
--
ALTER TABLE `subscriptions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `user_custom_tea`
--
ALTER TABLE `user_custom_tea`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_notifications`
--
ALTER TABLE `user_notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_subscriptions`
--
ALTER TABLE `user_subscriptions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vendor_orders`
--
ALTER TABLE `vendor_orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `verifications`
--
ALTER TABLE `verifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wishlists`
--
ALTER TABLE `wishlists`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `withdraws`
--
ALTER TABLE `withdraws`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `admin_languages`
--
ALTER TABLE `admin_languages`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `admin_user_conversations`
--
ALTER TABLE `admin_user_conversations`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `admin_user_messages`
--
ALTER TABLE `admin_user_messages`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `attributes`
--
ALTER TABLE `attributes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `attribute_options`
--
ALTER TABLE `attribute_options`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=256;

--
-- AUTO_INCREMENT for table `banners`
--
ALTER TABLE `banners`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `blogs`
--
ALTER TABLE `blogs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `blog_categories`
--
ALTER TABLE `blog_categories`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `childcategories`
--
ALTER TABLE `childcategories`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `conversations`
--
ALTER TABLE `conversations`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `counters`
--
ALTER TABLE `counters`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=247;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `cross_selling_products`
--
ALTER TABLE `cross_selling_products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `cs_category_relations`
--
ALTER TABLE `cs_category_relations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `currencies`
--
ALTER TABLE `currencies`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `customtea_orders`
--
ALTER TABLE `customtea_orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `custom_tea`
--
ALTER TABLE `custom_tea`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `delivery_boys`
--
ALTER TABLE `delivery_boys`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `deposits`
--
ALTER TABLE `deposits`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `email_templates`
--
ALTER TABLE `email_templates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `faqs`
--
ALTER TABLE `faqs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `favorite_sellers`
--
ALTER TABLE `favorite_sellers`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `galleries`
--
ALTER TABLE `galleries`
  MODIFY `id` int(191) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=254;

--
-- AUTO_INCREMENT for table `generalsettings`
--
ALTER TABLE `generalsettings`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=207;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `order_tracks`
--
ALTER TABLE `order_tracks`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `packages`
--
ALTER TABLE `packages`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `pagesettings`
--
ALTER TABLE `pagesettings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `partners`
--
ALTER TABLE `partners`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `payment_gateways`
--
ALTER TABLE `payment_gateways`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=118;

--
-- AUTO_INCREMENT for table `pickups`
--
ALTER TABLE `pickups`
  MODIFY `id` int(191) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(191) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT for table `product_clicks`
--
ALTER TABLE `product_clicks`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5773;

--
-- AUTO_INCREMENT for table `ratings`
--
ALTER TABLE `ratings`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `refunds`
--
ALTER TABLE `refunds`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `replies`
--
ALTER TABLE `replies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reports`
--
ALTER TABLE `reports`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `rewards`
--
ALTER TABLE `rewards`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `sales_person`
--
ALTER TABLE `sales_person`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `seotools`
--
ALTER TABLE `seotools`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `shippings`
--
ALTER TABLE `shippings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `sliders`
--
ALTER TABLE `sliders`
  MODIFY `id` int(191) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `socialsettings`
--
ALTER TABLE `socialsettings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `social_providers`
--
ALTER TABLE `social_providers`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `states`
--
ALTER TABLE `states`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `subcategories`
--
ALTER TABLE `subcategories`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `subscribers`
--
ALTER TABLE `subscribers`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `subscriptions`
--
ALTER TABLE `subscriptions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `user_custom_tea`
--
ALTER TABLE `user_custom_tea`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `user_notifications`
--
ALTER TABLE `user_notifications`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=113;

--
-- AUTO_INCREMENT for table `user_subscriptions`
--
ALTER TABLE `user_subscriptions`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=137;

--
-- AUTO_INCREMENT for table `vendor_orders`
--
ALTER TABLE `vendor_orders`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=129;

--
-- AUTO_INCREMENT for table `verifications`
--
ALTER TABLE `verifications`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `wishlists`
--
ALTER TABLE `wishlists`
  MODIFY `id` int(191) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `withdraws`
--
ALTER TABLE `withdraws`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

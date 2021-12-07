-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Sep 12, 2021 at 04:42 PM
-- Server version: 5.7.31
-- PHP Version: 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_catharstrophe`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

DROP TABLE IF EXISTS `admins`;
CREATE TABLE IF NOT EXISTS `admins` (
  `email` varchar(50) NOT NULL,
  `username` varchar(20) NOT NULL,
  `pwd` varchar(50) NOT NULL,
  `first_name` varchar(20) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  PRIMARY KEY (`email`,`username`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`email`, `username`, `pwd`, `first_name`, `last_name`) VALUES
('admin@email.com', 'admin', '1', 'Ad', 'Min');

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

DROP TABLE IF EXISTS `cities`;
CREATE TABLE IF NOT EXISTS `cities` (
  `har_id` int(11) NOT NULL,
  `usr_name` varchar(20) NOT NULL,
  `city` varchar(20) DEFAULT NULL,
  `lat` varchar(20) DEFAULT NULL,
  `lon` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`har_id`),
  KEY `usr_name_cities` (`usr_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cities`
--

INSERT INTO `cities` (`har_id`, `usr_name`, `city`, `lat`, `lon`) VALUES
(8, 'ari', 'Athens', '37.9842', '23.7353'),
(9, 'aspa', 'Athens', '37.9842', '23.7353'),
(10, 'john', 'Athens', '37.9842', '23.7353'),
(11, 'shawn', 'Athens', '37.9842', '23.7353'),
(12, 'shawn', 'Athens', '37.9842', '23.7353'),
(13, 'ceid', 'Athens', '37.9842', '23.7353'),
(14, 'ceid', 'Athens', '37.9842', '23.7353'),
(15, 'ari', 'Athens', '37.9842', '23.7353');

-- --------------------------------------------------------

--
-- Table structure for table `har_info`
--

DROP TABLE IF EXISTS `har_info`;
CREATE TABLE IF NOT EXISTS `har_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entry` int(11) NOT NULL,
  `usr_name` varchar(20) NOT NULL,
  `startedDateTime` varchar(24) DEFAULT NULL,
  `wait` float(7,3) DEFAULT NULL,
  `serverIpAddress` varchar(100) DEFAULT NULL,
  `method` varchar(10) DEFAULT NULL,
  `url` varchar(200) DEFAULT NULL,
  `status` int(4) DEFAULT NULL,
  `statusText` varchar(30) DEFAULT NULL,
  `lat` varchar(20) DEFAULT NULL,
  `lon` varchar(20) DEFAULT NULL,
  `req_content_type` varchar(60) DEFAULT NULL,
  `req_cache_control` varchar(200) DEFAULT NULL,
  `req_pragma` varchar(20) DEFAULT NULL,
  `req_expires` tinytext,
  `req_age` varchar(10) DEFAULT NULL,
  `req_last_modified` tinytext,
  `req_host` varchar(100) DEFAULT NULL,
  `res_content_type` varchar(60) DEFAULT NULL,
  `res_cache_control` varchar(200) DEFAULT NULL,
  `res_pragma` varchar(20) DEFAULT NULL,
  `res_expires` tinytext,
  `res_age` varchar(10) DEFAULT NULL,
  `res_last_modified` tinytext,
  `res_host` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`,`entry`),
  KEY `usr_name_har_info` (`usr_name`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `har_info`
--

INSERT INTO `har_info` (`id`, `entry`, `usr_name`, `startedDateTime`, `wait`, `serverIpAddress`, `method`, `url`, `status`, `statusText`, `lat`, `lon`, `req_content_type`, `req_cache_control`, `req_pragma`, `req_expires`, `req_age`, `req_last_modified`, `req_host`, `res_content_type`, `res_cache_control`, `res_pragma`, `res_expires`, `res_age`, `res_last_modified`, `res_host`) VALUES
(8, 1, 'ari', '2020-12-11T23:45:42.198Z', 34.274, '54.240.169.51', 'GET', 'music-map.com', 200, 'OK', '37.751', '-97.822', '', 'max-age=0', '', '', '', '', 'www.music-map.com', 'text/html; charset=UTF-8', 'public, max-age=300', '', '', '7', '', ''),
(8, 2, 'ari', '2020-12-11T23:45:42.248Z', 0.111, '54.240.169.51', 'GET', 'music-map.com', 200, 'OK', '37.751', '-97.822', '', '', '', '', '', '', '', 'text/css;charset=UTF-8', 'max-age=86402', '', '', '59907', '', ''),
(8, 3, 'ari', '2020-12-11T23:45:42.248Z', 0.033, '54.240.169.51', 'GET', 'music-map.com', 200, 'OK', '37.751', '-97.822', '', '', '', '', '', '', '', 'text/javascript;charset=UTF-8', 'max-age=86402', '', '', '67416', '', ''),
(8, 4, 'ari', '2020-12-11T23:45:42.249Z', 0.067, '54.240.169.51', 'GET', 'music-map.com', 200, 'OK', '37.751', '-97.822', '', '', '', '', '', '', '', 'text/javascript;charset=UTF-8', 'max-age=86402', '', '', '53114', '', ''),
(8, 5, 'ari', '2020-12-11T23:45:42.249Z', 0.067, '54.240.169.51', 'GET', 'music-map.com', 200, 'OK', '37.751', '-97.822', '', '', '', '', '', '', '', 'text/javascript;charset=UTF-8', 'max-age=86402', '', '', '53114', '', ''),
(8, 6, 'ari', '2020-12-11T23:45:42.249Z', 0.047, '54.240.169.51', 'GET', 'music-map.com', 200, 'OK', '37.751', '-97.822', '', '', '', '', '', '', '', 'text/javascript;charset=UTF-8', 'max-age=86402', '', '', '50326', '', ''),
(8, 7, 'ari', '2020-12-11T23:45:42.275Z', 0.057, '54.240.169.51', 'GET', 'music-map.com', 200, 'OK', '37.751', '-97.822', '', '', '', '', '', '', '', 'font/woff', 'max-age=86402', '', '', '53071', '', ''),
(8, 8, 'ari', '2020-12-11T23:45:42.276Z', 0.055, '2a00:1450:4001:819::200e', 'GET', 'google-analytics.com', 200, '', '50.1188', '8.6843', '', '', '', '', '', '', '', 'text/javascript', 'public, max-age=7200', '', 'Sat, 12 Dec 2020 00:49:50 GMT', '2203', 'Fri, 23 Oct 2020 03:00:57 GMT', ''),
(8, 9, 'ari', '2020-12-11T23:45:42.298Z', 71.160, '2a00:1450:4001:820::200e', 'POST', 'google-analytics.com', 200, '', '50.1188', '8.6843', 'text/plain', '', '', '', '', '', '', 'text/plain', 'no-cache, no-store, must-revalidate', 'no-cache', 'Fri, 01 Jan 1990 00:00:00 GMT', '', 'Sun, 17 May 1998 03:00:00 GMT', ''),
(8, 10, 'ari', '2020-12-11T23:45:42.302Z', 33.222, '54.240.169.51', 'GET', 'music-map.com', 200, 'OK', '37.751', '-97.822', '', 'no-cache', 'no-cache', '', '', '', 'www.music-map.com', 'image/x-icon', 'max-age=86402', '', '', '62376', '', ''),
(9, 1, 'aspa', '2021-01-03T16:02:15.375Z', 185.260, '2a02:587:8ff:25::d4cd:4db2', 'GET', 'geeksforgeeks.org', 200, '', '37.9667', '23.7167', '', '', '', '', '', '', '', 'text/html; charset=UTF-8', 'must-revalidate, max-age=3, s-maxage=21600', '', '', '', '', ''),
(9, 2, 'aspa', '2021-01-03T16:02:15.698Z', 36.632, '2a00:1450:4001:81d::2003', 'GET', 'fonts.gstatic.com', 200, '', '50.1188', '8.6843', '', '', '', '', '', '', '', 'font/woff2', 'public, max-age=31536000', '', 'Sat, 01 Jan 2022 07:52:18 GMT', '185899', 'Thu, 25 Jun 2020 19:34:59 GMT', ''),
(9, 3, 'aspa', '2021-01-03T16:02:15.727Z', 82.716, '2a00:1450:4001:819::200e', 'GET', 'apis.google.com', 200, '', '50.1188', '8.6843', '', '', '', '', '', '', '', 'application/javascript; charset=utf-8', 'private, max-age=1800, stale-while-revalidate=1800', '', 'Sun, 03 Jan 2021 16:02:15 GMT', '', '', ''),
(9, 4, 'aspa', '2021-01-03T16:02:15.728Z', 45.424, '2606:4700::6810:125e', 'GET', 'cdnjs.cloudflare.com', 200, '', '37.751', '-97.822', '', '', '', '', '', '', '', 'application/javascript; charset=utf-8', 'public, max-age=30672000', '', 'Fri, 24 Dec 2021 11:30:39 GMT', '2761452', 'Mon, 04 May 2020 16:15:59 GMT', ''),
(9, 5, 'aspa', '2021-01-03T16:02:15.728Z', 9.047, '2a02:587:8ff:25::d4cd:4daa', 'GET', 'use.typekit.net', 200, '', '37.9667', '23.7167', '', '', '', '', '', '', '', 'text/css;charset=utf-8', 'private, max-age=600, stale-while-revalidate=604800', '', '', '', '', ''),
(9, 6, 'aspa', '2021-01-03T16:02:15.729Z', 6.662, '2a02:587:8ff:25::d4cd:4db2', 'GET', 'geeksforgeeks.org', 200, '', '37.9667', '23.7167', '', '', '', '', '', '', '', 'text/css', 'public, must-revalidate, max-age=31194141', '', '', '', 'Wed, 30 Dec 2020 12:31:34 GMT', ''),
(9, 7, 'aspa', '2021-01-03T16:02:15.729Z', 4.634, '2001:4de0:ac19::1:b:2b', 'GET', 'code.jquery.com', 200, '', '52.3824', '4.8995', '', '', '', '', '', '', '', 'application/javascript; charset=utf-8', 'max-age=315360000', '', '', '', 'Thu, 22 Sep 2016 22:32:34 GMT', ''),
(9, 8, 'aspa', '2021-01-03T16:02:15.733Z', 2.270, '2001:4de0:ac19::1:b:2b', 'GET', 'code.jquery.com', 200, '', '52.3824', '4.8995', '', '', '', '', '', '', '', 'application/javascript; charset=utf-8', 'max-age=315360000', '', '', '', 'Thu, 09 Jun 2016 15:48:36 GMT', ''),
(9, 9, 'aspa', '2021-01-03T16:02:15.735Z', 45.731, '2a02:587:8ff:25::d4cd:4db2', 'GET', 'geeksforgeeks.org', 200, '', '37.9667', '23.7167', '', '', '', '', '', '', '', 'application/javascript', 'public, must-revalidate, max-age=31199347', '', '', '', 'Wed, 30 Dec 2020 14:00:39 GMT', ''),
(9, 10, 'aspa', '2021-01-03T16:02:15.848Z', 45.439, '2a02:587:8ff:25::d4cd:4da1', 'GET', 'media.geeksforgeeks.org', 200, '', '37.9667', '23.7167', '', '', '', '', '', '', '', 'image/png', 'max-age=24029554', '', '', '', 'Fri, 17 Jul 2020 11:56:15 GMT', ''),
(9, 11, 'aspa', '2021-01-03T16:02:15.849Z', 153.943, '2a02:587:8ff:25::d4cd:4da1', 'GET', 'media.geeksforgeeks.org', 200, '', '37.9667', '23.7167', '', '', '', '', '', '', '', 'image/png', 'max-age=2592000', '', '', '', 'Mon, 30 Mar 2020 06:07:31 GMT', ''),
(9, 12, 'aspa', '2021-01-03T16:02:15.849Z', 152.561, '2a02:587:8ff:25::d4cd:4da1', 'GET', 'media.geeksforgeeks.org', 200, '', '37.9667', '23.7167', '', '', '', '', '', '', '', 'image/png', 'max-age=2592000', '', '', '', 'Mon, 02 Nov 2020 13:48:14 GMT', ''),
(9, 13, 'aspa', '2021-01-03T16:02:15.850Z', 151.484, '2a02:587:8ff:25::d4cd:4da1', 'GET', 'media.geeksforgeeks.org', 200, '', '37.9667', '23.7167', '', '', '', '', '', '', '', 'image/svg+xml', 'max-age=19785804', '', '', '', 'Wed, 19 Aug 2020 08:35:05 GMT', ''),
(9, 14, 'aspa', '2021-01-03T16:02:15.850Z', 2.046, '2a02:587:8ff:25::d4cd:4db2', 'GET', 'geeksforgeeks.org', 200, '', '37.9667', '23.7167', '', '', '', '', '', '', '', 'application/javascript', 'public, must-revalidate, max-age=18886672', '', '', '', 'Thu, 27 Aug 2020 16:06:06 GMT', ''),
(9, 15, 'aspa', '2021-01-03T16:02:15.850Z', 1.476, '108.161.189.78', 'GET', 'm.servedby-buysellads.com', 200, 'OK', '37.751', '-97.822', '', '', '', '', '', '', '', 'application/javascript', 'max-age=86400', '', 'Mon, 04 Jan 2021 11:30:39 GMT', '', 'Mon, 21 Sep 2020 16:42:42 GMT', ''),
(9, 16, 'aspa', '2021-01-03T16:02:15.901Z', 7.509, '2a02:26f0:c000:184::19fd', 'GET', 'p.typekit.net', 200, '', '37.9842', '23.7353', '', '', '', '', '', '', '', 'text/css', 'public, max-age=604800', '', '', '', 'Tue, 01 Sep 2020 23:50:56 GMT', ''),
(9, 17, 'aspa', '2021-01-03T16:02:15.909Z', 321.665, '2a02:587:8ff:25::d4cd:4d98', 'GET', 'use.typekit.net', 200, '', '37.9667', '23.7167', '', '', '', '', '', '', '', 'text/css;charset=utf-8', 'private, max-age=600, stale-while-revalidate=604800', '', '', '', '', ''),
(9, 18, 'aspa', '2021-01-03T16:02:16.245Z', 151.318, '2a02:587:8ff:25::d4cd:4db2', 'GET', 'geeksforgeeks.org', 200, '', '37.9667', '23.7167', '', '', '', '', '', '', '', 'application/javascript', 'public, must-revalidate, max-age=24932112', '', '', '', 'Mon, 19 Oct 2020 01:06:05 GMT', ''),
(9, 19, 'aspa', '2021-01-03T16:02:16.309Z', 0.000, '', 'GET', 'cdn.adpushup.com', 0, '', '37.9842', '23.7353', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(9, 20, 'aspa', '2021-01-03T16:02:16.369Z', 119.268, '2a02:587:8ff:25::d4cd:4da1', 'GET', 'media.geeksforgeeks.org', 200, '', '37.9667', '23.7167', '', '', '', '', '', '', '', 'image/svg+xml', 'max-age=29870177', '', '', '', 'Tue, 15 Dec 2020 04:47:21 GMT', ''),
(9, 21, 'aspa', '2021-01-03T16:02:16.399Z', 281.866, '2a02:587:8ff:25::d4cd:4da1', 'GET', 'media.geeksforgeeks.org', 200, '', '37.9667', '23.7167', '', '', '', '', '', '', '', 'image/svg+xml', 'max-age=19785796', '', '', '', 'Thu, 20 Aug 2020 07:04:35 GMT', ''),
(9, 22, 'aspa', '2021-01-03T16:02:16.403Z', 277.085, '2a02:587:8ff:25::d4cd:4daa', 'GET', 'use.typekit.net', 200, '', '37.9667', '23.7167', '', '', '', '', '', '', '', 'application/font-woff2', 'public, max-age=31536000', '', '', '', '', ''),
(9, 23, 'aspa', '2021-01-03T16:02:16.404Z', 275.924, '2a02:587:8ff:25::d4cd:4daa', 'GET', 'use.typekit.net', 200, '', '37.9667', '23.7167', '', '', '', '', '', '', '', 'application/font-woff2', 'public, max-age=31536000', '', '', '', '', ''),
(9, 24, 'aspa', '2021-01-03T16:02:16.405Z', 274.906, '2a02:587:8ff:25::d4cd:4daa', 'GET', 'use.typekit.net', 200, '', '37.9667', '23.7167', '', '', '', '', '', '', '', 'application/font-woff2', 'public, max-age=31536000', '', '', '', '', ''),
(9, 25, 'aspa', '2021-01-03T16:02:16.407Z', 274.003, '2a02:587:8ff:25::d4cd:4daa', 'GET', 'use.typekit.net', 200, '', '37.9667', '23.7167', '', '', '', '', '', '', '', 'application/font-woff2', 'public, max-age=31536000', '', '', '', '', ''),
(9, 26, 'aspa', '2021-01-03T16:02:16.408Z', 273.815, '2a02:587:8ff:25::d4cd:4daa', 'GET', 'use.typekit.net', 200, '', '37.9667', '23.7167', '', '', '', '', '', '', '', 'application/font-woff2', 'public, max-age=31536000', '', '', '', '', ''),
(9, 27, 'aspa', '2021-01-03T16:02:17.106Z', 4.166, '2a02:26f0:c000:286::11a6', 'GET', 's.go-mpulse.net', 200, '', '37.9842', '23.7353', '', '', '', '', '', '', '', 'application/javascript; charset=utf-8', 'max-age=604800', '', '', '', 'Tue, 08 Dec 2020 10:06:12 GMT', ''),
(9, 28, 'aspa', '2021-01-03T16:02:17.122Z', 59.988, '2a00:1450:4001:814::2008', 'GET', 'ssl.google-analytics.com', 200, '', '50.1188', '8.6843', '', '', '', '', '', '', '', 'text/javascript', 'public, max-age=7200', '', 'Sun, 03 Jan 2021 17:54:22 GMT', '474', 'Fri, 23 Oct 2020 03:00:57 GMT', ''),
(9, 29, 'aspa', '2021-01-03T16:02:17.123Z', 0.000, '', 'HEAD', 'pagead2.googlesyndication.com', 0, '', '37.9842', '23.7353', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(9, 30, 'aspa', '2021-01-03T16:02:17.294Z', 72.268, '205.234.175.175', 'GET', 'delivery.adrecover.com', 200, '', '37.751', '-97.822', '', '', '', '', '', '', '', 'application/x-javascript', 'max-age=3600', '', 'Sun, 03 Jan 2021 17:02:16 GMT', '', 'Thu, 03 Dec 2020 11:39:16 GMT', ''),
(9, 31, 'aspa', '2021-01-03T16:02:17.397Z', 51.559, '192.0.77.48', 'GET', 's.w.org', 200, '', '37.751', '-97.822', '', '', '', '', '', '', '', 'image/svg+xml', 'max-age=315360000', '', 'Thu, 31 Dec 2037 23:55:55 GMT', '', 'Fri, 08 Jun 2018 13:09:43 GMT', ''),
(9, 32, 'aspa', '2021-01-03T16:02:17.501Z', 109.470, '2a00:1450:4001:808::200e', 'GET', 'cse.google.com', 200, '', '50.1188', '8.6843', '', '', '', '', '', '', '', 'text/javascript; charset=UTF-8', 'private', '', 'Sun, 03 Jan 2021 16:02:16 GMT', '', '', ''),
(9, 33, 'aspa', '2021-01-03T16:02:17.507Z', 254.168, '44.242.72.120', 'POST', 'util.geeksforgeeks.org', 200, 'OK', '45.8491', '-119.7143', 'application/x-www-form-urlencoded; charset=UTF-8', '', '', '', '', '', 'util.geeksforgeeks.org', 'text/html; charset=UTF-8', 's-maxage=86400, max-age=3, must-revalidate', '', 'Thu, 01 Jan 1970 00:00:00 GMT', '', '', ''),
(9, 34, 'aspa', '2021-01-03T16:02:17.646Z', 72.121, '2a00:1450:4001:802::2008', 'GET', 'ssl.google-analytics.com', 302, '', '50.1188', '8.6843', '', '', '', '', '', '', '', 'text/html; charset=UTF-8', 'no-cache, no-store, must-revalidate', 'no-cache', 'Fri, 01 Jan 1990 00:00:00 GMT', '', 'Sun, 17 May 1998 03:00:00 GMT', ''),
(9, 35, 'aspa', '2021-01-03T16:02:17.662Z', 10.328, '2a00:1450:4001:80b::2004', 'GET', 'google.com', 200, '', '50.1188', '8.6843', '', '', '', '', '', '', '', 'text/javascript', 'public, max-age=31536000', '', 'Wed, 29 Dec 2021 12:23:24 GMT', '428844', 'Thu, 19 Nov 2020 20:04:18 GMT', ''),
(9, 36, 'aspa', '2021-01-03T16:02:17.664Z', 3.043, '2a00:1450:4001:80b::2004', 'GET', 'google.com', 200, '', '50.1188', '8.6843', '', '', '', '', '', '', '', 'text/css', 'public, max-age=31536000', '', 'Wed, 29 Dec 2021 12:23:09 GMT', '428859', 'Thu, 19 Nov 2020 20:04:18 GMT', ''),
(9, 37, 'aspa', '2021-01-03T16:02:17.665Z', 68.127, '2a00:1450:4001:80b::2004', 'GET', 'google.com', 200, '', '50.1188', '8.6843', '', '', '', '', '', '', '', 'text/css', 'public, max-age=3000', '', 'Sun, 03 Jan 2021 16:03:33 GMT', '2924', 'Wed, 17 Jun 2020 00:00:00 GMT', ''),
(9, 38, 'aspa', '2021-01-03T16:02:17.672Z', 3.548, '2a00:1450:4001:81e::200a', 'GET', 'ajax.googleapis.com', 200, '', '50.1188', '8.6843', '', '', '', '', '', '', '', 'text/javascript; charset=UTF-8', 'public, max-age=31536000, stale-while-revalidate=2592000', '', 'Sat, 01 Jan 2022 18:09:50 GMT', '148858', 'Tue, 03 Mar 2020 19:15:00 GMT', ''),
(9, 39, 'aspa', '2021-01-03T16:02:17.715Z', 214.963, '2a02:26f0:c000:281::11a6', 'GET', 'c.go-mpulse.net', 200, 'OK', '37.9842', '23.7353', '', '', '', '', '', '', 'c.go-mpulse.net', 'application/json', 'private, max-age=120, stale-while-revalidate=60, stale-if-error=120', '', '', '', '', ''),
(9, 40, 'aspa', '2021-01-03T16:02:17.726Z', 76.508, '2a00:1450:400c:c0c::9d', 'GET', 'stats.g.doubleclick.net', 200, '', '50.8274', '4.348', '', '', '', '', '', '', '', 'image/gif', 'no-cache, no-store, must-revalidate', 'no-cache', 'Fri, 01 Jan 1990 00:00:00 GMT', '', 'Sun, 17 May 1998 03:00:00 GMT', ''),
(9, 41, 'aspa', '2021-01-03T16:02:17.813Z', 0.000, '', 'GET', 'delivery.adrecover.com', 0, '', '37.9842', '23.7353', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(9, 42, 'aspa', '2021-01-03T16:02:17.856Z', 137.955, '2a00:1450:4001:808::200e', 'GET', 'cse.google.com', 200, '', '50.1188', '8.6843', '', '', '', '', '', '', '', 'text/javascript; charset=UTF-8', 'private, max-age=3600', '', 'Sun, 03 Jan 2021 16:02:17 GMT', '', '', ''),
(9, 43, 'aspa', '2021-01-03T16:02:17.896Z', 92.178, '2a00:1450:4001:825::200a', 'GET', 'googleapis.com', 204, '', '50.1188', '8.6843', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(9, 44, 'aspa', '2021-01-03T16:02:17.897Z', 147.777, '2a00:1450:4001:80b::2004', 'GET', 'google.com', 200, '', '50.1188', '8.6843', '', '', '', '', '', '', '', 'image/png', 'public, max-age=31536000', '', 'Wed, 29 Dec 2021 05:49:42 GMT', '452468', 'Mon, 25 May 2020 08:30:00 GMT', ''),
(9, 45, 'aspa', '2021-01-03T16:02:17.897Z', 58.516, '2a00:1450:4001:802::200e', 'GET', 'clients1.google.com', 204, '', '50.1188', '8.6843', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(9, 46, 'aspa', '2021-01-03T16:02:17.910Z', 136.100, '205.234.175.175', 'GET', 'delivery.adrecover.com', 200, '', '37.751', '-97.822', '', '', '', '', '', '', '', 'image/jpeg', '', '', '', '', 'Sat, 23 Jul 2016 19:18:47 GMT', ''),
(9, 47, 'aspa', '2021-01-03T16:02:18.145Z', 67.757, '205.234.175.175', 'GET', 'delivery.adrecover.com', 304, '', '37.751', '-97.822', '', '', '', '', '', '', '', 'text/html', 'max-age=3600', '', 'Sun, 03 Jan 2021 17:02:17 GMT', '', 'Thu, 03 Dec 2020 10:57:41 GMT', ''),
(9, 48, 'aspa', '2021-01-03T16:02:18.674Z', 160.052, '23.97.225.52', 'GET', 'feedback.adrecover.com', 200, '', '52.3716', '4.8883', '', '', '', '', '', '', '', 'application/json;charset=UTF-8', 'no-cache, no-store, must-revalidate', 'no-cache', '0', '', '', ''),
(9, 49, 'aspa', '2021-01-03T16:02:18.733Z', 316.677, '2a00:1450:4001:808::200d', 'GET', 'accounts.google.com', 200, '', '50.1188', '8.6843', '', '', '', '', '', '', '', 'application/javascript; charset=utf-8', 'private, max-age=1800', '', 'Sun, 03 Jan 2021 16:02:18 GMT', '', '', ''),
(9, 50, 'aspa', '2021-01-03T16:02:18.696Z', 160.008, '2606:2800:233:97b6:26be:138a:cba8:bb01', 'GET', 'adserver-us.adtech.advertising.com', 200, '', '37.751', '-97.822', 'text/plain', '', '', '', '', '', '', 'application/json', 'no-store, no-cache', 'no-cache', 'Mon, 15 Jun 1998 00:00:00 GMT', '', '', ''),
(9, 51, 'aspa', '2021-01-03T16:02:18.700Z', 347.918, '185.33.221.50', 'POST', 'ib.adnxs.com', 200, 'OK', '52.3716', '4.8883', 'text/plain', '', '', '', '', '', 'ib.adnxs.com', 'application/json; charset=utf-8', 'no-store, no-cache, private', 'no-cache', 'Sat, 15 Nov 2008 16:00:00 GMT', '', '', ''),
(9, 52, 'aspa', '2021-01-03T16:02:18.705Z', 224.827, '185.33.221.50', 'POST', 'ib.adnxs.com', 200, 'OK', '52.3716', '4.8883', 'text/plain', '', '', '', '', '', 'ib.adnxs.com', 'application/json; charset=utf-8', 'no-store, no-cache, private', 'no-cache', 'Sat, 15 Nov 2008 16:00:00 GMT', '', '', ''),
(9, 53, 'aspa', '2021-01-03T16:02:18.818Z', 82.179, '178.250.2.131', 'POST', 'bidder.criteo.com', 200, '', '48.8582', '2.3387', 'text/plain', '', '', '', '', '', '', 'application/json; charset=utf-8', '', '', '', '', '', ''),
(9, 54, 'aspa', '2021-01-03T16:02:18.821Z', 214.145, '95.100.197.53', 'GET', 'as-sec.casalemedia.com', 200, 'OK', '52.3716', '4.8883', 'text/plain', '', '', '', '', '', 'as-sec.casalemedia.com', 'application/json', 'max-age=0, no-cache, no-store', 'no-cache', 'Sun, 03 Jan 2021 16:02:18 GMT', '', '', ''),
(9, 55, 'aspa', '2021-01-03T16:02:18.824Z', 264.436, '34.98.64.218', 'GET', 'adpushup-d.openx.net', 200, '', '39.1027', '-94.5778', 'text/plain', '', '', '', '', '', '', 'application/json', 'private, max-age=0, no-cache', 'no-cache', 'Mon, 26 Jul 1997 05:00:00 GMT', '', '', ''),
(9, 56, 'aspa', '2021-01-03T16:02:18.828Z', 134.044, '185.64.189.112', 'POST', 'hbopenbid.pubmatic.com', 204, '', '51.4964', '-0.1224', 'text/plain', '', '', '', '', '', '', '', 'no-cache, no-store, must-revalidate', '', '', '', '', ''),
(9, 57, 'aspa', '2021-01-03T16:02:18.832Z', 162.608, '72.251.249.14', 'POST', 'ap.lijit.com', 200, 'OK', '52.3716', '4.8883', 'text/plain', '', '', '', '', '', 'ap.lijit.com', 'application/json', '', '', '', '', '', ''),
(9, 58, 'aspa', '2021-01-03T16:02:18.838Z', 206.197, '54.76.211.112', 'POST', 'ads.servenobid.com', 200, '', '53.3382', '-6.2591', 'text/plain', '', '', '', '', '', '', 'application/json', '', '', '', '', '', ''),
(9, 59, 'aspa', '2021-01-03T16:02:18.841Z', 136.530, '213.19.162.41', 'GET', 'fastlane.rubiconproject.com', 200, 'OK', '51.4964', '-0.1224', 'text/plain', '', '', '', '', '', 'fastlane.rubiconproject.com', 'application/json', 'no-cache, no-store, max-age=0, must-revalidate', 'no-cache', 'Wed, 17 Sep 1975 21:32:10 GMT', '', '', ''),
(9, 60, 'aspa', '2021-01-03T16:02:18.844Z', 177.023, '185.255.84.151', 'POST', 'hb-api.omnitagjs.com', 200, '', '48.8323', '2.4075', 'text/plain', '', '', '', '', '', '', 'application/json; charset=utf-8', 'no-cache, no-store, must-revalidate', 'no-cache', '0', '', '', ''),
(9, 61, 'aspa', '2021-01-03T16:02:18.863Z', 109.507, '2a02:2638::1c', 'GET', 'gum.criteo.com', 200, '', '48.8582', '2.3387', '', '', '', '', '', '', '', 'text/html; charset=utf-8', 'private, max-age=0', '', '', '', '', ''),
(9, 62, 'aspa', '2021-01-03T16:02:19.215Z', 35.312, '2a00:1450:4001:821::200d', 'GET', 'accounts.google.com', 200, '', '50.1188', '8.6843', '', '', '', '', '', '', '', 'text/css; charset=utf-8', 'private, max-age=86400', '', 'Sun, 03 Jan 2021 11:30:48 GMT', '', '', ''),
(9, 63, 'aspa', '2021-01-03T16:02:19.230Z', 60.808, '178.250.2.131', 'POST', 'bidder.criteo.com', 204, '', '48.8582', '2.3387', 'text/plain;charset=UTF-8', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(9, 64, 'aspa', '2021-01-03T16:02:19.445Z', 129.439, '2a00:1450:4001:808::200d', 'GET', 'accounts.google.com', 200, '', '50.1188', '8.6843', '', '', '', '', '', '', '', 'application/json; charset=utf-8', 'no-cache, no-store, max-age=0, must-revalidate', 'no-cache', 'Mon, 01 Jan 1990 00:00:00 GMT', '', '', ''),
(9, 65, 'aspa', '2021-01-03T16:02:21.324Z', 30.775, '2a02:2638:1::3', 'GET', 'static.criteo.net', 200, '', '48.8582', '2.3387', '', '', '', '', '', '', '', 'text/javascript', 'max-age=86400', '', 'Mon, 04 Jan 2021 11:30:51 GMT', '', 'Thu, 10 Dec 2020 16:22:27 GMT', ''),
(9, 66, 'aspa', '2021-01-03T16:02:23.136Z', 88.578, '23.97.225.52', 'GET', 'feedback.adrecover.com', 200, '', '52.3716', '4.8883', '', '', '', '', '', '', '', 'image/png', 'no-cache, no-store, must-revalidate', 'no-cache', '0', '', '', ''),
(9, 67, 'aspa', '2021-01-03T16:02:23.340Z', 75.565, '72.251.249.14', 'GET', 'ap.lijit.com', 200, 'OK', '52.3716', '4.8883', '', '', '', '', '', '', 'ap.lijit.com', 'text/html', 'private, no-cache, no-store, must-revalidate, proxy-revalidate, max-age=0, s-maxage=0', 'no-cache', 'Fri, 20 Mar 2009 00:00:00 GMT', '', '', ''),
(9, 68, 'aspa', '2021-01-03T16:02:23.349Z', 327.441, '23.210.253.164', 'GET', 'js-sec.indexww.com', 200, 'OK', '50.1188', '8.6843', '', '', '', '', '', '', '', 'text/html; charset=UTF-8', '', '', '', '', 'Tue, 06 Oct 2020 14:04:48 GMT', ''),
(9, 69, 'aspa', '2021-01-03T16:02:23.362Z', 325.523, '2.23.105.34', 'GET', 'ads.pubmatic.com', 200, 'OK', '50.8979', '4.4315', '', '', '', '', '', '', '', 'text/html; charset=UTF-8', 'public, max-age=86327', '', 'Mon, 04 Jan 2021 11:30:31 GMT', '', 'Wed, 21 Oct 2020 18:57:52 GMT', ''),
(9, 70, 'aspa', '2021-01-03T16:02:23.376Z', 192.993, '34.98.64.218', 'GET', 'eu-u.openx.net', 200, '', '39.1027', '-94.5778', '', '', '', '', '', '', '', 'text/html', '', '', '', '', '', ''),
(9, 71, 'aspa', '2021-01-03T16:02:23.390Z', 317.955, '2620:1ec:bdf::13', 'GET', 'public.servenobid.com', 200, '', '37.751', '-97.822', '', '', '', '', '', '', '', 'text/html', 'max-age=86400', '', '', '', 'Mon, 21 Dec 2020 20:37:05 GMT', ''),
(9, 72, 'aspa', '2021-01-03T16:02:23.403Z', 317.514, '104.108.50.124', 'GET', 'eus.rubiconproject.com', 200, 'OK', '48.8607', '2.3281', '', '', '', '', '', '', '', 'text/html; charset=UTF-8', '', '', '', '', 'Mon, 28 Sep 2020 17:02:39 GMT', ''),
(9, 73, 'aspa', '2021-01-03T16:02:23.411Z', 317.689, '151.101.17.108', 'GET', 'acdn.adnxs.com', 200, 'OK', '51.5085', '-0.0898', '', '', '', '', '', '', '', 'text/html', 'max-age=31536000', '', 'Sun, 06 Aug 2017 09:41:59 GMT', '20930805', 'Fri, 20 May 2016 02:07:09 GMT', ''),
(9, 74, 'aspa', '2021-01-03T16:02:23.532Z', 83.346, '72.251.249.14', 'GET', 'ap.lijit.com', 302, 'Found', '52.3716', '4.8883', '', '', '', '', '', '', 'ap.lijit.com', '', '', '', '', '', '', ''),
(9, 75, 'aspa', '2021-01-03T16:02:23.532Z', 165.742, '52.210.149.10', 'GET', 'data.adsrvr.org', 200, '', '53.3382', '-6.2591', '', '', '', '', '', '', '', 'image/gif', 'private,no-cache, must-revalidate', 'no-cache', '', '', '', ''),
(9, 76, 'aspa', '2021-01-03T16:02:23.533Z', 71.538, '52.58.45.227', 'GET', 'x.bidswitch.net', 200, '', '50.1188', '8.6843', '', '', '', '', '', '', '', 'image/gif', 'no-cache, no-store, must-revalidate', '', '', '', '', ''),
(9, 77, 'aspa', '2021-01-03T16:02:23.533Z', 73.725, '72.251.249.14', 'GET', 'ap.lijit.com', 302, 'Found', '52.3716', '4.8883', '', '', '', '', '', '', 'ap.lijit.com', '', '', '', '', '', '', ''),
(9, 78, 'aspa', '2021-01-03T16:02:23.533Z', 87.337, '52.95.118.60', 'GET', 'aax-eu.amazon-adsystem.com', 302, 'Found', '53.3382', '-6.2591', '', '', '', '', '', '', 'aax-eu.amazon-adsystem.com', '', 'max-age=0, no-cache, no-store, private, must-revalidate, s-maxage=0', 'no-cache', 'Thu, 01 Jan 1970 00:00:00 GMT', '', '', ''),
(9, 79, 'aspa', '2021-01-03T16:02:23.938Z', 111.862, '172.217.23.130', 'GET', 'cm.g.doubleclick.net', 302, '', '37.751', '-97.822', '', '', '', '', '', '', '', 'text/html; charset=UTF-8', 'no-cache, must-revalidate', 'no-cache', 'Fri, 01 Jan 1990 00:00:00 GMT', '', '', ''),
(9, 80, 'aspa', '2021-01-03T16:02:24.021Z', 112.152, '172.217.23.130', 'GET', 'cm.g.doubleclick.net', 200, '', '37.751', '-97.822', '', '', '', '', '', '', '', 'image/png', 'no-cache, must-revalidate', 'no-cache', 'Fri, 01 Jan 1990 00:00:00 GMT', '', '', ''),
(9, 81, 'aspa', '2021-01-03T16:02:24.066Z', 91.678, '52.95.118.60', 'GET', 'aax-eu.amazon-adsystem.com', 200, 'OK', '53.3382', '-6.2591', '', '', '', '', '', '', 'aax-eu.amazon-adsystem.com', 'text/html;charset=ISO-8859-1', 'max-age=0, no-cache, no-store, private, must-revalidate, s-maxage=0', 'no-cache', 'Thu, 01 Jan 1970 00:00:00 GMT', '', '', ''),
(9, 82, 'aspa', '2021-01-03T16:02:24.307Z', 77.793, '72.251.249.14', 'GET', 'ap.lijit.com', 200, 'OK', '52.3716', '4.8883', '', '', '', '', '', '', 'ap.lijit.com', 'image/gif', 'private, no-cache, no-store, must-revalidate, proxy-revalidate, max-age=0, s-maxage=0', 'no-cache', 'Fri, 20 Mar 2009 00:00:00 GMT', '', '', ''),
(9, 83, 'aspa', '2021-01-03T16:02:24.938Z', 86.506, '95.100.197.53', 'GET', 'ssum-sec.casalemedia.com', 200, 'OK', '52.3716', '4.8883', '', '', '', '', '', '', 'ssum-sec.casalemedia.com', 'text/html', 'max-age=0, no-cache, no-store', 'no-cache', 'Sun, 03 Jan 2021 16:02:24 GMT', '', '', ''),
(9, 84, 'aspa', '2021-01-03T16:02:24.883Z', 44.885, '104.108.50.124', 'GET', 'eus.rubiconproject.com', 200, 'OK', '48.8607', '2.3281', '', '', '', '', '', '', '', 'text/html; charset=UTF-8', 'max-age=60847', '', 'Mon, 04 Jan 2021 04:25:16 GMT', '', 'Mon, 21 Dec 2020 17:22:45 GMT', ''),
(9, 85, 'aspa', '2021-01-03T16:02:25.105Z', 944.120, '54.171.43.242', 'GET', 'g2.gumgum.com', 200, '', '53.3382', '-6.2591', '', '', '', '', '', '', '', 'text/html;charset=UTF-8', '', '', '', '', '', ''),
(9, 86, 'aspa', '2021-01-03T16:02:25.113Z', 920.178, '208.100.17.174', 'GET', 'pixel.33across.com', 204, '', '37.751', '-97.822', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(9, 87, 'aspa', '2021-01-03T16:02:25.106Z', 87.403, '185.33.221.50', 'GET', 'ib.adnxs.com', 302, 'Found', '52.3716', '4.8883', '', '', '', '', '', '', 'ib.adnxs.com', 'text/html; charset=utf-8', 'no-store, no-cache, private', 'no-cache', 'Sat, 15 Nov 2008 16:00:00 GMT', '', '', ''),
(9, 88, 'aspa', '2021-01-03T16:02:25.128Z', 74.712, '72.251.249.14', 'GET', 'ap.lijit.com', 307, 'Temporary Redirect', '52.3716', '4.8883', '', '', '', '', '', '', 'ap.lijit.com', '', '', '', '', '', '', ''),
(9, 89, 'aspa', '2021-01-03T16:02:24.988Z', 76.011, '2001:678:cb4:bbbb::11', 'GET', 'ad.turn.com', 302, '', '51.4964', '-0.1224', '', '', '', '', '', '', '', '', 'max-age=0, no-cache, no-store, private, must-revalidate, s-maxage=0', 'no-cache', '', '', '', ''),
(9, 90, 'aspa', '2021-01-03T16:02:24.990Z', 70.281, '35.227.252.103', 'GET', 'rtb.openx.net', 302, '', '39.1027', '-94.5778', '', '', '', '', '', '', '', '', 'private, max-age=0, no-cache, must-revalidate', 'no-cache', '', '', '', ''),
(9, 91, 'aspa', '2021-01-03T16:02:24.995Z', 579.840, '2a00:1288:110:c305::8000', 'GET', 'pr-bh.ybp.yahoo.com', 200, '', '53.3382', '-6.2591', '', '', '', '', '', '', '', 'image/gif', '', '', 'Thu, 01 Jan 1970 00:00:00 GMT', '0', '', ''),
(9, 92, 'aspa', '2021-01-03T16:02:24.995Z', 868.962, '3.125.99.7', 'GET', 'pm.w55c.net', 302, '', '50.1188', '8.6843', '', '', '', '', '', '', 'pm.w55c.net', '', 'no-cache, must-revalidate', 'no-cache', 'Fri, 01 Jan 1990 00:00:00 GMT', '', '', ''),
(9, 93, 'aspa', '2021-01-03T16:02:24.996Z', 67.745, '52.58.45.227', 'GET', 'x.bidswitch.net', 302, '', '50.1188', '8.6843', '', '', '', '', '', '', '', '', 'no-cache, no-store, must-revalidate', '', '', '', '', ''),
(9, 94, 'aspa', '2021-01-03T16:02:24.996Z', 865.231, '54.171.14.147', 'GET', 'match.prod.bidr.io', 303, 'See Other', '53.3382', '-6.2591', '', '', '', '', '', '', 'match.prod.bidr.io', '', '', '', '', '', '', ''),
(9, 95, 'aspa', '2021-01-03T16:02:25.210Z', 83.223, '54.76.211.112', 'GET', 'ads.servenobid.com', 200, '', '53.3382', '-6.2591', '', '', '', '', '', '', '', 'image/avif;charset=ISO-8859-1', '', '', '', '', '', ''),
(9, 96, 'aspa', '2021-01-03T16:02:25.216Z', 92.022, '54.76.211.112', 'GET', 'ads.servenobid.com', 200, '', '53.3382', '-6.2591', '', '', '', '', '', '', '', 'image/avif;charset=ISO-8859-1', '', '', '', '', '', ''),
(9, 97, 'aspa', '2021-01-03T16:02:25.260Z', 939.199, '172.217.23.130', 'GET', 'cm.g.doubleclick.net', 302, '', '37.751', '-97.822', '', '', '', '', '', '', '', 'text/html; charset=UTF-8', 'no-cache, must-revalidate', 'no-cache', 'Fri, 01 Jan 1990 00:00:00 GMT', '', '', ''),
(9, 98, 'aspa', '2021-01-03T16:02:25.282Z', 96.857, '185.33.221.87', 'GET', 'secure.adnxs.com', 200, 'OK', '52.3716', '4.8883', '', '', '', '', '', '', 'secure.adnxs.com', 'application/javascript; charset=utf-8', 'no-store, no-cache, private', 'no-cache', 'Sat, 15 Nov 2008 16:00:00 GMT', '', '', ''),
(9, 99, 'aspa', '2021-01-03T16:02:25.342Z', 72.712, '2620:116:800d:21:51e4:db4b:4436:b305', 'GET', 'cms.quantserve.com', 302, '', '37.751', '-97.822', '', '', '', '', '', '', '', '', 'private, no-cache, no-store, proxy-revalidate', 'no-cache', 'Fri, 04 Aug 1978 12:00:00 GMT', '', '', ''),
(9, 100, 'aspa', '2021-01-03T16:02:25.343Z', 207.205, '198.148.27.139', 'GET', 'bh.contextweb.com', 302, '', '40.7033', '-74.0039', '', '', '', '', '', '', '', '', 'private, max-age=0, no-cache, no-store', '', '-1', '', '', ''),
(9, 101, 'aspa', '2021-01-03T16:02:25.344Z', 113.488, '52.51.244.26', 'GET', 'sync.tidaltv.com', 302, 'Found', '53.3382', '-6.2591', '', '', '', '', '', '', 'sync.tidaltv.com', '', 'no-cache, no-store, max-age=0, must-revalidate', 'no-cache', '0', '', '', ''),
(9, 102, 'aspa', '2021-01-03T16:02:25.344Z', 88.839, '54.171.43.242', 'GET', 'rtb.gumgum.com', 200, '', '53.3382', '-6.2591', '', '', '', '', '', '', '', 'image/gif;charset=UTF-8', 'private, no-store, must-revalidate, max-age=0', 'no-cache', '0', '', '', ''),
(9, 103, 'aspa', '2021-01-03T16:02:25.345Z', 138.847, '52.44.166.129', 'GET', 'rtb.adentifi.com', 204, 'No Content', '39.0481', '-77.4729', '', '', '', '', '', '', 'rtb.adentifi.com', 'text/plain', '', '', '', '', '', ''),
(9, 104, 'aspa', '2021-01-03T16:02:25.346Z', 68.986, '52.58.45.227', 'GET', 'x.bidswitch.net', 302, '', '50.1188', '8.6843', '', '', '', '', '', '', '', '', 'no-cache, no-store, must-revalidate', '', '', '', '', ''),
(9, 105, 'aspa', '2021-01-03T16:02:25.346Z', 85.548, '185.183.112.148', 'GET', 'sync.adotmob.com', 302, 'Found', '48.8323', '2.4075', '', '', '', '', '', '', 'sync.adotmob.com', '', '', '', '', '', '', ''),
(9, 106, 'aspa', '2021-01-03T16:02:25.347Z', 71.596, '34.96.105.8', 'GET', 'tr.blismedia.com', 204, '', '39.1027', '-94.5778', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(9, 107, 'aspa', '2021-01-03T16:02:25.376Z', 97.520, '52.58.45.227', 'GET', 'x.bidswitch.net', 200, '', '50.1188', '8.6843', '', '', '', '', '', '', '', 'image/gif', 'no-cache, no-store, must-revalidate', '', '', '', '', ''),
(9, 108, 'aspa', '2021-01-03T16:02:25.382Z', 579.937, '2a00:1288:110:c305::8000', 'GET', 'pr-bh.ybp.yahoo.com', 200, '', '53.3382', '-6.2591', '', '', '', '', '', '', '', 'image/gif', '', '', 'Thu, 01 Jan 1970 00:00:00 GMT', '0', '', ''),
(9, 109, 'aspa', '2021-01-03T16:02:25.383Z', 100.060, '2001:678:cb4:bbbb::11', 'GET', 'ad.turn.com', 302, '', '51.4964', '-0.1224', '', '', '', '', '', '', '', '', 'max-age=0, no-cache, no-store, private, must-revalidate, s-maxage=0', 'no-cache', '', '', '', ''),
(9, 110, 'aspa', '2021-01-03T16:02:25.384Z', 143.231, '54.171.14.147', 'GET', 'match.prod.bidr.io', 303, 'See Other', '53.3382', '-6.2591', '', '', '', '', '', '', 'match.prod.bidr.io', '', '', '', '', '', '', ''),
(9, 111, 'aspa', '2021-01-03T16:02:25.384Z', 74.362, '3.126.56.137', 'GET', 'ups.analytics.yahoo.com', 302, 'Found', '50.1188', '8.6843', '', '', '', '', '', '', 'ups.analytics.yahoo.com', '', '', '', '', '0', '', ''),
(9, 112, 'aspa', '2021-01-03T16:02:25.384Z', 68.966, '63.251.232.170', 'GET', 'cm.adgrx.com', 200, 'OK', '37.751', '-97.822', '', '', '', '', '', '', 'cm.adgrx.com', 'image/gif', 'no-cache, no-store, must-revalidate, proxy-revalidate', 'no-cache', 'Thu, 23 Sep 2004 17:42:04 GMT', '', '', ''),
(9, 113, 'aspa', '2021-01-03T16:02:25.384Z', 142.348, '52.44.166.129', 'GET', 'rtb.adentifi.com', 204, 'No Content', '39.0481', '-77.4729', '', '', '', '', '', '', 'rtb.adentifi.com', 'text/plain', '', '', '', '', '', ''),
(9, 114, 'aspa', '2021-01-03T16:02:25.384Z', 147.535, '3.125.99.7', 'GET', 'pm.w55c.net', 302, '', '50.1188', '8.6843', '', '', '', '', '', '', 'pm.w55c.net', '', 'no-cache, must-revalidate', 'no-cache', 'Fri, 01 Jan 1990 00:00:00 GMT', '', '', ''),
(9, 115, 'aspa', '2021-01-03T16:02:25.385Z', 68.949, '23.210.253.164', 'GET', 'js-sec.indexww.com', 200, 'OK', '50.1188', '8.6843', '', '', '', '', '', '', 'js-sec.indexww.com', 'image/gif', 'max-age=428', '', 'Sun, 03 Jan 2021 16:09:34 GMT', '', 'Tue, 24 Jan 2017 19:36:04 GMT', ''),
(9, 116, 'aspa', '2021-01-03T16:02:25.589Z', 201.216, '34.98.64.218', 'GET', 'us-u.openx.net', 200, '', '39.1027', '-94.5778', '', '', '', '', '', '', '', 'image/gif', 'private, max-age=0, no-cache', 'no-cache', 'Mon, 26 Jul 1997 05:00:00 GMT', '', '', ''),
(9, 117, 'aspa', '2021-01-03T16:02:25.799Z', 83.610, '2620:1ec:c11::200', 'GET', 'c.bing.com', 302, '', '37.751', '-97.822', '', '', '', '', '', '', '', '', 'private, no-cache, proxy-revalidate, no-store', 'no-cache', '', '', '', ''),
(9, 118, 'aspa', '2021-01-03T16:02:25.798Z', 122.895, '172.217.23.130', 'GET', 'cm.g.doubleclick.net', 302, '', '37.751', '-97.822', '', '', '', '', '', '', '', 'text/html; charset=UTF-8', 'no-cache, must-revalidate', 'no-cache', 'Fri, 01 Jan 1990 00:00:00 GMT', '', '', ''),
(9, 119, 'aspa', '2021-01-03T16:02:25.800Z', 108.986, '178.250.2.151', 'GET', 'dis.criteo.com', 302, '', '48.8582', '2.3387', '', '', '', '', '', '', '', 'text/html; charset=utf-8', 'no-cache', 'no-cache', 'Sun, 03 Jan 2021 00:00:00 GMT', '', '', ''),
(9, 120, 'aspa', '2021-01-03T16:02:25.801Z', 67.254, '185.29.135.42', 'GET', 'sync.mathtag.com', 302, 'Moved Temporarily', '51.4964', '-0.1224', '', '', '', '', '', '', 'sync.mathtag.com', 'image/gif', 'no-cache', '', 'Sun, 03 Jan 2021 16:02:26 GMT', '', '', ''),
(9, 121, 'aspa', '2021-01-03T16:02:25.819Z', 75.756, '172.217.23.130', 'GET', 'cm.g.doubleclick.net', 302, '', '37.751', '-97.822', '', '', '', '', '', '', '', 'text/html; charset=UTF-8', 'no-cache, must-revalidate', 'no-cache', 'Fri, 01 Jan 1990 00:00:00 GMT', '', '', ''),
(9, 122, 'aspa', '2021-01-03T16:02:25.847Z', 72.934, '34.98.67.61', 'GET', 'odr.mookie1.com', 200, '', '39.1027', '-94.5778', '', '', '', '', '', '', '', 'image/gif;charset=UTF-8', 'no-cache, no-store, must-revalidate', 'no-cache', 'Thu, 01 Jan 1970 00:00:00 GMT', '', '', ''),
(9, 123, 'aspa', '2021-01-03T16:02:25.849Z', 77.765, '2a00:1288:110:c305::8000', 'GET', 'pr-bh.ybp.yahoo.com', 200, '', '53.3382', '-6.2591', '', '', '', '', '', '', '', 'image/gif', '', '', 'Thu, 01 Jan 1970 00:00:00 GMT', '0', '', ''),
(9, 124, 'aspa', '2021-01-03T16:02:25.850Z', 69.003, '34.120.207.148', 'GET', 'idsync.rlcdn.com', 307, '', '39.1027', '-94.5778', '', '', '', '', '', '', '', '', 'no-cache, no-store', '', '', '', '', ''),
(9, 125, 'aspa', '2021-01-03T16:02:25.854Z', 88.100, '54.75.14.48', 'GET', 'beacon.krxd.net', 204, '', '53.3382', '-6.2591', '', '', '', '', '', '', '', '', 'private, no-cache, no-store', '', '', '', '', ''),
(9, 126, 'aspa', '2021-01-03T16:02:25.856Z', 99.420, '52.212.209.68', 'GET', 'dpm.demdex.net', 200, 'OK', '53.3382', '-6.2591', '', '', '', '', '', '', 'dpm.demdex.net', 'image/gif', 'no-cache,no-store,must-revalidate,max-age=0,proxy-revalidate,no-transform,private', 'no-cache', 'Thu, 01 Jan 1970 00:00:00 GMT', '', '', ''),
(9, 127, 'aspa', '2021-01-03T16:02:25.940Z', 78.317, '69.173.144.165', 'GET', 'pixel.rubiconproject.com', 200, 'OK', '50.1188', '8.6843', '', '', '', '', '', '', 'pixel.rubiconproject.com', 'image/gif', 'no-cache,no-store,must-revalidate', 'no-cache', '0', '', '', ''),
(9, 128, 'aspa', '2021-01-03T16:02:26.042Z', 81.556, '69.173.144.165', 'GET', 'pixel.rubiconproject.com', 200, 'OK', '50.1188', '8.6843', '', '', '', '', '', '', 'pixel.rubiconproject.com', 'image/gif', 'no-cache,no-store,must-revalidate', 'no-cache', '0', '', '', ''),
(9, 129, 'aspa', '2021-01-03T16:02:26.250Z', 73.271, '52.58.45.227', 'GET', 'x.bidswitch.net', 200, '', '50.1188', '8.6843', '', '', '', '', '', '', '', 'image/gif', 'no-cache, no-store, must-revalidate', '', '', '', '', ''),
(9, 130, 'aspa', '2021-01-03T16:02:26.465Z', 69.591, '35.227.252.103', 'GET', 'rtb.openx.net', 200, '', '39.1027', '-94.5778', '', '', '', '', '', '', '', 'image/gif', 'private, max-age=0, no-cache, must-revalidate', 'no-cache', '', '', '', ''),
(9, 131, 'aspa', '2021-01-03T16:02:26.466Z', 83.151, '95.100.197.53', 'GET', 'dsum-sec.casalemedia.com', 200, 'OK', '52.3716', '4.8883', '', '', '', '', '', '', 'dsum-sec.casalemedia.com', 'image/gif', 'max-age=0, no-cache, no-store', 'no-cache', 'Sun, 03 Jan 2021 16:02:26 GMT', '', '', ''),
(9, 132, 'aspa', '2021-01-03T16:02:26.469Z', 69.077, '34.98.64.218', 'GET', 'eu-u.openx.net', 200, '', '39.1027', '-94.5778', '', '', '', '', '', '', '', 'image/gif', 'private, max-age=0, no-cache', 'no-cache', 'Mon, 26 Jul 1997 05:00:00 GMT', '', '', ''),
(9, 133, 'aspa', '2021-01-03T16:02:26.472Z', 69.151, '34.98.64.218', 'GET', 'us-u.openx.net', 200, '', '39.1027', '-94.5778', '', '', '', '', '', '', '', 'image/gif', 'private, max-age=0, no-cache', 'no-cache', 'Mon, 26 Jul 1997 05:00:00 GMT', '', '', ''),
(9, 134, 'aspa', '2021-01-03T16:02:26.597Z', 98.945, '95.100.197.53', 'GET', 'dsum-sec.casalemedia.com', 200, 'OK', '52.3716', '4.8883', '', '', '', '', '', '', 'dsum-sec.casalemedia.com', 'image/gif', 'max-age=0, no-cache, no-store', 'no-cache', 'Sun, 03 Jan 2021 16:02:26 GMT', '', '', ''),
(9, 135, 'aspa', '2021-01-03T16:02:26.598Z', 98.206, '95.100.197.53', 'GET', 'dsum-sec.casalemedia.com', 200, 'OK', '52.3716', '4.8883', '', '', '', '', '', '', 'dsum-sec.casalemedia.com', 'image/gif', 'max-age=0, no-cache, no-store', 'no-cache', 'Sun, 03 Jan 2021 16:02:26 GMT', '', '', ''),
(9, 136, 'aspa', '2021-01-03T16:02:26.671Z', 100.624, '185.33.221.50', 'GET', 'ib.adnxs.com', 200, 'OK', '52.3716', '4.8883', '', '', '', '', '', '', 'ib.adnxs.com', 'image/gif', 'no-store, no-cache, private', 'no-cache', 'Sat, 15 Nov 2008 16:00:00 GMT', '', '', ''),
(9, 137, 'aspa', '2021-01-03T16:02:26.776Z', 140.557, '185.33.221.50', 'GET', 'ib.adnxs.com', 200, 'OK', '52.3716', '4.8883', '', '', '', '', '', '', 'ib.adnxs.com', 'image/gif', 'no-store, no-cache, private', 'no-cache', 'Sat, 15 Nov 2008 16:00:00 GMT', '', '', ''),
(9, 138, 'aspa', '2021-01-03T16:02:26.810Z', 85.548, '185.33.220.100', 'GET', 'm.adnxs.com', 302, 'Found', '52.3716', '4.8883', '', '', '', '', '', '', 'm.adnxs.com', 'text/html; charset=utf-8', 'no-store, no-cache, private', 'no-cache', 'Sat, 15 Nov 2008 16:00:00 GMT', '', '', ''),
(9, 139, 'aspa', '2021-01-03T16:02:26.822Z', 82.540, '2a00:1288:110:c305::8000', 'GET', 'pr-bh.ybp.yahoo.com', 200, '', '53.3382', '-6.2591', '', '', '', '', '', '', '', 'image/gif', '', '', 'Thu, 01 Jan 1970 00:00:00 GMT', '0', '', ''),
(9, 140, 'aspa', '2021-01-03T16:02:26.842Z', 130.390, '172.217.23.130', 'GET', 'cm.g.doubleclick.net', 302, '', '37.751', '-97.822', '', '', '', '', '', '', '', 'text/html; charset=UTF-8', 'no-cache, must-revalidate', 'no-cache', 'Fri, 01 Jan 1990 00:00:00 GMT', '', '', ''),
(9, 141, 'aspa', '2021-01-03T16:02:26.932Z', 66.924, '69.173.144.165', 'GET', 'pixel.rubiconproject.com', 200, 'OK', '50.1188', '8.6843', '', '', '', '', '', '', 'pixel.rubiconproject.com', 'image/gif', 'no-cache,no-store,must-revalidate', 'no-cache', '0', '', '', ''),
(9, 142, 'aspa', '2021-01-03T16:02:27.009Z', 88.625, '52.51.244.26', 'GET', 'sync.tidaltv.com', 200, 'OK', '53.3382', '-6.2591', '', '', '', '', '', '', 'sync.tidaltv.com', 'image/gif', 'no-cache, no-store, max-age=0, must-revalidate', 'no-cache', '0', '', '', ''),
(9, 143, 'aspa', '2021-01-03T16:02:27.042Z', 75.832, '185.33.221.50', 'GET', 'ib.adnxs.com', 200, 'OK', '52.3716', '4.8883', '', '', '', '', '', '', 'ib.adnxs.com', 'image/gif', 'no-store, no-cache, private', 'no-cache', 'Sat, 15 Nov 2008 16:00:00 GMT', '', '', ''),
(9, 144, 'aspa', '2021-01-03T16:02:27.044Z', 81.820, '34.120.207.148', 'GET', 'idsync.rlcdn.com', 200, '', '39.1027', '-94.5778', '', '', '', '', '', '', '', 'image/gif', 'no-cache, no-store', '', '', '', '', ''),
(9, 145, 'aspa', '2021-01-03T16:02:27.058Z', 74.197, '185.33.221.50', 'GET', 'ib.adnxs.com', 200, 'OK', '52.3716', '4.8883', '', '', '', '', '', '', 'ib.adnxs.com', 'image/gif', 'no-store, no-cache, private', 'no-cache', 'Sat, 15 Nov 2008 16:00:00 GMT', '', '', ''),
(9, 146, 'aspa', '2021-01-03T16:02:27.124Z', 86.791, '185.33.220.100', 'GET', 'm.adnxs.com', 302, 'Found', '52.3716', '4.8883', '', '', '', '', '', '', 'm.adnxs.com', 'text/html; charset=utf-8', 'no-store, no-cache, private', 'no-cache', 'Sat, 15 Nov 2008 16:00:00 GMT', '', '', ''),
(9, 147, 'aspa', '2021-01-03T16:02:27.228Z', 77.134, '185.33.220.100', 'GET', 'm.adnxs.com', 200, 'OK', '52.3716', '4.8883', '', '', '', '', '', '', 'm.adnxs.com', 'image/gif', 'no-store, no-cache, private', 'no-cache', 'Sat, 15 Nov 2008 16:00:00 GMT', '', '', ''),
(9, 148, 'aspa', '2021-01-03T16:02:27.054Z', 66.493, '52.58.45.227', 'GET', 'x.bidswitch.net', 302, '', '50.1188', '8.6843', '', '', '', '', '', '', '', '', 'no-cache, no-store, must-revalidate', '', '', '', '', ''),
(9, 149, 'aspa', '2021-01-03T16:02:27.055Z', 94.256, '54.76.211.112', 'GET', 'ads.servenobid.com', 200, '', '53.3382', '-6.2591', '', '', '', '', '', '', '', 'image/avif;charset=ISO-8859-1', '', '', '', '', '', ''),
(9, 150, 'aspa', '2021-01-03T16:02:27.277Z', 146.500, '193.122.128.135', 'GET', 'sync.technoratimedia.com', 204, '', '39.018', '-77.539', '', '', '', '', '', '', '', '', '', '', '', '0', '', ''),
(9, 151, 'aspa', '2021-01-03T16:02:27.308Z', 80.212, '172.217.23.130', 'GET', 'cm.g.doubleclick.net', 200, '', '37.751', '-97.822', '', '', '', '', '', '', '', 'image/png', 'no-cache, must-revalidate', 'no-cache', 'Fri, 01 Jan 1990 00:00:00 GMT', '', '', ''),
(9, 152, 'aspa', '2021-01-03T16:02:27.320Z', 65.897, '52.58.45.227', 'GET', 'x.bidswitch.net', 200, '', '50.1188', '8.6843', '', '', '', '', '', '', '', 'image/gif', 'no-cache, no-store, must-revalidate', '', '', '', '', ''),
(10, 1, 'john', '2020-12-17T14:45:26.154Z', 177.229, '212.205.82.93', 'GET', 'elta.gr', 200, '', '37.9842', '23.7353', '', '', '', '', '', '', '', 'text/html; charset=utf-8', 'private', '', '', '', '', ''),
(10, 2, 'john', '2020-12-17T14:45:26.757Z', 795.027, '212.205.82.93', 'GET', 'elta.gr', 200, '', '37.9842', '23.7353', '', '', '', '', '', '', '', 'text/css', '', '', '', '', 'Wed, 25 Jul 2012 12:38:06 GMT', ''),
(10, 3, 'john', '2020-12-17T14:45:26.759Z', 792.884, '212.205.82.93', 'GET', 'elta.gr', 200, '', '37.9842', '23.7353', '', '', '', '', '', '', '', 'text/css', '', '', '', '', 'Sat, 13 Feb 2016 20:38:04 GMT', ''),
(10, 4, 'john', '2020-12-17T14:45:26.761Z', 762.123, '212.205.82.93', 'GET', 'elta.gr', 200, '', '37.9842', '23.7353', '', '', '', '', '', '', '', 'text/css', '', '', '', '', 'Fri, 13 Mar 2020 12:46:12 GMT', ''),
(10, 5, 'john', '2020-12-17T14:45:26.764Z', 55.982, '212.205.82.93', 'GET', 'elta.gr', 200, '', '37.9842', '23.7353', '', '', '', '', '', '', '', 'text/css', '', '', '', '', 'Tue, 16 Jun 2020 10:14:17 GMT', ''),
(10, 6, 'john', '2020-12-17T14:45:26.764Z', 54.034, '212.205.82.93', 'GET', 'elta.gr', 200, '', '37.9842', '23.7353', '', '', '', '', '', '', '', 'text/css', '', '', '', '', 'Thu, 05 Jul 2012 10:16:00 GMT', ''),
(10, 7, 'john', '2020-12-17T14:45:26.766Z', 54.040, '212.205.82.93', 'GET', 'elta.gr', 200, '', '37.9842', '23.7353', '', '', '', '', '', '', '', 'text/css', '', '', '', '', 'Tue, 30 Oct 2012 14:40:08 GMT', ''),
(10, 8, 'john', '2020-12-17T14:45:26.766Z', 51.877, '212.205.82.93', 'GET', 'elta.gr', 200, '', '37.9842', '23.7353', '', '', '', '', '', '', '', 'text/css', '', '', '', '', 'Wed, 03 Oct 2018 09:31:53 GMT', ''),
(10, 9, 'john', '2020-12-17T14:45:26.767Z', 56.335, '212.205.82.93', 'GET', 'elta.gr', 200, '', '37.9842', '23.7353', '', '', '', '', '', '', '', 'text/css', '', '', '', '', 'Fri, 13 Mar 2020 12:44:33 GMT', ''),
(10, 10, 'john', '2020-12-17T14:45:26.767Z', 56.609, '212.205.82.93', 'GET', 'elta.gr', 200, '', '37.9842', '23.7353', '', '', '', '', '', '', '', 'text/css', '', '', '', '', 'Mon, 22 Feb 2016 12:26:13 GMT', ''),
(10, 11, 'john', '2020-12-17T14:45:26.767Z', 55.858, '212.205.82.93', 'GET', 'elta.gr', 200, '', '37.9842', '23.7353', '', '', '', '', '', '', '', 'text/css', '', '', '', '', 'Thu, 05 Jul 2012 09:48:46 GMT', ''),
(10, 12, 'john', '2020-12-17T14:45:26.768Z', 56.081, '212.205.82.93', 'GET', 'elta.gr', 200, '', '37.9842', '23.7353', '', '', '', '', '', '', '', 'text/css', '', '', '', '', 'Tue, 03 Jul 2012 12:46:10 GMT', ''),
(10, 13, 'john', '2020-12-17T14:45:26.768Z', 87.804, '212.205.82.93', 'GET', 'elta.gr', 200, '', '37.9842', '23.7353', '', '', '', '', '', '', '', 'application/javascript', '', '', '', '', 'Fri, 13 Mar 2020 13:58:12 GMT', ''),
(10, 14, 'john', '2020-12-17T14:45:26.769Z', 173.636, '212.205.82.93', 'GET', 'elta.gr', 200, '', '37.9842', '23.7353', '', '', '', '', '', '', '', 'application/javascript', '', '', '', '', 'Fri, 13 Mar 2020 13:58:12 GMT', ''),
(10, 15, 'john', '2020-12-17T14:45:26.769Z', 172.425, '212.205.82.93', 'GET', 'elta.gr', 200, '', '37.9842', '23.7353', '', '', '', '', '', '', '', 'application/javascript', '', '', '', '', 'Fri, 13 Mar 2020 12:45:52 GMT', ''),
(10, 16, 'john', '2020-12-17T14:45:26.769Z', 290.688, '212.205.82.93', 'GET', 'elta.gr', 200, '', '37.9842', '23.7353', '', '', '', '', '', '', '', 'application/x-javascript', 'public', '', 'Thu, 16 Dec 2021 15:25:19 GMT', '', 'Thu, 10 Sep 2020 01:23:31 GMT', ''),
(10, 17, 'john', '2020-12-17T14:45:26.770Z', 292.094, '212.205.82.93', 'GET', 'elta.gr', 200, '', '37.9842', '23.7353', '', '', '', '', '', '', '', 'application/x-javascript', 'public', '', 'Thu, 16 Dec 2021 15:25:20 GMT', '', 'Wed, 16 Dec 2020 15:25:20 GMT', ''),
(10, 18, 'john', '2020-12-17T14:45:26.770Z', 287.304, '212.205.82.93', 'GET', 'elta.gr', 200, '', '37.9842', '23.7353', '', '', '', '', '', '', '', 'application/x-javascript', 'public, max-age=31529905', '', 'Fri, 17 Dec 2021 13:03:53 GMT', '', 'Wed, 17 Jul 2013 00:00:00 GMT', ''),
(10, 19, 'john', '2020-12-17T14:45:26.771Z', 658.081, '212.205.82.93', 'GET', 'elta.gr', 200, '', '37.9842', '23.7353', '', '', '', '', '', '', '', 'application/javascript', '', '', '', '', 'Fri, 13 Mar 2020 12:47:03 GMT', ''),
(10, 20, 'john', '2020-12-17T14:45:26.772Z', 717.561, '212.205.82.93', 'GET', 'elta.gr', 200, '', '37.9842', '23.7353', '', '', '', '', '', '', '', 'application/javascript', '', '', '', '', 'Fri, 13 Mar 2020 13:58:12 GMT', ''),
(10, 21, 'john', '2020-12-17T14:45:26.772Z', 717.624, '212.205.82.93', 'GET', 'elta.gr', 200, '', '37.9842', '23.7353', '', '', '', '', '', '', '', 'application/javascript', '', '', '', '', 'Fri, 13 Mar 2020 12:47:03 GMT', ''),
(10, 22, 'john', '2020-12-17T14:45:26.773Z', 716.791, '212.205.82.93', 'GET', 'elta.gr', 200, '', '37.9842', '23.7353', '', '', '', '', '', '', '', 'application/javascript', '', '', '', '', 'Fri, 13 Mar 2020 12:47:03 GMT', ''),
(10, 23, 'john', '2020-12-17T14:45:26.773Z', 716.838, '212.205.82.93', 'GET', 'elta.gr', 200, '', '37.9842', '23.7353', '', '', '', '', '', '', '', 'application/javascript', '', '', '', '', 'Fri, 13 Mar 2020 13:58:12 GMT', ''),
(10, 24, 'john', '2020-12-17T14:45:26.773Z', 716.895, '212.205.82.93', 'GET', 'elta.gr', 200, '', '37.9842', '23.7353', '', '', '', '', '', '', '', 'application/javascript', '', '', '', '', 'Fri, 13 Mar 2020 12:47:03 GMT', ''),
(10, 25, 'john', '2020-12-17T14:45:26.774Z', 717.477, '212.205.82.93', 'GET', 'elta.gr', 200, '', '37.9842', '23.7353', '', '', '', '', '', '', '', 'application/javascript', '', '', '', '', 'Tue, 03 Jul 2012 12:45:18 GMT', ''),
(10, 26, 'john', '2020-12-17T14:45:26.774Z', 717.538, '212.205.82.93', 'GET', 'elta.gr', 200, '', '37.9842', '23.7353', '', '', '', '', '', '', '', 'application/javascript', '', '', '', '', 'Tue, 03 Jul 2012 12:43:30 GMT', ''),
(10, 27, 'john', '2020-12-17T14:45:26.774Z', 719.754, '212.205.82.93', 'GET', 'elta.gr', 200, '', '37.9842', '23.7353', '', '', '', '', '', '', '', 'application/javascript', '', '', '', '', 'Wed, 18 Jul 2012 08:45:08 GMT', ''),
(10, 28, 'john', '2020-12-17T14:45:26.775Z', 717.983, '212.205.82.93', 'GET', 'elta.gr', 200, '', '37.9842', '23.7353', '', '', '', '', '', '', '', 'application/javascript', '', '', '', '', 'Fri, 13 Mar 2020 13:58:12 GMT', ''),
(10, 29, 'john', '2020-12-17T14:45:26.775Z', 468.083, '212.205.82.93', 'GET', 'elta.gr', 200, '', '37.9842', '23.7353', '', '', '', '', '', '', '', 'image/jpeg', '', '', '', '', 'Sat, 23 Jun 2012 13:30:08 GMT', ''),
(10, 30, 'john', '2020-12-17T14:45:26.775Z', 468.191, '212.205.82.93', 'GET', 'elta.gr', 200, '', '37.9842', '23.7353', '', '', '', '', '', '', '', 'image/gif', '', '', '', '', 'Fri, 13 Mar 2020 12:46:53 GMT', ''),
(10, 31, 'john', '2020-12-17T14:45:26.775Z', 468.247, '212.205.82.93', 'GET', 'elta.gr', 200, '', '37.9842', '23.7353', '', '', '', '', '', '', '', 'image/gif', '', '', '', '', 'Fri, 13 Mar 2020 12:46:53 GMT', ''),
(10, 32, 'john', '2020-12-17T14:45:26.775Z', 468.300, '212.205.82.93', 'GET', 'elta.gr', 200, '', '37.9842', '23.7353', '', '', '', '', '', '', '', 'image/gif', '', '', '', '', 'Tue, 03 Jul 2012 12:45:10 GMT', ''),
(10, 33, 'john', '2020-12-17T14:45:26.864Z', 468.369, '212.205.82.93', 'GET', 'elta.gr', 302, '', '37.9842', '23.7353', '', '', '', '', '', '', '', 'text/html; charset=utf-8', 'private', '', '', '', '', ''),
(10, 34, 'john', '2020-12-17T14:45:26.865Z', 442.432, '212.205.82.93', 'GET', 'elta.gr', 200, '', '37.9842', '23.7353', '', '', '', '', '', '', '', 'image/gif', '', '', '', '', 'Tue, 09 Oct 2018 12:48:52 GMT', ''),
(10, 35, 'john', '2020-12-17T14:45:26.865Z', 440.624, '212.205.82.93', 'GET', 'elta.gr', 200, '', '37.9842', '23.7353', '', '', '', '', '', '', '', 'image/gif', '', '', '', '', 'Wed, 24 Jun 2020 09:30:30 GMT', ''),
(10, 36, 'john', '2020-12-17T14:45:26.865Z', 440.651, '212.205.82.93', 'GET', 'elta.gr', 200, '', '37.9842', '23.7353', '', '', '', '', '', '', '', 'image/jpeg', '', '', '', '', 'Mon, 17 Jul 2017 11:18:42 GMT', ''),
(10, 37, 'john', '2020-12-17T14:45:26.865Z', 440.679, '212.205.82.93', 'GET', 'elta.gr', 200, '', '37.9842', '23.7353', '', '', '', '', '', '', '', 'image/jpeg', '', '', '', '', 'Mon, 17 Jul 2017 11:18:41 GMT', '');
INSERT INTO `har_info` (`id`, `entry`, `usr_name`, `startedDateTime`, `wait`, `serverIpAddress`, `method`, `url`, `status`, `statusText`, `lat`, `lon`, `req_content_type`, `req_cache_control`, `req_pragma`, `req_expires`, `req_age`, `req_last_modified`, `req_host`, `res_content_type`, `res_cache_control`, `res_pragma`, `res_expires`, `res_age`, `res_last_modified`, `res_host`) VALUES
(10, 38, 'john', '2020-12-17T14:45:26.865Z', 443.984, '212.205.82.93', 'GET', 'elta.gr', 200, '', '37.9842', '23.7353', '', '', '', '', '', '', '', 'image/png', '', '', '', '', 'Tue, 13 Mar 2018 12:15:52 GMT', ''),
(10, 39, 'john', '2020-12-17T14:45:26.865Z', 444.021, '212.205.82.93', 'GET', 'elta.gr', 200, '', '37.9842', '23.7353', '', '', '', '', '', '', '', 'image/png', '', '', '', '', 'Tue, 22 Jan 2019 11:03:41 GMT', ''),
(10, 40, 'john', '2020-12-17T14:45:26.865Z', 444.007, '212.205.82.93', 'GET', 'elta.gr', 200, '', '37.9842', '23.7353', '', '', '', '', '', '', '', 'image/gif', '', '', '', '', 'Mon, 13 Oct 2014 12:14:00 GMT', ''),
(10, 41, 'john', '2020-12-17T14:45:26.865Z', 468.795, '212.205.82.93', 'GET', 'elta.gr', 200, '', '37.9842', '23.7353', '', '', '', '', '', '', '', 'application/javascript', '', '', '', '', 'Fri, 13 Mar 2020 13:58:12 GMT', ''),
(10, 42, 'john', '2020-12-17T14:45:27.750Z', 333.305, '2a00:1450:4001:819::2008', 'GET', 'ssl.google-analytics.com', 200, '', '50.1188', '8.6843', '', '', '', '', '', '', '', 'text/javascript', 'public, max-age=7200', '', 'Thu, 17 Dec 2020 15:41:51 GMT', '3817', 'Fri, 23 Oct 2020 03:00:57 GMT', ''),
(10, 43, 'john', '2020-12-17T14:45:28.296Z', 26.910, '212.205.82.93', 'GET', 'elta.gr', 200, '', '37.9842', '23.7353', '', '', '', '', '', '', '', 'image/png', '', '', '', '', 'Tue, 03 Jul 2012 12:38:04 GMT', ''),
(10, 44, 'john', '2020-12-17T14:45:28.358Z', 209.993, '2a03:2880:f0ff:c:face:b00c:0:3', 'GET', 'connect.facebook.net', 200, '', '34.0544', '-118.244', '', '', '', '', '', '', '', 'application/x-javascript; charset=utf-8', 'public,max-age=1200,stale-while-revalidate=3600', '', 'Thu, 17 Dec 2020 14:54:29 GMT', '', '', ''),
(10, 45, 'john', '2020-12-17T14:45:28.373Z', 24.402, '212.205.82.93', 'GET', 'elta.gr', 200, '', '37.9842', '23.7353', '', '', '', '', '', '', '', 'image/jpeg', '', '', '', '', 'Tue, 03 Jul 2012 12:45:04 GMT', ''),
(10, 46, 'john', '2020-12-17T14:45:28.374Z', 22.274, '212.205.82.93', 'GET', 'elta.gr', 200, '', '37.9842', '23.7353', '', '', '', '', '', '', '', 'image/jpeg', '', '', '', '', 'Tue, 03 Jul 2012 12:45:04 GMT', ''),
(10, 47, 'john', '2020-12-17T14:45:28.376Z', 20.911, '212.205.82.93', 'GET', 'elta.gr', 200, '', '37.9842', '23.7353', '', '', '', '', '', '', '', 'image/png', '', '', '', '', 'Tue, 03 Jul 2012 12:45:10 GMT', ''),
(10, 48, 'john', '2020-12-17T14:45:28.377Z', 31.800, '212.205.82.93', 'GET', 'elta.gr', 200, '', '37.9842', '23.7353', '', '', '', '', '', '', '', 'image/png', '', '', '', '', 'Tue, 03 Jul 2012 12:45:10 GMT', ''),
(10, 49, 'john', '2020-12-17T14:45:28.378Z', 33.001, '212.205.82.93', 'GET', 'elta.gr', 200, '', '37.9842', '23.7353', '', '', '', '', '', '', '', 'image/png', '', '', '', '', 'Tue, 03 Jul 2012 12:45:10 GMT', ''),
(10, 50, 'john', '2020-12-17T14:45:28.379Z', 68.772, '212.205.82.93', 'GET', 'elta.gr', 200, '', '37.9842', '23.7353', '', '', '', '', '', '', '', 'image/png', '', '', '', '', 'Tue, 03 Jul 2012 12:45:10 GMT', ''),
(10, 51, 'john', '2020-12-17T14:45:28.381Z', 68.787, '212.205.82.93', 'GET', 'elta.gr', 200, '', '37.9842', '23.7353', '', '', '', '', '', '', '', 'image/jpeg', '', '', '', '', 'Tue, 03 Jul 2012 12:45:06 GMT', ''),
(10, 52, 'john', '2020-12-17T14:45:28.383Z', 68.815, '212.205.82.93', 'GET', 'elta.gr', 200, '', '37.9842', '23.7353', '', '', '', '', '', '', '', 'image/jpeg', '', '', '', '', 'Tue, 03 Jul 2012 12:44:36 GMT', ''),
(10, 53, 'john', '2020-12-17T14:45:28.384Z', 68.772, '212.205.82.93', 'GET', 'elta.gr', 404, '', '37.9842', '23.7353', '', '', '', '', '', '', '', 'text/html; charset=utf-8', 'private', '', '', '', '', ''),
(10, 54, 'john', '2020-12-17T14:45:28.396Z', 60.193, '212.205.82.93', 'GET', 'elta.gr', 200, '', '37.9842', '23.7353', '', '', '', '', '', '', '', 'image/png', '', '', '', '', 'Tue, 03 Jul 2012 12:45:06 GMT', ''),
(10, 55, 'john', '2020-12-17T14:45:28.398Z', 55.043, '212.205.82.93', 'GET', 'elta.gr', 200, '', '37.9842', '23.7353', '', '', '', '', '', '', '', 'image/png', '', '', '', '', 'Tue, 03 Jul 2012 12:45:06 GMT', ''),
(10, 56, 'john', '2020-12-17T14:45:28.403Z', 70.263, '212.205.82.93', 'GET', 'elta.gr', 200, '', '37.9842', '23.7353', '', '', '', '', '', '', '', 'image/jpeg', '', '', '', '', 'Tue, 03 Jul 2012 12:45:06 GMT', ''),
(10, 57, 'john', '2020-12-17T14:45:28.409Z', 54.022, '212.205.82.93', 'GET', 'elta.gr', 200, '', '37.9842', '23.7353', '', '', '', '', '', '', '', 'image/jpeg', '', '', '', '', 'Tue, 03 Jul 2012 12:44:26 GMT', ''),
(10, 58, 'john', '2020-12-17T14:45:28.411Z', 54.082, '212.205.82.93', 'GET', 'elta.gr', 200, '', '37.9842', '23.7353', '', '', '', '', '', '', '', 'image/jpeg', '', '', '', '', 'Tue, 03 Jul 2012 12:44:28 GMT', ''),
(10, 59, 'john', '2020-12-17T14:45:28.415Z', 54.595, '212.205.82.93', 'GET', 'elta.gr', 200, '', '37.9842', '23.7353', '', '', '', '', '', '', '', 'image/jpeg', '', '', '', '', 'Tue, 03 Jul 2012 12:44:26 GMT', ''),
(10, 60, 'john', '2020-12-17T14:45:28.417Z', 55.405, '212.205.82.93', 'GET', 'elta.gr', 200, '', '37.9842', '23.7353', '', '', '', '', '', '', '', 'image/jpeg', '', '', '', '', 'Tue, 03 Jul 2012 12:44:26 GMT', ''),
(10, 61, 'john', '2020-12-17T14:45:28.419Z', 55.168, '212.205.82.93', 'GET', 'elta.gr', 200, '', '37.9842', '23.7353', '', '', '', '', '', '', '', 'image/jpeg', '', '', '', '', 'Tue, 03 Jul 2012 12:44:26 GMT', ''),
(10, 62, 'john', '2020-12-17T14:45:28.421Z', 49.782, '212.205.82.93', 'GET', 'elta.gr', 200, '', '37.9842', '23.7353', '', '', '', '', '', '', '', 'image/jpeg', '', '', '', '', 'Tue, 03 Jul 2012 12:44:26 GMT', ''),
(10, 63, 'john', '2020-12-17T14:45:28.439Z', 54.955, '212.205.82.93', 'GET', 'elta.gr', 200, '', '37.9842', '23.7353', '', '', '', '', '', '', '', 'image/jpeg', '', '', '', '', 'Fri, 21 Sep 2018 13:13:52 GMT', ''),
(10, 64, 'john', '2020-12-17T14:45:28.442Z', 55.012, '212.205.82.93', 'GET', 'elta.gr', 200, '', '37.9842', '23.7353', '', '', '', '', '', '', '', 'image/jpeg', '', '', '', '', 'Tue, 16 Jun 2020 10:07:30 GMT', ''),
(10, 65, 'john', '2020-12-17T14:45:28.789Z', 49.487, '212.205.82.93', 'GET', 'elta.gr', 200, '', '37.9842', '23.7353', '', '', '', '', '', '', '', 'application/javascript', '', '', '', '', 'Fri, 13 Mar 2020 13:58:12 GMT', ''),
(10, 66, 'john', '2020-12-17T14:45:29.008Z', 70.509, '2a00:1450:4001:819::2008', 'GET', 'ssl.google-analytics.com', 200, '', '50.1188', '8.6843', '', '', '', '', '', '', '', 'image/gif', 'no-cache, no-store, must-revalidate', 'no-cache', 'Fri, 01 Jan 1990 00:00:00 GMT', '', 'Sun, 17 May 1998 03:00:00 GMT', ''),
(10, 67, 'john', '2020-12-17T14:45:29.059Z', 67.795, '2a03:2880:f0ff:c:face:b00c:0:3', 'GET', 'connect.facebook.net', 200, '', '34.0544', '-118.244', '', '', '', '', '', '', '', 'application/x-javascript; charset=utf-8', 'public,max-age=31536000,stale-while-revalidate=3600,immutable', '', 'Fri, 17 Dec 2021 14:09:41 GMT', '', '', ''),
(10, 68, 'john', '2020-12-17T14:45:29.078Z', 37.262, '212.205.82.93', 'GET', 'elta.gr', 200, '', '37.9842', '23.7353', '', '', '', '', '', '', '', 'application/javascript', '', '', '', '', 'Fri, 13 Mar 2020 13:58:13 GMT', ''),
(10, 69, 'john', '2020-12-17T14:45:29.366Z', 115.772, '2606:4700::6810:135e', 'GET', 'cdnjs.cloudflare.com', 200, '', '37.751', '-97.822', '', '', '', '', '', '', '', 'text/css; charset=utf-8', 'public, max-age=30672000', '', 'Tue, 07 Dec 2021 14:45:29 GMT', '577903', 'Mon, 04 May 2020 16:09:17 GMT', ''),
(10, 70, 'john', '2020-12-17T14:45:29.561Z', 120.220, '2a03:2880:f1ff:83:face:b00c:0:25de', 'GET', 'facebook.com', 200, '', '34.0544', '-118.244', '', '', '', '', '', '', '', 'text/html; charset=\"utf-8\"', 'private, no-cache, no-store, must-revalidate', 'no-cache', 'Sat, 01 Jan 2000 00:00:00 GMT', '', '', ''),
(10, 71, 'john', '2020-12-17T14:45:29.863Z', 78.859, '2a03:2880:f0ff:c:face:b00c:0:3', 'GET', 'static.xx.fbcdn.net', 200, '', '34.0544', '-118.244', '', '', '', '', '', '', '', 'image/png', 'public,max-age=31536000,immutable', '', 'Thu, 09 Dec 2021 09:57:31 GMT', '', 'Mon, 01 Jan 2001 08:00:00 GMT', ''),
(10, 72, 'john', '2020-12-17T14:45:29.864Z', 78.916, '2a03:2880:f0ff:c:face:b00c:0:3', 'GET', 'static.xx.fbcdn.net', 200, '', '34.0544', '-118.244', '', '', '', '', '', '', '', 'image/png', 'public,max-age=31536000,immutable', '', 'Thu, 09 Dec 2021 09:58:15 GMT', '', 'Mon, 01 Jan 2001 08:00:00 GMT', ''),
(10, 73, 'john', '2020-12-17T14:45:29.964Z', 60.676, '2a03:2880:f0ff:c:face:b00c:0:3', 'GET', 'static.xx.fbcdn.net', 200, '', '34.0544', '-118.244', '', '', '', '', '', '', '', 'application/x-javascript; charset=utf-8', 'public,max-age=31536000,immutable', '', 'Fri, 17 Dec 2021 03:51:53 GMT', '', 'Mon, 01 Jan 2001 08:00:00 GMT', ''),
(10, 74, 'john', '2020-12-17T14:45:30.356Z', 173.322, '2a03:2880:f1ff:83:face:b00c:0:25de', 'GET', 'facebook.com', 200, '', '34.0544', '-118.244', '', '', '', '', '', '', '', 'image/png', 'private, no-store, no-cache, must-revalidate', 'no-cache', 'Sat, 01 Jan 2000 00:00:00 GMT', '', '', ''),
(11, 1, 'shawn', '2020-12-11T23:45:42.198Z', 34.274, '54.240.169.51', 'GET', 'music-map.com', 200, 'OK', '37.751', '-97.822', '', 'max-age=0', '', '', '', '', 'www.music-map.com', 'text/html; charset=UTF-8', 'public, max-age=300', '', '', '7', '', ''),
(11, 2, 'shawn', '2020-12-11T23:45:42.248Z', 0.111, '54.240.169.51', 'GET', 'music-map.com', 200, 'OK', '37.751', '-97.822', '', '', '', '', '', '', '', 'text/css;charset=UTF-8', 'max-age=86402', '', '', '59907', '', ''),
(11, 3, 'shawn', '2020-12-11T23:45:42.248Z', 0.033, '54.240.169.51', 'GET', 'music-map.com', 200, 'OK', '37.751', '-97.822', '', '', '', '', '', '', '', 'text/javascript;charset=UTF-8', 'max-age=86402', '', '', '67416', '', ''),
(11, 4, 'shawn', '2020-12-11T23:45:42.249Z', 0.067, '54.240.169.51', 'GET', 'music-map.com', 200, 'OK', '37.751', '-97.822', '', '', '', '', '', '', '', 'text/javascript;charset=UTF-8', 'max-age=86402', '', '', '53114', '', ''),
(11, 5, 'shawn', '2020-12-11T23:45:42.249Z', 0.067, '54.240.169.51', 'GET', 'music-map.com', 200, 'OK', '37.751', '-97.822', '', '', '', '', '', '', '', 'text/javascript;charset=UTF-8', 'max-age=86402', '', '', '53114', '', ''),
(11, 6, 'shawn', '2020-12-11T23:45:42.249Z', 0.047, '54.240.169.51', 'GET', 'music-map.com', 200, 'OK', '37.751', '-97.822', '', '', '', '', '', '', '', 'text/javascript;charset=UTF-8', 'max-age=86402', '', '', '50326', '', ''),
(11, 7, 'shawn', '2020-12-11T23:45:42.275Z', 0.057, '54.240.169.51', 'GET', 'music-map.com', 200, 'OK', '37.751', '-97.822', '', '', '', '', '', '', '', 'font/woff', 'max-age=86402', '', '', '53071', '', ''),
(11, 8, 'shawn', '2020-12-11T23:45:42.276Z', 0.055, '2a00:1450:4001:819::200e', 'GET', 'google-analytics.com', 200, '', '50.1188', '8.6843', '', '', '', '', '', '', '', 'text/javascript', 'public, max-age=7200', '', 'Sat, 12 Dec 2020 00:49:50 GMT', '2203', 'Fri, 23 Oct 2020 03:00:57 GMT', ''),
(11, 9, 'shawn', '2020-12-11T23:45:42.298Z', 71.160, '2a00:1450:4001:820::200e', 'POST', 'google-analytics.com', 200, '', '50.1188', '8.6843', 'text/plain', '', '', '', '', '', '', 'text/plain', 'no-cache, no-store, must-revalidate', 'no-cache', 'Fri, 01 Jan 1990 00:00:00 GMT', '', 'Sun, 17 May 1998 03:00:00 GMT', ''),
(11, 10, 'shawn', '2020-12-11T23:45:42.302Z', 33.222, '54.240.169.51', 'GET', 'music-map.com', 200, 'OK', '37.751', '-97.822', '', 'no-cache', 'no-cache', '', '', '', 'www.music-map.com', 'image/x-icon', 'max-age=86402', '', '', '62376', '', ''),
(12, 1, 'shawn', '2020-12-21T17:39:32.324Z', 217.926, '2600:3c01::f03c:91ff:fe6e:941b', 'GET', 'musictheory.net', 200, '', '37.5625', '-122.0004', '', '', '', '', '', '', '', 'text/html', 'no-cache', '', 'Thu, 01 Jan 1970 00:00:01 GMT', '', 'Fri, 21 Aug 2020 00:24:22 GMT', ''),
(12, 2, 'shawn', '2020-12-21T17:39:33.222Z', 212.280, '2600:3c01::f03c:91ff:fe6e:941b', 'GET', 'musictheory.net', 200, '', '37.5625', '-122.0004', '', '', '', '', '', '', '', 'text/css', 'max-age=31449600', '', 'Mon, 20 Dec 2021 17:39:31 GMT', '', 'Fri, 21 Aug 2020 00:24:23 GMT', ''),
(12, 3, 'shawn', '2020-12-21T17:39:33.222Z', 210.980, '2600:3c01::f03c:91ff:fe6e:941b', 'GET', 'musictheory.net', 200, '', '37.5625', '-122.0004', '', '', '', '', '', '', '', 'text/javascript', 'max-age=31449600', '', 'Mon, 20 Dec 2021 17:39:31 GMT', '', 'Fri, 21 Aug 2020 00:24:23 GMT', ''),
(12, 4, 'shawn', '2020-12-21T17:39:33.222Z', 740.090, '2600:3c01::f03c:91ff:fe6e:941b', 'GET', 'musictheory.net', 200, '', '37.5625', '-122.0004', '', '', '', '', '', '', '', 'text/javascript', 'max-age=31449600', '', 'Mon, 20 Dec 2021 17:39:31 GMT', '', 'Fri, 21 Aug 2020 00:24:23 GMT', ''),
(12, 5, 'shawn', '2020-12-21T17:39:33.222Z', 836.808, '2600:3c01::f03c:91ff:fe6e:941b', 'GET', 'musictheory.net', 200, '', '37.5625', '-122.0004', '', '', '', '', '', '', '', 'text/javascript', 'max-age=31449600', '', 'Mon, 20 Dec 2021 17:39:31 GMT', '', 'Fri, 21 Aug 2020 00:24:23 GMT', ''),
(12, 6, 'shawn', '2020-12-21T17:39:33.223Z', 221.811, '2600:3c01::f03c:91ff:fe6e:941b', 'GET', 'musictheory.net', 200, '', '37.5625', '-122.0004', '', '', '', '', '', '', '', 'image/png', 'max-age=31449600', '', 'Mon, 20 Dec 2021 17:39:31 GMT', '', 'Fri, 21 Aug 2020 00:24:23 GMT', ''),
(12, 7, 'shawn', '2020-12-21T17:39:33.223Z', 626.101, '2600:3c01::f03c:91ff:fe6e:941b', 'GET', 'musictheory.net', 200, '', '37.5625', '-122.0004', '', '', '', '', '', '', '', 'image/jpeg', 'max-age=31449600', '', 'Mon, 20 Dec 2021 17:39:31 GMT', '', 'Fri, 21 Aug 2020 00:24:23 GMT', ''),
(12, 8, 'shawn', '2020-12-21T17:39:34.100Z', 817.825, '2600:3c01::f03c:91ff:fe6e:941b', 'GET', 'musictheory.net', 200, '', '37.5625', '-122.0004', '', '', '', '', '', '', '', 'text/html', 'no-cache', '', 'Thu, 01 Jan 1970 00:00:01 GMT', '', 'Fri, 21 Aug 2020 00:24:22 GMT', ''),
(12, 9, 'shawn', '2020-12-21T17:39:34.101Z', 1015.209, '2600:3c01::f03c:91ff:fe6e:941b', 'GET', 'musictheory.net', 200, '', '37.5625', '-122.0004', '', '', '', '', '', '', '', 'text/html', 'no-cache', '', 'Thu, 01 Jan 1970 00:00:01 GMT', '', 'Fri, 21 Aug 2020 00:24:22 GMT', ''),
(12, 10, 'shawn', '2020-12-21T17:39:34.102Z', 1002.609, '2600:3c01::f03c:91ff:fe6e:941b', 'GET', 'musictheory.net', 200, '', '37.5625', '-122.0004', '', '', '', '', '', '', '', 'text/html', 'no-cache', '', 'Thu, 01 Jan 1970 00:00:01 GMT', '', 'Fri, 21 Aug 2020 00:24:22 GMT', ''),
(12, 11, 'shawn', '2020-12-21T17:39:34.103Z', 992.618, '2600:3c01::f03c:91ff:fe6e:941b', 'GET', 'musictheory.net', 200, '', '37.5625', '-122.0004', '', '', '', '', '', '', '', 'text/html', 'no-cache', '', 'Thu, 01 Jan 1970 00:00:01 GMT', '', 'Fri, 21 Aug 2020 00:24:22 GMT', ''),
(12, 12, 'shawn', '2020-12-21T17:39:34.105Z', 992.521, '2600:3c01::f03c:91ff:fe6e:941b', 'GET', 'musictheory.net', 200, '', '37.5625', '-122.0004', '', '', '', '', '', '', '', 'text/html', 'no-cache', '', 'Thu, 01 Jan 1970 00:00:01 GMT', '', 'Fri, 21 Aug 2020 00:24:22 GMT', ''),
(12, 13, 'shawn', '2020-12-21T17:39:34.106Z', 992.502, '2600:3c01::f03c:91ff:fe6e:941b', 'GET', 'musictheory.net', 200, '', '37.5625', '-122.0004', '', '', '', '', '', '', '', 'text/html', 'no-cache', '', 'Thu, 01 Jan 1970 00:00:01 GMT', '', 'Fri, 21 Aug 2020 00:24:22 GMT', ''),
(12, 14, 'shawn', '2020-12-21T17:39:34.107Z', 992.664, '2600:3c01::f03c:91ff:fe6e:941b', 'GET', 'musictheory.net', 200, '', '37.5625', '-122.0004', '', '', '', '', '', '', '', 'text/html', 'no-cache', '', 'Thu, 01 Jan 1970 00:00:01 GMT', '', 'Fri, 21 Aug 2020 00:24:22 GMT', ''),
(12, 15, 'shawn', '2020-12-21T17:39:34.110Z', 990.573, '2600:3c01::f03c:91ff:fe6e:941b', 'GET', 'musictheory.net', 200, '', '37.5625', '-122.0004', '', '', '', '', '', '', '', 'text/plain; charset=utf-8', 'no-store, no-cache, must-revalidate, proxy-revalidate', 'no-cache', '0', '', '', ''),
(12, 16, 'shawn', '2020-12-21T17:39:34.114Z', 992.587, '2600:3c01::f03c:91ff:fe6e:941b', 'GET', 'musictheory.net', 200, '', '37.5625', '-122.0004', '', '', '', '', '', '', '', 'image/png', 'max-age=31449600', '', 'Mon, 20 Dec 2021 17:39:32 GMT', '', 'Fri, 21 Aug 2020 00:24:23 GMT', ''),
(12, 17, 'shawn', '2020-12-21T17:39:34.115Z', 992.908, '2600:3c01::f03c:91ff:fe6e:941b', 'GET', 'musictheory.net', 200, '', '37.5625', '-122.0004', '', '', '', '', '', '', '', 'image/png', 'max-age=31449600', '', 'Mon, 20 Dec 2021 17:39:32 GMT', '', 'Fri, 21 Aug 2020 00:24:23 GMT', ''),
(12, 18, 'shawn', '2020-12-21T17:39:34.115Z', 992.983, '2600:3c01::f03c:91ff:fe6e:941b', 'GET', 'musictheory.net', 200, '', '37.5625', '-122.0004', '', '', '', '', '', '', '', 'image/png', 'max-age=31449600', '', 'Mon, 20 Dec 2021 17:39:32 GMT', '', 'Fri, 21 Aug 2020 00:24:23 GMT', ''),
(12, 19, 'shawn', '2020-12-21T17:39:35.340Z', 199.528, '2600:3c01::f03c:91ff:fe6e:941b', 'GET', 'musictheory.net', 200, '', '37.5625', '-122.0004', '', '', '', '', '', '', '', 'image/png', 'max-age=31449600', '', 'Mon, 20 Dec 2021 17:39:33 GMT', '', 'Fri, 21 Aug 2020 00:24:23 GMT', ''),
(13, 1, 'ceid', '2020-12-21T17:34:26.230Z', 302.004, '150.140.129.17', 'GET', 'mail1.upnet.gr', 401, 'Unauthorized', '38.2475', '21.7311', '', 'max-age=0', '', '', '', '', 'mail1.upnet.gr', 'text/html; charset=UTF-8', 'private, no-cache, no-store, must-revalidate, post-check=0, pre-check=0', 'no-cache', 'Mon, 21 Dec 2020 17:34:24 GMT', '', 'Mon, 21 Dec 2020 17:34:24 GMT', ''),
(13, 2, 'ceid', '2020-12-21T17:34:26.804Z', 0.080, '150.140.129.17', 'GET', 'mail1.upnet.gr', 200, 'OK', '38.2475', '21.7311', '', '', '', '', '', '', '', 'text/css', 'max-age=2592000', '', 'Wed, 20 Jan 2021 08:05:10 GMT', '', 'Wed, 13 Feb 2019 14:47:50 GMT', ''),
(13, 3, 'ceid', '2020-12-21T17:34:26.804Z', 0.069, '150.140.129.17', 'GET', 'mail1.upnet.gr', 200, 'OK', '38.2475', '21.7311', '', '', '', '', '', '', '', 'text/css', 'max-age=2592000', '', 'Wed, 20 Jan 2021 08:05:09 GMT', '', 'Thu, 21 Nov 2019 14:41:38 GMT', ''),
(13, 4, 'ceid', '2020-12-21T17:34:26.805Z', 0.035, '150.140.129.17', 'GET', 'mail1.upnet.gr', 200, 'OK', '38.2475', '21.7311', '', '', '', '', '', '', '', 'text/css', 'max-age=2592000', '', 'Wed, 20 Jan 2021 08:05:09 GMT', '', 'Thu, 30 Jan 2020 10:12:51 GMT', ''),
(13, 5, 'ceid', '2020-12-21T17:34:26.805Z', 0.073, '150.140.129.17', 'GET', 'mail1.upnet.gr', 200, 'OK', '38.2475', '21.7311', '', '', '', '', '', '', '', 'text/css', 'max-age=2592000', '', 'Wed, 20 Jan 2021 08:05:09 GMT', '', 'Sat, 09 Nov 2019 20:13:24 GMT', ''),
(13, 6, 'ceid', '2020-12-21T17:34:26.805Z', 0.041, '150.140.129.17', 'GET', 'mail1.upnet.gr', 200, 'OK', '38.2475', '21.7311', '', '', '', '', '', '', '', 'text/javascript', 'max-age=2592000', '', 'Wed, 20 Jan 2021 08:05:09 GMT', '', 'Sat, 09 Nov 2019 20:13:29 GMT', ''),
(13, 7, 'ceid', '2020-12-21T17:34:26.805Z', 0.052, '150.140.129.17', 'GET', 'mail1.upnet.gr', 200, 'OK', '38.2475', '21.7311', '', '', '', '', '', '', '', 'text/javascript', 'max-age=2592000', '', 'Wed, 20 Jan 2021 08:05:09 GMT', '', 'Wed, 19 Feb 2020 20:56:23 GMT', ''),
(13, 8, 'ceid', '2020-12-21T17:34:26.805Z', 0.069, '150.140.129.17', 'GET', 'mail1.upnet.gr', 200, 'OK', '38.2475', '21.7311', '', '', '', '', '', '', '', 'text/javascript', 'max-age=2592000', '', 'Wed, 20 Jan 2021 08:05:10 GMT', '', 'Wed, 19 Feb 2020 20:56:23 GMT', ''),
(13, 9, 'ceid', '2020-12-21T17:34:26.805Z', 0.032, '150.140.129.17', 'GET', 'mail1.upnet.gr', 200, 'OK', '38.2475', '21.7311', '', '', '', '', '', '', '', 'text/javascript', 'max-age=2592000', '', 'Wed, 20 Jan 2021 08:05:10 GMT', '', 'Sat, 09 Nov 2019 20:13:30 GMT', ''),
(13, 10, 'ceid', '2020-12-21T17:34:26.805Z', 0.046, '150.140.129.17', 'GET', 'mail1.upnet.gr', 200, 'OK', '38.2475', '21.7311', '', '', '', '', '', '', '', 'text/javascript', 'max-age=2592000', '', 'Wed, 20 Jan 2021 08:05:10 GMT', '', 'Sat, 09 Nov 2019 20:13:24 GMT', ''),
(13, 11, 'ceid', '2020-12-21T17:34:26.805Z', 0.033, '150.140.129.17', 'GET', 'mail1.upnet.gr', 200, 'OK', '38.2475', '21.7311', '', '', '', '', '', '', '', 'text/javascript', 'max-age=2592000', '', 'Wed, 20 Jan 2021 08:05:10 GMT', '', 'Sat, 09 Nov 2019 20:13:24 GMT', ''),
(13, 12, 'ceid', '2020-12-21T17:34:26.806Z', 0.065, '150.140.129.17', 'GET', 'mail1.upnet.gr', 200, 'OK', '38.2475', '21.7311', '', '', '', '', '', '', '', 'image/svg+xml', 'max-age=2592000', '', 'Wed, 20 Jan 2021 08:05:10 GMT', '', 'Thu, 21 Nov 2019 12:03:27 GMT', ''),
(13, 13, 'ceid', '2020-12-21T17:34:26.806Z', 0.056, '150.140.129.17', 'GET', 'mail1.upnet.gr', 200, 'OK', '38.2475', '21.7311', '', '', '', '', '', '', '', 'text/javascript', 'max-age=2592000', '', 'Wed, 20 Jan 2021 08:05:10 GMT', '', 'Wed, 13 Feb 2019 14:47:50 GMT', ''),
(13, 14, 'ceid', '2020-12-21T17:34:26.806Z', 0.051, '150.140.129.17', 'GET', 'mail1.upnet.gr', 200, 'OK', '38.2475', '21.7311', '', '', '', '', '', '', '', 'text/javascript', 'max-age=2592000', '', 'Wed, 20 Jan 2021 08:05:10 GMT', '', 'Sat, 09 Nov 2019 20:13:25 GMT', ''),
(13, 15, 'ceid', '2020-12-21T17:34:26.876Z', 0.068, '150.140.129.17', 'GET', 'mail1.upnet.gr', 200, 'OK', '38.2475', '21.7311', '', '', '', '', '', '', '', 'text/plain; charset=UTF-8', 'max-age=2592000', '', 'Wed, 20 Jan 2021 08:05:10 GMT', '', 'Sat, 09 Nov 2019 20:13:25 GMT', ''),
(13, 16, 'ceid', '2020-12-21T17:34:26.876Z', 0.038, '150.140.129.17', 'GET', 'mail1.upnet.gr', 200, 'OK', '38.2475', '21.7311', '', '', '', '', '', '', '', 'text/plain; charset=UTF-8', 'max-age=2592000', '', 'Wed, 20 Jan 2021 08:05:10 GMT', '', 'Sat, 09 Nov 2019 20:13:25 GMT', ''),
(14, 1, 'ceid', '2020-12-07T09:33:10.077Z', 0.452, '150.140.141.173', 'GET', 'webmail.ceid.upatras.gr', 200, 'OK', '38.2475', '21.7311', '', '', '', '', '', '', '', 'text/css', 'max-age=2592000', '', 'Fri, 01 Jan 2021 18:53:09 GMT', '', 'Sun, 14 Jan 2018 13:00:51 GMT', ''),
(15, 1, 'ari', '2020-12-13T21:10:52.368Z', 149.040, '2a00:1450:4001:81d::2004', 'GET', 'google.com', 200, '', '50.1188', '8.6843', '', '', '', '', '', '', '', 'text/html; charset=UTF-8', 'private, max-age=0', '', '-1', '', '', ''),
(15, 2, 'ari', '2020-12-13T21:10:52.552Z', 65.765, '2a00:1450:4001:81d::2004', 'GET', 'google.com', 200, '', '50.1188', '8.6843', '', '', '', '', '', '', '', 'text/javascript; charset=UTF-8', 'public, max-age=31536000', '', 'Fri, 11 Dec 2020 22:43:34 GMT', '167239', 'Fri, 11 Dec 2020 03:15:47 GMT', ''),
(15, 3, 'ari', '2020-12-13T21:10:52.570Z', 104.903, '2a00:1450:4001:81d::2004', 'GET', 'google.com', 200, '', '50.1188', '8.6843', '', '', '', '', '', '', '', 'image/png', 'private, max-age=31536000', '', 'Sun, 13 Dec 2020 21:10:53 GMT', '', 'Tue, 22 Oct 2019 18:30:00 GMT', ''),
(15, 4, 'ari', '2020-12-13T21:10:52.570Z', 0.304, '2a00:1450:4001:81d::2004', 'GET', 'google.com', 200, '', '50.1188', '8.6843', '', '', '', '', '', '', '', 'image/png', 'public, max-age=31536000', '', 'Sat, 11 Dec 2021 15:55:41 GMT', '27853', 'Fri, 27 Sep 2019 01:00:00 GMT', ''),
(15, 5, 'ari', '2020-12-13T21:10:52.592Z', 0.695, '2a00:1450:4001:80b::2003', 'GET', 'gstatic.com', 200, '', '50.1188', '8.6843', '', '', '', '', '', '', '', 'image/png', 'public, max-age=31536000', '', 'Sat, 11 Dec 2021 19:38:27 GMT', '14487', 'Tue, 03 Mar 2020 20:15:00 GMT', ''),
(15, 6, 'ari', '2020-12-13T21:10:52.592Z', 0.492, '2a00:1450:4001:81d::2004', 'GET', 'google.com', 200, '', '50.1188', '8.6843', '', '', '', '', '', '', '', 'image/webp', 'private, max-age=31536000', '', 'Fri, 11 Dec 2020 23:39:54 GMT', '', 'Mon, 20 May 2019 18:00:00 GMT', ''),
(15, 7, 'ari', '2020-12-13T21:10:52.614Z', 69.540, '2a00:1450:4001:80b::2003', 'GET', 'gstatic.com', 200, '', '50.1188', '8.6843', '', '', '', '', '', '', '', 'text/javascript; charset=UTF-8', 'public, max-age=31536000', '', 'Thu, 09 Dec 2021 13:31:00 GMT', '373193', 'Mon, 07 Dec 2020 10:57:48 GMT', ''),
(15, 8, 'ari', '2020-12-13T21:10:52.615Z', 0.437, '2a00:1450:4001:80b::2003', 'GET', 'gstatic.com', 200, '', '50.1188', '8.6843', '', '', '', '', '', '', '', 'text/css; charset=UTF-8', 'public, max-age=31536000', '', 'Thu, 09 Dec 2021 13:30:59 GMT', '209336', 'Tue, 08 Dec 2020 02:46:23 GMT', ''),
(15, 9, 'ari', '2020-12-13T21:10:52.700Z', 75.424, '2a00:1450:4001:81d::2004', 'POST', 'google.com', 204, '', '50.1188', '8.6843', 'text/plain;charset=UTF-8', '', '', '', '', '', '', 'text/html; charset=UTF-8', '', '', '', '', '', ''),
(15, 10, 'ari', '2020-12-13T21:10:52.827Z', 98.906, '2a00:1450:4001:81d::2004', 'GET', 'google.com', 200, '', '50.1188', '8.6843', '', '', '', '', '', '', '', 'application/json; charset=UTF-8', 'private, max-age=3600', '', 'Sun, 13 Dec 2020 21:10:53 GMT', '', '', ''),
(15, 11, 'ari', '2020-12-13T21:10:52.831Z', 81.234, '2a00:1450:4001:81d::2004', 'GET', 'google.com', 200, '', '50.1188', '8.6843', '', '', '', '', '', '', '', 'text/javascript; charset=UTF-8', 'public, max-age=31536000', '', 'Fri, 11 Dec 2020 22:49:21 GMT', '166892', 'Fri, 11 Dec 2020 03:15:47 GMT', ''),
(15, 12, 'ari', '2020-12-13T21:10:52.833Z', 94.169, '2a00:1450:4001:81d::2004', 'GET', 'google.com', 204, '', '50.1188', '8.6843', '', '', '', '', '', '', '', 'text/html; charset=UTF-8', '', '', '', '', '', ''),
(15, 13, 'ari', '2020-12-13T21:10:52.867Z', 0.465, '2a00:1450:4001:800::200e', 'GET', 'apis.google.com', 200, '', '50.1188', '8.6843', '', '', '', '', '', '', '', 'text/javascript; charset=UTF-8', 'public, max-age=31536000', '', 'Sat, 11 Dec 2021 18:22:44 GMT', '18126', 'Tue, 01 Dec 2020 17:37:31 GMT', ''),
(15, 14, 'ari', '2020-12-13T21:10:52.873Z', 107.088, '2a00:1450:4001:803::200e', 'GET', 'ogs.google.com', 200, '', '50.1188', '8.6843', '', '', '', '', '', '', '', 'text/html; charset=utf-8', 'private, max-age=259200', '', 'Sun, 13 Dec 2020 21:10:53 GMT', '', '', ''),
(15, 15, 'ari', '2020-12-13T21:10:52.943Z', 75.118, '2a00:1450:4001:81d::2004', 'GET', 'google.com', 200, '', '50.1188', '8.6843', '', '', '', '', '', '', '', 'text/javascript; charset=UTF-8', 'public, max-age=31536000', '', 'Fri, 11 Dec 2020 22:49:22 GMT', '166891', 'Fri, 11 Dec 2020 03:15:47 GMT', ''),
(15, 16, 'ari', '2020-12-13T21:10:53.027Z', 67.793, '2a00:1450:4001:81d::2004', 'GET', 'google.com', 200, '', '50.1188', '8.6843', '', '', '', '', '', '', '', 'text/javascript; charset=UTF-8', 'public, max-age=31536000', '', 'Fri, 11 Dec 2020 22:49:22 GMT', '166891', 'Fri, 11 Dec 2020 03:15:47 GMT', ''),
(15, 17, 'ari', '2020-12-13T21:10:53.105Z', 68.293, '2a00:1450:4001:81d::2004', 'POST', 'google.com', 204, '', '50.1188', '8.6843', 'text/plain;charset=UTF-8', '', '', '', '', '', '', 'text/html; charset=UTF-8', '', '', '', '', '', ''),
(15, 18, 'ari', '2020-12-13T21:10:53.106Z', 92.673, '2a00:1450:4001:820::2002', 'GET', 'adservice.google.com', 204, '', '50.1188', '8.6843', '', '', '', '', '', '', '', 'text/html; charset=UTF-8', 'private, max-age=15', '', '', '', '', ''),
(15, 19, 'ari', '2020-12-13T21:10:53.108Z', 91.547, '2a00:1450:4001:81d::2004', 'GET', 'google.com', 200, '', '50.1188', '8.6843', '', '', '', '', '', '', '', 'application/json; charset=UTF-8', 'public, max-age=3600', '', '', '', '', ''),
(15, 20, 'ari', '2020-12-13T21:10:55.626Z', 141.870, '2a00:1450:4001:81d::2004', 'POST', 'google.com', 204, '', '50.1188', '8.6843', 'text/plain;charset=UTF-8', '', '', '', '', '', '', 'text/html; charset=UTF-8', '', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `i_providers`
--

DROP TABLE IF EXISTS `i_providers`;
CREATE TABLE IF NOT EXISTS `i_providers` (
  `har_id` int(11) NOT NULL,
  `usr_name` varchar(20) NOT NULL,
  `provider` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`har_id`),
  KEY `usr_name_i_providers` (`usr_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `i_providers`
--

INSERT INTO `i_providers` (`har_id`, `usr_name`, `provider`) VALUES
(8, 'ari', 'Ote SA (Hellenic Telecommunications Organisation)'),
(9, 'aspa', 'Ote SA (Hellenic Telecommunications Organisation)'),
(10, 'john', 'Ote SA (Hellenic Telecommunications Organisation)'),
(11, 'shawn', 'Ote SA (Hellenic Telecommunications Organisation)'),
(12, 'shawn', 'Ote SA (Hellenic Telecommunications Organisation)'),
(13, 'ceid', 'Ote SA (Hellenic Telecommunications Organisation)'),
(14, 'ceid', 'Ote SA (Hellenic Telecommunications Organisation)'),
(15, 'ari', 'Ote SA (Hellenic Telecommunications Organisation)');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `email` varchar(50) NOT NULL,
  `username` varchar(20) NOT NULL,
  `pwd` varchar(50) NOT NULL,
  `first_name` varchar(20) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `gender` enum('Female','Male','Non-binary') DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  PRIMARY KEY (`email`,`username`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`email`, `username`, `pwd`, `first_name`, `last_name`, `gender`, `date_of_birth`) VALUES
('ari@mail.com', 'ari', 'Ariadni#10', 'Ari', 'Mach', 'Female', '2001-09-01'),
('aspa@hotmail.com', 'aspa', 'Aspasi@15', 'Aspasia', 'Kou', 'Female', '1999-05-15'),
('ceid@ceid.upatras.gr', 'ceid', 'Ce!d$90%', 'Ceid', 'Junior', 'Non-binary', '1990-09-23'),
('john@hotmail.com', 'john', 'Johnsmith&4', 'John', 'Smith', 'Male', '1996-04-01'),
('shawn@hotmail.com', 'shawn', 'iWonder!123', 'Shawn', 'Mendes', 'Male', '1998-08-08');

-- --------------------------------------------------------

--
-- Table structure for table `users_hars`
--

DROP TABLE IF EXISTS `users_hars`;
CREATE TABLE IF NOT EXISTS `users_hars` (
  `har_id` int(11) NOT NULL,
  `usr_name` varchar(20) NOT NULL,
  `date_time` datetime NOT NULL,
  PRIMARY KEY (`har_id`),
  KEY `usr_name_users_hars` (`usr_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users_hars`
--

INSERT INTO `users_hars` (`har_id`, `usr_name`, `date_time`) VALUES
(8, 'ari', '2021-09-12 14:03:40'),
(9, 'aspa', '2021-09-12 18:31:54'),
(10, 'john', '2021-09-12 18:35:35'),
(11, 'shawn', '2021-09-12 18:41:07'),
(12, 'shawn', '2021-09-12 18:41:24'),
(13, 'ceid', '2021-09-12 18:45:14'),
(14, 'ceid', '2021-09-12 18:46:22'),
(15, 'ari', '2021-09-12 19:36:33');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

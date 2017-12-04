-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Máy chủ: localhost
-- Thời gian đã tạo: Th10 29, 2017 lúc 05:37 AM
-- Phiên bản máy phục vụ: 10.1.26-MariaDB
-- Phiên bản PHP: 7.1.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `quizlab`
--
CREATE DATABASE IF NOT EXISTS `quizlab` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `quizlab`;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `account`
--

DROP TABLE IF EXISTS `account`;
CREATE TABLE IF NOT EXISTS `account` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fullname` varchar(256) NOT NULL,
  `email` varchar(256) NOT NULL,
  `password` varchar(256) NOT NULL,
  `avatar` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `account`
--

-- INSERT INTO `account` (`id`, `fullname`, `email`, `password`, `avatar`) VALUES
-- (1, 'Vũ Duy Tiến', 'vuduytien@gmail.com', '123456789', NULL),
-- (2, 'Nguyễn Minh Trung', 'nguyenminhtrung@gmail.com', '123456789', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `answer`
--

DROP TABLE IF EXISTS `answer`;
CREATE TABLE IF NOT EXISTS `answer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` text NOT NULL,
  `isRight` tinyint(1) DEFAULT '0',
  `question` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk__answer__question__question__id` (`question`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `answer`
--

-- INSERT INTO `answer` (`id`, `content`, `isRight`, `question`) VALUES
-- (3, 'Đáp án A', 0, 3),
-- (4, 'Đáp án B', 1, 3),
-- (5, '4 cạnh', 1, 7),
-- (6, '5 cạnh', 0, 7),
-- (7, '2 cạnh', 0, 7),
-- (8, '3 cạnh', 0, 7),
-- (9, 'Tam giác có 2 cạnh', 0, 8),
-- (10, 'Hình tam giác có 10 cạnh', 0, 8),
-- (11, 'Tam giác có 4 cạnh', 0, 8),
-- (12, 'Tam giác có 3 cạnh', 1, 8);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `exam`
--

DROP TABLE IF EXISTS `exam`;
CREATE TABLE IF NOT EXISTS `exam` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(256) NOT NULL,
  `description` text,
  `topic` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk__topic__topic__id` (`topic`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `exam`
--

-- INSERT INTO `exam` (`id`, `name`, `description`, `topic`) VALUES
-- (1, 'hóa', 'đề thi cuối kì hóa', 1),
-- (2, 'sinh', 'đề thi cuối kì sinh', 2);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `exam_question`
--

DROP TABLE IF EXISTS `exam_question`;
CREATE TABLE IF NOT EXISTS `exam_question` (
  `id_exam` int(11) NOT NULL,
  `id_question` int(11) NOT NULL,
  PRIMARY KEY (`id_exam`,`id_question`),
  KEY `fk__exam_question__id_question__question__id` (`id_question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `exam_question`
--

-- INSERT INTO `exam_question` (`id_exam`, `id_question`) VALUES
-- (1, 2),
-- (2, 3);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `question`
--

DROP TABLE IF EXISTS `question`;
CREATE TABLE IF NOT EXISTS `question` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` text NOT NULL,
  `topic` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk__question__topic__topic__id` (`topic`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `question`
--

-- INSERT INTO `question` (`id`, `content`, `topic`) VALUES
-- (2, 'Đây là câu hỏi 2', 1),
-- (3, 'Đây là câu hỏi sinh 1', 2),
-- (5, 'Câu hỏi dễ nhất là gì?', 4),
-- (6, 'Câu hỏi khó nhất là gì?', 4),
-- (7, 'Hình vuông có mấy cạnh?', 3),
-- (8, 'Hình tam giác có mấy cạnh?', 3);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `topic`
--

DROP TABLE IF EXISTS `topic`;
CREATE TABLE IF NOT EXISTS `topic` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(256) NOT NULL,
  `description` text,
  `account` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk__topic__account__account__id` (`account`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `topic`
--

-- INSERT INTO `topic` (`id`, `name`, `description`, `account`) VALUES
-- (1, 'hóa học', 'Không có mô tả', 1),
-- (2, 'sinh học', 'không có mô tả', 2),
-- (3, 'Toán', 'Chủ đề toán', 2),
-- (4, 'Tin học', 'Chủ đề tin học', 2);

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `answer`
--
ALTER TABLE `answer`
  ADD CONSTRAINT `fk__answer__question__question__id` FOREIGN KEY (`question`) REFERENCES `question` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `exam`
--
ALTER TABLE `exam`
  ADD CONSTRAINT `fk__topic__topic__id` FOREIGN KEY (`topic`) REFERENCES `topic` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `exam_question`
--
ALTER TABLE `exam_question`
  ADD CONSTRAINT `fk__exam_question__id_exam__exam__id` FOREIGN KEY (`id_exam`) REFERENCES `exam` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk__exam_question__id_question__question__id` FOREIGN KEY (`id_question`) REFERENCES `question` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `question`
--
ALTER TABLE `question`
  ADD CONSTRAINT `fk__question__topic__topic__id` FOREIGN KEY (`topic`) REFERENCES `topic` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `topic`
--
ALTER TABLE `topic`
  ADD CONSTRAINT `fk__topic__account__account__id` FOREIGN KEY (`account`) REFERENCES `account` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

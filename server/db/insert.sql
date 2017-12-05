INSERT INTO `account` (`id`, `fullname`, `email`, `password`) VALUES
(1, 'Vũ Duy Tiến', 'vuduytien@gmail.com', '123456789'),
(2, 'Nguyễn Minh Trung', 'nguyenminhtrung@gmail.com', '123456789'),
(3, 'Đinh Bảo Lộc', 'dinhbaoloc@gmail.com', '123456789'),
(4, 'Hà Ngọc Kha', 'hangockha@gmail.com', '123456789');

INSERT INTO `topic` (`id`, `name`, `description`, `account`) VALUES
(1, 'Tiếng anh', 'chủ đề tiếng anh', 2),
(2, 'Sinh học', 'chủ đề sinh học', 2),
(3, 'Toán', 'Chủ đề toán', 2),
(4, 'Tin học', 'Chủ đề tin học', 2),
(5, 'Địa lý', 'Chủ đề địa lý', 2),
(6, 'Vật lý', 'Chủ đề vật lý', 2),
(7, 'Lịch sử', 'Chủ đề lịch sử', 2),
(8, 'Văn học', 'Chủ đề văn học', 2),
(9, 'Công nghệ', 'Chủ đề công nghệ', 2),
(10, 'Giáo dục công dân', 'Chủ đề giáo dục công dân', 2),

(11, 'Tiếng anh 2', 'chủ đề tiếng anh 2', 2),
(12, 'Sinh học', 'chủ đề sinh học 2', 2),
(13, 'Toán 2', 'Chủ đề toán 2', 2),
(14, 'Tin học 2', 'Chủ đề tin học 2', 2),
(15, 'Địa lý 2', 'Chủ đề địa lý 2', 2),
(16, 'Vật lý 2', 'Chủ đề vật lý 2', 2),
(17, 'Lịch sử 2', 'Chủ đề lịch sử 2', 2),
(18, 'Văn học 2', 'Chủ đề văn học 2', 2),
(19, 'Công nghệ 2', 'Chủ đề công nghệ 2', 2),
(20, 'Giáo dục công dân 2', 'Chủ đề giáo dục công dân 2', 2),

(21, 'Tiếng anh 3', 'chủ đề tiếng anh 3', 2),
(22, 'Sinh học', 'chủ đề sinh học 3', 2),
(23, 'Toán 3', 'Chủ đề toán 3', 2),
(24, 'Tin học 3', 'Chủ đề tin học 3', 2),
(25, 'Địa lý 3', 'Chủ đề địa lý 3', 2),
(26, 'Vật lý 3', 'Chủ đề vật lý 3', 2),
(27, 'Lịch sử 3', 'Chủ đề lịch sử 3', 2),
(28, 'Văn học 3', 'Chủ đề văn học 3', 2),
(29, 'Công nghệ 3', 'Chủ đề công nghệ 3', 2),
(30, 'Giáo dục công dân 3', 'Chủ đề giáo dục công dân 3', 2),

(31, 'Tiếng anh 4', 'chủ đề tiếng anh 4', 2),
(32, 'Sinh học', 'chủ đề sinh học 4', 2),
(33, 'Toán 4', 'Chủ đề toán 4', 2),
(34, 'Tin học 4', 'Chủ đề tin học 4', 2),
(35, 'Địa lý 4', 'Chủ đề địa lý 4', 2),
(36, 'Vật lý 4', 'Chủ đề vật lý 4', 2),
(37, 'Lịch sử 4', 'Chủ đề lịch sử 4', 2),
(38, 'Văn học 4', 'Chủ đề văn học 4', 2),
(39, 'Công nghệ 4', 'Chủ đề công nghệ 4', 2),
(40, 'Giáo dục công dân 4', 'Chủ đề giáo dục công dân 4', 2);

INSERT INTO `question` (`id`, `content`, `topic`) VALUES
(1, 'Is Susan ........... home?', 1),
(2, 'What ............ now?', 1),
(3, 'They always go to school ............. bicycle.', 1),
(4, 'What color ........... his new car?', 1),
(5, 'You should do your ................. before going to class.', 1),
(6, 'Mr. Pike ............ us English.', 1),
(7, 'Tom and ............. are going to the birthday party together.', 1),
(8, 'Our English lessons are ............... long.', 1),
(9, 'Bangkok is ............ capital of Thailand.', 1),
(10, 'Are you free ............ Saturday?', 1),
(11, 'Is Susan ........... home?', 1),
(12, 'What ............ now?', 1),
(13, 'They always go to school ............. bicycle.', 1),
(14, 'What color ........... his new car?', 1),
(15, 'You should do your ................. before going to class.', 1),
(16, 'Mr. Pike ............ us English.', 1),
(17, 'Tom and ............. are going to the birthday party together.', 1),
(18, 'Our English lessons are ............... long.', 1),
(19, 'Bangkok is ............ capital of Thailand.', 1),
(20, 'Are you free ............ Saturday?', 1),
(21, 'Is Susan ........... home?', 1),
(22, 'What ............ now?', 1),
(23, 'They always go to school ............. bicycle.', 1),
(24, 'What color ........... his new car?', 1),
(25, 'You should do your ................. before going to class.', 1),
(26, 'Mr. Pike ............ us English.', 1),
(27, 'Tom and ............. are going to the birthday party together.', 1),
(28, 'Our English lessons are ............... long.', 1),
(29, 'Bangkok is ............ capital of Thailand.', 1),
(30, 'Are you free ............ Saturday?', 1),
(31, 'Is Susan ........... home?', 1),
(32, 'What ............ now?', 1),
(33, 'They always go to school ............. bicycle.', 1),
(34, 'What color ........... his new car?', 1),
(35, 'You should do your ................. before going to class.', 1),
(36, 'Mr. Pike ............ us English.', 1),
(37, 'Tom and ............. are going to the birthday party together.', 1),
(38, 'Our English lessons are ............... long.', 1),
(39, 'Bangkok is ............ capital of Thailand.', 1),
(40, 'Are you free ............ Saturday?', 1),
(41, 'Is Susan ........... home?', 1),
(42, 'What ............ now?', 1),
(43, 'They always go to school ............. bicycle.', 1),
(44, 'What color ........... his new car?', 1),
(45, 'You should do your ................. before going to class.', 1),
(46, 'Mr. Pike ............ us English.', 1),
(47, 'Tom and ............. are going to the birthday party together.', 1),
(48, 'Our English lessons are ............... long.', 1),
(49, 'Bangkok is ............ capital of Thailand.', 1),
(50, 'Are you free ............ Saturday?', 1),
(51, 'Is Susan ........... home?', 1),
(52, 'What ............ now?', 1),
(53, 'They always go to school ............. bicycle.', 1),
(54, 'What color ........... his new car?', 1),
(55, 'You should do your ................. before going to class.', 1),
(56, 'Mr. Pike ............ us English.', 1),
(57, 'Tom and ............. are going to the birthday party together.', 1),
(58, 'Our English lessons are ............... long.', 1),
(59, 'Bangkok is ............ capital of Thailand.', 1),
(60, 'Are you free ............ Saturday?', 1);

INSERT INTO `answer` (`id`, `content`, `isRight`, `question`) VALUES
(1, 'in', 0, 1),
(2, 'at', 1, 1),
(3, 'on', 0, 1),
(4, 'under', 0, 1),
(5, 'is the time', 1, 2),
(6, 'does the time', 0, 2),
(7, 'is time', 0, 2),
(8, 'is it', 0, 2),
(9, 'with', 0, 3),
(10, 'in', 0, 3),
(11, 'on', 0, 3),
(12, 'by', 1, 3),
(13, 'have', 0, 4),
(14, 'is', 1, 4),
(15, 'does', 0, 4),
(16, 'are', 0, 4),
(17, 'home work', 0, 5),
(18, 'homework', 1, 5),
(19, 'homeworks', 0, 5),
(20, 'housework', 0, 5),
(21, 'teach', 0, 6),
(22, 'teaches', 1, 6),
(23, 'teaching', 0, 6),
(24, 'to teach', 0, 6),
(25, 'I', 1, 7),
(26, 'me', 0, 7),
(27, 'my', 0, 7),
(28, 'mine', 0, 7),
(29, 'many', 0, 8),
(30, 'much', 0, 8),
(31, 'a lot of', 0, 8),
(32, 'very', 1, 8),
(33, 'a', 0, 9),
(34, 'one', 0, 9),
(35, 'the', 1, 9),
(36, 'an', 0, 9),
(37, 'on', 1, 10),
(38, 'at', 0, 10),
(39, 'in', 0, 10),
(40, 'into', 0, 10),

(41, 'in', 0, 11),
(42, 'at', 1, 11),
(43, 'on', 0, 11),
(44, 'under', 0, 11),
(45, 'is the time', 1, 12),
(46, 'does the time', 0, 12),
(47, 'is time', 0, 12),
(48, 'is it', 0, 12),
(49, 'with', 0, 13),
(50, 'in', 0, 13),
(51, 'on', 0, 13),
(52, 'by', 1, 13),
(53, 'have', 0, 14),
(54, 'is', 1, 14),
(55, 'does', 0, 14),
(56, 'are', 0, 14),
(57, 'home work', 0, 15),
(58, 'homework', 1, 15),
(59, 'homeworks', 0, 15),
(60, 'housework', 0, 15),
(61, 'teach', 0, 16),
(62, 'teaches', 1, 16),
(63, 'teaching', 0, 16),
(64, 'to teach', 0, 16),
(65, 'I', 1, 17),
(66, 'me', 0, 17),
(67, 'my', 0, 17),
(68, 'mine', 0, 17),
(69, 'many', 0, 18),
(70, 'much', 0, 18),
(71, 'a lot of', 0, 18),
(72, 'very', 1, 18),
(73, 'a', 0, 19),
(74, 'one', 0, 19),
(75, 'the', 1, 19),
(76, 'an', 0, 19),
(77, 'on', 1, 20),
(78, 'at', 0, 20),
(79, 'in', 0, 20),
(80, 'into', 0, 20),

(81, 'in', 0, 21),
(82, 'at', 1, 21),
(83, 'on', 0, 21),
(84, 'under', 0, 21),
(85, 'is the time', 1, 22),
(86, 'does the time', 0, 22),
(87, 'is time', 0, 22),
(88, 'is it', 0, 22),
(89, 'with', 0, 23),
(90, 'in', 0, 23),
(91, 'on', 0, 23),
(92, 'by', 1, 23),
(93, 'have', 0, 24),
(94, 'is', 1, 24),
(95, 'does', 0, 24),
(96, 'are', 0, 24),
(97, 'home work', 0, 25),
(98, 'homework', 1, 25),
(99, 'homeworks', 0, 25),
(100, 'housework', 0, 25),
(101, 'teach', 0, 26),
(102, 'teaches', 1, 26),
(103, 'teaching', 0, 26),
(104, 'to teach', 0, 26),
(105, 'I', 1, 27),
(106, 'me', 0, 27),
(107, 'my', 0, 27),
(108, 'mine', 0, 27),
(109, 'many', 0, 28),
(110, 'much', 0, 28),
(111, 'a lot of', 0, 28),
(112, 'very', 1, 28),
(113, 'a', 0, 29),
(114, 'one', 0, 29),
(115, 'the', 1, 29),
(116, 'an', 0, 29),
(117, 'on', 1, 30),
(118, 'at', 0, 30),
(119, 'in', 0, 30),
(120, 'into', 0, 30),

(121, 'in', 0, 31),
(122, 'at', 1, 31),
(123, 'on', 0, 31),
(124, 'under', 0, 31),
(125, 'is the time', 1, 32),
(126, 'does the time', 0, 32),
(127, 'is time', 0, 32),
(128, 'is it', 0, 32),
(129, 'with', 0, 33),
(130, 'in', 0, 33),
(131, 'on', 0, 33),
(132, 'by', 1, 33),
(133, 'have', 0, 34),
(134, 'is', 1, 34),
(135, 'does', 0, 34),
(136, 'are', 0, 34),
(137, 'home work', 0, 35),
(138, 'homework', 1, 35),
(139, 'homeworks', 0, 35),
(140, 'housework', 0, 35),
(141, 'teach', 0, 36),
(142, 'teaches', 1, 36),
(143, 'teaching', 0, 36),
(144, 'to teach', 0, 36),
(145, 'I', 1, 37),
(146, 'me', 0, 37),
(147, 'my', 0, 37),
(148, 'mine', 0, 37),
(149, 'many', 0, 38),
(150, 'much', 0, 38),
(151, 'a lot of', 0, 38),
(152, 'very', 1, 38),
(153, 'a', 0, 39),
(154, 'one', 0, 39),
(155, 'the', 1, 39),
(156, 'an', 0, 39),
(157, 'on', 1, 40),
(158, 'at', 0, 40),
(159, 'in', 0, 40),
(160, 'into', 0, 40),

(161, 'in', 0, 41),
(162, 'at', 1, 41),
(163, 'on', 0, 41),
(164, 'under', 0, 41),
(165, 'is the time', 1, 42),
(166, 'does the time', 0, 42),
(167, 'is time', 0, 42),
(168, 'is it', 0, 42),
(169, 'with', 0, 43),
(170, 'in', 0, 43),
(171, 'on', 0, 43),
(172, 'by', 1, 43),
(173, 'have', 0, 44),
(174, 'is', 1, 44),
(175, 'does', 0, 44),
(176, 'are', 0, 44),
(177, 'home work', 0, 45),
(178, 'homework', 1, 45),
(179, 'homeworks', 0, 45),
(180, 'housework', 0, 45),
(181, 'teach', 0, 46),
(182, 'teaches', 1, 46),
(183, 'teaching', 0, 46),
(184, 'to teach', 0, 46),
(185, 'I', 1, 47),
(186, 'me', 0, 47),
(187, 'my', 0, 47),
(188, 'mine', 0, 47),
(189, 'many', 0, 48),
(190, 'much', 0, 48),
(191, 'a lot of', 0, 48),
(192, 'very', 1, 48),
(193, 'a', 0, 49),
(194, 'one', 0, 49),
(195, 'the', 1, 49),
(196, 'an', 0, 49),
(197, 'on', 1, 50),
(198, 'at', 0, 50),
(199, 'in', 0, 50),
(200, 'into', 0, 50),

(201, 'in', 0, 51),
(202, 'at', 1, 51),
(203, 'on', 0, 51),
(204, 'under', 0, 51),
(205, 'is the time', 1, 52),
(206, 'does the time', 0, 52),
(207, 'is time', 0, 52),
(208, 'is it', 0, 52),
(209, 'with', 0, 53),
(210, 'in', 0, 53),
(211, 'on', 0, 53),
(212, 'by', 1, 53),
(213, 'have', 0, 54),
(214, 'is', 1, 54),
(215, 'does', 0, 54),
(216, 'are', 0, 54),
(217, 'home work', 0, 55),
(218, 'homework', 1, 55),
(219, 'homeworks', 0, 55),
(220, 'housework', 0, 55),
(221, 'teach', 0, 56),
(222, 'teaches', 1, 56),
(223, 'teaching', 0, 56),
(224, 'to teach', 0, 56),
(225, 'I', 1, 57),
(226, 'me', 0, 57),
(227, 'my', 0, 57),
(228, 'mine', 0, 57),
(229, 'many', 0, 58),
(230, 'much', 0, 58),
(231, 'a lot of', 0, 58),
(232, 'very', 1, 58),
(233, 'a', 0, 59),
(234, 'one', 0, 59),
(235, 'the', 1, 59),
(236, 'an', 0, 59),
(237, 'on', 1, 60),
(238, 'at', 0, 60),
(239, 'in', 0, 60),
(240, 'into', 0, 60);


INSERT INTO `exam` (`id`, `name`, `description`, `topic`) VALUES
(1, 'ck anh', 'đề thi cuối kì tiếng anh', 1),
(2, 'gk anh', 'đề thi giữa kì tiếng anh', 1),
(3, '1t anh', 'đề thi 1 tiết tiếng anh', 1),

(4, '15p anh 1', 'đề thi 15 phút tiếng anh lần 1', 1),
(5, '15p anh 2', 'đề thi 15 phút tiếng anh lần 2', 1),
(6, '15p anh 3', 'đề thi 15 phút tiếng anh lần 3', 1),
(7, '15p anh 4', 'đề thi 15 phút tiếng anh lần 4', 1),
(8, '15p anh 5', 'đề thi 15 phút tiếng anh lần 5', 1),
(9, '15p anh 6', 'đề thi 15 phút tiếng anh lần 6', 1),
(10, '15p anh 7', 'đề thi 15 phút tiếng anh lần 7', 1),
(11, '15p anh 8', 'đề thi 15 phút tiếng anh lần 8', 1),
(12, '15p anh 9', 'đề thi 15 phút tiếng anh lần 9', 1),
(13, '15p anh 10', 'đề thi 15 phút tiếng anh lần 10', 1),

(14, '15p anh 11', 'đề thi 15 phút tiếng anh lần 11', 1),
(15, '15p anh 12', 'đề thi 15 phút tiếng anh lần 12', 1),
(16, '15p anh 13', 'đề thi 15 phút tiếng anh lần 13', 1),
(17, '15p anh 14', 'đề thi 15 phút tiếng anh lần 14', 1),
(18, '15p anh 15', 'đề thi 15 phút tiếng anh lần 15', 1),
(19, '15p anh 16', 'đề thi 15 phút tiếng anh lần 16', 1),
(20, '15p anh 17', 'đề thi 15 phút tiếng anh lần 17', 1),
(21, '15p anh 18', 'đề thi 15 phút tiếng anh lần 18', 1),
(22, '15p anh 19', 'đề thi 15 phút tiếng anh lần 19', 1),
(23, '15p anh 20', 'đề thi 15 phút tiếng anh lần 20', 1),

(24, '15p anh 21', 'đề thi 15 phút tiếng anh lần 21', 1),
(25, '15p anh 22', 'đề thi 15 phút tiếng anh lần 22', 1),
(26, '15p anh 23', 'đề thi 15 phút tiếng anh lần 23', 1),
(27, '15p anh 24', 'đề thi 15 phút tiếng anh lần 24', 1),
(28, '15p anh 25', 'đề thi 15 phút tiếng anh lần 25', 1),
(29, '15p anh 26', 'đề thi 15 phút tiếng anh lần 26', 1),
(30, '15p anh 27', 'đề thi 15 phút tiếng anh lần 27', 1),
(31, '15p anh 28', 'đề thi 15 phút tiếng anh lần 28', 1),
(32, '15p anh 29', 'đề thi 15 phút tiếng anh lần 29', 1),
(33, '15p anh 30', 'đề thi 15 phút tiếng anh lần 30', 1),

(34, '15p anh 31', 'đề thi 15 phút tiếng anh lần 31', 1),
(35, '15p anh 32', 'đề thi 15 phút tiếng anh lần 32', 1),
(36, '15p anh 33', 'đề thi 15 phút tiếng anh lần 33', 1),
(37, '15p anh 34', 'đề thi 15 phút tiếng anh lần 34', 1),
(38, '15p anh 35', 'đề thi 15 phút tiếng anh lần 35', 1),
(39, '15p anh 36', 'đề thi 15 phút tiếng anh lần 36', 1),
(40, '15p anh 37', 'đề thi 15 phút tiếng anh lần 37', 1),
(41, '15p anh 38', 'đề thi 15 phút tiếng anh lần 38', 1),
(42, '15p anh 39', 'đề thi 15 phút tiếng anh lần 39', 1),
(43, '15p anh 40', 'đề thi 15 phút tiếng anh lần 40', 1);

INSERT INTO `exam_question` (`id_exam`, `id_question`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 5),
(1, 6),
(1, 7),
(1, 8),
(1, 9),
(1, 10),

(1, 11),
(1, 12),
(1, 13),
(1, 14),
(1, 15),
(1, 16),
(1, 17),
(1, 18),
(1, 19),
(1, 20),

(1, 21),
(1, 22),
(1, 23),
(1, 24),
(1, 25),
(1, 26),
(1, 27),
(1, 28),
(1, 29),
(1, 30),

(1, 31),
(1, 32),
(1, 33),
(1, 34),
(1, 35),
(1, 36),
(1, 37),
(1, 38),
(1, 39),
(1, 40),

(1, 41),
(1, 42),
(1, 43),
(1, 44),
(1, 45),
(1, 46),
(1, 47),
(1, 48),
(1, 49),
(1, 50),

(1, 51),
(1, 52),
(1, 53),
(1, 54),
(1, 55),
(1, 56),
(1, 57),
(1, 58),
(1, 59),
(1, 60);

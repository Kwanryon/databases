-- phpMyAdmin SQL Dump
-- version 5.2.1deb3
-- https://www.phpmyadmin.net/
--
-- Хост: localhost:3306
-- Время создания: Ноя 08 2025 г., 17:11
-- Версия сервера: 8.0.43-0ubuntu0.24.04.2
-- Версия PHP: 8.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `contest`
--

-- --------------------------------------------------------

--
-- Структура таблицы `contests`
--

CREATE TABLE `contests` (
  `id` int NOT NULL,
  `name` varchar(200) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `contests`
--

INSERT INTO `contests` (`id`, `name`, `date`) VALUES
(1, 'Hackathon', '2025-09-17'),
(2, 'CTF', '2025-09-25'),
(3, 'WEB-Design', '2025-09-30');

-- --------------------------------------------------------

--
-- Структура таблицы `criteria`
--

CREATE TABLE `criteria` (
  `id` int NOT NULL,
  `contest_id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `max_score` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `criteria`
--

INSERT INTO `criteria` (`id`, `contest_id`, `name`, `max_score`) VALUES
(1, 1, 'Оригинальность', 10),
(2, 1, 'Техническая идея', 15),
(3, 1, 'Воплощение', 20),
(4, 2, 'Скорость решения', 20),
(5, 2, 'Чистота кода', 15),
(6, 2, 'Креативность', 10),
(7, 3, 'Визуальный стиль', 10),
(8, 3, 'Юзабилити', 15),
(9, 3, 'Функциональность', 20);

-- --------------------------------------------------------

--
-- Структура таблицы `jury`
--

CREATE TABLE `jury` (
  `id` int NOT NULL,
  `person_id` int NOT NULL,
  `contest_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `jury`
--

INSERT INTO `jury` (`id`, `person_id`, `contest_id`) VALUES
(1, 3, 1),
(2, 7, 1),
(3, 8, 1),
(4, 9, 2),
(5, 10, 2),
(6, 11, 2),
(7, 12, 3),
(8, 13, 3),
(9, 15, 3);

-- --------------------------------------------------------

--
-- Структура таблицы `participant`
--

CREATE TABLE `participant` (
  `id` int NOT NULL,
  `person_id` int NOT NULL,
  `contest_id` int NOT NULL,
  `contest_work` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `participant`
--

INSERT INTO `participant` (`id`, `person_id`, `contest_id`, `contest_work`) VALUES
(1, 1, 1, 'Проект A'),
(2, 2, 1, 'Проект B'),
(3, 4, 1, 'Проект C'),
(4, 5, 2, 'Решение задачи X'),
(5, 6, 2, 'Решение задачи Y'),
(6, 14, 2, 'Решение задачи Z'),
(7, 16, 3, 'Дизайн сайта Z'),
(8, 17, 3, 'Новый дизайн'),
(9, 18, 3, 'Дизайн проекта Q');

-- --------------------------------------------------------

--
-- Структура таблицы `person`
--

CREATE TABLE `person` (
  `id` int NOT NULL,
  `fullname` varchar(200) NOT NULL,
  `dateofbirth` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `person`
--

INSERT INTO `person` (`id`, `fullname`, `dateofbirth`) VALUES
(1, 'Иван Петров', '1995-04-12'),
(2, 'Мария Сидорова', '1996-08-03'),
(3, 'Алексей Смирнов', '1988-11-22'),
(4, 'Ольга Иванова', '1990-07-15'),
(5, 'Дмитрий Кузнецов', '1993-02-28'),
(6, 'Светлана Орлова', '1985-05-30'),
(7, 'Алексей Иванов', '1985-04-15'),
(8, 'Елена Смирнова', '1996-11-03'),
(9, 'Марина Попова', '2000-01-10'),
(10, 'Олег Лебедев', '1995-05-29'),
(11, 'Дарья Новикова', '1999-07-07'),
(12, 'Виктор Михайлов', '1975-12-19'),
(13, 'Светлана Фролова', '1982-02-28'),
(14, 'Владимир Морозов', '1989-10-25'),
(15, 'Алексей Кравцов', '2001-07-26'),
(16, 'Иван Григорьев', '2002-06-10'),
(17, 'Анна Петрова', '2003-04-27'),
(18, 'Константин Григорьев', '1999-12-14');

-- --------------------------------------------------------

--
-- Структура таблицы `score`
--

CREATE TABLE `score` (
  `id` int NOT NULL,
  `participant_id` int NOT NULL,
  `jury_id` int NOT NULL,
  `criteria_id` int NOT NULL,
  `value` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `score`
--

INSERT INTO `score` (`id`, `participant_id`, `jury_id`, `criteria_id`, `value`) VALUES
(1, 1, 1, 1, 9),
(2, 1, 1, 2, 14),
(3, 1, 1, 3, 18),
(4, 1, 2, 1, 8),
(5, 1, 2, 2, 15),
(6, 1, 2, 3, 17),
(7, 1, 3, 1, 7),
(8, 1, 3, 2, 13),
(9, 1, 3, 3, 19),
(10, 2, 1, 1, 10),
(11, 2, 1, 2, 15),
(12, 2, 1, 3, 20),
(13, 2, 2, 1, 9),
(14, 2, 2, 2, 14),
(15, 2, 2, 3, 18),
(16, 2, 3, 1, 8),
(17, 2, 3, 2, 13),
(18, 2, 3, 3, 19),
(19, 3, 1, 1, 7),
(20, 3, 1, 2, 12),
(21, 3, 1, 3, 17),
(22, 3, 2, 1, 8),
(23, 3, 2, 2, 14),
(24, 3, 2, 3, 18),
(25, 3, 3, 1, 9),
(26, 3, 3, 2, 15),
(27, 3, 3, 3, 20),
(28, 4, 4, 4, 19),
(29, 4, 4, 5, 13),
(30, 4, 4, 6, 9),
(31, 4, 5, 4, 18),
(32, 4, 5, 5, 14),
(33, 4, 5, 6, 10),
(34, 4, 6, 4, 20),
(35, 4, 6, 5, 15),
(36, 4, 6, 6, 9),
(37, 5, 4, 4, 17),
(38, 5, 4, 5, 12),
(39, 5, 4, 6, 8),
(40, 5, 5, 4, 18),
(41, 5, 5, 5, 13),
(42, 5, 5, 6, 10),
(43, 5, 6, 4, 19),
(44, 5, 6, 5, 15),
(45, 5, 6, 6, 9),
(46, 6, 4, 4, 20),
(47, 6, 4, 5, 15),
(48, 6, 4, 6, 10),
(49, 6, 5, 4, 19),
(50, 6, 5, 5, 14),
(51, 6, 5, 6, 9),
(52, 6, 6, 4, 18),
(53, 6, 6, 5, 13),
(54, 6, 6, 6, 10),
(55, 7, 7, 7, 9),
(56, 7, 7, 8, 14),
(57, 7, 7, 9, 18),
(58, 7, 8, 7, 10),
(59, 7, 8, 8, 15),
(60, 7, 8, 9, 19),
(61, 7, 9, 7, 8),
(62, 7, 9, 8, 13),
(63, 7, 9, 9, 20),
(64, 8, 7, 7, 10),
(65, 8, 7, 8, 15),
(66, 8, 7, 9, 20),
(67, 8, 8, 7, 9),
(68, 8, 8, 8, 14),
(69, 8, 8, 9, 19),
(70, 8, 9, 7, 8),
(71, 8, 9, 8, 13),
(72, 8, 9, 9, 18),
(73, 9, 7, 7, 7),
(74, 9, 7, 8, 12),
(75, 9, 7, 9, 17),
(76, 9, 8, 7, 8),
(77, 9, 8, 8, 13),
(78, 9, 8, 9, 18),
(79, 9, 9, 7, 9),
(80, 9, 9, 8, 14),
(81, 9, 9, 9, 19);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `contests`
--
ALTER TABLE `contests`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `criteria`
--
ALTER TABLE `criteria`
  ADD PRIMARY KEY (`id`),
  ADD KEY `contest_id` (`contest_id`);

--
-- Индексы таблицы `jury`
--
ALTER TABLE `jury`
  ADD PRIMARY KEY (`id`),
  ADD KEY `contest_id` (`contest_id`),
  ADD KEY `person_fk` (`person_id`);

--
-- Индексы таблицы `participant`
--
ALTER TABLE `participant`
  ADD PRIMARY KEY (`id`),
  ADD KEY `part_fk` (`person_id`),
  ADD KEY `contest_fk` (`contest_id`);

--
-- Индексы таблицы `person`
--
ALTER TABLE `person`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `score`
--
ALTER TABLE `score`
  ADD PRIMARY KEY (`id`),
  ADD KEY `criteria_id` (`criteria_id`),
  ADD KEY `score_ibfk_2` (`jury_id`),
  ADD KEY `score_ibfk_3` (`participant_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `contests`
--
ALTER TABLE `contests`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `criteria`
--
ALTER TABLE `criteria`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT для таблицы `jury`
--
ALTER TABLE `jury`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT для таблицы `participant`
--
ALTER TABLE `participant`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT для таблицы `person`
--
ALTER TABLE `person`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT для таблицы `score`
--
ALTER TABLE `score`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=82;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `criteria`
--
ALTER TABLE `criteria`
  ADD CONSTRAINT `criteria_ibfk_1` FOREIGN KEY (`contest_id`) REFERENCES `contests` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Ограничения внешнего ключа таблицы `jury`
--
ALTER TABLE `jury`
  ADD CONSTRAINT `jury_ibfk_1` FOREIGN KEY (`contest_id`) REFERENCES `contests` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `person_fk` FOREIGN KEY (`person_id`) REFERENCES `person` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Ограничения внешнего ключа таблицы `participant`
--
ALTER TABLE `participant`
  ADD CONSTRAINT `contest_fk` FOREIGN KEY (`contest_id`) REFERENCES `contests` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `part_fk` FOREIGN KEY (`person_id`) REFERENCES `person` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Ограничения внешнего ключа таблицы `score`
--
ALTER TABLE `score`
  ADD CONSTRAINT `score_ibfk_1` FOREIGN KEY (`criteria_id`) REFERENCES `criteria` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `score_ibfk_2` FOREIGN KEY (`jury_id`) REFERENCES `jury` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `score_ibfk_3` FOREIGN KEY (`participant_id`) REFERENCES `participant` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

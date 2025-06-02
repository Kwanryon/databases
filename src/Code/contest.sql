-- phpMyAdmin SQL Dump
-- version 5.2.1deb3
-- https://www.phpmyadmin.net/
--
-- Хост: localhost:3306
-- Время создания: Июн 02 2025 г., 13:14
-- Версия сервера: 8.0.42-0ubuntu0.24.04.1
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
-- Структура таблицы `assessment`
--

CREATE TABLE `assessment` (
  `id` int NOT NULL COMMENT 'ID оценки',
  `id_partipants` int NOT NULL COMMENT 'ID участника',
  `id_jury` int NOT NULL COMMENT 'ID жюри',
  `id_assessment_criteria` int NOT NULL COMMENT 'ID критерия оценки',
  `value` int DEFAULT NULL COMMENT 'Балл'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `assessment`
--

INSERT INTO `assessment` (`id`, `id_partipants`, `id_jury`, `id_assessment_criteria`, `value`) VALUES
(1, 1, 1, 1, 7),
(2, 1, 1, 2, 9),
(3, 1, 2, 1, 8),
(4, 1, 2, 2, 10),
(5, 1, 3, 1, 8),
(6, 1, 3, 2, 10),
(7, 2, 1, 1, 8),
(8, 2, 1, 2, 9),
(9, 2, 2, 1, 7),
(10, 2, 2, 2, 8),
(11, 2, 3, 1, 9),
(12, 2, 3, 2, 10),
(13, 3, 1, 1, 6),
(14, 3, 1, 2, 7),
(15, 3, 2, 1, 4),
(16, 3, 2, 2, 8),
(17, 3, 3, 1, 5),
(18, 3, 3, 2, 9),
(19, 4, 4, 3, 9),
(20, 4, 4, 4, 8),
(21, 4, 5, 3, 10),
(22, 4, 5, 4, 9),
(23, 4, 6, 3, 8),
(24, 4, 6, 4, 9),
(25, 5, 4, 3, 8),
(26, 5, 4, 4, 7),
(27, 5, 5, 3, 9),
(28, 5, 5, 4, 8),
(29, 5, 6, 3, 7),
(30, 5, 6, 4, 8),
(31, 6, 4, 3, 9),
(32, 6, 4, 4, 9),
(33, 6, 5, 3, 10),
(34, 6, 5, 4, 10),
(35, 6, 6, 3, 9),
(36, 6, 6, 4, 9),
(37, 7, 7, 5, 8),
(38, 7, 7, 6, 7),
(39, 7, 8, 5, 9),
(40, 7, 8, 6, 8),
(41, 7, 9, 5, 7),
(42, 7, 9, 6, 7),
(43, 8, 7, 5, 9),
(44, 8, 7, 6, 9),
(45, 8, 8, 5, 10),
(46, 8, 8, 6, 10),
(47, 8, 9, 5, 9),
(48, 8, 9, 6, 8),
(49, 9, 7, 5, 7),
(50, 9, 7, 6, 6),
(51, 9, 8, 5, 8),
(52, 9, 8, 6, 7),
(53, 9, 9, 5, 7),
(54, 9, 9, 6, 7);

-- --------------------------------------------------------

--
-- Структура таблицы `assessment_criteria`
--

CREATE TABLE `assessment_criteria` (
  `id` int NOT NULL COMMENT 'ID критерия',
  `id_contests` int NOT NULL COMMENT 'ID конкурса',
  `name_of_assessment_criteria` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'Название критерия',
  `max_score` int DEFAULT NULL COMMENT 'Максимальный балл'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `assessment_criteria`
--

INSERT INTO `assessment_criteria` (`id`, `id_contests`, `name_of_assessment_criteria`, `max_score`) VALUES
(1, 1, 'Уровень технической сложности задачи', 11),
(2, 1, 'Оригинальность и эффективность решения', 11),
(3, 2, 'Качество защиты и устойчивость к атакам', 11),
(4, 2, 'Скорость и точность обнаружения уязвимостей', 11),
(5, 3, 'Юзабилити и дизайн интерфейса', 11),
(6, 3, 'Качество и чистота кода', 11);

-- --------------------------------------------------------

--
-- Структура таблицы `contests`
--

CREATE TABLE `contests` (
  `id` int NOT NULL COMMENT 'ID конкурса',
  `nameofcontest` varchar(255) NOT NULL COMMENT 'Название конкурса',
  `date` date NOT NULL COMMENT 'Дата проведения'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Конкурсы';

--
-- Дамп данных таблицы `contests`
--

INSERT INTO `contests` (`id`, `nameofcontest`, `date`) VALUES
(1, 'CodeMaster Challenge 2024', '2024-07-17'),
(2, 'CyberSec Battle 2024', '2024-07-24'),
(3, 'WebDev Sprint 2024', '2024-07-31');

-- --------------------------------------------------------

--
-- Структура таблицы `jury`
--

CREATE TABLE `jury` (
  `id` int NOT NULL COMMENT 'ID жюри',
  `id_person` int NOT NULL COMMENT 'ID персоны',
  `id_contests` int NOT NULL COMMENT 'ID конкурса'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `jury`
--

INSERT INTO `jury` (`id`, `id_person`, `id_contests`) VALUES
(1, 7, 1),
(2, 8, 1),
(3, 9, 1),
(4, 10, 2),
(5, 12, 2),
(6, 13, 2),
(7, 16, 3),
(8, 17, 3),
(9, 18, 3);

-- --------------------------------------------------------

--
-- Структура таблицы `participants`
--

CREATE TABLE `participants` (
  `id` int NOT NULL COMMENT 'ID участника',
  `id_person` int NOT NULL COMMENT 'ID персоны',
  `id_contests` int NOT NULL COMMENT 'ID конкурса',
  `name_of_competition_work` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'Название конкурсной работы'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `participants`
--

INSERT INTO `participants` (`id`, `id_person`, `id_contests`, `name_of_competition_work`) VALUES
(1, 1, 1, 'Оптимизация алгоритма сортировки больших данных'),
(2, 2, 1, 'Разработка системы автотестирования кода'),
(3, 3, 1, 'Реализация многопоточного парсера'),
(4, 4, 2, 'Анализ уязвимостей веб-приложений'),
(5, 5, 2, 'Разработка безопасного протокола обмена данными'),
(6, 11, 2, 'Разработка безопасного протокола обмена данными'),
(7, 6, 3, 'Адаптивный одностраничный сайт для онлайн-магазина'),
(8, 14, 3, 'Платформа для обучения программированию'),
(9, 15, 3, 'Оптимизация производительности веб-приложения');

-- --------------------------------------------------------

--
-- Структура таблицы `person`
--

CREATE TABLE `person` (
  `id` int NOT NULL COMMENT 'ID Участника',
  `fullname` varchar(255) NOT NULL COMMENT 'ФИО',
  `dateofbirth` date DEFAULT NULL COMMENT 'Дата рождения'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `person`
--

INSERT INTO `person` (`id`, `fullname`, `dateofbirth`) VALUES
(1, 'Сидоров Андрей Владимирович', '2000-07-24'),
(2, 'Петров Михаил Иванович', '1999-04-26'),
(3, 'Быкова Светлана Викторовна', '2002-01-19'),
(4, 'Новиков Константин Алексеевич', '2001-05-31'),
(5, 'Кононова Арина Ивановна', '2000-08-28'),
(6, 'Субботина Елизавета Владимировна', '2003-07-25'),
(7, 'Соколова Наталья Ивановна', '1983-10-25'),
(8, 'Васильева Ольга Алексеевна', NULL),
(9, 'Волков Сергей Дмитриевич', '1992-04-26'),
(10, 'Васильев Андрей Тимофеевич', '1981-11-06'),
(11, 'Казаков Владимир Алексеевич', '1999-05-27'),
(12, 'Федоров Михаил Викторович', '1991-03-20'),
(13, 'Колосова Валентина Константиновна', '1989-04-25'),
(14, 'Петров Алексей Алексеевич', '2001-01-25'),
(15, 'Виноградов Александр Алексеевич', '1998-09-25'),
(16, 'Суворов Вячеслав Валерьевич', '1990-10-14'),
(17, 'Усольцева София Александровна', '1993-06-14'),
(18, 'Антонов Евгений Федорович', '1988-02-20');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `assessment`
--
ALTER TABLE `assessment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `part_fk` (`id_partipants`),
  ADD KEY `jury_fk` (`id_jury`),
  ADD KEY `Assessment_crit_fk` (`id_assessment_criteria`);

--
-- Индексы таблицы `assessment_criteria`
--
ALTER TABLE `assessment_criteria`
  ADD PRIMARY KEY (`id`),
  ADD KEY `contests_fk_crit` (`id_contests`);

--
-- Индексы таблицы `contests`
--
ALTER TABLE `contests`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `jury`
--
ALTER TABLE `jury`
  ADD PRIMARY KEY (`id`),
  ADD KEY `contests_fk` (`id_contests`),
  ADD KEY `person_fk` (`id_person`);

--
-- Индексы таблицы `participants`
--
ALTER TABLE `participants`
  ADD PRIMARY KEY (`id`),
  ADD KEY `contests_fk_part` (`id_contests`),
  ADD KEY `person_fk_prt` (`id_person`);

--
-- Индексы таблицы `person`
--
ALTER TABLE `person`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `assessment`
--
ALTER TABLE `assessment`
  MODIFY `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID оценки', AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT для таблицы `assessment_criteria`
--
ALTER TABLE `assessment_criteria`
  MODIFY `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID критерия', AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT для таблицы `contests`
--
ALTER TABLE `contests`
  MODIFY `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID конкурса', AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `jury`
--
ALTER TABLE `jury`
  MODIFY `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID жюри', AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT для таблицы `participants`
--
ALTER TABLE `participants`
  MODIFY `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID участника', AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT для таблицы `person`
--
ALTER TABLE `person`
  MODIFY `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID Участника', AUTO_INCREMENT=19;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `assessment`
--
ALTER TABLE `assessment`
  ADD CONSTRAINT `Assessment_crit_fk` FOREIGN KEY (`id_assessment_criteria`) REFERENCES `assessment_criteria` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `jury_fk` FOREIGN KEY (`id_jury`) REFERENCES `jury` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `part_fk` FOREIGN KEY (`id_partipants`) REFERENCES `participants` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Ограничения внешнего ключа таблицы `assessment_criteria`
--
ALTER TABLE `assessment_criteria`
  ADD CONSTRAINT `contests_fk_crit` FOREIGN KEY (`id_contests`) REFERENCES `contests` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Ограничения внешнего ключа таблицы `jury`
--
ALTER TABLE `jury`
  ADD CONSTRAINT `contests_fk` FOREIGN KEY (`id_contests`) REFERENCES `contests` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `person_fk` FOREIGN KEY (`id_person`) REFERENCES `person` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Ограничения внешнего ключа таблицы `participants`
--
ALTER TABLE `participants`
  ADD CONSTRAINT `contests_fk_part` FOREIGN KEY (`id_contests`) REFERENCES `contests` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `person_fk_prt` FOREIGN KEY (`id_person`) REFERENCES `person` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

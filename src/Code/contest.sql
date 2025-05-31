-- phpMyAdmin SQL Dump
-- version 5.2.1deb3
-- https://www.phpmyadmin.net/
--
-- Хост: localhost:3306
-- Время создания: Май 31 2025 г., 06:58
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

-- --------------------------------------------------------

--
-- Структура таблицы `contests`
--

CREATE TABLE `contests` (
  `id` int NOT NULL COMMENT 'ID конкурса',
  `nameofcontest` varchar(255) NOT NULL COMMENT 'Название конкурса',
  `date` date NOT NULL COMMENT 'Дата проведения'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Конкурсы';

-- --------------------------------------------------------

--
-- Структура таблицы `jury`
--

CREATE TABLE `jury` (
  `id` int NOT NULL COMMENT 'ID жюри',
  `id_person` int NOT NULL COMMENT 'ID персоны',
  `id_contests` int NOT NULL COMMENT 'ID конкурса'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
(10, 'Васильев Андрей Тимофеевич', '1981-11-06');

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
-- AUTO_INCREMENT для таблицы `assessment_criteria`
--
ALTER TABLE `assessment_criteria`
  MODIFY `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID критерия';

--
-- AUTO_INCREMENT для таблицы `contests`
--
ALTER TABLE `contests`
  MODIFY `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID конкурса';

--
-- AUTO_INCREMENT для таблицы `jury`
--
ALTER TABLE `jury`
  MODIFY `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID жюри';

--
-- AUTO_INCREMENT для таблицы `participants`
--
ALTER TABLE `participants`
  MODIFY `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID участника';

--
-- AUTO_INCREMENT для таблицы `person`
--
ALTER TABLE `person`
  MODIFY `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID Участника', AUTO_INCREMENT=12;

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

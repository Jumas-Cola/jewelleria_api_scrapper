-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Хост: db
-- Время создания: Апр 23 2021 г., 15:58
-- Версия сервера: 8.0.24
-- Версия PHP: 7.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `jewelleria`
--

-- --------------------------------------------------------

--
-- Структура таблицы `all_products`
--

CREATE TABLE `all_products` (
  `code` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `type` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `name` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `feature` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `certificate` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `price` float DEFAULT NULL,
  `oldprice` float DEFAULT NULL,
  `category` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `subcategory` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `brand` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `country` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `size` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `metall` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `fineness` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `covering` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `photos` json DEFAULT NULL,
  `inserts` json DEFAULT NULL,
  `tags` json DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Структура таблицы `bundles`
--

CREATE TABLE `bundles` (
  `code` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `type` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `name` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `feature` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `certificate` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `price` float DEFAULT NULL,
  `oldprice` float DEFAULT NULL,
  `category` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `subcategory` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `photos` json DEFAULT NULL,
  `composition` json DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `all_products`
--
ALTER TABLE `all_products`
  ADD PRIMARY KEY (`code`);

--
-- Индексы таблицы `bundles`
--
ALTER TABLE `bundles`
  ADD PRIMARY KEY (`code`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

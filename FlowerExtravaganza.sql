-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Июн 09 2025 г., 04:20
-- Версия сервера: 8.0.30
-- Версия PHP: 8.0.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `FlowerExtravaganza`
--

-- --------------------------------------------------------

--
-- Структура таблицы `Categories`
--

CREATE TABLE `Categories` (
  `id` int NOT NULL,
  `name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `Categories`
--

INSERT INTO `Categories` (`id`, `name`) VALUES
(1, 'Букеты'),
(4, 'Цветы поштучно'),
(5, 'Цветы в коробке'),
(6, 'Корзины с цветами'),
(7, 'Праздничные букеты'),
(8, 'Подарки и игрушки');

-- --------------------------------------------------------

--
-- Структура таблицы `orders`
--

CREATE TABLE `orders` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `order_number` varchar(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `address` text NOT NULL,
  `delivery_date` date NOT NULL,
  `delivery_time` varchar(100) NOT NULL,
  `note` text,
  `total_amount` int NOT NULL,
  `order_status` int NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `order_number`, `name`, `phone`, `address`, `delivery_date`, `delivery_time`, `note`, `total_amount`, `order_status`, `created_at`) VALUES
(19, 1, '65f9a6e0db983', 'Даниил Михайлович Емелёв', '+79857707178', 'Улица Модельная,д.24', '2024-03-19', '15:00', '', 3650, 2, '2024-03-19 14:53:20'),
(24, 4, '683fba0be94ea', 'Егор', '89156768899', 'г. Коломна, Малинское шоссе, д. 17', '2025-06-04', '17:35', 'папппп', 3150, 3, '2025-06-04 03:14:19'),
(26, 4, '68407c53024a3', 'Kirill', '89806545643', 'г. Коломна, Щурово, д.657', '2025-06-19', '12:00', 'рттртртр', 2222, 1, '2025-06-04 17:03:15'),
(27, 4, '684086c791358', 'Степан', '89675664534', 'г. коломна дом 55', '2025-06-04', '21:00', '', 2490, 1, '2025-06-04 17:47:51'),
(28, 4, '68408902a792a', 'руслан', '89076756578', 'Колычево', '2025-06-04', '12:34', '', 4700, 1, '2025-06-04 17:57:22');

-- --------------------------------------------------------

--
-- Структура таблицы `order_items`
--

CREATE TABLE `order_items` (
  `id` int NOT NULL,
  `order_id` int DEFAULT NULL,
  `product_name` varchar(255) DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `product_price` int DEFAULT NULL,
  `product_image` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `packaging_price` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `order_items`
--

INSERT INTO `order_items` (`id`, `order_id`, `product_name`, `quantity`, `product_price`, `product_image`, `packaging_price`) VALUES
(18, 19, 'Розы Россия красные', 15, 230, 'uploads/4327117384524ef451875dd7f0f6a13e00af7c85-buket-iz-krasnyh-roz-rossiya-700x700.jpg', 200),
(24, 24, 'Коробка Ромашки', 1, 3000, 'uploads/7d12154ac9884ce2fdf093a9c14e40f87ad8e326-tsvety-v-korobke-zakatnye-oblaka-700x700.jpg', 150),
(26, 26, 'Букет Гвоздики', 1, 2222, 'uploads/e5c844fbd42ff50d0518b4e834f6a761b0250be5-buket-legkost-bytiya-700x700.jpg', 0),
(27, 27, 'Букет Альстромерии', 1, 2490, 'uploads/59f2fc8c768bf2a3dda450693f9b9a0e6af41da0-buket-17.jpg', 0),
(28, 28, 'Корзина с Ирисами', 1, 4700, 'uploads/5f954353a804a3d987d62b08e16e6072d27b41e3-korzina-s-tsvetami-luchezarnoe-chudo-700x700.jpg', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `Order_status`
--

CREATE TABLE `Order_status` (
  `id` int NOT NULL,
  `order_status` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `Order_status`
--

INSERT INTO `Order_status` (`id`, `order_status`) VALUES
(1, 'В обработке'),
(2, 'Выполнен'),
(3, 'Доставляется'),
(4, 'Отказ');

-- --------------------------------------------------------

--
-- Структура таблицы `Products`
--

CREATE TABLE `Products` (
  `id` int NOT NULL,
  `name` varchar(55) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `Price` varchar(10) NOT NULL,
  `category_id` int NOT NULL,
  `description` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `image` varchar(255) NOT NULL,
  `created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `Products`
--

INSERT INTO `Products` (`id`, `name`, `Price`, `category_id`, `description`, `image`, `created`) VALUES
(1, 'Розы красные', '160', 4, '', '4327117384524ef451875dd7f0f6a13e00af7c85-buket-iz-krasnyh-roz-rossiya-700x700.jpg', '2024-03-17 12:59:19'),
(4, 'Розы Красные 101 шт.', '15150', 1, '', '068f33677be2ce352c13fde025f816a2b7eec053-rozy-krasnye-101.jpg', '2024-03-20 15:12:14'),
(11, 'Букет Тюльпаны', '2640', 1, 'Красота', '8453c3a2c29be9169898da48817c6cf22cf220c7-catalog-prazdnik.jpg', '2025-06-01 19:54:53'),
(12, 'Букет Альстромерии', '2490', 1, 'Невероятное буйство красок', '59f2fc8c768bf2a3dda450693f9b9a0e6af41da0-buket-17.jpg', '2025-06-04 02:55:27'),
(13, 'Букет Подсолнухи', '2390', 1, 'Солнышки', '5ab7eef6d373007bfee03da6ccebc9ffffde8793-buket-solnechnyy-700x700.jpg', '2025-06-04 03:09:41'),
(14, 'Букет Гвоздики', '2222', 1, '', 'e5c844fbd42ff50d0518b4e834f6a761b0250be5-buket-legkost-bytiya-700x700.jpg', '2025-06-04 03:11:15'),
(15, 'Букет Пионы', '3050', 1, '', 'e0939f5d35311c066e2480c1f41a5493163b5fef-buket-29-700x700.jpg', '2025-06-04 03:14:42'),
(16, 'Букет Сирень', '2170', 1, '', '192376ca466a6be4a9a8f48ac1d00ef00a0f003b-buket-tantsuyuschie-oblaka-400x400.jpg', '2025-06-04 03:16:09'),
(17, 'Букет Нарциссы', '2540', 1, '', 'f70126ebe085c69102117d82512c989d71b064f1-buket-zakatnye-mechty-400x400.jpg', '2025-06-04 03:19:22'),
(18, 'Гвоздика розовая', '130', 4, '', '64b9d644b3dcf1092a99a790376e3d0a0649b92e-gvozdika-rozovaya-700x700.jpg', '2025-06-04 03:20:27'),
(19, 'Розы розовые', '150', 4, '', '41e581386d1769b2618ecb7d9a8c52f0fcfaf957-catalog-poshtuchno.jpg', '2025-06-04 03:23:54'),
(20, 'Подсолнух', '250', 4, '', '67e21affd0668ddf6d5cc2bf36b2a8123596520b-podsolnuh-400x400.jpg', '2025-06-04 03:24:46'),
(21, 'Гепсофил', '240', 4, '', '60e88850446b547958d807ec1a4ca986c66c81a1-gipsofila-rozovaya-400x400.jpg', '2025-06-04 03:44:37'),
(22, 'Букет Маки', '1990', 1, '', '4ec80c31e89d63447f9f1ec94e19ca6c45934181-buket-ognennaya-strast-400x400.jpg', '2025-06-04 04:09:46'),
(23, 'Розы розовые в коробке', '3000', 5, '', 'f6140131ac218173dcf4fe2e57539057addedde2-catalog-korobka.jpg', '2025-06-04 05:05:48'),
(24, 'Ромашки в коробке', '3000', 5, '', '7d12154ac9884ce2fdf093a9c14e40f87ad8e326-tsvety-v-korobke-zakatnye-oblaka-700x700.jpg', '2025-06-04 05:07:23'),
(25, 'Корзина Розы разные', '5490', 6, '', '65ce14d37b97b51a81ace9dcb414fe8b4fbdd9c2-catalog-korzina.jpg', '2025-06-04 19:13:41'),
(26, 'Корзина с Орхидеями', '5250', 6, '', '989e5e81a01464998adb4e60ae6e4ad9f8f2dd4f-tsvety-v-korzinke-garmoniya-300x300.jpg', '2025-06-04 19:17:16'),
(27, 'Корзина с Хризантемами', '4990', 6, '', '48df0b699544f2043838dc936c6dcffa0b427731-korzina-s-tsvetami-rozovoe-velikolepie-700x700.jpg', '2025-06-04 19:24:16'),
(28, 'Корзина с Ирисами', '4700', 6, '', '5f954353a804a3d987d62b08e16e6072d27b41e3-korzina-s-tsvetami-luchezarnoe-chudo-700x700.jpg', '2025-06-04 19:26:20'),
(29, 'Букет Праздник «8 Марта»', '2200', 7, '', 'cc790bff265313ad48408e9ea9235628bfbfcef4-buket-prelestnitsa-700x700.jpg', '2025-06-04 19:32:54'),
(30, 'Букет Сладости', '3500', 8, '', 'd21c96f425485ab56984dd03c3f09413aa102135-sladkiy-buket-enerdzhi-300x300.jpg', '2025-06-04 20:06:44'),
(31, 'Букет Сладости с игрушкой', '3600', 8, '', 'f449898bff0e96d68fe26e8fa7b543f1502ce072-sladkiy-buket-barsik-400x400.jpg', '2025-06-04 20:07:07'),
(32, 'Гелиевые шарики', '2400', 8, '', '83b48654922d51116744454e872e7edf429b8555-gelievye-shary-rozovyy-zakat-300x300.jpg', '2025-06-04 20:07:52'),
(33, 'Плюшевый медведь средний', '4444', 8, '', 'dd440658c37b216a3238e43bca815fc30eeb3b40-plyushevyy-mishka-sredniy-700x700.jpg', '2025-06-04 20:10:21'),
(34, 'Плюшевый медведь большой', '5555', 8, '', '99f05adbb249ceee11a0802e2639ee5ede68edfa-plyushevyy-mishka-bolshoy-700x700.jpg', '2025-06-04 20:10:52'),
(35, 'Конфеты «Raffaello» 150 г', '236', 8, '', '1926eb387293701432742924341c42fdd8648339-rafaello-150-700x700.jpg', '2025-06-04 20:12:08');

-- --------------------------------------------------------

--
-- Структура таблицы `Roles`
--

CREATE TABLE `Roles` (
  `Role_id` int NOT NULL,
  `role` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `Roles`
--

INSERT INTO `Roles` (`Role_id`, `role`) VALUES
(1, 'Пользователь'),
(2, 'Администратор');

-- --------------------------------------------------------

--
-- Структура таблицы `unique_orders`
--

CREATE TABLE `unique_orders` (
  `id` int NOT NULL,
  `phone` varchar(20) NOT NULL,
  `wishes` text NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `unique_orders`
--

INSERT INTO `unique_orders` (`id`, `phone`, `wishes`, `created_at`) VALUES
(1, '+79857707178', 'dsadsasda', '2024-03-21 13:04:44'),
(2, '+79857707178', 'dsadsasda', '2024-03-21 13:07:15'),
(3, '+79857707178', 'dsadsasda', '2024-03-21 13:07:46'),
(4, '+7(987)567-46-77', 'Хочу очень красивый букет!', '2025-06-03 23:50:54');

-- --------------------------------------------------------

--
-- Структура таблицы `Users`
--

CREATE TABLE `Users` (
  `id` int NOT NULL,
  `Name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `Surname` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `Lastname` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `email` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `password` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `role` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `Users`
--

INSERT INTO `Users` (`id`, `Name`, `Surname`, `Lastname`, `email`, `password`, `role`) VALUES
(1, 'Артемий', 'Гаврилин', 'Шекелович', 'dsa@mail.ru', '123456', 1),
(2, 'Даниил', 'Емелёв', 'Михайлович', 'danila_emelev@mail.ru', '3213213', 2),
(3, 'Александр', 'Дюдю', 'Михайлович', 'dsadas@mail.ru', '3211235', 1),
(4, 'Дмитрий', 'Ромашкин', 'Сергеевич', 'mr.dmirom@mail.ru', '190876', 1);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `Categories`
--
ALTER TABLE `Categories`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `order_status` (`order_status`);

--
-- Индексы таблицы `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`);

--
-- Индексы таблицы `Order_status`
--
ALTER TABLE `Order_status`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `Products`
--
ALTER TABLE `Products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Category` (`category_id`);

--
-- Индексы таблицы `Roles`
--
ALTER TABLE `Roles`
  ADD PRIMARY KEY (`Role_id`);

--
-- Индексы таблицы `unique_orders`
--
ALTER TABLE `unique_orders`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `Users`
--
ALTER TABLE `Users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `role` (`role`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `Categories`
--
ALTER TABLE `Categories`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT для таблицы `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT для таблицы `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT для таблицы `Order_status`
--
ALTER TABLE `Order_status`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `Products`
--
ALTER TABLE `Products`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT для таблицы `Roles`
--
ALTER TABLE `Roles`
  MODIFY `Role_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `unique_orders`
--
ALTER TABLE `unique_orders`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `Users`
--
ALTER TABLE `Users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `Users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`order_status`) REFERENCES `Order_status` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Ограничения внешнего ключа таблицы `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`);

--
-- Ограничения внешнего ключа таблицы `Products`
--
ALTER TABLE `Products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `Categories` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Ограничения внешнего ключа таблицы `Users`
--
ALTER TABLE `Users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`role`) REFERENCES `Roles` (`Role_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

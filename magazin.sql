-- phpMyAdmin SQL Dump
-- version 4.1.12
-- http://www.phpmyadmin.net
--
-- Хост: 127.0.0.1
-- Время создания: Апр 14 2018 г., 15:18
-- Версия сервера: 5.6.16
-- Версия PHP: 5.5.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- База данных: `magazin`
--

-- --------------------------------------------------------

--
-- Структура таблицы `brand`
--

CREATE TABLE IF NOT EXISTS `brand` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `brand` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Дамп данных таблицы `brand`
--

INSERT INTO `brand` (`id`, `brand`) VALUES
(1, 'Levis'),
(2, 'Nike'),
(6, 'Sketchers'),
(7, 'Polo');

-- --------------------------------------------------------

--
-- Структура таблицы `cart`
--

CREATE TABLE IF NOT EXISTS `cart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `items` text NOT NULL,
  `expire_date` int(11) NOT NULL,
  `paid` tinyint(4) NOT NULL DEFAULT '0',
  `shipped` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=22 ;

--
-- Дамп данных таблицы `cart`
--

INSERT INTO `cart` (`id`, `items`, `expire_date`, `paid`, `shipped`) VALUES
(2, '[{"id":"4","size":"42","quantity":"1"},{"id":"2","size":"M","quantity":"1"}]', 2018, 0, 0),
(3, '[{"id":"3","size":"L","quantity":"1"}]', 2018, 0, 0),
(4, '[{"id":"1","size":"36","quantity":"1"},{"id":"2","size":"M","quantity":"1"},{"id":"4","size":"42","quantity":2}]', 2018, 0, 0),
(5, '[{"id":"5","size":"34","quantity":1}]', 2018, 1, 1),
(6, '[{"id":"1","size":"32","quantity":"2"}]', 2018, 1, 1),
(7, '[{"id":"5","size":"32","quantity":"3"}]', 2018, 1, 1),
(8, '[{"id":"5","size":"34","quantity":1}]', 2018, 1, 1),
(9, '[{"id":"4","size":"42","quantity":"1"},{"id":"1","size":"32","quantity":"1"}]', 2018, 1, 1),
(10, '[{"id":"5","size":"34","quantity":"1"}]', 2018, 1, 1),
(11, '[{"id":"2","size":"M","quantity":"1"}]', 2018, 1, 1),
(12, '[{"id":"2","size":"M","quantity":"1"}]', 2018, 1, 1),
(13, '[{"id":"15","size":"36","quantity":"1"},{"id":"12","size":"M","quantity":"1"}]', 2018, 1, 1),
(14, '[{"id":"15","size":"38","quantity":"1"},{"id":"5","size":"34","quantity":"1"}]', 2018, 1, 1),
(15, '[{"id":"16","size":"26","quantity":"1"},{"id":"18","size":"36","quantity":"1"}]', 2018, 1, 1),
(16, '[{"id":"12","size":"M","quantity":"1"}]', 2018, 1, 1),
(17, '[{"id":"15","size":"38","quantity":"1"}]', 2018, 1, 0),
(18, '[{"id":"2","size":"M","quantity":"1"},{"id":"3","size":"L","quantity":"1"}]', 2018, 0, 0),
(19, '[{"id":"1","size":"32","quantity":"1"},{"id":"1","size":"28","quantity":"1"},{"id":"12","size":"M","quantity":"1"},{"id":"3","size":"L","quantity":"1"}]', 2018, 1, 0),
(20, '[{"id":"13","size":"M","quantity":"1"}]', 2018, 1, 0),
(21, '[{"id":"13","size":"M","quantity":"1"}]', 2018, 0, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `categories`
--

CREATE TABLE IF NOT EXISTS `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category` varchar(255) NOT NULL,
  `parent` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=25 ;

--
-- Дамп данных таблицы `categories`
--

INSERT INTO `categories` (`id`, `category`, `parent`) VALUES
(1, 'Men', 0),
(2, 'Women', 0),
(3, 'Boys', 0),
(4, 'Girls', 0),
(5, 'Shirts', 1),
(6, 'Pants', 1),
(7, 'Shoes', 1),
(8, 'Accessories', 1),
(9, 'Shirts', 2),
(10, 'Pants', 2),
(11, 'Shoes', 2),
(12, 'Dresses', 2),
(13, 'Shirts', 3),
(14, 'Pants', 3),
(15, 'Dresses', 4),
(16, 'Shoes', 4),
(17, 'Accessories', 2),
(23, 'Gifts', 0),
(24, 'Home Decor', 23);

-- --------------------------------------------------------

--
-- Структура таблицы `products`
--

CREATE TABLE IF NOT EXISTS `products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `list_price` decimal(10,2) NOT NULL,
  `brand` int(11) NOT NULL,
  `categories` varchar(255) NOT NULL,
  `image` text NOT NULL,
  `description` text NOT NULL,
  `featured` tinyint(4) NOT NULL DEFAULT '0',
  `sizes` text NOT NULL,
  `deleted` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=19 ;

--
-- Дамп данных таблицы `products`
--

INSERT INTO `products` (`id`, `title`, `price`, `list_price`, `brand`, `categories`, `image`, `description`, `featured`, `sizes`, `deleted`) VALUES
(1, 'Levi&#039;s Jeans', '6000.00', '7200.00', 1, '6', '/dostar/images/products/men1.png', 'Бұл шалбар қазіргі жәңа үлгілер', 1, '28:2:2,32:3:2,36:2:2', 0),
(2, 'Beautiful Shirt', '3700.00', '4500.00', 1, '5', '/dostar/images/products/8df3c446cdc782a97294257a53fa600a.png', 'Бұл жейде өте әдемі, сапасы жақсы.', 1, 'M:2:2', 0),
(3, 'Zheide', '2500.00', '3000.00', 2, '9', '/dostar/images/products/442a1faafda093481288231e2257222c.png', 'Zhaksy', 1, 'L:2:2', 0),
(4, 'Zheide', '2500.00', '3000.00', 6, '24', '/dostar/images/products/7a1211a4a0579a23f32e95f638e2aac3.jpg', 'Sapasy zhaksy zheide', 1, '42:2:2', 0),
(5, 'Shirt ', '2500.00', '2800.00', 7, '6', '/dostar/images/products/7b76663b9ff964e7811a215e45b2c44a.png', 'Zhana ulgidegi shalbar', 1, '32:2:2,34:2:2', 0),
(11, 'Test', '1700.00', '2000.00', 1, '5', '/dostar/images/products/abd08160c1b2e42584a8d8272d4980b6.png,/dostar/images/products/abd08160c1b2e42584a8d8272d4980b6.png', 'Beautiful', 1, 'M:2:2', 0),
(12, 'test', '1450.00', '2000.00', 1, '9', '/dostar/images/products/sh2.jpg,/dostar/images/products/sh4.png,/dostar/images/products/sh5.png', 'beautiful', 1, 'M:0:', 0),
(13, 'test2', '5000.00', '6700.00', 2, '5', '/dostar/images/products/sh2.jpg,/dostar/images/products/sh4.png,/dostar/images/products/sh5.png', 'Ademi', 1, 'M:1:2', 0),
(14, 'Ademi Zheide', '1700.00', '2000.00', 1, '5', '/dostar/images/products/da8b1744a0b630ef70cd4a05f8832396.png,/dostar/images/products/da8b1744a0b630ef70cd4a05f8832396.jpg,/dostar/images/products/da8b1744a0b630ef70cd4a05f8832396.png', 'Zhaksi zheide', 1, 'Small:2:2,Medium:3:2,Large:4:2', 0),
(15, 'Ademi shalbar', '3700.00', '4200.00', 2, '10', '/dostar/images/products/f654a0eabf36db3bef0298c60c91c8b2.png,/dostar/images/products/af72673d5fccbd22a3e13906472857cc.png,/dostar/images/products/206734396bb2da1e522b2b49f4edb78c.png', 'Beautiful pant', 1, '36:2:2,38:2:2,40:4:2', 0),
(16, 'Balanin zheidesi', '3400.00', '4000.00', 2, '13', '/dostar/images/products/e1ff0e8575d74ff82bb53bc087cd6e28.png,/dostar/images/products/f2dd7bcd2474a1b6249bf055301fc1a7.png', 'Balalarga zhaksi zheide', 1, '26:0:,28:3:', 0),
(17, 'Shirt for boys', '2700.00', '3500.00', 7, '13', '/dostar/images/products/9db967f2a69667a9c5bd099e6a9d53ec.png', 'Zhaksi zheide', 1, 'S:3:3,M:2:2', 0),
(18, 'Zhana Shalbar', '5600.00', '6000.00', 1, '10', '/dostar/images/products/b31e8501cbfcd35683a3865246c122ce.png', 'Ademi', 1, '36:1:,38:3:', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `transaction`
--

CREATE TABLE IF NOT EXISTS `transaction` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `charge_id` varchar(255) NOT NULL,
  `cart_id` int(11) NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `email` varchar(175) NOT NULL,
  `street` varchar(255) NOT NULL,
  `street2` varchar(255) NOT NULL,
  `city` varchar(175) NOT NULL,
  `state` varchar(175) NOT NULL,
  `zip_code` varchar(50) NOT NULL,
  `country` varchar(175) NOT NULL,
  `sub_total` decimal(10,2) NOT NULL,
  `tax` decimal(10,2) NOT NULL,
  `grand_total` decimal(10,2) NOT NULL,
  `description` text NOT NULL,
  `txn_type` varchar(255) NOT NULL,
  `txn_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=16 ;

--
-- Дамп данных таблицы `transaction`
--

INSERT INTO `transaction` (`id`, `charge_id`, `cart_id`, `full_name`, `email`, `street`, `street2`, `city`, `state`, `zip_code`, `country`, `sub_total`, `tax`, `grand_total`, `description`, `txn_type`, `txn_date`) VALUES
(1, 'StripeCharge JSON: {\n    "id": "ch_1BwuuUC1aYtycKMfgUk0CSFQ",\n    "object": "charge",\n    "amount": 200,\n    "amount_refunded": 0,\n    "application": null,\n    "application_fee": null,\n    "balance_transaction": "txn_1BwuuUC1aYtycKMfGTA2brFO",\n    "captur', 5, 'Tokatarbek Elshat', 'elshat90@mail.ru', 'Satpaeva 12', '', 'Almaty', 'Almaty obl', 'zip_code', 'Qazaqstan', '2500.00', '217.50', '2717.00', '1item from Shauntas Boutique.', 'charge', '2018-01-18 22:21:06'),
(2, 'ch_1BwuxfC1aYtycKMfUqGvNFe5', 6, 'Tokatarbek Elshat', 'elshat90@mail.ru', 'Satpaeva 12', '', 'Almaty', 'Almaty obl', 'zip_code', 'Qazaqstan', '12000.00', '1044.00', '13044.00', '2items from Shauntas Boutique.', 'charge', '2018-01-18 22:24:23'),
(3, 'ch_1BwwDwC1aYtycKMfzBeZCtvS', 7, 'Tokatarbek Elshat', 'elshat90@mail.ru', 'Satpaeva 12', '', 'Almaty', 'Almaty obl', 'zip_code', 'Qazaqstan', '7500.00', '652.50', '8152.50', '3items from Shauntas Boutique.', 'charge', '2018-02-18 23:45:17'),
(4, 'ch_1BwwR0C1aYtycKMf56JNW813', 8, 'Tokatarbek Elshat', 'elshat90@mail.ru', 'Satpaeva 12', '', 'Almaty', 'Almaty obl', 'zip_code', 'Qazaqstan', '2500.00', '217.50', '22717.50', '1item from Shauntas Boutique.', 'charge', '2018-02-19 23:58:46'),
(5, 'ch_1Bx8oCC1aYtycKMfMQtfrTT8', 9, 'Tokatarbek Elshat', 'elshat90@mail.ru', 'Satpaeva 12', '', 'Almaty', 'Almaty obl', 'zip_code', 'Qazaqstan', '8500.00', '739.50', '0.00', '2items from Shauntas Boutique.', 'charge', '2018-02-19 13:11:31'),
(6, 'ch_1Bx91jC1aYtycKMfVSVWjKJL', 10, 'Kuantay Zangar', 'zangar90@mail.ru', 'Abaia12', 'Kaynar45', 'Almaty', 'Almaty obl', 'zip_code', 'Qazaqstan', '2500.00', '217.50', '0.00', '1item from Shauntas Boutique.', 'charge', '2018-02-19 13:25:31'),
(7, 'ch_1Bx93ZC1aYtycKMfwKYmh0NN', 11, 'Asylzhan', 'Asylzhan@mail.ru', 'Algabas', '', 'Almaty', 'Almaty obl', 'zip_code', 'Qazaqstan', '3700.00', '321.90', '0.00', '1item from Shauntas Boutique.', 'charge', '2018-02-19 13:27:25'),
(8, 'ch_1Bx954C1aYtycKMff0mhyImx', 12, 'Tokatarbek Elshat', 'elshat90@mail.ru', 'Satpaeva 12', '', 'Almaty', 'Almaty obl', 'zip_code', 'Qazaqstan', '3700.00', '321.90', '0.00', '1item from Shauntas Boutique.', 'charge', '2018-02-19 13:28:58'),
(9, 'ch_1BxaVzC1aYtycKMfp8BGkCDz', 13, 'Shyngisova Karlygash', 'ullar_k92@mail.ru', 'Moldabek 14', '', 'Shu', 'Zhambyl obylsy', 'zip_code', 'Qazaqstan', '5150.00', '448.05', '5598.05', '2items from Magazin Elshat.', 'charge', '2018-02-20 18:46:31'),
(10, 'ch_1BxacUC1aYtycKMfSYpGZkDy', 14, 'Shingisova Karlygash', 'ullar_k92@mail.ru', 'Moldabekova 14', '', 'Shu', 'Zhambyl obl', '236898', 'Qazaqstan', '6200.00', '539.40', '6739.40', '2items from Magazin Elshat.', 'charge', '2018-03-20 18:53:15'),
(11, 'ch_1Bxv9NC1aYtycKMf3DA4bP10', 15, 'Toktarbek Aigul', 'aigul88@mail.ru', 'Sakataeva 17', '', 'Shelek', 'Almaty obl', '36987', 'Qazaqstan', '9000.00', '783.00', '9783.00', '2items from Magazin Elshat.', 'charge', '2018-02-21 16:48:32'),
(12, 'ch_1BxvD0C1aYtycKMf90fAp9au', 16, 'Tokatarbek Elshat', 'elshat90@mail.ru', 'Satpaeva 12', '', 'Almaty', 'Almaty obl', '369875', 'Qazaqstan', '1450.00', '126.15', '1576.15', '1item from Magazin Elshat.', 'charge', '2018-02-21 16:52:17'),
(13, 'ch_1BxvMUC1aYtycKMf9PGISZdi', 17, 'Tokatarbek Elshat', 'elshat90@mail.ru', 'Satpaeva 12', '', 'Almaty', 'Almaty obl', '369875', 'Qazaqstan', '3700.00', '321.90', '4021.90', '1item from Magazin Elshat.', 'charge', '2018-02-21 17:02:06'),
(14, 'ch_1C4iCrC1aYtycKMf5cKPxSNT', 19, 'Tokatarbek Elshat', 'elshat90@mail.ru', 'Satpaeva 12', '', 'Almaty', 'Almaty obl', '369875', 'Qazaqstan', '15950.00', '1387.65', '17337.65', '4items from Magazin Elshat.', 'charge', '2018-03-12 10:24:14'),
(15, 'ch_1C6dOmC1aYtycKMfmOBdJxlB', 20, 'Tokatarbek Elshat', 'elshat90@mail.ru', 'Satpaeva 12', '', 'Almaty', 'Almaty obl', '369875', 'Qazaqstan', '5000.00', '435.00', '5435.00', '1item from Magazin Elshat.', 'charge', '2018-03-17 17:40:17');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `full_name` varchar(255) NOT NULL,
  `email` varchar(175) NOT NULL,
  `password` varchar(255) NOT NULL,
  `join_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_login` datetime NOT NULL,
  `permissions` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `full_name`, `email`, `password`, `join_date`, `last_login`, `permissions`) VALUES
(1, 'Elshat Toktarbek', 'elshat90@mail.ru', '$2y$10$p6kQu1Vm5ARR03qMjJIczOJWErwcCa/wS7aYWEMselVUnFqtrnUZe', '2018-02-13 16:50:51', '2018-03-31 14:32:54', 'admin,editor'),
(2, 'Zangar Kuantai', 'zangar90@mail.ru', '$2y$10$kTYhYhOrztQ.l9BbWjoyBuG1ARBh5pd7bS2HT6qkssEJV2UL7sABS', '2018-02-14 16:12:24', '2018-03-01 01:30:36', 'editor');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

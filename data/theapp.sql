-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jul 07, 2019 at 04:09 PM
-- Server version: 10.1.22-MariaDB
-- PHP Version: 7.1.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `theapp`
--

-- --------------------------------------------------------

--
-- Table structure for table `default_image`
--

CREATE TABLE `default_image` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `default_image`
--

INSERT INTO `default_image` (`id`, `name`, `title`, `image`) VALUES
(1, '1', '1', '35323182a3a81319d8f666f8668e22129fbd1cd6.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `sf_guard_forgot_password`
--

CREATE TABLE `sf_guard_forgot_password` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `unique_key` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `expires_at` datetime NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sf_guard_group`
--

CREATE TABLE `sf_guard_group` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sf_guard_group_permission`
--

CREATE TABLE `sf_guard_group_permission` (
  `group_id` bigint(20) NOT NULL DEFAULT '0',
  `permission_id` bigint(20) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sf_guard_permission`
--

CREATE TABLE `sf_guard_permission` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sf_guard_permission`
--

INSERT INTO `sf_guard_permission` (`id`, `name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'tournament', 'Tournament management', '2013-04-23 16:09:14', '2013-04-23 16:09:14'),
(2, 'match', 'Match management', '2013-04-23 16:09:18', '2013-04-23 16:09:18'),
(3, 'prognosis', 'Prognosis management', '2013-04-23 16:09:23', '2013-04-23 16:09:23'),
(4, 'team', 'Team management', '2013-04-23 16:19:28', '2013-04-23 16:19:28'),
(5, 'site_message', 'Site message management', '2013-09-10 11:50:33', '2013-09-10 11:50:33'),
(6, 'site_event', 'Site event management', '2013-09-10 11:50:38', '2013-09-10 11:50:38'),
(7, 'site_visit', 'Site visit management', '2013-09-10 17:15:28', '2013-09-10 17:15:28'),
(8, 'email_template', 'Email template management', '2013-10-12 20:11:01', '2013-10-12 20:11:01'),
(9, 'blog_post', 'Blog post management', '2014-01-08 14:05:04', '2014-01-08 14:05:04'),
(10, 'blog_post_comment', 'Blog post comment management', '2014-01-08 14:05:15', '2014-01-08 14:05:15'),
(11, 'blog_tag', 'Blog tag management', '2014-01-08 14:05:25', '2014-01-08 14:05:25'),
(12, 'settings_sys', 'Settings sys management', '2014-10-24 15:36:38', '2014-10-24 15:36:38'),
(13, 'email_error', 'Email error management', '2014-10-24 21:36:16', '2014-10-24 21:36:16'),
(14, 'wiki', 'Wiki management', '2014-10-25 14:19:58', '2014-10-25 14:19:58'),
(15, 'text_block', 'Text block management', '2014-10-27 12:14:44', '2014-10-27 12:14:44'),
(16, 'text_block_sys', 'Text block sys management', '2014-10-27 12:14:53', '2014-10-27 12:14:53'),
(17, 'localization', 'Localization management', '2014-10-27 22:02:34', '2014-10-27 22:02:34'),
(18, 'editor', 'Editor', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(19, 'redirect301', 'Redirect301 management', '2014-10-31 17:19:54', '2014-10-31 17:19:54'),
(20, 'testaurus', 'Testaurus management', '2016-04-11 13:37:10', '2016-04-11 13:37:10'),
(21, 'quizz_question', 'Quizz question management', '2017-01-06 18:17:00', '2017-01-06 18:17:00'),
(22, 'quizz_take', 'Quizz take management', '2017-01-18 16:18:00', '2017-01-18 16:18:00'),
(23, 'website', 'Website management', '2019-06-30 23:18:36', '2019-06-30 23:18:36'),
(24, 'website_project', 'Website project management', '2019-06-30 23:18:45', '2019-06-30 23:18:45');

-- --------------------------------------------------------

--
-- Table structure for table `sf_guard_remember_key`
--

CREATE TABLE `sf_guard_remember_key` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `remember_key` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ip_address` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sf_guard_remember_key`
--

INSERT INTO `sf_guard_remember_key` (`id`, `user_id`, `remember_key`, `ip_address`, `created_at`, `updated_at`) VALUES
(8, 1, '5kq1nj4zez4ssk0o8wcgkws8gcg4www', '127.0.0.1', '2019-07-07 16:56:19', '2019-07-07 16:56:19');

-- --------------------------------------------------------

--
-- Table structure for table `sf_guard_user`
--

CREATE TABLE `sf_guard_user` (
  `id` bigint(20) NOT NULL,
  `first_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email_address` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `username` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `algorithm` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'sha1',
  `salt` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `is_super_admin` tinyint(1) DEFAULT '0',
  `last_login` datetime DEFAULT NULL,
  `lang` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'en',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sf_guard_user`
--

INSERT INTO `sf_guard_user` (`id`, `first_name`, `last_name`, `email_address`, `username`, `algorithm`, `salt`, `password`, `is_active`, `is_super_admin`, `last_login`, `lang`, `created_at`, `updated_at`) VALUES
(1, 'Админ32', '', 'admin@admin.com', 'admin', 'sha1', '4b94b61d1e21fab73088930db9da4807', '14ebadf4cf6d65ba509fec1ee3d6a7e572c40098', 1, 1, '2019-07-07 16:56:19', 'en', '2014-11-08 23:12:31', '2019-07-07 16:56:19'),
(13, NULL, NULL, 'vanilla@rest.com', 'vanilla', 'sha1', '4b72ce7939f31dc5c34ad6d50a88f91e', 'bd7a6b77dea05c3df72ea1134c10e99e85bb1c59', 1, 1, NULL, 'en', '2018-06-17 01:25:41', '2018-06-17 01:25:41');

-- --------------------------------------------------------

--
-- Table structure for table `sf_guard_user_group`
--

CREATE TABLE `sf_guard_user_group` (
  `user_id` bigint(20) NOT NULL DEFAULT '0',
  `group_id` bigint(20) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sf_guard_user_permission`
--

CREATE TABLE `sf_guard_user_permission` (
  `user_id` bigint(20) NOT NULL DEFAULT '0',
  `permission_id` bigint(20) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `text_block`
--

CREATE TABLE `text_block` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `text` text COLLATE utf8_unicode_ci,
  `application` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `module` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `special_mark` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_visible_for_admin` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `text_block`
--

INSERT INTO `text_block` (`id`, `name`, `title`, `text`, `application`, `module`, `special_mark`, `is_visible_for_admin`) VALUES
(1702, 'About us', '', NULL, 'frontend', '', '', 0),
(1703, 'Teachers', '', NULL, 'frontend', '', '', 0),
(1704, 'Apply', '', NULL, 'frontend', '', '', 0),
(1705, 'Добро пожаловать', '', NULL, 'frontend', '', '', 0),
(1706, 'Вилькомна на обновленную версию нашего сайта!', NULL, NULL, 'frontend', NULL, NULL, 0),
(1707, 'Поехали!', NULL, NULL, 'frontend', NULL, NULL, 0),
(1708, 'My home', '', NULL, 'frontend', '', '', 0),
(1709, 'Take a quizz', '', NULL, 'frontend', '', '', 0),
(1710, 'Вход', '', NULL, 'frontend', '', '', 0),
(1711, 'Quizz is taken', '', NULL, 'frontend', '', '', 0),
(1712, 'This quizz has been taken! Please take another one', '', NULL, 'frontend', '', '', 0),
(1713, 'Your answers', '', NULL, 'frontend', '', '', 0),
(1714, 'You have scrored ', '', NULL, 'frontend', '', '', 0),
(1715, 'out of', '', NULL, 'frontend', '', '', 0),
(1716, 'Want to become a member?', '', NULL, 'frontend', '', '', 0),
(1717, 'Войти с помощью:', '', NULL, 'frontend', '', '', 0),
(1718, 'Логин (Ваш Email)', '', NULL, 'frontend', '', '', 0),
(1719, 'Password', '', NULL, 'frontend', '', '', 0),
(1720, 'Войти', '', NULL, 'frontend', '', '', 0),
(1721, 'Забыли пароль?', '', NULL, 'frontend', '', '', 0),
(1722, 'Регистрация', '', NULL, 'frontend', '', '', 0),
(1723, 'Your personal area', '', NULL, 'frontend', '', '', 0),
(1724, 'Заполните поле', '', NULL, 'frontend', '', '', 0),
(1725, 'The username and/or password is invalid.', '', NULL, 'frontend', '', '', 0),
(1726, 'Письмо отправлено', '', NULL, 'frontend', '', '', 0),
(1727, 'Ваш email', '', NULL, 'frontend', '', '', 0),
(1728, 'Восстановить пароль', '', NULL, 'frontend', '', '', 0),
(1731, 'пользовательского соглашения', '', NULL, 'frontend', '', '', 0),
(1732, 'Имя', '', NULL, 'frontend', '', '', 0),
(1733, 'Фамилия', '', NULL, 'frontend', '', '', 0),
(1734, 'Дата рождения(дд.мм.гггг)', '', NULL, 'frontend', '', '', 0),
(1735, 'Email', '', NULL, 'frontend', '', '', 0),
(1736, 'Телефон мобильный(для получения уведомлений)', '', NULL, 'frontend', '', '', 0),
(1737, 'About', '', NULL, 'frontend', '', '', 0),
(1738, 'Повторите пароль', '', NULL, 'frontend', '', '', 0),
(1739, 'Reload image', '', NULL, 'frontend', '', '', 0),
(1740, 'Введите код с картинки', NULL, NULL, 'frontend', NULL, NULL, 0),
(1741, 'Register now', '', NULL, 'frontend', '', '', 0),
(1742, 'Отменить', '', NULL, 'frontend', '', '', 0),
(1743, 'Применить', '', NULL, 'frontend', '', '', 0),
(1744, 'Мой профиль', '', NULL, 'frontend', '', '', 0),
(1745, 'Фотография', '', NULL, 'frontend', '', '', 0),
(1746, 'Изменить пароль', '', NULL, 'frontend', '', '', 0),
(1747, 'Сохранить изменения', '', NULL, 'frontend', '', '', 0),
(1748, 'Профиль', '', NULL, 'frontend', '', '', 0),
(1749, 'Выход', '', NULL, 'frontend', '', '', 0),
(1750, 'Админка', '', NULL, 'frontend', '', '', 0),
(1751, 'Вы можете выбрать зону, которая будет отображаться на ваших аватарках. Кликните по одному из изображений справа', '', NULL, 'frontend', '', '', 0),
(1752, 'remove the current file', '', NULL, 'frontend', '', '', 0),
(1753, 'Image', '', NULL, 'frontend', '', '', 0),
(1754, 'Сохранить', '', NULL, 'frontend', '', '', 0),
(1755, 'Вы уверены?', '', NULL, 'frontend', '', '', 0),
(1756, 'Удалить фотографию', '', NULL, 'frontend', '', '', 0),
(1757, 'Старый пароль', '', NULL, 'frontend', '', '', 0),
(1758, 'Новый пароль', '', NULL, 'frontend', '', '', 0),
(1759, 'Новый пароль еще раз', '', NULL, 'frontend', '', '', 0),
(1760, 'Сохранить пароль', '', NULL, 'frontend', '', '', 0),
(1761, 'Password is invalid.', '', NULL, 'frontend', '', '', 0),
(1762, 'Your answer:', '', NULL, 'frontend', '', '', 0),
(1763, 'Correct answer:', '', NULL, 'frontend', '', '', 0),
(1764, 'Previous', '', NULL, 'frontend', '', '', 0),
(1765, 'Next', '', NULL, 'frontend', '', '', 0),
(1766, 'Submit', '', NULL, 'frontend', '', '', 0),
(1767, 'Thank you for answering the quiestions!', '', NULL, 'frontend', '', '', 0),
(1774, 'День рождения', '', NULL, 'frontend', '', '', 0),
(1775, 'Номер телефона', '', NULL, 'frontend', '', '', 0),
(1776, 'Данные сохранены', '', NULL, 'frontend', '', '', 0),
(1777, 'Take the quizz', '', NULL, 'frontend', '', '', 0),
(1778, 'Вилькомна на обновленную версию нашего сайта!', NULL, NULL, 'frontend', NULL, NULL, 0),
(1779, 'Поехали!', NULL, NULL, 'frontend', NULL, NULL, 0),
(1780, 'Go to webpage', '', NULL, 'frontend', '', '', 0),
(1782, 'My news', '', NULL, 'frontend', '', '', 0),
(1783, 'Coming soon', '', NULL, 'frontend', '', '', 0),
(1784, 'Contact me', '', NULL, 'frontend', '', '', 0),
(1789, 'Powered by', '', NULL, 'frontend', '', '', 0),
(1790, 'My Quizzes', '', NULL, 'frontend', '', '', 0),
(1791, 'You haven\'t taken any quizzes so far', '', NULL, 'frontend', '', '', 0),
(1792, 'Take your first quizz', '', NULL, 'frontend', '', '', 0),
(1793, 'Show info', '', NULL, 'frontend', '', '', 0),
(1794, 'You scored %percent% on %date%', '', NULL, 'frontend', '', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `text_block_translation`
--

CREATE TABLE `text_block_translation` (
  `id` bigint(20) NOT NULL,
  `text` text,
  `lang` char(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `text_block_translation`
--

INSERT INTO `text_block_translation` (`id`, `text`, `lang`) VALUES
(1702, 'About us', 'en'),
(1702, 'О нас', 'ru'),
(1703, 'Teachers ', 'en'),
(1703, 'Учителя', 'ru'),
(1704, 'Apply for Quizzine', 'en'),
(1704, 'Подать заявку', 'ru'),
(1705, 'Welcome!', 'en'),
(1705, 'Добро пожаловать', 'ru'),
(1706, 'Вилькомна на обновленную версию нашего сайта!', 'ru'),
(1707, 'Поехали!', 'ru'),
(1708, 'My home', 'en'),
(1708, 'Домой!', 'ru'),
(1709, 'Take a quizz', 'en'),
(1709, 'Пройти тест', 'ru'),
(1710, 'Log in', 'en'),
(1710, 'Вход', 'ru'),
(1711, 'Quizz is taken', 'en'),
(1711, 'Тест пройден', 'ru'),
(1712, 'This quizz has been taken! Please take another one', 'en'),
(1712, 'Этот тест пройден! Пройдите еще один!', 'ru'),
(1713, 'Your answers', 'en'),
(1713, 'Ваши ответы', 'ru'),
(1714, 'You have scrored ', 'en'),
(1714, 'Вы набрали', 'ru'),
(1715, 'out of', 'en'),
(1715, 'из', 'ru'),
(1716, 'Want to become a member?', 'en'),
(1716, 'Хотите стать участником?', 'ru'),
(1717, 'Log in with:', 'en'),
(1717, 'Войти с помощью:', 'ru'),
(1718, 'Login(Your email)', 'en'),
(1718, 'Логин (Ваш Email)', 'ru'),
(1719, 'Password', 'en'),
(1719, 'Пароль', 'ru'),
(1720, 'Log in', 'en'),
(1720, 'Войти', 'ru'),
(1721, 'Forgot your password?', 'en'),
(1721, 'Забыли пароль?', 'ru'),
(1722, 'Register with us', 'en'),
(1722, 'Регистрация', 'ru'),
(1723, 'Your personal area', 'en'),
(1723, 'Ваш личный кабинет', 'ru'),
(1724, 'This field is required', 'en'),
(1724, 'Заполните поле', 'ru'),
(1725, 'The username and/or password is invalid.', 'en'),
(1725, 'Неверный логин или  имя пользователя', 'ru'),
(1726, 'The email has been sent', 'en'),
(1726, 'Письмо отправлено', 'ru'),
(1727, 'Your email', 'en'),
(1727, 'Ваш email', 'ru'),
(1728, 'Password recovery', 'en'),
(1728, 'Восстановить пароль', 'ru'),
(1729, 'This field is required', 'en'),
(1729, 'Заполните поле', 'ru'),
(1730, 'Register', 'en'),
(1731, 'user agreement', 'en'),
(1731, 'пользовательского соглашения', 'ru'),
(1732, 'First name', 'en'),
(1732, 'Имя', 'ru'),
(1733, 'Last name', 'en'),
(1733, 'Фамилия', 'ru'),
(1734, 'Birthday', 'en'),
(1734, 'Дата рождения\r\n(дд.мм.гггг)', 'ru'),
(1735, 'Email', 'en'),
(1735, 'Email', 'ru'),
(1736, 'Phone number', 'en'),
(1736, 'Номер телефона', 'ru'),
(1737, 'A  few words about yourself', 'en'),
(1737, 'Немного о себе', 'ru'),
(1738, 'Password again', 'en'),
(1738, 'Пароль еще раз', 'ru'),
(1739, 'Reload image', 'en'),
(1739, 'Обновить картинку', 'ru'),
(1740, 'Введите код с картинки', 'en'),
(1741, 'Register now', 'en'),
(1741, 'Зарегистрироваться', 'ru'),
(1742, 'Cancel', 'en'),
(1742, 'Отменить', 'ru'),
(1743, 'Apply', 'en'),
(1743, 'Применить', 'ru'),
(1744, 'My profile', 'en'),
(1744, 'Мой профиль', 'ru'),
(1745, 'Photo', 'en'),
(1745, 'Фотография', 'ru'),
(1746, 'Change your password', 'en'),
(1746, 'Изменить пароль', 'ru'),
(1747, 'Save changes', 'en'),
(1747, 'Сохранить изменения', 'ru'),
(1748, 'Profile', 'en'),
(1748, 'Профиль', 'ru'),
(1749, 'Log out', 'en'),
(1749, 'Выход', 'ru'),
(1750, 'Administrator', 'en'),
(1750, 'Админка', 'ru'),
(1751, 'You can crop the area that you want to display on your avatar', 'en'),
(1751, 'Вы можете выбрать зону, которая будет отображаться на ваших аватарках. Кликните по одному из изображений справа', 'ru'),
(1752, 'remove the current file', 'en'),
(1752, 'удалить текущий файл', 'ru'),
(1753, 'Image', 'en'),
(1753, 'Картинка', 'ru'),
(1754, 'Save', 'en'),
(1754, 'Сохранить', 'ru'),
(1755, 'Are you sure?', 'en'),
(1755, 'Вы уверены?', 'ru'),
(1756, 'Delete photo', 'en'),
(1756, 'Удалить фотографию', 'ru'),
(1757, 'Old password', 'en'),
(1757, 'Старый пароль', 'ru'),
(1758, 'New password', 'en'),
(1758, 'Новый пароль', 'ru'),
(1759, 'New password again', 'en'),
(1759, 'Новый пароль еще раз', 'ru'),
(1760, 'Update password', 'en'),
(1760, 'Новый пароль еще раз', 'ru'),
(1761, 'Password is invalid.', 'en'),
(1761, 'Неверный пароль', 'ru'),
(1762, 'Your answer:', 'en'),
(1762, 'Ваш ответ:', 'ru'),
(1763, 'Correct answer:', 'en'),
(1763, 'Правильный ответ:', 'ru'),
(1764, 'Previous', 'en'),
(1764, 'Назад', 'ru'),
(1765, 'Next', 'en'),
(1765, 'Вперед', 'ru'),
(1766, 'Submit', 'en'),
(1766, 'Отправить', 'ru'),
(1767, 'Thank you for answering the quiestions!', 'en'),
(1767, 'Спасибо, что ответили на вопросы!', 'ru'),
(1768, 'Дата рождения\n(дд.мм.гггг)', 'en'),
(1769, 'Телефон мобильный\n(для получения уведомлений)', 'en'),
(1770, 'Birthday', 'en'),
(1770, 'Новый пароль еще раз', 'ru'),
(1771, 'Phone number', 'en'),
(1771, 'Номер телефона', 'ru'),
(1772, 'Дата рождения\n(дд.мм.гггг)', 'en'),
(1773, 'Телефон мобильный\n(для получения уведомлений)', 'en'),
(1774, 'You birthday', 'en'),
(1774, 'День рождения', 'ru'),
(1775, 'Phone number', 'en'),
(1775, 'Номер телефона', 'ru'),
(1776, 'Changes have been saved', 'en'),
(1776, 'Данные сохранены', 'ru'),
(1777, 'Take the quizz', 'en'),
(1777, 'Пройти тест', 'ru'),
(1778, 'Вилькомна на обновленную версию нашего сайта!', 'en'),
(1779, 'Поехали!', 'en'),
(1780, 'Go to webpage', 'en'),
(1780, 'Перейти на страницу', 'ru'),
(1781, 'Go to webpage', 'en'),
(1782, 'My news', 'en'),
(1782, 'Мои новости', 'ru'),
(1783, 'Coming soon', 'en'),
(1783, 'Уже скоро...', 'ru'),
(1784, 'Contact me', 'en'),
(1784, 'Связаться со мной', 'ru'),
(1785, 'My news', 'ru'),
(1786, 'Coming soon', 'ru'),
(1787, 'Contact me', 'ru'),
(1788, 'Powered by', 'ru'),
(1789, 'Powered by', 'en'),
(1789, 'Разработано: ', 'ru'),
(1790, 'My Quizzes', 'en'),
(1790, ' Мои тесты', 'ru'),
(1791, 'You haven\'t taken any quizzes so far', 'en'),
(1791, 'Вы пока не прошли ни одного теста', 'ru'),
(1792, 'Take your first quizz', 'en'),
(1792, 'Пройти свой первый тест', 'ru'),
(1793, 'Show info', 'en'),
(1793, 'Просмотр', 'ru'),
(1794, 'You scored %percent% on %date%', 'en'),
(1794, 'Вы набрали %percent% %date%', 'ru');

-- --------------------------------------------------------

--
-- Table structure for table `website`
--

CREATE TABLE `website` (
  `id` bigint(20) NOT NULL,
  `namespace` varchar(255) DEFAULT NULL,
  `host` varchar(255) DEFAULT NULL,
  `is_secure` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `website`
--

INSERT INTO `website` (`id`, `namespace`, `host`, `is_secure`) VALUES
(1, 'MambaRu', 'www.mamba.ru', 1),
(2, 'MicrotaskerMe', 'microtasker.me', 1),
(3, 'SwinglifeRu', 'www.swinglife.ru', 1),
(4, 'VkCom', 'vk.com', 1),
(5, 'Youtube', 'www.youtube.com', 1),
(6, 'YandexBy', 'yandex.by', 1);

-- --------------------------------------------------------

--
-- Table structure for table `website_project`
--

CREATE TABLE `website_project` (
  `id` bigint(20) NOT NULL,
  `website_id` bigint(20) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `codebase_type` varchar(255) DEFAULT 'input',
  `codebase_file` varchar(255) DEFAULT NULL,
  `codebase_input` text,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `website_project`
--

INSERT INTO `website_project` (`id`, `website_id`, `name`, `codebase_type`, `codebase_file`, `codebase_input`, `created_at`, `updated_at`) VALUES
(1, 1, 'Mambieren', 'file', '/MambaRu/Mambieren/code.js', '', '2019-06-30 23:24:32', '2019-07-02 16:39:24'),
(2, 2, 'MicrotaskerTestApp', 'input', NULL, NULL, '2019-07-02 12:12:50', '2019-07-02 12:12:50'),
(3, 3, 'AccountSwitcher', 'file', '/SwinglifeRu/AccountSwitcher.js', '$content.append(\"welcome to Swinglife Accounts Manager\");', '2019-07-02 16:59:29', '2019-07-05 12:50:33'),
(4, 4, 'WebsiteBanner', 'input', '', '$(\'body\').html(\'This site is banned by the Website Banner!\');', '2019-07-02 17:05:16', '2019-07-02 17:05:16'),
(5, 1, 'AccountSwitcher', 'file', '/MambaRu/AccountSwitcher.js', '', '2019-07-03 09:20:30', '2019-07-03 09:20:30'),
(6, 5, 'Comments&ViewMoreBlocker', 'input', '', 'setInterval(function(){\r\n $(\'ytd-compact-video-renderer\').hide();\r\n$(\'#comments\').hide();\r\n$(\'#info\').hide();\r\n$(\'.ytd-subscribe-button-renderer\').hide();\r\n}, 500);\r\nwindow.$ = $;', '2019-07-03 19:22:03', '2019-07-04 19:32:04'),
(7, 6, 'ContentFilter', 'input', '', '$(\'body\').html(\'Sorry\');', '2019-07-05 12:01:46', '2019-07-05 12:02:31'),
(8, 3, 'ContentFilter', 'file', '/SwinglifeRu/ContentFilter.js', '', '2019-07-05 12:51:14', '2019-07-05 12:51:14');

-- --------------------------------------------------------

--
-- Table structure for table `website_project2sf_guard_user`
--

CREATE TABLE `website_project2sf_guard_user` (
  `website_project_id` bigint(20) NOT NULL,
  `sf_guard_user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `website_project2sf_guard_user`
--

INSERT INTO `website_project2sf_guard_user` (`website_project_id`, `sf_guard_user_id`) VALUES
(1, 1),
(1, 13),
(2, 1),
(2, 13),
(3, 1),
(3, 13),
(4, 1),
(4, 13),
(5, 1),
(5, 13),
(6, 1),
(6, 13),
(7, 1),
(7, 13),
(8, 1),
(8, 13);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `default_image`
--
ALTER TABLE `default_image`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sf_guard_forgot_password`
--
ALTER TABLE `sf_guard_forgot_password`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id_idx` (`user_id`);

--
-- Indexes for table `sf_guard_group`
--
ALTER TABLE `sf_guard_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `sf_guard_group_permission`
--
ALTER TABLE `sf_guard_group_permission`
  ADD PRIMARY KEY (`group_id`,`permission_id`),
  ADD KEY `sf_guard_group_permission_permission_id_sf_guard_permission_id` (`permission_id`);

--
-- Indexes for table `sf_guard_permission`
--
ALTER TABLE `sf_guard_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `sf_guard_remember_key`
--
ALTER TABLE `sf_guard_remember_key`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id_idx` (`user_id`);

--
-- Indexes for table `sf_guard_user`
--
ALTER TABLE `sf_guard_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email_address` (`email_address`),
  ADD UNIQUE KEY `username` (`username`),
  ADD KEY `is_active_idx_idx` (`is_active`);

--
-- Indexes for table `sf_guard_user_group`
--
ALTER TABLE `sf_guard_user_group`
  ADD PRIMARY KEY (`user_id`,`group_id`),
  ADD KEY `sf_guard_user_group_group_id_sf_guard_group_id` (`group_id`);

--
-- Indexes for table `sf_guard_user_permission`
--
ALTER TABLE `sf_guard_user_permission`
  ADD PRIMARY KEY (`user_id`,`permission_id`),
  ADD KEY `sf_guard_user_permission_permission_id_sf_guard_permission_id` (`permission_id`);

--
-- Indexes for table `text_block`
--
ALTER TABLE `text_block`
  ADD PRIMARY KEY (`id`),
  ADD KEY `section_index_idx` (`application`,`module`);

--
-- Indexes for table `text_block_translation`
--
ALTER TABLE `text_block_translation`
  ADD PRIMARY KEY (`id`,`lang`);

--
-- Indexes for table `website`
--
ALTER TABLE `website`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `website_project`
--
ALTER TABLE `website_project`
  ADD PRIMARY KEY (`id`),
  ADD KEY `website_id_idx` (`website_id`);

--
-- Indexes for table `website_project2sf_guard_user`
--
ALTER TABLE `website_project2sf_guard_user`
  ADD PRIMARY KEY (`website_project_id`,`sf_guard_user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `default_image`
--
ALTER TABLE `default_image`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `sf_guard_forgot_password`
--
ALTER TABLE `sf_guard_forgot_password`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sf_guard_group`
--
ALTER TABLE `sf_guard_group`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sf_guard_permission`
--
ALTER TABLE `sf_guard_permission`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
--
-- AUTO_INCREMENT for table `sf_guard_remember_key`
--
ALTER TABLE `sf_guard_remember_key`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `sf_guard_user`
--
ALTER TABLE `sf_guard_user`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `text_block`
--
ALTER TABLE `text_block`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1795;
--
-- AUTO_INCREMENT for table `website`
--
ALTER TABLE `website`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `website_project`
--
ALTER TABLE `website_project`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `sf_guard_forgot_password`
--
ALTER TABLE `sf_guard_forgot_password`
  ADD CONSTRAINT `sf_guard_forgot_password_user_id_sf_guard_user_id` FOREIGN KEY (`user_id`) REFERENCES `sf_guard_user` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sf_guard_group_permission`
--
ALTER TABLE `sf_guard_group_permission`
  ADD CONSTRAINT `sf_guard_group_permission_group_id_sf_guard_group_id` FOREIGN KEY (`group_id`) REFERENCES `sf_guard_group` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `sf_guard_group_permission_permission_id_sf_guard_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `sf_guard_permission` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sf_guard_remember_key`
--
ALTER TABLE `sf_guard_remember_key`
  ADD CONSTRAINT `sf_guard_remember_key_user_id_sf_guard_user_id` FOREIGN KEY (`user_id`) REFERENCES `sf_guard_user` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sf_guard_user_group`
--
ALTER TABLE `sf_guard_user_group`
  ADD CONSTRAINT `sf_guard_user_group_group_id_sf_guard_group_id` FOREIGN KEY (`group_id`) REFERENCES `sf_guard_group` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `sf_guard_user_group_user_id_sf_guard_user_id` FOREIGN KEY (`user_id`) REFERENCES `sf_guard_user` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sf_guard_user_permission`
--
ALTER TABLE `sf_guard_user_permission`
  ADD CONSTRAINT `sf_guard_user_permission_permission_id_sf_guard_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `sf_guard_permission` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `sf_guard_user_permission_user_id_sf_guard_user_id` FOREIGN KEY (`user_id`) REFERENCES `sf_guard_user` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.6.21 - MySQL Community Server (GPL)
-- Server OS:                    Win32
-- HeidiSQL version:             7.0.0.4197
-- Date/time:                    2016-04-30 11:00:31
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping structure for table dev_single.app_error
CREATE TABLE IF NOT EXISTS `app_error` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `description` text COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table dev_single.app_error: ~8 rows (approximately)
/*!40000 ALTER TABLE `app_error` DISABLE KEYS */;
INSERT INTO `app_error` (`id`, `description`, `created_at`, `updated_at`) VALUES
	(1, 'Unknown site event {user_created_by_admin}', '2013-09-14 14:51:56', '2013-09-14 14:51:56'),
	(2, 'Unknown site event {password_recovery_request}', '2013-09-16 15:53:48', '2013-09-16 15:53:48'),
	(3, 'Unknown site event {password_recovery_request}', '2014-10-26 21:42:16', '2014-10-26 21:42:16'),
	(4, 'Unknown site event {password_recovery_request}', '2014-10-26 21:59:48', '2014-10-26 21:59:48'),
	(5, 'Unknown site event {password_recovery_request}', '2014-10-26 22:01:26', '2014-10-26 22:01:26'),
	(6, 'Could not find Email template: social_bridge_user_confirm_email_user', '2014-11-05 17:58:20', '2014-11-05 17:58:20'),
	(7, 'Could not find Email template: social_bridge_user_confirm_email_user', '2014-11-05 17:58:48', '2014-11-05 17:58:48'),
	(8, 'Could not find Email template: social_bridge_user_confirm_email_user', '2014-11-05 17:59:00', '2014-11-05 17:59:00');
/*!40000 ALTER TABLE `app_error` ENABLE KEYS */;


-- Dumping structure for table dev_single.banned_ip
CREATE TABLE IF NOT EXISTS `banned_ip` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ip` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `reason` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table dev_single.banned_ip: ~3 rows (approximately)
/*!40000 ALTER TABLE `banned_ip` DISABLE KEYS */;
INSERT INTO `banned_ip` (`id`, `ip`, `reason`, `created_at`, `updated_at`) VALUES
	(1, '192.168.1.3', 'Invalid signin attempt', '2014-10-27 01:49:16', '2014-10-27 01:49:16'),
	(2, '192.168.1.3', 'Invalid signin attempt', '2014-10-27 14:12:40', '2014-10-27 14:12:40'),
	(3, '192.168.1.3', 'Invalid signin attempt', '2014-10-28 07:40:59', '2014-10-28 07:40:59');
/*!40000 ALTER TABLE `banned_ip` ENABLE KEYS */;


-- Dumping structure for table dev_single.blog_post
CREATE TABLE IF NOT EXISTS `blog_post` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `date` date NOT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `brief` text COLLATE utf8_unicode_ci,
  `extra` text COLLATE utf8_unicode_ci,
  `text` longtext COLLATE utf8_unicode_ci,
  `is_published` tinyint(1) DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `meta_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_keywords` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `blog_post_sluggable_idx` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table dev_single.blog_post: ~0 rows (approximately)
/*!40000 ALTER TABLE `blog_post` DISABLE KEYS */;
INSERT INTO `blog_post` (`id`, `name`, `date`, `image`, `brief`, `extra`, `text`, `is_published`, `created_at`, `updated_at`, `meta_title`, `meta_description`, `meta_keywords`, `slug`) VALUES
	(1, 'Тестовый бложик', '2014-10-10', NULL, '', '', '', 0, '2014-11-01 11:54:50', '2014-11-01 13:48:25', 'Тестовый бложик', '', '', 'testovyy-blozhik');
/*!40000 ALTER TABLE `blog_post` ENABLE KEYS */;


-- Dumping structure for table dev_single.blog_post2_blog_tag
CREATE TABLE IF NOT EXISTS `blog_post2_blog_tag` (
  `blog_post_id` bigint(20) NOT NULL DEFAULT '0',
  `blog_tag_id` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`blog_post_id`,`blog_tag_id`),
  KEY `blog_post2_blog_tag_blog_tag_id_blog_tag_id` (`blog_tag_id`),
  CONSTRAINT `blog_post2_blog_tag_blog_post_id_blog_post_id` FOREIGN KEY (`blog_post_id`) REFERENCES `blog_post` (`id`) ON DELETE CASCADE,
  CONSTRAINT `blog_post2_blog_tag_blog_tag_id_blog_tag_id` FOREIGN KEY (`blog_tag_id`) REFERENCES `blog_tag` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table dev_single.blog_post2_blog_tag: ~0 rows (approximately)
/*!40000 ALTER TABLE `blog_post2_blog_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `blog_post2_blog_tag` ENABLE KEYS */;


-- Dumping structure for table dev_single.blog_post_comment
CREATE TABLE IF NOT EXISTS `blog_post_comment` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `blog_post_id` bigint(20) NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  `is_published` tinyint(1) DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `blog_post_id_idx` (`blog_post_id`),
  CONSTRAINT `blog_post_comment_blog_post_id_blog_post_id` FOREIGN KEY (`blog_post_id`) REFERENCES `blog_post` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table dev_single.blog_post_comment: ~0 rows (approximately)
/*!40000 ALTER TABLE `blog_post_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `blog_post_comment` ENABLE KEYS */;


-- Dumping structure for table dev_single.blog_tag
CREATE TABLE IF NOT EXISTS `blog_tag` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table dev_single.blog_tag: ~0 rows (approximately)
/*!40000 ALTER TABLE `blog_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `blog_tag` ENABLE KEYS */;


-- Dumping structure for table dev_single.cms_language
CREATE TABLE IF NOT EXISTS `cms_language` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table dev_single.cms_language: ~3 rows (approximately)
/*!40000 ALTER TABLE `cms_language` DISABLE KEYS */;
INSERT INTO `cms_language` (`id`, `name`, `is_active`) VALUES
	(1, 'en', 1),
	(2, 'ru', 1),
	(3, 'de', 0);
/*!40000 ALTER TABLE `cms_language` ENABLE KEYS */;


-- Dumping structure for table dev_single.cms_module
CREATE TABLE IF NOT EXISTS `cms_module` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `model` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `model_sitemap_callback` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `show_route` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table dev_single.cms_module: ~8 rows (approximately)
/*!40000 ALTER TABLE `cms_module` DISABLE KEYS */;
INSERT INTO `cms_module` (`id`, `name`, `is_active`, `model`, `model_sitemap_callback`, `show_route`) VALUES
	(1, 'default', 1, NULL, NULL, NULL),
	(2, 'contactus', 1, NULL, NULL, NULL),
	(3, 'auth', 1, NULL, NULL, NULL),
	(4, 'register', 1, NULL, NULL, NULL),
	(5, 'sitemap', 1, NULL, NULL, NULL),
	(6, 'news', 1, 'News', NULL, NULL),
	(7, 'profile', 1, NULL, NULL, NULL),
	(8, 'usage', 1, 'Usage', NULL, 'usage_show');
/*!40000 ALTER TABLE `cms_module` ENABLE KEYS */;


-- Dumping structure for table dev_single.cms_runtime_error
CREATE TABLE IF NOT EXISTS `cms_runtime_error` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `description` text COLLATE utf8_unicode_ci,
  `url` text COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table dev_single.cms_runtime_error: ~0 rows (approximately)
/*!40000 ALTER TABLE `cms_runtime_error` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_runtime_error` ENABLE KEYS */;


-- Dumping structure for table dev_single.config
CREATE TABLE IF NOT EXISTS `config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` text COLLATE utf8_unicode_ci,
  `help` text COLLATE utf8_unicode_ci,
  `display` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `section` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'settings',
  `type` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'text',
  `type_enum_values` text COLLATE utf8_unicode_ci,
  `use_wysiwyg` tinyint(1) DEFAULT '0',
  `is_localized` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table dev_single.config: ~35 rows (approximately)
/*!40000 ALTER TABLE `config` DISABLE KEYS */;
INSERT INTO `config` (`id`, `name`, `title`, `value`, `help`, `display`, `section`, `type`, `type_enum_values`, `use_wysiwyg`, `is_localized`) VALUES
	(1, 'menu_create_page', 'Создавать страницы при создании пунктов меню', '0', NULL, 'system', 'settings', 'text', NULL, 0, 0),
	(2, 'administrator_email', 'Email администратора', 'alex@demo.web375.org', 'На этот адрес вам будут приходить сообщения с сайта', 'user', 'settings', 'text', NULL, 0, 0),
	(3, 'smtp_server', 'Smtp server', 'smtp.yandex.ru', NULL, 'system', 'system', 'text', NULL, 0, 0),
	(4, 'smtp_port', 'Smtp port', '465', NULL, 'system', 'system', 'text', NULL, 0, 0),
	(5, 'smtp_mailbox', 'Smpt mailbox', 'noreply@demo.web375.org', NULL, 'system', 'system', 'text', NULL, 0, 0),
	(6, 'smtp_password', 'Smtp password', 'password', NULL, 'system', 'system', 'text', NULL, 0, 0),
	(7, 'smtp_display_name', 'Имя отправителя почты', 'DEV2, Администрация', 'От этого имени сайт будет отправлять почту', 'user', 'settings', 'text', NULL, 0, 1),
	(8, 'oauth_enabled_providers', 'Oauth enabled providers', 'facebook, vkontakte, google, yandex, mailru, twitter', NULL, 'system', 'system', 'text', NULL, 0, 0),
	(10, 'auth_signin_after_register', 'Auth sign in after register', 'no', NULL, 'system', 'system', 'text', NULL, 0, 0),
	(11, 'auth_password_recovery_hash_lifetime', 'auth_password_recovery_hash_lifetime', '1 DAY', NULL, 'system', 'system', 'text', NULL, 0, 0),
	(12, 'ip_ban_lifetime', 'ip_ban_lifetime', '1 HOUR', NULL, 'system', 'system', 'text', NULL, 0, 0),
	(13, 'auth_invalid_signin_attempt_captcha', 'auth_invalid_signin_attempt_captcha', '3', NULL, 'system', 'system', 'text', NULL, 0, 0),
	(14, 'auth_invalid_signin_attempt_ipban', 'auth_invalid_signin_attempt_captcha', '5', NULL, 'system', 'system', 'text', NULL, 0, 0),
	(15, 'project_name', 'Project name', 'dev2', NULL, 'system', 'system', 'text', NULL, 0, 0),
	(16, 'project_code', 'Project code', 'dev2', NULL, 'system', 'system', 'text', NULL, 0, 0),
	(17, 'project_lang', 'Language', 'ru', NULL, 'system', 'system', 'text', NULL, 0, 0),
	(18, 'address', 'Адрес', 'Беларусь, Минск, ул. Есенина 16, кв.201', NULL, 'user', 'settings', 'text', NULL, 0, 1),
	(19, 'phone', 'Контактный телефон', '+375 29 5099234', NULL, 'user', 'settings', 'text', NULL, 0, 0),
	(20, 'email', 'Контактный email', 'alex@web375.org', NULL, 'user', 'settings', 'text', NULL, 0, 0),
	(21, 'oauth_facebook_app_id', 'oauth_facebook_app_id', '1483299011959399', NULL, NULL, 'system', 'text', NULL, 0, 0),
	(22, 'oauth_facebook_app_secret', 'oauth_facebook_app_secret', 'c91accabff9f4f2b126cd0859e0052d8', NULL, NULL, 'system', 'text', NULL, 0, 0),
	(23, 'oauth_vkontakte_app_id', 'oauth_vkontakte_app_id', '4620022', NULL, NULL, 'system', 'text', NULL, 0, 0),
	(24, 'oauth_vkontakte_app_secret', 'oauth_vkontakte_app_secret', 'FApHH3DcQ9Dmv9xLVjF1', NULL, NULL, 'system', 'text', NULL, 0, 0),
	(25, 'oauth_google_app_id', 'oauth_google_app_id', '557060359028-9prslto9gpof6f1aucjbpjctu417vjho.apps.googleusercontent.com', NULL, NULL, 'system', 'text', NULL, 0, 0),
	(26, 'oauth_google_app_secret', 'oauth_google_app_secret', 'kCMBZcSetVfOX2taPCqW-5hz', NULL, NULL, 'system', 'text', NULL, 0, 0),
	(27, 'oauth_yandex_app_id', 'oauth_yandex_app_id', '235e3ba3c8564c3490ced014ec9f27e9', NULL, NULL, 'system', 'text', NULL, 0, 0),
	(28, 'oauth_yandex_app_secret', 'oauth_yandex_app_secret', '77d57636b5294ce68b66447a0421e71a', NULL, NULL, 'system', 'text', NULL, 0, 0),
	(29, 'oauth_mailru_app_id', 'oauth_mailru_app_id', '726534', NULL, NULL, 'system', 'text', NULL, 0, 0),
	(30, 'oauth_mailru_app_secret', 'oauth_mailru_app_secret', '9cd5757535b6b89d6367fb515422ca31', NULL, NULL, 'system', 'text', NULL, 0, 0),
	(31, 'oauth_twitter_app_id', 'oauth_twitter_app_id', 'p4FZyNRT1MiK7jY6Y740FyJUx', NULL, NULL, 'system', 'text', NULL, 0, 0),
	(32, 'oauth_twitter_app_secret', 'oauth_twitter_app_secret', '06VCSymUDonUPRhWUKHaxQrxgmSPOHKMD8psSpw7XNBeKjzRNG', NULL, NULL, 'system', 'text', NULL, 0, 0),
	(33, 'oauth_google_api_key', NULL, 'AIzaSyD5jzkDZWSal-EdHq2h3mEmUauO3h4Sh_U', NULL, NULL, 'system', 'text', NULL, 0, 0),
	(34, 'oauth_google_app_name', NULL, 'DEMO', NULL, NULL, 'system', 'text', NULL, 0, 0),
	(35, 'map_zoom', NULL, '10', NULL, NULL, 'settings', 'text', NULL, 0, 0),
	(36, 'map_center', NULL, '53.9,27.566667', NULL, NULL, 'settings', 'text', NULL, 0, 0);
/*!40000 ALTER TABLE `config` ENABLE KEYS */;


-- Dumping structure for table dev_single.default_image
CREATE TABLE IF NOT EXISTS `default_image` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table dev_single.default_image: ~0 rows (approximately)
/*!40000 ALTER TABLE `default_image` DISABLE KEYS */;
INSERT INTO `default_image` (`id`, `name`, `title`, `image`) VALUES
	(1, '1', '1', '35323182a3a81319d8f666f8668e22129fbd1cd6.jpg');
/*!40000 ALTER TABLE `default_image` ENABLE KEYS */;


-- Dumping structure for table dev_single.email_error
CREATE TABLE IF NOT EXISTS `email_error` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `email_from` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email_to` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `subject` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `body` text COLLATE utf8_unicode_ci,
  `cc` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `file` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `errmes` text COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table dev_single.email_error: ~4 rows (approximately)
/*!40000 ALTER TABLE `email_error` DISABLE KEYS */;
INSERT INTO `email_error` (`id`, `email_from`, `email_to`, `subject`, `body`, `cc`, `file`, `errmes`, `created_at`, `updated_at`) VALUES
	(1, '', 'alexey.radyuk@gmail.com', 'TEST', 'TEST', '', '', 'Address in mailbox given [] does not comply with RFC 2822, 3.6.2.', '2014-10-24 22:05:00', '2014-10-24 22:05:00'),
	(2, '', 'alexey.radyuk@gmail.com', 'test', 'test', '', '', 'Address in mailbox given [] does not comply with RFC 2822, 3.6.2.', '2014-10-24 22:08:29', '2014-10-24 22:08:29'),
	(3, '', 'alexey.radyuk@gmail.com', 'test', 'test', '', '', 'Address in mailbox given [] does not comply with RFC 2822, 3.6.2.', '2014-10-24 22:09:42', '2014-10-24 22:09:42'),
	(4, '', 'alexey.radyuk@gmail.com', 'test', 'test', '', '', 'Address in mailbox given [] does not comply with RFC 2822, 3.6.2.', '2014-10-24 22:15:23', '2014-10-24 22:15:23');
/*!40000 ALTER TABLE `email_error` ENABLE KEYS */;


-- Dumping structure for table dev_single.email_template
CREATE TABLE IF NOT EXISTS `email_template` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `subject` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `message` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table dev_single.email_template: ~6 rows (approximately)
/*!40000 ALTER TABLE `email_template` DISABLE KEYS */;
INSERT INTO `email_template` (`id`, `name`, `subject`, `message`) VALUES
	(1, 'registration_user', 'Регистрация на проекте DEV2', 'Здравствуйте, {%first_name%}! Вы успешно прошли регистрацию! Перейдите по {%link%}, чтобы активировать свой аккаунт!'),
	(2, 'registration_admin', 'Регистрация нового пользователя', 'Пользователь {%full_name%} зарегистрировался'),
	(3, 'password_recovery_user', 'Восстановление пароля', 'Доброго времени суток, {%full_name%} Вы запросили воcстановление пароля на сайте Dev2.Перейдите по {%LINK%} для установки нового пароля.Если запрос отправляли не Вы, проигнорируйте это письмо.'),
	(4, 'contactus_message_user', 'Проект DEV2. Ваше сообщение очень важно для нас!', 'Уважаемый {%name%}! Спасибо за Ваше сообщение! Оно очень важно для нас!'),
	(5, 'contactus_message_admin', 'Проект DEV2. Новое сообщение', 'Некто {%name%} прислал сообщение. Текст: {%message%} E-Mail: {%email%}'),
	(6, 'social_bridge_user_confirm_email_user', 'demo.web375.org - Подтверждение электронного адреса в соцсети {%network_name%}', 'Подтвердите Email {%email%}, перейдя по ссылке {%link%} Либо используйте данный код {%token%} ');
/*!40000 ALTER TABLE `email_template` ENABLE KEYS */;


-- Dumping structure for table dev_single.forgot_password
CREATE TABLE IF NOT EXISTS `forgot_password` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id_idx` (`user_id`),
  CONSTRAINT `forgot_password_user_id_sf_guard_user_id` FOREIGN KEY (`user_id`) REFERENCES `sf_guard_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table dev_single.forgot_password: ~0 rows (approximately)
/*!40000 ALTER TABLE `forgot_password` DISABLE KEYS */;
/*!40000 ALTER TABLE `forgot_password` ENABLE KEYS */;


-- Dumping structure for table dev_single.localization
CREATE TABLE IF NOT EXISTS `localization` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `model` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `pk` bigint(20) NOT NULL,
  `field` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `ru` text COLLATE utf8_unicode_ci,
  `en` text COLLATE utf8_unicode_ci,
  `de` text COLLATE utf8_unicode_ci,
  `es` text COLLATE utf8_unicode_ci,
  `it` text COLLATE utf8_unicode_ci,
  `fr` text COLLATE utf8_unicode_ci,
  `pt` text COLLATE utf8_unicode_ci,
  `sv` text COLLATE utf8_unicode_ci,
  `fi` text COLLATE utf8_unicode_ci,
  `no` text COLLATE utf8_unicode_ci,
  `nl` text COLLATE utf8_unicode_ci,
  `pl` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `main_idx` (`model`,`pk`,`field`)
) ENGINE=InnoDB AUTO_INCREMENT=389 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table dev_single.localization: ~382 rows (approximately)
/*!40000 ALTER TABLE `localization` DISABLE KEYS */;
INSERT INTO `localization` (`id`, `model`, `pk`, `field`, `ru`, `en`, `de`, `es`, `it`, `fr`, `pt`, `sv`, `fi`, `no`, `nl`, `pl`) VALUES
	(1, 'Page', 1, 'name', 'Добро пожаловать!', 'Welcome!', 'Herzlich Willkommen!', '¡Bienvenido!', 'Benvenuto!', 'Bienvenue!', 'Bem-vindo!', 'Välkomna!', 'Tervetuloa!', 'Velkommen!', 'Welkom!', 'Witamy!'),
	(2, 'Page', 1, 'content', 'Привет тебе, юный друг! Ты попал на этот сайт, потому что тебе самому нужен сайт. А может быть, ты просто зашел сюда случайно! В любом случае, добро пожаловать!', 'Greetings to you, young friend! You came to this site because you yourself need a website. Or maybe you just came here by accident! In any case, welcome!', 'Grüße an Sie, junger Freund! Sie kam auf diese Seite, weil Sie sich eine Website benötigen. Oder vielleicht sind Sie gerade hierher gekommen durch Zufall! Auf jeden Fall willkommen!', 'Saludos a usted, joven amigo! Usted vino a este sitio porque tienes a ti mismo necesita un sitio web. O tal vez usted acaba de venir aquí por accidente! En cualquier caso, bienvenido!', 'Saluti a te, giovane amico! Siete venuti a questo sito perché tu stesso bisogno di un sito web. O forse siete venuti qui per caso! In ogni caso, benvenuto!', 'Salutations à vous, jeune ami! Vous êtes venu sur ce site parce que vous vous avez besoin d\'un site web. Ou peut-être vous ne venez ici que par accident! En tout cas, bienvenue!', 'Saudações a você, jovem amigo! Você veio a este site, porque você mesmo precisa de um site. Ou talvez você só veio aqui por acaso! De qualquer forma, bem-vindo!', 'Hälsningar till dig, unge vän! Du kom till denna plats eftersom du själv behöver en hemsida. Eller kanske du bara kom hit av en slump! I varje fall, välkommen!', 'Terveisiä teille, nuori ystäväni! Tulit tämän sivuston, koska et itse tarvitse verkkosivuilla. Tai ehkä vain tullut tänne sattumalta! Joka tapauksessa, tervetuloa!', 'Hilsen til deg, unge venn! Du kom til dette området fordi du selv trenger et nettsted. Eller kanskje du bare kom hit ved en tilfeldighet! I alle fall, velkommen!', 'Groeten aan u, jonge vriend! Je kwam op deze site omdat u zelf een website nodig. Of misschien heb je net kwam hier per ongeluk! In ieder geval van harte welkom!', 'Pozdrowienia dla Ciebie, młody przyjacielu! Przyszedłeś do tej strony, bo sam potrzebuje strony internetowej. A może po prostu przyszedł tu przez przypadek! W każdym razie, witamy!'),
	(3, 'Page', 1, 'meta_title', 'Добро пожаловать на сайт проекта DEV2!', 'Welcome to the website of the project DEV2!', 'Willkommen auf der Webseite des Projekts DEV2!', 'Bienvenido a la página web de la DEV2 proyecto!', 'Benvenuti nel sito del DEV2 progetto!', 'Bienvenue sur le site de la DEV2 de projet!', 'Bem vindo ao site da DEV2 projeto!', 'Välkommen till webbplatsen för projektet dev2!', 'Tervetuloa verkkosivuilla hankkeen DEV2!', 'Velkommen til nettsiden til prosjektet DEV2!', 'Welkom op de website van het project DEV2!', 'Witamy na stronie internetowej DEV2 projektu!'),
	(4, 'Page', 1, 'meta_description', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(5, 'Page', 1, 'meta_keywords', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(6, 'Page', 2, 'name', 'О нас', 'About Us', 'Über uns', 'Sobre nosotros', 'Chi siamo', 'À propos de nous', 'Sobre nós', 'Om oss', 'Meistä', 'Om oss', 'Over ons', 'O nas'),
	(7, 'Page', 2, 'content', 'Мы молодая, но уже очень опытная компания, занимающаяся разработкой и продвижением веб-сайтов', 'We are a young but already very experienced company engaged in the development and promotion of web sites', 'Wir sind ein junges, aber bereits sehr erfahrenes Unternehmen in der Entwicklung und Förderung von Web-Seiten engagiert', 'Somos una empresa joven, pero ya con mucha experiencia dedicada al desarrollo y promoción de sitios web', 'Siamo una società giovane ma già molto esperto impegnata nello sviluppo e nella promozione di siti web', 'Nous sommes une entreprise jeune mais déjà très expérimenté engagé dans le développement et la promotion de sites Web', 'Somos uma empresa jovem, mas já muito experiente envolvida no desenvolvimento e promoção de sítios web', 'Vi är en ung men redan mycket erfarna företag som arbetar med utveckling och främjande av webbplatser', 'Olemme nuori, mutta jo hyvin kokenut yritys harjoittaa kehittäminen ja edistäminen sivustoja', 'Vi er en ung, men allerede svært erfaren selskap engasjert i utvikling og markedsføring av nettsider', 'Wij zijn een jonge, maar al zeer ervaren bedrijf die zich bezighouden met de ontwikkeling en promotie van websites', 'Jesteśmy młodym, ale już bardzo doświadczona firma zajmuje się rozwojem i promocją stron internetowych'),
	(8, 'Page', 2, 'meta_title', 'О проекте', 'About the project', 'Über das Projekt', 'Sobre el proyecto', 'Informazioni sul progetto', 'Sur le projet', 'Sobre o projeto', 'Om projektet', 'Tietoa hankkeesta', 'Om prosjektet', 'Over het project', 'O projekcie'),
	(9, 'Page', 2, 'meta_description', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(10, 'Page', 2, 'meta_keywords', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(11, 'Page', 3, 'name', 'Обратная связь', 'Feedback', 'Rückkopplung', 'Realimentación', 'Feedback', 'Réaction', 'Qualificações', 'Respons', 'Palaute', 'Tilbakemelding', 'Terugkoppeling', 'Sprzężenie zwrotne'),
	(12, 'Page', 3, 'content', 'Отправьте нам сообщение и мы свяжемся с Вами как можно быстрее!', 'Send us a message and we will contact you as soon as possible!', 'Senden Sie uns eine Nachricht und wir werden uns so schnell wie möglich kontaktieren!', 'Envíenos un mensaje y nos pondremos en contacto con usted lo antes posible!', 'Inviaci un messaggio e ti contatteremo al più presto!', 'Envoyez-nous un message et nous vous contacterons dès que possible!', 'Envie-nos uma mensagem e nós entraremos em contato com você o mais breve possível!', 'Skicka ett meddelande till oss så kontaktar vi dig så snart som möjligt!', 'Lähetä meille viesti ja otamme sinuun yhteyttä mahdollisimman pian!', 'Send oss ​​en melding og vi vil kontakte deg så snart som mulig!', 'Stuur ons een bericht en wij zullen zo spoedig mogelijk contact met u mogelijk!', 'Wyślij do nas wiadomość, a my skontaktujemy się z Tobą tak szybko, jak to możliwe!'),
	(13, 'Page', 3, 'meta_title', 'Обратная связь - Проект DEV2', 'Contact Us - Project DEV2', 'Kontakt - Projekt DEV2', 'Contáctenos - Proyecto DEV2', 'Contattaci - Progetto DEV2', 'Contactez-nous - Projet DEV2', 'Fale Conosco - Projeto DEV2', 'Kontakta oss - Project dev2', 'Ota yhteyttä - Project DEV2', 'Kontakt oss - Prosjekt DEV2', 'Neem contact met ons - Project DEV2', 'Kontakt - Projekt DEV2'),
	(14, 'Page', 3, 'meta_description', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(15, 'Page', 3, 'meta_keywords', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(16, 'Page', 4, 'name', 'Регистрация', 'Registration', 'Anmeldung', 'Registro', 'Registrazione', 'Inscription', 'Registro', 'Registrering', 'Rekisteröinti', 'Registrering', 'Registratie', 'Rejestracja'),
	(17, 'Page', 4, 'content', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(18, 'Page', 4, 'meta_title', 'Регистрация', 'Registration', 'Anmeldung', 'Registro', 'Registrazione', 'Inscription', 'Registro', 'Registrering', 'Rekisteröinti', 'Registrering', 'Registratie', 'Rejestracja'),
	(19, 'Page', 4, 'meta_description', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(20, 'Page', 4, 'meta_keywords', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(21, 'Page', 5, 'name', 'Восстановление пароля', 'Password recovery', 'Passwort-Wiederherstellung', 'Recuperar la contraseña', 'Il recupero della password', 'Récupération de mot de passe', 'Recuperação de senha', 'Lösenordshämtning', 'Salasanan palautus', 'Passordgjenoppretting', 'Wachtwoord herstel', 'Odzyskiwanie hasła'),
	(22, 'Page', 5, 'content', 'Нажмите кнопку "Восстановить пароль" и на указанный Вами при регистрации адрес электронной почты придет ссылка на восстановление пароля. ', 'Click "Recover Password" and we\'ll send an email to your email account that will link to the password recovery page', 'Klicken Sie auf "Passwort wiederherstellen" und wir schicken eine E-Mail, um Ihre E-Mail-Konto, das auf die Passwort-Wiederherstellung Verlinken senden', 'Haga clic en "Recuperar contraseña" y le enviaremos un e-mail a su cuenta de correo electrónico que enlazará a la página de recuperación de contraseñas', 'Clicca "recupera password" e ti invieremo una e-mail al tuo account di posta elettronica che collegherà alla pagina di recupero password', 'Cliquez sur "Récupérer mot de passe" et nous vous enverrons un e-mail à votre compte de messagerie qui reliera à la page de récupération de mot de passe', 'Clique em "Recuperar Senha" e nós enviaremos um e-mail para a sua conta de e-mail que vai ligar para a página de recuperação de password', 'Klicka på "Återställ lösenord" så skickar vi ett mail till ditt e-postkonto som kommer att länka till återställning av lösenord sidan', 'Klikkaa "Palauta salasana" ja me Lähetä sähköpostia sähköpostiviestejä, jotka viittaavat salasanan palautussivulle', 'Klikk "Gjenopprett passord", så sender vi en e-post til e-postkontoen som skal knytte til siden for passordgjenoppretting', 'Klik op "Wachtwoord opvragen" en we zullen een e-mail om uw e-mailaccount wordt gelinkt naar de pagina voor wachtwoordherstel te sturen', 'Kliknij przycisk "Odzyskaj hasło", a my wyślemy wiadomość e-mail do konta e-mail, który będzie odnośnik do strony odzyskiwania hasła'),
	(23, 'Page', 5, 'meta_title', 'Восстановление пароля', 'Password recovery', 'Passwort-Wiederherstellung', 'Recuperar la contraseña', 'Il recupero della password', 'Récupération de mot de passe', 'Recuperação de senha', 'Lösenordshämtning', 'Salasanan palautus', 'Passordgjenoppretting', 'Wachtwoord herstel', 'Odzyskiwanie hasła'),
	(24, 'Page', 5, 'meta_description', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(25, 'Page', 5, 'meta_keywords', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(26, 'Page', 6, 'name', 'Восстановление пароля. Выслано письмо.', 'Password recovery. Email sent.', 'Passwort-Wiederherstellung. E-Mail gesendet.', 'Recuperación de la contraseña. Correo electrónico enviado.', 'Il recupero della password. Email inviata.', 'Récupération de mot de passe. E-mail envoyé.', 'Recuperação de senha. E-mail enviado.', 'Återställning av lösenord. E-post skickas.', 'Salasanan palautus. Sähköposti lähetetty.', 'Passordgjenoppretting. E-post sendt.', 'Wachtwoord herstel. E-mail verzonden.', 'Odzyskanie hasła. E-mail wysłany.'),
	(27, 'Page', 6, 'content', 'На указанный вами Email-адрес выслано письмо.', 'Email has been sent to your email account', 'E-Mail wurde an Ihre E-Mail-Konto gesendet wurden', 'El correo electrónico ha sido enviado a su cuenta de correo electrónico', 'E-mail è stata inviata al tuo indirizzo di posta elettronica', 'Le courriel a été envoyé à votre compte de messagerie', 'E-mail foi enviado para sua conta de e-mail', 'E-post har skickats till ditt e-postkonto', 'Sähköposti on lähetetty sähköpostiviestejä', 'E-post har blitt sendt til din e-postkonto', 'E-mail is verzonden naar uw e-mailaccount verzonden', 'E-mail został wysłany do konta e-mail'),
	(28, 'Page', 6, 'meta_title', 'Восстановление пароля. Выслано письмо.', 'Password recovery. Email sent.', 'Passwort-Wiederherstellung. E-Mail gesendet.', 'Recuperación de la contraseña. Correo electrónico enviado.', 'Il recupero della password. Email inviata.', 'Récupération de mot de passe. E-mail envoyé.', 'Recuperação de senha. E-mail enviado.', 'Återställning av lösenord. E-post skickas.', 'Salasanan palautus. Sähköposti lähetetty.', 'Passordgjenoppretting. E-post sendt.', 'Wachtwoord herstel. E-mail verzonden.', 'Odzyskanie hasła. E-mail wysłany.'),
	(29, 'Page', 6, 'meta_description', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(30, 'Page', 6, 'meta_keywords', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(31, 'Page', 7, 'name', 'Восстановление пароля. Отправлено СМС', 'Password recovery. sent SMS', 'Passwort-Wiederherstellung. gesendeten SMS', 'Recuperación de la contraseña. SMS enviado', 'Il recupero della password. SMS inviati', 'Récupération de mot de passe. SMS envoyé', 'Recuperação de senha. SMS enviado', 'Återställning av lösenord. skickas SMS', 'Salasanan palautus. lähetetty tekstiviesti', 'Passordgjenoppretting. sendte SMS', 'Wachtwoord herstel. verzonden SMS', 'Odzyskanie hasła. wysłany SMS'),
	(32, 'Page', 7, 'content', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(33, 'Page', 7, 'meta_title', 'Восстановление пароля. Отправлено СМС', 'Password recovery. sent SMS', 'Passwort-Wiederherstellung. gesendeten SMS', 'Recuperación de la contraseña. SMS enviado', 'Il recupero della password. SMS inviati', 'Récupération de mot de passe. SMS envoyé', 'Recuperação de senha. SMS enviado', 'Återställning av lösenord. skickas SMS', 'Salasanan palautus. lähetetty tekstiviesti', 'Passordgjenoppretting. sendte SMS', 'Wachtwoord herstel. verzonden SMS', 'Odzyskanie hasła. wysłany SMS'),
	(34, 'Page', 7, 'meta_description', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(35, 'Page', 7, 'meta_keywords', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(36, 'Page', 8, 'name', 'Придумайте новый пароль', 'Invent a new password', 'Erfinde ein neues Passwort', 'Inventar una nueva contraseña', 'Inventa una nuova password', 'Inventer un nouveau mot de passe', 'Invente uma nova senha', 'Uppfinna ett nytt lösenord', 'Keksi uusi salasana', 'Oppfinne et nytt passord', 'Verzin een nieuw wachtwoord', 'Wymyślać nowe hasło'),
	(37, 'Page', 8, 'content', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(38, 'Page', 8, 'meta_title', 'Придумайте новый пароль', 'Invent a new password', 'Erfinde ein neues Passwort', 'Inventar una nueva contraseña', 'Inventa una nuova password', 'Inventer un nouveau mot de passe', 'Invente uma nova senha', 'Uppfinna ett nytt lösenord', 'Keksi uusi salasana', 'Oppfinne et nytt passord', 'Verzin een nieuw wachtwoord', 'Wymyślać nowe hasło'),
	(39, 'Page', 8, 'meta_description', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(40, 'Page', 8, 'meta_keywords', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(41, 'Page', 9, 'name', 'Вход в личный кабинет', 'Your Personal Area', 'Ihr persönlicher Bereich', 'Su área personal', 'Il tuo Personal Area', 'Votre espace personnel', 'Sua área pessoal', 'Din Personal Area', 'Henkilökohtainen Area', 'Din Personal Area', 'Uw Personal Area', 'Twój Personal Area'),
	(42, 'Page', 9, 'content', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(43, 'Page', 9, 'meta_title', 'Вход в личный кабинет', 'Your Personal Area', 'Ihr persönlicher Bereich', 'Su área personal', 'Il tuo Personal Area', 'Votre espace personnel', 'Sua área pessoal', 'Din Personal Area', 'Henkilökohtainen Area', 'Din Personal Area', 'Uw Personal Area', 'Twój Personal Area'),
	(44, 'Page', 9, 'meta_description', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(45, 'Page', 9, 'meta_keywords', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(46, 'Page', 10, 'name', 'Регистрация пройдена', 'Registration is passed', 'Registrierung übergeben wird', 'Se pasa Registro', 'La registrazione è passato', 'L\'inscription est passée', 'Registo é passado', 'Anmälan skickas', 'Rekisteröinti johdetaan', 'Registrering er passert', 'Registratie is gepasseerd', 'Rejestracja jest przekazywane'),
	(47, 'Page', 10, 'content', 'На указанный Вами email-адрес выслано письмо с инструкцией регистрации', 'We emailed further registration instructions to your email address', 'Wir gemailt weitere Registrierung Anweisungen, um Ihre E-Mail-Adresse', 'Les enviamos más instrucciones de registro a su dirección de correo electrónico', 'Abbiamo contattato ulteriori istruzioni per la registrazione al vostro indirizzo e-mail', 'Nous avons envoyé de nouvelles instructions d\'inscription à votre adresse e-mail', 'Enviámos uma mensagem mais instruções de inscrição para o seu endereço de e-mail', 'Vi mailade ytterligare registreringsinstruktioner till din e-postadress', 'Me lähetetään edelleen ilmoittautumisohjeet sähköpostiisi', 'Vi mailet ytterligere instruksjoner registrering til din e-postadresse', 'We gemaild verdere registratie instructies om je e-mailadres', 'Wysłaliśmy e-mail z dalszymi instrukcjami rejestracji na adres e-mail'),
	(48, 'Page', 10, 'meta_title', 'Регистрация пройдена', 'Registration is passed', 'Registrierung übergeben wird', 'Se pasa Registro', 'La registrazione è passato', 'L\'inscription est passée', 'Registo é passado', 'Anmälan skickas', 'Rekisteröinti johdetaan', 'Registrering er passert', 'Registratie is gepasseerd', 'Rejestracja jest przekazywane'),
	(49, 'Page', 10, 'meta_description', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(50, 'Page', 10, 'meta_keywords', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(51, 'Page', 11, 'name', 'Активация пройдена', 'Activation is passed', 'Die Aktivierung ist bestanden', 'Se pasa de activación', 'L\'attivazione è passato', 'L\'activation est passé', 'A activação é passado', 'Aktivering ledes', 'Aktivointi on kulunut', 'Aktivering er passert', 'Activering afgelopen', 'Aktywacja jest przekazywane'),
	(52, 'Page', 11, 'content', 'Теперь вы можете войти в Личный кабинет!', 'Now you can login!', 'Jetzt können Sie sich einloggen!', 'Ahora puede iniciar sesión!', 'Ora è possibile effettuare il login!', 'Maintenant, vous pouvez vous connecter!', 'Agora você pode fazer o login!', 'Nu kan du logga in!', 'Nyt voit kirjautua sisään!', 'Nå kan du logge inn!', 'Nu kun je inloggen!', 'Teraz możesz zalogować się!'),
	(53, 'Page', 11, 'meta_title', 'Активация пройдена', 'Activation is passed', 'Die Aktivierung ist bestanden', 'Se pasa de activación', 'L\'attivazione è passato', 'L\'activation est passé', 'A activação é passado', 'Aktivering ledes', 'Aktivointi on kulunut', 'Aktivering er passert', 'Activering afgelopen', 'Aktywacja jest przekazywane'),
	(54, 'Page', 11, 'meta_description', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(55, 'Page', 11, 'meta_keywords', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(56, 'Page', 12, 'name', 'Пользовательское соглашение', 'User Agreement', 'Benutzervereinbarung', 'Acuerdo del usuario', 'Accordo per gli utenti', 'Accord de l\'utilisateur', 'Contrato de Usuário', 'Användaravtalet', 'Käyttäjäsopimus', 'Brukeravtale', 'Gebruikersovereenkomst', 'Umowa z użytkownikiem'),
	(57, 'Page', 12, 'content', 'Здесь абсолютно типичное пользовательское соглашение', 'Here is an absolutely typical user agreement', 'Hier ist ein absolut typisches Anwenderabkommen', 'Aquí es un acuerdo absolutamente usuario típico', 'Ecco un dell\'accordo di utilizzazione assolutamente tipico', 'Voici un accord tout à fait typique de l\'utilisateur', 'Aqui está um acordo de usuário absolutamente típico', 'Här är ett avtal helt typisk användare', 'Täällä on aivan tyypillinen käyttäjä sopimus', 'Her er en helt vanlig brukeravtalen', 'Hier is een absoluut typische gebruiker akkoord', 'Oto absolutnie typowy Umowa użytkownika'),
	(58, 'Page', 12, 'meta_title', 'Пользовательское соглашение', 'User Agreement', 'Benutzervereinbarung', 'Acuerdo del usuario', 'Accordo per gli utenti', 'Accord de l\'utilisateur', 'Contrato de Usuário', 'Användaravtalet', 'Käyttäjäsopimus', 'Brukeravtale', 'Gebruikersovereenkomst', 'Umowa z użytkownikiem'),
	(59, 'Page', 12, 'meta_description', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(60, 'Page', 12, 'meta_keywords', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(61, 'Page', 13, 'name', 'Политика конфиденциальности', 'Privacy policy', 'Datenschutz-Bestimmungen', 'Política de privacidad', 'Politica sulla riservatezza', 'Politique de confidentialité', 'Política de Privacidade', 'Integritetspolicy', 'Yksityisyyden suoja', 'Personvern', 'Privacy beleid', 'Polityka prywatności'),
	(62, 'Page', 13, 'content', 'Здесь абсолютно типичная страница про политику конфиденциальности', 'Here is an absolutely typical page about privacy policy', 'Hier ist ein absolut typisches Seite über Datenschutzbestimmungen', 'Aquí es una página absolutamente típica sobre la política de privacidad', 'Questa è una pagina assolutamente tipica privacy policy', 'Voici une page tout à fait typique de la politique de confidentialité', 'Aqui está uma página absolutamente típico sobre a política de privacidade', 'Här är en helt vanlig sida om integritetspolicy', 'Täällä on aivan tyypillinen sivu Tietoja Tietosuoja', 'Her er en helt vanlig side om personvernreglene', 'Hier is een absoluut typisch pagina over privacybeleid', 'Oto absolutnie typowa strona o polityce prywatności'),
	(63, 'Page', 13, 'meta_title', 'Политика конфиденциальности', 'Privacy policy', 'Datenschutz-Bestimmungen', 'Política de privacidad', 'Politica sulla riservatezza', 'Politique de confidentialité', 'Política de Privacidade', 'Integritetspolicy', 'Yksityisyyden suoja', 'Personvern', 'Privacy beleid', 'Polityka prywatności'),
	(64, 'Page', 13, 'meta_description', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(65, 'Page', 13, 'meta_keywords', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(66, 'Page', 14, 'name', 'Закрытый раздел', 'A Closed Forum', 'Forum geschlossen', 'Un Foro Cerrado', 'Il forum è chiuso', 'Un forum fermé', 'A Forum Closed', 'Ett stängt forum', 'Suljettu foorumi', 'En lukket forum', 'Een gesloten forum', 'Zamknięty Forum'),
	(67, 'Page', 14, 'content', 'Если вы зашли на эту страницу, значит вы авторизованный пользователь!', 'If you come across this page, it means you are an authorized user!', 'Wenn Sie über diese Seite kommen, bedeutet das, Sie ein autorisierter Benutzer sind!', 'Si usted viene a través de esta página, significa que usted es un usuario autorizado!', 'Se vi imbattete in questa pagina, significa che siete un utente autorizzato!', 'Si vous tombez sur cette page, cela signifie que vous êtes un utilisateur autorisé!', 'Se você se deparar com essa página, isso significa que você é um usuário autorizado!', 'Om du stöter på den här sidan, betyder det att du är en behörig användare!', 'Jos törmäät tämän sivun, se tarkoittaa, että olet valtuutettu käyttäjä!', 'Hvis du kommer over denne siden, betyr det at du er en autorisert bruker!', 'Als u over deze pagina, betekent dit dat u een geautoriseerde gebruiker!', 'Jeśli natkniesz się na tej stronie, oznacza to, że jesteś upoważniony użytkownik!'),
	(68, 'Page', 14, 'meta_title', 'Закрытый раздел', 'A Closed Forum', 'Forum geschlossen', 'Un Foro Cerrado', 'Il forum è chiuso', 'Un forum fermé', 'A Forum Closed', 'Ett stängt forum', 'Suljettu foorumi', 'En lukket forum', 'Een gesloten forum', 'Zamknięty Forum'),
	(69, 'Page', 14, 'meta_description', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(70, 'Page', 14, 'meta_keywords', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(71, 'Page', 15, 'name', 'Это тестовая страница', 'This is a test page', 'Dies ist eine Testseite', 'Esta es una página de prueba', 'Questa è una pagina di prova', 'Ceci est une page de test', 'Esta é uma página de teste', 'Detta är en testsida', 'Tämä on testi sivu', 'Dette er en testside', 'Dit is een test pagina', 'To jest strona testowa'),
	(72, 'Page', 15, 'content', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(73, 'Page', 15, 'meta_title', 'Это тестовая страница', 'This is a test page', 'Dies ist eine Testseite', 'Esta es una página de prueba', 'Questa è una pagina di prova', 'Ceci est une page de test', 'Esta é uma página de teste', 'Detta är en testsida', 'Tämä on testi sivu', 'Dette er en testside', 'Dit is een test pagina', 'To jest strona testowa'),
	(74, 'Page', 15, 'meta_description', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(75, 'Page', 15, 'meta_keywords', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(76, 'Page', 16, 'name', 'Ошибка 404', 'Error 404', 'Error 404', 'Error 404', 'Errore 404', 'Erreur 404', 'Erro 404', 'Error 404', 'Virhe 404', 'Feil 404', 'Error 404', 'Błąd 404'),
	(77, 'Page', 16, 'content', 'Ошибка 404. Страница не найдена', 'Error 404. Page not found', 'Fehler 404 Seite nicht gefunden', 'Error 404. Página no encontrada', 'Errore 404 Pagina non trovata', 'Erreur 404. Page non trouvée', 'Erro 404. Página não encontrada', 'Fel 404. Sidan kunde inte hittas', 'Error 404. Sivua ei löydy', 'Feil 404. Siden ble ikke funnet', 'Fout 404. Pagina niet gevonden', 'Nie znaleziono błąd 404. Page'),
	(78, 'Page', 16, 'meta_title', 'Ошибка 404', 'Error 404', 'Error 404', 'Error 404', 'Errore 404', 'Erreur 404', 'Erro 404', 'Error 404', 'Virhe 404', 'Feil 404', 'Error 404', 'Błąd 404'),
	(79, 'Page', 16, 'meta_description', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(80, 'Page', 16, 'meta_keywords', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(81, 'Page', 17, 'name', 'Мой профиль', 'My Profile', 'Mein Profil', 'Mi Perfil', 'Il mio profilo', 'Mon profil', 'Meu Perfil', 'Min profil', 'Oma profiili', 'Min profil', 'Mijn Profiel', 'Mój profil'),
	(82, 'Page', 17, 'content', 'Здесь вы можете отредактировать Ваши личные данные, загрузить фотографию и поменять пароль', 'Here you can edit your personal information, upload a photo and to change the password', 'Hier können Sie Ihre persönlichen Daten zu bearbeiten, ein Foto hochladen und das Passwort ändern', 'Aquí puede editar su información personal, subir una foto y para cambiar la contraseña', 'Qui è possibile modificare le informazioni personali, caricare una foto e cambiare la password', 'Ici, vous pouvez modifier vos informations personnelles, télécharger une photo et de changer le mot de passe', 'Aqui você pode editar suas informações pessoais, fazer upload de uma foto e alterar a senha', 'Här kan du redigera din personliga information, ladda upp ett foto och att ändra lösenordet', 'Täällä voit muokata henkilökohtaisia ​​tietoja, ladata kuvan ja vaihtaa salasanan', 'Her kan du redigere dine personlige opplysninger, laste opp et bilde og for å endre passordet', 'Hier kunt u uw persoonlijke gegevens wijzigen, upload een foto en om het wachtwoord te wijzigen', 'Tutaj możesz edytować swoje dane osobowe, przesłać zdjęcie i zmienić hasło'),
	(83, 'Page', 17, 'meta_title', 'Мой профиль', 'My Profile', 'Mein Profil', 'Mi Perfil', 'Il mio profilo', 'Mon profil', 'Meu Perfil', 'Min profil', 'Oma profiili', 'Min profil', 'Mijn Profiel', 'Mój profil'),
	(84, 'Page', 17, 'meta_description', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(85, 'Page', 17, 'meta_keywords', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(86, 'Page', 18, 'name', 'Мой профиль - Изменить пароль', 'My profile - Change password', 'Mein Profil - Passwort ändern', 'Mi perfil - Cambiar mi contraseña', 'Il mio profilo - Modifica password', 'Mon profil - Modifier le mot', 'Meu perfil - Alterar senha', 'Min profil - Ändra lösenord', 'Oma profiili - Vaihda salasana', 'Min profil - Endre passord', 'Mijn profiel - Wijzig wachtwoord', 'Mój profil - Zmiana hasła'),
	(87, 'Page', 18, 'content', 'Мы храним Ваш пароль в зашифрованном виде. Кроме Вас его не знает никто', 'We store your password in encrypted form.', 'Wir speichern Ihr Passwort in verschlüsselter Form.', 'Almacenamos su contraseña en forma encriptada.', 'Le password vengono memorizzate in forma criptata.', 'Nous conservons votre mot de passe sous forme cryptée.', 'Nós armazenamos sua senha de forma criptografada.', 'Vi lagrar ditt lösenord i krypterad form.', 'Tallennamme salasanasi salatussa muodossa.', 'Vi lagrer passordet ditt i kryptert form.', 'We bewaren uw wachtwoord in versleutelde vorm.', 'Możemy przechowywać hasła w postaci zaszyfrowanej.'),
	(88, 'Page', 18, 'meta_title', 'Мой профиль - Изменить пароль', 'My profile - Change password', 'Mein Profil - Passwort ändern', 'Mi perfil - Cambiar mi contraseña', 'Il mio profilo - Modifica password', 'Mon profil - Modifier le mot', 'Meu perfil - Alterar senha', 'Min profil - Ändra lösenord', 'Oma profiili - Vaihda salasana', 'Min profil - Endre passord', 'Mijn profiel - Wijzig wachtwoord', 'Mój profil - Zmiana hasła'),
	(89, 'Page', 18, 'meta_description', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(90, 'Page', 18, 'meta_keywords', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(91, 'Page', 19, 'name', 'Мой профиль - Изменить фотографию', 'My profile - Edit photo', 'Mein Profil - Edit Foto', 'Mi perfil - Editar foto', 'Il mio profilo - Modifica foto', 'Mon profil - Modifier photo', 'Meu perfil - Editar foto', 'Min profil - Redigera foto', 'Oma profiili - Muokkaa kuva', 'Min profil - Rediger bilde', 'Mijn profiel - Foto bewerken', 'Mój profil - Edycja zdjęć'),
	(92, 'Page', 19, 'content', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(93, 'Page', 19, 'meta_title', 'Мой профиль - Изменить фотографию', 'My profile - Edit photo', 'Mein Profil - Edit Foto', 'Mi perfil - Editar foto', 'Il mio profilo - Modifica foto', 'Mon profil - Modifier photo', 'Meu perfil - Editar foto', 'Min profil - Redigera foto', 'Oma profiili - Muokkaa kuva', 'Min profil - Rediger bilde', 'Mijn profiel - Foto bewerken', 'Mój profil - Edycja zdjęć'),
	(94, 'Page', 19, 'meta_description', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(95, 'Page', 19, 'meta_keywords', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(96, 'Page', 20, 'name', 'IP-адресс заблокирован', 'IP-address is blocked', 'IP-Adresse blockiert wird', 'Dirección IP está bloqueada', 'Indirizzo IP è bloccato', 'Adresse IP est bloquée', 'Endereço IP é bloqueado', 'IP-adress är blockerad', 'IP-osoite on estetty', 'IP-adresse er blokkert', 'IP-adres is geblokkeerd', 'Adres IP jest zablokowany'),
	(97, 'Page', 20, 'content', 'К сожалению, по неясным причинам ваш адрес был заблокирован! Спасибо!', 'Unfortunately, for unclear reasons, your address has been blocked! Thank you!', 'Leider unklaren Gründen, Ihre Adresse wurde gesperrt! Danke!', 'Lamentablemente, por razones poco claras, su dirección ha sido bloqueado! Gracias!', 'Purtroppo, per motivi non chiari, il tuo indirizzo è stato bloccato! Grazie!', 'Malheureusement, pour des raisons obscures, votre adresse a été bloqué! Merci!', 'Infelizmente, por razões pouco claras, o seu endereço foi bloqueado! Obrigado!', 'Tyvärr, på oklara grunder, din adress har blockerats! Tack!', 'Valitettavasti selville, miksi osoitteesi on estetty! Kiitos!', 'Dessverre, for uklare grunner, din adresse har blitt blokkert! Takk!', 'Helaas, om onduidelijke redenen, uw adres is geblokkeerd! Dank je wel!', 'Niestety, z niejasnych powodów, twój adres został zablokowany! Dziękujemy!'),
	(98, 'Page', 20, 'meta_title', 'IP-адресс заблокирован', 'IP-address is blocked', 'IP-Adresse blockiert wird', 'Dirección IP está bloqueada', 'Indirizzo IP è bloccato', 'Adresse IP est bloquée', 'Endereço IP é bloqueado', 'IP-adress är blockerad', 'IP-osoite on estetty', 'IP-adresse er blokkert', 'IP-adres is geblokkeerd', 'Adres IP jest zablokowany'),
	(99, 'Page', 20, 'meta_description', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(100, 'Page', 20, 'meta_keywords', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(101, 'Page', 21, 'name', 'Необходима авторизация', 'Please register or login', 'Bitte registrieren oder einloggen', 'Por favor, registrarse o', 'Registrati o fai il login', 'Se il vous plaît inscrivez-vous ou connectez-vous', 'Por favor registre-se ou login', 'Vänligen registrera eller logga in', 'Ole hyvä ja rekisteröidy tai kirjaudu sisään', 'Vennligst registrer deg eller logg inn', 'Gelieve te registreren of inloggen', 'Zaloguj się lub zarejestruj'),
	(102, 'Page', 21, 'content', 'Чтобы посмотреть содержимое этого раздела, необходимо авторизоваться', 'To see the contents of this section, please log in', 'Um den Inhalt dieses Abschnitts sehen, bitte melden Sie sich an', 'Para ver el contenido de esta sección, por favor conectarse', 'Per visualizzare il contenuto di questa sezione, fai il login', 'Pour voir le contenu de cette section, se il vous plaît connectez-vous', 'Para ver o conteúdo desta seção, faça seu login', 'För att se innehållet i det här avsnittet, vänligen logga in', 'Nähdä sisällön tämän osion, kirjaudu sisään', 'For å se innholdet i denne delen, må du logge inn', 'Om de inhoud van deze sectie te zien, gelieve in te loggen', 'Aby zobaczyć zawartość tej sekcji zaloguj się'),
	(103, 'Page', 21, 'meta_title', 'Необходима авторизация', 'Please register or login', 'Bitte registrieren oder einloggen', 'Por favor, registrarse o', 'Registrati o fai il login', 'Se il vous plaît inscrivez-vous ou connectez-vous', 'Por favor registre-se ou login', 'Vänligen registrera eller logga in', 'Ole hyvä ja rekisteröidy tai kirjaudu sisään', 'Vennligst registrer deg eller logg inn', 'Gelieve te registreren of inloggen', 'Zaloguj się lub zarejestruj'),
	(104, 'Page', 21, 'meta_description', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(105, 'Page', 21, 'meta_keywords', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(106, 'TextBlock', 1, 'text', 'Имя пользователя', 'Username', 'Benutzername', 'Nombre de usuario', 'Nome utente', 'Nom d\'utilisateur', 'Nome de Usuário', 'Användarnamn', 'Käyttäjätunnus', 'Brukernavn', 'Gebruikersnaam', 'Nazwa użytkownika'),
	(107, 'TextBlock', 2, 'text', 'Пароль', 'Password', 'Kennwort', 'Contraseña', 'Password', 'Mot de passe', 'Senha', 'Lösenord', 'Salasana', 'Passord', 'Wachtwoord', 'Hasło'),
	(108, 'TextBlock', 3, 'text', 'Запомнить?', 'Remember Me?', 'Mich erinnern?', 'Acuérdate de mí?', 'Ricordati di me?', 'Souviens-toi de moi?', 'Lembre de mim?', 'Kom ihåg mig?', 'Muista minut?', 'Husk meg?', 'Mij ​​onthouden?', 'Zapamiętaj mnie?'),
	(109, 'TextBlock', 4, 'text', 'Войти', 'Login', 'Login', 'Login', 'Accesso', 'Login', 'Login', 'Inloggning', 'Kirjaudu', 'Innlogging', 'Login', 'Login'),
	(110, 'TextBlock', 5, 'text', 'Добро пожаловать', 'Welcome', 'Willkommen', 'Bienvenida', 'Benvenuto', 'Accueil', 'Bem-vindo', 'Välkommen', 'Tervetuloa', 'Velkommen', 'Welkom', 'Powitanie'),
	(111, 'TextBlock', 6, 'text', 'Используйте правильное имя пользователя и пароль, чтобы получить доступ к консоли администрирования.', 'Use a valid username and password to gain access to the administration console.', 'Verwenden Sie einen gültigen Benutzernamen und Kennwort ein, um Zugriff auf die Administrationskonsole zu gewinnen.', 'Utilice un nombre de usuario y una contraseña válidos para acceder a la consola de administración.', 'Utilizzare un nome utente e una password validi per accedere alla console di amministrazione.', 'Utilisez un nom d\'utilisateur et mot de passe pour accéder à la console d\'administration.', 'Use um nome de usuário e senha válidos para ter acesso ao console de administração.', 'Använd ett giltigt användarnamn och lösenord för att få tillgång till administrationskonsolen.', 'Käytä voimassa oleva käyttäjätunnus ja salasana päästäkseen hallinnon konsoli.', 'Bruk et gyldig brukernavn og passord for å få tilgang til administrasjonskonsollen.', 'Gebruik een geldige gebruikersnaam en wachtwoord om toegang tot de beheerconsole te krijgen.', 'Wpisz uważnie swój login i hasło, aby uzyskać dostęp do konsoli administracyjnej.'),
	(112, 'TextBlock', 7, 'text', 'Войти', 'Login', 'Login', 'Login', 'Accesso', 'Login', 'Login', 'Inloggning', 'Kirjaudu', 'Innlogging', 'Login', 'Login'),
	(113, 'TextBlock', 8, 'text', 'Ваша компания', 'Your Company', 'Deine Firma', 'Su Empresa', 'Vostra Azienda', 'Votre Société', 'Sua Empresa', 'Din Företag', 'Your Company', 'Din Bedrift', 'Your Company', 'Twoja Firma'),
	(114, 'TextBlock', 9, 'text', 'Разработка и поддержка', 'Development and support', 'Entwicklung und Begleitung', 'Desarrollo y apoyo', 'Sviluppo e sostegno', 'Développement et support', 'Desenvolvimento e apoio', 'Utveckling och stöd', 'Kehittäminen ja tuki', 'Utvikling og støtte', 'Ontwikkeling en ondersteuning', 'Rozwój i wsparcie'),
	(116, 'TextBlock', 11, 'text', 'Блог', 'Blog', 'Blog', 'Blog', 'Blog', 'Blog', 'Blog', 'Blogg', 'Blogi', 'Blogg', 'Blog', 'Blog'),
	(117, 'TextBlock', 12, 'text', 'Сообщения', 'Messages', 'Nachrichten', 'Mensajes', 'Messaggi', 'Messages', 'Mensagens', 'Meddelanden', 'Viestit', 'Meldinger', 'Berichten', 'Wiadomości'),
	(118, 'TextBlock', 13, 'text', 'Комментарии', 'Comments', 'Kommentare', 'Comentarios', 'Commenti', 'Commentaires', 'Comentários', 'Kommentarer', 'Kommentit', 'Kommentarer', 'Reacties', 'Komentarze'),
	(119, 'TextBlock', 14, 'text', 'Метки', 'Tags', 'Schlagwörter', 'Etiquetas', 'Tag', 'Mots clés', 'Etiquetas', 'Tags', 'Tunnisteet', 'Tags', 'Tags', 'Tagi'),
	(120, 'TextBlock', 15, 'text', 'Пользователи', 'Users', 'Benutzer', 'Usuarios', 'Utenti', 'Utilisateurs', 'Usuários', 'Användare', 'Käyttäjät', 'Brukere', 'Gebruikers', 'Użytkownicy'),
	(121, 'TextBlock', 16, 'text', 'Настройки', 'Settings', 'Einstellungen', 'Ajustes', 'Impostazioni', 'Paramètres', 'Configurações', 'Inställningar', 'Asetukset', 'Innstillinger', 'Instellingen', 'Ustawienia'),
	(122, 'TextBlock', 18, 'text', 'Email шаблоны', 'Email templates', 'E-Mail-Vorlagen', 'Plantillas de correo electrónico', 'Modelli di e-mail', 'Modèles de courriel', 'Modelos de email', 'E-postmallar', 'Email malleja', 'E-post maler', 'E-mail templates', 'Szablony e-mail'),
	(123, 'TextBlock', 21, 'text', 'Сообщения', 'Messages', 'Nachrichten', 'Mensajes', 'Messaggi', 'Messages', 'Mensagens', 'Meddelanden', 'Viestit', 'Meldinger', 'Berichten', 'Wiadomości'),
	(124, 'TextBlock', 28, 'text', 'Локализация', 'Localization', 'Lokalisierung', 'Localización', 'Localizzazione', 'Localisation', 'Localização', 'Lokalisering', 'Lokalisointi', 'Lokalisering', 'Lokalisatie', 'Lokalizacja'),
	(125, 'TextBlock', 33, 'text', 'Добавить', 'Add', 'Hinzufügen', 'Añadir', 'Aggiungere', 'Ajouter', 'Adicionar', 'Lägga till', 'Lisätä', 'Legg', 'Toevoegen', 'Dodać'),
	(126, 'TextBlock', 34, 'text', 'Перейти на Сайт', 'Go to site', 'Go to site', 'Ir al sitio', 'Vai al sito', 'Accéder au site', 'Ir para o site', 'Gå till webbplatsen', 'Sivuston', 'Gå til nettstedet', 'Ga naar website', 'Idź do strony'),
	(127, 'TextBlock', 35, 'text', 'Выход', 'Exit', 'Ausgang', 'Salida', 'Uscita', 'Sortie', 'Saída', 'Utgång', 'Poistua', 'Utgang', 'Afrit', 'Wyjście'),
	(128, 'TextBlock', 36, 'text', 'Приборная панель', 'Dashboard', 'Armaturenbrett', 'Salpicadero', 'Cruscotto', 'Tableau de bord', 'Painel de instrumentos', 'Instrumentbräda', 'Kojelauta', 'Dashbord', 'Dashboard', 'Tablica rozdzielcza'),
	(129, 'TextBlock', 37, 'text', 'Профиль', 'Profile', 'Profil', 'Perfil', 'Profilo', 'Profil', 'Perfil', 'Profil', 'Profiili', 'Profil', 'Profiel', 'Profil'),
	(130, 'TextBlock', 38, 'text', 'Выход', 'Exit', 'Ausgang', 'Salida', 'Uscita', 'Sortie', 'Saída', 'Utgång', 'Poistua', 'Utgang', 'Afrit', 'Wyjście'),
	(131, 'TextBlock', 39, 'text', 'Админка', 'Admin', 'Admin', 'Administración', 'Admin', 'Admin', 'Administrador', 'Admin', 'Admin', 'Admin', 'Admin', 'Admin'),
	(132, 'TextBlock', 40, 'text', 'Список Страниц', 'List of Pages', 'Liste der Seiten', 'Lista de páginas', 'Elenco delle pagine', 'Liste des pages', 'Lista de Páginas', 'Lista över sidor', 'Luettelo Sivut', 'Liste over Sider', 'Lijst van Pages', 'Lista stron'),
	(133, 'TextBlock', 41, 'text', 'Название', 'Title', 'Titel', 'Título', 'Titolo', 'Titre', 'Título', 'Titel', 'Otsikko', 'Tittel', 'Titel', 'Tytuł'),
	(134, 'TextBlock', 42, 'text', 'УРЛ', 'URL', 'URL', 'URL', 'URL', 'URL', 'URL', 'URL', 'URL', 'URL', 'URL', 'URL'),
	(135, 'TextBlock', 43, 'text', 'Действия', 'Actions', 'Aktionen', 'Acciones', 'Azioni', 'Actes', 'Ações', 'Aktiviteter', 'Toiminnot', 'Handlinger', 'Acties', 'Akcje'),
	(136, 'TextBlock', 44, 'text', 'Первая страница', 'First page', 'Erste Seite', 'Primera página', 'Prima pagina', 'Première page', 'Primeira página', 'Första sidan', 'Ensimmäinen sivu', 'Første side', 'Eerste pagina', 'Pierwsza strona'),
	(137, 'TextBlock', 45, 'text', 'Предыдущая страница', 'Previous Page', 'Vorherige Seite', 'Página Anterior', 'Pagina Precedente', 'Page Précédente', 'Página Anterior', 'Föregående Sida', 'Edellinen sivu', 'Forrige Side', 'Vorige Pagina', 'Poprzednia strona'),
	(138, 'TextBlock', 46, 'text', 'Следующая страница', 'Next page', 'Nächste Seite', 'Página siguiente', 'Pagina successiva', 'Page suivante', 'Próxima página', 'Nästa sida', 'Seuraava sivu', 'Neste side', 'Volgende pagina', 'Następna strona'),
	(139, 'TextBlock', 47, 'text', 'Последняя страница', 'Last page', 'Letzte Seite', 'Última página', 'Ultima pagina', 'Dernière page', 'Última página', 'Sista sidan', 'Viimeinen sivu', 'Siste side', 'Laatste pagina', 'Ostatnia strona'),
	(140, 'TextBlock', 48, 'text', '[0] нет результата[1] 1 результат|(1,+Inf] %1% результата', '[0] no result|[1] 1 result|(1,+Inf] %1% results', '[0] kein Ergebnis|[1] 1 Ergebnis|(1,+Inf] %1% Ergebnisse', '[0] no resultado|[1] 1 resultado|(1,+Inf] %1% resultados', '[0] Nessun risultato|[1] 1 risultato|(1,+Inf] %1% risultati', '[0] Aucun résultat|[1] 1 résultat |(1,+Inf] %1% des résultats', '[0] nenhum resultado|[1] 1 resultado|(1,+Inf] %1% de resultados', '[0] inget resultat|[1] 1 resultat|(1,+Inf] %1% resultat', '[0] Ei tulos |[1] 1 tulos|(1,+Inf] %1% tulosta', '[0] ingen resultat|[1] 1 resultat|(1,+Inf] %1% resultater', '[0] geen resultaat|[1] 1 resultaat|(1,+Inf] %1% resultaten', '[0] nie wynik|[1] 1 wynik|(1,+Inf] %1% Wyniki'),
	(141, 'TextBlock', 49, 'text', '(стр.%%page%%/%%nb_pages%%)', '(page %%page%%/%%nb_pages%%)', '(Seite%%page%%/%%nb_pages%%)', '(página%%page%%/%%nb_pages%%)', '(pagina%%page%%/%%nb_pages%%)', '(page%%page%%/%%nb_pages%%)', '(página%%page%%/%%nb_pages%%)', '(sidan%%page%%/%%nb_pages%%)', '(sivu%%page%%/%%nb_pages%%)', '(side%%page%%/%%nb_pages%%)', '(pagina%%page%%/%%nb_pages%%)', '(strona %%page%%/%%nb_pages%%)'),
	(142, 'TextBlock', 50, 'text', 'Редактировать', 'Edit', 'Bearbeiten', 'Editar', 'Modifica', 'Éditer', 'Editar', 'Redigera', 'Muokata', 'Rediger', 'Uitgeven', 'Edycja'),
	(143, 'TextBlock', 51, 'text', 'Удалить', 'Delete', 'Löschen', 'Borrar', 'Cancellare', 'Effacer', 'Excluir', 'Radera', 'Poistaa', 'Slett', 'Delete', 'Kasować'),
	(144, 'TextBlock', 52, 'text', 'Вы уверены?', 'Are you sure?', 'Sind Sie sicher?', 'Estás seguro?', 'Sei sicuro?', 'Êtes-vous sûr?', 'Você tem certeza?', 'Är du säker?', 'Oletko varma?', 'Er du sikker?', 'Weet je het zeker?', 'Czy na pewno?'),
	(145, 'TextBlock', 53, 'text', 'Выберите действие', 'Choose an action', 'Wählen Sie eine Aktion', 'Elija una acción', 'Scegliere un\'azione', 'Choisissez une action', 'Escolha uma ação', 'Välj en åtgärd', 'Valitse toiminta', 'Velg en handling', 'Kies een actie', 'Wybierz działanie'),
	(146, 'TextBlock', 54, 'text', 'Вперед!', 'Go!', 'Go!', 'Go!', 'Go!', 'Allez!', 'Go!', 'Go!', 'Go!', 'Gå!', 'Go!', 'Idź!'),
	(147, 'TextBlock', 55, 'text', 'Новый', 'New', 'Neu', 'Nuevo', 'Nuovo', 'Nouveau', 'Novo', 'Ny', 'Uusi', 'Ny', 'Nieuw', 'Nowy'),
	(148, 'TextBlock', 56, 'text', 'Сообщения в блоге', 'Blog Posts', 'Blogeinträge', 'Mensajes de blog', 'Post sul blog', 'Messages blog', 'Posts de Blog', 'Blogginlägg', 'Blogimerkinnät', 'Blogginnlegg', 'Blog Posts', 'Blogach'),
	(149, 'TextBlock', 57, 'text', 'Сброс', 'Reset', 'Rücksetzen', 'Reajustar', 'Reset', 'Remettre', 'Restabelecer', 'Återställ', 'Asettaa uudelleen', 'Tilbakestill', 'Reset', 'Resetowanie'),
	(150, 'TextBlock', 58, 'text', 'Фильтр', 'Filter', 'Filter', 'Filtro', 'Filtro', 'Filtre', 'Filtro', 'Filtrera', 'Suodatin', 'Filter', 'Filter', 'Filtr'),
	(151, 'TextBlock', 59, 'text', 'Нет результата', 'No result', 'Kein Ergebnis', 'Ningún resultado', 'Nessun risultato', 'Aucun résultat', 'Nenhum resultado', 'Inget resultat', 'Ei tulos', 'Ingen resultat', 'Geen resultaat', 'Nie wynik'),
	(152, 'TextBlock', 60, 'text', 'Новая страница', 'New page', 'Neue Seite', 'Nueva página', 'Nuova pagina', 'Nouvelle page', 'Nova página', 'Ny sida', 'Uusi sivu', 'Ny side', 'Nieuwe pagina', 'Nowa strona'),
	(153, 'TextBlock', 61, 'text', 'Содержание', 'Contents', 'Inhalt', 'Contenido', 'Contenuto', 'Contenu', 'Conteúdo', 'Innehåll', 'Sisältö', 'Innhold', 'Inhoud', 'Zawartość'),
	(154, 'TextBlock', 62, 'text', 'Включить редирект', 'Enable redirection', 'Aktivieren Umleitung', 'Habilitar la redirección', 'Attiva reindirizzamento', 'Activez la redirection', 'Ativar o redirecionamento', 'Möjliggöra omdirigering', 'Ota uudelleenohjaus', 'Aktiver omdirigering', 'Omleiding inschakelen', 'Włącz przekierowanie'),
	(155, 'TextBlock', 63, 'text', 'Адрес редиректа', 'Redirect to', 'Umleitung auf', 'Redirigir a', 'Redirect a', 'Redirection vers', 'Redirecionar para', 'Dirigera till', 'Uudelleenohjata', 'Omdirigere til', 'Omleiden naar', 'Przekierowanie do'),
	(156, 'TextBlock', 64, 'text', 'Тайм-аут редиректа', 'Redirection timeout', 'Redirection Timeout', 'Tiempo de espera de redirección', 'Reindirizzamento timeout', 'Redirection délai', 'Redirecionamento de tempo limite', 'Omdirigering timeout', 'Uudelleenohjaus timeout', 'Timeout omdirigering', 'Redirection timeout', 'Limit czasu przekierowania'),
	(157, 'TextBlock', 65, 'text', 'Планировка', 'Layout', 'Layout', 'Disposición', 'Disposizione', 'Disposition', 'Traçado', 'Layout', 'Layout', 'Layout', 'Lay-out', 'Układ'),
	(158, 'TextBlock', 66, 'text', 'Мета название', 'Meta title', 'Meta Titel', 'Título Meta', 'Titolo Meta', 'Titre Meta', 'Meta título', 'Meta titel', 'Meta otsikko', 'Meta tittel', 'Meta titel', 'Meta tytuł'),
	(159, 'TextBlock', 67, 'text', 'Мета описание', 'Meta description', 'Meta Beschreibung', 'Meta descripción', 'Descrizione Meta', 'Meta description', 'Meta descrição', 'Meta description', 'Meta kuvaus', 'Meta beskrivelse', 'Meta description', 'Meta opis'),
	(160, 'TextBlock', 68, 'text', 'Мета ключевые слова', 'Meta keywords', 'Meta-Keywords', 'Meta palabras clave', 'Parole chiave Meta', 'Meta keywords', 'Meta palavras-chave', 'Meta sökord', 'Meta avainsanat', 'Meta søkeord', 'Meta keywords', 'Meta słowa kluczowe'),
	(161, 'TextBlock', 69, 'text', 'Вернуться к списку', 'Back to list', 'Zurück zur Liste', 'Volver a la lista', 'Torna alla lista', 'Retour à la liste', 'Voltar à lista', 'Tillbaka till listan', 'Takaisin luetteloon', 'Tilbake til listen', 'Terug naar lijst', 'Powrót do listy'),
	(162, 'TextBlock', 70, 'text', 'Сохранить', 'Save', 'Speichern', 'Guardar', 'Salva', 'Enregistrer', 'Salvar', 'Spara', 'Tallenna', 'Lagre', 'Opslaan', 'Zapisz'),
	(163, 'TextBlock', 71, 'text', 'Сохранить и добавить', 'Save and add', 'Speichern und fügen', 'Guardar y añadir', 'Salva e aggiungere', 'Enregistrer et ajouter', 'Salvar e adicionar', 'Spara och lägg till', 'Tallentaa ja lisää', 'Lagre og legg til', 'Opslaan en voeg', 'Zapisz i dodaj'),
	(164, 'TextBlock', 72, 'text', 'УРЛ-метка', 'URL tag', 'URL-Tag', 'Etiqueta URL', 'Tag URL', 'URL de tag', 'Tag URL', 'URL-tagg', 'URL tag', 'URL tag', 'URL tag', 'Znacznik URL'),
	(165, 'TextBlock', 73, 'text', 'Редактировать страницу', 'Edit this Page', 'Diese Seite bearbeiten', 'Edite esta página', 'Modifica questa pagina', 'Modifier cette page', 'Editar esta página', 'Redigera den här sidan', 'Muokkaa tätä sivua', 'Rediger denne siden', 'Deze pagina bewerken', 'Edytuj tę stronę'),
	(166, 'TextBlock', 74, 'text', 'Список пользователей', 'Member List', 'Benutzerliste', 'Lista de Miembros', 'Lista utenti', 'Liste des membres', 'Lista de membros', 'Medlemslista', 'Jäsenlista', 'Medlemsliste', 'Leden Lijst', 'Lista użytkowników'),
	(167, 'TextBlock', 75, 'text', 'Создано в', 'Created in', 'Erstellt in', 'Creado en', 'Creato nel', 'Créée en', 'Criado em', 'Skapat i', 'Luotu', 'Opprettet i', 'Gemaakt in', 'Utworzony w'),
	(168, 'TextBlock', 76, 'text', 'Обновлено в', 'Updated at', 'Aktualisiert am', 'Actualizado en', 'Aggiornati alle', 'Mise à jour à', 'Atualizado em', 'Uppdaterat på', 'Päivitetty klo', 'Oppdatert', 'Bijgewerkt op', 'Aktualizowane na'),
	(169, 'TextBlock', 77, 'text', 'Последнее Войти', 'Last Login', 'Letzte Anmeldung', 'Último ingreso', 'Ultimo accesso', 'Dernière connexion', 'Último login', 'Senaste inloggning', 'Viimeksi kirjautunut', 'Siste innlogging', 'Laatst ingelogd', 'Ostatnie logowanie'),
	(170, 'TextBlock', 78, 'text', 'Пользователь', 'User', 'Benutzer', 'Usuario', 'Utente', 'Utilisateur', 'Usuário', 'Användar', 'Käyttäjä', 'Bruker', 'Gebruiker', 'Użytkownik'),
	(171, 'TextBlock', 79, 'text', 'Новый пользователь', 'New user', 'Neuer Benutzer', 'Nuevo usuario', 'Nuovo utente', 'Nouvel utilisateur', 'Novo usuário', 'Ny användare', 'Uusi käyttäjä', 'Ny bruker', 'Nieuwe gebruiker', 'Nowy użytkownik'),
	(172, 'TextBlock', 80, 'text', 'Пользователь', 'User', 'Benutzer', 'Usuario', 'Utente', 'Utilisateur', 'Usuário', 'Användar', 'Käyttäjä', 'Bruker', 'Gebruiker', 'Użytkownik'),
	(173, 'TextBlock', 81, 'text', 'Имя', 'First name', 'Vorname', 'Nombre de pila', 'Nome', 'Prénom', 'Primeiro nome', 'Förnamn', 'Etunimi', 'Fornavn', 'Voornaam', 'Imię'),
	(174, 'TextBlock', 82, 'text', 'Фамилия', 'Last name', 'Nachname', 'Apellido', 'Cognome', 'Nom de famille', 'Sobrenome', 'Efternamn', 'Sukunimi', 'Etternavn', 'Achternaam', 'Nazwisko'),
	(175, 'TextBlock', 83, 'text', 'Адрес электронной почты', 'E-mail address', 'E-Mail-Adresse', 'E por correo electrónico', 'Indirizzo e-mail', 'E-mail adresse', 'E-mail', 'E-postadress', 'Sähköpostiosoite', 'E-post adresse', 'E-mailadres', 'Adres e-mail'),
	(176, 'TextBlock', 84, 'text', 'Пароль (еще раз)', 'Password (again)', 'Passwort (wieder)', 'Contraseña (de nuevo)', 'Password (di nuovo)', 'Mot de passe (encore)', 'Senha (novamente)', 'Lösenord (igen)', 'Salasana (uudestaan​​)', 'Passord (igjen)', 'Wachtwoord (nogmaals)', 'Hasło (ponownie)'),
	(177, 'TextBlock', 85, 'text', 'Разрешения', 'Permissions', 'Berechtigungen', 'Permisos', 'Permessi', 'Permission', 'Permissão', 'Behörigheter', 'Oikeudet', 'Tillatelser', 'Machtigingen', 'Uprawnienia'),
	(178, 'TextBlock', 86, 'text', 'Является активным', 'Is active', 'Ist aktiv', 'Es activo', 'E \'attivo', 'Est actif', 'Está ativo', 'Är aktiv', 'On aktiivinen', 'Er aktiv', 'Is actief', 'Jest aktywny'),
	(179, 'TextBlock', 87, 'text', 'Это супер админ', 'Is super admin', 'Ist super Admin', 'Es super administrador', 'È super amministratore', 'Est super administrateur', 'É super administrador', 'Är super admin', 'On super admin', 'Er super admin', 'Is super admin', 'Jest super administratora'),
	(180, 'TextBlock', 88, 'text', 'Редактирование "%%username%%"', 'Edit "%%username%%"', 'Edit "%%username%%"', 'Editar "%%username%%"', 'Modifica "%%username%%"', 'Modifier "%%username%%"', 'Edit "%%%username%%"', 'Edit "%%username%%"', 'Edit "%%username%%"', 'Edit "%%username%%"', 'Edit "%%username%%"', 'Edycja "%%username%%"'),
	(181, 'TextBlock', 89, 'text', 'Словарь', 'Dictionary', 'Wörterbuch', 'Diccionario', 'Dizionario', 'Dictionnaire', 'Dicionário', 'Lexikon', 'Sanakirja', 'Ordbok', 'Woordenboek', 'Słownik'),
	(182, 'TextBlock', 90, 'text', 'Название', 'Title', 'Titel', 'Título', 'Titolo', 'Titre', 'Título', 'Titel', 'Otsikko', 'Tittel', 'Titel', 'Tytuł'),
	(183, 'TextBlock', 91, 'text', 'Значение', 'Value', 'Wert', 'Valor', 'Valore', 'Valeur', 'Valor', 'Värde', 'Arvo', 'Verdi', 'Waarde', 'Wartość'),
	(184, 'TextBlock', 92, 'text', 'Настройки', 'Settings', 'Einstellungen', 'Ajustes', 'Impostazioni', 'Paramètres', 'Configurações', 'Inställningar', 'Asetukset', 'Innstillinger', 'Instellingen', 'Ustawienia'),
	(185, 'TextBlock', 93, 'text', 'Список Email шаблонов', 'List of Email Templates', 'Liste der E-Mail-Vorlagen', 'Lista de plantillas de correo electrónico', 'Elenco dei modelli di e-mail', 'Liste des Modèles Email', 'Lista de modelos de E-mail', 'Lista över E-postmallar', 'Luettelo Sähköposti Mallit', 'Liste over E-post maler', 'Lijst van E-mail Templates', 'Lista szablonów e-mail'),
	(186, 'TextBlock', 94, 'text', 'ID', 'ID', 'Identifikation', 'Identificación', 'ID', 'Carte d\'identité', 'Identidade', 'ID', 'ID', 'ID', 'ID', 'ID'),
	(187, 'TextBlock', 95, 'text', 'Тема', 'Topic', 'Thema', 'Tema', 'Argomento', 'Sujet', 'Tópico', 'Ämne', 'Aihe', 'Topic', 'Onderwerp', 'Temat'),
	(188, 'TextBlock', 96, 'text', 'Сообщение', 'Message', 'Nachricht', 'Mensaje', 'Messaggio', 'Message', 'Mensagem', 'Meddelande', 'Viesti', 'Beskjed', 'Bericht', 'Wiadomość'),
	(190, 'TextBlock', 98, 'text', 'Редактировать шаблон Email', 'Edit Email Template', 'Bearbeiten E-Mail-Vorlage', 'Editar Plantilla de correo electrónico', 'Modifica Modello Email', 'Modifier Email Template', 'Editar Email Template', 'Redigera E-postmall', 'Edit Sähköpostimalli', 'Edit Email Mal', 'Bewerk Email Template', 'Edycja szablonu e-mail'),
	(191, 'TextBlock', 99, 'text', 'Новый шаблон Email', 'New template Email', 'Neue Vorlage Email', 'Nueva plantilla de correo electrónico', 'Nuovo modello E-mail', 'Nouveau modèle Email', 'Novo modelo Email', 'Ny mall E', 'Uusi malli Sähköposti', 'Ny mal Email', 'Nieuwe template Email', 'Nowy szablon e-mail'),
	(192, 'TextBlock', 100, 'text', 'Ваше имя', 'Your name', 'Ihren Namen', 'Su nombre', 'Il tuo nome', 'Votre nom', 'Seu nome', 'Ditt namn', 'Nimesi', 'Ditt navn', 'Uw naam', 'Twoje imię i nazwisko'),
	(193, 'TextBlock', 101, 'text', 'Ваш E-mail', 'Your E-mail', 'Ihre E-Mail', 'Tu E-mail', 'Il tuo indirizzo e-mail', 'Votre E-mail', 'Seu E-mail', 'Din e-post', 'E-mail', 'Din e-post', 'Uw E-mail', 'Twój e-mail'),
	(194, 'TextBlock', 102, 'text', 'Нужен для обратной связи', 'Need for feedback', 'Brauchen Sie für Rückfragen', 'Necesidad de retroalimentación', 'Necessità di un feedback', 'Besoin de commentaires', 'Necessidade de retorno', 'Behov av återkoppling', 'Need for palaute', 'Behov for tilbakemeldinger', 'Behoefte aan feedback', 'Potrzeba informacji zwrotnej'),
	(195, 'TextBlock', 103, 'text', 'Ваше сообщение', 'Your message', 'Ihre Nachricht', 'Tu mensaje', 'Il tuo messaggio', 'Votre message', 'Sua mensagem', 'Ditt meddelande', 'Viestisi', 'Din melding', 'Uw bericht', 'Twoja wiadomość'),
	(196, 'TextBlock', 104, 'text', 'Обновить изображение', 'Refresh Image', 'Refresh Image', 'Refrescar imagen', 'Cambia immagine', 'Rafraîchir l\'image', 'Atualizar Imagem', 'Uppdatera bild', 'Päivitä kuva', 'Oppdater bilde', 'Ververs afbeelding', 'Odśwież obrazek'),
	(197, 'TextBlock', 105, 'text', 'Введите код с картинки', 'Enter the code from the image', 'Geben Sie den Code aus dem Bild', 'Introduzca el código de la imagen', 'Inserisci il codice dall\'immagine', 'Entrez le code de l\'image', 'Digite o código da imagem', 'Ange koden från bilden', 'Syötä kuvan koodi', 'Skriv inn koden fra bildet', 'Voer de code van de afbeelding', 'Wpisz kod z obrazka'),
	(198, 'TextBlock', 106, 'text', 'Показатели', 'Indicators', 'Anzeigen', 'Indicadores', 'Indicatori', 'Indicateurs', 'Indicadores', 'Indikatorer', 'Indikaattorit', 'Indikatorer', 'Indicatoren', 'Wskaźniki'),
	(199, 'TextBlock', 107, 'text', 'Имя', 'Name', 'Name', 'Nombre', 'Nome', 'Nom', 'Nome', 'Namn', 'Nimi', 'Navn', 'Naam', 'Nazwa'),
	(200, 'TextBlock', 108, 'text', 'E-mail', 'E-mail', 'E-Mail', 'E-mail', 'E-mail', 'E-mail', 'E-mail', 'E-post', 'E-mail', 'E-post', 'E-mail', 'E-mail'),
	(201, 'TextBlock', 109, 'text', 'По убыванию', 'Descending', 'Absteigend', 'Descendente', 'Discendente', 'Descendant', 'Descendente', 'Fallande', 'Aleneva', 'Synkende', 'Aflopend', 'Malejąco'),
	(202, 'TextBlock', 110, 'text', 'Просмотр', 'View', 'Ausblick', 'Vista', 'Vista', 'Vue', 'Vista', 'Utsikt', 'Näkymä', 'Utsikt', 'Uitzicht', 'Widok'),
	(203, 'TextBlock', 111, 'text', 'Создать пользователя', 'Create User', 'Benutzer erstellen', 'Crear usuario', 'Crea utente', 'Créer un utilisateur', 'Criar Usuário', 'Skapa användar', 'Luo Käyttäjä', 'Opprett bruker', 'Gebruiker aanmaken', 'Utwórz użytkownika'),
	(204, 'TextBlock', 112, 'text', 'Экспорт', 'Export', 'Export', 'Exportación', 'Esportazione', 'Exportation', 'Exportação', 'Export', 'Vienti', 'Eksport', 'Export', 'Eksport'),
	(205, 'TextBlock', 113, 'text', 'Этот пункт был успешно обновлен.', 'This item was successfully updated.', 'Dieser Artikel wurde erfolgreich aktualisiert.', 'Este artículo se ha actualizado correctamente.', 'Questo elemento è stato aggiornato con successo.', 'Cet article a été mis à jour.', 'Este artigo foi atualizado com sucesso.', 'Denna post har uppdaterats.', 'Tämä kohta päivitys onnistui.', 'Dette elementet er oppdatert.', 'Dit item is bijgewerkt.', 'Ten element został pomyślnie zaktualizowany.'),
	(206, 'TextBlock', 114, 'text', 'Неверный формат', 'Invalid format', 'Ungültiges Format', 'Formato no válido', 'Formato non valido', 'Format invalide', 'Formato inválido', 'Ogiltigt format', 'Virheellinen muoto', 'Ugyldig format', 'Ongeldig formaat', 'Nieprawidłowy format'),
	(207, 'TextBlock', 115, 'text', 'Системные настройки', 'System Settings', 'Systemeinstellungen', 'Configuración del sistema', 'Impostazioni di sistema', 'Paramètres système', 'Configurações do sistema', 'Systeminställningar', 'System Settings', 'Systeminnstillinger', 'Systeeminstellingen', 'Ustawienia systemowe'),
	(208, 'TextBlock', 116, 'text', 'Раздел', 'Section', 'Abschnitt', 'Sección', 'Sezione', 'Section', 'Seção', 'Avsnitt', 'Jakso', 'Seksjon', 'Sectie', 'Sekcja'),
	(209, 'TextBlock', 118, 'text', 'Список Email ошибок', 'Email error list', 'E-Mail-Fehlerliste', 'Email lista de errores', 'Lista error Email', 'Email liste d\'erreur', 'Lista de erros e-mail', 'Email fellista', 'Sähköposti virheluettelo', 'E-post feilliste', 'E-mail error lijst', 'Lista błędów e-mail'),
	(210, 'TextBlock', 119, 'text', 'От кого', 'From whom', 'Von wem', '¿De quién', 'Da chi', 'De qui', 'De quem', 'Från vem', 'Keneltä', 'Fra hvem', 'Van wie', 'Od kogo'),
	(211, 'TextBlock', 120, 'text', 'Кому', 'To Whom', 'Denen', 'A quien', 'A cui', 'À qui', 'A quem', 'Till vem', 'Kenelle', 'Til hvem', 'Aan Wie', 'Do kogo'),
	(212, 'TextBlock', 121, 'text', 'Тело', 'Body', 'Körper', 'Cuerpo', 'Corpo', 'Corps', 'Corpo', 'Kropp', 'Runko', 'Body', 'Lichaam', 'Ciało'),
	(213, 'TextBlock', 122, 'text', 'Копия', 'Copy', 'Kopie', 'Copia', 'Copia', 'Copie', 'Cópia', 'Kopia', 'Kopio', 'Kopi', 'Kopie', 'Kopia'),
	(214, 'TextBlock', 123, 'text', 'Файл', 'File', 'Datei', 'Expediente', 'File', 'Fichier', 'Arquivo', 'Fil', 'Tiedosto', 'File', 'Bestand', 'Plik'),
	(215, 'TextBlock', 132, 'text', 'Фильтр', 'Filter', 'Filter', 'Filtro', 'Filtro', 'Filtre', 'Filtro', 'Filtrera', 'Suodatin', 'Filter', 'Filter', 'Filtr'),
	(216, 'TextBlock', 133, 'text', 'пусто', 'Empty', 'Leer', 'Vacío', 'Vuoto', 'Vide', 'Vazio', 'Tom', 'Tyhjä', 'Tom', 'Leeg', 'Pusty'),
	(217, 'TextBlock', 134, 'text', 'Мой профиль', 'My Profile', 'Mein Profil', 'Mi Perfil', 'Il mio profilo', 'Mon profil', 'Meu Perfil', 'Min profil', 'Oma profiili', 'Min profil', 'Mijn Profiel', 'Mój profil'),
	(218, 'TextBlock', 135, 'text', 'Фотография', 'Photo', 'Foto', 'Foto', 'Foto', 'Photo', 'Foto', 'Fil', 'Kuva', 'Bilde', 'Foto', 'Zdjęcie'),
	(219, 'TextBlock', 136, 'text', 'Изменить пароль', 'Change Password', 'Kennwort ändern', 'Cambiar la contraseña', 'Cambiare la password', 'Changer le mot de passe', 'Alterar a senha', 'Ändra lösenord', 'Vaihda salasana', 'Endre passord', 'Wachtwoord wijzigen', 'Zmień hasło'),
	(220, 'TextBlock', 137, 'text', 'Отчество', 'Patronymic', 'Vatersname', 'Patronímico', 'Patronimico', 'Patronyme', 'Patronímico', 'PATRONYMIKON', 'Patronyymi', 'Patronymikon', 'Patronymicum', 'Patronimiczny'),
	(221, 'TextBlock', 138, 'text', 'Фамилия', 'Last name', 'Nachname', 'Apellido', 'Cognome', 'Nom de famille', 'Sobrenome', 'Efternamn', 'Sukunimi', 'Etternavn', 'Achternaam', 'Nazwisko'),
	(222, 'TextBlock', 139, 'text', 'Дата рождения', 'DOB', 'DOB', 'Fecha de nacimiento', 'DOB', 'DOB', 'DOB', 'DOB', 'Syntymäaika', 'DOB', 'DOB', 'DOB'),
	(223, 'TextBlock', 140, 'text', 'Телефон мобильный\n(для получения уведомлений)', 'Mobile phone (for notification)', 'Mobiltelefon (zur Meldung)', 'Teléfono móvil (para la notificación)', 'Telefono cellulare (per la notifica)', 'Téléphone portable (pour la notification)', 'Telefone celular (para notificação)', 'Mobiltelefon (för anmälan)', 'Matkapuhelin (ilmoituksen)', 'Mobiltelefon (for varsling)', 'Mobiele telefoon (voor kennisgeving)', 'Telefon komórkowy (do zgłoszenia)'),
	(224, 'TextBlock', 141, 'text', 'Сохранить изменения', 'Save changes', 'Änderungen speichern', 'Guardar cambios', 'Salva le modifiche', 'Enregistrer les modifications', 'Salvar alterações', 'Spara ändringar', 'Tallenna muutokset', 'Lagre endringer', 'Wijzigingen opslaan', 'Zapisz zmiany'),
	(225, 'TextBlock', 142, 'text', 'Старый пароль', 'Old password', 'Altes Passwort', 'Contraseña anterior', 'Vecchia password', 'Ancien mot de passe', 'Senha Antiga', 'Gammalt lösenord', 'Vanha salasana', 'Gammelt passord', 'Oud wachtwoord', 'Stare hasło'),
	(226, 'TextBlock', 143, 'text', 'Новый пароль', 'New password', 'Neues Passwort', 'Nueva contraseña', 'Nuova password', 'Nouveau mot de passe', 'Nova Senha', 'Nytt lösenord', 'Uusi salasana', 'Nytt passord', 'Nieuw wachtwoord', 'Nowe hasło'),
	(227, 'TextBlock', 144, 'text', 'Новый пароль еще раз', 'New password again', 'Neues Passwort wieder', 'Nueva contraseña de nuevo', 'Di nuovo Nuova password', 'Nouveau mot de passe', 'Nova senha novamente', 'Nytt lösenord igen', 'Uusi salasana', 'Nytt passord på nytt', 'Nieuwe wachtwoord opnieuw', 'Nowe hasło ponownie'),
	(228, 'TextBlock', 145, 'text', 'Сохранить пароль', 'Save password', 'Kennwort speichern', 'Guardar contraseña', 'Ricordare la password', 'Mémoriser mot de passe', 'Salvar senha', 'Spara lösenord', 'Tallenna salasana', 'Lagre passord', 'Wachtwoord opslaan', 'Zapisz hasło'),
	(229, 'TextBlock', 146, 'text', 'Заполните поле', 'Fill out the field', 'Füllen Sie das Feld', 'Rellene el campo', 'Compila il campo', 'Remplissez le champ', 'Preencha o campo', 'Fyll i fältet', 'Täytä kenttä', 'Fyll ut feltet', 'Vul het veld', 'Wypełnij pole'),
	(230, 'TextBlock', 147, 'text', 'Пароли не совпадают', 'Passwords do not match', 'Passwörter stimmen nicht überein', 'Las contraseñas no coinciden', 'Le password non corrispondono', 'Les mots de passe ne correspondent pas', 'Senhas não conferem', 'Lösenorden matchar inte', 'Salasanat eivät täsmää', 'Passordene samsvarer ikke', 'Wachtwoorden komen niet overeen', 'Hasła nie są identyczne'),
	(231, 'TextBlock', 148, 'text', 'Выберите картинку и загрузите ее', 'Select an image and upload it', 'Wählen Sie ein Bild und laden Sie sie', 'Seleccione una imagen y cargarla', 'Selezionare un\'immagine e caricarla', 'Sélectionnez une image et la télécharger', 'Selecione uma imagem e enviá-lo', 'Välj en bild och ladda upp den', 'Valitse kuva ja lähetä se', 'Velg et bilde og laste det opp', 'Selecteer een afbeelding en upload het', 'Wybierz zdjęcie i przesłać go'),
	(232, 'TextBlock', 149, 'text', 'Картинка', 'Image', 'Bild', 'Imagen', 'Immagine', 'Image', 'Imagem', 'Bild', 'Kuva', 'Bilde', 'Afbeelding', 'Obraz'),
	(233, 'TextBlock', 150, 'text', 'Загрузить фотографию', 'Upload an image', 'Bild einschicken', 'Subir una imagen', 'Carica una foto', 'Ajouter une image', 'Carregar uma imagem', 'Ladda upp en bild', 'Lähetä kuva', 'Last opp et bilde', 'Upload een afbeelding', 'Prześlij zdjęcie'),
	(234, 'TextBlock', 151, 'text', 'Файл слишком большой(не более %max_size% ).', 'The file is too large (maximum%max_size%).', 'Die Datei ist zu groß (maximal%max_size%).', 'El archivo es demasiado grande (%max_size máxima%).', 'Il file è troppo grande (al massimo%max_size%).', 'Le fichier est trop volumineux (maximum%max_size%).', 'O arquivo é muito grande (máximo%max_size%).', 'Filen är för stor (max%MAX_SIZE%).', 'Tiedosto on liian suuri (enintään%MAX_SIZE%).', 'Filen er for stor (maks%MAX_SIZE%).', 'Het bestand is te groot (maximaal%max_size%).', 'Plik jest zbyt duży (maksymalny%MAX_SIZE%).'),
	(235, 'TextBlock', 152, 'text', 'Вы можете выбрать зону, которая будет отображаться на ваших изображениях. Кликните по одному из изображений справа', 'You can select the area to be displayed on your images. Click on one of the small images to the right', 'Sie können den Bereich auswählen, die auf Ihre Bilder angezeigt werden. Klicken Sie auf eines der kleinen Bilder rechts', 'Usted puede seleccionar el área que se muestra en las imágenes. Haga clic en una de las pequeñas imágenes a la derecha', 'È possibile selezionare l\'area da visualizzare sulle immagini. Clicca su una delle piccole immagini a destra', 'Vous pouvez sélectionner la zone à afficher sur vos images. Cliquez sur l\'une des petites images à droite', 'Você pode selecionar a área a ser exibidos em suas imagens. Clique em uma das imagens pequenas para a direita', 'Du kan välja det område som ska visas på dina bilder. Klicka på en av de små bilderna till höger', 'Voit valita alueen, joka näytetään kuvia. Valitse jokin pieniä kuvia oikealle', 'Du kan velge området som skal vises på bildene dine. Klikk på en av de små bildene til høyre', 'U kunt het gebied selecteren op uw afbeeldingen worden weergegeven. Klik op een van de kleine foto\'s naar rechts', 'Możesz wybrać obszar, który będzie wyświetlany na zdjęciach. Kliknij na jeden z małych zdjęć w prawo'),
	(236, 'TextBlock', 153, 'text', 'Удалить текущий файл', 'Delete the current file', 'Löschen Sie die aktuelle Datei', 'Elimine el archivo actual', 'Eliminare il file corrente', 'Supprimez le fichier actuel', 'Exclua o arquivo atual', 'Ta bort den aktuella filen', 'Poista nykyinen tiedosto', 'Slett gjeldende fil', 'Verwijder het huidige bestand', 'Usuń bieżący plik'),
	(237, 'TextBlock', 154, 'text', 'Сохранить', 'Save', 'Speichern', 'Guardar', 'Salva', 'Enregistrer', 'Salvar', 'Spara', 'Tallenna', 'Lagre', 'Opslaan', 'Zapisz'),
	(238, 'TextBlock', 155, 'text', 'Вы уверены?', 'Are you sure?', 'Sind Sie sicher?', 'Estás seguro?', 'Sei sicuro?', 'Êtes-vous sûr?', 'Você tem certeza?', 'Är du säker?', 'Oletko varma?', 'Er du sikker?', 'Weet je het zeker?', 'Czy na pewno?'),
	(239, 'TextBlock', 156, 'text', 'Удалить фотографию', 'Delete image', 'Bild löschen', 'Eliminar imagen', 'Elimina immagine', 'Supprimer l\'image', 'Apagar imagem', 'Radera bild', 'Poista kuva', 'Slett bilde', 'Afbeelding verwijderen', 'Usuń zdjęcie'),
	(240, 'TextBlock', 157, 'text', 'Логин (Ваш Email)', 'Username (Your Email)', 'Benutzername (Ihre E-Mail)', 'Nombre de usuario (su correo electrónico)', 'Nome utente (il tuo e-mail)', 'Nom d\'utilisateur (votre adresse email)', 'Nome de usuário (Seu e-mail)', 'Användarnamn (E-mail)', 'Käyttäjänimi (sähköposti)', 'Brukernavn (Din e-post)', 'Gebruikersnaam (uw e-mail)', 'Nazwa użytkownika (Twój e-mail)'),
	(241, 'TextBlock', 158, 'text', 'Запомнить меня на этом компьютере', 'Remember me on this computer', 'Mich auf diesem Computer', 'Recordarme en este equipo', 'Ricordami su questo computer', 'Se souvenir de moi sur cet ordinateur', 'Lembre-se de mim neste computador', 'Kom ihåg mig på denna dator', 'Muista minut tällä tietokoneella', 'Husk meg på denne datamaskinen', 'Onthouden op deze computer', 'Pamiętaj mnie na tym komputerze'),
	(242, 'TextBlock', 159, 'text', 'Войти', 'Login', 'Login', 'Login', 'Accesso', 'Login', 'Login', 'Inloggning', 'Kirjaudu', 'Innlogging', 'Login', 'Login'),
	(243, 'TextBlock', 160, 'text', 'Забыли пароль?', 'Forgot your password?', 'Passwort vergessen?', '¿Olvidaste tu contraseña?', 'Hai dimenticato la password?', 'Mot de passe oublié?', 'Esqueceu sua senha?', 'Glömt ditt lösenord?', 'Unohtuiko salasana?', 'Glemt passord?', 'Wachtwoord vergeten?', 'Nie pamiętasz hasła?'),
	(244, 'TextBlock', 161, 'text', 'Регистрация', 'Registration', 'Anmeldung', 'Registro', 'Registrazione', 'Inscription', 'Registro', 'Registrering', 'Rekisteröinti', 'Registrering', 'Registratie', 'Rejestracja'),
	(245, 'TextBlock', 162, 'text', 'Неверный логин или пароль', 'Incorrect login or password', 'Falsche Login oder Passwort', 'Usuario o contraseña incorrecta', 'Email o password errata', 'Login ou mot de passe incorrect', 'De login ou senha incorreta', 'Felaktigt användarnamn eller lösenord', 'Virheelliset tai salasana', 'Feil brukernavn eller passord', 'Verkeerde login of paswoord', 'Niepoprawne login lub hasło'),
	(246, 'TextBlock', 163, 'text', 'Введите код', 'Enter the code', 'Geben Sie den Code', 'Introduzca el código', 'Inserisci il codice', 'Entrez le code', 'Digite o código', 'Ange koden', 'Syötä koodi', 'Skriv inn koden', 'Voer de code in', 'Wprowadź kod'),
	(247, 'TextBlock', 164, 'text', 'Письмо отправлено', 'Email sent', 'E-Mail gesendet', 'El correo electrónico enviado', 'Email inviata', 'Courriel envoyé', 'E-mail enviado', 'E-post skickat', 'Sähköposti lähetetään', 'E-post sendt', 'E-mail verzonden', 'E-mail wysłany'),
	(248, 'TextBlock', 165, 'text', 'Ваш email', 'Your email', 'Ihre E-Mail', 'Su correo electrónico', 'La tua e-mail', 'Votre e-mail', 'Seu e-mail', 'Din e-post', 'Sähköpostiosoite', 'Din e-post', 'Uw e-mail', 'Twój e-mail'),
	(249, 'TextBlock', 166, 'text', 'Восстановить пароль', 'Recover password', 'Passwort vergessen?', 'Recuperar contraseña', 'Recupera la tua password', 'Mot de passe oublié', 'Recuperar password', 'Återskapa lösenord', 'Salasanan palautus', 'Gjenopprett passord', 'Herstel wachtwoord', 'Przypomnij hasło'),
	(250, 'TextBlock', 167, 'text', 'Повторите пароль', 'Confirm password', 'Passwort bestätigen', 'Confirmar Contraseña', 'Conferma password', 'Confirmez le mot de passe', 'Confirme sua senha', 'Bekräfta lösenord', 'Vahvista salasana', 'Bekreft passord', 'Bevestig wachtwoord', 'Potwierdź hasło'),
	(251, 'TextBlock', 168, 'text', 'Я принимаю условия', 'I accept the conditions', 'Ich akzeptiere die Bedingungen', 'Acepto las condiciones', 'Accetto le condizioni', 'Je accepte les conditions', 'Aceito as condições', 'Jag godkänner villkoren', 'Hyväksyn ehdot', 'Jeg aksepterer vilkårene', 'Ik accepteer de voorwaarden', 'Akceptuję warunki'),
	(252, 'TextBlock', 169, 'text', 'Такой email уже зарегистрирован в системе', 'This email is already registered in the system', 'Diese E-Mail ist bereits im System registriert', 'Esta dirección de correo electrónico ya está registrada en el sistema', 'Questa email è già registrato nel sistema', 'Cet e-mail est déjà enregistrée dans le système', 'Este e-mail já está cadastrado no sistema', 'Denna e-post är redan registrerad i systemet', 'Tämä sähköpostiosoite on jo rekisteröity järjestelmään', 'Denne e-posten allerede er registrert i systemet', 'Deze e-mail is al in het systeem geregistreerd', 'Ten e-mail jest już zarejestrowany w systemie'),
	(253, 'TextBlock', 170, 'text', 'Пароли не совпадают', 'Passwords do not match', 'Passwörter stimmen nicht überein', 'Las contraseñas no coinciden', 'Le password non corrispondono', 'Les mots de passe ne correspondent pas', 'Senhas não conferem', 'Lösenorden matchar inte', 'Salasanat eivät täsmää', 'Passordene samsvarer ikke', 'Wachtwoorden komen niet overeen', 'Hasła nie są identyczne'),
	(254, 'TextBlock', 171, 'text', 'Вы должны принять условия пользовательского соглашения', 'You must accept the Terms of Service', 'Sie müssen die Nutzungsbedingungen akzeptieren', 'Debe aceptar las condiciones del servicio', 'Devi accettare i Termini di servizio', 'Vous devez accepter les Conditions d\'utilisation', 'Você deve aceitar os Termos de Serviço', 'Du måste godkänna användarvillkoren', 'Sinun on hyväksyttävä käyttöehdot', 'Du må godta vilkårene for bruk', 'Je moet de Algemene Voorwaarden accepteren', 'Musisz zaakceptować Warunki korzystania z usługi'),
	(255, 'TextBlock', 172, 'text', 'Пароль должен быть не короче 4 символов', 'Password must be at least 4 characters long', 'Das Passwort muss mindestens 4 Zeichen lang sein', 'La contraseña debe tener al menos 4 caracteres de longitud', 'La password deve essere lunga almeno 4 caratteri', 'Mot de passe doit comporter au moins 4 caractères', 'A senha deve ter no mínimo 4 caracteres', 'Lösenord måste vara minst 4 tecken långt', 'Salasanan pitää olla vähintään 4 merkkiä pitkä', 'Passord må være minst 4 tegn', 'Wachtwoord moet minimaal 4 tekens lang zijn', 'Hasło musi mieć co najmniej 4 znaki'),
	(256, 'TextBlock', 173, 'text', 'Еще раз пароль', 'Confirm your password', 'Bestätigen Sie Ihr Passwort', 'Confirme su contraseña', 'Conferma la tua password', 'Confirmez votre mot de passe', 'Confirme sua senha', 'Bekräfta lösenord', 'Vahvista salasana', 'Bekreft passordet ditt', 'Bevestig je wachtwoord', 'Potwierdź swoje hasło'),
	(257, 'TextBlock', 174, 'text', 'Сменить пароль', 'Change Password', 'Kennwort ändern', 'Cambiar la contraseña', 'Cambiare la password', 'Changer le mot de passe', 'Alterar a senha', 'Ändra lösenord', 'Vaihda salasana', 'Endre passord', 'Wachtwoord wijzigen', 'Zmień hasło'),
	(258, 'TextBlock', 175, 'text', 'Пароль слишком короткий', 'Password is too short', 'Passwort ist zu kurz', 'La contraseña es demasiado corta', 'La password è troppo corta', 'Mot de passe est trop court', 'A senha é muito curta', 'Lösenordet är för kort', 'Salasana on liian lyhyt', 'Passordet er for kort', 'Wachtwoord is te kort', 'Hasło jest za krótkie'),
	(259, 'TextBlock', 176, 'text', 'Пароль восстановлен', 'Password recovered', 'Passwort erholt', 'Contraseña recuperar', 'Password recuperato', 'Mot de passe récupéré', 'Senha recuperado', 'Lösenordet återvinnas', 'Salasana talteen', 'Passord utvinnes', 'Wachtwoord hersteld', 'Hasło odzyskane'),
	(260, 'TextBlock', 177, 'text', 'Неверный пароль', 'Invalid password', 'Ungültiges Kennwort', 'Contraseña no válida', 'Password non valida', 'Mot de passe invalide', 'Senha inválida', 'Ogiltigt lösenord', 'Virheellinen salasana', 'Ugyldig passord', 'Ongeldig wachtwoord', 'Nieprawidłowe hasło'),
	(261, 'TextBlock', 178, 'text', 'События за сегодня', 'Events for today', 'Termine für heute', 'Eventos para hoy', 'Eventi di oggi', 'Evénements pour aujourd\'hui', 'Eventos para hoje', 'Händelser för dag', 'Tapahtumat tänään', 'Hendelser for dag', 'Evenementen voor vandaag', 'Imprezy na dziś'),
	(262, 'TextBlock', 179, 'text', 'Всего событий', 'Total Events', 'Veranstaltungen insgesamt', 'Total de Eventos', 'Totale Eventi', 'Total des événements', 'Total de Eventos', 'Totalt händelser', 'Tapahtumia yhteensä', 'Totalt Hendelser', 'Totaal Events', 'Wszystkich Wydarzenia'),
	(263, 'TextBlock', 180, 'text', 'Все права защищены', 'All rights reserved', 'Alle Rechte vorbehalten', 'Reservados todos los derechos', 'Tutti i diritti riservati', 'Tous les droits sont réservés', 'Todos os direitos reservados', 'Alla rättigheter förbehållna', 'Kaikki oikeudet pidätetään', 'All rights reserved', 'Alle rechten voorbehouden', 'Wszystkie prawa zastrzeżone'),
	(264, 'TextBlock', 181, 'text', 'Дата', 'Date', 'Datum', 'Fecha', 'Data', 'Date', 'Data', 'Datum', 'Päivämäärä', 'Dato', 'Datum', 'Data'),
	(265, 'TextBlock', 182, 'text', 'Опубликован', 'Published', 'Veröffentlicht', 'Publicado', 'Pubblicato', 'Publié', 'Publicado', 'Publicerad', 'Julkaistu', 'Publisert', 'Gepubliceerd', 'Opublikowany'),
	(266, 'TextBlock', 183, 'text', 'да или нет', 'Yes or no', 'Ja oder nein', 'Sí o no', 'Sì o no', 'Oui ou non', 'Sim ou não', 'Ja eller nej', 'Kyllä tai ei', 'Ja eller nei', 'Ja of nee', 'Tak lub nie'),
	(267, 'TextBlock', 184, 'text', 'да', 'Yes', 'Ja', 'Sí', 'Sì', 'Oui', 'Sim', 'Yes', 'Kyllä', 'Ja', 'Ja', 'Tak'),
	(268, 'TextBlock', 185, 'text', 'нет', 'No', 'Keine', 'No', 'No', 'Aucun', 'Não', 'Ingen', 'Ei', 'Ikke', 'Geen', 'Nie'),
	(269, 'TextBlock', 186, 'text', 'От', 'From', 'Aus', 'Desde', 'Da', 'À partir de', 'A partir de', 'Från', 'Alkaen', 'Fra', 'Uit', 'Z'),
	(270, 'TextBlock', 187, 'text', 'До', 'To', 'Auf', 'A', 'A', 'À', 'A', 'Till', 'Jos haluat', 'Til', 'Aan', 'Do'),
	(271, 'TextBlock', 188, 'text', 'Новый блог пост', 'New blog post', 'Neuer Blog', 'Nueva entrada en el blog', 'Nuovo post sul blog', 'New blog post', 'Novo post no blog', 'Nya blogginlägg', 'Uusi blogikirjoitus', 'Nytt blogginnlegg', 'Nieuwe blog post', 'Nowy wpis na blogu'),
	(272, 'TextBlock', 189, 'text', 'Кратко', 'Briefly', 'Kurz', 'Brevemente', 'Brevemente', 'Brièvement', 'Resumidamente', 'Kortfattat', 'Lyhyesti', 'I korthet', 'Kort', 'Krótko'),
	(273, 'TextBlock', 190, 'text', 'Текст', 'Text', 'Text', 'Texto', 'Testo', 'Texte', 'Texto', 'Text', 'Teksti', 'Tekst', 'Tekst', 'Tekst'),
	(274, 'TextBlock', 191, 'text', 'УРЛ', 'URL', 'URL', 'URL', 'URL', 'URL', 'URL', 'URL', 'URL', 'URL', 'URL', 'URL'),
	(275, 'TextBlock', 193, 'text', 'пользовательского соглашения', 'User Agreement', 'Benutzervereinbarung', 'Acuerdo del usuario', 'Accordo per gli utenti', 'Accord de l\'utilisateur', 'Contrato de Usuário', 'Användaravtalet', 'Käyttäjäsopimus', 'Brukeravtale', 'Gebruikersovereenkomst', 'Umowa z użytkownikiem'),
	(276, 'TextBlock', 194, 'text', 'Этот пункт был успешно создан.', 'This item was successfully created.', 'Dieser Artikel wurde erfolgreich erstellt.', 'Este artículo se ha creado correctamente.', 'Questo elemento è stato creato con successo.', 'Cet article a été créé avec succès.', 'Este artigo foi criado com sucesso.', 'Detta objekt har skapats.', 'Tämä kohde on luotu onnistuneesti.', 'Dette elementet ble opprettet.', 'Dit item is succesvol aangemaakt.', 'Ten element został utworzony.'),
	(277, 'TextBlock', 195, 'text', 'Вы не имеете надлежащих полномочий на доступ к этой странице', 'You do not have the proper credentials to access this page', 'Sie haben nicht die richtigen Anmeldeinformationen, um diese Seite zuzugreifen', 'Usted no tiene las credenciales adecuadas para acceder a esta página', 'Non si dispone delle credenziali appropriate per accedere a questa pagina', 'Vous ne devez pas les informations d\'identification nécessaires pour accéder à cette page', 'Você não tem as credenciais adequadas para acessar esta página', 'Du har inte rätt meriter för att komma åt den här sidan', 'Sinulla ei ole asianmukaista valtakirjaa päästä tälle sivulle', 'Du har ikke de nødvendige rettighetene for å få tilgang til denne siden', 'Je hoeft niet de juiste referenties voor toegang tot deze pagina', 'Nie masz odpowiednie uprawnienia do dostępu do tej strony'),
	(278, 'TextBlock', 197, 'text', 'Закрытый раздел', 'A Closed Forum', 'Forum geschlossen', 'Un Foro Cerrado', 'Il forum è chiuso', 'Un forum fermé', 'A Forum Closed', 'Ett stängt forum', 'Suljettu foorumi', 'En lukket forum', 'Een gesloten forum', 'Zamknięty Forum'),
	(279, 'TextBlock', 210, 'text', 'Сервер не отвечает', 'The server is not responding', 'Der Server antwortet nicht', 'El servidor no responde', 'Il server non risponde', 'Le serveur ne répond pas', 'O servidor não está respondendo', 'Servern svarar inte', 'Palvelin ei vastaa', 'Serveren svarer ikke', 'De server reageert niet', 'Serwer nie odpowiada'),
	(280, 'TextBlock', 211, 'text', 'Данные сохранены', 'Data saved', 'Daten gespeichert', 'Los datos guardados', 'Dati salvati', 'Les données enregistrées', 'Dados salvos', 'Data sparas', 'Tallennetut tiedot', 'Data lagret', 'Gegevens opgeslagen', 'Dane zapisywane'),
	(281, 'TextBlock', 212, 'text', 'Ошибка при сохранении данных', 'Error saving data', 'Fehler beim Speichern der Daten', 'Error en los datos de ahorro', 'Errore durante il salvataggio dei dati', 'Erreur sauvegarde des données', 'Erro guardar dados', 'Fel spara data', 'Virhe tallennettaessa tietoja', 'Feil ved lagring av data', 'Fout bij het opslaan van gegevens', 'Błąd zapisu danych'),
	(282, 'TextBlock', 217, 'text', 'Неожиданный дополнительный поля формы с именем "%field%".', 'Unexpected extra form field named "%field%".', 'Unerwartete zusätzliche Formularfeld mit dem Namen "%field%".', 'Inesperado campo de formulario adicional llamado "campo%%".', 'Inaspettato campo modulo aggiuntivo denominato "campo%%".', 'Unexpected champ de formulaire supplémentaire nommé "champ%%".', 'Campo de formulário adicional inesperado chamado "campo%%".', 'Oväntat extra formulärfält med namnet "%fält%".', 'Odottamattomat ylimääräiset lomakkeen kenttä nimeltä "%field%".', 'Uventet ekstra skjemafelt som heter "%feltet%".', 'Onverwachte extra formulier veld met de naam "%veld%".', 'Nieoczekiwane dodatkowe pola formularza o nazwie "%pola%".'),
	(283, 'TextBlock', 221, 'text', 'Вы можете править текст прямо в списке. Исправьте все, что считаете нужным, а затем нажмите TAB или щелкните мышью в любом месте вне поля ввода.', 'You can edit the text directly in the list. Correct all that apply, and then press TAB or click anywhere outside of the input field.', 'Sie können den Text direkt in der Liste bearbeiten. Korrigieren Sie alles, was gelten, und drücken Sie TAB oder klicken Sie auf eine beliebige Stelle außerhalb des Eingabefeldes.', 'Puede editar el texto directamente en la lista. Corrija todas las que apliquen, a continuación, presione TAB o haga clic en cualquier lugar fuera del campo de entrada.', 'È possibile modificare il testo direttamente nella lista. Correggere tutte le risposte pertinenti, e quindi premere TAB o fare clic su un punto qualsiasi all\'esterno del campo di immissione.', 'Vous pouvez modifier le texte directement dans la liste. Corrigez toutes les cases, puis appuyez sur TAB ou cliquez n\'importe où en dehors de la zone de saisie.', 'Você pode editar o texto diretamente na lista. Corrija tudo que se aplica, em seguida, pressione TAB ou clique em qualquer lugar fora do campo de entrada.', 'Du kan redigera texten direkt i listan. Korrigera alla som gäller, och sedan på TAB eller klicka någonstans utanför inmatningsfältet.', 'Voit muokata tekstiä suoraan luettelosta. Korjaa kaikki soveltuvat, ja paina TAB tai napsauta mitä tahansa ulkopuolella syöttökenttään.', 'Du kan redigere teksten direkte i listen. Korrigere alle som passer, og deretter trykke TAB eller klikk hvor som helst utenfor inntastingsfeltet.', 'U kunt de tekst direct in de lijst te bewerken. Corrigeer alle die van toepassing zijn, en druk vervolgens op TAB of klik ergens buiten het invoerveld.', 'Można edytować tekst bezpośrednio na liście. Popraw wszystkie, które mają zastosowanie, a następnie naciśnij klawisz TAB lub kliknąć w dowolnym miejscu poza polem wprowadzania.'),
	(284, 'TextBlock', 222, 'text', 'Воспользуйтесь фильтром, чтобы найти нужный вам текст', 'Please use the filter to find the desired text', 'Bitte benutzen Sie den Filter, um den gewünschten Text zu finden', 'Utilice el filtro para encontrar el texto deseado', 'Si prega di utilizzare il filtro per trovare il testo desiderato', 'Se il vous plaît utiliser le filtre pour trouver le texte de votre choix', 'Por favor, use o filtro para encontrar o texto desejado', 'Använd filter för att hitta önskad text', 'Käytä suodatinta löytää haluamasi teksti', 'Bruk filteret for å finne ønsket tekst', 'Gebruik de filter om de gewenste tekst te zoeken', 'Proszę użyć filtru, aby znaleźć żądany tekst'),
	(285, 'TextBlock', 223, 'text', 'Отправить', 'Send', 'Senden', 'Enviar', 'Inviare', 'Envoyer', 'Enviar', 'Skicka', 'Lähettää', 'Sende', 'Sturen', 'Wysłać'),
	(286, 'TextBlock', 224, 'text', 'Объект не был сохранен из-за некоторых ошибок', 'The object was not saved due to some errors', 'Das Objekt wurde nicht aufgrund einiger Fehler gespeichert', 'El objeto no se salvó debido a algunos errores', 'L\'oggetto non è stato salvato a causa di alcuni errori', 'L\'objet n\'a pas été enregistré en raison de certaines erreurs', 'O objeto não foi poupada devido a alguns erros', 'Objektet sparades inte på grund av att vissa fel', 'Objekti ei ole tallennettu vuoksi joitakin virheitä', 'Objektet ble ikke lagret på grunn av noen feil', 'Het object is niet te wijten aan een aantal fouten opgeslagen', 'Obiekt nie został zapisany z powodu pewnych błędów'),
	(287, 'TextBlock', 225, 'text', 'Объект с таким значением поля "%column%" уже существует в системе.', 'The object with the value of the field "%column%" already exists in the system.', 'Das Objekt mit dem Wert des Feldes "%Spalte%" ist bereits in dem System.', 'El objeto con el valor del campo "columna de%%" ya existe en el sistema.', 'L\'oggetto con il valore del campo "%colonna%" esiste già nel sistema.', 'L\'objet de la valeur du champ "colonne de%%» existe déjà dans le système.', 'O objecto com o valor do campo "%%coluna" já existe no sistema.', 'Syftet med värdet av fältet "%kolumnen%" finns redan i systemet.', 'Esineen arvo kentän "%sarake%" on jo olemassa järjestelmässä.', 'Objektet med verdien av feltet "%%kolonnen" allerede finnes i systemet.', 'Het object met de waarde van het veld "%kolom%" reeds bestaat in het systeem.', 'Obiekt o wartości pola "%kolumny%" już istnieje w systemie.'),
	(288, 'TextBlock', 226, 'text', 'Обновить', 'Update', 'Aktualisierung', 'Actualización', 'Aggiornare', 'Mettre à jour', 'Atualizar', 'Uppdatera', 'Päivitys', 'Oppdater', 'Bijwerken', 'Aktualizacja'),
	(289, 'TextBlock', 235, 'text', 'Страницы', 'Page', 'Seite', 'Página', 'Pagina', 'Page', 'Página', 'Sida', 'Sivu', 'Page', 'Pagina', 'Strona'),
	(290, 'TextBlock', 236, 'text', 'Пользователи', 'Users', 'Benutzer', 'Usuarios', 'Utenti', 'Utilisateurs', 'Usuários', 'Användare', 'Käyttäjät', 'Brukere', 'Gebruikers', 'Użytkownicy'),
	(291, 'TextBlock', 237, 'text', 'Настройки', 'Settings', 'Einstellungen', 'Ajustes', 'Impostazioni', 'Paramètres', 'Configurações', 'Inställningar', 'Asetukset', 'Innstillinger', 'Instellingen', 'Ustawienia'),
	(292, 'TextBlock', 238, 'text', 'Редирект 301', '301s', '301S', '301s', '301s', '301s', '301s', '301s', '301s', '301s', '301s', '301s'),
	(293, 'TextBlock', 239, 'text', 'Уведомления', 'Notice', 'Bekanntmachung', 'Aviso', 'Avviso', 'Avis', 'Aviso', 'Observera', 'Ilmoitus', 'Notice', 'Kennisgeving', 'Ogłoszenie'),
	(294, 'TextBlock', 241, 'text', 'Откуда', 'Whence', 'Woher', '¿de dónde', 'Da cui', 'D\'où', 'De onde', 'Vari', 'Mistä', 'Hvorfra', 'Vanwaar', 'Skąd'),
	(295, 'TextBlock', 242, 'text', 'Куда', 'Where', 'Wo', 'Donde', 'Dove', 'Où', 'Onde', 'Var', 'Jossa', 'Hvor', 'Waar', 'Gdzie'),
	(296, 'TextBlock', 243, 'text', 'Описание', 'Description', 'Beschreibung', 'Descripción', 'Descrizione', 'Description', 'Descrição', 'Beskrivning', 'Kuvaus', 'Beskrivelse', 'Beschrijving', 'Opis'),
	(297, 'TextBlock', 245, 'text', 'с %from_date%по %to_date%', 'From %from_date% to %to_date%', 'Von%from_date%bis%to_date%', 'De %from_date% a %to_date%', 'Da%from_date% a %to_date%', 'De %from_date%à %to_date%', 'Desde%from_date%para%to_date%', 'Från%from_date%till%to_date%', 'Alkaen%from_date%  sta%to_date%', 'Fra%from_date%til%to_date%', 'Van%from_date%naar%to_date%', 'Od%from_date%do%to_date%'),
	(298, 'TextBlock', 246, 'text', 'Отмечено', 'Noted', 'Bekannt', 'Conocido', 'Noto', 'A noté', 'Notado', 'Noterat', 'Huomattava', 'Bemerket', 'Bekend', 'Zauważyć'),
	(299, 'TextBlock', 248, 'text', 'Вы должны выбрать хотя бы один объект', 'You must select at least one object', 'Sie müssen mindestens ein Objekt auswählen', 'Debe seleccionar al menos un objeto', 'È necessario selezionare almeno un oggetto', 'Vous devez sélectionner au moins un objet', 'Você deve selecionar pelo menos um objeto', 'Du måste välja minst ett objekt', 'Sinun on valittava ainakin yksi kohde', 'Du må velge minst ett objekt', 'U moet ten minste één object te selecteren', 'Musisz wybrać co najmniej jeden obiekt'),
	(300, 'TextBlock', 249, 'text', 'Блог пост', 'Blog post', 'Blog-Post', 'Post de blog', 'Post sul blog', 'Blog', 'Blog post', 'Blogginlägg', 'Blogi', 'Blogginnlegg', 'Blogpost', 'Blogu'),
	(301, 'TextBlock', 250, 'text', 'Дополниетльно', 'Additionally', 'Zusätzlich', 'Además', 'Inoltre', 'En outre', 'Adicionalmente', 'Dessutom', 'Lisäksi', 'I tillegg', 'Bovendien', 'Dodatkowo'),
	(302, 'TextBlock', 251, 'text', 'Редактировать блог пост', 'Edit a blog post', 'Bearbeiten Sie einen Blogeintrag', 'Edición de una entrada de blog', 'Modificare un post sul blog', 'Modifier un blog', 'Editar um post de blog', 'Redigera ett blogginlägg', 'Muokkaa blogi', 'Redigere et blogginnlegg', 'Bewerken van een blogpost', 'Edycja blogu'),
	(303, 'TextBlock', 252, 'text', 'Дата начала должна быть меньше даты окончания', 'Start date must be less than the end date', 'Startdatum muss kleiner als das Enddatum sein', 'Fecha de inicio debe ser menor que la fecha de finalización', 'Data di inizio deve essere inferiore alla data di fine', 'Date de début doit être inférieure à la date de fin', 'Data de início deve ser menor que a data final', 'Startdatumet måste vara mindre än slutdatumet', 'Aloituspäivä on oltava alle lopetuspäivä', 'Startdato må være mindre enn sluttdatoen', 'Startdatum moet lager zijn dan de einddatum', 'Data początkowa musi być mniejsza niż daty zakończenia'),
	(304, 'TextBlock', 257, 'text', '%%title%%', '%%title%%', '%%title%%', '%%title%%', '%%title%%', '%%title%%', '%%title%%', '%%title%%', '%%title%%', '%%title%%', '%%title%%', '%%title%%'),
	(305, 'TextBlock', 258, 'text', 'Email администратора', 'Email administrator', 'E-Mail-Administrator', 'Administrador Correo electrónico', 'Amministratore della posta elettronica', 'Administrateur de messagerie', 'Administrador de e-mail', 'Email administratör', 'Sähköposti ylläpitäjä', 'E-post administrator', 'Email administrator', 'Administrator e-mail'),
	(306, 'TextBlock', 259, 'text', 'На этот адрес вам будут приходить сообщения с сайта', 'At this address you will receive messages from the site', 'Unter dieser Adresse finden Sie Nachrichten aus dem Ort erhalten', 'En esta dirección va a recibir mensajes desde el sitio', 'A questo indirizzo potrete ricevere messaggi dal sito', 'A cette adresse vous recevrez des messages sur le site', 'Neste endereço você vai receber mensagens a partir do site', 'På denna adress kommer du att ta emot meddelanden från platsen', 'Tässä osoitteessa voit saada viestejä sivusto', 'På denne adressen vil du motta meldinger fra nettstedet', 'Op dit adres kunt u berichten van de site te ontvangen', 'Pod tym adresem można otrzymywać wiadomości z serwisu'),
	(307, 'TextBlock', 260, 'text', 'Имя отправителя почты', 'Email sender name', 'E-Mail Absendernamen', 'Email nombre del remitente', 'Email nome del mittente', 'Email nom de l\'expéditeur', 'E-mail Nome do remetente', 'Email avsändarnamn', 'Sähköposti lähettäjän nimi', 'Avsendernavn', 'E-mail afzender naam', 'E-mail Imię nadawcy'),
	(308, 'TextBlock', 261, 'text', 'От этого имени сайт будет отправлять почту', 'All emails will be sent on behalf of that name', 'Alle E-Mails werden im Namen dieser Name gesendet werden', 'Todos los correos electrónicos serán enviados en nombre de ese nombre', 'Tutti i email saranno inviate per conto di tale nome', 'Tous les e-mails seront envoyés au nom de ce nom', 'Todos os e-mails serão enviados em nome desse nome', 'Alla e-post kommer att skickas på uppdrag av det namnet', 'Kaikki sähköpostit lähetetään puolesta, että nimi', 'Alle e-poster vil bli sendt på vegne av det navnet', 'Alle e-mails namens die naam worden verzonden', 'Wszystkie e-maile będą wysyłane w imieniu tej nazwie'),
	(309, 'TextBlock', 263, 'text', 'Адрес', 'Address', 'Adresse', 'Dirección', 'Indirizzo', 'Adresse', 'Endereço', 'Adress', 'Osoite', 'Adresse', 'Adres', 'Adres'),
	(310, 'TextBlock', 264, 'text', 'Контактный телефон', 'Contact phone', 'Kontakt Telefon', 'Teléfono del contacto', 'Telefono di contatto', 'Numéro de téléphone', 'Telefone de contato', 'Kontakta telefon', 'Yhteystiedot puhelin', 'Kontakt telefon', 'Contact telefoon', 'Telefon kontaktowy'),
	(311, 'TextBlock', 265, 'text', 'Контактный email', 'Contact email', 'Kontakt per E-Mail', 'Email de contacto', 'Contatto e-mail', 'Contact email', 'E-mail', 'Kontakta e-post', 'Yhteyssähköposti', 'Kontakt e-post', 'Contact e-mail', 'Kontakt e-mail'),
	(312, 'TextBlock', 266, 'text', 'Тип', 'Type', 'Typ', 'Tipo', 'Tipo', 'Type', 'Tipo', 'Typ', 'Tyyppi', 'Type', 'Type', 'Typ'),
	(313, 'TextBlock', 267, 'text', 'Описание', 'Description', 'Beschreibung', 'Descripción', 'Descrizione', 'Description', 'Descrição', 'Beskrivning', 'Kuvaus', 'Beskrivelse', 'Beschrijving', 'Opis'),
	(314, 'TextBlock', 268, 'text', 'Письмо администратору', 'Email to the administrator', 'E-Mail an den Administrator', 'Correo electrónico al administrador', 'E-mail all\'amministratore', 'Envoyer à l\'administrateur', 'E-mail para o administrador', 'E-posta till administratören', 'Sähköposti ylläpitäjälle', 'E-post til administrator', 'E-mail naar de beheerder', 'E-mail do administratora'),
	(315, 'TextBlock', 269, 'text', 'Письмо пользователю', 'Email to the user', 'E-Mail an den Benutzer', 'Correo electrónico para el usuario', 'E-mail per l\'utente', 'Envoyer à l\'utilisateur', 'E-mail para o usuário', 'E-post till användaren', 'Sähköposti käyttäjälle', 'E-post til brukeren', 'E-mail naar de gebruiker', 'E-mail do użytkownika'),
	(316, 'TextBlock', 270, 'text', 'Номер телефона', 'Telephone number', 'Telefonnummer', 'Número telefónico', 'Numero di telefono', 'Numéro de téléphone', 'Número de telefone', 'Telefonnummer', 'Puhelinnumero', 'Telefonnummer', 'Telefoonnummer', 'Numer telefonu'),
	(317, 'TextBlock', 271, 'text', 'Название компании', 'Company name', 'Name der Firma', 'Nombre de empresa', 'Nome della ditta', 'Nom de l\'entreprise', 'Nome da empresa', 'Företagsnamn', 'Yrityksen nimi', 'Firmanavn', 'Bedrijfsnaam', 'Nazwa firmy'),
	(318, 'TextBlock', 272, 'text', 'Прикрепленный файл', 'Attached File', 'Angehängte Datei', 'Archivo adjunto', 'File allegato', 'Fichier joint', 'Arquivo anexado', 'Bifogad Fil', 'Liitetiedosto', 'Vedlagt fil', 'Bijgevoegd bestand', 'Załączony plik'),
	(319, 'TextBlock', 275, 'text', 'Показать', 'Show', 'Show', 'Show', 'Spettacolo', 'Spectacle', 'Espetáculo', 'Visa', 'Show', 'Vis', 'Tonen', 'Show'),
	(320, 'TextBlock', 279, 'text', 'Восстановление пароля', 'Password recovery', 'Passwort-Wiederherstellung', 'Recuperar la contraseña', 'Il recupero della password', 'Récupération de mot de passe', 'Recuperação de senha', 'Lösenordshämtning', 'Salasanan palautus', 'Passordgjenoppretting', 'Wachtwoord herstel', 'Odzyskiwanie hasła'),
	(321, 'TextBlock', 281, 'text', 'Регистрация', 'Registration', 'Anmeldung', 'Registro', 'Registrazione', 'Inscription', 'Registro', 'Registrering', 'Rekisteröinti', 'Registrering', 'Registratie', 'Rejestracja'),
	(322, 'TextBlock', 283, 'text', 'Страница', 'Page', 'Seite', 'Página', 'Pagina', 'Page', 'Página', 'Sida', 'Sivu', 'Page', 'Pagina', 'Strona'),
	(323, 'TextBlock', 284, 'text', 'Описание', 'Description', 'Beschreibung', 'Descripción', 'Descrizione', 'Description', 'Descrição', 'Beskrivning', 'Kuvaus', 'Beskrivelse', 'Beschrijving', 'Opis'),
	(324, 'TextBlock', 285, 'text', 'Редирект 301', '301s', '301S', '301s', '301s', '301s', '301s', '301s', '301s', '301s', '301s', '301s'),
	(325, 'TextBlock', 287, 'text', 'Email шаблоны', 'Email templates', 'E-Mail-Vorlagen', 'Plantillas de correo electrónico', 'Modelli di e-mail', 'Modèles de courriel', 'Modelos de email', 'E-postmallar', 'Email malleja', 'E-post maler', 'E-mail templates', 'Szablony e-mail'),
	(326, 'TextBlock', 288, 'text', 'Имя', 'First name', 'Vorname', 'Nombre de pila', 'Nome', 'Prénom', 'Primeiro nome', 'Förnamn', 'Etunimi', 'Fornavn', 'Voornaam', 'Imię'),
	(327, 'TextBlock', 289, 'text', 'Email', 'Email', 'E-Mail', 'Correo electrónico', 'Email', 'Email', 'Email', 'E-post', 'Sähköposti', 'E-post', 'E-mail', 'E-mail'),
	(328, 'TextBlock', 290, 'text', 'Неверный формат файла (%mime_type%).', 'Incorrect file format (%mime_type%).', 'Falsche Dateiformat (%mime_type%).', 'Formato de archivo incorrecto (%mime_type%).', 'Formato di file non corretto (%mime_type%).', 'Format de fichier incorrect (%mime_type de%).', 'Formato de arquivo incorreto (%mime_type%).', 'Felaktigt filformat (%mime_type%).', 'Virheellinen tiedostomuoto (%mime_type%).', 'Feil filformat (%mime_type%).', 'Verkeerde bestandsformaat (%mime_type%).', 'Nieprawidłowy format pliku (%mime_type%).'),
	(329, 'EmailTemplate', 1, 'subject', 'Регистрация на проекте DEV2', 'Register on the project DEV2', 'Registrieren Sie sich auf der Projekt DEV2', 'Registrar en el proyecto DEV2', 'Registrati sul progetto DEV2', 'Inscrivez-vous sur le projet DEV2', 'Registre-se no projeto DEV2', 'Registrera dig på projektet dev2', 'Rekisteröidy hankkeesta DEV2', 'Registrere seg på prosjektet DEV2', 'Registreer je op het project DEV2', 'Zarejestruj się na projekcie DEV2'),
	(330, 'EmailTemplate', 1, 'message', 'Здравствуйте, {%first_name%}! Вы успешно прошли регистрацию! Перейдите по {%link%}, чтобы активировать свой аккаунт!', 'Hello, {%first_name%}! You have been registered successfully! Follow this {%link%}, to activate your account!', 'Hallo, {%vorname%}! Sie haben sich erfolgreich registriert! Folgen Sie dieser {%link%}, um Ihr Konto zu aktivieren!', 'Hola, {%FIRST_NAME%}! Usted ha sido registrado correctamente! Siga este enlace%{%}, para activar su cuenta!', 'Ciao, {%first_name%}! Lei si è iscritto con successo! Seguire questo collegamento {%%}, per attivare il tuo account!', 'Bonjour, {}%prenom%! Vous avez été enregistré avec succès! Suivez ce lien {%%}, pour activer votre compte!', 'Olá, {%primeiro_nome%}! Você foi registrado com sucesso! Siga este link {%}%, para ativar sua conta!', 'Hej, {%förnamn%}! Du har registrerats med framgång! Följ denna {%link%}, för att aktivera ditt konto!', 'Hei, {%first_name%}! Olet rekisteröitynyt onnistuneesti! Seuraa tätä {%linkkiä%}, voit aktivoida tilisi!', 'Hei, {%FIRST_NAME%}! Du har blitt registrert med hell! Følg denne {%lenken%}, for å aktivere kontoen din!', 'Hallo, {%first_name%}! U bent succesvol geregistreerd! Volg deze {%link%}, om uw account te activeren!', 'Witaj, {%first_name%}! Po zarejestrowaniu powodzeniem! Śledź ten {%łącza%}, aby aktywować swoje konto!'),
	(331, 'EmailTemplate', 2, 'subject', 'Регистрация нового пользователя', 'Register a new account', 'Neu registrieren', 'Registrar una cuenta nueva', 'Registra un nuovo utente', 'Créer un nouveau compte', 'Registar uma nova conta', 'Registrera ett nytt konto', 'Rekisteröi uusi tili', 'Registrere en ny konto', 'Registreer een nieuwe account', 'Zarejestruj nowe konto'),
	(332, 'EmailTemplate', 2, 'message', 'Пользователь {%full_name%} зарегистрировался', 'User {%full_name%} registered with us!', 'Benutzer {%full_name%} bei uns registriert!', 'Usuario {%}%FULL_NAME registrado con nosotros!', 'User {%full_name%} registrato con noi!', 'User {}%full_name%enregistré avec nous!', 'Usuário {%}%full_name registrado conosco!', 'Användare {%FULL_NAME%} registrerad hos oss!', 'Käyttäjän {%FULL_NAME%} rekisteröitynyt kanssamme!', 'Bruker {%FULL_NAME%} registrert hos oss!', 'Gebruiker {%full_name%} bij ons geregistreerd!', 'Użytkownik {%FULL_NAME%} zarejestrowany razem z nami!'),
	(333, 'EmailTemplate', 3, 'subject', 'Восстановление пароля', 'Password recovery', 'Passwort-Wiederherstellung', 'Recuperar la contraseña', 'Il recupero della password', 'Récupération de mot de passe', 'Recuperação de senha', 'Lösenordshämtning', 'Salasanan palautus', 'Passordgjenoppretting', 'Wachtwoord herstel', 'Odzyskiwanie hasła'),
	(334, 'EmailTemplate', 3, 'message', 'Доброго времени суток, {%full_name%} Вы запросили воcстановление пароля на сайте Dev2.Перейдите по {%LINK%} для установки нового пароля.Если запрос отправляли не Вы, проигнорируйте это письмо.', 'Good day, {%full_name%} You have requested  password recovery on Dev2 project. Follow this {%LINK%} to set a new password. If you have not requested password recovery, please ignore this letter.', 'Guten Tag, {%full_name%} Sie haben Passwort-Wiederherstellung auf Dev2 Projekt angefordert. Folgen Sie dieser {%LINK%}, um ein neues Passwort festzulegen. Wenn Sie noch kein Passwort-Wiederherstellung angefordert, ignorieren Sie bitte diesen Brief.', 'Buen día, {%FULL_NAME%} que ha requerido de recuperación de contraseña en proyecto disp2. Siga este {%ENLACE%} para establecer una nueva contraseña. Si no ha solicitado la recuperación de la contraseña, por favor ignorar esta carta.', 'Buon giorno, {%full_name%} che hai richiesto il recupero della password sul progetto DEV2. Seguire questa {%LINK%} per impostare una nuova password. Se non è stato richiesto il recupero della password, si prega di ignorare questa lettera.', 'Bonjour, {%full_name%} Vous avez demandé la récupération de mot de passe sur le projet Dev2. Suivez cette {%LINK%} pour définir un nouveau mot de passe. Si vous ne l\'avez pas demandé la récupération de mot de passe, se il vous plaît ignorer cette lettre.', 'Bom dia, {%full_name%} Você pediu recuperação de senha no projeto Dev2. Siga este link {%%} para definir uma nova senha. Se você não solicitou a recuperação de senha, por favor ignore esta carta.', 'God dag, {%FULL_NAME%} Du har begärt återställning av lösenord på dev2 projektet. Följ denna {LINK%%} för att ange ett nytt lösenord. Om du inte har begärt återställning av lösenord, kan du ignorera det här brevet.', 'Hyvää päivää, {%FULL_NAME%} Olet pyytänyt salasanan elpyminen DEV2 projekti. Seuraa tätä {%LINK%} asettaa uuden salasanan. Jos et ole pyytänyt salasanan palautus, voit jättää tämän kirjeen.', 'God dag, {%FULL_NAME%} Du har bedt om passordgjenoppretting på Dev2 prosjektet. Følg dette {%LINK%} for å sette et nytt passord. Hvis du ikke har bedt om passordgjenoppretting, kan du se bort fra dette brevet.', 'Goede dag, {%full_name%} Je hebt een wachtwoord recovery op Dev2 project gevraagd. Volg deze {%link%} om een ​​nieuw wachtwoord in te stellen. Als u nog niet gevraagd password recovery, negeer deze brief.', 'Dzień dobry, {%FULL_NAME%} Zażądano odzyskiwania hasła w projekcie Dev2. Śledź ten {%LINK%}, aby ustawić nowe hasło. Jeśli nie o odzyskanie hasła, proszę zignorować ten list.'),
	(335, 'EmailTemplate', 4, 'subject', 'Проект DEV2. Ваше сообщение очень важно для нас!', 'Project DEV2. Your message is important to us!', 'Projekt DEV2. Ihre Nachricht ist uns wichtig!', 'DEV2 Proyecto. Su mensaje es importante para nosotros!', 'Progetto DEV2. Il tuo messaggio è importante per noi!', 'DEV2 projet. Votre message est important pour nous!', 'Projeto DEV2. Sua mensagem é importante para nós!', 'Projekt dev2. Ditt meddelande är viktig för oss!', 'Projekti DEV2. Viestisi on meille tärkeää!', 'Prosjekt DEV2. Din melding er viktig for oss!', 'Project DEV2. Uw boodschap is belangrijk voor ons!', 'Projekt DEV2. Twoja wiadomość jest dla nas ważne!'),
	(336, 'EmailTemplate', 4, 'message', 'Уважаемый {%name%}! Спасибо за Ваше сообщение! Оно очень важно для нас!', 'Dear {%name%}! Thank you for your message! It is very important to us!', 'Sehr geehrte {%name%}! Vielen Dank für Ihre Nachricht! Es ist sehr wichtig für uns!', 'Estimado {%nombre%}! Gracias por tu mensaje! Es muy importante para nosotros!', 'Gentile {%nome%}! Grazie per il tuo messaggio! E \'molto importante per noi!', 'Cher {}%%nom! Merci pour votre message! Il est très important pour nous!', 'Caro {}%name%! Obrigado por sua mensagem! É muito importante para nós!', 'Kära {%name%}! Tack för ditt meddelande! Det är mycket viktigt för oss!', 'Rakas {%name%}! Kiitos viestistäsi! On erittäin tärkeää meille!', 'Kjære {%name%}! Takk for din melding! Det er veldig viktig for oss!', 'Beste {%name%}! Dank u voor uw bericht! Het is erg belangrijk voor ons!', 'Drogi {%%name}! Dziękujemy za wiadomość! Jest to dla nas bardzo ważne!'),
	(337, 'EmailTemplate', 5, 'subject', 'Проект DEV2. Новое сообщение', 'Project DEV2. new message', 'Projekt DEV2. neue Nachricht', 'DEV2 Proyecto. nuevo mensaje', 'Progetto DEV2. nuovo messaggio', 'DEV2 projet. nouveau message', 'Projeto DEV2. nova mensagem', 'Projekt dev2. nytt meddelande', 'Projekti DEV2. uusi viesti', 'Prosjekt DEV2. ny melding', 'Project DEV2. nieuw bericht', 'Projekt DEV2. nowa wiadomość'),
	(338, 'EmailTemplate', 5, 'message', 'Некто {%name%} прислал сообщение. Текст: {%message%} E-Mail: {%email%}', 'Someone {%name%} sent a message. Text: {%message%} E-Mail: {%email%}', 'Jemand {%name%} eine Nachricht geschickt. Text: {%message%} E-Mail: {%email%}', 'Alguien {nombre}%%envió un mensaje. Texto: {%}%de mensajes de E-Mail: {%email%}', 'Qualcuno {nome}%%ha inviato un messaggio. Testo: {%messaggio%} E-Mail: {%email%}', 'Quelqu\'un {%name%} a envoyé un message. Texte: {}%message%E-Mail: {}%email%', 'Alguém {name%%} enviou uma mensagem. Texto: {%%} mensagem de E-Mail: {%email%}', 'Någon {%name%} skickade ett meddelande. Text: {%meddelande%} E-Mail: {%email%}', 'Joku {%name%} lähetti viestin. Teksti: {%viesti%} E-Mail: {%email%}', 'Noen {%name%} sendte en melding. Tekst: {%melding%} E-Mail: {%email%}', 'Iemand {%name%} stuurde een boodschap. Tekst: {%message%} E-Mail: {%email%}', 'Ktoś {nazwa%%} wysłał wiadomość. Tekst: {}%%wiadomości e-mail: {%email%}'),
	(339, 'MenuItem', 1, 'name', 'Главное меню', 'Main Menu', 'Hauptmenü', 'Menú Principal', 'Menu principale', 'Menu principal', 'Menu Principal', 'Huvudmeny', 'Päävalikko', 'Hovedmeny', 'Hoofdmenu', 'Menu główne'),
	(340, 'MenuItem', 2, 'name', 'На главную', 'Home', 'Zuhause', 'Casa', 'Casa', 'Maison', 'Casa', 'Start', 'Koti', 'Hjem', 'Thuis', 'Dom'),
	(341, 'MenuItem', 3, 'name', 'О нас', 'About Us', 'Über uns', 'Sobre nosotros', 'Chi siamo', 'À propos de nous', 'Sobre nós', 'Om oss', 'Meistä', 'Om oss', 'Over ons', 'O nas'),
	(342, 'MenuItem', 4, 'name', 'Контакты', 'Contacts', 'Kontakte', 'Contactos', 'Contatti', 'Contacts', 'Contactos', 'Kontakter', 'Yhteydet', 'Kontakter', 'Contacten', 'Kontakt'),
	(343, 'MenuItem', 5, 'name', 'Закрытый раздел', 'A Closed Forum', 'Forum geschlossen', 'Un Foro Cerrado', 'Il forum è chiuso', 'Un forum fermé', 'A Forum Closed', 'Ett stängt forum', 'Suljettu foorumi', 'En lukket forum', 'Een gesloten forum', 'Zamknięty Forum'),
	(344, 'MenuItem', 6, 'name', 'Нижнее меню', 'Footer menu', 'Footer Menü', 'Menú Pie de página', 'Menù di fondo pagina', 'Menu du bas', 'Menu Rodapé', 'Footer meny', 'Footer valikossa', 'Menyen footer', 'Footer menu', 'Menu stopka'),
	(345, 'MenuItem', 7, 'name', 'Политика конфиденциальности', 'Privacy policy', 'Datenschutz-Bestimmungen', 'Política de privacidad', 'Politica sulla riservatezza', 'Politique de confidentialité', 'Política de Privacidade', 'Integritetspolicy', 'Yksityisyyden suoja', 'Personvern', 'Privacy beleid', 'Polityka prywatności'),
	(346, 'MenuItem', 8, 'name', 'Пользовательское соглашение', 'User Agreement', 'Benutzervereinbarung', 'Acuerdo del usuario', 'Accordo per gli utenti', 'Accord de l\'utilisateur', 'Contrato de Usuário', 'Användaravtalet', 'Käyttäjäsopimus', 'Brukeravtale', 'Gebruikersovereenkomst', 'Umowa z użytkownikiem'),
	(347, 'Config', 7, 'value', 'DEV2, Администрация', 'DEV2, Administration', 'DEV2, Verwaltung', 'DEV2, Administración', 'DEV2, Amministrazione', 'DEV2, Administration', 'DEV2, Administração', 'Dev2, Administration', 'DEV2, Hallinto', 'DEV2, Administrasjon', 'DEV2, Administratie', 'DEV2, Administracja'),
	(348, 'Config', 18, 'value', 'Беларусь, Минск, ул. Есенина 16, кв.201', 'Belarus, Minsk, Esenina str.,16-201', 'Weißrussland, Minsk, Esenina str., 16-201', 'Bielorrusia, Minsk, Esenina str., 16-201', 'Bielorussia, Minsk, Esenina str., 16-201', 'Biélorussie, Minsk, Esenina str., 16-201', 'Belarus, Minsk, Esenina str., 16-201', 'Vitryssland, Minsk, Esenina str., 16-201', 'Valko-Venäjä, Minsk, Esenina str., 16-201', 'Hviterussland, Minsk, Esenina str., 16-201', 'Wit-Rusland, Minsk, Esenina str., 16-201', 'Białoruś, Mińsk, Esenina str., 16-201'),
	(349, 'TextBlock', 291, 'text', 'Пароль', 'Password', 'Kennwort', 'Contraseña', 'Password', 'Mot de passe', 'Senha', 'Lösenord', 'Salasana', 'Passord', 'Wachtwoord', 'Hasło'),
	(350, 'TextBlock', 292, 'text', 'Регистрация', 'Registration', 'Anmeldung', 'Registro', 'Registrazione', 'Inscription', 'Registro', 'Registrering', 'Rekisteröinti', 'Registrering', 'Registratie', 'Rejestracja'),
	(351, 'TextBlock', 293, 'text', 'ссылке', 'Link', 'Link', 'Enlace', 'Collegamento', 'Lien', 'Link', 'Länk', 'Linkki', 'Link', 'Link', 'Powiązanie'),
	(354, 'TextBlock', 295, 'text', 'Уведомления', 'Notifications', 'Benachrichtigungen', 'Notificaciones', 'Notifiche', 'Notifications', 'Notificações', 'Underrättelse', 'Ilmoitukset', 'Påminnelser', 'Bekendmakingen', 'Powiadomienia'),
	(356, 'TextBlock', 296, 'text', 'Страницы', 'Pages', 'Seiten', 'Páginas', 'Pagine', 'Pages', 'Páginas', 'Sidor', 'Sivut', 'Sider', 'Pages', 'Strony'),
	(357, 'TextBlock', 297, 'text', 'Применить', 'Apply', 'Anwenden', 'Aplicar', 'Applicare', 'Appliquer', 'Aplicar', 'Tillämpa', 'Käyttää', 'Påfør', 'Van toepassing zijn', 'Zastosować'),
	(358, 'TextBlock', 298, 'text', 'Отменить', 'Cancel', 'Stornieren', 'Cancelar', 'Annullare', 'Annuler', 'Cancelar', 'Avboka', 'Peruuttaa', 'Avbryt', 'Annuleren', 'Anulować'),
	(359, 'TextBlock', 299, 'text', 'Данные сохранены', 'Changes saved!', 'Änderungen gespeichert!', 'Los cambios guardados!', 'Modifiche salvate!', 'Modifications enregistrées!', 'Alterações salvo!', 'Ändringar sparas!', 'Muutokset tallennettu!', 'Endringer lagret!', 'Wijzigingen opgeslagen!', 'Zmiany zapisane!'),
	(360, 'TextBlock', 301, 'text', 'Изображение удалено', 'Image removed', 'Bild entfernt', 'Imagen eliminado', 'Immagine rimossa', 'Image Removed', 'Imagem retirada', 'Image avlägsnades', 'Kuva poistetaan', 'Bilde fjernet', 'Afbeelding verwijderd', 'Usunąć zdjęcie'),
	(361, 'TextBlock', 303, 'text', 'Код введен неверно', 'The code you entered is invalid', 'Der eingegebene Code ist ungültig', 'El código que ha introducido no es válido', 'Il codice inserito non è valido', 'Le code que vous avez entré est invalide', 'O código digitado é inválido', 'Koden du angav är ogiltigt', 'Koodi on virheellinen', 'Koden du skrev inn er ugyldig', 'De code die u hebt ingevoerd is ongeldig', 'Kod jest nieprawidłowy'),
	(362, 'TextBlock', 304, 'text', 'Такой email не зарегистрирован в системе', 'This email is not registered in the system', 'Diese E-Mail wird nicht im System registriert', 'Esta dirección de correo electrónico no está registrada en el sistema', 'Questa email non è registrata nel sistema', 'Cet e-mail est pas enregistrée dans le système', 'Este e-mail não está cadastrado no sistema', 'Denna e-post är inte registrerad i systemet', 'Tämä sähköpostiosoite ei ole rekisteröity järjestelmään', 'Denne e-posten er ikke registrert i systemet', 'Deze e-mail wordt niet geregistreerd in het systeem', 'Ten e-mail nie jest zarejestrowany w systemie'),
	(363, 'TextBlock', 305, 'text', 'CSRF токен', ' CSRF token', 'CSRF-Token', 'Token CSRF', 'Token CSRF', 'CSRF jeton', 'Token de CSRF', 'CSRF token', 'CSRF token', 'CSRF token', 'CSRF token', 'Token CSRF'),
	(364, 'TextBlock', 306, 'text', 'Этот пункт был успешно удален.', 'The item was deleted successfully.', 'Der Artikel wurde erfolgreich gelöscht.', 'El tema se ha eliminado correctamente.', 'L\'elemento è stato eliminato con successo.', 'L\'article a été supprimé.', 'O item foi excluído com sucesso.', 'Varan raderats.', 'Tuote on poistettu onnistuneesti.', 'Elementet ble slettet.', 'Het item is succesvol verwijderd.', 'Element został usunięty pomyślnie.'),
	(365, 'TextBlock', 307, 'text', 'Вы должны выбрать действие для выполнения на выбранных элементах.', 'You must select an action to execute on the selected items.', 'Sie müssen eine Aktion auswählen, die für die ausgewählten Objekte auszuführen.', 'Usted debe seleccionar una acción a ejecutar en los elementos seleccionados.', 'È necessario selezionare l\'azione da eseguire sugli oggetti selezionati.', 'Vous devez sélectionner une action à exécuter sur les éléments sélectionnés.', 'Você deve selecionar uma ação para executar sobre os itens selecionados.', 'Du måste välja en åtgärd att utföra på de valda objekten.', 'Sinun tulee valita toiminnan suoritettavaksi valitut kohteet.', 'Du må velge en handling for å kjøre på de valgte elementene.', 'U moet een actie selecteren om uit te voeren op de geselecteerde items.', 'Musisz wybrać akcję do wykonania na wybranych pozycjach.'),
	(366, 'TextBlock', 308, 'text', 'Выбранные элементы были успешно удалены.', 'The selected items have been deleted successfully.', 'Die ausgewählten Elemente wurden erfolgreich gelöscht.', 'Los elementos seleccionados se han eliminado con éxito.', 'Gli elementi selezionati sono stati cancellati con successo.', 'Les articles sélectionnés ont été supprimés avec succès.', 'Os itens selecionados foram apagados com sucesso.', 'De valda objekten har tagits bort.', 'Valitut kohteet on poistettu onnistuneesti.', 'De valgte elementene har blitt slettet.', 'De geselecteerde items zijn met succes verwijderd.', 'Wybrane pozycje zostały pomyślnie usunięte.'),
	(367, 'TextBlock', 310, 'text', 'Cообщения с сайта', 'Messages from site', 'Nachrichten von Website', 'Mensajes del sitio', 'Messaggi dal sito', 'Messages à partir du site', 'Mensagens do site', 'Meddelanden från webbplatsen', 'Viestit site', 'Meldinger fra stedet', 'Berichten van de site', 'Wiadomości z serwisu'),
	(369, 'Page', 22, 'content', 'Внимание! Email {%email%} уже существует в системе! Если это Ваш email, подтвердите его!', 'Attention! Email {%email%} already exists in the system! If this is your email, confirm it!', 'Achtung! Email {%email%} existiert bereits im System! Wenn dies Ihr E-Mail, bestätigen Sie es!', '¡Atención! Email {%email%} ya existe en el sistema! Si esta es tu dirección de correo electrónico, confirmarlo!', 'Attenzione! Email {%email%} esiste già nel sistema! Se questa è la tua e-mail, confermarlo!', 'Attention! Email {%email%} existe déjà dans le système! Si ceci est votre e-mail, confirmez-le!', 'Atenção! E-mail {%email%} já existe no sistema! Se este é o seu e-mail, confirme-a!', 'Observera! E {%email%} finns redan i systemet! Om detta är din e-post, bekräfta det!', 'Huomio! Sähköposti {%email%} on jo olemassa järjestelmässä! Jos tämä on sähköpostiosoite, hyväksy se!', 'Attention! Det finnes e {%email%} allerede er i systemet! Hvis dette er din e-post, bekrefter det!', 'Let op! E-mail {%email%} bestaat al in het systeem! Als dit uw e-mail, bevestigen het!', 'Uwaga! E-mail {%email%} już istnieje w systemie! Jeśli jest to Twój adres e-mail, sprawdź to!'),
	(370, 'Page', 22, 'meta_title', 'Подтверждение аккаунта в соцсети', 'Confirm your social networks account', 'Ihren sozialen Netzwerken angemeldet Bestätigen', 'Confirme su cuenta de redes sociales', 'Conferma il tuo account social network', 'Confirmez votre compte réseaux sociaux', 'Confirme a sua conta de redes sociais', 'Bekräfta ditt sociala nätverk konto', 'Vahvista sosiaaliset verkostot tili', 'Bekreft ditt sosiale nettverk konto', 'Bevestig uw sociale netwerken rekening', 'Potwierdź swoje konto sieci społecznych'),
	(371, 'Page', 22, 'meta_description', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(372, 'Page', 22, 'meta_keywords', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(373, 'Page', 23, 'name', 'Подтверждение аккаунта в соцсети. Шаг второй', 'Confirm your social networks account. step two', 'Bestätigen Sie Ihre sozialen Netzwerke Konto. Schritt zwei', 'Confirme su cuenta de redes sociales. paso dos', 'Conferma il tuo account di social network. fase due', 'Confirmez votre compte réseaux sociaux. la deuxième étape', 'Confirme a sua conta de redes sociais. a segunda etapa', 'Bekräfta ditt sociala nätverk konto. steg två', 'Vahvista sosiaalisten verkostojen huomioon. vaihe kaksi', 'Bekreft ditt sosiale nettverk konto. trinn to', 'Bevestig uw sociale netwerken houden. stap twee', 'Potwierdź swoje konto sieci społecznych. krok drugi'),
	(374, 'Page', 23, 'content', 'На ваш электронный ящик {%email%} выслано письмо!', 'Confirmation letter has been sent to your email address {%email%}', 'Bestätigungsschreiben wurde an Ihre E-Mail-Adresse gesendet wurde, {%email%}', 'Carta de confirmación ha sido enviada a su dirección de correo electrónico {%email%}', 'Lettera di conferma è stata inviata al tuo indirizzo email {%email%}', 'Lettre de confirmation a été envoyé à votre adresse e-mail {%email%}', 'Carta de confirmação foi enviado para seu endereço de e-mail {%email%}', 'Bekräftelsebrev har skickats till din e-postadress {%email%}', 'Vahvistus kirje on lähetetty sähköpostiosoitteesi {%email%}', 'Bekreftelsesbrev har blitt sendt til din e-postadresse {%email%}', 'Bevestigingsbrief is naar uw e-mailadres gestuurd {%email%}', 'List z potwierdzeniem został wysłany na Twój adres e-mail {%email%}'),
	(375, 'Page', 23, 'meta_title', 'Подтверждение аккаунта в соцсети. Шаг второй', 'Confirm your social networks account', 'Ihren sozialen Netzwerken angemeldet Bestätigen', 'Confirme su cuenta de redes sociales', 'Conferma il tuo account social network', 'Confirmez votre compte réseaux sociaux', 'Confirme a sua conta de redes sociais', 'Bekräfta ditt sociala nätverk konto', 'Vahvista sosiaaliset verkostot tili', 'Bekreft ditt sosiale nettverk konto', 'Bevestig uw sociale netwerken rekening', 'Potwierdź swoje konto sieci społecznych'),
	(376, 'Page', 23, 'meta_description', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(377, 'Page', 23, 'meta_keywords', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(378, 'Page', 24, 'name', 'Ошибка авторизации OAuth', 'OAuth authorization error', 'OAuth Berechtigungsfehler', 'Error de autorización OAuth', 'OAuth errore di autorizzazione', 'OAuth erreur d\'autorisation', 'Erro de autorização OAuth', 'OAuth tillståndsfelet', 'OAuth luvan virhe', 'OAuth autorisasjonsfeil', 'OAuth fout machtiging', 'Błąd autoryzacji OAuth'),
	(379, 'Page', 24, 'content', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(380, 'Page', 24, 'meta_title', 'Ошибка авторизации OAuth', 'OAuth authorization error', 'OAuth Berechtigungsfehler', 'Error de autorización OAuth', 'OAuth errore di autorizzazione', 'OAuth erreur d\'autorisation', 'Erro de autorização OAuth', 'OAuth tillståndsfelet', 'OAuth luvan virhe', 'OAuth autorisasjonsfeil', 'OAuth fout machtiging', 'Błąd autoryzacji OAuth'),
	(381, 'Page', 24, 'meta_description', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(382, 'Page', 24, 'meta_keywords', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(383, 'TextBlock', 311, 'text', 'Да, это мой email аккаунт!', 'Yes, this is my email account!', 'Ja, das ist meine E-Mail-Konto!', 'Sí, esta es mi cuenta de correo electrónico!', 'Sì, questo è il mio account di posta elettronica!', 'Oui, ceci est mon compte e-mail!', 'Sim, esta é a minha conta de e-mail!', 'Ja, detta är min e-postkonto!', 'Kyllä, tämä on minun email tunnus!', 'Ja, dette er min e-postkonto!', 'Ja, dit is mijn e-mail account!', 'Tak, to jest moje konto e-mail!'),
	(384, 'TextBlock', 312, 'text', 'Подтвердить email аккаунт!', 'Confirm email account!', 'Bestätigen Sie E-Mail-Konto!', 'Confirme cuenta de correo electrónico!', 'Conferma account di posta elettronica!', 'Confirmez email compte!', 'Confirme conta de e-mail!', 'Bekräfta e-postkonto!', 'Vahvista sähköpostitilin!', 'Bekreft e-postkonto!', 'Bevestig e-mailaccount!', 'Potwierdzić konto e-mail!'),
	(385, 'TextBlock', 313, 'text', 'Подтверждаю!', 'Agree!', 'Zustimmen!', 'De acuerdo!', 'D\'accordo!', 'D\'accord!', 'Concordo!', 'Håller med!', 'Samaa mieltä!', 'Enig!', 'Mee eens!', 'Zgadzam się!'),
	(386, 'EmailTemplate', 6, 'subject', 'demo.web375.org - Подтверждение электронного адреса в соцсети {%network_name%}', 'Demo.web375.org - Confirm your email address in the social network {%network_name%}', 'Demo.web375.org - Bestätigen Sie Ihre E-Mail-Adresse in das soziale Netzwerk {%network_name%}', 'Demo.web375.org - Confirme su dirección de correo electrónico en la red social {%network_name%}', 'Demo.web375.org - Conferma il tuo indirizzo di posta elettronica nella rete sociale {%network_name%}', 'Demo.web375.org - Confirmez votre adresse e-mail dans le réseau social {%network_name%}', 'Demo.web375.org - Confirme o seu endereço de e-mail na rede social {%network_name%}', 'Demo.web375.org - Bekräfta din e-postadress i det sociala nätverket {%network_name%}', 'Demo.web375.org - Vahvista sähköpostiosoitteesi sosiaalinen verkosto {%network_name%}', 'Demo.web375.org - Bekreft e-postadressen din i det sosiale nettverket {%network_name%}', 'Demo.web375.org - Bevestig uw e-mailadres in het sociale netwerk {%network_name%}', 'Demo.web375.org - Potwierdź swój adres e-mail w sieci społecznej {%network_name%}'),
	(387, 'EmailTemplate', 6, 'message', 'Подтвердите Email {%email%}, перейдя по ссылке {%link%} Либо используйте данный код {%token%} ', 'Confirm Email {%email%}, follow the link {%link%} or use this code {%token%}', 'Bestätigen Email {%email%}, folgen Sie dem Link {%link%} oder verwenden Sie diesen Code {%token%}', 'Confirmar correo electrónico {%email%}, siga el enlace {%link%} o utilizar este código {%token%}', 'Conferma Email {%email%}, segui il link {%collegamento%} o utilizzare questo codice {%token%}', 'Confirmer courriel {%email%}, suivez le lien {%link%} ou en utilisant ce code {%token%}', 'Confirmar e-mail {%email%}, siga o elo {%link%} ou usar este código de  {%token%}', 'Bekräfta e {%email%}, följ länken {%link%} eller använd denna kod {%token%}', 'Vahvista sähköpostiosoite {%email%}, seuraa linkkiä {%link%} tai käyttää tätä koodia {%token%}', 'Bekreft e {%email%}, følg linken {%link%} eller bruke denne koden {%token%}', 'Bevestig E-mail {%email%}, volg de link {%link%} of gebruik deze code {%token%}', 'Potwierdź e-mail {%email%}, należy kliknąć  {%link%} łącza lub użyć tego kodu {%token%}'),
	(388, 'TextBlock', 314, 'text', 'Войти с помощью:', 'Login with:', 'Einloggen mit:', 'Ingresar con:', 'Login con:', 'Connectez-vous avec:', 'Entrar com:', 'Logga in med:', 'Kirjaudu:', 'Logg inn med:', 'Login met:', 'Zaloguj się z:');
/*!40000 ALTER TABLE `localization` ENABLE KEYS */;


-- Dumping structure for table dev_single.menu_item
CREATE TABLE IF NOT EXISTS `menu_item` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `root_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'empty',
  `page_id` bigint(20) DEFAULT NULL,
  `cms_module_id` bigint(20) DEFAULT NULL,
  `route` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `external` text COLLATE utf8_unicode_ci,
  `is_empty` tinyint(1) DEFAULT '1',
  `is_auth` tinyint(1) DEFAULT '0',
  `icon_class` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `root_id` bigint(20) DEFAULT NULL,
  `lft` int(11) DEFAULT NULL,
  `rgt` int(11) DEFAULT NULL,
  `level` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `page_id_idx` (`page_id`),
  CONSTRAINT `menu_item_page_id_page_id` FOREIGN KEY (`page_id`) REFERENCES `page` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table dev_single.menu_item: ~8 rows (approximately)
/*!40000 ALTER TABLE `menu_item` DISABLE KEYS */;
INSERT INTO `menu_item` (`id`, `name`, `root_name`, `type`, `page_id`, `cms_module_id`, `route`, `external`, `is_empty`, `is_auth`, `icon_class`, `root_id`, `lft`, `rgt`, `level`) VALUES
	(1, 'Главное меню', 'main', 'empty', NULL, NULL, NULL, NULL, 1, 0, NULL, 1, 1, 52, 0),
	(2, 'На главную', '', 'route', 1, NULL, 'homepage', '', 1, 0, NULL, 1, 1, 1, 1),
	(3, 'О нас', NULL, 'page', 2, NULL, NULL, NULL, 1, 0, NULL, 1, 44, 45, 1),
	(4, 'Контакты', NULL, 'module', 3, 2, '', '', 1, 0, NULL, 1, 46, 47, 1),
	(5, 'Закрытый раздел', NULL, 'page', 14, NULL, '', '', 1, 1, '', 1, 50, 51, 1),
	(6, 'Нижнее меню', 'bottom', 'empty', NULL, NULL, NULL, NULL, 1, 0, NULL, 6, 6, NULL, 0),
	(7, 'Политика конфиденциальности', NULL, 'page', 13, NULL, '', '', 1, 0, '', 6, 6, 5, 1),
	(8, 'Пользовательское соглашение', NULL, 'page', 12, NULL, '', '', 1, 0, '', 6, 6, 5, 1);
/*!40000 ALTER TABLE `menu_item` ENABLE KEYS */;


-- Dumping structure for table dev_single.news
CREATE TABLE IF NOT EXISTS `news` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `brief` text COLLATE utf8_unicode_ci,
  `content` text COLLATE utf8_unicode_ci,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_keywords` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `news_sluggable_idx` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table dev_single.news: ~0 rows (approximately)
/*!40000 ALTER TABLE `news` DISABLE KEYS */;
/*!40000 ALTER TABLE `news` ENABLE KEYS */;


-- Dumping structure for table dev_single.page
CREATE TABLE IF NOT EXISTS `page` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `content` text COLLATE utf8_unicode_ci,
  `is_module_page` tinyint(1) DEFAULT '0',
  `module_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_content_editable` tinyint(1) DEFAULT '1',
  `special_mark` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_redirect` tinyint(1) DEFAULT '0',
  `redirect_route` varchar(32) COLLATE utf8_unicode_ci DEFAULT '/',
  `redirect_timeout` smallint(6) DEFAULT '5',
  `layout` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_visible_for_admin` tinyint(1) DEFAULT '1',
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_keywords` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `page_sluggable_idx` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table dev_single.page: ~27 rows (approximately)
/*!40000 ALTER TABLE `page` DISABLE KEYS */;
INSERT INTO `page` (`id`, `name`, `content`, `is_module_page`, `module_name`, `is_content_editable`, `special_mark`, `is_redirect`, `redirect_route`, `redirect_timeout`, `layout`, `is_visible_for_admin`, `slug`, `meta_title`, `meta_description`, `meta_keywords`) VALUES
	(1, 'Добро пожаловать!', 'Привет тебе, юный друг! Ты попал на этот сайт, потому что тебе самому нужен сайт. А может быть, ты просто зашел сюда случайно! В любом случае, добро пожаловать!', 1, 'default', 1, 'default', 0, '/', 5, '', 1, 'dobro-pozhalovat', 'Добро пожаловать на сайт проекта DEV2!', '', ''),
	(2, 'О нас', 'Мы молодая, но уже очень опытная компания, занимающаяся разработкой и продвижением веб-сайтов', 0, NULL, 1, NULL, 0, '/', 5, '', 1, 'o-nas', 'О проекте', '', ''),
	(3, 'Обратная связь', 'Отправьте нам сообщение и мы свяжемся с Вами как можно быстрее!', 0, NULL, 1, 'contactus', 0, '/', 5, '', 1, 'obratnaya-svyaz', 'Обратная связь - Проект DEV2', '', ''),
	(4, 'Регистрация', '', 0, NULL, 0, 'register', 0, '/', 5, NULL, 1, 'registraciya', 'Регистрация', '', ''),
	(5, 'Восстановление пароля', 'Нажмите кнопку "Восстановить пароль" и на указанный Вами при регистрации адрес электронной почты придет ссылка на восстановление пароля. ', 0, NULL, 1, 'auth_forgot_password', 0, '/', 5, NULL, 1, 'vosstanovlenie-parolya', 'Восстановление пароля', '', ''),
	(6, 'Восстановление пароля. Выслано письмо.', 'На указанный вами Email-адрес выслано письмо.', 0, NULL, 1, 'auth_forgot_password_thanks', 1, '/', 5, '', 1, 'vosstanovlenie-parolya-vyslano-pismo', 'Восстановление пароля. Выслано письмо.', '', ''),
	(7, 'Восстановление пароля. Отправлено СМС', '', 0, NULL, 1, 'auth_forgot_sms', 0, '/', 5, NULL, 1, 'vosstanovlenie-parolya-otpravleno-sms', 'Восстановление пароля. Отправлено СМС', '', ''),
	(8, 'Придумайте новый пароль', '', 0, NULL, 1, 'auth_password_recovery', 0, '/', 5, NULL, 1, 'pridumayte-novyy-parol', 'Придумайте новый пароль', '', ''),
	(9, 'Вход в личный кабинет', '', 0, NULL, 1, 'auth_signin', 0, '/', 5, NULL, 1, 'vhod-v-lichnyy-kabinet', 'Вход в личный кабинет', '', ''),
	(10, 'Регистрация пройдена', 'На указанный Вами email-адрес выслано письмо с инструкцией регистрации', 0, NULL, 1, 'auth_registration_complete', 1, '/', 5, NULL, 1, 'registraciya-proydena', 'Регистрация пройдена', '', ''),
	(11, 'Активация пройдена', 'Теперь вы можете войти в Личный кабинет!', 0, NULL, 1, 'auth_activation_successful', 1, '/profile', 3, '', 1, 'aktivaciya-proydena', 'Активация пройдена', '', ''),
	(12, 'Пользовательское соглашение', 'Здесь абсолютно типичное пользовательское соглашение', 0, NULL, 1, 'user_agreement', 0, '/', 5, '', 1, 'polzovatelskoe-soglashenie', 'Пользовательское соглашение', '', ''),
	(13, 'Политика конфиденциальности', 'Здесь абсолютно типичная страница про политику конфиденциальности', 0, NULL, 1, 'privacy_policy', 0, '/', 5, '', 1, 'politika-konfidencialnosti', 'Политика конфиденциальности', '', ''),
	(14, 'Закрытый раздел', 'Если вы зашли на эту страницу, значит вы авторизованный пользователь!', 0, NULL, 1, NULL, 0, '/', 5, NULL, 1, 'zakrytyy-razdel', 'Закрытый раздел', '', ''),
	(15, 'Это тестовая страница', '', 0, NULL, 1, NULL, 0, '/', 5, '', 1, 'eto-testovaya-stranica', 'Это тестовая страница', '', ''),
	(16, 'Ошибка 404', 'Ошибка 404. Страница не найдена', 0, NULL, 1, 'error404', 0, '/', 5, NULL, 1, 'oshibka-404', 'Ошибка 404', '', ''),
	(17, 'Мой профиль', 'Здесь вы можете отредактировать Ваши личные данные, загрузить фотографию и поменять пароль', 0, NULL, 0, 'profile', 0, '/', 5, NULL, 1, 'moy-profil', 'Мой профиль', '', ''),
	(18, 'Мой профиль - Изменить пароль', 'Мы храним Ваш пароль в зашифрованном виде. Кроме Вас его не знает никто', 0, NULL, 0, 'profile_password', 0, '/', 5, NULL, 1, 'moy-profil-izmenit-parol', 'Мой профиль - Изменить пароль', '', ''),
	(19, 'Мой профиль - Изменить фотографию', '', 0, NULL, 0, 'profile_avatar', 0, '/', 5, NULL, 1, 'moy-profil-izmenit-fotografiyu', 'Мой профиль - Изменить фотографию', '', ''),
	(20, 'IP-адресс заблокирован', 'К сожалению, по неясным причинам ваш адрес был заблокирован! Спасибо!', 0, NULL, 1, 'ip_banned', 0, '/', 5, 'empty', 1, 'ip-adress-zablokirovan', 'IP-адресс заблокирован', '', ''),
	(21, 'Необходима авторизация', 'Чтобы посмотреть содержимое этого раздела, необходимо авторизоваться', 0, NULL, 1, 'auth_secure', 0, '/', 5, NULL, 1, 'neobhodima-avtorizaciya', 'Необходима авторизация', '', ''),
	(22, 'Подтверждение аккаунта в соцсети', 'Внимание! Email {%email%} уже существует в системе! Если это Ваш email, подтвердите его!', 0, NULL, 1, 'oauth_bridge', 0, '/', 5, NULL, 1, 'podtverzhdenie-akkaunta-v-socseti', 'Подтверждение аккаунта в соцсети', '', ''),
	(23, 'Подтверждение аккаунта в соцсети. Шаг второй', 'На ваш электронный ящик {%email%} выслано письмо!', 0, NULL, 1, 'oauth_bridge_confirm', 0, '/', 5, NULL, 1, 'podtverzhdenie-akkaunta-v-socseti-shag-vtoroy', 'Подтверждение аккаунта в соцсети. Шаг второй', '', ''),
	(24, 'Ошибка авторизации OAuth', '', 0, NULL, 1, 'oauth_error', 0, '/', 5, NULL, 1, 'oshibka-avtorizacii-oauth', 'Ошибка авторизации OAuth', '', ''),
	(25, 'Пользователи', NULL, 0, NULL, 1, 'users_index', 0, '/', 5, NULL, 1, 'users_index', 'Пользователи', NULL, NULL),
	(26, '{%name%}', NULL, 0, NULL, 1, 'users_show', 0, '/', 5, NULL, 1, 'users_show', '{%name%}', NULL, NULL),
	(27, '{%name%} на карте', NULL, 0, NULL, 1, 'users_show_map', 0, '/', 5, NULL, 1, 'users_show_map', '{%name%} на карте', NULL, NULL);
/*!40000 ALTER TABLE `page` ENABLE KEYS */;


-- Dumping structure for table dev_single.profile
CREATE TABLE IF NOT EXISTS `profile` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `first_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `about` text COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `geo_lat` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `geo_lng` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `geo_country` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `geo_city` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `geo_address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `geo_address_formatted` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id_idx` (`user_id`),
  CONSTRAINT `profile_user_id_sf_guard_user_id` FOREIGN KEY (`user_id`) REFERENCES `sf_guard_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table dev_single.profile: ~0 rows (approximately)
/*!40000 ALTER TABLE `profile` DISABLE KEYS */;
/*!40000 ALTER TABLE `profile` ENABLE KEYS */;


-- Dumping structure for table dev_single.redirect301
CREATE TABLE IF NOT EXISTS `redirect301` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `url_from` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `url_to` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `comment` text COLLATE utf8_unicode_ci,
  `use_count` bigint(20) DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `url_from` (`url_from`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table dev_single.redirect301: ~0 rows (approximately)
/*!40000 ALTER TABLE `redirect301` DISABLE KEYS */;
INSERT INTO `redirect301` (`id`, `url_from`, `url_to`, `is_active`, `comment`, `use_count`, `created_at`, `updated_at`) VALUES
	(1, '/page/about-us', '/page/our-team', 1, 'Page: Our team', 1, '2014-11-05 17:07:18', '2014-11-05 17:07:36');
/*!40000 ALTER TABLE `redirect301` ENABLE KEYS */;


-- Dumping structure for table dev_single.sf_guard_forgot_password
CREATE TABLE IF NOT EXISTS `sf_guard_forgot_password` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `unique_key` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `expires_at` datetime NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id_idx` (`user_id`),
  CONSTRAINT `sf_guard_forgot_password_user_id_sf_guard_user_id` FOREIGN KEY (`user_id`) REFERENCES `sf_guard_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table dev_single.sf_guard_forgot_password: ~0 rows (approximately)
/*!40000 ALTER TABLE `sf_guard_forgot_password` DISABLE KEYS */;
/*!40000 ALTER TABLE `sf_guard_forgot_password` ENABLE KEYS */;


-- Dumping structure for table dev_single.sf_guard_group
CREATE TABLE IF NOT EXISTS `sf_guard_group` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table dev_single.sf_guard_group: ~0 rows (approximately)
/*!40000 ALTER TABLE `sf_guard_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `sf_guard_group` ENABLE KEYS */;


-- Dumping structure for table dev_single.sf_guard_group_permission
CREATE TABLE IF NOT EXISTS `sf_guard_group_permission` (
  `group_id` bigint(20) NOT NULL DEFAULT '0',
  `permission_id` bigint(20) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`group_id`,`permission_id`),
  KEY `sf_guard_group_permission_permission_id_sf_guard_permission_id` (`permission_id`),
  CONSTRAINT `sf_guard_group_permission_group_id_sf_guard_group_id` FOREIGN KEY (`group_id`) REFERENCES `sf_guard_group` (`id`) ON DELETE CASCADE,
  CONSTRAINT `sf_guard_group_permission_permission_id_sf_guard_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `sf_guard_permission` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table dev_single.sf_guard_group_permission: ~0 rows (approximately)
/*!40000 ALTER TABLE `sf_guard_group_permission` DISABLE KEYS */;
/*!40000 ALTER TABLE `sf_guard_group_permission` ENABLE KEYS */;


-- Dumping structure for table dev_single.sf_guard_permission
CREATE TABLE IF NOT EXISTS `sf_guard_permission` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table dev_single.sf_guard_permission: ~20 rows (approximately)
/*!40000 ALTER TABLE `sf_guard_permission` DISABLE KEYS */;
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
	(20, 'testaurus', 'Testaurus management', '2016-04-11 13:37:10', '2016-04-11 13:37:10');
/*!40000 ALTER TABLE `sf_guard_permission` ENABLE KEYS */;


-- Dumping structure for table dev_single.sf_guard_remember_key
CREATE TABLE IF NOT EXISTS `sf_guard_remember_key` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL,
  `remember_key` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ip_address` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id_idx` (`user_id`),
  CONSTRAINT `sf_guard_remember_key_user_id_sf_guard_user_id` FOREIGN KEY (`user_id`) REFERENCES `sf_guard_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table dev_single.sf_guard_remember_key: ~0 rows (approximately)
/*!40000 ALTER TABLE `sf_guard_remember_key` DISABLE KEYS */;
/*!40000 ALTER TABLE `sf_guard_remember_key` ENABLE KEYS */;


-- Dumping structure for table dev_single.sf_guard_user
CREATE TABLE IF NOT EXISTS `sf_guard_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
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
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email_address` (`email_address`),
  UNIQUE KEY `username` (`username`),
  KEY `is_active_idx_idx` (`is_active`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table dev_single.sf_guard_user: ~30 rows (approximately)
/*!40000 ALTER TABLE `sf_guard_user` DISABLE KEYS */;
INSERT INTO `sf_guard_user` (`id`, `first_name`, `last_name`, `email_address`, `username`, `algorithm`, `salt`, `password`, `is_active`, `is_super_admin`, `last_login`, `created_at`, `updated_at`) VALUES
	(1, 'Админ32', '', 'admin@admin.com', 'admin', 'sha1', '4b94b61d1e21fab73088930db9da4807', '14ebadf4cf6d65ba509fec1ee3d6a7e572c40098', 1, 1, '2016-04-30 10:31:15', '2014-11-08 23:12:31', '2016-04-30 10:31:15'),
	(3, 'Вот он наш админ', NULL, 'test@test.com', 'test@test.com', 'sha1', 'test@test.com', '794fd9ca625a27ec16ee85194bb15315e2791640', 1, 0, '2016-03-28 12:35:11', '2016-03-28 12:35:12', '2016-04-11 13:34:48'),
	(15, 'Carol', 'Arroyo', 'carol.arroyo@gmail.com', 'carol.arroyo@gmail.com', 'sha1', '35ba3d97eaed5748402b50f89eac645040f1504a', '18b301916cf208523b0d493dae50e5eaeacff198', 1, 0, NULL, '2016-03-28 13:03:58', '2016-04-11 13:34:48'),
	(17, 'Chelsea', 'Blake', 'chelsea.blake@gmail.com', 'chelsea.blake@gmail.com', 'sha1', '12816e8ba6d6ed91f8c24dff52c7dac52e2b601e', 'dc089d695dfadf2ddf58289ee1b507e6c8337de0', 1, 0, NULL, '2016-03-28 13:03:59', '2016-04-11 13:34:49'),
	(18, 'Bridie', 'Benson', 'bridie.benson@gmail.com', 'bridie.benson@gmail.com', 'sha1', '3e12a1547027ded5181cbf7dfae7ea1fa813f738', 'bdcc44fceb969b2782aba62080369e82d6e26a5c', 1, 0, NULL, '2016-03-28 13:03:59', '2016-04-11 13:34:49'),
	(19, 'Vikram', 'Richard', 'vikram.richard@gmail.com', 'vikram.richard@gmail.com', 'sha1', '2a0c32892e2f0e76a70e13e169ec6e48307ea294', '5ca7bfcab77fd9023a4c97c11cbb54e2f7029266', 1, 0, NULL, '2016-03-28 13:03:59', '2016-04-11 13:34:49'),
	(20, 'Jenson', 'Ruiz', 'jenson.ruiz@gmail.com', 'jenson.ruiz@gmail.com', 'sha1', '3f3c768df30291cb1d848fdcee16a3f8c9770b02', '876d85b782f94b7c3f7ba67ba97d8c480c624259', 1, 0, NULL, '2016-03-28 13:03:59', '2016-04-11 13:34:49'),
	(21, 'Brisa', 'Kim', 'brisa.kim@gmail.com', 'brisa.kim@gmail.com', 'sha1', '1c25bdcaa6957c1ede166824d3314a5eae9c8d56', 'e7334599c462e1682309d283a4b03c28bcd14a3d', 1, 0, NULL, '2016-03-28 13:03:59', '2016-04-11 13:34:49'),
	(22, 'Muriel', 'Little', 'muriel.little@gmail.com', 'muriel.little@gmail.com', 'sha1', '71b618699f9d63139b1672937c76fcf0e6b18944', 'ae880a2a25e04039efcfe01e226556b55bc03051', 1, 0, NULL, '2016-03-28 13:03:59', '2016-04-11 13:34:49'),
	(23, 'Keenan', 'Black', 'keenan.black@gmail.com', 'keenan.black@gmail.com', 'sha1', 'eec333f51a112014f7f982bb55e4aa374e40f30c', 'ec58687dd3ee44b69306becabb643a2ada7cc034', 1, 0, NULL, '2016-03-28 13:03:59', '2016-04-11 13:34:50'),
	(25, 'Ulrich', 'Crawford', 'ulrich.crawford@gmail.com', 'ulrich.crawford@gmail.com', 'sha1', '5440cbe008f93cc61e554d15cde6ff469646bd08', 'f32921ad3783cf7d1c1c5e3a70a110d57f242a9a', 1, 0, NULL, '2016-03-28 13:04:34', '2016-04-11 13:34:50'),
	(26, 'Carla2', 'Davidson', 'carla.davidson@gmail.com', 'carla.davidson@gmail.com', 'sha1', '33585ec39df0b1908fb9e6c4f0c546215cb92d4c', '43199818752ad4b5a2cd95a601225458825b179d', 1, 0, NULL, '2016-03-28 13:04:35', '2016-04-11 13:34:50'),
	(27, 'Brooke', 'Walton', 'brooke.walton@gmail.com', 'brooke.walton@gmail.com', 'sha1', 'd09d581cd626601eff02cc4ac59e98885c213a24', '36f8a92c4ad609b875a644cead91bcba95bf725b', 1, 0, NULL, '2016-03-28 13:04:35', '2016-04-11 13:34:50'),
	(28, 'Toryn', 'Bridges', 'toryn.bridges@gmail.com', 'toryn.bridges@gmail.com', 'sha1', 'e65b29ab59e393ea4164845d7e80821d1130017e', 'cb873956a004d3e815a202b64ede3ede52294809', 1, 0, NULL, '2016-03-28 13:04:35', '2016-04-11 13:34:50'),
	(29, 'Brandon', 'Braun', 'brandon.braun@gmail.com', 'brandon.braun@gmail.com', 'sha1', '92bba9f34266cb3dbdf941d152c06a9a62958886', 'a13680c2368f01460c0fae2bec966853933610fd', 1, 0, NULL, '2016-03-28 13:04:35', '2016-04-11 13:34:50'),
	(30, 'Robby', 'Hensley', 'robby.hensley@gmail.com', 'robby.hensley@gmail.com', 'sha1', '00742939ca39c9903ea77ca2da58b18e5ece9bf6', '6347b59a7fe4f79e5cebbdc02ae10b42f5e1791e', 1, 0, NULL, '2016-03-28 13:04:35', '2016-04-11 13:34:50'),
	(31, 'Lenard', 'Lindsey', 'lenard.lindsey@gmail.com', 'lenard.lindsey@gmail.com', 'sha1', '36084c2732ff66389bccbc0f9cc490f22468870a', '7d1ada1888277d1a6d3d1929326c1ddb7670d34e', 1, 0, NULL, '2016-03-28 13:04:35', '2016-04-11 13:34:50'),
	(32, 'Lindy', 'Kane', 'lindy.kane@gmail.com', 'lindy.kane@gmail.com', 'sha1', '8df048eadc0c8677cfb2f3383bd4d39c1e675fae', '0c69a4096af56070185251988c48d29b8f178533', 1, 0, NULL, '2016-03-28 13:04:35', '2016-04-11 13:34:50'),
	(33, 'Gisselle', 'Daugherty', 'gisselle.daugherty@gmail.com', 'gisselle.daugherty@gmail.com', 'sha1', 'cd1ddd7a5545d1ee52b98d8949f88b2bc16f68e3', 'a344ae21d45ced126d98496d41d47ea292fdf7fa', 1, 0, NULL, '2016-03-28 13:04:35', '2016-04-11 13:34:50'),
	(34, 'Amaryllis', 'Lynn', 'amaryllis.lynn@gmail.com', 'amaryllis.lynn@gmail.com', 'sha1', 'a00eefbc9a6e8e339876601fe5bbdd2743ad9e8e', '48b1a923ba5b4391c1c521a0b0b5864c9d601c34', 1, 0, NULL, '2016-03-28 13:04:36', '2016-04-11 13:34:50'),
	(35, 'Tatum', 'Trevino', 'tatum.trevino@gmail.com', 'tatum.trevino@gmail.com', 'sha1', 'a93ce80877753c2f0e569c36184545bb3b4ea215', '94ebc569647a5e4a5b80f130dc56cfb9dd3f76fd', 1, 0, NULL, '2016-03-28 13:27:52', '2016-04-11 13:34:51'),
	(36, 'Gordon', 'Owen', 'gordon.owen@gmail.com', 'gordon.owen@gmail.com', 'sha1', '53e1e31357644a3077cd59c5ccf0627566a91608', 'd4736b806b7e8664cb2f5512d19682194b618c90', 1, 0, NULL, '2016-03-28 13:27:52', '2016-04-11 13:34:51'),
	(37, 'Benjamin', 'Watson', 'benjamin.watson@gmail.com', 'benjamin.watson@gmail.com', 'sha1', '4618047c449ae2444fc7767b4f88f9821285afb6', '90db0303327aeded07b02d9aa54fe9189fbeee28', 1, 0, NULL, '2016-03-28 13:27:52', '2016-04-11 13:34:51'),
	(38, 'Kira', 'Bird', 'kira.bird@gmail.com', 'kira.bird@gmail.com', 'sha1', '8398c3f3bab0292c2e06c7dc7b9040dd61349e8a', 'ed87728aa3a4853ab74ffcd192e7ce356d16662e', 1, 0, NULL, '2016-03-28 13:27:52', '2016-04-11 13:34:51'),
	(39, 'Terry', 'Oneal', 'terry.oneal@gmail.com', 'terry.oneal@gmail.com', 'sha1', 'c20318660db6e7ef190903e03e3e22e2ae01f73b', '73e4506cdfda274581ecefb8317a4060aec6fdc4', 1, 0, NULL, '2016-03-28 13:27:52', '2016-04-11 13:34:51'),
	(40, 'Nana', 'Gould', 'nana.gould@gmail.com', 'nana.gould@gmail.com', 'sha1', '7528d5b31a144f4231f3b7c60dc3235ac2c99727', 'e391eb171e8ffaca0fd16c1b75c5ffde3f49e9dc', 1, 0, NULL, '2016-03-28 13:27:52', '2016-04-11 13:34:51'),
	(41, 'Branson', 'Leach', 'branson.leach@gmail.com', 'branson.leach@gmail.com', 'sha1', '8840209dd8681b39ba832182d04d1fd75772a8ad', '972f33285d162e4bfaea5b531441f729b876428b', 1, 0, NULL, '2016-03-28 13:27:52', '2016-04-11 13:34:51'),
	(42, 'Marion', 'Gallagher', 'marion.gallagher@gmail.com', 'marion.gallagher@gmail.com', 'sha1', '66b29f96f84738813d6403a846d6c0e62317a7fe', '329a902784e1998aa8f30b8514561e3afba9a11a', 1, 0, NULL, '2016-03-28 13:27:52', '2016-04-11 13:34:51'),
	(43, 'Jaime', 'Cooper', 'jaime.cooper@gmail.com', 'jaime.cooper@gmail.com', 'sha1', '47864eb8a882b415f2779925d483b65ed55f66cb', '996219869edbf61472e78b9ac0995a47e71785be', 1, 0, NULL, '2016-03-28 13:27:53', '2016-04-11 13:34:51'),
	(44, 'Brodie', 'Roberts', 'brodie.roberts@gmail.com', 'brodie.roberts@gmail.com', 'sha1', 'f01123e1d9f5a78036ac15ca953e709dbd0ece5e', '8284dae91899d0dcd8f482e6718997ff49464d2d', 1, 0, NULL, '2016-03-28 13:27:53', '2016-04-11 13:34:52');
/*!40000 ALTER TABLE `sf_guard_user` ENABLE KEYS */;


-- Dumping structure for table dev_single.sf_guard_user_group
CREATE TABLE IF NOT EXISTS `sf_guard_user_group` (
  `user_id` bigint(20) NOT NULL DEFAULT '0',
  `group_id` bigint(20) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`user_id`,`group_id`),
  KEY `sf_guard_user_group_group_id_sf_guard_group_id` (`group_id`),
  CONSTRAINT `sf_guard_user_group_group_id_sf_guard_group_id` FOREIGN KEY (`group_id`) REFERENCES `sf_guard_group` (`id`) ON DELETE CASCADE,
  CONSTRAINT `sf_guard_user_group_user_id_sf_guard_user_id` FOREIGN KEY (`user_id`) REFERENCES `sf_guard_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table dev_single.sf_guard_user_group: ~0 rows (approximately)
/*!40000 ALTER TABLE `sf_guard_user_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `sf_guard_user_group` ENABLE KEYS */;


-- Dumping structure for table dev_single.sf_guard_user_permission
CREATE TABLE IF NOT EXISTS `sf_guard_user_permission` (
  `user_id` bigint(20) NOT NULL DEFAULT '0',
  `permission_id` bigint(20) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`user_id`,`permission_id`),
  KEY `sf_guard_user_permission_permission_id_sf_guard_permission_id` (`permission_id`),
  CONSTRAINT `sf_guard_user_permission_permission_id_sf_guard_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `sf_guard_permission` (`id`) ON DELETE CASCADE,
  CONSTRAINT `sf_guard_user_permission_user_id_sf_guard_user_id` FOREIGN KEY (`user_id`) REFERENCES `sf_guard_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table dev_single.sf_guard_user_permission: ~0 rows (approximately)
/*!40000 ALTER TABLE `sf_guard_user_permission` DISABLE KEYS */;
/*!40000 ALTER TABLE `sf_guard_user_permission` ENABLE KEYS */;


-- Dumping structure for table dev_single.site_event
CREATE TABLE IF NOT EXISTS `site_event` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `admin_email` text COLLATE utf8_unicode_ci,
  `user_email` text COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `is_backend_viewed` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table dev_single.site_event: ~4 rows (approximately)
/*!40000 ALTER TABLE `site_event` DISABLE KEYS */;
INSERT INTO `site_event` (`id`, `type`, `description`, `admin_email`, `user_email`, `created_at`, `updated_at`, `is_backend_viewed`) VALUES
	(1, 'social_bridge_user_confirm_email', 'Подтвердите Email rogoff1985@mail.ru, перейдя по ссылке <a href=\'http://demo.web375.org/frontend_dev.php/oauth/bridgeconfirm?token=bf2020f342fde845e79bd6755365fa1707247583\'>Подтвердить email аккаунт!</a><br /> Либо используйте данный код bf2020f342fde845e79bd6755365fa1707247583<br /> |\n      |\n            |\n                  <br /><br />\n                  <hr /><br />\n                  С легким возбуждением<br />\n                  Команда <a href=\'http://dev2.web375-testing.org\' target=\'_blank\'>Куча Кода</a>\n   \n', NULL, 'Подтвердите Email rogoff1985@mail.ru, перейдя по ссылке <a href=\'http://demo.web375.org/frontend_dev.php/oauth/bridgeconfirm?token=bf2020f342fde845e79bd6755365fa1707247583\'>Подтвердить email аккаунт!</a><br /> Либо используйте данный код bf2020f342fde845e79bd6755365fa1707247583<br /> |\n      |\n            |\n                  <br /><br />\n                  <hr /><br />\n                  С легким возбуждением<br />\n                  Команда <a href=\'http://dev2.web375-testing.org\' target=\'_blank\'>Куча Кода</a>\n   \n', '2014-11-05 18:00:13', '2014-11-05 18:00:13', 1),
	(2, 'social_bridge_user_confirm_email', 'Подтвердите Email alexey.radyuk@gmail.com, перейдя по ссылке <a href=\'http://demo.web375.org/oauth/bridgeconfirm?token=eabc76fe885ff15b7da2689fe96c9fb38a39f2c4\'>Подтвердить email аккаунт!</a><br /> Либо используйте данный код eabc76fe885ff15b7da2689fe96c9fb38a39f2c4<br /> |\n      |\n            <br /><br />\n            <hr /><br />\n            С легким возбуждением<br />\n            Команда <a href=\'http://dev2.web375-testing.org\' target=\'_blank\'>Куча Кода</a>\n   \n', NULL, 'Подтвердите Email alexey.radyuk@gmail.com, перейдя по ссылке <a href=\'http://demo.web375.org/oauth/bridgeconfirm?token=eabc76fe885ff15b7da2689fe96c9fb38a39f2c4\'>Подтвердить email аккаунт!</a><br /> Либо используйте данный код eabc76fe885ff15b7da2689fe96c9fb38a39f2c4<br /> |\n      |\n            <br /><br />\n            <hr /><br />\n            С легким возбуждением<br />\n            Команда <a href=\'http://dev2.web375-testing.org\' target=\'_blank\'>Куча Кода</a>\n   \n', '2014-11-05 18:05:42', '2014-11-05 18:05:42', 1),
	(3, 'contactus_message', 'Некто Alex прислал сообщение. Текст: tes E-Mail: alexey.radyuk@gmail.com', 'Некто Alex прислал сообщение. Текст: tes E-Mail: alexey.radyuk@gmail.com', 'Уважаемый Alex! Спасибо за Ваше сообщение! Оно очень важно для нас!', '2015-09-23 09:18:37', '2015-09-23 09:18:37', 0),
	(4, 'contactus_message', 'Некто Mister test прислал сообщение. Текст: test E-Mail: alexey.radyuk@gmail.com', 'Некто Mister test прислал сообщение. Текст: test E-Mail: alexey.radyuk@gmail.com', 'Уважаемый Mister test! Спасибо за Ваше сообщение! Оно очень важно для нас!', '2015-09-23 09:19:48', '2015-09-23 09:19:48', 0);
/*!40000 ALTER TABLE `site_event` ENABLE KEYS */;


-- Dumping structure for table dev_single.site_message
CREATE TABLE IF NOT EXISTS `site_message` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `phone_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `company_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `message` text COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `attach` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `attach_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `attach_mime` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_backend_viewed` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table dev_single.site_message: ~2 rows (approximately)
/*!40000 ALTER TABLE `site_message` DISABLE KEYS */;
INSERT INTO `site_message` (`id`, `type`, `name`, `phone_number`, `email`, `company_name`, `message`, `created_at`, `updated_at`, `attach`, `attach_name`, `attach_mime`, `is_backend_viewed`) VALUES
	(3, NULL, 'Alex', NULL, 'alexey.radyuk@gmail.com', NULL, 'tes', '2015-09-23 09:18:33', '2015-09-23 09:18:33', NULL, NULL, NULL, 1),
	(4, NULL, 'Mister test', NULL, 'alexey.radyuk@gmail.com', NULL, 'test', '2015-09-23 09:19:44', '2015-09-23 09:19:44', NULL, NULL, NULL, 1);
/*!40000 ALTER TABLE `site_message` ENABLE KEYS */;


-- Dumping structure for table dev_single.site_visit
CREATE TABLE IF NOT EXISTS `site_visit` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ip_address` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `country` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_agent` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id_idx` (`user_id`),
  CONSTRAINT `site_visit_user_id_sf_guard_user_id` FOREIGN KEY (`user_id`) REFERENCES `sf_guard_user` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table dev_single.site_visit: ~34 rows (approximately)
/*!40000 ALTER TABLE `site_visit` DISABLE KEYS */;
INSERT INTO `site_visit` (`id`, `ip_address`, `country`, `user_agent`, `user_id`, `created_at`, `updated_at`) VALUES
	(1, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:23.0) Gecko/20100101 Firefox/23.0', NULL, '2013-09-10 16:12:03', '2013-09-10 16:12:03'),
	(2, '127.0.0.1', NULL, 'Mozilla/5.0 (compatible; MSIE 10.0; Windows NT 6.1; WOW64; Trident/6.0)', NULL, '2013-09-10 17:18:55', '2013-09-10 17:18:55'),
	(3, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:23.0) Gecko/20100101 Firefox/23.0', NULL, '2013-09-11 12:58:16', '2013-09-11 12:58:16'),
	(4, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:23.0) Gecko/20100101 Firefox/23.0', NULL, '2013-09-12 13:43:47', '2013-09-12 13:43:47'),
	(5, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:23.0) Gecko/20100101 Firefox/23.0', NULL, '2013-09-14 15:08:43', '2013-09-14 15:08:43'),
	(6, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:23.0) Gecko/20100101 Firefox/23.0', NULL, '2013-09-14 15:10:12', '2013-09-14 15:10:12'),
	(7, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:23.0) Gecko/20100101 Firefox/23.0', NULL, '2013-09-14 15:10:38', '2013-09-14 15:10:38'),
	(8, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:23.0) Gecko/20100101 Firefox/23.0', NULL, '2013-09-14 15:12:40', '2013-09-14 15:12:40'),
	(9, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:23.0) Gecko/20100101 Firefox/23.0', NULL, '2013-09-23 12:06:47', '2013-09-23 12:06:47'),
	(10, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:24.0) Gecko/20100101 Firefox/24.0', NULL, '2013-10-12 17:20:47', '2013-10-12 17:20:47'),
	(11, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:26.0) Gecko/20100101 Firefox/26.0', NULL, '2014-01-07 00:57:30', '2014-01-07 00:57:30'),
	(12, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:26.0) Gecko/20100101 Firefox/26.0', NULL, '2014-01-07 18:54:18', '2014-01-07 18:54:18'),
	(13, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:32.0) Gecko/20100101 Firefox/32.0', NULL, '2014-10-24 21:16:52', '2014-10-24 21:16:52'),
	(14, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:32.0) Gecko/20100101 Firefox/32.0', NULL, '2014-10-25 12:38:02', '2014-10-26 16:53:04'),
	(15, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:32.0) Gecko/20100101 Firefox/32.0', NULL, '2014-10-26 21:56:34', '2014-10-26 22:10:59'),
	(16, '192.168.1.3', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:32.0) Gecko/20100101 Firefox/32.0', NULL, '2014-10-26 21:59:36', '2014-10-26 22:28:08'),
	(17, '192.168.1.3', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:32.0) Gecko/20100101 Firefox/32.0', NULL, '2014-10-26 23:07:09', '2014-10-26 23:07:09'),
	(18, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:32.0) Gecko/20100101 Firefox/32.0', NULL, '2014-10-27 13:24:45', '2014-10-27 13:24:45'),
	(19, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:32.0) Gecko/20100101 Firefox/32.0', NULL, '2014-10-28 10:33:06', '2014-10-28 17:46:15'),
	(20, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:32.0) Gecko/20100101 Firefox/32.0', NULL, '2014-10-29 11:18:46', '2014-10-29 11:18:46'),
	(21, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:32.0) Gecko/20100101 Firefox/32.0', NULL, '2014-10-29 15:30:22', '2014-10-29 15:30:22'),
	(22, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:32.0) Gecko/20100101 Firefox/32.0', NULL, '2014-10-31 13:48:03', '2014-10-31 17:14:59'),
	(23, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:33.0) Gecko/20100101 Firefox/33.0', NULL, '2014-11-01 11:24:18', '2014-11-01 11:24:18'),
	(24, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:33.0) Gecko/20100101 Firefox/33.0', NULL, '2014-11-01 22:38:06', '2014-11-01 22:38:06'),
	(25, '192.168.1.3', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:32.0) Gecko/20100101 Firefox/32.0', NULL, '2014-11-02 09:59:20', '2014-11-02 09:59:20'),
	(26, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:33.0) Gecko/20100101 Firefox/33.0', NULL, '2014-11-02 10:10:41', '2014-11-02 10:10:41'),
	(27, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.111 Safari/537.36', NULL, '2014-11-02 11:09:40', '2014-11-02 11:09:40'),
	(28, '127.0.0.1', NULL, 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; WOW64; Trident/5.0)', NULL, '2014-11-02 11:11:56', '2014-11-02 11:11:56'),
	(29, '192.168.1.3', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:32.0) Gecko/20100101 Firefox/32.0', NULL, '2014-11-02 12:02:02', '2014-11-02 12:02:02'),
	(30, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:33.0) Gecko/20100101 Firefox/33.0', NULL, '2014-11-05 19:26:47', '2014-11-05 19:26:47'),
	(31, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:33.0) Gecko/20100101 Firefox/33.0', NULL, '2014-11-08 23:14:03', '2014-11-08 23:14:03'),
	(32, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:33.0) Gecko/20100101 Firefox/33.0', NULL, '2014-11-08 23:18:22', '2014-11-08 23:18:22'),
	(33, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:37.0) Gecko/20100101 Firefox/37.0', NULL, '2015-05-13 22:39:01', '2015-05-13 22:39:01'),
	(34, '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:40.0) Gecko/20100101 Firefox/40.0', NULL, '2015-09-23 09:42:53', '2015-09-23 09:42:53');
/*!40000 ALTER TABLE `site_visit` ENABLE KEYS */;


-- Dumping structure for table dev_single.site_visit_page
CREATE TABLE IF NOT EXISTS `site_visit_page` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `site_visit_id` bigint(20) NOT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `site_visit_id_idx` (`site_visit_id`),
  CONSTRAINT `site_visit_page_site_visit_id_site_visit_id` FOREIGN KEY (`site_visit_id`) REFERENCES `site_visit` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=476 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table dev_single.site_visit_page: ~475 rows (approximately)
/*!40000 ALTER TABLE `site_visit_page` DISABLE KEYS */;
INSERT INTO `site_visit_page` (`id`, `site_visit_id`, `url`, `created_at`, `updated_at`) VALUES
	(1, 1, '/frontend_dev.php/page/o-proekte', '2013-09-10 16:13:39', '2013-09-10 16:13:39'),
	(2, 1, '/frontend_dev.php/', '2013-09-10 16:13:59', '2013-09-10 16:13:59'),
	(3, 1, '/', '2013-09-10 16:14:11', '2013-09-10 16:14:11'),
	(4, 1, '/contactus', '2013-09-10 16:14:18', '2013-09-10 16:14:18'),
	(5, 1, '/captcha?1378818859', '2013-09-10 16:14:19', '2013-09-10 16:14:19'),
	(6, 1, '/', '2013-09-10 16:32:36', '2013-09-10 16:32:36'),
	(7, 1, '/contactus', '2013-09-10 16:32:52', '2013-09-10 16:32:52'),
	(8, 2, '/', '2013-09-10 17:18:56', '2013-09-10 17:18:56'),
	(9, 2, '/page/o-proekte', '2013-09-10 17:20:51', '2013-09-10 17:20:51'),
	(10, 2, '/contactus', '2013-09-10 17:20:55', '2013-09-10 17:20:55'),
	(11, 2, '/auth/signin', '2013-09-10 17:21:00', '2013-09-10 17:21:00'),
	(12, 2, '/', '2013-09-10 17:21:04', '2013-09-10 17:21:04'),
	(13, 2, '/page/o-proekte', '2013-09-10 17:21:06', '2013-09-10 17:21:06'),
	(14, 2, '/', '2013-09-10 17:21:17', '2013-09-10 17:21:17'),
	(15, 3, '/frontend_dev.php', '2013-09-11 12:58:16', '2013-09-11 12:58:16'),
	(16, 3, '/frontend_dev.php', '2013-09-11 15:29:09', '2013-09-11 15:29:09'),
	(17, 3, '/frontend_dev.php/auth/signin', '2013-09-11 15:29:17', '2013-09-11 15:29:17'),
	(18, 3, '/frontend_dev.php', '2013-09-11 15:29:24', '2013-09-11 15:29:24'),
	(19, 3, '/frontend_dev.php/usage', '2013-09-11 15:39:02', '2013-09-11 15:39:02'),
	(20, 3, '/frontend_dev.php/usage', '2013-09-11 15:53:10', '2013-09-11 15:53:10'),
	(21, 3, '/frontend_dev.php/usage', '2013-09-11 15:55:17', '2013-09-11 15:55:17'),
	(22, 3, '/frontend_dev.php/usage/new', '2013-09-11 15:55:29', '2013-09-11 15:55:29'),
	(23, 3, '/frontend_dev.php/usage', '2013-09-11 16:04:12', '2013-09-11 16:04:12'),
	(24, 3, '/frontend_dev.php/usage/new', '2013-09-11 16:04:19', '2013-09-11 16:04:19'),
	(25, 3, '/frontend_dev.php/usage/edit/id/1', '2013-09-11 16:05:30', '2013-09-11 16:05:30'),
	(26, 3, '/frontend_dev.php/usage', '2013-09-11 16:06:05', '2013-09-11 16:06:05'),
	(27, 3, '/frontend_dev.php/usage', '2013-09-11 16:13:23', '2013-09-11 16:13:23'),
	(28, 3, '/', '2013-09-11 19:05:07', '2013-09-11 19:05:07'),
	(29, 3, '/auth/signin', '2013-09-11 19:05:10', '2013-09-11 19:05:10'),
	(30, 3, '/', '2013-09-11 19:05:19', '2013-09-11 19:05:19'),
	(31, 3, '/usage', '2013-09-11 19:05:20', '2013-09-11 19:05:20'),
	(32, 3, '/contactus', '2013-09-11 19:05:39', '2013-09-11 19:05:39'),
	(33, 3, '/page/o-proekte', '2013-09-11 19:05:42', '2013-09-11 19:05:42'),
	(34, 3, '/', '2013-09-11 19:05:46', '2013-09-11 19:05:46'),
	(35, 3, '/usage', '2013-09-11 19:05:48', '2013-09-11 19:05:48'),
	(36, 4, '/', '2013-09-12 13:43:47', '2013-09-12 13:43:47'),
	(37, 4, '/contactus', '2013-09-12 13:44:44', '2013-09-12 13:44:44'),
	(38, 4, '/frontend_dev.php/contactus', '2013-09-12 13:46:16', '2013-09-12 13:46:16'),
	(39, 4, '/frontend_dev.php/contactus', '2013-09-12 13:47:45', '2013-09-12 13:47:45'),
	(40, 4, '/frontend_dev.php/page/o-proekte', '2013-09-12 13:47:58', '2013-09-12 13:47:58'),
	(41, 4, '/frontend_dev.php/', '2013-09-12 13:48:02', '2013-09-12 13:48:02'),
	(42, 4, '/frontend_dev.php/', '2013-09-12 13:48:23', '2013-09-12 13:48:23'),
	(43, 4, '/frontend_dev.php/auth/signin', '2013-09-12 13:48:34', '2013-09-12 13:48:34'),
	(44, 4, '/frontend_dev.php/auth/signin', '2013-09-12 13:48:59', '2013-09-12 13:48:59'),
	(45, 4, '/frontend_dev.php/', '2013-09-12 13:49:07', '2013-09-12 13:49:07'),
	(46, 4, '/frontend_dev.php/usage', '2013-09-12 13:49:27', '2013-09-12 13:49:27'),
	(47, 4, '/frontend_dev.php/usage', '2013-09-12 13:50:52', '2013-09-12 13:50:52'),
	(48, 4, '/frontend_dev.php/', '2013-09-12 13:51:05', '2013-09-12 13:51:05'),
	(49, 4, '/frontend_dev.php/usage', '2013-09-12 13:51:47', '2013-09-12 13:51:47'),
	(50, 4, '/frontend_dev.php/contactus', '2013-09-12 14:02:13', '2013-09-12 14:02:13'),
	(51, 4, '/frontend_dev.php/contactus', '2013-09-12 14:03:50', '2013-09-12 14:03:50'),
	(52, 4, '/frontend_dev.php/contactus', '2013-09-12 14:04:32', '2013-09-12 14:04:32'),
	(53, 4, '/frontend_dev.php/usage', '2013-09-12 14:04:37', '2013-09-12 14:04:37'),
	(54, 4, '/frontend_dev.php/usage/new', '2013-09-12 14:08:50', '2013-09-12 14:08:50'),
	(55, 4, '/frontend_dev.php/usage', '2013-09-12 14:08:58', '2013-09-12 14:08:58'),
	(56, 4, '/frontend_dev.php/usage', '2013-09-12 14:09:44', '2013-09-12 14:09:44'),
	(57, 4, '/frontend_dev.php/usage/new', '2013-09-12 14:09:46', '2013-09-12 14:09:46'),
	(58, 4, '/frontend_dev.php/usage', '2013-09-12 14:09:52', '2013-09-12 14:09:52'),
	(59, 4, '/frontend_dev.php/usage', '2013-09-12 14:10:24', '2013-09-12 14:10:24'),
	(60, 4, '/frontend_dev.php/usage', '2013-09-12 14:12:02', '2013-09-12 14:12:02'),
	(61, 4, '/frontend_dev.php/usage', '2013-09-12 14:13:07', '2013-09-12 14:13:07'),
	(62, 4, '/frontend_dev.php/usage/new', '2013-09-12 14:13:10', '2013-09-12 14:13:10'),
	(63, 4, '/frontend_dev.php/usage', '2013-09-12 14:13:17', '2013-09-12 14:13:17'),
	(64, 4, '/frontend_dev.php/usage', '2013-09-12 14:13:40', '2013-09-12 14:13:40'),
	(65, 4, '/frontend_dev.php/usage/new', '2013-09-12 14:13:45', '2013-09-12 14:13:45'),
	(66, 4, '/frontend_dev.php/usage', '2013-09-12 14:13:48', '2013-09-12 14:13:48'),
	(67, 4, '/frontend_dev.php/usage', '2013-09-12 14:14:01', '2013-09-12 14:14:01'),
	(68, 4, '/frontend_dev.php/usage/new', '2013-09-12 14:14:06', '2013-09-12 14:14:06'),
	(69, 4, '/frontend_dev.php/usage', '2013-09-12 14:14:08', '2013-09-12 14:14:08'),
	(70, 4, '/frontend_dev.php/usage', '2013-09-12 14:14:17', '2013-09-12 14:14:17'),
	(71, 4, '/frontend_dev.php/usage', '2013-09-12 14:14:38', '2013-09-12 14:14:38'),
	(72, 4, '/frontend_dev.php/usage', '2013-09-12 14:14:46', '2013-09-12 14:14:46'),
	(73, 4, '/frontend_dev.php/usage', '2013-09-12 14:15:51', '2013-09-12 14:15:51'),
	(74, 4, '/frontend_dev.php/usage', '2013-09-12 14:15:55', '2013-09-12 14:15:55'),
	(75, 4, '/frontend_dev.php/usage', '2013-09-12 14:16:51', '2013-09-12 14:16:51'),
	(76, 4, '/frontend_dev.php/usage', '2013-09-12 14:19:25', '2013-09-12 14:19:25'),
	(77, 4, '/frontend_dev.php/usage', '2013-09-12 14:19:31', '2013-09-12 14:19:31'),
	(78, 4, '/frontend_dev.php/usage', '2013-09-12 14:19:57', '2013-09-12 14:19:57'),
	(79, 4, '/frontend_dev.php/usage', '2013-09-12 14:20:32', '2013-09-12 14:20:32'),
	(80, 4, '/frontend_dev.php/usage', '2013-09-12 15:01:11', '2013-09-12 15:01:11'),
	(81, 4, '/frontend_dev.php/usage', '2013-09-12 15:11:40', '2013-09-12 15:11:40'),
	(82, 4, '/frontend_dev.php/usage', '2013-09-12 15:11:59', '2013-09-12 15:11:59'),
	(83, 4, '/frontend_dev.php/usage', '2013-09-12 15:12:07', '2013-09-12 15:12:07'),
	(84, 4, '/frontend_dev.php/usage', '2013-09-12 15:12:53', '2013-09-12 15:12:53'),
	(85, 4, '/frontend_dev.php/usage', '2013-09-12 15:13:28', '2013-09-12 15:13:28'),
	(86, 4, '/frontend_dev.php/usage', '2013-09-12 15:14:33', '2013-09-12 15:14:33'),
	(87, 4, '/frontend_dev.php/usage', '2013-09-12 15:14:43', '2013-09-12 15:14:43'),
	(88, 4, '/frontend_dev.php/usage', '2013-09-12 15:14:55', '2013-09-12 15:14:55'),
	(89, 4, '/frontend_dev.php/usage', '2013-09-12 15:15:18', '2013-09-12 15:15:18'),
	(90, 4, '/frontend_dev.php/usage', '2013-09-12 15:15:41', '2013-09-12 15:15:41'),
	(91, 4, '/frontend_dev.php/usage', '2013-09-12 15:15:46', '2013-09-12 15:15:46'),
	(92, 4, '/frontend_dev.php/usage', '2013-09-12 15:16:00', '2013-09-12 15:16:00'),
	(93, 4, '/frontend_dev.php/usage', '2013-09-12 15:16:11', '2013-09-12 15:16:11'),
	(94, 4, '/frontend_dev.php/usage', '2013-09-12 15:18:12', '2013-09-12 15:18:12'),
	(95, 4, '/frontend_dev.php/usage', '2013-09-12 15:23:24', '2013-09-12 15:23:24'),
	(96, 4, '/frontend_dev.php/usage', '2013-09-12 15:24:27', '2013-09-12 15:24:27'),
	(97, 4, '/frontend_dev.php/usage', '2013-09-12 15:25:17', '2013-09-12 15:25:17'),
	(98, 4, '/frontend_dev.php/usage', '2013-09-12 15:25:36', '2013-09-12 15:25:36'),
	(99, 4, '/frontend_dev.php/usage', '2013-09-12 15:25:51', '2013-09-12 15:25:51'),
	(100, 5, '/', '2013-09-14 15:08:43', '2013-09-14 15:08:43'),
	(101, 6, '/frontend_dev.php/usage', '2013-09-14 15:10:12', '2013-09-14 15:10:12'),
	(102, 7, '/frontend_dev.php/usage', '2013-09-14 15:10:38', '2013-09-14 15:10:38'),
	(103, 8, '/frontend_dev.php/usage', '2013-09-14 15:12:40', '2013-09-14 15:12:40'),
	(104, 8, '/frontend_dev.php/usage', '2013-09-14 15:13:21', '2013-09-14 15:13:21'),
	(105, 8, '/frontend_dev.php/usage', '2013-09-14 15:15:30', '2013-09-14 15:15:30'),
	(106, 8, '/frontend_dev.php/usage', '2013-09-14 15:16:57', '2013-09-14 15:16:57'),
	(107, 8, '/frontend_dev.php/usage', '2013-09-14 15:18:51', '2013-09-14 15:18:51'),
	(108, 8, '/frontend_dev.php/contactus', '2013-09-14 15:19:16', '2013-09-14 15:19:16'),
	(109, 8, '/frontend_dev.php/contactus', '2013-09-14 15:20:25', '2013-09-14 15:20:25'),
	(110, 8, '/frontend_dev.php/profile', '2013-09-14 15:22:00', '2013-09-14 15:22:00'),
	(111, 8, '/frontend_dev.php/profile', '2013-09-14 15:25:41', '2013-09-14 15:25:41'),
	(112, 8, '/frontend_dev.php/profile', '2013-09-14 15:27:31', '2013-09-14 15:27:31'),
	(113, 8, '/frontend_dev.php/profile', '2013-09-14 15:27:53', '2013-09-14 15:27:53'),
	(114, 8, '/frontend_dev.php/contactus', '2013-09-14 15:28:03', '2013-09-14 15:28:03'),
	(115, 8, '/frontend_dev.php/contactus', '2013-09-14 15:29:42', '2013-09-14 15:29:42'),
	(116, 8, '/frontend_dev.php/profile', '2013-09-14 15:29:46', '2013-09-14 15:29:46'),
	(117, 8, '/frontend_dev.php/profile', '2013-09-14 15:30:12', '2013-09-14 15:30:12'),
	(118, 8, '/frontend_dev.php/usage', '2013-09-14 15:30:18', '2013-09-14 15:30:18'),
	(119, 8, '/frontend_dev.php/usage', '2013-09-14 15:30:43', '2013-09-14 15:30:43'),
	(120, 8, '/frontend_dev.php/usage', '2013-09-14 15:30:50', '2013-09-14 15:30:50'),
	(121, 8, '/frontend_dev.php/usage', '2013-09-14 15:31:23', '2013-09-14 15:31:23'),
	(122, 8, '/frontend_dev.php/usage', '2013-09-14 15:31:40', '2013-09-14 15:31:40'),
	(123, 8, '/frontend_dev.php/contactus', '2013-09-14 15:32:44', '2013-09-14 15:32:44'),
	(124, 8, '/frontend_dev.php/usage', '2013-09-14 15:32:47', '2013-09-14 15:32:47'),
	(125, 8, '/frontend_dev.php/profile', '2013-09-14 15:32:50', '2013-09-14 15:32:50'),
	(126, 8, '/frontend_dev.php/profile', '2013-09-14 15:33:32', '2013-09-14 15:33:32'),
	(127, 8, '/frontend_dev.php/usage', '2013-09-14 15:33:40', '2013-09-14 15:33:40'),
	(128, 8, '/frontend_dev.php/contactus', '2013-09-14 15:33:50', '2013-09-14 15:33:50'),
	(129, 8, '/frontend_dev.php/page/o-proekte', '2013-09-14 15:33:54', '2013-09-14 15:33:54'),
	(130, 8, '/frontend_dev.php/usage', '2013-09-14 15:33:56', '2013-09-14 15:33:56'),
	(131, 8, '/frontend_dev.php/', '2013-09-14 15:33:57', '2013-09-14 15:33:57'),
	(132, 8, '/frontend_dev.php/usage', '2013-09-14 15:34:06', '2013-09-14 15:34:06'),
	(133, 8, '/frontend_dev.php/usage', '2013-09-14 15:34:51', '2013-09-14 15:34:51'),
	(134, 8, '/frontend_dev.php/usage', '2013-09-14 15:35:22', '2013-09-14 15:35:22'),
	(135, 8, '/frontend_dev.php/usage', '2013-09-14 15:35:36', '2013-09-14 15:35:36'),
	(136, 8, '/frontend_dev.php/profile', '2013-09-14 15:35:44', '2013-09-14 15:35:44'),
	(137, 8, '/frontend_dev.php/profile', '2013-09-14 15:35:53', '2013-09-14 15:35:53'),
	(138, 8, '/frontend_dev.php/', '2013-09-14 15:35:58', '2013-09-14 15:35:58'),
	(139, 8, '/frontend_dev.php/usage', '2013-09-14 15:37:28', '2013-09-14 15:37:28'),
	(140, 9, '/', '2013-09-23 12:06:48', '2013-09-23 12:06:48'),
	(141, 10, '/', '2013-10-12 17:20:47', '2013-10-12 17:20:47'),
	(142, 10, '/auth/signin', '2013-10-12 17:20:59', '2013-10-12 17:20:59'),
	(143, 10, '/contactus', '2013-10-12 17:21:18', '2013-10-12 17:21:18'),
	(144, 10, '/register', '2013-10-12 17:24:00', '2013-10-12 17:24:00'),
	(145, 10, '/register', '2013-10-12 17:26:07', '2013-10-12 17:26:07'),
	(146, 10, '/register', '2013-10-12 17:37:53', '2013-10-12 17:37:53'),
	(147, 10, '/register', '2013-10-12 17:39:44', '2013-10-12 17:39:44'),
	(148, 10, '/register', '2013-10-12 17:39:54', '2013-10-12 17:39:54'),
	(149, 10, '/register', '2013-10-12 17:41:50', '2013-10-12 17:41:50'),
	(150, 10, '/register', '2013-10-12 17:42:02', '2013-10-12 17:42:02'),
	(151, 10, '/register', '2013-10-12 17:44:36', '2013-10-12 17:44:36'),
	(152, 10, '/register', '2013-10-12 17:44:55', '2013-10-12 17:44:55'),
	(153, 10, '/register', '2013-10-12 17:44:57', '2013-10-12 17:44:57'),
	(154, 10, '/register', '2013-10-12 17:49:33', '2013-10-12 17:49:33'),
	(155, 10, '/register', '2013-10-12 17:49:43', '2013-10-12 17:49:43'),
	(156, 10, '/register', '2013-10-12 17:53:12', '2013-10-12 17:53:12'),
	(157, 10, '/register', '2013-10-12 17:56:18', '2013-10-12 17:56:18'),
	(158, 10, '/register', '2013-10-12 17:56:50', '2013-10-12 17:56:50'),
	(159, 10, '/register', '2013-10-12 17:56:57', '2013-10-12 17:56:57'),
	(160, 10, '/register', '2013-10-12 17:58:11', '2013-10-12 17:58:11'),
	(161, 10, '/register', '2013-10-12 17:58:40', '2013-10-12 17:58:40'),
	(162, 10, '/register', '2013-10-12 17:59:41', '2013-10-12 17:59:41'),
	(163, 10, '/register', '2013-10-12 18:01:16', '2013-10-12 18:01:16'),
	(164, 10, '/register', '2013-10-12 18:02:29', '2013-10-12 18:02:29'),
	(165, 10, '/register', '2013-10-12 18:02:47', '2013-10-12 18:02:47'),
	(166, 10, '/frontend_dev.php/register', '2013-10-12 18:31:08', '2013-10-12 18:31:08'),
	(167, 10, '/frontend_dev.php/register', '2013-10-12 18:31:41', '2013-10-12 18:31:41'),
	(168, 10, '/frontend_dev.php/register', '2013-10-12 18:31:53', '2013-10-12 18:31:53'),
	(169, 10, '/frontend_dev.php/register', '2013-10-12 18:32:17', '2013-10-12 18:32:17'),
	(170, 10, '/frontend_dev.php/register', '2013-10-12 18:32:44', '2013-10-12 18:32:44'),
	(171, 10, '/frontend_dev.php/register', '2013-10-12 18:33:19', '2013-10-12 18:33:19'),
	(172, 10, '/frontend_dev.php/register', '2013-10-12 18:36:36', '2013-10-12 18:36:36'),
	(173, 10, '/frontend_dev.php/register', '2013-10-12 18:36:49', '2013-10-12 18:36:49'),
	(174, 10, '/frontend_dev.php/register', '2013-10-12 18:37:03', '2013-10-12 18:37:03'),
	(175, 10, '/frontend_dev.php/register', '2013-10-12 18:37:11', '2013-10-12 18:37:11'),
	(176, 10, '/frontend_dev.php/register', '2013-10-12 18:37:32', '2013-10-12 18:37:32'),
	(177, 10, '/frontend_dev.php/register', '2013-10-12 18:38:03', '2013-10-12 18:38:03'),
	(178, 10, '/frontend_dev.php/register', '2013-10-12 18:41:03', '2013-10-12 18:41:03'),
	(179, 10, '/frontend_dev.php/register', '2013-10-12 18:41:31', '2013-10-12 18:41:31'),
	(180, 10, '/frontend_dev.php/register', '2013-10-12 18:42:12', '2013-10-12 18:42:12'),
	(181, 10, '/frontend_dev.php/register', '2013-10-12 18:42:29', '2013-10-12 18:42:29'),
	(182, 10, '/frontend_dev.php/register', '2013-10-12 18:42:57', '2013-10-12 18:42:57'),
	(183, 10, '/frontend_dev.php/register', '2013-10-12 18:43:18', '2013-10-12 18:43:18'),
	(184, 10, '/frontend_dev.php/register', '2013-10-12 18:43:26', '2013-10-12 18:43:26'),
	(185, 10, '/frontend_dev.php/register', '2013-10-12 18:43:31', '2013-10-12 18:43:31'),
	(186, 10, '/frontend_dev.php/register', '2013-10-12 19:31:25', '2013-10-12 19:31:25'),
	(187, 10, '/frontend_dev.php/register', '2013-10-12 19:53:02', '2013-10-12 19:53:02'),
	(188, 10, '/frontend_dev.php/register', '2013-10-12 19:55:24', '2013-10-12 19:55:24'),
	(189, 11, '/', '2014-01-07 00:57:30', '2014-01-07 00:57:30'),
	(190, 12, '/', '2014-01-07 18:54:19', '2014-01-07 18:54:19'),
	(191, 13, '/', '2014-10-24 21:16:52', '2014-10-24 21:16:52'),
	(192, 13, '/', '2014-10-24 22:14:20', '2014-10-24 22:14:20'),
	(193, 14, '/', '2014-10-25 12:38:02', '2014-10-25 12:38:02'),
	(194, 14, '/', '2014-10-25 12:41:19', '2014-10-25 12:41:19'),
	(195, 14, '/', '2014-10-25 12:42:14', '2014-10-25 12:42:14'),
	(196, 14, '/', '2014-10-25 12:46:41', '2014-10-25 12:46:41'),
	(197, 14, '/', '2014-10-25 12:50:15', '2014-10-25 12:50:15'),
	(198, 14, '/', '2014-10-25 12:50:36', '2014-10-25 12:50:36'),
	(199, 14, '/auth/signin', '2014-10-26 12:15:57', '2014-10-26 12:15:57'),
	(200, 14, '/', '2014-10-26 12:16:05', '2014-10-26 12:16:05'),
	(201, 14, '/auth/signin', '2014-10-26 12:54:54', '2014-10-26 12:54:54'),
	(202, 14, '/frontend_dev.php/auth/register', '2014-10-26 13:06:20', '2014-10-26 13:06:20'),
	(203, 14, '/frontend_dev.php/auth/register', '2014-10-26 13:07:53', '2014-10-26 13:07:53'),
	(204, 14, '/frontend_dev.php/auth/register', '2014-10-26 13:08:16', '2014-10-26 13:08:16'),
	(205, 14, '/frontend_dev.php/auth/register', '2014-10-26 15:00:12', '2014-10-26 15:00:12'),
	(206, 14, '/frontend_dev.php/auth/register', '2014-10-26 15:00:57', '2014-10-26 15:00:57'),
	(207, 14, '/frontend_dev.php/auth/register', '2014-10-26 15:02:23', '2014-10-26 15:02:23'),
	(208, 14, '/frontend_dev.php/auth/register', '2014-10-26 15:03:04', '2014-10-26 15:03:04'),
	(209, 14, '/frontend_dev.php/auth/register', '2014-10-26 15:04:38', '2014-10-26 15:04:38'),
	(210, 14, '/frontend_dev.php/auth/register', '2014-10-26 15:05:09', '2014-10-26 15:05:09'),
	(211, 14, '/frontend_dev.php/auth/register', '2014-10-26 15:07:01', '2014-10-26 15:07:01'),
	(212, 14, '/frontend_dev.php/auth/register', '2014-10-26 15:07:26', '2014-10-26 15:07:26'),
	(213, 14, '/frontend_dev.php/auth/register', '2014-10-26 15:09:02', '2014-10-26 15:09:02'),
	(214, 14, '/frontend_dev.php/auth/register', '2014-10-26 15:10:35', '2014-10-26 15:10:35'),
	(215, 14, '/frontend_dev.php/auth/register', '2014-10-26 15:11:04', '2014-10-26 15:11:04'),
	(216, 14, '/frontend_dev.php/auth/register', '2014-10-26 15:11:23', '2014-10-26 15:11:23'),
	(217, 14, '/frontend_dev.php/auth/register', '2014-10-26 15:12:03', '2014-10-26 15:12:03'),
	(218, 14, '/frontend_dev.php/auth/register', '2014-10-26 15:12:33', '2014-10-26 15:12:33'),
	(219, 14, '/frontend_dev.php/auth/register', '2014-10-26 15:13:32', '2014-10-26 15:13:32'),
	(220, 14, '/frontend_dev.php/auth/register', '2014-10-26 15:13:43', '2014-10-26 15:13:43'),
	(221, 14, '/frontend_dev.php/auth/register', '2014-10-26 15:16:23', '2014-10-26 15:16:23'),
	(222, 14, '/frontend_dev.php/auth/register', '2014-10-26 15:31:19', '2014-10-26 15:31:19'),
	(223, 14, '/frontend_dev.php/auth/register', '2014-10-26 15:33:50', '2014-10-26 15:33:50'),
	(224, 14, '/frontend_dev.php/auth/register', '2014-10-26 15:36:06', '2014-10-26 15:36:06'),
	(225, 14, '/frontend_dev.php/auth/register', '2014-10-26 15:36:58', '2014-10-26 15:36:58'),
	(226, 14, '/frontend_dev.php/auth/register', '2014-10-26 15:40:16', '2014-10-26 15:40:16'),
	(227, 14, '/frontend_dev.php/auth/register', '2014-10-26 15:41:21', '2014-10-26 15:41:21'),
	(228, 14, '/frontend_dev.php/auth/register', '2014-10-26 15:42:08', '2014-10-26 15:42:08'),
	(229, 14, '/frontend_dev.php/auth/register', '2014-10-26 15:43:27', '2014-10-26 15:43:27'),
	(230, 14, '/frontend_dev.php/auth/register', '2014-10-26 15:43:36', '2014-10-26 15:43:36'),
	(231, 14, '/frontend_dev.php/auth/register', '2014-10-26 15:43:50', '2014-10-26 15:43:50'),
	(232, 14, '/frontend_dev.php/auth/register', '2014-10-26 15:44:41', '2014-10-26 15:44:41'),
	(233, 14, '/frontend_dev.php/', '2014-10-26 15:44:54', '2014-10-26 15:44:54'),
	(234, 14, '/frontend_dev.php/page/o-proekte', '2014-10-26 15:45:00', '2014-10-26 15:45:00'),
	(235, 14, '/frontend_dev.php/contactus', '2014-10-26 15:45:07', '2014-10-26 15:45:07'),
	(236, 14, '/frontend_dev.php/auth/signin', '2014-10-26 15:45:12', '2014-10-26 15:45:12'),
	(237, 14, '/frontend_dev.php/auth/register', '2014-10-26 15:45:35', '2014-10-26 15:45:35'),
	(238, 14, '/frontend_dev.php/auth/register', '2014-10-26 15:46:55', '2014-10-26 15:46:55'),
	(239, 14, '/frontend_dev.php/auth/register', '2014-10-26 15:47:36', '2014-10-26 15:47:36'),
	(240, 14, '/frontend_dev.php/auth/register', '2014-10-26 15:48:03', '2014-10-26 15:48:03'),
	(241, 14, '/frontend_dev.php/auth/register', '2014-10-26 15:48:14', '2014-10-26 15:48:14'),
	(242, 14, '/frontend_dev.php/auth/register', '2014-10-26 15:52:47', '2014-10-26 15:52:47'),
	(243, 14, '/frontend_dev.php/auth/register', '2014-10-26 15:53:15', '2014-10-26 15:53:15'),
	(244, 14, '/frontend_dev.php/auth/register', '2014-10-26 15:54:28', '2014-10-26 15:54:28'),
	(245, 14, '/frontend_dev.php/auth/register', '2014-10-26 15:54:58', '2014-10-26 15:54:58'),
	(246, 14, '/frontend_dev.php/auth/register', '2014-10-26 16:07:49', '2014-10-26 16:07:49'),
	(247, 14, '/frontend_dev.php/auth/register', '2014-10-26 16:08:18', '2014-10-26 16:08:18'),
	(248, 14, '/frontend_dev.php/auth/register', '2014-10-26 16:08:34', '2014-10-26 16:08:34'),
	(249, 14, '/frontend_dev.php/auth/register', '2014-10-26 16:08:44', '2014-10-26 16:08:44'),
	(250, 14, '/frontend_dev.php/auth/register', '2014-10-26 16:08:55', '2014-10-26 16:08:55'),
	(251, 14, '/frontend_dev.php/auth/register', '2014-10-26 16:10:40', '2014-10-26 16:10:40'),
	(252, 14, '/frontend_dev.php/auth/registrationComplete', '2014-10-26 16:12:10', '2014-10-26 16:12:10'),
	(253, 14, '/', '2014-10-26 16:12:16', '2014-10-26 16:12:16'),
	(254, 14, '/', '2014-10-26 16:12:27', '2014-10-26 16:12:27'),
	(255, 14, '/', '2014-10-26 16:15:09', '2014-10-26 16:15:09'),
	(256, 14, '/', '2014-10-26 16:15:14', '2014-10-26 16:15:14'),
	(257, 14, '/', '2014-10-26 16:15:31', '2014-10-26 16:15:31'),
	(258, 14, '/', '2014-10-26 16:17:13', '2014-10-26 16:17:13'),
	(259, 14, '/', '2014-10-26 16:17:21', '2014-10-26 16:17:21'),
	(260, 14, '/auth/signin', '2014-10-26 16:17:24', '2014-10-26 16:17:24'),
	(261, 14, '/auth/signin', '2014-10-26 16:18:07', '2014-10-26 16:18:07'),
	(262, 14, '/auth/register', '2014-10-26 16:18:13', '2014-10-26 16:18:13'),
	(263, 14, '/auth/signin', '2014-10-26 16:18:18', '2014-10-26 16:18:18'),
	(264, 14, '/auth/signin', '2014-10-26 16:19:30', '2014-10-26 16:19:30'),
	(265, 14, '/auth/register', '2014-10-26 16:19:35', '2014-10-26 16:19:35'),
	(266, 14, '/auth/signin', '2014-10-26 16:19:48', '2014-10-26 16:19:48'),
	(267, 14, '/auth/forgotPassword', '2014-10-26 16:20:00', '2014-10-26 16:20:00'),
	(268, 14, '/auth/forgotPassword', '2014-10-26 16:20:19', '2014-10-26 16:20:19'),
	(269, 14, '/auth/forgotPassword', '2014-10-26 16:20:46', '2014-10-26 16:20:46'),
	(270, 14, '/auth/forgotPassword', '2014-10-26 16:20:57', '2014-10-26 16:20:57'),
	(271, 14, '/auth/forgotPassword', '2014-10-26 16:21:05', '2014-10-26 16:21:05'),
	(272, 14, '/auth/signin', '2014-10-26 16:21:54', '2014-10-26 16:21:54'),
	(273, 14, '/auth/register', '2014-10-26 16:21:57', '2014-10-26 16:21:57'),
	(274, 14, '/auth/registrationComplete', '2014-10-26 16:22:20', '2014-10-26 16:22:20'),
	(275, 14, '/', '2014-10-26 16:22:27', '2014-10-26 16:22:27'),
	(276, 14, '/', '2014-10-26 16:30:35', '2014-10-26 16:30:35'),
	(277, 14, '/', '2014-10-26 16:31:00', '2014-10-26 16:31:00'),
	(278, 14, '/', '2014-10-26 16:31:18', '2014-10-26 16:31:18'),
	(279, 14, '/', '2014-10-26 16:31:34', '2014-10-26 16:31:34'),
	(280, 14, '/auth/signin', '2014-10-26 16:32:10', '2014-10-26 16:32:10'),
	(281, 14, '/auth/register', '2014-10-26 16:32:14', '2014-10-26 16:32:14'),
	(282, 14, '/auth/registrationComplete', '2014-10-26 16:32:49', '2014-10-26 16:32:49'),
	(283, 14, '/', '2014-10-26 16:32:57', '2014-10-26 16:32:57'),
	(284, 14, '/register/activationSuccessful', '2014-10-26 16:33:10', '2014-10-26 16:33:10'),
	(285, 14, '/', '2014-10-26 16:35:55', '2014-10-26 16:35:55'),
	(286, 14, '/', '2014-10-26 16:36:30', '2014-10-26 16:36:30'),
	(287, 14, '/', '2014-10-26 16:36:47', '2014-10-26 16:36:47'),
	(288, 14, '/', '2014-10-26 16:42:00', '2014-10-26 16:42:00'),
	(289, 14, '/', '2014-10-26 16:42:06', '2014-10-26 16:42:06'),
	(290, 14, '/auth/signin', '2014-10-26 16:42:09', '2014-10-26 16:42:09'),
	(291, 14, '/auth/register', '2014-10-26 16:42:13', '2014-10-26 16:42:13'),
	(292, 14, '/auth/registrationComplete', '2014-10-26 16:42:52', '2014-10-26 16:42:52'),
	(293, 14, '/', '2014-10-26 16:42:59', '2014-10-26 16:42:59'),
	(294, 14, '/auth/activationSuccessful', '2014-10-26 16:43:13', '2014-10-26 16:43:13'),
	(295, 14, '/frontend_dev.php/profile', '2014-10-26 16:45:14', '2014-10-26 16:45:14'),
	(296, 14, '/frontend_dev.php/profile', '2014-10-26 16:46:24', '2014-10-26 16:46:24'),
	(297, 14, '/frontend_dev.php/profile', '2014-10-26 16:50:41', '2014-10-26 16:50:41'),
	(298, 14, '/frontend_dev.php/auth/register', '2014-10-26 16:50:45', '2014-10-26 16:50:45'),
	(299, 14, '/frontend_dev.php/auth/registrationComplete', '2014-10-26 16:51:12', '2014-10-26 16:51:12'),
	(300, 14, '/', '2014-10-26 16:51:21', '2014-10-26 16:51:21'),
	(301, 14, '/auth/activationSuccessful', '2014-10-26 16:51:22', '2014-10-26 16:51:22'),
	(302, 14, '/profile', '2014-10-26 16:51:28', '2014-10-26 16:51:28'),
	(303, 14, '/profile', '2014-10-26 16:52:50', '2014-10-26 16:52:50'),
	(304, 14, '/auth/signin', '2014-10-26 16:52:56', '2014-10-26 16:52:56'),
	(305, 14, '/', '2014-10-26 16:53:07', '2014-10-26 16:53:07'),
	(306, 14, '/', '2014-10-26 16:56:40', '2014-10-26 16:56:40'),
	(307, 14, '/', '2014-10-26 16:59:21', '2014-10-26 16:59:21'),
	(308, 14, '/page/zakrytyy_razdel', '2014-10-26 16:59:25', '2014-10-26 16:59:25'),
	(309, 14, '/page/zakrytyy_razdel', '2014-10-26 16:59:36', '2014-10-26 16:59:36'),
	(310, 14, '/page/zakrytyy_razdel', '2014-10-26 17:03:47', '2014-10-26 17:03:47'),
	(311, 14, '/', '2014-10-26 17:23:45', '2014-10-26 17:23:45'),
	(312, 14, '/page/eto-testovaya-stranica', '2014-10-26 17:27:14', '2014-10-26 17:27:14'),
	(313, 14, '/page/eto-testovaya-stranica', '2014-10-26 17:30:34', '2014-10-26 17:30:34'),
	(314, 14, '/page/eto-testovaya-stranica', '2014-10-26 18:30:36', '2014-10-26 18:30:36'),
	(315, 14, '/page/eto-testovaya-stranica', '2014-10-26 18:31:33', '2014-10-26 18:31:33'),
	(316, 14, '/page/eto-testovaya-stranica-kak-by', '2014-10-26 18:32:59', '2014-10-26 18:32:59'),
	(317, 14, '/page/eto-testovaya-stranica-kak-by', '2014-10-26 18:37:29', '2014-10-26 18:37:29'),
	(318, 14, '/page/eto-testovaya-stranica-kak-by', '2014-10-26 18:37:46', '2014-10-26 18:37:46'),
	(319, 14, '/page/eto-testovaya-stranica-kak-by', '2014-10-26 18:38:48', '2014-10-26 18:38:48'),
	(320, 14, '/page/eto-testovaya-stranica-ponimaesh', '2014-10-26 18:39:13', '2014-10-26 18:39:13'),
	(321, 14, '/page/eto-testovaya-stranica-ponimaesh', '2014-10-26 18:39:28', '2014-10-26 18:39:28'),
	(322, 14, '/page/eto-testovaya-stranica', '2014-10-26 18:40:04', '2014-10-26 18:40:04'),
	(323, 14, '/page/eto-testovaya-stranica', '2014-10-26 18:40:51', '2014-10-26 18:40:51'),
	(324, 14, '/', '2014-10-26 18:41:16', '2014-10-26 18:41:16'),
	(325, 14, '/profile', '2014-10-26 18:41:22', '2014-10-26 18:41:22'),
	(326, 14, '/profile/password', '2014-10-26 18:41:27', '2014-10-26 18:41:27'),
	(327, 14, '/profile', '2014-10-26 18:42:06', '2014-10-26 18:42:06'),
	(328, 14, '/profile', '2014-10-26 18:42:20', '2014-10-26 18:42:20'),
	(329, 14, '/profile', '2014-10-26 18:42:37', '2014-10-26 18:42:37'),
	(330, 14, '/profile', '2014-10-26 18:42:47', '2014-10-26 18:42:47'),
	(331, 14, '/profile', '2014-10-26 18:45:22', '2014-10-26 18:45:22'),
	(332, 14, '/profile/password', '2014-10-26 18:45:36', '2014-10-26 18:45:36'),
	(333, 14, '/frontend_dev.php/profile/password', '2014-10-26 18:47:13', '2014-10-26 18:47:13'),
	(334, 14, '/frontend_dev.php/profile/password', '2014-10-26 18:48:39', '2014-10-26 18:48:39'),
	(335, 14, '/frontend_dev.php/profile/password', '2014-10-26 18:48:51', '2014-10-26 18:48:51'),
	(336, 14, '/frontend_dev.php/profile/password', '2014-10-26 18:49:26', '2014-10-26 18:49:26'),
	(337, 14, '/frontend_dev.php/profile/password', '2014-10-26 18:49:39', '2014-10-26 18:49:39'),
	(338, 14, '/frontend_dev.php/profile/password', '2014-10-26 18:51:04', '2014-10-26 18:51:04'),
	(339, 14, '/frontend_dev.php/profile/password', '2014-10-26 18:51:36', '2014-10-26 18:51:36'),
	(340, 14, '/frontend_dev.php/profile/password', '2014-10-26 18:51:47', '2014-10-26 18:51:47'),
	(341, 14, '/frontend_dev.php/profile/password', '2014-10-26 18:51:58', '2014-10-26 18:51:58'),
	(342, 14, '/frontend_dev.php/profile/password', '2014-10-26 18:52:23', '2014-10-26 18:52:23'),
	(343, 14, '/frontend_dev.php/profile/password', '2014-10-26 18:52:43', '2014-10-26 18:52:43'),
	(344, 14, '/frontend_dev.php/profile/password', '2014-10-26 18:52:54', '2014-10-26 18:52:54'),
	(345, 14, '/frontend_dev.php/profile/avatar', '2014-10-26 18:55:35', '2014-10-26 18:55:35'),
	(346, 14, '/frontend_dev.php/profile/avatar', '2014-10-26 18:58:39', '2014-10-26 18:58:39'),
	(347, 14, '/frontend_dev.php/profile', '2014-10-26 18:59:16', '2014-10-26 18:59:16'),
	(348, 14, '/frontend_dev.php/profile/avatar', '2014-10-26 19:02:29', '2014-10-26 19:02:29'),
	(349, 14, '/frontend_dev.php/profile/avatar', '2014-10-26 19:03:57', '2014-10-26 19:03:57'),
	(350, 14, '/frontend_dev.php/profile/avatar', '2014-10-26 19:05:43', '2014-10-26 19:05:43'),
	(351, 14, '/frontend_dev.php/profile/avatar', '2014-10-26 19:06:03', '2014-10-26 19:06:03'),
	(352, 14, '/frontend_dev.php/profile/avatar', '2014-10-26 19:07:52', '2014-10-26 19:07:52'),
	(353, 14, '/frontend_dev.php/profile/avatar', '2014-10-26 19:08:31', '2014-10-26 19:08:31'),
	(354, 14, '/frontend_dev.php/profile/avatar', '2014-10-26 19:09:08', '2014-10-26 19:09:08'),
	(355, 14, '/frontend_dev.php/profile/avatar', '2014-10-26 19:10:20', '2014-10-26 19:10:20'),
	(356, 14, '/frontend_dev.php/profile/avatar', '2014-10-26 19:11:12', '2014-10-26 19:11:12'),
	(357, 14, '/frontend_dev.php/profile/avatar', '2014-10-26 19:15:17', '2014-10-26 19:15:17'),
	(358, 14, '/frontend_dev.php/profile/avatar', '2014-10-26 19:15:38', '2014-10-26 19:15:38'),
	(359, 14, '/frontend_dev.php/profile/avatar', '2014-10-26 19:16:00', '2014-10-26 19:16:00'),
	(360, 14, '/frontend_dev.php/profile/avatar', '2014-10-26 19:16:25', '2014-10-26 19:16:25'),
	(361, 14, '/frontend_dev.php/profile/avatar', '2014-10-26 19:16:49', '2014-10-26 19:16:49'),
	(362, 14, '/frontend_dev.php/profile/avatar', '2014-10-26 19:17:31', '2014-10-26 19:17:31'),
	(363, 14, '/frontend_dev.php/profile/avatar', '2014-10-26 19:17:58', '2014-10-26 19:17:58'),
	(364, 14, '/frontend_dev.php/profile/avatar', '2014-10-26 19:18:38', '2014-10-26 19:18:38'),
	(365, 14, '/frontend_dev.php/profile/avatar', '2014-10-26 19:19:51', '2014-10-26 19:19:51'),
	(366, 14, '/frontend_dev.php/profile/avatar', '2014-10-26 19:20:38', '2014-10-26 19:20:38'),
	(367, 14, '/frontend_dev.php/profile/avatar', '2014-10-26 19:21:38', '2014-10-26 19:21:38'),
	(368, 14, '/frontend_dev.php/profile/avatar', '2014-10-26 19:24:35', '2014-10-26 19:24:35'),
	(369, 14, '/frontend_dev.php/profile/avatar', '2014-10-26 19:25:39', '2014-10-26 19:25:39'),
	(370, 14, '/frontend_dev.php/profile/avatar', '2014-10-26 19:26:32', '2014-10-26 19:26:32'),
	(371, 14, '/frontend_dev.php/profile/avatar', '2014-10-26 19:28:10', '2014-10-26 19:28:10'),
	(372, 14, '/frontend_dev.php/profile/avatar', '2014-10-26 19:33:34', '2014-10-26 19:33:34'),
	(373, 14, '/frontend_dev.php/profile/avatar', '2014-10-26 19:36:25', '2014-10-26 19:36:25'),
	(374, 14, '/frontend_dev.php/profile/avatar', '2014-10-26 19:37:41', '2014-10-26 19:37:41'),
	(375, 14, '/frontend_dev.php/profile', '2014-10-26 19:38:29', '2014-10-26 19:38:29'),
	(376, 14, '/frontend_dev.php/profile/avatar', '2014-10-26 19:38:47', '2014-10-26 19:38:47'),
	(377, 14, '/frontend_dev.php/profile/avatar', '2014-10-26 19:39:34', '2014-10-26 19:39:34'),
	(378, 14, '/frontend_dev.php/profile/password', '2014-10-26 19:39:38', '2014-10-26 19:39:38'),
	(379, 14, '/frontend_dev.php/', '2014-10-26 19:39:52', '2014-10-26 19:39:52'),
	(380, 14, '/frontend_dev.php/', '2014-10-26 19:40:09', '2014-10-26 19:40:09'),
	(381, 14, '/frontend_dev.php/page/zakrytyy_razdel', '2014-10-26 19:40:38', '2014-10-26 19:40:38'),
	(382, 14, '/frontend_dev.php/page/zakrytyy_razdel', '2014-10-26 19:40:44', '2014-10-26 19:40:44'),
	(383, 14, '/frontend_dev.php/auth/forgotPassword', '2014-10-26 19:40:55', '2014-10-26 19:40:55'),
	(384, 14, '/page/eto-testovaya-stranica', '2014-10-26 21:37:21', '2014-10-26 21:37:21'),
	(385, 14, '/auth/signin', '2014-10-26 21:41:05', '2014-10-26 21:41:05'),
	(386, 14, '/auth/forgotPassword', '2014-10-26 21:41:09', '2014-10-26 21:41:09'),
	(387, 14, '/auth/forgotPassword', '2014-10-26 21:41:15', '2014-10-26 21:41:15'),
	(388, 14, '/auth/forgotPasswordThanks', '2014-10-26 21:42:19', '2014-10-26 21:42:19'),
	(389, 14, '/', '2014-10-26 21:42:26', '2014-10-26 21:42:26'),
	(390, 15, '/', '2014-10-26 21:56:34', '2014-10-26 21:56:34'),
	(391, 15, '/auth/signin', '2014-10-26 21:56:46', '2014-10-26 21:56:46'),
	(392, 15, '/auth/register', '2014-10-26 21:56:53', '2014-10-26 21:56:53'),
	(393, 15, '/auth/register', '2014-10-26 21:57:37', '2014-10-26 21:57:37'),
	(394, 15, '/auth/registrationComplete', '2014-10-26 21:57:48', '2014-10-26 21:57:48'),
	(395, 15, '/', '2014-10-26 21:57:54', '2014-10-26 21:57:54'),
	(396, 15, '/auth/activationSuccessful', '2014-10-26 21:58:20', '2014-10-26 21:58:20'),
	(397, 15, '/profile', '2014-10-26 21:58:26', '2014-10-26 21:58:26'),
	(398, 15, '/profile', '2014-10-26 21:58:34', '2014-10-26 21:58:34'),
	(399, 16, '/', '2014-10-26 21:59:36', '2014-10-26 21:59:36'),
	(400, 15, '/auth/forgotPassword', '2014-10-26 21:59:45', '2014-10-26 21:59:45'),
	(401, 15, '/auth/forgotPasswordThanks', '2014-10-26 21:59:50', '2014-10-26 21:59:50'),
	(402, 15, '/', '2014-10-26 21:59:55', '2014-10-26 21:59:55'),
	(403, 15, '/auth/signin', '2014-10-26 22:01:19', '2014-10-26 22:01:19'),
	(404, 15, '/auth/forgotPassword', '2014-10-26 22:01:22', '2014-10-26 22:01:22'),
	(405, 15, '/auth/forgotPasswordThanks', '2014-10-26 22:01:28', '2014-10-26 22:01:28'),
	(406, 15, '/', '2014-10-26 22:01:33', '2014-10-26 22:01:33'),
	(407, 15, '/auth/signin', '2014-10-26 22:03:41', '2014-10-26 22:03:41'),
	(408, 15, '/auth/forgotPassword', '2014-10-26 22:03:46', '2014-10-26 22:03:46'),
	(409, 15, '/auth/forgotPasswordThanks', '2014-10-26 22:03:55', '2014-10-26 22:03:55'),
	(410, 15, '/', '2014-10-26 22:04:01', '2014-10-26 22:04:01'),
	(411, 15, '/auth/signin', '2014-10-26 22:04:46', '2014-10-26 22:04:46'),
	(412, 15, '/auth/forgotPassword', '2014-10-26 22:04:52', '2014-10-26 22:04:52'),
	(413, 15, '/auth/forgotPasswordThanks', '2014-10-26 22:05:01', '2014-10-26 22:05:01'),
	(414, 15, '/', '2014-10-26 22:05:07', '2014-10-26 22:05:07'),
	(415, 15, '/frontend_dev.php/auth/recover?hash=2879349a5fe9f6c9f50a24516f1414bc', '2014-10-26 22:09:15', '2014-10-26 22:09:15'),
	(416, 15, '/frontend_dev.php/auth/recover?hash=2879349a5fe9f6c9f50a24516f1414bc', '2014-10-26 22:09:53', '2014-10-26 22:09:53'),
	(417, 15, '/frontend_dev.php/auth/recover?hash=2879349a5fe9f6c9f50a24516f1414bc', '2014-10-26 22:10:03', '2014-10-26 22:10:03'),
	(418, 15, '/frontend_dev.php/auth/recover?hash=2879349a5fe9f6c9f50a24516f1414bc', '2014-10-26 22:10:12', '2014-10-26 22:10:12'),
	(419, 15, '/frontend_dev.php/auth/recover?hash=2879349a5fe9f6c9f50a24516f1414bc', '2014-10-26 22:10:23', '2014-10-26 22:10:23'),
	(420, 15, '/frontend_dev.php/auth/recover?hash=2879349a5fe9f6c9f50a24516f1414bc', '2014-10-26 22:10:33', '2014-10-26 22:10:33'),
	(421, 15, '/frontend_dev.php/auth/signin', '2014-10-26 22:10:42', '2014-10-26 22:10:42'),
	(422, 15, '/', '2014-10-26 22:11:02', '2014-10-26 22:11:02'),
	(423, 15, '/profile', '2014-10-26 22:11:06', '2014-10-26 22:11:06'),
	(424, 15, '/profile', '2014-10-26 22:11:13', '2014-10-26 22:11:13'),
	(425, 15, '/frontend_dev.php/profile', '2014-10-26 22:15:02', '2014-10-26 22:15:02'),
	(426, 15, '/frontend_dev.php/profile', '2014-10-26 22:15:07', '2014-10-26 22:15:07'),
	(427, 15, '/frontend_dev.php/profile', '2014-10-26 22:15:14', '2014-10-26 22:15:14'),
	(428, 15, '/frontend_dev.php/profile', '2014-10-26 22:15:21', '2014-10-26 22:15:21'),
	(429, 15, '/frontend_dev.php/profile', '2014-10-26 22:15:26', '2014-10-26 22:15:26'),
	(430, 15, '/frontend_dev.php/profile', '2014-10-26 22:15:41', '2014-10-26 22:15:41'),
	(431, 15, '/frontend_dev.php/profile', '2014-10-26 22:15:51', '2014-10-26 22:15:51'),
	(432, 15, '/frontend_dev.php/profile', '2014-10-26 22:15:59', '2014-10-26 22:15:59'),
	(433, 15, '/frontend_dev.php/profile', '2014-10-26 22:16:09', '2014-10-26 22:16:09'),
	(434, 15, '/frontend_dev.php/profile', '2014-10-26 22:26:08', '2014-10-26 22:26:08'),
	(435, 15, '/frontend_dev.php/profile', '2014-10-26 22:26:15', '2014-10-26 22:26:15'),
	(436, 15, '/frontend_dev.php/profile', '2014-10-26 22:26:26', '2014-10-26 22:26:26'),
	(437, 15, '/profile', '2014-10-26 22:26:51', '2014-10-26 22:26:51'),
	(438, 16, '/auth/signin', '2014-10-26 22:27:25', '2014-10-26 22:27:25'),
	(439, 16, '/auth/forgotPassword', '2014-10-26 22:27:35', '2014-10-26 22:27:35'),
	(440, 16, '/auth/forgotPasswordThanks', '2014-10-26 22:27:42', '2014-10-26 22:27:42'),
	(441, 16, '/', '2014-10-26 22:27:49', '2014-10-26 22:27:49'),
	(442, 16, '/auth/recover?hash=6d69f27340c058e7d903fb111eef5fff', '2014-10-26 22:27:51', '2014-10-26 22:27:51'),
	(443, 16, '/auth/signin', '2014-10-26 22:27:56', '2014-10-26 22:27:56'),
	(444, 16, '/', '2014-10-26 22:28:10', '2014-10-26 22:28:10'),
	(445, 16, '/', '2014-10-26 22:28:13', '2014-10-26 22:28:13'),
	(446, 16, '/auth/signin', '2014-10-26 22:28:17', '2014-10-26 22:28:18'),
	(447, 16, '/auth/signin', '2014-10-26 22:28:20', '2014-10-26 22:28:20'),
	(448, 16, '/auth/signin', '2014-10-26 22:28:22', '2014-10-26 22:28:22'),
	(449, 16, '/auth/signin', '2014-10-26 22:28:25', '2014-10-26 22:28:25'),
	(450, 15, '/frontend_dev.php/', '2014-10-26 23:02:34', '2014-10-26 23:02:34'),
	(451, 15, '/frontend_dev.php/', '2014-10-26 23:04:18', '2014-10-26 23:04:18'),
	(452, 16, '/', '2014-10-26 23:06:54', '2014-10-26 23:06:54'),
	(453, 16, '/auth/signin', '2014-10-26 23:07:01', '2014-10-26 23:07:01'),
	(454, 17, '/auth/signin', '2014-10-26 23:07:09', '2014-10-26 23:07:09'),
	(455, 17, '/auth/signin', '2014-10-26 23:07:12', '2014-10-26 23:07:12'),
	(456, 17, '/auth/signin', '2014-10-26 23:07:14', '2014-10-26 23:07:14'),
	(457, 17, '/auth/signin', '2014-10-26 23:07:18', '2014-10-26 23:07:18'),
	(458, 17, '/auth/signin', '2014-10-26 23:07:21', '2014-10-26 23:07:21'),
	(459, 17, '/auth/signin', '2014-10-26 23:07:28', '2014-10-26 23:07:28'),
	(460, 17, '/auth/signin', '2014-10-26 23:07:39', '2014-10-26 23:07:39'),
	(461, 17, '/', '2014-10-26 23:07:45', '2014-10-26 23:07:45'),
	(462, 17, '/page/o-proekte', '2014-10-26 23:07:47', '2014-10-26 23:07:47'),
	(463, 17, '/contactus', '2014-10-26 23:07:50', '2014-10-26 23:07:50'),
	(464, 17, '/auth/signin', '2014-10-26 23:07:53', '2014-10-26 23:07:53'),
	(465, 15, '/frontend_dev.php/', '2014-10-26 23:08:50', '2014-10-26 23:08:50'),
	(466, 15, '/frontend_dev.php/auth/signin', '2014-10-26 23:09:09', '2014-10-26 23:09:09'),
	(467, 15, '/frontend_dev.php/auth/signin', '2014-10-26 23:09:24', '2014-10-26 23:09:24'),
	(468, 15, '/frontend_dev.php/auth/signin', '2014-10-26 23:09:31', '2014-10-26 23:09:31'),
	(469, 15, '/frontend_dev.php/auth/signin', '2014-10-26 23:09:40', '2014-10-26 23:09:40'),
	(470, 15, '/frontend_dev.php/auth/signin', '2014-10-26 23:09:53', '2014-10-26 23:09:53'),
	(471, 15, '/frontend_dev.php/auth/signin', '2014-10-26 23:10:03', '2014-10-26 23:10:03'),
	(472, 15, '/frontend_dev.php/auth/signin', '2014-10-26 23:10:13', '2014-10-26 23:10:13'),
	(473, 15, '/frontend_dev.php/contactus', '2014-10-26 23:10:17', '2014-10-26 23:10:17'),
	(474, 15, '/frontend_dev.php/contactus', '2014-10-27 01:13:26', '2014-10-27 01:13:26'),
	(475, 15, '/frontend_dev.php/your-ip-address-is-banned', '2014-10-27 01:21:35', '2014-10-27 01:21:35');
/*!40000 ALTER TABLE `site_visit_page` ENABLE KEYS */;


-- Dumping structure for table dev_single.social_bridge
CREATE TABLE IF NOT EXISTS `social_bridge` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `email` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'new',
  `token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `network` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `network_user_id` bigint(20) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id_idx` (`user_id`),
  CONSTRAINT `social_bridge_user_id_sf_guard_user_id` FOREIGN KEY (`user_id`) REFERENCES `sf_guard_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table dev_single.social_bridge: ~0 rows (approximately)
/*!40000 ALTER TABLE `social_bridge` DISABLE KEYS */;
/*!40000 ALTER TABLE `social_bridge` ENABLE KEYS */;


-- Dumping structure for table dev_single.social_user
CREATE TABLE IF NOT EXISTS `social_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `facebook_user_id` decimal(21,2) DEFAULT NULL,
  `facebook_user_info` text COLLATE utf8_unicode_ci,
  `vkontakte_user_id` decimal(21,2) DEFAULT NULL,
  `vkontakte_user_info` text COLLATE utf8_unicode_ci,
  `google_user_id` decimal(21,2) DEFAULT NULL,
  `google_user_info` text COLLATE utf8_unicode_ci,
  `mailru_user_id` decimal(21,2) DEFAULT NULL,
  `mailru_user_info` text COLLATE utf8_unicode_ci,
  `yandex_user_id` decimal(21,2) DEFAULT NULL,
  `yandex_user_info` text COLLATE utf8_unicode_ci,
  `twitter_user_id` decimal(21,2) DEFAULT NULL,
  `twitter_user_info` text COLLATE utf8_unicode_ci,
  `user_id` bigint(20) DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id_idx` (`user_id`),
  CONSTRAINT `social_user_user_id_sf_guard_user_id` FOREIGN KEY (`user_id`) REFERENCES `sf_guard_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table dev_single.social_user: ~0 rows (approximately)
/*!40000 ALTER TABLE `social_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `social_user` ENABLE KEYS */;


-- Dumping structure for table dev_single.testaurus
CREATE TABLE IF NOT EXISTS `testaurus` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `attach` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `attach_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `attach_mime` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_keywords` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `geo_lat` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `geo_lng` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `geo_country` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `geo_city` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `geo_address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `geo_address_formatted` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table dev_single.testaurus: ~0 rows (approximately)
/*!40000 ALTER TABLE `testaurus` DISABLE KEYS */;
INSERT INTO `testaurus` (`id`, `name`, `description`, `image`, `attach`, `attach_name`, `attach_mime`, `meta_title`, `meta_description`, `meta_keywords`, `geo_lat`, `geo_lng`, `geo_country`, `geo_city`, `geo_address`, `geo_address_formatted`) VALUES
	(1, 'test', '', 'dff35f580ce1047b9ea80fbd78cd6a3236d05af5.jpg', 'e3c298c1ddd736779bf7b3e88a3a2555219b1a2a.zip', 'das_sieben.zip', 'application/zip', 'test', '', '', '47.8624805', '13.1235225', 'Austria', 'Eugendorf', 'Dürnbichlstraße, 26', 'Dürnbichlstraße 26, 5301 Eugendorf, Austria');
/*!40000 ALTER TABLE `testaurus` ENABLE KEYS */;


-- Dumping structure for table dev_single.text_block
CREATE TABLE IF NOT EXISTS `text_block` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `text` text COLLATE utf8_unicode_ci,
  `application` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `module` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `special_mark` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_visible_for_admin` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `section_index_idx` (`application`,`module`)
) ENGINE=InnoDB AUTO_INCREMENT=390 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table dev_single.text_block: ~316 rows (approximately)
/*!40000 ALTER TABLE `text_block` DISABLE KEYS */;
INSERT INTO `text_block` (`id`, `name`, `title`, `text`, `application`, `module`, `special_mark`, `is_visible_for_admin`) VALUES
	(1, 'Username', NULL, 'Имя пользователя', 'cms', NULL, NULL, 0),
	(2, 'Password', NULL, 'Пароль', 'cms', NULL, NULL, 0),
	(3, 'Remember?', NULL, 'Запомнить?', 'cms', NULL, NULL, 0),
	(4, 'Login', NULL, 'Войти', 'cms', NULL, NULL, 0),
	(5, 'Welcome to', NULL, 'Добро пожаловать', 'cms', NULL, NULL, 0),
	(6, 'Use a valid username and password to gain access to the administration console.', NULL, 'Используйте правильное имя пользователя и пароль, чтобы получить доступ к консоли администрирования.', 'cms', NULL, NULL, 0),
	(7, 'Вход', NULL, 'Войти', 'frontend', NULL, NULL, 0),
	(8, 'Ваша компания', NULL, 'Ваша компания', 'frontend', NULL, NULL, 0),
	(9, 'Разработка и поддержка', NULL, 'Разработка и поддержка', 'frontend', NULL, NULL, 0),
	(11, 'Blog', NULL, 'Блог', 'cms', NULL, NULL, 0),
	(12, 'Posts', NULL, 'Сообщения', 'cms', NULL, NULL, 0),
	(13, 'Comments', NULL, 'Комментарии', 'cms', NULL, NULL, 0),
	(14, 'Tags', NULL, 'Метки', 'cms', NULL, NULL, 0),
	(15, 'Users', NULL, 'Пользователи', 'cms', NULL, NULL, 0),
	(16, 'Settings', NULL, 'Настройки', 'cms', NULL, NULL, 0),
	(18, 'Email шаблоны', NULL, 'Email шаблоны', 'cms', NULL, NULL, 0),
	(21, 'Сообщения', NULL, 'Сообщения', 'cms', NULL, NULL, 0),
	(28, 'Локализация', NULL, 'Локализация', 'cms', NULL, NULL, 0),
	(33, 'Добавить', NULL, 'Добавить', 'cms', NULL, NULL, 0),
	(34, 'Go to Frontend', NULL, 'Перейти на Сайт', 'cms', NULL, NULL, 0),
	(35, 'Logout', NULL, 'Выход', 'cms', NULL, NULL, 0),
	(36, 'dashboard', NULL, 'Приборная панель', 'cms', NULL, NULL, 0),
	(37, 'Профиль', NULL, 'Профиль', 'frontend', NULL, NULL, 0),
	(38, 'Выход', NULL, 'Выход', 'frontend', NULL, NULL, 0),
	(39, 'Админка', NULL, 'Админка', 'frontend', NULL, NULL, 0),
	(40, 'Page List', NULL, 'Список Страниц', 'cms', NULL, NULL, 0),
	(41, 'Name', NULL, 'Название', 'cms', NULL, NULL, 0),
	(42, 'Slug', NULL, 'УРЛ', 'cms', NULL, NULL, 0),
	(43, 'Actions', NULL, 'Действия', 'cms', NULL, NULL, 0),
	(44, 'First page', NULL, 'Первая страница', 'cms', NULL, NULL, 0),
	(45, 'Previous page', NULL, 'Предыдущая страница', 'cms', NULL, NULL, 0),
	(46, 'Next page', NULL, 'Следующая страница', 'cms', NULL, NULL, 0),
	(47, 'Last page', NULL, 'Последняя страница', 'cms', NULL, NULL, 0),
	(48, '[0] no result|[1] 1 result|(1,+Inf] %1% results', NULL, '[0] нет результата[1] 1 результат|(1,+Inf] %1% результата', 'cms', NULL, NULL, 0),
	(49, '(page %%page%%/%%nb_pages%%)', NULL, '(стр.%%page%%/%%nb_pages%%)', 'cms', NULL, NULL, 0),
	(50, 'Edit', NULL, 'Редактировать', 'cms', NULL, NULL, 0),
	(51, 'Delete', NULL, 'Удалить', 'cms', NULL, NULL, 0),
	(52, 'Are you sure?', NULL, 'Вы уверены?', 'cms', NULL, NULL, 0),
	(53, 'Choose an action', NULL, 'Выберите действие', 'cms', NULL, NULL, 0),
	(54, 'go', NULL, 'Вперед!', 'cms', NULL, NULL, 0),
	(55, 'New', NULL, 'Новый', 'cms', NULL, NULL, 0),
	(56, 'Blog Posts', NULL, 'Сообщения в блоге', 'cms', NULL, NULL, 0),
	(57, 'Reset', NULL, 'Сброс', 'cms', NULL, NULL, 0),
	(58, 'Filter', NULL, 'Фильтр', 'cms', NULL, NULL, 0),
	(59, 'No result', NULL, 'Нет результата', 'cms', NULL, NULL, 0),
	(60, 'New Page', NULL, 'Новая страница', 'cms', NULL, NULL, 0),
	(61, 'Content', NULL, 'Содержание', 'cms', NULL, NULL, 0),
	(62, 'Включить редирект', NULL, 'Включить редирект', 'cms', NULL, NULL, 0),
	(63, 'Redirect route', NULL, 'Адрес редиректа', 'cms', NULL, NULL, 0),
	(64, 'Redirect timeout', NULL, 'Тайм-аут редиректа', 'cms', NULL, NULL, 0),
	(65, 'Layout', NULL, 'Планировка', 'cms', NULL, NULL, 0),
	(66, 'Meta title', NULL, 'Мета название', 'cms', NULL, NULL, 0),
	(67, 'Meta description', NULL, 'Мета описание', 'cms', NULL, NULL, 0),
	(68, 'Meta keywords', NULL, 'Мета ключевые слова', 'cms', NULL, NULL, 0),
	(69, 'Back to list', NULL, 'Вернуться к списку', 'cms', NULL, NULL, 0),
	(70, 'Save', NULL, 'Сохранить', 'cms', NULL, NULL, 0),
	(71, 'Save and add', NULL, 'Сохранить и добавить', 'cms', NULL, NULL, 0),
	(72, 'УРЛ-метка', NULL, 'УРЛ-метка', 'cms', NULL, NULL, 0),
	(73, 'Edit Page', NULL, 'Редактировать страницу', 'cms', NULL, NULL, 0),
	(74, 'User list', NULL, 'Список пользователей', 'cms', NULL, NULL, 0),
	(75, 'Created at', NULL, 'Создано в', 'cms', NULL, NULL, 0),
	(76, 'Updated at', NULL, 'Обновлено в', 'cms', NULL, NULL, 0),
	(77, 'Last login', NULL, 'Последнее Войти', 'cms', NULL, NULL, 0),
	(78, 'user', NULL, 'Пользователь', 'cms', NULL, NULL, 0),
	(79, 'New User', NULL, 'Новый пользователь', 'cms', NULL, NULL, 0),
	(80, 'User', NULL, 'Пользователь', 'cms', NULL, NULL, 0),
	(81, 'First name', NULL, 'Имя', 'cms', NULL, NULL, 0),
	(82, 'Last name', NULL, 'Фамилия', 'cms', NULL, NULL, 0),
	(83, 'Email address', NULL, 'Адрес электронной почты', 'cms', NULL, NULL, 0),
	(84, 'Password (again)', NULL, 'Пароль (еще раз)', 'cms', NULL, NULL, 0),
	(85, 'Permissions', NULL, 'Разрешения', 'cms', NULL, NULL, 0),
	(86, 'Is active', NULL, 'Является активным', 'cms', NULL, NULL, 0),
	(87, 'Is super admin', NULL, 'Это супер админ', 'cms', NULL, NULL, 0),
	(88, 'Editing User "%%username%%"', NULL, 'Редактирование "%%username%%"', 'cms', NULL, NULL, 0),
	(89, 'dictionary', NULL, 'Словарь', 'cms', NULL, NULL, 0),
	(90, 'Title', NULL, 'Название', 'cms', NULL, NULL, 0),
	(91, 'Value', NULL, 'Значение', 'cms', NULL, NULL, 0),
	(92, 'settings', NULL, 'Настройки', 'cms', NULL, NULL, 0),
	(93, 'Email template List', NULL, 'Список Email шаблонов', 'cms', NULL, NULL, 0),
	(94, 'Id', NULL, 'ID', 'cms', NULL, NULL, 0),
	(95, 'Subject', NULL, 'Тема', 'cms', NULL, NULL, 0),
	(96, 'Message', NULL, 'Сообщение', 'cms', NULL, NULL, 0),
	(98, 'Edit Email template', NULL, 'Редактировать шаблон Email', 'cms', NULL, NULL, 0),
	(99, 'New Email template', NULL, 'Новый шаблон Email', 'cms', NULL, NULL, 0),
	(100, 'Ваше имя', NULL, 'Ваше имя', 'frontend', NULL, NULL, 0),
	(101, 'Ваш Email', NULL, 'Ваш E-mail', 'frontend', NULL, NULL, 0),
	(102, 'Нужен для обратной связи', NULL, 'Нужен для обратной связи', 'frontend', NULL, NULL, 0),
	(103, 'Ваше сообщение', NULL, 'Ваше сообщение', 'frontend', NULL, NULL, 0),
	(104, 'Reload image', NULL, 'Обновить изображение', 'frontend', NULL, NULL, 0),
	(105, 'Введите код с картинки', NULL, 'Введите код с картинки', 'frontend', NULL, NULL, 0),
	(106, 'Показатели', NULL, 'Показатели', 'cms', NULL, NULL, 0),
	(107, 'Имя', NULL, 'Имя', 'cms', NULL, NULL, 0),
	(108, 'Email', NULL, 'E-mail', 'cms', NULL, NULL, 0),
	(109, 'desc', NULL, 'По убыванию', 'cms', NULL, NULL, 0),
	(110, 'Просмотр', NULL, 'Просмотр', 'cms', NULL, NULL, 0),
	(111, 'Создать пользователя', NULL, 'Создать пользователя', 'cms', NULL, NULL, 0),
	(112, 'Export', NULL, 'Экспорт', 'cms', NULL, NULL, 0),
	(113, 'The item was updated successfully.', NULL, 'Этот пункт был успешно обновлен.', 'cms', NULL, NULL, 0),
	(114, 'Неверный формат', NULL, 'Неверный формат', 'frontend', NULL, NULL, 0),
	(115, 'System settings', NULL, 'Системные настройки', 'cms', NULL, NULL, 0),
	(116, 'Section', NULL, 'Раздел', 'cms', NULL, NULL, 0),
	(118, 'Email error List', NULL, 'Список Email ошибок', 'cms', NULL, NULL, 0),
	(119, 'Email from', NULL, 'От кого', 'cms', NULL, NULL, 0),
	(120, 'Email to', NULL, 'Кому', 'cms', NULL, NULL, 0),
	(121, 'Body', NULL, 'Тело', 'cms', NULL, NULL, 0),
	(122, 'Cc', NULL, 'Копия', 'cms', NULL, NULL, 0),
	(123, 'File', NULL, 'Файл', 'cms', NULL, NULL, 0),
	(132, 'Filters', NULL, 'Фильтр', 'cms', NULL, NULL, 0),
	(133, 'is empty', NULL, 'пусто', 'cms', NULL, NULL, 0),
	(134, 'Мой профиль', NULL, 'Мой профиль', 'frontend', NULL, NULL, 0),
	(135, 'Фотография', NULL, 'Фотография', 'frontend', NULL, NULL, 0),
	(136, 'Изменить пароль', NULL, 'Изменить пароль', 'frontend', NULL, NULL, 0),
	(137, 'Отчество', NULL, 'Отчество', 'frontend', NULL, NULL, 0),
	(138, 'Фамилия', NULL, 'Фамилия', 'frontend', NULL, NULL, 0),
	(139, 'Дата рождения\n(дд.мм.гггг)', NULL, 'Дата рождения', 'frontend', NULL, NULL, 0),
	(140, 'Телефон мобильный\n(для получения уведомлений)', NULL, 'Телефон мобильный\n(для получения уведомлений)', 'frontend', NULL, NULL, 0),
	(141, 'Сохранить изменения', NULL, 'Сохранить изменения', 'frontend', NULL, NULL, 0),
	(142, 'Старый пароль', NULL, 'Старый пароль', 'frontend', NULL, NULL, 0),
	(143, 'Новый пароль', NULL, 'Новый пароль', 'frontend', NULL, NULL, 0),
	(144, 'Новый пароль еще раз', NULL, 'Новый пароль еще раз', 'frontend', NULL, NULL, 0),
	(145, 'Сохранить пароль', NULL, 'Сохранить пароль', 'frontend', NULL, NULL, 0),
	(146, 'Заполните поле', NULL, 'Заполните поле', 'frontend', NULL, NULL, 0),
	(147, 'Passwords do not match', NULL, 'Пароли не совпадают', 'frontend', NULL, NULL, 0),
	(148, 'Выберите картинку из загрузите ее', NULL, 'Выберите картинку и загрузите ее', 'frontend', NULL, NULL, 0),
	(149, 'Image', NULL, 'Картинка', 'frontend', NULL, NULL, 0),
	(150, 'Загрузить фотографию', NULL, 'Загрузить фотографию', 'frontend', NULL, NULL, 0),
	(151, 'File is too large (maximum is %max_size% bytes).', NULL, 'Файл слишком большой(не более %max_size% ).', 'frontend', NULL, NULL, 0),
	(152, 'Вы можете выбрать зону, которая будет отображаться на ваших аватарках. Кликните по одному из изображений справа', NULL, 'Вы можете выбрать зону, которая будет отображаться на ваших изображениях. Кликните по одному из изображений справа', 'frontend', NULL, NULL, 0),
	(153, 'remove the current file', NULL, 'Удалить текущий файл', 'frontend', NULL, NULL, 0),
	(154, 'Сохранить', NULL, 'Сохранить', 'frontend', NULL, NULL, 0),
	(155, 'Вы уверены?', NULL, 'Вы уверены?', 'frontend', NULL, NULL, 0),
	(156, 'Удалить фотографию', NULL, 'Удалить фотографию', 'frontend', NULL, NULL, 0),
	(157, 'Логин (Ваш Email)', NULL, 'Логин (Ваш Email)', 'frontend', NULL, NULL, 0),
	(158, 'Запомнить меня на этом компьютере', NULL, 'Запомнить меня на этом компьютере', 'frontend', NULL, NULL, 0),
	(159, 'Войти', NULL, 'Войти', 'frontend', NULL, NULL, 0),
	(160, 'Забыли пароль?', NULL, 'Забыли пароль?', 'frontend', NULL, NULL, 0),
	(161, 'Registration', NULL, 'Регистрация', 'frontend', NULL, NULL, 0),
	(162, 'The username and/or password is invalid.', NULL, 'Неверный логин или пароль', 'frontend', NULL, NULL, 0),
	(163, 'Введите код', NULL, 'Введите код', 'frontend', NULL, NULL, 0),
	(164, 'Письмо отправлено', NULL, 'Письмо отправлено', 'frontend', NULL, NULL, 0),
	(165, 'Ваш email', NULL, 'Ваш email', 'frontend', NULL, NULL, 0),
	(166, 'Восстановить пароль', NULL, 'Восстановить пароль', 'frontend', NULL, NULL, 0),
	(167, 'Повторите пароль', NULL, 'Повторите пароль', 'frontend', NULL, NULL, 0),
	(168, 'Я принимаю условия', NULL, 'Я принимаю условия', 'frontend', NULL, NULL, 0),
	(169, 'Такой email уже зарегистрирован в ситеме', NULL, 'Такой email уже зарегистрирован в системе', 'frontend', NULL, NULL, 0),
	(170, 'Пароли не совпадают', NULL, 'Пароли не совпадают', 'frontend', NULL, NULL, 0),
	(171, 'Вы должны принять условия пользовательского соглашения', NULL, 'Вы должны принять условия пользовательского соглашения', 'frontend', NULL, NULL, 0),
	(172, 'Пароль должен быть не короче 4 символов', NULL, 'Пароль должен быть не короче 4 символов', 'frontend', NULL, NULL, 0),
	(173, 'Еще раз пароль', NULL, 'Еще раз пароль', 'frontend', NULL, NULL, 0),
	(174, 'Сменить пароль', NULL, 'Сменить пароль', 'frontend', NULL, NULL, 0),
	(175, 'Пароль слишком короткий', NULL, 'Пароль слишком короткий', 'frontend', NULL, NULL, 0),
	(176, 'Пароль восстановлен', NULL, 'Пароль восстановлен', 'frontend', NULL, NULL, 0),
	(177, 'Password is invalid.', NULL, 'Неверный пароль', 'frontend', NULL, NULL, 0),
	(178, 'События за сегодня', NULL, 'События за сегодня', 'cms', NULL, NULL, 0),
	(179, 'Всего событий', NULL, 'Всего событий', 'cms', NULL, NULL, 0),
	(180, 'All rights reserved', NULL, 'Все права защищены', 'cms', NULL, NULL, 0),
	(181, 'Date', NULL, 'Дата', 'cms', NULL, NULL, 0),
	(182, 'Is published', NULL, 'Опубликован', 'cms', NULL, NULL, 0),
	(183, 'yes or no', NULL, 'да или нет', 'cms', NULL, NULL, 0),
	(184, 'yes', NULL, 'да', 'cms', NULL, NULL, 0),
	(185, 'no', NULL, 'нет', 'cms', NULL, NULL, 0),
	(186, 'From', NULL, 'От', 'cms', NULL, NULL, 0),
	(187, 'To', NULL, 'До', 'cms', NULL, NULL, 0),
	(188, 'New Blog post', NULL, 'Новый блог пост', 'cms', NULL, NULL, 0),
	(189, 'Brief', NULL, 'Кратко', 'cms', NULL, NULL, 0),
	(190, 'Text', NULL, 'Текст', 'cms', NULL, NULL, 0),
	(191, 'Url', NULL, 'УРЛ', 'cms', NULL, NULL, 0),
	(193, 'пользовательского соглашения', NULL, 'пользовательского соглашения', 'frontend', NULL, NULL, 0),
	(194, 'The item was created successfully.', NULL, 'Этот пункт был успешно создан.', 'cms', NULL, NULL, 0),
	(195, 'You don\'t have proper credentials to access this page', NULL, 'Вы не имеете надлежащих полномочий на доступ к этой странице', 'cms', NULL, NULL, 0),
	(197, 'Secure', NULL, 'Закрытый раздел', 'cms', NULL, NULL, 0),
	(210, 'Server is not responding', NULL, 'Сервер не отвечает', 'cms', NULL, NULL, 0),
	(211, 'Data saved', NULL, 'Данные сохранены', 'cms', NULL, NULL, 0),
	(212, 'Error while saving data', NULL, 'Ошибка при сохранении данных', 'cms', NULL, NULL, 0),
	(217, 'Unexpected extra form field named "%field%".', NULL, 'Неожиданный дополнительный поля формы с именем "%field%".', 'cms', NULL, NULL, 0),
	(221, 'Вы можете править текст прямо в списке. Исправьте все, что считаете нужным, а затем нажмите TAB или щелкните мышью в любом месте вне поля ввода.', NULL, 'Вы можете править текст прямо в списке. Исправьте все, что считаете нужным, а затем нажмите TAB или щелкните мышью в любом месте вне поля ввода.', 'cms', NULL, NULL, 0),
	(222, 'Воспользуйтесь фильтром, чтобы найти нужный вам текст', NULL, 'Воспользуйтесь фильтром, чтобы найти нужный вам текст', 'cms', NULL, NULL, 0),
	(223, 'Отправить', NULL, 'Отправить', 'frontend', NULL, NULL, 0),
	(224, 'The item has not been saved due to some errors.', NULL, 'Объект не был сохранен из-за некоторых ошибок', 'cms', NULL, NULL, 0),
	(225, 'An object with the same "%column%" already exist.', NULL, 'Объект с таким значением поля "%column%" уже существует в системе.', 'cms', NULL, NULL, 0),
	(226, 'Update', NULL, 'Обновить', 'cms', NULL, NULL, 0),
	(235, 'Страницы', NULL, 'Страницы', 'cms', NULL, NULL, 0),
	(236, 'Пользователи', NULL, 'Пользователи', 'cms', NULL, NULL, 0),
	(237, 'Настройки', NULL, 'Настройки', 'cms', NULL, NULL, 0),
	(238, 'Редирект 301', NULL, 'Редирект 301', 'cms', NULL, NULL, 0),
	(239, 'Уведомления', NULL, 'Уведомления', 'cms', NULL, NULL, 0),
	(241, 'Url from', NULL, 'Откуда', 'cms', NULL, NULL, 0),
	(242, 'Url to', NULL, 'Куда', 'cms', NULL, NULL, 0),
	(243, 'Comment', NULL, 'Описание', 'cms', NULL, NULL, 0),
	(245, 'from %from_date%<br />to %to_date%', NULL, 'с %from_date%по %to_date%', 'cms', NULL, NULL, 0),
	(246, 'Checked', NULL, 'Отмечено', 'cms', NULL, NULL, 0),
	(248, 'You must at least select one item.', NULL, 'Вы должны выбрать хотя бы один объект', 'cms', NULL, NULL, 0),
	(249, 'blog_post', NULL, 'Блог пост', 'cms', NULL, NULL, 0),
	(250, 'Extra', NULL, 'Дополниетльно', 'cms', NULL, NULL, 0),
	(251, 'Edit Blog post', NULL, 'Редактировать блог пост', 'cms', NULL, NULL, 0),
	(252, 'The begin date must be before the end date.', NULL, 'Дата начала должна быть меньше даты окончания', 'cms', NULL, NULL, 0),
	(257, '%%title%%', NULL, '%%title%%', 'cms', NULL, NULL, 0),
	(258, 'Email администратора', NULL, 'Email администратора', 'cms', NULL, NULL, 0),
	(259, 'На этот адрес вам будут приходить сообщения с сайта', NULL, 'На этот адрес вам будут приходить сообщения с сайта', 'cms', NULL, NULL, 0),
	(260, 'Имя отправителя почты', NULL, 'Имя отправителя почты', 'cms', NULL, NULL, 0),
	(261, 'От этого имени сайт будет отправлять почту', NULL, 'От этого имени сайт будет отправлять почту', 'cms', NULL, NULL, 0),
	(263, 'Адрес', NULL, 'Адрес', 'cms', NULL, NULL, 0),
	(264, 'Контактный телефон', NULL, 'Контактный телефон', 'cms', NULL, NULL, 0),
	(265, 'Контактный email', NULL, 'Контактный email', 'cms', NULL, NULL, 0),
	(266, 'Type', NULL, 'Тип', 'cms', NULL, NULL, 0),
	(267, 'Description', NULL, 'Описание', 'cms', NULL, NULL, 0),
	(268, 'Admin email', NULL, 'Письмо администратору', 'cms', NULL, NULL, 0),
	(269, 'User email', NULL, 'Письмо пользователю', 'cms', NULL, NULL, 0),
	(270, 'Phone number', NULL, 'Номер телефона', 'cms', NULL, NULL, 0),
	(271, 'Company name', NULL, 'Название компании', 'cms', NULL, NULL, 0),
	(272, 'Attach', NULL, 'Прикрепленный файл', 'cms', NULL, NULL, 0),
	(275, 'Show', NULL, 'Показать', 'cms', NULL, NULL, 0),
	(279, 'Password recovery', NULL, 'Восстановление пароля', 'cms', NULL, NULL, 0),
	(281, 'Registration', NULL, 'Регистрация', 'cms', NULL, NULL, 0),
	(283, 'Page', NULL, 'Страница', 'cms', NULL, NULL, 0),
	(284, 'Описание', NULL, 'Описание', 'cms', NULL, NULL, 0),
	(285, 'redirect301', NULL, 'Редирект 301', 'cms', NULL, NULL, 0),
	(287, 'email_template', NULL, 'Email шаблоны', 'cms', NULL, NULL, 0),
	(288, 'Имя', NULL, 'Имя', 'frontend', NULL, NULL, 0),
	(289, 'Email', NULL, 'Email', 'frontend', NULL, NULL, 0),
	(290, 'Invalid mime type (%mime_type%).', NULL, 'Неверный формат файла (%mime_type%).', 'frontend', NULL, NULL, 0),
	(291, 'Password', NULL, 'Пароль', 'frontend', NULL, NULL, 0),
	(292, 'Регистрация', NULL, 'Регистрация', 'frontend', NULL, NULL, 0),
	(293, 'ссылке', NULL, 'ссылке', 'frontend', NULL, NULL, 0),
	(295, 'Notifications', NULL, 'Уведомления', 'cms', NULL, NULL, 0),
	(296, 'Pages', NULL, 'Страницы', 'cms', NULL, NULL, 0),
	(297, 'Apply', NULL, 'Применить', 'frontend', NULL, NULL, 0),
	(298, 'Discard', NULL, 'Отменить', 'frontend', NULL, NULL, 0),
	(299, 'Данные сохранены', NULL, 'Данные сохранены', 'frontend', NULL, NULL, 0),
	(301, 'Изображение удалено', NULL, 'Изображение удалено', 'frontend', NULL, NULL, 0),
	(303, 'Код введен неверно', NULL, 'Код введен неверно', 'frontend', NULL, NULL, 0),
	(304, 'Такой email не зарегистрирован в системе', NULL, 'Такой email не зарегистрирован в системе', 'frontend', NULL, NULL, 0),
	(305, ' csrf token', NULL, 'CSRF токен', 'frontend', NULL, NULL, 0),
	(306, 'The item was deleted successfully.', NULL, 'Этот пункт был успешно удален.', 'cms', NULL, NULL, 0),
	(307, 'You must select an action to execute on the selected items.', NULL, 'Вы должны выбрать действие для выполнения на выбранных элементах.', 'cms', NULL, NULL, 0),
	(308, 'The selected items have been deleted successfully.', NULL, 'Выбранные элементы были успешно удалены.', 'cms', NULL, NULL, 0),
	(310, 'Cообщения с сайта', NULL, 'Cообщения с сайта', 'cms', NULL, NULL, 0),
	(311, 'Да, это мой email-аккаунт!', NULL, 'Да, это мой email аккаунт!', 'frontend', NULL, NULL, 0),
	(312, 'Подтвердить email аккаунт!', NULL, 'Подтвердить email аккаунт!', 'frontend', NULL, NULL, 0),
	(313, 'Подтверждаю!', NULL, 'Подтверждаю!', 'frontend', NULL, NULL, 0),
	(314, 'Войти с помощью:', NULL, 'Войти с помощью:', 'frontend', NULL, NULL, 0),
	(315, 'Город', NULL, 'Город', 'frontend', NULL, NULL, 0),
	(316, 'Last login', NULL, 'Last login', 'frontend', NULL, NULL, 0),
	(317, 'На карте', NULL, 'На карте', 'frontend', NULL, NULL, 0),
	(318, 'About', NULL, 'About', 'frontend', NULL, NULL, 0),
	(319, 'Введите адрес', NULL, 'Введите адрес', 'frontend', NULL, NULL, 0),
	(320, 'Найти на карте', NULL, 'Найти на карте', 'frontend', NULL, NULL, 0),
	(321, 'Дата рождения', NULL, 'Дата рождения', 'frontend', NULL, NULL, 0),
	(322, 'Телефон', NULL, 'Телефон', 'frontend', NULL, NULL, 0),
	(323, 'О себе', NULL, 'О себе', 'frontend', NULL, NULL, 0),
	(324, 'Этого пользователя пока нет на карте', NULL, 'Этого пользователя пока нет на карте', 'frontend', NULL, NULL, 0),
	(325, 'Разработчик', NULL, 'Разработчик', 'cms', NULL, NULL, 0),
	(326, 'Системные настройки', NULL, 'Системные настройки', 'cms', NULL, NULL, 0),
	(327, 'Ошибки электронной почты', NULL, 'Ошибки электронной почты', 'cms', NULL, NULL, 0),
	(328, 'Меню', NULL, 'Меню', 'cms', NULL, NULL, 0),
	(329, 'Текстовые блоки', NULL, 'Текстовые блоки', 'cms', NULL, NULL, 0),
	(330, 'Выключить разработчика', NULL, 'Выключить разработчика', 'cms', NULL, NULL, 0),
	(331, 'Тест', NULL, 'Тест', 'cms', NULL, NULL, 0),
	(332, 'Отправка писем', NULL, 'Отправка писем', 'cms', NULL, NULL, 0),
	(333, 'Вики', NULL, 'Вики', 'cms', NULL, NULL, 0),
	(334, 'Сообщение отправлено!', NULL, 'Сообщение отправлено!', 'frontend', NULL, NULL, 0),
	(335, 'Social bridge user confirm email', NULL, 'Social bridge user confirm email', 'cms', NULL, NULL, 0),
	(336, 'Text Blocks', NULL, 'Text Blocks', 'cms', NULL, NULL, 0),
	(337, 'Text block List', NULL, 'Text block List', 'cms', NULL, NULL, 0),
	(338, 'Application', NULL, 'Application', 'cms', NULL, NULL, 0),
	(339, 'Module', NULL, 'Module', 'cms', NULL, NULL, 0),
	(340, 'Special mark', NULL, 'Special mark', 'cms', NULL, NULL, 0),
	(341, 'Is visible for admin', NULL, 'Is visible for admin', 'cms', NULL, NULL, 0),
	(342, 'Это видимый блок', NULL, 'Вот это может править админ, ха', NULL, NULL, 'homepage_text_block', 1),
	(343, 'Edit Text block', NULL, 'Edit Text block', 'cms', NULL, NULL, 0),
	(344, 'Who are you bro?', NULL, 'Who are you bro?', 'cms', NULL, NULL, 0),
	(345, 'Remember me', NULL, 'Remember me', 'cms', NULL, NULL, 0),
	(346, 'The username and/or password is invalid.', NULL, 'The username and/or password is invalid.', 'cms', NULL, NULL, 0),
	(347, 'Required.', NULL, 'Required.', 'cms', NULL, NULL, 0),
	(348, 'Dashboard', NULL, 'Dashboard', 'cms', NULL, NULL, 0),
	(349, 'General', NULL, 'General', 'cms', NULL, NULL, 0),
	(350, 'Howdy, ', NULL, 'Howdy, ', 'cms', NULL, NULL, 0),
	(351, 'I can not belive!', NULL, 'I can not belive!', 'cms', NULL, NULL, 0),
	(352, 'Are you sure want to logout from this awesome system?', NULL, 'Are you sure want to logout from this awesome system?', 'cms', NULL, NULL, 0),
	(353, 'Nope!', NULL, 'Nope!', 'cms', NULL, NULL, 0),
	(354, 'Yeah, I\'m sure', NULL, 'Yeah, I\'m sure', 'cms', NULL, NULL, 0),
	(355, 'asc', NULL, 'asc', 'cms', NULL, NULL, 0),
	(356, 'Close', NULL, 'Close', 'cms', NULL, NULL, 0),
	(357, 'Remove %%object%%?', NULL, 'Remove %%object%%?', 'cms', NULL, NULL, 0),
	(358, 'Homepage text block', NULL, 'Homepage text block', 'cms', NULL, NULL, 0),
	(359, 'Is module page', NULL, 'Is module page', 'cms', NULL, NULL, 0),
	(360, 'Module name', NULL, 'Module name', 'cms', NULL, NULL, 0),
	(361, 'Is content editable', NULL, 'Is content editable', 'cms', NULL, NULL, 0),
	(362, 'Is redirect', NULL, 'Is redirect', 'cms', NULL, NULL, 0),
	(363, 'Добро пожаловать', NULL, 'Welcome', 'frontend', NULL, NULL, 0),
	(364, 'Вилькомна на обновленную версию нашего сайта!', NULL, 'Welcome to our website', 'frontend', NULL, NULL, 0),
	(365, 'auth/signin', NULL, 'auth/signin', 'frontend', NULL, NULL, 0),
	(366, 'Поехали!', NULL, 'Поехали!', 'frontend', NULL, NULL, 0),
	(367, 'Testaurus', NULL, 'Testaurus', 'cms', NULL, NULL, 0),
	(368, 'Testaurus List', NULL, 'Testaurus List', 'cms', NULL, NULL, 0),
	(369, 'Image', NULL, 'Image', 'cms', NULL, NULL, 0),
	(370, 'Attach name', NULL, 'Attach name', 'cms', NULL, NULL, 0),
	(371, 'Attach mime', NULL, 'Attach mime', 'cms', NULL, NULL, 0),
	(372, 'Geo lat', NULL, 'Geo lat', 'cms', NULL, NULL, 0),
	(373, 'Geo lng', NULL, 'Geo lng', 'cms', NULL, NULL, 0),
	(374, 'Geo country', NULL, 'Geo country', 'cms', NULL, NULL, 0),
	(375, 'Geo city', NULL, 'Geo city', 'cms', NULL, NULL, 0),
	(376, 'Geo address', NULL, 'Geo address', 'cms', NULL, NULL, 0),
	(377, 'Geo address formatted', NULL, 'Geo address formatted', 'cms', NULL, NULL, 0),
	(378, 'New Testaurus', NULL, 'New Testaurus', 'cms', NULL, NULL, 0),
	(379, 'remove the current file', NULL, 'remove the current file', 'cms', NULL, NULL, 0),
	(380, 'Gmaps', NULL, 'Gmaps', 'cms', NULL, NULL, 0),
	(381, 'Введите адрес', NULL, 'Type in address', 'cms', NULL, NULL, 0),
	(382, 'Найти на карте', NULL, 'Find in the map', 'cms', NULL, NULL, 0),
	(383, 'Main', NULL, 'Main', 'cms', NULL, NULL, 0),
	(384, 'Attachment', NULL, 'Attachment', 'cms', NULL, NULL, 0),
	(385, 'Meta', NULL, 'Meta', 'cms', NULL, NULL, 0),
	(386, 'Map', NULL, 'Map', 'cms', NULL, NULL, 0),
	(387, 'Edit Testaurus', NULL, 'Edit Testaurus', 'cms', NULL, NULL, 0),
	(388, 'Отменить', NULL, 'Cancel', 'cms', NULL, NULL, 0),
	(389, 'Применить', NULL, 'Apply', 'cms', NULL, NULL, 0);
/*!40000 ALTER TABLE `text_block` ENABLE KEYS */;


-- Dumping structure for table dev_single.todo
CREATE TABLE IF NOT EXISTS `todo` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` text COLLATE utf8_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'open',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table dev_single.todo: ~0 rows (approximately)
/*!40000 ALTER TABLE `todo` DISABLE KEYS */;
/*!40000 ALTER TABLE `todo` ENABLE KEYS */;


-- Dumping structure for table dev_single.wiki
CREATE TABLE IF NOT EXISTS `wiki` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `content` text COLLATE utf8_unicode_ci,
  `sort_order` bigint(20) DEFAULT NULL,
  `is_published` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table dev_single.wiki: ~0 rows (approximately)
/*!40000 ALTER TABLE `wiki` DISABLE KEYS */;
INSERT INTO `wiki` (`id`, `name`, `content`, `sort_order`, `is_published`) VALUES
	(1, 'Зачем нужно Вики?', 'Вики нужно, чтоб его читали<br /><br />Вики нужно, чтоб им наслаждались<br /><br />Вики нужно, чтоб его впитывали', 1, 1);
/*!40000 ALTER TABLE `wiki` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;

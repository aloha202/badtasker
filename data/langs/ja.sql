-- MySQL dump 10.13  Distrib 5.5.25a, for Win32 (x86)
--
-- Host: localhost    Database: dev2
-- ------------------------------------------------------
-- Server version	5.5.25a

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `app_error`
--

DROP TABLE IF EXISTS `app_error`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_error` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `description` text,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_error`
--

LOCK TABLES `app_error` WRITE;
/*!40000 ALTER TABLE `app_error` DISABLE KEYS */;
INSERT INTO `app_error` (`id`, `description`, `created_at`, `updated_at`) VALUES (1,'Unknown site event {user_created_by_admin}','2013-09-14 14:51:56','2013-09-14 14:51:56'),(2,'Unknown site event {password_recovery_request}','2013-09-16 15:53:48','2013-09-16 15:53:48'),(3,'Unknown site event {password_recovery_request}','2014-10-26 21:42:16','2014-10-26 21:42:16'),(4,'Unknown site event {password_recovery_request}','2014-10-26 21:59:48','2014-10-26 21:59:48'),(5,'Unknown site event {password_recovery_request}','2014-10-26 22:01:26','2014-10-26 22:01:26');
/*!40000 ALTER TABLE `app_error` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `banned_ip`
--

DROP TABLE IF EXISTS `banned_ip`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `banned_ip` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ip` varchar(15) NOT NULL,
  `reason` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `banned_ip`
--

LOCK TABLES `banned_ip` WRITE;
/*!40000 ALTER TABLE `banned_ip` DISABLE KEYS */;
INSERT INTO `banned_ip` (`id`, `ip`, `reason`, `created_at`, `updated_at`) VALUES (1,'192.168.1.3','Invalid signin attempt','2014-10-27 01:49:16','2014-10-27 01:49:16'),(2,'192.168.1.3','Invalid signin attempt','2014-10-27 14:12:40','2014-10-27 14:12:40'),(3,'192.168.1.3','Invalid signin attempt','2014-10-28 07:40:59','2014-10-28 07:40:59');
/*!40000 ALTER TABLE `banned_ip` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_post`
--

DROP TABLE IF EXISTS `blog_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blog_post` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `date` date NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `brief` text,
  `extra` text,
  `text` longtext,
  `is_published` tinyint(1) DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `meta_title` varchar(255) DEFAULT NULL,
  `meta_description` varchar(255) DEFAULT NULL,
  `meta_keywords` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `blog_post_sluggable_idx` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_post`
--

LOCK TABLES `blog_post` WRITE;
/*!40000 ALTER TABLE `blog_post` DISABLE KEYS */;
/*!40000 ALTER TABLE `blog_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_post2_blog_tag`
--

DROP TABLE IF EXISTS `blog_post2_blog_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blog_post2_blog_tag` (
  `blog_post_id` bigint(20) NOT NULL DEFAULT '0',
  `blog_tag_id` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`blog_post_id`,`blog_tag_id`),
  KEY `blog_post2_blog_tag_blog_tag_id_blog_tag_id` (`blog_tag_id`),
  CONSTRAINT `blog_post2_blog_tag_blog_post_id_blog_post_id` FOREIGN KEY (`blog_post_id`) REFERENCES `blog_post` (`id`) ON DELETE CASCADE,
  CONSTRAINT `blog_post2_blog_tag_blog_tag_id_blog_tag_id` FOREIGN KEY (`blog_tag_id`) REFERENCES `blog_tag` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_post2_blog_tag`
--

LOCK TABLES `blog_post2_blog_tag` WRITE;
/*!40000 ALTER TABLE `blog_post2_blog_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `blog_post2_blog_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_post_comment`
--

DROP TABLE IF EXISTS `blog_post_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blog_post_comment` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `blog_post_id` bigint(20) NOT NULL,
  `username` varchar(255) NOT NULL,
  `comment` text,
  `is_published` tinyint(1) DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `blog_post_id_idx` (`blog_post_id`),
  CONSTRAINT `blog_post_comment_blog_post_id_blog_post_id` FOREIGN KEY (`blog_post_id`) REFERENCES `blog_post` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_post_comment`
--

LOCK TABLES `blog_post_comment` WRITE;
/*!40000 ALTER TABLE `blog_post_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `blog_post_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_tag`
--

DROP TABLE IF EXISTS `blog_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blog_tag` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_tag`
--

LOCK TABLES `blog_tag` WRITE;
/*!40000 ALTER TABLE `blog_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `blog_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_language`
--

DROP TABLE IF EXISTS `cms_language`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_language` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(5) NOT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_language`
--

LOCK TABLES `cms_language` WRITE;
/*!40000 ALTER TABLE `cms_language` DISABLE KEYS */;
INSERT INTO `cms_language` (`id`, `name`, `is_active`) VALUES (1,'en',1),(2,'ru',1),(3,'de',0);
/*!40000 ALTER TABLE `cms_language` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_module`
--

DROP TABLE IF EXISTS `cms_module`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_module` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `model` varchar(255) DEFAULT NULL,
  `model_sitemap_callback` varchar(255) DEFAULT NULL,
  `show_route` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_module`
--

LOCK TABLES `cms_module` WRITE;
/*!40000 ALTER TABLE `cms_module` DISABLE KEYS */;
INSERT INTO `cms_module` (`id`, `name`, `is_active`, `model`, `model_sitemap_callback`, `show_route`) VALUES (1,'default',1,NULL,NULL,NULL),(2,'contactus',1,NULL,NULL,NULL),(3,'auth',1,NULL,NULL,NULL),(4,'register',1,NULL,NULL,NULL),(5,'sitemap',1,NULL,NULL,NULL),(6,'news',1,'News',NULL,NULL),(7,'profile',1,NULL,NULL,NULL),(8,'usage',1,'Usage',NULL,'usage_show');
/*!40000 ALTER TABLE `cms_module` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_runtime_error`
--

DROP TABLE IF EXISTS `cms_runtime_error`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_runtime_error` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `description` text,
  `url` text,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_runtime_error`
--

LOCK TABLES `cms_runtime_error` WRITE;
/*!40000 ALTER TABLE `cms_runtime_error` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_runtime_error` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `config`
--

DROP TABLE IF EXISTS `config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `value` text,
  `section` varchar(255) DEFAULT 'settings',
  `type` varchar(255) DEFAULT 'text',
  `type_enum_values` text,
  `use_wysiwyg` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `config`
--

LOCK TABLES `config` WRITE;
/*!40000 ALTER TABLE `config` DISABLE KEYS */;
INSERT INTO `config` (`id`, `name`, `title`, `value`, `section`, `type`, `type_enum_values`, `use_wysiwyg`) VALUES (1,'menu_create_page','Создавать страницы при создании пунктов меню','0','settings','text',NULL,0),(2,'administrator_email','Administrator email','admin@dev2.web375-testing.org','settings','text',NULL,0),(3,'smtp_server','Smtp server','smtp.yandex.ru','system','text',NULL,0),(4,'smtp_port','Smtp port','465','system','text',NULL,0),(5,'smtp_mailbox','Smpt mailbox','noreply@dev2.web375-testing.org','system','text',NULL,0),(6,'smtp_password','Smtp password','password','system','text',NULL,0),(7,'smtp_display_name','Smpt display name','DEV2, Администрация','settings','text',NULL,0),(8,'oauth_enabled_providers','Oauth enabled providers','facebook, vkontakte, google, yandex, mailru, twitter','system','text',NULL,0),(9,'49c7822fc397aa7516f60c008e317a4f','','Вы должны принять условия пользовательского соглашения','hash','text',NULL,0),(10,'auth_signin_after_register','Auth sign in after register','no','system','text',NULL,0),(11,'auth_password_recovery_hash_lifetime','auth_password_recovery_hash_lifetime','1 DAY','system','text',NULL,0),(12,'ip_ban_lifetime','ip_ban_lifetime','1 HOUR','system','text',NULL,0),(13,'auth_invalid_signin_attempt_captcha','auth_invalid_signin_attempt_captcha','3','system','text',NULL,0),(14,'auth_invalid_signin_attempt_ipban','auth_invalid_signin_attempt_captcha','5','system','text',NULL,0),(15,'project_name','Project name','dev2','system','text',NULL,0),(16,'project_code','Project code','dev2','system','text',NULL,0),(17,'project_lang','Language','ja','system','text',NULL,0);
/*!40000 ALTER TABLE `config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `default_image`
--

DROP TABLE IF EXISTS `default_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `default_image` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `image` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `default_image`
--

LOCK TABLES `default_image` WRITE;
/*!40000 ALTER TABLE `default_image` DISABLE KEYS */;
INSERT INTO `default_image` (`id`, `name`, `title`, `image`) VALUES (1,'1','1','35323182a3a81319d8f666f8668e22129fbd1cd6.jpg');
/*!40000 ALTER TABLE `default_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_error`
--

DROP TABLE IF EXISTS `email_error`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `email_error` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `email_from` varchar(255) DEFAULT NULL,
  `email_to` varchar(255) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `body` text,
  `cc` varchar(255) DEFAULT NULL,
  `file` varchar(255) DEFAULT NULL,
  `errmes` text,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_error`
--

LOCK TABLES `email_error` WRITE;
/*!40000 ALTER TABLE `email_error` DISABLE KEYS */;
INSERT INTO `email_error` (`id`, `email_from`, `email_to`, `subject`, `body`, `cc`, `file`, `errmes`, `created_at`, `updated_at`) VALUES (1,'','alexey.radyuk@gmail.com','TEST','TEST','','','Address in mailbox given [] does not comply with RFC 2822, 3.6.2.','2014-10-24 22:05:00','2014-10-24 22:05:00'),(2,'','alexey.radyuk@gmail.com','test','test','','','Address in mailbox given [] does not comply with RFC 2822, 3.6.2.','2014-10-24 22:08:29','2014-10-24 22:08:29'),(3,'','alexey.radyuk@gmail.com','test','test','','','Address in mailbox given [] does not comply with RFC 2822, 3.6.2.','2014-10-24 22:09:42','2014-10-24 22:09:42'),(4,'','alexey.radyuk@gmail.com','test','test','','','Address in mailbox given [] does not comply with RFC 2822, 3.6.2.','2014-10-24 22:15:23','2014-10-24 22:15:23');
/*!40000 ALTER TABLE `email_error` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_template`
--

DROP TABLE IF EXISTS `email_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `email_template` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `message` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_template`
--

LOCK TABLES `email_template` WRITE;
/*!40000 ALTER TABLE `email_template` DISABLE KEYS */;
INSERT INTO `email_template` (`id`, `name`, `subject`, `message`) VALUES (1,'registration_user','プロジェクトに登録DEV2','こんにちは、{％のFIRST_NAMEの％}！あなたが正常に登録されました！あなたのアカウントをアクティブにする、{％リンク％}に行く！'),(2,'registration_admin','新しいアカウントを登録','チェックインしたユーザーの{％FULL_NAMEの％}'),(3,'password_recovery_user','パスワードの復元','良い日には、{％のFULL_NAMEの％}あなたは、このメッセージを無視しないでparolya.Esli送信され、新しい要求を設定する{％リンク％}によるパスワードvocstanovlenieオンラインDev2.Pereyditeを要求した。'),(4,'contactus_message_user','プロジェクトDEV2。あなたのメッセージは私達にとって重要である！','親愛なる{％名％}！あなたのメッセージをありがとう！それは私達にとって非常に重要である！'),(5,'contactus_message_admin','プロジェクトDEV2。新しいメッセージ','誰か{％名％}はメッセージを送った。テキスト：{％メッセージ％} Eメール：{％電子メール％}');
/*!40000 ALTER TABLE `email_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `forgot_password`
--

DROP TABLE IF EXISTS `forgot_password`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `forgot_password` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `email` varchar(255) NOT NULL,
  `hash` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id_idx` (`user_id`),
  CONSTRAINT `forgot_password_user_id_sf_guard_user_id` FOREIGN KEY (`user_id`) REFERENCES `sf_guard_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forgot_password`
--

LOCK TABLES `forgot_password` WRITE;
/*!40000 ALTER TABLE `forgot_password` DISABLE KEYS */;
INSERT INTO `forgot_password` (`id`, `user_id`, `email`, `hash`, `created_at`, `updated_at`) VALUES (1,1,'admin@admin.com','433784111093d4aea183b4c0dfb7d4ca','2013-09-16 15:53:48','2013-09-16 15:53:48'),(2,3,'alex@web375.org','edd3ffac0916ffc630f8df688b194326','2014-10-26 21:42:16','2014-10-26 21:42:16'),(3,4,'alexey.radyuk@gmail.com','3f79640997ec44a921e971c8165e01ae','2014-10-26 21:59:48','2014-10-26 21:59:48'),(4,4,'alexey.radyuk@gmail.com','c31bbfe147f913cf886e1c29e3a31946','2014-10-26 22:01:25','2014-10-26 22:01:25'),(5,3,'alex@web375.org','fa141339dc6c236226e38b7da8c757de','2014-10-26 22:03:51','2014-10-26 22:03:51'),(6,3,'alex@web375.org','2879349a5fe9f6c9f50a24516f1414bc','2014-10-26 22:04:57','2014-10-26 22:04:57'),(7,4,'alexey.radyuk@gmail.com','6d69f27340c058e7d903fb111eef5fff','2014-10-26 22:27:39','2014-10-26 22:27:39'),(8,4,'alexey.radyuk@gmail.com','f527c27649724459da3214e70cb35e44','2014-10-28 11:10:21','2014-10-28 11:10:21'),(9,4,'alexey.radyuk@gmail.com','a1ddd7696b96008abc207a575e1aec04','2014-10-28 11:11:15','2014-10-28 11:11:15'),(10,4,'alexey.radyuk@gmail.com','03db59ac4a474eb1d6528a5c09586935','2014-10-28 14:57:27','2014-10-28 14:57:27');
/*!40000 ALTER TABLE `forgot_password` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `localization`
--

DROP TABLE IF EXISTS `localization`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `localization` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `model` varchar(64) NOT NULL,
  `pk` bigint(20) NOT NULL,
  `field` varchar(64) NOT NULL,
  `ru` text,
  `en` text,
  `de` text,
  `es` text,
  `ja` text,
  PRIMARY KEY (`id`),
  KEY `main_idx` (`model`,`pk`,`field`)
) ENGINE=InnoDB AUTO_INCREMENT=364 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `localization`
--

LOCK TABLES `localization` WRITE;
/*!40000 ALTER TABLE `localization` DISABLE KEYS */;
INSERT INTO `localization` (`id`, `model`, `pk`, `field`, `ru`, `en`, `de`, `es`, `ja`) VALUES (1,'Page',1,'name','Добро пожаловать!','Welcome!','Herzlich Willkommen!','Bienvenido!','ようこそ！'),(2,'Page',1,'content','Привет тебе, юный друг! Ты попал на этот сайт, потому что тебе самому нужен сайт. А может быть, ты просто зашел сюда случайно! В любом случае, добро пожаловать!','Greetings to you, young friend! You came to this site because you yourself need a website. Or maybe you just came here by accident! In any case, welcome!','Grüße an Sie, junger Freund! Sie kam auf diese Seite, weil Sie sich eine Website benötigen. Oder vielleicht sind Sie gerade hierher gekommen durch Zufall! Auf jeden Fall willkommen!','Saludos a usted, joven amigo! Usted vino a este sitio porque tienes a ti mismo necesita un sitio web. O tal vez usted acaba de venir aquí por accidente! En cualquier caso, bienvenido!','あなたにご挨拶、若い友人！あなた自身がウェブサイトを必要とする、あなたので、このサイトに来た。それとも、単に偶然ここに来た！いずれの場合においても、大歓迎！'),(3,'Page',1,'meta_title','Добро пожаловать на сайт проекта DEV2!','Welcome to the website of the project DEV2!','Willkommen auf der Webseite des Projekts DEV2!','Bienvenido a la página web de la DEV2 proyecto!','プロジェクトDEV2のウェブサイトへようこそ！'),(4,'Page',1,'meta_description',NULL,NULL,NULL,NULL,NULL),(5,'Page',1,'meta_keywords',NULL,NULL,NULL,NULL,NULL),(6,'Page',2,'name','О нас','About Us','Über uns','Sobre nosotros','我々について'),(7,'Page',2,'content','Мы молодая, но уже очень опытная компания, занимающаяся разработкой и продвижением веб-сайтов','We are a young but already very experienced company engaged in the development and promotion of web sites','Wir sind ein junges, aber bereits sehr erfahrenes Unternehmen in der Entwicklung und Förderung von Web-Seiten engagiert','Somos una empresa joven, pero ya con mucha experiencia dedicada al desarrollo y promoción de sitios web','私たちは、ウェブサイトの開発と促進に取り組んで非常に経験豊富すでに若い会社ですが、'),(8,'Page',2,'meta_title','О проекте','About the project','Über das Projekt','Sobre el proyecto','プロジェクトについて'),(9,'Page',2,'meta_description',NULL,NULL,NULL,NULL,NULL),(10,'Page',2,'meta_keywords',NULL,NULL,NULL,NULL,NULL),(11,'Page',3,'name','Обратная связь','Feedback','Rückkopplung','Realimentación','フィードバック'),(12,'Page',3,'content','Отправьте нам сообщение и мы свяжемся с Вами как можно быстрее!','Send us a message and we will contact you as soon as possible!','Senden Sie uns eine Nachricht und wir werden uns so schnell wie möglich kontaktieren!','Envíenos un mensaje y nos pondremos en contacto con usted lo antes posible!','私達にメッセージを送信し、我々はできるだけ早くご連絡させていただきます！'),(13,'Page',3,'meta_title','Обратная связь - Проект DEV2','Contact Us - Project DEV2','Kontakt - Projekt DEV2','Contáctenos - Proyecto DEV2','お問い合わせ - プロジェクトDEV2を'),(14,'Page',3,'meta_description',NULL,NULL,NULL,NULL,NULL),(15,'Page',3,'meta_keywords',NULL,NULL,NULL,NULL,NULL),(16,'Page',4,'name','Регистрация','Registration','Anmeldung','Registro','登録'),(17,'Page',4,'content',NULL,NULL,NULL,NULL,NULL),(18,'Page',4,'meta_title','Регистрация','Registration','Anmeldung','Registro','登録'),(19,'Page',4,'meta_description',NULL,NULL,NULL,NULL,NULL),(20,'Page',4,'meta_keywords',NULL,NULL,NULL,NULL,NULL),(21,'Page',5,'name','Восстановление пароля','Password recovery','Passwort-Wiederherstellung','Recuperar la contraseña','パスワードの復元'),(22,'Page',5,'content','Нажмите кнопку \"Восстановить пароль\" и на указанный Вами при регистрации адрес электронной почты придет ссылка на восстановление пароля. ','Click \"Recover Password\" and we\'ll send you an email that will link to the password recovery.','Klicken Sie auf \"Passwort wiederherstellen\" und Sie bei der Registrierung per E-Mail angegeben werden der Passwort-Wiederherstellung zu verknüpfen.','Haz clic en \"Recuperar Contraseña\" y especificó durante el registro de correo electrónico unirá a la recuperación de la contraseña.','「パスワードを回復」をクリックし、私たちはあなたにパスワード回復にリンクしますメールをお送りします。'),(23,'Page',5,'meta_title','Восстановление пароля','Password recovery','Passwort-Wiederherstellung','Recuperar la contraseña','パスワードの復元'),(24,'Page',5,'meta_description',NULL,NULL,NULL,NULL,NULL),(25,'Page',5,'meta_keywords',NULL,NULL,NULL,NULL,NULL),(26,'Page',6,'name','Восстановление пароля. Выслано письмо.','Password recovery. Email sent.','Passwort-Wiederherstellung. E-Mail gesendet.','Recuperación de la contraseña. Correo electrónico enviado.','パスワード回復。メールは送信しました。'),(27,'Page',6,'content','На указанный вами Email-адрес выслано письмо.','An email has been sent to your email-address','Eine E-Mail wurde an Ihre E-Mail-Adresse gesendet wurde,','Un correo electrónico ha sido enviado a su correo electrónico, dirección','電子メールはあなたの電子メールアドレスに送信されました'),(28,'Page',6,'meta_title','Восстановление пароля. Выслано письмо.','Password recovery. Email sent.','Passwort-Wiederherstellung. E-Mail gesendet.','Recuperación de la contraseña. Correo electrónico enviado.','パスワード回復。メールは送信しました。'),(29,'Page',6,'meta_description',NULL,NULL,NULL,NULL,NULL),(30,'Page',6,'meta_keywords',NULL,NULL,NULL,NULL,NULL),(31,'Page',7,'name','Восстановление пароля. Отправлено СМС','Password recovery. sent SMS','Passwort-Wiederherstellung. gesendeten SMS','Recuperación de la contraseña. SMS enviado','パスワード回復。送信されたSMS'),(32,'Page',7,'content',NULL,NULL,NULL,NULL,NULL),(33,'Page',7,'meta_title','Восстановление пароля. Отправлено СМС','Password recovery. sent SMS','Passwort-Wiederherstellung. gesendeten SMS','Recuperación de la contraseña. SMS enviado','パスワード回復。送信されたSMS'),(34,'Page',7,'meta_description',NULL,NULL,NULL,NULL,NULL),(35,'Page',7,'meta_keywords',NULL,NULL,NULL,NULL,NULL),(36,'Page',8,'name','Придумайте новый пароль','Invent a new password','Erfinde ein neues Passwort','Inventar una nueva contraseña','新しいパスワードを発明'),(37,'Page',8,'content',NULL,NULL,NULL,NULL,NULL),(38,'Page',8,'meta_title','Придумайте новый пароль','Invent a new password','Erfinde ein neues Passwort','Inventar una nueva contraseña','新しいパスワードを発明'),(39,'Page',8,'meta_description',NULL,NULL,NULL,NULL,NULL),(40,'Page',8,'meta_keywords',NULL,NULL,NULL,NULL,NULL),(41,'Page',9,'name','Вход в личный кабинет','Your Personal Area','Ihr persönlicher Bereich','Su área personal','あなたのパーソナルエリア'),(42,'Page',9,'content',NULL,NULL,NULL,NULL,NULL),(43,'Page',9,'meta_title','Вход в личный кабинет','Your Personal Area','Ihr persönlicher Bereich','Su área personal','あなたのパーソナルエリア'),(44,'Page',9,'meta_description',NULL,NULL,NULL,NULL,NULL),(45,'Page',9,'meta_keywords',NULL,NULL,NULL,NULL,NULL),(46,'Page',10,'name','Регистрация пройдена','Registration is complete!','Die Registrierung ist komplett!','La inscripción está completa!','登録が完了です！'),(47,'Page',10,'content','На указанный Вами email-адрес выслано письмо с инструкцией регистрации','We sent you an email to your email-address. Please, follow the instructions in it to complete registration','Wir schickten Sie eine E-Mail an Ihre E-Mail-Adresse ein. Bitte folgen Sie den Anweisungen in ihr die Eintragung abgeschlossen','Le enviamos un correo electrónico a su dirección de correo electrónico. Por favor, siga las instrucciones en él para completar el registro','私たちはあなたの電子メールアドレスにあなたにメールを送った。 、それが登録を完了するための指示に従ってください。'),(48,'Page',10,'meta_title','Регистрация пройдена','Registration is complete!','Die Registrierung ist komplett!','La inscripción está completa!','登録が完了です！'),(49,'Page',10,'meta_description',NULL,NULL,NULL,NULL,NULL),(50,'Page',10,'meta_keywords',NULL,NULL,NULL,NULL,NULL),(51,'Page',11,'name','Активация пройдена','Activation is complete!','Die Aktivierung ist abgeschlossen!','La activación está completo!','アクティベーションは完了です！'),(52,'Page',11,'content','Теперь вы можете войти в Личный кабинет!','Now you can login!','Jetzt können Sie sich einloggen!','Ahora puede iniciar sesión!','今、あなたは、ログインすることができます！'),(53,'Page',11,'meta_title','Активация пройдена','Activation is complete!','Die Aktivierung ist abgeschlossen!','La activación está completo!','アクティベーションは完了です！'),(54,'Page',11,'meta_description',NULL,NULL,NULL,NULL,NULL),(55,'Page',11,'meta_keywords',NULL,NULL,NULL,NULL,NULL),(56,'Page',12,'name','Пользовательское соглашение','User Agreement','Benutzervereinbarung','Acuerdo del usuario','ユーザー規約'),(57,'Page',12,'content','Здесь абсолютно типичное пользовательское соглашение','Here is absolutely typical user agreement','Es gibt absolut typischen Anwenderabkommen','Existe un acuerdo de usuario absolutamente típico','ここでは絶対的に一般的なユーザー契約がある'),(58,'Page',12,'meta_title','Пользовательское соглашение','User Agreement','Benutzervereinbarung','Acuerdo del usuario','ユーザー規約'),(59,'Page',12,'meta_description',NULL,NULL,NULL,NULL,NULL),(60,'Page',12,'meta_keywords',NULL,NULL,NULL,NULL,NULL),(61,'Page',13,'name','Политика конфиденциальности','Privacy policy','Datenschutz-Bestimmungen','Política de privacidad','個人情報保護方針'),(62,'Page',13,'content','Здесь абсолютно типичная страница про политику конфиденциальности','Here is absolutely typical page about privacy policy','Es ist absolut typisch Seite über Datenschutzbestimmungen','No es absolutamente típica página sobre política de privacidad','ここでは、プライバシーポリシーに関する一切の典型的なページです'),(63,'Page',13,'meta_title','Политика конфиденциальности','Privacy policy','Datenschutz-Bestimmungen','Política de privacidad','個人情報保護方針'),(64,'Page',13,'meta_description',NULL,NULL,NULL,NULL,NULL),(65,'Page',13,'meta_keywords',NULL,NULL,NULL,NULL,NULL),(66,'Page',14,'name','Закрытый раздел','A Closed Forum','Forum geschlossen','Un Foro Cerrado','クローズドフォーラム'),(67,'Page',14,'content','Если вы зашли на эту страницу, значит вы авторизованный пользователь!','If you come across this page, it means you are an authorized user!','Wenn Sie über diese Seite kommen, bedeutet das, Sie ein autorisierter Benutzer sind!','Si usted viene a través de esta página, significa que usted es un usuario autorizado!','あなたがこのページに遭遇した場合、それはあなたが許可されたユーザであることを意味します！'),(68,'Page',14,'meta_title','Закрытый раздел','A Closed Forum','Forum geschlossen','Un Foro Cerrado','クローズドフォーラム'),(69,'Page',14,'meta_description',NULL,NULL,NULL,NULL,NULL),(70,'Page',14,'meta_keywords',NULL,NULL,NULL,NULL,NULL),(71,'Page',15,'name','Это тестовая страница','This is a test page','Dies ist eine Testseite','Esta es una página de prueba','これはテストページです'),(72,'Page',15,'content',NULL,NULL,NULL,NULL,NULL),(73,'Page',15,'meta_title','Это тестовая страница','This is a test page','Dies ist eine Testseite','Esta es una página de prueba','これはテストページです'),(74,'Page',15,'meta_description',NULL,NULL,NULL,NULL,NULL),(75,'Page',15,'meta_keywords',NULL,NULL,NULL,NULL,NULL),(76,'Page',16,'name','Ошибка 404','Error 404','Error 404','Error 404','エラー404'),(77,'Page',16,'content','Ошибка 404. Страница не найдена','Error 404. Page not found','Fehler 404 Seite nicht gefunden','Error 404. Página no encontrada','エラー404ページが見つかりません'),(78,'Page',16,'meta_title','Ошибка 404','Error 404','Error 404','Error 404','エラー404'),(79,'Page',16,'meta_description',NULL,NULL,NULL,NULL,NULL),(80,'Page',16,'meta_keywords',NULL,NULL,NULL,NULL,NULL),(81,'Page',17,'name','Мой профиль','My Profile','Mein Profil','Mi Perfil','マイプロフィール'),(82,'Page',17,'content','Здесь вы можете отредактировать Ваши личные данные, загрузить фотографию и поменять пароль','Here you can edit your personal information, upload a photo and to change the password','Hier können Sie Ihre persönlichen Daten zu bearbeiten, ein Foto hochladen und das Passwort ändern','Aquí puede editar su información personal, subir una foto y para cambiar la contraseña','ここでは、あなたの個人情報を編集写真をアップロードし、パスワードを変更することができます'),(83,'Page',17,'meta_title','Мой профиль','My Profile','Mein Profil','Mi Perfil','マイプロフィール'),(84,'Page',17,'meta_description',NULL,NULL,NULL,NULL,NULL),(85,'Page',17,'meta_keywords',NULL,NULL,NULL,NULL,NULL),(86,'Page',18,'name','Мой профиль - Изменить пароль','My profile - Change password','Mein Profil - Passwort ändern','Mi perfil - Cambiar mi contraseña','マイプロフィール - パスワード変更'),(87,'Page',18,'content','Мы храним Ваш пароль в зашифрованном виде. Кроме Вас его не знает никто','We store your password in encrypted form. You are the only one who knows it','Wir speichern Ihr Passwort in verschlüsselter Form. Sie sind der einzige, der es weiß,','Almacenamos su contraseña en forma encriptada. Usted es el único que lo sabe','私たちは、暗号化された形式でパスワードを格納します。あなたはそれを知っている唯一の一つです'),(88,'Page',18,'meta_title','Мой профиль - Изменить пароль','My profile - Change password','Mein Profil - Passwort ändern','Mi perfil - Cambiar mi contraseña','マイプロフィール - パスワード変更'),(89,'Page',18,'meta_description',NULL,NULL,NULL,NULL,NULL),(90,'Page',18,'meta_keywords',NULL,NULL,NULL,NULL,NULL),(91,'Page',19,'name','Мой профиль - Изменить фотографию','My profile - Edit photo','Mein Profil - Edit Foto','Mi perfil - Editar foto','マイプロフィール - 編集フォト'),(92,'Page',19,'content',NULL,NULL,NULL,NULL,NULL),(93,'Page',19,'meta_title','Мой профиль - Изменить фотографию','My profile - Edit photo','Mein Profil - Edit Foto','Mi perfil - Editar foto','マイプロフィール - 編集フォト'),(94,'Page',19,'meta_description',NULL,NULL,NULL,NULL,NULL),(95,'Page',19,'meta_keywords',NULL,NULL,NULL,NULL,NULL),(96,'Page',20,'name','IP-адресс заблокирован','IP-address is blocked','IP-Adresse blockiert wird','Dirección IP está bloqueada','IPアドレスがブロックされている'),(97,'Page',20,'content','К сожалению, по неясным причинам ваш адрес был заблокирован! Спасибо!','Unfortunately, for unclear reasons, your address has been blocked! Thank you!','Leider unklaren Gründen, Ihre Adresse wurde gesperrt! Danke!','Lamentablemente, por razones poco claras, su dirección ha sido bloqueado! Gracias!','残念ながら、不明な理由のために、あなたのアドレスがブロックされました！ありがとうございます！'),(98,'Page',20,'meta_title','IP-адресс заблокирован','IP-address is blocked','IP-Adresse blockiert wird','Dirección IP está bloqueada','IPアドレスがブロックされている'),(99,'Page',20,'meta_description',NULL,NULL,NULL,NULL,NULL),(100,'Page',20,'meta_keywords',NULL,NULL,NULL,NULL,NULL),(101,'Page',21,'name','Необходима авторизация','Please register or login','Bitte registrieren oder einloggen','Por favor, registrarse o','登録またはログインしてください'),(102,'Page',21,'content','Чтобы посмотреть содержимое этого раздела, необходимо авторизоваться','To see the contents of this section, please log in','Um den Inhalt dieses Abschnitts sehen, bitte melden Sie sich an','Para ver el contenido de esta sección, por favor conectarse','このセクションの内容を表示するには、ログインしてください'),(103,'Page',21,'meta_title','Необходима авторизация','Please register or login','Bitte registrieren oder einloggen','Por favor, registrarse o','登録またはログインしてください'),(104,'Page',21,'meta_description',NULL,NULL,NULL,NULL,NULL),(105,'Page',21,'meta_keywords',NULL,NULL,NULL,NULL,NULL),(106,'TextBlock',1,'text','Имя пользователя','Username','Benutzername','Nombre de usuario','ユーザー名'),(107,'TextBlock',2,'text','Пароль','Password','Kennwort','Contraseña','パスワード'),(108,'TextBlock',3,'text','Запомнить?','Remember Me?','Mich erinnern?','Acuérdate de mí?','私を覚えていますか？'),(109,'TextBlock',4,'text','Войти','Login','Login','Login','ログイン'),(110,'TextBlock',5,'text','Добро пожаловать','Welcome','Willkommen','Bienvenida','歓迎'),(111,'TextBlock',6,'text','Используйте правильное имя пользователя и пароль, чтобы получить доступ к консоли администрирования.','Use a valid username and password to gain access to the administration console.','Verwenden Sie einen gültigen Benutzernamen und Kennwort ein, um Zugriff auf die Administrationskonsole zu gewinnen.','Utilice un nombre de usuario y una contraseña válidos para acceder a la consola de administración.','管理コンソールへのアクセスを得るために有効なユーザ名とパスワードを使用してください。'),(112,'TextBlock',7,'text','Войти','Login','Login','Login','ログイン'),(113,'TextBlock',8,'text','Ваша компания','Your Company','Deine Firma','Su Empresa','あなたの会社'),(114,'TextBlock',9,'text','Разработка и поддержка','Development and support','Entwicklung und Begleitung','Desarrollo y apoyo','開発とサポート'),(115,'TextBlock',10,'text','Страницы','Page','Seite','Página','ページ'),(116,'TextBlock',11,'text','Блог','Blog','Blog','Blog','ブログ'),(117,'TextBlock',12,'text','Сообщения','Messages','Nachrichten','Mensajes','メッセージ'),(118,'TextBlock',13,'text','Комментарии','Comments','Kommentare','Comentarios','注釈'),(119,'TextBlock',14,'text','Метки','Tags','Schlagwörter','Etiquetas','タグ'),(120,'TextBlock',15,'text','Пользователи','Users','Benutzer','Usuarios','ユーザーが'),(121,'TextBlock',16,'text','Настройки','Settings','Einstellungen','Ajustes','[設定]'),(122,'TextBlock',17,'text','Словарь','Dictionary','Wörterbuch','Diccionario','辞書'),(123,'TextBlock',18,'text','Email шаблоны','Email templates','E-Mail-Vorlagen','Plantillas de correo electrónico','電子メールテンプレート'),(124,'TextBlock',19,'text','Текст. блоки','Text. blocks','Text. Blöcke','Texto. bloques','テキスト。ブロック'),(125,'TextBlock',20,'text','События','Notifications','Benachrichtigungen','Notificaciones','通知'),(126,'TextBlock',21,'text','Сообщения','Messages','Nachrichten','Mensajes','メッセージ'),(127,'TextBlock',22,'text','Посещения','Visits','Besuche','Visitas','訪問'),(128,'TextBlock',23,'text','Разработчик','Developer','Entwickler','Revelador','開発者'),(129,'TextBlock',24,'text','Системные настройки','System Settings','Systemeinstellungen','Configuración del sistema','システム設定'),(130,'TextBlock',25,'text','Ошибки электронной почты','Email errors','E-Mail-Fehler','Errores de correo electrónico','電子メールのエラー'),(131,'TextBlock',26,'text','Меню','Menu','Menü','Menú','メニュー'),(132,'TextBlock',27,'text','Текстовые блоки','Text blocks','Textblöcke','Los bloques de texto','テキストブロック'),(133,'TextBlock',28,'text','Локализация','Localization','Lokalisierung','Localización','ローカライゼーション'),(134,'TextBlock',29,'text','Выключить разработчика','Disable Developer mode','Disable Entwicklermodus','Desactivar el modo de desarrollador','無効にする開発者モード'),(135,'TextBlock',30,'text','Тест','Test','Test','Prueba','テスト'),(136,'TextBlock',31,'text','Отправка писем','Send an email','Senden Sie eine E-Mail','Enviar un correo electrónico','メールを送る'),(137,'TextBlock',32,'text','Вики','Wiki','Wiki','Wiki','ウィキ'),(138,'TextBlock',33,'text','Добавить','Add','Hinzufügen','Añadir','加える'),(139,'TextBlock',34,'text','Перейти к FRONTEND','Go to FRONTEND','Zum Frontend','Ir al frontend','フロントエンドに行く'),(140,'TextBlock',35,'text','Выход','Exit','Ausgang','Salida','出口'),(141,'TextBlock',36,'text','Приборная панель','Dashboard','Armaturenbrett','Salpicadero','ダッシュボード'),(142,'TextBlock',37,'text','Профиль','Profile','Profil','Perfil','プロフィール'),(143,'TextBlock',38,'text','Выход','Exit','Ausgang','Salida','出口'),(144,'TextBlock',39,'text','Админка','Admin','Admin','Administración','管理'),(145,'TextBlock',40,'text','Список Страниц','List of Pages','Liste der Seiten','Lista de páginas','ページの一覧'),(146,'TextBlock',41,'text','Название','Title','Titel','Título','タイトル'),(147,'TextBlock',42,'text','УРЛ','URL','URL','URL','URL'),(148,'TextBlock',43,'text','Действия','Actions','Aktionen','Acciones','アクション'),(149,'TextBlock',44,'text','Первая страница','First page','Erste Seite','Primera página','先頭ページ'),(150,'TextBlock',45,'text','Предыдущая страница','Previous Page','Vorherige Seite','Página Anterior','前ページ'),(151,'TextBlock',46,'text','Следующая страница','Next page','Nächste Seite','Página siguiente','次のページ'),(152,'TextBlock',47,'text','Последняя страница','Last page','Letzte Seite','Última página','最終ページ'),(153,'TextBlock',48,'text','[0] нет результата[1] 1 результат|(1,+Inf] %1% результата','[0] no result|[1] 1 result|(1,+Inf] %1% results','[0] kein ergebnis|[1] 1 ergebnis|(1,+Inf] %1% ergebnisse','[0] no resultado|[1] 1 resultado|(1,+Inf] %1% resultados','[0] 結果なし|[1] 1 結果|(1,+Inf] %1% 結果'),(154,'TextBlock',49,'text','(стр.%%page%%/%%nb_pages%%)','(page%%page%%/%%nb_pages%%)','(Seite%%page%%/%%nb_pages%%)','(pagina%%page%%/%%nb_pages%%)','（ページ%%page%%/%%nb_pages%%）'),(155,'TextBlock',50,'text','Редактировать','Edit','Bearbeiten','Editar','編集'),(156,'TextBlock',51,'text','Удалить','Delete','Löschen','Borrar','削除'),(157,'TextBlock',52,'text','Вы уверены?','Are you sure?','Sind Sie sicher?','Estás seguro?','本当に？'),(158,'TextBlock',53,'text','Выберите действие','Choose an action','Wählen Sie eine Aktion','Elija una acción','操作を選択'),(159,'TextBlock',54,'text','Вперед!','Go!','Go!','Go!','ゴー！'),(160,'TextBlock',55,'text','Новый','New','Neu','Nuevo','新しい'),(161,'TextBlock',56,'text','Сообщения в блоге','Blog Posts','Blogeinträge','Mensajes de blog','ブログの投稿'),(162,'TextBlock',57,'text','Сброс','Reset','Rücksetzen','Reajustar','リセット'),(163,'TextBlock',58,'text','Фильтр','Filter','Filter','Filtro','フィルタ'),(164,'TextBlock',59,'text','Нет результата','No result','Kein Ergebnis','Ningún resultado','検索結果はありません'),(165,'TextBlock',60,'text','Новая страница','New page','Neue Seite','Nueva página','新しいページ'),(166,'TextBlock',61,'text','Содержание','Contents','Inhalt','Contenido','コンテンツ'),(167,'TextBlock',62,'text','Включить редирект','Enable redirection','Aktivieren Umleitung','Habilitar la redirección','リダイレクトを有効に'),(168,'TextBlock',63,'text','Адрес редиректа','Redirection address','Umleitungsadresse','Dirección de redirección','リダイレクトアドレス'),(169,'TextBlock',64,'text','Тайм-аут редиректа','Redirection timeout','Redirection Timeout','Tiempo de espera de redirección','リダイレクトタイムアウト'),(170,'TextBlock',65,'text','Планировка','Layout','Layout','Disposición','レイアウト'),(171,'TextBlock',66,'text','Мета название','Meta title','Meta Titel','Título Meta','メタタイトル'),(172,'TextBlock',67,'text','Мета описание','Meta description','Meta Beschreibung','Meta descripción','メタ記述'),(173,'TextBlock',68,'text','Мета ключевые слова','Meta keywords','Meta-Keywords','Meta palabras clave','メタキーワード'),(174,'TextBlock',69,'text','Вернуться к списку','Back to list','Zurück zur Liste','Volver a la lista','一覧に戻る'),(175,'TextBlock',70,'text','Сохранить','Save','Speichern','Guardar','保存'),(176,'TextBlock',71,'text','Сохранить и добавить','Save and add','Speichern und fügen','Guardar y añadir','保存して追加します'),(177,'TextBlock',72,'text','УРЛ-метка','URL tag','URL-Tag','Etiqueta URL','URLタグ'),(178,'TextBlock',73,'text','Редактировать страницу','Edit this Page','Diese Seite bearbeiten','Edite esta página','このページを編集'),(179,'TextBlock',74,'text','Список пользователей','Member List','Benutzerliste','Lista de Miembros','メンバーリスト'),(180,'TextBlock',75,'text','Создано в','Created in','Erstellt in','Creado en','で作成された'),(181,'TextBlock',76,'text','Обновлено в','Updated at','Aktualisiert am','Actualizado en','で更新'),(182,'TextBlock',77,'text','Последнее Войти','Last Login','Letzte Anmeldung','Último ingreso','最終ログイン'),(183,'TextBlock',78,'text','Пользователь','User','Benutzer','Usuario','ユーザー'),(184,'TextBlock',79,'text','Новый пользователь','New user','Neuer Benutzer','Nuevo usuario','新規ユーザー'),(185,'TextBlock',80,'text','Пользователь','User','Benutzer','Usuario','ユーザー'),(186,'TextBlock',81,'text','Имя','First name','Vorname','Nombre de pila','ファーストネーム'),(187,'TextBlock',82,'text','Фамилия','Last name','Nachname','Apellido','姓'),(188,'TextBlock',83,'text','Адрес электронной почты','E-mail address','E-Mail-Adresse','E por correo electrónico','E-mailアドレス'),(189,'TextBlock',84,'text','Пароль (еще раз)','Password (again)','Passwort (wieder)','Contraseña (de nuevo)','パスワード（もう一度）'),(190,'TextBlock',85,'text','Разрешения','Permission','Erlaubnis','Permiso','パーミッション'),(191,'TextBlock',86,'text','Является активным','Is active','Ist aktiv','Es activo','アクティブです'),(192,'TextBlock',87,'text','Это супер админ','Is super admin','Ist super Admin','Es super administrador','スーパー管理者は、'),(193,'TextBlock',88,'text','Редактирование \"%%username%%\"','Edit \"%%username%%\"','Edit \"%%username%%\"','Editar \"%%%%nombre de usuario\"','編集 \"%%ユーザ名%%\"'),(194,'TextBlock',89,'text','Словарь','Dictionary','Wörterbuch','Diccionario','辞書'),(195,'TextBlock',90,'text','Название','Title','Titel','Título','タイトル'),(196,'TextBlock',91,'text','Значение','Meaning','Bedeutung','Significado','意味'),(197,'TextBlock',92,'text','Настройки','Settings','Einstellungen','Ajustes','[設定]'),(198,'TextBlock',93,'text','Список Email шаблонов','List of Email Templates','Liste der E-Mail-Vorlagen','Lista de plantillas de correo electrónico','電子メールテンプレートのリスト'),(199,'TextBlock',94,'text','ID','Id','Identifikation','Identificación','イド'),(200,'TextBlock',95,'text','Тема','Topic','Thema','Tema','トピック'),(201,'TextBlock',96,'text','Сообщение','Message','Nachricht','Mensaje','メッセージ'),(202,'TextBlock',97,'text','Email_template','Email_template','Email_template','Email_template','Email_template'),(203,'TextBlock',98,'text','Редактировать шаблон Email','Edit Email Template','Bearbeiten E-Mail-Vorlage','Editar Plantilla de correo electrónico','編集電子メールテンプレート'),(204,'TextBlock',99,'text','Новый шаблон Email','New template Email','Neue Vorlage Email','Nueva plantilla de correo electrónico','新しいテンプレートメール'),(205,'TextBlock',100,'text','Ваше имя','Your name','Ihren Namen','Su nombre','あなたのお名前'),(206,'TextBlock',101,'text','Ваш E-mail','Your E-mail','Ihre E-Mail','Tu E-mail','あなたのEメール'),(207,'TextBlock',102,'text','Нужен для обратной связи','Need for feedback','Brauchen Sie für Rückfragen','Necesidad de retroalimentación','フィードバックの必要性'),(208,'TextBlock',103,'text','Ваше сообщение','Your message','Ihre Nachricht','Tu mensaje','あなたのメッセージ'),(209,'TextBlock',104,'text','Обновить изображение','Refresh Image','Refresh Image','Refrescar imagen','画像のリフレッシュ'),(210,'TextBlock',105,'text','Введите код с картинки','Enter the code from the image','Geben Sie den Code aus dem Bild','Introduzca el código de la imagen','画像からコードを入力してください'),(211,'TextBlock',106,'text','Показатели','Indicators','Anzeigen','Indicadores','インジケータ'),(212,'TextBlock',107,'text','Имя','First name','Vorname','Nombre de pila','ファーストネーム'),(213,'TextBlock',108,'text','E-mail','E-mail','E-Mail','E-mail','メール'),(214,'TextBlock',109,'text','По убыванию','Descending','Absteigend','Descendente','下行'),(215,'TextBlock',110,'text','Просмотр','View','Ausblick','Vista','ビュー'),(216,'TextBlock',111,'text','Создать пользователя','Create User','Benutzer erstellen','Crear usuario','ユーザーの作成'),(217,'TextBlock',112,'text','Экспорт','Export','Export','Exportación','輸出'),(218,'TextBlock',113,'text','Этот пункт был успешно обновлен.','This item was successfully updated.','Dieser Artikel wurde erfolgreich aktualisiert.','Este artículo se ha actualizado correctamente.','このアイテムは正常に更新されました。'),(219,'TextBlock',114,'text','Неверный формат','Invalid format','Ungültiges Format','Formato no válido','無効な形式'),(220,'TextBlock',115,'text','Системные настройки','System Settings','Systemeinstellungen','Configuración del sistema','システム設定'),(221,'TextBlock',116,'text','Раздел','Section','Abschnitt','Sección','セクション'),(222,'TextBlock',117,'text','Settings_sys','Settings_sys','Settings_sys','Settings_sys','Settings_sys'),(223,'TextBlock',118,'text','Список Email ошибок','Email error list','E-Mail-Fehlerliste','Email lista de errores','電子メールのエラーリスト'),(224,'TextBlock',119,'text','E-mail от','E-mail from','E-Mail von','E-mail de','からの電子メール'),(225,'TextBlock',120,'text','Отправить','Send','Senden','Enviar','送る'),(226,'TextBlock',121,'text','Тело','Body','Körper','Cuerpo','ボディ'),(227,'TextBlock',122,'text','Копия','Copy','Kopie','Copia','コピー'),(228,'TextBlock',123,'text','Файл','File','Datei','Expediente','ファイル'),(229,'TextBlock',124,'text','Errmes','Errmes','Errmes','Errmes','Errmes'),(230,'TextBlock',125,'text','Email_error','Email_error','Email_error','Email_error','Email_error'),(231,'TextBlock',126,'text','Список Меню ','Menus list','Liste Menüs','Lista Menús','メニューリスト'),(232,'TextBlock',127,'text','Управление деревом','Manage tree','Baum verwalten','Administrar árbol','ツリーを管理する'),(233,'TextBlock',128,'text','Управление содержанием','Management content','Content Management','Gestión de contenidos','Managementコンテンツ'),(234,'TextBlock',129,'text','Menu_root','Menu_root','Menu_root','Menu_root','Menu_root'),(235,'TextBlock',130,'text','Список локализаций','Localization list','Lokalisierung Liste','Localización lista','ローカリゼーションリスト'),(236,'TextBlock',131,'text','Локализация','Localization','Lokalisierung','Localización','ローカライゼーション'),(237,'TextBlock',132,'text','Фильтр','Filter','Filter','Filtro','フィルタ'),(238,'TextBlock',133,'text','пусто','Empty','Leer','Vacío','空の'),(239,'TextBlock',134,'text','Мой профиль','My profile','Mein Profil','Mi perfil','私のプロフィール'),(240,'TextBlock',135,'text','Фотография','Photo','Foto','Foto','フォト'),(241,'TextBlock',136,'text','Изменить пароль','Change password','Kennwort ändern','Cambiar la contraseña','パスワードの変更'),(242,'TextBlock',137,'text','Отчество','Patronymic','Vatersname','Patronímico','父称'),(243,'TextBlock',138,'text','Фамилия','Surname','Nachname','Apellido','姓'),(244,'TextBlock',139,'text','Дата рождения\n(дд.мм.гггг)','DOB (dd.mm.yyyy)','DOB (TT.MM.JJJJ)','Fecha de nacimiento (dd.mm.aaaa)','DOB（DD.MM.YYYY）'),(245,'TextBlock',140,'text','Телефон мобильный\n(для получения уведомлений)','Mobile phone (for notification)','Mobiltelefon (zur Meldung)','Teléfono móvil (para la notificación)','携帯電話（通知用）'),(246,'TextBlock',141,'text','Сохранить изменения','Save changes','Änderungen speichern','Guardar cambios','変更を保存します'),(247,'TextBlock',142,'text','Старый пароль','Old password','Altes Passwort','Contraseña anterior','古いパスワード'),(248,'TextBlock',143,'text','Новый пароль','New password','Neues Passwort','Nueva contraseña','新しいパスワード'),(249,'TextBlock',144,'text','Новый пароль еще раз','New password again','Neues Passwort wieder','Nueva contraseña de nuevo','新しいパスワードを再度'),(250,'TextBlock',145,'text','Сохранить пароль','Save password','Kennwort speichern','Guardar contraseña','パスワードの保存'),(251,'TextBlock',146,'text','Заполните поле','Fill out the field','Füllen Sie das Feld','Rellene el campo','フィールドに必要事項を記入してください'),(252,'TextBlock',147,'text','Пароли не совпадают','Passwords do not match','Passwörter stimmen nicht überein','Las contraseñas no coinciden','パスワードが一致していません'),(253,'TextBlock',148,'text','Выберите картинку и загрузите ее','Select a picture and upload it','Wählen Sie ein Bild und laden Sie sie','Seleccione una imagen y cargarla','画像を選択し、それをアップロードする'),(254,'TextBlock',149,'text','Картинка','Picture','Bild','Imagen','絵'),(255,'TextBlock',150,'text','Загрузить фотографию','Upload a photo','Foto hochladen','Subir una foto','写真をアップロード'),(256,'TextBlock',151,'text','Файл слишком большой(не более %max_size% ).','The file is too large (maximum%max_size%).','Die Datei ist zu groß (maximal%max_size%).','El archivo es demasiado grande (%max_size máxima%).','ファイル（最大％相のmax_size％）が大きすぎる。'),(257,'TextBlock',152,'text','Вы можете выбрать зону, которая будет отображаться на ваших фотографиях. Кликните по одному из изображений справа','You can select the area to be displayed on your photos. Click on one of the images to the right','Sie können den Bereich auswählen, die auf Ihre Fotos angezeigt werden. Auf eines der Bilder auf der rechten','Usted puede seleccionar el área que se muestra en las fotos. Haga clic en una de las imágenes a la derecha','あなたはあなたの写真に表示する領域を選択することができます。右に画像のいずれかをクリック'),(258,'TextBlock',153,'text','Удалить текущий файл','Delete the current file','Löschen Sie die aktuelle Datei','Elimine el archivo actual','現在のファイルを削除します。'),(259,'TextBlock',154,'text','Сохранить','Save','Speichern','Guardar','保存'),(260,'TextBlock',155,'text','Вы уверены?','Are you sure?','Sind Sie sicher?','Estás seguro?','本当に？'),(261,'TextBlock',156,'text','Удалить фотографию','Delete photo','Foto löschen','Eliminar foto','写真を削除'),(262,'TextBlock',157,'text','Логин (Ваш Email)','Username (Your Email)','Benutzername (Ihre E-Mail)','Nombre de usuario (su correo electrónico)','ユーザー名（メールアドレス）'),(263,'TextBlock',158,'text','Запомнить меня на этом компьютере','Remember me on this computer','Mich auf diesem Computer','Recordarme en este equipo','このコンピュータで私を覚えている'),(264,'TextBlock',159,'text','Войти','Login','Login','Login','ログイン'),(265,'TextBlock',160,'text','Забыли пароль?','Forgot your password?','Passwort vergessen?','¿Olvidaste tu contraseña?','パスワードを忘れましたか？'),(266,'TextBlock',161,'text','Регистрация','Registration','Anmeldung','Registro','登録'),(267,'TextBlock',162,'text','Неверный логин или пароль','Incorrect login or password','Falsche Login oder Passwort','Usuario o contraseña incorrecta','不正なログインまたはパスワード'),(268,'TextBlock',163,'text','Введите код','Enter the code','Geben Sie den Code','Introduzca el código','コードを入力する'),(269,'TextBlock',164,'text','Письмо отправлено','Letter sent','Brief geschickt','Carta enviada','手紙送ら'),(270,'TextBlock',165,'text','Ваш email','Your email','Ihre E-Mail','Su correo electrónico','あなたのメールアドレス'),(271,'TextBlock',166,'text','Восстановить пароль','Recover password','Passwort vergessen?','Recuperar contraseña','パスワードを回復する'),(272,'TextBlock',167,'text','Повторите пароль','Confirm password','Passwort bestätigen','Confirmar Contraseña','パスワードを確認'),(273,'TextBlock',168,'text','Я принимаю условия','I accept the conditions','Ich akzeptiere die Bedingungen','Acepto las condiciones','私は条件を受け入れる'),(274,'TextBlock',169,'text','Такой email уже зарегистрирован в системе','This email is already registered in the system','Diese E-Mail ist bereits im System registriert','Esta dirección de correo electrónico ya está registrada en el sistema','このメールは、すでにシステムに登録されている'),(275,'TextBlock',170,'text','Пароли не совпадают','Passwords do not match','Passwörter stimmen nicht überein','Las contraseñas no coinciden','パスワードが一致していません'),(276,'TextBlock',171,'text','Вы должны принять условия пользовательского соглашения','You must accept the Terms of Service','Sie müssen die Nutzungsbedingungen akzeptieren','Debe aceptar las condiciones del servicio','あなたはサービス規約に同意する必要があります'),(277,'TextBlock',172,'text','Пароль должен быть не короче 4 символов','Password must be at least 4 characters','Das Passwort muss mindestens 4 Zeichen lang sein','La contraseña debe tener al menos 4 caracteres','パスワードは4文字以上でなければなりません'),(278,'TextBlock',173,'text','Еще раз пароль','Confirm your password','Bestätigen Sie Ihr Passwort','Confirme su contraseña','あなたのパスワードを確認'),(279,'TextBlock',174,'text','Сменить пароль','Change Password','Kennwort ändern','Cambiar la contraseña','パスワードを変更'),(280,'TextBlock',175,'text','Пароль слишком короткий','Password is too short','Passwort ist zu kurz','La contraseña es demasiado corta','パスワードが短すぎる'),(281,'TextBlock',176,'text','Пароль восстановлен','Password recovered','Passwort erholt','Contraseña recuperar','パスワードは回復'),(282,'TextBlock',177,'text','Неверный пароль','Invalid password','Ungültiges Kennwort','Contraseña no válida','無効なパスワード'),(283,'TextBlock',178,'text','События за сегодня','Events for today','Termine für heute','Eventos para hoy','今日のイベント'),(284,'TextBlock',179,'text','Всего событий','Total Events','Veranstaltungen insgesamt','Total de Eventos','総イベント'),(285,'TextBlock',180,'text','Все права защищены','All rights reserved','Alle Rechte vorbehalten','Reservados todos los derechos','版権所有'),(286,'TextBlock',181,'text','Дата','Date','Datum','Fecha','日付'),(287,'TextBlock',182,'text','Опубликован','Published','Veröffentlicht','Publicado','公開された'),(288,'TextBlock',183,'text','да или нет','Yes or no','Ja oder nein','Sí o no','Yesまたはno'),(289,'TextBlock',184,'text','да','Yes','Ja','Sí','はい'),(290,'TextBlock',185,'text','нет','No','Keine','No','ノー'),(291,'TextBlock',186,'text','От','From','Aus','Desde','から'),(292,'TextBlock',187,'text','До','To','Auf','A','へ'),(293,'TextBlock',188,'text','Новый блог пост','New blog post','Neuer Blog','Nueva entrada en el blog','新しいブログ投稿'),(294,'TextBlock',189,'text','Кратко','Briefly','Kurz','Brevemente','簡潔に'),(295,'TextBlock',190,'text','Текст','Text','Text','Texto','テキスト'),(296,'TextBlock',191,'text','УРЛ','URL','URL','URL','URL'),(298,'EmailTemplate',1,'subject','Регистрация на проекте DEV2','Register on the project DEV2','Registrieren Sie sich auf der Projekt DEV2','Registrar en el proyecto DEV2','プロジェクトに登録DEV2'),(299,'EmailTemplate',1,'message','Здравствуйте, {%first_name%}! Вы успешно прошли регистрацию! Перейдите по {%link%}, чтобы активировать свой аккаунт!','Hello, {%first_name%}! You have been registered successfully! Go to {%link%}, to activate your account!','Hallo, {%vorname%}! Sie haben sich erfolgreich registriert! Zum {%link%}, um Ihr Konto zu aktivieren!','Hola, {%FIRST_NAME%}! Usted ha sido registrado correctamente! Ir a {%enlace%}, para activar su cuenta!','こんにちは、{％のFIRST_NAMEの％}！あなたが正常に登録されました！あなたのアカウントをアクティブにする、{％リンク％}に行く！'),(300,'EmailTemplate',2,'subject','Регистрация нового пользователя','Register a new account','Neu registrieren','Registrar una cuenta nueva','新しいアカウントを登録'),(301,'EmailTemplate',2,'message','Пользователь {%full_name%} зарегистрировался','User {%full_name%} checked','Benutzer {%full_name%} geprüft','Usuario {%FULL_NAME%} comprobado','チェックインしたユーザーの{％FULL_NAMEの％}'),(302,'EmailTemplate',3,'subject','Восстановление пароля','Password recovery','Passwort-Wiederherstellung','Recuperar la contraseña','パスワードの復元'),(303,'EmailTemplate',3,'message','Доброго времени суток, {%full_name%} Вы запросили воcстановление пароля на сайте Dev2.Перейдите по {%LINK%} для установки нового пароля.Если запрос отправляли не Вы, проигнорируйте это письмо.','Good day, {%full_name%} You have requested a password vocstanovlenie online Dev2.Pereydite by {%LINK%} to set the new request is sent parolya.Esli not you, ignore this message.','Guten Tag, {%full_name%} Sie haben ein Passwort vocstanovlenie Online Dev2.Pereydite von {%LINK%}, um die neue Anforderung eingestellt parolya.Esli geschickt du nicht, ignorieren Sie diese Meldung angefordert.','Buen día, {%FULL_NAME%} que ha requerido una contraseña vocstanovlenie Dev2.Pereydite línea por {%ENLACE%} para establecer la nueva solicitud se envía parolya.Esli no, ignora este mensaje.','良い日には、{％のFULL_NAMEの％}あなたは、このメッセージを無視しないでparolya.Esli送信され、新しい要求を設定する{％リンク％}によるパスワードvocstanovlenieオンラインDev2.Pereyditeを要求した。'),(304,'EmailTemplate',4,'subject','Проект DEV2. Ваше сообщение очень важно для нас!','Project DEV2. Your message is important to us!','Projekt DEV2. Ihre Nachricht ist uns wichtig!','DEV2 Proyecto. Su mensaje es importante para nosotros!','プロジェクトDEV2。あなたのメッセージは私達にとって重要である！'),(305,'EmailTemplate',4,'message','Уважаемый {%name%}! Спасибо за Ваше сообщение! Оно очень важно для нас!','Dear {%name%}! Thank you for your message! It is very important to us!','Sehr geehrte {%name%}! Vielen Dank für Ihre Nachricht! Es ist sehr wichtig für uns!','Estimado {%nombre%}! Gracias por tu mensaje! Es muy importante para nosotros!','親愛なる{％名％}！あなたのメッセージをありがとう！それは私達にとって非常に重要である！'),(306,'EmailTemplate',5,'subject','Проект DEV2. Новое сообщение','Project DEV2. new message','Projekt DEV2. neue Nachricht','DEV2 Proyecto. nuevo mensaje','プロジェクトDEV2。新しいメッセージ'),(307,'EmailTemplate',5,'message','Некто {%name%} прислал сообщение. Текст: {%message%} E-Mail: {%email%}','Someone {%name%} sent a message. Text: {%message%} E-Mail: {%email%}','Jemand {%name%} eine Nachricht geschickt. Text: {%message%} E-Mail: {%email%}','Alguien {nombre}%%envió un mensaje. Texto: {%}%de mensajes de E-Mail: {%email%}','誰か{％名％}はメッセージを送った。テキスト：{％メッセージ％} Eメール：{％電子メール％}'),(308,'MenuItem',1,'name','Главное меню','Main Menu','Hauptmenü','Menú Principal','メインメニュー'),(309,'MenuItem',2,'name','На главную','Home','Zuhause','Casa','ホーム'),(310,'MenuItem',3,'name','О нас','About Us','Über uns','Sobre nosotros','我々について'),(311,'MenuItem',4,'name','Контакты','Contacts','Kontakte','Contactos','コンタクト'),(312,'MenuItem',5,'name','Закрытый раздел','A Closed Forum','Forum geschlossen','Un Foro Cerrado','クローズドフォーラム'),(313,'MenuItem',6,'name','Нижнее меню','Footer menu','Footer Menü','Menú Pie de página','フッターメニュー'),(314,'MenuItem',7,'name','Политика конфиденциальности','Privacy policy','Datenschutz-Bestimmungen','Política de privacidad','個人情報保護方針'),(315,'MenuItem',8,'name','Пользовательское соглашение','User Agreement','Benutzervereinbarung','Acuerdo del usuario','ユーザー規約'),(316,'TextBlock',193,'text','пользовательского соглашения','of user agreement','Benutzervereinbarung','De acuerdo con usuario','ユーザー契約の'),(317,'TextBlock',194,'text','Этот пункт был успешно создан.','The item was created successfully.','Der Artikel wurde erfolgreich erstellt.','El artículo fue creado con éxito.','アイテムの作成に成功しました。'),(318,'TextBlock',195,'text','Вы не имеете надлежащих полномочий на доступ к этой странице','You don\'t have proper credentials to access this page','Sie haben keine richtigen Anmeldeinformationen, um auf diese Seite zuzugreifen','Usted no tiene las credenciales adecuadas para acceder a esta página','あなたがこのページにアクセスするための適切な資格を持っていない'),(320,'TextBlock',197,'text','Secure','Secure','Sichere','Secure','セキュア'),(328,'TextBlock',210,'text','Сервер не отвечает','Server is not responding','Server antwortet nicht','El servidor no está respondiendo','サーバが応答していません'),(329,'TextBlock',211,'text','Данные сохранены','Data saved','Daten gespeichert','Los datos guardados','データは保存'),(330,'TextBlock',212,'text','Ошибка при сохранении данных','Error while saving data','Fehler beim Speichern von Daten','Error al guardar los datos','エラーデータを保存しながら、'),(335,'TextBlock',217,'text','Неожиданный дополнительный поля формы с именем \"%field%\".','Unexpected extra form field named \"%field%\".','Unerwartete zusätzliche Formularfeld mit dem Namen \"%field%\".','Inesperado campo de formulario adicional llamado \"%field%\".','予想外の余分なフォームフィールドは、「％フィールド％」と名付けました。'),(336,'TextBlock',221,'text','Вы можете править текст прямо в списке. Исправьте все, что считаете нужным, а затем нажмите TAB или щелкните мышью в любом месте вне поля ввода.','You can edit the text directly in the list. Correct all that apply, and then press TAB or click anywhere outside of the input field.','Sie können den Text direkt in der Liste bearbeiten. Korrigieren Sie alles, was gelten, und drücken Sie TAB oder klicken Sie auf eine beliebige Stelle außerhalb des Eingabefeldes.','Puede editar el texto directamente en la lista. Corrija todas las que apliquen, a continuación, presione TAB o haga clic en cualquier lugar fuera del campo de entrada.','あなたは、リスト内のテキストを直接編集することができます。 Tabキーを押すか、入力フィールドの外側をクリックし、次に該当するものをすべて修正し、。'),(337,'TextBlock',222,'text','Воспользуйтесь фильтром, чтобы найти нужный вам текст','Please use the filter to find the desired text','Bitte benutzen Sie den Filter, um den gewünschten Text zu finden','Utilice el filtro para encontrar el texto deseado','必要なテキストを見つけるために、フィルタを使用してください'),(348,'TextBlock',223,'text','Отправить','Send','Senden','Enviar','送る'),(349,'TextBlock',196,'text',NULL,NULL,NULL,NULL,''),(350,'TextBlock',213,'text',NULL,'Ru',NULL,NULL,'Ru'),(351,'TextBlock',214,'text',NULL,'En',NULL,NULL,'En'),(352,'TextBlock',215,'text',NULL,'De',NULL,NULL,'De'),(353,'TextBlock',216,'text',NULL,'Es',NULL,NULL,'Es'),(354,'TextBlock',224,'text',NULL,'The item has not been saved due to some errors.',NULL,NULL,'項目はいくつかのエラーが原因で保存されていません。'),(355,'TextBlock',225,'text',NULL,'An object with the same \"%column%\" already exist.',NULL,NULL,'同じ「％列％ \"を持つオブジェクトが既に存在している。'),(356,'TextBlock',226,'text',NULL,'Update',NULL,NULL,'アップデート'),(357,'TextBlock',227,'text',NULL,'Is module page',NULL,NULL,'モジュールのページです'),(358,'TextBlock',228,'text',NULL,'Module name',NULL,NULL,'モジュール名'),(359,'TextBlock',229,'text',NULL,'Is content editable',NULL,NULL,'コンテンツ編集可能です'),(360,'TextBlock',230,'text',NULL,'Special mark',NULL,NULL,'特別なマーク'),(361,'TextBlock',231,'text',NULL,'Is redirect',NULL,NULL,'リダイレクトされている'),(362,'TextBlock',232,'text',NULL,'Redirect301 old url',NULL,NULL,'Redirect301古いURL'),(363,'TextBlock',233,'text',NULL,'Show',NULL,NULL,'ショー');
/*!40000 ALTER TABLE `localization` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_item`
--

DROP TABLE IF EXISTS `menu_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu_item` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `root_name` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT 'empty',
  `page_id` bigint(20) DEFAULT NULL,
  `cms_module_id` bigint(20) DEFAULT NULL,
  `route` varchar(255) DEFAULT NULL,
  `external` text,
  `is_empty` tinyint(1) DEFAULT '1',
  `is_auth` tinyint(1) DEFAULT '0',
  `icon_class` varchar(32) DEFAULT NULL,
  `root_id` bigint(20) DEFAULT NULL,
  `lft` int(11) DEFAULT NULL,
  `rgt` int(11) DEFAULT NULL,
  `level` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `page_id_idx` (`page_id`),
  KEY `cms_module_id_idx` (`cms_module_id`),
  CONSTRAINT `menu_item_cms_module_id_cms_module_id` FOREIGN KEY (`cms_module_id`) REFERENCES `cms_module` (`id`) ON DELETE SET NULL,
  CONSTRAINT `menu_item_page_id_page_id` FOREIGN KEY (`page_id`) REFERENCES `page` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_item`
--

LOCK TABLES `menu_item` WRITE;
/*!40000 ALTER TABLE `menu_item` DISABLE KEYS */;
INSERT INTO `menu_item` (`id`, `name`, `root_name`, `type`, `page_id`, `cms_module_id`, `route`, `external`, `is_empty`, `is_auth`, `icon_class`, `root_id`, `lft`, `rgt`, `level`) VALUES (1,'メインメニュー','main','empty',NULL,NULL,NULL,NULL,1,0,NULL,1,1,52,0),(2,'ホーム','','route',1,NULL,'homepage','',1,0,NULL,1,1,1,1),(3,'我々について',NULL,'page',2,NULL,NULL,NULL,1,0,NULL,1,44,45,1),(4,'コンタクト',NULL,'module',3,2,'','',1,0,NULL,1,46,47,1),(5,'クローズドフォーラム',NULL,'page',14,NULL,'','',1,1,'',1,50,51,1),(6,'フッターメニュー','bottom','empty',NULL,NULL,NULL,NULL,1,0,NULL,6,6,NULL,0),(7,'個人情報保護方針',NULL,'page',13,NULL,'','',1,0,'',6,6,5,1),(8,'ユーザー規約',NULL,'page',12,NULL,'','',1,0,'',6,6,5,1);
/*!40000 ALTER TABLE `menu_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `news`
--

DROP TABLE IF EXISTS `news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `news` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `title` varchar(255) NOT NULL,
  `brief` text,
  `content` text,
  `image` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `meta_title` varchar(255) DEFAULT NULL,
  `meta_description` varchar(255) DEFAULT NULL,
  `meta_keywords` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `news_sluggable_idx` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `news`
--

LOCK TABLES `news` WRITE;
/*!40000 ALTER TABLE `news` DISABLE KEYS */;
/*!40000 ALTER TABLE `news` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `page`
--

DROP TABLE IF EXISTS `page`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `page` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content` text,
  `is_module_page` tinyint(1) DEFAULT '0',
  `module_name` varchar(255) DEFAULT NULL,
  `is_content_editable` tinyint(1) DEFAULT '1',
  `special_mark` varchar(255) DEFAULT NULL,
  `is_redirect` tinyint(1) DEFAULT '0',
  `redirect_route` varchar(32) DEFAULT '/',
  `redirect_timeout` smallint(6) DEFAULT '5',
  `layout` varchar(32) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `meta_title` varchar(255) DEFAULT NULL,
  `meta_description` varchar(255) DEFAULT NULL,
  `meta_keywords` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `page_sluggable_idx` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `page`
--

LOCK TABLES `page` WRITE;
/*!40000 ALTER TABLE `page` DISABLE KEYS */;
INSERT INTO `page` (`id`, `name`, `content`, `is_module_page`, `module_name`, `is_content_editable`, `special_mark`, `is_redirect`, `redirect_route`, `redirect_timeout`, `layout`, `slug`, `meta_title`, `meta_description`, `meta_keywords`) VALUES (1,'ようこそ！','あなたにご挨拶、若い友人！あなた自身がウェブサイトを必要とする、あなたので、このサイトに来た。それとも、単に偶然ここに来た！いずれの場合においても、大歓迎！',1,'default',1,'default',0,'/',5,'','','プロジェクトDEV2のウェブサイトへようこそ！',NULL,NULL),(2,'我々について','私たちは、ウェブサイトの開発と促進に取り組んで非常に経験豊富すでに若い会社ですが、',0,NULL,1,NULL,0,'/',5,'','1','プロジェクトについて',NULL,NULL),(3,'フィードバック','私達にメッセージを送信し、我々はできるだけ早くご連絡させていただきます！',0,NULL,1,'contactus',0,'/',5,NULL,'2','お問い合わせ - プロジェクトDEV2を',NULL,NULL),(4,'登録',NULL,0,NULL,0,'register',0,'/',5,NULL,'3','登録',NULL,NULL),(5,'パスワードの復元','「パスワードを回復」をクリックし、私たちはあなたにパスワード回復にリンクしますメールをお送りします。',0,NULL,1,'auth_forgot_password',0,'/',5,NULL,'4','パスワードの復元',NULL,NULL),(6,'パスワード回復。メールは送信しました。','電子メールはあなたの電子メールアドレスに送信されました',0,NULL,1,'auth_forgot_password_thanks',1,'/',5,'','5','パスワード回復。メールは送信しました。',NULL,NULL),(7,'パスワード回復。送信されたSMS',NULL,0,NULL,1,'auth_forgot_sms',0,'/',5,NULL,'sms','パスワード回復。送信されたSMS',NULL,NULL),(8,'新しいパスワードを発明',NULL,0,NULL,1,'auth_password_recovery',0,'/',5,NULL,'6','新しいパスワードを発明',NULL,NULL),(9,'あなたのパーソナルエリア',NULL,0,NULL,1,'auth_signin',0,'/',5,NULL,'7','あなたのパーソナルエリア',NULL,NULL),(10,'登録が完了です！','私たちはあなたの電子メールアドレスにあなたにメールを送った。 、それが登録を完了するための指示に従ってください。',0,NULL,1,'auth_registration_complete',1,'/',5,NULL,'8','登録が完了です！',NULL,NULL),(11,'アクティベーションは完了です！','今、あなたは、ログインすることができます！',0,NULL,1,'auth_activation_successful',1,'/profile',3,'','9','アクティベーションは完了です！',NULL,NULL),(12,'ユーザー規約','ここでは絶対的に一般的なユーザー契約がある',0,NULL,1,'user_agreement',0,'/',5,'','10','ユーザー規約',NULL,NULL),(13,'個人情報保護方針','ここでは、プライバシーポリシーに関する一切の典型的なページです',0,NULL,1,'privacy_policy',0,'/',5,'','11','個人情報保護方針',NULL,NULL),(14,'クローズドフォーラム','あなたがこのページに遭遇した場合、それはあなたが許可されたユーザであることを意味します！',0,NULL,1,NULL,0,'/',5,NULL,'12','クローズドフォーラム',NULL,NULL),(15,'これはテストページです',NULL,0,NULL,1,NULL,0,'/',5,'','13','これはテストページです',NULL,NULL),(16,'エラー404','エラー404ページが見つかりません',0,NULL,1,'error404',0,'/',5,NULL,'404','エラー404',NULL,NULL),(17,'マイプロフィール','ここでは、あなたの個人情報を編集写真をアップロードし、パスワードを変更することができます',0,NULL,0,'profile',0,'/',5,NULL,'14','マイプロフィール',NULL,NULL),(18,'マイプロフィール - パスワード変更','私たちは、暗号化された形式でパスワードを格納します。あなたはそれを知っている唯一の一つです',0,NULL,0,'profile_password',0,'/',5,NULL,'15','マイプロフィール - パスワード変更',NULL,NULL),(19,'マイプロフィール - 編集フォト',NULL,0,NULL,0,'profile_avatar',0,'/',5,NULL,'16','マイプロフィール - 編集フォト',NULL,NULL),(20,'IPアドレスがブロックされている','残念ながら、不明な理由のために、あなたのアドレスがブロックされました！ありがとうございます！',0,NULL,1,'ip_banned',0,'/',5,'empty','ip','IPアドレスがブロックされている',NULL,NULL),(21,'登録またはログインしてください','このセクションの内容を表示するには、ログインしてください',0,NULL,1,'auth_secure',0,'/',5,NULL,'17','登録またはログインしてください',NULL,NULL);
/*!40000 ALTER TABLE `page` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profile`
--

DROP TABLE IF EXISTS `profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profile` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `middle_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `geo_lat` varchar(32) DEFAULT NULL,
  `geo_lng` varchar(32) DEFAULT NULL,
  `geo_country` varchar(32) DEFAULT NULL,
  `geo_city` varchar(32) DEFAULT NULL,
  `geo_address` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id_idx` (`user_id`),
  CONSTRAINT `profile_user_id_sf_guard_user_id` FOREIGN KEY (`user_id`) REFERENCES `sf_guard_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profile`
--

LOCK TABLES `profile` WRITE;
/*!40000 ALTER TABLE `profile` DISABLE KEYS */;
INSERT INTO `profile` (`id`, `user_id`, `first_name`, `middle_name`, `last_name`, `image`, `dob`, `email`, `phone`, `created_at`, `updated_at`, `geo_lat`, `geo_lng`, `geo_country`, `geo_city`, `geo_address`) VALUES (1,2,'','','',NULL,'1985-10-01','admin@test.com','','2014-10-26 16:12:01','2014-10-26 16:12:01',NULL,NULL,NULL,NULL,NULL),(2,3,'Test','test','test',NULL,'2014-10-07','alex@web375.org','','2014-10-26 16:51:03','2014-10-26 16:51:03',NULL,NULL,NULL,NULL,NULL),(3,1,'Алеша','','',NULL,'2014-10-12','admin@admin.com','','2014-10-26 18:42:34','2014-10-29 00:29:24',NULL,NULL,NULL,NULL,NULL),(4,4,'Вася','Рогов','Рогов',NULL,'2014-10-01','alexey.radyuk@gmail.com','','2014-10-26 21:57:41','2014-10-26 21:57:41',NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `redirect301`
--

DROP TABLE IF EXISTS `redirect301`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `redirect301` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `url_from` varchar(255) NOT NULL,
  `url_to` varchar(255) NOT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `comment` text,
  `use_count` bigint(20) DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `url_from` (`url_from`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `redirect301`
--

LOCK TABLES `redirect301` WRITE;
/*!40000 ALTER TABLE `redirect301` DISABLE KEYS */;
INSERT INTO `redirect301` (`id`, `url_from`, `url_to`, `is_active`, `comment`, `use_count`, `created_at`, `updated_at`) VALUES (16,'/page/sobre-nosotros1231','/page/sobre-nosotros1231231',1,'Page: Sobre nosotros',1,'2014-10-31 14:22:01','2014-10-31 14:22:14'),(17,'/page/','/page/17',1,'Page: 登録またはログインしてください',0,'2014-10-31 14:25:43','2014-10-31 15:15:50'),(18,'/page/dobro-pozhalovat','/page/',1,'Page: ようこそ！',0,'2014-10-31 15:02:39','2014-10-31 15:02:39');
/*!40000 ALTER TABLE `redirect301` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sf_guard_forgot_password`
--

DROP TABLE IF EXISTS `sf_guard_forgot_password`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sf_guard_forgot_password` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `unique_key` varchar(255) DEFAULT NULL,
  `expires_at` datetime NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id_idx` (`user_id`),
  CONSTRAINT `sf_guard_forgot_password_user_id_sf_guard_user_id` FOREIGN KEY (`user_id`) REFERENCES `sf_guard_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sf_guard_forgot_password`
--

LOCK TABLES `sf_guard_forgot_password` WRITE;
/*!40000 ALTER TABLE `sf_guard_forgot_password` DISABLE KEYS */;
/*!40000 ALTER TABLE `sf_guard_forgot_password` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sf_guard_group`
--

DROP TABLE IF EXISTS `sf_guard_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sf_guard_group` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sf_guard_group`
--

LOCK TABLES `sf_guard_group` WRITE;
/*!40000 ALTER TABLE `sf_guard_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `sf_guard_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sf_guard_group_permission`
--

DROP TABLE IF EXISTS `sf_guard_group_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sf_guard_group_permission` (
  `group_id` bigint(20) NOT NULL DEFAULT '0',
  `permission_id` bigint(20) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`group_id`,`permission_id`),
  KEY `sf_guard_group_permission_permission_id_sf_guard_permission_id` (`permission_id`),
  CONSTRAINT `sf_guard_group_permission_group_id_sf_guard_group_id` FOREIGN KEY (`group_id`) REFERENCES `sf_guard_group` (`id`) ON DELETE CASCADE,
  CONSTRAINT `sf_guard_group_permission_permission_id_sf_guard_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `sf_guard_permission` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sf_guard_group_permission`
--

LOCK TABLES `sf_guard_group_permission` WRITE;
/*!40000 ALTER TABLE `sf_guard_group_permission` DISABLE KEYS */;
/*!40000 ALTER TABLE `sf_guard_group_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sf_guard_permission`
--

DROP TABLE IF EXISTS `sf_guard_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sf_guard_permission` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sf_guard_permission`
--

LOCK TABLES `sf_guard_permission` WRITE;
/*!40000 ALTER TABLE `sf_guard_permission` DISABLE KEYS */;
INSERT INTO `sf_guard_permission` (`id`, `name`, `description`, `created_at`, `updated_at`) VALUES (1,'tournament','Tournament management','2013-04-23 16:09:14','2013-04-23 16:09:14'),(2,'match','Match management','2013-04-23 16:09:18','2013-04-23 16:09:18'),(3,'prognosis','Prognosis management','2013-04-23 16:09:23','2013-04-23 16:09:23'),(4,'team','Team management','2013-04-23 16:19:28','2013-04-23 16:19:28'),(5,'site_message','Site message management','2013-09-10 11:50:33','2013-09-10 11:50:33'),(6,'site_event','Site event management','2013-09-10 11:50:38','2013-09-10 11:50:38'),(7,'site_visit','Site visit management','2013-09-10 17:15:28','2013-09-10 17:15:28'),(8,'email_template','Email template management','2013-10-12 20:11:01','2013-10-12 20:11:01'),(9,'blog_post','Blog post management','2014-01-08 14:05:04','2014-01-08 14:05:04'),(10,'blog_post_comment','Blog post comment management','2014-01-08 14:05:15','2014-01-08 14:05:15'),(11,'blog_tag','Blog tag management','2014-01-08 14:05:25','2014-01-08 14:05:25'),(12,'settings_sys','Settings sys management','2014-10-24 15:36:38','2014-10-24 15:36:38'),(13,'email_error','Email error management','2014-10-24 21:36:16','2014-10-24 21:36:16'),(14,'wiki','Wiki management','2014-10-25 14:19:58','2014-10-25 14:19:58'),(15,'text_block','Text block management','2014-10-27 12:14:44','2014-10-27 12:14:44'),(16,'text_block_sys','Text block sys management','2014-10-27 12:14:53','2014-10-27 12:14:53'),(17,'localization','Localization management','2014-10-27 22:02:34','2014-10-27 22:02:34'),(18,'editor','Editor','0000-00-00 00:00:00','0000-00-00 00:00:00');
/*!40000 ALTER TABLE `sf_guard_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sf_guard_remember_key`
--

DROP TABLE IF EXISTS `sf_guard_remember_key`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sf_guard_remember_key` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL,
  `remember_key` varchar(32) DEFAULT NULL,
  `ip_address` varchar(50) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id_idx` (`user_id`),
  CONSTRAINT `sf_guard_remember_key_user_id_sf_guard_user_id` FOREIGN KEY (`user_id`) REFERENCES `sf_guard_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sf_guard_remember_key`
--

LOCK TABLES `sf_guard_remember_key` WRITE;
/*!40000 ALTER TABLE `sf_guard_remember_key` DISABLE KEYS */;
INSERT INTO `sf_guard_remember_key` (`id`, `user_id`, `remember_key`, `ip_address`, `created_at`, `updated_at`) VALUES (1,2,'4z1zyq7ubmkgks0os8w0wcscoow0www','127.0.0.1','2014-10-26 16:43:11','2014-10-26 16:43:11'),(2,1,'ng3vqij5qlwcwc8okc00gs0w8kccks4','127.0.0.1','2014-10-26 16:53:04','2014-10-26 16:53:04'),(3,4,'3ujzw4600so4ggswcs8wsooks8k0ckk','127.0.0.1','2014-10-26 21:58:17','2014-10-26 21:58:17'),(4,3,'n1xgbl2pyxw0scw8w4w0gwo84k0g4o0','127.0.0.1','2014-10-26 22:10:59','2014-10-26 22:10:59');
/*!40000 ALTER TABLE `sf_guard_remember_key` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sf_guard_user`
--

DROP TABLE IF EXISTS `sf_guard_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sf_guard_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `email_address` varchar(255) NOT NULL,
  `username` varchar(128) NOT NULL,
  `algorithm` varchar(128) NOT NULL DEFAULT 'sha1',
  `salt` varchar(128) DEFAULT NULL,
  `password` varchar(128) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `is_super_admin` tinyint(1) DEFAULT '0',
  `last_login` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email_address` (`email_address`),
  UNIQUE KEY `username` (`username`),
  KEY `is_active_idx_idx` (`is_active`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sf_guard_user`
--

LOCK TABLES `sf_guard_user` WRITE;
/*!40000 ALTER TABLE `sf_guard_user` DISABLE KEYS */;
INSERT INTO `sf_guard_user` (`id`, `first_name`, `last_name`, `email_address`, `username`, `algorithm`, `salt`, `password`, `is_active`, `is_super_admin`, `last_login`, `created_at`, `updated_at`) VALUES (1,NULL,NULL,'admin@admin.com','admin','sha1','dc13a3f3d4157b540bf3cb98b473ed04','c2f0a9198bcc02aa03f31bca07ef3e990cfa22a1',1,1,'2014-10-31 15:03:35','2013-04-23 16:05:02','2014-10-31 15:03:35'),(2,NULL,NULL,'admin@test.com','admin@test.com','sha1','07cc694b9b3fc636710fa08b6922c42b','40e2c55f3b507b133eff96d7cab4c2278a0ba490',1,0,'2014-10-26 16:43:11','2014-10-26 16:12:01','2014-10-28 19:16:19'),(3,NULL,NULL,'alex@web375.org','alex@web375.org','sha1','4b070b078dd91af1d6509896e32058e6','1cdf16b32d8e759503329e142e8e52e6e1e452a6',1,0,'2014-10-28 15:07:35','2014-10-26 16:51:03','2014-10-28 19:16:19'),(4,NULL,NULL,'alexey.radyuk@gmail.com','alexey.radyuk@gmail.com','sha1','a12afc48e64fdfe6312ab71cb1545166','f4a9f61f2d53580161fb05005b2474c8f5343481',1,0,'2014-10-26 22:28:08','2014-10-26 21:57:41','2014-10-28 19:16:19'),(5,'Editor','Editor','editor@demo.org','editor','sha1','f149748ec57cf9e460718461902035b9','08f8bc948efa9dba540ae1d1468599567d9d5be6',1,1,'2014-10-31 14:30:50','2014-10-29 15:29:31','2014-10-31 14:30:50');
/*!40000 ALTER TABLE `sf_guard_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sf_guard_user_group`
--

DROP TABLE IF EXISTS `sf_guard_user_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sf_guard_user_group` (
  `user_id` bigint(20) NOT NULL DEFAULT '0',
  `group_id` bigint(20) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`user_id`,`group_id`),
  KEY `sf_guard_user_group_group_id_sf_guard_group_id` (`group_id`),
  CONSTRAINT `sf_guard_user_group_group_id_sf_guard_group_id` FOREIGN KEY (`group_id`) REFERENCES `sf_guard_group` (`id`) ON DELETE CASCADE,
  CONSTRAINT `sf_guard_user_group_user_id_sf_guard_user_id` FOREIGN KEY (`user_id`) REFERENCES `sf_guard_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sf_guard_user_group`
--

LOCK TABLES `sf_guard_user_group` WRITE;
/*!40000 ALTER TABLE `sf_guard_user_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `sf_guard_user_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sf_guard_user_permission`
--

DROP TABLE IF EXISTS `sf_guard_user_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sf_guard_user_permission` (
  `user_id` bigint(20) NOT NULL DEFAULT '0',
  `permission_id` bigint(20) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`user_id`,`permission_id`),
  KEY `sf_guard_user_permission_permission_id_sf_guard_permission_id` (`permission_id`),
  CONSTRAINT `sf_guard_user_permission_permission_id_sf_guard_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `sf_guard_permission` (`id`) ON DELETE CASCADE,
  CONSTRAINT `sf_guard_user_permission_user_id_sf_guard_user_id` FOREIGN KEY (`user_id`) REFERENCES `sf_guard_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sf_guard_user_permission`
--

LOCK TABLES `sf_guard_user_permission` WRITE;
/*!40000 ALTER TABLE `sf_guard_user_permission` DISABLE KEYS */;
INSERT INTO `sf_guard_user_permission` (`user_id`, `permission_id`, `created_at`, `updated_at`) VALUES (5,18,'2014-10-29 15:29:31','2014-10-29 15:29:31');
/*!40000 ALTER TABLE `sf_guard_user_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `site_event`
--

DROP TABLE IF EXISTS `site_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `site_event` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) DEFAULT NULL,
  `description` text,
  `admin_email` text,
  `user_email` text,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `site_event`
--

LOCK TABLES `site_event` WRITE;
/*!40000 ALTER TABLE `site_event` DISABLE KEYS */;
INSERT INTO `site_event` (`id`, `type`, `description`, `admin_email`, `user_email`, `created_at`, `updated_at`) VALUES (1,'contactus_message','Сообщение из формы обратной связи: <br /><hr />\n  Имя: Вальдемар<br />\n  Email: alexey.mail@mail.com<br />\n  Сообщение: <i>test</i>\n','Сообщение из формы обратной связи: <br /><hr />\n  Имя: Вальдемар<br />\n  Email: alexey.mail@mail.com<br />\n  Сообщение: <i>test</i>\n','<big>Вальдемар!</big> Спасибо за твой отклик! Мы свяжемся с тобой очень быстро','2013-09-10 12:03:41','2013-09-10 12:03:41'),(2,'registration','','','','2014-10-26 16:12:05','2014-10-26 16:12:05'),(3,'registration','','','','2014-10-26 16:22:18','2014-10-26 16:22:18'),(4,'registration','Пользователь {%full_name%} зарегистрировался','Пользователь {%full_name%} зарегистрировался','Здравствуйте, Алексей! Вы успешно прошли регистрацию! Перейдите по <a href=\"http://dev2/register/activate?code=07cc694b9b3fc636710fa08b6922c42b\">ссылке</a>, чтобы активировать свой аккаунт!','2014-10-26 16:32:47','2014-10-26 16:32:47'),(5,'registration','Пользователь {%full_name%} зарегистрировался','Пользователь {%full_name%} зарегистрировался','Здравствуйте, Алеша! Вы успешно прошли регистрацию! Перейдите по <a href=\"http://dev2/auth/activate?code=07cc694b9b3fc636710fa08b6922c42b\">ссылке</a>, чтобы активировать свой аккаунт!','2014-10-26 16:42:49','2014-10-26 16:42:49'),(6,'registration','Пользователь test Test test зарегистрировался','Пользователь test Test test зарегистрировался','Здравствуйте, Test! Вы успешно прошли регистрацию! Перейдите по <a href=\"http://dev2/auth/activate?code=4b070b078dd91af1d6509896e32058e6\">ссылке</a>, чтобы активировать свой аккаунт!','2014-10-26 16:51:07','2014-10-26 16:51:07'),(7,'registration','Пользователь Рогов Вася Рогов зарегистрировался','Пользователь Рогов Вася Рогов зарегистрировался','Здравствуйте, Вася! Вы успешно прошли регистрацию! Перейдите по <a href=\"http://dev.2/auth/activate?code=a12afc48e64fdfe6312ab71cb1545166\">ссылке</a>, чтобы активировать свой аккаунт!','2014-10-26 21:57:45','2014-10-26 21:57:45'),(8,'password_recovery','Доброго времени суток, {%full_name%}.<br /><br />Вы запросили воcстановление пароля на сайте Style of life Academy.<br />Перейдите по {%LINK%} для установки нового пароля.<br /><br />Если запрос отправляли не Вы, проигнорируйте это письмо.<br /><br /><strong>Вступайте в наши группы:<br /><br /></strong><a href=\"http://vk.com/club15177821\"><img src=\"/uploads/images/1c98a1cd343c6846e2b67caed1290903.png\" alt=\"vk\" width=\"30\" height=\"30\" />&nbsp;группа вконтакте</a>&nbsp;&nbsp;<a href=\"http://www.odnoklassniki.ru/group/51930802880704\"><img src=\"/uploads/images/74f81f9f7e1c2aa940a7b607bb48068c.png\" alt=\"odn\" width=\"30\" height=\"30\" />&nbsp; группа в одноклассниках</a>&nbsp;<br /><br /><br /><br /><strong>С уважением, команда Style of Life Academy</strong><br />',NULL,'Доброго времени суток, {%full_name%}.<br /><br />Вы запросили воcстановление пароля на сайте Style of life Academy.<br />Перейдите по {%LINK%} для установки нового пароля.<br /><br />Если запрос отправляли не Вы, проигнорируйте это письмо.<br /><br /><strong>Вступайте в наши группы:<br /><br /></strong><a href=\"http://vk.com/club15177821\"><img src=\"/uploads/images/1c98a1cd343c6846e2b67caed1290903.png\" alt=\"vk\" width=\"30\" height=\"30\" />&nbsp;группа вконтакте</a>&nbsp;&nbsp;<a href=\"http://www.odnoklassniki.ru/group/51930802880704\"><img src=\"/uploads/images/74f81f9f7e1c2aa940a7b607bb48068c.png\" alt=\"odn\" width=\"30\" height=\"30\" />&nbsp; группа в одноклассниках</a>&nbsp;<br /><br /><br /><br /><strong>С уважением, команда Style of Life Academy</strong><br />','2014-10-26 22:03:53','2014-10-26 22:03:53'),(9,'password_recovery','Доброго времени суток, test Test test.<br /><br />Вы запросили воcстановление пароля на сайте Style of life Academy.<br />Перейдите по <a href=\'http://dev.2/auth/recover?hash=2879349a5fe9f6c9f50a24516f1414bc\'>ссылке</a> для установки нового пароля.<br /><br />Если запрос отправляли не Вы, проигнорируйте это письмо.<br /><br /><strong>Вступайте в наши группы:<br /><br /></strong><a href=\"http://vk.com/club15177821\"><img src=\"/uploads/images/1c98a1cd343c6846e2b67caed1290903.png\" alt=\"vk\" width=\"30\" height=\"30\" />&nbsp;группа вконтакте</a>&nbsp;&nbsp;<a href=\"http://www.odnoklassniki.ru/group/51930802880704\"><img src=\"/uploads/images/74f81f9f7e1c2aa940a7b607bb48068c.png\" alt=\"odn\" width=\"30\" height=\"30\" />&nbsp; группа в одноклассниках</a>&nbsp;<br /><br /><br /><br /><strong>С уважением, команда Style of Life Academy</strong><br />',NULL,'Доброго времени суток, test Test test.<br /><br />Вы запросили воcстановление пароля на сайте Style of life Academy.<br />Перейдите по <a href=\'http://dev.2/auth/recover?hash=2879349a5fe9f6c9f50a24516f1414bc\'>ссылке</a> для установки нового пароля.<br /><br />Если запрос отправляли не Вы, проигнорируйте это письмо.<br /><br /><strong>Вступайте в наши группы:<br /><br /></strong><a href=\"http://vk.com/club15177821\"><img src=\"/uploads/images/1c98a1cd343c6846e2b67caed1290903.png\" alt=\"vk\" width=\"30\" height=\"30\" />&nbsp;группа вконтакте</a>&nbsp;&nbsp;<a href=\"http://www.odnoklassniki.ru/group/51930802880704\"><img src=\"/uploads/images/74f81f9f7e1c2aa940a7b607bb48068c.png\" alt=\"odn\" width=\"30\" height=\"30\" />&nbsp; группа в одноклассниках</a>&nbsp;<br /><br /><br /><br /><strong>С уважением, команда Style of Life Academy</strong><br />','2014-10-26 22:04:59','2014-10-26 22:04:59'),(10,'password_recovery','Доброго времени суток, Рогов Вася Рогов.<br /><br />Вы запросили воcстановление пароля на сайте Style of life Academy.<br />Перейдите по <a href=\'http://dev.2/auth/recover?hash=6d69f27340c058e7d903fb111eef5fff\'>ссылке</a> для установки нового пароля.<br /><br />Если запрос отправляли не Вы, проигнорируйте это письмо.<br /><br /><strong>Вступайте в наши группы:<br /><br /></strong><a href=\"http://vk.com/club15177821\"><img src=\"/uploads/images/1c98a1cd343c6846e2b67caed1290903.png\" alt=\"vk\" width=\"30\" height=\"30\" />&nbsp;группа вконтакте</a>&nbsp;&nbsp;<a href=\"http://www.odnoklassniki.ru/group/51930802880704\"><img src=\"/uploads/images/74f81f9f7e1c2aa940a7b607bb48068c.png\" alt=\"odn\" width=\"30\" height=\"30\" />&nbsp; группа в одноклассниках</a>&nbsp;<br /><br /><br /><br /><strong>С уважением, команда Style of Life Academy</strong><br />',NULL,'Доброго времени суток, Рогов Вася Рогов.<br /><br />Вы запросили воcстановление пароля на сайте Style of life Academy.<br />Перейдите по <a href=\'http://dev.2/auth/recover?hash=6d69f27340c058e7d903fb111eef5fff\'>ссылке</a> для установки нового пароля.<br /><br />Если запрос отправляли не Вы, проигнорируйте это письмо.<br /><br /><strong>Вступайте в наши группы:<br /><br /></strong><a href=\"http://vk.com/club15177821\"><img src=\"/uploads/images/1c98a1cd343c6846e2b67caed1290903.png\" alt=\"vk\" width=\"30\" height=\"30\" />&nbsp;группа вконтакте</a>&nbsp;&nbsp;<a href=\"http://www.odnoklassniki.ru/group/51930802880704\"><img src=\"/uploads/images/74f81f9f7e1c2aa940a7b607bb48068c.png\" alt=\"odn\" width=\"30\" height=\"30\" />&nbsp; группа в одноклассниках</a>&nbsp;<br /><br /><br /><br /><strong>С уважением, команда Style of Life Academy</strong><br />','2014-10-26 22:27:40','2014-10-26 22:27:40'),(11,'password_recovery','Доброго времени суток, Рогов Вася Рогов.<br /><br />Вы запросили воcстановление пароля на сайте Style of life Academy.<br />Перейдите по <a href=\'http://dev.2/auth/recover?hash=f527c27649724459da3214e70cb35e44\'>ссылке</a> для установки нового пароля.<br /><br />Если запрос отправляли не Вы, проигнорируйте это письмо.<br /><br /><strong>Вступайте в наши группы:<br /><br /></strong><a href=\"http://vk.com/club15177821\"><img src=\"/uploads/images/1c98a1cd343c6846e2b67caed1290903.png\" alt=\"vk\" width=\"30\" height=\"30\" />&nbsp;группа вконтакте</a>&nbsp;&nbsp;<a href=\"http://www.odnoklassniki.ru/group/51930802880704\"><img src=\"/uploads/images/74f81f9f7e1c2aa940a7b607bb48068c.png\" alt=\"odn\" width=\"30\" height=\"30\" />&nbsp; группа в одноклассниках</a>&nbsp;<br /><br /><br /><br /><strong>С уважением, команда Style of Life Academy</strong><br />',NULL,'Доброго времени суток, Рогов Вася Рогов.<br /><br />Вы запросили воcстановление пароля на сайте Style of life Academy.<br />Перейдите по <a href=\'http://dev.2/auth/recover?hash=f527c27649724459da3214e70cb35e44\'>ссылке</a> для установки нового пароля.<br /><br />Если запрос отправляли не Вы, проигнорируйте это письмо.<br /><br /><strong>Вступайте в наши группы:<br /><br /></strong><a href=\"http://vk.com/club15177821\"><img src=\"/uploads/images/1c98a1cd343c6846e2b67caed1290903.png\" alt=\"vk\" width=\"30\" height=\"30\" />&nbsp;группа вконтакте</a>&nbsp;&nbsp;<a href=\"http://www.odnoklassniki.ru/group/51930802880704\"><img src=\"/uploads/images/74f81f9f7e1c2aa940a7b607bb48068c.png\" alt=\"odn\" width=\"30\" height=\"30\" />&nbsp; группа в одноклассниках</a>&nbsp;<br /><br /><br /><br /><strong>С уважением, команда Style of Life Academy</strong><br />','2014-10-28 11:10:23','2014-10-28 11:10:23'),(12,'password_recovery','Доброго времени суток, Рогов Вася Рогов.<br /><br />Вы запросили воcстановление пароля на сайте Style of life Academy.<br />Перейдите по <a href=\'http://dev.2/auth/recover?hash=a1ddd7696b96008abc207a575e1aec04\'>ссылке</a> для установки нового пароля.<br /><br />Если запрос отправляли не Вы, проигнорируйте это письмо.<br /><br /><strong>Вступайте в наши группы:<br /><br /></strong><a href=\"http://vk.com/club15177821\"><img src=\"/uploads/images/1c98a1cd343c6846e2b67caed1290903.png\" alt=\"vk\" width=\"30\" height=\"30\" />&nbsp;группа вконтакте</a>&nbsp;&nbsp;<a href=\"http://www.odnoklassniki.ru/group/51930802880704\"><img src=\"/uploads/images/74f81f9f7e1c2aa940a7b607bb48068c.png\" alt=\"odn\" width=\"30\" height=\"30\" />&nbsp; группа в одноклассниках</a>&nbsp;<br /><br /><br /><br /><strong>С уважением, команда Style of Life Academy</strong><br />',NULL,'Доброго времени суток, Рогов Вася Рогов.<br /><br />Вы запросили воcстановление пароля на сайте Style of life Academy.<br />Перейдите по <a href=\'http://dev.2/auth/recover?hash=a1ddd7696b96008abc207a575e1aec04\'>ссылке</a> для установки нового пароля.<br /><br />Если запрос отправляли не Вы, проигнорируйте это письмо.<br /><br /><strong>Вступайте в наши группы:<br /><br /></strong><a href=\"http://vk.com/club15177821\"><img src=\"/uploads/images/1c98a1cd343c6846e2b67caed1290903.png\" alt=\"vk\" width=\"30\" height=\"30\" />&nbsp;группа вконтакте</a>&nbsp;&nbsp;<a href=\"http://www.odnoklassniki.ru/group/51930802880704\"><img src=\"/uploads/images/74f81f9f7e1c2aa940a7b607bb48068c.png\" alt=\"odn\" width=\"30\" height=\"30\" />&nbsp; группа в одноклассниках</a>&nbsp;<br /><br /><br /><br /><strong>С уважением, команда Style of Life Academy</strong><br />','2014-10-28 11:11:17','2014-10-28 11:11:17'),(13,'contactus_message','','','','2014-10-28 13:13:18','2014-10-28 13:13:18'),(14,'contactus_message','Некто Алексей отправил сообщение.<br />Текст: Тест<br />Email: alex@web375.org','Некто Алексей отправил сообщение.<br />Текст: Тест<br />Email: alex@web375.org','Уважаемый Алексей! Спасибо за Ваше сообщение! Оно очень важно для нас!','2014-10-28 13:20:05','2014-10-28 13:20:05'),(15,'password_recovery','Доброго времени суток, {% full_name%} Вы запросили воcстановление пароля на сайте Стиль жизни Academy.Перейдите по {% LINK%} для установки нового пароля.Если запрос отправляли не Вы, проигнорируйте это письмо.Вступайте в наши группы:. & NBSP; группа вконтакте и NBSP; & NBSP; & NBSP; группа в одноклассниках и NBSP; С уважением, команда Стиль Жизни академии',NULL,'Доброго времени суток, {% full_name%} Вы запросили воcстановление пароля на сайте Стиль жизни Academy.Перейдите по {% LINK%} для установки нового пароля.Если запрос отправляли не Вы, проигнорируйте это письмо.Вступайте в наши группы:. & NBSP; группа вконтакте и NBSP; & NBSP; & NBSP; группа в одноклассниках и NBSP; С уважением, команда Стиль Жизни академии','2014-10-28 14:57:29','2014-10-28 14:57:29'),(16,'password_recovery','Доброго времени суток, test Test test Вы запросили воcстановление пароля на сайте Dev2.Перейдите по <a href=\'http://dev.2/auth/recover?hash=92f8ebca8e2f0627cdf0607f4a4fa88a\'>ссылке</a> для установки нового пароля.Если запрос отправляли не Вы, проигнорируйте это письмо.',NULL,'Доброго времени суток, test Test test Вы запросили воcстановление пароля на сайте Dev2.Перейдите по <a href=\'http://dev.2/auth/recover?hash=92f8ebca8e2f0627cdf0607f4a4fa88a\'>ссылке</a> для установки нового пароля.Если запрос отправляли не Вы, проигнорируйте это письмо.','2014-10-28 15:06:38','2014-10-28 15:06:38');
/*!40000 ALTER TABLE `site_event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `site_message`
--

DROP TABLE IF EXISTS `site_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `site_message` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `phone_number` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `company_name` varchar(255) DEFAULT NULL,
  `message` text,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `attach` varchar(255) DEFAULT NULL,
  `attach_name` varchar(255) DEFAULT NULL,
  `attach_mime` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `site_message`
--

LOCK TABLES `site_message` WRITE;
/*!40000 ALTER TABLE `site_message` DISABLE KEYS */;
INSERT INTO `site_message` (`id`, `type`, `name`, `phone_number`, `email`, `company_name`, `message`, `created_at`, `updated_at`, `attach`, `attach_name`, `attach_mime`) VALUES (1,NULL,'Вальдемар',NULL,'alexey.mail@mail.com',NULL,'test','2013-09-10 12:03:39','2013-09-10 12:03:39',NULL,NULL,NULL),(2,NULL,'Алексей',NULL,'alexey.radyuk@gmail.com',NULL,'Привет, парень!','2014-10-28 13:13:14','2014-10-28 13:13:14',NULL,NULL,NULL),(3,NULL,'Алексей',NULL,'alex@web375.org',NULL,'Тест','2014-10-28 13:20:02','2014-10-28 13:20:02',NULL,NULL,NULL);
/*!40000 ALTER TABLE `site_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `site_visit`
--

DROP TABLE IF EXISTS `site_visit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `site_visit` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ip_address` varchar(32) DEFAULT NULL,
  `country` varchar(32) DEFAULT NULL,
  `user_agent` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id_idx` (`user_id`),
  CONSTRAINT `site_visit_user_id_sf_guard_user_id` FOREIGN KEY (`user_id`) REFERENCES `sf_guard_user` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `site_visit`
--

LOCK TABLES `site_visit` WRITE;
/*!40000 ALTER TABLE `site_visit` DISABLE KEYS */;
INSERT INTO `site_visit` (`id`, `ip_address`, `country`, `user_agent`, `user_id`, `created_at`, `updated_at`) VALUES (1,'127.0.0.1',NULL,'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:23.0) Gecko/20100101 Firefox/23.0',NULL,'2013-09-10 16:12:03','2013-09-10 16:12:03'),(2,'127.0.0.1',NULL,'Mozilla/5.0 (compatible; MSIE 10.0; Windows NT 6.1; WOW64; Trident/6.0)',NULL,'2013-09-10 17:18:55','2013-09-10 17:18:55'),(3,'127.0.0.1',NULL,'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:23.0) Gecko/20100101 Firefox/23.0',NULL,'2013-09-11 12:58:16','2013-09-11 12:58:16'),(4,'127.0.0.1',NULL,'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:23.0) Gecko/20100101 Firefox/23.0',NULL,'2013-09-12 13:43:47','2013-09-12 13:43:47'),(5,'127.0.0.1',NULL,'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:23.0) Gecko/20100101 Firefox/23.0',NULL,'2013-09-14 15:08:43','2013-09-14 15:08:43'),(6,'127.0.0.1',NULL,'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:23.0) Gecko/20100101 Firefox/23.0',NULL,'2013-09-14 15:10:12','2013-09-14 15:10:12'),(7,'127.0.0.1',NULL,'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:23.0) Gecko/20100101 Firefox/23.0',NULL,'2013-09-14 15:10:38','2013-09-14 15:10:38'),(8,'127.0.0.1',NULL,'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:23.0) Gecko/20100101 Firefox/23.0',NULL,'2013-09-14 15:12:40','2013-09-14 15:12:40'),(9,'127.0.0.1',NULL,'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:23.0) Gecko/20100101 Firefox/23.0',NULL,'2013-09-23 12:06:47','2013-09-23 12:06:47'),(10,'127.0.0.1',NULL,'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:24.0) Gecko/20100101 Firefox/24.0',NULL,'2013-10-12 17:20:47','2013-10-12 17:20:47'),(11,'127.0.0.1',NULL,'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:26.0) Gecko/20100101 Firefox/26.0',NULL,'2014-01-07 00:57:30','2014-01-07 00:57:30'),(12,'127.0.0.1',NULL,'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:26.0) Gecko/20100101 Firefox/26.0',NULL,'2014-01-07 18:54:18','2014-01-07 18:54:18'),(13,'127.0.0.1',NULL,'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:32.0) Gecko/20100101 Firefox/32.0',NULL,'2014-10-24 21:16:52','2014-10-24 21:16:52'),(14,'127.0.0.1',NULL,'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:32.0) Gecko/20100101 Firefox/32.0',1,'2014-10-25 12:38:02','2014-10-26 16:53:04'),(15,'127.0.0.1',NULL,'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:32.0) Gecko/20100101 Firefox/32.0',3,'2014-10-26 21:56:34','2014-10-26 22:10:59'),(16,'192.168.1.3',NULL,'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:32.0) Gecko/20100101 Firefox/32.0',4,'2014-10-26 21:59:36','2014-10-26 22:28:08'),(17,'192.168.1.3',NULL,'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:32.0) Gecko/20100101 Firefox/32.0',NULL,'2014-10-26 23:07:09','2014-10-26 23:07:09'),(18,'127.0.0.1',NULL,'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:32.0) Gecko/20100101 Firefox/32.0',1,'2014-10-27 13:24:45','2014-10-27 13:24:45'),(19,'127.0.0.1',NULL,'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:32.0) Gecko/20100101 Firefox/32.0',1,'2014-10-28 10:33:06','2014-10-28 17:46:15'),(20,'127.0.0.1',NULL,'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:32.0) Gecko/20100101 Firefox/32.0',1,'2014-10-29 11:18:46','2014-10-29 11:18:46'),(21,'127.0.0.1',NULL,'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:32.0) Gecko/20100101 Firefox/32.0',5,'2014-10-29 15:30:22','2014-10-29 15:30:22'),(22,'127.0.0.1',NULL,'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:32.0) Gecko/20100101 Firefox/32.0',5,'2014-10-31 13:48:03','2014-10-31 14:30:50');
/*!40000 ALTER TABLE `site_visit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `site_visit_page`
--

DROP TABLE IF EXISTS `site_visit_page`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `site_visit_page` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `site_visit_id` bigint(20) NOT NULL,
  `url` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `site_visit_id_idx` (`site_visit_id`),
  CONSTRAINT `site_visit_page_site_visit_id_site_visit_id` FOREIGN KEY (`site_visit_id`) REFERENCES `site_visit` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=476 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `site_visit_page`
--

LOCK TABLES `site_visit_page` WRITE;
/*!40000 ALTER TABLE `site_visit_page` DISABLE KEYS */;
INSERT INTO `site_visit_page` (`id`, `site_visit_id`, `url`, `created_at`, `updated_at`) VALUES (1,1,'/frontend_dev.php/page/o-proekte','2013-09-10 16:13:39','2013-09-10 16:13:39'),(2,1,'/frontend_dev.php/','2013-09-10 16:13:59','2013-09-10 16:13:59'),(3,1,'/','2013-09-10 16:14:11','2013-09-10 16:14:11'),(4,1,'/contactus','2013-09-10 16:14:18','2013-09-10 16:14:18'),(5,1,'/captcha?1378818859','2013-09-10 16:14:19','2013-09-10 16:14:19'),(6,1,'/','2013-09-10 16:32:36','2013-09-10 16:32:36'),(7,1,'/contactus','2013-09-10 16:32:52','2013-09-10 16:32:52'),(8,2,'/','2013-09-10 17:18:56','2013-09-10 17:18:56'),(9,2,'/page/o-proekte','2013-09-10 17:20:51','2013-09-10 17:20:51'),(10,2,'/contactus','2013-09-10 17:20:55','2013-09-10 17:20:55'),(11,2,'/auth/signin','2013-09-10 17:21:00','2013-09-10 17:21:00'),(12,2,'/','2013-09-10 17:21:04','2013-09-10 17:21:04'),(13,2,'/page/o-proekte','2013-09-10 17:21:06','2013-09-10 17:21:06'),(14,2,'/','2013-09-10 17:21:17','2013-09-10 17:21:17'),(15,3,'/frontend_dev.php','2013-09-11 12:58:16','2013-09-11 12:58:16'),(16,3,'/frontend_dev.php','2013-09-11 15:29:09','2013-09-11 15:29:09'),(17,3,'/frontend_dev.php/auth/signin','2013-09-11 15:29:17','2013-09-11 15:29:17'),(18,3,'/frontend_dev.php','2013-09-11 15:29:24','2013-09-11 15:29:24'),(19,3,'/frontend_dev.php/usage','2013-09-11 15:39:02','2013-09-11 15:39:02'),(20,3,'/frontend_dev.php/usage','2013-09-11 15:53:10','2013-09-11 15:53:10'),(21,3,'/frontend_dev.php/usage','2013-09-11 15:55:17','2013-09-11 15:55:17'),(22,3,'/frontend_dev.php/usage/new','2013-09-11 15:55:29','2013-09-11 15:55:29'),(23,3,'/frontend_dev.php/usage','2013-09-11 16:04:12','2013-09-11 16:04:12'),(24,3,'/frontend_dev.php/usage/new','2013-09-11 16:04:19','2013-09-11 16:04:19'),(25,3,'/frontend_dev.php/usage/edit/id/1','2013-09-11 16:05:30','2013-09-11 16:05:30'),(26,3,'/frontend_dev.php/usage','2013-09-11 16:06:05','2013-09-11 16:06:05'),(27,3,'/frontend_dev.php/usage','2013-09-11 16:13:23','2013-09-11 16:13:23'),(28,3,'/','2013-09-11 19:05:07','2013-09-11 19:05:07'),(29,3,'/auth/signin','2013-09-11 19:05:10','2013-09-11 19:05:10'),(30,3,'/','2013-09-11 19:05:19','2013-09-11 19:05:19'),(31,3,'/usage','2013-09-11 19:05:20','2013-09-11 19:05:20'),(32,3,'/contactus','2013-09-11 19:05:39','2013-09-11 19:05:39'),(33,3,'/page/o-proekte','2013-09-11 19:05:42','2013-09-11 19:05:42'),(34,3,'/','2013-09-11 19:05:46','2013-09-11 19:05:46'),(35,3,'/usage','2013-09-11 19:05:48','2013-09-11 19:05:48'),(36,4,'/','2013-09-12 13:43:47','2013-09-12 13:43:47'),(37,4,'/contactus','2013-09-12 13:44:44','2013-09-12 13:44:44'),(38,4,'/frontend_dev.php/contactus','2013-09-12 13:46:16','2013-09-12 13:46:16'),(39,4,'/frontend_dev.php/contactus','2013-09-12 13:47:45','2013-09-12 13:47:45'),(40,4,'/frontend_dev.php/page/o-proekte','2013-09-12 13:47:58','2013-09-12 13:47:58'),(41,4,'/frontend_dev.php/','2013-09-12 13:48:02','2013-09-12 13:48:02'),(42,4,'/frontend_dev.php/','2013-09-12 13:48:23','2013-09-12 13:48:23'),(43,4,'/frontend_dev.php/auth/signin','2013-09-12 13:48:34','2013-09-12 13:48:34'),(44,4,'/frontend_dev.php/auth/signin','2013-09-12 13:48:59','2013-09-12 13:48:59'),(45,4,'/frontend_dev.php/','2013-09-12 13:49:07','2013-09-12 13:49:07'),(46,4,'/frontend_dev.php/usage','2013-09-12 13:49:27','2013-09-12 13:49:27'),(47,4,'/frontend_dev.php/usage','2013-09-12 13:50:52','2013-09-12 13:50:52'),(48,4,'/frontend_dev.php/','2013-09-12 13:51:05','2013-09-12 13:51:05'),(49,4,'/frontend_dev.php/usage','2013-09-12 13:51:47','2013-09-12 13:51:47'),(50,4,'/frontend_dev.php/contactus','2013-09-12 14:02:13','2013-09-12 14:02:13'),(51,4,'/frontend_dev.php/contactus','2013-09-12 14:03:50','2013-09-12 14:03:50'),(52,4,'/frontend_dev.php/contactus','2013-09-12 14:04:32','2013-09-12 14:04:32'),(53,4,'/frontend_dev.php/usage','2013-09-12 14:04:37','2013-09-12 14:04:37'),(54,4,'/frontend_dev.php/usage/new','2013-09-12 14:08:50','2013-09-12 14:08:50'),(55,4,'/frontend_dev.php/usage','2013-09-12 14:08:58','2013-09-12 14:08:58'),(56,4,'/frontend_dev.php/usage','2013-09-12 14:09:44','2013-09-12 14:09:44'),(57,4,'/frontend_dev.php/usage/new','2013-09-12 14:09:46','2013-09-12 14:09:46'),(58,4,'/frontend_dev.php/usage','2013-09-12 14:09:52','2013-09-12 14:09:52'),(59,4,'/frontend_dev.php/usage','2013-09-12 14:10:24','2013-09-12 14:10:24'),(60,4,'/frontend_dev.php/usage','2013-09-12 14:12:02','2013-09-12 14:12:02'),(61,4,'/frontend_dev.php/usage','2013-09-12 14:13:07','2013-09-12 14:13:07'),(62,4,'/frontend_dev.php/usage/new','2013-09-12 14:13:10','2013-09-12 14:13:10'),(63,4,'/frontend_dev.php/usage','2013-09-12 14:13:17','2013-09-12 14:13:17'),(64,4,'/frontend_dev.php/usage','2013-09-12 14:13:40','2013-09-12 14:13:40'),(65,4,'/frontend_dev.php/usage/new','2013-09-12 14:13:45','2013-09-12 14:13:45'),(66,4,'/frontend_dev.php/usage','2013-09-12 14:13:48','2013-09-12 14:13:48'),(67,4,'/frontend_dev.php/usage','2013-09-12 14:14:01','2013-09-12 14:14:01'),(68,4,'/frontend_dev.php/usage/new','2013-09-12 14:14:06','2013-09-12 14:14:06'),(69,4,'/frontend_dev.php/usage','2013-09-12 14:14:08','2013-09-12 14:14:08'),(70,4,'/frontend_dev.php/usage','2013-09-12 14:14:17','2013-09-12 14:14:17'),(71,4,'/frontend_dev.php/usage','2013-09-12 14:14:38','2013-09-12 14:14:38'),(72,4,'/frontend_dev.php/usage','2013-09-12 14:14:46','2013-09-12 14:14:46'),(73,4,'/frontend_dev.php/usage','2013-09-12 14:15:51','2013-09-12 14:15:51'),(74,4,'/frontend_dev.php/usage','2013-09-12 14:15:55','2013-09-12 14:15:55'),(75,4,'/frontend_dev.php/usage','2013-09-12 14:16:51','2013-09-12 14:16:51'),(76,4,'/frontend_dev.php/usage','2013-09-12 14:19:25','2013-09-12 14:19:25'),(77,4,'/frontend_dev.php/usage','2013-09-12 14:19:31','2013-09-12 14:19:31'),(78,4,'/frontend_dev.php/usage','2013-09-12 14:19:57','2013-09-12 14:19:57'),(79,4,'/frontend_dev.php/usage','2013-09-12 14:20:32','2013-09-12 14:20:32'),(80,4,'/frontend_dev.php/usage','2013-09-12 15:01:11','2013-09-12 15:01:11'),(81,4,'/frontend_dev.php/usage','2013-09-12 15:11:40','2013-09-12 15:11:40'),(82,4,'/frontend_dev.php/usage','2013-09-12 15:11:59','2013-09-12 15:11:59'),(83,4,'/frontend_dev.php/usage','2013-09-12 15:12:07','2013-09-12 15:12:07'),(84,4,'/frontend_dev.php/usage','2013-09-12 15:12:53','2013-09-12 15:12:53'),(85,4,'/frontend_dev.php/usage','2013-09-12 15:13:28','2013-09-12 15:13:28'),(86,4,'/frontend_dev.php/usage','2013-09-12 15:14:33','2013-09-12 15:14:33'),(87,4,'/frontend_dev.php/usage','2013-09-12 15:14:43','2013-09-12 15:14:43'),(88,4,'/frontend_dev.php/usage','2013-09-12 15:14:55','2013-09-12 15:14:55'),(89,4,'/frontend_dev.php/usage','2013-09-12 15:15:18','2013-09-12 15:15:18'),(90,4,'/frontend_dev.php/usage','2013-09-12 15:15:41','2013-09-12 15:15:41'),(91,4,'/frontend_dev.php/usage','2013-09-12 15:15:46','2013-09-12 15:15:46'),(92,4,'/frontend_dev.php/usage','2013-09-12 15:16:00','2013-09-12 15:16:00'),(93,4,'/frontend_dev.php/usage','2013-09-12 15:16:11','2013-09-12 15:16:11'),(94,4,'/frontend_dev.php/usage','2013-09-12 15:18:12','2013-09-12 15:18:12'),(95,4,'/frontend_dev.php/usage','2013-09-12 15:23:24','2013-09-12 15:23:24'),(96,4,'/frontend_dev.php/usage','2013-09-12 15:24:27','2013-09-12 15:24:27'),(97,4,'/frontend_dev.php/usage','2013-09-12 15:25:17','2013-09-12 15:25:17'),(98,4,'/frontend_dev.php/usage','2013-09-12 15:25:36','2013-09-12 15:25:36'),(99,4,'/frontend_dev.php/usage','2013-09-12 15:25:51','2013-09-12 15:25:51'),(100,5,'/','2013-09-14 15:08:43','2013-09-14 15:08:43'),(101,6,'/frontend_dev.php/usage','2013-09-14 15:10:12','2013-09-14 15:10:12'),(102,7,'/frontend_dev.php/usage','2013-09-14 15:10:38','2013-09-14 15:10:38'),(103,8,'/frontend_dev.php/usage','2013-09-14 15:12:40','2013-09-14 15:12:40'),(104,8,'/frontend_dev.php/usage','2013-09-14 15:13:21','2013-09-14 15:13:21'),(105,8,'/frontend_dev.php/usage','2013-09-14 15:15:30','2013-09-14 15:15:30'),(106,8,'/frontend_dev.php/usage','2013-09-14 15:16:57','2013-09-14 15:16:57'),(107,8,'/frontend_dev.php/usage','2013-09-14 15:18:51','2013-09-14 15:18:51'),(108,8,'/frontend_dev.php/contactus','2013-09-14 15:19:16','2013-09-14 15:19:16'),(109,8,'/frontend_dev.php/contactus','2013-09-14 15:20:25','2013-09-14 15:20:25'),(110,8,'/frontend_dev.php/profile','2013-09-14 15:22:00','2013-09-14 15:22:00'),(111,8,'/frontend_dev.php/profile','2013-09-14 15:25:41','2013-09-14 15:25:41'),(112,8,'/frontend_dev.php/profile','2013-09-14 15:27:31','2013-09-14 15:27:31'),(113,8,'/frontend_dev.php/profile','2013-09-14 15:27:53','2013-09-14 15:27:53'),(114,8,'/frontend_dev.php/contactus','2013-09-14 15:28:03','2013-09-14 15:28:03'),(115,8,'/frontend_dev.php/contactus','2013-09-14 15:29:42','2013-09-14 15:29:42'),(116,8,'/frontend_dev.php/profile','2013-09-14 15:29:46','2013-09-14 15:29:46'),(117,8,'/frontend_dev.php/profile','2013-09-14 15:30:12','2013-09-14 15:30:12'),(118,8,'/frontend_dev.php/usage','2013-09-14 15:30:18','2013-09-14 15:30:18'),(119,8,'/frontend_dev.php/usage','2013-09-14 15:30:43','2013-09-14 15:30:43'),(120,8,'/frontend_dev.php/usage','2013-09-14 15:30:50','2013-09-14 15:30:50'),(121,8,'/frontend_dev.php/usage','2013-09-14 15:31:23','2013-09-14 15:31:23'),(122,8,'/frontend_dev.php/usage','2013-09-14 15:31:40','2013-09-14 15:31:40'),(123,8,'/frontend_dev.php/contactus','2013-09-14 15:32:44','2013-09-14 15:32:44'),(124,8,'/frontend_dev.php/usage','2013-09-14 15:32:47','2013-09-14 15:32:47'),(125,8,'/frontend_dev.php/profile','2013-09-14 15:32:50','2013-09-14 15:32:50'),(126,8,'/frontend_dev.php/profile','2013-09-14 15:33:32','2013-09-14 15:33:32'),(127,8,'/frontend_dev.php/usage','2013-09-14 15:33:40','2013-09-14 15:33:40'),(128,8,'/frontend_dev.php/contactus','2013-09-14 15:33:50','2013-09-14 15:33:50'),(129,8,'/frontend_dev.php/page/o-proekte','2013-09-14 15:33:54','2013-09-14 15:33:54'),(130,8,'/frontend_dev.php/usage','2013-09-14 15:33:56','2013-09-14 15:33:56'),(131,8,'/frontend_dev.php/','2013-09-14 15:33:57','2013-09-14 15:33:57'),(132,8,'/frontend_dev.php/usage','2013-09-14 15:34:06','2013-09-14 15:34:06'),(133,8,'/frontend_dev.php/usage','2013-09-14 15:34:51','2013-09-14 15:34:51'),(134,8,'/frontend_dev.php/usage','2013-09-14 15:35:22','2013-09-14 15:35:22'),(135,8,'/frontend_dev.php/usage','2013-09-14 15:35:36','2013-09-14 15:35:36'),(136,8,'/frontend_dev.php/profile','2013-09-14 15:35:44','2013-09-14 15:35:44'),(137,8,'/frontend_dev.php/profile','2013-09-14 15:35:53','2013-09-14 15:35:53'),(138,8,'/frontend_dev.php/','2013-09-14 15:35:58','2013-09-14 15:35:58'),(139,8,'/frontend_dev.php/usage','2013-09-14 15:37:28','2013-09-14 15:37:28'),(140,9,'/','2013-09-23 12:06:48','2013-09-23 12:06:48'),(141,10,'/','2013-10-12 17:20:47','2013-10-12 17:20:47'),(142,10,'/auth/signin','2013-10-12 17:20:59','2013-10-12 17:20:59'),(143,10,'/contactus','2013-10-12 17:21:18','2013-10-12 17:21:18'),(144,10,'/register','2013-10-12 17:24:00','2013-10-12 17:24:00'),(145,10,'/register','2013-10-12 17:26:07','2013-10-12 17:26:07'),(146,10,'/register','2013-10-12 17:37:53','2013-10-12 17:37:53'),(147,10,'/register','2013-10-12 17:39:44','2013-10-12 17:39:44'),(148,10,'/register','2013-10-12 17:39:54','2013-10-12 17:39:54'),(149,10,'/register','2013-10-12 17:41:50','2013-10-12 17:41:50'),(150,10,'/register','2013-10-12 17:42:02','2013-10-12 17:42:02'),(151,10,'/register','2013-10-12 17:44:36','2013-10-12 17:44:36'),(152,10,'/register','2013-10-12 17:44:55','2013-10-12 17:44:55'),(153,10,'/register','2013-10-12 17:44:57','2013-10-12 17:44:57'),(154,10,'/register','2013-10-12 17:49:33','2013-10-12 17:49:33'),(155,10,'/register','2013-10-12 17:49:43','2013-10-12 17:49:43'),(156,10,'/register','2013-10-12 17:53:12','2013-10-12 17:53:12'),(157,10,'/register','2013-10-12 17:56:18','2013-10-12 17:56:18'),(158,10,'/register','2013-10-12 17:56:50','2013-10-12 17:56:50'),(159,10,'/register','2013-10-12 17:56:57','2013-10-12 17:56:57'),(160,10,'/register','2013-10-12 17:58:11','2013-10-12 17:58:11'),(161,10,'/register','2013-10-12 17:58:40','2013-10-12 17:58:40'),(162,10,'/register','2013-10-12 17:59:41','2013-10-12 17:59:41'),(163,10,'/register','2013-10-12 18:01:16','2013-10-12 18:01:16'),(164,10,'/register','2013-10-12 18:02:29','2013-10-12 18:02:29'),(165,10,'/register','2013-10-12 18:02:47','2013-10-12 18:02:47'),(166,10,'/frontend_dev.php/register','2013-10-12 18:31:08','2013-10-12 18:31:08'),(167,10,'/frontend_dev.php/register','2013-10-12 18:31:41','2013-10-12 18:31:41'),(168,10,'/frontend_dev.php/register','2013-10-12 18:31:53','2013-10-12 18:31:53'),(169,10,'/frontend_dev.php/register','2013-10-12 18:32:17','2013-10-12 18:32:17'),(170,10,'/frontend_dev.php/register','2013-10-12 18:32:44','2013-10-12 18:32:44'),(171,10,'/frontend_dev.php/register','2013-10-12 18:33:19','2013-10-12 18:33:19'),(172,10,'/frontend_dev.php/register','2013-10-12 18:36:36','2013-10-12 18:36:36'),(173,10,'/frontend_dev.php/register','2013-10-12 18:36:49','2013-10-12 18:36:49'),(174,10,'/frontend_dev.php/register','2013-10-12 18:37:03','2013-10-12 18:37:03'),(175,10,'/frontend_dev.php/register','2013-10-12 18:37:11','2013-10-12 18:37:11'),(176,10,'/frontend_dev.php/register','2013-10-12 18:37:32','2013-10-12 18:37:32'),(177,10,'/frontend_dev.php/register','2013-10-12 18:38:03','2013-10-12 18:38:03'),(178,10,'/frontend_dev.php/register','2013-10-12 18:41:03','2013-10-12 18:41:03'),(179,10,'/frontend_dev.php/register','2013-10-12 18:41:31','2013-10-12 18:41:31'),(180,10,'/frontend_dev.php/register','2013-10-12 18:42:12','2013-10-12 18:42:12'),(181,10,'/frontend_dev.php/register','2013-10-12 18:42:29','2013-10-12 18:42:29'),(182,10,'/frontend_dev.php/register','2013-10-12 18:42:57','2013-10-12 18:42:57'),(183,10,'/frontend_dev.php/register','2013-10-12 18:43:18','2013-10-12 18:43:18'),(184,10,'/frontend_dev.php/register','2013-10-12 18:43:26','2013-10-12 18:43:26'),(185,10,'/frontend_dev.php/register','2013-10-12 18:43:31','2013-10-12 18:43:31'),(186,10,'/frontend_dev.php/register','2013-10-12 19:31:25','2013-10-12 19:31:25'),(187,10,'/frontend_dev.php/register','2013-10-12 19:53:02','2013-10-12 19:53:02'),(188,10,'/frontend_dev.php/register','2013-10-12 19:55:24','2013-10-12 19:55:24'),(189,11,'/','2014-01-07 00:57:30','2014-01-07 00:57:30'),(190,12,'/','2014-01-07 18:54:19','2014-01-07 18:54:19'),(191,13,'/','2014-10-24 21:16:52','2014-10-24 21:16:52'),(192,13,'/','2014-10-24 22:14:20','2014-10-24 22:14:20'),(193,14,'/','2014-10-25 12:38:02','2014-10-25 12:38:02'),(194,14,'/','2014-10-25 12:41:19','2014-10-25 12:41:19'),(195,14,'/','2014-10-25 12:42:14','2014-10-25 12:42:14'),(196,14,'/','2014-10-25 12:46:41','2014-10-25 12:46:41'),(197,14,'/','2014-10-25 12:50:15','2014-10-25 12:50:15'),(198,14,'/','2014-10-25 12:50:36','2014-10-25 12:50:36'),(199,14,'/auth/signin','2014-10-26 12:15:57','2014-10-26 12:15:57'),(200,14,'/','2014-10-26 12:16:05','2014-10-26 12:16:05'),(201,14,'/auth/signin','2014-10-26 12:54:54','2014-10-26 12:54:54'),(202,14,'/frontend_dev.php/auth/register','2014-10-26 13:06:20','2014-10-26 13:06:20'),(203,14,'/frontend_dev.php/auth/register','2014-10-26 13:07:53','2014-10-26 13:07:53'),(204,14,'/frontend_dev.php/auth/register','2014-10-26 13:08:16','2014-10-26 13:08:16'),(205,14,'/frontend_dev.php/auth/register','2014-10-26 15:00:12','2014-10-26 15:00:12'),(206,14,'/frontend_dev.php/auth/register','2014-10-26 15:00:57','2014-10-26 15:00:57'),(207,14,'/frontend_dev.php/auth/register','2014-10-26 15:02:23','2014-10-26 15:02:23'),(208,14,'/frontend_dev.php/auth/register','2014-10-26 15:03:04','2014-10-26 15:03:04'),(209,14,'/frontend_dev.php/auth/register','2014-10-26 15:04:38','2014-10-26 15:04:38'),(210,14,'/frontend_dev.php/auth/register','2014-10-26 15:05:09','2014-10-26 15:05:09'),(211,14,'/frontend_dev.php/auth/register','2014-10-26 15:07:01','2014-10-26 15:07:01'),(212,14,'/frontend_dev.php/auth/register','2014-10-26 15:07:26','2014-10-26 15:07:26'),(213,14,'/frontend_dev.php/auth/register','2014-10-26 15:09:02','2014-10-26 15:09:02'),(214,14,'/frontend_dev.php/auth/register','2014-10-26 15:10:35','2014-10-26 15:10:35'),(215,14,'/frontend_dev.php/auth/register','2014-10-26 15:11:04','2014-10-26 15:11:04'),(216,14,'/frontend_dev.php/auth/register','2014-10-26 15:11:23','2014-10-26 15:11:23'),(217,14,'/frontend_dev.php/auth/register','2014-10-26 15:12:03','2014-10-26 15:12:03'),(218,14,'/frontend_dev.php/auth/register','2014-10-26 15:12:33','2014-10-26 15:12:33'),(219,14,'/frontend_dev.php/auth/register','2014-10-26 15:13:32','2014-10-26 15:13:32'),(220,14,'/frontend_dev.php/auth/register','2014-10-26 15:13:43','2014-10-26 15:13:43'),(221,14,'/frontend_dev.php/auth/register','2014-10-26 15:16:23','2014-10-26 15:16:23'),(222,14,'/frontend_dev.php/auth/register','2014-10-26 15:31:19','2014-10-26 15:31:19'),(223,14,'/frontend_dev.php/auth/register','2014-10-26 15:33:50','2014-10-26 15:33:50'),(224,14,'/frontend_dev.php/auth/register','2014-10-26 15:36:06','2014-10-26 15:36:06'),(225,14,'/frontend_dev.php/auth/register','2014-10-26 15:36:58','2014-10-26 15:36:58'),(226,14,'/frontend_dev.php/auth/register','2014-10-26 15:40:16','2014-10-26 15:40:16'),(227,14,'/frontend_dev.php/auth/register','2014-10-26 15:41:21','2014-10-26 15:41:21'),(228,14,'/frontend_dev.php/auth/register','2014-10-26 15:42:08','2014-10-26 15:42:08'),(229,14,'/frontend_dev.php/auth/register','2014-10-26 15:43:27','2014-10-26 15:43:27'),(230,14,'/frontend_dev.php/auth/register','2014-10-26 15:43:36','2014-10-26 15:43:36'),(231,14,'/frontend_dev.php/auth/register','2014-10-26 15:43:50','2014-10-26 15:43:50'),(232,14,'/frontend_dev.php/auth/register','2014-10-26 15:44:41','2014-10-26 15:44:41'),(233,14,'/frontend_dev.php/','2014-10-26 15:44:54','2014-10-26 15:44:54'),(234,14,'/frontend_dev.php/page/o-proekte','2014-10-26 15:45:00','2014-10-26 15:45:00'),(235,14,'/frontend_dev.php/contactus','2014-10-26 15:45:07','2014-10-26 15:45:07'),(236,14,'/frontend_dev.php/auth/signin','2014-10-26 15:45:12','2014-10-26 15:45:12'),(237,14,'/frontend_dev.php/auth/register','2014-10-26 15:45:35','2014-10-26 15:45:35'),(238,14,'/frontend_dev.php/auth/register','2014-10-26 15:46:55','2014-10-26 15:46:55'),(239,14,'/frontend_dev.php/auth/register','2014-10-26 15:47:36','2014-10-26 15:47:36'),(240,14,'/frontend_dev.php/auth/register','2014-10-26 15:48:03','2014-10-26 15:48:03'),(241,14,'/frontend_dev.php/auth/register','2014-10-26 15:48:14','2014-10-26 15:48:14'),(242,14,'/frontend_dev.php/auth/register','2014-10-26 15:52:47','2014-10-26 15:52:47'),(243,14,'/frontend_dev.php/auth/register','2014-10-26 15:53:15','2014-10-26 15:53:15'),(244,14,'/frontend_dev.php/auth/register','2014-10-26 15:54:28','2014-10-26 15:54:28'),(245,14,'/frontend_dev.php/auth/register','2014-10-26 15:54:58','2014-10-26 15:54:58'),(246,14,'/frontend_dev.php/auth/register','2014-10-26 16:07:49','2014-10-26 16:07:49'),(247,14,'/frontend_dev.php/auth/register','2014-10-26 16:08:18','2014-10-26 16:08:18'),(248,14,'/frontend_dev.php/auth/register','2014-10-26 16:08:34','2014-10-26 16:08:34'),(249,14,'/frontend_dev.php/auth/register','2014-10-26 16:08:44','2014-10-26 16:08:44'),(250,14,'/frontend_dev.php/auth/register','2014-10-26 16:08:55','2014-10-26 16:08:55'),(251,14,'/frontend_dev.php/auth/register','2014-10-26 16:10:40','2014-10-26 16:10:40'),(252,14,'/frontend_dev.php/auth/registrationComplete','2014-10-26 16:12:10','2014-10-26 16:12:10'),(253,14,'/','2014-10-26 16:12:16','2014-10-26 16:12:16'),(254,14,'/','2014-10-26 16:12:27','2014-10-26 16:12:27'),(255,14,'/','2014-10-26 16:15:09','2014-10-26 16:15:09'),(256,14,'/','2014-10-26 16:15:14','2014-10-26 16:15:14'),(257,14,'/','2014-10-26 16:15:31','2014-10-26 16:15:31'),(258,14,'/','2014-10-26 16:17:13','2014-10-26 16:17:13'),(259,14,'/','2014-10-26 16:17:21','2014-10-26 16:17:21'),(260,14,'/auth/signin','2014-10-26 16:17:24','2014-10-26 16:17:24'),(261,14,'/auth/signin','2014-10-26 16:18:07','2014-10-26 16:18:07'),(262,14,'/auth/register','2014-10-26 16:18:13','2014-10-26 16:18:13'),(263,14,'/auth/signin','2014-10-26 16:18:18','2014-10-26 16:18:18'),(264,14,'/auth/signin','2014-10-26 16:19:30','2014-10-26 16:19:30'),(265,14,'/auth/register','2014-10-26 16:19:35','2014-10-26 16:19:35'),(266,14,'/auth/signin','2014-10-26 16:19:48','2014-10-26 16:19:48'),(267,14,'/auth/forgotPassword','2014-10-26 16:20:00','2014-10-26 16:20:00'),(268,14,'/auth/forgotPassword','2014-10-26 16:20:19','2014-10-26 16:20:19'),(269,14,'/auth/forgotPassword','2014-10-26 16:20:46','2014-10-26 16:20:46'),(270,14,'/auth/forgotPassword','2014-10-26 16:20:57','2014-10-26 16:20:57'),(271,14,'/auth/forgotPassword','2014-10-26 16:21:05','2014-10-26 16:21:05'),(272,14,'/auth/signin','2014-10-26 16:21:54','2014-10-26 16:21:54'),(273,14,'/auth/register','2014-10-26 16:21:57','2014-10-26 16:21:57'),(274,14,'/auth/registrationComplete','2014-10-26 16:22:20','2014-10-26 16:22:20'),(275,14,'/','2014-10-26 16:22:27','2014-10-26 16:22:27'),(276,14,'/','2014-10-26 16:30:35','2014-10-26 16:30:35'),(277,14,'/','2014-10-26 16:31:00','2014-10-26 16:31:00'),(278,14,'/','2014-10-26 16:31:18','2014-10-26 16:31:18'),(279,14,'/','2014-10-26 16:31:34','2014-10-26 16:31:34'),(280,14,'/auth/signin','2014-10-26 16:32:10','2014-10-26 16:32:10'),(281,14,'/auth/register','2014-10-26 16:32:14','2014-10-26 16:32:14'),(282,14,'/auth/registrationComplete','2014-10-26 16:32:49','2014-10-26 16:32:49'),(283,14,'/','2014-10-26 16:32:57','2014-10-26 16:32:57'),(284,14,'/register/activationSuccessful','2014-10-26 16:33:10','2014-10-26 16:33:10'),(285,14,'/','2014-10-26 16:35:55','2014-10-26 16:35:55'),(286,14,'/','2014-10-26 16:36:30','2014-10-26 16:36:30'),(287,14,'/','2014-10-26 16:36:47','2014-10-26 16:36:47'),(288,14,'/','2014-10-26 16:42:00','2014-10-26 16:42:00'),(289,14,'/','2014-10-26 16:42:06','2014-10-26 16:42:06'),(290,14,'/auth/signin','2014-10-26 16:42:09','2014-10-26 16:42:09'),(291,14,'/auth/register','2014-10-26 16:42:13','2014-10-26 16:42:13'),(292,14,'/auth/registrationComplete','2014-10-26 16:42:52','2014-10-26 16:42:52'),(293,14,'/','2014-10-26 16:42:59','2014-10-26 16:42:59'),(294,14,'/auth/activationSuccessful','2014-10-26 16:43:13','2014-10-26 16:43:13'),(295,14,'/frontend_dev.php/profile','2014-10-26 16:45:14','2014-10-26 16:45:14'),(296,14,'/frontend_dev.php/profile','2014-10-26 16:46:24','2014-10-26 16:46:24'),(297,14,'/frontend_dev.php/profile','2014-10-26 16:50:41','2014-10-26 16:50:41'),(298,14,'/frontend_dev.php/auth/register','2014-10-26 16:50:45','2014-10-26 16:50:45'),(299,14,'/frontend_dev.php/auth/registrationComplete','2014-10-26 16:51:12','2014-10-26 16:51:12'),(300,14,'/','2014-10-26 16:51:21','2014-10-26 16:51:21'),(301,14,'/auth/activationSuccessful','2014-10-26 16:51:22','2014-10-26 16:51:22'),(302,14,'/profile','2014-10-26 16:51:28','2014-10-26 16:51:28'),(303,14,'/profile','2014-10-26 16:52:50','2014-10-26 16:52:50'),(304,14,'/auth/signin','2014-10-26 16:52:56','2014-10-26 16:52:56'),(305,14,'/','2014-10-26 16:53:07','2014-10-26 16:53:07'),(306,14,'/','2014-10-26 16:56:40','2014-10-26 16:56:40'),(307,14,'/','2014-10-26 16:59:21','2014-10-26 16:59:21'),(308,14,'/page/zakrytyy_razdel','2014-10-26 16:59:25','2014-10-26 16:59:25'),(309,14,'/page/zakrytyy_razdel','2014-10-26 16:59:36','2014-10-26 16:59:36'),(310,14,'/page/zakrytyy_razdel','2014-10-26 17:03:47','2014-10-26 17:03:47'),(311,14,'/','2014-10-26 17:23:45','2014-10-26 17:23:45'),(312,14,'/page/eto-testovaya-stranica','2014-10-26 17:27:14','2014-10-26 17:27:14'),(313,14,'/page/eto-testovaya-stranica','2014-10-26 17:30:34','2014-10-26 17:30:34'),(314,14,'/page/eto-testovaya-stranica','2014-10-26 18:30:36','2014-10-26 18:30:36'),(315,14,'/page/eto-testovaya-stranica','2014-10-26 18:31:33','2014-10-26 18:31:33'),(316,14,'/page/eto-testovaya-stranica-kak-by','2014-10-26 18:32:59','2014-10-26 18:32:59'),(317,14,'/page/eto-testovaya-stranica-kak-by','2014-10-26 18:37:29','2014-10-26 18:37:29'),(318,14,'/page/eto-testovaya-stranica-kak-by','2014-10-26 18:37:46','2014-10-26 18:37:46'),(319,14,'/page/eto-testovaya-stranica-kak-by','2014-10-26 18:38:48','2014-10-26 18:38:48'),(320,14,'/page/eto-testovaya-stranica-ponimaesh','2014-10-26 18:39:13','2014-10-26 18:39:13'),(321,14,'/page/eto-testovaya-stranica-ponimaesh','2014-10-26 18:39:28','2014-10-26 18:39:28'),(322,14,'/page/eto-testovaya-stranica','2014-10-26 18:40:04','2014-10-26 18:40:04'),(323,14,'/page/eto-testovaya-stranica','2014-10-26 18:40:51','2014-10-26 18:40:51'),(324,14,'/','2014-10-26 18:41:16','2014-10-26 18:41:16'),(325,14,'/profile','2014-10-26 18:41:22','2014-10-26 18:41:22'),(326,14,'/profile/password','2014-10-26 18:41:27','2014-10-26 18:41:27'),(327,14,'/profile','2014-10-26 18:42:06','2014-10-26 18:42:06'),(328,14,'/profile','2014-10-26 18:42:20','2014-10-26 18:42:20'),(329,14,'/profile','2014-10-26 18:42:37','2014-10-26 18:42:37'),(330,14,'/profile','2014-10-26 18:42:47','2014-10-26 18:42:47'),(331,14,'/profile','2014-10-26 18:45:22','2014-10-26 18:45:22'),(332,14,'/profile/password','2014-10-26 18:45:36','2014-10-26 18:45:36'),(333,14,'/frontend_dev.php/profile/password','2014-10-26 18:47:13','2014-10-26 18:47:13'),(334,14,'/frontend_dev.php/profile/password','2014-10-26 18:48:39','2014-10-26 18:48:39'),(335,14,'/frontend_dev.php/profile/password','2014-10-26 18:48:51','2014-10-26 18:48:51'),(336,14,'/frontend_dev.php/profile/password','2014-10-26 18:49:26','2014-10-26 18:49:26'),(337,14,'/frontend_dev.php/profile/password','2014-10-26 18:49:39','2014-10-26 18:49:39'),(338,14,'/frontend_dev.php/profile/password','2014-10-26 18:51:04','2014-10-26 18:51:04'),(339,14,'/frontend_dev.php/profile/password','2014-10-26 18:51:36','2014-10-26 18:51:36'),(340,14,'/frontend_dev.php/profile/password','2014-10-26 18:51:47','2014-10-26 18:51:47'),(341,14,'/frontend_dev.php/profile/password','2014-10-26 18:51:58','2014-10-26 18:51:58'),(342,14,'/frontend_dev.php/profile/password','2014-10-26 18:52:23','2014-10-26 18:52:23'),(343,14,'/frontend_dev.php/profile/password','2014-10-26 18:52:43','2014-10-26 18:52:43'),(344,14,'/frontend_dev.php/profile/password','2014-10-26 18:52:54','2014-10-26 18:52:54'),(345,14,'/frontend_dev.php/profile/avatar','2014-10-26 18:55:35','2014-10-26 18:55:35'),(346,14,'/frontend_dev.php/profile/avatar','2014-10-26 18:58:39','2014-10-26 18:58:39'),(347,14,'/frontend_dev.php/profile','2014-10-26 18:59:16','2014-10-26 18:59:16'),(348,14,'/frontend_dev.php/profile/avatar','2014-10-26 19:02:29','2014-10-26 19:02:29'),(349,14,'/frontend_dev.php/profile/avatar','2014-10-26 19:03:57','2014-10-26 19:03:57'),(350,14,'/frontend_dev.php/profile/avatar','2014-10-26 19:05:43','2014-10-26 19:05:43'),(351,14,'/frontend_dev.php/profile/avatar','2014-10-26 19:06:03','2014-10-26 19:06:03'),(352,14,'/frontend_dev.php/profile/avatar','2014-10-26 19:07:52','2014-10-26 19:07:52'),(353,14,'/frontend_dev.php/profile/avatar','2014-10-26 19:08:31','2014-10-26 19:08:31'),(354,14,'/frontend_dev.php/profile/avatar','2014-10-26 19:09:08','2014-10-26 19:09:08'),(355,14,'/frontend_dev.php/profile/avatar','2014-10-26 19:10:20','2014-10-26 19:10:20'),(356,14,'/frontend_dev.php/profile/avatar','2014-10-26 19:11:12','2014-10-26 19:11:12'),(357,14,'/frontend_dev.php/profile/avatar','2014-10-26 19:15:17','2014-10-26 19:15:17'),(358,14,'/frontend_dev.php/profile/avatar','2014-10-26 19:15:38','2014-10-26 19:15:38'),(359,14,'/frontend_dev.php/profile/avatar','2014-10-26 19:16:00','2014-10-26 19:16:00'),(360,14,'/frontend_dev.php/profile/avatar','2014-10-26 19:16:25','2014-10-26 19:16:25'),(361,14,'/frontend_dev.php/profile/avatar','2014-10-26 19:16:49','2014-10-26 19:16:49'),(362,14,'/frontend_dev.php/profile/avatar','2014-10-26 19:17:31','2014-10-26 19:17:31'),(363,14,'/frontend_dev.php/profile/avatar','2014-10-26 19:17:58','2014-10-26 19:17:58'),(364,14,'/frontend_dev.php/profile/avatar','2014-10-26 19:18:38','2014-10-26 19:18:38'),(365,14,'/frontend_dev.php/profile/avatar','2014-10-26 19:19:51','2014-10-26 19:19:51'),(366,14,'/frontend_dev.php/profile/avatar','2014-10-26 19:20:38','2014-10-26 19:20:38'),(367,14,'/frontend_dev.php/profile/avatar','2014-10-26 19:21:38','2014-10-26 19:21:38'),(368,14,'/frontend_dev.php/profile/avatar','2014-10-26 19:24:35','2014-10-26 19:24:35'),(369,14,'/frontend_dev.php/profile/avatar','2014-10-26 19:25:39','2014-10-26 19:25:39'),(370,14,'/frontend_dev.php/profile/avatar','2014-10-26 19:26:32','2014-10-26 19:26:32'),(371,14,'/frontend_dev.php/profile/avatar','2014-10-26 19:28:10','2014-10-26 19:28:10'),(372,14,'/frontend_dev.php/profile/avatar','2014-10-26 19:33:34','2014-10-26 19:33:34'),(373,14,'/frontend_dev.php/profile/avatar','2014-10-26 19:36:25','2014-10-26 19:36:25'),(374,14,'/frontend_dev.php/profile/avatar','2014-10-26 19:37:41','2014-10-26 19:37:41'),(375,14,'/frontend_dev.php/profile','2014-10-26 19:38:29','2014-10-26 19:38:29'),(376,14,'/frontend_dev.php/profile/avatar','2014-10-26 19:38:47','2014-10-26 19:38:47'),(377,14,'/frontend_dev.php/profile/avatar','2014-10-26 19:39:34','2014-10-26 19:39:34'),(378,14,'/frontend_dev.php/profile/password','2014-10-26 19:39:38','2014-10-26 19:39:38'),(379,14,'/frontend_dev.php/','2014-10-26 19:39:52','2014-10-26 19:39:52'),(380,14,'/frontend_dev.php/','2014-10-26 19:40:09','2014-10-26 19:40:09'),(381,14,'/frontend_dev.php/page/zakrytyy_razdel','2014-10-26 19:40:38','2014-10-26 19:40:38'),(382,14,'/frontend_dev.php/page/zakrytyy_razdel','2014-10-26 19:40:44','2014-10-26 19:40:44'),(383,14,'/frontend_dev.php/auth/forgotPassword','2014-10-26 19:40:55','2014-10-26 19:40:55'),(384,14,'/page/eto-testovaya-stranica','2014-10-26 21:37:21','2014-10-26 21:37:21'),(385,14,'/auth/signin','2014-10-26 21:41:05','2014-10-26 21:41:05'),(386,14,'/auth/forgotPassword','2014-10-26 21:41:09','2014-10-26 21:41:09'),(387,14,'/auth/forgotPassword','2014-10-26 21:41:15','2014-10-26 21:41:15'),(388,14,'/auth/forgotPasswordThanks','2014-10-26 21:42:19','2014-10-26 21:42:19'),(389,14,'/','2014-10-26 21:42:26','2014-10-26 21:42:26'),(390,15,'/','2014-10-26 21:56:34','2014-10-26 21:56:34'),(391,15,'/auth/signin','2014-10-26 21:56:46','2014-10-26 21:56:46'),(392,15,'/auth/register','2014-10-26 21:56:53','2014-10-26 21:56:53'),(393,15,'/auth/register','2014-10-26 21:57:37','2014-10-26 21:57:37'),(394,15,'/auth/registrationComplete','2014-10-26 21:57:48','2014-10-26 21:57:48'),(395,15,'/','2014-10-26 21:57:54','2014-10-26 21:57:54'),(396,15,'/auth/activationSuccessful','2014-10-26 21:58:20','2014-10-26 21:58:20'),(397,15,'/profile','2014-10-26 21:58:26','2014-10-26 21:58:26'),(398,15,'/profile','2014-10-26 21:58:34','2014-10-26 21:58:34'),(399,16,'/','2014-10-26 21:59:36','2014-10-26 21:59:36'),(400,15,'/auth/forgotPassword','2014-10-26 21:59:45','2014-10-26 21:59:45'),(401,15,'/auth/forgotPasswordThanks','2014-10-26 21:59:50','2014-10-26 21:59:50'),(402,15,'/','2014-10-26 21:59:55','2014-10-26 21:59:55'),(403,15,'/auth/signin','2014-10-26 22:01:19','2014-10-26 22:01:19'),(404,15,'/auth/forgotPassword','2014-10-26 22:01:22','2014-10-26 22:01:22'),(405,15,'/auth/forgotPasswordThanks','2014-10-26 22:01:28','2014-10-26 22:01:28'),(406,15,'/','2014-10-26 22:01:33','2014-10-26 22:01:33'),(407,15,'/auth/signin','2014-10-26 22:03:41','2014-10-26 22:03:41'),(408,15,'/auth/forgotPassword','2014-10-26 22:03:46','2014-10-26 22:03:46'),(409,15,'/auth/forgotPasswordThanks','2014-10-26 22:03:55','2014-10-26 22:03:55'),(410,15,'/','2014-10-26 22:04:01','2014-10-26 22:04:01'),(411,15,'/auth/signin','2014-10-26 22:04:46','2014-10-26 22:04:46'),(412,15,'/auth/forgotPassword','2014-10-26 22:04:52','2014-10-26 22:04:52'),(413,15,'/auth/forgotPasswordThanks','2014-10-26 22:05:01','2014-10-26 22:05:01'),(414,15,'/','2014-10-26 22:05:07','2014-10-26 22:05:07'),(415,15,'/frontend_dev.php/auth/recover?hash=2879349a5fe9f6c9f50a24516f1414bc','2014-10-26 22:09:15','2014-10-26 22:09:15'),(416,15,'/frontend_dev.php/auth/recover?hash=2879349a5fe9f6c9f50a24516f1414bc','2014-10-26 22:09:53','2014-10-26 22:09:53'),(417,15,'/frontend_dev.php/auth/recover?hash=2879349a5fe9f6c9f50a24516f1414bc','2014-10-26 22:10:03','2014-10-26 22:10:03'),(418,15,'/frontend_dev.php/auth/recover?hash=2879349a5fe9f6c9f50a24516f1414bc','2014-10-26 22:10:12','2014-10-26 22:10:12'),(419,15,'/frontend_dev.php/auth/recover?hash=2879349a5fe9f6c9f50a24516f1414bc','2014-10-26 22:10:23','2014-10-26 22:10:23'),(420,15,'/frontend_dev.php/auth/recover?hash=2879349a5fe9f6c9f50a24516f1414bc','2014-10-26 22:10:33','2014-10-26 22:10:33'),(421,15,'/frontend_dev.php/auth/signin','2014-10-26 22:10:42','2014-10-26 22:10:42'),(422,15,'/','2014-10-26 22:11:02','2014-10-26 22:11:02'),(423,15,'/profile','2014-10-26 22:11:06','2014-10-26 22:11:06'),(424,15,'/profile','2014-10-26 22:11:13','2014-10-26 22:11:13'),(425,15,'/frontend_dev.php/profile','2014-10-26 22:15:02','2014-10-26 22:15:02'),(426,15,'/frontend_dev.php/profile','2014-10-26 22:15:07','2014-10-26 22:15:07'),(427,15,'/frontend_dev.php/profile','2014-10-26 22:15:14','2014-10-26 22:15:14'),(428,15,'/frontend_dev.php/profile','2014-10-26 22:15:21','2014-10-26 22:15:21'),(429,15,'/frontend_dev.php/profile','2014-10-26 22:15:26','2014-10-26 22:15:26'),(430,15,'/frontend_dev.php/profile','2014-10-26 22:15:41','2014-10-26 22:15:41'),(431,15,'/frontend_dev.php/profile','2014-10-26 22:15:51','2014-10-26 22:15:51'),(432,15,'/frontend_dev.php/profile','2014-10-26 22:15:59','2014-10-26 22:15:59'),(433,15,'/frontend_dev.php/profile','2014-10-26 22:16:09','2014-10-26 22:16:09'),(434,15,'/frontend_dev.php/profile','2014-10-26 22:26:08','2014-10-26 22:26:08'),(435,15,'/frontend_dev.php/profile','2014-10-26 22:26:15','2014-10-26 22:26:15'),(436,15,'/frontend_dev.php/profile','2014-10-26 22:26:26','2014-10-26 22:26:26'),(437,15,'/profile','2014-10-26 22:26:51','2014-10-26 22:26:51'),(438,16,'/auth/signin','2014-10-26 22:27:25','2014-10-26 22:27:25'),(439,16,'/auth/forgotPassword','2014-10-26 22:27:35','2014-10-26 22:27:35'),(440,16,'/auth/forgotPasswordThanks','2014-10-26 22:27:42','2014-10-26 22:27:42'),(441,16,'/','2014-10-26 22:27:49','2014-10-26 22:27:49'),(442,16,'/auth/recover?hash=6d69f27340c058e7d903fb111eef5fff','2014-10-26 22:27:51','2014-10-26 22:27:51'),(443,16,'/auth/signin','2014-10-26 22:27:56','2014-10-26 22:27:56'),(444,16,'/','2014-10-26 22:28:10','2014-10-26 22:28:10'),(445,16,'/','2014-10-26 22:28:13','2014-10-26 22:28:13'),(446,16,'/auth/signin','2014-10-26 22:28:17','2014-10-26 22:28:18'),(447,16,'/auth/signin','2014-10-26 22:28:20','2014-10-26 22:28:20'),(448,16,'/auth/signin','2014-10-26 22:28:22','2014-10-26 22:28:22'),(449,16,'/auth/signin','2014-10-26 22:28:25','2014-10-26 22:28:25'),(450,15,'/frontend_dev.php/','2014-10-26 23:02:34','2014-10-26 23:02:34'),(451,15,'/frontend_dev.php/','2014-10-26 23:04:18','2014-10-26 23:04:18'),(452,16,'/','2014-10-26 23:06:54','2014-10-26 23:06:54'),(453,16,'/auth/signin','2014-10-26 23:07:01','2014-10-26 23:07:01'),(454,17,'/auth/signin','2014-10-26 23:07:09','2014-10-26 23:07:09'),(455,17,'/auth/signin','2014-10-26 23:07:12','2014-10-26 23:07:12'),(456,17,'/auth/signin','2014-10-26 23:07:14','2014-10-26 23:07:14'),(457,17,'/auth/signin','2014-10-26 23:07:18','2014-10-26 23:07:18'),(458,17,'/auth/signin','2014-10-26 23:07:21','2014-10-26 23:07:21'),(459,17,'/auth/signin','2014-10-26 23:07:28','2014-10-26 23:07:28'),(460,17,'/auth/signin','2014-10-26 23:07:39','2014-10-26 23:07:39'),(461,17,'/','2014-10-26 23:07:45','2014-10-26 23:07:45'),(462,17,'/page/o-proekte','2014-10-26 23:07:47','2014-10-26 23:07:47'),(463,17,'/contactus','2014-10-26 23:07:50','2014-10-26 23:07:50'),(464,17,'/auth/signin','2014-10-26 23:07:53','2014-10-26 23:07:53'),(465,15,'/frontend_dev.php/','2014-10-26 23:08:50','2014-10-26 23:08:50'),(466,15,'/frontend_dev.php/auth/signin','2014-10-26 23:09:09','2014-10-26 23:09:09'),(467,15,'/frontend_dev.php/auth/signin','2014-10-26 23:09:24','2014-10-26 23:09:24'),(468,15,'/frontend_dev.php/auth/signin','2014-10-26 23:09:31','2014-10-26 23:09:31'),(469,15,'/frontend_dev.php/auth/signin','2014-10-26 23:09:40','2014-10-26 23:09:40'),(470,15,'/frontend_dev.php/auth/signin','2014-10-26 23:09:53','2014-10-26 23:09:53'),(471,15,'/frontend_dev.php/auth/signin','2014-10-26 23:10:03','2014-10-26 23:10:03'),(472,15,'/frontend_dev.php/auth/signin','2014-10-26 23:10:13','2014-10-26 23:10:13'),(473,15,'/frontend_dev.php/contactus','2014-10-26 23:10:17','2014-10-26 23:10:17'),(474,15,'/frontend_dev.php/contactus','2014-10-27 01:13:26','2014-10-27 01:13:26'),(475,15,'/frontend_dev.php/your-ip-address-is-banned','2014-10-27 01:21:35','2014-10-27 01:21:35');
/*!40000 ALTER TABLE `site_visit_page` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `text_block`
--

DROP TABLE IF EXISTS `text_block`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `text_block` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `text` text,
  `application` varchar(32) DEFAULT NULL,
  `module` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `section_index_idx` (`application`,`module`)
) ENGINE=InnoDB AUTO_INCREMENT=234 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `text_block`
--

LOCK TABLES `text_block` WRITE;
/*!40000 ALTER TABLE `text_block` DISABLE KEYS */;
INSERT INTO `text_block` (`id`, `name`, `title`, `text`, `application`, `module`) VALUES (1,'Username',NULL,'ユーザー名','cms',NULL),(2,'Password',NULL,'パスワード','cms',NULL),(3,'Remember?',NULL,'私を覚えていますか？','cms',NULL),(4,'Login',NULL,'ログイン','cms',NULL),(5,'Welcome to',NULL,'歓迎','cms',NULL),(6,'Use a valid username and password to gain access to the administration console.',NULL,'管理コンソールへのアクセスを得るために有効なユーザ名とパスワードを使用してください。','cms',NULL),(7,'Вход',NULL,'ログイン','frontend',NULL),(8,'Ваша компания',NULL,'あなたの会社','frontend',NULL),(9,'Разработка и поддержка',NULL,'開発とサポート','frontend',NULL),(10,'Pages',NULL,'ページ','cms',NULL),(11,'Blog',NULL,'ブログ','cms',NULL),(12,'Posts',NULL,'メッセージ','cms',NULL),(13,'Comments',NULL,'注釈','cms',NULL),(14,'Tags',NULL,'タグ','cms',NULL),(15,'Users',NULL,'ユーザーが','cms',NULL),(16,'Settings',NULL,'[設定]','cms',NULL),(17,'Dictionary',NULL,'辞書','cms',NULL),(18,'Email шаблоны',NULL,'電子メールテンプレート','cms',NULL),(19,'Текст. блоки',NULL,'テキスト。ブロック','cms',NULL),(20,'События',NULL,'通知','cms',NULL),(21,'Сообщения',NULL,'メッセージ','cms',NULL),(22,'Посещения',NULL,'訪問','cms',NULL),(23,'Разработчик',NULL,'開発者','cms',NULL),(24,'Системные настройки',NULL,'システム設定','cms',NULL),(25,'Ошибки электронной почты',NULL,'電子メールのエラー','cms',NULL),(26,'Меню',NULL,'メニュー','cms',NULL),(27,'Текстовые блоки',NULL,'テキストブロック','cms',NULL),(28,'Локализация',NULL,'ローカライゼーション','cms',NULL),(29,'Выключить разработчика',NULL,'無効にする開発者モード','cms',NULL),(30,'Тест',NULL,'テスト','cms',NULL),(31,'Отправка писем',NULL,'メールを送る','cms',NULL),(32,'Вики',NULL,'ウィキ','cms',NULL),(33,'Добавить',NULL,'加える','cms',NULL),(34,'Go to Frontend',NULL,'フロントエンドに行く','cms',NULL),(35,'Logout',NULL,'出口','cms',NULL),(36,'dashboard',NULL,'ダッシュボード','cms',NULL),(37,'Профиль',NULL,'プロフィール','frontend',NULL),(38,'Выход',NULL,'出口','frontend',NULL),(39,'Админка',NULL,'管理','frontend',NULL),(40,'Page List',NULL,'ページの一覧','cms',NULL),(41,'Name',NULL,'タイトル','cms',NULL),(42,'Slug',NULL,'URL','cms',NULL),(43,'Actions',NULL,'アクション','cms',NULL),(44,'First page',NULL,'先頭ページ','cms',NULL),(45,'Previous page',NULL,'前ページ','cms',NULL),(46,'Next page',NULL,'次のページ','cms',NULL),(47,'Last page',NULL,'最終ページ','cms',NULL),(48,'[0] no result|[1] 1 result|(1,+Inf] %1% results',NULL,'[0] 結果なし|[1] 1 結果|(1,+Inf] %1% 結果','cms',NULL),(49,'(page %%page%%/%%nb_pages%%)',NULL,'（ページ%%page%%/%%nb_pages%%）','cms',NULL),(50,'Edit',NULL,'編集','cms',NULL),(51,'Delete',NULL,'削除','cms',NULL),(52,'Are you sure?',NULL,'本当に？','cms',NULL),(53,'Choose an action',NULL,'操作を選択','cms',NULL),(54,'go',NULL,'ゴー！','cms',NULL),(55,'New',NULL,'新しい','cms',NULL),(56,'Blog Posts',NULL,'ブログの投稿','cms',NULL),(57,'Reset',NULL,'リセット','cms',NULL),(58,'Filter',NULL,'フィルタ','cms',NULL),(59,'No result',NULL,'検索結果はありません','cms',NULL),(60,'New Page',NULL,'新しいページ','cms',NULL),(61,'Content',NULL,'コンテンツ','cms',NULL),(62,'Включить редирект',NULL,'リダイレクトを有効に','cms',NULL),(63,'Redirect route',NULL,'リダイレクトアドレス','cms',NULL),(64,'Redirect timeout',NULL,'リダイレクトタイムアウト','cms',NULL),(65,'Layout',NULL,'レイアウト','cms',NULL),(66,'Meta title',NULL,'メタタイトル','cms',NULL),(67,'Meta description',NULL,'メタ記述','cms',NULL),(68,'Meta keywords',NULL,'メタキーワード','cms',NULL),(69,'Back to list',NULL,'一覧に戻る','cms',NULL),(70,'Save',NULL,'保存','cms',NULL),(71,'Save and add',NULL,'保存して追加します','cms',NULL),(72,'УРЛ-метка',NULL,'URLタグ','cms',NULL),(73,'Edit Page',NULL,'このページを編集','cms',NULL),(74,'User list',NULL,'メンバーリスト','cms',NULL),(75,'Created at',NULL,'で作成された','cms',NULL),(76,'Updated at',NULL,'で更新','cms',NULL),(77,'Last login',NULL,'最終ログイン','cms',NULL),(78,'user',NULL,'ユーザー','cms',NULL),(79,'New User',NULL,'新規ユーザー','cms',NULL),(80,'User',NULL,'ユーザー','cms',NULL),(81,'First name',NULL,'ファーストネーム','cms',NULL),(82,'Last name',NULL,'姓','cms',NULL),(83,'Email address',NULL,'E-mailアドレス','cms',NULL),(84,'Password (again)',NULL,'パスワード（もう一度）','cms',NULL),(85,'Permissions',NULL,'パーミッション','cms',NULL),(86,'Is active',NULL,'アクティブです','cms',NULL),(87,'Is super admin',NULL,'スーパー管理者は、','cms',NULL),(88,'Editing User \"%%username%%\"',NULL,'編集 \"%%ユーザ名%%\"','cms',NULL),(89,'dictionary',NULL,'辞書','cms',NULL),(90,'Title',NULL,'タイトル','cms',NULL),(91,'Value',NULL,'意味','cms',NULL),(92,'settings',NULL,'[設定]','cms',NULL),(93,'Email template List',NULL,'電子メールテンプレートのリスト','cms',NULL),(94,'Id',NULL,'イド','cms',NULL),(95,'Subject',NULL,'トピック','cms',NULL),(96,'Message',NULL,'メッセージ','cms',NULL),(97,'email_template',NULL,'Email_template','cms',NULL),(98,'Edit Email template',NULL,'編集電子メールテンプレート','cms',NULL),(99,'New Email template',NULL,'新しいテンプレートメール','cms',NULL),(100,'Ваше имя',NULL,'あなたのお名前','frontend',NULL),(101,'Ваш Email',NULL,'あなたのEメール','frontend',NULL),(102,'Нужен для обратной связи',NULL,'フィードバックの必要性','frontend',NULL),(103,'Ваше сообщение',NULL,'あなたのメッセージ','frontend',NULL),(104,'Reload image',NULL,'画像のリフレッシュ','frontend',NULL),(105,'Введите код с картинки',NULL,'画像からコードを入力してください','frontend',NULL),(106,'Показатели',NULL,'インジケータ','cms',NULL),(107,'Имя',NULL,'ファーストネーム','cms',NULL),(108,'Email',NULL,'メール','cms',NULL),(109,'desc',NULL,'下行','cms',NULL),(110,'Просмотр',NULL,'ビュー','cms',NULL),(111,'Создать пользователя',NULL,'ユーザーの作成','cms',NULL),(112,'Export',NULL,'輸出','cms',NULL),(113,'The item was updated successfully.',NULL,'このアイテムは正常に更新されました。','cms',NULL),(114,'Неверный формат',NULL,'無効な形式','frontend',NULL),(115,'System settings',NULL,'システム設定','cms',NULL),(116,'Section',NULL,'セクション','cms',NULL),(117,'settings_sys',NULL,'Settings_sys','cms',NULL),(118,'Email error List',NULL,'電子メールのエラーリスト','cms',NULL),(119,'Email from',NULL,'からの電子メール','cms',NULL),(120,'Email to',NULL,'送る','cms',NULL),(121,'Body',NULL,'ボディ','cms',NULL),(122,'Cc',NULL,'コピー','cms',NULL),(123,'File',NULL,'ファイル','cms',NULL),(124,'Errmes',NULL,'Errmes','cms',NULL),(125,'email_error',NULL,'Email_error','cms',NULL),(126,'Menu root List',NULL,'メニューリスト','cms',NULL),(127,'Manage tree',NULL,'ツリーを管理する','cms',NULL),(128,'Manage content',NULL,'Managementコンテンツ','cms',NULL),(129,'menu_root',NULL,'Menu_root','cms',NULL),(130,'Localization List',NULL,'ローカリゼーションリスト','cms',NULL),(131,'localization',NULL,'ローカライゼーション','cms',NULL),(132,'Filters',NULL,'フィルタ','cms',NULL),(133,'is empty',NULL,'空の','cms',NULL),(134,'Мой профиль',NULL,'私のプロフィール','frontend',NULL),(135,'Фотография',NULL,'フォト','frontend',NULL),(136,'Изменить пароль',NULL,'パスワードの変更','frontend',NULL),(137,'Отчество',NULL,'父称','frontend',NULL),(138,'Фамилия',NULL,'姓','frontend',NULL),(139,'Дата рождения\n(дд.мм.гггг)',NULL,'DOB（DD.MM.YYYY）','frontend',NULL),(140,'Телефон мобильный\n(для получения уведомлений)',NULL,'携帯電話（通知用）','frontend',NULL),(141,'Сохранить изменения',NULL,'変更を保存します','frontend',NULL),(142,'Старый пароль',NULL,'古いパスワード','frontend',NULL),(143,'Новый пароль',NULL,'新しいパスワード','frontend',NULL),(144,'Новый пароль еще раз',NULL,'新しいパスワードを再度','frontend',NULL),(145,'Сохранить пароль',NULL,'パスワードの保存','frontend',NULL),(146,'Заполните поле',NULL,'フィールドに必要事項を記入してください','frontend',NULL),(147,'Passwords do not match',NULL,'パスワードが一致していません','frontend',NULL),(148,'Выберите картинку из загрузите ее',NULL,'画像を選択し、それをアップロードする','frontend',NULL),(149,'Image',NULL,'絵','frontend',NULL),(150,'Загрузить фотографию',NULL,'写真をアップロード','frontend',NULL),(151,'File is too large (maximum is %max_size% bytes).',NULL,'ファイル（最大％相のmax_size％）が大きすぎる。','frontend',NULL),(152,'Вы можете выбрать зону, которая будет отображаться на ваших аватарках. Кликните по одному из изображений справа',NULL,'あなたはあなたの写真に表示する領域を選択することができます。右に画像のいずれかをクリック','frontend',NULL),(153,'remove the current file',NULL,'現在のファイルを削除します。','frontend',NULL),(154,'Сохранить',NULL,'保存','frontend',NULL),(155,'Вы уверены?',NULL,'本当に？','frontend',NULL),(156,'Удалить фотографию',NULL,'写真を削除','frontend',NULL),(157,'Логин (Ваш Email)',NULL,'ユーザー名（メールアドレス）','frontend',NULL),(158,'Запомнить меня на этом компьютере',NULL,'このコンピュータで私を覚えている','frontend',NULL),(159,'Войти',NULL,'ログイン','frontend',NULL),(160,'Забыли пароль?',NULL,'パスワードを忘れましたか？','frontend',NULL),(161,'Регистрация',NULL,'登録','frontend',NULL),(162,'The username and/or password is invalid.',NULL,'不正なログインまたはパスワード','frontend',NULL),(163,'Введите код',NULL,'コードを入力する','frontend',NULL),(164,'Письмо отправлено',NULL,'手紙送ら','frontend',NULL),(165,'Ваш email',NULL,'あなたのメールアドレス','frontend',NULL),(166,'Восстановить пароль',NULL,'パスワードを回復する','frontend',NULL),(167,'Повторите пароль',NULL,'パスワードを確認','frontend',NULL),(168,'Я принимаю условия',NULL,'私は条件を受け入れる','frontend',NULL),(169,'Такой email уже зарегистрирован в ситеме',NULL,'このメールは、すでにシステムに登録されている','frontend',NULL),(170,'Пароли не совпадают',NULL,'パスワードが一致していません','frontend',NULL),(171,'Вы должны принять условия пользовательского соглашения',NULL,'あなたはサービス規約に同意する必要があります','frontend',NULL),(172,'Пароль должен быть не короче 4 символов',NULL,'パスワードは4文字以上でなければなりません','frontend',NULL),(173,'Еще раз пароль',NULL,'あなたのパスワードを確認','frontend',NULL),(174,'Сменить пароль',NULL,'パスワードを変更','frontend',NULL),(175,'Пароль слишком короткий',NULL,'パスワードが短すぎる','frontend',NULL),(176,'Пароль восстановлен',NULL,'パスワードは回復','frontend',NULL),(177,'Password is invalid.',NULL,'無効なパスワード','frontend',NULL),(178,'События за сегодня',NULL,'今日のイベント','cms',NULL),(179,'Всего событий',NULL,'総イベント','cms',NULL),(180,'All rights reserved',NULL,'版権所有','cms',NULL),(181,'Date',NULL,'日付','cms',NULL),(182,'Is published',NULL,'公開された','cms',NULL),(183,'yes or no',NULL,'Yesまたはno','cms',NULL),(184,'yes',NULL,'はい','cms',NULL),(185,'no',NULL,'ノー','cms',NULL),(186,'From',NULL,'から','cms',NULL),(187,'To',NULL,'へ','cms',NULL),(188,'New Blog post',NULL,'新しいブログ投稿','cms',NULL),(189,'Brief',NULL,'簡潔に','cms',NULL),(190,'Text',NULL,'テキスト','cms',NULL),(191,'Url',NULL,'URL','cms',NULL),(193,'пользовательского соглашения',NULL,'ユーザー契約の','frontend',NULL),(194,'The item was created successfully.',NULL,'アイテムの作成に成功しました。','cms',NULL),(195,'You don\'t have proper credentials to access this page',NULL,'あなたがこのページにアクセスするための適切な資格を持っていない','cms',NULL),(196,'auth',NULL,NULL,'cms',NULL),(197,'Secure',NULL,'セキュア','cms',NULL),(210,'Server is not responding',NULL,'サーバが応答していません','cms',NULL),(211,'Data saved',NULL,'データは保存','cms',NULL),(212,'Error while saving data',NULL,'エラーデータを保存しながら、','cms',NULL),(213,'Ru',NULL,'Ru','cms',NULL),(214,'En',NULL,'En','cms',NULL),(215,'De',NULL,'De','cms',NULL),(216,'Es',NULL,'Es','cms',NULL),(217,'Unexpected extra form field named \"%field%\".',NULL,'予想外の余分なフォームフィールドは、「％フィールド％」と名付けました。','cms',NULL),(221,'Вы можете править текст прямо в списке. Исправьте все, что считаете нужным, а затем нажмите TAB или щелкните мышью в любом месте вне поля ввода.',NULL,'あなたは、リスト内のテキストを直接編集することができます。 Tabキーを押すか、入力フィールドの外側をクリックし、次に該当するものをすべて修正し、。','cms',NULL),(222,'Воспользуйтесь фильтром, чтобы найти нужный вам текст',NULL,'必要なテキストを見つけるために、フィルタを使用してください','cms',NULL),(223,'Отправить',NULL,'送る','frontend',NULL),(224,'The item has not been saved due to some errors.',NULL,'項目はいくつかのエラーが原因で保存されていません。','cms',NULL),(225,'An object with the same \"%column%\" already exist.',NULL,'同じ「％列％ \"を持つオブジェクトが既に存在している。','cms',NULL),(226,'Update',NULL,'アップデート','cms',NULL),(227,'Is module page',NULL,'モジュールのページです','cms',NULL),(228,'Module name',NULL,'モジュール名','cms',NULL),(229,'Is content editable',NULL,'コンテンツ編集可能です','cms',NULL),(230,'Special mark',NULL,'特別なマーク','cms',NULL),(231,'Is redirect',NULL,'リダイレクトされている','cms',NULL),(232,'Redirect301 old url',NULL,'Redirect301古いURL','cms',NULL),(233,'Show',NULL,'ショー','cms',NULL);
/*!40000 ALTER TABLE `text_block` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wiki`
--

DROP TABLE IF EXISTS `wiki`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wiki` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content` text,
  `sort_order` bigint(20) DEFAULT NULL,
  `is_published` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wiki`
--

LOCK TABLES `wiki` WRITE;
/*!40000 ALTER TABLE `wiki` DISABLE KEYS */;
INSERT INTO `wiki` (`id`, `name`, `content`, `sort_order`, `is_published`) VALUES (1,'Зачем нужно Вики?','Вики нужно, чтоб его читали<br /><br />Вики нужно, чтоб им наслаждались<br /><br />Вики нужно, чтоб его впитывали',1,1);
/*!40000 ALTER TABLE `wiki` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-10-31 15:16:01

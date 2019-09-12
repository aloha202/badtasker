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
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `page`
--

LOCK TABLES `page` WRITE;
/*!40000 ALTER TABLE `page` DISABLE KEYS */;
INSERT INTO `page` (`id`, `name`, `content`, `is_module_page`, `module_name`, `is_content_editable`, `special_mark`, `is_redirect`, `redirect_route`, `redirect_timeout`, `layout`, `slug`, `meta_title`, `meta_description`, `meta_keywords`) VALUES (1,'Welcome!','Greetings to you, young friend! You came to this site because you yourself need a website. Or maybe you just came here by accident! In any case, welcome!',1,'default',1,'default',0,'/',5,'','welcome','Welcome to the website of the project DEV2!','',''),(2,'About Us','We are a young but already very experienced company engaged in the development and promotion of web sites',0,NULL,1,NULL,0,'/',5,'','about-us','About the project','',''),(3,'Feedback','Send us a message and we will contact you as soon as possible!',0,NULL,1,'contactus',0,'/',5,'','feedback','Contact Us - Project DEV2','',''),(4,'Registration','',0,NULL,0,'register',0,'/',5,NULL,'registration','Registration','',''),(5,'Password recovery','Click \"Recover Password\" and we\'ll send an email to your email account that will link to the password recovery page',0,NULL,1,'auth_forgot_password',0,'/',5,NULL,'password-recovery','Password recovery','',''),(6,'Password recovery. Email sent.','Email has been sent to your email account',0,NULL,1,'auth_forgot_password_thanks',1,'/',5,'','password-recovery-email-sent','Password recovery. Email sent.','',''),(7,'Password recovery. sent SMS','',0,NULL,1,'auth_forgot_sms',0,'/',5,NULL,'password-recovery-sent-sms','Password recovery. sent SMS','',''),(8,'Invent a new password','',0,NULL,1,'auth_password_recovery',0,'/',5,NULL,'invent-a-new-password','Invent a new password','',''),(9,'Your Personal Area','',0,NULL,1,'auth_signin',0,'/',5,NULL,'your-personal-area','Your Personal Area','',''),(10,'Registration is passed','We emailed further registration instructions to your email address',0,NULL,1,'auth_registration_complete',1,'/',5,NULL,'registration-is-passed','Registration is passed','',''),(11,'Activation is passed','Now you can login!',0,NULL,1,'auth_activation_successful',1,'/profile',3,'','activation-is-passed','Activation is passed','',''),(12,'User Agreement','Here is an absolutely typical user agreement',0,NULL,1,'user_agreement',0,'/',5,'','user-agreement','User Agreement','',''),(13,'Privacy policy','Here is an absolutely typical page about privacy policy',0,NULL,1,'privacy_policy',0,'/',5,'','privacy-policy','Privacy policy','',''),(14,'A Closed Forum','If you come across this page, it means you are an authorized user!',0,NULL,1,NULL,0,'/',5,NULL,'a-closed-forum','A Closed Forum','',''),(15,'This is a test page','',0,NULL,1,NULL,0,'/',5,'','this-is-a-test-page','This is a test page','',''),(16,'Error 404','Error 404. Page not found',0,NULL,1,'error404',0,'/',5,NULL,'error-404','Error 404','',''),(17,'My Profile','Here you can edit your personal information, upload a photo and to change the password',0,NULL,0,'profile',0,'/',5,NULL,'my-profile','My Profile','',''),(18,'My profile - Change password','We store your password in encrypted form.',0,NULL,0,'profile_password',0,'/',5,NULL,'my-profile-change-password','My profile - Change password','',''),(19,'My profile - Edit photo','',0,NULL,0,'profile_avatar',0,'/',5,NULL,'my-profile-edit-photo','My profile - Edit photo','',''),(20,'IP-address is blocked','Unfortunately, for unclear reasons, your address has been blocked! Thank you!',0,NULL,1,'ip_banned',0,'/',5,'empty','ip-address-is-blocked','IP-address is blocked','',''),(21,'Please register or login','To see the contents of this section, please log in',0,NULL,1,'auth_secure',0,'/',5,NULL,'please-register-or-login','Please register or login','',''),(22,'Confirmation of account in socConfirm your social networks accountial networks','Attention! Email {%email%} already exists in the system! If this is your email, confirm it!',0,NULL,1,'oauth_bridge',0,'/',5,NULL,'confirmation-of-account-in-socconfirm-your-social-networks-accountial-networks','Confirm your social networks account','',''),(23,'Confirm your social networks account. step two','Confirmation letter has been sent to your email address {%email%}',0,NULL,1,'oauth_bridge_confirm',0,'/',5,NULL,'confirm-your-social-networks-account-step-two','Confirm your social networks account','',''),(24,'OAuth authorization error','',0,NULL,1,'oauth_error',0,'/',5,NULL,'oauth-authorization-error','OAuth authorization error','','');
/*!40000 ALTER TABLE `page` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=315 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `text_block`
--

LOCK TABLES `text_block` WRITE;
/*!40000 ALTER TABLE `text_block` DISABLE KEYS */;
INSERT INTO `text_block` (`id`, `name`, `title`, `text`, `application`, `module`) VALUES (1,'Username',NULL,'Username','cms',NULL),(2,'Password',NULL,'Password','cms',NULL),(3,'Remember?',NULL,'Remember Me?','cms',NULL),(4,'Login',NULL,'Login','cms',NULL),(5,'Welcome to',NULL,'Welcome','cms',NULL),(6,'Use a valid username and password to gain access to the administration console.',NULL,'Use a valid username and password to gain access to the administration console.','cms',NULL),(7,'Вход',NULL,'Login','frontend',NULL),(8,'Ваша компания',NULL,'Your Company','frontend',NULL),(9,'Разработка и поддержка',NULL,'Development and support','frontend',NULL),(11,'Blog',NULL,'Blog','cms',NULL),(12,'Posts',NULL,'Messages','cms',NULL),(13,'Comments',NULL,'Comments','cms',NULL),(14,'Tags',NULL,'Tags','cms',NULL),(15,'Users',NULL,'Users','cms',NULL),(16,'Settings',NULL,'Settings','cms',NULL),(18,'Email шаблоны',NULL,'Email templates','cms',NULL),(21,'Сообщения',NULL,'Messages','cms',NULL),(28,'Локализация',NULL,'Localization','cms',NULL),(33,'Добавить',NULL,'Add','cms',NULL),(34,'Go to Frontend',NULL,'Go to site','cms',NULL),(35,'Logout',NULL,'Exit','cms',NULL),(36,'dashboard',NULL,'Dashboard','cms',NULL),(37,'Профиль',NULL,'Profile','frontend',NULL),(38,'Выход',NULL,'Exit','frontend',NULL),(39,'Админка',NULL,'Admin','frontend',NULL),(40,'Page List',NULL,'List of Pages','cms',NULL),(41,'Name',NULL,'Title','cms',NULL),(42,'Slug',NULL,'URL','cms',NULL),(43,'Actions',NULL,'Actions','cms',NULL),(44,'First page',NULL,'First page','cms',NULL),(45,'Previous page',NULL,'Previous Page','cms',NULL),(46,'Next page',NULL,'Next page','cms',NULL),(47,'Last page',NULL,'Last page','cms',NULL),(48,'[0] no result|[1] 1 result|(1,+Inf] %1% results',NULL,'[0] no result|[1] 1 result|(1,+Inf] %1% results','cms',NULL),(49,'(page %%page%%/%%nb_pages%%)',NULL,'(page %%page%%/%%nb_pages%%)','cms',NULL),(50,'Edit',NULL,'Edit','cms',NULL),(51,'Delete',NULL,'Delete','cms',NULL),(52,'Are you sure?',NULL,'Are you sure?','cms',NULL),(53,'Choose an action',NULL,'Choose an action','cms',NULL),(54,'go',NULL,'Go!','cms',NULL),(55,'New',NULL,'New','cms',NULL),(56,'Blog Posts',NULL,'Blog Posts','cms',NULL),(57,'Reset',NULL,'Reset','cms',NULL),(58,'Filter',NULL,'Filter','cms',NULL),(59,'No result',NULL,'No result','cms',NULL),(60,'New Page',NULL,'New page','cms',NULL),(61,'Content',NULL,'Contents','cms',NULL),(62,'Включить редирект',NULL,'Enable redirection','cms',NULL),(63,'Redirect route',NULL,'Redirect to','cms',NULL),(64,'Redirect timeout',NULL,'Redirection timeout','cms',NULL),(65,'Layout',NULL,'Layout','cms',NULL),(66,'Meta title',NULL,'Meta title','cms',NULL),(67,'Meta description',NULL,'Meta description','cms',NULL),(68,'Meta keywords',NULL,'Meta keywords','cms',NULL),(69,'Back to list',NULL,'Back to list','cms',NULL),(70,'Save',NULL,'Save','cms',NULL),(71,'Save and add',NULL,'Save and add','cms',NULL),(72,'УРЛ-метка',NULL,'URL tag','cms',NULL),(73,'Edit Page',NULL,'Edit this Page','cms',NULL),(74,'User list',NULL,'Member List','cms',NULL),(75,'Created at',NULL,'Created in','cms',NULL),(76,'Updated at',NULL,'Updated at','cms',NULL),(77,'Last login',NULL,'Last Login','cms',NULL),(78,'user',NULL,'User','cms',NULL),(79,'New User',NULL,'New user','cms',NULL),(80,'User',NULL,'User','cms',NULL),(81,'First name',NULL,'First name','cms',NULL),(82,'Last name',NULL,'Last name','cms',NULL),(83,'Email address',NULL,'E-mail address','cms',NULL),(84,'Password (again)',NULL,'Password (again)','cms',NULL),(85,'Permissions',NULL,'Permissions','cms',NULL),(86,'Is active',NULL,'Is active','cms',NULL),(87,'Is super admin',NULL,'Is super admin','cms',NULL),(88,'Editing User \"%%username%%\"',NULL,'Edit \"%%username%%\"','cms',NULL),(89,'dictionary',NULL,'Dictionary','cms',NULL),(90,'Title',NULL,'Title','cms',NULL),(91,'Value',NULL,'Value','cms',NULL),(92,'settings',NULL,'Settings','cms',NULL),(93,'Email template List',NULL,'List of Email Templates','cms',NULL),(94,'Id',NULL,'ID','cms',NULL),(95,'Subject',NULL,'Topic','cms',NULL),(96,'Message',NULL,'Message','cms',NULL),(98,'Edit Email template',NULL,'Edit Email Template','cms',NULL),(99,'New Email template',NULL,'New template Email','cms',NULL),(100,'Ваше имя',NULL,'Your name','frontend',NULL),(101,'Ваш Email',NULL,'Your E-mail','frontend',NULL),(102,'Нужен для обратной связи',NULL,'Need for feedback','frontend',NULL),(103,'Ваше сообщение',NULL,'Your message','frontend',NULL),(104,'Reload image',NULL,'Refresh Image','frontend',NULL),(105,'Введите код с картинки',NULL,'Enter the code from the image','frontend',NULL),(106,'Показатели',NULL,'Indicators','cms',NULL),(107,'Имя',NULL,'Name','cms',NULL),(108,'Email',NULL,'E-mail','cms',NULL),(109,'desc',NULL,'Descending','cms',NULL),(110,'Просмотр',NULL,'View','cms',NULL),(111,'Создать пользователя',NULL,'Create User','cms',NULL),(112,'Export',NULL,'Export','cms',NULL),(113,'The item was updated successfully.',NULL,'This item was successfully updated.','cms',NULL),(114,'Неверный формат',NULL,'Invalid format','frontend',NULL),(115,'System settings',NULL,'System Settings','cms',NULL),(116,'Section',NULL,'Section','cms',NULL),(118,'Email error List',NULL,'Email error list','cms',NULL),(119,'Email from',NULL,'From whom','cms',NULL),(120,'Email to',NULL,'To Whom','cms',NULL),(121,'Body',NULL,'Body','cms',NULL),(122,'Cc',NULL,'Copy','cms',NULL),(123,'File',NULL,'File','cms',NULL),(132,'Filters',NULL,'Filter','cms',NULL),(133,'is empty',NULL,'Empty','cms',NULL),(134,'Мой профиль',NULL,'My Profile','frontend',NULL),(135,'Фотография',NULL,'Photo','frontend',NULL),(136,'Изменить пароль',NULL,'Change Password','frontend',NULL),(137,'Отчество',NULL,'Patronymic','frontend',NULL),(138,'Фамилия',NULL,'Last name','frontend',NULL),(139,'Дата рождения\n(дд.мм.гггг)',NULL,'DOB','frontend',NULL),(140,'Телефон мобильный\n(для получения уведомлений)',NULL,'Mobile phone (for notification)','frontend',NULL),(141,'Сохранить изменения',NULL,'Save changes','frontend',NULL),(142,'Старый пароль',NULL,'Old password','frontend',NULL),(143,'Новый пароль',NULL,'New password','frontend',NULL),(144,'Новый пароль еще раз',NULL,'New password again','frontend',NULL),(145,'Сохранить пароль',NULL,'Save password','frontend',NULL),(146,'Заполните поле',NULL,'Fill out the field','frontend',NULL),(147,'Passwords do not match',NULL,'Passwords do not match','frontend',NULL),(148,'Выберите картинку из загрузите ее',NULL,'Select an image and upload it','frontend',NULL),(149,'Image',NULL,'Image','frontend',NULL),(150,'Загрузить фотографию',NULL,'Upload an image','frontend',NULL),(151,'File is too large (maximum is %max_size% bytes).',NULL,'The file is too large (maximum%max_size%).','frontend',NULL),(152,'Вы можете выбрать зону, которая будет отображаться на ваших аватарках. Кликните по одному из изображений справа',NULL,'You can select the area to be displayed on your images. Click on one of the small images to the right','frontend',NULL),(153,'remove the current file',NULL,'Delete the current file','frontend',NULL),(154,'Сохранить',NULL,'Save','frontend',NULL),(155,'Вы уверены?',NULL,'Are you sure?','frontend',NULL),(156,'Удалить фотографию',NULL,'Delete image','frontend',NULL),(157,'Логин (Ваш Email)',NULL,'Username (Your Email)','frontend',NULL),(158,'Запомнить меня на этом компьютере',NULL,'Remember me on this computer','frontend',NULL),(159,'Войти',NULL,'Login','frontend',NULL),(160,'Забыли пароль?',NULL,'Forgot your password?','frontend',NULL),(161,'Registration',NULL,'Registration','frontend',NULL),(162,'The username and/or password is invalid.',NULL,'Incorrect login or password','frontend',NULL),(163,'Введите код',NULL,'Enter the code','frontend',NULL),(164,'Письмо отправлено',NULL,'Email sent','frontend',NULL),(165,'Ваш email',NULL,'Your email','frontend',NULL),(166,'Восстановить пароль',NULL,'Recover password','frontend',NULL),(167,'Повторите пароль',NULL,'Confirm password','frontend',NULL),(168,'Я принимаю условия',NULL,'I accept the conditions','frontend',NULL),(169,'Такой email уже зарегистрирован в ситеме',NULL,'This email is already registered in the system','frontend',NULL),(170,'Пароли не совпадают',NULL,'Passwords do not match','frontend',NULL),(171,'Вы должны принять условия пользовательского соглашения',NULL,'You must accept the Terms of Service','frontend',NULL),(172,'Пароль должен быть не короче 4 символов',NULL,'Password must be at least 4 characters long','frontend',NULL),(173,'Еще раз пароль',NULL,'Confirm your password','frontend',NULL),(174,'Сменить пароль',NULL,'Change Password','frontend',NULL),(175,'Пароль слишком короткий',NULL,'Password is too short','frontend',NULL),(176,'Пароль восстановлен',NULL,'Password recovered','frontend',NULL),(177,'Password is invalid.',NULL,'Invalid password','frontend',NULL),(178,'События за сегодня',NULL,'Events for today','cms',NULL),(179,'Всего событий',NULL,'Total Events','cms',NULL),(180,'All rights reserved',NULL,'All rights reserved','cms',NULL),(181,'Date',NULL,'Date','cms',NULL),(182,'Is published',NULL,'Published','cms',NULL),(183,'yes or no',NULL,'Yes or no','cms',NULL),(184,'yes',NULL,'Yes','cms',NULL),(185,'no',NULL,'No','cms',NULL),(186,'From',NULL,'From','cms',NULL),(187,'To',NULL,'To','cms',NULL),(188,'New Blog post',NULL,'New blog post','cms',NULL),(189,'Brief',NULL,'Briefly','cms',NULL),(190,'Text',NULL,'Text','cms',NULL),(191,'Url',NULL,'URL','cms',NULL),(193,'пользовательского соглашения',NULL,'User Agreement','frontend',NULL),(194,'The item was created successfully.',NULL,'This item was successfully created.','cms',NULL),(195,'You don\'t have proper credentials to access this page',NULL,'You do not have the proper credentials to access this page','cms',NULL),(197,'Secure',NULL,'A Closed Forum','cms',NULL),(210,'Server is not responding',NULL,'The server is not responding','cms',NULL),(211,'Data saved',NULL,'Data saved','cms',NULL),(212,'Error while saving data',NULL,'Error saving data','cms',NULL),(217,'Unexpected extra form field named \"%field%\".',NULL,'Unexpected extra form field named \"%field%\".','cms',NULL),(221,'Вы можете править текст прямо в списке. Исправьте все, что считаете нужным, а затем нажмите TAB или щелкните мышью в любом месте вне поля ввода.',NULL,'You can edit the text directly in the list. Correct all that apply, and then press TAB or click anywhere outside of the input field.','cms',NULL),(222,'Воспользуйтесь фильтром, чтобы найти нужный вам текст',NULL,'Please use the filter to find the desired text','cms',NULL),(223,'Отправить',NULL,'Send','frontend',NULL),(224,'The item has not been saved due to some errors.',NULL,'The object was not saved due to some errors','cms',NULL),(225,'An object with the same \"%column%\" already exist.',NULL,'The object with the value of the field \"%column%\" already exists in the system.','cms',NULL),(226,'Update',NULL,'Update','cms',NULL),(235,'Страницы',NULL,'Page','cms',NULL),(236,'Пользователи',NULL,'Users','cms',NULL),(237,'Настройки',NULL,'Settings','cms',NULL),(238,'Редирект 301',NULL,'301s','cms',NULL),(239,'Уведомления',NULL,'Notice','cms',NULL),(241,'Url from',NULL,'Whence','cms',NULL),(242,'Url to',NULL,'Where','cms',NULL),(243,'Comment',NULL,'Description','cms',NULL),(245,'from %from_date%<br />to %to_date%',NULL,'From %from_date% to %to_date%','cms',NULL),(246,'Checked',NULL,'Noted','cms',NULL),(248,'You must at least select one item.',NULL,'You must select at least one object','cms',NULL),(249,'blog_post',NULL,'Blog post','cms',NULL),(250,'Extra',NULL,'Additionally','cms',NULL),(251,'Edit Blog post',NULL,'Edit a blog post','cms',NULL),(252,'The begin date must be before the end date.',NULL,'Start date must be less than the end date','cms',NULL),(257,'%%title%%',NULL,'%%title%%','cms',NULL),(258,'Email администратора',NULL,'Email administrator','cms',NULL),(259,'На этот адрес вам будут приходить сообщения с сайта',NULL,'At this address you will receive messages from the site','cms',NULL),(260,'Имя отправителя почты',NULL,'Email sender name','cms',NULL),(261,'От этого имени сайт будет отправлять почту',NULL,'All emails will be sent on behalf of that name','cms',NULL),(263,'Адрес',NULL,'Address','cms',NULL),(264,'Контактный телефон',NULL,'Contact phone','cms',NULL),(265,'Контактный email',NULL,'Contact email','cms',NULL),(266,'Type',NULL,'Type','cms',NULL),(267,'Description',NULL,'Description','cms',NULL),(268,'Admin email',NULL,'Email to the administrator','cms',NULL),(269,'User email',NULL,'Email to the user','cms',NULL),(270,'Phone number',NULL,'Telephone number','cms',NULL),(271,'Company name',NULL,'Company name','cms',NULL),(272,'Attach',NULL,'Attached File','cms',NULL),(275,'Show',NULL,'Show','cms',NULL),(279,'Password recovery',NULL,'Password recovery','cms',NULL),(281,'Registration',NULL,'Registration','cms',NULL),(283,'Page',NULL,'Page','cms',NULL),(284,'Описание',NULL,'Description','cms',NULL),(285,'redirect301',NULL,'301s','cms',NULL),(287,'email_template',NULL,'Email templates','cms',NULL),(288,'Имя',NULL,'First name','frontend',NULL),(289,'Email',NULL,'Email','frontend',NULL),(290,'Invalid mime type (%mime_type%).',NULL,'Incorrect file format (%mime_type%).','frontend',NULL),(291,'Password',NULL,'Password','frontend',NULL),(292,'Регистрация',NULL,'Registration','frontend',NULL),(293,'ссылке',NULL,'Link','frontend',NULL),(295,'Notifications',NULL,'Notifications','cms',NULL),(296,'Pages',NULL,'Pages','cms',NULL),(297,'Apply',NULL,'Apply','frontend',NULL),(298,'Discard',NULL,'Cancel','frontend',NULL),(299,'Данные сохранены',NULL,'Changes saved!','frontend',NULL),(301,'Изображение удалено',NULL,'Image removed','frontend',NULL),(303,'Код введен неверно',NULL,'The code you entered is invalid','frontend',NULL),(304,'Такой email не зарегистрирован в системе',NULL,'This email is not registered in the system','frontend',NULL),(305,' csrf token',NULL,' CSRF token','frontend',NULL),(306,'The item was deleted successfully.',NULL,'The item was deleted successfully.','cms',NULL),(307,'You must select an action to execute on the selected items.',NULL,'You must select an action to execute on the selected items.','cms',NULL),(308,'The selected items have been deleted successfully.',NULL,'The selected items have been deleted successfully.','cms',NULL),(310,'Cообщения с сайта',NULL,'Messages from site','cms',NULL),(311,'Да, это мой email-аккаунт!',NULL,'Yes, this is my email account!','frontend',NULL),(312,'Подтвердить email аккаунт!',NULL,'Confirm email account!','frontend',NULL),(313,'Подтверждаю!',NULL,'Agree!','frontend',NULL),(314,'Войти с помощью:',NULL,'Login with:','frontend',NULL);
/*!40000 ALTER TABLE `text_block` ENABLE KEYS */;
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
  CONSTRAINT `menu_item_page_id_page_id` FOREIGN KEY (`page_id`) REFERENCES `page` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_item`
--

LOCK TABLES `menu_item` WRITE;
/*!40000 ALTER TABLE `menu_item` DISABLE KEYS */;
INSERT INTO `menu_item` (`id`, `name`, `root_name`, `type`, `page_id`, `cms_module_id`, `route`, `external`, `is_empty`, `is_auth`, `icon_class`, `root_id`, `lft`, `rgt`, `level`) VALUES (1,'Main Menu','main','empty',NULL,NULL,NULL,NULL,1,0,NULL,1,1,52,0),(2,'Home','','route',1,NULL,'homepage','',1,0,NULL,1,1,1,1),(3,'About Us',NULL,'page',2,NULL,NULL,NULL,1,0,NULL,1,44,45,1),(4,'Contacts',NULL,'module',3,2,'','',1,0,NULL,1,46,47,1),(5,'A Closed Forum',NULL,'page',14,NULL,'','',1,1,'',1,50,51,1),(6,'Footer menu','bottom','empty',NULL,NULL,NULL,NULL,1,0,NULL,6,6,NULL,0),(7,'Privacy policy',NULL,'page',13,NULL,'','',1,0,'',6,6,5,1),(8,'User Agreement',NULL,'page',12,NULL,'','',1,0,'',6,6,5,1);
/*!40000 ALTER TABLE `menu_item` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_template`
--

LOCK TABLES `email_template` WRITE;
/*!40000 ALTER TABLE `email_template` DISABLE KEYS */;
INSERT INTO `email_template` (`id`, `name`, `subject`, `message`) VALUES (1,'registration_user','Register on the project DEV2','Hello, {%first_name%}! You have been registered successfully! Follow this {%link%}, to activate your account!'),(2,'registration_admin','Register a new account','User {%full_name%} registered with us!'),(3,'password_recovery_user','Password recovery','Good day, {%full_name%} You have requested  password recovery on Dev2 project. Follow this {%LINK%} to set a new password. If you have not requested password recovery, please ignore this letter.'),(4,'contactus_message_user','Project DEV2. Your message is important to us!','Dear {%name%}! Thank you for your message! It is very important to us!'),(5,'contactus_message_admin','Project DEV2. new message','Someone {%name%} sent a message. Text: {%message%} E-Mail: {%email%}'),(6,'social_bridge_user_confirm_email_user','Demo.web375.org - Confirm your email address in the social network {%network_name%}','Confirm Email {%email%}, follow the link {%link%} or use this code {%token%}');
/*!40000 ALTER TABLE `email_template` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-11-05 20:21:38

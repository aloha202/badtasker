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
INSERT INTO `page` (`id`, `name`, `content`, `is_module_page`, `module_name`, `is_content_editable`, `special_mark`, `is_redirect`, `redirect_route`, `redirect_timeout`, `layout`, `slug`, `meta_title`, `meta_description`, `meta_keywords`) VALUES (1,'Добро пожаловать!','Привет тебе, юный друг! Ты попал на этот сайт, потому что тебе самому нужен сайт. А может быть, ты просто зашел сюда случайно! В любом случае, добро пожаловать!',1,'default',1,'default',0,'/',5,'','dobro-pozhalovat','Добро пожаловать на сайт проекта DEV2!','',''),(2,'О нас','Мы молодая, но уже очень опытная компания, занимающаяся разработкой и продвижением веб-сайтов',0,NULL,1,NULL,0,'/',5,'','o-nas','О проекте','',''),(3,'Обратная связь','Отправьте нам сообщение и мы свяжемся с Вами как можно быстрее!',0,NULL,1,'contactus',0,'/',5,'','obratnaya-svyaz','Обратная связь - Проект DEV2','',''),(4,'Регистрация','',0,NULL,0,'register',0,'/',5,NULL,'registraciya','Регистрация','',''),(5,'Восстановление пароля','Нажмите кнопку \"Восстановить пароль\" и на указанный Вами при регистрации адрес электронной почты придет ссылка на восстановление пароля. ',0,NULL,1,'auth_forgot_password',0,'/',5,NULL,'vosstanovlenie-parolya','Восстановление пароля','',''),(6,'Восстановление пароля. Выслано письмо.','На указанный вами Email-адрес выслано письмо.',0,NULL,1,'auth_forgot_password_thanks',1,'/',5,'','vosstanovlenie-parolya-vyslano-pismo','Восстановление пароля. Выслано письмо.','',''),(7,'Восстановление пароля. Отправлено СМС','',0,NULL,1,'auth_forgot_sms',0,'/',5,NULL,'vosstanovlenie-parolya-otpravleno-sms','Восстановление пароля. Отправлено СМС','',''),(8,'Придумайте новый пароль','',0,NULL,1,'auth_password_recovery',0,'/',5,NULL,'pridumayte-novyy-parol','Придумайте новый пароль','',''),(9,'Вход в личный кабинет','',0,NULL,1,'auth_signin',0,'/',5,NULL,'vhod-v-lichnyy-kabinet','Вход в личный кабинет','',''),(10,'Регистрация пройдена','На указанный Вами email-адрес выслано письмо с инструкцией регистрации',0,NULL,1,'auth_registration_complete',1,'/',5,NULL,'registraciya-proydena','Регистрация пройдена','',''),(11,'Активация пройдена','Теперь вы можете войти в Личный кабинет!',0,NULL,1,'auth_activation_successful',1,'/profile',3,'','aktivaciya-proydena','Активация пройдена','',''),(12,'Пользовательское соглашение','Здесь абсолютно типичное пользовательское соглашение',0,NULL,1,'user_agreement',0,'/',5,'','polzovatelskoe-soglashenie','Пользовательское соглашение','',''),(13,'Политика конфиденциальности','Здесь абсолютно типичная страница про политику конфиденциальности',0,NULL,1,'privacy_policy',0,'/',5,'','politika-konfidencialnosti','Политика конфиденциальности','',''),(14,'Закрытый раздел','Если вы зашли на эту страницу, значит вы авторизованный пользователь!',0,NULL,1,NULL,0,'/',5,NULL,'zakrytyy-razdel','Закрытый раздел','',''),(15,'Это тестовая страница','',0,NULL,1,NULL,0,'/',5,'','eto-testovaya-stranica','Это тестовая страница','',''),(16,'Ошибка 404','Ошибка 404. Страница не найдена',0,NULL,1,'error404',0,'/',5,NULL,'oshibka-404','Ошибка 404','',''),(17,'Мой профиль','Здесь вы можете отредактировать Ваши личные данные, загрузить фотографию и поменять пароль',0,NULL,0,'profile',0,'/',5,NULL,'moy-profil','Мой профиль','',''),(18,'Мой профиль - Изменить пароль','Мы храним Ваш пароль в зашифрованном виде. Кроме Вас его не знает никто',0,NULL,0,'profile_password',0,'/',5,NULL,'moy-profil-izmenit-parol','Мой профиль - Изменить пароль','',''),(19,'Мой профиль - Изменить фотографию','',0,NULL,0,'profile_avatar',0,'/',5,NULL,'moy-profil-izmenit-fotografiyu','Мой профиль - Изменить фотографию','',''),(20,'IP-адресс заблокирован','К сожалению, по неясным причинам ваш адрес был заблокирован! Спасибо!',0,NULL,1,'ip_banned',0,'/',5,'empty','ip-adress-zablokirovan','IP-адресс заблокирован','',''),(21,'Необходима авторизация','Чтобы посмотреть содержимое этого раздела, необходимо авторизоваться',0,NULL,1,'auth_secure',0,'/',5,NULL,'neobhodima-avtorizaciya','Необходима авторизация','',''),(22,'Confirmation of account in socConfirm your social networks accountial networks','Внимание! Email {%email%} уже существует в системе! Если это Ваш email, подтвердите его!',0,NULL,1,'oauth_bridge',0,'/',5,NULL,'confirmation-of-account-in-socconfirm-your-social-networks-accountial-networks','Подтверждение аккаунта в соцсети','',''),(23,'Подтверждение аккаунта в соцсети. Шаг второй','На ваш электронный ящик {%email%} выслано письмо!',0,NULL,1,'oauth_bridge_confirm',0,'/',5,NULL,'podtverzhdenie-akkaunta-v-socseti-shag-vtoroy','Подтверждение аккаунта в соцсети. Шаг второй','',''),(24,'Ошибка авторизации OAuth','',0,NULL,1,'oauth_error',0,'/',5,NULL,'oshibka-avtorizacii-oauth','Ошибка авторизации OAuth','','');
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
INSERT INTO `text_block` (`id`, `name`, `title`, `text`, `application`, `module`) VALUES (1,'Username',NULL,'Имя пользователя','cms',NULL),(2,'Password',NULL,'Пароль','cms',NULL),(3,'Remember?',NULL,'Запомнить?','cms',NULL),(4,'Login',NULL,'Войти','cms',NULL),(5,'Welcome to',NULL,'Добро пожаловать','cms',NULL),(6,'Use a valid username and password to gain access to the administration console.',NULL,'Используйте правильное имя пользователя и пароль, чтобы получить доступ к консоли администрирования.','cms',NULL),(7,'Вход',NULL,'Войти','frontend',NULL),(8,'Ваша компания',NULL,'Ваша компания','frontend',NULL),(9,'Разработка и поддержка',NULL,'Разработка и поддержка','frontend',NULL),(11,'Blog',NULL,'Блог','cms',NULL),(12,'Posts',NULL,'Сообщения','cms',NULL),(13,'Comments',NULL,'Комментарии','cms',NULL),(14,'Tags',NULL,'Метки','cms',NULL),(15,'Users',NULL,'Пользователи','cms',NULL),(16,'Settings',NULL,'Настройки','cms',NULL),(18,'Email шаблоны',NULL,'Email шаблоны','cms',NULL),(21,'Сообщения',NULL,'Сообщения','cms',NULL),(28,'Локализация',NULL,'Локализация','cms',NULL),(33,'Добавить',NULL,'Добавить','cms',NULL),(34,'Go to Frontend',NULL,'Перейти на Сайт','cms',NULL),(35,'Logout',NULL,'Выход','cms',NULL),(36,'dashboard',NULL,'Приборная панель','cms',NULL),(37,'Профиль',NULL,'Профиль','frontend',NULL),(38,'Выход',NULL,'Выход','frontend',NULL),(39,'Админка',NULL,'Админка','frontend',NULL),(40,'Page List',NULL,'Список Страниц','cms',NULL),(41,'Name',NULL,'Название','cms',NULL),(42,'Slug',NULL,'УРЛ','cms',NULL),(43,'Actions',NULL,'Действия','cms',NULL),(44,'First page',NULL,'Первая страница','cms',NULL),(45,'Previous page',NULL,'Предыдущая страница','cms',NULL),(46,'Next page',NULL,'Следующая страница','cms',NULL),(47,'Last page',NULL,'Последняя страница','cms',NULL),(48,'[0] no result|[1] 1 result|(1,+Inf] %1% results',NULL,'[0] нет результата[1] 1 результат|(1,+Inf] %1% результата','cms',NULL),(49,'(page %%page%%/%%nb_pages%%)',NULL,'(стр.%%page%%/%%nb_pages%%)','cms',NULL),(50,'Edit',NULL,'Редактировать','cms',NULL),(51,'Delete',NULL,'Удалить','cms',NULL),(52,'Are you sure?',NULL,'Вы уверены?','cms',NULL),(53,'Choose an action',NULL,'Выберите действие','cms',NULL),(54,'go',NULL,'Вперед!','cms',NULL),(55,'New',NULL,'Новый','cms',NULL),(56,'Blog Posts',NULL,'Сообщения в блоге','cms',NULL),(57,'Reset',NULL,'Сброс','cms',NULL),(58,'Filter',NULL,'Фильтр','cms',NULL),(59,'No result',NULL,'Нет результата','cms',NULL),(60,'New Page',NULL,'Новая страница','cms',NULL),(61,'Content',NULL,'Содержание','cms',NULL),(62,'Включить редирект',NULL,'Включить редирект','cms',NULL),(63,'Redirect route',NULL,'Адрес редиректа','cms',NULL),(64,'Redirect timeout',NULL,'Тайм-аут редиректа','cms',NULL),(65,'Layout',NULL,'Планировка','cms',NULL),(66,'Meta title',NULL,'Мета название','cms',NULL),(67,'Meta description',NULL,'Мета описание','cms',NULL),(68,'Meta keywords',NULL,'Мета ключевые слова','cms',NULL),(69,'Back to list',NULL,'Вернуться к списку','cms',NULL),(70,'Save',NULL,'Сохранить','cms',NULL),(71,'Save and add',NULL,'Сохранить и добавить','cms',NULL),(72,'УРЛ-метка',NULL,'УРЛ-метка','cms',NULL),(73,'Edit Page',NULL,'Редактировать страницу','cms',NULL),(74,'User list',NULL,'Список пользователей','cms',NULL),(75,'Created at',NULL,'Создано в','cms',NULL),(76,'Updated at',NULL,'Обновлено в','cms',NULL),(77,'Last login',NULL,'Последнее Войти','cms',NULL),(78,'user',NULL,'Пользователь','cms',NULL),(79,'New User',NULL,'Новый пользователь','cms',NULL),(80,'User',NULL,'Пользователь','cms',NULL),(81,'First name',NULL,'Имя','cms',NULL),(82,'Last name',NULL,'Фамилия','cms',NULL),(83,'Email address',NULL,'Адрес электронной почты','cms',NULL),(84,'Password (again)',NULL,'Пароль (еще раз)','cms',NULL),(85,'Permissions',NULL,'Разрешения','cms',NULL),(86,'Is active',NULL,'Является активным','cms',NULL),(87,'Is super admin',NULL,'Это супер админ','cms',NULL),(88,'Editing User \"%%username%%\"',NULL,'Редактирование \"%%username%%\"','cms',NULL),(89,'dictionary',NULL,'Словарь','cms',NULL),(90,'Title',NULL,'Название','cms',NULL),(91,'Value',NULL,'Значение','cms',NULL),(92,'settings',NULL,'Настройки','cms',NULL),(93,'Email template List',NULL,'Список Email шаблонов','cms',NULL),(94,'Id',NULL,'ID','cms',NULL),(95,'Subject',NULL,'Тема','cms',NULL),(96,'Message',NULL,'Сообщение','cms',NULL),(98,'Edit Email template',NULL,'Редактировать шаблон Email','cms',NULL),(99,'New Email template',NULL,'Новый шаблон Email','cms',NULL),(100,'Ваше имя',NULL,'Ваше имя','frontend',NULL),(101,'Ваш Email',NULL,'Ваш E-mail','frontend',NULL),(102,'Нужен для обратной связи',NULL,'Нужен для обратной связи','frontend',NULL),(103,'Ваше сообщение',NULL,'Ваше сообщение','frontend',NULL),(104,'Reload image',NULL,'Обновить изображение','frontend',NULL),(105,'Введите код с картинки',NULL,'Введите код с картинки','frontend',NULL),(106,'Показатели',NULL,'Показатели','cms',NULL),(107,'Имя',NULL,'Имя','cms',NULL),(108,'Email',NULL,'E-mail','cms',NULL),(109,'desc',NULL,'По убыванию','cms',NULL),(110,'Просмотр',NULL,'Просмотр','cms',NULL),(111,'Создать пользователя',NULL,'Создать пользователя','cms',NULL),(112,'Export',NULL,'Экспорт','cms',NULL),(113,'The item was updated successfully.',NULL,'Этот пункт был успешно обновлен.','cms',NULL),(114,'Неверный формат',NULL,'Неверный формат','frontend',NULL),(115,'System settings',NULL,'Системные настройки','cms',NULL),(116,'Section',NULL,'Раздел','cms',NULL),(118,'Email error List',NULL,'Список Email ошибок','cms',NULL),(119,'Email from',NULL,'От кого','cms',NULL),(120,'Email to',NULL,'Кому','cms',NULL),(121,'Body',NULL,'Тело','cms',NULL),(122,'Cc',NULL,'Копия','cms',NULL),(123,'File',NULL,'Файл','cms',NULL),(132,'Filters',NULL,'Фильтр','cms',NULL),(133,'is empty',NULL,'пусто','cms',NULL),(134,'Мой профиль',NULL,'Мой профиль','frontend',NULL),(135,'Фотография',NULL,'Фотография','frontend',NULL),(136,'Изменить пароль',NULL,'Изменить пароль','frontend',NULL),(137,'Отчество',NULL,'Отчество','frontend',NULL),(138,'Фамилия',NULL,'Фамилия','frontend',NULL),(139,'Дата рождения\n(дд.мм.гггг)',NULL,'Дата рождения','frontend',NULL),(140,'Телефон мобильный\n(для получения уведомлений)',NULL,'Телефон мобильный\n(для получения уведомлений)','frontend',NULL),(141,'Сохранить изменения',NULL,'Сохранить изменения','frontend',NULL),(142,'Старый пароль',NULL,'Старый пароль','frontend',NULL),(143,'Новый пароль',NULL,'Новый пароль','frontend',NULL),(144,'Новый пароль еще раз',NULL,'Новый пароль еще раз','frontend',NULL),(145,'Сохранить пароль',NULL,'Сохранить пароль','frontend',NULL),(146,'Заполните поле',NULL,'Заполните поле','frontend',NULL),(147,'Passwords do not match',NULL,'Пароли не совпадают','frontend',NULL),(148,'Выберите картинку из загрузите ее',NULL,'Выберите картинку и загрузите ее','frontend',NULL),(149,'Image',NULL,'Картинка','frontend',NULL),(150,'Загрузить фотографию',NULL,'Загрузить фотографию','frontend',NULL),(151,'File is too large (maximum is %max_size% bytes).',NULL,'Файл слишком большой(не более %max_size% ).','frontend',NULL),(152,'Вы можете выбрать зону, которая будет отображаться на ваших аватарках. Кликните по одному из изображений справа',NULL,'Вы можете выбрать зону, которая будет отображаться на ваших изображениях. Кликните по одному из изображений справа','frontend',NULL),(153,'remove the current file',NULL,'Удалить текущий файл','frontend',NULL),(154,'Сохранить',NULL,'Сохранить','frontend',NULL),(155,'Вы уверены?',NULL,'Вы уверены?','frontend',NULL),(156,'Удалить фотографию',NULL,'Удалить фотографию','frontend',NULL),(157,'Логин (Ваш Email)',NULL,'Логин (Ваш Email)','frontend',NULL),(158,'Запомнить меня на этом компьютере',NULL,'Запомнить меня на этом компьютере','frontend',NULL),(159,'Войти',NULL,'Войти','frontend',NULL),(160,'Забыли пароль?',NULL,'Забыли пароль?','frontend',NULL),(161,'Registration',NULL,'Регистрация','frontend',NULL),(162,'The username and/or password is invalid.',NULL,'Неверный логин или пароль','frontend',NULL),(163,'Введите код',NULL,'Введите код','frontend',NULL),(164,'Письмо отправлено',NULL,'Письмо отправлено','frontend',NULL),(165,'Ваш email',NULL,'Ваш email','frontend',NULL),(166,'Восстановить пароль',NULL,'Восстановить пароль','frontend',NULL),(167,'Повторите пароль',NULL,'Повторите пароль','frontend',NULL),(168,'Я принимаю условия',NULL,'Я принимаю условия','frontend',NULL),(169,'Такой email уже зарегистрирован в ситеме',NULL,'Такой email уже зарегистрирован в системе','frontend',NULL),(170,'Пароли не совпадают',NULL,'Пароли не совпадают','frontend',NULL),(171,'Вы должны принять условия пользовательского соглашения',NULL,'Вы должны принять условия пользовательского соглашения','frontend',NULL),(172,'Пароль должен быть не короче 4 символов',NULL,'Пароль должен быть не короче 4 символов','frontend',NULL),(173,'Еще раз пароль',NULL,'Еще раз пароль','frontend',NULL),(174,'Сменить пароль',NULL,'Сменить пароль','frontend',NULL),(175,'Пароль слишком короткий',NULL,'Пароль слишком короткий','frontend',NULL),(176,'Пароль восстановлен',NULL,'Пароль восстановлен','frontend',NULL),(177,'Password is invalid.',NULL,'Неверный пароль','frontend',NULL),(178,'События за сегодня',NULL,'События за сегодня','cms',NULL),(179,'Всего событий',NULL,'Всего событий','cms',NULL),(180,'All rights reserved',NULL,'Все права защищены','cms',NULL),(181,'Date',NULL,'Дата','cms',NULL),(182,'Is published',NULL,'Опубликован','cms',NULL),(183,'yes or no',NULL,'да или нет','cms',NULL),(184,'yes',NULL,'да','cms',NULL),(185,'no',NULL,'нет','cms',NULL),(186,'From',NULL,'От','cms',NULL),(187,'To',NULL,'До','cms',NULL),(188,'New Blog post',NULL,'Новый блог пост','cms',NULL),(189,'Brief',NULL,'Кратко','cms',NULL),(190,'Text',NULL,'Текст','cms',NULL),(191,'Url',NULL,'УРЛ','cms',NULL),(193,'пользовательского соглашения',NULL,'пользовательского соглашения','frontend',NULL),(194,'The item was created successfully.',NULL,'Этот пункт был успешно создан.','cms',NULL),(195,'You don\'t have proper credentials to access this page',NULL,'Вы не имеете надлежащих полномочий на доступ к этой странице','cms',NULL),(197,'Secure',NULL,'Закрытый раздел','cms',NULL),(210,'Server is not responding',NULL,'Сервер не отвечает','cms',NULL),(211,'Data saved',NULL,'Данные сохранены','cms',NULL),(212,'Error while saving data',NULL,'Ошибка при сохранении данных','cms',NULL),(217,'Unexpected extra form field named \"%field%\".',NULL,'Неожиданный дополнительный поля формы с именем \"%field%\".','cms',NULL),(221,'Вы можете править текст прямо в списке. Исправьте все, что считаете нужным, а затем нажмите TAB или щелкните мышью в любом месте вне поля ввода.',NULL,'Вы можете править текст прямо в списке. Исправьте все, что считаете нужным, а затем нажмите TAB или щелкните мышью в любом месте вне поля ввода.','cms',NULL),(222,'Воспользуйтесь фильтром, чтобы найти нужный вам текст',NULL,'Воспользуйтесь фильтром, чтобы найти нужный вам текст','cms',NULL),(223,'Отправить',NULL,'Отправить','frontend',NULL),(224,'The item has not been saved due to some errors.',NULL,'Объект не был сохранен из-за некоторых ошибок','cms',NULL),(225,'An object with the same \"%column%\" already exist.',NULL,'Объект с таким значением поля \"%column%\" уже существует в системе.','cms',NULL),(226,'Update',NULL,'Обновить','cms',NULL),(235,'Страницы',NULL,'Страницы','cms',NULL),(236,'Пользователи',NULL,'Пользователи','cms',NULL),(237,'Настройки',NULL,'Настройки','cms',NULL),(238,'Редирект 301',NULL,'Редирект 301','cms',NULL),(239,'Уведомления',NULL,'Уведомления','cms',NULL),(241,'Url from',NULL,'Откуда','cms',NULL),(242,'Url to',NULL,'Куда','cms',NULL),(243,'Comment',NULL,'Описание','cms',NULL),(245,'from %from_date%<br />to %to_date%',NULL,'с %from_date%по %to_date%','cms',NULL),(246,'Checked',NULL,'Отмечено','cms',NULL),(248,'You must at least select one item.',NULL,'Вы должны выбрать хотя бы один объект','cms',NULL),(249,'blog_post',NULL,'Блог пост','cms',NULL),(250,'Extra',NULL,'Дополниетльно','cms',NULL),(251,'Edit Blog post',NULL,'Редактировать блог пост','cms',NULL),(252,'The begin date must be before the end date.',NULL,'Дата начала должна быть меньше даты окончания','cms',NULL),(257,'%%title%%',NULL,'%%title%%','cms',NULL),(258,'Email администратора',NULL,'Email администратора','cms',NULL),(259,'На этот адрес вам будут приходить сообщения с сайта',NULL,'На этот адрес вам будут приходить сообщения с сайта','cms',NULL),(260,'Имя отправителя почты',NULL,'Имя отправителя почты','cms',NULL),(261,'От этого имени сайт будет отправлять почту',NULL,'От этого имени сайт будет отправлять почту','cms',NULL),(263,'Адрес',NULL,'Адрес','cms',NULL),(264,'Контактный телефон',NULL,'Контактный телефон','cms',NULL),(265,'Контактный email',NULL,'Контактный email','cms',NULL),(266,'Type',NULL,'Тип','cms',NULL),(267,'Description',NULL,'Описание','cms',NULL),(268,'Admin email',NULL,'Письмо администратору','cms',NULL),(269,'User email',NULL,'Письмо пользователю','cms',NULL),(270,'Phone number',NULL,'Номер телефона','cms',NULL),(271,'Company name',NULL,'Название компании','cms',NULL),(272,'Attach',NULL,'Прикрепленный файл','cms',NULL),(275,'Show',NULL,'Показать','cms',NULL),(279,'Password recovery',NULL,'Восстановление пароля','cms',NULL),(281,'Registration',NULL,'Регистрация','cms',NULL),(283,'Page',NULL,'Страница','cms',NULL),(284,'Описание',NULL,'Описание','cms',NULL),(285,'redirect301',NULL,'Редирект 301','cms',NULL),(287,'email_template',NULL,'Email шаблоны','cms',NULL),(288,'Имя',NULL,'Имя','frontend',NULL),(289,'Email',NULL,'Email','frontend',NULL),(290,'Invalid mime type (%mime_type%).',NULL,'Неверный формат файла (%mime_type%).','frontend',NULL),(291,'Password',NULL,'Пароль','frontend',NULL),(292,'Регистрация',NULL,'Регистрация','frontend',NULL),(293,'ссылке',NULL,'ссылке','frontend',NULL),(295,'Notifications',NULL,'Уведомления','cms',NULL),(296,'Pages',NULL,'Страницы','cms',NULL),(297,'Apply',NULL,'Применить','frontend',NULL),(298,'Discard',NULL,'Отменить','frontend',NULL),(299,'Данные сохранены',NULL,'Данные сохранены','frontend',NULL),(301,'Изображение удалено',NULL,'Изображение удалено','frontend',NULL),(303,'Код введен неверно',NULL,'Код введен неверно','frontend',NULL),(304,'Такой email не зарегистрирован в системе',NULL,'Такой email не зарегистрирован в системе','frontend',NULL),(305,' csrf token',NULL,'CSRF токен','frontend',NULL),(306,'The item was deleted successfully.',NULL,'Этот пункт был успешно удален.','cms',NULL),(307,'You must select an action to execute on the selected items.',NULL,'Вы должны выбрать действие для выполнения на выбранных элементах.','cms',NULL),(308,'The selected items have been deleted successfully.',NULL,'Выбранные элементы были успешно удалены.','cms',NULL),(310,'Cообщения с сайта',NULL,'Cообщения с сайта','cms',NULL),(311,'Да, это мой email-аккаунт!',NULL,'Да, это мой email аккаунт!','frontend',NULL),(312,'Подтвердить email аккаунт!',NULL,'Подтвердить email аккаунт!','frontend',NULL),(313,'Подтверждаю!',NULL,'Подтверждаю!','frontend',NULL),(314,'Войти с помощью:',NULL,'Войти с помощью:','frontend',NULL);
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
INSERT INTO `menu_item` (`id`, `name`, `root_name`, `type`, `page_id`, `cms_module_id`, `route`, `external`, `is_empty`, `is_auth`, `icon_class`, `root_id`, `lft`, `rgt`, `level`) VALUES (1,'Главное меню','main','empty',NULL,NULL,NULL,NULL,1,0,NULL,1,1,52,0),(2,'На главную','','route',1,NULL,'homepage','',1,0,NULL,1,1,1,1),(3,'О нас',NULL,'page',2,NULL,NULL,NULL,1,0,NULL,1,44,45,1),(4,'Контакты',NULL,'module',3,2,'','',1,0,NULL,1,46,47,1),(5,'Закрытый раздел',NULL,'page',14,NULL,'','',1,1,'',1,50,51,1),(6,'Нижнее меню','bottom','empty',NULL,NULL,NULL,NULL,1,0,NULL,6,6,NULL,0),(7,'Политика конфиденциальности',NULL,'page',13,NULL,'','',1,0,'',6,6,5,1),(8,'Пользовательское соглашение',NULL,'page',12,NULL,'','',1,0,'',6,6,5,1);
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
INSERT INTO `email_template` (`id`, `name`, `subject`, `message`) VALUES (1,'registration_user','Регистрация на проекте DEV2','Здравствуйте, {%first_name%}! Вы успешно прошли регистрацию! Перейдите по {%link%}, чтобы активировать свой аккаунт!'),(2,'registration_admin','Регистрация нового пользователя','Пользователь {%full_name%} зарегистрировался'),(3,'password_recovery_user','Восстановление пароля','Доброго времени суток, {%full_name%} Вы запросили воcстановление пароля на сайте Dev2.Перейдите по {%LINK%} для установки нового пароля.Если запрос отправляли не Вы, проигнорируйте это письмо.'),(4,'contactus_message_user','Проект DEV2. Ваше сообщение очень важно для нас!','Уважаемый {%name%}! Спасибо за Ваше сообщение! Оно очень важно для нас!'),(5,'contactus_message_admin','Проект DEV2. Новое сообщение','Некто {%name%} прислал сообщение. Текст: {%message%} E-Mail: {%email%}'),(6,'social_bridge_user_confirm_email_user','demo.web375.org - Подтверждение электронного адреса в соцсети {%network_name%}','Подтвердите Email {%email%}, перейдя по ссылке {%link%} Либо используйте данный код {%token%} ');
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

-- Dump completed on 2014-11-05 20:21:57

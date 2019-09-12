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
INSERT INTO `page` (`id`, `name`, `content`, `is_module_page`, `module_name`, `is_content_editable`, `special_mark`, `is_redirect`, `redirect_route`, `redirect_timeout`, `layout`, `slug`, `meta_title`, `meta_description`, `meta_keywords`) VALUES (1,'Herzlich Willkommen!','Grüße an Sie, junger Freund! Sie kam auf diese Seite, weil Sie sich eine Website benötigen. Oder vielleicht sind Sie gerade hierher gekommen durch Zufall! Auf jeden Fall willkommen!',1,'default',1,'default',0,'/',5,'','herzlich-willkommen','Willkommen auf der Webseite des Projekts DEV2!','',''),(2,'Über uns','Wir sind ein junges, aber bereits sehr erfahrenes Unternehmen in der Entwicklung und Förderung von Web-Seiten engagiert',0,NULL,1,NULL,0,'/',5,'','ueber-uns','Über das Projekt','',''),(3,'Rückkopplung','Senden Sie uns eine Nachricht und wir werden uns so schnell wie möglich kontaktieren!',0,NULL,1,'contactus',0,'/',5,'','rueckkopplung','Kontakt - Projekt DEV2','',''),(4,'Anmeldung','',0,NULL,0,'register',0,'/',5,NULL,'anmeldung','Anmeldung','',''),(5,'Passwort-Wiederherstellung','Klicken Sie auf \"Passwort wiederherstellen\" und wir schicken eine E-Mail, um Ihre E-Mail-Konto, das auf die Passwort-Wiederherstellung Verlinken senden',0,NULL,1,'auth_forgot_password',0,'/',5,NULL,'passwort-wiederherstellung','Passwort-Wiederherstellung','',''),(6,'Passwort-Wiederherstellung. E-Mail gesendet.','E-Mail wurde an Ihre E-Mail-Konto gesendet wurden',0,NULL,1,'auth_forgot_password_thanks',1,'/',5,'','passwort-wiederherstellung-e-mail-gesendet','Passwort-Wiederherstellung. E-Mail gesendet.','',''),(7,'Passwort-Wiederherstellung. gesendeten SMS','',0,NULL,1,'auth_forgot_sms',0,'/',5,NULL,'passwort-wiederherstellung-gesendeten-sms','Passwort-Wiederherstellung. gesendeten SMS','',''),(8,'Erfinde ein neues Passwort','',0,NULL,1,'auth_password_recovery',0,'/',5,NULL,'erfinde-ein-neues-passwort','Erfinde ein neues Passwort','',''),(9,'Ihr persönlicher Bereich','',0,NULL,1,'auth_signin',0,'/',5,NULL,'ihr-persoenlicher-bereich','Ihr persönlicher Bereich','',''),(10,'Registrierung übergeben wird','Wir gemailt weitere Registrierung Anweisungen, um Ihre E-Mail-Adresse',0,NULL,1,'auth_registration_complete',1,'/',5,NULL,'registrierung-uebergeben-wird','Registrierung übergeben wird','',''),(11,'Die Aktivierung ist bestanden','Jetzt können Sie sich einloggen!',0,NULL,1,'auth_activation_successful',1,'/profile',3,'','die-aktivierung-ist-bestanden','Die Aktivierung ist bestanden','',''),(12,'Benutzervereinbarung','Hier ist ein absolut typisches Anwenderabkommen',0,NULL,1,'user_agreement',0,'/',5,'','benutzervereinbarung','Benutzervereinbarung','',''),(13,'Datenschutz-Bestimmungen','Hier ist ein absolut typisches Seite über Datenschutzbestimmungen',0,NULL,1,'privacy_policy',0,'/',5,'','datenschutz-bestimmungen','Datenschutz-Bestimmungen','',''),(14,'Forum geschlossen','Wenn Sie über diese Seite kommen, bedeutet das, Sie ein autorisierter Benutzer sind!',0,NULL,1,NULL,0,'/',5,NULL,'forum-geschlossen','Forum geschlossen','',''),(15,'Dies ist eine Testseite','',0,NULL,1,NULL,0,'/',5,'','dies-ist-eine-testseite','Dies ist eine Testseite','',''),(16,'Error 404','Fehler 404 Seite nicht gefunden',0,NULL,1,'error404',0,'/',5,NULL,'error-404','Error 404','',''),(17,'Mein Profil','Hier können Sie Ihre persönlichen Daten zu bearbeiten, ein Foto hochladen und das Passwort ändern',0,NULL,0,'profile',0,'/',5,NULL,'mein-profil','Mein Profil','',''),(18,'Mein Profil - Passwort ändern','Wir speichern Ihr Passwort in verschlüsselter Form.',0,NULL,0,'profile_password',0,'/',5,NULL,'mein-profil-passwort-aendern','Mein Profil - Passwort ändern','',''),(19,'Mein Profil - Edit Foto','',0,NULL,0,'profile_avatar',0,'/',5,NULL,'mein-profil-edit-foto','Mein Profil - Edit Foto','',''),(20,'IP-Adresse blockiert wird','Leider unklaren Gründen, Ihre Adresse wurde gesperrt! Danke!',0,NULL,1,'ip_banned',0,'/',5,'empty','ip-adresse-blockiert-wird','IP-Adresse blockiert wird','',''),(21,'Bitte registrieren oder einloggen','Um den Inhalt dieses Abschnitts sehen, bitte melden Sie sich an',0,NULL,1,'auth_secure',0,'/',5,NULL,'bitte-registrieren-oder-einloggen','Bitte registrieren oder einloggen','',''),(22,'Confirmation of account in socConfirm your social networks accountial networks','Achtung! Email {%email%} existiert bereits im System! Wenn dies Ihr E-Mail, bestätigen Sie es!',0,NULL,1,'oauth_bridge',0,'/',5,NULL,'confirmation-of-account-in-socconfirm-your-social-networks-accountial-networks','Ihren sozialen Netzwerken angemeldet Bestätigen','',''),(23,'Bestätigen Sie Ihre sozialen Netzwerke Konto. Schritt zwei','Bestätigungsschreiben wurde an Ihre E-Mail-Adresse gesendet wurde, {%email%}',0,NULL,1,'oauth_bridge_confirm',0,'/',5,NULL,'bestaetigen-sie-ihre-sozialen-netzwerke-konto-schritt-zwei','Ihren sozialen Netzwerken angemeldet Bestätigen','',''),(24,'OAuth Berechtigungsfehler','',0,NULL,1,'oauth_error',0,'/',5,NULL,'oauth-berechtigungsfehler','OAuth Berechtigungsfehler','','');
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
INSERT INTO `text_block` (`id`, `name`, `title`, `text`, `application`, `module`) VALUES (1,'Username',NULL,'Benutzername','cms',NULL),(2,'Password',NULL,'Kennwort','cms',NULL),(3,'Remember?',NULL,'Mich erinnern?','cms',NULL),(4,'Login',NULL,'Login','cms',NULL),(5,'Welcome to',NULL,'Willkommen','cms',NULL),(6,'Use a valid username and password to gain access to the administration console.',NULL,'Verwenden Sie einen gültigen Benutzernamen und Kennwort ein, um Zugriff auf die Administrationskonsole zu gewinnen.','cms',NULL),(7,'Вход',NULL,'Login','frontend',NULL),(8,'Ваша компания',NULL,'Deine Firma','frontend',NULL),(9,'Разработка и поддержка',NULL,'Entwicklung und Begleitung','frontend',NULL),(11,'Blog',NULL,'Blog','cms',NULL),(12,'Posts',NULL,'Nachrichten','cms',NULL),(13,'Comments',NULL,'Kommentare','cms',NULL),(14,'Tags',NULL,'Schlagwörter','cms',NULL),(15,'Users',NULL,'Benutzer','cms',NULL),(16,'Settings',NULL,'Einstellungen','cms',NULL),(18,'Email шаблоны',NULL,'E-Mail-Vorlagen','cms',NULL),(21,'Сообщения',NULL,'Nachrichten','cms',NULL),(28,'Локализация',NULL,'Lokalisierung','cms',NULL),(33,'Добавить',NULL,'Hinzufügen','cms',NULL),(34,'Go to Frontend',NULL,'Go to site','cms',NULL),(35,'Logout',NULL,'Ausgang','cms',NULL),(36,'dashboard',NULL,'Armaturenbrett','cms',NULL),(37,'Профиль',NULL,'Profil','frontend',NULL),(38,'Выход',NULL,'Ausgang','frontend',NULL),(39,'Админка',NULL,'Admin','frontend',NULL),(40,'Page List',NULL,'Liste der Seiten','cms',NULL),(41,'Name',NULL,'Titel','cms',NULL),(42,'Slug',NULL,'URL','cms',NULL),(43,'Actions',NULL,'Aktionen','cms',NULL),(44,'First page',NULL,'Erste Seite','cms',NULL),(45,'Previous page',NULL,'Vorherige Seite','cms',NULL),(46,'Next page',NULL,'Nächste Seite','cms',NULL),(47,'Last page',NULL,'Letzte Seite','cms',NULL),(48,'[0] no result|[1] 1 result|(1,+Inf] %1% results',NULL,'[0] kein Ergebnis|[1] 1 Ergebnis|(1,+Inf] %1% Ergebnisse','cms',NULL),(49,'(page %%page%%/%%nb_pages%%)',NULL,'(Seite%%page%%/%%nb_pages%%)','cms',NULL),(50,'Edit',NULL,'Bearbeiten','cms',NULL),(51,'Delete',NULL,'Löschen','cms',NULL),(52,'Are you sure?',NULL,'Sind Sie sicher?','cms',NULL),(53,'Choose an action',NULL,'Wählen Sie eine Aktion','cms',NULL),(54,'go',NULL,'Go!','cms',NULL),(55,'New',NULL,'Neu','cms',NULL),(56,'Blog Posts',NULL,'Blogeinträge','cms',NULL),(57,'Reset',NULL,'Rücksetzen','cms',NULL),(58,'Filter',NULL,'Filter','cms',NULL),(59,'No result',NULL,'Kein Ergebnis','cms',NULL),(60,'New Page',NULL,'Neue Seite','cms',NULL),(61,'Content',NULL,'Inhalt','cms',NULL),(62,'Включить редирект',NULL,'Aktivieren Umleitung','cms',NULL),(63,'Redirect route',NULL,'Umleitung auf','cms',NULL),(64,'Redirect timeout',NULL,'Redirection Timeout','cms',NULL),(65,'Layout',NULL,'Layout','cms',NULL),(66,'Meta title',NULL,'Meta Titel','cms',NULL),(67,'Meta description',NULL,'Meta Beschreibung','cms',NULL),(68,'Meta keywords',NULL,'Meta-Keywords','cms',NULL),(69,'Back to list',NULL,'Zurück zur Liste','cms',NULL),(70,'Save',NULL,'Speichern','cms',NULL),(71,'Save and add',NULL,'Speichern und fügen','cms',NULL),(72,'УРЛ-метка',NULL,'URL-Tag','cms',NULL),(73,'Edit Page',NULL,'Diese Seite bearbeiten','cms',NULL),(74,'User list',NULL,'Benutzerliste','cms',NULL),(75,'Created at',NULL,'Erstellt in','cms',NULL),(76,'Updated at',NULL,'Aktualisiert am','cms',NULL),(77,'Last login',NULL,'Letzte Anmeldung','cms',NULL),(78,'user',NULL,'Benutzer','cms',NULL),(79,'New User',NULL,'Neuer Benutzer','cms',NULL),(80,'User',NULL,'Benutzer','cms',NULL),(81,'First name',NULL,'Vorname','cms',NULL),(82,'Last name',NULL,'Nachname','cms',NULL),(83,'Email address',NULL,'E-Mail-Adresse','cms',NULL),(84,'Password (again)',NULL,'Passwort (wieder)','cms',NULL),(85,'Permissions',NULL,'Berechtigungen','cms',NULL),(86,'Is active',NULL,'Ist aktiv','cms',NULL),(87,'Is super admin',NULL,'Ist super Admin','cms',NULL),(88,'Editing User \"%%username%%\"',NULL,'Edit \"%%username%%\"','cms',NULL),(89,'dictionary',NULL,'Wörterbuch','cms',NULL),(90,'Title',NULL,'Titel','cms',NULL),(91,'Value',NULL,'Wert','cms',NULL),(92,'settings',NULL,'Einstellungen','cms',NULL),(93,'Email template List',NULL,'Liste der E-Mail-Vorlagen','cms',NULL),(94,'Id',NULL,'Identifikation','cms',NULL),(95,'Subject',NULL,'Thema','cms',NULL),(96,'Message',NULL,'Nachricht','cms',NULL),(98,'Edit Email template',NULL,'Bearbeiten E-Mail-Vorlage','cms',NULL),(99,'New Email template',NULL,'Neue Vorlage Email','cms',NULL),(100,'Ваше имя',NULL,'Ihren Namen','frontend',NULL),(101,'Ваш Email',NULL,'Ihre E-Mail','frontend',NULL),(102,'Нужен для обратной связи',NULL,'Brauchen Sie für Rückfragen','frontend',NULL),(103,'Ваше сообщение',NULL,'Ihre Nachricht','frontend',NULL),(104,'Reload image',NULL,'Refresh Image','frontend',NULL),(105,'Введите код с картинки',NULL,'Geben Sie den Code aus dem Bild','frontend',NULL),(106,'Показатели',NULL,'Anzeigen','cms',NULL),(107,'Имя',NULL,'Name','cms',NULL),(108,'Email',NULL,'E-Mail','cms',NULL),(109,'desc',NULL,'Absteigend','cms',NULL),(110,'Просмотр',NULL,'Ausblick','cms',NULL),(111,'Создать пользователя',NULL,'Benutzer erstellen','cms',NULL),(112,'Export',NULL,'Export','cms',NULL),(113,'The item was updated successfully.',NULL,'Dieser Artikel wurde erfolgreich aktualisiert.','cms',NULL),(114,'Неверный формат',NULL,'Ungültiges Format','frontend',NULL),(115,'System settings',NULL,'Systemeinstellungen','cms',NULL),(116,'Section',NULL,'Abschnitt','cms',NULL),(118,'Email error List',NULL,'E-Mail-Fehlerliste','cms',NULL),(119,'Email from',NULL,'Von wem','cms',NULL),(120,'Email to',NULL,'Denen','cms',NULL),(121,'Body',NULL,'Körper','cms',NULL),(122,'Cc',NULL,'Kopie','cms',NULL),(123,'File',NULL,'Datei','cms',NULL),(132,'Filters',NULL,'Filter','cms',NULL),(133,'is empty',NULL,'Leer','cms',NULL),(134,'Мой профиль',NULL,'Mein Profil','frontend',NULL),(135,'Фотография',NULL,'Foto','frontend',NULL),(136,'Изменить пароль',NULL,'Kennwort ändern','frontend',NULL),(137,'Отчество',NULL,'Vatersname','frontend',NULL),(138,'Фамилия',NULL,'Nachname','frontend',NULL),(139,'Дата рождения\n(дд.мм.гггг)',NULL,'DOB','frontend',NULL),(140,'Телефон мобильный\n(для получения уведомлений)',NULL,'Mobiltelefon (zur Meldung)','frontend',NULL),(141,'Сохранить изменения',NULL,'Änderungen speichern','frontend',NULL),(142,'Старый пароль',NULL,'Altes Passwort','frontend',NULL),(143,'Новый пароль',NULL,'Neues Passwort','frontend',NULL),(144,'Новый пароль еще раз',NULL,'Neues Passwort wieder','frontend',NULL),(145,'Сохранить пароль',NULL,'Kennwort speichern','frontend',NULL),(146,'Заполните поле',NULL,'Füllen Sie das Feld','frontend',NULL),(147,'Passwords do not match',NULL,'Passwörter stimmen nicht überein','frontend',NULL),(148,'Выберите картинку из загрузите ее',NULL,'Wählen Sie ein Bild und laden Sie sie','frontend',NULL),(149,'Image',NULL,'Bild','frontend',NULL),(150,'Загрузить фотографию',NULL,'Bild einschicken','frontend',NULL),(151,'File is too large (maximum is %max_size% bytes).',NULL,'Die Datei ist zu groß (maximal%max_size%).','frontend',NULL),(152,'Вы можете выбрать зону, которая будет отображаться на ваших аватарках. Кликните по одному из изображений справа',NULL,'Sie können den Bereich auswählen, die auf Ihre Bilder angezeigt werden. Klicken Sie auf eines der kleinen Bilder rechts','frontend',NULL),(153,'remove the current file',NULL,'Löschen Sie die aktuelle Datei','frontend',NULL),(154,'Сохранить',NULL,'Speichern','frontend',NULL),(155,'Вы уверены?',NULL,'Sind Sie sicher?','frontend',NULL),(156,'Удалить фотографию',NULL,'Bild löschen','frontend',NULL),(157,'Логин (Ваш Email)',NULL,'Benutzername (Ihre E-Mail)','frontend',NULL),(158,'Запомнить меня на этом компьютере',NULL,'Mich auf diesem Computer','frontend',NULL),(159,'Войти',NULL,'Login','frontend',NULL),(160,'Забыли пароль?',NULL,'Passwort vergessen?','frontend',NULL),(161,'Registration',NULL,'Anmeldung','frontend',NULL),(162,'The username and/or password is invalid.',NULL,'Falsche Login oder Passwort','frontend',NULL),(163,'Введите код',NULL,'Geben Sie den Code','frontend',NULL),(164,'Письмо отправлено',NULL,'E-Mail gesendet','frontend',NULL),(165,'Ваш email',NULL,'Ihre E-Mail','frontend',NULL),(166,'Восстановить пароль',NULL,'Passwort vergessen?','frontend',NULL),(167,'Повторите пароль',NULL,'Passwort bestätigen','frontend',NULL),(168,'Я принимаю условия',NULL,'Ich akzeptiere die Bedingungen','frontend',NULL),(169,'Такой email уже зарегистрирован в ситеме',NULL,'Diese E-Mail ist bereits im System registriert','frontend',NULL),(170,'Пароли не совпадают',NULL,'Passwörter stimmen nicht überein','frontend',NULL),(171,'Вы должны принять условия пользовательского соглашения',NULL,'Sie müssen die Nutzungsbedingungen akzeptieren','frontend',NULL),(172,'Пароль должен быть не короче 4 символов',NULL,'Das Passwort muss mindestens 4 Zeichen lang sein','frontend',NULL),(173,'Еще раз пароль',NULL,'Bestätigen Sie Ihr Passwort','frontend',NULL),(174,'Сменить пароль',NULL,'Kennwort ändern','frontend',NULL),(175,'Пароль слишком короткий',NULL,'Passwort ist zu kurz','frontend',NULL),(176,'Пароль восстановлен',NULL,'Passwort erholt','frontend',NULL),(177,'Password is invalid.',NULL,'Ungültiges Kennwort','frontend',NULL),(178,'События за сегодня',NULL,'Termine für heute','cms',NULL),(179,'Всего событий',NULL,'Veranstaltungen insgesamt','cms',NULL),(180,'All rights reserved',NULL,'Alle Rechte vorbehalten','cms',NULL),(181,'Date',NULL,'Datum','cms',NULL),(182,'Is published',NULL,'Veröffentlicht','cms',NULL),(183,'yes or no',NULL,'Ja oder nein','cms',NULL),(184,'yes',NULL,'Ja','cms',NULL),(185,'no',NULL,'Keine','cms',NULL),(186,'From',NULL,'Aus','cms',NULL),(187,'To',NULL,'Auf','cms',NULL),(188,'New Blog post',NULL,'Neuer Blog','cms',NULL),(189,'Brief',NULL,'Kurz','cms',NULL),(190,'Text',NULL,'Text','cms',NULL),(191,'Url',NULL,'URL','cms',NULL),(193,'пользовательского соглашения',NULL,'Benutzervereinbarung','frontend',NULL),(194,'The item was created successfully.',NULL,'Dieser Artikel wurde erfolgreich erstellt.','cms',NULL),(195,'You don\'t have proper credentials to access this page',NULL,'Sie haben nicht die richtigen Anmeldeinformationen, um diese Seite zuzugreifen','cms',NULL),(197,'Secure',NULL,'Forum geschlossen','cms',NULL),(210,'Server is not responding',NULL,'Der Server antwortet nicht','cms',NULL),(211,'Data saved',NULL,'Daten gespeichert','cms',NULL),(212,'Error while saving data',NULL,'Fehler beim Speichern der Daten','cms',NULL),(217,'Unexpected extra form field named \"%field%\".',NULL,'Unerwartete zusätzliche Formularfeld mit dem Namen \"%field%\".','cms',NULL),(221,'Вы можете править текст прямо в списке. Исправьте все, что считаете нужным, а затем нажмите TAB или щелкните мышью в любом месте вне поля ввода.',NULL,'Sie können den Text direkt in der Liste bearbeiten. Korrigieren Sie alles, was gelten, und drücken Sie TAB oder klicken Sie auf eine beliebige Stelle außerhalb des Eingabefeldes.','cms',NULL),(222,'Воспользуйтесь фильтром, чтобы найти нужный вам текст',NULL,'Bitte benutzen Sie den Filter, um den gewünschten Text zu finden','cms',NULL),(223,'Отправить',NULL,'Senden','frontend',NULL),(224,'The item has not been saved due to some errors.',NULL,'Das Objekt wurde nicht aufgrund einiger Fehler gespeichert','cms',NULL),(225,'An object with the same \"%column%\" already exist.',NULL,'Das Objekt mit dem Wert des Feldes \"%Spalte%\" ist bereits in dem System.','cms',NULL),(226,'Update',NULL,'Aktualisierung','cms',NULL),(235,'Страницы',NULL,'Seite','cms',NULL),(236,'Пользователи',NULL,'Benutzer','cms',NULL),(237,'Настройки',NULL,'Einstellungen','cms',NULL),(238,'Редирект 301',NULL,'301S','cms',NULL),(239,'Уведомления',NULL,'Bekanntmachung','cms',NULL),(241,'Url from',NULL,'Woher','cms',NULL),(242,'Url to',NULL,'Wo','cms',NULL),(243,'Comment',NULL,'Beschreibung','cms',NULL),(245,'from %from_date%<br />to %to_date%',NULL,'Von%from_date%bis%to_date%','cms',NULL),(246,'Checked',NULL,'Bekannt','cms',NULL),(248,'You must at least select one item.',NULL,'Sie müssen mindestens ein Objekt auswählen','cms',NULL),(249,'blog_post',NULL,'Blog-Post','cms',NULL),(250,'Extra',NULL,'Zusätzlich','cms',NULL),(251,'Edit Blog post',NULL,'Bearbeiten Sie einen Blogeintrag','cms',NULL),(252,'The begin date must be before the end date.',NULL,'Startdatum muss kleiner als das Enddatum sein','cms',NULL),(257,'%%title%%',NULL,'%%title%%','cms',NULL),(258,'Email администратора',NULL,'E-Mail-Administrator','cms',NULL),(259,'На этот адрес вам будут приходить сообщения с сайта',NULL,'Unter dieser Adresse finden Sie Nachrichten aus dem Ort erhalten','cms',NULL),(260,'Имя отправителя почты',NULL,'E-Mail Absendernamen','cms',NULL),(261,'От этого имени сайт будет отправлять почту',NULL,'Alle E-Mails werden im Namen dieser Name gesendet werden','cms',NULL),(263,'Адрес',NULL,'Adresse','cms',NULL),(264,'Контактный телефон',NULL,'Kontakt Telefon','cms',NULL),(265,'Контактный email',NULL,'Kontakt per E-Mail','cms',NULL),(266,'Type',NULL,'Typ','cms',NULL),(267,'Description',NULL,'Beschreibung','cms',NULL),(268,'Admin email',NULL,'E-Mail an den Administrator','cms',NULL),(269,'User email',NULL,'E-Mail an den Benutzer','cms',NULL),(270,'Phone number',NULL,'Telefonnummer','cms',NULL),(271,'Company name',NULL,'Name der Firma','cms',NULL),(272,'Attach',NULL,'Angehängte Datei','cms',NULL),(275,'Show',NULL,'Show','cms',NULL),(279,'Password recovery',NULL,'Passwort-Wiederherstellung','cms',NULL),(281,'Registration',NULL,'Anmeldung','cms',NULL),(283,'Page',NULL,'Seite','cms',NULL),(284,'Описание',NULL,'Beschreibung','cms',NULL),(285,'redirect301',NULL,'301S','cms',NULL),(287,'email_template',NULL,'E-Mail-Vorlagen','cms',NULL),(288,'Имя',NULL,'Vorname','frontend',NULL),(289,'Email',NULL,'E-Mail','frontend',NULL),(290,'Invalid mime type (%mime_type%).',NULL,'Falsche Dateiformat (%mime_type%).','frontend',NULL),(291,'Password',NULL,'Kennwort','frontend',NULL),(292,'Регистрация',NULL,'Anmeldung','frontend',NULL),(293,'ссылке',NULL,'Link','frontend',NULL),(295,'Notifications',NULL,'Benachrichtigungen','cms',NULL),(296,'Pages',NULL,'Seiten','cms',NULL),(297,'Apply',NULL,'Anwenden','frontend',NULL),(298,'Discard',NULL,'Stornieren','frontend',NULL),(299,'Данные сохранены',NULL,'Änderungen gespeichert!','frontend',NULL),(301,'Изображение удалено',NULL,'Bild entfernt','frontend',NULL),(303,'Код введен неверно',NULL,'Der eingegebene Code ist ungültig','frontend',NULL),(304,'Такой email не зарегистрирован в системе',NULL,'Diese E-Mail wird nicht im System registriert','frontend',NULL),(305,' csrf token',NULL,'CSRF-Token','frontend',NULL),(306,'The item was deleted successfully.',NULL,'Der Artikel wurde erfolgreich gelöscht.','cms',NULL),(307,'You must select an action to execute on the selected items.',NULL,'Sie müssen eine Aktion auswählen, die für die ausgewählten Objekte auszuführen.','cms',NULL),(308,'The selected items have been deleted successfully.',NULL,'Die ausgewählten Elemente wurden erfolgreich gelöscht.','cms',NULL),(310,'Cообщения с сайта',NULL,'Nachrichten von Website','cms',NULL),(311,'Да, это мой email-аккаунт!',NULL,'Ja, das ist meine E-Mail-Konto!','frontend',NULL),(312,'Подтвердить email аккаунт!',NULL,'Bestätigen Sie E-Mail-Konto!','frontend',NULL),(313,'Подтверждаю!',NULL,'Zustimmen!','frontend',NULL),(314,'Войти с помощью:',NULL,'Einloggen mit:','frontend',NULL);
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
INSERT INTO `menu_item` (`id`, `name`, `root_name`, `type`, `page_id`, `cms_module_id`, `route`, `external`, `is_empty`, `is_auth`, `icon_class`, `root_id`, `lft`, `rgt`, `level`) VALUES (1,'Hauptmenü','main','empty',NULL,NULL,NULL,NULL,1,0,NULL,1,1,52,0),(2,'Zuhause','','route',1,NULL,'homepage','',1,0,NULL,1,1,1,1),(3,'Über uns',NULL,'page',2,NULL,NULL,NULL,1,0,NULL,1,44,45,1),(4,'Kontakte',NULL,'module',3,2,'','',1,0,NULL,1,46,47,1),(5,'Forum geschlossen',NULL,'page',14,NULL,'','',1,1,'',1,50,51,1),(6,'Footer Menü','bottom','empty',NULL,NULL,NULL,NULL,1,0,NULL,6,6,NULL,0),(7,'Datenschutz-Bestimmungen',NULL,'page',13,NULL,'','',1,0,'',6,6,5,1),(8,'Benutzervereinbarung',NULL,'page',12,NULL,'','',1,0,'',6,6,5,1);
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
INSERT INTO `email_template` (`id`, `name`, `subject`, `message`) VALUES (1,'registration_user','Registrieren Sie sich auf der Projekt DEV2','Hallo, {%vorname%}! Sie haben sich erfolgreich registriert! Folgen Sie dieser {%link%}, um Ihr Konto zu aktivieren!'),(2,'registration_admin','Neu registrieren','Benutzer {%full_name%} bei uns registriert!'),(3,'password_recovery_user','Passwort-Wiederherstellung','Guten Tag, {%full_name%} Sie haben Passwort-Wiederherstellung auf Dev2 Projekt angefordert. Folgen Sie dieser {%LINK%}, um ein neues Passwort festzulegen. Wenn Sie noch kein Passwort-Wiederherstellung angefordert, ignorieren Sie bitte diesen Brief.'),(4,'contactus_message_user','Projekt DEV2. Ihre Nachricht ist uns wichtig!','Sehr geehrte {%name%}! Vielen Dank für Ihre Nachricht! Es ist sehr wichtig für uns!'),(5,'contactus_message_admin','Projekt DEV2. neue Nachricht','Jemand {%name%} eine Nachricht geschickt. Text: {%message%} E-Mail: {%email%}'),(6,'social_bridge_user_confirm_email_user','Demo.web375.org - Bestätigen Sie Ihre E-Mail-Adresse in das soziale Netzwerk {%network_name%}','Bestätigen Email {%email%}, folgen Sie dem Link {%link%} oder verwenden Sie diesen Code {%token%}');
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

-- Dump completed on 2014-11-05 20:22:31

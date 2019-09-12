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
INSERT INTO `page` (`id`, `name`, `content`, `is_module_page`, `module_name`, `is_content_editable`, `special_mark`, `is_redirect`, `redirect_route`, `redirect_timeout`, `layout`, `slug`, `meta_title`, `meta_description`, `meta_keywords`) VALUES (1,'Välkomna!','Hälsningar till dig, unge vän! Du kom till denna plats eftersom du själv behöver en hemsida. Eller kanske du bara kom hit av en slump! I varje fall, välkommen!',1,'default',1,'default',0,'/',5,'','vaelkomna','Välkommen till webbplatsen för projektet dev2!','',''),(2,'Om oss','Vi är en ung men redan mycket erfarna företag som arbetar med utveckling och främjande av webbplatser',0,NULL,1,NULL,0,'/',5,'','om-oss','Om projektet','',''),(3,'Respons','Skicka ett meddelande till oss så kontaktar vi dig så snart som möjligt!',0,NULL,1,'contactus',0,'/',5,'','respons','Kontakta oss - Project dev2','',''),(4,'Registrering','',0,NULL,0,'register',0,'/',5,NULL,'registrering','Registrering','',''),(5,'Lösenordshämtning','Klicka på \"Återställ lösenord\" så skickar vi ett mail till ditt e-postkonto som kommer att länka till återställning av lösenord sidan',0,NULL,1,'auth_forgot_password',0,'/',5,NULL,'loesenordshaemtning','Lösenordshämtning','',''),(6,'Återställning av lösenord. E-post skickas.','E-post har skickats till ditt e-postkonto',0,NULL,1,'auth_forgot_password_thanks',1,'/',5,'','aaterstaellning-av-loesenord-e-post-skickas','Återställning av lösenord. E-post skickas.','',''),(7,'Återställning av lösenord. skickas SMS','',0,NULL,1,'auth_forgot_sms',0,'/',5,NULL,'aaterstaellning-av-loesenord-skickas-sms','Återställning av lösenord. skickas SMS','',''),(8,'Uppfinna ett nytt lösenord','',0,NULL,1,'auth_password_recovery',0,'/',5,NULL,'uppfinna-ett-nytt-loesenord','Uppfinna ett nytt lösenord','',''),(9,'Din Personal Area','',0,NULL,1,'auth_signin',0,'/',5,NULL,'din-personal-area','Din Personal Area','',''),(10,'Anmälan skickas','Vi mailade ytterligare registreringsinstruktioner till din e-postadress',0,NULL,1,'auth_registration_complete',1,'/',5,NULL,'anmaelan-skickas','Anmälan skickas','',''),(11,'Aktivering ledes','Nu kan du logga in!',0,NULL,1,'auth_activation_successful',1,'/profile',3,'','aktivering-ledes','Aktivering ledes','',''),(12,'Användaravtalet','Här är ett avtal helt typisk användare',0,NULL,1,'user_agreement',0,'/',5,'','anvaendaravtalet','Användaravtalet','',''),(13,'Integritetspolicy','Här är en helt vanlig sida om integritetspolicy',0,NULL,1,'privacy_policy',0,'/',5,'','integritetspolicy','Integritetspolicy','',''),(14,'Ett stängt forum','Om du stöter på den här sidan, betyder det att du är en behörig användare!',0,NULL,1,NULL,0,'/',5,NULL,'ett-staengt-forum','Ett stängt forum','',''),(15,'Detta är en testsida','',0,NULL,1,NULL,0,'/',5,'','detta-aer-en-testsida','Detta är en testsida','',''),(16,'Error 404','Fel 404. Sidan kunde inte hittas',0,NULL,1,'error404',0,'/',5,NULL,'error-404','Error 404','',''),(17,'Min profil','Här kan du redigera din personliga information, ladda upp ett foto och att ändra lösenordet',0,NULL,0,'profile',0,'/',5,NULL,'min-profil','Min profil','',''),(18,'Min profil - Ändra lösenord','Vi lagrar ditt lösenord i krypterad form.',0,NULL,0,'profile_password',0,'/',5,NULL,'min-profil-aendra-loesenord','Min profil - Ändra lösenord','',''),(19,'Min profil - Redigera foto','',0,NULL,0,'profile_avatar',0,'/',5,NULL,'min-profil-redigera-foto','Min profil - Redigera foto','',''),(20,'IP-adress är blockerad','Tyvärr, på oklara grunder, din adress har blockerats! Tack!',0,NULL,1,'ip_banned',0,'/',5,'empty','ip-adress-aer-blockerad','IP-adress är blockerad','',''),(21,'Vänligen registrera eller logga in','För att se innehållet i det här avsnittet, vänligen logga in',0,NULL,1,'auth_secure',0,'/',5,NULL,'vaenligen-registrera-eller-logga-in','Vänligen registrera eller logga in','',''),(22,'Confirmation of account in socConfirm your social networks accountial networks','Observera! E {%email%} finns redan i systemet! Om detta är din e-post, bekräfta det!',0,NULL,1,'oauth_bridge',0,'/',5,NULL,'confirmation-of-account-in-socconfirm-your-social-networks-accountial-networks','Bekräfta ditt sociala nätverk konto','',''),(23,'Bekräfta ditt sociala nätverk konto. steg två','Bekräftelsebrev har skickats till din e-postadress {%email%}',0,NULL,1,'oauth_bridge_confirm',0,'/',5,NULL,'bekraefta-ditt-sociala-naetverk-konto-steg-tvaa','Bekräfta ditt sociala nätverk konto','',''),(24,'OAuth tillståndsfelet','',0,NULL,1,'oauth_error',0,'/',5,NULL,'oauth-tillstaandsfelet','OAuth tillståndsfelet','','');
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
INSERT INTO `text_block` (`id`, `name`, `title`, `text`, `application`, `module`) VALUES (1,'Username',NULL,'Användarnamn','cms',NULL),(2,'Password',NULL,'Lösenord','cms',NULL),(3,'Remember?',NULL,'Kom ihåg mig?','cms',NULL),(4,'Login',NULL,'Inloggning','cms',NULL),(5,'Welcome to',NULL,'Välkommen','cms',NULL),(6,'Use a valid username and password to gain access to the administration console.',NULL,'Använd ett giltigt användarnamn och lösenord för att få tillgång till administrationskonsolen.','cms',NULL),(7,'Вход',NULL,'Inloggning','frontend',NULL),(8,'Ваша компания',NULL,'Din Företag','frontend',NULL),(9,'Разработка и поддержка',NULL,'Utveckling och stöd','frontend',NULL),(11,'Blog',NULL,'Blogg','cms',NULL),(12,'Posts',NULL,'Meddelanden','cms',NULL),(13,'Comments',NULL,'Kommentarer','cms',NULL),(14,'Tags',NULL,'Tags','cms',NULL),(15,'Users',NULL,'Användare','cms',NULL),(16,'Settings',NULL,'Inställningar','cms',NULL),(18,'Email шаблоны',NULL,'E-postmallar','cms',NULL),(21,'Сообщения',NULL,'Meddelanden','cms',NULL),(28,'Локализация',NULL,'Lokalisering','cms',NULL),(33,'Добавить',NULL,'Lägga till','cms',NULL),(34,'Go to Frontend',NULL,'Gå till webbplatsen','cms',NULL),(35,'Logout',NULL,'Utgång','cms',NULL),(36,'dashboard',NULL,'Instrumentbräda','cms',NULL),(37,'Профиль',NULL,'Profil','frontend',NULL),(38,'Выход',NULL,'Utgång','frontend',NULL),(39,'Админка',NULL,'Admin','frontend',NULL),(40,'Page List',NULL,'Lista över sidor','cms',NULL),(41,'Name',NULL,'Titel','cms',NULL),(42,'Slug',NULL,'URL','cms',NULL),(43,'Actions',NULL,'Aktiviteter','cms',NULL),(44,'First page',NULL,'Första sidan','cms',NULL),(45,'Previous page',NULL,'Föregående Sida','cms',NULL),(46,'Next page',NULL,'Nästa sida','cms',NULL),(47,'Last page',NULL,'Sista sidan','cms',NULL),(48,'[0] no result|[1] 1 result|(1,+Inf] %1% results',NULL,'[0] inget resultat|[1] 1 resultat|(1,+Inf] %1% resultat','cms',NULL),(49,'(page %%page%%/%%nb_pages%%)',NULL,'(sidan%%page%%/%%nb_pages%%)','cms',NULL),(50,'Edit',NULL,'Redigera','cms',NULL),(51,'Delete',NULL,'Radera','cms',NULL),(52,'Are you sure?',NULL,'Är du säker?','cms',NULL),(53,'Choose an action',NULL,'Välj en åtgärd','cms',NULL),(54,'go',NULL,'Go!','cms',NULL),(55,'New',NULL,'Ny','cms',NULL),(56,'Blog Posts',NULL,'Blogginlägg','cms',NULL),(57,'Reset',NULL,'Återställ','cms',NULL),(58,'Filter',NULL,'Filtrera','cms',NULL),(59,'No result',NULL,'Inget resultat','cms',NULL),(60,'New Page',NULL,'Ny sida','cms',NULL),(61,'Content',NULL,'Innehåll','cms',NULL),(62,'Включить редирект',NULL,'Möjliggöra omdirigering','cms',NULL),(63,'Redirect route',NULL,'Dirigera till','cms',NULL),(64,'Redirect timeout',NULL,'Omdirigering timeout','cms',NULL),(65,'Layout',NULL,'Layout','cms',NULL),(66,'Meta title',NULL,'Meta titel','cms',NULL),(67,'Meta description',NULL,'Meta description','cms',NULL),(68,'Meta keywords',NULL,'Meta sökord','cms',NULL),(69,'Back to list',NULL,'Tillbaka till listan','cms',NULL),(70,'Save',NULL,'Spara','cms',NULL),(71,'Save and add',NULL,'Spara och lägg till','cms',NULL),(72,'УРЛ-метка',NULL,'URL-tagg','cms',NULL),(73,'Edit Page',NULL,'Redigera den här sidan','cms',NULL),(74,'User list',NULL,'Medlemslista','cms',NULL),(75,'Created at',NULL,'Skapat i','cms',NULL),(76,'Updated at',NULL,'Uppdaterat på','cms',NULL),(77,'Last login',NULL,'Senaste inloggning','cms',NULL),(78,'user',NULL,'Användar','cms',NULL),(79,'New User',NULL,'Ny användare','cms',NULL),(80,'User',NULL,'Användar','cms',NULL),(81,'First name',NULL,'Förnamn','cms',NULL),(82,'Last name',NULL,'Efternamn','cms',NULL),(83,'Email address',NULL,'E-postadress','cms',NULL),(84,'Password (again)',NULL,'Lösenord (igen)','cms',NULL),(85,'Permissions',NULL,'Behörigheter','cms',NULL),(86,'Is active',NULL,'Är aktiv','cms',NULL),(87,'Is super admin',NULL,'Är super admin','cms',NULL),(88,'Editing User \"%%username%%\"',NULL,'Edit \"%%username%%\"','cms',NULL),(89,'dictionary',NULL,'Lexikon','cms',NULL),(90,'Title',NULL,'Titel','cms',NULL),(91,'Value',NULL,'Värde','cms',NULL),(92,'settings',NULL,'Inställningar','cms',NULL),(93,'Email template List',NULL,'Lista över E-postmallar','cms',NULL),(94,'Id',NULL,'ID','cms',NULL),(95,'Subject',NULL,'Ämne','cms',NULL),(96,'Message',NULL,'Meddelande','cms',NULL),(98,'Edit Email template',NULL,'Redigera E-postmall','cms',NULL),(99,'New Email template',NULL,'Ny mall E','cms',NULL),(100,'Ваше имя',NULL,'Ditt namn','frontend',NULL),(101,'Ваш Email',NULL,'Din e-post','frontend',NULL),(102,'Нужен для обратной связи',NULL,'Behov av återkoppling','frontend',NULL),(103,'Ваше сообщение',NULL,'Ditt meddelande','frontend',NULL),(104,'Reload image',NULL,'Uppdatera bild','frontend',NULL),(105,'Введите код с картинки',NULL,'Ange koden från bilden','frontend',NULL),(106,'Показатели',NULL,'Indikatorer','cms',NULL),(107,'Имя',NULL,'Namn','cms',NULL),(108,'Email',NULL,'E-post','cms',NULL),(109,'desc',NULL,'Fallande','cms',NULL),(110,'Просмотр',NULL,'Utsikt','cms',NULL),(111,'Создать пользователя',NULL,'Skapa användar','cms',NULL),(112,'Export',NULL,'Export','cms',NULL),(113,'The item was updated successfully.',NULL,'Denna post har uppdaterats.','cms',NULL),(114,'Неверный формат',NULL,'Ogiltigt format','frontend',NULL),(115,'System settings',NULL,'Systeminställningar','cms',NULL),(116,'Section',NULL,'Avsnitt','cms',NULL),(118,'Email error List',NULL,'Email fellista','cms',NULL),(119,'Email from',NULL,'Från vem','cms',NULL),(120,'Email to',NULL,'Till vem','cms',NULL),(121,'Body',NULL,'Kropp','cms',NULL),(122,'Cc',NULL,'Kopia','cms',NULL),(123,'File',NULL,'Fil','cms',NULL),(132,'Filters',NULL,'Filtrera','cms',NULL),(133,'is empty',NULL,'Tom','cms',NULL),(134,'Мой профиль',NULL,'Min profil','frontend',NULL),(135,'Фотография',NULL,'Fil','frontend',NULL),(136,'Изменить пароль',NULL,'Ändra lösenord','frontend',NULL),(137,'Отчество',NULL,'PATRONYMIKON','frontend',NULL),(138,'Фамилия',NULL,'Efternamn','frontend',NULL),(139,'Дата рождения\n(дд.мм.гггг)',NULL,'DOB','frontend',NULL),(140,'Телефон мобильный\n(для получения уведомлений)',NULL,'Mobiltelefon (för anmälan)','frontend',NULL),(141,'Сохранить изменения',NULL,'Spara ändringar','frontend',NULL),(142,'Старый пароль',NULL,'Gammalt lösenord','frontend',NULL),(143,'Новый пароль',NULL,'Nytt lösenord','frontend',NULL),(144,'Новый пароль еще раз',NULL,'Nytt lösenord igen','frontend',NULL),(145,'Сохранить пароль',NULL,'Spara lösenord','frontend',NULL),(146,'Заполните поле',NULL,'Fyll i fältet','frontend',NULL),(147,'Passwords do not match',NULL,'Lösenorden matchar inte','frontend',NULL),(148,'Выберите картинку из загрузите ее',NULL,'Välj en bild och ladda upp den','frontend',NULL),(149,'Image',NULL,'Bild','frontend',NULL),(150,'Загрузить фотографию',NULL,'Ladda upp en bild','frontend',NULL),(151,'File is too large (maximum is %max_size% bytes).',NULL,'Filen är för stor (max%MAX_SIZE%).','frontend',NULL),(152,'Вы можете выбрать зону, которая будет отображаться на ваших аватарках. Кликните по одному из изображений справа',NULL,'Du kan välja det område som ska visas på dina bilder. Klicka på en av de små bilderna till höger','frontend',NULL),(153,'remove the current file',NULL,'Ta bort den aktuella filen','frontend',NULL),(154,'Сохранить',NULL,'Spara','frontend',NULL),(155,'Вы уверены?',NULL,'Är du säker?','frontend',NULL),(156,'Удалить фотографию',NULL,'Radera bild','frontend',NULL),(157,'Логин (Ваш Email)',NULL,'Användarnamn (E-mail)','frontend',NULL),(158,'Запомнить меня на этом компьютере',NULL,'Kom ihåg mig på denna dator','frontend',NULL),(159,'Войти',NULL,'Inloggning','frontend',NULL),(160,'Забыли пароль?',NULL,'Glömt ditt lösenord?','frontend',NULL),(161,'Registration',NULL,'Registrering','frontend',NULL),(162,'The username and/or password is invalid.',NULL,'Felaktigt användarnamn eller lösenord','frontend',NULL),(163,'Введите код',NULL,'Ange koden','frontend',NULL),(164,'Письмо отправлено',NULL,'E-post skickat','frontend',NULL),(165,'Ваш email',NULL,'Din e-post','frontend',NULL),(166,'Восстановить пароль',NULL,'Återskapa lösenord','frontend',NULL),(167,'Повторите пароль',NULL,'Bekräfta lösenord','frontend',NULL),(168,'Я принимаю условия',NULL,'Jag godkänner villkoren','frontend',NULL),(169,'Такой email уже зарегистрирован в ситеме',NULL,'Denna e-post är redan registrerad i systemet','frontend',NULL),(170,'Пароли не совпадают',NULL,'Lösenorden matchar inte','frontend',NULL),(171,'Вы должны принять условия пользовательского соглашения',NULL,'Du måste godkänna användarvillkoren','frontend',NULL),(172,'Пароль должен быть не короче 4 символов',NULL,'Lösenord måste vara minst 4 tecken långt','frontend',NULL),(173,'Еще раз пароль',NULL,'Bekräfta lösenord','frontend',NULL),(174,'Сменить пароль',NULL,'Ändra lösenord','frontend',NULL),(175,'Пароль слишком короткий',NULL,'Lösenordet är för kort','frontend',NULL),(176,'Пароль восстановлен',NULL,'Lösenordet återvinnas','frontend',NULL),(177,'Password is invalid.',NULL,'Ogiltigt lösenord','frontend',NULL),(178,'События за сегодня',NULL,'Händelser för dag','cms',NULL),(179,'Всего событий',NULL,'Totalt händelser','cms',NULL),(180,'All rights reserved',NULL,'Alla rättigheter förbehållna','cms',NULL),(181,'Date',NULL,'Datum','cms',NULL),(182,'Is published',NULL,'Publicerad','cms',NULL),(183,'yes or no',NULL,'Ja eller nej','cms',NULL),(184,'yes',NULL,'Yes','cms',NULL),(185,'no',NULL,'Ingen','cms',NULL),(186,'From',NULL,'Från','cms',NULL),(187,'To',NULL,'Till','cms',NULL),(188,'New Blog post',NULL,'Nya blogginlägg','cms',NULL),(189,'Brief',NULL,'Kortfattat','cms',NULL),(190,'Text',NULL,'Text','cms',NULL),(191,'Url',NULL,'URL','cms',NULL),(193,'пользовательского соглашения',NULL,'Användaravtalet','frontend',NULL),(194,'The item was created successfully.',NULL,'Detta objekt har skapats.','cms',NULL),(195,'You don\'t have proper credentials to access this page',NULL,'Du har inte rätt meriter för att komma åt den här sidan','cms',NULL),(197,'Secure',NULL,'Ett stängt forum','cms',NULL),(210,'Server is not responding',NULL,'Servern svarar inte','cms',NULL),(211,'Data saved',NULL,'Data sparas','cms',NULL),(212,'Error while saving data',NULL,'Fel spara data','cms',NULL),(217,'Unexpected extra form field named \"%field%\".',NULL,'Oväntat extra formulärfält med namnet \"%fält%\".','cms',NULL),(221,'Вы можете править текст прямо в списке. Исправьте все, что считаете нужным, а затем нажмите TAB или щелкните мышью в любом месте вне поля ввода.',NULL,'Du kan redigera texten direkt i listan. Korrigera alla som gäller, och sedan på TAB eller klicka någonstans utanför inmatningsfältet.','cms',NULL),(222,'Воспользуйтесь фильтром, чтобы найти нужный вам текст',NULL,'Använd filter för att hitta önskad text','cms',NULL),(223,'Отправить',NULL,'Skicka','frontend',NULL),(224,'The item has not been saved due to some errors.',NULL,'Objektet sparades inte på grund av att vissa fel','cms',NULL),(225,'An object with the same \"%column%\" already exist.',NULL,'Syftet med värdet av fältet \"%kolumnen%\" finns redan i systemet.','cms',NULL),(226,'Update',NULL,'Uppdatera','cms',NULL),(235,'Страницы',NULL,'Sida','cms',NULL),(236,'Пользователи',NULL,'Användare','cms',NULL),(237,'Настройки',NULL,'Inställningar','cms',NULL),(238,'Редирект 301',NULL,'301s','cms',NULL),(239,'Уведомления',NULL,'Observera','cms',NULL),(241,'Url from',NULL,'Vari','cms',NULL),(242,'Url to',NULL,'Var','cms',NULL),(243,'Comment',NULL,'Beskrivning','cms',NULL),(245,'from %from_date%<br />to %to_date%',NULL,'Från%from_date%till%to_date%','cms',NULL),(246,'Checked',NULL,'Noterat','cms',NULL),(248,'You must at least select one item.',NULL,'Du måste välja minst ett objekt','cms',NULL),(249,'blog_post',NULL,'Blogginlägg','cms',NULL),(250,'Extra',NULL,'Dessutom','cms',NULL),(251,'Edit Blog post',NULL,'Redigera ett blogginlägg','cms',NULL),(252,'The begin date must be before the end date.',NULL,'Startdatumet måste vara mindre än slutdatumet','cms',NULL),(257,'%%title%%',NULL,'%%title%%','cms',NULL),(258,'Email администратора',NULL,'Email administratör','cms',NULL),(259,'На этот адрес вам будут приходить сообщения с сайта',NULL,'På denna adress kommer du att ta emot meddelanden från platsen','cms',NULL),(260,'Имя отправителя почты',NULL,'Email avsändarnamn','cms',NULL),(261,'От этого имени сайт будет отправлять почту',NULL,'Alla e-post kommer att skickas på uppdrag av det namnet','cms',NULL),(263,'Адрес',NULL,'Adress','cms',NULL),(264,'Контактный телефон',NULL,'Kontakta telefon','cms',NULL),(265,'Контактный email',NULL,'Kontakta e-post','cms',NULL),(266,'Type',NULL,'Typ','cms',NULL),(267,'Description',NULL,'Beskrivning','cms',NULL),(268,'Admin email',NULL,'E-posta till administratören','cms',NULL),(269,'User email',NULL,'E-post till användaren','cms',NULL),(270,'Phone number',NULL,'Telefonnummer','cms',NULL),(271,'Company name',NULL,'Företagsnamn','cms',NULL),(272,'Attach',NULL,'Bifogad Fil','cms',NULL),(275,'Show',NULL,'Visa','cms',NULL),(279,'Password recovery',NULL,'Lösenordshämtning','cms',NULL),(281,'Registration',NULL,'Registrering','cms',NULL),(283,'Page',NULL,'Sida','cms',NULL),(284,'Описание',NULL,'Beskrivning','cms',NULL),(285,'redirect301',NULL,'301s','cms',NULL),(287,'email_template',NULL,'E-postmallar','cms',NULL),(288,'Имя',NULL,'Förnamn','frontend',NULL),(289,'Email',NULL,'E-post','frontend',NULL),(290,'Invalid mime type (%mime_type%).',NULL,'Felaktigt filformat (%mime_type%).','frontend',NULL),(291,'Password',NULL,'Lösenord','frontend',NULL),(292,'Регистрация',NULL,'Registrering','frontend',NULL),(293,'ссылке',NULL,'Länk','frontend',NULL),(295,'Notifications',NULL,'Underrättelse','cms',NULL),(296,'Pages',NULL,'Sidor','cms',NULL),(297,'Apply',NULL,'Tillämpa','frontend',NULL),(298,'Discard',NULL,'Avboka','frontend',NULL),(299,'Данные сохранены',NULL,'Ändringar sparas!','frontend',NULL),(301,'Изображение удалено',NULL,'Image avlägsnades','frontend',NULL),(303,'Код введен неверно',NULL,'Koden du angav är ogiltigt','frontend',NULL),(304,'Такой email не зарегистрирован в системе',NULL,'Denna e-post är inte registrerad i systemet','frontend',NULL),(305,' csrf token',NULL,'CSRF token','frontend',NULL),(306,'The item was deleted successfully.',NULL,'Varan raderats.','cms',NULL),(307,'You must select an action to execute on the selected items.',NULL,'Du måste välja en åtgärd att utföra på de valda objekten.','cms',NULL),(308,'The selected items have been deleted successfully.',NULL,'De valda objekten har tagits bort.','cms',NULL),(310,'Cообщения с сайта',NULL,'Meddelanden från webbplatsen','cms',NULL),(311,'Да, это мой email-аккаунт!',NULL,'Ja, detta är min e-postkonto!','frontend',NULL),(312,'Подтвердить email аккаунт!',NULL,'Bekräfta e-postkonto!','frontend',NULL),(313,'Подтверждаю!',NULL,'Håller med!','frontend',NULL),(314,'Войти с помощью:',NULL,'Logga in med:','frontend',NULL);
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
INSERT INTO `menu_item` (`id`, `name`, `root_name`, `type`, `page_id`, `cms_module_id`, `route`, `external`, `is_empty`, `is_auth`, `icon_class`, `root_id`, `lft`, `rgt`, `level`) VALUES (1,'Huvudmeny','main','empty',NULL,NULL,NULL,NULL,1,0,NULL,1,1,52,0),(2,'Start','','route',1,NULL,'homepage','',1,0,NULL,1,1,1,1),(3,'Om oss',NULL,'page',2,NULL,NULL,NULL,1,0,NULL,1,44,45,1),(4,'Kontakter',NULL,'module',3,2,'','',1,0,NULL,1,46,47,1),(5,'Ett stängt forum',NULL,'page',14,NULL,'','',1,1,'',1,50,51,1),(6,'Footer meny','bottom','empty',NULL,NULL,NULL,NULL,1,0,NULL,6,6,NULL,0),(7,'Integritetspolicy',NULL,'page',13,NULL,'','',1,0,'',6,6,5,1),(8,'Användaravtalet',NULL,'page',12,NULL,'','',1,0,'',6,6,5,1);
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
INSERT INTO `email_template` (`id`, `name`, `subject`, `message`) VALUES (1,'registration_user','Registrera dig på projektet dev2','Hej, {%förnamn%}! Du har registrerats med framgång! Följ denna {%link%}, för att aktivera ditt konto!'),(2,'registration_admin','Registrera ett nytt konto','Användare {%FULL_NAME%} registrerad hos oss!'),(3,'password_recovery_user','Lösenordshämtning','God dag, {%FULL_NAME%} Du har begärt återställning av lösenord på dev2 projektet. Följ denna {LINK%%} för att ange ett nytt lösenord. Om du inte har begärt återställning av lösenord, kan du ignorera det här brevet.'),(4,'contactus_message_user','Projekt dev2. Ditt meddelande är viktig för oss!','Kära {%name%}! Tack för ditt meddelande! Det är mycket viktigt för oss!'),(5,'contactus_message_admin','Projekt dev2. nytt meddelande','Någon {%name%} skickade ett meddelande. Text: {%meddelande%} E-Mail: {%email%}'),(6,'social_bridge_user_confirm_email_user','Demo.web375.org - Bekräfta din e-postadress i det sociala nätverket {%network_name%}','Bekräfta e {%email%}, följ länken {%link%} eller använd denna kod {%token%}');
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

-- Dump completed on 2014-11-05 20:23:44

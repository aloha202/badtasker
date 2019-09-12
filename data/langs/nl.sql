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
INSERT INTO `page` (`id`, `name`, `content`, `is_module_page`, `module_name`, `is_content_editable`, `special_mark`, `is_redirect`, `redirect_route`, `redirect_timeout`, `layout`, `slug`, `meta_title`, `meta_description`, `meta_keywords`) VALUES (1,'Welkom!','Groeten aan u, jonge vriend! Je kwam op deze site omdat u zelf een website nodig. Of misschien heb je net kwam hier per ongeluk! In ieder geval van harte welkom!',1,'default',1,'default',0,'/',5,'','welkom','Welkom op de website van het project DEV2!','',''),(2,'Over ons','Wij zijn een jonge, maar al zeer ervaren bedrijf die zich bezighouden met de ontwikkeling en promotie van websites',0,NULL,1,NULL,0,'/',5,'','over-ons','Over het project','',''),(3,'Terugkoppeling','Stuur ons een bericht en wij zullen zo spoedig mogelijk contact met u mogelijk!',0,NULL,1,'contactus',0,'/',5,'','terugkoppeling','Neem contact met ons - Project DEV2','',''),(4,'Registratie','',0,NULL,0,'register',0,'/',5,NULL,'registratie','Registratie','',''),(5,'Wachtwoord herstel','Klik op \"Wachtwoord opvragen\" en we zullen een e-mail om uw e-mailaccount wordt gelinkt naar de pagina voor wachtwoordherstel te sturen',0,NULL,1,'auth_forgot_password',0,'/',5,NULL,'wachtwoord-herstel','Wachtwoord herstel','',''),(6,'Wachtwoord herstel. E-mail verzonden.','E-mail is verzonden naar uw e-mailaccount verzonden',0,NULL,1,'auth_forgot_password_thanks',1,'/',5,'','wachtwoord-herstel-e-mail-verzonden','Wachtwoord herstel. E-mail verzonden.','',''),(7,'Wachtwoord herstel. verzonden SMS','',0,NULL,1,'auth_forgot_sms',0,'/',5,NULL,'wachtwoord-herstel-verzonden-sms','Wachtwoord herstel. verzonden SMS','',''),(8,'Verzin een nieuw wachtwoord','',0,NULL,1,'auth_password_recovery',0,'/',5,NULL,'verzin-een-nieuw-wachtwoord','Verzin een nieuw wachtwoord','',''),(9,'Uw Personal Area','',0,NULL,1,'auth_signin',0,'/',5,NULL,'uw-personal-area','Uw Personal Area','',''),(10,'Registratie is gepasseerd','We gemaild verdere registratie instructies om je e-mailadres',0,NULL,1,'auth_registration_complete',1,'/',5,NULL,'registratie-is-gepasseerd','Registratie is gepasseerd','',''),(11,'Activering afgelopen','Nu kun je inloggen!',0,NULL,1,'auth_activation_successful',1,'/profile',3,'','activering-afgelopen','Activering afgelopen','',''),(12,'Gebruikersovereenkomst','Hier is een absoluut typische gebruiker akkoord',0,NULL,1,'user_agreement',0,'/',5,'','gebruikersovereenkomst','Gebruikersovereenkomst','',''),(13,'Privacy beleid','Hier is een absoluut typisch pagina over privacybeleid',0,NULL,1,'privacy_policy',0,'/',5,'','privacy-beleid','Privacy beleid','',''),(14,'Een gesloten forum','Als u over deze pagina, betekent dit dat u een geautoriseerde gebruiker!',0,NULL,1,NULL,0,'/',5,NULL,'een-gesloten-forum','Een gesloten forum','',''),(15,'Dit is een test pagina','',0,NULL,1,NULL,0,'/',5,'','dit-is-een-test-pagina','Dit is een test pagina','',''),(16,'Error 404','Fout 404. Pagina niet gevonden',0,NULL,1,'error404',0,'/',5,NULL,'error-404','Error 404','',''),(17,'Mijn Profiel','Hier kunt u uw persoonlijke gegevens wijzigen, upload een foto en om het wachtwoord te wijzigen',0,NULL,0,'profile',0,'/',5,NULL,'mijn-profiel','Mijn Profiel','',''),(18,'Mijn profiel - Wijzig wachtwoord','We bewaren uw wachtwoord in versleutelde vorm.',0,NULL,0,'profile_password',0,'/',5,NULL,'mijn-profiel-wijzig-wachtwoord','Mijn profiel - Wijzig wachtwoord','',''),(19,'Mijn profiel - Foto bewerken','',0,NULL,0,'profile_avatar',0,'/',5,NULL,'mijn-profiel-foto-bewerken','Mijn profiel - Foto bewerken','',''),(20,'IP-adres is geblokkeerd','Helaas, om onduidelijke redenen, uw adres is geblokkeerd! Dank je wel!',0,NULL,1,'ip_banned',0,'/',5,'empty','ip-adres-is-geblokkeerd','IP-adres is geblokkeerd','',''),(21,'Gelieve te registreren of inloggen','Om de inhoud van deze sectie te zien, gelieve in te loggen',0,NULL,1,'auth_secure',0,'/',5,NULL,'gelieve-te-registreren-of-inloggen','Gelieve te registreren of inloggen','',''),(22,'Confirmation of account in socConfirm your social networks accountial networks','Let op! E-mail {%email%} bestaat al in het systeem! Als dit uw e-mail, bevestigen het!',0,NULL,1,'oauth_bridge',0,'/',5,NULL,'confirmation-of-account-in-socconfirm-your-social-networks-accountial-networks','Bevestig uw sociale netwerken rekening','',''),(23,'Bevestig uw sociale netwerken houden. stap twee','Bevestigingsbrief is naar uw e-mailadres gestuurd {%email%}',0,NULL,1,'oauth_bridge_confirm',0,'/',5,NULL,'bevestig-uw-sociale-netwerken-houden-stap-twee','Bevestig uw sociale netwerken rekening','',''),(24,'OAuth fout machtiging','',0,NULL,1,'oauth_error',0,'/',5,NULL,'oauth-fout-machtiging','OAuth fout machtiging','','');
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
INSERT INTO `text_block` (`id`, `name`, `title`, `text`, `application`, `module`) VALUES (1,'Username',NULL,'Gebruikersnaam','cms',NULL),(2,'Password',NULL,'Wachtwoord','cms',NULL),(3,'Remember?',NULL,'Mij ​​onthouden?','cms',NULL),(4,'Login',NULL,'Login','cms',NULL),(5,'Welcome to',NULL,'Welkom','cms',NULL),(6,'Use a valid username and password to gain access to the administration console.',NULL,'Gebruik een geldige gebruikersnaam en wachtwoord om toegang tot de beheerconsole te krijgen.','cms',NULL),(7,'Вход',NULL,'Login','frontend',NULL),(8,'Ваша компания',NULL,'Your Company','frontend',NULL),(9,'Разработка и поддержка',NULL,'Ontwikkeling en ondersteuning','frontend',NULL),(11,'Blog',NULL,'Blog','cms',NULL),(12,'Posts',NULL,'Berichten','cms',NULL),(13,'Comments',NULL,'Reacties','cms',NULL),(14,'Tags',NULL,'Tags','cms',NULL),(15,'Users',NULL,'Gebruikers','cms',NULL),(16,'Settings',NULL,'Instellingen','cms',NULL),(18,'Email шаблоны',NULL,'E-mail templates','cms',NULL),(21,'Сообщения',NULL,'Berichten','cms',NULL),(28,'Локализация',NULL,'Lokalisatie','cms',NULL),(33,'Добавить',NULL,'Toevoegen','cms',NULL),(34,'Go to Frontend',NULL,'Ga naar website','cms',NULL),(35,'Logout',NULL,'Afrit','cms',NULL),(36,'dashboard',NULL,'Dashboard','cms',NULL),(37,'Профиль',NULL,'Profiel','frontend',NULL),(38,'Выход',NULL,'Afrit','frontend',NULL),(39,'Админка',NULL,'Admin','frontend',NULL),(40,'Page List',NULL,'Lijst van Pages','cms',NULL),(41,'Name',NULL,'Titel','cms',NULL),(42,'Slug',NULL,'URL','cms',NULL),(43,'Actions',NULL,'Acties','cms',NULL),(44,'First page',NULL,'Eerste pagina','cms',NULL),(45,'Previous page',NULL,'Vorige Pagina','cms',NULL),(46,'Next page',NULL,'Volgende pagina','cms',NULL),(47,'Last page',NULL,'Laatste pagina','cms',NULL),(48,'[0] no result|[1] 1 result|(1,+Inf] %1% results',NULL,'[0] geen resultaat|[1] 1 resultaat|(1,+Inf] %1% resultaten','cms',NULL),(49,'(page %%page%%/%%nb_pages%%)',NULL,'(pagina%%page%%/%%nb_pages%%)','cms',NULL),(50,'Edit',NULL,'Uitgeven','cms',NULL),(51,'Delete',NULL,'Delete','cms',NULL),(52,'Are you sure?',NULL,'Weet je het zeker?','cms',NULL),(53,'Choose an action',NULL,'Kies een actie','cms',NULL),(54,'go',NULL,'Go!','cms',NULL),(55,'New',NULL,'Nieuw','cms',NULL),(56,'Blog Posts',NULL,'Blog Posts','cms',NULL),(57,'Reset',NULL,'Reset','cms',NULL),(58,'Filter',NULL,'Filter','cms',NULL),(59,'No result',NULL,'Geen resultaat','cms',NULL),(60,'New Page',NULL,'Nieuwe pagina','cms',NULL),(61,'Content',NULL,'Inhoud','cms',NULL),(62,'Включить редирект',NULL,'Omleiding inschakelen','cms',NULL),(63,'Redirect route',NULL,'Omleiden naar','cms',NULL),(64,'Redirect timeout',NULL,'Redirection timeout','cms',NULL),(65,'Layout',NULL,'Lay-out','cms',NULL),(66,'Meta title',NULL,'Meta titel','cms',NULL),(67,'Meta description',NULL,'Meta description','cms',NULL),(68,'Meta keywords',NULL,'Meta keywords','cms',NULL),(69,'Back to list',NULL,'Terug naar lijst','cms',NULL),(70,'Save',NULL,'Opslaan','cms',NULL),(71,'Save and add',NULL,'Opslaan en voeg','cms',NULL),(72,'УРЛ-метка',NULL,'URL tag','cms',NULL),(73,'Edit Page',NULL,'Deze pagina bewerken','cms',NULL),(74,'User list',NULL,'Leden Lijst','cms',NULL),(75,'Created at',NULL,'Gemaakt in','cms',NULL),(76,'Updated at',NULL,'Bijgewerkt op','cms',NULL),(77,'Last login',NULL,'Laatst ingelogd','cms',NULL),(78,'user',NULL,'Gebruiker','cms',NULL),(79,'New User',NULL,'Nieuwe gebruiker','cms',NULL),(80,'User',NULL,'Gebruiker','cms',NULL),(81,'First name',NULL,'Voornaam','cms',NULL),(82,'Last name',NULL,'Achternaam','cms',NULL),(83,'Email address',NULL,'E-mailadres','cms',NULL),(84,'Password (again)',NULL,'Wachtwoord (nogmaals)','cms',NULL),(85,'Permissions',NULL,'Machtigingen','cms',NULL),(86,'Is active',NULL,'Is actief','cms',NULL),(87,'Is super admin',NULL,'Is super admin','cms',NULL),(88,'Editing User \"%%username%%\"',NULL,'Edit \"%%username%%\"','cms',NULL),(89,'dictionary',NULL,'Woordenboek','cms',NULL),(90,'Title',NULL,'Titel','cms',NULL),(91,'Value',NULL,'Waarde','cms',NULL),(92,'settings',NULL,'Instellingen','cms',NULL),(93,'Email template List',NULL,'Lijst van E-mail Templates','cms',NULL),(94,'Id',NULL,'ID','cms',NULL),(95,'Subject',NULL,'Onderwerp','cms',NULL),(96,'Message',NULL,'Bericht','cms',NULL),(98,'Edit Email template',NULL,'Bewerk Email Template','cms',NULL),(99,'New Email template',NULL,'Nieuwe template Email','cms',NULL),(100,'Ваше имя',NULL,'Uw naam','frontend',NULL),(101,'Ваш Email',NULL,'Uw E-mail','frontend',NULL),(102,'Нужен для обратной связи',NULL,'Behoefte aan feedback','frontend',NULL),(103,'Ваше сообщение',NULL,'Uw bericht','frontend',NULL),(104,'Reload image',NULL,'Ververs afbeelding','frontend',NULL),(105,'Введите код с картинки',NULL,'Voer de code van de afbeelding','frontend',NULL),(106,'Показатели',NULL,'Indicatoren','cms',NULL),(107,'Имя',NULL,'Naam','cms',NULL),(108,'Email',NULL,'E-mail','cms',NULL),(109,'desc',NULL,'Aflopend','cms',NULL),(110,'Просмотр',NULL,'Uitzicht','cms',NULL),(111,'Создать пользователя',NULL,'Gebruiker aanmaken','cms',NULL),(112,'Export',NULL,'Export','cms',NULL),(113,'The item was updated successfully.',NULL,'Dit item is bijgewerkt.','cms',NULL),(114,'Неверный формат',NULL,'Ongeldig formaat','frontend',NULL),(115,'System settings',NULL,'Systeeminstellingen','cms',NULL),(116,'Section',NULL,'Sectie','cms',NULL),(118,'Email error List',NULL,'E-mail error lijst','cms',NULL),(119,'Email from',NULL,'Van wie','cms',NULL),(120,'Email to',NULL,'Aan Wie','cms',NULL),(121,'Body',NULL,'Lichaam','cms',NULL),(122,'Cc',NULL,'Kopie','cms',NULL),(123,'File',NULL,'Bestand','cms',NULL),(132,'Filters',NULL,'Filter','cms',NULL),(133,'is empty',NULL,'Leeg','cms',NULL),(134,'Мой профиль',NULL,'Mijn Profiel','frontend',NULL),(135,'Фотография',NULL,'Foto','frontend',NULL),(136,'Изменить пароль',NULL,'Wachtwoord wijzigen','frontend',NULL),(137,'Отчество',NULL,'Patronymicum','frontend',NULL),(138,'Фамилия',NULL,'Achternaam','frontend',NULL),(139,'Дата рождения\n(дд.мм.гггг)',NULL,'DOB','frontend',NULL),(140,'Телефон мобильный\n(для получения уведомлений)',NULL,'Mobiele telefoon (voor kennisgeving)','frontend',NULL),(141,'Сохранить изменения',NULL,'Wijzigingen opslaan','frontend',NULL),(142,'Старый пароль',NULL,'Oud wachtwoord','frontend',NULL),(143,'Новый пароль',NULL,'Nieuw wachtwoord','frontend',NULL),(144,'Новый пароль еще раз',NULL,'Nieuwe wachtwoord opnieuw','frontend',NULL),(145,'Сохранить пароль',NULL,'Wachtwoord opslaan','frontend',NULL),(146,'Заполните поле',NULL,'Vul het veld','frontend',NULL),(147,'Passwords do not match',NULL,'Wachtwoorden komen niet overeen','frontend',NULL),(148,'Выберите картинку из загрузите ее',NULL,'Selecteer een afbeelding en upload het','frontend',NULL),(149,'Image',NULL,'Afbeelding','frontend',NULL),(150,'Загрузить фотографию',NULL,'Upload een afbeelding','frontend',NULL),(151,'File is too large (maximum is %max_size% bytes).',NULL,'Het bestand is te groot (maximaal%max_size%).','frontend',NULL),(152,'Вы можете выбрать зону, которая будет отображаться на ваших аватарках. Кликните по одному из изображений справа',NULL,'U kunt het gebied selecteren op uw afbeeldingen worden weergegeven. Klik op een van de kleine foto\'s naar rechts','frontend',NULL),(153,'remove the current file',NULL,'Verwijder het huidige bestand','frontend',NULL),(154,'Сохранить',NULL,'Opslaan','frontend',NULL),(155,'Вы уверены?',NULL,'Weet je het zeker?','frontend',NULL),(156,'Удалить фотографию',NULL,'Afbeelding verwijderen','frontend',NULL),(157,'Логин (Ваш Email)',NULL,'Gebruikersnaam (uw e-mail)','frontend',NULL),(158,'Запомнить меня на этом компьютере',NULL,'Onthouden op deze computer','frontend',NULL),(159,'Войти',NULL,'Login','frontend',NULL),(160,'Забыли пароль?',NULL,'Wachtwoord vergeten?','frontend',NULL),(161,'Registration',NULL,'Registratie','frontend',NULL),(162,'The username and/or password is invalid.',NULL,'Verkeerde login of paswoord','frontend',NULL),(163,'Введите код',NULL,'Voer de code in','frontend',NULL),(164,'Письмо отправлено',NULL,'E-mail verzonden','frontend',NULL),(165,'Ваш email',NULL,'Uw e-mail','frontend',NULL),(166,'Восстановить пароль',NULL,'Herstel wachtwoord','frontend',NULL),(167,'Повторите пароль',NULL,'Bevestig wachtwoord','frontend',NULL),(168,'Я принимаю условия',NULL,'Ik accepteer de voorwaarden','frontend',NULL),(169,'Такой email уже зарегистрирован в ситеме',NULL,'Deze e-mail is al in het systeem geregistreerd','frontend',NULL),(170,'Пароли не совпадают',NULL,'Wachtwoorden komen niet overeen','frontend',NULL),(171,'Вы должны принять условия пользовательского соглашения',NULL,'Je moet de Algemene Voorwaarden accepteren','frontend',NULL),(172,'Пароль должен быть не короче 4 символов',NULL,'Wachtwoord moet minimaal 4 tekens lang zijn','frontend',NULL),(173,'Еще раз пароль',NULL,'Bevestig je wachtwoord','frontend',NULL),(174,'Сменить пароль',NULL,'Wachtwoord wijzigen','frontend',NULL),(175,'Пароль слишком короткий',NULL,'Wachtwoord is te kort','frontend',NULL),(176,'Пароль восстановлен',NULL,'Wachtwoord hersteld','frontend',NULL),(177,'Password is invalid.',NULL,'Ongeldig wachtwoord','frontend',NULL),(178,'События за сегодня',NULL,'Evenementen voor vandaag','cms',NULL),(179,'Всего событий',NULL,'Totaal Events','cms',NULL),(180,'All rights reserved',NULL,'Alle rechten voorbehouden','cms',NULL),(181,'Date',NULL,'Datum','cms',NULL),(182,'Is published',NULL,'Gepubliceerd','cms',NULL),(183,'yes or no',NULL,'Ja of nee','cms',NULL),(184,'yes',NULL,'Ja','cms',NULL),(185,'no',NULL,'Geen','cms',NULL),(186,'From',NULL,'Uit','cms',NULL),(187,'To',NULL,'Aan','cms',NULL),(188,'New Blog post',NULL,'Nieuwe blog post','cms',NULL),(189,'Brief',NULL,'Kort','cms',NULL),(190,'Text',NULL,'Tekst','cms',NULL),(191,'Url',NULL,'URL','cms',NULL),(193,'пользовательского соглашения',NULL,'Gebruikersovereenkomst','frontend',NULL),(194,'The item was created successfully.',NULL,'Dit item is succesvol aangemaakt.','cms',NULL),(195,'You don\'t have proper credentials to access this page',NULL,'Je hoeft niet de juiste referenties voor toegang tot deze pagina','cms',NULL),(197,'Secure',NULL,'Een gesloten forum','cms',NULL),(210,'Server is not responding',NULL,'De server reageert niet','cms',NULL),(211,'Data saved',NULL,'Gegevens opgeslagen','cms',NULL),(212,'Error while saving data',NULL,'Fout bij het opslaan van gegevens','cms',NULL),(217,'Unexpected extra form field named \"%field%\".',NULL,'Onverwachte extra formulier veld met de naam \"%veld%\".','cms',NULL),(221,'Вы можете править текст прямо в списке. Исправьте все, что считаете нужным, а затем нажмите TAB или щелкните мышью в любом месте вне поля ввода.',NULL,'U kunt de tekst direct in de lijst te bewerken. Corrigeer alle die van toepassing zijn, en druk vervolgens op TAB of klik ergens buiten het invoerveld.','cms',NULL),(222,'Воспользуйтесь фильтром, чтобы найти нужный вам текст',NULL,'Gebruik de filter om de gewenste tekst te zoeken','cms',NULL),(223,'Отправить',NULL,'Sturen','frontend',NULL),(224,'The item has not been saved due to some errors.',NULL,'Het object is niet te wijten aan een aantal fouten opgeslagen','cms',NULL),(225,'An object with the same \"%column%\" already exist.',NULL,'Het object met de waarde van het veld \"%kolom%\" reeds bestaat in het systeem.','cms',NULL),(226,'Update',NULL,'Bijwerken','cms',NULL),(235,'Страницы',NULL,'Pagina','cms',NULL),(236,'Пользователи',NULL,'Gebruikers','cms',NULL),(237,'Настройки',NULL,'Instellingen','cms',NULL),(238,'Редирект 301',NULL,'301s','cms',NULL),(239,'Уведомления',NULL,'Kennisgeving','cms',NULL),(241,'Url from',NULL,'Vanwaar','cms',NULL),(242,'Url to',NULL,'Waar','cms',NULL),(243,'Comment',NULL,'Beschrijving','cms',NULL),(245,'from %from_date%<br />to %to_date%',NULL,'Van%from_date%naar%to_date%','cms',NULL),(246,'Checked',NULL,'Bekend','cms',NULL),(248,'You must at least select one item.',NULL,'U moet ten minste één object te selecteren','cms',NULL),(249,'blog_post',NULL,'Blogpost','cms',NULL),(250,'Extra',NULL,'Bovendien','cms',NULL),(251,'Edit Blog post',NULL,'Bewerken van een blogpost','cms',NULL),(252,'The begin date must be before the end date.',NULL,'Startdatum moet lager zijn dan de einddatum','cms',NULL),(257,'%%title%%',NULL,'%%title%%','cms',NULL),(258,'Email администратора',NULL,'Email administrator','cms',NULL),(259,'На этот адрес вам будут приходить сообщения с сайта',NULL,'Op dit adres kunt u berichten van de site te ontvangen','cms',NULL),(260,'Имя отправителя почты',NULL,'E-mail afzender naam','cms',NULL),(261,'От этого имени сайт будет отправлять почту',NULL,'Alle e-mails namens die naam worden verzonden','cms',NULL),(263,'Адрес',NULL,'Adres','cms',NULL),(264,'Контактный телефон',NULL,'Contact telefoon','cms',NULL),(265,'Контактный email',NULL,'Contact e-mail','cms',NULL),(266,'Type',NULL,'Type','cms',NULL),(267,'Description',NULL,'Beschrijving','cms',NULL),(268,'Admin email',NULL,'E-mail naar de beheerder','cms',NULL),(269,'User email',NULL,'E-mail naar de gebruiker','cms',NULL),(270,'Phone number',NULL,'Telefoonnummer','cms',NULL),(271,'Company name',NULL,'Bedrijfsnaam','cms',NULL),(272,'Attach',NULL,'Bijgevoegd bestand','cms',NULL),(275,'Show',NULL,'Tonen','cms',NULL),(279,'Password recovery',NULL,'Wachtwoord herstel','cms',NULL),(281,'Registration',NULL,'Registratie','cms',NULL),(283,'Page',NULL,'Pagina','cms',NULL),(284,'Описание',NULL,'Beschrijving','cms',NULL),(285,'redirect301',NULL,'301s','cms',NULL),(287,'email_template',NULL,'E-mail templates','cms',NULL),(288,'Имя',NULL,'Voornaam','frontend',NULL),(289,'Email',NULL,'E-mail','frontend',NULL),(290,'Invalid mime type (%mime_type%).',NULL,'Verkeerde bestandsformaat (%mime_type%).','frontend',NULL),(291,'Password',NULL,'Wachtwoord','frontend',NULL),(292,'Регистрация',NULL,'Registratie','frontend',NULL),(293,'ссылке',NULL,'Link','frontend',NULL),(295,'Notifications',NULL,'Bekendmakingen','cms',NULL),(296,'Pages',NULL,'Pages','cms',NULL),(297,'Apply',NULL,'Van toepassing zijn','frontend',NULL),(298,'Discard',NULL,'Annuleren','frontend',NULL),(299,'Данные сохранены',NULL,'Wijzigingen opgeslagen!','frontend',NULL),(301,'Изображение удалено',NULL,'Afbeelding verwijderd','frontend',NULL),(303,'Код введен неверно',NULL,'De code die u hebt ingevoerd is ongeldig','frontend',NULL),(304,'Такой email не зарегистрирован в системе',NULL,'Deze e-mail wordt niet geregistreerd in het systeem','frontend',NULL),(305,' csrf token',NULL,'CSRF token','frontend',NULL),(306,'The item was deleted successfully.',NULL,'Het item is succesvol verwijderd.','cms',NULL),(307,'You must select an action to execute on the selected items.',NULL,'U moet een actie selecteren om uit te voeren op de geselecteerde items.','cms',NULL),(308,'The selected items have been deleted successfully.',NULL,'De geselecteerde items zijn met succes verwijderd.','cms',NULL),(310,'Cообщения с сайта',NULL,'Berichten van de site','cms',NULL),(311,'Да, это мой email-аккаунт!',NULL,'Ja, dit is mijn e-mail account!','frontend',NULL),(312,'Подтвердить email аккаунт!',NULL,'Bevestig e-mailaccount!','frontend',NULL),(313,'Подтверждаю!',NULL,'Mee eens!','frontend',NULL),(314,'Войти с помощью:',NULL,'Login met:','frontend',NULL);
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
INSERT INTO `menu_item` (`id`, `name`, `root_name`, `type`, `page_id`, `cms_module_id`, `route`, `external`, `is_empty`, `is_auth`, `icon_class`, `root_id`, `lft`, `rgt`, `level`) VALUES (1,'Hoofdmenu','main','empty',NULL,NULL,NULL,NULL,1,0,NULL,1,1,52,0),(2,'Thuis','','route',1,NULL,'homepage','',1,0,NULL,1,1,1,1),(3,'Over ons',NULL,'page',2,NULL,NULL,NULL,1,0,NULL,1,44,45,1),(4,'Contacten',NULL,'module',3,2,'','',1,0,NULL,1,46,47,1),(5,'Een gesloten forum',NULL,'page',14,NULL,'','',1,1,'',1,50,51,1),(6,'Footer menu','bottom','empty',NULL,NULL,NULL,NULL,1,0,NULL,6,6,NULL,0),(7,'Privacy beleid',NULL,'page',13,NULL,'','',1,0,'',6,6,5,1),(8,'Gebruikersovereenkomst',NULL,'page',12,NULL,'','',1,0,'',6,6,5,1);
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
INSERT INTO `email_template` (`id`, `name`, `subject`, `message`) VALUES (1,'registration_user','Registreer je op het project DEV2','Hallo, {%first_name%}! U bent succesvol geregistreerd! Volg deze {%link%}, om uw account te activeren!'),(2,'registration_admin','Registreer een nieuwe account','Gebruiker {%full_name%} bij ons geregistreerd!'),(3,'password_recovery_user','Wachtwoord herstel','Goede dag, {%full_name%} Je hebt een wachtwoord recovery op Dev2 project gevraagd. Volg deze {%link%} om een ​​nieuw wachtwoord in te stellen. Als u nog niet gevraagd password recovery, negeer deze brief.'),(4,'contactus_message_user','Project DEV2. Uw boodschap is belangrijk voor ons!','Beste {%name%}! Dank u voor uw bericht! Het is erg belangrijk voor ons!'),(5,'contactus_message_admin','Project DEV2. nieuw bericht','Iemand {%name%} stuurde een boodschap. Tekst: {%message%} E-Mail: {%email%}'),(6,'social_bridge_user_confirm_email_user','Demo.web375.org - Bevestig uw e-mailadres in het sociale netwerk {%network_name%}','Bevestig E-mail {%email%}, volg de link {%link%} of gebruik deze code {%token%}');
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

-- Dump completed on 2014-11-05 20:24:36

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
INSERT INTO `page` (`id`, `name`, `content`, `is_module_page`, `module_name`, `is_content_editable`, `special_mark`, `is_redirect`, `redirect_route`, `redirect_timeout`, `layout`, `slug`, `meta_title`, `meta_description`, `meta_keywords`) VALUES (1,'Velkommen!','Hilsen til deg, unge venn! Du kom til dette området fordi du selv trenger et nettsted. Eller kanskje du bare kom hit ved en tilfeldighet! I alle fall, velkommen!',1,'default',1,'default',0,'/',5,'','velkommen','Velkommen til nettsiden til prosjektet DEV2!','',''),(2,'Om oss','Vi er en ung, men allerede svært erfaren selskap engasjert i utvikling og markedsføring av nettsider',0,NULL,1,NULL,0,'/',5,'','om-oss','Om prosjektet','',''),(3,'Tilbakemelding','Send oss ​​en melding og vi vil kontakte deg så snart som mulig!',0,NULL,1,'contactus',0,'/',5,'','tilbakemelding','Kontakt oss - Prosjekt DEV2','',''),(4,'Registrering','',0,NULL,0,'register',0,'/',5,NULL,'registrering','Registrering','',''),(5,'Passordgjenoppretting','Klikk \"Gjenopprett passord\", så sender vi en e-post til e-postkontoen som skal knytte til siden for passordgjenoppretting',0,NULL,1,'auth_forgot_password',0,'/',5,NULL,'passordgjenoppretting','Passordgjenoppretting','',''),(6,'Passordgjenoppretting. E-post sendt.','E-post har blitt sendt til din e-postkonto',0,NULL,1,'auth_forgot_password_thanks',1,'/',5,'','passordgjenoppretting-e-post-sendt','Passordgjenoppretting. E-post sendt.','',''),(7,'Passordgjenoppretting. sendte SMS','',0,NULL,1,'auth_forgot_sms',0,'/',5,NULL,'passordgjenoppretting-sendte-sms','Passordgjenoppretting. sendte SMS','',''),(8,'Oppfinne et nytt passord','',0,NULL,1,'auth_password_recovery',0,'/',5,NULL,'oppfinne-et-nytt-passord','Oppfinne et nytt passord','',''),(9,'Din Personal Area','',0,NULL,1,'auth_signin',0,'/',5,NULL,'din-personal-area','Din Personal Area','',''),(10,'Registrering er passert','Vi mailet ytterligere instruksjoner registrering til din e-postadresse',0,NULL,1,'auth_registration_complete',1,'/',5,NULL,'registrering-er-passert','Registrering er passert','',''),(11,'Aktivering er passert','Nå kan du logge inn!',0,NULL,1,'auth_activation_successful',1,'/profile',3,'','aktivering-er-passert','Aktivering er passert','',''),(12,'Brukeravtale','Her er en helt vanlig brukeravtalen',0,NULL,1,'user_agreement',0,'/',5,'','brukeravtale','Brukeravtale','',''),(13,'Personvern','Her er en helt vanlig side om personvernreglene',0,NULL,1,'privacy_policy',0,'/',5,'','personvern','Personvern','',''),(14,'En lukket forum','Hvis du kommer over denne siden, betyr det at du er en autorisert bruker!',0,NULL,1,NULL,0,'/',5,NULL,'en-lukket-forum','En lukket forum','',''),(15,'Dette er en testside','',0,NULL,1,NULL,0,'/',5,'','dette-er-en-testside','Dette er en testside','',''),(16,'Feil 404','Feil 404. Siden ble ikke funnet',0,NULL,1,'error404',0,'/',5,NULL,'feil-404','Feil 404','',''),(17,'Min profil','Her kan du redigere dine personlige opplysninger, laste opp et bilde og for å endre passordet',0,NULL,0,'profile',0,'/',5,NULL,'min-profil','Min profil','',''),(18,'Min profil - Endre passord','Vi lagrer passordet ditt i kryptert form.',0,NULL,0,'profile_password',0,'/',5,NULL,'min-profil-endre-passord','Min profil - Endre passord','',''),(19,'Min profil - Rediger bilde','',0,NULL,0,'profile_avatar',0,'/',5,NULL,'min-profil-rediger-bilde','Min profil - Rediger bilde','',''),(20,'IP-adresse er blokkert','Dessverre, for uklare grunner, din adresse har blitt blokkert! Takk!',0,NULL,1,'ip_banned',0,'/',5,'empty','ip-adresse-er-blokkert','IP-adresse er blokkert','',''),(21,'Vennligst registrer deg eller logg inn','For å se innholdet i denne delen, må du logge inn',0,NULL,1,'auth_secure',0,'/',5,NULL,'vennligst-registrer-deg-eller-logg-inn','Vennligst registrer deg eller logg inn','',''),(22,'Confirmation of account in socConfirm your social networks accountial networks','Attention! Det finnes e {%email%} allerede er i systemet! Hvis dette er din e-post, bekrefter det!',0,NULL,1,'oauth_bridge',0,'/',5,NULL,'confirmation-of-account-in-socconfirm-your-social-networks-accountial-networks','Bekreft ditt sosiale nettverk konto','',''),(23,'Bekreft ditt sosiale nettverk konto. trinn to','Bekreftelsesbrev har blitt sendt til din e-postadresse {%email%}',0,NULL,1,'oauth_bridge_confirm',0,'/',5,NULL,'bekreft-ditt-sosiale-nettverk-konto-trinn-to','Bekreft ditt sosiale nettverk konto','',''),(24,'OAuth autorisasjonsfeil','',0,NULL,1,'oauth_error',0,'/',5,NULL,'oauth-autorisasjonsfeil','OAuth autorisasjonsfeil','','');
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
INSERT INTO `text_block` (`id`, `name`, `title`, `text`, `application`, `module`) VALUES (1,'Username',NULL,'Brukernavn','cms',NULL),(2,'Password',NULL,'Passord','cms',NULL),(3,'Remember?',NULL,'Husk meg?','cms',NULL),(4,'Login',NULL,'Innlogging','cms',NULL),(5,'Welcome to',NULL,'Velkommen','cms',NULL),(6,'Use a valid username and password to gain access to the administration console.',NULL,'Bruk et gyldig brukernavn og passord for å få tilgang til administrasjonskonsollen.','cms',NULL),(7,'Вход',NULL,'Innlogging','frontend',NULL),(8,'Ваша компания',NULL,'Din Bedrift','frontend',NULL),(9,'Разработка и поддержка',NULL,'Utvikling og støtte','frontend',NULL),(11,'Blog',NULL,'Blogg','cms',NULL),(12,'Posts',NULL,'Meldinger','cms',NULL),(13,'Comments',NULL,'Kommentarer','cms',NULL),(14,'Tags',NULL,'Tags','cms',NULL),(15,'Users',NULL,'Brukere','cms',NULL),(16,'Settings',NULL,'Innstillinger','cms',NULL),(18,'Email шаблоны',NULL,'E-post maler','cms',NULL),(21,'Сообщения',NULL,'Meldinger','cms',NULL),(28,'Локализация',NULL,'Lokalisering','cms',NULL),(33,'Добавить',NULL,'Legg','cms',NULL),(34,'Go to Frontend',NULL,'Gå til nettstedet','cms',NULL),(35,'Logout',NULL,'Utgang','cms',NULL),(36,'dashboard',NULL,'Dashbord','cms',NULL),(37,'Профиль',NULL,'Profil','frontend',NULL),(38,'Выход',NULL,'Utgang','frontend',NULL),(39,'Админка',NULL,'Admin','frontend',NULL),(40,'Page List',NULL,'Liste over Sider','cms',NULL),(41,'Name',NULL,'Tittel','cms',NULL),(42,'Slug',NULL,'URL','cms',NULL),(43,'Actions',NULL,'Handlinger','cms',NULL),(44,'First page',NULL,'Første side','cms',NULL),(45,'Previous page',NULL,'Forrige Side','cms',NULL),(46,'Next page',NULL,'Neste side','cms',NULL),(47,'Last page',NULL,'Siste side','cms',NULL),(48,'[0] no result|[1] 1 result|(1,+Inf] %1% results',NULL,'[0] ingen resultat|[1] 1 resultat|(1,+Inf] %1% resultater','cms',NULL),(49,'(page %%page%%/%%nb_pages%%)',NULL,'(side%%page%%/%%nb_pages%%)','cms',NULL),(50,'Edit',NULL,'Rediger','cms',NULL),(51,'Delete',NULL,'Slett','cms',NULL),(52,'Are you sure?',NULL,'Er du sikker?','cms',NULL),(53,'Choose an action',NULL,'Velg en handling','cms',NULL),(54,'go',NULL,'Gå!','cms',NULL),(55,'New',NULL,'Ny','cms',NULL),(56,'Blog Posts',NULL,'Blogginnlegg','cms',NULL),(57,'Reset',NULL,'Tilbakestill','cms',NULL),(58,'Filter',NULL,'Filter','cms',NULL),(59,'No result',NULL,'Ingen resultat','cms',NULL),(60,'New Page',NULL,'Ny side','cms',NULL),(61,'Content',NULL,'Innhold','cms',NULL),(62,'Включить редирект',NULL,'Aktiver omdirigering','cms',NULL),(63,'Redirect route',NULL,'Omdirigere til','cms',NULL),(64,'Redirect timeout',NULL,'Timeout omdirigering','cms',NULL),(65,'Layout',NULL,'Layout','cms',NULL),(66,'Meta title',NULL,'Meta tittel','cms',NULL),(67,'Meta description',NULL,'Meta beskrivelse','cms',NULL),(68,'Meta keywords',NULL,'Meta søkeord','cms',NULL),(69,'Back to list',NULL,'Tilbake til listen','cms',NULL),(70,'Save',NULL,'Lagre','cms',NULL),(71,'Save and add',NULL,'Lagre og legg til','cms',NULL),(72,'УРЛ-метка',NULL,'URL tag','cms',NULL),(73,'Edit Page',NULL,'Rediger denne siden','cms',NULL),(74,'User list',NULL,'Medlemsliste','cms',NULL),(75,'Created at',NULL,'Opprettet i','cms',NULL),(76,'Updated at',NULL,'Oppdatert','cms',NULL),(77,'Last login',NULL,'Siste innlogging','cms',NULL),(78,'user',NULL,'Bruker','cms',NULL),(79,'New User',NULL,'Ny bruker','cms',NULL),(80,'User',NULL,'Bruker','cms',NULL),(81,'First name',NULL,'Fornavn','cms',NULL),(82,'Last name',NULL,'Etternavn','cms',NULL),(83,'Email address',NULL,'E-post adresse','cms',NULL),(84,'Password (again)',NULL,'Passord (igjen)','cms',NULL),(85,'Permissions',NULL,'Tillatelser','cms',NULL),(86,'Is active',NULL,'Er aktiv','cms',NULL),(87,'Is super admin',NULL,'Er super admin','cms',NULL),(88,'Editing User \"%%username%%\"',NULL,'Edit \"%%username%%\"','cms',NULL),(89,'dictionary',NULL,'Ordbok','cms',NULL),(90,'Title',NULL,'Tittel','cms',NULL),(91,'Value',NULL,'Verdi','cms',NULL),(92,'settings',NULL,'Innstillinger','cms',NULL),(93,'Email template List',NULL,'Liste over E-post maler','cms',NULL),(94,'Id',NULL,'ID','cms',NULL),(95,'Subject',NULL,'Topic','cms',NULL),(96,'Message',NULL,'Beskjed','cms',NULL),(98,'Edit Email template',NULL,'Edit Email Mal','cms',NULL),(99,'New Email template',NULL,'Ny mal Email','cms',NULL),(100,'Ваше имя',NULL,'Ditt navn','frontend',NULL),(101,'Ваш Email',NULL,'Din e-post','frontend',NULL),(102,'Нужен для обратной связи',NULL,'Behov for tilbakemeldinger','frontend',NULL),(103,'Ваше сообщение',NULL,'Din melding','frontend',NULL),(104,'Reload image',NULL,'Oppdater bilde','frontend',NULL),(105,'Введите код с картинки',NULL,'Skriv inn koden fra bildet','frontend',NULL),(106,'Показатели',NULL,'Indikatorer','cms',NULL),(107,'Имя',NULL,'Navn','cms',NULL),(108,'Email',NULL,'E-post','cms',NULL),(109,'desc',NULL,'Synkende','cms',NULL),(110,'Просмотр',NULL,'Utsikt','cms',NULL),(111,'Создать пользователя',NULL,'Opprett bruker','cms',NULL),(112,'Export',NULL,'Eksport','cms',NULL),(113,'The item was updated successfully.',NULL,'Dette elementet er oppdatert.','cms',NULL),(114,'Неверный формат',NULL,'Ugyldig format','frontend',NULL),(115,'System settings',NULL,'Systeminnstillinger','cms',NULL),(116,'Section',NULL,'Seksjon','cms',NULL),(118,'Email error List',NULL,'E-post feilliste','cms',NULL),(119,'Email from',NULL,'Fra hvem','cms',NULL),(120,'Email to',NULL,'Til hvem','cms',NULL),(121,'Body',NULL,'Body','cms',NULL),(122,'Cc',NULL,'Kopi','cms',NULL),(123,'File',NULL,'File','cms',NULL),(132,'Filters',NULL,'Filter','cms',NULL),(133,'is empty',NULL,'Tom','cms',NULL),(134,'Мой профиль',NULL,'Min profil','frontend',NULL),(135,'Фотография',NULL,'Bilde','frontend',NULL),(136,'Изменить пароль',NULL,'Endre passord','frontend',NULL),(137,'Отчество',NULL,'Patronymikon','frontend',NULL),(138,'Фамилия',NULL,'Etternavn','frontend',NULL),(139,'Дата рождения\n(дд.мм.гггг)',NULL,'DOB','frontend',NULL),(140,'Телефон мобильный\n(для получения уведомлений)',NULL,'Mobiltelefon (for varsling)','frontend',NULL),(141,'Сохранить изменения',NULL,'Lagre endringer','frontend',NULL),(142,'Старый пароль',NULL,'Gammelt passord','frontend',NULL),(143,'Новый пароль',NULL,'Nytt passord','frontend',NULL),(144,'Новый пароль еще раз',NULL,'Nytt passord på nytt','frontend',NULL),(145,'Сохранить пароль',NULL,'Lagre passord','frontend',NULL),(146,'Заполните поле',NULL,'Fyll ut feltet','frontend',NULL),(147,'Passwords do not match',NULL,'Passordene samsvarer ikke','frontend',NULL),(148,'Выберите картинку из загрузите ее',NULL,'Velg et bilde og laste det opp','frontend',NULL),(149,'Image',NULL,'Bilde','frontend',NULL),(150,'Загрузить фотографию',NULL,'Last opp et bilde','frontend',NULL),(151,'File is too large (maximum is %max_size% bytes).',NULL,'Filen er for stor (maks%MAX_SIZE%).','frontend',NULL),(152,'Вы можете выбрать зону, которая будет отображаться на ваших аватарках. Кликните по одному из изображений справа',NULL,'Du kan velge området som skal vises på bildene dine. Klikk på en av de små bildene til høyre','frontend',NULL),(153,'remove the current file',NULL,'Slett gjeldende fil','frontend',NULL),(154,'Сохранить',NULL,'Lagre','frontend',NULL),(155,'Вы уверены?',NULL,'Er du sikker?','frontend',NULL),(156,'Удалить фотографию',NULL,'Slett bilde','frontend',NULL),(157,'Логин (Ваш Email)',NULL,'Brukernavn (Din e-post)','frontend',NULL),(158,'Запомнить меня на этом компьютере',NULL,'Husk meg på denne datamaskinen','frontend',NULL),(159,'Войти',NULL,'Innlogging','frontend',NULL),(160,'Забыли пароль?',NULL,'Glemt passord?','frontend',NULL),(161,'Registration',NULL,'Registrering','frontend',NULL),(162,'The username and/or password is invalid.',NULL,'Feil brukernavn eller passord','frontend',NULL),(163,'Введите код',NULL,'Skriv inn koden','frontend',NULL),(164,'Письмо отправлено',NULL,'E-post sendt','frontend',NULL),(165,'Ваш email',NULL,'Din e-post','frontend',NULL),(166,'Восстановить пароль',NULL,'Gjenopprett passord','frontend',NULL),(167,'Повторите пароль',NULL,'Bekreft passord','frontend',NULL),(168,'Я принимаю условия',NULL,'Jeg aksepterer vilkårene','frontend',NULL),(169,'Такой email уже зарегистрирован в ситеме',NULL,'Denne e-posten allerede er registrert i systemet','frontend',NULL),(170,'Пароли не совпадают',NULL,'Passordene samsvarer ikke','frontend',NULL),(171,'Вы должны принять условия пользовательского соглашения',NULL,'Du må godta vilkårene for bruk','frontend',NULL),(172,'Пароль должен быть не короче 4 символов',NULL,'Passord må være minst 4 tegn','frontend',NULL),(173,'Еще раз пароль',NULL,'Bekreft passordet ditt','frontend',NULL),(174,'Сменить пароль',NULL,'Endre passord','frontend',NULL),(175,'Пароль слишком короткий',NULL,'Passordet er for kort','frontend',NULL),(176,'Пароль восстановлен',NULL,'Passord utvinnes','frontend',NULL),(177,'Password is invalid.',NULL,'Ugyldig passord','frontend',NULL),(178,'События за сегодня',NULL,'Hendelser for dag','cms',NULL),(179,'Всего событий',NULL,'Totalt Hendelser','cms',NULL),(180,'All rights reserved',NULL,'All rights reserved','cms',NULL),(181,'Date',NULL,'Dato','cms',NULL),(182,'Is published',NULL,'Publisert','cms',NULL),(183,'yes or no',NULL,'Ja eller nei','cms',NULL),(184,'yes',NULL,'Ja','cms',NULL),(185,'no',NULL,'Ikke','cms',NULL),(186,'From',NULL,'Fra','cms',NULL),(187,'To',NULL,'Til','cms',NULL),(188,'New Blog post',NULL,'Nytt blogginnlegg','cms',NULL),(189,'Brief',NULL,'I korthet','cms',NULL),(190,'Text',NULL,'Tekst','cms',NULL),(191,'Url',NULL,'URL','cms',NULL),(193,'пользовательского соглашения',NULL,'Brukeravtale','frontend',NULL),(194,'The item was created successfully.',NULL,'Dette elementet ble opprettet.','cms',NULL),(195,'You don\'t have proper credentials to access this page',NULL,'Du har ikke de nødvendige rettighetene for å få tilgang til denne siden','cms',NULL),(197,'Secure',NULL,'En lukket forum','cms',NULL),(210,'Server is not responding',NULL,'Serveren svarer ikke','cms',NULL),(211,'Data saved',NULL,'Data lagret','cms',NULL),(212,'Error while saving data',NULL,'Feil ved lagring av data','cms',NULL),(217,'Unexpected extra form field named \"%field%\".',NULL,'Uventet ekstra skjemafelt som heter \"%feltet%\".','cms',NULL),(221,'Вы можете править текст прямо в списке. Исправьте все, что считаете нужным, а затем нажмите TAB или щелкните мышью в любом месте вне поля ввода.',NULL,'Du kan redigere teksten direkte i listen. Korrigere alle som passer, og deretter trykke TAB eller klikk hvor som helst utenfor inntastingsfeltet.','cms',NULL),(222,'Воспользуйтесь фильтром, чтобы найти нужный вам текст',NULL,'Bruk filteret for å finne ønsket tekst','cms',NULL),(223,'Отправить',NULL,'Sende','frontend',NULL),(224,'The item has not been saved due to some errors.',NULL,'Objektet ble ikke lagret på grunn av noen feil','cms',NULL),(225,'An object with the same \"%column%\" already exist.',NULL,'Objektet med verdien av feltet \"%%kolonnen\" allerede finnes i systemet.','cms',NULL),(226,'Update',NULL,'Oppdater','cms',NULL),(235,'Страницы',NULL,'Page','cms',NULL),(236,'Пользователи',NULL,'Brukere','cms',NULL),(237,'Настройки',NULL,'Innstillinger','cms',NULL),(238,'Редирект 301',NULL,'301s','cms',NULL),(239,'Уведомления',NULL,'Notice','cms',NULL),(241,'Url from',NULL,'Hvorfra','cms',NULL),(242,'Url to',NULL,'Hvor','cms',NULL),(243,'Comment',NULL,'Beskrivelse','cms',NULL),(245,'from %from_date%<br />to %to_date%',NULL,'Fra%from_date%til%to_date%','cms',NULL),(246,'Checked',NULL,'Bemerket','cms',NULL),(248,'You must at least select one item.',NULL,'Du må velge minst ett objekt','cms',NULL),(249,'blog_post',NULL,'Blogginnlegg','cms',NULL),(250,'Extra',NULL,'I tillegg','cms',NULL),(251,'Edit Blog post',NULL,'Redigere et blogginnlegg','cms',NULL),(252,'The begin date must be before the end date.',NULL,'Startdato må være mindre enn sluttdatoen','cms',NULL),(257,'%%title%%',NULL,'%%title%%','cms',NULL),(258,'Email администратора',NULL,'E-post administrator','cms',NULL),(259,'На этот адрес вам будут приходить сообщения с сайта',NULL,'På denne adressen vil du motta meldinger fra nettstedet','cms',NULL),(260,'Имя отправителя почты',NULL,'Avsendernavn','cms',NULL),(261,'От этого имени сайт будет отправлять почту',NULL,'Alle e-poster vil bli sendt på vegne av det navnet','cms',NULL),(263,'Адрес',NULL,'Adresse','cms',NULL),(264,'Контактный телефон',NULL,'Kontakt telefon','cms',NULL),(265,'Контактный email',NULL,'Kontakt e-post','cms',NULL),(266,'Type',NULL,'Type','cms',NULL),(267,'Description',NULL,'Beskrivelse','cms',NULL),(268,'Admin email',NULL,'E-post til administrator','cms',NULL),(269,'User email',NULL,'E-post til brukeren','cms',NULL),(270,'Phone number',NULL,'Telefonnummer','cms',NULL),(271,'Company name',NULL,'Firmanavn','cms',NULL),(272,'Attach',NULL,'Vedlagt fil','cms',NULL),(275,'Show',NULL,'Vis','cms',NULL),(279,'Password recovery',NULL,'Passordgjenoppretting','cms',NULL),(281,'Registration',NULL,'Registrering','cms',NULL),(283,'Page',NULL,'Page','cms',NULL),(284,'Описание',NULL,'Beskrivelse','cms',NULL),(285,'redirect301',NULL,'301s','cms',NULL),(287,'email_template',NULL,'E-post maler','cms',NULL),(288,'Имя',NULL,'Fornavn','frontend',NULL),(289,'Email',NULL,'E-post','frontend',NULL),(290,'Invalid mime type (%mime_type%).',NULL,'Feil filformat (%mime_type%).','frontend',NULL),(291,'Password',NULL,'Passord','frontend',NULL),(292,'Регистрация',NULL,'Registrering','frontend',NULL),(293,'ссылке',NULL,'Link','frontend',NULL),(295,'Notifications',NULL,'Påminnelser','cms',NULL),(296,'Pages',NULL,'Sider','cms',NULL),(297,'Apply',NULL,'Påfør','frontend',NULL),(298,'Discard',NULL,'Avbryt','frontend',NULL),(299,'Данные сохранены',NULL,'Endringer lagret!','frontend',NULL),(301,'Изображение удалено',NULL,'Bilde fjernet','frontend',NULL),(303,'Код введен неверно',NULL,'Koden du skrev inn er ugyldig','frontend',NULL),(304,'Такой email не зарегистрирован в системе',NULL,'Denne e-posten er ikke registrert i systemet','frontend',NULL),(305,' csrf token',NULL,'CSRF token','frontend',NULL),(306,'The item was deleted successfully.',NULL,'Elementet ble slettet.','cms',NULL),(307,'You must select an action to execute on the selected items.',NULL,'Du må velge en handling for å kjøre på de valgte elementene.','cms',NULL),(308,'The selected items have been deleted successfully.',NULL,'De valgte elementene har blitt slettet.','cms',NULL),(310,'Cообщения с сайта',NULL,'Meldinger fra stedet','cms',NULL),(311,'Да, это мой email-аккаунт!',NULL,'Ja, dette er min e-postkonto!','frontend',NULL),(312,'Подтвердить email аккаунт!',NULL,'Bekreft e-postkonto!','frontend',NULL),(313,'Подтверждаю!',NULL,'Enig!','frontend',NULL),(314,'Войти с помощью:',NULL,'Logg inn med:','frontend',NULL);
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
INSERT INTO `menu_item` (`id`, `name`, `root_name`, `type`, `page_id`, `cms_module_id`, `route`, `external`, `is_empty`, `is_auth`, `icon_class`, `root_id`, `lft`, `rgt`, `level`) VALUES (1,'Hovedmeny','main','empty',NULL,NULL,NULL,NULL,1,0,NULL,1,1,52,0),(2,'Hjem','','route',1,NULL,'homepage','',1,0,NULL,1,1,1,1),(3,'Om oss',NULL,'page',2,NULL,NULL,NULL,1,0,NULL,1,44,45,1),(4,'Kontakter',NULL,'module',3,2,'','',1,0,NULL,1,46,47,1),(5,'En lukket forum',NULL,'page',14,NULL,'','',1,1,'',1,50,51,1),(6,'Menyen footer','bottom','empty',NULL,NULL,NULL,NULL,1,0,NULL,6,6,NULL,0),(7,'Personvern',NULL,'page',13,NULL,'','',1,0,'',6,6,5,1),(8,'Brukeravtale',NULL,'page',12,NULL,'','',1,0,'',6,6,5,1);
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
INSERT INTO `email_template` (`id`, `name`, `subject`, `message`) VALUES (1,'registration_user','Registrere seg på prosjektet DEV2','Hei, {%FIRST_NAME%}! Du har blitt registrert med hell! Følg denne {%lenken%}, for å aktivere kontoen din!'),(2,'registration_admin','Registrere en ny konto','Bruker {%FULL_NAME%} registrert hos oss!'),(3,'password_recovery_user','Passordgjenoppretting','God dag, {%FULL_NAME%} Du har bedt om passordgjenoppretting på Dev2 prosjektet. Følg dette {%LINK%} for å sette et nytt passord. Hvis du ikke har bedt om passordgjenoppretting, kan du se bort fra dette brevet.'),(4,'contactus_message_user','Prosjekt DEV2. Din melding er viktig for oss!','Kjære {%name%}! Takk for din melding! Det er veldig viktig for oss!'),(5,'contactus_message_admin','Prosjekt DEV2. ny melding','Noen {%name%} sendte en melding. Tekst: {%melding%} E-Mail: {%email%}'),(6,'social_bridge_user_confirm_email_user','Demo.web375.org - Bekreft e-postadressen din i det sosiale nettverket {%network_name%}','Bekreft e {%email%}, følg linken {%link%} eller bruke denne koden {%token%}');
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

-- Dump completed on 2014-11-05 20:24:17

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
INSERT INTO `page` (`id`, `name`, `content`, `is_module_page`, `module_name`, `is_content_editable`, `special_mark`, `is_redirect`, `redirect_route`, `redirect_timeout`, `layout`, `slug`, `meta_title`, `meta_description`, `meta_keywords`) VALUES (1,'Tervetuloa!','Terveisiä teille, nuori ystäväni! Tulit tämän sivuston, koska et itse tarvitse verkkosivuilla. Tai ehkä vain tullut tänne sattumalta! Joka tapauksessa, tervetuloa!',1,'default',1,'default',0,'/',5,'','tervetuloa','Tervetuloa verkkosivuilla hankkeen DEV2!','',''),(2,'Meistä','Olemme nuori, mutta jo hyvin kokenut yritys harjoittaa kehittäminen ja edistäminen sivustoja',0,NULL,1,NULL,0,'/',5,'','meistae','Tietoa hankkeesta','',''),(3,'Palaute','Lähetä meille viesti ja otamme sinuun yhteyttä mahdollisimman pian!',0,NULL,1,'contactus',0,'/',5,'','palaute','Ota yhteyttä - Project DEV2','',''),(4,'Rekisteröinti','',0,NULL,0,'register',0,'/',5,NULL,'rekisteroeinti','Rekisteröinti','',''),(5,'Salasanan palautus','Klikkaa \"Palauta salasana\" ja me Lähetä sähköpostia sähköpostiviestejä, jotka viittaavat salasanan palautussivulle',0,NULL,1,'auth_forgot_password',0,'/',5,NULL,'salasanan-palautus','Salasanan palautus','',''),(6,'Salasanan palautus. Sähköposti lähetetty.','Sähköposti on lähetetty sähköpostiviestejä',0,NULL,1,'auth_forgot_password_thanks',1,'/',5,'','salasanan-palautus-saehkoeposti-laehetetty','Salasanan palautus. Sähköposti lähetetty.','',''),(7,'Salasanan palautus. lähetetty tekstiviesti','',0,NULL,1,'auth_forgot_sms',0,'/',5,NULL,'salasanan-palautus-laehetetty-tekstiviesti','Salasanan palautus. lähetetty tekstiviesti','',''),(8,'Keksi uusi salasana','',0,NULL,1,'auth_password_recovery',0,'/',5,NULL,'keksi-uusi-salasana','Keksi uusi salasana','',''),(9,'Henkilökohtainen Area','',0,NULL,1,'auth_signin',0,'/',5,NULL,'henkiloekohtainen-area','Henkilökohtainen Area','',''),(10,'Rekisteröinti johdetaan','Me lähetetään edelleen ilmoittautumisohjeet sähköpostiisi',0,NULL,1,'auth_registration_complete',1,'/',5,NULL,'rekisteroeinti-johdetaan','Rekisteröinti johdetaan','',''),(11,'Aktivointi on kulunut','Nyt voit kirjautua sisään!',0,NULL,1,'auth_activation_successful',1,'/profile',3,'','aktivointi-on-kulunut','Aktivointi on kulunut','',''),(12,'Käyttäjäsopimus','Täällä on aivan tyypillinen käyttäjä sopimus',0,NULL,1,'user_agreement',0,'/',5,'','kaeyttaejaesopimus','Käyttäjäsopimus','',''),(13,'Yksityisyyden suoja','Täällä on aivan tyypillinen sivu Tietoja Tietosuoja',0,NULL,1,'privacy_policy',0,'/',5,'','yksityisyyden-suoja','Yksityisyyden suoja','',''),(14,'Suljettu foorumi','Jos törmäät tämän sivun, se tarkoittaa, että olet valtuutettu käyttäjä!',0,NULL,1,NULL,0,'/',5,NULL,'suljettu-foorumi','Suljettu foorumi','',''),(15,'Tämä on testi sivu','',0,NULL,1,NULL,0,'/',5,'','taemae-on-testi-sivu','Tämä on testi sivu','',''),(16,'Virhe 404','Error 404. Sivua ei löydy',0,NULL,1,'error404',0,'/',5,NULL,'virhe-404','Virhe 404','',''),(17,'Oma profiili','Täällä voit muokata henkilökohtaisia ​​tietoja, ladata kuvan ja vaihtaa salasanan',0,NULL,0,'profile',0,'/',5,NULL,'oma-profiili','Oma profiili','',''),(18,'Oma profiili - Vaihda salasana','Tallennamme salasanasi salatussa muodossa.',0,NULL,0,'profile_password',0,'/',5,NULL,'oma-profiili-vaihda-salasana','Oma profiili - Vaihda salasana','',''),(19,'Oma profiili - Muokkaa kuva','',0,NULL,0,'profile_avatar',0,'/',5,NULL,'oma-profiili-muokkaa-kuva','Oma profiili - Muokkaa kuva','',''),(20,'IP-osoite on estetty','Valitettavasti selville, miksi osoitteesi on estetty! Kiitos!',0,NULL,1,'ip_banned',0,'/',5,'empty','ip-osoite-on-estetty','IP-osoite on estetty','',''),(21,'Ole hyvä ja rekisteröidy tai kirjaudu sisään','Nähdä sisällön tämän osion, kirjaudu sisään',0,NULL,1,'auth_secure',0,'/',5,NULL,'ole-hyvae-ja-rekisteroeidy-tai-kirjaudu-sisaeaen','Ole hyvä ja rekisteröidy tai kirjaudu sisään','',''),(22,'Confirmation of account in socConfirm your social networks accountial networks','Huomio! Sähköposti {%email%} on jo olemassa järjestelmässä! Jos tämä on sähköpostiosoite, hyväksy se!',0,NULL,1,'oauth_bridge',0,'/',5,NULL,'confirmation-of-account-in-socconfirm-your-social-networks-accountial-networks','Vahvista sosiaaliset verkostot tili','',''),(23,'Vahvista sosiaalisten verkostojen huomioon. vaihe kaksi','Vahvistus kirje on lähetetty sähköpostiosoitteesi {%email%}',0,NULL,1,'oauth_bridge_confirm',0,'/',5,NULL,'vahvista-sosiaalisten-verkostojen-huomioon-vaihe-kaksi','Vahvista sosiaaliset verkostot tili','',''),(24,'OAuth luvan virhe','',0,NULL,1,'oauth_error',0,'/',5,NULL,'oauth-luvan-virhe','OAuth luvan virhe','','');
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
INSERT INTO `text_block` (`id`, `name`, `title`, `text`, `application`, `module`) VALUES (1,'Username',NULL,'Käyttäjätunnus','cms',NULL),(2,'Password',NULL,'Salasana','cms',NULL),(3,'Remember?',NULL,'Muista minut?','cms',NULL),(4,'Login',NULL,'Kirjaudu','cms',NULL),(5,'Welcome to',NULL,'Tervetuloa','cms',NULL),(6,'Use a valid username and password to gain access to the administration console.',NULL,'Käytä voimassa oleva käyttäjätunnus ja salasana päästäkseen hallinnon konsoli.','cms',NULL),(7,'Вход',NULL,'Kirjaudu','frontend',NULL),(8,'Ваша компания',NULL,'Your Company','frontend',NULL),(9,'Разработка и поддержка',NULL,'Kehittäminen ja tuki','frontend',NULL),(11,'Blog',NULL,'Blogi','cms',NULL),(12,'Posts',NULL,'Viestit','cms',NULL),(13,'Comments',NULL,'Kommentit','cms',NULL),(14,'Tags',NULL,'Tunnisteet','cms',NULL),(15,'Users',NULL,'Käyttäjät','cms',NULL),(16,'Settings',NULL,'Asetukset','cms',NULL),(18,'Email шаблоны',NULL,'Email malleja','cms',NULL),(21,'Сообщения',NULL,'Viestit','cms',NULL),(28,'Локализация',NULL,'Lokalisointi','cms',NULL),(33,'Добавить',NULL,'Lisätä','cms',NULL),(34,'Go to Frontend',NULL,'Sivuston','cms',NULL),(35,'Logout',NULL,'Poistua','cms',NULL),(36,'dashboard',NULL,'Kojelauta','cms',NULL),(37,'Профиль',NULL,'Profiili','frontend',NULL),(38,'Выход',NULL,'Poistua','frontend',NULL),(39,'Админка',NULL,'Admin','frontend',NULL),(40,'Page List',NULL,'Luettelo Sivut','cms',NULL),(41,'Name',NULL,'Otsikko','cms',NULL),(42,'Slug',NULL,'URL','cms',NULL),(43,'Actions',NULL,'Toiminnot','cms',NULL),(44,'First page',NULL,'Ensimmäinen sivu','cms',NULL),(45,'Previous page',NULL,'Edellinen sivu','cms',NULL),(46,'Next page',NULL,'Seuraava sivu','cms',NULL),(47,'Last page',NULL,'Viimeinen sivu','cms',NULL),(48,'[0] no result|[1] 1 result|(1,+Inf] %1% results',NULL,'[0] Ei tulos |[1] 1 tulos|(1,+Inf] %1% tulosta','cms',NULL),(49,'(page %%page%%/%%nb_pages%%)',NULL,'(sivu%%page%%/%%nb_pages%%)','cms',NULL),(50,'Edit',NULL,'Muokata','cms',NULL),(51,'Delete',NULL,'Poistaa','cms',NULL),(52,'Are you sure?',NULL,'Oletko varma?','cms',NULL),(53,'Choose an action',NULL,'Valitse toiminta','cms',NULL),(54,'go',NULL,'Go!','cms',NULL),(55,'New',NULL,'Uusi','cms',NULL),(56,'Blog Posts',NULL,'Blogimerkinnät','cms',NULL),(57,'Reset',NULL,'Asettaa uudelleen','cms',NULL),(58,'Filter',NULL,'Suodatin','cms',NULL),(59,'No result',NULL,'Ei tulos','cms',NULL),(60,'New Page',NULL,'Uusi sivu','cms',NULL),(61,'Content',NULL,'Sisältö','cms',NULL),(62,'Включить редирект',NULL,'Ota uudelleenohjaus','cms',NULL),(63,'Redirect route',NULL,'Uudelleenohjata','cms',NULL),(64,'Redirect timeout',NULL,'Uudelleenohjaus timeout','cms',NULL),(65,'Layout',NULL,'Layout','cms',NULL),(66,'Meta title',NULL,'Meta otsikko','cms',NULL),(67,'Meta description',NULL,'Meta kuvaus','cms',NULL),(68,'Meta keywords',NULL,'Meta avainsanat','cms',NULL),(69,'Back to list',NULL,'Takaisin luetteloon','cms',NULL),(70,'Save',NULL,'Tallenna','cms',NULL),(71,'Save and add',NULL,'Tallentaa ja lisää','cms',NULL),(72,'УРЛ-метка',NULL,'URL tag','cms',NULL),(73,'Edit Page',NULL,'Muokkaa tätä sivua','cms',NULL),(74,'User list',NULL,'Jäsenlista','cms',NULL),(75,'Created at',NULL,'Luotu','cms',NULL),(76,'Updated at',NULL,'Päivitetty klo','cms',NULL),(77,'Last login',NULL,'Viimeksi kirjautunut','cms',NULL),(78,'user',NULL,'Käyttäjä','cms',NULL),(79,'New User',NULL,'Uusi käyttäjä','cms',NULL),(80,'User',NULL,'Käyttäjä','cms',NULL),(81,'First name',NULL,'Etunimi','cms',NULL),(82,'Last name',NULL,'Sukunimi','cms',NULL),(83,'Email address',NULL,'Sähköpostiosoite','cms',NULL),(84,'Password (again)',NULL,'Salasana (uudestaan​​)','cms',NULL),(85,'Permissions',NULL,'Oikeudet','cms',NULL),(86,'Is active',NULL,'On aktiivinen','cms',NULL),(87,'Is super admin',NULL,'On super admin','cms',NULL),(88,'Editing User \"%%username%%\"',NULL,'Edit \"%%username%%\"','cms',NULL),(89,'dictionary',NULL,'Sanakirja','cms',NULL),(90,'Title',NULL,'Otsikko','cms',NULL),(91,'Value',NULL,'Arvo','cms',NULL),(92,'settings',NULL,'Asetukset','cms',NULL),(93,'Email template List',NULL,'Luettelo Sähköposti Mallit','cms',NULL),(94,'Id',NULL,'ID','cms',NULL),(95,'Subject',NULL,'Aihe','cms',NULL),(96,'Message',NULL,'Viesti','cms',NULL),(98,'Edit Email template',NULL,'Edit Sähköpostimalli','cms',NULL),(99,'New Email template',NULL,'Uusi malli Sähköposti','cms',NULL),(100,'Ваше имя',NULL,'Nimesi','frontend',NULL),(101,'Ваш Email',NULL,'E-mail','frontend',NULL),(102,'Нужен для обратной связи',NULL,'Need for palaute','frontend',NULL),(103,'Ваше сообщение',NULL,'Viestisi','frontend',NULL),(104,'Reload image',NULL,'Päivitä kuva','frontend',NULL),(105,'Введите код с картинки',NULL,'Syötä kuvan koodi','frontend',NULL),(106,'Показатели',NULL,'Indikaattorit','cms',NULL),(107,'Имя',NULL,'Nimi','cms',NULL),(108,'Email',NULL,'E-mail','cms',NULL),(109,'desc',NULL,'Aleneva','cms',NULL),(110,'Просмотр',NULL,'Näkymä','cms',NULL),(111,'Создать пользователя',NULL,'Luo Käyttäjä','cms',NULL),(112,'Export',NULL,'Vienti','cms',NULL),(113,'The item was updated successfully.',NULL,'Tämä kohta päivitys onnistui.','cms',NULL),(114,'Неверный формат',NULL,'Virheellinen muoto','frontend',NULL),(115,'System settings',NULL,'System Settings','cms',NULL),(116,'Section',NULL,'Jakso','cms',NULL),(118,'Email error List',NULL,'Sähköposti virheluettelo','cms',NULL),(119,'Email from',NULL,'Keneltä','cms',NULL),(120,'Email to',NULL,'Kenelle','cms',NULL),(121,'Body',NULL,'Runko','cms',NULL),(122,'Cc',NULL,'Kopio','cms',NULL),(123,'File',NULL,'Tiedosto','cms',NULL),(132,'Filters',NULL,'Suodatin','cms',NULL),(133,'is empty',NULL,'Tyhjä','cms',NULL),(134,'Мой профиль',NULL,'Oma profiili','frontend',NULL),(135,'Фотография',NULL,'Kuva','frontend',NULL),(136,'Изменить пароль',NULL,'Vaihda salasana','frontend',NULL),(137,'Отчество',NULL,'Patronyymi','frontend',NULL),(138,'Фамилия',NULL,'Sukunimi','frontend',NULL),(139,'Дата рождения\n(дд.мм.гггг)',NULL,'Syntymäaika','frontend',NULL),(140,'Телефон мобильный\n(для получения уведомлений)',NULL,'Matkapuhelin (ilmoituksen)','frontend',NULL),(141,'Сохранить изменения',NULL,'Tallenna muutokset','frontend',NULL),(142,'Старый пароль',NULL,'Vanha salasana','frontend',NULL),(143,'Новый пароль',NULL,'Uusi salasana','frontend',NULL),(144,'Новый пароль еще раз',NULL,'Uusi salasana','frontend',NULL),(145,'Сохранить пароль',NULL,'Tallenna salasana','frontend',NULL),(146,'Заполните поле',NULL,'Täytä kenttä','frontend',NULL),(147,'Passwords do not match',NULL,'Salasanat eivät täsmää','frontend',NULL),(148,'Выберите картинку из загрузите ее',NULL,'Valitse kuva ja lähetä se','frontend',NULL),(149,'Image',NULL,'Kuva','frontend',NULL),(150,'Загрузить фотографию',NULL,'Lähetä kuva','frontend',NULL),(151,'File is too large (maximum is %max_size% bytes).',NULL,'Tiedosto on liian suuri (enintään%MAX_SIZE%).','frontend',NULL),(152,'Вы можете выбрать зону, которая будет отображаться на ваших аватарках. Кликните по одному из изображений справа',NULL,'Voit valita alueen, joka näytetään kuvia. Valitse jokin pieniä kuvia oikealle','frontend',NULL),(153,'remove the current file',NULL,'Poista nykyinen tiedosto','frontend',NULL),(154,'Сохранить',NULL,'Tallenna','frontend',NULL),(155,'Вы уверены?',NULL,'Oletko varma?','frontend',NULL),(156,'Удалить фотографию',NULL,'Poista kuva','frontend',NULL),(157,'Логин (Ваш Email)',NULL,'Käyttäjänimi (sähköposti)','frontend',NULL),(158,'Запомнить меня на этом компьютере',NULL,'Muista minut tällä tietokoneella','frontend',NULL),(159,'Войти',NULL,'Kirjaudu','frontend',NULL),(160,'Забыли пароль?',NULL,'Unohtuiko salasana?','frontend',NULL),(161,'Registration',NULL,'Rekisteröinti','frontend',NULL),(162,'The username and/or password is invalid.',NULL,'Virheelliset tai salasana','frontend',NULL),(163,'Введите код',NULL,'Syötä koodi','frontend',NULL),(164,'Письмо отправлено',NULL,'Sähköposti lähetetään','frontend',NULL),(165,'Ваш email',NULL,'Sähköpostiosoite','frontend',NULL),(166,'Восстановить пароль',NULL,'Salasanan palautus','frontend',NULL),(167,'Повторите пароль',NULL,'Vahvista salasana','frontend',NULL),(168,'Я принимаю условия',NULL,'Hyväksyn ehdot','frontend',NULL),(169,'Такой email уже зарегистрирован в ситеме',NULL,'Tämä sähköpostiosoite on jo rekisteröity järjestelmään','frontend',NULL),(170,'Пароли не совпадают',NULL,'Salasanat eivät täsmää','frontend',NULL),(171,'Вы должны принять условия пользовательского соглашения',NULL,'Sinun on hyväksyttävä käyttöehdot','frontend',NULL),(172,'Пароль должен быть не короче 4 символов',NULL,'Salasanan pitää olla vähintään 4 merkkiä pitkä','frontend',NULL),(173,'Еще раз пароль',NULL,'Vahvista salasana','frontend',NULL),(174,'Сменить пароль',NULL,'Vaihda salasana','frontend',NULL),(175,'Пароль слишком короткий',NULL,'Salasana on liian lyhyt','frontend',NULL),(176,'Пароль восстановлен',NULL,'Salasana talteen','frontend',NULL),(177,'Password is invalid.',NULL,'Virheellinen salasana','frontend',NULL),(178,'События за сегодня',NULL,'Tapahtumat tänään','cms',NULL),(179,'Всего событий',NULL,'Tapahtumia yhteensä','cms',NULL),(180,'All rights reserved',NULL,'Kaikki oikeudet pidätetään','cms',NULL),(181,'Date',NULL,'Päivämäärä','cms',NULL),(182,'Is published',NULL,'Julkaistu','cms',NULL),(183,'yes or no',NULL,'Kyllä tai ei','cms',NULL),(184,'yes',NULL,'Kyllä','cms',NULL),(185,'no',NULL,'Ei','cms',NULL),(186,'From',NULL,'Alkaen','cms',NULL),(187,'To',NULL,'Jos haluat','cms',NULL),(188,'New Blog post',NULL,'Uusi blogikirjoitus','cms',NULL),(189,'Brief',NULL,'Lyhyesti','cms',NULL),(190,'Text',NULL,'Teksti','cms',NULL),(191,'Url',NULL,'URL','cms',NULL),(193,'пользовательского соглашения',NULL,'Käyttäjäsopimus','frontend',NULL),(194,'The item was created successfully.',NULL,'Tämä kohde on luotu onnistuneesti.','cms',NULL),(195,'You don\'t have proper credentials to access this page',NULL,'Sinulla ei ole asianmukaista valtakirjaa päästä tälle sivulle','cms',NULL),(197,'Secure',NULL,'Suljettu foorumi','cms',NULL),(210,'Server is not responding',NULL,'Palvelin ei vastaa','cms',NULL),(211,'Data saved',NULL,'Tallennetut tiedot','cms',NULL),(212,'Error while saving data',NULL,'Virhe tallennettaessa tietoja','cms',NULL),(217,'Unexpected extra form field named \"%field%\".',NULL,'Odottamattomat ylimääräiset lomakkeen kenttä nimeltä \"%field%\".','cms',NULL),(221,'Вы можете править текст прямо в списке. Исправьте все, что считаете нужным, а затем нажмите TAB или щелкните мышью в любом месте вне поля ввода.',NULL,'Voit muokata tekstiä suoraan luettelosta. Korjaa kaikki soveltuvat, ja paina TAB tai napsauta mitä tahansa ulkopuolella syöttökenttään.','cms',NULL),(222,'Воспользуйтесь фильтром, чтобы найти нужный вам текст',NULL,'Käytä suodatinta löytää haluamasi teksti','cms',NULL),(223,'Отправить',NULL,'Lähettää','frontend',NULL),(224,'The item has not been saved due to some errors.',NULL,'Objekti ei ole tallennettu vuoksi joitakin virheitä','cms',NULL),(225,'An object with the same \"%column%\" already exist.',NULL,'Esineen arvo kentän \"%sarake%\" on jo olemassa järjestelmässä.','cms',NULL),(226,'Update',NULL,'Päivitys','cms',NULL),(235,'Страницы',NULL,'Sivu','cms',NULL),(236,'Пользователи',NULL,'Käyttäjät','cms',NULL),(237,'Настройки',NULL,'Asetukset','cms',NULL),(238,'Редирект 301',NULL,'301s','cms',NULL),(239,'Уведомления',NULL,'Ilmoitus','cms',NULL),(241,'Url from',NULL,'Mistä','cms',NULL),(242,'Url to',NULL,'Jossa','cms',NULL),(243,'Comment',NULL,'Kuvaus','cms',NULL),(245,'from %from_date%<br />to %to_date%',NULL,'Alkaen%from_date%  sta%to_date%','cms',NULL),(246,'Checked',NULL,'Huomattava','cms',NULL),(248,'You must at least select one item.',NULL,'Sinun on valittava ainakin yksi kohde','cms',NULL),(249,'blog_post',NULL,'Blogi','cms',NULL),(250,'Extra',NULL,'Lisäksi','cms',NULL),(251,'Edit Blog post',NULL,'Muokkaa blogi','cms',NULL),(252,'The begin date must be before the end date.',NULL,'Aloituspäivä on oltava alle lopetuspäivä','cms',NULL),(257,'%%title%%',NULL,'%%title%%','cms',NULL),(258,'Email администратора',NULL,'Sähköposti ylläpitäjä','cms',NULL),(259,'На этот адрес вам будут приходить сообщения с сайта',NULL,'Tässä osoitteessa voit saada viestejä sivusto','cms',NULL),(260,'Имя отправителя почты',NULL,'Sähköposti lähettäjän nimi','cms',NULL),(261,'От этого имени сайт будет отправлять почту',NULL,'Kaikki sähköpostit lähetetään puolesta, että nimi','cms',NULL),(263,'Адрес',NULL,'Osoite','cms',NULL),(264,'Контактный телефон',NULL,'Yhteystiedot puhelin','cms',NULL),(265,'Контактный email',NULL,'Yhteyssähköposti','cms',NULL),(266,'Type',NULL,'Tyyppi','cms',NULL),(267,'Description',NULL,'Kuvaus','cms',NULL),(268,'Admin email',NULL,'Sähköposti ylläpitäjälle','cms',NULL),(269,'User email',NULL,'Sähköposti käyttäjälle','cms',NULL),(270,'Phone number',NULL,'Puhelinnumero','cms',NULL),(271,'Company name',NULL,'Yrityksen nimi','cms',NULL),(272,'Attach',NULL,'Liitetiedosto','cms',NULL),(275,'Show',NULL,'Show','cms',NULL),(279,'Password recovery',NULL,'Salasanan palautus','cms',NULL),(281,'Registration',NULL,'Rekisteröinti','cms',NULL),(283,'Page',NULL,'Sivu','cms',NULL),(284,'Описание',NULL,'Kuvaus','cms',NULL),(285,'redirect301',NULL,'301s','cms',NULL),(287,'email_template',NULL,'Email malleja','cms',NULL),(288,'Имя',NULL,'Etunimi','frontend',NULL),(289,'Email',NULL,'Sähköposti','frontend',NULL),(290,'Invalid mime type (%mime_type%).',NULL,'Virheellinen tiedostomuoto (%mime_type%).','frontend',NULL),(291,'Password',NULL,'Salasana','frontend',NULL),(292,'Регистрация',NULL,'Rekisteröinti','frontend',NULL),(293,'ссылке',NULL,'Linkki','frontend',NULL),(295,'Notifications',NULL,'Ilmoitukset','cms',NULL),(296,'Pages',NULL,'Sivut','cms',NULL),(297,'Apply',NULL,'Käyttää','frontend',NULL),(298,'Discard',NULL,'Peruuttaa','frontend',NULL),(299,'Данные сохранены',NULL,'Muutokset tallennettu!','frontend',NULL),(301,'Изображение удалено',NULL,'Kuva poistetaan','frontend',NULL),(303,'Код введен неверно',NULL,'Koodi on virheellinen','frontend',NULL),(304,'Такой email не зарегистрирован в системе',NULL,'Tämä sähköpostiosoite ei ole rekisteröity järjestelmään','frontend',NULL),(305,' csrf token',NULL,'CSRF token','frontend',NULL),(306,'The item was deleted successfully.',NULL,'Tuote on poistettu onnistuneesti.','cms',NULL),(307,'You must select an action to execute on the selected items.',NULL,'Sinun tulee valita toiminnan suoritettavaksi valitut kohteet.','cms',NULL),(308,'The selected items have been deleted successfully.',NULL,'Valitut kohteet on poistettu onnistuneesti.','cms',NULL),(310,'Cообщения с сайта',NULL,'Viestit site','cms',NULL),(311,'Да, это мой email-аккаунт!',NULL,'Kyllä, tämä on minun email tunnus!','frontend',NULL),(312,'Подтвердить email аккаунт!',NULL,'Vahvista sähköpostitilin!','frontend',NULL),(313,'Подтверждаю!',NULL,'Samaa mieltä!','frontend',NULL),(314,'Войти с помощью:',NULL,'Kirjaudu:','frontend',NULL);
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
INSERT INTO `menu_item` (`id`, `name`, `root_name`, `type`, `page_id`, `cms_module_id`, `route`, `external`, `is_empty`, `is_auth`, `icon_class`, `root_id`, `lft`, `rgt`, `level`) VALUES (1,'Päävalikko','main','empty',NULL,NULL,NULL,NULL,1,0,NULL,1,1,52,0),(2,'Koti','','route',1,NULL,'homepage','',1,0,NULL,1,1,1,1),(3,'Meistä',NULL,'page',2,NULL,NULL,NULL,1,0,NULL,1,44,45,1),(4,'Yhteydet',NULL,'module',3,2,'','',1,0,NULL,1,46,47,1),(5,'Suljettu foorumi',NULL,'page',14,NULL,'','',1,1,'',1,50,51,1),(6,'Footer valikossa','bottom','empty',NULL,NULL,NULL,NULL,1,0,NULL,6,6,NULL,0),(7,'Yksityisyyden suoja',NULL,'page',13,NULL,'','',1,0,'',6,6,5,1),(8,'Käyttäjäsopimus',NULL,'page',12,NULL,'','',1,0,'',6,6,5,1);
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
INSERT INTO `email_template` (`id`, `name`, `subject`, `message`) VALUES (1,'registration_user','Rekisteröidy hankkeesta DEV2','Hei, {%first_name%}! Olet rekisteröitynyt onnistuneesti! Seuraa tätä {%linkkiä%}, voit aktivoida tilisi!'),(2,'registration_admin','Rekisteröi uusi tili','Käyttäjän {%FULL_NAME%} rekisteröitynyt kanssamme!'),(3,'password_recovery_user','Salasanan palautus','Hyvää päivää, {%FULL_NAME%} Olet pyytänyt salasanan elpyminen DEV2 projekti. Seuraa tätä {%LINK%} asettaa uuden salasanan. Jos et ole pyytänyt salasanan palautus, voit jättää tämän kirjeen.'),(4,'contactus_message_user','Projekti DEV2. Viestisi on meille tärkeää!','Rakas {%name%}! Kiitos viestistäsi! On erittäin tärkeää meille!'),(5,'contactus_message_admin','Projekti DEV2. uusi viesti','Joku {%name%} lähetti viestin. Teksti: {%viesti%} E-Mail: {%email%}'),(6,'social_bridge_user_confirm_email_user','Demo.web375.org - Vahvista sähköpostiosoitteesi sosiaalinen verkosto {%network_name%}','Vahvista sähköpostiosoite {%email%}, seuraa linkkiä {%link%} tai käyttää tätä koodia {%token%}');
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

-- Dump completed on 2014-11-05 20:24:00

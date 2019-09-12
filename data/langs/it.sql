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
INSERT INTO `page` (`id`, `name`, `content`, `is_module_page`, `module_name`, `is_content_editable`, `special_mark`, `is_redirect`, `redirect_route`, `redirect_timeout`, `layout`, `slug`, `meta_title`, `meta_description`, `meta_keywords`) VALUES (1,'Benvenuto!','Saluti a te, giovane amico! Siete venuti a questo sito perché tu stesso bisogno di un sito web. O forse siete venuti qui per caso! In ogni caso, benvenuto!',1,'default',1,'default',0,'/',5,'','benvenuto','Benvenuti nel sito del DEV2 progetto!','',''),(2,'Chi siamo','Siamo una società giovane ma già molto esperto impegnata nello sviluppo e nella promozione di siti web',0,NULL,1,NULL,0,'/',5,'','chi-siamo','Informazioni sul progetto','',''),(3,'Feedback','Inviaci un messaggio e ti contatteremo al più presto!',0,NULL,1,'contactus',0,'/',5,'','feedback','Contattaci - Progetto DEV2','',''),(4,'Registrazione','',0,NULL,0,'register',0,'/',5,NULL,'registrazione','Registrazione','',''),(5,'Il recupero della password','Clicca \"recupera password\" e ti invieremo una e-mail al tuo account di posta elettronica che collegherà alla pagina di recupero password',0,NULL,1,'auth_forgot_password',0,'/',5,NULL,'il-recupero-della-password','Il recupero della password','',''),(6,'Il recupero della password. Email inviata.','E-mail è stata inviata al tuo indirizzo di posta elettronica',0,NULL,1,'auth_forgot_password_thanks',1,'/',5,'','il-recupero-della-password-email-inviata','Il recupero della password. Email inviata.','',''),(7,'Il recupero della password. SMS inviati','',0,NULL,1,'auth_forgot_sms',0,'/',5,NULL,'il-recupero-della-password-sms-inviati','Il recupero della password. SMS inviati','',''),(8,'Inventa una nuova password','',0,NULL,1,'auth_password_recovery',0,'/',5,NULL,'inventa-una-nuova-password','Inventa una nuova password','',''),(9,'Il tuo Personal Area','',0,NULL,1,'auth_signin',0,'/',5,NULL,'il-tuo-personal-area','Il tuo Personal Area','',''),(10,'La registrazione è passato','Abbiamo contattato ulteriori istruzioni per la registrazione al vostro indirizzo e-mail',0,NULL,1,'auth_registration_complete',1,'/',5,NULL,'la-registrazione-e-passato','La registrazione è passato','',''),(11,'L\'attivazione è passato','Ora è possibile effettuare il login!',0,NULL,1,'auth_activation_successful',1,'/profile',3,'','l-attivazione-e-passato','L\'attivazione è passato','',''),(12,'Accordo per gli utenti','Ecco un dell\'accordo di utilizzazione assolutamente tipico',0,NULL,1,'user_agreement',0,'/',5,'','accordo-per-gli-utenti','Accordo per gli utenti','',''),(13,'Politica sulla riservatezza','Questa è una pagina assolutamente tipica privacy policy',0,NULL,1,'privacy_policy',0,'/',5,'','politica-sulla-riservatezza','Politica sulla riservatezza','',''),(14,'Il forum è chiuso','Se vi imbattete in questa pagina, significa che siete un utente autorizzato!',0,NULL,1,NULL,0,'/',5,NULL,'il-forum-e-chiuso','Il forum è chiuso','',''),(15,'Questa è una pagina di prova','',0,NULL,1,NULL,0,'/',5,'','questa-e-una-pagina-di-prova','Questa è una pagina di prova','',''),(16,'Errore 404','Errore 404 Pagina non trovata',0,NULL,1,'error404',0,'/',5,NULL,'errore-404','Errore 404','',''),(17,'Il mio profilo','Qui è possibile modificare le informazioni personali, caricare una foto e cambiare la password',0,NULL,0,'profile',0,'/',5,NULL,'il-mio-profilo','Il mio profilo','',''),(18,'Il mio profilo - Modifica password','Le password vengono memorizzate in forma criptata.',0,NULL,0,'profile_password',0,'/',5,NULL,'il-mio-profilo-modifica-password','Il mio profilo - Modifica password','',''),(19,'Il mio profilo - Modifica foto','',0,NULL,0,'profile_avatar',0,'/',5,NULL,'il-mio-profilo-modifica-foto','Il mio profilo - Modifica foto','',''),(20,'Indirizzo IP è bloccato','Purtroppo, per motivi non chiari, il tuo indirizzo è stato bloccato! Grazie!',0,NULL,1,'ip_banned',0,'/',5,'empty','indirizzo-ip-e-bloccato','Indirizzo IP è bloccato','',''),(21,'Registrati o fai il login','Per visualizzare il contenuto di questa sezione, fai il login',0,NULL,1,'auth_secure',0,'/',5,NULL,'registrati-o-fai-il-login','Registrati o fai il login','',''),(22,'Confirmation of account in socConfirm your social networks accountial networks','Attenzione! Email {%email%} esiste già nel sistema! Se questa è la tua e-mail, confermarlo!',0,NULL,1,'oauth_bridge',0,'/',5,NULL,'confirmation-of-account-in-socconfirm-your-social-networks-accountial-networks','Conferma il tuo account social network','',''),(23,'Conferma il tuo account di social network. fase due','Lettera di conferma è stata inviata al tuo indirizzo email {%email%}',0,NULL,1,'oauth_bridge_confirm',0,'/',5,NULL,'conferma-il-tuo-account-di-social-network-fase-due','Conferma il tuo account social network','',''),(24,'OAuth errore di autorizzazione','',0,NULL,1,'oauth_error',0,'/',5,NULL,'oauth-errore-di-autorizzazione','OAuth errore di autorizzazione','','');
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
INSERT INTO `text_block` (`id`, `name`, `title`, `text`, `application`, `module`) VALUES (1,'Username',NULL,'Nome utente','cms',NULL),(2,'Password',NULL,'Password','cms',NULL),(3,'Remember?',NULL,'Ricordati di me?','cms',NULL),(4,'Login',NULL,'Accesso','cms',NULL),(5,'Welcome to',NULL,'Benvenuto','cms',NULL),(6,'Use a valid username and password to gain access to the administration console.',NULL,'Utilizzare un nome utente e una password validi per accedere alla console di amministrazione.','cms',NULL),(7,'Вход',NULL,'Accesso','frontend',NULL),(8,'Ваша компания',NULL,'Vostra Azienda','frontend',NULL),(9,'Разработка и поддержка',NULL,'Sviluppo e sostegno','frontend',NULL),(11,'Blog',NULL,'Blog','cms',NULL),(12,'Posts',NULL,'Messaggi','cms',NULL),(13,'Comments',NULL,'Commenti','cms',NULL),(14,'Tags',NULL,'Tag','cms',NULL),(15,'Users',NULL,'Utenti','cms',NULL),(16,'Settings',NULL,'Impostazioni','cms',NULL),(18,'Email шаблоны',NULL,'Modelli di e-mail','cms',NULL),(21,'Сообщения',NULL,'Messaggi','cms',NULL),(28,'Локализация',NULL,'Localizzazione','cms',NULL),(33,'Добавить',NULL,'Aggiungere','cms',NULL),(34,'Go to Frontend',NULL,'Vai al sito','cms',NULL),(35,'Logout',NULL,'Uscita','cms',NULL),(36,'dashboard',NULL,'Cruscotto','cms',NULL),(37,'Профиль',NULL,'Profilo','frontend',NULL),(38,'Выход',NULL,'Uscita','frontend',NULL),(39,'Админка',NULL,'Admin','frontend',NULL),(40,'Page List',NULL,'Elenco delle pagine','cms',NULL),(41,'Name',NULL,'Titolo','cms',NULL),(42,'Slug',NULL,'URL','cms',NULL),(43,'Actions',NULL,'Azioni','cms',NULL),(44,'First page',NULL,'Prima pagina','cms',NULL),(45,'Previous page',NULL,'Pagina Precedente','cms',NULL),(46,'Next page',NULL,'Pagina successiva','cms',NULL),(47,'Last page',NULL,'Ultima pagina','cms',NULL),(48,'[0] no result|[1] 1 result|(1,+Inf] %1% results',NULL,'[0] Nessun risultato|[1] 1 risultato|(1,+Inf] %1% risultati','cms',NULL),(49,'(page %%page%%/%%nb_pages%%)',NULL,'(pagina%%page%%/%%nb_pages%%)','cms',NULL),(50,'Edit',NULL,'Modifica','cms',NULL),(51,'Delete',NULL,'Cancellare','cms',NULL),(52,'Are you sure?',NULL,'Sei sicuro?','cms',NULL),(53,'Choose an action',NULL,'Scegliere un\'azione','cms',NULL),(54,'go',NULL,'Go!','cms',NULL),(55,'New',NULL,'Nuovo','cms',NULL),(56,'Blog Posts',NULL,'Post sul blog','cms',NULL),(57,'Reset',NULL,'Reset','cms',NULL),(58,'Filter',NULL,'Filtro','cms',NULL),(59,'No result',NULL,'Nessun risultato','cms',NULL),(60,'New Page',NULL,'Nuova pagina','cms',NULL),(61,'Content',NULL,'Contenuto','cms',NULL),(62,'Включить редирект',NULL,'Attiva reindirizzamento','cms',NULL),(63,'Redirect route',NULL,'Redirect a','cms',NULL),(64,'Redirect timeout',NULL,'Reindirizzamento timeout','cms',NULL),(65,'Layout',NULL,'Disposizione','cms',NULL),(66,'Meta title',NULL,'Titolo Meta','cms',NULL),(67,'Meta description',NULL,'Descrizione Meta','cms',NULL),(68,'Meta keywords',NULL,'Parole chiave Meta','cms',NULL),(69,'Back to list',NULL,'Torna alla lista','cms',NULL),(70,'Save',NULL,'Salva','cms',NULL),(71,'Save and add',NULL,'Salva e aggiungere','cms',NULL),(72,'УРЛ-метка',NULL,'Tag URL','cms',NULL),(73,'Edit Page',NULL,'Modifica questa pagina','cms',NULL),(74,'User list',NULL,'Lista utenti','cms',NULL),(75,'Created at',NULL,'Creato nel','cms',NULL),(76,'Updated at',NULL,'Aggiornati alle','cms',NULL),(77,'Last login',NULL,'Ultimo accesso','cms',NULL),(78,'user',NULL,'Utente','cms',NULL),(79,'New User',NULL,'Nuovo utente','cms',NULL),(80,'User',NULL,'Utente','cms',NULL),(81,'First name',NULL,'Nome','cms',NULL),(82,'Last name',NULL,'Cognome','cms',NULL),(83,'Email address',NULL,'Indirizzo e-mail','cms',NULL),(84,'Password (again)',NULL,'Password (di nuovo)','cms',NULL),(85,'Permissions',NULL,'Permessi','cms',NULL),(86,'Is active',NULL,'E \'attivo','cms',NULL),(87,'Is super admin',NULL,'È super amministratore','cms',NULL),(88,'Editing User \"%%username%%\"',NULL,'Modifica \"%%username%%\"','cms',NULL),(89,'dictionary',NULL,'Dizionario','cms',NULL),(90,'Title',NULL,'Titolo','cms',NULL),(91,'Value',NULL,'Valore','cms',NULL),(92,'settings',NULL,'Impostazioni','cms',NULL),(93,'Email template List',NULL,'Elenco dei modelli di e-mail','cms',NULL),(94,'Id',NULL,'ID','cms',NULL),(95,'Subject',NULL,'Argomento','cms',NULL),(96,'Message',NULL,'Messaggio','cms',NULL),(98,'Edit Email template',NULL,'Modifica Modello Email','cms',NULL),(99,'New Email template',NULL,'Nuovo modello E-mail','cms',NULL),(100,'Ваше имя',NULL,'Il tuo nome','frontend',NULL),(101,'Ваш Email',NULL,'Il tuo indirizzo e-mail','frontend',NULL),(102,'Нужен для обратной связи',NULL,'Necessità di un feedback','frontend',NULL),(103,'Ваше сообщение',NULL,'Il tuo messaggio','frontend',NULL),(104,'Reload image',NULL,'Cambia immagine','frontend',NULL),(105,'Введите код с картинки',NULL,'Inserisci il codice dall\'immagine','frontend',NULL),(106,'Показатели',NULL,'Indicatori','cms',NULL),(107,'Имя',NULL,'Nome','cms',NULL),(108,'Email',NULL,'E-mail','cms',NULL),(109,'desc',NULL,'Discendente','cms',NULL),(110,'Просмотр',NULL,'Vista','cms',NULL),(111,'Создать пользователя',NULL,'Crea utente','cms',NULL),(112,'Export',NULL,'Esportazione','cms',NULL),(113,'The item was updated successfully.',NULL,'Questo elemento è stato aggiornato con successo.','cms',NULL),(114,'Неверный формат',NULL,'Formato non valido','frontend',NULL),(115,'System settings',NULL,'Impostazioni di sistema','cms',NULL),(116,'Section',NULL,'Sezione','cms',NULL),(118,'Email error List',NULL,'Lista error Email','cms',NULL),(119,'Email from',NULL,'Da chi','cms',NULL),(120,'Email to',NULL,'A cui','cms',NULL),(121,'Body',NULL,'Corpo','cms',NULL),(122,'Cc',NULL,'Copia','cms',NULL),(123,'File',NULL,'File','cms',NULL),(132,'Filters',NULL,'Filtro','cms',NULL),(133,'is empty',NULL,'Vuoto','cms',NULL),(134,'Мой профиль',NULL,'Il mio profilo','frontend',NULL),(135,'Фотография',NULL,'Foto','frontend',NULL),(136,'Изменить пароль',NULL,'Cambiare la password','frontend',NULL),(137,'Отчество',NULL,'Patronimico','frontend',NULL),(138,'Фамилия',NULL,'Cognome','frontend',NULL),(139,'Дата рождения\n(дд.мм.гггг)',NULL,'DOB','frontend',NULL),(140,'Телефон мобильный\n(для получения уведомлений)',NULL,'Telefono cellulare (per la notifica)','frontend',NULL),(141,'Сохранить изменения',NULL,'Salva le modifiche','frontend',NULL),(142,'Старый пароль',NULL,'Vecchia password','frontend',NULL),(143,'Новый пароль',NULL,'Nuova password','frontend',NULL),(144,'Новый пароль еще раз',NULL,'Di nuovo Nuova password','frontend',NULL),(145,'Сохранить пароль',NULL,'Ricordare la password','frontend',NULL),(146,'Заполните поле',NULL,'Compila il campo','frontend',NULL),(147,'Passwords do not match',NULL,'Le password non corrispondono','frontend',NULL),(148,'Выберите картинку из загрузите ее',NULL,'Selezionare un\'immagine e caricarla','frontend',NULL),(149,'Image',NULL,'Immagine','frontend',NULL),(150,'Загрузить фотографию',NULL,'Carica una foto','frontend',NULL),(151,'File is too large (maximum is %max_size% bytes).',NULL,'Il file è troppo grande (al massimo%max_size%).','frontend',NULL),(152,'Вы можете выбрать зону, которая будет отображаться на ваших аватарках. Кликните по одному из изображений справа',NULL,'È possibile selezionare l\'area da visualizzare sulle immagini. Clicca su una delle piccole immagini a destra','frontend',NULL),(153,'remove the current file',NULL,'Eliminare il file corrente','frontend',NULL),(154,'Сохранить',NULL,'Salva','frontend',NULL),(155,'Вы уверены?',NULL,'Sei sicuro?','frontend',NULL),(156,'Удалить фотографию',NULL,'Elimina immagine','frontend',NULL),(157,'Логин (Ваш Email)',NULL,'Nome utente (il tuo e-mail)','frontend',NULL),(158,'Запомнить меня на этом компьютере',NULL,'Ricordami su questo computer','frontend',NULL),(159,'Войти',NULL,'Accesso','frontend',NULL),(160,'Забыли пароль?',NULL,'Hai dimenticato la password?','frontend',NULL),(161,'Registration',NULL,'Registrazione','frontend',NULL),(162,'The username and/or password is invalid.',NULL,'Email o password errata','frontend',NULL),(163,'Введите код',NULL,'Inserisci il codice','frontend',NULL),(164,'Письмо отправлено',NULL,'Email inviata','frontend',NULL),(165,'Ваш email',NULL,'La tua e-mail','frontend',NULL),(166,'Восстановить пароль',NULL,'Recupera la tua password','frontend',NULL),(167,'Повторите пароль',NULL,'Conferma password','frontend',NULL),(168,'Я принимаю условия',NULL,'Accetto le condizioni','frontend',NULL),(169,'Такой email уже зарегистрирован в ситеме',NULL,'Questa email è già registrato nel sistema','frontend',NULL),(170,'Пароли не совпадают',NULL,'Le password non corrispondono','frontend',NULL),(171,'Вы должны принять условия пользовательского соглашения',NULL,'Devi accettare i Termini di servizio','frontend',NULL),(172,'Пароль должен быть не короче 4 символов',NULL,'La password deve essere lunga almeno 4 caratteri','frontend',NULL),(173,'Еще раз пароль',NULL,'Conferma la tua password','frontend',NULL),(174,'Сменить пароль',NULL,'Cambiare la password','frontend',NULL),(175,'Пароль слишком короткий',NULL,'La password è troppo corta','frontend',NULL),(176,'Пароль восстановлен',NULL,'Password recuperato','frontend',NULL),(177,'Password is invalid.',NULL,'Password non valida','frontend',NULL),(178,'События за сегодня',NULL,'Eventi di oggi','cms',NULL),(179,'Всего событий',NULL,'Totale Eventi','cms',NULL),(180,'All rights reserved',NULL,'Tutti i diritti riservati','cms',NULL),(181,'Date',NULL,'Data','cms',NULL),(182,'Is published',NULL,'Pubblicato','cms',NULL),(183,'yes or no',NULL,'Sì o no','cms',NULL),(184,'yes',NULL,'Sì','cms',NULL),(185,'no',NULL,'No','cms',NULL),(186,'From',NULL,'Da','cms',NULL),(187,'To',NULL,'A','cms',NULL),(188,'New Blog post',NULL,'Nuovo post sul blog','cms',NULL),(189,'Brief',NULL,'Brevemente','cms',NULL),(190,'Text',NULL,'Testo','cms',NULL),(191,'Url',NULL,'URL','cms',NULL),(193,'пользовательского соглашения',NULL,'Accordo per gli utenti','frontend',NULL),(194,'The item was created successfully.',NULL,'Questo elemento è stato creato con successo.','cms',NULL),(195,'You don\'t have proper credentials to access this page',NULL,'Non si dispone delle credenziali appropriate per accedere a questa pagina','cms',NULL),(197,'Secure',NULL,'Il forum è chiuso','cms',NULL),(210,'Server is not responding',NULL,'Il server non risponde','cms',NULL),(211,'Data saved',NULL,'Dati salvati','cms',NULL),(212,'Error while saving data',NULL,'Errore durante il salvataggio dei dati','cms',NULL),(217,'Unexpected extra form field named \"%field%\".',NULL,'Inaspettato campo modulo aggiuntivo denominato \"campo%%\".','cms',NULL),(221,'Вы можете править текст прямо в списке. Исправьте все, что считаете нужным, а затем нажмите TAB или щелкните мышью в любом месте вне поля ввода.',NULL,'È possibile modificare il testo direttamente nella lista. Correggere tutte le risposte pertinenti, e quindi premere TAB o fare clic su un punto qualsiasi all\'esterno del campo di immissione.','cms',NULL),(222,'Воспользуйтесь фильтром, чтобы найти нужный вам текст',NULL,'Si prega di utilizzare il filtro per trovare il testo desiderato','cms',NULL),(223,'Отправить',NULL,'Inviare','frontend',NULL),(224,'The item has not been saved due to some errors.',NULL,'L\'oggetto non è stato salvato a causa di alcuni errori','cms',NULL),(225,'An object with the same \"%column%\" already exist.',NULL,'L\'oggetto con il valore del campo \"%colonna%\" esiste già nel sistema.','cms',NULL),(226,'Update',NULL,'Aggiornare','cms',NULL),(235,'Страницы',NULL,'Pagina','cms',NULL),(236,'Пользователи',NULL,'Utenti','cms',NULL),(237,'Настройки',NULL,'Impostazioni','cms',NULL),(238,'Редирект 301',NULL,'301s','cms',NULL),(239,'Уведомления',NULL,'Avviso','cms',NULL),(241,'Url from',NULL,'Da cui','cms',NULL),(242,'Url to',NULL,'Dove','cms',NULL),(243,'Comment',NULL,'Descrizione','cms',NULL),(245,'from %from_date%<br />to %to_date%',NULL,'Da%from_date% a %to_date%','cms',NULL),(246,'Checked',NULL,'Noto','cms',NULL),(248,'You must at least select one item.',NULL,'È necessario selezionare almeno un oggetto','cms',NULL),(249,'blog_post',NULL,'Post sul blog','cms',NULL),(250,'Extra',NULL,'Inoltre','cms',NULL),(251,'Edit Blog post',NULL,'Modificare un post sul blog','cms',NULL),(252,'The begin date must be before the end date.',NULL,'Data di inizio deve essere inferiore alla data di fine','cms',NULL),(257,'%%title%%',NULL,'%%title%%','cms',NULL),(258,'Email администратора',NULL,'Amministratore della posta elettronica','cms',NULL),(259,'На этот адрес вам будут приходить сообщения с сайта',NULL,'A questo indirizzo potrete ricevere messaggi dal sito','cms',NULL),(260,'Имя отправителя почты',NULL,'Email nome del mittente','cms',NULL),(261,'От этого имени сайт будет отправлять почту',NULL,'Tutti i email saranno inviate per conto di tale nome','cms',NULL),(263,'Адрес',NULL,'Indirizzo','cms',NULL),(264,'Контактный телефон',NULL,'Telefono di contatto','cms',NULL),(265,'Контактный email',NULL,'Contatto e-mail','cms',NULL),(266,'Type',NULL,'Tipo','cms',NULL),(267,'Description',NULL,'Descrizione','cms',NULL),(268,'Admin email',NULL,'E-mail all\'amministratore','cms',NULL),(269,'User email',NULL,'E-mail per l\'utente','cms',NULL),(270,'Phone number',NULL,'Numero di telefono','cms',NULL),(271,'Company name',NULL,'Nome della ditta','cms',NULL),(272,'Attach',NULL,'File allegato','cms',NULL),(275,'Show',NULL,'Spettacolo','cms',NULL),(279,'Password recovery',NULL,'Il recupero della password','cms',NULL),(281,'Registration',NULL,'Registrazione','cms',NULL),(283,'Page',NULL,'Pagina','cms',NULL),(284,'Описание',NULL,'Descrizione','cms',NULL),(285,'redirect301',NULL,'301s','cms',NULL),(287,'email_template',NULL,'Modelli di e-mail','cms',NULL),(288,'Имя',NULL,'Nome','frontend',NULL),(289,'Email',NULL,'Email','frontend',NULL),(290,'Invalid mime type (%mime_type%).',NULL,'Formato di file non corretto (%mime_type%).','frontend',NULL),(291,'Password',NULL,'Password','frontend',NULL),(292,'Регистрация',NULL,'Registrazione','frontend',NULL),(293,'ссылке',NULL,'Collegamento','frontend',NULL),(295,'Notifications',NULL,'Notifiche','cms',NULL),(296,'Pages',NULL,'Pagine','cms',NULL),(297,'Apply',NULL,'Applicare','frontend',NULL),(298,'Discard',NULL,'Annullare','frontend',NULL),(299,'Данные сохранены',NULL,'Modifiche salvate!','frontend',NULL),(301,'Изображение удалено',NULL,'Immagine rimossa','frontend',NULL),(303,'Код введен неверно',NULL,'Il codice inserito non è valido','frontend',NULL),(304,'Такой email не зарегистрирован в системе',NULL,'Questa email non è registrata nel sistema','frontend',NULL),(305,' csrf token',NULL,'Token CSRF','frontend',NULL),(306,'The item was deleted successfully.',NULL,'L\'elemento è stato eliminato con successo.','cms',NULL),(307,'You must select an action to execute on the selected items.',NULL,'È necessario selezionare l\'azione da eseguire sugli oggetti selezionati.','cms',NULL),(308,'The selected items have been deleted successfully.',NULL,'Gli elementi selezionati sono stati cancellati con successo.','cms',NULL),(310,'Cообщения с сайта',NULL,'Messaggi dal sito','cms',NULL),(311,'Да, это мой email-аккаунт!',NULL,'Sì, questo è il mio account di posta elettronica!','frontend',NULL),(312,'Подтвердить email аккаунт!',NULL,'Conferma account di posta elettronica!','frontend',NULL),(313,'Подтверждаю!',NULL,'D\'accordo!','frontend',NULL),(314,'Войти с помощью:',NULL,'Login con:','frontend',NULL);
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
INSERT INTO `menu_item` (`id`, `name`, `root_name`, `type`, `page_id`, `cms_module_id`, `route`, `external`, `is_empty`, `is_auth`, `icon_class`, `root_id`, `lft`, `rgt`, `level`) VALUES (1,'Menu principale','main','empty',NULL,NULL,NULL,NULL,1,0,NULL,1,1,52,0),(2,'Casa','','route',1,NULL,'homepage','',1,0,NULL,1,1,1,1),(3,'Chi siamo',NULL,'page',2,NULL,NULL,NULL,1,0,NULL,1,44,45,1),(4,'Contatti',NULL,'module',3,2,'','',1,0,NULL,1,46,47,1),(5,'Il forum è chiuso',NULL,'page',14,NULL,'','',1,1,'',1,50,51,1),(6,'Menù di fondo pagina','bottom','empty',NULL,NULL,NULL,NULL,1,0,NULL,6,6,NULL,0),(7,'Politica sulla riservatezza',NULL,'page',13,NULL,'','',1,0,'',6,6,5,1),(8,'Accordo per gli utenti',NULL,'page',12,NULL,'','',1,0,'',6,6,5,1);
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
INSERT INTO `email_template` (`id`, `name`, `subject`, `message`) VALUES (1,'registration_user','Registrati sul progetto DEV2','Ciao, {%first_name%}! Lei si è iscritto con successo! Seguire questo collegamento {%%}, per attivare il tuo account!'),(2,'registration_admin','Registra un nuovo utente','User {%full_name%} registrato con noi!'),(3,'password_recovery_user','Il recupero della password','Buon giorno, {%full_name%} che hai richiesto il recupero della password sul progetto DEV2. Seguire questa {%LINK%} per impostare una nuova password. Se non è stato richiesto il recupero della password, si prega di ignorare questa lettera.'),(4,'contactus_message_user','Progetto DEV2. Il tuo messaggio è importante per noi!','Gentile {%nome%}! Grazie per il tuo messaggio! E \'molto importante per noi!'),(5,'contactus_message_admin','Progetto DEV2. nuovo messaggio','Qualcuno {nome}%%ha inviato un messaggio. Testo: {%messaggio%} E-Mail: {%email%}'),(6,'social_bridge_user_confirm_email_user','Demo.web375.org - Conferma il tuo indirizzo di posta elettronica nella rete sociale {%network_name%}','Conferma Email {%email%}, segui il link {%collegamento%} o utilizzare questo codice {%token%}');
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

-- Dump completed on 2014-11-05 20:22:49

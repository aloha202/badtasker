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
INSERT INTO `page` (`id`, `name`, `content`, `is_module_page`, `module_name`, `is_content_editable`, `special_mark`, `is_redirect`, `redirect_route`, `redirect_timeout`, `layout`, `slug`, `meta_title`, `meta_description`, `meta_keywords`) VALUES (1,'Bienvenue!','Salutations à vous, jeune ami! Vous êtes venu sur ce site parce que vous vous avez besoin d\'un site web. Ou peut-être vous ne venez ici que par accident! En tout cas, bienvenue!',1,'default',1,'default',0,'/',5,'','bienvenue','Bienvenue sur le site de la DEV2 de projet!','',''),(2,'À propos de nous','Nous sommes une entreprise jeune mais déjà très expérimenté engagé dans le développement et la promotion de sites Web',0,NULL,1,NULL,0,'/',5,'','a-propos-de-nous','Sur le projet','',''),(3,'Réaction','Envoyez-nous un message et nous vous contacterons dès que possible!',0,NULL,1,'contactus',0,'/',5,'','reaction','Contactez-nous - Projet DEV2','',''),(4,'Inscription','',0,NULL,0,'register',0,'/',5,NULL,'inscription','Inscription','',''),(5,'Récupération de mot de passe','Cliquez sur \"Récupérer mot de passe\" et nous vous enverrons un e-mail à votre compte de messagerie qui reliera à la page de récupération de mot de passe',0,NULL,1,'auth_forgot_password',0,'/',5,NULL,'recuperation-de-mot-de-passe','Récupération de mot de passe','',''),(6,'Récupération de mot de passe. E-mail envoyé.','Le courriel a été envoyé à votre compte de messagerie',0,NULL,1,'auth_forgot_password_thanks',1,'/',5,'','recuperation-de-mot-de-passe-e-mail-envoye','Récupération de mot de passe. E-mail envoyé.','',''),(7,'Récupération de mot de passe. SMS envoyé','',0,NULL,1,'auth_forgot_sms',0,'/',5,NULL,'recuperation-de-mot-de-passe-sms-envoye','Récupération de mot de passe. SMS envoyé','',''),(8,'Inventer un nouveau mot de passe','',0,NULL,1,'auth_password_recovery',0,'/',5,NULL,'inventer-un-nouveau-mot-de-passe','Inventer un nouveau mot de passe','',''),(9,'Votre espace personnel','',0,NULL,1,'auth_signin',0,'/',5,NULL,'votre-espace-personnel','Votre espace personnel','',''),(10,'L\'inscription est passée','Nous avons envoyé de nouvelles instructions d\'inscription à votre adresse e-mail',0,NULL,1,'auth_registration_complete',1,'/',5,NULL,'l-inscription-est-passee','L\'inscription est passée','',''),(11,'L\'activation est passé','Maintenant, vous pouvez vous connecter!',0,NULL,1,'auth_activation_successful',1,'/profile',3,'','l-activation-est-passe','L\'activation est passé','',''),(12,'Accord de l\'utilisateur','Voici un accord tout à fait typique de l\'utilisateur',0,NULL,1,'user_agreement',0,'/',5,'','accord-de-l-utilisateur','Accord de l\'utilisateur','',''),(13,'Politique de confidentialité','Voici une page tout à fait typique de la politique de confidentialité',0,NULL,1,'privacy_policy',0,'/',5,'','politique-de-confidentialite','Politique de confidentialité','',''),(14,'Un forum fermé','Si vous tombez sur cette page, cela signifie que vous êtes un utilisateur autorisé!',0,NULL,1,NULL,0,'/',5,NULL,'un-forum-ferme','Un forum fermé','',''),(15,'Ceci est une page de test','',0,NULL,1,NULL,0,'/',5,'','ceci-est-une-page-de-test','Ceci est une page de test','',''),(16,'Erreur 404','Erreur 404. Page non trouvée',0,NULL,1,'error404',0,'/',5,NULL,'erreur-404','Erreur 404','',''),(17,'Mon profil','Ici, vous pouvez modifier vos informations personnelles, télécharger une photo et de changer le mot de passe',0,NULL,0,'profile',0,'/',5,NULL,'mon-profil','Mon profil','',''),(18,'Mon profil - Modifier le mot','Nous conservons votre mot de passe sous forme cryptée.',0,NULL,0,'profile_password',0,'/',5,NULL,'mon-profil-modifier-le-mot','Mon profil - Modifier le mot','',''),(19,'Mon profil - Modifier photo','',0,NULL,0,'profile_avatar',0,'/',5,NULL,'mon-profil-modifier-photo','Mon profil - Modifier photo','',''),(20,'Adresse IP est bloquée','Malheureusement, pour des raisons obscures, votre adresse a été bloqué! Merci!',0,NULL,1,'ip_banned',0,'/',5,'empty','adresse-ip-est-bloquee','Adresse IP est bloquée','',''),(21,'Se il vous plaît inscrivez-vous ou connectez-vous','Pour voir le contenu de cette section, se il vous plaît connectez-vous',0,NULL,1,'auth_secure',0,'/',5,NULL,'se-il-vous-plait-inscrivez-vous-ou-connectez-vous','Se il vous plaît inscrivez-vous ou connectez-vous','',''),(22,'Confirmation of account in socConfirm your social networks accountial networks','Attention! Email {%email%} existe déjà dans le système! Si ceci est votre e-mail, confirmez-le!',0,NULL,1,'oauth_bridge',0,'/',5,NULL,'confirmation-of-account-in-socconfirm-your-social-networks-accountial-networks','Confirmez votre compte réseaux sociaux','',''),(23,'Confirmez votre compte réseaux sociaux. la deuxième étape','Lettre de confirmation a été envoyé à votre adresse e-mail {%email%}',0,NULL,1,'oauth_bridge_confirm',0,'/',5,NULL,'confirmez-votre-compte-reseaux-sociaux-la-deuxieme-etape','Confirmez votre compte réseaux sociaux','',''),(24,'OAuth erreur d\'autorisation','',0,NULL,1,'oauth_error',0,'/',5,NULL,'oauth-erreur-d-autorisation','OAuth erreur d\'autorisation','','');
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
INSERT INTO `text_block` (`id`, `name`, `title`, `text`, `application`, `module`) VALUES (1,'Username',NULL,'Nom d\'utilisateur','cms',NULL),(2,'Password',NULL,'Mot de passe','cms',NULL),(3,'Remember?',NULL,'Souviens-toi de moi?','cms',NULL),(4,'Login',NULL,'Login','cms',NULL),(5,'Welcome to',NULL,'Accueil','cms',NULL),(6,'Use a valid username and password to gain access to the administration console.',NULL,'Utilisez un nom d\'utilisateur et mot de passe pour accéder à la console d\'administration.','cms',NULL),(7,'Вход',NULL,'Login','frontend',NULL),(8,'Ваша компания',NULL,'Votre Société','frontend',NULL),(9,'Разработка и поддержка',NULL,'Développement et support','frontend',NULL),(11,'Blog',NULL,'Blog','cms',NULL),(12,'Posts',NULL,'Messages','cms',NULL),(13,'Comments',NULL,'Commentaires','cms',NULL),(14,'Tags',NULL,'Mots clés','cms',NULL),(15,'Users',NULL,'Utilisateurs','cms',NULL),(16,'Settings',NULL,'Paramètres','cms',NULL),(18,'Email шаблоны',NULL,'Modèles de courriel','cms',NULL),(21,'Сообщения',NULL,'Messages','cms',NULL),(28,'Локализация',NULL,'Localisation','cms',NULL),(33,'Добавить',NULL,'Ajouter','cms',NULL),(34,'Go to Frontend',NULL,'Accéder au site','cms',NULL),(35,'Logout',NULL,'Sortie','cms',NULL),(36,'dashboard',NULL,'Tableau de bord','cms',NULL),(37,'Профиль',NULL,'Profil','frontend',NULL),(38,'Выход',NULL,'Sortie','frontend',NULL),(39,'Админка',NULL,'Admin','frontend',NULL),(40,'Page List',NULL,'Liste des pages','cms',NULL),(41,'Name',NULL,'Titre','cms',NULL),(42,'Slug',NULL,'URL','cms',NULL),(43,'Actions',NULL,'Actes','cms',NULL),(44,'First page',NULL,'Première page','cms',NULL),(45,'Previous page',NULL,'Page Précédente','cms',NULL),(46,'Next page',NULL,'Page suivante','cms',NULL),(47,'Last page',NULL,'Dernière page','cms',NULL),(48,'[0] no result|[1] 1 result|(1,+Inf] %1% results',NULL,'[0] Aucun résultat|[1] 1 résultat |(1,+Inf] %1% des résultats','cms',NULL),(49,'(page %%page%%/%%nb_pages%%)',NULL,'(page%%page%%/%%nb_pages%%)','cms',NULL),(50,'Edit',NULL,'Éditer','cms',NULL),(51,'Delete',NULL,'Effacer','cms',NULL),(52,'Are you sure?',NULL,'Êtes-vous sûr?','cms',NULL),(53,'Choose an action',NULL,'Choisissez une action','cms',NULL),(54,'go',NULL,'Allez!','cms',NULL),(55,'New',NULL,'Nouveau','cms',NULL),(56,'Blog Posts',NULL,'Messages blog','cms',NULL),(57,'Reset',NULL,'Remettre','cms',NULL),(58,'Filter',NULL,'Filtre','cms',NULL),(59,'No result',NULL,'Aucun résultat','cms',NULL),(60,'New Page',NULL,'Nouvelle page','cms',NULL),(61,'Content',NULL,'Contenu','cms',NULL),(62,'Включить редирект',NULL,'Activez la redirection','cms',NULL),(63,'Redirect route',NULL,'Redirection vers','cms',NULL),(64,'Redirect timeout',NULL,'Redirection délai','cms',NULL),(65,'Layout',NULL,'Disposition','cms',NULL),(66,'Meta title',NULL,'Titre Meta','cms',NULL),(67,'Meta description',NULL,'Meta description','cms',NULL),(68,'Meta keywords',NULL,'Meta keywords','cms',NULL),(69,'Back to list',NULL,'Retour à la liste','cms',NULL),(70,'Save',NULL,'Enregistrer','cms',NULL),(71,'Save and add',NULL,'Enregistrer et ajouter','cms',NULL),(72,'УРЛ-метка',NULL,'URL de tag','cms',NULL),(73,'Edit Page',NULL,'Modifier cette page','cms',NULL),(74,'User list',NULL,'Liste des membres','cms',NULL),(75,'Created at',NULL,'Créée en','cms',NULL),(76,'Updated at',NULL,'Mise à jour à','cms',NULL),(77,'Last login',NULL,'Dernière connexion','cms',NULL),(78,'user',NULL,'Utilisateur','cms',NULL),(79,'New User',NULL,'Nouvel utilisateur','cms',NULL),(80,'User',NULL,'Utilisateur','cms',NULL),(81,'First name',NULL,'Prénom','cms',NULL),(82,'Last name',NULL,'Nom de famille','cms',NULL),(83,'Email address',NULL,'E-mail adresse','cms',NULL),(84,'Password (again)',NULL,'Mot de passe (encore)','cms',NULL),(85,'Permissions',NULL,'Permission','cms',NULL),(86,'Is active',NULL,'Est actif','cms',NULL),(87,'Is super admin',NULL,'Est super administrateur','cms',NULL),(88,'Editing User \"%%username%%\"',NULL,'Modifier \"%%username%%\"','cms',NULL),(89,'dictionary',NULL,'Dictionnaire','cms',NULL),(90,'Title',NULL,'Titre','cms',NULL),(91,'Value',NULL,'Valeur','cms',NULL),(92,'settings',NULL,'Paramètres','cms',NULL),(93,'Email template List',NULL,'Liste des Modèles Email','cms',NULL),(94,'Id',NULL,'Carte d\'identité','cms',NULL),(95,'Subject',NULL,'Sujet','cms',NULL),(96,'Message',NULL,'Message','cms',NULL),(98,'Edit Email template',NULL,'Modifier Email Template','cms',NULL),(99,'New Email template',NULL,'Nouveau modèle Email','cms',NULL),(100,'Ваше имя',NULL,'Votre nom','frontend',NULL),(101,'Ваш Email',NULL,'Votre E-mail','frontend',NULL),(102,'Нужен для обратной связи',NULL,'Besoin de commentaires','frontend',NULL),(103,'Ваше сообщение',NULL,'Votre message','frontend',NULL),(104,'Reload image',NULL,'Rafraîchir l\'image','frontend',NULL),(105,'Введите код с картинки',NULL,'Entrez le code de l\'image','frontend',NULL),(106,'Показатели',NULL,'Indicateurs','cms',NULL),(107,'Имя',NULL,'Nom','cms',NULL),(108,'Email',NULL,'E-mail','cms',NULL),(109,'desc',NULL,'Descendant','cms',NULL),(110,'Просмотр',NULL,'Vue','cms',NULL),(111,'Создать пользователя',NULL,'Créer un utilisateur','cms',NULL),(112,'Export',NULL,'Exportation','cms',NULL),(113,'The item was updated successfully.',NULL,'Cet article a été mis à jour.','cms',NULL),(114,'Неверный формат',NULL,'Format invalide','frontend',NULL),(115,'System settings',NULL,'Paramètres système','cms',NULL),(116,'Section',NULL,'Section','cms',NULL),(118,'Email error List',NULL,'Email liste d\'erreur','cms',NULL),(119,'Email from',NULL,'De qui','cms',NULL),(120,'Email to',NULL,'À qui','cms',NULL),(121,'Body',NULL,'Corps','cms',NULL),(122,'Cc',NULL,'Copie','cms',NULL),(123,'File',NULL,'Fichier','cms',NULL),(132,'Filters',NULL,'Filtre','cms',NULL),(133,'is empty',NULL,'Vide','cms',NULL),(134,'Мой профиль',NULL,'Mon profil','frontend',NULL),(135,'Фотография',NULL,'Photo','frontend',NULL),(136,'Изменить пароль',NULL,'Changer le mot de passe','frontend',NULL),(137,'Отчество',NULL,'Patronyme','frontend',NULL),(138,'Фамилия',NULL,'Nom de famille','frontend',NULL),(139,'Дата рождения\n(дд.мм.гггг)',NULL,'DOB','frontend',NULL),(140,'Телефон мобильный\n(для получения уведомлений)',NULL,'Téléphone portable (pour la notification)','frontend',NULL),(141,'Сохранить изменения',NULL,'Enregistrer les modifications','frontend',NULL),(142,'Старый пароль',NULL,'Ancien mot de passe','frontend',NULL),(143,'Новый пароль',NULL,'Nouveau mot de passe','frontend',NULL),(144,'Новый пароль еще раз',NULL,'Nouveau mot de passe','frontend',NULL),(145,'Сохранить пароль',NULL,'Mémoriser mot de passe','frontend',NULL),(146,'Заполните поле',NULL,'Remplissez le champ','frontend',NULL),(147,'Passwords do not match',NULL,'Les mots de passe ne correspondent pas','frontend',NULL),(148,'Выберите картинку из загрузите ее',NULL,'Sélectionnez une image et la télécharger','frontend',NULL),(149,'Image',NULL,'Image','frontend',NULL),(150,'Загрузить фотографию',NULL,'Ajouter une image','frontend',NULL),(151,'File is too large (maximum is %max_size% bytes).',NULL,'Le fichier est trop volumineux (maximum%max_size%).','frontend',NULL),(152,'Вы можете выбрать зону, которая будет отображаться на ваших аватарках. Кликните по одному из изображений справа',NULL,'Vous pouvez sélectionner la zone à afficher sur vos images. Cliquez sur l\'une des petites images à droite','frontend',NULL),(153,'remove the current file',NULL,'Supprimez le fichier actuel','frontend',NULL),(154,'Сохранить',NULL,'Enregistrer','frontend',NULL),(155,'Вы уверены?',NULL,'Êtes-vous sûr?','frontend',NULL),(156,'Удалить фотографию',NULL,'Supprimer l\'image','frontend',NULL),(157,'Логин (Ваш Email)',NULL,'Nom d\'utilisateur (votre adresse email)','frontend',NULL),(158,'Запомнить меня на этом компьютере',NULL,'Se souvenir de moi sur cet ordinateur','frontend',NULL),(159,'Войти',NULL,'Login','frontend',NULL),(160,'Забыли пароль?',NULL,'Mot de passe oublié?','frontend',NULL),(161,'Registration',NULL,'Inscription','frontend',NULL),(162,'The username and/or password is invalid.',NULL,'Login ou mot de passe incorrect','frontend',NULL),(163,'Введите код',NULL,'Entrez le code','frontend',NULL),(164,'Письмо отправлено',NULL,'Courriel envoyé','frontend',NULL),(165,'Ваш email',NULL,'Votre e-mail','frontend',NULL),(166,'Восстановить пароль',NULL,'Mot de passe oublié','frontend',NULL),(167,'Повторите пароль',NULL,'Confirmez le mot de passe','frontend',NULL),(168,'Я принимаю условия',NULL,'Je accepte les conditions','frontend',NULL),(169,'Такой email уже зарегистрирован в ситеме',NULL,'Cet e-mail est déjà enregistrée dans le système','frontend',NULL),(170,'Пароли не совпадают',NULL,'Les mots de passe ne correspondent pas','frontend',NULL),(171,'Вы должны принять условия пользовательского соглашения',NULL,'Vous devez accepter les Conditions d\'utilisation','frontend',NULL),(172,'Пароль должен быть не короче 4 символов',NULL,'Mot de passe doit comporter au moins 4 caractères','frontend',NULL),(173,'Еще раз пароль',NULL,'Confirmez votre mot de passe','frontend',NULL),(174,'Сменить пароль',NULL,'Changer le mot de passe','frontend',NULL),(175,'Пароль слишком короткий',NULL,'Mot de passe est trop court','frontend',NULL),(176,'Пароль восстановлен',NULL,'Mot de passe récupéré','frontend',NULL),(177,'Password is invalid.',NULL,'Mot de passe invalide','frontend',NULL),(178,'События за сегодня',NULL,'Evénements pour aujourd\'hui','cms',NULL),(179,'Всего событий',NULL,'Total des événements','cms',NULL),(180,'All rights reserved',NULL,'Tous les droits sont réservés','cms',NULL),(181,'Date',NULL,'Date','cms',NULL),(182,'Is published',NULL,'Publié','cms',NULL),(183,'yes or no',NULL,'Oui ou non','cms',NULL),(184,'yes',NULL,'Oui','cms',NULL),(185,'no',NULL,'Aucun','cms',NULL),(186,'From',NULL,'À partir de','cms',NULL),(187,'To',NULL,'À','cms',NULL),(188,'New Blog post',NULL,'New blog post','cms',NULL),(189,'Brief',NULL,'Brièvement','cms',NULL),(190,'Text',NULL,'Texte','cms',NULL),(191,'Url',NULL,'URL','cms',NULL),(193,'пользовательского соглашения',NULL,'Accord de l\'utilisateur','frontend',NULL),(194,'The item was created successfully.',NULL,'Cet article a été créé avec succès.','cms',NULL),(195,'You don\'t have proper credentials to access this page',NULL,'Vous ne devez pas les informations d\'identification nécessaires pour accéder à cette page','cms',NULL),(197,'Secure',NULL,'Un forum fermé','cms',NULL),(210,'Server is not responding',NULL,'Le serveur ne répond pas','cms',NULL),(211,'Data saved',NULL,'Les données enregistrées','cms',NULL),(212,'Error while saving data',NULL,'Erreur sauvegarde des données','cms',NULL),(217,'Unexpected extra form field named \"%field%\".',NULL,'Unexpected champ de formulaire supplémentaire nommé \"champ%%\".','cms',NULL),(221,'Вы можете править текст прямо в списке. Исправьте все, что считаете нужным, а затем нажмите TAB или щелкните мышью в любом месте вне поля ввода.',NULL,'Vous pouvez modifier le texte directement dans la liste. Corrigez toutes les cases, puis appuyez sur TAB ou cliquez n\'importe où en dehors de la zone de saisie.','cms',NULL),(222,'Воспользуйтесь фильтром, чтобы найти нужный вам текст',NULL,'Se il vous plaît utiliser le filtre pour trouver le texte de votre choix','cms',NULL),(223,'Отправить',NULL,'Envoyer','frontend',NULL),(224,'The item has not been saved due to some errors.',NULL,'L\'objet n\'a pas été enregistré en raison de certaines erreurs','cms',NULL),(225,'An object with the same \"%column%\" already exist.',NULL,'L\'objet de la valeur du champ \"colonne de%%» existe déjà dans le système.','cms',NULL),(226,'Update',NULL,'Mettre à jour','cms',NULL),(235,'Страницы',NULL,'Page','cms',NULL),(236,'Пользователи',NULL,'Utilisateurs','cms',NULL),(237,'Настройки',NULL,'Paramètres','cms',NULL),(238,'Редирект 301',NULL,'301s','cms',NULL),(239,'Уведомления',NULL,'Avis','cms',NULL),(241,'Url from',NULL,'D\'où','cms',NULL),(242,'Url to',NULL,'Où','cms',NULL),(243,'Comment',NULL,'Description','cms',NULL),(245,'from %from_date%<br />to %to_date%',NULL,'De %from_date%à %to_date%','cms',NULL),(246,'Checked',NULL,'A noté','cms',NULL),(248,'You must at least select one item.',NULL,'Vous devez sélectionner au moins un objet','cms',NULL),(249,'blog_post',NULL,'Blog','cms',NULL),(250,'Extra',NULL,'En outre','cms',NULL),(251,'Edit Blog post',NULL,'Modifier un blog','cms',NULL),(252,'The begin date must be before the end date.',NULL,'Date de début doit être inférieure à la date de fin','cms',NULL),(257,'%%title%%',NULL,'%%title%%','cms',NULL),(258,'Email администратора',NULL,'Administrateur de messagerie','cms',NULL),(259,'На этот адрес вам будут приходить сообщения с сайта',NULL,'A cette adresse vous recevrez des messages sur le site','cms',NULL),(260,'Имя отправителя почты',NULL,'Email nom de l\'expéditeur','cms',NULL),(261,'От этого имени сайт будет отправлять почту',NULL,'Tous les e-mails seront envoyés au nom de ce nom','cms',NULL),(263,'Адрес',NULL,'Adresse','cms',NULL),(264,'Контактный телефон',NULL,'Numéro de téléphone','cms',NULL),(265,'Контактный email',NULL,'Contact email','cms',NULL),(266,'Type',NULL,'Type','cms',NULL),(267,'Description',NULL,'Description','cms',NULL),(268,'Admin email',NULL,'Envoyer à l\'administrateur','cms',NULL),(269,'User email',NULL,'Envoyer à l\'utilisateur','cms',NULL),(270,'Phone number',NULL,'Numéro de téléphone','cms',NULL),(271,'Company name',NULL,'Nom de l\'entreprise','cms',NULL),(272,'Attach',NULL,'Fichier joint','cms',NULL),(275,'Show',NULL,'Spectacle','cms',NULL),(279,'Password recovery',NULL,'Récupération de mot de passe','cms',NULL),(281,'Registration',NULL,'Inscription','cms',NULL),(283,'Page',NULL,'Page','cms',NULL),(284,'Описание',NULL,'Description','cms',NULL),(285,'redirect301',NULL,'301s','cms',NULL),(287,'email_template',NULL,'Modèles de courriel','cms',NULL),(288,'Имя',NULL,'Prénom','frontend',NULL),(289,'Email',NULL,'Email','frontend',NULL),(290,'Invalid mime type (%mime_type%).',NULL,'Format de fichier incorrect (%mime_type de%).','frontend',NULL),(291,'Password',NULL,'Mot de passe','frontend',NULL),(292,'Регистрация',NULL,'Inscription','frontend',NULL),(293,'ссылке',NULL,'Lien','frontend',NULL),(295,'Notifications',NULL,'Notifications','cms',NULL),(296,'Pages',NULL,'Pages','cms',NULL),(297,'Apply',NULL,'Appliquer','frontend',NULL),(298,'Discard',NULL,'Annuler','frontend',NULL),(299,'Данные сохранены',NULL,'Modifications enregistrées!','frontend',NULL),(301,'Изображение удалено',NULL,'Image Removed','frontend',NULL),(303,'Код введен неверно',NULL,'Le code que vous avez entré est invalide','frontend',NULL),(304,'Такой email не зарегистрирован в системе',NULL,'Cet e-mail est pas enregistrée dans le système','frontend',NULL),(305,' csrf token',NULL,'CSRF jeton','frontend',NULL),(306,'The item was deleted successfully.',NULL,'L\'article a été supprimé.','cms',NULL),(307,'You must select an action to execute on the selected items.',NULL,'Vous devez sélectionner une action à exécuter sur les éléments sélectionnés.','cms',NULL),(308,'The selected items have been deleted successfully.',NULL,'Les articles sélectionnés ont été supprimés avec succès.','cms',NULL),(310,'Cообщения с сайта',NULL,'Messages à partir du site','cms',NULL),(311,'Да, это мой email-аккаунт!',NULL,'Oui, ceci est mon compte e-mail!','frontend',NULL),(312,'Подтвердить email аккаунт!',NULL,'Confirmez email compte!','frontend',NULL),(313,'Подтверждаю!',NULL,'D\'accord!','frontend',NULL),(314,'Войти с помощью:',NULL,'Connectez-vous avec:','frontend',NULL);
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
INSERT INTO `menu_item` (`id`, `name`, `root_name`, `type`, `page_id`, `cms_module_id`, `route`, `external`, `is_empty`, `is_auth`, `icon_class`, `root_id`, `lft`, `rgt`, `level`) VALUES (1,'Menu principal','main','empty',NULL,NULL,NULL,NULL,1,0,NULL,1,1,52,0),(2,'Maison','','route',1,NULL,'homepage','',1,0,NULL,1,1,1,1),(3,'À propos de nous',NULL,'page',2,NULL,NULL,NULL,1,0,NULL,1,44,45,1),(4,'Contacts',NULL,'module',3,2,'','',1,0,NULL,1,46,47,1),(5,'Un forum fermé',NULL,'page',14,NULL,'','',1,1,'',1,50,51,1),(6,'Menu du bas','bottom','empty',NULL,NULL,NULL,NULL,1,0,NULL,6,6,NULL,0),(7,'Politique de confidentialité',NULL,'page',13,NULL,'','',1,0,'',6,6,5,1),(8,'Accord de l\'utilisateur',NULL,'page',12,NULL,'','',1,0,'',6,6,5,1);
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
INSERT INTO `email_template` (`id`, `name`, `subject`, `message`) VALUES (1,'registration_user','Inscrivez-vous sur le projet DEV2','Bonjour, {}%prenom%! Vous avez été enregistré avec succès! Suivez ce lien {%%}, pour activer votre compte!'),(2,'registration_admin','Créer un nouveau compte','User {}%full_name%enregistré avec nous!'),(3,'password_recovery_user','Récupération de mot de passe','Bonjour, {%full_name%} Vous avez demandé la récupération de mot de passe sur le projet Dev2. Suivez cette {%LINK%} pour définir un nouveau mot de passe. Si vous ne l\'avez pas demandé la récupération de mot de passe, se il vous plaît ignorer cette lettre.'),(4,'contactus_message_user','DEV2 projet. Votre message est important pour nous!','Cher {}%%nom! Merci pour votre message! Il est très important pour nous!'),(5,'contactus_message_admin','DEV2 projet. nouveau message','Quelqu\'un {%name%} a envoyé un message. Texte: {}%message%E-Mail: {}%email%'),(6,'social_bridge_user_confirm_email_user','Demo.web375.org - Confirmez votre adresse e-mail dans le réseau social {%network_name%}','Confirmer courriel {%email%}, suivez le lien {%link%} ou en utilisant ce code {%token%}');
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

-- Dump completed on 2014-11-05 20:23:07

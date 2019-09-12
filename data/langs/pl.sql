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
INSERT INTO `page` (`id`, `name`, `content`, `is_module_page`, `module_name`, `is_content_editable`, `special_mark`, `is_redirect`, `redirect_route`, `redirect_timeout`, `layout`, `slug`, `meta_title`, `meta_description`, `meta_keywords`) VALUES (1,'Witamy!','Pozdrowienia dla Ciebie, młody przyjacielu! Przyszedłeś do tej strony, bo sam potrzebuje strony internetowej. A może po prostu przyszedł tu przez przypadek! W każdym razie, witamy!',1,'default',1,'default',0,'/',5,'','witamy','Witamy na stronie internetowej DEV2 projektu!','',''),(2,'O nas','Jesteśmy młodym, ale już bardzo doświadczona firma zajmuje się rozwojem i promocją stron internetowych',0,NULL,1,NULL,0,'/',5,'','o-nas','O projekcie','',''),(3,'Sprzężenie zwrotne','Wyślij do nas wiadomość, a my skontaktujemy się z Tobą tak szybko, jak to możliwe!',0,NULL,1,'contactus',0,'/',5,'','sprzezenie-zwrotne','Kontakt - Projekt DEV2','',''),(4,'Rejestracja','',0,NULL,0,'register',0,'/',5,NULL,'rejestracja','Rejestracja','',''),(5,'Odzyskiwanie hasła','Kliknij przycisk \"Odzyskaj hasło\", a my wyślemy wiadomość e-mail do konta e-mail, który będzie odnośnik do strony odzyskiwania hasła',0,NULL,1,'auth_forgot_password',0,'/',5,NULL,'odzyskiwanie-hasla','Odzyskiwanie hasła','',''),(6,'Odzyskanie hasła. E-mail wysłany.','E-mail został wysłany do konta e-mail',0,NULL,1,'auth_forgot_password_thanks',1,'/',5,'','odzyskanie-hasla-e-mail-wyslany','Odzyskanie hasła. E-mail wysłany.','',''),(7,'Odzyskanie hasła. wysłany SMS','',0,NULL,1,'auth_forgot_sms',0,'/',5,NULL,'odzyskanie-hasla-wyslany-sms','Odzyskanie hasła. wysłany SMS','',''),(8,'Wymyślać nowe hasło','',0,NULL,1,'auth_password_recovery',0,'/',5,NULL,'wymyslac-nowe-haslo','Wymyślać nowe hasło','',''),(9,'Twój Personal Area','',0,NULL,1,'auth_signin',0,'/',5,NULL,'twoj-personal-area','Twój Personal Area','',''),(10,'Rejestracja jest przekazywane','Wysłaliśmy e-mail z dalszymi instrukcjami rejestracji na adres e-mail',0,NULL,1,'auth_registration_complete',1,'/',5,NULL,'rejestracja-jest-przekazywane','Rejestracja jest przekazywane','',''),(11,'Aktywacja jest przekazywane','Teraz możesz zalogować się!',0,NULL,1,'auth_activation_successful',1,'/profile',3,'','aktywacja-jest-przekazywane','Aktywacja jest przekazywane','',''),(12,'Umowa z użytkownikiem','Oto absolutnie typowy Umowa użytkownika',0,NULL,1,'user_agreement',0,'/',5,'','umowa-z-uzytkownikiem','Umowa z użytkownikiem','',''),(13,'Polityka prywatności','Oto absolutnie typowa strona o polityce prywatności',0,NULL,1,'privacy_policy',0,'/',5,'','polityka-prywatnosci','Polityka prywatności','',''),(14,'Zamknięty Forum','Jeśli natkniesz się na tej stronie, oznacza to, że jesteś upoważniony użytkownik!',0,NULL,1,NULL,0,'/',5,NULL,'zamkniety-forum','Zamknięty Forum','',''),(15,'To jest strona testowa','',0,NULL,1,NULL,0,'/',5,'','to-jest-strona-testowa','To jest strona testowa','',''),(16,'Błąd 404','Nie znaleziono błąd 404. Page',0,NULL,1,'error404',0,'/',5,NULL,'blad-404','Błąd 404','',''),(17,'Mój profil','Tutaj możesz edytować swoje dane osobowe, przesłać zdjęcie i zmienić hasło',0,NULL,0,'profile',0,'/',5,NULL,'moj-profil','Mój profil','',''),(18,'Mój profil - Zmiana hasła','Możemy przechowywać hasła w postaci zaszyfrowanej.',0,NULL,0,'profile_password',0,'/',5,NULL,'moj-profil-zmiana-hasla','Mój profil - Zmiana hasła','',''),(19,'Mój profil - Edycja zdjęć','',0,NULL,0,'profile_avatar',0,'/',5,NULL,'moj-profil-edycja-zdjec','Mój profil - Edycja zdjęć','',''),(20,'Adres IP jest zablokowany','Niestety, z niejasnych powodów, twój adres został zablokowany! Dziękujemy!',0,NULL,1,'ip_banned',0,'/',5,'empty','adres-ip-jest-zablokowany','Adres IP jest zablokowany','',''),(21,'Zaloguj się lub zarejestruj','Aby zobaczyć zawartość tej sekcji zaloguj się',0,NULL,1,'auth_secure',0,'/',5,NULL,'zaloguj-sie-lub-zarejestruj','Zaloguj się lub zarejestruj','',''),(22,'Confirmation of account in socConfirm your social networks accountial networks','Uwaga! E-mail {%email%} już istnieje w systemie! Jeśli jest to Twój adres e-mail, sprawdź to!',0,NULL,1,'oauth_bridge',0,'/',5,NULL,'confirmation-of-account-in-socconfirm-your-social-networks-accountial-networks','Potwierdź swoje konto sieci społecznych','',''),(23,'Potwierdź swoje konto sieci społecznych. krok drugi','List z potwierdzeniem został wysłany na Twój adres e-mail {%email%}',0,NULL,1,'oauth_bridge_confirm',0,'/',5,NULL,'potwierdz-swoje-konto-sieci-spolecznych-krok-drugi','Potwierdź swoje konto sieci społecznych','',''),(24,'Błąd autoryzacji OAuth','',0,NULL,1,'oauth_error',0,'/',5,NULL,'blad-autoryzacji-oauth','Błąd autoryzacji OAuth','','');
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
INSERT INTO `text_block` (`id`, `name`, `title`, `text`, `application`, `module`) VALUES (1,'Username',NULL,'Nazwa użytkownika','cms',NULL),(2,'Password',NULL,'Hasło','cms',NULL),(3,'Remember?',NULL,'Zapamiętaj mnie?','cms',NULL),(4,'Login',NULL,'Login','cms',NULL),(5,'Welcome to',NULL,'Powitanie','cms',NULL),(6,'Use a valid username and password to gain access to the administration console.',NULL,'Wpisz uważnie swój login i hasło, aby uzyskać dostęp do konsoli administracyjnej.','cms',NULL),(7,'Вход',NULL,'Login','frontend',NULL),(8,'Ваша компания',NULL,'Twoja Firma','frontend',NULL),(9,'Разработка и поддержка',NULL,'Rozwój i wsparcie','frontend',NULL),(11,'Blog',NULL,'Blog','cms',NULL),(12,'Posts',NULL,'Wiadomości','cms',NULL),(13,'Comments',NULL,'Komentarze','cms',NULL),(14,'Tags',NULL,'Tagi','cms',NULL),(15,'Users',NULL,'Użytkownicy','cms',NULL),(16,'Settings',NULL,'Ustawienia','cms',NULL),(18,'Email шаблоны',NULL,'Szablony e-mail','cms',NULL),(21,'Сообщения',NULL,'Wiadomości','cms',NULL),(28,'Локализация',NULL,'Lokalizacja','cms',NULL),(33,'Добавить',NULL,'Dodać','cms',NULL),(34,'Go to Frontend',NULL,'Idź do strony','cms',NULL),(35,'Logout',NULL,'Wyjście','cms',NULL),(36,'dashboard',NULL,'Tablica rozdzielcza','cms',NULL),(37,'Профиль',NULL,'Profil','frontend',NULL),(38,'Выход',NULL,'Wyjście','frontend',NULL),(39,'Админка',NULL,'Admin','frontend',NULL),(40,'Page List',NULL,'Lista stron','cms',NULL),(41,'Name',NULL,'Tytuł','cms',NULL),(42,'Slug',NULL,'URL','cms',NULL),(43,'Actions',NULL,'Akcje','cms',NULL),(44,'First page',NULL,'Pierwsza strona','cms',NULL),(45,'Previous page',NULL,'Poprzednia strona','cms',NULL),(46,'Next page',NULL,'Następna strona','cms',NULL),(47,'Last page',NULL,'Ostatnia strona','cms',NULL),(48,'[0] no result|[1] 1 result|(1,+Inf] %1% results',NULL,'[0] nie wynik|[1] 1 wynik|(1,+Inf] %1% Wyniki','cms',NULL),(49,'(page %%page%%/%%nb_pages%%)',NULL,'(strona %%page%%/%%nb_pages%%)','cms',NULL),(50,'Edit',NULL,'Edycja','cms',NULL),(51,'Delete',NULL,'Kasować','cms',NULL),(52,'Are you sure?',NULL,'Czy na pewno?','cms',NULL),(53,'Choose an action',NULL,'Wybierz działanie','cms',NULL),(54,'go',NULL,'Idź!','cms',NULL),(55,'New',NULL,'Nowy','cms',NULL),(56,'Blog Posts',NULL,'Blogach','cms',NULL),(57,'Reset',NULL,'Resetowanie','cms',NULL),(58,'Filter',NULL,'Filtr','cms',NULL),(59,'No result',NULL,'Nie wynik','cms',NULL),(60,'New Page',NULL,'Nowa strona','cms',NULL),(61,'Content',NULL,'Zawartość','cms',NULL),(62,'Включить редирект',NULL,'Włącz przekierowanie','cms',NULL),(63,'Redirect route',NULL,'Przekierowanie do','cms',NULL),(64,'Redirect timeout',NULL,'Limit czasu przekierowania','cms',NULL),(65,'Layout',NULL,'Układ','cms',NULL),(66,'Meta title',NULL,'Meta tytuł','cms',NULL),(67,'Meta description',NULL,'Meta opis','cms',NULL),(68,'Meta keywords',NULL,'Meta słowa kluczowe','cms',NULL),(69,'Back to list',NULL,'Powrót do listy','cms',NULL),(70,'Save',NULL,'Zapisz','cms',NULL),(71,'Save and add',NULL,'Zapisz i dodaj','cms',NULL),(72,'УРЛ-метка',NULL,'Znacznik URL','cms',NULL),(73,'Edit Page',NULL,'Edytuj tę stronę','cms',NULL),(74,'User list',NULL,'Lista użytkowników','cms',NULL),(75,'Created at',NULL,'Utworzony w','cms',NULL),(76,'Updated at',NULL,'Aktualizowane na','cms',NULL),(77,'Last login',NULL,'Ostatnie logowanie','cms',NULL),(78,'user',NULL,'Użytkownik','cms',NULL),(79,'New User',NULL,'Nowy użytkownik','cms',NULL),(80,'User',NULL,'Użytkownik','cms',NULL),(81,'First name',NULL,'Imię','cms',NULL),(82,'Last name',NULL,'Nazwisko','cms',NULL),(83,'Email address',NULL,'Adres e-mail','cms',NULL),(84,'Password (again)',NULL,'Hasło (ponownie)','cms',NULL),(85,'Permissions',NULL,'Uprawnienia','cms',NULL),(86,'Is active',NULL,'Jest aktywny','cms',NULL),(87,'Is super admin',NULL,'Jest super administratora','cms',NULL),(88,'Editing User \"%%username%%\"',NULL,'Edycja \"%%username%%\"','cms',NULL),(89,'dictionary',NULL,'Słownik','cms',NULL),(90,'Title',NULL,'Tytuł','cms',NULL),(91,'Value',NULL,'Wartość','cms',NULL),(92,'settings',NULL,'Ustawienia','cms',NULL),(93,'Email template List',NULL,'Lista szablonów e-mail','cms',NULL),(94,'Id',NULL,'ID','cms',NULL),(95,'Subject',NULL,'Temat','cms',NULL),(96,'Message',NULL,'Wiadomość','cms',NULL),(98,'Edit Email template',NULL,'Edycja szablonu e-mail','cms',NULL),(99,'New Email template',NULL,'Nowy szablon e-mail','cms',NULL),(100,'Ваше имя',NULL,'Twoje imię i nazwisko','frontend',NULL),(101,'Ваш Email',NULL,'Twój e-mail','frontend',NULL),(102,'Нужен для обратной связи',NULL,'Potrzeba informacji zwrotnej','frontend',NULL),(103,'Ваше сообщение',NULL,'Twoja wiadomość','frontend',NULL),(104,'Reload image',NULL,'Odśwież obrazek','frontend',NULL),(105,'Введите код с картинки',NULL,'Wpisz kod z obrazka','frontend',NULL),(106,'Показатели',NULL,'Wskaźniki','cms',NULL),(107,'Имя',NULL,'Nazwa','cms',NULL),(108,'Email',NULL,'E-mail','cms',NULL),(109,'desc',NULL,'Malejąco','cms',NULL),(110,'Просмотр',NULL,'Widok','cms',NULL),(111,'Создать пользователя',NULL,'Utwórz użytkownika','cms',NULL),(112,'Export',NULL,'Eksport','cms',NULL),(113,'The item was updated successfully.',NULL,'Ten element został pomyślnie zaktualizowany.','cms',NULL),(114,'Неверный формат',NULL,'Nieprawidłowy format','frontend',NULL),(115,'System settings',NULL,'Ustawienia systemowe','cms',NULL),(116,'Section',NULL,'Sekcja','cms',NULL),(118,'Email error List',NULL,'Lista błędów e-mail','cms',NULL),(119,'Email from',NULL,'Od kogo','cms',NULL),(120,'Email to',NULL,'Do kogo','cms',NULL),(121,'Body',NULL,'Ciało','cms',NULL),(122,'Cc',NULL,'Kopia','cms',NULL),(123,'File',NULL,'Plik','cms',NULL),(132,'Filters',NULL,'Filtr','cms',NULL),(133,'is empty',NULL,'Pusty','cms',NULL),(134,'Мой профиль',NULL,'Mój profil','frontend',NULL),(135,'Фотография',NULL,'Zdjęcie','frontend',NULL),(136,'Изменить пароль',NULL,'Zmień hasło','frontend',NULL),(137,'Отчество',NULL,'Patronimiczny','frontend',NULL),(138,'Фамилия',NULL,'Nazwisko','frontend',NULL),(139,'Дата рождения\n(дд.мм.гггг)',NULL,'DOB','frontend',NULL),(140,'Телефон мобильный\n(для получения уведомлений)',NULL,'Telefon komórkowy (do zgłoszenia)','frontend',NULL),(141,'Сохранить изменения',NULL,'Zapisz zmiany','frontend',NULL),(142,'Старый пароль',NULL,'Stare hasło','frontend',NULL),(143,'Новый пароль',NULL,'Nowe hasło','frontend',NULL),(144,'Новый пароль еще раз',NULL,'Nowe hasło ponownie','frontend',NULL),(145,'Сохранить пароль',NULL,'Zapisz hasło','frontend',NULL),(146,'Заполните поле',NULL,'Wypełnij pole','frontend',NULL),(147,'Passwords do not match',NULL,'Hasła nie są identyczne','frontend',NULL),(148,'Выберите картинку из загрузите ее',NULL,'Wybierz zdjęcie i przesłać go','frontend',NULL),(149,'Image',NULL,'Obraz','frontend',NULL),(150,'Загрузить фотографию',NULL,'Prześlij zdjęcie','frontend',NULL),(151,'File is too large (maximum is %max_size% bytes).',NULL,'Plik jest zbyt duży (maksymalny%MAX_SIZE%).','frontend',NULL),(152,'Вы можете выбрать зону, которая будет отображаться на ваших аватарках. Кликните по одному из изображений справа',NULL,'Możesz wybrać obszar, który będzie wyświetlany na zdjęciach. Kliknij na jeden z małych zdjęć w prawo','frontend',NULL),(153,'remove the current file',NULL,'Usuń bieżący plik','frontend',NULL),(154,'Сохранить',NULL,'Zapisz','frontend',NULL),(155,'Вы уверены?',NULL,'Czy na pewno?','frontend',NULL),(156,'Удалить фотографию',NULL,'Usuń zdjęcie','frontend',NULL),(157,'Логин (Ваш Email)',NULL,'Nazwa użytkownika (Twój e-mail)','frontend',NULL),(158,'Запомнить меня на этом компьютере',NULL,'Pamiętaj mnie na tym komputerze','frontend',NULL),(159,'Войти',NULL,'Login','frontend',NULL),(160,'Забыли пароль?',NULL,'Nie pamiętasz hasła?','frontend',NULL),(161,'Registration',NULL,'Rejestracja','frontend',NULL),(162,'The username and/or password is invalid.',NULL,'Niepoprawne login lub hasło','frontend',NULL),(163,'Введите код',NULL,'Wprowadź kod','frontend',NULL),(164,'Письмо отправлено',NULL,'E-mail wysłany','frontend',NULL),(165,'Ваш email',NULL,'Twój e-mail','frontend',NULL),(166,'Восстановить пароль',NULL,'Przypomnij hasło','frontend',NULL),(167,'Повторите пароль',NULL,'Potwierdź hasło','frontend',NULL),(168,'Я принимаю условия',NULL,'Akceptuję warunki','frontend',NULL),(169,'Такой email уже зарегистрирован в ситеме',NULL,'Ten e-mail jest już zarejestrowany w systemie','frontend',NULL),(170,'Пароли не совпадают',NULL,'Hasła nie są identyczne','frontend',NULL),(171,'Вы должны принять условия пользовательского соглашения',NULL,'Musisz zaakceptować Warunki korzystania z usługi','frontend',NULL),(172,'Пароль должен быть не короче 4 символов',NULL,'Hasło musi mieć co najmniej 4 znaki','frontend',NULL),(173,'Еще раз пароль',NULL,'Potwierdź swoje hasło','frontend',NULL),(174,'Сменить пароль',NULL,'Zmień hasło','frontend',NULL),(175,'Пароль слишком короткий',NULL,'Hasło jest za krótkie','frontend',NULL),(176,'Пароль восстановлен',NULL,'Hasło odzyskane','frontend',NULL),(177,'Password is invalid.',NULL,'Nieprawidłowe hasło','frontend',NULL),(178,'События за сегодня',NULL,'Imprezy na dziś','cms',NULL),(179,'Всего событий',NULL,'Wszystkich Wydarzenia','cms',NULL),(180,'All rights reserved',NULL,'Wszystkie prawa zastrzeżone','cms',NULL),(181,'Date',NULL,'Data','cms',NULL),(182,'Is published',NULL,'Opublikowany','cms',NULL),(183,'yes or no',NULL,'Tak lub nie','cms',NULL),(184,'yes',NULL,'Tak','cms',NULL),(185,'no',NULL,'Nie','cms',NULL),(186,'From',NULL,'Z','cms',NULL),(187,'To',NULL,'Do','cms',NULL),(188,'New Blog post',NULL,'Nowy wpis na blogu','cms',NULL),(189,'Brief',NULL,'Krótko','cms',NULL),(190,'Text',NULL,'Tekst','cms',NULL),(191,'Url',NULL,'URL','cms',NULL),(193,'пользовательского соглашения',NULL,'Umowa z użytkownikiem','frontend',NULL),(194,'The item was created successfully.',NULL,'Ten element został utworzony.','cms',NULL),(195,'You don\'t have proper credentials to access this page',NULL,'Nie masz odpowiednie uprawnienia do dostępu do tej strony','cms',NULL),(197,'Secure',NULL,'Zamknięty Forum','cms',NULL),(210,'Server is not responding',NULL,'Serwer nie odpowiada','cms',NULL),(211,'Data saved',NULL,'Dane zapisywane','cms',NULL),(212,'Error while saving data',NULL,'Błąd zapisu danych','cms',NULL),(217,'Unexpected extra form field named \"%field%\".',NULL,'Nieoczekiwane dodatkowe pola formularza o nazwie \"%pola%\".','cms',NULL),(221,'Вы можете править текст прямо в списке. Исправьте все, что считаете нужным, а затем нажмите TAB или щелкните мышью в любом месте вне поля ввода.',NULL,'Można edytować tekst bezpośrednio na liście. Popraw wszystkie, które mają zastosowanie, a następnie naciśnij klawisz TAB lub kliknąć w dowolnym miejscu poza polem wprowadzania.','cms',NULL),(222,'Воспользуйтесь фильтром, чтобы найти нужный вам текст',NULL,'Proszę użyć filtru, aby znaleźć żądany tekst','cms',NULL),(223,'Отправить',NULL,'Wysłać','frontend',NULL),(224,'The item has not been saved due to some errors.',NULL,'Obiekt nie został zapisany z powodu pewnych błędów','cms',NULL),(225,'An object with the same \"%column%\" already exist.',NULL,'Obiekt o wartości pola \"%kolumny%\" już istnieje w systemie.','cms',NULL),(226,'Update',NULL,'Aktualizacja','cms',NULL),(235,'Страницы',NULL,'Strona','cms',NULL),(236,'Пользователи',NULL,'Użytkownicy','cms',NULL),(237,'Настройки',NULL,'Ustawienia','cms',NULL),(238,'Редирект 301',NULL,'301s','cms',NULL),(239,'Уведомления',NULL,'Ogłoszenie','cms',NULL),(241,'Url from',NULL,'Skąd','cms',NULL),(242,'Url to',NULL,'Gdzie','cms',NULL),(243,'Comment',NULL,'Opis','cms',NULL),(245,'from %from_date%<br />to %to_date%',NULL,'Od%from_date%do%to_date%','cms',NULL),(246,'Checked',NULL,'Zauważyć','cms',NULL),(248,'You must at least select one item.',NULL,'Musisz wybrać co najmniej jeden obiekt','cms',NULL),(249,'blog_post',NULL,'Blogu','cms',NULL),(250,'Extra',NULL,'Dodatkowo','cms',NULL),(251,'Edit Blog post',NULL,'Edycja blogu','cms',NULL),(252,'The begin date must be before the end date.',NULL,'Data początkowa musi być mniejsza niż daty zakończenia','cms',NULL),(257,'%%title%%',NULL,'%%title%%','cms',NULL),(258,'Email администратора',NULL,'Administrator e-mail','cms',NULL),(259,'На этот адрес вам будут приходить сообщения с сайта',NULL,'Pod tym adresem można otrzymywać wiadomości z serwisu','cms',NULL),(260,'Имя отправителя почты',NULL,'E-mail Imię nadawcy','cms',NULL),(261,'От этого имени сайт будет отправлять почту',NULL,'Wszystkie e-maile będą wysyłane w imieniu tej nazwie','cms',NULL),(263,'Адрес',NULL,'Adres','cms',NULL),(264,'Контактный телефон',NULL,'Telefon kontaktowy','cms',NULL),(265,'Контактный email',NULL,'Kontakt e-mail','cms',NULL),(266,'Type',NULL,'Typ','cms',NULL),(267,'Description',NULL,'Opis','cms',NULL),(268,'Admin email',NULL,'E-mail do administratora','cms',NULL),(269,'User email',NULL,'E-mail do użytkownika','cms',NULL),(270,'Phone number',NULL,'Numer telefonu','cms',NULL),(271,'Company name',NULL,'Nazwa firmy','cms',NULL),(272,'Attach',NULL,'Załączony plik','cms',NULL),(275,'Show',NULL,'Show','cms',NULL),(279,'Password recovery',NULL,'Odzyskiwanie hasła','cms',NULL),(281,'Registration',NULL,'Rejestracja','cms',NULL),(283,'Page',NULL,'Strona','cms',NULL),(284,'Описание',NULL,'Opis','cms',NULL),(285,'redirect301',NULL,'301s','cms',NULL),(287,'email_template',NULL,'Szablony e-mail','cms',NULL),(288,'Имя',NULL,'Imię','frontend',NULL),(289,'Email',NULL,'E-mail','frontend',NULL),(290,'Invalid mime type (%mime_type%).',NULL,'Nieprawidłowy format pliku (%mime_type%).','frontend',NULL),(291,'Password',NULL,'Hasło','frontend',NULL),(292,'Регистрация',NULL,'Rejestracja','frontend',NULL),(293,'ссылке',NULL,'Powiązanie','frontend',NULL),(295,'Notifications',NULL,'Powiadomienia','cms',NULL),(296,'Pages',NULL,'Strony','cms',NULL),(297,'Apply',NULL,'Zastosować','frontend',NULL),(298,'Discard',NULL,'Anulować','frontend',NULL),(299,'Данные сохранены',NULL,'Zmiany zapisane!','frontend',NULL),(301,'Изображение удалено',NULL,'Usunąć zdjęcie','frontend',NULL),(303,'Код введен неверно',NULL,'Kod jest nieprawidłowy','frontend',NULL),(304,'Такой email не зарегистрирован в системе',NULL,'Ten e-mail nie jest zarejestrowany w systemie','frontend',NULL),(305,' csrf token',NULL,'Token CSRF','frontend',NULL),(306,'The item was deleted successfully.',NULL,'Element został usunięty pomyślnie.','cms',NULL),(307,'You must select an action to execute on the selected items.',NULL,'Musisz wybrać akcję do wykonania na wybranych pozycjach.','cms',NULL),(308,'The selected items have been deleted successfully.',NULL,'Wybrane pozycje zostały pomyślnie usunięte.','cms',NULL),(310,'Cообщения с сайта',NULL,'Wiadomości z serwisu','cms',NULL),(311,'Да, это мой email-аккаунт!',NULL,'Tak, to jest moje konto e-mail!','frontend',NULL),(312,'Подтвердить email аккаунт!',NULL,'Potwierdzić konto e-mail!','frontend',NULL),(313,'Подтверждаю!',NULL,'Zgadzam się!','frontend',NULL),(314,'Войти с помощью:',NULL,'Zaloguj się z:','frontend',NULL);
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
INSERT INTO `menu_item` (`id`, `name`, `root_name`, `type`, `page_id`, `cms_module_id`, `route`, `external`, `is_empty`, `is_auth`, `icon_class`, `root_id`, `lft`, `rgt`, `level`) VALUES (1,'Menu główne','main','empty',NULL,NULL,NULL,NULL,1,0,NULL,1,1,52,0),(2,'Dom','','route',1,NULL,'homepage','',1,0,NULL,1,1,1,1),(3,'O nas',NULL,'page',2,NULL,NULL,NULL,1,0,NULL,1,44,45,1),(4,'Kontakt',NULL,'module',3,2,'','',1,0,NULL,1,46,47,1),(5,'Zamknięty Forum',NULL,'page',14,NULL,'','',1,1,'',1,50,51,1),(6,'Menu stopka','bottom','empty',NULL,NULL,NULL,NULL,1,0,NULL,6,6,NULL,0),(7,'Polityka prywatności',NULL,'page',13,NULL,'','',1,0,'',6,6,5,1),(8,'Umowa z użytkownikiem',NULL,'page',12,NULL,'','',1,0,'',6,6,5,1);
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
INSERT INTO `email_template` (`id`, `name`, `subject`, `message`) VALUES (1,'registration_user','Zarejestruj się na projekcie DEV2','Witaj, {%first_name%}! Po zarejestrowaniu powodzeniem! Śledź ten {%łącza%}, aby aktywować swoje konto!'),(2,'registration_admin','Zarejestruj nowe konto','Użytkownik {%FULL_NAME%} zarejestrowany razem z nami!'),(3,'password_recovery_user','Odzyskiwanie hasła','Dzień dobry, {%FULL_NAME%} Zażądano odzyskiwania hasła w projekcie Dev2. Śledź ten {%LINK%}, aby ustawić nowe hasło. Jeśli nie o odzyskanie hasła, proszę zignorować ten list.'),(4,'contactus_message_user','Projekt DEV2. Twoja wiadomość jest dla nas ważne!','Drogi {%%name}! Dziękujemy za wiadomość! Jest to dla nas bardzo ważne!'),(5,'contactus_message_admin','Projekt DEV2. nowa wiadomość','Ktoś {nazwa%%} wysłał wiadomość. Tekst: {}%%wiadomości e-mail: {%email%}'),(6,'social_bridge_user_confirm_email_user','Demo.web375.org - Potwierdź swój adres e-mail w sieci społecznej {%network_name%}','Potwierdź e-mail {%email%}, należy kliknąć  {%link%} łącza lub użyć tego kodu {%token%}');
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

-- Dump completed on 2014-11-05 20:24:54

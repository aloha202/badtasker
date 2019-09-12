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
INSERT INTO `page` (`id`, `name`, `content`, `is_module_page`, `module_name`, `is_content_editable`, `special_mark`, `is_redirect`, `redirect_route`, `redirect_timeout`, `layout`, `slug`, `meta_title`, `meta_description`, `meta_keywords`) VALUES (1,'¡Bienvenido!','Saludos a usted, joven amigo! Usted vino a este sitio porque tienes a ti mismo necesita un sitio web. O tal vez usted acaba de venir aquí por accidente! En cualquier caso, bienvenido!',1,'default',1,'default',0,'/',5,'','bienvenido','Bienvenido a la página web de la DEV2 proyecto!','',''),(2,'Sobre nosotros','Somos una empresa joven, pero ya con mucha experiencia dedicada al desarrollo y promoción de sitios web',0,NULL,1,NULL,0,'/',5,'','sobre-nosotros','Sobre el proyecto','',''),(3,'Realimentación','Envíenos un mensaje y nos pondremos en contacto con usted lo antes posible!',0,NULL,1,'contactus',0,'/',5,'','realimentacion','Contáctenos - Proyecto DEV2','',''),(4,'Registro','',0,NULL,0,'register',0,'/',5,NULL,'registro','Registro','',''),(5,'Recuperar la contraseña','Haga clic en \"Recuperar contraseña\" y le enviaremos un e-mail a su cuenta de correo electrónico que enlazará a la página de recuperación de contraseñas',0,NULL,1,'auth_forgot_password',0,'/',5,NULL,'recuperar-la-contrasena','Recuperar la contraseña','',''),(6,'Recuperación de la contraseña. Correo electrónico enviado.','El correo electrónico ha sido enviado a su cuenta de correo electrónico',0,NULL,1,'auth_forgot_password_thanks',1,'/',5,'','recuperacion-de-la-contrasena-correo-electronico-enviado','Recuperación de la contraseña. Correo electrónico enviado.','',''),(7,'Recuperación de la contraseña. SMS enviado','',0,NULL,1,'auth_forgot_sms',0,'/',5,NULL,'recuperacion-de-la-contrasena-sms-enviado','Recuperación de la contraseña. SMS enviado','',''),(8,'Inventar una nueva contraseña','',0,NULL,1,'auth_password_recovery',0,'/',5,NULL,'inventar-una-nueva-contrasena','Inventar una nueva contraseña','',''),(9,'Su área personal','',0,NULL,1,'auth_signin',0,'/',5,NULL,'su-area-personal','Su área personal','',''),(10,'Se pasa Registro','Les enviamos más instrucciones de registro a su dirección de correo electrónico',0,NULL,1,'auth_registration_complete',1,'/',5,NULL,'se-pasa-registro','Se pasa Registro','',''),(11,'Se pasa de activación','Ahora puede iniciar sesión!',0,NULL,1,'auth_activation_successful',1,'/profile',3,'','se-pasa-de-activacion','Se pasa de activación','',''),(12,'Acuerdo del usuario','Aquí es un acuerdo absolutamente usuario típico',0,NULL,1,'user_agreement',0,'/',5,'','acuerdo-del-usuario','Acuerdo del usuario','',''),(13,'Política de privacidad','Aquí es una página absolutamente típica sobre la política de privacidad',0,NULL,1,'privacy_policy',0,'/',5,'','politica-de-privacidad','Política de privacidad','',''),(14,'Un Foro Cerrado','Si usted viene a través de esta página, significa que usted es un usuario autorizado!',0,NULL,1,NULL,0,'/',5,NULL,'un-foro-cerrado','Un Foro Cerrado','',''),(15,'Esta es una página de prueba','',0,NULL,1,NULL,0,'/',5,'','esta-es-una-pagina-de-prueba','Esta es una página de prueba','',''),(16,'Error 404','Error 404. Página no encontrada',0,NULL,1,'error404',0,'/',5,NULL,'error-404','Error 404','',''),(17,'Mi Perfil','Aquí puede editar su información personal, subir una foto y para cambiar la contraseña',0,NULL,0,'profile',0,'/',5,NULL,'mi-perfil','Mi Perfil','',''),(18,'Mi perfil - Cambiar mi contraseña','Almacenamos su contraseña en forma encriptada.',0,NULL,0,'profile_password',0,'/',5,NULL,'mi-perfil-cambiar-mi-contrasena','Mi perfil - Cambiar mi contraseña','',''),(19,'Mi perfil - Editar foto','',0,NULL,0,'profile_avatar',0,'/',5,NULL,'mi-perfil-editar-foto','Mi perfil - Editar foto','',''),(20,'Dirección IP está bloqueada','Lamentablemente, por razones poco claras, su dirección ha sido bloqueado! Gracias!',0,NULL,1,'ip_banned',0,'/',5,'empty','direccion-ip-esta-bloqueada','Dirección IP está bloqueada','',''),(21,'Por favor, registrarse o','Para ver el contenido de esta sección, por favor conectarse',0,NULL,1,'auth_secure',0,'/',5,NULL,'por-favor-registrarse-o','Por favor, registrarse o','',''),(22,'Confirmation of account in socConfirm your social networks accountial networks','¡Atención! Email {%email%} ya existe en el sistema! Si esta es tu dirección de correo electrónico, confirmarlo!',0,NULL,1,'oauth_bridge',0,'/',5,NULL,'confirmation-of-account-in-socconfirm-your-social-networks-accountial-networks','Confirme su cuenta de redes sociales','',''),(23,'Confirme su cuenta de redes sociales. paso dos','Carta de confirmación ha sido enviada a su dirección de correo electrónico {%email%}',0,NULL,1,'oauth_bridge_confirm',0,'/',5,NULL,'confirme-su-cuenta-de-redes-sociales-paso-dos','Confirme su cuenta de redes sociales','',''),(24,'Error de autorización OAuth','',0,NULL,1,'oauth_error',0,'/',5,NULL,'error-de-autorizacion-oauth','Error de autorización OAuth','','');
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
INSERT INTO `text_block` (`id`, `name`, `title`, `text`, `application`, `module`) VALUES (1,'Username',NULL,'Nombre de usuario','cms',NULL),(2,'Password',NULL,'Contraseña','cms',NULL),(3,'Remember?',NULL,'Acuérdate de mí?','cms',NULL),(4,'Login',NULL,'Login','cms',NULL),(5,'Welcome to',NULL,'Bienvenida','cms',NULL),(6,'Use a valid username and password to gain access to the administration console.',NULL,'Utilice un nombre de usuario y una contraseña válidos para acceder a la consola de administración.','cms',NULL),(7,'Вход',NULL,'Login','frontend',NULL),(8,'Ваша компания',NULL,'Su Empresa','frontend',NULL),(9,'Разработка и поддержка',NULL,'Desarrollo y apoyo','frontend',NULL),(11,'Blog',NULL,'Blog','cms',NULL),(12,'Posts',NULL,'Mensajes','cms',NULL),(13,'Comments',NULL,'Comentarios','cms',NULL),(14,'Tags',NULL,'Etiquetas','cms',NULL),(15,'Users',NULL,'Usuarios','cms',NULL),(16,'Settings',NULL,'Ajustes','cms',NULL),(18,'Email шаблоны',NULL,'Plantillas de correo electrónico','cms',NULL),(21,'Сообщения',NULL,'Mensajes','cms',NULL),(28,'Локализация',NULL,'Localización','cms',NULL),(33,'Добавить',NULL,'Añadir','cms',NULL),(34,'Go to Frontend',NULL,'Ir al sitio','cms',NULL),(35,'Logout',NULL,'Salida','cms',NULL),(36,'dashboard',NULL,'Salpicadero','cms',NULL),(37,'Профиль',NULL,'Perfil','frontend',NULL),(38,'Выход',NULL,'Salida','frontend',NULL),(39,'Админка',NULL,'Administración','frontend',NULL),(40,'Page List',NULL,'Lista de páginas','cms',NULL),(41,'Name',NULL,'Título','cms',NULL),(42,'Slug',NULL,'URL','cms',NULL),(43,'Actions',NULL,'Acciones','cms',NULL),(44,'First page',NULL,'Primera página','cms',NULL),(45,'Previous page',NULL,'Página Anterior','cms',NULL),(46,'Next page',NULL,'Página siguiente','cms',NULL),(47,'Last page',NULL,'Última página','cms',NULL),(48,'[0] no result|[1] 1 result|(1,+Inf] %1% results',NULL,'[0] no resultado|[1] 1 resultado|(1,+Inf] %1% resultados','cms',NULL),(49,'(page %%page%%/%%nb_pages%%)',NULL,'(página%%page%%/%%nb_pages%%)','cms',NULL),(50,'Edit',NULL,'Editar','cms',NULL),(51,'Delete',NULL,'Borrar','cms',NULL),(52,'Are you sure?',NULL,'Estás seguro?','cms',NULL),(53,'Choose an action',NULL,'Elija una acción','cms',NULL),(54,'go',NULL,'Go!','cms',NULL),(55,'New',NULL,'Nuevo','cms',NULL),(56,'Blog Posts',NULL,'Mensajes de blog','cms',NULL),(57,'Reset',NULL,'Reajustar','cms',NULL),(58,'Filter',NULL,'Filtro','cms',NULL),(59,'No result',NULL,'Ningún resultado','cms',NULL),(60,'New Page',NULL,'Nueva página','cms',NULL),(61,'Content',NULL,'Contenido','cms',NULL),(62,'Включить редирект',NULL,'Habilitar la redirección','cms',NULL),(63,'Redirect route',NULL,'Redirigir a','cms',NULL),(64,'Redirect timeout',NULL,'Tiempo de espera de redirección','cms',NULL),(65,'Layout',NULL,'Disposición','cms',NULL),(66,'Meta title',NULL,'Título Meta','cms',NULL),(67,'Meta description',NULL,'Meta descripción','cms',NULL),(68,'Meta keywords',NULL,'Meta palabras clave','cms',NULL),(69,'Back to list',NULL,'Volver a la lista','cms',NULL),(70,'Save',NULL,'Guardar','cms',NULL),(71,'Save and add',NULL,'Guardar y añadir','cms',NULL),(72,'УРЛ-метка',NULL,'Etiqueta URL','cms',NULL),(73,'Edit Page',NULL,'Edite esta página','cms',NULL),(74,'User list',NULL,'Lista de Miembros','cms',NULL),(75,'Created at',NULL,'Creado en','cms',NULL),(76,'Updated at',NULL,'Actualizado en','cms',NULL),(77,'Last login',NULL,'Último ingreso','cms',NULL),(78,'user',NULL,'Usuario','cms',NULL),(79,'New User',NULL,'Nuevo usuario','cms',NULL),(80,'User',NULL,'Usuario','cms',NULL),(81,'First name',NULL,'Nombre de pila','cms',NULL),(82,'Last name',NULL,'Apellido','cms',NULL),(83,'Email address',NULL,'E por correo electrónico','cms',NULL),(84,'Password (again)',NULL,'Contraseña (de nuevo)','cms',NULL),(85,'Permissions',NULL,'Permisos','cms',NULL),(86,'Is active',NULL,'Es activo','cms',NULL),(87,'Is super admin',NULL,'Es super administrador','cms',NULL),(88,'Editing User \"%%username%%\"',NULL,'Editar \"%%username%%\"','cms',NULL),(89,'dictionary',NULL,'Diccionario','cms',NULL),(90,'Title',NULL,'Título','cms',NULL),(91,'Value',NULL,'Valor','cms',NULL),(92,'settings',NULL,'Ajustes','cms',NULL),(93,'Email template List',NULL,'Lista de plantillas de correo electrónico','cms',NULL),(94,'Id',NULL,'Identificación','cms',NULL),(95,'Subject',NULL,'Tema','cms',NULL),(96,'Message',NULL,'Mensaje','cms',NULL),(98,'Edit Email template',NULL,'Editar Plantilla de correo electrónico','cms',NULL),(99,'New Email template',NULL,'Nueva plantilla de correo electrónico','cms',NULL),(100,'Ваше имя',NULL,'Su nombre','frontend',NULL),(101,'Ваш Email',NULL,'Tu E-mail','frontend',NULL),(102,'Нужен для обратной связи',NULL,'Necesidad de retroalimentación','frontend',NULL),(103,'Ваше сообщение',NULL,'Tu mensaje','frontend',NULL),(104,'Reload image',NULL,'Refrescar imagen','frontend',NULL),(105,'Введите код с картинки',NULL,'Introduzca el código de la imagen','frontend',NULL),(106,'Показатели',NULL,'Indicadores','cms',NULL),(107,'Имя',NULL,'Nombre','cms',NULL),(108,'Email',NULL,'E-mail','cms',NULL),(109,'desc',NULL,'Descendente','cms',NULL),(110,'Просмотр',NULL,'Vista','cms',NULL),(111,'Создать пользователя',NULL,'Crear usuario','cms',NULL),(112,'Export',NULL,'Exportación','cms',NULL),(113,'The item was updated successfully.',NULL,'Este artículo se ha actualizado correctamente.','cms',NULL),(114,'Неверный формат',NULL,'Formato no válido','frontend',NULL),(115,'System settings',NULL,'Configuración del sistema','cms',NULL),(116,'Section',NULL,'Sección','cms',NULL),(118,'Email error List',NULL,'Email lista de errores','cms',NULL),(119,'Email from',NULL,'¿De quién','cms',NULL),(120,'Email to',NULL,'A quien','cms',NULL),(121,'Body',NULL,'Cuerpo','cms',NULL),(122,'Cc',NULL,'Copia','cms',NULL),(123,'File',NULL,'Expediente','cms',NULL),(132,'Filters',NULL,'Filtro','cms',NULL),(133,'is empty',NULL,'Vacío','cms',NULL),(134,'Мой профиль',NULL,'Mi Perfil','frontend',NULL),(135,'Фотография',NULL,'Foto','frontend',NULL),(136,'Изменить пароль',NULL,'Cambiar la contraseña','frontend',NULL),(137,'Отчество',NULL,'Patronímico','frontend',NULL),(138,'Фамилия',NULL,'Apellido','frontend',NULL),(139,'Дата рождения\n(дд.мм.гггг)',NULL,'Fecha de nacimiento','frontend',NULL),(140,'Телефон мобильный\n(для получения уведомлений)',NULL,'Teléfono móvil (para la notificación)','frontend',NULL),(141,'Сохранить изменения',NULL,'Guardar cambios','frontend',NULL),(142,'Старый пароль',NULL,'Contraseña anterior','frontend',NULL),(143,'Новый пароль',NULL,'Nueva contraseña','frontend',NULL),(144,'Новый пароль еще раз',NULL,'Nueva contraseña de nuevo','frontend',NULL),(145,'Сохранить пароль',NULL,'Guardar contraseña','frontend',NULL),(146,'Заполните поле',NULL,'Rellene el campo','frontend',NULL),(147,'Passwords do not match',NULL,'Las contraseñas no coinciden','frontend',NULL),(148,'Выберите картинку из загрузите ее',NULL,'Seleccione una imagen y cargarla','frontend',NULL),(149,'Image',NULL,'Imagen','frontend',NULL),(150,'Загрузить фотографию',NULL,'Subir una imagen','frontend',NULL),(151,'File is too large (maximum is %max_size% bytes).',NULL,'El archivo es demasiado grande (%max_size máxima%).','frontend',NULL),(152,'Вы можете выбрать зону, которая будет отображаться на ваших аватарках. Кликните по одному из изображений справа',NULL,'Usted puede seleccionar el área que se muestra en las imágenes. Haga clic en una de las pequeñas imágenes a la derecha','frontend',NULL),(153,'remove the current file',NULL,'Elimine el archivo actual','frontend',NULL),(154,'Сохранить',NULL,'Guardar','frontend',NULL),(155,'Вы уверены?',NULL,'Estás seguro?','frontend',NULL),(156,'Удалить фотографию',NULL,'Eliminar imagen','frontend',NULL),(157,'Логин (Ваш Email)',NULL,'Nombre de usuario (su correo electrónico)','frontend',NULL),(158,'Запомнить меня на этом компьютере',NULL,'Recordarme en este equipo','frontend',NULL),(159,'Войти',NULL,'Login','frontend',NULL),(160,'Забыли пароль?',NULL,'¿Olvidaste tu contraseña?','frontend',NULL),(161,'Registration',NULL,'Registro','frontend',NULL),(162,'The username and/or password is invalid.',NULL,'Usuario o contraseña incorrecta','frontend',NULL),(163,'Введите код',NULL,'Introduzca el código','frontend',NULL),(164,'Письмо отправлено',NULL,'El correo electrónico enviado','frontend',NULL),(165,'Ваш email',NULL,'Su correo electrónico','frontend',NULL),(166,'Восстановить пароль',NULL,'Recuperar contraseña','frontend',NULL),(167,'Повторите пароль',NULL,'Confirmar Contraseña','frontend',NULL),(168,'Я принимаю условия',NULL,'Acepto las condiciones','frontend',NULL),(169,'Такой email уже зарегистрирован в ситеме',NULL,'Esta dirección de correo electrónico ya está registrada en el sistema','frontend',NULL),(170,'Пароли не совпадают',NULL,'Las contraseñas no coinciden','frontend',NULL),(171,'Вы должны принять условия пользовательского соглашения',NULL,'Debe aceptar las condiciones del servicio','frontend',NULL),(172,'Пароль должен быть не короче 4 символов',NULL,'La contraseña debe tener al menos 4 caracteres de longitud','frontend',NULL),(173,'Еще раз пароль',NULL,'Confirme su contraseña','frontend',NULL),(174,'Сменить пароль',NULL,'Cambiar la contraseña','frontend',NULL),(175,'Пароль слишком короткий',NULL,'La contraseña es demasiado corta','frontend',NULL),(176,'Пароль восстановлен',NULL,'Contraseña recuperar','frontend',NULL),(177,'Password is invalid.',NULL,'Contraseña no válida','frontend',NULL),(178,'События за сегодня',NULL,'Eventos para hoy','cms',NULL),(179,'Всего событий',NULL,'Total de Eventos','cms',NULL),(180,'All rights reserved',NULL,'Reservados todos los derechos','cms',NULL),(181,'Date',NULL,'Fecha','cms',NULL),(182,'Is published',NULL,'Publicado','cms',NULL),(183,'yes or no',NULL,'Sí o no','cms',NULL),(184,'yes',NULL,'Sí','cms',NULL),(185,'no',NULL,'No','cms',NULL),(186,'From',NULL,'Desde','cms',NULL),(187,'To',NULL,'A','cms',NULL),(188,'New Blog post',NULL,'Nueva entrada en el blog','cms',NULL),(189,'Brief',NULL,'Brevemente','cms',NULL),(190,'Text',NULL,'Texto','cms',NULL),(191,'Url',NULL,'URL','cms',NULL),(193,'пользовательского соглашения',NULL,'Acuerdo del usuario','frontend',NULL),(194,'The item was created successfully.',NULL,'Este artículo se ha creado correctamente.','cms',NULL),(195,'You don\'t have proper credentials to access this page',NULL,'Usted no tiene las credenciales adecuadas para acceder a esta página','cms',NULL),(197,'Secure',NULL,'Un Foro Cerrado','cms',NULL),(210,'Server is not responding',NULL,'El servidor no responde','cms',NULL),(211,'Data saved',NULL,'Los datos guardados','cms',NULL),(212,'Error while saving data',NULL,'Error en los datos de ahorro','cms',NULL),(217,'Unexpected extra form field named \"%field%\".',NULL,'Inesperado campo de formulario adicional llamado \"campo%%\".','cms',NULL),(221,'Вы можете править текст прямо в списке. Исправьте все, что считаете нужным, а затем нажмите TAB или щелкните мышью в любом месте вне поля ввода.',NULL,'Puede editar el texto directamente en la lista. Corrija todas las que apliquen, a continuación, presione TAB o haga clic en cualquier lugar fuera del campo de entrada.','cms',NULL),(222,'Воспользуйтесь фильтром, чтобы найти нужный вам текст',NULL,'Utilice el filtro para encontrar el texto deseado','cms',NULL),(223,'Отправить',NULL,'Enviar','frontend',NULL),(224,'The item has not been saved due to some errors.',NULL,'El objeto no se salvó debido a algunos errores','cms',NULL),(225,'An object with the same \"%column%\" already exist.',NULL,'El objeto con el valor del campo \"columna de%%\" ya existe en el sistema.','cms',NULL),(226,'Update',NULL,'Actualización','cms',NULL),(235,'Страницы',NULL,'Página','cms',NULL),(236,'Пользователи',NULL,'Usuarios','cms',NULL),(237,'Настройки',NULL,'Ajustes','cms',NULL),(238,'Редирект 301',NULL,'301s','cms',NULL),(239,'Уведомления',NULL,'Aviso','cms',NULL),(241,'Url from',NULL,'¿de dónde','cms',NULL),(242,'Url to',NULL,'Donde','cms',NULL),(243,'Comment',NULL,'Descripción','cms',NULL),(245,'from %from_date%<br />to %to_date%',NULL,'De %from_date% a %to_date%','cms',NULL),(246,'Checked',NULL,'Conocido','cms',NULL),(248,'You must at least select one item.',NULL,'Debe seleccionar al menos un objeto','cms',NULL),(249,'blog_post',NULL,'Post de blog','cms',NULL),(250,'Extra',NULL,'Además','cms',NULL),(251,'Edit Blog post',NULL,'Edición de una entrada de blog','cms',NULL),(252,'The begin date must be before the end date.',NULL,'Fecha de inicio debe ser menor que la fecha de finalización','cms',NULL),(257,'%%title%%',NULL,'%%title%%','cms',NULL),(258,'Email администратора',NULL,'Administrador Correo electrónico','cms',NULL),(259,'На этот адрес вам будут приходить сообщения с сайта',NULL,'En esta dirección va a recibir mensajes desde el sitio','cms',NULL),(260,'Имя отправителя почты',NULL,'Email nombre del remitente','cms',NULL),(261,'От этого имени сайт будет отправлять почту',NULL,'Todos los correos electrónicos serán enviados en nombre de ese nombre','cms',NULL),(263,'Адрес',NULL,'Dirección','cms',NULL),(264,'Контактный телефон',NULL,'Teléfono del contacto','cms',NULL),(265,'Контактный email',NULL,'Email de contacto','cms',NULL),(266,'Type',NULL,'Tipo','cms',NULL),(267,'Description',NULL,'Descripción','cms',NULL),(268,'Admin email',NULL,'Correo electrónico al administrador','cms',NULL),(269,'User email',NULL,'Correo electrónico para el usuario','cms',NULL),(270,'Phone number',NULL,'Número telefónico','cms',NULL),(271,'Company name',NULL,'Nombre de empresa','cms',NULL),(272,'Attach',NULL,'Archivo adjunto','cms',NULL),(275,'Show',NULL,'Show','cms',NULL),(279,'Password recovery',NULL,'Recuperar la contraseña','cms',NULL),(281,'Registration',NULL,'Registro','cms',NULL),(283,'Page',NULL,'Página','cms',NULL),(284,'Описание',NULL,'Descripción','cms',NULL),(285,'redirect301',NULL,'301s','cms',NULL),(287,'email_template',NULL,'Plantillas de correo electrónico','cms',NULL),(288,'Имя',NULL,'Nombre de pila','frontend',NULL),(289,'Email',NULL,'Correo electrónico','frontend',NULL),(290,'Invalid mime type (%mime_type%).',NULL,'Formato de archivo incorrecto (%mime_type%).','frontend',NULL),(291,'Password',NULL,'Contraseña','frontend',NULL),(292,'Регистрация',NULL,'Registro','frontend',NULL),(293,'ссылке',NULL,'Enlace','frontend',NULL),(295,'Notifications',NULL,'Notificaciones','cms',NULL),(296,'Pages',NULL,'Páginas','cms',NULL),(297,'Apply',NULL,'Aplicar','frontend',NULL),(298,'Discard',NULL,'Cancelar','frontend',NULL),(299,'Данные сохранены',NULL,'Los cambios guardados!','frontend',NULL),(301,'Изображение удалено',NULL,'Imagen eliminado','frontend',NULL),(303,'Код введен неверно',NULL,'El código que ha introducido no es válido','frontend',NULL),(304,'Такой email не зарегистрирован в системе',NULL,'Esta dirección de correo electrónico no está registrada en el sistema','frontend',NULL),(305,' csrf token',NULL,'Token CSRF','frontend',NULL),(306,'The item was deleted successfully.',NULL,'El tema se ha eliminado correctamente.','cms',NULL),(307,'You must select an action to execute on the selected items.',NULL,'Usted debe seleccionar una acción a ejecutar en los elementos seleccionados.','cms',NULL),(308,'The selected items have been deleted successfully.',NULL,'Los elementos seleccionados se han eliminado con éxito.','cms',NULL),(310,'Cообщения с сайта',NULL,'Mensajes del sitio','cms',NULL),(311,'Да, это мой email-аккаунт!',NULL,'Sí, esta es mi cuenta de correo electrónico!','frontend',NULL),(312,'Подтвердить email аккаунт!',NULL,'Confirme cuenta de correo electrónico!','frontend',NULL),(313,'Подтверждаю!',NULL,'De acuerdo!','frontend',NULL),(314,'Войти с помощью:',NULL,'Ingresar con:','frontend',NULL);
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
INSERT INTO `menu_item` (`id`, `name`, `root_name`, `type`, `page_id`, `cms_module_id`, `route`, `external`, `is_empty`, `is_auth`, `icon_class`, `root_id`, `lft`, `rgt`, `level`) VALUES (1,'Menú Principal','main','empty',NULL,NULL,NULL,NULL,1,0,NULL,1,1,52,0),(2,'Casa','','route',1,NULL,'homepage','',1,0,NULL,1,1,1,1),(3,'Sobre nosotros',NULL,'page',2,NULL,NULL,NULL,1,0,NULL,1,44,45,1),(4,'Contactos',NULL,'module',3,2,'','',1,0,NULL,1,46,47,1),(5,'Un Foro Cerrado',NULL,'page',14,NULL,'','',1,1,'',1,50,51,1),(6,'Menú Pie de página','bottom','empty',NULL,NULL,NULL,NULL,1,0,NULL,6,6,NULL,0),(7,'Política de privacidad',NULL,'page',13,NULL,'','',1,0,'',6,6,5,1),(8,'Acuerdo del usuario',NULL,'page',12,NULL,'','',1,0,'',6,6,5,1);
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
INSERT INTO `email_template` (`id`, `name`, `subject`, `message`) VALUES (1,'registration_user','Registrar en el proyecto DEV2','Hola, {%FIRST_NAME%}! Usted ha sido registrado correctamente! Siga este enlace%{%}, para activar su cuenta!'),(2,'registration_admin','Registrar una cuenta nueva','Usuario {%}%FULL_NAME registrado con nosotros!'),(3,'password_recovery_user','Recuperar la contraseña','Buen día, {%FULL_NAME%} que ha requerido de recuperación de contraseña en proyecto disp2. Siga este {%ENLACE%} para establecer una nueva contraseña. Si no ha solicitado la recuperación de la contraseña, por favor ignorar esta carta.'),(4,'contactus_message_user','DEV2 Proyecto. Su mensaje es importante para nosotros!','Estimado {%nombre%}! Gracias por tu mensaje! Es muy importante para nosotros!'),(5,'contactus_message_admin','DEV2 Proyecto. nuevo mensaje','Alguien {nombre}%%envió un mensaje. Texto: {%}%de mensajes de E-Mail: {%email%}'),(6,'social_bridge_user_confirm_email_user','Demo.web375.org - Confirme su dirección de correo electrónico en la red social {%network_name%}','Confirmar correo electrónico {%email%}, siga el enlace {%link%} o utilizar este código {%token%}');
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

-- Dump completed on 2014-11-05 20:22:15

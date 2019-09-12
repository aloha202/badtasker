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
INSERT INTO `page` (`id`, `name`, `content`, `is_module_page`, `module_name`, `is_content_editable`, `special_mark`, `is_redirect`, `redirect_route`, `redirect_timeout`, `layout`, `slug`, `meta_title`, `meta_description`, `meta_keywords`) VALUES (1,'Bem-vindo!','Saudações a você, jovem amigo! Você veio a este site, porque você mesmo precisa de um site. Ou talvez você só veio aqui por acaso! De qualquer forma, bem-vindo!',1,'default',1,'default',0,'/',5,'','bem-vindo','Bem vindo ao site da DEV2 projeto!','',''),(2,'Sobre nós','Somos uma empresa jovem, mas já muito experiente envolvida no desenvolvimento e promoção de sítios web',0,NULL,1,NULL,0,'/',5,'','sobre-nos','Sobre o projeto','',''),(3,'Qualificações','Envie-nos uma mensagem e nós entraremos em contato com você o mais breve possível!',0,NULL,1,'contactus',0,'/',5,'','qualificacoes','Fale Conosco - Projeto DEV2','',''),(4,'Registro','',0,NULL,0,'register',0,'/',5,NULL,'registro','Registro','',''),(5,'Recuperação de senha','Clique em \"Recuperar Senha\" e nós enviaremos um e-mail para a sua conta de e-mail que vai ligar para a página de recuperação de password',0,NULL,1,'auth_forgot_password',0,'/',5,NULL,'recuperacao-de-senha','Recuperação de senha','',''),(6,'Recuperação de senha. E-mail enviado.','E-mail foi enviado para sua conta de e-mail',0,NULL,1,'auth_forgot_password_thanks',1,'/',5,'','recuperacao-de-senha-e-mail-enviado','Recuperação de senha. E-mail enviado.','',''),(7,'Recuperação de senha. SMS enviado','',0,NULL,1,'auth_forgot_sms',0,'/',5,NULL,'recuperacao-de-senha-sms-enviado','Recuperação de senha. SMS enviado','',''),(8,'Invente uma nova senha','',0,NULL,1,'auth_password_recovery',0,'/',5,NULL,'invente-uma-nova-senha','Invente uma nova senha','',''),(9,'Sua área pessoal','',0,NULL,1,'auth_signin',0,'/',5,NULL,'sua-area-pessoal','Sua área pessoal','',''),(10,'Registo é passado','Enviámos uma mensagem mais instruções de inscrição para o seu endereço de e-mail',0,NULL,1,'auth_registration_complete',1,'/',5,NULL,'registo-e-passado','Registo é passado','',''),(11,'A activação é passado','Agora você pode fazer o login!',0,NULL,1,'auth_activation_successful',1,'/profile',3,'','a-activacao-e-passado','A activação é passado','',''),(12,'Contrato de Usuário','Aqui está um acordo de usuário absolutamente típico',0,NULL,1,'user_agreement',0,'/',5,'','contrato-de-usuario','Contrato de Usuário','',''),(13,'Política de Privacidade','Aqui está uma página absolutamente típico sobre a política de privacidade',0,NULL,1,'privacy_policy',0,'/',5,'','politica-de-privacidade','Política de Privacidade','',''),(14,'A Forum Closed','Se você se deparar com essa página, isso significa que você é um usuário autorizado!',0,NULL,1,NULL,0,'/',5,NULL,'a-forum-closed','A Forum Closed','',''),(15,'Esta é uma página de teste','',0,NULL,1,NULL,0,'/',5,'','esta-e-uma-pagina-de-teste','Esta é uma página de teste','',''),(16,'Erro 404','Erro 404. Página não encontrada',0,NULL,1,'error404',0,'/',5,NULL,'erro-404','Erro 404','',''),(17,'Meu Perfil','Aqui você pode editar suas informações pessoais, fazer upload de uma foto e alterar a senha',0,NULL,0,'profile',0,'/',5,NULL,'meu-perfil','Meu Perfil','',''),(18,'Meu perfil - Alterar senha','Nós armazenamos sua senha de forma criptografada.',0,NULL,0,'profile_password',0,'/',5,NULL,'meu-perfil-alterar-senha','Meu perfil - Alterar senha','',''),(19,'Meu perfil - Editar foto','',0,NULL,0,'profile_avatar',0,'/',5,NULL,'meu-perfil-editar-foto','Meu perfil - Editar foto','',''),(20,'Endereço IP é bloqueado','Infelizmente, por razões pouco claras, o seu endereço foi bloqueado! Obrigado!',0,NULL,1,'ip_banned',0,'/',5,'empty','endereco-ip-e-bloqueado','Endereço IP é bloqueado','',''),(21,'Por favor registre-se ou login','Para ver o conteúdo desta seção, faça seu login',0,NULL,1,'auth_secure',0,'/',5,NULL,'por-favor-registre-se-ou-login','Por favor registre-se ou login','',''),(22,'Confirmation of account in socConfirm your social networks accountial networks','Atenção! E-mail {%email%} já existe no sistema! Se este é o seu e-mail, confirme-a!',0,NULL,1,'oauth_bridge',0,'/',5,NULL,'confirmation-of-account-in-socconfirm-your-social-networks-accountial-networks','Confirme a sua conta de redes sociais','',''),(23,'Confirme a sua conta de redes sociais. a segunda etapa','Carta de confirmação foi enviado para seu endereço de e-mail {%email%}',0,NULL,1,'oauth_bridge_confirm',0,'/',5,NULL,'confirme-a-sua-conta-de-redes-sociais-a-segunda-etapa','Confirme a sua conta de redes sociais','',''),(24,'Erro de autorização OAuth','',0,NULL,1,'oauth_error',0,'/',5,NULL,'erro-de-autorizacao-oauth','Erro de autorização OAuth','','');
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
INSERT INTO `text_block` (`id`, `name`, `title`, `text`, `application`, `module`) VALUES (1,'Username',NULL,'Nome de Usuário','cms',NULL),(2,'Password',NULL,'Senha','cms',NULL),(3,'Remember?',NULL,'Lembre de mim?','cms',NULL),(4,'Login',NULL,'Login','cms',NULL),(5,'Welcome to',NULL,'Bem-vindo','cms',NULL),(6,'Use a valid username and password to gain access to the administration console.',NULL,'Use um nome de usuário e senha válidos para ter acesso ao console de administração.','cms',NULL),(7,'Вход',NULL,'Login','frontend',NULL),(8,'Ваша компания',NULL,'Sua Empresa','frontend',NULL),(9,'Разработка и поддержка',NULL,'Desenvolvimento e apoio','frontend',NULL),(11,'Blog',NULL,'Blog','cms',NULL),(12,'Posts',NULL,'Mensagens','cms',NULL),(13,'Comments',NULL,'Comentários','cms',NULL),(14,'Tags',NULL,'Etiquetas','cms',NULL),(15,'Users',NULL,'Usuários','cms',NULL),(16,'Settings',NULL,'Configurações','cms',NULL),(18,'Email шаблоны',NULL,'Modelos de email','cms',NULL),(21,'Сообщения',NULL,'Mensagens','cms',NULL),(28,'Локализация',NULL,'Localização','cms',NULL),(33,'Добавить',NULL,'Adicionar','cms',NULL),(34,'Go to Frontend',NULL,'Ir para o site','cms',NULL),(35,'Logout',NULL,'Saída','cms',NULL),(36,'dashboard',NULL,'Painel de instrumentos','cms',NULL),(37,'Профиль',NULL,'Perfil','frontend',NULL),(38,'Выход',NULL,'Saída','frontend',NULL),(39,'Админка',NULL,'Administrador','frontend',NULL),(40,'Page List',NULL,'Lista de Páginas','cms',NULL),(41,'Name',NULL,'Título','cms',NULL),(42,'Slug',NULL,'URL','cms',NULL),(43,'Actions',NULL,'Ações','cms',NULL),(44,'First page',NULL,'Primeira página','cms',NULL),(45,'Previous page',NULL,'Página Anterior','cms',NULL),(46,'Next page',NULL,'Próxima página','cms',NULL),(47,'Last page',NULL,'Última página','cms',NULL),(48,'[0] no result|[1] 1 result|(1,+Inf] %1% results',NULL,'[0] nenhum resultado|[1] 1 resultado|(1,+Inf] %1% de resultados','cms',NULL),(49,'(page %%page%%/%%nb_pages%%)',NULL,'(página%%page%%/%%nb_pages%%)','cms',NULL),(50,'Edit',NULL,'Editar','cms',NULL),(51,'Delete',NULL,'Excluir','cms',NULL),(52,'Are you sure?',NULL,'Você tem certeza?','cms',NULL),(53,'Choose an action',NULL,'Escolha uma ação','cms',NULL),(54,'go',NULL,'Go!','cms',NULL),(55,'New',NULL,'Novo','cms',NULL),(56,'Blog Posts',NULL,'Posts de Blog','cms',NULL),(57,'Reset',NULL,'Restabelecer','cms',NULL),(58,'Filter',NULL,'Filtro','cms',NULL),(59,'No result',NULL,'Nenhum resultado','cms',NULL),(60,'New Page',NULL,'Nova página','cms',NULL),(61,'Content',NULL,'Conteúdo','cms',NULL),(62,'Включить редирект',NULL,'Ativar o redirecionamento','cms',NULL),(63,'Redirect route',NULL,'Redirecionar para','cms',NULL),(64,'Redirect timeout',NULL,'Redirecionamento de tempo limite','cms',NULL),(65,'Layout',NULL,'Traçado','cms',NULL),(66,'Meta title',NULL,'Meta título','cms',NULL),(67,'Meta description',NULL,'Meta descrição','cms',NULL),(68,'Meta keywords',NULL,'Meta palavras-chave','cms',NULL),(69,'Back to list',NULL,'Voltar à lista','cms',NULL),(70,'Save',NULL,'Salvar','cms',NULL),(71,'Save and add',NULL,'Salvar e adicionar','cms',NULL),(72,'УРЛ-метка',NULL,'Tag URL','cms',NULL),(73,'Edit Page',NULL,'Editar esta página','cms',NULL),(74,'User list',NULL,'Lista de membros','cms',NULL),(75,'Created at',NULL,'Criado em','cms',NULL),(76,'Updated at',NULL,'Atualizado em','cms',NULL),(77,'Last login',NULL,'Último login','cms',NULL),(78,'user',NULL,'Usuário','cms',NULL),(79,'New User',NULL,'Novo usuário','cms',NULL),(80,'User',NULL,'Usuário','cms',NULL),(81,'First name',NULL,'Primeiro nome','cms',NULL),(82,'Last name',NULL,'Sobrenome','cms',NULL),(83,'Email address',NULL,'E-mail','cms',NULL),(84,'Password (again)',NULL,'Senha (novamente)','cms',NULL),(85,'Permissions',NULL,'Permissão','cms',NULL),(86,'Is active',NULL,'Está ativo','cms',NULL),(87,'Is super admin',NULL,'É super administrador','cms',NULL),(88,'Editing User \"%%username%%\"',NULL,'Edit \"%%%username%%\"','cms',NULL),(89,'dictionary',NULL,'Dicionário','cms',NULL),(90,'Title',NULL,'Título','cms',NULL),(91,'Value',NULL,'Valor','cms',NULL),(92,'settings',NULL,'Configurações','cms',NULL),(93,'Email template List',NULL,'Lista de modelos de E-mail','cms',NULL),(94,'Id',NULL,'Identidade','cms',NULL),(95,'Subject',NULL,'Tópico','cms',NULL),(96,'Message',NULL,'Mensagem','cms',NULL),(98,'Edit Email template',NULL,'Editar Email Template','cms',NULL),(99,'New Email template',NULL,'Novo modelo Email','cms',NULL),(100,'Ваше имя',NULL,'Seu nome','frontend',NULL),(101,'Ваш Email',NULL,'Seu E-mail','frontend',NULL),(102,'Нужен для обратной связи',NULL,'Necessidade de retorno','frontend',NULL),(103,'Ваше сообщение',NULL,'Sua mensagem','frontend',NULL),(104,'Reload image',NULL,'Atualizar Imagem','frontend',NULL),(105,'Введите код с картинки',NULL,'Digite o código da imagem','frontend',NULL),(106,'Показатели',NULL,'Indicadores','cms',NULL),(107,'Имя',NULL,'Nome','cms',NULL),(108,'Email',NULL,'E-mail','cms',NULL),(109,'desc',NULL,'Descendente','cms',NULL),(110,'Просмотр',NULL,'Vista','cms',NULL),(111,'Создать пользователя',NULL,'Criar Usuário','cms',NULL),(112,'Export',NULL,'Exportação','cms',NULL),(113,'The item was updated successfully.',NULL,'Este artigo foi atualizado com sucesso.','cms',NULL),(114,'Неверный формат',NULL,'Formato inválido','frontend',NULL),(115,'System settings',NULL,'Configurações do sistema','cms',NULL),(116,'Section',NULL,'Seção','cms',NULL),(118,'Email error List',NULL,'Lista de erros e-mail','cms',NULL),(119,'Email from',NULL,'De quem','cms',NULL),(120,'Email to',NULL,'A quem','cms',NULL),(121,'Body',NULL,'Corpo','cms',NULL),(122,'Cc',NULL,'Cópia','cms',NULL),(123,'File',NULL,'Arquivo','cms',NULL),(132,'Filters',NULL,'Filtro','cms',NULL),(133,'is empty',NULL,'Vazio','cms',NULL),(134,'Мой профиль',NULL,'Meu Perfil','frontend',NULL),(135,'Фотография',NULL,'Foto','frontend',NULL),(136,'Изменить пароль',NULL,'Alterar a senha','frontend',NULL),(137,'Отчество',NULL,'Patronímico','frontend',NULL),(138,'Фамилия',NULL,'Sobrenome','frontend',NULL),(139,'Дата рождения\n(дд.мм.гггг)',NULL,'DOB','frontend',NULL),(140,'Телефон мобильный\n(для получения уведомлений)',NULL,'Telefone celular (para notificação)','frontend',NULL),(141,'Сохранить изменения',NULL,'Salvar alterações','frontend',NULL),(142,'Старый пароль',NULL,'Senha Antiga','frontend',NULL),(143,'Новый пароль',NULL,'Nova Senha','frontend',NULL),(144,'Новый пароль еще раз',NULL,'Nova senha novamente','frontend',NULL),(145,'Сохранить пароль',NULL,'Salvar senha','frontend',NULL),(146,'Заполните поле',NULL,'Preencha o campo','frontend',NULL),(147,'Passwords do not match',NULL,'Senhas não conferem','frontend',NULL),(148,'Выберите картинку из загрузите ее',NULL,'Selecione uma imagem e enviá-lo','frontend',NULL),(149,'Image',NULL,'Imagem','frontend',NULL),(150,'Загрузить фотографию',NULL,'Carregar uma imagem','frontend',NULL),(151,'File is too large (maximum is %max_size% bytes).',NULL,'O arquivo é muito grande (máximo%max_size%).','frontend',NULL),(152,'Вы можете выбрать зону, которая будет отображаться на ваших аватарках. Кликните по одному из изображений справа',NULL,'Você pode selecionar a área a ser exibidos em suas imagens. Clique em uma das imagens pequenas para a direita','frontend',NULL),(153,'remove the current file',NULL,'Exclua o arquivo atual','frontend',NULL),(154,'Сохранить',NULL,'Salvar','frontend',NULL),(155,'Вы уверены?',NULL,'Você tem certeza?','frontend',NULL),(156,'Удалить фотографию',NULL,'Apagar imagem','frontend',NULL),(157,'Логин (Ваш Email)',NULL,'Nome de usuário (Seu e-mail)','frontend',NULL),(158,'Запомнить меня на этом компьютере',NULL,'Lembre-se de mim neste computador','frontend',NULL),(159,'Войти',NULL,'Login','frontend',NULL),(160,'Забыли пароль?',NULL,'Esqueceu sua senha?','frontend',NULL),(161,'Registration',NULL,'Registro','frontend',NULL),(162,'The username and/or password is invalid.',NULL,'De login ou senha incorreta','frontend',NULL),(163,'Введите код',NULL,'Digite o código','frontend',NULL),(164,'Письмо отправлено',NULL,'E-mail enviado','frontend',NULL),(165,'Ваш email',NULL,'Seu e-mail','frontend',NULL),(166,'Восстановить пароль',NULL,'Recuperar password','frontend',NULL),(167,'Повторите пароль',NULL,'Confirme sua senha','frontend',NULL),(168,'Я принимаю условия',NULL,'Aceito as condições','frontend',NULL),(169,'Такой email уже зарегистрирован в ситеме',NULL,'Este e-mail já está cadastrado no sistema','frontend',NULL),(170,'Пароли не совпадают',NULL,'Senhas não conferem','frontend',NULL),(171,'Вы должны принять условия пользовательского соглашения',NULL,'Você deve aceitar os Termos de Serviço','frontend',NULL),(172,'Пароль должен быть не короче 4 символов',NULL,'A senha deve ter no mínimo 4 caracteres','frontend',NULL),(173,'Еще раз пароль',NULL,'Confirme sua senha','frontend',NULL),(174,'Сменить пароль',NULL,'Alterar a senha','frontend',NULL),(175,'Пароль слишком короткий',NULL,'A senha é muito curta','frontend',NULL),(176,'Пароль восстановлен',NULL,'Senha recuperado','frontend',NULL),(177,'Password is invalid.',NULL,'Senha inválida','frontend',NULL),(178,'События за сегодня',NULL,'Eventos para hoje','cms',NULL),(179,'Всего событий',NULL,'Total de Eventos','cms',NULL),(180,'All rights reserved',NULL,'Todos os direitos reservados','cms',NULL),(181,'Date',NULL,'Data','cms',NULL),(182,'Is published',NULL,'Publicado','cms',NULL),(183,'yes or no',NULL,'Sim ou não','cms',NULL),(184,'yes',NULL,'Sim','cms',NULL),(185,'no',NULL,'Não','cms',NULL),(186,'From',NULL,'A partir de','cms',NULL),(187,'To',NULL,'A','cms',NULL),(188,'New Blog post',NULL,'Novo post no blog','cms',NULL),(189,'Brief',NULL,'Resumidamente','cms',NULL),(190,'Text',NULL,'Texto','cms',NULL),(191,'Url',NULL,'URL','cms',NULL),(193,'пользовательского соглашения',NULL,'Contrato de Usuário','frontend',NULL),(194,'The item was created successfully.',NULL,'Este artigo foi criado com sucesso.','cms',NULL),(195,'You don\'t have proper credentials to access this page',NULL,'Você não tem as credenciais adequadas para acessar esta página','cms',NULL),(197,'Secure',NULL,'A Forum Closed','cms',NULL),(210,'Server is not responding',NULL,'O servidor não está respondendo','cms',NULL),(211,'Data saved',NULL,'Dados salvos','cms',NULL),(212,'Error while saving data',NULL,'Erro guardar dados','cms',NULL),(217,'Unexpected extra form field named \"%field%\".',NULL,'Campo de formulário adicional inesperado chamado \"campo%%\".','cms',NULL),(221,'Вы можете править текст прямо в списке. Исправьте все, что считаете нужным, а затем нажмите TAB или щелкните мышью в любом месте вне поля ввода.',NULL,'Você pode editar o texto diretamente na lista. Corrija tudo que se aplica, em seguida, pressione TAB ou clique em qualquer lugar fora do campo de entrada.','cms',NULL),(222,'Воспользуйтесь фильтром, чтобы найти нужный вам текст',NULL,'Por favor, use o filtro para encontrar o texto desejado','cms',NULL),(223,'Отправить',NULL,'Enviar','frontend',NULL),(224,'The item has not been saved due to some errors.',NULL,'O objeto não foi poupada devido a alguns erros','cms',NULL),(225,'An object with the same \"%column%\" already exist.',NULL,'O objecto com o valor do campo \"%%coluna\" já existe no sistema.','cms',NULL),(226,'Update',NULL,'Atualizar','cms',NULL),(235,'Страницы',NULL,'Página','cms',NULL),(236,'Пользователи',NULL,'Usuários','cms',NULL),(237,'Настройки',NULL,'Configurações','cms',NULL),(238,'Редирект 301',NULL,'301s','cms',NULL),(239,'Уведомления',NULL,'Aviso','cms',NULL),(241,'Url from',NULL,'De onde','cms',NULL),(242,'Url to',NULL,'Onde','cms',NULL),(243,'Comment',NULL,'Descrição','cms',NULL),(245,'from %from_date%<br />to %to_date%',NULL,'Desde%from_date%para%to_date%','cms',NULL),(246,'Checked',NULL,'Notado','cms',NULL),(248,'You must at least select one item.',NULL,'Você deve selecionar pelo menos um objeto','cms',NULL),(249,'blog_post',NULL,'Blog post','cms',NULL),(250,'Extra',NULL,'Adicionalmente','cms',NULL),(251,'Edit Blog post',NULL,'Editar um post de blog','cms',NULL),(252,'The begin date must be before the end date.',NULL,'Data de início deve ser menor que a data final','cms',NULL),(257,'%%title%%',NULL,'%%title%%','cms',NULL),(258,'Email администратора',NULL,'Administrador de e-mail','cms',NULL),(259,'На этот адрес вам будут приходить сообщения с сайта',NULL,'Neste endereço você vai receber mensagens a partir do site','cms',NULL),(260,'Имя отправителя почты',NULL,'E-mail Nome do remetente','cms',NULL),(261,'От этого имени сайт будет отправлять почту',NULL,'Todos os e-mails serão enviados em nome desse nome','cms',NULL),(263,'Адрес',NULL,'Endereço','cms',NULL),(264,'Контактный телефон',NULL,'Telefone de contato','cms',NULL),(265,'Контактный email',NULL,'E-mail','cms',NULL),(266,'Type',NULL,'Tipo','cms',NULL),(267,'Description',NULL,'Descrição','cms',NULL),(268,'Admin email',NULL,'E-mail para o administrador','cms',NULL),(269,'User email',NULL,'E-mail para o usuário','cms',NULL),(270,'Phone number',NULL,'Número de telefone','cms',NULL),(271,'Company name',NULL,'Nome da empresa','cms',NULL),(272,'Attach',NULL,'Arquivo anexado','cms',NULL),(275,'Show',NULL,'Espetáculo','cms',NULL),(279,'Password recovery',NULL,'Recuperação de senha','cms',NULL),(281,'Registration',NULL,'Registro','cms',NULL),(283,'Page',NULL,'Página','cms',NULL),(284,'Описание',NULL,'Descrição','cms',NULL),(285,'redirect301',NULL,'301s','cms',NULL),(287,'email_template',NULL,'Modelos de email','cms',NULL),(288,'Имя',NULL,'Primeiro nome','frontend',NULL),(289,'Email',NULL,'Email','frontend',NULL),(290,'Invalid mime type (%mime_type%).',NULL,'Formato de arquivo incorreto (%mime_type%).','frontend',NULL),(291,'Password',NULL,'Senha','frontend',NULL),(292,'Регистрация',NULL,'Registro','frontend',NULL),(293,'ссылке',NULL,'Link','frontend',NULL),(295,'Notifications',NULL,'Notificações','cms',NULL),(296,'Pages',NULL,'Páginas','cms',NULL),(297,'Apply',NULL,'Aplicar','frontend',NULL),(298,'Discard',NULL,'Cancelar','frontend',NULL),(299,'Данные сохранены',NULL,'Alterações salvo!','frontend',NULL),(301,'Изображение удалено',NULL,'Imagem retirada','frontend',NULL),(303,'Код введен неверно',NULL,'O código digitado é inválido','frontend',NULL),(304,'Такой email не зарегистрирован в системе',NULL,'Este e-mail não está cadastrado no sistema','frontend',NULL),(305,' csrf token',NULL,'Token de CSRF','frontend',NULL),(306,'The item was deleted successfully.',NULL,'O item foi excluído com sucesso.','cms',NULL),(307,'You must select an action to execute on the selected items.',NULL,'Você deve selecionar uma ação para executar sobre os itens selecionados.','cms',NULL),(308,'The selected items have been deleted successfully.',NULL,'Os itens selecionados foram apagados com sucesso.','cms',NULL),(310,'Cообщения с сайта',NULL,'Mensagens do site','cms',NULL),(311,'Да, это мой email-аккаунт!',NULL,'Sim, esta é a minha conta de e-mail!','frontend',NULL),(312,'Подтвердить email аккаунт!',NULL,'Confirme conta de e-mail!','frontend',NULL),(313,'Подтверждаю!',NULL,'Concordo!','frontend',NULL),(314,'Войти с помощью:',NULL,'Entrar com:','frontend',NULL);
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
INSERT INTO `menu_item` (`id`, `name`, `root_name`, `type`, `page_id`, `cms_module_id`, `route`, `external`, `is_empty`, `is_auth`, `icon_class`, `root_id`, `lft`, `rgt`, `level`) VALUES (1,'Menu Principal','main','empty',NULL,NULL,NULL,NULL,1,0,NULL,1,1,52,0),(2,'Casa','','route',1,NULL,'homepage','',1,0,NULL,1,1,1,1),(3,'Sobre nós',NULL,'page',2,NULL,NULL,NULL,1,0,NULL,1,44,45,1),(4,'Contactos',NULL,'module',3,2,'','',1,0,NULL,1,46,47,1),(5,'A Forum Closed',NULL,'page',14,NULL,'','',1,1,'',1,50,51,1),(6,'Menu Rodapé','bottom','empty',NULL,NULL,NULL,NULL,1,0,NULL,6,6,NULL,0),(7,'Política de Privacidade',NULL,'page',13,NULL,'','',1,0,'',6,6,5,1),(8,'Contrato de Usuário',NULL,'page',12,NULL,'','',1,0,'',6,6,5,1);
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
INSERT INTO `email_template` (`id`, `name`, `subject`, `message`) VALUES (1,'registration_user','Registre-se no projeto DEV2','Olá, {%primeiro_nome%}! Você foi registrado com sucesso! Siga este link {%}%, para ativar sua conta!'),(2,'registration_admin','Registar uma nova conta','Usuário {%}%full_name registrado conosco!'),(3,'password_recovery_user','Recuperação de senha','Bom dia, {%full_name%} Você pediu recuperação de senha no projeto Dev2. Siga este link {%%} para definir uma nova senha. Se você não solicitou a recuperação de senha, por favor ignore esta carta.'),(4,'contactus_message_user','Projeto DEV2. Sua mensagem é importante para nós!','Caro {}%name%! Obrigado por sua mensagem! É muito importante para nós!'),(5,'contactus_message_admin','Projeto DEV2. nova mensagem','Alguém {name%%} enviou uma mensagem. Texto: {%%} mensagem de E-Mail: {%email%}'),(6,'social_bridge_user_confirm_email_user','Demo.web375.org - Confirme o seu endereço de e-mail na rede social {%network_name%}','Confirmar e-mail {%email%}, siga o elo {%link%} ou usar este código de  {%token%}');
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

-- Dump completed on 2014-11-05 20:23:26

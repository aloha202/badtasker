<?php

//Корневая директория сайта
define('DIR_ROOT',		dirname(__FILE__)."/../../../../../../../");
//Директория с изображениями (относительно корневой)
define('DIR_IMAGES',	'/uploads/images');
//Директория с файлами (относительно корневой)
define('DIR_FILES',		'/uploads/images');


//Высота и ширина картинки до которой будет сжато исходное изображение и создана ссылка на полную версию
define('WIDTH_TO_LINK', 900);
define('HEIGHT_TO_LINK', 900);

//Атрибуты которые будут присвоены ссылке (для скриптов типа lightbox)
define('CLASS_LINK', 'lightview');
define('REL_LINK', 'lightbox');

?>
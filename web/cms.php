<?php


require_once(dirname(__FILE__).'/../config/ProjectConfiguration.class.php');

$configuration = ProjectConfiguration::getApplicationConfiguration('cms', 'prod', false);
sfContext::createInstance($configuration, null, 'myContext')->dispatch();

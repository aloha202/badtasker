<?php

define('_PROJECT_HASH', '%PROJECT_HASH%');

date_default_timezone_set('Europe/Minsk');
mb_internal_encoding('UTF-8');

require_once dirname(__FILE__) . '/symfony.php';
sfCoreAutoload::register();

class ProjectConfiguration extends sfProjectConfiguration {

    public function setup() {
        
        $this->enablePlugins('sfDoctrinePlugin');
        $this->enablePlugins('sfDoctrineGuardPlugin');
        $this->enablePlugins('sfJQueryUIPlugin');

        $this->enablePlugins('sfDoctrineChoiceChainPlugin');

        $this->enablePlugins('sfCaptchaGDPlugin');
        $this->enablePlugins('sfFormExtraPlugin');
        $this->enablePlugins('sfJqueryReloadedPlugin');
//        $this->enablePlugins('sfAdminDashPlugin');
        $this->enablePlugins('sfJqueryUploadifyPlugin');
        $this->enablePlugins('sfThumbnailPlugin');

        $this->dispatcher->connect('application.throw_exception', array('MyErrorHandler', 'handleException'));
        
    }

}

<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of sfCmsDeleteAdminTask
 *
 * @author Алекс
 */
class sfCmsDeleteAdminTask extends sfBaseTask {

    protected function configure() {

        $this->addArguments(array(
            new sfCommandArgument('application', sfCommandArgument::REQUIRED, 'The application name'),
            new sfCommandArgument('module', sfCommandArgument::REQUIRED, 'The module name'),
        ));
        $this->namespace = 'cms';
        $this->name = 'delete-admin';
    }

    protected function execute($arguments = array(), $options = array()) {
        $databaseManager = new sfDatabaseManager($this->configuration);
        
        $app = $arguments['application'];
        $mod = $arguments['module'];
        $app_dir = sfConfig::get('sf_apps_dir') . '/' . $app;
        
        $security_file = $app_dir . '/config/security.yml';
        $security = sfYaml::load($security_file);
        $security['default']['credentials'][0] = array_diff($security['default']['credentials'][0], array($mod));
        file_put_contents($security_file, sfYaml::dump($security));
        $this->logSection('cms', 'Credential removed from application security file');
        
        $routing_file = $app_dir . '/config/routing.yml';
        $routing = sfYaml::load($routing_file);
        if(isset($routing[$mod])){
            unset($routing[$mod]);
        }
        file_put_contents($routing_file, sfYaml::dump($routing));
        $this->logSection('cms', 'Route deleted');
        
        ProjectHelper::recursive_remove_directory($app_dir . '/modules/' . $mod);
        $this->logSection('cms', 'Module directory unlinked');
        
        $permission = Doctrine::getTable('sfGuardPermission')
                ->findOneByName($mod);
        if($permission){
            $permission->delete();
            $this->logSection('cms', 'Permission deleted');
        }
    }

}

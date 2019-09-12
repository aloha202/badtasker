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
class sfCmsDeleteModuleTask extends sfBaseTask {

    protected function configure() {

        $this->addArguments(array(
            new sfCommandArgument('application', sfCommandArgument::REQUIRED, 'The application name'),
            new sfCommandArgument('module', sfCommandArgument::REQUIRED, 'The module name'),
        ));
        $this->namespace = 'cms';
        $this->name = 'delete-module';
    }

    protected function execute($arguments = array(), $options = array()) {
        $databaseManager = new sfDatabaseManager($this->configuration);
        
        $app = $arguments['application'];
        $mod = $arguments['module'];
        $app_dir = sfConfig::get('sf_apps_dir') . '/' . $app;
        
        $routing_file = $app_dir . '/config/routing.yml';
        $routing = sfYaml::load($routing_file);
        if(isset($routing[$mod. '_show'] )){
            unset($routing[$mod. '_show']);
            $this->logSection('cms', 'Module show route deleted');            
        }
        file_put_contents($routing_file, sfYaml::dump($routing));
        
        ProjectHelper::recursive_remove_directory($app_dir . '/modules/' . $mod);
        $this->logSection('cms', 'Module directory unlinked');
        
        $page = Doctrine::getTable('Page')
                ->findOneBySpecialMark($mod);
        if($page){
            $page->delete();
            $this->logSection('cms', 'Frontend module page deleted');
        }
        
        $cms_module = Doctrine::getTable('CmsModule')
                ->findOneByName($mod);
        if($cms_module){
            $cms_module->delete();
            $this->logSection('cms', 'Module deleted from CMS registry');            
        }
    }

}

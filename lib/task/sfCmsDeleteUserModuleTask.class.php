<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of sfCmsGenerateModuleTask
 *
 * @author Алекс
 */
class sfCmsDeleteUserModuleTask extends sfBaseTask{
    
  protected function configure()
  {
    $this->addArguments(array(
      new sfCommandArgument('application', sfCommandArgument::REQUIRED, 'The application name'),
      new sfCommandArgument('module', sfCommandArgument::REQUIRED, 'The module name')
    ));

    $this->namespace = 'cms';
    $this->name = 'delete-user-module';
    $this->briefDescription = '';

    $this->detailedDescription = <<<EOF
EOF;
  }
    
    
    protected function execute($arguments = array(), $options = array())
    {
        $databaseManager = new sfDatabaseManager($this->configuration);
        
        $app = $arguments['application'];
        $module = $arguments['module'];  
        $app_dir = sfConfig::get('sf_apps_dir') . '/' . $app;
        
        $mod_dir = $app_dir . '/modules/' . $module;
        ProjectHelper::recursive_remove_directory($mod_dir);        
        $this->logSection('cms', "Directory removed: " . $mod_dir);          
        
        $pages = array('index', 'my', 'user', 'new', 'edit');
        foreach($pages as  $p){
            Q::c('Page', 'p')
                ->where('p.special_mark = ?', $module . '_' . $p)
                ->delete()
                ->execute()
                ;
        }
        $this->logSection('cms', "Deleted pages: " . join(',', $pages));        

        $routing_file = $app_dir . '/config/routing.yml';
        $routing = sfYaml::load($routing_file);        
        $routes = array(
           'show',
            'edit',
            'update',
            'delete',
            'user'
        );
        foreach($routes as $route){
            if(isset($routing[$module. '_' . $route] )){
                unset($routing[$module. '_' . $route]);
            }
        }
        file_put_contents($routing_file, sfYaml::dump($routing));                    
        $this->logSection('cms', "Deleted routes: " . join(',', $routes));
        
        
        Q::c('CmsModule', 'm')
                ->where('m.name = ?', 'book')
                ->delete()
                ->execute()
                ;
        $this->logSection('cms', "Module $module unregisterred with cms");        
            
    }

    
}

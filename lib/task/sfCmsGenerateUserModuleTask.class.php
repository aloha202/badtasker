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
class sfCmsGenerateUserModuleTask extends sfDoctrineGenerateModuleTask{
    
  protected function configure()
  {
    $this->addArguments(array(
      new sfCommandArgument('application', sfCommandArgument::REQUIRED, 'The application name'),
      new sfCommandArgument('module', sfCommandArgument::REQUIRED, 'The module name'),
      new sfCommandArgument('model', sfCommandArgument::REQUIRED, 'The model class name'),
    ));

    $this->addOptions(array(
      new sfCommandOption('theme', null, sfCommandOption::PARAMETER_REQUIRED, 'The theme name', 'my_user'),
      new sfCommandOption('with-show', null, sfCommandOption::PARAMETER_REQUIRED, 'Generate a show method', true),
      new sfCommandOption('env', null, sfCommandOption::PARAMETER_REQUIRED, 'The environment', 'dev'),
      new sfCommandOption('generate-in-cache', null, sfCommandOption::PARAMETER_NONE, 'Generate the module in cache'),
      new sfCommandOption('non-verbose-templates', null, sfCommandOption::PARAMETER_NONE, 'Generate non verbose templates'),        
      new sfCommandOption('singular', null, sfCommandOption::PARAMETER_REQUIRED, 'The singular name', null),
      new sfCommandOption('plural', null, sfCommandOption::PARAMETER_REQUIRED, 'The plural name', null),
      new sfCommandOption('route-prefix', null, sfCommandOption::PARAMETER_REQUIRED, 'The route prefix', null),
      new sfCommandOption('with-doctrine-route', null, sfCommandOption::PARAMETER_NONE, 'Whether you will use a Doctrine route'),
      new sfCommandOption('actions-base-class', null, sfCommandOption::PARAMETER_REQUIRED, 'The base class for the actions', 'sfActions'),        
    ));

    $this->namespace = 'cms';
    $this->name = 'generate-user-module';
    $this->briefDescription = 'Generates a frontend user module';

    $this->detailedDescription = <<<EOF
EOF;
  }
    
    
    protected function execute($arguments = array(), $options = array())
    {
        parent::execute($arguments, $options);
        $databaseManager = new sfDatabaseManager($this->configuration);
        
        $app = $arguments['application'];
        $model = $arguments['model'];
        $module = $arguments['module'];        
        
        //registering new module with cms
        $mod = new CmsModule();
        $mod->fromArray(array(
            'name' => $module,
            'is_active' => true,
            'model' => $model
        ));
        try{
            $mod->save();
            $this->logSection('cms', 'Module registered with CMS');
        }catch(Exception $e){
            $this->logSection('cms-error', 'Module already registered with CMS');;
            return;
        }
        
        $pages = array('index' => array(
            'title' => $model . 's',
            'mark' => $module . '_index'
        ), 'listMy' => array(
            'title' => 'My ' . $model . 's',
            'mark' => $module . '_my'
        ), 'listUser' => array(
            'title' => '{%name%}\'s ' . $model . 's',
            'mark' => $module . '_user'
        ), 'new' => array(
            'title' => 'New ' . $model,
            'mark' => $module . '_new'
        ), 'edit' => array(
            'title' => 'Edit ' . $model . ' {%name%}',
            'mark' => $module . '_edit'
        ));
        foreach($pages as $key => $p){
            $page = new Page;
            $page->fromArray(array(
                'is_module_page' => true,
                'module_name' => $module,
                'special_mark' => $p['mark'],            
                'name' => $p['title'],            
                'is_content_editable' => false
            ));
            $page->save();
            $this->logSection('cms', "$module/$key page created");     
        }

        //creating route
        $routes = array(
           'show' => array('get', $model),
            'edit' => array('get', $model),
            'update' => array('post', $model),
            'delete' => array('post', $model),
            'user' => array('get', 'sfGuardUser', 'listUser')
        );

        foreach($routes as $name => $options){
            $route = $this->createRoute($module, $name, $options);
            $routing_file = sfConfig::get('sf_apps_dir') . "/$app/config/routing.yml";
            file_put_contents($routing_file, $route . file_get_contents($routing_file));
            $this->logSection('cms', "Route $name created");                    
        }
            
    }
    
    
    protected function createRoute($module, $name, $options)
    {
            $route_name = $module . '_' . $name;
            $action = isset($options[2]) ? $options[2] : $name;
            $model = $options[1]; 
            $method = $options[0];
            $route = <<<EOF
{$route_name}:
  url: /$module/:id/$name
  param: {module: $module, action: $action}
  class: sfDoctrineRoute
  options: {type: object, model: $model}
  requirements:
    id: \d+
    sf_method: $method

EOF;
        return $route;
    }
    
}

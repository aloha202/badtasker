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
class sfCmsGenerateFrontModuleTask extends sfDoctrineGenerateModuleTask{
    
  protected function configure()
  {
    $this->addArguments(array(
      new sfCommandArgument('application', sfCommandArgument::REQUIRED, 'The application name'),
      new sfCommandArgument('module', sfCommandArgument::REQUIRED, 'The module name'),
      new sfCommandArgument('model', sfCommandArgument::REQUIRED, 'The model class name'),
    ));

    $this->addOptions(array(
      new sfCommandOption('create-show-route', null, sfCommandOption::PARAMETER_REQUIRED, 'Creates show route', true),        
      new sfCommandOption('show-route', null, sfCommandOption::PARAMETER_REQUIRED, 'Show route name', ''),        
      new sfCommandOption('theme', null, sfCommandOption::PARAMETER_REQUIRED, 'The theme name', 'my_default'),
      new sfCommandOption('generate-in-cache', null, sfCommandOption::PARAMETER_NONE, 'Generate the module in cache'),
      new sfCommandOption('non-verbose-templates', null, sfCommandOption::PARAMETER_NONE, 'Generate non verbose templates'),
      new sfCommandOption('with-show', null, sfCommandOption::PARAMETER_REQUIRED, 'Generate a show method', true),
      new sfCommandOption('singular', null, sfCommandOption::PARAMETER_REQUIRED, 'The singular name', null),
      new sfCommandOption('plural', null, sfCommandOption::PARAMETER_REQUIRED, 'The plural name', null),
      new sfCommandOption('route-prefix', null, sfCommandOption::PARAMETER_REQUIRED, 'The route prefix', null),
      new sfCommandOption('with-doctrine-route', null, sfCommandOption::PARAMETER_NONE, 'Whether you will use a Doctrine route'),
      new sfCommandOption('env', null, sfCommandOption::PARAMETER_REQUIRED, 'The environment', 'dev'),
      new sfCommandOption('actions-base-class', null, sfCommandOption::PARAMETER_REQUIRED, 'The base class for the actions', 'sfActions'),
    ));

    $this->namespace = 'cms';
    $this->name = 'generate-front-module';
    $this->briefDescription = 'Generates a frontend module';

    $this->detailedDescription = <<<EOF
The [cms:generate-module|INFO] task generates a Doctrine module:

  [./symfony doctrine:generate-module frontend article Article|INFO]

The task creates a [%module%|COMMENT] module in the [%application%|COMMENT] application
for the model class [%model%|COMMENT].

You can also create an empty module that inherits its actions and templates from
a runtime generated module in [%sf_app_cache_dir%/modules/auto%module%|COMMENT] by
using the [--generate-in-cache|COMMENT] option:

  [./symfony doctrine:generate-module --generate-in-cache frontend article Article|INFO]

The generator can use a customized theme by using the [--theme|COMMENT] option:

  [./symfony doctrine:generate-module --theme="custom" frontend article Article|INFO]

This way, you can create your very own module generator with your own conventions.

You can also change the default actions base class (default to sfActions) of
the generated modules:

  [./symfony doctrine:generate-module --actions-base-class="ProjectActions" frontend article Article|INFO]
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
        $page = new Page;
        $page->fromArray(array(
            'is_module_page' => true,
            'module_name' => $module,
            'special_mark' => $module,            
            'name' => sfInflector::humanize($module),            
            'is_content_editable' => false
        ));
        $page->save();
        $this->logSection('cms', 'Module index page created');     
        
        $page = new Page;
        $page->fromArray(array(
            'is_module_page' => true,
            'module_name' => $module,
            'special_mark' => $module . '_show',            
            'name' => sfInflector::humanize($module . '_show'),            
            'is_content_editable' => false
        ));
        $page->save();        

        $this->logSection('cms', 'Module show page created');     
        //creating route
        if($options['create-show-route']){

            $route_name = $options['show-route'] ? $options['show-route'] : $this->generate_show_route_name($module);
            $route = <<<EOF
{$route_name}:
  url: /$module/:id/show
  param: {module: $module, action: show}
  class: sfDoctrineRoute
  options: {type: object, model: $model}


EOF;
            $routing_file = sfConfig::get('sf_apps_dir') . "/$app/config/routing.yml";
            file_put_contents($routing_file, $route . file_get_contents($routing_file));
            $this->logSection('cms', "Route $route_name created");
            
            $mod->setShowRoute($route_name);
            $mod->save();
        }
    }
    
    protected function generate_show_route_name($module_name)
    {
        return $module_name . '_show';
    }
    
}

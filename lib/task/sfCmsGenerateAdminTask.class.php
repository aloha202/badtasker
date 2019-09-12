<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of sfCmsGenerateAdminTask
 *
 * @author Алекс
 */
class sfCmsGenerateAdminTask extends sfDoctrineGenerateAdminTask{
    
  protected function configure()
  {
    $this->addArguments(array(
      new sfCommandArgument('application', sfCommandArgument::REQUIRED, 'The application name'),
      new sfCommandArgument('route_or_model', sfCommandArgument::REQUIRED, 'The route name or the model class'),
    ));

    $this->addOptions(array(
      new sfCommandOption('module', null, sfCommandOption::PARAMETER_REQUIRED, 'The module name', null),
      new sfCommandOption('theme', null, sfCommandOption::PARAMETER_REQUIRED, 'The theme name', 'my_admin'),####diff####
      new sfCommandOption('singular', null, sfCommandOption::PARAMETER_REQUIRED, 'The singular name', null),
      new sfCommandOption('plural', null, sfCommandOption::PARAMETER_REQUIRED, 'The plural name', null),
      new sfCommandOption('env', null, sfCommandOption::PARAMETER_REQUIRED, 'The environment', 'dev'),
      new sfCommandOption('actions-base-class', null, sfCommandOption::PARAMETER_REQUIRED, 'The base class for the actions', 'sfActions'),
    ));

    $this->namespace = 'cms';######diff#######
    $this->name = 'generate-admin';
    $this->briefDescription = 'Generates a Doctrine admin module';

    $this->detailedDescription = <<<EOF
The [doctrine:generate-admin|INFO] task generates a Doctrine admin module:

  [./symfony doctrine:generate-admin frontend Article|INFO]

The task creates a module in the [%frontend%|COMMENT] application for the
[%Article%|COMMENT] model.

The task creates a route for you in the application [routing.yml|COMMENT].

You can also generate a Doctrine admin module by passing a route name:

  [./symfony doctrine:generate-admin frontend article|INFO]

The task creates a module in the [%frontend%|COMMENT] application for the
[%article%|COMMENT] route definition found in [routing.yml|COMMENT].

For the filters and batch actions to work properly, you need to add
the [with_wildcard_routes|COMMENT] option to the route:

  article:
    class: sfDoctrineRouteCollection
    options:
      model:                Article
      with_wildcard_routes: true
EOF;
  }
  
  protected function execute($arguments = array(), $options = array())
  {
      $app_dir = sfConfig::get('sf_apps_dir') . '/' . $arguments['application'];
      
      $module = empty($options['module']) ? sfInflector::underscore($arguments['route_or_model']) : $options['module'];
      $module_dir = $app_dir . '/modules/' . $module;
      if(file_exists($module_dir)){
          $this->logSection('cms', "Module $module already exists");
          die;
      }
      
      parent::execute($arguments, $options);
      
      
      $file =  $module_dir . '/config/security.yml';
      $yml = sfYaml::load($file);
      $yml['all']['credentials'] = $module;
      file_put_contents($file, sfYaml::dump($yml));
      $yml = sfYaml::load($app_dir . '/config/security.yml');
      if(is_array($yml['default']['credentials'])){
          $yml['default']['credentials'][0][] = $module;
      }else{
          $yml['default']['credentials'] = array(array('superadmin', $module));
      }
      file_put_contents($app_dir . '/config/security.yml', sfYaml::dump($yml));      
      $this->logSection('cms', "Added credential $module to application and module security.yml files");
      
      $permission = new sfGuardPermission();
      $permission->fromArray(array(
         'name' => $module,
          'description' => sfInflector::humanize($module . ' management')
      ));
      $permission->save();
      $this->logSection('cms', "Permission $module created");
      
      
  }
    
}

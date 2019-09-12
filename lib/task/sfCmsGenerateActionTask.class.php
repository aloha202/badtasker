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
class sfCmsGenerateActionTask extends sfBaseTask{
    
  protected function configure()
  {
    $this->addArguments(array(
      new sfCommandArgument('application', sfCommandArgument::REQUIRED, 'The application name'),
      new sfCommandArgument('module', sfCommandArgument::REQUIRED, 'The module name'),
      new sfCommandArgument('action', sfCommandArgument::REQUIRED, 'The action name'),
    ));

    $this->addOptions(array(
      new sfCommandOption('create-page', null, sfCommandOption::PARAMETER_REQUIRED, 'Creates page also', true),        

    ));

    $this->namespace = 'cms';
    $this->name = 'generate-action';
    $this->briefDescription = 'Generates a frontend module action';

    $this->detailedDescription = <<<EOF
bla-bla-bla
EOF;
  }
    
    
    protected function execute($arguments = array(), $options = array())
    {
        $databaseManager = new sfDatabaseManager($this->configuration);
        
        $app = $arguments['application'];
        $action_raw = $arguments['action'];
        $action = sfInflector::camelize($action_raw);
        $module = $arguments['module'];        
        
        $mark = '/* --- ACTIONS --- */';
        $page_name = sfInflector::underscore($module) . '_' . sfInflector::underscore($action);
        //adding code to actions.class.php
        $dir = sfConfig::get('sf_apps_dir') . "/$app/modules/$module";
        $path = "$dir/actions/actions.class.php";
        
        $all_code = file_get_contents($path);
        if(strpos($all_code, $mark) === false){
            $this->logSection("cms", "Can not create action. Action class file is corrupt");
            return;
        }
        ob_flush();
        ob_start();
        require_once(sfConfig::get('sf_data_dir') . '/generator/action.template');
        $action_code = ob_get_contents();
        ob_clean();
        $action_code .= "\n\n";
        $action_code .= $mark;
        $all_code = str_replace($mark, $action_code, $all_code);
        
        file_put_contents($path, $all_code);        
        $this->logSection("cms", "Action created");
        
        $template_code = file_get_contents(sfConfig::get('sf_data_dir') . '/generator/template.template');
        $template_code = str_replace("[?php", "<?php", $template_code);
        $template_code = str_replace("?]", "?>", $template_code);
        file_put_contents("$dir/templates/{$action_raw}Success.php", $template_code);
        $this->logSection("cms", "Template created");
        
        $page = new Page;
        $special_mark = sfInflector::underscore($module) . '_' . sfInflector::underscore($action);
        $page->fromArray(array(
            'name' => sfInflector::humanize($special_mark),
            'slug' => $special_mark,
            'special_mark' => $special_mark,
            'meta_title' => sfInflector::humanize($special_mark)
        ));
        $page->save();
        $this->logSection("cms", "Page created");        
    }
    
}

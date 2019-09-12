<?php

class sfCmsRegisterModuleTask extends sfBaseTask {

    protected
    $outputBuffer = '',
    $errorBuffer = '';

    /**
     * @see sfTask
     */
    protected function configure() {
        $this->addArguments(array(
            new sfCommandArgument('module', sfCommandArgument::REQUIRED)
        ));
        $this->namespace = 'cms';
        $this->name = 'register-module';
        $this->addOptions(array(
            new sfCommandOption('model', null, sfCommandOption::PARAMETER_OPTIONAL, 'module model', null),            
            new sfCommandOption('active', null, sfCommandOption::PARAMETER_OPTIONAL, 'set active', true),
            new sfCommandOption('content_editable', null, sfCommandOption::PARAMETER_OPTIONAL, 'is editable content', false),            
        ));

        /*
          $this->addOptions(array(
          new sfCommandOption('go', null, sfCommandOption::PARAMETER_NONE, 'Do the deployment'),
          new sfCommandOption('rsync-dir', null, sfCommandOption::PARAMETER_REQUIRED, 'The directory where to look for rsync*.txt files', 'config'),
          new sfCommandOption('rsync-options', null, sfCommandOption::PARAMETER_OPTIONAL, 'To options to pass to the rsync executable', '-azC --force --delete --progress'),
          ));
         * 
         */
    }

    /**
     * @see sfTask
     */
    protected function execute($arguments = array(), $options = array()) {
        $databaseManager = new sfDatabaseManager($this->configuration);
        
        $module = $arguments['model'];

        $mod = new CmsModule();
        $mod->fromArray(array(
            'name' => $module,
            'is_active' => $options['active'],
            'model' => $options['model']
        ));
        try{
            $mod->save();
        }catch(Exception $e){
            echo "Module $module already registerred";
            return;
        }
        $page = new Page;
        $page->fromArray(array(
            'is_module_page' => true,
            'module_name' => $module,
            'name' => $module,            
            'is_content_editable' => $options['content_editable']
        ));
        $page->save();

        echo "Module $module registerred successfully";
    }

}

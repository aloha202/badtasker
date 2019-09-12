<?php

class sfCmsPopulateTask extends sfBaseTask {

    protected
    $outputBuffer = '',
    $errorBuffer = '';

    /**
     * @see sfTask
     */
    protected function configure() {
        $this->addArguments(array(
            new sfCommandArgument('model', sfCommandArgument::REQUIRED),
            new sfCommandArgument('count', sfCommandArgument::OPTIONAL, '', 10)            
        ));
        $this->namespace = 'cms';
        $this->name = 'populate';
        $this->addOptions(array(
            //new sfCommandOption('model', null, sfCommandOption::PARAMETER_REQUIRED),            
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
        
        $model = $arguments['model'];

        $class = 'sfPopulate' . $model;
        if(class_exists($class)){
            $Populator = new $class;
            $Populator->execute($arguments['count']);
            echo "Model $model populated successfully";
        }else{
            echo "Model $model populator class not found";
        }
        
    }

}

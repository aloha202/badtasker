<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of sfCmsClearData
 *
 * @author Алекс
 */
class sfCmsUpdateUrlTask extends sfBaseTask{
     protected function configure() {

        $this->addArguments(array(
            new sfCommandArgument('model', sfCommandArgument::REQUIRED, 'Model name'),
        ));
        $this->namespace = 'cms';
        $this->name = 'update-url';
    }

    protected function execute($arguments = array(), $options = array()) {
        $databaseManager = new sfDatabaseManager($this->configuration);
        
        $model = $arguments['model'];
        foreach(Doctrine::getTable($model)->createQuery('m')->execute() as $item){
            $item->setUrl(ProjectHelper::rus_to_slugify($item->getName()));
            $item->save();
        }
        $this->logSection('cms', "Urls updated for model $model");        
    }
}

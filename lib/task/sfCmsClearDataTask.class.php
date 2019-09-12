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
class sfCmsClearDataTask extends sfBaseTask{
    
     protected function configure() {

        $this->addArguments(array(
            new sfCommandArgument('section', sfCommandArgument::REQUIRED, 'Data section name'),
            new sfCommandArgument('field', sfCommandArgument::OPTIONAL, 'Data field name'),            
        ));
        $this->namespace = 'cms';
        $this->name = 'clear-data';
    }

    protected function execute($arguments = array(), $options = array()) {
        $databaseManager = new sfDatabaseManager($this->configuration);
        
        $yml = sfYaml::load(sfConfig::get('sf_data_dir') . '/fixtures/data.yml');
        if(isset($yml[$arguments['section']])){
            if(empty($arguments['field'])){
                unset($yml[$arguments['section']]);
                file_put_contents(sfConfig::get('sf_data_dir') . '/fixtures/data.yml', sfYaml::dump($yml));
                $this->logSection('cms', "Data {$arguments['section']} cleared");
            }else{
                foreach($yml[$arguments['section']] as $name => &$section){
                        unset($section[$arguments['field']]);
                        $yml[$arguments['section']][$name] = $section;
                    print_r($section);
                }
                file_put_contents(sfConfig::get('sf_data_dir') . '/fixtures/data.yml', sfYaml::dump($yml));
                $this->logSection('cms', "Data {$arguments['section']} {$arguments['field']} cleared");                
            }
        }
    }
}

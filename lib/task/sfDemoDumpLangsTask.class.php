<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of sfDbDumpTask
 *
 * @author Алекс
 */
class sfDemoDumpLangsTask extends sfBaseTask{
     protected function configure() {

        $this->addArguments(array(
            #new sfCommandArgument('section', sfCommandArgument::REQUIRED, 'Data section name'),
        ));
        $this->namespace = 'demo';
        $this->name = 'dump-langs';
    }
    
    protected function execute($arguments = array(), $options = array()) {
        $databaseManager = new sfDatabaseManager($this->configuration);

        $yml = sfYaml::load(sfConfig::get('sf_config_dir') . '/app.yml');
        $langs = $yml['all']['langs']['all'];
        foreach($langs as $key=>$lang){
            $this->logSection("$key", "Processing");
            echo shell_exec("php symfony localization:load $key");
            echo shell_exec("php symfony db:dump --path=data/langs/{$key}.sql --with-create=1 --tables=page,text_block,menu_item,email_template");
            
        }
        
    }    
}

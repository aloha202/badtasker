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
class sfLocalizationLoadTask extends sfBaseTask{
     protected function configure() {

        $this->addArguments(array(
            new sfCommandArgument('lang', sfCommandArgument::REQUIRED, 'Language'),
        ));
        $this->namespace = 'localization';
        $this->name = 'load';
    }

    protected function execute($arguments = array(), $options = array()) {
        set_time_limit(false);
        $databaseManager = new sfDatabaseManager($this->configuration);
        
        MyConfig::set('project_lang', $arguments['lang']);
        
        $config = sfYaml::load(sfConfig::get('sf_config_dir'). '/localization.yml');

        $locs = Q::c('Localization', 'l')
                ->execute();
        
        $result = array(
            'error' => array(),
            'ok' => array(),
            'warning' => array()
        );
        foreach($locs as $loc){
			try{
	            $res = $loc->loadValue($arguments['lang']);
		        $result[$res][] = $loc->getId();
			}catch(Exception $e){
				echo $e;
			}
        }
        
        $ok_count = count($result['ok']);
        $error_count = count($result['error']);
        $warning_count = count($result['warning']);        
        
        $this->logSection('localization', "Loaded: $ok_count, warninngs: $warning_count, errors: $error_count");
        if($error_count){
            $this->logSection('localization', "Errors: " . join(', ', $result['error']));
        }
        if($warning_count){
            $this->logSection('localization', "Warnings: " . join(', ', $result['warning']));
        }        
        
    }
}

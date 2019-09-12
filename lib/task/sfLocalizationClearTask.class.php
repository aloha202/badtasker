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
class sfLocalizationClearTask extends sfBaseTask{
     protected function configure() {

        $this->addArguments(array(
            new sfCommandArgument('lang', sfCommandArgument::OPTIONAL, 'Language', 'ru'),
        ));
        $this->namespace = 'localization';
        $this->name = 'clear';
    }

    protected function execute($arguments = array(), $options = array()) {
        set_time_limit(false);
        $databaseManager = new sfDatabaseManager($this->configuration);
        
        $config = sfYaml::load(sfConfig::get('sf_config_dir'). '/localization.yml');
        
        $q = Q::c('Localization', 'l');
        $count = $q->count();
                $q->update()
                ->set($arguments['lang'], 'NULL')
                ->execute();
        $this->logSection('localization', "cleared {$count} {$arguments['lang']}");
        
    }
}

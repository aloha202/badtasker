<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of sfCmsTestTask
 *
 * @author Алекс
 */
class sfCmsTestTask extends sfBaseTask{
    protected function configure() {
        $this->namespace = 'cms';
        $this->name = 'test';        
    }
    
    protected function execute($arguments = array(), $options = array()) {
        $databaseManager = new sfDatabaseManager($this->configuration);
        $file = sfConfig::get('sf_apps_dir') . '/cms/modules/category/config/security.yml';
        $yml = sfYaml::load($file);
        
        $yml['all']['credentials'] = array(array('superadmin', 'category'));
        $str = sfYaml::dump($yml);
        $f = fopen($file, 'w+');
        fwrite($f, $str);
        fclose();
        
        print_r($yml);
        //echo 'This is a test';
    }
}

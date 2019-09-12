<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of myYaml
 *
 * @author Алекс
 */
class myYaml {
    
    public static function remove($file, $entry)
    {
        if(!class_exists('Spyc'))
            require_once sfConfig::get('sf_lib_dir') . '/vendor/vendor/spyc-0.5/spyc.php';
        
        $yaml = sfYaml::load($file);
        if(!is_array($entry)){
            $entry = array($entry);
        }
        $source = &$yaml;
        $val = array_shift($entry);
        while(count($entry)){
            $source = &$source[$value];
            $val = array_shift($entry);
        }
        if(isset($source[$val]))
            unset($source[$val]);
        file_put_contents($file, Spyc::YAMLDump($yaml, 2, 60));
    }
    
    public static function set($file, $entry, $value)
    {
        if(!class_exists('Spyc'))
            require_once sfConfig::get('sf_lib_dir') . '/vendor/vendor/spyc-0.5/spyc.php';
        
        $yaml = sfYaml::load($file);
        if(!is_array($entry)){
            $entry = array($entry);
        }
        $source = &$yaml;
        $val = array_shift($entry);
        while(count($entry)){
            if(!isset($source[$val])){
                $source[$val] = array();
            }
            $source = &$source[$val];
            $value = array_shift($entry);
        }
        $source[$val] = $value;
        file_put_contents($file, Spyc::YAMLDump($yaml, 2, 60));        
    }
    
}

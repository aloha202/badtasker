<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of myCache
 *
 * @author Alaxa
 */
class myCache {
    
    public static function getYaml($path_to_file)
    {
        $cached_file = sfConfig::get('sf_cache_dir') . '/' . md5($path_to_file) . '.php';
        if(!file_exists($cached_file)){
            file_put_contents($cached_file, "<?php return " . P::asPhp(sfYaml::load($path_to_file)) . "; ?>");
        }
        return include $cached_file;
        
    }
    
}
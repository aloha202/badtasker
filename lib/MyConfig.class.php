<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of MyConfig
 *
 * @author Алекс
 */
class MyConfig {
    public static $values = null;
    public static function get($key, $default = null, $replacements = array())
    {
        
       if(strpos($key, 'block_') === 0){
           $text_block = Doctrine::getTable('TextBlock')
                   ->createQuery('t')
                   ->where('t.name = ?', preg_replace('/^block_/', '', $key))
                   ->fetchOne()
                   ;
           if($text_block){
               return $text_block->getContent();
           }
           return '';
       }else{
           if(is_null(self::$values)){
               $q = Doctrine::getTable('Config')
                       ->createQuery('c INDEXBY c.name')
                       ->select('c.name, c.value')
                       ->setHydrationMode(Doctrine::HYDRATE_ARRAY);
               self::$values = $q->execute();

           }
           if(sfConfig::get('sf_environment') == 'dev')
           {
               if(!isset(self::$values[$key])){
                //  self::addByKey($key);
               }
           }
           $value = (string)(isset(self::$values[$key]) ? self::$values[$key]['value'] : $default);
           return strtr($value, $replacements);
       }
    }
    
    public static function getAttach($name)
    {
        $q = Q::c('ConfigAttach', 'a')
                ->where('a.name = ?', $name);
        $a = $q->fetchOne();
        if($a){
            return $a;
        }
        return '';
    }
    
    
    public static function addByKey($key)
    {
        $config = new Config();
        $config->fromArray(array(
                'name' => $key,
                'title' => sfInflector::humanize($key),
                'value' => '',
                'section' => 'dictionary'
        ));
        $config->save();
    }
    
    public static function isTrue($name)
    {
        return self::getBoolean($name);
    }
    
    public static function getInteger($name)
    {
        return intval(trim(self::get($name)));
    }
    
    public static function getBoolean($name)
    {
        $val = trim(self::get($name, ''));
        return in_array($val, array('1', 'on', 'yes', 'true', 'absolutely so'));;
    }    
    
    public static function __($default_value, $replacements = array())
    {
        $hash = md5($default_value);
        $value = self::get($hash);
        if($value){
            if($replacements){
                $value = strtr($value, $replacements);
            }            
            return $value;
        }
        $config = new Config();
        $config->fromArray(array(
                'name' => $hash,
                'title' => '',
                'value' => $default_value,
                'section' => 'hash'
        ));
        $config->save();        
        self::$values[$hash] = $config;
        $val = $config->getValue();
        if($replacements){
            $val = strtr($val, $replacements);
        }
        return $val;
    } 
    
    public static function set($key, $value)
    {
        $q = Q::c('Config', 'c')
                ->where('c.name = ?', $key);
        $conf = $q->fetchOne();
        $conf->setValue($value);
        $conf->save();
    }
    
}

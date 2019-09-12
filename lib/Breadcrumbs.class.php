<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of Breadcrumbs
 *
 * @author Алекс
 */
class Breadcrumbs {
    
    protected static $items = array(
      array('Главная', '@homepage')  
    );
    
    public static function add($item)
    {
        if(!is_array($item)){
            $item = array($item);
        }
        self::$items[] = $item;
    }
    
    public static function get()
    {
        return self::$items;
    }
    
}

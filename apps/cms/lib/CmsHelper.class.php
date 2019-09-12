<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of CmsHelper
 *
 * @author Алекс
 */
class CmsHelper {
    
    public static function isMenuActive($item)
    {
        
        return empty($item[2]) ? false : ProjectHelper::isModActive($item[2]);
    }
    
}

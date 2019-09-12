<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of ProductAttachmentValidatorSchema
 *
 * @author Алекс
 */
class ProductImageValidatorSchema extends sfValidatorSchema{

    
    protected function configure($options = array(), $messages = array())
    {
    }
    
    protected function doClean($values)
    {
        
     
        foreach($values as $key => $value){
            
            
            if(!$value['image']){
               
               unset($values[$key]);
            }
            
        }
        return $values;
    }    
    
}

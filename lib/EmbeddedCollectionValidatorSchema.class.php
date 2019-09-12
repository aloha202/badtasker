<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of EmbeddedCollectionValidatorSchema
 *
 * @author Алекс
 */
class EmbeddedCollectionValidatorSchema extends sfValidatorSchema{
    
    protected function configure($options = array(), $messages = array())
    {
        $this->addOption('required_fields', array());
        parent::configure($options, $messages);
    }
    
    
    protected function doClean($values)
    {

        foreach($values as $key => $value){
            
            foreach($this->getOption('required_fields') as $field){
                if(!$value[$field]){
                    unset($values[$key]);
                    break;
                }
            }
            
        }
        return $values;
    }      
    
}

<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of Doctrine_Template_Meta
 *
 * @author Алекс
 */
class Doctrine_Template_Event extends Doctrine_Template{
   
    protected $_options = array(
        'create' => false,
        'update' => false,
        'delete' => false
    );
    
    public function setTableDefinition()
    {
        
        $this->addListener(new Doctrine_Template_Event_Listener($this->_options));        
    }    
    
    
}

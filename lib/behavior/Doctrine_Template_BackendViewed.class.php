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
class Doctrine_Template_BackendViewed extends Doctrine_Template{
   
    protected $_options = array(
    );
    
    public function setTableDefinition()
    {
        $this->hasColumn('is_backend_viewed', 'boolean', null, array(
             'type' => 'boolean',
             'default' => false,
             ));
        //$this->addListener(new Doctrine_Template_Attach_Listener($this->_options));        
    }
    
}

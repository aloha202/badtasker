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
class Doctrine_Template_Meta extends Doctrine_Template{
   
    protected $_options = array(
        'title_field' => 'name',
        'content_fields' => array('content', 'text'),
        'autofill' => true
    );
    
    public function setTableDefinition()
    {
        $this->hasColumn('meta_title', 'string', 255, array(
             'type' => 'string',
             'length' => 255,
             ));
        $this->hasColumn('meta_description', 'string', 255, array(
             'type' => 'string',
             'length' => 255,
             ));
        $this->hasColumn('meta_keywords', 'string', 255, array(
             'type' => 'string',
             'length' => 255,
             ));
        
        $this->addListener(new Doctrine_Template_Meta_Listener($this->_options));        
    }    
    
}

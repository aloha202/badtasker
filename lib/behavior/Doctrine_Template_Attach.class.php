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
class Doctrine_Template_Attach extends Doctrine_Template{
   
    protected $_options = array(
        'mime_types' => '*'
    );
    
    public function setTableDefinition()
    {
        $this->hasColumn('attach', 'string', 255, array(
             'type' => 'string',
             'length' => 255,
             ));
        $this->hasColumn('attach_name', 'string', 255, array(
             'type' => 'string',
             'length' => 255,
             ));
        $this->hasColumn('attach_mime', 'string', 255, array(
             'type' => 'string',
             'length' => 255,
             ));
        
        $this->addListener(new Doctrine_Template_Attach_Listener($this->_options));        
    }    
    
    public function sendAttach()
    {
        $object = $this->getInvoker();
        header("Content-Type: " . $object->getAttachMime());
        header("Content-Disposition: attachment; filename=\"" . $object->getAttachName() . "\"");
        readfile(sfConfig::get('sf_web_dir') . '/uploads/' . sfInflector::underscore(get_class($object)) . '/' . $object->getAttach());        
    }    
    
}

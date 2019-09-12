<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of Doctrine_Template_Meta_Listener
 *
 * @author Алекс
 */
class Doctrine_Template_Meta_Listener extends Doctrine_Record_Listener {

    protected $_options = array();

    public function __construct(array $options) {
        $this->_options = $options;
    }

    public function preSave(Doctrine_Event $event) {
        $object = $event->getInvoker();
        
        if($this->_options['autofill']){
            if(!$object->getMetaTitle()){
                $title = $this->_options['title_field'];
                $object->setMetaTitle($object->$title);
            }
        }
    }

}

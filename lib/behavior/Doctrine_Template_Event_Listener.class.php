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
class Doctrine_Template_Event_Listener extends Doctrine_Record_Listener {

    protected $_options = array();

    public function __construct(array $options) {
        $this->_options = $options;
    }
    
    public function postUpdate(Doctrine_Event $event)
    { 
        if(!empty($this->_options['update'])){
            $event_name = $this->getEventName($this->_options['update']);
            if($event_name){
                SiteEvent::fire($event_name, $event->getInvoker());
            }
        }
    }
    
    public function postInsert(Doctrine_Event $event)
    { 
        if(!empty($this->_options['create'])){
            $event_name = $this->getEventName($this->_options['create']);
            if($event_name){
                SiteEvent::fire($event_name, $event->getInvoker());
            }
        }
    }
    
    public function postDelete(Doctrine_Event $event)
    { 
        $app = sfContext::getInstance()->getConfiguration()->getApplication();
        if(!empty($this->_options['delete'])){
            $event_name = $this->getEventName($this->_options['delete']);
            if($event_name){
                SiteEvent::fire($event_name, $event->getInvoker());
            }           
        }        
    }    
    
    protected function getEventName($event)
    {
        if(is_string($event)){
            return $event;
        }
        if(is_array($event)){
            $app = sfContext::getInstance()->getConfiguration()->getApplication();
            foreach($event as $app_name => $event_name){
                if($app_name == $app){
                    return $event_name;
                }
            }
            if(!empty($event['all'])){
                return $event['all'];
            }            
        }
        return false;
    }
    

}

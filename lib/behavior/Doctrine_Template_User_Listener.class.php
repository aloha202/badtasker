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
class Doctrine_Template_User_Listener extends Doctrine_Record_Listener {

    protected $_options = array();

    public function __construct(array $options) {
        $this->_options = $options;
    }
    public function preSave(Doctrine_Event $event) {
        $object = $event->getInvoker();
     
        $app = sfContext::getInstance()->getConfiguration()->getApplication();
        if(in_array($app,$this->_options['apps'])){
            if(sfContext::getInstance()->getUser()->isAuthenticated()){
                $object->setUserId(sfContext::getInstance()->getUser()->getGuardUser()->getId());
            }
			
			if($this->_options['cookie']){
				$UserCookie = sfContext::getInstance()->getUser()->getUserCookie();
				$object->setUserCookieId($UserCookie->getId());
			}
           
        }
    }    

}

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
class Doctrine_Template_User extends Doctrine_Template{
   
    protected $_options = array(
        'apps' => array('frontend', 'site'),
		'cookie' => true
    );
    
    public function setTableDefinition()
    {
        $this->hasColumn('user_id', 'integer', null, array(
             'type' => 'integer',
             ));      
        $this->hasOne('sfGuardUser as User', array(
             'local' => 'user_id',
             'foreign' => 'id',
             'onDelete' => 'CASCADE'));
		if($this->_options['cookie']){
			$this->hasColumn('user_cookie_id', 'integer', null, array(
				 'type' => 'integer',
				 ));      
			$this->hasOne('UserCookie as UserCookie', array(
				 'local' => 'user_cookie_id',
				 'foreign' => 'id',
				 'onDelete' => 'CASCADE'));			
		}

        
        $this->addListener(new Doctrine_Template_User_Listener($this->_options));        
    }    
    
    public function isMy()
    {
        $object = $this->getInvoker();
        if(sfContext::getInstance()->getUser()->isAuthenticated()){
            return $object->getUserId() == sfContext::getInstance()->getUser()->getGuardUser()->getId();
        }
        return false;
    }
	
	public function isMyCookie(){
		
		if($this->_options['cookie']){
			$object = $this->getInvoker();
			if($UserCookie = sfContext::getInstance()->getUser()->getUserCookie()){
				return $UserCookie->getId() == $object->getUserCookieId();
			}
		}
		return false;
	}
	
	public function getWhoBy() {
		$object = $this->getInvoker();
		if($object->user_id){
			return $object->getUser();
		}
		if($this->_options['cookie']){
			return $object->getUserCookie();
		}
		return null;
	}
    
    
}

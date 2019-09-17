<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of components
 *
 * @author Алекс
 */
class authComponents extends sfComponents{
    
    public function executeForm()
    {
        $this->form = new SigninForm;
    }
    
    public function executeBlock()
    {
        if($this->getUser()->isAuthenticated()){
            $this->username = $this->getUser()->getGuardUser()->getUsername();
            $this->menu = array(
                array('Profile', 'profile/index'),
                array('Signout', 'auth/signout')
            );
        }
    }
    
}

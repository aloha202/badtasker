<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of ProfilePasswordForm
 *
 * @author Алекс
 */
class ProfilePasswordForm extends BasesfGuardUserForm{
    
    public function configure(){
        
        $this->useFields(array(
        ));
        
        $this->widgetSchema['old_password'] = new sfWidgetFormInputPassword;
        
        $this->widgetSchema['new_password'] = new sfWidgetFormInputPassword;

        $this->widgetSchema['new_password_again'] = new sfWidgetFormInputPassword;        
        
    }
    
}
